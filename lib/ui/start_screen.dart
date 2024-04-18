import 'package:flutter/material.dart';
import 'package:nvidia_store_app_design/ui/core/button.dart';
import 'package:nvidia_store_app_design/ui/core/project_colors.dart';
import 'package:nvidia_store_app_design/ui/core/project_padding.dart';
import 'package:nvidia_store_app_design/ui/product/language/language_item.dart';
import 'package:nvidia_store_app_design/ui/products.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = "assets/png/ic_nvidia.png";
    return Scaffold(
      backgroundColor: ProjectColors.blackColor,
      body: Center(
        child: Column(children: [
          const _image(imagePath: imagePath),
          Container(
            child: Column(children: [
              const Padding(
                padding: ProjectPadding.paddingAllOne,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [_HeadlineText()],
                ),
              ),
              const _DescriptionText(),
              _buttonProperties(),
            ]),
          )
        ]),
      ),
    );
  }

  Padding _buttonProperties() {
    return Padding(
      padding: ProjectPadding.paddingOnlyTop20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Button(
            text: LanguageItem().startButtonText,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
            padding: ProjectPadding.edgeInsets,
            color: ProjectColors.buttonColor,
            textColor: ProjectColors.whiteColor,
            fontSize: FontSize().fontSize,
            goToNextWidget: const Products(),
          ),
        ],
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.paddingAllOne,
      child: Text(
        LanguageItem().startScreenDescripitons,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ProjectColors.grayColor, wordSpacing: 3),
      ),
    );
  }
}

class _HeadlineText extends StatelessWidget {
  const _HeadlineText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      LanguageItem().startScreenHeadlineScreen,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: ProjectColors.whiteColor,
          ),
    );
  }
}

class _image extends StatelessWidget {
  const _image({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}

class FontSize {
  final double fontSize = 20.0;
}
