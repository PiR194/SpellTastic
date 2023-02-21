import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('SPELLTASTIC',
            style: TextStyle(color: Colors.black, fontSize: 50)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: ListTile(
                title: const Text(
                  'CREATE CHARACTER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: Text('BARBARE'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('MAGE'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage("assets/images/background_home.png"),
        fit: BoxFit.cover,
      ))),
    );
  }
}
