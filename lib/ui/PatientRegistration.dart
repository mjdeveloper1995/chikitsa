import 'dart:convert';

import 'package:chikitsa/core/network/authentication.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class PatientRegistration extends StatefulWidget {
  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  bool isLoading = false;
  bool isToggled = false;
  bool _confirmPassword = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController doctorNameController =
      new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController drMobileController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  bool _showPassword = false;
  bool _visible = false;
  bool _isLoading = false;

  String doctorId = '';
  String doctorName = '';
  bool _showSpace = false;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createUpperBar(context, "Patient Registration"),
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
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
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
                                controller: addressController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.streetAddress,
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
                                    Icons.add_location_alt_outlined,
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
                                  hintText: StringConstant.address,
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
                                controller: ageController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
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
                                    Icons.calendar_today_outlined,
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
                                  hintText: StringConstant.age,
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
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
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
                                textInputAction: TextInputAction.next,
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
                                  hintText: StringConstant.email,
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
                                textInputAction: TextInputAction.done,
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
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
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
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: StringConstant.confirmpassword,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1),
                                child: Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                )),
                            Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: headerBox()),
                            _visible == true ? dialogBox() : Container(),
                            GestureDetector(
                              onTap: () {
                                onSubmit(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 1,
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

  Widget dialogBox() {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          bottom: 5,
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5,
        ),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 1,
                right: SizeConfig.blockSizeHorizontal * 1,
                top: SizeConfig.blockSizeVertical * 2,
                bottom: SizeConfig.blockSizeVertical * 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: SizeConfig.blockSizeHorizontal * 14,
                          height: SizeConfig.blockSizeVertical * 7,
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                          ),
                          padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeVertical * 1,
                            right: SizeConfig.blockSizeVertical * 1,
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
                        width: SizeConfig.blockSizeHorizontal * 60,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 2),
                        padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 1,
                          right: SizeConfig.blockSizeVertical * 1,
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

                          controller: drMobileController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Montserrat-Regular',
                          ),
                          onChanged: (text){
                            if(text.trim().length == 10){
                              doctorData(text.trim(),context);
                            }else{
                              doctorNameController.text = '';
                            }
                          },
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
                            hintText: StringConstant.doctorregisterednumber,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 75,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1,
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
                      enabled: false,
                      controller: doctorNameController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
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
                        hintText: StringConstant.drname,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget headerBox() {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 8,
          right: SizeConfig.blockSizeHorizontal * 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 1,
              bottom: SizeConfig.blockSizeVertical * 1,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              StringConstant.doctor,
              style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Regular',
                  color: AppColors.blackColor,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 1,
                bottom: SizeConfig.blockSizeVertical * 1,
                left: SizeConfig.blockSizeHorizontal * 50),
            child: FlutterSwitch(
              height: 20.0,
              width: 40.0,
              padding: 4.0,
              toggleSize: 20.0,
              borderRadius: 10.0,
              activeColor: AppColors.themecolor,
              value: _visible,
              onToggle: (value) {
                setState(() {
                  _visible = !_visible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onSubmit(BuildContext context) async {
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

      formData['email'] = emailController.text.trim();
      formData['name'] = nameController.text.trim();
      formData['address'] = addressController.text.trim();
      formData['age'] =  ageController.text.trim();
      formData['phone'] = mobileController.text.trim();
      formData['password'] = passwordController.text.trim();
      formData['type'] = 'Patient';
      formData['fcm_token'] = 'testValue';
      formData['adddoctor'] = isToggled.toString();
      if (isToggled) {
        formData['doctorId'] = doctorId;
      }

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
        } else
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (BuildContext context) => Home()),
          //     (route) => false);
    Navigator.pop(context);
      } else {
        showAlertDialog(context, response.body.toString());
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
    } else if (ageController.text.isEmpty) {
      return 'Speciality should not empty';
    } else if (mobileController.text.isEmpty) {
      return 'Mobile number should not empty';
    } else if (mobileController.text.length != 10) {
      return 'Mobile number is not correct';
    }  else if (passwordController.text.isEmpty) {
      return 'Password should not be empty';
    } else if (confirmPasswordController.text.isEmpty) {
      return 'Confirm password should not be empty';
    } else if (confirmPasswordController.text != passwordController.text) {
      return 'Password & confirm password does not matched';
    }

    if (isToggled) {
      if (drMobileController.text.isEmpty) {
        return 'Doctor  number should not empty';
      } else if (drMobileController.text.length != 10) {
        return 'Doctor number is not correct';
      }
    }

    return true;
  }

  Future<void> doctorData(String contactNumber,BuildContext context) async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    setState(() {
      _isLoading = true;
    });
    final formData = new Map<String, dynamic>();
    formData['phone'] = drMobileController.text.trim();
    formData['type'] = 'Doctor';

    final response = await AuthenticationService.getUserByID(formData);
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (!jsonData.containsKey("data")) {
        showAlertDialog(context, jsonData["message"]);
      } else {
        doctorId = jsonData["data"]['_id'];
        doctorName = jsonData["data"]['name'];
        doctorNameController.text = doctorName;
        setState(() {});
      }
    } else
      showAlertDialog(context, response.body.toString());
  }
}
