
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/searchviewcontoroler.dart';
import 'package:noyaft/screen/singel.dart';
import 'package:persian_number_utility/src/extensions.dart';
import 'package:readmore/readmore.dart';

class SearchView extends StatefulWidget {
  List product;
  SearchView({
    required this.product
});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  bool loading =false;
  @override
  SearchViewContoroler _svc = Get.put(SearchViewContoroler());
  void initState() {
   _svc.pro=widget.product;
  }

  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
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
                    spreadRadius: 1.5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Container(
                     decoration: BoxDecoration(
                       color: Color.fromRGBO(247, 246, 241, 1),
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(10),
                           topRight: Radius.circular(10),
                           bottomLeft: Radius.circular(10),
                           bottomRight: Radius.circular(10)
                       ),
                     ),
                     width: MediaQuery.of(context).size.width,
                     child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         InkWell(
                           onTap: () {
                             Get.back();
                           },
                           child: Container(
                             height: 50.0,
                             width: 60.0,
                             decoration: BoxDecoration(
                                 color: Colors.grey.withOpacity(.3), shape: BoxShape.circle
                             ),
                             child: Center(
                               child:Text("x",style: TextStyle(fontSize: 35,color: Colors.white),)
                             ),
                           ),

                         ),
                       SizedBox(
                             width: MediaQuery.of(context).size.width/2,
                             child: TextFormField(
                               // controller:seda ,
                               onChanged: (value) {
                                 setState(() {
                                   loading=true;
                                 });
                                 _svc.search=value;
                              serdo();
                               },
                               decoration: InputDecoration(
                                 border: InputBorder.none,
                                hintText: "جستجو در نویافت",
                                 contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                 // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),
                             ),
                           ),

                       ],
                     ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        Row(
                          children: [
                            Text('مرتب سازی',style: TextStyle(color: Colors.blue[800],fontSize: 19),),
                            Icon(Icons.upload_sharp,color: Colors.blue[800],)
                          ],
                        ),

                        GestureDetector(
                          onTap: (){

                          },
                          child: Row(
                            children: [
                              Text('فیلتر',style: TextStyle(color: Colors.blue[800],fontSize: 19),),
                              Icon(Icons.upload_sharp,color: Colors.blue[800],)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
              ],) ,
            ),
          ),

            (loading)?
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/4,),
            Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(

                size: 50, color: Colors.grey,
              ))
                    ,
          ],
        )

            : Container(
                height: MediaQuery.of(context).size.height-200,
                child: GridView.builder(
                  shrinkWrap: true,

                  itemCount: _svc.pro.length,
                  itemBuilder: (BuildContext context , index) {
                    var x =  _svc.pro[index]['img'];

                    return
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            side: const BorderSide(color: Colors.black12, width: .5),
                          ),

                          onPressed: () {

                            Get.to(Singel(product_id:  _svc.pro[index]['id'], category_id:   _svc.pro[index]['category_id'],));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:  MainAxisAlignment.spaceAround,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                child: CachedNetworkImage(
                                  imageUrl:     ( _svc.pro[index]['img']== null )
                                      ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                      :'https://noyaft.com/$x',
                                  height: 100,
                                  width: MediaQuery.of(context).size.height/7,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      CircularProgressIndicator(value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    height: 20,
                                    width: MediaQuery.of(context).size.height/6+20,
                                    child: ReadMoreText( _svc.pro[index]['name']['fa'],
                                      style: TextStyle( color:  Colors.black),
                                      trimLines: 1,
                                      colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: '',


                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                  padding:  EdgeInsets.all(8.0),

                                  child: Column(

                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.height/6,
                                        child: Row(

                                          children: [
                                            Text("${ _svc.pro[index]['price']}".seRagham(),style: TextStyle(
                                                color: Colors.grey[600]
                                                ,fontSize: 16
                                                ,fontWeight: FontWeight.bold
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.only(right: 5),
                                              child: Text('ریال',style: TextStyle(
                                                  color: Colors.grey[600]
                                                  ,fontSize: 16 ,fontWeight: FontWeight.bold
                                              ),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),


                            ],),
                        ),
                      );

                  },  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                )
            )

        ],),
      ) ,

    );


  }

  // ali(){
  //   setState(() {loading=false;});
  // }

  serdo()async{
    // setState(() {
    //   loading=true;
    // });
    await _svc.sendsearch();
     // await Future.delayed(const Duration(seconds: 8));
    // await _svc.setsa==true;
    // setState(() {
    //   print("setstateshod");
    //        loading=false;
    //      });
    _svc.ali(setstate: (){
      setState(() {
        loading=false;
      });
    });
    print("asd");

  }
}




