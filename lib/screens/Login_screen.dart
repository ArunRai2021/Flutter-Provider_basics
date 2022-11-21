import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
// this is the basic class in which we learn how to iplement login api with help of provider in flutter


class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "email"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "password"),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                authprovider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink),
                child: Center(
                    child: authprovider.loading == true
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login")),
              ),
            )
          ],
        ),
      ),
    );
  }
 }
