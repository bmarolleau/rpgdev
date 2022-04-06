package com.ibm.sample;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.websphere.security.WebTrustAssociationException;
import com.ibm.websphere.security.WebTrustAssociationFailedException;
import com.ibm.wsspi.security.tai.TAIResult;
import com.ibm.wsspi.security.tai.TrustAssociationInterceptor;

public class SimpleTAI implements TrustAssociationInterceptor 
{
   public SimpleTAI()
   {
      super();
   }

   public boolean isTargetInterceptor(HttpServletRequest req)
                  throws WebTrustAssociationException 
   {
      //Add logic to determine whether to intercept this request
      return true;
   }

   public TAIResult negotiateValidateandEstablishTrust(HttpServletRequest req,
                    HttpServletResponse resp) throws WebTrustAssociationFailedException 
   {
        // Add logic to authenticate a request and return a TAI result.
        String tai_user = "taiUser";
        System.out.println("authenticated");
        return TAIResult.create(HttpServletResponse.SC_OK, tai_user);
   }

   public int initialize(Properties arg0) throws WebTrustAssociationFailedException 
   {
        return 0;
   }

   public String getVersion() 
   {
        return "1.0";
   }

   public String getType() 
   {
        return this.getClass().getName();
   }

   public void cleanup() { }
}

