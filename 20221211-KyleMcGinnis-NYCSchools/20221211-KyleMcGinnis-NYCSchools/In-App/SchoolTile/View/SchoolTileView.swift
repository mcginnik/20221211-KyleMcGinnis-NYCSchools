//
//  SchoolTileView.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

struct SchoolTileView: View {
    
    @ObservedObject private var viewModel: SchoolTileViewModel
    
    private let height: CGFloat = 200
    
    private var didTap: (School) -> Void
    
    init(school: School, didTap: @escaping (School) -> Void){
        self.viewModel = SchoolTileViewModel(school: school)
        self.didTap = didTap
    }
    
    var imageView: some View {
        AsyncImage(url: viewModel.imageURL){ phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                EmptyView()
            }
        }
    }
    
    var description: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .lineLimit(2)
                    .foregroundColor(.primary)
                Text(viewModel.subtitle)
                    .font(.system(size: 12, weight: .heavy))
                    .foregroundColor(.secondary)

            }
            .multilineTextAlignment(.leading)

        }
        
    }
    
    var body: some View {
        Button(action: {
            self.didTap(viewModel.school)
        }, label: {
            Group {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 0) {
                        // TEMP until web images are online
                        // WebImage(url: vm.imageUrl)
                        HStack {
                            Spacer()
                            imageView
                                .frame(width: 80, height: 80)
                                .clipped()
                            Spacer()
                        }
                        description
                            .padding()
                    }
                    .frame(height: height)
                }
            }
            .asTile()
        }
        )
    }
}
