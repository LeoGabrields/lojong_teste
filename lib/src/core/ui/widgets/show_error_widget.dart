import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';

class ShowErrorWidget extends StatelessWidget {
  final bool hasError;
  final Widget child;

  const ShowErrorWidget({
    super.key,
    required this.hasError,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return hasError
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OPS!',
                    style: context.textStyles.textTitle
                        .copyWith(color: const Color(0xFF80848F), fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 15,
                      color: const Color(0xFF80848F),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFECECEC),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Recarregar',
                      style: context.textStyles.textSemiBold.copyWith(
                        color: const Color(0xFF80848F),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : child;
  }
}
