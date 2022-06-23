import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/cubit/users_cubit.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/widgets/appbar/default_appbar.dart';
import 'package:suitmedia_app/presentations/widgets/indicator/shimmer_custom.dart';
import 'package:suitmedia_app/presentations/widgets/indicator/shimmer_list_tile.dart';
import 'package:suitmedia_app/presentations/widgets/list_tile/custom_list_tile.dart';

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
        appBar: DefaultAppbar(title: "Users"),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColor.kWhiteColor),
          child: SingleChildScrollView(
            child: BlocConsumer<UsersCubit, UsersState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is UsersLoaded) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.users?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CustomListTile(
                          onPressed: () {
                            Get.back(result: state.users?.data?[index]);
                          },
                          avatar: state.users?.data?[index].avatar,
                          firstName: state.users?.data?[index].firstName,
                          lastName: state.users?.data?[index].lastName,
                          email: state.users?.data?[index].email,
                        );
                      });
                }
                return ShimmerCustom(child: ShimmerListTile());
              },
            ),
          ),
        ));
  }
}
