000100190521**free
000200180410dcl-s balance_t packed(11:2) template;
000300180410dcl-s id_t char(10) template;
000400180410dcl-pr getBalance like(balance_t) extproc(*dclcase);
000500190326   id like(id_t) const;
000501200417   found ind options(*nopass);
000600180410end-pr;
