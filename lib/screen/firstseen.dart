import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:noyaft/contoroler/homepagecontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:noyaft/screen/home_page.dart';
import 'package:noyaft/screen/singorlog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class FirstSeen extends StatefulWidget {
  const FirstSeen({Key? key}) : super(key: key);

  @override
  _FirstSeenState createState() => _FirstSeenState();
}



class _FirstSeenState extends State<FirstSeen> {
  @override
  bool _display=false;
  bool cash=false;
  void initState() {

    super.initState();

    runn();

  }
  Widget build(BuildContext context) {
    if(cash){

      return  Scaffold(

        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color.fromRGBO(113, 250, 82, .8) ,
                  Colors.white
                  , Color.fromRGBO(113, 250, 82, .8)],

                stops: [0.3, .5, .8],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(children: [

              SizedBox(height: MediaQuery.of(context).size.height/2
              ,width:MediaQuery.of(context).size.width ,
              ),
              Text('لطفا اینترنت خود را بررسی کنید',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold
                  ,color:Color.fromRGBO(1, 19, 71, 1)
              ),),
             ElevatedButton(onPressed: ()async{
                runn();
               // SharedPreferences prefs = await SharedPreferences.getInstance();
               // prefs.setString('token', '1399');
               // token= '1399';
               // Get.offAll(Sing());
             }, child:

             Text( "دوباره امتحان کنید")),
              ElevatedButton(onPressed: ()async{
                // runn();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('token', '1399');
                token= '1399';
                Get.offAll(Sing());
              }, child:
              Text( "دوباره ثبت کنید"))
            
            ],),
          ),
        ),

      ); 
    }

    return  Scaffold(

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color.fromRGBO(113, 250, 82, .8) ,
                Colors.white
                , Color.fromRGBO(113, 250, 82, .8)],

              stops: [0.3, .5, .8],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(children: [

            SizedBox(height: MediaQuery.of(context).size.height/3),
            OpacityAnimatedWidget.tween(
              opacityEnabled: 1, //define start value
              opacityDisabled: 0,
              duration: Duration(seconds: 2),
              enabled: _display, //bind with the boolean
              child: Container(
                // height: MediaQuery.of(context).size.height/2-50,
                width: MediaQuery.of(context).size.width,
                child:  Center(
                  child: Text('نویافت',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                      ,color:Color.fromRGBO(0, 135, 5, 1)
                  ),),
                ),
              ),
            ),
            SizedBox(height: 70),
            Text('اپلیکیشن فروشگاه نویافت',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold
                ,color:Color.fromRGBO(1, 19, 71, 1)
            ),),
            SizedBox(height: 70),
            OpacityAnimatedWidget.tween(
              opacityEnabled: 1, //define start value
              opacityDisabled: 0,
              duration: Duration(seconds: 2),
              enabled: _display, //bind with the boolean
              child: Container(
                // height: MediaQuery.of(context).size.height/2-50,
                width: MediaQuery.of(context).size.width,
                child:  Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2+50,
                    child:  Center(
                      child: Text('لورم ایپسوم متن ساختگی با تولید سادگی نافهوم از صنعت چاپ و با استفاده از طراحان پرافیک است.',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold
                            ,color:Colors.black
                        ),),
                    ),
                  ),
                ),
              ),
            ),
          ],),
        ),
      ),

    );
  }
  runn()async{
   setState(() {
     _display=true;
   });
   try {
     print("111111");
     await Get.find<HomepageContoroler>().Setsabad();
     print("2222");

     await Get.find<AdreessContoroler>().getadress();
    print("33333333");
     await Get.find<PersonalContoroler>().getuserdata();



    
    Get.offAll(homepage(ini: 0,));
    }

    catch(e){
     print("sad");
     print(e);
     setState(() {
       cash=true;

     });
    }
    }
  
}


