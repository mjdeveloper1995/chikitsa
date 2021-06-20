import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/main.dart';
import 'package:chikitsa/ui/AddSchedule.dart';
import 'package:chikitsa/ui/AllMedications.dart';
import 'package:chikitsa/ui/ChangeDoctor.dart';
import 'package:chikitsa/ui/MissedMedicine.dart';
import 'package:chikitsa/ui/Notifications.dart';
import 'package:chikitsa/ui/PatientAppointment.dart';
import 'package:chikitsa/ui/Profile.dart';
import 'package:chikitsa/ui/covid_screen.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title});

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showFab = true;
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

  final reasonOfTakingFocus = FocusNode();
  final medicineNameFocus = FocusNode();

  String _reasonOfTaking;
  String _medicineName;

  final TextEditingController reasonOfTakingController =
      new TextEditingController();
  final TextEditingController medicineNameController =
      new TextEditingController();

  bool _hasBeenPressed = false;
  bool MG = false;
  bool G = false;
  bool IU = false;
  bool MCG = false;

  String id = '';
  String name = '';
  String doctorMobile = '';
  String doctorName = '';


  Future<void> logout() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    await SharedPreferenceHelper.setString(preference, PrefConstant.type, '');
    await SharedPreferenceHelper.setString(preference, PrefConstant.id, '');
    await SharedPreferenceHelper.setString(preference, PrefConstant.name, '');
    await SharedPreferenceHelper.setString(
        preference, PrefConstant.hospital, '');
    await SharedPreferenceHelper.setString(
        preference, PrefConstant.speciality, '');
    await SharedPreferenceHelper.setString(preference, PrefConstant.email, '');
    await SharedPreferenceHelper.setString(preference, PrefConstant.phone, '');
    await SharedPreferenceHelper.setString(
        preference, PrefConstant.patients, '0');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (route) => false);
  }


  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  Future<void> getInitialData() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    id = SharedPreferenceHelper.getPrefString(preference, PrefConstant.id);
    name = SharedPreferenceHelper.getPrefString(preference, PrefConstant.name);
    doctorMobile = SharedPreferenceHelper.getPrefString(preference, PrefConstant.doctorPhone);
    doctorName = SharedPreferenceHelper.getPrefString(preference, PrefConstant.doctorName);

    StringConstant.userId = id;
    setState(() {});
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
                height: MediaQuery.of(context).size.height * 80,
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: new AssetImage("assets/images/bg_img.png"),
                  fit: BoxFit.fill,
                )), //could change this to Color(0xFF737373),

                child: Column(
                  children: [
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
                            StringConstant.addnewmedicine,
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Bold',
                                color: AppColors.blackColor,
                                fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 3,
                                bottom: SizeConfig.blockSizeVertical * 3,
                                right: SizeConfig.blockSizeHorizontal * 5),
                            child: Image.asset(
                              "assets/images/cross.png",
                              height: 15,
                              width: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Container(
                      child: SingleChildScrollView(
                        child: Form(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 8,
                                    right: SizeConfig.blockSizeHorizontal * 8,
                                  ),
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3,
                                    right: SizeConfig.blockSizeHorizontal * 3,
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
                                    focusNode: medicineNameFocus,
                                    controller: medicineNameController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    validator: (val) {
                                      if (val.length == 0)
                                        return "Please enter medicine name";
                                      else if (val.length <= 2)
                                        return "Please enter valid medicine name";
                                      else
                                        return null;
                                    },
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(reasonOfTakingFocus);
                                    },
                                    onSaved: (val) => _medicineName = val,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Colors.black87,
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
                                        fontFamily: 'Lato-Regular',
                                      ),
                                      hintText: StringConstant.medicinename,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    left: SizeConfig.blockSizeHorizontal * 8,
                                    right: SizeConfig.blockSizeHorizontal * 8,
                                  ),
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3,
                                    right: SizeConfig.blockSizeHorizontal * 3,
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
                                    focusNode: reasonOfTakingFocus,
                                    maxLines: 3,
                                    controller: reasonOfTakingController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    validator: (val) {
                                      if (val.length == 0)
                                        return "Please enter reason of taking";
                                      else if (val.length <= 2)
                                        return "Please enter reason of taking";
                                      else
                                        return null;
                                    },
                                    onSaved: (val) => _reasonOfTaking = val,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Colors.black87,
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
                                        fontFamily: 'Lato-Regular',
                                      ),
                                      hintText: StringConstant.reasonoftaking,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 8,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 5,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        StringConstant.selectdose,
                                        style: TextStyle(
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Lato-Bold',
                                            color: AppColors.blackColor,
                                            fontSize: 14),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          MG = true;
                                          G = false;
                                          IU = false;
                                          MCG = false;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 12,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 1,
                                          left: SizeConfig.blockSizeHorizontal *
                                              1,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  1,
                                          bottom:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: MG
                                              ? AppColors.themecolor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.black12,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          "MG",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato-Bold',
                                              color: AppColors.blackColor,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          MG = false;
                                          G = true;
                                          IU = false;
                                          MCG = false;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 12,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 1,
                                          left: SizeConfig.blockSizeHorizontal *
                                              1,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  1,
                                          bottom:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: G
                                              ? AppColors.themecolor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.black12,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          "G",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato-Bold',
                                              color: AppColors.blackColor,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          MG = false;
                                          G = false;
                                          IU = true;
                                          MCG = false;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 12,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 1,
                                          left: SizeConfig.blockSizeHorizontal *
                                              1,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  1,
                                          bottom:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: IU
                                              ? AppColors.themecolor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.black12,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          "IU",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato-Bold',
                                              color: AppColors.blackColor,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          MG = false;
                                          G = false;
                                          IU = false;
                                          MCG = true;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 12,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 1,
                                          left: SizeConfig.blockSizeHorizontal *
                                              1,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  1,
                                          bottom:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: MCG
                                              ? AppColors.themecolor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.black12,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          "MCG",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Lato-Bold',
                                              color: AppColors.blackColor,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AddSchedule()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    width: SizeConfig.blockSizeHorizontal * 60,
                                    height: SizeConfig.blockSizeHorizontal * 14,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: AppColors.themecolor,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            StringConstant.addschedule
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Lato-Regular',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                letterSpacing: 1.0),
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: getDrawer(),
      ),
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
                            "assets/images/menu.png",
                            height: 25,
                            width: 25,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
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
                            name,
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
                      onTap: () async{
                       await Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Profile()));
                       getInitialData();
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
                        /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddMedicine()));*/
                        _modalBottomSheetMenu();
                      },
                      child: Container(
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
                                  "assets/images/addmedicine.png",
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    StringConstant.AddMedicine,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
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
                                AllMedications()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 1,
                            right: SizeConfig.blockSizeHorizontal * 1),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
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
                                MissedMedicine()));
                      },
                      child: Container(
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
                                  "assets/images/missedmedicine.png",
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Text(
                                    StringConstant.MissedMedicine,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
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
                  /*Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Home()));*/
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3),
                  width: MediaQuery.of(context).size.width,
                  height: SizeConfig.blockSizeHorizontal * 28,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppColors.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  "Doctor Name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Lato-Regular',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      letterSpacing: 1.0),
                                ),
                              ),
                            /*  SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 26,
                              ),*/
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3,
                                    top: SizeConfig.blockSizeVertical * 3),
                                child: Text(
                                  ": $doctorName",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Lato-Regular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1.0),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  "Doctor Mobile",
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
                                  if(doctorMobile == '')
                                    return;
                                  launch(
                                      'tel://${doctorMobile ?? ''}');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  child: Image.asset(
                                    "assets/images/phone.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3,
                                    right: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  ": $doctorMobile",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Lato-Regular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1.0),
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
                      StringConstant.yourhistory,
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
                                    style:
                                        TextStyle(color: AppColors.whiteColor),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  35,
                                              margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Lato-Regular',
                                                    color: AppColors.blackColor,
                                                    fontSize: 11),
                                              ),
                                            ),
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  18,
                                              margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
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
                                                    fontWeight:
                                                        FontWeight.bold,
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  35,
                                              margin: EdgeInsets.only(
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                top: SizeConfig
                                                        .blockSizeVertical *
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Lato-Regular',
                                                    color: AppColors.blackColor,
                                                    fontSize: 11),
                                              ),
                                            ),
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  18,
                                              margin: EdgeInsets.only(
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                top: SizeConfig
                                                        .blockSizeVertical *
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
                                                    fontWeight:
                                                        FontWeight.bold,
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
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    30,
                                            height:
                                                SizeConfig.blockSizeHorizontal *
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
                                                    "TAKEN",
                                                    textAlign: TextAlign.center,
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Notifications()));
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
              setState(() async{
                const String url =
                    'https://www.google.co.in/maps/search/nearby+hospitals';
                if (await canLaunch(url))
                await launch(url);
                else
                // can't launch url, there is some error
                throw 'Could not launch $url';
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
                    builder: (BuildContext context) => PatientAppointment()));
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
              setState(() async{
               await Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ChangeDoctor()));
               getInitialData();
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
              setState(() async{
                 await Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => CovidScreen()));
                  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                logout();
               /* Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));*/
              });
            },
          )
        ],
      ),
    ));
  }
}

class SampleStepTile {
  SampleStepTile({Key key, this.title, this.content});

  Text title;
  Text content;
}
