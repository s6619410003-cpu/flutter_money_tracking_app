import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/views/home_ui.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff034078),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),

              Image.asset(
                "assets/images/moneybag.png",
                width: 150,
                height: 150,
              ),

              Text(
                "Record Your Money",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),

              Text(
                "Income And Expenses",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),

              SizedBox(height: 200),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffefcfb),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                ),

                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Color(0xff034078)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
