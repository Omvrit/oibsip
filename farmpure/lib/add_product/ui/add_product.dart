import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:farmpure/backend_services/add_product/add_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductFormPage extends StatefulWidget {
  UserCredential userCredential;

  ProductFormPage(this.userCredential);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _soldController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  // final TextEditingController _userUidController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String? _category;
  DateTime? _createdAt;
  File? _selectedImage;

  final List<String> _categories = ["Compost", "Fertilizer", "Seeds"];

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }

  }

  Future<void> upload() async{
    final url  = Uri.parse('https://api.cloundinary.com/v1_1/dbq1ulh8r/upload');
    final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = 'ofnxhc7u'
    ..files.add(await http.MultipartFile.fromPath('file', _selectedImage!.path));
      final response = await request.send();
      if(response.statusCode == 200){
       final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final Map<String, dynamic> responseJson = json.decode(responseString);


        }


      else{
        print('error');
      }
  }



  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _createdAt = pickedDate;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      bool status =await  AddProduct.addProduct(
        name: _nameController.text,
        description: _descriptionController.text,
        image: _selectedImage!,
        price: double.parse(_priceController.text),
        category: _category!,
        stock: int.parse(_quantityController.text),
        userUid: widget.userCredential.user!.uid,
        sold: 0,
      );

      if (!status) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("An error occurred")),
        );
        Navigator.pop(context);
        return;
      }


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
      await Future.delayed(const Duration(seconds: 2));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Form"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter the product name" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
                validator: (value) => value!.isEmpty
                    ? "Please enter the product description"
                    : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the product price" : null,
              ),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: "Rating"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the product rating" : null,
              ),
              TextFormField(
                controller: _soldController,
                decoration: const InputDecoration(labelText: "Sold"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the sold quantity" : null,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Category"),
                items: _categories
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select a category" : null,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the quantity" : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _pickDate,
                      child: Text(_createdAt == null
                          ? "Select Created At"
                          : _createdAt.toString()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("Select Image"),
                  ),
                ],
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.file(
                    _selectedImage!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
