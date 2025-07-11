import 'package:flutter/material.dart';
import 'screens/mosaico_screen.dart';

void main() {
  runApp(const MosaicoFotosApp());
}

class MosaicoFotosApp extends StatelessWidget {
  const MosaicoFotosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mosaico Fotos PDF',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system, // usa o modo do sistema (dark ou light)
      home: const MosaicoScreen(),
    );
  }
}
