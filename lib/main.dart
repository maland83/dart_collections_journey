import 'dart:math';

import 'package:dart_collections_journey/names.dart';
import 'package:word_generator/word_generator.dart';

void main(List<String> args) {
  runTask1();
  runTask2();
  runTask3();
}

void runTask1() {
  printSeperator('Task 1');

  List<int> numbers = List.generate(100, (_) => Random().nextInt(101));
  print(numbers);
  print('\n65-й елемент: ${numbers[64]}');

  // Вставте число 1000000000 на 50-ту позицію списку.
  numbers.insert(51, 1000000000);

  // Видаліть зі списку елементи зі значеннями: 24, 45, 66, 88.

  final List<int> numbersForRemove =
      '24, 45, 66, 88'.split(',').map<int>((e) {
        return int.tryParse(e) ?? 0;
      }).toList();

  print('\nBefore removing: ${numbers.length}');
  numbers.removeWhere((item) => numbersForRemove.contains(item));
  print('After removing: ${numbers.length} \n');

  int totalSum = 0;

  for (var i = 0; i < numbers.length; i++) {
    totalSum += numbers[i] % 3 == 0 ? numbers[i] : 0;
  }
  print(
    'Сума всіх елементів, що діляться на 3 без залишку.: ' +
        totalSum.toString(),
  );

  List temp = [];
  for (var element in numbers) {
    if (element % 2 == 0) {
      temp.add(element);
    }
  }
  //  лише ті елементи, що діляться на 2 без залишку.
  print('Довжина списку temp: ${temp.length}');
}

void runTask2() {
  printSeperator('Task 2');

  final Set<String> uniqueNames1 = ukrainianNames1.toSet();
  final Set<String> uniqueNames2 = ukrainianNames2.toSet();
  final Set<String> unionNames = uniqueNames1.union(uniqueNames2);
  print('Кількість елементів у ножині: ${unionNames.length}');

  var diff1 = uniqueNames1.difference(uniqueNames2);
  print(diff1);

  var diff2 = uniqueNames2.difference(uniqueNames1);
  print(diff2);
}

void runTask3() {
  printSeperator('Task 3');

  final wordGenerator = WordGenerator();

  List<String> nounsList = wordGenerator.randomNouns(50).toList();

  final Map<String, int> nounsMap = {};

  for (var noun in nounsList) {
    nounsMap[noun] = noun.length;
  }

  final Map<String, int> tempNouns = {};

  for (var entry in nounsMap.entries) {
    if (entry.value % 2 == 0) {
      tempNouns[entry.key] = entry.value;
    }
  }

  for (var key in tempNouns.keys) {
    print("${key} ");
  }
}

void printSeperator(String task) {
  final part = List.filled(20, '-').join('');
  print('\n${part} ${task} ${part}\n');
}
