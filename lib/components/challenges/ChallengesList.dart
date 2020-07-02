import 'package:app/components/challenges/ChallengeItem.dart';
import 'package:app/components/list/ListHandler.dart';
import 'package:flutter/material.dart';

class ChallengesList extends StatefulWidget {
  @override
  _ChallengesListState createState() => _ChallengesListState();
}

class _ChallengesListState extends State<ChallengesList> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListHandler<int> _list;

  @override
  void initState() {
    super.initState();
    _list = ListHandler<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return ChallengeItem(
      animation: animation,
      item: _list[index],
      onTap: () {
        _remove(index);
      },
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned). The widget will be used by the
  // [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return ChallengeItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    _list.insert(_list.length, _list.length);
  }

  // Remove the selected item from the list model.
  void _remove(int idx) {
      _list.removeAt(idx);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _list.length,
      itemBuilder: _buildItem,
    );
  }
}
