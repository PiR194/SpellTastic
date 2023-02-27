import 'package:code/src/view/widgets/createCharacterButtonWidget.dart';
import 'package:code/src/view/widgets/displayAllSpellButtonWidget.dart';
import 'package:flutter/material.dart';
import 'widgets/characterButtonWidget.dart';

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
                  CreateCharacterButtonWidget(),
                  const SizedBox(height: 10),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: DisplayAllSpellButtonWidget(),
        ),
      ),
    );
  }
}
