import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
        driver.close();
    });

    var emailField = find.byValueKey('emailField_login');
    var phoneField = find.byValueKey('phoneField_login');
    var submitButton = find.byValueKey('submitButton_login');
    var successMessage = find.byValueKey('success_login');

    test('Test email field', () async {
      await driver.tap(emailField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Введите email'));

      await driver.enterText('test@testcom');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Поле email заполнено не корректно'));

      await driver.enterText('test.com');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Поле email заполнено не корректно'));

      await driver.enterText('test!@test%.com');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Поле email заполнено не корректно'));

      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
      await driver.tap(submitButton);
      await driver.waitForAbsent(find.text('Поле email заполнено не корректно'));
    });

    test('Test phone field', () async {
      await driver.tap(phoneField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Введите телефон'));


      await driver.enterText('89991112255');
      await driver.waitFor(find.text('89991112255'));

      await driver.enterText('test!@#%^&*(){}[]|+-/_89991112255');
      await driver.waitFor(find.text('89991112255'));
    });

    test('Success submit test', () async {
      await driver.tap(emailField);
      await driver.enterText('');
      await driver.tap(phoneField);
      await driver.enterText('');
      await driver.tap(submitButton);
      await driver.waitForAbsent(successMessage);


      await driver.tap(emailField);
      await driver.enterText('test@test.com');
      await driver.tap(phoneField);
      await driver.enterText('89991112255');
      await driver.tap(submitButton);
      await driver.waitFor(successMessage);
    });

  });

  group('Register form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
        driver.close();
    });

    var firstNameField = find.byValueKey('firstNameField_registration');
    var lastNameField = find.byValueKey('lastNameField_registration');
    var emailField = find.byValueKey('emailField_registration');
    var phoneField = find.byValueKey('phoneField_registration');
    var submitButton = find.byValueKey('submitButton_registration');
    var goToRegisterButton = find.byValueKey('goToRegisterView');
    var successMessage = find.byValueKey('success_register');

    test('Test email field', () async {
      await driver.tap(goToRegisterButton);

      await driver.tap(emailField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Заполните поле email'));

      await driver.enterText('test@testcom');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Емейл не корректный'));

      await driver.enterText('test.com');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Емейл не корректный'));

      await driver.enterText('test!@test%.com');
      await driver.tap(submitButton);
      await driver.waitFor(find.text('Емейл не корректный'));

      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
      await driver.tap(submitButton);
      await driver.waitForAbsent(find.text('Емейл не корректный'));
    });

    test('Test phone field', () async {
      await driver.tap(phoneField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Заполните поле телефон'));


      await driver.enterText('test!@#%^&*(){}[]|+-/_89991112255');
      await driver.waitFor(find.text('89991112255'));

      await driver.enterText('89991112255');
      await driver.waitFor(find.text('89991112255'));

      await driver.tap(submitButton);
      await driver.waitForAbsent(find.text('Заполните поле телефон'));
    });

    test('Test First Name field', () async {
      await driver.tap(firstNameField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Введите имя'));

      await driver.enterText('First Name');
      await driver.waitFor(find.text('First Name'));

      await driver.tap(submitButton);
      await driver.waitForAbsent(find.text('Введите имя'));
    });

    test('Test Last Name field', () async {
      await driver.tap(lastNameField);
      await driver.waitFor(find.text(''));

      await driver.tap(submitButton);
      await driver.waitFor(find.text('Введите фамилию'));

      await driver.enterText('Last Name');
      await driver.waitFor(find.text('Last Name'));

      await driver.tap(submitButton);
      await driver.waitForAbsent(find.text('Введите фамилию'));
    });


    test('Success submit test', () async {
      await driver.tap(firstNameField);
      await driver.enterText('');
      await driver.tap(lastNameField);
      await driver.enterText('');
      await driver.tap(phoneField);
      await driver.enterText('');
      await driver.tap(emailField);
      await driver.enterText('');
      await driver.tap(submitButton);
      await driver.waitForAbsent(successMessage);


      await driver.tap(firstNameField);
      await driver.enterText('First Name');
      await driver.tap(lastNameField);
      await driver.enterText('Last Name');
      await driver.tap(emailField);
      await driver.enterText('test@test.com');
      await driver.tap(phoneField);
      await driver.enterText('89991112255');
      await driver.tap(submitButton);
      await driver.waitFor(successMessage);
    });
  });
}
