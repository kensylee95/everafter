import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/user_repo.dart';
import 'package:remind_me/views/auth_widgets/otp/otp_screen.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/missing_username.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_initial.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/custom_scaffold.dart';
import 'package:remind_me/views/core/core_pages/pages/dob_and_gender.dart';
import 'package:remind_me/views/core/core_pages/pages/match_finder.dart';
import 'package:remind_me/views/core/core_pages/pages/new_interests.dart';
import 'package:remind_me/views/core/core_pages/pages/profile_details.dart';
import 'package:remind_me/views/core/core_pages/pages/show_me.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();
  UserRepo userRepo = Get.put(UserRepo());
  late UserModel? userRecords;
  //firebase authentication
  final _auth = FirebaseAuth.instance;
  Rx<InternetStatus> _hasInternetConnection =
      Rx<InternetStatus>(InternetStatus.disconnected);
  late Rx<User?> _firebaseUser;
  final isLoading = false.obs;
  //Getters
  User? get firebaseUser => _firebaseUser.value;
  InternetStatus get hasInternetConnection => _hasInternetConnection.value;
  String get getUserId => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

  final List<String> scopes = [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  @override
  void onReady() async {
    InternetStatus internetStatus = await InternetConnection().internetStatus;
     _hasInternetConnection = Rx<InternetStatus>(internetStatus);
    _hasInternetConnection.bindStream(InternetConnection().onStatusChange);
     //check for internet connection changes if enabled
     ever(_hasInternetConnection, (status) async {
     await checkInternetConnection(status);
     return;
    });
    //show internet exception widget to user if internet is not enabled
    await checkInternetConnection(internetStatus);
   
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());

    setInitialScreen(_firebaseUser.value);
  }
  checkInternetConnection(InternetStatus status)async{
     switch (status) {
        case InternetStatus.connected:
        if(Get.currentRoute == "/InternetExceptionWidget"){
          Get.back();
          Get.snackbar("Internet Service", "Internet service resumed");
        }
          break;
        case InternetStatus.disconnected:
        if(Get.currentRoute != "/InternetExceptionWidget"){
          await Get.to(()=> const InternetExceptionWidget());
        }
         break;
        default:
          null;
      }
  }

  Future<void> sendEmailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  setInitialScreen(User? user) async {
    //await firebaseUser!.delete();
    final String? email = user?.email;
    if (email != null) {
      userRecords = await userRepo.getUserDetails(email);
    }

    //firebaseUser!.displayName != null? Get.to(()=>MissingUsername(email: firebaseUser!.email!)):null;
    user == null
        ? Get.offAll(() => const SignInInitial())
        : userRecords?.firstName == null
            ? Get.offAll(() => const MissingUsername())
            : !user.emailVerified
                ? Get.offAll(() => const OtpScreen())
                : userRecords?.interests == null
                    ? Get.to(() => const NewInterests())
                    : userRecords!.genderInterestIndex == null ||
                            userRecords!.minAge == null ||
                            userRecords!.maxAge == null
                        ? Get.to(() => const ShowMe())
                        : userRecords!.genderId == null ||
                                userRecords!.dob == null
                            ? Get.offAll(() => const DobAndGender())
                            : userRecords!.totalPictures == null
                                ? Get.to(() => const ProfileDetails())
                                : Get.offAll(() => const CustomScaffold());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.code;
    } catch (_) {}
  }

  Future<GoogleSignInAccount?> googleSignOut() async {
    return await GoogleSignIn(
      scopes: scopes,
    ).signOut();
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: scopes,
      ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.code;
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
