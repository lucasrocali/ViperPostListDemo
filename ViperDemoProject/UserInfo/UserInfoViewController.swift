//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class UserInfoViewController: UIViewController, UserInfoViewProtocol,PopUpProtocol {

    var presenter: UserInfoPresenterProtocol?

    var popUpInfo : PopUpInfo?

    var user:User = User()

    @IBOutlet weak var nameUsernameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var siteLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    let annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()

        popUpInfo = PopUpInfo(popUpView: self.view, transitioningBackgroundView: UIView(), backgroundAlpha: 0.2, popupType: .center)

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.didTapBackgroundView (_:)))
        popUpInfo?.transitioningBackgroundView.addGestureRecognizer(gesture)

        nameUsernameLbl.text = "\(user.name) - \(user.username)"
        emailLbl.text = "Email: \(user.email)"
        phoneLbl.text = "Phone: \(user.phone)"
        siteLbl.text = "Site: \(user.website)"
        companyLbl.text = "Company: \(user.companyName)"

        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(user.lat)!, longitude: Double(user.lng)!)
        mapView.addAnnotation(annotation)
        mapView.showAnnotations(self.mapView.annotations, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func didTapBackgroundView(_ sender:UITapGestureRecognizer) {
         presenter?.closeView()
    }

}
