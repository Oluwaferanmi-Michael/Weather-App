import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:insta_clone/state/posts/typedefs/user_id.dart';
import 'package:insta_clone/state/user_info/models/user_info_payload.dart';
import '../../constants/firebase_collection_name.dart';
import '../../constants/firebase_field_names.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  
  
  Future<bool> saveUserInfo({required UserId userId, required String displayName, required String? email}) async {

    try {
      final userInfo = await FirebaseFirestore.instance
      .collection(FirebaseCollectionName.users)
      // check if user info is present
      .where(FirebaseFieldName.userId, isEqualTo: userId).limit(1).get();

    if(userInfo.docs.isNotEmpty){
      await userInfo.docs.first.reference.update({
        FirebaseFieldName.displayName: displayName,
        FirebaseFieldName.email: email ?? ''
      });
      return true;
    }

    // User isn't present create new
    final payload = UserInfoPayload(userId: userId, displayName: displayName, email: email);
    await FirebaseFirestore.instance.collection(FirebaseCollectionName.users).add(payload);
    
    return true;
  }
  catch (e){
    return false; 
  }
  }   
}