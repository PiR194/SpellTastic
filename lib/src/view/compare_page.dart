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
      body: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: accentColor,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
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
                      dropdownColor: primaryColor,
                      iconEnabledColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: VerticalDivider(
            thickness: 1,
          )),
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [],
            ),
          ),
          Expanded(
              child: VerticalDivider(
            thickness: 1,
          )),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: accentColor,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
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
                      dropdownColor: primaryColor,
                      iconEnabledColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
