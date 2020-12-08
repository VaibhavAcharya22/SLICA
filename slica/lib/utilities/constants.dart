import 'package:flutter/material.dart';

// text field Controllers of login
final emailController = TextEditingController();
final passController = TextEditingController();
final ScrollController scrollController = ScrollController();

final kAppBarTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontFamily: 'OpenSans',
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  // fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  // fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
color: Color(0xFF6CA8F1),
borderRadius: BorderRadius.circular(10.0),
boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 6.0,
offset: Offset(0, 2),
),
],);