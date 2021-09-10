import 'package:cumple_mar_mobile/pages/create_card_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home' : (_) => CreateCardPage()
      },
    );
  }
}

