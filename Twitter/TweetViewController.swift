//
//  TweetViewController.swift
//  Twitter
//
//  Created by Georgina Woo on 10/4/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    //@IBOutlet weak var charCount: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty)
        {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    

    /*
    textView.delegate = self
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        
        // TODO: Check the proposed new text character count
        // Set the max character limit
        let characterLimit = 280

        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)

        // TODO: Update Character Count Label
        charCount.text = characterLimit-newText.count as? String
        print(newText.count)
        return newText.count < characterLimit
    }
     */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
