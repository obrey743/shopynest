import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  String selectedCategory = 'Tops';
  String selectedSize = 'S';
  String selectedCondition = 'Like New';

  final List<String> categories = ['Tops', 'Bottoms', 'Dresses', 'Jackets', 'Shoes', 'Accessories'];
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> conditions = ['Like New', 'Excellent', 'Good', 'Fair'];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell an Item'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPhotoSection(),
              SizedBox(height: 24),
              _buildTitleField(),
              SizedBox(height: 16),
              _buildDescriptionField(),
              SizedBox(height: 16),
              _buildPriceField(),
              SizedBox(height: 16),
              _buildCategoryDropdown(),
              SizedBox(height: 16),
              _buildSizeAndConditionRow(),
              SizedBox(height: 32),
              _buildPostButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_a_photo, size: 50, color: Colors.grey[500]),
          SizedBox(height: 8),
          Text('Add Photos', style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: 'Item Title',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a description';
        }
        return null;
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      controller: _priceController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price (\$)',
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a price';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid price';
        }
        return null;
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: categories.map((category) {
        return DropdownMenuItem(value: category, child: Text(category));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
    );
  }

  Widget _buildSizeAndConditionRow() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedSize,
            decoration: InputDecoration(
              labelText: 'Size',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: sizes.map((size) {
              return DropdownMenuItem(value: size, child: Text(size));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value!;
              });
            },
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedCondition,
            decoration: InputDecoration(
              labelText: 'Condition',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: conditions.map((condition) {
              return DropdownMenuItem(value: condition, child: Text(condition));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCondition = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPostButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Item posted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            _clearForm();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Post Item',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void _clearForm() {
    _titleController.clear();
    _descriptionController.clear();
    _priceController.clear();
    setState(() {
      selectedCategory = 'Tops';
      selectedSize = 'S';
      selectedCondition = 'Like New';
    });
  }
}