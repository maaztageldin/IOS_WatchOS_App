import SwiftUI

struct CountdownView: View {
    @State private var countdown: Int = 5
    @State private var currentStepIndex: Int = 0
    @State private var isRunning: Bool = false
    let totalDurationInSeconds: Int = 15 * 60 // 15 minutes

    private var steps: [(text: String, color: Color)] = [
        ("inhalation", .green),
        ("bloque", .gray),
        ("exhalation", .red),
        ("bloque", .gray)
    ]

    var body: some View {
        VStack {
            HStack {
                Text("\(countdown)")
                    .foregroundColor(.gray)
                    .font(.system(size: 110))
                Text(steps[currentStepIndex].text)
                    .foregroundColor(steps[currentStepIndex].color)
            }
            .onAppear {
                startCountdown()
            }
        }
    }

    func startCountdown() {
        isRunning = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            guard isRunning else {
                timer.invalidate()
                return
            }
            countdown -= 1
            if countdown <= 0 {
                currentStepIndex = (currentStepIndex + 1) % steps.count
                countdown = 5
            }
            if countdown == 0 && currentStepIndex == 0 {
                timer.invalidate()
            }
        }
    }
}
