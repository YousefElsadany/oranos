import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/buisness_logic/chat_cubit/chat_cubit.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';
import 'package:oranos/data/model/chat_model.dart';
import 'package:oranos/presentation/widgets/custom_appbar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customAppbar(),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(14.h),
                    child: ChatCubit.get(context).msgList.isEmpty
                        ? Container(
                            child: Center(
                              child: Text(
                                'Ask oranos bot ...',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: FontWeightManager.medium),
                              ),
                            ),
                          )
                        : ListView.separated(
                            reverse: true,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 25.h),
                            itemBuilder: (context, index) =>
                                ChatCubit.get(context).msgList[index].type
                                    ? me(ChatCubit.get(context).msgList[index])
                                    : bot(
                                        ChatCubit.get(context).msgList[index]),
                            itemCount: ChatCubit.get(context).msgList.length,
                          ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: TextFormField(
                            controller: textController,
                            onFieldSubmitted: (value) {
                              _send();
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                              hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                  fontWeight: FontWeightManager.medium),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Type something…',
                              prefixIcon: Icon(Icons.language),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.w),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _send();
                          },
                          icon: Image.asset(IconsAssetsManager.send)),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }

  _send() {
    if (textController.text.isNotEmpty) {
      ChatCubit.get(context).send(textController.text);
      textController.clear();
    }
  }

  Widget bot(ChatModel model) => Row(
        children: [
          CircleAvatar(
            child: Image.asset(ImageAssetsManager.botChat),
            backgroundColor: Color(0xffD8D8D8),
            radius: 18.r,
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            width: displayWidth(context) / 1.6,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Color(0xffD8D8D8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              model.text, //'Hi, Whats You Name Firstname?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeightManager.regular,
                  ),
            ),
          ),
        ],
      );
  Widget me(ChatModel model) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: displayWidth(context) / 1.6,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppTheme.mainColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              model.text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeightManager.medium,
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(IconsAssetsManager.check),
        ],
      );
}
