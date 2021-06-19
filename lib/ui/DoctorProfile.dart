import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/ui/EditDoctorProfile.dart';
import 'package:chikitsa/ui/EditPassword.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String imageUrl = "image";
  File _imageFile;
  String image;
  bool image_value = false;

  String name = '';
  String speciality = '';
  String hospital = '';
  String mobile = '';
  String email = '';


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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createUpperBar(context, "Profile"),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 1),
                    child: Column(
                      children: [
                        image_value == false
                            ? Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2),
                                alignment: Alignment.center,
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: _imageFile != null
                                          ? FileImage(_imageFile)
                                          : AssetImage(
                                              "assets/images/doctor_profile.png")),
                                ),
                              )
                            : Container(
                                width: 120.0,
                                height: 120.0,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: image,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                  ),
                                )),
                        GestureDetector(
                          onTap: () {
                            //showAlert();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
                            alignment: Alignment.topCenter,
                            child: Text(
                              StringConstant.CHANGEPROFILEPHOTO,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato-Bold',
                                  color: AppColors.themecolor,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 80,
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.Profile,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                               await Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditDoctorProfile()));
                               getInitialData();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    right: SizeConfig.blockSizeHorizontal * 5),
                                child: Image.asset(
                                  "assets/images/pen.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            StringConstant.name,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.blackColor,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            name,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.texthintcolor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
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
                            StringConstant.speciality,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.blackColor,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            speciality,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.texthintcolor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
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
                            StringConstant.hospital,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.blackColor,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            hospital,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.texthintcolor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
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
                            StringConstant.mobilenumber,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.blackColor,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                           '+91 $mobile',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.texthintcolor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
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
                            StringConstant.emal,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.blackColor,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            email,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                                color: AppColors.texthintcolor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1),
                            child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),
                        Row(
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 80,
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3,
                                bottom: SizeConfig.blockSizeVertical * 3,
                                left: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                StringConstant.password,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditPassword()));
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    bottom: SizeConfig.blockSizeVertical * 3,
                                    right: SizeConfig.blockSizeHorizontal * 5),
                                child: Image.asset(
                                  "assets/images/pen.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            )
                          ],
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
