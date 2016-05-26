module B = Cordova_barcode_scanner

let on_device_ready _ =
  let barcode = B.t () in
  barcode#scan
    (
      fun res ->  Dom_html.window##(alert (Js.string (res#text ^ "\n" ^
                  res#format)))
    )
    ()

  (* Crash on a Nexus 5, android 6.0.1 *)
  (*
  barcode##(encode_err
    (B.encode_format_to_str B.encode_text)
    (Js.string "https://danny-willems.be")
    (fun str -> Dom_html.window##(alert str))
    (fun err -> Dom_html.window##(alert err))
  );
  *)

let _ =
  Cordova.Event.device_ready on_device_ready
