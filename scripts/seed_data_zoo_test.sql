-- ============================================
-- Zoo Pet Store Database Seed Script
-- Generated: 2026-01-26 19:32:46
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2026-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    TIMESTAMP '2025-01-26 19:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    2,
    'Tomasz',
    'Kowalczyk',
    'tomasz.kowalczyk2@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 518 407 169',
    'USER',
    'ul. Krótka 37/25',
    'Kraków',
    '18-656',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-05 02:56:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    3,
    'Piotr',
    'Wojciechowski',
    'piotr.wojciechowski3@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 608 718 134',
    'USER',
    'ul. Kościelna 2/13',
    'Białystok',
    '20-368',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-29 03:19:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    4,
    'Paweł',
    'Pawłowski',
    'pawel.pawlowski4@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 838 164',
    'USER',
    'ul. Polna 40/26',
    'Kraków',
    '39-926',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-27 05:24:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    5,
    'Jakub',
    'Lewandowski',
    'jakub.lewandowski5@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 608 810 687',
    'USER',
    'ul. Kościelna 101/17',
    'Szczecin',
    '39-967',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-11 05:38:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    6,
    'Piotr',
    'Pawłowski',
    'piotr.pawlowski6@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 602 103 363',
    'USER',
    'ul. Krótka 137/40',
    'Rzeszów',
    '71-530',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-12 00:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    7,
    'Małgorzata',
    'Kozłowski',
    'malgorzata.kozlowski7@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 507 910 119',
    'USER',
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-25 21:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    8,
    'Anna',
    'Wojciechowski',
    'anna.wojciechowski8@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 513 993 255',
    'USER',
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-19 01:56:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    9,
    'Paweł',
    'Dąbrowski',
    'pawel.dabrowski9@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 419 977',
    'USER',
    'ul. Zielona 108/40',
    'Warszawa',
    '60-754',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-10 16:57:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    10,
    'Krystyna',
    'Nowak',
    'krystyna.nowak10@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 506 444 582',
    'USER',
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-08 18:59:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    11,
    'Ewa',
    'Piotrowski',
    'ewa.piotrowski11@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 505 378 263',
    'USER',
    'ul. Polna 48/48',
    'Sosnowiec',
    '44-768',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-29 01:43:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    12,
    'Małgorzata',
    'Woźniak',
    'malgorzata.wozniak12@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 425 611',
    'USER',
    'ul. Główna 139/48',
    'Warszawa',
    '92-189',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-25 15:02:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    13,
    'Agnieszka',
    'Dąbrowski',
    'agnieszka.dabrowski13@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 515 254 588',
    'USER',
    'ul. Słoneczna 80/36',
    'Gliwice',
    '11-947',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-22 12:58:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    14,
    'Krystyna',
    'Krawczyk',
    'krystyna.krawczyk14@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 608 510 650',
    'USER',
    'ul. Polna 91/45',
    'Warszawa',
    '78-178',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-22 05:39:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    15,
    'Piotr',
    'Pawłowski',
    'piotr.pawlowski15@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 659 668',
    'USER',
    'ul. Kolejowa 146/50',
    'Rzeszów',
    '94-936',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-02 07:22:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    16,
    'Marek',
    'Woźniak',
    'marek.wozniak16@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 506 356 565',
    'USER',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-20 20:45:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    17,
    'Elżbieta',
    'Kozłowski',
    'elzbieta.kozlowski17@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 505 147 624',
    'USER',
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-20 01:38:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    18,
    'Maria',
    'Lewandowski',
    'maria.lewandowski18@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 601 454 351',
    'USER',
    'ul. Nowa 22/23',
    'Zabrze',
    '37-428',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-05 12:34:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    19,
    'Mateusz',
    'Piotrowski',
    'mateusz.piotrowski19@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 607 825 975',
    'USER',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-29 09:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    20,
    'Karol',
    'Kamiński',
    'karol.kaminski20@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 605 107 152',
    'USER',
    'ul. Łąkowa 115/33',
    'Częstochowa',
    '60-922',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-12 10:48:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    21,
    'Tomasz',
    'Wojciechowski',
    'tomasz.wojciechowski21@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 609 767 517',
    'USER',
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-19 09:18:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    22,
    'Krystyna',
    'Piotrowski',
    'krystyna.piotrowski22@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 377 993',
    'USER',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-07 16:02:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    23,
    'Marek',
    'Woźniak',
    'marek.wozniak23@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 936 831',
    'USER',
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-10 07:23:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    24,
    'Maria',
    'Jankowski',
    'maria.jankowski24@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 488 992',
    'USER',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-02 11:05:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    25,
    'Stanisław',
    'Nowak',
    'stanislaw.nowak25@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 875 497',
    'USER',
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-10 20:55:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    26,
    'Paweł',
    'Woźniak',
    'pawel.wozniak26@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 515 456 312',
    'USER',
    'ul. Ogrodowa 4/25',
    'Kielce',
    '83-734',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-14 08:02:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    27,
    'Karol',
    'Pawłowski',
    'karol.pawlowski27@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 509 167 683',
    'USER',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-11 23:13:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    28,
    'Anna',
    'Kowalski',
    'anna.kowalski28@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 609 251 843',
    'USER',
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-22 11:48:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    29,
    'Łukasz',
    'Szymański',
    'lukasz.szymanski29@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 513 784 545',
    'USER',
    'ul. Polna 119/26',
    'Kraków',
    '35-506',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-28 12:33:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    30,
    'Adam',
    'Grabowski',
    'adam.grabowski30@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 606 423 237',
    'USER',
    'ul. Szkolna 31/28',
    'Rzeszów',
    '43-199',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-07 02:15:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    31,
    'Paweł',
    'Grabowski',
    'pawel.grabowski31@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 508 131 250',
    'USER',
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-25 21:19:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    32,
    'Barbara',
    'Kowalski',
    'barbara.kowalski32@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 712 360',
    'USER',
    'ul. Parkowa 140/7',
    'Lublin',
    '71-694',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-09 19:24:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    33,
    'Ewa',
    'Kozłowski',
    'ewa.kozlowski33@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 872 564',
    'USER',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-31 04:37:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    34,
    'Andrzej',
    'Piotrowski',
    'andrzej.piotrowski34@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 504 454 855',
    'USER',
    'ul. Kolejowa 105/23',
    'Radom',
    '37-880',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-20 09:39:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    35,
    'Karol',
    'Wójcik',
    'karol.wojcik35@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 501 398 541',
    'USER',
    'ul. Słoneczna 130/24',
    'Łódź',
    '94-906',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-07 08:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    36,
    'Piotr',
    'Dąbrowski',
    'piotr.dabrowski36@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 519 859 478',
    'USER',
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-26 22:00:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    37,
    'Barbara',
    'Szymański',
    'barbara.szymanski37@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 509 543 570',
    'USER',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-19 19:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    38,
    'Ewa',
    'Mazur',
    'ewa.mazur38@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 818 760',
    'USER',
    'ul. Rynek 148/3',
    'Katowice',
    '52-507',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-23 21:53:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    39,
    'Marcin',
    'Wojciechowski',
    'marcin.wojciechowski39@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 502 947 459',
    'USER',
    'ul. Polna 142/13',
    'Rzeszów',
    '69-216',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-23 23:48:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    40,
    'Ewa',
    'Jankowski',
    'ewa.jankowski40@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 505 229 153',
    'USER',
    'ul. Nowa 78/41',
    'Łódź',
    '58-657',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-08 02:26:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    41,
    'Barbara',
    'Kowalski',
    'barbara.kowalski41@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 503 980 616',
    'USER',
    'ul. Lipowa 124/8',
    'Kraków',
    '42-690',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-12 11:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    42,
    'Zofia',
    'Dąbrowski',
    'zofia.dabrowski42@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 514 797 505',
    'USER',
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-12 10:30:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    43,
    'Tomasz',
    'Grabowski',
    'tomasz.grabowski43@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 510 566 879',
    'USER',
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-20 00:09:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    44,
    'Barbara',
    'Szymański',
    'barbara.szymanski44@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 518 373 902',
    'USER',
    'ul. Główna 77/33',
    'Białystok',
    '66-655',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-30 13:05:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    45,
    'Elżbieta',
    'Krawczyk',
    'elzbieta.krawczyk45@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 511 431 232',
    'USER',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-30 21:02:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    46,
    'Łukasz',
    'Kowalczyk',
    'lukasz.kowalczyk46@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 605 259 203',
    'USER',
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-12 11:14:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    47,
    'Marek',
    'Nowak',
    'marek.nowak47@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 506 282 986',
    'USER',
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-11-28 03:51:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    48,
    'Małgorzata',
    'Dąbrowski',
    'malgorzata.dabrowski48@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 507 949 369',
    'USER',
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-16 23:01:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    49,
    'Stanisław',
    'Zieliński',
    'stanislaw.zielinski49@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 607 100 908',
    'USER',
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-25 07:35:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    50,
    'Elżbieta',
    'Krawczyk',
    'elzbieta.krawczyk50@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 602 258 197',
    'USER',
    'ul. Kwiatowa 109/14',
    'Sosnowiec',
    '52-367',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2026-01-06 21:37:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    51,
    'Marcin',
    'Wójcik',
    'marcin.wojcik51@example.com',
    '$2a$10$e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e',
    '+48 609 732 250',
    'USER',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    TRUE,
    TRUE,
    NULL,
    TIMESTAMP '2025-12-13 00:16:46',
    TIMESTAMP '2026-01-26 19:32:46'
);

-- Insert products
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    1,
    'Royal Canin Maxi Adult',
    'Karma dla duzych psow dorosłych. Wspiera zdrowie stawow i optymalna wage ciała.',
    1,
    289.99,
    NULL,
    4.1,
    '/images/products/dogs/royal-canin-maxi.jpg',
    'ACTIVE',
    47,
    'ZOO-57EIVGHD',
    15.0,
    '30x35x24cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-01 13:37:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    2,
    'Pedigree Adult z wolowina',
    'Pełnoporcjowa karma dla dorosłych psow z soczystą wolowiną.',
    2,
    149.99,
    NULL,
    3.7,
    '/images/products/dogs/pedigree-beef.jpg',
    'ACTIVE',
    166,
    'ZOO-AD6ILTJC',
    12.0,
    '16x24x18cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-12-17 01:32:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    3,
    'Acana Pacifica Dog',
    'Karma bezzbozowa z rybami z Pacyfiku. 70% składnikow pochodzenia zwierzecego.',
    3,
    359.99,
    NULL,
    3.5,
    '/images/products/dogs/acana-pacifica.jpg',
    'ACTIVE',
    178,
    'ZOO-NMQT6L3V',
    11.4,
    '44x18x8cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-04 06:18:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    4,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych psow sredniej wielkosci z kurczakiem.',
    6,
    319.99,
    NULL,
    5.0,
    '/images/products/dogs/hills-adult.jpg',
    'ACTIVE',
    97,
    'ZOO-TCR76U0N',
    14.0,
    '49x12x22cm',
    NULL,
    1,
    1,
    TIMESTAMP '2026-01-19 13:34:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    5,
    'Purina Pro Plan Adult Large',
    'Karma dla duzych psow z łososiem. Wspiera zdrowa skore i siersc.',
    4,
    299.99,
    239.99,
    4.0,
    '/images/products/dogs/purina-large.jpg',
    'ACTIVE',
    65,
    'ZOO-XFCUDYLE',
    14.0,
    '42x20x19cm',
    NULL,
    1,
    1,
    TIMESTAMP '2025-12-20 17:18:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    128,
    'ZOO-QNJ9TJHP',
    0.4,
    '29x39x11cm',
    NULL,
    1,
    2,
    TIMESTAMP '2026-01-09 15:57:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    7,
    'Royal Canin puszka Adult',
    'Mokra karma premium dla dorosłych psow. Kawałki w sosie.',
    1,
    8.99,
    8.09,
    4.0,
    '/images/products/dogs/rc-can.jpg',
    'ACTIVE',
    34,
    'ZOO-0XSRDYQ5',
    0.4,
    '46x36x14cm',
    NULL,
    1,
    2,
    TIMESTAMP '2026-01-03 22:48:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    8,
    'Pedigree Dentastix',
    'Przysmaki dentystyczne dla psow. Zmniejszaja osadzanie sie kamienia.',
    2,
    24.99,
    NULL,
    4.3,
    '/images/products/dogs/dentastix.jpg',
    'ACTIVE',
    27,
    'ZOO-FUDCGPF8',
    0.27,
    '27x12x26cm',
    NULL,
    1,
    3,
    TIMESTAMP '2025-12-17 22:14:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    9,
    'Kong Classic czerwony L',
    'Wytrzymała zabawka dla psow do wypełniania przysmakami.',
    16,
    59.99,
    NULL,
    4.3,
    '/images/products/dogs/kong-classic.jpg',
    'ACTIVE',
    79,
    'ZOO-ZH3TPPR2',
    0.3,
    '39x37x20cm',
    NULL,
    1,
    4,
    TIMESTAMP '2025-12-04 15:23:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    181,
    'ZOO-4EXA0OFO',
    0.2,
    '28x22x29cm',
    NULL,
    1,
    4,
    TIMESTAMP '2026-01-22 02:05:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    11,
    'Kong Wubba L',
    'Zabawka do przeciągania i aportowania z piszczałką.',
    16,
    49.99,
    39.99,
    3.6,
    '/images/products/dogs/kong-wubba.jpg',
    'ACTIVE',
    200,
    'ZOO-QE5CNFVK',
    0.25,
    '17x38x6cm',
    NULL,
    1,
    4,
    TIMESTAMP '2025-11-30 00:30:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    12,
    'Trixie legowisko owalne 80cm',
    'Miekkie legowisko dla srednih i duzych psow. Łatwe w czyszczeniu.',
    15,
    129.99,
    103.99,
    4.3,
    '/images/products/dogs/bed-oval.jpg',
    'ACTIVE',
    117,
    'ZOO-MYKTQENW',
    1.5,
    '10x28x16cm',
    NULL,
    1,
    6,
    TIMESTAMP '2025-12-19 03:56:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    13,
    'Ferplast legowisko Siesta 6',
    'Plastikowe legowisko z miekka poduszka. Rozmiar dla duzych psow.',
    17,
    149.99,
    NULL,
    4.4,
    '/images/products/dogs/ferplast-siesta.jpg',
    'ACTIVE',
    63,
    'ZOO-1HFS1QGB',
    2.0,
    '20x10x16cm',
    NULL,
    1,
    6,
    TIMESTAMP '2025-12-24 20:34:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    14,
    'Trixie obroza skorzana M',
    'Klasyczna obroza ze skory naturalnej. Regulowana dlugosc.',
    15,
    39.99,
    29.99,
    3.6,
    '/images/products/dogs/leather-collar.jpg',
    'ACTIVE',
    28,
    'ZOO-FAD21ZY1',
    0.1,
    '37x11x10cm',
    NULL,
    1,
    7,
    TIMESTAMP '2025-12-14 08:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    15,
    'Trixie smycz automatyczna 5m',
    'Smycz flexi z blokada i ergonomicznym uchwytem.',
    15,
    79.99,
    NULL,
    3.7,
    '/images/products/dogs/flexi-leash.jpg',
    'ACTIVE',
    53,
    'ZOO-R2Z4XWT0',
    0.3,
    '22x33x28cm',
    NULL,
    1,
    7,
    TIMESTAMP '2025-12-25 19:00:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    104,
    'ZOO-36E97NPW',
    0.5,
    '25x34x30cm',
    NULL,
    1,
    8,
    TIMESTAMP '2025-12-16 00:35:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    17,
    'Trixie szampon uniwersalny 1L',
    'Delikatny szampon dla psow o kazdym typie sierści.',
    15,
    34.99,
    NULL,
    4.4,
    '/images/products/dogs/shampoo.jpg',
    'ACTIVE',
    120,
    'ZOO-6HJ79B24',
    1.0,
    '47x27x24cm',
    NULL,
    1,
    9,
    TIMESTAMP '2026-01-12 15:12:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    18,
    'Ferplast transporter Atlas 40',
    'Transporter plastikowy dla psow do 18kg. Zgodny z IATA.',
    17,
    189.99,
    NULL,
    4.1,
    '/images/products/dogs/atlas-carrier.jpg',
    'ACTIVE',
    92,
    'ZOO-F8IVFEH8',
    3.5,
    '49x12x17cm',
    NULL,
    1,
    10,
    TIMESTAMP '2026-01-17 19:01:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    19,
    'Royal Canin Indoor Cat',
    'Karma dla kotow domowych. Redukuje zapach kuwety.',
    1,
    249.99,
    NULL,
    4.8,
    '/images/products/cats/rc-indoor.jpg',
    'ACTIVE',
    14,
    'ZOO-BMCCS27Q',
    10.0,
    '48x25x15cm',
    NULL,
    2,
    11,
    TIMESTAMP '2026-01-06 21:50:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    20,
    'Whiskas z kurczakiem',
    'Karma sucha dla dorosłych kotow z pysznym kurczakiem.',
    5,
    89.99,
    NULL,
    4.3,
    '/images/products/cats/whiskas-chicken.jpg',
    'ACTIVE',
    33,
    'ZOO-H445SXKZ',
    7.0,
    '43x12x8cm',
    NULL,
    2,
    11,
    TIMESTAMP '2026-01-13 20:15:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    21,
    'Purina Pro Plan Sterilised',
    'Karma dla kotow sterylizowanych z łososiem.',
    4,
    269.99,
    NULL,
    4.5,
    '/images/products/cats/purina-sterilised.jpg',
    'ACTIVE',
    48,
    'ZOO-U4URZA5R',
    10.0,
    '32x22x21cm',
    NULL,
    2,
    11,
    TIMESTAMP '2025-12-16 08:15:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    22,
    'Hill''s Science Plan Adult',
    'Karma dla dorosłych kotow z tuńczykiem.',
    6,
    229.99,
    NULL,
    3.5,
    '/images/products/cats/hills-tuna.jpg',
    'ACTIVE',
    26,
    'ZOO-WF87NT0E',
    7.0,
    '33x30x25cm',
    NULL,
    2,
    11,
    TIMESTAMP '2026-01-24 10:40:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    23,
    'Sheba saszetki z łososiem 12x85g',
    'Mokra karma premium w saszatkach. Delikatne kawałki w sosie.',
    7,
    32.99,
    NULL,
    5.0,
    '/images/products/cats/sheba-salmon.jpg',
    'ACTIVE',
    127,
    'ZOO-ZC584BFB',
    1.02,
    '17x31x22cm',
    NULL,
    2,
    12,
    TIMESTAMP '2026-01-16 13:46:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    77,
    'ZOO-82UXD4Z3',
    0.4,
    '48x29x9cm',
    NULL,
    2,
    12,
    TIMESTAMP '2026-01-17 03:53:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    25,
    'Whiskas Temptations kurczak',
    'Chrupiace przysmaki z miekkim nadzieniem.',
    5,
    8.99,
    NULL,
    3.9,
    '/images/products/cats/temptations.jpg',
    'ACTIVE',
    192,
    'ZOO-5W5JY91A',
    0.06,
    '10x34x16cm',
    NULL,
    2,
    13,
    TIMESTAMP '2025-12-24 11:09:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    26,
    'Trixie myszka pluszowa 3szt',
    'Zestaw pluszowych myszek z kocimiętką.',
    15,
    12.99,
    9.09,
    4.1,
    '/images/products/cats/plush-mice.jpg',
    'ACTIVE',
    184,
    'ZOO-DSDLRAX3',
    0.05,
    '28x15x21cm',
    NULL,
    2,
    14,
    TIMESTAMP '2025-12-07 11:23:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    27,
    'Trixie wedka z piórkami',
    'Interaktywna wedka z kolorowymi piórkami.',
    15,
    19.99,
    NULL,
    3.6,
    '/images/products/cats/feather-wand.jpg',
    'ACTIVE',
    166,
    'ZOO-IUA0W7KU',
    0.1,
    '37x13x27cm',
    NULL,
    2,
    14,
    TIMESTAMP '2026-01-09 03:45:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    28,
    'Ferplast tunel dla kota',
    'Składany tunel do zabawy z szelestrzącym materiałem.',
    17,
    49.99,
    NULL,
    4.1,
    '/images/products/cats/tunnel.jpg',
    'ACTIVE',
    70,
    'ZOO-AJ7MSZQC',
    0.3,
    '33x13x26cm',
    NULL,
    2,
    14,
    TIMESTAMP '2025-12-07 10:57:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    29,
    'Trixie drapak słupek 60cm',
    'Drapak z sizalowym słupkiem i platformą.',
    15,
    79.99,
    NULL,
    4.4,
    '/images/products/cats/scratching-post.jpg',
    'ACTIVE',
    173,
    'ZOO-5DY68TVS',
    3.0,
    '42x40x18cm',
    NULL,
    2,
    15,
    TIMESTAMP '2026-01-01 17:45:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    30,
    'Trixie legowisko na kaloryfer',
    'Miekkie legowisko do zawieszenia na kaloryferze.',
    15,
    59.99,
    NULL,
    4.4,
    '/images/products/cats/radiator-bed.jpg',
    'ACTIVE',
    122,
    'ZOO-PP34PKU7',
    0.5,
    '21x31x13cm',
    NULL,
    2,
    16,
    TIMESTAMP '2025-12-06 21:10:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    31,
    'Ferplast kuweta Netta',
    'Zamknięta kuweta z filrem węglowym.',
    17,
    89.99,
    NULL,
    4.8,
    '/images/products/cats/litter-box.jpg',
    'ACTIVE',
    35,
    'ZOO-JV8J8YCR',
    2.5,
    '20x17x10cm',
    NULL,
    2,
    19,
    TIMESTAMP '2026-01-19 08:42:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    32,
    'Trixie żwirek betonit 10L',
    'Zbrylający żwirek o delikatnym zapachu.',
    15,
    29.99,
    NULL,
    4.7,
    '/images/products/cats/litter.jpg',
    'ACTIVE',
    73,
    'ZOO-3WGKOUP9',
    8.0,
    '33x30x17cm',
    NULL,
    2,
    19,
    TIMESTAMP '2026-01-15 02:22:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    33,
    'Royal Canin Hairball Care',
    'Suplement pomagający w usuwaniu kul włosowych.',
    1,
    49.99,
    NULL,
    3.8,
    '/images/products/cats/hairball.jpg',
    'ACTIVE',
    9,
    'ZOO-TVOIV9U5',
    0.4,
    '23x36x23cm',
    NULL,
    2,
    18,
    TIMESTAMP '2026-01-02 05:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    34,
    'Ferplast transporter Atlas 20',
    'Transporter dla kotow z wentylacją.',
    17,
    99.99,
    69.99,
    4.1,
    '/images/products/cats/carrier.jpg',
    'ACTIVE',
    67,
    'ZOO-C4JNIG2C',
    2.0,
    '18x20x14cm',
    NULL,
    2,
    20,
    TIMESTAMP '2025-12-05 14:15:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    35,
    'Vitakraft Menu Vital chomik',
    'Pełnowartościowa karma dla chomików z witaminami.',
    8,
    24.99,
    NULL,
    4.6,
    '/images/products/rodents/vitakraft-hamster.jpg',
    'ACTIVE',
    55,
    'ZOO-0H9DW20Y',
    1.0,
    '45x11x27cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-09 02:03:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    36,
    'Versele-Laga Crispy Muesli',
    'Mieszanka dla królików z warzywami i ziołami.',
    9,
    39.99,
    NULL,
    3.6,
    '/images/products/rodents/crispy-rabbit.jpg',
    'ACTIVE',
    140,
    'ZOO-JUI9Q3MT',
    2.75,
    '12x12x13cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-23 16:58:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    37,
    'Vitakraft karma dla świnki',
    'Karma dla świnek morskich z witaminą C.',
    8,
    26.99,
    21.59,
    3.6,
    '/images/products/rodents/guinea-food.jpg',
    'ACTIVE',
    15,
    'ZOO-TEN2NCW3',
    1.0,
    '35x23x12cm',
    NULL,
    3,
    21,
    TIMESTAMP '2025-12-10 11:27:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    38,
    'Versele-Laga Complete Hamster',
    'Ekstrudowana karma dla chomików. All-in-one.',
    9,
    19.99,
    NULL,
    3.9,
    '/images/products/rodents/complete-hamster.jpg',
    'ACTIVE',
    51,
    'ZOO-NDYGFZJD',
    0.5,
    '38x27x5cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-21 08:28:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    39,
    'Vitakraft Kracker miód',
    'Kolby z miodem dla gryzoni.',
    8,
    9.99,
    NULL,
    4.3,
    '/images/products/rodents/honey-sticks.jpg',
    'ACTIVE',
    169,
    'ZOO-G682H0GT',
    0.2,
    '28x20x15cm',
    NULL,
    3,
    23,
    TIMESTAMP '2025-12-29 03:26:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    40,
    'Trixie domek drewniany M',
    'Domek z naturalnego drewna dla chomika.',
    15,
    29.99,
    22.49,
    3.7,
    '/images/products/rodents/wooden-house.jpg',
    'ACTIVE',
    18,
    'ZOO-WB7NSYU4',
    0.3,
    '11x21x20cm',
    NULL,
    3,
    25,
    TIMESTAMP '2026-01-18 22:20:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    41,
    'Trixie kołowrotek 20cm',
    'Metalowy kołowrotek dla chomika i myszki.',
    15,
    39.99,
    31.99,
    3.6,
    '/images/products/rodents/wheel.jpg',
    'ACTIVE',
    162,
    'ZOO-T32EGV0P',
    0.4,
    '31x28x17cm',
    NULL,
    3,
    24,
    TIMESTAMP '2025-11-29 11:54:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    122,
    'ZOO-SP8ZXM6Y',
    5.0,
    '28x31x9cm',
    NULL,
    3,
    25,
    TIMESTAMP '2025-12-27 20:00:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    43,
    'Trixie siano łąkowe 1kg',
    'Naturalne siano dla królików i gryzoni.',
    15,
    14.99,
    NULL,
    4.1,
    '/images/products/rodents/hay.jpg',
    'ACTIVE',
    60,
    'ZOO-O1IQF0X7',
    1.0,
    '18x30x15cm',
    NULL,
    3,
    21,
    TIMESTAMP '2026-01-16 00:04:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    44,
    'Vitakraft witaminy krople',
    'Witaminy w kroplach dla gryzoni.',
    8,
    19.99,
    NULL,
    4.4,
    '/images/products/rodents/vitamins.jpg',
    'ACTIVE',
    33,
    'ZOO-I6GDEE2H',
    0.05,
    '32x12x30cm',
    NULL,
    3,
    28,
    TIMESTAMP '2025-12-20 03:28:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    45,
    'Versele-Laga Prestige papuga',
    'Mieszanka ziaren dla średnich papug.',
    9,
    29.99,
    NULL,
    4.3,
    '/images/products/birds/prestige-parrot.jpg',
    'ACTIVE',
    157,
    'ZOO-AA7VR4K6',
    1.0,
    '13x31x19cm',
    NULL,
    4,
    31,
    TIMESTAMP '2025-12-09 16:26:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    46,
    'Vitakraft kanarek Premium',
    'Karma dla kanarków z ziołami.',
    8,
    24.99,
    NULL,
    4.3,
    '/images/products/birds/canary-food.jpg',
    'ACTIVE',
    125,
    'ZOO-U2CKCC8L',
    0.8,
    '21x18x23cm',
    NULL,
    4,
    31,
    TIMESTAMP '2025-12-11 16:20:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    47,
    'Versele-Laga NutriBird',
    'Ekstrudowana karma dla papug.',
    9,
    49.99,
    NULL,
    4.5,
    '/images/products/birds/nutribird.jpg',
    'ACTIVE',
    22,
    'ZOO-INEPB4WF',
    1.0,
    '20x11x27cm',
    NULL,
    4,
    31,
    TIMESTAMP '2026-01-22 17:38:46',
    TIMESTAMP '2026-01-26 19:32:46'
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
    81,
    'ZOO-RHJXFT38',
    0.1,
    '42x23x21cm',
    NULL,
    4,
    33,
    TIMESTAMP '2025-12-12 11:02:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    49,
    'Trixie huśtawka drewniana',
    'Huśtawka z naturalnego drewna dla ptaków.',
    15,
    14.99,
    NULL,
    3.7,
    '/images/products/birds/swing.jpg',
    'ACTIVE',
    29,
    'ZOO-XG652QVE',
    0.15,
    '30x36x5cm',
    NULL,
    4,
    34,
    TIMESTAMP '2026-01-16 08:24:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    50,
    'Ferplast klatka Piano 6',
    'Duża klatka dla kanarków i papużek.',
    17,
    349.99,
    297.49,
    4.5,
    '/images/products/birds/cage.jpg',
    'ACTIVE',
    29,
    'ZOO-OATNCOGY',
    8.0,
    '27x13x8cm',
    NULL,
    4,
    35,
    TIMESTAMP '2026-01-01 03:24:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    51,
    'Trixie żerdź korowa 2szt',
    'Naturalne żerdzie z kory dla ptaków.',
    15,
    19.99,
    NULL,
    5.0,
    '/images/products/birds/perches.jpg',
    'ACTIVE',
    157,
    'ZOO-SGDEQDDL',
    0.2,
    '34x32x8cm',
    NULL,
    4,
    35,
    TIMESTAMP '2025-11-27 23:08:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    52,
    'Vitakraft piasek dla ptaków',
    'Piasek z muszlami dla lepszego trawienia.',
    8,
    12.99,
    NULL,
    3.9,
    '/images/products/birds/sand.jpg',
    'ACTIVE',
    149,
    'ZOO-ONTU8276',
    2.5,
    '50x16x28cm',
    NULL,
    4,
    39,
    TIMESTAMP '2026-01-17 10:34:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    53,
    'Tetra Pro Energy',
    'Wysokoenergetyczna karma w płatkach.',
    10,
    79.99,
    NULL,
    4.8,
    '/images/products/fish/tetra-pro.jpg',
    'ACTIVE',
    123,
    'ZOO-5SXNYRLN',
    0.5,
    '16x13x19cm',
    NULL,
    5,
    41,
    TIMESTAMP '2025-12-25 02:03:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    54,
    'Tropical Supervit',
    'Wieloskładnikowa karma dla ryb tropikalnych.',
    12,
    39.99,
    NULL,
    5.0,
    '/images/products/fish/supervit.jpg',
    'ACTIVE',
    113,
    'ZOO-DCJ9H1HQ',
    0.25,
    '50x31x16cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-08 06:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    55,
    'JBL NovoTab',
    'Tabletki pokarmowe dla ryb dennych.',
    11,
    44.99,
    35.99,
    3.7,
    '/images/products/fish/novotab.jpg',
    'ACTIVE',
    5,
    'ZOO-MS7T044X',
    0.25,
    '31x26x20cm',
    NULL,
    5,
    41,
    TIMESTAMP '2026-01-13 08:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    56,
    'Tetra Goldfish',
    'Karma dla złotych rybek w płatkach.',
    10,
    29.99,
    23.99,
    3.5,
    '/images/products/fish/goldfish.jpg',
    'ACTIVE',
    139,
    'ZOO-Y5YFFI7V',
    0.2,
    '31x19x13cm',
    NULL,
    5,
    41,
    TIMESTAMP '2025-12-05 07:42:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    57,
    'JBL ProFlora u500',
    'Butla CO2 500g do nawożenia roślin.',
    11,
    149.99,
    NULL,
    4.8,
    '/images/products/fish/co2.jpg',
    'ACTIVE',
    94,
    'ZOO-CCY0PEAJ',
    1.2,
    '11x14x22cm',
    NULL,
    5,
    45,
    TIMESTAMP '2026-01-03 08:28:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    58,
    'Tetra EasyCrystal 600',
    'Filtr wewnętrzny do akwariów 50-150L.',
    10,
    129.99,
    NULL,
    4.1,
    '/images/products/fish/filter.jpg',
    'ACTIVE',
    31,
    'ZOO-S17OAHSE',
    0.8,
    '13x40x9cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-12-31 01:52:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    59,
    'JBL LED Solar Nature',
    'Oświetlenie LED do akwariów roślinnych.',
    11,
    399.99,
    359.99,
    4.5,
    '/images/products/fish/led-light.jpg',
    'ACTIVE',
    149,
    'ZOO-ED4OBYGO',
    1.5,
    '37x16x25cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-12-27 18:36:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    60,
    'Tetra Aqua Safe 500ml',
    'Uzdatniacz wody usuwający chlor.',
    10,
    49.99,
    37.49,
    4.4,
    '/images/products/fish/aquasafe.jpg',
    'ACTIVE',
    73,
    'ZOO-GJ8N2CUB',
    0.5,
    '14x17x22cm',
    NULL,
    5,
    49,
    TIMESTAMP '2025-12-04 13:40:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    61,
    'JBL Denitrol 250ml',
    'Bakterie startowe do nowych akwariów.',
    11,
    59.99,
    53.99,
    3.6,
    '/images/products/fish/denitrol.jpg',
    'ACTIVE',
    194,
    'ZOO-15ADLTRL',
    0.3,
    '28x25x12cm',
    NULL,
    5,
    48,
    TIMESTAMP '2025-11-30 13:09:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    62,
    'Tropical korzeń mangrowca M',
    'Naturalny korzeń do dekoracji akwarium.',
    12,
    69.99,
    48.99,
    4.8,
    '/images/products/fish/root.jpg',
    'ACTIVE',
    172,
    'ZOO-Y4DZRQ0V',
    0.8,
    '45x13x10cm',
    NULL,
    5,
    45,
    TIMESTAMP '2025-11-29 05:50:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    63,
    'Zoo Med karma dla żółwia',
    'Pływające granulki dla żółwi wodnych.',
    13,
    49.99,
    NULL,
    4.3,
    '/images/products/reptiles/turtle-food.jpg',
    'ACTIVE',
    147,
    'ZOO-BQB0G3XV',
    0.35,
    '29x38x23cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-03 14:41:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    64,
    'Exo Terra karma dla brodatych',
    'Karma dla agam brodatych dorosłych.',
    14,
    39.99,
    NULL,
    4.2,
    '/images/products/reptiles/bearded-dragon.jpg',
    'ACTIVE',
    190,
    'ZOO-AL582MV8',
    0.25,
    '45x27x18cm',
    NULL,
    6,
    51,
    TIMESTAMP '2026-01-06 13:06:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    65,
    'Zoo Med świerszcze liofiliz.',
    'Suszone świerszcze dla gadów i płazów.',
    13,
    34.99,
    NULL,
    4.4,
    '/images/products/reptiles/crickets.jpg',
    'ACTIVE',
    182,
    'ZOO-NGOTEE7B',
    0.08,
    '35x19x8cm',
    NULL,
    6,
    51,
    TIMESTAMP '2025-12-11 17:13:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    66,
    'Exo Terra terrarium 60x45x45',
    'Szklane terrarium z wentylacją.',
    14,
    599.99,
    509.99,
    3.9,
    '/images/products/reptiles/terrarium.jpg',
    'ACTIVE',
    62,
    'ZOO-XT23CQ4J',
    25.0,
    '50x32x5cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-09 13:21:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    67,
    'Zoo Med lampa UVB 10.0',
    'Świetlówka UVB dla gadów pustynnych.',
    13,
    89.99,
    NULL,
    4.2,
    '/images/products/reptiles/uvb-lamp.jpg',
    'ACTIVE',
    115,
    'ZOO-ZY8HC87D',
    0.2,
    '11x35x22cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-05 04:04:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    68,
    'Exo Terra Heat Mat M',
    'Mata grzewcza 16W do terrarium.',
    14,
    79.99,
    67.99,
    3.7,
    '/images/products/reptiles/heat-mat.jpg',
    'ACTIVE',
    21,
    'ZOO-75Z1PUM5',
    0.3,
    '33x15x26cm',
    NULL,
    6,
    55,
    TIMESTAMP '2025-12-11 12:36:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    69,
    'Zoo Med Repti Calcium',
    'Wapno bez D3 dla gadów.',
    13,
    44.99,
    35.99,
    4.5,
    '/images/products/reptiles/calcium.jpg',
    'ACTIVE',
    172,
    'ZOO-YQHJCIY9',
    0.25,
    '32x16x9cm',
    NULL,
    6,
    58,
    TIMESTAMP '2025-12-27 01:23:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    70,
    'Exo Terra kryjówka jaskinia M',
    'Naturalna dekoracja - kryjówka.',
    14,
    49.99,
    NULL,
    4.8,
    '/images/products/reptiles/hide.jpg',
    'ACTIVE',
    142,
    'ZOO-OXKELXAQ',
    0.8,
    '49x10x18cm',
    NULL,
    6,
    55,
    TIMESTAMP '2026-01-11 21:45:46',
    TIMESTAMP '2026-01-26 19:32:46'
);
INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    71,
    'Zoo Med Eco Earth 3-pack',
    'Podłoże kokosowe do terrarów.',
    13,
    39.99,
    NULL,
    3.7,
    '/images/products/reptiles/substrate.jpg',
    'ACTIVE',
    97,
    'ZOO-6XUFHYR7',
    0.6,
    '34x32x29cm',
    NULL,
    6,
    59,
    TIMESTAMP '2025-12-02 21:51:46',
    TIMESTAMP '2026-01-26 19:32:46'
);

-- Insert orders
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    1,
    'ZAM-20260126-475268',
    TIMESTAMP '2025-12-14 21:45:46',
    'PROCESSING',
    'FAILED',
    'TRANSFER',
    'COURIER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    1289.89,
    1308.39,
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
    TIMESTAMP '2025-12-16 01:45:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    2,
    'ZAM-20260126-222316',
    TIMESTAMP '2026-01-03 11:45:46',
    'CONFIRMED',
    'PAID',
    'CARD',
    'COURIER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    532.94,
    503.6,
    18.5,
    47.84,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-05 06:45:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    3,
    'ZAM-20260126-213664',
    TIMESTAMP '2026-01-06 23:43:46',
    'PENDING',
    'FAILED',
    'CARD',
    'COURIER',
    4,
    NULL,
    NULL,
    NULL,
    'ul. Polna 40/26',
    'Kraków',
    '39-926',
    'Poland',
    'ul. Polna 40/26',
    'Kraków',
    '39-926',
    'Poland',
    2569.86,
    2453.26,
    18.5,
    135.1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 16:43:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    4,
    'ZAM-20260126-380608',
    TIMESTAMP '2026-01-05 19:06:46',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    41,
    NULL,
    NULL,
    NULL,
    'ul. Lipowa 124/8',
    'Kraków',
    '42-690',
    'Poland',
    'ul. Lipowa 124/8',
    'Kraków',
    '42-690',
    'Poland',
    36.98,
    49.97,
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
    TIMESTAMP '2026-01-07 16:06:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    5,
    'ZAM-20260126-225425',
    TIMESTAMP '2026-01-17 17:08:46',
    'PACKED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'COURIER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    1167.92,
    1186.42,
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
    TIMESTAMP '2026-01-18 10:08:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    6,
    'ZAM-20260126-410879',
    TIMESTAMP '2026-01-26 11:07:46',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'COURIER',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    479.93,
    498.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL59698700',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-27 22:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    7,
    'ZAM-20260126-067271',
    TIMESTAMP '2026-01-11 07:32:46',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    113.16,
    113.16,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL66302058',
    NULL,
    NULL,
    TIMESTAMP '2026-01-14 07:32:46',
    TIMESTAMP '2026-01-12 17:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    8,
    'ZAM-20260126-669460',
    TIMESTAMP '2025-12-01 15:10:46',
    'PROCESSING',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    519.96,
    502.11,
    12.99,
    30.84,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 14:10:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    9,
    'ZAM-20260126-487415',
    TIMESTAMP '2026-01-02 23:07:46',
    'PACKED',
    'PAID',
    'CARD',
    'LOCKER',
    17,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    259.95,
    272.94,
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
    TIMESTAMP '2026-01-03 13:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    10,
    'ZAM-20260126-253364',
    TIMESTAMP '2025-12-27 04:33:46',
    'PENDING',
    'PAID',
    'CARD',
    'COURIER',
    12,
    NULL,
    NULL,
    NULL,
    'ul. Główna 139/48',
    'Warszawa',
    '92-189',
    'Poland',
    'ul. Główna 139/48',
    'Warszawa',
    '92-189',
    'Poland',
    1414.91,
    1433.41,
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
    TIMESTAMP '2025-12-29 02:33:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    11,
    'ZAM-20260126-182517',
    TIMESTAMP '2026-01-13 06:46:46',
    'CONFIRMED',
    'FAILED',
    'BLIK',
    'PICKUP',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    87.97,
    87.97,
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
    TIMESTAMP '2026-01-15 06:46:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    12,
    'ZAM-20260126-717647',
    TIMESTAMP '2025-11-29 04:34:46',
    'CONFIRMED',
    'PAID',
    'CARD',
    'COURIER',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    899.92,
    918.42,
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
    TIMESTAMP '2025-11-29 22:34:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    13,
    'ZAM-20260126-071725',
    TIMESTAMP '2025-11-29 02:20:46',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    211.93,
    230.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL31348949',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-30 20:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    14,
    'ZAM-20260126-606346',
    TIMESTAMP '2026-01-21 11:42:46',
    'PACKED',
    'PENDING',
    'TRANSFER',
    'COURIER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    273.01,
    291.51,
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
    TIMESTAMP '2026-01-21 15:42:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    15,
    'ZAM-20260126-764213',
    TIMESTAMP '2026-01-09 17:51:46',
    'PENDING',
    'PAID',
    'CARD',
    'COURIER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    59.99,
    74.35,
    18.5,
    4.14,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-10 22:51:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    16,
    'ZAM-20260126-522436',
    TIMESTAMP '2025-12-04 14:04:46',
    'PACKED',
    'PAID',
    'BLIK',
    'COURIER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    231.04,
    249.54,
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
    TIMESTAMP '2025-12-05 18:04:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    17,
    'ZAM-20260126-413558',
    TIMESTAMP '2025-12-25 14:32:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    1351.92,
    1364.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL62326300',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-25 22:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    18,
    'ZAM-20260126-619236',
    TIMESTAMP '2026-01-25 20:27:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    691.91,
    691.91,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-26 06:27:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-27 01:27:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    19,
    'ZAM-20260126-927997',
    TIMESTAMP '2026-01-03 11:23:46',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    224.95,
    237.94,
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
    TIMESTAMP '2026-01-03 18:23:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    20,
    'ZAM-20260126-877532',
    TIMESTAMP '2026-01-01 01:01:46',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    15,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 146/50',
    'Rzeszów',
    '94-936',
    'Poland',
    'ul. Kolejowa 146/50',
    'Rzeszów',
    '94-936',
    'Poland',
    1072.45,
    1072.45,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL19482464',
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 01:01:46',
    TIMESTAMP '2026-01-01 04:01:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    21,
    'ZAM-20260126-100004',
    TIMESTAMP '2025-12-28 00:06:46',
    'CONFIRMED',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    231.01,
    201.68,
    0.0,
    29.33,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 13:06:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    22,
    'ZAM-20260126-849849',
    TIMESTAMP '2026-01-01 05:09:46',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'COURIER',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    252.19,
    270.69,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-01 18:09:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-01 21:09:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    23,
    'ZAM-20260126-969640',
    TIMESTAMP '2025-12-12 22:20:46',
    'CONFIRMED',
    'FAILED',
    'TRANSFER',
    'COURIER',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    261.98,
    280.48,
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
    TIMESTAMP '2025-12-13 07:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    24,
    'ZAM-20260126-638406',
    TIMESTAMP '2026-01-20 21:23:46',
    'PENDING',
    'FAILED',
    'TRANSFER',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    1539.92,
    1539.92,
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
    TIMESTAMP '2026-01-21 13:23:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    25,
    'ZAM-20260126-916157',
    TIMESTAMP '2025-12-12 19:41:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    477.92,
    430.31,
    18.5,
    66.11,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL38313577',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 23:41:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    26,
    'ZAM-20260126-377305',
    TIMESTAMP '2025-12-07 21:06:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    558.88,
    539.64,
    12.99,
    32.23,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL33532166',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-07 23:06:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    27,
    'ZAM-20260126-635527',
    TIMESTAMP '2026-01-12 05:54:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    15,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 146/50',
    'Rzeszów',
    '94-936',
    'Poland',
    'ul. Kolejowa 146/50',
    'Rzeszów',
    '94-936',
    'Poland',
    379.97,
    379.97,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL24745785',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-13 20:54:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    28,
    'ZAM-20260126-309964',
    TIMESTAMP '2025-12-20 21:12:46',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    279.94,
    265.03,
    18.5,
    33.41,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL99977390',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-21 17:12:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    29,
    'ZAM-20260126-364967',
    TIMESTAMP '2025-11-28 05:19:46',
    'PENDING',
    'FAILED',
    'BLIK',
    'COURIER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    59.97,
    78.47,
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
    TIMESTAMP '2025-11-28 21:19:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    30,
    'ZAM-20260126-094231',
    TIMESTAMP '2025-12-05 14:31:46',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    72.95,
    85.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-05 15:31:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-06 05:31:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    31,
    'ZAM-20260126-949002',
    TIMESTAMP '2025-12-12 06:24:46',
    'CONFIRMED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    1629.95,
    1629.95,
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
    TIMESTAMP '2025-12-13 23:24:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    32,
    'ZAM-20260126-208044',
    TIMESTAMP '2025-12-21 07:38:46',
    'CONFIRMED',
    'PENDING',
    'BLIK',
    'COURIER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    247.95,
    266.45,
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
    TIMESTAMP '2025-12-21 12:38:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    33,
    'ZAM-20260126-021797',
    TIMESTAMP '2026-01-10 22:23:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    17,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    774.91,
    721.01,
    18.5,
    72.4,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL87772402',
    NULL,
    NULL,
    TIMESTAMP '2026-01-16 22:23:46',
    TIMESTAMP '2026-01-11 17:23:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    34,
    'ZAM-20260126-049753',
    TIMESTAMP '2025-12-08 00:18:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    834.92,
    847.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL29094143',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-09 00:18:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    35,
    'ZAM-20260126-940429',
    TIMESTAMP '2025-12-26 09:03:46',
    'PACKED',
    'PAID',
    'CARD',
    'PICKUP',
    29,
    NULL,
    NULL,
    NULL,
    'ul. Polna 119/26',
    'Kraków',
    '35-506',
    'Poland',
    'ul. Polna 119/26',
    'Kraków',
    '35-506',
    'Poland',
    1265.88,
    1265.88,
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
    TIMESTAMP '2025-12-27 17:03:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    36,
    'ZAM-20260126-456055',
    TIMESTAMP '2025-12-16 16:39:46',
    'PENDING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    585.88,
    585.88,
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
    TIMESTAMP '2025-12-17 15:39:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    37,
    'ZAM-20260126-190830',
    TIMESTAMP '2025-12-24 18:55:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    179.97,
    198.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL76064104',
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 18:55:46',
    TIMESTAMP '2025-12-25 19:55:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    38,
    'ZAM-20260126-164135',
    TIMESTAMP '2025-12-06 23:53:46',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    224.96,
    224.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL38867909',
    NULL,
    NULL,
    TIMESTAMP '2025-12-10 23:53:46',
    TIMESTAMP '2025-12-08 22:53:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    39,
    'ZAM-20260126-201822',
    TIMESTAMP '2026-01-13 16:11:46',
    'PENDING',
    'PENDING',
    'BLIK',
    'LOCKER',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    1667.43,
    1680.42,
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
    TIMESTAMP '2026-01-15 04:11:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    40,
    'ZAM-20260126-428657',
    TIMESTAMP '2025-12-23 10:27:46',
    'CONFIRMED',
    'PAID',
    'BLIK',
    'PICKUP',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    147.95,
    147.95,
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
    TIMESTAMP '2025-12-24 09:27:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    41,
    'ZAM-20260126-310597',
    TIMESTAMP '2026-01-03 14:07:46',
    'PACKED',
    'FAILED',
    'TRANSFER',
    'COURIER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    259.94,
    278.44,
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
    TIMESTAMP '2026-01-04 05:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    42,
    'ZAM-20260126-800402',
    TIMESTAMP '2026-01-25 08:12:46',
    'SHIPPED',
    'PAID',
    'BLIK',
    'COURIER',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    109.97,
    128.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL67080868',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-25 15:12:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    43,
    'ZAM-20260126-163817',
    TIMESTAMP '2026-01-06 12:45:46',
    'PROCESSING',
    'FAILED',
    'BLIK',
    'PICKUP',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    1002.44,
    895.98,
    0.0,
    106.46,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-06 18:45:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    44,
    'ZAM-20260126-769306',
    TIMESTAMP '2026-01-01 07:40:46',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    29.98,
    40.25,
    12.99,
    2.72,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL77213950',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-02 22:40:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    45,
    'ZAM-20260126-428332',
    TIMESTAMP '2026-01-13 23:06:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    13,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 80/36',
    'Gliwice',
    '11-947',
    'Poland',
    'ul. Słoneczna 80/36',
    'Gliwice',
    '11-947',
    'Poland',
    1225.89,
    1244.39,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL22108792',
    NULL,
    NULL,
    TIMESTAMP '2026-01-16 23:06:46',
    TIMESTAMP '2026-01-14 16:06:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    46,
    'ZAM-20260126-921593',
    TIMESTAMP '2026-01-06 14:13:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    699.93,
    718.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL34157609',
    NULL,
    NULL,
    TIMESTAMP '2026-01-08 14:13:46',
    TIMESTAMP '2026-01-06 20:13:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    47,
    'ZAM-20260126-987690',
    TIMESTAMP '2025-12-02 20:15:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    67.47,
    79.16,
    18.5,
    6.81,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL15481606',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 18:15:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    48,
    'ZAM-20260126-246637',
    TIMESTAMP '2025-12-04 00:07:46',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'LOCKER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    1397.93,
    1410.92,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 12:07:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-04 12:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    49,
    'ZAM-20260126-035999',
    TIMESTAMP '2025-12-01 02:21:46',
    'PENDING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    1811.89,
    1824.88,
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
    TIMESTAMP '2025-12-01 06:21:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    50,
    'ZAM-20260126-394502',
    TIMESTAMP '2025-12-07 08:39:46',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    519.95,
    519.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL83828010',
    NULL,
    NULL,
    TIMESTAMP '2025-12-11 08:39:46',
    TIMESTAMP '2025-12-08 22:39:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    51,
    'ZAM-20260126-701157',
    TIMESTAMP '2025-11-28 03:31:46',
    'CONFIRMED',
    'PAID',
    'CARD',
    'LOCKER',
    17,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    'ul. Kolejowa 63/22',
    'Toruń',
    '67-417',
    'Poland',
    692.87,
    705.86,
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
    TIMESTAMP '2025-11-28 04:31:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    52,
    'ZAM-20260126-528983',
    TIMESTAMP '2025-12-01 13:22:46',
    'SHIPPED',
    'PAID',
    'BLIK',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    239.97,
    252.96,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL41524351',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-01 18:22:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    53,
    'ZAM-20260126-708143',
    TIMESTAMP '2025-12-08 07:09:46',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    171.96,
    184.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL90915201',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-09 01:09:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    54,
    'ZAM-20260126-218649',
    TIMESTAMP '2026-01-15 20:32:46',
    'PENDING',
    'PAID',
    'BLIK',
    'PICKUP',
    44,
    NULL,
    NULL,
    NULL,
    'ul. Główna 77/33',
    'Białystok',
    '66-655',
    'Poland',
    'ul. Główna 77/33',
    'Białystok',
    '66-655',
    'Poland',
    995.68,
    995.68,
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
    TIMESTAMP '2026-01-16 07:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    55,
    'ZAM-20260126-011229',
    TIMESTAMP '2025-12-26 01:22:46',
    'PROCESSING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Polna 91/45',
    'Warszawa',
    '78-178',
    'Poland',
    'ul. Polna 91/45',
    'Warszawa',
    '78-178',
    'Poland',
    645.97,
    645.97,
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
    TIMESTAMP '2025-12-27 22:22:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    56,
    'ZAM-20260126-790114',
    TIMESTAMP '2025-12-03 13:51:46',
    'DELIVERED',
    'PAID',
    'BLIK',
    'PICKUP',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    369.95,
    369.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL25767128',
    NULL,
    NULL,
    TIMESTAMP '2025-12-10 13:51:46',
    TIMESTAMP '2025-12-03 20:51:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    57,
    'ZAM-20260126-766841',
    TIMESTAMP '2025-12-23 01:48:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    2949.88,
    2797.39,
    12.99,
    165.48,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL95779041',
    NULL,
    NULL,
    TIMESTAMP '2025-12-26 01:48:46',
    TIMESTAMP '2025-12-24 03:48:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    58,
    'ZAM-20260126-437602',
    TIMESTAMP '2025-12-05 21:21:46',
    'PROCESSING',
    'PENDING',
    'BLIK',
    'COURIER',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    1313.91,
    1332.41,
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
    TIMESTAMP '2025-12-06 23:21:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    59,
    'ZAM-20260126-987713',
    TIMESTAMP '2025-12-06 18:13:46',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'COURIER',
    26,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 4/25',
    'Kielce',
    '83-734',
    'Poland',
    'ul. Ogrodowa 4/25',
    'Kielce',
    '83-734',
    'Poland',
    752.91,
    771.41,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL43938708',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 06:13:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    60,
    'ZAM-20260126-916715',
    TIMESTAMP '2026-01-03 23:32:46',
    'PACKED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    6,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 137/40',
    'Rzeszów',
    '71-530',
    'Poland',
    'ul. Krótka 137/40',
    'Rzeszów',
    '71-530',
    'Poland',
    779.95,
    779.95,
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
    TIMESTAMP '2026-01-04 00:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    61,
    'ZAM-20260126-485388',
    TIMESTAMP '2026-01-15 13:31:46',
    'PACKED',
    'FAILED',
    'TRANSFER',
    'LOCKER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    464.91,
    420.96,
    12.99,
    56.94,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-16 04:31:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    62,
    'ZAM-20260126-103429',
    TIMESTAMP '2025-11-29 14:46:46',
    'CONFIRMED',
    'PAID',
    'CARD',
    'LOCKER',
    48,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    'ul. Ogrodowa 21/47',
    'Rzeszów',
    '58-728',
    'Poland',
    8.99,
    21.98,
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
    TIMESTAMP '2025-11-30 01:46:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    63,
    'ZAM-20260126-804397',
    TIMESTAMP '2025-12-13 01:56:46',
    'CONFIRMED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    299.96,
    312.95,
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
    TIMESTAMP '2025-12-13 07:56:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    64,
    'ZAM-20260126-418866',
    TIMESTAMP '2026-01-06 15:18:46',
    'PACKED',
    'PENDING',
    'CARD',
    'LOCKER',
    14,
    NULL,
    NULL,
    NULL,
    'ul. Polna 91/45',
    'Warszawa',
    '78-178',
    'Poland',
    'ul. Polna 91/45',
    'Warszawa',
    '78-178',
    'Poland',
    704.91,
    717.9,
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
    TIMESTAMP '2026-01-07 11:18:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    65,
    'ZAM-20260126-543923',
    TIMESTAMP '2025-12-02 17:59:46',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    27,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    'ul. Rynek 61/4',
    'Radom',
    '56-963',
    'Poland',
    749.95,
    762.94,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL52313069',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 12:59:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    66,
    'ZAM-20260126-611996',
    TIMESTAMP '2025-12-21 07:42:46',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'COURIER',
    18,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 22/23',
    'Zabrze',
    '37-428',
    'Poland',
    'ul. Nowa 22/23',
    'Zabrze',
    '37-428',
    'Poland',
    926.92,
    945.42,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL62798180',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 03:42:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    67,
    'ZAM-20260126-536628',
    TIMESTAMP '2025-12-11 17:10:46',
    'PROCESSING',
    'PAID',
    'CARD',
    'COURIER',
    45,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    'ul. Nowa 146/25',
    'Katowice',
    '64-978',
    'Poland',
    976.07,
    994.57,
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
    TIMESTAMP '2025-12-12 01:10:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    68,
    'ZAM-20260126-501003',
    TIMESTAMP '2025-12-03 03:05:46',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'COURIER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    714.93,
    733.43,
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
    TIMESTAMP '2025-12-03 21:05:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    69,
    'ZAM-20260126-125730',
    TIMESTAMP '2026-01-20 07:32:46',
    'PROCESSING',
    'FAILED',
    'CARD',
    'COURIER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    439.89,
    458.39,
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
    TIMESTAMP '2026-01-21 23:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    70,
    'ZAM-20260126-949416',
    TIMESTAMP '2025-11-27 05:50:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    118.96,
    131.95,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-27 23:50:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-11-28 10:50:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    71,
    'ZAM-20260126-847773',
    TIMESTAMP '2025-12-22 16:21:46',
    'CONFIRMED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 37/25',
    'Kraków',
    '18-656',
    'Poland',
    'ul. Krótka 37/25',
    'Kraków',
    '18-656',
    'Poland',
    377.91,
    390.9,
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
    TIMESTAMP '2025-12-23 15:21:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    72,
    'ZAM-20260126-398696',
    TIMESTAMP '2025-12-03 22:28:46',
    'IN_TRANSIT',
    'PAID',
    'TRANSFER',
    'PICKUP',
    6,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 137/40',
    'Rzeszów',
    '71-530',
    'Poland',
    'ul. Krótka 137/40',
    'Rzeszów',
    '71-530',
    'Poland',
    1051.9,
    1051.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL22171616',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-04 00:28:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    73,
    'ZAM-20260126-826050',
    TIMESTAMP '2026-01-01 11:21:46',
    'CANCELLED',
    'CANCELLED',
    'CARD',
    'LOCKER',
    2,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 37/25',
    'Kraków',
    '18-656',
    'Poland',
    'ul. Krótka 37/25',
    'Kraków',
    '18-656',
    'Poland',
    841.91,
    854.9,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-02 02:21:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-01 12:21:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    74,
    'ZAM-20260126-585856',
    TIMESTAMP '2025-12-08 12:53:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    204.95,
    204.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 15:53:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-09 07:53:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    75,
    'ZAM-20260126-136223',
    TIMESTAMP '2025-12-07 08:21:46',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 78/41',
    'Łódź',
    '58-657',
    'Poland',
    'ul. Nowa 78/41',
    'Łódź',
    '58-657',
    'Poland',
    303.95,
    281.43,
    18.5,
    41.02,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL31826402',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-07 14:21:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    76,
    'ZAM-20260126-009241',
    TIMESTAMP '2026-01-04 09:59:46',
    'PROCESSING',
    'PAID',
    'BLIK',
    'LOCKER',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    79.96,
    92.95,
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
    TIMESTAMP '2026-01-05 08:59:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    77,
    'ZAM-20260126-638657',
    TIMESTAMP '2026-01-06 05:44:46',
    'PENDING',
    'PAID',
    'BLIK',
    'PICKUP',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    189.97,
    189.97,
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
    TIMESTAMP '2026-01-07 07:44:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    78,
    'ZAM-20260126-282909',
    TIMESTAMP '2025-12-07 11:23:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    784.97,
    706.43,
    18.5,
    97.04,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL51524047',
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 11:23:46',
    TIMESTAMP '2025-12-08 13:23:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    79,
    'ZAM-20260126-836376',
    TIMESTAMP '2026-01-20 17:40:46',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    619.95,
    619.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-20 20:40:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2026-01-21 03:40:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    80,
    'ZAM-20260126-564890',
    TIMESTAMP '2026-01-23 09:38:46',
    'PROCESSING',
    'PAID',
    'CARD',
    'PICKUP',
    51,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    'ul. Kościelna 127/35',
    'Poznań',
    '15-956',
    'Poland',
    255.95,
    255.95,
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
    TIMESTAMP '2026-01-24 00:38:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    81,
    'ZAM-20260126-746561',
    TIMESTAMP '2025-12-29 08:49:46',
    'PACKED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    394.89,
    407.88,
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
    TIMESTAMP '2025-12-30 21:49:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    82,
    'ZAM-20260126-173101',
    TIMESTAMP '2026-01-02 09:00:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'COURIER',
    44,
    NULL,
    NULL,
    NULL,
    'ul. Główna 77/33',
    'Białystok',
    '66-655',
    'Poland',
    'ul. Główna 77/33',
    'Białystok',
    '66-655',
    'Poland',
    59.97,
    78.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL22455253',
    NULL,
    NULL,
    TIMESTAMP '2026-01-07 09:00:46',
    TIMESTAMP '2026-01-04 02:00:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    83,
    'ZAM-20260126-824826',
    TIMESTAMP '2026-01-23 08:16:46',
    'DELIVERED',
    'PAID',
    'TRANSFER',
    'LOCKER',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    121.57,
    122.48,
    12.99,
    12.08,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL80510321',
    NULL,
    NULL,
    TIMESTAMP '2026-01-28 08:16:46',
    TIMESTAMP '2026-01-23 16:16:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    84,
    'ZAM-20260126-297192',
    TIMESTAMP '2025-12-13 13:43:46',
    'CANCELLED',
    'CANCELLED',
    'BLIK',
    'PICKUP',
    8,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    'ul. Ogrodowa 95/47',
    'Poznań',
    '20-971',
    'Poland',
    825.92,
    825.92,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-14 11:43:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-14 13:43:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    85,
    'ZAM-20260126-983774',
    TIMESTAMP '2026-01-18 06:08:46',
    'PROCESSING',
    'FAILED',
    'BLIK',
    'COURIER',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    19.99,
    38.49,
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
    TIMESTAMP '2026-01-18 11:08:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    86,
    'ZAM-20260126-266204',
    TIMESTAMP '2025-12-01 10:07:46',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    46,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    'ul. Łąkowa 3/36',
    'Katowice',
    '88-140',
    'Poland',
    99.96,
    99.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL40960020',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-02 21:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    87,
    'ZAM-20260126-921214',
    TIMESTAMP '2025-12-10 15:20:46',
    'SHIPPED',
    'PAID',
    'CARD',
    'COURIER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    930.41,
    948.91,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL50540956',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-11 08:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    88,
    'ZAM-20260126-607714',
    TIMESTAMP '2026-01-21 20:00:46',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 108/40',
    'Warszawa',
    '60-754',
    'Poland',
    'ul. Zielona 108/40',
    'Warszawa',
    '60-754',
    'Poland',
    219.96,
    238.46,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL49243263',
    NULL,
    NULL,
    TIMESTAMP '2026-01-23 20:00:46',
    TIMESTAMP '2026-01-21 22:00:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    89,
    'ZAM-20260126-121652',
    TIMESTAMP '2026-01-26 08:30:46',
    'SHIPPED',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    98.98,
    111.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL10851814',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-27 02:30:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    90,
    'ZAM-20260126-800467',
    TIMESTAMP '2025-12-20 00:32:46',
    'CONFIRMED',
    'FAILED',
    'CASH_ON_DELIVERY',
    'PICKUP',
    31,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    'ul. Zielona 121/17',
    'Łódź',
    '21-908',
    'Poland',
    1325.91,
    1325.91,
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
    TIMESTAMP '2025-12-21 16:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    91,
    'ZAM-20260126-515110',
    TIMESTAMP '2025-12-21 08:28:46',
    'PENDING',
    'FAILED',
    'CARD',
    'PICKUP',
    7,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    'ul. Kolejowa 150/4',
    'Poznań',
    '93-180',
    'Poland',
    29.99,
    29.99,
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
    TIMESTAMP '2025-12-23 03:28:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    92,
    'ZAM-20260126-529351',
    TIMESTAMP '2025-11-27 02:37:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    49,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    'ul. Rynek 12/40',
    'Kraków',
    '17-562',
    'Poland',
    1020.38,
    931.23,
    12.99,
    102.14,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-11-27 09:37:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-11-27 04:37:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    93,
    'ZAM-20260126-403822',
    TIMESTAMP '2025-12-13 11:25:46',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    485.94,
    498.93,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 12:25:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-13 17:25:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    94,
    'ZAM-20260126-107529',
    TIMESTAMP '2025-12-23 04:23:46',
    'CONFIRMED',
    'FAILED',
    'BLIK',
    'LOCKER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    1305.4,
    1232.16,
    12.99,
    86.23,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-24 01:23:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    95,
    'ZAM-20260126-394530',
    TIMESTAMP '2026-01-17 20:48:46',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    25,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    'ul. Kościelna 126/44',
    'Szczecin',
    '19-451',
    'Poland',
    259.98,
    278.48,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL72528844',
    NULL,
    NULL,
    TIMESTAMP '2026-01-22 20:48:46',
    TIMESTAMP '2026-01-18 02:48:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    96,
    'ZAM-20260126-421672',
    TIMESTAMP '2026-01-24 05:27:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    38,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 148/3',
    'Katowice',
    '52-507',
    'Poland',
    'ul. Rynek 148/3',
    'Katowice',
    '52-507',
    'Poland',
    119.98,
    132.97,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL33742867',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-24 15:27:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    97,
    'ZAM-20260126-725212',
    TIMESTAMP '2026-01-10 23:28:46',
    'SHIPPED',
    'PAID',
    'CARD',
    'LOCKER',
    39,
    NULL,
    NULL,
    NULL,
    'ul. Polna 142/13',
    'Rzeszów',
    '69-216',
    'Poland',
    'ul. Polna 142/13',
    'Rzeszów',
    '69-216',
    'Poland',
    614.93,
    573.19,
    12.99,
    54.73,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL31763420',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-12 06:28:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    98,
    'ZAM-20260126-357222',
    TIMESTAMP '2026-01-24 06:45:46',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'LOCKER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    888.91,
    901.9,
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
    TIMESTAMP '2026-01-24 17:45:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    99,
    'ZAM-20260126-008424',
    TIMESTAMP '2025-12-13 22:47:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    43,
    NULL,
    NULL,
    NULL,
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    'ul. Wodna 87/41',
    'Lublin',
    '29-945',
    'Poland',
    48.99,
    48.99,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL11826095',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-13 23:47:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    100,
    'ZAM-20260126-446649',
    TIMESTAMP '2026-01-14 20:20:46',
    'PROCESSING',
    'PAID',
    'TRANSFER',
    'PICKUP',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    1369.92,
    1369.92,
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
    TIMESTAMP '2026-01-15 07:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    101,
    'ZAM-20260126-566509',
    TIMESTAMP '2025-12-18 11:08:46',
    'PROCESSING',
    'PAID',
    'CARD',
    'PICKUP',
    30,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 31/28',
    'Rzeszów',
    '43-199',
    'Poland',
    'ul. Szkolna 31/28',
    'Rzeszów',
    '43-199',
    'Poland',
    579.95,
    579.95,
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
    TIMESTAMP '2025-12-19 13:08:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    102,
    'ZAM-20260126-762008',
    TIMESTAMP '2026-01-12 16:39:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    5,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 101/17',
    'Szczecin',
    '39-967',
    'Poland',
    'ul. Kościelna 101/17',
    'Szczecin',
    '39-967',
    'Poland',
    369.97,
    369.97,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL13113968',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-13 17:39:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    103,
    'ZAM-20260126-033412',
    TIMESTAMP '2026-01-13 17:32:46',
    'PACKED',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    40,
    NULL,
    NULL,
    NULL,
    'ul. Nowa 78/41',
    'Łódź',
    '58-657',
    'Poland',
    'ul. Nowa 78/41',
    'Łódź',
    '58-657',
    'Poland',
    14.99,
    14.99,
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
    TIMESTAMP '2026-01-14 06:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    104,
    'ZAM-20260126-046852',
    TIMESTAMP '2025-12-06 12:53:46',
    'PENDING',
    'FAILED',
    'BLIK',
    'LOCKER',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    479.95,
    449.75,
    12.99,
    43.19,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-08 09:53:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    105,
    'ZAM-20260126-900080',
    TIMESTAMP '2025-12-03 06:19:46',
    'PROCESSING',
    'PAID',
    'TRANSFER',
    'LOCKER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    749.98,
    762.97,
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
    TIMESTAMP '2025-12-04 11:19:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    106,
    'ZAM-20260126-155526',
    TIMESTAMP '2025-12-29 14:36:46',
    'SHIPPED',
    'PAID',
    'TRANSFER',
    'PICKUP',
    37,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    'ul. Zielona 91/34',
    'Kielce',
    '20-268',
    'Poland',
    109.96,
    109.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL90462622',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-30 00:36:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    107,
    'ZAM-20260126-947855',
    TIMESTAMP '2025-12-19 10:44:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    151.95,
    151.95,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL95336655',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-20 17:44:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    108,
    'ZAM-20260126-088951',
    TIMESTAMP '2025-12-28 01:37:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'LOCKER',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 130/24',
    'Łódź',
    '94-906',
    'Poland',
    'ul. Słoneczna 130/24',
    'Łódź',
    '94-906',
    'Poland',
    242.94,
    255.93,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL67710071',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-28 05:37:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    109,
    'ZAM-20260126-951190',
    TIMESTAMP '2025-12-22 02:20:46',
    'PENDING',
    'PENDING',
    'BLIK',
    'PICKUP',
    16,
    NULL,
    NULL,
    NULL,
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    'ul. Kościelna 122/34',
    'Gdańsk',
    '39-298',
    'Poland',
    1308.89,
    1182.03,
    0.0,
    126.86,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-23 15:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    110,
    'ZAM-20260126-170699',
    TIMESTAMP '2026-01-19 17:04:46',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'PICKUP',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    364.96,
    364.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL98723035',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-21 00:04:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    111,
    'ZAM-20260126-618202',
    TIMESTAMP '2026-01-23 10:16:46',
    'DELIVERED',
    'PAID',
    'CARD',
    'PICKUP',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    1017.89,
    1017.89,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL83968615',
    NULL,
    NULL,
    TIMESTAMP '2026-01-30 10:16:46',
    TIMESTAMP '2026-01-24 06:16:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    112,
    'ZAM-20260126-437505',
    TIMESTAMP '2026-01-03 04:07:46',
    'IN_TRANSIT',
    'PAID',
    'BLIK',
    'PICKUP',
    47,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    'ul. Piaskowa 104/12',
    'Lublin',
    '71-857',
    'Poland',
    563.96,
    563.96,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL73042118',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2026-01-04 07:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    113,
    'ZAM-20260126-780450',
    TIMESTAMP '2025-12-11 10:38:46',
    'PENDING',
    'PAID',
    'TRANSFER',
    'LOCKER',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    324.88,
    337.87,
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
    TIMESTAMP '2025-12-12 12:38:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    114,
    'ZAM-20260126-003379',
    TIMESTAMP '2025-12-18 08:00:46',
    'CONFIRMED',
    'PENDING',
    'TRANSFER',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    504.91,
    517.9,
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
    TIMESTAMP '2025-12-18 22:00:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    115,
    'ZAM-20260126-802862',
    TIMESTAMP '2026-01-03 22:24:46',
    'PACKED',
    'PENDING',
    'CASH_ON_DELIVERY',
    'PICKUP',
    36,
    NULL,
    NULL,
    NULL,
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    'ul. Kolejowa 65/20',
    'Poznań',
    '54-534',
    'Poland',
    875.94,
    875.94,
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
    TIMESTAMP '2026-01-04 14:24:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    116,
    'ZAM-20260126-263234',
    TIMESTAMP '2025-12-03 04:42:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'COURIER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    384.93,
    403.43,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-03 21:42:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-03 11:42:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    117,
    'ZAM-20260126-127416',
    TIMESTAMP '2025-12-10 18:15:46',
    'PACKED',
    'PAID',
    'CARD',
    'LOCKER',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    16.18,
    29.17,
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
    TIMESTAMP '2025-12-11 08:15:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    118,
    'ZAM-20260126-531200',
    TIMESTAMP '2025-12-11 23:20:46',
    'CANCELLED',
    'CANCELLED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    139.92,
    152.91,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-12 11:20:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-12 05:20:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    119,
    'ZAM-20260126-279590',
    TIMESTAMP '2025-12-05 19:53:46',
    'IN_TRANSIT',
    'PAID',
    'CARD',
    'LOCKER',
    10,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    'ul. Krótka 53/5',
    'Gdynia',
    '67-372',
    'Poland',
    1021.43,
    1034.42,
    12.99,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL56060837',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-05 23:53:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    120,
    'ZAM-20260126-529979',
    TIMESTAMP '2026-01-12 17:14:46',
    'PENDING',
    'PENDING',
    'CASH_ON_DELIVERY',
    'COURIER',
    20,
    NULL,
    NULL,
    NULL,
    'ul. Łąkowa 115/33',
    'Częstochowa',
    '60-922',
    'Poland',
    'ul. Łąkowa 115/33',
    'Częstochowa',
    '60-922',
    'Poland',
    159.97,
    178.47,
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
    TIMESTAMP '2026-01-14 16:14:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    121,
    'ZAM-20260126-964543',
    TIMESTAMP '2026-01-19 11:03:46',
    'CONFIRMED',
    'PAID',
    'BLIK',
    'LOCKER',
    42,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    'ul. Rynek 119/15',
    'Radom',
    '81-650',
    'Poland',
    157.96,
    170.95,
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
    TIMESTAMP '2026-01-20 20:03:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    122,
    'ZAM-20260126-023681',
    TIMESTAMP '2025-12-06 13:18:46',
    'PROCESSING',
    'PAID',
    'CASH_ON_DELIVERY',
    'LOCKER',
    28,
    NULL,
    NULL,
    NULL,
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
    'Poland',
    'ul. Krótka 7/9',
    'Białystok',
    '34-140',
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
    TIMESTAMP '2025-12-07 14:18:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    123,
    'ZAM-20260126-906844',
    TIMESTAMP '2025-12-30 07:31:46',
    'PENDING',
    'FAILED',
    'CASH_ON_DELIVERY',
    'LOCKER',
    19,
    NULL,
    NULL,
    NULL,
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    'ul. Szkolna 116/19',
    'Bydgoszcz',
    '52-645',
    'Poland',
    149.99,
    162.98,
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
    TIMESTAMP '2025-12-30 21:31:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    124,
    'ZAM-20260126-265160',
    TIMESTAMP '2026-01-17 09:07:46',
    'PACKED',
    'PAID',
    'CASH_ON_DELIVERY',
    'PICKUP',
    35,
    NULL,
    NULL,
    NULL,
    'ul. Słoneczna 130/24',
    'Łódź',
    '94-906',
    'Poland',
    'ul. Słoneczna 130/24',
    'Łódź',
    '94-906',
    'Poland',
    116.07,
    116.07,
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
    TIMESTAMP '2026-01-19 03:07:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    125,
    'ZAM-20260126-946471',
    TIMESTAMP '2025-12-07 22:55:46',
    'PACKED',
    'PENDING',
    'TRANSFER',
    'PICKUP',
    21,
    NULL,
    NULL,
    NULL,
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    'ul. Piaskowa 114/29',
    'Bydgoszcz',
    '45-475',
    'Poland',
    44.97,
    44.97,
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
    TIMESTAMP '2025-12-08 07:55:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    126,
    'ZAM-20260126-442459',
    TIMESTAMP '2025-12-08 20:35:46',
    'PACKED',
    'FAILED',
    'CARD',
    'PICKUP',
    22,
    NULL,
    NULL,
    NULL,
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    'ul. Rynek 91/42',
    'Łódź',
    '96-868',
    'Poland',
    858.92,
    858.92,
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
    TIMESTAMP '2025-12-10 04:35:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    127,
    'ZAM-20260126-656311',
    TIMESTAMP '2026-01-22 15:47:46',
    'DELIVERED',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    33,
    NULL,
    NULL,
    NULL,
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    'ul. Główna 124/47',
    'Białystok',
    '54-373',
    'Poland',
    729.94,
    748.44,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL48545247',
    NULL,
    NULL,
    TIMESTAMP '2026-01-25 15:47:46',
    TIMESTAMP '2026-01-24 09:47:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    128,
    'ZAM-20260126-848206',
    TIMESTAMP '2026-01-05 08:32:46',
    'PACKED',
    'FAILED',
    'CARD',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    119.96,
    132.95,
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
    TIMESTAMP '2026-01-07 00:32:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    129,
    'ZAM-20260126-548775',
    TIMESTAMP '2025-12-28 14:11:46',
    'IN_TRANSIT',
    'PAID',
    'CASH_ON_DELIVERY',
    'COURIER',
    9,
    NULL,
    NULL,
    NULL,
    'ul. Zielona 108/40',
    'Warszawa',
    '60-754',
    'Poland',
    'ul. Zielona 108/40',
    'Warszawa',
    '60-754',
    'Poland',
    299.97,
    318.47,
    18.5,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    'PL68786809',
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 00:11:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    130,
    'ZAM-20260126-061874',
    TIMESTAMP '2025-12-28 18:01:46',
    'CANCELLED',
    'CANCELLED',
    'TRANSFER',
    'PICKUP',
    23,
    NULL,
    NULL,
    NULL,
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    'ul. Ogrodowa 108/30',
    'Gdańsk',
    '31-873',
    'Poland',
    501.9,
    501.9,
    0.0,
    0.0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    TIMESTAMP '2025-12-29 15:01:46',
    'Anulowane przez klienta',
    NULL,
    TIMESTAMP '2025-12-29 02:01:46'
);
INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    131,
    'ZAM-20260126-328378',
    TIMESTAMP '2025-12-28 12:24:46',
    'PACKED',
    'PAID',
    'BLIK',
    'LOCKER',
    24,
    NULL,
    NULL,
    NULL,
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    'ul. Parkowa 3/43',
    'Kraków',
    '50-796',
    'Poland',
    669.91,
    682.9,
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
    TIMESTAMP '2025-12-28 23:24:46'
);

-- Insert order items
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    1,
    18,
    3,
    189.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    2,
    51,
    3,
    19.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    3,
    3,
    1,
    359.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    4,
    63,
    3,
    49.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    5,
    57,
    1,
    149.99,
    1
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    6,
    2,
    3,
    149.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    7,
    27,
    1,
    19.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    8,
    25,
    1,
    8.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    9,
    61,
    1,
    53.99,
    2
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    10,
    3,
    3,
    359.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    11,
    57,
    3,
    149.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    12,
    20,
    3,
    89.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    13,
    67,
    3,
    89.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    14,
    42,
    2,
    249.99,
    3
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    15,
    52,
    1,
    12.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    16,
    56,
    1,
    23.99,
    4
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    17,
    69,
    3,
    35.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    18,
    21,
    2,
    269.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    19,
    59,
    1,
    359.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    20,
    58,
    1,
    129.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    21,
    45,
    1,
    29.99,
    5
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    22,
    9,
    1,
    59.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    23,
    27,
    1,
    19.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    24,
    15,
    2,
    79.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    25,
    53,
    3,
    79.99,
    6
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    26,
    37,
    2,
    21.59,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    27,
    17,
    2,
    34.99,
    7
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    28,
    51,
    1,
    19.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    29,
    71,
    1,
    39.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    30,
    22,
    2,
    229.99,
    8
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    31,
    35,
    2,
    24.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    32,
    34,
    3,
    69.99,
    9
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    33,
    15,
    3,
    79.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    34,
    3,
    3,
    359.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    35,
    49,
    1,
    14.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    36,
    11,
    2,
    39.99,
    10
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    37,
    36,
    2,
    39.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    38,
    48,
    1,
    7.99,
    11
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    39,
    22,
    1,
    229.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    40,
    14,
    2,
    29.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    41,
    27,
    2,
    19.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    42,
    18,
    3,
    189.99,
    12
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    43,
    27,
    2,
    19.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    44,
    33,
    2,
    49.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    45,
    56,
    3,
    23.99,
    13
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    46,
    38,
    2,
    19.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    47,
    7,
    1,
    8.09,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    48,
    62,
    1,
    48.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    49,
    52,
    2,
    12.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    50,
    47,
    3,
    49.99,
    14
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    51,
    30,
    1,
    59.99,
    15
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    52,
    33,
    2,
    49.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    53,
    7,
    1,
    8.09,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    54,
    49,
    1,
    14.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    55,
    61,
    2,
    53.99,
    16
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    56,
    66,
    1,
    509.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    57,
    41,
    1,
    31.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    58,
    54,
    3,
    39.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    59,
    22,
    3,
    229.99,
    17
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    60,
    6,
    1,
    5.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    61,
    11,
    3,
    39.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    62,
    68,
    2,
    67.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    63,
    18,
    2,
    189.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    64,
    70,
    1,
    49.99,
    18
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    65,
    14,
    1,
    29.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    66,
    71,
    1,
    39.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    67,
    49,
    1,
    14.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    68,
    34,
    2,
    69.99,
    19
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    69,
    50,
    3,
    297.49,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    70,
    16,
    2,
    89.99,
    20
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    71,
    65,
    2,
    34.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    72,
    56,
    2,
    23.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    73,
    29,
    1,
    79.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    74,
    26,
    1,
    9.09,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    75,
    48,
    3,
    7.99,
    21
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    76,
    43,
    3,
    14.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    77,
    14,
    1,
    29.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    78,
    26,
    3,
    9.09,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    79,
    49,
    2,
    14.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    80,
    30,
    2,
    59.99,
    22
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    81,
    22,
    1,
    229.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    82,
    41,
    1,
    31.99,
    23
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    83,
    5,
    3,
    239.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    84,
    67,
    3,
    89.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    85,
    66,
    1,
    509.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    86,
    54,
    1,
    39.99,
    24
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    87,
    12,
    2,
    103.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    88,
    29,
    2,
    79.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    89,
    15,
    1,
    79.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    90,
    39,
    3,
    9.99,
    25
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    91,
    14,
    2,
    29.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    92,
    44,
    2,
    19.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    93,
    62,
    3,
    48.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    94,
    69,
    2,
    35.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    95,
    53,
    3,
    79.99,
    26
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    96,
    9,
    1,
    59.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    97,
    1,
    1,
    289.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    98,
    14,
    1,
    29.99,
    27
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    99,
    34,
    1,
    69.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    100,
    30,
    2,
    59.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    101,
    8,
    2,
    24.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    102,
    54,
    1,
    39.99,
    28
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    103,
    44,
    3,
    19.99,
    29
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    104,
    52,
    1,
    12.99,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    105,
    49,
    3,
    14.99,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    106,
    43,
    1,
    14.99,
    30
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    107,
    33,
    2,
    49.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    108,
    66,
    3,
    509.99,
    31
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    109,
    9,
    1,
    59.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    110,
    69,
    2,
    35.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    111,
    55,
    1,
    35.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    112,
    53,
    1,
    79.99,
    32
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    113,
    60,
    2,
    37.49,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    114,
    44,
    1,
    19.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    115,
    43,
    3,
    14.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    116,
    64,
    1,
    39.99,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    117,
    50,
    2,
    297.49,
    33
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    118,
    4,
    2,
    319.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    119,
    68,
    2,
    67.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    120,
    24,
    2,
    4.49,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    121,
    8,
    2,
    24.99,
    34
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    122,
    56,
    3,
    23.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    123,
    12,
    1,
    103.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    124,
    58,
    3,
    129.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    125,
    22,
    2,
    229.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    126,
    29,
    3,
    79.99,
    35
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    127,
    30,
    3,
    59.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    128,
    33,
    3,
    49.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    129,
    28,
    2,
    49.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    130,
    71,
    3,
    39.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    131,
    55,
    1,
    35.99,
    36
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    132,
    51,
    1,
    19.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    133,
    29,
    2,
    79.99,
    37
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    134,
    68,
    2,
    67.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    135,
    17,
    1,
    34.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    136,
    61,
    1,
    53.99,
    38
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    137,
    10,
    1,
    14.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    138,
    50,
    3,
    297.49,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    139,
    64,
    1,
    39.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    140,
    59,
    2,
    359.99,
    39
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    141,
    39,
    2,
    9.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    142,
    68,
    1,
    67.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    143,
    32,
    2,
    29.99,
    40
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    144,
    64,
    2,
    39.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    145,
    31,
    1,
    89.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    146,
    14,
    3,
    29.99,
    41
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    147,
    54,
    2,
    39.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    148,
    14,
    1,
    29.99,
    42
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    149,
    39,
    2,
    9.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    150,
    67,
    1,
    89.99,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    151,
    50,
    3,
    297.49,
    43
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    152,
    10,
    2,
    14.99,
    44
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    153,
    16,
    2,
    89.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    154,
    42,
    2,
    249.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    155,
    48,
    2,
    7.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    156,
    13,
    3,
    149.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    157,
    11,
    2,
    39.99,
    45
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    158,
    45,
    3,
    29.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    159,
    53,
    1,
    79.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    160,
    21,
    1,
    269.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    161,
    58,
    2,
    129.99,
    46
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    162,
    40,
    3,
    22.49,
    47
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    163,
    6,
    1,
    5.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    164,
    59,
    1,
    359.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    165,
    12,
    3,
    103.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    166,
    3,
    2,
    359.99,
    48
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    167,
    4,
    3,
    319.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    168,
    6,
    2,
    5.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    169,
    54,
    2,
    39.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    170,
    71,
    1,
    39.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    171,
    5,
    3,
    239.99,
    49
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    172,
    29,
    3,
    79.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    173,
    11,
    1,
    39.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    174,
    5,
    1,
    239.99,
    50
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    175,
    28,
    2,
    49.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    176,
    53,
    3,
    79.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    177,
    16,
    3,
    89.99,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    178,
    26,
    2,
    9.09,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    179,
    37,
    3,
    21.59,
    51
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    180,
    15,
    3,
    79.99,
    52
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    181,
    33,
    2,
    49.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    182,
    69,
    2,
    35.99,
    53
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    183,
    22,
    3,
    229.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    184,
    27,
    2,
    19.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    185,
    7,
    3,
    8.09,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    186,
    60,
    1,
    37.49,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    187,
    68,
    3,
    67.99,
    54
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    188,
    4,
    2,
    319.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    189,
    6,
    1,
    5.99,
    55
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    190,
    43,
    2,
    14.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    191,
    57,
    2,
    149.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    192,
    36,
    1,
    39.99,
    56
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    193,
    4,
    3,
    319.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    194,
    1,
    3,
    289.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    195,
    57,
    2,
    149.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    196,
    18,
    3,
    189.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    197,
    42,
    1,
    249.99,
    57
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    198,
    54,
    2,
    39.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    199,
    70,
    3,
    49.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    200,
    66,
    2,
    509.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    201,
    41,
    2,
    31.99,
    58
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    202,
    15,
    2,
    79.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    203,
    2,
    3,
    149.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    204,
    17,
    1,
    34.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    205,
    69,
    3,
    35.99,
    59
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    206,
    5,
    3,
    239.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    207,
    45,
    2,
    29.99,
    60
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    208,
    31,
    3,
    89.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    209,
    10,
    3,
    14.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    210,
    28,
    3,
    49.99,
    61
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    211,
    25,
    1,
    8.99,
    62
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    212,
    30,
    1,
    59.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    213,
    15,
    3,
    79.99,
    63
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    214,
    35,
    2,
    24.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    215,
    70,
    3,
    49.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    216,
    40,
    2,
    22.49,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    217,
    22,
    2,
    229.99,
    64
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    218,
    18,
    3,
    189.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    219,
    31,
    2,
    89.99,
    65
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    220,
    21,
    3,
    269.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    221,
    55,
    2,
    35.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    222,
    10,
    3,
    14.99,
    66
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    223,
    43,
    3,
    14.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    224,
    37,
    2,
    21.59,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    225,
    55,
    3,
    35.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    226,
    21,
    2,
    269.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    227,
    29,
    3,
    79.99,
    67
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    228,
    16,
    1,
    89.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    229,
    45,
    3,
    29.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    230,
    42,
    2,
    249.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    231,
    65,
    1,
    34.99,
    68
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    232,
    55,
    3,
    35.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    233,
    36,
    2,
    39.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    234,
    43,
    1,
    14.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    235,
    60,
    2,
    37.49,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    236,
    61,
    3,
    53.99,
    69
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    237,
    29,
    1,
    79.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    238,
    52,
    3,
    12.99,
    70
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    239,
    63,
    3,
    49.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    240,
    28,
    3,
    49.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    241,
    56,
    2,
    23.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    242,
    32,
    1,
    29.99,
    71
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    243,
    44,
    1,
    19.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    244,
    12,
    3,
    103.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    245,
    58,
    2,
    129.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    246,
    64,
    2,
    39.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    247,
    18,
    2,
    189.99,
    72
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    248,
    49,
    3,
    14.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    249,
    69,
    3,
    35.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    250,
    4,
    2,
    319.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    251,
    62,
    1,
    48.99,
    73
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    252,
    53,
    2,
    79.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    253,
    43,
    3,
    14.99,
    74
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    254,
    48,
    3,
    7.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    255,
    2,
    1,
    149.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    256,
    58,
    1,
    129.99,
    75
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    257,
    35,
    1,
    24.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    258,
    49,
    2,
    14.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    259,
    46,
    1,
    24.99,
    76
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    260,
    30,
    2,
    59.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    261,
    34,
    1,
    69.99,
    77
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    262,
    18,
    1,
    189.99,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    263,
    50,
    2,
    297.49,
    78
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    264,
    36,
    2,
    39.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    265,
    57,
    2,
    149.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    266,
    5,
    1,
    239.99,
    79
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    267,
    53,
    1,
    79.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    268,
    29,
    1,
    79.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    269,
    41,
    3,
    31.99,
    80
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    270,
    38,
    3,
    19.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    271,
    62,
    3,
    48.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    272,
    48,
    1,
    7.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    273,
    71,
    2,
    39.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    274,
    63,
    2,
    49.99,
    81
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    275,
    27,
    3,
    19.99,
    82
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    276,
    37,
    1,
    21.59,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    277,
    63,
    2,
    49.99,
    83
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    278,
    70,
    2,
    49.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    279,
    53,
    3,
    79.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    280,
    3,
    1,
    359.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    281,
    16,
    1,
    89.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    282,
    69,
    1,
    35.99,
    84
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    283,
    44,
    1,
    19.99,
    85
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    284,
    39,
    2,
    9.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    285,
    36,
    2,
    39.99,
    86
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    286,
    68,
    3,
    67.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    287,
    32,
    2,
    29.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    288,
    24,
    2,
    4.49,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    289,
    3,
    1,
    359.99,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    290,
    50,
    1,
    297.49,
    87
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    291,
    67,
    2,
    89.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    292,
    38,
    2,
    19.99,
    88
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    293,
    62,
    1,
    48.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    294,
    28,
    1,
    49.99,
    89
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    295,
    23,
    2,
    32.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    296,
    71,
    2,
    39.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    297,
    3,
    3,
    359.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    298,
    70,
    2,
    49.99,
    90
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    299,
    14,
    1,
    29.99,
    91
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    300,
    13,
    3,
    149.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    301,
    24,
    1,
    4.49,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    302,
    52,
    2,
    12.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    303,
    58,
    3,
    129.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    304,
    70,
    3,
    49.99,
    92
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    305,
    29,
    3,
    79.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    306,
    69,
    1,
    35.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    307,
    15,
    1,
    79.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    308,
    58,
    1,
    129.99,
    93
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    309,
    60,
    1,
    37.49,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    310,
    4,
    3,
    319.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    311,
    6,
    3,
    5.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    312,
    38,
    2,
    19.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    313,
    42,
    1,
    249.99,
    94
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    314,
    58,
    2,
    129.99,
    95
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    315,
    30,
    2,
    59.99,
    96
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    316,
    15,
    1,
    79.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    317,
    34,
    3,
    69.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    318,
    19,
    1,
    249.99,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    319,
    60,
    2,
    37.49,
    97
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    320,
    32,
    2,
    29.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    321,
    50,
    2,
    297.49,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    322,
    68,
    3,
    67.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    323,
    43,
    2,
    14.99,
    98
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    324,
    62,
    1,
    48.99,
    99
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    325,
    63,
    3,
    49.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    326,
    4,
    3,
    319.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    327,
    58,
    2,
    129.99,
    100
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    328,
    57,
    3,
    149.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    329,
    54,
    1,
    39.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    330,
    67,
    1,
    89.99,
    101
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    331,
    35,
    2,
    24.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    332,
    4,
    1,
    319.99,
    102
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    333,
    10,
    1,
    14.99,
    103
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    334,
    57,
    3,
    149.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    335,
    10,
    2,
    14.99,
    104
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    336,
    5,
    1,
    239.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    337,
    66,
    1,
    509.99,
    105
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    338,
    63,
    1,
    49.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    339,
    44,
    3,
    19.99,
    106
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    340,
    41,
    1,
    31.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    341,
    27,
    2,
    19.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    342,
    64,
    2,
    39.99,
    107
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    343,
    55,
    1,
    35.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    344,
    16,
    2,
    89.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    345,
    25,
    3,
    8.99,
    108
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    346,
    21,
    3,
    269.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    347,
    62,
    1,
    48.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    348,
    9,
    1,
    59.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    349,
    53,
    3,
    79.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    350,
    47,
    3,
    49.99,
    109
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    351,
    4,
    1,
    319.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    352,
    49,
    3,
    14.99,
    110
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    353,
    15,
    3,
    79.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    354,
    1,
    2,
    289.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    355,
    10,
    3,
    14.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    356,
    52,
    1,
    12.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    357,
    34,
    2,
    69.99,
    111
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    358,
    18,
    2,
    189.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    359,
    58,
    1,
    129.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    360,
    61,
    1,
    53.99,
    112
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    361,
    44,
    3,
    19.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    362,
    47,
    2,
    49.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    363,
    38,
    2,
    19.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    364,
    39,
    2,
    9.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    365,
    65,
    3,
    34.99,
    113
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    366,
    14,
    3,
    29.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    367,
    13,
    2,
    149.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    368,
    38,
    2,
    19.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    369,
    36,
    1,
    39.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    370,
    65,
    1,
    34.99,
    114
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    371,
    64,
    1,
    39.99,
    115
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    372,
    68,
    2,
    67.99,
    115
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    373,
    4,
    2,
    319.99,
    115
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    374,
    30,
    1,
    59.99,
    115
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    375,
    40,
    2,
    22.49,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    376,
    63,
    1,
    49.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    377,
    20,
    3,
    89.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    378,
    27,
    1,
    19.99,
    116
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    379,
    7,
    2,
    8.09,
    117
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    380,
    70,
    1,
    49.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    381,
    10,
    2,
    14.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    382,
    23,
    1,
    32.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    383,
    25,
    1,
    8.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    384,
    6,
    3,
    5.99,
    118
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    385,
    23,
    1,
    32.99,
    119
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    386,
    41,
    3,
    31.99,
    119
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    387,
    50,
    3,
    297.49,
    119
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    388,
    11,
    1,
    39.99,
    120
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    389,
    9,
    2,
    59.99,
    120
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    390,
    47,
    3,
    49.99,
    121
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    391,
    48,
    1,
    7.99,
    121
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    392,
    14,
    3,
    29.99,
    122
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    393,
    57,
    1,
    149.99,
    123
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    394,
    7,
    1,
    8.09,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    395,
    61,
    2,
    53.99,
    124
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    396,
    49,
    3,
    14.99,
    125
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    397,
    9,
    3,
    59.99,
    126
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    398,
    1,
    2,
    289.99,
    126
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    399,
    23,
    3,
    32.99,
    126
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    400,
    4,
    1,
    319.99,
    127
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    401,
    34,
    2,
    69.99,
    127
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    402,
    20,
    3,
    89.99,
    127
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    403,
    27,
    3,
    19.99,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    404,
    30,
    1,
    59.99,
    128
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    405,
    20,
    1,
    89.99,
    129
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    406,
    30,
    1,
    59.99,
    129
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    407,
    2,
    1,
    149.99,
    129
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    408,
    63,
    3,
    49.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    409,
    67,
    3,
    89.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    410,
    25,
    2,
    8.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    411,
    41,
    2,
    31.99,
    130
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    412,
    31,
    1,
    89.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    413,
    28,
    3,
    49.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    414,
    53,
    2,
    79.99,
    131
);
INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    415,
    20,
    3,
    89.99,
    131
);

-- Insert reviews
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    1,
    66,
    46,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-19 08:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    2,
    18,
    41,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-23 19:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    3,
    43,
    4,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-25 19:46:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    4,
    62,
    30,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-10 18:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    5,
    42,
    47,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-10 05:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    6,
    34,
    45,
    'REJECTED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-14 11:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    7,
    12,
    39,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-15 00:50:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    8,
    18,
    2,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-02 01:44:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    9,
    40,
    32,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-14 20:15:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    10,
    52,
    39,
    'APPROVED',
    3,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-07 14:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    11,
    68,
    47,
    'REJECTED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-08 07:26:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    12,
    53,
    17,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-03 01:37:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    13,
    9,
    39,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-18 18:37:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    14,
    67,
    20,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-08 17:20:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    15,
    64,
    43,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-19 22:58:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    16,
    46,
    11,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-27 17:02:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    17,
    64,
    20,
    'PENDING',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-28 12:19:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    18,
    64,
    31,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-17 04:17:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    19,
    59,
    46,
    'PENDING',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-28 13:24:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    20,
    12,
    27,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-12 01:39:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    21,
    26,
    15,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-28 14:55:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    22,
    35,
    10,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-08 05:07:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    23,
    27,
    19,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-02 17:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    24,
    48,
    48,
    'REJECTED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-12 16:01:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    25,
    13,
    48,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2026-01-16 21:59:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    26,
    54,
    6,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-09 02:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    27,
    1,
    8,
    'PENDING',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-24 04:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    28,
    66,
    15,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-14 06:22:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    29,
    68,
    48,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-17 13:17:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    30,
    3,
    33,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-02 22:41:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    31,
    25,
    28,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-13 00:56:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    32,
    31,
    25,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-23 18:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    33,
    58,
    32,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-12 09:07:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    34,
    9,
    21,
    'APPROVED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-16 04:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    35,
    71,
    22,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-24 18:17:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    36,
    48,
    32,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-23 18:24:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    37,
    10,
    22,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-22 02:06:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    38,
    71,
    38,
    'REJECTED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-02 12:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    39,
    19,
    11,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-10 08:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    40,
    66,
    11,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-06 19:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    41,
    8,
    50,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-13 12:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    42,
    49,
    47,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-06 01:28:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    43,
    5,
    11,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-13 01:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    44,
    49,
    39,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-09 22:02:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    45,
    29,
    13,
    'APPROVED',
    3,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-12 20:06:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    46,
    24,
    32,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-24 20:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    47,
    12,
    23,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-10 05:54:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    48,
    14,
    6,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-22 04:46:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    49,
    18,
    21,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-07 06:34:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    50,
    16,
    51,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-26 00:40:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    51,
    67,
    47,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-30 23:53:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    52,
    14,
    2,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-15 04:56:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    53,
    35,
    25,
    'APPROVED',
    3,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-26 11:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    54,
    51,
    39,
    'APPROVED',
    3,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-09 06:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    55,
    31,
    43,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-06 12:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    56,
    58,
    3,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-20 22:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    57,
    12,
    7,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-31 07:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    58,
    62,
    22,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-13 21:53:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    59,
    40,
    31,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-15 01:46:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    60,
    15,
    32,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-30 04:18:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    61,
    54,
    31,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-14 10:40:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    62,
    1,
    33,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-12 01:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    63,
    14,
    35,
    'REJECTED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-19 11:38:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    64,
    40,
    32,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-22 18:20:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    65,
    15,
    31,
    'REJECTED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-21 09:26:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    66,
    12,
    25,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-15 01:10:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    67,
    71,
    35,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-16 23:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    68,
    21,
    15,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-26 09:12:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    69,
    35,
    15,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-19 11:15:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    70,
    34,
    51,
    'APPROVED',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-06 10:18:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    71,
    57,
    5,
    'PENDING',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-02 00:41:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    72,
    7,
    23,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-08 03:48:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    73,
    34,
    25,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-10 19:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    74,
    8,
    5,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-22 21:41:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    75,
    6,
    47,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-18 20:17:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    76,
    8,
    8,
    'REJECTED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-04 03:40:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    77,
    35,
    7,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-12 18:02:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    78,
    38,
    30,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-12 01:06:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    79,
    9,
    49,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-06 08:55:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    80,
    48,
    7,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-07 09:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    81,
    1,
    29,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-11 20:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    82,
    25,
    20,
    'PENDING',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-28 07:47:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    83,
    34,
    49,
    'REJECTED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-11-29 03:21:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    84,
    44,
    22,
    'PENDING',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-24 13:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    85,
    5,
    43,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-09 04:51:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    86,
    19,
    21,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-18 12:30:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    87,
    50,
    47,
    'APPROVED',
    4,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-20 23:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    88,
    13,
    21,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-12 10:30:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    89,
    2,
    45,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-23 19:57:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    90,
    6,
    25,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-18 21:44:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    91,
    6,
    31,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-13 01:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    92,
    35,
    50,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-12 02:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    93,
    44,
    9,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-04 04:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    94,
    69,
    2,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-12-30 06:33:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    95,
    68,
    20,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-15 19:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    96,
    25,
    28,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-04 02:12:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    97,
    5,
    37,
    'APPROVED',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-05 15:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    98,
    49,
    12,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-01 10:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    99,
    67,
    31,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-07 21:18:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    100,
    27,
    21,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-13 08:19:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    101,
    20,
    41,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-09 01:13:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    102,
    41,
    35,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-02 19:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    103,
    39,
    3,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-18 14:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    104,
    34,
    18,
    'PENDING',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-16 08:22:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    105,
    57,
    39,
    'APPROVED',
    4,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-13 16:44:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    106,
    18,
    34,
    'APPROVED',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-09 17:34:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    107,
    68,
    49,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-28 10:34:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    108,
    38,
    11,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-15 19:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    109,
    53,
    34,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-02 19:46:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    110,
    61,
    16,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-03 04:34:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    111,
    4,
    50,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-28 00:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    112,
    18,
    7,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-11-28 23:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    113,
    24,
    23,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-04 09:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    114,
    33,
    16,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2025-11-30 01:39:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    115,
    59,
    14,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-16 03:53:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    116,
    64,
    42,
    'APPROVED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-03 02:50:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    117,
    42,
    38,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-22 00:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    118,
    40,
    21,
    'PENDING',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-03 21:42:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    119,
    4,
    21,
    'PENDING',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-24 15:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    120,
    32,
    10,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-11 03:56:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    121,
    66,
    9,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-05 08:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    122,
    9,
    12,
    'PENDING',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-17 05:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    123,
    5,
    18,
    'PENDING',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-28 04:58:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    124,
    13,
    22,
    'REJECTED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-26 02:22:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    125,
    15,
    7,
    'APPROVED',
    5,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-01 16:28:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    126,
    68,
    16,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-24 21:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    127,
    23,
    15,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-08 00:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    128,
    34,
    19,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-24 16:15:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    129,
    7,
    12,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-19 13:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    130,
    70,
    28,
    'APPROVED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-28 13:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    131,
    66,
    24,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-29 07:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    132,
    18,
    34,
    'APPROVED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-24 01:28:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    133,
    43,
    20,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-12 04:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    134,
    64,
    31,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-29 00:02:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    135,
    62,
    42,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-20 03:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    136,
    17,
    24,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-09 14:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    137,
    61,
    6,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-01 14:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    138,
    24,
    37,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-09 22:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    139,
    15,
    17,
    'PENDING',
    5,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-28 05:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    140,
    71,
    35,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-12 19:19:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    141,
    38,
    41,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-05 16:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    142,
    39,
    8,
    'REJECTED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-09 11:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    143,
    41,
    25,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-07 18:41:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    144,
    63,
    6,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-11 09:26:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    145,
    47,
    41,
    'APPROVED',
    3,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-24 23:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    146,
    6,
    35,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-11-27 01:07:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    147,
    8,
    27,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-11 18:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    148,
    11,
    2,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-14 17:52:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    149,
    48,
    6,
    'PENDING',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-24 10:28:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    150,
    35,
    20,
    'APPROVED',
    5,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-26 06:12:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    151,
    19,
    42,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-14 00:47:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    152,
    62,
    41,
    'APPROVED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-01 09:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    153,
    63,
    44,
    'PENDING',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-15 10:54:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    154,
    49,
    13,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-11-30 23:58:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    155,
    65,
    40,
    'PENDING',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-24 14:10:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    156,
    68,
    35,
    'APPROVED',
    4,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-13 13:47:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    157,
    34,
    32,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-17 07:52:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    158,
    7,
    30,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-25 11:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    159,
    47,
    13,
    'APPROVED',
    3,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-10 19:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    160,
    24,
    45,
    'PENDING',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-11-30 08:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    161,
    45,
    34,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-28 23:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    162,
    4,
    7,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-14 20:50:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    163,
    18,
    7,
    'REJECTED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-11-27 16:54:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    164,
    55,
    44,
    'APPROVED',
    5,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-16 00:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    165,
    7,
    40,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-26 02:17:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    166,
    70,
    35,
    'PENDING',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-19 00:52:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    167,
    13,
    35,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-10 17:07:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    168,
    65,
    35,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-13 08:33:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    169,
    51,
    18,
    'PENDING',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-09 19:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    170,
    34,
    45,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-11 03:56:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    171,
    59,
    18,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-11 23:18:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    172,
    49,
    33,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-24 03:47:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    173,
    32,
    37,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-05 14:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    174,
    71,
    6,
    'PENDING',
    4,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-15 09:49:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    175,
    64,
    29,
    'REJECTED',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-20 05:20:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    176,
    17,
    2,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-09 18:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    177,
    55,
    28,
    'REJECTED',
    3,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-02 16:33:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    178,
    30,
    43,
    'PENDING',
    4,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-08 06:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    179,
    18,
    39,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-15 10:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    180,
    49,
    28,
    'APPROVED',
    5,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-03 10:41:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    181,
    9,
    29,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-15 08:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    182,
    68,
    51,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-11-27 16:01:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    183,
    11,
    24,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-29 13:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    184,
    68,
    21,
    'APPROVED',
    5,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2026-01-07 12:37:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    185,
    65,
    47,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-08 08:10:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    186,
    8,
    10,
    'APPROVED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-02 14:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    187,
    22,
    39,
    'REJECTED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-11-29 19:50:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    188,
    67,
    49,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-25 03:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    189,
    16,
    9,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-18 03:46:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    190,
    56,
    12,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-10 04:07:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    191,
    48,
    17,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-16 17:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    192,
    32,
    32,
    'REJECTED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-06 16:53:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    193,
    71,
    45,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-02 03:22:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    194,
    54,
    23,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2025-12-15 11:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    195,
    33,
    9,
    'PENDING',
    4,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2025-12-12 04:57:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    196,
    17,
    31,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2026-01-13 00:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    197,
    25,
    31,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-01 20:33:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    198,
    19,
    11,
    'REJECTED',
    3,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-26 19:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    199,
    32,
    12,
    'REJECTED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-28 23:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    200,
    36,
    2,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-12 08:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    201,
    48,
    11,
    'APPROVED',
    5,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-24 13:13:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    202,
    19,
    47,
    'APPROVED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2026-01-01 11:33:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    203,
    41,
    41,
    'APPROVED',
    5,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2026-01-20 08:55:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    204,
    60,
    28,
    'APPROVED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-09 06:42:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    205,
    29,
    11,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-18 01:12:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    206,
    11,
    30,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-30 22:51:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    207,
    8,
    37,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-16 06:57:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    208,
    21,
    20,
    'APPROVED',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-11-29 00:30:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    209,
    5,
    12,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2026-01-05 15:39:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    210,
    37,
    13,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-11-28 20:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    211,
    3,
    21,
    'APPROVED',
    5,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-30 02:10:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    212,
    6,
    16,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-25 15:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    213,
    62,
    18,
    'APPROVED',
    5,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2025-12-26 16:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    214,
    51,
    36,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-24 02:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    215,
    45,
    22,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-20 08:22:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    216,
    18,
    32,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-26 03:40:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    217,
    56,
    21,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2026-01-19 04:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    218,
    41,
    8,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-20 21:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    219,
    36,
    13,
    'APPROVED',
    3,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-10 01:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    220,
    37,
    27,
    'PENDING',
    3,
    'Dobra jakość, ale cena mogłaby być niższa.',
    TIMESTAMP '2025-12-26 14:24:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    221,
    54,
    22,
    'REJECTED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2026-01-14 01:47:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    222,
    23,
    49,
    'APPROVED',
    4,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-11-27 19:54:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    223,
    11,
    5,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-17 05:19:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    224,
    45,
    22,
    'APPROVED',
    4,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-22 02:18:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    225,
    13,
    7,
    'REJECTED',
    4,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2026-01-24 15:53:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    226,
    58,
    33,
    'APPROVED',
    3,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-18 07:27:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    227,
    9,
    28,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-17 12:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    228,
    22,
    16,
    'APPROVED',
    4,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2025-12-23 12:12:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    229,
    44,
    28,
    'REJECTED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-11-27 08:13:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    230,
    26,
    15,
    'APPROVED',
    3,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-18 14:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    231,
    34,
    12,
    'APPROVED',
    4,
    'Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.',
    TIMESTAMP '2025-12-31 23:25:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    232,
    37,
    26,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-04 10:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    233,
    30,
    41,
    'APPROVED',
    3,
    'Godne polecenia, bardzo dobry wybór.',
    TIMESTAMP '2026-01-18 15:34:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    234,
    12,
    47,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-16 17:36:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    235,
    46,
    29,
    'APPROVED',
    3,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2025-12-28 14:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    236,
    3,
    51,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-17 05:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    237,
    58,
    13,
    'APPROVED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-12 07:10:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    238,
    3,
    11,
    'REJECTED',
    3,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-11-28 14:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    239,
    59,
    6,
    'APPROVED',
    4,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2025-12-24 06:26:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    240,
    51,
    49,
    'APPROVED',
    4,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-15 20:38:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    241,
    7,
    18,
    'APPROVED',
    4,
    'Bardzo dobra jakość w przystępnej cenie.',
    TIMESTAMP '2026-01-11 01:14:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    242,
    67,
    30,
    'REJECTED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-04 10:05:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    243,
    65,
    25,
    'APPROVED',
    4,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2025-12-18 09:02:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    244,
    64,
    10,
    'APPROVED',
    4,
    'Świetna karma, pies je z wielkim apetytem.',
    TIMESTAMP '2025-12-16 20:52:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    245,
    12,
    17,
    'APPROVED',
    5,
    'Produkt ok, spełnia swoje zadanie.',
    TIMESTAMP '2026-01-25 14:21:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    246,
    14,
    36,
    'APPROVED',
    4,
    'Solidne wykonanie, polecam.',
    TIMESTAMP '2026-01-17 21:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    247,
    60,
    51,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-05 07:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    248,
    14,
    23,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-19 12:24:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    249,
    1,
    24,
    'APPROVED',
    5,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-24 21:08:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    250,
    9,
    33,
    'APPROVED',
    4,
    'Kot oszalał na punkcie tych przysmaków!',
    TIMESTAMP '2025-12-31 06:28:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    251,
    54,
    36,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-01 03:03:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    252,
    46,
    32,
    'APPROVED',
    3,
    'Zwierzak jest szczęśliwy, więc ja też!',
    TIMESTAMP '2025-12-19 12:01:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    253,
    49,
    25,
    'APPROVED',
    3,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-21 15:35:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    254,
    44,
    34,
    'APPROVED',
    5,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2025-12-22 22:19:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    255,
    61,
    19,
    'PENDING',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-07 09:52:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    256,
    68,
    47,
    'APPROVED',
    4,
    'Na pewno wrócę po więcej!',
    TIMESTAMP '2026-01-20 04:45:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    257,
    66,
    8,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-01 03:09:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    258,
    15,
    27,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2026-01-23 00:29:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    259,
    27,
    35,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-14 08:37:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    260,
    21,
    22,
    'APPROVED',
    5,
    'Mój chomik uwielbia tę karmę.',
    TIMESTAMP '2025-12-20 08:13:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    261,
    39,
    48,
    'REJECTED',
    5,
    'Super! Zwierzak jest zachwycony.',
    TIMESTAMP '2025-12-04 14:16:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    262,
    45,
    35,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-14 14:04:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    263,
    45,
    20,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2026-01-18 09:26:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    264,
    53,
    2,
    'APPROVED',
    3,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-12-08 18:54:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    265,
    40,
    8,
    'APPROVED',
    5,
    'Mój pupil je z apetytem, na pewno zamówię ponownie.',
    TIMESTAMP '2026-01-14 09:11:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    266,
    53,
    28,
    'APPROVED',
    5,
    'Polecam, szybka dostawa i świetna obsługa.',
    TIMESTAMP '2026-01-21 14:15:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    267,
    27,
    25,
    'APPROVED',
    4,
    'Bardzo dobre, zamawiam już kolejny raz.',
    TIMESTAMP '2026-01-08 16:32:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    268,
    8,
    42,
    'APPROVED',
    3,
    'Szybka wysyłka, produkt dobrze zapakowany.',
    TIMESTAMP '2026-01-07 03:39:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    269,
    27,
    51,
    'APPROVED',
    3,
    'Dobry produkt w rozsądnej cenie.',
    TIMESTAMP '2025-12-06 05:55:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    270,
    29,
    40,
    'APPROVED',
    5,
    'Jestem pod wrażeniem jakości.',
    TIMESTAMP '2025-12-09 16:31:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    271,
    56,
    27,
    'APPROVED',
    5,
    'Produkt zgodny z opisem, jestem zadowolony/a.',
    TIMESTAMP '2025-11-30 05:00:46'
);
INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    272,
    60,
    4,
    'APPROVED',
    5,
    'Świetny produkt! Mój pies/kot go uwielbia.',
    TIMESTAMP '2025-12-23 08:18:46'
);

-- Reset sequences
ALTER TABLE brands ALTER COLUMN id RESTART WITH 18;
ALTER TABLE categories ALTER COLUMN id RESTART WITH 7;
ALTER TABLE subcategories ALTER COLUMN id RESTART WITH 61;
ALTER TABLE users ALTER COLUMN id RESTART WITH 52;
ALTER TABLE products ALTER COLUMN id RESTART WITH 72;
ALTER TABLE orders ALTER COLUMN id RESTART WITH 132;
ALTER TABLE order_items ALTER COLUMN id RESTART WITH 416;
ALTER TABLE reviews ALTER COLUMN id RESTART WITH 273;

-- Enable foreign key checks
SET REFERENTIAL_INTEGRITY TRUE;

-- Done!
-- Total records: 1023