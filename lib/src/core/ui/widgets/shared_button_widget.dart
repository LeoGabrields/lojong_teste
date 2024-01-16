import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';

class SharedButtonWidget extends StatelessWidget {
  const SharedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFECECEC),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        minimumSize: const Size(122, 35),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.share,
            size: 16,
            color: Color(0xFF80848F),
          ),
          const SizedBox(width: 10),
          Text(
            'Compartilhar',
            style: context.textStyles.textTitle.copyWith(
              fontSize: 12.4,
              color: const Color(0xFF80848F),
            ),
          ),
        ],
      ),
    );
  }
}
