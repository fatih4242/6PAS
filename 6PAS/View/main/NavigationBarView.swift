//
//  NavigationBarView.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import SwiftUI

struct NavigationBarView: View {
    
    
    var body: some View {
      Image("logo-white")
            .resizable()
            .frame(width: 50, height: 60)
            
       
        
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
