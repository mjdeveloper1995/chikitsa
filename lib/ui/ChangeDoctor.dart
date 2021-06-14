import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangeDoctor extends StatefulWidget {
  @override
  _ChangeDoctorState createState() => _ChangeDoctorState();
}

class _ChangeDoctorState extends State<ChangeDoctor> {
  final _formKey = GlobalKey<FormState>();
  final _forKey = GlobalKey<FormState>();
  final NameFocus = FocusNode();
  final HospitalFocus = FocusNode();
  final SpecialityFocus = FocusNode();
  final MobileFocus = FocusNode();

  bool isLoading = false;
  bool isToggled = false;
  bool _confirmPassword = false;

  String _name;
  String _hospital;
  String _speciality;
  String _mobile;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController specialityController = new TextEditingController();
  final TextEditingController hospitalController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();

  bool _showPassword = false;
  bool _visible = false;
 // bool viewVisible = false;

 /* void showWidget() {
    setState(() {
      if (isToggled) {
        viewVisible = true;
      } else {
        viewVisible = false;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createUpperBar(context, "Change Doctor"),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 1),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: SizeConfig.blockSizeHorizontal *35,
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
                                      left: SizeConfig.blockSizeHorizontal *5,
                                      right: SizeConfig.blockSizeHorizontal *5),
                                  child: Image.asset(
                                    "assets/images/changedoctor.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    "assets/images/doctor.png",
                                    height:80,
                                    width: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
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
                                child: TextFormField(
                                  autofocus: false,
                                  focusNode: MobileFocus,
                                  controller: mobileController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val.length == 0)
                                      return "Please enter mobile number";
                                    else if (val.length <= 11)
                                      return "Please enter valid mobile number";
                                    else
                                      return null;
                                  },
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context)
                                        .requestFocus(NameFocus);
                                  },
                                  onSaved: (val) => _mobile = val,
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
                              top: SizeConfig.blockSizeVertical *2,
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
                            child: TextFormField(
                              autofocus: false,
                              focusNode: NameFocus,
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter name";
                                else if (val.length <= 2)
                                  return "Please enter valid name";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(HospitalFocus);
                              },
                              onSaved: (val) => _name = val,
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
                            child: TextFormField(
                              autofocus: false,
                              focusNode: HospitalFocus,
                              controller: hospitalController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter hospital";
                                else if (val.length <= 2)
                                  return "Please enter valid hospital";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(SpecialityFocus);
                              },
                              onSaved: (val) => _hospital = val,
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
                            child: TextFormField(
                              autofocus: false,
                              focusNode: SpecialityFocus,
                              controller: specialityController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter speciality";
                                else if (val.length <= 3)
                                  return "Please enter valid speciality";
                                else
                                  return null;
                              },

                              onSaved: (val) => _speciality = val,
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home()));
                            },
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
                                      StringConstant.CHANGEDOCTOR.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Lato-Regular',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          letterSpacing: 1.0),
                                    ),
                                  )),
                            ) ,
                          )


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

}
