import 'package:flutter/material.dart';

class ButtonBackAppBar extends StatelessWidget {
  const ButtonBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          side: BorderSide(color: Colors.grey, width: 2),
        ),

        icon: Icon(Icons.arrow_back_rounded, size: 20),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineMedium);
  }
}
