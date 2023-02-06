import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webviewx/webviewx.dart';

class SocialsPage extends StatefulWidget {
  const SocialsPage({super.key});

  @override
  _SocialsPageState createState() => _SocialsPageState();
}

class _SocialsPageState extends State<SocialsPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Socials".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: WebViewX(
                    initialContent:
                        '<a class="twitter-timeline" href="https://twitter.com/GwinnettSchools?ref_src=twsrc%5Etfw">Tweets by GwinnettSchools</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>',
                    initialSourceType: SourceType.html,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
