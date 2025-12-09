import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/product_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collection References
  CollectionReference get _usersCollection => _db.collection('users');
  CollectionReference get _productsCollection => _db.collection('products');

  // Create User
  Future<void> createUser(UserModel user) async {
    await _usersCollection.doc(user.uid).set(user.toMap());
  }

  // Get User Data
  Stream<UserModel> getUser(String uid) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>, uid);
    });
  }

  // Update User Profile
  Future<void> updateUser(UserModel user) async {
    await _usersCollection.doc(user.uid).update(user.toMap());
  }

  // Get Products Stream
  Stream<List<Product>> getProducts() {
    return _productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Add Product (Admin)
  Future<void> addProduct(Product product) async {
    await _productsCollection.add(product.toMap());
  }
  
  // Update Product
  Future<void> updateProduct(Product product) async {
    await _productsCollection.doc(product.id).update(product.toMap());
  }

  // Delete Product
  Future<void> deleteProduct(String productId) async {
    await _productsCollection.doc(productId).delete();
  }
}
