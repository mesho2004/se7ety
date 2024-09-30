import 'package:flutter/material.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إكمال عملية التسجيل'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.png'), 
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              
              buildTextField('الشخص', 'دكتور عظام', icon: Icons.person),
              SizedBox(height: 16),
              
              
              buildTextField('نبذة تعريفية', 'سجل المعلومات الطبية...', multiline: true),
              SizedBox(height: 16),
              
              buildTextField('عنوان العيادة', '5 شارع مسجد - النمر - الجيزة'),
              SizedBox(height: 16),
              
               Row(
                children: [
                  Expanded(
                    child: buildTextField('من', 'AM 10:00', icon: Icons.access_time),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: buildTextField('إلى', 'PM 10:00', icon: Icons.access_time),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              // Phone Number 1
              buildTextField('رقم الهاتف 1', '20xxxxxxxxx+'),
              SizedBox(height: 16),
              
              // Phone Number 2 (Optional)
              buildTextField('رقم الهاتف 2 (الطواريء)', '20xxxxxxxxx+'),
              SizedBox(height: 16),
              
              // Register Button
              ElevatedButton(
                onPressed: () {
                  // Handle registration action
                },
                child: Text('التسجيل'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.teal,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget buildTextField(String label, String hint, {bool multiline = false, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        TextField(
          maxLines: multiline ? 5 : 1,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon) : null,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
