// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    var emailField = Key('emailField_login');
    var phoneField = Key('phoneField_login');
    var submitButton = Key('submitButton_login');

    testWidgets("Fields availability test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      expect(find.byKey(emailField), findsOneWidget);
      expect(find.byKey(phoneField), findsOneWidget);
      expect(find.byKey(submitButton), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets("Empty fields test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);
      expect(find.text('Введите телефон'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets("Empty fields test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);
      expect(find.text('Введите телефон'), findsOneWidget);
    });

    testWidgets("Email field test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      await tester.enterText(find.byKey(emailField), 'test@testcom');
      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);

      await tester.enterText(find.byKey(emailField), 'test.com');
      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);

      await tester.enterText(find.byKey(emailField), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);
    });

    testWidgets("Phone field test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      await tester.enterText(find.byKey(phoneField), '89991112255');
      expect(find.text('89991112255'), findsOneWidget);

      await tester.enterText(find.byKey(phoneField), 'test!@#%^&*(){}[]|+-/_89991112255');
      expect(find.text('89991112255'), findsOneWidget);
    });

    testWidgets("Submit form test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      await tester.enterText(find.byKey(emailField), 'test@test.com');
      await tester.enterText(find.byKey(phoneField), '89991112255');
      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  group('Registration view tests', () {
    var firstNameField = Key('firstNameField_registration');
    var lastNameField = Key('lastNameField_registration');
    var emailField = Key('emailField_registration');
    var phoneField = Key('phoneField_registration');
    var submitButton = Key('submitButton_registration');

    testWidgets("Fields availability test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(
          startFormType: FormType.register,
        ),
      ));

      expect(find.byKey(firstNameField), findsOneWidget);
      expect(find.byKey(lastNameField), findsOneWidget);
      expect(find.byKey(phoneField), findsOneWidget);
      expect(find.byKey(emailField), findsOneWidget);

      expect(find.byKey(submitButton), findsOneWidget);

      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets("Empty fields test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(
          startFormType: FormType.register,
        ),
      ));

      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Введите имя'), findsOneWidget);
      expect(find.text('Введите фамилию'), findsOneWidget);
      expect(find.text('Заполните поле телефон'), findsOneWidget);
      expect(find.text('Заполните поле email'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets("Phone field test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(
          startFormType: FormType.register,
        ),
      ));

      await tester.enterText(find.byKey(phoneField), '89991112255');
      expect(find.text('89991112255'), findsOneWidget);

      await tester.enterText(find.byKey(phoneField), 'test!@#%^&*(){}[]|+-/_89991112255');
      expect(find.text('89991112255'), findsOneWidget);
    });

    testWidgets("Email field test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(
          startFormType: FormType.register,
        ),
      ));

      await tester.enterText(find.byKey(emailField), 'test@testcom');
      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Емейл не корректный'), findsOneWidget);

      await tester.enterText(find.byKey(emailField), 'test.com');
      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Емейл не корректный'), findsOneWidget);

      await tester.enterText(find.byKey(emailField), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets("Submit form test", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(
          startFormType: FormType.register,
        ),
      ));

      await tester.enterText(find.byKey(phoneField), '89991112255');
      await tester.enterText(find.byKey(emailField), 'test@test.com');
      await tester.enterText(find.byKey(firstNameField), 'First Name');
      await tester.enterText(find.byKey(lastNameField), 'Last Name');

      await tester.tap(find.byKey(submitButton));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
