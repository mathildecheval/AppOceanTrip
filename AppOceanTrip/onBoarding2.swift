import SwiftUI

struct OnBoarding2: View {
    @Binding var onboarding: Int
    
    var body: some View {
        
        ZStack{
            Image("fond2")
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom,50)
            
            VStack{
                Spacer()
                Text("Engagez-vous pour la protection des océans")
                    .font(.custom("DMSans-Bold", size: 28))
                    .font(.custom("DMSans-Bold", size: 28))
                    .multilineTextAlignment(.center)
                
                Image("plongeuse")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 275, height: 183)
                    .padding(.top, 25)
                
                Text("Trouvez des excursions maritimes et des activités aquatiques adaptées à tous vos désirs, réservez facilement et profitez de recommandations personnalisées pour une expérience optimale.")
                    .font(.custom("DMSans-Regular", size: 14))
                    .multilineTextAlignment(.leading)
                    .padding([.top,.bottom],25)
                    .padding([.leading,.trailing],35)
                
                Button {
                    onboarding += 1
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.bleuF, Color.bleuC, Color.beige]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 251, height: 54)
                        
                        Text("Suivant")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.custom("DMSans-Bold", size: 20))
                    }
                    .padding(.bottom, 40)
                    
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    OnBoarding2(onboarding: .constant(2))
}
