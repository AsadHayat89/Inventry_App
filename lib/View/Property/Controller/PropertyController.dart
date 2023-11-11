import 'dart:io';

import 'package:inventry_app/Constansts/ApiImplementataion.dart';
import 'package:inventry_app/Constansts/ConstantToast.dart';
import 'package:inventry_app/Model/Cutomer.dart';
import 'package:inventry_app/Model/Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventry_app/Model/Inventry.dart';

class PropertyController extends GetxController {
  RxString Name = "Property Name".obs;
  RxString Country = "".obs;
  RxString state = "".obs;
  RxString city = "".obs;
  RxList<File> imagesList = <File>[].obs;
 // RxList<Inventry> InventryList = <Inventry>[].obs;
  RxString typeAppartment = "Build".obs;
  RxString typeBuilAppartment = "House".obs;
  RxString selectedTypeList = "".obs;
  List<String> TypeList = ["Build", "UnBuild"];
  List<String> BuildList = ["House", "Villa", "Plaza", "Shop"];

  RxBool login = false.obs;

  String employeesProject = "";
  String companyProfit = "";
  RxString UploadedImage = "No Image Selected yet".obs;
  File ImageData = File("");

  List<Employee> employeessList = [];
  List<String> EmployeesCnic = ["0"];
  List<Cutomer> customersList = [];
  List<String> CutomersCnic = ["0"];
  List<int> EmployeesPercentageList = [0];
  int empoloyeesPercentage = 0;
  String initialEmployeeSlection = "0";
  String initialCustomerSlection = "0";

  TextEditingController PropertyName = TextEditingController();
  TextEditingController PropertySize = TextEditingController();
  TextEditingController PropertyStreetAddress = TextEditingController();
  TextEditingController PropertyPostalCode = TextEditingController();
  TextEditingController PropertyRoom = TextEditingController();
  TextEditingController PropertyBathRoom = TextEditingController();
  TextEditingController PropertyBedRoom = TextEditingController();
  TextEditingController PropertyFileNumbner = TextEditingController();
  TextEditingController PropertyLocation = TextEditingController();
  TextEditingController PropertyEmployeeName = TextEditingController();
  TextEditingController PropertyCustomerName = TextEditingController();
  TextEditingController PropertyMoney = TextEditingController();
  TextEditingController ContactInfo = TextEditingController();
  TextEditingController PropertySoldPrice = TextEditingController();
  TextEditingController PropertyDescriptions = TextEditingController();

  RxList<String> ListAmenties = <String>[].obs;
  RxList<String> ListAmentiesAssets = <String>[].obs;
  RxList<String> ListFeatures = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // empoloyeesPercentage = EmployeesPercentageList[0]!;
  }

  //var MainController=Get.find<homeController>();
  void addImage(File image) {
    imagesList.add(image);
    update(); // call update to notify the UI that the images list has changed
  }

  void MovetoImageProperty() {
    if (imagesList.length == 0) {
      GetToast(
          "Error", "Images Should'nt be Null", Colors.red[100]!, Colors.red);
    } else if (imagesList.length < 6) {
      GetToast("Error", "Images Should'nt be less then 6", Colors.red[100]!,
          Colors.red);
    } else {
      print(imagesList);
      //  Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => PropertyDetail()));
    }
  }

  void MoveLocationProperty() {
    if (Country == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (state == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (city == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (PropertyStreetAddress.text.isEmpty) {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (PropertyPostalCode.text.isEmpty) {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else {
      //Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => ChooseServicePage()));
    }
  }

  Future<bool> SendApi() async {
   if (PropertyName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (ContactInfo.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertyMoney.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (ImageData.path == "") {
      ConstantToast.GetToast(
          "Error", "Please Upload Image", Colors.red[100]!, Colors.red);
    } else {

      Map<String, dynamic> requestData = {
        "name": "${PropertyName.text}",
        "propertySize": "${PropertySize.text}",
        "rooms": "${PropertyRoom.text}",
        "propertyType": "${typeAppartment}",
        "property": "${typeBuilAppartment}",
        "bedroom": "${PropertyBedRoom.text}",
        "bathroom": "${PropertyBathRoom.text}",
        "ExpectedPrice": "${PropertyMoney.text}",
        "contact":"${ContactInfo.text}",
        "description": "${PropertyDescriptions.text}",
        "fileNumber": "${PropertyFileNumbner.text}",
        "location": "${PropertyLocation.text}",
      };

      ApiImplementation.AddInventry(requestData, ImageData).then((value) => {
        login.value = false,
        PropertyName.text = "",
        PropertySize.text = "",
        PropertyRoom.text = "",
        PropertyBedRoom.text = "",
        PropertyBathRoom.text = "",
        PropertyEmployeeName.text = "",
        PropertyCustomerName.text = "",
        PropertyMoney.text = "",
        ContactInfo.text = "",
        PropertyDescriptions.text = "",
        PropertyLocation.text = "",
        if (value.description != null)
          {
            print('dataa recive in description: ' +
                value.description.toString()),
          },
        ConstantToast.GetToast("Congragulations", "Inventry Added Succesfull",
            Colors.green[100]!, Colors.green),
      });
    }
    // Property res= await ApiServices.addPropertyService(imagesList,data);
    // MainController.PropertyList.value.responce!.add(res.responce!.first);
    return true;
  }



  void MoveServiceProperty() {
    if (ListAmenties.length == 0) {
      GetToast(
          "Error", "Amenties Should'nt be Null", Colors.red[100]!, Colors.red);
    } else if (ListFeatures.length == 0) {
      GetToast(
          "Error", "Features Should'nt be Null", Colors.red[100]!, Colors.red);
    } else {
      print(ListAmenties);
      print(ListFeatures);
      print(ListAmentiesAssets);
      // Navigator.of(Get.context!).push(MaterialPageRoute(
      //     builder: (context) => PropertyImagesScreen()));
    }
  }

  void GetToast(
      String title, String g, Color backgorundColor, Color textColor) {
    Get.snackbar(
      title, g,
      snackPosition: SnackPosition.BOTTOM,
      // position
      duration: Duration(seconds: 2),
      // duration
      backgroundColor: backgorundColor,
      // background color
      colorText: textColor,
      // text color
      borderRadius: 10.0,
      // border radius
      margin: EdgeInsets.all(10.0),
    );
  }
}