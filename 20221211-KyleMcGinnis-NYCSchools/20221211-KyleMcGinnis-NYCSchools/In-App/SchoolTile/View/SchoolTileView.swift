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
                    .scaledToFill()
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
                    .foregroundColor(.black)
                HStack{
                    Text(viewModel.subtitle)
                        .font(.system(size: 15, weight: .heavy))
                        .foregroundColor(.green)
                    Spacer()
                }
                .padding(.vertical, 4)
            }
            Spacer()
        }
        
    }
    
    var body: some View {
        Button(action: {
            self.didTap(viewModel.school)
        }, label: {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                VStack(alignment: .leading) {
                    // TEMP until web images are online
                    // WebImage(url: vm.imageUrl)
                    imageView
                    Spacer()
                    description
                        .padding()
                }
                .frame(height: height)
                .asTile()
            }
        }
        )
    }
}