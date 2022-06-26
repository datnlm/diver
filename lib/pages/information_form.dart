import 'package:diver/controller/information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UpdateInformationScreen extends StatelessWidget {
  const UpdateInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InformationController informationController =
        Get.find<InformationController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          informationController.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () => informationController.updateInformation(),
            child: const Text('Xong',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Form(
        key: informationController.formkey,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: informationController.textField,
                    decoration: const InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.cancel_sharp,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
