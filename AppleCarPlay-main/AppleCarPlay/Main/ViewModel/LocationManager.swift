import Foundation
import CoreLocation

class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLDistanceFilterNone
    }
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}
