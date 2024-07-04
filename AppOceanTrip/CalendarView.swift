import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Sélectionner une date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .accentColor(.bleuF)
                
                Text("Date sélectionnée : \(formattedDate(selectedDate))")
                    .padding()
                    .font(.custom("DMSans-Regular", size: 16))
                
                NavigationLink(destination: ReservationView(activity: activitiesArray[0], selectedDate: selectedDate)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(
                                LinearGradient(
                                    gradient:
                                        Gradient(colors: [Color.bleuF,Color.bleuC, Color.beige]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                            .frame(width: 251, height: 54)
                        
                        Text("Valider")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.custom("DMSans-Bold", size: 20))
                    }
                }
                .padding()
            }
            .padding()
            .navigationTitle("Calendrier")
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR") // Définir le locale sur français
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    CalendarView()
}
