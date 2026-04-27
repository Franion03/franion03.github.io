import 'package:get/get.dart';

class ProjectController  extends GetxController{
  RxMap<int, bool> hovers = <int, bool>{}.obs;


  onHover(int index,bool value){
    hovers[index]=value;
  }
}