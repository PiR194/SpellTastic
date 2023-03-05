import 'package:flutter/material.dart';
import 'widgets/spellSetWidget.dart';
import 'home.dart';

class SetDisplay extends StatefulWidget {
  @override
  _SetDisplayState createState() => _SetDisplayState();
}

class _SetDisplayState extends State<SetDisplay> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF9C27B0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nom du set'),
        backgroundColor: accentColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Container(
                  child: SpellSetWidget(
                    level: '1',
                  ),
                ),
                Container(
                  child: SpellSetWidget(
                    level: '2',
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _currentPage == 0
                    ? null
                    : () {
                        _goToPage(_currentPage - 1);
                      },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        _goToPage(_currentPage + 1);
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
