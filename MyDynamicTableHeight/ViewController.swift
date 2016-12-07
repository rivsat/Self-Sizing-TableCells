//
//  ViewController.swift
//  MyDynamicTableHeight
//
//  Created by Tasvir Rohila on 16/11/2016.
//  Copyright © 2016 Tasvir. All rights reserved.
//

import UIKit

struct TableData {
    var imageName: String = ""
    var title: String = ""
}
var theData: [TableData] = []

func loadTableData() {
    theData.append(TableData(imageName: "icon-1", title: "Acme Inc., was formed in 2004 to develop a software suite to bring physical security access control systems together with HR and IT systems."))
    
    theData.append(TableData(imageName: "icon-2", title: "Acme Inc. completed the first phase of development and deployed the solution at several key military installations. Acme Inc. products have been sold both directly and through an OEM relationship with one of Australasia’s leading security manufacturers."))
    
    theData.append(TableData(imageName: "icon-3", title: "In February 2006, Acme Inc. was acquired by Virsa Systems, Inc. (the world’s leading software start-up in the rapidly growing Sarbanes-Oxley Compliance market at the time) to extend their logical compliance software suite to incorporate physical security compliance."))
    
    theData.append(TableData(imageName: "icon-4", title: "Just two months after Virsa Systems’ acquisition of Acme Inc., SAP ( www.sap.com ) acquired Virsa Systems (including Acme Inc.). This was a major strategic acquisition for SAP that formed the foundation of SAP’s $1b investment in the creation of SAP’s Governance, Risk and Compliance division. For 18 months, the Acme Inc. team drove SAP’s global physical security convergence strategy and travelled the world meeting with SAP customers and personnel validating the emerging physical security convergence market."))
    
    theData.append(TableData(imageName: "icon-5", title: "In mid-2007, Acme Inc., was ‘spun-out’ of SAP, along with its software intellectual property, into the SAP partner ecosystem as an independent software vendor, to enable the commercialization of Acme Inc.’s physical security convergence software products."))
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadTableData()
        theTableView.rowHeight = UITableViewAutomaticDimension
        theTableView.estimatedRowHeight = 140
        theTableView.delegate = self
        theTableView.dataSource = self
        theTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! TableCell
    
        let _theData = theData[indexPath.row]
        cell.displayImage?.image = UIImage(named: _theData.imageName)
        cell.displayTitle.text = "This is a long title that can run into multiple lines"
        cell.displaySubTitle.text = _theData.title
        
        return cell
    }
}

class TableCell: UITableViewCell {
    @IBOutlet weak var displayTitle: UILabel!
    @IBOutlet weak var displaySubTitle: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.displayTitle.font = UIFont(name: "Helvetica-Bold", size: 14)
        self.displaySubTitle.font = UIFont(name: "Helvetica", size: 12)
    }
}
