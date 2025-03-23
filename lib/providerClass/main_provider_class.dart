import 'package:flutter/material.dart';
import 'package:shopapp/components/shoe_class.dart';

class ProviderClass extends ChangeNotifier {
  // All Shop Items
  List<ShoeClass> shoes = [
    ShoeClass(
      longDescription:
          'A timeless pair of sneakers crafted from premium leather, offering comfort and style for any occasion. Perfect for casual wear or a sporty look.',
      category: 'male',
      discount: '400',
      name: 'Air Max',
      price: '240',
      imagePath: [
        'lib/images/shoe2.jpg',
        'lib/images/shoe1.jpg',
        'lib/images/shoe3.jpg',
        'lib/images/shoe4.jpg',
      ],
      description: 'Nice Shoe',
    ),
    ShoeClass(
      longDescription:
          'Engineered for athletes, these running shoes feature lightweight construction and enhanced cushioning to support your every stride, helping you achieve your best performance.',
      category: 'male',
      discount: '450',
      name: 'Nike',
      price: '300',
      imagePath: [
        'lib/images/shoe1.jpg',
        'lib/images/shoe4.jpg',
        'lib/images/shoe3.jpg',
        'lib/images/shoe2.jpg',
      ],
      description: 'Awesome Mens Shoe',
    ),
    ShoeClass(
      longDescription:
          'Elevate your outfit with these sleek ankle boots, made with soft suede and a stylish heel. Ideal for both office wear and evening outings.',
      category: 'male',
      discount: '350',
      name: 'Jordan',
      price: '290',
      imagePath: [
        'lib/images/shoe3.jpg',
        'lib/images/shoe2.jpg',
        'lib/images/shoe4.jpg',
        'lib/images/shoe1.jpg',
      ],
      description: 'Good for Running',
    ),
    ShoeClass(
      longDescription:
          'Durable and weatherproof, these hiking boots are designed for outdoor enthusiasts. With a sturdy sole and supportive fit, they’ll keep your feet dry and comfortable on all adventures.',
      category: 'male',
      discount: '700',
      name: 'Adidas',
      price: '500',
      imagePath: [
        'lib/images/shoe4.jpg',
        'lib/images/shoe2.jpg',
        'lib/images/shoe1.jpg',
        'lib/images/shoe3.jpg',
      ],
      description: 'Quality material',
    ),
    ShoeClass(
      longDescription:
          'Sophisticated loafers with a polished finish, designed for a sharp look. Crafted from premium leather and featuring a padded insole for all-day comfort.',
      category: 'male',
      discount: '900',
      name: 'Timberland',
      price: '700',
      imagePath: [
        'lib/images/shoe1.jpg',
        'lib/images/shoe2.jpg',
        'lib/images/shoe3.jpg',
        'lib/images/shoe4.jpg',
      ],
      description: 'Perfect Blend with good Texture',
    ),
    ShoeClass(
      longDescription:
          'These slip-on sneakers combine convenience with style. Featuring a breathable upper and flexible sole, they’re perfect for an active, on-the-go lifestyle.',
      category: 'male',
      discount: '200',
      name: 'Columbia',
      price: '120',
      imagePath: [
        'lib/images/shoe2.jpg',
        'lib/images/shoe4.jpg',
        'lib/images/shoe3.jpg',
        'lib/images/shoe1.jpg',
      ],
      description: 'Latest Trending Shoe',
    ),

    //
    //
    // Female Shoes
    ShoeClass(
      longDescription:
          "Step into elegance with these stunning high heels. Featuring a sleek pointed toe and cushioned insole, they offer style and comfort for any occasion.",
      category: 'female',
      discount: '500',
      name: 'Ariana Heels',
      price: '320',
      imagePath: [
        'lib/images/female/2.png',
        'lib/images/female/3.png',
        'lib/images/female/4.png',
        'lib/images/female/5.png',
      ],
      description: 'Elegant High Heels',
    ),
    ShoeClass(
      longDescription:
          'Designed for all-day wear, these stylish flats feature a soft insole and flexible design, perfect for work, shopping, or casual outings.',
      category: 'female',
      discount: '350',
      name: 'Bella Flats',
      price: '200',
      imagePath: [
        'lib/images/female/6.png',
        'lib/images/female/5.png',
        'lib/images/female/4.png',
        'lib/images/female/3.png',
      ],
      description: 'Chic and Comfortable Flats',
    ),
    ShoeClass(
      longDescription:
          'Perfect for summer, these lightweight sandals offer a breathable design and a cushioned footbed, ensuring comfort with every step.',
      category: 'female',
      discount: '420',
      name: 'Crystal Sandals',
      price: '350',
      imagePath: [
        'lib/images/female/4.png',
        'lib/images/female/2.png',
        'lib/images/female/5.png',
        'lib/images/female/6.png',
      ],
      description: 'Trendy and Lightweight Sandals',
    ),
    ShoeClass(
      longDescription:
          'These sneakers blend style with functionality, featuring a trendy design and durable sole, making them perfect for daily wear.',
      category: 'female',
      discount: '280',
      name: 'Diana Sneakers',
      price: '190',
      imagePath: [
        'lib/images/female/3.png',
        'lib/images/female/6.png',
        'lib/images/female/2.png',
        'lib/images/female/5.png',
      ],
      description: 'Fashionable Everyday Sneakers',
    ),
    ShoeClass(
      longDescription:
          'With a perfect blend of height and comfort, these wedges offer excellent support, making them ideal for both casual and dressy occasions.',
      category: 'female',
      discount: '520',
      name: 'Emma Wedges',
      price: '465',
      imagePath: [
        'lib/images/female/5.png',
        'lib/images/female/6.png',
        'lib/images/female/4.png',
        'lib/images/female/2.png',
      ],
      description: 'Stylish and Supportive Wedges',
    ),
  ];

  ProviderClass() {
    shoes.sort((a, b) => a.name.compareTo(b.name));
  }

  // Return Entire Items
  List<ShoeClass> allItems = [];
  List<ShoeClass> allStorItems() {
    allItems.clear();
    for (var item in shoes) {
      allItems.add(item);
    }
    return allItems;
  }

  // All Male Items
  List<ShoeClass> maleItems = [];
  List<ShoeClass> allMaleItems() {
    maleItems.clear();
    for (var shoe in shoes) {
      if (shoe.category == 'male') {
        maleItems.add(shoe);
      }
    }
    return maleItems;
  }

  // All Female Items
  List<ShoeClass> femaleItems = [];
  List<ShoeClass> allFemaleItems() {
    femaleItems.clear();
    for (var shoe in shoes) {
      if (shoe.category == 'female') {
        femaleItems.add(shoe);
      }
    }
    return femaleItems;
  }

  // All Cart Items
  final List<ShoeClass> _cart = [];

  // Get all Cart items
  List<ShoeClass> get cart => _cart;

  // Add Item to Cart
  void addToCart(item) {
    cart.add(item);
    notifyListeners();
  }

  //Remove Item from Cart
  void removeFromCart(item) {
    cart.remove(item);
    notifyListeners();
  }

  int currentPage = 0;

  void changeCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
