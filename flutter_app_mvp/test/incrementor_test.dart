import 'package:flutter_app_mvp/model/incrementor.dart';
import 'package:test_api/test_api.dart';

main(){
  group('Increment', ()
  {
    test('the value should increase.', () {
      expect(Incrementor().increment(1), 2);
    });
  });
}