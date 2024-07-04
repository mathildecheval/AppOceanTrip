import SwiftUI

struct NavView: View {
    @State private var selectedTab = "Carte"
    @State private var selectedRegion: String? = nil
    @State private var onboarding : Int = 0
    
    var body: some View {
        
        if onboarding < 4 {
            Group {
                if onboarding == 0 {
                    OnBoarding0(onboarding: $onboarding)
                } else if onboarding == 1 {
                    OnBoarding1(onboarding: $onboarding)
                } else if onboarding == 2 {
                    OnBoarding2(onboarding: $onboarding)
                } else if onboarding == 3 {
                    OnBoarding3(onboarding: $onboarding)
                }
            }
        } else {
            TabView(selection: $selectedTab) {
                CarteView(selectedRegion: $selectedRegion)
                    .tabItem {
                        Label("Carte", systemImage: "map")
                    }
                    .tag("Carte")
                    .onChange(of: selectedRegion) { newRegion in
                        if var region = newRegion {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                selectedTab = "Activités"
                            }
                        }
                    }
                
                ListeView()
                    .tabItem {
                        Label("Activités", systemImage: "tennis.racket")
                    }
                    .tag("Activités")
                
                FavorisView()
                    .tabItem {
                        Label("Favoris", systemImage: "suit.heart")
                    }
                    .tag("Favoris")
                
                CompteView()
                
                    .tabItem {
                        Label("Compte", systemImage: "person")
                    }
                    .tag("Compte")
            }
            .tint(Color("bleuF"))
        }
    }
}

#Preview {
    NavView()
}
