import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/core/utils/network_utils.dart';

class HasConnectionWidget extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  const HasConnectionWidget({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkUtils.checkInternetConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data != true) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OPS!',
                    style: context.textStyles.textTitle.copyWith(
                      fontSize: 15,
                      color: const Color(0xFF80848F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
                    textAlign: TextAlign.center,
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 15,
                      color: const Color(0xFF80848F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFECECEC),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      'Recarregar',
                      style: context.textStyles.textSemiBold.copyWith(
                        color: const Color(0xFF80848F),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}
