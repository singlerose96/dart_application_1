import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

import 'dart:io';

void main(List<String> arguments) {
  Map<String, String> products = {
    '셔츠': '45000원',
    '원피스': '30000원',
    '반팔티': '35000원',
    '반바지': '38000원',
    '양말': '5000원',
  };

  print('1: 상품 목록 보기');
  stdout.write('입력: ');
  String? input = stdin.readLineSync(); // 사용자에게 입력 받기

  if (input == '1') {
    print('\n📦 판매 중인 상품 목록:');
    products.forEach((name, price) {
      print('$name / $price');
    });
  } else {
    print('❗️잘못된 입력입니다.');
  }
}
