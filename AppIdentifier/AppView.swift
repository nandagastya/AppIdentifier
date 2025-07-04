//
//  AppView.swift
//  AppIdentifier
//
//  Created by Agastya Nand on 03/07/25.
//

import SwiftUI

struct AppView: View {
    @StateObject private var vm = MobileAppsViewModel()
    @State private var selectedCategory: String = "All"
    @State private var showWheelPicker: Bool = false
    @State private var searchText: String = ""
    
    var categories: [String] {
        let appCategories = Set(vm.mobileApps.compactMap{$0.category})
        return ["All"] + appCategories.sorted()
    }
    
    var filteredApps: [AppInfo] {
        vm.mobileApps.filter { app in
            (
                (searchText.isEmpty || app.name.lowercased().contains(searchText.lowercased())) ||
             (app.category?.lowercased().contains(searchText.lowercased()) ?? false)) && (selectedCategory == "All" || app.category == selectedCategory)
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                //MARK: Picker
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(PalettePickerStyle())
                .padding(.vertical)
                .padding(.horizontal)
                Spacer()
                
                
                //MARK: List
                List(filteredApps){ app in
                    Button {
                        if let url = URL(string: app.scheme) , UIApplication.shared.canOpenURL(url){
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack {
                            
                            if let iconURL = app.iconURL , let url = URL(string: iconURL){
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            else {
                                Image(systemName: "figure.surfing.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color.blue)
                            }
                             
                            VStack(alignment: .leading, spacing: 4) {
                                Text(app.name)
                                    .font(.headline)
                                
                                if let category = app.category {
                                    Text((category))
                                        .font(.subheadline)
                                        .fontWeight(.thin)
                                }
                                
                            }
                        }
                    }
                }.listStyle(.plain)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
                if !searchText.isEmpty {
                    Button("Cancel", role: .cancel) {
                        searchText = ""
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("AppYo!")
            
            
            //MARK: Toolbar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AboutMe()
                    } label: {
                        VStack(spacing: 2) {
                            Image("TcMan")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .font(.headline)
                                .foregroundStyle(Color.indigo)
                            
                            Text("About me")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black.opacity(0.4))
                                
                        }
//                        .shadow(color: Color.yellow, radius: 10, x: 0.3, y: 0.3)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        NotificationManager.instance.requestDeleteNotification()
                    } label: {
                        VStack(spacing: 2) {
                            Image("DeletePat")
                                .resizable()
                                .frame(width: 35, height: 35)
                            
                            Text("Delete?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.red.opacity(0.7))
                        }
                    }
                }
            }
            .onAppear {
                UNUserNotificationCenter.current().setBadgeCount(0)
            }
        }
    }
}

#Preview {
    AppView()
}
