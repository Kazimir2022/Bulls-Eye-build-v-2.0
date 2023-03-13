
import Foundation
protocol GenerateProtocol{
    
    func generateNewValue()-> Int
    
}
class GenerateValue:GenerateProtocol{
   private var startGenerateValue:Int
   private var endGenerateValue:Int
    
    init?(startGenerateValue:Int, endGenerateValue:Int) {
        guard startGenerateValue <= endGenerateValue else {
            return nil
        }
        self.startGenerateValue = startGenerateValue
        self.endGenerateValue = endGenerateValue

    }
    
      func generateNewValue() -> Int{
    
          return (startGenerateValue...endGenerateValue).randomElement()!
    }
    
    
}
