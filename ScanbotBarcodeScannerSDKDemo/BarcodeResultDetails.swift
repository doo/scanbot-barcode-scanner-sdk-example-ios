//
//  BarcodeResultDetails.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 02.12.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class BarcodeResultDetails: UITableViewController {
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var label: UILabel?
    
    var barcode: SBSDKBarcodeScannerResult? {
        didSet {
            if self.isViewLoaded {
                self.updateUI()
            }
        }
    }
    
    private var formatter = BarcodeFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 600
        
        self.updateUI()
    }
    
    private func updateUI() {
        guard let barcode = self.barcode else { return }
        self.imageView?.image = barcode.barcodeImage
        self.label?.text = self.formatter.formattedBarcodeText(barcode: barcode) ?? barcode.rawTextString
    }
}
