import 'package:flutter/material.dart';

class FirstAidView extends StatelessWidget {
  const FirstAidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("សង្រ្គោះបន្ទាន់ ស្ថិតក្នុងការ អភិវឌ្ឍន៍",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
