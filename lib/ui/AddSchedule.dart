import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/podo/timelist.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSchedule extends StatefulWidget {
  AddSchedule(this.medicineName, this.reason, this.dose);

  final String medicineName;
  final String reason;
  final String dose;

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _formKey = GlobalKey<FormState>();
  final _forKey = GlobalKey<FormState>();

  DateTime selectedDatefirst = DateTime.now();
  DateTime selectedDatelast = DateTime.now();
  bool _visible = false;
  bool _dropdownviewvisible = false;
  List medicinetime = [
    "One Time",
    "Two Time",
    "Three Times",
    "Four Times",
    "Only as needed"
  ];

  List medicinetimeWeek = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
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
  String textHolder = "Select no of times";
  String textHolderWeek = "Select no of day in week";
  String valueRadio;
  String valueRadioWeek;
  String _scheduleRadioBtnVal;
  String morning = "07:15 ";
  String morning0 = "07:15";
  String morning1 = "07:15";
  String morning2 = "07:15";
  String morning3 = "07:15";
  String morning4 = "07:15";
  String morning5 = "07:15";
  String morning6 = "07:15";
  String noon = "07:15 ";
  String noon0 = "07:15";
  String noon1 = "07:15";
  String noon2 = "07:15";
  String noon3 = "07:15";
  String noon4 = "07:15";
  String noon5 = "07:15";
  String noon6 = "07:15";
  String evening = "07:15 ";
  String evening0 = "07:15";
  String evening1 = "07:15";
  String evening2 = "07:15";
  String evening3 = "07:15";
  String evening4 = "07:15";
  String evening5 = "07:15";
  String evening6 = "07:15";
  String night = "07:15 ";
  String night0 = "07:15";
  String night1 = "07:15";
  String night2 = "07:15";
  String night3 = "07:15";
  String night4 = "07:15";
  String night5 = "07:15";
  String night6 = "07:15";
  bool expandFlag0 = false;
  bool expandFlag1 = false;
  bool expandFlag2 = false;
  bool expandFlag3 = false;
  bool expandFlag4 = false;
  bool expandFlag5 = false;
  bool expandFlag6 = false;
  int selectedRadio = 0;

  Map<String, bool> Lists = {
    'Morning': false,
    'Noon': false,
    'Evening': false,
    'Night': false,
  };

  Map<String, bool> ListsWeek = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
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
  Map<String, bool> Lists6 = {
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
    Lists.forEach((key, value) {
      Lists[key] = false;
    });
    setState(() {
      textHolder = valueRadio;
      _visible = true;
    });
  }

  changeTextWeek() {
    ListsWeek.forEach((key, value) {
      ListsWeek[key] = false;
    });
    setState(() {
      textHolderWeek = valueRadioWeek;
      expandFlag0 = false;
      expandFlag1 = false;
      expandFlag2 = false;
      expandFlag3 = false;
      expandFlag4 = false;
      expandFlag5 = false;
      expandFlag6 = false;
      _visible = true;
    });
  }

  bool isLoading = false;

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

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: SizeConfig.blockSizeHorizontal * 50,
          alignment: Alignment.topLeft,
          child: Text(
            title,
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
          value: medicinetime[btnValue],
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
    );
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
      if (expandFlag0 == true) {
        noon0 = _time.format(context);
      } else if (expandFlag1 == true) {
        noon1 = _time.format(context);
      } else if (expandFlag2 == true) {
        noon2 = _time.format(context);
      } else if (expandFlag3 == true) {
        noon3 = _time.format(context);
      } else if (expandFlag4 == true) {
        noon4 = _time.format(context);
      } else if (expandFlag5 == true) {
        noon5 = _time.format(context);
      } else if (expandFlag6 == true) {
        noon6 = _time.format(context);
      } else {
        noon = _time.format(context);
      }
    } else if (val == "Morning") {
      if (expandFlag0 == true) {
        morning0 = _time.format(context);
      } else if (expandFlag1 == true) {
        morning1 = _time.format(context);
      } else if (expandFlag2 == true) {
        morning2 = _time.format(context);
      } else if (expandFlag3 == true) {
        morning3 = _time.format(context);
      } else if (expandFlag4 == true) {
        morning4 = _time.format(context);
      } else if (expandFlag5 == true) {
        morning5 = _time.format(context);
      } else if (expandFlag6 == true) {
        morning6 = _time.format(context);
      } else {
        morning = _time.format(context);
      }
    } else if (val == "Evening") {
      if (expandFlag0 == true) {
        evening0 = _time.format(context);
      } else if (expandFlag1 == true) {
        evening1 = _time.format(context);
      } else if (expandFlag2 == true) {
        evening2 = _time.format(context);
      } else if (expandFlag3 == true) {
        evening3 = _time.format(context);
      } else if (expandFlag4 == true) {
        evening4 = _time.format(context);
      } else if (expandFlag5 == true) {
        evening5 = _time.format(context);
      } else if (expandFlag6 == true) {
        evening6 = _time.format(context);
      } else {
        evening = _time.format(context);
      }
    } else if (val == "Night") {
      if (expandFlag0 == true) {
        night0 = _time.format(context);
      } else if (expandFlag1 == true) {
        night1 = _time.format(context);
      } else if (expandFlag2 == true) {
        night2 = _time.format(context);
      } else if (expandFlag3 == true) {
        night3 = _time.format(context);
      } else if (expandFlag4 == true) {
        night4 = _time.format(context);
      } else if (expandFlag5 == true) {
        night5 = _time.format(context);
      } else if (expandFlag6 == true) {
        night6 = _time.format(context);
      } else {
        night = _time.format(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createUpperBar(context, "Add Schedule"),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 1,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  StringConstant.TreatmentDuration,
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.bold,
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
                                  top: SizeConfig.blockSizeVertical * 2,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  StringConstant.ScheduleoftakingMedicine,
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato-Regular',
                                      color: AppColors.blackColor,
                                      fontSize: 16),
                                ),
                              ),
                              Row(
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
                              _dropdownviewvisible == true
                                  ? _scheduleRadioBtnVal == "1"
                                      ? dropdownViewWeek()
                                      : dropdownView()
                                  : Container(),
                              _visible == true
                                  ? _scheduleRadioBtnVal == "1"
                                      ? weeklyView()
                                      : dailyView()
                                  : Container(),
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
          if(isLoading)
            LoadingWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _selectDatefirst(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: selectedDatefirst,
      // Refer step 1
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
      initialDate: selectedDatelast,
      // Refer step 1
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
            'Select ' +
                '$textHolderWeek' +
                ' days in a Week and set their time of Medicine :',
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
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[0],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag0) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag0 = !expandFlag0;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag0 = !expandFlag0;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag0 == true ? Expandedview0() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[1],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag1) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag1 = !expandFlag1;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag1 = !expandFlag1;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag1 == true ? Expandedview1() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[2],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag2) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag2 = !expandFlag2;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag2 = !expandFlag2;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag2 == true ? Expandedview2() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[3],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag3) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag3 = !expandFlag3;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag3 = !expandFlag3;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag3 == true ? Expandedview3() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[4],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag4) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag4 = !expandFlag4;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag4 = !expandFlag4;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag4 == true ? Expandedview4() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[5],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag5) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag5 = !expandFlag5;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag5 = !expandFlag5;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag5 == true ? Expandedview5() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 10),
              child: Text(
                weekday[6],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: IconButton(
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
                    if (!expandFlag6) {
                      if (alreadyCheckCountForWeekly() < checkForWeekly()) {
                        setState(() {
                          expandFlag6 = !expandFlag6;
                        });
                      } else {
                        showAlertDialog(
                            context, 'Select $textHolderWeek days in a week');
                      }
                    } else {
                      setState(() {
                        expandFlag6 = !expandFlag6;
                      });
                    }
                  }),
            ),
          ],
        ),
        expandFlag6 == true ? Expandedview6() : Container(),
        GestureDetector(
          onTap: () {
            onWeeklySubmit();
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
      ],
    );
  }

  dialogbox() {
    return _scheduleRadioBtnVal == "1" ? Container() : dailyView();
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
              'Select ' +
                  '$textHolder' +
                  ' in a day and set their time of Medicine :',
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
                          if (value) {
                            if (alreadyCheckCountForDaily() < checkForDaily()) {
                              setState(() {
                                Lists[key] = value;
                                getItems();
                              });
                            } else {
                              showAlertDialog(
                                  context, 'Select only $textHolder in a day');
                            }
                          } else {
                            setState(() {
                              Lists[key] = value;
                            });
                          }
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
          GestureDetector(
            onTap: () {
              onDailySubmit();
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
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int checkForDaily() {
    int allowCount = 0;
    if (textHolder == 'One Time') {
      allowCount = 1;
    } else if (textHolder == 'Two Time') {
      allowCount = 2;
    } else if (textHolder == 'Three Times') {
      allowCount = 3;
    } else if (textHolder == 'Four Times') {
      allowCount = 4;
    } else {
      allowCount = 4;
    }
    return allowCount;
  }

  int alreadyCheckCountForDaily() {
    int alreadyCheck = 0;
    Lists.forEach((key, value) {
      if (value == true) {
        alreadyCheck++;
      }
    });
    return alreadyCheck;
  }

  int checkForWeekly() {
    int allowCount = 0;
    if (textHolderWeek == '1') {
      allowCount = 1;
    } else if (textHolderWeek == '2') {
      allowCount = 2;
    } else if (textHolderWeek == '3') {
      allowCount = 3;
    } else if (textHolderWeek == '4') {
      allowCount = 4;
    } else if (textHolderWeek == '5') {
      allowCount = 5;
    } else if (textHolderWeek == '6') {
      allowCount = 6;
    } else if (textHolderWeek == '7') {
      allowCount = 7;
    }
    return allowCount;
  }

  int alreadyCheckCountForWeekly() {
    int alreadyCheck = 0;
    if (expandFlag0) {
      alreadyCheck++;
    }
    if (expandFlag1) {
      alreadyCheck++;
    }
    if (expandFlag2) {
      alreadyCheck++;
    }
    if (expandFlag3) {
      alreadyCheck++;
    }
    if (expandFlag4) {
      alreadyCheck++;
    }
    if (expandFlag5) {
      alreadyCheck++;
    }
    if (expandFlag6) {
      alreadyCheck++;
    }
    return alreadyCheck;
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
                        Container(
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
                        )
                      ],
                    ),
                    Container(
                        child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    )),
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
                            Navigator.of(context).pop();
                            changeText();
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
                            Navigator.of(context).pop();
                            changeText();
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
                            changeText();
                            Navigator.of(context).pop();
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
                            Navigator.of(context).pop();
                            changeText();
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
                            Navigator.of(context).pop();
                            changeText();
                          },
                        ),
                      ],
                    )
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

  dropdownViewWeek() {
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
                            "Select no of days in a week",
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
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              bottom: SizeConfig.blockSizeVertical * 1,
                              left: SizeConfig.blockSizeHorizontal * 3),
                          child: Image.asset(
                            "assets/images/cross.png",
                            height: 15,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                    Container(
                        child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 50,
                          alignment: Alignment.topLeft,
                          child: Text(
                            '1',
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
                          value: medicinetimeWeek[0],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
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
                            '2',
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
                          value: medicinetimeWeek[1],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
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
                            '3',
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
                          value: medicinetimeWeek[2],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            changeTextWeek();
                            Navigator.of(context).pop();
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
                            '4',
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
                          value: medicinetimeWeek[3],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
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
                            '5',
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
                          value: medicinetimeWeek[4],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
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
                            '6',
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
                          value: medicinetimeWeek[5],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
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
                            '7',
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
                          value: medicinetimeWeek[6],
                          groupValue: select,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              valueRadioWeek = value;
                              select = value;
                            });
                            Navigator.of(context).pop();
                            changeTextWeek();
                          },
                        ),
                      ],
                    ),
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
                  '$textHolderWeek',
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

  int alreadyCheckExpand(Map<String, bool> list) {
    int alreadyCheck = 0;
    list.forEach((key, value) {
      if (value == true) {
        alreadyCheck++;
      }
    });
    return alreadyCheck;
  }

  void clearList(Map<String, bool> list) {
    list.forEach((key, value) {
      list[key] = false;
    });
  }

  Expandedview0() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView1(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists0) < drop1) {
                            setState(() {
                              Lists0[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop1 times');
                          }
                        } else {
                          setState(() {
                            Lists0[key] = value;
                          });
                        }
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
                          top: SizeConfig.blockSizeVertical * 5.5),
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
        ),
      ],
    );
  }

  Expandedview1() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView2(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists1) < drop2) {
                            setState(() {
                              Lists1[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop2 times');
                          }
                        } else {
                          setState(() {
                            Lists1[key] = value;
                          });
                        }
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
        ),
      ],
    );
  }

  Expandedview2() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView3(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists2) < drop3) {
                            setState(() {
                              Lists2[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop3 times');
                          }
                        } else {
                          setState(() {
                            Lists2[key] = value;
                          });
                        }
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
                              morning2 == null
                                  ? _time.format(context)
                                  : morning2,
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
        ),
      ],
    );
  }

  Expandedview3() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView4(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists3) < drop4) {
                            setState(() {
                              Lists3[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop4 times');
                          }
                        } else {
                          setState(() {
                            Lists3[key] = value;
                          });
                        }
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
        ),
      ],
    );
  }

  Expandedview4() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView5(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists4) < drop5) {
                            setState(() {
                              Lists4[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop5 times');
                          }
                        } else {
                          setState(() {
                            Lists4[key] = value;
                          });
                        }
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
        ),
      ],
    );
  }

  Expandedview5() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView6(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists5) < drop6) {
                            setState(() {
                              Lists5[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop6 times');
                          }
                        } else {
                          setState(() {
                            Lists5[key] = value;
                          });
                        }
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
        ),
      ],
    );
  }

  Expandedview6() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          child: expandDropdownView7(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              width: SizeConfig.blockSizeHorizontal * 60,
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
                        if (value) {
                          if (alreadyCheckExpand(Lists6) < drop7) {
                            setState(() {
                              Lists6[key] = value;
                              getItems0();
                            });
                          } else {
                            showAlertDialog(
                                context, 'select only $drop7 times');
                          }
                        } else {
                          setState(() {
                            Lists6[key] = value;
                          });
                        }
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
        ),
      ],
    );
  }

  expandDropdownView1() {
    return DropdownButton(
        value: drop1,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists0);
          setState(() {
            drop1 = value;
          });
        });
  }

  expandDropdownView2() {
    return DropdownButton(
        value: drop2,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists1);
          setState(() {
            drop2 = value;
          });
        });
  }

  expandDropdownView3() {
    return DropdownButton(
        value: drop3,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists2);
          setState(() {
            drop3 = value;
          });
        });
  }

  expandDropdownView4() {
    return DropdownButton(
        value: drop4,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists3);
          setState(() {
            drop4 = value;
          });
        });
  }

  expandDropdownView5() {
    return DropdownButton(
        value: drop5,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists4);
          setState(() {
            drop5 = value;
          });
        });
  }

  expandDropdownView6() {
    return DropdownButton(
        value: drop6,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists5);
          setState(() {
            drop6 = value;
          });
        });
  }

  expandDropdownView7() {
    return DropdownButton(
        value: drop7,
        isExpanded: true,
        items: [
          DropdownMenuItem(child: Text("One Time"), value: 1),
          DropdownMenuItem(child: Text("Two Time"), value: 2),
          DropdownMenuItem(child: Text("Three Times"), value: 3),
          DropdownMenuItem(child: Text("Four Times"), value: 4),
          DropdownMenuItem(child: Text("Five Times"), value: 5),
        ],
        onChanged: (value) {
          clearList(Lists6);
          setState(() {
            drop7 = value;
          });
        });
  }

  int drop1 = 1;
  int drop2 = 1;
  int drop3 = 1;
  int drop4 = 1;
  int drop5 = 1;
  int drop6 = 1;
  int drop7 = 1;

  Future<void> onDailySubmit() async {
    setState(() {
      isLoading = true;
    });
    TimeList timeList = TimeList();
    timeList.day = 'All';
    timeList.occurance = [];

    Lists.forEach((key, value) {
      if (value) {
        Occurance occurance = Occurance();
        occurance.type = key;
        occurance.time = key == 'Morning'
            ? morning
            : key == 'Noon'
                ? noon
                : key == 'Evening'
                    ? evening
                    : night;
        occurance.time_type = "PM";
        timeList.occurance.add(occurance);
      }
    });

    MedData medData = MedData();
    medData.timList = [timeList];

    final formData = new Map<String, dynamic>();

    formData['name'] = widget.medicineName;
    formData['reason'] = widget.reason;
    formData['dose'] = widget.dose;
    formData['from'] = "${selectedDatefirst.toLocal()}".split(' ')[0];
    formData['to'] = "${selectedDatelast.toLocal()}".split(' ')[0];
    formData['schedule'] = 'Daily';
    formData['frequency'] = textHolder;
    formData['patientId'] = StringConstant.userId;
    formData['time'] = jsonEncode(medData.toJson());

    print(formData.toString());

    final response = await DoctorService.addMedicine(formData);
    print(response.statusCode);
    print(response.body);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home()),
          (route) => false);
    } else {
      showAlertDialog(context, response.body.toString());
    }
  }

  Future<void> onWeeklySubmit() async {
    setState(() {
      isLoading = true;
    });


    MedData medData = MedData();
    medData.timList = [];

    if(expandFlag0){
      TimeList timeList = TimeList();
      timeList.day = 'Sunday';
      timeList.occurance = [];

      Lists0.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }

    if(expandFlag1){
      TimeList timeList = TimeList();
      timeList.day = 'Monday';
      timeList.occurance = [];

      Lists1.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }

    if(expandFlag2){
      TimeList timeList = TimeList();
      timeList.day = 'Tuesday';
      timeList.occurance = [];

      Lists2.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }

    if(expandFlag3){
      TimeList timeList = TimeList();
      timeList.day = 'Wednesday';
      timeList.occurance = [];

      Lists3.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }
    if(expandFlag4){
      TimeList timeList = TimeList();
      timeList.day = 'Thrusday';
      timeList.occurance = [];

      Lists4.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }
    if(expandFlag5){
      TimeList timeList = TimeList();
      timeList.day = 'Friday';
      timeList.occurance = [];

      Lists5.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }
    if(expandFlag6){
      TimeList timeList = TimeList();
      timeList.day = 'Saturday';
      timeList.occurance = [];

      Lists6.forEach((key, value) {
        if (value) {
          Occurance occurance = Occurance();
          occurance.type = key;
          occurance.time = key == 'Morning'
              ? morning
              : key == 'Noon'
              ? noon
              : key == 'Evening'
              ? evening
              : night;
          occurance.time_type = "PM";
          timeList.occurance.add(occurance);
        }
      });
      medData.timList.add(timeList);
    }


    final formData = new Map<String, dynamic>();

    formData['name'] = widget.medicineName;
    formData['reason'] = widget.reason;
    formData['dose'] = widget.dose;
    formData['from'] = "${selectedDatefirst.toLocal()}".split(' ')[0];
    formData['to'] = "${selectedDatelast.toLocal()}".split(' ')[0];
    formData['schedule'] = 'Weekly';
    formData['frequency'] = textHolderWeek+ ' Days';
    formData['patientId'] = StringConstant.userId;
    formData['time'] = jsonEncode(medData.toJson());

    print(formData.toString());

    final response = await DoctorService.addMedicine(formData);
    print(response.statusCode);
    print(response.body);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home()),
              (route) => false);
    } else {
      showAlertDialog(context, response.body.toString());
    }
  }

}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.white)),
      ),
    );
  }
}
