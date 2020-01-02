import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:honor_store/model/user.dart';
import 'package:honor_store/screens/home_screen.dart';
import 'package:honor_store/screens/sign_up_screen.dart';
import 'package:honor_store/services/firebase_authentication_service.dart';
import 'package:provider/provider.dart';

import 'components/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;

  getEmail(String email) {
    this.email = email;
  }

  getPassword(String pw) {
    this.password = pw;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: (SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset(
                        'assets/graphics/logo.png',
                        fit: BoxFit.fitHeight,
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
                      width: 300,
                      height: 60.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12, width: 1.0),
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
                              height: 8.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                authService.login(email: email, pw: password);
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
                                        'ĐĂNG NHẬP',
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: Container(
                                width: 350.0,
                                height: 40.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      'ĐĂNG KÝ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250.0,
                              height: 1.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Center(child: Text('hoặc đăng nhập với')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.facebookSquare),
                                  onPressed: () {
                                    authService.loginWithFacebook();
                                  },
                                ),
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.googlePlusSquare),
                                  onPressed: () {
                                    authService.loginWithGoogle();
                                  },
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    (e) => false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Bỏ qua đăng ký? Nhấn vào đây!',
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
      )),
    );
  }
}

class ReusableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
