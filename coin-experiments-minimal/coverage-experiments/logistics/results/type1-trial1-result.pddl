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
      ?AUTO_7 - OBJ
      ?AUTO_8 - LOCATION
    )
    :vars
    (
      ?AUTO_11 - TRUCK
      ?AUTO_15 - LOCATION
      ?AUTO_13 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7 ?AUTO_11 ) ( TRUCK-AT ?AUTO_11 ?AUTO_15 ) ( IN-CITY ?AUTO_15 ?AUTO_13 ) ( IN-CITY ?AUTO_8 ?AUTO_13 ) ( not ( = ?AUTO_8 ?AUTO_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11 ?AUTO_15 ?AUTO_8 ?AUTO_13 )
      ( DELIVER-PKG ?AUTO_7 ?AUTO_8 )
      ( DELIVER-PKG-VERIFY ?AUTO_7 ?AUTO_8 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_16 - OBJ
      ?AUTO_17 - LOCATION
    )
    :vars
    (
      ?AUTO_20 - TRUCK
      ?AUTO_22 - LOCATION
      ?AUTO_21 - CITY
      ?AUTO_24 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_20 ?AUTO_22 ) ( IN-CITY ?AUTO_22 ?AUTO_21 ) ( IN-CITY ?AUTO_17 ?AUTO_21 ) ( not ( = ?AUTO_17 ?AUTO_22 ) ) ( TRUCK-AT ?AUTO_20 ?AUTO_24 ) ( OBJ-AT ?AUTO_16 ?AUTO_24 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_16 ?AUTO_20 ?AUTO_24 )
      ( DELIVER-PKG ?AUTO_16 ?AUTO_17 )
      ( DELIVER-PKG-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_28 - OBJ
      ?AUTO_29 - LOCATION
    )
    :vars
    (
      ?AUTO_30 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_28 ?AUTO_30 ) ( AIRPLANE-AT ?AUTO_30 ?AUTO_29 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_28 ?AUTO_30 ?AUTO_29 )
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
      ?AUTO_35 - AIRPLANE
      ?AUTO_40 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_33 ?AUTO_35 ) ( AIRPORT ?AUTO_40 ) ( AIRPORT ?AUTO_34 ) ( AIRPLANE-AT ?AUTO_35 ?AUTO_40 ) ( not ( = ?AUTO_40 ?AUTO_34 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_35 ?AUTO_40 ?AUTO_34 )
      ( DELIVER-PKG ?AUTO_33 ?AUTO_34 )
      ( DELIVER-PKG-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_41 - OBJ
      ?AUTO_42 - LOCATION
    )
    :vars
    (
      ?AUTO_46 - LOCATION
      ?AUTO_45 - AIRPLANE
      ?AUTO_48 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_46 ) ( AIRPORT ?AUTO_42 ) ( AIRPLANE-AT ?AUTO_45 ?AUTO_46 ) ( not ( = ?AUTO_46 ?AUTO_42 ) ) ( OBJ-AT ?AUTO_41 ?AUTO_48 ) ( AIRPLANE-AT ?AUTO_45 ?AUTO_48 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_41 ?AUTO_45 ?AUTO_48 )
      ( DELIVER-PKG ?AUTO_41 ?AUTO_42 )
      ( DELIVER-PKG-VERIFY ?AUTO_41 ?AUTO_42 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_50 - OBJ
      ?AUTO_51 - LOCATION
    )
    :vars
    (
      ?AUTO_52 - LOCATION
      ?AUTO_59 - LOCATION
      ?AUTO_55 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_52 ) ( AIRPORT ?AUTO_51 ) ( not ( = ?AUTO_52 ?AUTO_51 ) ) ( OBJ-AT ?AUTO_50 ?AUTO_52 ) ( AIRPORT ?AUTO_59 ) ( AIRPLANE-AT ?AUTO_55 ?AUTO_59 ) ( not ( = ?AUTO_59 ?AUTO_52 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_55 ?AUTO_59 ?AUTO_52 )
      ( DELIVER-PKG ?AUTO_50 ?AUTO_51 )
      ( DELIVER-PKG-VERIFY ?AUTO_50 ?AUTO_51 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_66 - LOCATION
      ?AUTO_65 - LOCATION
      ?AUTO_62 - AIRPLANE
      ?AUTO_67 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_66 ) ( AIRPORT ?AUTO_61 ) ( not ( = ?AUTO_66 ?AUTO_61 ) ) ( AIRPORT ?AUTO_65 ) ( AIRPLANE-AT ?AUTO_62 ?AUTO_65 ) ( not ( = ?AUTO_65 ?AUTO_66 ) ) ( TRUCK-AT ?AUTO_67 ?AUTO_66 ) ( IN-TRUCK ?AUTO_60 ?AUTO_67 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_60 ?AUTO_67 ?AUTO_66 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_70 - OBJ
      ?AUTO_71 - LOCATION
    )
    :vars
    (
      ?AUTO_73 - LOCATION
      ?AUTO_77 - LOCATION
      ?AUTO_76 - AIRPLANE
      ?AUTO_75 - TRUCK
      ?AUTO_81 - LOCATION
      ?AUTO_79 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_73 ) ( AIRPORT ?AUTO_71 ) ( not ( = ?AUTO_73 ?AUTO_71 ) ) ( AIRPORT ?AUTO_77 ) ( AIRPLANE-AT ?AUTO_76 ?AUTO_77 ) ( not ( = ?AUTO_77 ?AUTO_73 ) ) ( IN-TRUCK ?AUTO_70 ?AUTO_75 ) ( TRUCK-AT ?AUTO_75 ?AUTO_81 ) ( IN-CITY ?AUTO_81 ?AUTO_79 ) ( IN-CITY ?AUTO_73 ?AUTO_79 ) ( not ( = ?AUTO_73 ?AUTO_81 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_75 ?AUTO_81 ?AUTO_73 ?AUTO_79 )
      ( DELIVER-PKG ?AUTO_70 ?AUTO_71 )
      ( DELIVER-PKG-VERIFY ?AUTO_70 ?AUTO_71 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_82 - OBJ
      ?AUTO_83 - LOCATION
    )
    :vars
    (
      ?AUTO_89 - LOCATION
      ?AUTO_88 - LOCATION
      ?AUTO_86 - AIRPLANE
      ?AUTO_87 - TRUCK
      ?AUTO_84 - LOCATION
      ?AUTO_91 - CITY
      ?AUTO_93 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_89 ) ( AIRPORT ?AUTO_83 ) ( not ( = ?AUTO_89 ?AUTO_83 ) ) ( AIRPORT ?AUTO_88 ) ( AIRPLANE-AT ?AUTO_86 ?AUTO_88 ) ( not ( = ?AUTO_88 ?AUTO_89 ) ) ( TRUCK-AT ?AUTO_87 ?AUTO_84 ) ( IN-CITY ?AUTO_84 ?AUTO_91 ) ( IN-CITY ?AUTO_89 ?AUTO_91 ) ( not ( = ?AUTO_89 ?AUTO_84 ) ) ( TRUCK-AT ?AUTO_87 ?AUTO_93 ) ( OBJ-AT ?AUTO_82 ?AUTO_93 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_82 ?AUTO_87 ?AUTO_93 )
      ( DELIVER-PKG ?AUTO_82 ?AUTO_83 )
      ( DELIVER-PKG-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_233 - OBJ
      ?AUTO_234 - LOCATION
    )
    :vars
    (
      ?AUTO_240 - LOCATION
      ?AUTO_238 - CITY
      ?AUTO_239 - TRUCK
      ?AUTO_244 - LOCATION
      ?AUTO_242 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_240 ?AUTO_238 ) ( IN-CITY ?AUTO_234 ?AUTO_238 ) ( not ( = ?AUTO_234 ?AUTO_240 ) ) ( OBJ-AT ?AUTO_233 ?AUTO_240 ) ( TRUCK-AT ?AUTO_239 ?AUTO_244 ) ( IN-CITY ?AUTO_244 ?AUTO_242 ) ( IN-CITY ?AUTO_240 ?AUTO_242 ) ( not ( = ?AUTO_240 ?AUTO_244 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_239 ?AUTO_244 ?AUTO_240 ?AUTO_242 )
      ( DELIVER-PKG ?AUTO_233 ?AUTO_234 )
      ( DELIVER-PKG-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_351 - OBJ
      ?AUTO_352 - LOCATION
    )
    :vars
    (
      ?AUTO_356 - LOCATION
      ?AUTO_354 - AIRPLANE
      ?AUTO_357 - LOCATION
      ?AUTO_358 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_356 ) ( AIRPORT ?AUTO_352 ) ( AIRPLANE-AT ?AUTO_354 ?AUTO_356 ) ( not ( = ?AUTO_356 ?AUTO_352 ) ) ( AIRPLANE-AT ?AUTO_354 ?AUTO_357 ) ( TRUCK-AT ?AUTO_358 ?AUTO_357 ) ( IN-TRUCK ?AUTO_351 ?AUTO_358 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_351 ?AUTO_358 ?AUTO_357 )
      ( DELIVER-PKG ?AUTO_351 ?AUTO_352 )
      ( DELIVER-PKG-VERIFY ?AUTO_351 ?AUTO_352 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_363 - OBJ
      ?AUTO_364 - LOCATION
    )
    :vars
    (
      ?AUTO_366 - LOCATION
      ?AUTO_368 - AIRPLANE
      ?AUTO_365 - LOCATION
      ?AUTO_370 - TRUCK
      ?AUTO_374 - LOCATION
      ?AUTO_372 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_366 ) ( AIRPORT ?AUTO_364 ) ( AIRPLANE-AT ?AUTO_368 ?AUTO_366 ) ( not ( = ?AUTO_366 ?AUTO_364 ) ) ( AIRPLANE-AT ?AUTO_368 ?AUTO_365 ) ( IN-TRUCK ?AUTO_363 ?AUTO_370 ) ( TRUCK-AT ?AUTO_370 ?AUTO_374 ) ( IN-CITY ?AUTO_374 ?AUTO_372 ) ( IN-CITY ?AUTO_365 ?AUTO_372 ) ( not ( = ?AUTO_365 ?AUTO_374 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_370 ?AUTO_374 ?AUTO_365 ?AUTO_372 )
      ( DELIVER-PKG ?AUTO_363 ?AUTO_364 )
      ( DELIVER-PKG-VERIFY ?AUTO_363 ?AUTO_364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_391 - OBJ
      ?AUTO_392 - LOCATION
    )
    :vars
    (
      ?AUTO_395 - LOCATION
      ?AUTO_400 - TRUCK
      ?AUTO_397 - LOCATION
      ?AUTO_398 - CITY
      ?AUTO_403 - LOCATION
      ?AUTO_393 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_395 ) ( AIRPORT ?AUTO_392 ) ( not ( = ?AUTO_395 ?AUTO_392 ) ) ( IN-TRUCK ?AUTO_391 ?AUTO_400 ) ( TRUCK-AT ?AUTO_400 ?AUTO_397 ) ( IN-CITY ?AUTO_397 ?AUTO_398 ) ( IN-CITY ?AUTO_395 ?AUTO_398 ) ( not ( = ?AUTO_395 ?AUTO_397 ) ) ( AIRPORT ?AUTO_403 ) ( AIRPLANE-AT ?AUTO_393 ?AUTO_403 ) ( not ( = ?AUTO_403 ?AUTO_395 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_393 ?AUTO_403 ?AUTO_395 )
      ( DELIVER-PKG ?AUTO_391 ?AUTO_392 )
      ( DELIVER-PKG-VERIFY ?AUTO_391 ?AUTO_392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_419 - OBJ
      ?AUTO_420 - LOCATION
    )
    :vars
    (
      ?AUTO_424 - LOCATION
      ?AUTO_428 - LOCATION
      ?AUTO_421 - CITY
      ?AUTO_429 - LOCATION
      ?AUTO_423 - AIRPLANE
      ?AUTO_427 - TRUCK
      ?AUTO_433 - LOCATION
      ?AUTO_431 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_424 ) ( AIRPORT ?AUTO_420 ) ( not ( = ?AUTO_424 ?AUTO_420 ) ) ( IN-CITY ?AUTO_428 ?AUTO_421 ) ( IN-CITY ?AUTO_424 ?AUTO_421 ) ( not ( = ?AUTO_424 ?AUTO_428 ) ) ( AIRPORT ?AUTO_429 ) ( AIRPLANE-AT ?AUTO_423 ?AUTO_429 ) ( not ( = ?AUTO_429 ?AUTO_424 ) ) ( OBJ-AT ?AUTO_419 ?AUTO_428 ) ( TRUCK-AT ?AUTO_427 ?AUTO_433 ) ( IN-CITY ?AUTO_433 ?AUTO_431 ) ( IN-CITY ?AUTO_428 ?AUTO_431 ) ( not ( = ?AUTO_428 ?AUTO_433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_427 ?AUTO_433 ?AUTO_428 ?AUTO_431 )
      ( DELIVER-PKG ?AUTO_419 ?AUTO_420 )
      ( DELIVER-PKG-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_498 - OBJ
      ?AUTO_499 - LOCATION
    )
    :vars
    (
      ?AUTO_502 - LOCATION
      ?AUTO_501 - CITY
      ?AUTO_504 - TRUCK
      ?AUTO_506 - LOCATION
      ?AUTO_505 - CITY
      ?AUTO_507 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_502 ?AUTO_501 ) ( IN-CITY ?AUTO_499 ?AUTO_501 ) ( not ( = ?AUTO_499 ?AUTO_502 ) ) ( TRUCK-AT ?AUTO_504 ?AUTO_506 ) ( IN-CITY ?AUTO_506 ?AUTO_505 ) ( IN-CITY ?AUTO_502 ?AUTO_505 ) ( not ( = ?AUTO_502 ?AUTO_506 ) ) ( IN-AIRPLANE ?AUTO_498 ?AUTO_507 ) ( AIRPLANE-AT ?AUTO_507 ?AUTO_502 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_498 ?AUTO_507 ?AUTO_502 )
      ( DELIVER-PKG ?AUTO_498 ?AUTO_499 )
      ( DELIVER-PKG-VERIFY ?AUTO_498 ?AUTO_499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_510 - OBJ
      ?AUTO_511 - LOCATION
    )
    :vars
    (
      ?AUTO_516 - LOCATION
      ?AUTO_513 - CITY
      ?AUTO_512 - TRUCK
      ?AUTO_519 - LOCATION
      ?AUTO_518 - CITY
      ?AUTO_517 - AIRPLANE
      ?AUTO_522 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_516 ?AUTO_513 ) ( IN-CITY ?AUTO_511 ?AUTO_513 ) ( not ( = ?AUTO_511 ?AUTO_516 ) ) ( TRUCK-AT ?AUTO_512 ?AUTO_519 ) ( IN-CITY ?AUTO_519 ?AUTO_518 ) ( IN-CITY ?AUTO_516 ?AUTO_518 ) ( not ( = ?AUTO_516 ?AUTO_519 ) ) ( IN-AIRPLANE ?AUTO_510 ?AUTO_517 ) ( AIRPORT ?AUTO_522 ) ( AIRPORT ?AUTO_516 ) ( AIRPLANE-AT ?AUTO_517 ?AUTO_522 ) ( not ( = ?AUTO_522 ?AUTO_516 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_517 ?AUTO_522 ?AUTO_516 )
      ( DELIVER-PKG ?AUTO_510 ?AUTO_511 )
      ( DELIVER-PKG-VERIFY ?AUTO_510 ?AUTO_511 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_537 - OBJ
      ?AUTO_538 - LOCATION
    )
    :vars
    (
      ?AUTO_541 - LOCATION
      ?AUTO_545 - CITY
      ?AUTO_539 - TRUCK
      ?AUTO_543 - LOCATION
      ?AUTO_542 - CITY
      ?AUTO_547 - LOCATION
      ?AUTO_546 - AIRPLANE
      ?AUTO_549 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_541 ?AUTO_545 ) ( IN-CITY ?AUTO_538 ?AUTO_545 ) ( not ( = ?AUTO_538 ?AUTO_541 ) ) ( TRUCK-AT ?AUTO_539 ?AUTO_543 ) ( IN-CITY ?AUTO_543 ?AUTO_542 ) ( IN-CITY ?AUTO_541 ?AUTO_542 ) ( not ( = ?AUTO_541 ?AUTO_543 ) ) ( AIRPORT ?AUTO_547 ) ( AIRPORT ?AUTO_541 ) ( AIRPLANE-AT ?AUTO_546 ?AUTO_547 ) ( not ( = ?AUTO_547 ?AUTO_541 ) ) ( OBJ-AT ?AUTO_537 ?AUTO_549 ) ( AIRPLANE-AT ?AUTO_546 ?AUTO_549 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_537 ?AUTO_546 ?AUTO_549 )
      ( DELIVER-PKG ?AUTO_537 ?AUTO_538 )
      ( DELIVER-PKG-VERIFY ?AUTO_537 ?AUTO_538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_892 - OBJ
      ?AUTO_893 - LOCATION
    )
    :vars
    (
      ?AUTO_898 - TRUCK
      ?AUTO_897 - LOCATION
      ?AUTO_896 - CITY
      ?AUTO_899 - LOCATION
      ?AUTO_900 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_898 ?AUTO_897 ) ( IN-CITY ?AUTO_897 ?AUTO_896 ) ( IN-CITY ?AUTO_893 ?AUTO_896 ) ( not ( = ?AUTO_893 ?AUTO_897 ) ) ( TRUCK-AT ?AUTO_898 ?AUTO_899 ) ( IN-AIRPLANE ?AUTO_892 ?AUTO_900 ) ( AIRPLANE-AT ?AUTO_900 ?AUTO_899 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_892 ?AUTO_900 ?AUTO_899 )
      ( DELIVER-PKG ?AUTO_892 ?AUTO_893 )
      ( DELIVER-PKG-VERIFY ?AUTO_892 ?AUTO_893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_905 - OBJ
      ?AUTO_906 - LOCATION
    )
    :vars
    (
      ?AUTO_910 - TRUCK
      ?AUTO_911 - LOCATION
      ?AUTO_912 - CITY
      ?AUTO_907 - LOCATION
      ?AUTO_908 - AIRPLANE
      ?AUTO_916 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_910 ?AUTO_911 ) ( IN-CITY ?AUTO_911 ?AUTO_912 ) ( IN-CITY ?AUTO_906 ?AUTO_912 ) ( not ( = ?AUTO_906 ?AUTO_911 ) ) ( TRUCK-AT ?AUTO_910 ?AUTO_907 ) ( IN-AIRPLANE ?AUTO_905 ?AUTO_908 ) ( AIRPORT ?AUTO_916 ) ( AIRPORT ?AUTO_907 ) ( AIRPLANE-AT ?AUTO_908 ?AUTO_916 ) ( not ( = ?AUTO_916 ?AUTO_907 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_908 ?AUTO_916 ?AUTO_907 )
      ( DELIVER-PKG ?AUTO_905 ?AUTO_906 )
      ( DELIVER-PKG-VERIFY ?AUTO_905 ?AUTO_906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_933 - OBJ
      ?AUTO_934 - LOCATION
    )
    :vars
    (
      ?AUTO_937 - TRUCK
      ?AUTO_940 - LOCATION
      ?AUTO_935 - CITY
      ?AUTO_939 - LOCATION
      ?AUTO_941 - LOCATION
      ?AUTO_936 - AIRPLANE
      ?AUTO_944 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_937 ?AUTO_940 ) ( IN-CITY ?AUTO_940 ?AUTO_935 ) ( IN-CITY ?AUTO_934 ?AUTO_935 ) ( not ( = ?AUTO_934 ?AUTO_940 ) ) ( TRUCK-AT ?AUTO_937 ?AUTO_939 ) ( AIRPORT ?AUTO_941 ) ( AIRPORT ?AUTO_939 ) ( AIRPLANE-AT ?AUTO_936 ?AUTO_941 ) ( not ( = ?AUTO_941 ?AUTO_939 ) ) ( OBJ-AT ?AUTO_933 ?AUTO_944 ) ( AIRPLANE-AT ?AUTO_936 ?AUTO_944 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_933 ?AUTO_936 ?AUTO_944 )
      ( DELIVER-PKG ?AUTO_933 ?AUTO_934 )
      ( DELIVER-PKG-VERIFY ?AUTO_933 ?AUTO_934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_946 - OBJ
      ?AUTO_947 - LOCATION
    )
    :vars
    (
      ?AUTO_955 - TRUCK
      ?AUTO_954 - LOCATION
      ?AUTO_952 - CITY
      ?AUTO_950 - LOCATION
      ?AUTO_956 - LOCATION
      ?AUTO_959 - LOCATION
      ?AUTO_951 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_955 ?AUTO_954 ) ( IN-CITY ?AUTO_954 ?AUTO_952 ) ( IN-CITY ?AUTO_947 ?AUTO_952 ) ( not ( = ?AUTO_947 ?AUTO_954 ) ) ( TRUCK-AT ?AUTO_955 ?AUTO_950 ) ( AIRPORT ?AUTO_956 ) ( AIRPORT ?AUTO_950 ) ( not ( = ?AUTO_956 ?AUTO_950 ) ) ( OBJ-AT ?AUTO_946 ?AUTO_956 ) ( AIRPORT ?AUTO_959 ) ( AIRPLANE-AT ?AUTO_951 ?AUTO_959 ) ( not ( = ?AUTO_959 ?AUTO_956 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_951 ?AUTO_959 ?AUTO_956 )
      ( DELIVER-PKG ?AUTO_946 ?AUTO_947 )
      ( DELIVER-PKG-VERIFY ?AUTO_946 ?AUTO_947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1070 - OBJ
      ?AUTO_1071 - LOCATION
    )
    :vars
    (
      ?AUTO_1074 - TRUCK
      ?AUTO_1077 - LOCATION
      ?AUTO_1080 - CITY
      ?AUTO_1073 - LOCATION
      ?AUTO_1072 - LOCATION
      ?AUTO_1079 - LOCATION
      ?AUTO_1078 - AIRPLANE
      ?AUTO_1081 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1074 ?AUTO_1077 ) ( IN-CITY ?AUTO_1077 ?AUTO_1080 ) ( IN-CITY ?AUTO_1071 ?AUTO_1080 ) ( not ( = ?AUTO_1071 ?AUTO_1077 ) ) ( TRUCK-AT ?AUTO_1074 ?AUTO_1073 ) ( AIRPORT ?AUTO_1072 ) ( AIRPORT ?AUTO_1073 ) ( not ( = ?AUTO_1072 ?AUTO_1073 ) ) ( AIRPORT ?AUTO_1079 ) ( AIRPLANE-AT ?AUTO_1078 ?AUTO_1079 ) ( not ( = ?AUTO_1079 ?AUTO_1072 ) ) ( TRUCK-AT ?AUTO_1081 ?AUTO_1072 ) ( IN-TRUCK ?AUTO_1070 ?AUTO_1081 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1070 ?AUTO_1081 ?AUTO_1072 )
      ( DELIVER-PKG ?AUTO_1070 ?AUTO_1071 )
      ( DELIVER-PKG-VERIFY ?AUTO_1070 ?AUTO_1071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1084 - OBJ
      ?AUTO_1085 - LOCATION
    )
    :vars
    (
      ?AUTO_1092 - TRUCK
      ?AUTO_1087 - LOCATION
      ?AUTO_1093 - CITY
      ?AUTO_1094 - LOCATION
      ?AUTO_1088 - LOCATION
      ?AUTO_1086 - LOCATION
      ?AUTO_1095 - AIRPLANE
      ?AUTO_1089 - TRUCK
      ?AUTO_1099 - LOCATION
      ?AUTO_1097 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1092 ?AUTO_1087 ) ( IN-CITY ?AUTO_1087 ?AUTO_1093 ) ( IN-CITY ?AUTO_1085 ?AUTO_1093 ) ( not ( = ?AUTO_1085 ?AUTO_1087 ) ) ( TRUCK-AT ?AUTO_1092 ?AUTO_1094 ) ( AIRPORT ?AUTO_1088 ) ( AIRPORT ?AUTO_1094 ) ( not ( = ?AUTO_1088 ?AUTO_1094 ) ) ( AIRPORT ?AUTO_1086 ) ( AIRPLANE-AT ?AUTO_1095 ?AUTO_1086 ) ( not ( = ?AUTO_1086 ?AUTO_1088 ) ) ( IN-TRUCK ?AUTO_1084 ?AUTO_1089 ) ( TRUCK-AT ?AUTO_1089 ?AUTO_1099 ) ( IN-CITY ?AUTO_1099 ?AUTO_1097 ) ( IN-CITY ?AUTO_1088 ?AUTO_1097 ) ( not ( = ?AUTO_1088 ?AUTO_1099 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1089 ?AUTO_1099 ?AUTO_1088 ?AUTO_1097 )
      ( DELIVER-PKG ?AUTO_1084 ?AUTO_1085 )
      ( DELIVER-PKG-VERIFY ?AUTO_1084 ?AUTO_1085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1126 - OBJ
      ?AUTO_1127 - LOCATION
    )
    :vars
    (
      ?AUTO_1134 - TRUCK
      ?AUTO_1133 - LOCATION
      ?AUTO_1132 - CITY
      ?AUTO_1136 - LOCATION
      ?AUTO_1131 - LOCATION
      ?AUTO_1138 - LOCATION
      ?AUTO_1130 - AIRPLANE
      ?AUTO_1135 - TRUCK
      ?AUTO_1128 - LOCATION
      ?AUTO_1129 - CITY
      ?AUTO_1141 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1134 ?AUTO_1133 ) ( IN-CITY ?AUTO_1133 ?AUTO_1132 ) ( IN-CITY ?AUTO_1127 ?AUTO_1132 ) ( not ( = ?AUTO_1127 ?AUTO_1133 ) ) ( TRUCK-AT ?AUTO_1134 ?AUTO_1136 ) ( AIRPORT ?AUTO_1131 ) ( AIRPORT ?AUTO_1136 ) ( not ( = ?AUTO_1131 ?AUTO_1136 ) ) ( AIRPORT ?AUTO_1138 ) ( AIRPLANE-AT ?AUTO_1130 ?AUTO_1138 ) ( not ( = ?AUTO_1138 ?AUTO_1131 ) ) ( TRUCK-AT ?AUTO_1135 ?AUTO_1128 ) ( IN-CITY ?AUTO_1128 ?AUTO_1129 ) ( IN-CITY ?AUTO_1131 ?AUTO_1129 ) ( not ( = ?AUTO_1131 ?AUTO_1128 ) ) ( TRUCK-AT ?AUTO_1135 ?AUTO_1141 ) ( OBJ-AT ?AUTO_1126 ?AUTO_1141 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1126 ?AUTO_1135 ?AUTO_1141 )
      ( DELIVER-PKG ?AUTO_1126 ?AUTO_1127 )
      ( DELIVER-PKG-VERIFY ?AUTO_1126 ?AUTO_1127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1349 - OBJ
      ?AUTO_1350 - LOCATION
    )
    :vars
    (
      ?AUTO_1353 - TRUCK
      ?AUTO_1362 - LOCATION
      ?AUTO_1351 - CITY
      ?AUTO_1354 - LOCATION
      ?AUTO_1361 - LOCATION
      ?AUTO_1352 - LOCATION
      ?AUTO_1358 - AIRPLANE
      ?AUTO_1356 - LOCATION
      ?AUTO_1363 - CITY
      ?AUTO_1359 - TRUCK
      ?AUTO_1367 - LOCATION
      ?AUTO_1365 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1353 ?AUTO_1362 ) ( IN-CITY ?AUTO_1362 ?AUTO_1351 ) ( IN-CITY ?AUTO_1350 ?AUTO_1351 ) ( not ( = ?AUTO_1350 ?AUTO_1362 ) ) ( TRUCK-AT ?AUTO_1353 ?AUTO_1354 ) ( AIRPORT ?AUTO_1361 ) ( AIRPORT ?AUTO_1354 ) ( not ( = ?AUTO_1361 ?AUTO_1354 ) ) ( AIRPORT ?AUTO_1352 ) ( AIRPLANE-AT ?AUTO_1358 ?AUTO_1352 ) ( not ( = ?AUTO_1352 ?AUTO_1361 ) ) ( IN-CITY ?AUTO_1356 ?AUTO_1363 ) ( IN-CITY ?AUTO_1361 ?AUTO_1363 ) ( not ( = ?AUTO_1361 ?AUTO_1356 ) ) ( OBJ-AT ?AUTO_1349 ?AUTO_1356 ) ( TRUCK-AT ?AUTO_1359 ?AUTO_1367 ) ( IN-CITY ?AUTO_1367 ?AUTO_1365 ) ( IN-CITY ?AUTO_1356 ?AUTO_1365 ) ( not ( = ?AUTO_1356 ?AUTO_1367 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1359 ?AUTO_1367 ?AUTO_1356 ?AUTO_1365 )
      ( DELIVER-PKG ?AUTO_1349 ?AUTO_1350 )
      ( DELIVER-PKG-VERIFY ?AUTO_1349 ?AUTO_1350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1647 - OBJ
      ?AUTO_1648 - LOCATION
    )
    :vars
    (
      ?AUTO_1653 - LOCATION
      ?AUTO_1655 - CITY
      ?AUTO_1656 - LOCATION
      ?AUTO_1657 - LOCATION
      ?AUTO_1651 - AIRPLANE
      ?AUTO_1652 - TRUCK
      ?AUTO_1661 - LOCATION
      ?AUTO_1659 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1653 ?AUTO_1655 ) ( IN-CITY ?AUTO_1648 ?AUTO_1655 ) ( not ( = ?AUTO_1648 ?AUTO_1653 ) ) ( AIRPORT ?AUTO_1656 ) ( AIRPORT ?AUTO_1653 ) ( not ( = ?AUTO_1656 ?AUTO_1653 ) ) ( OBJ-AT ?AUTO_1647 ?AUTO_1656 ) ( AIRPORT ?AUTO_1657 ) ( AIRPLANE-AT ?AUTO_1651 ?AUTO_1657 ) ( not ( = ?AUTO_1657 ?AUTO_1656 ) ) ( TRUCK-AT ?AUTO_1652 ?AUTO_1661 ) ( IN-CITY ?AUTO_1661 ?AUTO_1659 ) ( IN-CITY ?AUTO_1653 ?AUTO_1659 ) ( not ( = ?AUTO_1653 ?AUTO_1661 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1652 ?AUTO_1661 ?AUTO_1653 ?AUTO_1659 )
      ( DELIVER-PKG ?AUTO_1647 ?AUTO_1648 )
      ( DELIVER-PKG-VERIFY ?AUTO_1647 ?AUTO_1648 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1664 - OBJ
      ?AUTO_1665 - LOCATION
    )
    :vars
    (
      ?AUTO_1671 - LOCATION
      ?AUTO_1670 - CITY
      ?AUTO_1672 - LOCATION
      ?AUTO_1675 - LOCATION
      ?AUTO_1673 - AIRPLANE
      ?AUTO_1674 - TRUCK
      ?AUTO_1669 - LOCATION
      ?AUTO_1666 - CITY
      ?AUTO_1676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1671 ?AUTO_1670 ) ( IN-CITY ?AUTO_1665 ?AUTO_1670 ) ( not ( = ?AUTO_1665 ?AUTO_1671 ) ) ( AIRPORT ?AUTO_1672 ) ( AIRPORT ?AUTO_1671 ) ( not ( = ?AUTO_1672 ?AUTO_1671 ) ) ( AIRPORT ?AUTO_1675 ) ( AIRPLANE-AT ?AUTO_1673 ?AUTO_1675 ) ( not ( = ?AUTO_1675 ?AUTO_1672 ) ) ( TRUCK-AT ?AUTO_1674 ?AUTO_1669 ) ( IN-CITY ?AUTO_1669 ?AUTO_1666 ) ( IN-CITY ?AUTO_1671 ?AUTO_1666 ) ( not ( = ?AUTO_1671 ?AUTO_1669 ) ) ( TRUCK-AT ?AUTO_1676 ?AUTO_1672 ) ( IN-TRUCK ?AUTO_1664 ?AUTO_1676 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1664 ?AUTO_1676 ?AUTO_1672 )
      ( DELIVER-PKG ?AUTO_1664 ?AUTO_1665 )
      ( DELIVER-PKG-VERIFY ?AUTO_1664 ?AUTO_1665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1679 - OBJ
      ?AUTO_1680 - LOCATION
    )
    :vars
    (
      ?AUTO_1685 - LOCATION
      ?AUTO_1681 - CITY
      ?AUTO_1691 - LOCATION
      ?AUTO_1687 - LOCATION
      ?AUTO_1690 - AIRPLANE
      ?AUTO_1686 - TRUCK
      ?AUTO_1682 - LOCATION
      ?AUTO_1684 - CITY
      ?AUTO_1683 - TRUCK
      ?AUTO_1695 - LOCATION
      ?AUTO_1693 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1685 ?AUTO_1681 ) ( IN-CITY ?AUTO_1680 ?AUTO_1681 ) ( not ( = ?AUTO_1680 ?AUTO_1685 ) ) ( AIRPORT ?AUTO_1691 ) ( AIRPORT ?AUTO_1685 ) ( not ( = ?AUTO_1691 ?AUTO_1685 ) ) ( AIRPORT ?AUTO_1687 ) ( AIRPLANE-AT ?AUTO_1690 ?AUTO_1687 ) ( not ( = ?AUTO_1687 ?AUTO_1691 ) ) ( TRUCK-AT ?AUTO_1686 ?AUTO_1682 ) ( IN-CITY ?AUTO_1682 ?AUTO_1684 ) ( IN-CITY ?AUTO_1685 ?AUTO_1684 ) ( not ( = ?AUTO_1685 ?AUTO_1682 ) ) ( IN-TRUCK ?AUTO_1679 ?AUTO_1683 ) ( TRUCK-AT ?AUTO_1683 ?AUTO_1695 ) ( IN-CITY ?AUTO_1695 ?AUTO_1693 ) ( IN-CITY ?AUTO_1691 ?AUTO_1693 ) ( not ( = ?AUTO_1691 ?AUTO_1695 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1683 ?AUTO_1695 ?AUTO_1691 ?AUTO_1693 )
      ( DELIVER-PKG ?AUTO_1679 ?AUTO_1680 )
      ( DELIVER-PKG-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1696 - OBJ
      ?AUTO_1697 - LOCATION
    )
    :vars
    (
      ?AUTO_1707 - LOCATION
      ?AUTO_1700 - CITY
      ?AUTO_1704 - LOCATION
      ?AUTO_1710 - LOCATION
      ?AUTO_1701 - AIRPLANE
      ?AUTO_1708 - TRUCK
      ?AUTO_1702 - LOCATION
      ?AUTO_1709 - CITY
      ?AUTO_1703 - TRUCK
      ?AUTO_1706 - LOCATION
      ?AUTO_1705 - CITY
      ?AUTO_1712 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1707 ?AUTO_1700 ) ( IN-CITY ?AUTO_1697 ?AUTO_1700 ) ( not ( = ?AUTO_1697 ?AUTO_1707 ) ) ( AIRPORT ?AUTO_1704 ) ( AIRPORT ?AUTO_1707 ) ( not ( = ?AUTO_1704 ?AUTO_1707 ) ) ( AIRPORT ?AUTO_1710 ) ( AIRPLANE-AT ?AUTO_1701 ?AUTO_1710 ) ( not ( = ?AUTO_1710 ?AUTO_1704 ) ) ( TRUCK-AT ?AUTO_1708 ?AUTO_1702 ) ( IN-CITY ?AUTO_1702 ?AUTO_1709 ) ( IN-CITY ?AUTO_1707 ?AUTO_1709 ) ( not ( = ?AUTO_1707 ?AUTO_1702 ) ) ( TRUCK-AT ?AUTO_1703 ?AUTO_1706 ) ( IN-CITY ?AUTO_1706 ?AUTO_1705 ) ( IN-CITY ?AUTO_1704 ?AUTO_1705 ) ( not ( = ?AUTO_1704 ?AUTO_1706 ) ) ( TRUCK-AT ?AUTO_1703 ?AUTO_1712 ) ( OBJ-AT ?AUTO_1696 ?AUTO_1712 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1696 ?AUTO_1703 ?AUTO_1712 )
      ( DELIVER-PKG ?AUTO_1696 ?AUTO_1697 )
      ( DELIVER-PKG-VERIFY ?AUTO_1696 ?AUTO_1697 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2312 - OBJ
      ?AUTO_2313 - LOCATION
    )
    :vars
    (
      ?AUTO_2315 - LOCATION
      ?AUTO_2318 - CITY
      ?AUTO_2319 - AIRPLANE
      ?AUTO_2320 - LOCATION
      ?AUTO_2316 - TRUCK
      ?AUTO_2325 - LOCATION
      ?AUTO_2323 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2315 ?AUTO_2318 ) ( IN-CITY ?AUTO_2313 ?AUTO_2318 ) ( not ( = ?AUTO_2313 ?AUTO_2315 ) ) ( IN-AIRPLANE ?AUTO_2312 ?AUTO_2319 ) ( AIRPORT ?AUTO_2320 ) ( AIRPORT ?AUTO_2315 ) ( AIRPLANE-AT ?AUTO_2319 ?AUTO_2320 ) ( not ( = ?AUTO_2320 ?AUTO_2315 ) ) ( TRUCK-AT ?AUTO_2316 ?AUTO_2325 ) ( IN-CITY ?AUTO_2325 ?AUTO_2323 ) ( IN-CITY ?AUTO_2315 ?AUTO_2323 ) ( not ( = ?AUTO_2315 ?AUTO_2325 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2316 ?AUTO_2325 ?AUTO_2315 ?AUTO_2323 )
      ( DELIVER-PKG ?AUTO_2312 ?AUTO_2313 )
      ( DELIVER-PKG-VERIFY ?AUTO_2312 ?AUTO_2313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2360 - OBJ
      ?AUTO_2361 - LOCATION
    )
    :vars
    (
      ?AUTO_2369 - LOCATION
      ?AUTO_2365 - CITY
      ?AUTO_2364 - LOCATION
      ?AUTO_2371 - AIRPLANE
      ?AUTO_2368 - TRUCK
      ?AUTO_2366 - LOCATION
      ?AUTO_2370 - CITY
      ?AUTO_2367 - LOCATION
      ?AUTO_2372 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2369 ?AUTO_2365 ) ( IN-CITY ?AUTO_2361 ?AUTO_2365 ) ( not ( = ?AUTO_2361 ?AUTO_2369 ) ) ( AIRPORT ?AUTO_2364 ) ( AIRPORT ?AUTO_2369 ) ( AIRPLANE-AT ?AUTO_2371 ?AUTO_2364 ) ( not ( = ?AUTO_2364 ?AUTO_2369 ) ) ( TRUCK-AT ?AUTO_2368 ?AUTO_2366 ) ( IN-CITY ?AUTO_2366 ?AUTO_2370 ) ( IN-CITY ?AUTO_2369 ?AUTO_2370 ) ( not ( = ?AUTO_2369 ?AUTO_2366 ) ) ( AIRPLANE-AT ?AUTO_2371 ?AUTO_2367 ) ( TRUCK-AT ?AUTO_2372 ?AUTO_2367 ) ( IN-TRUCK ?AUTO_2360 ?AUTO_2372 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2360 ?AUTO_2372 ?AUTO_2367 )
      ( DELIVER-PKG ?AUTO_2360 ?AUTO_2361 )
      ( DELIVER-PKG-VERIFY ?AUTO_2360 ?AUTO_2361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2375 - OBJ
      ?AUTO_2376 - LOCATION
    )
    :vars
    (
      ?AUTO_2381 - LOCATION
      ?AUTO_2378 - CITY
      ?AUTO_2383 - LOCATION
      ?AUTO_2384 - AIRPLANE
      ?AUTO_2379 - TRUCK
      ?AUTO_2387 - LOCATION
      ?AUTO_2385 - CITY
      ?AUTO_2386 - LOCATION
      ?AUTO_2380 - TRUCK
      ?AUTO_2391 - LOCATION
      ?AUTO_2389 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2381 ?AUTO_2378 ) ( IN-CITY ?AUTO_2376 ?AUTO_2378 ) ( not ( = ?AUTO_2376 ?AUTO_2381 ) ) ( AIRPORT ?AUTO_2383 ) ( AIRPORT ?AUTO_2381 ) ( AIRPLANE-AT ?AUTO_2384 ?AUTO_2383 ) ( not ( = ?AUTO_2383 ?AUTO_2381 ) ) ( TRUCK-AT ?AUTO_2379 ?AUTO_2387 ) ( IN-CITY ?AUTO_2387 ?AUTO_2385 ) ( IN-CITY ?AUTO_2381 ?AUTO_2385 ) ( not ( = ?AUTO_2381 ?AUTO_2387 ) ) ( AIRPLANE-AT ?AUTO_2384 ?AUTO_2386 ) ( IN-TRUCK ?AUTO_2375 ?AUTO_2380 ) ( TRUCK-AT ?AUTO_2380 ?AUTO_2391 ) ( IN-CITY ?AUTO_2391 ?AUTO_2389 ) ( IN-CITY ?AUTO_2386 ?AUTO_2389 ) ( not ( = ?AUTO_2386 ?AUTO_2391 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2380 ?AUTO_2391 ?AUTO_2386 ?AUTO_2389 )
      ( DELIVER-PKG ?AUTO_2375 ?AUTO_2376 )
      ( DELIVER-PKG-VERIFY ?AUTO_2375 ?AUTO_2376 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2392 - OBJ
      ?AUTO_2393 - LOCATION
    )
    :vars
    (
      ?AUTO_2404 - LOCATION
      ?AUTO_2402 - CITY
      ?AUTO_2397 - LOCATION
      ?AUTO_2394 - AIRPLANE
      ?AUTO_2406 - TRUCK
      ?AUTO_2401 - LOCATION
      ?AUTO_2400 - CITY
      ?AUTO_2396 - LOCATION
      ?AUTO_2403 - TRUCK
      ?AUTO_2405 - LOCATION
      ?AUTO_2399 - CITY
      ?AUTO_2408 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2404 ?AUTO_2402 ) ( IN-CITY ?AUTO_2393 ?AUTO_2402 ) ( not ( = ?AUTO_2393 ?AUTO_2404 ) ) ( AIRPORT ?AUTO_2397 ) ( AIRPORT ?AUTO_2404 ) ( AIRPLANE-AT ?AUTO_2394 ?AUTO_2397 ) ( not ( = ?AUTO_2397 ?AUTO_2404 ) ) ( TRUCK-AT ?AUTO_2406 ?AUTO_2401 ) ( IN-CITY ?AUTO_2401 ?AUTO_2400 ) ( IN-CITY ?AUTO_2404 ?AUTO_2400 ) ( not ( = ?AUTO_2404 ?AUTO_2401 ) ) ( AIRPLANE-AT ?AUTO_2394 ?AUTO_2396 ) ( TRUCK-AT ?AUTO_2403 ?AUTO_2405 ) ( IN-CITY ?AUTO_2405 ?AUTO_2399 ) ( IN-CITY ?AUTO_2396 ?AUTO_2399 ) ( not ( = ?AUTO_2396 ?AUTO_2405 ) ) ( TRUCK-AT ?AUTO_2403 ?AUTO_2408 ) ( OBJ-AT ?AUTO_2392 ?AUTO_2408 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2392 ?AUTO_2403 ?AUTO_2408 )
      ( DELIVER-PKG ?AUTO_2392 ?AUTO_2393 )
      ( DELIVER-PKG-VERIFY ?AUTO_2392 ?AUTO_2393 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2410 - OBJ
      ?AUTO_2411 - LOCATION
    )
    :vars
    (
      ?AUTO_2425 - LOCATION
      ?AUTO_2423 - CITY
      ?AUTO_2417 - LOCATION
      ?AUTO_2416 - AIRPLANE
      ?AUTO_2413 - TRUCK
      ?AUTO_2424 - LOCATION
      ?AUTO_2421 - CITY
      ?AUTO_2414 - LOCATION
      ?AUTO_2422 - LOCATION
      ?AUTO_2412 - CITY
      ?AUTO_2420 - TRUCK
      ?AUTO_2429 - LOCATION
      ?AUTO_2427 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2425 ?AUTO_2423 ) ( IN-CITY ?AUTO_2411 ?AUTO_2423 ) ( not ( = ?AUTO_2411 ?AUTO_2425 ) ) ( AIRPORT ?AUTO_2417 ) ( AIRPORT ?AUTO_2425 ) ( AIRPLANE-AT ?AUTO_2416 ?AUTO_2417 ) ( not ( = ?AUTO_2417 ?AUTO_2425 ) ) ( TRUCK-AT ?AUTO_2413 ?AUTO_2424 ) ( IN-CITY ?AUTO_2424 ?AUTO_2421 ) ( IN-CITY ?AUTO_2425 ?AUTO_2421 ) ( not ( = ?AUTO_2425 ?AUTO_2424 ) ) ( AIRPLANE-AT ?AUTO_2416 ?AUTO_2414 ) ( IN-CITY ?AUTO_2422 ?AUTO_2412 ) ( IN-CITY ?AUTO_2414 ?AUTO_2412 ) ( not ( = ?AUTO_2414 ?AUTO_2422 ) ) ( OBJ-AT ?AUTO_2410 ?AUTO_2422 ) ( TRUCK-AT ?AUTO_2420 ?AUTO_2429 ) ( IN-CITY ?AUTO_2429 ?AUTO_2427 ) ( IN-CITY ?AUTO_2422 ?AUTO_2427 ) ( not ( = ?AUTO_2422 ?AUTO_2429 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2420 ?AUTO_2429 ?AUTO_2422 ?AUTO_2427 )
      ( DELIVER-PKG ?AUTO_2410 ?AUTO_2411 )
      ( DELIVER-PKG-VERIFY ?AUTO_2410 ?AUTO_2411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3083 - OBJ
      ?AUTO_3084 - LOCATION
    )
    :vars
    (
      ?AUTO_3090 - LOCATION
      ?AUTO_3093 - CITY
      ?AUTO_3087 - LOCATION
      ?AUTO_3091 - LOCATION
      ?AUTO_3098 - AIRPLANE
      ?AUTO_3092 - LOCATION
      ?AUTO_3088 - CITY
      ?AUTO_3085 - TRUCK
      ?AUTO_3095 - LOCATION
      ?AUTO_3086 - CITY
      ?AUTO_3089 - TRUCK
      ?AUTO_3102 - LOCATION
      ?AUTO_3100 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3090 ?AUTO_3093 ) ( IN-CITY ?AUTO_3084 ?AUTO_3093 ) ( not ( = ?AUTO_3084 ?AUTO_3090 ) ) ( AIRPORT ?AUTO_3087 ) ( AIRPORT ?AUTO_3090 ) ( not ( = ?AUTO_3087 ?AUTO_3090 ) ) ( AIRPORT ?AUTO_3091 ) ( AIRPLANE-AT ?AUTO_3098 ?AUTO_3091 ) ( not ( = ?AUTO_3091 ?AUTO_3087 ) ) ( IN-CITY ?AUTO_3092 ?AUTO_3088 ) ( IN-CITY ?AUTO_3087 ?AUTO_3088 ) ( not ( = ?AUTO_3087 ?AUTO_3092 ) ) ( OBJ-AT ?AUTO_3083 ?AUTO_3092 ) ( TRUCK-AT ?AUTO_3085 ?AUTO_3095 ) ( IN-CITY ?AUTO_3095 ?AUTO_3086 ) ( IN-CITY ?AUTO_3092 ?AUTO_3086 ) ( not ( = ?AUTO_3092 ?AUTO_3095 ) ) ( TRUCK-AT ?AUTO_3089 ?AUTO_3102 ) ( IN-CITY ?AUTO_3102 ?AUTO_3100 ) ( IN-CITY ?AUTO_3090 ?AUTO_3100 ) ( not ( = ?AUTO_3090 ?AUTO_3102 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3089 ?AUTO_3102 ?AUTO_3090 ?AUTO_3100 )
      ( DELIVER-PKG ?AUTO_3083 ?AUTO_3084 )
      ( DELIVER-PKG-VERIFY ?AUTO_3083 ?AUTO_3084 ) )
  )

)

