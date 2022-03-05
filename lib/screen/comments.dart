import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noyaft/contoroler/commentcontoroler.dart';
import 'package:readmore/readmore.dart';


class Comments extends StatelessWidget {
  int pid;
  int rate;
  String number;
  Comments({
    required this.pid,
    required this.rate,
    required this.number,
}) ;
  @override
  CommentCotoroler _cc = Get.put(CommentCotoroler());
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "نظرات کاربران",
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
      body: FutureBuilder(
        builder: (ctx, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Container();


            } else if (snapshot.hasData) {
              return SingleChildScrollView(

                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                          children: [
                            SizedBox(height: 10,),
                           Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(

                                           width: 220,
                                            child: const ReadMoreText(
                                              "  امتیاز کاربران به این محصول",
                                              style: TextStyle(
                                                fontSize: 16,
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

                              ),SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("  "+number+"نفر به این محصول نظر دادند",style: TextStyle(
                                    color: Colors.grey[800]
                                    ,fontSize: 14
                                ),),
                              ],
                            ),
                            SizedBox(height: 10,),
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
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(children: [
                                SizedBox(width: 5,),
                                Icon(Icons.chat,size: 35,),
                                Text("نظرات("+number+")",style: TextStyle(
                                    color: Colors.grey[800]
                                    ,fontSize: 17
                                ),),
                              ],),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: _cc.comment.length,
                              itemBuilder: (BuildContext context , index){
                                if(_cc.comment[index]["response"]==null) {
                                  return  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      color: Colors.lightBlueAccent,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text((_cc.comment[index]["customer"]["full_name"]==' ')
                                                  ?'کاربر'
                                                  :_cc.comment[index]["customer"]["full_name"],
                                              ),
                                              const Text('  :  '),
                                              Container(
                                                  child:
                                                  Text(_cc.comment[index]['comment']['fa']))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else{return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    color: Colors.lightBlueAccent,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text((_cc.comment[index]["customer"]["full_name"]==' ')
                                                ?'کاربر'
                                                :_cc.comment[index]["customer"]["full_name"],
                                            ),
                                            Text('  :  '),
                                            Container(
                                                child:
                                                Text(_cc.comment[index]['comment']['fa']))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('جواب'),
                                            Text('  :  '),
                                            Container(
                                                child:
                                                Text(_cc.comment[index]["response"]["fa"]))
                                          ],
                                        ),

                                      ],),
                                  ),
                                );
                                }

                              }
                          ),
                        ),
                      ],
                    ),
                  ),

              );


            }
          }

          // Displaying LoadingSpinner to indicate waiting state
          return Center(
            child: CircularProgressIndicator(),
          );
        },

        future: _cc.getcomment(pid),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(8, 209, 45, 1),
        onPressed: (){
          _cc.Sendcomment(pid);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  }

