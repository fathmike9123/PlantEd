# plant_ed

A new Flutter project.

## Resources

- Firebase for Flutter Guide: [FlutterFire](https://firebase.flutter.dev/docs/overview)
  - For Cloud Firestore initial setup, [create a new project](https://console.firebase.google.com/)

## hooks_riverpod Guide

- Read more here:
  1. [RiverPod documentation](https://riverpod.dev/docs/getting_started/)
  2. [flutter_hooks Pub Dev](https://pub.dev/packages/flutter_hooks)
- Reading a provider:

```dart
// main_providers.dart (utility class)
final isEnabled = StateProvider<bool>((ProviderReference ref) => false);

-------------------------

// some_widget.dart (widget class)
// IMPORTANT: Widget must extend from HookWidget

class MyWidget extends HookWidget {
 @override
 Widget build(BuildContext context) {
   bool isThisEnabled = useProvider(isEnabled).state;
   return (
       ...
   );
}
```

- Modifying the value of a provider:

```dart
// Assume this is in some random function inside the HookWidget
useContext().read(nameOfProvider).state = valueOfProvider;

// Example from above
useContext().read(isEnabled).state = false;
```

## JSON Serialization Guide

- Make sure that [`json_serializable`](https://pub.dev/packages/json_serializable) and [`build_runner`](https://pub.dev/packages/build_runner) are installed (in pubspec.yaml)

- Follow the following format:

```dart
import 'package:json_annotation/json_annotation.dart';

part 'name_of_current_file.g.dart'; // must be named the same as current file

@JsonSerializable() // must add this annotation
class MyClassName {
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;

  MyClassName({required this.firstName, required this.lastName, this.dateOfBirth});

  // Must have these 2 factory methods
  factory MyClassName.fromJson(Map<String, dynamic> json) => _$MyClassNameFromJson(json);
  Map<String, dynamic> toJson() => _$MyClassNameToJson(this);
}
```

- To create auto-generate the files (with `build_runner`), run the following in the terminal:

```dart
// One-time only
flutter pub run build_runner build

// Continuous
flutter pub run build_runner watch
```
