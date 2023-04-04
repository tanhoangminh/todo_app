import 'package:flutter/material.dart';

class AppFocusScope extends StatelessWidget {
  const AppFocusScope({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: child,
        ),
      ),
    );
  }
}
