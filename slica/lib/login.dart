import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slica/home_screen.dart';
import 'utilities/constants.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'utilities/dialog.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool _rememberMe = false;  <== This Field For later use

  bool _emailValidate = false; // email field Check empty or not
  bool _passwordValidate = false; // password field check empty or not
  bool _passwordVisible = false; // Show masked password when login

  SharedPreferences logindata; //SharedPreferences Object in which all details of login can stored
  bool newuser; // Checks where user is new or not

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    login_or_not();
  }

// --------- Function For checking user is already logged in or not ------------

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

// ------------------ This Function For Email TextField Design ----------------

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
//-------------------------------------------------------------------------


// -------------- This Function For Password TextField Design --------------

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
//------------------------------------------------------------------------------


// ------------- This Function For Forgot Password Field Design ----------------

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0)  ,
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }
//------------------------------------------------------------------------------


// --------------- This Function For Show Password Field Design ----------------

  Widget _buildShowPassCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _passwordVisible,
              checkColor: Colors.blueAccent,
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
//------------------------------------------------------------------------------

// ---------------- This Function For Remember ME Field Design -----------------

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
//------------------------------------------------------------------------------


// ------------------- This Function For Login Button Design -------------------

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            // Here We checking Whether User entered Empty String Or not

            emailController.text.isEmpty ? _emailValidate = true : _emailValidate = false;
            passController.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;
            if(_emailValidate == true  || _passwordValidate == true)
              {
                showSingleBtnAlertDialog(context,'Empy Field',"Roll no or password not be empty.");
              }
          });
           //--------- Here That Cheking ends------------------

          //  Authentication Of User And Shared Preferences

          String uname,pass;
          try {
            User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text + "@gmail.com",
                password: "SLICA123"))
                .user;

            if (uname != '' && pass != '') {
               uname = emailController.text + "@gmail.com";
               pass = "SLICA123";
              print('successful');
              logindata.setBool('login', false);

              logindata.setString('uname', uname);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }

            // Checking user entered fields are null or not

            if (user != null) {
              emailController.text = "";
              passController.text = "";
              Navigator.of(context).popAndPushNamed('/b');
            }
          } catch (e) {
            print(e);
            emailController.text = "";
            passController.text = "";
            showSingleBtnAlertDialog(context,'Invalid Roll No or Password',"Roll no or password not match");
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
//------------------------------------------------------------------------------

// ------ This Is Build method From Where All Other Functions Called -----------

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
                  controller: scrollController,
                  // physics: NeverScrollableScrollPhysics(),
                  physics: RangeMaintainingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/SLICA.jpeg")),//logo of SLICA
                    SizedBox(height: 30.0),
                    _buildEmailTF(), // Calling Email Function
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(), // Calling Password Function
                    _buildForgotPasswordBtn(), // Calling Forgot Password Function
                    _buildShowPassCheckbox(), // Calling Show Password Function
                    // _buildRememberMeCheckbox(),
                    _buildLoginBtn(), // Calling Login Button Function
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
//-------------------------------------------------------------------------------