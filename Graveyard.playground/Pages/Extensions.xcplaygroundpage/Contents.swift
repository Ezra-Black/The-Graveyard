//: [Previous](@previous)

import UIKit


extension String {

    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }


    var isValidPassword: Bool {
        //Regex restricts to 8 character minimum, 1 capital letter, 1 lowercase letter, 1 number
        //If you have different requirements a google search for "password requirement regex" will help
        let passwordFormat      = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let passwordPredicate   = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }


    var isValidPhoneNumber: Bool {
        let phoneNumberFormat = "^\\d{3}-\\d{3}-\\d{4}$"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberFormat)
        return numberPredicate.evaluate(with: self)
    }


    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ" //iso8601
        dateFormatter.locale        = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone      = .current
        return dateFormatter.date(from: self)
    }
    
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
    
}





import SafariServices

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
//            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            let alertVC = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func presentSafariViewController(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
}





extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}





extension UIView {
    
    func addSubviews(_ views: UIView...) { for view in views { addSubview(view) } }
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}


extension UITableView {
    
    func reloadDataOnMainThread() { DispatchQueue.main.async { self.reloadData() } }
    

    func removeExcessCells() { tableFooterView = UIView(frame: .zero) }
}



enum ScreenSize {
    static let width                    = UIScreen.main.bounds.size.width
    static let height                   = UIScreen.main.bounds.size.height
    static let maxLength                = max(ScreenSize.width, ScreenSize.height)
    static let minLength                = min(ScreenSize.width, ScreenSize.height)
}


enum DeviceTypes {
    static let idiom                    = UIDevice.current.userInterfaceIdiom
    static let nativeScale              = UIScreen.main.nativeScale
    static let scale                    = UIScreen.main.scale

    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0

    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}

enum Keys {
    static let favorites            = "favorites"
}


enum Text {
    static let blank                = ""
}


