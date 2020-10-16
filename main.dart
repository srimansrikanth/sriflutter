import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/Cal.png'),
              Container(
                  width: 210,
                  height: 50,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      onPressed: (){ print('Button Clicked.'); },
                      textColor: Colors.white,
                      color: Colors.pink,
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0,0,0,0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  color:Colors.white,
                                  size: 30,
                                ),
                              ),
                              Container(
                                color: Colors.pink,
                                padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                                child: Text('Open Calendar',
                                  style: TextStyle(fontSize: 20.0,
                                      color: Colors.white),),
                              ),
                            ],
                          ))))              ],
          )
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
    );
  }
}
