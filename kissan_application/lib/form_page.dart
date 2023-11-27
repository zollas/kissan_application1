import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kissan_application/home_page.dart';
import 'package:geolocator/geolocator.dart';

import 'data.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/environmental-protection-326923.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "GO Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ),
          // Padding(
          // padding:  EdgeInsets.symmetric( horizontal: double.infinity*.3),
          // child:
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.6,
              // constraints: BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 233, 218).withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(20),
              //child: Text("jjjj"),
              child: MyForm(),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}

class FormPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2014/04/17/23/26/environmental-protection-326923_1280.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "GO Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ),
          // Padding(
          // padding:  EdgeInsets.symmetric( horizontal: double.infinity*.3),
          // child:
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.6,
              // constraints: BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 233, 218).withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(20),
              //child: Text("jjjj"),
              child: MyForm(),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  List<String> formValues = [];

  Position? _currentPosition;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _walletController = TextEditingController();
  // TextEditingController _pictureController = TextEditingController();
  // TextEditingController _locationController = TextEditingController();
  late File? _image;

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _image =
        File(''); // Set a default empty file or provide a placeholder image.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.0),
            Text("Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email address';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.0),
            Text("Mobile",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Mobile';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.0),
            Text("Wallet Address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _walletController,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  fillColor: Colors.red,
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Wallet Address';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.0),
            Text("Upload picture",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

            SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                getImage(ImageSource.gallery);
              },
              child: Container(
                color: Colors.black26,
                height: 40,
                width: double.infinity,
                // child: TextButton(
                // onPressed: () => getImage(ImageSource.gallery),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Choose File",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          )),
                    ),
                    _image != null
                        ? Expanded(
                            child: Text(_image!.path,

                                //  "No Choose File",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )
                        : Text("No Choose File",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                  ],
                ),
              ),
              // ),
            ),
            //  if (_currentPosition != null)
            // Text(
            // _image.path,
            //   style: TextStyle(fontSize: 8),
            //   textAlign: TextAlign.center,
            // ),

            SizedBox(height: 10.0),
            Text("Select Location",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            if (_currentPosition != null)
              Text(
                '${_currentPosition!.latitude}   ${_currentPosition!.longitude}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getLocation();
              },
              child: Text('Get Location'),
            ),
            // SizedBox(
            //   height: 40,
            //   child: TextFormField(
            //     controller: _locationController,
            //     decoration: InputDecoration(
            //       focusColor: Colors.black,
            //       focusedBorder: OutlineInputBorder(),
            //       errorBorder: OutlineInputBorder(),
            //       border: OutlineInputBorder(),
            //     ),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter your Select Location';
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserData userData = UserData(
                        name: _nameController.text,
                        email: _emailController.text,
                        mobile: _mobileController.text,
                        wallet: _walletController.text,
                        image: _image!,
                        location: _currentPosition!,
                      );

                      // Add the values to the list
                      formValues = [
                        userData.name,
                        userData.email,
                        userData.mobile,
                        userData.wallet,
                        userData.image.path,
                        'Latitude: ${userData.location.latitude}\nLongitude: ${userData.location.longitude}',
                      ];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NextPage(formValues: formValues),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print(e);
    }
  }
}

class UserData {
  final String name;
  final String email;
  final String mobile;
  final String wallet;
  final File image;
  final Position location;

  UserData({
    required this.name,
    required this.email,
    required this.mobile,
    required this.wallet,
    required this.image,
    required this.location,
  });
}
