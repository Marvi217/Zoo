package com.example.zoo.config;

import com.example.zoo.entity.*;
import com.example.zoo.enums.ProductStatus;
import com.example.zoo.enums.UserRole;
import com.example.zoo.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
@RequiredArgsConstructor
public class DataInitializer {

    @Bean
    CommandLineRunner initDatabase(
            UserRepository userRepository,
            CategoryRepository categoryRepository,
            SubcategoryRepository subcategoryRepository,
            ProductRepository productRepository,
            BrandRepository brandRepository,
            OrderRepository orderRepository,
            PasswordEncoder passwordEncoder) {
        return args -> {
            if (userRepository.count() > 0) {
                System.out.println("Baza danych już zawiera dane - pomijam inicjalizację");
                return;
            }
            orderRepository.deleteAll();
            productRepository.deleteAll();
            subcategoryRepository.deleteAll();
            categoryRepository.deleteAll();
            brandRepository.deleteAll();
            userRepository.deleteAll();

            System.out.println("🗑️  Czyszczenie bazy danych...");

            // ========================================================================
            // 1. TWORZENIE KATEGORII
            // ========================================================================
            System.out.println("📁 Tworzenie kategorii...");

            Brand royalCanin = new Brand();
            royalCanin.setName("Royal Canin");
            royalCanin.setSlug("royal-canin");

            Brand pedigree = new Brand();
            pedigree.setName("Pedigree");
            pedigree.setSlug("pedigree");

            Brand acana = new Brand();
            acana.setName("Acana");
            acana.setSlug("acana");

            Brand purina = new Brand();
            purina.setName("Purina");
            purina.setSlug("purina");

            Brand whiskas = new Brand();
            whiskas.setName("Whiskas");
            whiskas.setSlug("whiskas");

            Brand hills = new Brand();
            hills.setName("Hill's");
            hills.setSlug("hills");

            Brand sheba = new Brand();
            sheba.setName("Sheba");
            sheba.setSlug("sheba");

            Brand perfectFit = new Brand();
            perfectFit.setName("Perfect Fit");
            perfectFit.setSlug("perfect-fit");

            // Marki dla gryzoni
            Brand vitapol = new Brand();
            vitapol.setName("Vitapol");
            vitapol.setSlug("vitapol");

            Brand jrFarm = new Brand();
            jrFarm.setName("JR Farm");
            jrFarm.setSlug("jr-farm");

            Brand beaphar = new Brand();
            beaphar.setName("Beaphar");
            beaphar.setSlug("beaphar");

            // Vitapol już mamy z sekcji gryzoni (użyj tej samej zmiennej)

            Brand verseleLaga = new Brand();
            verseleLaga.setName("Versele-Laga");
            verseleLaga.setSlug("versele-laga");

            Brand trill = new Brand();
            trill.setName("Trill");
            trill.setSlug("trill");

            Brand tetra = new Brand();
            tetra.setName("Tetra");
            tetra.setSlug("tetra");

            Brand jbl = new Brand();
            jbl.setName("JBL");
            jbl.setSlug("jbl");

            Brand tropical = new Brand();
            tropical.setName("Tropical");
            tropical.setSlug("tropical");

            Brand zooMed = new Brand();
            zooMed.setName("Zoo Med");
            zooMed.setSlug("zoo-med");

            // Zapisywanie wszystkich marek do bazy danych
            brandRepository.saveAll(List.of(
                    royalCanin, pedigree, acana, purina, whiskas, hills, sheba, perfectFit,
                    vitapol, jrFarm, beaphar, verseleLaga, trill, tetra, jbl, tropical, zooMed
            ));

            System.out.println("✅ Zapisano " + brandRepository.count() + " marek.");

            Category dogs = new Category("Psy", "psy", "🐕", "Wszystko dla Twojego psa");
            Category cats = new Category("Koty", "koty", "🐈", "Wszystko dla Twojego kota");
            Category rodents = new Category("Gryzonie", "gryzonie", "🐹", "Wszystko dla Twoich gryzoni");
            Category birds = new Category("Ptaki", "ptaki", "🦜", "Wszystko dla Twoich ptaków");
            Category fish = new Category("Ryby", "ryby", "🐠", "Wszystko dla Twoich ryb");
            Category reptiles = new Category("Gady", "gady", "🦎", "Wszystko dla Twoich gadów");

            categoryRepository.saveAll(List.of(dogs, cats, rodents, birds, fish, reptiles));

// Podkategorie dla psów
            Subcategory dogFood = new Subcategory("Karma", "psy-karma", "🦴", "Najlepsza karma dla Twojego psa", dogs);
            Subcategory dogToys = new Subcategory("Zabawki", "psy-zabawki", "🎾", "Zabawki rozwijające dla psów", dogs);
            Subcategory dogAcc = new Subcategory("Akcesoria", "psy-akcesoria", "🦮", "Smycze, obroże i legowiska", dogs);
            Subcategory dogSupplements = new Subcategory("Suplementy", "psy-suplementy", "💊", "Witaminy i suplementy dla psów", dogs);

// Podkategorie dla kotów
            Subcategory catFood = new Subcategory("Karma", "koty-karma", "🐱", "Zdrowa karma dla kotów", cats);
            Subcategory catToys = new Subcategory("Zabawki", "koty-zabawki", "🧶", "Wędki i drapaki dla kotów", cats);
            Subcategory catAcc = new Subcategory("Akcesoria", "koty-akcesoria", "🐾", "Obroże i legowiska dla kotów", cats);
            Subcategory catSupplements = new Subcategory("Suplementy", "koty-suplementy", "💊", "Witaminy i suplementy dla kotów", cats);

// Podkategorie dla gryzoni
            Subcategory rodentFood = new Subcategory("Karma", "gryzonie-karma", "🌾", "Pokarm dla gryzoni", rodents);
            Subcategory rodentToys = new Subcategory("Zabawki", "gryzonie-zabawki", "🎡", "Zabawki i tunele dla gryzoni", rodents);
            Subcategory rodentAcc = new Subcategory("Akcesoria", "gryzonie-akcesoria", "🏠", "Klatki i akcesoria dla gryzoni", rodents);
            Subcategory rodentSupplements = new Subcategory("Suplementy", "gryzonie-suplementy", "💊", "Witaminy dla gryzoni", rodents);

// Podkategorie dla ptaków
            Subcategory birdFood = new Subcategory("Karma", "ptaki-karma", "🌾", "Pokarm dla ptaków", birds);
            Subcategory birdToys = new Subcategory("Zabawki", "ptaki-zabawki", "🪶", "Zabawki dla ptaków", birds);
            Subcategory birdAcc = new Subcategory("Akcesoria", "ptaki-akcesoria", "🏠", "Klatki i akcesoria dla ptaków", birds);
            Subcategory birdSupplements = new Subcategory("Suplementy", "ptaki-suplementy", "💊", "Witaminy dla ptaków", birds);

// Podkategorie dla ryb
            Subcategory fishFood = new Subcategory("Karma", "ryby-karma", "🐟", "Pokarm dla ryb", fish);
            Subcategory fishAcc = new Subcategory("Akcesoria", "ryby-akcesoria", "🏊", "Akwaria i wyposażenie", fish);
            Subcategory fishSupplements = new Subcategory("Suplementy", "ryby-suplementy", "💊", "Preparaty do wody", fish);

// Podkategorie dla gadów
            Subcategory reptileFood = new Subcategory("Karma", "gady-karma", "🦗", "Pokarm dla gadów", reptiles);
            Subcategory reptileAcc = new Subcategory("Akcesoria", "gady-akcesoria", "🏜️", "Terraria i wyposażenie", reptiles);
            Subcategory reptileSupplements = new Subcategory("Suplementy", "gady-suplementy", "💊", "Witaminy dla gadów", reptiles);

            subcategoryRepository.saveAll(List.of(
                    dogFood, dogToys, dogAcc, dogSupplements,
                    catFood, catToys, catAcc, catSupplements,
                    rodentFood, rodentToys, rodentAcc, rodentSupplements,
                    birdFood, birdToys, birdAcc, birdSupplements,
                    fishFood, fishAcc, fishSupplements,
                    reptileFood, reptileAcc, reptileSupplements
            ));

            System.out.println("✅ Utworzono 6 kategorii");

            // ========================================================================
// 2. LISTA PRODUKTÓW
// ========================================================================
            List<Product> allProducts = new ArrayList<>();

// ========================================================================
// PSY - FOOD (5 produktów)
// ========================================================================
            System.out.println("🦴 Dodawanie produktów dla psów...");

            allProducts.add(createFood(
                    "Royal Canin Medium Adult 15kg",
                    "Kompletna karma dla psów dorosłych ras średnich (11-25kg) w wieku od 12 miesięcy do 7 lat. Wspiera naturalną odporność i utrzymuje prawidłową masę mięśniową.",
                    new BigDecimal("189.00"),
                    "🦴",
                    dogFood,
                    45,
                    royalCanin,
                    "PSY_ŚREDNIE_RASY",
                    LocalDate.of(2026, 12, 31),
                    "Drób (mąka z kurczaka, tłuszcz drobiowy), ryż, kukurydza, hydrolizat białek zwierzęcych"
            ));

            allProducts.add(createFood(
                    "Pedigree Adult z wołowiną 15kg",
                    "Karma sucha dla dorosłych psów wszystkich ras. Z witaminami, minerałami i omega-3 dla zdrowej skóry i lśniącej sierści.",
                    new BigDecimal("149.00"),
                    "🦴",
                    dogFood,
                    32,
                    pedigree,
                    "PSY_WSZYSTKIE_RASY",
                    LocalDate.of(2026, 10, 15),
                    "Wołowina (20%), zboża, oleje roślinne, białka zwierzęce, warzywa"
            ));

            allProducts.add(createFood(
                    "Acana Puppy Small Breed 2kg",
                    "Karma dla szczeniąt ras małych. Bez zbóż, bogata w mięso (60%). Wspiera zdrowy rozwój.",
                    new BigDecimal("89.00"),
                    "🦴",
                    dogFood,
                    28,
                    acana,
                    "PSY_MAŁE_RASY_SZCZENIĘTA",
                    LocalDate.of(2027, 3, 20),
                    "Kurczak bez kości (30%), indyk, jaja, ryby, owoce, warzywa"
            ));

            allProducts.add(createFood(
                    "Purina Pro Plan Large Athletic Adult 14kg",
                    "Karma dla dużych psów aktywnych. Z wysoką zawartością białka. Wspiera kondycję i masę mięśniową.",
                    new BigDecimal("219.00"),
                    "🦴",
                    dogFood,
                    19,
                    purina,
                    "PSY_DUŻE_RASY",
                    LocalDate.of(2026, 11, 30),
                    "Kurczak (20%), pszenica, kukurydza, białko zwierzęce, gluten"
            ));

            allProducts.add(createFood(
                    "Royal Canin Mini Senior 8+ 8kg",
                    "Karma dla starszych psów ras małych (do 10kg) powyżej 8 roku życia. Wspiera witalność i zdrowe starzenie.",
                    new BigDecimal("159.00"),
                    "🦴",
                    dogFood,
                    23,
                    royalCanin,
                    "PSY_MAŁE_RASY_SENIOR",
                    LocalDate.of(2027, 1, 15),
                    "Drób, ryż, kukurydza, białka zwierzęce, glukozamina, chondroityna"
            ));

// ========================================================================
// PSY - TOY (5 produktów)
// ========================================================================

            allProducts.add(createToy(
                    "Kong Classic Red Large",
                    "Kultowa zabawka dla psów. Z naturalnej gumy, niezniszczalna. Można napełnić smakołykami.",
                    new BigDecimal("45.00"),
                    "🎾",
                    dogToys,
                    30,
                    "GUMA_NATURALNA",
                    "DOROŚLE"
            ));

            allProducts.add(createToy(
                    "Piłka tenisowa dla psów 3-pak",
                    "Zestaw trzech piłek idealnych do aportowania. Bezpieczne dla psich zębów.",
                    new BigDecimal("19.99"),
                    "🎾",
                    dogToys,
                    78,
                    "FILC",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Sznur do przeciągania 40cm",
                    "Pleciona zabawka ze sznura bawełnianego. Czyści zęby podczas zabawy.",
                    new BigDecimal("24.99"),
                    "🎾",
                    dogToys,
                    54,
                    "BAWEŁNA",
                    "DOROŚLE"
            ));

            allProducts.add(createToy(
                    "Frisbee dla psów 22cm",
                    "Miękkie frisbee bezpieczne dla zębów. Pływa na wodzie. Idealne do parku.",
                    new BigDecimal("29.99"),
                    "🎾",
                    dogToys,
                    41,
                    "GUMA_MIĘKKA",
                    "DOROŚLE"
            ));

            allProducts.add(createToy(
                    "Pluszowy miśищący dla szczeniąt",
                    "Miękka pluszowa zabawka z piszczałką. Idealna dla szczeniąt i małych psów.",
                    new BigDecimal("34.99"),
                    "🎾",
                    dogToys,
                    62,
                    "PLUSZ",
                    "SZCZENIĘTA"
            ));

// ========================================================================
// PSY - ACCESSORY (5 produktów)
// ========================================================================

            allProducts.add(createAccessory(
                    "Smycz treningowa nylonowa 3m",
                    "Wytrzymała smycz z uchwytem neoprenowym. Regulowana długość. Odblaskowe elementy.",
                    new BigDecimal("49.99"),
                    "🦮",
                    dogAcc,
                    45,
                    "NYLON",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Obroża skórzana z blaszką 35-45cm",
                    "Naturalna skóra, regulowana. Z kółkiem na adresówkę. Kolor brązowy.",
                    new BigDecimal("69.99"),
                    "🦮",
                    dogAcc,
                    38,
                    "SKÓRA",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Legowisko ortopedyczne 90x70cm",
                    "Z pianką memory foam. Zdejmowany pokrowiec do prania. Antypoślizgowe dno.",
                    new BigDecimal("189.00"),
                    "🦮",
                    dogAcc,
                    16,
                    "PIANKA_MEMORY",
                    "L"
            ));

            allProducts.add(createAccessory(
                    "Miska ceramiczna antypoślizgowa 1.5L",
                    "Ciężka miska, stabilna. Łatwa w czyszczeniu. Można myć w zmywarce.",
                    new BigDecimal("34.99"),
                    "🦮",
                    dogAcc,
                    67,
                    "CERAMIKA",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Transporter samochodowy 80x55x60cm",
                    "Zgodny z IATA. Z metalowymi drzwiczkami. Wentylacja z 4 stron.",
                    new BigDecimal("249.00"),
                    "🦮",
                    dogAcc,
                    12,
                    "PLASTIK_WZMOCNIONY",
                    "L"
            ));

// ========================================================================
// PSY - SUPPLEMENT (3 produkty)
// ========================================================================

            allProducts.add(createSupplement(
                    "Omega-3 dla psów z oleju z łososia 250ml",
                    "Wspiera zdrowie skóry, sierści i stawów. Poprawia odporność. Naturalny olej z łososia.",
                    new BigDecimal("45.99"),
                    "💊",
                    dogSupplements,
                    54,
                    "1 łyżeczka dziennie",
                    LocalDate.of(2027, 6, 30)
            ));

            allProducts.add(createSupplement(
                    "Probiotyki dla psów 60 tabletek",
                    "Wspierają trawienie i florę bakteryjną. Idealne podczas stresu lub po antybiotykoterapii.",
                    new BigDecimal("59.99"),
                    "💊",
                    dogSupplements,
                    41,
                    "1 tabletka dziennie",
                    LocalDate.of(2027, 8, 15)
            ));

            allProducts.add(createSupplement(
                    "Kompleks witamin dla szczeniąt 30 tabletek",
                    "Wspiera zdrowy rozwój kości, stawów i układu nerwowego. Smak wątróbki.",
                    new BigDecimal("39.99"),
                    "💊",
                    dogSupplements,
                    73,
                    "1 tabletka dziennie",
                    LocalDate.of(2027, 5, 20)
            ));

// ========================================================================
// KOTY - FOOD (5 produktów)
// ========================================================================
            System.out.println("🐱 Dodawanie produktów dla kotów...");

            allProducts.add(createFood(
                    "Whiskas Adult z kurczakiem 14kg",
                    "Kompletna karma dla dorosłych kotów. Z witaminami i minerałami. Wspiera zdrowie układu moczowego.",
                    new BigDecimal("139.00"),
                    "🐱",
                    catFood,
                    38,
                    whiskas,
                    "KOTY_DOROSŁE",
                    LocalDate.of(2026, 11, 30),
                    "Kurczak (20%), zboża, białka zwierzęce, oleje roślinne, witaminy"
            ));

            allProducts.add(createFood(
                    "Royal Canin Indoor Adult 10kg",
                    "Karma dla kotów żyjących w domu. Redukuje zapach z kuwety. Kontrola kul włosowych.",
                    new BigDecimal("189.00"),
                    "🐱",
                    catFood,
                    27,
                    royalCanin,
                    "KOTY_DOMOWE",
                    LocalDate.of(2027, 1, 15),
                    "Drób, ryż, psyllium, błonnik, białka zwierzęce, glukozamina"
            ));

            allProducts.add(createFood(
                    "Hill's Science Plan Kitten 1.5kg",
                    "Karma dla kociąt do 12 miesiąca życia. Wspiera rozwój mózgu i oczu. DHA z oleju rybnego.",
                    new BigDecimal("79.00"),
                    "🐱",
                    catFood,
                    32,
                    hills,
                    "KOTY_KOCIĘTA",
                    LocalDate.of(2027, 2, 28),
                    "Kurczak (32%), ryba, ryż, białka zwierzęce, tauryna, DHA"
            ));

            allProducts.add(createFood(
                    "Sheba Perfect Portions kurczak 24x37.5g saszetki",
                    "Porcje w sosie, bez konserwantów. Idealne porcje bez marnowania. Smak kurczaka.",
                    new BigDecimal("45.99"),
                    "🐱",
                    catFood,
                    56,
                    sheba,
                    "KOTY_DOROSŁE",
                    LocalDate.of(2026, 9, 30),
                    "Kurczak (40%), bulion drobiowy, warzywa, witaminy, minerały"
            ));

            allProducts.add(createFood(
                    "Perfect Fit Senior 7+ z indykiem 1.4kg",
                    "Karma dla kotów starszych. Wspiera zdrowie nerek i stawów. Niższa kaloryczność.",
                    new BigDecimal("59.99"),
                    "🐱",
                    catFood,
                    44,
                    perfectFit,
                    "KOTY_SENIOR",
                    LocalDate.of(2027, 4, 15),
                    "Indyk (18%), zboża, białka zwierzęce, glukozamina, antyoksydanty"
            ));

// ========================================================================
// KOTY - TOY (5 produktów)
// ========================================================================

            allProducts.add(createToy(
                    "Wędka dla kota z piórkami 40cm",
                    "Interaktywna zabawka. Piórka naturalne. Rozbudza instynkt łowiecki.",
                    new BigDecimal("19.99"),
                    "🧶",
                    catToys,
                    89,
                    "PIÓRKA_NATURALNE",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Mysz pluszowa z kocimiętką 8cm",
                    "Pachnąca kocimiętką mysz. Stymuluje do zabawy. Wypełnienie z kocimiętką organiczną.",
                    new BigDecimal("14.99"),
                    "🧶",
                    catToys,
                    124,
                    "PLUSZ",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Piłka szeleszcząca 6cm 3-pak",
                    "Lekkie piłki z szeleszczącym wypełnieniem. Kolorowe, przyciągają uwagę.",
                    new BigDecimal("12.99"),
                    "🧶",
                    catToys,
                    98,
                    "PLASTIK",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Tunel dla kota składany 120cm",
                    "Tunel z szeleszczącej tkaniny. Łatwy do złożenia. Zabawa i schowanie w jednym.",
                    new BigDecimal("49.99"),
                    "🧶",
                    catToys,
                    34,
                    "NYLON",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Laserowy wskaźnik dla kota USB",
                    "Automatyczny laserowy wskaźnik. Różne wzory ruchu. Ładowanie przez USB.",
                    new BigDecimal("79.99"),
                    "🧶",
                    catToys,
                    23,
                    "PLASTIK_ELEKTRONIKA",
                    "WSZYSTKIE"
            ));

// ========================================================================
// KOTY - ACCESSORY (5 produktów)
// ========================================================================

            allProducts.add(createAccessory(
                    "Drapak dla kota 120cm z platformami",
                    "Stabilny drapak z sizalu. Trzy platformy do odpoczynku. Zabawka na sprężynie.",
                    new BigDecimal("189.00"),
                    "🐾",
                    catAcc,
                    18,
                    "SIZAL",
                    "L"
            ));

            allProducts.add(createAccessory(
                    "Kuweta zamknięta z filtrem 50x40x40cm",
                    "Z filtrem węglowym eliminującym zapachy. Łopatka w zestawie. Łatwe czyszczenie.",
                    new BigDecimal("129.00"),
                    "🐾",
                    catAcc,
                    31,
                    "PLASTIK",
                    "L"
            ));

            allProducts.add(createAccessory(
                    "Legowisko przyczepiane do grzejnika",
                    "Mocowanie na grzejnik. Miękki polar. Wytrzymałe do 7kg. Łatwy montaż.",
                    new BigDecimal("69.99"),
                    "🐾",
                    catAcc,
                    45,
                    "POLAR",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Miska podwójna ceramiczna na podstawie",
                    "Dwie miski na podstawie. Antypoślizgowa. Można myć w zmywarce. Estetyczny design.",
                    new BigDecimal("44.99"),
                    "🐾",
                    catAcc,
                    58,
                    "CERAMIKA",
                    "S"
            ));

            allProducts.add(createAccessory(
                    "Transporter dla kota 48x32x32cm",
                    "Lekki transporter z metalowymi drzwiczkami. Wentylacja boczna. Kolor szary.",
                    new BigDecimal("89.00"),
                    "🐾",
                    catAcc,
                    26,
                    "PLASTIK",
                    "M"
            ));

// ========================================================================
// KOTY - SUPPLEMENT (3 produkty)
// ========================================================================

            allProducts.add(createSupplement(
                    "Pasta na kule włosowe dla kotów 100g",
                    "Ułatwia wydalanie kul włosowych. Smak słodu. Naturalny skład bez parafinów.",
                    new BigDecimal("29.99"),
                    "💊",
                    catSupplements,
                    67,
                    "3cm pasty dziennie",
                    LocalDate.of(2027, 7, 31)
            ));

            allProducts.add(createSupplement(
                    "Tauryna dla kotów 50ml",
                    "Wspiera pracę serca i wzrok. Niezbędna dla kotów. Płynna forma łatwa w podawaniu.",
                    new BigDecimal("39.99"),
                    "💊",
                    catSupplements,
                    52,
                    "1ml dziennie",
                    LocalDate.of(2027, 9, 15)
            ));

            allProducts.add(createSupplement(
                    "Kompleks witamin dla kotów senior 60 tabletek",
                    "Dla kotów powyżej 7 roku życia. Wspiera stawy i odporność. Smak kurczaka.",
                    new BigDecimal("54.99"),
                    "💊",
                    catSupplements,
                    38,
                    "1 tabletka dziennie",
                    LocalDate.of(2027, 6, 20)
            ));

// ========================================================================
// GRYZONIE - FOOD (5 produktów)
// ========================================================================
            System.out.println("🐹 Dodawanie produktów dla gryzoni...");

            allProducts.add(createFood(
                    "Vitapol Karma Premium dla chomika 500g",
                    "Kompletna karma dla chomików. Z warzywami i owocami. Wspiera zdrowie i witalność.",
                    new BigDecimal("12.99"),
                    "🐹",
                    rodentFood,
                    85,
                    vitapol,
                    "CHOMIKI",
                    LocalDate.of(2026, 8, 31),
                    "Zboża (40%), nasiona, bakalie, warzywa suszone, witaminy"
            ));

            allProducts.add(createFood(
                    "JR Farm Karma dla świnki morskiej 1kg",
                    "Bez zbóż, bogata w witaminę C. Zrównoważona karma z warzywami i ziołami.",
                    new BigDecimal("24.99"),
                    "🐹",
                    rodentFood,
                    62,
                    jrFarm,
                    "ŚWINKI_MORSKIE",
                    LocalDate.of(2026, 10, 15),
                    "Trawy łąkowe (30%), warzywa suszone, zioła, witamina C"
            ));

            allProducts.add(createFood(
                    "Vitapol Siano łąkowe Premium 500g",
                    "Naturalne siano z łąk górskich. Dla królików i gryzoni. Wspiera trawienie.",
                    new BigDecimal("9.99"),
                    "🐹",
                    rodentFood,
                    134,
                    vitapol,
                    "KRÓLIKI_GRYZONIE",
                    LocalDate.of(2026, 12, 31),
                    "Trawy łąkowe naturalne (100%), bez dodatków"
            ));

            allProducts.add(createFood(
                    "Beaphar Care+ Rabbit 1.5kg",
                    "Granulat ekstrudowany dla królików. Wspiera zdrowie zębów. Z ziołami.",
                    new BigDecimal("34.99"),
                    "🐹",
                    rodentFood,
                    47,
                    beaphar,
                    "KRÓLIKI",
                    LocalDate.of(2027, 2, 28),
                    "Trawy, zboża, warzywa, lucerna, echinaceae, yucca"
            ));

            allProducts.add(createFood(
                    "Vitapol Pokarm dla myszki i szczura 400g",
                    "Urozmaicona mieszanka dla myszy i szczurów. Z białkiem zwierzęcym.",
                    new BigDecimal("11.99"),
                    "🐹",
                    rodentFood,
                    71,
                    vitapol,
                    "MYSZY_SZCZURY",
                    LocalDate.of(2026, 11, 30),
                    "Zboża, nasiona, warzywa, białko zwierzęce, witaminy"
            ));

// ========================================================================
// GRYZONIE - TOY (4 produkty)
// ========================================================================

            allProducts.add(createToy(
                    "Tunel pluszowy dla gryzoni 30cm",
                    "Miękki tunel z polaru. Idealny do zabawy i odpoczynku. Można prać.",
                    new BigDecimal("24.99"),
                    "🎪",
                    rodentToys,
                    56,
                    "POLAR",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Kółko do biegania 20cm",
                    "Plastikowe kółko dla chomików i myszek. Ciche, bezpieczne. Montaż do klatki.",
                    new BigDecimal("34.99"),
                    "🎪",
                    rodentToys,
                    43,
                    "PLASTIK",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Most drewniany ze sznurkiem 28cm",
                    "Most do wspinania się. Naturalne drewno. Ściera zęby. Zabawa i relaks.",
                    new BigDecimal("19.99"),
                    "🎪",
                    rodentToys,
                    78,
                    "DREWNO",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Piłka wiklinowa z dzwoneczkiem 8cm",
                    "Naturalna wiklina. Z dzwoneczkiem w środku. Do gryzienia i zabawy.",
                    new BigDecimal("14.99"),
                    "🎪",
                    rodentToys,
                    92,
                    "WIKLINA",
                    "WSZYSTKIE"
            ));

// ========================================================================
// GRYZONIE - ACCESSORY (5 produktów)
// ========================================================================

            allProducts.add(createAccessory(
                    "Klatka metalowa dla chomika 60x40x30cm",
                    "Przestronna klatka z wyposażeniem. Plastikowe dno, kraty metalowe. Łatwy dostęp.",
                    new BigDecimal("199.00"),
                    "🏠",
                    rodentAcc,
                    12,
                    "METAL",
                    "L"
            ));

            allProducts.add(createAccessory(
                    "Domek drewniany dla gryzoni 15x12x10cm",
                    "Naturalny domek z drewna. Bez lakierów i klejów. Można zgryzać.",
                    new BigDecimal("29.99"),
                    "🏠",
                    rodentAcc,
                    87,
                    "DREWNO",
                    "S"
            ));

            allProducts.add(createAccessory(
                    "Kuweta narożna dla królika",
                    "Oszczędza miejsce w klatce. Z siatką i hakiem mocującym. Łatwe czyszczenie.",
                    new BigDecimal("24.99"),
                    "🏠",
                    rodentAcc,
                    64,
                    "PLASTIK",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Pojemnik na wodę szklany 500ml",
                    "Z metalowym ustnikiem. Wisi na klatce. Łatwe napełnianie z góry.",
                    new BigDecimal("19.99"),
                    "🏠",
                    rodentAcc,
                    103,
                    "SZKŁO",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Miska ceramiczna dla gryzoni 200ml",
                    "Ciężka, stabilna. Nie przewraca się. Można myć w zmywarce.",
                    new BigDecimal("14.99"),
                    "🏠",
                    rodentAcc,
                    118,
                    "CERAMIKA",
                    "S"
            ));

// ========================================================================
// GRYZONIE - SUPPLEMENT (3 produkty)
// ========================================================================

            allProducts.add(createSupplement(
                    "Witaminy dla gryzoni 50ml",
                    "Kompleks witamin i minerałów. Wzmacnia odporność. Dodawać do wody lub karmy.",
                    new BigDecimal("19.99"),
                    "💊",
                    rodentSupplements,
                    67,
                    "2 krople dziennie",
                    LocalDate.of(2027, 3, 31)
            ));

            allProducts.add(createSupplement(
                    "Pasta witaminowa dla królików 100g",
                    "Wspiera trawienie i florę bakteryjną. Smaczna pasta do podawania bezpośrednio.",
                    new BigDecimal("24.99"),
                    "💊",
                    rodentSupplements,
                    51,
                    "2cm pasty dziennie",
                    LocalDate.of(2027, 5, 15)
            ));

            allProducts.add(createSupplement(
                    "Kamień mineralny dla gryzoni 50g",
                    "Dostarcza wapń i minerały. Ściera zęby. Z ziołami.",
                    new BigDecimal("9.99"),
                    "💊",
                    rodentSupplements,
                    145,
                    "Dostępny stale w klatce",
                    LocalDate.of(2028, 1, 31)
            ));

// ========================================================================
// PTAKI - FOOD (5 produktów)
// ========================================================================
            System.out.println("🦜 Dodawanie produktów dla ptaków...");

            allProducts.add(createFood(
                    "Vitapol Pokarm dla papugi falistej 500g",
                    "Pełnowartościowy pokarm dla papużek. Z dodatkiem jodu i minerałów.",
                    new BigDecimal("14.99"),
                    "🦜",
                    birdFood,
                    78,
                    vitapol,
                    "PAPUGI_MAŁE",
                    LocalDate.of(2026, 9, 30),
                    "Proso (40%), owies, kanarkowy, słonecznik, minerały, jod"
            ));

            allProducts.add(createFood(
                    "Versele-Laga Prestige Premium dla kanarków 1kg",
                    "Mieszanka dla kanarków. Wspiera śpiew i kondycję. Czyste ziarna.",
                    new BigDecimal("19.99"),
                    "🦜",
                    birdFood,
                    62,
                    verseleLaga,
                    "KANARKI",
                    LocalDate.of(2026, 11, 15),
                    "Kanarkowy (30%), niger, len, nasiona traw, wapń"
            ));

            allProducts.add(createFood(
                    "Trill Pokarm dla nimfy 1kg",
                    "Zbilansowany pokarm dla nimf. Z owocami i warzywami. Bez sztucznych barwników.",
                    new BigDecimal("24.99"),
                    "🦜",
                    birdFood,
                    54,
                    trill,
                    "NIMFY",
                    LocalDate.of(2027, 1, 31),
                    "Proso, owies, słonecznik, owoce suszone (5%), warzywa"
            ));

            allProducts.add(createFood(
                    "Versele-Laga NutriBird A21 dla piskląt 800g",
                    "Pokarm do ręcznego karmienia piskląt. Kompletny skład odżywczy.",
                    new BigDecimal("89.99"),
                    "🦜",
                    birdFood,
                    23,
                    verseleLaga,
                    "PISKLĘTA",
                    LocalDate.of(2026, 8, 31),
                    "Zboża, białka (33%), oleje, minerały, probiotyki, enzymy"
            ));

            allProducts.add(createFood(
                    "Vitapol Pokarm dla papugi dużej 900g",
                    "Dla dużych papug (żako, ara). Duże ziarna, orzechy. Wysokoenergetyczny.",
                    new BigDecimal("34.99"),
                    "🦜",
                    birdFood,
                    41,
                    vitapol,
                    "PAPUGI_DUŻE",
                    LocalDate.of(2027, 2, 28),
                    "Słonecznik, orzechy, zboża, owoce suszone, wapń"
            ));

// ========================================================================
// PTAKI - TOY (4 produkty)
// ========================================================================

            allProducts.add(createToy(
                    "Huśtawka drewniana dla papużki 15cm",
                    "Naturalne drewno. Z dzwoneczkiem. Można zgryzać. Montaż do klatki.",
                    new BigDecimal("19.99"),
                    "🪶",
                    birdToys,
                    89,
                    "DREWNO",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Zabawka z linek i kulek kolorowych",
                    "Z naturalnych materiałów. Rozwijająca, kolorowa. Dla małych i średnich papug.",
                    new BigDecimal("24.99"),
                    "🪶",
                    birdToys,
                    67,
                    "BAWEŁNA_DREWNO",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Lustrzanko z dzwoneczkami dla papużki",
                    "Lustrzanko akrylowe bezpieczne. Z dzwoneczkami. Ptaki uwielbiają!",
                    new BigDecimal("14.99"),
                    "🪶",
                    birdToys,
                    102,
                    "PLASTIK",
                    "WSZYSTKIE"
            ));

            allProducts.add(createToy(
                    "Drabinka drewniana 40cm",
                    "Do wspinania się. 7 stopni. Naturalne drewno bez lakierów.",
                    new BigDecimal("29.99"),
                    "🪶",
                    birdToys,
                    54,
                    "DREWNO",
                    "WSZYSTKIE"
            ));

// ========================================================================
// PTAKI - ACCESSORY (5 produktów)
// ========================================================================

            allProducts.add(createAccessory(
                    "Klatka dla papużki 46x36x61cm",
                    "Z wyposażeniem (żerdki, miseczki). Wyjmowana szuflada. Kolor biały.",
                    new BigDecimal("179.00"),
                    "🏠",
                    birdAcc,
                    15,
                    "METAL",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Żerdka naturalna 20cm 2szt",
                    "Z naturalnego drewna owocowego. Różne średnice. Ściera pazury i dziób.",
                    new BigDecimal("16.99"),
                    "🏠",
                    birdAcc,
                    94,
                    "DREWNO",
                    "S"
            ));

            allProducts.add(createAccessory(
                    "Karmnik automatyczny dla ptaków",
                    "Z dozownikiem. Minimalizuje marnowanie pokarmu. Łatwe napełnianie.",
                    new BigDecimal("24.99"),
                    "🏠",
                    birdAcc,
                    78,
                    "PLASTIK",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Wanna do kąpieli zawieszana",
                    "Przezroczysta. Zawiesza się na drzwiczkach klatki. Z daszkiem.",
                    new BigDecimal("19.99"),
                    "🏠",
                    birdAcc,
                    112,
                    "PLASTIK",
                    "S"
            ));

            allProducts.add(createAccessory(
                    "Osłonka na klatkę nocna 60x40x80cm",
                    "Zmniejsza stres i światło. Pomaga w utrzymaniu temperatury. Materiał oddychający.",
                    new BigDecimal("39.99"),
                    "🏠",
                    birdAcc,
                    43,
                    "TKANINA",
                    "L"
            ));

// ========================================================================
// PTAKI - SUPPLEMENT (3 produkty)
// ========================================================================

            allProducts.add(createSupplement(
                    "Witaminy dla papug 50ml",
                    "Kompleks witamin A, D3, E. Wspiera wzrok i pierzenie. Dodawać do wody.",
                    new BigDecimal("22.99"),
                    "💊",
                    birdSupplements,
                    61,
                    "3 krople na 100ml wody",
                    LocalDate.of(2027, 4, 30)
            ));

            allProducts.add(createSupplement(
                    "Probiotyki dla ptaków 25g",
                    "Wspierają florę bakteryjną. Po antybiotykach lub w stresie. Proszek do karmy.",
                    new BigDecimal("29.99"),
                    "💊",
                    birdSupplements,
                    48,
                    "Szczypta dziennie",
                    LocalDate.of(2027, 7, 15)
            ));

            allProducts.add(createSupplement(
                    "Kamień sepii dla ptaków 10cm",
                    "Naturalna sepia. Dostarcza wapń. Ściera dziób. Z klipsem do zawieszenia.",
                    new BigDecimal("7.99"),
                    "💊",
                    birdSupplements,
                    167,
                    "Dostępny stale w klatce",
                    LocalDate.of(2028, 12, 31)
            ));

// ========================================================================
// RYBY - FOOD (5 produktów)
// ========================================================================
            System.out.println("🐠 Dodawanie produktów dla ryb...");

            allProducts.add(createFood(
                    "Tetra Min Flakes 1000ml",
                    "Podstawowy pokarm w płatkach dla wszystkich ryb ozdobnych. Wzmacnia kolory.",
                    new BigDecimal("49.99"),
                    "🐠",
                    fishFood,
                    67,
                    tetra,
                    "RYBY_WSZYSTKIE",
                    LocalDate.of(2026, 10, 31),
                    "Ryby, zboża, glony, drożdże, oleje, karotenoidy"
            ));

            allProducts.add(createFood(
                    "JBL NovoGranoMix 250ml",
                    "Granulat dla ryb o różnych rozmiarach. Pływający i tonący. Bogaty skład.",
                    new BigDecimal("29.99"),
                    "🐠",
                    fishFood,
                    54,
                    jbl,
                    "RYBY_WSZYSTKIE",
                    LocalDate.of(2026, 12, 15),
                    "Ryby, zboża, skorupiaki, algi spirulina, witaminy"
            ));

            allProducts.add(createFood(
                    "Tropical Red Parrot 1000ml",
                    "Specjalistyczny pokarm dla papugi czerwonej. Wzmacnia czerwoną barwę.",
                    new BigDecimal("44.99"),
                    "🐠",
                    fishFood,
                    38,
                    tropical,
                    "PAPUGI_CZERWONE",
                    LocalDate.of(2027, 1, 31),
                    "Ryby, kryl, spirulina, karotenoidy, astaksantyna"
            ));

            allProducts.add(createFood(
                    "Tetra Goldfish Energy Sticks 250ml",
                    "Pływające pałeczki dla złotych rybek. Z prebiotykami. Łatwo trawne.",
                    new BigDecimal("24.99"),
                    "🐠",
                    fishFood,
                    72,
                    tetra,
                    "ZŁOTE_RYBKI",
                    LocalDate.of(2026, 11, 30),
                    "Zboża, ryby, glony, prebiotyki, witaminy, minerały"
            ));

            allProducts.add(createFood(
                    "JBL NovoStick XL 1000ml",
                    "Dla dużych ryb mięsożernych. Duże pałeczki. Wysokoenergetyczny.",
                    new BigDecimal("59.99"),
                    "🐠",
                    fishFood,
                    29,
                    jbl,
                    "RYBY_DUŻE",
                    LocalDate.of(2027, 3, 15),
                    "Ryby (45%), zboża, skorupiaki, witaminy"
            ));

// ========================================================================
// RYBY - ACCESSORY (5 produktów)
// ========================================================================

            allProducts.add(createAccessory(
                    "Akwarium prostokątne 54L 60x30x30cm",
                    "Kompletny zestaw z pokrywą i oświetleniem LED. Szkło float 4mm.",
                    new BigDecimal("299.00"),
                    "🏊",
                    fishAcc,
                    12,
                    "SZKŁO",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Filtr wewnętrzny 300L/h",
                    "Do akwariów 50-100L. Z gąbką i wkładem węglowym. Cicha praca.",
                    new BigDecimal("79.99"),
                    "🏊",
                    fishAcc,
                    34,
                    "PLASTIK",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Grzałka 100W z termostatem",
                    "Automatyczna regulacja temperatury 20-34°C. Z przyssawkami. Wskaźnik LED.",
                    new BigDecimal("49.99"),
                    "🏊",
                    fishAcc,
                    56,
                    "SZKŁO_PLASTIK",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Oświetlenie LED 45cm 12W",
                    "Promuje wzrost roślin. Regulacja jasności. Energooszczędne.",
                    new BigDecimal("89.99"),
                    "🏊",
                    fishAcc,
                    28,
                    "ALUMINIUM",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Dekoracja ceramiczna jaskinia 15cm",
                    "Kryjówka dla ryb. Bezpieczna ceramika. Naturalne wykończenie.",
                    new BigDecimal("34.99"),
                    "🏊",
                    fishAcc,
                    87,
                    "CERAMIKA",
                    "M"
            ));

// ========================================================================
// RYBY - SUPPLEMENT (3 produkty)
// ========================================================================

            allProducts.add(createSupplement(
                    "Tetra AquaSafe 500ml",
                    "Uzdatniacz wody. Neutralizuje chlor i metale ciężkie. Chroni skrzela.",
                    new BigDecimal("39.99"),
                    "💊",
                    fishSupplements,
                    73,
                    "5ml na 10L wody",
                    LocalDate.of(2027, 6, 30)
            ));

            allProducts.add(createSupplement(
                    "JBL Biotopol 500ml",
                    "Preparat pielęgnacyjny. Wiąże metale. Chroni błony śluzowe.",
                    new BigDecimal("44.99"),
                    "💊",
                    fishSupplements,
                    58,
                    "10ml na 40L wody",
                    LocalDate.of(2027, 8, 15)
            ));

            allProducts.add(createSupplement(
                    "Bakterie nitryfikacyjne Tetra SafeStart 100ml",
                    "Żywe bakterie do rozruchu akwarium. Przyspieszają cykl azotowy.",
                    new BigDecimal("29.99"),
                    "💊",
                    fishSupplements,
                    41,
                    "Całą butelkę na start",
                    LocalDate.of(2026, 12, 31)
            ));

// ========================================================================
// GADY - FOOD (5 produktów)
// ========================================================================
            System.out.println("🦎 Dodawanie produktów dla gadów...");

            allProducts.add(createFood(
                    "Zoo Med Natural Grassland Tortoise Food 240g",
                    "Pokarm dla żółwi lądowych. Z trawami i kwiatami. Bez białka zwierzęcego.",
                    new BigDecimal("39.99"),
                    "🦎",
                    reptileFood,
                    34,
                    zooMed,
                    "ŻÓŁWIE_LĄDOWE",
                    LocalDate.of(2027, 5, 31),
                    "Trawy (70%), kwiaty, owoce, błonnik, wapń"
            ));

            allProducts.add(createFood(
                    "Tropical Biorept L 250ml",
                    "Pływający pokarm dla żółwi wodnych. Kształt pałeczek. Z witaminami.",
                    new BigDecimal("24.99"),
                    "🦎",
                    reptileFood,
                    51,
                    tropical,
                    "ŻÓŁWIE_WODNE",
                    LocalDate.of(2026, 11, 30),
                    "Ryby, krewetki, glony, witaminy A, D3, E, wapń"
            ));

            allProducts.add(createFood(
                    "Zoo Med Can O' Crickets 35g",
                    "Konserwowane świerszcze dla gadów mięsożernych. Bez konserwantów.",
                    new BigDecimal("19.99"),
                    "🦎",
                    reptileFood,
                    67,
                    zooMed,
                    "GADY_MIĘSOŻERNE",
                    LocalDate.of(2027, 8, 31),
                    "Świerszcze (95%), woda, witaminy"
            ));

            allProducts.add(createFood(
                    "JBL TerraVit Powder 100g",
                    "Preparat witaminowo-mineralny w proszku. Do posypywania pokarmu.",
                    new BigDecimal("34.99"),
                    "🦎",
                    reptileFood,
                    28,
                    jbl,
                    "GADY_WSZYSTKIE",
                    LocalDate.of(2027, 12, 31),
                    "Wapń, witaminy D3, A, E, B, minerały, aminokwasy"
            ));

            allProducts.add(createFood(
                    "Tropical Agama Food 250ml",
                    "Pokarm dla agam i innych jaszczurek. Z owadami. Granulat ekstrudowany.",
                    new BigDecimal("29.99"),
                    "🦎",
                    reptileFood,
                    43,
                    tropical,
                    "JASZCZURKI",
                    LocalDate.of(2027, 4, 30),
                    "Owady suszone (40%), warzywa, owoce, witaminy, minerały"
            ));

// ========================================================================
// GADY - ACCESSORY (4 produkty)
// ========================================================================

            allProducts.add(createAccessory(
                    "Terrarium szklane 60x45x45cm",
                    "Terrarium z przesuwanymi drzwiczkami. Wentylacja boczna.",
                    new BigDecimal("399.00"),
                    "🏠",
                    reptileAcc,
                    8,
                    "SZKŁO",
                    "M"
            ));

            allProducts.add(createAccessory(
                    "Lampa grzewcza ceramiczna 100W",
                    "Emiter ciepła bez światła. Idealny na noc. Z gwintem E27.",
                    new BigDecimal("79.99"),
                    "💡",
                    reptileAcc,
                    34,
                    "CERAMIKA",
                    "S"
            ));

            allProducts.add(createAccessory(
                    "Żwirek CalciSand dla gadów pustynnych 2.5kg",
                    "Piasek wapniowy dla gadów. Jadalny i bezpieczny.",
                    new BigDecimal("34.99"),
                    "🏖️",
                    reptileAcc,
                    67,
                    "WAPIEŃ_MIELONY",
                    "M"
            ));

            // ========================================================================
            // 3. ZAPIS WSZYSTKICH PRODUKTÓW
            // ========================================================================
            // Po zapisaniu produktów, ustaw losowe oceny
            allProducts.forEach(product -> {
                product.setRating((double) (new java.util.Random().nextInt(5) + 1));
            });
            productRepository.saveAll(allProducts);

            productRepository.saveAll(allProducts);

            System.out.println("✅ Utworzono " + allProducts.size() + " produktów");

            // ========================================================================
            // 4. TWORZENIE UŻYTKOWNIKÓW
            // ========================================================================
            System.out.println("👤 Tworzenie użytkowników...");

            // Użytkownik standardowy
            User user = new User();
            user.setFirstName("Jan");
            user.setLastName("Kowalski");
            user.setEmail("user@zoo.com");
            user.setPassword(passwordEncoder.encode("user123"));
            user.setRole(UserRole.USER); // Ustawiamy pojedynczy Enum zamiast Set.of
            user.setActive(true);
            user.setEnabled(true); // Already activated account

// Administrator
            User admin = new User();
            admin.setFirstName("Admin");
            admin.setLastName("Systemowy");
            admin.setEmail("admin@zoo.com");
            admin.setPassword(passwordEncoder.encode("admin123"));
            admin.setRole(UserRole.ADMIN); // Ustawiamy rolę ADMIN
            admin.setActive(true);
            admin.setEnabled(true); // Already activated account

            userRepository.saveAll(List.of(user, admin));
            System.out.println("✅ Utworzono 2 użytkowników");

            // ========================================================================
            // PODSUMOWANIE
            // ========================================================================
            System.out.println("\n" + "=".repeat(60));
            System.out.println("✅ BAZA DANYCH ZOSTAŁA ZAINICJALIZOWANA POMYŚLNIE!");
            System.out.println("=".repeat(60));
            System.out.println("📁 Kategorie: 6");
            System.out.println("📦 Produkty: " + allProducts.size());
            System.out.println("   └─ Food: " + allProducts.stream().filter(p -> p instanceof Feed).count());
            System.out.println("   └─ Toy: " + allProducts.stream().filter(p -> p instanceof Toy).count());
            System.out.println("   └─ Accessory: " + allProducts.stream().filter(p -> p instanceof Accessory).count());
            System.out.println("   └─ Supplement: " + allProducts.stream().filter(p -> p instanceof Supplement).count());
            System.out.println("👤 Użytkownicy: 2");
            System.out.println("=".repeat(60));
            System.out.println("📧 User login:  user@zoo.com / user123");
            System.out.println("🔐 Admin login: admin@zoo.com / admin123");
            System.out.println("=".repeat(60) + "\n");
        };
    }

    // ========================================================================
    // METODY POMOCNICZE
    // ========================================================================

    private Feed createFood(String name, String description, BigDecimal price, String imageUrl,
                            Subcategory subcategory, int stockQuantity, Brand brand, String forSpecies,
                            LocalDate expiryDate, String ingredients) {
        Feed food = new Feed();
        // Wspólne pola dla wszystkich produktów
        setupBaseProduct(food, name, description, price, imageUrl, subcategory, stockQuantity);

        // Pola specyficzne dla Feed
        food.setBrand(brand);
        food.setForSpecies(forSpecies);
        food.setExpiryDate(expiryDate);
        food.setIngredients(ingredients);
        return food;
    }

    private Toy createToy(String name, String description, BigDecimal price, String imageUrl,
                          Subcategory subcategory, int stockQuantity, String material, String ageGroup) {
        Toy toy = new Toy();
        setupBaseProduct(toy, name, description, price, imageUrl, subcategory, stockQuantity);

        toy.setMaterial(material);
        toy.setAgeGroup(ageGroup);
        return toy;
    }

    private Accessory createAccessory(String name, String description, BigDecimal price, String imageUrl,
                                      Subcategory subcategory, int stockQuantity, String material, String size) {
        Accessory accessory = new Accessory();
        setupBaseProduct(accessory, name, description, price, imageUrl, subcategory, stockQuantity);

        accessory.setMaterial(material);
        accessory.setSize(size);
        return accessory;
    }

    private Supplement createSupplement(String name, String description, BigDecimal price, String imageUrl,
                                        Subcategory subcategory, int stockQuantity, String dosage, LocalDate expiryDate) {
        Supplement supplement = new Supplement();
        setupBaseProduct(supplement, name, description, price, imageUrl, subcategory, stockQuantity);

        supplement.setDosage(dosage);
        supplement.setExpiryDate(expiryDate);
        return supplement;
    }

    /**
     * Metoda pomocnicza, aby nie powtarzać kodu dla wspólnych pól Product
     */
    private void setupBaseProduct(Product p, String name, String description, BigDecimal price,
                                  String imageUrl, Subcategory subcategory, int stockQuantity) {
        p.setName(name);
        p.setDescription(description);
        p.setPrice(price);
        p.setImageUrl(imageUrl);
        p.setCategory(subcategory.getCategory());
        p.setSubcategory(subcategory);
        p.setStockQuantity(stockQuantity);
        p.setStatus(ProductStatus.ACTIVE);

    }
}