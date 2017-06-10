//
//  ViewController.swift
//  PodTest
//
//  Created by 蔵内　亮 on 2017/06/10.
//  Copyright © 2017年 rkurauch. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    //var socket: SocketIOClient!
    //var user_id = "iOS"
    @IBOutlet weak var ContestStatusLabel: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Button1: UIButton!
    
    var bs:BattleSystem? = nil
    var bs2:BattleSystem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

        // ここから
        
        self.bs = BattleSystem(
            user_id : "Android",
            start_hook : {
                () -> (Void) in
                print("start Android")
                return
            },
            status_hook : {
                (status: String) -> (Void) in
                    print(self.bs?.user_id)
                    print(status)
                    return
            },
            result_hook : {
                (result: Bool) -> (Void) in
                print(self.bs?.user_id)
                print(result)
                return
            }
        );
        
        bs2 = BattleSystem(
            user_id : "iOS",
            start_hook : {
                () -> (Void) in
                print("start iOS")
                return
            },
            status_hook : {
                (status: String) -> (Void) in
                print(self.bs2?.user_id)
                print(status)
                return
            },
            result_hook : {
                (result: Bool) -> (Void) in
                print(self.bs2?.user_id)
                print(result)
                return
            }
        );
        
        /*
        socket = SocketIOClient(
            //socketURL: URL(string: "https://667e425c.ngrok.io")!
            socketURL: URL(string: "http://172.16.28.81")!
            //config: [.log(true), .forcePolling(true)]
            
        )
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        //socket = appDelegate.socket
        
        socket.on("start"){ data, ack in
            self.ContestStatusLabel.text = "Start!!"
            
            self.socket.on("status"){ data, ack in
                print("status")
                print(data[0])
                //self.Label1.text = data[0][user_id] as! String
            }
            
            self.socket.on("result"){ data, ack in
                self.socket.off("status")
                
                print("result")
                print(data[0])
                //self.Label1.text = data[0] as! String
            }
        }
        
        socket.connect()
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonDown(_ sender: Any) {
        self.bs?.join()
        self.bs2?.join()
        //socket.emit("join", String(user_id))
    }
    
    @IBAction func attack(_ sender: Any) {
        self.bs?.attack()
        //socket.emit("attack",String(user_id))
    }
    
    @IBAction func defence(_ sender: Any) {
        self.bs?.defence()
        //socket.emit("defence",String(user_id))
    }
    
}

