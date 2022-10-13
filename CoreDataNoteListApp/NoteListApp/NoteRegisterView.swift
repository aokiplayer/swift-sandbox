import SwiftUI
import CoreData

// 登録画面
struct NoteRegisterView: View {
    @Environment(\.managedObjectContext) private var viewContext: NSManagedObjectContext
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    @State private var titleText: String = ""
    @State private var bodyText: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("新規メモの登録")
                .font(.title)
            
            Group {
                TextField("タイトル", text: $titleText)
                    .textFieldStyle(.roundedBorder)
                
                TextField("本文", text: $bodyText)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(EdgeInsets(top: 0, leading: 36, bottom: 0, trailing: 36))
            
            Button {
                addNote(title: titleText, text: bodyText)
                dismiss()
            } label: {
                Label("Save", systemImage: "list.bullet.rectangle.portrait")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
    
    private func addNote(title: String, text: String) {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.title = title
            newNote.text = text
            newNote.createdAt = Date.now
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                print("\(nsError)", "\(nsError.localizedDescription)")
            }
        }
    }
}

struct NoteRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRegisterView()
    }
}
