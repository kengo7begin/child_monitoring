#!/bin/bash

echo "🧹 Flutter Clean 開始..."
flutter clean

echo "📦 Flutter Pub Get 開始..."
flutter pub get

echo "🔨 Build Runner 実行中..."
dart run build_runner build --delete-conflicting-outputs

echo "✅ 全て完了！"
