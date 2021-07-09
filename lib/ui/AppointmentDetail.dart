import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
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

class AppointmentDetail extends StatefulWidget {
  final AppointmentItem appointmentItem;

  AppointmentDetail(this.appointmentItem, {Key key}) : super(key: key);

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  DateTime selectedDate = DateTime.now();

  final AdviceFocus = FocusNode();
  final ExtraCommentsFocus = FocusNode();

  String _advice;
  String _extaComments;

  final TextEditingController adviceController = new TextEditingController();
  final TextEditingController extaCommentsController =
      new TextEditingController();

  @override
  void initState() {
    //setFilters();
    super.initState();
    initView();
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
                              SizedBox(height: 16),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.appointmentItem.patientComment,
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Lato-Regular',
                                        color: Colors.black,
                                        fontSize: 14),
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
                                  top: SizeConfig.blockSizeVertical * 2,
                                ),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Extra comments from doctor',
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato-Regular',
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.appointmentItem.doctorAdvice,
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Lato-Regular',
                                        color: Colors.black,
                                        fontSize: 14),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
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
                                  SizedBox(width: 16),
                                  Container(
                                    child: Text(
                                      "${selectedDate.toLocal()}",
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
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
                                  SizedBox(width: 16),
                                  Container(
                                    child: Text(
                                      _time.format(context),
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Lato-Regular',
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),

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
