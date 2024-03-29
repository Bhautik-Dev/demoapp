import 'package:demoapp/controller/servicescontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferLocation extends StatefulWidget {
  const OfferLocation({super.key});

  @override
  State<OfferLocation> createState() => _OfferLocationState();
}

class _OfferLocationState extends State<OfferLocation> {
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            onChanged: (value) {
              servicesController.getLocation(value);
            },
            decoration: InputDecoration(hintText: "Select Location",prefixIcon: const Icon(Icons.search_rounded),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
          child:

          Obx(() => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            shrinkWrap: true,
            itemCount:servicesController.locationList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  Get.back(result:servicesController.locationList[index]['name']);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:  Text(servicesController.locationList[index]['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
              );
            }, separatorBuilder: (context, index) {
            return const Divider();
          }, ),)
        ),

      ]),
    );
  }
}
