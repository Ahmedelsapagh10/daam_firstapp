import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const new({
    this.controller,
    this.isPassword,
    this.errorMsg,
    this.keyboardType,
    this.title,

    this.label,
    this.isEmail,
    this.icon,
    super.key,
  });
  final TextEditingController? controller;
  final String? errorMsg;
  final String? label;
  final String? title;
  final bool? isPassword;
  final bool? isEmail;
  final IconData? icon;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title ?? '',

            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          // readOnly: true,
          // enabled: false,
          validator: (value) {
            if (value == null || value == '') {
              return widget.errorMsg;
            } else {
              if (widget.isEmail == true) {
                if (!RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              }
              if (widget.isPassword == true) {
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return 'Password must contain an uppercase letter';
                }

                if (!RegExp(r'[a-z]').hasMatch(value)) {
                  return 'Password must contain a lowercase letter';
                }

                if (!RegExp(r'[0-9]').hasMatch(value)) {
                  return 'Password must contain a number';
                }

                if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
                  return 'Password must contain a special character';
                }
              }
              return null;
            }
          },
          obscureText: widget.isPassword == true ? showPass : false,
          keyboardType: widget.keyboardType,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@._%+\-]")),
          ],
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon),
            hintText: widget.label,
            labelText: widget.label,
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(showPass ? Icons.lock_open : Icons.lock_outline),
                  )
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
