import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("\(L10n.Localizable.greeting) \(L10n.Localizable.name) \(L10n.Localizable.append)")
            Text(L10n.Foo.waff)
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
