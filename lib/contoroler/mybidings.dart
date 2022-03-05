import 'package:get/get.dart';
import 'package:noyaft/contoroler/porofilecontorolers/addrescontoroler.dart';
import 'package:noyaft/contoroler/porofilecontorolers/personalcontoroler.dart';

import 'homepagecontoroler.dart';



class Favoritebiding implements Bindings{




  @override
  void dependencies() {


    Get.put(AdreessContoroler());
    Get.put( PersonalContoroler());
    Get.put( HomepageContoroler());

  }
}