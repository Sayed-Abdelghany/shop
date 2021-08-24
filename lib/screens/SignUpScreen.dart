

import 'package:shop/screens/SignInScreen.dart';
import 'package:shop/services/AuthFile.dart';
import 'package:shop/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var signUpKey = GlobalKey<FormState>();
  var auth = AuthClass();
  String ?name;
  String ?email;
  String ?pass;
  String ?confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/k5.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          children: [
            SizedBox(height: 80.h,),
            Icon(FontAwesomeIcons.stumbleuponCircle,size: 70.sp,color: Colors.red,),
            SizedBox(height: 10.h,),
            Form(
              key: signUpKey,
              child: Column(
                children: [
                  // CustomTextField(hint: 'Choose your name',iconData: Icons.person,secure: false,
                  // onSaved: (v){
                  //   name = v;
                  // },
                  // validator: (value){
                  //   if (value == null){
                  //     return 'Please Enter Name';
                  //   }
                  // },
                  // ),
                  customSineField('Choose your name',Icon( Icons.person), (v){name=v;}, (v){
                    if (v==null){
                      return 'Please Enter Name';
                    }
                  }, false),
                  // CustomTextField(hint: 'Enter your email',iconData: Icons.mail,secure: false,
                  //   onSaved: (v){
                  //     email = v;
                  //   },
                  //   validator: (value){
                  //     if (value == null){
                  //       return 'Please Enter Email';
                  //     }
                  //   },
                  // ),
                  customSineField('Enter your email',Icon( Icons.mail), (v){email=v;}, (v){
                    if(v== null){
                      return 'Please Enter Email';
                    }
                  }, false),
                  // CustomTextField(hint: 'Enter Password',iconData: Icons.lock,secure: true,
                  //   onSaved: (v){
                  //     pass = v;
                  //   },
                  //   validator: (value){
                  //     if (value == null){
                  //       return 'Please Enter Password';
                  //     }
                  //   },
                  // ),
                  customSineField('Enter Password',Icon( Icons.lock), (v){pass=v;},
                          (v){
                        if (v==null){
                          return 'Please Enter Password';
                        }
                      }
                      , true),
                  // CustomTextField(hint: 'Confirm Password',iconData: Icons.lock,secure: true,
                  //   onSaved: (v){
                  //     confirmPass = v;
                  //   },
                  //   validator: (value){
                  //     if (value == null){
                  //       return 'Please Confirm Password';
                  //     }
                  //   },
                  // ),
                  customSineField('Confirm Password',Icon( Icons.lock), (v){confirmPass=v;},
                          (v){
                        if(v == null){
                          return 'Please Confirm Password';
                        }
                      }, true),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            InkWell(
                onTap: ()async{
                  try{
                    signUpKey.currentState!.save();
                    if (signUpKey.currentState!.validate()){
                      await auth.signUp(email, pass);
                      Navigator.pushNamed(context, SignInScreen.id);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Complete required data'),backgroundColor: Colors.red,));
                      print('CompleteData');
                    }
                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    print(e);
                  }
                },
                child: CustomButton(name: 'SIGN UP',hight: .06.sh,color: Colors.red,)),
            SizedBox(height: 15.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ?',style: TextStyle(
                    fontSize:20.sp,color: Colors.purple,)),
                  TextButton(
                      child: Text('SIGN IN',style: TextStyle(
                          color: Colors.grey,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      onPressed: (){
                        Navigator.pushNamed(context, SignInScreen.id);
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  customSineField(hint,iconData,onSaved,validator,secure){
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
