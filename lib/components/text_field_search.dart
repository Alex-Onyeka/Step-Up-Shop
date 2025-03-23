import 'package:flutter/material.dart';

class TextFieldSearch extends StatefulWidget {
  final void Function(String)? searchShoe;
  final TextEditingController? searchTextField;
  const TextFieldSearch({
    super.key,
    required this.searchShoe,
    required this.searchTextField,
  });

  @override
  State<TextFieldSearch> createState() =>
      _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      controller: widget.searchTextField,
      onSubmitted: widget.searchShoe,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade400,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
            width: 1.8,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade500,
            width: 1.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        hintText: 'Search For Shoes',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
