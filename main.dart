import 'package:flutter/material.dart';
import 'calendar.dart';

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
  //BuildYearList dropDown = new BuildYearList();
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
              new Container(
                  //margin: const EdgeInsets.all(15.0),
                  width: 213,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  
                  decoration: textBorderDecor(),
                  child: Text("Select Year",                    
                    style: TextStyle(color: Colors.pink,
                           fontSize: 24,
                           fontWeight: FontWeight.bold, // light    
                          
                    ),),
                ),
              new MyListPage(title: 'Drop Down Box Demo'),
              new Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(3, 5),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: RaisedButton(                                          
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      onPressed: (){
                          //getSetValue d1 = new getSetValue();
                          //print(d1.getYear());
                         var gr =  BuildYearList.getDropValue();
                        Navigator.of(context).push(_createRoute(gr));
                      },
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
                                      color: Colors.white),                                      
                                      ),                                
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

class MyListPage extends StatefulWidget {
MyListPage({Key key, this.title}) : super(key: key);
final String title;

@override
BuildYearList createState() => BuildYearList();
}

class BuildYearList extends State<MyListPage> {
  String _chosenValue = '1977'; 
  static String selectedYear = '1977'; 
  //BuildYearList({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext ctxt) {   
  var _years = [],
      _currYear = new DateTime.now().year + 1;

      for (var i = 1977; i<_currYear; i++)
      {
        _years.add(i.toString());
      } 
    return new Container(
//        child: Center(     
          width: 213,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: new BoxDecoration(color: Colors.lightBlueAccent,
          //borderRadius: new BorderRadius.only(bottomRight: Radius.circular(20),
          //                                   bottomLeft: Radius.circular(20))
          ),
          //color: Colors.lightBlue,
          child: DropdownButton<String>(
            value: _chosenValue,
            isExpanded: true,
            dropdownColor: Colors.lightBlue,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 26,              
            ),
            items: _years.map((year) {
                //.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: year,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_right, color: Colors.black),
                    SizedBox(width: 50 ),
                    Text(
                      year,
                    ),
                  ],
                ),
                //child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
               setState(() {
                _chosenValue = value;
                selectedYear = value;
              });
            },
          ),
//        ),
      );
  }
  static String getDropValue()
  {
    return selectedYear;
  }
}

BoxDecoration textBorderDecor()
{
return BoxDecoration(
color: Color.fromRGBO(209, 239, 255, 1),
border: Border(
      left: BorderSide( //                   <--- left side
        color: Colors.lightBlue,
        width: 1.0,
      ),
      top: BorderSide( //                    <--- top side
        color: Colors.lightBlue,
        width: 10.0,
      ),
      right: BorderSide( //                   <--- left side
        color: Colors.lightBlue,
        width: 1.0,
      ),      
    ),
  );
}

Route _createRoute(String year) {
  print(year);
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CalendarPage(selYear: year),
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  var begin = Offset(1, 0);
  var end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
},
  );
}
