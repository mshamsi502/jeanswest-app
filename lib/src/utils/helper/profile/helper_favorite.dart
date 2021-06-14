// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_response/productRes/list-of-products-data.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimodeSubDetails/banimode-size-product-res.dart';

List<bool> createColorIsActive(
  ListOfProductsData productDetail,
) {
  // ignore: deprecated_member_use
  List<bool> productIsActive = List<bool>();
  for (int i = 0; i < productDetail.result.length; i++) {
    bool isBreak = false;
    for (int s = 0;
        s < productDetail.result[i].banimodeDetails.size.length;
        s++) {
      if (productDetail.result[i].banimodeDetails.size[s].quantity != 0)
        isBreak = true;
      if (isBreak) break;
    }
    if (isBreak) {
      productIsActive.add(true);
    } else
      productIsActive.add(false);
  }
  return productIsActive;
}

int createSelectedSize(
  List<BanimodeSizeProductRes> sizes,
) {
  int selectedSize = -1;
  for (int i = 0; i < sizes.length; i++) {
    bool sizeHasSelected = false;
    if (sizes[i].quantity != 0) {
      selectedSize = i;
      sizeHasSelected = true;
    }
    if (sizeHasSelected)
      break;
    else
      selectedSize = -1;
  }
  return selectedSize;
}
