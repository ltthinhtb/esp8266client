import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  DatabaseReference _dhtRef =
      FirebaseDatabase.instance.reference().child('ESP8266-Temp');

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhóm 19'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: isLoading
              ? StreamBuilder(
                  stream: _dhtRef.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            child: LineChart(
                              LineChartData(
                                lineTouchData: LineTouchData(enabled: false),
                                minX: 0,
                                minY: 0,
                                maxY: 40,
                                lineBarsData: [
                                  LineChartBarData(barWidth: 1, spots: [
                                    FlSpot(
                                        1,
                                        snapshot.data.snapshot
                                            .value["objectList"]["Data1"]),
                                    FlSpot(
                                        2,
                                        snapshot.data.snapshot
                                            .value["objectList"]["Data2"]),
                                    FlSpot(
                                        3,
                                        snapshot.data.snapshot
                                            .value["objectList"]["Data3"]),
                                    FlSpot(
                                        4,
                                        snapshot.data.snapshot
                                            .value["objectList"]["Data4"]),
                                    FlSpot(
                                        5,
                                        snapshot.data.snapshot
                                            .value["objectList"]["Data5"]),
                                  ]),
                                  LineChartBarData(
                                      barWidth: 1,
                                      dotData: FlDotData(
                                        show: false,
                                      ),
                                      colors: [
                                        Colors.green,
                                      ],
                                      spots: [
                                        FlSpot(
                                            1,
                                            snapshot.data.snapshot
                                                .value["ambientList"]["Data1"]),
                                        FlSpot(
                                            2,
                                            snapshot.data.snapshot
                                                .value["ambientList"]["Data2"]),
                                        FlSpot(
                                            3,
                                            snapshot.data.snapshot
                                                .value["ambientList"]["Data3"]),
                                        FlSpot(
                                            4,
                                            snapshot.data.snapshot
                                                .value["ambientList"]["Data4"]),
                                        FlSpot(
                                            5,
                                            snapshot.data.snapshot
                                                .value["ambientList"]["Data5"]),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Nhiệt độ vật: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Text(
                                snapshot.data.snapshot.value["object"]["data"],
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Nhiệt môi trường: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Text(
                                snapshot.data.snapshot.value["ambient"]["data"],
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      );
                    } else
                      return Center(
                        child: Text("No data"),
                      );
                  })
              : Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
    );
  }
}

class TimeTemp {
  final int time;
  final double temp;

  TimeTemp(this.time, this.temp);
}
