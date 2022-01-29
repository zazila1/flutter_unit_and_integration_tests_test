import 'package:flutter/material.dart';
import 'package:testing/components/login_form.dart';
import 'package:testing/components/register_form.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  const LoginView({Key? key, this.startFormType = FormType.login}) : super(key: key);

  final FormType startFormType;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late FormType _formType;
  // _LoginViewState(this._formType);

  @override
  void initState()
  {
    super.initState();
    setState(() {
      _formType = widget.startFormType;
    });
  }

  _switchForm() {
    setState(() {
      _formType = _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _formType == FormType.login ? 'Вход' : 'Регистрация',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _formType == FormType.login ? const LoginForm() : const RegisterForm(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formType == FormType.register ? 'Уже есть аккаунт?' : 'Еще нет аккаунта? ',
                    ),
                    TextButton(
                      key: _formType == FormType.register ? const Key('goToLoginView') : const Key('goToRegisterView'),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: _formType == FormType.register ? 'Войти' : 'Регистрация',
                          )
                        ], style: Theme.of(context).textTheme.bodyText1),
                      ),
                      onPressed: _switchForm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
