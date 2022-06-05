import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;
  final String hintText;
  final Function(String value) validatorFunction;
  final TextEditingController textEditingController;
  final TextInputType textInput;
  final TextInputAction textInputAction;

  const TextFieldCustom({Key key,
    this.hintText,
    this.validatorFunction,
    this.title,
    this.textEditingController,
    this.textInput,
    this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: textEditingController,
          keyboardType: textInput ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.done,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 15, top: 5, bottom: 10, right: 10),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => validatorFunction(value),
        ),
      ],
    );
  }
}
