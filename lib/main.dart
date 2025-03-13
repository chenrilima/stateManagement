import 'package:flutter/material.dart';
import 'package:statemanagement/presentation/controllers/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: themeController,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeController.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Change Notifier"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Trocar Tema - App'),
              ListenableBuilder(
                  listenable: themeController,
                  builder: (context, child) {
                    return Switch(
                      value: themeController.isDarkTheme,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                    );
                  })
            ],
          ),
        ));
  }
}
