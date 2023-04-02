import 'package:flutter/material.dart';

class CheckPopup extends StatefulWidget {
  final String message;

  const CheckPopup({Key? key, required this.message}) : super(key: key);

  @override
  _CheckPopupState createState() => _CheckPopupState();
}

class _CheckPopupState extends State<CheckPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black87,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _animation,
              child: const Icon(
                Icons.nights_stay,
                color: Color.fromARGB(255, 85, 87, 224),
                size: 48.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCheckPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CheckPopup(message: message);
    },
  );
}
