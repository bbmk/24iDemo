//
//  ImageLoader.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 30.3.22.
//

import Foundation
import UIKit

class ImageLoader {
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
        let url: URL! = URL(string: imagePath)
        if url == nil { return }
        
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = UIImage(systemName: "heart.fill")
            DispatchQueue.main.async {
                completionHandler(placeholder!)
            }
            let imgName = getImageName(name: imagePath)
            if let imgName = imgName,
               let savedImg = loadImageFromDiskWith(fileName: imgName) {
                DispatchQueue.main.async {
                    completionHandler(savedImg)
                }
                return
            }
            
            let task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    self.saveImage(imageName: imgName!, image: img)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task.resume()
        }
    }
    func getImageName(name: String) -> String? {
        if let lastIndex = name.lastIndex(of: "/") {
            var subString = name[lastIndex..<name.endIndex]
            subString.remove(at: subString.startIndex)
            return String(subString)
        }
        return nil
    }
    
    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
    }
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        
        return nil
    }
}


