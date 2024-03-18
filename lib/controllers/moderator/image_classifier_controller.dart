import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:remind_me/constants/json_files/nsfw_detector_labels.dart';
import 'package:remind_me/models/image_classifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ImageClassifierController extends GetxController {
  static ImageClassifierController get instance => Get.find();
  late Interpreter _interpreter;
  late SharedPreferences prefs;
  final List<String> _nsfwLabels = nsfwDetectorLabels;
  late ClassifierModel _model;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    //#1
    final String? pathToNSFWMODEL = prefs.getString("pathToNSFWMODEL");
    //#2
    File interpreterFile = File(pathToNSFWMODEL!);
    _model = await _loadModel(interpreterFile);
  }

  ClassifierCategory predictImage(Image image) {
    // Load the image and convert it to TensorImage for TensorFlow Input
    final inputImage = _preProcessInput(image);

    // Define the output buffer
    final outputBuffer = TensorBuffer.createFixedSize(
      _model.outputShape,
      _model.outputType,
    );

    // Run inference
    _model.interpreter.run(inputImage.buffer, outputBuffer.buffer);

    // Post Process the outputBuffer
    final resultCategories = _postProcessOutput(outputBuffer);
    final topResult = resultCategories.first;
    return topResult;
  }

  Future<ClassifierModel> _loadModel(File interpreterFile) async {
    //#3
    _interpreter = Interpreter.fromFile(interpreterFile);
    //#4
    final inputShape = _interpreter.getInputTensor(0).shape;
    final outputShape = _interpreter.getOutputTensor(0).shape;
    //#5
    final inputType = _interpreter.getInputTensor(0).type;
    final outputType = _interpreter.getOutputTensor(0).type;
    //#6
    return ClassifierModel(
        interpreter: _interpreter,
        inputShape: inputShape,
        outputShape: outputShape,
        inputType: inputType,
        outputType: outputType);
  }

  TensorImage _preProcessInput(Image image) {
    // #1
    final inputTensor = TensorImage(_model.inputType);
    inputTensor.loadImage(image);

    // #2
    final minLength = min(inputTensor.height, inputTensor.width);
    final cropOp = ResizeWithCropOrPadOp(minLength, minLength);

    // #3
    final shapeLength = _model.inputShape[1];
    final resizeOp = ResizeOp(shapeLength, shapeLength, ResizeMethod.BILINEAR);

    // #4
    final normalizeOp = NormalizeOp(127.5, 127.5);

    // #5
    final imageProcessor = ImageProcessorBuilder()
        .add(cropOp)
        .add(resizeOp)
        .add(normalizeOp)
        .build();

    imageProcessor.process(inputTensor);

    // #6
    return inputTensor;
  }

  List<ClassifierCategory> _postProcessOutput(TensorBuffer outputBuffer) {
    // #1
    final probabilityProcessor = TensorProcessorBuilder().build();

    probabilityProcessor.process(outputBuffer);

    // #2
    final labelledResult = TensorLabel.fromList(_nsfwLabels, outputBuffer);

    // #3
    final categoryList = <ClassifierCategory>[];
    labelledResult.getMapWithFloatValue().forEach((key, value) {
      final category = ClassifierCategory(key, value);
      categoryList.add(category);
    });

    // #4
    categoryList.sort((a, b) => (b.score > a.score ? 1 : -1));

    return categoryList;
  }
  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }
}

class ClassifierCategory {
  String label;
  double score;

  ClassifierCategory(this.label, this.score);
}
