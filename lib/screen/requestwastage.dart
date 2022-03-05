import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:noyaft/contoroler/requestwastagecontoroler.dart';
import 'package:readmore/readmore.dart';







class RequestWastage extends StatefulWidget {
  const RequestWastage({Key? key}) : super(key: key);

  @override
  _RequestWastageState createState() => _RequestWastageState();
}

class _RequestWastageState extends State<RequestWastage> {

  RequestWastageContoroler _rc = Get.put(RequestWastageContoroler());
late List<bool> garbagebool;

  void initState() {
    super.initState();
  fulldata();
  }
bool loding=true;
  @override

  Widget build(BuildContext context) {

    if (loding) {
      return  Center(
        child:  LoadingAnimationWidget.staggeredDotsWave(

          size: 50, color: Colors.grey,
        ),
      );
    }




    List<Widget> garbaget = List<Widget>.generate(
        _rc.garbagetaype.length,
            (index) =>SizedBox(
              width: MediaQuery.of(context).size.width/2-15,
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor:Color.fromRGBO(8, 209, 45, 1) ,
                        checkColor: Colors.white,
                        value: garbagebool[index],
                        onChanged: (value) {
                          setState(() {
                            garbagebool[index] = value!;
                          });

                        },
                      ),
                      Text(
                        _rc.garbagetaype[index]["title"]["fa"] ,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Text(
                       "قیمت روز:"+ _rc.garbagetaype[index]["price"]+"ریال" ,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
    );


    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'درخواست جمع آوری ضایعات',
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




      body:

      SingleChildScrollView(


        child: Padding(
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
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Obx(()=>
                          Column(
                            children: [
                              Text("نام فروشگاه: "+Get.find<PersonalContoroler>().store_name.toString()
                                ,style: TextStyle(color: Colors.grey[600],fontSize: 15),),
                              Text(Get.find<PersonalContoroler>().mame.toString(),style:
                              TextStyle(fontSize: 0)
                              ),    ],
                          ),
                      ),
                      Container(
                        height: 20,
                        width: 2,
                        color: Colors.grey,
                      ),
                      Obx(()=>
                          Column(
                            children: [
                              Text("نام مشتری: "+Get.find<PersonalContoroler>().name.toString()+ " "+
                                  Get.find<PersonalContoroler>().familyname.toString()
                                ,style: TextStyle(color: Colors.grey[600],fontSize: 15),),
                              Text(Get.find<PersonalContoroler>().mame.toString(),style:
                              TextStyle(fontSize: 0)
                              ),    ],
                          ),
                      ),

                    ],),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width-30,
                  color: Colors.grey,
                ),
                   Container(

                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:20.0,left: 20,right: 23,bottom: 10),
                          child: Container(
                            child:
                            ReadMoreText("آدرس مشتری: "+
                              Get.find<AdreessContoroler>().deafuiltid['full_province'].toString()+' '+
                                  Get.find<AdreessContoroler>().deafuiltid['full_city'].toString()+' '+
                                  Get.find<AdreessContoroler>().deafuiltid['full_town'].toString()+' '+
                                  Get.find<AdreessContoroler>().deafuiltid['avenue']+' '+
                                  Get.find<AdreessContoroler>().deafuiltid['alley']+' '+'پلاک'
                                  +   Get.find<AdreessContoroler>().deafuiltid['plaque'].toString()
                              ,
                              style: TextStyle( fontSize: 15,color: Colors.grey[700]),
                              trimLines: 2,
                              colorClickableText: Colors.grey,
                              trimMode: TrimMode.Line,
                              trimExpandedText: ' ',
                              trimCollapsedText: ' ',),
                          ),
                        ),

                      ],),
                  ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    width: MediaQuery.of(context).size.width-90,
                    alignment: Alignment.topCenter,
                    color: Color.fromRGBO(247, 246, 241, 1),
                    child: TextFormField(
                      onChanged: (value){
                        _rc.decrtion=value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('*وزن تقریبی')


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
                        _rc.decrtion=value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('توضیحات')


                      ),


                    ),

                  ),
                ),
                SizedBox(height: 20,),
                Container(

                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Container(

                            width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height/2.5,
                            child: Wrap(
                            children: garbaget,
                               // padding: const EdgeInsets.all(0),
                               // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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

                        child:      Text('تایید درخواست',
                          style:
                          TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      )
    );
  }
  fulldata()async{
    await _rc.gettyeps();
    garbagebool = List<bool>.generate(
        _rc.garbagetaype.length,
            (index) => false
    );
setState(() {
  loding=false;
});
  }
}

