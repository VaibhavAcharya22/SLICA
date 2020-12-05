import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slica/home_screen.dart';
import 'constants.dart';
import "package:shared_preferences/shared_preferences.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;

final emailController = TextEditingController();
final passController = TextEditingController();
final ScrollController _scrollController = ScrollController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool _rememberMe = false;
  bool alreadyLogin = false;
  bool _passwordVisible = false;
  bool visible = true;
  SharedPreferences logindata;
  bool newuser;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    login_or_not();
  }

  void login_or_not() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Roll No',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            // textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your roll number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: passController,
            obscureText: !_passwordVisible,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildShowPassCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _passwordVisible,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          Text(
            'Show Password',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  // Widget _buildRememberMeCheckbox() {
  //   return Container(
  //     height: 20.0,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: _rememberMe,
  //             checkColor: Colors.green,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 _rememberMe = value;
  //               });
  //             },
  //           ),
  //         ),
  //         Text(
  //           'Remember me',
  //           style: kLabelStyle,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          String uname = emailController.text + "@gmail.com";
          String pass = "SLICA123";

          try {
            if (uname != '' && pass != '') {
              print('successful');
              logindata.setBool('login', false);

              logindata.setString('uname', uname);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }
            User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text + "@gmail.com",
                    password: "SLICA123"))
                .user;

            if (user != null) {
              emailController.text = "";
              passController.text = "";
              Navigator.of(context).popAndPushNamed('/b');
            }
          } catch (e) {
            print(e);
            emailController.text = "";
            passController.text = "";
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: ListView(
                  // reverse: true,
                  controller: _scrollController,
                  // physics: NeverScrollableScrollPhysics(),
                  physics: RangeMaintainingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/SLICA.jpeg")),
                    SizedBox(height: 30.0),
                    _buildEmailTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildShowPassCheckbox(),
                    // _buildRememberMeCheckbox(),
                    _buildLoginBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
