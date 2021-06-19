import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  
  final TextEditingController newpasswordController =
      new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController =
      new TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createProfileUpperBar(context, "Edit Password"),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 1),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.CurrentPassword,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: TextField(
                                controller: passwordController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "123456",
                                ),
                              ),
                            ),
                            Container(
                                child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.NewPassword,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: TextField(
                                controller: newpasswordController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "123456",
                                ),
                              ),
                            ),
                            Container(
                                child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.ConfirmPassword,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: TextField(
                                autofocus: false,
                                controller: confirmpasswordController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,

                                obscureText: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "123456",
                                ),
                              ),
                            ),
                            Container(
                                child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),
                            GestureDetector(
                              onTap: () {
                                onSubmit(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5,
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                ),
                                width: SizeConfig.blockSizeHorizontal * 60,
                                height: SizeConfig.blockSizeHorizontal * 15,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: AppColors.themecolor,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        StringConstant.SAVEPASSWORD.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Lato-Regular',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            letterSpacing: 1.0),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading) LoadingWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onSubmit(BuildContext context) async{
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    if (isValidate() is String) {
      showAlertDialog(context, isValidate() as String);
      return;
    }

    try {

      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['password'] = passwordController.text.trim();
      formData['newPassword'] = newpasswordController.text.trim();
      formData['userId'] = StringConstant.userId;

      final response = await DoctorService.updatePassword(formData);
      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        showAlertDialog(context, jsonData["message"],success :jsonData.containsKey("data"));
      }else {
        showAlertDialog(context, response.body.toString());
      }

    }
    catch(error){
      setState(() {
        _isLoading = false;
      });
      showAlertDialog(context, error.toString());
    }

  }

  dynamic isValidate() {
    if (passwordController.text.isEmpty) {
      return 'Current Password should not empty';
    } else if (newpasswordController.text.isEmpty) {
      return 'New Password should not empty';
    } else if (confirmpasswordController.text.isEmpty) {
      return 'Confirm Password should not be empty';
    }
    else if (confirmpasswordController.text != newpasswordController.text) {
      return 'New password & Confirm password does not matched';
    }
    return true;
  }

  void showAlertDialog(BuildContext context, String message, {bool success = false}) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        if(success)
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
