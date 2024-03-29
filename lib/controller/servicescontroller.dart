import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesController extends GetxController{

  TextEditingController sName =TextEditingController();
  TextEditingController cNumber =TextEditingController();
  TextEditingController sLink =TextEditingController();
  TextEditingController smeIntroduction =TextEditingController();
  TextEditingController cLink =TextEditingController();
  TextEditingController industry =TextEditingController();
  TextEditingController domain =TextEditingController();
  TextEditingController location =TextEditingController();
  TextEditingController sType =TextEditingController();
  TextEditingController eLevel =TextEditingController();
  TextEditingController cost =TextEditingController();
  TextEditingController duration =TextEditingController();
  TextEditingController skills =TextEditingController();
  TextEditingController subSkills =TextEditingController();

  RxList<dynamic>industryList=[].obs;

  RxList<dynamic>domainList=[].obs;
  RxList<dynamic>locationList=[].obs;
  RxList<dynamic>skillsList=[].obs;
  RxList<dynamic>subSkillsList=[].obs;
RxList<dynamic>technolohiesList=[].obs;
List<dynamic> abcdList=[];
List<dynamic> efghiList=[];

 Future getsme() async {
   http.Response response = await http.get(Uri.parse('https://dummyjson.com/products'));
   if(response.statusCode==200){
     var data=jsonDecode(response.body);
     List dr = data['products'];
     abcdList = dr;
   }
 }
 Future getdummy() async {
   http.Response response = await http.get(Uri.parse('https://dummyjson.com/products/1'));
   if(response.statusCode==200){
     var data=jsonDecode(response.body);
     efghiList.add(data);
     debugPrint(efghiList.toString());
   }
 }
Future getIndustry(value) async {
   var response= await http.get(Uri.parse('https://codinghouse.in/platter/general/get_industry?search=$value'));
   if(response.statusCode==200){
     var data=jsonDecode(response.body);
     if(data['status']==1){
       var di =data['data'];
       industryList.value=di;
     }
   }
}
Future getDomain(value) async {
   var response = await http.get(Uri.parse('https://codinghouse.in/platter/general/get_domain?search=$value'));
   if(response.statusCode==200){
     var data=jsonDecode(response.body);
     if(data['status']==1){
       var tj = data['data'];
       domainList.value=tj;
     }
   }
}

RxBool isLoad = false.obs;

Future getLocation(value) async {
  isLoad.value=true;
   var response = await http.get(Uri.parse('https://codinghouse.in/platter/general/get_location?search=$value'));
   if(response.statusCode==200){


  var data=jsonDecode(response.body);

  if(data['status']==1){


    var lp=data['data'];
    locationList.value=lp;
    isLoad.value=false;

  }
   }
}

 Future getskill(value) async {
   var response= await http.get(Uri.parse("https://codinghouse.in/platter/general/get_skills?search=$value"));
   if(response.statusCode==200){
     var data = jsonDecode(response.body);
     if(data["status"]==1){
       var skill=data["data"];
       skillsList.value=skill;
     }
   }
}
Future getSubSkill(value) async {
  var response = await http.get(Uri.parse("https://codinghouse.in/platter/general/get_sub_skills?skill=$value"));
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    if(data['status']==1);
    var subSkill=data['data'];
    subSkillsList.value=subSkill;
  }
}
  // general/get_location?search=**
  // general/get_skills?search=**
  // general/get_sub_skills?skill=**

}