import 'package:diver/widgets/login_form.dart';
import 'package:diver/widgets/login_screen_top_image.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MobileLoginScreen(),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/signup_top.png',
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/images/login_bottom.png',
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LoginScreenTopImage(),
            Row(
              children: const [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginForm(),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
