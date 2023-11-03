import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/router.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/styles/sizes.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../features/shared/presentation/widgets/button_shared.dart';
import '../../../../features/shared/presentation/widgets/text_label_shared.dart';
import '../../../shared/presentation/widgets/auth_register_container.dart';
import '../../../shared/presentation/widgets/email_input.dart';
import '../../../shared/presentation/widgets/password_input.dart';
import '../bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginFinished) {
            if (state.status == Status.waiting) {
              //show loader
              AppUtils.showLoader(context: context);
            } else if (state.status == Status.succeded) {
              //show loader
              context.pop();
              context.go('/home/0');
            } else if (state.status == Status.failed) {
              //show error message;
              context.pop();
              AppUtils.showAlert(context, state.message ?? 'Error',
                  AppUtils.accentprimaryColor(context));
            }
          }
        },
        child: Stack(
          children: <Widget>[
            AppUtils.firstPosition(context),
            AppUtils.secondPosition(context, "Login"),
            AppUtils.thirdPosition(context),
            Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    AuthRegisterContainer(
                      children: [
                        EmailInput(
                          emailTextFieldController: _emailTextFieldController,
                        ),
                        PasswordInput(
                          passwordTextFieldController:
                              _passwordTextFieldController,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                      child: ButtonShared(
                        text: "SIGN IN",
                        colorButton: AppColors.primaryColor,
                        onClick: _doLogin,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextLabelShared(
                            colorTextLabel:
                                AppUtils.onprimarygreyColor(context),
                            labelText: "DON'T HAVE AN ACCOUNT ? ",
                            sizeLabelText: AppSizes.meduimText,
                            fontLabelText: FontWeight.w500,
                            onClick: () {}),
                        TextLabelShared(
                          colorTextLabel: AppUtils.accentprimaryColor(context),
                          labelText: " SIGN UP",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w700,
                          onClick: _goToRegisterPage,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _doLogin() {
    if (_formKey.currentState!.validate()) {
      String email = _emailTextFieldController.text.toString().trim();
      String password = _passwordTextFieldController.text.toString().trim();
      context.read<AuthBloc>().add(Login(email: email, password: password));
    }
  }

  void _goToRegisterPage() {
    context.go('${ScreenPaths.authPage}/${ScreenPaths.authPageRegister}');
  }
}
