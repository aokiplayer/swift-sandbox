import SwiftUI

// 一覧の行のビュー
struct NoteRow: View {
    var note: Note
    
    var body: some View {
        VStack {
            Label(note.title!, systemImage: "doc.plaintext")
                .font(.title)
                .padding()
            
            Text(note.text!)
            
            Text(dateFormatter.string(from: note.createdAt!))
        }
        .navigationTitle("メモ詳細")
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .current
        formatter.locale = .current
        
        return formatter
    }()
}

struct NoteRow_Previews: PreviewProvider {
    private static let viewContext = PersistenceController.preview.container.viewContext
    
    private static let note = {
        let note = Note(context: viewContext)
        note.title = "タイトル"
        note.text = "本文"
        note.createdAt = Date.now
        return note
    }()

    static var previews: some View {
        NoteRow(note: note)
            .environment(\.managedObjectContext, viewContext)
    }
}
