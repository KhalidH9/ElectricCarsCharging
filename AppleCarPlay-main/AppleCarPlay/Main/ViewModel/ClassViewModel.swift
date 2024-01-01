import Foundation

class ViewModel: ObservableObject {
    @Published var cars: [Cars] = []
    @Published var chargers: [Chargers] = []
    @Published var user: [Users] = []
    
    func fetchData() {
        var request = URLRequest(url: URL(string: "https://guktuybyixfulsrdhxxe.supabase.co/rest/v1/Cars?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Cars].self, from: data)
                DispatchQueue.main.async {
                    self.cars = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchPorts(){
        var request = URLRequest(url: URL(string: "https://guktuybyixfulsrdhxxe.supabase.co/rest/v1/Chargers?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Chargers].self, from: data)
                DispatchQueue.main.async {
                    self.chargers = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchUserData(){
        var request = URLRequest(url: URL(string: "https://guktuybyixfulsrdhxxe.supabase.co/rest/v1/Users?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1a3R1eWJ5aXhmdWxzcmRoeHhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NzIzOTMsImV4cCI6MjAxODI0ODM5M30.tLq5BDF8JSN3gKaP-oEkJGLE5IHuDzuXjQdC0HvNM2Y", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Users].self, from: data)
                DispatchQueue.main.async {
                    self.user = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
}

