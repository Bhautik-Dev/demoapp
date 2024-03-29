import 'dart:convert';
import 'package:demoapp/controller/servicescontroller.dart';
import 'package:demoapp/services/create_sme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Services extends StatefulWidget {

  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  ServicesController servicesController = Get.find();
  List<dynamic> smeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSME();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Services",
            style: TextStyle(color: Colors.white),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //     },
          //     icon: Icon(
          //       Icons.add,
          //       color: Colors.white,
          //     ),
          //   ),
          //   SizedBox(
          //     width: 10,
          //   )
          // ],
        ),
        body:

        Column(
          children: [
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SMEProfiles(),
                    )).then((value){
                  getSME();
                });
              },
              child: CircleAvatar(
                maxRadius: 48,
                backgroundColor: Colors.black,
                child: Icon(Icons.add, color: Colors.white, size: 40),),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(height: 20,),
                          Row(children: [
                            Expanded(child: Text("Service Name :", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),)),
                            Text(smeList[index]['service_name'] ?? ""),
                          ],),
                          SizedBox(height: 6,),
                          Row(children: [
                            Expanded(child: Text("Service Type :", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15))),
                            Text(smeList[index]['service_type'] ?? ""),
                          ],),
                          SizedBox(height: 6,),
                          Row(children: [
                            Expanded(child: Text("Level :", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15))),
                            Text(smeList[index]['level']),
                          ],),
                          SizedBox(height: 6,),
                          Row(children: [
                            Expanded(child: Text("Duration(Week) :", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15))),
                            Text(smeList[index]['duration'] ?? ""),
                          ],),
                          SizedBox(height: 6,),
                          Row(children: [
                            Expanded(child: Text("Cost(INR) :", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15))),
                            Text(smeList[index]['cost'] ?? ""),
                          ],),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Matching Profile", style: TextStyle(
                                  color: Colors.deepPurpleAccent, fontSize: 15),),
                            ],),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("View", style: TextStyle(
                                  color: Colors.deepPurpleAccent, fontSize: 15),),
                              SizedBox(width: 20,),
                              Text("Copy", style: TextStyle(
                                  color: Colors.deepPurpleAccent, fontSize: 15),),
                              SizedBox(width: 20,),
                              InkWell(
                                onTap: () {
                                  // updateSME();
                                  Get.to(SMEProfiles(model: smeList[index]))?.then((value){
                                    getSME();
                                  });
                                },
                                child: Text("Edit",
                                  style: TextStyle(color: Colors.green, fontSize: 15),),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                  onTap: () {
                                    deleteSME(smeList[index]['id']);
                                  },
                                  child: Text("Delete", style: TextStyle(
                                      color: Colors.red, fontSize: 15),)),
                            ],),
                        ],
                      ),
                    ));
              }, separatorBuilder: (context, index) {
                return Divider(color: Colors.black,);
              }, itemCount: smeList.length),
            ),
          ],
        )
    );
  }

  getSME() async {
    var response = await http.get(
        Uri.parse("https://codinghouse.in/platter/service/get?user_id=26"));
smeList.clear();
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == 1) {
        List list = responseData['data'];
        smeList = list;
        setState(() {});
      }
    } else {

    }
  }
  deleteSME(id) async {
    var response = await http.post(Uri.parse("https://codinghouse.in/platter/service/delete"),
        body:{
          "id":id
        }
    );
    if(response.statusCode == 200){
      var responseData = jsonDecode(response.body);
      getSME();
    }

  }
  addSME() async {
    var response = await http
        .post(Uri.parse("https://codinghouse.in/platter/service/add"), body: {
      "user_id": "26",
      "company_individual": "individual",
      "service_name": servicesController.sName.text,
      "level": servicesController.eLevel.text,
      "contact_number": servicesController.cNumber.text,
      "course_link": servicesController.cLink.text,
      "social_link": servicesController.sLink.text,
      "service_type": servicesController.sType.text,
      "introduction": servicesController.smeIntroduction.text,
      "duration": servicesController.duration.text,
      "cost": servicesController.cost.text,
      "location": servicesController.location.text,
      "industry": servicesController.industry.text,
      "domain": servicesController.domain.text,
      "skills": jsonEncode(servicesController.technolohiesList),
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      Get.back();
    }
  }




}
