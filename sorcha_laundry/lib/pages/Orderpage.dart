import 'dart:convert';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../config/app_response.dart';
import '../config/app_session.dart';
import '../config/nav.dart';
import 'dashboard_views/my_laundry_view.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String shopId = '';
  double weight = 0.0;
  String pickupAddress = '';
  String deliveryAddress = '';
  double total = 0.0;
  String description = '';
  String status = 'Queue'; // Initial status is set to 'queue'

  final String apiUrl = '${AppConstants.baseURL}/laundries';
  late String bearer_token;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'shop_id': shopId,
          'weight': weight,
          'pickup_address': pickupAddress,
          'delivery_address': deliveryAddress,
          'total': total,
          'description': description,
          'status': status,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${bearer_token}',
        },
      );

        if (response.statusCode == 200) {
        // Successful submission, handle the response if needed
        final data = AppResponse.data(response);
        DInfo.toastSuccess('Order sudah diterima');
        print('Data submitted successfully');

        // Navigate to MyLaundryView
         Nav.replace(context, const MyLaundryView());
      } else {
        // Error in submission, handle the error if needed
        print('Error submitting data: ${response.statusCode}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    AppSession.getBearerToken().then((value) {
      setState(() {
        bearer_token = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Shop ID'),
                  onChanged: (value) {
                    setState(() {
                      shopId = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      weight = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Pickup Address'),
                  onChanged: (value) {
                    setState(() {
                      pickupAddress = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Delivery Address'),
                  onChanged: (value) {
                    setState(() {
                      deliveryAddress = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Total'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      total = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Status'),
                  readOnly: true,
                  initialValue: status,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyForm(),
  ));
}
