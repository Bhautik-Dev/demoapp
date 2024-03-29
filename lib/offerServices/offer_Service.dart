import 'package:demoapp/controller/bidingcontroller.dart';
import 'package:demoapp/controller/offerServiceController.dart';
import 'package:demoapp/offerServices/create_Offer_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferService extends StatefulWidget {
  const OfferService({super.key});

  @override
  State<OfferService> createState() => _OfferServiceState();
}

class _OfferServiceState extends State<OfferService> {
  OfferServiceController offerServiceController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offerServiceController.getOfferServices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          "Offer Services",
          style: TextStyle(color: Colors.white),
        ),

      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(children: [
        Center(
          child: InkWell(
            onTap: () {
              Get.to(const CreateOfferService(),binding: BindingController())?.then((value) {
                offerServiceController.getOfferServices();
              });

            },
            child: const CircleAvatar(
              maxRadius: 48,
              backgroundColor: Colors.black,
              child: Icon(Icons.add, color: Colors.white, size: 40),),
          ),
        ),
            const SizedBox(height: 10,),
            Expanded(
              child: Obx(() => ListView.separated(
                itemCount:offerServiceController.offerServiceList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: 20,),
                            Row(children: [
                              const Expanded(child: Text("Service Name :", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),)),
                              Text(offerServiceController.offerServiceList[index]['service_name']??""),
                            ],),
                            const SizedBox(height: 6,),
                            Row(children: [
                              const Expanded(child: Text("Spoc Name :", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                              Text(offerServiceController.offerServiceList[index]['spoc_name']??""),
                            ],),
                            const SizedBox(height: 6,),
                            Row(children: [
                              const Expanded(child: Text("Service Type:", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                              Text(offerServiceController.offerServiceList[index]['service_type']??""),
                            ],),
                            const SizedBox(height: 6,),
                            Row(children: [
                              const Expanded(child: Text("Max Cost(USD) :", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                              Text(offerServiceController.offerServiceList[index]['max_cost']??""),
                            ],),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: 20,),
                                const Text("Copy", style: TextStyle(
                                    color: Colors.deepPurpleAccent, fontSize: 15),),
                                const SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                 Get.to(CreateOfferService(model: offerServiceController.offerServiceList[index],));
                                  },
                                  child: const Text("Edit",
                                    style: TextStyle(color: Colors.green, fontSize: 15),),
                                ),
                                const SizedBox(width: 20,),
                                InkWell(
                                    onTap: () {
offerServiceController.deleteOfferService(offerServiceController.offerServiceList[index]['id']);
                                    },
                                    child: const Text("Delete", style: TextStyle(
                                        color: Colors.red, fontSize: 15),)),
                              ],),
                          ],
                        ),
                      ));
                }, separatorBuilder: (context, index) {
                return const Divider(color: Colors.black,);
              }, ),)
            ),
      ],)),
    );
  }
}
