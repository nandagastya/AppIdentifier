//
//  AboutMe.swift
//  AppIdentifier
//
//  Created by Agastya Nand on 03/07/25.
//

import SwiftUI

struct AboutMe: View {
    var body: some View {
            
                ZStack {
                    Color.brown.opacity(0.5).ignoresSafeArea()
                    
                    VStack{
                        HStack(spacing: 0) {
                            Text("Boring😔")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .italic()
                                .underline()
                                .padding(.top, 65)
                            
                            
                            Image("Lost")
                                .padding(.top)
                            
                        }
                        ScrollView(showsIndicators: false){
                            
                            Image("chineseMan")
                                .resizable()
                                .scaledToFill()
                                .shadow(color: Color.teal.opacity(0.5), radius: 20)
                            
                            
                            Text("I'm Agastya Nand, currently in my third year pursuing B.Tech in Mathematics and Computing from Delhi Technological University. I’m writing to express my interest in the iOS Developer Internship role.")
                                .padding()
                            Text("Over the past year, I’ve immersed myself in native iOS development using Swift and SwiftUI and absolutely loved building real-world applications. Most recently, I developed FinWise, a crypto-tracking app that provides real-time market updates using RESTful APIs. I also built a WhatsApp clone with Firebase, featuring real-time messaging and authentication. These projects reflect not just my technical skills, but also my focus on clean UI, performance, and user experience.")
                                .padding()
                            
                            
                            Text("During my internship at HRIT Consultancy, I worked on live iOS projects and got hands-on exposure to production code, debugging workflows, and UI component development — helping deliver features under real deadlines.")
                                .padding()
                            
                            Text("What excites me about this opportunity is the chance to work on meaningful products while sharpening my skills alongside experienced developers. I learn fast, write clean code, and I genuinely enjoy collaborating with others to bring ideas to life.")
                                .padding()
                            
                        }
                        .font(.headline)
                        .padding(.horizontal)
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
            
            
          
    }
}

#Preview {
    AboutMe()
}
