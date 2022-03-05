import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/screen/porofile/edit_address.dart';
import 'package:readmore/readmore.dart';

import 'newaddres.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  AdreessContoroler _ac = Get.put(AdreessContoroler());
  @override

  bool loding=true;

  void initState() {
    super.initState();

    getadressdata();

  }




  Widget build(BuildContext context) {
    if(loding){
      return Scaffold(
        appBar:AppBar(
          title: Text(
            'انتخاب آدرس',
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
if(_ac.address.length==0){
  return Scaffold( floatingActionButton: FloatingActionButton(
    backgroundColor: Color.fromRGBO(8, 209, 45, 1),
    onPressed: (){
      Get.to(NewAddress());
    },
    child: const Icon(Icons.add),
  ),
    appBar:AppBar(
      title: Text(
        'انتخاب آدرس',
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
          child: Text("آدرسی وارد نشده",style: TextStyle(color: Colors.grey,fontSize: 30),)
        ),
      ],
    ),
  );
}
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'انتخاب آدرس',
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

          Container(
            height: MediaQuery.of(context).size.height-80,
            child: ListView.builder(
                itemCount: _ac.address.length,
                itemBuilder: (BuildContext context , index) {
                  return Padding(
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
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20.0,left: 20,right: 23,bottom: 10),
                            child: Container(
                              child:
                              ReadMoreText(
                                _ac.address[index]['full_province'].toString()+' '+
                                    _ac.address[index]['full_city'].toString()+' '+
                                    _ac.address[index]['full_town'].toString()+' '+
                                    _ac.address[index]['avenue']+' '+
                                    _ac.address[index]['alley']+' '+'پلاک'
                                    + _ac.address[index]['plaque'].toString()
                                ,
                                style: TextStyle( fontSize: 15,color: Colors.grey[700]),
                                trimLines: 2,
                                colorClickableText: Colors.grey,
                                trimMode: TrimMode.Line,
                                trimExpandedText: ' ',
                                trimCollapsedText: ' ',),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(top:10.0,left: 20,right: 0,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                           Row(children: [
                             SizedBox(
                               width: 20,
                             ),
                             InkWell(
                               onTap: () {
                                 _ac.deleteid=_ac.address[index]['id'];
                                 setState(() {loding=true;});
                                 _ac.deleteadrees();
                                 getadressdata();
                               },
                               child: Container(
                                 height: 30.0,
                                 width: 40.0,
                                 decoration: BoxDecoration(
                                     color: Colors.red.withOpacity(0.5), shape: BoxShape.circle
                                 ),
                                 child: Center(
                                   child: Icon(
                                     Icons.delete,
                                     color: Colors.black,
                                     size: 15.0,
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             InkWell(
                               onTap: () {
                                 Get.to(Edit_address
                                   (id: _ac.address[index]['id'],
                                   koo: _ac.address[index]['alley'].toString(),
                                   p: _ac.address[index]['plaque'].toString(),
                                   kod: _ac.address[index]['zip_code'].toString(),
                                   k: _ac.address[index]['avenue'].toString(),
                                   pooid: _ac.address[index]['province_id'], ciid: _ac.address[index]['city_id'],
                                   cunid: _ac.address[index]['country_id'],toid:_ac.address[index]['town_id'] ,
                                   cunn:_ac.address[index]['full_country'].toString() ,
                                   poon: _ac.address[index]['full_province'].toString(),
                                   ciin: _ac.address[index]['full_city'].toString(),
                                   ton:_ac.address[index]['full_town'].toString(),
                                   lng:     _ac.address[index]['lng'], lat:   _ac.address[index]['lat'],

                                 ));
                               },
                               child: Container(
                                 height: 30.0,
                                 width: 40.0,
                                 decoration: BoxDecoration(
                                     color: Colors.blue.withOpacity(0.5), shape: BoxShape.circle
                                 ),
                                 child: Center(
                                   child: Icon(
                                     Icons.edit,
                                     color: Colors.black,
                                     size: 15.0,
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             InkWell(
                               onTap: () {
                                 _ac.id=_ac.address[index]['id'];
                                 setState(() {loding=true;});
                                 _ac.chosedeafult();
                                 getadressdata();
                               },
                               child: Container(
                                 height: 30.0,
                                 width: 40.0,
                                 decoration: BoxDecoration(
                                     color: Colors.blueGrey.withOpacity(0.8), shape: BoxShape.circle
                                 ),
                                 child: Center(
                                   child: Icon(
                                     Icons.check,
                                     color: Colors.black,
                                     size: 15.0,
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                           ],),
                                (_ac.address[index]['default_address']==1)?
                                const Text('آدرس پیش فرض',
                                  style: TextStyle(fontSize: 18,color: Color.fromRGBO(8, 209, 45, 1)),)
                                    :const Text('')

                              ],
                            ),
                          ),


                        ],),
                    ),
                  );
                }


            ),
          ),

        ],),
      ),
      floatingActionButton: FloatingActionButton(
       backgroundColor: Color.fromRGBO(8, 209, 45, 1),
        onPressed: (){
          Get.to(NewAddress());
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  getadressdata() async {
    await Get.find<AdreessContoroler>().getadress();
    setState(() {});
    await Get.find<AdreessContoroler>().getadress();
    setState(() {
      loding = false;
    });
  }

}
