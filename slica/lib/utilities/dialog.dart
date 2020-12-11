import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slica/utilities/bouncy_animation.dart';
import 'package:slica/login.dart';
import 'package:slica/main.dart';
import 'package:animated_dialog/animated_dialog.dart';

// When You Want To use " SINGLE " button Alert Box Use This

showSingleBtnAlertDialog(BuildContext context , String title , String content) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
//------------------------------------------------------------------------------

// When You Want To use " DOUBLE " button Alert Box Use This
showDoubleBtnAlertDialog(BuildContext context, String title , String content,String fbtn,String sbtn) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(fbtn),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text(sbtn),
    onPressed:  () {
      SystemNavigator.pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
//    builder: (BuildContext context) {
//      return alert;
//    },
    context: context,
      child: AnimatedDialog(
        width: MediaQuery.of(context).size.width * 0.8, //final width of the dialog
        height:MediaQuery.of(context).size.height * 0.3,  //final height of the dialog
        animationTime: Duration(seconds: 1),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
        child: alert,
      ),

  );
}


// When You Want To use " DOUBLE " button Alert Box Use This
showDoubleBtnAlertDialogWithoutOnPressed(BuildContext context, String title , String content,String fbtn,String sbtn) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(fbtn),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text(sbtn),
    onPressed:  () {
        Navigator.of(context).pushReplacementNamed("/a");
//      Navigator.popUntil(context, ModalRoute.withName('/a'));
//      Navigator.of(context).popUntil((route) => route.settings.name == "/a");
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder: (context) => LoginScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
//    builder: (BuildContext context) {
//      return alert;
//    },
    context: context,
    child: AnimatedDialog(
      width: MediaQuery.of(context).size.width * 0.8, //final width of the dialog
      height:MediaQuery.of(context).size.height * 0.3,  //final height of the dialog
      animationTime: Duration(seconds: 1),
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30.0),
      child: alert,
    ),

  );
}

