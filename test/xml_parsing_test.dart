// Unit tests for the CAP XML parsing helpers in lib/main.dart.
// These do not need a running server or a device.

import 'package:flutter_test/flutter_test.dart';

import 'package:myapp1/main.dart';

const String fullCap = '''
<alert>
  <sent>2020-11-20T09:30:00+09:00</sent>
  <info>
    <headline>호우경보</headline>
    <description>시간당 50mm 이상의 강한 비가 예상됩니다.</description>
    <resource>
      <derefUri>data:image/png;base64,AAAA</derefUri>
    </resource>
    <area>
      <areaDesc>서울특별시</areaDesc>
    </area>
  </info>
</alert>
''';

const String minimalCap = '''
<alert>
  <sent>2020-11-21T18:00:00+09:00</sent>
  <info>
    <area>
      <areaDesc>부산광역시</areaDesc>
    </area>
  </info>
</alert>
''';

void main() {
  group('xmlParsing', () {
    test('reads headline, description and sent', () {
      final data = xmlParsing(fullCap);

      expect(data['headline'], '호우경보');
      expect(data['description'], '시간당 50mm 이상의 강한 비가 예상됩니다.');
      expect(data['sent'], '2020-11-20T09:30:00+09:00');
    });

    test('falls back to default text when headline/description are missing',
        () {
      final data = xmlParsing(minimalCap);

      expect(data['headline'], '제목 없음');
      expect(data['description'], '설명 없음');
      expect(data['sent'], '2020-11-21T18:00:00+09:00');
    });
  });

  group('xmlParsing2', () {
    test('reads derefUri and areaDesc', () {
      final data = xmlParsing2(fullCap);

      expect(data['derefUri'], 'data:image/png;base64,AAAA');
      expect(data['areaDesc'], '서울특별시');
    });

    test('uses the placeholder image when there is no resource', () {
      final data = xmlParsing2(minimalCap);

      expect(data['derefUri'], base64);
      expect(data['areaDesc'], '부산광역시');
    });
  });
}
