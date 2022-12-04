import 'dart:io';

readFile() {
  String input = new File('./input')
  .readAsStringSync();
  return input;
}

String elfy(c) {
  var h1 = c.substring(0, (c.length/2).toInt());
  var h2 = c.substring((c.length/2).toInt(), c.length);
  var h3 = h1.split('');
  var h4 = h2.split('');

  var result;
  h3.forEach((c) {
    if (h4.contains(c)) {
      result = c;
    }
  });
  return(result);
}

String elfo(c) {
  var h1 = c[0].split('');
  var h2 = c[1].split('');
  var h3 = c[2].split('');

  var result;
  h1.forEach((c) {
    if (h2.contains(c)) {
      if (h3.contains(c)) {
        result = c;
      }
    }
  });
  return(result);
}

dostuff(input) {
  var key = '-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var data = input.split('\n')
  .toList();

  var nums = data.map((c) => key.indexOf(elfy(c)));
  print(nums.fold(0, (a, b) => a + b));

  var temp = [];
  var temp2 = [];
  while (data.length > 0) {
    temp.add(data.removeAt(0));
    temp.add(data.removeAt(0));
    temp.add(data.removeAt(0));
    temp2.add(temp.join('-'));
    temp.clear();
  }

  var data2 = temp2.map((c) => c.split('-'));
  var nums2 = data2.map((c) => key.indexOf(elfo(c)));
  print(nums2.reduce((a, b) => a + b));

}

main() {
  var input = readFile();
  dostuff(input);
} 