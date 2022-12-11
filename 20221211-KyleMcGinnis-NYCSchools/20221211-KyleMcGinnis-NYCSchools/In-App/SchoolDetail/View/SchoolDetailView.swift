//
//  SchoolDetailView.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI
import MapKit

struct SchoolDetailView: View {
    
    @ObservedObject var viewModel: SchoolDetailViewModel
    
    @State private var region: MKCoordinateRegion
    
    init(viewModel: SchoolDetailViewModel) {
        self.viewModel = viewModel
        self.region = viewModel.region
    }
    
    var map: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: false,
            userTrackingMode: .constant(.follow),
            annotationItems: viewModel.mapLocations,
            annotationContent: { location in
                MapPin(coordinate: location.coordinate, tint: .red)
            })
            .frame(width: 400, height: 300)
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
    
    var loadingView: some View {
        ProgressView()
            .controlSize(.large)
    }
    
    var failedSearchView: some View {
        Text(SchoolSearchConstants.searchFailDescription)
    }
    
    var satScores: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.sats){ sat in
                Text("Average SAT Scores:")
                    .font(.headline)
                Group {
                    Text("Writing: \(sat.writingAvgScore)")
                    Text("Math: \(sat.mathAvgScore)")
                    Text("Reading: \(sat.criticialReadingAvgScore)")
                }
                .font(.subheadline)
            }
        }

    }
    
    var body: some View {
        if viewModel.isLoading {
            loadingView
        } else {
            ScrollView {
                VStack {
                    imageView
                        .frame(height: 150)
                        .clipped()
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.name)
                            .font(.title)
                        satScores
                        Text(viewModel.description)
                    }
                    .padding()
                    map
                    Spacer()
                }
            }

        }
    }

}
