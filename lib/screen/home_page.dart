import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/homepagecontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';
import 'package:noyaft/screen/aboutus.dart';
import 'package:noyaft/screen/favorite.dart';


import 'package:noyaft/screen/porofile/personal.dart';
import 'package:noyaft/screen/porofile/wallet.dart';
import 'package:noyaft/screen/requestwastage.dart';
import 'package:noyaft/screen/searchview.dart';
import 'package:noyaft/screen/showproduct1.dart';
import 'package:noyaft/screen/singel.dart';
import 'package:noyaft/screen/singorlog.dart';
import 'package:readmore/readmore.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

import 'buy/picaddres.dart';
import 'porofile/addrese.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
class homepage extends StatefulWidget {

 int ini;
 homepage({
   required this.ini
});
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin {
  late TabController tabController;


  HomepageContoroler _home=Get.put(HomepageContoroler());
  @override
  bool loding=true;
  late int selectedPage;
  late final PageController _pageController;


  int state = 0;
  void initState() {
    tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.ini);
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    super.initState();
    fulldata();
  }

  Widget build(BuildContext context) {
    if(loding){

      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Material(
                elevation: 10.0,
                shadowColor: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    alignment: Alignment.center,
                    decoration:  ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 5,right: 5,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('نویافت',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                                  ,color: Colors.green
                              ),),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 50.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan.withOpacity(0.2), shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.notifications_active,
                                          color: Colors.blue,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 50.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreenAccent.withOpacity(0.3), shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.question_answer_rounded,
                                          color: Colors.green,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(UserFavorite());
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.3), shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(Abutus());
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey.withOpacity(0.3), shape: BoxShape.circle
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 3,),
                                          Center(
                                            child: Text('?'
                                              ,style: TextStyle(
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold
                                                  ,color: Colors.blueGrey
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                            ],),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: .8,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,left: 5,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              InkWell(
                                onTap: () {

                                  // Get.to(SearchView());
                                },
                                child: Container(
                                  height: 50.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.3), shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ),
                                ),

                              ),



                              GestureDetector(
                                onTap: (){
                                  Get.to(RequestWastage());
                                },

                                child: Container(color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('درخواست جمع آوری ضایعات',style: TextStyle(fontSize: 17,color: Colors.grey),),
                                      SizedBox(width: 20,),
                                      Container(
                                        height: 40,
                                        width:50,

                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/bazyaft.png',),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                    ],),
                                ),
                              ),



                            ],
                          ),
                        ),

                      ],
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/5,
            ),
            Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(

                size: 50, color: Colors.grey,
              ),
            ),
          ],
        ),
        bottomNavigationBar:Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors .white,
            unselectedLabelColor: Colors .grey ,
            labelColor: Colors.green[500],


            tabs: [

              Tab(
                  icon:

                  Icon(Icons.home_outlined,size: 35)
              ),
              Tab(icon:
              Icon(Icons.category_outlined,size: 35,)
              ),

              Tab(

                child: Stack(children: [
                  Icon(Icons.shopping_basket_outlined,size: 35,),
                  Container( alignment: Alignment.center,
                    height: 17,
                    width: 17,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle),

                    child: Text(_home.tedad.toString()
                      ,style: TextStyle(fontSize: 8,color: Colors.white),),

                  ),


                ],),

                //      icon:
                // Icon(Icons.shopping_basket_outlined,size: 35,)
              ),
              Tab(icon:Icon(Icons.person_outline_outlined,size: 35,)),
            ],
          ),
        ),
      );
    }

    List sefare=[];
    _home.tedad=0;

    _home.sabad.forEach((item){
      int nn= int.parse( item['number']);
      _home.tedad =  _home.tedad+nn;
      int pp=item['product_id'];
      var x = <String, dynamic>{};
      x ["number"]= nn;
      x ["product_id"]= pp;
// String la=json.encode(x);
      sefare.add(x);


    });
   _home.sefaresh=sefare;




    int prina=0;
    _home.sabad.forEach((item){
      prina += int.parse(item["price_after_off"])*int.parse(item['number']);
    });
    _home.gheymat=prina.toString();
    // _home.tedad=_home.sefaresh.length.toString();


Widget home = SingleChildScrollView(
  child:
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 25,),
      Padding(
        padding: const EdgeInsets.all(11.0),
        child: Material(
          elevation: 10.0,
          shadowColor: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
              alignment: Alignment.center,
              decoration:  ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 5,right: 5,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('نویافت',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                            ,color: Colors.green
                        ),),
                        const SizedBox(
                          width: 25.0,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.cyan.withOpacity(0.2), shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: Colors.blue,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent.withOpacity(0.3), shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.question_answer_rounded,
                                    color: Colors.green,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(UserFavorite());
                              },
                              child: Container(
                                height: 50.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3), shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(Abutus());
                              },
                              child: Container(
                                height: 50.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.3), shape: BoxShape.circle
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 3,),
                                    Center(
                                      child: Text('?'
                                        ,style: TextStyle(
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold
                                            ,color: Colors.blueGrey
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: .8,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        InkWell(
                          onTap: () {
                            Get.to(SearchView(product:  _home.products,));
                          },
                          child: Container(
                            height: 50.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3), shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                          ),

                        ),



                        GestureDetector(  onTap: (){
                          Get.to(RequestWastage());
                        },
                          child: Container(color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('درخواست جمع آوری ضایعات',style: TextStyle(fontSize: 17,color: Colors.grey),),
                                SizedBox(width: 20,),
                                Container(
                                  height: 40,
                                  width:50,

                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/bazyaft.png',),
                                      )
                                  ),
                                ),
                                SizedBox(width: 10,),
                              ],),
                          ),
                        ),



                      ],
                    ),
                  ),

                ],
              )),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
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
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        selectedPage = page;
                      });
                    },
                    itemCount: _home.slider.length,
                    itemBuilder: (context, index) {
                      var f=_home.slider[index];
                      return CachedNetworkImage(
                        imageUrl: (_home.slider[index]=='')
                            ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                            :'https://noyaft.com/$f',
                        height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Container(color: Colors.white,),



                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    },

                    // Can be null
                  ),

                ),
                PageViewDotIndicator(
                  currentItem: selectedPage,
                  count: _home.slider.length,
                  unselectedColor: Colors.grey,
                  selectedColor: Colors.blue,
                  size: const Size(8, 8),
                ),
              ],
            ),
          ),
        ),
      ),

      SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 5,
                    width: 18,
                    decoration:  ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      color: Colors.green[700],),
                  ),
                ),
                Text('جدیدترین محصولات',style: TextStyle(color: Colors.green[600],fontSize: 16),),
              ],
            ),
            Row(
              children: [
                Text('نمایش همه',style: TextStyle(color: Colors.blue[900],fontSize: 15),),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 10.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[900],
                      size: 19.0,

                    ),
                  ),
                ),
              ],
            ),

          ],),
      ),
      SizedBox(height: 10,),
      Row(
        children: [

          Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: _home.buy.length,
                  itemBuilder: (BuildContext context , index) {
                    var x =_home.buy[index]['img'];
                    if (_home.buy[index]['index_title'] == null) {
                      return Container();
                    }
                    else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            side: const BorderSide(color: Colors.black12, width: .5),
                          ),

                          onPressed: () {

                           Get.to(Singel(product_id: _home.buy[index]['id'], category_id:  _home.buy[index]['category_id'],));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:  MainAxisAlignment.spaceAround,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                child: CachedNetworkImage(
                                  imageUrl:     (_home.buy[index]['img']== null )
                                      ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                      :'https://noyaft.com/$x',
                                  height: 120,
                                  width: MediaQuery.of(context).size.height/7,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Container(color: Colors.white,),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    height: 20,
                                    width: MediaQuery.of(context).size.height/6+20,
                                    child: ReadMoreText(_home.buy[index]['name']['fa'],
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
                                            Text("${_home.buy[index]['price']}".seRagham(),style: TextStyle(
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
                    }
                  }


              )
          ),


        ],
      ),

      SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 5,
                    width: 18,
                    decoration:  ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      color: Colors.green[700],),
                  ),
                ),
                Text('پرفروش ترین ها',style: TextStyle(color: Colors.green[600],fontSize: 16),),
              ],
            ),
            Row(
              children: [
                Text('نمایش همه',style: TextStyle(color: Colors.blue[900],fontSize: 15),),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 10.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[900],
                      size: 19.0,

                    ),
                  ),
                ),
              ],
            ),

          ],),
      ),
      SizedBox(height: 10,),
      Row(
        children: [

          Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: _home.visit.length,
                  itemBuilder: (BuildContext context , index) {
                    var x =_home.visit[index]['img'];
                    if (_home.visit[index]['index_title'] == null) {
                      return Container();
                    }
                    else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            side: const BorderSide(color: Colors.black12, width: .5),
                          ),

                          onPressed: () {
                            Get.to(Singel(product_id: _home.buy[index]['id'], category_id:  _home.buy[index]['category_id'],));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:  MainAxisAlignment.spaceAround,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                child: CachedNetworkImage(
                                  imageUrl:     (_home.visit[index]['img']== null )
                                      ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                      :'https://noyaft.com/$x',
                                  height: 120,
                                  width: MediaQuery.of(context).size.height/7,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                       Container(color: Colors.white,),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    height: 20,
                                    width: MediaQuery.of(context).size.height/6+20,
                                    child:  ReadMoreText(_home.visit[index]['name']['fa'],
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
                                            Text("${_home.visit[index]['price']}".seRagham(),style: TextStyle(
                                                color: Colors.grey[600]
                                                ,fontSize: 16 ,fontWeight: FontWeight.bold

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
                    }
                  }


              )
          ),


        ],
      ),
      SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 5,
                    width: 18,
                    decoration:  ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      color: Colors.green[700],),
                  ),
                ),
                Text('پربازدیدترین ها',style: TextStyle(color: Colors.green[600],fontSize: 15),),
              ],
            ),
            Row(
              children: [
                Text('نمایش همه',style: TextStyle(color: Colors.blue[900],fontSize: 16),),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 10.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[900],
                      size: 19.0,

                    ),
                  ),
                ),
              ],
            ),

          ],),
      ),
      SizedBox(height: 10,),
      Row(
        children: [

          Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: _home.visit.length,
                  itemBuilder: (BuildContext context , index) {
                    var x =_home.visit[index]['img'];
                    if (_home.visit[index]['index_title'] == null) {
                      return Container();
                    }
                    else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            side: const BorderSide(color: Colors.black12, width: .5),
                          ),

                          onPressed: () {
                            Get.to(Singel(product_id: _home.buy[index]['id'], category_id:  _home.buy[index]['category_id'],));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:  MainAxisAlignment.spaceAround,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                child: CachedNetworkImage(
                                  imageUrl:     (_home.visit[index]['img']== null )
                                      ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                      :'https://noyaft.com/$x',
                                  height: 120,
                                  width: MediaQuery.of(context).size.height/7,
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        Container(color: Colors.white,),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    height: 20,
                                    width: MediaQuery.of(context).size.height/6+20,
                                    child:  ReadMoreText(_home.visit[index]['name']['fa'],
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
                                            Text("${_home.visit[index]['price']}".seRagham(),style: TextStyle(
                                                color: Colors.grey[600]
                                                ,fontSize: 16 ,fontWeight: FontWeight.bold

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
                    }
                  }


              )
          ),

        ],
      ),




    ],),);


Widget porofile= SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(children: [
SizedBox(height: 35,),

      Container(
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
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Obx(()=>
                    Column(
                      children: [
                        Text(Get.find<PersonalContoroler>().name.toString()+ " "+
          Get.find<PersonalContoroler>().familyname.toString()
                          ,style: TextStyle(color: Colors.grey[600],fontSize: 15),),
                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                        TextStyle(fontSize: 0)
                        ),    ],
                    ),
                ),

                Obx(()=>
                    Column(
                      children: [
                        Text(Get.find<PersonalContoroler>().mobile.toString()
                          ,style: TextStyle(color: Colors.grey[600],fontSize: 15),),
                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                        TextStyle(fontSize: 0)
                        ),    ],
                    ),
                ),

              ],),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Obx(()=>
                    Column(
                      children: [
                        Text("نام فروشگاه : "+Get.find<PersonalContoroler>().store_name.toString()
                          ,style: TextStyle(color: Colors.grey[600],fontSize: 15),),
                        Text(Get.find<PersonalContoroler>().mame.toString(),style:
                        TextStyle(fontSize: 0)
                        ),    ],
                    ),
                ),

                const Text(''),
              ],),
          ),
          SizedBox(height: 12,),
          Container(height: 1,
          width: MediaQuery.of(context).size.width,
            color: Colors.grey[500],
          ),
                ListTile(
                  title: Text('کیف پول'),

                  leading: Icon(Icons.wallet_membership,size: 25,color: Colors.indigo,),
                  onTap: (){
                    Get.to(Wallet());
                  },

                ),
                ListTile(
                  title: Text('سفارشات من'),
                  leading: Icon(Icons.list_alt,size: 25,color: Colors.indigo,),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('ضایعات من'),
                  leading: Icon(Icons.ad_units_outlined,size: 25,color: Colors.indigo,),
                  onTap: (){},
                ),
                Container(height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[500],
                ),
                ListTile(
                  title: Text('آدرس ها'),
                  leading: Icon(Icons.location_on,size: 25,color: Colors.indigo,),
                  onTap: (){
                    Get.to(Address());
                  },
                ),
                Container(height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[500],
                ),
                ListTile(
                  title: Text('اطلاعات حساب کاربری'),
                  leading: Icon(Icons.edit,size: 25,color: Colors.indigo,),
                  onTap: (){
                    Get.to(Personal());
                  },
                ),
                Container(height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[500],
                ),
                ListTile(
                  title: Text('پشتیبانی'),
                  leading: Icon(Icons.headset_mic,size: 25,color: Colors.indigo,),
                  onTap: (){},
                ),

        ],),
      ),
      SizedBox(height: 25,),
    Container(
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
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),

      child: ListTile(
        title: Text('خروج از حساب کاربری'),

        leading: Icon(Icons.logout,size: 25,color: Colors.indigo,),
        onTap: (){

          Get.defaultDialog(
            barrierDismissible: true,

            title: 'خروج از حساب کاربری',
            content: Text('آیا مطمین هستید'),
            actions:[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  side: const BorderSide(color: Colors.black12, width: .5),
                ),

                child:Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('بله',style: TextStyle(fontSize: 12,color: Colors.black
                      ,fontWeight: FontWeight.bold
                  ),),
                ) ,
                onPressed: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('token', '1399');
                  token= '1399';
                  Get.offAll(Sing());
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  side: const BorderSide(color: Colors.black12, width: .5),
                ),

                child:Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('خیر',style: TextStyle(fontSize: 12,color: Colors.black
                      ,fontWeight: FontWeight.bold
                  ),),
                ) ,
                onPressed: (){
                  Get.back();
                  // Get.offAll(homepage());
                },
              )
            ] ,


          );

        },

      ),
    ),
    ],),
  )

);

    Widget category=SingleChildScrollView(

    child:  Column(
      children: [

        Container(
          height: MediaQuery.of(context).size.height-75,
              child: ListView.builder(
                  itemCount: _home.category.length,
                  itemBuilder: (BuildContext context , index) {
                    var mak =[];
                    _home.products.forEach((item){
                      if( item['category_id']==_home.category[index]['id']){
                        mak.add(item);
                      }
                    });

                    var c = _home.category[index]['title'];

                    var x = _home.category[index]['img'];

                      return GestureDetector(
                        onTap: (){

                           Get.to(Showproduct1(products: mak, title: c["fa"].toString(),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child:Padding(
                            padding: const EdgeInsets.all(15.0),
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
                              child: Stack(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                        child:
                                        Image.network( (_home.category[index]['img']== null  )
                                            ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                            :'https://noyaft.com/$x',
                                          width:MediaQuery.of(context).size.width ,
                                        height: 115,
                                           fit: BoxFit.fill,
                                        ),


                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(.8),
                                              borderRadius: BorderRadius.all(
                                                   Radius.circular(10),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 15.0,right: 15,top: 5,bottom: 5),
                                                  child: Text(c['fa'],style: TextStyle( color:  Colors.grey[700],fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],),
                            ),
                          ),

                        ),
                      );
                    }



              )
          ),
      ],
    ),


    );


Widget sabad =SingleChildScrollView(
  child:Column(children: [
    SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width:MediaQuery.of(context).size.width ,
        height: 80,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(_home.gheymat + " ریال",style: TextStyle(color: Colors.green,
                fontSize: 22
            ),),
          ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50.0,
                width:170,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  color: Color.fromRGBO(20, 255, 20, 1),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: GestureDetector(
                  onTap: (){
                    if(Get.find<AdreessContoroler>().deafhas== 0){
                      Get.snackbar('لطفا آدرس را وارد کنید', "",
                        backgroundColor: Colors.grey.withOpacity(.5),
                        snackPosition: SnackPosition.BOTTOM ,);
                    }else{
                    Get.to(picadrres());}
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text("تایید سفارشات",style: TextStyle(
                          color: Colors.white
                          ,fontSize: 18 ,fontWeight: FontWeight.bold

                      ),),
                    ],),
                ),
              ),
            ),

        ],),
      ),
    ),

    Container(
        height: MediaQuery.of(context).size.height-195,
        width: MediaQuery.of(context).size.width-20,
        child:
        (_home.has) ?    Center(
          child: CircularProgressIndicator(),
        )
            :     ListView.builder(

            itemCount: (_home.sabad.length==0)?1:_home.sabad.length,
            itemBuilder: (BuildContext context , index) {
              int num=int.parse( _home.sabad[index]['number']);

              var x = _home.sabad[index]['product_img'];

              var pid= _home.sabad[index]['product_id'];

              int shid = _home.sabad[index]['id'];
              return  Column(
                children: [

                  (index==0)?     Padding(
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
                            padding: const EdgeInsets.only(top:10.0,left: 20,right: 23,bottom: 10),
                            child: Container(
                              child:
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('ارسال به', style: TextStyle( fontSize: 20,color: Colors.grey[700]),),


                                      GestureDetector(
                                          onTap: (){   Get.to(Address());},
                                          child: Text('انتخاب آدرس', style: TextStyle( fontSize: 20,color: Colors.blue[700]),)),
                                    ],),
                                  SizedBox(height: 15,),
                                  (  Get.find<AdreessContoroler>().deafhas== 0)?
                                  ReadMoreText(
                                    "لطفا آدرس خود را وارد کنید"
                                    ,
                                    style: TextStyle( fontSize: 15,color: Colors.grey[700]),
                                    trimLines: 2,
                                    colorClickableText: Colors.grey,
                                    trimMode: TrimMode.Line,
                                    trimExpandedText: ' ',
                                    trimCollapsedText: ' ',)
                                      : ReadMoreText(
                                   "hhhhhhhhhhhhh" ,
                                    style: TextStyle( fontSize: 15,color: Colors.grey[700]),
                                    trimLines: 2,
                                    colorClickableText: Colors.grey,
                                    trimMode: TrimMode.Line,
                                    trimExpandedText: ' ',
                                    trimCollapsedText: ' ',),
                                ],
                              ),
                            ),
                          ),

                        ],),
                    ),
                  )
                      :Container(),




(_home.sabad.length==0)?Container():
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: MediaQuery.of(context).size.width,
                      height: 200,
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
                        Row(children: [
                          CachedNetworkImage(
                            imageUrl: (_home.sabad[index]['product_img']== null )
                                ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                :'https://noyaft.com/$x',
                            height: 150,
                            width: MediaQuery.of(context).size.width/3,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Container(color: Colors.white,),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          Column(
                            children: [
                              Container(

                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(_home.sabad[index]['product']['full_product'],style:TextStyle( color:  Colors.black,))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                    width: MediaQuery.of(context).size.width/3,
                                    child: Text(_home.sabad[index]['product']['price'],style:TextStyle( color:  Colors.black,))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                    width: MediaQuery.of(context).size.width/3,
                                    child: Text(_home.sabad[index]['product_inventory']+" موجود",style:TextStyle( color:  Colors.grey,fontSize: 12))),
                              ),

                            ],
                          ),
                        ],),
                        Row(

                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                  onTap:()async{
                                    setState(() {
                                      _home.has=true;
                                    });
                                    print(shid);
                                    await _home.deleteshshop(pid, shid);
                                    setState(() {
                                      _home.has=false;
                                    });
                                  },
                                  child: Text("X",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),)),
                            ),

                            Row(
                              children: [
                                IconButton(onPressed: ()async{
                                  setState(() {
                                    _home.has=true;
                                  });

                                  await _home.sendshop( 1, pid);
                                  setState(() {
                                    _home.has=false;
                                  });

                                },
                                    icon: Icon(Icons.add,color: Colors.green,size: 35,)),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("$num",
                                      style:TextStyle( color:  Colors.grey[800],
                                          fontSize: 20)),
                                ),

                                IconButton(onPressed: ()async{

                                  setState(() {
                                    _home.has=true;
                                  });
// print(num-1);
                                  await _home.sendshop( - 1, pid);
                                  setState(() {
                                    _home.has=false;
                                  });
                                },
                                    icon: Icon(Icons.remove,color: Colors.green,size: 35)),

                              ],
                            ),

                          ],)
                      ],),
                    ),
                  ),


                  (index==_home.sabad.length-1)?     Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width:MediaQuery.of(context).size.width ,
                      // height: 80,
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
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text("خلاصه سبد خرید",style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                              ), SizedBox(width: 20,),
                            ],
                          ),


                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text("هزینه کالا های انتخاب شده",style: TextStyle(color: Colors.grey[800],

                                      fontSize: 18
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text(_home.gheymat,style: TextStyle(color: Colors.grey[800],

                                      fontSize: 14
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text("تعداد کالا های انتخاب شده: "+_home.tedad.toString(),style: TextStyle(color: Colors.grey[800],

                                      fontSize: 14
                                  ),),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text("تخفیف اعمال شده 0 ریال",style: TextStyle(color: Colors.red[800],

                                      fontSize: 18
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],),
                    ),
                  )
                      :Container(),


                ],
              );

            }



        )
    ),


  ],),
);

    return Scaffold(

      body:
  TabBarView(
    controller: tabController,
    children: [
      home,
      category,
      sabad,
      porofile,
    ],
  ),



      bottomNavigationBar:Container(
height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TabBar(
controller: tabController,
    indicatorColor: Colors .white,
unselectedLabelColor: Colors .grey ,
    labelColor: Colors.green[500],


          tabs: [

            Tab(
                icon:

                Icon(Icons.home_outlined,size: 30)
            ),
            Tab(icon:
          Icon(Icons.category_outlined,size: 30,)
    ),

            Tab(

                  child: Stack(children: [
                    Icon(Icons.shopping_basket_outlined,size: 30,),
                         Container( alignment: Alignment.center,
                           height: 17,
                           width: 17,
                           decoration: const BoxDecoration(
                             color: Colors.red,
                               shape: BoxShape.circle),

                             child: Text(_home.tedad.toString()
                                ,style: TextStyle(fontSize: 8,color: Colors.white),),

                         ),


                  ],),

           //      icon:
           // Icon(Icons.shopping_basket_outlined,size: 35,)
    ),
            Tab(icon:Icon(Icons.person_outline_outlined,size: 35,)),
          ],
        ),
      ),




    );




  }





  fulldata()async{
    if(widget.ini==0){

    await _home.gethomeapi();
    setState(() {
      loding = false;
    });}

    if(widget.ini==2){
      setState(() {
        loding = false;
      });
    }
  }
}