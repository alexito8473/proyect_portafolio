import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_porfolio/ui/widgets/technology_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

class TechnologyWidget extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final List<Technology> listTechnology;
  final Duration durationAnimation;
  const TechnologyWidget(
      {super.key,
      required this.size,
      required this.spaceFinal,
      required this.listTechnology,
      required this.durationAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: EdgeInsets.only(top: size.height * 0.05),
        width: spaceFinal,
        duration: durationAnimation,
        child: Column(
          children: [
            AnimatedContainer(
                width: spaceFinal,
                duration: durationAnimation,
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(AppLocalizations.of(context)!.technologies,
                    style: const TextStyle(fontSize: 40))),
            Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0, // Espacio horizontal entre los elementos
              runSpacing: 70.0, // Espacio vertical entre las filas
              children: listTechnology.map((item) {
                return TechnologyView(
                  size: size,
                  technology: item,
                );
              }).toList(),
            )
          ],
        ));
  }
}
