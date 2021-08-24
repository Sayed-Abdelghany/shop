import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:core';
class CustomTextField extends StatefulWidget {
  final String ?hint;
  final IconData ?iconData;
  final bool ?secure;
  final Function ?onSaved;
  final  Function ?validator;
  CustomTextField({this.hint,this.iconData,this.secure,this.validator,this.onSaved});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.h),
      child: TextFormField(
        obscureText: widget.secure!,
        onSaved: (v){widget.onSaved!;},
        validator: (v){widget.validator!;},
        decoration: InputDecoration(

          fillColor: Colors.white,
          filled: true,
          labelText: widget.hint!,hintStyle: TextStyle(fontSize: 20.sp),
          prefixIcon: Icon(widget.iconData!,color: Colors.grey,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          ),
        ),
      ),
    );
  }
}
