import SwiftUI
import PhotosUI // 画像の選択に必要

struct ExamplePhotoPicker: View {
    // PhotosPicker で選択した画像を保持
    @State private var items: [PhotosPickerItem] = []  // 選択した項目を保持（今回は要素 1 つのみ）
    @State private var uiImage: UIImage? = nil  // 表示する画像
    
    var body: some View {
        VStack {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black, radius: 12, x: 12, y: 12)
                    .frame(height: 200)
                    .padding()
            }
            
            // 画像選択用のビュー（選択画像を 1 つに限定、静止画のみ）
            PhotosPicker("好きな画像を選択",
                         selection: $items,
                         maxSelectionCount: 1,
                         matching: .images)
            .buttonStyle(.bordered)
            // items の変更時に、選択した画像を取り出して uiImage プロパティへ格納する
            .onChange(of: items) { newValue in
                guard let item = newValue.first else {
                    return
                }
                
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        guard let data else {
                            return
                        }
                        
                        uiImage = UIImage(data: data)
                    case .failure(let error):
                        print("\(error)")
                    }
                }
            }
        }
    }
}

struct Example_PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePhotoPicker()
    }
}
