import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddCardEvent extends HomeEvent {}
class SignOutEvent extends HomeEvent {}

class InitEvent extends HomeEvent {}

class ChangeLanguageEvent extends HomeEvent {}
