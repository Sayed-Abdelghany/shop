import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SocialButton extends StatefulWidget {
  final IconData ?icon;
  final Color ?colorIcon;
  final String ?name;
  final Color ? colorName;
  final  Color ?color;
  SocialButton({this.icon,this.colorIcon,this.name,this.colorName,this.color});
  @override
  _SocialButtonState createState() => _SocialButtonState();
}
class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.sp),
      child:Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(widget.icon!,color: widget.colorIcon!,size: 35.sp,),
              Text(widget.name!,style: TextStyle(
                  color: widget.colorName!,fontSize: 20.sp,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        height: .07.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: Colors.grey,width: 1),
          color: widget.color!,
        ),
      ),
    );
  }
}
