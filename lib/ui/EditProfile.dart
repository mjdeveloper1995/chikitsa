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

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();


  String name = '';
  String address = '';
  String age = '';
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
    address = SharedPreferenceHelper.getPrefString(preference, PrefConstant.address);
    age = SharedPreferenceHelper.getPrefString(preference, PrefConstant.age);
    mobile = SharedPreferenceHelper.getPrefString(preference, PrefConstant.phone);
    email = SharedPreferenceHelper.getPrefString(preference, PrefConstant.email);

    emailController.text = email;
    nameController.text = name;
    addressController.text = address;
    ageController.text = age;
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
                                  hintText: StringConstant.adminname,
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
                                StringConstant.addres,
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
                                controller: addressController,
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
                                StringConstant.ag,
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
                                controller: ageController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
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
                                  hintText: "22",
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
                                  hintText: "+91 8126258665",
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
                                  hintText: "skaushik@st.iitr.ac.in",
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
      formData['age'] = ageController.text.trim();
      formData['address'] = addressController.text.trim();
      formData['userId'] = StringConstant.userId;
      formData['type'] = 'Patient';

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
              PrefConstant.age, jsonData['data']['age'].toString());
          await SharedPreferenceHelper.setString(preference,
              PrefConstant.address, jsonData['data']['address']);
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
    } else if (addressController.text.isEmpty) {
      return 'Address should not empty';
    } else if (ageController.text.isEmpty) {
      return 'Age should not be empty';
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
      title: Text("Alert"),
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
