import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../domain/entities/author_entity.dart';
import '../bloc/shared_bloc.dart';

class InfoUser extends StatefulWidget {
  final int idUser;
  final String type;

  const InfoUser({super.key, required this.idUser, required this.type});

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  bool isLoading = true;
  String? email;
  AuthorEntity? _authorResponseEntity;

  @override
  void initState() {
    super.initState();
    AppUtils.valueUserAuthorId().then((value) {
      if (widget.type == 'profil' || widget.idUser == value) {
        AppUtils.valueUserAuthorEmail().then((res) {
          setState(() {
            email = res ?? '';
          });
        });
      }
    });

    context.read<SharedBloc>().add(GetInfoUser(userId: widget.idUser));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SharedBloc, SharedState>(
      listener: (context, state) {
        if (state is GetUserFinished) {
          if (state.status == Status.waiting) {
            setState(() {
              isLoading = true;
            });
          } else if (state.status == Status.succeded) {
            setState(() {
              isLoading = false;
              _authorResponseEntity = state.authorResponseEntity;
            });
          } else if (state.status == Status.failed) {
            setState(() {
              isLoading = false;
            });
            AppUtils.showAlert(
                context, state.message ?? 'Erreur de connexion', AppColors.errorColor);
          }
        }
      },
      child: Skeletonizer(
        enabled: isLoading ? true : false,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppUtils.accentprimaryColor(context),
                child: Text(
                  AppUtils.generateAcronym(
                      _authorResponseEntity?.name ?? "Anonym"),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _authorResponseEntity?.name ?? "Anonym",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (email != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mail_rounded,
                      color: AppColors.greyColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      email!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
