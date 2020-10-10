import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wow/models/user.dart';
import 'package:wow/utilities/sharedprefutility.dart';
import 'package:wow/utilities/constants.dart';


class SignInUtil {
  SignInUtil({this.phone,this.address,this.lat,this.long});
  String name;
  String email;
  String imageUrl;
  String phone;
  String uid;
  String address;
  double lat;
  double long;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final _firestoreUser =
  Firestore.instance.collection(Constants.COLLECTION_NAME_USER);

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
    await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser firebaseuser = authResult.user;

    assert(firebaseuser.email != null);
    assert(firebaseuser.displayName != null);
    assert(firebaseuser.photoUrl != null);
    assert(firebaseuser.uid != null);

    name = firebaseuser.displayName;
    email = firebaseuser.email;
    imageUrl = firebaseuser.photoUrl;
    uid = firebaseuser.uid;

    User user = User();
    user.name = name;
    user.email = email;
    user.imageUrl = imageUrl;
    user.uid = uid;
    user.phone=phone;
    user.address=address;
    user.lat=lat;
    user.long=long;

    SharedPreferencesUtil.setBooleanValue(Constants.USER_LOGGED_IN, true);
    SharedPreferencesUtil.setStringValue(Constants.USER_DETAIL_OBJECT, user);
    final userDoc = _firestoreUser.document(uid);
    userDoc.get().then(
          (docsnapshot) => {
        //if (docsnapshot.exists)
        //  {print('Snapshot exists with docID $uid')}
        //else
        //  {
        //print('No existance of doc with docID 123'),
        _firestoreUser.document(uid.toString()).setData(
          {
            'name': name,
            'email': email,
            'imageUrl': imageUrl,
            'uid': uid,
            'phone':phone,
            'address':address,
            'lat':lat,
             'long':long
          },
        ),
      },
    );

    return 'signInWithGoogle succeeded: $firebaseuser';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    SharedPreferencesUtil.clearPreferences();
  }
}
