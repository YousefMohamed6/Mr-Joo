import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/gemini_service.dart';
import 'package:mrjoo/features/chatbot/data/repos/chatbot_repo_impl.dart';
import 'package:mrjoo/features/chatbot/domin/repos/i_chatbot_repo.dart';
import 'package:mrjoo/features/chatbot/domin/use_cases/ask_gemini_use_case.dart';
import 'package:mrjoo/features/chatbot/presentation/manager/chatbot_cubit.dart';

class ChatbotService {
  final sl = GetIt.I;
  void initDi() {
    sl.registerLazySingletonSafely<GeminiService>(
      () => GeminiService(),
    );
    sl.registerLazySingletonSafely<IChatbotRepo>(
      () => ChatbotRepoImpl(sl()),
    );
    sl.registerLazySingletonSafely<AskGeminiUseCase>(
      () => AskGeminiUseCase(sl()),
    );
    sl.registerFactorySafely(
      () => ChatbotCubit(
        sl(),
      ),
    );
  }
}
