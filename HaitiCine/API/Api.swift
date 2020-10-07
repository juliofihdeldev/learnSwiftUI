import SwiftUI

class Api  {
    func getPost(completion: @escaping ([Users])->()  ){
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/users") else{return}
        URLSession.shared.dataTask(with: url) {(data, _, _)in
            let users  = try! JSONDecoder().decode([Users].self, from: data!)
            print(users)
            DispatchQueue.main.async {
                completion(users)
            }
            
        }.resume()
    }
    
}



