import 'package:daily_meme/common/data/tu_chong_repository.dart';
import 'package:daily_meme/common/data/tu_chong_source.dart';
import 'package:daily_meme/common/widget/item_builder.dart';
import 'package:daily_meme/common/widget/push_to_refresh_header.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';


class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  TuChongRepository listSourceRepository = TuChongRepository();
  DateTime dateTimeNow;
  @override
  void dispose() {
    super.dispose();
    listSourceRepository.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PullToRefreshNotification(
      pullBackOnRefresh: false,
      maxDragOffset: maxDragOffset,
      armedDragUpCancel: false,
      onRefresh: onRefresh,
      child: LoadingMoreCustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: PullToRefreshContainer(
                    (PullToRefreshScrollNotificationInfo info) {
                  return PullToRefreshHeader(info, dateTimeNow);
                }),
          ),
          LoadingMoreSliverList<TuChongItem>(
            SliverListConfig<TuChongItem>(
              extendedListDelegate:
              const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: buildItem,
              sourceList: listSourceRepository,
              padding: const EdgeInsets.all(5.0),
              lastChildLayoutType: LastChildLayoutType.foot,
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(
      BuildContext c,
      TuChongItem item,
      int index,
      ) {
    return buildWaterfallFlowItem(c, item, index, konwSized: false);
  }

  Future<bool> onRefresh() {
    return listSourceRepository.refresh().whenComplete(() {
      dateTimeNow = DateTime.now();
    });
  }
}