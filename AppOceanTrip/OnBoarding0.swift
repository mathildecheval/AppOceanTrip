import SwiftUI

struct OnBoarding0: View {
    @Binding var onboarding: Int
    
    var body: some View {
        Button {
            onboarding += 1
        } label: {
            Image("fond")
                .resizable()
                .ignoresSafeArea()
                .frame(width: 400, height: 800)
        }
    }
}
#Preview {
    OnBoarding0(onboarding: .constant(0))
}
