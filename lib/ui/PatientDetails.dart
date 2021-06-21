import 'package:chikitsa/main.dart';
import 'package:chikitsa/ui/Appointment.dart';
import 'package:chikitsa/ui/ChangeDoctor.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/ui/PatientProfile.dart';
import 'package:chikitsa/ui/Patient_AllMedications.dart';
import 'package:chikitsa/ui/Profile.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientDetails extends StatefulWidget {
  PatientDetails({this.id,this.name,this.mobile,this.email,this.age,this.address});

  final String id;
  final String name;
  final String address;
  final String age;
  final String mobile;
  final String email;

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _comment;
  final CommentFocus = FocusNode();
  final TextEditingController commmentController = new TextEditingController();

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    final _formKey = GlobalKey<FormState>();
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
                            "assets/images/back.png",
                            height: 25,
                            width: 25,
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
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
                            "Patient",
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
                            widget.name,
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
                            builder: (BuildContext context) => PatientProfile(
                              mobile: widget.mobile,
                              name: widget.name,
                              email: widget.email,
                              address: widget.address,
                              age: widget.age,
                            )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 5),
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/dummy.png'),
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Patient_AllMedications()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 1),
                        width: SizeConfig.blockSizeHorizontal * 32,
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
                                  "assets/images/allmedication.png",
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    StringConstant.AllMedication,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.normal,
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                            padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                              right:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                            alignment: Alignment.topLeft,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black12,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            child: TextFormField(
                                              maxLines: 4,
                                              autofocus: false,
                                              focusNode: CommentFocus,
                                              controller: commmentController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                letterSpacing: 1.0,
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.normal,
                                                fontFamily:
                                                    'Montserrat-Regular',
                                              ),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontSize: 12.0,
                                                  color: AppColors.blackColor,
                                                  fontFamily:
                                                      "Montserrat-Regular",
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                                hintText:
                                                    "Add some advice to patient",
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    1,
                                              ),
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  60,
                                              height: SizeConfig
                                                      .blockSizeHorizontal *
                                                  15,
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
                                                      StringConstant.Send
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Lato-Regular',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 16,
                                                          letterSpacing: 1.0),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 1),
                        width: SizeConfig.blockSizeHorizontal * 32,
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
                                  "assets/images/notify.png",
                                  height: 30,
                                  width: 30,
                                  color: AppColors.themecolor,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    StringConstant.notify,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.normal,
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
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppColors.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  "Patient Mobile",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Lato-Regular',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      letterSpacing: 1.0),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  launch(
                                      'tel://${widget.mobile ?? ''}');
                                },
                                child: Container(

                                  child: Image.asset(
                                    "assets/images/phone.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  launch(
                                      'tel://${widget.mobile ?? ''}');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal *3),
                                  child: Text(
                                    ": ${widget.mobile}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Regular',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        letterSpacing: 1.0),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
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
                      StringConstant.history,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Lato-Bold',
                          color: AppColors.blackColor,
                          fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3,
                          bottom: SizeConfig.blockSizeVertical * 3,
                          right: SizeConfig.blockSizeHorizontal * 5),
                      child: Image.asset(
                        "assets/images/refresh.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: my_steps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical *2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              children: [
                                Container(
                                  margin:EdgeInsets.only(left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
                                Container(
                                  margin:EdgeInsets.only(top:5,left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
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
                                  margin:EdgeInsets.only(left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
                                Container(
                                  margin:EdgeInsets.only(top:5,left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
                                Container(
                                  margin:EdgeInsets.only(top:5,left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
                                Container(
                                  margin:EdgeInsets.only(top:5,left: 8),
                                  child:  Image.asset(
                                    "assets/images/divider.png",
                                    height: 15,
                                    width: 5,
                                    color: Colors.black87,
                                  ),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *3),
                              width: SizeConfig.blockSizeHorizontal * 22,
                              child: ListTile(
                                  title: my_steps[index].title,
                                  subtitle: my_steps[index].content),
                            ),
                            GestureDetector(
                              onTap: () {

                              },
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width:
                                              SizeConfig.blockSizeHorizontal *
                                                  35,
                                              margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical *
                                                    1,
                                                left:
                                                SizeConfig.blockSizeHorizontal *
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
                                                top: SizeConfig.blockSizeVertical *
                                                    1,
                                                left:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                              ),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                ": Diet Pill",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.normal,
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
                                                top: SizeConfig.blockSizeVertical *
                                                    2,
                                                left:
                                                SizeConfig.blockSizeHorizontal *
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
                                                top: SizeConfig.blockSizeVertical *
                                                    2,
                                                left:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                              ),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                ": 3 Times",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: 'Lato-Bold',
                                                    color: AppColors.blackColor,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            /* Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home()));*/

                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              bottom:
                                              SizeConfig.blockSizeVertical * 1,
                                            ),
                                            width:
                                            SizeConfig.blockSizeHorizontal * 30,
                                            height:
                                            SizeConfig.blockSizeHorizontal * 10,
                                            child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                ),
                                                color: AppColors.themecolor,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "TAKEN",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Lato-Regular',
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontSize: 16,
                                                        letterSpacing: 1.0),
                                                  ),
                                                )),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ]),
                    );
                  },
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
              /*setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Appointment()));
              });*/
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
}
