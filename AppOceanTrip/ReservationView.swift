import SwiftUI

struct ReservationView: View {
    
    @State private var counter = 0
    @State private var price : Double = 30.00
    @State private var caution : Double = 90.00
    var activity: Activity
    
    var selectedDate: Date
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR") // Définir le locale sur français
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Spacer()
                
                VStack(alignment:.leading) {
                    HStack{
                        Image(activity.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 135)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.trailing, 10)
                        
                        VStack (alignment:.leading){
                            Text(activity.titre)
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.bottom, 2)
                            
                            HStack{
                                Image(systemName: "location.circle")
                                    .foregroundColor(Color.gray)
                                
                                Text("Le Pradet")
                                    .font(.custom("DMSans-Regular", size: 14))
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom, 2)
                            }
                            
                            VStack{
                                Text(activity.description)
                                    .font(.custom("DMSans-Regular", size: 14))
                                    .padding(.bottom, 2)
                                    .lineLimit(3)
                                    .truncationMode(.tail)
                            }
                            
                            HStack {
                                Text("(\(activity.nombreAvis) Avis)")
                                    .foregroundColor(.grisF)
                                    .font(.custom("DMSans-Regular", size: 14))
                                
                                Spacer()
                                
                                HStack(spacing: 2) {
                                    ForEach(0..<5) { star in
                                        Image(systemName: star < activity.etoile ? "star.fill" : "star")
                                            .foregroundColor(star < activity.etoile ? .yellow : .grisC)
                                    }
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],10)
                    
                    Text("Récapitulatif")
                        .font(.custom("DMSans-Bold", size: 18))
                    
                    HStack{
                        Text("Date sélectionnée : \(formattedDate(selectedDate))")
                            .font(.custom("DMSans-Regular", size: 14))
                        
                        Spacer()
                        
                        NavigationLink(destination: CalendarView()){
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.bleuF)
                        }
                    }
                    
                    HStack{
                        Text("Nombres de participants")
                            .font(.custom("DMSans-Regular", size: 14))
                        
                        HStack {
                            Button(action: {
                                if counter > 0 {
                                    counter -= 1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                                    .padding(2.0)
                                    .background(Color.bleuF)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            
                            Text("\(counter)")
                                .font(.custom("DMSans-Bold", size: 14))
                                .padding()
                            
                            HStack {
                                Button(action: {
                                    counter += 1
                                }) {
                                    Image(systemName: "plus.circle")
                                        .padding(2.0)
                                        .background(Color.bleuF)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                    }
                    
                    Spacer()
                    
                    Text("Conditions d'annulation")
                        .font(.custom("DMSans-Bold", size: 14))
                    
                    HStack{
                        Text("Cette réservation est annulable jusqu’à 48h avant la date de l’activité.")
                            .font(.custom("DMSans-Regular", size: 14))
                        
                        Text("Plus d'infos")
                            .font(.custom("DMSans-Regular", size: 14))
                            .underline()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],10)
                    
                    Text("Détails du prix")
                        .font(.custom("DMSans-Bold", size: 18))
                    
                    HStack{
                        Text("\(price, specifier: "%.2f")€ x \(counter) participant(s)")
                            .font(.custom("DMSans-Courant", size: 14))
                        
                        Text("\(Double(counter) * price, specifier: "%.2f")€") // Calcul prix
                            .font(.custom("DMSans-Bold", size: 14))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    
                    HStack{
                        Text("Caution du prêt de matériel")
                            .font(.custom("DMSans-Regular", size: 14))
                        
                        Text("\(caution, specifier: "%.2f")€")
                            .font(.custom("DMSans-Bold", size: 14))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text("Conditions d'annulation")
                        .font(.custom("DMSans-Bold", size: 14))
                    
                    HStack{
                        Text("Cette réservation est annulable jusqu’à 48h avant la date de l’activité.")
                            .font(.custom("DMSans-Regular", size: 14))
                        
                        Text("Modifier")
                            .font(.custom("DMSans-Regular", size: 14))
                            .underline()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],10)
                }
                
                HStack{
                    Text("Total en euros")
                        .font(.custom("DMSans-Bold", size: 14))
                    
                    Text("\(Double(counter) * price + caution, specifier: "%.2f")€")
                        .font(.custom("DMSans-Bold", size: 18))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
                
                Divider()
                    .frame(height: 1)
                    .background(.grisC)
                    .padding([.top, .bottom],10)
                
                Text("Choississez votre mode de paiement")
                    .font(.custom("DMSans-Bold", size: 18))
                
                HStack{
                    Text("Ajouter votre mode de paiement")
                        .font(.custom("DMSans-Regular", size: 14))
                    
                    Text("Ajouter")
                        .font(.custom("DMSans-Regular", size: 14))
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
                
                HStack{
                    Image("paypal")
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 44.0, height: 44.0)
                    
                    Image("mastercard")
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 44.0, height: 44.0)
                    
                    Image("americanexpress")
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 44.0, height: 44.0)
                    
                    Image("visa")
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 44.0, height: 44.0)
                }
            }
            .padding([.leading, .trailing ], 25)
            
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
                
                Text("Réserver")
                    .foregroundStyle(.white)
                    .font(.custom("DMSans-Bold", size: 20))
            }
            .padding(.top, 15)
            .padding(.bottom, 25)
            
            Spacer()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ReservationView(activity: activitiesArray[0], selectedDate: Date())
}
