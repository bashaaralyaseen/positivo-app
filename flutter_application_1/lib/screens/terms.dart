import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to our application.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'By using this application, please comply with the following terms:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. You acknowledge that this application is for experimental purposes only and carries no warranties or legal obligations.',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '2. You agree not to direct any technical inquiries or support requests to the developers of this application.',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '3. We are not responsible for any unlawful or harmful use of this application.',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '4. We reserve the right to change the terms and conditions of this application at any time without prior notice.',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'By using this application, you agree to comply with the mentioned terms of use.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
