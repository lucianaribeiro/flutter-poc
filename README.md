# Flutter POC

### Configuring Flutter Version Management (fvm):

https://blog.flutter.wtf/flutter-version-management/

**Configuring IDE**: https://fvm.app/docs/getting_started/configuration/?ref=blog.flutter.wtf

### Extensions for VSCode:

- Dart from dartcode
- Flutter from dartcode
- Pubspec Assist

## Commands:

All commands use fvm to maintain the integrity of flutter version for each project:

**Verifies flutter dependencies and returns a status resport of dependencies installation and also the issues found and possible solutions:**

`$ fvm flutter doctor`

**Verifies the flutter version used in the project:**

`$ fvm flutter --version`

**Runing the project**

```
1. Runs in chrome browser
2. Runs the project in chrome in 8002 port

    $ fvm flutter run -d chrome

    $ fvm flutter run -d chrome --web-port=8002
```

**Running tests**

```
1.  Runs the tests
2. Runs the web tests for browser

    $ fvm flutter test

    $ fvm flutter test --platform=chrome
```

**List available devices to run flutter:**

`$ fvm flutter devices`

**Update packages and dependencies when every changes on pubspec.yaml**

`$ fvm flutter pub get`

**Generating Mocks with mockito:**

`$ fvm flutter pub run build_runner build --delete-conflicting-outputs`

## Testes em Flutter:

All tests are located in the root folder of the project.
By convention, the test files should always end with _\_test.dart_
