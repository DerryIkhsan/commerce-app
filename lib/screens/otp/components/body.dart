import 'package:commerce_app/constant.dart';
import 'package:commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +1 898 860 ***"),
              buildTimer(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),
              OtpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              GestureDetector(
                  onTap: () {
                    // Resend OTP
                  },
                  child: Text("Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline))),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
