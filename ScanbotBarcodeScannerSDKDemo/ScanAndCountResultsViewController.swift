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
    private var selectedBarcode: SBSDKBarcodeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        countedBarcodes = countedBarcodes.sorted { $0.dateOfLastScanning > $1.dateOfLastScanning }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBarcodeResultDetails",
            let destination = segue.destination as? BarcodeResultDetails,
            let selectedBarcode = self.selectedBarcode {
            destination.barcode = BarcodeResult(type: selectedBarcode.format,
                                                rawTextString: selectedBarcode.text,
                                                rawTextStringWithExtension: selectedBarcode.textWithExtension,
                                                barcodeImage: selectedBarcode.sourceImage?.toUIImage(),
                                                rawBytes: selectedBarcode.rawBytes,
                                                formattedDocument: selectedBarcode.extractedDocument)
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
        cell.barcodeResult.text = barcode.item.textWithExtension
        cell.barcodeType.text = barcode.item.format.name
        cell.barcodeCountLabel.text = "x\(barcode.scanCount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedBarcode = countedBarcodes[indexPath.row].item
        performSegue(withIdentifier: "showBarcodeResultDetails", sender: self)
    }
}
