import SwiftUI

import MapKit

struct DescriptionView: View {
    @State private var selection = 0
    let activity: Activity
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    DesignDetailView(activity: activity)
                    NavigationLink(destination:   ConnexionView(userData: UserData())) {
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
                            
                            Text("Réserver")
                                .font(.custom("DMSans-Bold", size: 20))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct DesignDetailView: View {
    @State var activity: Activity
    @State private var selection = 0
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Image(activity.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                activity.addFavorite.toggle()
            }) {
                Image(systemName: activity.addFavorite ? "heart.fill" : "heart")
                    .foregroundColor(activity.addFavorite ? .red : .white)
                    .padding()
            }
        }
        
        VStack(alignment: .leading) {
            Text(activity.titre)
                .font(.custom("DMSans-Bold", size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 1)
            
            
            HStack(alignment: .center) {
                Image(systemName: "location.circle")
                    .foregroundStyle(Color.grisF)
                
                Text(activity.adresse)
                
                Spacer()
                
                Text(activity.localisation)
            }
            .font(.custom("DMSans-Regular", size: 16))
            .foregroundColor(Color.grisF)
            .padding(.bottom, 1)
            
            HStack {
                Text("(\(activity.nombreAvis) Avis)")
                    .foregroundColor(.grisF)
                    .font(.custom("DMSans-Regular", size: 16))
                
                Spacer()
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { star in
                        Image(systemName: star < activity.etoile ? "star.fill" : "star")
                            .foregroundColor(star < activity.etoile ? .yellow : .grisC)
                    }
                }
            }
            Text(activity.description)
                .font(.custom("DMSans-Regular", size: 14)) // Pour paragraphe
                .padding(.vertical, 15.0)
                .padding(.bottom, 15)
            
            Picker(selection: $selection, label: Text("Picker")) {
                Text("Détails").tag(0)
                Text("Plan").tag(1)
                Text("Conditions").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .font(.custom("DMSans-Regular", size: 14))
            .padding(.bottom, 15)
            
            if selection == 0 {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(activity.details)
                }
                .font(.custom("DMSans-Regular", size: 14))
                
            } else if selection == 1 {
                VStack {
                    Map(coordinateRegion: .constant(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    )), annotationItems: [activity]) { activity in
                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude), tint: .red)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .padding([.bottom], 15)
                }
                
            } else if selection == 2 {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(activity.conditions)
                        .padding([.bottom], 15)
                }
                .font(.custom("DMSans-Regular", size: 14))
                
            }
            
            HStack {
                VStack {
                    Image("jauge1")
                    Text("CO2")
                }
                
                Spacer()
                
                VStack {
                    Image("jauge2")
                    Text("Nature")
                }
                
                Spacer()
                
                VStack {
                    Image("jauge3")
                    Text("Détente")
                }
                
                Spacer()
                
                VStack {
                    Image("jauge4")
                    Text("Santé")
                }
            }
            .font(.custom("DMSans-Regular", size: 14))
            .padding(.top, 15)
            .padding(.bottom, 15)
        }
        .padding([.leading, .trailing], 25)
    }
}

#Preview {
    DescriptionView(activity: activitiesArray[0])
}
