import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/home/pages/join_socials_page.dart';
import 'package:classroom/ui/home/pages/social_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:classroom/ui/home/widgets/user_avatar.dart';

class SocialsPage extends StatefulWidget {
  const SocialsPage({Key? key}) : super(key: key);

  @override
  _SocialsPageState createState() => _SocialsPageState();
}

class _SocialsPageState extends State<SocialsPage> {
  List<String> coverUrls = [
    "assets/courses/course-1.png",
    "assets/socials/instagram.png",
    "assets/socials/twitter.png",
  ];

  String getSocialURL(String url) {
    if (url.toLowerCase().contains("instagram")) {
      return coverUrls[1];
    } else if (url.toLowerCase().contains("twitter")) {
      return coverUrls[2];
    } else {
      return coverUrls[0];
    }
  }

  String getUsername(String url) {
    List<String> urlParts = url.replaceFirst("https://", '').split("/");
    if (urlParts.length <= 1) return url;
    return "@" + urlParts[1];
  }

  @override
  Widget build(BuildContext context) {
    forceUserModelUpdate();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
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
                (getUserModel().socials.isEmpty ||
                        getUserModel().socials == [""])
                    ? Center(
                        child: Text(
                          "You have not added any socials.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: getUserModel().socials.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String social = getUserModel().socials[index];
                            return Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: () async {
                                  await Future.delayed(
                                    const Duration(milliseconds: 250),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SocialItemPage(
                                        socialURL: social,
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Hero(
                                      tag: social,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                getSocialURL(social),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getUsername(social),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Padding(
                                          //       padding: const EdgeInsets.only(
                                          //         right: 10,
                                          //       ),
                                          //       child: UserAvatar(
                                          //         userModel: getUserModel(),
                                          //         height: 32,
                                          //         width: 32,
                                          //       ),
                                          //     ),
                                          //     Text(
                                          //       social,
                                          //       style: const TextStyle(
                                          //         color: Colors.white70,
                                          //         fontSize: 16,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const JoinSocialsPage(),
                  ),
                );
              },
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
