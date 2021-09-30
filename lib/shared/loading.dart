
import 'package:flutter/material.dart';
import 'package:hms/shared/loaders/loader1.dart';
import 'package:hms/shared/loaders/loader2.dart';


class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(

          child: LoaderTwo(),

        ),
      ),
    );
  }
}

