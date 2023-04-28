import Foundation
let farmAnimals = AnimalCategory(name: "Farm Animals", imageName: "farmtitle", animals: [
   
    Animal(uuid: UUID(), name: "Cow", thumbnail: "cowThumbnail", imageSoundMap: ["cow1": "cowSound1", "cow2": "cowSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Dog", thumbnail: "dogThumbnail", imageSoundMap: ["dog1": "dogSound1", "dog2": "dogSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Pig", thumbnail: "pigThumbnail", imageSoundMap: ["pig1": "pigSound1", "pig2": "pigSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Chicken", thumbnail: "chickenThumbnail", imageSoundMap: ["chicken1": "chickenSound1", "chicken2": "chickenSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Horse", thumbnail: "horseThumbnail", imageSoundMap: ["horse1": "horseSound1", "horse2": "horseSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Sheep", thumbnail: "sheepThumbnail", imageSoundMap: ["sheep1": "sheepSound1", "sheep2": "sheepSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Goat", thumbnail: "goatThumbnail", imageSoundMap: ["goat1": "goatSound1", "goat2": "goatSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Rooster", thumbnail: "roosterThumbnail", imageSoundMap: ["rooster1": "roosterSound1", "rooster2": "roosterSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Cat", thumbnail: "catThumbnail", imageSoundMap: ["cat1": "catSound1", "cat2": "catSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Donkey", thumbnail: "donkeyThumbnail", imageSoundMap: ["donkey1": "donkeySound1", "donkey2": "donkeySound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Goose", thumbnail: "gooseThumbnail", imageSoundMap: ["goose1": "gooseSound1", "goose2": "gooseSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Mouse", thumbnail: "mouseThumbnail", imageSoundMap: ["mouse1": "mouseSound1", "mouse2": "mouseSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Rat", thumbnail: "ratThumbnail", imageSoundMap: ["rat1": "ratSound1", "rat2": "ratSound2"], isPremium: false),    Animal(uuid: UUID(), name: "Alpaca", thumbnail: "alpacaThumbnail", imageSoundMap: ["alpaca1": "alpacaSound1", "alpaca2": "alpacaSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Piglet ", thumbnail: "pigletThumbnail", imageSoundMap: ["piglet1": "pigletSound1", "piglet2": "pigletSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Bull", thumbnail: "bullThumbnail", imageSoundMap: ["bull1": "bullSound1", "bull2": "bullSound2"], isPremium: false)
    
])
let wildAnimals = AnimalCategory(name: "Wild Animals", imageName: "wildtitle", animals: [
    
    Animal(uuid: UUID(), name: "Lion", thumbnail: "lionThumbnail", imageSoundMap: ["lion1": "lionSound1", "lion2": "lionSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Tiger", thumbnail: "tigerThumbnail", imageSoundMap: ["tiger1": "tigerSound1", "tiger2": "tigerSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "T-Rex", thumbnail: "trexThumbnail", imageSoundMap: ["trex1": "trexSound1", "trex2": "trexSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Elephant", thumbnail: "elephantThumbnail", imageSoundMap: ["elephant1": "elephantSound1", "elephant2": "elephantSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Gorilla", thumbnail: "gorillaThumbnail", imageSoundMap: ["gorilla1": "gorillaSound1", "gorilla2": "gorillaSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Seal", thumbnail: "sealThumbnail", imageSoundMap: ["seal1": "sealSound1", "seal2": "sealSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Chimpanzee", thumbnail: "chimpanzeeThumbnail", imageSoundMap: ["chimpanzee1": "chimpanzeeSound1", "chimpanzee2": "chimpanzeeSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Orangutan", thumbnail: "orangutanThumbnail", imageSoundMap: ["orangutan1": "orangutanSound1", "orangutan2": "orangutanSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Cheetah", thumbnail: "cheetahThumbnail", imageSoundMap: ["cheetah1": "cheetahSound1", "cheetah2": "cheetahSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Jaguar", thumbnail: "jaguarThumbnail", imageSoundMap: ["jaguar1": "jaguarSound1", "jaguar2": "jaguarSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Dolphin", thumbnail: "dolphinThumbnail", imageSoundMap: ["dolphin1": "dolphinSound1", "dolphin2": "dolphinSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Zebra", thumbnail: "zebraThumbnail", imageSoundMap: ["zebra1": "zebraSound1", "zebra2": "zebraSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Baboon", thumbnail: "baboonThumbnail", imageSoundMap: ["baboon1": "baboonSound1", "baboon2": "baboonSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Grizzly Bear", thumbnail: "grizzly BearThumbnail", imageSoundMap: ["grizzlybear1": "grizzlybearSound1", "grizzlybear2": "grizzlybearSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Polar Bear", thumbnail: "polar BearThumbnail", imageSoundMap: ["polarbear1": "polarbearSound1", "polarbear2": "polarbearSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Otter", thumbnail: "otterThumbnail", imageSoundMap: ["otter1": "otterSound1", "otter2": "otterSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Hyena", thumbnail: "hyenaThumbnail", imageSoundMap: ["hyena1": "hyenaSound1", "hyena2": "hyenaSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Wolf", thumbnail: "wolfThumbnail", imageSoundMap: ["wolf1": "wolfSound1", "wolf2": "wolfSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Python", thumbnail: "pythonThumbnail", imageSoundMap: ["python1": "pythonSound1", "python2": "pythonSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Frog", thumbnail: "frogThumbnail", imageSoundMap: ["frog1": "frogSound1", "frog2": "frogSound2"], isPremium: false)
    
    // add more wild animals here
])
let birds = AnimalCategory(name: "Birds", imageName: "birdstitle", animals: [
    
    
    Animal(uuid: UUID(), name: "Eagle", thumbnail: "eagleThumbnail", imageSoundMap: ["eagle1": "eagleSound1", "eagle2": "eagleSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Kookaburra", thumbnail: "kookaburraThumbnail", imageSoundMap: ["kookaburra1": "kookaburraSound1", "kookaburra2": "kookaburraSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Chicken", thumbnail: "chickenThumbnail", imageSoundMap: ["chicken1": "chickenSound1", "chicken2": "chickenSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Penguin", thumbnail: "penguinThumbnail", imageSoundMap: ["penguin1": "penguinSound1", "penguin2": "penguinSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Magpie", thumbnail: "magpieThumbnail", imageSoundMap: ["magpie1": "magpieSound1", "magpie2": "magpieSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Raven", thumbnail: "ravenThumbnail", imageSoundMap: ["raven1": "ravenSound1", "raven2": "ravenSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Turkey", thumbnail: "turkeyThumbnail", imageSoundMap: ["turkey1": "turkeySound1", "turkey2": "turkeySound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Woodpecker", thumbnail: "woodpeckerThumbnail", imageSoundMap: ["woodpecker1": "woodpeckerSound1", "woodpecker2": "woodpeckerSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Peacock", thumbnail: "peacockThumbnail", imageSoundMap: ["peacock1": "peacockSound1", "peacock2": "peacockSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Owl", thumbnail: "owlThumbnail", imageSoundMap: ["owl1": "owlSound1", "owl2": "owlSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Hawk", thumbnail: "hawkThumbnail", imageSoundMap: ["hawk1": "hawkSound1", "hawk2": "hawkSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Dove", thumbnail: "doveThumbnail", imageSoundMap: ["dove1": "doveSound1", "dove2": "doveSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Cockatoo", thumbnail: "cockatooThumbnail", imageSoundMap: ["cockatoo1": "cockatooSound1", "cockatoo2": "cockatooSound2"], isPremium: false),
    Animal(uuid: UUID(), name: "Seagull", thumbnail: "seagullThumbnail", imageSoundMap: ["seagull1": "seagullSound1", "seagull2": "seagullSound2"], isPremium: false)
    
    // add more wild animals here
])

