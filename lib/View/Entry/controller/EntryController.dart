import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventry_app/Constansts/ApiImplementataion.dart';
import 'package:inventry_app/Constansts/ConstantToast.dart';

class EntryController extends GetxController {
  RxString typeAppartment = "Build".obs;
  List<String> TypeList = ["Build", "UnBuild"];
  TextEditingController ContactInfo = TextEditingController();
  TextEditingController PriceRange = TextEditingController();
  TextEditingController PropertySoldPrice = TextEditingController();
  TextEditingController PropertyDescriptions = TextEditingController();
  TextEditingController PropertyLocation = TextEditingController();
  TextEditingController PropertySize = TextEditingController();
  RxBool login = false.obs;

  void SendApi() {
    if (ContactInfo.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PriceRange.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertyLocation.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertySize.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else {
      login.value = true;
      Map<String, dynamic> requestData = {
        "Name": "${typeAppartment}",
        "PhoneNumber": "${ContactInfo.text}",
        "Size": "${PropertySize.text}",
        "PriceRange": "${PriceRange.text}",
        "Location": "${PropertyLocation.text}",
      };

      ApiImplementation.AddEntry(requestData).then(
          (value) => {login.value = false,
            ContactInfo.text="",
            PropertySize.text="",
            PriceRange.text="",
            PropertyLocation.text="",
            if (value == "success") {
              ConstantToast.GetToast("Congragulations", "Inventry Added Succesfull",
                  Colors.green[100]!, Colors.green),
          }

            else {

            }}
      );
    }
  }
}
