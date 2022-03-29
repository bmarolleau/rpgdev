000100220329     H PGMINFO(*PCML:*DCLCASE:*MODULE)
000101220329          ctl-opt Nomain;
000102220329
000103220329          Dcl-f CUSTOMER disk(*ext) usage(*input) Keyed rename(CUSTOMER:rcust) ;
000104220329          Dcl-s ID VARCHAR(20) INZ('uid0@email.com');
000105220329
000106220329          Dcl-Ds addressDS qualified template export;
000107220329               streetAddress1 CHAR(20);
000108220329               streetAddress2 CHAR(20);
000109220329               city CHAR(20);
000110220329               stateProvince CHAR(20);
000111220329               country CHAR(20);
000112220329               postalCode CHAR(10);
000113220329          END-DS;
000114220329          Dcl-Ds userRecord qualified export;
000115220329           username CHAR(20);
000116220329           status CHAR(20)  ;
000117220329           total_miles INT(10);
000118220329           miles_ytd  INT(10);
000119220329           phoneNumber CHAR(15);
000120220329           phoneNumberType CHAR(10);
000121220329           address likeds(addressDS);
000122220329          END-DS;
000123220329         dcl-proc dspproc1 Export;
000124220329         DCL-PI *N;
000125220329           input CHAR(20) const;
000126220329           userInfo likeds(userRecord);
000127220329         END-PI;
000128220329           //ID=input;
000129220329         if %parms() = 1;
000130220329             return;
000131220329         ENDIF;
000132220329         dsply ('input: ' + input);
000133220329         Chain input CUSTOMER;
000134220329         If %Found(CUSTOMER);
000135220329           dsply 'Record found!';
000136220329           dsply ID;
000137220329       userInfo.username=input;
000138220329       userInfo.status=STATUS;
000139220329       userInfo.total_miles=TOTAL00001;
000140220329       userInfo.miles_ytd=MILES_YTD;
000141220329       userInfo.phoneNumber=PHONE00001;
000142220329       userInfo.phoneNumberType=PHONE00002;
000143220329       userInfo.address.streetAddress1=STREE00001+' RPG!!!';
000144220329       userInfo.address.streetAddress2=STREE00002;
000145220329       userInfo.address.city=CITY;
000146220329       userInfo.address.stateProvince=STATE00001;
000147220329       userInfo.address.country=COUNTRY;
000148220329       userInfo.address.postalCode=POSTALCODE;
000149220329
000150220329
000151220329         else;
000152220329           return;
000153220329         ENDIF;
000154220329
000155220329
000156220329          return;
000157220329         end-proc dspproc1;
