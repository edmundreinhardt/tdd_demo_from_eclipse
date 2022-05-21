000001200417**free
000002200417ctl-opt option(*srcstmt);
000003200417ctl-opt nomain;
000004210524ctl-opt bnddir('UNITTEST');
000005200417/copy rpgunit/rpgunit1,testcase
000006210524/copy source,getbal_h
000007200417
000008200417dcl-proc Test_returnZeroForIdNotFound export;
000009200417  dcl-pi *n extproc(*dclcase) end-pi;
000010200417  dcl-s balance packed(11:2);
000011200417  balance = getBalance ('abc');
000012200417  assert (balance = 0 : 'Balance not 0 for id not found');
000013200417end-proc;
000014200417
000015200417dcl-proc Test_returnBalanceForValidId export;
000016200417  dcl-pi *n extproc(*dclcase) end-pi;
000017200417  dcl-s balance packed(11:2);
000018200417  add_record ('123' : 123);
000019200417  balance = getBalance ('123');
000020200417  assert (123 = balance : 'Balance <> 123');
000021200417end-proc;
000022200417
000023200417dcl-proc Test_setFoundParmIfIdNotFound export;
000024200417  dcl-pi *n extproc(*dclcase) end-pi;
000025200417  dcl-s balance packed(11:2);
000026200417  dcl-s found ind inz(*on);
000027200417  balance = getBalance ('123' : found);
000028200417  assert (balance = 0 : 'Balance should be 0');
000029200417  assert (found = *off : 'Found should be *off');
000030200417end-proc;
000031200417
000032200417dcl-proc create_empty_file;
000033210525  runCmd ('CRTPF QTEMP/BALANCEF SRCFILE(SOURCE) '
000034200417           + 'SRCMBR(BALANCEF)');
000035200417  runCmd ('OVRDBF BALANCEF QTEMP/BALANCEF');
000036200417end-proc;
000037200417
000038200417dcl-proc add_record;
000039200417  dcl-pi *n;
000040200417    id like(id_t) const;
000041200417    balance like(balance_t) const;
000042200417  end-pi;
000043210525  dcl-f balancef usage(*output) extdesc('BALANCEF_D') extfile('BALANCEF');
000044200417  dcl-ds ds likerec(balancer);
000045200417  ds.id = id;
000046200417  ds.balance = balance;
000047200417  write balancer ds;
000048200417end-proc;
000049200417
000050200417dcl-proc setup export;
000051200417  callp(e) runCmd ('DLTF QTEMP/BALANCEF');
000052200417  create_empty_file ();
000053200417end-proc;
000054200417
000055200417dcl-proc teardown export;
000056210525  callp(e) runCmd ('DLTF QTEMP/BALANCEF');
000057200417end-proc;
000058200417
