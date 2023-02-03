import 'package:classroom/core/utils/box.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/login_page.dart';
import 'package:classroom/ui/home/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCheckPage extends StatelessWidget {
  const AuthCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: isUserLoggedIn ? const LoadingPage() : const LoginPage(),
    );
  }
}
