echo "Regenerating code"
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter pub run intl_utils:generate