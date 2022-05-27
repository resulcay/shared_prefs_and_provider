import 'package:flutter/foundation.dart';

void main() {
  try {
    middleFunction(1000);
  } catch (e) {
    if (kDebugMode) {
      print('main function captured that error : $e');
    }
  }
}

void someFunction(int num) {
  if (num < 100) {
    if (kDebugMode) {
      print(num);
    }
  } else {
    throw Exception('Some error occured');
  }
}

void middleFunction(int num) {
  try {
    someFunction(num);
  } catch (e) {
    if (kDebugMode) {
      print('middle function captured that error : $e');
    }
    rethrow;
  }
}
