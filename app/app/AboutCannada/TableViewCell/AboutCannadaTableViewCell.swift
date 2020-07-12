import UIKit

class AboutCannadaTableViewCell: UITableViewCell {

    //MARK:- Variables
    var imgView = ImageLoader()
    var imgTitleLbl = UILabel()
    var imgDescriptionLbl = UILabel()
    var cellInfo:Rows?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.contentView.addSubview(self.imgView)
        self.contentView.addSubview(self.imgTitleLbl)
        self.contentView.addSubview(self.imgDescriptionLbl)
        
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        self.imgTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.imgDescriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor,constant: 32).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.imgView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.imgTitleLbl.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 12).isActive = true
        self.imgTitleLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 32).isActive = true
        self.imgTitleLbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor,constant: -36).isActive = true
        self.imgTitleLbl.bottomAnchor.constraint(equalTo: self.imgDescriptionLbl.topAnchor).isActive = true
        self.imgDescriptionLbl.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 12).isActive = true
        self.imgDescriptionLbl.topAnchor.constraint(equalTo: self.imgTitleLbl.bottomAnchor, constant: 24).isActive = true
        self.imgDescriptionLbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor,constant: -36).isActive = true
        self.imgDescriptionLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("initialization failed")
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//MARK:- Prepopulate cell information
extension AboutCannadaTableViewCell{
    func prePopulateCell(cellInfo:Rows){
        self.cellInfo = cellInfo
        self.setUI()
        self.setData()
    }
    func setUI(){
        self.imgTitleLbl.numberOfLines = 0
        self.imgTitleLbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.imgDescriptionLbl.numberOfLines = 0
        self.imgDescriptionLbl.font = UIFont.systemFont(ofSize: 14)
    }
    func setData(){
        self.imgTitleLbl.text = self.cellInfo?.title
        self.imgDescriptionLbl.text = self.cellInfo?.description
        self.imgView.image = UIImage(named: "PlaceHolderImage")
        self.loadImageFromUrl()
        self.contentView.layoutIfNeeded()
        self.contentView.layoutSubviews()
    }
    func loadImageFromUrl(){
        if let strUrl = self.cellInfo?.imageHref?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let imgUrl = URL(string: strUrl) {
              imgView.loadImageWithUrl(imgUrl)
        }
    }
}
