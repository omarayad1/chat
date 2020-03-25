package de.affinitas.chat.service;

public class ChatConfig {

    private String mqttRootTopic;
    private String mqttBrokerUrl;
    private String mqttUser;
    private String mqttPassword;

    public ChatConfig() {
        mqttRootTopic = System.getenv("MQTT_ROOT_TOPIC") == null ? "affinitas_chat/one_to_one" : System.getenv("MQTT_ROOT_TOPIC");
        mqttBrokerUrl = System.getenv("MQTT_BROKER_URL") == null ? "tcp://localhost:61613" : System.getenv("MQTT_BROKER_URL");
        mqttUser = System.getenv("MQTT_USER") == null ? "admin" : System.getenv("MQTT_USER");
        mqttPassword = System.getenv("MQTT_PASSWORD") == null ? "password" : System.getenv("MQTT_PASSWORD");
    }

    public String getMqttRootTopic() {
        return mqttRootTopic;
    }

    public String getMqttBrokerUrl() {
        return mqttBrokerUrl;
    }

    public String getMqttUser() {
        return mqttUser;
    }

    public String getMqttPassword() {
        return mqttPassword;
    }
}
