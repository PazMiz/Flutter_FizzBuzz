import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FizzBuzzScreen(),
    );
  }
}

class FizzBuzzScreen extends StatefulWidget {
  @override
  _FizzBuzzScreenState createState() => _FizzBuzzScreenState();
}

class _FizzBuzzScreenState extends State<FizzBuzzScreen> {
  int start = 1;
  int end = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FizzBuzz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the range of numbers:'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Start'),
                    onChanged: (value) {
                      setState(() {
                        start = int.tryParse(value) ?? 1;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'End'),
                    onChanged: (value) {
                      setState(() {
                        end = int.tryParse(value) ?? 100;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FizzBuzzResultScreen(start, end),
                  ),
                );
              },
              child: Text('Show FizzBuzz'),
            ),
          ],
        ),
      ),
    );
  }
}

class FizzBuzzResultScreen extends StatelessWidget {
  final int start;
  final int end;

  FizzBuzzResultScreen(this.start, this.end);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FizzBuzz Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: end - start + 1,
          itemBuilder: (context, index) {
            final i = start + index;
            return ElevatedButton(
              onPressed: () {
                // Handle button press
                // You can navigate to a detail screen or perform any action here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(getButtonColor(i)),
              ),
              child: Text(getColoredFizzBuzzValue(i)),
            );
          },
        ),
      ),
    );
  }
}

String getColoredFizzBuzzValue(int i) {
  String fizzBuzzMessage = getFizzBuzzValue(i);

  return fizzBuzzMessage;
}

Color getButtonColor(int i) {
  String fizzBuzzMessage = getFizzBuzzValue(i);

  if (fizzBuzzMessage == "Fizz") {
    return Colors.blue;
  } else if (fizzBuzzMessage == "Buzz") {
    return Colors.green;
  } else if (fizzBuzzMessage == "FizzBuzz") {
    return Colors.orange;
  } else {
    return Colors.grey; // Use a default color for numbers not divisible by 3 or 5
  }
}

String getFizzBuzzValue(int i) {
  if (i % 3 == 0 && i % 5 == 0) {
    return "FizzBuzz";
  } else if (i % 3 == 0) {
    return "Fizz";
  } else if (i % 5 == 0) {
    return "Buzz";
  } else {
    return "This number is not divisible by 3 or 5";
  }
}
