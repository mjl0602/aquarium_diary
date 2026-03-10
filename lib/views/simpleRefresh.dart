// import 'package:flutter/cupertino.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// /// 简单的下拉刷新封装
// class SimpleRefresher extends StatelessWidget {
//   final bool enablePullDown;
//   final RefreshController controller;
//   final Future Function(RefreshController)? onRefresh;
//   final Widget child;

//   const SimpleRefresher({
//     Key? key,
//     this.onRefresh,
//     required this.child,
//     required this.controller,
//     this.enablePullDown: true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SmartRefresher(
//       child: child,
//       controller: controller,
//       physics: AlwaysScrollableScrollPhysics(),
//       enablePullDown: true,
//       onRefresh: () async {
//         await onRefresh?.call(controller);
//       },
//       header: CustomHeader(
//         builder: (context, mode) {
//           if (mode == RefreshStatus.refreshing ||
//               mode == RefreshStatus.canRefresh ||
//               mode == RefreshStatus.completed) {
//             return Container(
//               height: 60.0,
//               child: Container(
//                 height: 20.0,
//                 width: 20.0,
//                 child: CupertinoActivityIndicator(),
//               ),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
