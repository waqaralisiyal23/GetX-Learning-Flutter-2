import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearning2/GetViewAndGetWidget/controllers/count_controller.dart';

/*
We need to understand when to use GetView and GetWidget
Suppose we have a view or we have a screen and that view or screen is dependent
on a single controller then instead of extending the statelesss widget we can extend
GetView or GetWidget. GetView or GetWidget are similar but only have a small
difference.

GetView
If we have a single controller as dependency then we can use GetView instead
of stateless widget and avoid writing Get.find

GetWidget
It is similar to GetView with one difference, it gives the same instance of
Get.find everytime. It becomes very useful when used in combination with Get.create
*/

class GetViewAndGetWidgetScreen extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CountController()); // Creates same instance of CountController
    // Get.create(() =>
    //     CountController()); // Creates different different instances of CountController
    return Scaffold(
      appBar: AppBar(title: Text('GetView')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'The value is ${controller.count}',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class GetViewAndGetWidgetScreen extends GetWidget<CountController> {
//   @override
//   Widget build(BuildContext context) {
//     // Get.put(CountController()); // Creates same instance of CountController
//     Get.create(() =>
//         CountController()); // Creates different different instances of CountController
//     return Scaffold(
//       appBar: AppBar(title: Text('GetWidget')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Obx(
//                 () => Text(
//                   'The value is ${controller.count}',
//                   style: TextStyle(fontSize: 24.0),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.increment();
//                 },
//                 child: Text('Increment'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
