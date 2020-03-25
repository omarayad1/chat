package de.affinitas.chat.service;

public class SSEConfig implements ServerSentEventConfig {

    private final String servletPathStream;
    private final String valuesTemplateGetStream;
    private final int port;

    private final String mqttBrokerUrl;
    private final String mqttUser;
    private final String mqttPassword;
    private final String mqttRootTopic;

    public SSEConfig() {
        port = System.getenv("PORT") == null ? 8081 : System.getenv("PORT");
        servletPathStream = System.getenv("PATH_STREAM") == null ? "/chat/receive/*" : System.getenv("PATH_STREAM");
        valuesTemplateGetStream = System.getenv("GET_STREAM") == null ? "/chat/receive/{channel_id}" : System.getenv("GET_STREAM");
        mqttBrokerUrl = System.getenv("MQTT_BROKER_URL") == null ? "tcp://localhost:61613" : System.getenv("MQTT_BROKER_URL");
        mqttUser = System.getenv("MQTT_USER") == null ? "admin" : System.getenv("MQTT_USER");
        mqttPassword = System.getenv("MQTT_PASSWORD") == null ? "password" : System.getenv("MQTT_PASSWORD");
        mqttRootTopic = System.getenv("MQTT_ROOT_TOPIC") == null ? "affinitas_chat/one_to_one" : System.getenv("MQTT_ROOT_TOPIC");
    }

    @Override public int getPort() { return port; }
    @Override public String getValuesTemplateStream() { return valuesTemplateGetStream; }
    @Override public String getServletPathStream() { return servletPathStream; }
    @Override public String getMqttBrokerUrl() {
        return mqttBrokerUrl;
    }
    @Override public String getMqttUser() {
        return mqttUser;
    }
    @Override public String getMqttPassword() {
        return mqttPassword;
    }

    @Override
    public String getMqttRootTopic() {
        return mqttRootTopic;
    }

}
