import SwiftUI

struct ConnexionView: View {
    
    @ObservedObject var userData: UserData
    @State private var mail: String = ""
    @State private var motdepasse: String = ""
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text("Pour continuer la réservation veuillez vous connecter ou créer votre compte.")
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .font(.custom("DMSans-Regular", size: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius:1 )
                            .stroke(Color.bleuF, lineWidth: 2)
                    ).foregroundStyle(.bleuF)
                    .padding(.bottom, 15)
                    .padding()
                
                TextField("Email", text: $mail)
                    .font(.custom("DMSans-Regular", size: 18))
                    .padding(15)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .foregroundColor(.grisF)
                    .padding(.bottom, 15)
                    .keyboardType(.emailAddress)
                
                ZStack{
                    SecureField("Mot de passe", text: $motdepasse)
                        .font(.custom("DMSans-Regular", size: 18))
                        .padding(15)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .foregroundColor(.grisF)
                        .padding(.bottom, 15)
                        .keyboardType(.default)
                    
                    Image(systemName: "eye")
                        .padding(.leading, 300.0)
                        .padding(.bottom, 15)
                        .foregroundColor(.grisF)
                }
                
                Text("Mot de passe oublié ?")
                    .font(.custom("DMSans-Regular", size: 18))
                    .foregroundStyle(.bleuF)
                    .underline()
                
                Button(action: {
                    if mail == userData.mail && motdepasse == userData.motdepasse {
                        print("Connexion réussie")
                    } else {
                        print("Email ou mot de passe incorrect")
                    }
                }) {
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .fill(
                                    LinearGradient(
                                        gradient:
                                            Gradient(colors: [Color.bleuF,Color.bleuC, Color.beige]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                .frame(width:251, height:54)
                            
                            Text("Connexion")
                                .foregroundStyle(.white)
                                .font(.custom("DMSans-Bold", size: 20))
                            
                        }
                        ZStack{
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Rectangle()
                                .frame(width: 225, height: 50)
                                .foregroundColor(.white)
                            
                            Text("Pas encore de compte ?")
                                .foregroundStyle(.black)
                                .font(.custom("DMSans-Regular", size: 18))
                        }
                        
                        NavigationLink(destination: CreationCompte(userData: UserData())){
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(
                                        LinearGradient(
                                            gradient:
                                                Gradient(colors: [Color.bleuF,Color.bleuC, Color.beige]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                    .frame(width:251, height:54)
                                
                                Text("Crée mon compte")
                                    .foregroundStyle(.white)
                                    .font(.custom("DMSans-Bold", size: 20))
                            }
                        }
                    }
                    .onAppear {
                        mail = userData.mail
                        motdepasse = userData.motdepasse
                    }
                }
            }
            .padding([.leading, .trailing], 25)
        }
        
    }
}

#Preview {
    ConnexionView(userData: UserData())
}
