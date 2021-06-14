import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';

launchScreen(context, String tag, {Object arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

callNext(var className, var context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => className),
  );
}

createUpperBar(context,text) {
  return
    Container(
      color: AppColors.themecolor,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4,
                left: SizeConfig.blockSizeVertical * 1),
            child: IconButton(
                icon: Image.asset(
                  "assets/images/back.png",
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4, left: 5),
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 80,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Montserrat-Regular",
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
}

createProfileUpperBar(context,text) {
  return
    Container(
      color: AppColors.themecolor,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4,
                left: SizeConfig.blockSizeVertical * 1),
            child: IconButton(
                icon: Image.asset(
                  "assets/images/back.png",
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4, left: 5),
            alignment: Alignment.topLeft,
            width: SizeConfig.blockSizeHorizontal * 65,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Montserrat-Regular",
                  color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4,
                left: SizeConfig.blockSizeVertical * 1),
            child: IconButton(
                icon: Image.asset(
                  "assets/images/checked.png",
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
          ),
        ],
      ),
    );
}

titlebar(context,text) {
  return
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6,left: SizeConfig.blockSizeHorizontal*3),
        child: Material(
            child:
            InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Container(
                color: AppColors.themecolor,
                  child: Image.asset("assets/images/back_white.png",width: 25,height: 25,),
              ),
            )),
      ),
      Container(
        alignment: Alignment.topCenter,
        margin:  EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6,left: SizeConfig.blockSizeHorizontal*25),
        // margin: EdgeInsets.only(top: 10, left: 40),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              fontFamily: "Montserrat-Regular",
              color: Colors.white),
        ),
      ),
    ],
  );
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: null,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Loading....",style: TextStyle(color: Color(0xFF009247)),)
                      ]),
                    )
                  ]));
        });
  }
}
