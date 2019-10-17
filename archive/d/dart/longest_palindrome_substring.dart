import 'dart:math';

main(List<String> args) {
  args = ['11123432', '123454321', '123432'];
  print(args);
  for (String arg in args) {
    print(longestPalindrome(arg));
  }
}

String longestPalindrome(input) {
  String longestFound = '';
  List<int> listOfCenters = [input.length - 1];

  for (var diff = 1; diff <= (input.length); diff++) {
    listOfCenters.add(listOfCenters[0] + diff);
    listOfCenters.add(listOfCenters[0] - diff);
  }
  print(listOfCenters);

  for (int center in listOfCenters) {
    int left;
    int right;

    if (min((center + 1), (2 * input.length - 1)) <= longestFound.length) {
      break;
    } else if (center % 2 == 0) {
      left = (center ~/ 2) - 1;
      right = (center ~/ 2) + 1;
    } else {
      left = (center ~/ 2);
      right = (center ~/ 2) + 1;
    }

    while ((left >= 0) &&
        (right < input.length) &&
        (input[left] == input[right])) {
      left--;
      right++;
    }

    if ((right - left) > longestFound.length) {
      longestFound = input.split('').getRange((left + 1), (right)).join();
    }
  }

  return longestFound;
}
