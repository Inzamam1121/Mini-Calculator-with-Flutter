import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MaterialApp(
    title: "Mini Calculator",
    home: Calculator(),
    theme: ThemeData(
     primarySwatch: Colors.green
    ),
  ));
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  var result="";
  int temp=0;
  void calculate()
  {
    setState(() {
      if(_controller2.text=='+')
      {
        temp=int.parse(_controller1.text)+int.parse(_controller3.text);
        result=temp.toString();
      }

      else if(_controller2.text=='-')
      {
        temp=int.parse(_controller1.text)-int.parse(_controller3.text);
        result=temp.toString();
      }

      else if(_controller2.text=='*')
      {
        temp=int.parse(_controller1.text)*int.parse(_controller3.text);
        result=temp.toString();
      }

      else if(_controller2.text=='/')
      {
        double temp1;
        temp1=(int.parse(_controller1.text)/ int.parse(_controller3.text)) as double;
        result=temp1.toString();
      }

      else
      {
        result= "You Have Entered the Wrong Operand.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(  "Mini Calculator",
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children:  [
                Text("Perform Operations on Two Numbers",
                  style: TextStyle(fontSize: 20 ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter First Nummber",
                          labelText: "Number",
                          border: OutlineInputBorder(),
                        )
                    )
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: TextField(
                        controller: _controller2,
                        decoration: InputDecoration(
                          hintText: "Enter the Operand",
                          labelText: "Operand",
                          border: OutlineInputBorder(),
                        )
                    )
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: TextField(
                        controller: _controller3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Second Nummber",
                          labelText: "Number",
                          border: OutlineInputBorder(),
                        )
                    )
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: Text(
                      result,

                      style: TextStyle(fontSize: 20 )
                    )
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: calculate,
                      child:Text(
                        "Press to See Result"
                      ),
                    )
                )

              ],
            ),
          )
        )
      )


    );
  }
}
