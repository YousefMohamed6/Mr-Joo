import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';

class FileMessageModel implements MessageModel {
  final String fileBase64;
  @override
  final UserModel userModel;
  @override
  final String createdAt;
  final String fileName;

  FileMessageModel({
    required this.fileBase64,
    required this.userModel,
    required this.createdAt,
    required this.fileName,
  });
  @override
  factory FileMessageModel.fromJson(Map<String, dynamic> json) {
    return FileMessageModel(
      fileBase64: json['fileBase64'],
      userModel: UserModel.fromJson(json['user']),
      createdAt: json['createdAt'],
      fileName: json['fileName'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'fileBase64': fileBase64,
        'user': userModel.toJson(),
        'createdAt': createdAt,
        'type': type,
        'fileName': fileName,
      };

  @override
  String get type => 'file';
}
