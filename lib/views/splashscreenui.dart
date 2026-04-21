import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/views/WelcomeUI.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff034078),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 400),
            Text(
              'Money Tracking',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),

            Text(
              'Income And Expenses',

              style: TextStyle(fontSize: 20, color: Colors.white),
            ),

            Container(
              child: Column(
                children: [
                  SizedBox(height: 300),
                  Text(
                    "Created by 6619410003",

                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),

                  Text(
                    "-SAU-",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
