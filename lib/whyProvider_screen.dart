import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({Key? key}) : super(key: key);

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count = 0;

  @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     count++;
  //     print(count);
  //     setState(() {});
  //   });
  // }

  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              (count.toString()),
              style: const TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}
