import 'package:flutter/material.dart';
import 'package:planted/constants.dart';

class LoginSignupTextfield extends StatefulWidget {
  /// Text to show in field
  final String label;
  final bool obscureText;
  final void Function(String)? onTextChanged;

  LoginSignupTextfield({
    required this.label,
    this.obscureText = false,
    this.onTextChanged,
  });

  @override
  _LoginSignupTextfieldState createState() => _LoginSignupTextfieldState();
}

class _LoginSignupTextfieldState extends State<LoginSignupTextfield> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: this.textController,
        onChanged: widget.onTextChanged != null ? widget.onTextChanged : null,
        style: Constants.mainFont.copyWith(
          color: Colors.black,
          height: 1,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: CustomColorScheme.primaryColor),
          ),
          labelText: widget.label,
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
