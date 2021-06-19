import 'dart:convert';

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

class EditDoctorProfile extends StatefulWidget {
  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController specilalityController = new TextEditingController();
  final TextEditingController hospitalController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();


  String name = '';
  String speciality = '';
  String hospital = '';
  String mobile = '';
  String email = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  Future<void> getInitialData() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    name = SharedPreferenceHelper.getPrefString(preference, PrefConstant.name);
    speciality = SharedPreferenceHelper.getPrefString(preference, PrefConstant.speciality);
    hospital = SharedPreferenceHelper.getPrefString(preference, PrefConstant.hospital);
    mobile = SharedPreferenceHelper.getPrefString(preference, PrefConstant.phone);
    email = SharedPreferenceHelper.getPrefString(preference, PrefConstant.email);

    emailController.text = email;
    nameController.text = name;
    specilalityController.text = speciality;
    hospitalController.text = hospital;
    mobileController.text = mobile;

    setState(() {});
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
                createProfileUpperBar(context, "Edit Profile",onClick: (){
                  onSubmit();
                }),
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
                                top: SizeConfig.blockSizeVertical *2,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.name,
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
                              child:TextField(
                                autofocus: false,
                                controller: nameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
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
                                  hintText: "Deepak Sharma",
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
                                top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.speciality,
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
                              child:TextField(
                                autofocus: false,
                                controller: specilalityController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.streetAddress,
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
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "IIT Roorkee",
                                ),
                              )

                            ),
                            Container(
                                child: Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.hospital,
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
                              child:  TextField(
                                autofocus: false,
                                controller: hospitalController,
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "35",
                                ),
                              )
                            ),
                            Container(
                                child: Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.mobilenumber,
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
                                enabled: false,
                                autofocus: false,
                                controller: mobileController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
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
                                    letterSpacing: 1.0,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "+91 958xxxxx27",
                                ),
                              )
                            ),
                            Container(
                                child: Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.emal,
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
                                top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child:  TextField(
                                enabled: false,
                                autofocus: false,
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    letterSpacing: 1.0,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  hintText: "deepaksharma@gmail.com",
                                ),
                              )
                            ),
                            Container(
                                child: Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                )),
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

  Future<void> onSubmit() async{

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
      formData['name'] = nameController.text.trim();
      formData['hospital'] = hospitalController.text.trim();
      formData['speciality'] = specilalityController.text.trim();
      formData['userId'] = StringConstant.userId;
      formData['type'] = 'Doctor';

      final response = await DoctorService.editProfile(formData);
      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if(jsonData.containsKey("data")){
          final SharedPreferences preference =
          await SharedPreferences.getInstance();
          await SharedPreferenceHelper.setString(
              preference, PrefConstant.name, jsonData['data']['name']);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.hospital, jsonData['data']['hospital']);
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.speciality, jsonData['data']['speciality']);
        }
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
    if (nameController.text.isEmpty) {
      return 'Current Password should not empty';
    } else if (specilalityController.text.isEmpty) {
      return 'Speciality should not empty';
    } else if (hospitalController.text.isEmpty) {
      return 'Hospital should not be empty';
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
