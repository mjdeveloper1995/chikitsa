import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/podo/patient.dart';
import 'package:chikitsa/ui/PatientDetails.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';

class AllPatient extends StatefulWidget {
  @override
  _AllPatientState createState() => _AllPatientState();
}

class _AllPatientState extends State<AllPatient> {
  bool _isLoading = false;

  List<Patient> patientList = [];

  @override
  void initState() {
    super.initState();
    fetchPatientList();
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
                createUpperBar(context, "All Patients"),
                Expanded(
                  child: ListView.builder(
                      itemCount: patientList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: AppColors.whiteColor,
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1,
                            bottom: SizeConfig.blockSizeVertical * 2,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PatientDetails(
                                    id: patientList[index].id,
                                    name: patientList[index].name,
                                    mobile: patientList[index].phone,
                                    address: patientList[index].address,
                                    age: patientList[index].age.toString(),
                                    email: patientList[index].email,
                                  ),
                                ),
                              );
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
                                    top: SizeConfig.blockSizeVertical * 3,
                                    bottom: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                        ),
                                        child: Text(
                                          (index + 1).toString(),
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
                                          left: SizeConfig.blockSizeHorizontal *
                                              5,
                                        ),
                                        child: Image.asset(
                                          "assets/images/patient_icon.png",
                                          height: 30,
                                          width: 30,
                                          color: AppColors.themecolor,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              5,
                                        ),
                                        child: Text(
                                          patientList[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: 'Lato-Bold',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              letterSpacing: 1.0),
                                        ),
                                      ),
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
          if (_isLoading) LoadingWidget(),
        ],
      ),
    );
  }

  Future<void> fetchPatientList() async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['doctorId'] = StringConstant.userId;

      final response = await DoctorService.patientList(formData);
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData.containsKey("patients")) {
          patientList = (jsonData["patients"] as List<dynamic>)
              .map((e) => Patient.fromJson(e as Map<String, dynamic>))
              .toList();
          setState(() {});
        } else {
          showAlertDialog(context, jsonData["message"]);
        }
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
