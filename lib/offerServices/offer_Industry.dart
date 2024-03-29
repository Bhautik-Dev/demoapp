import 'package:demoapp/controller/servicescontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferIndustry extends StatefulWidget {
  const OfferIndustry({super.key});

  @override
  State<OfferIndustry> createState() => _OfferIndustryState();
}

class _OfferIndustryState extends State<OfferIndustry> {
  ServicesController servicesController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.getIndustry("");
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
          "Industry",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            onChanged: (value) {
           servicesController.getIndustry(value);
            },
            decoration: InputDecoration(hintText: "Select Industry",prefixIcon: Icon(Icons.search_rounded),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
            child:  Obx(() => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              shrinkWrap: true,
              itemCount:servicesController.industryList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.back(result: servicesController.industryList[index]['name']);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(servicesController.industryList[index]['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                );
              }, separatorBuilder: (context, index) {
              return Divider();
            }, ),)
        ),

      ]),
    );
  }
}
