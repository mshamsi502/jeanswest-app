import 'package:jeanswest/src/models/api_response/productRes/add-to-card-product-detail-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimodeSubDetails/banimode-image-product-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimodeSubDetails/banimode-size-product-res.dart';

AddToCardProductDetailRes addToCardProductDetailRes = AddToCardProductDetailRes(
  sizeGuid: [
    [""],
  ],
  allColorsBanimodeDetails: [
    BanimodeDetailsProductRes(
      size: [
        BanimodeSizeProductRes(
          name: "",
          active: 0,
          idSize: 0,
          position: 0,
          quantity: 0,
        ),
      ],
      images: BanimodeImageProductRes(
        cartDefault: [""],
        homeDefault: [""],
        largeDefault: [""],
        smallDefault: [""],
        mediumDefault: [""],
        thickboxDefault: [""],
        thickboxDefault2x: [""],
      ),
      idColor: 0,
      colorName: "",
      colorValue: "",
      productName: "",
      productManufacturerName: "",
      productManufacturerEnName: "",
    ),
  ],
);
//
