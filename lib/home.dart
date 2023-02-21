import 'package:code/characterFormWidget.dart';
import 'package:flutter/material.dart';

import 'characterButtonWidget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('SPELLTASTIC',
            style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontFamily: 'Anaktoria',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CharacterButtonWidget(),
                  const SizedBox(height: 10),
                  CharacterButtonWidget(),
                  const SizedBox(height: 10),
                  CharacterButtonWidget(),
                  const SizedBox(height: 10),
                  CharacterButtonWidget(),
                ],
              ),
            ),
          )),
    );
  }
}
