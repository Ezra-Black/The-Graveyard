import foundation

func presentModalMailComposerViewController(animated: Bool) {
       if MFMailComposeViewController.canSendMail() {
           let mailComposeVC = MFMailComposeViewController()
           mailComposeVC.delegate = &lt;#delegate#&gt;

           mailComposeVC.setSubject(&lt;#subject#&gt;)
           mailComposeVC.setMessageBody(&lt;#body#&gt;, isHTML: true)
           mailComposeVC.setToRecipients([&lt;#recipients#&gt;])

           present(mailComposeVC, animated: animated, completion: nil)
       } else {
           let alert = UIAlertController(title: NSLocalizedString("Error", value: "Error", comment: ""),
                             message: NSLocalizedString("Your device doesn't support Mail messaging", value: "Your device doesn't support Mail messaging", comment: ""),
                             preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: nil))
           present(alert, animated: true, completion: nil)
       }
   }

   //MARK: MFMailComposeViewControllerDelegate

   func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {

       if error != nil {
           print("Error: \(error)")
       }

       dismiss(animated: true)
   }
