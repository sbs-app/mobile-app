import 'package:classroom/core/user_utils.dart';
import 'package:classroom/core/utils/chat.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/chat/chat_main.dart';
import 'package:classroom/ui/chat/firebase_chat.dart';
import 'package:classroom/ui/chat/types/flutter_chat_types.dart' as chat_types;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  chat_types.User convertToChatUser(UserModel userModel) {
    return chat_types.User(
      id: userModel.id,
      name: userModel.userName,
      imageUrl: userModel.photoURL,
      role: chat_types.Role.user,
    );
  }

  late UserModel currentTeacher;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: BlocConsumer<CourseBloc, CourseState>(
            listener: (context, state) {
              // Implement listener
            },
            builder: (context, state) {
              if (state.courses.isNotEmpty) {
                currentTeacher = state.courses[0].teacher!;
              }
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setStateDialog) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              title: const Text(
                                'Pick a teacher from your joined courses',
                                style: TextStyle(color: Colors.white),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (state.courses.isNotEmpty)
                                    DropdownButton(
                                      value: currentTeacher,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        setStateDialog(() {
                                          currentTeacher = value! as UserModel;
                                        });
                                      },
                                      items: state.courses.map((course) {
                                        return DropdownMenuItem(
                                          value: course.teacher,
                                          child: Text(
                                            "${course.teacher!.userName} (${course.name})",
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  else
                                    const Text("No courses joined."),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('OK'),
                                  onPressed: () async {
                                    FirebaseChatCore.instance.createRoom(
                                      convertToChatUser(currentTeacher),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.black,
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Chat".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: StreamBuilder<List<chat_types.Room>>(
                        stream: FirebaseChatCore.instance.rooms(),
                        initialData: const [],
                        builder: (context, snapshot) {
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                bottom: 200,
                              ),
                              child: const Text(
                                'No rooms',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final room = snapshot.data![index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ChatMain(
                                        room: room,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      _buildAvatar(room),
                                      Text(
                                        room.name ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAvatar(chat_types.Room room) {
    var color = Colors.transparent;

    if (room.type == chat_types.RoomType.direct) {
      try {
        final otherUser = room.users.firstWhere(
          (u) => u.id != getUserModel().id,
        );

        color = getUserAvatarNameColor(otherUser);
      } catch (e) {
        // Do nothing if other user is not found.
      }
    }

    final hasImage = room.imageUrl != null;
    final name = room.name ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(room.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }
}
