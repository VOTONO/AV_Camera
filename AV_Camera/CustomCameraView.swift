//
//  CustomCameraView.swift
//  AV_Camera
//
//  Created by Mac User on 27.04.2022.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { Result in
                switch Result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        print("Error: no image data")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            Spacer()
            Button {
                cameraService.capturePhoto()
            } label: {
                Image(systemName: "circle")
                    .font(.system(size: 75))
                    .foregroundColor(.white)
            }
            .padding(.bottom)

            }
        }
    }
}
