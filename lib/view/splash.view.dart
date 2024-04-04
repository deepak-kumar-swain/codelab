import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfterLoad();
  }

  gotoLogin() => context.goNamed('login');

  navigateAfterLoad() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    gotoLogin();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Container(
      color: Color(0xfff5862a),
      padding: EdgeInsets.all(9.0),
      child: Center(
        child: SizedBox(
          width: width / 2,
          height: height / 3,
          child: Card(
            elevation: 18,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: Padding(
              padding: EdgeInsets.all(9.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    './assets/images/logo_pic.png',
                    height: 117,
                  ),
                  SizedBox(height: 9),
                  Image.asset(
                    './assets/images/logo_text.png',
                    height: 63,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
