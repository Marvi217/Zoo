-- ============================================
-- Zoo Pet Store Database Seed Script
-- Generated: 2026-01-26 18:59:58
-- ============================================

-- Disable foreign key checks
SET REFERENTIAL_INTEGRITY FALSE;

-- Clear existing data
DELETE FROM reviews;
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM subcategories;
DELETE FROM categories;
DELETE FROM brands;
DELETE FROM users;

-- Insert brands
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    1,
    'Royal Canin',
    'royal-canin',
    'Premium pet food manufacturer known for breed-specific nutrition',
    TRUE,
    '/images/brands/royal-canin.png',
    'https://www.royalcanin.com',
    'France'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    2,
    'Pedigree',
    'pedigree',
    'Popular dog food brand offering complete nutrition',
    TRUE,
    '/images/brands/pedigree.png',
    'https://www.pedigree.com',
    'USA'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    3,
    'Acana',
    'acana',
    'Biologically appropriate pet foods with fresh regional ingredients',
    TRUE,
    '/images/brands/acana.png',
    'https://www.acana.com',
    'Canada'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    4,
    'Purina',
    'purina',
    'Trusted pet nutrition for over 90 years',
    TRUE,
    '/images/brands/purina.png',
    'https://www.purina.com',
    'USA'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    5,
    'Whiskas',
    'whiskas',
    'Cat food brand loved by cats worldwide',
    TRUE,
    '/images/brands/whiskas.png',
    'https://www.whiskas.com',
    'UK'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    6,
    'Hill''s',
    'hills',
    'Science-based pet nutrition',
    TRUE,
    '/images/brands/hills.png',
    'https://www.hillspet.com',
    'USA'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    7,
    'Sheba',
    'sheba',
    'Premium cat food with gourmet recipes',
    TRUE,
    '/images/brands/sheba.png',
    'https://www.sheba.com',
    'Germany'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    8,
    'Vitakraft',
    'vitakraft',
    'Quality products for small pets and birds',
    TRUE,
    '/images/brands/vitakraft.png',
    'https://www.vitakraft.com',
    'Germany'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    9,
    'Versele-Laga',
    'versele-laga',
    'Premium bird and small animal nutrition',
    TRUE,
    '/images/brands/versele-laga.png',
    'https://www.versele-laga.com',
    'Belgium'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    10,
    'Tetra',
    'tetra',
    'World leader in aquarium products',
    TRUE,
    '/images/brands/tetra.png',
    'https://www.tetra.net',
    'Germany'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    11,
    'JBL',
    'jbl',
    'Professional aquarium and terrarium products',
    TRUE,
    '/images/brands/jbl.png',
    'https://www.jbl.de',
    'Germany'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    12,
    'Tropical',
    'tropical',
    'High-quality fish food made in Poland',
    TRUE,
    '/images/brands/tropical.png',
    'https://www.tropical.pl',
    'Poland'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    13,
    'Zoo Med',
    'zoo-med',
    'Reptile and amphibian care specialist',
    TRUE,
    '/images/brands/zoo-med.png',
    'https://www.zoomed.com',
    'USA'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    14,
    'Exo Terra',
    'exo-terra',
    'Premium reptile habitats and accessories',
    TRUE,
    '/images/brands/exo-terra.png',
    'https://www.exo-terra.com',
    'Canada'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    15,
    'Trixie',
    'trixie',
    'Wide range of pet accessories',
    TRUE,
    '/images/brands/trixie.png',
    'https://www.trixie.de',
    'Germany'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    16,
    'Kong',
    'kong',
    'Durable dog toys and enrichment products',
    TRUE,
    '/images/brands/kong.png',
    'https://www.kongcompany.com',
    'USA'
);
INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    17,
    'Ferplast',
    'ferplast',
    'Italian pet accessories and habitats',
    TRUE,
    '/images/brands/ferplast.png',
    'https://www.ferplast.com',
    'Italy'
);

-- Insert categories
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    1,
    'Psy',
    'psy',
    'fa-dog',
    'Wszystko dla Twojego psa - karma, zabawki, akcesoria i suplementy',
    '/images/categories/dogs.jpg',
    TRUE
);
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    2,
    'Koty',
    'koty',
    'fa-cat',
    'Produkty dla kotow - karma, zabawki, drapaki i akcesoria',
    '/images/categories/cats.jpg',
    TRUE
);
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    3,
    'Gryzonie',
    'gryzonie',
    'fa-hamster',
    'Karma i akcesoria dla chomikow, krolikow, swinki morskiej',
    '/images/categories/rodents.jpg',
    TRUE
);
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    4,
    'Ptaki',
    'ptaki',
    'fa-dove',
    'Produkty dla papug, kanarków i innych ptakow',
    '/images/categories/birds.jpg',
    TRUE
);
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    5,
    'Ryby',
    'ryby',
    'fa-fish',
    'Akwarystyka - karma, filtry, oswietlenie i dekoracje',
    '/images/categories/fish.jpg',
    TRUE
);
INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    6,
    'Gady',
    'gady',
    'fa-frog',
    'Terrarystyka - karma, terraria i akcesoria dla gadow',
    '/images/categories/reptiles.jpg',
    TRUE
);

-- Insert subcategories
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    1,
    'Karma sucha',
    'psy-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Psy',
    TRUE,
    1,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    2,
    'Karma mokra',
    'psy-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Psy',
    TRUE,
    2,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    3,
    'Przysmaki',
    'psy-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Psy',
    TRUE,
    3,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    4,
    'Zabawki',
    'psy-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Psy',
    TRUE,
    4,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    5,
    'Akcesoria',
    'psy-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Psy',
    TRUE,
    5,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    6,
    'Legowiska',
    'psy-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Psy',
    TRUE,
    6,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    7,
    'Obroze i smycze',
    'psy-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Psy',
    TRUE,
    7,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    8,
    'Suplementy',
    'psy-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Psy',
    TRUE,
    8,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    9,
    'Higiena',
    'psy-higiena',
    'fa-shower',
    'Higiena dla kategorii Psy',
    TRUE,
    9,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    10,
    'Transportery',
    'psy-transportery',
    'fa-box',
    'Transportery dla kategorii Psy',
    TRUE,
    10,
    NULL,
    1,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    11,
    'Karma sucha',
    'koty-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Koty',
    TRUE,
    1,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    12,
    'Karma mokra',
    'koty-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Koty',
    TRUE,
    2,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    13,
    'Przysmaki',
    'koty-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Koty',
    TRUE,
    3,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    14,
    'Zabawki',
    'koty-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Koty',
    TRUE,
    4,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    15,
    'Akcesoria',
    'koty-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Koty',
    TRUE,
    5,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    16,
    'Legowiska',
    'koty-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Koty',
    TRUE,
    6,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    17,
    'Obroze i smycze',
    'koty-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Koty',
    TRUE,
    7,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    18,
    'Suplementy',
    'koty-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Koty',
    TRUE,
    8,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    19,
    'Higiena',
    'koty-higiena',
    'fa-shower',
    'Higiena dla kategorii Koty',
    TRUE,
    9,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    20,
    'Transportery',
    'koty-transportery',
    'fa-box',
    'Transportery dla kategorii Koty',
    TRUE,
    10,
    NULL,
    2,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    21,
    'Karma sucha',
    'gryzonie-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Gryzonie',
    TRUE,
    1,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    22,
    'Karma mokra',
    'gryzonie-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Gryzonie',
    TRUE,
    2,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    23,
    'Przysmaki',
    'gryzonie-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Gryzonie',
    TRUE,
    3,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    24,
    'Zabawki',
    'gryzonie-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Gryzonie',
    TRUE,
    4,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    25,
    'Akcesoria',
    'gryzonie-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Gryzonie',
    TRUE,
    5,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    26,
    'Legowiska',
    'gryzonie-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Gryzonie',
    TRUE,
    6,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    27,
    'Obroze i smycze',
    'gryzonie-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Gryzonie',
    TRUE,
    7,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    28,
    'Suplementy',
    'gryzonie-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Gryzonie',
    TRUE,
    8,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    29,
    'Higiena',
    'gryzonie-higiena',
    'fa-shower',
    'Higiena dla kategorii Gryzonie',
    TRUE,
    9,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    30,
    'Transportery',
    'gryzonie-transportery',
    'fa-box',
    'Transportery dla kategorii Gryzonie',
    TRUE,
    10,
    NULL,
    3,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    31,
    'Karma sucha',
    'ptaki-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Ptaki',
    TRUE,
    1,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    32,
    'Karma mokra',
    'ptaki-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Ptaki',
    TRUE,
    2,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    33,
    'Przysmaki',
    'ptaki-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Ptaki',
    TRUE,
    3,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    34,
    'Zabawki',
    'ptaki-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Ptaki',
    TRUE,
    4,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    35,
    'Akcesoria',
    'ptaki-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Ptaki',
    TRUE,
    5,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    36,
    'Legowiska',
    'ptaki-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Ptaki',
    TRUE,
    6,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    37,
    'Obroze i smycze',
    'ptaki-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Ptaki',
    TRUE,
    7,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    38,
    'Suplementy',
    'ptaki-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Ptaki',
    TRUE,
    8,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    39,
    'Higiena',
    'ptaki-higiena',
    'fa-shower',
    'Higiena dla kategorii Ptaki',
    TRUE,
    9,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    40,
    'Transportery',
    'ptaki-transportery',
    'fa-box',
    'Transportery dla kategorii Ptaki',
    TRUE,
    10,
    NULL,
    4,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    41,
    'Karma sucha',
    'ryby-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Ryby',
    TRUE,
    1,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    42,
    'Karma mokra',
    'ryby-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Ryby',
    TRUE,
    2,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    43,
    'Przysmaki',
    'ryby-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Ryby',
    TRUE,
    3,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    44,
    'Zabawki',
    'ryby-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Ryby',
    TRUE,
    4,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    45,
    'Akcesoria',
    'ryby-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Ryby',
    TRUE,
    5,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    46,
    'Legowiska',
    'ryby-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Ryby',
    TRUE,
    6,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    47,
    'Obroze i smycze',
    'ryby-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Ryby',
    TRUE,
    7,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    48,
    'Suplementy',
    'ryby-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Ryby',
    TRUE,
    8,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    49,
    'Higiena',
    'ryby-higiena',
    'fa-shower',
    'Higiena dla kategorii Ryby',
    TRUE,
    9,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    50,
    'Transportery',
    'ryby-transportery',
    'fa-box',
    'Transportery dla kategorii Ryby',
    TRUE,
    10,
    NULL,
    5,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    51,
    'Karma sucha',
    'gady-karma-sucha',
    'fa-bowl-food',
    'Karma sucha dla kategorii Gady',
    TRUE,
    1,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    52,
    'Karma mokra',
    'gady-karma-mokra',
    'fa-can-food',
    'Karma mokra dla kategorii Gady',
    TRUE,
    2,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    53,
    'Przysmaki',
    'gady-przysmaki',
    'fa-cookie',
    'Przysmaki dla kategorii Gady',
    TRUE,
    3,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    54,
    'Zabawki',
    'gady-zabawki',
    'fa-ball',
    'Zabawki dla kategorii Gady',
    TRUE,
    4,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    55,
    'Akcesoria',
    'gady-akcesoria',
    'fa-tag',
    'Akcesoria dla kategorii Gady',
    TRUE,
    5,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    56,
    'Legowiska',
    'gady-legowiska',
    'fa-bed',
    'Legowiska dla kategorii Gady',
    TRUE,
    6,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    57,
    'Obroze i smycze',
    'gady-obroze-smycze',
    'fa-link',
    'Obroze i smycze dla kategorii Gady',
    TRUE,
    7,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    58,
    'Suplementy',
    'gady-suplementy',
    'fa-pills',
    'Suplementy dla kategorii Gady',
    TRUE,
    8,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    59,
    'Higiena',
    'gady-higiena',
    'fa-shower',
    'Higiena dla kategorii Gady',
    TRUE,
    9,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    60,
    'Transportery',
    'gady-transportery',
    'fa-box',
    'Transportery dla kategorii Gady',
    TRUE,
    10,
    NULL,
    6,
    TIMESTAMP '2026-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);

-- Insert users
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    1,
    'Admin',
    'System',
    'admin@zoo.com',
    '$2a$10$240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa8228',
    '+48 500 000 000',
    'ADMIN',
    'Administracyjna 1',
    'Warszawa',
    '00-001',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-01-26 18:59:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    2,
    'Paweł',
    'Lewandowski',
    'pawel.lewandowski2@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 501 313 501',
    'USER',
    'ul. Polna 74/41',
    'Zabrze',
    '61-854',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-30 03:23:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    3,
    'Marek',
    'Piotrowski',
    'marek.piotrowski3@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 774 915',
    'USER',
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-03 00:42:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    4,
    'Karol',
    'Kamiński',
    'karol.kaminski4@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 606 605 560',
    'USER',
    'ul. Piaskowa 29/23',
    'Rzeszów',
    '87-384',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-26 02:06:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    5,
    'Jakub',
    'Woźniak',
    'jakub.wozniak5@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 601 425 195',
    'USER',
    'ul. Kościelna 83/17',
    'Bydgoszcz',
    '37-769',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-13 04:51:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    6,
    'Karol',
    'Wójcik',
    'karol.wojcik6@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 325 248',
    'USER',
    'ul. Parkowa 4/27',
    'Poznań',
    '52-421',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-21 16:24:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    7,
    'Anna',
    'Nowak',
    'anna.nowak7@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 515 316 483',
    'USER',
    'ul. Zielona 69/16',
    'Radom',
    '59-431',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-29 11:18:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    8,
    'Krystyna',
    'Kamiński',
    'krystyna.kaminski8@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 703 666',
    'USER',
    'ul. Leśna 47/26',
    'Poznań',
    '90-227',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-02 04:55:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    9,
    'Anna',
    'Kozłowski',
    'anna.kozlowski9@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 513 991 466',
    'USER',
    'ul. Łąkowa 60/43',
    'Białystok',
    '30-759',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-09 22:09:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    10,
    'Adam',
    'Kowalczyk',
    'adam.kowalczyk10@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 504 142 823',
    'USER',
    'ul. Szkolna 62/11',
    'Gliwice',
    '23-597',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-04 06:51:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    11,
    'Stanisław',
    'Kwiatkowski',
    'stanislaw.kwiatkowski11@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 513 465 793',
    'USER',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-06 12:14:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    12,
    'Krystyna',
    'Wiśniewski',
    'krystyna.wisniewski12@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 602 498 227',
    'USER',
    'ul. Łąkowa 108/35',
    'Gliwice',
    '66-799',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-23 22:35:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    13,
    'Małgorzata',
    'Krawczyk',
    'malgorzata.krawczyk13@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 608 595 917',
    'USER',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-16 05:17:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    14,
    'Krystyna',
    'Wójcik',
    'krystyna.wojcik14@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 391 175',
    'USER',
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-15 18:19:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    15,
    'Łukasz',
    'Kowalski',
    'lukasz.kowalski15@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 505 461 233',
    'USER',
    'ul. Słoneczna 50/44',
    'Białystok',
    '46-221',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-10 20:51:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    16,
    'Marcin',
    'Krawczyk',
    'marcin.krawczyk16@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 506 706 260',
    'USER',
    'ul. Wodna 84/19',
    'Kielce',
    '21-464',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-29 11:39:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    17,
    'Katarzyna',
    'Kwiatkowski',
    'katarzyna.kwiatkowski17@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 512 408 190',
    'USER',
    'ul. Parkowa 93/32',
    'Gdańsk',
    '31-965',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-06 02:56:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    18,
    'Jakub',
    'Mazur',
    'jakub.mazur18@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 515 605 433',
    'USER',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-15 10:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    19,
    'Agnieszka',
    'Zieliński',
    'agnieszka.zielinski19@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 560 857',
    'USER',
    'ul. Parkowa 147/21',
    'Kielce',
    '78-943',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-25 06:54:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    20,
    'Łukasz',
    'Kowalczyk',
    'lukasz.kowalczyk20@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 484 672',
    'USER',
    'ul. Kościelna 52/18',
    'Katowice',
    '97-802',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-22 04:14:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    21,
    'Małgorzata',
    'Lewandowski',
    'malgorzata.lewandowski21@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 257 753',
    'USER',
    'ul. Kwiatowa 36/49',
    'Gdańsk',
    '28-367',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-29 17:17:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    22,
    'Adam',
    'Woźniak',
    'adam.wozniak22@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 746 715',
    'USER',
    'ul. Zielona 28/32',
    'Częstochowa',
    '87-153',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-01 03:32:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    23,
    'Katarzyna',
    'Zieliński',
    'katarzyna.zielinski23@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 503 363 132',
    'USER',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-03 17:24:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    24,
    'Marek',
    'Piotrowski',
    'marek.piotrowski24@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 607 148 420',
    'USER',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-08 20:01:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    25,
    'Jan',
    'Grabowski',
    'jan.grabowski25@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 509 189 828',
    'USER',
    'ul. Piaskowa 49/27',
    'Warszawa',
    '19-597',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-09 07:57:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    26,
    'Barbara',
    'Szymański',
    'barbara.szymanski26@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 527 631',
    'USER',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-03 22:57:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    27,
    'Jan',
    'Kowalski',
    'jan.kowalski27@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 512 951 169',
    'USER',
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-06 08:52:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    28,
    'Karol',
    'Krawczyk',
    'karol.krawczyk28@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 509 356 104',
    'USER',
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-16 18:25:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    29,
    'Piotr',
    'Wójcik',
    'piotr.wojcik29@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 506 128',
    'USER',
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-27 01:35:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    30,
    'Michał',
    'Wójcik',
    'michal.wojcik30@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 606 924 465',
    'USER',
    'ul. Sportowa 138/17',
    'Wrocław',
    '29-410',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-24 02:00:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    31,
    'Maria',
    'Kozłowski',
    'maria.kozlowski31@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 514 463',
    'USER',
    'ul. Kwiatowa 73/21',
    'Szczecin',
    '21-764',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-08 07:45:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    32,
    'Agnieszka',
    'Jankowski',
    'agnieszka.jankowski32@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 518 248 776',
    'USER',
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-19 19:19:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    33,
    'Michał',
    'Piotrowski',
    'michal.piotrowski33@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 606 388 360',
    'USER',
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-09 13:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    34,
    'Agnieszka',
    'Krawczyk',
    'agnieszka.krawczyk34@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 230 131',
    'USER',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 21:12:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    35,
    'Katarzyna',
    'Zieliński',
    'katarzyna.zielinski35@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 601 760 956',
    'USER',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-08 18:24:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    36,
    'Maria',
    'Kowalczyk',
    'maria.kowalczyk36@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 606 387 893',
    'USER',
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-16 05:17:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    37,
    'Maria',
    'Lewandowski',
    'maria.lewandowski37@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 518 305 743',
    'USER',
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-24 03:11:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    38,
    'Elżbieta',
    'Kowalczyk',
    'elzbieta.kowalczyk38@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 501 495 197',
    'USER',
    'ul. Kwiatowa 110/34',
    'Katowice',
    '71-955',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-15 04:20:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    39,
    'Mateusz',
    'Grabowski',
    'mateusz.grabowski39@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 507 895 973',
    'USER',
    'ul. Słoneczna 32/20',
    'Bydgoszcz',
    '60-347',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-25 03:56:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    40,
    'Mateusz',
    'Piotrowski',
    'mateusz.piotrowski40@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 507 178 316',
    'USER',
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-13 05:22:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    41,
    'Katarzyna',
    'Kowalczyk',
    'katarzyna.kowalczyk41@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 513 823 710',
    'USER',
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-28 19:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    42,
    'Tomasz',
    'Dąbrowski',
    'tomasz.dabrowski42@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 282 863',
    'USER',
    'ul. Rynek 89/18',
    'Gdynia',
    '35-538',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-21 07:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    43,
    'Andrzej',
    'Wiśniewski',
    'andrzej.wisniewski43@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 608 858 439',
    'USER',
    'ul. Wodna 49/8',
    'Kraków',
    '61-962',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-24 19:22:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    44,
    'Jakub',
    'Kozłowski',
    'jakub.kozlowski44@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 494 425',
    'USER',
    'ul. Słoneczna 135/33',
    'Warszawa',
    '49-835',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-10 09:51:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    45,
    'Karol',
    'Wójcik',
    'karol.wojcik45@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 973 347',
    'USER',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-12 23:38:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    46,
    'Krzysztof',
    'Mazur',
    'krzysztof.mazur46@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 503 991 206',
    'USER',
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-16 09:02:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    47,
    'Jan',
    'Kowalski',
    'jan.kowalski47@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 604 982 779',
    'USER',
    'ul. Kwiatowa 56/13',
    'Lublin',
    '46-817',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-01 15:58:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    48,
    'Mateusz',
    'Kowalczyk',
    'mateusz.kowalczyk48@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 607 848 830',
    'USER',
    'ul. Leśna 138/25',
    'Toruń',
    '49-293',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-17 18:58:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    49,
    'Zofia',
    'Wojciechowski',
    'zofia.wojciechowski49@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 500 478 910',
    'USER',
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-16 05:52:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    50,
    'Jan',
    'Woźniak',
    'jan.wozniak50@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 512 493 601',
    'USER',
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 23:48:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    51,
    'Marcin',
    'Grabowski',
    'marcin.grabowski51@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 603 643 630',
    'USER',
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-26 11:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);

-- Insert products
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    1,
    'Royal Canin Maxi Adult',
    'Karma dla duzych psow dorosłych. Wspiera zdrowie stawow i optymalna wage ciała.',
    1,
    289.99,
    NULL,
    3.9,
    '/images/products/dogs/royal-canin-maxi.jpg',
    'ACTIVE',
    198,
    'ZOO-ZH271YJH',
    15.0,
    '34x27x5cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-18 18:31:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    2,
    'Pedigree Adult z wolowina',
    'Pełnoporcjowa karma dla dorosłych psow z soczystą wolowiną.',
    2,
    149.99,
    NULL,
    4.9,
    '/images/products/dogs/pedigree-beef.jpg',
    'ACTIVE',
    170,
    'ZOO-3DLD49ZV',
    12.0,
    '13x31x21cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-12-25 18:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    3,
    'Acana Pacifica Dog',
    'Karma bezzbozowa z rybami z Pacyfiku. 70% składnikow pochodzenia zwierzecego.',
    3,
    359.99,
    NULL,
    3.9,
    '/images/products/dogs/acana-pacifica.jpg',
    'ACTIVE',
    136,
    'ZOO-Y96S6S2W',
    11.4,
    '38x20x17cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-11 11:15:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    4,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych psow sredniej wielkosci z kurczakiem.',
    6,
    319.99,
    223.99,
    4.6,
    '/images/products/dogs/hills-adult.jpg',
    'ACTIVE',
    68,
    'ZOO-9ZQ5PO7J',
    14.0,
    '16x10x14cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-26 18:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    5,
    'Purina Pro Plan Adult Large',
    'Karma dla duzych psow z łososiem. Wspiera zdrowa skore i siersc.',
    4,
    299.99,
    NULL,
    3.9,
    '/images/products/dogs/purina-large.jpg',
    'ACTIVE',
    52,
    'ZOO-NSKHWDM6',
    14.0,
    '46x35x6cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-11-30 07:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    6,
    'Pedigree puszka z kurczakiem',
    'Mokra karma dla psow z delikatnym kurczakiem w sosie.',
    2,
    5.99,
    NULL,
    4.1,
    '/images/products/dogs/pedigree-can.jpg',
    'ACTIVE',
    15,
    'ZOO-LPQ0GXS4',
    0.4,
    '36x12x9cm',
    NULL,
    1,
    2,
    TIMESTAMP '2025-11-28 13:34:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    7,
    'Royal Canin puszka Adult',
    'Mokra karma premium dla dorosłych psow. Kawałki w sosie.',
    1,
    8.99,
    NULL,
    4.3,
    '/images/products/dogs/rc-can.jpg',
    'ACTIVE',
    197,
    'ZOO-VHVAIXBZ',
    0.4,
    '30x14x14cm',
    NULL,
    1,
    2,
    TIMESTAMP '2025-12-10 05:36:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    8,
    'Pedigree Dentastix',
    'Przysmaki dentystyczne dla psow. Zmniejszaja osadzanie sie kamienia.',
    2,
    24.99,
    NULL,
    3.7,
    '/images/products/dogs/dentastix.jpg',
    'ACTIVE',
    78,
    'ZOO-DZ5V4FWV',
    0.27,
    '25x33x6cm',
    NULL,
    1,
    3,
    TIMESTAMP '2025-12-15 05:07:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    9,
    'Kong Classic czerwony L',
    'Wytrzymała zabawka dla psow do wypełniania przysmakami.',
    16,
    59.99,
    NULL,
    4.5,
    '/images/products/dogs/kong-classic.jpg',
    'ACTIVE',
    40,
    'ZOO-2MYJYGFR',
    0.3,
    '39x15x26cm',
    NULL,
    1,
    4,
    TIMESTAMP '2026-01-09 13:09:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    10,
    'Trixie piłka tenisowa 3szt',
    'Zestaw 3 piłek tenisowych dla psow. Idealne do aportowania.',
    15,
    14.99,
    NULL,
    3.7,
    '/images/products/dogs/tennis-balls.jpg',
    'ACTIVE',
    140,
    'ZOO-XVN8SOEY',
    0.2,
    '24x14x8cm',
    NULL,
    1,
    4,
    TIMESTAMP '2026-01-20 20:22:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    11,
    'Kong Wubba L',
    'Zabawka do przeciągania i aportowania z piszczałką.',
    16,
    49.99,
    NULL,
    4.6,
    '/images/products/dogs/kong-wubba.jpg',
    'ACTIVE',
    32,
    'ZOO-92JAC5IE',
    0.25,
    '36x26x30cm',
    NULL,
    1,
    4,
    TIMESTAMP '2025-12-14 14:05:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    12,
    'Trixie legowisko owalne 80cm',
    'Miekkie legowisko dla srednih i duzych psow. Łatwe w czyszczeniu.',
    15,
    129.99,
    NULL,
    4.6,
    '/images/products/dogs/bed-oval.jpg',
    'ACTIVE',
    65,
    'ZOO-N6S29KVB',
    1.5,
    '31x10x21cm',
    NULL,
    1,
    6,
    TIMESTAMP '2025-11-30 14:19:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    13,
    'Ferplast legowisko Siesta 6',
    'Plastikowe legowisko z miekka poduszka. Rozmiar dla duzych psow.',
    17,
    149.99,
    NULL,
    4.0,
    '/images/products/dogs/ferplast-siesta.jpg',
    'ACTIVE',
    121,
    'ZOO-56F1Z5RY',
    2.0,
    '11x36x13cm',
    NULL,
    1,
    6,
    TIMESTAMP '2025-12-01 20:56:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    14,
    'Trixie obroza skorzana M',
    'Klasyczna obroza ze skory naturalnej. Regulowana dlugosc.',
    15,
    39.99,
    NULL,
    4.6,
    '/images/products/dogs/leather-collar.jpg',
    'ACTIVE',
    93,
    'ZOO-F7QIMYT0',
    0.1,
    '17x20x12cm',
    NULL,
    1,
    7,
    TIMESTAMP '2026-01-06 09:56:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    15,
    'Trixie smycz automatyczna 5m',
    'Smycz flexi z blokada i ergonomicznym uchwytem.',
    15,
    79.99,
    NULL,
    3.5,
    '/images/products/dogs/flexi-leash.jpg',
    'ACTIVE',
    30,
    'ZOO-J6UFKRZM',
    0.3,
    '28x22x12cm',
    NULL,
    1,
    7,
    TIMESTAMP '2025-11-27 14:36:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    16,
    'Royal Canin Mobility Support',
    'Suplement wspierajacy stawy i mobilnosc u psow.',
    1,
    89.99,
    NULL,
    4.9,
    '/images/products/dogs/mobility-support.jpg',
    'ACTIVE',
    146,
    'ZOO-7YP4J97C',
    0.5,
    '15x36x15cm',
    NULL,
    1,
    8,
    TIMESTAMP '2026-01-06 08:01:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    17,
    'Trixie szampon uniwersalny 1L',
    'Delikatny szampon dla psow o kazdym typie sierści.',
    15,
    34.99,
    NULL,
    3.6,
    '/images/products/dogs/shampoo.jpg',
    'ACTIVE',
    77,
    'ZOO-5HLGAGGU',
    1.0,
    '23x24x26cm',
    NULL,
    1,
    9,
    TIMESTAMP '2026-01-08 21:11:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    18,
    'Ferplast transporter Atlas 40',
    'Transporter plastikowy dla psow do 18kg. Zgodny z IATA.',
    17,
    189.99,
    NULL,
    4.2,
    '/images/products/dogs/atlas-carrier.jpg',
    'ACTIVE',
    153,
    'ZOO-Q8QDXCQ3',
    3.5,
    '42x14x23cm',
    NULL,
    1,
    10,
    TIMESTAMP '2025-12-29 14:22:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    19,
    'Royal Canin Indoor Cat',
    'Karma dla kotow domowych. Redukuje zapach kuwety.',
    1,
    249.99,
    NULL,
    4.6,
    '/images/products/cats/rc-indoor.jpg',
    'ACTIVE',
    158,
    'ZOO-I3GJ1M14',
    10.0,
    '42x14x6cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-06 06:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    20,
    'Whiskas z kurczakiem',
    'Karma sucha dla dorosłych kotow z pysznym kurczakiem.',
    5,
    89.99,
    NULL,
    3.8,
    '/images/products/cats/whiskas-chicken.jpg',
    'ACTIVE',
    166,
    'ZOO-I9CLTAA6',
    7.0,
    '13x29x15cm',
    NULL,
    2,
    11,
    TIMESTAMP '2026-01-10 16:30:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    21,
    'Purina Pro Plan Sterilised',
    'Karma dla kotow sterylizowanych z łososiem.',
    4,
    269.99,
    NULL,
    4.0,
    '/images/products/cats/purina-sterilised.jpg',
    'ACTIVE',
    81,
    'ZOO-N11JBT96',
    10.0,
    '21x29x19cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-28 07:58:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    22,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych kotow z tuńczykiem.',
    6,
    229.99,
    NULL,
    4.5,
    '/images/products/cats/hills-tuna.jpg',
    'ACTIVE',
    24,
    'ZOO-I4YIB2JJ',
    7.0,
    '37x28x16cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-08 05:28:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    23,
    'Sheba saszetki z łososiem 12x85g',
    'Mokra karma premium w saszatkach. Delikatne kawałki w sosie.',
    7,
    32.99,
    23.09,
    4.1,
    '/images/products/cats/sheba-salmon.jpg',
    'ACTIVE',
    80,
    'ZOO-8X9FDSTZ',
    1.02,
    '37x34x8cm',
    NULL,
    2,
    12,
    TIMESTAMP '2025-12-04 00:56:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    24,
    'Whiskas puszka z tunczykiem',
    'Mokra karma dla kotow z tunczykiem w galaretce.',
    5,
    4.49,
    NULL,
    4.7,
    '/images/products/cats/whiskas-can.jpg',
    'ACTIVE',
    185,
    'ZOO-V371BK20',
    0.4,
    '47x17x30cm',
    NULL,
    2,
    12,
    TIMESTAMP '2026-01-10 15:17:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    25,
    'Whiskas Temptations kurczak',
    'Chrupiace przysmaki z miekkim nadzieniem.',
    5,
    8.99,
    NULL,
    4.5,
    '/images/products/cats/temptations.jpg',
    'ACTIVE',
    49,
    'ZOO-D5JYBGIG',
    0.06,
    '43x11x13cm',
    NULL,
    2,
    13,
    TIMESTAMP '2025-12-21 00:25:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    26,
    'Trixie myszka pluszowa 3szt',
    'Zestaw pluszowych myszek z kocimiętką.',
    15,
    12.99,
    NULL,
    3.6,
    '/images/products/cats/plush-mice.jpg',
    'ACTIVE',
    197,
    'ZOO-GCMOQQ6W',
    0.05,
    '22x18x9cm',
    NULL,
    2,
    14,
    TIMESTAMP '2025-12-31 21:21:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    27,
    'Trixie wedka z piórkami',
    'Interaktywna wedka z kolorowymi piórkami.',
    15,
    19.99,
    NULL,
    4.0,
    '/images/products/cats/feather-wand.jpg',
    'ACTIVE',
    137,
    'ZOO-PF68MR53',
    0.1,
    '46x14x29cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-21 02:53:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    28,
    'Ferplast tunel dla kota',
    'Składany tunel do zabawy z szelestrzącym materiałem.',
    17,
    49.99,
    NULL,
    4.8,
    '/images/products/cats/tunnel.jpg',
    'ACTIVE',
    138,
    'ZOO-2494PMHY',
    0.3,
    '32x22x16cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-18 19:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    29,
    'Trixie drapak słupek 60cm',
    'Drapak z sizalowym słupkiem i platformą.',
    15,
    79.99,
    NULL,
    4.5,
    '/images/products/cats/scratching-post.jpg',
    'ACTIVE',
    64,
    'ZOO-KEHZ7Q1P',
    3.0,
    '33x10x6cm',
    NULL,
    2,
    15,
    TIMESTAMP '2026-01-26 17:02:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    30,
    'Trixie legowisko na kaloryfer',
    'Miekkie legowisko do zawieszenia na kaloryferze.',
    15,
    59.99,
    NULL,
    3.9,
    '/images/products/cats/radiator-bed.jpg',
    'ACTIVE',
    75,
    'ZOO-8H0VBX4D',
    0.5,
    '17x27x10cm',
    NULL,
    2,
    16,
    TIMESTAMP '2025-12-28 10:19:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    31,
    'Ferplast kuweta Netta',
    'Zamknięta kuweta z filrem węglowym.',
    17,
    89.99,
    NULL,
    4.4,
    '/images/products/cats/litter-box.jpg',
    'ACTIVE',
    11,
    'ZOO-NRRR9ICC',
    2.5,
    '34x17x11cm',
    NULL,
    2,
    19,
    TIMESTAMP '2025-12-08 22:00:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    32,
    'Trixie żwirek betonit 10L',
    'Zbrylający żwirek o delikatnym zapachu.',
    15,
    29.99,
    NULL,
    4.2,
    '/images/products/cats/litter.jpg',
    'ACTIVE',
    18,
    'ZOO-74F1PDEG',
    8.0,
    '20x10x5cm',
    NULL,
    2,
    19,
    TIMESTAMP '2025-12-18 06:48:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    33,
    'Royal Canin Hairball Care',
    'Suplement pomagający w usuwaniu kul włosowych.',
    1,
    49.99,
    NULL,
    4.5,
    '/images/products/cats/hairball.jpg',
    'ACTIVE',
    70,
    'ZOO-M9B9SJXQ',
    0.4,
    '20x12x6cm',
    NULL,
    2,
    18,
    TIMESTAMP '2026-01-25 12:41:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    34,
    'Ferplast transporter Atlas 20',
    'Transporter dla kotow z wentylacją.',
    17,
    99.99,
    NULL,
    3.9,
    '/images/products/cats/carrier.jpg',
    'ACTIVE',
    73,
    'ZOO-YBHCPIRJ',
    2.0,
    '34x16x24cm',
    NULL,
    2,
    20,
    TIMESTAMP '2026-01-14 18:44:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    35,
    'Vitakraft Menu Vital chomik',
    'Pełnowartościowa karma dla chomików z witaminami.',
    8,
    24.99,
    NULL,
    4.4,
    '/images/products/rodents/vitakraft-hamster.jpg',
    'ACTIVE',
    31,
    'ZOO-3XUABPAA',
    1.0,
    '14x23x17cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-25 20:04:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    36,
    'Versele-Laga Crispy Muesli',
    'Mieszanka dla królików z warzywami i ziołami.',
    9,
    39.99,
    33.99,
    4.9,
    '/images/products/rodents/crispy-rabbit.jpg',
    'ACTIVE',
    104,
    'ZOO-ZQWY6NF8',
    2.75,
    '38x29x15cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-21 03:42:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    37,
    'Vitakraft karma dla świnki',
    'Karma dla świnek morskich z witaminą C.',
    8,
    26.99,
    NULL,
    3.8,
    '/images/products/rodents/guinea-food.jpg',
    'ACTIVE',
    15,
    'ZOO-CQ00KHFD',
    1.0,
    '19x13x6cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-23 06:29:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    38,
    'Versele-Laga Complete Hamster',
    'Ekstrudowana karma dla chomików. All-in-one.',
    9,
    19.99,
    NULL,
    4.4,
    '/images/products/rodents/complete-hamster.jpg',
    'ACTIVE',
    200,
    'ZOO-63I2BDVC',
    0.5,
    '29x29x28cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-06 22:58:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    39,
    'Vitakraft Kracker miód',
    'Kolby z miodem dla gryzoni.',
    8,
    9.99,
    NULL,
    4.2,
    '/images/products/rodents/honey-sticks.jpg',
    'ACTIVE',
    37,
    'ZOO-FDJ2GZ7I',
    0.2,
    '42x18x24cm',
    NULL,
    3,
    23,
    TIMESTAMP '2026-01-16 07:43:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    40,
    'Trixie domek drewniany M',
    'Domek z naturalnego drewna dla chomika.',
    15,
    29.99,
    NULL,
    4.1,
    '/images/products/rodents/wooden-house.jpg',
    'ACTIVE',
    53,
    'ZOO-9QMMCXTC',
    0.3,
    '48x17x12cm',
    NULL,
    3,
    25,
    TIMESTAMP '2025-12-07 07:04:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    41,
    'Trixie kołowrotek 20cm',
    'Metalowy kołowrotek dla chomika i myszki.',
    15,
    39.99,
    NULL,
    3.5,
    '/images/products/rodents/wheel.jpg',
    'ACTIVE',
    111,
    'ZOO-T116NU0Z',
    0.4,
    '42x33x23cm',
    NULL,
    3,
    24,
    TIMESTAMP '2025-11-27 08:07:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    42,
    'Ferplast klatka Criceti 100',
    'Duża klatka dla chomików z wyposażeniem.',
    17,
    249.99,
    NULL,
    3.5,
    '/images/products/rodents/cage.jpg',
    'ACTIVE',
    73,
    'ZOO-R54XJS1U',
    5.0,
    '30x35x17cm',
    NULL,
    3,
    25,
    TIMESTAMP '2025-12-28 10:05:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    43,
    'Trixie siano łąkowe 1kg',
    'Naturalne siano dla królików i gryzoni.',
    15,
    14.99,
    NULL,
    3.8,
    '/images/products/rodents/hay.jpg',
    'ACTIVE',
    149,
    'ZOO-394VPQDE',
    1.0,
    '10x14x7cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-19 04:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    44,
    'Vitakraft witaminy krople',
    'Witaminy w kroplach dla gryzoni.',
    8,
    19.99,
    13.99,
    3.5,
    '/images/products/rodents/vitamins.jpg',
    'ACTIVE',
    63,
    'ZOO-4UFIMGGN',
    0.05,
    '28x36x29cm',
    NULL,
    3,
    28,
    TIMESTAMP '2025-12-21 18:17:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    45,
    'Versele-Laga Prestige papuga',
    'Mieszanka ziaren dla średnich papug.',
    9,
    29.99,
    NULL,
    4.5,
    '/images/products/birds/prestige-parrot.jpg',
    'ACTIVE',
    136,
    'ZOO-Q59G1IEY',
    1.0,
    '39x13x25cm',
    NULL,
    4,
    31,
    TIMESTAMP '2026-01-05 10:09:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    46,
    'Vitakraft kanarek Premium',
    'Karma dla kanarków z ziołami.',
    8,
    24.99,
    NULL,
    3.8,
    '/images/products/birds/canary-food.jpg',
    'ACTIVE',
    190,
    'ZOO-Q6GEARBS',
    0.8,
    '45x24x14cm',
    NULL,
    4,
    31,
    TIMESTAMP '2025-11-29 20:46:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    47,
    'Versele-Laga NutriBird',
    'Ekstrudowana karma dla papug.',
    9,
    49.99,
    NULL,
    3.7,
    '/images/products/birds/nutribird.jpg',
    'ACTIVE',
    165,
    'ZOO-W0XT3IDT',
    1.0,
    '17x15x8cm',
    NULL,
    4,
    31,
    TIMESTAMP '2025-12-11 15:38:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    48,
    'Vitakraft Kracker jajeczny',
    'Kolba z jajkiem dla kanarków.',
    8,
    7.99,
    NULL,
    4.7,
    '/images/products/birds/egg-stick.jpg',
    'ACTIVE',
    85,
    'ZOO-D1A73BF5',
    0.1,
    '29x31x13cm',
    NULL,
    4,
    33,
    TIMESTAMP '2026-01-12 04:43:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    49,
    'Trixie huśtawka drewniana',
    'Huśtawka z naturalnego drewna dla ptaków.',
    15,
    14.99,
    NULL,
    4.9,
    '/images/products/birds/swing.jpg',
    'ACTIVE',
    50,
    'ZOO-4C17OMCG',
    0.15,
    '48x19x25cm',
    NULL,
    4,
    34,
    TIMESTAMP '2026-01-13 03:37:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    50,
    'Ferplast klatka Piano 6',
    'Duża klatka dla kanarków i papużek.',
    17,
    349.99,
    297.49,
    3.8,
    '/images/products/birds/cage.jpg',
    'ACTIVE',
    145,
    'ZOO-XQBHCWLD',
    8.0,
    '22x22x18cm',
    NULL,
    4,
    35,
    TIMESTAMP '2025-12-02 05:15:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    51,
    'Trixie żerdź korowa 2szt',
    'Naturalne żerdzie z kory dla ptaków.',
    15,
    19.99,
    NULL,
    4.2,
    '/images/products/birds/perches.jpg',
    'ACTIVE',
    194,
    'ZOO-4TZGMJBP',
    0.2,
    '14x32x28cm',
    NULL,
    4,
    35,
    TIMESTAMP '2025-12-06 01:33:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    52,
    'Vitakraft piasek dla ptaków',
    'Piasek z muszlami dla lepszego trawienia.',
    8,
    12.99,
    NULL,
    5.0,
    '/images/products/birds/sand.jpg',
    'ACTIVE',
    167,
    'ZOO-BTQITDM2',
    2.5,
    '29x39x23cm',
    NULL,
    4,
    39,
    TIMESTAMP '2025-12-13 20:35:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    53,
    'Tetra Pro Energy',
    'Wysokoenergetyczna karma w płatkach.',
    10,
    79.99,
    NULL,
    4.6,
    '/images/products/fish/tetra-pro.jpg',
    'ACTIVE',
    81,
    'ZOO-N5RV5AI8',
    0.5,
    '21x23x16cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-10 02:52:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    54,
    'Tropical Supervit',
    'Wieloskładnikowa karma dla ryb tropikalnych.',
    12,
    39.99,
    NULL,
    4.5,
    '/images/products/fish/supervit.jpg',
    'ACTIVE',
    99,
    'ZOO-DR23A5YR',
    0.25,
    '36x18x28cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-10 09:13:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    55,
    'JBL NovoTab',
    'Tabletki pokarmowe dla ryb dennych.',
    11,
    44.99,
    NULL,
    5.0,
    '/images/products/fish/novotab.jpg',
    'ACTIVE',
    27,
    'ZOO-67OIGSDI',
    0.25,
    '11x12x19cm',
    NULL,
    5,
    41,
    TIMESTAMP '2025-12-18 22:27:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    56,
    'Tetra Goldfish',
    'Karma dla złotych rybek w płatkach.',
    10,
    29.99,
    22.49,
    4.8,
    '/images/products/fish/goldfish.jpg',
    'ACTIVE',
    69,
    'ZOO-ZDHQI4B3',
    0.2,
    '34x33x24cm',
    NULL,
    5,
    41,
    TIMESTAMP '2025-12-07 16:50:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    57,
    'JBL ProFlora u500',
    'Butla CO2 500g do nawożenia roślin.',
    11,
    149.99,
    NULL,
    4.5,
    '/images/products/fish/co2.jpg',
    'ACTIVE',
    138,
    'ZOO-9NKC1TTP',
    1.2,
    '14x30x12cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-12-27 11:32:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    58,
    'Tetra EasyCrystal 600',
    'Filtr wewnętrzny do akwariów 50-150L.',
    10,
    129.99,
    NULL,
    4.9,
    '/images/products/fish/filter.jpg',
    'ACTIVE',
    92,
    'ZOO-9XVROFJM',
    0.8,
    '25x15x20cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-12-05 16:05:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    59,
    'JBL LED Solar Nature',
    'Oświetlenie LED do akwariów roślinnych.',
    11,
    399.99,
    NULL,
    3.5,
    '/images/products/fish/led-light.jpg',
    'ACTIVE',
    141,
    'ZOO-AYA4JD19',
    1.5,
    '48x35x18cm',
    NULL,
    5,
    45,
    TIMESTAMP '2026-01-06 00:39:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    60,
    'Tetra Aqua Safe 500ml',
    'Uzdatniacz wody usuwający chlor.',
    10,
    49.99,
    NULL,
    4.2,
    '/images/products/fish/aquasafe.jpg',
    'ACTIVE',
    130,
    'ZOO-DEACR2RF',
    0.5,
    '40x16x22cm',
    NULL,
    5,
    49,
    TIMESTAMP '2025-12-30 15:00:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    61,
    'JBL Denitrol 250ml',
    'Bakterie startowe do nowych akwariów.',
    11,
    59.99,
    44.99,
    4.2,
    '/images/products/fish/denitrol.jpg',
    'ACTIVE',
    38,
    'ZOO-R8GES5LF',
    0.3,
    '32x18x14cm',
    NULL,
    5,
    48,
    TIMESTAMP '2026-01-15 02:34:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    62,
    'Tropical korzeń mangrowca M',
    'Naturalny korzeń do dekoracji akwarium.',
    12,
    69.99,
    NULL,
    3.6,
    '/images/products/fish/root.jpg',
    'ACTIVE',
    47,
    'ZOO-MUVXKODB',
    0.8,
    '42x33x18cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-12-05 20:55:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    63,
    'Zoo Med karma dla żółwia',
    'Pływające granulki dla żółwi wodnych.',
    13,
    49.99,
    NULL,
    4.5,
    '/images/products/reptiles/turtle-food.jpg',
    'ACTIVE',
    114,
    'ZOO-BNJGB1MC',
    0.35,
    '34x28x9cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-27 22:41:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    64,
    'Exo Terra karma dla brodatych',
    'Karma dla agam brodatych dorosłych.',
    14,
    39.99,
    NULL,
    3.9,
    '/images/products/reptiles/bearded-dragon.jpg',
    'ACTIVE',
    40,
    'ZOO-QB23MK3N',
    0.25,
    '18x30x27cm',
    NULL,
    6,
    51,
    TIMESTAMP '2026-01-25 14:30:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    65,
    'Zoo Med świerszcze liofiliz.',
    'Suszone świerszcze dla gadów i płazów.',
    13,
    34.99,
    29.74,
    5.0,
    '/images/products/reptiles/crickets.jpg',
    'ACTIVE',
    106,
    'ZOO-JDO2Q7G9',
    0.08,
    '28x38x17cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-16 06:55:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    66,
    'Exo Terra terrarium 60x45x45',
    'Szklane terrarium z wentylacją.',
    14,
    599.99,
    449.99,
    4.9,
    '/images/products/reptiles/terrarium.jpg',
    'ACTIVE',
    161,
    'ZOO-BZQ7ADO3',
    25.0,
    '42x31x9cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-06 11:14:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    67,
    'Zoo Med lampa UVB 10.0',
    'Świetlówka UVB dla gadów pustynnych.',
    13,
    89.99,
    NULL,
    4.0,
    '/images/products/reptiles/uvb-lamp.jpg',
    'ACTIVE',
    52,
    'ZOO-471VAZU1',
    0.2,
    '44x29x29cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-15 01:54:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    68,
    'Exo Terra Heat Mat M',
    'Mata grzewcza 16W do terrarium.',
    14,
    79.99,
    NULL,
    4.0,
    '/images/products/reptiles/heat-mat.jpg',
    'ACTIVE',
    112,
    'ZOO-08WV0JDY',
    0.3,
    '15x29x22cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-06 08:09:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    69,
    'Zoo Med Repti Calcium',
    'Wapno bez D3 dla gadów.',
    13,
    44.99,
    NULL,
    3.7,
    '/images/products/reptiles/calcium.jpg',
    'ACTIVE',
    128,
    'ZOO-9519LUBD',
    0.25,
    '43x37x27cm',
    NULL,
    6,
    58,
    TIMESTAMP '2026-01-15 17:47:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    70,
    'Exo Terra kryjówka jaskinia M',
    'Naturalna dekoracja - kryjówka.',
    14,
    49.99,
    NULL,
    3.8,
    '/images/products/reptiles/hide.jpg',
    'ACTIVE',
    158,
    'ZOO-E9JBCLM6',
    0.8,
    '25x24x18cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-07 09:26:58',
    TIMESTAMP '2026-01-26 18:59:58'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    71,
    'Zoo Med Eco Earth 3-pack',
    'Podłoże kokosowe do terrarów.',
    13,
    39.99,
    NULL,
    4.3,
    '/images/products/reptiles/substrate.jpg',
    'ACTIVE',
    44,
    'ZOO-3HGOOUX3',
    0.6,
    '11x13x18cm',
    NULL,
    6,
    59,
    TIMESTAMP '2025-11-27 02:14:58',
    TIMESTAMP '2026-01-26 18:59:58'
);

-- Insert orders
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    1,
    'ZAM-20260126-459943',
    TIMESTAMP '2026-01-24 01:47:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    949.95,
    968.45,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL41253720',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-24 12:47:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    2,
    'ZAM-20260126-974229',
    TIMESTAMP '2025-12-22 15:49:58',
    'CONFIRMED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    36.97,
    49.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 10:49:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    3,
    'ZAM-20260126-142558',
    TIMESTAMP '2026-01-15 04:04:58',
    'CONFIRMED',
    'PENDING',
    'CARD',
    'PICKUP',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    204.97,
    194.35,
    0.0,
    10.62,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 07:04:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    4,
    'ZAM-20260126-733542',
    TIMESTAMP '2026-01-17 09:35:58',
    'CONFIRMED',
    'PAID',
    'CARD',
    'PICKUP',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    316.92,
    274.35,
    0.0,
    42.57,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-18 01:35:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    5,
    'ZAM-20260126-746774',
    TIMESTAMP '2025-12-02 08:10:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 36/49',
    'Gdańsk',
    '28-367',
    'Poland',
    'ul. Kwiatowa 36/49',
    'Gdańsk',
    '28-367',
    'Poland',
    231.44,
    244.43,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL83565009',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 05:10:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    6,
    'ZAM-20260126-569756',
    TIMESTAMP '2026-01-19 02:29:58',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    439.93,
    404.48,
    0.0,
    35.45,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 22:29:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    7,
    'ZAM-20260126-624169',
    TIMESTAMP '2026-01-23 03:23:58',
    'PACKED',
    'FAILED',
    'BLIK',
    'LOCKER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    79.98,
    92.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-23 13:23:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    8,
    'ZAM-20260126-591150',
    TIMESTAMP '2025-12-22 17:47:58',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    17,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 93/32',
    'Gdańsk',
    '31-965',
    'Poland',
    'ul. Parkowa 93/32',
    'Gdańsk',
    '31-965',
    'Poland',
    1012.92,
    953.38,
    18.5,
    78.04,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL94104175',
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 17:47:58',
    TIMESTAMP '2025-12-23 05:47:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    9,
    'ZAM-20260126-804882',
    TIMESTAMP '2025-12-10 19:20:58',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    353.9,
    353.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL61540557',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-11 19:20:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    10,
    'ZAM-20260126-740771',
    TIMESTAMP '2026-01-18 23:09:58',
    'PROCESSING',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    223.99,
    236.98,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 17:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    11,
    'ZAM-20260126-315281',
    TIMESTAMP '2026-01-08 16:36:58',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    799.93,
    799.93,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-09 09:36:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    12,
    'ZAM-20260126-563719',
    TIMESTAMP '2025-12-14 04:19:58',
    'PENDING',
    'PENDING',
    'BLIK',
    'COURIER',
    30,
    NULL,
    NULL,
    NULL,
    'ul. Sportowa 138/17',
    'Wrocław',
    '29-410',
    'Poland',
    'ul. Sportowa 138/17',
    'Wrocław',
    '29-410',
    'Poland',
    291.11,
    280.17,
    18.5,
    29.44,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-16 04:19:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    13,
    'ZAM-20260126-999723',
    TIMESTAMP '2025-12-18 08:20:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'PICKUP',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    134.97,
    134.97,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL32553529',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-18 10:20:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    14,
    'ZAM-20260126-468346',
    TIMESTAMP '2026-01-11 23:37:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'COURIER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    1669.88,
    1688.38,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL83760353',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-12 21:37:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    15,
    'ZAM-20260126-606219',
    TIMESTAMP '2025-12-23 11:44:58',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'COURIER',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    542.94,
    561.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL36524368',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 23:44:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    16,
    'ZAM-20260126-453572',
    TIMESTAMP '2025-12-07 06:16:58',
    'PROCESSING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    99.98,
    112.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 23:16:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    17,
    'ZAM-20260126-008362',
    TIMESTAMP '2025-12-29 19:54:58',
    'PACKED',
    'PENDING',
    'CARD',
    'LOCKER',
    3,
    NULL,
    NULL,
    NULL,
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    39.98,
    52.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 23:54:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    18,
    'ZAM-20260126-289886',
    TIMESTAMP '2025-12-17 16:44:58',
    'PENDING',
    'PENDING',
    'BLIK',
    'PICKUP',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 84/19',
    'Kielce',
    '21-464',
    'Poland',
    'ul. Wodna 84/19',
    'Kielce',
    '21-464',
    'Poland',
    1539.52,
    1539.52,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-18 01:44:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    19,
    'ZAM-20260126-452976',
    TIMESTAMP '2025-12-06 03:34:58',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 147/21',
    'Kielce',
    '78-943',
    'Poland',
    'ul. Parkowa 147/21',
    'Kielce',
    '78-943',
    'Poland',
    738.91,
    757.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL73660176',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-06 18:34:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    20,
    'ZAM-20260126-138238',
    TIMESTAMP '2026-01-17 22:30:58',
    'PENDING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    379.94,
    379.94,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-18 08:30:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    21,
    'ZAM-20260126-477191',
    TIMESTAMP '2025-12-16 21:16:58',
    'PENDING',
    'PAID',
    'CARD',
    'PICKUP',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    159.95,
    144.95,
    0.0,
    15.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-18 08:16:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    22,
    'ZAM-20260126-976257',
    TIMESTAMP '2025-11-28 08:12:58',
    'PACKED',
    'PENDING',
    'BLIK',
    'LOCKER',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    59.97,
    72.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-29 14:12:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    23,
    'ZAM-20260126-547083',
    TIMESTAMP '2025-11-27 23:04:58',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    1074.91,
    1087.9,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL11631715',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-28 02:04:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    24,
    'ZAM-20260126-132626',
    TIMESTAMP '2025-12-27 23:15:58',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'COURIER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 138/25',
    'Toruń',
    '49-293',
    'Poland',
    'ul. Leśna 138/25',
    'Toruń',
    '49-293',
    'Poland',
    269.97,
    288.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 12:15:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-29 16:15:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    25,
    'ZAM-20260126-811415',
    TIMESTAMP '2025-12-18 15:01:58',
    'PENDING',
    'FAILED',
    'CARD',
    'LOCKER',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    1166.9,
    1179.89,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-19 21:01:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    26,
    'ZAM-20260126-965136',
    TIMESTAMP '2025-12-17 08:43:58',
    'PACKED',
    'PAID',
    'TRANSFER',
    'COURIER',
    50,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    1358.91,
    1377.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-18 21:43:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    27,
    'ZAM-20260126-524277',
    TIMESTAMP '2026-01-05 20:59:58',
    'PENDING',
    'PAID',
    'CARD',
    'LOCKER',
    6,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 4/27',
    'Poznań',
    '52-421',
    'Poland',
    'ul. Parkowa 4/27',
    'Poznań',
    '52-421',
    'Poland',
    399.93,
    360.3,
    12.99,
    52.62,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-06 13:59:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    28,
    'ZAM-20260126-484126',
    TIMESTAMP '2026-01-02 06:09:58',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'LOCKER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 28/32',
    'Częstochowa',
    '87-153',
    'Poland',
    'ul. Zielona 28/32',
    'Częstochowa',
    '87-153',
    'Poland',
    439.92,
    452.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL40161444',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-03 04:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    29,
    'ZAM-20260126-611902',
    TIMESTAMP '2026-01-05 14:45:58',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    999.96,
    916.82,
    0.0,
    83.14,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL60894222',
    NULL,
    NULL,
    TIMESTAMP '2026-01-09 14:45:58',
    TIMESTAMP '2026-01-05 16:45:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    30,
    'ZAM-20260126-449484',
    TIMESTAMP '2025-12-12 08:24:58',
    'PACKED',
    'FAILED',
    'BLIK',
    'PICKUP',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    74.97,
    68.65,
    0.0,
    6.32,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 19:24:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    31,
    'ZAM-20260126-812050',
    TIMESTAMP '2025-12-21 07:08:58',
    'PROCESSING',
    'FAILED',
    'CARD',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    187.92,
    187.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-22 01:08:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    32,
    'ZAM-20260126-558407',
    TIMESTAMP '2025-12-30 16:53:58',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    129.95,
    142.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 17:53:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-31 13:53:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    33,
    'ZAM-20260126-198425',
    TIMESTAMP '2025-12-22 13:06:58',
    'PACKED',
    'FAILED',
    'BLIK',
    'PICKUP',
    3,
    NULL,
    NULL,
    NULL,
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    467.38,
    467.38,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 19:06:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    34,
    'ZAM-20260126-507852',
    TIMESTAMP '2025-12-07 21:54:58',
    'PACKED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    259.98,
    272.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 01:54:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    35,
    'ZAM-20260126-305947',
    TIMESTAMP '2025-12-01 08:03:58',
    'DELIVERED',
    'PAID',
    'BLIK',
    'COURIER',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    59.48,
    77.98,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL13278021',
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 08:03:58',
    TIMESTAMP '2025-12-02 12:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    36,
    'ZAM-20260126-781659',
    TIMESTAMP '2026-01-02 05:49:58',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Polna 74/41',
    'Zabrze',
    '61-854',
    'Poland',
    'ul. Polna 74/41',
    'Zabrze',
    '61-854',
    'Poland',
    239.23,
    239.23,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-03 12:49:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    37,
    'ZAM-20260126-483533',
    TIMESTAMP '2026-01-14 12:52:58',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'PICKUP',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 60/43',
    'Białystok',
    '30-759',
    'Poland',
    'ul. Łąkowa 60/43',
    'Białystok',
    '30-759',
    'Poland',
    799.98,
    799.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL64605565',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 04:52:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    38,
    'ZAM-20260126-936378',
    TIMESTAMP '2025-11-27 08:50:58',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 110/34',
    'Katowice',
    '71-955',
    'Poland',
    'ul. Kwiatowa 110/34',
    'Katowice',
    '71-955',
    'Poland',
    599.9,
    599.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL44149039',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-29 04:50:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    39,
    'ZAM-20260126-264802',
    TIMESTAMP '2026-01-26 03:43:58',
    'PENDING',
    'PAID',
    'BLIK',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    139.97,
    144.15,
    18.5,
    14.32,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-26 22:43:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    40,
    'ZAM-20260126-377631',
    TIMESTAMP '2025-11-28 21:02:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'PICKUP',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    359.96,
    359.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL32307777',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-30 20:02:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    41,
    'ZAM-20260126-608311',
    TIMESTAMP '2026-01-19 04:14:58',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'PICKUP',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    488.92,
    488.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-19 17:14:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-19 06:14:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    42,
    'ZAM-20260126-482296',
    TIMESTAMP '2026-01-13 09:49:58',
    'PACKED',
    'PENDING',
    'CARD',
    'COURIER',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 49/8',
    'Kraków',
    '61-962',
    'Poland',
    'ul. Wodna 49/8',
    'Kraków',
    '61-962',
    'Poland',
    1359.92,
    1378.42,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 05:49:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    43,
    'ZAM-20260126-550730',
    TIMESTAMP '2025-12-19 17:17:58',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'COURIER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    557.89,
    576.39,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-20 22:17:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    44,
    'ZAM-20260126-911633',
    TIMESTAMP '2025-12-26 19:00:58',
    'PACKED',
    'FAILED',
    'TRANSFER',
    'LOCKER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 84/19',
    'Kielce',
    '21-464',
    'Poland',
    'ul. Wodna 84/19',
    'Kielce',
    '21-464',
    'Poland',
    399.97,
    363.69,
    12.99,
    49.27,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-27 11:00:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    45,
    'ZAM-20260126-717348',
    TIMESTAMP '2025-12-14 08:09:58',
    'PENDING',
    'PAID',
    'BLIK',
    'COURIER',
    30,
    NULL,
    NULL,
    NULL,
    'ul. Sportowa 138/17',
    'Wrocław',
    '29-410',
    'Poland',
    'ul. Sportowa 138/17',
    'Wrocław',
    '29-410',
    'Poland',
    432.88,
    451.38,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-14 16:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    46,
    'ZAM-20260126-045715',
    TIMESTAMP '2025-12-23 07:25:58',
    'PROCESSING',
    'PAID',
    'BLIK',
    'PICKUP',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    679.94,
    679.94,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 17:25:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    47,
    'ZAM-20260126-264123',
    TIMESTAMP '2025-12-19 05:52:58',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'PICKUP',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 89/18',
    'Gdynia',
    '35-538',
    'Poland',
    'ul. Rynek 89/18',
    'Gdynia',
    '35-538',
    'Poland',
    739.95,
    739.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-19 16:52:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-19 15:52:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    48,
    'ZAM-20260126-668065',
    TIMESTAMP '2025-12-25 06:08:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    3,
    NULL,
    NULL,
    NULL,
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    996.9,
    882.36,
    12.99,
    127.53,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL25599999',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-25 07:08:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    49,
    'ZAM-20260126-971776',
    TIMESTAMP '2026-01-06 04:46:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    409.7,
    378.46,
    18.5,
    49.74,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL89450711',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-06 05:46:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    50,
    'ZAM-20260126-571106',
    TIMESTAMP '2026-01-06 21:42:58',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    493.91,
    512.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 20:42:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-07 19:42:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    51,
    'ZAM-20260126-248127',
    TIMESTAMP '2026-01-02 10:03:58',
    'PROCESSING',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    549.94,
    568.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-02 22:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    52,
    'ZAM-20260126-133431',
    TIMESTAMP '2026-01-19 21:10:58',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 62/11',
    'Gliwice',
    '23-597',
    'Poland',
    'ul. Szkolna 62/11',
    'Gliwice',
    '23-597',
    'Poland',
    1299.94,
    1299.94,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL57501476',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 12:10:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    53,
    'ZAM-20260126-273308',
    TIMESTAMP '2025-12-04 00:04:58',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    2379.93,
    2379.93,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-05 23:04:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    54,
    'ZAM-20260126-894852',
    TIMESTAMP '2026-01-23 07:38:58',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    44,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 135/33',
    'Warszawa',
    '49-835',
    'Poland',
    'ul. Słoneczna 135/33',
    'Warszawa',
    '49-835',
    'Poland',
    94.97,
    94.97,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-23 13:38:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-25 06:38:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    55,
    'ZAM-20260126-471585',
    TIMESTAMP '2025-11-29 19:13:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 29/23',
    'Rzeszów',
    '87-384',
    'Poland',
    'ul. Piaskowa 29/23',
    'Rzeszów',
    '87-384',
    'Poland',
    104.96,
    123.46,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL38423038',
    NULL,
    NULL,
    TIMESTAMP '2025-12-05 19:13:58',
    TIMESTAMP '2025-11-30 15:13:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    56,
    'ZAM-20260126-439332',
    TIMESTAMP '2025-12-23 17:09:58',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    1357.93,
    1357.93,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL86759464',
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 17:09:58',
    TIMESTAMP '2025-12-24 12:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    57,
    'ZAM-20260126-367597',
    TIMESTAMP '2025-12-22 01:48:58',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'COURIER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    459.95,
    478.45,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 20:48:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    58,
    'ZAM-20260126-075624',
    TIMESTAMP '2025-12-07 04:03:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    538.91,
    557.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL86989744',
    NULL,
    NULL,
    TIMESTAMP '2025-12-14 04:03:58',
    TIMESTAMP '2025-12-08 00:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    59,
    'ZAM-20260126-316108',
    TIMESTAMP '2026-01-08 19:10:58',
    'PACKED',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 56/13',
    'Lublin',
    '46-817',
    'Poland',
    'ul. Kwiatowa 56/13',
    'Lublin',
    '46-817',
    'Poland',
    637.96,
    604.62,
    12.99,
    46.33,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 14:10:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    60,
    'ZAM-20260126-764594',
    TIMESTAMP '2026-01-04 21:33:58',
    'SHIPPED',
    'PAID',
    'BLIK',
    'LOCKER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    1129.93,
    1142.92,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL88640203',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-05 18:33:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    61,
    'ZAM-20260126-534850',
    TIMESTAMP '2025-12-03 09:35:58',
    'CONFIRMED',
    'FAILED',
    'CARD',
    'PICKUP',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    799.88,
    799.88,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 02:35:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    62,
    'ZAM-20260126-919839',
    TIMESTAMP '2026-01-03 23:49:58',
    'PACKED',
    'PENDING',
    'BLIK',
    'COURIER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    734.93,
    753.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 09:49:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    63,
    'ZAM-20260126-012721',
    TIMESTAMP '2025-11-29 11:50:58',
    'SHIPPED',
    'PAID',
    'BLIK',
    'LOCKER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 69/16',
    'Radom',
    '59-431',
    'Poland',
    'ul. Zielona 69/16',
    'Radom',
    '59-431',
    'Poland',
    985.96,
    998.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL69770347',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-29 17:50:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    64,
    'ZAM-20260126-987633',
    TIMESTAMP '2025-12-26 11:54:58',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    860.9,
    873.89,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 06:54:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    65,
    'ZAM-20260126-145647',
    TIMESTAMP '2025-12-06 21:59:58',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 60/43',
    'Białystok',
    '30-759',
    'Poland',
    'ul. Łąkowa 60/43',
    'Białystok',
    '30-759',
    'Poland',
    509.94,
    454.85,
    18.5,
    73.59,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL53202616',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-07 01:59:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    66,
    'ZAM-20260126-961757',
    TIMESTAMP '2026-01-06 19:34:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    295.95,
    308.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL50169283',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 00:34:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    67,
    'ZAM-20260126-354158',
    TIMESTAMP '2026-01-21 05:36:58',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    5,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 83/17',
    'Bydgoszcz',
    '37-769',
    'Poland',
    'ul. Kościelna 83/17',
    'Bydgoszcz',
    '37-769',
    'Poland',
    569.95,
    582.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-21 18:36:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-22 07:36:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    68,
    'ZAM-20260126-043553',
    TIMESTAMP '2025-12-24 08:36:58',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    462.94,
    462.94,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-25 06:36:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-26 02:36:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    69,
    'ZAM-20260126-546890',
    TIMESTAMP '2025-12-01 10:38:58',
    'PACKED',
    'FAILED',
    'CARD',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    89.98,
    89.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 03:38:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    70,
    'ZAM-20260126-070606',
    TIMESTAMP '2025-12-30 05:14:58',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    2064.92,
    2083.42,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 13:14:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-31 23:14:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    71,
    'ZAM-20260126-021664',
    TIMESTAMP '2026-01-10 13:30:58',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    164.96,
    177.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL30164380',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-11 08:30:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    72,
    'ZAM-20260126-683225',
    TIMESTAMP '2025-12-21 17:47:58',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    41,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    1623.38,
    1470.06,
    12.99,
    166.31,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-22 23:47:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    73,
    'ZAM-20260126-582121',
    TIMESTAMP '2025-12-16 19:02:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 138/25',
    'Toruń',
    '49-293',
    'Poland',
    'ul. Leśna 138/25',
    'Toruń',
    '49-293',
    'Poland',
    696.92,
    715.42,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL63693539',
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 19:02:58',
    TIMESTAMP '2025-12-18 02:02:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    74,
    'ZAM-20260126-989172',
    TIMESTAMP '2026-01-20 12:03:58',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    154.93,
    173.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 14:03:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-21 04:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    75,
    'ZAM-20260126-928275',
    TIMESTAMP '2025-12-29 08:10:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'LOCKER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    32.96,
    45.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL20913707',
    NULL,
    NULL,
    TIMESTAMP '2026-01-03 08:10:58',
    TIMESTAMP '2025-12-30 13:10:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    76,
    'ZAM-20260126-380628',
    TIMESTAMP '2026-01-05 01:03:58',
    'PENDING',
    'PAID',
    'CARD',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    269.97,
    253.41,
    12.99,
    29.55,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-05 06:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    77,
    'ZAM-20260126-988365',
    TIMESTAMP '2026-01-25 02:28:58',
    'PENDING',
    'PAID',
    'CARD',
    'PICKUP',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    'ul. Kolejowa 1/49',
    'Warszawa',
    '46-678',
    'Poland',
    379.93,
    379.93,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-25 07:28:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    78,
    'ZAM-20260126-672622',
    TIMESTAMP '2025-12-18 15:33:58',
    'SHIPPED',
    'PAID',
    'BLIK',
    'COURIER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    449.97,
    468.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL53507645',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-19 15:33:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    79,
    'ZAM-20260126-080587',
    TIMESTAMP '2025-12-14 06:43:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'LOCKER',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    89.97,
    102.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL27772564',
    NULL,
    NULL,
    TIMESTAMP '2025-12-21 06:43:58',
    TIMESTAMP '2025-12-16 03:43:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    80,
    'ZAM-20260126-214919',
    TIMESTAMP '2025-11-28 21:28:58',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Polna 74/41',
    'Zabrze',
    '61-854',
    'Poland',
    'ul. Polna 74/41',
    'Zabrze',
    '61-854',
    'Poland',
    1512.92,
    1512.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-29 14:28:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    81,
    'ZAM-20260126-627827',
    TIMESTAMP '2025-12-06 09:40:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'LOCKER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    731.95,
    744.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL26913236',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-06 19:40:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    82,
    'ZAM-20260126-062631',
    TIMESTAMP '2025-12-22 18:03:58',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'PICKUP',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    172.48,
    172.48,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 01:03:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-24 11:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    83,
    'ZAM-20260126-449872',
    TIMESTAMP '2025-12-13 23:24:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'COURIER',
    15,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 50/44',
    'Białystok',
    '46-221',
    'Poland',
    'ul. Słoneczna 50/44',
    'Białystok',
    '46-221',
    'Poland',
    149.97,
    168.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL86690863',
    NULL,
    NULL,
    TIMESTAMP '2025-12-19 23:24:58',
    TIMESTAMP '2025-12-15 01:24:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    84,
    'ZAM-20260126-143602',
    TIMESTAMP '2025-12-22 11:07:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    5,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 83/17',
    'Bydgoszcz',
    '37-769',
    'Poland',
    'ul. Kościelna 83/17',
    'Bydgoszcz',
    '37-769',
    'Poland',
    359.99,
    378.49,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL29559953',
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 11:07:58',
    TIMESTAMP '2025-12-23 07:07:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    85,
    'ZAM-20260126-449209',
    TIMESTAMP '2026-01-08 12:38:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    389.18,
    383.21,
    18.5,
    24.47,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL62997099',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 02:38:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    86,
    'ZAM-20260126-510982',
    TIMESTAMP '2025-12-18 14:11:58',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'PICKUP',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    829.95,
    829.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-20 03:11:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    87,
    'ZAM-20260126-878836',
    TIMESTAMP '2025-12-08 05:52:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    'ul. Polna 37/29',
    'Bydgoszcz',
    '13-246',
    'Poland',
    199.98,
    218.48,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL90222259',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-09 23:52:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    88,
    'ZAM-20260126-854989',
    TIMESTAMP '2025-11-29 05:13:58',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    12,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 108/35',
    'Gliwice',
    '66-799',
    'Poland',
    'ul. Łąkowa 108/35',
    'Gliwice',
    '66-799',
    'Poland',
    99.96,
    112.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-29 10:13:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    89,
    'ZAM-20260126-469812',
    TIMESTAMP '2026-01-21 07:47:58',
    'PACKED',
    'FAILED',
    'BLIK',
    'LOCKER',
    20,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 52/18',
    'Katowice',
    '97-802',
    'Poland',
    'ul. Kościelna 52/18',
    'Katowice',
    '97-802',
    'Poland',
    89.97,
    102.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-22 16:47:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    90,
    'ZAM-20260126-894498',
    TIMESTAMP '2025-11-30 20:49:58',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'COURIER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    514.9,
    533.4,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL13335454',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-01 17:49:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    91,
    'ZAM-20260126-136590',
    TIMESTAMP '2025-12-29 10:34:58',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    'ul. Leśna 113/30',
    'Białystok',
    '86-252',
    'Poland',
    184.95,
    184.42,
    12.99,
    13.52,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 12:34:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-29 16:34:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    92,
    'ZAM-20260126-479580',
    TIMESTAMP '2026-01-01 11:07:58',
    'PENDING',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    1139.15,
    1157.65,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-02 14:07:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    93,
    'ZAM-20260126-798017',
    TIMESTAMP '2026-01-11 14:36:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    15,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 50/44',
    'Białystok',
    '46-221',
    'Poland',
    'ul. Słoneczna 50/44',
    'Białystok',
    '46-221',
    'Poland',
    1007.88,
    1026.38,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL52549718',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-12 00:36:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    94,
    'ZAM-20260126-797915',
    TIMESTAMP '2026-01-20 14:40:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    549.95,
    562.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL65449988',
    NULL,
    NULL,
    TIMESTAMP '2026-01-26 14:40:58',
    TIMESTAMP '2026-01-22 10:40:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    95,
    'ZAM-20260126-828668',
    TIMESTAMP '2026-01-08 02:09:58',
    'PENDING',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    1097.42,
    1097.42,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 13:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    96,
    'ZAM-20260126-510651',
    TIMESTAMP '2026-01-14 12:14:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    50,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    1072.45,
    1085.44,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL84377643',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-14 22:14:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    97,
    'ZAM-20260126-329804',
    TIMESTAMP '2025-12-07 23:09:58',
    'CONFIRMED',
    'PENDING',
    'TRANSFER',
    'COURIER',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    'ul. Rynek 83/2',
    'Gliwice',
    '98-921',
    'Poland',
    655.94,
    674.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 18:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    98,
    'ZAM-20260126-274499',
    TIMESTAMP '2026-01-08 17:25:58',
    'PROCESSING',
    'PAID',
    'TRANSFER',
    'COURIER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    68.96,
    87.46,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 05:25:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    99,
    'ZAM-20260126-240354',
    TIMESTAMP '2026-01-13 23:17:58',
    'PACKED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    'ul. Piaskowa 27/16',
    'Zabrze',
    '59-937',
    'Poland',
    239.97,
    252.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 02:17:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    100,
    'ZAM-20260126-158129',
    TIMESTAMP '2025-12-04 15:30:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    879.93,
    898.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL74095357',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 19:30:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    101,
    'ZAM-20260126-781891',
    TIMESTAMP '2025-12-30 03:17:58',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 36/49',
    'Gdańsk',
    '28-367',
    'Poland',
    'ul. Kwiatowa 36/49',
    'Gdańsk',
    '28-367',
    'Poland',
    529.98,
    529.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-31 16:17:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    102,
    'ZAM-20260126-355828',
    TIMESTAMP '2026-01-19 21:23:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    398.45,
    411.44,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL88300791',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-19 22:23:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    103,
    'ZAM-20260126-415742',
    TIMESTAMP '2025-12-03 05:46:58',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    50,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    'ul. Kwiatowa 72/15',
    'Białystok',
    '28-719',
    'Poland',
    579.98,
    579.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL78967753',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 01:46:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    104,
    'ZAM-20260126-844405',
    TIMESTAMP '2025-12-24 02:31:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'LOCKER',
    41,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    319.95,
    332.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL41936886',
    NULL,
    NULL,
    TIMESTAMP '2025-12-31 02:31:58',
    TIMESTAMP '2025-12-24 09:31:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    105,
    'ZAM-20260126-946078',
    TIMESTAMP '2025-12-11 00:44:58',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'COURIER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 47/26',
    'Poznań',
    '90-227',
    'Poland',
    'ul. Leśna 47/26',
    'Poznań',
    '90-227',
    'Poland',
    689.94,
    708.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-11 14:44:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    106,
    'ZAM-20260126-806851',
    TIMESTAMP '2025-12-28 00:11:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'COURIER',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    321.67,
    340.17,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL96089508',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 20:11:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    107,
    'ZAM-20260126-336372',
    TIMESTAMP '2026-01-05 13:47:58',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'LOCKER',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    'ul. Ogrodowa 94/3',
    'Gdynia',
    '59-675',
    'Poland',
    359.14,
    372.13,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-06 03:47:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-06 20:47:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    108,
    'ZAM-20260126-589865',
    TIMESTAMP '2025-12-24 17:20:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'COURIER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 29/23',
    'Rzeszów',
    '87-384',
    'Poland',
    'ul. Piaskowa 29/23',
    'Rzeszów',
    '87-384',
    'Poland',
    179.98,
    198.48,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL58514384',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-26 16:20:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    109,
    'ZAM-20260126-610112',
    TIMESTAMP '2025-12-24 11:10:58',
    'PROCESSING',
    'PENDING',
    'TRANSFER',
    'COURIER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 89/18',
    'Gdynia',
    '35-538',
    'Poland',
    'ul. Rynek 89/18',
    'Gdynia',
    '35-538',
    'Poland',
    201.91,
    220.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 13:10:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    110,
    'ZAM-20260126-939275',
    TIMESTAMP '2025-11-27 00:19:58',
    'PACKED',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    389.93,
    402.92,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-27 07:19:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    111,
    'ZAM-20260126-353137',
    TIMESTAMP '2025-12-23 16:44:58',
    'CONFIRMED',
    'FAILED',
    'CARD',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    'ul. Słoneczna 120/38',
    'Gliwice',
    '40-186',
    'Poland',
    379.98,
    338.97,
    12.99,
    54.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-25 12:44:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    112,
    'ZAM-20260126-970642',
    TIMESTAMP '2026-01-05 18:36:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    17,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 93/32',
    'Gdańsk',
    '31-965',
    'Poland',
    'ul. Parkowa 93/32',
    'Gdańsk',
    '31-965',
    'Poland',
    184.97,
    183.06,
    18.5,
    20.41,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL36018843',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 18:36:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    113,
    'ZAM-20260126-296820',
    TIMESTAMP '2025-12-01 04:46:58',
    'CONFIRMED',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    'ul. Krótka 42/34',
    'Zabrze',
    '22-549',
    'Poland',
    764.97,
    764.97,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 06:46:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    114,
    'ZAM-20260126-990855',
    TIMESTAMP '2025-11-30 07:05:58',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    'ul. Ogrodowa 65/30',
    'Radom',
    '40-279',
    'Poland',
    1972.41,
    1815.42,
    0.0,
    156.99,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL97241886',
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 07:05:58',
    TIMESTAMP '2025-12-01 15:05:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    115,
    'ZAM-20260126-863738',
    TIMESTAMP '2025-12-12 12:25:58',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    'ul. Kwiatowa 59/11',
    'Bydgoszcz',
    '62-976',
    'Poland',
    299.98,
    318.48,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL33398103',
    NULL,
    NULL,
    TIMESTAMP '2025-12-14 12:25:58',
    TIMESTAMP '2025-12-13 03:25:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    116,
    'ZAM-20260126-688781',
    TIMESTAMP '2025-12-01 11:37:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'PICKUP',
    41,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    'ul. Szkolna 16/22',
    'Łódź',
    '54-727',
    'Poland',
    1268.9,
    1268.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL86510619',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 01:37:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    117,
    'ZAM-20260126-506658',
    TIMESTAMP '2025-12-23 22:52:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    'ul. Nowa 102/10',
    'Katowice',
    '46-342',
    'Poland',
    1164.89,
    1164.89,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL80693241',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 23:52:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    118,
    'ZAM-20260126-306336',
    TIMESTAMP '2026-01-14 09:43:58',
    'PENDING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    'ul. Zielona 133/33',
    'Zabrze',
    '25-183',
    'Poland',
    1195.4,
    1208.39,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 15:43:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    119,
    'ZAM-20260126-998420',
    TIMESTAMP '2025-12-17 23:56:58',
    'PACKED',
    'PENDING',
    'BLIK',
    'PICKUP',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    'ul. Rynek 55/24',
    'Toruń',
    '65-257',
    'Poland',
    8.98,
    8.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-18 08:56:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    120,
    'ZAM-20260126-514913',
    TIMESTAMP '2025-11-28 20:48:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'PICKUP',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    'ul. Piaskowa 94/41',
    'Poznań',
    '76-145',
    'Poland',
    219.24,
    219.24,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL64547964',
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 20:48:58',
    TIMESTAMP '2025-11-30 03:48:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    121,
    'ZAM-20260126-763314',
    TIMESTAMP '2026-01-01 14:12:58',
    'SHIPPED',
    'PAID',
    'CARD',
    'LOCKER',
    6,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 4/27',
    'Poznań',
    '52-421',
    'Poland',
    'ul. Parkowa 4/27',
    'Poznań',
    '52-421',
    'Poland',
    89.98,
    92.9,
    12.99,
    10.07,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL91075440',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-02 17:12:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    122,
    'ZAM-20260126-101852',
    TIMESTAMP '2025-12-03 02:03:58',
    'PROCESSING',
    'PAID',
    'CARD',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    'ul. Ogrodowa 127/32',
    'Kielce',
    '82-393',
    'Poland',
    789.96,
    802.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 12:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    123,
    'ZAM-20260126-982167',
    TIMESTAMP '2025-12-18 02:41:58',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'PICKUP',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 49/27',
    'Warszawa',
    '19-597',
    'Poland',
    'ul. Piaskowa 49/27',
    'Warszawa',
    '19-597',
    'Poland',
    649.94,
    584.39,
    0.0,
    65.55,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-19 17:41:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    124,
    'ZAM-20260126-258841',
    TIMESTAMP '2026-01-20 18:09:58',
    'CONFIRMED',
    'PENDING',
    'TRANSFER',
    'COURIER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    314.15,
    301.84,
    18.5,
    30.81,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-21 06:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    125,
    'ZAM-20260126-577029',
    TIMESTAMP '2025-12-09 21:37:58',
    'DELIVERED',
    'PAID',
    'CARD',
    'LOCKER',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 110/34',
    'Katowice',
    '71-955',
    'Poland',
    'ul. Kwiatowa 110/34',
    'Katowice',
    '71-955',
    'Poland',
    331.94,
    344.93,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL87019886',
    NULL,
    NULL,
    TIMESTAMP '2025-12-11 21:37:58',
    TIMESTAMP '2025-12-10 08:37:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    126,
    'ZAM-20260126-584728',
    TIMESTAMP '2026-01-10 01:09:58',
    'PROCESSING',
    'PENDING',
    'CARD',
    'COURIER',
    3,
    NULL,
    NULL,
    NULL,
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    'ul. Główna 119/30',
    'Gliwice',
    '44-117',
    'Poland',
    149.97,
    146.67,
    18.5,
    21.8,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 18:09:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    127,
    'ZAM-20260126-924593',
    TIMESTAMP '2026-01-03 04:56:58',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'COURIER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 73/21',
    'Szczecin',
    '21-764',
    'Poland',
    'ul. Kwiatowa 73/21',
    'Szczecin',
    '21-764',
    'Poland',
    109.95,
    128.45,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL54498081',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 17:56:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    128,
    'ZAM-20260126-396116',
    TIMESTAMP '2025-12-16 12:00:58',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    'ul. Główna 90/4',
    'Sosnowiec',
    '78-251',
    'Poland',
    292.7,
    292.7,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-17 08:00:58',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-17 20:00:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    129,
    'ZAM-20260126-142030',
    TIMESTAMP '2025-11-27 04:03:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    'ul. Kwiatowa 81/25',
    'Kielce',
    '71-922',
    'Poland',
    79.98,
    92.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL38768804',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-27 15:03:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    130,
    'ZAM-20260126-091392',
    TIMESTAMP '2025-12-16 16:31:58',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    'ul. Zielona 15/44',
    'Katowice',
    '57-823',
    'Poland',
    944.85,
    963.35,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL41005983',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-17 10:31:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    131,
    'ZAM-20260126-029194',
    TIMESTAMP '2026-01-11 04:59:58',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'PICKUP',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    'ul. Parkowa 2/16',
    'Łódź',
    '97-974',
    'Poland',
    754.92,
    754.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL84601653',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-12 11:59:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    132,
    'ZAM-20260126-725869',
    TIMESTAMP '2025-11-30 00:06:58',
    'PROCESSING',
    'PENDING',
    'TRANSFER',
    'COURIER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    'ul. Krótka 43/16',
    'Warszawa',
    '44-751',
    'Poland',
    1034.94,
    1053.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-01 17:06:58'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    133,
    'ZAM-20260126-716584',
    TIMESTAMP '2026-01-04 10:27:58',
    'PACKED',
    'PENDING',
    'BLIK',
    'COURIER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    'ul. Szkolna 109/21',
    'Rzeszów',
    '14-941',
    'Poland',
    49.98,
    63.52,
    18.5,
    4.96,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-05 11:27:58'
);

-- Insert order items
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    1,
    5,
    3,
    299.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    2,
    46,
    2,
    24.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    3,
    7,
    1,
    8.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    4,
    44,
    2,
    13.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    5,
    16,
    2,
    89.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    6,
    46,
    1,
    24.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    7,
    48,
    3,
    7.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    8,
    26,
    1,
    12.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    9,
    2,
    1,
    149.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    10,
    16,
    1,
    89.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    11,
    38,
    2,
    19.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    12,
    58,
    1,
    129.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    13,
    65,
    2,
    29.74,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    14,
    44,
    3,
    13.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    15,
    21,
    1,
    269.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    16,
    28,
    2,
    49.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    17,
    10,
    3,
    14.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    18,
    8,
    1,
    24.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    19,
    64,
    2,
    39.99,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    20,
    34,
    1,
    99.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    21,
    7,
    2,
    8.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    22,
    71,
    1,
    39.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    23,
    58,
    2,
    129.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    24,
    50,
    2,
    297.49,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    25,
    49,
    2,
    14.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    26,
    34,
    2,
    99.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    27,
    6,
    3,
    5.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    28,
    48,
    2,
    7.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    29,
    31,
    1,
    89.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    30,
    4,
    1,
    223.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    31,
    54,
    3,
    39.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    32,
    22,
    1,
    229.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    33,
    57,
    3,
    149.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    34,
    70,
    1,
    49.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    35,
    23,
    2,
    23.09,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    36,
    38,
    3,
    19.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    37,
    61,
    3,
    44.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    38,
    61,
    3,
    44.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    39,
    5,
    2,
    299.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    40,
    14,
    3,
    39.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    41,
    12,
    3,
    129.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    42,
    58,
    2,
    129.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    43,
    13,
    2,
    149.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    44,
    26,
    1,
    12.99,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    45,
    57,
    3,
    149.99,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    46,
    71,
    2,
    39.99,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    47,
    11,
    2,
    49.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    48,
    51,
    2,
    19.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    49,
    36,
    1,
    33.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    50,
    59,
    3,
    399.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    51,
    23,
    1,
    23.09,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    52,
    56,
    1,
    22.49,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    53,
    58,
    2,
    129.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    54,
    10,
    1,
    14.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    55,
    4,
    1,
    223.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    56,
    12,
    3,
    129.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    57,
    27,
    3,
    19.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    58,
    11,
    1,
    49.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    59,
    34,
    1,
    99.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    60,
    39,
    2,
    9.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    61,
    18,
    1,
    189.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    62,
    35,
    1,
    24.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    63,
    55,
    1,
    44.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    64,
    38,
    3,
    19.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    65,
    47,
    2,
    49.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    66,
    38,
    3,
    19.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    67,
    55,
    3,
    44.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    68,
    56,
    2,
    22.49,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    69,
    1,
    3,
    289.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    70,
    46,
    1,
    24.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    71,
    67,
    3,
    89.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    72,
    48,
    1,
    7.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    73,
    27,
    2,
    19.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    74,
    39,
    3,
    9.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    75,
    25,
    1,
    8.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    76,
    3,
    3,
    359.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    77,
    43,
    3,
    14.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    78,
    67,
    1,
    89.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    79,
    19,
    3,
    249.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    80,
    42,
    1,
    249.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    81,
    4,
    1,
    223.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    82,
    10,
    2,
    14.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    83,
    16,
    3,
    89.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    84,
    70,
    2,
    49.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    85,
    30,
    3,
    59.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    86,
    43,
    2,
    14.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    87,
    57,
    1,
    149.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    88,
    54,
    2,
    39.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    89,
    66,
    2,
    449.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    90,
    60,
    2,
    49.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    91,
    35,
    3,
    24.99,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    92,
    52,
    2,
    12.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    93,
    69,
    3,
    44.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    94,
    25,
    3,
    8.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    95,
    35,
    3,
    24.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    96,
    10,
    1,
    14.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    97,
    41,
    1,
    39.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    98,
    28,
    1,
    49.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    99,
    69,
    3,
    44.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    100,
    56,
    3,
    22.49,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    101,
    64,
    2,
    39.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    102,
    61,
    3,
    44.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    103,
    12,
    2,
    129.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    104,
    65,
    2,
    29.74,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    105,
    10,
    2,
    14.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    106,
    23,
    3,
    23.09,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    107,
    47,
    1,
    49.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    108,
    67,
    1,
    89.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    109,
    59,
    2,
    399.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    110,
    51,
    3,
    19.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    111,
    30,
    3,
    59.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    112,
    20,
    1,
    89.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    113,
    67,
    3,
    89.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    114,
    9,
    1,
    59.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    115,
    54,
    2,
    39.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    116,
    28,
    2,
    49.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    117,
    58,
    2,
    129.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    118,
    24,
    2,
    4.49,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    119,
    11,
    2,
    49.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    120,
    16,
    2,
    89.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    121,
    34,
    2,
    99.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    122,
    11,
    2,
    49.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    123,
    27,
    2,
    19.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    124,
    19,
    2,
    249.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    125,
    3,
    2,
    359.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    126,
    53,
    3,
    79.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    127,
    60,
    1,
    49.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    128,
    33,
    3,
    49.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    129,
    17,
    3,
    34.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    130,
    26,
    1,
    12.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    131,
    38,
    1,
    19.99,
    44
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    132,
    18,
    2,
    189.99,
    44
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    133,
    49,
    3,
    14.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    134,
    9,
    3,
    59.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    135,
    7,
    2,
    8.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    136,
    11,
    3,
    49.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    137,
    64,
    1,
    39.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    138,
    71,
    2,
    39.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    139,
    66,
    1,
    449.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    140,
    70,
    3,
    49.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    141,
    48,
    1,
    7.99,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    142,
    30,
    1,
    59.99,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    143,
    4,
    3,
    223.99,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    144,
    54,
    1,
    39.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    145,
    25,
    3,
    8.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    146,
    22,
    3,
    229.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    147,
    53,
    3,
    79.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    148,
    41,
    1,
    39.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    149,
    64,
    1,
    39.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    150,
    2,
    2,
    149.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    151,
    65,
    1,
    29.74,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    152,
    57,
    2,
    149.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    153,
    10,
    3,
    14.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    154,
    9,
    1,
    59.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    155,
    41,
    2,
    39.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    156,
    7,
    1,
    8.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    157,
    64,
    3,
    39.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    158,
    31,
    2,
    89.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    159,
    19,
    1,
    249.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    160,
    1,
    3,
    289.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    161,
    18,
    2,
    189.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    162,
    11,
    1,
    49.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    163,
    59,
    3,
    399.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    164,
    34,
    1,
    99.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    165,
    3,
    3,
    359.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    166,
    35,
    1,
    24.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    167,
    17,
    2,
    34.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    168,
    35,
    3,
    24.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    169,
    32,
    1,
    29.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    170,
    4,
    2,
    223.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    171,
    67,
    2,
    89.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    172,
    3,
    2,
    359.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    173,
    39,
    1,
    9.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    174,
    17,
    2,
    34.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    175,
    58,
    3,
    129.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    176,
    39,
    2,
    9.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    177,
    54,
    1,
    39.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    178,
    4,
    1,
    223.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    179,
    31,
    2,
    89.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    180,
    8,
    3,
    24.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    181,
    19,
    1,
    249.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    182,
    18,
    2,
    189.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    183,
    48,
    1,
    7.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    184,
    40,
    1,
    29.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    185,
    28,
    3,
    49.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    186,
    66,
    2,
    449.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    187,
    33,
    1,
    49.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    188,
    67,
    3,
    89.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    189,
    49,
    3,
    14.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    190,
    69,
    1,
    44.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    191,
    46,
    2,
    24.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    192,
    12,
    3,
    129.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    193,
    5,
    1,
    299.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    194,
    20,
    2,
    89.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    195,
    10,
    1,
    14.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    196,
    15,
    3,
    79.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    197,
    53,
    1,
    79.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    198,
    66,
    2,
    449.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    199,
    6,
    1,
    5.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    200,
    24,
    3,
    4.49,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    201,
    63,
    2,
    49.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    202,
    34,
    3,
    99.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    203,
    13,
    1,
    149.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    204,
    50,
    1,
    297.49,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    205,
    68,
    1,
    79.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    206,
    60,
    1,
    49.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    207,
    53,
    1,
    79.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    208,
    34,
    3,
    99.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    209,
    34,
    1,
    99.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    210,
    67,
    2,
    89.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    211,
    48,
    2,
    7.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    212,
    67,
    3,
    89.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    213,
    13,
    2,
    149.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    214,
    67,
    2,
    89.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    215,
    7,
    2,
    8.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    216,
    19,
    1,
    249.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    217,
    10,
    1,
    14.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    218,
    69,
    2,
    44.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    219,
    18,
    3,
    189.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    220,
    50,
    2,
    297.49,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    221,
    5,
    3,
    299.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    222,
    17,
    1,
    34.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    223,
    54,
    1,
    39.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    224,
    69,
    2,
    44.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    225,
    18,
    3,
    189.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    226,
    39,
    2,
    9.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    227,
    3,
    2,
    359.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    228,
    24,
    3,
    4.49,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    229,
    57,
    2,
    149.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    230,
    7,
    1,
    8.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    231,
    71,
    1,
    39.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    232,
    19,
    2,
    249.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    233,
    58,
    1,
    129.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    234,
    6,
    3,
    5.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    235,
    47,
    2,
    49.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    236,
    7,
    3,
    8.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    237,
    44,
    2,
    13.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    238,
    25,
    1,
    8.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    239,
    48,
    3,
    7.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    240,
    67,
    1,
    89.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    241,
    16,
    2,
    89.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    242,
    47,
    1,
    49.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    243,
    13,
    1,
    149.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    244,
    30,
    2,
    59.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    245,
    38,
    3,
    19.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    246,
    13,
    3,
    149.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    247,
    32,
    3,
    29.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    248,
    70,
    3,
    49.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    249,
    2,
    1,
    149.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    250,
    26,
    1,
    12.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    251,
    59,
    3,
    399.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    252,
    47,
    1,
    49.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    253,
    4,
    3,
    223.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    254,
    39,
    1,
    9.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    255,
    56,
    1,
    22.49,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    256,
    57,
    1,
    149.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    257,
    33,
    1,
    49.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    258,
    28,
    2,
    49.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    259,
    3,
    1,
    359.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    260,
    20,
    3,
    89.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    261,
    45,
    1,
    29.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    262,
    65,
    3,
    29.74,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    263,
    39,
    3,
    9.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    264,
    59,
    2,
    399.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    265,
    18,
    1,
    189.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    266,
    39,
    1,
    9.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    267,
    51,
    2,
    19.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    268,
    45,
    2,
    29.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    269,
    40,
    3,
    29.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    270,
    68,
    1,
    79.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    271,
    60,
    3,
    49.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    272,
    55,
    3,
    44.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    273,
    11,
    3,
    49.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    274,
    16,
    1,
    89.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    275,
    49,
    3,
    14.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    276,
    11,
    1,
    49.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    277,
    19,
    3,
    249.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    278,
    12,
    2,
    129.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    279,
    65,
    3,
    29.74,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    280,
    38,
    2,
    19.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    281,
    12,
    2,
    129.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    282,
    58,
    3,
    129.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    283,
    34,
    3,
    99.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    284,
    36,
    1,
    33.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    285,
    48,
    3,
    7.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    286,
    55,
    2,
    44.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    287,
    1,
    1,
    289.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    288,
    53,
    1,
    79.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    289,
    67,
    1,
    89.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    290,
    11,
    3,
    49.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    291,
    51,
    1,
    19.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    292,
    50,
    3,
    297.49,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    293,
    17,
    1,
    34.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    294,
    67,
    2,
    89.99,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    295,
    50,
    3,
    297.49,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    296,
    27,
    2,
    19.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    297,
    5,
    2,
    299.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    298,
    48,
    2,
    7.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    299,
    27,
    3,
    19.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    300,
    25,
    1,
    8.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    301,
    29,
    3,
    79.99,
    99
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    302,
    19,
    2,
    249.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    303,
    2,
    1,
    149.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    304,
    31,
    2,
    89.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    305,
    45,
    1,
    29.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    306,
    27,
    1,
    19.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    307,
    15,
    1,
    79.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    308,
    66,
    1,
    449.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    309,
    60,
    3,
    49.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    310,
    23,
    3,
    23.09,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    311,
    65,
    3,
    29.74,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    312,
    20,
    1,
    89.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    313,
    1,
    2,
    289.99,
    103
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    314,
    8,
    2,
    24.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    315,
    67,
    3,
    89.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    316,
    54,
    3,
    39.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    317,
    18,
    3,
    189.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    318,
    65,
    1,
    29.74,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    319,
    8,
    1,
    24.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    320,
    15,
    3,
    79.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    321,
    25,
    3,
    8.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    322,
    23,
    2,
    23.09,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    323,
    52,
    1,
    12.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    324,
    34,
    3,
    99.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    325,
    20,
    2,
    89.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    326,
    44,
    3,
    13.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    327,
    35,
    1,
    24.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    328,
    17,
    3,
    34.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    329,
    43,
    2,
    14.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    330,
    67,
    1,
    89.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    331,
    70,
    3,
    49.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    332,
    11,
    3,
    49.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    333,
    18,
    2,
    189.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    334,
    68,
    2,
    79.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    335,
    8,
    1,
    24.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    336,
    3,
    2,
    359.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    337,
    69,
    1,
    44.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    338,
    5,
    3,
    299.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    339,
    50,
    3,
    297.49,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    340,
    62,
    2,
    69.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    341,
    41,
    1,
    39.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    342,
    2,
    2,
    149.99,
    115
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    343,
    25,
    1,
    8.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    344,
    3,
    3,
    359.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    345,
    27,
    3,
    19.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    346,
    41,
    3,
    39.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    347,
    19,
    2,
    249.99,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    348,
    2,
    2,
    149.99,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    349,
    16,
    3,
    89.99,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    350,
    47,
    1,
    49.99,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    351,
    49,
    3,
    14.99,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    352,
    30,
    2,
    59.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    353,
    36,
    2,
    33.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    354,
    50,
    3,
    297.49,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    355,
    69,
    2,
    44.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    356,
    46,
    1,
    24.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    357,
    24,
    2,
    4.49,
    119
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    358,
    23,
    3,
    23.09,
    120
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    359,
    11,
    3,
    49.99,
    120
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    360,
    61,
    2,
    44.99,
    121
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    361,
    22,
    3,
    229.99,
    122
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    362,
    34,
    1,
    99.99,
    122
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    363,
    45,
    1,
    29.99,
    123
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    364,
    53,
    3,
    79.99,
    123
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    365,
    18,
    2,
    189.99,
    123
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    366,
    30,
    2,
    59.99,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    367,
    17,
    1,
    34.99,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    368,
    39,
    2,
    9.99,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    369,
    8,
    2,
    24.99,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    370,
    65,
    3,
    29.74,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    371,
    58,
    1,
    129.99,
    125
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    372,
    36,
    3,
    33.99,
    125
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    373,
    47,
    2,
    49.99,
    125
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    374,
    47,
    3,
    49.99,
    126
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    375,
    39,
    3,
    9.99,
    127
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    376,
    54,
    2,
    39.99,
    127
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    377,
    24,
    3,
    4.49,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    378,
    13,
    1,
    149.99,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    379,
    23,
    3,
    23.09,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    380,
    51,
    3,
    19.99,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    381,
    64,
    2,
    39.99,
    129
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    382,
    51,
    3,
    19.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    383,
    18,
    3,
    189.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    384,
    54,
    3,
    39.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    385,
    49,
    3,
    14.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    386,
    28,
    3,
    49.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    387,
    11,
    3,
    49.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    388,
    58,
    2,
    129.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    389,
    56,
    2,
    22.49,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    390,
    5,
    1,
    299.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    391,
    5,
    3,
    299.99,
    132
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    392,
    61,
    3,
    44.99,
    132
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    393,
    35,
    2,
    24.99,
    133
);

-- Insert reviews
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    1,
    29,
    8,
    'PENDING',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-16 06:34:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    2,
    33,
    25,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-16 07:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    3,
    17,
    43,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-05 23:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    4,
    63,
    2,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-12 12:04:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    5,
    10,
    25,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-02 07:18:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    6,
    48,
    50,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-11-30 19:19:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    7,
    64,
    26,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-14 02:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    8,
    21,
    13,
    'REJECTED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-14 06:03:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    9,
    12,
    29,
    'PENDING',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-12 14:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    10,
    56,
    11,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-02 05:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    11,
    1,
    11,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-22 11:02:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    12,
    10,
    11,
    'PENDING',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-23 18:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    13,
    57,
    14,
    'REJECTED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-24 00:07:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    14,
    43,
    29,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-18 15:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    15,
    45,
    40,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-11-30 06:05:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    16,
    36,
    29,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-20 16:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    17,
    8,
    22,
    'REJECTED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-12 04:57:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    18,
    31,
    7,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-31 12:38:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    19,
    64,
    12,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-25 11:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    20,
    65,
    20,
    'REJECTED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-19 21:54:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    21,
    4,
    49,
    'PENDING',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-02 06:43:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    22,
    45,
    5,
    'PENDING',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-16 02:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    23,
    70,
    11,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-18 22:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    24,
    35,
    45,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-17 13:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    25,
    20,
    11,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-11-26 22:30:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    26,
    64,
    46,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-22 00:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    27,
    70,
    33,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-19 16:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    28,
    59,
    45,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-11-29 12:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    29,
    37,
    37,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-19 21:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    30,
    2,
    7,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-20 20:19:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    31,
    35,
    51,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-11-29 16:43:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    32,
    9,
    7,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-25 02:18:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    33,
    2,
    19,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-07 21:59:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    34,
    56,
    25,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-04 00:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    35,
    20,
    33,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-23 12:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    36,
    38,
    10,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-11-30 05:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    37,
    3,
    12,
    'REJECTED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-24 09:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    38,
    23,
    40,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-22 18:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    39,
    52,
    15,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-11-30 12:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    40,
    16,
    28,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-22 01:16:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    41,
    61,
    36,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-03 12:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    42,
    64,
    10,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-12 21:10:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    43,
    16,
    14,
    'PENDING',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-11 20:56:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    44,
    26,
    8,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-01 13:50:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    45,
    7,
    14,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-14 14:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    46,
    3,
    29,
    'PENDING',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-12 19:10:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    47,
    65,
    34,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-30 06:53:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    48,
    65,
    44,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-04 15:05:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    49,
    38,
    50,
    'PENDING',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-31 10:15:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    50,
    46,
    42,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-15 05:45:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    51,
    71,
    33,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-25 03:38:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    52,
    29,
    20,
    'PENDING',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-27 00:44:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    53,
    15,
    29,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-01 21:48:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    54,
    36,
    16,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-22 22:38:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    55,
    41,
    23,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-22 23:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    56,
    16,
    43,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-28 07:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    57,
    71,
    18,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-19 10:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    58,
    51,
    51,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-10 12:10:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    59,
    53,
    18,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-17 00:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    60,
    44,
    16,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-11 14:06:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    61,
    25,
    47,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-19 20:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    62,
    42,
    4,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-30 17:02:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    63,
    69,
    47,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-30 23:51:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    64,
    63,
    29,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-23 14:09:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    65,
    27,
    21,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-15 20:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    66,
    48,
    32,
    'REJECTED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-14 10:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    67,
    66,
    10,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-18 05:02:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    68,
    1,
    34,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-05 22:41:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    69,
    6,
    19,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-05 17:05:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    70,
    15,
    35,
    'REJECTED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-14 02:50:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    71,
    46,
    2,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-22 19:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    72,
    70,
    24,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-11-30 12:29:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    73,
    43,
    32,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-12 11:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    74,
    53,
    38,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-26 05:38:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    75,
    18,
    14,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-02 07:08:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    76,
    45,
    15,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-14 22:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    77,
    5,
    36,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-11-30 01:52:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    78,
    31,
    13,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-24 16:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    79,
    31,
    23,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-09 16:30:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    80,
    38,
    22,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-10 03:29:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    81,
    49,
    34,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-14 09:17:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    82,
    51,
    36,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-10 13:42:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    83,
    12,
    35,
    'PENDING',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-18 07:55:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    84,
    9,
    25,
    'REJECTED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-11 02:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    85,
    36,
    41,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-11-28 21:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    86,
    47,
    14,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-28 19:46:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    87,
    47,
    40,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-16 13:15:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    88,
    57,
    37,
    'PENDING',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-04 00:06:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    89,
    15,
    21,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-03 13:43:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    90,
    44,
    25,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-01 22:11:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    91,
    32,
    48,
    'REJECTED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-27 05:51:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    92,
    56,
    8,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-14 16:54:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    93,
    3,
    45,
    'REJECTED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-23 06:31:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    94,
    4,
    10,
    'REJECTED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-05 04:20:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    95,
    70,
    20,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-27 19:52:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    96,
    3,
    5,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-24 09:30:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    97,
    41,
    32,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-05 05:02:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    98,
    3,
    28,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-11 23:48:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    99,
    17,
    40,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-31 13:51:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    100,
    54,
    36,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-08 02:24:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    101,
    27,
    26,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-10 01:31:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    102,
    50,
    18,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-11-29 12:09:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    103,
    62,
    42,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-17 21:32:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    104,
    5,
    44,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-05 20:54:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    105,
    33,
    33,
    'REJECTED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-11-27 00:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    106,
    61,
    39,
    'PENDING',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-30 20:59:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    107,
    42,
    36,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-16 15:24:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    108,
    34,
    8,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-23 01:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    109,
    30,
    15,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-05 05:21:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    110,
    40,
    15,
    'PENDING',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-31 06:26:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    111,
    62,
    30,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-20 00:20:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    112,
    29,
    35,
    'REJECTED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-17 13:53:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    113,
    44,
    46,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-11 21:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    114,
    17,
    11,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-02 22:45:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    115,
    26,
    41,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-24 11:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    116,
    61,
    12,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-13 14:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    117,
    53,
    35,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-27 00:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    118,
    70,
    26,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-09 02:25:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    119,
    14,
    48,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-26 06:31:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    120,
    10,
    3,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-04 19:18:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    121,
    5,
    51,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-09 01:49:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    122,
    5,
    20,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-15 22:44:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    123,
    47,
    37,
    'REJECTED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-17 14:53:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    124,
    56,
    32,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-19 14:22:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    125,
    1,
    15,
    'APPROVED',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-11-29 17:24:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    126,
    22,
    46,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-21 22:49:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    127,
    37,
    25,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-09 01:52:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    128,
    61,
    11,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-06 14:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    129,
    60,
    2,
    'APPROVED',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-04 07:11:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    130,
    54,
    12,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-12 00:18:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    131,
    28,
    36,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-05 14:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    132,
    14,
    30,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-24 09:19:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    133,
    12,
    40,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-24 10:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    134,
    5,
    48,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-08 00:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    135,
    18,
    41,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-23 08:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    136,
    32,
    16,
    'PENDING',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-17 14:04:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    137,
    62,
    32,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-03 13:14:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    138,
    31,
    17,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-03 20:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    139,
    33,
    40,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-19 06:54:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    140,
    2,
    4,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-08 17:57:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    141,
    6,
    21,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-22 16:30:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    142,
    62,
    28,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-23 07:42:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    143,
    70,
    32,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-09 22:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    144,
    49,
    36,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-04 09:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    145,
    21,
    33,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-25 13:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    146,
    26,
    34,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-05 07:11:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    147,
    28,
    16,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-26 13:30:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    148,
    6,
    25,
    'PENDING',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-14 06:52:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    149,
    53,
    36,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-20 00:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    150,
    1,
    7,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-18 04:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    151,
    19,
    7,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-09 13:41:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    152,
    19,
    3,
    'REJECTED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-01 17:20:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    153,
    43,
    8,
    'REJECTED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-31 09:09:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    154,
    22,
    32,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-07 03:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    155,
    61,
    3,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-20 04:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    156,
    25,
    21,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-03 20:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    157,
    47,
    49,
    'PENDING',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-04 00:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    158,
    36,
    48,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-02 01:43:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    159,
    19,
    21,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-11 04:17:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    160,
    39,
    45,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-06 04:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    161,
    59,
    10,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-15 05:07:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    162,
    15,
    37,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-28 10:57:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    163,
    65,
    38,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-06 04:02:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    164,
    62,
    44,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-11 03:11:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    165,
    33,
    15,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-05 20:46:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    166,
    63,
    13,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-05 14:12:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    167,
    28,
    15,
    'PENDING',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-30 20:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    168,
    68,
    29,
    'PENDING',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-22 14:45:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    169,
    70,
    31,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-14 10:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    170,
    25,
    39,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-07 16:32:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    171,
    18,
    31,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-22 05:26:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    172,
    67,
    7,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-27 20:54:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    173,
    28,
    5,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-13 05:04:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    174,
    9,
    46,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-20 14:41:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    175,
    27,
    39,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-18 02:50:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    176,
    16,
    28,
    'REJECTED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-28 06:52:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    177,
    66,
    20,
    'REJECTED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-18 01:20:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    178,
    2,
    50,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-14 09:41:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    179,
    14,
    48,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-01 05:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    180,
    9,
    33,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-08 10:20:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    181,
    33,
    20,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-11 06:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    182,
    50,
    33,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-11 00:50:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    183,
    46,
    27,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-07 10:00:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    184,
    2,
    36,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-22 18:50:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    185,
    37,
    40,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-12 02:07:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    186,
    34,
    16,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-28 05:13:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    187,
    5,
    39,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-26 01:17:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    188,
    33,
    19,
    'PENDING',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-21 18:18:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    189,
    39,
    45,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-09 09:11:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    190,
    18,
    23,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-28 16:49:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    191,
    62,
    30,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-08 04:44:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    192,
    59,
    30,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-18 18:44:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    193,
    9,
    21,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-28 04:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    194,
    29,
    48,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-11-27 03:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    195,
    31,
    2,
    'REJECTED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-10 16:39:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    196,
    68,
    30,
    'PENDING',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-07 19:34:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    197,
    53,
    49,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-10 19:16:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    198,
    67,
    2,
    'REJECTED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-02 15:46:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    199,
    25,
    34,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-12 00:10:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    200,
    47,
    10,
    'REJECTED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-17 15:21:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    201,
    15,
    16,
    'REJECTED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-10 09:06:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    202,
    13,
    15,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-25 20:00:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    203,
    38,
    9,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-09 01:27:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    204,
    39,
    16,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-10 12:26:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    205,
    5,
    22,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-16 19:23:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    206,
    18,
    12,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-22 15:59:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    207,
    64,
    28,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-26 11:40:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    208,
    15,
    7,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-08 07:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    209,
    43,
    33,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-22 14:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    210,
    27,
    9,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-30 08:36:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    211,
    21,
    21,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-17 04:09:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    212,
    35,
    15,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-12 11:47:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    213,
    70,
    42,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-17 09:42:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    214,
    66,
    48,
    'REJECTED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-10 21:37:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    215,
    61,
    30,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-14 13:45:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    216,
    22,
    44,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-16 20:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    217,
    3,
    43,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-16 05:58:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    218,
    11,
    30,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-05 11:33:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    219,
    42,
    11,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-16 15:29:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    220,
    14,
    27,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-10 11:35:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    221,
    17,
    8,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-12 15:42:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    222,
    30,
    12,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-18 05:34:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    223,
    10,
    31,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-28 03:41:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    224,
    40,
    41,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-05 01:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    225,
    45,
    6,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-08 18:14:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    226,
    61,
    9,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-11-27 12:46:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    227,
    10,
    36,
    'PENDING',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-01 15:09:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    228,
    25,
    15,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-12 09:57:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    229,
    11,
    22,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-16 13:22:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    230,
    48,
    17,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-29 16:22:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    231,
    49,
    15,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-14 10:29:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    232,
    5,
    44,
    'REJECTED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-15 07:42:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    233,
    60,
    9,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-21 09:48:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    234,
    24,
    44,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-11 11:51:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    235,
    28,
    28,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-22 08:49:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    236,
    45,
    4,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-05 13:01:58'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    237,
    13,
    39,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-17 23:15:58'
);

-- Reset sequences
ALTER TABLE brands ALTER COLUMN id RESTART WITH 18;
ALTER TABLE categories ALTER COLUMN id RESTART WITH 7;
ALTER TABLE subcategories ALTER COLUMN id RESTART WITH 61;
ALTER TABLE users ALTER COLUMN id RESTART WITH 52;
ALTER TABLE products ALTER COLUMN id RESTART WITH 72;
ALTER TABLE orders ALTER COLUMN id RESTART WITH 134;
ALTER TABLE order_items ALTER COLUMN id RESTART WITH 394;
ALTER TABLE reviews ALTER COLUMN id RESTART WITH 238;

-- Enable foreign key checks
SET REFERENTIAL_INTEGRITY TRUE;

-- Done!
-- Total records: 968