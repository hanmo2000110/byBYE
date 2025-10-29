# Assets 폴더 구조

이 폴더는 프로젝트에서 사용하는 모든 정적 자산들을 관리합니다.

## 폴더 구조

```
assets/
├── images/
│   ├── backgrounds/     # 배경 이미지
│   ├── illustrations/   # 일러스트레이션
│   ├── logos/          # 로고 이미지
│   └── profile/        # 프로필 관련 이미지
├── icons/
│   ├── navigation/     # 네비게이션 아이콘
│   ├── ui/            # UI 아이콘
│   └── social/        # 소셜 미디어 아이콘
├── fonts/             # 커스텀 폰트 파일
└── data/              # JSON, XML 등 데이터 파일
```

## 사용법

파일을 해당 카테고리에 맞는 폴더에 저장하고, `pubspec.yaml`에서 assets 섹션에 추가해주세요.

예시:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/fonts/
    - assets/data/
```