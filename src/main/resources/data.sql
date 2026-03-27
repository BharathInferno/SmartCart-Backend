-- =============================================
-- Seed data from mockData.js
-- =============================================

-- Categories
INSERT INTO categories (id, name, slug, image, description, item_count) VALUES
(1, 'Fruits & Vegetables', 'fruits-vegetables', 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=400', 'Fresh, organic fruits and vegetables', 48),
(2, 'Dairy & Eggs', 'dairy-eggs', 'https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=400', 'Farm-fresh dairy products and eggs', 32),
(3, 'Bakery', 'bakery', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400', 'Freshly baked breads, cakes, and pastries', 28),
(4, 'Meat & Seafood', 'meat-seafood', 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400', 'Premium quality meats and fresh seafood', 36),
(5, 'Snacks & Chips', 'snacks', 'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=400', 'Tasty snacks for every craving', 44),
(6, 'Beverages', 'beverages', 'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400', 'Refreshing drinks and juices', 38),
(7, 'Frozen Foods', 'frozen-foods', 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=400', 'Convenient frozen meals and treats', 30),
(8, 'Pantry Staples', 'pantry', 'https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?w=400', 'Essential cooking ingredients and staples', 52),
(9, 'Deli & Prepared', 'deli', 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?w=400', 'Ready-to-eat deli meats and prepared foods', 24),
(10, 'Organic & Natural', 'organic', 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=400', 'Certified organic and natural products', 40);
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
(72, 'Truffle Oil',           'pantry',            14.99, '8 oz',      'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', 4.8, 67,  false, false, 'Black truffle infused oil.'),
-- Additional Products for richer recommendations
(73, 'Celery Sticks',         'fruits-vegetables', 1.79,  'bunch',     'https://images.unsplash.com/photo-1580391564590-aeca65c5e2d3?w=300', 4.2, 112, true,  false, 'Fresh crisp celery sticks.'),
(74, 'Carrots Baby',          'fruits-vegetables', 2.29,  '16 oz',     'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=300', 4.5, 198, true,  false, 'Sweet baby-cut carrots, ready to snack.'),
(75, 'Mozzarella Cheese',     'dairy-eggs',        4.79,  '8 oz',      'https://images.unsplash.com/photo-1626957341926-98752fc2ba90?w=300', 4.6, 221, true,  false, 'Fresh whole milk mozzarella.'),
(76, 'Half & Half',           'dairy-eggs',        3.29,  '16 oz',     'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300', 4.4, 155, true,  false, 'Rich half & half for coffee.'),
(77, 'Ciabatta Rolls',        'bakery',            4.49,  '4 ct',      'https://images.unsplash.com/photo-1549931319-a545dcf3bc73?w=300', 4.5, 143, true,  false, 'Rustic Italian ciabatta rolls.'),
(78, 'Tilapia Fillets',       'meat-seafood',      7.99,  'lb',        'https://images.unsplash.com/photo-1574781330855-d0db8cc6a79c?w=300', 4.3, 134, true,  false, 'Farm-raised tilapia fillets.'),
(79, 'Pretzels Snack',        'snacks',            3.29,  '10 oz',     'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=300', 4.3, 177, true,  false, 'Crunchy mini twist pretzels.'),
(80, 'Lemonade',              'beverages',         3.49,  '52 oz',     'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=300', 4.5, 210, true,  false, 'Fresh-squeezed style lemonade.'),
(81, 'Frozen Burritos',       'frozen-foods',      4.99,  '4 ct',      'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=300', 4.2, 189, true,  false, 'Bean and cheese frozen burritos.'),
(82, 'Flour All Purpose',     'pantry',            3.99,  '5 lb',      'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=300', 4.6, 287, true,  false, 'Unbleached all-purpose flour.'),
(83, 'Brown Sugar',           'pantry',            2.99,  '2 lb',      'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62?w=300', 4.4, 156, true,  false, 'Light brown sugar.'),
(84, 'Swiss Cheese Deli',     'deli',              9.49,  'lb',        'https://images.unsplash.com/photo-1618164436241-4473940d1f5c?w=300', 4.5, 122, true,  false, 'Sliced Swiss cheese from the deli.'),
(85, 'Organic Apple Cider Vinegar', 'organic',     4.99,  '16 oz',     'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300', 4.7, 245, true,  true,  'Raw, unfiltered organic apple cider vinegar.'),
(86, 'Lemons',                'fruits-vegetables', 0.59,  'each',      'https://images.unsplash.com/photo-1582087463261-986f1e328f89?w=300', 4.4, 198, true,  false, 'Bright, juicy fresh lemons.'),
(87, 'Garlic Bulb',           'fruits-vegetables', 0.69,  'each',      'https://images.unsplash.com/photo-1540148426945-6cf22a6b2571?w=300', 4.5, 267, true,  false, 'Fresh whole garlic bulb.');
SELECT setval('products_id_seq', 87);

-- Sponsored Products — one cheaper alternative per smart-cart item
INSERT INTO sponsored_products (id, name, price, unit, image, sponsor, tagline, related_categories, related_product_id) VALUES
(1,  'Lucerne Fresh Milk',                 3.29, 'gallon',    'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300',  'Lucerne',          'Farm-fresh quality at a lower price',       'dairy-eggs',            9),
(2,  'Lucerne Grade A Eggs',               2.99, 'dozen',     'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300','Lucerne',          'Farm-fresh eggs, wallet-friendly',          'dairy-eggs',           10),
(3,  'Signature SELECT Bananas',           0.49, 'lb',        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300','Signature SELECT', 'Sweet & ripe, everyday low price',          'fruits-vegetables',     1),
(4,  'Signature SELECT Sourdough Bread',   2.99, 'loaf',      'https://images.unsplash.com/photo-1595535873420-a599195b3f4a?w=300','Signature SELECT', 'Artisan taste at an everyday price',         'bakery',               15),
(5,  'Signature SELECT Spaghetti',         0.99, '16 oz',     'https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=300',  'Signature SELECT', 'Classic pasta, unbeatable value',           'pantry',               42),
(6,  'Signature SELECT Marinara Sauce',    2.49, '24 oz',     'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?w=300','Signature SELECT', 'Rich tomato flavor, better price',          'pantry',               43),
(7,  'Signature Farms Chicken Thighs',     4.99, 'lb',        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=300','Signature Farms',  'Juicy & flavorful at $2 less per lb',       'meat-seafood',         22),
(8,  'Signature SELECT Orange Juice',      3.29, '52 oz',     'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=300','Signature SELECT', 'Refreshing OJ at everyday savings',         'beverages',            32),
(9,  'Signature SELECT Baby Spinach',      2.29, '5 oz',      'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=300','Signature SELECT', 'Fresh greens, smarter savings',             'fruits-vegetables',     4),
(10, 'Lucerne Yogurt Variety',             3.99, '32 oz',     'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300','Lucerne',          'Creamy goodness at a better price',         'dairy-eggs',           11),
(11, 'Signature SELECT Jasmine Rice',      2.99, '2 lb',      'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=300','Signature SELECT', 'Light & fluffy, great everyday savings',    'pantry',               44),
(12, 'Signature SELECT Peanut Butter',     2.99, '16 oz',     'https://images.unsplash.com/photo-1598511726623-d2e9996892f0?w=300','Signature SELECT', 'Creamy peanut butter at $1.50 less',        'pantry',               45),
(13, 'Signature SELECT Cookies',           2.79, '12 ct',     'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=300','Signature SELECT', 'Sweet savings every time',                  'bakery',               18),
(14, 'Signature SELECT Avocados',          0.89, 'each',      'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300','Signature SELECT', 'Always ripe, always fresh, always cheaper', 'fruits-vegetables',     3),
(15, 'Lucerne Unsalted Butter',            3.29, '16 oz',     'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=300','Lucerne',          'Rich, creamy butter at $1.20 less',         'dairy-eggs',           13),
-- Additional sponsored products covering all frequently-ordered items from AI recommendations
(16, 'Signature SELECT Garlic',            0.39, 'each',      'https://images.unsplash.com/photo-1540148426945-6cf22a6b2571?w=300','Signature SELECT', 'Fresh garlic at $0.30 less per bulb',       'fruits-vegetables',    87),
(17, 'Signature SELECT Lemons',            0.39, 'each',      'https://images.unsplash.com/photo-1582087463261-986f1e328f89?w=300','Signature SELECT', 'Bright, juicy lemons at everyday savings',  'fruits-vegetables',    86),
(18, 'Lucerne Cheddar Cheese',             3.49, '8 oz',      'https://images.unsplash.com/photo-1618164436241-4473940d1f5c?w=300','Lucerne',          'Sharp cheddar at $1.50 less per block',     'dairy-eggs',           12),
(19, 'Signature Farms Blueberries',        2.99, '6 oz',      'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=300','Signature Farms',  'Plump, sweet berries at $1.50 less',        'fruits-vegetables',     6),
(20, 'Signature SELECT Atlantic Salmon',   7.99, 'lb',        'https://images.unsplash.com/photo-1574781330855-d0db8cc6a79c?w=300','Signature SELECT', 'Wild-caught salmon at $2.00 less per lb',  'meat-seafood',         24),
(21, 'Signature SELECT Bacon',             5.49, '16 oz',     'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300','Signature SELECT', 'Hickory smoked bacon at $2.00 less',        'meat-seafood',         25),
(22, 'Signature SELECT Almond Milk',       2.99, '64 oz',     'https://images.unsplash.com/photo-1600788886242-5c96aabe3757?w=300','Signature SELECT', 'Unsweetened almond milk at $1.00 less',     'beverages',            34),
(23, 'Signature SELECT Olive Oil',          6.99, '17 oz',     'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300','Signature SELECT', 'Cold-pressed EVOO at $2.00 less per bottle','pantry',       41);
SELECT setval('sponsored_products_id_seq', 23);

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
(1, 50, 9.99,  7.99, 20, '2026-05-31T00:00:00'),
(2, 38, 7.99,  5.99, 25, '2026-05-31T00:00:00'),
(3, 6,  5.99,  4.49, 25, '2026-05-31T00:00:00'),
(4, 24, 12.99, 9.99, 23, '2026-05-31T00:00:00'),
(5, 41, 11.99, 8.99, 25, '2026-05-31T00:00:00'),
(6, 17, 4.49,  2.99, 33, '2026-05-31T00:00:00'),
(7, 34, 5.49,  3.99, 27, '2026-05-31T00:00:00'),
(8, 53, 2.99,  1.49, 50, '2026-05-31T00:00:00');
SELECT setval('deals_id_seq', 8);

-- SmartCart items for Sarah (user_id=1)
-- All items include a cheaper sponsored alternative, pre-computed price_advantage and sponsored_reason
INSERT INTO smart_cart_items (id, user_id, product_id, quantity, frequency, last_purchased, predicted_need, sponsored_alternative_id, price_advantage, sponsored_reason) VALUES
(1,  1, 9,  2, 'weekly',    '2026-03-22', '2026-03-29', 1,  1.00, 'Switch to Lucerne Fresh Milk and save $1.00 per gallon on your weekly staple'),
(2,  1, 10, 1, 'weekly',    '2026-03-22', '2026-03-29', 2,  1.00, 'Lucerne Grade A Eggs offer the same quality at $1.00 less per dozen'),
(3,  1, 1,  3, 'weekly',    '2026-03-20', '2026-03-27', 3,  0.30, 'Signature SELECT Bananas save you $0.30/lb every week'),
(4,  1, 15, 1, 'weekly',    '2026-03-21', '2026-03-28', 4,  2.00, 'Signature SELECT Sourdough tastes great at $2.00 less per loaf'),
(5,  1, 42, 2, 'bi-weekly', '2026-03-15', '2026-03-29', 5,  0.50, 'Same classic pasta at $0.50 less — great bi-weekly savings'),
(6,  1, 43, 1, 'bi-weekly', '2026-03-15', '2026-03-29', 6,  1.50, 'Signature SELECT Marinara delivers rich flavor at $1.50 less per jar'),
(7,  1, 22, 2, 'weekly',    '2026-03-22', '2026-03-29', 7,  2.00, 'Chicken thighs are juicier and save you $2.00/lb on your weekly protein'),
(8,  1, 32, 1, 'weekly',    '2026-03-21', '2026-03-28', 8,  1.70, 'Same refreshing OJ at $1.70 less per carton every week'),
(9,  1, 4,  1, 'weekly',    '2026-03-20', '2026-03-27', 9,  1.20, 'Signature SELECT Baby Spinach keeps you green at $1.20 less per bag'),
(10, 1, 11, 1, 'bi-weekly', '2026-03-12', '2026-03-26', 10, 1.50, 'Lucerne Yogurt Variety is just as creamy at $1.50 less per tub'),
(11, 1, 44, 1, 'monthly',   '2026-03-01', '2026-04-01', 11, 2.00, 'Signature SELECT Jasmine Rice delivers fluffy results at $2.00 less'),
(12, 1, 45, 1, 'monthly',   '2026-03-05', '2026-04-05', 12, 1.50, 'Signature SELECT Peanut Butter is smooth and creamy at $1.50 less'),
(13, 1, 18, 1, 'bi-weekly', '2026-03-14', '2026-03-28', 13, 1.70, 'Signature SELECT Cookies hit the same sweet spot at $1.70 less per pack'),
(14, 1, 3,  4, 'weekly',    '2026-03-22', '2026-03-29', 14, 0.60, 'Signature SELECT Avocados are always ripe and $0.60 cheaper each'),
(15, 1, 13, 1, 'bi-weekly', '2026-03-10', '2026-03-24', 15, 1.20, 'Lucerne Unsalted Butter has the same rich taste at $1.20 less');
SELECT setval('smart_cart_items_id_seq', 15);

-- Order History for Sarah (user_id=1) — 13 orders spanning 90 days
INSERT INTO orders (id, customer_id, user_id, order_date, total, status) VALUES
(1,  1, 1, '2026-03-22 10:30:00', 31.31, 'completed'),
(2,  1, 1, '2026-03-15 14:15:00', 17.93, 'completed'),
(3,  1, 1, '2026-03-08 09:45:00', 21.25, 'completed'),
(4,  1, 1, '2026-03-01 11:00:00', 38.72, 'completed'),
(5,  1, 1, '2026-02-22 09:30:00', 27.45, 'completed'),
(6,  1, 1, '2026-02-15 13:00:00', 43.18, 'completed'),
(7,  1, 1, '2026-02-08 10:15:00', 29.86, 'completed'),
(8,  1, 1, '2026-02-01 14:45:00', 35.94, 'completed'),
(9,  1, 1, '2026-01-25 10:00:00', 22.67, 'completed'),
(10, 1, 1, '2026-01-18 11:30:00', 41.23, 'completed'),
(11, 1, 1, '2026-01-11 09:00:00', 33.49, 'completed'),
(12, 1, 1, '2026-01-04 15:00:00', 26.78, 'completed'),
(13, 1, 1, '2025-12-28 10:30:00', 37.56, 'completed');
SELECT setval('orders_id_seq', 13);

-- Order Items — rich history for strong AI predictions
-- Product purchase frequency summary:
--   Whole Milk (9):       12x — weekly staple
--   Large Eggs (10):      11x — weekly staple
--   Organic Bananas (1):  10x — weekly staple
--   Chicken Breast (22):   9x — weekly protein
--   Sourdough Bread (15):  8x — weekly bread
--   Baby Spinach (4):      8x — weekly greens
--   Avocados (3):          7x — weekly
--   Orange Juice (32):     7x — weekly beverage
--   Spaghetti (42):        6x — bi-weekly
--   Marinara Sauce (43):   6x — bi-weekly
--   Greek Yogurt (11):     6x — bi-weekly
--   Butter (13):           5x — bi-weekly
--   Cookies (18):          5x — bi-weekly treat
--   Peanut Butter (45):    4x — monthly
--   Jasmine Rice (44):     4x — monthly
--   Garlic (87):           6x — weekly cooking
--   Lemons (86):           5x — weekly cooking
--   Cheddar Cheese (12):   4x — bi-weekly
--   Blueberries (6):       3x — occasional
--   Salmon (24):           3x — occasional
--   Bacon (25):            3x — occasional
--   Almond Milk (34):      3x — occasional
INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
-- Order 1 (Mar 22): weekly staples
(1,  1, 9,  2, 4.29),
(2,  1, 10, 1, 3.99),
(3,  1, 1,  3, 0.79),
(4,  1, 22, 2, 6.99),
(5,  1, 15, 1, 4.99),
(6,  1, 87, 2, 0.69),
-- Order 2 (Mar 15): bi-weekly pantry + weekly staples
(7,  2, 42, 2, 1.49),
(8,  2, 43, 1, 3.99),
(9,  2, 3,  4, 1.49),
(10, 2, 32, 1, 4.99),
(11, 2, 9,  1, 4.29),
(12, 2, 10, 1, 3.99),
(13, 2, 1,  2, 0.79),
(14, 2, 86, 4, 0.59),
-- Order 3 (Mar 8): weekly + protein
(15, 3, 9,  1, 4.29),
(16, 3, 4,  2, 3.49),
(17, 3, 11, 1, 5.49),
(18, 3, 18, 1, 4.49),
(19, 3, 22, 1, 6.99),
(20, 3, 15, 1, 4.99),
(21, 3, 87, 1, 0.69),
-- Order 4 (Mar 1): big weekly shop
(22, 4, 9,  2, 4.29),
(23, 4, 10, 1, 3.99),
(24, 4, 1,  3, 0.79),
(25, 4, 22, 2, 6.99),
(26, 4, 3,  3, 1.49),
(27, 4, 4,  1, 3.49),
(28, 4, 32, 1, 4.99),
(29, 4, 13, 1, 4.49),
(30, 4, 42, 2, 1.49),
(31, 4, 43, 1, 3.99),
(32, 4, 86, 3, 0.59),
(33, 4, 87, 2, 0.69),
-- Order 5 (Feb 22): weekly staples + treats
(34, 5, 9,  1, 4.29),
(35, 5, 10, 1, 3.99),
(36, 5, 1,  2, 0.79),
(37, 5, 15, 1, 4.99),
(38, 5, 22, 1, 6.99),
(39, 5, 4,  1, 3.49),
(40, 5, 18, 1, 4.49),
(41, 5, 6,  1, 4.49),
(42, 5, 87, 1, 0.69),
-- Order 6 (Feb 15): pantry restock + weekly
(43, 6, 9,  2, 4.29),
(44, 6, 10, 1, 3.99),
(45, 6, 1,  3, 0.79),
(46, 6, 42, 2, 1.49),
(47, 6, 43, 1, 3.99),
(48, 6, 44, 1, 4.99),
(49, 6, 45, 1, 4.49),
(50, 6, 3,  2, 1.49),
(51, 6, 32, 1, 4.99),
(52, 6, 11, 1, 5.49),
(53, 6, 12, 1, 4.99),
(54, 6, 24, 1, 9.99),
(55, 6, 34, 1, 3.99),
(56, 6, 86, 2, 0.59),
-- Order 7 (Feb 8): weekly + seafood
(57, 7, 9,  1, 4.29),
(58, 7, 10, 1, 3.99),
(59, 7, 22, 1, 6.99),
(60, 7, 15, 1, 4.99),
(61, 7, 4,  2, 3.49),
(62, 7, 13, 1, 4.49),
(63, 7, 25, 1, 7.49),
(64, 7, 18, 1, 4.49),
(65, 7, 87, 1, 0.69),
-- Order 8 (Feb 1): big monthly + weekly
(66, 8, 9,  2, 4.29),
(67, 8, 10, 1, 3.99),
(68, 8, 1,  3, 0.79),
(69, 8, 42, 2, 1.49),
(70, 8, 43, 1, 3.99),
(71, 8, 44, 1, 4.99),
(72, 8, 45, 1, 4.49),
(73, 8, 3,  2, 1.49),
(74, 8, 32, 1, 4.99),
(75, 8, 11, 1, 5.49),
(76, 8, 13, 1, 4.49),
(77, 8, 22, 1, 6.99),
(78, 8, 15, 1, 4.99),
(79, 8, 12, 1, 4.99),
-- Order 9 (Jan 25): weekly staples
(80, 9, 9,  1, 4.29),
(81, 9, 10, 1, 3.99),
(82, 9, 1,  2, 0.79),
(83, 9, 4,  1, 3.49),
(84, 9, 22, 1, 6.99),
(85, 9, 32, 1, 4.99),
(86, 9, 15, 1, 4.99),
(87, 9, 86, 2, 0.59),
-- Order 10 (Jan 18): big shop + seafood + treats
(88,  10, 9,  2, 4.29),
(89,  10, 10, 1, 3.99),
(90,  10, 1,  3, 0.79),
(91,  10, 42, 2, 1.49),
(92,  10, 43, 1, 3.99),
(93,  10, 3,  3, 1.49),
(94,  10, 24, 1, 9.99),
(95,  10, 25, 1, 7.49),
(96,  10, 11, 1, 5.49),
(97,  10, 18, 1, 4.49),
(98,  10, 34, 1, 3.99),
(99,  10, 4,  1, 3.49),
(100, 10, 32, 1, 4.99),
-- Order 11 (Jan 11): weekly + bi-weekly
(101, 11, 9,  1, 4.29),
(102, 11, 10, 1, 3.99),
(103, 11, 22, 1, 6.99),
(104, 11, 15, 1, 4.99),
(105, 11, 4,  1, 3.49),
(106, 11, 13, 1, 4.49),
(107, 11, 11, 1, 5.49),
(108, 11, 12, 1, 4.99),
(109, 11, 18, 1, 4.49),
(110, 11, 3,  2, 1.49),
-- Order 12 (Jan 4): pantry restock + weekly
(111, 12, 9,  1, 4.29),
(112, 12, 10, 1, 3.99),
(113, 12, 1,  2, 0.79),
(114, 12, 42, 1, 1.49),
(115, 12, 43, 1, 3.99),
(116, 12, 44, 1, 4.99),
(117, 12, 45, 1, 4.49),
(118, 12, 32, 1, 4.99),
(119, 12, 6,  1, 4.49),
(120, 12, 25, 1, 7.49),
(121, 12, 34, 1, 3.99),
-- Order 13 (Dec 28): holiday shop
(122, 13, 9,  2, 4.29),
(123, 13, 10, 2, 3.99),
(124, 13, 1,  4, 0.79),
(125, 13, 22, 2, 6.99),
(126, 13, 24, 1, 9.99),
(127, 13, 15, 1, 4.99),
(128, 13, 3,  3, 1.49),
(129, 13, 4,  2, 3.49),
(130, 13, 6,  1, 4.49),
(131, 13, 11, 1, 5.49),
(132, 13, 13, 1, 4.49),
(133, 13, 42, 2, 1.49),
(134, 13, 43, 1, 3.99),
(135, 13, 44, 1, 4.99),
(136, 13, 86, 3, 0.59),
(137, 13, 87, 2, 0.69);

-- =============================================
-- Additional Orders 14-25 for richer AI predictions
-- Covers Dec 2025 through Nov 2025 (extending to 120+ day history)
-- Adds more variety: snacks, frozen, deli, organic items
-- =============================================

INSERT INTO orders (id, customer_id, user_id, order_date, total, status) VALUES
(14, 1, 1, '2025-12-21 11:00:00', 42.87, 'completed'),
(15, 1, 1, '2025-12-14 09:30:00', 36.42, 'completed'),
(16, 1, 1, '2025-12-07 14:00:00', 28.95, 'completed'),
(17, 1, 1, '2025-11-30 10:45:00', 51.33, 'completed'),
(18, 1, 1, '2025-11-23 12:00:00', 34.71, 'completed'),
(19, 1, 1, '2025-11-16 09:15:00', 45.62, 'completed'),
(20, 1, 1, '2025-11-09 11:30:00', 31.28, 'completed'),
(21, 1, 1, '2025-11-02 13:45:00', 39.14, 'completed'),
(22, 1, 1, '2025-10-26 10:00:00', 47.89, 'completed'),
(23, 1, 1, '2025-10-19 14:30:00', 33.56, 'completed'),
(24, 1, 1, '2025-10-12 09:00:00', 29.44, 'completed'),
(25, 1, 1, '2025-10-05 11:15:00', 44.17, 'completed');
SELECT setval('orders_id_seq', 25);

INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
-- Order 14 (Dec 21): weekly staples + snacks + deli
(138, 14, 9,  2, 4.29),
(139, 14, 10, 1, 3.99),
(140, 14, 1,  3, 0.79),
(141, 14, 22, 1, 6.99),
(142, 14, 15, 1, 4.99),
(143, 14, 4,  1, 3.49),
(144, 14, 27, 1, 3.99),
(145, 14, 29, 1, 4.49),
(146, 14, 50, 1, 7.99),
(147, 14, 87, 2, 0.69),
(148, 14, 86, 3, 0.59),
-- Order 15 (Dec 14): pantry + frozen + dairy
(149, 15, 9,  1, 4.29),
(150, 15, 10, 1, 3.99),
(151, 15, 1,  2, 0.79),
(152, 15, 42, 2, 1.49),
(153, 15, 43, 1, 3.99),
(154, 15, 32, 1, 4.99),
(155, 15, 11, 1, 5.49),
(156, 15, 37, 1, 6.99),
(157, 15, 38, 1, 5.99),
(158, 15, 74, 1, 2.29),
-- Order 16 (Dec 7): weekly essentials + produce
(159, 16, 9,  1, 4.29),
(160, 16, 10, 1, 3.99),
(161, 16, 22, 1, 6.99),
(162, 16, 15, 1, 4.99),
(163, 16, 4,  2, 3.49),
(164, 16, 3,  2, 1.49),
(165, 16, 55, 1, 2.49),
(166, 16, 56, 1, 1.29),
(167, 16, 87, 1, 0.69),
-- Order 17 (Nov 30): big monthly restock
(168, 17, 9,  2, 4.29),
(169, 17, 10, 2, 3.99),
(170, 17, 1,  3, 0.79),
(171, 17, 22, 2, 6.99),
(172, 17, 42, 2, 1.49),
(173, 17, 43, 1, 3.99),
(174, 17, 44, 1, 4.99),
(175, 17, 45, 1, 4.49),
(176, 17, 13, 1, 4.49),
(177, 17, 24, 1, 9.99),
(178, 17, 32, 1, 4.99),
(179, 17, 34, 1, 3.99),
(180, 17, 41, 1, 8.99),
(181, 17, 74, 1, 2.29),
(182, 17, 86, 4, 0.59),
(183, 17, 87, 2, 0.69),
-- Order 18 (Nov 23): weekly + snacks + treats
(184, 18, 9,  1, 4.29),
(185, 18, 10, 1, 3.99),
(186, 18, 1,  2, 0.79),
(187, 18, 22, 1, 6.99),
(188, 18, 15, 1, 4.99),
(189, 18, 4,  1, 3.49),
(190, 18, 18, 1, 4.49),
(191, 18, 27, 1, 3.99),
(192, 18, 30, 1, 3.79),
(193, 18, 6,  1, 4.49),
-- Order 19 (Nov 16): big shop + organics + frozen
(194, 19, 9,  2, 4.29),
(195, 19, 10, 1, 3.99),
(196, 19, 1,  3, 0.79),
(197, 19, 42, 2, 1.49),
(198, 19, 43, 1, 3.99),
(199, 19, 3,  3, 1.49),
(200, 19, 32, 1, 4.99),
(201, 19, 11, 1, 5.49),
(202, 19, 12, 1, 4.99),
(203, 19, 51, 1, 5.99),
(204, 19, 39, 1, 4.49),
(205, 19, 25, 1, 7.49),
(206, 19, 86, 2, 0.59),
(207, 19, 87, 1, 0.69),
-- Order 20 (Nov 9): weekly + deli
(208, 20, 9,  1, 4.29),
(209, 20, 10, 1, 3.99),
(210, 20, 22, 1, 6.99),
(211, 20, 15, 1, 4.99),
(212, 20, 4,  1, 3.49),
(213, 20, 13, 1, 4.49),
(214, 20, 49, 1, 8.99),
(215, 20, 58, 1, 3.49),
(216, 20, 87, 1, 0.69),
-- Order 21 (Nov 2): monthly restock + variety
(217, 21, 9,  2, 4.29),
(218, 21, 10, 1, 3.99),
(219, 21, 1,  3, 0.79),
(220, 21, 42, 2, 1.49),
(221, 21, 43, 1, 3.99),
(222, 21, 44, 1, 4.99),
(223, 21, 45, 1, 4.49),
(224, 21, 32, 1, 4.99),
(225, 21, 3,  2, 1.49),
(226, 21, 11, 1, 5.49),
(227, 21, 34, 1, 3.99),
(228, 21, 18, 1, 4.49),
(229, 21, 86, 3, 0.59),
-- Order 22 (Oct 26): big shop + seafood + snacks
(230, 22, 9,  2, 4.29),
(231, 22, 10, 2, 3.99),
(232, 22, 1,  4, 0.79),
(233, 22, 22, 2, 6.99),
(234, 22, 24, 1, 9.99),
(235, 22, 15, 1, 4.99),
(236, 22, 4,  2, 3.49),
(237, 22, 13, 1, 4.49),
(238, 22, 6,  1, 4.49),
(239, 22, 28, 1, 8.99),
(240, 22, 31, 1, 6.49),
(241, 22, 87, 2, 0.69),
(242, 22, 86, 2, 0.59),
-- Order 23 (Oct 19): weekly + pantry
(243, 23, 9,  1, 4.29),
(244, 23, 10, 1, 3.99),
(245, 23, 1,  2, 0.79),
(246, 23, 22, 1, 6.99),
(247, 23, 4,  1, 3.49),
(248, 23, 32, 1, 4.99),
(249, 23, 42, 2, 1.49),
(250, 23, 43, 1, 3.99),
(251, 23, 47, 2, 1.99),
(252, 23, 48, 1, 1.29),
-- Order 24 (Oct 12): weekly essentials
(253, 24, 9,  1, 4.29),
(254, 24, 10, 1, 3.99),
(255, 24, 15, 1, 4.99),
(256, 24, 22, 1, 6.99),
(257, 24, 3,  2, 1.49),
(258, 24, 11, 1, 5.49),
(259, 24, 18, 1, 4.49),
(260, 24, 25, 1, 7.49),
-- Order 25 (Oct 5): big monthly + variety
(261, 25, 9,  2, 4.29),
(262, 25, 10, 2, 3.99),
(263, 25, 1,  3, 0.79),
(264, 25, 22, 2, 6.99),
(265, 25, 42, 2, 1.49),
(266, 25, 43, 1, 3.99),
(267, 25, 44, 1, 4.99),
(268, 25, 45, 1, 4.49),
(269, 25, 13, 1, 4.49),
(270, 25, 32, 1, 4.99),
(271, 25, 4,  2, 3.49),
(272, 25, 24, 1, 9.99),
(273, 25, 34, 1, 3.99),
(274, 25, 3,  3, 1.49),
(275, 25, 6,  1, 4.49),
(276, 25, 86, 4, 0.59),
(277, 25, 87, 2, 0.69);
SELECT setval('order_items_id_seq', 277);

