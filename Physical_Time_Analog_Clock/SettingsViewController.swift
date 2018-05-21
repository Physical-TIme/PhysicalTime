//
//  SettingsViewController.swift
//  Physical_Time_Analog_Clock
//
//  Created by Xi Stephen Ouyang on 3/11/18.
//  Copyright © 2018 Xi Stephen Ouyang. All rights reserved.
//

/*
 
 Transferral of info from 1 view to another.
 
 Segueway -
 class variables -
 */
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var hoursPerDayText: UITextField!
    @IBOutlet weak var minutesPerHourText: UITextField!
    @IBOutlet weak var revolutionPerDayText: UITextField!
    @IBOutlet weak var minutesRevolutionPerHourText: UITextField!
    @IBOutlet weak var angleOffsetText: UITextField!
    @IBOutlet weak var timeOffsetText: UITextField!
    @IBOutlet weak var modeText: UITextField!
    @IBOutlet weak var fname: UITextField!
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToClock", sender: self)
    }
    @IBAction func export(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToClockE", sender: self)
    }
    @IBAction func importing(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToClockI", sender: self)
    }
    
    // called right before segueway occurs on current ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let identifier = segue.identifier {
            if identifier == "segueToClock" {
                let clockViewController = segue.destination as! ViewController
                clockViewController.hoursPerDay = Int(hoursPerDayText.text!)
                clockViewController.minutesPerHour = Int(minutesPerHourText.text!)
                clockViewController.revolutionPerDay = Int(revolutionPerDayText.text!)
                clockViewController.minuteRevolutionPerHour = Int(minutesRevolutionPerHourText.text!)
                clockViewController.angleOffset = Float(angleOffsetText.text!)
                clockViewController.timeOffset = Int(timeOffsetText.text!)
                clockViewController.mode = Int(modeText.text!)
        
            }
            else if identifier == "segueToClockE" {
                
            }
            else if identifier == "segueToClockI" {
                let clockViewController = segue.destination as! ViewController
                let information = InOut().importSettings(fname)
                let WordsArray = information.components(separatedBy: ":")
                var count = 0;
                for sect in WordsArray{
                    if count == 0{
                        let dh: String = sect
                        clockViewController.hoursPerDay = Int(dh)!
                    }
                    if count == 1{
                        let dh: String = sect
                        clockViewController.minutesPerHour = Int(dh)!
                    }
                    if count == 2{
                        let dh: String = sect
                        clockViewController.revolutionPerDay = Int(dh)!
                    }
                    if count == 3{
                        let dh: String = sect
                        clockViewController.minuteRevolutionPerHour = Int(dh)!
                    }
                    if count == 4{
                        let dh: String = sect
                        clockViewController.angleOffset = Float(dh)!
                    }
                    if count == 5{
                        let dh: String = sect
                        clockViewController.timeOffset = Int(dh)!
                    }
                    if count == 6{
                        let dh: String = sect
                        clockViewController.mode = Int(dh)!
                    }
                    count = count + 1
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "morningGoldenHour.jpeg")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
