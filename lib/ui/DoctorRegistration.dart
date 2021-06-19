import 'dart:convert';

import 'package:chikitsa/core/network/authentication.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/ui/DoctorHome.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorRegistration extends StatefulWidget {
  @override
  _DoctorRegistrationState createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
  bool isLoading = false;
  bool isToggled = false;
  bool _confirmPassword = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController hospitalController = new TextEditingController();
  final TextEditingController specialityController =
      new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  bool _showPassword = false;
  bool _showSpace = false;
  bool _isLoading = false;

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void initState() {
    super.initState();
    manageKeyboardView();
  }

  void manageKeyboardView() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        _showSpace = visible;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.whiteColor,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createUpperBar(context, "Doctor Registration"),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 1),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 3,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.generalDetails,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Montserrat-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1,
                                right: SizeConfig.blockSizeHorizontal * 1,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.perm_identity,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: StringConstant.name,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1,
                                right: SizeConfig.blockSizeHorizontal * 1,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: hospitalController,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.local_hospital,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: StringConstant.hospital,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1,
                                right: SizeConfig.blockSizeHorizontal * 1,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: specialityController,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.ac_unit,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: StringConstant.speciality,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeVertical * 3,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.yourCredentials,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Montserrat-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 20),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    height: SizeConfig.blockSizeVertical * 7,
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 3,
                                      left: SizeConfig.blockSizeHorizontal * 8,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 1,
                                      right: SizeConfig.blockSizeHorizontal * 1,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black12,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: Text(
                                      "+91",
                                      style: TextStyle(
                                        letterSpacing: 1.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato-Regular',
                                      ),
                                    )),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 65,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    left: SizeConfig.blockSizeHorizontal * 3,
                                    right: SizeConfig.blockSizeHorizontal * 8,
                                  ),
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 1,
                                    right: SizeConfig.blockSizeHorizontal * 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black12,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: TextField(
                                    controller: mobileController,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Regular',
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.phone_android_sharp,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                      focusedBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Lato-Regular',
                                      ),
                                      hintText: StringConstant.mobile,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1,
                                right: SizeConfig.blockSizeHorizontal * 1,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: StringConstant.emal,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 1,
                                right: SizeConfig.blockSizeVertical * 1,
                              ),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: !this._showPassword,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0, color: Colors.black87),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                  ),
                                  hintText: StringConstant.password,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 8,
                                right: SizeConfig.blockSizeHorizontal * 8,
                              ),
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 1,
                                right: SizeConfig.blockSizeVertical * 1,
                              ),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextField(
                                controller: confirmPasswordController,
                                obscureText: !this._confirmPassword,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0, color: Colors.black87),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.vpn_key_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.none,
                                  ),
                                  hintText: StringConstant.confirmpassword,
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
                                  top: SizeConfig.blockSizeVertical * 2,
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
                                        StringConstant.rEGISTER.toUpperCase(),
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
                            ),
                            if (_showSpace) Container(height: 400),
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

  Future<void> onSubmit(BuildContext context) async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    try {
      if (isValidate() is bool) {
        setState(() {
          _isLoading = true;
        });
        final formData = new Map<String, dynamic>();

        formData['email'] = emailController.text.trim();
        formData['name'] = nameController.text.trim();
        formData['hospital'] = hospitalController.text.trim();
        formData['speciality'] = specialityController.text.trim();
        formData['phone'] = mobileController.text.trim();
        formData['password'] = passwordController.text.trim();
        formData['type'] = 'Doctor';
        formData['fcm_token'] = 'testValue';

        final response = await AuthenticationService.registration(formData);
        print(response.statusCode);
        print(response.body);
        setState(() {
          _isLoading = false;
        });
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          if (!jsonData.containsKey("data")) {
            showAlertDialog(context, jsonData["message"]);
          } else {
            final SharedPreferences preference =
            await SharedPreferences.getInstance();
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.type, jsonData['data']['type']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.id, jsonData['data']['_id']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.name, jsonData['data']['name']);
            await SharedPreferenceHelper.setString(preference,
                PrefConstant.hospital, jsonData['data']['hospital']);
            await SharedPreferenceHelper.setString(preference,
                PrefConstant.speciality, jsonData['data']['speciality']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.email, jsonData['data']['email']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.phone, jsonData['data']['phone']);
            await SharedPreferenceHelper.setString(preference,
                PrefConstant.patients, jsonData['patients'].length.toString());
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DoctorHome()),
                (route) => false);
          }
        } else
          showAlertDialog(context, response.body.toString());
      } else {
        setState(() {
          _isLoading = false;
        });
        showAlertDialog(context, isValidate() as String);
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      showAlertDialog(context, error.toString());
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
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

  dynamic isValidate() {
    RegExp regex = new RegExp(pattern);

    if (nameController.text.isEmpty) {
      return 'Name should not empty';
    } else if (hospitalController.text.isEmpty) {
      return 'Hospital should not empty';
    } else if (specialityController.text.isEmpty) {
      return 'Speciality should not empty';
    } else if (mobileController.text.isEmpty) {
      return 'Mobile number should not empty';
    } else if (mobileController.text.length != 10) {
      return 'Mobile number is not correct';
    } else if (emailController.text.isEmpty) {
      return 'Email should not empty';
    } else if (!regex.hasMatch(emailController.text)) {
      return 'Email is not correct';
    } else if (passwordController.text.isEmpty) {
      return 'Password should not be empty';
    } else if (confirmPasswordController.text.isEmpty) {
      return 'Confirm password should not be empty';
    } else if (confirmPasswordController.text != passwordController.text) {
      return 'Password & confirm password does not matched';
    }
    return true;
  }
}
