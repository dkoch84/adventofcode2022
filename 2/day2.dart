import 'dart:io';

readFile() {
  String input = new File('./input')
  .readAsStringSync();
  return input;
}

final scoreCard = {
  'A': '1',
  'B': '2',
  'C': '3',
  'X': '1',
  'Y': '2', 
  'Z': '3'
};

int score(elf, man) {
  int e = int.parse(scoreCard[elf]!);
  int m = int.parse(scoreCard[man]!);
  
  if (m == 3 && e == 1) {
    e = 4;
  }else if (e == 3 && m == 1) {
    e = 0;
  }

  if (e > m){
    return(m);
  }else if (e == m) {
    return(3 + m);
  }else {
    return(6 + m);
  }
}

shiftyelves(round) {
  String wtp = round[1];

  if (wtp == 'Y') {
    wtp = round[0];
  }else if (wtp == 'X') {
    switch (round[0]) {
      case 'A':
        wtp = 'C';
        break;
      case 'B':
        wtp = 'A';
        break;
      case 'C':
        wtp = 'B';
        break;
    }
  }else {
    switch (round[0]) {
      case 'A':
        wtp = 'B';
        break;
      case 'B':
        wtp = 'C';
        break;
      case 'C':
        wtp = 'A';
        break;
    }
  }
  
  return(score(round[0], wtp));
}

dostuff(input) {
  var data = input.split('\n')
  .map((c) => c.split(' '))
  .toList();

  var score1 = data.map((c) => score(c[0], c[1]));
  print(score1.fold(0, (a, b) => a + b));
  var score2 = data.map((c) => shiftyelves(c));
  print(score2.fold(0, (a, b) => a + b));
}

main() {
  var input = readFile();
  dostuff(input);
}