import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Subviews

    private let profileHeaderView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        return headerView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layoutHeaderView()
    }

    // MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .lightGray
        title = "Profile"
    }

    private func addSubviews() {
        view.addSubview(profileHeaderView)
    }

    private func layoutHeaderView() {
        profileHeaderView.frame = view.bounds
    }
}
