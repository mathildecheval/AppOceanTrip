import SwiftUI

struct ActivitesView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink(destination: ListeView()){
                    ZStack{
                        Image("sport")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:355, height:163)
                            .clipped()
                            .cornerRadius(20)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.bleuC)
                            .frame(width:356, height:163)
                            .opacity(0.8)
                        
                        VStack {
                            Image("pictoSport")
                            
                            Text("Sport")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.leading, 4)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.trailing, 165)
                    }
                    .padding(.top)
                }
                
                HStack{
                    VStack{
                        ZStack{
                            Image("culture")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:170, height:141)
                                .clipped()
                                .cornerRadius(20)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.jaune)
                                .opacity(0.8)
                                .frame(width:170, height:141)
                            
                            VStack{
                                Image("pictoCulture")
                                
                                Text("Culture")
                                    .font(.custom("DMSans-Bold", size: 18))
                                    .padding(.leading, 4)
                                    .foregroundStyle(Color.white)
                            }
                        }
                        
                        ZStack{
                            Image("art")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:170, height:254)
                                .clipped()
                                .cornerRadius(20)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.orange)
                                .opacity(0.8)
                                .frame(width:170, height:254)
                            
                            VStack{
                                Image("pictoArt")
                                
                                Text("Art &\nartisanat")
                                    .font(.custom("DMSans-Bold", size: 18))
                                    .padding(.leading, 4)
                                    .foregroundStyle(Color.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.trailing, 2)
                    
                    VStack{
                        ZStack{
                            Image("solidaire")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:170, height:254)
                                .clipped()
                                .cornerRadius(20)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.beige)
                                .opacity(0.9)
                                .frame(width:170, height:254)
                            
                            VStack{
                                Image("pictoSolidaire")
                                
                                Text("Action\nsolidaire")
                                    .font(.custom("DMSans-Bold", size: 18))
                                    .padding(.bottom, 3)
                                    .foregroundStyle(Color.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(.bottom, 2.5)
                        
                        ZStack{
                            Image("faune")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:170, height:141)
                                .clipped()
                                .cornerRadius(20)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.bleuF)
                                .opacity(0.9)
                                .frame(width:170, height:141)
                            
                            VStack{
                                Image("pictoFaune")
                                
                                Text("Faune & \nflore")
                                    .font(.custom("DMSans-Bold", size: 18))
                                    .padding(.bottom, 3)
                                    .foregroundStyle(Color.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.leading, 2)
                }
            }
            .navigationTitle("Activités")
        }
    }
}

#Preview {
    ActivitesView()
}
