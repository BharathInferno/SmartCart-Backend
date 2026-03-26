-- =============================================
-- Seed data from mockData.js
-- =============================================

-- Categories
INSERT INTO categories (id, name, image, description, item_count) VALUES
(1, 'Fruits & Vegetables', 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=400', 'Fresh, organic fruits and vegetables', 48),
(2, 'Dairy & Eggs', 'https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=400', 'Farm-fresh dairy products and eggs', 32),
(3, 'Bakery', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400', 'Freshly baked breads, cakes, and pastries', 28),
(4, 'Meat & Seafood', 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400', 'Premium quality meats and fresh seafood', 36),
(5, 'Snacks & Chips', 'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=400', 'Tasty snacks for every craving', 44),
(6, 'Beverages', 'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400', 'Refreshing drinks and juices', 38),
(7, 'Frozen Foods', 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=400', 'Convenient frozen meals and treats', 30),
(8, 'Pantry Staples', 'https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?w=400', 'Essential cooking ingredients and staples', 52),
(9, 'Deli & Prepared', 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?w=400', 'Ready-to-eat deli meats and prepared foods', 24),
(10, 'Organic & Natural', 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=400', 'Certified organic and natural products', 40);
SELECT setval('categories_id_seq', 10);

-- Products (p001=1 ... p072=72)
INSERT INTO products (id, name, category, price, unit, image, rating, reviews, in_stock, is_organic, description) VALUES
-- Fruits & Vegetables
(1,  'Organic Bananas',       'fruits-vegetables', 0.79,  'lb',        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300', 4.5, 234, true,  true,  'Sweet and perfectly ripe organic bananas.'),
(2,  'Fresh Strawberries',    'fruits-vegetables', 3.99,  '16 oz',     'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300', 4.7, 189, true,  false, 'Juicy, red strawberries perfect for snacking.'),
(3,  'Avocados',              'fruits-vegetables', 1.49,  'each',      'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300', 4.3, 312, true,  false, 'Ripe Hass avocados, ready to eat.'),
(4,  'Baby Spinach',          'fruits-vegetables', 3.49,  '5 oz',      'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=300', 4.6, 156, true,  true,  'Tender organic baby spinach leaves.'),
(5,  'Roma Tomatoes',         'fruits-vegetables', 1.99,  'lb',        'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=300', 4.4, 201, true,  false, 'Firm, flavorful Roma tomatoes.'),
(6,  'Blueberries',           'fruits-vegetables', 4.49,  '6 oz',      'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300', 4.8, 278, true,  true,  'Plump, sweet organic blueberries.'),
(7,  'Sweet Corn',            'fruits-vegetables', 0.69,  'each',      'https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=300', 4.2, 145, true,  false, 'Fresh sweet corn on the cob.'),
(8,  'Red Bell Peppers',      'fruits-vegetables', 1.29,  'each',      'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=300', 4.5, 167, true,  false, 'Crisp, sweet red bell peppers.'),
-- Dairy & Eggs
(9,  'Whole Milk',            'dairy-eggs',        4.29,  'gallon',    'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300', 4.6, 445, true,  false, 'Fresh whole milk, vitamin D enriched.'),
(10, 'Large Eggs',            'dairy-eggs',        3.99,  'dozen',     'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300', 4.7, 512, true,  false, 'Farm-fresh large grade A eggs.'),
(11, 'Greek Yogurt',          'dairy-eggs',        5.49,  '32 oz',     'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300', 4.5, 298, true,  false, 'Creamy plain Greek yogurt, high protein.'),
(12, 'Cheddar Cheese',        'dairy-eggs',        4.99,  '8 oz',      'https://images.unsplash.com/photo-1618164436241-4473940d1f5c?w=300', 4.4, 234, true,  false, 'Sharp cheddar cheese block.'),
(13, 'Butter Unsalted',       'dairy-eggs',        4.49,  '16 oz',     'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=300', 4.6, 189, true,  false, 'Sweet cream unsalted butter.'),
(14, 'Organic Milk',          'dairy-eggs',        6.49,  'half gallon','https://images.unsplash.com/photo-1550583724-b2692b85b150?w=300', 4.8, 167, true,  true,  'Certified organic whole milk.'),
-- Bakery
(15, 'Sourdough Bread',       'bakery',            4.99,  'loaf',      'https://images.unsplash.com/photo-1595535873420-a599195b3f4a?w=300', 4.8, 356, true,  false, 'Artisan sourdough bread, freshly baked.'),
(16, 'Croissants',            'bakery',            5.99,  '4 ct',      'https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=300', 4.7, 267, true,  false, 'Buttery, flaky French croissants.'),
(17, 'Whole Wheat Bread',     'bakery',            3.49,  'loaf',      'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300', 4.3, 198, true,  false, '100% whole wheat sliced bread.'),
(18, 'Chocolate Chip Cookies','bakery',            4.49,  '12 ct',     'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=300', 4.9, 423, true,  false, 'Soft-baked chocolate chip cookies.'),
(19, 'Blueberry Muffins',     'bakery',            5.49,  '4 ct',      'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=300', 4.6, 187, true,  false, 'Moist blueberry muffins with streusel.'),
(20, 'Bagels Everything',     'bakery',            4.29,  '6 ct',      'https://images.unsplash.com/photo-1603532648955-039310d9ed75?w=300', 4.5, 234, true,  false, 'New York style everything bagels.'),
(21, 'Cinnamon Rolls',        'bakery',            6.99,  '6 ct',      'https://images.unsplash.com/photo-1509365390695-33aee754301f?w=300', 4.8, 298, true,  false, 'Warm cinnamon rolls with cream cheese frosting.'),
-- Meat & Seafood
(22, 'Chicken Breast',        'meat-seafood',      6.99,  'lb',        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=300', 4.5, 312, true,  false, 'Boneless, skinless chicken breast.'),
(23, 'Ground Beef 80/20',     'meat-seafood',      5.99,  'lb',        'https://images.unsplash.com/photo-1588347818036-558601350947?w=300', 4.4, 278, true,  false, 'Fresh ground beef, 80% lean.'),
(24, 'Atlantic Salmon',       'meat-seafood',      9.99,  'lb',        'https://images.unsplash.com/photo-1574781330855-d0db8cc6a79c?w=300', 4.7, 198, true,  false, 'Fresh Atlantic salmon fillet.'),
(25, 'Bacon Thick Cut',       'meat-seafood',      7.49,  '16 oz',     'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300', 4.6, 356, true,  false, 'Hickory smoked thick-cut bacon.'),
(26, 'Shrimp Large',          'meat-seafood',      11.99, 'lb',        'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=300', 4.5, 145, true,  false, 'Wild-caught large shrimp, peeled.'),
-- Snacks
(27, 'Tortilla Chips',        'snacks',            3.99,  '13 oz',     'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=300', 4.4, 234, true,  false, 'Crispy restaurant-style tortilla chips.'),
(28, 'Mixed Nuts',            'snacks',            8.99,  '16 oz',     'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?w=300', 4.7, 189, true,  false, 'Deluxe mixed nuts, roasted and salted.'),
(29, 'Hummus Classic',        'snacks',            4.49,  '10 oz',     'https://images.unsplash.com/photo-1577805947697-89e18249d767?w=300', 4.5, 156, true,  false, 'Smooth classic hummus dip.'),
(30, 'Granola Bars',          'snacks',            3.79,  '6 ct',      'https://images.unsplash.com/photo-1590080875515-8a3a8dc5735e?w=300', 4.3, 278, true,  false, 'Chewy chocolate chip granola bars.'),
(31, 'Trail Mix',             'snacks',            6.49,  '12 oz',     'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?w=300', 4.6, 167, true,  false, 'Mountain trail mix with dried fruits.'),
-- Beverages
(32, 'Orange Juice',          'beverages',         4.99,  '52 oz',     'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=300', 4.6, 345, true,  false, 'Fresh squeezed, not from concentrate.'),
(33, 'Sparkling Water',       'beverages',         5.49,  '12 pk',     'https://images.unsplash.com/photo-1523362628745-0c100150b504?w=300', 4.4, 234, true,  false, 'Lime flavored sparkling water.'),
(34, 'Almond Milk',           'beverages',         3.99,  '64 oz',     'https://images.unsplash.com/photo-1600788886242-5c96aabe3757?w=300', 4.5, 198, true,  true,  'Unsweetened vanilla almond milk.'),
(35, 'Cold Brew Coffee',      'beverages',         6.99,  '32 oz',     'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=300', 4.7, 267, true,  false, 'Smooth, bold cold brew concentrate.'),
(36, 'Green Tea',             'beverages',         3.49,  '20 ct',     'https://images.unsplash.com/photo-1556881286-fc6915169721?w=300', 4.3, 145, true,  true,  'Organic green tea bags.'),
-- Frozen Foods
(37, 'Frozen Pizza Margherita','frozen-foods',     6.99,  'each',      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=300', 4.4, 234, true,  false, 'Stone-fired margherita pizza.'),
(38, 'Ice Cream Vanilla',     'frozen-foods',      5.99,  'pint',      'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=300', 4.8, 389, true,  false, 'Premium vanilla bean ice cream.'),
(39, 'Frozen Berries Mix',    'frozen-foods',      4.49,  '16 oz',     'https://images.unsplash.com/photo-1563746098251-d35aef196e83?w=300', 4.6, 178, true,  true,  'Organic mixed berry blend.'),
(40, 'Veggie Burgers',        'frozen-foods',      5.99,  '4 ct',      'https://images.unsplash.com/photo-1520072959219-c595e76c6b84?w=300', 4.3, 156, true,  false, 'Plant-based veggie burger patties.'),
-- Pantry
(41, 'Extra Virgin Olive Oil','pantry',            8.99,  '17 oz',     'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', 4.7, 312, true,  true,  'Cold-pressed extra virgin olive oil.'),
(42, 'Pasta Spaghetti',       'pantry',            1.49,  '16 oz',     'https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=300', 4.5, 456, true,  false, 'Classic Italian spaghetti pasta.'),
(43, 'Marinara Sauce',        'pantry',            3.99,  '24 oz',     'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?w=300', 4.4, 289, true,  false, 'Traditional marinara pasta sauce.'),
(44, 'Jasmine Rice',          'pantry',            4.99,  '2 lb',      'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=300', 4.6, 234, true,  false, 'Premium Thai jasmine rice.'),
(45, 'Peanut Butter',         'pantry',            4.49,  '16 oz',     'https://images.unsplash.com/photo-1598511726623-d2e9996892f0?w=300', 4.7, 378, true,  false, 'Creamy peanut butter, no stir.'),
(46, 'Honey Raw',             'pantry',            7.99,  '12 oz',     'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=300', 4.8, 198, true,  true,  'Raw, unfiltered wildflower honey.'),
(47, 'Canned Tomatoes',       'pantry',            1.99,  '28 oz',     'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?w=300', 4.3, 267, true,  false, 'Whole peeled San Marzano tomatoes.'),
(48, 'Black Beans',           'pantry',            1.29,  '15 oz',     'https://images.unsplash.com/photo-1551462147-37885acc36f1?w=300', 4.4, 189, true,  false, 'Seasoned black beans, ready to serve.'),
-- Deli
(49, 'Turkey Breast Deli',    'deli',              8.99,  'lb',        'https://images.unsplash.com/photo-1553909489-cd47e0907980?w=300', 4.5, 167, true,  false, 'Oven-roasted turkey breast sliced.'),
(50, 'Rotisserie Chicken',    'deli',              7.99,  'each',      'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=300', 4.8, 456, true,  false, 'Hot, juicy rotisserie chicken.'),
-- Organic
(51, 'Organic Quinoa',        'organic',           5.99,  '16 oz',     'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=300', 4.6, 178, true,  true,  'Pre-washed organic white quinoa.'),
(52, 'Organic Coconut Oil',   'organic',           7.49,  '14 oz',     'https://images.unsplash.com/photo-1526947425960-945c6e72858f?w=300', 4.7, 234, true,  true,  'Virgin organic coconut oil.'),
-- Additional Fruits & Vegetables
(53, 'Fuji Apples',           'fruits-vegetables', 1.99,  'lb',        'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300', 4.6, 312, true,  false, 'Crisp, sweet Fuji apples.'),
(54, 'Seedless Grapes',       'fruits-vegetables', 3.49,  'lb',        'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=300', 4.5, 198, true,  false, 'Sweet red seedless grapes.'),
(55, 'Broccoli Crown',        'fruits-vegetables', 2.49,  'each',      'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=300', 4.3, 167, true,  false, 'Fresh broccoli crown.'),
(56, 'Red Onions',            'fruits-vegetables', 1.29,  'lb',        'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?w=300', 4.2, 134, true,  false, 'Fresh red onions, mild flavor.'),
(57, 'Organic Kale',          'fruits-vegetables', 2.99,  'bunch',     'https://images.unsplash.com/photo-1524179091875-bf99a9a6af57?w=300', 4.4, 145, true,  true,  'Organic curly kale, nutrient-rich.'),
-- Additional Dairy & Eggs
(58, 'Cream Cheese',          'dairy-eggs',        3.49,  '8 oz',      'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=300', 4.5, 201, true,  false, 'Philadelphia-style cream cheese.'),
(59, 'Sour Cream',            'dairy-eggs',        2.79,  '16 oz',     'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=300', 4.3, 156, true,  false, 'Rich and creamy sour cream.'),
-- Additional Meat & Seafood
(60, 'Pork Chops',            'meat-seafood',      5.49,  'lb',        'https://images.unsplash.com/photo-1588347818036-558601350947?w=300', 4.4, 189, true,  false, 'Center-cut boneless pork chops.'),
(61, 'Turkey Ground',         'meat-seafood',      5.99,  'lb',        'https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?w=300', 4.3, 145, true,  false, 'Lean ground turkey, 93% lean.'),
-- Additional Beverages
(62, 'Coconut Water',         'beverages',         2.99,  '16 oz',     'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=300', 4.5, 198, true,  true,  'Pure natural coconut water.'),
(63, 'Kombucha Ginger',       'beverages',         3.99,  '16 oz',     'https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?w=300', 4.6, 167, true,  true,  'Organic ginger kombucha, probiotic.'),
-- Additional Frozen Foods
(64, 'Frozen Waffles',        'frozen-foods',      3.49,  '10 ct',     'https://images.unsplash.com/photo-1568051243851-f9b136146e97?w=300', 4.2, 234, true,  false, 'Crispy homestyle frozen waffles.'),
(65, 'Frozen Edamame',        'frozen-foods',      2.99,  '12 oz',     'https://images.unsplash.com/photo-1564834724105-918b73d1b8e0?w=300', 4.5, 156, true,  false, 'Shelled edamame, ready to microwave.'),
-- Additional Pantry
(66, 'Oatmeal Packets',       'pantry',            3.99,  '10 ct',     'https://images.unsplash.com/photo-1517673400267-0251440c45dc?w=300', 4.4, 289, true,  false, 'Instant oatmeal variety pack.'),
(67, 'Pancake Mix',           'pantry',            3.49,  '32 oz',     'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=300', 4.6, 312, true,  false, 'Buttermilk pancake and waffle mix.'),
-- Additional Deli
(68, 'Ham Sliced Honey',      'deli',              7.49,  'lb',        'https://images.unsplash.com/photo-1524438418049-ab2acb7aa48f?w=300', 4.4, 178, true,  false, 'Honey-glazed sliced deli ham.'),
(69, 'Macaroni Salad',        'deli',              4.99,  'lb',        'https://images.unsplash.com/photo-1580013759032-7e14eb47d4e8?w=300', 4.2, 134, true,  false, 'Classic creamy macaroni salad.'),
-- Additional Organic
(70, 'Organic Chia Seeds',    'organic',           6.99,  '12 oz',     'https://images.unsplash.com/photo-1514986888952-8cd320577b68?w=300', 4.7, 201, true,  true,  'Organic chia seeds, superfood.'),
-- Out of stock
(71, 'Wagyu Beef Steak',      'meat-seafood',      49.99, '8 oz',      'https://images.unsplash.com/photo-1558030006-450675393462?w=300', 4.9, 89,  false, false, 'Premium A5 Wagyu beef steak.'),
(72, 'Truffle Oil',           'pantry',            14.99, '8 oz',      'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', 4.8, 67,  false, false, 'Black truffle infused oil.');
SELECT setval('products_id_seq', 72);

-- Sponsored Products
INSERT INTO sponsored_products (id, name, price, unit, image, sponsor, tagline, related_categories, related_product_id) VALUES
(1,  'O Organics Almond Butter',       6.99,  '12 oz',       'https://images.unsplash.com/photo-1598511726623-d2e9996892f0?w=300', 'O Organics',       'Try our new recipe!',          'pantry,organic',              NULL),
(2,  'Signature SELECT Pasta Sauce',    2.99,  '24 oz',       'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?w=300', 'Signature SELECT',  'Quality at a great price',     'pantry',                      NULL),
(3,  'Lucerne Yogurt Variety',          4.99,  '12 ct',       'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300', 'Lucerne',           'New flavors available!',       'dairy-eggs',                  NULL),
(4,  'Open Nature Granola',             4.49,  '12 oz',       'https://images.unsplash.com/photo-1558745010-b0eda5c27a70?w=300',   'Open Nature',       'Fuel your morning',            'snacks,organic',              NULL),
(5,  'Signature Farms Avocados',        3.99,  '4 ct',        'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300', 'Signature Farms',   'Always ripe, always fresh',    'fruits-vegetables',           NULL),
(6,  'O Organics Frozen Fruit',         5.49,  '16 oz',       'https://images.unsplash.com/photo-1563746098251-d35aef196e83?w=300', 'O Organics',        'Perfect for smoothies',        'frozen-foods,organic',        NULL),
(7,  'Signature SELECT Chips',          2.49,  '10 oz',       'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=300', 'Signature SELECT',  'Crunch time!',                 'snacks',                      NULL),
(8,  'Lucerne Fresh Milk',              3.99,  'half gallon', 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300',    'Lucerne',           'Farm fresh quality',           'dairy-eggs,beverages',        NULL),
(9,  'Open Nature Cold Brew',           5.99,  '32 oz',       'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=300', 'Open Nature',       'Smooth & bold',                'beverages',                   NULL),
(10, 'Signature Farms Berries',         4.99,  '12 oz',       'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300', 'Signature Farms',   'Peak of freshness',            'fruits-vegetables',           NULL);
SELECT setval('sponsored_products_id_seq', 10);

-- Banners
INSERT INTO banners (id, title, subtitle, cta_text, cta_link, bg_color, image) VALUES
(1, 'Fresh Spring Savings',  'Up to 30% off seasonal produce',                     'Shop Now',        '/category/fruits-vegetables', 'linear-gradient(135deg, #2E7D32 0%, #66BB6A 100%)', 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=800'),
(2, 'Bakery Fresh Daily',    'Artisan breads baked in-store every morning',         'Explore Bakery',  '/category/bakery',            'linear-gradient(135deg, #E65100 0%, #FF9800 100%)', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800'),
(3, 'Organic Week',          'Extra 15% off all organic products',                  'Go Organic',      '/category/organic',           'linear-gradient(135deg, #1B5E20 0%, #4CAF50 100%)', 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=800');
SELECT setval('banners_id_seq', 3);

-- Mock User (password: 'password123' BCrypt encoded)
INSERT INTO users (id, first_name, last_name, email, password, loyalty_points, tier, preferred_store) VALUES
(1, 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2a$10$CpoqdYc3aNxnjQBhUz3ale5QwrfW4YRMp3rFW.Ewh7M9mLF2dXwim', 2450, 'Gold', 'Albertsons #1234 - Downtown');
SELECT setval('users_id_seq', 1);

-- Deals (product_id references products table)
-- p050=50, p038=38, p006=6, p024=24, p041=41, p017=17, p034=34, p053=53
INSERT INTO deals (id, product_id, original_price, sale_price, discount, ends_at) VALUES
(1, 50, 9.99,  7.99, 20, '2026-03-27T00:00:00'),
(2, 38, 7.99,  5.99, 25, '2026-03-27T00:00:00'),
(3, 6,  5.99,  4.49, 25, '2026-03-27T00:00:00'),
(4, 24, 12.99, 9.99, 23, '2026-03-27T00:00:00'),
(5, 41, 11.99, 8.99, 25, '2026-03-27T00:00:00'),
(6, 17, 4.49,  2.99, 33, '2026-03-27T00:00:00'),
(7, 34, 5.49,  3.99, 27, '2026-03-27T00:00:00'),
(8, 53, 2.99,  1.49, 50, '2026-03-27T00:00:00');
SELECT setval('deals_id_seq', 8);

-- SmartCart items for Sarah (user_id=1)
-- Maps: p009=9, p010=10, p001=1, p015=15, p042=42, p043=43, p022=22, p032=32,
--        p004=4, p011=11, p044=44, p045=45, p018=18, p003=3, p013=13
INSERT INTO smart_cart_items (id, user_id, product_id, quantity, frequency, last_purchased, predicted_need, sponsored_alternative_id) VALUES
(1,  1, 9,  2, 'weekly',    '2026-03-22', '2026-03-29', 8),
(2,  1, 10, 1, 'weekly',    '2026-03-22', '2026-03-29', NULL),
(3,  1, 1,  3, 'weekly',    '2026-03-20', '2026-03-27', 5),
(4,  1, 15, 1, 'weekly',    '2026-03-21', '2026-03-28', NULL),
(5,  1, 42, 2, 'bi-weekly', '2026-03-15', '2026-03-29', 2),
(6,  1, 43, 1, 'bi-weekly', '2026-03-15', '2026-03-29', NULL),
(7,  1, 22, 2, 'weekly',    '2026-03-22', '2026-03-29', NULL),
(8,  1, 32, 1, 'weekly',    '2026-03-21', '2026-03-28', NULL),
(9,  1, 4,  1, 'weekly',    '2026-03-20', '2026-03-27', NULL),
(10, 1, 11, 1, 'bi-weekly', '2026-03-12', '2026-03-26', 3),
(11, 1, 44, 1, 'monthly',   '2026-03-01', '2026-04-01', NULL),
(12, 1, 45, 1, 'monthly',   '2026-03-05', '2026-04-05', 1),
(13, 1, 18, 1, 'bi-weekly', '2026-03-14', '2026-03-28', NULL),
(14, 1, 3,  4, 'weekly',    '2026-03-22', '2026-03-29', 5),
(15, 1, 13, 1, 'bi-weekly', '2026-03-10', '2026-03-24', NULL);
SELECT setval('smart_cart_items_id_seq', 15);

-- Order History for Sarah (user_id=1)
INSERT INTO orders (id, customer_id, user_id, order_date, total, status) VALUES
(1, 1, 1, '2026-03-22 10:30:00', 31.31, 'completed'),
(2, 1, 1, '2026-03-15 14:15:00', 17.93, 'completed'),
(3, 1, 1, '2026-03-08 09:45:00', 21.25, 'completed');
SELECT setval('orders_id_seq', 3);

-- Order Items
-- Order 1: p009 x2, p010 x1, p001 x3, p022 x2, p015 x1
INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
(1,  1, 9,  2, 4.29),
(2,  1, 10, 1, 3.99),
(3,  1, 1,  3, 0.79),
(4,  1, 22, 2, 6.99),
(5,  1, 15, 1, 4.99),
-- Order 2: p042 x2, p043 x1, p003 x4, p032 x1
(6,  2, 42, 2, 1.49),
(7,  2, 43, 1, 3.99),
(8,  2, 3,  4, 1.49),
(9,  2, 32, 1, 4.99),
-- Order 3: p009 x1, p004 x2, p011 x1, p018 x1
(10, 3, 9,  1, 4.29),
(11, 3, 4,  2, 3.49),
(12, 3, 11, 1, 5.49),
(13, 3, 18, 1, 4.49);
SELECT setval('order_items_id_seq', 13);

