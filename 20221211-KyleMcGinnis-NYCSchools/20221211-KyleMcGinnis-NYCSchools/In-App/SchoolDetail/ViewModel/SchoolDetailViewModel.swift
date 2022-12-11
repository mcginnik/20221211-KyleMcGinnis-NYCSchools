//
//  SchoolDetailViewModel.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//


import SwiftUI
import MapKit

class SchoolDetailViewModel: ObservableObject {
    
    
    // MARK: Properties
    
    @Published var school: School
    @Published var isLoading: Bool = false
    
    var imageURL: URL? {
        return URL(string: ImageConstants.collegeLogoImageURLString)
    }
    
    var name: String {
        school.name
    }
    
    var city: String {
        school.city
    }
    
    var phoneNumber: String {
        school.phoneNumber
    }
    
    var email: String? {
        school.email
    }
    
    var zip: String {
        school.zip
    }
    
    var description: String {
        school.overviewParagraph
    }
    
    var address: String {
        school.primaryAddress
    }
    
    var grades: String {
        school.finalGrades
    }
    
    var interests: [String] {
        school.interests
    }
    
    var requirements: [String] {
        school.requirements
    }
    
    var website: String? {
        school.website
    }
    
    var sports: [String] {
        school.schoolSports
    }
    
    var stateCode: String {
        school.stateCode
    }
    
    var mapLocations: [MapLocation] {
        if let coord = coord {
            return [MapLocation(name: school.name, coordinate: coord)]
        }
        return []
    }
    
    var coord: CLLocationCoordinate2D? {
        if let lat = school.latitude, let long = school.longitude {
            let coord = CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(long))
            return coord
        }
        return nil
    }
    
    var region: MKCoordinateRegion {
        if let coord = coord {
            return MKCoordinateRegion(center: coord, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
        let coord = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        return MKCoordinateRegion(center: coord, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
    }
    
    @Published var SATs: [SAT] = []
           
    // MARK: Lifecycle
    
    init(school: School){
        self.school = school
        fetchSchoolDetail()
    }
    
    // MARK: API
    
    private func fetchSchoolDetail(){
        isLoading = true
        SchoolSearchService.shared.fetchSATs(for: school) { [weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success(let sats):
                    self?.SATs = sats
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        }
    }
    
    
}
