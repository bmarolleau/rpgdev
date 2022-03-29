000100220328     H PGMINFO(*PCML:*DCLCASE:*MODULE)
000101220328          ctl-opt main(dspproc1);
000102220328
000103220328          Dcl-f CUSTOMER disk(*ext) usage(*input) Keyed rename(CUSTOMER:rcust) ;
000104220328          Dcl-s ID VARCHAR(20) INZ('uid0@email.com');
000105220328
000106220328          Dcl-Ds addressDS qualified template ;
000107220328               streetAddress1 CHAR(20);
000108220328               streetAddress2 CHAR(20);
000109220328               city CHAR(20);
000110220328               stateProvince CHAR(20);
000111220328               country CHAR(20);
000112220328               postalCode CHAR(10);
000113220328          END-DS;
000114220328          Dcl-Ds userRecord qualified;
000115220328           username CHAR(20);
000116220328           status CHAR(20)  ;
000117220328           total_miles INT(10);
000118220328           miles_ytd  INT(10);
000119220328           phoneNumber CHAR(15);
000120220328           phoneNumberType CHAR(10);
000121220328           address likeds(addressDS);
000122220328          END-DS;
000123220328         dcl-proc dspproc1;
000124220328         DCL-PI dspproc1 EXTPGM('DSPUSRINFO');
000125220328           input CHAR(20) const;
000126220328           userInfo likeds(userRecord);
000127220328         END-PI;
000129220329           //ID=input;
000130220328         if %parms() = 1;
000132220328             return;
000133220328         ENDIF;
000135220328         dsply ('input: ' + input);
000136220328         Chain input CUSTOMER;
000137220328         If %Found(CUSTOMER);
000138220328           dsply 'Record found!';
000139220328           dsply ID;
000140220328       userInfo.username=input;
000141220328       userInfo.status=STATUS;
000142220328       userInfo.total_miles=TOTAL00001;
000143220328       userInfo.miles_ytd=MILES_YTD;
000144220328       userInfo.phoneNumber=PHONE00001;
000145220328       userInfo.phoneNumberType=PHONE00002;
000146220328       userInfo.address.streetAddress1=STREE00001+' RPG!!!';
000147220328       userInfo.address.streetAddress2=STREE00002;
000148220328       userInfo.address.city=CITY;
000149220328       userInfo.address.stateProvince=STATE00001;
000150220328       userInfo.address.country=COUNTRY;
000151220328       userInfo.address.postalCode=POSTALCODE;
000152220328
000153220328
000154220328         else;
000155220328           return;
000156220328         ENDIF;
000157220328
000158220328
000159220328          return;
000160220328         end-proc dspproc1;
