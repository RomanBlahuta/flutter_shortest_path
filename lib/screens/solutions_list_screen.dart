import 'package:flutter/material.dart';

class SolutionListScreen extends StatelessWidget {
  const SolutionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightBlue,
        title: const Text(
            style: TextStyle(
              color: Colors.white,
            ),
            'Result list screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'solution'),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.black12,
                        )
                    )
                ),
                height: 72,
                width: double.infinity,
                child: const Center(
                    child: Text(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        '(2,1) -> (1, 1) -> (0, 1)'
                    )
                ),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'solution'),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.black12,
                        )
                    )
                ),
                height: 72,
                width: double.infinity,
                child: const Center(
                    child: Text(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        '(2,1) -> (1, 1) -> (0, 1)'
                    )
                ),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'solution'),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.black12,
                        )
                    )
                ),
                height: 72,
                width: double.infinity,
                child: const Center(
                    child: Text(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        '(2,1) -> (1, 1) -> (0, 1)'
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
