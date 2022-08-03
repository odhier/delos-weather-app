import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: false, title: const Text("Weather App")),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Text('HOME'),
              ElevatedButton(
                onPressed: () => {},
                child: const Text('Go to detail'),
              )
            ],
          )
        ));
  }
}
