// Static product categories for grocery/bakery/eatable items
export const categories = [
  {
    id: 'fruits-vegetables',
    name: 'Fruits & Vegetables',
    image: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=400',
    description: 'Fresh, organic fruits and vegetables',
    itemCount: 48,
  },
  {
    id: 'dairy-eggs',
    name: 'Dairy & Eggs',
    image: 'https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=400',
    description: 'Farm-fresh dairy products and eggs',
    itemCount: 32,
  },
  {
    id: 'bakery',
    name: 'Bakery',
    image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
    description: 'Freshly baked breads, cakes, and pastries',
    itemCount: 28,
  },
  {
    id: 'meat-seafood',
    name: 'Meat & Seafood',
    image: 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400',
    description: 'Premium quality meats and fresh seafood',
    itemCount: 36,
  },
  {
    id: 'snacks',
    name: 'Snacks & Chips',
    image: 'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=400',
    description: 'Tasty snacks for every craving',
    itemCount: 44,
  },
  {
    id: 'beverages',
    name: 'Beverages',
    image: 'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400',
    description: 'Refreshing drinks and juices',
    itemCount: 38,
  },
  {
    id: 'frozen-foods',
    name: 'Frozen Foods',
    image: 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=400',
    description: 'Convenient frozen meals and treats',
    itemCount: 30,
  },
  {
    id: 'pantry',
    name: 'Pantry Staples',
    image: 'https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?w=400',
    description: 'Essential cooking ingredients and staples',
    itemCount: 52,
  },
  {
    id: 'deli',
    name: 'Deli & Prepared',
    image: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?w=400',
    description: 'Ready-to-eat deli meats and prepared foods',
    itemCount: 24,
  },
  {
    id: 'organic',
    name: 'Organic & Natural',
    image: 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=400',
    description: 'Certified organic and natural products',
    itemCount: 40,
  },
];

// Full product list
export const products = [
  // Fruits & Vegetables
  { id: 'p001', name: 'Organic Bananas', category: 'fruits-vegetables', price: 0.79, unit: 'lb', image: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300', rating: 4.5, reviews: 234, inStock: true, isOrganic: true, description: 'Sweet and perfectly ripe organic bananas.' },
  { id: 'p002', name: 'Fresh Strawberries', category: 'fruits-vegetables', price: 3.99, unit: '16 oz', image: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300', rating: 4.7, reviews: 189, inStock: true, isOrganic: false, description: 'Juicy, red strawberries perfect for snacking.' },
  { id: 'p003', name: 'Avocados', category: 'fruits-vegetables', price: 1.49, unit: 'each', image: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300', rating: 4.3, reviews: 312, inStock: true, isOrganic: false, description: 'Ripe Hass avocados, ready to eat.' },
  { id: 'p004', name: 'Baby Spinach', category: 'fruits-vegetables', price: 3.49, unit: '5 oz', image: 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=300', rating: 4.6, reviews: 156, inStock: true, isOrganic: true, description: 'Tender organic baby spinach leaves.' },
  { id: 'p005', name: 'Roma Tomatoes', category: 'fruits-vegetables', price: 1.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=300', rating: 4.4, reviews: 201, inStock: true, isOrganic: false, description: 'Firm, flavorful Roma tomatoes.' },
  { id: 'p006', name: 'Blueberries', category: 'fruits-vegetables', price: 4.49, unit: '6 oz', image: 'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300', rating: 4.8, reviews: 278, inStock: true, isOrganic: true, description: 'Plump, sweet organic blueberries.' },
  { id: 'p007', name: 'Sweet Corn', category: 'fruits-vegetables', price: 0.69, unit: 'each', image: 'https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=300', rating: 4.2, reviews: 145, inStock: true, isOrganic: false, description: 'Fresh sweet corn on the cob.' },
  { id: 'p008', name: 'Red Bell Peppers', category: 'fruits-vegetables', price: 1.29, unit: 'each', image: 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=300', rating: 4.5, reviews: 167, inStock: true, isOrganic: false, description: 'Crisp, sweet red bell peppers.' },

  // Dairy & Eggs
  { id: 'p009', name: 'Whole Milk', category: 'dairy-eggs', price: 4.29, unit: 'gallon', image: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300', rating: 4.6, reviews: 445, inStock: true, isOrganic: false, description: 'Fresh whole milk, vitamin D enriched.' },
  { id: 'p010', name: 'Large Eggs', category: 'dairy-eggs', price: 3.99, unit: 'dozen', image: 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300', rating: 4.7, reviews: 512, inStock: true, isOrganic: false, description: 'Farm-fresh large grade A eggs.' },
  { id: 'p011', name: 'Greek Yogurt', category: 'dairy-eggs', price: 5.49, unit: '32 oz', image: 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300', rating: 4.5, reviews: 298, inStock: true, isOrganic: false, description: 'Creamy plain Greek yogurt, high protein.' },
  { id: 'p012', name: 'Cheddar Cheese', category: 'dairy-eggs', price: 4.99, unit: '8 oz', image: 'https://images.unsplash.com/photo-1618164436241-4473940d1f5c?w=300', rating: 4.4, reviews: 234, inStock: true, isOrganic: false, description: 'Sharp cheddar cheese block.' },
  { id: 'p013', name: 'Butter Unsalted', category: 'dairy-eggs', price: 4.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=300', rating: 4.6, reviews: 189, inStock: true, isOrganic: false, description: 'Sweet cream unsalted butter.' },
  { id: 'p014', name: 'Organic Milk', category: 'dairy-eggs', price: 6.49, unit: 'half gallon', image: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=300', rating: 4.8, reviews: 167, inStock: true, isOrganic: true, description: 'Certified organic whole milk.' },

  // Bakery
  { id: 'p015', name: 'Sourdough Bread', category: 'bakery', price: 4.99, unit: 'loaf', image: 'https://images.unsplash.com/photo-1595535873420-a599195b3f4a?w=300', rating: 4.8, reviews: 356, inStock: true, isOrganic: false, description: 'Artisan sourdough bread, freshly baked.' },
  { id: 'p016', name: 'Croissants', category: 'bakery', price: 5.99, unit: '4 ct', image: 'https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=300', rating: 4.7, reviews: 267, inStock: true, isOrganic: false, description: 'Buttery, flaky French croissants.' },
  { id: 'p017', name: 'Whole Wheat Bread', category: 'bakery', price: 3.49, unit: 'loaf', image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300', rating: 4.3, reviews: 198, inStock: true, isOrganic: false, description: '100% whole wheat sliced bread.' },
  { id: 'p018', name: 'Chocolate Chip Cookies', category: 'bakery', price: 4.49, unit: '12 ct', image: 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=300', rating: 4.9, reviews: 423, inStock: true, isOrganic: false, description: 'Soft-baked chocolate chip cookies.' },
  { id: 'p019', name: 'Blueberry Muffins', category: 'bakery', price: 5.49, unit: '4 ct', image: 'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=300', rating: 4.6, reviews: 187, inStock: true, isOrganic: false, description: 'Moist blueberry muffins with streusel.' },
  { id: 'p020', name: 'Bagels Everything', category: 'bakery', price: 4.29, unit: '6 ct', image: 'https://images.unsplash.com/photo-1603532648955-039310d9ed75?w=300', rating: 4.5, reviews: 234, inStock: true, isOrganic: false, description: 'New York style everything bagels.' },
  { id: 'p021', name: 'Cinnamon Rolls', category: 'bakery', price: 6.99, unit: '6 ct', image: 'https://images.unsplash.com/photo-1509365390695-33aee754301f?w=300', rating: 4.8, reviews: 298, inStock: true, isOrganic: false, description: 'Warm cinnamon rolls with cream cheese frosting.' },

  // Meat & Seafood
  { id: 'p022', name: 'Chicken Breast', category: 'meat-seafood', price: 6.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=300', rating: 4.5, reviews: 312, inStock: true, isOrganic: false, description: 'Boneless, skinless chicken breast.' },
  { id: 'p023', name: 'Ground Beef 80/20', category: 'meat-seafood', price: 5.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1588347818036-558601350947?w=300', rating: 4.4, reviews: 278, inStock: true, isOrganic: false, description: 'Fresh ground beef, 80% lean.' },
  { id: 'p024', name: 'Atlantic Salmon', category: 'meat-seafood', price: 9.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1574781330855-d0db8cc6a79c?w=300', rating: 4.7, reviews: 198, inStock: true, isOrganic: false, description: 'Fresh Atlantic salmon fillet.' },
  { id: 'p025', name: 'Bacon Thick Cut', category: 'meat-seafood', price: 7.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300', rating: 4.6, reviews: 356, inStock: true, isOrganic: false, description: 'Hickory smoked thick-cut bacon.' },
  { id: 'p026', name: 'Shrimp Large', category: 'meat-seafood', price: 11.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=300', rating: 4.5, reviews: 145, inStock: true, isOrganic: false, description: 'Wild-caught large shrimp, peeled.' },

  // Snacks
  { id: 'p027', name: 'Tortilla Chips', category: 'snacks', price: 3.99, unit: '13 oz', image: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=300', rating: 4.4, reviews: 234, inStock: true, isOrganic: false, description: 'Crispy restaurant-style tortilla chips.' },
  { id: 'p028', name: 'Mixed Nuts', category: 'snacks', price: 8.99, unit: '16 oz', image: 'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?w=300', rating: 4.7, reviews: 189, inStock: true, isOrganic: false, description: 'Deluxe mixed nuts, roasted and salted.' },
  { id: 'p029', name: 'Hummus Classic', category: 'snacks', price: 4.49, unit: '10 oz', image: 'https://images.unsplash.com/photo-1577805947697-89e18249d767?w=300', rating: 4.5, reviews: 156, inStock: true, isOrganic: false, description: 'Smooth classic hummus dip.' },
  { id: 'p030', name: 'Granola Bars', category: 'snacks', price: 3.79, unit: '6 ct', image: 'https://images.unsplash.com/photo-1590080875515-8a3a8dc5735e?w=300', rating: 4.3, reviews: 278, inStock: true, isOrganic: false, description: 'Chewy chocolate chip granola bars.' },
  { id: 'p031', name: 'Trail Mix', category: 'snacks', price: 6.49, unit: '12 oz', image: 'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?w=300', rating: 4.6, reviews: 167, inStock: true, isOrganic: false, description: 'Mountain trail mix with dried fruits.' },

  // Beverages
  { id: 'p032', name: 'Orange Juice', category: 'beverages', price: 4.99, unit: '52 oz', image: 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=300', rating: 4.6, reviews: 345, inStock: true, isOrganic: false, description: 'Fresh squeezed, not from concentrate.' },
  { id: 'p033', name: 'Sparkling Water', category: 'beverages', price: 5.49, unit: '12 pk', image: 'https://images.unsplash.com/photo-1523362628745-0c100150b504?w=300', rating: 4.4, reviews: 234, inStock: true, isOrganic: false, description: 'Lime flavored sparkling water.' },
  { id: 'p034', name: 'Almond Milk', category: 'beverages', price: 3.99, unit: '64 oz', image: 'https://images.unsplash.com/photo-1600788886242-5c96aabe3757?w=300', rating: 4.5, reviews: 198, inStock: true, isOrganic: true, description: 'Unsweetened vanilla almond milk.' },
  { id: 'p035', name: 'Cold Brew Coffee', category: 'beverages', price: 6.99, unit: '32 oz', image: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=300', rating: 4.7, reviews: 267, inStock: true, isOrganic: false, description: 'Smooth, bold cold brew concentrate.' },
  { id: 'p036', name: 'Green Tea', category: 'beverages', price: 3.49, unit: '20 ct', image: 'https://images.unsplash.com/photo-1556881286-fc6915169721?w=300', rating: 4.3, reviews: 145, inStock: true, isOrganic: true, description: 'Organic green tea bags.' },

  // Frozen Foods
  { id: 'p037', name: 'Frozen Pizza Margherita', category: 'frozen-foods', price: 6.99, unit: 'each', image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=300', rating: 4.4, reviews: 234, inStock: true, isOrganic: false, description: 'Stone-fired margherita pizza.' },
  { id: 'p038', name: 'Ice Cream Vanilla', category: 'frozen-foods', price: 5.99, unit: 'pint', image: 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=300', rating: 4.8, reviews: 389, inStock: true, isOrganic: false, description: 'Premium vanilla bean ice cream.' },
  { id: 'p039', name: 'Frozen Berries Mix', category: 'frozen-foods', price: 4.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1563746098251-d35aef196e83?w=300', rating: 4.6, reviews: 178, inStock: true, isOrganic: true, description: 'Organic mixed berry blend.' },
  { id: 'p040', name: 'Veggie Burgers', category: 'frozen-foods', price: 5.99, unit: '4 ct', image: 'https://images.unsplash.com/photo-1520072959219-c595e76c6b84?w=300', rating: 4.3, reviews: 156, inStock: true, isOrganic: false, description: 'Plant-based veggie burger patties.' },

  // Pantry
  { id: 'p041', name: 'Extra Virgin Olive Oil', category: 'pantry', price: 8.99, unit: '17 oz', image: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', rating: 4.7, reviews: 312, inStock: true, isOrganic: true, description: 'Cold-pressed extra virgin olive oil.' },
  { id: 'p042', name: 'Pasta Spaghetti', category: 'pantry', price: 1.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=300', rating: 4.5, reviews: 456, inStock: true, isOrganic: false, description: 'Classic Italian spaghetti pasta.' },
  { id: 'p043', name: 'Marinara Sauce', category: 'pantry', price: 3.99, unit: '24 oz', image: 'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?w=300', rating: 4.4, reviews: 289, inStock: true, isOrganic: false, description: 'Traditional marinara pasta sauce.' },
  { id: 'p044', name: 'Jasmine Rice', category: 'pantry', price: 4.99, unit: '2 lb', image: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=300', rating: 4.6, reviews: 234, inStock: true, isOrganic: false, description: 'Premium Thai jasmine rice.' },
  { id: 'p045', name: 'Peanut Butter', category: 'pantry', price: 4.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1598511726623-d2e9996892f0?w=300', rating: 4.7, reviews: 378, inStock: true, isOrganic: false, description: 'Creamy peanut butter, no stir.' },
  { id: 'p046', name: 'Honey Raw', category: 'pantry', price: 7.99, unit: '12 oz', image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=300', rating: 4.8, reviews: 198, inStock: true, isOrganic: true, description: 'Raw, unfiltered wildflower honey.' },
  { id: 'p047', name: 'Canned Tomatoes', category: 'pantry', price: 1.99, unit: '28 oz', image: 'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=300', rating: 4.3, reviews: 267, inStock: true, isOrganic: false, description: 'Whole peeled San Marzano tomatoes.' },
  { id: 'p048', name: 'Black Beans', category: 'pantry', price: 1.29, unit: '15 oz', image: 'https://images.unsplash.com/photo-1551462147-37885acc36f1?w=300', rating: 4.4, reviews: 189, inStock: true, isOrganic: false, description: 'Seasoned black beans, ready to serve.' },

  // Deli
  { id: 'p049', name: 'Turkey Breast Deli', category: 'deli', price: 8.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1553909489-cd47e0907980?w=300', rating: 4.5, reviews: 167, inStock: true, isOrganic: false, description: 'Oven-roasted turkey breast sliced.' },
  { id: 'p050', name: 'Rotisserie Chicken', category: 'deli', price: 7.99, unit: 'each', image: 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=300', rating: 4.8, reviews: 456, inStock: true, isOrganic: false, description: 'Hot, juicy rotisserie chicken.' },

  // Organic
  { id: 'p051', name: 'Organic Quinoa', category: 'organic', price: 5.99, unit: '16 oz', image: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=300', rating: 4.6, reviews: 178, inStock: true, isOrganic: true, description: 'Pre-washed organic white quinoa.' },
  { id: 'p052', name: 'Organic Coconut Oil', category: 'organic', price: 7.49, unit: '14 oz', image: 'https://images.unsplash.com/photo-1526947425960-945c6e72858f?w=300', rating: 4.7, reviews: 234, inStock: true, isOrganic: true, description: 'Virgin organic coconut oil.' },

  // Additional Fruits & Vegetables
  { id: 'p053', name: 'Fuji Apples', category: 'fruits-vegetables', price: 1.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300', rating: 4.6, reviews: 312, inStock: true, isOrganic: false, description: 'Crisp, sweet Fuji apples.' },
  { id: 'p054', name: 'Seedless Grapes', category: 'fruits-vegetables', price: 3.49, unit: 'lb', image: 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=300', rating: 4.5, reviews: 198, inStock: true, isOrganic: false, description: 'Sweet red seedless grapes.' },
  { id: 'p055', name: 'Broccoli Crown', category: 'fruits-vegetables', price: 2.49, unit: 'each', image: 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=300', rating: 4.3, reviews: 167, inStock: true, isOrganic: false, description: 'Fresh broccoli crown.' },
  { id: 'p056', name: 'Red Onions', category: 'fruits-vegetables', price: 1.29, unit: 'lb', image: 'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?w=300', rating: 4.2, reviews: 134, inStock: true, isOrganic: false, description: 'Fresh red onions, mild flavor.' },
  { id: 'p057', name: 'Organic Kale', category: 'fruits-vegetables', price: 2.99, unit: 'bunch', image: 'https://images.unsplash.com/photo-1524179091875-bf99a9a6af57?w=300', rating: 4.4, reviews: 145, inStock: true, isOrganic: true, description: 'Organic curly kale, nutrient-rich.' },

  // Additional Dairy & Eggs
  { id: 'p058', name: 'Cream Cheese', category: 'dairy-eggs', price: 3.49, unit: '8 oz', image: 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=300', rating: 4.5, reviews: 201, inStock: true, isOrganic: false, description: 'Philadelphia-style cream cheese.' },
  { id: 'p059', name: 'Sour Cream', category: 'dairy-eggs', price: 2.79, unit: '16 oz', image: 'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=300', rating: 4.3, reviews: 156, inStock: true, isOrganic: false, description: 'Rich and creamy sour cream.' },

  // Additional Meat & Seafood
  { id: 'p060', name: 'Pork Chops', category: 'meat-seafood', price: 5.49, unit: 'lb', image: 'https://images.unsplash.com/photo-1588347818036-558601350947?w=300', rating: 4.4, reviews: 189, inStock: true, isOrganic: false, description: 'Center-cut boneless pork chops.' },
  { id: 'p061', name: 'Turkey Ground', category: 'meat-seafood', price: 5.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?w=300', rating: 4.3, reviews: 145, inStock: true, isOrganic: false, description: 'Lean ground turkey, 93% lean.' },

  // Additional Beverages
  { id: 'p062', name: 'Coconut Water', category: 'beverages', price: 2.99, unit: '16 oz', image: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=300', rating: 4.5, reviews: 198, inStock: true, isOrganic: true, description: 'Pure natural coconut water.' },
  { id: 'p063', name: 'Kombucha Ginger', category: 'beverages', price: 3.99, unit: '16 oz', image: 'https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?w=300', rating: 4.6, reviews: 167, inStock: true, isOrganic: true, description: 'Organic ginger kombucha, probiotic.' },

  // Additional Frozen Foods
  { id: 'p064', name: 'Frozen Waffles', category: 'frozen-foods', price: 3.49, unit: '10 ct', image: 'https://images.unsplash.com/photo-1568051243851-f9b136146e97?w=300', rating: 4.2, reviews: 234, inStock: true, isOrganic: false, description: 'Crispy homestyle frozen waffles.' },
  { id: 'p065', name: 'Frozen Edamame', category: 'frozen-foods', price: 2.99, unit: '12 oz', image: 'https://images.unsplash.com/photo-1564834724105-918b73d1b8e0?w=300', rating: 4.5, reviews: 156, inStock: true, isOrganic: false, description: 'Shelled edamame, ready to microwave.' },

  // Additional Pantry
  { id: 'p066', name: 'Oatmeal Packets', category: 'pantry', price: 3.99, unit: '10 ct', image: 'https://images.unsplash.com/photo-1517673400267-0251440c45dc?w=300', rating: 4.4, reviews: 289, inStock: true, isOrganic: false, description: 'Instant oatmeal variety pack.' },
  { id: 'p067', name: 'Pancake Mix', category: 'pantry', price: 3.49, unit: '32 oz', image: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=300', rating: 4.6, reviews: 312, inStock: true, isOrganic: false, description: 'Buttermilk pancake and waffle mix.' },

  // Additional Deli
  { id: 'p068', name: 'Ham Sliced Honey', category: 'deli', price: 7.49, unit: 'lb', image: 'https://images.unsplash.com/photo-1524438418049-ab2acb7aa48f?w=300', rating: 4.4, reviews: 178, inStock: true, isOrganic: false, description: 'Honey-glazed sliced deli ham.' },
  { id: 'p069', name: 'Macaroni Salad', category: 'deli', price: 4.99, unit: 'lb', image: 'https://images.unsplash.com/photo-1580013759032-7e14eb47d4e8?w=300', rating: 4.2, reviews: 134, inStock: true, isOrganic: false, description: 'Classic creamy macaroni salad.' },

  // Additional Organic
  { id: 'p070', name: 'Organic Chia Seeds', category: 'organic', price: 6.99, unit: '12 oz', image: 'https://images.unsplash.com/photo-1514986888952-8cd320577b68?w=300', rating: 4.7, reviews: 201, inStock: true, isOrganic: true, description: 'Organic chia seeds, superfood.' },

  // Edge cases: out of stock
  { id: 'p071', name: 'Wagyu Beef Steak', category: 'meat-seafood', price: 49.99, unit: '8 oz', image: 'https://images.unsplash.com/photo-1558030006-450675393462?w=300', rating: 4.9, reviews: 89, inStock: false, isOrganic: false, description: 'Premium A5 Wagyu beef steak.' },
  { id: 'p072', name: 'Truffle Oil', category: 'pantry', price: 14.99, unit: '8 oz', image: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', rating: 4.8, reviews: 67, inStock: false, isOrganic: false, description: 'Black truffle infused oil.' },
];

// Sponsored products (ads/promotions)
export const sponsoredProducts = [
  { id: 'sp001', name: 'O Organics Almond Butter', price: 6.99, unit: '12 oz', image: 'https://images.unsplash.com/photo-1598511726623-d2e9996892f0?w=300', sponsor: 'O Organics', tagline: 'Try our new recipe!', relatedCategories: ['pantry', 'organic'] },
  { id: 'sp002', name: 'Signature SELECT Pasta Sauce', price: 2.99, unit: '24 oz', image: 'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?w=300', sponsor: 'Signature SELECT', tagline: 'Quality at a great price', relatedCategories: ['pantry'] },
  { id: 'sp003', name: 'Lucerne Yogurt Variety', price: 4.99, unit: '12 ct', image: 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300', sponsor: 'Lucerne', tagline: 'New flavors available!', relatedCategories: ['dairy-eggs'] },
  { id: 'sp004', name: 'Open Nature Granola', price: 4.49, unit: '12 oz', image: 'https://images.unsplash.com/photo-1558745010-b0eda5c27a70?w=300', sponsor: 'Open Nature', tagline: 'Fuel your morning', relatedCategories: ['snacks', 'organic'] },
  { id: 'sp005', name: 'Signature Farms Avocados', price: 3.99, unit: '4 ct', image: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300', sponsor: 'Signature Farms', tagline: 'Always ripe, always fresh', relatedCategories: ['fruits-vegetables'] },
  { id: 'sp006', name: 'O Organics Frozen Fruit', price: 5.49, unit: '16 oz', image: 'https://images.unsplash.com/photo-1563746098251-d35aef196e83?w=300', sponsor: 'O Organics', tagline: 'Perfect for smoothies', relatedCategories: ['frozen-foods', 'organic'] },
  { id: 'sp007', name: 'Signature SELECT Chips', price: 2.49, unit: '10 oz', image: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=300', sponsor: 'Signature SELECT', tagline: 'Crunch time!', relatedCategories: ['snacks'] },
  { id: 'sp008', name: 'Lucerne Fresh Milk', price: 3.99, unit: 'half gallon', image: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300', sponsor: 'Lucerne', tagline: 'Farm fresh quality', relatedCategories: ['dairy-eggs', 'beverages'] },
  { id: 'sp009', name: 'Open Nature Cold Brew', price: 5.99, unit: '32 oz', image: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=300', sponsor: 'Open Nature', tagline: 'Smooth & bold', relatedCategories: ['beverages'] },
  { id: 'sp010', name: 'Signature Farms Berries', price: 4.99, unit: '12 oz', image: 'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300', sponsor: 'Signature Farms', tagline: 'Peak of freshness', relatedCategories: ['fruits-vegetables'] },
];

// SmartCart data - simulating 3 months of purchase patterns
export const smartCartData = {
  lastUpdated: '2026-03-26',
  basedOnMonths: 3,
  confidence: 0.87,
  items: [
    { productId: 'p009', quantity: 2, frequency: 'weekly', lastPurchased: '2026-03-22', predictedNeed: '2026-03-29' },
    { productId: 'p010', quantity: 1, frequency: 'weekly', lastPurchased: '2026-03-22', predictedNeed: '2026-03-29' },
    { productId: 'p001', quantity: 3, frequency: 'weekly', lastPurchased: '2026-03-20', predictedNeed: '2026-03-27' },
    { productId: 'p015', quantity: 1, frequency: 'weekly', lastPurchased: '2026-03-21', predictedNeed: '2026-03-28' },
    { productId: 'p042', quantity: 2, frequency: 'bi-weekly', lastPurchased: '2026-03-15', predictedNeed: '2026-03-29' },
    { productId: 'p043', quantity: 1, frequency: 'bi-weekly', lastPurchased: '2026-03-15', predictedNeed: '2026-03-29' },
    { productId: 'p022', quantity: 2, frequency: 'weekly', lastPurchased: '2026-03-22', predictedNeed: '2026-03-29' },
    { productId: 'p032', quantity: 1, frequency: 'weekly', lastPurchased: '2026-03-21', predictedNeed: '2026-03-28' },
    { productId: 'p004', quantity: 1, frequency: 'weekly', lastPurchased: '2026-03-20', predictedNeed: '2026-03-27' },
    { productId: 'p011', quantity: 1, frequency: 'bi-weekly', lastPurchased: '2026-03-12', predictedNeed: '2026-03-26' },
    { productId: 'p044', quantity: 1, frequency: 'monthly', lastPurchased: '2026-03-01', predictedNeed: '2026-04-01' },
    { productId: 'p045', quantity: 1, frequency: 'monthly', lastPurchased: '2026-03-05', predictedNeed: '2026-04-05' },
    { productId: 'p018', quantity: 1, frequency: 'bi-weekly', lastPurchased: '2026-03-14', predictedNeed: '2026-03-28' },
    { productId: 'p003', quantity: 4, frequency: 'weekly', lastPurchased: '2026-03-22', predictedNeed: '2026-03-29' },
    { productId: 'p013', quantity: 1, frequency: 'bi-weekly', lastPurchased: '2026-03-10', predictedNeed: '2026-03-24' },
  ],
};

// Banner/promotional data
export const banners = [
  {
    id: 'b1',
    title: 'Fresh Spring Savings',
    subtitle: 'Up to 30% off seasonal produce',
    ctaText: 'Shop Now',
    ctaLink: '/category/fruits-vegetables',
    bgColor: 'linear-gradient(135deg, #2E7D32 0%, #66BB6A 100%)',
    image: 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=800',
  },
  {
    id: 'b2',
    title: 'Bakery Fresh Daily',
    subtitle: 'Artisan breads baked in-store every morning',
    ctaText: 'Explore Bakery',
    ctaLink: '/category/bakery',
    bgColor: 'linear-gradient(135deg, #E65100 0%, #FF9800 100%)',
    image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800',
  },
  {
    id: 'b3',
    title: 'Organic Week',
    subtitle: 'Extra 15% off all organic products',
    ctaText: 'Go Organic',
    ctaLink: '/category/organic',
    bgColor: 'linear-gradient(135deg, #1B5E20 0%, #4CAF50 100%)',
    image: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=800',
  },
];

// Deal of the day items
export const dealsOfDay = [
  { productId: 'p050', originalPrice: 9.99, salePrice: 7.99, discount: 20, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p038', originalPrice: 7.99, salePrice: 5.99, discount: 25, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p006', originalPrice: 5.99, salePrice: 4.49, discount: 25, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p024', originalPrice: 12.99, salePrice: 9.99, discount: 23, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p041', originalPrice: 11.99, salePrice: 8.99, discount: 25, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p017', originalPrice: 4.49, salePrice: 2.99, discount: 33, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p034', originalPrice: 5.49, salePrice: 3.99, discount: 27, endsAt: '2026-03-27T00:00:00' },
  { productId: 'p053', originalPrice: 2.99, salePrice: 1.49, discount: 50, endsAt: '2026-03-27T00:00:00' },
];

// Mock user data
export const mockUser = {
  id: 'u001',
  firstName: 'Sarah',
  lastName: 'Johnson',
  email: 'sarah.johnson@email.com',
  avatar: null,
  memberSince: '2024-01-15',
  loyaltyPoints: 2450,
  tier: 'Gold',
  preferredStore: 'Albertsons #1234 - Downtown',
};

// Order history for user
export const orderHistory = [
  {
    id: 'ord001',
    date: '2026-03-22',
    items: [
      { productId: 'p009', quantity: 2, priceAtPurchase: 4.29 },
      { productId: 'p010', quantity: 1, priceAtPurchase: 3.99 },
      { productId: 'p001', quantity: 3, priceAtPurchase: 0.79 },
      { productId: 'p022', quantity: 2, priceAtPurchase: 6.99 },
      { productId: 'p015', quantity: 1, priceAtPurchase: 4.99 },
    ],
    total: 31.31,
    status: 'completed',
  },
  {
    id: 'ord002',
    date: '2026-03-15',
    items: [
      { productId: 'p042', quantity: 2, priceAtPurchase: 1.49 },
      { productId: 'p043', quantity: 1, priceAtPurchase: 3.99 },
      { productId: 'p003', quantity: 4, priceAtPurchase: 1.49 },
      { productId: 'p032', quantity: 1, priceAtPurchase: 4.99 },
    ],
    total: 17.93,
    status: 'completed',
  },
  {
    id: 'ord003',
    date: '2026-03-08',
    items: [
      { productId: 'p009', quantity: 1, priceAtPurchase: 4.29 },
      { productId: 'p004', quantity: 2, priceAtPurchase: 3.49 },
      { productId: 'p011', quantity: 1, priceAtPurchase: 5.49 },
      { productId: 'p018', quantity: 1, priceAtPurchase: 4.49 },
    ],
    total: 21.25,
    status: 'completed',
  },
];
