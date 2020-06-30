import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

class DraggableDoughPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = Stack(
      children: [
        Positioned(
          left: 50,
          top: 10,
          child: DraggableDough<String>(
            data: "hi",
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            feedback: Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Dough'),
      ),
      body: body,
    );
  }
}