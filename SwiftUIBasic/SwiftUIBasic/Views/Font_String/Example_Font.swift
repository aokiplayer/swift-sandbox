import SwiftUI

struct ExampleFont: View {
    var body: some View {
        NavigationStack {
            List(fonts, id: \.fontName) { item in
                LazyVStack(alignment: .leading) {
                    Text("\(item.fontName)")
                        .font(item.font)
                    
                    Text("\(item.note)")
                        .font(.caption)
                        .lineLimit(nil)
                }
                .padding()
            }
            .navigationTitle("標準 Font スタイル")
        }
    }
}

fileprivate struct FontAndDescription {
    let fontName: String
    let font: Font
    let note: String
}

fileprivate let fonts: [FontAndDescription] = [
    .init(fontName: "largeTitle", font: .largeTitle, note: "A font with the large title text style."),
    .init(fontName: "title", font: .title, note: "A font with the title text style."),
    .init(fontName: "title2", font: .title2, note: "Create a font for second level hierarchical headings."),
    .init(fontName: "title3", font: .title3, note: "Create a font for third level hierarchical headings."),
    .init(fontName: "headline", font: .headline, note: "A font with the headline text style."),
    .init(fontName: "subheadline", font: .subheadline, note: "A font with the subheadline text style."),
    .init(fontName: "body", font: .body, note: "A font with the body text style."),
    .init(fontName: "callout", font: .callout, note: "A font with the callout text style."),
    .init(fontName: "caption", font: .caption, note: "A font with the caption text style."),
    .init(fontName: "caption2", font: .caption2, note: "Create a font with the alternate caption text style."),
    .init(fontName: "footnote", font: .footnote, note: "A font with the footnote text style."),
]

struct Example_Font_Previews: PreviewProvider {
    static var previews: some View {
        ExampleFont()
    }
}
