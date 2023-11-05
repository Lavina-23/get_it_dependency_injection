import 'package:flutter/material.dart';
import 'package:get_it_dependency_injection/app_services.dart';
import 'package:get_it_dependency_injection/injection_container.dart';

void main() {
  setup();
  runApp(const DateApp());
}

class DateApp extends StatelessWidget {
  const DateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency Injection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  String currentDate = locator<AppServices>().execute();
                  showSnackBar(currentDate, context);
                },
                child: const Text("Date")),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(String currentDate, BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text(currentDate),
    duration: const Duration(microseconds: 500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
