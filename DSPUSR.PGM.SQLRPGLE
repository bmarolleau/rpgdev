     H PGMINFO(*PCML:*DCLCASE:*MODULE)
          ctl-opt main(GetCustInf);

          dcl-ds userInfo0 extname('CUSTOMER') qualified ;
          end-ds;
          Dcl-Ds addressDS qualified template ;
               streetAddress1 CHAR(20);
               streetAddress2 CHAR(20); 
               city CHAR(20);
               stateProvince CHAR(20);
               country CHAR(20);
               postalCode CHAR(10); 
          END-DS;  
          
          Dcl-Ds userRecord qualified;
           username CHAR(20);
           status CHAR(20)  ;
           total_miles INT(10);
           miles_ytd  INT(10); 
           phoneNumber CHAR(15);
           phoneNumberType CHAR(10);
           address likeds(addressDS);
          END-DS;

         dcl-proc GetCustInf;
            DCL-PI *n EXTPGM('DSPUSR');
              input CHAR(20) const;
              userInfo likeds(userRecord);
            END-PI;
           //ID=input;
            if %parms() = 1;
            return;
            endif;
            dsply ('input: ' + input);
        
            Exec SQL SELECT *    
            INTO :userInfo0
            FROM   CUSTOMER
            WHERE ID = :input;
            
            userInfo.username=userInfo0.id;
            userInfo.status=userInfo0.STATUS;
            userInfo.total_miles=userInfo0.TOTAL00001;
            userInfo.miles_ytd=userInfo0.MILES_YTD;
            userInfo.phoneNumber=userInfo0.PHONE00001;
            userInfo.phoneNumberType=userInfo0.PHONE00002;
            userInfo.address.streetAddress1=userInfo0.STREE00001+'V1.O!!!';
            userInfo.address.streetAddress2=userInfo0.STREE00002;
            userInfo.address.city=userInfo0.CITY;
            userInfo.address.stateProvince=userInfo0.STATE00001;
            userInfo.address.country=userInfo0.COUNTRY;
            userInfo.address.postalCode=userInfo0.POSTALCODE;

            dsply ('found: ' + userInfo.username);
            return;
         end-proc GetCustInf; 