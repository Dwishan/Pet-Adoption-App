class Pet {
  final String name;
  final String category;
  final String age;
  final String price;
  String imageUrl;
  String description;
  bool isAdopted;

  Pet({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.age,
    required this.price,
    required this.isAdopted,
  });
}

final List<Pet> petList = [
  Pet(
    name: "American Bobtail",
    category: "Cats",
    imageUrl: "lib/assets/american-bobtail.jpg",
    age: "3",
    price: "Rs.60000",
    isAdopted: false,
    description:
        "The American Bobtail is a distinct breed of domestic cat known for its unique bobbed tail and wild appearance. These cats are medium to large in size, with a muscular build and a coat that can be either short or semi-long. They have a distinctive wild appearance, often likened to that of a wild bobcat, with tufted ears and a broad, expressive face. ",
  ),
  Pet(
      name: "Catfish",
      category: "Fish",
      imageUrl: "lib/assets/catfish.jpg",
      age: "2",
      price: "Rs.300",
      isAdopted: false,
      description:
          "Catfish are a diverse group of ray-finned fish known for their prominent barbels, which resemble whiskers, and their flat heads. They inhabit freshwater environments worldwide and are prized for their culinary value in many cultures. Catfish vary greatly in size, with some species being small enough to fit in a home aquarium, while others can grow to enormous sizes in natural habitats. "),
  Pet(
    name: "Tiger Barbs",
    category: "Fish",
    imageUrl: "lib/assets/tiger-barb.jpg",
    age: "3",
    price: "Rs.100",
    isAdopted: false,
    description:
        "Tiger barbs are vibrant and lively freshwater fish that belong to the Barb family. They are named for their striking resemblance to tigers, with alternating black vertical stripes on a bright orange body. These fish are native to Southeast Asia and are popular among aquarium enthusiasts for their active behavior and striking appearance.",
  ),
  Pet(
      name: "Alaskan Husky",
      category: "Dogs",
      imageUrl: "lib/assets/alaskan-husky.jpg",
      age: "6",
      price: "Rs.42000",
      isAdopted: false,
      description:
          "The Alaskan Husky is a working dog breed known for its strength, endurance, and versatility in cold climates. Unlike purebred breeds like the Siberian Husky or the Alaskan Malamute, the Alaskan Husky is not a recognized breed by kennel clubs like the American Kennel Club (AKC). Instead, it is a category of dog that encompasses various crossbreeds developed specifically for sled racing and pulling loads in harsh Arctic conditions."),
  Pet(
      name: "Ocellaris Clownfish",
      category: "Fish",
      imageUrl: "lib/assets/clownfish.jpg",
      age: "2",
      price: "Rs.832",
      isAdopted: false,
      description:
          "The Ocellaris Clownfish, also known as the False Percula Clownfish or Common Clownfish, is a popular and iconic saltwater fish species native to the tropical waters of the Indian and Pacific Oceans. These small, brightly colored fish are renowned for their striking appearance, making them a favorite among aquarium enthusiasts."),
  Pet(
    name: "American Bulldog",
    category: "Dogs",
    imageUrl: "lib/assets/bulldog.jpg",
    age: "4",
    price: "Rs.50000",
    isAdopted: false,
    description:
        "The American Bulldog is a muscular and powerful breed of working dog known for its strength, athleticism, and loyalty. Originally developed in the United States, these dogs were historically used for various tasks, including farm work, livestock herding, and as guardians. Today, they are cherished as beloved family pets, as well as versatile working dogs in roles such as therapy, service, and search and rescue.",
  ),
  Pet(
    name: "German Shepard",
    category: "Dog",
    imageUrl: "lib/assets/german-shepard.jpg",
    age: "6",
    price: "Rs.15000",
    isAdopted: false,
    description:
        "The German Shepherd is a highly versatile and intelligent breed of dog known for its loyalty, courage, and versatility. Originally developed in Germany in the late 19th century, German Shepherds were bred primarily for their herding and guarding abilities. Today, they are widely regarded as one of the most popular and respected breeds worldwide, valued for their exceptional working abilities, as well as their loving and loyal nature as family companions.",
  ),
  Pet(
    name: "Cockatiel",
    category: "Birds",
    imageUrl: "lib/assets/cockatiel.jpg",
    age: "3",
    price: "Rs.1665",
    isAdopted: false,
    description:
        "The cockatiel, also known as the miniature cockatoo or weero, is a small and popular pet bird belonging to the cockatoo family. Native to Australia, cockatiels are widely kept as companion animals due to their friendly demeanor, charming personality, and ability to mimic sounds.",
  ),
  Pet(
    name: "Chinese Harlequin",
    category: "Cats",
    imageUrl: "lib/assets/harlequin.jpg",
    age: "5",
    price: "Rs.10000",
    isAdopted: false,
    description:
        "Harlequin cats, also known as tortoiseshell-and-white cats, are domestic felines with a distinct coat pattern characterized by patches of two colors: typically a combination of black or dark brown and orange or cream, interspersed with white. The patches are irregularly distributed across the cat's body, creating a visually striking and unique appearance.",
  ),
  Pet(
    name: "Hawk",
    category: "Birds",
    imageUrl: "lib/assets/hawk.jpg",
    age: "3",
    price: "Rs.20000",
    isAdopted: false,
    description:
        "Hawks are predatory birds belonging to the family Accipitridae, which includes various species characterized by their keen eyesight, powerful talons, and hooked beaks adapted for hunting. These birds of prey are found on every continent except Antarctica and are known for their agility and prowess in capturing prey.",
  ),
  Pet(
    name: "Golden Retriever",
    category: "Dogs",
    imageUrl: "lib/assets/retriever.jpg",
    age: "2",
    price: "Rs.15000",
    isAdopted: false,
    description:
        "The Golden Retriever is a popular and beloved dog breed known for its friendly and gentle temperament, intelligence, and versatility. Originally developed in Scotland during the mid-19th century, Golden Retrievers were bred as hunting companions to retrieve game, particularly waterfowl, for hunters. Today, they are cherished as loyal family pets, therapy dogs, and service animals.",
  ),
  Pet(
    name: "Himalayan Sheepdog",
    category: "Dogs",
    imageUrl: "lib/assets/sheepdog.jpg",
    age: "7",
    price: "Rs.3500",
    isAdopted: false,
    description:
        "The Himalayan Sheepdog, also known as the Bhutia or Bhotiya Dog, is a large and powerful breed native to the Himalayan region of India, Nepal, Bhutan, and Tibet. Primarily used as a livestock guardian and protector of property, these dogs have been bred for centuries by the indigenous Himalayan people to protect their herds of sheep, goats, and cattle from predators such as wolves, leopards, and bears.",
  ),
  Pet(
    name: "Cichlids",
    category: "Fish",
    imageUrl: "lib/assets/cichlids.jpg",
    age: "2",
    price: "Rs.100",
    isAdopted: false,
    description:
        "Cichlids are a diverse group of freshwater fish belonging to the family Cichlidae, found in tropical and subtropical regions around the world. They are known for their vibrant colors, intricate patterns, and wide range of shapes and sizes, making them popular among aquarium enthusiasts.",
  ),
  Pet(
    name: "Parrot",
    category: "Birds",
    imageUrl: "lib/assets/parrot.jpg",
    age: "3",
    price: "Rs.1300",
    isAdopted: false,
    description:
        "Parrot  is a term used to describe a diverse group of birds belonging to the order Psittaciformes, which includes more than 390 species found in tropical and subtropical regions around the world. Parrots are known for their distinctive characteristics, including a curved beak, zygodactyl feet (two toes facing forward and two toes facing backward), and the ability to mimic sounds and human speech.",
  ),
  Pet(
    name: "Goldfish",
    category: "Fish",
    imageUrl: "lib/assets/goldfish.jpg",
    age: "4",
    price: "Rs.50",
    isAdopted: false,
    description:
        "Goldfish are a popular and widely recognized freshwater fish species belonging to the family Cyprinidae. They are one of the most common aquarium fish worldwide, cherished for their attractive appearance, ease of care, and adaptability to a variety of environments.",
  ),
];
