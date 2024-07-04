import SwiftUI

struct OnBoarding1: View {
    @Binding var onboarding: Int
    
    var body: some View {
        ZStack {
            Image("fond1")
                .resizable()
                .ignoresSafeArea()
                .frame(width: 400, height: 800)
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Bienvenue !")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top, 180)
                        .padding(.bottom, 20)
                        .padding(.leading, 25)
                    
                    Text("""
                    Découvrez des aventures maritimes uniques et inoubliables. \nPlongez dans le monde fascinant des océans et explorez des activités écologiques respectueuses de l'environnement marin.
                    """)
                    .font(.custom("DMSans-Regular", size: 14))
                    .foregroundStyle(.white)
                    .padding(.bottom, 95)
                    .padding(.leading, 25)
                    .padding(.trailing, 120)
                }
                
                Image("plongeurs")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 275, height: 183)
                    .padding(.bottom, 25)
                
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
            }
        }
    }
}

#Preview {
    OnBoarding1(onboarding: .constant(1))
}
