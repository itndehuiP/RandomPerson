//
//  MapView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit
import MapKit
import os.log
import Combine

class MapView: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private var cancellables: Set<AnyCancellable> = []
    var viewModel: MapViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerRelocation()
        configureNavBar()
    }
    
    private func configureNavBar() {
        let backItem = NavigationBarItem(option: .back,
                                         selector: #selector(goBack),
                                         title: "Back",
                                         systemImgName: "chevron.left",
                                         style: .highlighted)
        self.navigationController?.setNavigationBar(with: [backItem])
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func set(_ setter: MapSetter) {
        viewModel = MapViewModel(coordinate: setter.coordinates, description: setter.description)
    }
    
    func registerRelocation() {
        viewModel?.$coordinate
            .sink(receiveValue: { coordinate in
                DispatchQueue.main.async {[weak self] in
                    guard let self = self else {
                        Logger().critical("MapView: Nil self in registerRelocation")
                        return
                    }
                    self.relocateMap(to: coordinate)
                }
            })
            .store(in: &cancellables)
    }
    
    private func relocateMap(to coordinate: CLLocationCoordinate2D) {
        let center = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        self.mapView.setRegion(region, animated: true)
        addAnnotation(coordinate: coordinate, description: viewModel?.descriptionName)
    }
    
    private func addAnnotation(coordinate: CLLocationCoordinate2D, description: String?) {
        let currentAnnotations = mapView.annotations
        mapView.removeAnnotations(currentAnnotations)
        let annotation = MapAnnotation(description: description, coordinate: coordinate)
        self.mapView.addAnnotation(annotation)
    }
    
}
