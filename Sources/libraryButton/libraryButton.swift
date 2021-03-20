
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct libraryButton: View {
    
    @State private var showDetails = false
    private var label: String
    public init(label: String) {
        self.label = label
    }
    
       public var body: some View {
        VStack(alignment: .leading) {
            Button(label) {
                self.showDetails.toggle()
            }
            .padding(.all)
            .accentColor(Color.blue)
            .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
        

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
    
}


@available(iOS 13.0.0, macOS 10.15, *)
struct libraryButton_Previews: PreviewProvider {
    static var previews: some View {
        return libraryButton(label: "button")
    }
}
		
