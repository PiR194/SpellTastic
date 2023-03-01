import 'widgets/levelCounterWidget.dart';
import 'widgets/displaySetButtonWidget.dart';
import 'widgets/playButtonWidget.dart';
import 'package:flutter/material.dart';
import 'widgets/createSetButtonWidget.dart';
import 'widgets/selectSetButtonWidget.dart';

class DetailsCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFC2185B);
    const Color accentColor = Color(0xFF9C27B0);
    const Color backgroundColor = Color(0xFFEDE7F6);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: accentColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: screenWidth * 0.05,
            runSpacing: screenHeight * 0.05,
            alignment: WrapAlignment.center,
            children: [
              // En-tête
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage('assets/class_icons/Goblins_Fight.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        'LOU LE GOBELIN',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Anaktoria',
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'CLASS : ' + 'Gobelin',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Anaktoria',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // Détails du personnage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CARACTERISTICS',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Anaktoria',
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'LEVEL :',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Anaktoria',
                            ),
                          ),
                          LevelCounterWidget(),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'RACE : ' + 'Murder',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Anaktoria',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                spacing: screenWidth * 0.05,
                runSpacing: screenHeight * 0.02,
                alignment: WrapAlignment.center,
                children: [
                  Center(
                    child: CreateSetButton(),
                  ),
                  DisplaySetButton(),
                  DisplaySetButton(),
                  DisplaySetButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
