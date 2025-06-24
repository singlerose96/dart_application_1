import 'dart:io';

void main(List<String> arguments) {
  bool isRunning = true;

  Map<String, String> products = {
    '셔츠': '45000원',
    '원피스': '30000원',
    '반팔티': '35000원',
    '반바지': '38000원',
    '양말': '5000원',
  };

  final Map<String, int> cart = {};

  while (isRunning) {
    print('\n1: 상품 목록 보기');
    print('2: 장바구니에 상품 담기');
    print('3: 장바구니 보기');
    print('4: 종료하기');
    stdout.write('입력: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('\n📦 판매 중인 상품 목록:');
        products.forEach((name, price) => print('$name / $price'));
        break;

      case '2':
        stdout.write('\n담을 상품 이름: ');
        String? name = stdin.readLineSync();
        if (name == null || !products.containsKey(name)) {
          print('입력값이 올바르지 않아요 !');
          break;
        }

        stdout.write('담을 개수: ');
        int? qty = int.tryParse(stdin.readLineSync() ?? '');
        if (qty == null) {
          print('입력값이 올바르지 않아요 !');
          break;
        }

        if (qty <= 0) {
          print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
          break;
        }

        // 장바구니에 상품 추가
        cart[name] = (cart[name] ?? 0) + qty;
        print('장바구니에 상품이 담겼어요 !');
        break;

      case '3':
        if (cart.isEmpty) {
          print('\n🛒 장바구니가 비어 있어요.');
        } else {
          print('\n🛒 장바구니 내용:');
          cart.forEach((name, qty) => print('$name x $qty'));
        }
        break;

      case '4':
        print('\n이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        isRunning = false;
        break;

      default:
        print('❗️잘못된 입력입니다.');
    }
  }
}
