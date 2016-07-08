//
//  TutorialViewController.swift
//  NaishoTalk
//
//  Created by 上村 宙生 on 2016/07/08.
//  Copyright © 2016年 sectalk. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .Forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    func getFirst() -> TutorialFirstViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("TutorialFirstViewController") as! TutorialFirstViewController
    }
    
    func getSecond() -> TutorialSecondViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("TutorialSecondViewController") as! TutorialSecondViewController
    }
    
    func getThird() -> TutorialThirdViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("TutorialThirdViewController") as! TutorialThirdViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}

extension TutorialPageViewController : UIPageViewControllerDataSource {
    
    func tutorialPageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(TutorialThirdViewController) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(TutorialSecondViewController) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func tutorialPageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(TutorialFirstViewController) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(TutorialSecondViewController) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}
