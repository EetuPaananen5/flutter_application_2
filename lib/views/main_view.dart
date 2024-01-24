import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pääsivu'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/input');
            },
            icon: Icon(Icons.text_fields),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
            icon: Icon(Icons.info),
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
              child: Text('Siirry Input-sivulle'),
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
