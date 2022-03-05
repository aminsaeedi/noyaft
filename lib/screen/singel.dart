

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noyaft/contoroler/homepagecontoroler.dart';
import 'package:noyaft/contoroler/singelconoroler.dart';
import 'package:persian_number_utility/src/extensions.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:accordion/accordion.dart';

import 'comments.dart';
import 'home_page.dart';
class Singel extends StatefulWidget {
  int category_id;
  int product_id;
  Singel({
    required this.product_id,
    required this.category_id,
  });

  @override
  _SingelState createState() => _SingelState();
}

class _SingelState extends State<Singel> {
  @override
  late int tedad;
  bool axcheker = true;
  int num = 1;

  singelContoroler _sc = Get.put(singelContoroler());
  bool loding = true;
  void initState() {
    super.initState();
    tedad=Get.find<HomepageContoroler>().tedad;
    fulldata();
  }

  Widget build(BuildContext context) {
    if(loding){

      return Scaffold(
        appBar: AppBar(
            title: Text(
            " ",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: (){
                  Get.off(homepage(ini: 2,));
                },
                child: Column(
                  children: [
                    SizedBox(height: 12,),
                    Stack(children: [
                      Icon(Icons.shopping_basket_outlined,size: 30,),
                      Container( alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle),

                        child: Text(tedad.toString()
                          ,style: TextStyle(fontSize: 8,color: Colors.white),),

                      ),


                    ],),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {},
              ),

            ],
            leading:  IconButton(
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
            backgroundColor:Color.fromRGBO(8, 209, 45, 1)),
        body: Column(
          children: [
            SizedBox(height: 25,),

            SizedBox(
              height: MediaQuery.of(context).size.height/4,
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
    int rate = _sc.star;
    _sc.ax.forEach((item) {
      if (item == _sc.img) {
        axcheker = false;
      }
    });
    if (axcheker) {
      _sc.ax.add(_sc.img);
    }
    Widget photo = Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    child: ListView.builder(
                        itemCount: _sc.ax.length,
                        itemBuilder: (BuildContext context, index) {
                          var x = _sc.ax[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _sc.img = _sc.ax[index];
                                setState(() {});
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: (_sc.ax[index] == null)
                                          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                          : 'https://noyaft.com/$x',
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width * 2 / 3 - 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: (_sc.img == null)
                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                        : 'https://noyaft.com/${_sc.img}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
    Widget ratestar = Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const ReadMoreText(
                        "نظرات کاربران",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' ',
                      )),
                  Container(

                    height: 35,
                    width: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          rate = rate - 1;
                          if (rate == 0 || rate > 0) {
                            return const Icon(Icons.star, color: Colors.amber);
                          }
                          ;
                          if (rate < 0) {
                            return const Icon(Icons.star_outline,
                                color: Colors.amber);
                          } else
                            return Container();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [

                    Container(
                      child:Icon(Icons.person_outline_outlined)
                    ),
                    Text(_sc.allcomment),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_sc.price.seRagham()+" ریال",style: TextStyle(
                  color: Colors.grey[900]
                  ,fontSize: 19 ,fontWeight: FontWeight.bold

              ),),
              Text("موجودی: "+_sc.Inventory.seRagham(),style: TextStyle(
                  color: Colors.grey[600]
                  ,fontSize: 14 ,fontWeight: FontWeight.bold

              ),),

            ],
          ),
        ),
      ],
    );
    Widget description =   Container(

        child: Accordion(
          headerBackgroundColor: Colors.grey[200] ,
      contentBackgroundColor: Colors.grey[200],
      contentBorderColor: Colors.grey[200],
      maxOpenSections: 2,

      rightIcon: const Icon(Icons.arrow_circle_down_sharp, color: Colors.black) ,
      children: [
        AccordionSection(
          isOpen: false,
          header: const Text('توضیحات',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
          content: Html(data: _sc.description['fa'].toString(),),
        ),
      ],
    ));
     Widget gocomments= Column(children: [
       Padding(
         padding: const EdgeInsets.only(left: 20.0,right: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("نظرات کاربران",style: TextStyle(
                 color: Colors.grey[900]
                 ,fontSize: 19 ,fontWeight: FontWeight.bold

             ),),
             GestureDetector(
               onTap: (){
                 Get.to(() =>Comments(pid: widget.product_id,
                   rate: rate,
                   number: _sc.allcomment,));
               },
               child: Text("مشاهده ی نظرات",style: TextStyle(
                   color: Colors.blueGrey[800]
                   ,fontSize: 20,fontWeight: FontWeight.bold

               ),),
             ),

           ],
         ),
       ),
       Padding(
         padding: const EdgeInsets.only(left: 20.0,right: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             (_sc.allcomment=="0")?
             Text("کامنتی برای محصول ثبت نشده است",style: TextStyle(
                 color: Colors.grey[600]
                 ,fontSize: 15 ,fontWeight: FontWeight.bold

             ),)
             :Text("کامنت برای این محصول ثبت شده${_sc.allcomment}",style: TextStyle(
                 color: Colors.grey[600]
                 ,fontSize: 15 ,fontWeight: FontWeight.bold

             ),),
            SizedBox(width: 10,)

           ],
         ),
       ),
     ],);
    return Scaffold(
      appBar: AppBar(
          title: Text(
           _sc.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                Get.off(homepage(ini: 2,));
              },
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  Stack(children: [
                    Icon(Icons.shopping_basket_outlined,size: 30,),
                    Container( alignment: Alignment.center,
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle),

                      child: Text(tedad.toString()
                        ,style: TextStyle(fontSize: 8,color: Colors.white),),

                    ),


                  ],),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
                size: 22,
              ),
              onPressed: () {},
            ),

          ],
          leading:  IconButton(
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
          backgroundColor:Color.fromRGBO(8, 209, 45, 1)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            photo,
            ratestar,
            description,
            gocomments,
          ],
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromRGBO(105, 245, 122, .3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              border: Border.all(color: Colors.grey,width: 2),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Container(
                    height: 40.0,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                num++;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.green[800],
                                size: 25,
                              )),
                          Text(
                            "$num",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (num == 1) {
                                } else {
                                  num--;
                                  setState(() {});
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.green[800],
                                size: 25,
                              )),
                        ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text("واحد : عدد",style: TextStyle(
                      color: Colors.grey[700]
                      ,fontSize: 16 ,fontWeight: FontWeight.bold

                  ),),
                ],),
              ),
              GestureDetector(
                onTap:()async{
                  Get.defaultDialog(
                    barrierDismissible: false,
                    onWillPop: ()async{
                      return false;
                    },
                    title: 'لطفا صبر کنید',
                    content: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.amber,
                        valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),

                      ),
                    ),

                  );

                  await Get.find<HomepageContoroler>().sendshop(num,widget.product_id );
                  Get.back();
                  setState(() {

      tedad+=num;
                  });
                } ,
                child: Row(children: [
                  Container(
                    height: 50.0,
width: MediaQuery.of(context).size.width*5/6-30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      color: Color.fromRGBO(8, 209, 45, 1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Text("افزودن به سبد خرید",style: TextStyle(
                            color: Colors.white
                            ,fontSize: 20 ,fontWeight: FontWeight.bold

                        ),),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/7,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                          shape: BoxShape.circle),
                      child: IconButton(onPressed:(){
                        if(_sc.faid ==0){ 
                          _sc.faid=2;
setState(() { 
_sc.sendfavorite(widget.product_id, widget.category_id);
});
                          }
                        else{   _sc.faid=0;
                          setState(() {
_sc.deletfavorite(widget.product_id, widget.category_id);
                          });
                       
                        }

                      },
                          icon:(_sc.faid != 0)?Icon(Icons.favorite,color: Colors.red,)
                              : Icon(Icons.favorite_border,color: Colors.red,)


                      ),
                    ),
                  )

                ],
                ),
              ),

            ],),
          ),

        )
    );
  }

  fulldata() async {
    await Get.find<singelContoroler>().getsingeledata(widget.product_id);
    setState(() {
      loding = false;
    });
  }
}
