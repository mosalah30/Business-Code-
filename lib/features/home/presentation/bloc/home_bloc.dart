import 'dart:math';
import 'package:business_code_by_mohamed_salah/core/services/storage_service.dart';
import 'package:business_code_by_mohamed_salah/core/utils/print.dart';
import 'package:business_code_by_mohamed_salah/features/home/domain/entities/business_card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/usecase/home_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<BusinessCardEntity> businessCardsList = [];
  late final List<BusinessCardEntity> businessCards = [
    BusinessCardEntity(
      name: "محمد علي",
      title: "مهندس تجربة مستخدم",
      location: "الدمام، السعودية",
      email: "mohammedali@gmail.com",
      website: "https://mohammedali.com",
      avatarUrl: "https://i.pravatar.cc/150?img=3",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.github, FontAwesomeIcons.twitter],
    ),
    BusinessCardEntity(
      name: "سارة عبد الله",
      title: "مصممة واجهات",
      location: "الرياض، السعودية",
      email: "sara.abdullah@gmail.com",
      website: "https://saraabdullah.com",
      avatarUrl: "https://i.pravatar.cc/150?img=4",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.dribbble, FontAwesomeIcons.instagram],
    ),
    BusinessCardEntity(
      name: "أحمد منصور",
      title: "مطور تطبيقات Flutter",
      location: "جدة، السعودية",
      email: "ahmed.mansour@gmail.com",
      website: "https://ahmedmansour.dev",
      avatarUrl: "https://i.pravatar.cc/150?img=5",
      socialIcons: [FontAwesomeIcons.github, FontAwesomeIcons.linkedin, FontAwesomeIcons.twitter],
    ),
    BusinessCardEntity(
      name: "نورة العتيبي",
      title: "مديرة تسويق رقمي",
      location: "الخبر، السعودية",
      email: "noura.alotaibi@gmail.com",
      website: "https://nouramarketing.com",
      avatarUrl: "https://i.pravatar.cc/150?img=6",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.instagram, FontAwesomeIcons.facebook],
    ),
    BusinessCardEntity(
      name: "عبد الرحمن فهد",
      title: "محلل نظم",
      location: "المدينة المنورة، السعودية",
      email: "abdurahman.fahad@gmail.com",
      website: "https://abdurahmanfahad.tech",
      avatarUrl: "https://i.pravatar.cc/150?img=7",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.twitter, FontAwesomeIcons.github],
    ),
    BusinessCardEntity(
      name: "فاطمة خالد",
      title: "مهندسة برمجيات",
      location: "الرياض، السعودية",
      email: "fatimakhaled@gmail.com",
      website: "https://fatimakhaled.io",
      avatarUrl: "https://i.pravatar.cc/150?img=8",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.github, FontAwesomeIcons.instagram],
    ),
    BusinessCardEntity(
      name: "سعيد القحطاني",
      title: "مدير مشاريع تقنية",
      location: "جدة، السعودية",
      email: "saeed.qahtani@gmail.com",
      website: "https://saeedqahtani.com",
      avatarUrl: "https://i.pravatar.cc/150?img=9",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.twitter, FontAwesomeIcons.facebook],
    ),
    BusinessCardEntity(
      name: "ريم العنزي",
      title: "مصممة جرافيك",
      location: "الدمام، السعودية",
      email: "reem.alenezi@gmail.com",
      website: "https://reemdesigns.com",
      avatarUrl: "https://i.pravatar.cc/150?img=10",
      socialIcons: [FontAwesomeIcons.dribbble, FontAwesomeIcons.instagram, FontAwesomeIcons.linkedin],
    ),
    BusinessCardEntity(
      name: "خالد الشمري",
      title: "خبير أمن سيبراني",
      location: "الرياض، السعودية",
      email: "khaled.shammari@gmail.com",
      website: "https://khaledsec.com",
      avatarUrl: "https://i.pravatar.cc/150?img=11",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.github, FontAwesomeIcons.twitter],
    ),
    BusinessCardEntity(
      name: "هدى المطيري",
      title: "محللة بيانات",
      location: "مكة المكرمة، السعودية",
      email: "huda.mutairi@gmail.com",
      website: "https://hudadata.com",
      avatarUrl: "https://i.pravatar.cc/150?img=12",
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.github, FontAwesomeIcons.instagram],
    ),
  ];
  final GetBusinessCardUseCase getBusinessCard;
  final SaveBusinessCardUseCase saveBusinessCard;
  final DeleteBusinessCardUseCase deleteBusinessCard;

  HomeBloc({required this.getBusinessCard, required this.deleteBusinessCard, required this.saveBusinessCard})
    : super(HomeInitial()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<AddCardEvent>(_addCard);
    on<InitEvent>(_getUserCard);
    on<SignOutEvent>(_signOut);
  }

  void _onChangeLanguage(ChangeLanguageEvent event, Emitter<HomeState> emit) {
    emit(HomeLoading());
    emit(HomeLanguageChanged());
  }

  void _getUserCard(InitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    iPrint('cc');
    if (StorageService.isLoggedIn()) {
      iPrint('cc');
      var either = await getBusinessCard(StorageService.getCurrentUserId()!);
      either.fold((l) => emit(HomeError(l.message)), (r) {
        businessCardsList = r;
        emit(AddCardState());
      });
    }
    emit(AddCardState());
  }

  Future<void> _addCard(AddCardEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    if (StorageService.isLoggedIn()) {
      final userId = StorageService.getCurrentUserId()!;
      var item = businessCards[Random().nextInt(businessCards.length)];
      businessCardsList.add(item);
      await saveBusinessCard(SaveParams(entity: item, userId: userId));
      await Future.delayed(const Duration(seconds: 1));
      emit(AddCardState());
    } else {
      emit(HomeError('not_logged_in'));
    }
  }

  bool isUserLoggedIn() {
    return StorageService.isLoggedIn();
  }

  String getCurrentUserName() {
    return StorageService.getCurrentUserName();
  }

  void _signOut(SignOutEvent event, Emitter<HomeState> emit) {
    StorageService.signOut();
    businessCardsList = [];
    emit(HomeInitial());
  }
}
