import SwiftUI

struct OnBoarding3: View {
    @Binding var onboarding: Int
    
    var body: some View {
        
        ZStack{ Image("fond3")
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom,50)
            
            VStack{
                Spacer()
                Text("Engagez-vous pour la protection des océans")
                    .font(.custom("DMSans-Bold", size: 28))
                    .multilineTextAlignment(.center)
                
                Image("sirene")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 275, height: 183)
                    .padding(.top, 25)
                
                Text("Votre aventure aide à préserver les écosystèmes marins. Une partie de chaque réservation soutient des projets de conservation marine. Ensemble, faisons la différence !")
                    .font(.custom("DMSans-Regular", size: 14))
                    .multilineTextAlignment(.leading)
                    .padding([.top,.bottom],25)
                    .padding([.leading,.trailing],35)
                
                Button{
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
                        
                        Text("Commencer")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.custom("DMSans-Bold", size: 20))
                    }
                    .padding(.bottom, 40)
                    .navigationBarTitleDisplayMode(.large)
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    OnBoarding3(onboarding: .constant(3))
}
