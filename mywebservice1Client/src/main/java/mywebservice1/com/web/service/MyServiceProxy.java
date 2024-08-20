package mywebservice1.com.web.service;

public class MyServiceProxy implements mywebservice1.com.web.service.MyService {
  private String _endpoint = null;
  private mywebservice1.com.web.service.MyService myService = null;
  
  public MyServiceProxy() {
    _initMyServiceProxy();
  }
  
  public MyServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initMyServiceProxy();
  }
  
  private void _initMyServiceProxy() {
    try {
      myService = (new mywebservice1.com.web.service.MyServiceServiceLocator()).getMyService();
      if (myService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)myService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)myService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (myService != null)
      ((javax.xml.rpc.Stub)myService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public mywebservice1.com.web.service.MyService getMyService() {
    if (myService == null)
      _initMyServiceProxy();
    return myService;
  }
  
  public float addValue(float value) throws java.rmi.RemoteException{
    if (myService == null)
      _initMyServiceProxy();
    return myService.addValue(value);
  }
  
  public float subtractValue(float value) throws java.rmi.RemoteException{
    if (myService == null)
      _initMyServiceProxy();
    return myService.subtractValue(value);
  }
  
  
}