// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_size/window_size.dart';

import 'src/autofill.dart';
import 'src/form_widgets.dart';
import 'src/http/mock_client.dart';
import 'src/sign_in_http.dart';
import 'src/validation.dart';
import 'src/dalt.dart';

void main() {
  setupWindow();
  runApp(const FormApp());
}

const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    // setWindowTitle('Form Samples');
    setWindowTitle('DALT Calculator');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

final demos = [
  Demo(
    // name: 'Sign in with HTTP',
    name: 'Login HVAC For tom',
    route: 'signin_http',
    builder: (context) => SignInHttpDemo(
      // This sample uses a mock HTTP client.
      httpClient: mockClient,
    ),
  ),
  Demo(
    name: 'Customer Details',
    route: 'autofill',
    builder: (context) => const AutofillDemo(),
  ),
  Demo(
    name: 'Duct Form',
    route: 'form_widgets',
    builder: (context) => const FormWidgetsDemo(),
  ),
  // Demo(
  //   name: 'Validation',
  //   route: 'validation',
  //   builder: (context) => const FormValidationDemo(),
  // ),
  Demo(
    name: 'HVAC-Air Condition',
    route: 'HVAC',
    builder: (context) => const FormValidationDemo(),
  ),
  Demo(
    name: 'DALT Calculator',
    route: 'dalt',
    builder: (context) => const DaltCalcDemo(),
  ),
];

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        for (final demo in demos)
          GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context),
          ),
      ],
    ),
  ],
);

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // title: 'Form Samples',
      title: 'Dalt Calculator',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Form Samples'),
        title: const Text('DALT Calulator'),
        // leading: Icon(Icons.account_tree),
        leadingWidth: 100, // default is 56
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 73, 159, 209),
        elevation: 25,
        shadowColor: Colors.orangeAccent,
      ),
      body: ListView(
        children: [...demos.map((d) => DemoTile(demo: d))],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo? demo;

  const DemoTile({this.demo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo!.name),
      onTap: () {
        context.go('/${demo!.route}');
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({required this.name, required this.route, required this.builder});
}
