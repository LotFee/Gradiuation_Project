import 'package:flutter/material.dart';
import 'package:sakkeny/helper/shared_cache.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/provider/user_image.dart';
import 'package:sakkeny/provider/users.dart';
import 'package:sakkeny/providers/Flats.dart';
import 'package:sakkeny/screens/Update%20Post.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/screens/comments.dart';
import 'package:sakkeny/screens/data_about_student.dart';
import 'package:sakkeny/screens/drawer/about%20us.dart';
import 'package:sakkeny/screens/drawer/booking.dart';
import 'package:sakkeny/screens/drawer/complaints.dart';
import 'package:sakkeny/screens/drawer/terms%20and%20conditions.dart';
import 'package:sakkeny/screens/flatMap.dart';
import 'package:sakkeny/screens/flat_details.dart';
import 'package:sakkeny/screens/map_screen.dart';
import 'package:sakkeny/screens/register/signup1.dart';
import 'package:sakkeny/screens/login_screen.dart';
import 'package:sakkeny/screens/start_screen.dart';
import 'package:sakkeny/widget/location_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Stepers/steper1_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/forget_password/forget1.dart';
import 'screens/forget_password/forget2.dart';
import 'screens/forget_password/forget3.dart';
import 'package:sakkeny/homeScreens/Home.dart';
import 'package:sakkeny/homeScreens/editprof.dart';
import 'package:provider/provider.dart';
import 'provider/current_user.dart';
import 'package:sakkeny/screens/constant.dart';

// 0xff1f95a1

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SharedCache.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn=false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('loading.....',style: TextStyle(color: Color(0xff1f95a1)),),
                ),
              ),
              debugShowCheckedModeBanner: false,
            );
          }
          else{
            isUserLoggedIn=snapshot.data!.getBool(kkeepMeLoggedIn)??false;
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_)=>Flats() ),
                ChangeNotifierProvider(create: (_)=>Users() ),

                ChangeNotifierProvider(create: (_)=>CurrentUserData() ),
                ChangeNotifierProvider(create: (_)=>CurrentUserImage() ),
              ],
              child: MaterialApp(
                title: 'Sakenny',
                theme: ThemeData(
                ),
                initialRoute:isUserLoggedIn? Home.routeName:WelcomeScreen.routeName ,
                routes: {
                  WelcomeScreen.routeName:(ctx)=>WelcomeScreen(),
                  Steper1.routeName: (ctx)=> Steper1(),
                  StartScreen.routeName:(ctx)=>StartScreen(),
                  SignUp1.routeName:(ctx)=>SignUp1(),
                  LoginScreen.routeName:(ctx)=>LoginScreen(),
                  ForgetOne.routeName:(ctx)=>ForgetOne(),
// ForgetTwo.routeName:(ctx)=>ForgetTwo(),
// ForgetThree.routeName:(ctx)=>ForgetThree(),
                  Home.routeName:(ctx)=>Home(),
                  EditProf.routeName:(ctx)=>EditProf(),
                  AddOne.routeName:(ctx)=>AddOne(),
                  AboutUs.routeName:(ctx)=>AboutUs(),
                  Complaint.routeName:(ctx)=>Complaint(),
                  Terms.routeName:(ctx)=>Terms(),
                  Booking.routeName:(ctx)=>Booking(),
                  FlatDetails.routeName:(ctx)=>FlatDetails(),
                  DataAboutYou.routeName: (ctx)=> DataAboutYou(),
                  UpdatePost.routeName: (ctx)=> UpdatePost(),
                  Comments.routeName: (ctx)=>Comments(),
                  LocationInput.routeName : (ctx)=> LocationInput(),

                },
                debugShowCheckedModeBanner: false,
              ),
            );
          }
        });
  }
}
