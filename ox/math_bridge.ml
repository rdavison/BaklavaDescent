let () =
  (* Register named callbacks so C can resolve these via caml_named_value(). *)
  Callback.register "cd_i2f" Ox_math.i2f;
  Callback.register "cd_f2i" Ox_math.f2i;
  Callback.register "cd_fixmul" Ox_math.fixmul;
  Callback.register "cd_fixdiv" Ox_math.fixdiv
