#!/usr/bin/env python3
"""
Database Seeding Script for Zoo Pet Store
==========================================
This script populates the H2 database with sample data including:
- Brands
- Categories and Subcategories
- Products with images, descriptions, and weights
- Users
- Orders with order items
- Reviews (from the last 2 months)

Requirements:
    pip install jaydebeapi JPype1 bcrypt Faker

Usage:
    python scripts/seed_database.py
"""

import os
import sys
import random
import string
import hashlib
from datetime import datetime, timedelta
from decimal import Decimal
import uuid

# Try to import optional dependencies
try:
    import jaydebeapi
    HAS_JDBC = True
except ImportError:
    HAS_JDBC = False
    print("Warning: jaydebeapi not installed. Will generate SQL file instead.")

try:
    from faker import Faker
    fake = Faker('pl_PL')
    HAS_FAKER = True
except ImportError:
    HAS_FAKER = False
    print("Warning: Faker not installed. Using basic random data.")

try:
    import bcrypt
    HAS_BCRYPT = True
except ImportError:
    HAS_BCRYPT = False
    print("Warning: bcrypt not installed. Using simple password hash.")

# Database configuration
DB_PATH = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'db', 'zoo')
JDBC_URL = f"jdbc:h2:file:{DB_PATH}"
DB_USER = "admin"
DB_PASSWORD = "admin"
H2_JAR_PATH = os.path.expanduser("~/.m2/repository/com/h2database/h2/2.2.224/h2-2.2.224.jar")

# ============================================================================
# DATA DEFINITIONS
# ============================================================================

BRANDS = [
    {"name": "Royal Canin", "slug": "royal-canin", "country": "France", "website": "https://www.royalcanin.com", "description": "Premium pet food manufacturer known for breed-specific nutrition"},
    {"name": "Pedigree", "slug": "pedigree", "country": "USA", "website": "https://www.pedigree.com", "description": "Popular dog food brand offering complete nutrition"},
    {"name": "Acana", "slug": "acana", "country": "Canada", "website": "https://www.acana.com", "description": "Biologically appropriate pet foods with fresh regional ingredients"},
    {"name": "Purina", "slug": "purina", "country": "USA", "website": "https://www.purina.com", "description": "Trusted pet nutrition for over 90 years"},
    {"name": "Whiskas", "slug": "whiskas", "country": "UK", "website": "https://www.whiskas.com", "description": "Cat food brand loved by cats worldwide"},
    {"name": "Hill's", "slug": "hills", "country": "USA", "website": "https://www.hillspet.com", "description": "Science-based pet nutrition"},
    {"name": "Sheba", "slug": "sheba", "country": "Germany", "website": "https://www.sheba.com", "description": "Premium cat food with gourmet recipes"},
    {"name": "Vitakraft", "slug": "vitakraft", "country": "Germany", "website": "https://www.vitakraft.com", "description": "Quality products for small pets and birds"},
    {"name": "Versele-Laga", "slug": "versele-laga", "country": "Belgium", "website": "https://www.versele-laga.com", "description": "Premium bird and small animal nutrition"},
    {"name": "Tetra", "slug": "tetra", "country": "Germany", "website": "https://www.tetra.net", "description": "World leader in aquarium products"},
    {"name": "JBL", "slug": "jbl", "country": "Germany", "website": "https://www.jbl.de", "description": "Professional aquarium and terrarium products"},
    {"name": "Tropical", "slug": "tropical", "country": "Poland", "website": "https://www.tropical.pl", "description": "High-quality fish food made in Poland"},
    {"name": "Zoo Med", "slug": "zoo-med", "country": "USA", "website": "https://www.zoomed.com", "description": "Reptile and amphibian care specialist"},
    {"name": "Exo Terra", "slug": "exo-terra", "country": "Canada", "website": "https://www.exo-terra.com", "description": "Premium reptile habitats and accessories"},
    {"name": "Trixie", "slug": "trixie", "country": "Germany", "website": "https://www.trixie.de", "description": "Wide range of pet accessories"},
    {"name": "Kong", "slug": "kong", "country": "USA", "website": "https://www.kongcompany.com", "description": "Durable dog toys and enrichment products"},
    {"name": "Ferplast", "slug": "ferplast", "country": "Italy", "website": "https://www.ferplast.com", "description": "Italian pet accessories and habitats"},
]

CATEGORIES = [
    {"name": "Psy", "slug": "psy", "icon": "fa-dog", "description": "Wszystko dla Twojego psa - karma, zabawki, akcesoria i suplementy", "image_url": "/images/categories/dogs.jpg"},
    {"name": "Koty", "slug": "koty", "icon": "fa-cat", "description": "Produkty dla kotow - karma, zabawki, drapaki i akcesoria", "image_url": "/images/categories/cats.jpg"},
    {"name": "Gryzonie", "slug": "gryzonie", "icon": "fa-hamster", "description": "Karma i akcesoria dla chomikow, krolikow, swinki morskiej", "image_url": "/images/categories/rodents.jpg"},
    {"name": "Ptaki", "slug": "ptaki", "icon": "fa-dove", "description": "Produkty dla papug, kanarków i innych ptakow", "image_url": "/images/categories/birds.jpg"},
    {"name": "Ryby", "slug": "ryby", "icon": "fa-fish", "description": "Akwarystyka - karma, filtry, oswietlenie i dekoracje", "image_url": "/images/categories/fish.jpg"},
    {"name": "Gady", "slug": "gady", "icon": "fa-frog", "description": "Terrarystyka - karma, terraria i akcesoria dla gadow", "image_url": "/images/categories/reptiles.jpg"},
]

SUBCATEGORIES = [
    {"name": "Karma sucha", "slug": "karma-sucha", "icon": "fa-bowl-food"},
    {"name": "Karma mokra", "slug": "karma-mokra", "icon": "fa-can-food"},
    {"name": "Przysmaki", "slug": "przysmaki", "icon": "fa-cookie"},
    {"name": "Zabawki", "slug": "zabawki", "icon": "fa-ball"},
    {"name": "Akcesoria", "slug": "akcesoria", "icon": "fa-tag"},
    {"name": "Legowiska", "slug": "legowiska", "icon": "fa-bed"},
    {"name": "Obroze i smycze", "slug": "obroze-smycze", "icon": "fa-link"},
    {"name": "Suplementy", "slug": "suplementy", "icon": "fa-pills"},
    {"name": "Higiena", "slug": "higiena", "icon": "fa-shower"},
    {"name": "Transportery", "slug": "transportery", "icon": "fa-box"},
]

# Product templates per category
PRODUCT_TEMPLATES = {
    "Psy": [
        {"name": "Royal Canin Maxi Adult", "desc": "Karma dla duzych psow dorosłych. Wspiera zdrowie stawow i optymalna wage ciała.", "weight": 15.0, "price": 289.99, "brand": "Royal Canin", "subcat": "Karma sucha", "image": "/images/products/dogs/royal-canin-maxi.jpg"},
        {"name": "Pedigree Adult z wolowina", "desc": "Pełnoporcjowa karma dla dorosłych psow z soczystą wolowiną.", "weight": 12.0, "price": 149.99, "brand": "Pedigree", "subcat": "Karma sucha", "image": "/images/products/dogs/pedigree-beef.jpg"},
        {"name": "Acana Pacifica Dog", "desc": "Karma bezzbozowa z rybami z Pacyfiku. 70% składnikow pochodzenia zwierzecego.", "weight": 11.4, "price": 359.99, "brand": "Acana", "subcat": "Karma sucha", "image": "/images/products/dogs/acana-pacifica.jpg"},
        {"name": "Hill's Science Plan Adult", "desc": "Karma dla dorosłych psow sredniej wielkosci z kurczakiem.", "weight": 14.0, "price": 319.99, "brand": "Hill's", "subcat": "Karma sucha", "image": "/images/products/dogs/hills-adult.jpg"},
        {"name": "Purina Pro Plan Adult Large", "desc": "Karma dla duzych psow z łososiem. Wspiera zdrowa skore i siersc.", "weight": 14.0, "price": 299.99, "brand": "Purina", "subcat": "Karma sucha", "image": "/images/products/dogs/purina-large.jpg"},
        {"name": "Pedigree puszka z kurczakiem", "desc": "Mokra karma dla psow z delikatnym kurczakiem w sosie.", "weight": 0.4, "price": 5.99, "brand": "Pedigree", "subcat": "Karma mokra", "image": "/images/products/dogs/pedigree-can.jpg"},
        {"name": "Royal Canin puszka Adult", "desc": "Mokra karma premium dla dorosłych psow. Kawałki w sosie.", "weight": 0.4, "price": 8.99, "brand": "Royal Canin", "subcat": "Karma mokra", "image": "/images/products/dogs/rc-can.jpg"},
        {"name": "Pedigree Dentastix", "desc": "Przysmaki dentystyczne dla psow. Zmniejszaja osadzanie sie kamienia.", "weight": 0.27, "price": 24.99, "brand": "Pedigree", "subcat": "Przysmaki", "image": "/images/products/dogs/dentastix.jpg"},
        {"name": "Kong Classic czerwony L", "desc": "Wytrzymała zabawka dla psow do wypełniania przysmakami.", "weight": 0.3, "price": 59.99, "brand": "Kong", "subcat": "Zabawki", "image": "/images/products/dogs/kong-classic.jpg"},
        {"name": "Trixie piłka tenisowa 3szt", "desc": "Zestaw 3 piłek tenisowych dla psow. Idealne do aportowania.", "weight": 0.2, "price": 14.99, "brand": "Trixie", "subcat": "Zabawki", "image": "/images/products/dogs/tennis-balls.jpg"},
        {"name": "Kong Wubba L", "desc": "Zabawka do przeciągania i aportowania z piszczałką.", "weight": 0.25, "price": 49.99, "brand": "Kong", "subcat": "Zabawki", "image": "/images/products/dogs/kong-wubba.jpg"},
        {"name": "Trixie legowisko owalne 80cm", "desc": "Miekkie legowisko dla srednih i duzych psow. Łatwe w czyszczeniu.", "weight": 1.5, "price": 129.99, "brand": "Trixie", "subcat": "Legowiska", "image": "/images/products/dogs/bed-oval.jpg"},
        {"name": "Ferplast legowisko Siesta 6", "desc": "Plastikowe legowisko z miekka poduszka. Rozmiar dla duzych psow.", "weight": 2.0, "price": 149.99, "brand": "Ferplast", "subcat": "Legowiska", "image": "/images/products/dogs/ferplast-siesta.jpg"},
        {"name": "Trixie obroza skorzana M", "desc": "Klasyczna obroza ze skory naturalnej. Regulowana dlugosc.", "weight": 0.1, "price": 39.99, "brand": "Trixie", "subcat": "Obroze i smycze", "image": "/images/products/dogs/leather-collar.jpg"},
        {"name": "Trixie smycz automatyczna 5m", "desc": "Smycz flexi z blokada i ergonomicznym uchwytem.", "weight": 0.3, "price": 79.99, "brand": "Trixie", "subcat": "Obroze i smycze", "image": "/images/products/dogs/flexi-leash.jpg"},
        {"name": "Royal Canin Mobility Support", "desc": "Suplement wspierajacy stawy i mobilnosc u psow.", "weight": 0.5, "price": 89.99, "brand": "Royal Canin", "subcat": "Suplementy", "image": "/images/products/dogs/mobility-support.jpg"},
        {"name": "Trixie szampon uniwersalny 1L", "desc": "Delikatny szampon dla psow o kazdym typie sierści.", "weight": 1.0, "price": 34.99, "brand": "Trixie", "subcat": "Higiena", "image": "/images/products/dogs/shampoo.jpg"},
        {"name": "Ferplast transporter Atlas 40", "desc": "Transporter plastikowy dla psow do 18kg. Zgodny z IATA.", "weight": 3.5, "price": 189.99, "brand": "Ferplast", "subcat": "Transportery", "image": "/images/products/dogs/atlas-carrier.jpg"},
    ],
    "Koty": [
        {"name": "Royal Canin Indoor Cat", "desc": "Karma dla kotow domowych. Redukuje zapach kuwety.", "weight": 10.0, "price": 249.99, "brand": "Royal Canin", "subcat": "Karma sucha", "image": "/images/products/cats/rc-indoor.jpg"},
        {"name": "Whiskas z kurczakiem", "desc": "Karma sucha dla dorosłych kotow z pysznym kurczakiem.", "weight": 7.0, "price": 89.99, "brand": "Whiskas", "subcat": "Karma sucha", "image": "/images/products/cats/whiskas-chicken.jpg"},
        {"name": "Purina Pro Plan Sterilised", "desc": "Karma dla kotow sterylizowanych z łososiem.", "weight": 10.0, "price": 269.99, "brand": "Purina", "subcat": "Karma sucha", "image": "/images/products/cats/purina-sterilised.jpg"},
        {"name": "Hill's Science Plan Adult", "desc": "Karma dla dorosłych kotow z tuńczykiem.", "weight": 7.0, "price": 229.99, "brand": "Hill's", "subcat": "Karma sucha", "image": "/images/products/cats/hills-tuna.jpg"},
        {"name": "Sheba saszetki z łososiem 12x85g", "desc": "Mokra karma premium w saszatkach. Delikatne kawałki w sosie.", "weight": 1.02, "price": 32.99, "brand": "Sheba", "subcat": "Karma mokra", "image": "/images/products/cats/sheba-salmon.jpg"},
        {"name": "Whiskas puszka z tunczykiem", "desc": "Mokra karma dla kotow z tunczykiem w galaretce.", "weight": 0.4, "price": 4.49, "brand": "Whiskas", "subcat": "Karma mokra", "image": "/images/products/cats/whiskas-can.jpg"},
        {"name": "Whiskas Temptations kurczak", "desc": "Chrupiace przysmaki z miekkim nadzieniem.", "weight": 0.06, "price": 8.99, "brand": "Whiskas", "subcat": "Przysmaki", "image": "/images/products/cats/temptations.jpg"},
        {"name": "Trixie myszka pluszowa 3szt", "desc": "Zestaw pluszowych myszek z kocimiętką.", "weight": 0.05, "price": 12.99, "brand": "Trixie", "subcat": "Zabawki", "image": "/images/products/cats/plush-mice.jpg"},
        {"name": "Trixie wedka z piórkami", "desc": "Interaktywna wedka z kolorowymi piórkami.", "weight": 0.1, "price": 19.99, "brand": "Trixie", "subcat": "Zabawki", "image": "/images/products/cats/feather-wand.jpg"},
        {"name": "Ferplast tunel dla kota", "desc": "Składany tunel do zabawy z szelestrzącym materiałem.", "weight": 0.3, "price": 49.99, "brand": "Ferplast", "subcat": "Zabawki", "image": "/images/products/cats/tunnel.jpg"},
        {"name": "Trixie drapak słupek 60cm", "desc": "Drapak z sizalowym słupkiem i platformą.", "weight": 3.0, "price": 79.99, "brand": "Trixie", "subcat": "Akcesoria", "image": "/images/products/cats/scratching-post.jpg"},
        {"name": "Trixie legowisko na kaloryfer", "desc": "Miekkie legowisko do zawieszenia na kaloryferze.", "weight": 0.5, "price": 59.99, "brand": "Trixie", "subcat": "Legowiska", "image": "/images/products/cats/radiator-bed.jpg"},
        {"name": "Ferplast kuweta Netta", "desc": "Zamknięta kuweta z filrem węglowym.", "weight": 2.5, "price": 89.99, "brand": "Ferplast", "subcat": "Higiena", "image": "/images/products/cats/litter-box.jpg"},
        {"name": "Trixie żwirek betonit 10L", "desc": "Zbrylający żwirek o delikatnym zapachu.", "weight": 8.0, "price": 29.99, "brand": "Trixie", "subcat": "Higiena", "image": "/images/products/cats/litter.jpg"},
        {"name": "Royal Canin Hairball Care", "desc": "Suplement pomagający w usuwaniu kul włosowych.", "weight": 0.4, "price": 49.99, "brand": "Royal Canin", "subcat": "Suplementy", "image": "/images/products/cats/hairball.jpg"},
        {"name": "Ferplast transporter Atlas 20", "desc": "Transporter dla kotow z wentylacją.", "weight": 2.0, "price": 99.99, "brand": "Ferplast", "subcat": "Transportery", "image": "/images/products/cats/carrier.jpg"},
    ],
    "Gryzonie": [
        {"name": "Vitakraft Menu Vital chomik", "desc": "Pełnowartościowa karma dla chomików z witaminami.", "weight": 1.0, "price": 24.99, "brand": "Vitakraft", "subcat": "Karma sucha", "image": "/images/products/rodents/vitakraft-hamster.jpg"},
        {"name": "Versele-Laga Crispy Muesli", "desc": "Mieszanka dla królików z warzywami i ziołami.", "weight": 2.75, "price": 39.99, "brand": "Versele-Laga", "subcat": "Karma sucha", "image": "/images/products/rodents/crispy-rabbit.jpg"},
        {"name": "Vitakraft karma dla świnki", "desc": "Karma dla świnek morskich z witaminą C.", "weight": 1.0, "price": 26.99, "brand": "Vitakraft", "subcat": "Karma sucha", "image": "/images/products/rodents/guinea-food.jpg"},
        {"name": "Versele-Laga Complete Hamster", "desc": "Ekstrudowana karma dla chomików. All-in-one.", "weight": 0.5, "price": 19.99, "brand": "Versele-Laga", "subcat": "Karma sucha", "image": "/images/products/rodents/complete-hamster.jpg"},
        {"name": "Vitakraft Kracker miód", "desc": "Kolby z miodem dla gryzoni.", "weight": 0.2, "price": 9.99, "brand": "Vitakraft", "subcat": "Przysmaki", "image": "/images/products/rodents/honey-sticks.jpg"},
        {"name": "Trixie domek drewniany M", "desc": "Domek z naturalnego drewna dla chomika.", "weight": 0.3, "price": 29.99, "brand": "Trixie", "subcat": "Akcesoria", "image": "/images/products/rodents/wooden-house.jpg"},
        {"name": "Trixie kołowrotek 20cm", "desc": "Metalowy kołowrotek dla chomika i myszki.", "weight": 0.4, "price": 39.99, "brand": "Trixie", "subcat": "Zabawki", "image": "/images/products/rodents/wheel.jpg"},
        {"name": "Ferplast klatka Criceti 100", "desc": "Duża klatka dla chomików z wyposażeniem.", "weight": 5.0, "price": 249.99, "brand": "Ferplast", "subcat": "Akcesoria", "image": "/images/products/rodents/cage.jpg"},
        {"name": "Trixie siano łąkowe 1kg", "desc": "Naturalne siano dla królików i gryzoni.", "weight": 1.0, "price": 14.99, "brand": "Trixie", "subcat": "Karma sucha", "image": "/images/products/rodents/hay.jpg"},
        {"name": "Vitakraft witaminy krople", "desc": "Witaminy w kroplach dla gryzoni.", "weight": 0.05, "price": 19.99, "brand": "Vitakraft", "subcat": "Suplementy", "image": "/images/products/rodents/vitamins.jpg"},
    ],
    "Ptaki": [
        {"name": "Versele-Laga Prestige papuga", "desc": "Mieszanka ziaren dla średnich papug.", "weight": 1.0, "price": 29.99, "brand": "Versele-Laga", "subcat": "Karma sucha", "image": "/images/products/birds/prestige-parrot.jpg"},
        {"name": "Vitakraft kanarek Premium", "desc": "Karma dla kanarków z ziołami.", "weight": 0.8, "price": 24.99, "brand": "Vitakraft", "subcat": "Karma sucha", "image": "/images/products/birds/canary-food.jpg"},
        {"name": "Versele-Laga NutriBird", "desc": "Ekstrudowana karma dla papug.", "weight": 1.0, "price": 49.99, "brand": "Versele-Laga", "subcat": "Karma sucha", "image": "/images/products/birds/nutribird.jpg"},
        {"name": "Vitakraft Kracker jajeczny", "desc": "Kolba z jajkiem dla kanarków.", "weight": 0.1, "price": 7.99, "brand": "Vitakraft", "subcat": "Przysmaki", "image": "/images/products/birds/egg-stick.jpg"},
        {"name": "Trixie huśtawka drewniana", "desc": "Huśtawka z naturalnego drewna dla ptaków.", "weight": 0.15, "price": 14.99, "brand": "Trixie", "subcat": "Zabawki", "image": "/images/products/birds/swing.jpg"},
        {"name": "Ferplast klatka Piano 6", "desc": "Duża klatka dla kanarków i papużek.", "weight": 8.0, "price": 349.99, "brand": "Ferplast", "subcat": "Akcesoria", "image": "/images/products/birds/cage.jpg"},
        {"name": "Trixie żerdź korowa 2szt", "desc": "Naturalne żerdzie z kory dla ptaków.", "weight": 0.2, "price": 19.99, "brand": "Trixie", "subcat": "Akcesoria", "image": "/images/products/birds/perches.jpg"},
        {"name": "Vitakraft piasek dla ptaków", "desc": "Piasek z muszlami dla lepszego trawienia.", "weight": 2.5, "price": 12.99, "brand": "Vitakraft", "subcat": "Higiena", "image": "/images/products/birds/sand.jpg"},
    ],
    "Ryby": [
        {"name": "Tetra Pro Energy", "desc": "Wysokoenergetyczna karma w płatkach.", "weight": 0.5, "price": 79.99, "brand": "Tetra", "subcat": "Karma sucha", "image": "/images/products/fish/tetra-pro.jpg"},
        {"name": "Tropical Supervit", "desc": "Wieloskładnikowa karma dla ryb tropikalnych.", "weight": 0.25, "price": 39.99, "brand": "Tropical", "subcat": "Karma sucha", "image": "/images/products/fish/supervit.jpg"},
        {"name": "JBL NovoTab", "desc": "Tabletki pokarmowe dla ryb dennych.", "weight": 0.25, "price": 44.99, "brand": "JBL", "subcat": "Karma sucha", "image": "/images/products/fish/novotab.jpg"},
        {"name": "Tetra Goldfish", "desc": "Karma dla złotych rybek w płatkach.", "weight": 0.2, "price": 29.99, "brand": "Tetra", "subcat": "Karma sucha", "image": "/images/products/fish/goldfish.jpg"},
        {"name": "JBL ProFlora u500", "desc": "Butla CO2 500g do nawożenia roślin.", "weight": 1.2, "price": 149.99, "brand": "JBL", "subcat": "Akcesoria", "image": "/images/products/fish/co2.jpg"},
        {"name": "Tetra EasyCrystal 600", "desc": "Filtr wewnętrzny do akwariów 50-150L.", "weight": 0.8, "price": 129.99, "brand": "Tetra", "subcat": "Akcesoria", "image": "/images/products/fish/filter.jpg"},
        {"name": "JBL LED Solar Nature", "desc": "Oświetlenie LED do akwariów roślinnych.", "weight": 1.5, "price": 399.99, "brand": "JBL", "subcat": "Akcesoria", "image": "/images/products/fish/led-light.jpg"},
        {"name": "Tetra Aqua Safe 500ml", "desc": "Uzdatniacz wody usuwający chlor.", "weight": 0.5, "price": 49.99, "brand": "Tetra", "subcat": "Higiena", "image": "/images/products/fish/aquasafe.jpg"},
        {"name": "JBL Denitrol 250ml", "desc": "Bakterie startowe do nowych akwariów.", "weight": 0.3, "price": 59.99, "brand": "JBL", "subcat": "Suplementy", "image": "/images/products/fish/denitrol.jpg"},
        {"name": "Tropical korzeń mangrowca M", "desc": "Naturalny korzeń do dekoracji akwarium.", "weight": 0.8, "price": 69.99, "brand": "Tropical", "subcat": "Akcesoria", "image": "/images/products/fish/root.jpg"},
    ],
    "Gady": [
        {"name": "Zoo Med karma dla żółwia", "desc": "Pływające granulki dla żółwi wodnych.", "weight": 0.35, "price": 49.99, "brand": "Zoo Med", "subcat": "Karma sucha", "image": "/images/products/reptiles/turtle-food.jpg"},
        {"name": "Exo Terra karma dla brodatych", "desc": "Karma dla agam brodatych dorosłych.", "weight": 0.25, "price": 39.99, "brand": "Exo Terra", "subcat": "Karma sucha", "image": "/images/products/reptiles/bearded-dragon.jpg"},
        {"name": "Zoo Med świerszcze liofiliz.", "desc": "Suszone świerszcze dla gadów i płazów.", "weight": 0.08, "price": 34.99, "brand": "Zoo Med", "subcat": "Karma sucha", "image": "/images/products/reptiles/crickets.jpg"},
        {"name": "Exo Terra terrarium 60x45x45", "desc": "Szklane terrarium z wentylacją.", "weight": 25.0, "price": 599.99, "brand": "Exo Terra", "subcat": "Akcesoria", "image": "/images/products/reptiles/terrarium.jpg"},
        {"name": "Zoo Med lampa UVB 10.0", "desc": "Świetlówka UVB dla gadów pustynnych.", "weight": 0.2, "price": 89.99, "brand": "Zoo Med", "subcat": "Akcesoria", "image": "/images/products/reptiles/uvb-lamp.jpg"},
        {"name": "Exo Terra Heat Mat M", "desc": "Mata grzewcza 16W do terrarium.", "weight": 0.3, "price": 79.99, "brand": "Exo Terra", "subcat": "Akcesoria", "image": "/images/products/reptiles/heat-mat.jpg"},
        {"name": "Zoo Med Repti Calcium", "desc": "Wapno bez D3 dla gadów.", "weight": 0.25, "price": 44.99, "brand": "Zoo Med", "subcat": "Suplementy", "image": "/images/products/reptiles/calcium.jpg"},
        {"name": "Exo Terra kryjówka jaskinia M", "desc": "Naturalna dekoracja - kryjówka.", "weight": 0.8, "price": 49.99, "brand": "Exo Terra", "subcat": "Akcesoria", "image": "/images/products/reptiles/hide.jpg"},
        {"name": "Zoo Med Eco Earth 3-pack", "desc": "Podłoże kokosowe do terrarów.", "weight": 0.6, "price": 39.99, "brand": "Zoo Med", "subcat": "Higiena", "image": "/images/products/reptiles/substrate.jpg"},
    ],
}

# Polish first names
FIRST_NAMES = ["Anna", "Maria", "Katarzyna", "Małgorzata", "Agnieszka", "Barbara", "Ewa", "Krystyna",
               "Elżbieta", "Zofia", "Jan", "Andrzej", "Piotr", "Krzysztof", "Stanisław", "Tomasz",
               "Paweł", "Michał", "Marcin", "Marek", "Adam", "Jakub", "Łukasz", "Mateusz", "Karol"]

LAST_NAMES = ["Nowak", "Kowalski", "Wiśniewski", "Wójcik", "Kowalczyk", "Kamiński", "Lewandowski",
              "Zieliński", "Szymański", "Woźniak", "Dąbrowski", "Kozłowski", "Jankowski", "Mazur",
              "Wojciechowski", "Kwiatkowski", "Krawczyk", "Piotrowski", "Grabowski", "Pawłowski"]

CITIES = ["Warszawa", "Kraków", "Łódź", "Wrocław", "Poznań", "Gdańsk", "Szczecin", "Bydgoszcz",
          "Lublin", "Białystok", "Katowice", "Gdynia", "Częstochowa", "Radom", "Sosnowiec",
          "Toruń", "Kielce", "Rzeszów", "Gliwice", "Zabrze"]

STREETS = ["Główna", "Polna", "Leśna", "Słoneczna", "Krótka", "Szkolna", "Ogrodowa", "Lipowa",
           "Brzozowa", "Łąkowa", "Kwiatowa", "Zielona", "Parkowa", "Kościelna", "Kolejowa",
           "Sportowa", "Piaskowa", "Wodna", "Rynek", "Nowa"]

REVIEW_COMMENTS = [
    "Świetny produkt! Mój pies/kot go uwielbia.",
    "Bardzo dobra jakość w przystępnej cenie.",
    "Polecam, szybka dostawa i świetna obsługa.",
    "Produkt zgodny z opisem, jestem zadowolony/a.",
    "Mój pupil je z apetytem, na pewno zamówię ponownie.",
    "Dobra jakość, ale cena mogłaby być niższa.",
    "Super! Zwierzak jest zachwycony.",
    "Solidne wykonanie, polecam.",
    "Bardzo dobre, zamawiam już kolejny raz.",
    "Produkt ok, spełnia swoje zadanie.",
    "Świetna karma, pies je z wielkim apetytem.",
    "Kot oszalał na punkcie tych przysmaków!",
    "Wysokiej jakości produkt, polecam wszystkim właścicielom zwierząt.",
    "Szybka wysyłka, produkt dobrze zapakowany.",
    "Mój chomik uwielbia tę karmę.",
    "Dobry produkt w rozsądnej cenie.",
    "Jestem pod wrażeniem jakości.",
    "Zwierzak jest szczęśliwy, więc ja też!",
    "Godne polecenia, bardzo dobry wybór.",
    "Na pewno wrócę po więcej!",
]


# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

def generate_slug(name):
    """Generate URL-friendly slug from Polish text"""
    slug = name.lower()
    polish_chars = {
        'ą': 'a', 'ć': 'c', 'ę': 'e', 'ł': 'l', 'ń': 'n',
        'ó': 'o', 'ś': 's', 'ź': 'z', 'ż': 'z'
    }
    for pl, en in polish_chars.items():
        slug = slug.replace(pl, en)

    import re
    slug = re.sub(r'[^a-z0-9]+', '-', slug)
    slug = re.sub(r'^-|-$', '', slug)
    return slug


def generate_sku():
    """Generate unique SKU"""
    return f"ZOO-{''.join(random.choices(string.ascii_uppercase + string.digits, k=8))}"


def generate_order_number():
    """Generate unique order number"""
    return f"ZAM-{datetime.now().strftime('%Y%m%d')}-{''.join(random.choices(string.digits, k=6))}"


def hash_password(password):
    """Hash password using bcrypt or fallback"""
    if HAS_BCRYPT:
        return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    else:
        # Simple fallback - not secure, just for demo
        return f"$2a$10${hashlib.sha256(password.encode()).hexdigest()[:53]}"


def random_date_in_last_2_months():
    """Generate random datetime within last 2 months"""
    now = datetime.now()
    days_ago = random.randint(0, 60)
    hours = random.randint(0, 23)
    minutes = random.randint(0, 59)
    return now - timedelta(days=days_ago, hours=hours, minutes=minutes)


def random_phone():
    """Generate Polish phone number"""
    prefixes = ['500', '501', '502', '503', '504', '505', '506', '507', '508', '509',
                '510', '511', '512', '513', '514', '515', '516', '517', '518', '519',
                '600', '601', '602', '603', '604', '605', '606', '607', '608', '609']
    return f"+48 {random.choice(prefixes)} {random.randint(100, 999)} {random.randint(100, 999)}"


def random_zip():
    """Generate Polish zip code"""
    return f"{random.randint(10, 99)}-{random.randint(100, 999)}"


# ============================================================================
# DATA GENERATORS
# ============================================================================

class DataGenerator:
    def __init__(self):
        self.brands = []
        self.categories = []
        self.subcategories = []
        self.products = []
        self.users = []
        self.orders = []
        self.order_items = []
        self.reviews = []

        self.brand_map = {}
        self.category_map = {}
        self.subcategory_map = {}

    def generate_all(self):
        """Generate all seed data"""
        print("Generating brands...")
        self.generate_brands()

        print("Generating categories...")
        self.generate_categories()

        print("Generating subcategories...")
        self.generate_subcategories()

        print("Generating products...")
        self.generate_products()

        print("Generating users...")
        self.generate_users()

        print("Generating orders...")
        self.generate_orders()

        print("Generating reviews...")
        self.generate_reviews()

        print(f"\nGenerated:")
        print(f"  - {len(self.brands)} brands")
        print(f"  - {len(self.categories)} categories")
        print(f"  - {len(self.subcategories)} subcategories")
        print(f"  - {len(self.products)} products")
        print(f"  - {len(self.users)} users")
        print(f"  - {len(self.orders)} orders")
        print(f"  - {len(self.order_items)} order items")
        print(f"  - {len(self.reviews)} reviews")

    def generate_brands(self):
        """Generate brand data"""
        for i, brand_data in enumerate(BRANDS, 1):
            brand = {
                'id': i,
                'name': brand_data['name'],
                'slug': brand_data['slug'],
                'description': brand_data['description'],
                'active': True,
                'logo_url': f"/images/brands/{brand_data['slug']}.png",
                'website': brand_data['website'],
                'country': brand_data['country']
            }
            self.brands.append(brand)
            self.brand_map[brand_data['name']] = i

    def generate_categories(self):
        """Generate category data"""
        for i, cat_data in enumerate(CATEGORIES, 1):
            category = {
                'id': i,
                'name': cat_data['name'],
                'slug': cat_data['slug'],
                'icon': cat_data['icon'],
                'description': cat_data['description'],
                'image_url': cat_data['image_url'],
                'active': True
            }
            self.categories.append(category)
            self.category_map[cat_data['name']] = i

    def generate_subcategories(self):
        """Generate subcategory data for each category"""
        subcat_id = 1
        for cat in self.categories:
            cat_id = cat['id']
            for order, subcat_data in enumerate(SUBCATEGORIES, 1):
                subcategory = {
                    'id': subcat_id,
                    'name': subcat_data['name'],
                    'slug': f"{cat['slug']}-{subcat_data['slug']}",
                    'icon': subcat_data['icon'],
                    'description': f"{subcat_data['name']} dla kategorii {cat['name']}",
                    'active': True,
                    'display_order': order,
                    'image_url': None,
                    'category_id': cat_id,
                    'created_at': datetime.now(),
                    'updated_at': datetime.now()
                }
                self.subcategories.append(subcategory)
                key = (cat['name'], subcat_data['name'])
                self.subcategory_map[key] = subcat_id
                subcat_id += 1

    def generate_products(self):
        """Generate products from templates"""
        product_id = 1
        for cat_name, templates in PRODUCT_TEMPLATES.items():
            cat_id = self.category_map.get(cat_name)
            if not cat_id:
                continue

            for tmpl in templates:
                brand_id = self.brand_map.get(tmpl['brand'])
                subcat_key = (cat_name, tmpl['subcat'])
                subcat_id = self.subcategory_map.get(subcat_key)

                # Random stock quantity
                stock = random.randint(5, 200)
                status = 'ACTIVE' if stock > 0 else 'SOLDOUT'

                # Random rating
                rating = round(random.uniform(3.5, 5.0), 1)

                # Sometimes add discount
                discounted_price = None
                if random.random() < 0.25:  # 25% chance of discount
                    discount_pct = random.choice([10, 15, 20, 25, 30])
                    discounted_price = round(tmpl['price'] * (1 - discount_pct / 100), 2)

                product = {
                    'id': product_id,
                    'name': tmpl['name'],
                    'description': tmpl['desc'],
                    'brand_id': brand_id,
                    'price': tmpl['price'],
                    'discounted_price': discounted_price,
                    'average_rating': rating,
                    'image_url': tmpl['image'],
                    'status': status,
                    'stock_quantity': stock,
                    'sku': generate_sku(),
                    'weight': tmpl['weight'],
                    'dimensions': f"{random.randint(10, 50)}x{random.randint(10, 40)}x{random.randint(5, 30)}cm",
                    'ingredients': None,
                    'category_id': cat_id,
                    'subcategory_id': subcat_id,
                    'created_at': random_date_in_last_2_months(),
                    'updated_at': datetime.now()
                }
                self.products.append(product)
                product_id += 1

    def generate_users(self):
        """Generate user data"""
        # Create admin user
        admin = {
            'id': 1,
            'first_name': 'Admin',
            'last_name': 'System',
            'email': 'admin@zoo.com',
            'password': hash_password('admin123'),
            'phone': '+48 500 000 000',
            'role': 'ADMIN',
            'street': 'Administracyjna 1',
            'city': 'Warszawa',
            'zip_code': '00-001',
            'country': 'Poland',
            'active': True,
            'enabled': True,
            'activation_code': None,
            'created_at': datetime.now() - timedelta(days=365),
            'updated_at': datetime.now()
        }
        self.users.append(admin)

        # Create regular users
        for i in range(2, 52):  # 50 regular users
            first_name = random.choice(FIRST_NAMES)
            last_name = random.choice(LAST_NAMES)
            email = f"{first_name.lower()}.{last_name.lower()}{i}@example.com"

            user = {
                'id': i,
                'first_name': first_name,
                'last_name': last_name,
                'email': email.replace('ł', 'l').replace('ą', 'a').replace('ę', 'e').replace('ó', 'o').replace('ś', 's').replace('ć', 'c').replace('ń', 'n').replace('ź', 'z').replace('ż', 'z'),
                'password': hash_password('user123'),
                'phone': random_phone(),
                'role': 'USER',
                'street': f"ul. {random.choice(STREETS)} {random.randint(1, 150)}/{random.randint(1, 50)}",
                'city': random.choice(CITIES),
                'zip_code': random_zip(),
                'country': 'Poland',
                'active': True,
                'enabled': True,
                'activation_code': None,
                'created_at': random_date_in_last_2_months(),
                'updated_at': datetime.now()
            }
            self.users.append(user)

    def generate_orders(self):
        """Generate orders with order items"""
        order_id = 1
        order_item_id = 1

        order_statuses = ['PENDING', 'CONFIRMED', 'PROCESSING', 'PACKED', 'SHIPPED',
                          'IN_TRANSIT', 'DELIVERED', 'CANCELLED']
        payment_statuses = ['PENDING', 'PAID', 'FAILED']
        payment_methods = ['TRANSFER', 'CARD', 'BLIK', 'CASH_ON_DELIVERY']
        delivery_methods = ['PICKUP', 'LOCKER', 'COURIER']
        delivery_costs = {'PICKUP': 0.0, 'LOCKER': 12.99, 'COURIER': 18.50}

        # Generate 100-150 orders
        num_orders = random.randint(100, 150)

        for _ in range(num_orders):
            user = random.choice(self.users[1:])  # Skip admin
            order_date = random_date_in_last_2_months()

            status = random.choice(order_statuses)
            payment_status = 'PAID' if status in ['DELIVERED', 'SHIPPED', 'IN_TRANSIT'] else random.choice(payment_statuses)
            if status == 'CANCELLED':
                payment_status = 'CANCELLED'

            delivery_method = random.choice(delivery_methods)
            delivery_cost = delivery_costs[delivery_method]

            # Generate order items (1-5 products)
            num_items = random.randint(1, 5)
            selected_products = random.sample(self.products, min(num_items, len(self.products)))

            subtotal = 0.0
            items_for_order = []

            for product in selected_products:
                quantity = random.randint(1, 3)
                price = product['discounted_price'] if product['discounted_price'] else product['price']
                subtotal += price * quantity

                item = {
                    'id': order_item_id,
                    'product_id': product['id'],
                    'quantity': quantity,
                    'price': price,
                    'order_id': order_id
                }
                items_for_order.append(item)
                self.order_items.append(item)
                order_item_id += 1

            total_amount = subtotal + delivery_cost

            # Apply random discount sometimes
            discount_amount = 0.0
            if random.random() < 0.15:  # 15% chance
                discount_amount = round(subtotal * random.uniform(0.05, 0.15), 2)
                total_amount = subtotal - discount_amount + delivery_cost

            order = {
                'id': order_id,
                'order_number': generate_order_number(),
                'order_date': order_date,
                'status': status,
                'payment_status': payment_status,
                'payment_method': random.choice(payment_methods),
                'delivery_method': delivery_method,
                'user_id': user['id'],
                'guest_email': None,
                'guest_name': None,
                'guest_phone': None,
                'shipping_street': user['street'],
                'shipping_city': user['city'],
                'shipping_zip': user['zip_code'],
                'shipping_country': 'Poland',
                'billing_street': user['street'],
                'billing_city': user['city'],
                'billing_zip': user['zip_code'],
                'billing_country': 'Poland',
                'subtotal': round(subtotal, 2),
                'total_amount': round(total_amount, 2),
                'delivery_cost': delivery_cost,
                'discount_amount': discount_amount,
                'promotion_id': None,
                'promotion_code': None,
                'notes': None,
                'admin_notes': None,
                'tracking_number': f"PL{random.randint(10000000, 99999999)}" if status in ['SHIPPED', 'IN_TRANSIT', 'DELIVERED'] else None,
                'cancelled_at': order_date + timedelta(hours=random.randint(1, 24)) if status == 'CANCELLED' else None,
                'cancellation_reason': 'Anulowane przez klienta' if status == 'CANCELLED' else None,
                'delivered_at': order_date + timedelta(days=random.randint(2, 7)) if status == 'DELIVERED' else None,
                'status_changed_at': order_date + timedelta(hours=random.randint(1, 48))
            }
            self.orders.append(order)
            order_id += 1

    def generate_reviews(self):
        """Generate reviews for products"""
        review_id = 1
        review_statuses = ['PENDING', 'APPROVED', 'REJECTED']

        # Generate 200-300 reviews
        num_reviews = random.randint(200, 300)

        for _ in range(num_reviews):
            product = random.choice(self.products)
            user = random.choice(self.users[1:])  # Skip admin

            review = {
                'id': review_id,
                'product_id': product['id'],
                'user_id': user['id'],
                'status': random.choices(review_statuses, weights=[10, 80, 10])[0],  # 80% approved
                'rating': random.randint(3, 5),  # Mostly positive reviews
                'comment': random.choice(REVIEW_COMMENTS),
                'created_at': random_date_in_last_2_months()
            }
            self.reviews.append(review)
            review_id += 1


# ============================================================================
# SQL GENERATOR
# ============================================================================

class SQLGenerator:
    def __init__(self, data: DataGenerator):
        self.data = data

    def escape_string(self, s):
        """Escape string for SQL"""
        if s is None:
            return 'NULL'
        return "'" + str(s).replace("'", "''") + "'"

    def format_datetime(self, dt):
        """Format datetime for H2"""
        if dt is None:
            return 'NULL'
        return f"TIMESTAMP '{dt.strftime('%Y-%m-%d %H:%M:%S')}'"

    def format_decimal(self, d):
        """Format decimal for SQL"""
        if d is None:
            return 'NULL'
        return str(d)

    def format_bool(self, b):
        """Format boolean for SQL"""
        return 'TRUE' if b else 'FALSE'

    def generate_delete_statements(self):
        """Generate DELETE statements to clear existing data"""
        tables = ['reviews', 'order_items', 'orders', 'products', 'subcategories',
                  'categories', 'brands', 'users']
        return '\n'.join([f"DELETE FROM {table};" for table in tables])

    def generate_brands_sql(self):
        """Generate INSERT statements for brands"""
        statements = []
        for brand in self.data.brands:
            sql = f"""INSERT INTO brands (id, name, slug, description, active, logo_url, website, country) VALUES (
    {brand['id']},
    {self.escape_string(brand['name'])},
    {self.escape_string(brand['slug'])},
    {self.escape_string(brand['description'])},
    {self.format_bool(brand['active'])},
    {self.escape_string(brand['logo_url'])},
    {self.escape_string(brand['website'])},
    {self.escape_string(brand['country'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_categories_sql(self):
        """Generate INSERT statements for categories"""
        statements = []
        for cat in self.data.categories:
            sql = f"""INSERT INTO categories (id, name, slug, icon, description, image_url, active) VALUES (
    {cat['id']},
    {self.escape_string(cat['name'])},
    {self.escape_string(cat['slug'])},
    {self.escape_string(cat['icon'])},
    {self.escape_string(cat['description'])},
    {self.escape_string(cat['image_url'])},
    {self.format_bool(cat['active'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_subcategories_sql(self):
        """Generate INSERT statements for subcategories"""
        statements = []
        for subcat in self.data.subcategories:
            sql = f"""INSERT INTO subcategories (id, name, slug, icon, description, active, display_order, image_url, category_id, created_at, updated_at) VALUES (
    {subcat['id']},
    {self.escape_string(subcat['name'])},
    {self.escape_string(subcat['slug'])},
    {self.escape_string(subcat['icon'])},
    {self.escape_string(subcat['description'])},
    {self.format_bool(subcat['active'])},
    {subcat['display_order']},
    {self.escape_string(subcat['image_url'])},
    {subcat['category_id']},
    {self.format_datetime(subcat['created_at'])},
    {self.format_datetime(subcat['updated_at'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_users_sql(self):
        """Generate INSERT statements for users"""
        statements = []
        for user in self.data.users:
            sql = f"""INSERT INTO users (id, first_name, last_name, email, password, phone, role, street, city, zip_code, country, active, enabled, activation_code, created_at, updated_at) VALUES (
    {user['id']},
    {self.escape_string(user['first_name'])},
    {self.escape_string(user['last_name'])},
    {self.escape_string(user['email'])},
    {self.escape_string(user['password'])},
    {self.escape_string(user['phone'])},
    {self.escape_string(user['role'])},
    {self.escape_string(user['street'])},
    {self.escape_string(user['city'])},
    {self.escape_string(user['zip_code'])},
    {self.escape_string(user['country'])},
    {self.format_bool(user['active'])},
    {self.format_bool(user['enabled'])},
    {self.escape_string(user['activation_code'])},
    {self.format_datetime(user['created_at'])},
    {self.format_datetime(user['updated_at'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_products_sql(self):
        """Generate INSERT statements for products"""
        statements = []
        for product in self.data.products:
            sql = f"""INSERT INTO products (id, name, description, brand_id, price, discounted_price, average_rating, image_url, status, stock_quantity, sku, weight, dimensions, ingredients, category_id, subcategory_id, created_at, updated_at) VALUES (
    {product['id']},
    {self.escape_string(product['name'])},
    {self.escape_string(product['description'])},
    {product['brand_id'] if product['brand_id'] else 'NULL'},
    {self.format_decimal(product['price'])},
    {self.format_decimal(product['discounted_price'])},
    {self.format_decimal(product['average_rating'])},
    {self.escape_string(product['image_url'])},
    {self.escape_string(product['status'])},
    {product['stock_quantity']},
    {self.escape_string(product['sku'])},
    {self.format_decimal(product['weight'])},
    {self.escape_string(product['dimensions'])},
    {self.escape_string(product['ingredients'])},
    {product['category_id']},
    {product['subcategory_id'] if product['subcategory_id'] else 'NULL'},
    {self.format_datetime(product['created_at'])},
    {self.format_datetime(product['updated_at'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_orders_sql(self):
        """Generate INSERT statements for orders"""
        statements = []
        for order in self.data.orders:
            sql = f"""INSERT INTO orders (id, order_number, order_date, status, payment_status, payment_method, delivery_method, user_id, guest_email, guest_name, guest_phone, shipping_street, shipping_city, shipping_zip, shipping_country, billing_street, billing_city, billing_zip, billing_country, subtotal, total_amount, delivery_cost, discount_amount, promotion_id, promotion_code, notes, admin_notes, tracking_number, cancelled_at, cancellation_reason, delivered_at, status_changed_at) VALUES (
    {order['id']},
    {self.escape_string(order['order_number'])},
    {self.format_datetime(order['order_date'])},
    {self.escape_string(order['status'])},
    {self.escape_string(order['payment_status'])},
    {self.escape_string(order['payment_method'])},
    {self.escape_string(order['delivery_method'])},
    {order['user_id']},
    {self.escape_string(order['guest_email'])},
    {self.escape_string(order['guest_name'])},
    {self.escape_string(order['guest_phone'])},
    {self.escape_string(order['shipping_street'])},
    {self.escape_string(order['shipping_city'])},
    {self.escape_string(order['shipping_zip'])},
    {self.escape_string(order['shipping_country'])},
    {self.escape_string(order['billing_street'])},
    {self.escape_string(order['billing_city'])},
    {self.escape_string(order['billing_zip'])},
    {self.escape_string(order['billing_country'])},
    {self.format_decimal(order['subtotal'])},
    {self.format_decimal(order['total_amount'])},
    {self.format_decimal(order['delivery_cost'])},
    {self.format_decimal(order['discount_amount'])},
    {order['promotion_id'] if order['promotion_id'] else 'NULL'},
    {self.escape_string(order['promotion_code'])},
    {self.escape_string(order['notes'])},
    {self.escape_string(order['admin_notes'])},
    {self.escape_string(order['tracking_number'])},
    {self.format_datetime(order['cancelled_at'])},
    {self.escape_string(order['cancellation_reason'])},
    {self.format_datetime(order['delivered_at'])},
    {self.format_datetime(order['status_changed_at'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_order_items_sql(self):
        """Generate INSERT statements for order items"""
        statements = []
        for item in self.data.order_items:
            sql = f"""INSERT INTO order_items (id, product_id, quantity, price, order_id) VALUES (
    {item['id']},
    {item['product_id']},
    {item['quantity']},
    {self.format_decimal(item['price'])},
    {item['order_id']}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_reviews_sql(self):
        """Generate INSERT statements for reviews"""
        statements = []
        for review in self.data.reviews:
            sql = f"""INSERT INTO reviews (id, product_id, user_id, status, rating, comment, created_at) VALUES (
    {review['id']},
    {review['product_id']},
    {review['user_id']},
    {self.escape_string(review['status'])},
    {review['rating']},
    {self.escape_string(review['comment'])},
    {self.format_datetime(review['created_at'])}
);"""
            statements.append(sql)
        return '\n'.join(statements)

    def generate_sequence_resets(self):
        """Generate statements to reset auto-increment sequences"""
        tables_and_maxes = [
            ('brands', len(self.data.brands)),
            ('categories', len(self.data.categories)),
            ('subcategories', len(self.data.subcategories)),
            ('users', len(self.data.users)),
            ('products', len(self.data.products)),
            ('orders', len(self.data.orders)),
            ('order_items', len(self.data.order_items)),
            ('reviews', len(self.data.reviews)),
        ]
        statements = []
        for table, max_id in tables_and_maxes:
            statements.append(f"ALTER TABLE {table} ALTER COLUMN id RESTART WITH {max_id + 1};")
        return '\n'.join(statements)

    def generate_full_sql(self):
        """Generate complete SQL script"""
        sections = [
            "-- ============================================",
            "-- Zoo Pet Store Database Seed Script",
            f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
            "-- ============================================",
            "",
            "-- Disable foreign key checks",
            "SET REFERENTIAL_INTEGRITY FALSE;",
            "",
            "-- Clear existing data",
            self.generate_delete_statements(),
            "",
            "-- Insert brands",
            self.generate_brands_sql(),
            "",
            "-- Insert categories",
            self.generate_categories_sql(),
            "",
            "-- Insert subcategories",
            self.generate_subcategories_sql(),
            "",
            "-- Insert users",
            self.generate_users_sql(),
            "",
            "-- Insert products",
            self.generate_products_sql(),
            "",
            "-- Insert orders",
            self.generate_orders_sql(),
            "",
            "-- Insert order items",
            self.generate_order_items_sql(),
            "",
            "-- Insert reviews",
            self.generate_reviews_sql(),
            "",
            "-- Reset sequences",
            self.generate_sequence_resets(),
            "",
            "-- Enable foreign key checks",
            "SET REFERENTIAL_INTEGRITY TRUE;",
            "",
            "-- Done!",
            f"-- Total records: {self.get_total_records()}",
        ]
        return '\n'.join(sections)

    def get_total_records(self):
        """Get total number of records"""
        return (len(self.data.brands) + len(self.data.categories) +
                len(self.data.subcategories) + len(self.data.users) +
                len(self.data.products) + len(self.data.orders) +
                len(self.data.order_items) + len(self.data.reviews))


# ============================================================================
# DATABASE EXECUTOR
# ============================================================================

def execute_with_jdbc(sql_file_path):
    """Execute SQL file using JDBC connection"""
    if not HAS_JDBC:
        print("jaydebeapi not installed. Cannot execute SQL directly.")
        return False

    # Find H2 JAR
    h2_jar = None
    possible_paths = [
        H2_JAR_PATH,
        os.path.expanduser("~/.m2/repository/com/h2database/h2/2.2.224/h2-2.2.224.jar"),
        os.path.expanduser("~/.m2/repository/com/h2database/h2/2.3.232/h2-2.3.232.jar"),
        "/usr/share/java/h2.jar",
    ]

    for path in possible_paths:
        if os.path.exists(path):
            h2_jar = path
            break

    if not h2_jar:
        # Try to find any H2 jar
        m2_h2_path = os.path.expanduser("~/.m2/repository/com/h2database/h2/")
        if os.path.exists(m2_h2_path):
            for version_dir in os.listdir(m2_h2_path):
                jar_path = os.path.join(m2_h2_path, version_dir, f"h2-{version_dir}.jar")
                if os.path.exists(jar_path):
                    h2_jar = jar_path
                    break

    if not h2_jar:
        print("H2 JAR not found. Please install H2 database or specify the path.")
        print("You can run: mvn dependency:resolve to download dependencies.")
        return False

    print(f"Using H2 JAR: {h2_jar}")

    try:
        # Read SQL file
        with open(sql_file_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        # Connect to H2
        conn = jaydebeapi.connect(
            "org.h2.Driver",
            JDBC_URL,
            [DB_USER, DB_PASSWORD],
            h2_jar
        )

        cursor = conn.cursor()

        # Execute SQL statements
        statements = sql_content.split(';')
        executed = 0
        for stmt in statements:
            stmt = stmt.strip()
            if stmt and not stmt.startswith('--'):
                try:
                    cursor.execute(stmt)
                    executed += 1
                except Exception as e:
                    if 'comment' not in str(e).lower():
                        print(f"Warning: {e}")

        conn.commit()
        cursor.close()
        conn.close()

        print(f"Successfully executed {executed} SQL statements.")
        return True

    except Exception as e:
        print(f"Error executing SQL: {e}")
        return False


# ============================================================================
# MAIN
# ============================================================================

def main():
    print("=" * 60)
    print("Zoo Pet Store - Database Seeding Script")
    print("=" * 60)
    print()

    # Generate data
    generator = DataGenerator()
    generator.generate_all()

    # Generate SQL
    sql_gen = SQLGenerator(generator)
    sql_content = sql_gen.generate_full_sql()

    # Save SQL file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    sql_file = os.path.join(script_dir, 'seed_data.sql')

    with open(sql_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)

    print(f"\nSQL file saved to: {sql_file}")

    # Try to execute
    if HAS_JDBC:
        print("\nAttempting to execute SQL...")
        success = execute_with_jdbc(sql_file)
        if success:
            print("\nDatabase seeded successfully!")
        else:
            print("\nCould not execute SQL directly.")
            print(f"You can manually run the SQL file: {sql_file}")
            print("\nTo run manually in H2 console:")
            print("  1. Start the Spring Boot application")
            print("  2. Go to http://localhost:8080/h2-console")
            print("  3. Connect with jdbc:h2:file:./db/zoo")
            print(f"  4. Run the SQL from {sql_file}")
    else:
        print("\nTo execute the SQL file:")
        print("  1. Install jaydebeapi: pip install jaydebeapi JPype1")
        print("  2. Run this script again")
        print("\nOr manually run the SQL in H2 console:")
        print("  1. Start the Spring Boot application")
        print("  2. Go to http://localhost:8080/h2-console")
        print(f"  3. Run the SQL from {sql_file}")

    print("\n" + "=" * 60)
    print("Done!")
    print("=" * 60)


if __name__ == "__main__":
    main()
