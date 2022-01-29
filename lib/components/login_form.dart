import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    _formKey.currentState!.save();
    setState(() {
      _isSuccess = _formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key("emailField_login"),
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value)) {
                return 'Поле email заполнено не корректно';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: const Key("phoneField_login"),
            validator: (value) {
              if (value == '') return 'Введите телефон';
              return null;
            },
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          TextButton(
            key: const Key("submitButton_login"),
            child: const Text('Отправить'),
            onPressed: _handleSubmit,
          ),
          if (_isSuccess)
            const Text(
              'Добро пожаловать',
              key: Key('success_login'),
            ),
        ],
      ),
    );
  }
}
