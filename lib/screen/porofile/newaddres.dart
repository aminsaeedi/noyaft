import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/screen/dliviripelace.dart';

import '../../main.dart';
import 'locationpicker.dart';




class NewAddress extends StatefulWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  NewAddressContoroler _nac = Get.put(NewAddressContoroler());
  @override
  void initState() {
    super.initState();
    getalldete();


  }
  int country_id=0;
  int proo_id=0;
  int city_id=0;
  bool loding=true;
  final _formkey1= GlobalKey<FormState>();



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


    List<PopupMenuItem> countrylist = List<PopupMenuItem>.generate(
        _nac.countrys.length,
            (index) => PopupMenuItem(
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5))),
                  side: const BorderSide(
                      color: Colors.black12, width: .5),
                ),
                child: Text(
                    _nac.countrys[index]['title']['fa'],style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _nac.cant=_nac.countrys[index]['id'];
                    _nac.poor=0;
                    _nac.cii=0;
                    _nac.to=0;
                    country_id =1;
                    // _nac.countrys[index]['id'];
                    _nac.name_contry= _nac.countrys[index]['title']['fa'];
                    _nac.name_proo='استان';
                    _nac.name_city='شهرستان';
                    _nac.name_town="شهر";

                  });Get.back();
                },
              ),
            )));

    _nac.provinces.forEach((item){
      if(item['country_id']==country_id){
        proo.add(item);
        // print(item);
      }
    });

    List<PopupMenuItem> ostanlist = List<PopupMenuItem>.generate(
        proo.length,
            (index) => PopupMenuItem(
            child: Center(
              child: ElevatedButton(  style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5))),
                side: const BorderSide(
                    color: Colors.black12, width: .5),
              ),
                child:

                Text(
                    proo[index]['title']['fa'],style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                // print(proo.length);
                  setState(() {
                    _nac.poor=proo[index]['id'];
                    _nac.cii=0;
                    _nac.to=0;
                    proo_id =proo[index]['id'];
                    _nac.name_proo= proo[index]['title']['fa'];
                    _nac.name_city='شهرستان';
                    _nac.name_town="شهر";
                  });Get.back();
                },
              ),
            )));

    _nac.citys.forEach((item){
      if(item['province_id']==proo_id){
        citi.add(item);
      }
    });
    List<PopupMenuItem> shahrestanlist = List<PopupMenuItem>.generate(
        citi.length,
            (index) => PopupMenuItem(
            child: Center(
              child: ElevatedButton(  style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5))),
                side: const BorderSide(
                    color: Colors.black12, width: .5),
              ),
                child:
                (index==11)?
                Text("null",style: TextStyle(color: Colors.black),)
                    :
                Text(
                  citi[index]['title']['fa'].toString(),style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                print(citi[index]['title']['fa']);
                  setState(() {
                    _nac.cii=citi[index]['id'];
                    _nac.to=0;
                    city_id =citi[index]['id'];
                    _nac.name_city= citi[index]['title']['fa'];
                    _nac.name_town="شهر";
                  });Get.back();
                },
              ),
            )));

    _nac.towns.forEach((item){
      if(item['city_id']==city_id){
        town.add(item);
      }
    });

    List<PopupMenuItem> shahrlist = List<PopupMenuItem>.generate(
        town.length,
            (index) => PopupMenuItem(
            child: Center(
              child: ElevatedButton(  style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5))),
                side: const BorderSide(
                    color: Colors.black12, width: .5),
              ),
                child: Text(
                    town[index]['title']['fa'],style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _nac.to=town[index]['id'];
                    _nac.name_town= town[index]['title']['fa'];
                  });Get.back();
                },
              ),
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
                                      child: Text(_nac.name_contry,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
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
                                      child: Text(_nac.name_proo,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
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
                                      child: Text(_nac.name_city,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
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
                                      child: Text(_nac.name_town,style: TextStyle( color:  Colors.grey[700],fontSize: 16),),
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
                                      _nac.khiaban=value;
                                    },

                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('خیابان')


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
                                      _nac.kooche=value;
                                    },

                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('کوچه')


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
                                      _nac.pelak=value;
                                    },

                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('پلاک')


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
                                      _nac.kod_posti=value;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('کد پستی')


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
                     Get.to(UserLocation(lng: 51.387236192822456, lat: 35.679172499535426,));

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
                  _nac.name_contry=='کشور'||
                      _nac.name_proo=='استان'||
                      _nac. name_city=='شهرستان'||
                      _nac.  name_town=="شهر"
                  ||
                     _nac. lat==0||
                      _nac. lng==0
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
                    _nac.sendaddres();
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

