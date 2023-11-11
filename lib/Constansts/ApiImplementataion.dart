import 'dart:io';

import 'package:inventry_app/Model/AuthDetail.dart';
import 'package:inventry_app/Model/Cutomer.dart';
import 'package:inventry_app/Model/DealModel.dart';
import 'package:inventry_app/Model/Employee.dart';
import 'package:dio/dio.dart';
import 'package:inventry_app/Model/Inventry.dart';
import 'package:inventry_app/View/Entry/AddEntry.dart';

import 'ApisConstants.dart';

class ApiImplementation {
  static Dio dio = Dio();

  static Future<Auth> LoginApi(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap({
      'email': '${data['email']}',
      'password': '${data['password']}',
      // Add more fields as needed
    });

    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.LoginUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Auth authData = Auth();
        return authData;
      } else if (response.data['status'] == "success") {
        Auth authData = Auth.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Auth();
    }
    return Auth();
  }

  static Future<Auth> SignUpApi(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    print("data which is goind to send: " + data.toString());
    print(ApiConstans.BaseUrl + ApiConstans.SignUpUrl);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.SignUpUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Auth authData = Auth();
        return authData;
      } else if (response.data['status'] == "success") {
        Auth authData = Auth.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Auth();
    }
    return Auth();
  }

  static Future<Employee> AddEmployee(
      Map<String, dynamic> data, File imageFile) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'image', imageFile.path);
    // formData.files.add( MapEntry(
    //   'image', // The key you want to use for the image
    //     multipartFile
    // ),);
//    request.files.add(multipartFile);\

    if (imageFile.existsSync()) {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Employee authData = Employee();
        return authData;
      } else if (response.data['status'] == "success") {
        Employee authData = Employee.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Employee();
    }
    return Employee();
  }

  static Future<Cutomer> AddCutomer(
      Map<String, dynamic> data, File imageFile) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'image', imageFile.path);
    // formData.files.add( MapEntry(
    //   'image', // The key you want to use for the image
    //     multipartFile
    // ),);
//    request.files.add(multipartFile);\

    if (imageFile.existsSync()) {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addCutomer,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Cutomer authData = Cutomer();
        return authData;
      } else if (response.data['status'] == "success") {
        Cutomer authData = Cutomer.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Cutomer();
    }
    return Cutomer();
  }

  static Future<List<Employee>> getAllEmployees() async {
    List<Employee> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllEmployees,
        //headers: {"Content-Type": "multipart/form-data"},
      );

      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Employee.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<Cutomer>> getAllCustomers() async {
    List<Cutomer> employessLsit = [];

    try {
      print("Sending request: " +
          (ApiConstans.BaseUrl + ApiConstans.getAllCutomer));
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllCutomer,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Cutomer.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<DealModel> AddDeal(
      Map<String, dynamic> data, File imageFile) async {
    FormData formData = FormData.fromMap(data);

    if (imageFile.existsSync()) {
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addDeal);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addDeal,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        DealModel authData = DealModel();
        return authData;
      } else if (response.data['status'] == "success") {
        DealModel authData = DealModel.fromJson(response.data['responce']);
        // print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return DealModel();
    }
    return DealModel();
  }

  static Future<Inventry> AddInventry(
      Map<String, dynamic> data, File imageFile) async {
    FormData formData = FormData.fromMap(data);

    if (imageFile.existsSync()) {
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addDeal);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addInventry,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Inventry authData = Inventry();
        return authData;
      } else if (response.data['status'] == "success") {
        Inventry authData = Inventry.fromJson(response.data['responce']);
        // print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Inventry();
    }
    return Inventry();
  }

  static Future<String> AddEntry(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    print(ApiConstans.BaseUrl + ApiConstans.AddEntry);

    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.AddEntry,
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Inventry authData = Inventry();
        return "error";
      } else if (response.data['status'] == "success") {
        Inventry authData = Inventry.fromJson(response.data['responce']);
        // print("Auth REsponce dataL " + authData.email.toString());
        return "success";
      }
    } catch (e) {
      print("failed: " + e.toString());
      return "error";
    }
    return "fail";
  }

  static Future<List<Inventry>> getInventry() async {
    List<Inventry> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getInventry,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);

        for (var employeeData in response.data['responce']) {
          print(employeeData.toString());
          employessLsit.add(Inventry.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<DealModel>> getAllDeals() async {
    List<DealModel> employessLsit = [];
    try {
      print("reache ere");
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.addDeal,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);

        for (var employeeData in response.data['responce']) {
          print(employeeData.toString());
          employessLsit.add(DealModel.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }
}
