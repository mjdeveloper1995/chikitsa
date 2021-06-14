import 'package:chikitsa/ui/DietPillDetails.dart';
import 'package:chikitsa/ui/EditPillDetails.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllMedications extends StatefulWidget {
  @override
  _AllMedicationsState createState() => _AllMedicationsState();
}

class _AllMedicationsState extends State<AllMedications> {
  _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(80, 70, 40, 400),
      items: [
        PopupMenuItem(
            value: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        EditPillDetails()));
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.edit),
                  ),
                  Text('EDIT')
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.pause_circle_outline),
                  ),
                  Text('SUSPEND')
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.delete),
                  ),
                  Text('DELETE')
                ],
              ),
            ))
      ],
      elevation: 8.0,
    );
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
            /*  Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *5),
                            child:  Image.asset(
                              "assets/images/allmedication.png",
                              height: 80,
                              width: 80,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *10,
                            ),
                            alignment: Alignment.topCenter,
                            child: Text(
                              StringConstant.NOMEDICATIONWASADDED,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Montserrat-Regular',
                                  color: AppColors.themecolor,
                                  fontSize: 18),
                            ),
                          ),*/
            createUpperBar(context, "All Medications"),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: AppColors.whiteColor,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 2,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DietPillDetails()));
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 100,
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2,
                            right: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          child: Card(
                            color: AppColors.whiteColor,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 3,
                                right: SizeConfig.blockSizeHorizontal * 3,
                                top: SizeConfig.blockSizeVertical * 1,
                                bottom: SizeConfig.blockSizeVertical * 1,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                    ),
                                    child: Text(
                                      (index+1).toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'Lato-Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 1.0),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                    ),
                                    child: Image.asset(
                                      "assets/images/phill.png",
                                      height: 30,
                                      width: 30,
                                      color: AppColors.themecolor,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50,
                                        margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              5,
                                        ),
                                        child: Text(
                                          "Diet Pill",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: 'Lato-Bold',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              letterSpacing: 1.0),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical *
                                              0.5,
                                          left: SizeConfig.blockSizeHorizontal *
                                              5,
                                        ),
                                        child: Text(
                                          "325 MG",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Lato-Bold',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              letterSpacing: 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                      child: Material(
                                        shadowColor: Colors.transparent,
                                        color: Colors.transparent,
                                        child: IconButton(
                                          icon: Image.asset(
                                            "assets/images/dr_menu.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                          onPressed: _showPopupMenu,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
