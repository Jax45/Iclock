import UIKit

class  StopwatchViewController: UIViewController {
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StartStopBtn: UIButton!
    @IBOutlet weak var ResetBtn: UIButton!
    
    private var model: StopwatchModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = StopwatchModel()
        let storedTime = model.getStoredTime()
        TimeLabel.text = "\(storedTime.0):\(storedTime.1):\(storedTime.2):\(storedTime.3)"
        
        let displayLink = CADisplayLink(target: self, selector: #selector(updateWatch))
        displayLink.add(to: .current, forMode: .common)
        
        if(model.Running()){
            StartStopBtn.setTitle("Stop", for: .normal)
            ResetBtn.isEnabled = false
        }
    }
    @objc func updateWatch(){
        if(model.Running()){
            let runningTime = model.updateWatch()
            TimeLabel.text = "\(runningTime.0):\(runningTime.1):\(runningTime.2):\(runningTime.3)"
        }
    }
    
    @IBAction func StartStopPressed(_ sender: Any) {
        if(model.startStopPressed()){
            StartStopBtn.setTitle("Start", for: .normal)
            ResetBtn.isEnabled = true;
        }
        else{
            StartStopBtn.setTitle("Stop", for: .normal)
            ResetBtn.isEnabled = false;
        }
    }
    @IBAction func ResetPressed(_ sender: Any) {
        StartStopBtn.setTitle("Start", for: .normal)
        model.reset()
        TimeLabel.text = "0:0:0:0"
    }
}
