import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController extends GetxController {
  final RxSet<String> wishlist = <String>{}.obs;
  static const String wishlistKey = 'wishlist';

  @override
  void onInit() {
    super.onInit();
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistSet = prefs.getStringList(wishlistKey) ?? [];
    wishlist.addAll(wishlistSet);
  }

  void _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(wishlistKey, wishlist.toList());
  }
  bool isInWishlist(String movieId) => wishlist.contains(movieId);

  void addToWishlist(String movieId) {
    if (!wishlist.contains(movieId)) {
      wishlist.add(movieId);
      _saveWishlist();
      update(); 
    } else {

    }
  }

  void removeFromWishlist(String movieId) {
    wishlist.remove(movieId);
    _saveWishlist();
    update();
  }
}
