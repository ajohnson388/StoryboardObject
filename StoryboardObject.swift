
import UIKit

/**
    A marker protocol that provides covenient factory functions, via extensions, for
    objects defined in storyboards or nib files.
 */
protocol StoryboardObject {}


// MARK: UIView

extension StoryboardObject where Self: UIView {
    /**
        Initializes a view from a nib.
     
        - parameters:
            - name:
                The name of the nib file. If unspecified, it is assumed the file 
                that contains the class and the file that contains the nib have the same name.
     
        - returns:
            The instantiate view, or nil, if an error occurs.
    */
    static func make(fromNibWithFileName name: String = String(describing: Self())) -> Self? {
        let arr = Bundle.main.loadNibNamed(name, owner: nil, options: [:])
        return arr?.first as? Self
    }
}


// MARK: UIViewController

extension StoryboardObject where Self: UIViewController {
    /**
        Initializes a view controller from a storyboard.
        
        - parameters:
            -name:
                The name of the storyboard file. If unspecified, it is assumed the file
                that contains the class and the file that contains the storyboard have the same name.
            - controllerId:
                The storyboard id of the controller
     */
    static func make(fromStoryBoardNamed name: String = String(describing: Self()), controllerId: String = String(describing: Self())) -> Self? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: controllerId) as? Self
    }
}
