import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventry_app/Constansts/ApisConstants.dart';
import 'package:inventry_app/Model/DealModel.dart';
import 'package:inventry_app/Model/Inventry.dart';
import 'package:inventry_app/Model/property.dart';
import 'package:inventry_app/View/HomePage/controller/homePage_controller.dart';
import 'package:inventry_app/View/HomePage/dealDetailScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Constants/Colors.dart';

class InventryHome extends StatefulWidget {
  InventryHome({Key? key}) : super(key: key);

  @override
  State<InventryHome> createState() => _EmployeeGridViewState();
}

class _EmployeeGridViewState extends State<InventryHome> {
  var controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "Inventry",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              ()=> GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                ),
                itemCount: controller.InventryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => dealDetailOption(
                                  dealData: controller.InventryList[index],
                                )));
                      },
                      child: EmployeeCard(employee: controller.InventryList[index]));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final Inventry employee;

  EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    //print(ApiConstans.imageEmployeeBaseUrl + employee.image!);
    return Card(
      elevation: 4, // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      margin: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Image.network(
            ApiConstans.imageInvetryBaseUrl + employee.image!,
            height: 90,
            fit: BoxFit.fill,
          ),
          // Image.asset(
          //   employee.,
          //   height: 90,
          //   fit: BoxFit.fill,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  employee.property!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(employee.propertyType!.toString()),
              ],
            ),
          ),
        ],
      ),
    );


  }


}
