import 'package:classroom/ui/auth/pages/role_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Done',
      onFinish: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RoleSelectionPage()),
        );
      },
      finishButtonColor: Colors.black,
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: Colors.black,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.only(left: 200.0),
          child: Image.asset(
            'assets/onboarding/slide_1.png',
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200.0),
          child: Image.asset(
            'assets/onboarding/slide_2.png',
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200.0),
          child: Image.asset(
            'assets/onboarding/slide_3.png',
            height: 400,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Teachers can create courses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'for students and parents to keep them updated with the latest information.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Parents can join their students courses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'to keep their teachers updated on any absences',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Students and parents can be updated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'on any school holidays, events, and activites using the calendar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
