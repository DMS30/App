import UIKit

class AboutCannadaListViewController: UIViewController {

    //MARK:- Variables
    var tableView = UITableView()
    var apiResponse:JsonResponseStruct?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        self.initialization()
    }
}
//MARK:- Initialization
extension AboutCannadaListViewController{
    func initialization(){
        self.setUI()
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.configureTableView()
        self.setData()
    }
    func setUI(){
//        self.tableView.separatorStyle = .none
    }
    func setData(){
        self.getInfoData()
    }
    func configureTableView(){
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.tableView.register(AboutCannadaTableViewCell.self, forCellReuseIdentifier: "AboutCannadaTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
//MARK:- TableViewDataSource
extension AboutCannadaListViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.apiResponse?.rows?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let aboutCannadaTVC = tableView.dequeueReusableCell(withIdentifier: "AboutCannadaTableViewCell") as? AboutCannadaTableViewCell else {return UITableViewCell()}
        guard let cellInfo = self.apiResponse?.rows?[indexPath.section] else {return UITableViewCell()}
        aboutCannadaTVC.prePopulateCell(cellInfo: cellInfo)
        return aboutCannadaTVC
    }
}
//MARK:- TableViewDelegate
extension AboutCannadaListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //write cell selection here action
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK:- APICall
extension AboutCannadaListViewController{
    func getInfoData(){
        let serverConnection = ServerConnectionClass()
        let request = serverConnection.createRequest()
        serverConnection.getResponse(request) { (dictData, err) in
            do{
                let jsonDecoder = JSONDecoder()
                self.apiResponse = try jsonDecoder.decode(JsonResponseStruct.self, from: dictData)
            }catch{
                
            }
            DispatchQueue.main.async {
                self.title = self.apiResponse?.title
                self.tableView.reloadData()
            }
        }
    }
}
