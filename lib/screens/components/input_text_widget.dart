import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onTextChanged;
  InputTextWidget({this.hintText, this.onTextChanged});

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  bool eyeToggle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextFormField(
        onChanged: (text) {
          widget.onTextChanged(text);
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
                color: Colors.blueGrey,
              ),
            ),
            labelText: widget.hintText,
            labelStyle: TextStyle(),
            prefixIcon: widget.hintText == 'Password'
                ? Icon(
                    Icons.lock,
                  )
                : Icon(Icons.email),
            suffixIcon: widget.hintText == 'Password'
                ? IconButton(
                    icon: eyeToggle
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      eyeToggle = !eyeToggle;
                      setState(() {});
                    },
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        obscureText: widget.hintText == 'Password' ? eyeToggle : false,
      ),
    );
  }
}
