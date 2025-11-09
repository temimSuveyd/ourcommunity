import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/user_model.dart';

class AllUsersCard extends StatelessWidget {
  const AllUsersCard({
    super.key,
    required this.userModel,
    required this.onPressed,
    required this.isOnTeam,
  });
  final UserModel userModel;
  final Function() onPressed;
  final bool isOnTeam;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Appcolor.cardColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: const Color.fromARGB(112, 158, 158, 158),
                spreadRadius: -4,
                offset: Offset(0, 3))
          ]),
      child: Row(
        spacing: 10,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userModel.photo!),
            radius: 25,
          ),
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userModel.name!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Appcolor.primarTextcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${userModel.city}/${userModel.neighborhood}.',
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                      color: Appcolor.secondTextcolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Spacer(),
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              if (!isOnTeam) {
                onPressed();
              }
            },
            color: !isOnTeam ? Appcolor.primarycolor : Appcolor.grey,
            minWidth: 90,
            height: 30,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isOnTeam ? 'In Team' : 'Invite',
                  style: TextStyle(
                      color: Appcolor.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
                !isOnTeam
                    ? Icon(
                        Iconsax.send_1,
                        color: Appcolor.white,
                        size: 18,
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
