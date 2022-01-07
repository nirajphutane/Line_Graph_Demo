import 'package:flutter/material.dart';
import 'animated_line_chart.dart';
import 'package:fl_animated_linechart/chart/line_chart.dart';
import 'data.dart';

class LineGraph extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LineGraph> {

  LineChart chart;
  int noOfDataSets = 10;
  bool canPlay = true;

  @override
  void initState() {
    super.initState();
    play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No. of data sets are $noOfDataSets', style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(canPlay? Icons.pause: Icons.play_arrow),
        onPressed: (){
          setState(() {
            canPlay = !canPlay;
          });
          play();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: chart != null? Container(
                margin: const EdgeInsets.only(top: 10),
                child: AnimatedLineChart(
                  chart,
                  key: UniqueKey(),
                ),
              ): Center(
                child: CircularProgressIndicator(),
              )
            ),

            Row(
              children:[
                Text('No Of Data Sets: '),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Slider(
                      value: noOfDataSets.roundToDouble(), min: 10, max: 100, divisions: 50,
                      onChanged: canPlay? (noOfDataSets){
                        setState(() {
                          this.noOfDataSets = noOfDataSets.toInt();
                        });
                      }: null
                    ),
                  ),
                ),
              ]
            ),
          ],
        ),
      )
    );
  }

  Future<void> play() async {
    while(canPlay){
      await Future.delayed(Duration(milliseconds: 200));
      setState(() {
        chart = LineChart.fromDateTimeMaps(
          [Data.create(noOfDataSets), Data.create(noOfDataSets), Data.create(noOfDataSets), Data.create(noOfDataSets)],
          [Colors.red, Colors.green, Colors.blue, Colors.yellow],
          ['Red', 'Green', 'Blue', 'Yellow']
        );
      });
    }
  }
}
