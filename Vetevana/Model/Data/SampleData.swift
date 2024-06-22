/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The app's sample data.
*/

import Foundation

/// The app's sample data.

struct SampleData { }

extension SampleData {
    @MainActor static let guides = [
        Guide(
            groupIDs: [
                1004,
                1005
            ], id: 0,
            imageName: "BOT-anist", name: "Mac mini (2023 M2)",
            synopsis: """
                Oled uue seadmega jännis ega tea mida teha? \
                Klikka allolevat nuppu, \
                et end kurssi viia näpunäidete ja juhenditega.
                """,
            year: 2022,
            contentRating: "VA",
            isHero: true
        ),
        
        Guide(
            groupIDs: [
                1004,
                1005
            ], id: 1,
            imageName: "landing", name: "Landing",
            synopsis: """
                After a long journey through the stars, the robot botanist and its trusty spaceship finally arrive at Wolf 1069 B, \
                ready to explore the mysteries that lie on the planet’s surface. \
                New plants to catalog, new animals to discover, and cool rocks to unearth. Follow along as the botanist’s mission begins!
                """,
            year: 2024,
            contentRating: "NR",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1001,
                1004,
                1005
            ], id: 2,
            imageName: "samples", name: "Seed Sampling",
            synopsis: """
                On a planet covered in lush jungles and thriving vegetation there’s bound to be some unique plants out there, \
                and the robot botanist is on a mission to find and catalog them all. But as the botanist explores this new planet, \
                it comes to discover more than just new plants.
                """,
            year: 2024,
            contentRating: "NR",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1004,
                1005
            ], id: 3,
            imageName: "lab", name: "The Lab",
            synopsis: """
                After filling its backpack to the brim with dozens of plant samples, it’s time for the robot botanist to return to the lab \
                and learn more about these mysterious alien plants. Hours of demanding research lie ahead as the botanist gets to work.
                """,
            year: 2024,
            contentRating: "NR",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1004,
                1005
            ], id: 4,
            imageName: "discovery", name: "Discovering",
            synopsis: """
                Always determined to discover new species of plants, the robot botanist explores further and further. Eventually, \
                its mission brings it deep below the planet’s surface into a vast network of underground caves. \
                Though the terrain may become challenging for a robot, the botanist pushes on.
                """,
            year: 2024,
            contentRating: "NR",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1004
            ], id: 5,
            imageName: "dance", name: "Dance",
            synopsis: """
                Everyone needs a break from work sometimes, even the trusty robot botanist. \
                Take a beat and unwind while the robot botanist breaks out its best dance moves during an impromptu dance party.
                """,
            year: 2024,
            contentRating: "NR",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1001,
                1000
            ], id: 6,
            imageName: "beach", name: "Mac mini Fan (2024 M2)",
            synopsis: """
                Õpi lihtsasti eemaldama Mac Mini ventilaatorit, mis on ebaõnnestunud. \
                Ventilaatori vahetus on kiire ning väga lihtne, \
                kuid hätta jäädes pöördu siiski mõne vanemtehniku poole, kes oskab aidata.
                """,
            year: 2023,
            contentRating: "Mini VA",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1002,
                1003
            ], id: 7,
            imageName: "lake", name: "By the Lake",
            synopsis: """
                The battle for the sunniest spot continues, as a group of turtles take their positions on the log. \
                Find out who the last survivor is, and who swims away cold.
                """,
            year: 2023,
            contentRating: "NR"
        ),
        
        Guide(
            groupIDs: [
                1001
            ], id: 8,
            imageName: "camping", name: "Camping in the Woods",
            synopsis: """
                Come along for a journey of epic proportion as the perfect camp site is discovered. \
                Listen to the magical wildlife and feel the gentle breeze of the wind as you watch the daisies dance in the field of flowers.
                """,
            year: 2023,
            contentRating: "NR"
        ),
        
        Guide(
            groupIDs: [
                1003
            ], id: 9,
            imageName: "park", name: "Birds in the Park",
            synopsis: """
                On a dreamy spring day near the California hillside, some friendly little birds flutter about, \
                hopping from stalk to stalk munching on some tasty seeds. Listen to them chatter as they go about their busy afternoon.
                """,
            year: 2023,
            contentRating: "NR"
        ),
        
        Guide(
            groupIDs: [
                1001
            ], id: 10,
            imageName: "creek", name: "MagSafe 3 Board",
            synopsis: """
                Kuidas eemaldada MagSafe korpuselt ning vigast MagSafe-i diagnoosida. \
                Kuidas MagSafe boardi vedelikukahjustuse korral puhastada.
                """,
            year: 2024,
            contentRating: "VA",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1001
            ], id: 11,
            imageName: "hillside", name: "Lid Angle Sensor",
            synopsis: """
                Kuidas eemalda ekraani nurgaandurit ning kontrollida kaablit ja selle ühendust. \
                Kuidas käituda vedeliku kahjustuse korral ning kuidas vigane andur välja vahetada \
                ning seeläbi uus andur ära kalibreerida.
                """,
            year: 2024,
            contentRating: "VA",
            isFeatured: true
        ),
        
        Guide(
            groupIDs: [
                1002
            ], id: 12,
            imageName: "ocean", name: "Ocean Breeze",
            synopsis: """
                Experience the great flight of a black beetle, as it crawls along a giant rock near the lake preparing for takeoff. \
                Where it will go, nobody knows!
                """,
            year: 2023,
            contentRating: "NR"
        )
    ]
}
