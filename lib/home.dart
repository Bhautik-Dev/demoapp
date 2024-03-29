import 'package:demoapp/offerServices/offer_Service.dart';
import 'package:demoapp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Demo App",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => Services(),));
           },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(10)),
              child: Text("Subject Matter Expert",style: TextStyle(color: Colors.white),),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Get.to(OfferService());
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(10)),
              child: Text("Offer Services",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      )),
    );
  }
}
