import SwiftUI

struct DetailsFavoris: View {
    @State private var activities = activitiesArray
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach($activities) { $activity in
                        if activity.addFavorite {
                            NavigationLink(destination: DescriptionView(activity: activity)) {
                                DetailsDesignView(activity: $activity)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Actions bénévoles")
        }
    }
}

struct DetailsDesignView: View {
    @Binding var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 250)
                    .clipped()
                    .cornerRadius(10)
                
                Button(action: {
                    activity.addFavorite.toggle()
                }) {
                    Image(systemName: activity.addFavorite ? "heart.fill" : "heart")
                        .foregroundColor(activity.addFavorite ? .red : .gray)
                        .padding()
                }
            }
            
            Text(activity.titre)
                .font(.custom("DMSans-Bold", size: 18))
                .foregroundColor(.black)
            
            Text(activity.localisation)
                .font(.subheadline)
                .foregroundColor(.grisF)
            
            HStack {
                Text("(\(activity.nombreAvis) Avis)")
                    .font(.subheadline)
                    .foregroundColor(.grisF)
                
                Spacer()
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { star in
                        Image(systemName: star < activity.etoile ? "star.fill" : "star")
                            .foregroundColor(star < activity.etoile ? .yellow : .grisC)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 2, x: 0, y: -1)
        .padding([.leading, .trailing], 25)
    }
}

#Preview {
    DetailsFavoris()
}
