import 'package:flutter/material.dart';
import 'package:weatherapptest/modules/auth/auth_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    navigatetohome();
    super.initState();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AuthPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xff010010),
                  Color(0xff01004A),
                  Color(0xff0500B0),
                  Color(0xff0700F7)
                ],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'WEATHER SERVICE'.replaceAll(' ', '\n'),
              style: const TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter * 0.9,
              child: const Text(
                'dawn is coming soon',
                style: TextStyle(fontSize: 24, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
