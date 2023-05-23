//
//  ViewController.swift
//  UIkit_Alamofire
//
//  Created by 정성윤 on 2023/05/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let parameters: Parameters = [
                    "source": "ko",
                    "target": "en",
                    "text": "안녕하세요 저는 정성윤이라고 합니다. 지금 네이버 개발자 홈페이지의 도움에 따라 공공데이터 통신에 대해 공부하고 있는데 성공적으로 출력돼서 기분이 좋습니다."
                ]
        let headers: HTTPHeaders = [
                    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "X-Naver-Client-Id": "HRZepirST6F3gpwzVSAQ",
                    "X-Naver-Client-Secret": "RwfqeBvT48"
                ]
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let papagoDTO = json["message"] as? [String: Any],
                   let result = papagoDTO["result"] as? [String: Any],
                   let translatedText = result["translatedText"] as? String {
                    print(translatedText)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

