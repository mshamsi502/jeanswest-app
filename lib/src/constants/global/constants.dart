// // Project: JeansWest App
// // Created by: Koorosh Karimnia
// // Email: KooroshKarimnia@gmail.com
// // Date: 2020-09-13
// // Time: 11:56 AM
//
//
import 'dart:ui';

const String TOKEN = 'token';
const String BASE_URL_FOR_BRANCH_ADDRESS = 'https://jeanswest.club';
const Color MAIN_BLUE_COLOR = Color(0xff2c3d73);
const TextDirection rtlTextDirection = TextDirection.rtl;
const TextDirection ltrTextDirection = TextDirection.ltr;

// //
// List<Branch> localBranches = new List<Branch>();
//
bool isInit = true;
// GoogleMapWidget myGoogleMapWidget;
//
// /// for Test
// //
// Branch disableBranch = new Branch(
//   departmentInfoID: '123',
//   depName: 'شعبه تست غیرفعال',
//   depAddress: 'وقتی غیر فعاله آدرس واسه چی میخوای؟! ...',
//   depTel: '021000000',
//   isActive: 0,
//   locationPoint: '35.753539,51.335078',
//   lat: '35.758539',
//   lng: '51.331078',
//   distance: 459235,
//   distanceDesc: '459.2 کیلومتر از شما فاصله دارد.',
//   workTime: 'همه روزه از 10 تا 22',
// );
//
// Branch banimodeLocation = new Branch(
//   departmentInfoID: '1113',
//   depName: 'فروشگاه انلاین بانی مد',
//   depAddress:
//       'تهران - جنت آباد مرکزی - خیابان دانش - خیابان عابدی - خیابان شهید محمد نوروزی - پلاک 5',
//   depTel: '02191070544',
//   isActive: 1,
//   locationPoint: '35.753539,51.335078',
//   lat: '35.7536',
//   lng: '51.3051',
//   distance: 459235,
//   distanceDesc: '459.2 کیلومتر از شما فاصله دارد.',
//   workTime: 'همه روزه از 10 تا 22',
// );
//
// const String longLoremIpsum =
//     'آرامش خاطر مشتریان از خرید خود از مهمترین اولویت‌های فروشگاه اینترنتی بانی مد می‌باشد. در همین راستا بانی مد تمام تلاش خود را بکار گرفته تا اطلاعات دقیقی از محصولات در سایت قرار داده شود تا مشتریان بتوانند با آگاهی کامل اقدام به خرید نمایند. با وجود این ممکن است مشتریان محترم پس از خرید قصد بازگشت و یا تعویض کالای خریداری شده را داشته باشند که در این راستا بانی مد ضمانت 7 روزه جهت بازگرداندن کالا را در اختیار مشتریان خود قرار می دهد که محاسبه این بازه به این صورت است : 7 روز از زمان تحویل کالا به مشتری تا اخذ محصول ارجاعی توسط بانی مد.';
//
// const String medLoremIpsum =
//     'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت';
// const String shortLoremIpsum1 =
//     'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است،';
// const String shortLoremIpsum2 =
//     'پس چنان چه قصد تعویض دارید، در حداقل زمان ممکن پس از دریافت کالا اقدام نمایید تا این روال بدون هیچ گونه مشکلی، برای شما انجام شود.';
// const String veryShortLoremIpsum = 'لورم ایپسوم متن ساختگی؟';
//
// const List<String> questionStrings = [
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
//   veryShortLoremIpsum,
// ];
// const List<String> answerStrings = [
//   shortLoremIpsum1,
//   shortLoremIpsum2,
//   medLoremIpsum,
//   veryShortLoremIpsum,
//   shortLoremIpsum1,
//   shortLoremIpsum2,
//   longLoremIpsum,
//   shortLoremIpsum2,
//   shortLoremIpsum1,
//   shortLoremIpsum2,
// ];
//
// User user = new User(
//   perName: ' جواد خواجوی',
//   engName: 'Javad khaajavi',
//   email: 'javadPalang70@gmail.com',
//   phoneNumber: '09337324560',
//   gender: male,
//   dayOfBirth: '24',
//   monthOfBirth: '07',
//   yearOfBirth: '1375',
// );
// User firstFriend = new User(
//   perName: 'نسترن صالحی',
//   engName: 'Nastaran Salehi',
//   email: 'nasiisal1372@gmail.com',
//   phoneNumber: '09102524463',
//   gender: female,
//   dayOfBirth: '14',
//   monthOfBirth: '11',
//   yearOfBirth: '1372',
// );
// User secondFriend = new User(
//   perName: 'نصرت جوادی',
//   engName: 'Nosrat Javadi',
//   email: 'nosraaati0@gmail.com',
//   phoneNumber: '0984576328',
//   gender: other,
//   dayOfBirth: '05',
//   monthOfBirth: '08',
//   yearOfBirth: '1359',
// );
// User thirdFriend = new User(
//   perName: 'پگاه ایزدی',
//   engName: 'Pegah Izadi',
//   email: 'callmemaryam0@gmail.com',
//   phoneNumber: '09027800647',
//   gender: female,
//   dayOfBirth: '23',
//   monthOfBirth: '06',
//   yearOfBirth: '1378',
// );
// User fourthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User fifthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User sixthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User seventhFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User eighthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User ninthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// User tenthFriend = new User(
//   perName: 'احمد زمانی',
//   engName: 'Ahmad Zamani',
//   email: 'AhmoodZaman@gmail.com',
//   phoneNumber: '09215749631',
//   gender: male,
//   dayOfBirth: '03',
//   monthOfBirth: '12',
//   yearOfBirth: '1365',
// );
// List<User> friends = [
//   firstFriend,
//   secondFriend,
//   thirdFriend,
//   fourthFriend,
//   fifthFriend,
//   sixthFriend,
//   seventhFriend,
//   eighthFriend,
//   ninthFriend,
//   tenthFriend,
// ];
// //
// //
// Coupon firstCoupon = new Coupon(
//   title: 'بن هدیه کلکسیون پاییزه 2020',
//   conditions: [
//     'قابل استفاده برای خرید های بیش از 200000 تومان',
//     'قابل استفاده برای خرید حضوری از فروشگاه های جین وست',
//   ],
//   price: '100000',
//   startDay: '12',
//   startMonth: '07',
//   startYear: '99',
//   endDay: '30',
//   endMonth: '07',
//   endYear: '99',
// );
// Coupon secondCoupon = new Coupon(
//   title: 'بن هدیه خرید کفش',
//   conditions: [
//     'قابل استفاده برای خرید های بیش از 500000 تومان',
//     'قابل استفاده برای خرید از دسته بندی کفش',
//     'قابل استفاده برای خرید حضوری از فروشگاه های جین وست',
//   ],
//   price: '250000',
//   startDay: '12',
//   startMonth: '07',
//   startYear: '99',
//   endDay: '30',
//   endMonth: '07',
//   endYear: '99',
// );
// Coupon thirdCoupon = new Coupon(
//   title: 'بن هدیه برای خرید های بالای 3000000 تومان',
//   conditions: [
//     'قابل استفاده برای خرید های بیش از 3000000 تومان',
//     'قابل استفاده برای خرید هدیه (از دسته بندی زنانه و بچگانه) ',
//     'قابل استفاده در خرید از فروشگاه های جین وست و فروشگاه ایترنتی بانی مد',
//     'قابل استفاده در سبد کالایی که دارای حداقل یک کالا با برند جین وست باشد',
//   ],
//   price: '1000000',
//   startDay: '01',
//   startMonth: '09',
//   startYear: '99',
//   endDay: '29',
//   endMonth: '12',
//   endYear: '99',
// );
// Coupon fourthCoupon = new Coupon(
//   title: 'بن هدیه کلکسیون پاییزه 2020',
//   conditions: [
//     'قابل استفاده برای خرید های بیش از 200000 تومان',
//     'قابل استفاده برای خرید حضوری از فروشگاه های جین وست',
//   ],
//   price: '100000',
//   startDay: '12',
//   startMonth: '07',
//   startYear: '99',
//   endDay: '30',
//   endMonth: '07',
//   endYear: '99',
// );
//
// List<Coupon> myCoupons = [
//   firstCoupon,
//   secondCoupon,
//   thirdCoupon,
//   fourthCoupon,
// ];
// //
// //
// UserAddress firstAddress = new UserAddress(
//   name: user.perName,
//   mobilePhoneNumber: user.phoneNumber,
//   homePhoneNumber: '021443147209',
//   stateAddress: 'تهران',
//   cityAddress: 'تهران',
//   blockAddress: 'منطقه 5 - پونک',
//   postCode: '1469615475',
//   postAddress:
//       'بلوار اشرفی اصفهانی - خیابان طباطبایی - ساختمان رویال - واحد ۲۱',
//   titleAddress: 'آدرس اول',
//   explain: ' خودم - دفتر اشرفی',
// );
// UserAddress secondAddress = new UserAddress(
//   name: user.perName,
//   mobilePhoneNumber: user.phoneNumber,
//   homePhoneNumber: '021443147209',
//   stateAddress: 'تهران',
//   cityAddress: 'تهران',
//   blockAddress: 'منطه 5 - پونک',
//   postCode: '1469615475',
//   postAddress: 'بلوار سردار جنگل - کوچه شقایق - پلاک 5124',
//   titleAddress: 'آدرس دوم',
//   explain: ' خودم - خونه شقایق',
// );
// UserAddress thirdAddress = new UserAddress(
//   name: firstFriend.perName,
//   mobilePhoneNumber: firstFriend.phoneNumber,
//   stateAddress: 'تهران',
//   cityAddress: 'تهران',
//   blockAddress: 'منطقه 5 - پونک',
//   postCode: '1469615475',
//   postAddress:
//       'بلوار اشرفی اصفهانی - خیابان طباطبایی - ساختمان رویال - واحد ۲۱',
// );
// List<UserAddress> myAddresses = [
//   firstAddress,
//   secondAddress,
//   thirdAddress,
//   firstAddress,
// ];
// UserAddress selectedAddress;
// //
// //
// Product firstFav = new Product(
//   name: 'سویشرت زنانه جین وست Jeanswest کد 94271502',
//   code: '94271502',
//   brand: 'Jeanswest',
//   assets: 'assets/images/product/firstFav.png',
//   discountedPrice: '699000',
//   orgPrice: '999000',
//   color: 'بنفش روشن',
//   colorCode: Color(0xffe8a1cb),
//   size: 'S',
//   attributes: [
//     'جنس الیاف: 62% پلی استر، 34% نخ پنبه، 4% اسپندکس',
//     'نرمی و زبری: نرم',
//     'جزئیات مدل: یقه، سرآستین و پایین لباس کشبافت است، تایپوگرافی روی سینه، داخل لباس حالت کرکی دارد.',
//     'قد لباس: برای S، حدودا 55 سانتی متر',
//   ],
// );
// Product secondFav = new Product(
//   name: 'سویشرت زنانه جین وست Jeanswest کد 94271502',
//   code: '94271502',
//   brand: 'Jeanswest',
//   assets: 'assets/images/product/secondFav.png',
//   discountedPrice: '699000',
//   orgPrice: '999000',
//   color: 'سرمه ای',
//   colorCode: Color(0xff151c36),
//   size: 'S',
//   attributes: [
//     'جنس الیاف: 62% پلی استر، 34% نخ پنبه، 4% اسپندکس',
//     'نرمی و زبری: نرم',
//     'جزئیات مدل: یقه، سرآستین و پایین لباس کشبافت است، تایپوگرافی روی سینه، داخل لباس حالت کرکی دارد.',
//     'قد لباس: برای S، حدودا 55 سانتی متر',
//   ],
// );
// Product thirdFav = new Product(
//   name:
//       'ادوپرفیوم مردانه ماسیو موتو Massio Motto مدل Interlue Amouage حجم 60 میلی لیتر',
//   code: '96154282',
//   brand: 'Massio Motto',
//   assets: 'assets/images/product/thirdFav.png',
//   discountedPrice: '1400000',
//   orgPrice: '1400000',
//   color: 'قهوه ای',
//   colorCode: Color(0xffd8791f),
//   size: '60ml',
//   attributes: [
//     'ادوپرفیوم زنانه: مدل Interlue Amouage',
//     'نت ابتدایی: آلو سیاه، ماندارین، برگاموت، فریزیا',
//     'نت میانی: اوسمانتوس، آرتمیسیا، نرولی، رز',
//     'نت پایانی: آمبروکسان، پاتچولی، وانیل، نت های چوبی',
//     'درصد عطر: 15 تا 20 درصد',
//     'ماندگاری: 4 تا 5 ساعت',
//     'پخش بو: این عطر طبق نظر خریداران دارای پخش بوی خوبی است.',
//     'بهترین زمان استفاده: طول روز',
//   ],
// );
// Product fourthFav = new Product(
//   name: 'سویشرت زنانه جوتی جینز JootiJeans کد 04722102',
//   code: '04722102',
//   brand: 'JootiJeans by Jeanswest',
//   assets: 'assets/images/product/fourthFav.png',
//   discountedPrice: '799000',
//   orgPrice: '999000',
//   color: 'صورتی',
//   colorCode: Color(0xffe3aaa9),
//   size: 'M',
//   attributes: [
//     'نرمی و زبری: نرم',
//     'جیب: دارای دو جیب عمودی در جلو لباس',
//     'جزئیات مدل: نواردوزی در لبه سرآستین و پایین لباس',
//     'قد لباس: برای سایز S، حدودا 58 سانتی متر',
//   ],
// );
// Product fifthFav = new Product(
//   name: 'ساعت مچی مردانه رویال لندن Royal London مدل RL-41400-03',
//   code: '67412526',
//   brand: 'Royal London',
//   assets: 'assets/images/product/fifthFav.png',
//   discountedPrice: '10550000',
//   orgPrice: '10550000',
//   color: 'قهوه ای سوخته',
//   colorCode: Color(0xff867a67),
//   size: 'تک سایز',
//   attributes: [
//     'ساعت مردانه رویال لندن : با استایل رسمی و کژوال',
//     'نوع موتور : مکانیکی اتوماتیکی',
//     'منبع انرژی : حرکتی',
//     'جنس شیشه : معدنی',
//     'جنس و رنگ قاب : استیل ضد زنگ، طلایی',
//     'رنگ صفحه و فرم اعداد : نقره ای با اعداد لاتین و به شکل خط',
//     'جنس و طرح  بند : چرم، پوست ماری',
//     'نوع قفل : سگکی',
//     'رنگ بند : قهوه ای سوخته',
//     'کاربرد : مجلسی و روزمره',
//   ],
// );
// Product sixthFav = new Product(
//   name: 'کاپشن کلاه دار دخترانه جین وست Jeanswest کد 94623805',
//   code: '94623805',
//   brand: 'Jeanswest',
//   assets: 'assets/images/product/sixthFav.png',
//   discountedPrice: '2339000',
//   orgPrice: '2999000',
//   color: 'زرد',
//   colorCode: Color(0xfff2b135),
//   size: '5-6 سال',
//   attributes: [
//     'جنس الیاف آستر: 100% پلی استر',
//     'عایق حرارتی: کرک و پر 80%',
//     'نرمی و زبری: نرم',
//     'جیب: دو جیب مورب در جلو',
//     'جزئیات مدل: کلاه متصل بدون بند قابل تنظیم، خز در تمام قسمت های داخلی لباس، نواردوزی در کناره های لباس که روی آن 3 دکمه قرار دارد، تایپوگرافی چاپی روی سینه، یوک افقی در لباس، سرآستین کشبافت، جلو لباس کمی کوتاه تر از پشت آن است.',
//     'قد پشت لباس: برای سایز 150 (10-9 سال)، حدودا 68 سانتی متر',
//   ],
// );
// List<Product> myFavorites = [
//   firstFav,
//   secondFav,
//   thirdFav,
//   fourthFav,
//   fifthFav,
//   sixthFav,
//   firstFav,
//   firstFav,
// ];
// //
// //
// Order firstOrder = new Order(
//   code: 'B54008832',
//   receiverName: user.perName,
//   phoneNumber: '09337324560',
//   products: [
//     firstFav,
//     secondFav,
//     thirdFav,
//   ],
//   countProducts: [1, 1, 1],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: firstAddress.postAddress,
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '',
// );
// Order secondOrder = new Order(
//   code: 'B54025644',
//   receiverName: friends[1].perName,
//   phoneNumber: '09176509634',
//   products: [
//     secondFav,
//     thirdFav,
//     sixthFav,
//   ],
//   countProducts: [3, 2, 3],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '09',
//     minuteOfDate: '48',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '16',
//     startHourOfDate: '12',
//     endHourOfDate: '15',
//     perExplain: 'سه شنبه 16 اردیبهشت',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '10',
//     minuteOfDate: '08',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   address: secondAddress.postAddress,
//   trackingCode: '654724686314728865',
//   paymentPlan: 'نقدی - درب منزل',
//   paymentTrackingCode: '',
//   sendPrice: '15000',
// );
// Order thirdOrder = new Order(
//   code: 'B54081235',
//   receiverName: user.perName,
//   phoneNumber: '09337324560',
//   products: [
//     sixthFav,
//     secondFav,
//     thirdFav,
//     fifthFav,
//     firstFav,
//   ],
//   countProducts: [1, 1, 1, 1, 3],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: thirdAddress.postAddress,
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '15000',
// );
// Order fourthOrder = new Order(
//   code: 'B54008832',
//   receiverName: user.perName,
//   phoneNumber: '09337324560',
//   products: [
//     firstFav,
//     sixthFav,
//   ],
//   countProducts: [3, 4],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: firstAddress.postAddress,
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '15000',
// );
// List<Order> inProgressOrders = [
//   firstOrder,
//   secondOrder,
//   thirdOrder,
//   fourthOrder,
// ];
// List<Order> endedOrders = [
//   thirdOrder,
//   fourthOrder,
//   secondOrder,
// ];
