# Admin Guide - Online Bakery App

This guide is for administrators and staff managing the Online Bakery App's product catalog and content.

## Table of Contents

1. [Admin Access](#admin-access)
2. [Dashboard Overview](#dashboard-overview)
3. [Product Management](#product-management)
4. [Adding New Products](#adding-new-products)
5. [Editing Products](#editing-products)
6. [Deleting Products](#deleting-products)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)

---

## Admin Access

### Prerequisites

To access admin features, you need:

1. **Admin Account**: Created in Firebase Console with proper permissions
2. **Firestore Access**: Admin role assigned in Firebase Security Rules
3. **App Installation**: Latest version of the Online Bakery App

### Setting Up Admin Access

#### Option 1: Firebase Console (Recommended)

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project (Online Bakery)
3. Navigate to **Authentication** → **Users**
4. Find or create the admin user account
5. Note the **User UID**
6. Go to **Firestore Database**
7. Create or update the `users` collection:
   ```
   users/
     └── {userUID}/
         ├── email: "admin@bakery.com"
         ├── fullName: "Admin User"
         ├── isAdmin: true  ← Add this field
         └── createdAt: timestamp
   ```

#### Option 2: Manual Database Entry

1. Log in to the app with your admin account
2. Open Firebase Console → Firestore Database
3. Find your user document in the `users` collection
4. Add the field: `isAdmin: true`

> [!IMPORTANT]
> Only assign admin privileges to trusted staff members. Admins have full control over the product catalog.

---

## Dashboard Overview

When you log in with an admin account, you'll see:

### Admin Dashboard Features

1. **Product Statistics**
   - Total number of products
   - Products by category
   - Recent additions

2. **Quick Actions**
   - Add New Product
   - View All Products
   - Manage Categories

3. **Product Categories**
   - Cakes
   - Pastries
   - Breads
   - Cookies
   - Others

### Navigation

- **Dashboard Tab** (🏠): Admin overview and statistics
- **Products Tab** (🛍️): Full product catalog with edit/delete options
- **Profile Tab** (👤): Your admin account details

---

## Product Management

### Accessing Product Management

**From Dashboard:**
1. Tap the **Products** tab in the bottom navigation
2. You'll see all products with admin controls (Edit/Delete icons)

**Admin-Only Features:**
- ➕ **Add Product** button (floating action button)
- ✏️ **Edit** button on each product card
- 🗑️ **Delete** button on each product card

---

## Adding New Products

### Step-by-Step Guide

1. **Navigate to Products Tab**
   - Tap the 🛍️ **Products** icon in the bottom navigation

2. **Tap the "Add Product" Button** (➕ floating action button)

3. **Fill in Product Details**:

   **Required Fields:**
   
   - **Product Name**
     - Example: "Chocolate Fudge Cake"
     - Keep it descriptive and appealing
     - Use proper capitalization
   
   - **Price**
     - Enter numeric value only
     - Example: 25.99
     - Don't include currency symbols
   
   - **Category**
     - Example: "Cakes", "Pastries", "Breads"
     - Use existing categories for consistency
     - Common categories:
       - Cakes
       - Pastries
       - Breads
       - Cookies
       - Desserts
   
   - **Image URL**
     - Full URL to product image
     - Example: `https://example.com/images/chocolate-cake.jpg`
     - Ensure the image is publicly accessible
     - Recommended size: 800x800px or larger
     - Supported formats: JPG, PNG
   
   - **Description**
     - Detailed product description
     - Include:
       - Key ingredients
       - Flavor profile
       - Size/weight
       - Special features (e.g., "Sugar-free", "Vegan")
     - Example:
       ```
       Rich chocolate fudge cake layered with smooth chocolate 
       ganache. Made with premium cocoa and topped with chocolate 
       shavings. Serves 8-10 people. Perfect for celebrations!
       ```

4. **Review Your Entry**
   - Double-check all information
   - Ensure the image URL works
   - Verify pricing is correct

5. **Tap "Save Product"**

6. **Confirmation**
   - Product is added to the catalog immediately
   - You'll return to the products list
   - New product appears in the list

### Tips for Adding Products

> [!TIP]
> **Image Guidelines:**
> - Use high-quality, well-lit photos
> - Show the product clearly
> - Maintain consistent image style across all products
> - Consider using a free image hosting service like:
>   - Imgur
>   - Cloudinary
>   - Firebase Storage (recommended)

> [!TIP]
> **Pricing Tips:**
> - Be consistent with decimal places (e.g., 25.00, not 25)
> - Review competitor pricing
> - Consider portion sizes when pricing

> [!TIP]
> **Description Best Practices:**
> - Keep it concise but informative (50-150 words)
> - Highlight what makes the product special
> - Mention allergen information if applicable
> - Use appetizing language

---

## Editing Products

### How to Edit a Product

1. **Navigate to Products Tab**

2. **Find the Product** you want to edit
   - Scroll through the list
   - Products are organized by category

3. **Tap the Edit Icon** (✏️) on the product card

4. **Update Product Information**
   - Modify any field as needed
   - All fields are editable:
     - Product Name
     - Price
     - Category
     - Image URL
     - Description

5. **Review Changes**
   - Ensure all information is accurate
   - Check that the image URL still works

6. **Tap "Save Product"**

7. **Confirmation**
   - Changes are saved immediately
   - Updated product appears in the list
   - Users see the updated information instantly

### Common Edit Scenarios

**Price Update:**
- Example: Seasonal pricing changes
- Update the price field only
- Save changes

**Image Replacement:**
- Upload new image to hosting service
- Copy new image URL
- Replace old URL in Image URL field
- Save changes

**Description Enhancement:**
- Add more details about ingredients
- Update for seasonal variations
- Add allergen information
- Save changes

**Category Correction:**
- Change if product was miscategorized
- Maintain consistency with other products
- Save changes

> [!WARNING]
> Editing a product updates it immediately for all users. Double-check your changes before saving.

---

## Deleting Products

### How to Delete a Product

1. **Navigate to Products Tab**

2. **Find the Product** you want to remove

3. **Tap the Delete Icon** (🗑️) on the product card

4. **Confirm Deletion**
   - You'll see a confirmation dialog
   - **Warning**: This action cannot be undone!

5. **Tap "Confirm" or "Delete"**

6. **Product Removed**
   - Product is permanently deleted from the database
   - Removed from all user views immediately

### When to Delete Products

Delete products when:
- ❌ Item is permanently discontinued
- ❌ Seasonal item is out of season (or mark inactive)
- ❌ Duplicate entry exists
- ❌ Product information is completely incorrect

### Alternatives to Deletion

Instead of deleting, consider:
- **Editing** the product to mark as "Out of Stock" in description
- Creating an **isActive** flag (requires code modification)
- **Moving** to an "Archived" category

> [!CAUTION]
> **Think Before You Delete!**
> - Deletion is permanent and immediate
> - Consider if the product might return (seasonal items)
> - Check if you should edit instead of delete
> - No undo feature available

---

## Best Practices

### Product Catalog Management

#### Consistency is Key

1. **Naming Conventions**
   - Use consistent capitalization
   - Example: "Chocolate Cake" not "chocolate cake" or "CHOCOLATE CAKE"
   - Be descriptive but concise

2. **Categories**
   - Use standardized category names
   - Don't create new categories unnecessarily
   - Current categories:
     - Cakes
     - Pastries
     - Breads
     - Cookies
     - Desserts

3. **Pricing Format**
   - Always use two decimal places
   - Example: 25.00, not 25
   - Be consistent across all products

4. **Image Standards**
   - Use same aspect ratio for all images (square recommended)
   - Similar lighting and background
   - Professional-looking photos
   - Minimum 800x800px resolution

#### Writing Effective Descriptions

**Do:**
- ✅ Be specific about ingredients
- ✅ Mention serving sizes
- ✅ Highlight unique features
- ✅ Use appetizing language
- ✅ Include allergen information

**Don't:**
- ❌ Use all caps
- ❌ Include pricing (it's shown separately)
- ❌ Use excessive punctuation!!!
- ❌ Copy descriptions from other websites
- ❌ Leave descriptions bland or generic

**Good Example:**
```
Delicious vanilla sponge cake layered with fresh strawberries 
and light whipped cream. Perfect for birthdays and celebrations. 
Serves 10-12 people. Contains: eggs, dairy, gluten.
```

**Bad Example:**
```
cake with strawberries
```

### Regular Maintenance

**Weekly Tasks:**
- Review product catalog for accuracy
- Update out-of-stock items
- Check for broken image links
- Update seasonal offerings

**Monthly Tasks:**
- Review and update pricing
- Refresh product images if needed
- Add new seasonal products
- Remove discontinued items

**As Needed:**
- Update descriptions with new information
- Fix any errors reported by customers
- Add new products as bakery expands

---

## Image Hosting with Firebase Storage

### Recommended: Using Firebase Storage

Instead of external image URLs, you can use Firebase Storage for better reliability:

#### Setup Firebase Storage

1. **Firebase Console**
   - Go to your project in Firebase Console
   - Navigate to **Storage**
   - Click **Get Started**
   - Choose test mode for now (update security rules later)

2. **Upload Images**
   - Click **Upload File**
   - Select product image
   - Upload to a folder like `/products/`

3. **Get Image URL**
   - Click on uploaded image
   - Copy the **Download URL**
   - Use this URL in the Image URL field

4. **Security Rules** (for production):
   ```
   rules_version = '2';
   service firebase.storage {
     match /b/{bucket}/o {
       match /products/{allImages=**} {
         allow read: if true;  // Anyone can view
         allow write: if request.auth != null;  // Only authenticated users can upload
       }
     }
   }
   ```

#### Benefits of Firebase Storage
- ✅ Reliable hosting
- ✅ Integrated with your Firebase project
- ✅ Automatic CDN distribution
- ✅ Better security control
- ✅ No external dependencies

---

## Firebase Database Structure

### Understanding the Products Collection

Products are stored in Firestore with this structure:

```
products/
  └── {productId}/
      ├── name: "Chocolate Cake"
      ├── description: "Rich chocolate cake..."
      ├── price: 25.99
      ├── imageUrl: "https://..."
      ├── category: "Cakes"
      └── createdAt: timestamp
```

### Direct Database Access

For advanced operations, you can use Firebase Console:

1. Go to **Firestore Database**
2. Navigate to the `products` collection
3. You can:
   - View all products
   - Edit fields directly
   - Add products manually
   - Delete products
   - Export data

> [!NOTE]
> Direct database edits bypass app validation. Use the app interface when possible.

---

## Troubleshooting

### Common Admin Issues

#### Can't See Edit/Delete Buttons

**Problem**: Edit and Delete buttons don't appear on products

**Solution**:
- Verify your account has `isAdmin: true` in Firestore
- Log out and log back in
- Check Firebase Security Rules allow admin operations
- Ensure you're using the latest app version

---

#### Product Won't Save

**Problem**: Save button doesn't work or shows error

**Solutions**:
- Check all required fields are filled
- Verify price is a valid number (no letters or symbols)
- Ensure image URL is valid and accessible
- Check internet connection
- Look for error message at bottom of screen
- Try again after a few moments

---

#### Image Not Displaying

**Problem**: Product image shows as broken or doesn't load

**Solutions**:
- Verify the image URL is correct and publicly accessible
- Test the URL in a web browser
- Use a different image hosting service
- Check image file format (use JPG or PNG)
- Ensure image file size isn't too large (under 5MB recommended)
- Use Firebase Storage for more reliable hosting

---

#### Product Deleted by Mistake

**Problem**: Accidentally deleted a product

**Solution**:
- Unfortunately, deletion is permanent
- Check if you have a backup of product information
- Re-create the product manually
- **Prevention**: Always double-check before confirming deletion
- Consider implementing a "soft delete" feature (requires code modification)

---

#### Changes Not Reflecting

**Problem**: Updates made but users don't see changes

**Solutions**:
- Wait a few moments for changes to propagate
- Ask users to pull down to refresh the product list
- Check if changes were actually saved (refresh the admin view)
- Verify internet connection was stable during save
- Check Firestore Console to see if changes are in database

---

## Admin Security Rules

### Firestore Security Rules for Admins

Recommended security rules in Firestore:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Products collection
    match /products/{productId} {
      // Anyone can read products
      allow read: if true;
      
      // Only admins can write
      allow create, update, delete: if request.auth != null  
        && get(/databases/$(database)/documents/users/$(request.auth.uid)).data.isAdmin == true;
    }
    
    // Users collection
    match /users/{userId} {
      // Users can read their own data
      allow read: if request.auth != null && request.auth.uid == userId;
      
      // Users can update their own data (except isAdmin field)
      allow update: if request.auth != null  
        && request.auth.uid == userId
        && !request.resource.data.diff(resource.data).affectedKeys().hasAny(['isAdmin']);
      
      // Only allow creation during signup
      allow create: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

### Updating Security Rules

1. Go to Firebase Console
2. Navigate to **Firestore Database** → **Rules**
3. Replace existing rules with the above
4. Click **Publish**
5. Test in the app to ensure everything works

> [!IMPORTANT]
> Proper security rules prevent unauthorized users from adding, editing, or deleting products.

---

## Future Admin Features

Planned enhancements for admin functionality:

- 📊 **Analytics Dashboard**: View product performance metrics
- 📦 **Order Management**: View and process customer orders
- 📸 **Image Upload**: Direct image upload from the app
- 📁 **Bulk Import**: Import multiple products from CSV
- 🏷️ **Category Management**: Add/edit categories
- 👥 **User Management**: View and manage customer accounts
- 💬 **Customer Reviews**: Moderate product reviews
- 🔔 **Push Notifications**: Send announcements to customers
- 📈 **Sales Reports**: Track revenue and popular products

---

## Contact & Support

For admin-related questions or technical support:

**Development Team:**
- Email: dev@onlinebakery.com
- Documentation: See project README.md

**Firebase Support:**
- [Firebase Documentation](https://firebase.google.com/docs)
- [Firestore Guide](https://firebase.google.com/docs/firestore)
- [Firebase Storage Guide](https://firebase.google.com/docs/storage)

---

## Quick Reference

| Action | Steps |
|--------|-------|
| Add Product | Products Tab → ➕ Button → Fill Form → Save |
| Edit Product | Products Tab → Find Product → ✏️ Edit → Modify → Save |
| Delete Product | Products Tab → Find Product → 🗑️ Delete → Confirm |
| Upload Image | Firebase Console → Storage → Upload → Copy URL |
| Check Admin Status | Firebase Console → Firestore → users → Your User → Check isAdmin |

---

Thank you for managing the Online Bakery App! Your work helps customers discover and order amazing bakery products. 🍰👨‍💼
