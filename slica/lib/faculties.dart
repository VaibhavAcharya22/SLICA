import 'package:flutter/material.dart';
import 'home_screen.dart';

class Faculties extends StatefulWidget {
  @override
  _Faculties createState() => _Faculties();
}

class _Faculties extends State<Faculties> {
  Widget _appBarTitle = new Text('Faculties');
  Icon _searchIcon = new Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer1(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/images/bca_ramesh-kataria.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer2(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/images/bca_kamesh_raval.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer3(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/images/bca_Amit-Bardhan.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer4(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/images/bca_Rachana-Parikh.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer5(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/images/bca_ramesh-kataria.jpg'),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Prof. Ramesh C. Kataria",
            style: TextStyle(color: Colors.lightBlue, fontSize: 28.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("M.Sc.,  Ph.D ( Pursuing )",
                    style: TextStyle(color: Colors.black54, fontSize: 22.0,),)),
                ],)),
        ),
        Container(child: Text("Designation – Asst. Prof.",
          style: TextStyle(color: Colors.black54, fontSize: 22.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Prof. Kameshkumar R. Raval",
            style: TextStyle(color: Colors.lightBlue, fontSize: 28.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("ADCA, M.C.A, Ph.D ( Pursuing )",
                    style: TextStyle(color: Colors.black54, fontSize: 22.0,),)),
                ],)),
        ),
        Container(child: Text("Designation – Asst. Prof.",
          style: TextStyle(color: Colors.black54, fontSize: 22.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Prof. Amit Bardhan",
            style: TextStyle(color: Colors.lightBlue, fontSize: 28.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("B.E. ( Information Technology )",
                    style: TextStyle(color: Colors.black54, fontSize: 22.0,),)),
                ],)),
        ),
        Container(child: Text("Designation – Asst. Prof.",
          style: TextStyle(color: Colors.black54, fontSize: 22.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Prof. Rachana Gendiwal",
            style: TextStyle(color: Colors.lightBlue, fontSize: 28.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("M.C.A , B.C.A",
                    style: TextStyle(color: Colors.black54, fontSize: 22.0,),)),
                ],)),
        ),
        Container(child: Text("Designation – Asst. Prof.",
          style: TextStyle(color: Colors.black54, fontSize: 22.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget myDetailsContainer5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Prof. Khyati Shah",
            style: TextStyle(color: Colors.lightBlue, fontSize: 28.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("M.Sc.,  Ph.D (Pursuing )",
                    style: TextStyle(color: Colors.black54, fontSize: 22.0,),)),
                ],)),
        ),
        Container(child: Text("Designation – Asst. Prof.",
          style: TextStyle(color: Colors.black54, fontSize: 22.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },

      ),
    );
  }
}
