import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-data.dart';
import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-description.dart';

List<ReturnPolicyData> returnPolicyData = [
  ReturnPolicyData(
    condition: "",
    description: ReturnPolicyDescription(
      picture: "",
      header: "",
      phoneNumber: "",
      terms: [""],
    ),
  )
];

// ! temp hardcore data
List<ReturnPolicyData> returnPolicyTempData = [
  ReturnPolicyData(
    condition: "افلاین",
    description: ReturnPolicyDescription(
      picture:
          "https://makkahmobiles.com/wp-content/uploads/2020/09/stencil.ghost-blog-3-1536x754.jpg",
      header:
          "مشتری گرامی ضمن سپاس از حسن انتخاب شما، شرایط و ضوابط تعویض و مرجوع اجناس خریداری شده در شعب جین وست به شرح زیر می باشد:",
      phoneNumber: "02191070544",
      terms: [
        "توصیه می گردد کاپشن های دارای پر و الیاف، توسط خشکشویی های معتبر شستشو شوند",
        "تعویض کالا بدون عودت وجه، تا 30 روز از تاریخ فاکتور، حداکثر 2 بار پس از خرید و با قیمت روز تعویض، صورت می پذیرد",
        "کالا و یا بسته پروموشنی (فروش ویژه)، تا پایان روز خرید و فقط در همان شعبه خریداری شده پس گرفته می­شود و وجه آن حداکثر 3 روز کاری به غیر از جمعه واریز می‌گردد",
      ],
    ),
  ),
  ReturnPolicyData(
    condition: "آنلاین",
    description: ReturnPolicyDescription(
      picture:
          "https://makkahmobiles.com/wp-content/uploads/2020/09/stencil.ghost-blog-3-1536x754.jpg",
      header:
          "مشتری گرامی ضمن سپاس از حسن انتخاب شما، شرایط و ضوابط تعویض و مرجوع اجناس خریداری شده در شعب جین وست به شرح زیر می باشد:",
      phoneNumber: "02191070544",
      terms: [
        "توصیه می گردد کاپشن های دارای پر و الیاف، توسط خشکشویی های معتبر شستشو شوند",
        "تعویض کالا بدون عودت وجه، تا 30 روز از تاریخ فاکتور، حداکثر 2 بار پس از خرید و با قیمت روز تعویض، صورت می پذیرد",
        "کالا و یا بسته پروموشنی (فروش ویژه)، تا پایان روز خرید و فقط در همان شعبه خریداری شده پس گرفته می­شود و وجه آن حداکثر 3 روز کاری به غیر از جمعه واریز می‌گردد",
      ],
    ),
  ),
];
