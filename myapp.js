const {
  Connection, ProgramCall, xmlToJson,
} = require('itoolkit');

conn = new Connection({
  transport: 'ssh',
  transportOptions: { host: '10.7.19.71', username: 'qsecofr', password: 'lemamero' }
});
conn.debug(true);

const program = new ProgramCall('QWCRSVAL', { lib: 'QSYS' });
const outBuf = [
  [0, '10i0'],
  [0, '10i0'],
  ['', '36h'],
  ['', '10A'],
  ['', '1A'],
  ['', '1A'],
  [0, '10i0'],
  [0, '10i0'],
];
const errno = [
  [0, '10i0'],
  [0, '10i0', { setlen: 'rec2' }],
  ['', '7A'],
  ['', '1A'],
];

program.addParam(outBuf, { io: 'out' });
program.addParam(66, '10i0');
program.addParam(1, '10i0');
program.addParam('QCCSID', '10A');
program.addParam(errno, { io: 'both', len: 'rec2' });

conn.add(program);


conn.run((error, xmlOutput) => {
  if (error) {
    console.log("error");
    throw error;
  }
  const result = xmlToJson(xmlOutput);
  console.log(JSON.stringify(result));
});
