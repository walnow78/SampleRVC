//
//  MenuViewController.swift
//  SampleRVC
//
//  Created by Walicki, Pawel (Cognizant) on 6/21/17.
//  Copyright © 2017 es.pael. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let menuOptions = ["Option 1", "Option 2", "Option 3"]

}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.cellId, for: indexPath) as! MenuCell
        cell.titleLabel.text = menuOptions[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = FooterMenu(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))
        footer.delegate = self

        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let revealViewController:SWRevealViewController = self.revealViewController()
        let vc: UIViewController?
        
        switch indexPath.row {
        case 0:
            vc = storyboard?.instantiateViewController(withIdentifier:"vc1")
        case 1:
            vc = storyboard?.instantiateViewController(withIdentifier:"vc2")
        case 2:
            vc = storyboard?.instantiateViewController(withIdentifier:"vc3")
        default:
            return
        }
        
        let nc = UINavigationController.init(rootViewController:vc!)
        revealViewController.pushFrontViewController(nc, animated: true)
    }
}

extension MenuViewController: FooterMenuDelegate {
    func buttonTapped(arg: String) {
        print(arg)
    }
}
