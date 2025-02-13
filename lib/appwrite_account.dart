import 'package:appwrite/appwrite.dart';

class AppwriteAccount {
  static final Client _cloudClient = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('67a9e40d001002eefb45')
      .setSelfSigned(status: true);
  static final Client _client = Client()
      .setEndpoint('http://192.168.0.138:90/v1')
      .setProject('67a9c6d48d6adcd55479')
      .setSelfSigned(status: true);
  static Account? _account;
  static Account? _cloudAccount;
  static Account get getAccount => _account ?? Account(_client);

  static Account get getCloudAccount => _cloudAccount ?? Account(_cloudClient);
}
