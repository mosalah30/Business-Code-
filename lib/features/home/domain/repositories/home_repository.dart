
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/business_card_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure,List<BusinessCardEntity>>> getCardByUser(String userId);
  Future<Either<Failure,void>> saveOrUpdateCard(BusinessCardEntity entity, String userId);
  Future<Either<Failure,void>> deleteCardByUser(String userId);
}
