import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();

  _textField({String? labelText, onChanged, String? errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        // ignore: prefer_if_null_operators
        errorText: errorText == null ? null : errorText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 350,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   child: Image.asset(
                  //     'bebidas_logo.png',
                  //     width: 30,
                  //     height: 30,
                  //   ),
                  // ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          errorText: controller.validateLogin(),
                          labelText: "login",
                          onChanged: controller.client.chaLogin);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          errorText: controller.validateSenha(),
                          labelText: "Senha",
                          onChanged: controller.client.chaSenha);
                    },
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: controller.isValid ? () {} : null,
                      child: const Text('Entrar'),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(this.context).size.width - 351,
            height: MediaQuery.of(this.context).size.height - 53,
            child: Column(
              children: [
                Image.asset(
                  'assets/b_on_Painel.PNG',
                  width: MediaQuery.of(this.context).size.width,
                  height: MediaQuery.of(this.context).size.height - 56,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
