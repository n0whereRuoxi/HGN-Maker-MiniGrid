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
      ?AUTO_4 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2 ?AUTO_4 ) ( AIRPLANE-AT ?AUTO_4 ?AUTO_3 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2 ?AUTO_4 ?AUTO_3 )
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
      ?AUTO_9 - AIRPLANE
      ?AUTO_10 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7 ?AUTO_9 ) ( AIRPORT ?AUTO_10 ) ( AIRPORT ?AUTO_8 ) ( AIRPLANE-AT ?AUTO_9 ?AUTO_10 ) ( not ( = ?AUTO_10 ?AUTO_8 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9 ?AUTO_10 ?AUTO_8 )
      ( DELIVER-PKG ?AUTO_7 ?AUTO_8 )
      ( DELIVER-PKG-VERIFY ?AUTO_7 ?AUTO_8 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_15 - OBJ
      ?AUTO_16 - LOCATION
    )
    :vars
    (
      ?AUTO_17 - LOCATION
      ?AUTO_18 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_17 ) ( AIRPORT ?AUTO_16 ) ( AIRPLANE-AT ?AUTO_18 ?AUTO_17 ) ( not ( = ?AUTO_17 ?AUTO_16 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_17 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_15 ?AUTO_18 ?AUTO_17 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_19 - OBJ
      ?AUTO_20 - LOCATION
    )
    :vars
    (
      ?AUTO_21 - LOCATION
      ?AUTO_23 - LOCATION
      ?AUTO_22 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_21 ) ( AIRPORT ?AUTO_20 ) ( not ( = ?AUTO_21 ?AUTO_20 ) ) ( OBJ-AT ?AUTO_19 ?AUTO_21 ) ( AIRPORT ?AUTO_23 ) ( AIRPLANE-AT ?AUTO_22 ?AUTO_23 ) ( not ( = ?AUTO_23 ?AUTO_21 ) ) ( not ( = ?AUTO_20 ?AUTO_23 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_22 ?AUTO_23 ?AUTO_21 )
      ( DELIVER-PKG ?AUTO_19 ?AUTO_20 )
      ( DELIVER-PKG-VERIFY ?AUTO_19 ?AUTO_20 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_54 - OBJ
      ?AUTO_55 - LOCATION
    )
    :vars
    (
      ?AUTO_56 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_56 ?AUTO_55 ) ( IN-TRUCK ?AUTO_54 ?AUTO_56 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_54 ?AUTO_56 ?AUTO_55 )
      ( DELIVER-PKG-VERIFY ?AUTO_54 ?AUTO_55 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_61 - OBJ
      ?AUTO_62 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - TRUCK
      ?AUTO_65 - LOCATION
      ?AUTO_64 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_61 ?AUTO_63 ) ( TRUCK-AT ?AUTO_63 ?AUTO_65 ) ( IN-CITY ?AUTO_65 ?AUTO_64 ) ( IN-CITY ?AUTO_62 ?AUTO_64 ) ( not ( = ?AUTO_62 ?AUTO_65 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_63 ?AUTO_65 ?AUTO_62 ?AUTO_64 )
      ( DELIVER-PKG ?AUTO_61 ?AUTO_62 )
      ( DELIVER-PKG-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_66 - OBJ
      ?AUTO_67 - LOCATION
    )
    :vars
    (
      ?AUTO_68 - TRUCK
      ?AUTO_70 - LOCATION
      ?AUTO_69 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_68 ?AUTO_70 ) ( IN-CITY ?AUTO_70 ?AUTO_69 ) ( IN-CITY ?AUTO_67 ?AUTO_69 ) ( not ( = ?AUTO_67 ?AUTO_70 ) ) ( OBJ-AT ?AUTO_66 ?AUTO_70 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_66 ?AUTO_68 ?AUTO_70 )
      ( DELIVER-PKG ?AUTO_66 ?AUTO_67 )
      ( DELIVER-PKG-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_75 - OBJ
      ?AUTO_76 - LOCATION
    )
    :vars
    (
      ?AUTO_78 - TRUCK
      ?AUTO_77 - LOCATION
      ?AUTO_79 - CITY
      ?AUTO_80 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_78 ?AUTO_77 ) ( IN-CITY ?AUTO_77 ?AUTO_79 ) ( IN-CITY ?AUTO_76 ?AUTO_79 ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( IN-AIRPLANE ?AUTO_75 ?AUTO_80 ) ( AIRPLANE-AT ?AUTO_80 ?AUTO_77 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_75 ?AUTO_80 ?AUTO_77 )
      ( DELIVER-PKG ?AUTO_75 ?AUTO_76 )
      ( DELIVER-PKG-VERIFY ?AUTO_75 ?AUTO_76 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_81 - OBJ
      ?AUTO_82 - LOCATION
    )
    :vars
    (
      ?AUTO_84 - LOCATION
      ?AUTO_85 - CITY
      ?AUTO_86 - AIRPLANE
      ?AUTO_83 - TRUCK
      ?AUTO_87 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_84 ?AUTO_85 ) ( IN-CITY ?AUTO_82 ?AUTO_85 ) ( not ( = ?AUTO_82 ?AUTO_84 ) ) ( IN-AIRPLANE ?AUTO_81 ?AUTO_86 ) ( AIRPLANE-AT ?AUTO_86 ?AUTO_84 ) ( TRUCK-AT ?AUTO_83 ?AUTO_87 ) ( IN-CITY ?AUTO_87 ?AUTO_85 ) ( not ( = ?AUTO_84 ?AUTO_87 ) ) ( not ( = ?AUTO_82 ?AUTO_87 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_83 ?AUTO_87 ?AUTO_84 ?AUTO_85 )
      ( DELIVER-PKG ?AUTO_81 ?AUTO_82 )
      ( DELIVER-PKG-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_88 - OBJ
      ?AUTO_89 - LOCATION
    )
    :vars
    (
      ?AUTO_90 - LOCATION
      ?AUTO_94 - CITY
      ?AUTO_93 - AIRPLANE
      ?AUTO_91 - TRUCK
      ?AUTO_92 - LOCATION
      ?AUTO_95 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_90 ?AUTO_94 ) ( IN-CITY ?AUTO_89 ?AUTO_94 ) ( not ( = ?AUTO_89 ?AUTO_90 ) ) ( IN-AIRPLANE ?AUTO_88 ?AUTO_93 ) ( TRUCK-AT ?AUTO_91 ?AUTO_92 ) ( IN-CITY ?AUTO_92 ?AUTO_94 ) ( not ( = ?AUTO_90 ?AUTO_92 ) ) ( not ( = ?AUTO_89 ?AUTO_92 ) ) ( AIRPORT ?AUTO_95 ) ( AIRPORT ?AUTO_90 ) ( AIRPLANE-AT ?AUTO_93 ?AUTO_95 ) ( not ( = ?AUTO_95 ?AUTO_90 ) ) ( not ( = ?AUTO_89 ?AUTO_95 ) ) ( not ( = ?AUTO_92 ?AUTO_95 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_93 ?AUTO_95 ?AUTO_90 )
      ( DELIVER-PKG ?AUTO_88 ?AUTO_89 )
      ( DELIVER-PKG-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_100 - OBJ
      ?AUTO_101 - LOCATION
    )
    :vars
    (
      ?AUTO_105 - LOCATION
      ?AUTO_102 - CITY
      ?AUTO_107 - TRUCK
      ?AUTO_104 - LOCATION
      ?AUTO_103 - LOCATION
      ?AUTO_106 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_105 ?AUTO_102 ) ( IN-CITY ?AUTO_101 ?AUTO_102 ) ( not ( = ?AUTO_101 ?AUTO_105 ) ) ( TRUCK-AT ?AUTO_107 ?AUTO_104 ) ( IN-CITY ?AUTO_104 ?AUTO_102 ) ( not ( = ?AUTO_105 ?AUTO_104 ) ) ( not ( = ?AUTO_101 ?AUTO_104 ) ) ( AIRPORT ?AUTO_103 ) ( AIRPORT ?AUTO_105 ) ( AIRPLANE-AT ?AUTO_106 ?AUTO_103 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( not ( = ?AUTO_104 ?AUTO_103 ) ) ( OBJ-AT ?AUTO_100 ?AUTO_103 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_100 ?AUTO_106 ?AUTO_103 )
      ( DELIVER-PKG ?AUTO_100 ?AUTO_101 )
      ( DELIVER-PKG-VERIFY ?AUTO_100 ?AUTO_101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_108 - OBJ
      ?AUTO_109 - LOCATION
    )
    :vars
    (
      ?AUTO_112 - LOCATION
      ?AUTO_110 - CITY
      ?AUTO_114 - TRUCK
      ?AUTO_115 - LOCATION
      ?AUTO_113 - LOCATION
      ?AUTO_116 - LOCATION
      ?AUTO_111 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_112 ?AUTO_110 ) ( IN-CITY ?AUTO_109 ?AUTO_110 ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( TRUCK-AT ?AUTO_114 ?AUTO_115 ) ( IN-CITY ?AUTO_115 ?AUTO_110 ) ( not ( = ?AUTO_112 ?AUTO_115 ) ) ( not ( = ?AUTO_109 ?AUTO_115 ) ) ( AIRPORT ?AUTO_113 ) ( AIRPORT ?AUTO_112 ) ( not ( = ?AUTO_113 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_113 ) ) ( not ( = ?AUTO_115 ?AUTO_113 ) ) ( OBJ-AT ?AUTO_108 ?AUTO_113 ) ( AIRPORT ?AUTO_116 ) ( AIRPLANE-AT ?AUTO_111 ?AUTO_116 ) ( not ( = ?AUTO_116 ?AUTO_113 ) ) ( not ( = ?AUTO_109 ?AUTO_116 ) ) ( not ( = ?AUTO_112 ?AUTO_116 ) ) ( not ( = ?AUTO_115 ?AUTO_116 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_111 ?AUTO_116 ?AUTO_113 )
      ( DELIVER-PKG ?AUTO_108 ?AUTO_109 )
      ( DELIVER-PKG-VERIFY ?AUTO_108 ?AUTO_109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_144 - OBJ
      ?AUTO_145 - LOCATION
    )
    :vars
    (
      ?AUTO_147 - TRUCK
      ?AUTO_146 - LOCATION
      ?AUTO_148 - CITY
      ?AUTO_149 - AIRPLANE
      ?AUTO_150 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_147 ?AUTO_146 ) ( IN-CITY ?AUTO_146 ?AUTO_148 ) ( IN-CITY ?AUTO_145 ?AUTO_148 ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( IN-AIRPLANE ?AUTO_144 ?AUTO_149 ) ( AIRPORT ?AUTO_150 ) ( AIRPORT ?AUTO_146 ) ( AIRPLANE-AT ?AUTO_149 ?AUTO_150 ) ( not ( = ?AUTO_150 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_149 ?AUTO_150 ?AUTO_146 )
      ( DELIVER-PKG ?AUTO_144 ?AUTO_145 )
      ( DELIVER-PKG-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_157 - OBJ
      ?AUTO_158 - LOCATION
    )
    :vars
    (
      ?AUTO_159 - TRUCK
      ?AUTO_162 - LOCATION
      ?AUTO_163 - CITY
      ?AUTO_161 - LOCATION
      ?AUTO_160 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_159 ?AUTO_162 ) ( IN-CITY ?AUTO_162 ?AUTO_163 ) ( IN-CITY ?AUTO_158 ?AUTO_163 ) ( not ( = ?AUTO_158 ?AUTO_162 ) ) ( AIRPORT ?AUTO_161 ) ( AIRPORT ?AUTO_162 ) ( AIRPLANE-AT ?AUTO_160 ?AUTO_161 ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) ( not ( = ?AUTO_158 ?AUTO_161 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_161 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_157 ?AUTO_160 ?AUTO_161 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_164 - OBJ
      ?AUTO_165 - LOCATION
    )
    :vars
    (
      ?AUTO_170 - TRUCK
      ?AUTO_169 - LOCATION
      ?AUTO_166 - CITY
      ?AUTO_168 - LOCATION
      ?AUTO_171 - LOCATION
      ?AUTO_167 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_170 ?AUTO_169 ) ( IN-CITY ?AUTO_169 ?AUTO_166 ) ( IN-CITY ?AUTO_165 ?AUTO_166 ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( AIRPORT ?AUTO_168 ) ( AIRPORT ?AUTO_169 ) ( not ( = ?AUTO_168 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_168 ) ) ( OBJ-AT ?AUTO_164 ?AUTO_168 ) ( AIRPORT ?AUTO_171 ) ( AIRPLANE-AT ?AUTO_167 ?AUTO_171 ) ( not ( = ?AUTO_171 ?AUTO_168 ) ) ( not ( = ?AUTO_165 ?AUTO_171 ) ) ( not ( = ?AUTO_169 ?AUTO_171 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_167 ?AUTO_171 ?AUTO_168 )
      ( DELIVER-PKG ?AUTO_164 ?AUTO_165 )
      ( DELIVER-PKG-VERIFY ?AUTO_164 ?AUTO_165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_191 - OBJ
      ?AUTO_192 - LOCATION
    )
    :vars
    (
      ?AUTO_193 - LOCATION
      ?AUTO_195 - CITY
      ?AUTO_194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_193 ?AUTO_195 ) ( IN-CITY ?AUTO_192 ?AUTO_195 ) ( not ( = ?AUTO_192 ?AUTO_193 ) ) ( OBJ-AT ?AUTO_191 ?AUTO_193 ) ( TRUCK-AT ?AUTO_194 ?AUTO_192 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_194 ?AUTO_192 ?AUTO_193 ?AUTO_195 )
      ( DELIVER-PKG ?AUTO_191 ?AUTO_192 )
      ( DELIVER-PKG-VERIFY ?AUTO_191 ?AUTO_192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_217 - OBJ
      ?AUTO_218 - LOCATION
    )
    :vars
    (
      ?AUTO_219 - LOCATION
      ?AUTO_220 - CITY
      ?AUTO_221 - TRUCK
      ?AUTO_222 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_219 ?AUTO_220 ) ( IN-CITY ?AUTO_218 ?AUTO_220 ) ( not ( = ?AUTO_218 ?AUTO_219 ) ) ( OBJ-AT ?AUTO_217 ?AUTO_219 ) ( TRUCK-AT ?AUTO_221 ?AUTO_222 ) ( IN-CITY ?AUTO_222 ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_222 ) ) ( not ( = ?AUTO_218 ?AUTO_222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_221 ?AUTO_222 ?AUTO_219 ?AUTO_220 )
      ( DELIVER-PKG ?AUTO_217 ?AUTO_218 )
      ( DELIVER-PKG-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_415 - OBJ
      ?AUTO_416 - LOCATION
    )
    :vars
    (
      ?AUTO_419 - LOCATION
      ?AUTO_417 - LOCATION
      ?AUTO_418 - AIRPLANE
      ?AUTO_420 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_419 ) ( AIRPORT ?AUTO_416 ) ( not ( = ?AUTO_419 ?AUTO_416 ) ) ( AIRPORT ?AUTO_417 ) ( AIRPLANE-AT ?AUTO_418 ?AUTO_417 ) ( not ( = ?AUTO_417 ?AUTO_419 ) ) ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( TRUCK-AT ?AUTO_420 ?AUTO_419 ) ( IN-TRUCK ?AUTO_415 ?AUTO_420 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_415 ?AUTO_420 ?AUTO_419 )
      ( DELIVER-PKG ?AUTO_415 ?AUTO_416 )
      ( DELIVER-PKG-VERIFY ?AUTO_415 ?AUTO_416 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_427 - OBJ
      ?AUTO_428 - LOCATION
    )
    :vars
    (
      ?AUTO_429 - LOCATION
      ?AUTO_430 - LOCATION
      ?AUTO_431 - AIRPLANE
      ?AUTO_432 - TRUCK
      ?AUTO_434 - LOCATION
      ?AUTO_433 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_429 ) ( AIRPORT ?AUTO_428 ) ( not ( = ?AUTO_429 ?AUTO_428 ) ) ( AIRPORT ?AUTO_430 ) ( AIRPLANE-AT ?AUTO_431 ?AUTO_430 ) ( not ( = ?AUTO_430 ?AUTO_429 ) ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( IN-TRUCK ?AUTO_427 ?AUTO_432 ) ( TRUCK-AT ?AUTO_432 ?AUTO_434 ) ( IN-CITY ?AUTO_434 ?AUTO_433 ) ( IN-CITY ?AUTO_429 ?AUTO_433 ) ( not ( = ?AUTO_429 ?AUTO_434 ) ) ( not ( = ?AUTO_428 ?AUTO_434 ) ) ( not ( = ?AUTO_430 ?AUTO_434 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_432 ?AUTO_434 ?AUTO_429 ?AUTO_433 )
      ( DELIVER-PKG ?AUTO_427 ?AUTO_428 )
      ( DELIVER-PKG-VERIFY ?AUTO_427 ?AUTO_428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_435 - OBJ
      ?AUTO_436 - LOCATION
    )
    :vars
    (
      ?AUTO_439 - LOCATION
      ?AUTO_438 - LOCATION
      ?AUTO_442 - AIRPLANE
      ?AUTO_437 - TRUCK
      ?AUTO_441 - LOCATION
      ?AUTO_440 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_439 ) ( AIRPORT ?AUTO_436 ) ( not ( = ?AUTO_439 ?AUTO_436 ) ) ( AIRPORT ?AUTO_438 ) ( AIRPLANE-AT ?AUTO_442 ?AUTO_438 ) ( not ( = ?AUTO_438 ?AUTO_439 ) ) ( not ( = ?AUTO_436 ?AUTO_438 ) ) ( TRUCK-AT ?AUTO_437 ?AUTO_441 ) ( IN-CITY ?AUTO_441 ?AUTO_440 ) ( IN-CITY ?AUTO_439 ?AUTO_440 ) ( not ( = ?AUTO_439 ?AUTO_441 ) ) ( not ( = ?AUTO_436 ?AUTO_441 ) ) ( not ( = ?AUTO_438 ?AUTO_441 ) ) ( OBJ-AT ?AUTO_435 ?AUTO_441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_435 ?AUTO_437 ?AUTO_441 )
      ( DELIVER-PKG ?AUTO_435 ?AUTO_436 )
      ( DELIVER-PKG-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_443 - OBJ
      ?AUTO_444 - LOCATION
    )
    :vars
    (
      ?AUTO_446 - LOCATION
      ?AUTO_448 - LOCATION
      ?AUTO_447 - AIRPLANE
      ?AUTO_450 - LOCATION
      ?AUTO_449 - CITY
      ?AUTO_445 - TRUCK
      ?AUTO_451 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_446 ) ( AIRPORT ?AUTO_444 ) ( not ( = ?AUTO_446 ?AUTO_444 ) ) ( AIRPORT ?AUTO_448 ) ( AIRPLANE-AT ?AUTO_447 ?AUTO_448 ) ( not ( = ?AUTO_448 ?AUTO_446 ) ) ( not ( = ?AUTO_444 ?AUTO_448 ) ) ( IN-CITY ?AUTO_450 ?AUTO_449 ) ( IN-CITY ?AUTO_446 ?AUTO_449 ) ( not ( = ?AUTO_446 ?AUTO_450 ) ) ( not ( = ?AUTO_444 ?AUTO_450 ) ) ( not ( = ?AUTO_448 ?AUTO_450 ) ) ( OBJ-AT ?AUTO_443 ?AUTO_450 ) ( TRUCK-AT ?AUTO_445 ?AUTO_451 ) ( IN-CITY ?AUTO_451 ?AUTO_449 ) ( not ( = ?AUTO_450 ?AUTO_451 ) ) ( not ( = ?AUTO_444 ?AUTO_451 ) ) ( not ( = ?AUTO_446 ?AUTO_451 ) ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_445 ?AUTO_451 ?AUTO_450 ?AUTO_449 )
      ( DELIVER-PKG ?AUTO_443 ?AUTO_444 )
      ( DELIVER-PKG-VERIFY ?AUTO_443 ?AUTO_444 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_596 - OBJ
      ?AUTO_597 - LOCATION
    )
    :vars
    (
      ?AUTO_598 - LOCATION
      ?AUTO_601 - LOCATION
      ?AUTO_599 - AIRPLANE
      ?AUTO_602 - LOCATION
      ?AUTO_600 - CITY
      ?AUTO_603 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_598 ) ( AIRPORT ?AUTO_597 ) ( not ( = ?AUTO_598 ?AUTO_597 ) ) ( AIRPORT ?AUTO_601 ) ( AIRPLANE-AT ?AUTO_599 ?AUTO_601 ) ( not ( = ?AUTO_601 ?AUTO_598 ) ) ( not ( = ?AUTO_597 ?AUTO_601 ) ) ( IN-CITY ?AUTO_602 ?AUTO_600 ) ( IN-CITY ?AUTO_598 ?AUTO_600 ) ( not ( = ?AUTO_598 ?AUTO_602 ) ) ( not ( = ?AUTO_597 ?AUTO_602 ) ) ( not ( = ?AUTO_601 ?AUTO_602 ) ) ( OBJ-AT ?AUTO_596 ?AUTO_602 ) ( TRUCK-AT ?AUTO_603 ?AUTO_598 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_603 ?AUTO_598 ?AUTO_602 ?AUTO_600 )
      ( DELIVER-PKG ?AUTO_596 ?AUTO_597 )
      ( DELIVER-PKG-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_903 - OBJ
      ?AUTO_904 - LOCATION
    )
    :vars
    (
      ?AUTO_905 - TRUCK
      ?AUTO_906 - LOCATION
      ?AUTO_909 - CITY
      ?AUTO_907 - LOCATION
      ?AUTO_908 - LOCATION
      ?AUTO_910 - AIRPLANE
      ?AUTO_911 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_905 ?AUTO_906 ) ( IN-CITY ?AUTO_906 ?AUTO_909 ) ( IN-CITY ?AUTO_904 ?AUTO_909 ) ( not ( = ?AUTO_904 ?AUTO_906 ) ) ( AIRPORT ?AUTO_907 ) ( AIRPORT ?AUTO_906 ) ( not ( = ?AUTO_907 ?AUTO_906 ) ) ( not ( = ?AUTO_904 ?AUTO_907 ) ) ( AIRPORT ?AUTO_908 ) ( AIRPLANE-AT ?AUTO_910 ?AUTO_908 ) ( not ( = ?AUTO_908 ?AUTO_907 ) ) ( not ( = ?AUTO_904 ?AUTO_908 ) ) ( not ( = ?AUTO_906 ?AUTO_908 ) ) ( TRUCK-AT ?AUTO_911 ?AUTO_907 ) ( IN-TRUCK ?AUTO_903 ?AUTO_911 ) ( not ( = ?AUTO_905 ?AUTO_911 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_903 ?AUTO_911 ?AUTO_907 )
      ( DELIVER-PKG ?AUTO_903 ?AUTO_904 )
      ( DELIVER-PKG-VERIFY ?AUTO_903 ?AUTO_904 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_912 - OBJ
      ?AUTO_913 - LOCATION
    )
    :vars
    (
      ?AUTO_918 - TRUCK
      ?AUTO_919 - LOCATION
      ?AUTO_915 - CITY
      ?AUTO_917 - LOCATION
      ?AUTO_914 - LOCATION
      ?AUTO_916 - AIRPLANE
      ?AUTO_920 - TRUCK
      ?AUTO_922 - LOCATION
      ?AUTO_921 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_918 ?AUTO_919 ) ( IN-CITY ?AUTO_919 ?AUTO_915 ) ( IN-CITY ?AUTO_913 ?AUTO_915 ) ( not ( = ?AUTO_913 ?AUTO_919 ) ) ( AIRPORT ?AUTO_917 ) ( AIRPORT ?AUTO_919 ) ( not ( = ?AUTO_917 ?AUTO_919 ) ) ( not ( = ?AUTO_913 ?AUTO_917 ) ) ( AIRPORT ?AUTO_914 ) ( AIRPLANE-AT ?AUTO_916 ?AUTO_914 ) ( not ( = ?AUTO_914 ?AUTO_917 ) ) ( not ( = ?AUTO_913 ?AUTO_914 ) ) ( not ( = ?AUTO_919 ?AUTO_914 ) ) ( IN-TRUCK ?AUTO_912 ?AUTO_920 ) ( not ( = ?AUTO_918 ?AUTO_920 ) ) ( TRUCK-AT ?AUTO_920 ?AUTO_922 ) ( IN-CITY ?AUTO_922 ?AUTO_921 ) ( IN-CITY ?AUTO_917 ?AUTO_921 ) ( not ( = ?AUTO_917 ?AUTO_922 ) ) ( not ( = ?AUTO_913 ?AUTO_922 ) ) ( not ( = ?AUTO_919 ?AUTO_922 ) ) ( not ( = ?AUTO_915 ?AUTO_921 ) ) ( not ( = ?AUTO_914 ?AUTO_922 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_920 ?AUTO_922 ?AUTO_917 ?AUTO_921 )
      ( DELIVER-PKG ?AUTO_912 ?AUTO_913 )
      ( DELIVER-PKG-VERIFY ?AUTO_912 ?AUTO_913 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_923 - OBJ
      ?AUTO_924 - LOCATION
    )
    :vars
    (
      ?AUTO_927 - TRUCK
      ?AUTO_929 - LOCATION
      ?AUTO_926 - CITY
      ?AUTO_931 - LOCATION
      ?AUTO_925 - LOCATION
      ?AUTO_932 - AIRPLANE
      ?AUTO_933 - TRUCK
      ?AUTO_928 - LOCATION
      ?AUTO_930 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_927 ?AUTO_929 ) ( IN-CITY ?AUTO_929 ?AUTO_926 ) ( IN-CITY ?AUTO_924 ?AUTO_926 ) ( not ( = ?AUTO_924 ?AUTO_929 ) ) ( AIRPORT ?AUTO_931 ) ( AIRPORT ?AUTO_929 ) ( not ( = ?AUTO_931 ?AUTO_929 ) ) ( not ( = ?AUTO_924 ?AUTO_931 ) ) ( AIRPORT ?AUTO_925 ) ( AIRPLANE-AT ?AUTO_932 ?AUTO_925 ) ( not ( = ?AUTO_925 ?AUTO_931 ) ) ( not ( = ?AUTO_924 ?AUTO_925 ) ) ( not ( = ?AUTO_929 ?AUTO_925 ) ) ( not ( = ?AUTO_927 ?AUTO_933 ) ) ( TRUCK-AT ?AUTO_933 ?AUTO_928 ) ( IN-CITY ?AUTO_928 ?AUTO_930 ) ( IN-CITY ?AUTO_931 ?AUTO_930 ) ( not ( = ?AUTO_931 ?AUTO_928 ) ) ( not ( = ?AUTO_924 ?AUTO_928 ) ) ( not ( = ?AUTO_929 ?AUTO_928 ) ) ( not ( = ?AUTO_926 ?AUTO_930 ) ) ( not ( = ?AUTO_925 ?AUTO_928 ) ) ( OBJ-AT ?AUTO_923 ?AUTO_928 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_923 ?AUTO_933 ?AUTO_928 )
      ( DELIVER-PKG ?AUTO_923 ?AUTO_924 )
      ( DELIVER-PKG-VERIFY ?AUTO_923 ?AUTO_924 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_934 - OBJ
      ?AUTO_935 - LOCATION
    )
    :vars
    (
      ?AUTO_939 - TRUCK
      ?AUTO_936 - LOCATION
      ?AUTO_942 - CITY
      ?AUTO_937 - LOCATION
      ?AUTO_940 - LOCATION
      ?AUTO_944 - AIRPLANE
      ?AUTO_943 - TRUCK
      ?AUTO_938 - LOCATION
      ?AUTO_941 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_939 ?AUTO_936 ) ( IN-CITY ?AUTO_936 ?AUTO_942 ) ( IN-CITY ?AUTO_935 ?AUTO_942 ) ( not ( = ?AUTO_935 ?AUTO_936 ) ) ( AIRPORT ?AUTO_937 ) ( AIRPORT ?AUTO_936 ) ( not ( = ?AUTO_937 ?AUTO_936 ) ) ( not ( = ?AUTO_935 ?AUTO_937 ) ) ( AIRPORT ?AUTO_940 ) ( AIRPLANE-AT ?AUTO_944 ?AUTO_940 ) ( not ( = ?AUTO_940 ?AUTO_937 ) ) ( not ( = ?AUTO_935 ?AUTO_940 ) ) ( not ( = ?AUTO_936 ?AUTO_940 ) ) ( not ( = ?AUTO_939 ?AUTO_943 ) ) ( IN-CITY ?AUTO_938 ?AUTO_941 ) ( IN-CITY ?AUTO_937 ?AUTO_941 ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( not ( = ?AUTO_935 ?AUTO_938 ) ) ( not ( = ?AUTO_936 ?AUTO_938 ) ) ( not ( = ?AUTO_942 ?AUTO_941 ) ) ( not ( = ?AUTO_940 ?AUTO_938 ) ) ( OBJ-AT ?AUTO_934 ?AUTO_938 ) ( TRUCK-AT ?AUTO_943 ?AUTO_937 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_943 ?AUTO_937 ?AUTO_938 ?AUTO_941 )
      ( DELIVER-PKG ?AUTO_934 ?AUTO_935 )
      ( DELIVER-PKG-VERIFY ?AUTO_934 ?AUTO_935 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1048 - OBJ
      ?AUTO_1049 - LOCATION
    )
    :vars
    (
      ?AUTO_1051 - LOCATION
      ?AUTO_1050 - AIRPLANE
      ?AUTO_1052 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1051 ) ( AIRPORT ?AUTO_1049 ) ( AIRPLANE-AT ?AUTO_1050 ?AUTO_1051 ) ( not ( = ?AUTO_1051 ?AUTO_1049 ) ) ( TRUCK-AT ?AUTO_1052 ?AUTO_1051 ) ( IN-TRUCK ?AUTO_1048 ?AUTO_1052 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1048 ?AUTO_1052 ?AUTO_1051 )
      ( DELIVER-PKG ?AUTO_1048 ?AUTO_1049 )
      ( DELIVER-PKG-VERIFY ?AUTO_1048 ?AUTO_1049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1053 - OBJ
      ?AUTO_1054 - LOCATION
    )
    :vars
    (
      ?AUTO_1056 - LOCATION
      ?AUTO_1055 - AIRPLANE
      ?AUTO_1057 - TRUCK
      ?AUTO_1059 - LOCATION
      ?AUTO_1058 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1056 ) ( AIRPORT ?AUTO_1054 ) ( AIRPLANE-AT ?AUTO_1055 ?AUTO_1056 ) ( not ( = ?AUTO_1056 ?AUTO_1054 ) ) ( IN-TRUCK ?AUTO_1053 ?AUTO_1057 ) ( TRUCK-AT ?AUTO_1057 ?AUTO_1059 ) ( IN-CITY ?AUTO_1059 ?AUTO_1058 ) ( IN-CITY ?AUTO_1056 ?AUTO_1058 ) ( not ( = ?AUTO_1056 ?AUTO_1059 ) ) ( not ( = ?AUTO_1054 ?AUTO_1059 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1057 ?AUTO_1059 ?AUTO_1056 ?AUTO_1058 )
      ( DELIVER-PKG ?AUTO_1053 ?AUTO_1054 )
      ( DELIVER-PKG-VERIFY ?AUTO_1053 ?AUTO_1054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1060 - OBJ
      ?AUTO_1061 - LOCATION
    )
    :vars
    (
      ?AUTO_1062 - LOCATION
      ?AUTO_1064 - AIRPLANE
      ?AUTO_1063 - TRUCK
      ?AUTO_1065 - LOCATION
      ?AUTO_1066 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1062 ) ( AIRPORT ?AUTO_1061 ) ( AIRPLANE-AT ?AUTO_1064 ?AUTO_1062 ) ( not ( = ?AUTO_1062 ?AUTO_1061 ) ) ( TRUCK-AT ?AUTO_1063 ?AUTO_1065 ) ( IN-CITY ?AUTO_1065 ?AUTO_1066 ) ( IN-CITY ?AUTO_1062 ?AUTO_1066 ) ( not ( = ?AUTO_1062 ?AUTO_1065 ) ) ( not ( = ?AUTO_1061 ?AUTO_1065 ) ) ( OBJ-AT ?AUTO_1060 ?AUTO_1065 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1060 ?AUTO_1063 ?AUTO_1065 )
      ( DELIVER-PKG ?AUTO_1060 ?AUTO_1061 )
      ( DELIVER-PKG-VERIFY ?AUTO_1060 ?AUTO_1061 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1104 - OBJ
      ?AUTO_1105 - LOCATION
    )
    :vars
    (
      ?AUTO_1106 - LOCATION
      ?AUTO_1107 - TRUCK
      ?AUTO_1108 - LOCATION
      ?AUTO_1109 - CITY
      ?AUTO_1111 - LOCATION
      ?AUTO_1110 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1106 ) ( AIRPORT ?AUTO_1105 ) ( not ( = ?AUTO_1106 ?AUTO_1105 ) ) ( IN-TRUCK ?AUTO_1104 ?AUTO_1107 ) ( TRUCK-AT ?AUTO_1107 ?AUTO_1108 ) ( IN-CITY ?AUTO_1108 ?AUTO_1109 ) ( IN-CITY ?AUTO_1106 ?AUTO_1109 ) ( not ( = ?AUTO_1106 ?AUTO_1108 ) ) ( not ( = ?AUTO_1105 ?AUTO_1108 ) ) ( AIRPORT ?AUTO_1111 ) ( AIRPLANE-AT ?AUTO_1110 ?AUTO_1111 ) ( not ( = ?AUTO_1111 ?AUTO_1106 ) ) ( not ( = ?AUTO_1105 ?AUTO_1111 ) ) ( not ( = ?AUTO_1108 ?AUTO_1111 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1110 ?AUTO_1111 ?AUTO_1106 )
      ( DELIVER-PKG ?AUTO_1104 ?AUTO_1105 )
      ( DELIVER-PKG-VERIFY ?AUTO_1104 ?AUTO_1105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1170 - OBJ
      ?AUTO_1171 - LOCATION
    )
    :vars
    (
      ?AUTO_1176 - LOCATION
      ?AUTO_1172 - CITY
      ?AUTO_1173 - AIRPLANE
      ?AUTO_1175 - LOCATION
      ?AUTO_1174 - TRUCK
      ?AUTO_1177 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1176 ?AUTO_1172 ) ( IN-CITY ?AUTO_1171 ?AUTO_1172 ) ( not ( = ?AUTO_1171 ?AUTO_1176 ) ) ( IN-AIRPLANE ?AUTO_1170 ?AUTO_1173 ) ( AIRPORT ?AUTO_1175 ) ( AIRPORT ?AUTO_1176 ) ( AIRPLANE-AT ?AUTO_1173 ?AUTO_1175 ) ( not ( = ?AUTO_1175 ?AUTO_1176 ) ) ( not ( = ?AUTO_1171 ?AUTO_1175 ) ) ( TRUCK-AT ?AUTO_1174 ?AUTO_1177 ) ( IN-CITY ?AUTO_1177 ?AUTO_1172 ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( not ( = ?AUTO_1171 ?AUTO_1177 ) ) ( not ( = ?AUTO_1175 ?AUTO_1177 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1174 ?AUTO_1177 ?AUTO_1176 ?AUTO_1172 )
      ( DELIVER-PKG ?AUTO_1170 ?AUTO_1171 )
      ( DELIVER-PKG-VERIFY ?AUTO_1170 ?AUTO_1171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1196 - OBJ
      ?AUTO_1197 - LOCATION
    )
    :vars
    (
      ?AUTO_1202 - LOCATION
      ?AUTO_1201 - CITY
      ?AUTO_1203 - LOCATION
      ?AUTO_1199 - AIRPLANE
      ?AUTO_1198 - TRUCK
      ?AUTO_1200 - LOCATION
      ?AUTO_1204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1202 ?AUTO_1201 ) ( IN-CITY ?AUTO_1197 ?AUTO_1201 ) ( not ( = ?AUTO_1197 ?AUTO_1202 ) ) ( AIRPORT ?AUTO_1203 ) ( AIRPORT ?AUTO_1202 ) ( AIRPLANE-AT ?AUTO_1199 ?AUTO_1203 ) ( not ( = ?AUTO_1203 ?AUTO_1202 ) ) ( not ( = ?AUTO_1197 ?AUTO_1203 ) ) ( TRUCK-AT ?AUTO_1198 ?AUTO_1200 ) ( IN-CITY ?AUTO_1200 ?AUTO_1201 ) ( not ( = ?AUTO_1202 ?AUTO_1200 ) ) ( not ( = ?AUTO_1197 ?AUTO_1200 ) ) ( not ( = ?AUTO_1203 ?AUTO_1200 ) ) ( TRUCK-AT ?AUTO_1204 ?AUTO_1203 ) ( IN-TRUCK ?AUTO_1196 ?AUTO_1204 ) ( not ( = ?AUTO_1198 ?AUTO_1204 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1196 ?AUTO_1204 ?AUTO_1203 )
      ( DELIVER-PKG ?AUTO_1196 ?AUTO_1197 )
      ( DELIVER-PKG-VERIFY ?AUTO_1196 ?AUTO_1197 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1205 - OBJ
      ?AUTO_1206 - LOCATION
    )
    :vars
    (
      ?AUTO_1211 - LOCATION
      ?AUTO_1207 - CITY
      ?AUTO_1208 - LOCATION
      ?AUTO_1209 - AIRPLANE
      ?AUTO_1213 - TRUCK
      ?AUTO_1210 - LOCATION
      ?AUTO_1212 - TRUCK
      ?AUTO_1215 - LOCATION
      ?AUTO_1214 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1211 ?AUTO_1207 ) ( IN-CITY ?AUTO_1206 ?AUTO_1207 ) ( not ( = ?AUTO_1206 ?AUTO_1211 ) ) ( AIRPORT ?AUTO_1208 ) ( AIRPORT ?AUTO_1211 ) ( AIRPLANE-AT ?AUTO_1209 ?AUTO_1208 ) ( not ( = ?AUTO_1208 ?AUTO_1211 ) ) ( not ( = ?AUTO_1206 ?AUTO_1208 ) ) ( TRUCK-AT ?AUTO_1213 ?AUTO_1210 ) ( IN-CITY ?AUTO_1210 ?AUTO_1207 ) ( not ( = ?AUTO_1211 ?AUTO_1210 ) ) ( not ( = ?AUTO_1206 ?AUTO_1210 ) ) ( not ( = ?AUTO_1208 ?AUTO_1210 ) ) ( IN-TRUCK ?AUTO_1205 ?AUTO_1212 ) ( not ( = ?AUTO_1213 ?AUTO_1212 ) ) ( TRUCK-AT ?AUTO_1212 ?AUTO_1215 ) ( IN-CITY ?AUTO_1215 ?AUTO_1214 ) ( IN-CITY ?AUTO_1208 ?AUTO_1214 ) ( not ( = ?AUTO_1208 ?AUTO_1215 ) ) ( not ( = ?AUTO_1206 ?AUTO_1215 ) ) ( not ( = ?AUTO_1211 ?AUTO_1215 ) ) ( not ( = ?AUTO_1207 ?AUTO_1214 ) ) ( not ( = ?AUTO_1210 ?AUTO_1215 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1212 ?AUTO_1215 ?AUTO_1208 ?AUTO_1214 )
      ( DELIVER-PKG ?AUTO_1205 ?AUTO_1206 )
      ( DELIVER-PKG-VERIFY ?AUTO_1205 ?AUTO_1206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1216 - OBJ
      ?AUTO_1217 - LOCATION
    )
    :vars
    (
      ?AUTO_1222 - LOCATION
      ?AUTO_1219 - CITY
      ?AUTO_1218 - LOCATION
      ?AUTO_1226 - AIRPLANE
      ?AUTO_1223 - TRUCK
      ?AUTO_1220 - LOCATION
      ?AUTO_1225 - TRUCK
      ?AUTO_1221 - LOCATION
      ?AUTO_1224 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1222 ?AUTO_1219 ) ( IN-CITY ?AUTO_1217 ?AUTO_1219 ) ( not ( = ?AUTO_1217 ?AUTO_1222 ) ) ( AIRPORT ?AUTO_1218 ) ( AIRPORT ?AUTO_1222 ) ( AIRPLANE-AT ?AUTO_1226 ?AUTO_1218 ) ( not ( = ?AUTO_1218 ?AUTO_1222 ) ) ( not ( = ?AUTO_1217 ?AUTO_1218 ) ) ( TRUCK-AT ?AUTO_1223 ?AUTO_1220 ) ( IN-CITY ?AUTO_1220 ?AUTO_1219 ) ( not ( = ?AUTO_1222 ?AUTO_1220 ) ) ( not ( = ?AUTO_1217 ?AUTO_1220 ) ) ( not ( = ?AUTO_1218 ?AUTO_1220 ) ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( TRUCK-AT ?AUTO_1225 ?AUTO_1221 ) ( IN-CITY ?AUTO_1221 ?AUTO_1224 ) ( IN-CITY ?AUTO_1218 ?AUTO_1224 ) ( not ( = ?AUTO_1218 ?AUTO_1221 ) ) ( not ( = ?AUTO_1217 ?AUTO_1221 ) ) ( not ( = ?AUTO_1222 ?AUTO_1221 ) ) ( not ( = ?AUTO_1219 ?AUTO_1224 ) ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( OBJ-AT ?AUTO_1216 ?AUTO_1221 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1216 ?AUTO_1225 ?AUTO_1221 )
      ( DELIVER-PKG ?AUTO_1216 ?AUTO_1217 )
      ( DELIVER-PKG-VERIFY ?AUTO_1216 ?AUTO_1217 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1258 - OBJ
      ?AUTO_1259 - LOCATION
    )
    :vars
    (
      ?AUTO_1262 - LOCATION
      ?AUTO_1261 - CITY
      ?AUTO_1263 - TRUCK
      ?AUTO_1260 - LOCATION
      ?AUTO_1264 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1262 ?AUTO_1261 ) ( IN-CITY ?AUTO_1259 ?AUTO_1261 ) ( not ( = ?AUTO_1259 ?AUTO_1262 ) ) ( TRUCK-AT ?AUTO_1263 ?AUTO_1260 ) ( IN-CITY ?AUTO_1260 ?AUTO_1261 ) ( not ( = ?AUTO_1262 ?AUTO_1260 ) ) ( not ( = ?AUTO_1259 ?AUTO_1260 ) ) ( IN-AIRPLANE ?AUTO_1258 ?AUTO_1264 ) ( AIRPLANE-AT ?AUTO_1264 ?AUTO_1262 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1258 ?AUTO_1264 ?AUTO_1262 )
      ( DELIVER-PKG ?AUTO_1258 ?AUTO_1259 )
      ( DELIVER-PKG-VERIFY ?AUTO_1258 ?AUTO_1259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1892 - OBJ
      ?AUTO_1893 - LOCATION
    )
    :vars
    (
      ?AUTO_1898 - LOCATION
      ?AUTO_1894 - AIRPLANE
      ?AUTO_1895 - LOCATION
      ?AUTO_1896 - CITY
      ?AUTO_1897 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1898 ) ( AIRPORT ?AUTO_1893 ) ( AIRPLANE-AT ?AUTO_1894 ?AUTO_1898 ) ( not ( = ?AUTO_1898 ?AUTO_1893 ) ) ( IN-CITY ?AUTO_1895 ?AUTO_1896 ) ( IN-CITY ?AUTO_1898 ?AUTO_1896 ) ( not ( = ?AUTO_1898 ?AUTO_1895 ) ) ( not ( = ?AUTO_1893 ?AUTO_1895 ) ) ( OBJ-AT ?AUTO_1892 ?AUTO_1895 ) ( TRUCK-AT ?AUTO_1897 ?AUTO_1898 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1897 ?AUTO_1898 ?AUTO_1895 ?AUTO_1896 )
      ( DELIVER-PKG ?AUTO_1892 ?AUTO_1893 )
      ( DELIVER-PKG-VERIFY ?AUTO_1892 ?AUTO_1893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1901 - OBJ
      ?AUTO_1902 - LOCATION
    )
    :vars
    (
      ?AUTO_1904 - LOCATION
      ?AUTO_1903 - LOCATION
      ?AUTO_1907 - CITY
      ?AUTO_1905 - TRUCK
      ?AUTO_1908 - LOCATION
      ?AUTO_1906 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1904 ) ( AIRPORT ?AUTO_1902 ) ( not ( = ?AUTO_1904 ?AUTO_1902 ) ) ( IN-CITY ?AUTO_1903 ?AUTO_1907 ) ( IN-CITY ?AUTO_1904 ?AUTO_1907 ) ( not ( = ?AUTO_1904 ?AUTO_1903 ) ) ( not ( = ?AUTO_1902 ?AUTO_1903 ) ) ( OBJ-AT ?AUTO_1901 ?AUTO_1903 ) ( TRUCK-AT ?AUTO_1905 ?AUTO_1904 ) ( AIRPORT ?AUTO_1908 ) ( AIRPLANE-AT ?AUTO_1906 ?AUTO_1908 ) ( not ( = ?AUTO_1908 ?AUTO_1904 ) ) ( not ( = ?AUTO_1902 ?AUTO_1908 ) ) ( not ( = ?AUTO_1903 ?AUTO_1908 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1906 ?AUTO_1908 ?AUTO_1904 )
      ( DELIVER-PKG ?AUTO_1901 ?AUTO_1902 )
      ( DELIVER-PKG-VERIFY ?AUTO_1901 ?AUTO_1902 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2102 - OBJ
      ?AUTO_2103 - LOCATION
    )
    :vars
    (
      ?AUTO_2106 - LOCATION
      ?AUTO_2104 - CITY
      ?AUTO_2105 - TRUCK
      ?AUTO_2107 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2106 ?AUTO_2104 ) ( IN-CITY ?AUTO_2103 ?AUTO_2104 ) ( not ( = ?AUTO_2103 ?AUTO_2106 ) ) ( TRUCK-AT ?AUTO_2105 ?AUTO_2103 ) ( IN-AIRPLANE ?AUTO_2102 ?AUTO_2107 ) ( AIRPLANE-AT ?AUTO_2107 ?AUTO_2106 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2102 ?AUTO_2107 ?AUTO_2106 )
      ( DELIVER-PKG ?AUTO_2102 ?AUTO_2103 )
      ( DELIVER-PKG-VERIFY ?AUTO_2102 ?AUTO_2103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2108 - OBJ
      ?AUTO_2109 - LOCATION
    )
    :vars
    (
      ?AUTO_2111 - LOCATION
      ?AUTO_2112 - CITY
      ?AUTO_2110 - TRUCK
      ?AUTO_2113 - AIRPLANE
      ?AUTO_2114 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2111 ?AUTO_2112 ) ( IN-CITY ?AUTO_2109 ?AUTO_2112 ) ( not ( = ?AUTO_2109 ?AUTO_2111 ) ) ( TRUCK-AT ?AUTO_2110 ?AUTO_2109 ) ( IN-AIRPLANE ?AUTO_2108 ?AUTO_2113 ) ( AIRPORT ?AUTO_2114 ) ( AIRPORT ?AUTO_2111 ) ( AIRPLANE-AT ?AUTO_2113 ?AUTO_2114 ) ( not ( = ?AUTO_2114 ?AUTO_2111 ) ) ( not ( = ?AUTO_2109 ?AUTO_2114 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2113 ?AUTO_2114 ?AUTO_2111 )
      ( DELIVER-PKG ?AUTO_2108 ?AUTO_2109 )
      ( DELIVER-PKG-VERIFY ?AUTO_2108 ?AUTO_2109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2119 - OBJ
      ?AUTO_2120 - LOCATION
    )
    :vars
    (
      ?AUTO_2121 - LOCATION
      ?AUTO_2123 - CITY
      ?AUTO_2124 - TRUCK
      ?AUTO_2125 - LOCATION
      ?AUTO_2122 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2121 ?AUTO_2123 ) ( IN-CITY ?AUTO_2120 ?AUTO_2123 ) ( not ( = ?AUTO_2120 ?AUTO_2121 ) ) ( TRUCK-AT ?AUTO_2124 ?AUTO_2120 ) ( AIRPORT ?AUTO_2125 ) ( AIRPORT ?AUTO_2121 ) ( AIRPLANE-AT ?AUTO_2122 ?AUTO_2125 ) ( not ( = ?AUTO_2125 ?AUTO_2121 ) ) ( not ( = ?AUTO_2120 ?AUTO_2125 ) ) ( OBJ-AT ?AUTO_2119 ?AUTO_2125 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2119 ?AUTO_2122 ?AUTO_2125 )
      ( DELIVER-PKG ?AUTO_2119 ?AUTO_2120 )
      ( DELIVER-PKG-VERIFY ?AUTO_2119 ?AUTO_2120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2126 - OBJ
      ?AUTO_2127 - LOCATION
    )
    :vars
    (
      ?AUTO_2129 - LOCATION
      ?AUTO_2130 - CITY
      ?AUTO_2132 - TRUCK
      ?AUTO_2131 - LOCATION
      ?AUTO_2133 - LOCATION
      ?AUTO_2128 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2129 ?AUTO_2130 ) ( IN-CITY ?AUTO_2127 ?AUTO_2130 ) ( not ( = ?AUTO_2127 ?AUTO_2129 ) ) ( TRUCK-AT ?AUTO_2132 ?AUTO_2127 ) ( AIRPORT ?AUTO_2131 ) ( AIRPORT ?AUTO_2129 ) ( not ( = ?AUTO_2131 ?AUTO_2129 ) ) ( not ( = ?AUTO_2127 ?AUTO_2131 ) ) ( OBJ-AT ?AUTO_2126 ?AUTO_2131 ) ( AIRPORT ?AUTO_2133 ) ( AIRPLANE-AT ?AUTO_2128 ?AUTO_2133 ) ( not ( = ?AUTO_2133 ?AUTO_2131 ) ) ( not ( = ?AUTO_2127 ?AUTO_2133 ) ) ( not ( = ?AUTO_2129 ?AUTO_2133 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2128 ?AUTO_2133 ?AUTO_2131 )
      ( DELIVER-PKG ?AUTO_2126 ?AUTO_2127 )
      ( DELIVER-PKG-VERIFY ?AUTO_2126 ?AUTO_2127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2150 - OBJ
      ?AUTO_2151 - LOCATION
    )
    :vars
    (
      ?AUTO_2156 - LOCATION
      ?AUTO_2154 - CITY
      ?AUTO_2153 - TRUCK
      ?AUTO_2152 - LOCATION
      ?AUTO_2157 - LOCATION
      ?AUTO_2155 - AIRPLANE
      ?AUTO_2158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2156 ?AUTO_2154 ) ( IN-CITY ?AUTO_2151 ?AUTO_2154 ) ( not ( = ?AUTO_2151 ?AUTO_2156 ) ) ( TRUCK-AT ?AUTO_2153 ?AUTO_2151 ) ( AIRPORT ?AUTO_2152 ) ( AIRPORT ?AUTO_2156 ) ( not ( = ?AUTO_2152 ?AUTO_2156 ) ) ( not ( = ?AUTO_2151 ?AUTO_2152 ) ) ( AIRPORT ?AUTO_2157 ) ( AIRPLANE-AT ?AUTO_2155 ?AUTO_2157 ) ( not ( = ?AUTO_2157 ?AUTO_2152 ) ) ( not ( = ?AUTO_2151 ?AUTO_2157 ) ) ( not ( = ?AUTO_2156 ?AUTO_2157 ) ) ( TRUCK-AT ?AUTO_2158 ?AUTO_2152 ) ( IN-TRUCK ?AUTO_2150 ?AUTO_2158 ) ( not ( = ?AUTO_2153 ?AUTO_2158 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2150 ?AUTO_2158 ?AUTO_2152 )
      ( DELIVER-PKG ?AUTO_2150 ?AUTO_2151 )
      ( DELIVER-PKG-VERIFY ?AUTO_2150 ?AUTO_2151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2159 - OBJ
      ?AUTO_2160 - LOCATION
    )
    :vars
    (
      ?AUTO_2165 - LOCATION
      ?AUTO_2166 - CITY
      ?AUTO_2161 - TRUCK
      ?AUTO_2162 - LOCATION
      ?AUTO_2163 - LOCATION
      ?AUTO_2167 - AIRPLANE
      ?AUTO_2164 - TRUCK
      ?AUTO_2169 - LOCATION
      ?AUTO_2168 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2165 ?AUTO_2166 ) ( IN-CITY ?AUTO_2160 ?AUTO_2166 ) ( not ( = ?AUTO_2160 ?AUTO_2165 ) ) ( TRUCK-AT ?AUTO_2161 ?AUTO_2160 ) ( AIRPORT ?AUTO_2162 ) ( AIRPORT ?AUTO_2165 ) ( not ( = ?AUTO_2162 ?AUTO_2165 ) ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) ( AIRPORT ?AUTO_2163 ) ( AIRPLANE-AT ?AUTO_2167 ?AUTO_2163 ) ( not ( = ?AUTO_2163 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2163 ) ) ( not ( = ?AUTO_2165 ?AUTO_2163 ) ) ( IN-TRUCK ?AUTO_2159 ?AUTO_2164 ) ( not ( = ?AUTO_2161 ?AUTO_2164 ) ) ( TRUCK-AT ?AUTO_2164 ?AUTO_2169 ) ( IN-CITY ?AUTO_2169 ?AUTO_2168 ) ( IN-CITY ?AUTO_2162 ?AUTO_2168 ) ( not ( = ?AUTO_2162 ?AUTO_2169 ) ) ( not ( = ?AUTO_2160 ?AUTO_2169 ) ) ( not ( = ?AUTO_2165 ?AUTO_2169 ) ) ( not ( = ?AUTO_2166 ?AUTO_2168 ) ) ( not ( = ?AUTO_2163 ?AUTO_2169 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2164 ?AUTO_2169 ?AUTO_2162 ?AUTO_2168 )
      ( DELIVER-PKG ?AUTO_2159 ?AUTO_2160 )
      ( DELIVER-PKG-VERIFY ?AUTO_2159 ?AUTO_2160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2180 - OBJ
      ?AUTO_2181 - LOCATION
    )
    :vars
    (
      ?AUTO_2187 - LOCATION
      ?AUTO_2183 - CITY
      ?AUTO_2186 - TRUCK
      ?AUTO_2184 - LOCATION
      ?AUTO_2182 - LOCATION
      ?AUTO_2189 - AIRPLANE
      ?AUTO_2188 - TRUCK
      ?AUTO_2190 - LOCATION
      ?AUTO_2185 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2187 ?AUTO_2183 ) ( IN-CITY ?AUTO_2181 ?AUTO_2183 ) ( not ( = ?AUTO_2181 ?AUTO_2187 ) ) ( TRUCK-AT ?AUTO_2186 ?AUTO_2181 ) ( AIRPORT ?AUTO_2184 ) ( AIRPORT ?AUTO_2187 ) ( not ( = ?AUTO_2184 ?AUTO_2187 ) ) ( not ( = ?AUTO_2181 ?AUTO_2184 ) ) ( AIRPORT ?AUTO_2182 ) ( AIRPLANE-AT ?AUTO_2189 ?AUTO_2182 ) ( not ( = ?AUTO_2182 ?AUTO_2184 ) ) ( not ( = ?AUTO_2181 ?AUTO_2182 ) ) ( not ( = ?AUTO_2187 ?AUTO_2182 ) ) ( not ( = ?AUTO_2186 ?AUTO_2188 ) ) ( TRUCK-AT ?AUTO_2188 ?AUTO_2190 ) ( IN-CITY ?AUTO_2190 ?AUTO_2185 ) ( IN-CITY ?AUTO_2184 ?AUTO_2185 ) ( not ( = ?AUTO_2184 ?AUTO_2190 ) ) ( not ( = ?AUTO_2181 ?AUTO_2190 ) ) ( not ( = ?AUTO_2187 ?AUTO_2190 ) ) ( not ( = ?AUTO_2183 ?AUTO_2185 ) ) ( not ( = ?AUTO_2182 ?AUTO_2190 ) ) ( OBJ-AT ?AUTO_2180 ?AUTO_2190 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2180 ?AUTO_2188 ?AUTO_2190 )
      ( DELIVER-PKG ?AUTO_2180 ?AUTO_2181 )
      ( DELIVER-PKG-VERIFY ?AUTO_2180 ?AUTO_2181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2409 - OBJ
      ?AUTO_2410 - LOCATION
    )
    :vars
    (
      ?AUTO_2418 - LOCATION
      ?AUTO_2419 - CITY
      ?AUTO_2413 - TRUCK
      ?AUTO_2412 - LOCATION
      ?AUTO_2414 - LOCATION
      ?AUTO_2411 - AIRPLANE
      ?AUTO_2417 - TRUCK
      ?AUTO_2415 - LOCATION
      ?AUTO_2416 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2418 ?AUTO_2419 ) ( IN-CITY ?AUTO_2410 ?AUTO_2419 ) ( not ( = ?AUTO_2410 ?AUTO_2418 ) ) ( TRUCK-AT ?AUTO_2413 ?AUTO_2412 ) ( IN-CITY ?AUTO_2412 ?AUTO_2419 ) ( not ( = ?AUTO_2418 ?AUTO_2412 ) ) ( not ( = ?AUTO_2410 ?AUTO_2412 ) ) ( AIRPORT ?AUTO_2414 ) ( AIRPORT ?AUTO_2418 ) ( AIRPLANE-AT ?AUTO_2411 ?AUTO_2414 ) ( not ( = ?AUTO_2414 ?AUTO_2418 ) ) ( not ( = ?AUTO_2410 ?AUTO_2414 ) ) ( not ( = ?AUTO_2412 ?AUTO_2414 ) ) ( not ( = ?AUTO_2413 ?AUTO_2417 ) ) ( IN-CITY ?AUTO_2415 ?AUTO_2416 ) ( IN-CITY ?AUTO_2414 ?AUTO_2416 ) ( not ( = ?AUTO_2414 ?AUTO_2415 ) ) ( not ( = ?AUTO_2410 ?AUTO_2415 ) ) ( not ( = ?AUTO_2418 ?AUTO_2415 ) ) ( not ( = ?AUTO_2419 ?AUTO_2416 ) ) ( not ( = ?AUTO_2412 ?AUTO_2415 ) ) ( OBJ-AT ?AUTO_2409 ?AUTO_2415 ) ( TRUCK-AT ?AUTO_2417 ?AUTO_2414 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2417 ?AUTO_2414 ?AUTO_2415 ?AUTO_2416 )
      ( DELIVER-PKG ?AUTO_2409 ?AUTO_2410 )
      ( DELIVER-PKG-VERIFY ?AUTO_2409 ?AUTO_2410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2422 - OBJ
      ?AUTO_2423 - LOCATION
    )
    :vars
    (
      ?AUTO_2425 - LOCATION
      ?AUTO_2424 - CITY
      ?AUTO_2427 - TRUCK
      ?AUTO_2430 - LOCATION
      ?AUTO_2432 - LOCATION
      ?AUTO_2426 - TRUCK
      ?AUTO_2429 - LOCATION
      ?AUTO_2431 - CITY
      ?AUTO_2433 - LOCATION
      ?AUTO_2428 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2425 ?AUTO_2424 ) ( IN-CITY ?AUTO_2423 ?AUTO_2424 ) ( not ( = ?AUTO_2423 ?AUTO_2425 ) ) ( TRUCK-AT ?AUTO_2427 ?AUTO_2430 ) ( IN-CITY ?AUTO_2430 ?AUTO_2424 ) ( not ( = ?AUTO_2425 ?AUTO_2430 ) ) ( not ( = ?AUTO_2423 ?AUTO_2430 ) ) ( AIRPORT ?AUTO_2432 ) ( AIRPORT ?AUTO_2425 ) ( not ( = ?AUTO_2432 ?AUTO_2425 ) ) ( not ( = ?AUTO_2423 ?AUTO_2432 ) ) ( not ( = ?AUTO_2430 ?AUTO_2432 ) ) ( not ( = ?AUTO_2427 ?AUTO_2426 ) ) ( IN-CITY ?AUTO_2429 ?AUTO_2431 ) ( IN-CITY ?AUTO_2432 ?AUTO_2431 ) ( not ( = ?AUTO_2432 ?AUTO_2429 ) ) ( not ( = ?AUTO_2423 ?AUTO_2429 ) ) ( not ( = ?AUTO_2425 ?AUTO_2429 ) ) ( not ( = ?AUTO_2424 ?AUTO_2431 ) ) ( not ( = ?AUTO_2430 ?AUTO_2429 ) ) ( OBJ-AT ?AUTO_2422 ?AUTO_2429 ) ( TRUCK-AT ?AUTO_2426 ?AUTO_2432 ) ( AIRPORT ?AUTO_2433 ) ( AIRPLANE-AT ?AUTO_2428 ?AUTO_2433 ) ( not ( = ?AUTO_2433 ?AUTO_2432 ) ) ( not ( = ?AUTO_2423 ?AUTO_2433 ) ) ( not ( = ?AUTO_2425 ?AUTO_2433 ) ) ( not ( = ?AUTO_2430 ?AUTO_2433 ) ) ( not ( = ?AUTO_2429 ?AUTO_2433 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2428 ?AUTO_2433 ?AUTO_2432 )
      ( DELIVER-PKG ?AUTO_2422 ?AUTO_2423 )
      ( DELIVER-PKG-VERIFY ?AUTO_2422 ?AUTO_2423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2462 - OBJ
      ?AUTO_2463 - LOCATION
    )
    :vars
    (
      ?AUTO_2465 - LOCATION
      ?AUTO_2464 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2465 ) ( AIRPORT ?AUTO_2463 ) ( not ( = ?AUTO_2465 ?AUTO_2463 ) ) ( OBJ-AT ?AUTO_2462 ?AUTO_2465 ) ( AIRPLANE-AT ?AUTO_2464 ?AUTO_2463 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2464 ?AUTO_2463 ?AUTO_2465 )
      ( DELIVER-PKG ?AUTO_2462 ?AUTO_2463 )
      ( DELIVER-PKG-VERIFY ?AUTO_2462 ?AUTO_2463 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2466 - OBJ
      ?AUTO_2467 - LOCATION
    )
    :vars
    (
      ?AUTO_2469 - LOCATION
      ?AUTO_2468 - AIRPLANE
      ?AUTO_2470 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2469 ) ( AIRPORT ?AUTO_2467 ) ( not ( = ?AUTO_2469 ?AUTO_2467 ) ) ( AIRPLANE-AT ?AUTO_2468 ?AUTO_2467 ) ( TRUCK-AT ?AUTO_2470 ?AUTO_2469 ) ( IN-TRUCK ?AUTO_2466 ?AUTO_2470 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2466 ?AUTO_2470 ?AUTO_2469 )
      ( DELIVER-PKG ?AUTO_2466 ?AUTO_2467 )
      ( DELIVER-PKG-VERIFY ?AUTO_2466 ?AUTO_2467 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2471 - OBJ
      ?AUTO_2472 - LOCATION
    )
    :vars
    (
      ?AUTO_2474 - LOCATION
      ?AUTO_2475 - AIRPLANE
      ?AUTO_2473 - TRUCK
      ?AUTO_2477 - LOCATION
      ?AUTO_2476 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2474 ) ( AIRPORT ?AUTO_2472 ) ( not ( = ?AUTO_2474 ?AUTO_2472 ) ) ( AIRPLANE-AT ?AUTO_2475 ?AUTO_2472 ) ( IN-TRUCK ?AUTO_2471 ?AUTO_2473 ) ( TRUCK-AT ?AUTO_2473 ?AUTO_2477 ) ( IN-CITY ?AUTO_2477 ?AUTO_2476 ) ( IN-CITY ?AUTO_2474 ?AUTO_2476 ) ( not ( = ?AUTO_2474 ?AUTO_2477 ) ) ( not ( = ?AUTO_2472 ?AUTO_2477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2473 ?AUTO_2477 ?AUTO_2474 ?AUTO_2476 )
      ( DELIVER-PKG ?AUTO_2471 ?AUTO_2472 )
      ( DELIVER-PKG-VERIFY ?AUTO_2471 ?AUTO_2472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2478 - OBJ
      ?AUTO_2479 - LOCATION
    )
    :vars
    (
      ?AUTO_2481 - LOCATION
      ?AUTO_2480 - AIRPLANE
      ?AUTO_2482 - TRUCK
      ?AUTO_2484 - LOCATION
      ?AUTO_2483 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2481 ) ( AIRPORT ?AUTO_2479 ) ( not ( = ?AUTO_2481 ?AUTO_2479 ) ) ( AIRPLANE-AT ?AUTO_2480 ?AUTO_2479 ) ( TRUCK-AT ?AUTO_2482 ?AUTO_2484 ) ( IN-CITY ?AUTO_2484 ?AUTO_2483 ) ( IN-CITY ?AUTO_2481 ?AUTO_2483 ) ( not ( = ?AUTO_2481 ?AUTO_2484 ) ) ( not ( = ?AUTO_2479 ?AUTO_2484 ) ) ( OBJ-AT ?AUTO_2478 ?AUTO_2484 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2478 ?AUTO_2482 ?AUTO_2484 )
      ( DELIVER-PKG ?AUTO_2478 ?AUTO_2479 )
      ( DELIVER-PKG-VERIFY ?AUTO_2478 ?AUTO_2479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2610 - OBJ
      ?AUTO_2611 - LOCATION
    )
    :vars
    (
      ?AUTO_2613 - LOCATION
      ?AUTO_2612 - CITY
      ?AUTO_2617 - TRUCK
      ?AUTO_2618 - LOCATION
      ?AUTO_2614 - LOCATION
      ?AUTO_2616 - LOCATION
      ?AUTO_2615 - AIRPLANE
      ?AUTO_2619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2613 ?AUTO_2612 ) ( IN-CITY ?AUTO_2611 ?AUTO_2612 ) ( not ( = ?AUTO_2611 ?AUTO_2613 ) ) ( TRUCK-AT ?AUTO_2617 ?AUTO_2618 ) ( IN-CITY ?AUTO_2618 ?AUTO_2612 ) ( not ( = ?AUTO_2613 ?AUTO_2618 ) ) ( not ( = ?AUTO_2611 ?AUTO_2618 ) ) ( AIRPORT ?AUTO_2614 ) ( AIRPORT ?AUTO_2613 ) ( not ( = ?AUTO_2614 ?AUTO_2613 ) ) ( not ( = ?AUTO_2611 ?AUTO_2614 ) ) ( not ( = ?AUTO_2618 ?AUTO_2614 ) ) ( AIRPORT ?AUTO_2616 ) ( AIRPLANE-AT ?AUTO_2615 ?AUTO_2616 ) ( not ( = ?AUTO_2616 ?AUTO_2614 ) ) ( not ( = ?AUTO_2611 ?AUTO_2616 ) ) ( not ( = ?AUTO_2613 ?AUTO_2616 ) ) ( not ( = ?AUTO_2618 ?AUTO_2616 ) ) ( TRUCK-AT ?AUTO_2619 ?AUTO_2614 ) ( IN-TRUCK ?AUTO_2610 ?AUTO_2619 ) ( not ( = ?AUTO_2617 ?AUTO_2619 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2610 ?AUTO_2619 ?AUTO_2614 )
      ( DELIVER-PKG ?AUTO_2610 ?AUTO_2611 )
      ( DELIVER-PKG-VERIFY ?AUTO_2610 ?AUTO_2611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2620 - OBJ
      ?AUTO_2621 - LOCATION
    )
    :vars
    (
      ?AUTO_2627 - LOCATION
      ?AUTO_2623 - CITY
      ?AUTO_2628 - TRUCK
      ?AUTO_2624 - LOCATION
      ?AUTO_2626 - LOCATION
      ?AUTO_2625 - LOCATION
      ?AUTO_2622 - AIRPLANE
      ?AUTO_2629 - TRUCK
      ?AUTO_2631 - LOCATION
      ?AUTO_2630 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2627 ?AUTO_2623 ) ( IN-CITY ?AUTO_2621 ?AUTO_2623 ) ( not ( = ?AUTO_2621 ?AUTO_2627 ) ) ( TRUCK-AT ?AUTO_2628 ?AUTO_2624 ) ( IN-CITY ?AUTO_2624 ?AUTO_2623 ) ( not ( = ?AUTO_2627 ?AUTO_2624 ) ) ( not ( = ?AUTO_2621 ?AUTO_2624 ) ) ( AIRPORT ?AUTO_2626 ) ( AIRPORT ?AUTO_2627 ) ( not ( = ?AUTO_2626 ?AUTO_2627 ) ) ( not ( = ?AUTO_2621 ?AUTO_2626 ) ) ( not ( = ?AUTO_2624 ?AUTO_2626 ) ) ( AIRPORT ?AUTO_2625 ) ( AIRPLANE-AT ?AUTO_2622 ?AUTO_2625 ) ( not ( = ?AUTO_2625 ?AUTO_2626 ) ) ( not ( = ?AUTO_2621 ?AUTO_2625 ) ) ( not ( = ?AUTO_2627 ?AUTO_2625 ) ) ( not ( = ?AUTO_2624 ?AUTO_2625 ) ) ( IN-TRUCK ?AUTO_2620 ?AUTO_2629 ) ( not ( = ?AUTO_2628 ?AUTO_2629 ) ) ( TRUCK-AT ?AUTO_2629 ?AUTO_2631 ) ( IN-CITY ?AUTO_2631 ?AUTO_2630 ) ( IN-CITY ?AUTO_2626 ?AUTO_2630 ) ( not ( = ?AUTO_2626 ?AUTO_2631 ) ) ( not ( = ?AUTO_2621 ?AUTO_2631 ) ) ( not ( = ?AUTO_2627 ?AUTO_2631 ) ) ( not ( = ?AUTO_2623 ?AUTO_2630 ) ) ( not ( = ?AUTO_2624 ?AUTO_2631 ) ) ( not ( = ?AUTO_2625 ?AUTO_2631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2629 ?AUTO_2631 ?AUTO_2626 ?AUTO_2630 )
      ( DELIVER-PKG ?AUTO_2620 ?AUTO_2621 )
      ( DELIVER-PKG-VERIFY ?AUTO_2620 ?AUTO_2621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2632 - OBJ
      ?AUTO_2633 - LOCATION
    )
    :vars
    (
      ?AUTO_2635 - LOCATION
      ?AUTO_2634 - CITY
      ?AUTO_2638 - TRUCK
      ?AUTO_2641 - LOCATION
      ?AUTO_2642 - LOCATION
      ?AUTO_2640 - LOCATION
      ?AUTO_2637 - AIRPLANE
      ?AUTO_2636 - TRUCK
      ?AUTO_2639 - LOCATION
      ?AUTO_2643 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2635 ?AUTO_2634 ) ( IN-CITY ?AUTO_2633 ?AUTO_2634 ) ( not ( = ?AUTO_2633 ?AUTO_2635 ) ) ( TRUCK-AT ?AUTO_2638 ?AUTO_2641 ) ( IN-CITY ?AUTO_2641 ?AUTO_2634 ) ( not ( = ?AUTO_2635 ?AUTO_2641 ) ) ( not ( = ?AUTO_2633 ?AUTO_2641 ) ) ( AIRPORT ?AUTO_2642 ) ( AIRPORT ?AUTO_2635 ) ( not ( = ?AUTO_2642 ?AUTO_2635 ) ) ( not ( = ?AUTO_2633 ?AUTO_2642 ) ) ( not ( = ?AUTO_2641 ?AUTO_2642 ) ) ( AIRPORT ?AUTO_2640 ) ( AIRPLANE-AT ?AUTO_2637 ?AUTO_2640 ) ( not ( = ?AUTO_2640 ?AUTO_2642 ) ) ( not ( = ?AUTO_2633 ?AUTO_2640 ) ) ( not ( = ?AUTO_2635 ?AUTO_2640 ) ) ( not ( = ?AUTO_2641 ?AUTO_2640 ) ) ( not ( = ?AUTO_2638 ?AUTO_2636 ) ) ( TRUCK-AT ?AUTO_2636 ?AUTO_2639 ) ( IN-CITY ?AUTO_2639 ?AUTO_2643 ) ( IN-CITY ?AUTO_2642 ?AUTO_2643 ) ( not ( = ?AUTO_2642 ?AUTO_2639 ) ) ( not ( = ?AUTO_2633 ?AUTO_2639 ) ) ( not ( = ?AUTO_2635 ?AUTO_2639 ) ) ( not ( = ?AUTO_2634 ?AUTO_2643 ) ) ( not ( = ?AUTO_2641 ?AUTO_2639 ) ) ( not ( = ?AUTO_2640 ?AUTO_2639 ) ) ( OBJ-AT ?AUTO_2632 ?AUTO_2639 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2632 ?AUTO_2636 ?AUTO_2639 )
      ( DELIVER-PKG ?AUTO_2632 ?AUTO_2633 )
      ( DELIVER-PKG-VERIFY ?AUTO_2632 ?AUTO_2633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2644 - OBJ
      ?AUTO_2645 - LOCATION
    )
    :vars
    (
      ?AUTO_2646 - LOCATION
      ?AUTO_2647 - CITY
      ?AUTO_2651 - TRUCK
      ?AUTO_2652 - LOCATION
      ?AUTO_2655 - LOCATION
      ?AUTO_2653 - LOCATION
      ?AUTO_2648 - AIRPLANE
      ?AUTO_2649 - TRUCK
      ?AUTO_2650 - LOCATION
      ?AUTO_2654 - CITY
      ?AUTO_2656 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2646 ?AUTO_2647 ) ( IN-CITY ?AUTO_2645 ?AUTO_2647 ) ( not ( = ?AUTO_2645 ?AUTO_2646 ) ) ( TRUCK-AT ?AUTO_2651 ?AUTO_2652 ) ( IN-CITY ?AUTO_2652 ?AUTO_2647 ) ( not ( = ?AUTO_2646 ?AUTO_2652 ) ) ( not ( = ?AUTO_2645 ?AUTO_2652 ) ) ( AIRPORT ?AUTO_2655 ) ( AIRPORT ?AUTO_2646 ) ( not ( = ?AUTO_2655 ?AUTO_2646 ) ) ( not ( = ?AUTO_2645 ?AUTO_2655 ) ) ( not ( = ?AUTO_2652 ?AUTO_2655 ) ) ( AIRPORT ?AUTO_2653 ) ( AIRPLANE-AT ?AUTO_2648 ?AUTO_2653 ) ( not ( = ?AUTO_2653 ?AUTO_2655 ) ) ( not ( = ?AUTO_2645 ?AUTO_2653 ) ) ( not ( = ?AUTO_2646 ?AUTO_2653 ) ) ( not ( = ?AUTO_2652 ?AUTO_2653 ) ) ( not ( = ?AUTO_2651 ?AUTO_2649 ) ) ( IN-CITY ?AUTO_2650 ?AUTO_2654 ) ( IN-CITY ?AUTO_2655 ?AUTO_2654 ) ( not ( = ?AUTO_2655 ?AUTO_2650 ) ) ( not ( = ?AUTO_2645 ?AUTO_2650 ) ) ( not ( = ?AUTO_2646 ?AUTO_2650 ) ) ( not ( = ?AUTO_2647 ?AUTO_2654 ) ) ( not ( = ?AUTO_2652 ?AUTO_2650 ) ) ( not ( = ?AUTO_2653 ?AUTO_2650 ) ) ( OBJ-AT ?AUTO_2644 ?AUTO_2650 ) ( TRUCK-AT ?AUTO_2649 ?AUTO_2656 ) ( IN-CITY ?AUTO_2656 ?AUTO_2654 ) ( not ( = ?AUTO_2650 ?AUTO_2656 ) ) ( not ( = ?AUTO_2645 ?AUTO_2656 ) ) ( not ( = ?AUTO_2646 ?AUTO_2656 ) ) ( not ( = ?AUTO_2652 ?AUTO_2656 ) ) ( not ( = ?AUTO_2655 ?AUTO_2656 ) ) ( not ( = ?AUTO_2653 ?AUTO_2656 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2649 ?AUTO_2656 ?AUTO_2650 ?AUTO_2654 )
      ( DELIVER-PKG ?AUTO_2644 ?AUTO_2645 )
      ( DELIVER-PKG-VERIFY ?AUTO_2644 ?AUTO_2645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2766 - OBJ
      ?AUTO_2767 - LOCATION
    )
    :vars
    (
      ?AUTO_2770 - LOCATION
      ?AUTO_2769 - CITY
      ?AUTO_2768 - TRUCK
      ?AUTO_2771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2770 ?AUTO_2769 ) ( IN-CITY ?AUTO_2767 ?AUTO_2769 ) ( not ( = ?AUTO_2767 ?AUTO_2770 ) ) ( OBJ-AT ?AUTO_2766 ?AUTO_2770 ) ( TRUCK-AT ?AUTO_2768 ?AUTO_2771 ) ( IN-CITY ?AUTO_2771 ?AUTO_2769 ) ( not ( = ?AUTO_2767 ?AUTO_2771 ) ) ( not ( = ?AUTO_2770 ?AUTO_2771 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2768 ?AUTO_2771 ?AUTO_2767 ?AUTO_2769 )
      ( DELIVER-PKG ?AUTO_2766 ?AUTO_2767 )
      ( DELIVER-PKG-VERIFY ?AUTO_2766 ?AUTO_2767 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2928 - OBJ
      ?AUTO_2929 - LOCATION
    )
    :vars
    (
      ?AUTO_2931 - TRUCK
      ?AUTO_2934 - LOCATION
      ?AUTO_2932 - CITY
      ?AUTO_2933 - LOCATION
      ?AUTO_2930 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2931 ?AUTO_2934 ) ( IN-CITY ?AUTO_2934 ?AUTO_2932 ) ( IN-CITY ?AUTO_2929 ?AUTO_2932 ) ( not ( = ?AUTO_2929 ?AUTO_2934 ) ) ( AIRPORT ?AUTO_2933 ) ( AIRPORT ?AUTO_2934 ) ( not ( = ?AUTO_2933 ?AUTO_2934 ) ) ( not ( = ?AUTO_2929 ?AUTO_2933 ) ) ( OBJ-AT ?AUTO_2928 ?AUTO_2933 ) ( AIRPLANE-AT ?AUTO_2930 ?AUTO_2934 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2930 ?AUTO_2934 ?AUTO_2933 )
      ( DELIVER-PKG ?AUTO_2928 ?AUTO_2929 )
      ( DELIVER-PKG-VERIFY ?AUTO_2928 ?AUTO_2929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2939 - OBJ
      ?AUTO_2940 - LOCATION
    )
    :vars
    (
      ?AUTO_2944 - LOCATION
      ?AUTO_2941 - CITY
      ?AUTO_2945 - LOCATION
      ?AUTO_2942 - AIRPLANE
      ?AUTO_2943 - TRUCK
      ?AUTO_2946 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2944 ?AUTO_2941 ) ( IN-CITY ?AUTO_2940 ?AUTO_2941 ) ( not ( = ?AUTO_2940 ?AUTO_2944 ) ) ( AIRPORT ?AUTO_2945 ) ( AIRPORT ?AUTO_2944 ) ( not ( = ?AUTO_2945 ?AUTO_2944 ) ) ( not ( = ?AUTO_2940 ?AUTO_2945 ) ) ( OBJ-AT ?AUTO_2939 ?AUTO_2945 ) ( AIRPLANE-AT ?AUTO_2942 ?AUTO_2944 ) ( TRUCK-AT ?AUTO_2943 ?AUTO_2946 ) ( IN-CITY ?AUTO_2946 ?AUTO_2941 ) ( not ( = ?AUTO_2944 ?AUTO_2946 ) ) ( not ( = ?AUTO_2940 ?AUTO_2946 ) ) ( not ( = ?AUTO_2945 ?AUTO_2946 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2943 ?AUTO_2946 ?AUTO_2944 ?AUTO_2941 )
      ( DELIVER-PKG ?AUTO_2939 ?AUTO_2940 )
      ( DELIVER-PKG-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3144 - OBJ
      ?AUTO_3145 - LOCATION
    )
    :vars
    (
      ?AUTO_3146 - LOCATION
      ?AUTO_3148 - LOCATION
      ?AUTO_3151 - AIRPLANE
      ?AUTO_3147 - LOCATION
      ?AUTO_3149 - CITY
      ?AUTO_3150 - TRUCK
      ?AUTO_3152 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3146 ) ( AIRPORT ?AUTO_3145 ) ( not ( = ?AUTO_3146 ?AUTO_3145 ) ) ( AIRPORT ?AUTO_3148 ) ( AIRPLANE-AT ?AUTO_3151 ?AUTO_3148 ) ( not ( = ?AUTO_3148 ?AUTO_3146 ) ) ( not ( = ?AUTO_3145 ?AUTO_3148 ) ) ( IN-CITY ?AUTO_3147 ?AUTO_3149 ) ( IN-CITY ?AUTO_3146 ?AUTO_3149 ) ( not ( = ?AUTO_3146 ?AUTO_3147 ) ) ( not ( = ?AUTO_3145 ?AUTO_3147 ) ) ( not ( = ?AUTO_3148 ?AUTO_3147 ) ) ( OBJ-AT ?AUTO_3144 ?AUTO_3147 ) ( TRUCK-AT ?AUTO_3150 ?AUTO_3152 ) ( IN-CITY ?AUTO_3152 ?AUTO_3149 ) ( not ( = ?AUTO_3146 ?AUTO_3152 ) ) ( not ( = ?AUTO_3145 ?AUTO_3152 ) ) ( not ( = ?AUTO_3148 ?AUTO_3152 ) ) ( not ( = ?AUTO_3147 ?AUTO_3152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3150 ?AUTO_3152 ?AUTO_3146 ?AUTO_3149 )
      ( DELIVER-PKG ?AUTO_3144 ?AUTO_3145 )
      ( DELIVER-PKG-VERIFY ?AUTO_3144 ?AUTO_3145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3266 - OBJ
      ?AUTO_3267 - LOCATION
    )
    :vars
    (
      ?AUTO_3268 - LOCATION
      ?AUTO_3270 - LOCATION
      ?AUTO_3269 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3268 ) ( AIRPORT ?AUTO_3267 ) ( not ( = ?AUTO_3268 ?AUTO_3267 ) ) ( OBJ-AT ?AUTO_3266 ?AUTO_3268 ) ( AIRPORT ?AUTO_3270 ) ( not ( = ?AUTO_3270 ?AUTO_3268 ) ) ( not ( = ?AUTO_3267 ?AUTO_3270 ) ) ( AIRPLANE-AT ?AUTO_3269 ?AUTO_3267 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3269 ?AUTO_3267 ?AUTO_3270 )
      ( DELIVER-PKG ?AUTO_3266 ?AUTO_3267 )
      ( DELIVER-PKG-VERIFY ?AUTO_3266 ?AUTO_3267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3378 - OBJ
      ?AUTO_3379 - LOCATION
    )
    :vars
    (
      ?AUTO_3381 - TRUCK
      ?AUTO_3383 - LOCATION
      ?AUTO_3384 - CITY
      ?AUTO_3385 - LOCATION
      ?AUTO_3380 - LOCATION
      ?AUTO_3382 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3381 ?AUTO_3383 ) ( IN-CITY ?AUTO_3383 ?AUTO_3384 ) ( IN-CITY ?AUTO_3379 ?AUTO_3384 ) ( not ( = ?AUTO_3379 ?AUTO_3383 ) ) ( AIRPORT ?AUTO_3385 ) ( AIRPORT ?AUTO_3383 ) ( not ( = ?AUTO_3385 ?AUTO_3383 ) ) ( not ( = ?AUTO_3379 ?AUTO_3385 ) ) ( OBJ-AT ?AUTO_3378 ?AUTO_3385 ) ( AIRPORT ?AUTO_3380 ) ( not ( = ?AUTO_3380 ?AUTO_3385 ) ) ( not ( = ?AUTO_3379 ?AUTO_3380 ) ) ( not ( = ?AUTO_3383 ?AUTO_3380 ) ) ( AIRPLANE-AT ?AUTO_3382 ?AUTO_3383 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3382 ?AUTO_3383 ?AUTO_3380 )
      ( DELIVER-PKG ?AUTO_3378 ?AUTO_3379 )
      ( DELIVER-PKG-VERIFY ?AUTO_3378 ?AUTO_3379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3418 - OBJ
      ?AUTO_3419 - LOCATION
    )
    :vars
    (
      ?AUTO_3423 - LOCATION
      ?AUTO_3421 - CITY
      ?AUTO_3424 - LOCATION
      ?AUTO_3425 - LOCATION
      ?AUTO_3422 - AIRPLANE
      ?AUTO_3420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3423 ?AUTO_3421 ) ( IN-CITY ?AUTO_3419 ?AUTO_3421 ) ( not ( = ?AUTO_3419 ?AUTO_3423 ) ) ( AIRPORT ?AUTO_3424 ) ( AIRPORT ?AUTO_3423 ) ( not ( = ?AUTO_3424 ?AUTO_3423 ) ) ( not ( = ?AUTO_3419 ?AUTO_3424 ) ) ( OBJ-AT ?AUTO_3418 ?AUTO_3424 ) ( AIRPORT ?AUTO_3425 ) ( AIRPLANE-AT ?AUTO_3422 ?AUTO_3425 ) ( not ( = ?AUTO_3425 ?AUTO_3424 ) ) ( not ( = ?AUTO_3419 ?AUTO_3425 ) ) ( not ( = ?AUTO_3423 ?AUTO_3425 ) ) ( TRUCK-AT ?AUTO_3420 ?AUTO_3419 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3420 ?AUTO_3419 ?AUTO_3423 ?AUTO_3421 )
      ( DELIVER-PKG ?AUTO_3418 ?AUTO_3419 )
      ( DELIVER-PKG-VERIFY ?AUTO_3418 ?AUTO_3419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3436 - OBJ
      ?AUTO_3437 - LOCATION
    )
    :vars
    (
      ?AUTO_3438 - LOCATION
      ?AUTO_3439 - CITY
      ?AUTO_3443 - LOCATION
      ?AUTO_3440 - LOCATION
      ?AUTO_3441 - AIRPLANE
      ?AUTO_3442 - TRUCK
      ?AUTO_3444 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3438 ?AUTO_3439 ) ( IN-CITY ?AUTO_3437 ?AUTO_3439 ) ( not ( = ?AUTO_3437 ?AUTO_3438 ) ) ( AIRPORT ?AUTO_3443 ) ( AIRPORT ?AUTO_3438 ) ( not ( = ?AUTO_3443 ?AUTO_3438 ) ) ( not ( = ?AUTO_3437 ?AUTO_3443 ) ) ( OBJ-AT ?AUTO_3436 ?AUTO_3443 ) ( AIRPORT ?AUTO_3440 ) ( AIRPLANE-AT ?AUTO_3441 ?AUTO_3440 ) ( not ( = ?AUTO_3440 ?AUTO_3443 ) ) ( not ( = ?AUTO_3437 ?AUTO_3440 ) ) ( not ( = ?AUTO_3438 ?AUTO_3440 ) ) ( TRUCK-AT ?AUTO_3442 ?AUTO_3444 ) ( IN-CITY ?AUTO_3444 ?AUTO_3439 ) ( not ( = ?AUTO_3438 ?AUTO_3444 ) ) ( not ( = ?AUTO_3437 ?AUTO_3444 ) ) ( not ( = ?AUTO_3443 ?AUTO_3444 ) ) ( not ( = ?AUTO_3440 ?AUTO_3444 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3442 ?AUTO_3444 ?AUTO_3438 ?AUTO_3439 )
      ( DELIVER-PKG ?AUTO_3436 ?AUTO_3437 )
      ( DELIVER-PKG-VERIFY ?AUTO_3436 ?AUTO_3437 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3537 - OBJ
      ?AUTO_3538 - LOCATION
    )
    :vars
    (
      ?AUTO_3542 - LOCATION
      ?AUTO_3543 - CITY
      ?AUTO_3541 - TRUCK
      ?AUTO_3540 - LOCATION
      ?AUTO_3539 - AIRPLANE
      ?AUTO_3544 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3542 ?AUTO_3543 ) ( IN-CITY ?AUTO_3538 ?AUTO_3543 ) ( not ( = ?AUTO_3538 ?AUTO_3542 ) ) ( TRUCK-AT ?AUTO_3541 ?AUTO_3538 ) ( AIRPORT ?AUTO_3540 ) ( AIRPORT ?AUTO_3542 ) ( AIRPLANE-AT ?AUTO_3539 ?AUTO_3540 ) ( not ( = ?AUTO_3540 ?AUTO_3542 ) ) ( not ( = ?AUTO_3538 ?AUTO_3540 ) ) ( TRUCK-AT ?AUTO_3544 ?AUTO_3540 ) ( IN-TRUCK ?AUTO_3537 ?AUTO_3544 ) ( not ( = ?AUTO_3541 ?AUTO_3544 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3537 ?AUTO_3544 ?AUTO_3540 )
      ( DELIVER-PKG ?AUTO_3537 ?AUTO_3538 )
      ( DELIVER-PKG-VERIFY ?AUTO_3537 ?AUTO_3538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3545 - OBJ
      ?AUTO_3546 - LOCATION
    )
    :vars
    (
      ?AUTO_3548 - LOCATION
      ?AUTO_3551 - CITY
      ?AUTO_3550 - TRUCK
      ?AUTO_3547 - LOCATION
      ?AUTO_3549 - AIRPLANE
      ?AUTO_3552 - TRUCK
      ?AUTO_3554 - LOCATION
      ?AUTO_3553 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3548 ?AUTO_3551 ) ( IN-CITY ?AUTO_3546 ?AUTO_3551 ) ( not ( = ?AUTO_3546 ?AUTO_3548 ) ) ( TRUCK-AT ?AUTO_3550 ?AUTO_3546 ) ( AIRPORT ?AUTO_3547 ) ( AIRPORT ?AUTO_3548 ) ( AIRPLANE-AT ?AUTO_3549 ?AUTO_3547 ) ( not ( = ?AUTO_3547 ?AUTO_3548 ) ) ( not ( = ?AUTO_3546 ?AUTO_3547 ) ) ( IN-TRUCK ?AUTO_3545 ?AUTO_3552 ) ( not ( = ?AUTO_3550 ?AUTO_3552 ) ) ( TRUCK-AT ?AUTO_3552 ?AUTO_3554 ) ( IN-CITY ?AUTO_3554 ?AUTO_3553 ) ( IN-CITY ?AUTO_3547 ?AUTO_3553 ) ( not ( = ?AUTO_3547 ?AUTO_3554 ) ) ( not ( = ?AUTO_3546 ?AUTO_3554 ) ) ( not ( = ?AUTO_3548 ?AUTO_3554 ) ) ( not ( = ?AUTO_3551 ?AUTO_3553 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3552 ?AUTO_3554 ?AUTO_3547 ?AUTO_3553 )
      ( DELIVER-PKG ?AUTO_3545 ?AUTO_3546 )
      ( DELIVER-PKG-VERIFY ?AUTO_3545 ?AUTO_3546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3555 - OBJ
      ?AUTO_3556 - LOCATION
    )
    :vars
    (
      ?AUTO_3564 - LOCATION
      ?AUTO_3560 - CITY
      ?AUTO_3562 - TRUCK
      ?AUTO_3557 - LOCATION
      ?AUTO_3559 - AIRPLANE
      ?AUTO_3558 - TRUCK
      ?AUTO_3563 - LOCATION
      ?AUTO_3561 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3564 ?AUTO_3560 ) ( IN-CITY ?AUTO_3556 ?AUTO_3560 ) ( not ( = ?AUTO_3556 ?AUTO_3564 ) ) ( TRUCK-AT ?AUTO_3562 ?AUTO_3556 ) ( AIRPORT ?AUTO_3557 ) ( AIRPORT ?AUTO_3564 ) ( AIRPLANE-AT ?AUTO_3559 ?AUTO_3557 ) ( not ( = ?AUTO_3557 ?AUTO_3564 ) ) ( not ( = ?AUTO_3556 ?AUTO_3557 ) ) ( not ( = ?AUTO_3562 ?AUTO_3558 ) ) ( TRUCK-AT ?AUTO_3558 ?AUTO_3563 ) ( IN-CITY ?AUTO_3563 ?AUTO_3561 ) ( IN-CITY ?AUTO_3557 ?AUTO_3561 ) ( not ( = ?AUTO_3557 ?AUTO_3563 ) ) ( not ( = ?AUTO_3556 ?AUTO_3563 ) ) ( not ( = ?AUTO_3564 ?AUTO_3563 ) ) ( not ( = ?AUTO_3560 ?AUTO_3561 ) ) ( OBJ-AT ?AUTO_3555 ?AUTO_3563 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3555 ?AUTO_3558 ?AUTO_3563 )
      ( DELIVER-PKG ?AUTO_3555 ?AUTO_3556 )
      ( DELIVER-PKG-VERIFY ?AUTO_3555 ?AUTO_3556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3565 - OBJ
      ?AUTO_3566 - LOCATION
    )
    :vars
    (
      ?AUTO_3572 - LOCATION
      ?AUTO_3571 - CITY
      ?AUTO_3569 - TRUCK
      ?AUTO_3568 - LOCATION
      ?AUTO_3567 - AIRPLANE
      ?AUTO_3570 - TRUCK
      ?AUTO_3573 - LOCATION
      ?AUTO_3574 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3572 ?AUTO_3571 ) ( IN-CITY ?AUTO_3566 ?AUTO_3571 ) ( not ( = ?AUTO_3566 ?AUTO_3572 ) ) ( TRUCK-AT ?AUTO_3569 ?AUTO_3566 ) ( AIRPORT ?AUTO_3568 ) ( AIRPORT ?AUTO_3572 ) ( AIRPLANE-AT ?AUTO_3567 ?AUTO_3568 ) ( not ( = ?AUTO_3568 ?AUTO_3572 ) ) ( not ( = ?AUTO_3566 ?AUTO_3568 ) ) ( not ( = ?AUTO_3569 ?AUTO_3570 ) ) ( IN-CITY ?AUTO_3573 ?AUTO_3574 ) ( IN-CITY ?AUTO_3568 ?AUTO_3574 ) ( not ( = ?AUTO_3568 ?AUTO_3573 ) ) ( not ( = ?AUTO_3566 ?AUTO_3573 ) ) ( not ( = ?AUTO_3572 ?AUTO_3573 ) ) ( not ( = ?AUTO_3571 ?AUTO_3574 ) ) ( OBJ-AT ?AUTO_3565 ?AUTO_3573 ) ( TRUCK-AT ?AUTO_3570 ?AUTO_3568 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3570 ?AUTO_3568 ?AUTO_3573 ?AUTO_3574 )
      ( DELIVER-PKG ?AUTO_3565 ?AUTO_3566 )
      ( DELIVER-PKG-VERIFY ?AUTO_3565 ?AUTO_3566 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3740 - OBJ
      ?AUTO_3741 - LOCATION
    )
    :vars
    (
      ?AUTO_3744 - LOCATION
      ?AUTO_3745 - CITY
      ?AUTO_3749 - TRUCK
      ?AUTO_3743 - LOCATION
      ?AUTO_3748 - LOCATION
      ?AUTO_3751 - LOCATION
      ?AUTO_3746 - AIRPLANE
      ?AUTO_3750 - TRUCK
      ?AUTO_3747 - LOCATION
      ?AUTO_3742 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3744 ?AUTO_3745 ) ( IN-CITY ?AUTO_3741 ?AUTO_3745 ) ( not ( = ?AUTO_3741 ?AUTO_3744 ) ) ( TRUCK-AT ?AUTO_3749 ?AUTO_3743 ) ( IN-CITY ?AUTO_3743 ?AUTO_3745 ) ( not ( = ?AUTO_3744 ?AUTO_3743 ) ) ( not ( = ?AUTO_3741 ?AUTO_3743 ) ) ( AIRPORT ?AUTO_3748 ) ( AIRPORT ?AUTO_3744 ) ( not ( = ?AUTO_3748 ?AUTO_3744 ) ) ( not ( = ?AUTO_3741 ?AUTO_3748 ) ) ( not ( = ?AUTO_3743 ?AUTO_3748 ) ) ( AIRPORT ?AUTO_3751 ) ( AIRPLANE-AT ?AUTO_3746 ?AUTO_3751 ) ( not ( = ?AUTO_3751 ?AUTO_3748 ) ) ( not ( = ?AUTO_3741 ?AUTO_3751 ) ) ( not ( = ?AUTO_3744 ?AUTO_3751 ) ) ( not ( = ?AUTO_3743 ?AUTO_3751 ) ) ( not ( = ?AUTO_3749 ?AUTO_3750 ) ) ( IN-CITY ?AUTO_3747 ?AUTO_3742 ) ( IN-CITY ?AUTO_3748 ?AUTO_3742 ) ( not ( = ?AUTO_3748 ?AUTO_3747 ) ) ( not ( = ?AUTO_3741 ?AUTO_3747 ) ) ( not ( = ?AUTO_3744 ?AUTO_3747 ) ) ( not ( = ?AUTO_3745 ?AUTO_3742 ) ) ( not ( = ?AUTO_3743 ?AUTO_3747 ) ) ( not ( = ?AUTO_3751 ?AUTO_3747 ) ) ( OBJ-AT ?AUTO_3740 ?AUTO_3747 ) ( TRUCK-AT ?AUTO_3750 ?AUTO_3748 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3750 ?AUTO_3748 ?AUTO_3747 ?AUTO_3742 )
      ( DELIVER-PKG ?AUTO_3740 ?AUTO_3741 )
      ( DELIVER-PKG-VERIFY ?AUTO_3740 ?AUTO_3741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3758 - OBJ
      ?AUTO_3759 - LOCATION
    )
    :vars
    (
      ?AUTO_3768 - LOCATION
      ?AUTO_3767 - CITY
      ?AUTO_3766 - TRUCK
      ?AUTO_3769 - LOCATION
      ?AUTO_3763 - LOCATION
      ?AUTO_3761 - LOCATION
      ?AUTO_3762 - AIRPLANE
      ?AUTO_3765 - TRUCK
      ?AUTO_3760 - LOCATION
      ?AUTO_3764 - CITY
      ?AUTO_3770 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3768 ?AUTO_3767 ) ( IN-CITY ?AUTO_3759 ?AUTO_3767 ) ( not ( = ?AUTO_3759 ?AUTO_3768 ) ) ( TRUCK-AT ?AUTO_3766 ?AUTO_3769 ) ( IN-CITY ?AUTO_3769 ?AUTO_3767 ) ( not ( = ?AUTO_3768 ?AUTO_3769 ) ) ( not ( = ?AUTO_3759 ?AUTO_3769 ) ) ( AIRPORT ?AUTO_3763 ) ( AIRPORT ?AUTO_3768 ) ( not ( = ?AUTO_3763 ?AUTO_3768 ) ) ( not ( = ?AUTO_3759 ?AUTO_3763 ) ) ( not ( = ?AUTO_3769 ?AUTO_3763 ) ) ( AIRPORT ?AUTO_3761 ) ( AIRPLANE-AT ?AUTO_3762 ?AUTO_3761 ) ( not ( = ?AUTO_3761 ?AUTO_3763 ) ) ( not ( = ?AUTO_3759 ?AUTO_3761 ) ) ( not ( = ?AUTO_3768 ?AUTO_3761 ) ) ( not ( = ?AUTO_3769 ?AUTO_3761 ) ) ( not ( = ?AUTO_3766 ?AUTO_3765 ) ) ( IN-CITY ?AUTO_3760 ?AUTO_3764 ) ( IN-CITY ?AUTO_3763 ?AUTO_3764 ) ( not ( = ?AUTO_3763 ?AUTO_3760 ) ) ( not ( = ?AUTO_3759 ?AUTO_3760 ) ) ( not ( = ?AUTO_3768 ?AUTO_3760 ) ) ( not ( = ?AUTO_3767 ?AUTO_3764 ) ) ( not ( = ?AUTO_3769 ?AUTO_3760 ) ) ( not ( = ?AUTO_3761 ?AUTO_3760 ) ) ( OBJ-AT ?AUTO_3758 ?AUTO_3760 ) ( TRUCK-AT ?AUTO_3765 ?AUTO_3770 ) ( IN-CITY ?AUTO_3770 ?AUTO_3764 ) ( not ( = ?AUTO_3763 ?AUTO_3770 ) ) ( not ( = ?AUTO_3759 ?AUTO_3770 ) ) ( not ( = ?AUTO_3768 ?AUTO_3770 ) ) ( not ( = ?AUTO_3769 ?AUTO_3770 ) ) ( not ( = ?AUTO_3761 ?AUTO_3770 ) ) ( not ( = ?AUTO_3760 ?AUTO_3770 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3765 ?AUTO_3770 ?AUTO_3763 ?AUTO_3764 )
      ( DELIVER-PKG ?AUTO_3758 ?AUTO_3759 )
      ( DELIVER-PKG-VERIFY ?AUTO_3758 ?AUTO_3759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4408 - OBJ
      ?AUTO_4409 - LOCATION
    )
    :vars
    (
      ?AUTO_4415 - TRUCK
      ?AUTO_4416 - LOCATION
      ?AUTO_4413 - CITY
      ?AUTO_4412 - LOCATION
      ?AUTO_4417 - LOCATION
      ?AUTO_4414 - AIRPLANE
      ?AUTO_4411 - TRUCK
      ?AUTO_4418 - LOCATION
      ?AUTO_4410 - CITY
      ?AUTO_4419 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4415 ?AUTO_4416 ) ( IN-CITY ?AUTO_4416 ?AUTO_4413 ) ( IN-CITY ?AUTO_4409 ?AUTO_4413 ) ( not ( = ?AUTO_4409 ?AUTO_4416 ) ) ( AIRPORT ?AUTO_4412 ) ( AIRPORT ?AUTO_4416 ) ( not ( = ?AUTO_4412 ?AUTO_4416 ) ) ( not ( = ?AUTO_4409 ?AUTO_4412 ) ) ( AIRPORT ?AUTO_4417 ) ( AIRPLANE-AT ?AUTO_4414 ?AUTO_4417 ) ( not ( = ?AUTO_4417 ?AUTO_4412 ) ) ( not ( = ?AUTO_4409 ?AUTO_4417 ) ) ( not ( = ?AUTO_4416 ?AUTO_4417 ) ) ( not ( = ?AUTO_4415 ?AUTO_4411 ) ) ( IN-CITY ?AUTO_4418 ?AUTO_4410 ) ( IN-CITY ?AUTO_4412 ?AUTO_4410 ) ( not ( = ?AUTO_4412 ?AUTO_4418 ) ) ( not ( = ?AUTO_4409 ?AUTO_4418 ) ) ( not ( = ?AUTO_4416 ?AUTO_4418 ) ) ( not ( = ?AUTO_4413 ?AUTO_4410 ) ) ( not ( = ?AUTO_4417 ?AUTO_4418 ) ) ( OBJ-AT ?AUTO_4408 ?AUTO_4418 ) ( TRUCK-AT ?AUTO_4411 ?AUTO_4419 ) ( IN-CITY ?AUTO_4419 ?AUTO_4410 ) ( not ( = ?AUTO_4418 ?AUTO_4419 ) ) ( not ( = ?AUTO_4409 ?AUTO_4419 ) ) ( not ( = ?AUTO_4416 ?AUTO_4419 ) ) ( not ( = ?AUTO_4412 ?AUTO_4419 ) ) ( not ( = ?AUTO_4417 ?AUTO_4419 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4411 ?AUTO_4419 ?AUTO_4418 ?AUTO_4410 )
      ( DELIVER-PKG ?AUTO_4408 ?AUTO_4409 )
      ( DELIVER-PKG-VERIFY ?AUTO_4408 ?AUTO_4409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7316 - OBJ
      ?AUTO_7317 - LOCATION
    )
    :vars
    (
      ?AUTO_7319 - TRUCK
      ?AUTO_7321 - LOCATION
      ?AUTO_7320 - CITY
      ?AUTO_7318 - LOCATION
      ?AUTO_7322 - AIRPLANE
      ?AUTO_7323 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7319 ?AUTO_7321 ) ( IN-CITY ?AUTO_7321 ?AUTO_7320 ) ( IN-CITY ?AUTO_7317 ?AUTO_7320 ) ( not ( = ?AUTO_7317 ?AUTO_7321 ) ) ( AIRPORT ?AUTO_7318 ) ( AIRPORT ?AUTO_7321 ) ( not ( = ?AUTO_7318 ?AUTO_7321 ) ) ( not ( = ?AUTO_7317 ?AUTO_7318 ) ) ( AIRPLANE-AT ?AUTO_7322 ?AUTO_7321 ) ( TRUCK-AT ?AUTO_7323 ?AUTO_7318 ) ( IN-TRUCK ?AUTO_7316 ?AUTO_7323 ) ( not ( = ?AUTO_7319 ?AUTO_7323 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7316 ?AUTO_7323 ?AUTO_7318 )
      ( DELIVER-PKG ?AUTO_7316 ?AUTO_7317 )
      ( DELIVER-PKG-VERIFY ?AUTO_7316 ?AUTO_7317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7324 - OBJ
      ?AUTO_7325 - LOCATION
    )
    :vars
    (
      ?AUTO_7326 - TRUCK
      ?AUTO_7330 - LOCATION
      ?AUTO_7329 - CITY
      ?AUTO_7327 - LOCATION
      ?AUTO_7331 - AIRPLANE
      ?AUTO_7328 - TRUCK
      ?AUTO_7333 - LOCATION
      ?AUTO_7332 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7326 ?AUTO_7330 ) ( IN-CITY ?AUTO_7330 ?AUTO_7329 ) ( IN-CITY ?AUTO_7325 ?AUTO_7329 ) ( not ( = ?AUTO_7325 ?AUTO_7330 ) ) ( AIRPORT ?AUTO_7327 ) ( AIRPORT ?AUTO_7330 ) ( not ( = ?AUTO_7327 ?AUTO_7330 ) ) ( not ( = ?AUTO_7325 ?AUTO_7327 ) ) ( AIRPLANE-AT ?AUTO_7331 ?AUTO_7330 ) ( IN-TRUCK ?AUTO_7324 ?AUTO_7328 ) ( not ( = ?AUTO_7326 ?AUTO_7328 ) ) ( TRUCK-AT ?AUTO_7328 ?AUTO_7333 ) ( IN-CITY ?AUTO_7333 ?AUTO_7332 ) ( IN-CITY ?AUTO_7327 ?AUTO_7332 ) ( not ( = ?AUTO_7327 ?AUTO_7333 ) ) ( not ( = ?AUTO_7325 ?AUTO_7333 ) ) ( not ( = ?AUTO_7330 ?AUTO_7333 ) ) ( not ( = ?AUTO_7329 ?AUTO_7332 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7328 ?AUTO_7333 ?AUTO_7327 ?AUTO_7332 )
      ( DELIVER-PKG ?AUTO_7324 ?AUTO_7325 )
      ( DELIVER-PKG-VERIFY ?AUTO_7324 ?AUTO_7325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5274 - OBJ
      ?AUTO_5275 - LOCATION
    )
    :vars
    (
      ?AUTO_5281 - TRUCK
      ?AUTO_5277 - LOCATION
      ?AUTO_5276 - CITY
      ?AUTO_5283 - LOCATION
      ?AUTO_5284 - LOCATION
      ?AUTO_5279 - AIRPLANE
      ?AUTO_5280 - TRUCK
      ?AUTO_5278 - LOCATION
      ?AUTO_5282 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5281 ?AUTO_5277 ) ( IN-CITY ?AUTO_5277 ?AUTO_5276 ) ( IN-CITY ?AUTO_5275 ?AUTO_5276 ) ( not ( = ?AUTO_5275 ?AUTO_5277 ) ) ( AIRPORT ?AUTO_5283 ) ( AIRPORT ?AUTO_5277 ) ( not ( = ?AUTO_5283 ?AUTO_5277 ) ) ( not ( = ?AUTO_5275 ?AUTO_5283 ) ) ( AIRPORT ?AUTO_5284 ) ( not ( = ?AUTO_5284 ?AUTO_5283 ) ) ( not ( = ?AUTO_5275 ?AUTO_5284 ) ) ( not ( = ?AUTO_5277 ?AUTO_5284 ) ) ( AIRPLANE-AT ?AUTO_5279 ?AUTO_5277 ) ( not ( = ?AUTO_5281 ?AUTO_5280 ) ) ( TRUCK-AT ?AUTO_5280 ?AUTO_5278 ) ( IN-CITY ?AUTO_5278 ?AUTO_5282 ) ( IN-CITY ?AUTO_5283 ?AUTO_5282 ) ( not ( = ?AUTO_5283 ?AUTO_5278 ) ) ( not ( = ?AUTO_5275 ?AUTO_5278 ) ) ( not ( = ?AUTO_5277 ?AUTO_5278 ) ) ( not ( = ?AUTO_5276 ?AUTO_5282 ) ) ( not ( = ?AUTO_5284 ?AUTO_5278 ) ) ( OBJ-AT ?AUTO_5274 ?AUTO_5278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5274 ?AUTO_5280 ?AUTO_5278 )
      ( DELIVER-PKG ?AUTO_5274 ?AUTO_5275 )
      ( DELIVER-PKG-VERIFY ?AUTO_5274 ?AUTO_5275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5342 - OBJ
      ?AUTO_5343 - LOCATION
    )
    :vars
    (
      ?AUTO_5347 - LOCATION
      ?AUTO_5348 - AIRPLANE
      ?AUTO_5345 - LOCATION
      ?AUTO_5344 - CITY
      ?AUTO_5346 - TRUCK
      ?AUTO_5349 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5347 ) ( AIRPORT ?AUTO_5343 ) ( AIRPLANE-AT ?AUTO_5348 ?AUTO_5347 ) ( not ( = ?AUTO_5347 ?AUTO_5343 ) ) ( IN-CITY ?AUTO_5345 ?AUTO_5344 ) ( IN-CITY ?AUTO_5347 ?AUTO_5344 ) ( not ( = ?AUTO_5347 ?AUTO_5345 ) ) ( not ( = ?AUTO_5343 ?AUTO_5345 ) ) ( OBJ-AT ?AUTO_5342 ?AUTO_5345 ) ( TRUCK-AT ?AUTO_5346 ?AUTO_5349 ) ( IN-CITY ?AUTO_5349 ?AUTO_5344 ) ( not ( = ?AUTO_5345 ?AUTO_5349 ) ) ( not ( = ?AUTO_5343 ?AUTO_5349 ) ) ( not ( = ?AUTO_5347 ?AUTO_5349 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5346 ?AUTO_5349 ?AUTO_5345 ?AUTO_5344 )
      ( DELIVER-PKG ?AUTO_5342 ?AUTO_5343 )
      ( DELIVER-PKG-VERIFY ?AUTO_5342 ?AUTO_5343 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5774 - OBJ
      ?AUTO_5775 - LOCATION
    )
    :vars
    (
      ?AUTO_5776 - LOCATION
      ?AUTO_5778 - TRUCK
      ?AUTO_5780 - LOCATION
      ?AUTO_5779 - CITY
      ?AUTO_5777 - LOCATION
      ?AUTO_5781 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5776 ) ( AIRPORT ?AUTO_5775 ) ( not ( = ?AUTO_5776 ?AUTO_5775 ) ) ( IN-TRUCK ?AUTO_5774 ?AUTO_5778 ) ( TRUCK-AT ?AUTO_5778 ?AUTO_5780 ) ( IN-CITY ?AUTO_5780 ?AUTO_5779 ) ( IN-CITY ?AUTO_5776 ?AUTO_5779 ) ( not ( = ?AUTO_5776 ?AUTO_5780 ) ) ( not ( = ?AUTO_5775 ?AUTO_5780 ) ) ( AIRPORT ?AUTO_5777 ) ( not ( = ?AUTO_5777 ?AUTO_5776 ) ) ( not ( = ?AUTO_5775 ?AUTO_5777 ) ) ( not ( = ?AUTO_5780 ?AUTO_5777 ) ) ( AIRPLANE-AT ?AUTO_5781 ?AUTO_5775 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5781 ?AUTO_5775 ?AUTO_5777 )
      ( DELIVER-PKG ?AUTO_5774 ?AUTO_5775 )
      ( DELIVER-PKG-VERIFY ?AUTO_5774 ?AUTO_5775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5965 - OBJ
      ?AUTO_5966 - LOCATION
    )
    :vars
    (
      ?AUTO_5970 - TRUCK
      ?AUTO_5968 - LOCATION
      ?AUTO_5967 - CITY
      ?AUTO_5969 - LOCATION
      ?AUTO_5971 - AIRPLANE
      ?AUTO_5972 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5970 ?AUTO_5968 ) ( IN-CITY ?AUTO_5968 ?AUTO_5967 ) ( IN-CITY ?AUTO_5966 ?AUTO_5967 ) ( not ( = ?AUTO_5966 ?AUTO_5968 ) ) ( AIRPORT ?AUTO_5969 ) ( AIRPORT ?AUTO_5968 ) ( AIRPLANE-AT ?AUTO_5971 ?AUTO_5969 ) ( not ( = ?AUTO_5969 ?AUTO_5968 ) ) ( not ( = ?AUTO_5966 ?AUTO_5969 ) ) ( TRUCK-AT ?AUTO_5972 ?AUTO_5969 ) ( IN-TRUCK ?AUTO_5965 ?AUTO_5972 ) ( not ( = ?AUTO_5970 ?AUTO_5972 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5965 ?AUTO_5972 ?AUTO_5969 )
      ( DELIVER-PKG ?AUTO_5965 ?AUTO_5966 )
      ( DELIVER-PKG-VERIFY ?AUTO_5965 ?AUTO_5966 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5973 - OBJ
      ?AUTO_5974 - LOCATION
    )
    :vars
    (
      ?AUTO_5975 - TRUCK
      ?AUTO_5978 - LOCATION
      ?AUTO_5979 - CITY
      ?AUTO_5980 - LOCATION
      ?AUTO_5976 - AIRPLANE
      ?AUTO_5977 - TRUCK
      ?AUTO_5982 - LOCATION
      ?AUTO_5981 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5975 ?AUTO_5978 ) ( IN-CITY ?AUTO_5978 ?AUTO_5979 ) ( IN-CITY ?AUTO_5974 ?AUTO_5979 ) ( not ( = ?AUTO_5974 ?AUTO_5978 ) ) ( AIRPORT ?AUTO_5980 ) ( AIRPORT ?AUTO_5978 ) ( AIRPLANE-AT ?AUTO_5976 ?AUTO_5980 ) ( not ( = ?AUTO_5980 ?AUTO_5978 ) ) ( not ( = ?AUTO_5974 ?AUTO_5980 ) ) ( IN-TRUCK ?AUTO_5973 ?AUTO_5977 ) ( not ( = ?AUTO_5975 ?AUTO_5977 ) ) ( TRUCK-AT ?AUTO_5977 ?AUTO_5982 ) ( IN-CITY ?AUTO_5982 ?AUTO_5981 ) ( IN-CITY ?AUTO_5980 ?AUTO_5981 ) ( not ( = ?AUTO_5980 ?AUTO_5982 ) ) ( not ( = ?AUTO_5974 ?AUTO_5982 ) ) ( not ( = ?AUTO_5978 ?AUTO_5982 ) ) ( not ( = ?AUTO_5979 ?AUTO_5981 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5977 ?AUTO_5982 ?AUTO_5980 ?AUTO_5981 )
      ( DELIVER-PKG ?AUTO_5973 ?AUTO_5974 )
      ( DELIVER-PKG-VERIFY ?AUTO_5973 ?AUTO_5974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5987 - OBJ
      ?AUTO_5988 - LOCATION
    )
    :vars
    (
      ?AUTO_5990 - TRUCK
      ?AUTO_5996 - LOCATION
      ?AUTO_5991 - CITY
      ?AUTO_5995 - LOCATION
      ?AUTO_5992 - TRUCK
      ?AUTO_5993 - LOCATION
      ?AUTO_5994 - CITY
      ?AUTO_5997 - LOCATION
      ?AUTO_5989 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5990 ?AUTO_5996 ) ( IN-CITY ?AUTO_5996 ?AUTO_5991 ) ( IN-CITY ?AUTO_5988 ?AUTO_5991 ) ( not ( = ?AUTO_5988 ?AUTO_5996 ) ) ( AIRPORT ?AUTO_5995 ) ( AIRPORT ?AUTO_5996 ) ( not ( = ?AUTO_5995 ?AUTO_5996 ) ) ( not ( = ?AUTO_5988 ?AUTO_5995 ) ) ( IN-TRUCK ?AUTO_5987 ?AUTO_5992 ) ( not ( = ?AUTO_5990 ?AUTO_5992 ) ) ( TRUCK-AT ?AUTO_5992 ?AUTO_5993 ) ( IN-CITY ?AUTO_5993 ?AUTO_5994 ) ( IN-CITY ?AUTO_5995 ?AUTO_5994 ) ( not ( = ?AUTO_5995 ?AUTO_5993 ) ) ( not ( = ?AUTO_5988 ?AUTO_5993 ) ) ( not ( = ?AUTO_5996 ?AUTO_5993 ) ) ( not ( = ?AUTO_5991 ?AUTO_5994 ) ) ( AIRPORT ?AUTO_5997 ) ( AIRPLANE-AT ?AUTO_5989 ?AUTO_5997 ) ( not ( = ?AUTO_5997 ?AUTO_5995 ) ) ( not ( = ?AUTO_5988 ?AUTO_5997 ) ) ( not ( = ?AUTO_5996 ?AUTO_5997 ) ) ( not ( = ?AUTO_5993 ?AUTO_5997 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5989 ?AUTO_5997 ?AUTO_5995 )
      ( DELIVER-PKG ?AUTO_5987 ?AUTO_5988 )
      ( DELIVER-PKG-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6010 - OBJ
      ?AUTO_6011 - LOCATION
    )
    :vars
    (
      ?AUTO_6012 - TRUCK
      ?AUTO_6019 - LOCATION
      ?AUTO_6017 - CITY
      ?AUTO_6020 - LOCATION
      ?AUTO_6014 - TRUCK
      ?AUTO_6016 - LOCATION
      ?AUTO_6013 - CITY
      ?AUTO_6015 - LOCATION
      ?AUTO_6018 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6012 ?AUTO_6019 ) ( IN-CITY ?AUTO_6019 ?AUTO_6017 ) ( IN-CITY ?AUTO_6011 ?AUTO_6017 ) ( not ( = ?AUTO_6011 ?AUTO_6019 ) ) ( AIRPORT ?AUTO_6020 ) ( AIRPORT ?AUTO_6019 ) ( not ( = ?AUTO_6020 ?AUTO_6019 ) ) ( not ( = ?AUTO_6011 ?AUTO_6020 ) ) ( IN-TRUCK ?AUTO_6010 ?AUTO_6014 ) ( not ( = ?AUTO_6012 ?AUTO_6014 ) ) ( TRUCK-AT ?AUTO_6014 ?AUTO_6016 ) ( IN-CITY ?AUTO_6016 ?AUTO_6013 ) ( IN-CITY ?AUTO_6020 ?AUTO_6013 ) ( not ( = ?AUTO_6020 ?AUTO_6016 ) ) ( not ( = ?AUTO_6011 ?AUTO_6016 ) ) ( not ( = ?AUTO_6019 ?AUTO_6016 ) ) ( not ( = ?AUTO_6017 ?AUTO_6013 ) ) ( AIRPORT ?AUTO_6015 ) ( not ( = ?AUTO_6015 ?AUTO_6020 ) ) ( not ( = ?AUTO_6011 ?AUTO_6015 ) ) ( not ( = ?AUTO_6019 ?AUTO_6015 ) ) ( not ( = ?AUTO_6016 ?AUTO_6015 ) ) ( AIRPLANE-AT ?AUTO_6018 ?AUTO_6019 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6018 ?AUTO_6019 ?AUTO_6015 )
      ( DELIVER-PKG ?AUTO_6010 ?AUTO_6011 )
      ( DELIVER-PKG-VERIFY ?AUTO_6010 ?AUTO_6011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7336 - OBJ
      ?AUTO_7337 - LOCATION
    )
    :vars
    (
      ?AUTO_7338 - LOCATION
      ?AUTO_7341 - CITY
      ?AUTO_7345 - LOCATION
      ?AUTO_7343 - AIRPLANE
      ?AUTO_7342 - TRUCK
      ?AUTO_7344 - TRUCK
      ?AUTO_7339 - LOCATION
      ?AUTO_7340 - CITY
      ?AUTO_7346 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7338 ?AUTO_7341 ) ( IN-CITY ?AUTO_7337 ?AUTO_7341 ) ( not ( = ?AUTO_7337 ?AUTO_7338 ) ) ( AIRPORT ?AUTO_7345 ) ( AIRPORT ?AUTO_7338 ) ( not ( = ?AUTO_7345 ?AUTO_7338 ) ) ( not ( = ?AUTO_7337 ?AUTO_7345 ) ) ( AIRPLANE-AT ?AUTO_7343 ?AUTO_7338 ) ( IN-TRUCK ?AUTO_7336 ?AUTO_7342 ) ( not ( = ?AUTO_7344 ?AUTO_7342 ) ) ( TRUCK-AT ?AUTO_7342 ?AUTO_7339 ) ( IN-CITY ?AUTO_7339 ?AUTO_7340 ) ( IN-CITY ?AUTO_7345 ?AUTO_7340 ) ( not ( = ?AUTO_7345 ?AUTO_7339 ) ) ( not ( = ?AUTO_7337 ?AUTO_7339 ) ) ( not ( = ?AUTO_7338 ?AUTO_7339 ) ) ( not ( = ?AUTO_7341 ?AUTO_7340 ) ) ( TRUCK-AT ?AUTO_7344 ?AUTO_7346 ) ( IN-CITY ?AUTO_7346 ?AUTO_7341 ) ( not ( = ?AUTO_7338 ?AUTO_7346 ) ) ( not ( = ?AUTO_7337 ?AUTO_7346 ) ) ( not ( = ?AUTO_7345 ?AUTO_7346 ) ) ( not ( = ?AUTO_7339 ?AUTO_7346 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7344 ?AUTO_7346 ?AUTO_7338 ?AUTO_7341 )
      ( DELIVER-PKG ?AUTO_7336 ?AUTO_7337 )
      ( DELIVER-PKG-VERIFY ?AUTO_7336 ?AUTO_7337 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6043 - OBJ
      ?AUTO_6044 - LOCATION
    )
    :vars
    (
      ?AUTO_6045 - LOCATION
      ?AUTO_6051 - CITY
      ?AUTO_6050 - LOCATION
      ?AUTO_6054 - TRUCK
      ?AUTO_6049 - TRUCK
      ?AUTO_6048 - LOCATION
      ?AUTO_6047 - CITY
      ?AUTO_6046 - LOCATION
      ?AUTO_6053 - AIRPLANE
      ?AUTO_6052 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6045 ?AUTO_6051 ) ( IN-CITY ?AUTO_6044 ?AUTO_6051 ) ( not ( = ?AUTO_6044 ?AUTO_6045 ) ) ( AIRPORT ?AUTO_6050 ) ( AIRPORT ?AUTO_6045 ) ( not ( = ?AUTO_6050 ?AUTO_6045 ) ) ( not ( = ?AUTO_6044 ?AUTO_6050 ) ) ( IN-TRUCK ?AUTO_6043 ?AUTO_6054 ) ( not ( = ?AUTO_6049 ?AUTO_6054 ) ) ( TRUCK-AT ?AUTO_6054 ?AUTO_6048 ) ( IN-CITY ?AUTO_6048 ?AUTO_6047 ) ( IN-CITY ?AUTO_6050 ?AUTO_6047 ) ( not ( = ?AUTO_6050 ?AUTO_6048 ) ) ( not ( = ?AUTO_6044 ?AUTO_6048 ) ) ( not ( = ?AUTO_6045 ?AUTO_6048 ) ) ( not ( = ?AUTO_6051 ?AUTO_6047 ) ) ( AIRPORT ?AUTO_6046 ) ( not ( = ?AUTO_6046 ?AUTO_6050 ) ) ( not ( = ?AUTO_6044 ?AUTO_6046 ) ) ( not ( = ?AUTO_6045 ?AUTO_6046 ) ) ( not ( = ?AUTO_6048 ?AUTO_6046 ) ) ( AIRPLANE-AT ?AUTO_6053 ?AUTO_6045 ) ( IN-CITY ?AUTO_6052 ?AUTO_6051 ) ( not ( = ?AUTO_6045 ?AUTO_6052 ) ) ( not ( = ?AUTO_6044 ?AUTO_6052 ) ) ( not ( = ?AUTO_6050 ?AUTO_6052 ) ) ( not ( = ?AUTO_6048 ?AUTO_6052 ) ) ( not ( = ?AUTO_6046 ?AUTO_6052 ) ) ( TRUCK-AT ?AUTO_6049 ?AUTO_6044 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6049 ?AUTO_6044 ?AUTO_6052 ?AUTO_6051 )
      ( DELIVER-PKG ?AUTO_6043 ?AUTO_6044 )
      ( DELIVER-PKG-VERIFY ?AUTO_6043 ?AUTO_6044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6069 - OBJ
      ?AUTO_6070 - LOCATION
    )
    :vars
    (
      ?AUTO_6078 - LOCATION
      ?AUTO_6079 - CITY
      ?AUTO_6074 - LOCATION
      ?AUTO_6075 - TRUCK
      ?AUTO_6076 - TRUCK
      ?AUTO_6073 - LOCATION
      ?AUTO_6077 - CITY
      ?AUTO_6071 - LOCATION
      ?AUTO_6080 - AIRPLANE
      ?AUTO_6072 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6078 ?AUTO_6079 ) ( IN-CITY ?AUTO_6070 ?AUTO_6079 ) ( not ( = ?AUTO_6070 ?AUTO_6078 ) ) ( AIRPORT ?AUTO_6074 ) ( AIRPORT ?AUTO_6078 ) ( not ( = ?AUTO_6074 ?AUTO_6078 ) ) ( not ( = ?AUTO_6070 ?AUTO_6074 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( TRUCK-AT ?AUTO_6076 ?AUTO_6073 ) ( IN-CITY ?AUTO_6073 ?AUTO_6077 ) ( IN-CITY ?AUTO_6074 ?AUTO_6077 ) ( not ( = ?AUTO_6074 ?AUTO_6073 ) ) ( not ( = ?AUTO_6070 ?AUTO_6073 ) ) ( not ( = ?AUTO_6078 ?AUTO_6073 ) ) ( not ( = ?AUTO_6079 ?AUTO_6077 ) ) ( AIRPORT ?AUTO_6071 ) ( not ( = ?AUTO_6071 ?AUTO_6074 ) ) ( not ( = ?AUTO_6070 ?AUTO_6071 ) ) ( not ( = ?AUTO_6078 ?AUTO_6071 ) ) ( not ( = ?AUTO_6073 ?AUTO_6071 ) ) ( AIRPLANE-AT ?AUTO_6080 ?AUTO_6078 ) ( IN-CITY ?AUTO_6072 ?AUTO_6079 ) ( not ( = ?AUTO_6078 ?AUTO_6072 ) ) ( not ( = ?AUTO_6070 ?AUTO_6072 ) ) ( not ( = ?AUTO_6074 ?AUTO_6072 ) ) ( not ( = ?AUTO_6073 ?AUTO_6072 ) ) ( not ( = ?AUTO_6071 ?AUTO_6072 ) ) ( TRUCK-AT ?AUTO_6075 ?AUTO_6070 ) ( OBJ-AT ?AUTO_6069 ?AUTO_6073 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6069 ?AUTO_6076 ?AUTO_6073 )
      ( DELIVER-PKG ?AUTO_6069 ?AUTO_6070 )
      ( DELIVER-PKG-VERIFY ?AUTO_6069 ?AUTO_6070 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6180 - OBJ
      ?AUTO_6181 - LOCATION
    )
    :vars
    (
      ?AUTO_6189 - LOCATION
      ?AUTO_6182 - CITY
      ?AUTO_6183 - LOCATION
      ?AUTO_6186 - TRUCK
      ?AUTO_6190 - TRUCK
      ?AUTO_6185 - LOCATION
      ?AUTO_6184 - CITY
      ?AUTO_6191 - LOCATION
      ?AUTO_6188 - AIRPLANE
      ?AUTO_6187 - LOCATION
      ?AUTO_6192 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6189 ?AUTO_6182 ) ( IN-CITY ?AUTO_6181 ?AUTO_6182 ) ( not ( = ?AUTO_6181 ?AUTO_6189 ) ) ( AIRPORT ?AUTO_6183 ) ( AIRPORT ?AUTO_6189 ) ( not ( = ?AUTO_6183 ?AUTO_6189 ) ) ( not ( = ?AUTO_6181 ?AUTO_6183 ) ) ( not ( = ?AUTO_6186 ?AUTO_6190 ) ) ( IN-CITY ?AUTO_6185 ?AUTO_6184 ) ( IN-CITY ?AUTO_6183 ?AUTO_6184 ) ( not ( = ?AUTO_6183 ?AUTO_6185 ) ) ( not ( = ?AUTO_6181 ?AUTO_6185 ) ) ( not ( = ?AUTO_6189 ?AUTO_6185 ) ) ( not ( = ?AUTO_6182 ?AUTO_6184 ) ) ( AIRPORT ?AUTO_6191 ) ( not ( = ?AUTO_6191 ?AUTO_6183 ) ) ( not ( = ?AUTO_6181 ?AUTO_6191 ) ) ( not ( = ?AUTO_6189 ?AUTO_6191 ) ) ( not ( = ?AUTO_6185 ?AUTO_6191 ) ) ( AIRPLANE-AT ?AUTO_6188 ?AUTO_6189 ) ( IN-CITY ?AUTO_6187 ?AUTO_6182 ) ( not ( = ?AUTO_6189 ?AUTO_6187 ) ) ( not ( = ?AUTO_6181 ?AUTO_6187 ) ) ( not ( = ?AUTO_6183 ?AUTO_6187 ) ) ( not ( = ?AUTO_6185 ?AUTO_6187 ) ) ( not ( = ?AUTO_6191 ?AUTO_6187 ) ) ( TRUCK-AT ?AUTO_6186 ?AUTO_6181 ) ( OBJ-AT ?AUTO_6180 ?AUTO_6185 ) ( TRUCK-AT ?AUTO_6190 ?AUTO_6192 ) ( IN-CITY ?AUTO_6192 ?AUTO_6184 ) ( not ( = ?AUTO_6185 ?AUTO_6192 ) ) ( not ( = ?AUTO_6181 ?AUTO_6192 ) ) ( not ( = ?AUTO_6189 ?AUTO_6192 ) ) ( not ( = ?AUTO_6183 ?AUTO_6192 ) ) ( not ( = ?AUTO_6191 ?AUTO_6192 ) ) ( not ( = ?AUTO_6187 ?AUTO_6192 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6190 ?AUTO_6192 ?AUTO_6185 ?AUTO_6184 )
      ( DELIVER-PKG ?AUTO_6180 ?AUTO_6181 )
      ( DELIVER-PKG-VERIFY ?AUTO_6180 ?AUTO_6181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6361 - OBJ
      ?AUTO_6362 - LOCATION
    )
    :vars
    (
      ?AUTO_6367 - LOCATION
      ?AUTO_6363 - AIRPLANE
      ?AUTO_6365 - LOCATION
      ?AUTO_6366 - CITY
      ?AUTO_6364 - TRUCK
      ?AUTO_6368 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6367 ) ( AIRPORT ?AUTO_6362 ) ( not ( = ?AUTO_6367 ?AUTO_6362 ) ) ( AIRPLANE-AT ?AUTO_6363 ?AUTO_6362 ) ( IN-CITY ?AUTO_6365 ?AUTO_6366 ) ( IN-CITY ?AUTO_6367 ?AUTO_6366 ) ( not ( = ?AUTO_6367 ?AUTO_6365 ) ) ( not ( = ?AUTO_6362 ?AUTO_6365 ) ) ( OBJ-AT ?AUTO_6361 ?AUTO_6365 ) ( TRUCK-AT ?AUTO_6364 ?AUTO_6368 ) ( IN-CITY ?AUTO_6368 ?AUTO_6366 ) ( not ( = ?AUTO_6365 ?AUTO_6368 ) ) ( not ( = ?AUTO_6362 ?AUTO_6368 ) ) ( not ( = ?AUTO_6367 ?AUTO_6368 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6364 ?AUTO_6368 ?AUTO_6365 ?AUTO_6366 )
      ( DELIVER-PKG ?AUTO_6361 ?AUTO_6362 )
      ( DELIVER-PKG-VERIFY ?AUTO_6361 ?AUTO_6362 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6681 - OBJ
      ?AUTO_6682 - LOCATION
    )
    :vars
    (
      ?AUTO_6686 - LOCATION
      ?AUTO_6683 - CITY
      ?AUTO_6687 - TRUCK
      ?AUTO_6685 - LOCATION
      ?AUTO_6684 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6686 ?AUTO_6683 ) ( IN-CITY ?AUTO_6682 ?AUTO_6683 ) ( not ( = ?AUTO_6682 ?AUTO_6686 ) ) ( TRUCK-AT ?AUTO_6687 ?AUTO_6682 ) ( AIRPORT ?AUTO_6685 ) ( AIRPORT ?AUTO_6686 ) ( not ( = ?AUTO_6685 ?AUTO_6686 ) ) ( not ( = ?AUTO_6682 ?AUTO_6685 ) ) ( OBJ-AT ?AUTO_6681 ?AUTO_6685 ) ( AIRPLANE-AT ?AUTO_6684 ?AUTO_6686 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6684 ?AUTO_6686 ?AUTO_6685 )
      ( DELIVER-PKG ?AUTO_6681 ?AUTO_6682 )
      ( DELIVER-PKG-VERIFY ?AUTO_6681 ?AUTO_6682 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6702 - OBJ
      ?AUTO_6703 - LOCATION
    )
    :vars
    (
      ?AUTO_6708 - LOCATION
      ?AUTO_6707 - CITY
      ?AUTO_6706 - LOCATION
      ?AUTO_6704 - AIRPLANE
      ?AUTO_6705 - TRUCK
      ?AUTO_6709 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6708 ?AUTO_6707 ) ( IN-CITY ?AUTO_6703 ?AUTO_6707 ) ( not ( = ?AUTO_6703 ?AUTO_6708 ) ) ( AIRPORT ?AUTO_6706 ) ( AIRPORT ?AUTO_6708 ) ( not ( = ?AUTO_6706 ?AUTO_6708 ) ) ( not ( = ?AUTO_6703 ?AUTO_6706 ) ) ( OBJ-AT ?AUTO_6702 ?AUTO_6706 ) ( AIRPLANE-AT ?AUTO_6704 ?AUTO_6708 ) ( TRUCK-AT ?AUTO_6705 ?AUTO_6709 ) ( IN-CITY ?AUTO_6709 ?AUTO_6707 ) ( not ( = ?AUTO_6703 ?AUTO_6709 ) ) ( not ( = ?AUTO_6708 ?AUTO_6709 ) ) ( not ( = ?AUTO_6706 ?AUTO_6709 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6705 ?AUTO_6709 ?AUTO_6703 ?AUTO_6707 )
      ( DELIVER-PKG ?AUTO_6702 ?AUTO_6703 )
      ( DELIVER-PKG-VERIFY ?AUTO_6702 ?AUTO_6703 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6720 - OBJ
      ?AUTO_6721 - LOCATION
    )
    :vars
    (
      ?AUTO_6727 - LOCATION
      ?AUTO_6722 - CITY
      ?AUTO_6726 - LOCATION
      ?AUTO_6725 - AIRPLANE
      ?AUTO_6724 - TRUCK
      ?AUTO_6723 - LOCATION
      ?AUTO_6728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6727 ?AUTO_6722 ) ( IN-CITY ?AUTO_6721 ?AUTO_6722 ) ( not ( = ?AUTO_6721 ?AUTO_6727 ) ) ( AIRPORT ?AUTO_6726 ) ( AIRPORT ?AUTO_6727 ) ( not ( = ?AUTO_6726 ?AUTO_6727 ) ) ( not ( = ?AUTO_6721 ?AUTO_6726 ) ) ( AIRPLANE-AT ?AUTO_6725 ?AUTO_6727 ) ( TRUCK-AT ?AUTO_6724 ?AUTO_6723 ) ( IN-CITY ?AUTO_6723 ?AUTO_6722 ) ( not ( = ?AUTO_6721 ?AUTO_6723 ) ) ( not ( = ?AUTO_6727 ?AUTO_6723 ) ) ( not ( = ?AUTO_6726 ?AUTO_6723 ) ) ( TRUCK-AT ?AUTO_6728 ?AUTO_6726 ) ( IN-TRUCK ?AUTO_6720 ?AUTO_6728 ) ( not ( = ?AUTO_6724 ?AUTO_6728 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6720 ?AUTO_6728 ?AUTO_6726 )
      ( DELIVER-PKG ?AUTO_6720 ?AUTO_6721 )
      ( DELIVER-PKG-VERIFY ?AUTO_6720 ?AUTO_6721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6729 - OBJ
      ?AUTO_6730 - LOCATION
    )
    :vars
    (
      ?AUTO_6736 - LOCATION
      ?AUTO_6732 - CITY
      ?AUTO_6735 - LOCATION
      ?AUTO_6734 - AIRPLANE
      ?AUTO_6733 - TRUCK
      ?AUTO_6731 - LOCATION
      ?AUTO_6737 - TRUCK
      ?AUTO_6739 - LOCATION
      ?AUTO_6738 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6736 ?AUTO_6732 ) ( IN-CITY ?AUTO_6730 ?AUTO_6732 ) ( not ( = ?AUTO_6730 ?AUTO_6736 ) ) ( AIRPORT ?AUTO_6735 ) ( AIRPORT ?AUTO_6736 ) ( not ( = ?AUTO_6735 ?AUTO_6736 ) ) ( not ( = ?AUTO_6730 ?AUTO_6735 ) ) ( AIRPLANE-AT ?AUTO_6734 ?AUTO_6736 ) ( TRUCK-AT ?AUTO_6733 ?AUTO_6731 ) ( IN-CITY ?AUTO_6731 ?AUTO_6732 ) ( not ( = ?AUTO_6730 ?AUTO_6731 ) ) ( not ( = ?AUTO_6736 ?AUTO_6731 ) ) ( not ( = ?AUTO_6735 ?AUTO_6731 ) ) ( IN-TRUCK ?AUTO_6729 ?AUTO_6737 ) ( not ( = ?AUTO_6733 ?AUTO_6737 ) ) ( TRUCK-AT ?AUTO_6737 ?AUTO_6739 ) ( IN-CITY ?AUTO_6739 ?AUTO_6738 ) ( IN-CITY ?AUTO_6735 ?AUTO_6738 ) ( not ( = ?AUTO_6735 ?AUTO_6739 ) ) ( not ( = ?AUTO_6730 ?AUTO_6739 ) ) ( not ( = ?AUTO_6736 ?AUTO_6739 ) ) ( not ( = ?AUTO_6732 ?AUTO_6738 ) ) ( not ( = ?AUTO_6731 ?AUTO_6739 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6737 ?AUTO_6739 ?AUTO_6735 ?AUTO_6738 )
      ( DELIVER-PKG ?AUTO_6729 ?AUTO_6730 )
      ( DELIVER-PKG-VERIFY ?AUTO_6729 ?AUTO_6730 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6740 - OBJ
      ?AUTO_6741 - LOCATION
    )
    :vars
    (
      ?AUTO_6749 - LOCATION
      ?AUTO_6742 - CITY
      ?AUTO_6744 - LOCATION
      ?AUTO_6748 - AIRPLANE
      ?AUTO_6750 - TRUCK
      ?AUTO_6743 - LOCATION
      ?AUTO_6747 - TRUCK
      ?AUTO_6745 - LOCATION
      ?AUTO_6746 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6749 ?AUTO_6742 ) ( IN-CITY ?AUTO_6741 ?AUTO_6742 ) ( not ( = ?AUTO_6741 ?AUTO_6749 ) ) ( AIRPORT ?AUTO_6744 ) ( AIRPORT ?AUTO_6749 ) ( not ( = ?AUTO_6744 ?AUTO_6749 ) ) ( not ( = ?AUTO_6741 ?AUTO_6744 ) ) ( AIRPLANE-AT ?AUTO_6748 ?AUTO_6749 ) ( TRUCK-AT ?AUTO_6750 ?AUTO_6743 ) ( IN-CITY ?AUTO_6743 ?AUTO_6742 ) ( not ( = ?AUTO_6741 ?AUTO_6743 ) ) ( not ( = ?AUTO_6749 ?AUTO_6743 ) ) ( not ( = ?AUTO_6744 ?AUTO_6743 ) ) ( not ( = ?AUTO_6750 ?AUTO_6747 ) ) ( TRUCK-AT ?AUTO_6747 ?AUTO_6745 ) ( IN-CITY ?AUTO_6745 ?AUTO_6746 ) ( IN-CITY ?AUTO_6744 ?AUTO_6746 ) ( not ( = ?AUTO_6744 ?AUTO_6745 ) ) ( not ( = ?AUTO_6741 ?AUTO_6745 ) ) ( not ( = ?AUTO_6749 ?AUTO_6745 ) ) ( not ( = ?AUTO_6742 ?AUTO_6746 ) ) ( not ( = ?AUTO_6743 ?AUTO_6745 ) ) ( OBJ-AT ?AUTO_6740 ?AUTO_6745 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6740 ?AUTO_6747 ?AUTO_6745 )
      ( DELIVER-PKG ?AUTO_6740 ?AUTO_6741 )
      ( DELIVER-PKG-VERIFY ?AUTO_6740 ?AUTO_6741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6751 - OBJ
      ?AUTO_6752 - LOCATION
    )
    :vars
    (
      ?AUTO_6756 - LOCATION
      ?AUTO_6758 - CITY
      ?AUTO_6755 - LOCATION
      ?AUTO_6761 - AIRPLANE
      ?AUTO_6760 - TRUCK
      ?AUTO_6753 - LOCATION
      ?AUTO_6759 - TRUCK
      ?AUTO_6754 - LOCATION
      ?AUTO_6757 - CITY
      ?AUTO_6762 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6756 ?AUTO_6758 ) ( IN-CITY ?AUTO_6752 ?AUTO_6758 ) ( not ( = ?AUTO_6752 ?AUTO_6756 ) ) ( AIRPORT ?AUTO_6755 ) ( AIRPORT ?AUTO_6756 ) ( not ( = ?AUTO_6755 ?AUTO_6756 ) ) ( not ( = ?AUTO_6752 ?AUTO_6755 ) ) ( AIRPLANE-AT ?AUTO_6761 ?AUTO_6756 ) ( TRUCK-AT ?AUTO_6760 ?AUTO_6753 ) ( IN-CITY ?AUTO_6753 ?AUTO_6758 ) ( not ( = ?AUTO_6752 ?AUTO_6753 ) ) ( not ( = ?AUTO_6756 ?AUTO_6753 ) ) ( not ( = ?AUTO_6755 ?AUTO_6753 ) ) ( not ( = ?AUTO_6760 ?AUTO_6759 ) ) ( IN-CITY ?AUTO_6754 ?AUTO_6757 ) ( IN-CITY ?AUTO_6755 ?AUTO_6757 ) ( not ( = ?AUTO_6755 ?AUTO_6754 ) ) ( not ( = ?AUTO_6752 ?AUTO_6754 ) ) ( not ( = ?AUTO_6756 ?AUTO_6754 ) ) ( not ( = ?AUTO_6758 ?AUTO_6757 ) ) ( not ( = ?AUTO_6753 ?AUTO_6754 ) ) ( OBJ-AT ?AUTO_6751 ?AUTO_6754 ) ( TRUCK-AT ?AUTO_6759 ?AUTO_6762 ) ( IN-CITY ?AUTO_6762 ?AUTO_6757 ) ( not ( = ?AUTO_6754 ?AUTO_6762 ) ) ( not ( = ?AUTO_6752 ?AUTO_6762 ) ) ( not ( = ?AUTO_6756 ?AUTO_6762 ) ) ( not ( = ?AUTO_6755 ?AUTO_6762 ) ) ( not ( = ?AUTO_6753 ?AUTO_6762 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6759 ?AUTO_6762 ?AUTO_6754 ?AUTO_6757 )
      ( DELIVER-PKG ?AUTO_6751 ?AUTO_6752 )
      ( DELIVER-PKG-VERIFY ?AUTO_6751 ?AUTO_6752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6808 - OBJ
      ?AUTO_6809 - LOCATION
    )
    :vars
    (
      ?AUTO_6810 - LOCATION
      ?AUTO_6812 - TRUCK
      ?AUTO_6813 - LOCATION
      ?AUTO_6814 - CITY
      ?AUTO_6811 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6810 ) ( AIRPORT ?AUTO_6809 ) ( not ( = ?AUTO_6810 ?AUTO_6809 ) ) ( IN-TRUCK ?AUTO_6808 ?AUTO_6812 ) ( TRUCK-AT ?AUTO_6812 ?AUTO_6813 ) ( IN-CITY ?AUTO_6813 ?AUTO_6814 ) ( IN-CITY ?AUTO_6810 ?AUTO_6814 ) ( not ( = ?AUTO_6810 ?AUTO_6813 ) ) ( not ( = ?AUTO_6809 ?AUTO_6813 ) ) ( AIRPLANE-AT ?AUTO_6811 ?AUTO_6810 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6811 ?AUTO_6810 ?AUTO_6809 )
      ( DELIVER-PKG ?AUTO_6808 ?AUTO_6809 )
      ( DELIVER-PKG-VERIFY ?AUTO_6808 ?AUTO_6809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7347 - OBJ
      ?AUTO_7348 - LOCATION
    )
    :vars
    (
      ?AUTO_7351 - LOCATION
      ?AUTO_7350 - CITY
      ?AUTO_7355 - LOCATION
      ?AUTO_7352 - TRUCK
      ?AUTO_7353 - TRUCK
      ?AUTO_7356 - LOCATION
      ?AUTO_7354 - CITY
      ?AUTO_7357 - LOCATION
      ?AUTO_7349 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7351 ?AUTO_7350 ) ( IN-CITY ?AUTO_7348 ?AUTO_7350 ) ( not ( = ?AUTO_7348 ?AUTO_7351 ) ) ( AIRPORT ?AUTO_7355 ) ( AIRPORT ?AUTO_7351 ) ( not ( = ?AUTO_7355 ?AUTO_7351 ) ) ( not ( = ?AUTO_7348 ?AUTO_7355 ) ) ( IN-TRUCK ?AUTO_7347 ?AUTO_7352 ) ( not ( = ?AUTO_7353 ?AUTO_7352 ) ) ( TRUCK-AT ?AUTO_7352 ?AUTO_7356 ) ( IN-CITY ?AUTO_7356 ?AUTO_7354 ) ( IN-CITY ?AUTO_7355 ?AUTO_7354 ) ( not ( = ?AUTO_7355 ?AUTO_7356 ) ) ( not ( = ?AUTO_7348 ?AUTO_7356 ) ) ( not ( = ?AUTO_7351 ?AUTO_7356 ) ) ( not ( = ?AUTO_7350 ?AUTO_7354 ) ) ( TRUCK-AT ?AUTO_7353 ?AUTO_7357 ) ( IN-CITY ?AUTO_7357 ?AUTO_7350 ) ( not ( = ?AUTO_7351 ?AUTO_7357 ) ) ( not ( = ?AUTO_7348 ?AUTO_7357 ) ) ( not ( = ?AUTO_7355 ?AUTO_7357 ) ) ( not ( = ?AUTO_7356 ?AUTO_7357 ) ) ( AIRPLANE-AT ?AUTO_7349 ?AUTO_7355 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7349 ?AUTO_7355 ?AUTO_7351 )
      ( DELIVER-PKG ?AUTO_7347 ?AUTO_7348 )
      ( DELIVER-PKG-VERIFY ?AUTO_7347 ?AUTO_7348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7360 - OBJ
      ?AUTO_7361 - LOCATION
    )
    :vars
    (
      ?AUTO_7370 - LOCATION
      ?AUTO_7366 - CITY
      ?AUTO_7367 - LOCATION
      ?AUTO_7365 - TRUCK
      ?AUTO_7368 - TRUCK
      ?AUTO_7363 - LOCATION
      ?AUTO_7369 - CITY
      ?AUTO_7364 - LOCATION
      ?AUTO_7371 - LOCATION
      ?AUTO_7362 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7370 ?AUTO_7366 ) ( IN-CITY ?AUTO_7361 ?AUTO_7366 ) ( not ( = ?AUTO_7361 ?AUTO_7370 ) ) ( AIRPORT ?AUTO_7367 ) ( AIRPORT ?AUTO_7370 ) ( not ( = ?AUTO_7367 ?AUTO_7370 ) ) ( not ( = ?AUTO_7361 ?AUTO_7367 ) ) ( IN-TRUCK ?AUTO_7360 ?AUTO_7365 ) ( not ( = ?AUTO_7368 ?AUTO_7365 ) ) ( TRUCK-AT ?AUTO_7365 ?AUTO_7363 ) ( IN-CITY ?AUTO_7363 ?AUTO_7369 ) ( IN-CITY ?AUTO_7367 ?AUTO_7369 ) ( not ( = ?AUTO_7367 ?AUTO_7363 ) ) ( not ( = ?AUTO_7361 ?AUTO_7363 ) ) ( not ( = ?AUTO_7370 ?AUTO_7363 ) ) ( not ( = ?AUTO_7366 ?AUTO_7369 ) ) ( TRUCK-AT ?AUTO_7368 ?AUTO_7364 ) ( IN-CITY ?AUTO_7364 ?AUTO_7366 ) ( not ( = ?AUTO_7370 ?AUTO_7364 ) ) ( not ( = ?AUTO_7361 ?AUTO_7364 ) ) ( not ( = ?AUTO_7367 ?AUTO_7364 ) ) ( not ( = ?AUTO_7363 ?AUTO_7364 ) ) ( AIRPORT ?AUTO_7371 ) ( AIRPLANE-AT ?AUTO_7362 ?AUTO_7371 ) ( not ( = ?AUTO_7371 ?AUTO_7367 ) ) ( not ( = ?AUTO_7361 ?AUTO_7371 ) ) ( not ( = ?AUTO_7370 ?AUTO_7371 ) ) ( not ( = ?AUTO_7363 ?AUTO_7371 ) ) ( not ( = ?AUTO_7364 ?AUTO_7371 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7362 ?AUTO_7371 ?AUTO_7367 )
      ( DELIVER-PKG ?AUTO_7360 ?AUTO_7361 )
      ( DELIVER-PKG-VERIFY ?AUTO_7360 ?AUTO_7361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7411 - OBJ
      ?AUTO_7412 - LOCATION
    )
    :vars
    (
      ?AUTO_7421 - LOCATION
      ?AUTO_7420 - CITY
      ?AUTO_7413 - LOCATION
      ?AUTO_7415 - TRUCK
      ?AUTO_7418 - TRUCK
      ?AUTO_7417 - LOCATION
      ?AUTO_7416 - CITY
      ?AUTO_7419 - LOCATION
      ?AUTO_7414 - AIRPLANE
      ?AUTO_7422 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7421 ?AUTO_7420 ) ( IN-CITY ?AUTO_7412 ?AUTO_7420 ) ( not ( = ?AUTO_7412 ?AUTO_7421 ) ) ( AIRPORT ?AUTO_7413 ) ( AIRPORT ?AUTO_7421 ) ( not ( = ?AUTO_7413 ?AUTO_7421 ) ) ( not ( = ?AUTO_7412 ?AUTO_7413 ) ) ( not ( = ?AUTO_7415 ?AUTO_7418 ) ) ( IN-CITY ?AUTO_7417 ?AUTO_7416 ) ( IN-CITY ?AUTO_7413 ?AUTO_7416 ) ( not ( = ?AUTO_7413 ?AUTO_7417 ) ) ( not ( = ?AUTO_7412 ?AUTO_7417 ) ) ( not ( = ?AUTO_7421 ?AUTO_7417 ) ) ( not ( = ?AUTO_7420 ?AUTO_7416 ) ) ( TRUCK-AT ?AUTO_7415 ?AUTO_7419 ) ( IN-CITY ?AUTO_7419 ?AUTO_7420 ) ( not ( = ?AUTO_7421 ?AUTO_7419 ) ) ( not ( = ?AUTO_7412 ?AUTO_7419 ) ) ( not ( = ?AUTO_7413 ?AUTO_7419 ) ) ( not ( = ?AUTO_7417 ?AUTO_7419 ) ) ( AIRPLANE-AT ?AUTO_7414 ?AUTO_7413 ) ( OBJ-AT ?AUTO_7411 ?AUTO_7417 ) ( TRUCK-AT ?AUTO_7418 ?AUTO_7422 ) ( IN-CITY ?AUTO_7422 ?AUTO_7416 ) ( not ( = ?AUTO_7417 ?AUTO_7422 ) ) ( not ( = ?AUTO_7412 ?AUTO_7422 ) ) ( not ( = ?AUTO_7421 ?AUTO_7422 ) ) ( not ( = ?AUTO_7413 ?AUTO_7422 ) ) ( not ( = ?AUTO_7419 ?AUTO_7422 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7418 ?AUTO_7422 ?AUTO_7417 ?AUTO_7416 )
      ( DELIVER-PKG ?AUTO_7411 ?AUTO_7412 )
      ( DELIVER-PKG-VERIFY ?AUTO_7411 ?AUTO_7412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7864 - OBJ
      ?AUTO_7865 - LOCATION
    )
    :vars
    (
      ?AUTO_7868 - LOCATION
      ?AUTO_7870 - AIRPLANE
      ?AUTO_7866 - LOCATION
      ?AUTO_7869 - CITY
      ?AUTO_7867 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7868 ) ( AIRPORT ?AUTO_7865 ) ( not ( = ?AUTO_7868 ?AUTO_7865 ) ) ( AIRPLANE-AT ?AUTO_7870 ?AUTO_7865 ) ( IN-CITY ?AUTO_7866 ?AUTO_7869 ) ( IN-CITY ?AUTO_7868 ?AUTO_7869 ) ( not ( = ?AUTO_7868 ?AUTO_7866 ) ) ( not ( = ?AUTO_7865 ?AUTO_7866 ) ) ( OBJ-AT ?AUTO_7864 ?AUTO_7866 ) ( TRUCK-AT ?AUTO_7867 ?AUTO_7868 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7867 ?AUTO_7868 ?AUTO_7866 ?AUTO_7869 )
      ( DELIVER-PKG ?AUTO_7864 ?AUTO_7865 )
      ( DELIVER-PKG-VERIFY ?AUTO_7864 ?AUTO_7865 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8056 - OBJ
      ?AUTO_8057 - LOCATION
    )
    :vars
    (
      ?AUTO_8062 - LOCATION
      ?AUTO_8058 - CITY
      ?AUTO_8060 - LOCATION
      ?AUTO_8063 - AIRPLANE
      ?AUTO_8059 - TRUCK
      ?AUTO_8065 - TRUCK
      ?AUTO_8064 - LOCATION
      ?AUTO_8061 - CITY
      ?AUTO_8066 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8062 ?AUTO_8058 ) ( IN-CITY ?AUTO_8057 ?AUTO_8058 ) ( not ( = ?AUTO_8057 ?AUTO_8062 ) ) ( AIRPORT ?AUTO_8060 ) ( AIRPORT ?AUTO_8062 ) ( not ( = ?AUTO_8060 ?AUTO_8062 ) ) ( not ( = ?AUTO_8057 ?AUTO_8060 ) ) ( AIRPLANE-AT ?AUTO_8063 ?AUTO_8062 ) ( not ( = ?AUTO_8059 ?AUTO_8065 ) ) ( IN-CITY ?AUTO_8064 ?AUTO_8061 ) ( IN-CITY ?AUTO_8060 ?AUTO_8061 ) ( not ( = ?AUTO_8060 ?AUTO_8064 ) ) ( not ( = ?AUTO_8057 ?AUTO_8064 ) ) ( not ( = ?AUTO_8062 ?AUTO_8064 ) ) ( not ( = ?AUTO_8058 ?AUTO_8061 ) ) ( TRUCK-AT ?AUTO_8059 ?AUTO_8066 ) ( IN-CITY ?AUTO_8066 ?AUTO_8058 ) ( not ( = ?AUTO_8062 ?AUTO_8066 ) ) ( not ( = ?AUTO_8057 ?AUTO_8066 ) ) ( not ( = ?AUTO_8060 ?AUTO_8066 ) ) ( not ( = ?AUTO_8064 ?AUTO_8066 ) ) ( OBJ-AT ?AUTO_8056 ?AUTO_8064 ) ( TRUCK-AT ?AUTO_8065 ?AUTO_8060 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8065 ?AUTO_8060 ?AUTO_8064 ?AUTO_8061 )
      ( DELIVER-PKG ?AUTO_8056 ?AUTO_8057 )
      ( DELIVER-PKG-VERIFY ?AUTO_8056 ?AUTO_8057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8315 - OBJ
      ?AUTO_8316 - LOCATION
    )
    :vars
    (
      ?AUTO_8323 - TRUCK
      ?AUTO_8322 - LOCATION
      ?AUTO_8324 - CITY
      ?AUTO_8320 - LOCATION
      ?AUTO_8317 - AIRPLANE
      ?AUTO_8319 - TRUCK
      ?AUTO_8321 - LOCATION
      ?AUTO_8318 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8323 ?AUTO_8322 ) ( IN-CITY ?AUTO_8322 ?AUTO_8324 ) ( IN-CITY ?AUTO_8316 ?AUTO_8324 ) ( not ( = ?AUTO_8316 ?AUTO_8322 ) ) ( AIRPORT ?AUTO_8320 ) ( AIRPORT ?AUTO_8322 ) ( AIRPLANE-AT ?AUTO_8317 ?AUTO_8320 ) ( not ( = ?AUTO_8320 ?AUTO_8322 ) ) ( not ( = ?AUTO_8316 ?AUTO_8320 ) ) ( not ( = ?AUTO_8323 ?AUTO_8319 ) ) ( TRUCK-AT ?AUTO_8319 ?AUTO_8321 ) ( IN-CITY ?AUTO_8321 ?AUTO_8318 ) ( IN-CITY ?AUTO_8320 ?AUTO_8318 ) ( not ( = ?AUTO_8320 ?AUTO_8321 ) ) ( not ( = ?AUTO_8316 ?AUTO_8321 ) ) ( not ( = ?AUTO_8322 ?AUTO_8321 ) ) ( not ( = ?AUTO_8324 ?AUTO_8318 ) ) ( OBJ-AT ?AUTO_8315 ?AUTO_8321 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8315 ?AUTO_8319 ?AUTO_8321 )
      ( DELIVER-PKG ?AUTO_8315 ?AUTO_8316 )
      ( DELIVER-PKG-VERIFY ?AUTO_8315 ?AUTO_8316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8515 - OBJ
      ?AUTO_8516 - LOCATION
    )
    :vars
    (
      ?AUTO_8518 - LOCATION
      ?AUTO_8523 - CITY
      ?AUTO_8525 - TRUCK
      ?AUTO_8519 - LOCATION
      ?AUTO_8522 - LOCATION
      ?AUTO_8521 - AIRPLANE
      ?AUTO_8517 - TRUCK
      ?AUTO_8524 - LOCATION
      ?AUTO_8520 - CITY
      ?AUTO_8526 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8518 ?AUTO_8523 ) ( IN-CITY ?AUTO_8516 ?AUTO_8523 ) ( not ( = ?AUTO_8516 ?AUTO_8518 ) ) ( TRUCK-AT ?AUTO_8525 ?AUTO_8516 ) ( AIRPORT ?AUTO_8519 ) ( AIRPORT ?AUTO_8518 ) ( not ( = ?AUTO_8519 ?AUTO_8518 ) ) ( not ( = ?AUTO_8516 ?AUTO_8519 ) ) ( AIRPORT ?AUTO_8522 ) ( AIRPLANE-AT ?AUTO_8521 ?AUTO_8522 ) ( not ( = ?AUTO_8522 ?AUTO_8519 ) ) ( not ( = ?AUTO_8516 ?AUTO_8522 ) ) ( not ( = ?AUTO_8518 ?AUTO_8522 ) ) ( not ( = ?AUTO_8525 ?AUTO_8517 ) ) ( IN-CITY ?AUTO_8524 ?AUTO_8520 ) ( IN-CITY ?AUTO_8519 ?AUTO_8520 ) ( not ( = ?AUTO_8519 ?AUTO_8524 ) ) ( not ( = ?AUTO_8516 ?AUTO_8524 ) ) ( not ( = ?AUTO_8518 ?AUTO_8524 ) ) ( not ( = ?AUTO_8523 ?AUTO_8520 ) ) ( not ( = ?AUTO_8522 ?AUTO_8524 ) ) ( OBJ-AT ?AUTO_8515 ?AUTO_8524 ) ( TRUCK-AT ?AUTO_8517 ?AUTO_8526 ) ( IN-CITY ?AUTO_8526 ?AUTO_8520 ) ( not ( = ?AUTO_8524 ?AUTO_8526 ) ) ( not ( = ?AUTO_8516 ?AUTO_8526 ) ) ( not ( = ?AUTO_8518 ?AUTO_8526 ) ) ( not ( = ?AUTO_8519 ?AUTO_8526 ) ) ( not ( = ?AUTO_8522 ?AUTO_8526 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8517 ?AUTO_8526 ?AUTO_8524 ?AUTO_8520 )
      ( DELIVER-PKG ?AUTO_8515 ?AUTO_8516 )
      ( DELIVER-PKG-VERIFY ?AUTO_8515 ?AUTO_8516 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9112 - OBJ
      ?AUTO_9113 - LOCATION
    )
    :vars
    (
      ?AUTO_9117 - LOCATION
      ?AUTO_9118 - LOCATION
      ?AUTO_9115 - CITY
      ?AUTO_9116 - TRUCK
      ?AUTO_9119 - LOCATION
      ?AUTO_9120 - LOCATION
      ?AUTO_9114 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9117 ) ( AIRPORT ?AUTO_9113 ) ( not ( = ?AUTO_9117 ?AUTO_9113 ) ) ( IN-CITY ?AUTO_9118 ?AUTO_9115 ) ( IN-CITY ?AUTO_9117 ?AUTO_9115 ) ( not ( = ?AUTO_9117 ?AUTO_9118 ) ) ( not ( = ?AUTO_9113 ?AUTO_9118 ) ) ( OBJ-AT ?AUTO_9112 ?AUTO_9118 ) ( TRUCK-AT ?AUTO_9116 ?AUTO_9119 ) ( IN-CITY ?AUTO_9119 ?AUTO_9115 ) ( not ( = ?AUTO_9118 ?AUTO_9119 ) ) ( not ( = ?AUTO_9113 ?AUTO_9119 ) ) ( not ( = ?AUTO_9117 ?AUTO_9119 ) ) ( AIRPORT ?AUTO_9120 ) ( AIRPLANE-AT ?AUTO_9114 ?AUTO_9120 ) ( not ( = ?AUTO_9120 ?AUTO_9117 ) ) ( not ( = ?AUTO_9113 ?AUTO_9120 ) ) ( not ( = ?AUTO_9118 ?AUTO_9120 ) ) ( not ( = ?AUTO_9119 ?AUTO_9120 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9114 ?AUTO_9120 ?AUTO_9117 )
      ( DELIVER-PKG ?AUTO_9112 ?AUTO_9113 )
      ( DELIVER-PKG-VERIFY ?AUTO_9112 ?AUTO_9113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9674 - OBJ
      ?AUTO_9675 - LOCATION
    )
    :vars
    (
      ?AUTO_9677 - LOCATION
      ?AUTO_9679 - CITY
      ?AUTO_9678 - LOCATION
      ?AUTO_9681 - AIRPLANE
      ?AUTO_9680 - LOCATION
      ?AUTO_9676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9677 ?AUTO_9679 ) ( IN-CITY ?AUTO_9675 ?AUTO_9679 ) ( not ( = ?AUTO_9675 ?AUTO_9677 ) ) ( AIRPORT ?AUTO_9678 ) ( AIRPORT ?AUTO_9677 ) ( not ( = ?AUTO_9678 ?AUTO_9677 ) ) ( not ( = ?AUTO_9675 ?AUTO_9678 ) ) ( OBJ-AT ?AUTO_9674 ?AUTO_9678 ) ( AIRPLANE-AT ?AUTO_9681 ?AUTO_9677 ) ( IN-CITY ?AUTO_9680 ?AUTO_9679 ) ( not ( = ?AUTO_9677 ?AUTO_9680 ) ) ( not ( = ?AUTO_9675 ?AUTO_9680 ) ) ( not ( = ?AUTO_9678 ?AUTO_9680 ) ) ( TRUCK-AT ?AUTO_9676 ?AUTO_9675 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9676 ?AUTO_9675 ?AUTO_9680 ?AUTO_9679 )
      ( DELIVER-PKG ?AUTO_9674 ?AUTO_9675 )
      ( DELIVER-PKG-VERIFY ?AUTO_9674 ?AUTO_9675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9682 - OBJ
      ?AUTO_9683 - LOCATION
    )
    :vars
    (
      ?AUTO_9684 - LOCATION
      ?AUTO_9688 - CITY
      ?AUTO_9686 - LOCATION
      ?AUTO_9687 - LOCATION
      ?AUTO_9689 - TRUCK
      ?AUTO_9690 - LOCATION
      ?AUTO_9685 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9684 ?AUTO_9688 ) ( IN-CITY ?AUTO_9683 ?AUTO_9688 ) ( not ( = ?AUTO_9683 ?AUTO_9684 ) ) ( AIRPORT ?AUTO_9686 ) ( AIRPORT ?AUTO_9684 ) ( not ( = ?AUTO_9686 ?AUTO_9684 ) ) ( not ( = ?AUTO_9683 ?AUTO_9686 ) ) ( OBJ-AT ?AUTO_9682 ?AUTO_9686 ) ( IN-CITY ?AUTO_9687 ?AUTO_9688 ) ( not ( = ?AUTO_9684 ?AUTO_9687 ) ) ( not ( = ?AUTO_9683 ?AUTO_9687 ) ) ( not ( = ?AUTO_9686 ?AUTO_9687 ) ) ( TRUCK-AT ?AUTO_9689 ?AUTO_9683 ) ( AIRPORT ?AUTO_9690 ) ( AIRPLANE-AT ?AUTO_9685 ?AUTO_9690 ) ( not ( = ?AUTO_9690 ?AUTO_9684 ) ) ( not ( = ?AUTO_9683 ?AUTO_9690 ) ) ( not ( = ?AUTO_9686 ?AUTO_9690 ) ) ( not ( = ?AUTO_9687 ?AUTO_9690 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9685 ?AUTO_9690 ?AUTO_9684 )
      ( DELIVER-PKG ?AUTO_9682 ?AUTO_9683 )
      ( DELIVER-PKG-VERIFY ?AUTO_9682 ?AUTO_9683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10135 - OBJ
      ?AUTO_10136 - LOCATION
    )
    :vars
    (
      ?AUTO_10144 - LOCATION
      ?AUTO_10139 - CITY
      ?AUTO_10143 - TRUCK
      ?AUTO_10138 - LOCATION
      ?AUTO_10137 - AIRPLANE
      ?AUTO_10141 - TRUCK
      ?AUTO_10142 - LOCATION
      ?AUTO_10140 - CITY
      ?AUTO_10145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10144 ?AUTO_10139 ) ( IN-CITY ?AUTO_10136 ?AUTO_10139 ) ( not ( = ?AUTO_10136 ?AUTO_10144 ) ) ( TRUCK-AT ?AUTO_10143 ?AUTO_10136 ) ( AIRPORT ?AUTO_10138 ) ( AIRPORT ?AUTO_10144 ) ( AIRPLANE-AT ?AUTO_10137 ?AUTO_10138 ) ( not ( = ?AUTO_10138 ?AUTO_10144 ) ) ( not ( = ?AUTO_10136 ?AUTO_10138 ) ) ( not ( = ?AUTO_10143 ?AUTO_10141 ) ) ( IN-CITY ?AUTO_10142 ?AUTO_10140 ) ( IN-CITY ?AUTO_10138 ?AUTO_10140 ) ( not ( = ?AUTO_10138 ?AUTO_10142 ) ) ( not ( = ?AUTO_10136 ?AUTO_10142 ) ) ( not ( = ?AUTO_10144 ?AUTO_10142 ) ) ( not ( = ?AUTO_10139 ?AUTO_10140 ) ) ( OBJ-AT ?AUTO_10135 ?AUTO_10142 ) ( TRUCK-AT ?AUTO_10141 ?AUTO_10145 ) ( IN-CITY ?AUTO_10145 ?AUTO_10140 ) ( not ( = ?AUTO_10142 ?AUTO_10145 ) ) ( not ( = ?AUTO_10136 ?AUTO_10145 ) ) ( not ( = ?AUTO_10144 ?AUTO_10145 ) ) ( not ( = ?AUTO_10138 ?AUTO_10145 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10141 ?AUTO_10145 ?AUTO_10142 ?AUTO_10140 )
      ( DELIVER-PKG ?AUTO_10135 ?AUTO_10136 )
      ( DELIVER-PKG-VERIFY ?AUTO_10135 ?AUTO_10136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10146 - OBJ
      ?AUTO_10147 - LOCATION
    )
    :vars
    (
      ?AUTO_10154 - LOCATION
      ?AUTO_10148 - CITY
      ?AUTO_10150 - TRUCK
      ?AUTO_10151 - LOCATION
      ?AUTO_10149 - TRUCK
      ?AUTO_10152 - LOCATION
      ?AUTO_10153 - CITY
      ?AUTO_10156 - LOCATION
      ?AUTO_10157 - LOCATION
      ?AUTO_10155 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10154 ?AUTO_10148 ) ( IN-CITY ?AUTO_10147 ?AUTO_10148 ) ( not ( = ?AUTO_10147 ?AUTO_10154 ) ) ( TRUCK-AT ?AUTO_10150 ?AUTO_10147 ) ( AIRPORT ?AUTO_10151 ) ( AIRPORT ?AUTO_10154 ) ( not ( = ?AUTO_10151 ?AUTO_10154 ) ) ( not ( = ?AUTO_10147 ?AUTO_10151 ) ) ( not ( = ?AUTO_10150 ?AUTO_10149 ) ) ( IN-CITY ?AUTO_10152 ?AUTO_10153 ) ( IN-CITY ?AUTO_10151 ?AUTO_10153 ) ( not ( = ?AUTO_10151 ?AUTO_10152 ) ) ( not ( = ?AUTO_10147 ?AUTO_10152 ) ) ( not ( = ?AUTO_10154 ?AUTO_10152 ) ) ( not ( = ?AUTO_10148 ?AUTO_10153 ) ) ( OBJ-AT ?AUTO_10146 ?AUTO_10152 ) ( TRUCK-AT ?AUTO_10149 ?AUTO_10156 ) ( IN-CITY ?AUTO_10156 ?AUTO_10153 ) ( not ( = ?AUTO_10152 ?AUTO_10156 ) ) ( not ( = ?AUTO_10147 ?AUTO_10156 ) ) ( not ( = ?AUTO_10154 ?AUTO_10156 ) ) ( not ( = ?AUTO_10151 ?AUTO_10156 ) ) ( AIRPORT ?AUTO_10157 ) ( AIRPLANE-AT ?AUTO_10155 ?AUTO_10157 ) ( not ( = ?AUTO_10157 ?AUTO_10151 ) ) ( not ( = ?AUTO_10147 ?AUTO_10157 ) ) ( not ( = ?AUTO_10154 ?AUTO_10157 ) ) ( not ( = ?AUTO_10152 ?AUTO_10157 ) ) ( not ( = ?AUTO_10156 ?AUTO_10157 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10155 ?AUTO_10157 ?AUTO_10151 )
      ( DELIVER-PKG ?AUTO_10146 ?AUTO_10147 )
      ( DELIVER-PKG-VERIFY ?AUTO_10146 ?AUTO_10147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10444 - OBJ
      ?AUTO_10445 - LOCATION
    )
    :vars
    (
      ?AUTO_10447 - LOCATION
      ?AUTO_10448 - LOCATION
      ?AUTO_10446 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10447 ) ( AIRPORT ?AUTO_10445 ) ( not ( = ?AUTO_10447 ?AUTO_10445 ) ) ( OBJ-AT ?AUTO_10444 ?AUTO_10447 ) ( AIRPORT ?AUTO_10448 ) ( AIRPLANE-AT ?AUTO_10446 ?AUTO_10448 ) ( not ( = ?AUTO_10448 ?AUTO_10445 ) ) ( not ( = ?AUTO_10447 ?AUTO_10448 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10446 ?AUTO_10448 ?AUTO_10445 )
      ( DELIVER-PKG ?AUTO_10444 ?AUTO_10445 )
      ( DELIVER-PKG-VERIFY ?AUTO_10444 ?AUTO_10445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10595 - OBJ
      ?AUTO_10596 - LOCATION
    )
    :vars
    (
      ?AUTO_10597 - LOCATION
      ?AUTO_10601 - CITY
      ?AUTO_10600 - AIRPLANE
      ?AUTO_10599 - LOCATION
      ?AUTO_10598 - LOCATION
      ?AUTO_10602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10597 ?AUTO_10601 ) ( IN-CITY ?AUTO_10596 ?AUTO_10601 ) ( not ( = ?AUTO_10596 ?AUTO_10597 ) ) ( IN-AIRPLANE ?AUTO_10595 ?AUTO_10600 ) ( AIRPORT ?AUTO_10599 ) ( AIRPORT ?AUTO_10597 ) ( AIRPLANE-AT ?AUTO_10600 ?AUTO_10599 ) ( not ( = ?AUTO_10599 ?AUTO_10597 ) ) ( not ( = ?AUTO_10596 ?AUTO_10599 ) ) ( IN-CITY ?AUTO_10598 ?AUTO_10601 ) ( not ( = ?AUTO_10597 ?AUTO_10598 ) ) ( not ( = ?AUTO_10596 ?AUTO_10598 ) ) ( not ( = ?AUTO_10599 ?AUTO_10598 ) ) ( TRUCK-AT ?AUTO_10602 ?AUTO_10596 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10602 ?AUTO_10596 ?AUTO_10598 ?AUTO_10601 )
      ( DELIVER-PKG ?AUTO_10595 ?AUTO_10596 )
      ( DELIVER-PKG-VERIFY ?AUTO_10595 ?AUTO_10596 ) )
  )

)

