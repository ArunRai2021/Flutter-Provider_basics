import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    final exampleOneProvider =
        Provider.of<ExampleOneProvider>(context, listen: true);
    print("build");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Flutter Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, child, value) {
            return Slider(
                min: 0,
                max: 1,
                value: exampleOneProvider.value,
                onChanged: (val) {
                  exampleOneProvider.setValue(val);
                });
          }),
          Consumer(builder: (context, child, value) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(exampleOneProvider.value),
                    child: Center(child: const Text("Container 1`")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green.withOpacity(exampleOneProvider.value),
                    child: Center(child: const Text("Container 2")),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
