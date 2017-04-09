import Cocoa
import MASShortcut

let kPreferenceGlobalShortcut = "GlobalShortcut"

class ViewController: NSViewController {

  @IBOutlet weak var shortcutView: MASShortcutView!

  override func viewDidLoad() {
    super.viewDidLoad()
    shortcutView.associatedUserDefaultsKey = kPreferenceGlobalShortcut
    MASShortcutBinder.shared()
      .bindShortcut(withDefaultsKey: kPreferenceGlobalShortcut) {
        bam(image: #imageLiteral(resourceName: "bam"))
    }
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}

