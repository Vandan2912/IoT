

import 'package:get/get.dart';
import 'package:iot/model/component.dart';
import 'package:iot/services/database.dart';

class ComponentController extends GetxController{
  var componentList = <Component>[].obs;
  DatabaseService dbs = DatabaseService();

  void onInit(){
    componentList.bindStream(dbs.componentlist);
    print("component list : $componentList");
    super.onInit();
  }
}