//
//  ViewController.swift
//  ios13MQTTClient
//
//  Created by Hanjun Ko on 03/10/2019.
//  Copyright © 2019 Hanjun Ko. All rights reserved.
//

import UIKit
import MQTTClient

class ViewController: UIViewController {

    let MQTT_HOST = ""
    let MQTT_PORT = 1883
    
    @IBOutlet weak var ConnectBT: UIButton!
    @IBOutlet weak var DisconnectBT: UIButton!
    @IBOutlet weak var SmaplingBT: UIButton!
    @IBOutlet weak var StatLabel: UILabel!
    @IBOutlet weak var PanidTextfild: UITextField!
    
    var transport = MQTTCFSocketTransport()
    var session = MQTTSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    private func publishMessage(_ message: String, onTopic topic: String) {
        session?.publishData(message.data(using: .utf8, allowLossyConversion: false), onTopic: topic, retain: false, qos: .exactlyOnce)
    }

    @IBAction func ConnectBTPush(_ sender: UIButton) {
        print("ConnectBTPush")
        self.session?.delegate = self as? MQTTSessionDelegate
        self.transport.host = MQTT_HOST
        self.transport.port = UInt32(MQTT_PORT)
        session?.transport = transport
        
        session?.connect()
    }
    
    @IBAction func DisconnectBTPush(_ sender: UIButton) {
        print("DisconnectBTPush")
        session?.disconnect()
    }
    
    @IBAction func SamplingBTPush(_ sender: UIButton) {
        print(PanidTextfild.text)
//        publishMessage("{\"nId\":\"0X7777\",\"nT\":\"SHM\",\"status\":{\"OP\":\"Sample\"},\"timestamp\":1550083387888}", onTopic: "Entity/SHM/Node/0X7777/OTA")
    }
}

