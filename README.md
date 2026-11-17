# CAP_Presenter

Mobile app that displays disaster alerts written in the **Common Alerting Protocol (CAP)**. It is the presenter part of a three-part system; the alert editor and the server are in [CAP_System](https://github.com/Minchan6847/CAP_System).

Solo semester project for the Software System Lab course at the University of Seoul, September to December 2020.

> 한국어 요약: CAP(Common Alerting Protocol) 재난경보를 표출하는 Flutter 모바일 앱입니다. 경보 작성 웹과 웹서버는 [CAP_System](https://github.com/Minchan6847/CAP_System)에 있습니다. 2020년 2학기 서울시립대학교 소프트웨어시스템실습 과목의 개인 프로젝트입니다.

## What it does

1. On start, the app requests every stored alert from the server over HTTP (`GET /flutterTest`).
2. It parses each CAP XML document and shows a list with the headline, description, and the date and time the alert was sent.
3. Tapping an alert opens a detail view with the image decoded from the `derefUri` element and the description of the receiving area.

Alerts without an image show a built-in placeholder image.

### Not implemented

- Audio playback of an audio resource
- Filtering alerts by the user's region

## Code

All application code is in [`lib/main.dart`](lib/main.dart).

| Part | Role |
|---|---|
| `fetchPost()` | Loads the alert list from the server and maps it to `Post` objects (file name and XML text) |
| `xmlParsing()` | Reads `headline`, `description` and `sent` for the list |
| `xmlParsing2()` | Reads `derefUri` and `areaDesc` for the detail view |
| `MyApp` | First screen: the list of alerts |
| `CAPDetailPage` | Detail screen for one alert |

The file is large because the placeholder image is stored in it as a base64 string.

## Built with

Flutter (Dart SDK 2.7 or later, below 3.0), with the `http` and `xml` packages.

## Run

1. Start the server from [CAP_System](https://github.com/Minchan6847/CAP_System) on port 3000.
2. If the server is not on the same machine as the simulator, change the address in `fetchPost()` in `lib/main.dart`.
3. Run the app:

```bash
flutter pub get
flutter run
```

Developed and tested on the iPhone 12 Pro Max simulator.

## Report

The final report (in Korean) is linked from the project page on my portfolio: <https://minchan6847.github.io/#cap>.
