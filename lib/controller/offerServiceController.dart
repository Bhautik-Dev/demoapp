import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OfferServiceController extends GetxController {
  List<String> dropDownMenu = ["1", "2"];
  List<dynamic> offerServiceTypeList = [
    "Resource Augmentation",
    "Contracting",
    "Managed Delivery",
    "Business Process Outsourcing",
    "Project Outsourcing"
  ];
  List<dynamic> offerServiceType2List = [
    "Talent search",
    "Trainer",
    "Profile Verification",
    "Evaluation",
    "BGV"
  ];
  RxList<dynamic> offerSkillList = [].obs;
  RxList<dynamic> offerSubSkillList = [].obs;
  RxList<dynamic> offerTechnolohiesList = [].obs;
  RxList<dynamic> offerServiceList =[].obs;

  TextEditingController offerSName = TextEditingController();
  TextEditingController offerSpoc = TextEditingController();
  TextEditingController offerCNumber = TextEditingController();
  TextEditingController offerSoLink = TextEditingController();
  TextEditingController offerSerLink = TextEditingController();
  TextEditingController offerSerType = TextEditingController();
  TextEditingController offerLocation = TextEditingController();
  TextEditingController offerMaxUsd = TextEditingController();
  TextEditingController offerIndustry = TextEditingController();
  TextEditingController offerDomain = TextEditingController();
  TextEditingController offerSkill = TextEditingController();
  TextEditingController offerSubSkill = TextEditingController();

  Future getOfferSkills() async {
    var response = await http.get(
        Uri.parse("https://codinghouse.in/platter/general/get_skills?search="));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 1) {
        var offerSkill = data['data'];
        offerSkillList.value = offerSkill;
      }
    }
  }

  Future getOfferSubSkill() async {
    var response = await http.get(Uri.parse(
        "https://codinghouse.in/platter/general/get_sub_skills?skill="));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 1) {
        var offerSubSkill = data['data'];
        offerSubSkillList.value = offerSubSkill;
      }
    }
  }

  addOfferService() async {
    // offerServiceList.clear();
    var response = await http.post(
        Uri.parse("https://codinghouse.in/platter/CompanyRequirement/add"),
        body: {
    "user_id":26.toString(),

    "requirement_provider":"Provider",
    "service_type" : offerSerType.text,
    "location": offerLocation.text,
    "min_cost":offerMaxUsd.text,
    "max_cost":offerMaxUsd.text,
    "industry":offerIndustry.text,
    "domain":offerDomain.text,
    "spoc_name":offerSpoc.text,
    "service_name":offerSName.text,
    "contact_no":offerCNumber.text,
    "social_link":offerSoLink.text,
    "service_link":offerSerLink.text,
          "skills":jsonEncode(offerTechnolohiesList),
    });
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      if(data['status'] == "1"){

      }
    }
    Get.back();
  }
Future getOfferServices() async {
    var response = await http.get(Uri.parse("https://codinghouse.in/platter/CompanyRequirement/get?user_id=26&requirement_provider=Provider"));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      if(data['status']==1){
        var offerService=data['data'];
        offerServiceList.value = offerService;
      }
    }
}
deleteOfferService(id) async {
    var response =await http.post(Uri.parse("https://codinghouse.in/platter/CompanyRequirement/delete"),body:
    {
      "id" : id,
    }
    );
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      getOfferServices();
    }

}

updateOffer(id) async {
    var response = await http.post(Uri.parse("https://codinghouse.in/platter/CompanyRequirement/update"),
        body:{
          "user_id":26.toString(),
          'id':id,
          "requirement_provider":"Provider",
          "service_type" : offerSerType.text,
          "location": offerLocation.text,
          "min_cost":offerMaxUsd.text,
          "max_cost":offerMaxUsd.text,
          "industry":offerIndustry.text,
          "domain":offerDomain.text,
          "spoc_name":offerSpoc.text,
          "service_name":offerSName.text,
          "contact_no":offerCNumber.text,
          "social_link":offerSoLink.text,
          "service_link":offerSerLink.text,
          "skills":jsonEncode(offerTechnolohiesList),
        }

    );
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      getOfferServices();
      Get.back();
    }

}

}
