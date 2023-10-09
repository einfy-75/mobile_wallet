import 'package:flutter/material.dart';
import 'package:dubspay/pages/dashboard/base.dart' ;
import 'package:provider/provider.dart';
import 'package:dubspay/constraints/view_models.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ViewModel())
        ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyBase(),
      ),
    );
  }
}
