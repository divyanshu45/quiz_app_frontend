import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int correct;
  final int total;
  const ResultScreen({super.key, required this.correct, required this.total});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Result'
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              FlutterLogo(size: 80,),
              SizedBox(height: 20,),
              Text(
                'Your score'
              ),
              SizedBox(height: 10,),
              Text(
                '${widget.correct} / ${widget.total}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Keep trying! With more study and practice,\nyou will improve your GK knowledge',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '60%'
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: widget.correct / widget.total,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Correct'
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                              '60%'
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: widget.correct / widget.total,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                          'Perecntage'
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                              '60%'
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: widget.correct / widget.total,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                          'Wrong'
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.blue
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: Text(
                      'RESTART',
                      style: TextStyle(
                        color: Colors.blue
                      ),
                    )
                  ),
                  OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Colors.purple
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      child: Text(
                          'REVIEW',
                        style: TextStyle(
                            color: Colors.purple
                        ),
                      )
                  ),
                  OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Colors.orange
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      child: Text(
                          'SHARE',
                        style: TextStyle(
                            color: Colors.orange
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
