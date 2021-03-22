import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Age()
    );
  }
}

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  int d = 0, m = 0, y = 0, mn, dy, hr, min;
  String day1 = "", month1 = "", year1 = "", day3 = "", month3 = "", years = "", months = "", weeks="", days = "", hours="", minutes="";

  a(){
    setState(() {
      d=17;
      m=07;
      y=2001;
      int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
      int day = find(m1-1, y1);

      if (d1 - d >= 0){
        day1 = (d1 - d).toString() + " days";
      } else{
        day1 = (d1 + day - d).toString() + " days";
        m1 = m1 - 1;
      }
      if (m1 - m >= 0){
        month1 = (m1 - m).toString() + " months  |";
        mn = m1 - m;
      } else{
        month1 = (m1 + 12 - m).toString() + " months  |";
        y1 = y1 - 1;
        mn = m1 + 12 - m;
      }
      year1 = (y1 - y).toString() + " years";

      var diff = DateTime.now().difference(DateTime(2001,07,17));
      dy = diff.inDays;
      hr = diff.inHours;
      min = diff.inMinutes;
      years = (y1 - y).toString();
      months = (((y1 - y) * 12) + mn).toString();
      days = dy.toString();
      weeks = ((dy / 7).floor()).toStringAsFixed(0);
      hours = hr.toString();
      minutes = min.toString();
    });
    setState(() {
      d=17;
      m=07;
      y=2001;
      int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
      int day = find(m-1, y1);
      if (d1 - d > 0) {
        day3 = (day - d1 + d).toString() + " days";
        m1 = m1 + 1;
      } else if (d1 - d == 0){
        day3 = (d - d1).toString() + " days";
      } else{
        day3 = (d - d1).toString() + " days";
      }
      if (m1 - m > 0){
        month3 = (12-m1+m).toString() + " months  |";
      } else if(m1-m == 0  && d1-d == 0){
        month3 = "12 months  |";
      } else {
        month3 = (m-m1).toString() + " months  |";
      }
    });
  }

  int find(int m1, int y1) {
    int day;
    if (m1 == 0 || m1 == 1 || m1 == 3 || m1 == 5 || m1 == 7 || m1 == 8 || m1 == 10 || m1 == 12)
      day = 31;
    else if (m1 == 4 || m1 == 6 || m1 == 9 || m1 == 11)
      day = 30;
    else {
      if (y1 % 4 == 0)
        day = 29;
      else
        day = 28;
    }
    return day;
  }

  bool darkTheme = true;
  var _icon = Icons.lightbulb_outline_sharp;
  var _color = Colors.black;
  var _bcolor = Color(0xff2b2c2e);
  var _tcolor = Colors.white;
  var _brightness = Brightness.dark;
  ScrollController controller;

  @override
  void initState() {
    a();
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: _color,
          appBar: AppBar(
            title: Text('Age',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            leading: Container(
              child: IconButton(
                icon: Icon(_icon, size: 30),
                onPressed: (){
                  setState(() {
                    if(_icon == Icons.lightbulb){
                      _icon = Icons.lightbulb_outline_sharp;
                      darkTheme = true;
                      _color = Colors.black;
                      _bcolor = Color(0xff2b2c2e);
                      _tcolor = Colors.white;
                      _brightness = Brightness.dark;
                    } else if(_icon == Icons.lightbulb_outline_sharp){
                      _icon = Icons.lightbulb;
                      darkTheme = false;
                      _color = Colors.white;
                      _bcolor = Colors.white;
                      _tcolor = Colors.black;
                      _brightness = Brightness.light;
                    }
                  });
                },
              ),
            ),
          ),
          body: Builder(builder: (context) {
            return Container(
              child: Center(
                child: Scrollbar(
                  thickness: 1,
                  controller: controller,
                  child: ListView(
                    controller: controller,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _bcolor,
                          border: Border.all(
                            color: Colors.grey.shade700,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Column(
                          children: [
                            Text('Date of birth',
                                style: TextStyle(fontSize: 25, color: _tcolor)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey.shade700))),
                              ),
                            ),
                            CupertinoTheme(
                              data: CupertinoThemeData(brightness: _brightness),
                              child: Container(
                                  height: MediaQuery.of(context).copyWith().size.height / 10,
                                  width: MediaQuery.of(context).copyWith().size.width,
                                  child: CupertinoDatePicker(
                                    initialDateTime: DateTime(2001,07,17),
                                    minimumYear: 1900,
                                    maximumYear: 2100,
                                    maximumDate: DateTime.now(),
                                    mode: CupertinoDatePickerMode.date,
                                    backgroundColor: _bcolor,
                                    onDateTimeChanged: (date1) {
                                      setState(() {
                                        d = int.parse(DateFormat("dd").format(date1));
                                        m = int.parse(DateFormat("MM").format(date1));
                                        y = int.parse(DateFormat("yyyy").format(date1));
                                        int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
                                        int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
                                        int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
                                        int day = find(m1-1, y1);

                                        if (d1 - d >= 0){
                                          day1 = (d1 - d).toString() + " days";
                                        } else{
                                          day1 = (d1 + day - d).toString() + " days";
                                          m1 = m1 - 1;
                                        }
                                        if (m1 - m >= 0){
                                          month1 = (m1 - m).toString() + " months  |";
                                          mn = m1 - m;
                                        } else{
                                          month1 = (m1 + 12 - m).toString() + " months  |";
                                          y1 = y1 - 1;
                                          mn = m1 + 12 - m;
                                        }
                                        year1 = (y1 - y).toString() + " years";

                                        var diff = DateTime.now().difference(date1);
                                        dy = diff.inDays;
                                        hr = diff.inHours;
                                        min = diff.inMinutes;
                                        years = (y1 - y).toString();
                                        months = (((y1 - y) * 12) + mn).toString();
                                        days = dy.toString();
                                        weeks = ((dy / 7).floor()).toStringAsFixed(0);
                                        hours = hr.toString();
                                        minutes = min.toString();
                                      });
                                      setState(() {
                                        d = int.parse(DateFormat("dd").format(date1));
                                        m = int.parse(DateFormat("MM").format(date1));
                                        y = int.parse(DateFormat("yyyy").format(date1));
                                        int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
                                        int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
                                        int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
                                        int day = find(m1, y1);

                                        if (d1 - d > 0) {
                                          day3 = (day - d1 + d).toString() + " days";
                                          m1 = m1 + 1;
                                        } else if (d1 - d == 0) {
                                          day3 = (d - d1).toString() + " days";
                                        } else {
                                          day3 = (d - d1).toString() + " days";
                                        }

                                        if (m1 - m > 0){
                                          month3 = (12-m1+m).toString() + " months  |";
                                        } else if(m1-m == 0 && d1-d == 0){
                                          month3 = "12 months  |";
                                        } else{
                                          month3 = (m-m1).toString() + " months  |";
                                        }
                                      });
                                    },
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _bcolor,
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            children: [
                              Text('Age',
                                  style: TextStyle(fontSize: 25, color: _tcolor)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey.shade700))),
                                ),
                              ),
                              Text(year1,
                                  style:TextStyle(fontSize: 60, color: Colors.deepOrange)),
                              Text(month1 + "  " + day1,
                                  style: TextStyle(fontSize: 20,color: _tcolor)),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _bcolor,
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            children: [
                              Text('Next birthday',
                                  style: TextStyle(fontSize: 25, color: _tcolor)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey.shade700))),
                                ),
                              ),
                              Icon(Icons.cake_rounded, color: Colors.deepOrange, size: 80),
                              Text(month3 + "  " + day3,
                                  style: TextStyle(fontSize: 20,color: _tcolor)),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _bcolor,
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            children: [
                              Text('Summary',
                                  style: TextStyle(fontSize: 25, color: Colors.deepOrange)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey.shade700))),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Years",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(years,
                                              style: TextStyle(fontSize: 20, color: _tcolor)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Text("Weeks",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(weeks,
                                              style: TextStyle(fontSize: 20, color: _tcolor)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Text("Hours",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(hours,
                                              style: TextStyle(fontSize: 20, color: _tcolor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Months",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(months,
                                              style: TextStyle(fontSize: 20, color: _tcolor)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Text("Days",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(days,
                                              style: TextStyle(fontSize: 20, color: _tcolor)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Text("Minutes",
                                              style: TextStyle(fontSize: 15,color: _tcolor)),
                                          Text(minutes,
                                              style: TextStyle(fontSize: 20, color: _tcolor))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
      ),
    );
  }
}