import 'package:nvidia_store_app_design/data/entity/nvidia_class.dart';
import 'package:nvidia_store_app_design/ui/product/language/language_item.dart';

class NvidiaData {
  List<NvidiaClass> nvidiaList() {
    var nvidiaList = <NvidiaClass>[];
    var n1 = NvidiaClass(id: 1, name: LanguageItem().rtx3050, price: _Price().rtx3050, image: _ImagePath.rtx3050);
    var n2 = NvidiaClass(id: 2, name: LanguageItem().rtx3090, price: _Price().rtx3090, image: _ImagePath.rtx3090);
    var n3 = NvidiaClass(id: 3, name: LanguageItem().rtx4050, price: _Price().rtx4050, image: _ImagePath.rtx4050);
    var n4 = NvidiaClass(id: 4, name: LanguageItem().rtx4070, price: _Price().rtx4070, image: _ImagePath.rtx4070);
    var n5 = NvidiaClass(id: 5, name: LanguageItem().rtx4090, price: _Price().rtx4090, image: _ImagePath.rtx4090);

    nvidiaList.add(n1);
    nvidiaList.add(n2);
    nvidiaList.add(n3);
    nvidiaList.add(n4);
    nvidiaList.add(n5);

    return nvidiaList;
  }
}

class _Price {
  final double rtx3050 = 1.278;
  final double rtx3090 = 1.478;
  final double rtx4050 = 1.879;
  final double rtx4070 = 2.129;
  final double rtx4090 = 2.478;
}

class _ImagePath {
  static const rtx3050 = "assets/png/ic_nvidia_2.png";
  static const rtx3090 = "assets/png/ic_nvidia_1.png";
  static const rtx4050 = "assets/png/ic_nvidia_5.png";
  static const rtx4070 = "assets/png/ic_nvidia_4.png";
  static const rtx4090 = "assets/png/ic_nvidia_3.png";
}
