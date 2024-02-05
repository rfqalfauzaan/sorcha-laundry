import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sorcha_laundry/models/user_model.dart';
import 'dart:convert';

import '../config/app_constants.dart';
import '../config/app_session.dart';


class LaundryListScreen extends StatefulWidget {
  @override
  _LaundryListScreenState createState() => _LaundryListScreenState();
}

class _LaundryListScreenState extends State<LaundryListScreen> {
     String? bearer_token;
    
       UserModel? id ;

  Future<List<dynamic>> fetchLaundries() async {
  try {
    final String apiUrl = '${AppConstants.baseURL}/laundries/user/1';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $bearer_token'},
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // parse the JSON response.
      return json.decode(response.body)['data'];
    } else {
      // If the server did not return a 200 OK response,
      // print the status code and response body.
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to load laundries');
    }
  } catch (error) {
    // Catch any exceptions that occur during the request.
    print('Error: $error');
    throw Exception('Failed to load laundries');
  }
}
     @override
  void initState() {
    super.initState();
        AppSession.getUser().then((value) {
      id = value!;
    });
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
        title: Text('Laundry List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchLaundries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No laundries found.'),
            );
          } else {
            // Render the list of laundries using a ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var laundry = snapshot.data![index];
                return ListTile(
                  title: Text(laundry['shop']['name']),
                  subtitle: Text(laundry['user']['name']),
                  // You can customize the appearance as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}

