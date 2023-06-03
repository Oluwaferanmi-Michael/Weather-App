import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const allowLikesTitle = 'Allow Likes';
  static const allowLikesDescription = 'By allowing likes, users will be able to click the like button on your post.';
  static const allowLikesStorageKey = 'allow_likes';
  static const allowCommentsTitle = 'Allow Comments';
  static const allowCommentsDescription = 'By allowing comments, users will be able to make comment on your post.';
  static const allowCommentsStorageKey = 'allow_comments';
  static const noPostsinSystem = 'Noone has made any posts be the first';

  static const comments = 'comments';
  static const loading = 'loading';
  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';
  
  static const delete = 'Delete';
  static const areYouSureYouWantToDelete = 'Are you sure you want to delete this ';

  static const logOut = 'logOut';
  static const areYouSureYouWantToLogOut = 'Are you sure you want to Log Out ';

  static const cancel = 'Cancel';

  static const instantGram = 'Instant Gram';

  static const welcome = 'Welcome to ${Strings.instantGram}';

  static const youHaveNooPosts = 'You have not made any posts yet';
  static const noPostsAvailable = 'No one seems to have posted anything, take the first step';

  static const enterYourSearchTerm = 'Enter your search term to get started. you can search in the description';

  static const http = 'https://';

  static const facebook = 'Facebook';
  static const facebookSignUpUrl = '${Strings.http}facebook.com/signup';
  static const googleSignUpUrl = '${Strings.http}accounts.google.com/signup';
  static const google = 'Google';

  static const loginToYourAccount = 'Log into your account below';

  static const writeHere = 'write here';
  static const checkOutThisPost = 'check out this post';
  static const post = 'post';
  static const postDetails = 'Post Details';

  static const noComments = 'No Comments';
  static const search = 'search';
  
  static const dontHaveAccount = 'Dont Have an Account?';
  static const signUpOn = ' Sign Up on ';
  static const createAnAccount = 'or Create an Account on ';

  static const createNewPost = 'Create new Post';



 const Strings._();
}
