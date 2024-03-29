import 'package:demoapp/controller/servicescontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  ServicesController servicesController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.getLocation("");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            onChanged: (value) {
              servicesController.getLocation(value);
            },
            decoration: InputDecoration(hintText: "Select Location",prefixIcon: Icon(Icons.search_rounded),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
          child: Obx(() =>
          servicesController.isLoad==true?Center(child: CircularProgressIndicator()):
              ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            shrinkWrap: true,
            itemCount:servicesController.locationList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  Get.back(result: servicesController.locationList[index]['name']);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(servicesController.locationList[index]['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
              );
            }, separatorBuilder: (context, index) {
            return Divider();
          }, ),),
        ),

      ]),
    );
  }
}
