import 'package:chikitsa/main.dart';
import 'package:chikitsa/ui/AddMedicine.dart';
import 'package:chikitsa/ui/AllMedications.dart';
import 'package:chikitsa/ui/AllPatient.dart';
import 'package:chikitsa/ui/Appointment.dart';
import 'package:chikitsa/ui/AskingForAppointment.dart';
import 'package:chikitsa/ui/ChangeDoctor.dart';
import 'package:chikitsa/ui/DoctorProfile.dart';
import 'package:chikitsa/ui/MissedMedicine.dart';
import 'package:chikitsa/ui/Profile.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorHome extends StatefulWidget {
  DoctorHome({Key key, this.title});

  final String title;

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(30, 10, 100, 400),
      items: [
        PopupMenuItem(
            value: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DoctorHome()));
                });
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Image.asset(
                      "assets/images/refresh.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text('REFRESH')
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
                });
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Image.asset(
                      "assets/images/logout.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text('LOG OUT')
                ],
              ),
            )),
      ],
      elevation: 8.0,
    );
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/bg_main.png"),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      child: Material(
                        shadowColor: Colors.transparent,
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/images/dr_menu.png",
                            height: 25,
                            width: 25,
                          ),
                          onPressed: _showPopupMenu,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 60,
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 2,
                              top: SizeConfig.blockSizeVertical * 1),
                          child: Text(
                            "Good Morning",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Bold'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeVertical * 2,
                          ),
                          child: Text(
                            "Deepak Sharma",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Bold'),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DoctorProfile()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 5),
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/doctor_profile.png'),
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => AllPatient()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal *1),
                                  width: SizeConfig.blockSizeHorizontal * 31,
                                  height: SizeConfig.blockSizeHorizontal * 28,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      color: AppColors.whiteColor,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/all_patient.png",
                                            height: 40,
                                            width: 40,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical * 2),
                                            child: Text(
                                              StringConstant.allpatient,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Lato-Bold',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  letterSpacing: 1.0),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AskingForAppointment()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal *1),
                                  width: SizeConfig.blockSizeHorizontal * 31,
                                  height: SizeConfig.blockSizeHorizontal * 28,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      color: AppColors.whiteColor,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/doctor_appointment.png",
                                            height: 40,
                                            width: 40,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical * 2),
                                            child: Text(
                                              StringConstant.Appointment,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Lato-Bold',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  letterSpacing: 1.0),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2,
                            ),
                            child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),
                        GestureDetector(
                          onTap: () {
                            /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Home()));*/
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeHorizontal * 3,
                                right: SizeConfig.blockSizeHorizontal * 3),
                            width: MediaQuery.of(context).size.width,
                            height: SizeConfig.blockSizeHorizontal * 20,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(

                                  child: Text(
                                    "47",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        letterSpacing: 1.0),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    StringConstant.totalpatient.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Regular',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        letterSpacing: 1.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),


                   // Quick View


                   /*     Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeVertical * 3,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            StringConstant.quickview,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat-Regular',
                                color: AppColors.blackColor,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3,
                              left: SizeConfig.blockSizeHorizontal * 5,
                              right: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
                              bottom: SizeConfig.blockSizeVertical *2,
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/doctors.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Samita Kaushik",
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Montserrat-Regular',
                                        color: AppColors.blackColor,
                                        fontSize: 16),
                                  ),
                                ),

                              ],
                            )

                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3,
                              left: SizeConfig.blockSizeHorizontal * 5,
                              right: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
                              bottom: SizeConfig.blockSizeVertical *2,
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/hosp.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Fortis Hospital",
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Montserrat-Regular',
                                        color: AppColors.blackColor,
                                        fontSize: 16),
                                  ),
                                ),

                              ],
                            )

                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3,
                              left: SizeConfig.blockSizeHorizontal * 5,
                              right: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
                              bottom: SizeConfig.blockSizeVertical *2,
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/special.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Skin Specialist",
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Montserrat-Regular',
                                        color: AppColors.blackColor,
                                        fontSize: 16),
                                  ),
                                ),

                              ],
                            )

                        ),*/
                      ],
                    ),
                  ),
                ),
              )

            ],
          )),
    );
  }

  getDrawer() {
    return SafeArea(
        child: Container(
      color: AppColors.themecolor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        children: <Widget>[
          SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/notifications.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.Notifications,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => mycart()));*/
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/nearbyhospital.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.NearbyHospitals,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => mycart()));*/
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/appointment.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.Appointment,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Appointment()));
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/changedoctor.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.ChangeAddDoctor,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ChangeDoctor()));
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/covid.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.Covid19Advice,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => mycart()));*/
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/notes.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.Notes,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => mycart()));*/
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/logout.png",
              height: 25,
              width: 25,
            ),
            title: Text(
              StringConstant.Logout,
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat-Bold'),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
              });
            },
          )
        ],
      ),
    ));
  }

  Widget myPopMenu() {
    return PopupMenuButton(
        onSelected: (value) {

        },
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child:Image.asset(
                      "assets/images/refresh.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text('REFRESH')
                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Image.asset(
                      "assets/images/logout.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text('LOG OUT')
                ],
              )),

        ]);
  }
}
