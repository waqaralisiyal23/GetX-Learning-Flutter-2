import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/*
It is used for persistent key/value storage
Can store String, int, double, List and Map

Remove a Key
getStorage.remove('email');

Erase the container
getStorage.erase();

Create container with a name
final GetStorage getStorage = GetStorage('MyStorage');
await GetStorage.init('MyStorage');     // Initialize
*/

class GetStorageAndEmailValidationScreen extends StatelessWidget {
  GetStorageAndEmailValidationScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Storage and Email Validation')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(controller: _emailController),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () async {
                  if (GetUtils.isEmail(_emailController.text)) {
                    await getStorage.write('email', _emailController.text);
                  } else {
                    Get.snackbar(
                      'Invalid Email',
                      'Please provide valid email',
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: Text('Write'),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  print('The email is ${getStorage.read('email')}');
                },
                child: Text('Read'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
