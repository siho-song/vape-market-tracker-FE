import 'package:flutter/material.dart';
import 'package:pickdam/core/theme/app_text_styles.dart';
import '../header_link.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final links = ['로그인', '회원가입', '고객센터'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(links.length * 2 - 1, (i) {
        if (i.isEven) {
          return HeaderLink(
            label: links[i ~/ 2],
          );
        } else {
          return Text(
            '  |  ',
            style: AppTextStyles.topMenuDividerStyle,
          );
        }
      }),
    );
  }
}