import 'package:flutter/material.dart';
import 'package:se7etyy/screens/welcomeScreen.dart';
import 'package:se7etyy/screens/widgets/dot.dart';
import 'package:se7etyy/screens/widgets/onBoardingPage.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Widget> onboardingPages = [
    OnboardingPage(
      image: 'assets/images/on1.png',
      title: 'آمن وسري',
      description: 'كن مطمئنا لأن خصوصيتك وبياناتك هي أهم أولوياتنا.',
    ),
    OnboardingPage(
      image: 'assets/images/on2on1.png',
      title: 'سهولة الحجز',
      description: 'احجز المواعيد بضغطة زر، في أي وقت ومن أي مكان.',
    ),
    OnboardingPage(
      image: 'assets/images/on3.png', // Replace with your image path
      title: 'ابحث عن دكتور متخصص',
      description:
          'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Welcomescreen()));
                  },
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  return onboardingPages[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                (index) => buildDot(index, currentIndex),
              ),
            ),
            SizedBox(height: 20),
            if (currentIndex == onboardingPages.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Welcomescreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'هيا بنا',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
