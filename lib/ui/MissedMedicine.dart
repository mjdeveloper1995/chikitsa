import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:chikitsa/ui/EditPillDetails.dart';

class MissedMedicine extends StatefulWidget {
  @override
  _MissedMedicineState createState() => _MissedMedicineState();
}

class _MissedMedicineState extends State<MissedMedicine> {
  List<SampleStepTile> my_steps = [
    new SampleStepTile(
        title: new Text("3Feb", style: TextStyle(fontSize: 12)), content: new Text("04:00 PM",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black),
        )),
    new SampleStepTile(
        title: new Text("3Feb", style: TextStyle(fontSize: 12)),
        content: new Text("08:00 PM",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black))),
    new SampleStepTile(
        title: new Text("3Feb", style: TextStyle(fontSize: 12)),
        content: new Text("08:00 AM",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black))),
    new SampleStepTile(
        title: new Text("3Feb", style: TextStyle(fontSize: 12)),
        content: new Text("10:00 AM",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black))),
    new SampleStepTile(
        title: new Text("3Feb", style: TextStyle(fontSize: 12)),
        content: new Text("02:00 PM",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black)))
  ];

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
            createUpperBar(context, "Missed Reminder"),
            Expanded(
              child: ListView.builder(
                itemCount: my_steps.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.themecolor,
                                  //this is the important line
                                ),
                                child: Text(
                                  (index + 1).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 8),
                                child: Image.asset(
                                  "assets/images/divider.png",
                                  height: 15,
                                  width: 5,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3),
                            width: SizeConfig.blockSizeHorizontal * 22,
                            child: ListTile(
                                title: my_steps[index].title,
                                subtitle: my_steps[index].content),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 64,
                              height: SizeConfig.blockSizeHorizontal * 38,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: AppColors.whiteColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    35,
                                            margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Medication Name",
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Lato-Regular',
                                                  color: AppColors.blackColor,
                                                  fontSize: 11),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    18,
                                            margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                            ),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              ": Diet Pill",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Lato-Bold',
                                                  color: AppColors.blackColor,
                                                  fontSize: 11),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    35,
                                            margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Medication Quantity",
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Lato-Regular',
                                                  color: AppColors.blackColor,
                                                  fontSize: 11),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    18,
                                            margin: EdgeInsets.only(
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                            ),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              ": 3 Times",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Lato-Bold',
                                                  color: AppColors.blackColor,
                                                  fontSize: 11),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              /* Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home()));*/
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    1,
                                              ),
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  22,
                                              height: SizeConfig
                                                      .blockSizeHorizontal *
                                                  10,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  color: AppColors.takenbutton,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      StringConstant.TAKEN,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Lato-Regular',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14,
                                                          letterSpacing: 1.0),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      EditPillDetails()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    1,
                                              ),
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  32,
                                              height: SizeConfig
                                                      .blockSizeHorizontal *
                                                  10,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  color: AppColors.themecolor,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      StringConstant.RESCHEDULE,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Lato-Regular',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14,
                                                          letterSpacing: 1.0),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
