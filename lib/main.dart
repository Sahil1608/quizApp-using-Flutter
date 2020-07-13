import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() =>  runApp(MyApp());
class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State <MyApp>{
  final _questions = const [
      {'questionText':  'What\'s your Favorite color?',
      'answers':[
      {'text':'Red','score':10},
      {'text':'Blue','score':5},
      {'text':'Black','score':3},
      {'text':'Green','score':1}
      ],
      }
     ,      
     {'questionText':  'What is your Favorite animal?',
      'answers':[
      {'text':'Panda','score':3},
      {'text':'Lion','score':5},
      {'text':'Elephant','score':11},
      {'text':'Dog','score':9}],
      },
        {'questionText':  'What is your Favorite Instructor?',
      'answers':[ 
      {'text':'Max','score':1}, 
      {'text':'Sachin','score':1},
      {'text':'Sahil','score':1}, 
      {'text':'Kartik','score':1},
      ],
      },
    ];
  var _questionIndex = 0;
  var _totalScore= 0;
          
          void _resetQuiz() {
            setState(() {
               _questionIndex = 0;
               _totalScore= 0;
            });
            }

  void _answerQuestion(int score){
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
         print('we have more questions!');
    }
    else{
      print('No more questions!');
    }
  }
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        ),
      body: _questionIndex < _questions.length 
      ?Quiz(answerQuestion: _answerQuestion,
      questionIndex: _questionIndex,
      questions: _questions,)  
            : Result(_totalScore, _resetQuiz),
    ),
    );
  }
}