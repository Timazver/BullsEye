import UIKit

class ViewController: UIViewController {
    var points = 0
    var currentValue: Int=0
    var roundNumber: Int = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    var score=0
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var round: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue=lroundf(slider.value)
        startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackImageLeft = UIImage(named: "SliderTrackLeft")
        let trackImageLeftResizable = trackImageLeft?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackImageLeftResizable, for: .normal)
        
        let trackImageRight = UIImage(named: "SliderTrackRight")
        let trackImageRightResizable = trackImageRight?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackImageRightResizable, for: .normal)
    }
    func updateLabel() {
        label.text=String(targetValue)
    }
    
    func showScore() {
        scoreLabel.text = String(score)
    }
    
    func showRound() {
        round.text = String(roundNumber)
    }
    func startNewRound() {
        roundNumber+=1
        targetValue = Int(1+arc4random_uniform(100))
        currentValue=50
        slider.value=Float(currentValue)
        updateLabel()
        showScore()
        showRound()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startNewGame() {
        score=0
        roundNumber=0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue=lroundf(slider.value)
    }
    @IBAction func showAlert() {
        let difference: Int = abs(targetValue-currentValue)
        var points: Int = 100 - difference
        var message = "Вы набрали \(points) очков"
        
        let title: String
        if difference == 0 {
            title = "Превосходно!"
            points+=100
            message = "Вы набрали \(points) очков \n Вы также получили 100 бонусных очков!"
        }
        else if difference < 5 {
            title = "Ты почти сделал это!"
            if difference==1 {
                points+=50
                message = "Вы набрали \(points) очков\n Вы также получили 50 бонусных очков!"
            }
        }
        else if difference < 10 {
            title = "Неплохо!"
        }
        else {
            title = "Даже не близко..."
        }
        score+=points
        
        let alert=UIAlertController(title: title, message:message , preferredStyle: .alert)
        let action=UIAlertAction(title: "Ок", style: .default, handler:{
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
