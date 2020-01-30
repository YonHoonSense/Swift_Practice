//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 이용훈 on 30/01/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!  // AVAudioPlayer클래스인 player 선언
    var timer: Timer!  // Timer클래스인 timer 선언
    
    @IBOutlet var PlayPauseButton: UIButton! // 재생, 일시정지 버튼
    @IBOutlet var TimeLabel: UILabel!  // 재생 시간
    @IBOutlet var ProgressSlider: UISlider!  // 구간 이동 슬라이더
    
    func initializePlayer() { // 플레이어 실행 초기화
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else { // sound 라는 이름을 가진 오디오파일의 데이터를 가져오고, 데이터가 없을 시 오류 메세지 출력
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.ProgressSlider.maximumValue = Float(self.player.duration)
        self.ProgressSlider.minimumValue = 0
        self.ProgressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.TimeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
          
            if self.ProgressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.ProgressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializePlayer()
    }
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton)  {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
            self.makeAndFireTimer()
        } else {
            self.player?.pause()
            self.invalidateTimer()
        }
        
    }
    
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        
        if sender.isTracking { return }
        
        self.player.currentTime = TimeInterval(sender.value)
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.PlayPauseButton.isSelected = false
        self.ProgressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
    

}

