import 'package:demoapp/controller/servicescontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  ServicesController servicesController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.getskill("");
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
          "Skills",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextFormField(onChanged:(value) {
            servicesController.getskill(value);
          },
            decoration: InputDecoration(
                hintText: "Search Skill",
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
            child: Obx(() =>
                ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  shrinkWrap: true,
                  itemCount: servicesController.skillsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.back(result: servicesController
                            .skillsList[index]['name']);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            servicesController.skillsList[index]['name'],
                            style:
                            const TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),)
        ),
      ]),
    );
  }
}
