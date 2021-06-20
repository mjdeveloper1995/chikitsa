import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {

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
            createUpperBar(context, "Add Medicine"),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child:
                    Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 1),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *5),
                            child:  Image.asset(
                              "assets/images/addmedicine.png",
                              height: 80,
                              width: 80,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *10,
                            ),
                            alignment: Alignment.topCenter,
                            child: Text(
                              StringConstant.NOMEDICATIONWASADDED,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Montserrat-Regular',
                                  color: AppColors.themecolor,
                                  fontSize: 18),
                            ),
                          ),


                        ],
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

}
