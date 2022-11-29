     H PGMINFO(*PCML:*DCLCASE:*MODULE)
          ctl-opt main(dspproc1);

          Dcl-f CUSTOMER disk(*ext) usage(*input) Keyed rename(CUSTOMER:rcust) ;
          Dcl-s ID VARCHAR(20) INZ('uid0@email.com');

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
         dcl-proc dspproc1;
         DCL-PI dspproc1 EXTPGM('DSPUSR2');
           input CHAR(20) const;
           userInfo likeds(userRecord);
         END-PI;

           //ID=input;
         if %parms() = 1;

             return;
         ENDIF;

         dsply ('input: ' + input);
         Chain input CUSTOMER;
         If %Found(CUSTOMER);
           dsply 'Record found!';
           dsply ID;
            userInfo.username=input;
            userInfo.status=STATUS;
            userInfo.total_miles=TOTAL00001;
            userInfo.miles_ytd=MILES_YTD;
            userInfo.phoneNumber=PHONE00001;
            userInfo.phoneNumberType=PHONE00002;
            userInfo.address.streetAddress1=STREE00001+' RPG!!!';
            userInfo.address.streetAddress2=STREE00002;
            userInfo.address.city=CITY;
            userInfo.address.stateProvince=STATE00001;
            userInfo.address.country=COUNTRY;
            userInfo.address.postalCode=POSTALCODE;


         else;
           return;
         ENDIF;
          close CUSTOMER;

          return;
         end-proc dspproc1; 