import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchGetController extends GetxController{
     
     var type='';
     bool isLoading = false;
   
   changeLoading(l){
    isLoading = l;
   }

   changeType(f){
    type = f;
    update();
   }

   List<DocumentSnapshot> companyDetails = [];
  List<DocumentSnapshot> filteredDetail = [];
  String? searchController;
  // Companies Search
  changeSearch(search) {
    searchController = search;
    filteredDetail = companyDetails
        .where((element) =>
            element['companyName'].toLowerCase().contains(search.toLowerCase()))
        .toList();
    update();
    if (filteredDetail.isNotEmpty) {
      print("detail : ${filteredDetail[0]['companyName']}");
    } else {
      print("empty");
    }
  }



 // location Search
   String searchLocation = '';
  changeLocationSearch(search){
   searchLocation = search;
   update();
  }
}