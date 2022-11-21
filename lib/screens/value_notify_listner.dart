import 'package:flutter/material.dart';
// in this class we learn how we use provider in stateles widget

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({Key? key}) : super(key: key);
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> _toogle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter provider"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _toogle,
            builder: (BuildContext context, value, Widget? child) {
              return TextFormField(
                obscureText: _toogle.value,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: InkWell(
                        onTap: () {
                          _toogle.value = !_toogle.value;
                        },
                        child: _toogle.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _count,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  _count.value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
