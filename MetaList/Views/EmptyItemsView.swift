//
//  EmptyItemsView.swift
//  MetaList
//
//  Created by Oytun Şenkul on 7.03.2024.
//

import SwiftUI

struct EmptyItemsView: View {
    @State var animate: Bool = false
    let secondAccentcolor = Color("SecondAccentColor")
    let firstAccentcolor = Color("FirstAccentColor")
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("There are no tasks!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Have you got any tasks?")
                    .padding(.bottom,20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add A Task")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondAccentcolor : firstAccentcolor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30:50)
                .shadow(
                    color: animate ? secondAccentcolor.opacity(0.7) :  firstAccentcolor.opacity(0.7),
                    radius: animate ? 50 : 30,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.2 : 1.0)
                .offset(y: animate ? -6 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: viewAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func viewAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    EmptyItemsView()
}
