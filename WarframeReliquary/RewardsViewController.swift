//
//  RewardViewController.swift
//  WarframeReliquary
//
//  Created by Anthony Whitaker on 10/17/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit
import CoreData

/// Set selectedRelics with relevant relics before loading this controller
class RewardsViewController: UITableViewController {
    
    var rewardsByRarity = Dictionary<Rarity, [SelectedReward]> ()
    var selectedRelics = [SelectedRelic]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        var selectedRewards = RewardUtils.rewards(for: selectedRelics, from: context)
        selectedRewards = RewardUtils.unique(selectedRewards: selectedRewards)
        rewardsByRarity = RewardUtils.groupByRarity(selectedRewards: selectedRewards)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = .white
        headerView.backgroundView?.backgroundColor = UIColor(red: 20/255.0, green: 39/255.0, blue: 47/255.0, alpha: 1)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return rewardsByRarity.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rarity = convertToRarity(from: section) {
            return rewardsByRarity[rarity]!.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RewardCell", for: indexPath) as? RewardTableViewCell {
            if let rarity = convertToRarity(from: indexPath.section) {
                let selectedReward = rewardsByRarity[rarity]![indexPath.row]
                cell.configureCell(selectedReward: selectedReward)
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let rarity = convertToRarity(from: section) {
            return rarity.description
        }
        return ""
    }
    
    func convertToRarity(from section: Int) -> Rarity? {
        var rarity: Rarity?
        switch section {
        case 0:
            rarity = .Rare
        case 1:
            rarity = .Uncommon
        case 2:
            rarity = .Common
        default:
            rarity = nil
        }
        
        return rarity
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
