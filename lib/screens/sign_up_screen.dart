import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:honor_store/screens/sign_up_screen.dart';
import 'package:honor_store/services/firebase_authentication_service.dart';
import 'package:provider/provider.dart';

import 'components/input_text_widget.dart';
import 'constants.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email, password, name;
  getEmail(String email) {
    this.email = email;
  }

  getPassword(String pw) {
    this.password = pw;
  }

  getName(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset(
                            'assets/graphics/logo.png',
                            fit: BoxFit.fill,
                          ),
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                      Hero(
                        tag: 'logo-title',
                        child: Container(
                          child: Image.asset(
                            'assets/graphics/logo-name.png',
                            fit: BoxFit.scaleDown,
                          ),
                          width: 200,
                          height: 40.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.only(bottom: 16.0),
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Tên',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            InputTextWidget(
                              hintText: 'Tên',
                              onTextChanged: getName,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            InputTextWidget(
                              hintText: 'Email',
                              onTextChanged: getEmail,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Mật khẩu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            InputTextWidget(
                              hintText: 'Mật khẩu',
                              onTextChanged: getPassword,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                authService.signUp(
                                    email: email, pw: password, name: name);
                              },
                              child: Container(
                                width: 350.0,
                                height: 40.0,
                                child: Card(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  elevation: 10.0,
                                  color: Colors.blue,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        'ĐĂNG KÝ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Đã là thành viên? Quay trở lại màn hình đăng nhập!',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 10.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
