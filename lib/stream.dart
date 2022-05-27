import 'dart:async';

import 'package:flutter/foundation.dart';

main(value) {
  StreamController _myStreamController = StreamController();

  void functionForMyStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (i == 6) {
        _myStreamController.addError('some error occured');
      }
      _myStreamController.sink.add(i + 1);
    }
    _myStreamController.close();
  }

  functionForMyStreamController();

  _myStreamController.stream.listen(
    (event) {
      if (kDebugMode) {
        print(event * 10);
      }
    },
    onDone: () {
      if (kDebugMode) {
        print('onDone property invoked where in Stream Listen');
      }
    },
    onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    },
    cancelOnError: true,
  );
}

Stream<int> myStreamFunction() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i + 1;
  }
}
