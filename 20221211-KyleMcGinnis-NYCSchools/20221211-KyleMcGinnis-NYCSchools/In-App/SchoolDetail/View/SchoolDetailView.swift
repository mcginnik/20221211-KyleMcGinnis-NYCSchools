//
//  SchoolDetailView.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI
import MapKit

struct SchoolDetailView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: SchoolDetailViewModel
    
    @State private var region: MKCoordinateRegion
    
    // MARK: Lifecycle
    
    init(viewModel: SchoolDetailViewModel) {
        self.viewModel = viewModel
        self.region = viewModel.region
    }
    
    // MARK: Components
    
    var map: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: false,
            userTrackingMode: .constant(.follow),
            annotationItems: viewModel.mapLocations,
            annotationContent: { location in
                MapPin(coordinate: location.coordinate, tint: .red)
            })
            .frame(height: 300)
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
    
    var contactInfo: some View {
        VStack(alignment: .leading) {
            if let website = viewModel.website {
                SchoolInfoRow(text: website, icon: ImageConstants.website)
            }
            if let email = viewModel.email {
                SchoolInfoRow(text: email, icon: ImageConstants.mail)
                    .textContentType(.emailAddress)
            }
            SchoolInfoRow(text: viewModel.phoneNumber, icon: ImageConstants.phone)
                .textContentType(.telephoneNumber)
            if let fax = viewModel.fax {
                SchoolInfoRow(text: fax, icon: ImageConstants.faxMachine)
                    .textContentType(.telephoneNumber)
            }
        }
    }
    
    var satScores: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.sats){ sat in
                Text("Average SAT Scores:")
                    .font(.headline)
                Group {
                    SchoolInfoRow(text: "Writing: \(sat.writingAvgScore)", icon: ImageConstants.graduationCap)
                    SchoolInfoRow(text: "Math: \(sat.mathAvgScore)", icon: ImageConstants.graduationCap)
                    SchoolInfoRow(text: "Reading: \(sat.criticialReadingAvgScore)", icon: ImageConstants.graduationCap)
                }
                
                .font(.subheadline)
            }
        }
    }
    
    var locationInfo: some View {
        VStack {
            VStack {
                SchoolInfoRow(text: viewModel.address, icon: ImageConstants.pin)
                SchoolInfoRow(text: viewModel.city)
                SchoolInfoRow(text: viewModel.stateCode)
            }
            .textContentType(.addressCityAndState)
            map
                .padding(.horizontal, -16)
        }
    }
    
    var description: some View {
        Text(viewModel.description)
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
                        contactInfo
                        description
                        satScores
                        locationInfo
                            .padding(.top, 16)
                    }
                    .padding()
                    Spacer()
                }
            }

        }
    }

}
