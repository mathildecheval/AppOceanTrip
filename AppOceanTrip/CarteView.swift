import SwiftUI

struct CarteView: View {
    @State private var showModal = false
    // Propriété d'état pour suivre l'index de la région sélectionnée
    @State private var selectedRegionIndex: Int? = nil
    // Propriété de liaison pour transmettre la région sélectionnée à NavView
    @Binding var selectedRegion: String?
    
    var regionsArray = ["Hauts-de-France", "Normandie", "PACA", "Pays-de-la-Loire", "Nouvelle-Aquitaine", "Occitanie", "Bretagne", "Corse"]
    
    // Liste des images correspondantes aux régions
    var imageArray = ["hautDeFrance", "normandie", "coteAzur", "paysLoire", "nouvelleAquitaine", "occitanie", "bretagne", "corse"]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack(alignment: .center) {
                        ForEach(regionsArray.indices, id: \.self) { index in
                            NavigationLink(destination: ListeView(), label: {
                                Button(action: {
                                    selectedRegionIndex = index
                                    selectedRegion = regionsArray[index]
                                }, label: {
                                    Text(regionsArray[index])
                                        .foregroundColor(.black)
                                        .font(.custom("DMSans-Bold", size: 14))
                                        .frame(width: 160, height: 44)
                                        .background(Color("beige"))
                                        .cornerRadius(10)
                                        .padding(.leading, 12)
                                        .padding(.top, 25)
                                })
                            })
                            
                        }
                    }
                }
                
                Spacer()
                
                if let selectedRegionIndex = selectedRegionIndex {
                    Image(imageArray[selectedRegionIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .padding(.bottom, 20)
                        .padding([.leading, .trailing], 5)
                } else {
                    Image("france")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .padding(.bottom, 20)
                        .padding([.leading, .trailing], 5)
                }
                
                Spacer()
            }
            .navigationTitle("Carte")
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CarteView(selectedRegion: .constant(nil))
}
