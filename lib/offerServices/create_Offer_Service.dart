import 'package:demoapp/controller/offerServiceController.dart';
import 'package:demoapp/controller/servicescontroller.dart';
import 'package:demoapp/offerServices/add_Technologies.dart';
import 'package:demoapp/offerServices/offer_Domain.dart';
import 'package:demoapp/offerServices/offer_Industry.dart';
import 'package:demoapp/offerServices/offer_Location.dart';
import 'package:demoapp/offerServices/offer_Service_Type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOfferService extends StatefulWidget {
  final dynamic model;
  const CreateOfferService({super.key,this.model});

  @override
  State<CreateOfferService> createState() => _CreateOfferServiceState();
}

class _CreateOfferServiceState extends State<CreateOfferService> {
  OfferServiceController offerServiceController=Get.find();
  ServicesController servicesController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.model!=null){
      offerServiceController.offerSName.text=widget.model['service_name']??"";
      offerServiceController.offerSpoc.text=widget.model['spoc_name']??"";
      offerServiceController.offerCNumber.text=widget.model['contact_no']??"";
      offerServiceController.offerSoLink.text=widget.model['social_link']??"";
      offerServiceController.offerSerLink.text=widget.model['service_link']??"";
      offerServiceController.offerSerType.text=widget.model['service_type']??"";
      offerServiceController.offerLocation.text=widget.model['location']??"";
      offerServiceController.offerMaxUsd.text=widget.model['max_cost']??"";
      offerServiceController.offerIndustry.text=widget.model['industry']??"";
      offerServiceController.offerDomain.text=widget.model['domain']??"";
      offerServiceController.offerTechnolohiesList.clear();
      if(widget.model['skill1']!=""){
        offerServiceController.offerTechnolohiesList.add({
          'technologyName':widget.model['skill1'],
          'toolsName':widget.model['sub_skills1'],
        });
      }
      if(widget.model['skill2']!=""){
        offerServiceController.offerTechnolohiesList.add({
          'technologyName':widget.model['skill2'],
          'toolsName':widget.model['sub_skills2'],
        });
      }
      if(widget.model['skill3']!=""){
        offerServiceController.offerTechnolohiesList.add({
          'technologyName':widget.model['skill3'],
          'toolsName':widget.model['sub_skills3'],
        });
      }
    }else{
      offerServiceController.offerTechnolohiesList.clear();
      offerServiceController.offerSName.clear();
      offerServiceController.offerSpoc.clear();
      offerServiceController.offerCNumber.clear();
      offerServiceController.offerSoLink.clear();
      offerServiceController.offerSerLink.clear();
      offerServiceController.offerSerType.clear();
      offerServiceController.offerLocation.clear();
      offerServiceController.offerMaxUsd.clear();
      offerServiceController.offerIndustry.clear();
      offerServiceController.offerDomain.clear();
    }
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
          "Create Offer Service",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Service Name",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: offerServiceController.offerSName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Spoc Name",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: offerServiceController.offerSpoc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Contact Number",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller:offerServiceController.offerCNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Social Link",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: offerServiceController.offerSoLink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "service Link",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: offerServiceController.offerSerLink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Service Type",
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
             var result = await Get.to(const OfferServiceType());
             if(result!=null){
               offerServiceController.offerSerType.text=result;
             }
              },
              child: TextFormField(
                enabled: false,
                controller: offerServiceController.offerSerType,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      onPressed: () {

                      },
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await Get.to(const OfferLocation());
                          if(result!=null){
                            offerServiceController.offerLocation.text=result;
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: offerServiceController.offerLocation,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Max Cost - USD",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        // enabled: false,
                        controller: offerServiceController.offerMaxUsd,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Industry",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                      var result = await Get.to(const OfferIndustry());
                      if(result!=null){
                        offerServiceController.offerIndustry.text=result;
                      }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: offerServiceController.offerIndustry,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Domain",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await Get.to(const OfferDomain());
                          if(result!=null){
                            offerServiceController.offerDomain.text=result;
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: offerServiceController.offerDomain,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                onPressed: () {},
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                    child: Text(
                      "Technologies",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                InkWell(
                  onTap: () async {
                var result = await Get.to(const OfferAddTechnologies());

                if(result!=null){

                  offerServiceController.offerTechnolohiesList.add(result);
                }
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
             Obx(() => ListView.separated(
               separatorBuilder: (context, index) {
                 return const Divider();
               },
               shrinkWrap: true,
               itemCount: offerServiceController.offerTechnolohiesList.length,
               itemBuilder: (context, index) {
                 return Column(children: [
                   Row(
                     children: [
                       const Expanded(
                           child: Text(
                             "Skill:",
                             style: TextStyle(fontWeight: FontWeight.bold),
                           )),
                       Text(offerServiceController.offerTechnolohiesList[index]['technologyName']??""),
                     ],
                   ),
                   const SizedBox(
                     height: 6,
                   ),
                   Row(
                     children: [
                       const Expanded(
                           child: Text(
                             "SubSkills:",
                             style: TextStyle(fontWeight: FontWeight.bold),
                           )),
                       Text(offerServiceController.offerTechnolohiesList[index]['toolsName']??""),
                     ],
                   ),
                   const SizedBox(
                     height: 8,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       InkWell(
                           onTap: () {
                    offerServiceController.offerTechnolohiesList.removeAt(index);
                           },
                           child: const Text(
                             "DELETE",
                             style: TextStyle(color: Colors.red),
                           ))
                     ],
                   )
                 ]);
               },
             ))
          ]),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
       if(widget.model!=null){
        offerServiceController.updateOffer(widget.model['id']);
       }else{
         offerServiceController.addOfferService();
       }
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.model != null
                  ? const Text(
                " Update Service",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
                  : const Text(
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
}
