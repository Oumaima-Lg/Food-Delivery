import 'package:ff/services/widget_support.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Image.asset("images/onboard.png"),
              SizedBox(height: 20.0),
              Text(
                "The Fasted\nFood Delivery",
                style: AppWidget.HeadlineTextFieldStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Craving something delicious?\nOrder now and get your favorite\ndelivered fast!',
                style: AppWidget.SimpleTextFieldStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Color(0xff8c592a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
