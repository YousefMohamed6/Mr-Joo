import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';

class GetAllTeachersUseCase {
  final IChatRepo _chatRepo;

  GetAllTeachersUseCase(this._chatRepo);
  Future<List<TeacherModel>> execute() async {
    return await _chatRepo.getAllTeachers();
  }
}
