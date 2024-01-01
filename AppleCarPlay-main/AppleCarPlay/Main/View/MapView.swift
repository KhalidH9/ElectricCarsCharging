import SwiftUI
import MapKit

struct MapView: View {
    
    
    @Environment(\.openURL) var openURL
    @State var PresentedSheet : Bool = false
    
    @StateObject var locationManager = LocationManager()
    
    @State var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    @State var mapSelection: Int?
    
    
     var selectedPlace: MapModel? {
        if let mapSelection {
            return ChargingLocations.first(where: { $0.id.hashValue == mapSelection.hashValue })
        }
        return nil
    }
    
    var body: some View {
        VStack{
            ZStack{
                
                
                Map(position: $cameraPosition, selection: $mapSelection){
                    UserAnnotation()
                    ForEach(ChargingLocations, id: \.id) { location in
                        Marker("Charging Stations",coordinate: location.location)
                            .tint(.green)
                            .tag(location.id)
                    }
                    
                }
                .frame(width: 375, height: 740)
                .padding(.bottom,26)
                .padding(.top,24)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 40,bottomTrailingRadius: 40))
                .onChange(of: mapSelection, { oldValue, newValue in
                    PresentedSheet = newValue != nil
                })
                .sheet(isPresented: $PresentedSheet) {
                    VStack{
                        Rectangle()
                            .frame(width: 30, height: 2)
                            .foregroundStyle(.white)
                            .padding()
                        Text((selectedPlace?.MainAddress)!)
                            .bold()
                            .frame(maxWidth: 350,alignment:.leading)
                        
                        Text((selectedPlace?.StreetAddress)!)
                            .font(.caption)
                            .frame(maxWidth: 350,alignment:.leading)
                        Text((selectedPlace?.portsAvailable)!)
                            .font(.caption)
                            .frame(maxWidth: 350,alignment:.leading)
                        
                        VStack{
                            HStack{
                                Image(systemName: "cable.coaxial")
                                VStack{
                                    Text((selectedPlace?.portType)!)
                                        .frame(maxWidth: 350,alignment:.leading)
                                    Text("Port Type")
                                        .frame(maxWidth: 350,alignment:.leading)
                                        .font(.footnote)
                                        .foregroundStyle(.gray.opacity(0.8))
                                }
                            }
                            .frame(maxWidth: 350,alignment:.leading)
                            Divider()
                            HStack{
                                Image(systemName: "dollarsign.circle")
                                VStack{
                                    Text((selectedPlace?.cost)!)
                                        .frame(maxWidth: 350,alignment:.leading)
                                    Text("Cost")
                                        .font(.footnote)
                                        .foregroundStyle(.gray.opacity(0.8))
                                        .frame(maxWidth: 350,alignment:.leading)
                                }
                                
                            }
                            .frame(maxWidth: 350,alignment:.leading)
                            Divider()
                            HStack{
                                Image(systemName: "bolt.circle")
                                VStack{
                                    Text((selectedPlace?.Power)!)
                                        .frame(maxWidth: 350,alignment:.leading)
                                    Text("Power")
                                        .frame(maxWidth: 350,alignment:.leading)
                                        .font(.footnote)
                                        .foregroundStyle(.gray.opacity(0.8))
                                }
                            }
                            .frame(maxWidth: 350,alignment:.leading)
                          
                        }
                        .frame(maxWidth: 350,alignment:.leading)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("bck")).stroke(Color(.white), lineWidth:2).frame(width: 350, height: 200))
                        .padding()
                        Button {
                            openURL(URL(string: "comgooglemaps://?saddr=&daddr=\(String(describing: selectedPlace!.location.latitude)),\(String(describing: selectedPlace! .location.longitude))&directionsmode=driving")!)
                        } label: {
                            Text("Open in Google Maps")
                                
                        }
                        .padding(32)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.green).frame(width: 350, height: 50))
                        

                    }
                    .presentationDetents([.medium])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.white)
                    .background(Color("bck"))
                }
                .mapControls {
                    MapUserLocationButton()
                }
                .onAppear{
                    locationManager.requestLocation()
                    
                }
                
                
            }
            
            Spacer()
            
        }
        
    }
    
}


#Preview {
    MapView()
}

extension CLLocationCoordinate2D {
    static var userLocation : CLLocationCoordinate2D {
        return .init(latitude: 24.774265, longitude: 46.738586)
    }
}

extension MKCoordinateRegion {
    static var userRegion : MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 100000)
    }
}
