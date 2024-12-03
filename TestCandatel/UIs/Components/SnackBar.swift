//
//  SnackBar.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import UIKit

import SwiftUI

class SnackbarManager: ObservableObject {
    static let shared = SnackbarManager()
    
    @Published var message: String = ""
    @Published var isShowing: Bool = false
    @Published var duration: TimeInterval = 3.0
    
    private init() { }

    func show(message: String = "Coming Soon", duration: TimeInterval = 2.0) {
        self.message = message
        self.duration = duration
        self.isShowing = true

        DispatchQueue.main.async {
            if let rootVC = UIApplication.shared.currentRootViewController {
                let snackbarView = UIHostingController(rootView: GlobalSnackbar())
                snackbarView.view.backgroundColor = .clear
                snackbarView.modalPresentationStyle = .overFullScreen
                rootVC.present(snackbarView, animated: true, completion: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        snackbarView.dismiss(animated: true)
                        self.isShowing = false
                    }
                })
            }
        }
    }
}


struct GlobalSnackbar: View {
    @ObservedObject var snackbarManager = SnackbarManager.shared
    
    var body: some View {
        VStack {
            Spacer()

            if snackbarManager.isShowing {
                HStack {
                    Text(snackbarManager.message)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: snackbarManager.isShowing)
            }
        }
        .padding(.bottom, 20)
    }
}
