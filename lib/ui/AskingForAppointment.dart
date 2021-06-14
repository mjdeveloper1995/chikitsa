import 'package:chikitsa/ui/Appointment.dart';
import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/ui/PatientDetails.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskingForAppointment extends StatefulWidget {
  @override
  _AskingForAppointmentState createState() => _AskingForAppointmentState();
}

class _AskingForAppointmentState extends State<AskingForAppointment> {

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
            createUpperBar(context, "Asked for your Appointment"),
            Expanded(
              child:
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: AppColors.whiteColor,
                      margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical *1,
                        bottom: SizeConfig.blockSizeVertical * 2,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Appointment()));
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 100,
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2,
                            right: SizeConfig.blockSizeHorizontal * 2,
                          ),

                          child: Card(
                            color: AppColors.whiteColor,
                            child:
                            Container(
                              padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 3,
                                right: SizeConfig.blockSizeHorizontal * 3,
                                top: SizeConfig.blockSizeVertical * 3,
                                bottom: SizeConfig.blockSizeVertical * 3,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 2),
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
                                      "assets/images/patient_icon.png",
                                      height: 30,
                                      width: 30,
                                      color: AppColors.themecolor,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                    ),
                                    child: Text(
                                      "Sonu Kumar",
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
    );
  }

}
