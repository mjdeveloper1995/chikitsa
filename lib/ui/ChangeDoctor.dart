import 'dart:convert';

import 'package:chikitsa/core/network/authentication.dart';
import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeDoctor extends StatefulWidget {
  @override
  _ChangeDoctorState createState() => _ChangeDoctorState();
}

class _ChangeDoctorState extends State<ChangeDoctor> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController specialityController =
      new TextEditingController();
  final TextEditingController hospitalController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();

  bool _isLoading = false;
  String doctorId = '';

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
                createUpperBar(context, "Change Doctor"),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 1),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: SizeConfig.blockSizeHorizontal * 35,
                              color: AppColors.themecolor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/images/doctor.png",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 5,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 5),
                                    child: Image.asset(
                                      "assets/images/changedoctor.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  Container(
                                    child: Image.asset(
                                      "assets/images/doctor.png",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.DoctorMobileNumber,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    height: SizeConfig.blockSizeVertical * 7,
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 1,
                                      left: SizeConfig.blockSizeHorizontal * 5,
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
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Lato-Regular',
                                      ),
                                    )),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 70,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 3,
                                    right: SizeConfig.blockSizeHorizontal * 5,
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
                                    onChanged: (text) {
                                      if (text.trim().length == 10) {
                                        doctorData(text.trim(), context);
                                      } else {
                                        nameController.text = '';
                                        hospitalController.text = '';
                                        specialityController.text = '';
                                      }
                                    },
                                    controller: mobileController,
                                    autofocus: false,
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
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.DoctorName,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
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
                                autofocus: false,
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
                                left: SizeConfig.blockSizeHorizontal * 5,
                                top: SizeConfig.blockSizeVertical * 2,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.Hospital,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
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
                                autofocus: false,
                                controller: hospitalController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
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
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.Speciality,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
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
                                autofocus: false,
                                controller: specialityController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
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
                            GestureDetector(
                              onTap: onSubmit,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2,
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
                                        StringConstant.CHANGEDOCTOR
                                            .toUpperCase(),
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

  Future<void> doctorData(String contactNumber, BuildContext context) async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    setState(() {
      _isLoading = true;
    });
    final formData = new Map<String, dynamic>();
    formData['phone'] = mobileController.text.trim();
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
        String name = jsonData["data"]['name'];
        String hospital = jsonData["data"]['hospital'];
        String speciality = jsonData["data"]['speciality'];

        nameController.text = name;
        hospitalController.text = hospital;
        specialityController.text = speciality;

        setState(() {});
      }
    } else
      showAlertDialog(context, response.body.toString());
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

  Future<void> onSubmit() async {
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

      formData['userId'] = StringConstant.userId;
      formData['doctorId'] = doctorId;

      final response = await DoctorService.changeDoctor(formData);
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(response.body);
        if(jsonData.containsKey("data")){
          final SharedPreferences preference =
          await SharedPreferences.getInstance();
          await SharedPreferenceHelper.setString(
              preference, PrefConstant.doctorName, nameController.text);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.doctorHospital, hospitalController.text);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.doctorSpeciality, specialityController.text);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.doctorId, doctorId);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.doctorPhone, mobileController.text);
        }
        showAlertDialog(context, jsonData["message"],success :jsonData.containsKey("data"));

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
    if (nameController.text.isEmpty) {
      return 'Name should not empty';
    } else if (specialityController.text.isEmpty) {
      return 'Speciality should not empty';
    } else if (mobileController.text.isEmpty) {
      return 'Mobile number should not empty';
    } else if (mobileController.text.length != 10) {
      return 'Mobile number is not correct';
    } else if (hospitalController.text.isEmpty) {
      return 'Hospital should not be empty';
    }

    return true;
  }
}
