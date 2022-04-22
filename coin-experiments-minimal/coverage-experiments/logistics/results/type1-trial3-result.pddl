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
      ?AUTO_9 - OBJ
      ?AUTO_10 - LOCATION
    )
    :vars
    (
      ?AUTO_12 - AIRPLANE
      ?AUTO_16 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9 ?AUTO_12 ) ( AIRPORT ?AUTO_16 ) ( AIRPORT ?AUTO_10 ) ( AIRPLANE-AT ?AUTO_12 ?AUTO_16 ) ( not ( = ?AUTO_16 ?AUTO_10 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12 ?AUTO_16 ?AUTO_10 )
      ( DELIVER-PKG ?AUTO_9 ?AUTO_10 )
      ( DELIVER-PKG-VERIFY ?AUTO_9 ?AUTO_10 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_21 - OBJ
      ?AUTO_22 - LOCATION
    )
    :vars
    (
      ?AUTO_24 - LOCATION
      ?AUTO_26 - AIRPLANE
      ?AUTO_28 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_24 ) ( AIRPORT ?AUTO_22 ) ( AIRPLANE-AT ?AUTO_26 ?AUTO_24 ) ( not ( = ?AUTO_24 ?AUTO_22 ) ) ( OBJ-AT ?AUTO_21 ?AUTO_28 ) ( AIRPLANE-AT ?AUTO_26 ?AUTO_28 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_21 ?AUTO_26 ?AUTO_28 )
      ( DELIVER-PKG ?AUTO_21 ?AUTO_22 )
      ( DELIVER-PKG-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_30 - OBJ
      ?AUTO_31 - LOCATION
    )
    :vars
    (
      ?AUTO_36 - LOCATION
      ?AUTO_39 - LOCATION
      ?AUTO_33 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_36 ) ( AIRPORT ?AUTO_31 ) ( not ( = ?AUTO_36 ?AUTO_31 ) ) ( OBJ-AT ?AUTO_30 ?AUTO_36 ) ( AIRPORT ?AUTO_39 ) ( AIRPLANE-AT ?AUTO_33 ?AUTO_39 ) ( not ( = ?AUTO_39 ?AUTO_36 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_33 ?AUTO_39 ?AUTO_36 )
      ( DELIVER-PKG ?AUTO_30 ?AUTO_31 )
      ( DELIVER-PKG-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_86 - OBJ
      ?AUTO_87 - LOCATION
    )
    :vars
    (
      ?AUTO_88 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_88 ?AUTO_87 ) ( IN-TRUCK ?AUTO_86 ?AUTO_88 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_86 ?AUTO_88 ?AUTO_87 )
      ( DELIVER-PKG-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_95 - OBJ
      ?AUTO_96 - LOCATION
    )
    :vars
    (
      ?AUTO_99 - TRUCK
      ?AUTO_103 - LOCATION
      ?AUTO_101 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_95 ?AUTO_99 ) ( TRUCK-AT ?AUTO_99 ?AUTO_103 ) ( IN-CITY ?AUTO_103 ?AUTO_101 ) ( IN-CITY ?AUTO_96 ?AUTO_101 ) ( not ( = ?AUTO_96 ?AUTO_103 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_99 ?AUTO_103 ?AUTO_96 ?AUTO_101 )
      ( DELIVER-PKG ?AUTO_95 ?AUTO_96 )
      ( DELIVER-PKG-VERIFY ?AUTO_95 ?AUTO_96 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_108 - TRUCK
      ?AUTO_110 - LOCATION
      ?AUTO_109 - CITY
      ?AUTO_112 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_108 ?AUTO_110 ) ( IN-CITY ?AUTO_110 ?AUTO_109 ) ( IN-CITY ?AUTO_105 ?AUTO_109 ) ( not ( = ?AUTO_105 ?AUTO_110 ) ) ( TRUCK-AT ?AUTO_108 ?AUTO_112 ) ( OBJ-AT ?AUTO_104 ?AUTO_112 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_104 ?AUTO_108 ?AUTO_112 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_118 - OBJ
      ?AUTO_119 - LOCATION
    )
    :vars
    (
      ?AUTO_124 - TRUCK
      ?AUTO_120 - LOCATION
      ?AUTO_121 - CITY
      ?AUTO_125 - LOCATION
      ?AUTO_126 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_124 ?AUTO_120 ) ( IN-CITY ?AUTO_120 ?AUTO_121 ) ( IN-CITY ?AUTO_119 ?AUTO_121 ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( TRUCK-AT ?AUTO_124 ?AUTO_125 ) ( IN-AIRPLANE ?AUTO_118 ?AUTO_126 ) ( AIRPLANE-AT ?AUTO_126 ?AUTO_125 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_118 ?AUTO_126 ?AUTO_125 )
      ( DELIVER-PKG ?AUTO_118 ?AUTO_119 )
      ( DELIVER-PKG-VERIFY ?AUTO_118 ?AUTO_119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_129 - OBJ
      ?AUTO_130 - LOCATION
    )
    :vars
    (
      ?AUTO_134 - LOCATION
      ?AUTO_133 - CITY
      ?AUTO_137 - AIRPLANE
      ?AUTO_135 - TRUCK
      ?AUTO_141 - LOCATION
      ?AUTO_139 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_134 ?AUTO_133 ) ( IN-CITY ?AUTO_130 ?AUTO_133 ) ( not ( = ?AUTO_130 ?AUTO_134 ) ) ( IN-AIRPLANE ?AUTO_129 ?AUTO_137 ) ( AIRPLANE-AT ?AUTO_137 ?AUTO_134 ) ( TRUCK-AT ?AUTO_135 ?AUTO_141 ) ( IN-CITY ?AUTO_141 ?AUTO_139 ) ( IN-CITY ?AUTO_134 ?AUTO_139 ) ( not ( = ?AUTO_134 ?AUTO_141 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_135 ?AUTO_141 ?AUTO_134 ?AUTO_139 )
      ( DELIVER-PKG ?AUTO_129 ?AUTO_130 )
      ( DELIVER-PKG-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_142 - OBJ
      ?AUTO_143 - LOCATION
    )
    :vars
    (
      ?AUTO_150 - LOCATION
      ?AUTO_149 - CITY
      ?AUTO_148 - AIRPLANE
      ?AUTO_151 - TRUCK
      ?AUTO_145 - LOCATION
      ?AUTO_144 - CITY
      ?AUTO_154 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_150 ?AUTO_149 ) ( IN-CITY ?AUTO_143 ?AUTO_149 ) ( not ( = ?AUTO_143 ?AUTO_150 ) ) ( IN-AIRPLANE ?AUTO_142 ?AUTO_148 ) ( TRUCK-AT ?AUTO_151 ?AUTO_145 ) ( IN-CITY ?AUTO_145 ?AUTO_144 ) ( IN-CITY ?AUTO_150 ?AUTO_144 ) ( not ( = ?AUTO_150 ?AUTO_145 ) ) ( AIRPORT ?AUTO_154 ) ( AIRPORT ?AUTO_150 ) ( AIRPLANE-AT ?AUTO_148 ?AUTO_154 ) ( not ( = ?AUTO_154 ?AUTO_150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_148 ?AUTO_154 ?AUTO_150 )
      ( DELIVER-PKG ?AUTO_142 ?AUTO_143 )
      ( DELIVER-PKG-VERIFY ?AUTO_142 ?AUTO_143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_159 - OBJ
      ?AUTO_160 - LOCATION
    )
    :vars
    (
      ?AUTO_165 - LOCATION
      ?AUTO_166 - CITY
      ?AUTO_164 - TRUCK
      ?AUTO_167 - LOCATION
      ?AUTO_161 - CITY
      ?AUTO_163 - LOCATION
      ?AUTO_162 - AIRPLANE
      ?AUTO_171 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_165 ?AUTO_166 ) ( IN-CITY ?AUTO_160 ?AUTO_166 ) ( not ( = ?AUTO_160 ?AUTO_165 ) ) ( TRUCK-AT ?AUTO_164 ?AUTO_167 ) ( IN-CITY ?AUTO_167 ?AUTO_161 ) ( IN-CITY ?AUTO_165 ?AUTO_161 ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( AIRPORT ?AUTO_163 ) ( AIRPORT ?AUTO_165 ) ( AIRPLANE-AT ?AUTO_162 ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( OBJ-AT ?AUTO_159 ?AUTO_171 ) ( AIRPLANE-AT ?AUTO_162 ?AUTO_171 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_159 ?AUTO_162 ?AUTO_171 )
      ( DELIVER-PKG ?AUTO_159 ?AUTO_160 )
      ( DELIVER-PKG-VERIFY ?AUTO_159 ?AUTO_160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_173 - OBJ
      ?AUTO_174 - LOCATION
    )
    :vars
    (
      ?AUTO_181 - LOCATION
      ?AUTO_180 - CITY
      ?AUTO_183 - TRUCK
      ?AUTO_182 - LOCATION
      ?AUTO_179 - CITY
      ?AUTO_184 - LOCATION
      ?AUTO_187 - LOCATION
      ?AUTO_177 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_181 ?AUTO_180 ) ( IN-CITY ?AUTO_174 ?AUTO_180 ) ( not ( = ?AUTO_174 ?AUTO_181 ) ) ( TRUCK-AT ?AUTO_183 ?AUTO_182 ) ( IN-CITY ?AUTO_182 ?AUTO_179 ) ( IN-CITY ?AUTO_181 ?AUTO_179 ) ( not ( = ?AUTO_181 ?AUTO_182 ) ) ( AIRPORT ?AUTO_184 ) ( AIRPORT ?AUTO_181 ) ( not ( = ?AUTO_184 ?AUTO_181 ) ) ( OBJ-AT ?AUTO_173 ?AUTO_184 ) ( AIRPORT ?AUTO_187 ) ( AIRPLANE-AT ?AUTO_177 ?AUTO_187 ) ( not ( = ?AUTO_187 ?AUTO_184 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_177 ?AUTO_187 ?AUTO_184 )
      ( DELIVER-PKG ?AUTO_173 ?AUTO_174 )
      ( DELIVER-PKG-VERIFY ?AUTO_173 ?AUTO_174 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_231 - OBJ
      ?AUTO_232 - LOCATION
    )
    :vars
    (
      ?AUTO_237 - TRUCK
      ?AUTO_236 - LOCATION
      ?AUTO_235 - CITY
      ?AUTO_234 - LOCATION
      ?AUTO_239 - AIRPLANE
      ?AUTO_242 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_237 ?AUTO_236 ) ( IN-CITY ?AUTO_236 ?AUTO_235 ) ( IN-CITY ?AUTO_232 ?AUTO_235 ) ( not ( = ?AUTO_232 ?AUTO_236 ) ) ( TRUCK-AT ?AUTO_237 ?AUTO_234 ) ( IN-AIRPLANE ?AUTO_231 ?AUTO_239 ) ( AIRPORT ?AUTO_242 ) ( AIRPORT ?AUTO_234 ) ( AIRPLANE-AT ?AUTO_239 ?AUTO_242 ) ( not ( = ?AUTO_242 ?AUTO_234 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_239 ?AUTO_242 ?AUTO_234 )
      ( DELIVER-PKG ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_249 - OBJ
      ?AUTO_250 - LOCATION
    )
    :vars
    (
      ?AUTO_254 - TRUCK
      ?AUTO_252 - LOCATION
      ?AUTO_255 - CITY
      ?AUTO_251 - LOCATION
      ?AUTO_253 - LOCATION
      ?AUTO_256 - AIRPLANE
      ?AUTO_260 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_254 ?AUTO_252 ) ( IN-CITY ?AUTO_252 ?AUTO_255 ) ( IN-CITY ?AUTO_250 ?AUTO_255 ) ( not ( = ?AUTO_250 ?AUTO_252 ) ) ( TRUCK-AT ?AUTO_254 ?AUTO_251 ) ( AIRPORT ?AUTO_253 ) ( AIRPORT ?AUTO_251 ) ( AIRPLANE-AT ?AUTO_256 ?AUTO_253 ) ( not ( = ?AUTO_253 ?AUTO_251 ) ) ( OBJ-AT ?AUTO_249 ?AUTO_260 ) ( AIRPLANE-AT ?AUTO_256 ?AUTO_260 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_249 ?AUTO_256 ?AUTO_260 )
      ( DELIVER-PKG ?AUTO_249 ?AUTO_250 )
      ( DELIVER-PKG-VERIFY ?AUTO_249 ?AUTO_250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_262 - OBJ
      ?AUTO_263 - LOCATION
    )
    :vars
    (
      ?AUTO_267 - TRUCK
      ?AUTO_268 - LOCATION
      ?AUTO_269 - CITY
      ?AUTO_266 - LOCATION
      ?AUTO_272 - LOCATION
      ?AUTO_275 - LOCATION
      ?AUTO_271 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_267 ?AUTO_268 ) ( IN-CITY ?AUTO_268 ?AUTO_269 ) ( IN-CITY ?AUTO_263 ?AUTO_269 ) ( not ( = ?AUTO_263 ?AUTO_268 ) ) ( TRUCK-AT ?AUTO_267 ?AUTO_266 ) ( AIRPORT ?AUTO_272 ) ( AIRPORT ?AUTO_266 ) ( not ( = ?AUTO_272 ?AUTO_266 ) ) ( OBJ-AT ?AUTO_262 ?AUTO_272 ) ( AIRPORT ?AUTO_275 ) ( AIRPLANE-AT ?AUTO_271 ?AUTO_275 ) ( not ( = ?AUTO_275 ?AUTO_272 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_271 ?AUTO_275 ?AUTO_272 )
      ( DELIVER-PKG ?AUTO_262 ?AUTO_263 )
      ( DELIVER-PKG-VERIFY ?AUTO_262 ?AUTO_263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_306 - OBJ
      ?AUTO_307 - LOCATION
    )
    :vars
    (
      ?AUTO_313 - LOCATION
      ?AUTO_308 - CITY
      ?AUTO_311 - TRUCK
      ?AUTO_317 - LOCATION
      ?AUTO_315 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_313 ?AUTO_308 ) ( IN-CITY ?AUTO_307 ?AUTO_308 ) ( not ( = ?AUTO_307 ?AUTO_313 ) ) ( OBJ-AT ?AUTO_306 ?AUTO_313 ) ( TRUCK-AT ?AUTO_311 ?AUTO_317 ) ( IN-CITY ?AUTO_317 ?AUTO_315 ) ( IN-CITY ?AUTO_313 ?AUTO_315 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_311 ?AUTO_317 ?AUTO_313 ?AUTO_315 )
      ( DELIVER-PKG ?AUTO_306 ?AUTO_307 )
      ( DELIVER-PKG-VERIFY ?AUTO_306 ?AUTO_307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_625 - OBJ
      ?AUTO_626 - LOCATION
    )
    :vars
    (
      ?AUTO_629 - LOCATION
      ?AUTO_631 - LOCATION
      ?AUTO_630 - AIRPLANE
      ?AUTO_632 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_629 ) ( AIRPORT ?AUTO_626 ) ( not ( = ?AUTO_629 ?AUTO_626 ) ) ( AIRPORT ?AUTO_631 ) ( AIRPLANE-AT ?AUTO_630 ?AUTO_631 ) ( not ( = ?AUTO_631 ?AUTO_629 ) ) ( TRUCK-AT ?AUTO_632 ?AUTO_629 ) ( IN-TRUCK ?AUTO_625 ?AUTO_632 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_625 ?AUTO_632 ?AUTO_629 )
      ( DELIVER-PKG ?AUTO_625 ?AUTO_626 )
      ( DELIVER-PKG-VERIFY ?AUTO_625 ?AUTO_626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_641 - OBJ
      ?AUTO_642 - LOCATION
    )
    :vars
    (
      ?AUTO_647 - LOCATION
      ?AUTO_644 - LOCATION
      ?AUTO_645 - AIRPLANE
      ?AUTO_643 - TRUCK
      ?AUTO_652 - LOCATION
      ?AUTO_650 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_647 ) ( AIRPORT ?AUTO_642 ) ( not ( = ?AUTO_647 ?AUTO_642 ) ) ( AIRPORT ?AUTO_644 ) ( AIRPLANE-AT ?AUTO_645 ?AUTO_644 ) ( not ( = ?AUTO_644 ?AUTO_647 ) ) ( IN-TRUCK ?AUTO_641 ?AUTO_643 ) ( TRUCK-AT ?AUTO_643 ?AUTO_652 ) ( IN-CITY ?AUTO_652 ?AUTO_650 ) ( IN-CITY ?AUTO_647 ?AUTO_650 ) ( not ( = ?AUTO_647 ?AUTO_652 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_643 ?AUTO_652 ?AUTO_647 ?AUTO_650 )
      ( DELIVER-PKG ?AUTO_641 ?AUTO_642 )
      ( DELIVER-PKG-VERIFY ?AUTO_641 ?AUTO_642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_653 - OBJ
      ?AUTO_654 - LOCATION
    )
    :vars
    (
      ?AUTO_660 - LOCATION
      ?AUTO_658 - LOCATION
      ?AUTO_662 - AIRPLANE
      ?AUTO_659 - TRUCK
      ?AUTO_661 - LOCATION
      ?AUTO_655 - CITY
      ?AUTO_664 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_660 ) ( AIRPORT ?AUTO_654 ) ( not ( = ?AUTO_660 ?AUTO_654 ) ) ( AIRPORT ?AUTO_658 ) ( AIRPLANE-AT ?AUTO_662 ?AUTO_658 ) ( not ( = ?AUTO_658 ?AUTO_660 ) ) ( TRUCK-AT ?AUTO_659 ?AUTO_661 ) ( IN-CITY ?AUTO_661 ?AUTO_655 ) ( IN-CITY ?AUTO_660 ?AUTO_655 ) ( not ( = ?AUTO_660 ?AUTO_661 ) ) ( TRUCK-AT ?AUTO_659 ?AUTO_664 ) ( OBJ-AT ?AUTO_653 ?AUTO_664 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_653 ?AUTO_659 ?AUTO_664 )
      ( DELIVER-PKG ?AUTO_653 ?AUTO_654 )
      ( DELIVER-PKG-VERIFY ?AUTO_653 ?AUTO_654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_666 - OBJ
      ?AUTO_667 - LOCATION
    )
    :vars
    (
      ?AUTO_671 - LOCATION
      ?AUTO_675 - LOCATION
      ?AUTO_674 - AIRPLANE
      ?AUTO_676 - LOCATION
      ?AUTO_670 - CITY
      ?AUTO_673 - TRUCK
      ?AUTO_680 - LOCATION
      ?AUTO_678 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_671 ) ( AIRPORT ?AUTO_667 ) ( not ( = ?AUTO_671 ?AUTO_667 ) ) ( AIRPORT ?AUTO_675 ) ( AIRPLANE-AT ?AUTO_674 ?AUTO_675 ) ( not ( = ?AUTO_675 ?AUTO_671 ) ) ( IN-CITY ?AUTO_676 ?AUTO_670 ) ( IN-CITY ?AUTO_671 ?AUTO_670 ) ( not ( = ?AUTO_671 ?AUTO_676 ) ) ( OBJ-AT ?AUTO_666 ?AUTO_676 ) ( TRUCK-AT ?AUTO_673 ?AUTO_680 ) ( IN-CITY ?AUTO_680 ?AUTO_678 ) ( IN-CITY ?AUTO_676 ?AUTO_678 ) ( not ( = ?AUTO_676 ?AUTO_680 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_673 ?AUTO_680 ?AUTO_676 ?AUTO_678 )
      ( DELIVER-PKG ?AUTO_666 ?AUTO_667 )
      ( DELIVER-PKG-VERIFY ?AUTO_666 ?AUTO_667 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1285 - OBJ
      ?AUTO_1286 - LOCATION
    )
    :vars
    (
      ?AUTO_1291 - TRUCK
      ?AUTO_1292 - LOCATION
      ?AUTO_1288 - CITY
      ?AUTO_1295 - LOCATION
      ?AUTO_1290 - LOCATION
      ?AUTO_1294 - LOCATION
      ?AUTO_1293 - AIRPLANE
      ?AUTO_1296 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1291 ?AUTO_1292 ) ( IN-CITY ?AUTO_1292 ?AUTO_1288 ) ( IN-CITY ?AUTO_1286 ?AUTO_1288 ) ( not ( = ?AUTO_1286 ?AUTO_1292 ) ) ( TRUCK-AT ?AUTO_1291 ?AUTO_1295 ) ( AIRPORT ?AUTO_1290 ) ( AIRPORT ?AUTO_1295 ) ( not ( = ?AUTO_1290 ?AUTO_1295 ) ) ( AIRPORT ?AUTO_1294 ) ( AIRPLANE-AT ?AUTO_1293 ?AUTO_1294 ) ( not ( = ?AUTO_1294 ?AUTO_1290 ) ) ( TRUCK-AT ?AUTO_1296 ?AUTO_1290 ) ( IN-TRUCK ?AUTO_1285 ?AUTO_1296 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1285 ?AUTO_1296 ?AUTO_1290 )
      ( DELIVER-PKG ?AUTO_1285 ?AUTO_1286 )
      ( DELIVER-PKG-VERIFY ?AUTO_1285 ?AUTO_1286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1299 - OBJ
      ?AUTO_1300 - LOCATION
    )
    :vars
    (
      ?AUTO_1304 - TRUCK
      ?AUTO_1305 - LOCATION
      ?AUTO_1308 - CITY
      ?AUTO_1303 - LOCATION
      ?AUTO_1306 - LOCATION
      ?AUTO_1307 - LOCATION
      ?AUTO_1309 - AIRPLANE
      ?AUTO_1310 - TRUCK
      ?AUTO_1314 - LOCATION
      ?AUTO_1312 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1304 ?AUTO_1305 ) ( IN-CITY ?AUTO_1305 ?AUTO_1308 ) ( IN-CITY ?AUTO_1300 ?AUTO_1308 ) ( not ( = ?AUTO_1300 ?AUTO_1305 ) ) ( TRUCK-AT ?AUTO_1304 ?AUTO_1303 ) ( AIRPORT ?AUTO_1306 ) ( AIRPORT ?AUTO_1303 ) ( not ( = ?AUTO_1306 ?AUTO_1303 ) ) ( AIRPORT ?AUTO_1307 ) ( AIRPLANE-AT ?AUTO_1309 ?AUTO_1307 ) ( not ( = ?AUTO_1307 ?AUTO_1306 ) ) ( IN-TRUCK ?AUTO_1299 ?AUTO_1310 ) ( TRUCK-AT ?AUTO_1310 ?AUTO_1314 ) ( IN-CITY ?AUTO_1314 ?AUTO_1312 ) ( IN-CITY ?AUTO_1306 ?AUTO_1312 ) ( not ( = ?AUTO_1306 ?AUTO_1314 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1310 ?AUTO_1314 ?AUTO_1306 ?AUTO_1312 )
      ( DELIVER-PKG ?AUTO_1299 ?AUTO_1300 )
      ( DELIVER-PKG-VERIFY ?AUTO_1299 ?AUTO_1300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1315 - OBJ
      ?AUTO_1316 - LOCATION
    )
    :vars
    (
      ?AUTO_1321 - TRUCK
      ?AUTO_1318 - LOCATION
      ?AUTO_1322 - CITY
      ?AUTO_1325 - LOCATION
      ?AUTO_1323 - LOCATION
      ?AUTO_1324 - LOCATION
      ?AUTO_1317 - AIRPLANE
      ?AUTO_1326 - TRUCK
      ?AUTO_1327 - LOCATION
      ?AUTO_1328 - CITY
      ?AUTO_1330 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1321 ?AUTO_1318 ) ( IN-CITY ?AUTO_1318 ?AUTO_1322 ) ( IN-CITY ?AUTO_1316 ?AUTO_1322 ) ( not ( = ?AUTO_1316 ?AUTO_1318 ) ) ( TRUCK-AT ?AUTO_1321 ?AUTO_1325 ) ( AIRPORT ?AUTO_1323 ) ( AIRPORT ?AUTO_1325 ) ( not ( = ?AUTO_1323 ?AUTO_1325 ) ) ( AIRPORT ?AUTO_1324 ) ( AIRPLANE-AT ?AUTO_1317 ?AUTO_1324 ) ( not ( = ?AUTO_1324 ?AUTO_1323 ) ) ( TRUCK-AT ?AUTO_1326 ?AUTO_1327 ) ( IN-CITY ?AUTO_1327 ?AUTO_1328 ) ( IN-CITY ?AUTO_1323 ?AUTO_1328 ) ( not ( = ?AUTO_1323 ?AUTO_1327 ) ) ( TRUCK-AT ?AUTO_1326 ?AUTO_1330 ) ( OBJ-AT ?AUTO_1315 ?AUTO_1330 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1315 ?AUTO_1326 ?AUTO_1330 )
      ( DELIVER-PKG ?AUTO_1315 ?AUTO_1316 )
      ( DELIVER-PKG-VERIFY ?AUTO_1315 ?AUTO_1316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1332 - OBJ
      ?AUTO_1333 - LOCATION
    )
    :vars
    (
      ?AUTO_1338 - TRUCK
      ?AUTO_1334 - LOCATION
      ?AUTO_1346 - CITY
      ?AUTO_1340 - LOCATION
      ?AUTO_1343 - LOCATION
      ?AUTO_1341 - LOCATION
      ?AUTO_1335 - AIRPLANE
      ?AUTO_1342 - LOCATION
      ?AUTO_1344 - CITY
      ?AUTO_1339 - TRUCK
      ?AUTO_1350 - LOCATION
      ?AUTO_1348 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1338 ?AUTO_1334 ) ( IN-CITY ?AUTO_1334 ?AUTO_1346 ) ( IN-CITY ?AUTO_1333 ?AUTO_1346 ) ( not ( = ?AUTO_1333 ?AUTO_1334 ) ) ( TRUCK-AT ?AUTO_1338 ?AUTO_1340 ) ( AIRPORT ?AUTO_1343 ) ( AIRPORT ?AUTO_1340 ) ( not ( = ?AUTO_1343 ?AUTO_1340 ) ) ( AIRPORT ?AUTO_1341 ) ( AIRPLANE-AT ?AUTO_1335 ?AUTO_1341 ) ( not ( = ?AUTO_1341 ?AUTO_1343 ) ) ( IN-CITY ?AUTO_1342 ?AUTO_1344 ) ( IN-CITY ?AUTO_1343 ?AUTO_1344 ) ( not ( = ?AUTO_1343 ?AUTO_1342 ) ) ( OBJ-AT ?AUTO_1332 ?AUTO_1342 ) ( TRUCK-AT ?AUTO_1339 ?AUTO_1350 ) ( IN-CITY ?AUTO_1350 ?AUTO_1348 ) ( IN-CITY ?AUTO_1342 ?AUTO_1348 ) ( not ( = ?AUTO_1342 ?AUTO_1350 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1339 ?AUTO_1350 ?AUTO_1342 ?AUTO_1348 )
      ( DELIVER-PKG ?AUTO_1332 ?AUTO_1333 )
      ( DELIVER-PKG-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1787 - OBJ
      ?AUTO_1788 - LOCATION
    )
    :vars
    (
      ?AUTO_1790 - LOCATION
      ?AUTO_1789 - AIRPLANE
      ?AUTO_1791 - LOCATION
      ?AUTO_1794 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1790 ) ( AIRPORT ?AUTO_1788 ) ( AIRPLANE-AT ?AUTO_1789 ?AUTO_1790 ) ( not ( = ?AUTO_1790 ?AUTO_1788 ) ) ( AIRPLANE-AT ?AUTO_1789 ?AUTO_1791 ) ( TRUCK-AT ?AUTO_1794 ?AUTO_1791 ) ( IN-TRUCK ?AUTO_1787 ?AUTO_1794 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1787 ?AUTO_1794 ?AUTO_1791 )
      ( DELIVER-PKG ?AUTO_1787 ?AUTO_1788 )
      ( DELIVER-PKG-VERIFY ?AUTO_1787 ?AUTO_1788 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2141 - OBJ
      ?AUTO_2142 - LOCATION
    )
    :vars
    (
      ?AUTO_2147 - LOCATION
      ?AUTO_2145 - AIRPLANE
      ?AUTO_2146 - LOCATION
      ?AUTO_2148 - TRUCK
      ?AUTO_2152 - LOCATION
      ?AUTO_2150 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2147 ) ( AIRPORT ?AUTO_2142 ) ( AIRPLANE-AT ?AUTO_2145 ?AUTO_2147 ) ( not ( = ?AUTO_2147 ?AUTO_2142 ) ) ( AIRPLANE-AT ?AUTO_2145 ?AUTO_2146 ) ( IN-TRUCK ?AUTO_2141 ?AUTO_2148 ) ( TRUCK-AT ?AUTO_2148 ?AUTO_2152 ) ( IN-CITY ?AUTO_2152 ?AUTO_2150 ) ( IN-CITY ?AUTO_2146 ?AUTO_2150 ) ( not ( = ?AUTO_2146 ?AUTO_2152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2148 ?AUTO_2152 ?AUTO_2146 ?AUTO_2150 )
      ( DELIVER-PKG ?AUTO_2141 ?AUTO_2142 )
      ( DELIVER-PKG-VERIFY ?AUTO_2141 ?AUTO_2142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2155 - OBJ
      ?AUTO_2156 - LOCATION
    )
    :vars
    (
      ?AUTO_2164 - LOCATION
      ?AUTO_2157 - AIRPLANE
      ?AUTO_2158 - LOCATION
      ?AUTO_2163 - TRUCK
      ?AUTO_2160 - LOCATION
      ?AUTO_2161 - CITY
      ?AUTO_2166 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2164 ) ( AIRPORT ?AUTO_2156 ) ( AIRPLANE-AT ?AUTO_2157 ?AUTO_2164 ) ( not ( = ?AUTO_2164 ?AUTO_2156 ) ) ( AIRPLANE-AT ?AUTO_2157 ?AUTO_2158 ) ( TRUCK-AT ?AUTO_2163 ?AUTO_2160 ) ( IN-CITY ?AUTO_2160 ?AUTO_2161 ) ( IN-CITY ?AUTO_2158 ?AUTO_2161 ) ( not ( = ?AUTO_2158 ?AUTO_2160 ) ) ( TRUCK-AT ?AUTO_2163 ?AUTO_2166 ) ( OBJ-AT ?AUTO_2155 ?AUTO_2166 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2155 ?AUTO_2163 ?AUTO_2166 )
      ( DELIVER-PKG ?AUTO_2155 ?AUTO_2156 )
      ( DELIVER-PKG-VERIFY ?AUTO_2155 ?AUTO_2156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2168 - OBJ
      ?AUTO_2169 - LOCATION
    )
    :vars
    (
      ?AUTO_2173 - LOCATION
      ?AUTO_2172 - AIRPLANE
      ?AUTO_2174 - LOCATION
      ?AUTO_2178 - LOCATION
      ?AUTO_2175 - CITY
      ?AUTO_2176 - TRUCK
      ?AUTO_2182 - LOCATION
      ?AUTO_2180 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2173 ) ( AIRPORT ?AUTO_2169 ) ( AIRPLANE-AT ?AUTO_2172 ?AUTO_2173 ) ( not ( = ?AUTO_2173 ?AUTO_2169 ) ) ( AIRPLANE-AT ?AUTO_2172 ?AUTO_2174 ) ( IN-CITY ?AUTO_2178 ?AUTO_2175 ) ( IN-CITY ?AUTO_2174 ?AUTO_2175 ) ( not ( = ?AUTO_2174 ?AUTO_2178 ) ) ( OBJ-AT ?AUTO_2168 ?AUTO_2178 ) ( TRUCK-AT ?AUTO_2176 ?AUTO_2182 ) ( IN-CITY ?AUTO_2182 ?AUTO_2180 ) ( IN-CITY ?AUTO_2178 ?AUTO_2180 ) ( not ( = ?AUTO_2178 ?AUTO_2182 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2176 ?AUTO_2182 ?AUTO_2178 ?AUTO_2180 )
      ( DELIVER-PKG ?AUTO_2168 ?AUTO_2169 )
      ( DELIVER-PKG-VERIFY ?AUTO_2168 ?AUTO_2169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2185 - OBJ
      ?AUTO_2186 - LOCATION
    )
    :vars
    (
      ?AUTO_2196 - LOCATION
      ?AUTO_2194 - LOCATION
      ?AUTO_2195 - CITY
      ?AUTO_2189 - TRUCK
      ?AUTO_2188 - LOCATION
      ?AUTO_2187 - CITY
      ?AUTO_2199 - LOCATION
      ?AUTO_2191 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2196 ) ( AIRPORT ?AUTO_2186 ) ( not ( = ?AUTO_2196 ?AUTO_2186 ) ) ( IN-CITY ?AUTO_2194 ?AUTO_2195 ) ( IN-CITY ?AUTO_2196 ?AUTO_2195 ) ( not ( = ?AUTO_2196 ?AUTO_2194 ) ) ( OBJ-AT ?AUTO_2185 ?AUTO_2194 ) ( TRUCK-AT ?AUTO_2189 ?AUTO_2188 ) ( IN-CITY ?AUTO_2188 ?AUTO_2187 ) ( IN-CITY ?AUTO_2194 ?AUTO_2187 ) ( not ( = ?AUTO_2194 ?AUTO_2188 ) ) ( AIRPORT ?AUTO_2199 ) ( AIRPLANE-AT ?AUTO_2191 ?AUTO_2199 ) ( not ( = ?AUTO_2199 ?AUTO_2196 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2191 ?AUTO_2199 ?AUTO_2196 )
      ( DELIVER-PKG ?AUTO_2185 ?AUTO_2186 )
      ( DELIVER-PKG-VERIFY ?AUTO_2185 ?AUTO_2186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2429 - OBJ
      ?AUTO_2430 - LOCATION
    )
    :vars
    (
      ?AUTO_2431 - LOCATION
      ?AUTO_2436 - CITY
      ?AUTO_2433 - TRUCK
      ?AUTO_2432 - LOCATION
      ?AUTO_2434 - CITY
      ?AUTO_2438 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2431 ?AUTO_2436 ) ( IN-CITY ?AUTO_2430 ?AUTO_2436 ) ( not ( = ?AUTO_2430 ?AUTO_2431 ) ) ( TRUCK-AT ?AUTO_2433 ?AUTO_2432 ) ( IN-CITY ?AUTO_2432 ?AUTO_2434 ) ( IN-CITY ?AUTO_2431 ?AUTO_2434 ) ( not ( = ?AUTO_2431 ?AUTO_2432 ) ) ( IN-AIRPLANE ?AUTO_2429 ?AUTO_2438 ) ( AIRPLANE-AT ?AUTO_2438 ?AUTO_2431 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2429 ?AUTO_2438 ?AUTO_2431 )
      ( DELIVER-PKG ?AUTO_2429 ?AUTO_2430 )
      ( DELIVER-PKG-VERIFY ?AUTO_2429 ?AUTO_2430 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2503 - OBJ
      ?AUTO_2504 - LOCATION
    )
    :vars
    (
      ?AUTO_2509 - LOCATION
      ?AUTO_2511 - CITY
      ?AUTO_2510 - TRUCK
      ?AUTO_2508 - LOCATION
      ?AUTO_2514 - CITY
      ?AUTO_2505 - LOCATION
      ?AUTO_2506 - LOCATION
      ?AUTO_2507 - AIRPLANE
      ?AUTO_2515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2509 ?AUTO_2511 ) ( IN-CITY ?AUTO_2504 ?AUTO_2511 ) ( not ( = ?AUTO_2504 ?AUTO_2509 ) ) ( TRUCK-AT ?AUTO_2510 ?AUTO_2508 ) ( IN-CITY ?AUTO_2508 ?AUTO_2514 ) ( IN-CITY ?AUTO_2509 ?AUTO_2514 ) ( not ( = ?AUTO_2509 ?AUTO_2508 ) ) ( AIRPORT ?AUTO_2505 ) ( AIRPORT ?AUTO_2509 ) ( not ( = ?AUTO_2505 ?AUTO_2509 ) ) ( AIRPORT ?AUTO_2506 ) ( AIRPLANE-AT ?AUTO_2507 ?AUTO_2506 ) ( not ( = ?AUTO_2506 ?AUTO_2505 ) ) ( TRUCK-AT ?AUTO_2515 ?AUTO_2505 ) ( IN-TRUCK ?AUTO_2503 ?AUTO_2515 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2503 ?AUTO_2515 ?AUTO_2505 )
      ( DELIVER-PKG ?AUTO_2503 ?AUTO_2504 )
      ( DELIVER-PKG-VERIFY ?AUTO_2503 ?AUTO_2504 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2518 - OBJ
      ?AUTO_2519 - LOCATION
    )
    :vars
    (
      ?AUTO_2529 - LOCATION
      ?AUTO_2527 - CITY
      ?AUTO_2528 - TRUCK
      ?AUTO_2525 - LOCATION
      ?AUTO_2524 - CITY
      ?AUTO_2526 - LOCATION
      ?AUTO_2523 - LOCATION
      ?AUTO_2522 - AIRPLANE
      ?AUTO_2530 - TRUCK
      ?AUTO_2534 - LOCATION
      ?AUTO_2532 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2529 ?AUTO_2527 ) ( IN-CITY ?AUTO_2519 ?AUTO_2527 ) ( not ( = ?AUTO_2519 ?AUTO_2529 ) ) ( TRUCK-AT ?AUTO_2528 ?AUTO_2525 ) ( IN-CITY ?AUTO_2525 ?AUTO_2524 ) ( IN-CITY ?AUTO_2529 ?AUTO_2524 ) ( not ( = ?AUTO_2529 ?AUTO_2525 ) ) ( AIRPORT ?AUTO_2526 ) ( AIRPORT ?AUTO_2529 ) ( not ( = ?AUTO_2526 ?AUTO_2529 ) ) ( AIRPORT ?AUTO_2523 ) ( AIRPLANE-AT ?AUTO_2522 ?AUTO_2523 ) ( not ( = ?AUTO_2523 ?AUTO_2526 ) ) ( IN-TRUCK ?AUTO_2518 ?AUTO_2530 ) ( TRUCK-AT ?AUTO_2530 ?AUTO_2534 ) ( IN-CITY ?AUTO_2534 ?AUTO_2532 ) ( IN-CITY ?AUTO_2526 ?AUTO_2532 ) ( not ( = ?AUTO_2526 ?AUTO_2534 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2530 ?AUTO_2534 ?AUTO_2526 ?AUTO_2532 )
      ( DELIVER-PKG ?AUTO_2518 ?AUTO_2519 )
      ( DELIVER-PKG-VERIFY ?AUTO_2518 ?AUTO_2519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2545 - OBJ
      ?AUTO_2546 - LOCATION
    )
    :vars
    (
      ?AUTO_2547 - LOCATION
      ?AUTO_2550 - CITY
      ?AUTO_2551 - TRUCK
      ?AUTO_2555 - LOCATION
      ?AUTO_2559 - CITY
      ?AUTO_2558 - LOCATION
      ?AUTO_2549 - LOCATION
      ?AUTO_2553 - AIRPLANE
      ?AUTO_2554 - TRUCK
      ?AUTO_2557 - LOCATION
      ?AUTO_2556 - CITY
      ?AUTO_2561 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2547 ?AUTO_2550 ) ( IN-CITY ?AUTO_2546 ?AUTO_2550 ) ( not ( = ?AUTO_2546 ?AUTO_2547 ) ) ( TRUCK-AT ?AUTO_2551 ?AUTO_2555 ) ( IN-CITY ?AUTO_2555 ?AUTO_2559 ) ( IN-CITY ?AUTO_2547 ?AUTO_2559 ) ( not ( = ?AUTO_2547 ?AUTO_2555 ) ) ( AIRPORT ?AUTO_2558 ) ( AIRPORT ?AUTO_2547 ) ( not ( = ?AUTO_2558 ?AUTO_2547 ) ) ( AIRPORT ?AUTO_2549 ) ( AIRPLANE-AT ?AUTO_2553 ?AUTO_2549 ) ( not ( = ?AUTO_2549 ?AUTO_2558 ) ) ( TRUCK-AT ?AUTO_2554 ?AUTO_2557 ) ( IN-CITY ?AUTO_2557 ?AUTO_2556 ) ( IN-CITY ?AUTO_2558 ?AUTO_2556 ) ( not ( = ?AUTO_2558 ?AUTO_2557 ) ) ( TRUCK-AT ?AUTO_2554 ?AUTO_2561 ) ( OBJ-AT ?AUTO_2545 ?AUTO_2561 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2545 ?AUTO_2554 ?AUTO_2561 )
      ( DELIVER-PKG ?AUTO_2545 ?AUTO_2546 )
      ( DELIVER-PKG-VERIFY ?AUTO_2545 ?AUTO_2546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2812 - OBJ
      ?AUTO_2813 - LOCATION
    )
    :vars
    (
      ?AUTO_2820 - LOCATION
      ?AUTO_2816 - CITY
      ?AUTO_2819 - TRUCK
      ?AUTO_2815 - LOCATION
      ?AUTO_2821 - CITY
      ?AUTO_2823 - LOCATION
      ?AUTO_2817 - AIRPLANE
      ?AUTO_2818 - LOCATION
      ?AUTO_2824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2820 ?AUTO_2816 ) ( IN-CITY ?AUTO_2813 ?AUTO_2816 ) ( not ( = ?AUTO_2813 ?AUTO_2820 ) ) ( TRUCK-AT ?AUTO_2819 ?AUTO_2815 ) ( IN-CITY ?AUTO_2815 ?AUTO_2821 ) ( IN-CITY ?AUTO_2820 ?AUTO_2821 ) ( not ( = ?AUTO_2820 ?AUTO_2815 ) ) ( AIRPORT ?AUTO_2823 ) ( AIRPORT ?AUTO_2820 ) ( AIRPLANE-AT ?AUTO_2817 ?AUTO_2823 ) ( not ( = ?AUTO_2823 ?AUTO_2820 ) ) ( AIRPLANE-AT ?AUTO_2817 ?AUTO_2818 ) ( TRUCK-AT ?AUTO_2824 ?AUTO_2818 ) ( IN-TRUCK ?AUTO_2812 ?AUTO_2824 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2812 ?AUTO_2824 ?AUTO_2818 )
      ( DELIVER-PKG ?AUTO_2812 ?AUTO_2813 )
      ( DELIVER-PKG-VERIFY ?AUTO_2812 ?AUTO_2813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2829 - OBJ
      ?AUTO_2830 - LOCATION
    )
    :vars
    (
      ?AUTO_2834 - LOCATION
      ?AUTO_2833 - CITY
      ?AUTO_2832 - TRUCK
      ?AUTO_2838 - LOCATION
      ?AUTO_2840 - CITY
      ?AUTO_2841 - LOCATION
      ?AUTO_2836 - AIRPLANE
      ?AUTO_2839 - LOCATION
      ?AUTO_2831 - TRUCK
      ?AUTO_2845 - LOCATION
      ?AUTO_2843 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2834 ?AUTO_2833 ) ( IN-CITY ?AUTO_2830 ?AUTO_2833 ) ( not ( = ?AUTO_2830 ?AUTO_2834 ) ) ( TRUCK-AT ?AUTO_2832 ?AUTO_2838 ) ( IN-CITY ?AUTO_2838 ?AUTO_2840 ) ( IN-CITY ?AUTO_2834 ?AUTO_2840 ) ( not ( = ?AUTO_2834 ?AUTO_2838 ) ) ( AIRPORT ?AUTO_2841 ) ( AIRPORT ?AUTO_2834 ) ( AIRPLANE-AT ?AUTO_2836 ?AUTO_2841 ) ( not ( = ?AUTO_2841 ?AUTO_2834 ) ) ( AIRPLANE-AT ?AUTO_2836 ?AUTO_2839 ) ( IN-TRUCK ?AUTO_2829 ?AUTO_2831 ) ( TRUCK-AT ?AUTO_2831 ?AUTO_2845 ) ( IN-CITY ?AUTO_2845 ?AUTO_2843 ) ( IN-CITY ?AUTO_2839 ?AUTO_2843 ) ( not ( = ?AUTO_2839 ?AUTO_2845 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2831 ?AUTO_2845 ?AUTO_2839 ?AUTO_2843 )
      ( DELIVER-PKG ?AUTO_2829 ?AUTO_2830 )
      ( DELIVER-PKG-VERIFY ?AUTO_2829 ?AUTO_2830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2846 - OBJ
      ?AUTO_2847 - LOCATION
    )
    :vars
    (
      ?AUTO_2858 - LOCATION
      ?AUTO_2852 - CITY
      ?AUTO_2854 - TRUCK
      ?AUTO_2856 - LOCATION
      ?AUTO_2855 - CITY
      ?AUTO_2853 - LOCATION
      ?AUTO_2850 - AIRPLANE
      ?AUTO_2857 - LOCATION
      ?AUTO_2851 - TRUCK
      ?AUTO_2860 - LOCATION
      ?AUTO_2859 - CITY
      ?AUTO_2862 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2858 ?AUTO_2852 ) ( IN-CITY ?AUTO_2847 ?AUTO_2852 ) ( not ( = ?AUTO_2847 ?AUTO_2858 ) ) ( TRUCK-AT ?AUTO_2854 ?AUTO_2856 ) ( IN-CITY ?AUTO_2856 ?AUTO_2855 ) ( IN-CITY ?AUTO_2858 ?AUTO_2855 ) ( not ( = ?AUTO_2858 ?AUTO_2856 ) ) ( AIRPORT ?AUTO_2853 ) ( AIRPORT ?AUTO_2858 ) ( AIRPLANE-AT ?AUTO_2850 ?AUTO_2853 ) ( not ( = ?AUTO_2853 ?AUTO_2858 ) ) ( AIRPLANE-AT ?AUTO_2850 ?AUTO_2857 ) ( TRUCK-AT ?AUTO_2851 ?AUTO_2860 ) ( IN-CITY ?AUTO_2860 ?AUTO_2859 ) ( IN-CITY ?AUTO_2857 ?AUTO_2859 ) ( not ( = ?AUTO_2857 ?AUTO_2860 ) ) ( TRUCK-AT ?AUTO_2851 ?AUTO_2862 ) ( OBJ-AT ?AUTO_2846 ?AUTO_2862 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2846 ?AUTO_2851 ?AUTO_2862 )
      ( DELIVER-PKG ?AUTO_2846 ?AUTO_2847 )
      ( DELIVER-PKG-VERIFY ?AUTO_2846 ?AUTO_2847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2866 - OBJ
      ?AUTO_2867 - LOCATION
    )
    :vars
    (
      ?AUTO_2881 - LOCATION
      ?AUTO_2868 - CITY
      ?AUTO_2876 - TRUCK
      ?AUTO_2873 - LOCATION
      ?AUTO_2879 - CITY
      ?AUTO_2880 - LOCATION
      ?AUTO_2869 - AIRPLANE
      ?AUTO_2875 - LOCATION
      ?AUTO_2871 - LOCATION
      ?AUTO_2878 - CITY
      ?AUTO_2877 - TRUCK
      ?AUTO_2885 - LOCATION
      ?AUTO_2883 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2881 ?AUTO_2868 ) ( IN-CITY ?AUTO_2867 ?AUTO_2868 ) ( not ( = ?AUTO_2867 ?AUTO_2881 ) ) ( TRUCK-AT ?AUTO_2876 ?AUTO_2873 ) ( IN-CITY ?AUTO_2873 ?AUTO_2879 ) ( IN-CITY ?AUTO_2881 ?AUTO_2879 ) ( not ( = ?AUTO_2881 ?AUTO_2873 ) ) ( AIRPORT ?AUTO_2880 ) ( AIRPORT ?AUTO_2881 ) ( AIRPLANE-AT ?AUTO_2869 ?AUTO_2880 ) ( not ( = ?AUTO_2880 ?AUTO_2881 ) ) ( AIRPLANE-AT ?AUTO_2869 ?AUTO_2875 ) ( IN-CITY ?AUTO_2871 ?AUTO_2878 ) ( IN-CITY ?AUTO_2875 ?AUTO_2878 ) ( not ( = ?AUTO_2875 ?AUTO_2871 ) ) ( OBJ-AT ?AUTO_2866 ?AUTO_2871 ) ( TRUCK-AT ?AUTO_2877 ?AUTO_2885 ) ( IN-CITY ?AUTO_2885 ?AUTO_2883 ) ( IN-CITY ?AUTO_2871 ?AUTO_2883 ) ( not ( = ?AUTO_2871 ?AUTO_2885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2877 ?AUTO_2885 ?AUTO_2871 ?AUTO_2883 )
      ( DELIVER-PKG ?AUTO_2866 ?AUTO_2867 )
      ( DELIVER-PKG-VERIFY ?AUTO_2866 ?AUTO_2867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2888 - OBJ
      ?AUTO_2889 - LOCATION
    )
    :vars
    (
      ?AUTO_2898 - LOCATION
      ?AUTO_2901 - CITY
      ?AUTO_2897 - TRUCK
      ?AUTO_2903 - LOCATION
      ?AUTO_2891 - CITY
      ?AUTO_2902 - LOCATION
      ?AUTO_2896 - LOCATION
      ?AUTO_2892 - CITY
      ?AUTO_2890 - TRUCK
      ?AUTO_2895 - LOCATION
      ?AUTO_2893 - CITY
      ?AUTO_2907 - LOCATION
      ?AUTO_2899 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2898 ?AUTO_2901 ) ( IN-CITY ?AUTO_2889 ?AUTO_2901 ) ( not ( = ?AUTO_2889 ?AUTO_2898 ) ) ( TRUCK-AT ?AUTO_2897 ?AUTO_2903 ) ( IN-CITY ?AUTO_2903 ?AUTO_2891 ) ( IN-CITY ?AUTO_2898 ?AUTO_2891 ) ( not ( = ?AUTO_2898 ?AUTO_2903 ) ) ( AIRPORT ?AUTO_2902 ) ( AIRPORT ?AUTO_2898 ) ( not ( = ?AUTO_2902 ?AUTO_2898 ) ) ( IN-CITY ?AUTO_2896 ?AUTO_2892 ) ( IN-CITY ?AUTO_2902 ?AUTO_2892 ) ( not ( = ?AUTO_2902 ?AUTO_2896 ) ) ( OBJ-AT ?AUTO_2888 ?AUTO_2896 ) ( TRUCK-AT ?AUTO_2890 ?AUTO_2895 ) ( IN-CITY ?AUTO_2895 ?AUTO_2893 ) ( IN-CITY ?AUTO_2896 ?AUTO_2893 ) ( not ( = ?AUTO_2896 ?AUTO_2895 ) ) ( AIRPORT ?AUTO_2907 ) ( AIRPLANE-AT ?AUTO_2899 ?AUTO_2907 ) ( not ( = ?AUTO_2907 ?AUTO_2902 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2899 ?AUTO_2907 ?AUTO_2902 )
      ( DELIVER-PKG ?AUTO_2888 ?AUTO_2889 )
      ( DELIVER-PKG-VERIFY ?AUTO_2888 ?AUTO_2889 ) )
  )

)

