import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chikitsa/ui/EditPassword.dart';
import 'package:chikitsa/ui/EditProfile.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:image_picker/image_picker.dart';

class PatientProfile extends StatefulWidget {
  final String name;
  final String address;
  final String age;
  final String mobile;
  final String email;

  const PatientProfile(
      {this.name, this.address, this.age, this.mobile, this.email});

  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final _formKey = GlobalKey<FormState>();
  String imageUrl = "image";
  File _imageFile;
  String image;
  bool image_value = false;

  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFile = imageFile;
        if (_imageFile != null) {
          setState(() {
            image_value = false;
          });
        }
      });
    } catch (e) {
      print(e);
    }
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
                  child: Form(
                    key: _formKey,
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
                                                "assets/images/dummy.png")),
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
                              widget.name,
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
                              StringConstant.addres,
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
                              widget.address,
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
                              StringConstant.ag,
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
                              widget.age,
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
                              "+91 ${widget.mobile}",
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
                              widget.email,
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
                        ],
                      ),
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

  /* showAlert() {
    showDialog(
      context: context,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        backgroundColor: AppColors.themecolor,
        child: new Container(
          margin: EdgeInsets.all(5),
          width: 300.0,
          height: 300.0,
          */ /*decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),*/ /*
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  */ /* setState(() {
                    image_value = false;
                  });*/ /*
                  captureImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(top:10,left: 15, right: 15),
                  alignment: Alignment.center,
                  height: 50,
                  color: AppColors.whiteColor,
                  child: Text(
                    'Camera ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  */ /* setState(() {
                    image_value = false;
                  });*/ /*
                  captureImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  color: AppColors.whiteColor,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  color: AppColors.whiteColor,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  @override
  void dispose() {
    super.dispose();
  }
}
