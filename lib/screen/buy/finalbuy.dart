import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/buycontoroler.dart';


class FinalBuy extends StatefulWidget {
  String name;
  String tozih;
  int sentype;

  FinalBuy({
   required this.name,
    required this.sentype,
  required  this.tozih
});



  @override
  _FinalBuyState createState() => _FinalBuyState();
}

class _FinalBuyState extends State<FinalBuy> {
  String copen='';
  bool usecopen=false;

  int flag=0;

  int paytype=1;
  bool online=true;
  bool wallet=false;
  bool darmanzel=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text(
          'قرایند پرداخت',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[

        ],
        leading:         IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,

        elevation: 0.00,
        backgroundColor:Color.fromRGBO(8, 209, 45, 1),),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration:  BoxDecoration(
                            color:Color.fromRGBO(8, 209, 45, 1),
                            shape: BoxShape.circle),
                        child: Center(child:
                            Icon(Icons.check,color: Colors.white,)
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 5,
                        color: Color.fromRGBO(8, 209, 45, 1),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(8, 209, 45, 1),
                            shape: BoxShape.circle),
                        child: Center(child:  Icon(Icons.check,color: Colors.white,)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 5,
                        color:Color.fromRGBO(8, 209, 45, 1),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color:Color.fromRGBO(8, 209, 45, 1),
                            shape: BoxShape.circle),
                        child: Center(child: Text("3",style: TextStyle(
                            color: Colors.white
                            ,fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("انتخاب آدرس",style: TextStyle(
                      color: Color.fromRGBO(8, 209, 45, 1),
                      fontSize: 14
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width/3-60,),
                  Text("جزییات سفارش",style: TextStyle(
                      color: Color.fromRGBO(8, 209, 45, 1),
                      fontSize: 13
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width/3-60,),
                  Text("پرداخت",style: TextStyle(
                      color: Color.fromRGBO(8, 209, 45, 1),
                      fontSize: 14
                  ),),

                ],
              ),
            ],
          ),

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
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
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Text("کوپن تخفیف"
                ,style: TextStyle(color: Colors.black
                    ,fontSize: 20,
                    fontWeight: FontWeight.bold),),

            ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            width: MediaQuery.of(context).size.width-40,
            alignment: Alignment.topCenter,
            color: Color.fromRGBO(247, 246, 241, 1),
            child: TextFormField(
              onChanged: (value){
                copen=value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('کد تخفیف')


              ),


            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap:(){
                  Get.find<BuyContoroler>().checkcoupn(copen);
                },
                child: Text("بررسی کد تخفیف"
                  ,style: TextStyle(color: Colors.blue[800]
                      ,fontSize: 15,
                      fontWeight: FontWeight.bold),),
              ),

            ],),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Checkbox(
                activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                checkColor: Colors.white,
                value: usecopen,
                onChanged: (value) {
                  setState(() {
                    usecopen = value!;
                    if(usecopen){
                      flag=1;
                    };
                    if(usecopen==false){
                      flag=0;
                    };

                  });

                },
              ),
                    Text('استفاده از کد تخفیف',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ],
    ),
  ),
),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: Column (children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Text("نحوه پرداخت"
                        ,style: TextStyle(color: Colors.black
                            ,fontSize: 20,
                            fontWeight: FontWeight.bold),),

                    ],),

                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                      checkColor: Colors.white,
                      value: online,
                      onChanged: (value) {
                        setState(() {

                          if(value==true){
                            paytype=1;
                            online = value!;
                            darmanzel=false;
                            wallet=false;
                          }
                          if(value==false){

                          }
                        });

                      },
                    ),
                    Container(
                        child:Row (children: [
                          Text('پرداخت آنلاین',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                         ],)

                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                      checkColor: Colors.white,
                      value: wallet,
                      onChanged: (value) {
                        setState(() {

                          if(value==true){
                            paytype=2;
                            wallet = value!;
                            darmanzel=false;
                            online=false;
                          }
                          if(value==false){

                          }
                        });

                      },
                    ),
                    Container(
                        child:Row (children: [
                          Text('موجودی کیف پول',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                        ],)

                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                      checkColor: Colors.white,
                      value: darmanzel,
                      onChanged: (value) {
                        setState(() {

                          if(value==true){
                            paytype=3;
                            darmanzel = value!;
                            wallet=false;
                            online=false;
                          }
                          if(value==false){

                          }
                        });

                      },
                    ),
                    Container(
                        child:Row (children: [
                          Text('پرداخت در محل',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                        ],)

                    ),
                  ],
                ),
              ],) ,
            ),
          )

        ],),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){Get.back();
                    },

                    child: Text(' مرحله ی قبل',style: TextStyle(color: Color.fromRGBO(8, 209, 45, 1),fontSize: 19,fontWeight: FontWeight.bold),)),
                GestureDetector(
                    onTap: (){

                      Get.find<BuyContoroler>().calculate(name: widget.name, sendtype: widget.sentype,
                          flag: flag, coupon: copen, paytype: paytype);
                    },

                    child: Text('پرداخت ',style: TextStyle(color: Color.fromRGBO(8, 209, 45, 1),fontSize: 19,fontWeight: FontWeight.bold),))
              ],),
          ),
        ),
      ),
    );
  }
}
