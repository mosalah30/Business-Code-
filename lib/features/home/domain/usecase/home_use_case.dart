import 'package:business_code_by_mohamed_salah/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/use_case.dart';
import '../entities/business_card_entity.dart';
import '../repositories/home_repository.dart';

class GetBusinessCardUseCase extends UseCase<List<BusinessCardEntity>, String> {
  final HomeRepository repository;

  GetBusinessCardUseCase(this.repository);

  @override
  Future<Either<Failure, List<BusinessCardEntity>>> call(String userId) {
    return repository.getCardByUser(userId);
  }
}

class SaveBusinessCardUseCase extends UseCase<void, SaveParams> {
  final HomeRepository repository;

  SaveBusinessCardUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SaveParams saveParams) {
    return repository.saveOrUpdateCard(saveParams.entity, saveParams.userId);
  }
}

class DeleteBusinessCardUseCase extends UseCase<void, String> {
  final HomeRepository repository;

  DeleteBusinessCardUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String userId) {
    return repository.deleteCardByUser(userId);
  }
}

class SaveParams {
  final BusinessCardEntity entity;
  final String userId;

  SaveParams({required this.entity, required this.userId});
}
