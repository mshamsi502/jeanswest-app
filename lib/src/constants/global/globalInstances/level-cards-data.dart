import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';

List<SingleLevelCard> levelCardsData = [
  SingleLevelCard(
    id: '',
    active: false,
    title: "",
    engTitle: "",
    perTitle: "",
    image: "",
    membership: "",
    minPay: 0,
    maxPay: 0,
    text: "",
    percent: 0,
    receiptConditions: "",
    subTitles: [""],
    descriptions: [""],
  ),
];

// ! temp hardcore data
List<SingleLevelCard> levelCardsTempData = [
  SingleLevelCard(
    id: 'blue-level-id',
    active: true,
    title: "blueCardInfo",
    engTitle: "Blue",
    perTitle: "کارت عضویت آبی",
    image: "https://jeanswest.club/public/carts/Blue.svg",
    membership: "Membership",
    minPay: 200000,
    maxPay: 1500000,
    text: "کارت عضویت آبی جین وست شامل سه سطح است که بصورت زیر ارائه می گردد:",
    percent: 8,
    receiptConditions: "اعطای Blue Card در اولین فاکتور بالای ۲۰۰ هزار تومان",
    subTitles: [
      "دریافت ۸% خرید به‌عنوان اعتبار",
      "معتبر تا پایان فصل آینده",
      "دریافت هدیه در مناسبت‌ها",
      ""
    ],
    descriptions: [
      "دریافت ۸ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی",
      "",
      "دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)",
      ""
    ],
  ),
  SingleLevelCard(
    id: 'blue+-level-id',
    active: true,
    title: "bluePlusCardInfo",
    engTitle: "Blue +",
    perTitle: "+ کارت عضویت آبی",
    image: "https://jeanswest.club/public/carts/Blue.svg",
    membership: "Membership",
    minPay: 1500000,
    maxPay: 3000000,
    text: "کارت عضویت آبی جین وست شامل سه سطح است که بصورت زیر ارائه می گردد:",
    percent: 10,
    receiptConditions: "دستیابی به سطح Blue+ با مجموعه خرید ۱,۵۰۰,۰۰۰ تومان",
    subTitles: [
      "دریافت 10% خرید به‌عنوان اعتبار",
      "معتبر تا پایان فصل آینده",
      "دریافت هدیه در مناسبت‌ها",
      ""
    ],
    descriptions: [
      "دریافت ۱۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی",
      "",
      "دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)",
      ""
    ],
  ),
  SingleLevelCard(
    id: 'blue2+-level-id',
    active: true,
    title: "blue2PlusCardInfo",
    engTitle: "Blue 2+",
    perTitle: "+2 کارت عضویت آبی",
    image: "https://jeanswest.club/public/carts/Blue.svg",
    membership: "Membership",
    minPay: 1500000,
    maxPay: 3000000,
    text: "کارت عضویت آبی جین وست شامل سه سطح است که بصورت زیر ارائه می گردد:",
    percent: 10,
    receiptConditions: "دستیابی به سطح Blue+ با مجموعه خرید ۱,۵۰۰,۰۰۰ تومان",
    subTitles: [
      "دریافت 10% خرید به‌عنوان اعتبار",
      "معتبر تا پایان فصل آینده",
      "دریافت هدیه در مناسبت‌ها",
      ""
    ],
    descriptions: [
      "دریافت ۱۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی",
      "",
      "دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)",
      ""
    ],
  ),
  SingleLevelCard(
    id: "silver-level-id",
    active: true,
    title: "silverCardInfo",
    engTitle: "Silver",
    perTitle: "کارت عضویت نقره ای",
    image: "https://jeanswest.club/public/carts/Silver.svg",
    membership: "VIP",
    minPay: 5000000,
    maxPay: 15000000,
    text:
        "کارت عضویت نقره ای جین وست پس از دریافت کارت آبی به مشتری جین وست اعطا می گردد و دارای شرایط زیر است.",
    percent: 15,
    receiptConditions: "دریافت Silver Card با مجموعه خرید ۵,۰۰۰,۰۰۰ تومان",
    subTitles: [
      "دریافت 15% خرید به‌عنوان اعتبار",
      "معتبر تا پایان فصل آینده",
      "دریافت هدیه VIP در مناسبت‌ها",
      "بالاترین اولویت در اطلاع رسانی"
    ],
    descriptions: [
      "دریافت ۱۵ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی",
      "",
      "دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit)",
      "بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش"
    ],
  ),
  SingleLevelCard(
    id: "gold-level-id",
    active: true,
    title: "goldCardInfo",
    engTitle: "Gold",
    perTitle: "کارت عضویت طلایی",
    image: "https://jeanswest.club/public/carts/Gold.svg",
    membership: "VIP",
    minPay: 15000000,
    maxPay: null,
    text:
        "کارت عضویت طلایی جین وست پس از دریافت کارت نقره ای به مشتری جین وست اعطا می گردد و دارای شرایط زیر است",
    percent: 20,
    receiptConditions: "دریافتدریافت GOLD CARD با مجموع خرید ۱۵,۰۰۰,۰۰۰ تومان",
    subTitles: [
      "دریافت 20% خرید به‌عنوان اعتبار",
      "معتبر تا پایان فصل آینده",
      "دریافت هدیه VIP در مناسبت‌ها",
      "بالاترین اولویت در اطلاع رسانی"
    ],
    descriptions: [
      "دریافت 20 درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی",
      "",
      "دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit)",
      "بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش"
    ],
  ),
];

SingleLevelCard zeroLevelCard = SingleLevelCard(
  id: 'zero-level-id',
  active: true,
  title: "",
  engTitle: "",
  perTitle: "",
  image: "",
  membership: "",
  minPay: 0,
  maxPay: 200000,
  text: "",
  percent: 0,
  receiptConditions: "",
  subTitles: [""],
  descriptions: [""],
);
