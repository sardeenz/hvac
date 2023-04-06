// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

// Demonstrates how to use autofill hints. The full list of hints is here:
// https://github.com/flutter/engine/blob/master/lib/web_ui/lib/src/engine/text_editing/autofill_hint.dart
class DaltCalcDemo extends StatefulWidget {
  const DaltCalcDemo({super.key});

  @override
  State<DaltCalcDemo> createState() => _DaltCalcDemoState();
}

class _DaltCalcDemoState extends State<DaltCalcDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Autofill'),
        title: const Text('Rectangular Ductwork'),
      ),
      body: Form(
        key: _formKey,
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: const [
                Text('Width (Inches)', style: TextStyle(fontSize: 15.0))
              ]),
              Column(children: const [
                Text('Height (Inches)', style: TextStyle(fontSize: 15.0))
              ]),
              Column(children: const [
                Text('Length (Inches)', style: TextStyle(fontSize: 15.0))
              ]),
              Column(children: const [
                Text('Surface Area\n (SQ Feet)',
                    style: TextStyle(fontSize: 15.0))
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
            ]),
            TableRow(children: [
              
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
              Column(children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
              ]),
            ]),
            TableRow(children: [
              Column(children: [Text('12')]),
              Column(children: [Text('24')]),
              Column(children: [Text('48')]),
              Column(children: [Text('24')]),
            ]),
            TableRow(children: [
              Column(children: [Text('')]),
              Column(children: [Text('')]),
              Column(children: [Text('')]),
              Column(children: [Text('')]),
            ]),
          ],
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
