import 'dart:io';

readFile() {
  String input = new File('./input')
  .readAsStringSync();
  return input;
}

int part1(data) {
  var res = data.split('|');
  var first = res[0].split('-');
  var second = res[1].split('-');

  int count = 0;
  if ((int.parse(first[0]) <= int.parse(second[0])) 
    && (int.parse(first[1]) >= int.parse(second[1]))) {
      count++;
  }else if ((int.parse(first[0]) >= int.parse(second[0])) 
    && (int.parse(first[1]) <= int.parse(second[1]))) {
      count++;
  }
  return(count);
}

int part2(data) {
  var res = data.split('|');
  var first = res[0].split('-');
  var second = res[1].split('-');

  int count = 0;
  if ((int.parse(first[1]) <= int.parse(second[1])) 
    && (int.parse(first[1]) >= int.parse(second[0]))) {
      count++;
  }else if ((int.parse(first[0]) >= int.parse(second[0])) 
    && (int.parse(first[0]) <= int.parse(second[1]))) {
      count++;
  }else if ((int.parse(first[1]) >= int.parse(second[1])) 
    && (int.parse(first[0]) <= int.parse(second[1]))) {
      count++;
  }else if ((int.parse(first[1]) <= int.parse(second[1])) 
    && (int.parse(first[1]) >= int.parse(second[0]))) {
      count++;
  }
  return(count);
}
dostuff(input) {
  var data = input.replaceAll(',', '|').split('\n')
  .toList();

  var count = data.map((e) => part1(e));
  print(count.fold(0, (a, b) => a + b));

  var count2 = data.map((e) => part2(e));
  print(count2.fold(0, (a, b) => a + b));
}

main() {
  var input = readFile();
  dostuff(input);
} 


