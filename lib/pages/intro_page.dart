import 'package:flutter/material.dart';
import 'package:shopapp/pages/home.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool ispressed = false;

  void press() async {
    setState(() {
      ispressed = true;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        ispressed = false;
      });
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            //logo
            children: [
              Image.asset(
                'lib/images/logo.png',
                height: 90,
              ),
              Text(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                'Step Up. Stand Out.',
              ),
              Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
                'Step into style with the finest men’s shoes... premium quality, unbeatable prices, and ultimate comfort, all in one place.',
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => press(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color:
                        ispressed
                            ? Colors.grey.shade100
                            : Colors.transparent,
                    border: Border.all(
                      color: const Color.fromARGB(
                        15,
                        0,
                        0,
                        0,
                      ),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          'Shop Now',
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
