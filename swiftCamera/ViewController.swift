//
//  ViewController.swift
//  swiftCamera
//
//  Created by 葛上海翔 on 2018/05/24.
//  Copyright © 2018年 kaito kuzukami. All rights reserved.
//

import UIKit

//カメラを使うときはまず二つのデリゲートメゾットを呼び出す
//プライバシー設定を行うinfo.pilistからprivacy camera,photolibraryを選択

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    
    
    @IBOutlet var backimage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()



    }
    
    
    @IBAction func cmera(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
    self.present(cameraPicker, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    @IBAction func library(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        //pohitolibrary概要可能かチェック
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        
        
        
    }
    //カメラ（アルバム）から画像を受け取るデリゲートメゾット
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //backImageViewというものをはじめにつくっておいて、そのimageに
            //撮影された画像(アルバムで選択された画像)が、デリゲートメソッドが呼ばれたときに
            //UserPhotoボタンがタップされた時、
            //入っているpickedImageを代入する
            backimage.image = pickedImage
            
            //アルバムに追加するタイミングを変えられる
            
            // アルバムに追加.
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
        }
        
        //カメラ画面(アルバム画面)を閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()




    }


}

