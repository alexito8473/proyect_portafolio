import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  final bool isMobile;
  const TechnologyView(
      {super.key,
      required this.size,
      required this.technology,
      required this.isMobile});

  void createFrame(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            Color background =
                state.appTheme == AppTheme.DARK ? Colors.black : Colors.white;
            return AlertDialog(
              shadowColor: state.appTheme == AppTheme.DARK
                  ? Colors.white10
                  : Colors.black12,
              content: Container(
                width: 350,
                height: isMobile ? 380 : 430,
                decoration: BoxDecoration(
                    color: background, borderRadius: BorderRadius.circular(10)),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: RadialGradient(
                            center: Alignment.topLeft,
                            radius: isMobile ? 1.4 : 1.8,
                            stops: const [
                              0.8,
                              0.8,
                              1,
                              1
                            ],
                            colors: [
                              background,
                              technology.color.withOpacity(0.5),
                              technology.color.withOpacity(0.5),
                              background,
                            ])),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(technology.urlIcon))),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      maxLines: 2,
                                      '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: AutoSizeText(
                                  maxLines: 12,
                                  technology.typeDescription
                                      .getDescription(context),
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ]))
                      ],
                    )),
              ),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              elevation: 24.0, // Controla la sombra para el efecto de elevación
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => createFrame(context),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                0.40,
                0.40,
                0.85,
                0.85
              ],
                  colors: [
                Colors.transparent,
                technology.color.withOpacity(0.8),
                technology.color.withOpacity(0.8),
                Colors.transparent,
              ])),
          width: 260,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 31),
                child: Image.asset(
                  technology.urlIcon,
                  fit: BoxFit.contain,
                  width: 75,
                  height: 70
                ),
              ),
              AutoSizeText(
                maxLines: 1,
                technology.name,
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
        )).increaseSizeOnHover(1.1);
  }
}
