import 'package:flutter/material.dart';

class RightOfWayView extends StatelessWidget {
  const RightOfWayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("សិទ្ធអតិភាព ស្ថិតក្នុងការ អភិវឌ្ឍន៍",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
