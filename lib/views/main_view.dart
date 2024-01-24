import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/info_view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pääsivu'),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoView()),
                );
              },
              child: Text('Go to Info View'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input');
              },
              child: Text('Testi'),
            ),
            SizedBox(height: 16.0), // Lisää väliä painikkeiden välille
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              },
              child: Text('Siirry Info-sivulle'),
            ),
          ],
        ),
      ),
    );
  }
}
