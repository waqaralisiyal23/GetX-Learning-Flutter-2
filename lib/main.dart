import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxlearning2/FetchAndDisplayAPIData/fetch_display_api_data_screen.dart';
import 'package:getxlearning2/GetCLIAndItsDifferentCommands/get_c_l_i_and_its_different_commands_screen.dart';
import 'package:getxlearning2/GetStorageAndEmailValidation/get_storage_and_email_validation_screen.dart';
import 'package:getxlearning2/GetViewAndGetWidget/get_view_and_get_widget_screen.dart';
import 'package:getxlearning2/widgets/home_button.dart';

void main() async {
  await GetStorage.init(); // Initialize Storage Driver
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Learning 2',
      // initialBinding: ScreenBindings(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Learning 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            HomeButton(
              buttonText: 'Fetch and Display API Data',
              onPressed: () => Get.to(FetchDisplayApiDataScreen()),
            ),
            SizedBox(height: 8.0),
            HomeButton(
              buttonText: 'GetStorage And Email Validation',
              onPressed: () => Get.to(GetStorageAndEmailValidationScreen()),
            ),
            SizedBox(height: 8.0),
            HomeButton(
              buttonText: 'GetView And GetWidget',
              onPressed: () => Get.to(GetViewAndGetWidgetScreen()),
            ),
            SizedBox(height: 8.0),
            HomeButton(
              buttonText: 'Get CLI and its different commands',
              onPressed: () => Get.to(GetCLIAndItsDifferentCommandsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
