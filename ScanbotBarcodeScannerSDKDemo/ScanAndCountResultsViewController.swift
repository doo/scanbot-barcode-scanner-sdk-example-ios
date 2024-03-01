//
//  ScanAndCountListViewController.swift
//  ScanbotSDK Internal Demo
//
//  Created by Rana Sohaib on 20.06.23.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ScanAndCountResultsViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    var countedBarcodes: [SBSDKBarcodeScannerAccumulatingResult] = []
    private var selectedBarcode: SBSDKBarcodeScannerResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        countedBarcodes = countedBarcodes.sorted { $0.code.dateOfDetection > $1.code.dateOfDetection }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBarcodeResultDetails",
            let destination = segue.destination as? BarcodeResultDetails,
            let selectedBarcode = self.selectedBarcode {
            destination.barcode = BarcodeResult(type: selectedBarcode.type,
                                                rawTextString: selectedBarcode.rawTextString,
                                                rawTextStringWithExtension: selectedBarcode.rawTextStringWithExtension,
                                                barcodeImage: selectedBarcode.barcodeImage,
                                                rawBytes: selectedBarcode.rawBytes,
                                                formattedResult: selectedBarcode.formattedResult)
        }
    }
}

extension ScanAndCountResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countedBarcodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScanAndCountBarcodeDetailsCell",
                                                 for: indexPath) as! ScanAndCountBarcodeDetailsCell
        let barcode = countedBarcodes[indexPath.row]
        cell.barcodeResult.text = barcode.code.rawTextStringWithExtension
        cell.barcodeType.text = barcode.code.type.name
        cell.barcodeCountLabel.text = "x\(barcode.scanCount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedBarcode = countedBarcodes[indexPath.row].code
        performSegue(withIdentifier: "showBarcodeResultDetails", sender: self)
    }
}
