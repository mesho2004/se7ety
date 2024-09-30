import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:se7etyy/screens/homeScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  File? _image;
  final picker = ImagePicker();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إكمال عملية التسجيل'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/default_profile.png')
                          as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('الشخص', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              initialValue: 'دكتور عظام',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('نبذة تعريفية', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'سجل المعلومات...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('عنوان العيادة', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              initialValue: '5 شارع مصدق - الدقي - الجيزة',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('ساعات العمل من', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () => _selectTime(context, true),
                    decoration: InputDecoration(
                      hintText: _startTime != null
                          ? _startTime!.format(context)
                          : 'AM 10:00',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () => _selectTime(context, false),
                    decoration: InputDecoration(
                      hintText: _endTime != null
                          ? _endTime!.format(context)
                          : 'PM 10:00',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('رقم الهاتف 1', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: '20xxxxxxxxx+',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('رقم الهاتف 2 (اختياري)', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: '20xxxxxxxxx+',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.teal,
              ),
              child: Text(
                'التسجيل',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
