import 'dart:convert';

import 'package:chikitsa/core/network/doctor.dart';
import 'package:chikitsa/podo/medicine.dart';
import 'package:chikitsa/ui/DietPillDetails.dart';
import 'package:chikitsa/ui/EditPillDetails.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/loading_widget.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';

class AllMedications extends StatefulWidget {
  @override
  _AllMedicationsState createState() => _AllMedicationsState();
}

class _AllMedicationsState extends State<AllMedications> {
  _showPopupMenu(String id) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(80, 70, 40, 400),
      items: [
        PopupMenuItem(
            value: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        EditPillDetails()));
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.edit),
                  ),
                  Text('EDIT')
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.pause_circle_outline),
                  ),
                  Text('SUSPEND')
                ],
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                deleteMedicine(id);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 1, 8, 1),
                    child: Icon(Icons.delete),
                  ),
                  Text('DELETE')
                ],
              ),
            ))
      ],
      elevation: 8.0,
    );
  }

  bool _isLoading = false;
  List<Medicine> medicineList = [];

  @override
  void initState() {
    super.initState();
    fetchMedicineList();
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
                createUpperBar(context, "All Medications"),
                Expanded(
                  child: ListView.builder(
                      itemCount: medicineList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: AppColors.whiteColor,
                          margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DietPillDetails()));
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
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal * 2,
                                        ),
                                        child: Text(
                                          (index+1).toString(),
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
                                          left: SizeConfig.blockSizeHorizontal * 5,
                                        ),
                                        child: Image.asset(
                                          "assets/images/phill.png",
                                          height: 30,
                                          width: 30,
                                          color: AppColors.themecolor,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal * 50,
                                            margin: EdgeInsets.only(
                                              left: SizeConfig.blockSizeHorizontal *
                                                  5,
                                            ),
                                            child: Text(
                                              medicineList[index].name,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Lato-Bold',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16,
                                                  letterSpacing: 1.0),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: SizeConfig.blockSizeVertical *
                                                  0.5,
                                              left: SizeConfig.blockSizeHorizontal *
                                                  5,
                                            ),
                                            child: Text(
                                              medicineList[index].dose,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Lato-Bold',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  letterSpacing: 1.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0)),
                                          child: Material(
                                            shadowColor: Colors.transparent,
                                            color: Colors.transparent,
                                            child: IconButton(
                                              icon: Image.asset(
                                                "assets/images/dr_menu.png",
                                                height: 20,
                                                width: 20,
                                              ),
                                              onPressed: ()=>_showPopupMenu(medicineList[index].id),
                                            ),
                                          ),
                                        ),
                                      )
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
          if(_isLoading)
            LoadingWidget()
        ],
      ),
    );
  }

  Future<void> fetchMedicineList() async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['patientId'] = StringConstant.userId;

      final response = await DoctorService.allMedications(formData);
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData.containsKey("data")) {
          medicineList = (jsonData["data"] as List<dynamic>)
              .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
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

  Future<void> deleteMedicine(String medicineId) async {
    if (!await (InternetCheck().check())) {
      showAlertDialog(context, 'No internet connection available');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final formData = new Map<String, dynamic>();
      formData['medicineId'] = medicineId;

      final response = await DoctorService.deleteMedicine(formData);
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        fetchMedicineList();
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
