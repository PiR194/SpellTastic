import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[200],
        child: Table(
          border: TableBorder.all(
            color: Colors.black,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          children: [
            TableRow(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'LEVEL 1',
                    style: TextStyle(
                      color: Colors.brown,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0, height: 50.0, color: Colors.red),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.purple),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.yellow),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
