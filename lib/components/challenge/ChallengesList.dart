import '/components/challenge/ChallengeItem.dart';
import '/components/list/ListHandler.dart';
import '/constants/colors/boxes.dart';
import '/models/challenge/Challenge.dart';
import '/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class ChallengesList extends StatefulWidget {
  @override
  _ChallengesListState createState() => _ChallengesListState();
}

class _ChallengesListState extends State<ChallengesList> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListHandler<Challenge> _list;

  @override
  void initState() {
    super.initState();
    _list = ListHandler<Challenge>(
      listKey: _listKey,
      initialItems: <Challenge>[
        Challenge(
          title: "#today",
          description: 'Add a tag to this day.',
          icon: Icons.filter_vintage,
          color: kSecondaryLight,
          experiencePoints: 100,
        ),
        Challenge(
          title: "Today's picture is...",
          description: 'Upload a picture from your day!',
          icon: Icons.camera_alt,
          color: kSecondaryNormal,
          experiencePoints: 250,
        ),
        Challenge(
          title: 'Relaxation.',
          description: 'Take one minute where you only think about your breathing.',
          icon: CustomIcons.coffee_mug,
          color: kPrimaryLight,
          experiencePoints: 150,
        ),
        Challenge(
          title: 'Keeping the doctor away.',
          description: 'Eat 1 carrot.',
          icon: CustomIcons.carrot,
          color: kPrimaryNormal,
          experiencePoints: 50,
        ),
        Challenge(
          title: 'I can walk the distance.',
          description: "Run, roll or walk 4 km outside. Don't let any bad weather stop you!",
          icon: Icons.directions_walk,
          color: kPrimaryDark,
          experiencePoints: 350,
        ),
        Challenge(
          title: 'Get down!',
          description: "Do 20 push-ups today.",
          icon: Icons.fitness_center,
          color: kPrimaryDarkest,
          experiencePoints: 200,
        ),
      ],
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
      Challenge removedChallenge, BuildContext context, Animation<double> animation) {
    return ChallengeItem(
      animation: animation,
      item: removedChallenge,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert(Challenge challenge) {
    _list.insert(0, challenge);
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
