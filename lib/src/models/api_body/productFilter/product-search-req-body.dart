import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';

class ProductSearchReqBody {
  OperationString keyword;
  //
  Map<String, dynamic> map;

  ProductSearchReqBody({
    this.keyword,
  }) {
    this.map = {};
    if (keyword != null) map["keyword"] = keyword.map;
    // print("mapppp created id : $map");
  }
}
