import 'package:age/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String day, month, year, dayNext, monthNext, minutes, hours, days, weeks, months, years;

  ageCalc(dob){

    AgeDuration age = Age.dateDifference(
        fromDate: dob, toDate: DateTime.now(), includeToDate: false
    );

    DateTime date = DateTime(DateTime.now().year, dob.month, dob.day);
    DateTime nextBirthdayDate = date.isBefore(DateTime.now())
        ? Age.add(date: date, duration: AgeDuration(years: 1))
        : date;
    AgeDuration nextBirthday = Age.dateDifference(fromDate: DateTime.now(), toDate: nextBirthdayDate);

    var diff = DateTime.now().difference(dob);

    day = age.days.toString();
    month = age.months.toString();
    year = age.years.toString();

    dayNext = nextBirthday.days.toString();
    if(nextBirthday.days == 0 && nextBirthday.months == 0){
      monthNext = '12';
    } else {
      monthNext = nextBirthday.months.toString();
    }

    minutes = diff.inMinutes.toString();
    hours = diff.inHours.toString();
    days = diff.inDays.toString();
    weeks = ((diff.inDays / 7).floor()).toStringAsFixed(0);
    months = ((age.years * 12) + age.months).toString();
    years = age.years.toString();

  }

  @override
  void initState() {
    ageCalc(DateTime(2001,7,17));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24, color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Date of birth',
                      style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: Divider(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  CupertinoTheme(
                    data: CupertinoThemeData(brightness: Brightness.light),
                    child: Container(
                        height: MediaQuery.of(context).copyWith().size.height / 10,
                        width: MediaQuery.of(context).copyWith().size.width,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime(2001,7,17),
                          minimumYear: 1900,
                          maximumYear: 2100,
                          minimumDate: DateTime(1900,1,1),
                          maximumDate: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (dob) {
                            setState(() {
                              ageCalc(dob);
                            });
                          },
                        )
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(15),
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Age',
                      style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: Divider(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(year,
                    style:TextStyle(fontSize: 60, color: Colors.deepOrange),
                  ),
                  SizedBox(height: 10),
                  Text(month + " months  |  " + day + " days",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(15),
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Next birthday',
                      style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: Divider(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Icon(
                    Icons.cake_rounded,
                    color: Colors.deepOrange,
                    size: 80,
                  ),
                  SizedBox(height: 10),
                  Text(monthNext + " months  |  " + dayNext + " days",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 35),
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Summary',
                      style: TextStyle(fontSize: 22, color: Colors.deepOrange, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: Divider(
                      color: Colors.grey.shade700,
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
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(years,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text("Weeks",
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(weeks,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text("Hours",
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(hours,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Text("Months",
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(months,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text("Days",
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(days,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text("Minutes",
                                  style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w300)
                              ),
                              Text(minutes,
                                  style: TextStyle(fontSize: 20, color: Colors.black)
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}