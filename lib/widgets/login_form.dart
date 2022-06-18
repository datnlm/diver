import 'package:diver/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? email = TextEditingController();
    TextEditingController? password = TextEditingController();
    final formkey = GlobalKey<FormState>();

    final LoginController loginController = Get.find<LoginController>();
    return Form(
      key: formkey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Color(0xFF6F35A5),
              // cursorColor: kPrimaryColor,
              controller: email,
              // onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  // padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF6F35A5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: const Color(0xFFF1E6FF),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: const Color(0xFF6F35A5),
                // cursorColor: kPrimaryColor,
                controller: password,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(16.0),
                    // padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.lock,
                      color: Color(0xFF6F35A5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // const SizedBox(height: defaultPadding),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  loginController.login(email, password);
                  // Navigator.pushNamed(context, Routes.home);
                },
                child: Text('Login'),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
