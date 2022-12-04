//
//  PlayerTransferView.swift
//  6PAS
//
//  Created by Fatih Toker on 23.11.2022.
//

import SwiftUI

struct PlayerCareerView: View {
    
    @StateObject var career : PlayerCareerViewModel
    
    var body: some View {
        Text("Transfer")
    }
}

struct PlayerTransferView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCareerView(career: PlayerCareerViewModel(service: PlayerCareerService(), params: ["player" : "276"]))
    }
}
