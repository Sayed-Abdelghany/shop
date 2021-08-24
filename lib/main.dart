import 'package:shop/constants/Theme.dart';
import 'package:shop/providers/ThemeProvider.dart';
import 'package:shop/screens/AdminPanelScreen.dart';
import 'package:shop/screens/AdminScreen.dart';
import 'package:shop/screens/ForgetPassScreen.dart';
import 'package:shop/screens/HomeScreen.dart';
import 'package:shop/screens/OnBoardingScreen.dart';
import 'package:shop/screens/ProductScreen.dart';
import 'package:shop/screens/SignInScreen.dart';
import 'package:shop/screens/SignUpScreen.dart';
import 'package:shop/screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>ThemeProvider()),
          ],
          child: MyApp())
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=> MaterialApp(
        theme: Provider.of<ThemeProvider>(context).isLight == true?lightMode:darkMode,
        initialRoute: SplashScreen.id,
        debugShowCheckedModeBanner: false,
        routes: {
          SignInScreen.id:(context)=>SignInScreen(),
          ForgetPassScreen.id:(context)=>ForgetPassScreen(),
          SignUpScreen.id:(context)=>SignUpScreen(),
          SplashScreen.id:(context)=>SplashScreen(),
          OnBoardingScreen.id:(context)=>OnBoardingScreen(),
          HomeScreen.id:(context)=>HomeScreen(),
          AdminScreen.id:(context)=>AdminScreen(),
          AdminPanelScreen.id:(context)=>AdminPanelScreen(),
          ProductScreen.id:(context)=>ProductScreen(),
        },
      ),
    );
  }
}

