import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/core/preference/pref_constant.dart';
import 'package:chikitsa/core/preference/shared_preference.dart';
import 'package:chikitsa/podo/appointment.dart';
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

class AppointmentScreen extends StatefulWidget {
  final AppointmentItem appointmentItem;

  AppointmentScreen(this.appointmentItem, {Key key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  DateTime selectedDate = DateTime.now();

  final AdviceFocus = FocusNode();
  final ExtraCommentsFocus = FocusNode();

  String doctorName;

  final TextEditingController adviceController = new TextEditingController();
  final TextEditingController extaCommentsController =
      new TextEditingController();


  @override
  void initState() {
    //setFilters();
    super.initState();
    initView();
    getInitialData();
  }

  Future<void> getInitialData() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    doctorName =   SharedPreferenceHelper.getPrefString(preference, PrefConstant.name);

    setState(() {});
  }

  void initView() {
    var fullTime = widget.appointmentItem.time;
    var splitTime = fullTime.split(":");
    var hours = int.parse(splitTime[0] ?? '0');
    var min = int.parse(splitTime[1] ?? '0');

    _time = TimeOfDay(hour: hours, minute: min);

    var date = widget.appointmentItem.date;

    var splitDate = date.split("-");
    var year = int.parse(splitDate[0]);
    var month = int.parse(splitDate[1]);
    var day = int.parse(splitDate[2]);
    selectedDate = DateTime(year, month, day);

    extaCommentsController.text = widget.appointmentItem.patientComment;

    setState(() {});
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
                createUpperBar(context, widget.appointmentItem.patientName),
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
                              /*  Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                  right: SizeConfig.blockSizeHorizontal * 5),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12, width: 0.0),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: "Select Patient",
                                    fillColor: AppColors.whiteColor),
                                value: dropDownValue,
                                onChanged: (String Value) {
                                  setState(() {
                                    dropDownValue = Value;
                                  });
                                },
                                items: patientList
                                    .map((cityTitle) => DropdownMenuItem(
                                        value: cityTitle,
                                        child: Text("$cityTitle")))
                                    .toList(),
                              ),
                            ),*/
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2,
                                ),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  StringConstant.AskingforyourAppointment,
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Regular',
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 5),
                                  child: Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2,
                                ),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  StringConstant.ExtracommentsfromPatient,
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Regular',
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: TextFormField(
                                    autofocus: false,
                                    focusNode: ExtraCommentsFocus,
                                    controller: extaCommentsController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    validator: (val) {
                                      if (val.length == 0)
                                        return "Please enter extra comment";
                                      else if (val.length <= 2)
                                        return "Please enter valid extra comment";
                                      else
                                        return null;
                                    },
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(AdviceFocus);
                                    },
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
                                        fontSize: 16,
                                        letterSpacing: 1.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Lato-Regular',
                                      ),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 5),
                                  child: Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3,
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                  right: SizeConfig.blockSizeHorizontal * 5,
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
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  autofocus: false,
                                  focusNode: AdviceFocus,
                                  maxLines: 3,
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
                                    hintText: "Add some advice to patient",
                                  ),
                                ),
                              ),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      /* Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Home()));*/
                                      //Navigator.pop(context, true);
                                      fetchAllAppointment(false);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 5,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 1,
                                        bottom:
                                            SizeConfig.blockSizeVertical * 1,
                                      ),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 35,
                                      height:
                                          SizeConfig.blockSizeHorizontal * 15,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: AppColors.themecolor,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        2),
                                                child: IconButton(
                                                  icon: Image.asset(
                                                    "assets/images/reject.png",
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  StringConstant.Reject,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Lato-Regular',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18,
                                                      letterSpacing: 1.0),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      /* Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Home()));*/
                                      //Navigator.pop(context, true);
                                      fetchAllAppointment(true);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 5,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 1,
                                        bottom:
                                            SizeConfig.blockSizeVertical * 1,
                                      ),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 35,
                                      height:
                                          SizeConfig.blockSizeHorizontal * 15,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: AppColors.themecolor,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        2),
                                                child: IconButton(
                                                  icon: Image.asset(
                                                    "assets/images/send.png",
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  StringConstant.Send,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Lato-Regular',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18,
                                                      letterSpacing: 1.0),
                                                ),
                                              )
                                            ],
                                          )),
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

  Future<void> fetchAllAppointment(bool isApproved) async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['appointmentId'] = widget.appointmentItem.id;
      formData['doctorComment'] = extaCommentsController.text;
      formData['doctorAdvice'] = adviceController.text;
      formData['doctorName'] = doctorName;
      formData['date'] =
          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      formData['time'] = '${_time.hour}:${_time.minute}';
      formData['status'] = isApproved ? 'Approved' : 'Reject';

      final response = await DoctorService.doctorCommentOnAppointment(formData);
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
}
