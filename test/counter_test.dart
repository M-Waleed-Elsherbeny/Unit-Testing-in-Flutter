/* 
  1. flutter pub add dev:test 
  2. flutter test
*/

import 'package:test/test.dart';
import 'package:unit_testing_in_flutter/counter.dart';

void main() {
  group("Test Counter In increment & decrement", (){
    
      test("The Counter should increment By 1", () {
      Counter counter = Counter();
      counter.incrementCounter();
      expect(counter.counter, 1);
    });
    test("The Counter should decrement (-1)", () {
      Counter counter = Counter();
      counter.decrementCounter();
      expect(counter.counter, -1);
    });
    test("The Counter should Reset By 0", () {
      Counter counter = Counter();
      counter.resetCounter();
      expect(counter.counter, 0);
    });
  });
}
