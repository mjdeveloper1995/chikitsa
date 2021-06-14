import 'package:chikitsa/ui/Home.dart';
import 'package:chikitsa/utils/AppColors.dart';
import 'package:chikitsa/utils/InternetCheck.dart';
import 'package:chikitsa/utils/StringConstant.dart';
import 'package:chikitsa/utils/app.dart';
import 'package:chikitsa/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final NameFocus = FocusNode();
  final AddressFocus = FocusNode();
  final AgeFocus = FocusNode();
  final EmailFocus = FocusNode();
  final PwdFocus = FocusNode();
  final ConfirmPwdFocus = FocusNode();
  final MobileFocus = FocusNode();
  String _email;
  String _password;
  String _confirmpassword;
  String _name;
  String _age;
  String _address;
  String _mobile;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
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
            createProfileUpperBar(context, "Edit Profile"),
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
                              top: SizeConfig.blockSizeVertical *2,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.name,
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
                              focusNode: NameFocus,
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter name";
                                else if (val.length <= 2)
                                  return "Please enter valid name";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(AddressFocus);
                              },
                              onSaved: (val) => _name = val,
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
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: StringConstant.adminname,
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
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.addres,
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
                              focusNode: AddressFocus,
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter address";
                                else if (val.length <= 2)
                                  return "Please enter valid address";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(AgeFocus);
                              },
                              onSaved: (val) => _address = val,
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
                                hintText: "IIT Roorkee",
                              ),
                            )

                          ),
                          Container(
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.ag,
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
                            child:  TextFormField(
                              autofocus: false,
                              focusNode: AgeFocus,
                              controller: ageController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter age";
                                else if (val.length <= 3)
                                  return "Please enter valid age";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(MobileFocus);
                              },
                              onSaved: (val) => _age = val,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 16,
                                color: Colors.black87,
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
                                hintText: "22",
                              ),
                            )
                          ),
                          Container(
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.mobilenumber,
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
                              focusNode: MobileFocus,
                              controller: mobileController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter mobile number";
                                else if (val.length <= 11)
                                  return "Please enter valid mobile number";
                                else
                                  return null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(EmailFocus);
                              },
                              onSaved: (val) => _mobile = val,
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
                                  letterSpacing: 1.0,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: "+91 8126258665",
                              ),
                            )
                          ),
                          Container(
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              StringConstant.emal,
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
                              top: SizeConfig.blockSizeVertical *1,
                              left: SizeConfig.blockSizeHorizontal * 5,
                            ),
                            alignment: Alignment.topLeft,
                            child:  TextFormField(
                              autofocus: false,
                              focusNode: EmailFocus,
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter email";
                                else if (!regex.hasMatch(val))
                                  return "Please enter valid email";
                                else
                                  return null;
                              },
                              onSaved: (val) => _email = val,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Lato-Regular',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                  letterSpacing: 1.0,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Lato-Regular',
                                ),
                                hintText: "skaushik@st.iitr.ac.in",
                              ),
                            )
                          ),
                          Container(
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1,
                              )),

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
