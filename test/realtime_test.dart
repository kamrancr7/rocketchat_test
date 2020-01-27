import 'package:ddp/ddp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rocketchat_test/models/models.dart';
import 'package:rocketchat_test/realtime/client.dart';

void main() {
  // deploy a rocket chat server locally
  // create a user named admin with password equals to admin
  // to run this test.
  test('test realtime rocket.chat client', () {
    Client client = Client(
        'testing',
        Uri.parse(
            'https://www.iamflexi.com/iamflexi'
        ),
        true);
    client.addStatusListener((status) async {
      if (status == ConnectStatus.connected) {
        await client.login(UserCredentials()
          ..name = 'sp_umar@live.com'
          ..password = 'a');
        final channels = await client.getChannelsIn();
        channels.forEach((channel) {
          client.subRoomMessages(channel.id);
        });
        client.roomMessages().listen((data) => print(data.doc));
      }
    });
  });
}
