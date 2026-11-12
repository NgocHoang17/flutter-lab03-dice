# Dice

Ứng dụng lắc hai xúc xắc, sử dụng StatefulWidget và dart:math.

Dự án Flutter độc lập, dùng Flutter 3.38.6 / Dart 3.10.7.

## Chức năng

- Hiển thị hai xúc xắc bằng ảnh cục bộ.
- Nhấn nút để tạo số ngẫu nhiên từ 1 đến 6 cho mỗi viên.
- Cập nhật ảnh, tổng điểm và số lượt lắc.

## Chạy và kiểm tra

```powershell
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test.

## Nền tảng chạy

Dự án chỉ giữ nền tảng Android. Mở máy ảo Android, chạy `flutter devices` để kiểm tra kết nối, sau đó chạy `flutter run` và chọn thiết bị Android. Các thư mục nền tảng khác đã được loại bỏ.
