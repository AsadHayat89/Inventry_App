import 'package:get/get.dart';
import 'package:inventry_app/Constansts/ApiImplementataion.dart';
import 'package:inventry_app/Model/DealModel.dart';
import 'package:inventry_app/Model/Inventry.dart';

class HomePageController extends GetxController{
  RxList<DealModel> DealList=<DealModel>[].obs;
  RxList<Inventry> InventryList=<Inventry>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    getAllDeals();
    getAllInventryies();
  }

  void getAllInventryies(){
    ApiImplementation.getInventry().then((value) => {
      if(value.length>0){
        InventryList.value=value,

      }
      else{

      }
    });
  }

  void getAllDeals(){
    ApiImplementation.getAllDeals().then((value) => {
      if(value.length>0){
        DealList.value=value,
        print('Deal list data: '+DealList.length.toString()),
      }
      else{

      }
    });
  }
}