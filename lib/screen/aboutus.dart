import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Abutus extends StatelessWidget {
  const Abutus({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "راهنمای فروشگاه",
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
body: Accordion(
            maxOpenSections: 2,
        rightIcon: const Icon(Icons.arrow_circle_down_sharp, color: Colors.black) ,
            children: [
              AccordionSection(
                isOpen: false,
                header: const Center(child:  Text('درباره ما',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                content: Text('متن درباره ما',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              
                ),
                 AccordionSection(
                isOpen: false,
                header: const Center(child:  Text('فروشگاه نویافت',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                content: Text('متن فروشگاه',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              
                ),
                 AccordionSection(
                isOpen: false,
                header: const Center(child:  Text('درباره ما',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                content: Text('متن قوانین',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              
                )
            ]),
);
                
                 }
}