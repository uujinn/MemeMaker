//
//  ViewController.swift
//  Color
//
//  Created by YangYujin on 2021/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topCaptionSegmentedControl.removeAllSegments()
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0

        topCaptionLabel.textColor = .black
        bottomCaptionLabel.textColor = .black
        bottomCaptionLabel.text = "What's your color?"
        UpdateView()
    }

    let topChoices = [CaptionChoice(emoji:"🐱", text: "I'm just a Cat", image:"Normal.png"), CaptionChoice(emoji:"👑", text: "I'm the Queen!", image:"Queen.png"), CaptionChoice(emoji:"😿", text: "I'm a Crybaby", image:"Crying.png"), CaptionChoice(emoji:"🎼", text: "I'm a guitarlist", image:"Guitar.png"),CaptionChoice(emoji:"🐱", text: "I'm Santa", image:"Santa.png")]
    
    let bottomChoices = [CaptionOption(emoji:"🤍", text: "I could be every color you like", color:"white"),CaptionOption(emoji:"💚", text: "I could be green", color:"green"),CaptionOption(emoji:"💛", text: "I could be yellow", color:"yellow"),CaptionOption(emoji:"💙", text: "I could be blue", color:"blue"),CaptionOption(emoji:"💜", text: "I could be purple", color:"purple"),CaptionOption(emoji:"❤️", text: "I could be red", color:"red")]


    func UpdateView(){
        topCaptionLabel.text = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].text
        
        let selectedImage = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].image
        mainImage.image = UIImage(named:selectedImage)
        let selectedColor = bottomChoices[bottomCaptionSegmentedControl.selectedSegmentIndex].color
        changeBackgroundColor(color: selectedColor)
         
        
    }
    
    func changeBackgroundColor(color: String){
        switch color{
        case "red":
            self.view.backgroundColor = .red
            self.bottomCaptionLabel.text = "I could be red"
        case "green":
            self.view.backgroundColor = .green
            self.bottomCaptionLabel.text = "I could be green"
        case "yellow":
            self.view.backgroundColor = .yellow
            self.bottomCaptionLabel.text = "I could be yellow"
        case "blue":
            self.view.backgroundColor = .blue
            self.bottomCaptionLabel.text = "I could be blue"
        case "purple":
            self.view.backgroundColor = .purple
            self.bottomCaptionLabel.text = "I could be purple"
        case "white":
            self.view.backgroundColor = .white
            self.bottomCaptionLabel.text = "I could be every color you like"
            self.bottomCaptionLabel.textColor  = .black
    
        default:
            self.view.backgroundColor = .black
            self.bottomCaptionLabel.text = "What's your color?"
            self.bottomCaptionLabel.textColor  = .white
            
        }
    }
    @IBAction func SegmentedControlChanged(_ sender: Any) {
        UpdateView()
    }
    @IBAction func colorSegmentedControlChanged(_ sender: Any) {
        UpdateView()
    }
}

