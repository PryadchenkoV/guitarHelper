//
//  InterfaceController.swift
//  GuitarHelper WatchKit Extension
//
//  Created by Ivan Pryadchenko on 11.07.16.
//  Copyright © 2016 Ivan Pryadchenko. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    let names = ["Cords","Tabes"]
  
    @IBOutlet weak var myTable : WKInterfaceTable!
    
    
    

    let songList = ["Smells Like Teen Spirit", "About the Girl", "Nothing Else Matters"]

    @IBOutlet var songTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loadList()
        
        loadTableData()
    }
    
    private func  loadTableData(){
        myTable.setNumberOfRows(names.count, withRowType: "CordsRowController")
        
        for (index, nameT) in names.enumerate(){
            let row = myTable.rowControllerAtIndex(index) as! CordsRowControl
            row.myLable.setText(nameT)
        }
    }
    
    func loadList()  {
        songTable.setNumberOfRows(songList.count, withRowType: "MainScreenSongList")
        for (index, song) in songList.enumerate(){
            //print("\(index) - \(songTable.rowControllerAtIndex(index))")
            
            let row = songTable.rowControllerAtIndex(index) as! MainScreenSongList
            row.lableSongText.setText(song)
            
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
