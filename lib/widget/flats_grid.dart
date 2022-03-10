import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sakkeny/providers/Flats.dart';
import 'flat_item.dart';

class FlatsGrid extends StatelessWidget {

 final  int index;

  const FlatsGrid({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flatsData = Provider.of<Flats>(context);
    final flats = index==0 ?  flatsData.posts : flatsData.onlyFavPosts;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: flats.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            // childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value : flats[i] ,child: FlatItem(

           ),));
  }
}
