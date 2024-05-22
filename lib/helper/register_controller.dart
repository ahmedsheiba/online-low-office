import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:low_office/helper/user_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  final userRepo = Get.put(UserRepository());
}
