import 'widgets/levelCounterWidget.dart';
import 'widgets/displaySetButtonWidget.dart';
import 'package:flutter/material.dart';
import 'widgets/createSetButtonWidget.dart';

class DetailsCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage('assets/class_icons/Goblins_Fight.png'),
                  ),
                  Text(
                    'LOU LE GOBELIN',
                    style: TextStyle(
                      fontSize: theme.textTheme.titleLarge!.fontSize,
                      fontFamily: theme.textTheme.titleLarge!.fontFamily,
                      fontWeight: theme.textTheme.titleLarge!.fontWeight,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'CLASS : ' + 'Gobelin',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyLarge!.fontSize,
                      fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                    ),
                  )
                ],
              ),
              // Détails du personnage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'LEVEL :',
                            style: TextStyle(
                              fontSize: theme.textTheme.bodyLarge!.fontSize,
                              fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                            ),
                          ),
                          LevelCounterWidget(),
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