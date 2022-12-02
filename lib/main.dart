
import 'package:filmhouse/constants/apptheme.dart';
import 'package:filmhouse/controller/firebase_services.dart';
import 'package:filmhouse/views/screen/foodndrinks/foodndrink.dart';
import 'package:filmhouse/views/screen/foodndrinks/foodwidgets/shopping_cart.dart';
import 'package:filmhouse/views/screen/homepage.dart';
import 'package:filmhouse/views/screen/onboarding/signin/signin_screen.dart';
import 'package:filmhouse/views/screen/onboarding/signup/signupscreen.dart';
import 'package:filmhouse/views/screen/onboarding/splash_screen.dart';
import 'package:filmhouse/views/screen/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilmHouse',
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: initialScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
        GetPage(name: '/login', page: () => const SignInScreen()),
        GetPage(name: '/homepage', page: () => HomePage(email: '',)),
        GetPage(name: '/profile', page: () => ProfileScreen(email: '',)),
        GetPage(name: '/food', page: () =>  FoodScreen()),
        GetPage(name: '/cart', page: () =>  CartScreen()),







      ],
    );
  }

  initialScreen() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return  SplashScreen();
    } else {
      return HomePage(email: '',);
    }
  }
  }






