import 'package:flutter/material.dart';

class GridController extends StatelessWidget {
  final bool isGridMode;
  final void Function(bool) toggleGrid;

  const GridController(
      {Key? key, required this.isGridMode, required this.toggleGrid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Grid Mode',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: isGridMode,
            onChanged: toggleGrid,
          )
        ],
      ),
    );
  }
}
