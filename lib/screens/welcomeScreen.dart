import 'package:flutter/material.dart';
import 'package:se7etyy/screens/loginScreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'اهلا بيك',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B7484),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'سجل واحجز عند دكتورك وانت فالبيت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                          fontFamily: "Cairo",

                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                 Spacer(),
                  Container(
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'سجل دلوقتي ك',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(type:"سجل دخول الان ك دكتور"),));

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF0B7484),
                            backgroundColor: Colors.white.withOpacity(0.7),
                            padding: EdgeInsets.symmetric(
                                vertical: 20), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'دكتور',
                              style: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(type:"سجل دخول الان ك مريض"),));

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF0B7484),
                            backgroundColor: Colors.white.withOpacity(0.7),
                            padding: EdgeInsets.symmetric(
                                vertical: 20), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'مريض',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
