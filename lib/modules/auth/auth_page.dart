import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weatherapptest/modules/home/home_page.dart';

import 'auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // String? errorMasseng = '';
  // bool islogin = true;
  bool _hidePass = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseException catch (e) {
      setState(() {
        e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Вход',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              const Text(
                'Введите данные для входа ',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 80),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0700FF)),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const SizedBox(height: 40),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  suffixIcon: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                      icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off,
                      )),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0700FF)),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    createUserWithEmailAndPassword();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0700FF),
                    fixedSize: Size(330, 50),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(color: Colors.white, fontSize: 17),
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
