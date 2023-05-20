import 'package:flutter/material.dart';

InputDecoration textInputDecoration(String hintText){
  return  InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          color: Colors.black54));
}