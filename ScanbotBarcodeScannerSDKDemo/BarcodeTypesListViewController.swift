//
//  BarcodeTypesListViewController.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 05.12.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class BarcodeTypesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var selectDeselectAllButton: UIBarButtonItem?
    
    private let allBarcodes = SBSDKBarcodeType.allTypes()
    
    @IBAction private func selectDeselectAllButtonTapped(_ sender: UIBarButtonItem) {
        if self.isEverythingSelected {
            SharedParameters.acceptedBarcodeTypes = []
        } else {
            SharedParameters.acceptedBarcodeTypes.formUnion(self.allBarcodes)
        }
        self.tableView?.reloadData()
        self.updateSelectDeselectButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateSelectDeselectButton()
    }
    
    private func updateSelectDeselectButton() {
        self.selectDeselectAllButton?.title = self.isEverythingSelected ? "Deselect all" : "Select all"
    }
    
    private var isEverythingSelected: Bool {
        return SharedParameters.acceptedBarcodeTypes.count == self.allBarcodes.count
    }
}

extension BarcodeTypesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allBarcodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let barcode = self.allBarcodes[indexPath.row]
        cell.textLabel?.text = barcode.name
        cell.accessoryType = SharedParameters.acceptedBarcodeTypes.contains(barcode) ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let barcode = self.allBarcodes[indexPath.row]
        if SharedParameters.acceptedBarcodeTypes.contains(barcode) {
            SharedParameters.acceptedBarcodeTypes.remove(barcode)
        } else {
            SharedParameters.acceptedBarcodeTypes.insert(barcode)
        }
        self.tableView?.reloadRows(at: [indexPath], with: .none)
        self.updateSelectDeselectButton()
    }
}
