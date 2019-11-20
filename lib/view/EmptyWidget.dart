import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.sentiment_dissatisfied,
          size: 122,
          color: Colors.grey.withOpacity(.5)
        ),

        Text('Ainda Não há tarefas...', maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Colors.grey.withOpacity(.5)
          ),
        )
      ],
    );
  }
}
