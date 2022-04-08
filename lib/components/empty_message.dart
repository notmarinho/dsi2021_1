import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  final String title;

  const EmptyMessage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.do_not_disturb,
            color: Colors.blueAccent,
            size: 50,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
