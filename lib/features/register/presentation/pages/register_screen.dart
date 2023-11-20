import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/router.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/styles/sizes.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/auth_register_container.dart';
import '../../../shared/presentation/widgets/button_shared.dart';
import '../../../shared/presentation/widgets/email_input.dart';
import '../../../shared/presentation/widgets/name_input.dart';
import '../../../shared/presentation/widgets/password_input.dart';
import '../../../shared/presentation/widgets/text_label_shared.dart';
import '../bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextFieldController = TextEditingController();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is SignupFinished) {
            if (state.status == Status.waiting) {
              AppUtils.showLoader(context: context, message: 'Signup...');
            } else if (state.status == Status.succeded) {
              context.pop();
              context.go('/home/0');
            } else if (state.status == Status.failed) {
              context.pop();
              AppUtils.showAlert(context, state.message ?? '',
                  AppUtils.accentprimaryColor(context));
            }
          }
        },
        child: Stack(
          children: <Widget>[
            AppUtils.firstPosition(context),
            AppUtils.secondPosition(context, "Register"),
            AppUtils.thirdPosition(context),
            Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    AuthRegisterContainer(
                      children: [
                        NameInput(
                            nameTextFieldController: _nameTextFieldController),
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
                        text: "SIGNUP",
                        colorButton: AppColors.primaryColor,
                        onClick: _doRegister,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextLabelShared(
                            colorTextLabel:
                                AppUtils.onprimarygreyColor(context),
                            labelText: "ALREADY HAVE ON ACCOUNT ? ",
                            sizeLabelText: AppSizes.meduimText,
                            fontLabelText: FontWeight.w500,
                            onClick: () {}),
                        TextLabelShared(
                            colorTextLabel:
                                AppUtils.accentprimaryColor(context),
                            labelText: " LOGIN",
                            sizeLabelText: AppSizes.meduimText,
                            fontLabelText: FontWeight.w700,
                            onClick: _goToLoginPage),
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

  void _doRegister() {
    if (_formKey.currentState!.validate()) {
      String email = _emailTextFieldController.text.toString().trim();
      String name = _nameTextFieldController.text.toString().trim();
      String password = _passwordTextFieldController.text.toString().trim();

      context
          .read<RegisterBloc>()
          .add(Signup(name: name, email: email, password: password));
    }
  }

  void _goToLoginPage() {
    context.go(ScreenPaths.authPage);
  }
}
