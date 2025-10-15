import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/models/business_card.dart';
import '../../features/home/data/models/user.dart';
import '../constants/app_constants.dart';

class StorageService {
  static late Box<User> _userBox;
  static late Box<BusinessCard> _cardBox;
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(BusinessCardAdapter());

    // Open boxes
    _userBox = await Hive.openBox<User>(AppConstants.userBoxName);
    _cardBox = await Hive.openBox<BusinessCard>(AppConstants.cardBoxName);

    // Initialize SharedPreferences
    _prefs = await SharedPreferences.getInstance();
  }

  // User Box Operations
  static Box<User> get userBox => _userBox;

  // Card Box Operations
  static Box<BusinessCard> get cardBox => _cardBox;

  // SharedPreferences Operations
  static SharedPreferences get prefs => _prefs;

  static Future<void> setCurrentUserId(String userId) async {
    await _prefs.setString(AppConstants.currentUserIdKey, userId);
    await _prefs.setBool(AppConstants.isLoggedInKey, true);
  }

  static String? getCurrentUserId() {
    return _prefs.getString(AppConstants.currentUserIdKey);
  }

  static bool isLoggedIn() {
    return _prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  static Future<void> clearSession() async {
    await _prefs.remove(AppConstants.currentUserIdKey);
    await _prefs.setBool(AppConstants.isLoggedInKey, false);
  }

  static Future<void> dispose() async {
    await _userBox.close();
    await _cardBox.close();
  }

  // User Operations
  static Future<void> saveUser(User user) async {
    await _userBox.put(user.id, user);
  }

  static Future<User?> getUserById(String id) async {
    return _userBox.get(id);
  }

  static Future<User?> getUserByEmail(String email) async {
    final users = _userBox.values;
    try {
      return users.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isEmailTaken(String email) async {
    final users = _userBox.values;
    return users.any((user) => user.email.toLowerCase() == email.toLowerCase());
  }

  static Future<void> updateUser(User user) async {
    await _userBox.put(user.id, user);
  }

  static Future<void> deleteUser(String id) async {
    await _userBox.delete(id);
  }

  // Business Card Operations
  static Future<void> saveBusinessCard(BusinessCard card) async {
    await _cardBox.put(card.id, card);
  }

  static Future<BusinessCard?> getBusinessCardById(String id) async {
    return _cardBox.get(id);
  }

  static Future<List<BusinessCard>> getAllBusinessCards() async {
    return _cardBox.values.toList();
  }

  static Future<List<BusinessCard>> getBusinessCardsByUserId(
    String userId,
  ) async {
    return _cardBox.values.where((card) => card.userId == userId).toList();
  }

  static Future<void> updateBusinessCard(BusinessCard card) async {
    await _cardBox.put(card.id, card);
  }

  static Future<void> deleteBusinessCard(String id) async {
    await _cardBox.delete(id);
  }
}
