//
//  LocationSearchTableViewController.swift
//  Ride
//
//  Created by student on 11/17/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit
import MapKit

class LocationSearchTableViewController: UITableViewController {

var handleMapSearchDelegate:HandleMapSearch? = nil
var matchingItems:[MKMapItem] = []
var mapView: MKMapView? = nil
func parseAddress(selectedItem:MKPlacemark) -> String {
    // put a space between "4" and "Melrose Place"
    let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
    // put a comma between street and city/state
    let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
    // put a space between "Washington" and "DC"
    let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
    let addressLine = String(
        format:"%@%@%@%@%@%@%@",
        // street number
        selectedItem.subThoroughfare ?? "",
        firstSpace,
        // street name
        selectedItem.thoroughfare ?? "",
        comma,
        // city
        selectedItem.locality ?? "",
        secondSpace,
        // state
        selectedItem.administrativeArea ?? ""
    )
    return addressLine
}
override func viewDidLoad() {
    super.viewDidLoad()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
// MARK: - Table view data source
}

extension LocationSearchTableViewController : UISearchResultsUpdating {
func updateSearchResults(for searchController: UISearchController) {
    guard let mapView = mapView,
        let searchBarText = searchController.searchBar.text else { return }
    let request = MKLocalSearchRequest()
    request.naturalLanguageQuery = searchBarText
    //To search for a region around the current location, Note:There is no specific radius distance
    // request.region = mapView.region
    //Location of UCSF
    //37.785834000000001, longitude: -122.406417
    let locationUCSF = CLLocationCoordinate2DMake(37.785834000000001, -122.406417)
    //Search within radius of ~= 11 miles
    request.region = MKCoordinateRegionMakeWithDistance(locationUCSF, 17700, 17700)
    let search = MKLocalSearch(request: request)
    search.start { response, _ in
        guard let response = response else {
            return
        }
        self.matchingItems = response.mapItems
        self.tableView.reloadData()
    }
}
}

extension LocationSearchTableViewController {

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    let selectedItem = matchingItems[indexPath.row].placemark
    cell.textLabel?.text = selectedItem.name
    cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
    return cell
}
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return matchingItems.count
}
}
extension LocationSearchTableViewController {
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedItem = matchingItems[indexPath.row].placemark
    handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
    dismiss(animated: true, completion: nil)
}
// override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
}
/*
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

    // Configure the cell...

    return cell
}


*/

/*
// Override to support conditional editing of the table view.
override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
}
*/

/*
// Override to support editing the table view.
override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        // Delete the row from the data source
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

}
*/

/*
// Override to support conditional rearranging of the table view.
override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
}
*/

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
}
*/


