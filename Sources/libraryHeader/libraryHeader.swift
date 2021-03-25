
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct libraryHeader: View {
    private var label: String
    public init(label: String) {
        self.label = label
    }
    
       public var body: some View {
       GeometryReader{ geometry in
            VStack{
                HStack(){
                    Text(self.label)
                    Spacer()
                }
                .frame(height: 56.0)
            }.offset(y:0)
            Spacer()
        }
} 

//class SomeService {
//
//    public func subtitle() -> String {
//        return "texto que viene desde el servicio"
//    }
//  static let sharedInstance : SomeService = {
//    //Do any computations needed to have the args for SomeService initializer, if not you can omit this closure and directly assign SomeService() to sharedInstance
//    return SomeService() //<--Call the designated initialiser to instantiate the object.
//    }()
//
//   //Other methods of the class....
//}

        
