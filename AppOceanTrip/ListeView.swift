import SwiftUI

struct ListeView: View {
    @State private var selectedFilter: String? = nil
    var filteredActivities: [Activity] {
        if let filter = selectedFilter {
            return activitiesArray.filter { $0.type == filter }
        } else {
            return activitiesArray
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack {
                        Image("paysage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                        
                        VStack(alignment:.center)
                        {
                            Text("Provence-Alpes\nCôte-d'Azur")
                                .font(.custom("DMSans-Bold", size: 38))
                                .foregroundColor(.white)
                        }
                        .shadow(color: .grisF, radius: 1, x: 0, y: -1)
                    }
                    .ignoresSafeArea()
                    
                    HStack(spacing: 32) {
                        Button(action: {
                            selectedFilter = "sport"
                        }) {
                            VStack {
                                Image("PictoColor1")
                                
                                Text("Sport")
                                    .font(selectedFilter == "sport" ? .custom("DMSans-Bold", size: 11) : .custom("DMSans-Regular", size: 11))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button(action: {
                            selectedFilter = "solidaire"
                        }) {
                            VStack {
                                Image("PictoColor2")
                                
                                Text("Solidaire")
                                    .font(selectedFilter == "solidaire" ? .custom("DMSans-Bold", size: 11) : .custom("DMSans-Regular", size: 11))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button(action: {
                            selectedFilter = "art"
                        }) {
                            VStack {
                                Image("PictoColor3")
                                
                                Text("Artisanat")
                                    .font(selectedFilter == "art" ? .custom("DMSans-Bold", size: 11) : .custom("DMSans-Regular", size: 11))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button(action: {
                            selectedFilter = "culture"
                        }) {
                            VStack {
                                Image("PictoColor4")
                                
                                Text("Culture")
                                    .font(selectedFilter == "culture" ? .custom("DMSans-Bold", size: 11) : .custom("DMSans-Regular", size: 11))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button(action: {
                            selectedFilter = "nature"
                        }) {
                            VStack {
                                Image("PictoColor5")
                                
                                Text("Nature")
                                    .font(selectedFilter == "nature" ? .custom("DMSans-Bold", size: 11) : .custom("DMSans-Regular", size: 11))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16) {
                        ForEach(filteredActivities) { eachActivity in
                            NavigationLink(destination: DescriptionView(activity: eachActivity)) {
                                ActivityDesignView(activity: eachActivity)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ActivityDesignView: View {
    let activity: Activity
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 370, height: 195)
                .foregroundStyle(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: -1)
            
            HStack {
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 160)
                    .clipped()
                    .cornerRadius(15)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text(activity.titre)
                        .font(.custom("DMSans-Bold", size: 18))
                        .padding(.bottom, 2)
                        .foregroundColor(.black)
                    
                    HStack {
                        Image(systemName: "location.circle")
                            .foregroundStyle(Color.grisF)
                        
                        Text(activity.localisation)
                            .foregroundStyle(Color.grisF)
                            .font(.custom("DMSans-Regular", size: 14))
                            .padding(.bottom, 2)
                    }
                    
                    Text(activity.description)
                        .font(.custom("DMSans-Regular", size: 14))
                        .padding(.bottom, 2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .truncationMode(.tail)
                    
                    Text("Lire la suite")
                        .font(.custom("DMSans-Bold", size: 14))
                        .foregroundStyle(.bleuF)
                        .underline()
                        .padding(.bottom, 2)
                    
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
                .frame(width: 189)
            }
        }
    }
}

#Preview {
    ListeView()
}
