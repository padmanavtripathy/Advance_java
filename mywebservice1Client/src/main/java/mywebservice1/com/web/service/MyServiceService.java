/**
 * MyServiceService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package mywebservice1.com.web.service;

public interface MyServiceService extends javax.xml.rpc.Service {
    public java.lang.String getMyServiceAddress();

    public mywebservice1.com.web.service.MyService getMyService() throws javax.xml.rpc.ServiceException;

    public mywebservice1.com.web.service.MyService getMyService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
