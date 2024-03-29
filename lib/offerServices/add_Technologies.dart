import 'package:demoapp/controller/offerServiceController.dart';
import 'package:demoapp/offerServices/offer_Skills.dart';
import 'package:demoapp/offerServices/offer_SubSkill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferAddTechnologies extends StatefulWidget {
  const OfferAddTechnologies({super.key});

  @override
  State<OfferAddTechnologies> createState() => _OfferAddTechnologiesState();
}

class _OfferAddTechnologiesState extends State<OfferAddTechnologies> {
  OfferServiceController offerServiceController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 offerServiceController.offerSkill.clear();
 offerServiceController.offerSubSkill.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Add Technologies",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Skills",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
             var result = await Get.to(OfferSkill());
             if(result!=null){
               offerServiceController.offerSkill.text=result;
             }
            },
            child: TextFormField(
              controller: offerServiceController.offerSkill,
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "SubSkills",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
          var result= await Get.to(OfferSubSkill());
          if(result!=null){
            offerServiceController.offerSubSkill.text=result;
          }
            },
            child: TextFormField(
              controller: offerServiceController.offerSubSkill,
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
          )
        ]),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Map<String,dynamic>technologies={
            'technologyName':offerServiceController.offerSkill.text,
            'toolsName':offerServiceController.offerSubSkill.text
          };
       Get.back(result: technologies);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
            child: Row(
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
