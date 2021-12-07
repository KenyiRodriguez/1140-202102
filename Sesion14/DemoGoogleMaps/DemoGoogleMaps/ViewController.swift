//
//  ViewController.swift
//  DemoGoogleMaps
//
//  Created by Kenyi Rodriguez on 6/12/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    lazy var houseMarker: GMSMarker = {
       
        let marker = GMSMarker()
        marker.icon = UIImage(systemName: "bus.doubledecker")
        marker.isDraggable = true
        marker.map = self.mapView
        return marker
    }()
    
    lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.goToMyLocation()
    }
    
    @IBAction private func drawRoute(_ sender: Any) {
        
        guard let path = GMSPath(fromEncodedPath: "fbzhAn}guM}BwFz@wIbBcPzFej@qEeAmBoBeNiGkFhYqUnBeCoXuKr@d@vQuGjVnChe@bHtDsBrDrVhK") else { return }
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .systemIndigo
        polyline.strokeWidth = 5
        polyline.map = self.mapView
        
        let bounds = GMSCoordinateBounds(path: path)
        guard let cameraPosition = self.mapView.camera(for: bounds, insets: UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)) else { return }
        self.mapView.animate(to: cameraPosition)
    }
    
    private func configure() {
        
        self.locationManager.startUpdatingLocation()
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
        self.mapView.delegate = self
    }
    
    private func goToMyLocation() {
        
        guard let userCoordinate = self.locationManager.location?.coordinate else { return }
        self.moveCameraToCoordinate(userCoordinate)
    }
    
    private func moveCameraToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition(target: coordinate, zoom: 16)
        self.mapView.animate(to: camera)
    }
    
    private func createMarkerAtCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        marker.isDraggable = true
        marker.map = self.mapView
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        self.createMarkerAtCoordinate(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        if marker == self.houseMarker {
            return false
        } else {
            marker.map = nil
            return true
        }
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.houseMarker.position = position.target
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.moveCameraToCoordinate(coordinate)
    }
}

