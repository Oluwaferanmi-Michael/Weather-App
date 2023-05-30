import 'package:insta_clone/state/comments/models/comments_model.dart';
import 'package:insta_clone/state/comments/models/post_comment_requests.dart';

import '../../../enums/date_sorting.dart';

extension Sorting on Iterable<Comment> {
  Iterable<Comment> applySortingFrom(PostCommentRequest request) {
    if (request.sortByCreatedAt) {
      final sortedDocuments = toList()..sort(
        (a, b) {
          switch(request.dateSorting) {
            case DateSorting.newOnTop:
              return b.createdAt.compareTo(a.createdAt);
            case DateSorting.oldOnTop:
              return a.createdAt.compareTo(b.createdAt);
          }
        }
      );

      return sortedDocuments;
    } else {
      return this;
    }
  }
}