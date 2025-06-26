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
    print('6: 장바구니 초기화');
    stdout.write('\n무엇을 도와드릴까요?: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('\n📦 판매 중인 상품 목록:');
        products.forEach((name, price) => print('$name / $price'));
        break;

      case '2':
        stdout.write('\n상품 이름을 입력하세요 : ');
        String? name = stdin.readLineSync();
        if (name == null || !products.containsKey(name)) {
          print('입력값이 올바르지 않아요 !');
          break;
        }

        stdout.write('상품 개수를 입력하세요 : ');
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
          print('\n!!!🛒 장바구니가 비어 있어요!!!');
        } else {
          print('\n🩶 🩶 🩶 장바구니 내용 🩶 🩶 🩶 :');
          cart.forEach((name, qty) => print('- $name x $qty'));

         int total = 0;
         cart.forEach((name, qty) {//장바구니의 가격을 int타입으로 변환
          String? priceString = products[name]!.replaceAll('원', '');
          int price = int.parse(priceString.replaceAll('원',''));
          int subtotal = price * qty;
          print('- $name x $qty개 = $subtotal원'); //담긴목록

          total += subtotal;
         });
         print('\n- 총 $total 원'); //총가격 출력

         int giftGoal = 20000; //사은품조건

      if(total >= giftGoal) {
        print('\n❤️ $giftGoal 원 이상 구매하셔서 사은품으로 비누를 드려요 ❤️');
         cart['비누'] = 1;
      } else {
        print('❤️ $giftGoal 원 구매하시면 사은품으로 비누를 드려요! ❤️');
      }
      }
        break;

       case '4':
        print('\n진짜 가실려구요....?');
        stdout.write('\n5 를 눌러서 나가기 // ');
        print('  이어서 쇼핑하려면 아무키나 누르세요');

        String? exit = stdin.readLineSync();

        if(exit == '5') {
          print('\n다음에 또 만나요!');
          isRunning = false;
        }
          else {
            print('휴! 정말 가시는 줄 알았어요!');
          }
        break;

      case '6':
       if (cart.isEmpty) {
       print('\n이미 장바구니가 비어있어요.');
       } else {
       cart.clear(); // 장바구니 초기화
        print('\n장바구니가 비워졌어요.');
       }
      break;
  
      default : print('❗️잘못된 입력입니다.');
    }
  }
}
