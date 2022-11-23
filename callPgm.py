itransport = iLibCall()
itool = iToolKit()

itool.add(
          iPgm('pgmcall','DSPUSR', {'lib': 'TEST'})
          .addParm(iData('var1','32a','uid0@email.com'))
          .addParm(iData('var2','32a',''))
          )
itool.call(itransport)

mypgm_results = itool.dict_out('pgmcall')
if 'success' in mypgm_results:
    print('Success!')
# parse the Json response from the dictionary
print('\n')
print("Parameter passed TO Rpg: ", mypgm_results['var1'])
print("Parameter passed FROM Rpg: ", mypgm_results['var2'])
print("Status of the program call: ", mypgm_results['success'])

transport = iLibCall()
itool = iToolKit()
itool.add(iCmd('chglibl', 'CHGLIBL LIBL(TEST ACMEAIR)'))
myxml  = "<pgm name='DSPUSR'  var='zzvary'>"
myxml += "<parm io='in'>"
myxml += "<data var='myName' type='32a' >'uid0@email.com'</data>"
myxml += "</parm>"
myxml += "<return>"
myxml += "<data var='myNameis' type='32a' varying='on'><![CDATA[<Mud>]]></data>"
myxml += "</return>"
myxml += "</pgm>"
itool.add(iXml(myxml))
itool.call(itransport)


chglibl = itool.dict_out('chglibl')
if 'success' in chglibl:
  print (chglibl['success'])
else:
  print (chglibl['error'])
  exit()

mypgm_results = itool.dict_out('zzvary')
if 'success' in mypgm_results:
    print('Success!')
# parse the Json response from the dictionary
mypgm_results = itool.dict_out('zzvary')
print('\n')
print("res:",  mypgm_results)
#print("Parameter passed TO Rpg: ", mypgm_results['myName'])

print("Parameter passed FROM Rpg: ", mypgm_results['myNameis'])
print("Status of the program call: ", mypgm_results['success'])
