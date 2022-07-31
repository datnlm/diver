import 'package:diver/controller/auth_controller.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? email = TextEditingController();
    TextEditingController? password = TextEditingController();

    final AuthController authController = Get.find<AuthController>();
    return Form(
      key: authController.formkey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color(0xFFF1E6FF),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color(0xFF6F35A5),
              // cursorColor: kPrimaryColor,
              controller: email,
              validator: (value) {
                return authController.validate(value!, 'validate-email'.tr);
              },
              decoration: InputDecoration(
                hintText: "email".tr,
                border: InputBorder.none,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF6F35A5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
                validator: (value) {
                  return authController.validate(
                      value!, 'validate-password'.tr);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "password".tr,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(16.0),
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
          SizedBox(
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
                  authController.login(email, password);
                  if (authController.formkey.currentState!.validate()) {
                    showLoaderDialog(context);
                  }
                },
                child: Text('login'.tr),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Loading();
      },
    );
  }
}
