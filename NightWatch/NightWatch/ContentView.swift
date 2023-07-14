//
//  ContentView.swift
//  NightWatch
//
//  Created by Ajdin Karahasanovic on 14.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                //MARK: Nightly tasks
                Group{
                    HStack {
                        Image(systemName: "moon.stars")
                            .foregroundColor(Color.yellow)
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                        Text("Nightly Tasks").font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/).fontWeight(.heavy).foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/).underline().textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    }
                    Text("- Check all windows")
                    Text("- Check all doors")
                    Text("- Check that the safe is locked")
                    Text("- Check the mailbox")
                    Text("- Inspect security cameras")
                    Text("- Clear ice from sidewalks")
                    Text("- Document \"strange and unusual\" occurances")
                }
                //MARK: Weekly tasks
                Group {
                    Divider()
                    HStack {
                        Image(systemName: "sunset")
                            .foregroundColor(Color.yellow)
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                        Text("Weekly Tasks").font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/).fontWeight(.heavy).foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/).underline().padding(.top).textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    }
                    Text("- Check inside all vacant rooms")
                    Text("- Walk the perimeter of the property")
                }
                //MARK: Monthly tasks
                Group {
                    Divider()
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.yellow)
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                        Text("Monthly Tasks").font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/).fontWeight(.heavy).foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/).underline().padding(.top).textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    }
                    Text("- Test security alarm")
                    Text("- Test motion detectors")
                    Text("- Test smoke alarms")
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding([.top, .leading])
        Spacer()
    }
}

#Preview {
    ContentView()
}
