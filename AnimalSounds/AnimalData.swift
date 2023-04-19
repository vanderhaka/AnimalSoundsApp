import Foundation

let farmAnimals = AnimalCategory(name: "Farm Animals", animals: [
   
    Animal(uuid: UUID(), name: "Cow", thumbnail: "cowThumbnail", imageSoundMap: ["cow1": "cowSound1", "cow2": "cowSound2"], isPremium: true),
    Animal(uuid: UUID(), name: "Dog", thumbnail: "dogThumbnail", imageSoundMap: ["dog1": "dogSound1", "dog2": "dogSound2"], isPremium: true),
    Animal(uuid: UUID(), name: "Horse", thumbnail: "horseThumbnail", imageSoundMap: ["horse1": "horseSound1", "horse2": "horseSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Sheep", thumbnail: "sheepThumbnail", imageSoundMap: ["sheep1": "sheepSound1", "sheep2": "sheepSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Pig", thumbnail: "pigThumbnail", imageSoundMap: ["pig1": "pigSound1", "pig2": "pigSound2"], isPremium: true),
    Animal(uuid: UUID(), name: "Goat", thumbnail: "goatThumbnail", imageSoundMap: ["goat1": "goatSound1", "goat2": "goatSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Chicken", thumbnail: "chickenThumbnail", imageSoundMap: ["chicken1": "chickenSound1", "chicken2": "chickenSound2"], isPremium: true),
    Animal(uuid: UUID(), name: "Rooster", thumbnail: "roosterThumbnail", imageSoundMap: ["rooster1": "roosterSound1", "rooster2": "roosterSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Turkey", thumbnail: "turkeyThumbnail", imageSoundMap: ["turkey1": "turkeySound1", "turkey2": "turkeySound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Cat", thumbnail: "catThumbnail", imageSoundMap: ["cat1": "catSound1", "cat2": "catSound2"], isPremium: false)
    
])
let wildAnimals = AnimalCategory(name: "Wild Animals", animals: [
    
    Animal(uuid: UUID(), name: "Lion", thumbnail: "lionThumbnail", imageSoundMap: ["lion1": "lionSound1", "lion2": "lionSound2"], isPremium: true),
    Animal(uuid: UUID(), name: "Tiger", thumbnail: "tigerThumbnail", imageSoundMap: ["tiger1": "tigerSound1", "tiger2": "tigerSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Elephant", thumbnail: "elephantThumbnail", imageSoundMap: ["elephant1": "elephantSound1", "elephant2": "elephantSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Gorilla", thumbnail: "gorillaThumbnail", imageSoundMap: ["gorilla1": "gorillaSound1", "gorilla2": "gorillaSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Chimpanzee", thumbnail: "chimpanzeeThumbnail", imageSoundMap: ["chimpanzee1": "chimpanzeeSound1", "chimpanzee2": "chimpanzeeSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Orangutan", thumbnail: "orangutanThumbnail", imageSoundMap: ["orangutan1": "orangutanSound1", "orangutan2": "orangutanSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Cheetah", thumbnail: "cheetahThumbnail", imageSoundMap: ["cheetah1": "cheetahSound1", "cheetah2": "cheetahSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Jaguar", thumbnail: "jaguarThumbnail", imageSoundMap: ["jaguar1": "jaguarSound1", "jaguar2": "jaguarSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Zebra", thumbnail: "zebraThumbnail", imageSoundMap: ["zebra1": "zebraSound1", "zebra2": "zebraSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Frog", thumbnail: "frogThumbnail", imageSoundMap: ["frog1": "frogSound1", "frog2": "frogSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Seal", thumbnail: "sealThumbnail", imageSoundMap: ["seal1": "sealSound1", "seal2": "sealSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Dolphin", thumbnail: "dolphinThumbnail", imageSoundMap: ["dolphin1": "dolphinSound1", "dolphin2": "dolphinSound2"], isPremium: false)

    
    // add more wild animals here
])


let birds = AnimalCategory(name: "Birds", animals: [
    
    
    Animal(uuid: UUID(), name: "Eagle", thumbnail: "eagleThumbnail", imageSoundMap: ["eagle1": "eagleSound1", "eagle2": "eagleSound2"], isPremium: false),
    
    Animal(uuid: UUID(), name: "Penguin", thumbnail: "penguinThumbnail", imageSoundMap: ["penguin1": "penguinSound1", "penguin2": "penguinSound2"], isPremium: false),
    
    Animal(uuid: UUID(), name: "Toucan", thumbnail: "toucanThumbnail", imageSoundMap: ["toucan1": "toucanSound1", "toucan2": "toucanSound2"], isPremium: false),
    
    Animal(uuid: UUID(), name: "Kookaburra", thumbnail: "kookaburraThumbnail", imageSoundMap: ["kookaburra1": "kookaburraSound1", "kookaburra2": "kookaburraSound2"], isPremium: false),
    
    Animal(uuid: UUID(), name: "Chicken", thumbnail: "chickenThumbnail", imageSoundMap: ["chicken1": "chickenSound1", "chicken2": "chickenSound2"], isPremium: true),
    
    Animal(uuid: UUID(), name: "Rooster", thumbnail: "roosterThumbnail", imageSoundMap: ["rooster1": "roosterSound1", "rooster2": "roosterSound2"], isPremium: false)

    
    // add more wild animals here
])
