-- ============================================
-- Zoo Pet Store Database Seed Script
-- Generated: 2026-01-26 19:53:51
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    TIMESTAMP '2026-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
);

-- Insert users
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    1,
    'Admin',
    'System',
    'admin@zoo.com',
    '$2b$12$bWGqsvUGyui/bb7H.snOQeN961Txp3kJj3gxZO6Uq5UfSOXkZSMhm',
    '+48 500 000 000',
    'ADMIN',
    'Administracyjna 1',
    'Warszawa',
    '00-001',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-01-26 19:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    2,
    'Krystyna',
    'Szymański',
    'krystyna.szymanski2@example.com',
    '$2b$12$BTpo3NP.LHB3s6kNCUhQYu3Iyz5p3qRI7w.ScGXHwzGMjruxCgx2a',
    '+48 600 823 823',
    'USER',
    'ul. Kwiatowa 52/34',
    'Bydgoszcz',
    '23-655',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-09 07:47:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    3,
    'Piotr',
    'Krawczyk',
    'piotr.krawczyk3@example.com',
    '$2b$12$zszdXdwtCm2Q/BX35daQyu89mSTtQtIDy/JijHI5xvQUH9ynHqqG6',
    '+48 519 557 655',
    'USER',
    'ul. Sportowa 25/18',
    'Gliwice',
    '12-929',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-03 18:16:37',
    TIMESTAMP '2026-01-26 19:53:37'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    4,
    'Krystyna',
    'Kozłowski',
    'krystyna.kozlowski4@example.com',
    '$2b$12$.D6aD5kCYfmZH5oo8SqPIejUtIdaaTPUY7qb7KQcQeyksX7W1Z/vu',
    '+48 518 192 382',
    'USER',
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-15 12:10:37',
    TIMESTAMP '2026-01-26 19:53:37'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    5,
    'Elżbieta',
    'Wójcik',
    'elzbieta.wojcik5@example.com',
    '$2b$12$SNVolyiqu2S7a2y2VyHileIUhFw33VWNnOJuD5treJw8ONy2MlsqO',
    '+48 516 594 907',
    'USER',
    'ul. Ogrodowa 136/19',
    'Zabrze',
    '35-975',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-18 21:16:37',
    TIMESTAMP '2026-01-26 19:53:37'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    6,
    'Maria',
    'Szymański',
    'maria.szymanski6@example.com',
    '$2b$12$yYbwRpf/Pn51jxI24j/9meWQ8vlS6DwUGOx94PLkCxl0FQtF2AMnm',
    '+48 601 919 328',
    'USER',
    'ul. Główna 113/45',
    'Sosnowiec',
    '75-979',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-05 04:22:37',
    TIMESTAMP '2026-01-26 19:53:37'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    7,
    'Jan',
    'Kowalczyk',
    'jan.kowalczyk7@example.com',
    '$2b$12$l2iGg1U44K0.9AE8i97B6OeZn1EiIiWmFoFHsIAouN.3EJMsq7EI6',
    '+48 507 148 455',
    'USER',
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-03 18:42:38',
    TIMESTAMP '2026-01-26 19:53:38'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    8,
    'Zofia',
    'Szymański',
    'zofia.szymanski8@example.com',
    '$2b$12$K/7cYtaEvN6zUbXEEvwd4.R1r/y.dEoVxiaJJQMelFmddmOuTjM0q',
    '+48 604 189 641',
    'USER',
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-09 02:17:38',
    TIMESTAMP '2026-01-26 19:53:38'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    9,
    'Zofia',
    'Kowalczyk',
    'zofia.kowalczyk9@example.com',
    '$2b$12$DneTF4kjYZ6dC3vRbb2Jiu0LhmpI5WGlLyJ1uscQ8kClHvYp2W9Wu',
    '+48 600 334 453',
    'USER',
    'ul. Łąkowa 52/47',
    'Częstochowa',
    '18-556',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-17 23:51:38',
    TIMESTAMP '2026-01-26 19:53:38'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    10,
    'Elżbieta',
    'Woźniak',
    'elzbieta.wozniak10@example.com',
    '$2b$12$8FJ5Zwf1T6698nE24pVStu7U0jym9jnkRWkVRPUEdmIbNpxUcWntC',
    '+48 513 233 920',
    'USER',
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-31 17:50:39',
    TIMESTAMP '2026-01-26 19:53:39'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    11,
    'Mateusz',
    'Mazur',
    'mateusz.mazur11@example.com',
    '$2b$12$7KwYAzYdxEwRf.c/XS9WK.JFwRGjntvCrr865BIN9pPlDTCn8m47a',
    '+48 511 800 700',
    'USER',
    'ul. Kolejowa 136/30',
    'Gliwice',
    '95-589',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-04 08:31:39',
    TIMESTAMP '2026-01-26 19:53:39'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    12,
    'Krzysztof',
    'Jankowski',
    'krzysztof.jankowski12@example.com',
    '$2b$12$3w8aI3M0oKeo7zQZByPw9.KvnBlwdBLmWZUjyimFSCR4lki4MaDx2',
    '+48 605 792 833',
    'USER',
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-03 18:19:39',
    TIMESTAMP '2026-01-26 19:53:39'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    13,
    'Marek',
    'Piotrowski',
    'marek.piotrowski13@example.com',
    '$2b$12$tlZfJ3uZCXMAK2ZCY9X75.g1VoOtR7VBjLeDKAoB7bDEWmYjJ2dKO',
    '+48 608 835 823',
    'USER',
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-14 18:56:40',
    TIMESTAMP '2026-01-26 19:53:40'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    14,
    'Adam',
    'Wiśniewski',
    'adam.wisniewski14@example.com',
    '$2b$12$yBUd9GsRu7epSEvynCLCl.VMTKPSD5U.Dm6GaVpDLWekiy7SA4WbC',
    '+48 505 207 577',
    'USER',
    'ul. Brzozowa 6/4',
    'Gdańsk',
    '50-372',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 00:15:40',
    TIMESTAMP '2026-01-26 19:53:40'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    15,
    'Stanisław',
    'Pawłowski',
    'stanislaw.pawlowski15@example.com',
    '$2b$12$0w4Qcd1d2Y.MUwCQqvpLR.B0V7QCfGvI0D/LYVsqMyxS1J95fGf.q',
    '+48 508 877 471',
    'USER',
    'ul. Krótka 147/47',
    'Katowice',
    '20-316',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-10 21:59:40',
    TIMESTAMP '2026-01-26 19:53:40'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    16,
    'Barbara',
    'Grabowski',
    'barbara.grabowski16@example.com',
    '$2b$12$sqD6Zx9wlpMq2Qh924VBuublfqBXdDqhpq3ik8qdO8fYQfSg6zfOq',
    '+48 519 538 164',
    'USER',
    'ul. Leśna 30/17',
    'Katowice',
    '91-637',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-04 10:09:40',
    TIMESTAMP '2026-01-26 19:53:40'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    17,
    'Katarzyna',
    'Mazur',
    'katarzyna.mazur17@example.com',
    '$2b$12$ZqdBpTi8gqEGdwRnUCWeUOWcEnqEb39U87t9G9GvnkyG3xeTLHt3u',
    '+48 609 248 178',
    'USER',
    'ul. Główna 17/25',
    'Szczecin',
    '70-104',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-07 23:08:41',
    TIMESTAMP '2026-01-26 19:53:41'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    18,
    'Anna',
    'Nowak',
    'anna.nowak18@example.com',
    '$2b$12$zX.fas/rfUrEnNm3fVBO4uEXN0k9WhFcXaamoqaPTS/EZzw.HbR1a',
    '+48 517 702 853',
    'USER',
    'ul. Zielona 144/11',
    'Kraków',
    '37-604',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-25 04:48:41',
    TIMESTAMP '2026-01-26 19:53:41'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    19,
    'Zofia',
    'Piotrowski',
    'zofia.piotrowski19@example.com',
    '$2b$12$fxJK1TgEhrjkry.FMCQJ5e0vzQ7Qt4RUchmnXdx0sp0uS2QOiwm4K',
    '+48 507 299 440',
    'USER',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-30 05:39:41',
    TIMESTAMP '2026-01-26 19:53:41'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    20,
    'Karol',
    'Dąbrowski',
    'karol.dabrowski20@example.com',
    '$2b$12$wPA0bq8pKuG5O1tpd/jsX.AOP7TZ6NllQJ1fe.nhZRaE6KN9Kb.0a',
    '+48 505 530 122',
    'USER',
    'ul. Piaskowa 141/36',
    'Wrocław',
    '99-667',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-12 22:01:42',
    TIMESTAMP '2026-01-26 19:53:42'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    21,
    'Maria',
    'Kowalczyk',
    'maria.kowalczyk21@example.com',
    '$2b$12$VmxH8gg8eJEp2oIoUV0uV.BNzNC42usfhybB6/IMDk0ctaZKtSSz2',
    '+48 600 629 713',
    'USER',
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-31 12:48:42',
    TIMESTAMP '2026-01-26 19:53:42'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    22,
    'Karol',
    'Krawczyk',
    'karol.krawczyk22@example.com',
    '$2b$12$u51I/uhLtZQYSqapUoPZWOY/hh3dIklTOnmGaVxALLGT2x12eObMq',
    '+48 510 435 822',
    'USER',
    'ul. Rynek 82/16',
    'Szczecin',
    '67-191',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 21:41:42',
    TIMESTAMP '2026-01-26 19:53:42'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    23,
    'Elżbieta',
    'Woźniak',
    'elzbieta.wozniak23@example.com',
    '$2b$12$oHMIniR6su66eDmblwRGw.MWNXIQa6Bves4e/0Ew.ERrZdXg9SiuG',
    '+48 604 522 511',
    'USER',
    'ul. Piaskowa 34/27',
    'Toruń',
    '11-734',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 18:04:43',
    TIMESTAMP '2026-01-26 19:53:43'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    24,
    'Małgorzata',
    'Krawczyk',
    'malgorzata.krawczyk24@example.com',
    '$2b$12$gZxECB/V41B0VMErGlW4B.JjqGElA89RFOZ2qqpLXulKEONm84Hn2',
    '+48 507 570 982',
    'USER',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-17 09:35:43',
    TIMESTAMP '2026-01-26 19:53:43'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    25,
    'Stanisław',
    'Wojciechowski',
    'stanislaw.wojciechowski25@example.com',
    '$2b$12$JKf8gqr0BdjS9o13XuHjqucDHoZ2d6h0XavRDM6D3L5Vmgmx8qiIK',
    '+48 606 566 599',
    'USER',
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-28 16:26:43',
    TIMESTAMP '2026-01-26 19:53:43'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    26,
    'Łukasz',
    'Zieliński',
    'lukasz.zielinski26@example.com',
    '$2b$12$5tIYFu3V4gKthzC.V8V6c.FV3cvnvtjXGZS12S6dIy9ENnDyWtLhC',
    '+48 517 998 581',
    'USER',
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-21 20:45:43',
    TIMESTAMP '2026-01-26 19:53:43'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    27,
    'Krzysztof',
    'Kowalski',
    'krzysztof.kowalski27@example.com',
    '$2b$12$yK8hW9Ie2mPERfI8ZHM2ReX32u9iS5qjoX6CrN/6mI1/VPpIeCM72',
    '+48 516 218 421',
    'USER',
    'ul. Kwiatowa 54/5',
    'Kielce',
    '96-331',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-28 05:49:44',
    TIMESTAMP '2026-01-26 19:53:44'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    28,
    'Elżbieta',
    'Kowalski',
    'elzbieta.kowalski28@example.com',
    '$2b$12$v1ZCgu5aVBeUX25PIGbyUO9Pyfeh5UtaF8zGnlqfY1s2nTirjq816',
    '+48 503 762 957',
    'USER',
    'ul. Krótka 131/33',
    'Rzeszów',
    '71-257',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-12 21:37:44',
    TIMESTAMP '2026-01-26 19:53:44'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    29,
    'Elżbieta',
    'Kowalski',
    'elzbieta.kowalski29@example.com',
    '$2b$12$6URCKzWpTAEViMuIV2RMC.dM2D4Qa.k9YAXubUbGO33iCPvPJCWYu',
    '+48 501 722 162',
    'USER',
    'ul. Sportowa 95/3',
    'Wrocław',
    '52-419',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-06 21:14:44',
    TIMESTAMP '2026-01-26 19:53:44'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    30,
    'Zofia',
    'Mazur',
    'zofia.mazur30@example.com',
    '$2b$12$vqCrNrMWqXzc0PpGOCIxXeyDMAXTvyIGMQjylD2P.0p8AMXrai71S',
    '+48 604 664 903',
    'USER',
    'ul. Piaskowa 54/25',
    'Radom',
    '24-860',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-12 03:34:45',
    TIMESTAMP '2026-01-26 19:53:45'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    31,
    'Paweł',
    'Kowalczyk',
    'pawel.kowalczyk31@example.com',
    '$2b$12$jJhZ3jWLL/MF6bjIqh/hQO6cQcLXaq1CbG85.TmR9mKigBfL9ABu6',
    '+48 516 299 456',
    'USER',
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-16 06:40:45',
    TIMESTAMP '2026-01-26 19:53:45'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    32,
    'Anna',
    'Kozłowski',
    'anna.kozlowski32@example.com',
    '$2b$12$vqNqCaL9bB3zwF9oOI4PN.kWKEd5U2WRe4Sin0YlKroZ42qVs7/rO',
    '+48 609 717 183',
    'USER',
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-24 13:58:45',
    TIMESTAMP '2026-01-26 19:53:45'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    33,
    'Elżbieta',
    'Kowalczyk',
    'elzbieta.kowalczyk33@example.com',
    '$2b$12$iscBaVeNStUwh1.w4L7Z7.YwnDhrFzNWkM.RNHztL40x4Kpn3uuoO',
    '+48 503 641 998',
    'USER',
    'ul. Słoneczna 120/5',
    'Rzeszów',
    '56-430',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-26 16:40:46',
    TIMESTAMP '2026-01-26 19:53:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    34,
    'Marek',
    'Grabowski',
    'marek.grabowski34@example.com',
    '$2b$12$tLIJtfOW6RSVR0C7O2ymwe63Ov2dwfIiXaWyjUENVQ2JDfZUhbYL6',
    '+48 501 400 771',
    'USER',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-21 02:11:46',
    TIMESTAMP '2026-01-26 19:53:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    35,
    'Krzysztof',
    'Kwiatkowski',
    'krzysztof.kwiatkowski35@example.com',
    '$2b$12$IdmUvYNglv8.Nu8tigTcLOaWQaKBLre1KcTYOdtx7mNvvRwINwf0.',
    '+48 607 912 662',
    'USER',
    'ul. Główna 17/7',
    'Rzeszów',
    '22-479',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-31 16:15:46',
    TIMESTAMP '2026-01-26 19:53:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    36,
    'Jakub',
    'Piotrowski',
    'jakub.piotrowski36@example.com',
    '$2b$12$IoP0noBENGDxAewT..fjN.O8Jq.rG9PpUcem3QV9T5qGhQ/.qpzDa',
    '+48 604 788 669',
    'USER',
    'ul. Lipowa 148/28',
    'Częstochowa',
    '46-874',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-11 05:33:47',
    TIMESTAMP '2026-01-26 19:53:47'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    37,
    'Łukasz',
    'Mazur',
    'lukasz.mazur37@example.com',
    '$2b$12$DhxUHCBQiFILvcrD8RhRXOMxt.JluzZglRGGPfSjhzI6FQuqyHhKq',
    '+48 503 977 235',
    'USER',
    'ul. Słoneczna 36/32',
    'Katowice',
    '91-598',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-14 06:01:47',
    TIMESTAMP '2026-01-26 19:53:47'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    38,
    'Paweł',
    'Mazur',
    'pawel.mazur38@example.com',
    '$2b$12$bPskQ.3/iGRdFtmDNizoB.0P7jB0SzZeXNMOmtrq7cwJt1XkAQQsK',
    '+48 605 314 700',
    'USER',
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-11 07:20:47',
    TIMESTAMP '2026-01-26 19:53:47'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    39,
    'Paweł',
    'Kowalski',
    'pawel.kowalski39@example.com',
    '$2b$12$M1ZA0.ZyyohWjEN64q.Vq.AYEKd9Y5iN3iLe4z8h0tgJjcOFfSiLO',
    '+48 513 624 266',
    'USER',
    'ul. Brzozowa 126/7',
    'Częstochowa',
    '35-588',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-21 12:49:47',
    TIMESTAMP '2026-01-26 19:53:47'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    40,
    'Jakub',
    'Lewandowski',
    'jakub.lewandowski40@example.com',
    '$2b$12$PNYT1wUlAafGWcAqCGk7cOE.KeiIEmg9zEk82gboxVyUwHUy5nvle',
    '+48 504 472 148',
    'USER',
    'ul. Leśna 3/41',
    'Bydgoszcz',
    '95-847',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-15 05:43:48',
    TIMESTAMP '2026-01-26 19:53:48'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    41,
    'Katarzyna',
    'Szymański',
    'katarzyna.szymanski41@example.com',
    '$2b$12$UmKfeE1dCLPjQo1bjyXL1.1xOP3U.2/tu4nv1BgiWTAiRtR7GaH.K',
    '+48 605 693 360',
    'USER',
    'ul. Ogrodowa 107/11',
    'Kraków',
    '72-652',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-01 13:25:48',
    TIMESTAMP '2026-01-26 19:53:48'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    42,
    'Elżbieta',
    'Wojciechowski',
    'elzbieta.wojciechowski42@example.com',
    '$2b$12$TW3n6XJdL.iiaWulVDL5vOK..u7kdkO25CTXbcyohadJS/VZ8ggne',
    '+48 606 202 387',
    'USER',
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-11 14:55:48',
    TIMESTAMP '2026-01-26 19:53:48'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    43,
    'Łukasz',
    'Kozłowski',
    'lukasz.kozlowski43@example.com',
    '$2b$12$dQmFyUz1Rvh0p.Q6T6L9lelXzp7tkrt.cw1jAJ1rI5abOyiRqsp3.',
    '+48 517 200 934',
    'USER',
    'ul. Rynek 59/10',
    'Gdynia',
    '55-895',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-11 21:30:49',
    TIMESTAMP '2026-01-26 19:53:49'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    44,
    'Jan',
    'Szymański',
    'jan.szymanski44@example.com',
    '$2b$12$wY.3i29IJK91loD039tkn.y8wHFPFFZ/y1qRtnOwK7w7adMCDXvAq',
    '+48 501 146 508',
    'USER',
    'ul. Główna 147/16',
    'Białystok',
    '11-763',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-18 17:23:49',
    TIMESTAMP '2026-01-26 19:53:49'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    45,
    'Krzysztof',
    'Jankowski',
    'krzysztof.jankowski45@example.com',
    '$2b$12$ZMXoOP01wDRw/d.uU/.LE.iT9zGi/72fuNeGU2bvamXNmtFJfNmjS',
    '+48 513 375 868',
    'USER',
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-27 03:41:49',
    TIMESTAMP '2026-01-26 19:53:49'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    46,
    'Michał',
    'Piotrowski',
    'michal.piotrowski46@example.com',
    '$2b$12$dHRAILqZ8QdmnvNLJtYdBe1wybXzvTLgb3IyIX6MAW5.HFIcUPyti',
    '+48 601 298 898',
    'USER',
    'ul. Kwiatowa 27/25',
    'Zabrze',
    '98-468',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-11 20:37:50',
    TIMESTAMP '2026-01-26 19:53:50'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    47,
    'Barbara',
    'Kowalczyk',
    'barbara.kowalczyk47@example.com',
    '$2b$12$mpcDDArEuKzcPiLfbFs6uePLoNwd5J1dJ6ANQTx0XtRt5843vlwlq',
    '+48 605 525 629',
    'USER',
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-06 23:53:50',
    TIMESTAMP '2026-01-26 19:53:50'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    48,
    'Piotr',
    'Dąbrowski',
    'piotr.dabrowski48@example.com',
    '$2b$12$Dvt2ug9v1RLxcvMTS9SxG.5ch0eXnz/2FMq4v1jhFRdgVzoDftH1W',
    '+48 606 405 794',
    'USER',
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-25 04:19:50',
    TIMESTAMP '2026-01-26 19:53:50'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    49,
    'Katarzyna',
    'Kowalski',
    'katarzyna.kowalski49@example.com',
    '$2b$12$hORulvCsUugp7GBrGG9JC.8Klz.B5uBcq5UnIaZIY7CcWafsltr8.',
    '+48 607 678 992',
    'USER',
    'ul. Wodna 34/27',
    'Wrocław',
    '94-380',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-20 13:51:50',
    TIMESTAMP '2026-01-26 19:53:50'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    50,
    'Elżbieta',
    'Kamiński',
    'elzbieta.kaminski50@example.com',
    '$2b$12$JCrxvnGHlUJLbi9Xmxw.3.NWfhh5f5C8PvtkvtgiPL9z6l6T/2nK2',
    '+48 519 309 875',
    'USER',
    'ul. Sportowa 19/39',
    'Katowice',
    '86-146',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-05 21:27:51',
    TIMESTAMP '2026-01-26 19:53:51'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    51,
    'Mateusz',
    'Piotrowski',
    'mateusz.piotrowski51@example.com',
    '$2b$12$MblZAL0oei0htOXxTiagfuqCHlb.U4pqaXw4XvmJyq53g4SL9DUGO',
    '+48 503 353 178',
    'USER',
    'ul. Nowa 130/46',
    'Poznań',
    '60-847',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-11 12:05:51',
    TIMESTAMP '2026-01-26 19:53:51'
);

-- Insert products
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    1,
    'Royal Canin Maxi Adult',
    'Karma dla duzych psow dorosłych. Wspiera zdrowie stawow i optymalna wage ciała.',
    1,
    289.99,
    NULL,
    4.2,
    '/images/products/dogs/royal-canin-maxi.jpg',
    'ACTIVE',
    131,
    'ZOO-SOWVQ1FW',
    15.0,
    '21x34x16cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-12-31 12:45:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    2,
    'Pedigree Adult z wolowina',
    'Pełnoporcjowa karma dla dorosłych psow z soczystą wolowiną.',
    2,
    149.99,
    NULL,
    4.8,
    '/images/products/dogs/pedigree-beef.jpg',
    'ACTIVE',
    117,
    'ZOO-LFP4UI23',
    12.0,
    '10x29x14cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-15 02:43:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    3,
    'Acana Pacifica Dog',
    'Karma bezzbozowa z rybami z Pacyfiku. 70% składnikow pochodzenia zwierzecego.',
    3,
    359.99,
    251.99,
    3.7,
    '/images/products/dogs/acana-pacifica.jpg',
    'ACTIVE',
    131,
    'ZOO-OCKGJ1BQ',
    11.4,
    '37x16x22cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-10 06:56:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    4,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych psow sredniej wielkosci z kurczakiem.',
    6,
    319.99,
    NULL,
    4.8,
    '/images/products/dogs/hills-adult.jpg',
    'ACTIVE',
    121,
    'ZOO-TC15H4WO',
    14.0,
    '14x21x18cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-18 00:30:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    5,
    'Purina Pro Plan Adult Large',
    'Karma dla duzych psow z łososiem. Wspiera zdrowa skore i siersc.',
    4,
    299.99,
    NULL,
    3.7,
    '/images/products/dogs/purina-large.jpg',
    'ACTIVE',
    79,
    'ZOO-4VJN6WBL',
    14.0,
    '44x26x11cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-12-28 13:23:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    6,
    'Pedigree puszka z kurczakiem',
    'Mokra karma dla psow z delikatnym kurczakiem w sosie.',
    2,
    5.99,
    4.49,
    3.8,
    '/images/products/dogs/pedigree-can.jpg',
    'ACTIVE',
    126,
    'ZOO-4NOY2TI6',
    0.4,
    '10x37x10cm',
    NULL,
    1,
    2,
    TIMESTAMP '2026-01-17 19:49:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    7,
    'Royal Canin puszka Adult',
    'Mokra karma premium dla dorosłych psow. Kawałki w sosie.',
    1,
    8.99,
    6.29,
    3.8,
    '/images/products/dogs/rc-can.jpg',
    'ACTIVE',
    124,
    'ZOO-4AQRC8UB',
    0.4,
    '31x12x21cm',
    NULL,
    1,
    2,
    TIMESTAMP '2025-12-13 12:03:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    199,
    'ZOO-79ASDPS7',
    0.27,
    '27x12x10cm',
    NULL,
    1,
    3,
    TIMESTAMP '2025-12-24 09:56:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    9,
    'Kong Classic czerwony L',
    'Wytrzymała zabawka dla psow do wypełniania przysmakami.',
    16,
    59.99,
    NULL,
    3.5,
    '/images/products/dogs/kong-classic.jpg',
    'ACTIVE',
    191,
    'ZOO-EO4SK4SF',
    0.3,
    '34x32x29cm',
    NULL,
    1,
    4,
    TIMESTAMP '2026-01-04 00:13:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    10,
    'Trixie piłka tenisowa 3szt',
    'Zestaw 3 piłek tenisowych dla psow. Idealne do aportowania.',
    15,
    14.99,
    11.24,
    4.6,
    '/images/products/dogs/tennis-balls.jpg',
    'ACTIVE',
    123,
    'ZOO-AH1T7K5Q',
    0.2,
    '20x30x29cm',
    NULL,
    1,
    4,
    TIMESTAMP '2025-11-29 08:25:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    11,
    'Kong Wubba L',
    'Zabawka do przeciągania i aportowania z piszczałką.',
    16,
    49.99,
    NULL,
    4.7,
    '/images/products/dogs/kong-wubba.jpg',
    'ACTIVE',
    128,
    'ZOO-Q6CCWF3C',
    0.25,
    '21x13x24cm',
    NULL,
    1,
    4,
    TIMESTAMP '2026-01-01 22:51:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    12,
    'Trixie legowisko owalne 80cm',
    'Miekkie legowisko dla srednih i duzych psow. Łatwe w czyszczeniu.',
    15,
    129.99,
    NULL,
    3.5,
    '/images/products/dogs/bed-oval.jpg',
    'ACTIVE',
    189,
    'ZOO-WGR461MG',
    1.5,
    '24x26x24cm',
    NULL,
    1,
    6,
    TIMESTAMP '2026-01-04 22:33:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    13,
    'Ferplast legowisko Siesta 6',
    'Plastikowe legowisko z miekka poduszka. Rozmiar dla duzych psow.',
    17,
    149.99,
    127.49,
    4.3,
    '/images/products/dogs/ferplast-siesta.jpg',
    'ACTIVE',
    167,
    'ZOO-0REU52BX',
    2.0,
    '21x10x15cm',
    NULL,
    1,
    6,
    TIMESTAMP '2025-12-17 07:41:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    116,
    'ZOO-OH1L51N1',
    0.1,
    '17x33x29cm',
    NULL,
    1,
    7,
    TIMESTAMP '2025-12-20 19:06:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    15,
    'Trixie smycz automatyczna 5m',
    'Smycz flexi z blokada i ergonomicznym uchwytem.',
    15,
    79.99,
    NULL,
    4.9,
    '/images/products/dogs/flexi-leash.jpg',
    'ACTIVE',
    179,
    'ZOO-1D9HA3ZF',
    0.3,
    '40x38x23cm',
    NULL,
    1,
    7,
    TIMESTAMP '2026-01-26 16:13:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    16,
    'Royal Canin Mobility Support',
    'Suplement wspierajacy stawy i mobilnosc u psow.',
    1,
    89.99,
    NULL,
    3.6,
    '/images/products/dogs/mobility-support.jpg',
    'ACTIVE',
    133,
    'ZOO-YOSGMKPN',
    0.5,
    '41x20x16cm',
    NULL,
    1,
    8,
    TIMESTAMP '2026-01-22 15:30:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    17,
    'Trixie szampon uniwersalny 1L',
    'Delikatny szampon dla psow o kazdym typie sierści.',
    15,
    34.99,
    NULL,
    4.3,
    '/images/products/dogs/shampoo.jpg',
    'ACTIVE',
    114,
    'ZOO-3D5EP0X7',
    1.0,
    '18x15x6cm',
    NULL,
    1,
    9,
    TIMESTAMP '2025-12-19 15:58:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    18,
    'Ferplast transporter Atlas 40',
    'Transporter plastikowy dla psow do 18kg. Zgodny z IATA.',
    17,
    189.99,
    NULL,
    4.5,
    '/images/products/dogs/atlas-carrier.jpg',
    'ACTIVE',
    66,
    'ZOO-8QD6AM3Z',
    3.5,
    '12x39x11cm',
    NULL,
    1,
    10,
    TIMESTAMP '2025-12-27 16:15:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    19,
    'Royal Canin Indoor Cat',
    'Karma dla kotow domowych. Redukuje zapach kuwety.',
    1,
    249.99,
    NULL,
    4.9,
    '/images/products/cats/rc-indoor.jpg',
    'ACTIVE',
    47,
    'ZOO-T3RR5L1U',
    10.0,
    '16x30x29cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-09 17:56:36',
    TIMESTAMP '2026-01-26 19:53:36'
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
    153,
    'ZOO-F0W0Z547',
    7.0,
    '49x21x13cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-27 10:11:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    21,
    'Purina Pro Plan Sterilised',
    'Karma dla kotow sterylizowanych z łososiem.',
    4,
    269.99,
    NULL,
    3.6,
    '/images/products/cats/purina-sterilised.jpg',
    'ACTIVE',
    27,
    'ZOO-6GGNSV8L',
    10.0,
    '50x36x24cm',
    NULL,
    2,
    11,
    TIMESTAMP '2026-01-22 14:14:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    22,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych kotow z tuńczykiem.',
    6,
    229.99,
    NULL,
    4.9,
    '/images/products/cats/hills-tuna.jpg',
    'ACTIVE',
    131,
    'ZOO-HW6OY73U',
    7.0,
    '15x32x8cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-26 10:50:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    23,
    'Sheba saszetki z łososiem 12x85g',
    'Mokra karma premium w saszatkach. Delikatne kawałki w sosie.',
    7,
    32.99,
    NULL,
    3.8,
    '/images/products/cats/sheba-salmon.jpg',
    'ACTIVE',
    72,
    'ZOO-T9VO5V2F',
    1.02,
    '26x16x14cm',
    NULL,
    2,
    12,
    TIMESTAMP '2025-12-17 19:59:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    24,
    'Whiskas puszka z tunczykiem',
    'Mokra karma dla kotow z tunczykiem w galaretce.',
    5,
    4.49,
    NULL,
    3.9,
    '/images/products/cats/whiskas-can.jpg',
    'ACTIVE',
    166,
    'ZOO-YPPB043U',
    0.4,
    '36x23x30cm',
    NULL,
    2,
    12,
    TIMESTAMP '2025-12-01 19:36:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    25,
    'Whiskas Temptations kurczak',
    'Chrupiace przysmaki z miekkim nadzieniem.',
    5,
    8.99,
    NULL,
    4.9,
    '/images/products/cats/temptations.jpg',
    'ACTIVE',
    156,
    'ZOO-RASLZ0MD',
    0.06,
    '23x32x13cm',
    NULL,
    2,
    13,
    TIMESTAMP '2025-12-29 00:15:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    26,
    'Trixie myszka pluszowa 3szt',
    'Zestaw pluszowych myszek z kocimiętką.',
    15,
    12.99,
    NULL,
    4.0,
    '/images/products/cats/plush-mice.jpg',
    'ACTIVE',
    33,
    'ZOO-W8CKLVG4',
    0.05,
    '44x20x17cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-01 05:47:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    27,
    'Trixie wedka z piórkami',
    'Interaktywna wedka z kolorowymi piórkami.',
    15,
    19.99,
    15.99,
    3.7,
    '/images/products/cats/feather-wand.jpg',
    'ACTIVE',
    83,
    'ZOO-GIDW1BDU',
    0.1,
    '20x29x17cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-10 18:53:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    28,
    'Ferplast tunel dla kota',
    'Składany tunel do zabawy z szelestrzącym materiałem.',
    17,
    49.99,
    44.99,
    4.4,
    '/images/products/cats/tunnel.jpg',
    'ACTIVE',
    37,
    'ZOO-0ZI54LV0',
    0.3,
    '42x31x26cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-04 22:19:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    29,
    'Trixie drapak słupek 60cm',
    'Drapak z sizalowym słupkiem i platformą.',
    15,
    79.99,
    67.99,
    3.7,
    '/images/products/cats/scratching-post.jpg',
    'ACTIVE',
    142,
    'ZOO-G3PIVI9N',
    3.0,
    '39x39x20cm',
    NULL,
    2,
    15,
    TIMESTAMP '2026-01-16 13:41:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    30,
    'Trixie legowisko na kaloryfer',
    'Miekkie legowisko do zawieszenia na kaloryferze.',
    15,
    59.99,
    47.99,
    4.9,
    '/images/products/cats/radiator-bed.jpg',
    'ACTIVE',
    164,
    'ZOO-DGA40JKV',
    0.5,
    '17x22x13cm',
    NULL,
    2,
    16,
    TIMESTAMP '2025-12-17 09:44:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    31,
    'Ferplast kuweta Netta',
    'Zamknięta kuweta z filrem węglowym.',
    17,
    89.99,
    NULL,
    4.6,
    '/images/products/cats/litter-box.jpg',
    'ACTIVE',
    43,
    'ZOO-PGB6JUJP',
    2.5,
    '15x33x27cm',
    NULL,
    2,
    19,
    TIMESTAMP '2025-12-27 19:52:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    32,
    'Trixie żwirek betonit 10L',
    'Zbrylający żwirek o delikatnym zapachu.',
    15,
    29.99,
    NULL,
    4.3,
    '/images/products/cats/litter.jpg',
    'ACTIVE',
    151,
    'ZOO-SZ8N28J5',
    8.0,
    '18x34x17cm',
    NULL,
    2,
    19,
    TIMESTAMP '2026-01-17 01:59:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    33,
    'Royal Canin Hairball Care',
    'Suplement pomagający w usuwaniu kul włosowych.',
    1,
    49.99,
    NULL,
    4.2,
    '/images/products/cats/hairball.jpg',
    'ACTIVE',
    9,
    'ZOO-7PDJBONS',
    0.4,
    '17x31x21cm',
    NULL,
    2,
    18,
    TIMESTAMP '2025-12-02 04:56:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    34,
    'Ferplast transporter Atlas 20',
    'Transporter dla kotow z wentylacją.',
    17,
    99.99,
    NULL,
    4.8,
    '/images/products/cats/carrier.jpg',
    'ACTIVE',
    32,
    'ZOO-4ZN4UF1A',
    2.0,
    '32x12x23cm',
    NULL,
    2,
    20,
    TIMESTAMP '2026-01-19 06:04:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    35,
    'Vitakraft Menu Vital chomik',
    'Pełnowartościowa karma dla chomików z witaminami.',
    8,
    24.99,
    22.49,
    4.6,
    '/images/products/rodents/vitakraft-hamster.jpg',
    'ACTIVE',
    109,
    'ZOO-0HQ49SXA',
    1.0,
    '19x24x7cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-15 14:01:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    36,
    'Versele-Laga Crispy Muesli',
    'Mieszanka dla królików z warzywami i ziołami.',
    9,
    39.99,
    NULL,
    4.7,
    '/images/products/rodents/crispy-rabbit.jpg',
    'ACTIVE',
    67,
    'ZOO-46KUDSB8',
    2.75,
    '26x13x30cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-07 12:33:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    37,
    'Vitakraft karma dla świnki',
    'Karma dla świnek morskich z witaminą C.',
    8,
    26.99,
    21.59,
    4.4,
    '/images/products/rodents/guinea-food.jpg',
    'ACTIVE',
    189,
    'ZOO-M1GDKQ1N',
    1.0,
    '12x24x14cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-06 00:59:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    38,
    'Versele-Laga Complete Hamster',
    'Ekstrudowana karma dla chomików. All-in-one.',
    9,
    19.99,
    17.99,
    4.5,
    '/images/products/rodents/complete-hamster.jpg',
    'ACTIVE',
    10,
    'ZOO-XK4A6X1D',
    0.5,
    '17x35x13cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-11-26 23:36:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    39,
    'Vitakraft Kracker miód',
    'Kolby z miodem dla gryzoni.',
    8,
    9.99,
    NULL,
    3.5,
    '/images/products/rodents/honey-sticks.jpg',
    'ACTIVE',
    122,
    'ZOO-A8DASPY6',
    0.2,
    '48x21x22cm',
    NULL,
    3,
    23,
    TIMESTAMP '2026-01-20 08:46:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    40,
    'Trixie domek drewniany M',
    'Domek z naturalnego drewna dla chomika.',
    15,
    29.99,
    NULL,
    4.3,
    '/images/products/rodents/wooden-house.jpg',
    'ACTIVE',
    52,
    'ZOO-SGFGOVJA',
    0.3,
    '20x37x26cm',
    NULL,
    3,
    25,
    TIMESTAMP '2026-01-21 03:15:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    41,
    'Trixie kołowrotek 20cm',
    'Metalowy kołowrotek dla chomika i myszki.',
    15,
    39.99,
    27.99,
    4.2,
    '/images/products/rodents/wheel.jpg',
    'ACTIVE',
    119,
    'ZOO-BVNODM4J',
    0.4,
    '40x25x21cm',
    NULL,
    3,
    24,
    TIMESTAMP '2025-12-14 13:17:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    42,
    'Ferplast klatka Criceti 100',
    'Duża klatka dla chomików z wyposażeniem.',
    17,
    249.99,
    NULL,
    3.7,
    '/images/products/rodents/cage.jpg',
    'ACTIVE',
    126,
    'ZOO-1INY1M26',
    5.0,
    '50x13x26cm',
    NULL,
    3,
    25,
    TIMESTAMP '2026-01-19 11:32:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    43,
    'Trixie siano łąkowe 1kg',
    'Naturalne siano dla królików i gryzoni.',
    15,
    14.99,
    NULL,
    4.2,
    '/images/products/rodents/hay.jpg',
    'ACTIVE',
    165,
    'ZOO-6Y7HHOGW',
    1.0,
    '13x36x20cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-19 21:46:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    44,
    'Vitakraft witaminy krople',
    'Witaminy w kroplach dla gryzoni.',
    8,
    19.99,
    NULL,
    4.8,
    '/images/products/rodents/vitamins.jpg',
    'ACTIVE',
    107,
    'ZOO-R4YNEAJ0',
    0.05,
    '46x36x21cm',
    NULL,
    3,
    28,
    TIMESTAMP '2025-12-21 01:50:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    45,
    'Versele-Laga Prestige papuga',
    'Mieszanka ziaren dla średnich papug.',
    9,
    29.99,
    NULL,
    4.2,
    '/images/products/birds/prestige-parrot.jpg',
    'ACTIVE',
    23,
    'ZOO-1Q8E3UXZ',
    1.0,
    '24x12x18cm',
    NULL,
    4,
    31,
    TIMESTAMP '2026-01-16 05:33:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    46,
    'Vitakraft kanarek Premium',
    'Karma dla kanarków z ziołami.',
    8,
    24.99,
    NULL,
    3.7,
    '/images/products/birds/canary-food.jpg',
    'ACTIVE',
    53,
    'ZOO-UJMUP27C',
    0.8,
    '21x32x22cm',
    NULL,
    4,
    31,
    TIMESTAMP '2026-01-22 03:23:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    47,
    'Versele-Laga NutriBird',
    'Ekstrudowana karma dla papug.',
    9,
    49.99,
    37.49,
    3.8,
    '/images/products/birds/nutribird.jpg',
    'ACTIVE',
    84,
    'ZOO-RDX50JBW',
    1.0,
    '39x21x8cm',
    NULL,
    4,
    31,
    TIMESTAMP '2026-01-05 08:45:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    48,
    'Vitakraft Kracker jajeczny',
    'Kolba z jajkiem dla kanarków.',
    8,
    7.99,
    NULL,
    4.6,
    '/images/products/birds/egg-stick.jpg',
    'ACTIVE',
    155,
    'ZOO-6UON6DNU',
    0.1,
    '49x31x16cm',
    NULL,
    4,
    33,
    TIMESTAMP '2025-12-17 12:42:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    49,
    'Trixie huśtawka drewniana',
    'Huśtawka z naturalnego drewna dla ptaków.',
    15,
    14.99,
    NULL,
    4.3,
    '/images/products/birds/swing.jpg',
    'ACTIVE',
    71,
    'ZOO-KQ4IEM6K',
    0.15,
    '48x22x10cm',
    NULL,
    4,
    34,
    TIMESTAMP '2025-12-26 20:05:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    50,
    'Ferplast klatka Piano 6',
    'Duża klatka dla kanarków i papużek.',
    17,
    349.99,
    NULL,
    5.0,
    '/images/products/birds/cage.jpg',
    'ACTIVE',
    179,
    'ZOO-VBYNJYUC',
    8.0,
    '30x38x30cm',
    NULL,
    4,
    35,
    TIMESTAMP '2025-12-11 21:40:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    51,
    'Trixie żerdź korowa 2szt',
    'Naturalne żerdzie z kory dla ptaków.',
    15,
    19.99,
    NULL,
    4.7,
    '/images/products/birds/perches.jpg',
    'ACTIVE',
    163,
    'ZOO-SJPLYVN1',
    0.2,
    '20x25x19cm',
    NULL,
    4,
    35,
    TIMESTAMP '2026-01-21 22:10:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    52,
    'Vitakraft piasek dla ptaków',
    'Piasek z muszlami dla lepszego trawienia.',
    8,
    12.99,
    NULL,
    3.7,
    '/images/products/birds/sand.jpg',
    'ACTIVE',
    88,
    'ZOO-PHVUVALQ',
    2.5,
    '25x20x30cm',
    NULL,
    4,
    39,
    TIMESTAMP '2026-01-07 04:03:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    53,
    'Tetra Pro Energy',
    'Wysokoenergetyczna karma w płatkach.',
    10,
    79.99,
    NULL,
    4.9,
    '/images/products/fish/tetra-pro.jpg',
    'ACTIVE',
    120,
    'ZOO-TC7JJZHZ',
    0.5,
    '17x17x11cm',
    NULL,
    5,
    41,
    TIMESTAMP '2025-12-07 17:48:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    54,
    'Tropical Supervit',
    'Wieloskładnikowa karma dla ryb tropikalnych.',
    12,
    39.99,
    NULL,
    3.9,
    '/images/products/fish/supervit.jpg',
    'ACTIVE',
    80,
    'ZOO-XE510S3F',
    0.25,
    '19x35x29cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-25 19:06:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    55,
    'JBL NovoTab',
    'Tabletki pokarmowe dla ryb dennych.',
    11,
    44.99,
    NULL,
    4.0,
    '/images/products/fish/novotab.jpg',
    'ACTIVE',
    197,
    'ZOO-899YXYCL',
    0.25,
    '22x21x20cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-15 16:10:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    56,
    'Tetra Goldfish',
    'Karma dla złotych rybek w płatkach.',
    10,
    29.99,
    NULL,
    3.5,
    '/images/products/fish/goldfish.jpg',
    'ACTIVE',
    23,
    'ZOO-Y0GWGH1V',
    0.2,
    '41x35x9cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-14 02:32:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    57,
    'JBL ProFlora u500',
    'Butla CO2 500g do nawożenia roślin.',
    11,
    149.99,
    104.99,
    4.3,
    '/images/products/fish/co2.jpg',
    'ACTIVE',
    55,
    'ZOO-AWN7J0L8',
    1.2,
    '45x40x27cm',
    NULL,
    5,
    45,
    TIMESTAMP '2026-01-13 16:11:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    58,
    'Tetra EasyCrystal 600',
    'Filtr wewnętrzny do akwariów 50-150L.',
    10,
    129.99,
    NULL,
    4.2,
    '/images/products/fish/filter.jpg',
    'ACTIVE',
    21,
    'ZOO-CSIN9EBL',
    0.8,
    '36x16x26cm',
    NULL,
    5,
    45,
    TIMESTAMP '2026-01-03 21:08:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    59,
    'JBL LED Solar Nature',
    'Oświetlenie LED do akwariów roślinnych.',
    11,
    399.99,
    NULL,
    4.8,
    '/images/products/fish/led-light.jpg',
    'ACTIVE',
    117,
    'ZOO-OOF85LW7',
    1.5,
    '38x35x19cm',
    NULL,
    5,
    45,
    TIMESTAMP '2026-01-01 08:15:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    60,
    'Tetra Aqua Safe 500ml',
    'Uzdatniacz wody usuwający chlor.',
    10,
    49.99,
    NULL,
    4.1,
    '/images/products/fish/aquasafe.jpg',
    'ACTIVE',
    147,
    'ZOO-S19CJRBZ',
    0.5,
    '48x24x29cm',
    NULL,
    5,
    49,
    TIMESTAMP '2025-12-31 14:01:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    61,
    'JBL Denitrol 250ml',
    'Bakterie startowe do nowych akwariów.',
    11,
    59.99,
    44.99,
    4.4,
    '/images/products/fish/denitrol.jpg',
    'ACTIVE',
    116,
    'ZOO-LR9UD2B3',
    0.3,
    '40x26x23cm',
    NULL,
    5,
    48,
    TIMESTAMP '2025-12-01 06:37:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    62,
    'Tropical korzeń mangrowca M',
    'Naturalny korzeń do dekoracji akwarium.',
    12,
    69.99,
    NULL,
    4.7,
    '/images/products/fish/root.jpg',
    'ACTIVE',
    177,
    'ZOO-TFBFSOVS',
    0.8,
    '22x27x21cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-11-30 21:54:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    63,
    'Zoo Med karma dla żółwia',
    'Pływające granulki dla żółwi wodnych.',
    13,
    49.99,
    NULL,
    4.8,
    '/images/products/reptiles/turtle-food.jpg',
    'ACTIVE',
    91,
    'ZOO-QWXWRXHQ',
    0.35,
    '15x27x26cm',
    NULL,
    6,
    51,
    TIMESTAMP '2026-01-01 18:26:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    64,
    'Exo Terra karma dla brodatych',
    'Karma dla agam brodatych dorosłych.',
    14,
    39.99,
    NULL,
    4.5,
    '/images/products/reptiles/bearded-dragon.jpg',
    'ACTIVE',
    161,
    'ZOO-51GFKS1Y',
    0.25,
    '34x40x20cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-10 00:11:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    65,
    'Zoo Med świerszcze liofiliz.',
    'Suszone świerszcze dla gadów i płazów.',
    13,
    34.99,
    NULL,
    4.0,
    '/images/products/reptiles/crickets.jpg',
    'ACTIVE',
    114,
    'ZOO-YFLFQPJI',
    0.08,
    '24x28x11cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-10 20:18:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    66,
    'Exo Terra terrarium 60x45x45',
    'Szklane terrarium z wentylacją.',
    14,
    599.99,
    NULL,
    4.7,
    '/images/products/reptiles/terrarium.jpg',
    'ACTIVE',
    20,
    'ZOO-CRWPEC9W',
    25.0,
    '27x27x20cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-09 16:43:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    67,
    'Zoo Med lampa UVB 10.0',
    'Świetlówka UVB dla gadów pustynnych.',
    13,
    89.99,
    80.99,
    4.8,
    '/images/products/reptiles/uvb-lamp.jpg',
    'ACTIVE',
    132,
    'ZOO-E441ONEZ',
    0.2,
    '18x13x10cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-01 01:37:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    68,
    'Exo Terra Heat Mat M',
    'Mata grzewcza 16W do terrarium.',
    14,
    79.99,
    NULL,
    3.5,
    '/images/products/reptiles/heat-mat.jpg',
    'ACTIVE',
    77,
    'ZOO-WPI8JF35',
    0.3,
    '20x26x17cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-13 07:49:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    69,
    'Zoo Med Repti Calcium',
    'Wapno bez D3 dla gadów.',
    13,
    44.99,
    NULL,
    4.8,
    '/images/products/reptiles/calcium.jpg',
    'ACTIVE',
    57,
    'ZOO-AB688ADS',
    0.25,
    '21x28x22cm',
    NULL,
    6,
    58,
    TIMESTAMP '2025-12-25 23:01:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    70,
    'Exo Terra kryjówka jaskinia M',
    'Naturalna dekoracja - kryjówka.',
    14,
    49.99,
    NULL,
    4.4,
    '/images/products/reptiles/hide.jpg',
    'ACTIVE',
    57,
    'ZOO-IF2WT1TL',
    0.8,
    '14x22x30cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-18 10:21:36',
    TIMESTAMP '2026-01-26 19:53:36'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    71,
    'Zoo Med Eco Earth 3-pack',
    'Podłoże kokosowe do terrarów.',
    13,
    39.99,
    35.99,
    4.1,
    '/images/products/reptiles/substrate.jpg',
    'ACTIVE',
    90,
    'ZOO-APIPE2KS',
    0.6,
    '21x17x28cm',
    NULL,
    6,
    59,
    TIMESTAMP '2025-12-12 00:54:36',
    TIMESTAMP '2026-01-26 19:53:36'
);

-- Insert orders
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    1,
    'ZAM-20260126-013255',
    TIMESTAMP '2025-12-23 23:12:51',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    183.95,
    183.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 19:12:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-25 01:12:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    2,
    'ZAM-20260126-768480',
    TIMESTAMP '2025-12-09 21:28:51',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'COURIER',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 52/34',
    'Bydgoszcz',
    '23-655',
    'Poland',
    'ul. Kwiatowa 52/34',
    'Bydgoszcz',
    '23-655',
    'Poland',
    171.52,
    190.02,
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
    TIMESTAMP '2025-12-10 17:28:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    3,
    'ZAM-20260126-303014',
    TIMESTAMP '2026-01-16 03:29:51',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 59/10',
    'Gdynia',
    '55-895',
    'Poland',
    'ul. Rynek 59/10',
    'Gdynia',
    '55-895',
    'Poland',
    275.96,
    288.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL70970879',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-17 00:29:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    4,
    'ZAM-20260126-159960',
    TIMESTAMP '2025-11-29 04:05:51',
    'SHIPPED',
    'PAID',
    'BLIK',
    'COURIER',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 136/30',
    'Gliwice',
    '95-589',
    'Poland',
    'ul. Kolejowa 136/30',
    'Gliwice',
    '95-589',
    'Poland',
    267.95,
    271.96,
    18.5,
    14.49,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL33902692',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-30 20:05:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    5,
    'ZAM-20260126-441229',
    TIMESTAMP '2026-01-20 19:15:51',
    'CONFIRMED',
    'PENDING',
    'BLIK',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    25.98,
    38.97,
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
    TIMESTAMP '2026-01-22 15:15:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    6,
    'ZAM-20260126-668258',
    TIMESTAMP '2025-12-07 07:30:51',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    597.89,
    610.88,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL38305938',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 08:30:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    7,
    'ZAM-20260126-388903',
    TIMESTAMP '2026-01-18 14:07:51',
    'CONFIRMED',
    'PENDING',
    'BLIK',
    'LOCKER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    662.42,
    675.41,
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
    TIMESTAMP '2026-01-18 16:07:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    8,
    'ZAM-20260126-241479',
    TIMESTAMP '2025-12-02 15:07:51',
    'SHIPPED',
    'PAID',
    'BLIK',
    'PICKUP',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    339.98,
    339.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL56542542',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 00:07:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    9,
    'ZAM-20260126-581232',
    TIMESTAMP '2025-12-16 11:55:51',
    'CONFIRMED',
    'PENDING',
    'CARD',
    'PICKUP',
    12,
    NULL,
    NULL,
    NULL,
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    264.94,
    264.94,
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
    TIMESTAMP '2025-12-18 11:55:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    10,
    'ZAM-20260126-814160',
    TIMESTAMP '2025-12-12 03:17:51',
    'PROCESSING',
    'FAILED',
    'BLIK',
    'LOCKER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 120/5',
    'Rzeszów',
    '56-430',
    'Poland',
    'ul. Słoneczna 120/5',
    'Rzeszów',
    '56-430',
    'Poland',
    374.9,
    387.89,
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
    TIMESTAMP '2025-12-12 05:17:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    11,
    'ZAM-20260126-083307',
    TIMESTAMP '2026-01-24 02:28:51',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    419.95,
    398.71,
    18.5,
    39.74,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL54317705',
    NULL,
    NULL,
    TIMESTAMP '2026-01-27 02:28:51',
    TIMESTAMP '2026-01-25 19:28:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    12,
    'ZAM-20260126-205931',
    TIMESTAMP '2025-12-26 14:10:51',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'LOCKER',
    20,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 141/36',
    'Wrocław',
    '99-667',
    'Poland',
    'ul. Piaskowa 141/36',
    'Wrocław',
    '99-667',
    'Poland',
    199.96,
    212.95,
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
    TIMESTAMP '2025-12-26 21:10:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    13,
    'ZAM-20260126-709457',
    TIMESTAMP '2026-01-19 17:55:51',
    'PROCESSING',
    'PENDING',
    'BLIK',
    'LOCKER',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Sportowa 95/3',
    'Wrocław',
    '52-419',
    'Poland',
    'ul. Sportowa 95/3',
    'Wrocław',
    '52-419',
    'Poland',
    1085.93,
    1098.92,
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
    TIMESTAMP '2026-01-20 02:55:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    14,
    'ZAM-20260126-291683',
    TIMESTAMP '2026-01-16 19:03:51',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 59/10',
    'Gdynia',
    '55-895',
    'Poland',
    'ul. Rynek 59/10',
    'Gdynia',
    '55-895',
    'Poland',
    59.98,
    59.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-17 06:03:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-18 08:03:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    15,
    'ZAM-20260126-645359',
    TIMESTAMP '2025-12-09 22:54:51',
    'CONFIRMED',
    'PENDING',
    'BLIK',
    'LOCKER',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    153.84,
    166.83,
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
    TIMESTAMP '2025-12-10 22:54:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    16,
    'ZAM-20260126-912195',
    TIMESTAMP '2025-12-30 07:56:51',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    319.93,
    316.14,
    12.99,
    16.78,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-31 20:56:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    17,
    'ZAM-20260126-751443',
    TIMESTAMP '2026-01-17 05:20:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    20,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 141/36',
    'Wrocław',
    '99-667',
    'Poland',
    'ul. Piaskowa 141/36',
    'Wrocław',
    '99-667',
    'Poland',
    193.96,
    193.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL49058017',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-19 03:20:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    18,
    'ZAM-20260126-440314',
    TIMESTAMP '2025-12-29 15:46:51',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    1081.9,
    1081.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL99981375',
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 15:46:51',
    TIMESTAMP '2025-12-31 10:46:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    19,
    'ZAM-20260126-868858',
    TIMESTAMP '2025-12-31 14:51:51',
    'CONFIRMED',
    'PENDING',
    'TRANSFER',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    21.59,
    40.09,
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
    TIMESTAMP '2026-01-02 13:51:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    20,
    'ZAM-20260126-625643',
    TIMESTAMP '2025-12-16 00:00:51',
    'PENDING',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    1029.89,
    1042.88,
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
    TIMESTAMP '2025-12-17 03:00:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    21,
    'ZAM-20260126-076877',
    TIMESTAMP '2026-01-16 16:34:51',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    1931.5,
    1950.0,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL80612537',
    NULL,
    NULL,
    TIMESTAMP '2026-01-18 16:34:51',
    TIMESTAMP '2026-01-17 11:34:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    22,
    'ZAM-20260126-466795',
    TIMESTAMP '2025-12-29 06:16:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    553.44,
    553.44,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL34947878',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 06:16:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    23,
    'ZAM-20260126-801842',
    TIMESTAMP '2025-12-17 15:49:51',
    'PROCESSING',
    'FAILED',
    'CARD',
    'COURIER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 34/27',
    'Toruń',
    '11-734',
    'Poland',
    'ul. Piaskowa 34/27',
    'Toruń',
    '11-734',
    'Poland',
    323.93,
    342.43,
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
    TIMESTAMP '2025-12-18 20:49:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    24,
    'ZAM-20260126-279392',
    TIMESTAMP '2026-01-21 08:24:51',
    'CONFIRMED',
    'FAILED',
    'BLIK',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    34.99,
    47.98,
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
    TIMESTAMP '2026-01-21 11:24:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    25,
    'ZAM-20260126-088374',
    TIMESTAMP '2026-01-11 03:10:51',
    'PACKED',
    'PENDING',
    'BLIK',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    104.99,
    123.49,
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
    TIMESTAMP '2026-01-12 19:10:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    26,
    'ZAM-20260126-400077',
    TIMESTAMP '2025-11-29 20:07:51',
    'PROCESSING',
    'FAILED',
    'CARD',
    'PICKUP',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    1699.93,
    1699.93,
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
    TIMESTAMP '2025-11-30 11:07:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    27,
    'ZAM-20260126-633836',
    TIMESTAMP '2026-01-09 15:54:51',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    59.97,
    66.08,
    12.99,
    6.88,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL74708832',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-11 12:54:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    28,
    'ZAM-20260126-591987',
    TIMESTAMP '2025-12-26 15:22:51',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    157.94,
    170.93,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL28559256',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-26 18:22:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    29,
    'ZAM-20260126-933034',
    TIMESTAMP '2025-12-31 15:40:51',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    5,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 136/19',
    'Zabrze',
    '35-975',
    'Poland',
    'ul. Ogrodowa 136/19',
    'Zabrze',
    '35-975',
    'Poland',
    272.93,
    285.92,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-31 22:40:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-02 09:40:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    30,
    'ZAM-20260126-601936',
    TIMESTAMP '2025-12-28 22:32:51',
    'SHIPPED',
    'PAID',
    'CARD',
    'COURIER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    154.76,
    173.26,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL80901172',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 03:32:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    31,
    'ZAM-20260126-103329',
    TIMESTAMP '2025-12-02 00:52:51',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    15,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 147/47',
    'Katowice',
    '20-316',
    'Poland',
    'ul. Krótka 147/47',
    'Katowice',
    '20-316',
    'Poland',
    614.91,
    614.91,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL15762314',
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 00:52:51',
    TIMESTAMP '2025-12-02 05:52:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    32,
    'ZAM-20260126-477610',
    TIMESTAMP '2025-12-26 00:15:51',
    'CONFIRMED',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    515.66,
    515.66,
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
    TIMESTAMP '2025-12-27 16:15:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    33,
    'ZAM-20260126-402664',
    TIMESTAMP '2025-12-11 09:23:51',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    477.17,
    477.17,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL96135714',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 04:23:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    34,
    'ZAM-20260126-496333',
    TIMESTAMP '2026-01-07 03:59:51',
    'PACKED',
    'PENDING',
    'CARD',
    'COURIER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 34/27',
    'Wrocław',
    '94-380',
    'Poland',
    'ul. Wodna 34/27',
    'Wrocław',
    '94-380',
    'Poland',
    397.93,
    416.43,
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
    TIMESTAMP '2026-01-08 17:59:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    35,
    'ZAM-20260126-318967',
    TIMESTAMP '2026-01-18 05:01:51',
    'PROCESSING',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    863.92,
    876.91,
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
    TIMESTAMP '2026-01-19 02:01:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    36,
    'ZAM-20260126-128458',
    TIMESTAMP '2026-01-02 00:29:51',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'COURIER',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    1179.9,
    1198.4,
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
    TIMESTAMP '2026-01-02 01:29:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    37,
    'ZAM-20260126-879733',
    TIMESTAMP '2025-12-04 15:44:51',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'PICKUP',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    993.9,
    993.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL46884491',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-06 03:44:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    38,
    'ZAM-20260126-747911',
    TIMESTAMP '2026-01-13 09:55:51',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    889.9,
    908.4,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL52845152',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-14 11:55:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    39,
    'ZAM-20260126-274964',
    TIMESTAMP '2026-01-03 12:07:51',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    437.4,
    426.3,
    18.5,
    29.6,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-03 22:07:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-05 08:07:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    40,
    'ZAM-20260126-778558',
    TIMESTAMP '2026-01-20 10:23:51',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'LOCKER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    1143.8,
    1156.79,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL19458621',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 12:23:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    41,
    'ZAM-20260126-010699',
    TIMESTAMP '2026-01-07 19:07:51',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'LOCKER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    306.54,
    319.53,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 03:07:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-07 21:07:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    42,
    'ZAM-20260126-501504',
    TIMESTAMP '2025-12-13 10:08:51',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'COURIER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    1314.93,
    1333.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL18692678',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 16:08:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    43,
    'ZAM-20260126-181431',
    TIMESTAMP '2025-12-11 15:49:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'COURIER',
    12,
    NULL,
    NULL,
    NULL,
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    184.95,
    203.45,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL88604092',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 12:49:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    44,
    'ZAM-20260126-936057',
    TIMESTAMP '2025-12-29 07:38:51',
    'DELIVERED',
    'PAID',
    'CARD',
    'LOCKER',
    30,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 54/25',
    'Radom',
    '24-860',
    'Poland',
    'ul. Piaskowa 54/25',
    'Radom',
    '24-860',
    'Poland',
    161.98,
    174.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL11884641',
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 07:38:51',
    TIMESTAMP '2025-12-31 05:38:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    45,
    'ZAM-20260126-348294',
    TIMESTAMP '2026-01-25 22:30:51',
    'CONFIRMED',
    'PAID',
    'CARD',
    'COURIER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    'ul. Szkolna 33/37',
    'Katowice',
    '12-275',
    'Poland',
    935.52,
    864.35,
    18.5,
    89.67,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-26 05:30:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    46,
    'ZAM-20260126-378851',
    TIMESTAMP '2025-12-25 16:17:51',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    'ul. Polna 76/41',
    'Poznań',
    '88-222',
    'Poland',
    492.89,
    464.55,
    18.5,
    46.84,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-26 00:17:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    47,
    'ZAM-20260126-664358',
    TIMESTAMP '2026-01-10 01:22:51',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    392.94,
    411.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 15:22:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-10 08:22:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    48,
    'ZAM-20260126-809598',
    TIMESTAMP '2026-01-20 15:18:51',
    'PENDING',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    467.91,
    467.91,
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
    TIMESTAMP '2026-01-21 22:18:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    49,
    'ZAM-20260126-842593',
    TIMESTAMP '2026-01-06 23:23:51',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'PICKUP',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Lipowa 148/28',
    'Częstochowa',
    '46-874',
    'Poland',
    'ul. Lipowa 148/28',
    'Częstochowa',
    '46-874',
    'Poland',
    78.44,
    68.82,
    0.0,
    9.62,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL59611130',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 18:23:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    50,
    'ZAM-20260126-005765',
    TIMESTAMP '2026-01-23 01:50:51',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'LOCKER',
    50,
    NULL,
    NULL,
    NULL,
    'ul. Sportowa 19/39',
    'Katowice',
    '86-146',
    'Poland',
    'ul. Sportowa 19/39',
    'Katowice',
    '86-146',
    'Poland',
    89.99,
    102.98,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL88102234',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-23 18:50:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    51,
    'ZAM-20260126-193397',
    TIMESTAMP '2026-01-02 03:40:51',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    89.99,
    97.59,
    12.99,
    5.39,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-03 22:40:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    52,
    'ZAM-20260126-721598',
    TIMESTAMP '2025-12-20 21:11:51',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    389.89,
    402.88,
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
    TIMESTAMP '2025-12-21 08:11:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    53,
    'ZAM-20260126-861306',
    TIMESTAMP '2026-01-17 00:44:51',
    'CONFIRMED',
    'PENDING',
    'CARD',
    'COURIER',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    104.97,
    123.47,
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
    TIMESTAMP '2026-01-18 17:44:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    54,
    'ZAM-20260126-747184',
    TIMESTAMP '2025-12-12 06:26:51',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Główna 17/7',
    'Rzeszów',
    '22-479',
    'Poland',
    'ul. Główna 17/7',
    'Rzeszów',
    '22-479',
    'Poland',
    23.97,
    36.96,
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
    TIMESTAMP '2025-12-12 10:26:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    55,
    'ZAM-20260126-640612',
    TIMESTAMP '2026-01-04 16:58:51',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    'ul. Wodna 111/10',
    'Zabrze',
    '47-914',
    'Poland',
    1142.42,
    1160.92,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL70958823',
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 16:58:51',
    TIMESTAMP '2026-01-05 00:58:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    56,
    'ZAM-20260126-018462',
    TIMESTAMP '2026-01-10 10:27:51',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 30/17',
    'Katowice',
    '91-637',
    'Poland',
    'ul. Leśna 30/17',
    'Katowice',
    '91-637',
    'Poland',
    909.96,
    922.95,
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
    TIMESTAMP '2026-01-11 08:27:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    57,
    'ZAM-20260126-692482',
    TIMESTAMP '2025-12-02 13:45:51',
    'PACKED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    662.9,
    662.9,
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
    TIMESTAMP '2025-12-02 22:45:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    58,
    'ZAM-20260126-078243',
    TIMESTAMP '2026-01-26 15:45:51',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'PICKUP',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    229.94,
    229.94,
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
    TIMESTAMP '2026-01-28 12:45:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    59,
    'ZAM-20260126-096920',
    TIMESTAMP '2025-12-14 12:13:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    1525.94,
    1406.22,
    12.99,
    132.71,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL43999682',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-16 06:13:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    60,
    'ZAM-20260126-425888',
    TIMESTAMP '2026-01-13 14:57:51',
    'SHIPPED',
    'PAID',
    'CARD',
    'PICKUP',
    5,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 136/19',
    'Zabrze',
    '35-975',
    'Poland',
    'ul. Ogrodowa 136/19',
    'Zabrze',
    '35-975',
    'Poland',
    1498.4,
    1498.4,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL89555332',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-13 20:57:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    61,
    'ZAM-20260126-585959',
    TIMESTAMP '2025-12-22 12:12:51',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    301.97,
    301.97,
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
    TIMESTAMP '2025-12-23 10:12:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    62,
    'ZAM-20260126-239864',
    TIMESTAMP '2026-01-15 20:43:51',
    'PENDING',
    'PAID',
    'TRANSFER',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    714.64,
    714.64,
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
    TIMESTAMP '2026-01-17 06:43:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    63,
    'ZAM-20260126-373577',
    TIMESTAMP '2025-11-29 04:39:51',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 6/4',
    'Gdańsk',
    '50-372',
    'Poland',
    'ul. Brzozowa 6/4',
    'Gdańsk',
    '50-372',
    'Poland',
    381.44,
    394.43,
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
    TIMESTAMP '2025-11-29 15:39:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    64,
    'ZAM-20260126-675087',
    TIMESTAMP '2026-01-15 08:25:51',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 30/17',
    'Katowice',
    '91-637',
    'Poland',
    'ul. Leśna 30/17',
    'Katowice',
    '91-637',
    'Poland',
    524.91,
    537.9,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-16 08:25:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-15 11:25:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    65,
    'ZAM-20260126-851654',
    TIMESTAMP '2025-12-23 00:21:51',
    'PROCESSING',
    'PENDING',
    'CASH_ON_DELIVERY',
    'PICKUP',
    11,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 136/30',
    'Gliwice',
    '95-589',
    'Poland',
    'ul. Kolejowa 136/30',
    'Gliwice',
    '95-589',
    'Poland',
    472.93,
    472.93,
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
    TIMESTAMP '2025-12-24 18:21:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    66,
    'ZAM-20260126-003618',
    TIMESTAMP '2026-01-26 00:31:51',
    'DELIVERED',
    'PAID',
    'CARD',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    745.9,
    764.4,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL71102242',
    NULL,
    NULL,
    TIMESTAMP '2026-01-28 00:31:51',
    TIMESTAMP '2026-01-26 21:31:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    67,
    'ZAM-20260126-002532',
    TIMESTAMP '2026-01-17 10:51:51',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 131/33',
    'Rzeszów',
    '71-257',
    'Poland',
    'ul. Krótka 131/33',
    'Rzeszów',
    '71-257',
    'Poland',
    1220.92,
    1064.8,
    18.5,
    174.62,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL86205001',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-18 12:51:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    68,
    'ZAM-20260126-791196',
    TIMESTAMP '2026-01-25 23:32:51',
    'PACKED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    'ul. Krótka 40/20',
    'Częstochowa',
    '76-345',
    'Poland',
    659.95,
    672.94,
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
    TIMESTAMP '2026-01-26 04:32:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    69,
    'ZAM-20260126-026537',
    TIMESTAMP '2025-12-04 23:34:51',
    'CONFIRMED',
    'FAILED',
    'BLIK',
    'COURIER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    'ul. Nowa 6/45',
    'Gdynia',
    '56-694',
    'Poland',
    1085.4,
    1103.9,
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
    TIMESTAMP '2025-12-05 06:34:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    70,
    'ZAM-20260126-609463',
    TIMESTAMP '2025-12-05 16:55:51',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'PICKUP',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    'ul. Rynek 41/20',
    'Kraków',
    '89-251',
    'Poland',
    513.44,
    513.44,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-06 06:55:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-07 01:55:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    71,
    'ZAM-20260126-991857',
    TIMESTAMP '2025-12-25 09:52:51',
    'PACKED',
    'FAILED',
    'CARD',
    'PICKUP',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 36/32',
    'Katowice',
    '91-598',
    'Poland',
    'ul. Słoneczna 36/32',
    'Katowice',
    '91-598',
    'Poland',
    1064.96,
    1064.96,
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
    TIMESTAMP '2025-12-26 20:52:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    72,
    'ZAM-20260126-419330',
    TIMESTAMP '2026-01-08 09:05:51',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    799.98,
    799.98,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 12:05:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-10 09:05:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    73,
    'ZAM-20260126-907755',
    TIMESTAMP '2026-01-09 05:47:51',
    'PROCESSING',
    'PENDING',
    'BLIK',
    'LOCKER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    1074.94,
    1087.93,
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
    TIMESTAMP '2026-01-10 14:47:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    74,
    'ZAM-20260126-638596',
    TIMESTAMP '2025-11-29 22:11:51',
    'PACKED',
    'PENDING',
    'CARD',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    689.92,
    639.65,
    18.5,
    68.77,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-30 14:11:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    75,
    'ZAM-20260126-111071',
    TIMESTAMP '2026-01-03 21:57:51',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 52/47',
    'Częstochowa',
    '18-556',
    'Poland',
    'ul. Łąkowa 52/47',
    'Częstochowa',
    '18-556',
    'Poland',
    351.67,
    351.67,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL37885938',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 14:57:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    76,
    'ZAM-20260126-249628',
    TIMESTAMP '2025-12-22 15:01:51',
    'DELIVERED',
    'PAID',
    'BLIK',
    'LOCKER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    507.92,
    520.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL68318467',
    NULL,
    NULL,
    TIMESTAMP '2025-12-27 15:01:51',
    TIMESTAMP '2025-12-23 22:01:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    77,
    'ZAM-20260126-550154',
    TIMESTAMP '2026-01-09 03:53:51',
    'PENDING',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 82/16',
    'Szczecin',
    '67-191',
    'Poland',
    'ul. Rynek 82/16',
    'Szczecin',
    '67-191',
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
    TIMESTAMP '2026-01-10 18:53:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    78,
    'ZAM-20260126-894994',
    TIMESTAMP '2025-12-09 04:01:51',
    'PACKED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    'ul. Kościelna 88/50',
    'Radom',
    '94-148',
    'Poland',
    1580.91,
    1593.9,
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
    TIMESTAMP '2025-12-10 08:01:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    79,
    'ZAM-20260126-453319',
    TIMESTAMP '2025-12-05 04:16:51',
    'PROCESSING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    'ul. Ogrodowa 80/45',
    'Lublin',
    '87-980',
    'Poland',
    560.7,
    579.2,
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
    TIMESTAMP '2025-12-05 23:16:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    80,
    'ZAM-20260126-436997',
    TIMESTAMP '2026-01-13 00:57:51',
    'PENDING',
    'PENDING',
    'CARD',
    'LOCKER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    533.9,
    546.89,
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
    TIMESTAMP '2026-01-14 19:57:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    81,
    'ZAM-20260126-215113',
    TIMESTAMP '2025-12-08 12:22:51',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    30,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 54/25',
    'Radom',
    '24-860',
    'Poland',
    'ul. Piaskowa 54/25',
    'Radom',
    '24-860',
    'Poland',
    819.95,
    785.89,
    12.99,
    47.05,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL61234018',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-09 19:22:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    82,
    'ZAM-20260126-694160',
    TIMESTAMP '2025-12-16 06:41:51',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    1273.93,
    1286.92,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-16 10:41:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-17 12:41:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    83,
    'ZAM-20260126-110563',
    TIMESTAMP '2025-12-03 02:08:51',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Leśna 3/41',
    'Bydgoszcz',
    '95-847',
    'Poland',
    'ul. Leśna 3/41',
    'Bydgoszcz',
    '95-847',
    'Poland',
    342.44,
    360.94,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL25862667',
    NULL,
    NULL,
    TIMESTAMP '2025-12-05 02:08:51',
    TIMESTAMP '2025-12-03 14:08:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    84,
    'ZAM-20260126-681028',
    TIMESTAMP '2026-01-13 20:10:51',
    'PACKED',
    'FAILED',
    'BLIK',
    'LOCKER',
    44,
    NULL,
    NULL,
    NULL,
    'ul. Główna 147/16',
    'Białystok',
    '11-763',
    'Poland',
    'ul. Główna 147/16',
    'Białystok',
    '11-763',
    'Poland',
    1884.76,
    1897.75,
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
    TIMESTAMP '2026-01-14 03:10:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    85,
    'ZAM-20260126-095097',
    TIMESTAMP '2025-12-08 23:38:51',
    'PACKED',
    'PAID',
    'BLIK',
    'LOCKER',
    39,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 126/7',
    'Częstochowa',
    '35-588',
    'Poland',
    'ul. Brzozowa 126/7',
    'Częstochowa',
    '35-588',
    'Poland',
    460.42,
    473.41,
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
    TIMESTAMP '2025-12-10 01:38:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    86,
    'ZAM-20260126-827029',
    TIMESTAMP '2026-01-06 18:47:51',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Sportowa 95/3',
    'Wrocław',
    '52-419',
    'Poland',
    'ul. Sportowa 95/3',
    'Wrocław',
    '52-419',
    'Poland',
    1229.92,
    1126.35,
    12.99,
    116.56,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL36473050',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 06:47:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    87,
    'ZAM-20260126-270133',
    TIMESTAMP '2025-12-29 15:27:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    1247.95,
    1260.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL72337947',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 06:27:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    88,
    'ZAM-20260126-876482',
    TIMESTAMP '2026-01-05 00:06:51',
    'PROCESSING',
    'FAILED',
    'BLIK',
    'COURIER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 34/27',
    'Toruń',
    '11-734',
    'Poland',
    'ul. Piaskowa 34/27',
    'Toruń',
    '11-734',
    'Poland',
    115.27,
    133.77,
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
    TIMESTAMP '2026-01-06 13:06:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    89,
    'ZAM-20260126-566537',
    TIMESTAMP '2025-12-22 10:45:51',
    'SHIPPED',
    'PAID',
    'CARD',
    'LOCKER',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 27/25',
    'Zabrze',
    '98-468',
    'Poland',
    'ul. Kwiatowa 27/25',
    'Zabrze',
    '98-468',
    'Poland',
    1418.92,
    1431.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL89819440',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 00:45:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    90,
    'ZAM-20260126-650842',
    TIMESTAMP '2025-11-28 07:13:51',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    12,
    NULL,
    NULL,
    NULL,
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    'ul. Polna 118/28',
    'Gdynia',
    '93-351',
    'Poland',
    715.52,
    715.52,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL89781842',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-28 10:13:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    91,
    'ZAM-20260126-984891',
    TIMESTAMP '2025-12-06 00:09:51',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    447.45,
    460.44,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL21749118',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-06 07:09:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    92,
    'ZAM-20260126-908664',
    TIMESTAMP '2026-01-07 16:50:51',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 52/47',
    'Częstochowa',
    '18-556',
    'Poland',
    'ul. Łąkowa 52/47',
    'Częstochowa',
    '18-556',
    'Poland',
    745.92,
    637.9,
    0.0,
    108.02,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL96990354',
    NULL,
    NULL,
    TIMESTAMP '2026-01-13 16:50:51',
    TIMESTAMP '2026-01-08 13:50:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    93,
    'ZAM-20260126-750025',
    TIMESTAMP '2025-12-03 07:54:51',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    'ul. Kolejowa 72/28',
    'Rzeszów',
    '56-688',
    'Poland',
    47.99,
    58.14,
    12.99,
    2.84,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 11:54:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-04 17:54:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    94,
    'ZAM-20260126-840229',
    TIMESTAMP '2026-01-08 09:52:51',
    'PROCESSING',
    'PAID',
    'BLIK',
    'COURIER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 82/16',
    'Szczecin',
    '67-191',
    'Poland',
    'ul. Rynek 82/16',
    'Szczecin',
    '67-191',
    'Poland',
    837.95,
    856.45,
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
    TIMESTAMP '2026-01-08 16:52:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    95,
    'ZAM-20260126-303758',
    TIMESTAMP '2026-01-09 01:49:51',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 144/11',
    'Kraków',
    '37-604',
    'Poland',
    'ul. Zielona 144/11',
    'Kraków',
    '37-604',
    'Poland',
    699.91,
    712.9,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL84099766',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-09 11:49:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    96,
    'ZAM-20260126-507014',
    TIMESTAMP '2025-12-19 03:25:51',
    'PROCESSING',
    'FAILED',
    'CARD',
    'PICKUP',
    34,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    'ul. Ogrodowa 143/14',
    'Szczecin',
    '28-538',
    'Poland',
    1215.93,
    1215.93,
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
    TIMESTAMP '2025-12-20 14:25:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    97,
    'ZAM-20260126-676277',
    TIMESTAMP '2025-12-04 04:00:51',
    'PACKED',
    'PENDING',
    'BLIK',
    'PICKUP',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 34/27',
    'Wrocław',
    '94-380',
    'Poland',
    'ul. Wodna 34/27',
    'Wrocław',
    '94-380',
    'Poland',
    252.96,
    234.81,
    0.0,
    18.15,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 16:00:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    98,
    'ZAM-20260126-985712',
    TIMESTAMP '2025-12-22 19:19:51',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    'ul. Lipowa 1/13',
    'Zabrze',
    '45-188',
    'Poland',
    59.96,
    59.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL71859306',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 06:19:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    99,
    'ZAM-20260126-708723',
    TIMESTAMP '2026-01-13 12:11:51',
    'PACKED',
    'FAILED',
    'TRANSFER',
    'COURIER',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 6/4',
    'Gdańsk',
    '50-372',
    'Poland',
    'ul. Brzozowa 6/4',
    'Gdańsk',
    '50-372',
    'Poland',
    399.93,
    418.43,
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
    TIMESTAMP '2026-01-13 17:11:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    100,
    'ZAM-20260126-244506',
    TIMESTAMP '2025-12-22 05:23:51',
    'CONFIRMED',
    'FAILED',
    'TRANSFER',
    'COURIER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    339.92,
    358.42,
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
    TIMESTAMP '2025-12-23 15:23:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    101,
    'ZAM-20260126-700662',
    TIMESTAMP '2025-12-01 17:38:51',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 54/5',
    'Kielce',
    '96-331',
    'Poland',
    'ul. Kwiatowa 54/5',
    'Kielce',
    '96-331',
    'Poland',
    381.43,
    363.98,
    18.5,
    35.95,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 02:38:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-03 12:38:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    102,
    'ZAM-20260126-696463',
    TIMESTAMP '2026-01-11 21:29:51',
    'PACKED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    'ul. Brzozowa 139/9',
    'Lublin',
    '61-532',
    'Poland',
    176.95,
    189.94,
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
    TIMESTAMP '2026-01-12 06:29:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    103,
    'ZAM-20260126-514127',
    TIMESTAMP '2026-01-18 12:05:51',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    32,
    NULL,
    NULL,
    NULL,
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    'ul. Główna 41/34',
    'Wrocław',
    '68-596',
    'Poland',
    209.97,
    228.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL30406219',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 11:05:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    104,
    'ZAM-20260126-131672',
    TIMESTAMP '2025-12-29 11:42:51',
    'PACKED',
    'PAID',
    'CARD',
    'COURIER',
    41,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 107/11',
    'Kraków',
    '72-652',
    'Poland',
    'ul. Ogrodowa 107/11',
    'Kraków',
    '72-652',
    'Poland',
    449.89,
    468.39,
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
    TIMESTAMP '2025-12-31 07:42:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    105,
    'ZAM-20260126-876218',
    TIMESTAMP '2025-12-20 07:20:51',
    'PENDING',
    'FAILED',
    'TRANSFER',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 54/5',
    'Kielce',
    '96-331',
    'Poland',
    'ul. Kwiatowa 54/5',
    'Kielce',
    '96-331',
    'Poland',
    428.93,
    441.92,
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
    TIMESTAMP '2025-12-20 15:20:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    106,
    'ZAM-20260126-587795',
    TIMESTAMP '2025-12-07 01:24:51',
    'PROCESSING',
    'FAILED',
    'BLIK',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    'ul. Szkolna 126/34',
    'Toruń',
    '52-110',
    'Poland',
    319.99,
    319.99,
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
    TIMESTAMP '2025-12-07 09:24:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    107,
    'ZAM-20260126-833018',
    TIMESTAMP '2025-12-11 11:01:51',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    'ul. Słoneczna 125/40',
    'Gdynia',
    '20-959',
    'Poland',
    229.92,
    229.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-12 06:01:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-12 02:01:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    108,
    'ZAM-20260126-549341',
    TIMESTAMP '2025-11-27 07:08:51',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'PICKUP',
    39,
    NULL,
    NULL,
    NULL,
    'ul. Brzozowa 126/7',
    'Częstochowa',
    '35-588',
    'Poland',
    'ul. Brzozowa 126/7',
    'Częstochowa',
    '35-588',
    'Poland',
    464.94,
    464.94,
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
    TIMESTAMP '2025-11-28 23:08:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    109,
    'ZAM-20260126-698865',
    TIMESTAMP '2026-01-18 10:45:51',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'COURIER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    'ul. Ogrodowa 8/2',
    'Kielce',
    '16-616',
    'Poland',
    844.95,
    863.45,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-18 23:45:51',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-19 06:45:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    110,
    'ZAM-20260126-152199',
    TIMESTAMP '2025-11-27 13:53:51',
    'PROCESSING',
    'PENDING',
    'BLIK',
    'LOCKER',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    309.94,
    322.93,
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
    TIMESTAMP '2025-11-29 12:53:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    111,
    'ZAM-20260126-918888',
    TIMESTAMP '2026-01-13 19:03:51',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'LOCKER',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 52/34',
    'Bydgoszcz',
    '23-655',
    'Poland',
    'ul. Kwiatowa 52/34',
    'Bydgoszcz',
    '23-655',
    'Poland',
    450.43,
    463.42,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL46192644',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-15 00:03:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    112,
    'ZAM-20260126-426042',
    TIMESTAMP '2026-01-18 13:41:51',
    'PENDING',
    'PAID',
    'TRANSFER',
    'PICKUP',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    'ul. Kwiatowa 132/38',
    'Gliwice',
    '53-467',
    'Poland',
    1009.9,
    884.54,
    0.0,
    125.36,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 07:41:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    113,
    'ZAM-20260126-737764',
    TIMESTAMP '2025-12-18 05:46:51',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Kwiatowa 27/25',
    'Zabrze',
    '98-468',
    'Poland',
    'ul. Kwiatowa 27/25',
    'Zabrze',
    '98-468',
    'Poland',
    163.92,
    176.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL64942802',
    NULL,
    NULL,
    TIMESTAMP '2025-12-22 05:46:51',
    TIMESTAMP '2025-12-18 06:46:51'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    114,
    'ZAM-20260126-928337',
    TIMESTAMP '2025-12-01 16:35:51',
    'PENDING',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    'ul. Parkowa 102/28',
    'Poznań',
    '80-622',
    'Poland',
    15.98,
    28.97,
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
    TIMESTAMP '2025-12-03 04:35:51'
);

-- Insert order items
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    1,
    48,
    3,
    7.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    2,
    68,
    2,
    79.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    3,
    38,
    3,
    17.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    4,
    17,
    3,
    34.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    5,
    7,
    2,
    6.29,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    6,
    31,
    2,
    89.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    7,
    30,
    2,
    47.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    8,
    68,
    2,
    79.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    9,
    30,
    1,
    47.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    10,
    32,
    2,
    29.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    11,
    26,
    2,
    12.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    12,
    41,
    1,
    27.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    13,
    8,
    2,
    24.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    14,
    29,
    2,
    67.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    15,
    68,
    3,
    79.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    16,
    30,
    3,
    47.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    17,
    46,
    2,
    24.99,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    18,
    31,
    2,
    89.99,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    19,
    11,
    1,
    49.99,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    20,
    13,
    3,
    127.49,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    21,
    4,
    1,
    319.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    22,
    51,
    1,
    19.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    23,
    28,
    1,
    44.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    24,
    65,
    2,
    34.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    25,
    60,
    3,
    49.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    26,
    67,
    1,
    80.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    27,
    28,
    3,
    44.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    28,
    61,
    3,
    44.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    29,
    48,
    3,
    7.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    30,
    68,
    3,
    79.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    31,
    20,
    2,
    89.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    32,
    9,
    2,
    59.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    33,
    36,
    2,
    39.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    34,
    4,
    3,
    319.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    35,
    43,
    2,
    14.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    36,
    30,
    2,
    47.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    37,
    40,
    2,
    29.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    38,
    7,
    3,
    6.29,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    39,
    69,
    3,
    44.99,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    40,
    9,
    1,
    59.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    41,
    43,
    3,
    14.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    42,
    20,
    2,
    89.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    43,
    17,
    1,
    34.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    44,
    70,
    1,
    49.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    45,
    30,
    3,
    47.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    46,
    5,
    3,
    299.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    47,
    40,
    2,
    29.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    48,
    60,
    1,
    49.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    49,
    25,
    3,
    8.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    50,
    28,
    1,
    44.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    51,
    37,
    1,
    21.59,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    52,
    28,
    1,
    44.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    53,
    33,
    2,
    49.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    54,
    8,
    3,
    24.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    55,
    56,
    2,
    29.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    56,
    42,
    3,
    249.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    57,
    18,
    3,
    189.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    58,
    37,
    1,
    21.59,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    59,
    59,
    3,
    399.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    60,
    70,
    2,
    49.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    61,
    64,
    1,
    39.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    62,
    50,
    1,
    349.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    63,
    35,
    3,
    22.49,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    64,
    29,
    2,
    67.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    65,
    17,
    1,
    34.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    66,
    16,
    1,
    89.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    67,
    52,
    3,
    12.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    68,
    68,
    2,
    79.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    69,
    65,
    1,
    34.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    70,
    57,
    1,
    104.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    71,
    4,
    1,
    319.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    72,
    18,
    3,
    189.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    73,
    21,
    3,
    269.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    74,
    44,
    3,
    19.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    75,
    33,
    2,
    49.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    76,
    26,
    1,
    12.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    77,
    49,
    3,
    14.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    78,
    30,
    1,
    47.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    79,
    40,
    3,
    29.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    80,
    69,
    3,
    44.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    81,
    37,
    3,
    21.59,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    82,
    20,
    1,
    89.99,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    83,
    68,
    3,
    79.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    84,
    53,
    2,
    79.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    85,
    14,
    2,
    39.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    86,
    57,
    1,
    104.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    87,
    45,
    1,
    29.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    88,
    10,
    3,
    11.24,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    89,
    56,
    3,
    29.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    90,
    4,
    1,
    319.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    91,
    71,
    2,
    35.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    92,
    17,
    2,
    34.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    93,
    30,
    2,
    47.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    94,
    10,
    1,
    11.24,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    95,
    34,
    3,
    99.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    96,
    56,
    3,
    29.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    97,
    17,
    1,
    34.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    98,
    12,
    2,
    129.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    99,
    26,
    1,
    12.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    100,
    14,
    1,
    39.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    101,
    63,
    3,
    49.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    102,
    36,
    1,
    39.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    103,
    58,
    1,
    129.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    104,
    3,
    2,
    251.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    105,
    19,
    3,
    249.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    106,
    57,
    2,
    104.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    107,
    46,
    1,
    24.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    108,
    33,
    3,
    49.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    109,
    55,
    1,
    44.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    110,
    50,
    1,
    349.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    111,
    70,
    1,
    49.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    112,
    13,
    2,
    127.49,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    113,
    48,
    3,
    7.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    114,
    57,
    3,
    104.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    115,
    9,
    2,
    59.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    116,
    8,
    2,
    24.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    117,
    43,
    2,
    14.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    118,
    5,
    1,
    299.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    119,
    12,
    3,
    129.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    120,
    17,
    2,
    34.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    121,
    40,
    2,
    29.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    122,
    53,
    3,
    79.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    123,
    35,
    3,
    22.49,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    124,
    7,
    3,
    6.29,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    125,
    4,
    3,
    319.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    126,
    45,
    2,
    29.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    127,
    15,
    1,
    79.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    128,
    46,
    1,
    24.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    129,
    31,
    1,
    89.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    130,
    29,
    3,
    67.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    131,
    7,
    2,
    6.29,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    132,
    35,
    2,
    22.49,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    133,
    17,
    2,
    34.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    134,
    59,
    3,
    399.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    135,
    36,
    2,
    39.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    136,
    17,
    3,
    34.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    137,
    67,
    2,
    80.99,
    44
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    138,
    65,
    3,
    34.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    139,
    6,
    2,
    4.49,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    140,
    59,
    2,
    399.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    141,
    37,
    1,
    21.59,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    142,
    55,
    3,
    44.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    143,
    65,
    2,
    34.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    144,
    43,
    3,
    14.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    145,
    67,
    3,
    80.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    146,
    67,
    3,
    80.99,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    147,
    70,
    3,
    49.99,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    148,
    61,
    3,
    44.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    149,
    67,
    3,
    80.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    150,
    32,
    3,
    29.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    151,
    24,
    3,
    4.49,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    152,
    44,
    1,
    19.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    153,
    35,
    2,
    22.49,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    154,
    31,
    1,
    89.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    155,
    20,
    1,
    89.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    156,
    49,
    2,
    14.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    157,
    23,
    2,
    32.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    158,
    32,
    1,
    29.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    159,
    62,
    3,
    69.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    160,
    38,
    3,
    17.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    161,
    65,
    3,
    34.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    162,
    48,
    3,
    7.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    163,
    57,
    1,
    104.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    164,
    20,
    2,
    89.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    165,
    35,
    3,
    22.49,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    166,
    18,
    1,
    189.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    167,
    66,
    1,
    599.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    168,
    18,
    1,
    189.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    169,
    9,
    2,
    59.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    170,
    66,
    1,
    599.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    171,
    69,
    1,
    44.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    172,
    38,
    1,
    17.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    173,
    12,
    3,
    129.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    174,
    40,
    2,
    29.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    175,
    70,
    3,
    49.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    176,
    28,
    2,
    44.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    177,
    51,
    1,
    19.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    178,
    14,
    3,
    39.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    179,
    50,
    2,
    349.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    180,
    27,
    1,
    15.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    181,
    21,
    3,
    269.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    182,
    4,
    3,
    319.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    183,
    6,
    1,
    4.49,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    184,
    30,
    3,
    47.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    185,
    12,
    3,
    129.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    186,
    22,
    1,
    229.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    187,
    71,
    2,
    35.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    188,
    67,
    3,
    80.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    189,
    10,
    3,
    11.24,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    190,
    32,
    1,
    29.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    191,
    5,
    1,
    299.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    192,
    71,
    3,
    35.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    193,
    38,
    3,
    17.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    194,
    34,
    2,
    99.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    195,
    13,
    1,
    127.49,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    196,
    15,
    3,
    79.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    197,
    9,
    3,
    59.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    198,
    17,
    3,
    34.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    199,
    49,
    2,
    14.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    200,
    16,
    2,
    89.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    201,
    41,
    1,
    27.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    202,
    61,
    1,
    44.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    203,
    18,
    1,
    189.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    204,
    26,
    3,
    12.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    205,
    19,
    1,
    249.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    206,
    3,
    1,
    251.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    207,
    68,
    2,
    79.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    208,
    43,
    3,
    14.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    209,
    32,
    1,
    29.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    210,
    41,
    2,
    27.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    211,
    50,
    3,
    349.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    212,
    28,
    1,
    44.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    213,
    64,
    1,
    39.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    214,
    43,
    3,
    14.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    215,
    66,
    1,
    599.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    216,
    49,
    1,
    14.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    217,
    2,
    3,
    149.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    218,
    38,
    1,
    17.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    219,
    11,
    1,
    49.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    220,
    35,
    3,
    22.49,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    221,
    42,
    2,
    249.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    222,
    44,
    1,
    19.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    223,
    13,
    1,
    127.49,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    224,
    23,
    2,
    32.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    225,
    70,
    1,
    49.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    226,
    42,
    1,
    249.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    227,
    4,
    3,
    319.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    228,
    57,
    1,
    104.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    229,
    59,
    2,
    399.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    230,
    58,
    3,
    129.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    231,
    55,
    1,
    44.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    232,
    4,
    2,
    319.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    233,
    12,
    3,
    129.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    234,
    29,
    3,
    67.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    235,
    30,
    2,
    47.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    236,
    41,
    1,
    27.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    237,
    10,
    3,
    11.24,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    238,
    16,
    3,
    89.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    239,
    51,
    1,
    19.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    240,
    30,
    1,
    47.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    241,
    32,
    2,
    29.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    242,
    15,
    2,
    79.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    243,
    53,
    3,
    79.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    244,
    61,
    2,
    44.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    245,
    16,
    1,
    89.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    246,
    54,
    1,
    39.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    247,
    67,
    3,
    80.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    248,
    48,
    1,
    7.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    249,
    59,
    3,
    399.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    250,
    7,
    1,
    6.29,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    251,
    23,
    1,
    32.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    252,
    13,
    3,
    127.49,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    253,
    11,
    2,
    49.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    254,
    26,
    3,
    12.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    255,
    35,
    2,
    22.49,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    256,
    34,
    2,
    99.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    257,
    53,
    2,
    79.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    258,
    25,
    1,
    8.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    259,
    54,
    3,
    39.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    260,
    46,
    1,
    24.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    261,
    42,
    3,
    249.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    262,
    61,
    1,
    44.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    263,
    66,
    2,
    599.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    264,
    65,
    1,
    34.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    265,
    25,
    1,
    8.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    266,
    39,
    3,
    9.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    267,
    63,
    2,
    49.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    268,
    46,
    1,
    24.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    269,
    13,
    1,
    127.49,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    270,
    55,
    2,
    44.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    271,
    31,
    3,
    89.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    272,
    3,
    3,
    251.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    273,
    61,
    2,
    44.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    274,
    42,
    3,
    249.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    275,
    7,
    3,
    6.29,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    276,
    34,
    3,
    99.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    277,
    38,
    1,
    17.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    278,
    24,
    1,
    4.49,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    279,
    55,
    2,
    44.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    280,
    30,
    1,
    47.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    281,
    70,
    3,
    49.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    282,
    4,
    3,
    319.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    283,
    9,
    2,
    59.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    284,
    66,
    2,
    599.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    285,
    27,
    3,
    15.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    286,
    67,
    1,
    80.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    287,
    7,
    1,
    6.29,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    288,
    41,
    1,
    27.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    289,
    26,
    3,
    12.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    290,
    59,
    3,
    399.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    291,
    20,
    2,
    89.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    292,
    28,
    3,
    44.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    293,
    19,
    2,
    249.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    294,
    29,
    1,
    67.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    295,
    7,
    2,
    6.29,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    296,
    12,
    1,
    129.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    297,
    13,
    1,
    127.49,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    298,
    28,
    2,
    44.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    299,
    34,
    1,
    99.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    300,
    21,
    2,
    269.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    301,
    54,
    2,
    39.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    302,
    67,
    1,
    80.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    303,
    43,
    3,
    14.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    304,
    30,
    1,
    47.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    305,
    21,
    3,
    269.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    306,
    48,
    1,
    7.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    307,
    51,
    1,
    19.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    308,
    64,
    3,
    39.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    309,
    54,
    1,
    39.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    310,
    18,
    1,
    189.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    311,
    28,
    2,
    44.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    312,
    58,
    2,
    129.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    313,
    23,
    2,
    32.99,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    314,
    1,
    2,
    289.99,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    315,
    18,
    3,
    189.99,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    316,
    26,
    1,
    12.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    317,
    53,
    3,
    79.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    318,
    49,
    3,
    14.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    319,
    43,
    1,
    14.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    320,
    46,
    3,
    24.99,
    99
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    321,
    8,
    3,
    24.99,
    99
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    322,
    19,
    1,
    249.99,
    99
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    323,
    55,
    3,
    44.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    324,
    62,
    1,
    69.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    325,
    45,
    2,
    29.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    326,
    47,
    2,
    37.49,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    327,
    24,
    2,
    4.49,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    328,
    58,
    2,
    129.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    329,
    47,
    3,
    37.49,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    330,
    57,
    1,
    104.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    331,
    27,
    2,
    15.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    332,
    44,
    2,
    19.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    333,
    16,
    2,
    89.99,
    103
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    334,
    32,
    1,
    29.99,
    103
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    335,
    45,
    1,
    29.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    336,
    32,
    2,
    29.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    337,
    36,
    3,
    39.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    338,
    57,
    2,
    104.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    339,
    39,
    3,
    9.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    340,
    6,
    2,
    4.49,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    341,
    15,
    3,
    79.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    342,
    16,
    2,
    89.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    343,
    4,
    1,
    319.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    344,
    43,
    3,
    14.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    345,
    65,
    3,
    34.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    346,
    54,
    2,
    39.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    347,
    5,
    1,
    299.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    348,
    16,
    1,
    89.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    349,
    43,
    2,
    14.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    350,
    35,
    2,
    22.49,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    351,
    18,
    1,
    189.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    352,
    1,
    2,
    289.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    353,
    47,
    2,
    37.49,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    354,
    64,
    2,
    39.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    355,
    68,
    1,
    79.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    356,
    60,
    3,
    49.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    357,
    21,
    1,
    269.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    358,
    41,
    2,
    27.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    359,
    64,
    1,
    39.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    360,
    24,
    1,
    4.49,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    361,
    14,
    2,
    39.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    362,
    42,
    3,
    249.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    363,
    51,
    1,
    19.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    364,
    11,
    3,
    49.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    365,
    56,
    3,
    29.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    366,
    54,
    2,
    39.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    367,
    49,
    3,
    14.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    368,
    26,
    3,
    12.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    369,
    48,
    2,
    7.99,
    114
);

-- Insert reviews
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    1,
    26,
    35,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-10 13:22:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    2,
    8,
    17,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-17 11:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    3,
    1,
    14,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-15 02:51:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    4,
    48,
    9,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-12 17:34:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    5,
    51,
    18,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-05 13:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    6,
    27,
    27,
    'PENDING',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-27 09:23:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    7,
    1,
    28,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-16 01:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    8,
    27,
    50,
    'PENDING',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-14 22:16:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    9,
    12,
    27,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-02 06:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    10,
    10,
    20,
    'REJECTED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-02 12:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    11,
    52,
    11,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-09 16:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    12,
    52,
    48,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-12 14:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    13,
    68,
    47,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-15 22:32:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    14,
    28,
    23,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-24 01:15:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    15,
    69,
    49,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-02 08:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    16,
    50,
    47,
    'PENDING',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-13 20:05:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    17,
    6,
    6,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-28 21:21:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    18,
    30,
    25,
    'PENDING',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-17 17:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    19,
    29,
    22,
    'PENDING',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-23 14:37:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    20,
    40,
    19,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-21 21:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    21,
    8,
    31,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-11 17:13:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    22,
    23,
    9,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-19 18:21:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    23,
    31,
    22,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-03 21:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    24,
    24,
    31,
    'PENDING',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-22 13:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    25,
    27,
    8,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-21 00:52:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    26,
    56,
    25,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-23 11:56:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    27,
    44,
    37,
    'APPROVED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-08 23:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    28,
    16,
    8,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-02 23:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    29,
    50,
    15,
    'REJECTED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-08 00:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    30,
    2,
    39,
    'REJECTED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-15 17:37:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    31,
    28,
    50,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-26 21:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    32,
    53,
    38,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-23 09:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    33,
    33,
    20,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-21 23:18:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    34,
    42,
    25,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-02 23:25:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    35,
    40,
    36,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-03 06:23:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    36,
    22,
    7,
    'REJECTED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-24 21:24:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    37,
    16,
    6,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-29 13:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    38,
    58,
    27,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-21 08:03:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    39,
    33,
    6,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-14 13:07:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    40,
    54,
    24,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-12 22:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    41,
    64,
    51,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-07 06:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    42,
    54,
    30,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-04 23:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    43,
    58,
    20,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-06 00:00:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    44,
    46,
    37,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-09 05:57:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    45,
    46,
    49,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-11 18:51:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    46,
    47,
    24,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-17 05:39:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    47,
    62,
    30,
    'PENDING',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-18 05:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    48,
    9,
    41,
    'PENDING',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-01 10:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    49,
    29,
    47,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-02 16:36:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    50,
    34,
    20,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-23 16:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    51,
    33,
    26,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-17 17:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    52,
    13,
    33,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-15 23:12:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    53,
    60,
    31,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-27 07:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    54,
    36,
    49,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-11-29 09:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    55,
    1,
    33,
    'REJECTED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-14 07:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    56,
    14,
    45,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-03 19:15:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    57,
    59,
    44,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-30 17:54:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    58,
    11,
    50,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-28 18:11:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    59,
    7,
    43,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-17 10:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    60,
    8,
    21,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-05 09:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    61,
    62,
    38,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-11-28 20:51:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    62,
    37,
    49,
    'REJECTED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-21 22:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    63,
    31,
    33,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-26 07:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    64,
    58,
    9,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-12 12:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    65,
    62,
    26,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-28 12:51:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    66,
    47,
    34,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-22 10:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    67,
    9,
    33,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-21 15:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    68,
    55,
    6,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-09 20:00:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    69,
    11,
    6,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-11-29 10:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    70,
    40,
    20,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-11 09:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    71,
    39,
    4,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-25 09:52:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    72,
    54,
    44,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-08 08:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    73,
    55,
    32,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-16 04:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    74,
    61,
    12,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-04 13:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    75,
    28,
    19,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-18 12:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    76,
    70,
    18,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-18 20:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    77,
    70,
    37,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-14 15:03:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    78,
    5,
    9,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-27 02:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    79,
    70,
    5,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-25 08:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    80,
    12,
    27,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-13 01:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    81,
    52,
    31,
    'PENDING',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-27 13:38:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    82,
    67,
    21,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-11-28 14:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    83,
    39,
    10,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-04 10:18:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    84,
    32,
    36,
    'REJECTED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-24 04:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    85,
    39,
    34,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-20 03:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    86,
    36,
    25,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-14 19:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    87,
    11,
    50,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-12 07:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    88,
    59,
    14,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-22 15:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    89,
    36,
    41,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-22 11:07:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    90,
    64,
    30,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-10 04:54:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    91,
    31,
    41,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-31 19:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    92,
    14,
    18,
    'REJECTED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-17 05:54:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    93,
    32,
    14,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-01 02:03:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    94,
    38,
    27,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-05 07:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    95,
    4,
    25,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-19 12:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    96,
    30,
    28,
    'REJECTED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-16 19:00:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    97,
    40,
    8,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-31 16:29:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    98,
    31,
    28,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-15 16:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    99,
    10,
    2,
    'REJECTED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-21 06:47:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    100,
    32,
    13,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-09 17:52:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    101,
    67,
    37,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-21 13:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    102,
    44,
    17,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-26 16:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    103,
    15,
    30,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-15 13:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    104,
    25,
    7,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-28 01:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    105,
    12,
    32,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-16 09:33:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    106,
    1,
    22,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-02 19:19:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    107,
    10,
    50,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-16 07:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    108,
    3,
    30,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-21 11:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    109,
    8,
    27,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-07 23:32:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    110,
    22,
    6,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-28 11:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    111,
    48,
    40,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-14 22:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    112,
    3,
    39,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-08 22:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    113,
    65,
    26,
    'PENDING',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-21 15:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    114,
    16,
    20,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-22 05:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    115,
    71,
    35,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-11 17:21:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    116,
    67,
    46,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-10 09:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    117,
    8,
    34,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-12 00:35:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    118,
    17,
    51,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-19 04:00:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    119,
    61,
    18,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-30 20:04:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    120,
    55,
    23,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-18 19:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    121,
    4,
    27,
    'REJECTED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-23 19:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    122,
    5,
    46,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-08 19:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    123,
    61,
    6,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-04 19:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    124,
    56,
    36,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-11-27 05:13:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    125,
    53,
    31,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-10 17:01:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    126,
    24,
    22,
    'REJECTED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-17 07:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    127,
    42,
    27,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-21 08:49:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    128,
    44,
    38,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-19 16:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    129,
    69,
    34,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-09 01:24:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    130,
    26,
    14,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-11 11:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    131,
    41,
    37,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-08 04:01:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    132,
    44,
    23,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-29 18:23:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    133,
    26,
    2,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-11 19:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    134,
    25,
    30,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-25 12:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    135,
    57,
    4,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-06 13:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    136,
    57,
    3,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-30 08:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    137,
    55,
    2,
    'PENDING',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-03 16:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    138,
    49,
    27,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-04 21:10:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    139,
    7,
    8,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-26 14:48:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    140,
    13,
    14,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-11-27 22:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    141,
    61,
    39,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-06 17:54:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    142,
    9,
    43,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-15 10:17:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    143,
    34,
    51,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-20 00:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    144,
    44,
    25,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-27 01:34:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    145,
    19,
    41,
    'APPROVED',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-23 06:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    146,
    64,
    41,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-24 09:49:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    147,
    30,
    28,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-04 13:34:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    148,
    61,
    12,
    'PENDING',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-27 06:57:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    149,
    18,
    26,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-02 09:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    150,
    17,
    47,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-01 12:10:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    151,
    24,
    16,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-04 04:29:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    152,
    20,
    9,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-21 18:25:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    153,
    16,
    41,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-21 11:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    154,
    45,
    31,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-11 01:51:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    155,
    46,
    12,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-25 18:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    156,
    37,
    23,
    'PENDING',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-16 10:42:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    157,
    8,
    50,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-01 09:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    158,
    31,
    40,
    'REJECTED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-24 16:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    159,
    70,
    13,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-11 10:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    160,
    20,
    38,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-06 22:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    161,
    20,
    18,
    'PENDING',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-20 12:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    162,
    58,
    7,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-16 08:37:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    163,
    42,
    18,
    'PENDING',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-03 11:23:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    164,
    6,
    13,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-23 05:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    165,
    41,
    41,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-06 06:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    166,
    24,
    20,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-23 07:36:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    167,
    17,
    22,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-01 06:39:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    168,
    67,
    16,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-21 02:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    169,
    37,
    42,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-11 02:30:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    170,
    49,
    9,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-24 23:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    171,
    12,
    14,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-07 15:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    172,
    35,
    6,
    'REJECTED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-17 23:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    173,
    63,
    31,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-29 02:23:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    174,
    13,
    16,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-25 18:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    175,
    47,
    20,
    'PENDING',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-20 18:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    176,
    9,
    26,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-09 18:24:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    177,
    15,
    12,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-10 23:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    178,
    33,
    40,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-07 04:57:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    179,
    11,
    16,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-03 09:30:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    180,
    48,
    7,
    'PENDING',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-11-30 22:34:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    181,
    16,
    44,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-13 14:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    182,
    2,
    32,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-21 00:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    183,
    28,
    7,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-05 05:05:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    184,
    16,
    36,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-22 23:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    185,
    62,
    44,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-07 23:16:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    186,
    20,
    18,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-22 11:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    187,
    28,
    36,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-26 19:42:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    188,
    50,
    44,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-04 08:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    189,
    1,
    27,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-04 12:45:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    190,
    55,
    10,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-26 15:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    191,
    43,
    15,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-14 10:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    192,
    33,
    28,
    'PENDING',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-19 23:38:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    193,
    28,
    7,
    'REJECTED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-05 11:56:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    194,
    57,
    21,
    'PENDING',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-24 00:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    195,
    65,
    19,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-27 16:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    196,
    52,
    51,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-16 18:11:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    197,
    11,
    47,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-31 03:42:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    198,
    35,
    10,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-23 08:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    199,
    65,
    31,
    'PENDING',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-03 04:35:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    200,
    6,
    6,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-17 05:37:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    201,
    36,
    17,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-14 11:33:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    202,
    32,
    38,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-06 07:22:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    203,
    43,
    45,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-09 10:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    204,
    33,
    33,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-12 23:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    205,
    60,
    15,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-24 16:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    206,
    34,
    37,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-02 23:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    207,
    54,
    27,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-25 07:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    208,
    19,
    7,
    'PENDING',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-19 11:36:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    209,
    45,
    20,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-14 08:49:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    210,
    38,
    51,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-02 02:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    211,
    62,
    6,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-22 10:22:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    212,
    31,
    50,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-22 08:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    213,
    34,
    8,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-16 14:17:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    214,
    26,
    31,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-06 21:25:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    215,
    36,
    25,
    'PENDING',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-23 09:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    216,
    8,
    24,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-02 23:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    217,
    14,
    7,
    'PENDING',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-01 19:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    218,
    19,
    43,
    'APPROVED',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-14 09:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    219,
    62,
    44,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-17 16:05:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    220,
    9,
    42,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-29 18:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    221,
    1,
    19,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-09 16:37:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    222,
    5,
    16,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-22 04:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    223,
    62,
    35,
    'PENDING',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-06 17:17:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    224,
    8,
    23,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-03 08:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    225,
    24,
    41,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-07 15:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    226,
    50,
    46,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-11-30 21:03:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    227,
    35,
    37,
    'REJECTED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-16 15:38:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    228,
    44,
    11,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-24 23:44:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    229,
    59,
    19,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-03 14:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    230,
    27,
    24,
    'PENDING',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-23 02:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    231,
    24,
    25,
    'REJECTED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-28 10:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    232,
    32,
    36,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-04 07:52:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    233,
    59,
    30,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-10 13:28:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    234,
    1,
    15,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-08 04:17:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    235,
    56,
    36,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-11-29 16:47:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    236,
    49,
    13,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-12 11:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    237,
    11,
    50,
    'REJECTED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-11-27 06:01:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    238,
    32,
    15,
    'PENDING',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-12 04:41:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    239,
    22,
    21,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-31 18:17:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    240,
    23,
    12,
    'PENDING',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-30 06:21:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    241,
    40,
    4,
    'PENDING',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-25 10:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    242,
    47,
    28,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-03 16:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    243,
    50,
    15,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-09 03:15:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    244,
    16,
    25,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-14 16:12:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    245,
    30,
    41,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-11-28 19:58:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    246,
    45,
    40,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-12 08:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    247,
    41,
    26,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-10 23:39:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    248,
    13,
    22,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-16 04:32:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    249,
    63,
    40,
    'REJECTED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-21 13:04:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    250,
    43,
    45,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-04 10:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    251,
    32,
    14,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-20 14:34:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    252,
    9,
    9,
    'REJECTED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-14 23:42:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    253,
    48,
    33,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-04 06:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    254,
    53,
    18,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-02 00:42:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    255,
    23,
    2,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-22 20:20:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    256,
    40,
    50,
    'PENDING',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-14 03:14:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    257,
    42,
    36,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-11 02:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    258,
    7,
    10,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-16 13:25:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    259,
    40,
    15,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-12 11:52:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    260,
    30,
    17,
    'REJECTED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-07 00:07:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    261,
    27,
    44,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-19 23:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    262,
    11,
    40,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-18 22:09:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    263,
    66,
    14,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-19 18:49:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    264,
    51,
    49,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-01 16:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    265,
    63,
    51,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-11-30 07:38:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    266,
    54,
    17,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-03 08:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    267,
    39,
    21,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-18 00:46:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    268,
    43,
    42,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-06 03:53:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    269,
    65,
    46,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-16 14:18:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    270,
    7,
    44,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-11-30 01:40:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    271,
    18,
    35,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-24 09:35:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    272,
    24,
    9,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-17 00:12:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    273,
    18,
    2,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-20 22:50:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    274,
    11,
    46,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-12 15:02:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    275,
    66,
    15,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-22 07:00:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    276,
    13,
    15,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-24 21:31:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    277,
    16,
    15,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-10 21:27:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    278,
    10,
    7,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-23 17:22:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    279,
    26,
    33,
    'REJECTED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-18 06:01:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    280,
    35,
    44,
    'REJECTED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-15 04:47:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    281,
    33,
    5,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-13 08:10:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    282,
    9,
    22,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-24 10:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    283,
    45,
    13,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-14 14:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    284,
    7,
    3,
    'REJECTED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-18 15:54:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    285,
    27,
    46,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-13 07:22:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    286,
    9,
    43,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-10 18:59:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    287,
    41,
    14,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-15 22:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    288,
    38,
    43,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-16 06:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    289,
    22,
    31,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-20 16:08:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    290,
    20,
    3,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-13 16:36:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    291,
    8,
    50,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-27 10:49:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    292,
    24,
    2,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-31 18:06:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    293,
    15,
    37,
    'PENDING',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-11-28 18:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    294,
    8,
    15,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-25 12:43:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    295,
    53,
    48,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-19 21:15:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    296,
    12,
    21,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-12 15:26:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    297,
    25,
    30,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-25 19:39:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    298,
    6,
    17,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-03 21:55:51'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    299,
    7,
    10,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-02 02:21:51'
);

-- Reset sequences
ALTER TABLE brands ALTER COLUMN id RESTART WITH 18;
ALTER TABLE categories ALTER COLUMN id RESTART WITH 7;
ALTER TABLE subcategories ALTER COLUMN id RESTART WITH 61;
ALTER TABLE users ALTER COLUMN id RESTART WITH 52;
ALTER TABLE products ALTER COLUMN id RESTART WITH 72;
ALTER TABLE orders ALTER COLUMN id RESTART WITH 115;
ALTER TABLE order_items ALTER COLUMN id RESTART WITH 370;
ALTER TABLE reviews ALTER COLUMN id RESTART WITH 300;

-- Enable foreign key checks
SET REFERENTIAL_INTEGRITY TRUE;

-- Done!
-- Total records: 987