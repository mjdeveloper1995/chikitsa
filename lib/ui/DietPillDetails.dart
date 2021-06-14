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
import 'package:fluttertoast/fluttertoast.dart';

class DietPillDetails extends StatefulWidget {
  @override
  _DietPillDetailsState createState() => _DietPillDetailsState();
}

class _DietPillDetailsState extends State<DietPillDetails> {
  final _formKey = GlobalKey<FormState>();


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
            createUpperBar(context, "Diet Pill"),
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
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.medicinename,
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
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Diet Pill",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.texthintcolor,
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,),
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
                              StringConstant.reasonoftaking,
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
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "to lose weight",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.texthintcolor,
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,),
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
                              StringConstant.dosetype,
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
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "MG",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.texthintcolor,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,),
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
                              StringConstant.treatmentduration,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.blackColor,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 40,
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "2021-02-03",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "to",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "2021-02-10",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          )
,
                          Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                              ),
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
                              StringConstant.scheduleoftakingmedicine,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.blackColor,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 62,
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Daily :",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Two Time",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          )
,
                          Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,),
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
                              StringConstant.medicinetime,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.blackColor,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 65,
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3,
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Morning",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3,
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "10:00 AM",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 65,
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 3,
                                  top: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Evening",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockSizeVertical * 3,
                                  top: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "05:00 PM",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Bold',
                                      color: AppColors.blackColor,
                                      fontSize: 14),
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
