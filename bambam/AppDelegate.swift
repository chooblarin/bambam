import Cocoa
import MASShortcut

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


  func applicationDidFinishLaunching(_ aNotification: Notification) {
  }

  func applicationWillTerminate(_ aNotification: Notification) {
  }
}

func bam(image: NSImage?) {
  guard let rect = NSScreen.main()?.frame else { return }
  let window = NSWindow(
    contentRect: rect,
    styleMask: NSWindowStyleMask.borderless,
    backing: NSBackingStoreType.buffered,
    defer: false)
  window.backgroundColor = NSColor.clear
  window.isOpaque = false
  window.alphaValue = 1
  window.makeKeyAndOrderFront(NSApplication.shared())
  window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.statusWindow))

  let imageView = NSImageView(frame: window.contentView!.bounds)
  imageView.wantsLayer = true
  imageView.image = image
  window.contentView?.addSubview(imageView)

  imageView.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  let animation = CABasicAnimation(keyPath: "transform.scale")
  animation.fromValue = 0.8
  animation.toValue = 8

  let opacityAnimation = CABasicAnimation(keyPath: "opacity")
  opacityAnimation.fromValue = 1
  opacityAnimation.toValue = 0

  let group = CAAnimationGroup()
  group.duration = 0.5
  group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
  group.fillMode = kCAFillModeForwards
  group.isRemovedOnCompletion = false
  group.animations = [animation, opacityAnimation]

  CATransaction.begin()
  CATransaction.setCompletionBlock { print(window) }
  imageView.layer?.add(group, forKey: "")
  CATransaction.commit()
}
