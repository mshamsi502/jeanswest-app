// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQData _$FAQDataFromJson(Map<String, dynamic> json) {
  return FAQData(
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$FAQDataToJson(FAQData instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
