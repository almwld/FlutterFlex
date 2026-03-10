#!/bin/bash

cd ~/FlexFlutter

echo "🔧 إنشاء Codemagic مع base64..."

cat > codemagic.yaml << 'EOF'
workflows:
  flex-yemen-android:
    name: Flex Yemen Android
    instance_type: mac_mini_m1
    max_build_duration: 30
    environment:
      flutter: stable
    scripts:
      - name: Create Flutter project structure
        script: |
          mkdir -p /tmp/my_code
          cp -r lib /tmp/my_code/
          cp pubspec.yaml /tmp/my_code/
          
          cd /tmp
          flutter create flex_yemen_new --org com.flexyemen
          
          cp -r /tmp/my_code/lib/* /tmp/flex_yemen_new/lib/
          cp /tmp/my_code/pubspec.yaml /tmp/flex_yemen_new/
          
          # app_theme.dart من base64
          echo "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CmltcG9ydCAncGFja2FnZTpmbHV0dGVyL3NlcnZpY2VzLmRhcnQnOwoKY2xhc3MgQXBwVGhlbWUgewogIHN0YXRpYyBjb25zdCBDb2xvciBnb2xkQ29sb3IgPSBDb2xvcigweEREQUYzNyk7CiAgc3RhdGljIGNvbnN0IENvbG9yIGRhcmtCYWNrZ3JvdW5kID0gQ29sb3IoMHhGRjEyMTIxMik7CiAgc3RhdGljIGNvbnN0IENvbG9yIGNhcmREYXJrID0gQ29sb3IoMHhGRjFBMUExQSk7CgogIHN0YXRpYyBUaGVtZURhdGEgZ2V0IGxpZ2h0VGhlbWUgPT4gVGhlbWVEYXRhKAogICAgZm9udEZhbWlseTogJ0NhaXJvJywKICAgIGJyaWdodG5lc3M6IEJyaWdodG5lc3MubGlnaHQsCiAgICBwcmltYXJ5Q29sb3I6IGdvbGRDb2xvciwKICAgIHNjYWZmb2xkQmFja2dyb3VuZENvbG9yOiBDb2xvcnMud2hpdGUsCiAgICB1c2VNYXRlcmlhbDM6IHRydWUsCiAgICBhcHBCYXJUaGVtZTogY29uc3QgQXBwQmFyVGhlbWUoCiAgICAgIGVsZXZhdGlvbjogMCwKICAgICAgYmFja2dyb3VuZENvbG9yOiBDb2xvcnMudHJhbnNwYXJlbnQsCiAgICAgIHN5c3RlbU92ZXJsYXlTdHlsZTogU3lzdGVtVWlPdmVybGF5U3R5bGUuZGFyaywKICAgICksCiAgKTsKCiAgc3RhdGljIFRoZW1lRGF0YSBnZXQgZGFya1RoZW1lID0+IFRoZW1lRGF0YSgKICAgIGZvbnRGYW1pbHk6ICdDYWlybycsCiAgICBicmlnaHRuZXNzOiBCcmlnaHRuZXNzLmRhcmssCiAgICBwcmltYXJ5Q29sb3I6IGdvbGRDb2xvciwKICAgIHNjYWZmb2xkQmFja2dyb3VuZENvbG9yOiBkYXJrQmFja2dyb3VuZCwKICAgIHVzZU1hdGVyaWFsMzogdHJ1ZSwKICAgIGFwcEJhclRoZW1lOiBjb25zdCBBcHBCYXJUaGVtZSgKICAgICAgZWxldmF0aW9uOiAwLAogICAgICBiYWNrZ3JvdW5kQ29sb3I6IENvbG9ycy50cmFuc3BhcmVudCwKICAgICAgc3lzdGVtT3ZlcmxheVN0eWxlOiBTeXN0ZW1VaU92ZXJsYXlTdHlsZS5saWdodCwKICAgICksCiAgKTsKfQo=" | base64 -d > /tmp/flex_yemen_new/lib/theme/app_theme.dart
          
          rm -rf $CM_BUILD_DIR/*
          cp -r /tmp/flex_yemen_new/* $CM_BUILD_DIR/
      
      - name: Get dependencies
        script: flutter pub get
      
      - name: Build APK
        script: flutter build apk --release
    
    artifacts:
      - build/**/outputs/**/*.apk
EOF

git add codemagic.yaml
git commit -m "🔧 Fix: Generate app_theme.dart from base64"
git push origin main

echo "✅ تم الرفع!"
echo "⏳ انتظر البناء..."

