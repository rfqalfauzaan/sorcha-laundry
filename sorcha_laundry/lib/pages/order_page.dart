import 'package:flutter/material.dart';
import '../config/app_constants.dart';
import 'package:http/http.dart' as http;

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController shopIdController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _submitForm() async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseURL}/product'),
      body: {
        'weight': weightController.text,
        'shop_id': shopIdController.text,
        'description': descriptionController.text,
      },
    );

    if (response.statusCode == 201) {
      // Berhasil menyimpan data
      print('Product created successfully');
    } else {
      // Gagal menyimpan data
      print('Failed to create product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: shopIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Shop ID'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductForm(),
  ));
}