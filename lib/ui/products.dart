import 'package:flutter/material.dart';
import 'package:nvidia_store_app_design/data/entity/nvidia_class.dart';
import 'package:nvidia_store_app_design/data/entity/nvidia_data.dart';
import 'package:nvidia_store_app_design/ui/core/project_colors.dart';
import 'package:nvidia_store_app_design/ui/core/project_padding.dart';
import 'package:nvidia_store_app_design/ui/detail_view.dart';
import 'package:nvidia_store_app_design/ui/product/language/language_item.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<List<NvidiaClass>> loadProduct() async {
    return NvidiaData().nvidiaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.blackColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            LanguageItem().nvidiaStore,
            style: const TextStyle(color: ProjectColors.whiteColor),
          ),
        ),
        body: FutureBuilder<List<NvidiaClass>>(
          future: loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var nvidiaList = snapshot.data;
              //yan yana 2 kart olacak şekilde aşağıa doğru listeleme
              return GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.8),
                itemCount: nvidiaList!.length,
                itemBuilder: (context, index) {
                  var product = nvidiaList[index];
                  return InkWell(
                      onTap: () {
                        NavigateManager().naigateToWidget(context, DetailView(nvidiaClass: product));
                      },
                      child: _CardsNvidiaProducts(product: product));
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

class NavigateManager {
  void naigateToWidget(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}

class _CardsNvidiaProducts extends StatelessWidget {
  const _CardsNvidiaProducts({
    super.key,
    required this.product,
  });

  final NvidiaClass product;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ProjectColors.rgbCGreenColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(product.image),
          Padding(
            padding: ProjectPadding.paddingAllTwo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textNvidiaName(context),
                Padding(
                  padding: ProjectPadding.padingOnlyTop10,
                  child: Row(
                    children: [
                      _textNvidiaPrice(context),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: ProjectColors.blackColor,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }

  Text _textNvidiaPrice(BuildContext context) {
    return Text(
      '${product.price} \$ ',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //color: ProjectColors.whiteColor,
            fontSize: _FontSize().fontSizePrice,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Text _textNvidiaName(BuildContext context) {
    return Text(
      product.name,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ProjectColors.whiteColor,
            fontSize: _FontSize().fontSizeName,
          ),
    );
  }
}

class _FontSize {
  final double fontSizeName = 20.0;
  final double fontSizePrice = 23.0;
}
