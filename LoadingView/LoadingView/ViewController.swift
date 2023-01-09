//
//  ViewController.swift
//  LoadingView
//
//  Created by Ethan Hess on 6/28/22.
//

import UIKit

let theCell = "theCell"

class ViewController: UIViewController {
    
    let table : UITableView = {
        let theTable = UITableView()
        return theTable
    }()
    
    let loader : LoadingView = {
        let lv = LoadingView()
        return lv
    }()
    
    var contentArray : [SomeObject] = []
    
    //MARK: Dependendy injection
    let dataManagerDI : DataManager = {
        let dm = DataManager()
        return dm
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureSubviews()
        
        loaderStartStopHandler(true)
        
        //perform(#selector(configureSubviews), with: nil, afterDelay: 0.25)

        //Data manager will retain self (implicit block behavior), though if retention is mutual a retain cycle can happen
        
        //weak = can be nil, won't create a retain cycle
        //unowned = can never be nil, will crash if nil and access attempted, make sure exists
        
//        DataManager.timeTest(3) { finished in
//            if finished == true {
//                self.loaderStopHandler()
//            }
//        }

        load(false)
    }
    
    //MARK: The problem: while scrolling to the bottom of a large list (YouTube playlist etc.), current pagination methods load as you scroll, but ideally should skip the middle part if the user scrolls fast enough (i.e. they want to scroll to the bottom of a list quickly)
    
    fileprivate func load(_ di: Bool) {
        if di == true {
            //MARK: For DI cannot be static functions and will need to use weak or unowned self since there will be mutual retention between it and this VC
            DispatchQueue.global(qos: .background).async {
                
            }
        } else {
            //TODO Eventually will have upper / lower bounds
            DispatchQueue.global(qos: .background).async {
                DataManager.loadLargeDataSet { arr in
                    DispatchQueue.main.async {
                        self.loaderStartStopHandler(false)
                        self.contentArray = arr
                        self.table.reloadData()
                    }
                }
            }
        }
    }
    
    fileprivate func loaderStartStopHandler(_ start: Bool) {
        if start == false {
            self.loader.stopAnimation()
            self.loader.isHidden = true
        } else {
            loader.startAnimation()
            loader.isHidden = false
        }
    }
    
    @objc fileprivate func configureSubviews() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: theCell)
        table.delegate = self
        table.dataSource = self
        table.frame = tableFrame()
        view.addSubview(table)
        
        loader.frame = loaderFrame()
        loader.isHidden = true
        view.addSubview(loader)
    }
    
    fileprivate func tableFrame() -> CGRect {
        let vw = view.frame.size.width
        let vh = view.frame.size.height
        return CGRect(x: vw / 8, y: vh / 8, width: vw - (vw / 4), height: vh - (vh / 4))
    }
    
    fileprivate func loaderFrame() -> CGRect {
        let vw = view.frame.size.width
        let vh = view.frame.size.height
        return CGRect(x: vw / 4, y: vh / 8, width: vw / 2, height: vh / 4)
    }
}

typealias TableFunctions = UITableViewDataSource & UITableViewDelegate

extension ViewController: TableFunctions {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = UITableViewCell(style: .subtitle, reuseIdentifier: theCell)
        
        //MARK: Config / load / don't load, see if visible
        let someObject = self.contentArray[indexPath.row]
        theCell.textLabel?.text = "HEY \(someObject.id)"
        
        return theCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

