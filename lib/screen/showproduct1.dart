import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/screen/singel.dart';
import 'package:persian_number_utility/src/extensions.dart';
import 'package:readmore/readmore.dart';


class Showproduct1 extends StatelessWidget {
  List products;
  String title;
  Showproduct1({
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text(title  ,
          style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      backgroundColor: Colors.green,
      ),
body: Container(
    child: GridView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context , index) {
        var x = products[index]['img'];

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

                Get.to(Singel(product_id: products[index]['id'], category_id:  products[index]['category_id'],));

              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9,right: 9,top: 5,bottom: 5),
                    child: CachedNetworkImage(
                      imageUrl:     (products[index]['img']== null )
                          ?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwHzCdDvPfd-O9S5oDUItLjGB1Gy-Ra36U2Q&usqp=CAU'
                          :'https://noyaft.com/$x',
                      height: 120,
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
                        child: ReadMoreText(products[index]['name']['fa'],
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
                                Text("${products[index]['price']}".seRagham(),style: TextStyle(
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
),

    );
  }
}
