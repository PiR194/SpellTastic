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

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: accentColor,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                const Text(
                  'DESCRIPTION',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Anaktoria',
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel fringilla metus. Nulla facilisi. Sed efficitur laoreet nulla, eu lobortis justo tincidunt vel. Donec eu elit ultrices, sodales elit quis, ultrices urna. Duis sed volutpat sapien. Duis non erat quis est malesuada commodo vel at velit. Aliquam pulvinar ultricies nulla vel iaculis. Donec interdum vestibulum sem, vel rutrum enim commodo in.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Anaktoria',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayButtonWidget(),
                      const SizedBox(
                        width: 15,
                      ),
                      SelectSetButtonWidget(),
                    ],
                  ),
                ),
                CreateSetButton(),
                DisplaySetButton(),
                DisplaySetButton(),
                DisplaySetButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
