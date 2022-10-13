import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    MinMaxFrameSizeView(width: 200, height: 200)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("width, height > 親")
                } label: {
                    Text("width, height > 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(width: 50, height: 50)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("width, height < 親")
                } label: {
                    Text("width, height < 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(maxWidth: 50, maxHeight: 50)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("max < 親")
                } label: {
                    Text("max < 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(maxWidth: 200, maxHeight: 200)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("max > 親")
                } label: {
                    Text("max > 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("max == .infinity")
                } label: {
                    Text("max == .infinity")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(minWidth: 50, minHeight: 50)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("min < 親")
                } label: {
                    Text("min < 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(minWidth: 200, minHeight: 200)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("min > 親")
                } label: {
                    Text("min > 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(minWidth: 50, maxWidth: 100,
                                        minHeight: 50, maxHeight: 100)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("min < 親, max < 親")
                } label: {
                    Text("min < 親, max < 親")
                }
                
                NavigationLink {
                    MinMaxFrameSizeView(minWidth: 50, maxWidth: 300,
                                        minHeight: 50, maxHeight: 300)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("min < 親, max > 親")
                } label: {
                    Text("min < 親, max > 親")
                }

                NavigationLink {
                    MinMaxFrameSizeView(minWidth: 200, maxWidth: 300,
                                        minHeight: 200, maxHeight: 300)
                        .frame(width: 150, height: 150)
                        .border(.green, width: 3)
                        .padding()
                        .navigationTitle("min > 親, max > 親")
                } label: {
                    Text("min < 親, max > 親")
                }
            }
            .navigationTitle("frame modifier の挙動")
        }
    }
}

struct MinMaxFrameSizeView: View {
    var width: CGFloat?
    var height: CGFloat?
    var minWidth: CGFloat?
    var maxWidth: CGFloat?
    var minHeight: CGFloat?
    var maxHeight: CGFloat?
    
    var body: some View {
        if let width, let height {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                    .frame(width: width, height: height)    // width, height
                    .border(.blue)
                
                Text("Hello, world!")
                    .frame(width: width, height: height)    // width, height
                    .border(.red)
            }
        } else {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                    .frame(minWidth: minWidth, maxWidth: maxWidth,
                           minHeight: minHeight, maxHeight: maxHeight)   // min, max
                    .border(.blue)
                
                Text("Hello, world!")
                    .frame(minWidth: minWidth, maxWidth: maxWidth,
                           minHeight: minHeight, maxHeight: maxHeight)   // min, max
                    .border(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
