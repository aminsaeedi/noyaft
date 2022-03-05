import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/screen/firstseen.dart';
import 'package:noyaft/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contoroler/mybidings.dart';
import 'langu.dart';
import 'screen/singorlog.dart';



String token='1399';

// String lat="0";
// String lng="0";
Future<void> getper() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   token= prefs.getString('token') ?? '1399';
print(token);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await getper();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: Favoritebiding(),

      translations: Messages(), // your translations
      locale: Locale('fa', 'ir'),
        initialBinding: Favoritebiding(),
      initialRoute:   (token=='1399')? '/dising'
          :'/govab',
      unknownRoute:
        GetPage(name:'/dising',page: ()=>Sing(),),


      getPages: [
        GetPage(name:'/govab',page: ()=> FirstSeen(),),
        GetPage(name:'/dising',page: ()=>Sing(),)
      ],
      theme:
      ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor:Color.fromRGBO(245, 245, 245, 1),
        fontFamily: 'shabnam',
      )

      // home:  MainPage(),
    );
  }
}