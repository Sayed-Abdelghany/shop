
import 'package:shop/screens/AdminPanelScreen.dart';
import 'package:shop/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AdminScreen extends StatefulWidget {
  static String id = 'AdminScreen';
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/k6.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.sp,),
            Icon(FontAwesomeIcons.stumbleuponCircle,size: 70.sp,color: Colors.red,),
            SizedBox(height: 10.sp,),
            Text('Welcome To Our World',style: TextStyle(
                fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 30.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AdminPanelScreen.id);
                    setState(() {
                      isAdmin = true;
                    });
                  },
                  child: Container(
                    height: .25.sh,
                    width: .4.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(color: Colors.black,width: 2.sp),
                      color: isAdmin ? Colors.purple : Colors.white,
                    ),
                    child: Center(
                      child: Text('ADMIN',style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, HomeScreen.id);
                    setState(() {
                      isAdmin = false;
                    });
                  },
                  child: Container(
                    height: .25.sh,
                    width: .4.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(color: Colors.black,width: 2.sp),
                      color: !isAdmin == false ? Colors.white : Colors.purple,
                    ),
                    child: Center(
                      child:Text('USER',style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.sp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:25.sp ),
              child: Center(
                child: Text('Choose your category & enjoy our services',style: TextStyle(
                    fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
