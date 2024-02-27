import 'package:flutter/material.dart';

import '../src/rust/api/api.dart' as api;
import '../screens/components/commons.dart';

enum ReaderDirection {
  topToBottom,
  leftToRight,
  rightToLeft,
}

const _propertyName = "readerDirection";
late ReaderDirection _readerDirection;

Future initReaderDirection() async {
  _readerDirection = _fromString(await api.loadProperty(k: _propertyName));
}

ReaderDirection _fromString(String valueForm) {
  for (var value in ReaderDirection.values) {
    if (value.toString() == valueForm) {
      return value;
    }
  }
  return ReaderDirection.values.first;
}

ReaderDirection get currentReaderDirection => _readerDirection;

String readerDirectionName(ReaderDirection direction, BuildContext context) {
  switch (direction) {
    case ReaderDirection.topToBottom:
      return "从上到下";
    case ReaderDirection.leftToRight:
      return "从左到右";
    case ReaderDirection.rightToLeft:
      return "从又到左";
  }
}

Future chooseReaderDirection(BuildContext context) async {
  final Map<String, ReaderDirection> map = {};
  for (var element in ReaderDirection.values) {
    map[readerDirectionName(element, context)] = element;
  }
  final newReaderDirection = await chooseMapDialog(
    context,
    title: "请选择阅读器方向",
    values: map,
  );
  if (newReaderDirection != null) {
    await api.saveProperty(k: _propertyName, v: "$newReaderDirection");
    _readerDirection = newReaderDirection;
  }
}
