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


class EditPillDetails extends StatefulWidget {
  @override
  _EditPillDetailsState createState() => _EditPillDetailsState();
}

class _EditPillDetailsState extends State<EditPillDetails> {
  final _formKey = GlobalKey<FormState>();
  final MedicineNameFocus = FocusNode();
  final ReasonOfTakingFocus = FocusNode();
  String _medicinename;
  String _reasonoftaking;
  String _scheduleRadioBtnVal="0";
  final TextEditingController medicinenameController =
      new TextEditingController();
  final TextEditingController reasonoftakingController =
      new TextEditingController();
  bool MG = true;
  bool G = false;
  bool IU = false;
  bool MCG = false;
  bool _dropdownviewvisible = true;
  DateTime selectedDatefirst = new DateTime(2021 , 02, 03);
  DateTime selectedDatelast = new DateTime(2021 , 02, 10);
  bool _visible = true;
  List medicinetime = [
    "One Time",
    "Two Time",
    "Three Times",
    "Four Times",
    "Only as needed"
  ];

  List weekday = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  String select;
  String textHolder = "Two Time";
  String valueRadio;
  String morning = "10:00 AM";
  String morning0 = "07:15 AM";
  String morning1 = "07:15 AM";
  String morning2 = "07:15 AM";
  String morning3 = "07:15 AM";
  String morning4 = "07:15 AM";
  String morning5 = "07:15 AM";
  String morning6 = "07:15 AM";
  String noon = "07:15 AM";
  String noon0 = "07:15 AM";
  String noon1 = "07:15 AM";
  String noon2 = "07:15 AM";
  String noon3 = "07:15 AM";
  String noon4 = "07:15 AM";
  String noon5 = "07:15 AM";
  String noon6 = "07:15 AM";
  String evening = "05:00 PM";
  String evening0 = "07:15 AM";
  String evening1 = "07:15 AM";
  String evening2 = "07:15 AM";
  String evening3 = "07:15 AM";
  String evening4 = "07:15 AM";
  String evening5 = "07:15 AM";
  String evening6 = "07:15 AM";
  String night = "07:15 AM";
  String night0 = "07:15 AM";
  String night1 = "07:15 AM";
  String night2 = "07:15 AM";
  String night3 = "07:15 AM";
  String night4 = "07:15 AM";
  String night5 = "07:15 AM";
  String night6 = "07:15 AM";
  bool expandFlag0 = false;
  bool expandFlag1 = false;
  bool expandFlag2 = false;
  bool expandFlag3 = false;
  bool expandFlag4 = false;
  bool expandFlag5 = false;
  bool expandFlag6 = false;
  int  selectedRadio = 0;

  Map<String, bool> Lists = {
    'Morning': true,
    'Noon': false,
    'Evening': true,
    'Night': false,
  };

  Map<String, bool> Lists0 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists1 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists2 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists3 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists4 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists5 = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };
  Map<String, bool> Lists6= {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };

  bool _hasBeenPressed = false;

  var holder = [];
  var holder_0 = [];
  var holder_1 = [];
  var holder_2 = [];
  var holder_3 = [];
  var holder_4 = [];
  var holder_5 = [];
  var holder_6 = [];

  getItems() {
    String val;
    Lists.forEach((key, value) {
      if (value == true) {
        holder.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder.clear();
  }

  getItems0() {
    String val;
    Lists0.forEach((key, value) {
      if (value == true) {
        holder_0.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_0.clear();
  }
  getItems1() {
    String val;
    Lists1.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_1.clear();
  }
  getItems2() {
    String val;
    Lists2.forEach((key, value) {
      if (value == true) {
        holder_2.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_2.clear();
  }
  getItems3() {
    String val;
    Lists3.forEach((key, value) {
      if (value == true) {
        holder_3.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_3.clear();
  }
  getItems4() {
    String val;
    Lists4.forEach((key, value) {
      if (value == true) {
        holder_4.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_4.clear();
  }
  getItems5() {
    String val;
    Lists5.forEach((key, value) {
      if (value == true) {
        holder_5.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_5.clear();
  }
  getItems6() {
    String val;
    Lists6.forEach((key, value) {
      if (value == true) {
        holder_6.add(key);
        val = key;
      }
    });
    _selectTime(val);
    holder_6.clear();
  }

  changeText() {
    setState(() {
      textHolder = valueRadio;
    });
  }
  TimeOfDay _time = TimeOfDay(hour: 07, minute: 15);

  void _selectTime(String val) async {
    print("Time: $val");

    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
    if (val == "Noon") {
      if(expandFlag0==true)
      {
        noon0 = _time.format(context);
      }else if(expandFlag1==true)
      {
        noon1 = _time.format(context);
      }else if(expandFlag2==true)
      {
        noon2 = _time.format(context);
      }else if(expandFlag3==true)
      {
        noon3 = _time.format(context);
      }else if(expandFlag4==true)
      {
        noon4 = _time.format(context);
      }else if(expandFlag5==true)
      {
        noon5 = _time.format(context);
      }else if(expandFlag6==true)
      {
        noon6 = _time.format(context);
      }
      else{
        noon = _time.format(context);
      }


    } else
    if (val == "Morning") {
      if(expandFlag0==true)
      {
        morning0 = _time.format(context);
      }else if(expandFlag1==true)
      {
        morning1 = _time.format(context);
      }else if(expandFlag2==true)
      {
        morning2 = _time.format(context);
      }else if(expandFlag3==true)
      {
        morning3 = _time.format(context);
      }else if(expandFlag4==true)
      {
        morning4 = _time.format(context);
      }else if(expandFlag5==true)
      {
        morning5 = _time.format(context);
      }else if(expandFlag6==true)
      {
        morning6 = _time.format(context);
      }
      else{
        morning = _time.format(context);
      }

    }
    else if (val == "Evening") {
      if(expandFlag0==true)
      {
        evening0 = _time.format(context);
      }else if(expandFlag1==true)
      {
        evening1 = _time.format(context);
      }else if(expandFlag2==true)
      {
        evening2 = _time.format(context);
      }else if(expandFlag3==true)
      {
        evening3 = _time.format(context);
      }else if(expandFlag4==true)
      {
        evening4 = _time.format(context);
      }else if(expandFlag5==true)
      {
        evening5 = _time.format(context);
      }else if(expandFlag6==true)
      {
        evening6 = _time.format(context);
      }
      else
      {
        evening = _time.format(context);
      }

    }
    else if (val == "Night") {
      if(expandFlag0==true)
      {
        night0 = _time.format(context);
      }else if(expandFlag1==true)
      {
        night1 = _time.format(context);
      }else if(expandFlag2==true)
      {
        night2 = _time.format(context);
      }else if(expandFlag3==true)
      {
        night3 = _time.format(context);
      }else if(expandFlag4==true)
      {
        night4 = _time.format(context);
      }else if(expandFlag5==true)
      {
        night5 = _time.format(context);
      }else if(expandFlag6==true)
      {
        night6 = _time.format(context);
      }else{
        night = _time.format(context);
      }

    }
  }

  _selectDatefirst(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: selectedDatefirst, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: AppColors.themecolor,
            ),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDatefirst)
      setState(() {
        selectedDatefirst = picked;
      });
  }

  _selectDatelast(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: selectedDatelast, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: AppColors.themecolor,
            ),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDatelast)
      setState(() {
        selectedDatelast = picked;
      });
  }


  @override
  void initState() {
    super.initState();
  }

  void _handleRadioValueChange1(String value) {
    setState(() {
      _scheduleRadioBtnVal = value;
      if (_scheduleRadioBtnVal == "0") {
        _dropdownviewvisible = true;
      } else if (_scheduleRadioBtnVal == "1") {
        _dropdownviewvisible = true;
      } else {
        _dropdownviewvisible = true;
      }
    });
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
            createProfileUpperBar(context, "Diet Pill"),
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
                              top: SizeConfig.blockSizeVertical * 2,
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
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              autofocus: false,
                              focusNode: MedicineNameFocus,
                              controller: medicinenameController,
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
                                    .requestFocus(ReasonOfTakingFocus);
                              },
                              onSaved: (val) => _medicinename = val,
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
                                hintText: "Diet Pill",
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                              ),
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
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              autofocus: false,
                              focusNode: ReasonOfTakingFocus,
                              controller: reasonoftakingController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter reason of taking";
                                else if (val.length <= 2)
                                  return "Please enter valid reason of taking";
                                else
                                  return null;
                              },
                              onSaved: (val) => _reasonoftaking = val,
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
                                hintText: "to lose weight",
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                  right: SizeConfig.blockSizeHorizontal * 8,
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
                                  width: SizeConfig.blockSizeHorizontal * 12,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 1,
                                    right: SizeConfig.blockSizeHorizontal * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  width: SizeConfig.blockSizeHorizontal * 12,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2,
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 1,
                                    right: SizeConfig.blockSizeHorizontal * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  width: SizeConfig.blockSizeHorizontal * 12,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2,
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 1,
                                    right: SizeConfig.blockSizeHorizontal * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  width: SizeConfig.blockSizeHorizontal * 12,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2,
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                    right: SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 1,
                                    right: SizeConfig.blockSizeHorizontal * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                          Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                              ),
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
                        GestureDetector(
                          onTap: () {
                            _selectDatefirst(context);
                          },
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal * 44,
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                right: SizeConfig.blockSizeHorizontal * 2,
                                left: SizeConfig.blockSizeHorizontal * 4,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${selectedDatefirst.toLocal()}"
                                          .split(' ')[0],
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        left: SizeConfig
                                            .blockSizeHorizontal *
                                            2),
                                    child: IconButton(
                                      icon: Image.asset(
                                        "assets/images/date.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectDatelast(context);
                          },
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal * 44,
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 2,
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
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${selectedDatelast.toLocal()}"
                                          .split(' ')[0],
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        left: SizeConfig
                                            .blockSizeHorizontal *
                                            2),
                                    child: IconButton(
                                      icon: Image.asset(
                                        "assets/images/date.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                          Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                              ),
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
                              StringConstant.scheduleoftakingmedicine,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                  color: AppColors.blackColor,
                                  fontSize: 16),
                            ),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: new Radio(
                                  value: "0",
                                  activeColor: AppColors.themecolor,
                                  groupValue: _scheduleRadioBtnVal,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 20,
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5),
                                child: new Text(
                                  'Daily',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5),
                                child: new Radio(
                                  activeColor: AppColors.themecolor,
                                  value: "1",
                                  groupValue: _scheduleRadioBtnVal,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 20,
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5),
                                child: new Text(
                                  'Weekly',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Container()),
                          _dropdownviewvisible == true ? dropdownView() : Container(),
                          Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Container()),
                          _visible == true ? dialogbox() : Container(),

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

  dialogbox() {
    return _scheduleRadioBtnVal == "1" ? weeklyView() : dailyView();
  }

  dropdownView() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 55,
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                bottom: SizeConfig.blockSizeVertical * 1,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Select time in a day",
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (textHolder == "One Time" ||
                                      textHolder == "Two Time" ||
                                      textHolder == "Three Times" ||
                                      textHolder == "Four Times" ||
                                      textHolder == "Only as needed") {
                                    _visible = true;
                                  } else {
                                    _visible = false;
                                  }
                                  changeText();
                                });
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: Image.asset(
                                  "assets/images/cross.png",
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                            child: Divider(
                              color: Colors.black12,
                              thickness: 1,
                            )),

                        /* addRadioButton(0, 'One Time'),
                                                addRadioButton(1, 'Two Time'),
                                                addRadioButton(2, 'Three Times'),
                                                addRadioButton(3, 'Four Times'),
                                                addRadioButton(4, 'Only as needed'),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'One Time',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Radio(
                              activeColor: AppColors.themecolor,
                              value: medicinetime[0],
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  valueRadio = value;
                                  select = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Two Time',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Radio(
                              activeColor: AppColors.themecolor,
                              value: medicinetime[1],
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  valueRadio = value;
                                  select = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Three Times',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Radio(
                              activeColor: AppColors.themecolor,
                              value: medicinetime[2],
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  valueRadio = value;
                                  select = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Four Times',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Radio(
                              activeColor: AppColors.themecolor,
                              value: medicinetime[3],
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  valueRadio = value;
                                  select = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Only as needed',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Bold',
                                    color: AppColors.blackColor,
                                    fontSize: 16),
                              ),
                            ),
                            Radio(
                              activeColor: AppColors.themecolor,
                              value: medicinetime[4],
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  valueRadio = value;
                                  select = value;
                                });
                              },
                            ),
                          ],
                        )
                        /*   Row(
                                                 children: [
                                                   Container(
                                                     width: SizeConfig.blockSizeHorizontal * 50,
                                                     alignment: Alignment.topLeft,
                                                     child: Text(
                                                       "One Time",
                                                       style: TextStyle(
                                                           letterSpacing: 1.0,
                                                           fontWeight: FontWeight.normal,
                                                           fontFamily: 'Lato-Bold',
                                                           color: AppColors.blackColor,
                                                           fontSize: 16),
                                                     ),
                                                   ),
                                                   Container(
                                                     alignment: Alignment.centerRight,
                                                     child: new Radio(
                                                       value: 0,
                                                       activeColor: AppColors.themecolor,
                                                       groupValue: select,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           print(value);
                                                           valueRadio = value;
                                                           select = value;
                                                         });
                                                       },

                                                     ),

                                                   ),
                                                 ],
                                               ),
                                               Row(
                                                 children: [
                                                   Container(
                                                     width: SizeConfig.blockSizeHorizontal * 50,
                                                     alignment: Alignment.topLeft,
                                                     child: Text(
                                                       "Two Time",
                                                       style: TextStyle(
                                                           letterSpacing: 1.0,
                                                           fontWeight: FontWeight.normal,
                                                           fontFamily: 'Lato-Bold',
                                                           color: AppColors.blackColor,
                                                           fontSize: 16),
                                                     ),
                                                   ),
                                                   Container(
                                                     alignment: Alignment.centerRight,
                                                     child: new Radio(
                                                       value: 1,
                                                       activeColor: AppColors.themecolor,
                                                       groupValue: select,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           print(value);
                                                           valueRadio = value;
                                                           select = value;
                                                         });
                                                       },

                                                     ),

                                                   ),
                                                 ],
                                               ),
                                               Row(
                                                 children: [
                                                   Container(
                                                     width: SizeConfig.blockSizeHorizontal * 50,
                                                     alignment: Alignment.topLeft,
                                                     child: Text(
                                                       "Three Times",
                                                       style: TextStyle(
                                                           letterSpacing: 1.0,
                                                           fontWeight: FontWeight.normal,
                                                           fontFamily: 'Lato-Bold',
                                                           color: AppColors.blackColor,
                                                           fontSize: 16),
                                                     ),
                                                   ),
                                                   Container(
                                                     alignment: Alignment.centerRight,
                                                     child: new Radio(
                                                       value: 2,
                                                       activeColor: AppColors.themecolor,
                                                       groupValue: select,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           print(value);
                                                           valueRadio = value;
                                                           select = value;
                                                         });
                                                       },

                                                     ),

                                                   ),
                                                 ],
                                               ),
                                               Row(
                                                 children: [
                                                   Container(
                                                     width: SizeConfig.blockSizeHorizontal * 50,
                                                     alignment: Alignment.topLeft,
                                                     child: Text(
                                                       "Four Times",
                                                       style: TextStyle(
                                                           letterSpacing: 1.0,
                                                           fontWeight: FontWeight.normal,
                                                           fontFamily: 'Lato-Bold',
                                                           color: AppColors.blackColor,
                                                           fontSize: 16),
                                                     ),
                                                   ),
                                                   Container(
                                                     alignment: Alignment.centerRight,
                                                     child: new Radio(
                                                       value: 3,
                                                       activeColor: AppColors.themecolor,
                                                       groupValue: select,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           print(value);
                                                           valueRadio = value;
                                                           select = value;
                                                         });
                                                       },

                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Row(
                                                 children: [
                                                   Container(
                                                     width: SizeConfig.blockSizeHorizontal * 50,
                                                     alignment: Alignment.topLeft,
                                                     child: Text(
                                                       "Only as needed",
                                                       style: TextStyle(
                                                           letterSpacing: 1.0,
                                                           fontWeight: FontWeight.normal,
                                                           fontFamily: 'Lato-Bold',
                                                           color: AppColors.blackColor,
                                                           fontSize: 16),
                                                     ),
                                                   ),
                                                   Container(
                                                     alignment: Alignment.centerRight,
                                                     child:  new Radio(
                                                       value:4,
                                                       activeColor: AppColors.themecolor,
                                                       groupValue: select,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           print(value);
                                                           valueRadio = value;
                                                           select = value;
                                                         });
                                                       },

                                                     ),

                                                   ),
                                                 ],
                                               )*/
                      ],
                    );
                  }));
            });
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1,
            right: SizeConfig.blockSizeHorizontal * 5,
            left: SizeConfig.blockSizeHorizontal * 5,
          ),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal * 75,
                padding:
                EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
                alignment: Alignment.topLeft,
                child: Text(
                  '$textHolder',
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 14),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/down.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              )
            ],
          )),
    );
  }



  weeklyView() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 2,
              left: SizeConfig.blockSizeHorizontal * 6,
              right: SizeConfig.blockSizeHorizontal * 5),
          alignment: Alignment.topLeft,
          child: Text(
            "Medicine time:",
            style: TextStyle(
              letterSpacing: 1.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato-Regular',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[0],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag0
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag0 = !expandFlag0;
                  });
                }),
          ],
        ),
        Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container()),
        expandFlag0 == true ? Expandedview0() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[1],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag1
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag1 = !expandFlag1;
                  });
                }),
          ],
        ),
        Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container()),
        expandFlag1 == true ? Expandedview1() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[2],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag2
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag2 = !expandFlag2;
                  });
                }),
          ],
        ),
        Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container()),
        expandFlag2 == true ? Expandedview2() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[3],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag3
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag3 = !expandFlag3;
                  });
                }),
          ],
        ),
        expandFlag3 == true ? Expandedview3() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[4],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag4
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag4 = !expandFlag4;
                  });
                }),
          ],
        ),
        expandFlag4 == true ? Expandedview4() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[5],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag5
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag5 = !expandFlag5;
                  });
                }),
          ],
        ),
        expandFlag5 == true ? Expandedview5() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[6],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            new IconButton(
                icon: new Container(
                  height: 50.0,
                  width: 50.0,
                  child: new Center(
                    child: new Icon(
                      expandFlag6
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    expandFlag6 = !expandFlag6;
                  });
                }),
          ],
        ),
        expandFlag6 == true ? Expandedview6() : Container(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 1,
              left: SizeConfig.blockSizeHorizontal * 20,
              right: SizeConfig.blockSizeHorizontal * 20,
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
                    StringConstant.SaveMedicine.toUpperCase(),
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

        /*Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *1),
          height: SizeConfig.blockSizeVertical * 60,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                margin: new EdgeInsets.symmetric(vertical: 1.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      color: Colors.transparent,
                      padding: new EdgeInsets.symmetric(horizontal: 5.0),
                      child:
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 10),
                            child: Text(
                              data[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                          new IconButton(
                              icon: new Container(
                                height: 50.0,
                                width: 50.0,
                                child: new Center(
                                  child: new Icon(
                                    expandFlag
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.black87,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  expandFlag = !expandFlag;
                                });
                              }),
                        ],
                      ),
                    ),
                    new ExpandableContainer(
                        expandedHeight: SizeConfig.blockSizeVertical * 35,
                        expanded: expandFlag,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    alignment: Alignment.topLeft,
                                    width: SizeConfig.blockSizeHorizontal * 63,
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      children: Lists.keys.map((String key) {
                                        return Transform.scale(
                                          scale: 1,
                                          child: CheckboxListTile(
                                            controlAffinity:
                                            ListTileControlAffinity.leading,
                                            title: new Text(
                                              key,
                                              style: TextStyle(
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato-Regular',
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            value: Lists[key],
                                            activeColor: AppColors.themecolor,
                                            checkColor: Colors.white,
                                            onChanged: (bool value) {
                                              setState(() {
                                                Lists[key] = value;
                                                getItems();
                                              });
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      alignment: Alignment.topLeft,
                                      width: SizeConfig.blockSizeHorizontal * 32,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical *
                                                    3),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      20,
                                                  child: Text(
                                                    morning == null
                                                        ? _time.format(context)
                                                        : morning,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontFamily: 'Lato-Regular',
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .blockSizeHorizontal *
                                                          2),
                                                  child: Image.asset(
                                                    "assets/images/time.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical *
                                                    5),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      20,
                                                  child: Text(
                                                    noon == null
                                                        ? _time.format(context)
                                                        : noon,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontFamily: 'Lato-Regular',
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .blockSizeHorizontal *
                                                          2),
                                                  child: Image.asset(
                                                    "assets/images/time.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical *
                                                    6),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      20,
                                                  child: Text(
                                                    evening == null
                                                        ? _time.format(context)
                                                        : evening,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontFamily: 'Lato-Regular',
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .blockSizeHorizontal *
                                                          2),
                                                  child: Image.asset(
                                                    "assets/images/time.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig.blockSizeVertical *
                                                    5),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      20,
                                                  child: Text(
                                                    night == null
                                                        ? _time.format(context)
                                                        : night,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        fontFamily: 'Lato-Regular',
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .blockSizeHorizontal *
                                                          2),
                                                  child: Image.asset(
                                                    "assets/images/time.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              );
            },
            itemCount: data.length,
          ),
        )*/
      ],
    );
  }

  dailyView() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
                left: SizeConfig.blockSizeHorizontal * 6,
                right: SizeConfig.blockSizeHorizontal * 5),
            alignment: Alignment.topLeft,
            child: Text(
              "Medicine time:",
              style: TextStyle(
                letterSpacing: 1.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Lato-Regular',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: SizeConfig.blockSizeHorizontal * 63,
                height: SizeConfig.blockSizeVertical * 40,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: Lists.keys.map((String key) {
                    return Transform.scale(
                      scale: 1,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text(
                          key, style: TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Lato-Regular',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        ),
                        value: Lists[key],
                        activeColor: AppColors.themecolor,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            Lists[key] = value;
                            getItems();
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  width: SizeConfig.blockSizeHorizontal * 32,
                  height: SizeConfig.blockSizeVertical * 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 20,
                              child: Text(
                                morning == null
                                    ? _time.format(context)
                                    : morning,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2),
                              child: Image.asset(
                                "assets/images/time.png",
                                height: 20,
                                width: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 20,
                              child: Text(
                                noon == null ? _time.format(context) : noon,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2),
                              child: Image.asset(
                                "assets/images/time.png",
                                height: 20,
                                width: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 20,
                              child: Text(
                                evening == null
                                    ? _time.format(context)
                                    : evening,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2),
                              child: Image.asset(
                                "assets/images/time.png",
                                height: 20,
                                width: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 20,
                              child: Text(
                                night == null ? _time.format(context) : night,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2),
                              child: Image.asset(
                                "assets/images/time.png",
                                height: 20,
                                width: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),

        ],
      ),
    );
  }

  Expandedview0() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists0.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists0[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists0[key] = value;
                      getItems0();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning0 == null
                              ? _time.format(context)
                              : morning0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon0 == null ? _time.format(context) : noon0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening0 == null
                              ? _time.format(context)
                              : evening0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night0 == null ? _time.format(context) : night0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview1() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists1.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists1[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists1[key] = value;
                      getItems1();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning1 == null
                              ? _time.format(context)
                              : morning1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon1 == null ? _time.format(context) : noon1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening1 == null
                              ? _time.format(context)
                              : evening1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night1 == null ? _time.format(context) : night1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview2() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists2.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists2[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists2[key] = value;
                      getItems2();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning2 == null ? _time.format(context) : morning2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon2 == null ? _time.format(context) : noon2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening2 == null
                              ? _time.format(context)
                              : evening2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night2 == null ? _time.format(context) : night2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview3() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists3.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists3[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists3[key] = value;
                      getItems3();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning3 == null
                              ? _time.format(context)
                              : morning3,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon3 == null ? _time.format(context) : noon3,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening3 == null
                              ? _time.format(context)
                              : evening3,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night3 == null ? _time.format(context) : night3,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview4() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists4.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists4[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists4[key] = value;
                      getItems4();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning4 == null
                              ? _time.format(context)
                              : morning4,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon4 == null ? _time.format(context) : noon4,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening4 == null
                              ? _time.format(context)
                              : evening4,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night4 == null ? _time.format(context) : night4,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview5() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists5.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists5[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists5[key] = value;
                      getItems5();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning5 == null
                              ? _time.format(context)
                              : morning5,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon5 == null ? _time.format(context) : noon5,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening5 == null
                              ? _time.format(context)
                              : evening5,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night5 == null ? _time.format(context) : night5,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
  Expandedview6() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: SizeConfig.blockSizeHorizontal * 63,
          height: SizeConfig.blockSizeVertical * 40,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: Lists6.keys.map((String key) {
              return Transform.scale(
                scale: 1,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: new Text(
                    key,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato-Regular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  value: Lists6[key],
                  activeColor: AppColors.themecolor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      Lists6[key] = value;
                      getItems6();
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 32,
            height: SizeConfig.blockSizeVertical * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          morning6 == null
                              ? _time.format(context)
                              : morning6,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          noon6 == null ? _time.format(context) : noon6,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          evening6 == null
                              ? _time.format(context)
                              : evening6,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        child: Text(
                          night6 == null ? _time.format(context) : night6,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Lato-Regular',
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2),
                        child: Image.asset(
                          "assets/images/time.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
