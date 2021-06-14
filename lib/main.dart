import 'dart:convert';

import 'package:chikitsa/core/network/authentication.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/ui/DoctorHome.dart';
import 'package:chikitsa/ui/DoctorRegistration.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/ui/PatientRegistration.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();

    String id =
        SharedPreferenceHelper.getPrefString(preference, PrefConstant.id);
    if (id == '') {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (route) => false);
    } else {
      String type =
          SharedPreferenceHelper.getPrefString(preference, PrefConstant.type);
      if (type == 'Patient')
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (route) => false);
      else
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => DoctorHome()),
            (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.themecolor,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  bool _showPassword = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.themecolor,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 25),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 120,
                          width: 120,
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ct) {
                                    return AlertDialog(
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Positioned(
                                            left: 110.0,
                                            top: -80.0,
                                            child: InkResponse(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.themecolor,
                                                    //this is the important line
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.black87,
                                                    size: 20,
                                                  ),
                                                )),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Container(
                                                      width: SizeConfig
                                                              .blockSizeHorizontal *
                                                          14,
                                                      height: SizeConfig
                                                              .blockSizeVertical *
                                                          8,
                                                      margin: EdgeInsets.only(
                                                        top: SizeConfig
                                                                .blockSizeVertical *
                                                            1,
                                                      ),
                                                      padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                                .blockSizeVertical *
                                                            1,
                                                        right: SizeConfig
                                                                .blockSizeVertical *
                                                            1,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.black12,
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 1.0,
                                                        ),
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Text(
                                                        "+91",
                                                        style: TextStyle(
                                                          letterSpacing: 1.0,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Lato-Regular',
                                                        ),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockSizeVertical *
                                                              1,
                                                          left: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              2),
                                                      padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                                .blockSizeVertical *
                                                            1,
                                                        right: SizeConfig
                                                                .blockSizeVertical *
                                                            1,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.black12,
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 1.0,
                                                        ),
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            mobileController,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .phone_android_sharp,
                                                            color: Colors.black,
                                                            size: 25,
                                                          ),
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          hintStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            color: AppColors
                                                                .blackColor,
                                                            fontFamily:
                                                                "Montserrat-Regular",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                          hintText:
                                                              StringConstant
                                                                  .mobilenumber,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.only(
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      1,
                                                ),
                                                padding: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeVertical *
                                                      1,
                                                  right: SizeConfig
                                                          .blockSizeVertical *
                                                      1,
                                                ),
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                child: TextField(
                                                  controller:
                                                      passwordController,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  obscureText:
                                                      !this._showPassword,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    letterSpacing: 1.0,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        'Montserrat-Regular',
                                                  ),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.vpn_key,
                                                      color: Colors.black,
                                                      size: 25,
                                                    ),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    hintStyle: TextStyle(
                                                      fontSize: 12.0,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontFamily:
                                                          "Montserrat-Regular",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                    hintText:
                                                        StringConstant.password,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1,
                                                  ),
                                                  child: GestureDetector(
                                                    child: Text(
                                                      "Forgot Password?",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 12.0,
                                                          color: AppColors
                                                              .blackColor,
                                                          fontFamily:
                                                              "Montserrat-Regular",
                                                          fontStyle:
                                                              FontStyle.normal),
                                                    ),
                                                    onTap: () {},
                                                  )),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  onSubmit(context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1,
                                                  ),
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      60,
                                                  height: SizeConfig
                                                          .blockSizeHorizontal *
                                                      15,
                                                  child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      color:
                                                          AppColors.themecolor,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          StringConstant.signin
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Lato-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 16,
                                                              letterSpacing:
                                                                  1.0),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 60,
                              height: SizeConfig.blockSizeHorizontal * 15,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: AppColors.whiteColor,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      StringConstant.signin.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontFamily: 'Lato-Regular',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          letterSpacing: 1.0),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              StringConstant.orregisteras,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5,
                                    left: SizeConfig.blockSizeHorizontal * 10,
                                    right: SizeConfig.blockSizeHorizontal * 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Image.asset(
                                      "assets/images/patient.png",
                                      height: 60,
                                      width: 60,
                                    )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PatientRegistration()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                        ),
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: AppColors.whiteColor,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 15,
                                                  left: 20,
                                                  right: 20),
                                              child: Text(
                                                StringConstant.patient
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontFamily:
                                                        'Montserrat-Regular',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    letterSpacing: 1.0),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5,
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                    right: SizeConfig.blockSizeHorizontal * 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Image.asset(
                                      "assets/images/doctor.png",
                                      height: 60,
                                      width: 60,
                                    )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DoctorRegistration()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                        ),
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: AppColors.whiteColor,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 15,
                                                  left: 20,
                                                  right: 20),
                                              child: Text(
                                                StringConstant.doctor
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontFamily:
                                                        'Montserrat-Regular',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    letterSpacing: 1.0),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

    if (isValidate() is String) {
      showAlertDialog(context, isValidate() as String);
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['phone'] = mobileController.text.trim();
      formData['password'] = passwordController.text.trim();
      formData['fcm_token'] = 'testValue';

      final response = await AuthenticationService.login(formData);
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
          if (jsonData['data']['type'] == 'Patient') {
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.type, jsonData['data']['type']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.id, jsonData['data']['_id']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.name, jsonData['data']['name']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.address, jsonData['data']['address']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.age, jsonData['data']['age']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.email, jsonData['data']['email']);
            await SharedPreferenceHelper.setString(
                preference, PrefConstant.phone, jsonData['data']['phone']);

            if (jsonData['doctor'] != null) {
              await SharedPreferenceHelper.setString(preference,
                  PrefConstant.doctorId, jsonData['doctor']['phone']);
              await SharedPreferenceHelper.setString(preference,
                  PrefConstant.doctorName, jsonData['doctor']['phone']);
              await SharedPreferenceHelper.setString(preference,
                  PrefConstant.doctorPhone, jsonData['doctor']['phone']);
              await SharedPreferenceHelper.setString(preference,
                  PrefConstant.doctorHospital, jsonData['doctor']['phone']);
              await SharedPreferenceHelper.setString(preference,
                  PrefConstant.doctorSpeciality, jsonData['doctor']['phone']);
            }
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Home()),
                (route) => false);
          } else {
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
        }
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

  dynamic isValidate() {
    if (mobileController.text.isEmpty) {
      return 'Mobile number should not empty';
    } else if (mobileController.text.length != 10) {
      return 'Mobile number is not correct';
    } else if (passwordController.text.isEmpty) {
      return 'Password should not be empty';
    }
    return true;
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
}
