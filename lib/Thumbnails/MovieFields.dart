import 'package:flutter/material.dart';

class MovieFields extends StatelessWidget {
  final String field;
  final String value;

  const MovieFields({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("movie field - $field, $value");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field : ",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}
