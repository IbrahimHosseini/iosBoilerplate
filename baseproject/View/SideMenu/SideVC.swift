//
//  SideVC.swift
//  baseproject
//
//  Created by sehosseini on 3/10/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit
import Toaster
import PKHUD
import SwiftyUserDefaults
import SCLAlertView
import ImagePicker
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

fileprivate enum ImagePickerType {
    case profile
}

class SideVC: UIViewController {
    
    //-----------------------
    //MARK: - parameters
    //-----------------------
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var versionView: UIView!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var profileImage: NVImageView!
    @IBOutlet weak var versionLabel: UILabel!
    
    private var mobile: String?
    private var imagePickerType: ImagePickerType?
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        profileImage.image = UIImage(named: "profile")
        profileImage.backgroundColor = .clear
        profileImage.layer.cornerRadius = 7
        profileImage.clipsToBounds = true

        
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    @IBAction func onClickProfileImage(_ sender: UIButton) {
        
//        let appearance = SCLAlertView.SCLAppearance(
//            kDefaultShadowOpacity: 0.5,
//            kTitleFont: UIFont.numberBold(ofSize: 15)!,
//            kTextFont: UIFont.numberMedium(ofSize: 13)!,
//            kButtonFont: UIFont.numberMedium(ofSize: 15)!,
//            showCloseButton: false,
//            showCircularIcon: false,
//            contentViewCornerRadius: 15.0,
//            fieldCornerRadius: 5.0,
//            buttonCornerRadius: 5.0,
//            hideWhenBackgroundViewIsTapped: true,
//            circleBackgroundColor: Colors.white,
//            titleColor: Colors.gray,
//            dynamicAnimatorActive: true,
//            disableTapGesture: false)
//
//        let alert = SCLAlertView(appearance: appearance)
//
//        alert.showInfo("عکس پروفایل", subTitle: "")
        
    }
    
    //-----------------------
    //MARK: - functions
    //-----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func exit() {
        
        let appearance = SCLAlertView.SCLAppearance(
            kDefaultShadowOpacity: 0.5,
            kTitleFont: UIFont.numberBold(ofSize: 15)!,
            kTextFont: UIFont.numberMedium(ofSize: 13)!,
            kButtonFont: UIFont.numberMedium(ofSize: 15)!,
            showCloseButton: false,
            showCircularIcon: false,
            contentViewCornerRadius: 15.0,
            fieldCornerRadius: 5.0,
            buttonCornerRadius: 5.0,
            hideWhenBackgroundViewIsTapped: true,
            circleBackgroundColor: Colors.white,
            titleColor: Colors.gray,
            dynamicAnimatorActive: true,
            disableTapGesture: false)
        
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(NVLocalized(logout)) {
            
            self.dismiss(animated: true, completion: nil)
            
            App.shared.userToken = nil
            Defaults[DefaultsKeys.UserToken] = nil
            App.shared.reboot()
            
        }
        alert.addButton(NVLocalized(cancel)) {}
        
        alert.showError(NVLocalized(logoutDesc), subTitle: "")
        
    }

    
    private func profile() {
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateProfileVC") as! UpdateProfileVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    private func viewDesign() {
        
        initTable()
        
        profileView.backgroundColor = Colors.black
        versionView.backgroundColor = Colors.gray
        
        view.backgroundColor = Colors.gray
        
        profileImage.image = UIImage(named: "profile")
        
        versionLabel.textAlignment = .center
        versionLabel.text = "v\(App.shared.appVersion)"
        versionLabel.font = UIFont.systemFont(ofSize: 15)
        versionLabel.textColor = Colors.white
        
    }
}

//-----------------------
//MARK: - table view
//-----------------------
extension SideVC: UITableViewDelegate, UITableViewDataSource {
    
    private func initTable() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.backgroundColor = .clear
        
        tableView.register(UINib(nibName: SideItemCell.identifier, bundle: nil), forCellReuseIdentifier: SideItemCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorColor = .gray
        tableView.separatorStyle = .none
        tableView.separatorInset.left = 16
        tableView.separatorInset.right = 16
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuSection.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: SideItemCell.identifier, for: indexPath) as! SideItemCell
        cell.fill(titleLabel: MenuSection.titles[indexPath.row], titleImage: MenuSection.images[indexPath.row], index: indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            profile()
        case 10:
            exit()
        default:
            break
        }
        
    }
    
}

//-----------------------
//MARK: - image picker
//-----------------------
//extension SideVC: ImagePickerDelegate {
//    
//    private func initImagePicker(type: ImagePickerType){
//        self.imagePickerType = type
//        var configuration = ImagePicker.Configuration()
//        configuration.doneButtonTitle = NVLocalized("انتخاب و ارسال")
//        configuration.noImagesTitle = NVLocalized("هیچ عکسی انتخاب نشده")
//        configuration.recordLocation = false
//        
//        let imagePicker = ImagePickerController(configuration: configuration)
//        imagePicker.imageLimit = 1
//        imagePicker.delegate = self
//        
//        present(imagePicker, animated: true, completion: nil)
//    }
//    
//    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {}
//    
//    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        guard images.count == 1  else {
//            Toast(text: NVLocalized("هیچ عکسی انتخاب نشده"), duration: Delay.long).show()
//            return
//        }
//        
//        HUD.show(.progress)
//        
//        //send image to server and add the id to self
//        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData) in
//            multipartFormData.append(images.first!.jpegData(compressionQuality: 0.7)!, withName: "file", fileName: "file", mimeType: "image/jpeg")
//        }, usingThreshold: 1024,
//           to: configuration.baseURL! + APIUrls.profileUpload/*Configuration.getBaseUrl(rurl: "/upload-file")*/,
//            method: .post,
//            headers: ["token":App.shared.userToken ?? ""],
//            /*"Cookie":"shoptoken=\(App.shared.userToken ?? "")"],*/
//            encodingCompletion: {[weak self]  (result:SessionManager.MultipartFormDataEncodingResult) in
//                
//                switch result {
//                case .success(let req, _, _)://let streamingFromDisk, let streamFileURL):
//                    req.responseString().then(execute: {[weak self] (str) -> Void in
//                        if let slf = self {
//                            let ans = Mapper<RMBaseObjectResponse<RMToken>>().map(JSONString: str)
//                            print("ans==> \(ans?.toJSON())")
//                            
//                            guard ans != nil && ans!.status == true else {
//                                self?.onFailImageUpload()
//                                return
//                            }
//                            slf.profileImage.image = images.first!
//                            //                        slf.profileImageId = ans?.data
//                            print("resp===> \(ans?.data.token)")
//                            
//                        }
//                        
//                    }).catch(execute: {[weak self] (error) in
//                        self?.onFailImageUpload()
//                    }).always {
//                        HUD.hide(afterDelay: 0.3, completion: nil)
//                    }
//                case .failure(_)://let error):
//                    self?.onFailImageUpload()
//                }})
//    }
//    
//    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
//        imagePicker.dismiss(animated: true, completion: nil)
//    }
//    
//    private func onFailImageUpload(){
//        
//    }
//}
