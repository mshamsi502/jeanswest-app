// // Project: JeansWest App
// // Created by: Koorosh Karimnia
// // Email: KooroshKarimnia@gmail.com
// // Date: 2020-09-13
// // Time: 11:56 AM
//
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/branch/widgets/google_map_widget.dart';

//
// //
// ignore: deprecated_member_use
List<Branch> localBranches = new List<Branch>();
//
bool isInitLoadingBranchPage = true;
GoogleMapWidget myGoogleMapWidget;
//
// /// for Test
// //
Branch disableBranch = new Branch(
  departmentInfoID: '123',
  depName: 'شعبه تست غیرفعال',
  depAddress: 'وقتی غیر فعاله آدرس واسه چی میخوای؟! ...',
  depTel: '021000000',
  isActive: 0,
  locationPoint: '35.753539,51.335078',
  lat: '35.758539',
  lng: '51.331078',
  distance: 459235,
  distanceDesc: '459.2 کیلومتر از شما فاصله دارد.',
  workTime: 'همه روزه از 10 تا 22',
);

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
