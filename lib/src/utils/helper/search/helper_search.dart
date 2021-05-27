// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/arabic_to_persian.dart';

/// => ،this method of search get a [String] from user and Split [String] to [List] of [String] as word by word (plus a space " ")
/// ex. : "Hello. I am Ali" ==> [List] {" ", "Hello.", "I", "am", "Ali"}
/// and Search in Datas for each word
/// and

///
List<dynamic> getListOfObjectsStatic(
    {String query, List<dynamic> objects, String modelName}) {
  List<dynamic> data;

  if (data == null) {
    // ignore: deprecated_member_use
    data = new List<dynamic>();
  }
  // ignore: deprecated_member_use
  List<dynamic> filterObjects = new List<dynamic>();
  if (!query.endsWith(' ')) {
    query = query + ' ';
  }
  while (query.startsWith(' ')) {
    query = query.substring(1, query.length);
  }
  List<String> splitQuery = query.split(' ');
  // ignore: deprecated_member_use
  List<List<dynamic>> objectsForEachWord = new List<List<dynamic>>();
  // print('some of words : ${splitQuery.length} , $splitQuery');

  //
  splitQuery.forEach((word) {
    objectsForEachWord.add(
        getListOfObjects(query: word, objects: objects, modelName: modelName));
  });
  // print(
  //     '<><><><><> some of branchesForEachWord : ${objectsForEachWord.length}');
  for (var x = 0; x < objectsForEachWord.length; x++) {
    // print('results found for word $x : ${objectsForEachWord[x].length}');
    for (var y = 0; y < objectsForEachWord[x].length; y++) {
      bool existInQuery = false;
      for (var a = 0; a < objectsForEachWord.length; a++) {
        bool existInRow = false;
        for (var b = 0; b < objectsForEachWord[a].length; b++) {
          //{

          //
          String xyId;
          String abId;
          // if (objectsForEachWord[x][y] is Country) {
          if (modelName == 'Country') {
            xyId = objectsForEachWord[x][y].code;
            // print('is Country, xyCode is done : $xyId');
          } else
          // if (objectsForEachWord[x][y] is Branch) {
          // if (objectsForEachWord[x][y].departmentInfoID != null) {
          if (modelName == 'Branch') {
            xyId = objectsForEachWord[x][y].departmentInfoID;
            // print('is Branch, xyCode is done : $xyId');
          }

          if (modelName == 'Province') {
            xyId = objectsForEachWord[x][y].idState.toString();

            // print('is Branch, xyCode is done : $xyId');
          }
          if (modelName == 'City') {
            xyId = objectsForEachWord[x][y].idCity.toString();
            // print('is Branch, xyCode is done : $xyId');
          }
          if (modelName == 'District') {
            xyId = objectsForEachWord[x][y].idDistrict.toString();
            // print('is Branch, xyCode is done : $xyId');
          }
          // !
          // if (objectsForEachWord[a][b] is Country) {
          if (modelName == 'Country') {
            abId = objectsForEachWord[a][b].code;
            // print('is Country, abCode is done : $abId');
          } else
          // if (objectsForEachWord[a][b] is Branch) {
          // if (objectsForEachWord[a][b].departmentInfoID != null) {
          if (modelName == 'Branch') {
            abId = objectsForEachWord[a][b].departmentInfoID;
            // print('is Branch, abCode is done : $abId');
          }
          if (modelName == 'Province') {
            abId = objectsForEachWord[a][b].idState.toString();
            // print('is Branch, abCode is done : $abId');
          }
          if (modelName == 'City') {
            abId = objectsForEachWord[a][b].idCity.toString();
            // print('is Branch, abCode is done : $abId');
          }
          if (modelName == 'District') {
            abId = objectsForEachWord[a][b].idDistrict.toString();
            // print('is Branch, abCode is done : $abId');
          }

          //

          if (xyId == null && abId == null)
            print('isNULLLLLLLLLLLLLLLLLLLLL');
          else if (xyId == abId) {
            existInRow = true;
            // print('111++++++ existInRow : $existInRow');
            break; // for b
          }
        }

        // print('222++++++ existInRow : $existInRow');
        if (!existInRow) {
          existInQuery = false;
          break; // for a
        } else {
          existInQuery = true;
        }
      }
      if (existInQuery) {
        bool same = false;
        String xyId;
        filterObjects.forEach((model) {
          // if (objectsForEachWord[x][y] is Country) {
          if (modelName == 'Country') {
            xyId = objectsForEachWord[x][y].code;
          } else
          // if (objectsForEachWord[x][y] is Branch) {
          // if (objectsForEachWord[x][y].departmentInfoID != null) {
          if (modelName == 'Branch') {
            xyId = objectsForEachWord[x][y].departmentInfoID;
          } else if (modelName == 'Province') {
            xyId = objectsForEachWord[x][y].idState.toString();
          } else if (modelName == 'City') {
            xyId = objectsForEachWord[x][y].idCity.toString();
          } else if (modelName == 'District') {
            xyId = objectsForEachWord[x][y].idDistrict.toString();
          }

          // print('is Branch, XYCode is done : $xyId');
          // print(
          //     'is Branch, model.idState is done : ${model.idState.toString()}');
          // !
          // if (model is Country && xyId == model.code) {
          if (modelName == 'Country' && xyId == model.code) {
            same = true;
          } else
          // if ( // model is Branch &&
          // model.departmentInfoID != null &&
          //     xyId == model.departmentInfoID) {
          if ((modelName == 'Branch' && xyId == model.departmentInfoID) ||
              (modelName == 'Province' && xyId == model.idState.toString()) ||
              (modelName == 'City' && xyId == model.idCity.toString()) ||
              (modelName == 'District' &&
                  xyId == model.idDistrict.toString())) {
            same = true;
            // } else if (modelName == 'Province' &&
            //     xyId == model.idState.toString()) {
            //   print('get one same !!!!!!!!!!!!!!!!!');
            //   same = true;
            // } else if (modelName == 'City' && xyId == model.idCity.toString()) {
            //   same = true;
            // } else if (modelName == 'District' &&
            //     xyId == model.idDistrict.toString()) {
            //   same = true;
          }

          // !
          // print(' ***  *** ** *++*++*+*+*+* same : $same');
        });

        if (!same) filterObjects.add(objectsForEachWord[x][y]);
      }
    }
  }
  data = filterObjects;
  // print(' ***  *** ** length of result : ${data.length}');
  return data;
}

List<dynamic> getListOfObjects(
    {String query, List<dynamic> objects, String modelName}) {
  List<dynamic> data = objects;

  // for Country Model
  String _name;
  String _fullName;
  String _code;
  // for Branch Model
  String _depName;
  String _depAddress;
  //

  List<dynamic> filterObjects = data.where(
    (dynamic element) {
      String id;

      if (modelName == 'Country')
        id = element.code;
      else if (modelName == 'Branch')
        id = element.departmentInfoID;
      else if (modelName == 'Province')
        id = element.idState.toString();
      else if (modelName == 'City')
        id = element.idCity.toString();
      else if (modelName == 'District') id = element.idDistrict.toString();
      //
      bool checkNull = (query == null || id == null);
      bool checkQuery = false;
      //
      if (modelName == 'Country') {
        _name = element.name;
        _code = element.code;
        checkNull = (_code == null || _name == null || checkNull);
        checkQuery = (_name.toLowerCase().contains(query.toLowerCase()) ||
            _code.toLowerCase().contains(query.toLowerCase()));
      } else
      // for Branch Model
      // if (element is Branch) {
      // if (element.departmentInfoID != null) {
      if (modelName == 'Branch') {
        _name = arabicToPersianCharacter(element.name);
        query = arabicToPersianCharacter(query);
        checkNull = (_depName == null || _depAddress == null || checkNull);
        checkQuery = (_depName.toLowerCase().contains(query.toLowerCase()) ||
            _depAddress.toLowerCase().contains(query.toLowerCase()));
      } else if (modelName == 'Province') {
        _name = arabicToPersianCharacter(element.name);
        query = arabicToPersianCharacter(query);
        checkNull = (_name == null || checkNull);
        checkQuery = (_name.toLowerCase().contains(query.toLowerCase()));
      } else if (modelName == 'City') {
        _name = arabicToPersianCharacter(element.name);
        query = arabicToPersianCharacter(query);
        checkNull = (_name == null || checkNull);
        checkQuery = (_name.toLowerCase().contains(query.toLowerCase()));
      } else if (modelName == 'District') {
        _name = arabicToPersianCharacter(element.name);
        _fullName = arabicToPersianCharacter(element.fullName);
        query = arabicToPersianCharacter(query);
        checkNull = (_name == null || _fullName == null || checkNull);
        checkQuery = (_name.toLowerCase().contains(query.toLowerCase()) ||
            _fullName.toLowerCase().contains(query.toLowerCase()));
      }
      // //
      return !checkNull && checkQuery;
    },
  ).toList();
  print(' ***  *** ** length of filterObjects : ${filterObjects.length}');
  data = filterObjects;
  return data;
}
