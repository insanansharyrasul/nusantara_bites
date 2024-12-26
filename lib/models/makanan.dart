/* 
List Makanan 
1. Gudeg
2. Rawon
3. Soto Ayam
4. Rendang
5. Pempek
6. Bika Ambon
7. Soto Banjar
8. Ikan Pais
9. Cincane Chicken
10. Papeda
11. Ikan Kuah Kuning
12. Udang selingkuh
13. Coto Makassar
14. Pallu Basa
15. Kapurung
16. Ikan Asar
17. Nasi Lapola
18. Sagu Lempeng
19. Mie Aceh
20. Ayam Tangkap
21. Kuah Pliek U
22. Gulai Belacan
23. Asam Pedas Patin
24. Roti Jala
25. Tempoyak
26. Gulai Tepek Ikan
27. Nasi Gemuk

List Pulau
1. Jawa
2. Sumatera
3. Kalimantan
4. Papua
5. Sulawesi
6. Maluku
7. Aceh
8. Riau
9. Jambi
*/

class Kategori {
  String pulau;

  Kategori({
    required this.pulau,
  });
}

var listPulau = [
  Kategori(pulau: "Jawa"),
  Kategori(pulau: "Sumatera"),
  Kategori(pulau: "Kalimantan"),
  Kategori(pulau: "Papua"),
  Kategori(pulau: "Sulawesi"),
  Kategori(pulau: "Maluku"),
  Kategori(pulau: "Aceh"),
  Kategori(pulau: "Riau"),
  Kategori(pulau: "Jambi"),
];

class TraditionalFood {
  final String name;
  final String description;
  final Kategori placeOfOrigin;
  final String madeBy;
  final String specificPlace;
  final String imageLocation;

  TraditionalFood({
    required this.name,
    required this.description,
    required this.placeOfOrigin,
    required this.madeBy,
    required this.specificPlace,
    required this.imageLocation,
  });
}

final List<TraditionalFood> foods = [
  // Jawa
  TraditionalFood(
    name: "Gudeg",
    description:
        'Gudeg is a beloved traditional dish from Yogyakarta, Indonesia, made from young jackfruit stewed for hours in coconut milk, palm sugar, and an array of aromatic spices. The result is a sweet, tender, and rich delicacy often complemented by savory side dishes such as opor ayam (chicken cooked in coconut milk), telur pindang (marinated eggs), and sambal krecek (spicy beef skin stew).',
    placeOfOrigin: listPulau[0],
    madeBy: "Javanese",
    specificPlace: "Yogyakarta, Central Java",
    imageLocation: 'images/food/gudeg.jpeg'
  ),
  TraditionalFood(
    name: "Rawon",
    description:
        'Rawon is an iconic Indonesian beef soup originating from East Java, recognized for its distinctive black color derived from keluak nuts. This hearty soup combines tender beef chunks with a flavorful broth made from garlic, shallots, lemongrass, ginger, and various traditional spices. The unique taste of Rawon is earthy, slightly nutty, and savory, making it deeply satisfying. It\'s typically served with steamed rice, bean sprouts, sambal, and salted egg, creating a wholesome and delightful meal.',
    placeOfOrigin: listPulau[0],
    madeBy: "Javanese",
    specificPlace: "East Java",
    imageLocation: 'images/food/rawon.jpg'
  ),
  TraditionalFood(
    name: "Soto Ayam",
    description:
        'Soto Ayam is a comforting Indonesian chicken soup characterized by its bright yellow, turmeric-infused broth. It is a symphony of shredded chicken, glass noodles or rice cakes, boiled eggs, and fresh herbs such as scallions and celery. A squeeze of lime and a dash of sambal enhance the soup\'s zesty and mildly spicy flavor. Soto Ayam is a quintessential dish for Indonesian households, often enjoyed as a hearty breakfast or a warm meal during the rainy season.',
    placeOfOrigin: listPulau[0],
    madeBy: "Javanese",
    specificPlace: "Central Java",
    imageLocation: 'images/food/soto_ayam.jpeg'
  ),

  // Sumatera
  TraditionalFood(
    name: "Rendang",
    description:
        'Rendang, originating from the Minangkabau ethnic group of West Sumatra, is a slow-cooked dry curry featuring tender chunks of beef simmered in coconut milk, chili, lemongrass, and an array of rich spices. The cooking process allows the flavors to deepen, resulting in a complex and aromatic dish. Celebrated for its intense flavor and melt-in-your-mouth texture, Rendang has gained international recognition as one of the world\'s most delicious dishes. It is traditionally prepared during festive occasions and served with steamed rice.',
    placeOfOrigin: listPulau[1],
    madeBy: "Minangkabau",
    specificPlace: "West Sumatra",
    imageLocation: 'images/food/rendang.jpg'
  ),
  TraditionalFood(
    name: "Pempek",
    description:
        'Pempek is a popular Indonesian fish cake from Palembang, South Sumatra, made from ground fish and tapioca flour. This chewy and savory delicacy comes in various shapes and sizes, often stuffed with egg yolks or served plain. The highlight of Pempek lies in its tangy and spicy dipping sauce, known as cuko, made from palm sugar, vinegar, chili, and garlic. This dish is beloved as a snack or a light meal, offering a perfect balance of flavors.',
    placeOfOrigin: listPulau[1],
    madeBy: "Palembang",
    specificPlace: "South Sumatra",
    imageLocation: 'images/food/pempek.jpg'
  ),
  TraditionalFood(
    name: "Bika Ambon",
    description:
        'Bika Ambon is a spongy, honeycomb-textured cake originating from Medan, North Sumatra. Made with coconut milk, sugar, eggs, and tapioca flour, its unique texture and subtle sweetness are achieved through a fermentation process involving yeast. The cake is infused with aromatic pandan leaves or kaffir lime leaves, adding a distinct fragrance. Its moist, bouncy texture and rich flavor make it a favorite dessert or snack among locals and visitors alike.',
    placeOfOrigin: listPulau[1],
    madeBy: "Batak",
    specificPlace: "Medan, North Sumatra",
    imageLocation: 'images/food/bika_ambon.jpg'
  ),

  // Kalimantan
  TraditionalFood(
    name: "Soto Banjar",
    description:
        'Soto Banjar hails from South Kalimantan and is a fragrant chicken soup flavored with warm spices like cinnamon, cloves, and nutmeg. It features shredded chicken, boiled eggs, glass noodles, and crispy fried shallots. This dish is often enjoyed with lontong (rice cakes) or steamed rice and is a staple during special occasions and family gatherings. Its rich, savory taste and comforting aroma make it a cherished culinary treasure.',
    placeOfOrigin: listPulau[2],
    madeBy: "Banjar",
    specificPlace: "South Kalimantan",
    imageLocation: 'images/food/soto_banjar.jpeg'
  ),
  TraditionalFood(
    name: "Ikan Pais",
    description:
        'Ikan Pais is a traditional Indonesian dish where fish is marinated with spices, wrapped in banana leaves, and grilled. The spice blend often includes turmeric, galangal, and coriander, giving the fish a vibrant and flavorful profile. The banana leaf not only imparts a subtle aroma but also helps retain the fish\'s moisture, making it tender and juicy. Ikan Pais is enjoyed with steamed rice and sambal, offering a delightful combination of smokiness and spice.',
    placeOfOrigin: listPulau[2],
    madeBy: "Dayak",
    specificPlace: "Central Kalimantan",
    imageLocation: 'images/food/ikan_pais.jpg'
  ),
  TraditionalFood(
    name: "Cincane Chicken",
    description:
        'Cincane Chicken is a traditional dish from Samarinda, East Kalimantan, featuring chicken marinated in a vibrant red spice blend of galangal, ginger, shallots, garlic, and coconut milk. The chicken is then grilled or roasted until it achieves a smoky and caramelized exterior. The flavor profile is savory, mildly spicy, and aromatic, making it a favorite for special occasions such as weddings and traditional ceremonies. Served with steamed rice and sambal, Cincane Chicken embodies the rich culinary heritage of the region.',
    placeOfOrigin: listPulau[2],
    madeBy: "Kutai",
    specificPlace: "Samarinda, East Kalimantan",
    imageLocation: 'images/food/ayam_cincane.jpg'
  ),

  // Papua
  TraditionalFood(
    name: "Papeda",
    description:
        'Papeda is a staple food of Papua and Maluku, made from sago flour, creating a sticky, translucent porridge. This dish is typically served with savory accompaniments such as fish cooked in a yellow turmeric-based sauce or spicy chili sambal. Papeda is mild in taste, allowing it to absorb the bold flavors of its side dishes. Eating Papeda involves a unique skill, as it is traditionally scooped using a pair of chopsticks or wooden utensils, adding a cultural experience to its enjoyment.',
    placeOfOrigin: listPulau[3],
    madeBy: "Papuan",
    specificPlace: "Papua",
    imageLocation: 'images/food/papeda.jpg'
  ),
  TraditionalFood(
    name: "Ikan Kuah Kuning",
    description:
        'Ikan Kuah Kuning is a yellow fish soup popular in Maluku and Papua. It features fresh fish simmered in a turmeric-based broth with lemongrass, lime leaves, and a hint of chili for warmth. The dish offers a light, tangy, and aromatic flavor, often enjoyed with steamed rice or sago. Ikan Kuah Kuning is celebrated for its simplicity and vibrant color, embodying the coastal regions\' fresh and tropical culinary style.',
    placeOfOrigin: listPulau[3],
    madeBy: "Maluku and Papuan",
    specificPlace: "Papua and Maluku",
    imageLocation: 'images/food/ikan_kuah_kuning.jpg'
  ),
  TraditionalFood(
    name: "Udang Selingkuh",
    description:
        'Udang Selingkuh is a specialty from Papua, featuring freshwater prawns known for their large size and firm texture. The prawns are typically grilled or cooked in a savory and spicy sauce, combining local spices and coconut milk. It\'s named "Selingkuh," meaning "cheating," humorously refers to the prawn\'s oversized claws, resembling those of a crab. This dish is a testament to the rich seafood offerings of Papua and a treat for seafood lovers.',
    placeOfOrigin: listPulau[3],
    madeBy: "Papuan",
    specificPlace: "Papua",
    imageLocation: 'images/food/udang_selingkuh.jpg'
  ),

  // Sulawesi
  TraditionalFood(
    name: "Coto Makassar",
    description:
        'Coto Makassar is a hearty beef soup from South Sulawesi, seasoned with a mix of peanuts, garlic, coriander, and galangal. The rich and creamy broth is enhanced by slow-cooking beef and offal, making it a fulfilling dish. Served with ketupat (rice cakes) and a squeeze of lime, Coto Makassar is a beloved comfort food, perfect for family gatherings and traditional celebrations.',
    placeOfOrigin: listPulau[4],
    madeBy: "Bugis-Makassar",
    specificPlace: "Makassar, South Sulawesi",
    imageLocation: 'images/food/coto_makassar.jpeg'
  ),
  TraditionalFood(
    name: "Pallu Basa",
    description:
        'Pallu Basa, another South Sulawesi dish, is a flavorful beef stew similar to Coto Makassar but with the addition of grated coconut for a nuttier taste. The broth is rich, savory, and deeply aromatic, combining slow-cooked beef with a blend of traditional spices. This dish is usually enjoyed with steamed rice and a squeeze of lime, offering a hearty and satisfying meal that reflects the rich culinary traditions of the region.',
    placeOfOrigin: listPulau[4],
    madeBy: "Bugis-Makassar",
    specificPlace: "Makassar, South Sulawesi",
    imageLocation: 'images/food/pallu_basa.jpg'
  ),
  TraditionalFood(
    name: "Kapurung",
    description:
        'Kapurung is a sago-based dish from South Sulawesi, featuring a savory broth mixed with vegetables, shredded fish, or chicken. The sago balls give the dish a chewy texture, while the broth offers a tangy and spicy flavor. It is a comforting and nutritious dish that showcases the local ingredients of Sulawesi, often enjoyed as a communal meal during family gatherings or festive events.',
    placeOfOrigin: listPulau[4],
    madeBy: "Bugis-Makassar",
    specificPlace: "South Sulawesi",
    imageLocation: 'images/food/kapurung.jpg'
  ),

  // Maluku
  TraditionalFood(
    name: "Ikan Asar",
    description:
        'Ikan Asar is a smoked fish delicacy from Maluku and Papua, prepared using fresh fish marinated with turmeric, salt, and other spices before being smoked over coconut husks. The fish acquires a smoky aroma and tender texture, making it a perfect pairing with sago or rice. Ikan Asar is a staple in coastal communities, reflecting the traditional preservation methods of the region.',
    placeOfOrigin: listPulau[5],
    madeBy: "Maluku",
    specificPlace: "Maluku",
    imageLocation: 'images/food/ikan_asar.jpg'
  ),
  TraditionalFood(
    name: "Nasi Lapola",
    description:
        'Nasi Lapola is a traditional Maluku rice dish mixed with grated coconut and red beans. The rice is steamed to perfection, creating a fragrant and slightly nutty flavor profile. Often paired with grilled fish or sambal, Nasi Lapola is a comforting and wholesome meal, celebrating the region\'s abundance of fresh and natural ingredients.',
    placeOfOrigin: listPulau[5],
    madeBy: "Maluku",
    specificPlace: "Maluku",
    imageLocation: 'images/food/nasi_lapola.jpg'
  ),
  TraditionalFood(
    name: "Sagu Lempeng",
    description:
        'Sagu Lempeng is a traditional sago-based biscuit from Papua and Maluku. It is made by baking sago flour into a crispy and slightly chewy texture, often enjoyed as a snack or breakfast. Its simplicity and versatility allow it to be paired with tea or coffee or eaten with savory dishes like Ikan Kuah Kuning. Sagu Lempeng showcases the resourcefulness of sago as a staple in Eastern Indonesian cuisine.',
    placeOfOrigin: listPulau[5],
    madeBy: "Maluku",
    specificPlace: "Maluku",
    imageLocation: 'images/food/sagu_lempeng.png'
  ),

  // Aceh
  TraditionalFood(
    name: "Mie Aceh",
    description:
        'Mie Aceh is a spicy noodle dish from Aceh, featuring thick yellow noodles stir-fried with meat (chicken, beef, or seafood), chilies, garlic, and various aromatic spices. Served with fried shallots, crackers, and a wedge of lime, Mie Aceh offers a robust, rich, and spicy flavor, making it a favorite street food in Indonesia.',
    placeOfOrigin: listPulau[6],
    madeBy: "Acehnese",
    specificPlace: "Aceh",
    imageLocation: 'images/food/mie_aceh.jpg'
  ),
  TraditionalFood(
    name: "Ayam Tangkap",
    description:
        'Ayam Tangkap is a unique Acehnese fried chicken dish served with crispy fried curry leaves, pandan leaves, and shallots. The chicken is marinated in a mixture of spices, resulting in a flavorful and aromatic meal. This dish is typically shared with family or friends, accompanied by steamed rice, making it a staple during festive occasions in Aceh.',
    placeOfOrigin: listPulau[6],
    madeBy: "Acehnese",
    specificPlace: "Aceh",
    imageLocation: 'images/food/ayam_tangkap.jpg'
  ),
  TraditionalFood(
    name: "Kuah Pliek U",
    description:
        'Kuah Pliek U is a traditional vegetable curry from Aceh, made with a unique fermented coconut paste called "pliek u." This rich and earthy dish combines a variety of vegetables, young jackfruit, and sometimes dried fish or shrimp, cooked in a flavorful broth with turmeric and spices. The dish is a symbol of Acehnese culinary heritage, offering a complex mix of flavors—savory, earthy, and slightly tangy. It is best enjoyed with steamed rice, making it a wholesome and satisfying meal.',
    placeOfOrigin: listPulau[6],
    madeBy: "Acehnese",
    specificPlace: "Aceh",
    imageLocation: 'images/food/kuah_pliek_u.jpg'
  ),

  // Riau
  TraditionalFood(
    name: "Gulai Belacan",
    description:
        'Gulai Belacan is a spicy and aromatic curry from Riau, characterized by the use of belacan (fermented shrimp paste). This curry features seafood like prawns or fish, cooked in a rich coconut milk base infused with turmeric, chilies, and lemongrass. The combination of belacan and spices creates a deeply umami flavor, making it a standout dish in Riau\'s culinary repertoire. It pairs wonderfully with steamed rice for a hearty and flavorful meal.',
    placeOfOrigin: listPulau[7],
    madeBy: "Malay",
    specificPlace: "Riau",
    imageLocation: 'images/food/gulai_belacan.jpg'
  ),
  TraditionalFood(
    name: "Asam Pedas Patin",
    description:
        'Asam Pedas Patin is a tangy and spicy fish curry from Sumatra, typically prepared with patin fish (a type of catfish). The dish’s vibrant broth is made with tamarind, chilies, turmeric, and lemongrass, delivering a perfect balance of sour and spicy flavors. This dish is a staple in Sumatran households, often enjoyed with steamed rice and fresh vegetables. Its bold and refreshing taste makes it a favorite among seafood lovers.',
    placeOfOrigin: listPulau[7],
    madeBy: "Malay",
    specificPlace: "Riau",
    imageLocation: 'images/food/patin_asam_pedas.jpg'
  ),
  TraditionalFood(
    name: "Roti Jala",
    description:
        'Roti Jala, meaning "net bread," is a traditional Malay dish made by pouring thin, lacy batter onto a hot pan. These delicate crepes are often served with rich curries like chicken or mutton, making them a versatile and delicious accompaniment. The soft, slightly chewy texture of Roti Jala contrasts beautifully with the bold flavors of the curry, making it a popular choice for festive occasions and family gatherings.',
    placeOfOrigin: listPulau[7],
    madeBy: "Malay",
    specificPlace: "Riau",
    imageLocation: 'images/food/roti_jala.jpg'
  ),

  // Jambi
  TraditionalFood(
    name: "Tempoyak",
    description:
        'Tempoyak is a fermented durian paste, popular in Sumatra and Malaysia, used as a condiment or cooking ingredient. Its bold, tangy flavor pairs exceptionally well with dishes like fish curry or sambal. Although an acquired taste, Tempoyak holds a special place in the hearts of durian lovers and is cherished for its unique and pungent aroma, reflecting the creative use of local ingredients.',
    placeOfOrigin: listPulau[8],
    madeBy: "Malay",
    specificPlace: "Jambi",
    imageLocation: 'images/food/tempoyak.jpeg'
  ),
  TraditionalFood(
    name: "Gulai Tepek Ikan",
    description:
        'Gulai Tepek Ikan is a traditional fish cake curry from Jambi, made with ground fish and tapioca flour, shaped into flat cakes. The cakes are simmered in a coconut milk-based curry enriched with turmeric, lemongrass, and tamarind. This dish offers a harmonious blend of creamy, tangy, and savory flavors, making it a cherished delicacy during festive occasions in Jambi.',
    placeOfOrigin: listPulau[8],
    madeBy: "Malay",
    specificPlace: "Jambi",
    imageLocation: 'images/food/gulai_tepek.jpg'
  ),
  TraditionalFood(
    name: "Nasi Gemuk",
    description:
        'Nasi Gemuk, similar to Malaysia\'s Nasi Lemak, is a flavorful rice dish cooked in coconut milk and pandan leaves. It is served with sambal, fried anchovies, boiled eggs, peanuts, and sometimes curry or fried chicken. The rich, aromatic rice combined with the spicy and savory side dishes makes Nasi Gemuk a beloved breakfast dish, offering a satisfying start to the day.',
    placeOfOrigin: listPulau[8],
    madeBy: "Malay",
    specificPlace: "Jambi",
    imageLocation: 'images/food/nasi_gemuk.jpg'
  ),
];
