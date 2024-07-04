import SwiftUI

struct CreationCompte: View {
    @State private var prenom: String = ""
    @State private var nom: String = ""
    @State private var mail: String = ""
    @State private var motdepasse: String = ""
    @State private var motdepasse2: String = ""
    @State private var MessageEreur: String? = nil
    @State private var CreationReussie: Bool = false
    @ObservedObject var userData: UserData
    
    var body: some View {
        NavigationStack {
            VStack() {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width:170, height: 130)
                    .padding(.bottom, 50)
                
                TextField("Entrer votre prénom", text: $prenom)
                    .font(.custom("DMSans-Regular", size: 18))
                    .padding(15)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .foregroundColor(.grisF)
                    .padding(.bottom, 15)
                    .keyboardType(.default)
                
                TextField("Entrer votre nom", text: $nom)
                    .font(.custom("DMSans-Regular", size: 18))
                    .padding(15)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .foregroundColor(.grisF)
                    .padding(.bottom, 15)
                    .keyboardType(.default)
                
                TextField("Entrer votre Email", text: $mail)
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
                
                ZStack{
                    SecureField("Confirmer votre mot de passe", text: $motdepasse2)
                        .font(.custom("DMSans-Regular", size: 18))
                        .padding(15)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .foregroundColor(.grisF)
                        .padding(.bottom, 15)
                        .keyboardType(.numbersAndPunctuation)
                    
                    Image(systemName: "eye")
                        .padding(.leading, 300.0)
                        .padding(.bottom, 15)
                        .foregroundColor(.grisF)
                }
                
                if let messageErreur = MessageEreur {
                    Text(messageErreur)
                        .foregroundColor(.red)
                        .padding(.bottom, 15)
                }
                
                VStack {
                    Button(action: {
                        if prenom.isEmpty || nom.isEmpty || mail.isEmpty || motdepasse.isEmpty || motdepasse2.isEmpty {
                            MessageEreur = "Tous les champs sont requis."
                        } else if motdepasse != motdepasse2 {
                            MessageEreur = "Les mots de passe ne correspondent pas."
                        } else {
                            MessageEreur = nil
                            CreationReussie = true
                            userData.mail = mail
                            userData.motdepasse = motdepasse
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.bleuF, Color.bleuC, Color.beige]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                .frame(width: 251, height: 54)
                            
                            Text("Valider ")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.custom("DMSans-Bold", size: 20))
                        }
                        .padding(.top, 10)
                    })
                }
                .frame(maxWidth: .infinity)
                
                NavigationLink("", destination: CompteView(), isActive: $CreationReussie)
            }
            .padding([.leading, .trailing], 25)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CreationCompte(userData: UserData())
}
