//
//  ViewController.swift
//  musicplayerDemo
//
//  Created by KUWAJIMA MITSURU on 2015/09/13.
//  Copyright (c) 2015年 nackpan. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    var player = MPMusicPlayerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = MPMusicPlayerController.applicationMusicPlayer()
        //player = MPMusicPlayerController.systemMusicPlayer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pick(sender: AnyObject) {
        // MPMediaPickerControllerのインスタンスを作成
        let picker = MPMediaPickerController()
        // ピッカーのデリゲートを設定
        picker.delegate = self
        // 複数選択を不可にする。（trueにすると、複数選択できる）
        picker.allowsPickingMultipleItems = false
        // ピッカーを表示する
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    // メディアアイテムピッカーでアイテムを選択完了したときに呼び出される
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        

        // 選択した曲情報がmediaItemCollectionに入っているので、これをplayerにセット。
        player.setQueueWithItemCollection(mediaItemCollection)
        // 再生開始
        player.play()
        // ピッカーを閉じ、破棄する
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //選択がキャンセルされた場合に呼ばれる
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        // ピッカーを閉じ、破棄する
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func pushPlay(sender: AnyObject) {
        player.play()
    }

    @IBAction func pushPause(sender: AnyObject) {
        player.pause()
    }

    @IBAction func pushStop(sender: AnyObject) {
        player.stop()
    }



}

