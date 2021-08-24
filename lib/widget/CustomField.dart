import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomField extends StatefulWidget {
  final String ?name;
  final String ?hint;
  CustomField({this.name,this.hint});
  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.name!,style: TextStyle(
                fontSize: 25.sp,fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: widget.hint!,hintStyle: TextStyle(fontSize: 20.h,color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
