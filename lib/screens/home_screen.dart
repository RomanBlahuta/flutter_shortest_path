import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            'Home screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        onPressed: () => Navigator.pushNamed(context, 'calculation'),
                        child: const Text(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            'Start counting process'
                        ),
                      ),
                    )
                )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child:
                  Text(
                    'Set valid API base URL in order to continue',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.sync_alt,
                      size: 18,
                    ),
                    Container(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter URL',
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
