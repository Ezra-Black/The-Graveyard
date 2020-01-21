//import Foundation
//
//enum Rank: Int, CustomStringConvertible {
//    var description: String {
//        switch self.rawValue {
//        case 1...10:
//            return String(self.rawValue)
//        case 11:
//            return "jack"
//        case 12:
//            return "queen"
//        case 13:
//            return "king"
//        default:
//            return ""
//        }
//    }
//    
//    case ace = 1
//    case two
//    case three
//    case four
//    case five
//    case six
//    case seven
//    case eight
//    case nine
//    case ten
//    case jack
//    case queen
//    case king
//    
//    static var allRanks: [Rank] {
//        return [ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king]
//    }
//}
//
//extension Rank: Comparable {
//    static func < (lhs: Rank, rhs: Rank) -> Bool {
//        return lhs.rawValue < rhs.rawValue
//    }
//    static func == (lhs: Rank, rhs: Rank) -> Bool{
//        return lhs.rawValue == rhs.rawValue
//    }
//    
//}
//
//enum Suit: String {
//    case hearts = "hearts"
//    case diamonds = "diamonds"
//    case spades = "spades"
//    case clubs = "clubs"
//    
//    static var allSuits: [Suit] {
//        return [hearts, diamonds, spades, clubs]
//    }
//    
//    
//}
//
//struct Card: CustomStringConvertible {
//    
//    var description: String {
//        return "\(rank) of \(suit)"
//    }
//    
//    let rank: Rank
//    let suit: Suit
//}
//
//extension Card: Comparable {
//    static func < (lhs: Card, rhs: Card) -> Bool {
//        return lhs.rank < rhs.rank
//    }
//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
//    }
//}
//
//struct Deck {
//    let cardsForDeck: [Card]
//    
//    init() {
//        var deckforGame: [Card] = []
//        for rank in Rank.allRanks {
//            for suit in Suit.allSuits {
//                deckforGame.append(Card(rank: rank, suit: suit))
//            }
//        }
//        self.cardsForDeck = deckforGame
//    }
//    
//    func drawCard() -> Card {
//        return cardsForDeck.randomElement()!
//        //we will be making random elements as attack paaterns! woohoo =) figured this out.
//    }
//}
//
//protocol CardGame {
//    var deck: Deck {get}
//    func play()
//}
//
//protocol CardGameDelegate {
//    func gameDidStart(_ game: CardGame)
//    func game(player1DidDraw card1: Card, player2DidDraw card2: Card)
//}
//
////battle class
//class HighLow: CardGame {
//   var numberOfTurns: Int
//   var deck: Deck = Deck()
//   var delegate: CardGameDelegate?
//   
//   init(numberOfTurns: Int) {
//       self.numberOfTurns = numberOfTurns
//   }
//   
//   func play() {
//       
//       delegate?.gameDidStart(self)
//       
//       if numberOfTurns < 1 {
//            print("Invalid entry for number of turns. Must be integer greater than zero.")
//            return
//        }
//        var player1Score = 0
//        var player2Score = 0
//        
//        for x in 1...numberOfTurns {
//            //this will be the players random attack
//            let player1Card = deck.drawCard()
//           let player2Card = deck.drawCard()
//           
//           print("Turn #\(x): ")
//           
//            //here we will put in the random players attack into the delegates game property or whatever we call it on the gladiator game
//           delegate?.game(player1DidDraw: player1Card, player2DidDraw: player2Card)
//           
//            if player1Card == player2Card {
//                print("The players tied with a \(player1Card.description)\n\n")
//            } else if player1Card < player2Card {
//                player2Score += 1
//                print("Player 2 won with a \(player2Card.description)\n\n")
//            } else {
//                player1Score += 1
//                print("Player 1 won with a \(player1Card.description)\n\n")
//            }
//        }
//        if player1Score == player2Score {
//            print("The players tied with a score of \(player1Score).")
//        } else if player1Score > player2Score {
//            print("Player 1 won the match with a score of \(player1Score) to \(player2Score).")
//        } else {
//            print("Player 2 won the match with a score of \(player2Score) to \(player1Score).")
//        }
//    }
//}
//
//class CardGameTracker: CardGameDelegate {
//    
//    var numberOfTurns: Int = 0
//    
//    func gameDidStart(_ game: CardGame) {
//        numberOfTurns = 0
//        if game is HighLow {
//            print("Started a game of High Low")
//        }
//    }
//    
//    func game(player1DidDraw card1: Card, player2DidDraw card2: Card) {
//        numberOfTurns += 1
//        print("Player 1 drew \(card1), player 2 drew \(card2)")
//    }
//}
//
//let tracker = CardGameTracker()
//let game = HighLow(numberOfTurns: 10)
//game.delegate = tracker
//game.play()
