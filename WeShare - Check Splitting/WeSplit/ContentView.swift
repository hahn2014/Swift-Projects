import SwiftUI

struct ContentView: View {
    @State private var totalBill:String = ""
    @State private var partySize:Int = 2
    @State private var tipSelected:Int = 3
    @State private var individualTip:Int = 0
    
    let tipPercentages = [5, 10, 15, 20, 25, 0]

    var totalPerPerson:Double {
        let peopleCount  = Double(partySize + 2)
        let tipSelection = Double(tipPercentages[tipSelected])
        let orderAmount  = Double(totalBill) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalTip:Double {
        let tipSelection = Double(tipPercentages[tipSelected])
        let orderAmount = Double(totalBill) ?? 0
        
        return (orderAmount / 100 * tipSelection)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Provide cost information")) {
                    TextField("Bill Total", text: $totalBill).keyboardType(.decimalPad)
                    Picker("Party Size", selection: $partySize) {
                        ForEach (2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Provide tip percentage")) {
                    Picker("Tip percentage", selection: $tipSelected) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }
                Section(header: Text("Your totals")) {
                    Text("Each person pays: $\(totalPerPerson, specifier: "%.2f")")     //how much each party member pays
                    Text("Total Tip $\(totalTip, specifier: "%.2f")") //full tip cost
                    Text("Bill Total $\((Double(totalBill) ?? 0) + totalTip, specifier: "%.2f")")                //original cost and tip
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
