import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:perplexity_clone/services/chat_web_Service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullresponse =
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architector";

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullresponse = "";
      }
      setState(() {
        fullresponse += data['data'];
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perplexity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Skeletonizer(
          enabled: isLoading,
          effect: ShimmerEffect(
            baseColor: AppColors.iconGrey,
            highlightColor: AppColors.whiteColor,
            duration: Duration(seconds: 1),
          ),
          child: Markdown(
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                  codeblockDecoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  code: TextStyle(fontSize: 16),
                ),
            data: fullresponse,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
