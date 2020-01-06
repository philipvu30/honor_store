import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tài khoản',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Chỉnh sửa',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: DetailWidget(),
    );
  }
}

class DetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Card(
          child: Image.asset(
            'assets/graphics/4-6.jpg',
            width: 150.0,
            height: 150.0,
          ),
          elevation: 18.0,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          'Vũ Thanh Toàn',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 50.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Thông tin cá nhân',
              style: TextStyle(fontSize: 20.0),
            ),
            textContainer('Email', 'vuthanhtoan30@gmail.com'),
            textContainer('Password', '123456789'),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: textContainer('Giới tính', 'Nam'),
                ),
                Expanded(
                  flex: 1,
                  child: textContainer('Tuổi', '25 tuổi'),
                ),
              ],
            ),
            textContainer('Điện thoại', '(+84) 764895949'),
          ],
        ),
      ],
    );
  }

  Widget textContainer(String prefixText, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lightBlueAccent,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(prefixText),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                  ),
                  obscureText: prefixText == 'Password' ? false : true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
