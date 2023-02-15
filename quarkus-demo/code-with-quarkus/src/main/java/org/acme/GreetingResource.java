package org.acme;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@Path("/")
public class GreetingResource {

    @ConfigProperty(name = "HOSTNAME") 
    String hostname;

    @ConfigProperty(name = "ENVIRONMENT") 
    String environment;

    @ConfigProperty(name = "CLUSTER") 
    String cluster;

    @ConfigProperty(name = "PLATFORM") 
    String platform;

    @ConfigProperty(name = "OCP_VERSION") 
    String ocpVersion;

    @ConfigProperty(name = "VERSION") 
    String version;

    @ConfigProperty(name = "TYPE") 
    String type;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World! " + getEnv();
    }

    private String getEnv() {

        StringBuilder sb = new StringBuilder("v");
        sb.append(version)
        .append(" on ")
        .append(String.format("%9s", platform))
        .append(" OCP v")
        .append(String.format("%-7s", ocpVersion))
        .append(" ")
        .append(String.format("%28s", hostname))
        .append(" in ")
        .append(String.format("%11s", environment))
        .append(".")
        .append(cluster)
        .append(".")
        .append(type)
        .append("\n")
        ;

        return sb.toString();
    }
}