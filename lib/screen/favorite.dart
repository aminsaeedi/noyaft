
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/fanoritecontorol.dart';
import 'package:noyaft/screen/singel.dart';
import 'package:readmore/readmore.dart';




class UserFavorite extends StatelessWidget {

  FavoritaContoroler _fc = Get.put(FavoritaContoroler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "کالاهای مورد علاقه",
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
        backgroundColor:Color.fromRGBO(8, 209, 45, 1),) ,


      body:  FutureBuilder(
        builder: (ctx, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Container();


            } else if (snapshot.hasData) {


   return SingleChildScrollView(
        child: Column(children: [
          // Text(mamad.toString()),
          Container(
              height: MediaQuery.of(context).size.height-100,
              width: MediaQuery.of(context).size.width-20,
              child: GridView.builder(

                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  // scrollDirection:Axis.horizontal,
                  itemCount: _fc.userfavorite.length,
                  itemBuilder: (BuildContext context , index) {
                    // print(mamad[index]['product']['img']);
                    var x =_fc.userfavorite[index]['product']['img'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.white,
                              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              side: const BorderSide(color: Colors.black12, width: .5),
                            ),

                            onPressed: () {
                              Get.to(Singel(product_id: _fc.userfavorite[index]['product_id'],
                               category_id: _fc.userfavorite[index]['category_id']));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:  MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                                  child: CachedNetworkImage(
                                    imageUrl:     (_fc.userfavorite[index]['product']['img']== null )
                                        ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                                        :'https://noyaft.com/$x',
                               height: 100,
                      width: MediaQuery.of(context).size.height/7,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                ReadMoreText(_fc.userfavorite[index]['full_product'],
                                style:TextStyle( color:  Colors.black,),
                                trimLines: 3,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '',
                                ),

                               ] ),



                               ),
                        )
                             
                      
                             
                              );}
                              ),
                              
          ),
                            
                            ],),
                    
                       );


          








            }
          }
         
          return Center(
            child: CircularProgressIndicator(),
          );
        },

        future: _fc.getfavorites(),
      ),
    );
  }
}
