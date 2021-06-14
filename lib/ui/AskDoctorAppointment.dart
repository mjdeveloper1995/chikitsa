import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskDoctorAppointment extends StatefulWidget {
  @override
  _AskDoctorAppointmentState createState() => _AskDoctorAppointmentState();
}

class _AskDoctorAppointmentState extends State<AskDoctorAppointment> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  final AdviceFocus = FocusNode();
  final ExtraCommentsFocus = FocusNode();

  String _advice;
  String _extaComments;

  final TextEditingController adviceController = new TextEditingController();
  final TextEditingController extaCommentsController = new TextEditingController();

  int _counter = 0;
  String dropDownValue;
  List<String> patientList = [
    'Select Patient',
    'Ajay',
    'Jatin',
    'Deepak',
    'Rakesh',
    'Neha',
    'Palak',
    'Roshni'
  ];

  @override
  void initState() {
    //setFilters();
    super.initState();
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

  setFilters() {
    setState(() {
      dropDownValue = patientList[0];
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
            createUpperBar(context, StringConstant.adminname),
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
                              top: SizeConfig.blockSizeVertical *2,
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
                            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal *5,right: SizeConfig.blockSizeHorizontal *5),
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *2,
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
                              child:TextFormField(
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
                                  FocusScope.of(context).requestFocus(AdviceFocus);
                                },
                                onSaved: (val) => _extaComments = val,
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
                              )

                          ),
                          Container(
                              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal *5,right: SizeConfig.blockSizeHorizontal *5),
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
                                  top: SizeConfig.blockSizeVertical *4,
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
                                onTap: ()
                                {
                                  _selectDate(context);
                                },
                                child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 50,
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 4,
                                      right: SizeConfig.blockSizeHorizontal * 5,
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
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${selectedDate.toLocal()}".split(' ')[0],
                                            style: TextStyle(
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato-Regular',
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(
                                              left:
                                              SizeConfig.blockSizeHorizontal *
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
                                onTap: ()
                                {
                                  _selectTime();
                                },
                                child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 50,
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      right: SizeConfig.blockSizeHorizontal * 5,
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
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                             _time.format(context),
                                            style: TextStyle(
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Lato-Regular',
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(
                                              left:
                                              SizeConfig.blockSizeHorizontal *
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
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5,
                                    right: SizeConfig.blockSizeHorizontal *1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  width: SizeConfig.blockSizeHorizontal * 35,
                                  height: SizeConfig.blockSizeHorizontal * 15,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: AppColors.themecolor,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:EdgeInsets.only(left: SizeConfig.blockSizeHorizontal *2),
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
                                                  fontFamily: 'Lato-Regular',
                                                  fontWeight: FontWeight.normal,
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
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5,
                                    left: SizeConfig.blockSizeHorizontal *1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  width: SizeConfig.blockSizeHorizontal * 35,
                                  height: SizeConfig.blockSizeHorizontal * 15,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      color: AppColors.themecolor,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:EdgeInsets.only(left: SizeConfig.blockSizeHorizontal *2),
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
                                                  fontFamily: 'Lato-Regular',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18,
                                                  letterSpacing: 1.0),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              )                            ],
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
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
}
