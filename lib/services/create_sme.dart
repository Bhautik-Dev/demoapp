import 'dart:convert';
import 'dart:core';

import 'package:demoapp/controller/servicescontroller.dart';
import 'package:demoapp/services/add_Technologies.dart';
import 'package:demoapp/services/domain.dart';
import 'package:demoapp/services/industry.dart';
import 'package:demoapp/services/location.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SMEProfiles extends StatefulWidget {
  final dynamic model;

  SMEProfiles({super.key, this.model});

  @override
  State<SMEProfiles> createState() => _SMEProfilesState();
}

class _SMEProfilesState extends State<SMEProfiles> {
  ServicesController servicesController = Get.find();

  List<String> serviceTypeList = [];
  List<String> ExpertiseList = [];
  String selectServiceType = "Mentor";
  String selectExpertise = "Manager/Sr Manager";

  // String selectExpertiseLavel = "Mentor";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.model != null) {
      servicesController.sName.text = widget.model['service_name'] ?? "";
      servicesController.cNumber.text = widget.model['contact_number'] ?? "";
      servicesController.sLink.text = widget.model['social_link'] ?? "";
      servicesController.smeIntroduction.text = widget.model['introduction'] ?? "";
      servicesController.cLink.text = widget.model['course_link'] ?? "";
      servicesController.industry.text = widget.model['industry'] ?? "";
      servicesController.domain.text = widget.model['domain'] ?? "";
      servicesController.location.text = widget.model['location'] ?? "";
      servicesController.sType.text = widget.model['service_type'] ?? "";
      servicesController.eLevel.text = widget.model['level'] ?? "";
      servicesController.cost.text = widget.model['cost'] ?? "";
      servicesController.duration.text = widget.model['duration'] ?? "";
      // servicesController.technolohiesList.addAll(widget.model['skills'] ?? []);
      selectServiceType = widget.model['duration']  ?? "";
      selectExpertise = widget.model['level'] ?? "";
if(widget.model['skill1']!= ""){
  servicesController.technolohiesList.add({
    'technologyName':widget.model['skill1'],
    'toolsName':widget.model['sub_skills1'],
  });
}
if(widget.model['skill2']!=""){
  servicesController.technolohiesList.add({
    'technologyName':widget.model['skill2'],
    'toolsName':widget.model['sub_skills2'],
  });
}
if(widget.model['skill3']!=""){
  servicesController.technolohiesList.add({
    'technologyName':widget.model['skill3'],
    'toolsName':widget.model['sub_skills3'],
  });
}

    }else{
      servicesController.sName.clear();
      servicesController.cNumber.clear();
      servicesController.sLink.clear();
      servicesController.smeIntroduction.clear();
      servicesController.cLink.clear();
      servicesController.industry.clear();
      servicesController.domain.clear();
      servicesController.location.clear();
      servicesController.sType.clear();
      servicesController.eLevel.clear();
      servicesController.cost.clear();
      servicesController.duration.clear();
      servicesController.technolohiesList.clear();
    }
    serviceTypeList.add("All");
    serviceTypeList.add("Trainer");
    serviceTypeList.add("Mentor");
    serviceTypeList.add("Evaluator");
    ExpertiseList.add("Manager/Sr Manager");
    ExpertiseList.add("Team Lead/Ops Lead");
    ExpertiseList.add("Retired/Industry Veteran");
    ExpertiseList.add("Senior/Decision Maker");
    ExpertiseList.add("Other");


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
          "Create SME Profiles",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Service Name",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: servicesController.sName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contact Number",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: servicesController.cNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Social Link",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: servicesController.sLink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "SME Introduction",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: servicesController.smeIntroduction,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Course Link",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: servicesController.cLink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Industry",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                var result = await Get.to(Industry());
                if (result != null) {
                  servicesController.industry.text = result;
                  setState(() {});
                }
              },
              child: TextFormField(
                enabled: false,
                controller: servicesController.industry,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      onPressed: () async {
                        var result = await Get.to(Industry());
                        if (result != null) {
                          servicesController.industry.text = result;
                          setState(() {});
                        }
                      },
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Domain",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                var result = await Get.to(Domain());
                if (result != null) {
                  servicesController.domain.text = result;
                  setState(() {});
                }
              },
              child: TextFormField(
                enabled: false,
                controller: servicesController.domain,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      onPressed: () {},
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await Get.to(Location());
                          if (result != null) {
                            servicesController.location.text = result;
                            setState(() {});
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: servicesController.location,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.arrow_drop_down_sharp),
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Type",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField2(
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          // contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Theme.of(context).focusColor,
                                  width: 0.5)),
                          // constraints: const BoxConstraints(maxWidth: 50, maxHeight: 100)
                        ),
                        isExpanded: true,
                        hint: Center(
                          child: servicesController.sType.text.isNotEmpty
                              ? Text(
                                  servicesController.sType.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                )
                              : Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                        ),
                        items: serviceTypeList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Center(
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          servicesController.sType.text = value ?? "";
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          useSafeArea: true,
                          scrollbarTheme: ScrollbarThemeData(
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Expertise Lavel",
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

            DropdownButtonFormField2(
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              decoration: InputDecoration(
                isDense: true,
                // contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 0.5)),
                // constraints: const BoxConstraints(maxWidth: 50, maxHeight: 100)
              ),
              isExpanded: true,
              hint:  Center(
                child: servicesController.eLevel.text.isNotEmpty
                    ? Text(
                        servicesController.eLevel.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      )
                    : Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
              ),
              items: ExpertiseList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Center(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )).toList(),
              onChanged: (value) {
                servicesController.eLevel.text = value ?? "";
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                useSafeArea: true,
                scrollbarTheme: ScrollbarThemeData(
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cost(INR)",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: servicesController.cost,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Duration(Week)",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: servicesController.duration,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Technologies",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                InkWell(
                  onTap: () async {
                    var result = await Get.to(AddTechnologies());
                    if (result != null) {
                      servicesController.technolohiesList.add(result);
                    }
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Obx(() => ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  shrinkWrap: true,
                  itemCount: servicesController.technolohiesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Skill:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Text(servicesController.technolohiesList[index]
                                ['technologyName']),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "SubSkills:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Text(servicesController.technolohiesList[index]
                                ['toolsName']),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  servicesController.technolohiesList
                                      .removeAt(index);
                                },
                                child: Text(
                                  "DELETE",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        )
                      ]),
                    );
                  },
                ))
          ]),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if(widget.model!=null){
            updateSME();
          }else{
            addSME();
          }


        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.model != null
                  ? Text(
                      " Update Service",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Add Service",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  addSME() async {

    String jsonList = jsonEncode(servicesController.technolohiesList);
    debugPrint(jsonList);

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
      "skills": jsonList,
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      Get.back();
    }
  }
  updateSME() async {
    var response = await http.post(Uri.parse("https://codinghouse.in/platter/service/update"),
        body:{
          "user_id":"26",
          "id":widget.model['id'],
          "company_individual":"individual",
          "service_name":servicesController.sName.text,
          "level":servicesController.eLevel.text,
          "contact_number":servicesController.cNumber.text,
          "course_link": servicesController.cLink.text,
          "social_link":servicesController.sLink.text,
          "service_type":servicesController.sType.text,
          "introduction":servicesController.smeIntroduction.text,
          "duration":servicesController.duration.text,
          "cost":servicesController.cost.text,
          "location":servicesController.location.text,
          "industry":servicesController.industry.text,
          "domain":servicesController.domain.text,
          "skills": jsonEncode(servicesController.technolohiesList),
        }
    );
    if(response.statusCode == 200){
      var responseData = jsonDecode(response.body);
      Get.back();

    }

  }
}
