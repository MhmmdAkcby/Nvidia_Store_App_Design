// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nvidia_store_app_design/data/entity/nvidia_class.dart';
import 'package:nvidia_store_app_design/ui/core/button.dart';
import 'package:nvidia_store_app_design/ui/core/project_colors.dart';
import 'package:nvidia_store_app_design/ui/core/project_padding.dart';
import 'package:nvidia_store_app_design/ui/product/language/language_item.dart';

// ignore: must_be_immutable
class DetailView extends StatefulWidget {
  NvidiaClass nvidiaClass;
  DetailView({
    Key? key,
    required this.nvidiaClass,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.blackColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ProjectColors.whiteColor),
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart, color: ProjectColors.whiteColor))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: _ProjectDouble().height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(widget.nvidiaClass.image, fit: BoxFit.cover),
              ],
            ),
          ),
          _textName(context),
          Row(
            children: [
              Padding(
                padding: _WidgetPadding.asusTextPadding,
                child: Column(
                  children: [
                    Text(
                      LanguageItem().asus,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ProjectColors.whiteColor, fontSize: _ProjectDouble().fontSize),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: _WidgetPadding.pricePadding,
            child: _priceInfo(context),
          ),
          const Spacer(),
          const _ButtonWidget()
        ],
      ),
    );
  }

  Text _priceInfo(BuildContext context) {
    return Text(
      '${widget.nvidiaClass.price} \$',
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: ProjectColors.whiteColor, fontSize: _ProjectDouble().priceTextFontSize),
    );
  }

  Row _textName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: _WidgetPadding.textNamePadding,
          child: Text(
            widget.nvidiaClass.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ProjectColors.whiteColor),
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.paddingAllTwo,
      child: Button(
        text: LanguageItem().buyNow,
        padding: ProjectPadding.edgeInsets2,
        textColor: ProjectColors.whiteColor,
        color: ProjectColors.buttonColor,
        shape: _borderRounded(),
      ),
    );
  }

  RoundedRectangleBorder _borderRounded() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_ProjectDouble().buttonRadius)));
}

void goToNextWidget(BuildContext context, Widget widget) {}

class _ProjectDouble {
  final double buttonRadius = 2.0;
  final double height = 350.0;
  final double fontSize = 22.0;
  final double priceTextFontSize = 40;
}

class _WidgetPadding {
  static const textNamePadding = EdgeInsets.only(top: 120, left: 20);
  static const asusTextPadding = EdgeInsets.only(top: 5, left: 20);
  static const pricePadding = EdgeInsets.only(top: 80);
}
