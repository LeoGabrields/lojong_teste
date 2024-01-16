import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/styles/colors_app.dart';
import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';

class ShowLoadingWidget extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final Widget child;
  final void Function()? onPressed;

  const ShowLoadingWidget({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: context.colors.primary,
        ),
      );
    }
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
                    onPressed: onPressed,
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
