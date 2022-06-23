import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/cubit/users_cubit.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';
import 'package:suitmedia_app/presentations/widgets/indicator/shimmer_custom.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late UsersCubit usersCubit;

  @override
  void initState() {
    super.initState();
    usersCubit = BlocProvider.of<UsersCubit>(context);
    usersCubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Users", style: AppText.kAppbar),
          backgroundColor: AppColor.kWhiteColor,
          elevation: 0.5,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.kPrimaryColor,
              )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColor.kWhiteColor),
          child: SingleChildScrollView(
            child: BlocConsumer<UsersCubit, UsersState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is UsersLoaded) {
                  return Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.users?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.back(result: state.users?.data?[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColor.kLightGreyColor,
                                        width: 0.5)),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage: NetworkImage(
                                      state.users?.data?[index].avatar ?? ""),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      state.users?.data?[index].firstName ??
                                          "First Name",
                                      style: AppText.kTitle.copyWith(
                                          color: AppColor.kBlackColor),
                                    ),
                                    Text(" "),
                                    Text(
                                      state.users?.data?[index].lastName ??
                                          "Last Name",
                                      style: AppText.kTitle.copyWith(
                                          color: AppColor.kBlackColor),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                    state.users?.data?[index].email ?? "Email",
                                    style: AppText.kSubtitle),
                              ),
                            ),
                          );
                        }),
                  );
                }
                return ShimmerCustom(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: AppColor.kGreyColor,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.fromLTRB(18, 0, 18, 10),
                          );
                        }));
              },
            ),
          ),
        ));
  }
}
