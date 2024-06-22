import SwiftUI
import SwiftData

struct Serial: View {
    @State private var generatedSerial = ""
    @State private var isSerialTapped = false
    @State private var selectedDeviceData: DeviceData?
    @State private var selectedModel: Model?
    @State private var numberOfSerials: Double = 1.0

    @Query(sort: [SortDescriptor(\Model.name, order: .forward)])
    private var models: [Model]

    var headerUsesNavigationLink: Bool = false
    var navigation: HomeCardHeaderNavigation = .navigationLink
    
    var body: some View {
        VStack(alignment: .leading) {
            CardNavigationHeader(destination: Serial(), cardNavigation: navigation) {
                Label("Genereeri kiirelt", systemImage: "wand.and.stars")
                
            }
            
            VStack(alignment: .leading) {
                Picker("Mudelite valik", selection: $selectedModel) {
                    // Get unique device names
                    let uniqueDeviceNames = Array(Set(DeviceData.allCases.map { $0.deviceName }))
                    ForEach(uniqueDeviceNames, id: \.self) { deviceName in
                        Section(deviceName) {
                            ForEach(models.filter { $0.deviceData.deviceName == deviceName }, id: \.self) { model in
                                Text(model.name).tag(model as Model?)
                            }
                        }
                    }
                }
                .pickerStyle(.menu)
                .padding(.bottom, 15)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Genereeritud seerianumber:")
                            .font(.headline)
                        
                        Text(generatedSerial)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Spacer()
                        Button("Genereeri seerianumber") {
                            generateSerialNumber()
                        }
                        .controlSize(.large)
                        .disabled(selectedModel == nil)
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        .padding()
        
    }
    
    private func generateSerialNumber() {
        guard let selectedModel = selectedModel else {
            generatedSerial = "Palun vali mudel"
            isSerialTapped = false
            return
        }

        if let serialsString = SendCommand(modelIdentifier: selectedModel.identifier) {
            let serialsArray = serialsString.components(separatedBy: .newlines).filter { !$0.isEmpty }
            generatedSerial = serialsArray.joined(separator: "\n")
            isSerialTapped = true
            
            // Show the QR code sheet only if a single serial is generate

        } else {
            generatedSerial = "Viga seerianumbrite genereerimisel"
            isSerialTapped = false
        }
    }
}

#Preview(traits: .previewData) {
    Serial()
}
