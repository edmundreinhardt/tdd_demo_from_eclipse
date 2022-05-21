000002200417**free
000003200417ctl-opt nomain;
000004200417
000005210524/copy source,getbal_h
000006200417
000007200417dcl-proc getBalance export;
000008200417   dcl-pi *n like(balance_t);
000009200417      id like(id_t) const;
000010200417      found ind options(*nopass);
000011200417   end-pi;
000012210524   dcl-f balancef keyed extdesc('BALANCEF_D') extfile('BALANCEF');
000013200417   dcl-ds ds likerec(balancer) inz;
000014200417   chain id balancer ds;
000015200417   if %found;
000016200417      if %parms >= %parmnum(found);
000017200417         found = *off;
000018200417      endif;
000019200417      return ds.balance;
000020200417   else;
000021200417      if %parms >= %parmnum(found);
000022200417         found = *off;
000023200417      endif;
000024200417      return 0;
000025200417   endif;
000026200417end-proc;
