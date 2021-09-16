import 'package:cumple_mar_mobile/pages/create_card_page.dart';
import 'package:cumple_mar_mobile/pages/initial_page.dart';
import 'package:cumple_mar_mobile/services/cards_services.dart';
import 'package:cumple_mar_mobile/services/validations_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(AppState());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'initial',
      routes: {
        'initial': (_) => InitialPage(),
        'home'   : (_) => CreateCardPage(),
      },
    );
  }
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardsService()),
        ChangeNotifierProvider(create: (_) => ValidationService()),
      ],
      child: MyApp(),
    );
  }
}

