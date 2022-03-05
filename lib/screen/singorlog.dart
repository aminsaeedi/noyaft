import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/singorlogcontoroler.dart';
import 'package:noyaft/screen/aboutus.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:custom_timer/custom_timer.dart';


class Sing extends StatelessWidget {
  SingupContoroler _slc=Get.put(SingupContoroler());
bool rules=false;
  var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final phonenumber = Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 246, 241, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),

        ),
        width:MediaQuery.of(context).size.width-100,
        child:

        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Form(
            key: _formKey,

            child: TextFormField(
              // maxLength: 11,
              cursorColor: Colors.green,

              controller: _slc.phone ,
              validator: (value){
                if(value?.isEmpty==true){
                  return 'لطفا شماره خود را وارد کنید';
                }
                else if(value?.length !=11){
                  return 'لطفا شماره خود را صحیح وارد کنید';
                }
              },
              keyboardType: TextInputType.phone,

              decoration: InputDecoration(

                enabledBorder: const OutlineInputBorder(

                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide( width: 0.0, ),
                ),focusColor: Colors.red,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                // focusedBorder: OutlineInputBorder(),
                labelText: '* شماره موبایل خود را وارد کنید',
                contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ));

Widget ruls= Padding(padding: const EdgeInsets.all(10.0),
    child:
Row (
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Row(
    children: [
      RoundCheckBox(
        isChecked:rules ,
        onTap: (selected) {
          rules=selected!;
        },
        size: 24,
        uncheckedColor: Colors.white,
      ),
      SizedBox(width: 10,),
      Text("قوانین را مطالعه کرده ام",style: TextStyle(color:  Colors.black,fontSize: 14),),

    ],
  ),
    GestureDetector(
      onTap: (){Get.to( Abutus());},
      child: Text("مطالعه ی قوانین",style: TextStyle(color:  Colors.blue[900],fontSize: 15),)),

  ],));

Widget bottm= GestureDetector (
  onTap: (){
if(rules==false){
  _slc.Sowhsnackbar1();
}
else if( _formKey.currentState?.validate()==false){}
if( _formKey.currentState?.validate()==true &&rules==true ){

  _slc.getpcode();
}


  },
    child:Container(
  height: 50.0,
  width: MediaQuery.of(context).size.width*5/6-30,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.white,width: 2),
    color: Color.fromRGBO(8, 209, 45, 1),
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [
      Text("ارسال پیامک",style: TextStyle(
          color: Colors.white
          ,fontSize: 20 ,fontWeight: FontWeight.bold

      ),),
    ],),
));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
child: Column(children: [
  Container(
    width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),

                ),

              ),
    child:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('ثبت نام / ورود',style: TextStyle(color:  Colors.blue[900],fontSize: 20),),

                  Icon(Icons.person_add,color: Colors.blue[900],)

                ],),
    ),
  ),
  SizedBox(height: 20,),
  phonenumber,SizedBox(height: 20,),
  ruls,SizedBox(height: 20,),
  bottm,
  SizedBox(height: 20,),
],),
            ),
          )
        ],),
      ),
    );
  }
}




class Codetrue extends StatefulWidget {
  const Codetrue({Key? key}) : super(key: key);

  @override
  _CodetrueState createState() => _CodetrueState();
}

class _CodetrueState extends State<Codetrue> {
  bool soo=true;
  SingupContoroler _slc=Get.put(SingupContoroler());
  final CustomTimerController _controller = CustomTimerController();
  var _formKey=GlobalKey<FormState>();
  @override




  void initState() {
    super.initState();
    _controller.start();
  }
  Widget build(BuildContext context) {

    final codenumber = Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 246, 241, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),

        ),
        width:MediaQuery.of(context).size.width-100,
        child:

        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Form(
            key: _formKey,

            child: TextFormField(
              // maxLength: 11,
              cursorColor: Colors.green,

              controller: _slc.code ,
              validator: (value){
                if(value?.isEmpty==true){
                  return 'لطفا کد خود را وارد کنید';
                }

              },
              keyboardType: TextInputType.phone,

              decoration: InputDecoration(

                enabledBorder: const OutlineInputBorder(

                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide( width: 0.0, ),
                ),focusColor: Colors.red,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                // focusedBorder: OutlineInputBorder(),
                labelText: 'کد ارسال شده را وارد کنید',
                contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ));

    Widget bottm= GestureDetector (
        onTap: (){
          if( _formKey.currentState?.validate()==false){}
          if( _formKey.currentState?.validate()==true){
            _slc.getsing();
          }
        },
        child:Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width*5/6-30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 2),
            color: Color.fromRGBO(8, 209, 45, 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Text("تایید کد پیامکی",style: TextStyle(
                  color: Colors.white
                  ,fontSize: 20 ,fontWeight: FontWeight.bold

              ),),
            ],),
        ));
    Widget timer =  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          GestureDetector(
              onTap: (){
                Get.off(Sing());
              },
              child: Text('ویرایش شماره موبایل',style: TextStyle(color:  Colors.blue[900],fontSize: 16),)),


          SizedBox(

            child: Container(
                alignment: Alignment.centerLeft,
                height: 25,
                width: 180,
                child: CustomTimer(
                    controller: _controller,
                    begin: Duration(seconds: 60),
                    end: Duration(),

                    builder: (time) {
                      return (time.seconds=="00")?
                      GestureDetector(
                        onTap: ()async{
                         await _slc.again();
                         setState(() {
                           _controller.reset();
                           _controller.start();
                         });

                        },
                        child: Text(
                            "ارسال مجدد",
                            style: TextStyle(fontSize: 16.0,color: Colors.blue[600])
                        ),
                      )
                      :Text(
                          "زمان باقی مانده"+time.seconds,
                          style: TextStyle(fontSize: 16.0,color: Colors.grey[600])
                      );

                    }
                )
            ),
          )




        ],),
    );
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 200,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),

                  ),

                ),
                child:  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text('تایید کد پیامکی',style: TextStyle(color:  Colors.blue[900],fontSize: 20),),

                      SizedBox(width: 20,)

                    ],),
                ),
              ),
              SizedBox(height: 20,),
              codenumber,SizedBox(height: 20,),
              bottm,
              SizedBox(height: 20,),
              timer, SizedBox(height: 20,),
            ],),
          ),
        )
      ],),
    );
  }
}

