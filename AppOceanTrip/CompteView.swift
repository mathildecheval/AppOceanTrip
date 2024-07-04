import SwiftUI

struct CompteView: View {
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(75)
                        .padding(.top, 40)
                    
                    Text("Hello Maria !")
                        .font(.custom("DMSans-Bold", size: 28))
                        .foregroundColor(.black)
                        .padding(.bottom, 40)
                }
                
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "person.badge.shield.checkmark")
                            .foregroundColor(.bleuF)
                        
                        Text("Informations personnelles")
                            .font(.custom("DMSans-Regular", size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.grisF)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.bleuF)
                        
                        Text("Historique")
                            .font(.custom("DMSans-Regular", size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.grisF)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                    
                    NavigationLink(destination:     ReservationView(activity: activitiesArray[0], selectedDate: Date())){
                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(.bleuF)
                            
                            Text("Réservations")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.black)
                            
                            Text("(1 réservation à finaliser)")
                                .font(.custom("DMSans-Bold", size: 14))
                                .foregroundColor(.red)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.grisF)
                        }
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                    
                    HStack {
                        Image(systemName: "accessibility")
                            .foregroundColor(.bleuF)
                        
                        Text("Accessibilité")
                            .font(.custom("DMSans-Regular", size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.grisF)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                    
                    HStack {
                        Image(systemName: "bell")
                            .foregroundColor(.bleuF)
                        
                        Text("Notifications")
                            .font(.custom("DMSans-Regular", size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.grisF)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                    
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.bleuF)
                        
                        Text("Aide")
                            .font(.custom("DMSans-Regular", size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.grisF)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.grisC)
                        .padding([.top, .bottom],5)
                }
                .padding([.leading, .trailing ], 25)
                
                Spacer()
                
                Spacer()
                
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
                    
                    Text("Deconnexion")
                        .foregroundStyle(.white)
                        .font(.custom("DMSans-Bold", size: 20))
                }
                .padding(.top, 15)
                .padding(.bottom, 40)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CompteView()
}
