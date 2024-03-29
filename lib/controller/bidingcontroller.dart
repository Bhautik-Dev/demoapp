import 'package:demoapp/controller/offerServiceController.dart';
import 'package:demoapp/controller/servicescontroller.dart';
import 'package:get/get.dart';

class BindingController implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ServicesController>(() =>ServicesController(),fenix: true);
    Get.lazyPut<OfferServiceController>(() => OfferServiceController(),fenix: true);
  }
}