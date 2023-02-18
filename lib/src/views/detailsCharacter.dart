import 'levelCounterWidget.dart';
import 'displaySetButtonWidget.dart';
import 'playButtonWidget.dart';
import 'package:flutter/material.dart';
import 'createSetButtonWidget.dart';
import 'selectSetButtonWidget.dart';
import 'home.dart';

class DetailsCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // En-tête
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('assets/images/background_home.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/background_home.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'LOU LE GOBELIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Détails du personnage
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CARACTERISTICS',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'LEVEL :',
                            style: TextStyle(fontSize: 16),
                          ),
                          LevelCounterWidget(),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'RACE :',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Gobelin',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'CLASS :',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Murder',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'DESCRIPTION',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel fringilla metus. Nulla facilisi. Sed efficitur laoreet nulla, eu lobortis justo tincidunt vel. Donec eu elit ultrices, sodales elit quis, ultrices urna. Duis sed volutpat sapien. Duis non erat quis est malesuada commodo vel at velit. Aliquam pulvinar ultricies nulla vel iaculis. Donec interdum vestibulum sem, vel rutrum enim commodo in.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlayButtonWidget(),
                  const SizedBox(
                    width: 15,
                  ),
                  SelectSetButtonWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: CreateSetButton(),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: DisplaySetButton(),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: DisplaySetButton(),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: DisplaySetButton(),
            ),
          ],
        ),
      ),
    );
  }
}
