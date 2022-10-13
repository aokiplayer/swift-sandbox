import SwiftUI
import CoreData

struct ContentView: View {
    // 上位階層で設定された管理オブジェクトコンテキストを取得
    @Environment(\.managedObjectContext) private var viewContext: NSManagedObjectContext
    
    // フェッチ結果を保持（管理オブジェクトコンテキストは、内部的に Environment から取得して利用
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\Note.createdAt, order: .reverse)
    ])
    private var notes: FetchedResults<Note>
    
    @State private var isRegisterViewShown: Bool = false
    
    var body: some View {
        NavigationStack {
            // 表示だけなら List に直接 notes を渡せるが、onDelete modifier は List に付加できないため、ForEach を利用
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        NoteRow(note: note)
                    } label: {
                        Text(note.title ?? "")
                            .font(.headline)
                    }
                    .padding()
                }
                .onDelete(perform: deleteNote(at:))
            }
            .navigationTitle("Core Data の利用")
            .toolbar(content: toolbarContent)
        }
    }
}

extension ContentView {
    // 受け取った IndexSet に対するデータを削除する
    private func deleteNote(at offsets: IndexSet) {
        // 実装としては、IndexSet をもとに削除対象のデータ一覧を取得してから削除
        let notesForRemove = offsets.map { notes[$0] }
        notesForRemove.forEach(viewContext.delete(_:))
        
//        // 今回は複数件削除ではないので、以下の実装でも OK
//        viewContext.delete(notes[offsets.first!])
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("\(nsError)", "\(nsError.localizedDescription)")
        }
    }
}

extension ContentView {
    // ツールバーの内容を作成する
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem {
            Button {
                isRegisterViewShown.toggle()
            } label: {
                Label("Add", systemImage: "plus")
            }
            .sheet(isPresented: $isRegisterViewShown) {
                NoteRegisterView()
            }
        }
        
        ToolbarItem {
            EditButton()
        }
        
        ToolbarItem(placement: .bottomBar) {
            Text("メモの総数: \(notes.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // プレビュー用には、データを永続化せずインメモリで保持するコンテキストを渡す
        ContentView()
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
    }
}
