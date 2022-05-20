import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widget/scaffold_widget.dart';

class MyHomePage extends StatelessWidget{

  const MyHomePage({Key?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Nhấn để thực hiện phép tính',
          ),
        ],
      ),
    );
  }
}


