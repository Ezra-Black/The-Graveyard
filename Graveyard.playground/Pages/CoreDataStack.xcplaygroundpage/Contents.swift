//
//class CoreDataStack {
//
//    static let shared = CoreDataStack()
//
//    private init() {}
//
//    lazy var container: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Users")
//        container.loadPersistentStores { _, error in
//            if let error = error {
//                fatalError("Error loading from persistent stores: \(error)")
//            }
//        }
//
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        return container
//    }()
//
//    var mainContext: NSManagedObjectContext {
//        return container.viewContext
//    }
//    
//    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
//        context.performAndWait {
//            do {
//                try context.save()
//            } catch {
//                NSLog("Error saving to persistent stores: \(error)")
//                context.reset()
//            }
//        }
//    }
//}
