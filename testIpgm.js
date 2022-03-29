var xt = require("itoolkit");

var conn = new xt.iConn("*LOCAL");

var sysVal = "QCCSID";

var outBuf = [

       [0, "10i0"],

       [0, "10i0"],

       ["", "10A"],

       ["", "1A"],

       ["", "1A"],

       [0, "10i0"],

       [0, "10i0"]

];

var errno = [

       [0, "10i0"],

       [0, "10i0", {"setlen":"rec2"}],

       ["", "7A"],

       ["", "1A"]

];

//var pgm = new xt.iPgm("QWCRSVAL", {"lib":"QSYS"});
var pgm= new xt.iPgm("DSPUSRINFO", {"lib":"QGPL"});
pgm.addParam(outBuf, {"io":"out", "len":"rec1"});

pgm.addParam(0, "email0@gmail.com", {"setlen":"rec1"});

pgm.addParam(1, "");


pgm.addParam(errno, {"io":"both", "len" : "rec2"});

console.log(pgm.toXML());

 

function cb (str) {

       console.log(str);  // Print the raw XML output

}

conn.add(pgm);

conn.run(cb);
