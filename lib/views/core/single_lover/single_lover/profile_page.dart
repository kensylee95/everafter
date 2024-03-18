import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/json_files/gender_interest.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/profile_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/core/core_pages/match_widgets/swipe_button.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';
import 'package:remind_me/views/core/single_lover/single_lover/photo_display.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomContainer(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: ProfilePicture(
                    size: size,
                    userModel: userModel,
                    photoIndex: controller.profileImageIndex(userModel),
                  ),
                ),
                Positioned(
                    right: padding,
                    bottom: padding,
                    child: GestureDetector(
                        onTap: () {
                          controller.pageController = PageController(
                              initialPage:
                                  controller.userProfilePhotoIndex(userModel));

                          Get.to(
                            () => PhotoDisplay(
                              controller: controller,
                              userModel: userModel,
                            ),
                          );
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.expand,
                          size: 25,
                          color: primaryColor1,
                        )))
              ],
            ),
            ProfileImageCaption(userModel: userModel, size: size),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Interests",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.apply(color: Colors.grey.shade600),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: padding),
                          child: Wrap(
                            spacing: 5,
                            alignment: WrapAlignment.start,
                            children: userModel.interests!
                                .map((interest) => Chip(
                                    side: BorderSide(
                                      width: 2,
                                      color: Colors.grey.shade50,
                                    ),
                                    label: Text(
                                      interest.capitalizeFirst!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: UserProfileProperties(
                              size: size, userModel: userModel),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageCaption extends StatelessWidget {
  const ProfileImageCaption({
    super.key,
    required this.userModel,
    required this.size,
  });

  final UserModel userModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: padding, left: padding, right: padding, top: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfileName(userModel: userModel),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserGender(size: size, userModel: userModel),
                  const SizedBox(
                    height: 6,
                  ),
                  UserLocationWidget(size: size, userModel: userModel),
                ],
              ),
              //------
            Row(children: [
              SwipeButton(icon: Icons.star, iconColor: Colors.blue, bgColor: Colors.blue.withOpacity(0.1), onTap: (){}),
              SwipeButton(icon: FontAwesomeIcons.heart, iconColor: Colors.green, bgColor: Colors.green.withOpacity(0.1), onTap: (){}),
              SwipeButton(icon: FontAwesomeIcons.xmark, iconColor: Colors.red, bgColor: Colors.red.withOpacity(0.1), onTap: (){})
            ],)
            ],
          ),
        ],
      ),
    );
  }
}

class UserProfileName extends StatelessWidget {
  const UserProfileName({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
              text:
                  "${userModel.firstName.capitalizeFirst} ${userModel.lastName}, ",
              style: GoogleFonts.eczar(
                  fontSize: 22,
                  shadows: [
                    Shadow(
                        blurRadius: 100,
                        color: Colors.grey.shade50)
                  ],
                  color: Colors.black87),
              children: [
                TextSpan(
                  text: userModel.age!.toString().capitalizeFirst,
                  style: GoogleFonts.farsan(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            blurRadius: 100,
                            color: Colors.grey.shade50)
                      ],
                      fontWeight: FontWeight.bold,
                      color: primaryColor1.withOpacity(0.9)),
                ),
              ]),
        ),
        const OnlineStatus(),
      ],
    );
  }
}

class OnlineStatus extends StatelessWidget {
  const OnlineStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
      ),
      height: 25,
      width: 60,
      child: Center(
        child: Text(
          "online",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.apply(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class UserLocationWidget extends StatelessWidget {
  const UserLocationWidget({
    super.key,
    required this.size,
    required this.userModel,
  });

  final Size size;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FaIcon(FontAwesomeIcons.locationDot,
              size: 14, color: primaryColor1),
          const SizedBox(
            width: 5,
          ),
          Text(
            "${userModel.address?.city ?? "Unknown"}, ${userModel.address?.country ?? "Unknown"}",
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class UserGender extends StatelessWidget {
  const UserGender({
    super.key,
    required this.size,
    required this.userModel,
  });

  final Size size;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FaIcon(FontAwesomeIcons.person,
              size: 14, color: primaryColor1),
          const SizedBox(
            width: 5,
          ),
          Text(
            supportedGenders[userModel.genderId!]
                .capitalizeFirst!,
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class UserProfileProperties extends StatelessWidget {
  const UserProfileProperties({
    super.key,
    required this.size,
    required this.userModel,
  });

  final Size size;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final List<Widget> props = [
      SizedBox(
        height: size.height * 0.5,
        child: Card(
          elevation: 5,
          borderOnForeground: true,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade50
              : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Basic Info",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.apply(color: Colors.grey.shade600),
                ),
                TextDetail(
                  title: "Age:",
                  icon: Icons.numbers,
                  subtitle: "${userModel.age} years",
                ),
                TextDetail(
                  title: "Gender:",
                  icon: Icons.supervised_user_circle_outlined,
                  subtitle: supportedGenders[userModel.genderId!]
                      .capitalizeFirst!
                      .capitalizeFirst!,
                ),
                TextDetail(
                  title: "Seeking:",
                  icon: Icons.search,
                  subtitle: genderInterest[userModel.genderInterestIndex!]
                      .capitalizeFirst!,
                ),
                TextDetail(
                  title: "Age range:",
                  icon: Icons.unfold_less_outlined,
                  subtitle: "${userModel.minAge!} - ${userModel.maxAge}"
                      .capitalizeFirst!,
                ),
                TextDetail(
                  title: "Location:",
                  icon: Icons.pin_drop_outlined,
                  subtitle:
                      "${userModel.address?.city}, ${userModel.address?.country}"
                          .capitalizeFirst!,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.4,
        child: Card(
          elevation: 5,
          borderOnForeground: true,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade50
              : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Appearance",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.apply(color: Colors.grey.shade600),
                ),
                TextDetail(
                  title: "Body type:",
                  icon: FontAwesomeIcons.personHalfDress,
                  subtitle: userModel.userProperties?.appearance?.bodyType ?? "Not Set",
                ),
                TextDetail(
                    title: "Ethnicity:",
                    icon: Icons.group,
                    subtitle: userModel.userProperties?.appearance?.ethnicity ?? "Not Set"),
                TextDetail(
                  title: "Eye Color:",
                  icon: Icons.remove_red_eye_outlined,
                  subtitle: userModel.userProperties?.appearance?.eyeColor ?? "Not Set",
                ),
                TextDetail(
                  title: "Hair Color:",
                  icon: Icons.face,
                  subtitle: userModel.userProperties?.appearance?.hairColor ?? "Not Set",
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.4,
        child: Card(
          elevation: 5,
          borderOnForeground: true,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade50
              : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Life Style",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.apply(color: Colors.grey.shade600),
                ),
                TextDetail(
                  title: "Drinking Habit:",
                  icon: FontAwesomeIcons.bottleWater,
                  subtitle: userModel.userProperties?.lifeStyle?.doYouDrink ?? "Not Set",
                ),
                TextDetail(
                    title: "Smoking Habit:",
                    icon: Icons.smoking_rooms_rounded,
                    subtitle: userModel.userProperties?.lifeStyle?.doYouSmoke ?? "Not Set"),
                TextDetail(
                  title: "Have pets?:",
                  icon: Icons.pets_rounded,
                  subtitle: userModel.userProperties?.lifeStyle?.havePets ?? "Not Set",
                ),
                TextDetail(
                  title: "Employed?:",
                  icon: Icons.work_outline_rounded,
                  subtitle: userModel.userProperties?.lifeStyle?.employmentStatus ?? "Not Set",
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.4,
        child: Card(
          elevation: 5,
          borderOnForeground: true,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade50
              : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Background Info",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.apply(color: Colors.grey.shade700),
                ),
                TextDetail(
                  title: "Religion:",
                  icon: FontAwesomeIcons.personPraying,
                  subtitle: userModel.userProperties?.culturalValues?.religion ?? "Not Set",
                ),
                TextDetail(
                    title: "Education Level:",
                    icon: Icons.book_outlined,
                    subtitle: userModel.userProperties?.culturalValues?.education ?? "Not Set"),
                TextDetail(
                  title: "Star Sign:",
                  icon: Icons.star,
                  subtitle: userModel.userProperties?.culturalValues?.starSign ?? "Not Set",
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(padding),
            height: size.height * 0.35,
            width: size.width,
            child: PageView.builder(
              pageSnapping: true,
              itemCount: props.length,
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) =>
                  controller.activeIndexOfUserProps.value = index,
              itemBuilder: (context, index) {
                return props[index];
              },
            )),
        Obx(
          () => AnimatedSmoothIndicator(
            count: props.length,
            effect: ExpandingDotsEffect(
              activeDotColor: primaryColor1,
              dotColor: Colors.black.withOpacity(0.4),
            ),
            activeIndex: controller.activeIndexOfUserProps.value,
          ),
        ),
      ],
    );
  }
}

class TextDetail extends StatelessWidget {
  const TextDetail({
    super.key,
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  final IconData icon;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey.shade300),
              const SizedBox(
                width: padding,
              ),
              Text(
                title,
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.apply(color: Colors.grey.shade800),
              ),
            ],
          ),
          Text(
            subtitle.capitalizeFirst!,
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.apply(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.size,
    required this.userModel,
    required this.photoIndex,
  });

  final Size size;
  final UserModel userModel;
  final int photoIndex;

  @override
  Widget build(BuildContext context) {
    return ImageWidgetProfile(
      height: size.height * 0.4,
      width: size.width,
      boxFit: BoxFit.cover,
      alignment: Alignment.center,
      userModel: userModel,
      activePhotoIndex: photoIndex,
    );
  }
}
