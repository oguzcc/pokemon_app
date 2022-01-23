import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
