//
//  MQTTManager.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 11/03/2024.
//
/*
import Foundation
import SwiftMQTT

class MQTTManager {
    static let shared = MQTTManager()
    
    private var mqttClient: MQTTClient?
    
    private init() {}
    
    func configureMQTT() {
        let clientID = "YourClientID"
        let host = "your-mqtt-server.com"
        let port: UInt16 = 1883
        let mqttConfig = MQTTConfig(clientId: clientID, host: host, port: port, keepAlive: 60)
        mqttConfig.onMessageCallback = { mqttMessage in
            // Traitement des messages MQTT reçus
            if let message = mqttMessage.payloadString {
                print("Received message: \(message)")
            }
        }
        
        mqttClient = MQTTClient(clientID: clientID)
        mqttClient?.connect(mqttConfig)
    }
    
    func subscribe(to topic: String) {
        mqttClient?.subscribe(topic, qos: .qos1)
    }
    
    func publishMessage(to topic: String, message: String) {
        guard let mqttClient = mqttClient else {
            print("MQTT client not initialized")
            return
        }
        
        let mqttMessage = MQTTMessage(topic: topic, payload: message, qos: .qos1, retain: false)
        mqttClient.publish(mqttMessage)
    }
}*/

