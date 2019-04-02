//
//  LVFullScreenTranslation.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
/**退出 横屏*/
class ExitFullscreenTransition : NSObject , UIViewControllerAnimatedTransitioning{
    private var showingView:LVLandSpaceView?
    init(showingView:LVLandSpaceView) {
        super.init()
        self.showingView = showingView
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let dismissingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let dismissingView:UIView?
        if #available(iOS 8.0, *)  {
            dismissingView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        }else{
            dismissingView = dismissingViewController!.view
        }
        let smallMoviewFrame = transitionContext.containerView.convert((self.showingView?.originalFrame)!, from: self.showingView!.parentView)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: .layoutSubviews, animations: {
            dismissingView!.transform = CGAffineTransform.identity
            dismissingView!.frame = smallMoviewFrame;
            self.showingView!.frame = dismissingView!.bounds;
        }) { (ret) in
            self.showingView!.frame = self.showingView!.originalFrame;
            self.showingView!.parentView.addSubview(self.showingView!)
            dismissingView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}

/**进入 横屏*/
class EnterFullscreenTransition  : NSObject , UIViewControllerAnimatedTransitioning{
    private var showingView:LVLandSpaceView?
    init(showingView:LVLandSpaceView) {
        super.init()
        self.showingView = showingView
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let presentedView:UIView?
        if #available(iOS 8.0, *)  {
            presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        }else{
            presentedView = presentedViewController?.view
        }
        let smallMoviewFrame = transitionContext.containerView.convert((self.showingView?.bounds)!, to: presentedView)
        if #available(iOS 8.0, *)  {
            
            presentedView?.bounds = (self.showingView?.bounds)!
//            presentedView?.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 2))
            transitionContext.containerView.addSubview(presentedView!)
            /*
             * 将movieView放入presentedView中
             */
            self.showingView?.frame = (presentedView?.bounds)!
            self.showingView?.center = (presentedView?.center)!
            presentedView?.addSubview(self.showingView!)
            
            /*
             * presentedView在动画中变为finalFrame
             */
            let presentedViewFinalFrame = transitionContext.finalFrame(for: presentedViewController!)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: .layoutSubviews, animations: {
                presentedView?.transform = CGAffineTransform.identity
                presentedView?.frame = presentedViewFinalFrame
                self.showingView?.frame = (presentedView?.bounds)!
            }) { (ret) in
                transitionContext.completeTransition(true)
            }
        }else{
            let centerAfterPresented = transitionContext.containerView.center
            let presentedViewFinalBounds = CGRect(x: 0, y: 0, width: transitionContext.containerView.bounds.height, height: transitionContext.containerView.bounds.width)
            presentedView?.bounds = (self.showingView?.bounds)!
            presentedView?.center = CGPoint(x: smallMoviewFrame.midX, y: smallMoviewFrame.maxY)
            transitionContext.containerView.addSubview(presentedView!)
            presentedView?.transform = CGAffineTransform.identity
            
            /*
             * 将movieView放入presentedView中
             */
            self.showingView?.frame = (presentedView?.bounds)!
            self.showingView?.center = (presentedView?.center)!
            presentedView?.addSubview(self.showingView!)
            if transitionContext.isAnimated{
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: .layoutSubviews, animations: {
                    presentedView?.bounds = presentedViewFinalBounds
                    presentedView?.center = centerAfterPresented
                    presentedView?.transform = CGAffineTransform.init(rotationAngle: CGFloat(-M_PI_2))
                    self.showingView?.frame = (self.showingView?.bounds)!
                }) { (ret) in
                    transitionContext.completeTransition(true)
                }
            }
        }
       
    }
    
}
