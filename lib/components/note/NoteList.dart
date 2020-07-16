import 'package:app/components/list/ListHandler.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/note/Note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'NoteItem.dart';


class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListHandler<Note> _list;

  @override
  void initState() {
    super.initState();
    _list = ListHandler<Note>(
      listKey: _listKey,
      initialItems: <Note>[
        Note('Life gave me lemons today - thanks life.',
        color: lemon,
        size: 2),
        Note("Today, I found a golden coin.\n\n"
            "Unsure of what fortunes this little coin had for me, I sat down and wondered about what mysteries lied ahead."
            ,
            title: 'Golden Coin',
            size: 2
        ),
        Note('Not much happened today either, it is like any other wednesday.',
            color: Colors.pinkAccent,
            size: 2),
        Note("Oh, what would I do without this almanac, It is so embarrassing to forget which day it is."
            "\n\n"
            " Or what I ate yesterday.",
        size: 4),
        Note('I never know because I never try.',
            size: 2),
        Note('It has been a while since the last day of summer, I wish it would come back soon.',
            title: 'Too soon!',
            size: 2),
        Note('Wish I knew what to do with this app when it is finished.',
            title: 'Future',
            size: 4),
      ],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return NoteItem(
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
      Note removedNote, BuildContext context, Animation<double> animation) {
    return NoteItem(
      item: removedNote,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert(Note note) {
    _list.insert(0, note);
  }

  // Remove the selected item from the list model.
  void _remove(int idx) {
    _list.removeAt(idx);
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) => NoteItem(
        item: _list[index],
        onTap: () {
          print(index);
        },
      ),
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(_list[index].size);
      }
      ,
      mainAxisSpacing: kSpacingSmall,
      crossAxisSpacing: kSpacingSmall,
    );

    return AnimatedList(
      key: _listKey,
      initialItemCount: _list.length,
      itemBuilder: _buildItem,
      physics: BouncingScrollPhysics(),
    );


  }
}
