import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Syötä teksti',
              ),
            ),
            SizedBox(
                height: 16.0), // Lisää väliä tekstikentän ja painikkeen välille
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
