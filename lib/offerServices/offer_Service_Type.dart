import 'package:demoapp/controller/offerServiceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferServiceType extends StatefulWidget {
  const OfferServiceType({super.key});

  @override
  State<OfferServiceType> createState() => _OfferServiceTypeState();
}

class _OfferServiceTypeState extends State<OfferServiceType> {
  OfferServiceController offerServiceController = Get.find();

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
          "Service Type",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Per Hour",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  itemCount: offerServiceController.offerServiceTypeList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Get.back(result:offerServiceController.offerServiceTypeList[index]??"");
                        },
                        child: Row(
                          children: [
                            Text(
                                offerServiceController.offerServiceTypeList[index],
                                style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(color: Colors.black);
                  },
                ),
                const Divider(color: Colors.black,),
                const SizedBox(
                  height: 10,
                ),
                const Text("Per Candidate",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  itemCount:
                      offerServiceController.offerServiceType2List.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Get.back(result:offerServiceController.offerServiceType2List[index]??"");
                        },
                        child: Row(
                          children: [
                            Text(
                                offerServiceController.offerServiceType2List[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black,
                    );
                  },
                ),
                const Divider(color: Colors.black,),
              ],
            )),
      ),
    );
  }
}
