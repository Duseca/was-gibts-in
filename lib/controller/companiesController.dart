import 'package:get/get.dart';

class CompaniesController extends GetxController{
  
  bool isLoading = false;
  List completeList = [];

  changeLoad(load){
    isLoading = load;
    update();
  }

addCompleteList(list){
    completeList = list;
    update();
  }

}