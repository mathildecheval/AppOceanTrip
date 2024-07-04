import SwiftUI

struct FavorisView: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top) {
                    VStack{
                        ZStack{
                            Rectangle()
                                .cornerRadius(15)
                                .frame(width: 160, height: 160)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2, x: 0, y: -1)
                                .padding(.leading, 5.0)
                            
                            VStack{
                                HStack{
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.grisC)
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.grisC)
                                }
                                
                                HStack{
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.grisC)
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.grisC)
                                }
                            }
                            
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                .foregroundColor(.bleuF)
                        }
                        
                        Text("Créer un tableau")
                            .font(.custom("DMSans-Bold", size: 18))
                            .padding(.top, 10.0)
                    }
                    
                    Spacer()
                    
                    VStack{
                        NavigationLink(destination: DetailsFavoris()) {
                            ZStack{
                                Rectangle()
                                    .cornerRadius(15)
                                    .frame(width: 160, height: 160)
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 2, x: 0, y: -1)
                                    .padding(.trailing, 5.0)
                                
                                VStack{
                                    HStack{
                                        Image("benevole1")
                                            .resizable()
                                            .frame(width: 60.0, height: 60.0)
                                            .cornerRadius(10)
                                        
                                        Image("benevole2")
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: 60, height: 60)
                                    }
                                    HStack{
                                        Image("benevole3")
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: 60, height: 60)
                                        Image("benevole4")
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: 60, height: 60)
                                    }
                                }
                            }
                        }
                        
                        Text("Actions bénévoles")
                            .font(.custom("DMSans-Bold", size: 18))
                            .padding(.top, 10.0)
                        
                        Text("6 activités enregistrées")
                            .font(.custom("DMSans-Regular", size: 14))
                            .foregroundColor(.grisF)
                    }
                }
                .padding(.bottom, 40.0)
                
                HStack{
                    VStack{
                        ZStack{
                            Rectangle()
                                .cornerRadius(15)
                                .frame(width: 160, height: 160)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2, x: 0, y: -1)
                            
                                .padding(.leading, 5.0)
                            
                            VStack{
                                HStack{
                                    Image("equitation")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60.0, height: 60.0)
                                    Image("equitation2")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                }
                                
                                HStack{
                                    Image("equitation3")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                    Image("equitation4")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                }
                            }
                        }
                        
                        Text("Equitation plage")
                            .font(.custom("DMSans-Bold", size: 18))
                            .padding(.top, 10.0)
                        
                        Text("5 activités enregistrées")
                            .font(.custom("DMSans-Regular", size: 14))
                            .foregroundColor(.grisF)
                    }
                    Spacer()
                    
                    VStack{
                        ZStack{
                            Rectangle()
                                .cornerRadius(15)
                                .frame(width: 160, height: 160)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2, x: 0, y: -1)
                                .padding(.trailing, 5.0)
                            
                            VStack{
                                HStack{
                                    Image("extreme1")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60.0, height: 60.0)
                                    Image("extreme2")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                }
                                
                                HStack{
                                    Image("parapente")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                    Image("extreme4")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 60, height: 60)
                                }
                            }
                        }
                        
                        Text("Sports extrêmes")
                            .font(.custom("DMSans-Bold", size: 18))
                            .padding(.top, 10.0)
                        
                        Text("10 activités enregistrées")
                            .font(.custom("DMSans-Regular", size: 14))
                            .foregroundColor(.grisF)
                    }
                }
            }
            .padding([.leading, .trailing ], 25)
            .navigationTitle("Mes favoris")
        }
    }
}

#Preview {
    FavorisView()
}
