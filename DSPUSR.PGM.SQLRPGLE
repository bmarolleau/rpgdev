     H PGMINFO(*PCML:*DCLCASE:*MODULE)
          ctl-opt main(GetCustInf);

          dcl-ds userRecord extname('CUSTOMER') qualified ;
          end-ds;
         
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
            INTO :userInfo 
            FROM   CUSTOMER
            WHERE ID = :input;
            userInfo.CITY+=' RPG!!';
            dsply ('found: ' + userInfo.ID);
            return;
         end-proc GetCustInf; 