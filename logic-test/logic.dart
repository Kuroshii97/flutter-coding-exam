import 'dart:convert';
import 'dart:io';

void main() {
  var int1 = stdin.readLineSync(encoding: utf8);
  var int2 = stdin.readLineSync(encoding: utf8);
  var int3 = stdin.readLineSync(encoding: utf8);
  var int4 = stdin.readLineSync(encoding: utf8);
  runLogic(int1, int2, int3, int4);
}

bool isNumeric(String string){
  if(string == null){
    return false;
  }
  return double.tryParse(string) != null;
}

void runLogic(var int1, var int2, var int3, var int4) {
  if(isNumeric(int1) && isNumeric(int2) && isNumeric(int3) && isNumeric(int4)){
    int input1 = int.parse(int1);
    int input2 = int.parse(int2);
    int input3 = int.parse(int3);
    int input4 = int.parse(int4);

    int countA = input1;
    int countB = input3;

    String decidingFactor = 'Tidak Bertemu';

    if(countA < countB){
      if(input2 > input4){
        do {
          countA += input2;
          countB += input4;
          if(countA == countB){
            decidingFactor = 'Bertemu di $countA';
            print(decidingFactor);
          }
        } while(countA <= countB);
      } else {
        print(decidingFactor);
      }
    } else {
      if(input4 > input2){
        do {
          countA += input2;
          countB += input4;
          if(countA == countB){
            decidingFactor = 'Bertemu di $countA';
            print(decidingFactor);
          }
        } while(countB <= countA);
      } else {
        print(decidingFactor);
      }
    }
  } else {
    print('Invalid input. Please enter a number.');
  }
}