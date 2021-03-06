//
//  ContentView.swift
//  AV_Camera
//
//  Created by Mac User on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresnted = false
    
    
    var body: some View {
        ZStack {
            
            if capturedImage != nil {
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }else {
                Color(UIColor.systemBackground)
            }
            
            VStack {
                Spacer()
                Button {
                    isCustomCameraViewPresnted.toggle()
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresnted) {
                    CustomCameraView(capturedImage: $capturedImage)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
