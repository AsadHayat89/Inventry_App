import 'dart:io';

import 'package:inventry_app/View/Entry/controller/EntryController.dart';
import 'package:inventry_app/View/Property/Controller/PropertyController.dart';
import 'package:inventry_app/widget/CountryWidget.dart';
import 'package:inventry_app/widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/Colors.dart';

class AddEntry extends StatefulWidget {
  @override
  State<AddEntry> createState() => _ListYourPropertyScreenState();
}

class _ListYourPropertyScreenState extends State<AddEntry> {
  var Controller = Get.put(EntryController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
            () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      "Quote your Request",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Name",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.textFieldFillColore,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: DropdownButton(
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          underline: SizedBox(),
                          isExpanded: true,
                          value: Controller.typeAppartment.value,
                          onChanged: (String? newValue) {
                            //Controller.selectedTypeList.value = newValue!;
                            Controller.typeAppartment.value = newValue!;
                          },
                          items: Controller.TypeList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(items),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Phone Number",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.ContactInfo,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.green),
                              hintText: '0',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.green)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),


                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                            width: width,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Property Size (marla)",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: AppColors.AuthTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,

                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            // boxShadow: [
                            //   if(AppConstants.lightVersion==0)
                            //     BoxShadow(
                            //       color: Colors.black12,
                            //       blurRadius: 10,
                            //       offset: const Offset(0, 1),
                            //     ),
                            // ],
                          ),
                          child: TextFormField(
                            controller: Controller.PropertySize,
                            style:
                            GoogleFonts.plusJakartaSans(color: Colors.black),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: '0',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),



                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                            width: width,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Property Location",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: AppColors.AuthTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,

                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            // boxShadow: [
                            //   if(AppConstants.lightVersion==0)
                            //     BoxShadow(
                            //       color: Colors.black12,
                            //       blurRadius: 10,
                            //       offset: const Offset(0, 1),
                            //     ),
                            // ],
                          ),
                          child: TextFormField(
                            controller: Controller.PropertyLocation,
                            style:
                            GoogleFonts.plusJakartaSans(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: 'Location',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),


                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Price Range",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.PriceRange,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.green),
                              hintText: '0',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.green)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Property Description",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.PropertyDescriptions,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Description',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          //print("data recee");
                         Controller.SendApi();
                        },
                        child: Container(
                          height: 55,
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.appBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Controller.login.value
                                  ? CircularProgressIndicator(
                                color: Colors.white54,
                                backgroundColor: Colors.white54,
                              )
                                  : Text(
                                "Create Quote",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    color: AppColors.LightVerison,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
