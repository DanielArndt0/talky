import 'package:flutter/material.dart';

class Failure implements Exception {
  final StackTrace? stackTrace;
  final dynamic exception;
  final String message;
  final String code;
  Failure({
    this.stackTrace,
    this.code = '',
    this.message = '',
    this.exception,
  }) {
    debugPrintStack(
      label: '$code: $message',
      stackTrace: stackTrace,
    );
  }
}
