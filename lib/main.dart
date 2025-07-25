import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:konnek_flutter/konnek_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await KonnekFlutter.initKonnek(
    inputClientId: '42f2486e-3870-466c-9d66-143e0417652b', // SprintAsia
    // inputClientId: '61190e21-2e2e-4a01-94d5-7f05c7bbdb5e', // bcadigitaldemo
    inputClientSecret: '1dc8e065-2915-4b4e-8df2-45040e8314bd',
    flavor: Flavor.production,
  );

  // // Staging
  // await KonnekFlutter.initKonnek(
  //   inputClientId: 'b699182d-5ff0-4161-b649-239234ff9cb9',
  //   inputClientSecret: '1dc8e065-2915-4b4e-8df2-45040e8314bd',
  //   flavor: Flavor.staging,
  // );
}

// Future<void> handleWebSocketIO({
//     void Function(String errorMessage)? onFailed,
//   }) async {
//     try {
//       AppSocketioService.socket.on("chat", (output) async {
//         AppLoggerCS.debugLog("[socket][chat] output: ${jsonEncode(output)}");
//         SocketChatResponseModel socket = SocketChatResponseModel.fromJson(output);

//         sessionId = socket.session!.id!;
//         roomId = socket.session!.roomId!;

//         ConversationList? chatModel;
//         chatModel = null;

//         chatModel = ConversationList(
//           session: SessionGetConversation(
//             botStatus: socket.session?.botStatus,
//             agent: UserGetConversation(
//               id: socket.agent?.userId,
//               name: socket.agent?.name,
//               username: socket.agent?.username,
//             ),
//           ),
//           fromType: socket.message?.fromType,
//           text: socket.message?.text,
//           messageId: socket.messageId,
//           user: UserGetConversation(
//             id: socket.customer?.userId,
//             username: socket.customer?.username,
//             name: socket.customer?.name,
//           ),
//           messageTime: socket.message?.time,
//           sessionId: socket.session?.id,
//           roomId: socket.session?.roomId,
//           replyId: socket.replyId,
//           payload: socket.message?.payload,
//           type: socket.message?.type,
//         );
//         conversationList.add(chatModel);
//         // onSocketChatCalled.call();

//         DateTime currentDateTime = DateTime.now();
//         AppSocketioService.socket.emit(
//           "chat.status",
//           {
//             "data": {
//               "message_id": conversationList.last.messageId,
//               "room_id": conversationList.last.roomId,
//               "session_id": conversationList.last.sessionId,
//               "status": 2,
//               "times": (currentDateTime.millisecondsSinceEpoch / 1000).floor(),
//               "timestamp": getDateTimeFormatted(value: currentDateTime),
//             },
//           },
//         );

//         _getConversation(
//           roomId: socket.session!.roomId!,
//           onSuccess: () {
//             onSocketChatCalled.call();
//           },
//           onFailed: (errorMessage) {
//             onFailed?.call(errorMessage);
//           },
//         );
//         // onSocketChatCalled.call();
//       });

//       AppSocketioService.socket.on("chat.status", (output) async {
//         AppLoggerCS.debugLog("[socket][chat.status] output: ${jsonEncode(output)}");
//         SocketChatStatusResponseModel socket = SocketChatStatusResponseModel.fromJson(output);
//         sessionId = socket.data!.sessionId!;
//         roomId = socket.data!.roomId!;

//         conversationList.map((element) {
//           if (element.messageId == socket.data?.messageId) {
//             element.status = socket.data?.status;
//             return element;
//           } else {
//             return element;
//           }
//         }).toList();
//         conversationList = removeDuplicatesById(conversationList);
//         onSocketChatStatusCalled.call();
//       });

//       AppSocketioService.socket.on("room.handover", (output) async {
//         AppLoggerCS.debugLog("[socket][room.handover] output: ${jsonEncode(output)}");
//         SocketRoomHandoverResponseModel socket = SocketRoomHandoverResponseModel.fromJson(output);
//         sessionId = socket.data!.session!.id!;
//         roomId = socket.data!.session!.roomId!;
//         onSocketRoomHandoverCalled.call();
//       });

//       AppSocketioService.socket.on("room.closed", (output) async {
//         AppLoggerCS.debugLog("[socket][room.closed] output: ${jsonEncode(output)}");
//         SocketRoomClosedResponseModel socket = SocketRoomClosedResponseModel.fromJson(output);
//         // isWebSocketStart = false;
//         if (socket.data?.csat != null) {
//           // isRoomClosed = false;
//           isRoomClosed = RoomCloseState.open;
//         } else {
//           isRoomClosed = RoomCloseState.closeWaiting;
//         }
//         onSocketRoomClosedCalled.call();
//       });

//       AppSocketioService.socket.on("csat", (output) async {
//         AppLoggerCS.debugLog("[socket][csat] output: ${jsonEncode(output)}");
//         SocketChatResponseModel socket = SocketChatResponseModel.fromJson(output);

//         if (socket.csat != null) {
//           if (socket.csat == true) {
//             isAnyCompletionMessage = true;
//           }
//         }

//         sessionId = socket.session!.id!;
//         roomId = socket.session!.roomId!;

//         ConversationList? chatModel;
//         chatModel = null;

//         chatModel = ConversationList(
//           session: SessionGetConversation(
//             botStatus: socket.session?.botStatus,
//             agent: UserGetConversation(
//               id: socket.agent?.userId,
//               name: socket.agent?.name,
//               username: socket.agent?.username,
//             ),
//           ),
//           fromType: socket.message?.fromType,
//           text: socket.message?.text,
//           messageId: socket.messageId,
//           user: UserGetConversation(
//             id: socket.customer?.userId,
//             username: socket.customer?.username,
//             name: socket.customer?.name,
//           ),
//           messageTime: socket.message?.time,
//           sessionId: socket.session?.id,
//           roomId: socket.session?.roomId,
//           replyId: socket.replyId,
//           payload: socket.message?.payload,
//           type: socket.message?.type,
//         );
//         conversationList.add(chatModel);

//         onSocketCSATCalled.call();
//       });

//       AppSocketioService.socket.on("csat.close", (output) async {
//         AppLoggerCS.debugLog("[socket][csat.close] output: ${jsonEncode(output)}");
//         isWebSocketStart = false;
//         onSocketCSATCloseCalled.call();
//       });

//       AppSocketioService.socket.on("customer.is_blocked", (output) async {
//         AppLoggerCS.debugLog("[socket][customer.is_blocked] output: ${jsonEncode(output)}");
//         Map<String, dynamic> result = jsonDecode(output);
//         isCustomerBlocked = result['is_blocked'];
//         if (isCustomerBlocked) {
//           KonnekFlutter.accessToken = "";
//         }
//         onSocketCustomerIsBlockedCalled.call();
//       });
//       AppSocketioService.socket.on("disconnect", (output) async {
//         AppLoggerCS.debugLog("[socket][disconnect] output: ${jsonEncode(output)}");
//         isWebSocketStart = false;
//         KonnekFlutter.accessToken = "";
//         onSocketDisconnectCalled.call();
//       });
//     } catch (e) {
//       AppLoggerCS.debugLog('[handleWebSocketIO] e: $e');
//       onFailed?.call(e.toString());
//     }
//   }

// @override
//   void initState() {
//     // nameController.text = "test";
//     // emailController.text = "test@test.com";

//     if (Platform.isAndroid) {
//       nameController.text = "androidf";
//       emailController.text = "androidf@test.com";
//     } else if (Platform.isIOS) {
//       nameController.text = "ios";
//       emailController.text = "ios@test.com";
//     } else {
//       nameController.text = "androidx";
//       emailController.text = "androidx@test.com";
//     }

//     // nameController.text = "androidv";
//     // emailController.text = "androidv@test.com";
//     super.initState();
//   }