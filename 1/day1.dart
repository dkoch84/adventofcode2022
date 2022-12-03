import 'dart:io';

readFile() {
  String input = new File('./input')
  .readAsStringSync();
  return input;
}

dostuff(input) {
  var mapp = input.split('\n\n')
  .map((c) => c.split('\n'))
  .toList()
  .map((c) => c.map((x) => int.parse(x)))
  .toList();

  var sortedAsc = mapp.map((e) => e.reduce((x,y) => x + y))
  .toList()
  ..sort();

  var sortedDesc = sortedAsc.reversed.toList();
  print(sortedDesc[0]);
  print(sortedDesc[0] + sortedDesc[1] + sortedDesc[2]);
}

main() {
  var input = readFile();
  dostuff(input);
}