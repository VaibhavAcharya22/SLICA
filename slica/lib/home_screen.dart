import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slica/login.dart';
import 'package:slica/utilities/bouncy_animation.dart';
import 'utilities/dialog.dart';
import 'utilities/constants.dart';
import 'faculties.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences logindata;
  String uname;
  List<String> _rollNo ;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      uname = logindata.getString('uname');
      print(_rollNo = uname.split("@"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDoubleBtnAlertDialog(context, "Want to quit", "Are you sure you want to quit?", "Cancel", "Yes");
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              " SLICA ",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Welcome IN TYBCA."),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/SLICA.jpeg"),
                        radius: 50,
                      ),

                      Text("Roll No : ${_rollNo[0]}"),
                      SizedBox(height: 5,),
                      Text("Name : Vaibhav Acharya"),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                ListTile(
                  leading: Icon(Icons.person,color: Colors.blueAccent,),
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.group,color: Colors.blueAccent,),
                  title: Text('Faculties'),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Faculties()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note,color: Colors.blueAccent,),
                  title: Text('Notes'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.supervised_user_circle,color: Colors.blueAccent,),
                  title: Text('About Us'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout,color: Colors.blueAccent,),
                  title: Text('Logout'),
                  onTap: () async {

                    showDoubleBtnAlertDialogWithoutOnPressed(context,"Are you sure ?" , "Want to logout from SLICA","Cancel","Logout");

                      //boolean variable login is change to true
                      logindata.setBool('login', true);

                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.remove('uname');
                      prefs.remove("login");

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
