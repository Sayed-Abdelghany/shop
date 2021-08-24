import 'package:shop/screens/SignInScreen.dart';
import 'package:shop/services/AuthFile.dart';
import 'package:shop/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ForgetPassScreen extends StatefulWidget {
  static String id = 'ForgetPassScreen';
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  var forgetKey = GlobalKey<FormState>();
  var auth = AuthClass();
  String ?email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/k5.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: ListView(
          children: [
            SizedBox(height: 120.sp,),
            Icon(FontAwesomeIcons.stumbleuponCircle,size: 70.sp,color: Colors.red,),
            Form(
              key: forgetKey,
              child: Column(
                children: [
                  SizedBox(height: 300.sp,),
                  customForgetField('Enter Your Mail', Icon(Icons.mail), (v){email=v;},
                          (v){
                        if (v==null){
                          return 'Please Enter Email';
                        }
                      }, false),
                ],
              ),
            ),
            // CustomTextField(hint: 'Enter Your Mail',iconData: Icons.mail,secure: false,),

            SizedBox(height: 25.sp,),
            InkWell(
                onTap: ()async{
                  try{
                    forgetKey.currentState!.save();
                    if(forgetKey.currentState!.validate()){
                      await auth.forgetPass(email);
                      Navigator.pushNamed(context, SignInScreen.id);
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complete required data')));
                    }
                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),backgroundColor: Colors.red,));
                  }
                },
                child: CustomButton(name: 'Reset Password',hight:.06.sh ,color:Colors.red ,)),
          ],
        ),
      ),
    );
  }
  customForgetField(hint,iconData,onSaved,validator,secure){
    return Padding(
      padding:  EdgeInsets.all(15.h),
      child: TextFormField(
        decoration: InputDecoration(labelText: hint,prefixIcon: iconData,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
          ),
        ),
        obscureText: secure,onSaved: onSaved,validator: validator,
      ),
    );
  }
}
