import 'package:shop/screens/ProductScreen.dart';
import 'package:shop/widget/SocialButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AdminPanelScreen extends StatefulWidget {
  static String id = 'AdminPanelScreen';
  @override
  _AdminPanelScreenState createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/k4.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          children: [
            SizedBox(height: 120.h,),
            Icon(FontAwesomeIcons.stumbleuponCircle,size: 70.sp,color: Colors.red,),
            SizedBox(height: 80.h,),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, ProductScreen.id);
                },
                child: SocialButton(icon: Icons.add_to_photos_sharp,colorIcon: Colors.red,name:'Add Product' ,colorName: Colors.red,color: Colors.white,)),
            SizedBox(height: 20.h,),
            SocialButton(icon: Icons.search,colorIcon: Colors.red,name:'View Orders' ,colorName: Colors.red,color: Colors.white,),
            SizedBox(height: 20.h,),
            SocialButton(icon: Icons.delete,colorIcon: Colors.red,name:'Delete Product' ,colorName: Colors.red,color: Colors.white,),
            SizedBox(height: 20.h,),
            SocialButton(icon: Icons.remove_red_eye,colorIcon: Colors.red,name:'View Products' ,colorName: Colors.red,color: Colors.white,),

            SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }
}
