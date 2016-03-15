//
//  ViewController.swift
//  RadialGradientExample
//
//  Created by Vadim Drobinin on 12/3/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var exampleImage: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let filter = Filters.VignetteFilter
    let filtered = filter.filterFunction(UIImage(named: "testImage")!)
    exampleImage.image = filtered
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

