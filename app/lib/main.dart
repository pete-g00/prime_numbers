import 'dart:math' show max, sqrt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './native.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Is the number prime?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  String isPrime(int number) {
    List<int> checkingUntil = primesUntil(max(sqrt(number).floor(), 2));
    List<int> primeFactors = primeFactorisation(number, checkingUntil);
    if (primeFactors.isEmpty){
      return "Yes, $number is a prime number!";
    } else {
      return "No, $number is not a prime number! It has prime factor(s) ${primeFactors.join(", ")}.";
    }
  }

  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Is the number prime?'),),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter a number to check whether it is a prime.',
              style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Enter a number greater than 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.white,
              child: Text('Check'),
              onPressed: (){
                final value = int.tryParse(controller.value.text);
                if (value != null){
                  setState(() {
                    message = isPrime(value);
                  });
                } else {
                  // show the error message
                  // set the message to be empty
                }
              }
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
