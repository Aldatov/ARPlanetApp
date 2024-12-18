//
//  SecondView.swift
//  ARPlanetApp
//
//  Created by Konstantin Aldatov on 18/12/24.
//
import SwiftUI
import RealityKit
import ARKit

struct SecondView: View {
    @State private var showARView1 = false
    @State private var showARView2 = false
    @State private var showARView3 = false
    @State private var showARView4 = false
    
    var body: some View {
        ZStack {
            Image("Retro") // Replace with your image name
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .blur(radius: 5)
            
            if showARView1 {
                ARViewContainer1()
                    .edgesIgnoringSafeArea(.all)
            } else if showARView2 {
                ARViewContainer2()
                    .edgesIgnoringSafeArea(.all)
            } else if showARView3 {
                ARViewContainer3()
                    .edgesIgnoringSafeArea(.all)
            } else if showARView4 {
                ARViewContainer3()
                    .edgesIgnoringSafeArea(.all)
            } else {
                VStack(spacing: 20) {
                    Button(action: {
                        showARView1 = true
                    }) {
                        Text("🤖")
                            .font(.title)
                            .frame(width: 200, height: 50)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(                // Add a border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 5) // Change 'red' to your desired border color
                            )
                    }
                    .padding()
                    
                    Button(action: {
                        showARView2 = true
                    }) {
                        Text("🪑")
                            .font(.title)
                            .frame(width: 200, height: 50)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(                // Add a border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 5) // Change 'red' to your desired border color
                            )
                    }
                    .padding()
                    
                    Button(action: {
                        showARView3 = true
                    }) {
                        Text("📺")
                            .font(.title)
                            .frame(width: 200, height: 50)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(                // Add a border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 5) // Change 'red' to your desired border color
                            )
                        
                    }
                    .padding()
                    
                    Button(action: {
                        showARView4 = true
                    }) {
                        Text("🎸")
                            .font(.title)
                            .frame(width: 200, height: 50)
                            .padding()
                            .background(Color.indigo)  // Background color of the button
                            .foregroundColor(.white) // Text color
                            .cornerRadius(10)        // Rounded corners
                            .overlay(                // Add a border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 5) // Change 'red' to your desired border color
                            )
                    }
                    .padding()
                }
                
            }
               
        }
        
    }
    
    struct ARViewContainer1: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal, .vertical]
            configuration.environmentTexturing = .automatic
            arView.session.run(configuration)
            
            let anchorEntity = AnchorEntity(plane: .any)
            guard let modelEntity = try? Entity.loadModel(named: "robot_walk_idle") else { return arView }
            
            modelEntity.generateCollisionShapes(recursive: true)
            anchorEntity.addChild(modelEntity)
            
            arView.installGestures([.all], for: modelEntity)
            arView.scene.addAnchor(anchorEntity)
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {}
    }
    
    struct ARViewContainer2: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal]
            configuration.environmentTexturing = .automatic
            arView.session.run(configuration)
            
            let anchorEntity = AnchorEntity(plane: .horizontal)
            guard let modelEntity = try? Entity.loadModel(named: "chair_swan") else { return arView }
            
            modelEntity.generateCollisionShapes(recursive: true)
            anchorEntity.addChild(modelEntity)
            
            arView.installGestures([.all], for: modelEntity)
            arView.scene.addAnchor(anchorEntity)
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {}
    }
    
    struct ARViewContainer3: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal]
            configuration.environmentTexturing = .automatic
            arView.session.run(configuration)
            
            let anchorEntity = AnchorEntity(plane: .horizontal)
            guard let modelEntity = try? Entity.loadModel(named: "tv_retro") else { return arView }
            
            modelEntity.generateCollisionShapes(recursive: true)
            anchorEntity.addChild(modelEntity)
            
            arView.installGestures([.all], for: modelEntity)
            arView.scene.addAnchor(anchorEntity)
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {}
    }

    struct ARViewContainer4: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal]
            configuration.environmentTexturing = .automatic
            arView.session.run(configuration)
            
            let anchorEntity = AnchorEntity(plane: .horizontal)
            guard let modelEntity = try? Entity.loadModel(named: "Guitar") else { return arView }
            
            modelEntity.generateCollisionShapes(recursive: true)
            anchorEntity.addChild(modelEntity)
            
            arView.installGestures([.all], for: modelEntity)
            arView.scene.addAnchor(anchorEntity)
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {}
    }
}

#Preview {
    SecondView()
}

