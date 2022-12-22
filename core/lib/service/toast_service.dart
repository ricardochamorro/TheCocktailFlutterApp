// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToastService {
  
  show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)
        ));
  }

  showInCenter(String message) {
  }
}
