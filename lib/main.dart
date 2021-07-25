import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_calculator/CalculatorButton.dart';
void main() {
  runApp(MyApp());
}
class  MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstNum;
  late int secondNum;
  late String history ='';
  late String textToDisplay ='';
  late String res;
  late String operation;

  void btnOnClick(String btnVal){
    print(btnVal);
    if(btnVal=='C'){
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res='';
      
    }else if(btnVal=='AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    // }else if(btnVal=='+/-'){
    //   if(textToDisplay[0] -') {
    //     res='-'+textToDisplay;
    //   }
    }else if (btnVal=='<'){
      res = textToDisplay.substring(0,textToDisplay.length-1);
    }
    else if(btnVal =='+'|| btnVal =='-'|| btnVal=='X'|| btnVal=='/'){
      firstNum = int.parse(textToDisplay);
      res='';
      operation = btnVal;

      
    }else if (btnVal =='='){
      secondNum=int.parse(textToDisplay);

      if(operation=='+'){
        res=(firstNum + secondNum).toString();
        history = firstNum.toString()+operation.toString()+secondNum.toString();
      }
      if(operation =='-'){
        res=(firstNum - secondNum).toString();
        history = firstNum.toString()+operation.toString()+secondNum.toString();
      }
      if(operation =='X'){
        res=(firstNum * secondNum).toString();
        history = firstNum.toString()+operation.toString()+secondNum.toString();
      }
      if(operation =='/'){
        res=(firstNum / secondNum).toString();
        history = firstNum.toString()+operation.toString()+secondNum.toString();
      }
    }else{
      res=int.parse(textToDisplay+btnVal).toString();
    }
    setState(() {
      textToDisplay=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    // var btnOnClick;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator',style: GoogleFonts.notable(textStyle:TextStyle(fontSize: 30),)),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        backgroundColor: Colors.pink[95],
        body: Container(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(padding: EdgeInsets.all(8),
                  child:Text(history,style: GoogleFonts.timmana(textStyle:TextStyle(fontSize: 25,
                      color:Colors.black26 ),),),
                ),
                alignment: Alignment(1.0,1.0),

              ),

              Container(
                child: Padding(padding: EdgeInsets.all(8),
                  child:Text(textToDisplay,style: GoogleFonts.timmana(textStyle:TextStyle(fontSize: 50,
                      color:Colors.deepOrange ),),),
                ),
                alignment: Alignment(1.0,1.0),

              ),

            Row(
          children: [
            CalculatorButton(text: 'AC',callback: btnOnClick,),
            CalculatorButton(text: 'C',callback: btnOnClick,),
            CalculatorButton(text: '<',callback: btnOnClick,),
            CalculatorButton(text: '/',callback: btnOnClick,),

        ],
        ),
              Row(
                children: [
                  CalculatorButton(text: '9', callback: btnOnClick,),
                  CalculatorButton(text: '8',callback: btnOnClick,),
                  CalculatorButton(text: '7',callback: btnOnClick,),
                  CalculatorButton(text: 'X',callback: btnOnClick,),

                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: '6',callback: btnOnClick,),
                  CalculatorButton(text: '5',callback: btnOnClick,),
                  CalculatorButton(text: '4',callback: btnOnClick,),
                  CalculatorButton(text: '-',callback: btnOnClick,),

                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: '3',callback: btnOnClick,),
                  CalculatorButton(text: '2',callback: btnOnClick,),
                  CalculatorButton(text: '1',callback: btnOnClick,),
                  CalculatorButton(text: '+',callback: btnOnClick,),

                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: 'C',callback: btnOnClick,),
                  CalculatorButton(text: '0',callback: btnOnClick,),
                  CalculatorButton(text: '00',callback: btnOnClick,),
                  CalculatorButton(text: '=',callback: btnOnClick,),

                ],
              ),
            ],

            ),
            ),
          ),
        );

  }
}

