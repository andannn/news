import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('simple', () {
    test('test_list_equals', () async {
      expect(['1', '2', '3'], equals(['1', '2', '3']));
    });
    test('test_list_equals2', () async {
      expect(['1', '2', '3'] == ['1', '2', '3'], equals(true));
    });
    test('test_list_equals3', () async {
      List<int> list1 = [1, 2, 3];
      List<int> list2 = [1, 2, 3];
      List<int> list3 = [3, 2, 1];

      print(list1 == list2);
    });
    test('test_set_equals', () async {
      expect({'1', '2', '3'}, equals({'1', '2', '3'}));
    });
    test('test_set_equals2', () async {
      List<int> list1 = [1, 2, 3];
      List<int> list2 = [3, 2, 1];

      Set<int> set1 = Set.from(list1);
      Set<int> set2 = Set.from(list2);

      print(set1 == set2);
    });
  });
}
