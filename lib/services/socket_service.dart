import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:keepo/services/notification_services.dart';
import 'package:keepo/utils/endpoint.dart';
import 'package:keepo/utils/string.dart';

class SocketApi {
  factory SocketApi() {
    return _socketApi;
  }

  SocketApi._internal();

  static void init() {
    debugPrint('socket init connected: ${socket.connected}');
    if (socket.connected == false) {
      socket.connect();

      socket.onConnect((dynamic data) async {
        if (kDebugMode) {
          print('Connection established');
        }

        socket.on(getContactListListen, (data) {
          if (kDebugMode) {
            print(
                "============= LISTEN CONTACT LIST AFTER CONNECT =============");
          }
        });

        final selfId =
            await GetIt.I<FlutterSecureStorage>().read(key: profileId) ?? "";

        if (selfId.isNotEmpty) {
          Map messageMap = {"selfId": selfId};

          socket.emitWithAck(connectRoomSocket, messageMap);
        }
      });

      // socket.on('server:connected', (dynamic data) {
      //   print("============= LISTEN CONTACT LIST =============");
      //
      //   // print(
      //   //   'socket instance created and connected',
      //   // );
      //   // socket.emit(
      //   //   'user:connected',
      //   //   <dynamic, dynamic>{'user': Environment.user},
      //   // );
      // });

      socket.onDisconnect((_) {
        if (kDebugMode) {
          print('Connection Disconnection');
        }
        // _socket.connect();
      });

      socket.onConnectError((err) {
        if (kDebugMode) {
          print(err);
        }
      });

      socket.onError((err) {
        if (kDebugMode) {
          print(err);
        }
      });
      // socket.connect();
      // socket.on('server:connected', (dynamic data) {
      //   // print(
      //   //   'socket instance created and connected',
      //   // );
      //   // socket.emit(
      //   //   'user:connected',
      //   //   <dynamic, dynamic>{'user': Environment.user},
      //   // );
      // });
      // socket.on('unauthorized', (dynamic data) {
      //   print('Unauthorized');
      // });
      // socket.onError(
      //       (dynamic error) => {print(error), print('socket error')},
      // );
      // socket.onDisconnect((dynamic data) {
      //   print('socket instance disconnected');
      // });
    } else {
      debugPrint('socket instance already connected');
    }
  }

  static final SocketApi _socketApi = SocketApi._internal();
  static IO.Socket socket = IO.io(
    FlavorConfig.instance.variables[baseUrlSocketServer],
    IO.OptionBuilder()
        .setTransports(['websocket'])
        // .disableAutoConnect()
        .enableForceNewConnection()
        .setTimeout(5000)
        .setReconnectionDelay(10000)
        .enableReconnection()
        .enableAutoConnect()
        .build(),
  );

  Future<void> connectContactList() async {
    final Socket socket = SocketApi.socket;
    final selfId = await GetIt.I<FlutterSecureStorage>().read(key: profileId);

    if (selfId != null) {
      socket.emit(connectRoomSocket, {
        "selfId": selfId,
        "fcm_token": await HelperNotification().getFcmToken()
      });

      // socket.on(getContactList, (data) {});
    }
  }
}

// class SocketService {
//   late final Socket _socket;
//
//   Socket connectSocket() {
//     String address = FlavorConfig.instance.variables[baseUrlSocketServer];
//
//     _socket = io(
//       address,
//       OptionBuilder()
//           .setTransports(['websocket'])
//           .setTimeout(3000)
//           // .disableAutoConnect()
//           // .disableReconnection()
//           .build(),
//     );
//
//     debugPrint("SOCKET_ ${_socket.connected}");
//     if (_socket.connected == false) {
//       _socket.connect();
//
//       _socket.onConnect((_) {
//         if (kDebugMode) {
//           print('Connection established');
//         }
//
//         // _socket.on(getContactList, (data) {
//         //   if (kDebugMode) {
//         //     print("GET CONTACT LIST ==> $data");
//         //   }
//         // });
//       });
//
//       _socket.onDisconnect((_) {
//         if (kDebugMode) {
//           print('Connection Disconnection');
//         }
//         // _socket.connect();
//       });
//
//       _socket.onConnectError((err) {
//         if (kDebugMode) {
//           print(err);
//         }
//       });
//
//       _socket.onError((err) {
//         if (kDebugMode) {
//           print(err);
//         }
//       });
//
//       return _socket;
//     } else {
//       if (kDebugMode) {
//         print('socket already connected');
//       }
//     }
//     return _socket;
//   }
// }
