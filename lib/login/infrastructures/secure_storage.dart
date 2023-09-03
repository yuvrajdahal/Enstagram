import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class CredentialStorage {
  Future read(String key);
  Future<void> store(String key, String cred);
  Future<void> remove(String key);
}

class SecureStorage implements CredentialStorage {
  final FlutterSecureStorage _storage;
  SecureStorage(this._storage);
  String? _cred;
  @override
  Future<String?> read(String key) async {
    if (_cred != null) return _cred;
    _cred = await _storage.read(key: key);
    return _cred;
  }

  @override
  Future<void> store(String key, String cred) async {
    _cred = cred;
    return await _storage.write(key: key, value: cred);
  }

  @override
  Future<void> remove(String key) async {
    _cred = null;
    return await _storage.delete(key: key);
  }
}
