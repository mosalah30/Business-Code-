import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/entities/business_card_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../mappers/card_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, List<BusinessCardEntity>>> getCardByUser(String userId) async {
    try {
      final cards = await StorageService.getBusinessCardsByUserId(userId);
      if (cards.isEmpty) {
        return const Right([]);
      }
      return Right(cards.map((e) => CardMapper.toEntity(e)).toList());
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveOrUpdateCard(BusinessCardEntity entity, String userId) async {
    try {
      // Convert Entity -> Model
      final model = CardMapper.toModel(entity, userId);

      // Check if user already has a card
      final existingCards = await StorageService.getBusinessCardsByUserId(userId);
      if (existingCards.isNotEmpty) {
        // Update existing card
        await StorageService.updateBusinessCard(model);
      } else {
        // Save new card
        await StorageService.saveBusinessCard(model);
      }

      return const Right(null);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCardByUser(String userId) async {
    try {
      await StorageService.deleteBusinessCardByUserId(userId);
      return const Right(null);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }
}
