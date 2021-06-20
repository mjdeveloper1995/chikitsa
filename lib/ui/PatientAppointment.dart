import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/ui/Appointment.dart';
import 'package:chikitsa/ui/AskDoctorAppointment.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientAppointment extends StatefulWidget {
  @override
  _PatientAppointmentState createState() => _PatientAppointmentState();
}

class _PatientAppointmentState extends State<PatientAppointment> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  final AdviceFocus = FocusNode();
  bool _isLoading = false;

  String _advice;

  final TextEditingController adviceController = new TextEditingController();

  int _counter = 0;

  String doctorID;

  @override
  void initState() {
    //setFilters();
    super.initState();
    getInitialData();
  }

  Future<void> getInitialData() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    doctorID =
        SharedPreferenceHelper.getPrefString(preference, PrefConstant.doctorId);
    // setState(() {});
  }

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
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
                createUpperBar(context, "Appointment"),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              bottom: SizeConfig.blockSizeVertical * 1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                      top: SizeConfig.blockSizeVertical * 4,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      StringConstant.date,
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 25,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 4,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  5,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey[800],
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
                                                "${selectedDate.toLocal()}"
                                                    .split(' ')[0],
                                                style: TextStyle(
                                                    letterSpacing: 1.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Lato-Regular',
                                                    color: Colors.black,
                                                    fontSize: 16),
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
                                                  height: 25,
                                                  width: 25,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                      top: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      StringConstant.time,
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 25,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectTime();
                                    },
                                    child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50,
                                        margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  5,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey[800],
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
                                                _time.format(context),
                                                style: TextStyle(
                                                    letterSpacing: 1.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Lato-Regular',
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal *
                                                      8),
                                              child: IconButton(
                                                icon: Image.asset(
                                                  "assets/images/time.png",
                                                  height: 25,
                                                  width: 25,
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
                                  top: SizeConfig.blockSizeVertical * 5,
                                  left: SizeConfig.blockSizeHorizontal * 8,
                                  right: SizeConfig.blockSizeHorizontal * 8,
                                ),
                                padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 3,
                                  right: SizeConfig.blockSizeHorizontal * 3,
                                  top: SizeConfig.blockSizeVertical * 1,
                                  bottom: SizeConfig.blockSizeVertical * 1,
                                ),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey[800],
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: TextFormField(
                                  autofocus: false,
                                  focusNode: AdviceFocus,
                                  maxLines: 6,
                                  controller: adviceController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val.length == 0)
                                      return "Please enter Advice";
                                    else if (val.length <= 2)
                                      return "Please enter valid advice";
                                    else
                                      return null;
                                  },
                                  onSaved: (val) => _advice = val,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Lato-Regular',
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[800],
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Regular',
                                    ),
                                    hintText: "Extra Comments",
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onAddAppointment();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  width: SizeConfig.blockSizeHorizontal * 60,
                                  height: SizeConfig.blockSizeHorizontal * 15,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: AppColors.themecolor,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          StringConstant.askyourdoctor,
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
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading) LoadingWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
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
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> onAddAppointment() async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    if (isValidate() is String) {
      showAlertDialog(context, isValidate() as String);
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['patientId'] = StringConstant.userId;
      formData['doctorId'] = doctorID;
      formData['date'] =
          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      formData['time'] = '${_time.hour}:${_time.minute}';
      formData['patientComment'] = adviceController.text.trim();

      final response = await DoctorService.addAppointment(formData);
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        showAlertDialog(context, jsonData["message"],
            success: jsonData.containsKey("data"));
      } else {
        showAlertDialog(context, response.body.toString());
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      showAlertDialog(context, error.toString());
    }
  }

  dynamic isValidate() {
    /*if (adviceController.text.isEmpty) {
      return 'Please enter extra comment';
    } */

    if (selectedDate == null) {
      return 'Please select Date first';
    }

    if (doctorID.isEmpty) {
      return 'The doctor is not selected. Please choose the doctor first.';
    }
    return true;
  }

  void showAlertDialog(BuildContext context, String message,
      {bool success = false}) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        if (success) Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Error"),
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
}
