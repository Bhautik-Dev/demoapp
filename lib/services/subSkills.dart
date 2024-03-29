import 'package:demoapp/controller/servicescontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubSkills extends StatefulWidget {
  const SubSkills({super.key});

  @override
  State<SubSkills> createState() => _SubSkillsState();
}

class _SubSkillsState extends State<SubSkills> {
  ServicesController servicesController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.getSubSkill("");
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
          "SubSkills",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            onChanged: (value) {
              servicesController.getSubSkill(value);
            },
            decoration: InputDecoration(hintText: "Search SubSkill",prefixIcon: Icon(Icons.search_rounded),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
          child: Obx(() => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            shrinkWrap: true,
            itemCount:servicesController.subSkillsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  Get.back(result: servicesController.subSkillsList[index]['name']);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(servicesController.subSkillsList[index]['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
              );
            }, separatorBuilder: (context, index) {
            return Divider();
          }, ),)
        ),

      ]),
    );
  }
}
