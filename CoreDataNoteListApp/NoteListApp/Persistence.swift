//
//  Persistence.swift
import CoreData

struct PersistenceController {
    /// 本番用のインスタンス
    static let shared = PersistenceController()

    /// プレビュー用のインスタンス（メモリ内にデータを保持する設定）
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        
        // MARK: ダミーデータ登録
        for n in 0..<10 {
            let newNote = Note(context: viewContext)
            newNote.title = "テストタイトル\(n)"
            newNote.text = "テストテキスト\(n)"
            newNote.createdAt = Date.now
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    /// 永続コンテナ
    let container: NSPersistentContainer

    /// 引数に false を渡すと、プレビュー用にインメモリで保持して永続化しない）
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "NoteListApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
