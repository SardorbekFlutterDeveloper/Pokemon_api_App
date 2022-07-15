import 'package:flutter/material.dart';
import 'package:pokedex_api/models/pokeds_models.dart';
import 'package:pokedex_api/router/my_router.dart';
import 'package:pokedex_api/views/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      
      onGenerateRoute: Routes.instance.onGenerateRoute,
      
    );
  }
}
