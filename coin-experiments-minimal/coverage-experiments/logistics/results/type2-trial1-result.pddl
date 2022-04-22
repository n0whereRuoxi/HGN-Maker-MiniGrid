( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?A - OBJ ?B - LOCATION )
    ( TRUCK-AT ?C - TRUCK ?D - LOCATION )
    ( AIRPLANE-AT ?E - AIRPLANE ?F - LOCATION )
    ( IN-TRUCK ?G - OBJ ?H - TRUCK )
    ( IN-AIRPLANE ?I - OBJ ?J - AIRPLANE )
    ( IN-CITY ?K - LOCATION ?L - CITY )
    ( DIFFERENT ?M - LOCATION ?N - LOCATION )
    ( AIRPORT ?O - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( OBJ-AT ?OBJ ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-TRUCK ?OBJ ?TRUCK ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?LOC ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-AIRPLANE ?OBJ ?AIRPLANE ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( IN-TRUCK ?OBJ ?TRUCK ) )
    :effect
    ( and ( not ( IN-TRUCK ?OBJ ?TRUCK ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?TRUCK - TRUCK
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
      ?CITY - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC-FROM ) ( IN-CITY ?LOC-FROM ?CITY ) ( IN-CITY ?LOC-TO ?CITY ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?TRUCK ?LOC-FROM ) ) ( TRUCK-AT ?TRUCK ?LOC-TO ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?AIRPLANE - AIRPLANE
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?LOC-FROM ) ( AIRPORT ?LOC-TO ) ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ) ( AIRPLANE-AT ?AIRPLANE ?LOC-TO ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG-VERIFY
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2 - OBJ
      ?AUTO_3 - LOCATION
    )
    :vars
    (
      ?AUTO_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4 ?AUTO_3 ) ( IN-TRUCK ?AUTO_2 ?AUTO_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2 ?AUTO_4 ?AUTO_3 )
      ( DELIVER-PKG-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5 - OBJ
      ?AUTO_6 - LOCATION
    )
    :vars
    (
      ?AUTO_7 - TRUCK
      ?AUTO_9 - LOCATION
      ?AUTO_8 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5 ?AUTO_7 ) ( TRUCK-AT ?AUTO_7 ?AUTO_9 ) ( IN-CITY ?AUTO_9 ?AUTO_8 ) ( IN-CITY ?AUTO_6 ?AUTO_8 ) ( not ( = ?AUTO_6 ?AUTO_9 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7 ?AUTO_9 ?AUTO_6 ?AUTO_8 )
      ( DELIVER-PKG ?AUTO_5 ?AUTO_6 )
      ( DELIVER-PKG-VERIFY ?AUTO_5 ?AUTO_6 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10 - OBJ
      ?AUTO_11 - LOCATION
    )
    :vars
    (
      ?AUTO_13 - TRUCK
      ?AUTO_14 - LOCATION
      ?AUTO_12 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13 ?AUTO_14 ) ( IN-CITY ?AUTO_14 ?AUTO_12 ) ( IN-CITY ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) ( OBJ-AT ?AUTO_10 ?AUTO_14 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10 ?AUTO_13 ?AUTO_14 )
      ( DELIVER-PKG ?AUTO_10 ?AUTO_11 )
      ( DELIVER-PKG-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_17 - OBJ
      ?AUTO_18 - LOCATION
    )
    :vars
    (
      ?AUTO_19 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_17 ?AUTO_19 ) ( AIRPLANE-AT ?AUTO_19 ?AUTO_18 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_17 ?AUTO_19 ?AUTO_18 )
      ( DELIVER-PKG-VERIFY ?AUTO_17 ?AUTO_18 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_20 - OBJ
      ?AUTO_21 - LOCATION
    )
    :vars
    (
      ?AUTO_22 - AIRPLANE
      ?AUTO_23 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_20 ?AUTO_22 ) ( AIRPORT ?AUTO_23 ) ( AIRPORT ?AUTO_21 ) ( AIRPLANE-AT ?AUTO_22 ?AUTO_23 ) ( not ( = ?AUTO_23 ?AUTO_21 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_22 ?AUTO_23 ?AUTO_21 )
      ( DELIVER-PKG ?AUTO_20 ?AUTO_21 )
      ( DELIVER-PKG-VERIFY ?AUTO_20 ?AUTO_21 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_24 - OBJ
      ?AUTO_25 - LOCATION
    )
    :vars
    (
      ?AUTO_27 - LOCATION
      ?AUTO_26 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_27 ) ( AIRPORT ?AUTO_25 ) ( AIRPLANE-AT ?AUTO_26 ?AUTO_27 ) ( not ( = ?AUTO_27 ?AUTO_25 ) ) ( OBJ-AT ?AUTO_24 ?AUTO_27 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_24 ?AUTO_26 ?AUTO_27 )
      ( DELIVER-PKG ?AUTO_24 ?AUTO_25 )
      ( DELIVER-PKG-VERIFY ?AUTO_24 ?AUTO_25 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_28 - OBJ
      ?AUTO_29 - LOCATION
    )
    :vars
    (
      ?AUTO_31 - LOCATION
      ?AUTO_32 - LOCATION
      ?AUTO_30 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_31 ) ( AIRPORT ?AUTO_29 ) ( not ( = ?AUTO_31 ?AUTO_29 ) ) ( OBJ-AT ?AUTO_28 ?AUTO_31 ) ( AIRPORT ?AUTO_32 ) ( AIRPLANE-AT ?AUTO_30 ?AUTO_32 ) ( not ( = ?AUTO_32 ?AUTO_31 ) ) ( not ( = ?AUTO_29 ?AUTO_32 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_30 ?AUTO_32 ?AUTO_31 )
      ( DELIVER-PKG ?AUTO_28 ?AUTO_29 )
      ( DELIVER-PKG-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_33 - OBJ
      ?AUTO_34 - LOCATION
    )
    :vars
    (
      ?AUTO_35 - LOCATION
      ?AUTO_37 - LOCATION
      ?AUTO_36 - AIRPLANE
      ?AUTO_38 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_35 ) ( AIRPORT ?AUTO_34 ) ( not ( = ?AUTO_35 ?AUTO_34 ) ) ( AIRPORT ?AUTO_37 ) ( AIRPLANE-AT ?AUTO_36 ?AUTO_37 ) ( not ( = ?AUTO_37 ?AUTO_35 ) ) ( not ( = ?AUTO_34 ?AUTO_37 ) ) ( TRUCK-AT ?AUTO_38 ?AUTO_35 ) ( IN-TRUCK ?AUTO_33 ?AUTO_38 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_33 ?AUTO_38 ?AUTO_35 )
      ( DELIVER-PKG ?AUTO_33 ?AUTO_34 )
      ( DELIVER-PKG-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_39 - OBJ
      ?AUTO_40 - LOCATION
    )
    :vars
    (
      ?AUTO_41 - LOCATION
      ?AUTO_44 - LOCATION
      ?AUTO_42 - AIRPLANE
      ?AUTO_43 - TRUCK
      ?AUTO_46 - LOCATION
      ?AUTO_45 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_41 ) ( AIRPORT ?AUTO_40 ) ( not ( = ?AUTO_41 ?AUTO_40 ) ) ( AIRPORT ?AUTO_44 ) ( AIRPLANE-AT ?AUTO_42 ?AUTO_44 ) ( not ( = ?AUTO_44 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_44 ) ) ( IN-TRUCK ?AUTO_39 ?AUTO_43 ) ( TRUCK-AT ?AUTO_43 ?AUTO_46 ) ( IN-CITY ?AUTO_46 ?AUTO_45 ) ( IN-CITY ?AUTO_41 ?AUTO_45 ) ( not ( = ?AUTO_41 ?AUTO_46 ) ) ( not ( = ?AUTO_40 ?AUTO_46 ) ) ( not ( = ?AUTO_44 ?AUTO_46 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_43 ?AUTO_46 ?AUTO_41 ?AUTO_45 )
      ( DELIVER-PKG ?AUTO_39 ?AUTO_40 )
      ( DELIVER-PKG-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_47 - OBJ
      ?AUTO_48 - LOCATION
    )
    :vars
    (
      ?AUTO_52 - LOCATION
      ?AUTO_49 - LOCATION
      ?AUTO_50 - AIRPLANE
      ?AUTO_54 - TRUCK
      ?AUTO_53 - LOCATION
      ?AUTO_51 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_52 ) ( AIRPORT ?AUTO_48 ) ( not ( = ?AUTO_52 ?AUTO_48 ) ) ( AIRPORT ?AUTO_49 ) ( AIRPLANE-AT ?AUTO_50 ?AUTO_49 ) ( not ( = ?AUTO_49 ?AUTO_52 ) ) ( not ( = ?AUTO_48 ?AUTO_49 ) ) ( TRUCK-AT ?AUTO_54 ?AUTO_53 ) ( IN-CITY ?AUTO_53 ?AUTO_51 ) ( IN-CITY ?AUTO_52 ?AUTO_51 ) ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( not ( = ?AUTO_48 ?AUTO_53 ) ) ( not ( = ?AUTO_49 ?AUTO_53 ) ) ( OBJ-AT ?AUTO_47 ?AUTO_53 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_47 ?AUTO_54 ?AUTO_53 )
      ( DELIVER-PKG ?AUTO_47 ?AUTO_48 )
      ( DELIVER-PKG-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_165 - OBJ
      ?AUTO_166 - LOCATION
    )
    :vars
    (
      ?AUTO_167 - LOCATION
      ?AUTO_169 - CITY
      ?AUTO_168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_167 ?AUTO_169 ) ( IN-CITY ?AUTO_166 ?AUTO_169 ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) ( OBJ-AT ?AUTO_165 ?AUTO_167 ) ( TRUCK-AT ?AUTO_168 ?AUTO_166 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_168 ?AUTO_166 ?AUTO_167 ?AUTO_169 )
      ( DELIVER-PKG ?AUTO_165 ?AUTO_166 )
      ( DELIVER-PKG-VERIFY ?AUTO_165 ?AUTO_166 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_170 - OBJ
      ?AUTO_171 - LOCATION
    )
    :vars
    (
      ?AUTO_173 - LOCATION
      ?AUTO_174 - CITY
      ?AUTO_172 - TRUCK
      ?AUTO_175 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_173 ?AUTO_174 ) ( IN-CITY ?AUTO_171 ?AUTO_174 ) ( not ( = ?AUTO_171 ?AUTO_173 ) ) ( OBJ-AT ?AUTO_170 ?AUTO_173 ) ( TRUCK-AT ?AUTO_172 ?AUTO_175 ) ( IN-CITY ?AUTO_175 ?AUTO_174 ) ( not ( = ?AUTO_171 ?AUTO_175 ) ) ( not ( = ?AUTO_173 ?AUTO_175 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_172 ?AUTO_175 ?AUTO_171 ?AUTO_174 )
      ( DELIVER-PKG ?AUTO_170 ?AUTO_171 )
      ( DELIVER-PKG-VERIFY ?AUTO_170 ?AUTO_171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_257 - OBJ
      ?AUTO_258 - LOCATION
    )
    :vars
    (
      ?AUTO_260 - LOCATION
      ?AUTO_259 - AIRPLANE
      ?AUTO_261 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_260 ) ( AIRPORT ?AUTO_258 ) ( AIRPLANE-AT ?AUTO_259 ?AUTO_260 ) ( not ( = ?AUTO_260 ?AUTO_258 ) ) ( TRUCK-AT ?AUTO_261 ?AUTO_260 ) ( IN-TRUCK ?AUTO_257 ?AUTO_261 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_257 ?AUTO_261 ?AUTO_260 )
      ( DELIVER-PKG ?AUTO_257 ?AUTO_258 )
      ( DELIVER-PKG-VERIFY ?AUTO_257 ?AUTO_258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_264 - OBJ
      ?AUTO_265 - LOCATION
    )
    :vars
    (
      ?AUTO_266 - LOCATION
      ?AUTO_268 - AIRPLANE
      ?AUTO_267 - TRUCK
      ?AUTO_270 - LOCATION
      ?AUTO_269 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_266 ) ( AIRPORT ?AUTO_265 ) ( AIRPLANE-AT ?AUTO_268 ?AUTO_266 ) ( not ( = ?AUTO_266 ?AUTO_265 ) ) ( IN-TRUCK ?AUTO_264 ?AUTO_267 ) ( TRUCK-AT ?AUTO_267 ?AUTO_270 ) ( IN-CITY ?AUTO_270 ?AUTO_269 ) ( IN-CITY ?AUTO_266 ?AUTO_269 ) ( not ( = ?AUTO_266 ?AUTO_270 ) ) ( not ( = ?AUTO_265 ?AUTO_270 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_267 ?AUTO_270 ?AUTO_266 ?AUTO_269 )
      ( DELIVER-PKG ?AUTO_264 ?AUTO_265 )
      ( DELIVER-PKG-VERIFY ?AUTO_264 ?AUTO_265 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_287 - OBJ
      ?AUTO_288 - LOCATION
    )
    :vars
    (
      ?AUTO_289 - LOCATION
      ?AUTO_291 - TRUCK
      ?AUTO_292 - LOCATION
      ?AUTO_293 - CITY
      ?AUTO_294 - LOCATION
      ?AUTO_290 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_289 ) ( AIRPORT ?AUTO_288 ) ( not ( = ?AUTO_289 ?AUTO_288 ) ) ( IN-TRUCK ?AUTO_287 ?AUTO_291 ) ( TRUCK-AT ?AUTO_291 ?AUTO_292 ) ( IN-CITY ?AUTO_292 ?AUTO_293 ) ( IN-CITY ?AUTO_289 ?AUTO_293 ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) ( AIRPORT ?AUTO_294 ) ( AIRPLANE-AT ?AUTO_290 ?AUTO_294 ) ( not ( = ?AUTO_294 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_294 ) ) ( not ( = ?AUTO_292 ?AUTO_294 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_290 ?AUTO_294 ?AUTO_289 )
      ( DELIVER-PKG ?AUTO_287 ?AUTO_288 )
      ( DELIVER-PKG-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_305 - OBJ
      ?AUTO_306 - LOCATION
    )
    :vars
    (
      ?AUTO_307 - LOCATION
      ?AUTO_308 - LOCATION
      ?AUTO_309 - CITY
      ?AUTO_312 - LOCATION
      ?AUTO_310 - AIRPLANE
      ?AUTO_311 - TRUCK
      ?AUTO_313 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_307 ) ( AIRPORT ?AUTO_306 ) ( not ( = ?AUTO_307 ?AUTO_306 ) ) ( IN-CITY ?AUTO_308 ?AUTO_309 ) ( IN-CITY ?AUTO_307 ?AUTO_309 ) ( not ( = ?AUTO_307 ?AUTO_308 ) ) ( not ( = ?AUTO_306 ?AUTO_308 ) ) ( AIRPORT ?AUTO_312 ) ( AIRPLANE-AT ?AUTO_310 ?AUTO_312 ) ( not ( = ?AUTO_312 ?AUTO_307 ) ) ( not ( = ?AUTO_306 ?AUTO_312 ) ) ( not ( = ?AUTO_308 ?AUTO_312 ) ) ( OBJ-AT ?AUTO_305 ?AUTO_308 ) ( TRUCK-AT ?AUTO_311 ?AUTO_313 ) ( IN-CITY ?AUTO_313 ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_313 ) ) ( not ( = ?AUTO_306 ?AUTO_313 ) ) ( not ( = ?AUTO_307 ?AUTO_313 ) ) ( not ( = ?AUTO_312 ?AUTO_313 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_311 ?AUTO_313 ?AUTO_308 ?AUTO_309 )
      ( DELIVER-PKG ?AUTO_305 ?AUTO_306 )
      ( DELIVER-PKG-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_360 - OBJ
      ?AUTO_361 - LOCATION
    )
    :vars
    (
      ?AUTO_362 - LOCATION
      ?AUTO_363 - CITY
      ?AUTO_364 - TRUCK
      ?AUTO_365 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_362 ?AUTO_363 ) ( IN-CITY ?AUTO_361 ?AUTO_363 ) ( not ( = ?AUTO_361 ?AUTO_362 ) ) ( TRUCK-AT ?AUTO_364 ?AUTO_361 ) ( IN-AIRPLANE ?AUTO_360 ?AUTO_365 ) ( AIRPLANE-AT ?AUTO_365 ?AUTO_362 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_360 ?AUTO_365 ?AUTO_362 )
      ( DELIVER-PKG ?AUTO_360 ?AUTO_361 )
      ( DELIVER-PKG-VERIFY ?AUTO_360 ?AUTO_361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_366 - OBJ
      ?AUTO_367 - LOCATION
    )
    :vars
    (
      ?AUTO_368 - LOCATION
      ?AUTO_369 - CITY
      ?AUTO_370 - TRUCK
      ?AUTO_371 - AIRPLANE
      ?AUTO_372 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_368 ?AUTO_369 ) ( IN-CITY ?AUTO_367 ?AUTO_369 ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( TRUCK-AT ?AUTO_370 ?AUTO_367 ) ( IN-AIRPLANE ?AUTO_366 ?AUTO_371 ) ( AIRPORT ?AUTO_372 ) ( AIRPORT ?AUTO_368 ) ( AIRPLANE-AT ?AUTO_371 ?AUTO_372 ) ( not ( = ?AUTO_372 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_372 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_371 ?AUTO_372 ?AUTO_368 )
      ( DELIVER-PKG ?AUTO_366 ?AUTO_367 )
      ( DELIVER-PKG-VERIFY ?AUTO_366 ?AUTO_367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_387 - OBJ
      ?AUTO_388 - LOCATION
    )
    :vars
    (
      ?AUTO_391 - LOCATION
      ?AUTO_389 - CITY
      ?AUTO_390 - TRUCK
      ?AUTO_392 - LOCATION
      ?AUTO_393 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_391 ?AUTO_389 ) ( IN-CITY ?AUTO_388 ?AUTO_389 ) ( not ( = ?AUTO_388 ?AUTO_391 ) ) ( TRUCK-AT ?AUTO_390 ?AUTO_388 ) ( AIRPORT ?AUTO_392 ) ( AIRPORT ?AUTO_391 ) ( AIRPLANE-AT ?AUTO_393 ?AUTO_392 ) ( not ( = ?AUTO_392 ?AUTO_391 ) ) ( not ( = ?AUTO_388 ?AUTO_392 ) ) ( OBJ-AT ?AUTO_387 ?AUTO_392 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_387 ?AUTO_393 ?AUTO_392 )
      ( DELIVER-PKG ?AUTO_387 ?AUTO_388 )
      ( DELIVER-PKG-VERIFY ?AUTO_387 ?AUTO_388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_396 - OBJ
      ?AUTO_397 - LOCATION
    )
    :vars
    (
      ?AUTO_402 - LOCATION
      ?AUTO_399 - CITY
      ?AUTO_398 - LOCATION
      ?AUTO_400 - AIRPLANE
      ?AUTO_401 - TRUCK
      ?AUTO_403 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_402 ?AUTO_399 ) ( IN-CITY ?AUTO_397 ?AUTO_399 ) ( not ( = ?AUTO_397 ?AUTO_402 ) ) ( AIRPORT ?AUTO_398 ) ( AIRPORT ?AUTO_402 ) ( AIRPLANE-AT ?AUTO_400 ?AUTO_398 ) ( not ( = ?AUTO_398 ?AUTO_402 ) ) ( not ( = ?AUTO_397 ?AUTO_398 ) ) ( OBJ-AT ?AUTO_396 ?AUTO_398 ) ( TRUCK-AT ?AUTO_401 ?AUTO_403 ) ( IN-CITY ?AUTO_403 ?AUTO_399 ) ( not ( = ?AUTO_397 ?AUTO_403 ) ) ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( not ( = ?AUTO_398 ?AUTO_403 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_401 ?AUTO_403 ?AUTO_397 ?AUTO_399 )
      ( DELIVER-PKG ?AUTO_396 ?AUTO_397 )
      ( DELIVER-PKG-VERIFY ?AUTO_396 ?AUTO_397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_703 - OBJ
      ?AUTO_704 - LOCATION
    )
    :vars
    (
      ?AUTO_705 - TRUCK
      ?AUTO_706 - LOCATION
      ?AUTO_707 - CITY
      ?AUTO_708 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_705 ?AUTO_706 ) ( IN-CITY ?AUTO_706 ?AUTO_707 ) ( IN-CITY ?AUTO_704 ?AUTO_707 ) ( not ( = ?AUTO_704 ?AUTO_706 ) ) ( IN-AIRPLANE ?AUTO_703 ?AUTO_708 ) ( AIRPLANE-AT ?AUTO_708 ?AUTO_706 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_703 ?AUTO_708 ?AUTO_706 )
      ( DELIVER-PKG ?AUTO_703 ?AUTO_704 )
      ( DELIVER-PKG-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_711 - OBJ
      ?AUTO_712 - LOCATION
    )
    :vars
    (
      ?AUTO_715 - TRUCK
      ?AUTO_713 - LOCATION
      ?AUTO_716 - CITY
      ?AUTO_714 - AIRPLANE
      ?AUTO_717 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_715 ?AUTO_713 ) ( IN-CITY ?AUTO_713 ?AUTO_716 ) ( IN-CITY ?AUTO_712 ?AUTO_716 ) ( not ( = ?AUTO_712 ?AUTO_713 ) ) ( IN-AIRPLANE ?AUTO_711 ?AUTO_714 ) ( AIRPORT ?AUTO_717 ) ( AIRPORT ?AUTO_713 ) ( AIRPLANE-AT ?AUTO_714 ?AUTO_717 ) ( not ( = ?AUTO_717 ?AUTO_713 ) ) ( not ( = ?AUTO_712 ?AUTO_717 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_714 ?AUTO_717 ?AUTO_713 )
      ( DELIVER-PKG ?AUTO_711 ?AUTO_712 )
      ( DELIVER-PKG-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_734 - OBJ
      ?AUTO_735 - LOCATION
    )
    :vars
    (
      ?AUTO_737 - TRUCK
      ?AUTO_739 - LOCATION
      ?AUTO_740 - CITY
      ?AUTO_736 - LOCATION
      ?AUTO_738 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_737 ?AUTO_739 ) ( IN-CITY ?AUTO_739 ?AUTO_740 ) ( IN-CITY ?AUTO_735 ?AUTO_740 ) ( not ( = ?AUTO_735 ?AUTO_739 ) ) ( AIRPORT ?AUTO_736 ) ( AIRPORT ?AUTO_739 ) ( AIRPLANE-AT ?AUTO_738 ?AUTO_736 ) ( not ( = ?AUTO_736 ?AUTO_739 ) ) ( not ( = ?AUTO_735 ?AUTO_736 ) ) ( OBJ-AT ?AUTO_734 ?AUTO_736 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_734 ?AUTO_738 ?AUTO_736 )
      ( DELIVER-PKG ?AUTO_734 ?AUTO_735 )
      ( DELIVER-PKG-VERIFY ?AUTO_734 ?AUTO_735 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_741 - OBJ
      ?AUTO_742 - LOCATION
    )
    :vars
    (
      ?AUTO_743 - TRUCK
      ?AUTO_746 - LOCATION
      ?AUTO_747 - CITY
      ?AUTO_744 - LOCATION
      ?AUTO_748 - LOCATION
      ?AUTO_745 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_743 ?AUTO_746 ) ( IN-CITY ?AUTO_746 ?AUTO_747 ) ( IN-CITY ?AUTO_742 ?AUTO_747 ) ( not ( = ?AUTO_742 ?AUTO_746 ) ) ( AIRPORT ?AUTO_744 ) ( AIRPORT ?AUTO_746 ) ( not ( = ?AUTO_744 ?AUTO_746 ) ) ( not ( = ?AUTO_742 ?AUTO_744 ) ) ( OBJ-AT ?AUTO_741 ?AUTO_744 ) ( AIRPORT ?AUTO_748 ) ( AIRPLANE-AT ?AUTO_745 ?AUTO_748 ) ( not ( = ?AUTO_748 ?AUTO_744 ) ) ( not ( = ?AUTO_742 ?AUTO_748 ) ) ( not ( = ?AUTO_746 ?AUTO_748 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_745 ?AUTO_748 ?AUTO_744 )
      ( DELIVER-PKG ?AUTO_741 ?AUTO_742 )
      ( DELIVER-PKG-VERIFY ?AUTO_741 ?AUTO_742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_848 - OBJ
      ?AUTO_849 - LOCATION
    )
    :vars
    (
      ?AUTO_855 - TRUCK
      ?AUTO_852 - LOCATION
      ?AUTO_853 - CITY
      ?AUTO_854 - LOCATION
      ?AUTO_851 - LOCATION
      ?AUTO_850 - AIRPLANE
      ?AUTO_856 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_855 ?AUTO_852 ) ( IN-CITY ?AUTO_852 ?AUTO_853 ) ( IN-CITY ?AUTO_849 ?AUTO_853 ) ( not ( = ?AUTO_849 ?AUTO_852 ) ) ( AIRPORT ?AUTO_854 ) ( AIRPORT ?AUTO_852 ) ( not ( = ?AUTO_854 ?AUTO_852 ) ) ( not ( = ?AUTO_849 ?AUTO_854 ) ) ( AIRPORT ?AUTO_851 ) ( AIRPLANE-AT ?AUTO_850 ?AUTO_851 ) ( not ( = ?AUTO_851 ?AUTO_854 ) ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_852 ?AUTO_851 ) ) ( TRUCK-AT ?AUTO_856 ?AUTO_854 ) ( IN-TRUCK ?AUTO_848 ?AUTO_856 ) ( not ( = ?AUTO_855 ?AUTO_856 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_848 ?AUTO_856 ?AUTO_854 )
      ( DELIVER-PKG ?AUTO_848 ?AUTO_849 )
      ( DELIVER-PKG-VERIFY ?AUTO_848 ?AUTO_849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_857 - OBJ
      ?AUTO_858 - LOCATION
    )
    :vars
    (
      ?AUTO_862 - TRUCK
      ?AUTO_861 - LOCATION
      ?AUTO_865 - CITY
      ?AUTO_860 - LOCATION
      ?AUTO_859 - LOCATION
      ?AUTO_863 - AIRPLANE
      ?AUTO_864 - TRUCK
      ?AUTO_867 - LOCATION
      ?AUTO_866 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_862 ?AUTO_861 ) ( IN-CITY ?AUTO_861 ?AUTO_865 ) ( IN-CITY ?AUTO_858 ?AUTO_865 ) ( not ( = ?AUTO_858 ?AUTO_861 ) ) ( AIRPORT ?AUTO_860 ) ( AIRPORT ?AUTO_861 ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( AIRPORT ?AUTO_859 ) ( AIRPLANE-AT ?AUTO_863 ?AUTO_859 ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( not ( = ?AUTO_861 ?AUTO_859 ) ) ( IN-TRUCK ?AUTO_857 ?AUTO_864 ) ( not ( = ?AUTO_862 ?AUTO_864 ) ) ( TRUCK-AT ?AUTO_864 ?AUTO_867 ) ( IN-CITY ?AUTO_867 ?AUTO_866 ) ( IN-CITY ?AUTO_860 ?AUTO_866 ) ( not ( = ?AUTO_860 ?AUTO_867 ) ) ( not ( = ?AUTO_858 ?AUTO_867 ) ) ( not ( = ?AUTO_861 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( not ( = ?AUTO_859 ?AUTO_867 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_864 ?AUTO_867 ?AUTO_860 ?AUTO_866 )
      ( DELIVER-PKG ?AUTO_857 ?AUTO_858 )
      ( DELIVER-PKG-VERIFY ?AUTO_857 ?AUTO_858 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_894 - OBJ
      ?AUTO_895 - LOCATION
    )
    :vars
    (
      ?AUTO_902 - TRUCK
      ?AUTO_904 - LOCATION
      ?AUTO_899 - CITY
      ?AUTO_896 - LOCATION
      ?AUTO_903 - LOCATION
      ?AUTO_898 - AIRPLANE
      ?AUTO_901 - TRUCK
      ?AUTO_897 - LOCATION
      ?AUTO_900 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_902 ?AUTO_904 ) ( IN-CITY ?AUTO_904 ?AUTO_899 ) ( IN-CITY ?AUTO_895 ?AUTO_899 ) ( not ( = ?AUTO_895 ?AUTO_904 ) ) ( AIRPORT ?AUTO_896 ) ( AIRPORT ?AUTO_904 ) ( not ( = ?AUTO_896 ?AUTO_904 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) ( AIRPORT ?AUTO_903 ) ( AIRPLANE-AT ?AUTO_898 ?AUTO_903 ) ( not ( = ?AUTO_903 ?AUTO_896 ) ) ( not ( = ?AUTO_895 ?AUTO_903 ) ) ( not ( = ?AUTO_904 ?AUTO_903 ) ) ( not ( = ?AUTO_902 ?AUTO_901 ) ) ( TRUCK-AT ?AUTO_901 ?AUTO_897 ) ( IN-CITY ?AUTO_897 ?AUTO_900 ) ( IN-CITY ?AUTO_896 ?AUTO_900 ) ( not ( = ?AUTO_896 ?AUTO_897 ) ) ( not ( = ?AUTO_895 ?AUTO_897 ) ) ( not ( = ?AUTO_904 ?AUTO_897 ) ) ( not ( = ?AUTO_899 ?AUTO_900 ) ) ( not ( = ?AUTO_903 ?AUTO_897 ) ) ( OBJ-AT ?AUTO_894 ?AUTO_897 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_894 ?AUTO_901 ?AUTO_897 )
      ( DELIVER-PKG ?AUTO_894 ?AUTO_895 )
      ( DELIVER-PKG-VERIFY ?AUTO_894 ?AUTO_895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1092 - OBJ
      ?AUTO_1093 - LOCATION
    )
    :vars
    (
      ?AUTO_1098 - TRUCK
      ?AUTO_1101 - LOCATION
      ?AUTO_1094 - CITY
      ?AUTO_1099 - LOCATION
      ?AUTO_1096 - LOCATION
      ?AUTO_1097 - AIRPLANE
      ?AUTO_1102 - TRUCK
      ?AUTO_1100 - LOCATION
      ?AUTO_1095 - CITY
      ?AUTO_1103 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1098 ?AUTO_1101 ) ( IN-CITY ?AUTO_1101 ?AUTO_1094 ) ( IN-CITY ?AUTO_1093 ?AUTO_1094 ) ( not ( = ?AUTO_1093 ?AUTO_1101 ) ) ( AIRPORT ?AUTO_1099 ) ( AIRPORT ?AUTO_1101 ) ( not ( = ?AUTO_1099 ?AUTO_1101 ) ) ( not ( = ?AUTO_1093 ?AUTO_1099 ) ) ( AIRPORT ?AUTO_1096 ) ( AIRPLANE-AT ?AUTO_1097 ?AUTO_1096 ) ( not ( = ?AUTO_1096 ?AUTO_1099 ) ) ( not ( = ?AUTO_1093 ?AUTO_1096 ) ) ( not ( = ?AUTO_1101 ?AUTO_1096 ) ) ( not ( = ?AUTO_1098 ?AUTO_1102 ) ) ( IN-CITY ?AUTO_1100 ?AUTO_1095 ) ( IN-CITY ?AUTO_1099 ?AUTO_1095 ) ( not ( = ?AUTO_1099 ?AUTO_1100 ) ) ( not ( = ?AUTO_1093 ?AUTO_1100 ) ) ( not ( = ?AUTO_1101 ?AUTO_1100 ) ) ( not ( = ?AUTO_1094 ?AUTO_1095 ) ) ( not ( = ?AUTO_1096 ?AUTO_1100 ) ) ( OBJ-AT ?AUTO_1092 ?AUTO_1100 ) ( TRUCK-AT ?AUTO_1102 ?AUTO_1103 ) ( IN-CITY ?AUTO_1103 ?AUTO_1095 ) ( not ( = ?AUTO_1100 ?AUTO_1103 ) ) ( not ( = ?AUTO_1093 ?AUTO_1103 ) ) ( not ( = ?AUTO_1101 ?AUTO_1103 ) ) ( not ( = ?AUTO_1099 ?AUTO_1103 ) ) ( not ( = ?AUTO_1096 ?AUTO_1103 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1102 ?AUTO_1103 ?AUTO_1100 ?AUTO_1095 )
      ( DELIVER-PKG ?AUTO_1092 ?AUTO_1093 )
      ( DELIVER-PKG-VERIFY ?AUTO_1092 ?AUTO_1093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1294 - OBJ
      ?AUTO_1295 - LOCATION
    )
    :vars
    (
      ?AUTO_1298 - TRUCK
      ?AUTO_1296 - LOCATION
      ?AUTO_1297 - CITY
      ?AUTO_1300 - LOCATION
      ?AUTO_1299 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1298 ?AUTO_1296 ) ( IN-CITY ?AUTO_1296 ?AUTO_1297 ) ( IN-CITY ?AUTO_1295 ?AUTO_1297 ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( AIRPORT ?AUTO_1300 ) ( AIRPORT ?AUTO_1296 ) ( not ( = ?AUTO_1300 ?AUTO_1296 ) ) ( not ( = ?AUTO_1295 ?AUTO_1300 ) ) ( OBJ-AT ?AUTO_1294 ?AUTO_1300 ) ( AIRPLANE-AT ?AUTO_1299 ?AUTO_1296 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1299 ?AUTO_1296 ?AUTO_1300 )
      ( DELIVER-PKG ?AUTO_1294 ?AUTO_1295 )
      ( DELIVER-PKG-VERIFY ?AUTO_1294 ?AUTO_1295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1301 - OBJ
      ?AUTO_1302 - LOCATION
    )
    :vars
    (
      ?AUTO_1303 - LOCATION
      ?AUTO_1307 - CITY
      ?AUTO_1304 - LOCATION
      ?AUTO_1306 - AIRPLANE
      ?AUTO_1305 - TRUCK
      ?AUTO_1308 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1303 ?AUTO_1307 ) ( IN-CITY ?AUTO_1302 ?AUTO_1307 ) ( not ( = ?AUTO_1302 ?AUTO_1303 ) ) ( AIRPORT ?AUTO_1304 ) ( AIRPORT ?AUTO_1303 ) ( not ( = ?AUTO_1304 ?AUTO_1303 ) ) ( not ( = ?AUTO_1302 ?AUTO_1304 ) ) ( OBJ-AT ?AUTO_1301 ?AUTO_1304 ) ( AIRPLANE-AT ?AUTO_1306 ?AUTO_1303 ) ( TRUCK-AT ?AUTO_1305 ?AUTO_1308 ) ( IN-CITY ?AUTO_1308 ?AUTO_1307 ) ( not ( = ?AUTO_1303 ?AUTO_1308 ) ) ( not ( = ?AUTO_1302 ?AUTO_1308 ) ) ( not ( = ?AUTO_1304 ?AUTO_1308 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1305 ?AUTO_1308 ?AUTO_1303 ?AUTO_1307 )
      ( DELIVER-PKG ?AUTO_1301 ?AUTO_1302 )
      ( DELIVER-PKG-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1311 - OBJ
      ?AUTO_1312 - LOCATION
    )
    :vars
    (
      ?AUTO_1315 - LOCATION
      ?AUTO_1313 - CITY
      ?AUTO_1316 - LOCATION
      ?AUTO_1317 - AIRPLANE
      ?AUTO_1318 - TRUCK
      ?AUTO_1314 - LOCATION
      ?AUTO_1319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1315 ?AUTO_1313 ) ( IN-CITY ?AUTO_1312 ?AUTO_1313 ) ( not ( = ?AUTO_1312 ?AUTO_1315 ) ) ( AIRPORT ?AUTO_1316 ) ( AIRPORT ?AUTO_1315 ) ( not ( = ?AUTO_1316 ?AUTO_1315 ) ) ( not ( = ?AUTO_1312 ?AUTO_1316 ) ) ( AIRPLANE-AT ?AUTO_1317 ?AUTO_1315 ) ( TRUCK-AT ?AUTO_1318 ?AUTO_1314 ) ( IN-CITY ?AUTO_1314 ?AUTO_1313 ) ( not ( = ?AUTO_1315 ?AUTO_1314 ) ) ( not ( = ?AUTO_1312 ?AUTO_1314 ) ) ( not ( = ?AUTO_1316 ?AUTO_1314 ) ) ( TRUCK-AT ?AUTO_1319 ?AUTO_1316 ) ( IN-TRUCK ?AUTO_1311 ?AUTO_1319 ) ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1311 ?AUTO_1319 ?AUTO_1316 )
      ( DELIVER-PKG ?AUTO_1311 ?AUTO_1312 )
      ( DELIVER-PKG-VERIFY ?AUTO_1311 ?AUTO_1312 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1320 - OBJ
      ?AUTO_1321 - LOCATION
    )
    :vars
    (
      ?AUTO_1323 - LOCATION
      ?AUTO_1324 - CITY
      ?AUTO_1326 - LOCATION
      ?AUTO_1327 - AIRPLANE
      ?AUTO_1322 - TRUCK
      ?AUTO_1325 - LOCATION
      ?AUTO_1328 - TRUCK
      ?AUTO_1330 - LOCATION
      ?AUTO_1329 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1323 ?AUTO_1324 ) ( IN-CITY ?AUTO_1321 ?AUTO_1324 ) ( not ( = ?AUTO_1321 ?AUTO_1323 ) ) ( AIRPORT ?AUTO_1326 ) ( AIRPORT ?AUTO_1323 ) ( not ( = ?AUTO_1326 ?AUTO_1323 ) ) ( not ( = ?AUTO_1321 ?AUTO_1326 ) ) ( AIRPLANE-AT ?AUTO_1327 ?AUTO_1323 ) ( TRUCK-AT ?AUTO_1322 ?AUTO_1325 ) ( IN-CITY ?AUTO_1325 ?AUTO_1324 ) ( not ( = ?AUTO_1323 ?AUTO_1325 ) ) ( not ( = ?AUTO_1321 ?AUTO_1325 ) ) ( not ( = ?AUTO_1326 ?AUTO_1325 ) ) ( IN-TRUCK ?AUTO_1320 ?AUTO_1328 ) ( not ( = ?AUTO_1322 ?AUTO_1328 ) ) ( TRUCK-AT ?AUTO_1328 ?AUTO_1330 ) ( IN-CITY ?AUTO_1330 ?AUTO_1329 ) ( IN-CITY ?AUTO_1326 ?AUTO_1329 ) ( not ( = ?AUTO_1326 ?AUTO_1330 ) ) ( not ( = ?AUTO_1321 ?AUTO_1330 ) ) ( not ( = ?AUTO_1323 ?AUTO_1330 ) ) ( not ( = ?AUTO_1324 ?AUTO_1329 ) ) ( not ( = ?AUTO_1325 ?AUTO_1330 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1328 ?AUTO_1330 ?AUTO_1326 ?AUTO_1329 )
      ( DELIVER-PKG ?AUTO_1320 ?AUTO_1321 )
      ( DELIVER-PKG-VERIFY ?AUTO_1320 ?AUTO_1321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1331 - OBJ
      ?AUTO_1332 - LOCATION
    )
    :vars
    (
      ?AUTO_1339 - LOCATION
      ?AUTO_1341 - CITY
      ?AUTO_1335 - LOCATION
      ?AUTO_1336 - AIRPLANE
      ?AUTO_1333 - TRUCK
      ?AUTO_1334 - LOCATION
      ?AUTO_1338 - TRUCK
      ?AUTO_1337 - LOCATION
      ?AUTO_1340 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1339 ?AUTO_1341 ) ( IN-CITY ?AUTO_1332 ?AUTO_1341 ) ( not ( = ?AUTO_1332 ?AUTO_1339 ) ) ( AIRPORT ?AUTO_1335 ) ( AIRPORT ?AUTO_1339 ) ( not ( = ?AUTO_1335 ?AUTO_1339 ) ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( AIRPLANE-AT ?AUTO_1336 ?AUTO_1339 ) ( TRUCK-AT ?AUTO_1333 ?AUTO_1334 ) ( IN-CITY ?AUTO_1334 ?AUTO_1341 ) ( not ( = ?AUTO_1339 ?AUTO_1334 ) ) ( not ( = ?AUTO_1332 ?AUTO_1334 ) ) ( not ( = ?AUTO_1335 ?AUTO_1334 ) ) ( not ( = ?AUTO_1333 ?AUTO_1338 ) ) ( TRUCK-AT ?AUTO_1338 ?AUTO_1337 ) ( IN-CITY ?AUTO_1337 ?AUTO_1340 ) ( IN-CITY ?AUTO_1335 ?AUTO_1340 ) ( not ( = ?AUTO_1335 ?AUTO_1337 ) ) ( not ( = ?AUTO_1332 ?AUTO_1337 ) ) ( not ( = ?AUTO_1339 ?AUTO_1337 ) ) ( not ( = ?AUTO_1341 ?AUTO_1340 ) ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( OBJ-AT ?AUTO_1331 ?AUTO_1337 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1331 ?AUTO_1338 ?AUTO_1337 )
      ( DELIVER-PKG ?AUTO_1331 ?AUTO_1332 )
      ( DELIVER-PKG-VERIFY ?AUTO_1331 ?AUTO_1332 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1379 - OBJ
      ?AUTO_1380 - LOCATION
    )
    :vars
    (
      ?AUTO_1381 - LOCATION
      ?AUTO_1382 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1381 ) ( AIRPORT ?AUTO_1380 ) ( not ( = ?AUTO_1381 ?AUTO_1380 ) ) ( OBJ-AT ?AUTO_1379 ?AUTO_1381 ) ( AIRPLANE-AT ?AUTO_1382 ?AUTO_1380 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1382 ?AUTO_1380 ?AUTO_1381 )
      ( DELIVER-PKG ?AUTO_1379 ?AUTO_1380 )
      ( DELIVER-PKG-VERIFY ?AUTO_1379 ?AUTO_1380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1478 - OBJ
      ?AUTO_1479 - LOCATION
    )
    :vars
    (
      ?AUTO_1482 - LOCATION
      ?AUTO_1480 - CITY
      ?AUTO_1481 - TRUCK
      ?AUTO_1483 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1482 ?AUTO_1480 ) ( IN-CITY ?AUTO_1479 ?AUTO_1480 ) ( not ( = ?AUTO_1479 ?AUTO_1482 ) ) ( OBJ-AT ?AUTO_1478 ?AUTO_1482 ) ( TRUCK-AT ?AUTO_1481 ?AUTO_1483 ) ( IN-CITY ?AUTO_1483 ?AUTO_1480 ) ( not ( = ?AUTO_1482 ?AUTO_1483 ) ) ( not ( = ?AUTO_1479 ?AUTO_1483 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1481 ?AUTO_1483 ?AUTO_1482 ?AUTO_1480 )
      ( DELIVER-PKG ?AUTO_1478 ?AUTO_1479 )
      ( DELIVER-PKG-VERIFY ?AUTO_1478 ?AUTO_1479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1563 - OBJ
      ?AUTO_1564 - LOCATION
    )
    :vars
    (
      ?AUTO_1565 - LOCATION
      ?AUTO_1566 - AIRPLANE
      ?AUTO_1567 - TRUCK
      ?AUTO_1568 - LOCATION
      ?AUTO_1569 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1565 ) ( AIRPORT ?AUTO_1564 ) ( AIRPLANE-AT ?AUTO_1566 ?AUTO_1565 ) ( not ( = ?AUTO_1565 ?AUTO_1564 ) ) ( TRUCK-AT ?AUTO_1567 ?AUTO_1568 ) ( IN-CITY ?AUTO_1568 ?AUTO_1569 ) ( IN-CITY ?AUTO_1565 ?AUTO_1569 ) ( not ( = ?AUTO_1565 ?AUTO_1568 ) ) ( not ( = ?AUTO_1564 ?AUTO_1568 ) ) ( OBJ-AT ?AUTO_1563 ?AUTO_1568 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1563 ?AUTO_1567 ?AUTO_1568 )
      ( DELIVER-PKG ?AUTO_1563 ?AUTO_1564 )
      ( DELIVER-PKG-VERIFY ?AUTO_1563 ?AUTO_1564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1570 - OBJ
      ?AUTO_1571 - LOCATION
    )
    :vars
    (
      ?AUTO_1573 - LOCATION
      ?AUTO_1572 - AIRPLANE
      ?AUTO_1575 - LOCATION
      ?AUTO_1574 - CITY
      ?AUTO_1576 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1573 ) ( AIRPORT ?AUTO_1571 ) ( AIRPLANE-AT ?AUTO_1572 ?AUTO_1573 ) ( not ( = ?AUTO_1573 ?AUTO_1571 ) ) ( IN-CITY ?AUTO_1575 ?AUTO_1574 ) ( IN-CITY ?AUTO_1573 ?AUTO_1574 ) ( not ( = ?AUTO_1573 ?AUTO_1575 ) ) ( not ( = ?AUTO_1571 ?AUTO_1575 ) ) ( OBJ-AT ?AUTO_1570 ?AUTO_1575 ) ( TRUCK-AT ?AUTO_1576 ?AUTO_1573 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1576 ?AUTO_1573 ?AUTO_1575 ?AUTO_1574 )
      ( DELIVER-PKG ?AUTO_1570 ?AUTO_1571 )
      ( DELIVER-PKG-VERIFY ?AUTO_1570 ?AUTO_1571 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1628 - OBJ
      ?AUTO_1629 - LOCATION
    )
    :vars
    (
      ?AUTO_1631 - LOCATION
      ?AUTO_1632 - LOCATION
      ?AUTO_1630 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1631 ) ( AIRPORT ?AUTO_1629 ) ( not ( = ?AUTO_1631 ?AUTO_1629 ) ) ( OBJ-AT ?AUTO_1628 ?AUTO_1631 ) ( AIRPORT ?AUTO_1632 ) ( AIRPLANE-AT ?AUTO_1630 ?AUTO_1632 ) ( not ( = ?AUTO_1632 ?AUTO_1629 ) ) ( not ( = ?AUTO_1631 ?AUTO_1632 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1630 ?AUTO_1632 ?AUTO_1629 )
      ( DELIVER-PKG ?AUTO_1628 ?AUTO_1629 )
      ( DELIVER-PKG-VERIFY ?AUTO_1628 ?AUTO_1629 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1769 - OBJ
      ?AUTO_1770 - LOCATION
    )
    :vars
    (
      ?AUTO_1772 - LOCATION
      ?AUTO_1774 - CITY
      ?AUTO_1771 - AIRPLANE
      ?AUTO_1775 - LOCATION
      ?AUTO_1773 - TRUCK
      ?AUTO_1776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1772 ?AUTO_1774 ) ( IN-CITY ?AUTO_1770 ?AUTO_1774 ) ( not ( = ?AUTO_1770 ?AUTO_1772 ) ) ( IN-AIRPLANE ?AUTO_1769 ?AUTO_1771 ) ( AIRPORT ?AUTO_1775 ) ( AIRPORT ?AUTO_1772 ) ( AIRPLANE-AT ?AUTO_1771 ?AUTO_1775 ) ( not ( = ?AUTO_1775 ?AUTO_1772 ) ) ( not ( = ?AUTO_1770 ?AUTO_1775 ) ) ( TRUCK-AT ?AUTO_1773 ?AUTO_1776 ) ( IN-CITY ?AUTO_1776 ?AUTO_1774 ) ( not ( = ?AUTO_1772 ?AUTO_1776 ) ) ( not ( = ?AUTO_1770 ?AUTO_1776 ) ) ( not ( = ?AUTO_1775 ?AUTO_1776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1773 ?AUTO_1776 ?AUTO_1772 ?AUTO_1774 )
      ( DELIVER-PKG ?AUTO_1769 ?AUTO_1770 )
      ( DELIVER-PKG-VERIFY ?AUTO_1769 ?AUTO_1770 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1779 - OBJ
      ?AUTO_1780 - LOCATION
    )
    :vars
    (
      ?AUTO_1784 - LOCATION
      ?AUTO_1785 - CITY
      ?AUTO_1783 - AIRPLANE
      ?AUTO_1781 - LOCATION
      ?AUTO_1782 - LOCATION
      ?AUTO_1786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1784 ?AUTO_1785 ) ( IN-CITY ?AUTO_1780 ?AUTO_1785 ) ( not ( = ?AUTO_1780 ?AUTO_1784 ) ) ( IN-AIRPLANE ?AUTO_1779 ?AUTO_1783 ) ( AIRPORT ?AUTO_1781 ) ( AIRPORT ?AUTO_1784 ) ( AIRPLANE-AT ?AUTO_1783 ?AUTO_1781 ) ( not ( = ?AUTO_1781 ?AUTO_1784 ) ) ( not ( = ?AUTO_1780 ?AUTO_1781 ) ) ( IN-CITY ?AUTO_1782 ?AUTO_1785 ) ( not ( = ?AUTO_1784 ?AUTO_1782 ) ) ( not ( = ?AUTO_1780 ?AUTO_1782 ) ) ( not ( = ?AUTO_1781 ?AUTO_1782 ) ) ( TRUCK-AT ?AUTO_1786 ?AUTO_1780 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1786 ?AUTO_1780 ?AUTO_1782 ?AUTO_1785 )
      ( DELIVER-PKG ?AUTO_1779 ?AUTO_1780 )
      ( DELIVER-PKG-VERIFY ?AUTO_1779 ?AUTO_1780 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4055 - OBJ
      ?AUTO_4056 - LOCATION
    )
    :vars
    (
      ?AUTO_4059 - LOCATION
      ?AUTO_4057 - CITY
      ?AUTO_4058 - TRUCK
      ?AUTO_4061 - LOCATION
      ?AUTO_4060 - AIRPLANE
      ?AUTO_4062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4059 ?AUTO_4057 ) ( IN-CITY ?AUTO_4056 ?AUTO_4057 ) ( not ( = ?AUTO_4056 ?AUTO_4059 ) ) ( TRUCK-AT ?AUTO_4058 ?AUTO_4056 ) ( AIRPORT ?AUTO_4061 ) ( AIRPORT ?AUTO_4059 ) ( AIRPLANE-AT ?AUTO_4060 ?AUTO_4061 ) ( not ( = ?AUTO_4061 ?AUTO_4059 ) ) ( not ( = ?AUTO_4056 ?AUTO_4061 ) ) ( TRUCK-AT ?AUTO_4062 ?AUTO_4061 ) ( IN-TRUCK ?AUTO_4055 ?AUTO_4062 ) ( not ( = ?AUTO_4058 ?AUTO_4062 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4055 ?AUTO_4062 ?AUTO_4061 )
      ( DELIVER-PKG ?AUTO_4055 ?AUTO_4056 )
      ( DELIVER-PKG-VERIFY ?AUTO_4055 ?AUTO_4056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4063 - OBJ
      ?AUTO_4064 - LOCATION
    )
    :vars
    (
      ?AUTO_4069 - LOCATION
      ?AUTO_4066 - CITY
      ?AUTO_4065 - TRUCK
      ?AUTO_4068 - LOCATION
      ?AUTO_4067 - AIRPLANE
      ?AUTO_4070 - TRUCK
      ?AUTO_4072 - LOCATION
      ?AUTO_4071 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4069 ?AUTO_4066 ) ( IN-CITY ?AUTO_4064 ?AUTO_4066 ) ( not ( = ?AUTO_4064 ?AUTO_4069 ) ) ( TRUCK-AT ?AUTO_4065 ?AUTO_4064 ) ( AIRPORT ?AUTO_4068 ) ( AIRPORT ?AUTO_4069 ) ( AIRPLANE-AT ?AUTO_4067 ?AUTO_4068 ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( not ( = ?AUTO_4064 ?AUTO_4068 ) ) ( IN-TRUCK ?AUTO_4063 ?AUTO_4070 ) ( not ( = ?AUTO_4065 ?AUTO_4070 ) ) ( TRUCK-AT ?AUTO_4070 ?AUTO_4072 ) ( IN-CITY ?AUTO_4072 ?AUTO_4071 ) ( IN-CITY ?AUTO_4068 ?AUTO_4071 ) ( not ( = ?AUTO_4068 ?AUTO_4072 ) ) ( not ( = ?AUTO_4064 ?AUTO_4072 ) ) ( not ( = ?AUTO_4069 ?AUTO_4072 ) ) ( not ( = ?AUTO_4066 ?AUTO_4071 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4070 ?AUTO_4072 ?AUTO_4068 ?AUTO_4071 )
      ( DELIVER-PKG ?AUTO_4063 ?AUTO_4064 )
      ( DELIVER-PKG-VERIFY ?AUTO_4063 ?AUTO_4064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4075 - OBJ
      ?AUTO_4076 - LOCATION
    )
    :vars
    (
      ?AUTO_4083 - LOCATION
      ?AUTO_4084 - CITY
      ?AUTO_4078 - TRUCK
      ?AUTO_4079 - LOCATION
      ?AUTO_4081 - AIRPLANE
      ?AUTO_4080 - TRUCK
      ?AUTO_4082 - LOCATION
      ?AUTO_4077 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4083 ?AUTO_4084 ) ( IN-CITY ?AUTO_4076 ?AUTO_4084 ) ( not ( = ?AUTO_4076 ?AUTO_4083 ) ) ( TRUCK-AT ?AUTO_4078 ?AUTO_4076 ) ( AIRPORT ?AUTO_4079 ) ( AIRPORT ?AUTO_4083 ) ( AIRPLANE-AT ?AUTO_4081 ?AUTO_4079 ) ( not ( = ?AUTO_4079 ?AUTO_4083 ) ) ( not ( = ?AUTO_4076 ?AUTO_4079 ) ) ( not ( = ?AUTO_4078 ?AUTO_4080 ) ) ( TRUCK-AT ?AUTO_4080 ?AUTO_4082 ) ( IN-CITY ?AUTO_4082 ?AUTO_4077 ) ( IN-CITY ?AUTO_4079 ?AUTO_4077 ) ( not ( = ?AUTO_4079 ?AUTO_4082 ) ) ( not ( = ?AUTO_4076 ?AUTO_4082 ) ) ( not ( = ?AUTO_4083 ?AUTO_4082 ) ) ( not ( = ?AUTO_4084 ?AUTO_4077 ) ) ( OBJ-AT ?AUTO_4075 ?AUTO_4082 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4075 ?AUTO_4080 ?AUTO_4082 )
      ( DELIVER-PKG ?AUTO_4075 ?AUTO_4076 )
      ( DELIVER-PKG-VERIFY ?AUTO_4075 ?AUTO_4076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4085 - OBJ
      ?AUTO_4086 - LOCATION
    )
    :vars
    (
      ?AUTO_4094 - LOCATION
      ?AUTO_4093 - CITY
      ?AUTO_4088 - TRUCK
      ?AUTO_4092 - LOCATION
      ?AUTO_4089 - AIRPLANE
      ?AUTO_4091 - TRUCK
      ?AUTO_4087 - LOCATION
      ?AUTO_4090 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4094 ?AUTO_4093 ) ( IN-CITY ?AUTO_4086 ?AUTO_4093 ) ( not ( = ?AUTO_4086 ?AUTO_4094 ) ) ( TRUCK-AT ?AUTO_4088 ?AUTO_4086 ) ( AIRPORT ?AUTO_4092 ) ( AIRPORT ?AUTO_4094 ) ( AIRPLANE-AT ?AUTO_4089 ?AUTO_4092 ) ( not ( = ?AUTO_4092 ?AUTO_4094 ) ) ( not ( = ?AUTO_4086 ?AUTO_4092 ) ) ( not ( = ?AUTO_4088 ?AUTO_4091 ) ) ( IN-CITY ?AUTO_4087 ?AUTO_4090 ) ( IN-CITY ?AUTO_4092 ?AUTO_4090 ) ( not ( = ?AUTO_4092 ?AUTO_4087 ) ) ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( not ( = ?AUTO_4094 ?AUTO_4087 ) ) ( not ( = ?AUTO_4093 ?AUTO_4090 ) ) ( OBJ-AT ?AUTO_4085 ?AUTO_4087 ) ( TRUCK-AT ?AUTO_4091 ?AUTO_4092 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4091 ?AUTO_4092 ?AUTO_4087 ?AUTO_4090 )
      ( DELIVER-PKG ?AUTO_4085 ?AUTO_4086 )
      ( DELIVER-PKG-VERIFY ?AUTO_4085 ?AUTO_4086 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1935 - OBJ
      ?AUTO_1936 - LOCATION
    )
    :vars
    (
      ?AUTO_1937 - LOCATION
      ?AUTO_1938 - AIRPLANE
      ?AUTO_1939 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1937 ) ( AIRPORT ?AUTO_1936 ) ( not ( = ?AUTO_1937 ?AUTO_1936 ) ) ( AIRPLANE-AT ?AUTO_1938 ?AUTO_1936 ) ( TRUCK-AT ?AUTO_1939 ?AUTO_1937 ) ( IN-TRUCK ?AUTO_1935 ?AUTO_1939 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1935 ?AUTO_1939 ?AUTO_1937 )
      ( DELIVER-PKG ?AUTO_1935 ?AUTO_1936 )
      ( DELIVER-PKG-VERIFY ?AUTO_1935 ?AUTO_1936 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1940 - OBJ
      ?AUTO_1941 - LOCATION
    )
    :vars
    (
      ?AUTO_1942 - LOCATION
      ?AUTO_1943 - AIRPLANE
      ?AUTO_1944 - TRUCK
      ?AUTO_1946 - LOCATION
      ?AUTO_1945 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1942 ) ( AIRPORT ?AUTO_1941 ) ( not ( = ?AUTO_1942 ?AUTO_1941 ) ) ( AIRPLANE-AT ?AUTO_1943 ?AUTO_1941 ) ( IN-TRUCK ?AUTO_1940 ?AUTO_1944 ) ( TRUCK-AT ?AUTO_1944 ?AUTO_1946 ) ( IN-CITY ?AUTO_1946 ?AUTO_1945 ) ( IN-CITY ?AUTO_1942 ?AUTO_1945 ) ( not ( = ?AUTO_1942 ?AUTO_1946 ) ) ( not ( = ?AUTO_1941 ?AUTO_1946 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1944 ?AUTO_1946 ?AUTO_1942 ?AUTO_1945 )
      ( DELIVER-PKG ?AUTO_1940 ?AUTO_1941 )
      ( DELIVER-PKG-VERIFY ?AUTO_1940 ?AUTO_1941 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1947 - OBJ
      ?AUTO_1948 - LOCATION
    )
    :vars
    (
      ?AUTO_1951 - LOCATION
      ?AUTO_1950 - AIRPLANE
      ?AUTO_1952 - TRUCK
      ?AUTO_1953 - LOCATION
      ?AUTO_1949 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1951 ) ( AIRPORT ?AUTO_1948 ) ( not ( = ?AUTO_1951 ?AUTO_1948 ) ) ( AIRPLANE-AT ?AUTO_1950 ?AUTO_1948 ) ( TRUCK-AT ?AUTO_1952 ?AUTO_1953 ) ( IN-CITY ?AUTO_1953 ?AUTO_1949 ) ( IN-CITY ?AUTO_1951 ?AUTO_1949 ) ( not ( = ?AUTO_1951 ?AUTO_1953 ) ) ( not ( = ?AUTO_1948 ?AUTO_1953 ) ) ( OBJ-AT ?AUTO_1947 ?AUTO_1953 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1947 ?AUTO_1952 ?AUTO_1953 )
      ( DELIVER-PKG ?AUTO_1947 ?AUTO_1948 )
      ( DELIVER-PKG-VERIFY ?AUTO_1947 ?AUTO_1948 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1954 - OBJ
      ?AUTO_1955 - LOCATION
    )
    :vars
    (
      ?AUTO_1959 - LOCATION
      ?AUTO_1956 - AIRPLANE
      ?AUTO_1958 - LOCATION
      ?AUTO_1957 - CITY
      ?AUTO_1960 - TRUCK
      ?AUTO_1961 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1959 ) ( AIRPORT ?AUTO_1955 ) ( not ( = ?AUTO_1959 ?AUTO_1955 ) ) ( AIRPLANE-AT ?AUTO_1956 ?AUTO_1955 ) ( IN-CITY ?AUTO_1958 ?AUTO_1957 ) ( IN-CITY ?AUTO_1959 ?AUTO_1957 ) ( not ( = ?AUTO_1959 ?AUTO_1958 ) ) ( not ( = ?AUTO_1955 ?AUTO_1958 ) ) ( OBJ-AT ?AUTO_1954 ?AUTO_1958 ) ( TRUCK-AT ?AUTO_1960 ?AUTO_1961 ) ( IN-CITY ?AUTO_1961 ?AUTO_1957 ) ( not ( = ?AUTO_1958 ?AUTO_1961 ) ) ( not ( = ?AUTO_1955 ?AUTO_1961 ) ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1960 ?AUTO_1961 ?AUTO_1958 ?AUTO_1957 )
      ( DELIVER-PKG ?AUTO_1954 ?AUTO_1955 )
      ( DELIVER-PKG-VERIFY ?AUTO_1954 ?AUTO_1955 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2014 - OBJ
      ?AUTO_2015 - LOCATION
    )
    :vars
    (
      ?AUTO_2016 - LOCATION
      ?AUTO_2017 - LOCATION
      ?AUTO_2021 - AIRPLANE
      ?AUTO_2018 - LOCATION
      ?AUTO_2019 - CITY
      ?AUTO_2020 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2016 ) ( AIRPORT ?AUTO_2015 ) ( not ( = ?AUTO_2016 ?AUTO_2015 ) ) ( AIRPORT ?AUTO_2017 ) ( AIRPLANE-AT ?AUTO_2021 ?AUTO_2017 ) ( not ( = ?AUTO_2017 ?AUTO_2016 ) ) ( not ( = ?AUTO_2015 ?AUTO_2017 ) ) ( IN-CITY ?AUTO_2018 ?AUTO_2019 ) ( IN-CITY ?AUTO_2016 ?AUTO_2019 ) ( not ( = ?AUTO_2016 ?AUTO_2018 ) ) ( not ( = ?AUTO_2015 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) ( OBJ-AT ?AUTO_2014 ?AUTO_2018 ) ( TRUCK-AT ?AUTO_2020 ?AUTO_2016 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2020 ?AUTO_2016 ?AUTO_2018 ?AUTO_2019 )
      ( DELIVER-PKG ?AUTO_2014 ?AUTO_2015 )
      ( DELIVER-PKG-VERIFY ?AUTO_2014 ?AUTO_2015 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2347 - OBJ
      ?AUTO_2348 - LOCATION
    )
    :vars
    (
      ?AUTO_2351 - LOCATION
      ?AUTO_2349 - CITY
      ?AUTO_2354 - LOCATION
      ?AUTO_2352 - AIRPLANE
      ?AUTO_2353 - TRUCK
      ?AUTO_2350 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2351 ?AUTO_2349 ) ( IN-CITY ?AUTO_2348 ?AUTO_2349 ) ( not ( = ?AUTO_2348 ?AUTO_2351 ) ) ( AIRPORT ?AUTO_2354 ) ( AIRPORT ?AUTO_2351 ) ( AIRPLANE-AT ?AUTO_2352 ?AUTO_2354 ) ( not ( = ?AUTO_2354 ?AUTO_2351 ) ) ( not ( = ?AUTO_2348 ?AUTO_2354 ) ) ( TRUCK-AT ?AUTO_2353 ?AUTO_2350 ) ( IN-CITY ?AUTO_2350 ?AUTO_2349 ) ( not ( = ?AUTO_2351 ?AUTO_2350 ) ) ( not ( = ?AUTO_2348 ?AUTO_2350 ) ) ( not ( = ?AUTO_2354 ?AUTO_2350 ) ) ( OBJ-AT ?AUTO_2347 ?AUTO_2354 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2347 ?AUTO_2352 ?AUTO_2354 )
      ( DELIVER-PKG ?AUTO_2347 ?AUTO_2348 )
      ( DELIVER-PKG-VERIFY ?AUTO_2347 ?AUTO_2348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2970 - OBJ
      ?AUTO_2971 - LOCATION
    )
    :vars
    (
      ?AUTO_2975 - LOCATION
      ?AUTO_2972 - CITY
      ?AUTO_2974 - TRUCK
      ?AUTO_2973 - LOCATION
      ?AUTO_2976 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2975 ?AUTO_2972 ) ( IN-CITY ?AUTO_2971 ?AUTO_2972 ) ( not ( = ?AUTO_2971 ?AUTO_2975 ) ) ( TRUCK-AT ?AUTO_2974 ?AUTO_2973 ) ( IN-CITY ?AUTO_2973 ?AUTO_2972 ) ( not ( = ?AUTO_2975 ?AUTO_2973 ) ) ( not ( = ?AUTO_2971 ?AUTO_2973 ) ) ( IN-AIRPLANE ?AUTO_2970 ?AUTO_2976 ) ( AIRPLANE-AT ?AUTO_2976 ?AUTO_2975 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2970 ?AUTO_2976 ?AUTO_2975 )
      ( DELIVER-PKG ?AUTO_2970 ?AUTO_2971 )
      ( DELIVER-PKG-VERIFY ?AUTO_2970 ?AUTO_2971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2977 - OBJ
      ?AUTO_2978 - LOCATION
    )
    :vars
    (
      ?AUTO_2983 - LOCATION
      ?AUTO_2982 - CITY
      ?AUTO_2981 - TRUCK
      ?AUTO_2979 - LOCATION
      ?AUTO_2980 - AIRPLANE
      ?AUTO_2984 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2983 ?AUTO_2982 ) ( IN-CITY ?AUTO_2978 ?AUTO_2982 ) ( not ( = ?AUTO_2978 ?AUTO_2983 ) ) ( TRUCK-AT ?AUTO_2981 ?AUTO_2979 ) ( IN-CITY ?AUTO_2979 ?AUTO_2982 ) ( not ( = ?AUTO_2983 ?AUTO_2979 ) ) ( not ( = ?AUTO_2978 ?AUTO_2979 ) ) ( IN-AIRPLANE ?AUTO_2977 ?AUTO_2980 ) ( AIRPORT ?AUTO_2984 ) ( AIRPORT ?AUTO_2983 ) ( AIRPLANE-AT ?AUTO_2980 ?AUTO_2984 ) ( not ( = ?AUTO_2984 ?AUTO_2983 ) ) ( not ( = ?AUTO_2978 ?AUTO_2984 ) ) ( not ( = ?AUTO_2979 ?AUTO_2984 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2980 ?AUTO_2984 ?AUTO_2983 )
      ( DELIVER-PKG ?AUTO_2977 ?AUTO_2978 )
      ( DELIVER-PKG-VERIFY ?AUTO_2977 ?AUTO_2978 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3005 - OBJ
      ?AUTO_3006 - LOCATION
    )
    :vars
    (
      ?AUTO_3010 - LOCATION
      ?AUTO_3009 - CITY
      ?AUTO_3011 - TRUCK
      ?AUTO_3007 - LOCATION
      ?AUTO_3008 - LOCATION
      ?AUTO_3013 - LOCATION
      ?AUTO_3012 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3010 ?AUTO_3009 ) ( IN-CITY ?AUTO_3006 ?AUTO_3009 ) ( not ( = ?AUTO_3006 ?AUTO_3010 ) ) ( TRUCK-AT ?AUTO_3011 ?AUTO_3007 ) ( IN-CITY ?AUTO_3007 ?AUTO_3009 ) ( not ( = ?AUTO_3010 ?AUTO_3007 ) ) ( not ( = ?AUTO_3006 ?AUTO_3007 ) ) ( AIRPORT ?AUTO_3008 ) ( AIRPORT ?AUTO_3010 ) ( not ( = ?AUTO_3008 ?AUTO_3010 ) ) ( not ( = ?AUTO_3006 ?AUTO_3008 ) ) ( not ( = ?AUTO_3007 ?AUTO_3008 ) ) ( OBJ-AT ?AUTO_3005 ?AUTO_3008 ) ( AIRPORT ?AUTO_3013 ) ( AIRPLANE-AT ?AUTO_3012 ?AUTO_3013 ) ( not ( = ?AUTO_3013 ?AUTO_3008 ) ) ( not ( = ?AUTO_3006 ?AUTO_3013 ) ) ( not ( = ?AUTO_3010 ?AUTO_3013 ) ) ( not ( = ?AUTO_3007 ?AUTO_3013 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3012 ?AUTO_3013 ?AUTO_3008 )
      ( DELIVER-PKG ?AUTO_3005 ?AUTO_3006 )
      ( DELIVER-PKG-VERIFY ?AUTO_3005 ?AUTO_3006 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3112 - OBJ
      ?AUTO_3113 - LOCATION
    )
    :vars
    (
      ?AUTO_3116 - TRUCK
      ?AUTO_3117 - LOCATION
      ?AUTO_3118 - CITY
      ?AUTO_3114 - LOCATION
      ?AUTO_3115 - AIRPLANE
      ?AUTO_3119 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3116 ?AUTO_3117 ) ( IN-CITY ?AUTO_3117 ?AUTO_3118 ) ( IN-CITY ?AUTO_3113 ?AUTO_3118 ) ( not ( = ?AUTO_3113 ?AUTO_3117 ) ) ( AIRPORT ?AUTO_3114 ) ( AIRPORT ?AUTO_3117 ) ( AIRPLANE-AT ?AUTO_3115 ?AUTO_3114 ) ( not ( = ?AUTO_3114 ?AUTO_3117 ) ) ( not ( = ?AUTO_3113 ?AUTO_3114 ) ) ( TRUCK-AT ?AUTO_3119 ?AUTO_3114 ) ( IN-TRUCK ?AUTO_3112 ?AUTO_3119 ) ( not ( = ?AUTO_3116 ?AUTO_3119 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3112 ?AUTO_3119 ?AUTO_3114 )
      ( DELIVER-PKG ?AUTO_3112 ?AUTO_3113 )
      ( DELIVER-PKG-VERIFY ?AUTO_3112 ?AUTO_3113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3120 - OBJ
      ?AUTO_3121 - LOCATION
    )
    :vars
    (
      ?AUTO_3125 - TRUCK
      ?AUTO_3127 - LOCATION
      ?AUTO_3122 - CITY
      ?AUTO_3123 - LOCATION
      ?AUTO_3126 - AIRPLANE
      ?AUTO_3124 - TRUCK
      ?AUTO_3129 - LOCATION
      ?AUTO_3128 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3125 ?AUTO_3127 ) ( IN-CITY ?AUTO_3127 ?AUTO_3122 ) ( IN-CITY ?AUTO_3121 ?AUTO_3122 ) ( not ( = ?AUTO_3121 ?AUTO_3127 ) ) ( AIRPORT ?AUTO_3123 ) ( AIRPORT ?AUTO_3127 ) ( AIRPLANE-AT ?AUTO_3126 ?AUTO_3123 ) ( not ( = ?AUTO_3123 ?AUTO_3127 ) ) ( not ( = ?AUTO_3121 ?AUTO_3123 ) ) ( IN-TRUCK ?AUTO_3120 ?AUTO_3124 ) ( not ( = ?AUTO_3125 ?AUTO_3124 ) ) ( TRUCK-AT ?AUTO_3124 ?AUTO_3129 ) ( IN-CITY ?AUTO_3129 ?AUTO_3128 ) ( IN-CITY ?AUTO_3123 ?AUTO_3128 ) ( not ( = ?AUTO_3123 ?AUTO_3129 ) ) ( not ( = ?AUTO_3121 ?AUTO_3129 ) ) ( not ( = ?AUTO_3127 ?AUTO_3129 ) ) ( not ( = ?AUTO_3122 ?AUTO_3128 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3124 ?AUTO_3129 ?AUTO_3123 ?AUTO_3128 )
      ( DELIVER-PKG ?AUTO_3120 ?AUTO_3121 )
      ( DELIVER-PKG-VERIFY ?AUTO_3120 ?AUTO_3121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3172 - OBJ
      ?AUTO_3173 - LOCATION
    )
    :vars
    (
      ?AUTO_3179 - LOCATION
      ?AUTO_3174 - CITY
      ?AUTO_3180 - LOCATION
      ?AUTO_3181 - AIRPLANE
      ?AUTO_3177 - TRUCK
      ?AUTO_3176 - TRUCK
      ?AUTO_3175 - LOCATION
      ?AUTO_3178 - CITY
      ?AUTO_3182 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3179 ?AUTO_3174 ) ( IN-CITY ?AUTO_3173 ?AUTO_3174 ) ( not ( = ?AUTO_3173 ?AUTO_3179 ) ) ( AIRPORT ?AUTO_3180 ) ( AIRPORT ?AUTO_3179 ) ( AIRPLANE-AT ?AUTO_3181 ?AUTO_3180 ) ( not ( = ?AUTO_3180 ?AUTO_3179 ) ) ( not ( = ?AUTO_3173 ?AUTO_3180 ) ) ( IN-TRUCK ?AUTO_3172 ?AUTO_3177 ) ( not ( = ?AUTO_3176 ?AUTO_3177 ) ) ( TRUCK-AT ?AUTO_3177 ?AUTO_3175 ) ( IN-CITY ?AUTO_3175 ?AUTO_3178 ) ( IN-CITY ?AUTO_3180 ?AUTO_3178 ) ( not ( = ?AUTO_3180 ?AUTO_3175 ) ) ( not ( = ?AUTO_3173 ?AUTO_3175 ) ) ( not ( = ?AUTO_3179 ?AUTO_3175 ) ) ( not ( = ?AUTO_3174 ?AUTO_3178 ) ) ( TRUCK-AT ?AUTO_3176 ?AUTO_3182 ) ( IN-CITY ?AUTO_3182 ?AUTO_3174 ) ( not ( = ?AUTO_3179 ?AUTO_3182 ) ) ( not ( = ?AUTO_3173 ?AUTO_3182 ) ) ( not ( = ?AUTO_3180 ?AUTO_3182 ) ) ( not ( = ?AUTO_3175 ?AUTO_3182 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3176 ?AUTO_3182 ?AUTO_3179 ?AUTO_3174 )
      ( DELIVER-PKG ?AUTO_3172 ?AUTO_3173 )
      ( DELIVER-PKG-VERIFY ?AUTO_3172 ?AUTO_3173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3201 - OBJ
      ?AUTO_3202 - LOCATION
    )
    :vars
    (
      ?AUTO_3210 - LOCATION
      ?AUTO_3203 - CITY
      ?AUTO_3207 - LOCATION
      ?AUTO_3206 - AIRPLANE
      ?AUTO_3204 - TRUCK
      ?AUTO_3209 - TRUCK
      ?AUTO_3208 - LOCATION
      ?AUTO_3205 - CITY
      ?AUTO_3211 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3210 ?AUTO_3203 ) ( IN-CITY ?AUTO_3202 ?AUTO_3203 ) ( not ( = ?AUTO_3202 ?AUTO_3210 ) ) ( AIRPORT ?AUTO_3207 ) ( AIRPORT ?AUTO_3210 ) ( AIRPLANE-AT ?AUTO_3206 ?AUTO_3207 ) ( not ( = ?AUTO_3207 ?AUTO_3210 ) ) ( not ( = ?AUTO_3202 ?AUTO_3207 ) ) ( not ( = ?AUTO_3204 ?AUTO_3209 ) ) ( TRUCK-AT ?AUTO_3209 ?AUTO_3208 ) ( IN-CITY ?AUTO_3208 ?AUTO_3205 ) ( IN-CITY ?AUTO_3207 ?AUTO_3205 ) ( not ( = ?AUTO_3207 ?AUTO_3208 ) ) ( not ( = ?AUTO_3202 ?AUTO_3208 ) ) ( not ( = ?AUTO_3210 ?AUTO_3208 ) ) ( not ( = ?AUTO_3203 ?AUTO_3205 ) ) ( TRUCK-AT ?AUTO_3204 ?AUTO_3211 ) ( IN-CITY ?AUTO_3211 ?AUTO_3203 ) ( not ( = ?AUTO_3210 ?AUTO_3211 ) ) ( not ( = ?AUTO_3202 ?AUTO_3211 ) ) ( not ( = ?AUTO_3207 ?AUTO_3211 ) ) ( not ( = ?AUTO_3208 ?AUTO_3211 ) ) ( OBJ-AT ?AUTO_3201 ?AUTO_3208 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3201 ?AUTO_3209 ?AUTO_3208 )
      ( DELIVER-PKG ?AUTO_3201 ?AUTO_3202 )
      ( DELIVER-PKG-VERIFY ?AUTO_3201 ?AUTO_3202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3320 - OBJ
      ?AUTO_3321 - LOCATION
    )
    :vars
    (
      ?AUTO_3324 - LOCATION
      ?AUTO_3325 - CITY
      ?AUTO_3327 - TRUCK
      ?AUTO_3326 - LOCATION
      ?AUTO_3322 - LOCATION
      ?AUTO_3328 - LOCATION
      ?AUTO_3323 - AIRPLANE
      ?AUTO_3329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3324 ?AUTO_3325 ) ( IN-CITY ?AUTO_3321 ?AUTO_3325 ) ( not ( = ?AUTO_3321 ?AUTO_3324 ) ) ( TRUCK-AT ?AUTO_3327 ?AUTO_3326 ) ( IN-CITY ?AUTO_3326 ?AUTO_3325 ) ( not ( = ?AUTO_3324 ?AUTO_3326 ) ) ( not ( = ?AUTO_3321 ?AUTO_3326 ) ) ( AIRPORT ?AUTO_3322 ) ( AIRPORT ?AUTO_3324 ) ( not ( = ?AUTO_3322 ?AUTO_3324 ) ) ( not ( = ?AUTO_3321 ?AUTO_3322 ) ) ( not ( = ?AUTO_3326 ?AUTO_3322 ) ) ( AIRPORT ?AUTO_3328 ) ( AIRPLANE-AT ?AUTO_3323 ?AUTO_3328 ) ( not ( = ?AUTO_3328 ?AUTO_3322 ) ) ( not ( = ?AUTO_3321 ?AUTO_3328 ) ) ( not ( = ?AUTO_3324 ?AUTO_3328 ) ) ( not ( = ?AUTO_3326 ?AUTO_3328 ) ) ( TRUCK-AT ?AUTO_3329 ?AUTO_3322 ) ( IN-TRUCK ?AUTO_3320 ?AUTO_3329 ) ( not ( = ?AUTO_3327 ?AUTO_3329 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3320 ?AUTO_3329 ?AUTO_3322 )
      ( DELIVER-PKG ?AUTO_3320 ?AUTO_3321 )
      ( DELIVER-PKG-VERIFY ?AUTO_3320 ?AUTO_3321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3330 - OBJ
      ?AUTO_3331 - LOCATION
    )
    :vars
    (
      ?AUTO_3337 - LOCATION
      ?AUTO_3336 - CITY
      ?AUTO_3332 - TRUCK
      ?AUTO_3335 - LOCATION
      ?AUTO_3339 - LOCATION
      ?AUTO_3338 - LOCATION
      ?AUTO_3333 - AIRPLANE
      ?AUTO_3334 - TRUCK
      ?AUTO_3341 - LOCATION
      ?AUTO_3340 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3337 ?AUTO_3336 ) ( IN-CITY ?AUTO_3331 ?AUTO_3336 ) ( not ( = ?AUTO_3331 ?AUTO_3337 ) ) ( TRUCK-AT ?AUTO_3332 ?AUTO_3335 ) ( IN-CITY ?AUTO_3335 ?AUTO_3336 ) ( not ( = ?AUTO_3337 ?AUTO_3335 ) ) ( not ( = ?AUTO_3331 ?AUTO_3335 ) ) ( AIRPORT ?AUTO_3339 ) ( AIRPORT ?AUTO_3337 ) ( not ( = ?AUTO_3339 ?AUTO_3337 ) ) ( not ( = ?AUTO_3331 ?AUTO_3339 ) ) ( not ( = ?AUTO_3335 ?AUTO_3339 ) ) ( AIRPORT ?AUTO_3338 ) ( AIRPLANE-AT ?AUTO_3333 ?AUTO_3338 ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) ( not ( = ?AUTO_3331 ?AUTO_3338 ) ) ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) ( not ( = ?AUTO_3335 ?AUTO_3338 ) ) ( IN-TRUCK ?AUTO_3330 ?AUTO_3334 ) ( not ( = ?AUTO_3332 ?AUTO_3334 ) ) ( TRUCK-AT ?AUTO_3334 ?AUTO_3341 ) ( IN-CITY ?AUTO_3341 ?AUTO_3340 ) ( IN-CITY ?AUTO_3339 ?AUTO_3340 ) ( not ( = ?AUTO_3339 ?AUTO_3341 ) ) ( not ( = ?AUTO_3331 ?AUTO_3341 ) ) ( not ( = ?AUTO_3337 ?AUTO_3341 ) ) ( not ( = ?AUTO_3336 ?AUTO_3340 ) ) ( not ( = ?AUTO_3335 ?AUTO_3341 ) ) ( not ( = ?AUTO_3338 ?AUTO_3341 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3334 ?AUTO_3341 ?AUTO_3339 ?AUTO_3340 )
      ( DELIVER-PKG ?AUTO_3330 ?AUTO_3331 )
      ( DELIVER-PKG-VERIFY ?AUTO_3330 ?AUTO_3331 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3344 - OBJ
      ?AUTO_3345 - LOCATION
    )
    :vars
    (
      ?AUTO_3348 - LOCATION
      ?AUTO_3347 - CITY
      ?AUTO_3349 - TRUCK
      ?AUTO_3355 - LOCATION
      ?AUTO_3352 - LOCATION
      ?AUTO_3353 - LOCATION
      ?AUTO_3350 - AIRPLANE
      ?AUTO_3351 - TRUCK
      ?AUTO_3346 - LOCATION
      ?AUTO_3354 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3348 ?AUTO_3347 ) ( IN-CITY ?AUTO_3345 ?AUTO_3347 ) ( not ( = ?AUTO_3345 ?AUTO_3348 ) ) ( TRUCK-AT ?AUTO_3349 ?AUTO_3355 ) ( IN-CITY ?AUTO_3355 ?AUTO_3347 ) ( not ( = ?AUTO_3348 ?AUTO_3355 ) ) ( not ( = ?AUTO_3345 ?AUTO_3355 ) ) ( AIRPORT ?AUTO_3352 ) ( AIRPORT ?AUTO_3348 ) ( not ( = ?AUTO_3352 ?AUTO_3348 ) ) ( not ( = ?AUTO_3345 ?AUTO_3352 ) ) ( not ( = ?AUTO_3355 ?AUTO_3352 ) ) ( AIRPORT ?AUTO_3353 ) ( AIRPLANE-AT ?AUTO_3350 ?AUTO_3353 ) ( not ( = ?AUTO_3353 ?AUTO_3352 ) ) ( not ( = ?AUTO_3345 ?AUTO_3353 ) ) ( not ( = ?AUTO_3348 ?AUTO_3353 ) ) ( not ( = ?AUTO_3355 ?AUTO_3353 ) ) ( not ( = ?AUTO_3349 ?AUTO_3351 ) ) ( TRUCK-AT ?AUTO_3351 ?AUTO_3346 ) ( IN-CITY ?AUTO_3346 ?AUTO_3354 ) ( IN-CITY ?AUTO_3352 ?AUTO_3354 ) ( not ( = ?AUTO_3352 ?AUTO_3346 ) ) ( not ( = ?AUTO_3345 ?AUTO_3346 ) ) ( not ( = ?AUTO_3348 ?AUTO_3346 ) ) ( not ( = ?AUTO_3347 ?AUTO_3354 ) ) ( not ( = ?AUTO_3355 ?AUTO_3346 ) ) ( not ( = ?AUTO_3353 ?AUTO_3346 ) ) ( OBJ-AT ?AUTO_3344 ?AUTO_3346 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3344 ?AUTO_3351 ?AUTO_3346 )
      ( DELIVER-PKG ?AUTO_3344 ?AUTO_3345 )
      ( DELIVER-PKG-VERIFY ?AUTO_3344 ?AUTO_3345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4190 - OBJ
      ?AUTO_4191 - LOCATION
    )
    :vars
    (
      ?AUTO_4195 - LOCATION
      ?AUTO_4192 - CITY
      ?AUTO_4194 - TRUCK
      ?AUTO_4196 - LOCATION
      ?AUTO_4197 - LOCATION
      ?AUTO_4199 - AIRPLANE
      ?AUTO_4193 - TRUCK
      ?AUTO_4198 - LOCATION
      ?AUTO_4200 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4195 ?AUTO_4192 ) ( IN-CITY ?AUTO_4191 ?AUTO_4192 ) ( not ( = ?AUTO_4191 ?AUTO_4195 ) ) ( TRUCK-AT ?AUTO_4194 ?AUTO_4196 ) ( IN-CITY ?AUTO_4196 ?AUTO_4192 ) ( not ( = ?AUTO_4195 ?AUTO_4196 ) ) ( not ( = ?AUTO_4191 ?AUTO_4196 ) ) ( AIRPORT ?AUTO_4197 ) ( AIRPORT ?AUTO_4195 ) ( AIRPLANE-AT ?AUTO_4199 ?AUTO_4197 ) ( not ( = ?AUTO_4197 ?AUTO_4195 ) ) ( not ( = ?AUTO_4191 ?AUTO_4197 ) ) ( not ( = ?AUTO_4196 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4193 ) ) ( IN-CITY ?AUTO_4198 ?AUTO_4200 ) ( IN-CITY ?AUTO_4197 ?AUTO_4200 ) ( not ( = ?AUTO_4197 ?AUTO_4198 ) ) ( not ( = ?AUTO_4191 ?AUTO_4198 ) ) ( not ( = ?AUTO_4195 ?AUTO_4198 ) ) ( not ( = ?AUTO_4192 ?AUTO_4200 ) ) ( not ( = ?AUTO_4196 ?AUTO_4198 ) ) ( OBJ-AT ?AUTO_4190 ?AUTO_4198 ) ( TRUCK-AT ?AUTO_4193 ?AUTO_4197 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4193 ?AUTO_4197 ?AUTO_4198 ?AUTO_4200 )
      ( DELIVER-PKG ?AUTO_4190 ?AUTO_4191 )
      ( DELIVER-PKG-VERIFY ?AUTO_4190 ?AUTO_4191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3481 - OBJ
      ?AUTO_3482 - LOCATION
    )
    :vars
    (
      ?AUTO_3484 - LOCATION
      ?AUTO_3486 - CITY
      ?AUTO_3485 - LOCATION
      ?AUTO_3483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3484 ?AUTO_3486 ) ( IN-CITY ?AUTO_3482 ?AUTO_3486 ) ( not ( = ?AUTO_3482 ?AUTO_3484 ) ) ( OBJ-AT ?AUTO_3481 ?AUTO_3484 ) ( IN-CITY ?AUTO_3485 ?AUTO_3486 ) ( not ( = ?AUTO_3484 ?AUTO_3485 ) ) ( not ( = ?AUTO_3482 ?AUTO_3485 ) ) ( TRUCK-AT ?AUTO_3483 ?AUTO_3482 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3483 ?AUTO_3482 ?AUTO_3485 ?AUTO_3486 )
      ( DELIVER-PKG ?AUTO_3481 ?AUTO_3482 )
      ( DELIVER-PKG-VERIFY ?AUTO_3481 ?AUTO_3482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3824 - OBJ
      ?AUTO_3825 - LOCATION
    )
    :vars
    (
      ?AUTO_3828 - LOCATION
      ?AUTO_3834 - CITY
      ?AUTO_3833 - LOCATION
      ?AUTO_3830 - LOCATION
      ?AUTO_3835 - AIRPLANE
      ?AUTO_3829 - TRUCK
      ?AUTO_3826 - TRUCK
      ?AUTO_3827 - LOCATION
      ?AUTO_3831 - CITY
      ?AUTO_3832 - LOCATION
      ?AUTO_3836 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3828 ?AUTO_3834 ) ( IN-CITY ?AUTO_3825 ?AUTO_3834 ) ( not ( = ?AUTO_3825 ?AUTO_3828 ) ) ( AIRPORT ?AUTO_3833 ) ( AIRPORT ?AUTO_3828 ) ( not ( = ?AUTO_3833 ?AUTO_3828 ) ) ( not ( = ?AUTO_3825 ?AUTO_3833 ) ) ( AIRPORT ?AUTO_3830 ) ( AIRPLANE-AT ?AUTO_3835 ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3833 ) ) ( not ( = ?AUTO_3825 ?AUTO_3830 ) ) ( not ( = ?AUTO_3828 ?AUTO_3830 ) ) ( not ( = ?AUTO_3829 ?AUTO_3826 ) ) ( IN-CITY ?AUTO_3827 ?AUTO_3831 ) ( IN-CITY ?AUTO_3833 ?AUTO_3831 ) ( not ( = ?AUTO_3833 ?AUTO_3827 ) ) ( not ( = ?AUTO_3825 ?AUTO_3827 ) ) ( not ( = ?AUTO_3828 ?AUTO_3827 ) ) ( not ( = ?AUTO_3834 ?AUTO_3831 ) ) ( not ( = ?AUTO_3830 ?AUTO_3827 ) ) ( OBJ-AT ?AUTO_3824 ?AUTO_3827 ) ( TRUCK-AT ?AUTO_3826 ?AUTO_3832 ) ( IN-CITY ?AUTO_3832 ?AUTO_3831 ) ( not ( = ?AUTO_3827 ?AUTO_3832 ) ) ( not ( = ?AUTO_3825 ?AUTO_3832 ) ) ( not ( = ?AUTO_3828 ?AUTO_3832 ) ) ( not ( = ?AUTO_3833 ?AUTO_3832 ) ) ( not ( = ?AUTO_3830 ?AUTO_3832 ) ) ( TRUCK-AT ?AUTO_3829 ?AUTO_3836 ) ( IN-CITY ?AUTO_3836 ?AUTO_3834 ) ( not ( = ?AUTO_3828 ?AUTO_3836 ) ) ( not ( = ?AUTO_3825 ?AUTO_3836 ) ) ( not ( = ?AUTO_3833 ?AUTO_3836 ) ) ( not ( = ?AUTO_3830 ?AUTO_3836 ) ) ( not ( = ?AUTO_3827 ?AUTO_3836 ) ) ( not ( = ?AUTO_3832 ?AUTO_3836 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3829 ?AUTO_3836 ?AUTO_3828 ?AUTO_3834 )
      ( DELIVER-PKG ?AUTO_3824 ?AUTO_3825 )
      ( DELIVER-PKG-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4155 - OBJ
      ?AUTO_4156 - LOCATION
    )
    :vars
    (
      ?AUTO_4161 - LOCATION
      ?AUTO_4162 - CITY
      ?AUTO_4158 - TRUCK
      ?AUTO_4159 - LOCATION
      ?AUTO_4157 - LOCATION
      ?AUTO_4160 - AIRPLANE
      ?AUTO_4163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4161 ?AUTO_4162 ) ( IN-CITY ?AUTO_4156 ?AUTO_4162 ) ( not ( = ?AUTO_4156 ?AUTO_4161 ) ) ( TRUCK-AT ?AUTO_4158 ?AUTO_4159 ) ( IN-CITY ?AUTO_4159 ?AUTO_4162 ) ( not ( = ?AUTO_4161 ?AUTO_4159 ) ) ( not ( = ?AUTO_4156 ?AUTO_4159 ) ) ( AIRPORT ?AUTO_4157 ) ( AIRPORT ?AUTO_4161 ) ( AIRPLANE-AT ?AUTO_4160 ?AUTO_4157 ) ( not ( = ?AUTO_4157 ?AUTO_4161 ) ) ( not ( = ?AUTO_4156 ?AUTO_4157 ) ) ( not ( = ?AUTO_4159 ?AUTO_4157 ) ) ( TRUCK-AT ?AUTO_4163 ?AUTO_4157 ) ( IN-TRUCK ?AUTO_4155 ?AUTO_4163 ) ( not ( = ?AUTO_4158 ?AUTO_4163 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4155 ?AUTO_4163 ?AUTO_4157 )
      ( DELIVER-PKG ?AUTO_4155 ?AUTO_4156 )
      ( DELIVER-PKG-VERIFY ?AUTO_4155 ?AUTO_4156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4166 - OBJ
      ?AUTO_4167 - LOCATION
    )
    :vars
    (
      ?AUTO_4173 - LOCATION
      ?AUTO_4168 - CITY
      ?AUTO_4171 - TRUCK
      ?AUTO_4170 - LOCATION
      ?AUTO_4169 - LOCATION
      ?AUTO_4172 - AIRPLANE
      ?AUTO_4174 - TRUCK
      ?AUTO_4176 - LOCATION
      ?AUTO_4175 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4173 ?AUTO_4168 ) ( IN-CITY ?AUTO_4167 ?AUTO_4168 ) ( not ( = ?AUTO_4167 ?AUTO_4173 ) ) ( TRUCK-AT ?AUTO_4171 ?AUTO_4170 ) ( IN-CITY ?AUTO_4170 ?AUTO_4168 ) ( not ( = ?AUTO_4173 ?AUTO_4170 ) ) ( not ( = ?AUTO_4167 ?AUTO_4170 ) ) ( AIRPORT ?AUTO_4169 ) ( AIRPORT ?AUTO_4173 ) ( AIRPLANE-AT ?AUTO_4172 ?AUTO_4169 ) ( not ( = ?AUTO_4169 ?AUTO_4173 ) ) ( not ( = ?AUTO_4167 ?AUTO_4169 ) ) ( not ( = ?AUTO_4170 ?AUTO_4169 ) ) ( IN-TRUCK ?AUTO_4166 ?AUTO_4174 ) ( not ( = ?AUTO_4171 ?AUTO_4174 ) ) ( TRUCK-AT ?AUTO_4174 ?AUTO_4176 ) ( IN-CITY ?AUTO_4176 ?AUTO_4175 ) ( IN-CITY ?AUTO_4169 ?AUTO_4175 ) ( not ( = ?AUTO_4169 ?AUTO_4176 ) ) ( not ( = ?AUTO_4167 ?AUTO_4176 ) ) ( not ( = ?AUTO_4173 ?AUTO_4176 ) ) ( not ( = ?AUTO_4168 ?AUTO_4175 ) ) ( not ( = ?AUTO_4170 ?AUTO_4176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4174 ?AUTO_4176 ?AUTO_4169 ?AUTO_4175 )
      ( DELIVER-PKG ?AUTO_4166 ?AUTO_4167 )
      ( DELIVER-PKG-VERIFY ?AUTO_4166 ?AUTO_4167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4352 - OBJ
      ?AUTO_4353 - LOCATION
    )
    :vars
    (
      ?AUTO_4355 - LOCATION
      ?AUTO_4356 - CITY
      ?AUTO_4354 - TRUCK
      ?AUTO_4357 - LOCATION
      ?AUTO_4359 - LOCATION
      ?AUTO_4358 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4355 ?AUTO_4356 ) ( IN-CITY ?AUTO_4353 ?AUTO_4356 ) ( not ( = ?AUTO_4353 ?AUTO_4355 ) ) ( TRUCK-AT ?AUTO_4354 ?AUTO_4353 ) ( AIRPORT ?AUTO_4357 ) ( AIRPORT ?AUTO_4355 ) ( not ( = ?AUTO_4357 ?AUTO_4355 ) ) ( not ( = ?AUTO_4353 ?AUTO_4357 ) ) ( OBJ-AT ?AUTO_4352 ?AUTO_4357 ) ( AIRPORT ?AUTO_4359 ) ( AIRPLANE-AT ?AUTO_4358 ?AUTO_4359 ) ( not ( = ?AUTO_4359 ?AUTO_4357 ) ) ( not ( = ?AUTO_4353 ?AUTO_4359 ) ) ( not ( = ?AUTO_4355 ?AUTO_4359 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4358 ?AUTO_4359 ?AUTO_4357 )
      ( DELIVER-PKG ?AUTO_4352 ?AUTO_4353 )
      ( DELIVER-PKG-VERIFY ?AUTO_4352 ?AUTO_4353 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4360 - OBJ
      ?AUTO_4361 - LOCATION
    )
    :vars
    (
      ?AUTO_4365 - LOCATION
      ?AUTO_4363 - CITY
      ?AUTO_4366 - TRUCK
      ?AUTO_4364 - LOCATION
      ?AUTO_4367 - LOCATION
      ?AUTO_4362 - AIRPLANE
      ?AUTO_4368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4365 ?AUTO_4363 ) ( IN-CITY ?AUTO_4361 ?AUTO_4363 ) ( not ( = ?AUTO_4361 ?AUTO_4365 ) ) ( TRUCK-AT ?AUTO_4366 ?AUTO_4361 ) ( AIRPORT ?AUTO_4364 ) ( AIRPORT ?AUTO_4365 ) ( not ( = ?AUTO_4364 ?AUTO_4365 ) ) ( not ( = ?AUTO_4361 ?AUTO_4364 ) ) ( AIRPORT ?AUTO_4367 ) ( AIRPLANE-AT ?AUTO_4362 ?AUTO_4367 ) ( not ( = ?AUTO_4367 ?AUTO_4364 ) ) ( not ( = ?AUTO_4361 ?AUTO_4367 ) ) ( not ( = ?AUTO_4365 ?AUTO_4367 ) ) ( TRUCK-AT ?AUTO_4368 ?AUTO_4364 ) ( IN-TRUCK ?AUTO_4360 ?AUTO_4368 ) ( not ( = ?AUTO_4366 ?AUTO_4368 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4360 ?AUTO_4368 ?AUTO_4364 )
      ( DELIVER-PKG ?AUTO_4360 ?AUTO_4361 )
      ( DELIVER-PKG-VERIFY ?AUTO_4360 ?AUTO_4361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4369 - OBJ
      ?AUTO_4370 - LOCATION
    )
    :vars
    (
      ?AUTO_4375 - LOCATION
      ?AUTO_4371 - CITY
      ?AUTO_4376 - TRUCK
      ?AUTO_4377 - LOCATION
      ?AUTO_4373 - LOCATION
      ?AUTO_4372 - AIRPLANE
      ?AUTO_4374 - TRUCK
      ?AUTO_4379 - LOCATION
      ?AUTO_4378 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4375 ?AUTO_4371 ) ( IN-CITY ?AUTO_4370 ?AUTO_4371 ) ( not ( = ?AUTO_4370 ?AUTO_4375 ) ) ( TRUCK-AT ?AUTO_4376 ?AUTO_4370 ) ( AIRPORT ?AUTO_4377 ) ( AIRPORT ?AUTO_4375 ) ( not ( = ?AUTO_4377 ?AUTO_4375 ) ) ( not ( = ?AUTO_4370 ?AUTO_4377 ) ) ( AIRPORT ?AUTO_4373 ) ( AIRPLANE-AT ?AUTO_4372 ?AUTO_4373 ) ( not ( = ?AUTO_4373 ?AUTO_4377 ) ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( not ( = ?AUTO_4375 ?AUTO_4373 ) ) ( IN-TRUCK ?AUTO_4369 ?AUTO_4374 ) ( not ( = ?AUTO_4376 ?AUTO_4374 ) ) ( TRUCK-AT ?AUTO_4374 ?AUTO_4379 ) ( IN-CITY ?AUTO_4379 ?AUTO_4378 ) ( IN-CITY ?AUTO_4377 ?AUTO_4378 ) ( not ( = ?AUTO_4377 ?AUTO_4379 ) ) ( not ( = ?AUTO_4370 ?AUTO_4379 ) ) ( not ( = ?AUTO_4375 ?AUTO_4379 ) ) ( not ( = ?AUTO_4371 ?AUTO_4378 ) ) ( not ( = ?AUTO_4373 ?AUTO_4379 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4374 ?AUTO_4379 ?AUTO_4377 ?AUTO_4378 )
      ( DELIVER-PKG ?AUTO_4369 ?AUTO_4370 )
      ( DELIVER-PKG-VERIFY ?AUTO_4369 ?AUTO_4370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4380 - OBJ
      ?AUTO_4381 - LOCATION
    )
    :vars
    (
      ?AUTO_4390 - LOCATION
      ?AUTO_4384 - CITY
      ?AUTO_4383 - TRUCK
      ?AUTO_4385 - LOCATION
      ?AUTO_4388 - LOCATION
      ?AUTO_4382 - AIRPLANE
      ?AUTO_4389 - TRUCK
      ?AUTO_4387 - LOCATION
      ?AUTO_4386 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4390 ?AUTO_4384 ) ( IN-CITY ?AUTO_4381 ?AUTO_4384 ) ( not ( = ?AUTO_4381 ?AUTO_4390 ) ) ( TRUCK-AT ?AUTO_4383 ?AUTO_4381 ) ( AIRPORT ?AUTO_4385 ) ( AIRPORT ?AUTO_4390 ) ( not ( = ?AUTO_4385 ?AUTO_4390 ) ) ( not ( = ?AUTO_4381 ?AUTO_4385 ) ) ( AIRPORT ?AUTO_4388 ) ( AIRPLANE-AT ?AUTO_4382 ?AUTO_4388 ) ( not ( = ?AUTO_4388 ?AUTO_4385 ) ) ( not ( = ?AUTO_4381 ?AUTO_4388 ) ) ( not ( = ?AUTO_4390 ?AUTO_4388 ) ) ( not ( = ?AUTO_4383 ?AUTO_4389 ) ) ( TRUCK-AT ?AUTO_4389 ?AUTO_4387 ) ( IN-CITY ?AUTO_4387 ?AUTO_4386 ) ( IN-CITY ?AUTO_4385 ?AUTO_4386 ) ( not ( = ?AUTO_4385 ?AUTO_4387 ) ) ( not ( = ?AUTO_4381 ?AUTO_4387 ) ) ( not ( = ?AUTO_4390 ?AUTO_4387 ) ) ( not ( = ?AUTO_4384 ?AUTO_4386 ) ) ( not ( = ?AUTO_4388 ?AUTO_4387 ) ) ( OBJ-AT ?AUTO_4380 ?AUTO_4387 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4380 ?AUTO_4389 ?AUTO_4387 )
      ( DELIVER-PKG ?AUTO_4380 ?AUTO_4381 )
      ( DELIVER-PKG-VERIFY ?AUTO_4380 ?AUTO_4381 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4391 - OBJ
      ?AUTO_4392 - LOCATION
    )
    :vars
    (
      ?AUTO_4394 - LOCATION
      ?AUTO_4396 - CITY
      ?AUTO_4393 - TRUCK
      ?AUTO_4400 - LOCATION
      ?AUTO_4399 - LOCATION
      ?AUTO_4395 - AIRPLANE
      ?AUTO_4401 - TRUCK
      ?AUTO_4398 - LOCATION
      ?AUTO_4397 - CITY
      ?AUTO_4402 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4394 ?AUTO_4396 ) ( IN-CITY ?AUTO_4392 ?AUTO_4396 ) ( not ( = ?AUTO_4392 ?AUTO_4394 ) ) ( TRUCK-AT ?AUTO_4393 ?AUTO_4392 ) ( AIRPORT ?AUTO_4400 ) ( AIRPORT ?AUTO_4394 ) ( not ( = ?AUTO_4400 ?AUTO_4394 ) ) ( not ( = ?AUTO_4392 ?AUTO_4400 ) ) ( AIRPORT ?AUTO_4399 ) ( AIRPLANE-AT ?AUTO_4395 ?AUTO_4399 ) ( not ( = ?AUTO_4399 ?AUTO_4400 ) ) ( not ( = ?AUTO_4392 ?AUTO_4399 ) ) ( not ( = ?AUTO_4394 ?AUTO_4399 ) ) ( not ( = ?AUTO_4393 ?AUTO_4401 ) ) ( IN-CITY ?AUTO_4398 ?AUTO_4397 ) ( IN-CITY ?AUTO_4400 ?AUTO_4397 ) ( not ( = ?AUTO_4400 ?AUTO_4398 ) ) ( not ( = ?AUTO_4392 ?AUTO_4398 ) ) ( not ( = ?AUTO_4394 ?AUTO_4398 ) ) ( not ( = ?AUTO_4396 ?AUTO_4397 ) ) ( not ( = ?AUTO_4399 ?AUTO_4398 ) ) ( OBJ-AT ?AUTO_4391 ?AUTO_4398 ) ( TRUCK-AT ?AUTO_4401 ?AUTO_4402 ) ( IN-CITY ?AUTO_4402 ?AUTO_4397 ) ( not ( = ?AUTO_4398 ?AUTO_4402 ) ) ( not ( = ?AUTO_4392 ?AUTO_4402 ) ) ( not ( = ?AUTO_4394 ?AUTO_4402 ) ) ( not ( = ?AUTO_4400 ?AUTO_4402 ) ) ( not ( = ?AUTO_4399 ?AUTO_4402 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4401 ?AUTO_4402 ?AUTO_4398 ?AUTO_4397 )
      ( DELIVER-PKG ?AUTO_4391 ?AUTO_4392 )
      ( DELIVER-PKG-VERIFY ?AUTO_4391 ?AUTO_4392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4622 - OBJ
      ?AUTO_4623 - LOCATION
    )
    :vars
    (
      ?AUTO_4627 - LOCATION
      ?AUTO_4625 - AIRPLANE
      ?AUTO_4626 - LOCATION
      ?AUTO_4628 - CITY
      ?AUTO_4624 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4627 ) ( AIRPORT ?AUTO_4623 ) ( not ( = ?AUTO_4627 ?AUTO_4623 ) ) ( AIRPLANE-AT ?AUTO_4625 ?AUTO_4623 ) ( IN-CITY ?AUTO_4626 ?AUTO_4628 ) ( IN-CITY ?AUTO_4627 ?AUTO_4628 ) ( not ( = ?AUTO_4627 ?AUTO_4626 ) ) ( not ( = ?AUTO_4623 ?AUTO_4626 ) ) ( OBJ-AT ?AUTO_4622 ?AUTO_4626 ) ( TRUCK-AT ?AUTO_4624 ?AUTO_4627 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4624 ?AUTO_4627 ?AUTO_4626 ?AUTO_4628 )
      ( DELIVER-PKG ?AUTO_4622 ?AUTO_4623 )
      ( DELIVER-PKG-VERIFY ?AUTO_4622 ?AUTO_4623 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4896 - OBJ
      ?AUTO_4897 - LOCATION
    )
    :vars
    (
      ?AUTO_4901 - LOCATION
      ?AUTO_4904 - CITY
      ?AUTO_4900 - LOCATION
      ?AUTO_4902 - AIRPLANE
      ?AUTO_4903 - TRUCK
      ?AUTO_4898 - LOCATION
      ?AUTO_4906 - TRUCK
      ?AUTO_4905 - LOCATION
      ?AUTO_4899 - CITY
      ?AUTO_4907 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4901 ?AUTO_4904 ) ( IN-CITY ?AUTO_4897 ?AUTO_4904 ) ( not ( = ?AUTO_4897 ?AUTO_4901 ) ) ( AIRPORT ?AUTO_4900 ) ( AIRPORT ?AUTO_4901 ) ( not ( = ?AUTO_4900 ?AUTO_4901 ) ) ( not ( = ?AUTO_4897 ?AUTO_4900 ) ) ( AIRPLANE-AT ?AUTO_4902 ?AUTO_4901 ) ( TRUCK-AT ?AUTO_4903 ?AUTO_4898 ) ( IN-CITY ?AUTO_4898 ?AUTO_4904 ) ( not ( = ?AUTO_4901 ?AUTO_4898 ) ) ( not ( = ?AUTO_4897 ?AUTO_4898 ) ) ( not ( = ?AUTO_4900 ?AUTO_4898 ) ) ( not ( = ?AUTO_4903 ?AUTO_4906 ) ) ( IN-CITY ?AUTO_4905 ?AUTO_4899 ) ( IN-CITY ?AUTO_4900 ?AUTO_4899 ) ( not ( = ?AUTO_4900 ?AUTO_4905 ) ) ( not ( = ?AUTO_4897 ?AUTO_4905 ) ) ( not ( = ?AUTO_4901 ?AUTO_4905 ) ) ( not ( = ?AUTO_4904 ?AUTO_4899 ) ) ( not ( = ?AUTO_4898 ?AUTO_4905 ) ) ( OBJ-AT ?AUTO_4896 ?AUTO_4905 ) ( TRUCK-AT ?AUTO_4906 ?AUTO_4907 ) ( IN-CITY ?AUTO_4907 ?AUTO_4899 ) ( not ( = ?AUTO_4905 ?AUTO_4907 ) ) ( not ( = ?AUTO_4897 ?AUTO_4907 ) ) ( not ( = ?AUTO_4901 ?AUTO_4907 ) ) ( not ( = ?AUTO_4900 ?AUTO_4907 ) ) ( not ( = ?AUTO_4898 ?AUTO_4907 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4906 ?AUTO_4907 ?AUTO_4905 ?AUTO_4899 )
      ( DELIVER-PKG ?AUTO_4896 ?AUTO_4897 )
      ( DELIVER-PKG-VERIFY ?AUTO_4896 ?AUTO_4897 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4982 - OBJ
      ?AUTO_4983 - LOCATION
    )
    :vars
    (
      ?AUTO_4984 - LOCATION
      ?AUTO_4987 - CITY
      ?AUTO_4990 - LOCATION
      ?AUTO_4991 - AIRPLANE
      ?AUTO_4992 - TRUCK
      ?AUTO_4986 - LOCATION
      ?AUTO_4985 - TRUCK
      ?AUTO_4989 - LOCATION
      ?AUTO_4988 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4984 ?AUTO_4987 ) ( IN-CITY ?AUTO_4983 ?AUTO_4987 ) ( not ( = ?AUTO_4983 ?AUTO_4984 ) ) ( AIRPORT ?AUTO_4990 ) ( AIRPORT ?AUTO_4984 ) ( not ( = ?AUTO_4990 ?AUTO_4984 ) ) ( not ( = ?AUTO_4983 ?AUTO_4990 ) ) ( AIRPLANE-AT ?AUTO_4991 ?AUTO_4984 ) ( TRUCK-AT ?AUTO_4992 ?AUTO_4986 ) ( IN-CITY ?AUTO_4986 ?AUTO_4987 ) ( not ( = ?AUTO_4984 ?AUTO_4986 ) ) ( not ( = ?AUTO_4983 ?AUTO_4986 ) ) ( not ( = ?AUTO_4990 ?AUTO_4986 ) ) ( not ( = ?AUTO_4992 ?AUTO_4985 ) ) ( IN-CITY ?AUTO_4989 ?AUTO_4988 ) ( IN-CITY ?AUTO_4990 ?AUTO_4988 ) ( not ( = ?AUTO_4990 ?AUTO_4989 ) ) ( not ( = ?AUTO_4983 ?AUTO_4989 ) ) ( not ( = ?AUTO_4984 ?AUTO_4989 ) ) ( not ( = ?AUTO_4987 ?AUTO_4988 ) ) ( not ( = ?AUTO_4986 ?AUTO_4989 ) ) ( OBJ-AT ?AUTO_4982 ?AUTO_4989 ) ( TRUCK-AT ?AUTO_4985 ?AUTO_4990 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4985 ?AUTO_4990 ?AUTO_4989 ?AUTO_4988 )
      ( DELIVER-PKG ?AUTO_4982 ?AUTO_4983 )
      ( DELIVER-PKG-VERIFY ?AUTO_4982 ?AUTO_4983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5069 - OBJ
      ?AUTO_5070 - LOCATION
    )
    :vars
    (
      ?AUTO_5075 - LOCATION
      ?AUTO_5073 - CITY
      ?AUTO_5074 - LOCATION
      ?AUTO_5072 - AIRPLANE
      ?AUTO_5071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5075 ?AUTO_5073 ) ( IN-CITY ?AUTO_5070 ?AUTO_5073 ) ( not ( = ?AUTO_5070 ?AUTO_5075 ) ) ( AIRPORT ?AUTO_5074 ) ( AIRPORT ?AUTO_5075 ) ( not ( = ?AUTO_5074 ?AUTO_5075 ) ) ( not ( = ?AUTO_5070 ?AUTO_5074 ) ) ( OBJ-AT ?AUTO_5069 ?AUTO_5074 ) ( AIRPLANE-AT ?AUTO_5072 ?AUTO_5075 ) ( TRUCK-AT ?AUTO_5071 ?AUTO_5070 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5071 ?AUTO_5070 ?AUTO_5075 ?AUTO_5073 )
      ( DELIVER-PKG ?AUTO_5069 ?AUTO_5070 )
      ( DELIVER-PKG-VERIFY ?AUTO_5069 ?AUTO_5070 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5086 - OBJ
      ?AUTO_5087 - LOCATION
    )
    :vars
    (
      ?AUTO_5089 - LOCATION
      ?AUTO_5088 - CITY
      ?AUTO_5090 - LOCATION
      ?AUTO_5091 - AIRPLANE
      ?AUTO_5092 - TRUCK
      ?AUTO_5093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5089 ?AUTO_5088 ) ( IN-CITY ?AUTO_5087 ?AUTO_5088 ) ( not ( = ?AUTO_5087 ?AUTO_5089 ) ) ( AIRPORT ?AUTO_5090 ) ( AIRPORT ?AUTO_5089 ) ( not ( = ?AUTO_5090 ?AUTO_5089 ) ) ( not ( = ?AUTO_5087 ?AUTO_5090 ) ) ( AIRPLANE-AT ?AUTO_5091 ?AUTO_5089 ) ( TRUCK-AT ?AUTO_5092 ?AUTO_5087 ) ( TRUCK-AT ?AUTO_5093 ?AUTO_5090 ) ( IN-TRUCK ?AUTO_5086 ?AUTO_5093 ) ( not ( = ?AUTO_5092 ?AUTO_5093 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5086 ?AUTO_5093 ?AUTO_5090 )
      ( DELIVER-PKG ?AUTO_5086 ?AUTO_5087 )
      ( DELIVER-PKG-VERIFY ?AUTO_5086 ?AUTO_5087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5096 - OBJ
      ?AUTO_5097 - LOCATION
    )
    :vars
    (
      ?AUTO_5099 - LOCATION
      ?AUTO_5102 - CITY
      ?AUTO_5100 - LOCATION
      ?AUTO_5098 - AIRPLANE
      ?AUTO_5101 - TRUCK
      ?AUTO_5103 - TRUCK
      ?AUTO_5105 - LOCATION
      ?AUTO_5104 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5099 ?AUTO_5102 ) ( IN-CITY ?AUTO_5097 ?AUTO_5102 ) ( not ( = ?AUTO_5097 ?AUTO_5099 ) ) ( AIRPORT ?AUTO_5100 ) ( AIRPORT ?AUTO_5099 ) ( not ( = ?AUTO_5100 ?AUTO_5099 ) ) ( not ( = ?AUTO_5097 ?AUTO_5100 ) ) ( AIRPLANE-AT ?AUTO_5098 ?AUTO_5099 ) ( TRUCK-AT ?AUTO_5101 ?AUTO_5097 ) ( IN-TRUCK ?AUTO_5096 ?AUTO_5103 ) ( not ( = ?AUTO_5101 ?AUTO_5103 ) ) ( TRUCK-AT ?AUTO_5103 ?AUTO_5105 ) ( IN-CITY ?AUTO_5105 ?AUTO_5104 ) ( IN-CITY ?AUTO_5100 ?AUTO_5104 ) ( not ( = ?AUTO_5100 ?AUTO_5105 ) ) ( not ( = ?AUTO_5097 ?AUTO_5105 ) ) ( not ( = ?AUTO_5099 ?AUTO_5105 ) ) ( not ( = ?AUTO_5102 ?AUTO_5104 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5103 ?AUTO_5105 ?AUTO_5100 ?AUTO_5104 )
      ( DELIVER-PKG ?AUTO_5096 ?AUTO_5097 )
      ( DELIVER-PKG-VERIFY ?AUTO_5096 ?AUTO_5097 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5106 - OBJ
      ?AUTO_5107 - LOCATION
    )
    :vars
    (
      ?AUTO_5114 - LOCATION
      ?AUTO_5111 - CITY
      ?AUTO_5108 - LOCATION
      ?AUTO_5109 - AIRPLANE
      ?AUTO_5112 - TRUCK
      ?AUTO_5115 - TRUCK
      ?AUTO_5110 - LOCATION
      ?AUTO_5113 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5114 ?AUTO_5111 ) ( IN-CITY ?AUTO_5107 ?AUTO_5111 ) ( not ( = ?AUTO_5107 ?AUTO_5114 ) ) ( AIRPORT ?AUTO_5108 ) ( AIRPORT ?AUTO_5114 ) ( not ( = ?AUTO_5108 ?AUTO_5114 ) ) ( not ( = ?AUTO_5107 ?AUTO_5108 ) ) ( AIRPLANE-AT ?AUTO_5109 ?AUTO_5114 ) ( TRUCK-AT ?AUTO_5112 ?AUTO_5107 ) ( not ( = ?AUTO_5112 ?AUTO_5115 ) ) ( TRUCK-AT ?AUTO_5115 ?AUTO_5110 ) ( IN-CITY ?AUTO_5110 ?AUTO_5113 ) ( IN-CITY ?AUTO_5108 ?AUTO_5113 ) ( not ( = ?AUTO_5108 ?AUTO_5110 ) ) ( not ( = ?AUTO_5107 ?AUTO_5110 ) ) ( not ( = ?AUTO_5114 ?AUTO_5110 ) ) ( not ( = ?AUTO_5111 ?AUTO_5113 ) ) ( OBJ-AT ?AUTO_5106 ?AUTO_5110 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5106 ?AUTO_5115 ?AUTO_5110 )
      ( DELIVER-PKG ?AUTO_5106 ?AUTO_5107 )
      ( DELIVER-PKG-VERIFY ?AUTO_5106 ?AUTO_5107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5116 - OBJ
      ?AUTO_5117 - LOCATION
    )
    :vars
    (
      ?AUTO_5122 - LOCATION
      ?AUTO_5123 - CITY
      ?AUTO_5125 - LOCATION
      ?AUTO_5118 - AIRPLANE
      ?AUTO_5121 - TRUCK
      ?AUTO_5120 - TRUCK
      ?AUTO_5119 - LOCATION
      ?AUTO_5124 - CITY
      ?AUTO_5126 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5122 ?AUTO_5123 ) ( IN-CITY ?AUTO_5117 ?AUTO_5123 ) ( not ( = ?AUTO_5117 ?AUTO_5122 ) ) ( AIRPORT ?AUTO_5125 ) ( AIRPORT ?AUTO_5122 ) ( not ( = ?AUTO_5125 ?AUTO_5122 ) ) ( not ( = ?AUTO_5117 ?AUTO_5125 ) ) ( AIRPLANE-AT ?AUTO_5118 ?AUTO_5122 ) ( TRUCK-AT ?AUTO_5121 ?AUTO_5117 ) ( not ( = ?AUTO_5121 ?AUTO_5120 ) ) ( IN-CITY ?AUTO_5119 ?AUTO_5124 ) ( IN-CITY ?AUTO_5125 ?AUTO_5124 ) ( not ( = ?AUTO_5125 ?AUTO_5119 ) ) ( not ( = ?AUTO_5117 ?AUTO_5119 ) ) ( not ( = ?AUTO_5122 ?AUTO_5119 ) ) ( not ( = ?AUTO_5123 ?AUTO_5124 ) ) ( OBJ-AT ?AUTO_5116 ?AUTO_5119 ) ( TRUCK-AT ?AUTO_5120 ?AUTO_5126 ) ( IN-CITY ?AUTO_5126 ?AUTO_5124 ) ( not ( = ?AUTO_5119 ?AUTO_5126 ) ) ( not ( = ?AUTO_5117 ?AUTO_5126 ) ) ( not ( = ?AUTO_5122 ?AUTO_5126 ) ) ( not ( = ?AUTO_5125 ?AUTO_5126 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5120 ?AUTO_5126 ?AUTO_5119 ?AUTO_5124 )
      ( DELIVER-PKG ?AUTO_5116 ?AUTO_5117 )
      ( DELIVER-PKG-VERIFY ?AUTO_5116 ?AUTO_5117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5261 - OBJ
      ?AUTO_5262 - LOCATION
    )
    :vars
    (
      ?AUTO_5265 - LOCATION
      ?AUTO_5264 - LOCATION
      ?AUTO_5263 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5265 ) ( AIRPORT ?AUTO_5262 ) ( not ( = ?AUTO_5265 ?AUTO_5262 ) ) ( OBJ-AT ?AUTO_5261 ?AUTO_5265 ) ( AIRPORT ?AUTO_5264 ) ( not ( = ?AUTO_5264 ?AUTO_5265 ) ) ( not ( = ?AUTO_5262 ?AUTO_5264 ) ) ( AIRPLANE-AT ?AUTO_5263 ?AUTO_5262 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5263 ?AUTO_5262 ?AUTO_5264 )
      ( DELIVER-PKG ?AUTO_5261 ?AUTO_5262 )
      ( DELIVER-PKG-VERIFY ?AUTO_5261 ?AUTO_5262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5423 - OBJ
      ?AUTO_5424 - LOCATION
    )
    :vars
    (
      ?AUTO_5425 - LOCATION
      ?AUTO_5431 - CITY
      ?AUTO_5432 - TRUCK
      ?AUTO_5433 - LOCATION
      ?AUTO_5426 - LOCATION
      ?AUTO_5428 - AIRPLANE
      ?AUTO_5430 - TRUCK
      ?AUTO_5429 - LOCATION
      ?AUTO_5427 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5425 ?AUTO_5431 ) ( IN-CITY ?AUTO_5424 ?AUTO_5431 ) ( not ( = ?AUTO_5424 ?AUTO_5425 ) ) ( TRUCK-AT ?AUTO_5432 ?AUTO_5424 ) ( AIRPORT ?AUTO_5433 ) ( AIRPORT ?AUTO_5425 ) ( not ( = ?AUTO_5433 ?AUTO_5425 ) ) ( not ( = ?AUTO_5424 ?AUTO_5433 ) ) ( AIRPORT ?AUTO_5426 ) ( AIRPLANE-AT ?AUTO_5428 ?AUTO_5426 ) ( not ( = ?AUTO_5426 ?AUTO_5433 ) ) ( not ( = ?AUTO_5424 ?AUTO_5426 ) ) ( not ( = ?AUTO_5425 ?AUTO_5426 ) ) ( not ( = ?AUTO_5432 ?AUTO_5430 ) ) ( IN-CITY ?AUTO_5429 ?AUTO_5427 ) ( IN-CITY ?AUTO_5433 ?AUTO_5427 ) ( not ( = ?AUTO_5433 ?AUTO_5429 ) ) ( not ( = ?AUTO_5424 ?AUTO_5429 ) ) ( not ( = ?AUTO_5425 ?AUTO_5429 ) ) ( not ( = ?AUTO_5431 ?AUTO_5427 ) ) ( not ( = ?AUTO_5426 ?AUTO_5429 ) ) ( OBJ-AT ?AUTO_5423 ?AUTO_5429 ) ( TRUCK-AT ?AUTO_5430 ?AUTO_5433 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5430 ?AUTO_5433 ?AUTO_5429 ?AUTO_5427 )
      ( DELIVER-PKG ?AUTO_5423 ?AUTO_5424 )
      ( DELIVER-PKG-VERIFY ?AUTO_5423 ?AUTO_5424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5535 - OBJ
      ?AUTO_5536 - LOCATION
    )
    :vars
    (
      ?AUTO_5538 - LOCATION
      ?AUTO_5539 - AIRPLANE
      ?AUTO_5537 - LOCATION
      ?AUTO_5540 - CITY
      ?AUTO_5541 - TRUCK
      ?AUTO_5542 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5538 ) ( AIRPORT ?AUTO_5536 ) ( AIRPLANE-AT ?AUTO_5539 ?AUTO_5538 ) ( not ( = ?AUTO_5538 ?AUTO_5536 ) ) ( IN-CITY ?AUTO_5537 ?AUTO_5540 ) ( IN-CITY ?AUTO_5538 ?AUTO_5540 ) ( not ( = ?AUTO_5538 ?AUTO_5537 ) ) ( not ( = ?AUTO_5536 ?AUTO_5537 ) ) ( OBJ-AT ?AUTO_5535 ?AUTO_5537 ) ( TRUCK-AT ?AUTO_5541 ?AUTO_5542 ) ( IN-CITY ?AUTO_5542 ?AUTO_5540 ) ( not ( = ?AUTO_5537 ?AUTO_5542 ) ) ( not ( = ?AUTO_5536 ?AUTO_5542 ) ) ( not ( = ?AUTO_5538 ?AUTO_5542 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5541 ?AUTO_5542 ?AUTO_5537 ?AUTO_5540 )
      ( DELIVER-PKG ?AUTO_5535 ?AUTO_5536 )
      ( DELIVER-PKG-VERIFY ?AUTO_5535 ?AUTO_5536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5606 - OBJ
      ?AUTO_5607 - LOCATION
    )
    :vars
    (
      ?AUTO_5611 - LOCATION
      ?AUTO_5610 - TRUCK
      ?AUTO_5609 - LOCATION
      ?AUTO_5608 - CITY
      ?AUTO_5612 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5611 ) ( AIRPORT ?AUTO_5607 ) ( not ( = ?AUTO_5611 ?AUTO_5607 ) ) ( IN-TRUCK ?AUTO_5606 ?AUTO_5610 ) ( TRUCK-AT ?AUTO_5610 ?AUTO_5609 ) ( IN-CITY ?AUTO_5609 ?AUTO_5608 ) ( IN-CITY ?AUTO_5611 ?AUTO_5608 ) ( not ( = ?AUTO_5611 ?AUTO_5609 ) ) ( not ( = ?AUTO_5607 ?AUTO_5609 ) ) ( AIRPLANE-AT ?AUTO_5612 ?AUTO_5607 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5612 ?AUTO_5607 ?AUTO_5611 )
      ( DELIVER-PKG ?AUTO_5606 ?AUTO_5607 )
      ( DELIVER-PKG-VERIFY ?AUTO_5606 ?AUTO_5607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5776 - OBJ
      ?AUTO_5777 - LOCATION
    )
    :vars
    (
      ?AUTO_5784 - TRUCK
      ?AUTO_5780 - LOCATION
      ?AUTO_5785 - CITY
      ?AUTO_5779 - LOCATION
      ?AUTO_5778 - TRUCK
      ?AUTO_5781 - LOCATION
      ?AUTO_5783 - CITY
      ?AUTO_5782 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5784 ?AUTO_5780 ) ( IN-CITY ?AUTO_5780 ?AUTO_5785 ) ( IN-CITY ?AUTO_5777 ?AUTO_5785 ) ( not ( = ?AUTO_5777 ?AUTO_5780 ) ) ( AIRPORT ?AUTO_5779 ) ( AIRPORT ?AUTO_5780 ) ( not ( = ?AUTO_5779 ?AUTO_5780 ) ) ( not ( = ?AUTO_5777 ?AUTO_5779 ) ) ( IN-TRUCK ?AUTO_5776 ?AUTO_5778 ) ( not ( = ?AUTO_5784 ?AUTO_5778 ) ) ( TRUCK-AT ?AUTO_5778 ?AUTO_5781 ) ( IN-CITY ?AUTO_5781 ?AUTO_5783 ) ( IN-CITY ?AUTO_5779 ?AUTO_5783 ) ( not ( = ?AUTO_5779 ?AUTO_5781 ) ) ( not ( = ?AUTO_5777 ?AUTO_5781 ) ) ( not ( = ?AUTO_5780 ?AUTO_5781 ) ) ( not ( = ?AUTO_5785 ?AUTO_5783 ) ) ( AIRPLANE-AT ?AUTO_5782 ?AUTO_5780 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5782 ?AUTO_5780 ?AUTO_5779 )
      ( DELIVER-PKG ?AUTO_5776 ?AUTO_5777 )
      ( DELIVER-PKG-VERIFY ?AUTO_5776 ?AUTO_5777 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5790 - OBJ
      ?AUTO_5791 - LOCATION
    )
    :vars
    (
      ?AUTO_5792 - LOCATION
      ?AUTO_5799 - CITY
      ?AUTO_5798 - LOCATION
      ?AUTO_5797 - TRUCK
      ?AUTO_5794 - TRUCK
      ?AUTO_5793 - LOCATION
      ?AUTO_5795 - CITY
      ?AUTO_5796 - AIRPLANE
      ?AUTO_5800 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5792 ?AUTO_5799 ) ( IN-CITY ?AUTO_5791 ?AUTO_5799 ) ( not ( = ?AUTO_5791 ?AUTO_5792 ) ) ( AIRPORT ?AUTO_5798 ) ( AIRPORT ?AUTO_5792 ) ( not ( = ?AUTO_5798 ?AUTO_5792 ) ) ( not ( = ?AUTO_5791 ?AUTO_5798 ) ) ( IN-TRUCK ?AUTO_5790 ?AUTO_5797 ) ( not ( = ?AUTO_5794 ?AUTO_5797 ) ) ( TRUCK-AT ?AUTO_5797 ?AUTO_5793 ) ( IN-CITY ?AUTO_5793 ?AUTO_5795 ) ( IN-CITY ?AUTO_5798 ?AUTO_5795 ) ( not ( = ?AUTO_5798 ?AUTO_5793 ) ) ( not ( = ?AUTO_5791 ?AUTO_5793 ) ) ( not ( = ?AUTO_5792 ?AUTO_5793 ) ) ( not ( = ?AUTO_5799 ?AUTO_5795 ) ) ( AIRPLANE-AT ?AUTO_5796 ?AUTO_5792 ) ( TRUCK-AT ?AUTO_5794 ?AUTO_5800 ) ( IN-CITY ?AUTO_5800 ?AUTO_5799 ) ( not ( = ?AUTO_5792 ?AUTO_5800 ) ) ( not ( = ?AUTO_5791 ?AUTO_5800 ) ) ( not ( = ?AUTO_5798 ?AUTO_5800 ) ) ( not ( = ?AUTO_5793 ?AUTO_5800 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5794 ?AUTO_5800 ?AUTO_5792 ?AUTO_5799 )
      ( DELIVER-PKG ?AUTO_5790 ?AUTO_5791 )
      ( DELIVER-PKG-VERIFY ?AUTO_5790 ?AUTO_5791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5907 - OBJ
      ?AUTO_5908 - LOCATION
    )
    :vars
    (
      ?AUTO_5914 - LOCATION
      ?AUTO_5909 - CITY
      ?AUTO_5915 - TRUCK
      ?AUTO_5911 - LOCATION
      ?AUTO_5916 - AIRPLANE
      ?AUTO_5910 - TRUCK
      ?AUTO_5913 - LOCATION
      ?AUTO_5912 - CITY
      ?AUTO_5917 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5914 ?AUTO_5909 ) ( IN-CITY ?AUTO_5908 ?AUTO_5909 ) ( not ( = ?AUTO_5908 ?AUTO_5914 ) ) ( TRUCK-AT ?AUTO_5915 ?AUTO_5908 ) ( AIRPORT ?AUTO_5911 ) ( AIRPORT ?AUTO_5914 ) ( AIRPLANE-AT ?AUTO_5916 ?AUTO_5911 ) ( not ( = ?AUTO_5911 ?AUTO_5914 ) ) ( not ( = ?AUTO_5908 ?AUTO_5911 ) ) ( not ( = ?AUTO_5915 ?AUTO_5910 ) ) ( IN-CITY ?AUTO_5913 ?AUTO_5912 ) ( IN-CITY ?AUTO_5911 ?AUTO_5912 ) ( not ( = ?AUTO_5911 ?AUTO_5913 ) ) ( not ( = ?AUTO_5908 ?AUTO_5913 ) ) ( not ( = ?AUTO_5914 ?AUTO_5913 ) ) ( not ( = ?AUTO_5909 ?AUTO_5912 ) ) ( OBJ-AT ?AUTO_5907 ?AUTO_5913 ) ( TRUCK-AT ?AUTO_5910 ?AUTO_5917 ) ( IN-CITY ?AUTO_5917 ?AUTO_5912 ) ( not ( = ?AUTO_5913 ?AUTO_5917 ) ) ( not ( = ?AUTO_5908 ?AUTO_5917 ) ) ( not ( = ?AUTO_5914 ?AUTO_5917 ) ) ( not ( = ?AUTO_5911 ?AUTO_5917 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5910 ?AUTO_5917 ?AUTO_5913 ?AUTO_5912 )
      ( DELIVER-PKG ?AUTO_5907 ?AUTO_5908 )
      ( DELIVER-PKG-VERIFY ?AUTO_5907 ?AUTO_5908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6093 - OBJ
      ?AUTO_6094 - LOCATION
    )
    :vars
    (
      ?AUTO_6095 - LOCATION
      ?AUTO_6097 - TRUCK
      ?AUTO_6098 - LOCATION
      ?AUTO_6099 - CITY
      ?AUTO_6100 - LOCATION
      ?AUTO_6096 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6095 ) ( AIRPORT ?AUTO_6094 ) ( not ( = ?AUTO_6095 ?AUTO_6094 ) ) ( IN-TRUCK ?AUTO_6093 ?AUTO_6097 ) ( TRUCK-AT ?AUTO_6097 ?AUTO_6098 ) ( IN-CITY ?AUTO_6098 ?AUTO_6099 ) ( IN-CITY ?AUTO_6095 ?AUTO_6099 ) ( not ( = ?AUTO_6095 ?AUTO_6098 ) ) ( not ( = ?AUTO_6094 ?AUTO_6098 ) ) ( AIRPORT ?AUTO_6100 ) ( AIRPLANE-AT ?AUTO_6096 ?AUTO_6100 ) ( not ( = ?AUTO_6100 ?AUTO_6094 ) ) ( not ( = ?AUTO_6095 ?AUTO_6100 ) ) ( not ( = ?AUTO_6098 ?AUTO_6100 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6096 ?AUTO_6100 ?AUTO_6094 )
      ( DELIVER-PKG ?AUTO_6093 ?AUTO_6094 )
      ( DELIVER-PKG-VERIFY ?AUTO_6093 ?AUTO_6094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6177 - OBJ
      ?AUTO_6178 - LOCATION
    )
    :vars
    (
      ?AUTO_6183 - TRUCK
      ?AUTO_6180 - LOCATION
      ?AUTO_6181 - CITY
      ?AUTO_6182 - LOCATION
      ?AUTO_6179 - AIRPLANE
      ?AUTO_6184 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6183 ?AUTO_6180 ) ( IN-CITY ?AUTO_6180 ?AUTO_6181 ) ( IN-CITY ?AUTO_6178 ?AUTO_6181 ) ( not ( = ?AUTO_6178 ?AUTO_6180 ) ) ( AIRPORT ?AUTO_6182 ) ( AIRPORT ?AUTO_6180 ) ( not ( = ?AUTO_6182 ?AUTO_6180 ) ) ( not ( = ?AUTO_6178 ?AUTO_6182 ) ) ( AIRPLANE-AT ?AUTO_6179 ?AUTO_6180 ) ( TRUCK-AT ?AUTO_6184 ?AUTO_6182 ) ( IN-TRUCK ?AUTO_6177 ?AUTO_6184 ) ( not ( = ?AUTO_6183 ?AUTO_6184 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6177 ?AUTO_6184 ?AUTO_6182 )
      ( DELIVER-PKG ?AUTO_6177 ?AUTO_6178 )
      ( DELIVER-PKG-VERIFY ?AUTO_6177 ?AUTO_6178 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6185 - OBJ
      ?AUTO_6186 - LOCATION
    )
    :vars
    (
      ?AUTO_6190 - TRUCK
      ?AUTO_6189 - LOCATION
      ?AUTO_6192 - CITY
      ?AUTO_6187 - LOCATION
      ?AUTO_6188 - AIRPLANE
      ?AUTO_6191 - TRUCK
      ?AUTO_6194 - LOCATION
      ?AUTO_6193 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6190 ?AUTO_6189 ) ( IN-CITY ?AUTO_6189 ?AUTO_6192 ) ( IN-CITY ?AUTO_6186 ?AUTO_6192 ) ( not ( = ?AUTO_6186 ?AUTO_6189 ) ) ( AIRPORT ?AUTO_6187 ) ( AIRPORT ?AUTO_6189 ) ( not ( = ?AUTO_6187 ?AUTO_6189 ) ) ( not ( = ?AUTO_6186 ?AUTO_6187 ) ) ( AIRPLANE-AT ?AUTO_6188 ?AUTO_6189 ) ( IN-TRUCK ?AUTO_6185 ?AUTO_6191 ) ( not ( = ?AUTO_6190 ?AUTO_6191 ) ) ( TRUCK-AT ?AUTO_6191 ?AUTO_6194 ) ( IN-CITY ?AUTO_6194 ?AUTO_6193 ) ( IN-CITY ?AUTO_6187 ?AUTO_6193 ) ( not ( = ?AUTO_6187 ?AUTO_6194 ) ) ( not ( = ?AUTO_6186 ?AUTO_6194 ) ) ( not ( = ?AUTO_6189 ?AUTO_6194 ) ) ( not ( = ?AUTO_6192 ?AUTO_6193 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6191 ?AUTO_6194 ?AUTO_6187 ?AUTO_6193 )
      ( DELIVER-PKG ?AUTO_6185 ?AUTO_6186 )
      ( DELIVER-PKG-VERIFY ?AUTO_6185 ?AUTO_6186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6195 - OBJ
      ?AUTO_6196 - LOCATION
    )
    :vars
    (
      ?AUTO_6197 - TRUCK
      ?AUTO_6198 - LOCATION
      ?AUTO_6200 - CITY
      ?AUTO_6199 - LOCATION
      ?AUTO_6202 - TRUCK
      ?AUTO_6204 - LOCATION
      ?AUTO_6203 - CITY
      ?AUTO_6205 - LOCATION
      ?AUTO_6201 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6197 ?AUTO_6198 ) ( IN-CITY ?AUTO_6198 ?AUTO_6200 ) ( IN-CITY ?AUTO_6196 ?AUTO_6200 ) ( not ( = ?AUTO_6196 ?AUTO_6198 ) ) ( AIRPORT ?AUTO_6199 ) ( AIRPORT ?AUTO_6198 ) ( not ( = ?AUTO_6199 ?AUTO_6198 ) ) ( not ( = ?AUTO_6196 ?AUTO_6199 ) ) ( IN-TRUCK ?AUTO_6195 ?AUTO_6202 ) ( not ( = ?AUTO_6197 ?AUTO_6202 ) ) ( TRUCK-AT ?AUTO_6202 ?AUTO_6204 ) ( IN-CITY ?AUTO_6204 ?AUTO_6203 ) ( IN-CITY ?AUTO_6199 ?AUTO_6203 ) ( not ( = ?AUTO_6199 ?AUTO_6204 ) ) ( not ( = ?AUTO_6196 ?AUTO_6204 ) ) ( not ( = ?AUTO_6198 ?AUTO_6204 ) ) ( not ( = ?AUTO_6200 ?AUTO_6203 ) ) ( AIRPORT ?AUTO_6205 ) ( AIRPLANE-AT ?AUTO_6201 ?AUTO_6205 ) ( not ( = ?AUTO_6205 ?AUTO_6198 ) ) ( not ( = ?AUTO_6196 ?AUTO_6205 ) ) ( not ( = ?AUTO_6199 ?AUTO_6205 ) ) ( not ( = ?AUTO_6204 ?AUTO_6205 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6201 ?AUTO_6205 ?AUTO_6198 )
      ( DELIVER-PKG ?AUTO_6195 ?AUTO_6196 )
      ( DELIVER-PKG-VERIFY ?AUTO_6195 ?AUTO_6196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6562 - OBJ
      ?AUTO_6563 - LOCATION
    )
    :vars
    (
      ?AUTO_6567 - TRUCK
      ?AUTO_6568 - LOCATION
      ?AUTO_6564 - CITY
      ?AUTO_6565 - LOCATION
      ?AUTO_6569 - LOCATION
      ?AUTO_6566 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6567 ?AUTO_6568 ) ( IN-CITY ?AUTO_6568 ?AUTO_6564 ) ( IN-CITY ?AUTO_6563 ?AUTO_6564 ) ( not ( = ?AUTO_6563 ?AUTO_6568 ) ) ( AIRPORT ?AUTO_6565 ) ( AIRPORT ?AUTO_6568 ) ( not ( = ?AUTO_6565 ?AUTO_6568 ) ) ( not ( = ?AUTO_6563 ?AUTO_6565 ) ) ( OBJ-AT ?AUTO_6562 ?AUTO_6565 ) ( AIRPORT ?AUTO_6569 ) ( AIRPLANE-AT ?AUTO_6566 ?AUTO_6569 ) ( not ( = ?AUTO_6569 ?AUTO_6568 ) ) ( not ( = ?AUTO_6563 ?AUTO_6569 ) ) ( not ( = ?AUTO_6565 ?AUTO_6569 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6566 ?AUTO_6569 ?AUTO_6568 )
      ( DELIVER-PKG ?AUTO_6562 ?AUTO_6563 )
      ( DELIVER-PKG-VERIFY ?AUTO_6562 ?AUTO_6563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6596 - OBJ
      ?AUTO_6597 - LOCATION
    )
    :vars
    (
      ?AUTO_6603 - LOCATION
      ?AUTO_6601 - CITY
      ?AUTO_6598 - LOCATION
      ?AUTO_6599 - LOCATION
      ?AUTO_6600 - AIRPLANE
      ?AUTO_6602 - TRUCK
      ?AUTO_6604 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6603 ?AUTO_6601 ) ( IN-CITY ?AUTO_6597 ?AUTO_6601 ) ( not ( = ?AUTO_6597 ?AUTO_6603 ) ) ( AIRPORT ?AUTO_6598 ) ( AIRPORT ?AUTO_6603 ) ( not ( = ?AUTO_6598 ?AUTO_6603 ) ) ( not ( = ?AUTO_6597 ?AUTO_6598 ) ) ( OBJ-AT ?AUTO_6596 ?AUTO_6598 ) ( AIRPORT ?AUTO_6599 ) ( AIRPLANE-AT ?AUTO_6600 ?AUTO_6599 ) ( not ( = ?AUTO_6599 ?AUTO_6603 ) ) ( not ( = ?AUTO_6597 ?AUTO_6599 ) ) ( not ( = ?AUTO_6598 ?AUTO_6599 ) ) ( TRUCK-AT ?AUTO_6602 ?AUTO_6604 ) ( IN-CITY ?AUTO_6604 ?AUTO_6601 ) ( not ( = ?AUTO_6603 ?AUTO_6604 ) ) ( not ( = ?AUTO_6597 ?AUTO_6604 ) ) ( not ( = ?AUTO_6598 ?AUTO_6604 ) ) ( not ( = ?AUTO_6599 ?AUTO_6604 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6602 ?AUTO_6604 ?AUTO_6603 ?AUTO_6601 )
      ( DELIVER-PKG ?AUTO_6596 ?AUTO_6597 )
      ( DELIVER-PKG-VERIFY ?AUTO_6596 ?AUTO_6597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6760 - OBJ
      ?AUTO_6761 - LOCATION
    )
    :vars
    (
      ?AUTO_6766 - LOCATION
      ?AUTO_6763 - LOCATION
      ?AUTO_6762 - CITY
      ?AUTO_6765 - TRUCK
      ?AUTO_6764 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6766 ) ( AIRPORT ?AUTO_6761 ) ( not ( = ?AUTO_6766 ?AUTO_6761 ) ) ( IN-CITY ?AUTO_6763 ?AUTO_6762 ) ( IN-CITY ?AUTO_6766 ?AUTO_6762 ) ( not ( = ?AUTO_6766 ?AUTO_6763 ) ) ( not ( = ?AUTO_6761 ?AUTO_6763 ) ) ( OBJ-AT ?AUTO_6760 ?AUTO_6763 ) ( TRUCK-AT ?AUTO_6765 ?AUTO_6766 ) ( AIRPLANE-AT ?AUTO_6764 ?AUTO_6761 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6764 ?AUTO_6761 ?AUTO_6766 )
      ( DELIVER-PKG ?AUTO_6760 ?AUTO_6761 )
      ( DELIVER-PKG-VERIFY ?AUTO_6760 ?AUTO_6761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6771 - OBJ
      ?AUTO_6772 - LOCATION
    )
    :vars
    (
      ?AUTO_6773 - LOCATION
      ?AUTO_6775 - AIRPLANE
      ?AUTO_6776 - LOCATION
      ?AUTO_6777 - CITY
      ?AUTO_6774 - TRUCK
      ?AUTO_6778 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6773 ) ( AIRPORT ?AUTO_6772 ) ( AIRPLANE-AT ?AUTO_6775 ?AUTO_6773 ) ( not ( = ?AUTO_6773 ?AUTO_6772 ) ) ( IN-CITY ?AUTO_6776 ?AUTO_6777 ) ( IN-CITY ?AUTO_6773 ?AUTO_6777 ) ( not ( = ?AUTO_6773 ?AUTO_6776 ) ) ( not ( = ?AUTO_6772 ?AUTO_6776 ) ) ( OBJ-AT ?AUTO_6771 ?AUTO_6776 ) ( TRUCK-AT ?AUTO_6774 ?AUTO_6778 ) ( IN-CITY ?AUTO_6778 ?AUTO_6777 ) ( not ( = ?AUTO_6773 ?AUTO_6778 ) ) ( not ( = ?AUTO_6772 ?AUTO_6778 ) ) ( not ( = ?AUTO_6776 ?AUTO_6778 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6774 ?AUTO_6778 ?AUTO_6773 ?AUTO_6777 )
      ( DELIVER-PKG ?AUTO_6771 ?AUTO_6772 )
      ( DELIVER-PKG-VERIFY ?AUTO_6771 ?AUTO_6772 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6789 - OBJ
      ?AUTO_6790 - LOCATION
    )
    :vars
    (
      ?AUTO_6791 - LOCATION
      ?AUTO_6795 - LOCATION
      ?AUTO_6792 - CITY
      ?AUTO_6793 - TRUCK
      ?AUTO_6796 - LOCATION
      ?AUTO_6794 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6791 ) ( AIRPORT ?AUTO_6790 ) ( not ( = ?AUTO_6791 ?AUTO_6790 ) ) ( IN-CITY ?AUTO_6795 ?AUTO_6792 ) ( IN-CITY ?AUTO_6791 ?AUTO_6792 ) ( not ( = ?AUTO_6791 ?AUTO_6795 ) ) ( not ( = ?AUTO_6790 ?AUTO_6795 ) ) ( OBJ-AT ?AUTO_6789 ?AUTO_6795 ) ( TRUCK-AT ?AUTO_6793 ?AUTO_6791 ) ( AIRPORT ?AUTO_6796 ) ( AIRPLANE-AT ?AUTO_6794 ?AUTO_6796 ) ( not ( = ?AUTO_6796 ?AUTO_6791 ) ) ( not ( = ?AUTO_6790 ?AUTO_6796 ) ) ( not ( = ?AUTO_6795 ?AUTO_6796 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6794 ?AUTO_6796 ?AUTO_6791 )
      ( DELIVER-PKG ?AUTO_6789 ?AUTO_6790 )
      ( DELIVER-PKG-VERIFY ?AUTO_6789 ?AUTO_6790 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6823 - OBJ
      ?AUTO_6824 - LOCATION
    )
    :vars
    (
      ?AUTO_6826 - LOCATION
      ?AUTO_6829 - LOCATION
      ?AUTO_6825 - CITY
      ?AUTO_6827 - LOCATION
      ?AUTO_6830 - AIRPLANE
      ?AUTO_6828 - TRUCK
      ?AUTO_6831 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6826 ) ( AIRPORT ?AUTO_6824 ) ( not ( = ?AUTO_6826 ?AUTO_6824 ) ) ( IN-CITY ?AUTO_6829 ?AUTO_6825 ) ( IN-CITY ?AUTO_6826 ?AUTO_6825 ) ( not ( = ?AUTO_6826 ?AUTO_6829 ) ) ( not ( = ?AUTO_6824 ?AUTO_6829 ) ) ( OBJ-AT ?AUTO_6823 ?AUTO_6829 ) ( AIRPORT ?AUTO_6827 ) ( AIRPLANE-AT ?AUTO_6830 ?AUTO_6827 ) ( not ( = ?AUTO_6827 ?AUTO_6826 ) ) ( not ( = ?AUTO_6824 ?AUTO_6827 ) ) ( not ( = ?AUTO_6829 ?AUTO_6827 ) ) ( TRUCK-AT ?AUTO_6828 ?AUTO_6831 ) ( IN-CITY ?AUTO_6831 ?AUTO_6825 ) ( not ( = ?AUTO_6826 ?AUTO_6831 ) ) ( not ( = ?AUTO_6824 ?AUTO_6831 ) ) ( not ( = ?AUTO_6829 ?AUTO_6831 ) ) ( not ( = ?AUTO_6827 ?AUTO_6831 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6828 ?AUTO_6831 ?AUTO_6826 ?AUTO_6825 )
      ( DELIVER-PKG ?AUTO_6823 ?AUTO_6824 )
      ( DELIVER-PKG-VERIFY ?AUTO_6823 ?AUTO_6824 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7320 - OBJ
      ?AUTO_7321 - LOCATION
    )
    :vars
    (
      ?AUTO_7326 - LOCATION
      ?AUTO_7322 - CITY
      ?AUTO_7325 - TRUCK
      ?AUTO_7323 - LOCATION
      ?AUTO_7324 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7326 ?AUTO_7322 ) ( IN-CITY ?AUTO_7321 ?AUTO_7322 ) ( not ( = ?AUTO_7321 ?AUTO_7326 ) ) ( TRUCK-AT ?AUTO_7325 ?AUTO_7321 ) ( AIRPORT ?AUTO_7323 ) ( AIRPORT ?AUTO_7326 ) ( not ( = ?AUTO_7323 ?AUTO_7326 ) ) ( not ( = ?AUTO_7321 ?AUTO_7323 ) ) ( OBJ-AT ?AUTO_7320 ?AUTO_7323 ) ( AIRPLANE-AT ?AUTO_7324 ?AUTO_7326 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7324 ?AUTO_7326 ?AUTO_7323 )
      ( DELIVER-PKG ?AUTO_7320 ?AUTO_7321 )
      ( DELIVER-PKG-VERIFY ?AUTO_7320 ?AUTO_7321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7341 - OBJ
      ?AUTO_7342 - LOCATION
    )
    :vars
    (
      ?AUTO_7346 - LOCATION
      ?AUTO_7347 - CITY
      ?AUTO_7343 - LOCATION
      ?AUTO_7345 - AIRPLANE
      ?AUTO_7344 - TRUCK
      ?AUTO_7348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7346 ?AUTO_7347 ) ( IN-CITY ?AUTO_7342 ?AUTO_7347 ) ( not ( = ?AUTO_7342 ?AUTO_7346 ) ) ( AIRPORT ?AUTO_7343 ) ( AIRPORT ?AUTO_7346 ) ( not ( = ?AUTO_7343 ?AUTO_7346 ) ) ( not ( = ?AUTO_7342 ?AUTO_7343 ) ) ( OBJ-AT ?AUTO_7341 ?AUTO_7343 ) ( AIRPLANE-AT ?AUTO_7345 ?AUTO_7346 ) ( TRUCK-AT ?AUTO_7344 ?AUTO_7348 ) ( IN-CITY ?AUTO_7348 ?AUTO_7347 ) ( not ( = ?AUTO_7342 ?AUTO_7348 ) ) ( not ( = ?AUTO_7346 ?AUTO_7348 ) ) ( not ( = ?AUTO_7343 ?AUTO_7348 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7344 ?AUTO_7348 ?AUTO_7342 ?AUTO_7347 )
      ( DELIVER-PKG ?AUTO_7341 ?AUTO_7342 )
      ( DELIVER-PKG-VERIFY ?AUTO_7341 ?AUTO_7342 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7447 - OBJ
      ?AUTO_7448 - LOCATION
    )
    :vars
    (
      ?AUTO_7452 - LOCATION
      ?AUTO_7451 - TRUCK
      ?AUTO_7449 - LOCATION
      ?AUTO_7450 - CITY
      ?AUTO_7453 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7452 ) ( AIRPORT ?AUTO_7448 ) ( not ( = ?AUTO_7452 ?AUTO_7448 ) ) ( IN-TRUCK ?AUTO_7447 ?AUTO_7451 ) ( TRUCK-AT ?AUTO_7451 ?AUTO_7449 ) ( IN-CITY ?AUTO_7449 ?AUTO_7450 ) ( IN-CITY ?AUTO_7452 ?AUTO_7450 ) ( not ( = ?AUTO_7452 ?AUTO_7449 ) ) ( not ( = ?AUTO_7448 ?AUTO_7449 ) ) ( AIRPLANE-AT ?AUTO_7453 ?AUTO_7452 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7453 ?AUTO_7452 ?AUTO_7448 )
      ( DELIVER-PKG ?AUTO_7447 ?AUTO_7448 )
      ( DELIVER-PKG-VERIFY ?AUTO_7447 ?AUTO_7448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7986 - OBJ
      ?AUTO_7987 - LOCATION
    )
    :vars
    (
      ?AUTO_7990 - LOCATION
      ?AUTO_7996 - CITY
      ?AUTO_7994 - LOCATION
      ?AUTO_7989 - TRUCK
      ?AUTO_7993 - TRUCK
      ?AUTO_7991 - LOCATION
      ?AUTO_7992 - CITY
      ?AUTO_7988 - LOCATION
      ?AUTO_7995 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7990 ?AUTO_7996 ) ( IN-CITY ?AUTO_7987 ?AUTO_7996 ) ( not ( = ?AUTO_7987 ?AUTO_7990 ) ) ( AIRPORT ?AUTO_7994 ) ( AIRPORT ?AUTO_7990 ) ( not ( = ?AUTO_7994 ?AUTO_7990 ) ) ( not ( = ?AUTO_7987 ?AUTO_7994 ) ) ( IN-TRUCK ?AUTO_7986 ?AUTO_7989 ) ( not ( = ?AUTO_7993 ?AUTO_7989 ) ) ( TRUCK-AT ?AUTO_7989 ?AUTO_7991 ) ( IN-CITY ?AUTO_7991 ?AUTO_7992 ) ( IN-CITY ?AUTO_7994 ?AUTO_7992 ) ( not ( = ?AUTO_7994 ?AUTO_7991 ) ) ( not ( = ?AUTO_7987 ?AUTO_7991 ) ) ( not ( = ?AUTO_7990 ?AUTO_7991 ) ) ( not ( = ?AUTO_7996 ?AUTO_7992 ) ) ( TRUCK-AT ?AUTO_7993 ?AUTO_7988 ) ( IN-CITY ?AUTO_7988 ?AUTO_7996 ) ( not ( = ?AUTO_7990 ?AUTO_7988 ) ) ( not ( = ?AUTO_7987 ?AUTO_7988 ) ) ( not ( = ?AUTO_7994 ?AUTO_7988 ) ) ( not ( = ?AUTO_7991 ?AUTO_7988 ) ) ( AIRPLANE-AT ?AUTO_7995 ?AUTO_7994 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7995 ?AUTO_7994 ?AUTO_7990 )
      ( DELIVER-PKG ?AUTO_7986 ?AUTO_7987 )
      ( DELIVER-PKG-VERIFY ?AUTO_7986 ?AUTO_7987 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7999 - OBJ
      ?AUTO_8000 - LOCATION
    )
    :vars
    (
      ?AUTO_8001 - LOCATION
      ?AUTO_8006 - CITY
      ?AUTO_8004 - LOCATION
      ?AUTO_8009 - TRUCK
      ?AUTO_8003 - TRUCK
      ?AUTO_8007 - LOCATION
      ?AUTO_8008 - CITY
      ?AUTO_8005 - LOCATION
      ?AUTO_8010 - LOCATION
      ?AUTO_8002 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8001 ?AUTO_8006 ) ( IN-CITY ?AUTO_8000 ?AUTO_8006 ) ( not ( = ?AUTO_8000 ?AUTO_8001 ) ) ( AIRPORT ?AUTO_8004 ) ( AIRPORT ?AUTO_8001 ) ( not ( = ?AUTO_8004 ?AUTO_8001 ) ) ( not ( = ?AUTO_8000 ?AUTO_8004 ) ) ( IN-TRUCK ?AUTO_7999 ?AUTO_8009 ) ( not ( = ?AUTO_8003 ?AUTO_8009 ) ) ( TRUCK-AT ?AUTO_8009 ?AUTO_8007 ) ( IN-CITY ?AUTO_8007 ?AUTO_8008 ) ( IN-CITY ?AUTO_8004 ?AUTO_8008 ) ( not ( = ?AUTO_8004 ?AUTO_8007 ) ) ( not ( = ?AUTO_8000 ?AUTO_8007 ) ) ( not ( = ?AUTO_8001 ?AUTO_8007 ) ) ( not ( = ?AUTO_8006 ?AUTO_8008 ) ) ( TRUCK-AT ?AUTO_8003 ?AUTO_8005 ) ( IN-CITY ?AUTO_8005 ?AUTO_8006 ) ( not ( = ?AUTO_8001 ?AUTO_8005 ) ) ( not ( = ?AUTO_8000 ?AUTO_8005 ) ) ( not ( = ?AUTO_8004 ?AUTO_8005 ) ) ( not ( = ?AUTO_8007 ?AUTO_8005 ) ) ( AIRPORT ?AUTO_8010 ) ( AIRPLANE-AT ?AUTO_8002 ?AUTO_8010 ) ( not ( = ?AUTO_8010 ?AUTO_8004 ) ) ( not ( = ?AUTO_8000 ?AUTO_8010 ) ) ( not ( = ?AUTO_8001 ?AUTO_8010 ) ) ( not ( = ?AUTO_8007 ?AUTO_8010 ) ) ( not ( = ?AUTO_8005 ?AUTO_8010 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8002 ?AUTO_8010 ?AUTO_8004 )
      ( DELIVER-PKG ?AUTO_7999 ?AUTO_8000 )
      ( DELIVER-PKG-VERIFY ?AUTO_7999 ?AUTO_8000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8050 - OBJ
      ?AUTO_8051 - LOCATION
    )
    :vars
    (
      ?AUTO_8054 - LOCATION
      ?AUTO_8058 - CITY
      ?AUTO_8053 - LOCATION
      ?AUTO_8052 - TRUCK
      ?AUTO_8060 - TRUCK
      ?AUTO_8055 - LOCATION
      ?AUTO_8059 - CITY
      ?AUTO_8056 - LOCATION
      ?AUTO_8057 - AIRPLANE
      ?AUTO_8061 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8054 ?AUTO_8058 ) ( IN-CITY ?AUTO_8051 ?AUTO_8058 ) ( not ( = ?AUTO_8051 ?AUTO_8054 ) ) ( AIRPORT ?AUTO_8053 ) ( AIRPORT ?AUTO_8054 ) ( not ( = ?AUTO_8053 ?AUTO_8054 ) ) ( not ( = ?AUTO_8051 ?AUTO_8053 ) ) ( not ( = ?AUTO_8052 ?AUTO_8060 ) ) ( IN-CITY ?AUTO_8055 ?AUTO_8059 ) ( IN-CITY ?AUTO_8053 ?AUTO_8059 ) ( not ( = ?AUTO_8053 ?AUTO_8055 ) ) ( not ( = ?AUTO_8051 ?AUTO_8055 ) ) ( not ( = ?AUTO_8054 ?AUTO_8055 ) ) ( not ( = ?AUTO_8058 ?AUTO_8059 ) ) ( TRUCK-AT ?AUTO_8052 ?AUTO_8056 ) ( IN-CITY ?AUTO_8056 ?AUTO_8058 ) ( not ( = ?AUTO_8054 ?AUTO_8056 ) ) ( not ( = ?AUTO_8051 ?AUTO_8056 ) ) ( not ( = ?AUTO_8053 ?AUTO_8056 ) ) ( not ( = ?AUTO_8055 ?AUTO_8056 ) ) ( AIRPLANE-AT ?AUTO_8057 ?AUTO_8053 ) ( OBJ-AT ?AUTO_8050 ?AUTO_8055 ) ( TRUCK-AT ?AUTO_8060 ?AUTO_8061 ) ( IN-CITY ?AUTO_8061 ?AUTO_8059 ) ( not ( = ?AUTO_8055 ?AUTO_8061 ) ) ( not ( = ?AUTO_8051 ?AUTO_8061 ) ) ( not ( = ?AUTO_8054 ?AUTO_8061 ) ) ( not ( = ?AUTO_8053 ?AUTO_8061 ) ) ( not ( = ?AUTO_8056 ?AUTO_8061 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8060 ?AUTO_8061 ?AUTO_8055 ?AUTO_8059 )
      ( DELIVER-PKG ?AUTO_8050 ?AUTO_8051 )
      ( DELIVER-PKG-VERIFY ?AUTO_8050 ?AUTO_8051 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8127 - OBJ
      ?AUTO_8128 - LOCATION
    )
    :vars
    (
      ?AUTO_8129 - TRUCK
      ?AUTO_8130 - LOCATION
      ?AUTO_8134 - CITY
      ?AUTO_8131 - LOCATION
      ?AUTO_8132 - LOCATION
      ?AUTO_8133 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8129 ?AUTO_8130 ) ( IN-CITY ?AUTO_8130 ?AUTO_8134 ) ( IN-CITY ?AUTO_8128 ?AUTO_8134 ) ( not ( = ?AUTO_8128 ?AUTO_8130 ) ) ( AIRPORT ?AUTO_8131 ) ( AIRPORT ?AUTO_8130 ) ( not ( = ?AUTO_8131 ?AUTO_8130 ) ) ( not ( = ?AUTO_8128 ?AUTO_8131 ) ) ( OBJ-AT ?AUTO_8127 ?AUTO_8131 ) ( AIRPORT ?AUTO_8132 ) ( not ( = ?AUTO_8132 ?AUTO_8131 ) ) ( not ( = ?AUTO_8128 ?AUTO_8132 ) ) ( not ( = ?AUTO_8130 ?AUTO_8132 ) ) ( AIRPLANE-AT ?AUTO_8133 ?AUTO_8130 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8133 ?AUTO_8130 ?AUTO_8132 )
      ( DELIVER-PKG ?AUTO_8127 ?AUTO_8128 )
      ( DELIVER-PKG-VERIFY ?AUTO_8127 ?AUTO_8128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8467 - OBJ
      ?AUTO_8468 - LOCATION
    )
    :vars
    (
      ?AUTO_8474 - TRUCK
      ?AUTO_8470 - LOCATION
      ?AUTO_8471 - CITY
      ?AUTO_8469 - LOCATION
      ?AUTO_8477 - LOCATION
      ?AUTO_8476 - AIRPLANE
      ?AUTO_8473 - TRUCK
      ?AUTO_8472 - LOCATION
      ?AUTO_8475 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8474 ?AUTO_8470 ) ( IN-CITY ?AUTO_8470 ?AUTO_8471 ) ( IN-CITY ?AUTO_8468 ?AUTO_8471 ) ( not ( = ?AUTO_8468 ?AUTO_8470 ) ) ( AIRPORT ?AUTO_8469 ) ( AIRPORT ?AUTO_8470 ) ( not ( = ?AUTO_8469 ?AUTO_8470 ) ) ( not ( = ?AUTO_8468 ?AUTO_8469 ) ) ( AIRPORT ?AUTO_8477 ) ( AIRPLANE-AT ?AUTO_8476 ?AUTO_8477 ) ( not ( = ?AUTO_8477 ?AUTO_8469 ) ) ( not ( = ?AUTO_8468 ?AUTO_8477 ) ) ( not ( = ?AUTO_8470 ?AUTO_8477 ) ) ( not ( = ?AUTO_8474 ?AUTO_8473 ) ) ( IN-CITY ?AUTO_8472 ?AUTO_8475 ) ( IN-CITY ?AUTO_8469 ?AUTO_8475 ) ( not ( = ?AUTO_8469 ?AUTO_8472 ) ) ( not ( = ?AUTO_8468 ?AUTO_8472 ) ) ( not ( = ?AUTO_8470 ?AUTO_8472 ) ) ( not ( = ?AUTO_8471 ?AUTO_8475 ) ) ( not ( = ?AUTO_8477 ?AUTO_8472 ) ) ( OBJ-AT ?AUTO_8467 ?AUTO_8472 ) ( TRUCK-AT ?AUTO_8473 ?AUTO_8469 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8473 ?AUTO_8469 ?AUTO_8472 ?AUTO_8475 )
      ( DELIVER-PKG ?AUTO_8467 ?AUTO_8468 )
      ( DELIVER-PKG-VERIFY ?AUTO_8467 ?AUTO_8468 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9006 - OBJ
      ?AUTO_9007 - LOCATION
    )
    :vars
    (
      ?AUTO_9008 - LOCATION
      ?AUTO_9010 - CITY
      ?AUTO_9011 - LOCATION
      ?AUTO_9014 - LOCATION
      ?AUTO_9012 - AIRPLANE
      ?AUTO_9015 - TRUCK
      ?AUTO_9016 - TRUCK
      ?AUTO_9009 - LOCATION
      ?AUTO_9013 - CITY
      ?AUTO_9017 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9008 ?AUTO_9010 ) ( IN-CITY ?AUTO_9007 ?AUTO_9010 ) ( not ( = ?AUTO_9007 ?AUTO_9008 ) ) ( AIRPORT ?AUTO_9011 ) ( AIRPORT ?AUTO_9008 ) ( not ( = ?AUTO_9011 ?AUTO_9008 ) ) ( not ( = ?AUTO_9007 ?AUTO_9011 ) ) ( AIRPORT ?AUTO_9014 ) ( AIRPLANE-AT ?AUTO_9012 ?AUTO_9014 ) ( not ( = ?AUTO_9014 ?AUTO_9011 ) ) ( not ( = ?AUTO_9007 ?AUTO_9014 ) ) ( not ( = ?AUTO_9008 ?AUTO_9014 ) ) ( not ( = ?AUTO_9015 ?AUTO_9016 ) ) ( IN-CITY ?AUTO_9009 ?AUTO_9013 ) ( IN-CITY ?AUTO_9011 ?AUTO_9013 ) ( not ( = ?AUTO_9011 ?AUTO_9009 ) ) ( not ( = ?AUTO_9007 ?AUTO_9009 ) ) ( not ( = ?AUTO_9008 ?AUTO_9009 ) ) ( not ( = ?AUTO_9010 ?AUTO_9013 ) ) ( not ( = ?AUTO_9014 ?AUTO_9009 ) ) ( OBJ-AT ?AUTO_9006 ?AUTO_9009 ) ( TRUCK-AT ?AUTO_9016 ?AUTO_9011 ) ( TRUCK-AT ?AUTO_9015 ?AUTO_9017 ) ( IN-CITY ?AUTO_9017 ?AUTO_9010 ) ( not ( = ?AUTO_9008 ?AUTO_9017 ) ) ( not ( = ?AUTO_9007 ?AUTO_9017 ) ) ( not ( = ?AUTO_9011 ?AUTO_9017 ) ) ( not ( = ?AUTO_9014 ?AUTO_9017 ) ) ( not ( = ?AUTO_9009 ?AUTO_9017 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9015 ?AUTO_9017 ?AUTO_9008 ?AUTO_9010 )
      ( DELIVER-PKG ?AUTO_9006 ?AUTO_9007 )
      ( DELIVER-PKG-VERIFY ?AUTO_9006 ?AUTO_9007 ) )
  )

)

