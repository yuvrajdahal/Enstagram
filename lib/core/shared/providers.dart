
/**
 * 
class GoogleAuth extends StateNotifier {
  final GoogleSignIn googleSignIn;

  GoogleAuth(super._state, {required this.googleSignIn});
  Future<GoogleSignInAccount?> login() async {
    try {
      final user = await googleSignIn.signIn();
      return user;
    } catch (e) {
      throw Exception();
    }
  }
}

final googleServiceProvider = Provider((ref) {
  return GoogleSignIn();
});

final googleNotifierProvider =
    StateNotifierProvider<GoogleAuth, GoogleSignIn>((ref) {
  return GoogleAuth(googleSignIn: postsServiceProvider);
});

 */