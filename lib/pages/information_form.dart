import 'package:diver/controller/information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInformationScreen extends StatelessWidget {
  const UpdateInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InformationController _informationController =
        Get.find<InformationController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _informationController.title,
          style: TextStyle(
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
            onPressed: () => _informationController.updateInformation(),
            child: const Text('Xong',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Form(
        key: _informationController.formkey,
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _informationController.textField,
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
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.85,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 20, horizontal: 40),
                //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //     ),
                //     onPressed: () => _informationController.updateInformation(),
                //     child: const Text('Xong'),
                //   ),
                // ),
              ],
            )),
        // child: Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //           width: MediaQuery.of(context).size.width * 0.8,
        //           decoration: BoxDecoration(
        //             color: const Color(0xFFF1E6FF),
        //             borderRadius: BorderRadius.circular(29),
        //           ),
        //           child: TextFormField(
        //             textAlign: TextAlign.start,
        //             textAlignVertical: TextAlignVertical.center,
        //             textInputAction: TextInputAction.next,
        //             cursorColor: const Color(0xFF6F35A5),
        //             // cursorColor: kPrimaryColor,
        //             controller: _informationController.textField,
        //             // onSaved: (email) {},
        //             decoration: const InputDecoration(
        //               border: InputBorder.none,
        //               prefixIcon: Padding(
        //                 padding: EdgeInsets.all(16.0),
        //                 child: Icon(
        //                   Icons.person,
        //                   color: Color(0xFF6F35A5),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //           width: MediaQuery.of(context).size.width * 0.8,
        //           decoration: BoxDecoration(
        //             color: const Color(0xFFF1E6FF),
        //             borderRadius: BorderRadius.circular(29),
        //           ),
        //           child: TextFormField(
        //             textAlign: TextAlign.start,
        //             textAlignVertical: TextAlignVertical.center,
        //             textInputAction: TextInputAction.next,
        //             cursorColor: const Color(0xFF6F35A5),
        //             // cursorColor: kPrimaryColor,
        //             controller: _informationController.textField,
        //             // onSaved: (email) {},
        //             decoration: const InputDecoration(
        //               // border: InputBorder.none,
        //               prefixIcon: Padding(
        //                 padding: EdgeInsets.all(16.0),
        //                 child: Icon(
        //                   Icons.person,
        //                   color: Color(0xFF6F35A5),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
