import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _formKey = GlobalKey<FormState>();

  final NewPwdFocus = FocusNode();
  final PwdFocus = FocusNode();
  final ConfirmPwdFocus = FocusNode();

  String _newpassword;
  String _password;
  String _confirmpassword;
  bool _Password = false;
  bool _newPassword = false;
  bool _confirmPassword = false;

  final TextEditingController newpasswordController =
      new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createProfileUpperBar(context, "Edit Password"),
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
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.CurrentPassword,
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
                              focusNode: PwdFocus,
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter password";
                                else if (val.length <= 4)
                                  return "Your password should be more then 5 char long";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(NewPwdFocus);
                              },
                              onSaved: (val) => _password = val,
                              obscureText: !this._Password,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(
                                        () => this._Password = !this._Password);
                                  },
                                ),
                                focusedBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: "123456",
                              ),
                            ),
                          ),
                          Container(
                              child: Divider(
                            color: Colors.black12,
                            thickness: 1,
                          )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.NewPassword,
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
                              focusNode: NewPwdFocus,
                              controller: newpasswordController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter new password";
                                else if (val.length <= 4)
                                  return "Your password should be more then 5 char long";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(ConfirmPwdFocus);
                              },
                              onSaved: (val) => _newpassword = val,
                              obscureText: !this._newPassword,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() =>
                                        this._newPassword = !this._newPassword);
                                  },
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: "123456",
                              ),
                            ),
                          ),
                          Container(
                              child: Divider(
                            color: Colors.black12,
                            thickness: 1,
                          )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.ConfirmPassword,
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
                              focusNode: ConfirmPwdFocus,
                              controller: confirmpasswordController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter confirm password";
                                else if (val != passwordController.text)
                                  return "Not Match";
                                else
                                  return null;
                              },
                              onSaved: (val) => _confirmpassword = val,
                              obscureText: !this._confirmPassword,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    setState(() => this._confirmPassword =
                                        !this._confirmPassword);
                                  },
                                ),
                                focusedBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: "123456",
                              ),
                            ),
                          ),
                          Container(
                              child: Divider(
                            color: Colors.black12,
                            thickness: 1,
                          )),
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
                                      StringConstant.SAVEPASSWORD.toUpperCase(),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
