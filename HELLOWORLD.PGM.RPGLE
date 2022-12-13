**FREE
        //H PGMINFO(*PCML:*DCLCASE:*MODULE)

    Dcl-S Text varchar(20);
    dcl-s CHAR Char(10);
    dcl-ds info qualified;
           name char(10) inz('Sam');
           salary packed(9 : 2) inz(50000.25);
    end-ds;
    dcl-ds otherInfo likeds(info) inz(*likeds);
    dcl-s dates date(*iso) dim(3);

        dcl-ds families qualified dim(5);
          address varchar(40);
          numPeople uns(3);
          dcl-ds people dim(8);
             name varchar(25);
             age packed(5);
          end-ds;
       end-ds;
       dcl-s numFamilies uns(5) inz(0);
       dcl-s i int(10);
       dcl-s j int(10);

    CHAR=' in RPG!';
    Text = 'Hello world'+CHAR;
    DSPLY Text;


    dsply (info.name
            + ' has a salary of'
            + %char(info.salary));
       otherInfo.name = 'Joe';
       otherInfo.salary += 10000;
    dsply (otherInfo.name
            + ' has a salary of'
            + %char(otherInfo.salary));
    

       dates(1) = %date();             // the current date
       dates(2) = %date() + %days(1);  // tomorrow
       dates(3) = %date() + %years(1); // next year
       dsply (%char(dates(1)) + ' '
            + %char(dates(2)) + ' '
            + %char(dates(3)));
    
 

       families(1).address = '10 Mockingbird Lane';
       families(1).people(1).name = 'Alice';
       families(1).people(1).age = 3;
       families(1).people(2).name = 'Bill';
       families(1).people(2).age = 15;
       families(1).numPeople = 2;
       

       families(2).address = '30 CEDAR St';
       families(2).people(1).name = 'JESPER';
       families(2).people(1).age = 13;
       families(2).people(2).name = 'RAY';
       families(2).people(2).age = 25;
        families(2).people(3).name = 'BOBBY';
       families(2).people(3).age = 35;
       families(2).numPeople = 3;
       numFamilies = 2;

       for i = 1 to numFamilies;
          dsply ('Family Number: '   + %char(i));
          dsply ('Family Addr:'+ families(i).address );
          for j = 1 to families(i).numPeople;
          dsply (families(i).people(j).name
               + ' is '
               + %char(families(i).people(j).age)
               + ' years old.');
          endfor;
       endfor;
       return;
    
    *InLR = *On;
    Return;     