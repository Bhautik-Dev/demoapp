import 'package:demoapp/controller/offerServiceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OfferSkill extends StatefulWidget {
  const OfferSkill({super.key});

  @override
  State<OfferSkill> createState() => _OfferSkillState();
}

class _OfferSkillState extends State<OfferSkill> {
  OfferServiceController offerServiceController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
offerServiceController.getOfferSkills();
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

          },
            decoration: InputDecoration(
                hintText: "Search Skill",
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
            child:
                Obx(() => ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  shrinkWrap: true,
                  itemCount: offerServiceController.offerSkillList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.back(result: offerServiceController.offerSkillList[index]['name']??"");
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            offerServiceController.offerSkillList[index]['name'],
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
