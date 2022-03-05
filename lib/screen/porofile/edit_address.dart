import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/screen/porofile/locationpicker.dart';

import '../../main.dart';



class Edit_address extends StatefulWidget {
  int id;

  String kod;String k;String koo;String p;

  int cunid;int pooid;int ciid;int toid;

  String cunn;String poon;String ciin;String ton;
  double lat;double lng;
  Edit_address({
    required this.id,

    required this.kod, required this.k, required this.koo, required this.p,

    required this.cunid, required this.pooid, required this.ciid,required this.toid,

    required this.cunn, required this.poon, required this.ciin, required this.ton,
    required this.lat, required this.lng,
  });

  @override
  _Edit_addressState createState() => _Edit_addressState();
}

class _Edit_addressState extends State<Edit_address> {
  NewAddressContoroler _dac = Get.put(NewAddressContoroler());
  String kod_posti='';
  String khiaban='';
  String kooche='';
  String pelak='';





  bool gigar=true;
  bool loding=true;
  final _formkey1= GlobalKey<FormState>();
  void initState() {
    super.initState();
    getalldete();

  }
  int country_id=0;
  int proo_id=0;
  int city_id=0;
  @override
  Widget build(BuildContext context) {
    if(loding){
      return Scaffold(
        appBar:AppBar(
          title: Text(
            'ثبت آدرس جدید',
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
        body: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height/3,
            ),
            Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(

                size: 50, color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    List proo=[];
    List citi=[];
    List town=[];

    if(   Get.find<NewAddressContoroler>().cant==0){
      Get.find<NewAddressContoroler>().cant=widget.cunid;
    }
    if(Get.find<NewAddressContoroler>().poor==0){
      Get.find<NewAddressContoroler>().poor=widget.pooid;
    }
    if(Get.find<NewAddressContoroler>().cii==0){
      Get.find<NewAddressContoroler>().cii=widget.ciid;
    }
    if(Get.find<NewAddressContoroler>().to==0){
      Get.find<NewAddressContoroler>().to=widget.toid;
    }
    if(kod_posti==''){
      kod_posti=widget.kod;
    }
    if(khiaban==''){
      khiaban=widget.k;
    }
    if(kooche==''){
      kooche=widget.koo;
    }
    if(pelak==''){
      pelak=widget.p;
    }

    if(gigar) {
      country_id = widget.cunid;
      proo_id = widget.pooid;
      city_id = widget.ciid;
      Get.find<NewAddressContoroler>().name_town = widget.ton;
      Get.find<NewAddressContoroler>(). name_city = widget.ciin;
      Get.find<NewAddressContoroler>().name_proo = widget.poon;
      Get.find<NewAddressContoroler>().name_contry = widget.cunn;
    }

    List<PopupMenuItem> countrylist = List<PopupMenuItem>.generate(
         Get.find<NewAddressContoroler>().countrys.length,
            (index) => PopupMenuItem(
            child: ElevatedButton(
              child: Text(
                 Get.find<NewAddressContoroler>().countrys[index]['title']['fa']
              ),
              onPressed: () {
                setState(() {
                  Get.find<NewAddressContoroler>(). cant=   Get.find<NewAddressContoroler>().countrys[index]['id'];
                  Get.find<NewAddressContoroler>(). poor=0;
                  Get.find<NewAddressContoroler>(). cii=0;
                  Get.find<NewAddressContoroler>(). to=0;
                  country_id =   Get.find<NewAddressContoroler>().countrys[index]['id'];
                  Get.find<NewAddressContoroler>(). name_contry=    Get.find<NewAddressContoroler>().countrys[index]['title'];
                  Get.find<NewAddressContoroler>(). name_proo='استان';
                  Get.find<NewAddressContoroler>(). name_city='شهرستان';
                  Get.find<NewAddressContoroler>(). name_town="شهر";
                  gigar=false;
                });
              },
            )));
    Get.find<NewAddressContoroler>().provinces.forEach((item){

      if(item['country_id']==1){
        proo.add(item);
      }
    });

    List<PopupMenuItem> ostanlist = List<PopupMenuItem>.generate(
        proo.length,
            (index) => PopupMenuItem(
            child: ElevatedButton(
              child: Text(
                  proo[index]['title']['fa']
              ),
              onPressed: () {
                setState(() {
                  Get.find<NewAddressContoroler>(). poor=proo[index]['id'];
                  Get.find<NewAddressContoroler>(). cii=0;
                  Get.find<NewAddressContoroler>().  to=0;
                  proo_id =proo[index]['id'];
                  Get.find<NewAddressContoroler>(). name_proo= proo[index]['title'];
                  Get.find<NewAddressContoroler>().name_city='شهرستان';
                  Get.find<NewAddressContoroler>(). name_town="شهر";
                  gigar=false;
                });
              },
            )));
    Get.find<NewAddressContoroler>(). citys.forEach((item){

      if(item['province_id']==proo_id){

        citi.add(item);
      }
    });

    List<PopupMenuItem> shahrestanlist = List<PopupMenuItem>.generate(
        citi.length,
            (index) => PopupMenuItem(
            child: ElevatedButton(
              child: (index==11)?
              Text("null",style: TextStyle(color: Colors.black),)
                  :
              Text(
                citi[index]['title']['fa'].toString(),style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  Get.find<NewAddressContoroler>(). cii=citi[index]['id'];
                  Get.find<NewAddressContoroler>(). to=0;
                  city_id =citi[index]['id'];
                  Get.find<NewAddressContoroler>(). name_city= citi[index]['title'];
                  Get.find<NewAddressContoroler>().name_town="شهر";
                  gigar=false;
                });
              },
            )));

    Get.find<NewAddressContoroler>(). towns.forEach((item){
      if(item['city_id']==city_id){
        town.add(item);
      }
    });

    List<PopupMenuItem> shahrlist = List<PopupMenuItem>.generate(
        town.length,
            (index) => PopupMenuItem(
            child: ElevatedButton(
              child: Text(
                  town[index]['title']["fa"]
              ),
              onPressed: () {
                setState(() {
                  Get.find<NewAddressContoroler>(). to=town[index]['id'];
                  Get.find<NewAddressContoroler>().  name_town= town[index]['title'];
                  gigar=false;
                });
              },
            )));






    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ثبت آدرس جدید',
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

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('انتخاب کشور:'),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        PopupMenuButton(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2-20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  border: Border.all(color: Colors.black,width: .3)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Text(Get.find<NewAddressContoroler>().name_contry,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
                                    ),
                                  ]),
                            ),
                            itemBuilder: (context) => countrylist),
                      ],
                    ),

                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('انتخاب استان:'),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        PopupMenuButton(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2-20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  border: Border.all(color: Colors.black,width: .3)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Text(Get.find<NewAddressContoroler>().name_proo,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
                                    ),
                                  ]),
                            ),
                            itemBuilder: (context) => ostanlist),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('انتخاب شهرستان:'),
                  Container(


                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        PopupMenuButton(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2-20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  border: Border.all(color: Colors.black,width: .3)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Text(Get.find<NewAddressContoroler>().name_city,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
                                    ),
                                  ]),
                            ),
                            itemBuilder: (context) => shahrestanlist),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('انتخاب شهر:'),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        PopupMenuButton(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2-20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  border: Border.all(color: Colors.black,width: .3)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Text(Get.find<NewAddressContoroler>().name_town,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
                                    ),
                                  ]),
                            ),
                            itemBuilder: (context) => shahrlist),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration:  ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10),),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Form(
                      key:_formkey1,
                      child:
                      Center(
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                width: MediaQuery.of(context).size.width-90,
                                alignment: Alignment.topCenter,
                                color: Color.fromRGBO(247, 246, 241, 1),
                                child: TextFormField(
                                  onChanged: (value){
                                    Get.find<NewAddressContoroler>().khiaban=value;
                                  },
                                    initialValue: widget.k,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('خیابان'),



                                  ),



                                ),

                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width-90,
                                alignment: Alignment.topCenter,
                                color: Color.fromRGBO(247, 246, 241, 1),

                                child: TextFormField(
                                  onChanged: (value){
                                    Get.find<NewAddressContoroler>().kooche=value;
                                  },
                                  initialValue: widget.koo,                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('کوچه'),



                                  ),



                                ),

                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                width: MediaQuery.of(context).size.width-90,
                                alignment: Alignment.topCenter,
                                color: Color.fromRGBO(247, 246, 241, 1),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value){
                                    Get.find<NewAddressContoroler>().pelak=value;
                                  },
                                  initialValue: widget.p,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('پلاک'),



                                  ),


                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                width: MediaQuery.of(context).size.width-90,
                                alignment: Alignment.topCenter,
                                color: Color.fromRGBO(247, 246, 241, 1),
                                child: TextFormField(
                                  onChanged: (value){
                                    Get.find<NewAddressContoroler>().kod_posti=value;
                                  },
                                  initialValue: widget.kod,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('کد پستی'),



                                  ),


                                ),

                              ),
                            ),
                          ],
                        ),

                      )
                  ),
                ),
              ),
            ),

            Column(

              children: [

                Text("لطفا آدرس از روی نقشه انتخاب کنید ",style: TextStyle( color:  Colors.grey,fontSize: 18),),


                GestureDetector(
                  onTap: (){
                    Get.find<NewAddressContoroler>().lat=0;
                    Get.find<NewAddressContoroler>(). lat=0;
                    Get.to(UserLocation(lat: widget.lat, lng: widget.lng,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          border: Border.all(color: Colors.blue[800]!,width: 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 5,),
                          Text('موقعیت از روی نقشه',
                            style:
                            TextStyle(color: Colors.blue[800],fontSize: 19,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.location_on,color: Colors.blue[800],size: 40,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  if(
                  Get.find<NewAddressContoroler>().name_contry=='کشور'||
                      Get.find<NewAddressContoroler>().name_proo=='استان'||
                      Get.find<NewAddressContoroler>(). name_city=='شهرستان'||
                      Get.find<NewAddressContoroler>().  name_town=="شهر"||
                      Get.find<NewAddressContoroler>().  lat==0||
                      Get.find<NewAddressContoroler>(). lng==0
                  ){
                    showDialog(context: context,
                        barrierDismissible: false,


                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.cyan,
                            elevation: 10,
                            title: Text('پیغام'),
                            content: Text('لطفا اطلاعات را کامل کنید'),
                            actions: [
                              FlatButton(onPressed: (){Navigator.pop(context);
                              }, child: Text('متوجه شدم!')),
                            ],
                          );
                        }
                    );


                  }
                  else{
                    // Get.find<NewAddressContoroler>().sendaddres();
                  }



                },
                child: Container(height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(8, 209, 45, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),

                  ),
                  child: Center(

                    child:      Text('تایید اطلاعات',
                      style:
                      TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

                  ),
                ),
              ),
            ),
          ],),
        )
    );
  }






  getalldete() async{


    await Get.find<NewAddressContoroler>().getall();

    setState(() {
      loding = false;
    });

  }
}
