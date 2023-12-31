import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Kalkulyator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = '0';
  String result = '0';
  String expression = '';

  /*buttonPresed(btnText) {
    if (btnText == 'AC') {
      equation = '0';
      result = '0';
    } else if (btnText == '⋘') {
      equation = equation.substring(0, equation.length - 1);

      if (equation == '') {
        equation = '0';
      }
    } else if (btnText == '=') {
      expression = equation;
      expression = expression.replaceAll('x', '*');
      expression = expression.replaceAll('÷', '/');
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        'Error';
      }
    } else {
      if (equation == '0') {
        equation = btnText;
      } else {
        equation = equation + btnText;
      }
    }
  }*/

  buttonPresed(btnText) {
    if (btnText == 'AC') {
      equation = '0';
      result = '0';
    } else if (btnText == '⌫') {
      if (equation != '0' && equation.length > 1) {
        equation = equation.substring(0, equation.length - 1);
      } else {
        equation = '0';
      }
    } else if (btnText == '=') {
      expression = equation;
      expression = expression.replaceAll('x', '*');
      expression = expression.replaceAll('÷', '/');
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = 'Error';
      }
    } else {
      if (equation == '0') {
        equation = btnText;
      } else {
        equation = equation + btnText;
      }
    }
    setState(() {}); // Add this line
  }

  // This code above was compiled by ChatGPT

  Widget calbuttons(
      String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () {
        buttonPresed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
              color: txtColor, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 120),
          ),
        ),
        backgroundColor: Colors.amber,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          // orijinal qadamlar o'chirilgan va padding qo'shilgan
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                height: 90,
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  equation,
                  style:
                      TextStyle(fontSize: 36, color: Colors.deepOrangeAccent),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                result,
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbuttons(
                        'AC', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    calbuttons('⌫', Colors.white, 80, Colors.white38),
                    calbuttons('%', Colors.white, 80, Colors.white38),
                    calbuttons(
                        '÷', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbuttons('7', Colors.white, 80, Colors.white10),
                    calbuttons('8', Colors.white, 80, Colors.white10),
                    calbuttons('9', Colors.white, 80, Colors.white10),
                    calbuttons(
                        'x', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbuttons('4', Colors.white, 80, Colors.white10),
                    calbuttons('5', Colors.white, 80, Colors.white10),
                    calbuttons('6', Colors.white, 80, Colors.white10),
                    calbuttons(
                        '-', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbuttons('1', Colors.white, 80, Colors.white10),
                    calbuttons('2', Colors.white, 80, Colors.white10),
                    calbuttons('3', Colors.white, 80, Colors.white10),
                    calbuttons(
                        '+', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calbuttons('0', Colors.white, 170, Colors.white10),
                    calbuttons('.', Colors.white, 80, Colors.white10),
                    calbuttons(
                        '=', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
