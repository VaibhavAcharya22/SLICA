import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slica/login.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences logindata;
  String uname;

  @override
  void initState(){
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      uname = logindata.getString('uname');
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showAlertDialog(context);
        // Navigator.of(context).canPop();
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Text("Welcome IN TYBCA."),
            ),
            _buildLoginBtn(),
          ],
        ),
      ),
    );
  }
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          logindata.setBool('login', true);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          try{
            // Navigator.of(context).pop();
            // Navigator.of(context).pushNamedAndRemoveUntil('/a', (Route<dynamic> route) => false);
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            // Navigator.of(context).popUntil(ModalRoute.withName('/a'));
          }catch(e){
            print(e);
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGOUT',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        SystemNavigator.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Want to quit"),
      content: Text("Are you sure you want to quit?"),
      actions: [
        cancelButton,
        continueButton,
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


}
