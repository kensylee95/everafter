import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/filter_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/models/user_photo_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';

class MatchController extends FullLifeCycleController
    with GetSingleTickerProviderStateMixin, FullLifeCycleMixin {
  MatchController();

  static MatchController get instance => Get.find();
  final AuthRepo _authRepo = Get.put(AuthRepo());
  FilterController filterController = Get.put(FilterController());
  final UserRepo _userRepo = Get.put(UserRepo());
  late User? user;
  UserModel? userData;
  final AppinioSwiperController swiperController = AppinioSwiperController();
  String swipingDirection = "none";
  bool isSwiping = false;
  int indexActive = 0;
  int indexDismissed = 0;
  double tagOpacity = 0.0;
  //used to toggle loading screen
  bool isLoading = false;
  //filtered users from list of userMatches specific to current authenticted users
  //logged in user will see this users during swipe
  List<UserModel?> matchedUsers = [];
  //index of user on screen during swiping
  int activePhotoIndex = 0;
  //animation controller
  late AnimationController _animationController;
  //animation
  late Animation<double> animation;

  //set to false when user runs out of cards to swipe;
  bool isOutOfSwipesCard = false;

  //initial scale of swipe button before drag gesture
  final dragAlignment = 1.0.obs;
  //final Rx<InternetStatus> hasConnection = Rx<InternetStatus>(AuthRepo.instance.hasInternetConnection);
 
  //<------- Variables End -------->

  //<------- onInnit  Function begins -------->
  @override
  void onInit() async {
    super.onInit();
        isLoading =true;
    //<--- Animation Controller Init--->
    const Duration duration = Duration(milliseconds: 400);
    _animationController = AnimationController(vsync: this, duration: duration);
    //<--- Animation Value Init --->
    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    //get authenticated user
    user = _authRepo.firebaseUser;
    //get userdata of authenticated user
    userData = await _userRepo.getUserDetails(user!.email!);
   await initiateAndFindMatches(userData);
       isLoading =false;
    update(["is-loading"]);
  }


  
  //fetch new matches when user exits filter screen
  filterScreenPopAttempt(bool didPop, userModel) async {
    if (didPop == true) {
          isLoading =true;
    update(["is-loading"]);
    await initiateAndFindMatches(userModel!);
        isLoading =false;
    update(["is-loading"]);
    }
  }

  //find matches function
  Future initiateAndFindMatches(userData)async{
      List<UserModel?> filteredModels =
        await filterController.findUserMatches(userData!);
    //add them to our matched list of models
    matchedUsers.assignAll(filteredModels);
    //<--- Initiate the animation on start --->
    _animationController.forward();
  }


//<----- User swiped with buttons ----->
//-----------------------------------------------------------------------
  //swipe right with button
  swipedRight() async {
    await swiperController.swipeLeft();
    swipingDirection = "right";
    update(["swiped"]);
  }

  //swipe up with button
  swipedUp() async {
    await swiperController.swipeUp();
    swipingDirection = "up";
    update(["swiped"]);
  }

  //swipe left with button
  swipedLeft() async {
    await swiperController.swipeRight();
    swipingDirection = "left";
    update(["swiped"]);
  }

//-----------------------------------------------------------------------
  //<----- User swiped with Gestures ----->
  //<---if item swipe starts --->
  onSwipeBegin(int dismissedIndex, int activeIndex, SwiperActivity activity) {
    isSwiping = false;
    //update active index and dismissed index
    indexActive = activeIndex;
    indexDismissed = dismissedIndex;
    //update Like or dislike image opacity with swiper progress
    tagOpacity = 1;
    //trigger update of getBuilder with id:"swiped"
    update(["swiped"]);
  }

  //<--- if item position changes we use the updates we get --->
  itemPositionChanged(SwiperPosition position,
      {required double swipeButtonSize}) {
    //swipe progress when user is swiping
    final swipeProgress = swiperController.swipeProgress!;
    //Axis direction user is swipping
    final AxisDirection direction = swipeProgress.toAxisDirection();
    //direction user is swiping [is "left" if user is swiping left]
    swipingDirection = direction.name;
    //Half size of swipe button
    final halfSwipeButtonSize = (swipeButtonSize / 2);
    //maximum swipe button scale size
    const double maxScaleSize = 1.45;
    //calcule scale value of button when user is swiping
    final swipeDist = swipeProgress.distance;
    final double scaleFactorCalc = swipeDist / halfSwipeButtonSize;
    //if scale button has not reached max scale size
    if (dragAlignment.value < maxScaleSize) {
      //increment and update the dragAlignment scale value observable so that change is reflected in UI during swipe;
      dragAlignment.value += scaleFactorCalc;
    }

    isSwiping = true;

    update(["swiped"]);
  }

  //<---item swipe ended user leaves the screen after or during swipe --->
  onSwipeEnd(int dismissedIndex, int activeIndex, SwiperActivity activity) {
    swipingDirection = "none";
    //user successfully swiped off photo card if this is true
    final isSwipedCompletely = activity.end != Offset.zero;
    //alignment of swipe button
    dragAlignment.value = 1;
    //check if photo has swiped off completely
    if (isSwipedCompletely) {
      //has swipped off successfully
    }
    tagOpacity = 0;
    //update active index
    indexActive = activeIndex;
    //update dismissed index
    indexDismissed = dismissedIndex;
    //
    update(["swiped"]);
  }
//-------------------------------------------------------------------------------------

  //<--- called when swippable card runs out --->
  userIsOutOfCArds() {
    isOutOfSwipesCard = true;
    print(isOutOfSwipesCard);
    update();
  }

  //<--- Go to next image index when user taps the sides of an image --->
  gotoNextPhoto(
      TapUpDetails tapDetails, List<UserPhotoModel> userPhotoList) async {
    //<--- Horizontal value from tap details--->
    final double horizontalValue = tapDetails.globalPosition.dx;
    //<--- Vertical value from tap details --->
    //   final double verticalValue = tapDetails.globalPosition.dy;

    //<------------ check if user tapped left -------->
    if (horizontalValue <= 180) {
      //user tapped left do something here
      //if the active photo is not the first photo
      if (activePhotoIndex != 0) {
        //go back to previous index
        activePhotoIndex--;
        //<--- Animate the index --->
        fadeAnimate();
        //update the UI
        update(["active-index-changed"]);
      }
    }
    //<------------ End user tapped left -------->

    //<------------ Check if user tapped right -------->
    else if (horizontalValue > 180) {
      //user tapped right do something here
      //if the active photo is not the last photo in list
      if (activePhotoIndex < userPhotoList.length - 1) {
        //go back to next photo index
        activePhotoIndex++;
        //<--- Animate it --->
        fadeAnimate();
        //update the UI
        update(["active-index-changed"]);
      }
    }
    //<------------ end of check for right tap -------------->
  }

  fadeAnimate() {
    //<--- reset animation controller --->
    _animationController.reset();
    //<--- Animate it --->
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {}

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() async {}
}
