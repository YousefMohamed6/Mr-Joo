import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/firebase_service.dart';
import 'package:mrjoo/features/terms_and_conditions/data/repos/terms_and_conditions_repo_impl.dart';
import 'package:mrjoo/features/terms_and_conditions/domain/repos/i_terms_and_conditions.dart';
import 'package:mrjoo/features/terms_and_conditions/domain/use_cases/terms_and_conditions_use_case.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/manager/terms_and_conditions_cubit.dart';

class TermsAndConditionsService {
  final sl = GetIt.instance;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ITermsAndConditionsRepo>(
      () => TermsAndConditionsRepoImpl(
        firebaseFirestoreService: sl(),
      ),
    );
    sl.registerLazySingletonSafely<TermsAndConditionsUseCase>(
      () => TermsAndConditionsUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<TermsAndConditionsCubit>(
      () => TermsAndConditionsCubit(
        sl(),
      ),
    );
  }
}
