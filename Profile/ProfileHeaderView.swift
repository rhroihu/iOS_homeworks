import UIKit

final class ProfileHeaderView: UIView {
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let statusTextField = UITextField()
    private let showStatusButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemGroupedBackground
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        avatarImageView.image = UIImage(named: "ProfileCat") ?? UIImage(systemName: "person.crop.circle.fill")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor

        nameLabel.text = "Illuminate Cat"
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .black

        statusLabel.text = "Status here..."
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textColor = .secondaryLabel

        statusTextField.placeholder = "Set your status..."
        statusTextField.borderStyle = .roundedRect
        statusTextField.backgroundColor = .white
        statusTextField.returnKeyType = .done

        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.titleLabel?.font = .systemFont(ofSize: 18)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.cornerRadius = 12
        showStatusButton.layer.shadowOffset = CGSize(width: 3, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.25
        showStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)

        [avatarImageView, nameLabel, statusLabel, statusTextField, showStatusButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 136),
            avatarImageView.heightAnchor.constraint(equalToConstant: 136),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),

            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 48),

            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 42),

            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 24),
            showStatusButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    @objc private func setStatus() {
        let status = statusTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !status.isEmpty else { return }
        statusLabel.text = status
        statusTextField.text = nil
        endEditing(true)
    }
}
