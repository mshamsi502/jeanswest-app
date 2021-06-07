import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';

class ProductUniqueReqBody {
  OperationInt color;
  OperationInt style;
  //
  Map<String, dynamic> map;

  ProductUniqueReqBody({
    this.color,
    this.style,
  }) {
    this.map = {};
    if (color != null) map["color"] = color.map;
    if (style != null) map["style"] = style.map;
    // print("mapppp created id : $map");
  }
}
