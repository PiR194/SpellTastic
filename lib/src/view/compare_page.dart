import 'package:flutter/material.dart';

class ComparePage extends StatelessWidget {
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
        title: Text('Compare Page '),
        backgroundColor: accentColor,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 1'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 2'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 3'),
                      value: '3',
                    ),
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(width: 10),
                Expanded(child: Divider(thickness: 1)),
                SizedBox(width: 10),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 1'),
                      value: '1',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 2'),
                      value: '2',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Dropdown 3'),
                      value: '3',
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Expanded(child: Divider(thickness: 1)),
          Container(
            height: 100,
            child: Center(
              child: Text('Space 1'),
            ),
          ),
        ],
      ),
    );
  }
}
