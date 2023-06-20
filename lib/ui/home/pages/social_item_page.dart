import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class SocialItemPage extends StatefulWidget {
  const SocialItemPage({
    super.key,
    required this.socialURL,
  });
  final String socialURL;

  @override
  _SocialItemPageState createState() => _SocialItemPageState();
}

class _SocialItemPageState extends State<SocialItemPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
              )
            ],
          ),
          Expanded(
            child: WebViewX(
              initialContent: widget.socialURL,
              initialSourceType: SourceType.url,
              height: double.infinity,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
