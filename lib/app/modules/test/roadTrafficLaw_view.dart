import 'package:flutter/material.dart';

class RoadTrafficLawView extends StatelessWidget {
  const RoadTrafficLawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset(
              'assets/icons/system.png',
              color: Colors.lightBlue,
              width: 140,
              height: 140,
            ),
            Text(
              "ច្បាប់ចរាចរណ៍ផ្លូវគោក ស្ថិតក្នុងការ អភិវឌ្ឍន៍",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
