// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SecondScreenWidget extends StatefulWidget {
  const SecondScreenWidget({super.key});

  @override
  State<SecondScreenWidget> createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreenWidget> {
  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();
  int sum = 0;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Simple Calculator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.calculate,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: firstNumController,
                      decoration: InputDecoration(
                          errorText: errorText,
                          hintText: 'First Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: secondNumController,
                      decoration: InputDecoration(
                          hintText: 'Second Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            try {
                              sum = int.parse(firstNumController.text) +
                                  int.parse(secondNumController.text);

                              errorText = '';
                            } catch (error) {
                              setState(() {
                                errorText = error.toString();
                              });
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text('Add Numbers'),
                          ],
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Output: '),
                  Text('$sum'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
