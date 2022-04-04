const {
  Connection, SqlCall, xmlToJson,
} = require('itoolkit');

const conn = new Connection({
  transport: 'idb',
  transportOptions: { host: '10.7.19.71', username: 'benoit', password: 'abc123' }
});

const sql = new SqlCall();

sql.prepare('select * from CUSTOMER'); //call qsys2.tcpip_info()');
sql.execute();
sql.fetch();
sql.free();
console.log("Testing SQL");
conn.add(sql);

conn.run((error, xmlOutput) => {
  if (error) {
    throw error;
  }
  const result = xmlToJson(xmlOutput);
  console.log(JSON.stringify(result));
  console.log("eeeeer");
});
