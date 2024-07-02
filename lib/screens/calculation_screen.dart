import 'package:flutter/material.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({super.key});

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
            'Process screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned.fill(
                bottom: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(side: const BorderSide(
                            color: Colors.lightBlue,
                            width: 2,
                            style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(14)
                        ),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'solutions'),
                      child: const Text(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          'Send results to server'
                      ),
                    ),
                  )
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                    child:
                    Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      'All calculations have finished, you can send your results to server',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 64),
                    child: Text(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        '100%'),
                  ),
                  Transform.scale(
                    scale: 3,
                    child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.lightBlue,
                          // value: 0.7,
                          semanticsLabel: 'Circular progress indicator',
                        ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
