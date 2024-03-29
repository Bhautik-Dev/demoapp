import 'package:demoapp/controller/servicescontroller.dart';
import 'package:demoapp/services/skills.dart';
import 'package:demoapp/services/subSkills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTechnologies extends StatefulWidget {
   const AddTechnologies({super.key});

  @override
  State<AddTechnologies> createState() => _AddTechnologiesState();
}

class _AddTechnologiesState extends State<AddTechnologies> {
  ServicesController servicesController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.skills.clear();
    servicesController.subSkills.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Add Technologies",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Skills",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              var result = await Get.to(const Skills());
              if (result != null) {
                servicesController.skills.text = result;
              }
            },
            child: TextFormField(
              controller: servicesController.skills,
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "SubSkills",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              var result = await Get.to(const SubSkills());
              if (result != null) {
                servicesController.subSkills.text = result;
              }
            },
            child: TextFormField(
              controller: servicesController.subSkills,
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
          )
        ]),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Map<String,dynamic>technologies={
            'technologyName':servicesController.skills.text,
            'toolsName':servicesController.subSkills.text
          };
          Get.back(result: technologies);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
          "Add",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
        ),
              ],
            )),
      ),
    );
  }
}
