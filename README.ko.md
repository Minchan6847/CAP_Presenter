# CAP_Presenter

[English](README.md) | **한국어**

**CAP(Common Alerting Protocol)** 로 작성된 재난경보를 표출하는 모바일 앱입니다. 세 부분으로 이루어진 시스템 중 표출부이며, 경보 작성 웹과 웹서버는 [CAP_System](https://github.com/Minchan6847/CAP_System)에 있습니다.

2020년 9월부터 12월까지 서울시립대학교 소프트웨어시스템실습 과목에서 한 학기 동안 수행한 개인 프로젝트입니다.

## 기능

1. 앱을 시작하면 HTTP로 서버에 저장된 모든 경보를 요청합니다(`GET /flutterTest`).
2. 각 CAP XML 문서를 parsing해 제목, 본문, 경보 발송 날짜와 시간을 목록으로 보여줍니다.
3. 경보를 누르면 `derefUri` 요소에서 decoding한 이미지와 수신 지역 설명이 있는 세부 화면으로 이동합니다.

이미지가 없는 경보에는 앱에 내장된 기본 이미지를 보여줍니다.

### 구현하지 못한 기능

- 오디오 resource 재생
- 사용자 지역에 따른 경보 filtering

## 코드

앱 코드는 모두 [`lib/main.dart`](lib/main.dart)에 있습니다.

| 부분 | 역할 |
|---|---|
| `fetchPost()` | 서버에서 경보 목록을 받아 `Post` object(파일 이름과 XML text)로 변환 |
| `xmlParsing()` | 목록용 `headline`, `description`, `sent`를 읽음 |
| `xmlParsing2()` | 세부 화면용 `derefUri`, `areaDesc`를 읽음 |
| `MyApp` | 첫 화면: 경보 목록 |
| `CAPDetailPage` | 경보 하나의 세부 화면 |

기본 이미지를 base64 문자열로 담고 있어서 파일 크기가 큽니다.

## 사용 기술

Flutter(Dart SDK 2.7 이상, 3.0 미만), `http`와 `xml` package.

## 실행

1. [CAP_System](https://github.com/Minchan6847/CAP_System)의 서버를 port 3000에서 시작합니다.
2. 서버가 simulator와 다른 컴퓨터에 있으면 `lib/main.dart`의 `fetchPost()`에서 주소를 바꿉니다.
3. 앱을 실행합니다.

```bash
flutter pub get
flutter run
```

iPhone 12 Pro Max simulator에서 개발하고 테스트했습니다.

## 보고서

최종보고서는 포트폴리오의 프로젝트 페이지에 연결되어 있습니다: <https://minchan6847.github.io/#ko-cap>.
