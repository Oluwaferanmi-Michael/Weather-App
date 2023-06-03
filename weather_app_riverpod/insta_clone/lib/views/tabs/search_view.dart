
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/views/extensions/dismiss_keyboard.dart';

import '../components/post/post_search_view.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final searchTerm = useState('');

    useEffect(() {
      controller.addListener(() {
        searchTerm.value = controller.text;
      });
      return (){};
    }, [controller]);

    return SingleChildScrollView(
      child: CustomScrollView(
        slivers: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SliverToBoxAdapter(child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                label: const Text('enter Your Search Term Here'),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                    dismissKeyBoard();
                  }, icon: const Icon(Icons.clear),
                )
              ),
            )),
          ),
    
          SearchGridView(searchTerm: searchTerm.value)
        ],
      ),
    );
  }
}