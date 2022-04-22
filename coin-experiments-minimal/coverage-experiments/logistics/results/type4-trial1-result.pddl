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
      ?AUTO_8 - LOCATION
      ?AUTO_9 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5 ?AUTO_7 ) ( TRUCK-AT ?AUTO_7 ?AUTO_8 ) ( IN-CITY ?AUTO_8 ?AUTO_9 ) ( IN-CITY ?AUTO_6 ?AUTO_9 ) ( not ( = ?AUTO_6 ?AUTO_8 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7 ?AUTO_8 ?AUTO_6 ?AUTO_9 )
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
      ?AUTO_14 - TRUCK
      ?AUTO_13 - LOCATION
      ?AUTO_12 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_14 ?AUTO_13 ) ( IN-CITY ?AUTO_13 ?AUTO_12 ) ( IN-CITY ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( OBJ-AT ?AUTO_10 ?AUTO_13 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10 ?AUTO_14 ?AUTO_13 )
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
      ?AUTO_36 - LOCATION
      ?AUTO_37 - AIRPLANE
      ?AUTO_38 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_35 ) ( AIRPORT ?AUTO_34 ) ( not ( = ?AUTO_35 ?AUTO_34 ) ) ( AIRPORT ?AUTO_36 ) ( AIRPLANE-AT ?AUTO_37 ?AUTO_36 ) ( not ( = ?AUTO_36 ?AUTO_35 ) ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( TRUCK-AT ?AUTO_38 ?AUTO_35 ) ( IN-TRUCK ?AUTO_33 ?AUTO_38 ) )
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
      ?AUTO_42 - LOCATION
      ?AUTO_43 - AIRPLANE
      ?AUTO_44 - TRUCK
      ?AUTO_45 - LOCATION
      ?AUTO_46 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_41 ) ( AIRPORT ?AUTO_40 ) ( not ( = ?AUTO_41 ?AUTO_40 ) ) ( AIRPORT ?AUTO_42 ) ( AIRPLANE-AT ?AUTO_43 ?AUTO_42 ) ( not ( = ?AUTO_42 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_42 ) ) ( IN-TRUCK ?AUTO_39 ?AUTO_44 ) ( TRUCK-AT ?AUTO_44 ?AUTO_45 ) ( IN-CITY ?AUTO_45 ?AUTO_46 ) ( IN-CITY ?AUTO_41 ?AUTO_46 ) ( not ( = ?AUTO_41 ?AUTO_45 ) ) ( not ( = ?AUTO_40 ?AUTO_45 ) ) ( not ( = ?AUTO_42 ?AUTO_45 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_44 ?AUTO_45 ?AUTO_41 ?AUTO_46 )
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
      ?AUTO_51 - LOCATION
      ?AUTO_50 - LOCATION
      ?AUTO_53 - AIRPLANE
      ?AUTO_49 - TRUCK
      ?AUTO_52 - LOCATION
      ?AUTO_54 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_51 ) ( AIRPORT ?AUTO_48 ) ( not ( = ?AUTO_51 ?AUTO_48 ) ) ( AIRPORT ?AUTO_50 ) ( AIRPLANE-AT ?AUTO_53 ?AUTO_50 ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( not ( = ?AUTO_48 ?AUTO_50 ) ) ( TRUCK-AT ?AUTO_49 ?AUTO_52 ) ( IN-CITY ?AUTO_52 ?AUTO_54 ) ( IN-CITY ?AUTO_51 ?AUTO_54 ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) ( not ( = ?AUTO_48 ?AUTO_52 ) ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( OBJ-AT ?AUTO_47 ?AUTO_52 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_47 ?AUTO_49 ?AUTO_52 )
      ( DELIVER-PKG ?AUTO_47 ?AUTO_48 )
      ( DELIVER-PKG-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_57 - OBJ
      ?AUTO_58 - LOCATION
    )
    :vars
    (
      ?AUTO_59 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_57 ?AUTO_59 ) ( AIRPLANE-AT ?AUTO_59 ?AUTO_58 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_57 ?AUTO_59 ?AUTO_58 )
      ( DELIVER-PKG-VERIFY ?AUTO_57 ?AUTO_58 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_62 - AIRPLANE
      ?AUTO_63 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_60 ?AUTO_62 ) ( AIRPORT ?AUTO_63 ) ( AIRPORT ?AUTO_61 ) ( AIRPLANE-AT ?AUTO_62 ?AUTO_63 ) ( not ( = ?AUTO_63 ?AUTO_61 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_62 ?AUTO_63 ?AUTO_61 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_78 - OBJ
      ?AUTO_79 - LOCATION
    )
    :vars
    (
      ?AUTO_80 - LOCATION
      ?AUTO_81 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_80 ) ( AIRPORT ?AUTO_79 ) ( AIRPLANE-AT ?AUTO_81 ?AUTO_80 ) ( not ( = ?AUTO_80 ?AUTO_79 ) ) ( OBJ-AT ?AUTO_78 ?AUTO_80 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_78 ?AUTO_81 ?AUTO_80 )
      ( DELIVER-PKG ?AUTO_78 ?AUTO_79 )
      ( DELIVER-PKG-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_92 - OBJ
      ?AUTO_93 - LOCATION
    )
    :vars
    (
      ?AUTO_94 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_94 ?AUTO_93 ) ( IN-TRUCK ?AUTO_92 ?AUTO_94 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_92 ?AUTO_94 ?AUTO_93 )
      ( DELIVER-PKG-VERIFY ?AUTO_92 ?AUTO_93 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_95 - OBJ
      ?AUTO_96 - LOCATION
    )
    :vars
    (
      ?AUTO_97 - TRUCK
      ?AUTO_98 - LOCATION
      ?AUTO_99 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_95 ?AUTO_97 ) ( TRUCK-AT ?AUTO_97 ?AUTO_98 ) ( IN-CITY ?AUTO_98 ?AUTO_99 ) ( IN-CITY ?AUTO_96 ?AUTO_99 ) ( not ( = ?AUTO_96 ?AUTO_98 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_97 ?AUTO_98 ?AUTO_96 ?AUTO_99 )
      ( DELIVER-PKG ?AUTO_95 ?AUTO_96 )
      ( DELIVER-PKG-VERIFY ?AUTO_95 ?AUTO_96 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_126 - OBJ
      ?AUTO_127 - LOCATION
    )
    :vars
    (
      ?AUTO_130 - TRUCK
      ?AUTO_128 - LOCATION
      ?AUTO_129 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_130 ?AUTO_128 ) ( IN-CITY ?AUTO_128 ?AUTO_129 ) ( IN-CITY ?AUTO_127 ?AUTO_129 ) ( not ( = ?AUTO_127 ?AUTO_128 ) ) ( OBJ-AT ?AUTO_126 ?AUTO_128 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_126 ?AUTO_130 ?AUTO_128 )
      ( DELIVER-PKG ?AUTO_126 ?AUTO_127 )
      ( DELIVER-PKG-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_133 - OBJ
      ?AUTO_134 - LOCATION
    )
    :vars
    (
      ?AUTO_135 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_135 ?AUTO_134 ) ( IN-TRUCK ?AUTO_133 ?AUTO_135 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_133 ?AUTO_135 ?AUTO_134 )
      ( DELIVER-PKG-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_160 - OBJ
      ?AUTO_161 - LOCATION
    )
    :vars
    (
      ?AUTO_162 - TRUCK
      ?AUTO_163 - LOCATION
      ?AUTO_164 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_162 ?AUTO_163 ) ( IN-CITY ?AUTO_163 ?AUTO_164 ) ( IN-CITY ?AUTO_161 ?AUTO_164 ) ( not ( = ?AUTO_161 ?AUTO_163 ) ) ( OBJ-AT ?AUTO_160 ?AUTO_163 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_160 ?AUTO_162 ?AUTO_163 )
      ( DELIVER-PKG ?AUTO_160 ?AUTO_161 )
      ( DELIVER-PKG-VERIFY ?AUTO_160 ?AUTO_161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_165 - OBJ
      ?AUTO_166 - LOCATION
    )
    :vars
    (
      ?AUTO_168 - LOCATION
      ?AUTO_169 - CITY
      ?AUTO_167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_168 ?AUTO_169 ) ( IN-CITY ?AUTO_166 ?AUTO_169 ) ( not ( = ?AUTO_166 ?AUTO_168 ) ) ( OBJ-AT ?AUTO_165 ?AUTO_168 ) ( TRUCK-AT ?AUTO_167 ?AUTO_166 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_167 ?AUTO_166 ?AUTO_168 ?AUTO_169 )
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
      ?AUTO_174 - LOCATION
      ?AUTO_172 - CITY
      ?AUTO_173 - TRUCK
      ?AUTO_175 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_174 ?AUTO_172 ) ( IN-CITY ?AUTO_171 ?AUTO_172 ) ( not ( = ?AUTO_171 ?AUTO_174 ) ) ( OBJ-AT ?AUTO_170 ?AUTO_174 ) ( TRUCK-AT ?AUTO_173 ?AUTO_175 ) ( IN-CITY ?AUTO_175 ?AUTO_172 ) ( not ( = ?AUTO_171 ?AUTO_175 ) ) ( not ( = ?AUTO_174 ?AUTO_175 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_173 ?AUTO_175 ?AUTO_171 ?AUTO_172 )
      ( DELIVER-PKG ?AUTO_170 ?AUTO_171 )
      ( DELIVER-PKG-VERIFY ?AUTO_170 ?AUTO_171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_180 - OBJ
      ?AUTO_181 - LOCATION
    )
    :vars
    (
      ?AUTO_182 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_180 ?AUTO_182 ) ( AIRPLANE-AT ?AUTO_182 ?AUTO_181 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_180 ?AUTO_182 ?AUTO_181 )
      ( DELIVER-PKG-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_185 - OBJ
      ?AUTO_186 - LOCATION
    )
    :vars
    (
      ?AUTO_187 - AIRPLANE
      ?AUTO_188 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_185 ?AUTO_187 ) ( AIRPORT ?AUTO_188 ) ( AIRPORT ?AUTO_186 ) ( AIRPLANE-AT ?AUTO_187 ?AUTO_188 ) ( not ( = ?AUTO_188 ?AUTO_186 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_187 ?AUTO_188 ?AUTO_186 )
      ( DELIVER-PKG ?AUTO_185 ?AUTO_186 )
      ( DELIVER-PKG-VERIFY ?AUTO_185 ?AUTO_186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_211 - OBJ
      ?AUTO_212 - LOCATION
    )
    :vars
    (
      ?AUTO_214 - LOCATION
      ?AUTO_213 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_214 ) ( AIRPORT ?AUTO_212 ) ( AIRPLANE-AT ?AUTO_213 ?AUTO_214 ) ( not ( = ?AUTO_214 ?AUTO_212 ) ) ( OBJ-AT ?AUTO_211 ?AUTO_214 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_211 ?AUTO_213 ?AUTO_214 )
      ( DELIVER-PKG ?AUTO_211 ?AUTO_212 )
      ( DELIVER-PKG-VERIFY ?AUTO_211 ?AUTO_212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_218 - LOCATION
      ?AUTO_219 - LOCATION
      ?AUTO_217 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_218 ) ( AIRPORT ?AUTO_216 ) ( not ( = ?AUTO_218 ?AUTO_216 ) ) ( OBJ-AT ?AUTO_215 ?AUTO_218 ) ( AIRPORT ?AUTO_219 ) ( AIRPLANE-AT ?AUTO_217 ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_218 ) ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_217 ?AUTO_219 ?AUTO_218 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_238 - OBJ
      ?AUTO_239 - LOCATION
    )
    :vars
    (
      ?AUTO_240 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_238 ?AUTO_240 ) ( AIRPLANE-AT ?AUTO_240 ?AUTO_239 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_238 ?AUTO_240 ?AUTO_239 )
      ( DELIVER-PKG-VERIFY ?AUTO_238 ?AUTO_239 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_251 - OBJ
      ?AUTO_252 - LOCATION
    )
    :vars
    (
      ?AUTO_253 - LOCATION
      ?AUTO_254 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_253 ) ( AIRPORT ?AUTO_252 ) ( AIRPLANE-AT ?AUTO_254 ?AUTO_253 ) ( not ( = ?AUTO_253 ?AUTO_252 ) ) ( OBJ-AT ?AUTO_251 ?AUTO_253 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_251 ?AUTO_254 ?AUTO_253 )
      ( DELIVER-PKG ?AUTO_251 ?AUTO_252 )
      ( DELIVER-PKG-VERIFY ?AUTO_251 ?AUTO_252 ) )
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
      ?AUTO_269 - LOCATION
      ?AUTO_270 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_266 ) ( AIRPORT ?AUTO_265 ) ( AIRPLANE-AT ?AUTO_268 ?AUTO_266 ) ( not ( = ?AUTO_266 ?AUTO_265 ) ) ( IN-TRUCK ?AUTO_264 ?AUTO_267 ) ( TRUCK-AT ?AUTO_267 ?AUTO_269 ) ( IN-CITY ?AUTO_269 ?AUTO_270 ) ( IN-CITY ?AUTO_266 ?AUTO_270 ) ( not ( = ?AUTO_266 ?AUTO_269 ) ) ( not ( = ?AUTO_265 ?AUTO_269 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_267 ?AUTO_269 ?AUTO_266 ?AUTO_270 )
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
      ?AUTO_292 - LOCATION
      ?AUTO_289 - TRUCK
      ?AUTO_291 - LOCATION
      ?AUTO_290 - CITY
      ?AUTO_294 - LOCATION
      ?AUTO_293 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_292 ) ( AIRPORT ?AUTO_288 ) ( not ( = ?AUTO_292 ?AUTO_288 ) ) ( IN-TRUCK ?AUTO_287 ?AUTO_289 ) ( TRUCK-AT ?AUTO_289 ?AUTO_291 ) ( IN-CITY ?AUTO_291 ?AUTO_290 ) ( IN-CITY ?AUTO_292 ?AUTO_290 ) ( not ( = ?AUTO_292 ?AUTO_291 ) ) ( not ( = ?AUTO_288 ?AUTO_291 ) ) ( AIRPORT ?AUTO_294 ) ( AIRPLANE-AT ?AUTO_293 ?AUTO_294 ) ( not ( = ?AUTO_294 ?AUTO_292 ) ) ( not ( = ?AUTO_288 ?AUTO_294 ) ) ( not ( = ?AUTO_291 ?AUTO_294 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_293 ?AUTO_294 ?AUTO_292 )
      ( DELIVER-PKG ?AUTO_287 ?AUTO_288 )
      ( DELIVER-PKG-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_297 - OBJ
      ?AUTO_298 - LOCATION
    )
    :vars
    (
      ?AUTO_304 - LOCATION
      ?AUTO_303 - TRUCK
      ?AUTO_301 - LOCATION
      ?AUTO_299 - CITY
      ?AUTO_300 - LOCATION
      ?AUTO_302 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_304 ) ( AIRPORT ?AUTO_298 ) ( not ( = ?AUTO_304 ?AUTO_298 ) ) ( TRUCK-AT ?AUTO_303 ?AUTO_301 ) ( IN-CITY ?AUTO_301 ?AUTO_299 ) ( IN-CITY ?AUTO_304 ?AUTO_299 ) ( not ( = ?AUTO_304 ?AUTO_301 ) ) ( not ( = ?AUTO_298 ?AUTO_301 ) ) ( AIRPORT ?AUTO_300 ) ( AIRPLANE-AT ?AUTO_302 ?AUTO_300 ) ( not ( = ?AUTO_300 ?AUTO_304 ) ) ( not ( = ?AUTO_298 ?AUTO_300 ) ) ( not ( = ?AUTO_301 ?AUTO_300 ) ) ( OBJ-AT ?AUTO_297 ?AUTO_301 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_297 ?AUTO_303 ?AUTO_301 )
      ( DELIVER-PKG ?AUTO_297 ?AUTO_298 )
      ( DELIVER-PKG-VERIFY ?AUTO_297 ?AUTO_298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_305 - OBJ
      ?AUTO_306 - LOCATION
    )
    :vars
    (
      ?AUTO_310 - LOCATION
      ?AUTO_308 - LOCATION
      ?AUTO_312 - CITY
      ?AUTO_309 - LOCATION
      ?AUTO_307 - AIRPLANE
      ?AUTO_311 - TRUCK
      ?AUTO_313 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_310 ) ( AIRPORT ?AUTO_306 ) ( not ( = ?AUTO_310 ?AUTO_306 ) ) ( IN-CITY ?AUTO_308 ?AUTO_312 ) ( IN-CITY ?AUTO_310 ?AUTO_312 ) ( not ( = ?AUTO_310 ?AUTO_308 ) ) ( not ( = ?AUTO_306 ?AUTO_308 ) ) ( AIRPORT ?AUTO_309 ) ( AIRPLANE-AT ?AUTO_307 ?AUTO_309 ) ( not ( = ?AUTO_309 ?AUTO_310 ) ) ( not ( = ?AUTO_306 ?AUTO_309 ) ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) ( OBJ-AT ?AUTO_305 ?AUTO_308 ) ( TRUCK-AT ?AUTO_311 ?AUTO_313 ) ( IN-CITY ?AUTO_313 ?AUTO_312 ) ( not ( = ?AUTO_308 ?AUTO_313 ) ) ( not ( = ?AUTO_306 ?AUTO_313 ) ) ( not ( = ?AUTO_310 ?AUTO_313 ) ) ( not ( = ?AUTO_309 ?AUTO_313 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_311 ?AUTO_313 ?AUTO_308 ?AUTO_312 )
      ( DELIVER-PKG ?AUTO_305 ?AUTO_306 )
      ( DELIVER-PKG-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_320 - OBJ
      ?AUTO_321 - LOCATION
    )
    :vars
    (
      ?AUTO_322 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_322 ?AUTO_321 ) ( IN-TRUCK ?AUTO_320 ?AUTO_322 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_320 ?AUTO_322 ?AUTO_321 )
      ( DELIVER-PKG-VERIFY ?AUTO_320 ?AUTO_321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_337 - OBJ
      ?AUTO_338 - LOCATION
    )
    :vars
    (
      ?AUTO_339 - TRUCK
      ?AUTO_340 - LOCATION
      ?AUTO_341 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_337 ?AUTO_339 ) ( TRUCK-AT ?AUTO_339 ?AUTO_340 ) ( IN-CITY ?AUTO_340 ?AUTO_341 ) ( IN-CITY ?AUTO_338 ?AUTO_341 ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_339 ?AUTO_340 ?AUTO_338 ?AUTO_341 )
      ( DELIVER-PKG ?AUTO_337 ?AUTO_338 )
      ( DELIVER-PKG-VERIFY ?AUTO_337 ?AUTO_338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_342 - OBJ
      ?AUTO_343 - LOCATION
    )
    :vars
    (
      ?AUTO_344 - TRUCK
      ?AUTO_345 - LOCATION
      ?AUTO_346 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_344 ?AUTO_345 ) ( IN-CITY ?AUTO_345 ?AUTO_346 ) ( IN-CITY ?AUTO_343 ?AUTO_346 ) ( not ( = ?AUTO_343 ?AUTO_345 ) ) ( OBJ-AT ?AUTO_342 ?AUTO_345 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_342 ?AUTO_344 ?AUTO_345 )
      ( DELIVER-PKG ?AUTO_342 ?AUTO_343 )
      ( DELIVER-PKG-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_355 - OBJ
      ?AUTO_356 - LOCATION
    )
    :vars
    (
      ?AUTO_358 - LOCATION
      ?AUTO_357 - CITY
      ?AUTO_359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_358 ?AUTO_357 ) ( IN-CITY ?AUTO_356 ?AUTO_357 ) ( not ( = ?AUTO_356 ?AUTO_358 ) ) ( OBJ-AT ?AUTO_355 ?AUTO_358 ) ( TRUCK-AT ?AUTO_359 ?AUTO_356 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_359 ?AUTO_356 ?AUTO_358 ?AUTO_357 )
      ( DELIVER-PKG ?AUTO_355 ?AUTO_356 )
      ( DELIVER-PKG-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_360 - OBJ
      ?AUTO_361 - LOCATION
    )
    :vars
    (
      ?AUTO_363 - LOCATION
      ?AUTO_362 - CITY
      ?AUTO_364 - TRUCK
      ?AUTO_365 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_363 ?AUTO_362 ) ( IN-CITY ?AUTO_361 ?AUTO_362 ) ( not ( = ?AUTO_361 ?AUTO_363 ) ) ( TRUCK-AT ?AUTO_364 ?AUTO_361 ) ( IN-AIRPLANE ?AUTO_360 ?AUTO_365 ) ( AIRPLANE-AT ?AUTO_365 ?AUTO_363 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_360 ?AUTO_365 ?AUTO_363 )
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
      ?AUTO_369 - LOCATION
      ?AUTO_368 - CITY
      ?AUTO_370 - TRUCK
      ?AUTO_371 - AIRPLANE
      ?AUTO_372 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_369 ?AUTO_368 ) ( IN-CITY ?AUTO_367 ?AUTO_368 ) ( not ( = ?AUTO_367 ?AUTO_369 ) ) ( TRUCK-AT ?AUTO_370 ?AUTO_367 ) ( IN-AIRPLANE ?AUTO_366 ?AUTO_371 ) ( AIRPORT ?AUTO_372 ) ( AIRPORT ?AUTO_369 ) ( AIRPLANE-AT ?AUTO_371 ?AUTO_372 ) ( not ( = ?AUTO_372 ?AUTO_369 ) ) ( not ( = ?AUTO_367 ?AUTO_372 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_371 ?AUTO_372 ?AUTO_369 )
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
      ?AUTO_390 - LOCATION
      ?AUTO_393 - CITY
      ?AUTO_389 - TRUCK
      ?AUTO_391 - LOCATION
      ?AUTO_392 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_390 ?AUTO_393 ) ( IN-CITY ?AUTO_388 ?AUTO_393 ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( TRUCK-AT ?AUTO_389 ?AUTO_388 ) ( AIRPORT ?AUTO_391 ) ( AIRPORT ?AUTO_390 ) ( AIRPLANE-AT ?AUTO_392 ?AUTO_391 ) ( not ( = ?AUTO_391 ?AUTO_390 ) ) ( not ( = ?AUTO_388 ?AUTO_391 ) ) ( OBJ-AT ?AUTO_387 ?AUTO_391 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_387 ?AUTO_392 ?AUTO_391 )
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
      ?AUTO_401 - LOCATION
      ?AUTO_398 - CITY
      ?AUTO_399 - LOCATION
      ?AUTO_400 - AIRPLANE
      ?AUTO_402 - TRUCK
      ?AUTO_403 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_401 ?AUTO_398 ) ( IN-CITY ?AUTO_397 ?AUTO_398 ) ( not ( = ?AUTO_397 ?AUTO_401 ) ) ( AIRPORT ?AUTO_399 ) ( AIRPORT ?AUTO_401 ) ( AIRPLANE-AT ?AUTO_400 ?AUTO_399 ) ( not ( = ?AUTO_399 ?AUTO_401 ) ) ( not ( = ?AUTO_397 ?AUTO_399 ) ) ( OBJ-AT ?AUTO_396 ?AUTO_399 ) ( TRUCK-AT ?AUTO_402 ?AUTO_403 ) ( IN-CITY ?AUTO_403 ?AUTO_398 ) ( not ( = ?AUTO_397 ?AUTO_403 ) ) ( not ( = ?AUTO_401 ?AUTO_403 ) ) ( not ( = ?AUTO_399 ?AUTO_403 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_402 ?AUTO_403 ?AUTO_397 ?AUTO_398 )
      ( DELIVER-PKG ?AUTO_396 ?AUTO_397 )
      ( DELIVER-PKG-VERIFY ?AUTO_396 ?AUTO_397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_410 - OBJ
      ?AUTO_411 - LOCATION
    )
    :vars
    (
      ?AUTO_412 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_410 ?AUTO_412 ) ( AIRPLANE-AT ?AUTO_412 ?AUTO_411 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_410 ?AUTO_412 ?AUTO_411 )
      ( DELIVER-PKG-VERIFY ?AUTO_410 ?AUTO_411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_473 - OBJ
      ?AUTO_474 - LOCATION
    )
    :vars
    (
      ?AUTO_475 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_473 ?AUTO_475 ) ( AIRPLANE-AT ?AUTO_475 ?AUTO_474 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_473 ?AUTO_475 ?AUTO_474 )
      ( DELIVER-PKG-VERIFY ?AUTO_473 ?AUTO_474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_514 - OBJ
      ?AUTO_515 - LOCATION
    )
    :vars
    (
      ?AUTO_516 - LOCATION
      ?AUTO_518 - LOCATION
      ?AUTO_517 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_516 ) ( AIRPORT ?AUTO_515 ) ( not ( = ?AUTO_516 ?AUTO_515 ) ) ( OBJ-AT ?AUTO_514 ?AUTO_516 ) ( AIRPORT ?AUTO_518 ) ( AIRPLANE-AT ?AUTO_517 ?AUTO_518 ) ( not ( = ?AUTO_518 ?AUTO_516 ) ) ( not ( = ?AUTO_515 ?AUTO_518 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_517 ?AUTO_518 ?AUTO_516 )
      ( DELIVER-PKG ?AUTO_514 ?AUTO_515 )
      ( DELIVER-PKG-VERIFY ?AUTO_514 ?AUTO_515 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_541 - OBJ
      ?AUTO_542 - LOCATION
    )
    :vars
    (
      ?AUTO_543 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_541 ?AUTO_543 ) ( AIRPLANE-AT ?AUTO_543 ?AUTO_542 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_541 ?AUTO_543 ?AUTO_542 )
      ( DELIVER-PKG-VERIFY ?AUTO_541 ?AUTO_542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_544 - OBJ
      ?AUTO_545 - LOCATION
    )
    :vars
    (
      ?AUTO_546 - AIRPLANE
      ?AUTO_547 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_544 ?AUTO_546 ) ( AIRPORT ?AUTO_547 ) ( AIRPORT ?AUTO_545 ) ( AIRPLANE-AT ?AUTO_546 ?AUTO_547 ) ( not ( = ?AUTO_547 ?AUTO_545 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_546 ?AUTO_547 ?AUTO_545 )
      ( DELIVER-PKG ?AUTO_544 ?AUTO_545 )
      ( DELIVER-PKG-VERIFY ?AUTO_544 ?AUTO_545 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_612 - OBJ
      ?AUTO_613 - LOCATION
    )
    :vars
    (
      ?AUTO_614 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_612 ?AUTO_614 ) ( AIRPLANE-AT ?AUTO_614 ?AUTO_613 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_612 ?AUTO_614 ?AUTO_613 )
      ( DELIVER-PKG-VERIFY ?AUTO_612 ?AUTO_613 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_635 - OBJ
      ?AUTO_636 - LOCATION
    )
    :vars
    (
      ?AUTO_637 - LOCATION
      ?AUTO_638 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_637 ) ( AIRPORT ?AUTO_636 ) ( AIRPLANE-AT ?AUTO_638 ?AUTO_637 ) ( not ( = ?AUTO_637 ?AUTO_636 ) ) ( OBJ-AT ?AUTO_635 ?AUTO_637 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_635 ?AUTO_638 ?AUTO_637 )
      ( DELIVER-PKG ?AUTO_635 ?AUTO_636 )
      ( DELIVER-PKG-VERIFY ?AUTO_635 ?AUTO_636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_639 - OBJ
      ?AUTO_640 - LOCATION
    )
    :vars
    (
      ?AUTO_641 - LOCATION
      ?AUTO_643 - LOCATION
      ?AUTO_642 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_641 ) ( AIRPORT ?AUTO_640 ) ( not ( = ?AUTO_641 ?AUTO_640 ) ) ( OBJ-AT ?AUTO_639 ?AUTO_641 ) ( AIRPORT ?AUTO_643 ) ( AIRPLANE-AT ?AUTO_642 ?AUTO_643 ) ( not ( = ?AUTO_643 ?AUTO_641 ) ) ( not ( = ?AUTO_640 ?AUTO_643 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_642 ?AUTO_643 ?AUTO_641 )
      ( DELIVER-PKG ?AUTO_639 ?AUTO_640 )
      ( DELIVER-PKG-VERIFY ?AUTO_639 ?AUTO_640 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_688 - OBJ
      ?AUTO_689 - LOCATION
    )
    :vars
    (
      ?AUTO_690 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_690 ?AUTO_689 ) ( IN-TRUCK ?AUTO_688 ?AUTO_690 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_688 ?AUTO_690 ?AUTO_689 )
      ( DELIVER-PKG-VERIFY ?AUTO_688 ?AUTO_689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_691 - OBJ
      ?AUTO_692 - LOCATION
    )
    :vars
    (
      ?AUTO_693 - TRUCK
      ?AUTO_694 - LOCATION
      ?AUTO_695 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_691 ?AUTO_693 ) ( TRUCK-AT ?AUTO_693 ?AUTO_694 ) ( IN-CITY ?AUTO_694 ?AUTO_695 ) ( IN-CITY ?AUTO_692 ?AUTO_695 ) ( not ( = ?AUTO_692 ?AUTO_694 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_693 ?AUTO_694 ?AUTO_692 ?AUTO_695 )
      ( DELIVER-PKG ?AUTO_691 ?AUTO_692 )
      ( DELIVER-PKG-VERIFY ?AUTO_691 ?AUTO_692 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_698 - OBJ
      ?AUTO_699 - LOCATION
    )
    :vars
    (
      ?AUTO_700 - TRUCK
      ?AUTO_702 - LOCATION
      ?AUTO_701 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_700 ?AUTO_702 ) ( IN-CITY ?AUTO_702 ?AUTO_701 ) ( IN-CITY ?AUTO_699 ?AUTO_701 ) ( not ( = ?AUTO_699 ?AUTO_702 ) ) ( OBJ-AT ?AUTO_698 ?AUTO_702 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_698 ?AUTO_700 ?AUTO_702 )
      ( DELIVER-PKG ?AUTO_698 ?AUTO_699 )
      ( DELIVER-PKG-VERIFY ?AUTO_698 ?AUTO_699 ) )
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
      ?AUTO_716 - LOCATION
      ?AUTO_713 - CITY
      ?AUTO_714 - AIRPLANE
      ?AUTO_717 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_715 ?AUTO_716 ) ( IN-CITY ?AUTO_716 ?AUTO_713 ) ( IN-CITY ?AUTO_712 ?AUTO_713 ) ( not ( = ?AUTO_712 ?AUTO_716 ) ) ( IN-AIRPLANE ?AUTO_711 ?AUTO_714 ) ( AIRPORT ?AUTO_717 ) ( AIRPORT ?AUTO_716 ) ( AIRPLANE-AT ?AUTO_714 ?AUTO_717 ) ( not ( = ?AUTO_717 ?AUTO_716 ) ) ( not ( = ?AUTO_712 ?AUTO_717 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_714 ?AUTO_717 ?AUTO_716 )
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
      ?AUTO_739 - TRUCK
      ?AUTO_740 - LOCATION
      ?AUTO_737 - CITY
      ?AUTO_738 - LOCATION
      ?AUTO_736 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_739 ?AUTO_740 ) ( IN-CITY ?AUTO_740 ?AUTO_737 ) ( IN-CITY ?AUTO_735 ?AUTO_737 ) ( not ( = ?AUTO_735 ?AUTO_740 ) ) ( AIRPORT ?AUTO_738 ) ( AIRPORT ?AUTO_740 ) ( AIRPLANE-AT ?AUTO_736 ?AUTO_738 ) ( not ( = ?AUTO_738 ?AUTO_740 ) ) ( not ( = ?AUTO_735 ?AUTO_738 ) ) ( OBJ-AT ?AUTO_734 ?AUTO_738 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_734 ?AUTO_736 ?AUTO_738 )
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
      ?AUTO_746 - TRUCK
      ?AUTO_747 - LOCATION
      ?AUTO_743 - CITY
      ?AUTO_745 - LOCATION
      ?AUTO_748 - LOCATION
      ?AUTO_744 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_746 ?AUTO_747 ) ( IN-CITY ?AUTO_747 ?AUTO_743 ) ( IN-CITY ?AUTO_742 ?AUTO_743 ) ( not ( = ?AUTO_742 ?AUTO_747 ) ) ( AIRPORT ?AUTO_745 ) ( AIRPORT ?AUTO_747 ) ( not ( = ?AUTO_745 ?AUTO_747 ) ) ( not ( = ?AUTO_742 ?AUTO_745 ) ) ( OBJ-AT ?AUTO_741 ?AUTO_745 ) ( AIRPORT ?AUTO_748 ) ( AIRPLANE-AT ?AUTO_744 ?AUTO_748 ) ( not ( = ?AUTO_748 ?AUTO_745 ) ) ( not ( = ?AUTO_742 ?AUTO_748 ) ) ( not ( = ?AUTO_747 ?AUTO_748 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_744 ?AUTO_748 ?AUTO_745 )
      ( DELIVER-PKG ?AUTO_741 ?AUTO_742 )
      ( DELIVER-PKG-VERIFY ?AUTO_741 ?AUTO_742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_793 - OBJ
      ?AUTO_794 - LOCATION
    )
    :vars
    (
      ?AUTO_795 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_795 ?AUTO_794 ) ( IN-TRUCK ?AUTO_793 ?AUTO_795 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_793 ?AUTO_795 ?AUTO_794 )
      ( DELIVER-PKG-VERIFY ?AUTO_793 ?AUTO_794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_796 - OBJ
      ?AUTO_797 - LOCATION
    )
    :vars
    (
      ?AUTO_798 - TRUCK
      ?AUTO_799 - LOCATION
      ?AUTO_800 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_796 ?AUTO_798 ) ( TRUCK-AT ?AUTO_798 ?AUTO_799 ) ( IN-CITY ?AUTO_799 ?AUTO_800 ) ( IN-CITY ?AUTO_797 ?AUTO_800 ) ( not ( = ?AUTO_797 ?AUTO_799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_798 ?AUTO_799 ?AUTO_797 ?AUTO_800 )
      ( DELIVER-PKG ?AUTO_796 ?AUTO_797 )
      ( DELIVER-PKG-VERIFY ?AUTO_796 ?AUTO_797 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_805 - OBJ
      ?AUTO_806 - LOCATION
    )
    :vars
    (
      ?AUTO_809 - TRUCK
      ?AUTO_807 - LOCATION
      ?AUTO_808 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_809 ?AUTO_807 ) ( IN-CITY ?AUTO_807 ?AUTO_808 ) ( IN-CITY ?AUTO_806 ?AUTO_808 ) ( not ( = ?AUTO_806 ?AUTO_807 ) ) ( OBJ-AT ?AUTO_805 ?AUTO_807 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_805 ?AUTO_809 ?AUTO_807 )
      ( DELIVER-PKG ?AUTO_805 ?AUTO_806 )
      ( DELIVER-PKG-VERIFY ?AUTO_805 ?AUTO_806 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_848 - OBJ
      ?AUTO_849 - LOCATION
    )
    :vars
    (
      ?AUTO_850 - TRUCK
      ?AUTO_854 - LOCATION
      ?AUTO_855 - CITY
      ?AUTO_851 - LOCATION
      ?AUTO_853 - LOCATION
      ?AUTO_852 - AIRPLANE
      ?AUTO_856 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_850 ?AUTO_854 ) ( IN-CITY ?AUTO_854 ?AUTO_855 ) ( IN-CITY ?AUTO_849 ?AUTO_855 ) ( not ( = ?AUTO_849 ?AUTO_854 ) ) ( AIRPORT ?AUTO_851 ) ( AIRPORT ?AUTO_854 ) ( not ( = ?AUTO_851 ?AUTO_854 ) ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( AIRPORT ?AUTO_853 ) ( AIRPLANE-AT ?AUTO_852 ?AUTO_853 ) ( not ( = ?AUTO_853 ?AUTO_851 ) ) ( not ( = ?AUTO_849 ?AUTO_853 ) ) ( not ( = ?AUTO_854 ?AUTO_853 ) ) ( TRUCK-AT ?AUTO_856 ?AUTO_851 ) ( IN-TRUCK ?AUTO_848 ?AUTO_856 ) ( not ( = ?AUTO_850 ?AUTO_856 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_848 ?AUTO_856 ?AUTO_851 )
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
      ?AUTO_863 - TRUCK
      ?AUTO_860 - LOCATION
      ?AUTO_862 - CITY
      ?AUTO_859 - LOCATION
      ?AUTO_865 - LOCATION
      ?AUTO_861 - AIRPLANE
      ?AUTO_864 - TRUCK
      ?AUTO_866 - LOCATION
      ?AUTO_867 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_863 ?AUTO_860 ) ( IN-CITY ?AUTO_860 ?AUTO_862 ) ( IN-CITY ?AUTO_858 ?AUTO_862 ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( AIRPORT ?AUTO_859 ) ( AIRPORT ?AUTO_860 ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( AIRPORT ?AUTO_865 ) ( AIRPLANE-AT ?AUTO_861 ?AUTO_865 ) ( not ( = ?AUTO_865 ?AUTO_859 ) ) ( not ( = ?AUTO_858 ?AUTO_865 ) ) ( not ( = ?AUTO_860 ?AUTO_865 ) ) ( IN-TRUCK ?AUTO_857 ?AUTO_864 ) ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( TRUCK-AT ?AUTO_864 ?AUTO_866 ) ( IN-CITY ?AUTO_866 ?AUTO_867 ) ( IN-CITY ?AUTO_859 ?AUTO_867 ) ( not ( = ?AUTO_859 ?AUTO_866 ) ) ( not ( = ?AUTO_858 ?AUTO_866 ) ) ( not ( = ?AUTO_860 ?AUTO_866 ) ) ( not ( = ?AUTO_862 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_864 ?AUTO_866 ?AUTO_859 ?AUTO_867 )
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
      ?AUTO_900 - TRUCK
      ?AUTO_897 - LOCATION
      ?AUTO_898 - CITY
      ?AUTO_903 - LOCATION
      ?AUTO_896 - LOCATION
      ?AUTO_904 - AIRPLANE
      ?AUTO_899 - TRUCK
      ?AUTO_902 - LOCATION
      ?AUTO_901 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_900 ?AUTO_897 ) ( IN-CITY ?AUTO_897 ?AUTO_898 ) ( IN-CITY ?AUTO_895 ?AUTO_898 ) ( not ( = ?AUTO_895 ?AUTO_897 ) ) ( AIRPORT ?AUTO_903 ) ( AIRPORT ?AUTO_897 ) ( not ( = ?AUTO_903 ?AUTO_897 ) ) ( not ( = ?AUTO_895 ?AUTO_903 ) ) ( AIRPORT ?AUTO_896 ) ( AIRPLANE-AT ?AUTO_904 ?AUTO_896 ) ( not ( = ?AUTO_896 ?AUTO_903 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) ( not ( = ?AUTO_897 ?AUTO_896 ) ) ( not ( = ?AUTO_900 ?AUTO_899 ) ) ( TRUCK-AT ?AUTO_899 ?AUTO_902 ) ( IN-CITY ?AUTO_902 ?AUTO_901 ) ( IN-CITY ?AUTO_903 ?AUTO_901 ) ( not ( = ?AUTO_903 ?AUTO_902 ) ) ( not ( = ?AUTO_895 ?AUTO_902 ) ) ( not ( = ?AUTO_897 ?AUTO_902 ) ) ( not ( = ?AUTO_898 ?AUTO_901 ) ) ( not ( = ?AUTO_896 ?AUTO_902 ) ) ( OBJ-AT ?AUTO_894 ?AUTO_902 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_894 ?AUTO_899 ?AUTO_902 )
      ( DELIVER-PKG ?AUTO_894 ?AUTO_895 )
      ( DELIVER-PKG-VERIFY ?AUTO_894 ?AUTO_895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_907 - OBJ
      ?AUTO_908 - LOCATION
    )
    :vars
    (
      ?AUTO_909 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_909 ?AUTO_908 ) ( IN-TRUCK ?AUTO_907 ?AUTO_909 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_907 ?AUTO_909 ?AUTO_908 )
      ( DELIVER-PKG-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_992 - OBJ
      ?AUTO_993 - LOCATION
    )
    :vars
    (
      ?AUTO_994 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_994 ?AUTO_993 ) ( IN-TRUCK ?AUTO_992 ?AUTO_994 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_992 ?AUTO_994 ?AUTO_993 )
      ( DELIVER-PKG-VERIFY ?AUTO_992 ?AUTO_993 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_995 - OBJ
      ?AUTO_996 - LOCATION
    )
    :vars
    (
      ?AUTO_997 - TRUCK
      ?AUTO_998 - LOCATION
      ?AUTO_999 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_995 ?AUTO_997 ) ( TRUCK-AT ?AUTO_997 ?AUTO_998 ) ( IN-CITY ?AUTO_998 ?AUTO_999 ) ( IN-CITY ?AUTO_996 ?AUTO_999 ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_997 ?AUTO_998 ?AUTO_996 ?AUTO_999 )
      ( DELIVER-PKG ?AUTO_995 ?AUTO_996 )
      ( DELIVER-PKG-VERIFY ?AUTO_995 ?AUTO_996 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1048 - OBJ
      ?AUTO_1049 - LOCATION
    )
    :vars
    (
      ?AUTO_1053 - TRUCK
      ?AUTO_1055 - LOCATION
      ?AUTO_1054 - CITY
      ?AUTO_1050 - LOCATION
      ?AUTO_1052 - LOCATION
      ?AUTO_1051 - AIRPLANE
      ?AUTO_1056 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1053 ?AUTO_1055 ) ( IN-CITY ?AUTO_1055 ?AUTO_1054 ) ( IN-CITY ?AUTO_1049 ?AUTO_1054 ) ( not ( = ?AUTO_1049 ?AUTO_1055 ) ) ( AIRPORT ?AUTO_1050 ) ( AIRPORT ?AUTO_1055 ) ( not ( = ?AUTO_1050 ?AUTO_1055 ) ) ( not ( = ?AUTO_1049 ?AUTO_1050 ) ) ( AIRPORT ?AUTO_1052 ) ( AIRPLANE-AT ?AUTO_1051 ?AUTO_1052 ) ( not ( = ?AUTO_1052 ?AUTO_1050 ) ) ( not ( = ?AUTO_1049 ?AUTO_1052 ) ) ( not ( = ?AUTO_1055 ?AUTO_1052 ) ) ( TRUCK-AT ?AUTO_1056 ?AUTO_1050 ) ( IN-TRUCK ?AUTO_1048 ?AUTO_1056 ) ( not ( = ?AUTO_1053 ?AUTO_1056 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1048 ?AUTO_1056 ?AUTO_1050 )
      ( DELIVER-PKG ?AUTO_1048 ?AUTO_1049 )
      ( DELIVER-PKG-VERIFY ?AUTO_1048 ?AUTO_1049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1081 - OBJ
      ?AUTO_1082 - LOCATION
    )
    :vars
    (
      ?AUTO_1086 - TRUCK
      ?AUTO_1091 - LOCATION
      ?AUTO_1089 - CITY
      ?AUTO_1087 - LOCATION
      ?AUTO_1090 - LOCATION
      ?AUTO_1083 - AIRPLANE
      ?AUTO_1084 - TRUCK
      ?AUTO_1088 - LOCATION
      ?AUTO_1085 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1086 ?AUTO_1091 ) ( IN-CITY ?AUTO_1091 ?AUTO_1089 ) ( IN-CITY ?AUTO_1082 ?AUTO_1089 ) ( not ( = ?AUTO_1082 ?AUTO_1091 ) ) ( AIRPORT ?AUTO_1087 ) ( AIRPORT ?AUTO_1091 ) ( not ( = ?AUTO_1087 ?AUTO_1091 ) ) ( not ( = ?AUTO_1082 ?AUTO_1087 ) ) ( AIRPORT ?AUTO_1090 ) ( AIRPLANE-AT ?AUTO_1083 ?AUTO_1090 ) ( not ( = ?AUTO_1090 ?AUTO_1087 ) ) ( not ( = ?AUTO_1082 ?AUTO_1090 ) ) ( not ( = ?AUTO_1091 ?AUTO_1090 ) ) ( not ( = ?AUTO_1086 ?AUTO_1084 ) ) ( TRUCK-AT ?AUTO_1084 ?AUTO_1088 ) ( IN-CITY ?AUTO_1088 ?AUTO_1085 ) ( IN-CITY ?AUTO_1087 ?AUTO_1085 ) ( not ( = ?AUTO_1087 ?AUTO_1088 ) ) ( not ( = ?AUTO_1082 ?AUTO_1088 ) ) ( not ( = ?AUTO_1091 ?AUTO_1088 ) ) ( not ( = ?AUTO_1089 ?AUTO_1085 ) ) ( not ( = ?AUTO_1090 ?AUTO_1088 ) ) ( OBJ-AT ?AUTO_1081 ?AUTO_1088 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1081 ?AUTO_1084 ?AUTO_1088 )
      ( DELIVER-PKG ?AUTO_1081 ?AUTO_1082 )
      ( DELIVER-PKG-VERIFY ?AUTO_1081 ?AUTO_1082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1092 - OBJ
      ?AUTO_1093 - LOCATION
    )
    :vars
    (
      ?AUTO_1099 - TRUCK
      ?AUTO_1096 - LOCATION
      ?AUTO_1097 - CITY
      ?AUTO_1098 - LOCATION
      ?AUTO_1101 - LOCATION
      ?AUTO_1095 - AIRPLANE
      ?AUTO_1100 - TRUCK
      ?AUTO_1102 - LOCATION
      ?AUTO_1094 - CITY
      ?AUTO_1103 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1099 ?AUTO_1096 ) ( IN-CITY ?AUTO_1096 ?AUTO_1097 ) ( IN-CITY ?AUTO_1093 ?AUTO_1097 ) ( not ( = ?AUTO_1093 ?AUTO_1096 ) ) ( AIRPORT ?AUTO_1098 ) ( AIRPORT ?AUTO_1096 ) ( not ( = ?AUTO_1098 ?AUTO_1096 ) ) ( not ( = ?AUTO_1093 ?AUTO_1098 ) ) ( AIRPORT ?AUTO_1101 ) ( AIRPLANE-AT ?AUTO_1095 ?AUTO_1101 ) ( not ( = ?AUTO_1101 ?AUTO_1098 ) ) ( not ( = ?AUTO_1093 ?AUTO_1101 ) ) ( not ( = ?AUTO_1096 ?AUTO_1101 ) ) ( not ( = ?AUTO_1099 ?AUTO_1100 ) ) ( IN-CITY ?AUTO_1102 ?AUTO_1094 ) ( IN-CITY ?AUTO_1098 ?AUTO_1094 ) ( not ( = ?AUTO_1098 ?AUTO_1102 ) ) ( not ( = ?AUTO_1093 ?AUTO_1102 ) ) ( not ( = ?AUTO_1096 ?AUTO_1102 ) ) ( not ( = ?AUTO_1097 ?AUTO_1094 ) ) ( not ( = ?AUTO_1101 ?AUTO_1102 ) ) ( OBJ-AT ?AUTO_1092 ?AUTO_1102 ) ( TRUCK-AT ?AUTO_1100 ?AUTO_1103 ) ( IN-CITY ?AUTO_1103 ?AUTO_1094 ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( not ( = ?AUTO_1093 ?AUTO_1103 ) ) ( not ( = ?AUTO_1096 ?AUTO_1103 ) ) ( not ( = ?AUTO_1098 ?AUTO_1103 ) ) ( not ( = ?AUTO_1101 ?AUTO_1103 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1100 ?AUTO_1103 ?AUTO_1102 ?AUTO_1094 )
      ( DELIVER-PKG ?AUTO_1092 ?AUTO_1093 )
      ( DELIVER-PKG-VERIFY ?AUTO_1092 ?AUTO_1093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1106 - OBJ
      ?AUTO_1107 - LOCATION
    )
    :vars
    (
      ?AUTO_1108 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1108 ?AUTO_1107 ) ( IN-TRUCK ?AUTO_1106 ?AUTO_1108 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1106 ?AUTO_1108 ?AUTO_1107 )
      ( DELIVER-PKG-VERIFY ?AUTO_1106 ?AUTO_1107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1109 - OBJ
      ?AUTO_1110 - LOCATION
    )
    :vars
    (
      ?AUTO_1111 - TRUCK
      ?AUTO_1112 - LOCATION
      ?AUTO_1113 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1109 ?AUTO_1111 ) ( TRUCK-AT ?AUTO_1111 ?AUTO_1112 ) ( IN-CITY ?AUTO_1112 ?AUTO_1113 ) ( IN-CITY ?AUTO_1110 ?AUTO_1113 ) ( not ( = ?AUTO_1110 ?AUTO_1112 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1111 ?AUTO_1112 ?AUTO_1110 ?AUTO_1113 )
      ( DELIVER-PKG ?AUTO_1109 ?AUTO_1110 )
      ( DELIVER-PKG-VERIFY ?AUTO_1109 ?AUTO_1110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1114 - OBJ
      ?AUTO_1115 - LOCATION
    )
    :vars
    (
      ?AUTO_1116 - TRUCK
      ?AUTO_1117 - LOCATION
      ?AUTO_1118 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1116 ?AUTO_1117 ) ( IN-CITY ?AUTO_1117 ?AUTO_1118 ) ( IN-CITY ?AUTO_1115 ?AUTO_1118 ) ( not ( = ?AUTO_1115 ?AUTO_1117 ) ) ( OBJ-AT ?AUTO_1114 ?AUTO_1117 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1114 ?AUTO_1116 ?AUTO_1117 )
      ( DELIVER-PKG ?AUTO_1114 ?AUTO_1115 )
      ( DELIVER-PKG-VERIFY ?AUTO_1114 ?AUTO_1115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1121 - OBJ
      ?AUTO_1122 - LOCATION
    )
    :vars
    (
      ?AUTO_1123 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1121 ?AUTO_1123 ) ( AIRPLANE-AT ?AUTO_1123 ?AUTO_1122 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1121 ?AUTO_1123 ?AUTO_1122 )
      ( DELIVER-PKG-VERIFY ?AUTO_1121 ?AUTO_1122 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1124 - OBJ
      ?AUTO_1125 - LOCATION
    )
    :vars
    (
      ?AUTO_1126 - AIRPLANE
      ?AUTO_1127 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1124 ?AUTO_1126 ) ( AIRPORT ?AUTO_1127 ) ( AIRPORT ?AUTO_1125 ) ( AIRPLANE-AT ?AUTO_1126 ?AUTO_1127 ) ( not ( = ?AUTO_1127 ?AUTO_1125 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1126 ?AUTO_1127 ?AUTO_1125 )
      ( DELIVER-PKG ?AUTO_1124 ?AUTO_1125 )
      ( DELIVER-PKG-VERIFY ?AUTO_1124 ?AUTO_1125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1128 - OBJ
      ?AUTO_1129 - LOCATION
    )
    :vars
    (
      ?AUTO_1131 - LOCATION
      ?AUTO_1130 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1131 ) ( AIRPORT ?AUTO_1129 ) ( AIRPLANE-AT ?AUTO_1130 ?AUTO_1131 ) ( not ( = ?AUTO_1131 ?AUTO_1129 ) ) ( OBJ-AT ?AUTO_1128 ?AUTO_1131 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1128 ?AUTO_1130 ?AUTO_1131 )
      ( DELIVER-PKG ?AUTO_1128 ?AUTO_1129 )
      ( DELIVER-PKG-VERIFY ?AUTO_1128 ?AUTO_1129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1132 - OBJ
      ?AUTO_1133 - LOCATION
    )
    :vars
    (
      ?AUTO_1135 - LOCATION
      ?AUTO_1136 - LOCATION
      ?AUTO_1134 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1135 ) ( AIRPORT ?AUTO_1133 ) ( not ( = ?AUTO_1135 ?AUTO_1133 ) ) ( OBJ-AT ?AUTO_1132 ?AUTO_1135 ) ( AIRPORT ?AUTO_1136 ) ( AIRPLANE-AT ?AUTO_1134 ?AUTO_1136 ) ( not ( = ?AUTO_1136 ?AUTO_1135 ) ) ( not ( = ?AUTO_1133 ?AUTO_1136 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1134 ?AUTO_1136 ?AUTO_1135 )
      ( DELIVER-PKG ?AUTO_1132 ?AUTO_1133 )
      ( DELIVER-PKG-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1157 - OBJ
      ?AUTO_1158 - LOCATION
    )
    :vars
    (
      ?AUTO_1159 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1157 ?AUTO_1159 ) ( AIRPLANE-AT ?AUTO_1159 ?AUTO_1158 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1157 ?AUTO_1159 ?AUTO_1158 )
      ( DELIVER-PKG-VERIFY ?AUTO_1157 ?AUTO_1158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1160 - OBJ
      ?AUTO_1161 - LOCATION
    )
    :vars
    (
      ?AUTO_1162 - AIRPLANE
      ?AUTO_1163 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1160 ?AUTO_1162 ) ( AIRPORT ?AUTO_1163 ) ( AIRPORT ?AUTO_1161 ) ( AIRPLANE-AT ?AUTO_1162 ?AUTO_1163 ) ( not ( = ?AUTO_1163 ?AUTO_1161 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1162 ?AUTO_1163 ?AUTO_1161 )
      ( DELIVER-PKG ?AUTO_1160 ?AUTO_1161 )
      ( DELIVER-PKG-VERIFY ?AUTO_1160 ?AUTO_1161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1184 - OBJ
      ?AUTO_1185 - LOCATION
    )
    :vars
    (
      ?AUTO_1188 - LOCATION
      ?AUTO_1186 - LOCATION
      ?AUTO_1187 - AIRPLANE
      ?AUTO_1189 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1188 ) ( AIRPORT ?AUTO_1185 ) ( not ( = ?AUTO_1188 ?AUTO_1185 ) ) ( AIRPORT ?AUTO_1186 ) ( AIRPLANE-AT ?AUTO_1187 ?AUTO_1186 ) ( not ( = ?AUTO_1186 ?AUTO_1188 ) ) ( not ( = ?AUTO_1185 ?AUTO_1186 ) ) ( TRUCK-AT ?AUTO_1189 ?AUTO_1188 ) ( IN-TRUCK ?AUTO_1184 ?AUTO_1189 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1184 ?AUTO_1189 ?AUTO_1188 )
      ( DELIVER-PKG ?AUTO_1184 ?AUTO_1185 )
      ( DELIVER-PKG-VERIFY ?AUTO_1184 ?AUTO_1185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1190 - OBJ
      ?AUTO_1191 - LOCATION
    )
    :vars
    (
      ?AUTO_1194 - LOCATION
      ?AUTO_1192 - LOCATION
      ?AUTO_1193 - AIRPLANE
      ?AUTO_1195 - TRUCK
      ?AUTO_1196 - LOCATION
      ?AUTO_1197 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1194 ) ( AIRPORT ?AUTO_1191 ) ( not ( = ?AUTO_1194 ?AUTO_1191 ) ) ( AIRPORT ?AUTO_1192 ) ( AIRPLANE-AT ?AUTO_1193 ?AUTO_1192 ) ( not ( = ?AUTO_1192 ?AUTO_1194 ) ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( IN-TRUCK ?AUTO_1190 ?AUTO_1195 ) ( TRUCK-AT ?AUTO_1195 ?AUTO_1196 ) ( IN-CITY ?AUTO_1196 ?AUTO_1197 ) ( IN-CITY ?AUTO_1194 ?AUTO_1197 ) ( not ( = ?AUTO_1194 ?AUTO_1196 ) ) ( not ( = ?AUTO_1191 ?AUTO_1196 ) ) ( not ( = ?AUTO_1192 ?AUTO_1196 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1195 ?AUTO_1196 ?AUTO_1194 ?AUTO_1197 )
      ( DELIVER-PKG ?AUTO_1190 ?AUTO_1191 )
      ( DELIVER-PKG-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1198 - OBJ
      ?AUTO_1199 - LOCATION
    )
    :vars
    (
      ?AUTO_1205 - LOCATION
      ?AUTO_1200 - LOCATION
      ?AUTO_1201 - AIRPLANE
      ?AUTO_1204 - TRUCK
      ?AUTO_1203 - LOCATION
      ?AUTO_1202 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1205 ) ( AIRPORT ?AUTO_1199 ) ( not ( = ?AUTO_1205 ?AUTO_1199 ) ) ( AIRPORT ?AUTO_1200 ) ( AIRPLANE-AT ?AUTO_1201 ?AUTO_1200 ) ( not ( = ?AUTO_1200 ?AUTO_1205 ) ) ( not ( = ?AUTO_1199 ?AUTO_1200 ) ) ( TRUCK-AT ?AUTO_1204 ?AUTO_1203 ) ( IN-CITY ?AUTO_1203 ?AUTO_1202 ) ( IN-CITY ?AUTO_1205 ?AUTO_1202 ) ( not ( = ?AUTO_1205 ?AUTO_1203 ) ) ( not ( = ?AUTO_1199 ?AUTO_1203 ) ) ( not ( = ?AUTO_1200 ?AUTO_1203 ) ) ( OBJ-AT ?AUTO_1198 ?AUTO_1203 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1198 ?AUTO_1204 ?AUTO_1203 )
      ( DELIVER-PKG ?AUTO_1198 ?AUTO_1199 )
      ( DELIVER-PKG-VERIFY ?AUTO_1198 ?AUTO_1199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1208 - OBJ
      ?AUTO_1209 - LOCATION
    )
    :vars
    (
      ?AUTO_1210 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1208 ?AUTO_1210 ) ( AIRPLANE-AT ?AUTO_1210 ?AUTO_1209 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1208 ?AUTO_1210 ?AUTO_1209 )
      ( DELIVER-PKG-VERIFY ?AUTO_1208 ?AUTO_1209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1247 - OBJ
      ?AUTO_1248 - LOCATION
    )
    :vars
    (
      ?AUTO_1249 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1249 ?AUTO_1248 ) ( IN-TRUCK ?AUTO_1247 ?AUTO_1249 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1247 ?AUTO_1249 ?AUTO_1248 )
      ( DELIVER-PKG-VERIFY ?AUTO_1247 ?AUTO_1248 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1252 - OBJ
      ?AUTO_1253 - LOCATION
    )
    :vars
    (
      ?AUTO_1254 - TRUCK
      ?AUTO_1255 - LOCATION
      ?AUTO_1256 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1252 ?AUTO_1254 ) ( TRUCK-AT ?AUTO_1254 ?AUTO_1255 ) ( IN-CITY ?AUTO_1255 ?AUTO_1256 ) ( IN-CITY ?AUTO_1253 ?AUTO_1256 ) ( not ( = ?AUTO_1253 ?AUTO_1255 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1254 ?AUTO_1255 ?AUTO_1253 ?AUTO_1256 )
      ( DELIVER-PKG ?AUTO_1252 ?AUTO_1253 )
      ( DELIVER-PKG-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1257 - OBJ
      ?AUTO_1258 - LOCATION
    )
    :vars
    (
      ?AUTO_1259 - TRUCK
      ?AUTO_1260 - LOCATION
      ?AUTO_1261 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1259 ?AUTO_1260 ) ( IN-CITY ?AUTO_1260 ?AUTO_1261 ) ( IN-CITY ?AUTO_1258 ?AUTO_1261 ) ( not ( = ?AUTO_1258 ?AUTO_1260 ) ) ( OBJ-AT ?AUTO_1257 ?AUTO_1260 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1257 ?AUTO_1259 ?AUTO_1260 )
      ( DELIVER-PKG ?AUTO_1257 ?AUTO_1258 )
      ( DELIVER-PKG-VERIFY ?AUTO_1257 ?AUTO_1258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1262 - OBJ
      ?AUTO_1263 - LOCATION
    )
    :vars
    (
      ?AUTO_1264 - TRUCK
      ?AUTO_1265 - LOCATION
      ?AUTO_1266 - CITY
      ?AUTO_1267 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1264 ?AUTO_1265 ) ( IN-CITY ?AUTO_1265 ?AUTO_1266 ) ( IN-CITY ?AUTO_1263 ?AUTO_1266 ) ( not ( = ?AUTO_1263 ?AUTO_1265 ) ) ( IN-AIRPLANE ?AUTO_1262 ?AUTO_1267 ) ( AIRPLANE-AT ?AUTO_1267 ?AUTO_1265 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1262 ?AUTO_1267 ?AUTO_1265 )
      ( DELIVER-PKG ?AUTO_1262 ?AUTO_1263 )
      ( DELIVER-PKG-VERIFY ?AUTO_1262 ?AUTO_1263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1268 - OBJ
      ?AUTO_1269 - LOCATION
    )
    :vars
    (
      ?AUTO_1272 - TRUCK
      ?AUTO_1270 - LOCATION
      ?AUTO_1271 - CITY
      ?AUTO_1273 - AIRPLANE
      ?AUTO_1274 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1272 ?AUTO_1270 ) ( IN-CITY ?AUTO_1270 ?AUTO_1271 ) ( IN-CITY ?AUTO_1269 ?AUTO_1271 ) ( not ( = ?AUTO_1269 ?AUTO_1270 ) ) ( IN-AIRPLANE ?AUTO_1268 ?AUTO_1273 ) ( AIRPORT ?AUTO_1274 ) ( AIRPORT ?AUTO_1270 ) ( AIRPLANE-AT ?AUTO_1273 ?AUTO_1274 ) ( not ( = ?AUTO_1274 ?AUTO_1270 ) ) ( not ( = ?AUTO_1269 ?AUTO_1274 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1273 ?AUTO_1274 ?AUTO_1270 )
      ( DELIVER-PKG ?AUTO_1268 ?AUTO_1269 )
      ( DELIVER-PKG-VERIFY ?AUTO_1268 ?AUTO_1269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1287 - OBJ
      ?AUTO_1288 - LOCATION
    )
    :vars
    (
      ?AUTO_1289 - TRUCK
      ?AUTO_1292 - LOCATION
      ?AUTO_1291 - CITY
      ?AUTO_1290 - LOCATION
      ?AUTO_1293 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1289 ?AUTO_1292 ) ( IN-CITY ?AUTO_1292 ?AUTO_1291 ) ( IN-CITY ?AUTO_1288 ?AUTO_1291 ) ( not ( = ?AUTO_1288 ?AUTO_1292 ) ) ( AIRPORT ?AUTO_1290 ) ( AIRPORT ?AUTO_1292 ) ( AIRPLANE-AT ?AUTO_1293 ?AUTO_1290 ) ( not ( = ?AUTO_1290 ?AUTO_1292 ) ) ( not ( = ?AUTO_1288 ?AUTO_1290 ) ) ( OBJ-AT ?AUTO_1287 ?AUTO_1290 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1287 ?AUTO_1293 ?AUTO_1290 )
      ( DELIVER-PKG ?AUTO_1287 ?AUTO_1288 )
      ( DELIVER-PKG-VERIFY ?AUTO_1287 ?AUTO_1288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1294 - OBJ
      ?AUTO_1295 - LOCATION
    )
    :vars
    (
      ?AUTO_1296 - TRUCK
      ?AUTO_1299 - LOCATION
      ?AUTO_1298 - CITY
      ?AUTO_1297 - LOCATION
      ?AUTO_1300 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1296 ?AUTO_1299 ) ( IN-CITY ?AUTO_1299 ?AUTO_1298 ) ( IN-CITY ?AUTO_1295 ?AUTO_1298 ) ( not ( = ?AUTO_1295 ?AUTO_1299 ) ) ( AIRPORT ?AUTO_1297 ) ( AIRPORT ?AUTO_1299 ) ( not ( = ?AUTO_1297 ?AUTO_1299 ) ) ( not ( = ?AUTO_1295 ?AUTO_1297 ) ) ( OBJ-AT ?AUTO_1294 ?AUTO_1297 ) ( AIRPLANE-AT ?AUTO_1300 ?AUTO_1299 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1300 ?AUTO_1299 ?AUTO_1297 )
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
      ?AUTO_1306 - LOCATION
      ?AUTO_1304 - CITY
      ?AUTO_1307 - LOCATION
      ?AUTO_1303 - AIRPLANE
      ?AUTO_1305 - TRUCK
      ?AUTO_1308 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1306 ?AUTO_1304 ) ( IN-CITY ?AUTO_1302 ?AUTO_1304 ) ( not ( = ?AUTO_1302 ?AUTO_1306 ) ) ( AIRPORT ?AUTO_1307 ) ( AIRPORT ?AUTO_1306 ) ( not ( = ?AUTO_1307 ?AUTO_1306 ) ) ( not ( = ?AUTO_1302 ?AUTO_1307 ) ) ( OBJ-AT ?AUTO_1301 ?AUTO_1307 ) ( AIRPLANE-AT ?AUTO_1303 ?AUTO_1306 ) ( TRUCK-AT ?AUTO_1305 ?AUTO_1308 ) ( IN-CITY ?AUTO_1308 ?AUTO_1304 ) ( not ( = ?AUTO_1306 ?AUTO_1308 ) ) ( not ( = ?AUTO_1302 ?AUTO_1308 ) ) ( not ( = ?AUTO_1307 ?AUTO_1308 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1305 ?AUTO_1308 ?AUTO_1306 ?AUTO_1304 )
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
      ?AUTO_1317 - CITY
      ?AUTO_1313 - LOCATION
      ?AUTO_1316 - AIRPLANE
      ?AUTO_1318 - TRUCK
      ?AUTO_1314 - LOCATION
      ?AUTO_1319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1315 ?AUTO_1317 ) ( IN-CITY ?AUTO_1312 ?AUTO_1317 ) ( not ( = ?AUTO_1312 ?AUTO_1315 ) ) ( AIRPORT ?AUTO_1313 ) ( AIRPORT ?AUTO_1315 ) ( not ( = ?AUTO_1313 ?AUTO_1315 ) ) ( not ( = ?AUTO_1312 ?AUTO_1313 ) ) ( AIRPLANE-AT ?AUTO_1316 ?AUTO_1315 ) ( TRUCK-AT ?AUTO_1318 ?AUTO_1314 ) ( IN-CITY ?AUTO_1314 ?AUTO_1317 ) ( not ( = ?AUTO_1315 ?AUTO_1314 ) ) ( not ( = ?AUTO_1312 ?AUTO_1314 ) ) ( not ( = ?AUTO_1313 ?AUTO_1314 ) ) ( TRUCK-AT ?AUTO_1319 ?AUTO_1313 ) ( IN-TRUCK ?AUTO_1311 ?AUTO_1319 ) ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1311 ?AUTO_1319 ?AUTO_1313 )
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
      ?AUTO_1327 - LOCATION
      ?AUTO_1328 - CITY
      ?AUTO_1324 - LOCATION
      ?AUTO_1323 - AIRPLANE
      ?AUTO_1326 - TRUCK
      ?AUTO_1325 - LOCATION
      ?AUTO_1322 - TRUCK
      ?AUTO_1329 - LOCATION
      ?AUTO_1330 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1327 ?AUTO_1328 ) ( IN-CITY ?AUTO_1321 ?AUTO_1328 ) ( not ( = ?AUTO_1321 ?AUTO_1327 ) ) ( AIRPORT ?AUTO_1324 ) ( AIRPORT ?AUTO_1327 ) ( not ( = ?AUTO_1324 ?AUTO_1327 ) ) ( not ( = ?AUTO_1321 ?AUTO_1324 ) ) ( AIRPLANE-AT ?AUTO_1323 ?AUTO_1327 ) ( TRUCK-AT ?AUTO_1326 ?AUTO_1325 ) ( IN-CITY ?AUTO_1325 ?AUTO_1328 ) ( not ( = ?AUTO_1327 ?AUTO_1325 ) ) ( not ( = ?AUTO_1321 ?AUTO_1325 ) ) ( not ( = ?AUTO_1324 ?AUTO_1325 ) ) ( IN-TRUCK ?AUTO_1320 ?AUTO_1322 ) ( not ( = ?AUTO_1326 ?AUTO_1322 ) ) ( TRUCK-AT ?AUTO_1322 ?AUTO_1329 ) ( IN-CITY ?AUTO_1329 ?AUTO_1330 ) ( IN-CITY ?AUTO_1324 ?AUTO_1330 ) ( not ( = ?AUTO_1324 ?AUTO_1329 ) ) ( not ( = ?AUTO_1321 ?AUTO_1329 ) ) ( not ( = ?AUTO_1327 ?AUTO_1329 ) ) ( not ( = ?AUTO_1328 ?AUTO_1330 ) ) ( not ( = ?AUTO_1325 ?AUTO_1329 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1322 ?AUTO_1329 ?AUTO_1324 ?AUTO_1330 )
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
      ?AUTO_1336 - LOCATION
      ?AUTO_1334 - CITY
      ?AUTO_1340 - LOCATION
      ?AUTO_1333 - AIRPLANE
      ?AUTO_1337 - TRUCK
      ?AUTO_1335 - LOCATION
      ?AUTO_1341 - TRUCK
      ?AUTO_1338 - LOCATION
      ?AUTO_1339 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1336 ?AUTO_1334 ) ( IN-CITY ?AUTO_1332 ?AUTO_1334 ) ( not ( = ?AUTO_1332 ?AUTO_1336 ) ) ( AIRPORT ?AUTO_1340 ) ( AIRPORT ?AUTO_1336 ) ( not ( = ?AUTO_1340 ?AUTO_1336 ) ) ( not ( = ?AUTO_1332 ?AUTO_1340 ) ) ( AIRPLANE-AT ?AUTO_1333 ?AUTO_1336 ) ( TRUCK-AT ?AUTO_1337 ?AUTO_1335 ) ( IN-CITY ?AUTO_1335 ?AUTO_1334 ) ( not ( = ?AUTO_1336 ?AUTO_1335 ) ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( not ( = ?AUTO_1340 ?AUTO_1335 ) ) ( not ( = ?AUTO_1337 ?AUTO_1341 ) ) ( TRUCK-AT ?AUTO_1341 ?AUTO_1338 ) ( IN-CITY ?AUTO_1338 ?AUTO_1339 ) ( IN-CITY ?AUTO_1340 ?AUTO_1339 ) ( not ( = ?AUTO_1340 ?AUTO_1338 ) ) ( not ( = ?AUTO_1332 ?AUTO_1338 ) ) ( not ( = ?AUTO_1336 ?AUTO_1338 ) ) ( not ( = ?AUTO_1334 ?AUTO_1339 ) ) ( not ( = ?AUTO_1335 ?AUTO_1338 ) ) ( OBJ-AT ?AUTO_1331 ?AUTO_1338 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1331 ?AUTO_1341 ?AUTO_1338 )
      ( DELIVER-PKG ?AUTO_1331 ?AUTO_1332 )
      ( DELIVER-PKG-VERIFY ?AUTO_1331 ?AUTO_1332 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1344 - OBJ
      ?AUTO_1345 - LOCATION
    )
    :vars
    (
      ?AUTO_1346 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1346 ?AUTO_1345 ) ( IN-TRUCK ?AUTO_1344 ?AUTO_1346 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1344 ?AUTO_1346 ?AUTO_1345 )
      ( DELIVER-PKG-VERIFY ?AUTO_1344 ?AUTO_1345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1347 - OBJ
      ?AUTO_1348 - LOCATION
    )
    :vars
    (
      ?AUTO_1349 - TRUCK
      ?AUTO_1350 - LOCATION
      ?AUTO_1351 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1347 ?AUTO_1349 ) ( TRUCK-AT ?AUTO_1349 ?AUTO_1350 ) ( IN-CITY ?AUTO_1350 ?AUTO_1351 ) ( IN-CITY ?AUTO_1348 ?AUTO_1351 ) ( not ( = ?AUTO_1348 ?AUTO_1350 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1349 ?AUTO_1350 ?AUTO_1348 ?AUTO_1351 )
      ( DELIVER-PKG ?AUTO_1347 ?AUTO_1348 )
      ( DELIVER-PKG-VERIFY ?AUTO_1347 ?AUTO_1348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1354 - OBJ
      ?AUTO_1355 - LOCATION
    )
    :vars
    (
      ?AUTO_1356 - TRUCK
      ?AUTO_1358 - LOCATION
      ?AUTO_1357 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1356 ?AUTO_1358 ) ( IN-CITY ?AUTO_1358 ?AUTO_1357 ) ( IN-CITY ?AUTO_1355 ?AUTO_1357 ) ( not ( = ?AUTO_1355 ?AUTO_1358 ) ) ( OBJ-AT ?AUTO_1354 ?AUTO_1358 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1354 ?AUTO_1356 ?AUTO_1358 )
      ( DELIVER-PKG ?AUTO_1354 ?AUTO_1355 )
      ( DELIVER-PKG-VERIFY ?AUTO_1354 ?AUTO_1355 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1359 - OBJ
      ?AUTO_1360 - LOCATION
    )
    :vars
    (
      ?AUTO_1362 - LOCATION
      ?AUTO_1363 - CITY
      ?AUTO_1361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1362 ?AUTO_1363 ) ( IN-CITY ?AUTO_1360 ?AUTO_1363 ) ( not ( = ?AUTO_1360 ?AUTO_1362 ) ) ( OBJ-AT ?AUTO_1359 ?AUTO_1362 ) ( TRUCK-AT ?AUTO_1361 ?AUTO_1360 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1361 ?AUTO_1360 ?AUTO_1362 ?AUTO_1363 )
      ( DELIVER-PKG ?AUTO_1359 ?AUTO_1360 )
      ( DELIVER-PKG-VERIFY ?AUTO_1359 ?AUTO_1360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1404 - OBJ
      ?AUTO_1405 - LOCATION
    )
    :vars
    (
      ?AUTO_1406 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1406 ?AUTO_1405 ) ( IN-TRUCK ?AUTO_1404 ?AUTO_1406 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1404 ?AUTO_1406 ?AUTO_1405 )
      ( DELIVER-PKG-VERIFY ?AUTO_1404 ?AUTO_1405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1411 - OBJ
      ?AUTO_1412 - LOCATION
    )
    :vars
    (
      ?AUTO_1415 - TRUCK
      ?AUTO_1413 - LOCATION
      ?AUTO_1414 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1415 ?AUTO_1413 ) ( IN-CITY ?AUTO_1413 ?AUTO_1414 ) ( IN-CITY ?AUTO_1412 ?AUTO_1414 ) ( not ( = ?AUTO_1412 ?AUTO_1413 ) ) ( OBJ-AT ?AUTO_1411 ?AUTO_1413 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1411 ?AUTO_1415 ?AUTO_1413 )
      ( DELIVER-PKG ?AUTO_1411 ?AUTO_1412 )
      ( DELIVER-PKG-VERIFY ?AUTO_1411 ?AUTO_1412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1460 - OBJ
      ?AUTO_1461 - LOCATION
    )
    :vars
    (
      ?AUTO_1462 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1462 ?AUTO_1461 ) ( IN-TRUCK ?AUTO_1460 ?AUTO_1462 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1460 ?AUTO_1462 ?AUTO_1461 )
      ( DELIVER-PKG-VERIFY ?AUTO_1460 ?AUTO_1461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1463 - OBJ
      ?AUTO_1464 - LOCATION
    )
    :vars
    (
      ?AUTO_1465 - TRUCK
      ?AUTO_1466 - LOCATION
      ?AUTO_1467 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1463 ?AUTO_1465 ) ( TRUCK-AT ?AUTO_1465 ?AUTO_1466 ) ( IN-CITY ?AUTO_1466 ?AUTO_1467 ) ( IN-CITY ?AUTO_1464 ?AUTO_1467 ) ( not ( = ?AUTO_1464 ?AUTO_1466 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1465 ?AUTO_1466 ?AUTO_1464 ?AUTO_1467 )
      ( DELIVER-PKG ?AUTO_1463 ?AUTO_1464 )
      ( DELIVER-PKG-VERIFY ?AUTO_1463 ?AUTO_1464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1520 - OBJ
      ?AUTO_1521 - LOCATION
    )
    :vars
    (
      ?AUTO_1522 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1522 ?AUTO_1521 ) ( IN-TRUCK ?AUTO_1520 ?AUTO_1522 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1520 ?AUTO_1522 ?AUTO_1521 )
      ( DELIVER-PKG-VERIFY ?AUTO_1520 ?AUTO_1521 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1533 - OBJ
      ?AUTO_1534 - LOCATION
    )
    :vars
    (
      ?AUTO_1535 - TRUCK
      ?AUTO_1536 - LOCATION
      ?AUTO_1537 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1533 ?AUTO_1535 ) ( TRUCK-AT ?AUTO_1535 ?AUTO_1536 ) ( IN-CITY ?AUTO_1536 ?AUTO_1537 ) ( IN-CITY ?AUTO_1534 ?AUTO_1537 ) ( not ( = ?AUTO_1534 ?AUTO_1536 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1535 ?AUTO_1536 ?AUTO_1534 ?AUTO_1537 )
      ( DELIVER-PKG ?AUTO_1533 ?AUTO_1534 )
      ( DELIVER-PKG-VERIFY ?AUTO_1533 ?AUTO_1534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1538 - OBJ
      ?AUTO_1539 - LOCATION
    )
    :vars
    (
      ?AUTO_1540 - TRUCK
      ?AUTO_1541 - LOCATION
      ?AUTO_1542 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1540 ?AUTO_1541 ) ( IN-CITY ?AUTO_1541 ?AUTO_1542 ) ( IN-CITY ?AUTO_1539 ?AUTO_1542 ) ( not ( = ?AUTO_1539 ?AUTO_1541 ) ) ( OBJ-AT ?AUTO_1538 ?AUTO_1541 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1538 ?AUTO_1540 ?AUTO_1541 )
      ( DELIVER-PKG ?AUTO_1538 ?AUTO_1539 )
      ( DELIVER-PKG-VERIFY ?AUTO_1538 ?AUTO_1539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1545 - OBJ
      ?AUTO_1546 - LOCATION
    )
    :vars
    (
      ?AUTO_1547 - LOCATION
      ?AUTO_1549 - CITY
      ?AUTO_1548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1547 ?AUTO_1549 ) ( IN-CITY ?AUTO_1546 ?AUTO_1549 ) ( not ( = ?AUTO_1546 ?AUTO_1547 ) ) ( OBJ-AT ?AUTO_1545 ?AUTO_1547 ) ( TRUCK-AT ?AUTO_1548 ?AUTO_1546 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1548 ?AUTO_1546 ?AUTO_1547 ?AUTO_1549 )
      ( DELIVER-PKG ?AUTO_1545 ?AUTO_1546 )
      ( DELIVER-PKG-VERIFY ?AUTO_1545 ?AUTO_1546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1564 - OBJ
      ?AUTO_1565 - LOCATION
    )
    :vars
    (
      ?AUTO_1568 - LOCATION
      ?AUTO_1567 - CITY
      ?AUTO_1566 - TRUCK
      ?AUTO_1569 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1568 ?AUTO_1567 ) ( IN-CITY ?AUTO_1565 ?AUTO_1567 ) ( not ( = ?AUTO_1565 ?AUTO_1568 ) ) ( TRUCK-AT ?AUTO_1566 ?AUTO_1565 ) ( IN-AIRPLANE ?AUTO_1564 ?AUTO_1569 ) ( AIRPLANE-AT ?AUTO_1569 ?AUTO_1568 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1564 ?AUTO_1569 ?AUTO_1568 )
      ( DELIVER-PKG ?AUTO_1564 ?AUTO_1565 )
      ( DELIVER-PKG-VERIFY ?AUTO_1564 ?AUTO_1565 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1586 - OBJ
      ?AUTO_1587 - LOCATION
    )
    :vars
    (
      ?AUTO_1589 - TRUCK
      ?AUTO_1591 - LOCATION
      ?AUTO_1590 - CITY
      ?AUTO_1592 - LOCATION
      ?AUTO_1588 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1589 ?AUTO_1591 ) ( IN-CITY ?AUTO_1591 ?AUTO_1590 ) ( IN-CITY ?AUTO_1587 ?AUTO_1590 ) ( not ( = ?AUTO_1587 ?AUTO_1591 ) ) ( AIRPORT ?AUTO_1592 ) ( AIRPORT ?AUTO_1591 ) ( AIRPLANE-AT ?AUTO_1588 ?AUTO_1592 ) ( not ( = ?AUTO_1592 ?AUTO_1591 ) ) ( not ( = ?AUTO_1587 ?AUTO_1592 ) ) ( OBJ-AT ?AUTO_1586 ?AUTO_1592 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1586 ?AUTO_1588 ?AUTO_1592 )
      ( DELIVER-PKG ?AUTO_1586 ?AUTO_1587 )
      ( DELIVER-PKG-VERIFY ?AUTO_1586 ?AUTO_1587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1593 - OBJ
      ?AUTO_1594 - LOCATION
    )
    :vars
    (
      ?AUTO_1596 - TRUCK
      ?AUTO_1597 - LOCATION
      ?AUTO_1598 - CITY
      ?AUTO_1599 - LOCATION
      ?AUTO_1600 - LOCATION
      ?AUTO_1595 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1596 ?AUTO_1597 ) ( IN-CITY ?AUTO_1597 ?AUTO_1598 ) ( IN-CITY ?AUTO_1594 ?AUTO_1598 ) ( not ( = ?AUTO_1594 ?AUTO_1597 ) ) ( AIRPORT ?AUTO_1599 ) ( AIRPORT ?AUTO_1597 ) ( not ( = ?AUTO_1599 ?AUTO_1597 ) ) ( not ( = ?AUTO_1594 ?AUTO_1599 ) ) ( OBJ-AT ?AUTO_1593 ?AUTO_1599 ) ( AIRPORT ?AUTO_1600 ) ( AIRPLANE-AT ?AUTO_1595 ?AUTO_1600 ) ( not ( = ?AUTO_1600 ?AUTO_1599 ) ) ( not ( = ?AUTO_1594 ?AUTO_1600 ) ) ( not ( = ?AUTO_1597 ?AUTO_1600 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1595 ?AUTO_1600 ?AUTO_1599 )
      ( DELIVER-PKG ?AUTO_1593 ?AUTO_1594 )
      ( DELIVER-PKG-VERIFY ?AUTO_1593 ?AUTO_1594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1617 - OBJ
      ?AUTO_1618 - LOCATION
    )
    :vars
    (
      ?AUTO_1619 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1617 ?AUTO_1619 ) ( AIRPLANE-AT ?AUTO_1619 ?AUTO_1618 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1617 ?AUTO_1619 ?AUTO_1618 )
      ( DELIVER-PKG-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1622 - OBJ
      ?AUTO_1623 - LOCATION
    )
    :vars
    (
      ?AUTO_1624 - AIRPLANE
      ?AUTO_1625 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1622 ?AUTO_1624 ) ( AIRPORT ?AUTO_1625 ) ( AIRPORT ?AUTO_1623 ) ( AIRPLANE-AT ?AUTO_1624 ?AUTO_1625 ) ( not ( = ?AUTO_1625 ?AUTO_1623 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1624 ?AUTO_1625 ?AUTO_1623 )
      ( DELIVER-PKG ?AUTO_1622 ?AUTO_1623 )
      ( DELIVER-PKG-VERIFY ?AUTO_1622 ?AUTO_1623 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1632 - OBJ
      ?AUTO_1633 - LOCATION
    )
    :vars
    (
      ?AUTO_1635 - LOCATION
      ?AUTO_1634 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1635 ) ( AIRPORT ?AUTO_1633 ) ( AIRPLANE-AT ?AUTO_1634 ?AUTO_1635 ) ( not ( = ?AUTO_1635 ?AUTO_1633 ) ) ( OBJ-AT ?AUTO_1632 ?AUTO_1635 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1632 ?AUTO_1634 ?AUTO_1635 )
      ( DELIVER-PKG ?AUTO_1632 ?AUTO_1633 )
      ( DELIVER-PKG-VERIFY ?AUTO_1632 ?AUTO_1633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1640 - OBJ
      ?AUTO_1641 - LOCATION
    )
    :vars
    (
      ?AUTO_1642 - LOCATION
      ?AUTO_1643 - AIRPLANE
      ?AUTO_1644 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1642 ) ( AIRPORT ?AUTO_1641 ) ( AIRPLANE-AT ?AUTO_1643 ?AUTO_1642 ) ( not ( = ?AUTO_1642 ?AUTO_1641 ) ) ( TRUCK-AT ?AUTO_1644 ?AUTO_1642 ) ( IN-TRUCK ?AUTO_1640 ?AUTO_1644 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1640 ?AUTO_1644 ?AUTO_1642 )
      ( DELIVER-PKG ?AUTO_1640 ?AUTO_1641 )
      ( DELIVER-PKG-VERIFY ?AUTO_1640 ?AUTO_1641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1645 - OBJ
      ?AUTO_1646 - LOCATION
    )
    :vars
    (
      ?AUTO_1648 - LOCATION
      ?AUTO_1647 - AIRPLANE
      ?AUTO_1649 - TRUCK
      ?AUTO_1650 - LOCATION
      ?AUTO_1651 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1648 ) ( AIRPORT ?AUTO_1646 ) ( AIRPLANE-AT ?AUTO_1647 ?AUTO_1648 ) ( not ( = ?AUTO_1648 ?AUTO_1646 ) ) ( IN-TRUCK ?AUTO_1645 ?AUTO_1649 ) ( TRUCK-AT ?AUTO_1649 ?AUTO_1650 ) ( IN-CITY ?AUTO_1650 ?AUTO_1651 ) ( IN-CITY ?AUTO_1648 ?AUTO_1651 ) ( not ( = ?AUTO_1648 ?AUTO_1650 ) ) ( not ( = ?AUTO_1646 ?AUTO_1650 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1649 ?AUTO_1650 ?AUTO_1648 ?AUTO_1651 )
      ( DELIVER-PKG ?AUTO_1645 ?AUTO_1646 )
      ( DELIVER-PKG-VERIFY ?AUTO_1645 ?AUTO_1646 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1674 - OBJ
      ?AUTO_1675 - LOCATION
    )
    :vars
    (
      ?AUTO_1679 - LOCATION
      ?AUTO_1678 - TRUCK
      ?AUTO_1676 - LOCATION
      ?AUTO_1677 - CITY
      ?AUTO_1681 - LOCATION
      ?AUTO_1680 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1679 ) ( AIRPORT ?AUTO_1675 ) ( not ( = ?AUTO_1679 ?AUTO_1675 ) ) ( IN-TRUCK ?AUTO_1674 ?AUTO_1678 ) ( TRUCK-AT ?AUTO_1678 ?AUTO_1676 ) ( IN-CITY ?AUTO_1676 ?AUTO_1677 ) ( IN-CITY ?AUTO_1679 ?AUTO_1677 ) ( not ( = ?AUTO_1679 ?AUTO_1676 ) ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( AIRPORT ?AUTO_1681 ) ( AIRPLANE-AT ?AUTO_1680 ?AUTO_1681 ) ( not ( = ?AUTO_1681 ?AUTO_1679 ) ) ( not ( = ?AUTO_1675 ?AUTO_1681 ) ) ( not ( = ?AUTO_1676 ?AUTO_1681 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1680 ?AUTO_1681 ?AUTO_1679 )
      ( DELIVER-PKG ?AUTO_1674 ?AUTO_1675 )
      ( DELIVER-PKG-VERIFY ?AUTO_1674 ?AUTO_1675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1700 - OBJ
      ?AUTO_1701 - LOCATION
    )
    :vars
    (
      ?AUTO_1706 - LOCATION
      ?AUTO_1702 - TRUCK
      ?AUTO_1705 - LOCATION
      ?AUTO_1703 - CITY
      ?AUTO_1707 - LOCATION
      ?AUTO_1704 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1706 ) ( AIRPORT ?AUTO_1701 ) ( not ( = ?AUTO_1706 ?AUTO_1701 ) ) ( TRUCK-AT ?AUTO_1702 ?AUTO_1705 ) ( IN-CITY ?AUTO_1705 ?AUTO_1703 ) ( IN-CITY ?AUTO_1706 ?AUTO_1703 ) ( not ( = ?AUTO_1706 ?AUTO_1705 ) ) ( not ( = ?AUTO_1701 ?AUTO_1705 ) ) ( AIRPORT ?AUTO_1707 ) ( AIRPLANE-AT ?AUTO_1704 ?AUTO_1707 ) ( not ( = ?AUTO_1707 ?AUTO_1706 ) ) ( not ( = ?AUTO_1701 ?AUTO_1707 ) ) ( not ( = ?AUTO_1705 ?AUTO_1707 ) ) ( OBJ-AT ?AUTO_1700 ?AUTO_1705 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1700 ?AUTO_1702 ?AUTO_1705 )
      ( DELIVER-PKG ?AUTO_1700 ?AUTO_1701 )
      ( DELIVER-PKG-VERIFY ?AUTO_1700 ?AUTO_1701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1716 - OBJ
      ?AUTO_1717 - LOCATION
    )
    :vars
    (
      ?AUTO_1718 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1716 ?AUTO_1718 ) ( AIRPLANE-AT ?AUTO_1718 ?AUTO_1717 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1716 ?AUTO_1718 ?AUTO_1717 )
      ( DELIVER-PKG-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1719 - OBJ
      ?AUTO_1720 - LOCATION
    )
    :vars
    (
      ?AUTO_1721 - AIRPLANE
      ?AUTO_1722 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1719 ?AUTO_1721 ) ( AIRPORT ?AUTO_1722 ) ( AIRPORT ?AUTO_1720 ) ( AIRPLANE-AT ?AUTO_1721 ?AUTO_1722 ) ( not ( = ?AUTO_1722 ?AUTO_1720 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1721 ?AUTO_1722 ?AUTO_1720 )
      ( DELIVER-PKG ?AUTO_1719 ?AUTO_1720 )
      ( DELIVER-PKG-VERIFY ?AUTO_1719 ?AUTO_1720 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1731 - OBJ
      ?AUTO_1732 - LOCATION
    )
    :vars
    (
      ?AUTO_1733 - LOCATION
      ?AUTO_1734 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1733 ) ( AIRPORT ?AUTO_1732 ) ( AIRPLANE-AT ?AUTO_1734 ?AUTO_1733 ) ( not ( = ?AUTO_1733 ?AUTO_1732 ) ) ( OBJ-AT ?AUTO_1731 ?AUTO_1733 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1731 ?AUTO_1734 ?AUTO_1733 )
      ( DELIVER-PKG ?AUTO_1731 ?AUTO_1732 )
      ( DELIVER-PKG-VERIFY ?AUTO_1731 ?AUTO_1732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1735 - OBJ
      ?AUTO_1736 - LOCATION
    )
    :vars
    (
      ?AUTO_1737 - LOCATION
      ?AUTO_1739 - LOCATION
      ?AUTO_1738 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1737 ) ( AIRPORT ?AUTO_1736 ) ( not ( = ?AUTO_1737 ?AUTO_1736 ) ) ( OBJ-AT ?AUTO_1735 ?AUTO_1737 ) ( AIRPORT ?AUTO_1739 ) ( AIRPLANE-AT ?AUTO_1738 ?AUTO_1739 ) ( not ( = ?AUTO_1739 ?AUTO_1737 ) ) ( not ( = ?AUTO_1736 ?AUTO_1739 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1738 ?AUTO_1739 ?AUTO_1737 )
      ( DELIVER-PKG ?AUTO_1735 ?AUTO_1736 )
      ( DELIVER-PKG-VERIFY ?AUTO_1735 ?AUTO_1736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1752 - OBJ
      ?AUTO_1753 - LOCATION
    )
    :vars
    (
      ?AUTO_1754 - LOCATION
      ?AUTO_1756 - LOCATION
      ?AUTO_1755 - AIRPLANE
      ?AUTO_1757 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1754 ) ( AIRPORT ?AUTO_1753 ) ( not ( = ?AUTO_1754 ?AUTO_1753 ) ) ( AIRPORT ?AUTO_1756 ) ( AIRPLANE-AT ?AUTO_1755 ?AUTO_1756 ) ( not ( = ?AUTO_1756 ?AUTO_1754 ) ) ( not ( = ?AUTO_1753 ?AUTO_1756 ) ) ( TRUCK-AT ?AUTO_1757 ?AUTO_1754 ) ( IN-TRUCK ?AUTO_1752 ?AUTO_1757 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1752 ?AUTO_1757 ?AUTO_1754 )
      ( DELIVER-PKG ?AUTO_1752 ?AUTO_1753 )
      ( DELIVER-PKG-VERIFY ?AUTO_1752 ?AUTO_1753 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1758 - OBJ
      ?AUTO_1759 - LOCATION
    )
    :vars
    (
      ?AUTO_1761 - LOCATION
      ?AUTO_1763 - LOCATION
      ?AUTO_1760 - AIRPLANE
      ?AUTO_1762 - TRUCK
      ?AUTO_1764 - LOCATION
      ?AUTO_1765 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1761 ) ( AIRPORT ?AUTO_1759 ) ( not ( = ?AUTO_1761 ?AUTO_1759 ) ) ( AIRPORT ?AUTO_1763 ) ( AIRPLANE-AT ?AUTO_1760 ?AUTO_1763 ) ( not ( = ?AUTO_1763 ?AUTO_1761 ) ) ( not ( = ?AUTO_1759 ?AUTO_1763 ) ) ( IN-TRUCK ?AUTO_1758 ?AUTO_1762 ) ( TRUCK-AT ?AUTO_1762 ?AUTO_1764 ) ( IN-CITY ?AUTO_1764 ?AUTO_1765 ) ( IN-CITY ?AUTO_1761 ?AUTO_1765 ) ( not ( = ?AUTO_1761 ?AUTO_1764 ) ) ( not ( = ?AUTO_1759 ?AUTO_1764 ) ) ( not ( = ?AUTO_1763 ?AUTO_1764 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1762 ?AUTO_1764 ?AUTO_1761 ?AUTO_1765 )
      ( DELIVER-PKG ?AUTO_1758 ?AUTO_1759 )
      ( DELIVER-PKG-VERIFY ?AUTO_1758 ?AUTO_1759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1768 - OBJ
      ?AUTO_1769 - LOCATION
    )
    :vars
    (
      ?AUTO_1773 - LOCATION
      ?AUTO_1770 - LOCATION
      ?AUTO_1774 - AIRPLANE
      ?AUTO_1772 - TRUCK
      ?AUTO_1771 - LOCATION
      ?AUTO_1775 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1773 ) ( AIRPORT ?AUTO_1769 ) ( not ( = ?AUTO_1773 ?AUTO_1769 ) ) ( AIRPORT ?AUTO_1770 ) ( AIRPLANE-AT ?AUTO_1774 ?AUTO_1770 ) ( not ( = ?AUTO_1770 ?AUTO_1773 ) ) ( not ( = ?AUTO_1769 ?AUTO_1770 ) ) ( TRUCK-AT ?AUTO_1772 ?AUTO_1771 ) ( IN-CITY ?AUTO_1771 ?AUTO_1775 ) ( IN-CITY ?AUTO_1773 ?AUTO_1775 ) ( not ( = ?AUTO_1773 ?AUTO_1771 ) ) ( not ( = ?AUTO_1769 ?AUTO_1771 ) ) ( not ( = ?AUTO_1770 ?AUTO_1771 ) ) ( OBJ-AT ?AUTO_1768 ?AUTO_1771 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1768 ?AUTO_1772 ?AUTO_1771 )
      ( DELIVER-PKG ?AUTO_1768 ?AUTO_1769 )
      ( DELIVER-PKG-VERIFY ?AUTO_1768 ?AUTO_1769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1776 - OBJ
      ?AUTO_1777 - LOCATION
    )
    :vars
    (
      ?AUTO_1780 - LOCATION
      ?AUTO_1782 - LOCATION
      ?AUTO_1781 - AIRPLANE
      ?AUTO_1783 - LOCATION
      ?AUTO_1778 - CITY
      ?AUTO_1779 - TRUCK
      ?AUTO_1784 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1780 ) ( AIRPORT ?AUTO_1777 ) ( not ( = ?AUTO_1780 ?AUTO_1777 ) ) ( AIRPORT ?AUTO_1782 ) ( AIRPLANE-AT ?AUTO_1781 ?AUTO_1782 ) ( not ( = ?AUTO_1782 ?AUTO_1780 ) ) ( not ( = ?AUTO_1777 ?AUTO_1782 ) ) ( IN-CITY ?AUTO_1783 ?AUTO_1778 ) ( IN-CITY ?AUTO_1780 ?AUTO_1778 ) ( not ( = ?AUTO_1780 ?AUTO_1783 ) ) ( not ( = ?AUTO_1777 ?AUTO_1783 ) ) ( not ( = ?AUTO_1782 ?AUTO_1783 ) ) ( OBJ-AT ?AUTO_1776 ?AUTO_1783 ) ( TRUCK-AT ?AUTO_1779 ?AUTO_1784 ) ( IN-CITY ?AUTO_1784 ?AUTO_1778 ) ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) ( not ( = ?AUTO_1777 ?AUTO_1784 ) ) ( not ( = ?AUTO_1780 ?AUTO_1784 ) ) ( not ( = ?AUTO_1782 ?AUTO_1784 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1779 ?AUTO_1784 ?AUTO_1783 ?AUTO_1778 )
      ( DELIVER-PKG ?AUTO_1776 ?AUTO_1777 )
      ( DELIVER-PKG-VERIFY ?AUTO_1776 ?AUTO_1777 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1825 - OBJ
      ?AUTO_1826 - LOCATION
    )
    :vars
    (
      ?AUTO_1827 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1827 ?AUTO_1826 ) ( IN-TRUCK ?AUTO_1825 ?AUTO_1827 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1825 ?AUTO_1827 ?AUTO_1826 )
      ( DELIVER-PKG-VERIFY ?AUTO_1825 ?AUTO_1826 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1828 - OBJ
      ?AUTO_1829 - LOCATION
    )
    :vars
    (
      ?AUTO_1830 - TRUCK
      ?AUTO_1831 - LOCATION
      ?AUTO_1832 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1828 ?AUTO_1830 ) ( TRUCK-AT ?AUTO_1830 ?AUTO_1831 ) ( IN-CITY ?AUTO_1831 ?AUTO_1832 ) ( IN-CITY ?AUTO_1829 ?AUTO_1832 ) ( not ( = ?AUTO_1829 ?AUTO_1831 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1830 ?AUTO_1831 ?AUTO_1829 ?AUTO_1832 )
      ( DELIVER-PKG ?AUTO_1828 ?AUTO_1829 )
      ( DELIVER-PKG-VERIFY ?AUTO_1828 ?AUTO_1829 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1833 - OBJ
      ?AUTO_1834 - LOCATION
    )
    :vars
    (
      ?AUTO_1835 - TRUCK
      ?AUTO_1836 - LOCATION
      ?AUTO_1837 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1835 ?AUTO_1836 ) ( IN-CITY ?AUTO_1836 ?AUTO_1837 ) ( IN-CITY ?AUTO_1834 ?AUTO_1837 ) ( not ( = ?AUTO_1834 ?AUTO_1836 ) ) ( OBJ-AT ?AUTO_1833 ?AUTO_1836 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1833 ?AUTO_1835 ?AUTO_1836 )
      ( DELIVER-PKG ?AUTO_1833 ?AUTO_1834 )
      ( DELIVER-PKG-VERIFY ?AUTO_1833 ?AUTO_1834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1838 - OBJ
      ?AUTO_1839 - LOCATION
    )
    :vars
    (
      ?AUTO_1841 - TRUCK
      ?AUTO_1840 - LOCATION
      ?AUTO_1842 - CITY
      ?AUTO_1843 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1841 ?AUTO_1840 ) ( IN-CITY ?AUTO_1840 ?AUTO_1842 ) ( IN-CITY ?AUTO_1839 ?AUTO_1842 ) ( not ( = ?AUTO_1839 ?AUTO_1840 ) ) ( IN-AIRPLANE ?AUTO_1838 ?AUTO_1843 ) ( AIRPLANE-AT ?AUTO_1843 ?AUTO_1840 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1838 ?AUTO_1843 ?AUTO_1840 )
      ( DELIVER-PKG ?AUTO_1838 ?AUTO_1839 )
      ( DELIVER-PKG-VERIFY ?AUTO_1838 ?AUTO_1839 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1844 - OBJ
      ?AUTO_1845 - LOCATION
    )
    :vars
    (
      ?AUTO_1847 - TRUCK
      ?AUTO_1848 - LOCATION
      ?AUTO_1846 - CITY
      ?AUTO_1849 - AIRPLANE
      ?AUTO_1850 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1847 ?AUTO_1848 ) ( IN-CITY ?AUTO_1848 ?AUTO_1846 ) ( IN-CITY ?AUTO_1845 ?AUTO_1846 ) ( not ( = ?AUTO_1845 ?AUTO_1848 ) ) ( IN-AIRPLANE ?AUTO_1844 ?AUTO_1849 ) ( AIRPORT ?AUTO_1850 ) ( AIRPORT ?AUTO_1848 ) ( AIRPLANE-AT ?AUTO_1849 ?AUTO_1850 ) ( not ( = ?AUTO_1850 ?AUTO_1848 ) ) ( not ( = ?AUTO_1845 ?AUTO_1850 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1849 ?AUTO_1850 ?AUTO_1848 )
      ( DELIVER-PKG ?AUTO_1844 ?AUTO_1845 )
      ( DELIVER-PKG-VERIFY ?AUTO_1844 ?AUTO_1845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1859 - OBJ
      ?AUTO_1860 - LOCATION
    )
    :vars
    (
      ?AUTO_1861 - TRUCK
      ?AUTO_1864 - LOCATION
      ?AUTO_1865 - CITY
      ?AUTO_1863 - LOCATION
      ?AUTO_1862 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1861 ?AUTO_1864 ) ( IN-CITY ?AUTO_1864 ?AUTO_1865 ) ( IN-CITY ?AUTO_1860 ?AUTO_1865 ) ( not ( = ?AUTO_1860 ?AUTO_1864 ) ) ( AIRPORT ?AUTO_1863 ) ( AIRPORT ?AUTO_1864 ) ( AIRPLANE-AT ?AUTO_1862 ?AUTO_1863 ) ( not ( = ?AUTO_1863 ?AUTO_1864 ) ) ( not ( = ?AUTO_1860 ?AUTO_1863 ) ) ( OBJ-AT ?AUTO_1859 ?AUTO_1863 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1859 ?AUTO_1862 ?AUTO_1863 )
      ( DELIVER-PKG ?AUTO_1859 ?AUTO_1860 )
      ( DELIVER-PKG-VERIFY ?AUTO_1859 ?AUTO_1860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1866 - OBJ
      ?AUTO_1867 - LOCATION
    )
    :vars
    (
      ?AUTO_1869 - TRUCK
      ?AUTO_1871 - LOCATION
      ?AUTO_1872 - CITY
      ?AUTO_1870 - LOCATION
      ?AUTO_1873 - LOCATION
      ?AUTO_1868 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1869 ?AUTO_1871 ) ( IN-CITY ?AUTO_1871 ?AUTO_1872 ) ( IN-CITY ?AUTO_1867 ?AUTO_1872 ) ( not ( = ?AUTO_1867 ?AUTO_1871 ) ) ( AIRPORT ?AUTO_1870 ) ( AIRPORT ?AUTO_1871 ) ( not ( = ?AUTO_1870 ?AUTO_1871 ) ) ( not ( = ?AUTO_1867 ?AUTO_1870 ) ) ( OBJ-AT ?AUTO_1866 ?AUTO_1870 ) ( AIRPORT ?AUTO_1873 ) ( AIRPLANE-AT ?AUTO_1868 ?AUTO_1873 ) ( not ( = ?AUTO_1873 ?AUTO_1870 ) ) ( not ( = ?AUTO_1867 ?AUTO_1873 ) ) ( not ( = ?AUTO_1871 ?AUTO_1873 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1868 ?AUTO_1873 ?AUTO_1870 )
      ( DELIVER-PKG ?AUTO_1866 ?AUTO_1867 )
      ( DELIVER-PKG-VERIFY ?AUTO_1866 ?AUTO_1867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1886 - OBJ
      ?AUTO_1887 - LOCATION
    )
    :vars
    (
      ?AUTO_1891 - TRUCK
      ?AUTO_1892 - LOCATION
      ?AUTO_1893 - CITY
      ?AUTO_1889 - LOCATION
      ?AUTO_1890 - LOCATION
      ?AUTO_1888 - AIRPLANE
      ?AUTO_1894 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1891 ?AUTO_1892 ) ( IN-CITY ?AUTO_1892 ?AUTO_1893 ) ( IN-CITY ?AUTO_1887 ?AUTO_1893 ) ( not ( = ?AUTO_1887 ?AUTO_1892 ) ) ( AIRPORT ?AUTO_1889 ) ( AIRPORT ?AUTO_1892 ) ( not ( = ?AUTO_1889 ?AUTO_1892 ) ) ( not ( = ?AUTO_1887 ?AUTO_1889 ) ) ( AIRPORT ?AUTO_1890 ) ( AIRPLANE-AT ?AUTO_1888 ?AUTO_1890 ) ( not ( = ?AUTO_1890 ?AUTO_1889 ) ) ( not ( = ?AUTO_1887 ?AUTO_1890 ) ) ( not ( = ?AUTO_1892 ?AUTO_1890 ) ) ( TRUCK-AT ?AUTO_1894 ?AUTO_1889 ) ( IN-TRUCK ?AUTO_1886 ?AUTO_1894 ) ( not ( = ?AUTO_1891 ?AUTO_1894 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1886 ?AUTO_1894 ?AUTO_1889 )
      ( DELIVER-PKG ?AUTO_1886 ?AUTO_1887 )
      ( DELIVER-PKG-VERIFY ?AUTO_1886 ?AUTO_1887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1895 - OBJ
      ?AUTO_1896 - LOCATION
    )
    :vars
    (
      ?AUTO_1903 - TRUCK
      ?AUTO_1901 - LOCATION
      ?AUTO_1898 - CITY
      ?AUTO_1897 - LOCATION
      ?AUTO_1902 - LOCATION
      ?AUTO_1899 - AIRPLANE
      ?AUTO_1900 - TRUCK
      ?AUTO_1904 - LOCATION
      ?AUTO_1905 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1903 ?AUTO_1901 ) ( IN-CITY ?AUTO_1901 ?AUTO_1898 ) ( IN-CITY ?AUTO_1896 ?AUTO_1898 ) ( not ( = ?AUTO_1896 ?AUTO_1901 ) ) ( AIRPORT ?AUTO_1897 ) ( AIRPORT ?AUTO_1901 ) ( not ( = ?AUTO_1897 ?AUTO_1901 ) ) ( not ( = ?AUTO_1896 ?AUTO_1897 ) ) ( AIRPORT ?AUTO_1902 ) ( AIRPLANE-AT ?AUTO_1899 ?AUTO_1902 ) ( not ( = ?AUTO_1902 ?AUTO_1897 ) ) ( not ( = ?AUTO_1896 ?AUTO_1902 ) ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) ( IN-TRUCK ?AUTO_1895 ?AUTO_1900 ) ( not ( = ?AUTO_1903 ?AUTO_1900 ) ) ( TRUCK-AT ?AUTO_1900 ?AUTO_1904 ) ( IN-CITY ?AUTO_1904 ?AUTO_1905 ) ( IN-CITY ?AUTO_1897 ?AUTO_1905 ) ( not ( = ?AUTO_1897 ?AUTO_1904 ) ) ( not ( = ?AUTO_1896 ?AUTO_1904 ) ) ( not ( = ?AUTO_1901 ?AUTO_1904 ) ) ( not ( = ?AUTO_1898 ?AUTO_1905 ) ) ( not ( = ?AUTO_1902 ?AUTO_1904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1900 ?AUTO_1904 ?AUTO_1897 ?AUTO_1905 )
      ( DELIVER-PKG ?AUTO_1895 ?AUTO_1896 )
      ( DELIVER-PKG-VERIFY ?AUTO_1895 ?AUTO_1896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1908 - OBJ
      ?AUTO_1909 - LOCATION
    )
    :vars
    (
      ?AUTO_1918 - TRUCK
      ?AUTO_1911 - LOCATION
      ?AUTO_1917 - CITY
      ?AUTO_1915 - LOCATION
      ?AUTO_1916 - LOCATION
      ?AUTO_1910 - AIRPLANE
      ?AUTO_1912 - TRUCK
      ?AUTO_1914 - LOCATION
      ?AUTO_1913 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1918 ?AUTO_1911 ) ( IN-CITY ?AUTO_1911 ?AUTO_1917 ) ( IN-CITY ?AUTO_1909 ?AUTO_1917 ) ( not ( = ?AUTO_1909 ?AUTO_1911 ) ) ( AIRPORT ?AUTO_1915 ) ( AIRPORT ?AUTO_1911 ) ( not ( = ?AUTO_1915 ?AUTO_1911 ) ) ( not ( = ?AUTO_1909 ?AUTO_1915 ) ) ( AIRPORT ?AUTO_1916 ) ( AIRPLANE-AT ?AUTO_1910 ?AUTO_1916 ) ( not ( = ?AUTO_1916 ?AUTO_1915 ) ) ( not ( = ?AUTO_1909 ?AUTO_1916 ) ) ( not ( = ?AUTO_1911 ?AUTO_1916 ) ) ( not ( = ?AUTO_1918 ?AUTO_1912 ) ) ( TRUCK-AT ?AUTO_1912 ?AUTO_1914 ) ( IN-CITY ?AUTO_1914 ?AUTO_1913 ) ( IN-CITY ?AUTO_1915 ?AUTO_1913 ) ( not ( = ?AUTO_1915 ?AUTO_1914 ) ) ( not ( = ?AUTO_1909 ?AUTO_1914 ) ) ( not ( = ?AUTO_1911 ?AUTO_1914 ) ) ( not ( = ?AUTO_1917 ?AUTO_1913 ) ) ( not ( = ?AUTO_1916 ?AUTO_1914 ) ) ( OBJ-AT ?AUTO_1908 ?AUTO_1914 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1908 ?AUTO_1912 ?AUTO_1914 )
      ( DELIVER-PKG ?AUTO_1908 ?AUTO_1909 )
      ( DELIVER-PKG-VERIFY ?AUTO_1908 ?AUTO_1909 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1919 - OBJ
      ?AUTO_1920 - LOCATION
    )
    :vars
    (
      ?AUTO_1929 - TRUCK
      ?AUTO_1928 - LOCATION
      ?AUTO_1925 - CITY
      ?AUTO_1922 - LOCATION
      ?AUTO_1924 - LOCATION
      ?AUTO_1921 - AIRPLANE
      ?AUTO_1927 - TRUCK
      ?AUTO_1923 - LOCATION
      ?AUTO_1926 - CITY
      ?AUTO_1930 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1929 ?AUTO_1928 ) ( IN-CITY ?AUTO_1928 ?AUTO_1925 ) ( IN-CITY ?AUTO_1920 ?AUTO_1925 ) ( not ( = ?AUTO_1920 ?AUTO_1928 ) ) ( AIRPORT ?AUTO_1922 ) ( AIRPORT ?AUTO_1928 ) ( not ( = ?AUTO_1922 ?AUTO_1928 ) ) ( not ( = ?AUTO_1920 ?AUTO_1922 ) ) ( AIRPORT ?AUTO_1924 ) ( AIRPLANE-AT ?AUTO_1921 ?AUTO_1924 ) ( not ( = ?AUTO_1924 ?AUTO_1922 ) ) ( not ( = ?AUTO_1920 ?AUTO_1924 ) ) ( not ( = ?AUTO_1928 ?AUTO_1924 ) ) ( not ( = ?AUTO_1929 ?AUTO_1927 ) ) ( IN-CITY ?AUTO_1923 ?AUTO_1926 ) ( IN-CITY ?AUTO_1922 ?AUTO_1926 ) ( not ( = ?AUTO_1922 ?AUTO_1923 ) ) ( not ( = ?AUTO_1920 ?AUTO_1923 ) ) ( not ( = ?AUTO_1928 ?AUTO_1923 ) ) ( not ( = ?AUTO_1925 ?AUTO_1926 ) ) ( not ( = ?AUTO_1924 ?AUTO_1923 ) ) ( OBJ-AT ?AUTO_1919 ?AUTO_1923 ) ( TRUCK-AT ?AUTO_1927 ?AUTO_1930 ) ( IN-CITY ?AUTO_1930 ?AUTO_1926 ) ( not ( = ?AUTO_1923 ?AUTO_1930 ) ) ( not ( = ?AUTO_1920 ?AUTO_1930 ) ) ( not ( = ?AUTO_1928 ?AUTO_1930 ) ) ( not ( = ?AUTO_1922 ?AUTO_1930 ) ) ( not ( = ?AUTO_1924 ?AUTO_1930 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1927 ?AUTO_1930 ?AUTO_1923 ?AUTO_1926 )
      ( DELIVER-PKG ?AUTO_1919 ?AUTO_1920 )
      ( DELIVER-PKG-VERIFY ?AUTO_1919 ?AUTO_1920 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1971 - OBJ
      ?AUTO_1972 - LOCATION
    )
    :vars
    (
      ?AUTO_1973 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1971 ?AUTO_1973 ) ( AIRPLANE-AT ?AUTO_1973 ?AUTO_1972 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1971 ?AUTO_1973 ?AUTO_1972 )
      ( DELIVER-PKG-VERIFY ?AUTO_1971 ?AUTO_1972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1990 - OBJ
      ?AUTO_1991 - LOCATION
    )
    :vars
    (
      ?AUTO_1995 - TRUCK
      ?AUTO_1992 - LOCATION
      ?AUTO_1993 - CITY
      ?AUTO_1994 - LOCATION
      ?AUTO_1996 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1995 ?AUTO_1992 ) ( IN-CITY ?AUTO_1992 ?AUTO_1993 ) ( IN-CITY ?AUTO_1991 ?AUTO_1993 ) ( not ( = ?AUTO_1991 ?AUTO_1992 ) ) ( AIRPORT ?AUTO_1994 ) ( AIRPORT ?AUTO_1992 ) ( AIRPLANE-AT ?AUTO_1996 ?AUTO_1994 ) ( not ( = ?AUTO_1994 ?AUTO_1992 ) ) ( not ( = ?AUTO_1991 ?AUTO_1994 ) ) ( OBJ-AT ?AUTO_1990 ?AUTO_1994 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1990 ?AUTO_1996 ?AUTO_1994 )
      ( DELIVER-PKG ?AUTO_1990 ?AUTO_1991 )
      ( DELIVER-PKG-VERIFY ?AUTO_1990 ?AUTO_1991 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2011 - OBJ
      ?AUTO_2012 - LOCATION
    )
    :vars
    (
      ?AUTO_2016 - TRUCK
      ?AUTO_2017 - LOCATION
      ?AUTO_2013 - CITY
      ?AUTO_2015 - LOCATION
      ?AUTO_2018 - LOCATION
      ?AUTO_2014 - AIRPLANE
      ?AUTO_2019 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2016 ?AUTO_2017 ) ( IN-CITY ?AUTO_2017 ?AUTO_2013 ) ( IN-CITY ?AUTO_2012 ?AUTO_2013 ) ( not ( = ?AUTO_2012 ?AUTO_2017 ) ) ( AIRPORT ?AUTO_2015 ) ( AIRPORT ?AUTO_2017 ) ( not ( = ?AUTO_2015 ?AUTO_2017 ) ) ( not ( = ?AUTO_2012 ?AUTO_2015 ) ) ( AIRPORT ?AUTO_2018 ) ( AIRPLANE-AT ?AUTO_2014 ?AUTO_2018 ) ( not ( = ?AUTO_2018 ?AUTO_2015 ) ) ( not ( = ?AUTO_2012 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) ( TRUCK-AT ?AUTO_2019 ?AUTO_2015 ) ( IN-TRUCK ?AUTO_2011 ?AUTO_2019 ) ( not ( = ?AUTO_2016 ?AUTO_2019 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2011 ?AUTO_2019 ?AUTO_2015 )
      ( DELIVER-PKG ?AUTO_2011 ?AUTO_2012 )
      ( DELIVER-PKG-VERIFY ?AUTO_2011 ?AUTO_2012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2024 - OBJ
      ?AUTO_2025 - LOCATION
    )
    :vars
    (
      ?AUTO_2033 - TRUCK
      ?AUTO_2028 - LOCATION
      ?AUTO_2034 - CITY
      ?AUTO_2031 - LOCATION
      ?AUTO_2030 - LOCATION
      ?AUTO_2027 - AIRPLANE
      ?AUTO_2026 - TRUCK
      ?AUTO_2032 - LOCATION
      ?AUTO_2029 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2033 ?AUTO_2028 ) ( IN-CITY ?AUTO_2028 ?AUTO_2034 ) ( IN-CITY ?AUTO_2025 ?AUTO_2034 ) ( not ( = ?AUTO_2025 ?AUTO_2028 ) ) ( AIRPORT ?AUTO_2031 ) ( AIRPORT ?AUTO_2028 ) ( not ( = ?AUTO_2031 ?AUTO_2028 ) ) ( not ( = ?AUTO_2025 ?AUTO_2031 ) ) ( AIRPORT ?AUTO_2030 ) ( AIRPLANE-AT ?AUTO_2027 ?AUTO_2030 ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) ( not ( = ?AUTO_2025 ?AUTO_2030 ) ) ( not ( = ?AUTO_2028 ?AUTO_2030 ) ) ( not ( = ?AUTO_2033 ?AUTO_2026 ) ) ( TRUCK-AT ?AUTO_2026 ?AUTO_2032 ) ( IN-CITY ?AUTO_2032 ?AUTO_2029 ) ( IN-CITY ?AUTO_2031 ?AUTO_2029 ) ( not ( = ?AUTO_2031 ?AUTO_2032 ) ) ( not ( = ?AUTO_2025 ?AUTO_2032 ) ) ( not ( = ?AUTO_2028 ?AUTO_2032 ) ) ( not ( = ?AUTO_2034 ?AUTO_2029 ) ) ( not ( = ?AUTO_2030 ?AUTO_2032 ) ) ( OBJ-AT ?AUTO_2024 ?AUTO_2032 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2024 ?AUTO_2026 ?AUTO_2032 )
      ( DELIVER-PKG ?AUTO_2024 ?AUTO_2025 )
      ( DELIVER-PKG-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2079 - OBJ
      ?AUTO_2080 - LOCATION
    )
    :vars
    (
      ?AUTO_2081 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2081 ?AUTO_2080 ) ( IN-TRUCK ?AUTO_2079 ?AUTO_2081 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2079 ?AUTO_2081 ?AUTO_2080 )
      ( DELIVER-PKG-VERIFY ?AUTO_2079 ?AUTO_2080 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2082 - OBJ
      ?AUTO_2083 - LOCATION
    )
    :vars
    (
      ?AUTO_2084 - TRUCK
      ?AUTO_2085 - LOCATION
      ?AUTO_2086 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2082 ?AUTO_2084 ) ( TRUCK-AT ?AUTO_2084 ?AUTO_2085 ) ( IN-CITY ?AUTO_2085 ?AUTO_2086 ) ( IN-CITY ?AUTO_2083 ?AUTO_2086 ) ( not ( = ?AUTO_2083 ?AUTO_2085 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2084 ?AUTO_2085 ?AUTO_2083 ?AUTO_2086 )
      ( DELIVER-PKG ?AUTO_2082 ?AUTO_2083 )
      ( DELIVER-PKG-VERIFY ?AUTO_2082 ?AUTO_2083 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2087 - OBJ
      ?AUTO_2088 - LOCATION
    )
    :vars
    (
      ?AUTO_2091 - TRUCK
      ?AUTO_2089 - LOCATION
      ?AUTO_2090 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2091 ?AUTO_2089 ) ( IN-CITY ?AUTO_2089 ?AUTO_2090 ) ( IN-CITY ?AUTO_2088 ?AUTO_2090 ) ( not ( = ?AUTO_2088 ?AUTO_2089 ) ) ( OBJ-AT ?AUTO_2087 ?AUTO_2089 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2087 ?AUTO_2091 ?AUTO_2089 )
      ( DELIVER-PKG ?AUTO_2087 ?AUTO_2088 )
      ( DELIVER-PKG-VERIFY ?AUTO_2087 ?AUTO_2088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2092 - OBJ
      ?AUTO_2093 - LOCATION
    )
    :vars
    (
      ?AUTO_2094 - LOCATION
      ?AUTO_2096 - CITY
      ?AUTO_2095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2094 ?AUTO_2096 ) ( IN-CITY ?AUTO_2093 ?AUTO_2096 ) ( not ( = ?AUTO_2093 ?AUTO_2094 ) ) ( OBJ-AT ?AUTO_2092 ?AUTO_2094 ) ( TRUCK-AT ?AUTO_2095 ?AUTO_2093 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2095 ?AUTO_2093 ?AUTO_2094 ?AUTO_2096 )
      ( DELIVER-PKG ?AUTO_2092 ?AUTO_2093 )
      ( DELIVER-PKG-VERIFY ?AUTO_2092 ?AUTO_2093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2099 - OBJ
      ?AUTO_2100 - LOCATION
    )
    :vars
    (
      ?AUTO_2101 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2101 ?AUTO_2100 ) ( IN-TRUCK ?AUTO_2099 ?AUTO_2101 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2099 ?AUTO_2101 ?AUTO_2100 )
      ( DELIVER-PKG-VERIFY ?AUTO_2099 ?AUTO_2100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2102 - OBJ
      ?AUTO_2103 - LOCATION
    )
    :vars
    (
      ?AUTO_2104 - TRUCK
      ?AUTO_2105 - LOCATION
      ?AUTO_2106 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2102 ?AUTO_2104 ) ( TRUCK-AT ?AUTO_2104 ?AUTO_2105 ) ( IN-CITY ?AUTO_2105 ?AUTO_2106 ) ( IN-CITY ?AUTO_2103 ?AUTO_2106 ) ( not ( = ?AUTO_2103 ?AUTO_2105 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2104 ?AUTO_2105 ?AUTO_2103 ?AUTO_2106 )
      ( DELIVER-PKG ?AUTO_2102 ?AUTO_2103 )
      ( DELIVER-PKG-VERIFY ?AUTO_2102 ?AUTO_2103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2107 - OBJ
      ?AUTO_2108 - LOCATION
    )
    :vars
    (
      ?AUTO_2109 - TRUCK
      ?AUTO_2110 - LOCATION
      ?AUTO_2111 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2109 ?AUTO_2110 ) ( IN-CITY ?AUTO_2110 ?AUTO_2111 ) ( IN-CITY ?AUTO_2108 ?AUTO_2111 ) ( not ( = ?AUTO_2108 ?AUTO_2110 ) ) ( OBJ-AT ?AUTO_2107 ?AUTO_2110 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2107 ?AUTO_2109 ?AUTO_2110 )
      ( DELIVER-PKG ?AUTO_2107 ?AUTO_2108 )
      ( DELIVER-PKG-VERIFY ?AUTO_2107 ?AUTO_2108 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2112 - OBJ
      ?AUTO_2113 - LOCATION
    )
    :vars
    (
      ?AUTO_2114 - LOCATION
      ?AUTO_2116 - CITY
      ?AUTO_2115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2114 ?AUTO_2116 ) ( IN-CITY ?AUTO_2113 ?AUTO_2116 ) ( not ( = ?AUTO_2113 ?AUTO_2114 ) ) ( OBJ-AT ?AUTO_2112 ?AUTO_2114 ) ( TRUCK-AT ?AUTO_2115 ?AUTO_2113 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2115 ?AUTO_2113 ?AUTO_2114 ?AUTO_2116 )
      ( DELIVER-PKG ?AUTO_2112 ?AUTO_2113 )
      ( DELIVER-PKG-VERIFY ?AUTO_2112 ?AUTO_2113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2123 - OBJ
      ?AUTO_2124 - LOCATION
    )
    :vars
    (
      ?AUTO_2125 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2123 ?AUTO_2125 ) ( AIRPLANE-AT ?AUTO_2125 ?AUTO_2124 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2123 ?AUTO_2125 ?AUTO_2124 )
      ( DELIVER-PKG-VERIFY ?AUTO_2123 ?AUTO_2124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2126 - OBJ
      ?AUTO_2127 - LOCATION
    )
    :vars
    (
      ?AUTO_2128 - AIRPLANE
      ?AUTO_2129 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2126 ?AUTO_2128 ) ( AIRPORT ?AUTO_2129 ) ( AIRPORT ?AUTO_2127 ) ( AIRPLANE-AT ?AUTO_2128 ?AUTO_2129 ) ( not ( = ?AUTO_2129 ?AUTO_2127 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2128 ?AUTO_2129 ?AUTO_2127 )
      ( DELIVER-PKG ?AUTO_2126 ?AUTO_2127 )
      ( DELIVER-PKG-VERIFY ?AUTO_2126 ?AUTO_2127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2130 - OBJ
      ?AUTO_2131 - LOCATION
    )
    :vars
    (
      ?AUTO_2133 - LOCATION
      ?AUTO_2132 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2133 ) ( AIRPORT ?AUTO_2131 ) ( AIRPLANE-AT ?AUTO_2132 ?AUTO_2133 ) ( not ( = ?AUTO_2133 ?AUTO_2131 ) ) ( OBJ-AT ?AUTO_2130 ?AUTO_2133 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2130 ?AUTO_2132 ?AUTO_2133 )
      ( DELIVER-PKG ?AUTO_2130 ?AUTO_2131 )
      ( DELIVER-PKG-VERIFY ?AUTO_2130 ?AUTO_2131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2134 - OBJ
      ?AUTO_2135 - LOCATION
    )
    :vars
    (
      ?AUTO_2137 - LOCATION
      ?AUTO_2136 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2137 ) ( AIRPORT ?AUTO_2135 ) ( not ( = ?AUTO_2137 ?AUTO_2135 ) ) ( OBJ-AT ?AUTO_2134 ?AUTO_2137 ) ( AIRPLANE-AT ?AUTO_2136 ?AUTO_2135 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2136 ?AUTO_2135 ?AUTO_2137 )
      ( DELIVER-PKG ?AUTO_2134 ?AUTO_2135 )
      ( DELIVER-PKG-VERIFY ?AUTO_2134 ?AUTO_2135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2156 - OBJ
      ?AUTO_2157 - LOCATION
    )
    :vars
    (
      ?AUTO_2158 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2158 ?AUTO_2157 ) ( IN-TRUCK ?AUTO_2156 ?AUTO_2158 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2156 ?AUTO_2158 ?AUTO_2157 )
      ( DELIVER-PKG-VERIFY ?AUTO_2156 ?AUTO_2157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2159 - OBJ
      ?AUTO_2160 - LOCATION
    )
    :vars
    (
      ?AUTO_2161 - TRUCK
      ?AUTO_2162 - LOCATION
      ?AUTO_2163 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2159 ?AUTO_2161 ) ( TRUCK-AT ?AUTO_2161 ?AUTO_2162 ) ( IN-CITY ?AUTO_2162 ?AUTO_2163 ) ( IN-CITY ?AUTO_2160 ?AUTO_2163 ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2161 ?AUTO_2162 ?AUTO_2160 ?AUTO_2163 )
      ( DELIVER-PKG ?AUTO_2159 ?AUTO_2160 )
      ( DELIVER-PKG-VERIFY ?AUTO_2159 ?AUTO_2160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2164 - OBJ
      ?AUTO_2165 - LOCATION
    )
    :vars
    (
      ?AUTO_2167 - TRUCK
      ?AUTO_2168 - LOCATION
      ?AUTO_2166 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2167 ?AUTO_2168 ) ( IN-CITY ?AUTO_2168 ?AUTO_2166 ) ( IN-CITY ?AUTO_2165 ?AUTO_2166 ) ( not ( = ?AUTO_2165 ?AUTO_2168 ) ) ( OBJ-AT ?AUTO_2164 ?AUTO_2168 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2164 ?AUTO_2167 ?AUTO_2168 )
      ( DELIVER-PKG ?AUTO_2164 ?AUTO_2165 )
      ( DELIVER-PKG-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2169 - OBJ
      ?AUTO_2170 - LOCATION
    )
    :vars
    (
      ?AUTO_2172 - TRUCK
      ?AUTO_2173 - LOCATION
      ?AUTO_2171 - CITY
      ?AUTO_2174 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2172 ?AUTO_2173 ) ( IN-CITY ?AUTO_2173 ?AUTO_2171 ) ( IN-CITY ?AUTO_2170 ?AUTO_2171 ) ( not ( = ?AUTO_2170 ?AUTO_2173 ) ) ( IN-AIRPLANE ?AUTO_2169 ?AUTO_2174 ) ( AIRPLANE-AT ?AUTO_2174 ?AUTO_2173 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2169 ?AUTO_2174 ?AUTO_2173 )
      ( DELIVER-PKG ?AUTO_2169 ?AUTO_2170 )
      ( DELIVER-PKG-VERIFY ?AUTO_2169 ?AUTO_2170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2175 - OBJ
      ?AUTO_2176 - LOCATION
    )
    :vars
    (
      ?AUTO_2177 - TRUCK
      ?AUTO_2178 - LOCATION
      ?AUTO_2179 - CITY
      ?AUTO_2180 - AIRPLANE
      ?AUTO_2181 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2177 ?AUTO_2178 ) ( IN-CITY ?AUTO_2178 ?AUTO_2179 ) ( IN-CITY ?AUTO_2176 ?AUTO_2179 ) ( not ( = ?AUTO_2176 ?AUTO_2178 ) ) ( IN-AIRPLANE ?AUTO_2175 ?AUTO_2180 ) ( AIRPORT ?AUTO_2181 ) ( AIRPORT ?AUTO_2178 ) ( AIRPLANE-AT ?AUTO_2180 ?AUTO_2181 ) ( not ( = ?AUTO_2181 ?AUTO_2178 ) ) ( not ( = ?AUTO_2176 ?AUTO_2181 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2180 ?AUTO_2181 ?AUTO_2178 )
      ( DELIVER-PKG ?AUTO_2175 ?AUTO_2176 )
      ( DELIVER-PKG-VERIFY ?AUTO_2175 ?AUTO_2176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2182 - OBJ
      ?AUTO_2183 - LOCATION
    )
    :vars
    (
      ?AUTO_2185 - TRUCK
      ?AUTO_2184 - LOCATION
      ?AUTO_2186 - CITY
      ?AUTO_2187 - LOCATION
      ?AUTO_2188 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2185 ?AUTO_2184 ) ( IN-CITY ?AUTO_2184 ?AUTO_2186 ) ( IN-CITY ?AUTO_2183 ?AUTO_2186 ) ( not ( = ?AUTO_2183 ?AUTO_2184 ) ) ( AIRPORT ?AUTO_2187 ) ( AIRPORT ?AUTO_2184 ) ( AIRPLANE-AT ?AUTO_2188 ?AUTO_2187 ) ( not ( = ?AUTO_2187 ?AUTO_2184 ) ) ( not ( = ?AUTO_2183 ?AUTO_2187 ) ) ( OBJ-AT ?AUTO_2182 ?AUTO_2187 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2182 ?AUTO_2188 ?AUTO_2187 )
      ( DELIVER-PKG ?AUTO_2182 ?AUTO_2183 )
      ( DELIVER-PKG-VERIFY ?AUTO_2182 ?AUTO_2183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2189 - OBJ
      ?AUTO_2190 - LOCATION
    )
    :vars
    (
      ?AUTO_2194 - TRUCK
      ?AUTO_2195 - LOCATION
      ?AUTO_2191 - CITY
      ?AUTO_2192 - LOCATION
      ?AUTO_2193 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2194 ?AUTO_2195 ) ( IN-CITY ?AUTO_2195 ?AUTO_2191 ) ( IN-CITY ?AUTO_2190 ?AUTO_2191 ) ( not ( = ?AUTO_2190 ?AUTO_2195 ) ) ( AIRPORT ?AUTO_2192 ) ( AIRPORT ?AUTO_2195 ) ( not ( = ?AUTO_2192 ?AUTO_2195 ) ) ( not ( = ?AUTO_2190 ?AUTO_2192 ) ) ( OBJ-AT ?AUTO_2189 ?AUTO_2192 ) ( AIRPLANE-AT ?AUTO_2193 ?AUTO_2195 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2193 ?AUTO_2195 ?AUTO_2192 )
      ( DELIVER-PKG ?AUTO_2189 ?AUTO_2190 )
      ( DELIVER-PKG-VERIFY ?AUTO_2189 ?AUTO_2190 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2210 - OBJ
      ?AUTO_2211 - LOCATION
    )
    :vars
    (
      ?AUTO_2216 - LOCATION
      ?AUTO_2213 - CITY
      ?AUTO_2212 - LOCATION
      ?AUTO_2214 - AIRPLANE
      ?AUTO_2215 - TRUCK
      ?AUTO_2217 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2216 ?AUTO_2213 ) ( IN-CITY ?AUTO_2211 ?AUTO_2213 ) ( not ( = ?AUTO_2211 ?AUTO_2216 ) ) ( AIRPORT ?AUTO_2212 ) ( AIRPORT ?AUTO_2216 ) ( not ( = ?AUTO_2212 ?AUTO_2216 ) ) ( not ( = ?AUTO_2211 ?AUTO_2212 ) ) ( OBJ-AT ?AUTO_2210 ?AUTO_2212 ) ( AIRPLANE-AT ?AUTO_2214 ?AUTO_2216 ) ( TRUCK-AT ?AUTO_2215 ?AUTO_2217 ) ( IN-CITY ?AUTO_2217 ?AUTO_2213 ) ( not ( = ?AUTO_2216 ?AUTO_2217 ) ) ( not ( = ?AUTO_2211 ?AUTO_2217 ) ) ( not ( = ?AUTO_2212 ?AUTO_2217 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2215 ?AUTO_2217 ?AUTO_2216 ?AUTO_2213 )
      ( DELIVER-PKG ?AUTO_2210 ?AUTO_2211 )
      ( DELIVER-PKG-VERIFY ?AUTO_2210 ?AUTO_2211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2220 - OBJ
      ?AUTO_2221 - LOCATION
    )
    :vars
    (
      ?AUTO_2222 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2222 ?AUTO_2221 ) ( IN-TRUCK ?AUTO_2220 ?AUTO_2222 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2220 ?AUTO_2222 ?AUTO_2221 )
      ( DELIVER-PKG-VERIFY ?AUTO_2220 ?AUTO_2221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2223 - OBJ
      ?AUTO_2224 - LOCATION
    )
    :vars
    (
      ?AUTO_2225 - TRUCK
      ?AUTO_2226 - LOCATION
      ?AUTO_2227 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2223 ?AUTO_2225 ) ( TRUCK-AT ?AUTO_2225 ?AUTO_2226 ) ( IN-CITY ?AUTO_2226 ?AUTO_2227 ) ( IN-CITY ?AUTO_2224 ?AUTO_2227 ) ( not ( = ?AUTO_2224 ?AUTO_2226 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2225 ?AUTO_2226 ?AUTO_2224 ?AUTO_2227 )
      ( DELIVER-PKG ?AUTO_2223 ?AUTO_2224 )
      ( DELIVER-PKG-VERIFY ?AUTO_2223 ?AUTO_2224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2228 - OBJ
      ?AUTO_2229 - LOCATION
    )
    :vars
    (
      ?AUTO_2230 - TRUCK
      ?AUTO_2231 - LOCATION
      ?AUTO_2232 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2230 ?AUTO_2231 ) ( IN-CITY ?AUTO_2231 ?AUTO_2232 ) ( IN-CITY ?AUTO_2229 ?AUTO_2232 ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( OBJ-AT ?AUTO_2228 ?AUTO_2231 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2228 ?AUTO_2230 ?AUTO_2231 )
      ( DELIVER-PKG ?AUTO_2228 ?AUTO_2229 )
      ( DELIVER-PKG-VERIFY ?AUTO_2228 ?AUTO_2229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2233 - OBJ
      ?AUTO_2234 - LOCATION
    )
    :vars
    (
      ?AUTO_2235 - LOCATION
      ?AUTO_2237 - CITY
      ?AUTO_2236 - TRUCK
      ?AUTO_2238 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2235 ?AUTO_2237 ) ( IN-CITY ?AUTO_2234 ?AUTO_2237 ) ( not ( = ?AUTO_2234 ?AUTO_2235 ) ) ( OBJ-AT ?AUTO_2233 ?AUTO_2235 ) ( TRUCK-AT ?AUTO_2236 ?AUTO_2238 ) ( IN-CITY ?AUTO_2238 ?AUTO_2237 ) ( not ( = ?AUTO_2235 ?AUTO_2238 ) ) ( not ( = ?AUTO_2234 ?AUTO_2238 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2236 ?AUTO_2238 ?AUTO_2235 ?AUTO_2237 )
      ( DELIVER-PKG ?AUTO_2233 ?AUTO_2234 )
      ( DELIVER-PKG-VERIFY ?AUTO_2233 ?AUTO_2234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2271 - OBJ
      ?AUTO_2272 - LOCATION
    )
    :vars
    (
      ?AUTO_2273 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2271 ?AUTO_2273 ) ( AIRPLANE-AT ?AUTO_2273 ?AUTO_2272 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2271 ?AUTO_2273 ?AUTO_2272 )
      ( DELIVER-PKG-VERIFY ?AUTO_2271 ?AUTO_2272 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2276 - OBJ
      ?AUTO_2277 - LOCATION
    )
    :vars
    (
      ?AUTO_2278 - AIRPLANE
      ?AUTO_2279 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2276 ?AUTO_2278 ) ( AIRPORT ?AUTO_2279 ) ( AIRPORT ?AUTO_2277 ) ( AIRPLANE-AT ?AUTO_2278 ?AUTO_2279 ) ( not ( = ?AUTO_2279 ?AUTO_2277 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2278 ?AUTO_2279 ?AUTO_2277 )
      ( DELIVER-PKG ?AUTO_2276 ?AUTO_2277 )
      ( DELIVER-PKG-VERIFY ?AUTO_2276 ?AUTO_2277 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2306 - OBJ
      ?AUTO_2307 - LOCATION
    )
    :vars
    (
      ?AUTO_2308 - LOCATION
      ?AUTO_2309 - AIRPLANE
      ?AUTO_2310 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2308 ) ( AIRPORT ?AUTO_2307 ) ( AIRPLANE-AT ?AUTO_2309 ?AUTO_2308 ) ( not ( = ?AUTO_2308 ?AUTO_2307 ) ) ( TRUCK-AT ?AUTO_2310 ?AUTO_2308 ) ( IN-TRUCK ?AUTO_2306 ?AUTO_2310 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2306 ?AUTO_2310 ?AUTO_2308 )
      ( DELIVER-PKG ?AUTO_2306 ?AUTO_2307 )
      ( DELIVER-PKG-VERIFY ?AUTO_2306 ?AUTO_2307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2311 - OBJ
      ?AUTO_2312 - LOCATION
    )
    :vars
    (
      ?AUTO_2314 - LOCATION
      ?AUTO_2313 - AIRPLANE
      ?AUTO_2315 - TRUCK
      ?AUTO_2316 - LOCATION
      ?AUTO_2317 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2314 ) ( AIRPORT ?AUTO_2312 ) ( AIRPLANE-AT ?AUTO_2313 ?AUTO_2314 ) ( not ( = ?AUTO_2314 ?AUTO_2312 ) ) ( IN-TRUCK ?AUTO_2311 ?AUTO_2315 ) ( TRUCK-AT ?AUTO_2315 ?AUTO_2316 ) ( IN-CITY ?AUTO_2316 ?AUTO_2317 ) ( IN-CITY ?AUTO_2314 ?AUTO_2317 ) ( not ( = ?AUTO_2314 ?AUTO_2316 ) ) ( not ( = ?AUTO_2312 ?AUTO_2316 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2315 ?AUTO_2316 ?AUTO_2314 ?AUTO_2317 )
      ( DELIVER-PKG ?AUTO_2311 ?AUTO_2312 )
      ( DELIVER-PKG-VERIFY ?AUTO_2311 ?AUTO_2312 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2318 - OBJ
      ?AUTO_2319 - LOCATION
    )
    :vars
    (
      ?AUTO_2321 - LOCATION
      ?AUTO_2320 - AIRPLANE
      ?AUTO_2323 - TRUCK
      ?AUTO_2324 - LOCATION
      ?AUTO_2322 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2321 ) ( AIRPORT ?AUTO_2319 ) ( AIRPLANE-AT ?AUTO_2320 ?AUTO_2321 ) ( not ( = ?AUTO_2321 ?AUTO_2319 ) ) ( TRUCK-AT ?AUTO_2323 ?AUTO_2324 ) ( IN-CITY ?AUTO_2324 ?AUTO_2322 ) ( IN-CITY ?AUTO_2321 ?AUTO_2322 ) ( not ( = ?AUTO_2321 ?AUTO_2324 ) ) ( not ( = ?AUTO_2319 ?AUTO_2324 ) ) ( OBJ-AT ?AUTO_2318 ?AUTO_2324 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2318 ?AUTO_2323 ?AUTO_2324 )
      ( DELIVER-PKG ?AUTO_2318 ?AUTO_2319 )
      ( DELIVER-PKG-VERIFY ?AUTO_2318 ?AUTO_2319 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2325 - OBJ
      ?AUTO_2326 - LOCATION
    )
    :vars
    (
      ?AUTO_2327 - LOCATION
      ?AUTO_2328 - AIRPLANE
      ?AUTO_2329 - LOCATION
      ?AUTO_2331 - CITY
      ?AUTO_2330 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2327 ) ( AIRPORT ?AUTO_2326 ) ( AIRPLANE-AT ?AUTO_2328 ?AUTO_2327 ) ( not ( = ?AUTO_2327 ?AUTO_2326 ) ) ( IN-CITY ?AUTO_2329 ?AUTO_2331 ) ( IN-CITY ?AUTO_2327 ?AUTO_2331 ) ( not ( = ?AUTO_2327 ?AUTO_2329 ) ) ( not ( = ?AUTO_2326 ?AUTO_2329 ) ) ( OBJ-AT ?AUTO_2325 ?AUTO_2329 ) ( TRUCK-AT ?AUTO_2330 ?AUTO_2327 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2330 ?AUTO_2327 ?AUTO_2329 ?AUTO_2331 )
      ( DELIVER-PKG ?AUTO_2325 ?AUTO_2326 )
      ( DELIVER-PKG-VERIFY ?AUTO_2325 ?AUTO_2326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2338 - OBJ
      ?AUTO_2339 - LOCATION
    )
    :vars
    (
      ?AUTO_2340 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2338 ?AUTO_2340 ) ( AIRPLANE-AT ?AUTO_2340 ?AUTO_2339 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2338 ?AUTO_2340 ?AUTO_2339 )
      ( DELIVER-PKG-VERIFY ?AUTO_2338 ?AUTO_2339 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2341 - OBJ
      ?AUTO_2342 - LOCATION
    )
    :vars
    (
      ?AUTO_2343 - AIRPLANE
      ?AUTO_2344 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2341 ?AUTO_2343 ) ( AIRPORT ?AUTO_2344 ) ( AIRPORT ?AUTO_2342 ) ( AIRPLANE-AT ?AUTO_2343 ?AUTO_2344 ) ( not ( = ?AUTO_2344 ?AUTO_2342 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2343 ?AUTO_2344 ?AUTO_2342 )
      ( DELIVER-PKG ?AUTO_2341 ?AUTO_2342 )
      ( DELIVER-PKG-VERIFY ?AUTO_2341 ?AUTO_2342 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2353 - OBJ
      ?AUTO_2354 - LOCATION
    )
    :vars
    (
      ?AUTO_2356 - LOCATION
      ?AUTO_2355 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2356 ) ( AIRPORT ?AUTO_2354 ) ( AIRPLANE-AT ?AUTO_2355 ?AUTO_2356 ) ( not ( = ?AUTO_2356 ?AUTO_2354 ) ) ( OBJ-AT ?AUTO_2353 ?AUTO_2356 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2353 ?AUTO_2355 ?AUTO_2356 )
      ( DELIVER-PKG ?AUTO_2353 ?AUTO_2354 )
      ( DELIVER-PKG-VERIFY ?AUTO_2353 ?AUTO_2354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2357 - OBJ
      ?AUTO_2358 - LOCATION
    )
    :vars
    (
      ?AUTO_2360 - LOCATION
      ?AUTO_2359 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2360 ) ( AIRPORT ?AUTO_2358 ) ( not ( = ?AUTO_2360 ?AUTO_2358 ) ) ( OBJ-AT ?AUTO_2357 ?AUTO_2360 ) ( AIRPLANE-AT ?AUTO_2359 ?AUTO_2358 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2359 ?AUTO_2358 ?AUTO_2360 )
      ( DELIVER-PKG ?AUTO_2357 ?AUTO_2358 )
      ( DELIVER-PKG-VERIFY ?AUTO_2357 ?AUTO_2358 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2383 - OBJ
      ?AUTO_2384 - LOCATION
    )
    :vars
    (
      ?AUTO_2386 - LOCATION
      ?AUTO_2387 - LOCATION
      ?AUTO_2385 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2386 ) ( AIRPORT ?AUTO_2384 ) ( not ( = ?AUTO_2386 ?AUTO_2384 ) ) ( OBJ-AT ?AUTO_2383 ?AUTO_2386 ) ( AIRPORT ?AUTO_2387 ) ( AIRPLANE-AT ?AUTO_2385 ?AUTO_2387 ) ( not ( = ?AUTO_2387 ?AUTO_2384 ) ) ( not ( = ?AUTO_2386 ?AUTO_2387 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2385 ?AUTO_2387 ?AUTO_2384 )
      ( DELIVER-PKG ?AUTO_2383 ?AUTO_2384 )
      ( DELIVER-PKG-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2404 - OBJ
      ?AUTO_2405 - LOCATION
    )
    :vars
    (
      ?AUTO_2406 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2406 ?AUTO_2405 ) ( IN-TRUCK ?AUTO_2404 ?AUTO_2406 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2404 ?AUTO_2406 ?AUTO_2405 )
      ( DELIVER-PKG-VERIFY ?AUTO_2404 ?AUTO_2405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2409 - OBJ
      ?AUTO_2410 - LOCATION
    )
    :vars
    (
      ?AUTO_2411 - TRUCK
      ?AUTO_2412 - LOCATION
      ?AUTO_2413 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2409 ?AUTO_2411 ) ( TRUCK-AT ?AUTO_2411 ?AUTO_2412 ) ( IN-CITY ?AUTO_2412 ?AUTO_2413 ) ( IN-CITY ?AUTO_2410 ?AUTO_2413 ) ( not ( = ?AUTO_2410 ?AUTO_2412 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2411 ?AUTO_2412 ?AUTO_2410 ?AUTO_2413 )
      ( DELIVER-PKG ?AUTO_2409 ?AUTO_2410 )
      ( DELIVER-PKG-VERIFY ?AUTO_2409 ?AUTO_2410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2414 - OBJ
      ?AUTO_2415 - LOCATION
    )
    :vars
    (
      ?AUTO_2416 - TRUCK
      ?AUTO_2417 - LOCATION
      ?AUTO_2418 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2416 ?AUTO_2417 ) ( IN-CITY ?AUTO_2417 ?AUTO_2418 ) ( IN-CITY ?AUTO_2415 ?AUTO_2418 ) ( not ( = ?AUTO_2415 ?AUTO_2417 ) ) ( OBJ-AT ?AUTO_2414 ?AUTO_2417 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2414 ?AUTO_2416 ?AUTO_2417 )
      ( DELIVER-PKG ?AUTO_2414 ?AUTO_2415 )
      ( DELIVER-PKG-VERIFY ?AUTO_2414 ?AUTO_2415 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2419 - OBJ
      ?AUTO_2420 - LOCATION
    )
    :vars
    (
      ?AUTO_2422 - TRUCK
      ?AUTO_2421 - LOCATION
      ?AUTO_2423 - CITY
      ?AUTO_2424 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2422 ?AUTO_2421 ) ( IN-CITY ?AUTO_2421 ?AUTO_2423 ) ( IN-CITY ?AUTO_2420 ?AUTO_2423 ) ( not ( = ?AUTO_2420 ?AUTO_2421 ) ) ( IN-AIRPLANE ?AUTO_2419 ?AUTO_2424 ) ( AIRPLANE-AT ?AUTO_2424 ?AUTO_2421 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2419 ?AUTO_2424 ?AUTO_2421 )
      ( DELIVER-PKG ?AUTO_2419 ?AUTO_2420 )
      ( DELIVER-PKG-VERIFY ?AUTO_2419 ?AUTO_2420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2425 - OBJ
      ?AUTO_2426 - LOCATION
    )
    :vars
    (
      ?AUTO_2427 - TRUCK
      ?AUTO_2429 - LOCATION
      ?AUTO_2428 - CITY
      ?AUTO_2430 - AIRPLANE
      ?AUTO_2431 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2427 ?AUTO_2429 ) ( IN-CITY ?AUTO_2429 ?AUTO_2428 ) ( IN-CITY ?AUTO_2426 ?AUTO_2428 ) ( not ( = ?AUTO_2426 ?AUTO_2429 ) ) ( IN-AIRPLANE ?AUTO_2425 ?AUTO_2430 ) ( AIRPORT ?AUTO_2431 ) ( AIRPORT ?AUTO_2429 ) ( AIRPLANE-AT ?AUTO_2430 ?AUTO_2431 ) ( not ( = ?AUTO_2431 ?AUTO_2429 ) ) ( not ( = ?AUTO_2426 ?AUTO_2431 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2430 ?AUTO_2431 ?AUTO_2429 )
      ( DELIVER-PKG ?AUTO_2425 ?AUTO_2426 )
      ( DELIVER-PKG-VERIFY ?AUTO_2425 ?AUTO_2426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2440 - OBJ
      ?AUTO_2441 - LOCATION
    )
    :vars
    (
      ?AUTO_2443 - TRUCK
      ?AUTO_2444 - LOCATION
      ?AUTO_2445 - CITY
      ?AUTO_2442 - LOCATION
      ?AUTO_2446 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2443 ?AUTO_2444 ) ( IN-CITY ?AUTO_2444 ?AUTO_2445 ) ( IN-CITY ?AUTO_2441 ?AUTO_2445 ) ( not ( = ?AUTO_2441 ?AUTO_2444 ) ) ( AIRPORT ?AUTO_2442 ) ( AIRPORT ?AUTO_2444 ) ( AIRPLANE-AT ?AUTO_2446 ?AUTO_2442 ) ( not ( = ?AUTO_2442 ?AUTO_2444 ) ) ( not ( = ?AUTO_2441 ?AUTO_2442 ) ) ( OBJ-AT ?AUTO_2440 ?AUTO_2442 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2440 ?AUTO_2446 ?AUTO_2442 )
      ( DELIVER-PKG ?AUTO_2440 ?AUTO_2441 )
      ( DELIVER-PKG-VERIFY ?AUTO_2440 ?AUTO_2441 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2447 - OBJ
      ?AUTO_2448 - LOCATION
    )
    :vars
    (
      ?AUTO_2450 - TRUCK
      ?AUTO_2451 - LOCATION
      ?AUTO_2452 - CITY
      ?AUTO_2449 - LOCATION
      ?AUTO_2454 - LOCATION
      ?AUTO_2453 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2450 ?AUTO_2451 ) ( IN-CITY ?AUTO_2451 ?AUTO_2452 ) ( IN-CITY ?AUTO_2448 ?AUTO_2452 ) ( not ( = ?AUTO_2448 ?AUTO_2451 ) ) ( AIRPORT ?AUTO_2449 ) ( AIRPORT ?AUTO_2451 ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( OBJ-AT ?AUTO_2447 ?AUTO_2449 ) ( AIRPORT ?AUTO_2454 ) ( AIRPLANE-AT ?AUTO_2453 ?AUTO_2454 ) ( not ( = ?AUTO_2454 ?AUTO_2449 ) ) ( not ( = ?AUTO_2448 ?AUTO_2454 ) ) ( not ( = ?AUTO_2451 ?AUTO_2454 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2453 ?AUTO_2454 ?AUTO_2449 )
      ( DELIVER-PKG ?AUTO_2447 ?AUTO_2448 )
      ( DELIVER-PKG-VERIFY ?AUTO_2447 ?AUTO_2448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2495 - OBJ
      ?AUTO_2496 - LOCATION
    )
    :vars
    (
      ?AUTO_2497 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2497 ?AUTO_2496 ) ( IN-TRUCK ?AUTO_2495 ?AUTO_2497 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2495 ?AUTO_2497 ?AUTO_2496 )
      ( DELIVER-PKG-VERIFY ?AUTO_2495 ?AUTO_2496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2524 - OBJ
      ?AUTO_2525 - LOCATION
    )
    :vars
    (
      ?AUTO_2529 - LOCATION
      ?AUTO_2528 - CITY
      ?AUTO_2527 - AIRPLANE
      ?AUTO_2530 - LOCATION
      ?AUTO_2526 - TRUCK
      ?AUTO_2531 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2529 ?AUTO_2528 ) ( IN-CITY ?AUTO_2525 ?AUTO_2528 ) ( not ( = ?AUTO_2525 ?AUTO_2529 ) ) ( IN-AIRPLANE ?AUTO_2524 ?AUTO_2527 ) ( AIRPORT ?AUTO_2530 ) ( AIRPORT ?AUTO_2529 ) ( AIRPLANE-AT ?AUTO_2527 ?AUTO_2530 ) ( not ( = ?AUTO_2530 ?AUTO_2529 ) ) ( not ( = ?AUTO_2525 ?AUTO_2530 ) ) ( TRUCK-AT ?AUTO_2526 ?AUTO_2531 ) ( IN-CITY ?AUTO_2531 ?AUTO_2528 ) ( not ( = ?AUTO_2529 ?AUTO_2531 ) ) ( not ( = ?AUTO_2525 ?AUTO_2531 ) ) ( not ( = ?AUTO_2530 ?AUTO_2531 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2526 ?AUTO_2531 ?AUTO_2529 ?AUTO_2528 )
      ( DELIVER-PKG ?AUTO_2524 ?AUTO_2525 )
      ( DELIVER-PKG-VERIFY ?AUTO_2524 ?AUTO_2525 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2534 - OBJ
      ?AUTO_2535 - LOCATION
    )
    :vars
    (
      ?AUTO_2537 - LOCATION
      ?AUTO_2536 - CITY
      ?AUTO_2540 - AIRPLANE
      ?AUTO_2539 - LOCATION
      ?AUTO_2541 - LOCATION
      ?AUTO_2538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2537 ?AUTO_2536 ) ( IN-CITY ?AUTO_2535 ?AUTO_2536 ) ( not ( = ?AUTO_2535 ?AUTO_2537 ) ) ( IN-AIRPLANE ?AUTO_2534 ?AUTO_2540 ) ( AIRPORT ?AUTO_2539 ) ( AIRPORT ?AUTO_2537 ) ( AIRPLANE-AT ?AUTO_2540 ?AUTO_2539 ) ( not ( = ?AUTO_2539 ?AUTO_2537 ) ) ( not ( = ?AUTO_2535 ?AUTO_2539 ) ) ( IN-CITY ?AUTO_2541 ?AUTO_2536 ) ( not ( = ?AUTO_2537 ?AUTO_2541 ) ) ( not ( = ?AUTO_2535 ?AUTO_2541 ) ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( TRUCK-AT ?AUTO_2538 ?AUTO_2535 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2538 ?AUTO_2535 ?AUTO_2541 ?AUTO_2536 )
      ( DELIVER-PKG ?AUTO_2534 ?AUTO_2535 )
      ( DELIVER-PKG-VERIFY ?AUTO_2534 ?AUTO_2535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2558 - OBJ
      ?AUTO_2559 - LOCATION
    )
    :vars
    (
      ?AUTO_2560 - LOCATION
      ?AUTO_2565 - CITY
      ?AUTO_2563 - LOCATION
      ?AUTO_2561 - AIRPLANE
      ?AUTO_2564 - LOCATION
      ?AUTO_2562 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2560 ?AUTO_2565 ) ( IN-CITY ?AUTO_2559 ?AUTO_2565 ) ( not ( = ?AUTO_2559 ?AUTO_2560 ) ) ( AIRPORT ?AUTO_2563 ) ( AIRPORT ?AUTO_2560 ) ( AIRPLANE-AT ?AUTO_2561 ?AUTO_2563 ) ( not ( = ?AUTO_2563 ?AUTO_2560 ) ) ( not ( = ?AUTO_2559 ?AUTO_2563 ) ) ( IN-CITY ?AUTO_2564 ?AUTO_2565 ) ( not ( = ?AUTO_2560 ?AUTO_2564 ) ) ( not ( = ?AUTO_2559 ?AUTO_2564 ) ) ( not ( = ?AUTO_2563 ?AUTO_2564 ) ) ( TRUCK-AT ?AUTO_2562 ?AUTO_2559 ) ( OBJ-AT ?AUTO_2558 ?AUTO_2563 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2558 ?AUTO_2561 ?AUTO_2563 )
      ( DELIVER-PKG ?AUTO_2558 ?AUTO_2559 )
      ( DELIVER-PKG-VERIFY ?AUTO_2558 ?AUTO_2559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2566 - OBJ
      ?AUTO_2567 - LOCATION
    )
    :vars
    (
      ?AUTO_2573 - LOCATION
      ?AUTO_2570 - CITY
      ?AUTO_2569 - LOCATION
      ?AUTO_2571 - AIRPLANE
      ?AUTO_2572 - LOCATION
      ?AUTO_2568 - TRUCK
      ?AUTO_2574 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2573 ?AUTO_2570 ) ( IN-CITY ?AUTO_2567 ?AUTO_2570 ) ( not ( = ?AUTO_2567 ?AUTO_2573 ) ) ( AIRPORT ?AUTO_2569 ) ( AIRPORT ?AUTO_2573 ) ( AIRPLANE-AT ?AUTO_2571 ?AUTO_2569 ) ( not ( = ?AUTO_2569 ?AUTO_2573 ) ) ( not ( = ?AUTO_2567 ?AUTO_2569 ) ) ( IN-CITY ?AUTO_2572 ?AUTO_2570 ) ( not ( = ?AUTO_2573 ?AUTO_2572 ) ) ( not ( = ?AUTO_2567 ?AUTO_2572 ) ) ( not ( = ?AUTO_2569 ?AUTO_2572 ) ) ( TRUCK-AT ?AUTO_2568 ?AUTO_2567 ) ( TRUCK-AT ?AUTO_2574 ?AUTO_2569 ) ( IN-TRUCK ?AUTO_2566 ?AUTO_2574 ) ( not ( = ?AUTO_2568 ?AUTO_2574 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2566 ?AUTO_2574 ?AUTO_2569 )
      ( DELIVER-PKG ?AUTO_2566 ?AUTO_2567 )
      ( DELIVER-PKG-VERIFY ?AUTO_2566 ?AUTO_2567 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2575 - OBJ
      ?AUTO_2576 - LOCATION
    )
    :vars
    (
      ?AUTO_2578 - LOCATION
      ?AUTO_2581 - CITY
      ?AUTO_2577 - LOCATION
      ?AUTO_2582 - AIRPLANE
      ?AUTO_2580 - LOCATION
      ?AUTO_2579 - TRUCK
      ?AUTO_2583 - TRUCK
      ?AUTO_2584 - LOCATION
      ?AUTO_2585 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2578 ?AUTO_2581 ) ( IN-CITY ?AUTO_2576 ?AUTO_2581 ) ( not ( = ?AUTO_2576 ?AUTO_2578 ) ) ( AIRPORT ?AUTO_2577 ) ( AIRPORT ?AUTO_2578 ) ( AIRPLANE-AT ?AUTO_2582 ?AUTO_2577 ) ( not ( = ?AUTO_2577 ?AUTO_2578 ) ) ( not ( = ?AUTO_2576 ?AUTO_2577 ) ) ( IN-CITY ?AUTO_2580 ?AUTO_2581 ) ( not ( = ?AUTO_2578 ?AUTO_2580 ) ) ( not ( = ?AUTO_2576 ?AUTO_2580 ) ) ( not ( = ?AUTO_2577 ?AUTO_2580 ) ) ( TRUCK-AT ?AUTO_2579 ?AUTO_2576 ) ( IN-TRUCK ?AUTO_2575 ?AUTO_2583 ) ( not ( = ?AUTO_2579 ?AUTO_2583 ) ) ( TRUCK-AT ?AUTO_2583 ?AUTO_2584 ) ( IN-CITY ?AUTO_2584 ?AUTO_2585 ) ( IN-CITY ?AUTO_2577 ?AUTO_2585 ) ( not ( = ?AUTO_2577 ?AUTO_2584 ) ) ( not ( = ?AUTO_2576 ?AUTO_2584 ) ) ( not ( = ?AUTO_2578 ?AUTO_2584 ) ) ( not ( = ?AUTO_2581 ?AUTO_2585 ) ) ( not ( = ?AUTO_2580 ?AUTO_2584 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2583 ?AUTO_2584 ?AUTO_2577 ?AUTO_2585 )
      ( DELIVER-PKG ?AUTO_2575 ?AUTO_2576 )
      ( DELIVER-PKG-VERIFY ?AUTO_2575 ?AUTO_2576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2586 - OBJ
      ?AUTO_2587 - LOCATION
    )
    :vars
    (
      ?AUTO_2591 - LOCATION
      ?AUTO_2590 - CITY
      ?AUTO_2589 - LOCATION
      ?AUTO_2592 - AIRPLANE
      ?AUTO_2588 - LOCATION
      ?AUTO_2594 - TRUCK
      ?AUTO_2593 - TRUCK
      ?AUTO_2595 - LOCATION
      ?AUTO_2596 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2591 ?AUTO_2590 ) ( IN-CITY ?AUTO_2587 ?AUTO_2590 ) ( not ( = ?AUTO_2587 ?AUTO_2591 ) ) ( AIRPORT ?AUTO_2589 ) ( AIRPORT ?AUTO_2591 ) ( AIRPLANE-AT ?AUTO_2592 ?AUTO_2589 ) ( not ( = ?AUTO_2589 ?AUTO_2591 ) ) ( not ( = ?AUTO_2587 ?AUTO_2589 ) ) ( IN-CITY ?AUTO_2588 ?AUTO_2590 ) ( not ( = ?AUTO_2591 ?AUTO_2588 ) ) ( not ( = ?AUTO_2587 ?AUTO_2588 ) ) ( not ( = ?AUTO_2589 ?AUTO_2588 ) ) ( TRUCK-AT ?AUTO_2594 ?AUTO_2587 ) ( not ( = ?AUTO_2594 ?AUTO_2593 ) ) ( TRUCK-AT ?AUTO_2593 ?AUTO_2595 ) ( IN-CITY ?AUTO_2595 ?AUTO_2596 ) ( IN-CITY ?AUTO_2589 ?AUTO_2596 ) ( not ( = ?AUTO_2589 ?AUTO_2595 ) ) ( not ( = ?AUTO_2587 ?AUTO_2595 ) ) ( not ( = ?AUTO_2591 ?AUTO_2595 ) ) ( not ( = ?AUTO_2590 ?AUTO_2596 ) ) ( not ( = ?AUTO_2588 ?AUTO_2595 ) ) ( OBJ-AT ?AUTO_2586 ?AUTO_2595 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2586 ?AUTO_2593 ?AUTO_2595 )
      ( DELIVER-PKG ?AUTO_2586 ?AUTO_2587 )
      ( DELIVER-PKG-VERIFY ?AUTO_2586 ?AUTO_2587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2597 - OBJ
      ?AUTO_2598 - LOCATION
    )
    :vars
    (
      ?AUTO_2602 - LOCATION
      ?AUTO_2603 - CITY
      ?AUTO_2599 - LOCATION
      ?AUTO_2605 - AIRPLANE
      ?AUTO_2601 - LOCATION
      ?AUTO_2604 - TRUCK
      ?AUTO_2600 - TRUCK
      ?AUTO_2606 - LOCATION
      ?AUTO_2607 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2602 ?AUTO_2603 ) ( IN-CITY ?AUTO_2598 ?AUTO_2603 ) ( not ( = ?AUTO_2598 ?AUTO_2602 ) ) ( AIRPORT ?AUTO_2599 ) ( AIRPORT ?AUTO_2602 ) ( AIRPLANE-AT ?AUTO_2605 ?AUTO_2599 ) ( not ( = ?AUTO_2599 ?AUTO_2602 ) ) ( not ( = ?AUTO_2598 ?AUTO_2599 ) ) ( IN-CITY ?AUTO_2601 ?AUTO_2603 ) ( not ( = ?AUTO_2602 ?AUTO_2601 ) ) ( not ( = ?AUTO_2598 ?AUTO_2601 ) ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) ( TRUCK-AT ?AUTO_2604 ?AUTO_2598 ) ( not ( = ?AUTO_2604 ?AUTO_2600 ) ) ( IN-CITY ?AUTO_2606 ?AUTO_2607 ) ( IN-CITY ?AUTO_2599 ?AUTO_2607 ) ( not ( = ?AUTO_2599 ?AUTO_2606 ) ) ( not ( = ?AUTO_2598 ?AUTO_2606 ) ) ( not ( = ?AUTO_2602 ?AUTO_2606 ) ) ( not ( = ?AUTO_2603 ?AUTO_2607 ) ) ( not ( = ?AUTO_2601 ?AUTO_2606 ) ) ( OBJ-AT ?AUTO_2597 ?AUTO_2606 ) ( TRUCK-AT ?AUTO_2600 ?AUTO_2599 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2600 ?AUTO_2599 ?AUTO_2606 ?AUTO_2607 )
      ( DELIVER-PKG ?AUTO_2597 ?AUTO_2598 )
      ( DELIVER-PKG-VERIFY ?AUTO_2597 ?AUTO_2598 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2614 - OBJ
      ?AUTO_2615 - LOCATION
    )
    :vars
    (
      ?AUTO_2616 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2614 ?AUTO_2616 ) ( AIRPLANE-AT ?AUTO_2616 ?AUTO_2615 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2614 ?AUTO_2616 ?AUTO_2615 )
      ( DELIVER-PKG-VERIFY ?AUTO_2614 ?AUTO_2615 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2621 - OBJ
      ?AUTO_2622 - LOCATION
    )
    :vars
    (
      ?AUTO_2623 - AIRPLANE
      ?AUTO_2624 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2621 ?AUTO_2623 ) ( AIRPORT ?AUTO_2624 ) ( AIRPORT ?AUTO_2622 ) ( AIRPLANE-AT ?AUTO_2623 ?AUTO_2624 ) ( not ( = ?AUTO_2624 ?AUTO_2622 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2623 ?AUTO_2624 ?AUTO_2622 )
      ( DELIVER-PKG ?AUTO_2621 ?AUTO_2622 )
      ( DELIVER-PKG-VERIFY ?AUTO_2621 ?AUTO_2622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2633 - OBJ
      ?AUTO_2634 - LOCATION
    )
    :vars
    (
      ?AUTO_2635 - LOCATION
      ?AUTO_2636 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2635 ) ( AIRPORT ?AUTO_2634 ) ( AIRPLANE-AT ?AUTO_2636 ?AUTO_2635 ) ( not ( = ?AUTO_2635 ?AUTO_2634 ) ) ( OBJ-AT ?AUTO_2633 ?AUTO_2635 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2633 ?AUTO_2636 ?AUTO_2635 )
      ( DELIVER-PKG ?AUTO_2633 ?AUTO_2634 )
      ( DELIVER-PKG-VERIFY ?AUTO_2633 ?AUTO_2634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2647 - OBJ
      ?AUTO_2648 - LOCATION
    )
    :vars
    (
      ?AUTO_2649 - TRUCK
      ?AUTO_2654 - LOCATION
      ?AUTO_2650 - CITY
      ?AUTO_2652 - LOCATION
      ?AUTO_2653 - LOCATION
      ?AUTO_2651 - AIRPLANE
      ?AUTO_2655 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2649 ?AUTO_2654 ) ( IN-CITY ?AUTO_2654 ?AUTO_2650 ) ( IN-CITY ?AUTO_2648 ?AUTO_2650 ) ( not ( = ?AUTO_2648 ?AUTO_2654 ) ) ( AIRPORT ?AUTO_2652 ) ( AIRPORT ?AUTO_2654 ) ( not ( = ?AUTO_2652 ?AUTO_2654 ) ) ( not ( = ?AUTO_2648 ?AUTO_2652 ) ) ( AIRPORT ?AUTO_2653 ) ( AIRPLANE-AT ?AUTO_2651 ?AUTO_2653 ) ( not ( = ?AUTO_2653 ?AUTO_2652 ) ) ( not ( = ?AUTO_2648 ?AUTO_2653 ) ) ( not ( = ?AUTO_2654 ?AUTO_2653 ) ) ( TRUCK-AT ?AUTO_2655 ?AUTO_2652 ) ( IN-TRUCK ?AUTO_2647 ?AUTO_2655 ) ( not ( = ?AUTO_2649 ?AUTO_2655 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2647 ?AUTO_2655 ?AUTO_2652 )
      ( DELIVER-PKG ?AUTO_2647 ?AUTO_2648 )
      ( DELIVER-PKG-VERIFY ?AUTO_2647 ?AUTO_2648 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2656 - OBJ
      ?AUTO_2657 - LOCATION
    )
    :vars
    (
      ?AUTO_2659 - TRUCK
      ?AUTO_2660 - LOCATION
      ?AUTO_2661 - CITY
      ?AUTO_2664 - LOCATION
      ?AUTO_2663 - LOCATION
      ?AUTO_2662 - AIRPLANE
      ?AUTO_2658 - TRUCK
      ?AUTO_2665 - LOCATION
      ?AUTO_2666 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2659 ?AUTO_2660 ) ( IN-CITY ?AUTO_2660 ?AUTO_2661 ) ( IN-CITY ?AUTO_2657 ?AUTO_2661 ) ( not ( = ?AUTO_2657 ?AUTO_2660 ) ) ( AIRPORT ?AUTO_2664 ) ( AIRPORT ?AUTO_2660 ) ( not ( = ?AUTO_2664 ?AUTO_2660 ) ) ( not ( = ?AUTO_2657 ?AUTO_2664 ) ) ( AIRPORT ?AUTO_2663 ) ( AIRPLANE-AT ?AUTO_2662 ?AUTO_2663 ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( not ( = ?AUTO_2657 ?AUTO_2663 ) ) ( not ( = ?AUTO_2660 ?AUTO_2663 ) ) ( IN-TRUCK ?AUTO_2656 ?AUTO_2658 ) ( not ( = ?AUTO_2659 ?AUTO_2658 ) ) ( TRUCK-AT ?AUTO_2658 ?AUTO_2665 ) ( IN-CITY ?AUTO_2665 ?AUTO_2666 ) ( IN-CITY ?AUTO_2664 ?AUTO_2666 ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( not ( = ?AUTO_2657 ?AUTO_2665 ) ) ( not ( = ?AUTO_2660 ?AUTO_2665 ) ) ( not ( = ?AUTO_2661 ?AUTO_2666 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2658 ?AUTO_2665 ?AUTO_2664 ?AUTO_2666 )
      ( DELIVER-PKG ?AUTO_2656 ?AUTO_2657 )
      ( DELIVER-PKG-VERIFY ?AUTO_2656 ?AUTO_2657 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2667 - OBJ
      ?AUTO_2668 - LOCATION
    )
    :vars
    (
      ?AUTO_2669 - TRUCK
      ?AUTO_2675 - LOCATION
      ?AUTO_2676 - CITY
      ?AUTO_2670 - LOCATION
      ?AUTO_2671 - LOCATION
      ?AUTO_2677 - AIRPLANE
      ?AUTO_2672 - TRUCK
      ?AUTO_2674 - LOCATION
      ?AUTO_2673 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2669 ?AUTO_2675 ) ( IN-CITY ?AUTO_2675 ?AUTO_2676 ) ( IN-CITY ?AUTO_2668 ?AUTO_2676 ) ( not ( = ?AUTO_2668 ?AUTO_2675 ) ) ( AIRPORT ?AUTO_2670 ) ( AIRPORT ?AUTO_2675 ) ( not ( = ?AUTO_2670 ?AUTO_2675 ) ) ( not ( = ?AUTO_2668 ?AUTO_2670 ) ) ( AIRPORT ?AUTO_2671 ) ( AIRPLANE-AT ?AUTO_2677 ?AUTO_2671 ) ( not ( = ?AUTO_2671 ?AUTO_2670 ) ) ( not ( = ?AUTO_2668 ?AUTO_2671 ) ) ( not ( = ?AUTO_2675 ?AUTO_2671 ) ) ( not ( = ?AUTO_2669 ?AUTO_2672 ) ) ( TRUCK-AT ?AUTO_2672 ?AUTO_2674 ) ( IN-CITY ?AUTO_2674 ?AUTO_2673 ) ( IN-CITY ?AUTO_2670 ?AUTO_2673 ) ( not ( = ?AUTO_2670 ?AUTO_2674 ) ) ( not ( = ?AUTO_2668 ?AUTO_2674 ) ) ( not ( = ?AUTO_2675 ?AUTO_2674 ) ) ( not ( = ?AUTO_2676 ?AUTO_2673 ) ) ( not ( = ?AUTO_2671 ?AUTO_2674 ) ) ( OBJ-AT ?AUTO_2667 ?AUTO_2674 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2667 ?AUTO_2672 ?AUTO_2674 )
      ( DELIVER-PKG ?AUTO_2667 ?AUTO_2668 )
      ( DELIVER-PKG-VERIFY ?AUTO_2667 ?AUTO_2668 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2678 - OBJ
      ?AUTO_2679 - LOCATION
    )
    :vars
    (
      ?AUTO_2680 - TRUCK
      ?AUTO_2684 - LOCATION
      ?AUTO_2687 - CITY
      ?AUTO_2681 - LOCATION
      ?AUTO_2682 - LOCATION
      ?AUTO_2688 - AIRPLANE
      ?AUTO_2686 - TRUCK
      ?AUTO_2685 - LOCATION
      ?AUTO_2683 - CITY
      ?AUTO_2689 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2680 ?AUTO_2684 ) ( IN-CITY ?AUTO_2684 ?AUTO_2687 ) ( IN-CITY ?AUTO_2679 ?AUTO_2687 ) ( not ( = ?AUTO_2679 ?AUTO_2684 ) ) ( AIRPORT ?AUTO_2681 ) ( AIRPORT ?AUTO_2684 ) ( not ( = ?AUTO_2681 ?AUTO_2684 ) ) ( not ( = ?AUTO_2679 ?AUTO_2681 ) ) ( AIRPORT ?AUTO_2682 ) ( AIRPLANE-AT ?AUTO_2688 ?AUTO_2682 ) ( not ( = ?AUTO_2682 ?AUTO_2681 ) ) ( not ( = ?AUTO_2679 ?AUTO_2682 ) ) ( not ( = ?AUTO_2684 ?AUTO_2682 ) ) ( not ( = ?AUTO_2680 ?AUTO_2686 ) ) ( IN-CITY ?AUTO_2685 ?AUTO_2683 ) ( IN-CITY ?AUTO_2681 ?AUTO_2683 ) ( not ( = ?AUTO_2681 ?AUTO_2685 ) ) ( not ( = ?AUTO_2679 ?AUTO_2685 ) ) ( not ( = ?AUTO_2684 ?AUTO_2685 ) ) ( not ( = ?AUTO_2687 ?AUTO_2683 ) ) ( not ( = ?AUTO_2682 ?AUTO_2685 ) ) ( OBJ-AT ?AUTO_2678 ?AUTO_2685 ) ( TRUCK-AT ?AUTO_2686 ?AUTO_2689 ) ( IN-CITY ?AUTO_2689 ?AUTO_2683 ) ( not ( = ?AUTO_2685 ?AUTO_2689 ) ) ( not ( = ?AUTO_2679 ?AUTO_2689 ) ) ( not ( = ?AUTO_2684 ?AUTO_2689 ) ) ( not ( = ?AUTO_2681 ?AUTO_2689 ) ) ( not ( = ?AUTO_2682 ?AUTO_2689 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2686 ?AUTO_2689 ?AUTO_2685 ?AUTO_2683 )
      ( DELIVER-PKG ?AUTO_2678 ?AUTO_2679 )
      ( DELIVER-PKG-VERIFY ?AUTO_2678 ?AUTO_2679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2692 - OBJ
      ?AUTO_2693 - LOCATION
    )
    :vars
    (
      ?AUTO_2694 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2694 ?AUTO_2693 ) ( IN-TRUCK ?AUTO_2692 ?AUTO_2694 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2692 ?AUTO_2694 ?AUTO_2693 )
      ( DELIVER-PKG-VERIFY ?AUTO_2692 ?AUTO_2693 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2695 - OBJ
      ?AUTO_2696 - LOCATION
    )
    :vars
    (
      ?AUTO_2697 - TRUCK
      ?AUTO_2698 - LOCATION
      ?AUTO_2699 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2695 ?AUTO_2697 ) ( TRUCK-AT ?AUTO_2697 ?AUTO_2698 ) ( IN-CITY ?AUTO_2698 ?AUTO_2699 ) ( IN-CITY ?AUTO_2696 ?AUTO_2699 ) ( not ( = ?AUTO_2696 ?AUTO_2698 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2697 ?AUTO_2698 ?AUTO_2696 ?AUTO_2699 )
      ( DELIVER-PKG ?AUTO_2695 ?AUTO_2696 )
      ( DELIVER-PKG-VERIFY ?AUTO_2695 ?AUTO_2696 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2700 - OBJ
      ?AUTO_2701 - LOCATION
    )
    :vars
    (
      ?AUTO_2702 - TRUCK
      ?AUTO_2703 - LOCATION
      ?AUTO_2704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2702 ?AUTO_2703 ) ( IN-CITY ?AUTO_2703 ?AUTO_2704 ) ( IN-CITY ?AUTO_2701 ?AUTO_2704 ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( OBJ-AT ?AUTO_2700 ?AUTO_2703 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2700 ?AUTO_2702 ?AUTO_2703 )
      ( DELIVER-PKG ?AUTO_2700 ?AUTO_2701 )
      ( DELIVER-PKG-VERIFY ?AUTO_2700 ?AUTO_2701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2705 - OBJ
      ?AUTO_2706 - LOCATION
    )
    :vars
    (
      ?AUTO_2707 - LOCATION
      ?AUTO_2709 - CITY
      ?AUTO_2708 - TRUCK
      ?AUTO_2710 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2707 ?AUTO_2709 ) ( IN-CITY ?AUTO_2706 ?AUTO_2709 ) ( not ( = ?AUTO_2706 ?AUTO_2707 ) ) ( OBJ-AT ?AUTO_2705 ?AUTO_2707 ) ( TRUCK-AT ?AUTO_2708 ?AUTO_2710 ) ( IN-CITY ?AUTO_2710 ?AUTO_2709 ) ( not ( = ?AUTO_2707 ?AUTO_2710 ) ) ( not ( = ?AUTO_2706 ?AUTO_2710 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2708 ?AUTO_2710 ?AUTO_2707 ?AUTO_2709 )
      ( DELIVER-PKG ?AUTO_2705 ?AUTO_2706 )
      ( DELIVER-PKG-VERIFY ?AUTO_2705 ?AUTO_2706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2713 - OBJ
      ?AUTO_2714 - LOCATION
    )
    :vars
    (
      ?AUTO_2715 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2715 ?AUTO_2714 ) ( IN-TRUCK ?AUTO_2713 ?AUTO_2715 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2713 ?AUTO_2715 ?AUTO_2714 )
      ( DELIVER-PKG-VERIFY ?AUTO_2713 ?AUTO_2714 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2716 - OBJ
      ?AUTO_2717 - LOCATION
    )
    :vars
    (
      ?AUTO_2718 - TRUCK
      ?AUTO_2719 - LOCATION
      ?AUTO_2720 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2716 ?AUTO_2718 ) ( TRUCK-AT ?AUTO_2718 ?AUTO_2719 ) ( IN-CITY ?AUTO_2719 ?AUTO_2720 ) ( IN-CITY ?AUTO_2717 ?AUTO_2720 ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2718 ?AUTO_2719 ?AUTO_2717 ?AUTO_2720 )
      ( DELIVER-PKG ?AUTO_2716 ?AUTO_2717 )
      ( DELIVER-PKG-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2721 - OBJ
      ?AUTO_2722 - LOCATION
    )
    :vars
    (
      ?AUTO_2723 - TRUCK
      ?AUTO_2724 - LOCATION
      ?AUTO_2725 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2723 ?AUTO_2724 ) ( IN-CITY ?AUTO_2724 ?AUTO_2725 ) ( IN-CITY ?AUTO_2722 ?AUTO_2725 ) ( not ( = ?AUTO_2722 ?AUTO_2724 ) ) ( OBJ-AT ?AUTO_2721 ?AUTO_2724 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2721 ?AUTO_2723 ?AUTO_2724 )
      ( DELIVER-PKG ?AUTO_2721 ?AUTO_2722 )
      ( DELIVER-PKG-VERIFY ?AUTO_2721 ?AUTO_2722 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2726 - OBJ
      ?AUTO_2727 - LOCATION
    )
    :vars
    (
      ?AUTO_2728 - LOCATION
      ?AUTO_2730 - CITY
      ?AUTO_2729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2728 ?AUTO_2730 ) ( IN-CITY ?AUTO_2727 ?AUTO_2730 ) ( not ( = ?AUTO_2727 ?AUTO_2728 ) ) ( OBJ-AT ?AUTO_2726 ?AUTO_2728 ) ( TRUCK-AT ?AUTO_2729 ?AUTO_2727 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2729 ?AUTO_2727 ?AUTO_2728 ?AUTO_2730 )
      ( DELIVER-PKG ?AUTO_2726 ?AUTO_2727 )
      ( DELIVER-PKG-VERIFY ?AUTO_2726 ?AUTO_2727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2741 - OBJ
      ?AUTO_2742 - LOCATION
    )
    :vars
    (
      ?AUTO_2743 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2741 ?AUTO_2743 ) ( AIRPLANE-AT ?AUTO_2743 ?AUTO_2742 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2741 ?AUTO_2743 ?AUTO_2742 )
      ( DELIVER-PKG-VERIFY ?AUTO_2741 ?AUTO_2742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2744 - OBJ
      ?AUTO_2745 - LOCATION
    )
    :vars
    (
      ?AUTO_2746 - AIRPLANE
      ?AUTO_2747 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2744 ?AUTO_2746 ) ( AIRPORT ?AUTO_2747 ) ( AIRPORT ?AUTO_2745 ) ( AIRPLANE-AT ?AUTO_2746 ?AUTO_2747 ) ( not ( = ?AUTO_2747 ?AUTO_2745 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2746 ?AUTO_2747 ?AUTO_2745 )
      ( DELIVER-PKG ?AUTO_2744 ?AUTO_2745 )
      ( DELIVER-PKG-VERIFY ?AUTO_2744 ?AUTO_2745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2756 - OBJ
      ?AUTO_2757 - LOCATION
    )
    :vars
    (
      ?AUTO_2758 - LOCATION
      ?AUTO_2759 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2758 ) ( AIRPORT ?AUTO_2757 ) ( AIRPLANE-AT ?AUTO_2759 ?AUTO_2758 ) ( not ( = ?AUTO_2758 ?AUTO_2757 ) ) ( OBJ-AT ?AUTO_2756 ?AUTO_2758 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2756 ?AUTO_2759 ?AUTO_2758 )
      ( DELIVER-PKG ?AUTO_2756 ?AUTO_2757 )
      ( DELIVER-PKG-VERIFY ?AUTO_2756 ?AUTO_2757 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2760 - OBJ
      ?AUTO_2761 - LOCATION
    )
    :vars
    (
      ?AUTO_2762 - LOCATION
      ?AUTO_2763 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2762 ) ( AIRPORT ?AUTO_2761 ) ( not ( = ?AUTO_2762 ?AUTO_2761 ) ) ( OBJ-AT ?AUTO_2760 ?AUTO_2762 ) ( AIRPLANE-AT ?AUTO_2763 ?AUTO_2761 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2763 ?AUTO_2761 ?AUTO_2762 )
      ( DELIVER-PKG ?AUTO_2760 ?AUTO_2761 )
      ( DELIVER-PKG-VERIFY ?AUTO_2760 ?AUTO_2761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2772 - OBJ
      ?AUTO_2773 - LOCATION
    )
    :vars
    (
      ?AUTO_2774 - LOCATION
      ?AUTO_2775 - AIRPLANE
      ?AUTO_2776 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2774 ) ( AIRPORT ?AUTO_2773 ) ( not ( = ?AUTO_2774 ?AUTO_2773 ) ) ( AIRPLANE-AT ?AUTO_2775 ?AUTO_2773 ) ( TRUCK-AT ?AUTO_2776 ?AUTO_2774 ) ( IN-TRUCK ?AUTO_2772 ?AUTO_2776 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2772 ?AUTO_2776 ?AUTO_2774 )
      ( DELIVER-PKG ?AUTO_2772 ?AUTO_2773 )
      ( DELIVER-PKG-VERIFY ?AUTO_2772 ?AUTO_2773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2777 - OBJ
      ?AUTO_2778 - LOCATION
    )
    :vars
    (
      ?AUTO_2779 - LOCATION
      ?AUTO_2780 - AIRPLANE
      ?AUTO_2781 - TRUCK
      ?AUTO_2782 - LOCATION
      ?AUTO_2783 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2779 ) ( AIRPORT ?AUTO_2778 ) ( not ( = ?AUTO_2779 ?AUTO_2778 ) ) ( AIRPLANE-AT ?AUTO_2780 ?AUTO_2778 ) ( IN-TRUCK ?AUTO_2777 ?AUTO_2781 ) ( TRUCK-AT ?AUTO_2781 ?AUTO_2782 ) ( IN-CITY ?AUTO_2782 ?AUTO_2783 ) ( IN-CITY ?AUTO_2779 ?AUTO_2783 ) ( not ( = ?AUTO_2779 ?AUTO_2782 ) ) ( not ( = ?AUTO_2778 ?AUTO_2782 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2781 ?AUTO_2782 ?AUTO_2779 ?AUTO_2783 )
      ( DELIVER-PKG ?AUTO_2777 ?AUTO_2778 )
      ( DELIVER-PKG-VERIFY ?AUTO_2777 ?AUTO_2778 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2784 - OBJ
      ?AUTO_2785 - LOCATION
    )
    :vars
    (
      ?AUTO_2787 - LOCATION
      ?AUTO_2786 - AIRPLANE
      ?AUTO_2788 - TRUCK
      ?AUTO_2789 - LOCATION
      ?AUTO_2790 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2787 ) ( AIRPORT ?AUTO_2785 ) ( not ( = ?AUTO_2787 ?AUTO_2785 ) ) ( AIRPLANE-AT ?AUTO_2786 ?AUTO_2785 ) ( TRUCK-AT ?AUTO_2788 ?AUTO_2789 ) ( IN-CITY ?AUTO_2789 ?AUTO_2790 ) ( IN-CITY ?AUTO_2787 ?AUTO_2790 ) ( not ( = ?AUTO_2787 ?AUTO_2789 ) ) ( not ( = ?AUTO_2785 ?AUTO_2789 ) ) ( OBJ-AT ?AUTO_2784 ?AUTO_2789 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2784 ?AUTO_2788 ?AUTO_2789 )
      ( DELIVER-PKG ?AUTO_2784 ?AUTO_2785 )
      ( DELIVER-PKG-VERIFY ?AUTO_2784 ?AUTO_2785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2791 - OBJ
      ?AUTO_2792 - LOCATION
    )
    :vars
    (
      ?AUTO_2794 - LOCATION
      ?AUTO_2795 - AIRPLANE
      ?AUTO_2796 - LOCATION
      ?AUTO_2793 - CITY
      ?AUTO_2797 - TRUCK
      ?AUTO_2798 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2794 ) ( AIRPORT ?AUTO_2792 ) ( not ( = ?AUTO_2794 ?AUTO_2792 ) ) ( AIRPLANE-AT ?AUTO_2795 ?AUTO_2792 ) ( IN-CITY ?AUTO_2796 ?AUTO_2793 ) ( IN-CITY ?AUTO_2794 ?AUTO_2793 ) ( not ( = ?AUTO_2794 ?AUTO_2796 ) ) ( not ( = ?AUTO_2792 ?AUTO_2796 ) ) ( OBJ-AT ?AUTO_2791 ?AUTO_2796 ) ( TRUCK-AT ?AUTO_2797 ?AUTO_2798 ) ( IN-CITY ?AUTO_2798 ?AUTO_2793 ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2792 ?AUTO_2798 ) ) ( not ( = ?AUTO_2794 ?AUTO_2798 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2797 ?AUTO_2798 ?AUTO_2796 ?AUTO_2793 )
      ( DELIVER-PKG ?AUTO_2791 ?AUTO_2792 )
      ( DELIVER-PKG-VERIFY ?AUTO_2791 ?AUTO_2792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2801 - OBJ
      ?AUTO_2802 - LOCATION
    )
    :vars
    (
      ?AUTO_2803 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2801 ?AUTO_2803 ) ( AIRPLANE-AT ?AUTO_2803 ?AUTO_2802 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2801 ?AUTO_2803 ?AUTO_2802 )
      ( DELIVER-PKG-VERIFY ?AUTO_2801 ?AUTO_2802 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2804 - OBJ
      ?AUTO_2805 - LOCATION
    )
    :vars
    (
      ?AUTO_2806 - AIRPLANE
      ?AUTO_2807 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2804 ?AUTO_2806 ) ( AIRPORT ?AUTO_2807 ) ( AIRPORT ?AUTO_2805 ) ( AIRPLANE-AT ?AUTO_2806 ?AUTO_2807 ) ( not ( = ?AUTO_2807 ?AUTO_2805 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2806 ?AUTO_2807 ?AUTO_2805 )
      ( DELIVER-PKG ?AUTO_2804 ?AUTO_2805 )
      ( DELIVER-PKG-VERIFY ?AUTO_2804 ?AUTO_2805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2816 - OBJ
      ?AUTO_2817 - LOCATION
    )
    :vars
    (
      ?AUTO_2818 - LOCATION
      ?AUTO_2819 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2818 ) ( AIRPORT ?AUTO_2817 ) ( AIRPLANE-AT ?AUTO_2819 ?AUTO_2818 ) ( not ( = ?AUTO_2818 ?AUTO_2817 ) ) ( OBJ-AT ?AUTO_2816 ?AUTO_2818 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2816 ?AUTO_2819 ?AUTO_2818 )
      ( DELIVER-PKG ?AUTO_2816 ?AUTO_2817 )
      ( DELIVER-PKG-VERIFY ?AUTO_2816 ?AUTO_2817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2820 - OBJ
      ?AUTO_2821 - LOCATION
    )
    :vars
    (
      ?AUTO_2823 - LOCATION
      ?AUTO_2824 - LOCATION
      ?AUTO_2822 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2823 ) ( AIRPORT ?AUTO_2821 ) ( not ( = ?AUTO_2823 ?AUTO_2821 ) ) ( OBJ-AT ?AUTO_2820 ?AUTO_2823 ) ( AIRPORT ?AUTO_2824 ) ( AIRPLANE-AT ?AUTO_2822 ?AUTO_2824 ) ( not ( = ?AUTO_2824 ?AUTO_2823 ) ) ( not ( = ?AUTO_2821 ?AUTO_2824 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2822 ?AUTO_2824 ?AUTO_2823 )
      ( DELIVER-PKG ?AUTO_2820 ?AUTO_2821 )
      ( DELIVER-PKG-VERIFY ?AUTO_2820 ?AUTO_2821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2829 - OBJ
      ?AUTO_2830 - LOCATION
    )
    :vars
    (
      ?AUTO_2833 - LOCATION
      ?AUTO_2832 - LOCATION
      ?AUTO_2831 - AIRPLANE
      ?AUTO_2834 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2833 ) ( AIRPORT ?AUTO_2830 ) ( not ( = ?AUTO_2833 ?AUTO_2830 ) ) ( AIRPORT ?AUTO_2832 ) ( AIRPLANE-AT ?AUTO_2831 ?AUTO_2832 ) ( not ( = ?AUTO_2832 ?AUTO_2833 ) ) ( not ( = ?AUTO_2830 ?AUTO_2832 ) ) ( TRUCK-AT ?AUTO_2834 ?AUTO_2833 ) ( IN-TRUCK ?AUTO_2829 ?AUTO_2834 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2829 ?AUTO_2834 ?AUTO_2833 )
      ( DELIVER-PKG ?AUTO_2829 ?AUTO_2830 )
      ( DELIVER-PKG-VERIFY ?AUTO_2829 ?AUTO_2830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2835 - OBJ
      ?AUTO_2836 - LOCATION
    )
    :vars
    (
      ?AUTO_2839 - LOCATION
      ?AUTO_2837 - LOCATION
      ?AUTO_2838 - AIRPLANE
      ?AUTO_2840 - TRUCK
      ?AUTO_2841 - LOCATION
      ?AUTO_2842 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2839 ) ( AIRPORT ?AUTO_2836 ) ( not ( = ?AUTO_2839 ?AUTO_2836 ) ) ( AIRPORT ?AUTO_2837 ) ( AIRPLANE-AT ?AUTO_2838 ?AUTO_2837 ) ( not ( = ?AUTO_2837 ?AUTO_2839 ) ) ( not ( = ?AUTO_2836 ?AUTO_2837 ) ) ( IN-TRUCK ?AUTO_2835 ?AUTO_2840 ) ( TRUCK-AT ?AUTO_2840 ?AUTO_2841 ) ( IN-CITY ?AUTO_2841 ?AUTO_2842 ) ( IN-CITY ?AUTO_2839 ?AUTO_2842 ) ( not ( = ?AUTO_2839 ?AUTO_2841 ) ) ( not ( = ?AUTO_2836 ?AUTO_2841 ) ) ( not ( = ?AUTO_2837 ?AUTO_2841 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2840 ?AUTO_2841 ?AUTO_2839 ?AUTO_2842 )
      ( DELIVER-PKG ?AUTO_2835 ?AUTO_2836 )
      ( DELIVER-PKG-VERIFY ?AUTO_2835 ?AUTO_2836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2843 - OBJ
      ?AUTO_2844 - LOCATION
    )
    :vars
    (
      ?AUTO_2850 - LOCATION
      ?AUTO_2846 - LOCATION
      ?AUTO_2845 - AIRPLANE
      ?AUTO_2847 - TRUCK
      ?AUTO_2849 - LOCATION
      ?AUTO_2848 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2850 ) ( AIRPORT ?AUTO_2844 ) ( not ( = ?AUTO_2850 ?AUTO_2844 ) ) ( AIRPORT ?AUTO_2846 ) ( AIRPLANE-AT ?AUTO_2845 ?AUTO_2846 ) ( not ( = ?AUTO_2846 ?AUTO_2850 ) ) ( not ( = ?AUTO_2844 ?AUTO_2846 ) ) ( TRUCK-AT ?AUTO_2847 ?AUTO_2849 ) ( IN-CITY ?AUTO_2849 ?AUTO_2848 ) ( IN-CITY ?AUTO_2850 ?AUTO_2848 ) ( not ( = ?AUTO_2850 ?AUTO_2849 ) ) ( not ( = ?AUTO_2844 ?AUTO_2849 ) ) ( not ( = ?AUTO_2846 ?AUTO_2849 ) ) ( OBJ-AT ?AUTO_2843 ?AUTO_2849 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2843 ?AUTO_2847 ?AUTO_2849 )
      ( DELIVER-PKG ?AUTO_2843 ?AUTO_2844 )
      ( DELIVER-PKG-VERIFY ?AUTO_2843 ?AUTO_2844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2851 - OBJ
      ?AUTO_2852 - LOCATION
    )
    :vars
    (
      ?AUTO_2855 - LOCATION
      ?AUTO_2854 - LOCATION
      ?AUTO_2858 - AIRPLANE
      ?AUTO_2857 - LOCATION
      ?AUTO_2856 - CITY
      ?AUTO_2853 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2855 ) ( AIRPORT ?AUTO_2852 ) ( not ( = ?AUTO_2855 ?AUTO_2852 ) ) ( AIRPORT ?AUTO_2854 ) ( AIRPLANE-AT ?AUTO_2858 ?AUTO_2854 ) ( not ( = ?AUTO_2854 ?AUTO_2855 ) ) ( not ( = ?AUTO_2852 ?AUTO_2854 ) ) ( IN-CITY ?AUTO_2857 ?AUTO_2856 ) ( IN-CITY ?AUTO_2855 ?AUTO_2856 ) ( not ( = ?AUTO_2855 ?AUTO_2857 ) ) ( not ( = ?AUTO_2852 ?AUTO_2857 ) ) ( not ( = ?AUTO_2854 ?AUTO_2857 ) ) ( OBJ-AT ?AUTO_2851 ?AUTO_2857 ) ( TRUCK-AT ?AUTO_2853 ?AUTO_2855 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2853 ?AUTO_2855 ?AUTO_2857 ?AUTO_2856 )
      ( DELIVER-PKG ?AUTO_2851 ?AUTO_2852 )
      ( DELIVER-PKG-VERIFY ?AUTO_2851 ?AUTO_2852 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2869 - OBJ
      ?AUTO_2870 - LOCATION
    )
    :vars
    (
      ?AUTO_2871 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2869 ?AUTO_2871 ) ( AIRPLANE-AT ?AUTO_2871 ?AUTO_2870 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2869 ?AUTO_2871 ?AUTO_2870 )
      ( DELIVER-PKG-VERIFY ?AUTO_2869 ?AUTO_2870 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2872 - OBJ
      ?AUTO_2873 - LOCATION
    )
    :vars
    (
      ?AUTO_2874 - AIRPLANE
      ?AUTO_2875 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2872 ?AUTO_2874 ) ( AIRPORT ?AUTO_2875 ) ( AIRPORT ?AUTO_2873 ) ( AIRPLANE-AT ?AUTO_2874 ?AUTO_2875 ) ( not ( = ?AUTO_2875 ?AUTO_2873 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2874 ?AUTO_2875 ?AUTO_2873 )
      ( DELIVER-PKG ?AUTO_2872 ?AUTO_2873 )
      ( DELIVER-PKG-VERIFY ?AUTO_2872 ?AUTO_2873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2884 - OBJ
      ?AUTO_2885 - LOCATION
    )
    :vars
    (
      ?AUTO_2886 - LOCATION
      ?AUTO_2887 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2886 ) ( AIRPORT ?AUTO_2885 ) ( AIRPLANE-AT ?AUTO_2887 ?AUTO_2886 ) ( not ( = ?AUTO_2886 ?AUTO_2885 ) ) ( OBJ-AT ?AUTO_2884 ?AUTO_2886 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2884 ?AUTO_2887 ?AUTO_2886 )
      ( DELIVER-PKG ?AUTO_2884 ?AUTO_2885 )
      ( DELIVER-PKG-VERIFY ?AUTO_2884 ?AUTO_2885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2888 - OBJ
      ?AUTO_2889 - LOCATION
    )
    :vars
    (
      ?AUTO_2890 - LOCATION
      ?AUTO_2892 - LOCATION
      ?AUTO_2891 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2890 ) ( AIRPORT ?AUTO_2889 ) ( not ( = ?AUTO_2890 ?AUTO_2889 ) ) ( OBJ-AT ?AUTO_2888 ?AUTO_2890 ) ( AIRPORT ?AUTO_2892 ) ( AIRPLANE-AT ?AUTO_2891 ?AUTO_2892 ) ( not ( = ?AUTO_2892 ?AUTO_2890 ) ) ( not ( = ?AUTO_2889 ?AUTO_2892 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2891 ?AUTO_2892 ?AUTO_2890 )
      ( DELIVER-PKG ?AUTO_2888 ?AUTO_2889 )
      ( DELIVER-PKG-VERIFY ?AUTO_2888 ?AUTO_2889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2895 - OBJ
      ?AUTO_2896 - LOCATION
    )
    :vars
    (
      ?AUTO_2897 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2895 ?AUTO_2897 ) ( AIRPLANE-AT ?AUTO_2897 ?AUTO_2896 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2895 ?AUTO_2897 ?AUTO_2896 )
      ( DELIVER-PKG-VERIFY ?AUTO_2895 ?AUTO_2896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2900 - OBJ
      ?AUTO_2901 - LOCATION
    )
    :vars
    (
      ?AUTO_2902 - AIRPLANE
      ?AUTO_2903 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2900 ?AUTO_2902 ) ( AIRPORT ?AUTO_2903 ) ( AIRPORT ?AUTO_2901 ) ( AIRPLANE-AT ?AUTO_2902 ?AUTO_2903 ) ( not ( = ?AUTO_2903 ?AUTO_2901 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2902 ?AUTO_2903 ?AUTO_2901 )
      ( DELIVER-PKG ?AUTO_2900 ?AUTO_2901 )
      ( DELIVER-PKG-VERIFY ?AUTO_2900 ?AUTO_2901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2908 - OBJ
      ?AUTO_2909 - LOCATION
    )
    :vars
    (
      ?AUTO_2910 - LOCATION
      ?AUTO_2911 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2910 ) ( AIRPORT ?AUTO_2909 ) ( AIRPLANE-AT ?AUTO_2911 ?AUTO_2910 ) ( not ( = ?AUTO_2910 ?AUTO_2909 ) ) ( OBJ-AT ?AUTO_2908 ?AUTO_2910 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2908 ?AUTO_2911 ?AUTO_2910 )
      ( DELIVER-PKG ?AUTO_2908 ?AUTO_2909 )
      ( DELIVER-PKG-VERIFY ?AUTO_2908 ?AUTO_2909 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2922 - OBJ
      ?AUTO_2923 - LOCATION
    )
    :vars
    (
      ?AUTO_2924 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2924 ?AUTO_2923 ) ( IN-TRUCK ?AUTO_2922 ?AUTO_2924 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2922 ?AUTO_2924 ?AUTO_2923 )
      ( DELIVER-PKG-VERIFY ?AUTO_2922 ?AUTO_2923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2925 - OBJ
      ?AUTO_2926 - LOCATION
    )
    :vars
    (
      ?AUTO_2927 - TRUCK
      ?AUTO_2928 - LOCATION
      ?AUTO_2929 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2925 ?AUTO_2927 ) ( TRUCK-AT ?AUTO_2927 ?AUTO_2928 ) ( IN-CITY ?AUTO_2928 ?AUTO_2929 ) ( IN-CITY ?AUTO_2926 ?AUTO_2929 ) ( not ( = ?AUTO_2926 ?AUTO_2928 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2927 ?AUTO_2928 ?AUTO_2926 ?AUTO_2929 )
      ( DELIVER-PKG ?AUTO_2925 ?AUTO_2926 )
      ( DELIVER-PKG-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2932 - OBJ
      ?AUTO_2933 - LOCATION
    )
    :vars
    (
      ?AUTO_2934 - TRUCK
      ?AUTO_2936 - LOCATION
      ?AUTO_2935 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2934 ?AUTO_2936 ) ( IN-CITY ?AUTO_2936 ?AUTO_2935 ) ( IN-CITY ?AUTO_2933 ?AUTO_2935 ) ( not ( = ?AUTO_2933 ?AUTO_2936 ) ) ( OBJ-AT ?AUTO_2932 ?AUTO_2936 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2932 ?AUTO_2934 ?AUTO_2936 )
      ( DELIVER-PKG ?AUTO_2932 ?AUTO_2933 )
      ( DELIVER-PKG-VERIFY ?AUTO_2932 ?AUTO_2933 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2939 - OBJ
      ?AUTO_2940 - LOCATION
    )
    :vars
    (
      ?AUTO_2942 - LOCATION
      ?AUTO_2943 - CITY
      ?AUTO_2941 - TRUCK
      ?AUTO_2944 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2942 ?AUTO_2943 ) ( IN-CITY ?AUTO_2940 ?AUTO_2943 ) ( not ( = ?AUTO_2940 ?AUTO_2942 ) ) ( OBJ-AT ?AUTO_2939 ?AUTO_2942 ) ( TRUCK-AT ?AUTO_2941 ?AUTO_2944 ) ( IN-CITY ?AUTO_2944 ?AUTO_2943 ) ( not ( = ?AUTO_2942 ?AUTO_2944 ) ) ( not ( = ?AUTO_2940 ?AUTO_2944 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2941 ?AUTO_2944 ?AUTO_2942 ?AUTO_2943 )
      ( DELIVER-PKG ?AUTO_2939 ?AUTO_2940 )
      ( DELIVER-PKG-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2959 - OBJ
      ?AUTO_2960 - LOCATION
    )
    :vars
    (
      ?AUTO_2961 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2961 ?AUTO_2960 ) ( IN-TRUCK ?AUTO_2959 ?AUTO_2961 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2959 ?AUTO_2961 ?AUTO_2960 )
      ( DELIVER-PKG-VERIFY ?AUTO_2959 ?AUTO_2960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2962 - OBJ
      ?AUTO_2963 - LOCATION
    )
    :vars
    (
      ?AUTO_2964 - TRUCK
      ?AUTO_2965 - LOCATION
      ?AUTO_2966 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2962 ?AUTO_2964 ) ( TRUCK-AT ?AUTO_2964 ?AUTO_2965 ) ( IN-CITY ?AUTO_2965 ?AUTO_2966 ) ( IN-CITY ?AUTO_2963 ?AUTO_2966 ) ( not ( = ?AUTO_2963 ?AUTO_2965 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2964 ?AUTO_2965 ?AUTO_2963 ?AUTO_2966 )
      ( DELIVER-PKG ?AUTO_2962 ?AUTO_2963 )
      ( DELIVER-PKG-VERIFY ?AUTO_2962 ?AUTO_2963 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2967 - OBJ
      ?AUTO_2968 - LOCATION
    )
    :vars
    (
      ?AUTO_2969 - TRUCK
      ?AUTO_2970 - LOCATION
      ?AUTO_2971 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2969 ?AUTO_2970 ) ( IN-CITY ?AUTO_2970 ?AUTO_2971 ) ( IN-CITY ?AUTO_2968 ?AUTO_2971 ) ( not ( = ?AUTO_2968 ?AUTO_2970 ) ) ( OBJ-AT ?AUTO_2967 ?AUTO_2970 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2967 ?AUTO_2969 ?AUTO_2970 )
      ( DELIVER-PKG ?AUTO_2967 ?AUTO_2968 )
      ( DELIVER-PKG-VERIFY ?AUTO_2967 ?AUTO_2968 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2972 - OBJ
      ?AUTO_2973 - LOCATION
    )
    :vars
    (
      ?AUTO_2974 - LOCATION
      ?AUTO_2976 - CITY
      ?AUTO_2975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2974 ?AUTO_2976 ) ( IN-CITY ?AUTO_2973 ?AUTO_2976 ) ( not ( = ?AUTO_2973 ?AUTO_2974 ) ) ( OBJ-AT ?AUTO_2972 ?AUTO_2974 ) ( TRUCK-AT ?AUTO_2975 ?AUTO_2973 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2975 ?AUTO_2973 ?AUTO_2974 ?AUTO_2976 )
      ( DELIVER-PKG ?AUTO_2972 ?AUTO_2973 )
      ( DELIVER-PKG-VERIFY ?AUTO_2972 ?AUTO_2973 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3003 - OBJ
      ?AUTO_3004 - LOCATION
    )
    :vars
    (
      ?AUTO_3005 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3005 ?AUTO_3004 ) ( IN-TRUCK ?AUTO_3003 ?AUTO_3005 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3003 ?AUTO_3005 ?AUTO_3004 )
      ( DELIVER-PKG-VERIFY ?AUTO_3003 ?AUTO_3004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3006 - OBJ
      ?AUTO_3007 - LOCATION
    )
    :vars
    (
      ?AUTO_3008 - TRUCK
      ?AUTO_3009 - LOCATION
      ?AUTO_3010 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3006 ?AUTO_3008 ) ( TRUCK-AT ?AUTO_3008 ?AUTO_3009 ) ( IN-CITY ?AUTO_3009 ?AUTO_3010 ) ( IN-CITY ?AUTO_3007 ?AUTO_3010 ) ( not ( = ?AUTO_3007 ?AUTO_3009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3008 ?AUTO_3009 ?AUTO_3007 ?AUTO_3010 )
      ( DELIVER-PKG ?AUTO_3006 ?AUTO_3007 )
      ( DELIVER-PKG-VERIFY ?AUTO_3006 ?AUTO_3007 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3045 - OBJ
      ?AUTO_3046 - LOCATION
    )
    :vars
    (
      ?AUTO_3047 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3047 ?AUTO_3046 ) ( IN-TRUCK ?AUTO_3045 ?AUTO_3047 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3045 ?AUTO_3047 ?AUTO_3046 )
      ( DELIVER-PKG-VERIFY ?AUTO_3045 ?AUTO_3046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3048 - OBJ
      ?AUTO_3049 - LOCATION
    )
    :vars
    (
      ?AUTO_3050 - TRUCK
      ?AUTO_3051 - LOCATION
      ?AUTO_3052 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3048 ?AUTO_3050 ) ( TRUCK-AT ?AUTO_3050 ?AUTO_3051 ) ( IN-CITY ?AUTO_3051 ?AUTO_3052 ) ( IN-CITY ?AUTO_3049 ?AUTO_3052 ) ( not ( = ?AUTO_3049 ?AUTO_3051 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3050 ?AUTO_3051 ?AUTO_3049 ?AUTO_3052 )
      ( DELIVER-PKG ?AUTO_3048 ?AUTO_3049 )
      ( DELIVER-PKG-VERIFY ?AUTO_3048 ?AUTO_3049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3093 - OBJ
      ?AUTO_3094 - LOCATION
    )
    :vars
    (
      ?AUTO_3095 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3093 ?AUTO_3095 ) ( AIRPLANE-AT ?AUTO_3095 ?AUTO_3094 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3093 ?AUTO_3095 ?AUTO_3094 )
      ( DELIVER-PKG-VERIFY ?AUTO_3093 ?AUTO_3094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3100 - OBJ
      ?AUTO_3101 - LOCATION
    )
    :vars
    (
      ?AUTO_3102 - AIRPLANE
      ?AUTO_3103 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3100 ?AUTO_3102 ) ( AIRPORT ?AUTO_3103 ) ( AIRPORT ?AUTO_3101 ) ( AIRPLANE-AT ?AUTO_3102 ?AUTO_3103 ) ( not ( = ?AUTO_3103 ?AUTO_3101 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3102 ?AUTO_3103 ?AUTO_3101 )
      ( DELIVER-PKG ?AUTO_3100 ?AUTO_3101 )
      ( DELIVER-PKG-VERIFY ?AUTO_3100 ?AUTO_3101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3148 - OBJ
      ?AUTO_3149 - LOCATION
    )
    :vars
    (
      ?AUTO_3150 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3150 ?AUTO_3149 ) ( IN-TRUCK ?AUTO_3148 ?AUTO_3150 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3148 ?AUTO_3150 ?AUTO_3149 )
      ( DELIVER-PKG-VERIFY ?AUTO_3148 ?AUTO_3149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3151 - OBJ
      ?AUTO_3152 - LOCATION
    )
    :vars
    (
      ?AUTO_3153 - TRUCK
      ?AUTO_3154 - LOCATION
      ?AUTO_3155 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3151 ?AUTO_3153 ) ( TRUCK-AT ?AUTO_3153 ?AUTO_3154 ) ( IN-CITY ?AUTO_3154 ?AUTO_3155 ) ( IN-CITY ?AUTO_3152 ?AUTO_3155 ) ( not ( = ?AUTO_3152 ?AUTO_3154 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3153 ?AUTO_3154 ?AUTO_3152 ?AUTO_3155 )
      ( DELIVER-PKG ?AUTO_3151 ?AUTO_3152 )
      ( DELIVER-PKG-VERIFY ?AUTO_3151 ?AUTO_3152 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3156 - OBJ
      ?AUTO_3157 - LOCATION
    )
    :vars
    (
      ?AUTO_3158 - TRUCK
      ?AUTO_3159 - LOCATION
      ?AUTO_3160 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3158 ?AUTO_3159 ) ( IN-CITY ?AUTO_3159 ?AUTO_3160 ) ( IN-CITY ?AUTO_3157 ?AUTO_3160 ) ( not ( = ?AUTO_3157 ?AUTO_3159 ) ) ( OBJ-AT ?AUTO_3156 ?AUTO_3159 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3156 ?AUTO_3158 ?AUTO_3159 )
      ( DELIVER-PKG ?AUTO_3156 ?AUTO_3157 )
      ( DELIVER-PKG-VERIFY ?AUTO_3156 ?AUTO_3157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3161 - OBJ
      ?AUTO_3162 - LOCATION
    )
    :vars
    (
      ?AUTO_3164 - TRUCK
      ?AUTO_3163 - LOCATION
      ?AUTO_3165 - CITY
      ?AUTO_3166 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3164 ?AUTO_3163 ) ( IN-CITY ?AUTO_3163 ?AUTO_3165 ) ( IN-CITY ?AUTO_3162 ?AUTO_3165 ) ( not ( = ?AUTO_3162 ?AUTO_3163 ) ) ( IN-AIRPLANE ?AUTO_3161 ?AUTO_3166 ) ( AIRPLANE-AT ?AUTO_3166 ?AUTO_3163 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3161 ?AUTO_3166 ?AUTO_3163 )
      ( DELIVER-PKG ?AUTO_3161 ?AUTO_3162 )
      ( DELIVER-PKG-VERIFY ?AUTO_3161 ?AUTO_3162 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3171 - OBJ
      ?AUTO_3172 - LOCATION
    )
    :vars
    (
      ?AUTO_3174 - TRUCK
      ?AUTO_3175 - LOCATION
      ?AUTO_3173 - CITY
      ?AUTO_3176 - AIRPLANE
      ?AUTO_3177 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3174 ?AUTO_3175 ) ( IN-CITY ?AUTO_3175 ?AUTO_3173 ) ( IN-CITY ?AUTO_3172 ?AUTO_3173 ) ( not ( = ?AUTO_3172 ?AUTO_3175 ) ) ( IN-AIRPLANE ?AUTO_3171 ?AUTO_3176 ) ( AIRPORT ?AUTO_3177 ) ( AIRPORT ?AUTO_3175 ) ( AIRPLANE-AT ?AUTO_3176 ?AUTO_3177 ) ( not ( = ?AUTO_3177 ?AUTO_3175 ) ) ( not ( = ?AUTO_3172 ?AUTO_3177 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3176 ?AUTO_3177 ?AUTO_3175 )
      ( DELIVER-PKG ?AUTO_3171 ?AUTO_3172 )
      ( DELIVER-PKG-VERIFY ?AUTO_3171 ?AUTO_3172 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3182 - OBJ
      ?AUTO_3183 - LOCATION
    )
    :vars
    (
      ?AUTO_3186 - LOCATION
      ?AUTO_3184 - CITY
      ?AUTO_3188 - AIRPLANE
      ?AUTO_3187 - LOCATION
      ?AUTO_3185 - TRUCK
      ?AUTO_3189 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3186 ?AUTO_3184 ) ( IN-CITY ?AUTO_3183 ?AUTO_3184 ) ( not ( = ?AUTO_3183 ?AUTO_3186 ) ) ( IN-AIRPLANE ?AUTO_3182 ?AUTO_3188 ) ( AIRPORT ?AUTO_3187 ) ( AIRPORT ?AUTO_3186 ) ( AIRPLANE-AT ?AUTO_3188 ?AUTO_3187 ) ( not ( = ?AUTO_3187 ?AUTO_3186 ) ) ( not ( = ?AUTO_3183 ?AUTO_3187 ) ) ( TRUCK-AT ?AUTO_3185 ?AUTO_3189 ) ( IN-CITY ?AUTO_3189 ?AUTO_3184 ) ( not ( = ?AUTO_3186 ?AUTO_3189 ) ) ( not ( = ?AUTO_3183 ?AUTO_3189 ) ) ( not ( = ?AUTO_3187 ?AUTO_3189 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3185 ?AUTO_3189 ?AUTO_3186 ?AUTO_3184 )
      ( DELIVER-PKG ?AUTO_3182 ?AUTO_3183 )
      ( DELIVER-PKG-VERIFY ?AUTO_3182 ?AUTO_3183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3218 - OBJ
      ?AUTO_3219 - LOCATION
    )
    :vars
    (
      ?AUTO_3223 - LOCATION
      ?AUTO_3221 - CITY
      ?AUTO_3224 - LOCATION
      ?AUTO_3225 - AIRPLANE
      ?AUTO_3222 - TRUCK
      ?AUTO_3220 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3223 ?AUTO_3221 ) ( IN-CITY ?AUTO_3219 ?AUTO_3221 ) ( not ( = ?AUTO_3219 ?AUTO_3223 ) ) ( AIRPORT ?AUTO_3224 ) ( AIRPORT ?AUTO_3223 ) ( AIRPLANE-AT ?AUTO_3225 ?AUTO_3224 ) ( not ( = ?AUTO_3224 ?AUTO_3223 ) ) ( not ( = ?AUTO_3219 ?AUTO_3224 ) ) ( TRUCK-AT ?AUTO_3222 ?AUTO_3220 ) ( IN-CITY ?AUTO_3220 ?AUTO_3221 ) ( not ( = ?AUTO_3223 ?AUTO_3220 ) ) ( not ( = ?AUTO_3219 ?AUTO_3220 ) ) ( not ( = ?AUTO_3224 ?AUTO_3220 ) ) ( OBJ-AT ?AUTO_3218 ?AUTO_3224 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3218 ?AUTO_3225 ?AUTO_3224 )
      ( DELIVER-PKG ?AUTO_3218 ?AUTO_3219 )
      ( DELIVER-PKG-VERIFY ?AUTO_3218 ?AUTO_3219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3234 - OBJ
      ?AUTO_3235 - LOCATION
    )
    :vars
    (
      ?AUTO_3236 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3234 ?AUTO_3236 ) ( AIRPLANE-AT ?AUTO_3236 ?AUTO_3235 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3234 ?AUTO_3236 ?AUTO_3235 )
      ( DELIVER-PKG-VERIFY ?AUTO_3234 ?AUTO_3235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3237 - OBJ
      ?AUTO_3238 - LOCATION
    )
    :vars
    (
      ?AUTO_3239 - AIRPLANE
      ?AUTO_3240 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3237 ?AUTO_3239 ) ( AIRPORT ?AUTO_3240 ) ( AIRPORT ?AUTO_3238 ) ( AIRPLANE-AT ?AUTO_3239 ?AUTO_3240 ) ( not ( = ?AUTO_3240 ?AUTO_3238 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3239 ?AUTO_3240 ?AUTO_3238 )
      ( DELIVER-PKG ?AUTO_3237 ?AUTO_3238 )
      ( DELIVER-PKG-VERIFY ?AUTO_3237 ?AUTO_3238 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3253 - OBJ
      ?AUTO_3254 - LOCATION
    )
    :vars
    (
      ?AUTO_3255 - LOCATION
      ?AUTO_3256 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3255 ) ( AIRPORT ?AUTO_3254 ) ( AIRPLANE-AT ?AUTO_3256 ?AUTO_3255 ) ( not ( = ?AUTO_3255 ?AUTO_3254 ) ) ( OBJ-AT ?AUTO_3253 ?AUTO_3255 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3253 ?AUTO_3256 ?AUTO_3255 )
      ( DELIVER-PKG ?AUTO_3253 ?AUTO_3254 )
      ( DELIVER-PKG-VERIFY ?AUTO_3253 ?AUTO_3254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3257 - OBJ
      ?AUTO_3258 - LOCATION
    )
    :vars
    (
      ?AUTO_3260 - LOCATION
      ?AUTO_3259 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3260 ) ( AIRPORT ?AUTO_3258 ) ( not ( = ?AUTO_3260 ?AUTO_3258 ) ) ( OBJ-AT ?AUTO_3257 ?AUTO_3260 ) ( AIRPLANE-AT ?AUTO_3259 ?AUTO_3258 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3259 ?AUTO_3258 ?AUTO_3260 )
      ( DELIVER-PKG ?AUTO_3257 ?AUTO_3258 )
      ( DELIVER-PKG-VERIFY ?AUTO_3257 ?AUTO_3258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3305 - OBJ
      ?AUTO_3306 - LOCATION
    )
    :vars
    (
      ?AUTO_3307 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3305 ?AUTO_3307 ) ( AIRPLANE-AT ?AUTO_3307 ?AUTO_3306 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3305 ?AUTO_3307 ?AUTO_3306 )
      ( DELIVER-PKG-VERIFY ?AUTO_3305 ?AUTO_3306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3322 - OBJ
      ?AUTO_3323 - LOCATION
    )
    :vars
    (
      ?AUTO_3325 - LOCATION
      ?AUTO_3324 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3325 ) ( AIRPORT ?AUTO_3323 ) ( AIRPLANE-AT ?AUTO_3324 ?AUTO_3325 ) ( not ( = ?AUTO_3325 ?AUTO_3323 ) ) ( OBJ-AT ?AUTO_3322 ?AUTO_3325 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3322 ?AUTO_3324 ?AUTO_3325 )
      ( DELIVER-PKG ?AUTO_3322 ?AUTO_3323 )
      ( DELIVER-PKG-VERIFY ?AUTO_3322 ?AUTO_3323 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3330 - OBJ
      ?AUTO_3331 - LOCATION
    )
    :vars
    (
      ?AUTO_3333 - LOCATION
      ?AUTO_3332 - AIRPLANE
      ?AUTO_3334 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3333 ) ( AIRPORT ?AUTO_3331 ) ( not ( = ?AUTO_3333 ?AUTO_3331 ) ) ( AIRPLANE-AT ?AUTO_3332 ?AUTO_3331 ) ( TRUCK-AT ?AUTO_3334 ?AUTO_3333 ) ( IN-TRUCK ?AUTO_3330 ?AUTO_3334 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3330 ?AUTO_3334 ?AUTO_3333 )
      ( DELIVER-PKG ?AUTO_3330 ?AUTO_3331 )
      ( DELIVER-PKG-VERIFY ?AUTO_3330 ?AUTO_3331 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3335 - OBJ
      ?AUTO_3336 - LOCATION
    )
    :vars
    (
      ?AUTO_3339 - LOCATION
      ?AUTO_3337 - AIRPLANE
      ?AUTO_3338 - TRUCK
      ?AUTO_3340 - LOCATION
      ?AUTO_3341 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3339 ) ( AIRPORT ?AUTO_3336 ) ( not ( = ?AUTO_3339 ?AUTO_3336 ) ) ( AIRPLANE-AT ?AUTO_3337 ?AUTO_3336 ) ( IN-TRUCK ?AUTO_3335 ?AUTO_3338 ) ( TRUCK-AT ?AUTO_3338 ?AUTO_3340 ) ( IN-CITY ?AUTO_3340 ?AUTO_3341 ) ( IN-CITY ?AUTO_3339 ?AUTO_3341 ) ( not ( = ?AUTO_3339 ?AUTO_3340 ) ) ( not ( = ?AUTO_3336 ?AUTO_3340 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3338 ?AUTO_3340 ?AUTO_3339 ?AUTO_3341 )
      ( DELIVER-PKG ?AUTO_3335 ?AUTO_3336 )
      ( DELIVER-PKG-VERIFY ?AUTO_3335 ?AUTO_3336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3374 - OBJ
      ?AUTO_3375 - LOCATION
    )
    :vars
    (
      ?AUTO_3379 - LOCATION
      ?AUTO_3377 - AIRPLANE
      ?AUTO_3380 - TRUCK
      ?AUTO_3378 - LOCATION
      ?AUTO_3376 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3379 ) ( AIRPORT ?AUTO_3375 ) ( not ( = ?AUTO_3379 ?AUTO_3375 ) ) ( AIRPLANE-AT ?AUTO_3377 ?AUTO_3375 ) ( TRUCK-AT ?AUTO_3380 ?AUTO_3378 ) ( IN-CITY ?AUTO_3378 ?AUTO_3376 ) ( IN-CITY ?AUTO_3379 ?AUTO_3376 ) ( not ( = ?AUTO_3379 ?AUTO_3378 ) ) ( not ( = ?AUTO_3375 ?AUTO_3378 ) ) ( OBJ-AT ?AUTO_3374 ?AUTO_3378 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3374 ?AUTO_3380 ?AUTO_3378 )
      ( DELIVER-PKG ?AUTO_3374 ?AUTO_3375 )
      ( DELIVER-PKG-VERIFY ?AUTO_3374 ?AUTO_3375 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3387 - OBJ
      ?AUTO_3388 - LOCATION
    )
    :vars
    (
      ?AUTO_3389 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3389 ?AUTO_3388 ) ( IN-TRUCK ?AUTO_3387 ?AUTO_3389 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3387 ?AUTO_3389 ?AUTO_3388 )
      ( DELIVER-PKG-VERIFY ?AUTO_3387 ?AUTO_3388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3390 - OBJ
      ?AUTO_3391 - LOCATION
    )
    :vars
    (
      ?AUTO_3392 - TRUCK
      ?AUTO_3393 - LOCATION
      ?AUTO_3394 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3390 ?AUTO_3392 ) ( TRUCK-AT ?AUTO_3392 ?AUTO_3393 ) ( IN-CITY ?AUTO_3393 ?AUTO_3394 ) ( IN-CITY ?AUTO_3391 ?AUTO_3394 ) ( not ( = ?AUTO_3391 ?AUTO_3393 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3392 ?AUTO_3393 ?AUTO_3391 ?AUTO_3394 )
      ( DELIVER-PKG ?AUTO_3390 ?AUTO_3391 )
      ( DELIVER-PKG-VERIFY ?AUTO_3390 ?AUTO_3391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3461 - OBJ
      ?AUTO_3462 - LOCATION
    )
    :vars
    (
      ?AUTO_3463 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3461 ?AUTO_3463 ) ( AIRPLANE-AT ?AUTO_3463 ?AUTO_3462 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3461 ?AUTO_3463 ?AUTO_3462 )
      ( DELIVER-PKG-VERIFY ?AUTO_3461 ?AUTO_3462 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3466 - OBJ
      ?AUTO_3467 - LOCATION
    )
    :vars
    (
      ?AUTO_3468 - AIRPLANE
      ?AUTO_3469 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3466 ?AUTO_3468 ) ( AIRPORT ?AUTO_3469 ) ( AIRPORT ?AUTO_3467 ) ( AIRPLANE-AT ?AUTO_3468 ?AUTO_3469 ) ( not ( = ?AUTO_3469 ?AUTO_3467 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3468 ?AUTO_3469 ?AUTO_3467 )
      ( DELIVER-PKG ?AUTO_3466 ?AUTO_3467 )
      ( DELIVER-PKG-VERIFY ?AUTO_3466 ?AUTO_3467 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3470 - OBJ
      ?AUTO_3471 - LOCATION
    )
    :vars
    (
      ?AUTO_3473 - LOCATION
      ?AUTO_3472 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3473 ) ( AIRPORT ?AUTO_3471 ) ( AIRPLANE-AT ?AUTO_3472 ?AUTO_3473 ) ( not ( = ?AUTO_3473 ?AUTO_3471 ) ) ( OBJ-AT ?AUTO_3470 ?AUTO_3473 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3470 ?AUTO_3472 ?AUTO_3473 )
      ( DELIVER-PKG ?AUTO_3470 ?AUTO_3471 )
      ( DELIVER-PKG-VERIFY ?AUTO_3470 ?AUTO_3471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3474 - OBJ
      ?AUTO_3475 - LOCATION
    )
    :vars
    (
      ?AUTO_3477 - LOCATION
      ?AUTO_3476 - AIRPLANE
      ?AUTO_3478 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3477 ) ( AIRPORT ?AUTO_3475 ) ( AIRPLANE-AT ?AUTO_3476 ?AUTO_3477 ) ( not ( = ?AUTO_3477 ?AUTO_3475 ) ) ( TRUCK-AT ?AUTO_3478 ?AUTO_3477 ) ( IN-TRUCK ?AUTO_3474 ?AUTO_3478 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3474 ?AUTO_3478 ?AUTO_3477 )
      ( DELIVER-PKG ?AUTO_3474 ?AUTO_3475 )
      ( DELIVER-PKG-VERIFY ?AUTO_3474 ?AUTO_3475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3479 - OBJ
      ?AUTO_3480 - LOCATION
    )
    :vars
    (
      ?AUTO_3482 - LOCATION
      ?AUTO_3481 - AIRPLANE
      ?AUTO_3483 - TRUCK
      ?AUTO_3484 - LOCATION
      ?AUTO_3485 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3482 ) ( AIRPORT ?AUTO_3480 ) ( AIRPLANE-AT ?AUTO_3481 ?AUTO_3482 ) ( not ( = ?AUTO_3482 ?AUTO_3480 ) ) ( IN-TRUCK ?AUTO_3479 ?AUTO_3483 ) ( TRUCK-AT ?AUTO_3483 ?AUTO_3484 ) ( IN-CITY ?AUTO_3484 ?AUTO_3485 ) ( IN-CITY ?AUTO_3482 ?AUTO_3485 ) ( not ( = ?AUTO_3482 ?AUTO_3484 ) ) ( not ( = ?AUTO_3480 ?AUTO_3484 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3483 ?AUTO_3484 ?AUTO_3482 ?AUTO_3485 )
      ( DELIVER-PKG ?AUTO_3479 ?AUTO_3480 )
      ( DELIVER-PKG-VERIFY ?AUTO_3479 ?AUTO_3480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3548 - OBJ
      ?AUTO_3549 - LOCATION
    )
    :vars
    (
      ?AUTO_3550 - LOCATION
      ?AUTO_3551 - AIRPLANE
      ?AUTO_3552 - TRUCK
      ?AUTO_3554 - LOCATION
      ?AUTO_3553 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3550 ) ( AIRPORT ?AUTO_3549 ) ( AIRPLANE-AT ?AUTO_3551 ?AUTO_3550 ) ( not ( = ?AUTO_3550 ?AUTO_3549 ) ) ( TRUCK-AT ?AUTO_3552 ?AUTO_3554 ) ( IN-CITY ?AUTO_3554 ?AUTO_3553 ) ( IN-CITY ?AUTO_3550 ?AUTO_3553 ) ( not ( = ?AUTO_3550 ?AUTO_3554 ) ) ( not ( = ?AUTO_3549 ?AUTO_3554 ) ) ( OBJ-AT ?AUTO_3548 ?AUTO_3554 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3548 ?AUTO_3552 ?AUTO_3554 )
      ( DELIVER-PKG ?AUTO_3548 ?AUTO_3549 )
      ( DELIVER-PKG-VERIFY ?AUTO_3548 ?AUTO_3549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3557 - OBJ
      ?AUTO_3558 - LOCATION
    )
    :vars
    (
      ?AUTO_3559 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3557 ?AUTO_3559 ) ( AIRPLANE-AT ?AUTO_3559 ?AUTO_3558 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3557 ?AUTO_3559 ?AUTO_3558 )
      ( DELIVER-PKG-VERIFY ?AUTO_3557 ?AUTO_3558 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3560 - OBJ
      ?AUTO_3561 - LOCATION
    )
    :vars
    (
      ?AUTO_3562 - AIRPLANE
      ?AUTO_3563 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3560 ?AUTO_3562 ) ( AIRPORT ?AUTO_3563 ) ( AIRPORT ?AUTO_3561 ) ( AIRPLANE-AT ?AUTO_3562 ?AUTO_3563 ) ( not ( = ?AUTO_3563 ?AUTO_3561 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3562 ?AUTO_3563 ?AUTO_3561 )
      ( DELIVER-PKG ?AUTO_3560 ?AUTO_3561 )
      ( DELIVER-PKG-VERIFY ?AUTO_3560 ?AUTO_3561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3566 - OBJ
      ?AUTO_3567 - LOCATION
    )
    :vars
    (
      ?AUTO_3569 - LOCATION
      ?AUTO_3568 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3569 ) ( AIRPORT ?AUTO_3567 ) ( AIRPLANE-AT ?AUTO_3568 ?AUTO_3569 ) ( not ( = ?AUTO_3569 ?AUTO_3567 ) ) ( OBJ-AT ?AUTO_3566 ?AUTO_3569 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3566 ?AUTO_3568 ?AUTO_3569 )
      ( DELIVER-PKG ?AUTO_3566 ?AUTO_3567 )
      ( DELIVER-PKG-VERIFY ?AUTO_3566 ?AUTO_3567 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3570 - OBJ
      ?AUTO_3571 - LOCATION
    )
    :vars
    (
      ?AUTO_3573 - LOCATION
      ?AUTO_3574 - LOCATION
      ?AUTO_3572 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3573 ) ( AIRPORT ?AUTO_3571 ) ( not ( = ?AUTO_3573 ?AUTO_3571 ) ) ( OBJ-AT ?AUTO_3570 ?AUTO_3573 ) ( AIRPORT ?AUTO_3574 ) ( AIRPLANE-AT ?AUTO_3572 ?AUTO_3574 ) ( not ( = ?AUTO_3574 ?AUTO_3573 ) ) ( not ( = ?AUTO_3571 ?AUTO_3574 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3572 ?AUTO_3574 ?AUTO_3573 )
      ( DELIVER-PKG ?AUTO_3570 ?AUTO_3571 )
      ( DELIVER-PKG-VERIFY ?AUTO_3570 ?AUTO_3571 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3621 - OBJ
      ?AUTO_3622 - LOCATION
    )
    :vars
    (
      ?AUTO_3625 - LOCATION
      ?AUTO_3623 - LOCATION
      ?AUTO_3624 - AIRPLANE
      ?AUTO_3626 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3625 ) ( AIRPORT ?AUTO_3622 ) ( not ( = ?AUTO_3625 ?AUTO_3622 ) ) ( AIRPORT ?AUTO_3623 ) ( AIRPLANE-AT ?AUTO_3624 ?AUTO_3623 ) ( not ( = ?AUTO_3623 ?AUTO_3625 ) ) ( not ( = ?AUTO_3622 ?AUTO_3623 ) ) ( TRUCK-AT ?AUTO_3626 ?AUTO_3625 ) ( IN-TRUCK ?AUTO_3621 ?AUTO_3626 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3621 ?AUTO_3626 ?AUTO_3625 )
      ( DELIVER-PKG ?AUTO_3621 ?AUTO_3622 )
      ( DELIVER-PKG-VERIFY ?AUTO_3621 ?AUTO_3622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3627 - OBJ
      ?AUTO_3628 - LOCATION
    )
    :vars
    (
      ?AUTO_3631 - LOCATION
      ?AUTO_3632 - LOCATION
      ?AUTO_3630 - AIRPLANE
      ?AUTO_3629 - TRUCK
      ?AUTO_3633 - LOCATION
      ?AUTO_3634 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3631 ) ( AIRPORT ?AUTO_3628 ) ( not ( = ?AUTO_3631 ?AUTO_3628 ) ) ( AIRPORT ?AUTO_3632 ) ( AIRPLANE-AT ?AUTO_3630 ?AUTO_3632 ) ( not ( = ?AUTO_3632 ?AUTO_3631 ) ) ( not ( = ?AUTO_3628 ?AUTO_3632 ) ) ( IN-TRUCK ?AUTO_3627 ?AUTO_3629 ) ( TRUCK-AT ?AUTO_3629 ?AUTO_3633 ) ( IN-CITY ?AUTO_3633 ?AUTO_3634 ) ( IN-CITY ?AUTO_3631 ?AUTO_3634 ) ( not ( = ?AUTO_3631 ?AUTO_3633 ) ) ( not ( = ?AUTO_3628 ?AUTO_3633 ) ) ( not ( = ?AUTO_3632 ?AUTO_3633 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3629 ?AUTO_3633 ?AUTO_3631 ?AUTO_3634 )
      ( DELIVER-PKG ?AUTO_3627 ?AUTO_3628 )
      ( DELIVER-PKG-VERIFY ?AUTO_3627 ?AUTO_3628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3637 - OBJ
      ?AUTO_3638 - LOCATION
    )
    :vars
    (
      ?AUTO_3644 - LOCATION
      ?AUTO_3639 - LOCATION
      ?AUTO_3640 - AIRPLANE
      ?AUTO_3643 - TRUCK
      ?AUTO_3641 - LOCATION
      ?AUTO_3642 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3644 ) ( AIRPORT ?AUTO_3638 ) ( not ( = ?AUTO_3644 ?AUTO_3638 ) ) ( AIRPORT ?AUTO_3639 ) ( AIRPLANE-AT ?AUTO_3640 ?AUTO_3639 ) ( not ( = ?AUTO_3639 ?AUTO_3644 ) ) ( not ( = ?AUTO_3638 ?AUTO_3639 ) ) ( TRUCK-AT ?AUTO_3643 ?AUTO_3641 ) ( IN-CITY ?AUTO_3641 ?AUTO_3642 ) ( IN-CITY ?AUTO_3644 ?AUTO_3642 ) ( not ( = ?AUTO_3644 ?AUTO_3641 ) ) ( not ( = ?AUTO_3638 ?AUTO_3641 ) ) ( not ( = ?AUTO_3639 ?AUTO_3641 ) ) ( OBJ-AT ?AUTO_3637 ?AUTO_3641 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3637 ?AUTO_3643 ?AUTO_3641 )
      ( DELIVER-PKG ?AUTO_3637 ?AUTO_3638 )
      ( DELIVER-PKG-VERIFY ?AUTO_3637 ?AUTO_3638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3647 - OBJ
      ?AUTO_3648 - LOCATION
    )
    :vars
    (
      ?AUTO_3650 - LOCATION
      ?AUTO_3653 - LOCATION
      ?AUTO_3654 - AIRPLANE
      ?AUTO_3651 - LOCATION
      ?AUTO_3649 - CITY
      ?AUTO_3652 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3650 ) ( AIRPORT ?AUTO_3648 ) ( not ( = ?AUTO_3650 ?AUTO_3648 ) ) ( AIRPORT ?AUTO_3653 ) ( AIRPLANE-AT ?AUTO_3654 ?AUTO_3653 ) ( not ( = ?AUTO_3653 ?AUTO_3650 ) ) ( not ( = ?AUTO_3648 ?AUTO_3653 ) ) ( IN-CITY ?AUTO_3651 ?AUTO_3649 ) ( IN-CITY ?AUTO_3650 ?AUTO_3649 ) ( not ( = ?AUTO_3650 ?AUTO_3651 ) ) ( not ( = ?AUTO_3648 ?AUTO_3651 ) ) ( not ( = ?AUTO_3653 ?AUTO_3651 ) ) ( OBJ-AT ?AUTO_3647 ?AUTO_3651 ) ( TRUCK-AT ?AUTO_3652 ?AUTO_3653 ) ( IN-CITY ?AUTO_3653 ?AUTO_3649 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3652 ?AUTO_3653 ?AUTO_3651 ?AUTO_3649 )
      ( DELIVER-PKG ?AUTO_3647 ?AUTO_3648 )
      ( DELIVER-PKG-VERIFY ?AUTO_3647 ?AUTO_3648 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3669 - OBJ
      ?AUTO_3670 - LOCATION
    )
    :vars
    (
      ?AUTO_3671 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3671 ?AUTO_3670 ) ( IN-TRUCK ?AUTO_3669 ?AUTO_3671 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3669 ?AUTO_3671 ?AUTO_3670 )
      ( DELIVER-PKG-VERIFY ?AUTO_3669 ?AUTO_3670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3672 - OBJ
      ?AUTO_3673 - LOCATION
    )
    :vars
    (
      ?AUTO_3674 - TRUCK
      ?AUTO_3675 - LOCATION
      ?AUTO_3676 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3672 ?AUTO_3674 ) ( TRUCK-AT ?AUTO_3674 ?AUTO_3675 ) ( IN-CITY ?AUTO_3675 ?AUTO_3676 ) ( IN-CITY ?AUTO_3673 ?AUTO_3676 ) ( not ( = ?AUTO_3673 ?AUTO_3675 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3674 ?AUTO_3675 ?AUTO_3673 ?AUTO_3676 )
      ( DELIVER-PKG ?AUTO_3672 ?AUTO_3673 )
      ( DELIVER-PKG-VERIFY ?AUTO_3672 ?AUTO_3673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3687 - OBJ
      ?AUTO_3688 - LOCATION
    )
    :vars
    (
      ?AUTO_3691 - TRUCK
      ?AUTO_3689 - LOCATION
      ?AUTO_3690 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3691 ?AUTO_3689 ) ( IN-CITY ?AUTO_3689 ?AUTO_3690 ) ( IN-CITY ?AUTO_3688 ?AUTO_3690 ) ( not ( = ?AUTO_3688 ?AUTO_3689 ) ) ( OBJ-AT ?AUTO_3687 ?AUTO_3689 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3687 ?AUTO_3691 ?AUTO_3689 )
      ( DELIVER-PKG ?AUTO_3687 ?AUTO_3688 )
      ( DELIVER-PKG-VERIFY ?AUTO_3687 ?AUTO_3688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3708 - OBJ
      ?AUTO_3709 - LOCATION
    )
    :vars
    (
      ?AUTO_3712 - LOCATION
      ?AUTO_3711 - CITY
      ?AUTO_3710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3712 ?AUTO_3711 ) ( IN-CITY ?AUTO_3709 ?AUTO_3711 ) ( not ( = ?AUTO_3709 ?AUTO_3712 ) ) ( OBJ-AT ?AUTO_3708 ?AUTO_3712 ) ( TRUCK-AT ?AUTO_3710 ?AUTO_3709 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3710 ?AUTO_3709 ?AUTO_3712 ?AUTO_3711 )
      ( DELIVER-PKG ?AUTO_3708 ?AUTO_3709 )
      ( DELIVER-PKG-VERIFY ?AUTO_3708 ?AUTO_3709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3757 - OBJ
      ?AUTO_3758 - LOCATION
    )
    :vars
    (
      ?AUTO_3761 - LOCATION
      ?AUTO_3760 - CITY
      ?AUTO_3759 - TRUCK
      ?AUTO_3762 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3761 ?AUTO_3760 ) ( IN-CITY ?AUTO_3758 ?AUTO_3760 ) ( not ( = ?AUTO_3758 ?AUTO_3761 ) ) ( TRUCK-AT ?AUTO_3759 ?AUTO_3758 ) ( IN-AIRPLANE ?AUTO_3757 ?AUTO_3762 ) ( AIRPLANE-AT ?AUTO_3762 ?AUTO_3761 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3757 ?AUTO_3762 ?AUTO_3761 )
      ( DELIVER-PKG ?AUTO_3757 ?AUTO_3758 )
      ( DELIVER-PKG-VERIFY ?AUTO_3757 ?AUTO_3758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3765 - OBJ
      ?AUTO_3766 - LOCATION
    )
    :vars
    (
      ?AUTO_3770 - LOCATION
      ?AUTO_3767 - CITY
      ?AUTO_3768 - TRUCK
      ?AUTO_3769 - AIRPLANE
      ?AUTO_3771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3770 ?AUTO_3767 ) ( IN-CITY ?AUTO_3766 ?AUTO_3767 ) ( not ( = ?AUTO_3766 ?AUTO_3770 ) ) ( TRUCK-AT ?AUTO_3768 ?AUTO_3766 ) ( IN-AIRPLANE ?AUTO_3765 ?AUTO_3769 ) ( AIRPORT ?AUTO_3771 ) ( AIRPORT ?AUTO_3770 ) ( AIRPLANE-AT ?AUTO_3769 ?AUTO_3771 ) ( not ( = ?AUTO_3771 ?AUTO_3770 ) ) ( not ( = ?AUTO_3766 ?AUTO_3771 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3769 ?AUTO_3771 ?AUTO_3770 )
      ( DELIVER-PKG ?AUTO_3765 ?AUTO_3766 )
      ( DELIVER-PKG-VERIFY ?AUTO_3765 ?AUTO_3766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3776 - OBJ
      ?AUTO_3777 - LOCATION
    )
    :vars
    (
      ?AUTO_3781 - LOCATION
      ?AUTO_3778 - CITY
      ?AUTO_3779 - TRUCK
      ?AUTO_3780 - LOCATION
      ?AUTO_3782 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3781 ?AUTO_3778 ) ( IN-CITY ?AUTO_3777 ?AUTO_3778 ) ( not ( = ?AUTO_3777 ?AUTO_3781 ) ) ( TRUCK-AT ?AUTO_3779 ?AUTO_3777 ) ( AIRPORT ?AUTO_3780 ) ( AIRPORT ?AUTO_3781 ) ( AIRPLANE-AT ?AUTO_3782 ?AUTO_3780 ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( not ( = ?AUTO_3777 ?AUTO_3780 ) ) ( OBJ-AT ?AUTO_3776 ?AUTO_3780 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3776 ?AUTO_3782 ?AUTO_3780 )
      ( DELIVER-PKG ?AUTO_3776 ?AUTO_3777 )
      ( DELIVER-PKG-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3793 - OBJ
      ?AUTO_3794 - LOCATION
    )
    :vars
    (
      ?AUTO_3795 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3795 ?AUTO_3794 ) ( IN-TRUCK ?AUTO_3793 ?AUTO_3795 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3793 ?AUTO_3795 ?AUTO_3794 )
      ( DELIVER-PKG-VERIFY ?AUTO_3793 ?AUTO_3794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3796 - OBJ
      ?AUTO_3797 - LOCATION
    )
    :vars
    (
      ?AUTO_3798 - TRUCK
      ?AUTO_3799 - LOCATION
      ?AUTO_3800 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3796 ?AUTO_3798 ) ( TRUCK-AT ?AUTO_3798 ?AUTO_3799 ) ( IN-CITY ?AUTO_3799 ?AUTO_3800 ) ( IN-CITY ?AUTO_3797 ?AUTO_3800 ) ( not ( = ?AUTO_3797 ?AUTO_3799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3798 ?AUTO_3799 ?AUTO_3797 ?AUTO_3800 )
      ( DELIVER-PKG ?AUTO_3796 ?AUTO_3797 )
      ( DELIVER-PKG-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3833 - OBJ
      ?AUTO_3834 - LOCATION
    )
    :vars
    (
      ?AUTO_3835 - LOCATION
      ?AUTO_3836 - CITY
      ?AUTO_3837 - TRUCK
      ?AUTO_3838 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3835 ?AUTO_3836 ) ( IN-CITY ?AUTO_3834 ?AUTO_3836 ) ( not ( = ?AUTO_3834 ?AUTO_3835 ) ) ( OBJ-AT ?AUTO_3833 ?AUTO_3835 ) ( TRUCK-AT ?AUTO_3837 ?AUTO_3838 ) ( IN-CITY ?AUTO_3838 ?AUTO_3836 ) ( not ( = ?AUTO_3835 ?AUTO_3838 ) ) ( not ( = ?AUTO_3834 ?AUTO_3838 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3837 ?AUTO_3838 ?AUTO_3835 ?AUTO_3836 )
      ( DELIVER-PKG ?AUTO_3833 ?AUTO_3834 )
      ( DELIVER-PKG-VERIFY ?AUTO_3833 ?AUTO_3834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3841 - OBJ
      ?AUTO_3842 - LOCATION
    )
    :vars
    (
      ?AUTO_3845 - LOCATION
      ?AUTO_3846 - CITY
      ?AUTO_3843 - TRUCK
      ?AUTO_3844 - LOCATION
      ?AUTO_3847 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3845 ?AUTO_3846 ) ( IN-CITY ?AUTO_3842 ?AUTO_3846 ) ( not ( = ?AUTO_3842 ?AUTO_3845 ) ) ( TRUCK-AT ?AUTO_3843 ?AUTO_3844 ) ( IN-CITY ?AUTO_3844 ?AUTO_3846 ) ( not ( = ?AUTO_3845 ?AUTO_3844 ) ) ( not ( = ?AUTO_3842 ?AUTO_3844 ) ) ( IN-AIRPLANE ?AUTO_3841 ?AUTO_3847 ) ( AIRPLANE-AT ?AUTO_3847 ?AUTO_3845 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3841 ?AUTO_3847 ?AUTO_3845 )
      ( DELIVER-PKG ?AUTO_3841 ?AUTO_3842 )
      ( DELIVER-PKG-VERIFY ?AUTO_3841 ?AUTO_3842 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3848 - OBJ
      ?AUTO_3849 - LOCATION
    )
    :vars
    (
      ?AUTO_3851 - LOCATION
      ?AUTO_3850 - CITY
      ?AUTO_3852 - TRUCK
      ?AUTO_3853 - LOCATION
      ?AUTO_3854 - AIRPLANE
      ?AUTO_3855 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3851 ?AUTO_3850 ) ( IN-CITY ?AUTO_3849 ?AUTO_3850 ) ( not ( = ?AUTO_3849 ?AUTO_3851 ) ) ( TRUCK-AT ?AUTO_3852 ?AUTO_3853 ) ( IN-CITY ?AUTO_3853 ?AUTO_3850 ) ( not ( = ?AUTO_3851 ?AUTO_3853 ) ) ( not ( = ?AUTO_3849 ?AUTO_3853 ) ) ( IN-AIRPLANE ?AUTO_3848 ?AUTO_3854 ) ( AIRPORT ?AUTO_3855 ) ( AIRPORT ?AUTO_3851 ) ( AIRPLANE-AT ?AUTO_3854 ?AUTO_3855 ) ( not ( = ?AUTO_3855 ?AUTO_3851 ) ) ( not ( = ?AUTO_3849 ?AUTO_3855 ) ) ( not ( = ?AUTO_3853 ?AUTO_3855 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3854 ?AUTO_3855 ?AUTO_3851 )
      ( DELIVER-PKG ?AUTO_3848 ?AUTO_3849 )
      ( DELIVER-PKG-VERIFY ?AUTO_3848 ?AUTO_3849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3868 - OBJ
      ?AUTO_3869 - LOCATION
    )
    :vars
    (
      ?AUTO_3871 - LOCATION
      ?AUTO_3874 - CITY
      ?AUTO_3875 - TRUCK
      ?AUTO_3870 - LOCATION
      ?AUTO_3872 - LOCATION
      ?AUTO_3873 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3871 ?AUTO_3874 ) ( IN-CITY ?AUTO_3869 ?AUTO_3874 ) ( not ( = ?AUTO_3869 ?AUTO_3871 ) ) ( TRUCK-AT ?AUTO_3875 ?AUTO_3870 ) ( IN-CITY ?AUTO_3870 ?AUTO_3874 ) ( not ( = ?AUTO_3871 ?AUTO_3870 ) ) ( not ( = ?AUTO_3869 ?AUTO_3870 ) ) ( AIRPORT ?AUTO_3872 ) ( AIRPORT ?AUTO_3871 ) ( AIRPLANE-AT ?AUTO_3873 ?AUTO_3872 ) ( not ( = ?AUTO_3872 ?AUTO_3871 ) ) ( not ( = ?AUTO_3869 ?AUTO_3872 ) ) ( not ( = ?AUTO_3870 ?AUTO_3872 ) ) ( OBJ-AT ?AUTO_3868 ?AUTO_3872 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3868 ?AUTO_3873 ?AUTO_3872 )
      ( DELIVER-PKG ?AUTO_3868 ?AUTO_3869 )
      ( DELIVER-PKG-VERIFY ?AUTO_3868 ?AUTO_3869 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3876 - OBJ
      ?AUTO_3877 - LOCATION
    )
    :vars
    (
      ?AUTO_3883 - LOCATION
      ?AUTO_3880 - CITY
      ?AUTO_3878 - TRUCK
      ?AUTO_3879 - LOCATION
      ?AUTO_3881 - LOCATION
      ?AUTO_3884 - LOCATION
      ?AUTO_3882 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3883 ?AUTO_3880 ) ( IN-CITY ?AUTO_3877 ?AUTO_3880 ) ( not ( = ?AUTO_3877 ?AUTO_3883 ) ) ( TRUCK-AT ?AUTO_3878 ?AUTO_3879 ) ( IN-CITY ?AUTO_3879 ?AUTO_3880 ) ( not ( = ?AUTO_3883 ?AUTO_3879 ) ) ( not ( = ?AUTO_3877 ?AUTO_3879 ) ) ( AIRPORT ?AUTO_3881 ) ( AIRPORT ?AUTO_3883 ) ( not ( = ?AUTO_3881 ?AUTO_3883 ) ) ( not ( = ?AUTO_3877 ?AUTO_3881 ) ) ( not ( = ?AUTO_3879 ?AUTO_3881 ) ) ( OBJ-AT ?AUTO_3876 ?AUTO_3881 ) ( AIRPORT ?AUTO_3884 ) ( AIRPLANE-AT ?AUTO_3882 ?AUTO_3884 ) ( not ( = ?AUTO_3884 ?AUTO_3881 ) ) ( not ( = ?AUTO_3877 ?AUTO_3884 ) ) ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( not ( = ?AUTO_3879 ?AUTO_3884 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3882 ?AUTO_3884 ?AUTO_3881 )
      ( DELIVER-PKG ?AUTO_3876 ?AUTO_3877 )
      ( DELIVER-PKG-VERIFY ?AUTO_3876 ?AUTO_3877 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3929 - OBJ
      ?AUTO_3930 - LOCATION
    )
    :vars
    (
      ?AUTO_3931 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3931 ?AUTO_3930 ) ( IN-TRUCK ?AUTO_3929 ?AUTO_3931 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3929 ?AUTO_3931 ?AUTO_3930 )
      ( DELIVER-PKG-VERIFY ?AUTO_3929 ?AUTO_3930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3948 - OBJ
      ?AUTO_3949 - LOCATION
    )
    :vars
    (
      ?AUTO_3952 - TRUCK
      ?AUTO_3950 - LOCATION
      ?AUTO_3951 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3952 ?AUTO_3950 ) ( IN-CITY ?AUTO_3950 ?AUTO_3951 ) ( IN-CITY ?AUTO_3949 ?AUTO_3951 ) ( not ( = ?AUTO_3949 ?AUTO_3950 ) ) ( OBJ-AT ?AUTO_3948 ?AUTO_3950 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3948 ?AUTO_3952 ?AUTO_3950 )
      ( DELIVER-PKG ?AUTO_3948 ?AUTO_3949 )
      ( DELIVER-PKG-VERIFY ?AUTO_3948 ?AUTO_3949 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3961 - OBJ
      ?AUTO_3962 - LOCATION
    )
    :vars
    (
      ?AUTO_3965 - TRUCK
      ?AUTO_3963 - LOCATION
      ?AUTO_3964 - CITY
      ?AUTO_3966 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3965 ?AUTO_3963 ) ( IN-CITY ?AUTO_3963 ?AUTO_3964 ) ( IN-CITY ?AUTO_3962 ?AUTO_3964 ) ( not ( = ?AUTO_3962 ?AUTO_3963 ) ) ( IN-AIRPLANE ?AUTO_3961 ?AUTO_3966 ) ( AIRPLANE-AT ?AUTO_3966 ?AUTO_3963 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3961 ?AUTO_3966 ?AUTO_3963 )
      ( DELIVER-PKG ?AUTO_3961 ?AUTO_3962 )
      ( DELIVER-PKG-VERIFY ?AUTO_3961 ?AUTO_3962 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3969 - OBJ
      ?AUTO_3970 - LOCATION
    )
    :vars
    (
      ?AUTO_3973 - TRUCK
      ?AUTO_3972 - LOCATION
      ?AUTO_3971 - CITY
      ?AUTO_3974 - AIRPLANE
      ?AUTO_3975 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3973 ?AUTO_3972 ) ( IN-CITY ?AUTO_3972 ?AUTO_3971 ) ( IN-CITY ?AUTO_3970 ?AUTO_3971 ) ( not ( = ?AUTO_3970 ?AUTO_3972 ) ) ( IN-AIRPLANE ?AUTO_3969 ?AUTO_3974 ) ( AIRPORT ?AUTO_3975 ) ( AIRPORT ?AUTO_3972 ) ( AIRPLANE-AT ?AUTO_3974 ?AUTO_3975 ) ( not ( = ?AUTO_3975 ?AUTO_3972 ) ) ( not ( = ?AUTO_3970 ?AUTO_3975 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3974 ?AUTO_3975 ?AUTO_3972 )
      ( DELIVER-PKG ?AUTO_3969 ?AUTO_3970 )
      ( DELIVER-PKG-VERIFY ?AUTO_3969 ?AUTO_3970 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3976 - OBJ
      ?AUTO_3977 - LOCATION
    )
    :vars
    (
      ?AUTO_3981 - TRUCK
      ?AUTO_3979 - LOCATION
      ?AUTO_3980 - CITY
      ?AUTO_3982 - LOCATION
      ?AUTO_3978 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3981 ?AUTO_3979 ) ( IN-CITY ?AUTO_3979 ?AUTO_3980 ) ( IN-CITY ?AUTO_3977 ?AUTO_3980 ) ( not ( = ?AUTO_3977 ?AUTO_3979 ) ) ( AIRPORT ?AUTO_3982 ) ( AIRPORT ?AUTO_3979 ) ( AIRPLANE-AT ?AUTO_3978 ?AUTO_3982 ) ( not ( = ?AUTO_3982 ?AUTO_3979 ) ) ( not ( = ?AUTO_3977 ?AUTO_3982 ) ) ( OBJ-AT ?AUTO_3976 ?AUTO_3982 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3976 ?AUTO_3978 ?AUTO_3982 )
      ( DELIVER-PKG ?AUTO_3976 ?AUTO_3977 )
      ( DELIVER-PKG-VERIFY ?AUTO_3976 ?AUTO_3977 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3983 - OBJ
      ?AUTO_3984 - LOCATION
    )
    :vars
    (
      ?AUTO_3986 - TRUCK
      ?AUTO_3989 - LOCATION
      ?AUTO_3985 - CITY
      ?AUTO_3987 - LOCATION
      ?AUTO_3988 - AIRPLANE
      ?AUTO_3990 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3986 ?AUTO_3989 ) ( IN-CITY ?AUTO_3989 ?AUTO_3985 ) ( IN-CITY ?AUTO_3984 ?AUTO_3985 ) ( not ( = ?AUTO_3984 ?AUTO_3989 ) ) ( AIRPORT ?AUTO_3987 ) ( AIRPORT ?AUTO_3989 ) ( AIRPLANE-AT ?AUTO_3988 ?AUTO_3987 ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) ( not ( = ?AUTO_3984 ?AUTO_3987 ) ) ( TRUCK-AT ?AUTO_3990 ?AUTO_3987 ) ( IN-TRUCK ?AUTO_3983 ?AUTO_3990 ) ( not ( = ?AUTO_3986 ?AUTO_3990 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3983 ?AUTO_3990 ?AUTO_3987 )
      ( DELIVER-PKG ?AUTO_3983 ?AUTO_3984 )
      ( DELIVER-PKG-VERIFY ?AUTO_3983 ?AUTO_3984 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3991 - OBJ
      ?AUTO_3992 - LOCATION
    )
    :vars
    (
      ?AUTO_3997 - TRUCK
      ?AUTO_3995 - LOCATION
      ?AUTO_3994 - CITY
      ?AUTO_3993 - LOCATION
      ?AUTO_3996 - AIRPLANE
      ?AUTO_3998 - TRUCK
      ?AUTO_3999 - LOCATION
      ?AUTO_4000 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3997 ?AUTO_3995 ) ( IN-CITY ?AUTO_3995 ?AUTO_3994 ) ( IN-CITY ?AUTO_3992 ?AUTO_3994 ) ( not ( = ?AUTO_3992 ?AUTO_3995 ) ) ( AIRPORT ?AUTO_3993 ) ( AIRPORT ?AUTO_3995 ) ( AIRPLANE-AT ?AUTO_3996 ?AUTO_3993 ) ( not ( = ?AUTO_3993 ?AUTO_3995 ) ) ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) ( IN-TRUCK ?AUTO_3991 ?AUTO_3998 ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( TRUCK-AT ?AUTO_3998 ?AUTO_3999 ) ( IN-CITY ?AUTO_3999 ?AUTO_4000 ) ( IN-CITY ?AUTO_3993 ?AUTO_4000 ) ( not ( = ?AUTO_3993 ?AUTO_3999 ) ) ( not ( = ?AUTO_3992 ?AUTO_3999 ) ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_3994 ?AUTO_4000 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3998 ?AUTO_3999 ?AUTO_3993 ?AUTO_4000 )
      ( DELIVER-PKG ?AUTO_3991 ?AUTO_3992 )
      ( DELIVER-PKG-VERIFY ?AUTO_3991 ?AUTO_3992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4043 - OBJ
      ?AUTO_4044 - LOCATION
    )
    :vars
    (
      ?AUTO_4046 - LOCATION
      ?AUTO_4050 - CITY
      ?AUTO_4051 - LOCATION
      ?AUTO_4048 - AIRPLANE
      ?AUTO_4047 - TRUCK
      ?AUTO_4049 - TRUCK
      ?AUTO_4045 - LOCATION
      ?AUTO_4052 - CITY
      ?AUTO_4053 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4046 ?AUTO_4050 ) ( IN-CITY ?AUTO_4044 ?AUTO_4050 ) ( not ( = ?AUTO_4044 ?AUTO_4046 ) ) ( AIRPORT ?AUTO_4051 ) ( AIRPORT ?AUTO_4046 ) ( AIRPLANE-AT ?AUTO_4048 ?AUTO_4051 ) ( not ( = ?AUTO_4051 ?AUTO_4046 ) ) ( not ( = ?AUTO_4044 ?AUTO_4051 ) ) ( IN-TRUCK ?AUTO_4043 ?AUTO_4047 ) ( not ( = ?AUTO_4049 ?AUTO_4047 ) ) ( TRUCK-AT ?AUTO_4047 ?AUTO_4045 ) ( IN-CITY ?AUTO_4045 ?AUTO_4052 ) ( IN-CITY ?AUTO_4051 ?AUTO_4052 ) ( not ( = ?AUTO_4051 ?AUTO_4045 ) ) ( not ( = ?AUTO_4044 ?AUTO_4045 ) ) ( not ( = ?AUTO_4046 ?AUTO_4045 ) ) ( not ( = ?AUTO_4050 ?AUTO_4052 ) ) ( TRUCK-AT ?AUTO_4049 ?AUTO_4053 ) ( IN-CITY ?AUTO_4053 ?AUTO_4050 ) ( not ( = ?AUTO_4046 ?AUTO_4053 ) ) ( not ( = ?AUTO_4044 ?AUTO_4053 ) ) ( not ( = ?AUTO_4051 ?AUTO_4053 ) ) ( not ( = ?AUTO_4045 ?AUTO_4053 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4049 ?AUTO_4053 ?AUTO_4046 ?AUTO_4050 )
      ( DELIVER-PKG ?AUTO_4043 ?AUTO_4044 )
      ( DELIVER-PKG-VERIFY ?AUTO_4043 ?AUTO_4044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4072 - OBJ
      ?AUTO_4073 - LOCATION
    )
    :vars
    (
      ?AUTO_4082 - LOCATION
      ?AUTO_4075 - CITY
      ?AUTO_4078 - LOCATION
      ?AUTO_4074 - AIRPLANE
      ?AUTO_4076 - TRUCK
      ?AUTO_4081 - TRUCK
      ?AUTO_4079 - LOCATION
      ?AUTO_4077 - CITY
      ?AUTO_4080 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4082 ?AUTO_4075 ) ( IN-CITY ?AUTO_4073 ?AUTO_4075 ) ( not ( = ?AUTO_4073 ?AUTO_4082 ) ) ( AIRPORT ?AUTO_4078 ) ( AIRPORT ?AUTO_4082 ) ( AIRPLANE-AT ?AUTO_4074 ?AUTO_4078 ) ( not ( = ?AUTO_4078 ?AUTO_4082 ) ) ( not ( = ?AUTO_4073 ?AUTO_4078 ) ) ( not ( = ?AUTO_4076 ?AUTO_4081 ) ) ( TRUCK-AT ?AUTO_4081 ?AUTO_4079 ) ( IN-CITY ?AUTO_4079 ?AUTO_4077 ) ( IN-CITY ?AUTO_4078 ?AUTO_4077 ) ( not ( = ?AUTO_4078 ?AUTO_4079 ) ) ( not ( = ?AUTO_4073 ?AUTO_4079 ) ) ( not ( = ?AUTO_4082 ?AUTO_4079 ) ) ( not ( = ?AUTO_4075 ?AUTO_4077 ) ) ( TRUCK-AT ?AUTO_4076 ?AUTO_4080 ) ( IN-CITY ?AUTO_4080 ?AUTO_4075 ) ( not ( = ?AUTO_4082 ?AUTO_4080 ) ) ( not ( = ?AUTO_4073 ?AUTO_4080 ) ) ( not ( = ?AUTO_4078 ?AUTO_4080 ) ) ( not ( = ?AUTO_4079 ?AUTO_4080 ) ) ( OBJ-AT ?AUTO_4072 ?AUTO_4079 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4072 ?AUTO_4081 ?AUTO_4079 )
      ( DELIVER-PKG ?AUTO_4072 ?AUTO_4073 )
      ( DELIVER-PKG-VERIFY ?AUTO_4072 ?AUTO_4073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4085 - OBJ
      ?AUTO_4086 - LOCATION
    )
    :vars
    (
      ?AUTO_4087 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4087 ?AUTO_4086 ) ( IN-TRUCK ?AUTO_4085 ?AUTO_4087 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4085 ?AUTO_4087 ?AUTO_4086 )
      ( DELIVER-PKG-VERIFY ?AUTO_4085 ?AUTO_4086 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4102 - OBJ
      ?AUTO_4103 - LOCATION
    )
    :vars
    (
      ?AUTO_4106 - TRUCK
      ?AUTO_4104 - LOCATION
      ?AUTO_4105 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4106 ?AUTO_4104 ) ( IN-CITY ?AUTO_4104 ?AUTO_4105 ) ( IN-CITY ?AUTO_4103 ?AUTO_4105 ) ( not ( = ?AUTO_4103 ?AUTO_4104 ) ) ( OBJ-AT ?AUTO_4102 ?AUTO_4104 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4102 ?AUTO_4106 ?AUTO_4104 )
      ( DELIVER-PKG ?AUTO_4102 ?AUTO_4103 )
      ( DELIVER-PKG-VERIFY ?AUTO_4102 ?AUTO_4103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4115 - OBJ
      ?AUTO_4116 - LOCATION
    )
    :vars
    (
      ?AUTO_4119 - TRUCK
      ?AUTO_4117 - LOCATION
      ?AUTO_4118 - CITY
      ?AUTO_4120 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4119 ?AUTO_4117 ) ( IN-CITY ?AUTO_4117 ?AUTO_4118 ) ( IN-CITY ?AUTO_4116 ?AUTO_4118 ) ( not ( = ?AUTO_4116 ?AUTO_4117 ) ) ( IN-AIRPLANE ?AUTO_4115 ?AUTO_4120 ) ( AIRPLANE-AT ?AUTO_4120 ?AUTO_4117 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4115 ?AUTO_4120 ?AUTO_4117 )
      ( DELIVER-PKG ?AUTO_4115 ?AUTO_4116 )
      ( DELIVER-PKG-VERIFY ?AUTO_4115 ?AUTO_4116 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4121 - OBJ
      ?AUTO_4122 - LOCATION
    )
    :vars
    (
      ?AUTO_4124 - TRUCK
      ?AUTO_4123 - LOCATION
      ?AUTO_4125 - CITY
      ?AUTO_4126 - AIRPLANE
      ?AUTO_4127 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4124 ?AUTO_4123 ) ( IN-CITY ?AUTO_4123 ?AUTO_4125 ) ( IN-CITY ?AUTO_4122 ?AUTO_4125 ) ( not ( = ?AUTO_4122 ?AUTO_4123 ) ) ( IN-AIRPLANE ?AUTO_4121 ?AUTO_4126 ) ( AIRPORT ?AUTO_4127 ) ( AIRPORT ?AUTO_4123 ) ( AIRPLANE-AT ?AUTO_4126 ?AUTO_4127 ) ( not ( = ?AUTO_4127 ?AUTO_4123 ) ) ( not ( = ?AUTO_4122 ?AUTO_4127 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4126 ?AUTO_4127 ?AUTO_4123 )
      ( DELIVER-PKG ?AUTO_4121 ?AUTO_4122 )
      ( DELIVER-PKG-VERIFY ?AUTO_4121 ?AUTO_4122 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4130 - OBJ
      ?AUTO_4131 - LOCATION
    )
    :vars
    (
      ?AUTO_4136 - TRUCK
      ?AUTO_4134 - LOCATION
      ?AUTO_4135 - CITY
      ?AUTO_4133 - LOCATION
      ?AUTO_4132 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4136 ?AUTO_4134 ) ( IN-CITY ?AUTO_4134 ?AUTO_4135 ) ( IN-CITY ?AUTO_4131 ?AUTO_4135 ) ( not ( = ?AUTO_4131 ?AUTO_4134 ) ) ( AIRPORT ?AUTO_4133 ) ( AIRPORT ?AUTO_4134 ) ( AIRPLANE-AT ?AUTO_4132 ?AUTO_4133 ) ( not ( = ?AUTO_4133 ?AUTO_4134 ) ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( OBJ-AT ?AUTO_4130 ?AUTO_4133 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4130 ?AUTO_4132 ?AUTO_4133 )
      ( DELIVER-PKG ?AUTO_4130 ?AUTO_4131 )
      ( DELIVER-PKG-VERIFY ?AUTO_4130 ?AUTO_4131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4137 - OBJ
      ?AUTO_4138 - LOCATION
    )
    :vars
    (
      ?AUTO_4142 - TRUCK
      ?AUTO_4143 - LOCATION
      ?AUTO_4139 - CITY
      ?AUTO_4140 - LOCATION
      ?AUTO_4144 - LOCATION
      ?AUTO_4141 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4142 ?AUTO_4143 ) ( IN-CITY ?AUTO_4143 ?AUTO_4139 ) ( IN-CITY ?AUTO_4138 ?AUTO_4139 ) ( not ( = ?AUTO_4138 ?AUTO_4143 ) ) ( AIRPORT ?AUTO_4140 ) ( AIRPORT ?AUTO_4143 ) ( not ( = ?AUTO_4140 ?AUTO_4143 ) ) ( not ( = ?AUTO_4138 ?AUTO_4140 ) ) ( OBJ-AT ?AUTO_4137 ?AUTO_4140 ) ( AIRPORT ?AUTO_4144 ) ( AIRPLANE-AT ?AUTO_4141 ?AUTO_4144 ) ( not ( = ?AUTO_4144 ?AUTO_4140 ) ) ( not ( = ?AUTO_4138 ?AUTO_4144 ) ) ( not ( = ?AUTO_4143 ?AUTO_4144 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4141 ?AUTO_4144 ?AUTO_4140 )
      ( DELIVER-PKG ?AUTO_4137 ?AUTO_4138 )
      ( DELIVER-PKG-VERIFY ?AUTO_4137 ?AUTO_4138 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4191 - OBJ
      ?AUTO_4192 - LOCATION
    )
    :vars
    (
      ?AUTO_4193 - LOCATION
      ?AUTO_4197 - CITY
      ?AUTO_4199 - TRUCK
      ?AUTO_4195 - LOCATION
      ?AUTO_4196 - LOCATION
      ?AUTO_4198 - LOCATION
      ?AUTO_4194 - AIRPLANE
      ?AUTO_4200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4193 ?AUTO_4197 ) ( IN-CITY ?AUTO_4192 ?AUTO_4197 ) ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( TRUCK-AT ?AUTO_4199 ?AUTO_4195 ) ( IN-CITY ?AUTO_4195 ?AUTO_4197 ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( not ( = ?AUTO_4192 ?AUTO_4195 ) ) ( AIRPORT ?AUTO_4196 ) ( AIRPORT ?AUTO_4193 ) ( not ( = ?AUTO_4196 ?AUTO_4193 ) ) ( not ( = ?AUTO_4192 ?AUTO_4196 ) ) ( not ( = ?AUTO_4195 ?AUTO_4196 ) ) ( AIRPORT ?AUTO_4198 ) ( AIRPLANE-AT ?AUTO_4194 ?AUTO_4198 ) ( not ( = ?AUTO_4198 ?AUTO_4196 ) ) ( not ( = ?AUTO_4192 ?AUTO_4198 ) ) ( not ( = ?AUTO_4193 ?AUTO_4198 ) ) ( not ( = ?AUTO_4195 ?AUTO_4198 ) ) ( TRUCK-AT ?AUTO_4200 ?AUTO_4196 ) ( IN-TRUCK ?AUTO_4191 ?AUTO_4200 ) ( not ( = ?AUTO_4199 ?AUTO_4200 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4191 ?AUTO_4200 ?AUTO_4196 )
      ( DELIVER-PKG ?AUTO_4191 ?AUTO_4192 )
      ( DELIVER-PKG-VERIFY ?AUTO_4191 ?AUTO_4192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4201 - OBJ
      ?AUTO_4202 - LOCATION
    )
    :vars
    (
      ?AUTO_4210 - LOCATION
      ?AUTO_4205 - CITY
      ?AUTO_4209 - TRUCK
      ?AUTO_4208 - LOCATION
      ?AUTO_4207 - LOCATION
      ?AUTO_4203 - LOCATION
      ?AUTO_4206 - AIRPLANE
      ?AUTO_4204 - TRUCK
      ?AUTO_4211 - LOCATION
      ?AUTO_4212 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4210 ?AUTO_4205 ) ( IN-CITY ?AUTO_4202 ?AUTO_4205 ) ( not ( = ?AUTO_4202 ?AUTO_4210 ) ) ( TRUCK-AT ?AUTO_4209 ?AUTO_4208 ) ( IN-CITY ?AUTO_4208 ?AUTO_4205 ) ( not ( = ?AUTO_4210 ?AUTO_4208 ) ) ( not ( = ?AUTO_4202 ?AUTO_4208 ) ) ( AIRPORT ?AUTO_4207 ) ( AIRPORT ?AUTO_4210 ) ( not ( = ?AUTO_4207 ?AUTO_4210 ) ) ( not ( = ?AUTO_4202 ?AUTO_4207 ) ) ( not ( = ?AUTO_4208 ?AUTO_4207 ) ) ( AIRPORT ?AUTO_4203 ) ( AIRPLANE-AT ?AUTO_4206 ?AUTO_4203 ) ( not ( = ?AUTO_4203 ?AUTO_4207 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( not ( = ?AUTO_4210 ?AUTO_4203 ) ) ( not ( = ?AUTO_4208 ?AUTO_4203 ) ) ( IN-TRUCK ?AUTO_4201 ?AUTO_4204 ) ( not ( = ?AUTO_4209 ?AUTO_4204 ) ) ( TRUCK-AT ?AUTO_4204 ?AUTO_4211 ) ( IN-CITY ?AUTO_4211 ?AUTO_4212 ) ( IN-CITY ?AUTO_4207 ?AUTO_4212 ) ( not ( = ?AUTO_4207 ?AUTO_4211 ) ) ( not ( = ?AUTO_4202 ?AUTO_4211 ) ) ( not ( = ?AUTO_4210 ?AUTO_4211 ) ) ( not ( = ?AUTO_4205 ?AUTO_4212 ) ) ( not ( = ?AUTO_4208 ?AUTO_4211 ) ) ( not ( = ?AUTO_4203 ?AUTO_4211 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4204 ?AUTO_4211 ?AUTO_4207 ?AUTO_4212 )
      ( DELIVER-PKG ?AUTO_4201 ?AUTO_4202 )
      ( DELIVER-PKG-VERIFY ?AUTO_4201 ?AUTO_4202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4215 - OBJ
      ?AUTO_4216 - LOCATION
    )
    :vars
    (
      ?AUTO_4220 - LOCATION
      ?AUTO_4217 - CITY
      ?AUTO_4218 - TRUCK
      ?AUTO_4223 - LOCATION
      ?AUTO_4226 - LOCATION
      ?AUTO_4225 - LOCATION
      ?AUTO_4219 - AIRPLANE
      ?AUTO_4222 - TRUCK
      ?AUTO_4224 - LOCATION
      ?AUTO_4221 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4220 ?AUTO_4217 ) ( IN-CITY ?AUTO_4216 ?AUTO_4217 ) ( not ( = ?AUTO_4216 ?AUTO_4220 ) ) ( TRUCK-AT ?AUTO_4218 ?AUTO_4223 ) ( IN-CITY ?AUTO_4223 ?AUTO_4217 ) ( not ( = ?AUTO_4220 ?AUTO_4223 ) ) ( not ( = ?AUTO_4216 ?AUTO_4223 ) ) ( AIRPORT ?AUTO_4226 ) ( AIRPORT ?AUTO_4220 ) ( not ( = ?AUTO_4226 ?AUTO_4220 ) ) ( not ( = ?AUTO_4216 ?AUTO_4226 ) ) ( not ( = ?AUTO_4223 ?AUTO_4226 ) ) ( AIRPORT ?AUTO_4225 ) ( AIRPLANE-AT ?AUTO_4219 ?AUTO_4225 ) ( not ( = ?AUTO_4225 ?AUTO_4226 ) ) ( not ( = ?AUTO_4216 ?AUTO_4225 ) ) ( not ( = ?AUTO_4220 ?AUTO_4225 ) ) ( not ( = ?AUTO_4223 ?AUTO_4225 ) ) ( not ( = ?AUTO_4218 ?AUTO_4222 ) ) ( TRUCK-AT ?AUTO_4222 ?AUTO_4224 ) ( IN-CITY ?AUTO_4224 ?AUTO_4221 ) ( IN-CITY ?AUTO_4226 ?AUTO_4221 ) ( not ( = ?AUTO_4226 ?AUTO_4224 ) ) ( not ( = ?AUTO_4216 ?AUTO_4224 ) ) ( not ( = ?AUTO_4220 ?AUTO_4224 ) ) ( not ( = ?AUTO_4217 ?AUTO_4221 ) ) ( not ( = ?AUTO_4223 ?AUTO_4224 ) ) ( not ( = ?AUTO_4225 ?AUTO_4224 ) ) ( OBJ-AT ?AUTO_4215 ?AUTO_4224 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4215 ?AUTO_4222 ?AUTO_4224 )
      ( DELIVER-PKG ?AUTO_4215 ?AUTO_4216 )
      ( DELIVER-PKG-VERIFY ?AUTO_4215 ?AUTO_4216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4229 - OBJ
      ?AUTO_4230 - LOCATION
    )
    :vars
    (
      ?AUTO_4234 - LOCATION
      ?AUTO_4239 - CITY
      ?AUTO_4237 - TRUCK
      ?AUTO_4232 - LOCATION
      ?AUTO_4238 - LOCATION
      ?AUTO_4236 - LOCATION
      ?AUTO_4233 - AIRPLANE
      ?AUTO_4240 - TRUCK
      ?AUTO_4231 - LOCATION
      ?AUTO_4235 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4234 ?AUTO_4239 ) ( IN-CITY ?AUTO_4230 ?AUTO_4239 ) ( not ( = ?AUTO_4230 ?AUTO_4234 ) ) ( TRUCK-AT ?AUTO_4237 ?AUTO_4232 ) ( IN-CITY ?AUTO_4232 ?AUTO_4239 ) ( not ( = ?AUTO_4234 ?AUTO_4232 ) ) ( not ( = ?AUTO_4230 ?AUTO_4232 ) ) ( AIRPORT ?AUTO_4238 ) ( AIRPORT ?AUTO_4234 ) ( not ( = ?AUTO_4238 ?AUTO_4234 ) ) ( not ( = ?AUTO_4230 ?AUTO_4238 ) ) ( not ( = ?AUTO_4232 ?AUTO_4238 ) ) ( AIRPORT ?AUTO_4236 ) ( AIRPLANE-AT ?AUTO_4233 ?AUTO_4236 ) ( not ( = ?AUTO_4236 ?AUTO_4238 ) ) ( not ( = ?AUTO_4230 ?AUTO_4236 ) ) ( not ( = ?AUTO_4234 ?AUTO_4236 ) ) ( not ( = ?AUTO_4232 ?AUTO_4236 ) ) ( not ( = ?AUTO_4237 ?AUTO_4240 ) ) ( IN-CITY ?AUTO_4231 ?AUTO_4235 ) ( IN-CITY ?AUTO_4238 ?AUTO_4235 ) ( not ( = ?AUTO_4238 ?AUTO_4231 ) ) ( not ( = ?AUTO_4230 ?AUTO_4231 ) ) ( not ( = ?AUTO_4234 ?AUTO_4231 ) ) ( not ( = ?AUTO_4239 ?AUTO_4235 ) ) ( not ( = ?AUTO_4232 ?AUTO_4231 ) ) ( not ( = ?AUTO_4236 ?AUTO_4231 ) ) ( OBJ-AT ?AUTO_4229 ?AUTO_4231 ) ( TRUCK-AT ?AUTO_4240 ?AUTO_4236 ) ( IN-CITY ?AUTO_4236 ?AUTO_4235 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4240 ?AUTO_4236 ?AUTO_4231 ?AUTO_4235 )
      ( DELIVER-PKG ?AUTO_4229 ?AUTO_4230 )
      ( DELIVER-PKG-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4255 - OBJ
      ?AUTO_4256 - LOCATION
    )
    :vars
    (
      ?AUTO_4257 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4257 ?AUTO_4256 ) ( IN-TRUCK ?AUTO_4255 ?AUTO_4257 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4255 ?AUTO_4257 ?AUTO_4256 )
      ( DELIVER-PKG-VERIFY ?AUTO_4255 ?AUTO_4256 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4270 - OBJ
      ?AUTO_4271 - LOCATION
    )
    :vars
    (
      ?AUTO_4272 - TRUCK
      ?AUTO_4273 - LOCATION
      ?AUTO_4274 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4272 ?AUTO_4273 ) ( IN-CITY ?AUTO_4273 ?AUTO_4274 ) ( IN-CITY ?AUTO_4271 ?AUTO_4274 ) ( not ( = ?AUTO_4271 ?AUTO_4273 ) ) ( OBJ-AT ?AUTO_4270 ?AUTO_4273 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4270 ?AUTO_4272 ?AUTO_4273 )
      ( DELIVER-PKG ?AUTO_4270 ?AUTO_4271 )
      ( DELIVER-PKG-VERIFY ?AUTO_4270 ?AUTO_4271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4303 - OBJ
      ?AUTO_4304 - LOCATION
    )
    :vars
    (
      ?AUTO_4308 - LOCATION
      ?AUTO_4305 - CITY
      ?AUTO_4307 - TRUCK
      ?AUTO_4306 - LOCATION
      ?AUTO_4309 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4308 ?AUTO_4305 ) ( IN-CITY ?AUTO_4304 ?AUTO_4305 ) ( not ( = ?AUTO_4304 ?AUTO_4308 ) ) ( TRUCK-AT ?AUTO_4307 ?AUTO_4306 ) ( IN-CITY ?AUTO_4306 ?AUTO_4305 ) ( not ( = ?AUTO_4308 ?AUTO_4306 ) ) ( not ( = ?AUTO_4304 ?AUTO_4306 ) ) ( IN-AIRPLANE ?AUTO_4303 ?AUTO_4309 ) ( AIRPLANE-AT ?AUTO_4309 ?AUTO_4308 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4303 ?AUTO_4309 ?AUTO_4308 )
      ( DELIVER-PKG ?AUTO_4303 ?AUTO_4304 )
      ( DELIVER-PKG-VERIFY ?AUTO_4303 ?AUTO_4304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4324 - OBJ
      ?AUTO_4325 - LOCATION
    )
    :vars
    (
      ?AUTO_4326 - LOCATION
      ?AUTO_4331 - CITY
      ?AUTO_4330 - TRUCK
      ?AUTO_4327 - LOCATION
      ?AUTO_4329 - LOCATION
      ?AUTO_4328 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4326 ?AUTO_4331 ) ( IN-CITY ?AUTO_4325 ?AUTO_4331 ) ( not ( = ?AUTO_4325 ?AUTO_4326 ) ) ( TRUCK-AT ?AUTO_4330 ?AUTO_4327 ) ( IN-CITY ?AUTO_4327 ?AUTO_4331 ) ( not ( = ?AUTO_4326 ?AUTO_4327 ) ) ( not ( = ?AUTO_4325 ?AUTO_4327 ) ) ( AIRPORT ?AUTO_4329 ) ( AIRPORT ?AUTO_4326 ) ( AIRPLANE-AT ?AUTO_4328 ?AUTO_4329 ) ( not ( = ?AUTO_4329 ?AUTO_4326 ) ) ( not ( = ?AUTO_4325 ?AUTO_4329 ) ) ( not ( = ?AUTO_4327 ?AUTO_4329 ) ) ( OBJ-AT ?AUTO_4324 ?AUTO_4329 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4324 ?AUTO_4328 ?AUTO_4329 )
      ( DELIVER-PKG ?AUTO_4324 ?AUTO_4325 )
      ( DELIVER-PKG-VERIFY ?AUTO_4324 ?AUTO_4325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4336 - OBJ
      ?AUTO_4337 - LOCATION
    )
    :vars
    (
      ?AUTO_4339 - LOCATION
      ?AUTO_4340 - CITY
      ?AUTO_4338 - TRUCK
      ?AUTO_4341 - LOCATION
      ?AUTO_4344 - LOCATION
      ?AUTO_4342 - LOCATION
      ?AUTO_4343 - AIRPLANE
      ?AUTO_4345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4339 ?AUTO_4340 ) ( IN-CITY ?AUTO_4337 ?AUTO_4340 ) ( not ( = ?AUTO_4337 ?AUTO_4339 ) ) ( TRUCK-AT ?AUTO_4338 ?AUTO_4341 ) ( IN-CITY ?AUTO_4341 ?AUTO_4340 ) ( not ( = ?AUTO_4339 ?AUTO_4341 ) ) ( not ( = ?AUTO_4337 ?AUTO_4341 ) ) ( AIRPORT ?AUTO_4344 ) ( AIRPORT ?AUTO_4339 ) ( not ( = ?AUTO_4344 ?AUTO_4339 ) ) ( not ( = ?AUTO_4337 ?AUTO_4344 ) ) ( not ( = ?AUTO_4341 ?AUTO_4344 ) ) ( AIRPORT ?AUTO_4342 ) ( AIRPLANE-AT ?AUTO_4343 ?AUTO_4342 ) ( not ( = ?AUTO_4342 ?AUTO_4344 ) ) ( not ( = ?AUTO_4337 ?AUTO_4342 ) ) ( not ( = ?AUTO_4339 ?AUTO_4342 ) ) ( not ( = ?AUTO_4341 ?AUTO_4342 ) ) ( TRUCK-AT ?AUTO_4345 ?AUTO_4344 ) ( IN-TRUCK ?AUTO_4336 ?AUTO_4345 ) ( not ( = ?AUTO_4338 ?AUTO_4345 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4336 ?AUTO_4345 ?AUTO_4344 )
      ( DELIVER-PKG ?AUTO_4336 ?AUTO_4337 )
      ( DELIVER-PKG-VERIFY ?AUTO_4336 ?AUTO_4337 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4346 - OBJ
      ?AUTO_4347 - LOCATION
    )
    :vars
    (
      ?AUTO_4352 - LOCATION
      ?AUTO_4354 - CITY
      ?AUTO_4348 - TRUCK
      ?AUTO_4355 - LOCATION
      ?AUTO_4351 - LOCATION
      ?AUTO_4349 - LOCATION
      ?AUTO_4350 - AIRPLANE
      ?AUTO_4353 - TRUCK
      ?AUTO_4356 - LOCATION
      ?AUTO_4357 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4352 ?AUTO_4354 ) ( IN-CITY ?AUTO_4347 ?AUTO_4354 ) ( not ( = ?AUTO_4347 ?AUTO_4352 ) ) ( TRUCK-AT ?AUTO_4348 ?AUTO_4355 ) ( IN-CITY ?AUTO_4355 ?AUTO_4354 ) ( not ( = ?AUTO_4352 ?AUTO_4355 ) ) ( not ( = ?AUTO_4347 ?AUTO_4355 ) ) ( AIRPORT ?AUTO_4351 ) ( AIRPORT ?AUTO_4352 ) ( not ( = ?AUTO_4351 ?AUTO_4352 ) ) ( not ( = ?AUTO_4347 ?AUTO_4351 ) ) ( not ( = ?AUTO_4355 ?AUTO_4351 ) ) ( AIRPORT ?AUTO_4349 ) ( AIRPLANE-AT ?AUTO_4350 ?AUTO_4349 ) ( not ( = ?AUTO_4349 ?AUTO_4351 ) ) ( not ( = ?AUTO_4347 ?AUTO_4349 ) ) ( not ( = ?AUTO_4352 ?AUTO_4349 ) ) ( not ( = ?AUTO_4355 ?AUTO_4349 ) ) ( IN-TRUCK ?AUTO_4346 ?AUTO_4353 ) ( not ( = ?AUTO_4348 ?AUTO_4353 ) ) ( TRUCK-AT ?AUTO_4353 ?AUTO_4356 ) ( IN-CITY ?AUTO_4356 ?AUTO_4357 ) ( IN-CITY ?AUTO_4351 ?AUTO_4357 ) ( not ( = ?AUTO_4351 ?AUTO_4356 ) ) ( not ( = ?AUTO_4347 ?AUTO_4356 ) ) ( not ( = ?AUTO_4352 ?AUTO_4356 ) ) ( not ( = ?AUTO_4354 ?AUTO_4357 ) ) ( not ( = ?AUTO_4355 ?AUTO_4356 ) ) ( not ( = ?AUTO_4349 ?AUTO_4356 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4353 ?AUTO_4356 ?AUTO_4351 ?AUTO_4357 )
      ( DELIVER-PKG ?AUTO_4346 ?AUTO_4347 )
      ( DELIVER-PKG-VERIFY ?AUTO_4346 ?AUTO_4347 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4360 - OBJ
      ?AUTO_4361 - LOCATION
    )
    :vars
    (
      ?AUTO_4362 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4360 ?AUTO_4362 ) ( AIRPLANE-AT ?AUTO_4362 ?AUTO_4361 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4360 ?AUTO_4362 ?AUTO_4361 )
      ( DELIVER-PKG-VERIFY ?AUTO_4360 ?AUTO_4361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4363 - OBJ
      ?AUTO_4364 - LOCATION
    )
    :vars
    (
      ?AUTO_4365 - AIRPLANE
      ?AUTO_4366 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4363 ?AUTO_4365 ) ( AIRPORT ?AUTO_4366 ) ( AIRPORT ?AUTO_4364 ) ( AIRPLANE-AT ?AUTO_4365 ?AUTO_4366 ) ( not ( = ?AUTO_4366 ?AUTO_4364 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4365 ?AUTO_4366 ?AUTO_4364 )
      ( DELIVER-PKG ?AUTO_4363 ?AUTO_4364 )
      ( DELIVER-PKG-VERIFY ?AUTO_4363 ?AUTO_4364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4367 - OBJ
      ?AUTO_4368 - LOCATION
    )
    :vars
    (
      ?AUTO_4370 - LOCATION
      ?AUTO_4369 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4370 ) ( AIRPORT ?AUTO_4368 ) ( AIRPLANE-AT ?AUTO_4369 ?AUTO_4370 ) ( not ( = ?AUTO_4370 ?AUTO_4368 ) ) ( OBJ-AT ?AUTO_4367 ?AUTO_4370 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4367 ?AUTO_4369 ?AUTO_4370 )
      ( DELIVER-PKG ?AUTO_4367 ?AUTO_4368 )
      ( DELIVER-PKG-VERIFY ?AUTO_4367 ?AUTO_4368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4371 - OBJ
      ?AUTO_4372 - LOCATION
    )
    :vars
    (
      ?AUTO_4374 - LOCATION
      ?AUTO_4373 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4374 ) ( AIRPORT ?AUTO_4372 ) ( not ( = ?AUTO_4374 ?AUTO_4372 ) ) ( OBJ-AT ?AUTO_4371 ?AUTO_4374 ) ( AIRPLANE-AT ?AUTO_4373 ?AUTO_4372 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4373 ?AUTO_4372 ?AUTO_4374 )
      ( DELIVER-PKG ?AUTO_4371 ?AUTO_4372 )
      ( DELIVER-PKG-VERIFY ?AUTO_4371 ?AUTO_4372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4379 - OBJ
      ?AUTO_4380 - LOCATION
    )
    :vars
    (
      ?AUTO_4381 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4381 ?AUTO_4380 ) ( IN-TRUCK ?AUTO_4379 ?AUTO_4381 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4379 ?AUTO_4381 ?AUTO_4380 )
      ( DELIVER-PKG-VERIFY ?AUTO_4379 ?AUTO_4380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4382 - OBJ
      ?AUTO_4383 - LOCATION
    )
    :vars
    (
      ?AUTO_4384 - TRUCK
      ?AUTO_4385 - LOCATION
      ?AUTO_4386 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4382 ?AUTO_4384 ) ( TRUCK-AT ?AUTO_4384 ?AUTO_4385 ) ( IN-CITY ?AUTO_4385 ?AUTO_4386 ) ( IN-CITY ?AUTO_4383 ?AUTO_4386 ) ( not ( = ?AUTO_4383 ?AUTO_4385 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4384 ?AUTO_4385 ?AUTO_4383 ?AUTO_4386 )
      ( DELIVER-PKG ?AUTO_4382 ?AUTO_4383 )
      ( DELIVER-PKG-VERIFY ?AUTO_4382 ?AUTO_4383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4389 - OBJ
      ?AUTO_4390 - LOCATION
    )
    :vars
    (
      ?AUTO_4391 - TRUCK
      ?AUTO_4393 - LOCATION
      ?AUTO_4392 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4391 ?AUTO_4393 ) ( IN-CITY ?AUTO_4393 ?AUTO_4392 ) ( IN-CITY ?AUTO_4390 ?AUTO_4392 ) ( not ( = ?AUTO_4390 ?AUTO_4393 ) ) ( OBJ-AT ?AUTO_4389 ?AUTO_4393 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4389 ?AUTO_4391 ?AUTO_4393 )
      ( DELIVER-PKG ?AUTO_4389 ?AUTO_4390 )
      ( DELIVER-PKG-VERIFY ?AUTO_4389 ?AUTO_4390 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4394 - OBJ
      ?AUTO_4395 - LOCATION
    )
    :vars
    (
      ?AUTO_4397 - LOCATION
      ?AUTO_4398 - CITY
      ?AUTO_4396 - TRUCK
      ?AUTO_4399 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4397 ?AUTO_4398 ) ( IN-CITY ?AUTO_4395 ?AUTO_4398 ) ( not ( = ?AUTO_4395 ?AUTO_4397 ) ) ( OBJ-AT ?AUTO_4394 ?AUTO_4397 ) ( TRUCK-AT ?AUTO_4396 ?AUTO_4399 ) ( IN-CITY ?AUTO_4399 ?AUTO_4398 ) ( not ( = ?AUTO_4397 ?AUTO_4399 ) ) ( not ( = ?AUTO_4395 ?AUTO_4399 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4396 ?AUTO_4399 ?AUTO_4397 ?AUTO_4398 )
      ( DELIVER-PKG ?AUTO_4394 ?AUTO_4395 )
      ( DELIVER-PKG-VERIFY ?AUTO_4394 ?AUTO_4395 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4412 - OBJ
      ?AUTO_4413 - LOCATION
    )
    :vars
    (
      ?AUTO_4414 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4414 ?AUTO_4413 ) ( IN-TRUCK ?AUTO_4412 ?AUTO_4414 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4412 ?AUTO_4414 ?AUTO_4413 )
      ( DELIVER-PKG-VERIFY ?AUTO_4412 ?AUTO_4413 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4421 - OBJ
      ?AUTO_4422 - LOCATION
    )
    :vars
    (
      ?AUTO_4424 - TRUCK
      ?AUTO_4423 - LOCATION
      ?AUTO_4425 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4424 ?AUTO_4423 ) ( IN-CITY ?AUTO_4423 ?AUTO_4425 ) ( IN-CITY ?AUTO_4422 ?AUTO_4425 ) ( not ( = ?AUTO_4422 ?AUTO_4423 ) ) ( OBJ-AT ?AUTO_4421 ?AUTO_4423 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4421 ?AUTO_4424 ?AUTO_4423 )
      ( DELIVER-PKG ?AUTO_4421 ?AUTO_4422 )
      ( DELIVER-PKG-VERIFY ?AUTO_4421 ?AUTO_4422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4442 - OBJ
      ?AUTO_4443 - LOCATION
    )
    :vars
    (
      ?AUTO_4444 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4444 ?AUTO_4443 ) ( IN-TRUCK ?AUTO_4442 ?AUTO_4444 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4442 ?AUTO_4444 ?AUTO_4443 )
      ( DELIVER-PKG-VERIFY ?AUTO_4442 ?AUTO_4443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4445 - OBJ
      ?AUTO_4446 - LOCATION
    )
    :vars
    (
      ?AUTO_4447 - TRUCK
      ?AUTO_4448 - LOCATION
      ?AUTO_4449 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4445 ?AUTO_4447 ) ( TRUCK-AT ?AUTO_4447 ?AUTO_4448 ) ( IN-CITY ?AUTO_4448 ?AUTO_4449 ) ( IN-CITY ?AUTO_4446 ?AUTO_4449 ) ( not ( = ?AUTO_4446 ?AUTO_4448 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4447 ?AUTO_4448 ?AUTO_4446 ?AUTO_4449 )
      ( DELIVER-PKG ?AUTO_4445 ?AUTO_4446 )
      ( DELIVER-PKG-VERIFY ?AUTO_4445 ?AUTO_4446 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4452 - OBJ
      ?AUTO_4453 - LOCATION
    )
    :vars
    (
      ?AUTO_4454 - TRUCK
      ?AUTO_4456 - LOCATION
      ?AUTO_4455 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4454 ?AUTO_4456 ) ( IN-CITY ?AUTO_4456 ?AUTO_4455 ) ( IN-CITY ?AUTO_4453 ?AUTO_4455 ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) ( OBJ-AT ?AUTO_4452 ?AUTO_4456 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4452 ?AUTO_4454 ?AUTO_4456 )
      ( DELIVER-PKG ?AUTO_4452 ?AUTO_4453 )
      ( DELIVER-PKG-VERIFY ?AUTO_4452 ?AUTO_4453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4459 - OBJ
      ?AUTO_4460 - LOCATION
    )
    :vars
    (
      ?AUTO_4462 - LOCATION
      ?AUTO_4463 - CITY
      ?AUTO_4461 - TRUCK
      ?AUTO_4464 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4462 ?AUTO_4463 ) ( IN-CITY ?AUTO_4460 ?AUTO_4463 ) ( not ( = ?AUTO_4460 ?AUTO_4462 ) ) ( OBJ-AT ?AUTO_4459 ?AUTO_4462 ) ( TRUCK-AT ?AUTO_4461 ?AUTO_4464 ) ( IN-CITY ?AUTO_4464 ?AUTO_4463 ) ( not ( = ?AUTO_4462 ?AUTO_4464 ) ) ( not ( = ?AUTO_4460 ?AUTO_4464 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4461 ?AUTO_4464 ?AUTO_4462 ?AUTO_4463 )
      ( DELIVER-PKG ?AUTO_4459 ?AUTO_4460 )
      ( DELIVER-PKG-VERIFY ?AUTO_4459 ?AUTO_4460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4469 - OBJ
      ?AUTO_4470 - LOCATION
    )
    :vars
    (
      ?AUTO_4472 - LOCATION
      ?AUTO_4474 - CITY
      ?AUTO_4473 - LOCATION
      ?AUTO_4471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4472 ?AUTO_4474 ) ( IN-CITY ?AUTO_4470 ?AUTO_4474 ) ( not ( = ?AUTO_4470 ?AUTO_4472 ) ) ( OBJ-AT ?AUTO_4469 ?AUTO_4472 ) ( IN-CITY ?AUTO_4473 ?AUTO_4474 ) ( not ( = ?AUTO_4472 ?AUTO_4473 ) ) ( not ( = ?AUTO_4470 ?AUTO_4473 ) ) ( TRUCK-AT ?AUTO_4471 ?AUTO_4470 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4471 ?AUTO_4470 ?AUTO_4473 ?AUTO_4474 )
      ( DELIVER-PKG ?AUTO_4469 ?AUTO_4470 )
      ( DELIVER-PKG-VERIFY ?AUTO_4469 ?AUTO_4470 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4487 - OBJ
      ?AUTO_4488 - LOCATION
    )
    :vars
    (
      ?AUTO_4489 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4487 ?AUTO_4489 ) ( AIRPLANE-AT ?AUTO_4489 ?AUTO_4488 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4487 ?AUTO_4489 ?AUTO_4488 )
      ( DELIVER-PKG-VERIFY ?AUTO_4487 ?AUTO_4488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4494 - OBJ
      ?AUTO_4495 - LOCATION
    )
    :vars
    (
      ?AUTO_4496 - AIRPLANE
      ?AUTO_4497 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4494 ?AUTO_4496 ) ( AIRPORT ?AUTO_4497 ) ( AIRPORT ?AUTO_4495 ) ( AIRPLANE-AT ?AUTO_4496 ?AUTO_4497 ) ( not ( = ?AUTO_4497 ?AUTO_4495 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4496 ?AUTO_4497 ?AUTO_4495 )
      ( DELIVER-PKG ?AUTO_4494 ?AUTO_4495 )
      ( DELIVER-PKG-VERIFY ?AUTO_4494 ?AUTO_4495 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4498 - OBJ
      ?AUTO_4499 - LOCATION
    )
    :vars
    (
      ?AUTO_4501 - LOCATION
      ?AUTO_4500 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4501 ) ( AIRPORT ?AUTO_4499 ) ( AIRPLANE-AT ?AUTO_4500 ?AUTO_4501 ) ( not ( = ?AUTO_4501 ?AUTO_4499 ) ) ( OBJ-AT ?AUTO_4498 ?AUTO_4501 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4498 ?AUTO_4500 ?AUTO_4501 )
      ( DELIVER-PKG ?AUTO_4498 ?AUTO_4499 )
      ( DELIVER-PKG-VERIFY ?AUTO_4498 ?AUTO_4499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4504 - OBJ
      ?AUTO_4505 - LOCATION
    )
    :vars
    (
      ?AUTO_4507 - LOCATION
      ?AUTO_4506 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4507 ) ( AIRPORT ?AUTO_4505 ) ( not ( = ?AUTO_4507 ?AUTO_4505 ) ) ( OBJ-AT ?AUTO_4504 ?AUTO_4507 ) ( AIRPLANE-AT ?AUTO_4506 ?AUTO_4505 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4506 ?AUTO_4505 ?AUTO_4507 )
      ( DELIVER-PKG ?AUTO_4504 ?AUTO_4505 )
      ( DELIVER-PKG-VERIFY ?AUTO_4504 ?AUTO_4505 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4538 - OBJ
      ?AUTO_4539 - LOCATION
    )
    :vars
    (
      ?AUTO_4540 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4538 ?AUTO_4540 ) ( AIRPLANE-AT ?AUTO_4540 ?AUTO_4539 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4538 ?AUTO_4540 ?AUTO_4539 )
      ( DELIVER-PKG-VERIFY ?AUTO_4538 ?AUTO_4539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4543 - OBJ
      ?AUTO_4544 - LOCATION
    )
    :vars
    (
      ?AUTO_4545 - AIRPLANE
      ?AUTO_4546 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4543 ?AUTO_4545 ) ( AIRPORT ?AUTO_4546 ) ( AIRPORT ?AUTO_4544 ) ( AIRPLANE-AT ?AUTO_4545 ?AUTO_4546 ) ( not ( = ?AUTO_4546 ?AUTO_4544 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4545 ?AUTO_4546 ?AUTO_4544 )
      ( DELIVER-PKG ?AUTO_4543 ?AUTO_4544 )
      ( DELIVER-PKG-VERIFY ?AUTO_4543 ?AUTO_4544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4547 - OBJ
      ?AUTO_4548 - LOCATION
    )
    :vars
    (
      ?AUTO_4550 - LOCATION
      ?AUTO_4549 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4550 ) ( AIRPORT ?AUTO_4548 ) ( AIRPLANE-AT ?AUTO_4549 ?AUTO_4550 ) ( not ( = ?AUTO_4550 ?AUTO_4548 ) ) ( OBJ-AT ?AUTO_4547 ?AUTO_4550 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4547 ?AUTO_4549 ?AUTO_4550 )
      ( DELIVER-PKG ?AUTO_4547 ?AUTO_4548 )
      ( DELIVER-PKG-VERIFY ?AUTO_4547 ?AUTO_4548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4555 - OBJ
      ?AUTO_4556 - LOCATION
    )
    :vars
    (
      ?AUTO_4558 - LOCATION
      ?AUTO_4559 - LOCATION
      ?AUTO_4557 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4558 ) ( AIRPORT ?AUTO_4556 ) ( not ( = ?AUTO_4558 ?AUTO_4556 ) ) ( OBJ-AT ?AUTO_4555 ?AUTO_4558 ) ( AIRPORT ?AUTO_4559 ) ( AIRPLANE-AT ?AUTO_4557 ?AUTO_4559 ) ( not ( = ?AUTO_4559 ?AUTO_4558 ) ) ( not ( = ?AUTO_4556 ?AUTO_4559 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4557 ?AUTO_4559 ?AUTO_4558 )
      ( DELIVER-PKG ?AUTO_4555 ?AUTO_4556 )
      ( DELIVER-PKG-VERIFY ?AUTO_4555 ?AUTO_4556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4570 - OBJ
      ?AUTO_4571 - LOCATION
    )
    :vars
    (
      ?AUTO_4573 - LOCATION
      ?AUTO_4574 - LOCATION
      ?AUTO_4572 - AIRPLANE
      ?AUTO_4575 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4573 ) ( AIRPORT ?AUTO_4571 ) ( not ( = ?AUTO_4573 ?AUTO_4571 ) ) ( AIRPORT ?AUTO_4574 ) ( AIRPLANE-AT ?AUTO_4572 ?AUTO_4574 ) ( not ( = ?AUTO_4574 ?AUTO_4573 ) ) ( not ( = ?AUTO_4571 ?AUTO_4574 ) ) ( TRUCK-AT ?AUTO_4575 ?AUTO_4573 ) ( IN-TRUCK ?AUTO_4570 ?AUTO_4575 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4570 ?AUTO_4575 ?AUTO_4573 )
      ( DELIVER-PKG ?AUTO_4570 ?AUTO_4571 )
      ( DELIVER-PKG-VERIFY ?AUTO_4570 ?AUTO_4571 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4576 - OBJ
      ?AUTO_4577 - LOCATION
    )
    :vars
    (
      ?AUTO_4578 - LOCATION
      ?AUTO_4580 - LOCATION
      ?AUTO_4579 - AIRPLANE
      ?AUTO_4581 - TRUCK
      ?AUTO_4582 - LOCATION
      ?AUTO_4583 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4578 ) ( AIRPORT ?AUTO_4577 ) ( not ( = ?AUTO_4578 ?AUTO_4577 ) ) ( AIRPORT ?AUTO_4580 ) ( AIRPLANE-AT ?AUTO_4579 ?AUTO_4580 ) ( not ( = ?AUTO_4580 ?AUTO_4578 ) ) ( not ( = ?AUTO_4577 ?AUTO_4580 ) ) ( IN-TRUCK ?AUTO_4576 ?AUTO_4581 ) ( TRUCK-AT ?AUTO_4581 ?AUTO_4582 ) ( IN-CITY ?AUTO_4582 ?AUTO_4583 ) ( IN-CITY ?AUTO_4578 ?AUTO_4583 ) ( not ( = ?AUTO_4578 ?AUTO_4582 ) ) ( not ( = ?AUTO_4577 ?AUTO_4582 ) ) ( not ( = ?AUTO_4580 ?AUTO_4582 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4581 ?AUTO_4582 ?AUTO_4578 ?AUTO_4583 )
      ( DELIVER-PKG ?AUTO_4576 ?AUTO_4577 )
      ( DELIVER-PKG-VERIFY ?AUTO_4576 ?AUTO_4577 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4586 - OBJ
      ?AUTO_4587 - LOCATION
    )
    :vars
    (
      ?AUTO_4592 - LOCATION
      ?AUTO_4589 - LOCATION
      ?AUTO_4591 - AIRPLANE
      ?AUTO_4593 - TRUCK
      ?AUTO_4588 - LOCATION
      ?AUTO_4590 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4592 ) ( AIRPORT ?AUTO_4587 ) ( not ( = ?AUTO_4592 ?AUTO_4587 ) ) ( AIRPORT ?AUTO_4589 ) ( AIRPLANE-AT ?AUTO_4591 ?AUTO_4589 ) ( not ( = ?AUTO_4589 ?AUTO_4592 ) ) ( not ( = ?AUTO_4587 ?AUTO_4589 ) ) ( TRUCK-AT ?AUTO_4593 ?AUTO_4588 ) ( IN-CITY ?AUTO_4588 ?AUTO_4590 ) ( IN-CITY ?AUTO_4592 ?AUTO_4590 ) ( not ( = ?AUTO_4592 ?AUTO_4588 ) ) ( not ( = ?AUTO_4587 ?AUTO_4588 ) ) ( not ( = ?AUTO_4589 ?AUTO_4588 ) ) ( OBJ-AT ?AUTO_4586 ?AUTO_4588 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4586 ?AUTO_4593 ?AUTO_4588 )
      ( DELIVER-PKG ?AUTO_4586 ?AUTO_4587 )
      ( DELIVER-PKG-VERIFY ?AUTO_4586 ?AUTO_4587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4594 - OBJ
      ?AUTO_4595 - LOCATION
    )
    :vars
    (
      ?AUTO_4600 - LOCATION
      ?AUTO_4598 - LOCATION
      ?AUTO_4599 - AIRPLANE
      ?AUTO_4596 - LOCATION
      ?AUTO_4597 - CITY
      ?AUTO_4601 - TRUCK
      ?AUTO_4602 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4600 ) ( AIRPORT ?AUTO_4595 ) ( not ( = ?AUTO_4600 ?AUTO_4595 ) ) ( AIRPORT ?AUTO_4598 ) ( AIRPLANE-AT ?AUTO_4599 ?AUTO_4598 ) ( not ( = ?AUTO_4598 ?AUTO_4600 ) ) ( not ( = ?AUTO_4595 ?AUTO_4598 ) ) ( IN-CITY ?AUTO_4596 ?AUTO_4597 ) ( IN-CITY ?AUTO_4600 ?AUTO_4597 ) ( not ( = ?AUTO_4600 ?AUTO_4596 ) ) ( not ( = ?AUTO_4595 ?AUTO_4596 ) ) ( not ( = ?AUTO_4598 ?AUTO_4596 ) ) ( OBJ-AT ?AUTO_4594 ?AUTO_4596 ) ( TRUCK-AT ?AUTO_4601 ?AUTO_4602 ) ( IN-CITY ?AUTO_4602 ?AUTO_4597 ) ( not ( = ?AUTO_4596 ?AUTO_4602 ) ) ( not ( = ?AUTO_4595 ?AUTO_4602 ) ) ( not ( = ?AUTO_4600 ?AUTO_4602 ) ) ( not ( = ?AUTO_4598 ?AUTO_4602 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4601 ?AUTO_4602 ?AUTO_4596 ?AUTO_4597 )
      ( DELIVER-PKG ?AUTO_4594 ?AUTO_4595 )
      ( DELIVER-PKG-VERIFY ?AUTO_4594 ?AUTO_4595 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4615 - OBJ
      ?AUTO_4616 - LOCATION
    )
    :vars
    (
      ?AUTO_4617 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4617 ?AUTO_4616 ) ( IN-TRUCK ?AUTO_4615 ?AUTO_4617 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4615 ?AUTO_4617 ?AUTO_4616 )
      ( DELIVER-PKG-VERIFY ?AUTO_4615 ?AUTO_4616 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4618 - OBJ
      ?AUTO_4619 - LOCATION
    )
    :vars
    (
      ?AUTO_4620 - TRUCK
      ?AUTO_4621 - LOCATION
      ?AUTO_4622 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4618 ?AUTO_4620 ) ( TRUCK-AT ?AUTO_4620 ?AUTO_4621 ) ( IN-CITY ?AUTO_4621 ?AUTO_4622 ) ( IN-CITY ?AUTO_4619 ?AUTO_4622 ) ( not ( = ?AUTO_4619 ?AUTO_4621 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4620 ?AUTO_4621 ?AUTO_4619 ?AUTO_4622 )
      ( DELIVER-PKG ?AUTO_4618 ?AUTO_4619 )
      ( DELIVER-PKG-VERIFY ?AUTO_4618 ?AUTO_4619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4625 - OBJ
      ?AUTO_4626 - LOCATION
    )
    :vars
    (
      ?AUTO_4627 - TRUCK
      ?AUTO_4629 - LOCATION
      ?AUTO_4628 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4627 ?AUTO_4629 ) ( IN-CITY ?AUTO_4629 ?AUTO_4628 ) ( IN-CITY ?AUTO_4626 ?AUTO_4628 ) ( not ( = ?AUTO_4626 ?AUTO_4629 ) ) ( OBJ-AT ?AUTO_4625 ?AUTO_4629 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4625 ?AUTO_4627 ?AUTO_4629 )
      ( DELIVER-PKG ?AUTO_4625 ?AUTO_4626 )
      ( DELIVER-PKG-VERIFY ?AUTO_4625 ?AUTO_4626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4632 - OBJ
      ?AUTO_4633 - LOCATION
    )
    :vars
    (
      ?AUTO_4634 - TRUCK
      ?AUTO_4635 - LOCATION
      ?AUTO_4636 - CITY
      ?AUTO_4637 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4634 ?AUTO_4635 ) ( IN-CITY ?AUTO_4635 ?AUTO_4636 ) ( IN-CITY ?AUTO_4633 ?AUTO_4636 ) ( not ( = ?AUTO_4633 ?AUTO_4635 ) ) ( IN-AIRPLANE ?AUTO_4632 ?AUTO_4637 ) ( AIRPLANE-AT ?AUTO_4637 ?AUTO_4635 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4632 ?AUTO_4637 ?AUTO_4635 )
      ( DELIVER-PKG ?AUTO_4632 ?AUTO_4633 )
      ( DELIVER-PKG-VERIFY ?AUTO_4632 ?AUTO_4633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4642 - OBJ
      ?AUTO_4643 - LOCATION
    )
    :vars
    (
      ?AUTO_4647 - TRUCK
      ?AUTO_4645 - LOCATION
      ?AUTO_4644 - CITY
      ?AUTO_4646 - AIRPLANE
      ?AUTO_4648 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4647 ?AUTO_4645 ) ( IN-CITY ?AUTO_4645 ?AUTO_4644 ) ( IN-CITY ?AUTO_4643 ?AUTO_4644 ) ( not ( = ?AUTO_4643 ?AUTO_4645 ) ) ( IN-AIRPLANE ?AUTO_4642 ?AUTO_4646 ) ( AIRPORT ?AUTO_4648 ) ( AIRPORT ?AUTO_4645 ) ( AIRPLANE-AT ?AUTO_4646 ?AUTO_4648 ) ( not ( = ?AUTO_4648 ?AUTO_4645 ) ) ( not ( = ?AUTO_4643 ?AUTO_4648 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4646 ?AUTO_4648 ?AUTO_4645 )
      ( DELIVER-PKG ?AUTO_4642 ?AUTO_4643 )
      ( DELIVER-PKG-VERIFY ?AUTO_4642 ?AUTO_4643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4649 - OBJ
      ?AUTO_4650 - LOCATION
    )
    :vars
    (
      ?AUTO_4653 - TRUCK
      ?AUTO_4651 - LOCATION
      ?AUTO_4652 - CITY
      ?AUTO_4655 - LOCATION
      ?AUTO_4654 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4653 ?AUTO_4651 ) ( IN-CITY ?AUTO_4651 ?AUTO_4652 ) ( IN-CITY ?AUTO_4650 ?AUTO_4652 ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( AIRPORT ?AUTO_4655 ) ( AIRPORT ?AUTO_4651 ) ( AIRPLANE-AT ?AUTO_4654 ?AUTO_4655 ) ( not ( = ?AUTO_4655 ?AUTO_4651 ) ) ( not ( = ?AUTO_4650 ?AUTO_4655 ) ) ( OBJ-AT ?AUTO_4649 ?AUTO_4655 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4649 ?AUTO_4654 ?AUTO_4655 )
      ( DELIVER-PKG ?AUTO_4649 ?AUTO_4650 )
      ( DELIVER-PKG-VERIFY ?AUTO_4649 ?AUTO_4650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4658 - OBJ
      ?AUTO_4659 - LOCATION
    )
    :vars
    (
      ?AUTO_4662 - TRUCK
      ?AUTO_4660 - LOCATION
      ?AUTO_4661 - CITY
      ?AUTO_4663 - LOCATION
      ?AUTO_4664 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4662 ?AUTO_4660 ) ( IN-CITY ?AUTO_4660 ?AUTO_4661 ) ( IN-CITY ?AUTO_4659 ?AUTO_4661 ) ( not ( = ?AUTO_4659 ?AUTO_4660 ) ) ( AIRPORT ?AUTO_4663 ) ( AIRPORT ?AUTO_4660 ) ( not ( = ?AUTO_4663 ?AUTO_4660 ) ) ( not ( = ?AUTO_4659 ?AUTO_4663 ) ) ( OBJ-AT ?AUTO_4658 ?AUTO_4663 ) ( AIRPLANE-AT ?AUTO_4664 ?AUTO_4660 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4664 ?AUTO_4660 ?AUTO_4663 )
      ( DELIVER-PKG ?AUTO_4658 ?AUTO_4659 )
      ( DELIVER-PKG-VERIFY ?AUTO_4658 ?AUTO_4659 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4691 - OBJ
      ?AUTO_4692 - LOCATION
    )
    :vars
    (
      ?AUTO_4697 - LOCATION
      ?AUTO_4693 - CITY
      ?AUTO_4695 - LOCATION
      ?AUTO_4696 - AIRPLANE
      ?AUTO_4694 - TRUCK
      ?AUTO_4698 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4697 ?AUTO_4693 ) ( IN-CITY ?AUTO_4692 ?AUTO_4693 ) ( not ( = ?AUTO_4692 ?AUTO_4697 ) ) ( AIRPORT ?AUTO_4695 ) ( AIRPORT ?AUTO_4697 ) ( not ( = ?AUTO_4695 ?AUTO_4697 ) ) ( not ( = ?AUTO_4692 ?AUTO_4695 ) ) ( OBJ-AT ?AUTO_4691 ?AUTO_4695 ) ( AIRPLANE-AT ?AUTO_4696 ?AUTO_4697 ) ( TRUCK-AT ?AUTO_4694 ?AUTO_4698 ) ( IN-CITY ?AUTO_4698 ?AUTO_4693 ) ( not ( = ?AUTO_4697 ?AUTO_4698 ) ) ( not ( = ?AUTO_4692 ?AUTO_4698 ) ) ( not ( = ?AUTO_4695 ?AUTO_4698 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4694 ?AUTO_4698 ?AUTO_4697 ?AUTO_4693 )
      ( DELIVER-PKG ?AUTO_4691 ?AUTO_4692 )
      ( DELIVER-PKG-VERIFY ?AUTO_4691 ?AUTO_4692 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4701 - OBJ
      ?AUTO_4702 - LOCATION
    )
    :vars
    (
      ?AUTO_4703 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4703 ?AUTO_4702 ) ( IN-TRUCK ?AUTO_4701 ?AUTO_4703 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4701 ?AUTO_4703 ?AUTO_4702 )
      ( DELIVER-PKG-VERIFY ?AUTO_4701 ?AUTO_4702 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4708 - OBJ
      ?AUTO_4709 - LOCATION
    )
    :vars
    (
      ?AUTO_4711 - TRUCK
      ?AUTO_4710 - LOCATION
      ?AUTO_4712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4711 ?AUTO_4710 ) ( IN-CITY ?AUTO_4710 ?AUTO_4712 ) ( IN-CITY ?AUTO_4709 ?AUTO_4712 ) ( not ( = ?AUTO_4709 ?AUTO_4710 ) ) ( OBJ-AT ?AUTO_4708 ?AUTO_4710 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4708 ?AUTO_4711 ?AUTO_4710 )
      ( DELIVER-PKG ?AUTO_4708 ?AUTO_4709 )
      ( DELIVER-PKG-VERIFY ?AUTO_4708 ?AUTO_4709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4715 - OBJ
      ?AUTO_4716 - LOCATION
    )
    :vars
    (
      ?AUTO_4718 - TRUCK
      ?AUTO_4717 - LOCATION
      ?AUTO_4719 - CITY
      ?AUTO_4720 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4718 ?AUTO_4717 ) ( IN-CITY ?AUTO_4717 ?AUTO_4719 ) ( IN-CITY ?AUTO_4716 ?AUTO_4719 ) ( not ( = ?AUTO_4716 ?AUTO_4717 ) ) ( IN-AIRPLANE ?AUTO_4715 ?AUTO_4720 ) ( AIRPLANE-AT ?AUTO_4720 ?AUTO_4717 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4715 ?AUTO_4720 ?AUTO_4717 )
      ( DELIVER-PKG ?AUTO_4715 ?AUTO_4716 )
      ( DELIVER-PKG-VERIFY ?AUTO_4715 ?AUTO_4716 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4723 - OBJ
      ?AUTO_4724 - LOCATION
    )
    :vars
    (
      ?AUTO_4726 - TRUCK
      ?AUTO_4728 - LOCATION
      ?AUTO_4725 - CITY
      ?AUTO_4727 - AIRPLANE
      ?AUTO_4729 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4726 ?AUTO_4728 ) ( IN-CITY ?AUTO_4728 ?AUTO_4725 ) ( IN-CITY ?AUTO_4724 ?AUTO_4725 ) ( not ( = ?AUTO_4724 ?AUTO_4728 ) ) ( IN-AIRPLANE ?AUTO_4723 ?AUTO_4727 ) ( AIRPORT ?AUTO_4729 ) ( AIRPORT ?AUTO_4728 ) ( AIRPLANE-AT ?AUTO_4727 ?AUTO_4729 ) ( not ( = ?AUTO_4729 ?AUTO_4728 ) ) ( not ( = ?AUTO_4724 ?AUTO_4729 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4727 ?AUTO_4729 ?AUTO_4728 )
      ( DELIVER-PKG ?AUTO_4723 ?AUTO_4724 )
      ( DELIVER-PKG-VERIFY ?AUTO_4723 ?AUTO_4724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4730 - OBJ
      ?AUTO_4731 - LOCATION
    )
    :vars
    (
      ?AUTO_4733 - TRUCK
      ?AUTO_4734 - LOCATION
      ?AUTO_4732 - CITY
      ?AUTO_4736 - LOCATION
      ?AUTO_4735 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4733 ?AUTO_4734 ) ( IN-CITY ?AUTO_4734 ?AUTO_4732 ) ( IN-CITY ?AUTO_4731 ?AUTO_4732 ) ( not ( = ?AUTO_4731 ?AUTO_4734 ) ) ( AIRPORT ?AUTO_4736 ) ( AIRPORT ?AUTO_4734 ) ( AIRPLANE-AT ?AUTO_4735 ?AUTO_4736 ) ( not ( = ?AUTO_4736 ?AUTO_4734 ) ) ( not ( = ?AUTO_4731 ?AUTO_4736 ) ) ( OBJ-AT ?AUTO_4730 ?AUTO_4736 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4730 ?AUTO_4735 ?AUTO_4736 )
      ( DELIVER-PKG ?AUTO_4730 ?AUTO_4731 )
      ( DELIVER-PKG-VERIFY ?AUTO_4730 ?AUTO_4731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4741 - OBJ
      ?AUTO_4742 - LOCATION
    )
    :vars
    (
      ?AUTO_4746 - TRUCK
      ?AUTO_4745 - LOCATION
      ?AUTO_4744 - CITY
      ?AUTO_4747 - LOCATION
      ?AUTO_4748 - LOCATION
      ?AUTO_4743 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4746 ?AUTO_4745 ) ( IN-CITY ?AUTO_4745 ?AUTO_4744 ) ( IN-CITY ?AUTO_4742 ?AUTO_4744 ) ( not ( = ?AUTO_4742 ?AUTO_4745 ) ) ( AIRPORT ?AUTO_4747 ) ( AIRPORT ?AUTO_4745 ) ( not ( = ?AUTO_4747 ?AUTO_4745 ) ) ( not ( = ?AUTO_4742 ?AUTO_4747 ) ) ( OBJ-AT ?AUTO_4741 ?AUTO_4747 ) ( AIRPORT ?AUTO_4748 ) ( AIRPLANE-AT ?AUTO_4743 ?AUTO_4748 ) ( not ( = ?AUTO_4748 ?AUTO_4747 ) ) ( not ( = ?AUTO_4742 ?AUTO_4748 ) ) ( not ( = ?AUTO_4745 ?AUTO_4748 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4743 ?AUTO_4748 ?AUTO_4747 )
      ( DELIVER-PKG ?AUTO_4741 ?AUTO_4742 )
      ( DELIVER-PKG-VERIFY ?AUTO_4741 ?AUTO_4742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4759 - OBJ
      ?AUTO_4760 - LOCATION
    )
    :vars
    (
      ?AUTO_4762 - TRUCK
      ?AUTO_4761 - LOCATION
      ?AUTO_4766 - CITY
      ?AUTO_4764 - LOCATION
      ?AUTO_4765 - LOCATION
      ?AUTO_4763 - AIRPLANE
      ?AUTO_4767 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4762 ?AUTO_4761 ) ( IN-CITY ?AUTO_4761 ?AUTO_4766 ) ( IN-CITY ?AUTO_4760 ?AUTO_4766 ) ( not ( = ?AUTO_4760 ?AUTO_4761 ) ) ( AIRPORT ?AUTO_4764 ) ( AIRPORT ?AUTO_4761 ) ( not ( = ?AUTO_4764 ?AUTO_4761 ) ) ( not ( = ?AUTO_4760 ?AUTO_4764 ) ) ( AIRPORT ?AUTO_4765 ) ( AIRPLANE-AT ?AUTO_4763 ?AUTO_4765 ) ( not ( = ?AUTO_4765 ?AUTO_4764 ) ) ( not ( = ?AUTO_4760 ?AUTO_4765 ) ) ( not ( = ?AUTO_4761 ?AUTO_4765 ) ) ( TRUCK-AT ?AUTO_4767 ?AUTO_4764 ) ( IN-TRUCK ?AUTO_4759 ?AUTO_4767 ) ( not ( = ?AUTO_4762 ?AUTO_4767 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4759 ?AUTO_4767 ?AUTO_4764 )
      ( DELIVER-PKG ?AUTO_4759 ?AUTO_4760 )
      ( DELIVER-PKG-VERIFY ?AUTO_4759 ?AUTO_4760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4768 - OBJ
      ?AUTO_4769 - LOCATION
    )
    :vars
    (
      ?AUTO_4774 - TRUCK
      ?AUTO_4775 - LOCATION
      ?AUTO_4770 - CITY
      ?AUTO_4772 - LOCATION
      ?AUTO_4771 - LOCATION
      ?AUTO_4773 - AIRPLANE
      ?AUTO_4776 - TRUCK
      ?AUTO_4777 - LOCATION
      ?AUTO_4778 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4774 ?AUTO_4775 ) ( IN-CITY ?AUTO_4775 ?AUTO_4770 ) ( IN-CITY ?AUTO_4769 ?AUTO_4770 ) ( not ( = ?AUTO_4769 ?AUTO_4775 ) ) ( AIRPORT ?AUTO_4772 ) ( AIRPORT ?AUTO_4775 ) ( not ( = ?AUTO_4772 ?AUTO_4775 ) ) ( not ( = ?AUTO_4769 ?AUTO_4772 ) ) ( AIRPORT ?AUTO_4771 ) ( AIRPLANE-AT ?AUTO_4773 ?AUTO_4771 ) ( not ( = ?AUTO_4771 ?AUTO_4772 ) ) ( not ( = ?AUTO_4769 ?AUTO_4771 ) ) ( not ( = ?AUTO_4775 ?AUTO_4771 ) ) ( IN-TRUCK ?AUTO_4768 ?AUTO_4776 ) ( not ( = ?AUTO_4774 ?AUTO_4776 ) ) ( TRUCK-AT ?AUTO_4776 ?AUTO_4777 ) ( IN-CITY ?AUTO_4777 ?AUTO_4778 ) ( IN-CITY ?AUTO_4772 ?AUTO_4778 ) ( not ( = ?AUTO_4772 ?AUTO_4777 ) ) ( not ( = ?AUTO_4769 ?AUTO_4777 ) ) ( not ( = ?AUTO_4775 ?AUTO_4777 ) ) ( not ( = ?AUTO_4770 ?AUTO_4778 ) ) ( not ( = ?AUTO_4771 ?AUTO_4777 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4776 ?AUTO_4777 ?AUTO_4772 ?AUTO_4778 )
      ( DELIVER-PKG ?AUTO_4768 ?AUTO_4769 )
      ( DELIVER-PKG-VERIFY ?AUTO_4768 ?AUTO_4769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4781 - OBJ
      ?AUTO_4782 - LOCATION
    )
    :vars
    (
      ?AUTO_4784 - TRUCK
      ?AUTO_4783 - LOCATION
      ?AUTO_4790 - CITY
      ?AUTO_4786 - LOCATION
      ?AUTO_4788 - LOCATION
      ?AUTO_4789 - AIRPLANE
      ?AUTO_4791 - TRUCK
      ?AUTO_4785 - LOCATION
      ?AUTO_4787 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4784 ?AUTO_4783 ) ( IN-CITY ?AUTO_4783 ?AUTO_4790 ) ( IN-CITY ?AUTO_4782 ?AUTO_4790 ) ( not ( = ?AUTO_4782 ?AUTO_4783 ) ) ( AIRPORT ?AUTO_4786 ) ( AIRPORT ?AUTO_4783 ) ( not ( = ?AUTO_4786 ?AUTO_4783 ) ) ( not ( = ?AUTO_4782 ?AUTO_4786 ) ) ( AIRPORT ?AUTO_4788 ) ( AIRPLANE-AT ?AUTO_4789 ?AUTO_4788 ) ( not ( = ?AUTO_4788 ?AUTO_4786 ) ) ( not ( = ?AUTO_4782 ?AUTO_4788 ) ) ( not ( = ?AUTO_4783 ?AUTO_4788 ) ) ( not ( = ?AUTO_4784 ?AUTO_4791 ) ) ( TRUCK-AT ?AUTO_4791 ?AUTO_4785 ) ( IN-CITY ?AUTO_4785 ?AUTO_4787 ) ( IN-CITY ?AUTO_4786 ?AUTO_4787 ) ( not ( = ?AUTO_4786 ?AUTO_4785 ) ) ( not ( = ?AUTO_4782 ?AUTO_4785 ) ) ( not ( = ?AUTO_4783 ?AUTO_4785 ) ) ( not ( = ?AUTO_4790 ?AUTO_4787 ) ) ( not ( = ?AUTO_4788 ?AUTO_4785 ) ) ( OBJ-AT ?AUTO_4781 ?AUTO_4785 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4781 ?AUTO_4791 ?AUTO_4785 )
      ( DELIVER-PKG ?AUTO_4781 ?AUTO_4782 )
      ( DELIVER-PKG-VERIFY ?AUTO_4781 ?AUTO_4782 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4792 - OBJ
      ?AUTO_4793 - LOCATION
    )
    :vars
    (
      ?AUTO_4801 - TRUCK
      ?AUTO_4799 - LOCATION
      ?AUTO_4800 - CITY
      ?AUTO_4795 - LOCATION
      ?AUTO_4798 - LOCATION
      ?AUTO_4796 - AIRPLANE
      ?AUTO_4794 - TRUCK
      ?AUTO_4802 - LOCATION
      ?AUTO_4797 - CITY
      ?AUTO_4803 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4801 ?AUTO_4799 ) ( IN-CITY ?AUTO_4799 ?AUTO_4800 ) ( IN-CITY ?AUTO_4793 ?AUTO_4800 ) ( not ( = ?AUTO_4793 ?AUTO_4799 ) ) ( AIRPORT ?AUTO_4795 ) ( AIRPORT ?AUTO_4799 ) ( not ( = ?AUTO_4795 ?AUTO_4799 ) ) ( not ( = ?AUTO_4793 ?AUTO_4795 ) ) ( AIRPORT ?AUTO_4798 ) ( AIRPLANE-AT ?AUTO_4796 ?AUTO_4798 ) ( not ( = ?AUTO_4798 ?AUTO_4795 ) ) ( not ( = ?AUTO_4793 ?AUTO_4798 ) ) ( not ( = ?AUTO_4799 ?AUTO_4798 ) ) ( not ( = ?AUTO_4801 ?AUTO_4794 ) ) ( IN-CITY ?AUTO_4802 ?AUTO_4797 ) ( IN-CITY ?AUTO_4795 ?AUTO_4797 ) ( not ( = ?AUTO_4795 ?AUTO_4802 ) ) ( not ( = ?AUTO_4793 ?AUTO_4802 ) ) ( not ( = ?AUTO_4799 ?AUTO_4802 ) ) ( not ( = ?AUTO_4800 ?AUTO_4797 ) ) ( not ( = ?AUTO_4798 ?AUTO_4802 ) ) ( OBJ-AT ?AUTO_4792 ?AUTO_4802 ) ( TRUCK-AT ?AUTO_4794 ?AUTO_4803 ) ( IN-CITY ?AUTO_4803 ?AUTO_4797 ) ( not ( = ?AUTO_4802 ?AUTO_4803 ) ) ( not ( = ?AUTO_4793 ?AUTO_4803 ) ) ( not ( = ?AUTO_4799 ?AUTO_4803 ) ) ( not ( = ?AUTO_4795 ?AUTO_4803 ) ) ( not ( = ?AUTO_4798 ?AUTO_4803 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4794 ?AUTO_4803 ?AUTO_4802 ?AUTO_4797 )
      ( DELIVER-PKG ?AUTO_4792 ?AUTO_4793 )
      ( DELIVER-PKG-VERIFY ?AUTO_4792 ?AUTO_4793 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4812 - OBJ
      ?AUTO_4813 - LOCATION
    )
    :vars
    (
      ?AUTO_4820 - LOCATION
      ?AUTO_4823 - CITY
      ?AUTO_4821 - LOCATION
      ?AUTO_4817 - LOCATION
      ?AUTO_4822 - AIRPLANE
      ?AUTO_4819 - TRUCK
      ?AUTO_4815 - TRUCK
      ?AUTO_4818 - LOCATION
      ?AUTO_4814 - CITY
      ?AUTO_4816 - LOCATION
      ?AUTO_4824 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4820 ?AUTO_4823 ) ( IN-CITY ?AUTO_4813 ?AUTO_4823 ) ( not ( = ?AUTO_4813 ?AUTO_4820 ) ) ( AIRPORT ?AUTO_4821 ) ( AIRPORT ?AUTO_4820 ) ( not ( = ?AUTO_4821 ?AUTO_4820 ) ) ( not ( = ?AUTO_4813 ?AUTO_4821 ) ) ( AIRPORT ?AUTO_4817 ) ( AIRPLANE-AT ?AUTO_4822 ?AUTO_4817 ) ( not ( = ?AUTO_4817 ?AUTO_4821 ) ) ( not ( = ?AUTO_4813 ?AUTO_4817 ) ) ( not ( = ?AUTO_4820 ?AUTO_4817 ) ) ( not ( = ?AUTO_4819 ?AUTO_4815 ) ) ( IN-CITY ?AUTO_4818 ?AUTO_4814 ) ( IN-CITY ?AUTO_4821 ?AUTO_4814 ) ( not ( = ?AUTO_4821 ?AUTO_4818 ) ) ( not ( = ?AUTO_4813 ?AUTO_4818 ) ) ( not ( = ?AUTO_4820 ?AUTO_4818 ) ) ( not ( = ?AUTO_4823 ?AUTO_4814 ) ) ( not ( = ?AUTO_4817 ?AUTO_4818 ) ) ( OBJ-AT ?AUTO_4812 ?AUTO_4818 ) ( TRUCK-AT ?AUTO_4815 ?AUTO_4816 ) ( IN-CITY ?AUTO_4816 ?AUTO_4814 ) ( not ( = ?AUTO_4818 ?AUTO_4816 ) ) ( not ( = ?AUTO_4813 ?AUTO_4816 ) ) ( not ( = ?AUTO_4820 ?AUTO_4816 ) ) ( not ( = ?AUTO_4821 ?AUTO_4816 ) ) ( not ( = ?AUTO_4817 ?AUTO_4816 ) ) ( TRUCK-AT ?AUTO_4819 ?AUTO_4824 ) ( IN-CITY ?AUTO_4824 ?AUTO_4823 ) ( not ( = ?AUTO_4820 ?AUTO_4824 ) ) ( not ( = ?AUTO_4813 ?AUTO_4824 ) ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4817 ?AUTO_4824 ) ) ( not ( = ?AUTO_4818 ?AUTO_4824 ) ) ( not ( = ?AUTO_4816 ?AUTO_4824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4819 ?AUTO_4824 ?AUTO_4820 ?AUTO_4823 )
      ( DELIVER-PKG ?AUTO_4812 ?AUTO_4813 )
      ( DELIVER-PKG-VERIFY ?AUTO_4812 ?AUTO_4813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4827 - OBJ
      ?AUTO_4828 - LOCATION
    )
    :vars
    (
      ?AUTO_4829 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4829 ?AUTO_4828 ) ( IN-TRUCK ?AUTO_4827 ?AUTO_4829 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4827 ?AUTO_4829 ?AUTO_4828 )
      ( DELIVER-PKG-VERIFY ?AUTO_4827 ?AUTO_4828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4830 - OBJ
      ?AUTO_4831 - LOCATION
    )
    :vars
    (
      ?AUTO_4832 - TRUCK
      ?AUTO_4833 - LOCATION
      ?AUTO_4834 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4830 ?AUTO_4832 ) ( TRUCK-AT ?AUTO_4832 ?AUTO_4833 ) ( IN-CITY ?AUTO_4833 ?AUTO_4834 ) ( IN-CITY ?AUTO_4831 ?AUTO_4834 ) ( not ( = ?AUTO_4831 ?AUTO_4833 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4832 ?AUTO_4833 ?AUTO_4831 ?AUTO_4834 )
      ( DELIVER-PKG ?AUTO_4830 ?AUTO_4831 )
      ( DELIVER-PKG-VERIFY ?AUTO_4830 ?AUTO_4831 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4837 - OBJ
      ?AUTO_4838 - LOCATION
    )
    :vars
    (
      ?AUTO_4839 - TRUCK
      ?AUTO_4841 - LOCATION
      ?AUTO_4840 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4839 ?AUTO_4841 ) ( IN-CITY ?AUTO_4841 ?AUTO_4840 ) ( IN-CITY ?AUTO_4838 ?AUTO_4840 ) ( not ( = ?AUTO_4838 ?AUTO_4841 ) ) ( OBJ-AT ?AUTO_4837 ?AUTO_4841 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4837 ?AUTO_4839 ?AUTO_4841 )
      ( DELIVER-PKG ?AUTO_4837 ?AUTO_4838 )
      ( DELIVER-PKG-VERIFY ?AUTO_4837 ?AUTO_4838 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4842 - OBJ
      ?AUTO_4843 - LOCATION
    )
    :vars
    (
      ?AUTO_4845 - LOCATION
      ?AUTO_4846 - CITY
      ?AUTO_4844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4845 ?AUTO_4846 ) ( IN-CITY ?AUTO_4843 ?AUTO_4846 ) ( not ( = ?AUTO_4843 ?AUTO_4845 ) ) ( OBJ-AT ?AUTO_4842 ?AUTO_4845 ) ( TRUCK-AT ?AUTO_4844 ?AUTO_4843 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4844 ?AUTO_4843 ?AUTO_4845 ?AUTO_4846 )
      ( DELIVER-PKG ?AUTO_4842 ?AUTO_4843 )
      ( DELIVER-PKG-VERIFY ?AUTO_4842 ?AUTO_4843 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4849 - OBJ
      ?AUTO_4850 - LOCATION
    )
    :vars
    (
      ?AUTO_4851 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4851 ?AUTO_4850 ) ( IN-TRUCK ?AUTO_4849 ?AUTO_4851 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4849 ?AUTO_4851 ?AUTO_4850 )
      ( DELIVER-PKG-VERIFY ?AUTO_4849 ?AUTO_4850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4856 - OBJ
      ?AUTO_4857 - LOCATION
    )
    :vars
    (
      ?AUTO_4859 - TRUCK
      ?AUTO_4858 - LOCATION
      ?AUTO_4860 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4859 ?AUTO_4858 ) ( IN-CITY ?AUTO_4858 ?AUTO_4860 ) ( IN-CITY ?AUTO_4857 ?AUTO_4860 ) ( not ( = ?AUTO_4857 ?AUTO_4858 ) ) ( OBJ-AT ?AUTO_4856 ?AUTO_4858 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4856 ?AUTO_4859 ?AUTO_4858 )
      ( DELIVER-PKG ?AUTO_4856 ?AUTO_4857 )
      ( DELIVER-PKG-VERIFY ?AUTO_4856 ?AUTO_4857 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4867 - OBJ
      ?AUTO_4868 - LOCATION
    )
    :vars
    (
      ?AUTO_4869 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4867 ?AUTO_4869 ) ( AIRPLANE-AT ?AUTO_4869 ?AUTO_4868 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4867 ?AUTO_4869 ?AUTO_4868 )
      ( DELIVER-PKG-VERIFY ?AUTO_4867 ?AUTO_4868 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4870 - OBJ
      ?AUTO_4871 - LOCATION
    )
    :vars
    (
      ?AUTO_4872 - AIRPLANE
      ?AUTO_4873 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4870 ?AUTO_4872 ) ( AIRPORT ?AUTO_4873 ) ( AIRPORT ?AUTO_4871 ) ( AIRPLANE-AT ?AUTO_4872 ?AUTO_4873 ) ( not ( = ?AUTO_4873 ?AUTO_4871 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4872 ?AUTO_4873 ?AUTO_4871 )
      ( DELIVER-PKG ?AUTO_4870 ?AUTO_4871 )
      ( DELIVER-PKG-VERIFY ?AUTO_4870 ?AUTO_4871 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4880 - OBJ
      ?AUTO_4881 - LOCATION
    )
    :vars
    (
      ?AUTO_4883 - LOCATION
      ?AUTO_4882 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4883 ) ( AIRPORT ?AUTO_4881 ) ( AIRPLANE-AT ?AUTO_4882 ?AUTO_4883 ) ( not ( = ?AUTO_4883 ?AUTO_4881 ) ) ( OBJ-AT ?AUTO_4880 ?AUTO_4883 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4880 ?AUTO_4882 ?AUTO_4883 )
      ( DELIVER-PKG ?AUTO_4880 ?AUTO_4881 )
      ( DELIVER-PKG-VERIFY ?AUTO_4880 ?AUTO_4881 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4886 - OBJ
      ?AUTO_4887 - LOCATION
    )
    :vars
    (
      ?AUTO_4888 - LOCATION
      ?AUTO_4889 - AIRPLANE
      ?AUTO_4890 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4888 ) ( AIRPORT ?AUTO_4887 ) ( AIRPLANE-AT ?AUTO_4889 ?AUTO_4888 ) ( not ( = ?AUTO_4888 ?AUTO_4887 ) ) ( TRUCK-AT ?AUTO_4890 ?AUTO_4888 ) ( IN-TRUCK ?AUTO_4886 ?AUTO_4890 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4886 ?AUTO_4890 ?AUTO_4888 )
      ( DELIVER-PKG ?AUTO_4886 ?AUTO_4887 )
      ( DELIVER-PKG-VERIFY ?AUTO_4886 ?AUTO_4887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4891 - OBJ
      ?AUTO_4892 - LOCATION
    )
    :vars
    (
      ?AUTO_4894 - LOCATION
      ?AUTO_4893 - AIRPLANE
      ?AUTO_4895 - TRUCK
      ?AUTO_4896 - LOCATION
      ?AUTO_4897 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4894 ) ( AIRPORT ?AUTO_4892 ) ( AIRPLANE-AT ?AUTO_4893 ?AUTO_4894 ) ( not ( = ?AUTO_4894 ?AUTO_4892 ) ) ( IN-TRUCK ?AUTO_4891 ?AUTO_4895 ) ( TRUCK-AT ?AUTO_4895 ?AUTO_4896 ) ( IN-CITY ?AUTO_4896 ?AUTO_4897 ) ( IN-CITY ?AUTO_4894 ?AUTO_4897 ) ( not ( = ?AUTO_4894 ?AUTO_4896 ) ) ( not ( = ?AUTO_4892 ?AUTO_4896 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4895 ?AUTO_4896 ?AUTO_4894 ?AUTO_4897 )
      ( DELIVER-PKG ?AUTO_4891 ?AUTO_4892 )
      ( DELIVER-PKG-VERIFY ?AUTO_4891 ?AUTO_4892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4900 - OBJ
      ?AUTO_4901 - LOCATION
    )
    :vars
    (
      ?AUTO_4906 - LOCATION
      ?AUTO_4905 - AIRPLANE
      ?AUTO_4903 - TRUCK
      ?AUTO_4902 - LOCATION
      ?AUTO_4904 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4906 ) ( AIRPORT ?AUTO_4901 ) ( AIRPLANE-AT ?AUTO_4905 ?AUTO_4906 ) ( not ( = ?AUTO_4906 ?AUTO_4901 ) ) ( TRUCK-AT ?AUTO_4903 ?AUTO_4902 ) ( IN-CITY ?AUTO_4902 ?AUTO_4904 ) ( IN-CITY ?AUTO_4906 ?AUTO_4904 ) ( not ( = ?AUTO_4906 ?AUTO_4902 ) ) ( not ( = ?AUTO_4901 ?AUTO_4902 ) ) ( OBJ-AT ?AUTO_4900 ?AUTO_4902 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4900 ?AUTO_4903 ?AUTO_4902 )
      ( DELIVER-PKG ?AUTO_4900 ?AUTO_4901 )
      ( DELIVER-PKG-VERIFY ?AUTO_4900 ?AUTO_4901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4907 - OBJ
      ?AUTO_4908 - LOCATION
    )
    :vars
    (
      ?AUTO_4912 - LOCATION
      ?AUTO_4911 - AIRPLANE
      ?AUTO_4909 - LOCATION
      ?AUTO_4913 - CITY
      ?AUTO_4910 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4912 ) ( AIRPORT ?AUTO_4908 ) ( AIRPLANE-AT ?AUTO_4911 ?AUTO_4912 ) ( not ( = ?AUTO_4912 ?AUTO_4908 ) ) ( IN-CITY ?AUTO_4909 ?AUTO_4913 ) ( IN-CITY ?AUTO_4912 ?AUTO_4913 ) ( not ( = ?AUTO_4912 ?AUTO_4909 ) ) ( not ( = ?AUTO_4908 ?AUTO_4909 ) ) ( OBJ-AT ?AUTO_4907 ?AUTO_4909 ) ( TRUCK-AT ?AUTO_4910 ?AUTO_4912 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4910 ?AUTO_4912 ?AUTO_4909 ?AUTO_4913 )
      ( DELIVER-PKG ?AUTO_4907 ?AUTO_4908 )
      ( DELIVER-PKG-VERIFY ?AUTO_4907 ?AUTO_4908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4916 - OBJ
      ?AUTO_4917 - LOCATION
    )
    :vars
    (
      ?AUTO_4918 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4916 ?AUTO_4918 ) ( AIRPLANE-AT ?AUTO_4918 ?AUTO_4917 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4916 ?AUTO_4918 ?AUTO_4917 )
      ( DELIVER-PKG-VERIFY ?AUTO_4916 ?AUTO_4917 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4927 - OBJ
      ?AUTO_4928 - LOCATION
    )
    :vars
    (
      ?AUTO_4929 - LOCATION
      ?AUTO_4930 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4929 ) ( AIRPORT ?AUTO_4928 ) ( AIRPLANE-AT ?AUTO_4930 ?AUTO_4929 ) ( not ( = ?AUTO_4929 ?AUTO_4928 ) ) ( OBJ-AT ?AUTO_4927 ?AUTO_4929 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4927 ?AUTO_4930 ?AUTO_4929 )
      ( DELIVER-PKG ?AUTO_4927 ?AUTO_4928 )
      ( DELIVER-PKG-VERIFY ?AUTO_4927 ?AUTO_4928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4933 - OBJ
      ?AUTO_4934 - LOCATION
    )
    :vars
    (
      ?AUTO_4935 - LOCATION
      ?AUTO_4936 - AIRPLANE
      ?AUTO_4937 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4935 ) ( AIRPORT ?AUTO_4934 ) ( AIRPLANE-AT ?AUTO_4936 ?AUTO_4935 ) ( not ( = ?AUTO_4935 ?AUTO_4934 ) ) ( TRUCK-AT ?AUTO_4937 ?AUTO_4935 ) ( IN-TRUCK ?AUTO_4933 ?AUTO_4937 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4933 ?AUTO_4937 ?AUTO_4935 )
      ( DELIVER-PKG ?AUTO_4933 ?AUTO_4934 )
      ( DELIVER-PKG-VERIFY ?AUTO_4933 ?AUTO_4934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4942 - OBJ
      ?AUTO_4943 - LOCATION
    )
    :vars
    (
      ?AUTO_4948 - LOCATION
      ?AUTO_4947 - AIRPLANE
      ?AUTO_4946 - TRUCK
      ?AUTO_4944 - LOCATION
      ?AUTO_4945 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4948 ) ( AIRPORT ?AUTO_4943 ) ( AIRPLANE-AT ?AUTO_4947 ?AUTO_4948 ) ( not ( = ?AUTO_4948 ?AUTO_4943 ) ) ( TRUCK-AT ?AUTO_4946 ?AUTO_4944 ) ( IN-CITY ?AUTO_4944 ?AUTO_4945 ) ( IN-CITY ?AUTO_4948 ?AUTO_4945 ) ( not ( = ?AUTO_4948 ?AUTO_4944 ) ) ( not ( = ?AUTO_4943 ?AUTO_4944 ) ) ( OBJ-AT ?AUTO_4942 ?AUTO_4944 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4942 ?AUTO_4946 ?AUTO_4944 )
      ( DELIVER-PKG ?AUTO_4942 ?AUTO_4943 )
      ( DELIVER-PKG-VERIFY ?AUTO_4942 ?AUTO_4943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4955 - OBJ
      ?AUTO_4956 - LOCATION
    )
    :vars
    (
      ?AUTO_4957 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4955 ?AUTO_4957 ) ( AIRPLANE-AT ?AUTO_4957 ?AUTO_4956 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4955 ?AUTO_4957 ?AUTO_4956 )
      ( DELIVER-PKG-VERIFY ?AUTO_4955 ?AUTO_4956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4964 - OBJ
      ?AUTO_4965 - LOCATION
    )
    :vars
    (
      ?AUTO_4967 - LOCATION
      ?AUTO_4966 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4967 ) ( AIRPORT ?AUTO_4965 ) ( AIRPLANE-AT ?AUTO_4966 ?AUTO_4967 ) ( not ( = ?AUTO_4967 ?AUTO_4965 ) ) ( OBJ-AT ?AUTO_4964 ?AUTO_4967 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4964 ?AUTO_4966 ?AUTO_4967 )
      ( DELIVER-PKG ?AUTO_4964 ?AUTO_4965 )
      ( DELIVER-PKG-VERIFY ?AUTO_4964 ?AUTO_4965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4968 - OBJ
      ?AUTO_4969 - LOCATION
    )
    :vars
    (
      ?AUTO_4970 - LOCATION
      ?AUTO_4972 - LOCATION
      ?AUTO_4971 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4970 ) ( AIRPORT ?AUTO_4969 ) ( not ( = ?AUTO_4970 ?AUTO_4969 ) ) ( OBJ-AT ?AUTO_4968 ?AUTO_4970 ) ( AIRPORT ?AUTO_4972 ) ( AIRPLANE-AT ?AUTO_4971 ?AUTO_4972 ) ( not ( = ?AUTO_4972 ?AUTO_4970 ) ) ( not ( = ?AUTO_4969 ?AUTO_4972 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4971 ?AUTO_4972 ?AUTO_4970 )
      ( DELIVER-PKG ?AUTO_4968 ?AUTO_4969 )
      ( DELIVER-PKG-VERIFY ?AUTO_4968 ?AUTO_4969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4991 - OBJ
      ?AUTO_4992 - LOCATION
    )
    :vars
    (
      ?AUTO_4993 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4993 ?AUTO_4992 ) ( IN-TRUCK ?AUTO_4991 ?AUTO_4993 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4991 ?AUTO_4993 ?AUTO_4992 )
      ( DELIVER-PKG-VERIFY ?AUTO_4991 ?AUTO_4992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4994 - OBJ
      ?AUTO_4995 - LOCATION
    )
    :vars
    (
      ?AUTO_4996 - TRUCK
      ?AUTO_4997 - LOCATION
      ?AUTO_4998 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4994 ?AUTO_4996 ) ( TRUCK-AT ?AUTO_4996 ?AUTO_4997 ) ( IN-CITY ?AUTO_4997 ?AUTO_4998 ) ( IN-CITY ?AUTO_4995 ?AUTO_4998 ) ( not ( = ?AUTO_4995 ?AUTO_4997 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4996 ?AUTO_4997 ?AUTO_4995 ?AUTO_4998 )
      ( DELIVER-PKG ?AUTO_4994 ?AUTO_4995 )
      ( DELIVER-PKG-VERIFY ?AUTO_4994 ?AUTO_4995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5001 - OBJ
      ?AUTO_5002 - LOCATION
    )
    :vars
    (
      ?AUTO_5003 - TRUCK
      ?AUTO_5005 - LOCATION
      ?AUTO_5004 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5003 ?AUTO_5005 ) ( IN-CITY ?AUTO_5005 ?AUTO_5004 ) ( IN-CITY ?AUTO_5002 ?AUTO_5004 ) ( not ( = ?AUTO_5002 ?AUTO_5005 ) ) ( OBJ-AT ?AUTO_5001 ?AUTO_5005 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5001 ?AUTO_5003 ?AUTO_5005 )
      ( DELIVER-PKG ?AUTO_5001 ?AUTO_5002 )
      ( DELIVER-PKG-VERIFY ?AUTO_5001 ?AUTO_5002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5006 - OBJ
      ?AUTO_5007 - LOCATION
    )
    :vars
    (
      ?AUTO_5009 - LOCATION
      ?AUTO_5010 - CITY
      ?AUTO_5008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5009 ?AUTO_5010 ) ( IN-CITY ?AUTO_5007 ?AUTO_5010 ) ( not ( = ?AUTO_5007 ?AUTO_5009 ) ) ( OBJ-AT ?AUTO_5006 ?AUTO_5009 ) ( TRUCK-AT ?AUTO_5008 ?AUTO_5007 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5008 ?AUTO_5007 ?AUTO_5009 ?AUTO_5010 )
      ( DELIVER-PKG ?AUTO_5006 ?AUTO_5007 )
      ( DELIVER-PKG-VERIFY ?AUTO_5006 ?AUTO_5007 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5015 - OBJ
      ?AUTO_5016 - LOCATION
    )
    :vars
    (
      ?AUTO_5018 - LOCATION
      ?AUTO_5019 - CITY
      ?AUTO_5017 - TRUCK
      ?AUTO_5020 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5018 ?AUTO_5019 ) ( IN-CITY ?AUTO_5016 ?AUTO_5019 ) ( not ( = ?AUTO_5016 ?AUTO_5018 ) ) ( TRUCK-AT ?AUTO_5017 ?AUTO_5016 ) ( IN-AIRPLANE ?AUTO_5015 ?AUTO_5020 ) ( AIRPLANE-AT ?AUTO_5020 ?AUTO_5018 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5015 ?AUTO_5020 ?AUTO_5018 )
      ( DELIVER-PKG ?AUTO_5015 ?AUTO_5016 )
      ( DELIVER-PKG-VERIFY ?AUTO_5015 ?AUTO_5016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5021 - OBJ
      ?AUTO_5022 - LOCATION
    )
    :vars
    (
      ?AUTO_5023 - LOCATION
      ?AUTO_5024 - CITY
      ?AUTO_5025 - TRUCK
      ?AUTO_5026 - AIRPLANE
      ?AUTO_5027 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5023 ?AUTO_5024 ) ( IN-CITY ?AUTO_5022 ?AUTO_5024 ) ( not ( = ?AUTO_5022 ?AUTO_5023 ) ) ( TRUCK-AT ?AUTO_5025 ?AUTO_5022 ) ( IN-AIRPLANE ?AUTO_5021 ?AUTO_5026 ) ( AIRPORT ?AUTO_5027 ) ( AIRPORT ?AUTO_5023 ) ( AIRPLANE-AT ?AUTO_5026 ?AUTO_5027 ) ( not ( = ?AUTO_5027 ?AUTO_5023 ) ) ( not ( = ?AUTO_5022 ?AUTO_5027 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5026 ?AUTO_5027 ?AUTO_5023 )
      ( DELIVER-PKG ?AUTO_5021 ?AUTO_5022 )
      ( DELIVER-PKG-VERIFY ?AUTO_5021 ?AUTO_5022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5034 - OBJ
      ?AUTO_5035 - LOCATION
    )
    :vars
    (
      ?AUTO_5040 - LOCATION
      ?AUTO_5038 - CITY
      ?AUTO_5039 - TRUCK
      ?AUTO_5036 - LOCATION
      ?AUTO_5037 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5040 ?AUTO_5038 ) ( IN-CITY ?AUTO_5035 ?AUTO_5038 ) ( not ( = ?AUTO_5035 ?AUTO_5040 ) ) ( TRUCK-AT ?AUTO_5039 ?AUTO_5035 ) ( AIRPORT ?AUTO_5036 ) ( AIRPORT ?AUTO_5040 ) ( AIRPLANE-AT ?AUTO_5037 ?AUTO_5036 ) ( not ( = ?AUTO_5036 ?AUTO_5040 ) ) ( not ( = ?AUTO_5035 ?AUTO_5036 ) ) ( OBJ-AT ?AUTO_5034 ?AUTO_5036 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5034 ?AUTO_5037 ?AUTO_5036 )
      ( DELIVER-PKG ?AUTO_5034 ?AUTO_5035 )
      ( DELIVER-PKG-VERIFY ?AUTO_5034 ?AUTO_5035 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5043 - OBJ
      ?AUTO_5044 - LOCATION
    )
    :vars
    (
      ?AUTO_5045 - LOCATION
      ?AUTO_5049 - CITY
      ?AUTO_5048 - TRUCK
      ?AUTO_5047 - LOCATION
      ?AUTO_5046 - AIRPLANE
      ?AUTO_5050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5045 ?AUTO_5049 ) ( IN-CITY ?AUTO_5044 ?AUTO_5049 ) ( not ( = ?AUTO_5044 ?AUTO_5045 ) ) ( TRUCK-AT ?AUTO_5048 ?AUTO_5044 ) ( AIRPORT ?AUTO_5047 ) ( AIRPORT ?AUTO_5045 ) ( AIRPLANE-AT ?AUTO_5046 ?AUTO_5047 ) ( not ( = ?AUTO_5047 ?AUTO_5045 ) ) ( not ( = ?AUTO_5044 ?AUTO_5047 ) ) ( TRUCK-AT ?AUTO_5050 ?AUTO_5047 ) ( IN-TRUCK ?AUTO_5043 ?AUTO_5050 ) ( not ( = ?AUTO_5048 ?AUTO_5050 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5043 ?AUTO_5050 ?AUTO_5047 )
      ( DELIVER-PKG ?AUTO_5043 ?AUTO_5044 )
      ( DELIVER-PKG-VERIFY ?AUTO_5043 ?AUTO_5044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5051 - OBJ
      ?AUTO_5052 - LOCATION
    )
    :vars
    (
      ?AUTO_5054 - LOCATION
      ?AUTO_5056 - CITY
      ?AUTO_5055 - TRUCK
      ?AUTO_5057 - LOCATION
      ?AUTO_5053 - AIRPLANE
      ?AUTO_5058 - TRUCK
      ?AUTO_5059 - LOCATION
      ?AUTO_5060 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5054 ?AUTO_5056 ) ( IN-CITY ?AUTO_5052 ?AUTO_5056 ) ( not ( = ?AUTO_5052 ?AUTO_5054 ) ) ( TRUCK-AT ?AUTO_5055 ?AUTO_5052 ) ( AIRPORT ?AUTO_5057 ) ( AIRPORT ?AUTO_5054 ) ( AIRPLANE-AT ?AUTO_5053 ?AUTO_5057 ) ( not ( = ?AUTO_5057 ?AUTO_5054 ) ) ( not ( = ?AUTO_5052 ?AUTO_5057 ) ) ( IN-TRUCK ?AUTO_5051 ?AUTO_5058 ) ( not ( = ?AUTO_5055 ?AUTO_5058 ) ) ( TRUCK-AT ?AUTO_5058 ?AUTO_5059 ) ( IN-CITY ?AUTO_5059 ?AUTO_5060 ) ( IN-CITY ?AUTO_5057 ?AUTO_5060 ) ( not ( = ?AUTO_5057 ?AUTO_5059 ) ) ( not ( = ?AUTO_5052 ?AUTO_5059 ) ) ( not ( = ?AUTO_5054 ?AUTO_5059 ) ) ( not ( = ?AUTO_5056 ?AUTO_5060 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5058 ?AUTO_5059 ?AUTO_5057 ?AUTO_5060 )
      ( DELIVER-PKG ?AUTO_5051 ?AUTO_5052 )
      ( DELIVER-PKG-VERIFY ?AUTO_5051 ?AUTO_5052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5063 - OBJ
      ?AUTO_5064 - LOCATION
    )
    :vars
    (
      ?AUTO_5071 - LOCATION
      ?AUTO_5067 - CITY
      ?AUTO_5069 - TRUCK
      ?AUTO_5072 - LOCATION
      ?AUTO_5066 - AIRPLANE
      ?AUTO_5070 - TRUCK
      ?AUTO_5068 - LOCATION
      ?AUTO_5065 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5071 ?AUTO_5067 ) ( IN-CITY ?AUTO_5064 ?AUTO_5067 ) ( not ( = ?AUTO_5064 ?AUTO_5071 ) ) ( TRUCK-AT ?AUTO_5069 ?AUTO_5064 ) ( AIRPORT ?AUTO_5072 ) ( AIRPORT ?AUTO_5071 ) ( AIRPLANE-AT ?AUTO_5066 ?AUTO_5072 ) ( not ( = ?AUTO_5072 ?AUTO_5071 ) ) ( not ( = ?AUTO_5064 ?AUTO_5072 ) ) ( not ( = ?AUTO_5069 ?AUTO_5070 ) ) ( TRUCK-AT ?AUTO_5070 ?AUTO_5068 ) ( IN-CITY ?AUTO_5068 ?AUTO_5065 ) ( IN-CITY ?AUTO_5072 ?AUTO_5065 ) ( not ( = ?AUTO_5072 ?AUTO_5068 ) ) ( not ( = ?AUTO_5064 ?AUTO_5068 ) ) ( not ( = ?AUTO_5071 ?AUTO_5068 ) ) ( not ( = ?AUTO_5067 ?AUTO_5065 ) ) ( OBJ-AT ?AUTO_5063 ?AUTO_5068 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5063 ?AUTO_5070 ?AUTO_5068 )
      ( DELIVER-PKG ?AUTO_5063 ?AUTO_5064 )
      ( DELIVER-PKG-VERIFY ?AUTO_5063 ?AUTO_5064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5073 - OBJ
      ?AUTO_5074 - LOCATION
    )
    :vars
    (
      ?AUTO_5079 - LOCATION
      ?AUTO_5077 - CITY
      ?AUTO_5082 - TRUCK
      ?AUTO_5078 - LOCATION
      ?AUTO_5081 - AIRPLANE
      ?AUTO_5080 - TRUCK
      ?AUTO_5076 - LOCATION
      ?AUTO_5075 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5079 ?AUTO_5077 ) ( IN-CITY ?AUTO_5074 ?AUTO_5077 ) ( not ( = ?AUTO_5074 ?AUTO_5079 ) ) ( TRUCK-AT ?AUTO_5082 ?AUTO_5074 ) ( AIRPORT ?AUTO_5078 ) ( AIRPORT ?AUTO_5079 ) ( AIRPLANE-AT ?AUTO_5081 ?AUTO_5078 ) ( not ( = ?AUTO_5078 ?AUTO_5079 ) ) ( not ( = ?AUTO_5074 ?AUTO_5078 ) ) ( not ( = ?AUTO_5082 ?AUTO_5080 ) ) ( IN-CITY ?AUTO_5076 ?AUTO_5075 ) ( IN-CITY ?AUTO_5078 ?AUTO_5075 ) ( not ( = ?AUTO_5078 ?AUTO_5076 ) ) ( not ( = ?AUTO_5074 ?AUTO_5076 ) ) ( not ( = ?AUTO_5079 ?AUTO_5076 ) ) ( not ( = ?AUTO_5077 ?AUTO_5075 ) ) ( OBJ-AT ?AUTO_5073 ?AUTO_5076 ) ( TRUCK-AT ?AUTO_5080 ?AUTO_5078 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5080 ?AUTO_5078 ?AUTO_5076 ?AUTO_5075 )
      ( DELIVER-PKG ?AUTO_5073 ?AUTO_5074 )
      ( DELIVER-PKG-VERIFY ?AUTO_5073 ?AUTO_5074 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5085 - OBJ
      ?AUTO_5086 - LOCATION
    )
    :vars
    (
      ?AUTO_5087 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5087 ?AUTO_5086 ) ( IN-TRUCK ?AUTO_5085 ?AUTO_5087 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5085 ?AUTO_5087 ?AUTO_5086 )
      ( DELIVER-PKG-VERIFY ?AUTO_5085 ?AUTO_5086 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5088 - OBJ
      ?AUTO_5089 - LOCATION
    )
    :vars
    (
      ?AUTO_5090 - TRUCK
      ?AUTO_5091 - LOCATION
      ?AUTO_5092 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5088 ?AUTO_5090 ) ( TRUCK-AT ?AUTO_5090 ?AUTO_5091 ) ( IN-CITY ?AUTO_5091 ?AUTO_5092 ) ( IN-CITY ?AUTO_5089 ?AUTO_5092 ) ( not ( = ?AUTO_5089 ?AUTO_5091 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5090 ?AUTO_5091 ?AUTO_5089 ?AUTO_5092 )
      ( DELIVER-PKG ?AUTO_5088 ?AUTO_5089 )
      ( DELIVER-PKG-VERIFY ?AUTO_5088 ?AUTO_5089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5097 - OBJ
      ?AUTO_5098 - LOCATION
    )
    :vars
    (
      ?AUTO_5101 - TRUCK
      ?AUTO_5099 - LOCATION
      ?AUTO_5100 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5101 ?AUTO_5099 ) ( IN-CITY ?AUTO_5099 ?AUTO_5100 ) ( IN-CITY ?AUTO_5098 ?AUTO_5100 ) ( not ( = ?AUTO_5098 ?AUTO_5099 ) ) ( OBJ-AT ?AUTO_5097 ?AUTO_5099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5097 ?AUTO_5101 ?AUTO_5099 )
      ( DELIVER-PKG ?AUTO_5097 ?AUTO_5098 )
      ( DELIVER-PKG-VERIFY ?AUTO_5097 ?AUTO_5098 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5104 - OBJ
      ?AUTO_5105 - LOCATION
    )
    :vars
    (
      ?AUTO_5107 - LOCATION
      ?AUTO_5108 - CITY
      ?AUTO_5106 - TRUCK
      ?AUTO_5109 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5107 ?AUTO_5108 ) ( IN-CITY ?AUTO_5105 ?AUTO_5108 ) ( not ( = ?AUTO_5105 ?AUTO_5107 ) ) ( OBJ-AT ?AUTO_5104 ?AUTO_5107 ) ( TRUCK-AT ?AUTO_5106 ?AUTO_5109 ) ( IN-CITY ?AUTO_5109 ?AUTO_5108 ) ( not ( = ?AUTO_5107 ?AUTO_5109 ) ) ( not ( = ?AUTO_5105 ?AUTO_5109 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5106 ?AUTO_5109 ?AUTO_5107 ?AUTO_5108 )
      ( DELIVER-PKG ?AUTO_5104 ?AUTO_5105 )
      ( DELIVER-PKG-VERIFY ?AUTO_5104 ?AUTO_5105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5112 - OBJ
      ?AUTO_5113 - LOCATION
    )
    :vars
    (
      ?AUTO_5116 - LOCATION
      ?AUTO_5114 - CITY
      ?AUTO_5117 - TRUCK
      ?AUTO_5115 - LOCATION
      ?AUTO_5118 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5116 ?AUTO_5114 ) ( IN-CITY ?AUTO_5113 ?AUTO_5114 ) ( not ( = ?AUTO_5113 ?AUTO_5116 ) ) ( TRUCK-AT ?AUTO_5117 ?AUTO_5115 ) ( IN-CITY ?AUTO_5115 ?AUTO_5114 ) ( not ( = ?AUTO_5116 ?AUTO_5115 ) ) ( not ( = ?AUTO_5113 ?AUTO_5115 ) ) ( IN-AIRPLANE ?AUTO_5112 ?AUTO_5118 ) ( AIRPLANE-AT ?AUTO_5118 ?AUTO_5116 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5112 ?AUTO_5118 ?AUTO_5116 )
      ( DELIVER-PKG ?AUTO_5112 ?AUTO_5113 )
      ( DELIVER-PKG-VERIFY ?AUTO_5112 ?AUTO_5113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5121 - OBJ
      ?AUTO_5122 - LOCATION
    )
    :vars
    (
      ?AUTO_5124 - LOCATION
      ?AUTO_5127 - CITY
      ?AUTO_5125 - TRUCK
      ?AUTO_5123 - LOCATION
      ?AUTO_5126 - AIRPLANE
      ?AUTO_5128 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5124 ?AUTO_5127 ) ( IN-CITY ?AUTO_5122 ?AUTO_5127 ) ( not ( = ?AUTO_5122 ?AUTO_5124 ) ) ( TRUCK-AT ?AUTO_5125 ?AUTO_5123 ) ( IN-CITY ?AUTO_5123 ?AUTO_5127 ) ( not ( = ?AUTO_5124 ?AUTO_5123 ) ) ( not ( = ?AUTO_5122 ?AUTO_5123 ) ) ( IN-AIRPLANE ?AUTO_5121 ?AUTO_5126 ) ( AIRPORT ?AUTO_5128 ) ( AIRPORT ?AUTO_5124 ) ( AIRPLANE-AT ?AUTO_5126 ?AUTO_5128 ) ( not ( = ?AUTO_5128 ?AUTO_5124 ) ) ( not ( = ?AUTO_5122 ?AUTO_5128 ) ) ( not ( = ?AUTO_5123 ?AUTO_5128 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5126 ?AUTO_5128 ?AUTO_5124 )
      ( DELIVER-PKG ?AUTO_5121 ?AUTO_5122 )
      ( DELIVER-PKG-VERIFY ?AUTO_5121 ?AUTO_5122 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5133 - OBJ
      ?AUTO_5134 - LOCATION
    )
    :vars
    (
      ?AUTO_5136 - LOCATION
      ?AUTO_5135 - CITY
      ?AUTO_5139 - TRUCK
      ?AUTO_5137 - LOCATION
      ?AUTO_5138 - LOCATION
      ?AUTO_5140 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5136 ?AUTO_5135 ) ( IN-CITY ?AUTO_5134 ?AUTO_5135 ) ( not ( = ?AUTO_5134 ?AUTO_5136 ) ) ( TRUCK-AT ?AUTO_5139 ?AUTO_5137 ) ( IN-CITY ?AUTO_5137 ?AUTO_5135 ) ( not ( = ?AUTO_5136 ?AUTO_5137 ) ) ( not ( = ?AUTO_5134 ?AUTO_5137 ) ) ( AIRPORT ?AUTO_5138 ) ( AIRPORT ?AUTO_5136 ) ( AIRPLANE-AT ?AUTO_5140 ?AUTO_5138 ) ( not ( = ?AUTO_5138 ?AUTO_5136 ) ) ( not ( = ?AUTO_5134 ?AUTO_5138 ) ) ( not ( = ?AUTO_5137 ?AUTO_5138 ) ) ( OBJ-AT ?AUTO_5133 ?AUTO_5138 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5133 ?AUTO_5140 ?AUTO_5138 )
      ( DELIVER-PKG ?AUTO_5133 ?AUTO_5134 )
      ( DELIVER-PKG-VERIFY ?AUTO_5133 ?AUTO_5134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5143 - OBJ
      ?AUTO_5144 - LOCATION
    )
    :vars
    (
      ?AUTO_5145 - LOCATION
      ?AUTO_5148 - CITY
      ?AUTO_5149 - TRUCK
      ?AUTO_5147 - LOCATION
      ?AUTO_5146 - LOCATION
      ?AUTO_5150 - AIRPLANE
      ?AUTO_5151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5145 ?AUTO_5148 ) ( IN-CITY ?AUTO_5144 ?AUTO_5148 ) ( not ( = ?AUTO_5144 ?AUTO_5145 ) ) ( TRUCK-AT ?AUTO_5149 ?AUTO_5147 ) ( IN-CITY ?AUTO_5147 ?AUTO_5148 ) ( not ( = ?AUTO_5145 ?AUTO_5147 ) ) ( not ( = ?AUTO_5144 ?AUTO_5147 ) ) ( AIRPORT ?AUTO_5146 ) ( AIRPORT ?AUTO_5145 ) ( AIRPLANE-AT ?AUTO_5150 ?AUTO_5146 ) ( not ( = ?AUTO_5146 ?AUTO_5145 ) ) ( not ( = ?AUTO_5144 ?AUTO_5146 ) ) ( not ( = ?AUTO_5147 ?AUTO_5146 ) ) ( TRUCK-AT ?AUTO_5151 ?AUTO_5146 ) ( IN-TRUCK ?AUTO_5143 ?AUTO_5151 ) ( not ( = ?AUTO_5149 ?AUTO_5151 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5143 ?AUTO_5151 ?AUTO_5146 )
      ( DELIVER-PKG ?AUTO_5143 ?AUTO_5144 )
      ( DELIVER-PKG-VERIFY ?AUTO_5143 ?AUTO_5144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5154 - OBJ
      ?AUTO_5155 - LOCATION
    )
    :vars
    (
      ?AUTO_5157 - LOCATION
      ?AUTO_5159 - CITY
      ?AUTO_5160 - TRUCK
      ?AUTO_5158 - LOCATION
      ?AUTO_5162 - LOCATION
      ?AUTO_5156 - AIRPLANE
      ?AUTO_5161 - TRUCK
      ?AUTO_5163 - LOCATION
      ?AUTO_5164 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5157 ?AUTO_5159 ) ( IN-CITY ?AUTO_5155 ?AUTO_5159 ) ( not ( = ?AUTO_5155 ?AUTO_5157 ) ) ( TRUCK-AT ?AUTO_5160 ?AUTO_5158 ) ( IN-CITY ?AUTO_5158 ?AUTO_5159 ) ( not ( = ?AUTO_5157 ?AUTO_5158 ) ) ( not ( = ?AUTO_5155 ?AUTO_5158 ) ) ( AIRPORT ?AUTO_5162 ) ( AIRPORT ?AUTO_5157 ) ( AIRPLANE-AT ?AUTO_5156 ?AUTO_5162 ) ( not ( = ?AUTO_5162 ?AUTO_5157 ) ) ( not ( = ?AUTO_5155 ?AUTO_5162 ) ) ( not ( = ?AUTO_5158 ?AUTO_5162 ) ) ( IN-TRUCK ?AUTO_5154 ?AUTO_5161 ) ( not ( = ?AUTO_5160 ?AUTO_5161 ) ) ( TRUCK-AT ?AUTO_5161 ?AUTO_5163 ) ( IN-CITY ?AUTO_5163 ?AUTO_5164 ) ( IN-CITY ?AUTO_5162 ?AUTO_5164 ) ( not ( = ?AUTO_5162 ?AUTO_5163 ) ) ( not ( = ?AUTO_5155 ?AUTO_5163 ) ) ( not ( = ?AUTO_5157 ?AUTO_5163 ) ) ( not ( = ?AUTO_5159 ?AUTO_5164 ) ) ( not ( = ?AUTO_5158 ?AUTO_5163 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5161 ?AUTO_5163 ?AUTO_5162 ?AUTO_5164 )
      ( DELIVER-PKG ?AUTO_5154 ?AUTO_5155 )
      ( DELIVER-PKG-VERIFY ?AUTO_5154 ?AUTO_5155 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5165 - OBJ
      ?AUTO_5166 - LOCATION
    )
    :vars
    (
      ?AUTO_5168 - LOCATION
      ?AUTO_5170 - CITY
      ?AUTO_5174 - TRUCK
      ?AUTO_5171 - LOCATION
      ?AUTO_5172 - LOCATION
      ?AUTO_5169 - AIRPLANE
      ?AUTO_5173 - TRUCK
      ?AUTO_5167 - LOCATION
      ?AUTO_5175 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5168 ?AUTO_5170 ) ( IN-CITY ?AUTO_5166 ?AUTO_5170 ) ( not ( = ?AUTO_5166 ?AUTO_5168 ) ) ( TRUCK-AT ?AUTO_5174 ?AUTO_5171 ) ( IN-CITY ?AUTO_5171 ?AUTO_5170 ) ( not ( = ?AUTO_5168 ?AUTO_5171 ) ) ( not ( = ?AUTO_5166 ?AUTO_5171 ) ) ( AIRPORT ?AUTO_5172 ) ( AIRPORT ?AUTO_5168 ) ( AIRPLANE-AT ?AUTO_5169 ?AUTO_5172 ) ( not ( = ?AUTO_5172 ?AUTO_5168 ) ) ( not ( = ?AUTO_5166 ?AUTO_5172 ) ) ( not ( = ?AUTO_5171 ?AUTO_5172 ) ) ( not ( = ?AUTO_5174 ?AUTO_5173 ) ) ( TRUCK-AT ?AUTO_5173 ?AUTO_5167 ) ( IN-CITY ?AUTO_5167 ?AUTO_5175 ) ( IN-CITY ?AUTO_5172 ?AUTO_5175 ) ( not ( = ?AUTO_5172 ?AUTO_5167 ) ) ( not ( = ?AUTO_5166 ?AUTO_5167 ) ) ( not ( = ?AUTO_5168 ?AUTO_5167 ) ) ( not ( = ?AUTO_5170 ?AUTO_5175 ) ) ( not ( = ?AUTO_5171 ?AUTO_5167 ) ) ( OBJ-AT ?AUTO_5165 ?AUTO_5167 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5165 ?AUTO_5173 ?AUTO_5167 )
      ( DELIVER-PKG ?AUTO_5165 ?AUTO_5166 )
      ( DELIVER-PKG-VERIFY ?AUTO_5165 ?AUTO_5166 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5178 - OBJ
      ?AUTO_5179 - LOCATION
    )
    :vars
    (
      ?AUTO_5183 - LOCATION
      ?AUTO_5180 - CITY
      ?AUTO_5186 - TRUCK
      ?AUTO_5188 - LOCATION
      ?AUTO_5182 - LOCATION
      ?AUTO_5181 - AIRPLANE
      ?AUTO_5185 - TRUCK
      ?AUTO_5184 - LOCATION
      ?AUTO_5187 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5183 ?AUTO_5180 ) ( IN-CITY ?AUTO_5179 ?AUTO_5180 ) ( not ( = ?AUTO_5179 ?AUTO_5183 ) ) ( TRUCK-AT ?AUTO_5186 ?AUTO_5188 ) ( IN-CITY ?AUTO_5188 ?AUTO_5180 ) ( not ( = ?AUTO_5183 ?AUTO_5188 ) ) ( not ( = ?AUTO_5179 ?AUTO_5188 ) ) ( AIRPORT ?AUTO_5182 ) ( AIRPORT ?AUTO_5183 ) ( AIRPLANE-AT ?AUTO_5181 ?AUTO_5182 ) ( not ( = ?AUTO_5182 ?AUTO_5183 ) ) ( not ( = ?AUTO_5179 ?AUTO_5182 ) ) ( not ( = ?AUTO_5188 ?AUTO_5182 ) ) ( not ( = ?AUTO_5186 ?AUTO_5185 ) ) ( IN-CITY ?AUTO_5184 ?AUTO_5187 ) ( IN-CITY ?AUTO_5182 ?AUTO_5187 ) ( not ( = ?AUTO_5182 ?AUTO_5184 ) ) ( not ( = ?AUTO_5179 ?AUTO_5184 ) ) ( not ( = ?AUTO_5183 ?AUTO_5184 ) ) ( not ( = ?AUTO_5180 ?AUTO_5187 ) ) ( not ( = ?AUTO_5188 ?AUTO_5184 ) ) ( OBJ-AT ?AUTO_5178 ?AUTO_5184 ) ( TRUCK-AT ?AUTO_5185 ?AUTO_5182 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5185 ?AUTO_5182 ?AUTO_5184 ?AUTO_5187 )
      ( DELIVER-PKG ?AUTO_5178 ?AUTO_5179 )
      ( DELIVER-PKG-VERIFY ?AUTO_5178 ?AUTO_5179 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5191 - OBJ
      ?AUTO_5192 - LOCATION
    )
    :vars
    (
      ?AUTO_5193 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5193 ?AUTO_5192 ) ( IN-TRUCK ?AUTO_5191 ?AUTO_5193 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5191 ?AUTO_5193 ?AUTO_5192 )
      ( DELIVER-PKG-VERIFY ?AUTO_5191 ?AUTO_5192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5194 - OBJ
      ?AUTO_5195 - LOCATION
    )
    :vars
    (
      ?AUTO_5196 - TRUCK
      ?AUTO_5197 - LOCATION
      ?AUTO_5198 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5194 ?AUTO_5196 ) ( TRUCK-AT ?AUTO_5196 ?AUTO_5197 ) ( IN-CITY ?AUTO_5197 ?AUTO_5198 ) ( IN-CITY ?AUTO_5195 ?AUTO_5198 ) ( not ( = ?AUTO_5195 ?AUTO_5197 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5196 ?AUTO_5197 ?AUTO_5195 ?AUTO_5198 )
      ( DELIVER-PKG ?AUTO_5194 ?AUTO_5195 )
      ( DELIVER-PKG-VERIFY ?AUTO_5194 ?AUTO_5195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5199 - OBJ
      ?AUTO_5200 - LOCATION
    )
    :vars
    (
      ?AUTO_5201 - TRUCK
      ?AUTO_5202 - LOCATION
      ?AUTO_5203 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5201 ?AUTO_5202 ) ( IN-CITY ?AUTO_5202 ?AUTO_5203 ) ( IN-CITY ?AUTO_5200 ?AUTO_5203 ) ( not ( = ?AUTO_5200 ?AUTO_5202 ) ) ( OBJ-AT ?AUTO_5199 ?AUTO_5202 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5199 ?AUTO_5201 ?AUTO_5202 )
      ( DELIVER-PKG ?AUTO_5199 ?AUTO_5200 )
      ( DELIVER-PKG-VERIFY ?AUTO_5199 ?AUTO_5200 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5204 - OBJ
      ?AUTO_5205 - LOCATION
    )
    :vars
    (
      ?AUTO_5206 - LOCATION
      ?AUTO_5208 - CITY
      ?AUTO_5207 - TRUCK
      ?AUTO_5209 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5206 ?AUTO_5208 ) ( IN-CITY ?AUTO_5205 ?AUTO_5208 ) ( not ( = ?AUTO_5205 ?AUTO_5206 ) ) ( OBJ-AT ?AUTO_5204 ?AUTO_5206 ) ( TRUCK-AT ?AUTO_5207 ?AUTO_5209 ) ( IN-CITY ?AUTO_5209 ?AUTO_5208 ) ( not ( = ?AUTO_5206 ?AUTO_5209 ) ) ( not ( = ?AUTO_5205 ?AUTO_5209 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5207 ?AUTO_5209 ?AUTO_5206 ?AUTO_5208 )
      ( DELIVER-PKG ?AUTO_5204 ?AUTO_5205 )
      ( DELIVER-PKG-VERIFY ?AUTO_5204 ?AUTO_5205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5212 - OBJ
      ?AUTO_5213 - LOCATION
    )
    :vars
    (
      ?AUTO_5214 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5212 ?AUTO_5214 ) ( AIRPLANE-AT ?AUTO_5214 ?AUTO_5213 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5212 ?AUTO_5214 ?AUTO_5213 )
      ( DELIVER-PKG-VERIFY ?AUTO_5212 ?AUTO_5213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5215 - OBJ
      ?AUTO_5216 - LOCATION
    )
    :vars
    (
      ?AUTO_5217 - AIRPLANE
      ?AUTO_5218 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5215 ?AUTO_5217 ) ( AIRPORT ?AUTO_5218 ) ( AIRPORT ?AUTO_5216 ) ( AIRPLANE-AT ?AUTO_5217 ?AUTO_5218 ) ( not ( = ?AUTO_5218 ?AUTO_5216 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5217 ?AUTO_5218 ?AUTO_5216 )
      ( DELIVER-PKG ?AUTO_5215 ?AUTO_5216 )
      ( DELIVER-PKG-VERIFY ?AUTO_5215 ?AUTO_5216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5219 - OBJ
      ?AUTO_5220 - LOCATION
    )
    :vars
    (
      ?AUTO_5222 - LOCATION
      ?AUTO_5221 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5222 ) ( AIRPORT ?AUTO_5220 ) ( AIRPLANE-AT ?AUTO_5221 ?AUTO_5222 ) ( not ( = ?AUTO_5222 ?AUTO_5220 ) ) ( OBJ-AT ?AUTO_5219 ?AUTO_5222 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5219 ?AUTO_5221 ?AUTO_5222 )
      ( DELIVER-PKG ?AUTO_5219 ?AUTO_5220 )
      ( DELIVER-PKG-VERIFY ?AUTO_5219 ?AUTO_5220 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5223 - OBJ
      ?AUTO_5224 - LOCATION
    )
    :vars
    (
      ?AUTO_5226 - LOCATION
      ?AUTO_5227 - LOCATION
      ?AUTO_5225 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5226 ) ( AIRPORT ?AUTO_5224 ) ( not ( = ?AUTO_5226 ?AUTO_5224 ) ) ( OBJ-AT ?AUTO_5223 ?AUTO_5226 ) ( AIRPORT ?AUTO_5227 ) ( AIRPLANE-AT ?AUTO_5225 ?AUTO_5227 ) ( not ( = ?AUTO_5227 ?AUTO_5226 ) ) ( not ( = ?AUTO_5224 ?AUTO_5227 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5225 ?AUTO_5227 ?AUTO_5226 )
      ( DELIVER-PKG ?AUTO_5223 ?AUTO_5224 )
      ( DELIVER-PKG-VERIFY ?AUTO_5223 ?AUTO_5224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5228 - OBJ
      ?AUTO_5229 - LOCATION
    )
    :vars
    (
      ?AUTO_5230 - LOCATION
      ?AUTO_5232 - LOCATION
      ?AUTO_5231 - AIRPLANE
      ?AUTO_5233 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5230 ) ( AIRPORT ?AUTO_5229 ) ( not ( = ?AUTO_5230 ?AUTO_5229 ) ) ( AIRPORT ?AUTO_5232 ) ( AIRPLANE-AT ?AUTO_5231 ?AUTO_5232 ) ( not ( = ?AUTO_5232 ?AUTO_5230 ) ) ( not ( = ?AUTO_5229 ?AUTO_5232 ) ) ( TRUCK-AT ?AUTO_5233 ?AUTO_5230 ) ( IN-TRUCK ?AUTO_5228 ?AUTO_5233 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5228 ?AUTO_5233 ?AUTO_5230 )
      ( DELIVER-PKG ?AUTO_5228 ?AUTO_5229 )
      ( DELIVER-PKG-VERIFY ?AUTO_5228 ?AUTO_5229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5234 - OBJ
      ?AUTO_5235 - LOCATION
    )
    :vars
    (
      ?AUTO_5236 - LOCATION
      ?AUTO_5238 - LOCATION
      ?AUTO_5237 - AIRPLANE
      ?AUTO_5239 - TRUCK
      ?AUTO_5240 - LOCATION
      ?AUTO_5241 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5236 ) ( AIRPORT ?AUTO_5235 ) ( not ( = ?AUTO_5236 ?AUTO_5235 ) ) ( AIRPORT ?AUTO_5238 ) ( AIRPLANE-AT ?AUTO_5237 ?AUTO_5238 ) ( not ( = ?AUTO_5238 ?AUTO_5236 ) ) ( not ( = ?AUTO_5235 ?AUTO_5238 ) ) ( IN-TRUCK ?AUTO_5234 ?AUTO_5239 ) ( TRUCK-AT ?AUTO_5239 ?AUTO_5240 ) ( IN-CITY ?AUTO_5240 ?AUTO_5241 ) ( IN-CITY ?AUTO_5236 ?AUTO_5241 ) ( not ( = ?AUTO_5236 ?AUTO_5240 ) ) ( not ( = ?AUTO_5235 ?AUTO_5240 ) ) ( not ( = ?AUTO_5238 ?AUTO_5240 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5239 ?AUTO_5240 ?AUTO_5236 ?AUTO_5241 )
      ( DELIVER-PKG ?AUTO_5234 ?AUTO_5235 )
      ( DELIVER-PKG-VERIFY ?AUTO_5234 ?AUTO_5235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5242 - OBJ
      ?AUTO_5243 - LOCATION
    )
    :vars
    (
      ?AUTO_5248 - LOCATION
      ?AUTO_5249 - LOCATION
      ?AUTO_5244 - AIRPLANE
      ?AUTO_5247 - TRUCK
      ?AUTO_5245 - LOCATION
      ?AUTO_5246 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5248 ) ( AIRPORT ?AUTO_5243 ) ( not ( = ?AUTO_5248 ?AUTO_5243 ) ) ( AIRPORT ?AUTO_5249 ) ( AIRPLANE-AT ?AUTO_5244 ?AUTO_5249 ) ( not ( = ?AUTO_5249 ?AUTO_5248 ) ) ( not ( = ?AUTO_5243 ?AUTO_5249 ) ) ( TRUCK-AT ?AUTO_5247 ?AUTO_5245 ) ( IN-CITY ?AUTO_5245 ?AUTO_5246 ) ( IN-CITY ?AUTO_5248 ?AUTO_5246 ) ( not ( = ?AUTO_5248 ?AUTO_5245 ) ) ( not ( = ?AUTO_5243 ?AUTO_5245 ) ) ( not ( = ?AUTO_5249 ?AUTO_5245 ) ) ( OBJ-AT ?AUTO_5242 ?AUTO_5245 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5242 ?AUTO_5247 ?AUTO_5245 )
      ( DELIVER-PKG ?AUTO_5242 ?AUTO_5243 )
      ( DELIVER-PKG-VERIFY ?AUTO_5242 ?AUTO_5243 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5250 - OBJ
      ?AUTO_5251 - LOCATION
    )
    :vars
    (
      ?AUTO_5254 - LOCATION
      ?AUTO_5255 - LOCATION
      ?AUTO_5252 - AIRPLANE
      ?AUTO_5253 - LOCATION
      ?AUTO_5256 - CITY
      ?AUTO_5257 - TRUCK
      ?AUTO_5258 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5254 ) ( AIRPORT ?AUTO_5251 ) ( not ( = ?AUTO_5254 ?AUTO_5251 ) ) ( AIRPORT ?AUTO_5255 ) ( AIRPLANE-AT ?AUTO_5252 ?AUTO_5255 ) ( not ( = ?AUTO_5255 ?AUTO_5254 ) ) ( not ( = ?AUTO_5251 ?AUTO_5255 ) ) ( IN-CITY ?AUTO_5253 ?AUTO_5256 ) ( IN-CITY ?AUTO_5254 ?AUTO_5256 ) ( not ( = ?AUTO_5254 ?AUTO_5253 ) ) ( not ( = ?AUTO_5251 ?AUTO_5253 ) ) ( not ( = ?AUTO_5255 ?AUTO_5253 ) ) ( OBJ-AT ?AUTO_5250 ?AUTO_5253 ) ( TRUCK-AT ?AUTO_5257 ?AUTO_5258 ) ( IN-CITY ?AUTO_5258 ?AUTO_5256 ) ( not ( = ?AUTO_5253 ?AUTO_5258 ) ) ( not ( = ?AUTO_5251 ?AUTO_5258 ) ) ( not ( = ?AUTO_5254 ?AUTO_5258 ) ) ( not ( = ?AUTO_5255 ?AUTO_5258 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5257 ?AUTO_5258 ?AUTO_5253 ?AUTO_5256 )
      ( DELIVER-PKG ?AUTO_5250 ?AUTO_5251 )
      ( DELIVER-PKG-VERIFY ?AUTO_5250 ?AUTO_5251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5261 - OBJ
      ?AUTO_5262 - LOCATION
    )
    :vars
    (
      ?AUTO_5263 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5263 ?AUTO_5262 ) ( IN-TRUCK ?AUTO_5261 ?AUTO_5263 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5261 ?AUTO_5263 ?AUTO_5262 )
      ( DELIVER-PKG-VERIFY ?AUTO_5261 ?AUTO_5262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5264 - OBJ
      ?AUTO_5265 - LOCATION
    )
    :vars
    (
      ?AUTO_5266 - TRUCK
      ?AUTO_5267 - LOCATION
      ?AUTO_5268 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5264 ?AUTO_5266 ) ( TRUCK-AT ?AUTO_5266 ?AUTO_5267 ) ( IN-CITY ?AUTO_5267 ?AUTO_5268 ) ( IN-CITY ?AUTO_5265 ?AUTO_5268 ) ( not ( = ?AUTO_5265 ?AUTO_5267 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5266 ?AUTO_5267 ?AUTO_5265 ?AUTO_5268 )
      ( DELIVER-PKG ?AUTO_5264 ?AUTO_5265 )
      ( DELIVER-PKG-VERIFY ?AUTO_5264 ?AUTO_5265 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5273 - OBJ
      ?AUTO_5274 - LOCATION
    )
    :vars
    (
      ?AUTO_5277 - TRUCK
      ?AUTO_5275 - LOCATION
      ?AUTO_5276 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5277 ?AUTO_5275 ) ( IN-CITY ?AUTO_5275 ?AUTO_5276 ) ( IN-CITY ?AUTO_5274 ?AUTO_5276 ) ( not ( = ?AUTO_5274 ?AUTO_5275 ) ) ( OBJ-AT ?AUTO_5273 ?AUTO_5275 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5273 ?AUTO_5277 ?AUTO_5275 )
      ( DELIVER-PKG ?AUTO_5273 ?AUTO_5274 )
      ( DELIVER-PKG-VERIFY ?AUTO_5273 ?AUTO_5274 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5296 - OBJ
      ?AUTO_5297 - LOCATION
    )
    :vars
    (
      ?AUTO_5298 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5298 ?AUTO_5297 ) ( IN-TRUCK ?AUTO_5296 ?AUTO_5298 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5296 ?AUTO_5298 ?AUTO_5297 )
      ( DELIVER-PKG-VERIFY ?AUTO_5296 ?AUTO_5297 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5299 - OBJ
      ?AUTO_5300 - LOCATION
    )
    :vars
    (
      ?AUTO_5301 - TRUCK
      ?AUTO_5302 - LOCATION
      ?AUTO_5303 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5299 ?AUTO_5301 ) ( TRUCK-AT ?AUTO_5301 ?AUTO_5302 ) ( IN-CITY ?AUTO_5302 ?AUTO_5303 ) ( IN-CITY ?AUTO_5300 ?AUTO_5303 ) ( not ( = ?AUTO_5300 ?AUTO_5302 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5301 ?AUTO_5302 ?AUTO_5300 ?AUTO_5303 )
      ( DELIVER-PKG ?AUTO_5299 ?AUTO_5300 )
      ( DELIVER-PKG-VERIFY ?AUTO_5299 ?AUTO_5300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5308 - OBJ
      ?AUTO_5309 - LOCATION
    )
    :vars
    (
      ?AUTO_5312 - TRUCK
      ?AUTO_5310 - LOCATION
      ?AUTO_5311 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5312 ?AUTO_5310 ) ( IN-CITY ?AUTO_5310 ?AUTO_5311 ) ( IN-CITY ?AUTO_5309 ?AUTO_5311 ) ( not ( = ?AUTO_5309 ?AUTO_5310 ) ) ( OBJ-AT ?AUTO_5308 ?AUTO_5310 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5308 ?AUTO_5312 ?AUTO_5310 )
      ( DELIVER-PKG ?AUTO_5308 ?AUTO_5309 )
      ( DELIVER-PKG-VERIFY ?AUTO_5308 ?AUTO_5309 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5313 - OBJ
      ?AUTO_5314 - LOCATION
    )
    :vars
    (
      ?AUTO_5316 - LOCATION
      ?AUTO_5315 - CITY
      ?AUTO_5317 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5316 ?AUTO_5315 ) ( IN-CITY ?AUTO_5314 ?AUTO_5315 ) ( not ( = ?AUTO_5314 ?AUTO_5316 ) ) ( OBJ-AT ?AUTO_5313 ?AUTO_5316 ) ( TRUCK-AT ?AUTO_5317 ?AUTO_5314 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5317 ?AUTO_5314 ?AUTO_5316 ?AUTO_5315 )
      ( DELIVER-PKG ?AUTO_5313 ?AUTO_5314 )
      ( DELIVER-PKG-VERIFY ?AUTO_5313 ?AUTO_5314 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5320 - OBJ
      ?AUTO_5321 - LOCATION
    )
    :vars
    (
      ?AUTO_5323 - LOCATION
      ?AUTO_5324 - CITY
      ?AUTO_5322 - TRUCK
      ?AUTO_5325 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5323 ?AUTO_5324 ) ( IN-CITY ?AUTO_5321 ?AUTO_5324 ) ( not ( = ?AUTO_5321 ?AUTO_5323 ) ) ( TRUCK-AT ?AUTO_5322 ?AUTO_5321 ) ( IN-AIRPLANE ?AUTO_5320 ?AUTO_5325 ) ( AIRPLANE-AT ?AUTO_5325 ?AUTO_5323 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5320 ?AUTO_5325 ?AUTO_5323 )
      ( DELIVER-PKG ?AUTO_5320 ?AUTO_5321 )
      ( DELIVER-PKG-VERIFY ?AUTO_5320 ?AUTO_5321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5326 - OBJ
      ?AUTO_5327 - LOCATION
    )
    :vars
    (
      ?AUTO_5330 - LOCATION
      ?AUTO_5328 - CITY
      ?AUTO_5329 - TRUCK
      ?AUTO_5331 - AIRPLANE
      ?AUTO_5332 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5330 ?AUTO_5328 ) ( IN-CITY ?AUTO_5327 ?AUTO_5328 ) ( not ( = ?AUTO_5327 ?AUTO_5330 ) ) ( TRUCK-AT ?AUTO_5329 ?AUTO_5327 ) ( IN-AIRPLANE ?AUTO_5326 ?AUTO_5331 ) ( AIRPORT ?AUTO_5332 ) ( AIRPORT ?AUTO_5330 ) ( AIRPLANE-AT ?AUTO_5331 ?AUTO_5332 ) ( not ( = ?AUTO_5332 ?AUTO_5330 ) ) ( not ( = ?AUTO_5327 ?AUTO_5332 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5331 ?AUTO_5332 ?AUTO_5330 )
      ( DELIVER-PKG ?AUTO_5326 ?AUTO_5327 )
      ( DELIVER-PKG-VERIFY ?AUTO_5326 ?AUTO_5327 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5333 - OBJ
      ?AUTO_5334 - LOCATION
    )
    :vars
    (
      ?AUTO_5337 - LOCATION
      ?AUTO_5335 - CITY
      ?AUTO_5336 - TRUCK
      ?AUTO_5338 - LOCATION
      ?AUTO_5339 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5337 ?AUTO_5335 ) ( IN-CITY ?AUTO_5334 ?AUTO_5335 ) ( not ( = ?AUTO_5334 ?AUTO_5337 ) ) ( TRUCK-AT ?AUTO_5336 ?AUTO_5334 ) ( AIRPORT ?AUTO_5338 ) ( AIRPORT ?AUTO_5337 ) ( AIRPLANE-AT ?AUTO_5339 ?AUTO_5338 ) ( not ( = ?AUTO_5338 ?AUTO_5337 ) ) ( not ( = ?AUTO_5334 ?AUTO_5338 ) ) ( OBJ-AT ?AUTO_5333 ?AUTO_5338 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5333 ?AUTO_5339 ?AUTO_5338 )
      ( DELIVER-PKG ?AUTO_5333 ?AUTO_5334 )
      ( DELIVER-PKG-VERIFY ?AUTO_5333 ?AUTO_5334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5340 - OBJ
      ?AUTO_5341 - LOCATION
    )
    :vars
    (
      ?AUTO_5343 - LOCATION
      ?AUTO_5345 - CITY
      ?AUTO_5344 - TRUCK
      ?AUTO_5342 - LOCATION
      ?AUTO_5347 - LOCATION
      ?AUTO_5346 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5343 ?AUTO_5345 ) ( IN-CITY ?AUTO_5341 ?AUTO_5345 ) ( not ( = ?AUTO_5341 ?AUTO_5343 ) ) ( TRUCK-AT ?AUTO_5344 ?AUTO_5341 ) ( AIRPORT ?AUTO_5342 ) ( AIRPORT ?AUTO_5343 ) ( not ( = ?AUTO_5342 ?AUTO_5343 ) ) ( not ( = ?AUTO_5341 ?AUTO_5342 ) ) ( OBJ-AT ?AUTO_5340 ?AUTO_5342 ) ( AIRPORT ?AUTO_5347 ) ( AIRPLANE-AT ?AUTO_5346 ?AUTO_5347 ) ( not ( = ?AUTO_5347 ?AUTO_5342 ) ) ( not ( = ?AUTO_5341 ?AUTO_5347 ) ) ( not ( = ?AUTO_5343 ?AUTO_5347 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5346 ?AUTO_5347 ?AUTO_5342 )
      ( DELIVER-PKG ?AUTO_5340 ?AUTO_5341 )
      ( DELIVER-PKG-VERIFY ?AUTO_5340 ?AUTO_5341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5348 - OBJ
      ?AUTO_5349 - LOCATION
    )
    :vars
    (
      ?AUTO_5354 - LOCATION
      ?AUTO_5351 - CITY
      ?AUTO_5350 - TRUCK
      ?AUTO_5352 - LOCATION
      ?AUTO_5355 - LOCATION
      ?AUTO_5353 - AIRPLANE
      ?AUTO_5356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5354 ?AUTO_5351 ) ( IN-CITY ?AUTO_5349 ?AUTO_5351 ) ( not ( = ?AUTO_5349 ?AUTO_5354 ) ) ( TRUCK-AT ?AUTO_5350 ?AUTO_5349 ) ( AIRPORT ?AUTO_5352 ) ( AIRPORT ?AUTO_5354 ) ( not ( = ?AUTO_5352 ?AUTO_5354 ) ) ( not ( = ?AUTO_5349 ?AUTO_5352 ) ) ( AIRPORT ?AUTO_5355 ) ( AIRPLANE-AT ?AUTO_5353 ?AUTO_5355 ) ( not ( = ?AUTO_5355 ?AUTO_5352 ) ) ( not ( = ?AUTO_5349 ?AUTO_5355 ) ) ( not ( = ?AUTO_5354 ?AUTO_5355 ) ) ( TRUCK-AT ?AUTO_5356 ?AUTO_5352 ) ( IN-TRUCK ?AUTO_5348 ?AUTO_5356 ) ( not ( = ?AUTO_5350 ?AUTO_5356 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5348 ?AUTO_5356 ?AUTO_5352 )
      ( DELIVER-PKG ?AUTO_5348 ?AUTO_5349 )
      ( DELIVER-PKG-VERIFY ?AUTO_5348 ?AUTO_5349 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5357 - OBJ
      ?AUTO_5358 - LOCATION
    )
    :vars
    (
      ?AUTO_5364 - LOCATION
      ?AUTO_5360 - CITY
      ?AUTO_5359 - TRUCK
      ?AUTO_5365 - LOCATION
      ?AUTO_5361 - LOCATION
      ?AUTO_5363 - AIRPLANE
      ?AUTO_5362 - TRUCK
      ?AUTO_5366 - LOCATION
      ?AUTO_5367 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5364 ?AUTO_5360 ) ( IN-CITY ?AUTO_5358 ?AUTO_5360 ) ( not ( = ?AUTO_5358 ?AUTO_5364 ) ) ( TRUCK-AT ?AUTO_5359 ?AUTO_5358 ) ( AIRPORT ?AUTO_5365 ) ( AIRPORT ?AUTO_5364 ) ( not ( = ?AUTO_5365 ?AUTO_5364 ) ) ( not ( = ?AUTO_5358 ?AUTO_5365 ) ) ( AIRPORT ?AUTO_5361 ) ( AIRPLANE-AT ?AUTO_5363 ?AUTO_5361 ) ( not ( = ?AUTO_5361 ?AUTO_5365 ) ) ( not ( = ?AUTO_5358 ?AUTO_5361 ) ) ( not ( = ?AUTO_5364 ?AUTO_5361 ) ) ( IN-TRUCK ?AUTO_5357 ?AUTO_5362 ) ( not ( = ?AUTO_5359 ?AUTO_5362 ) ) ( TRUCK-AT ?AUTO_5362 ?AUTO_5366 ) ( IN-CITY ?AUTO_5366 ?AUTO_5367 ) ( IN-CITY ?AUTO_5365 ?AUTO_5367 ) ( not ( = ?AUTO_5365 ?AUTO_5366 ) ) ( not ( = ?AUTO_5358 ?AUTO_5366 ) ) ( not ( = ?AUTO_5364 ?AUTO_5366 ) ) ( not ( = ?AUTO_5360 ?AUTO_5367 ) ) ( not ( = ?AUTO_5361 ?AUTO_5366 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5362 ?AUTO_5366 ?AUTO_5365 ?AUTO_5367 )
      ( DELIVER-PKG ?AUTO_5357 ?AUTO_5358 )
      ( DELIVER-PKG-VERIFY ?AUTO_5357 ?AUTO_5358 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5368 - OBJ
      ?AUTO_5369 - LOCATION
    )
    :vars
    (
      ?AUTO_5371 - LOCATION
      ?AUTO_5370 - CITY
      ?AUTO_5373 - TRUCK
      ?AUTO_5372 - LOCATION
      ?AUTO_5376 - LOCATION
      ?AUTO_5374 - AIRPLANE
      ?AUTO_5375 - TRUCK
      ?AUTO_5377 - LOCATION
      ?AUTO_5378 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5371 ?AUTO_5370 ) ( IN-CITY ?AUTO_5369 ?AUTO_5370 ) ( not ( = ?AUTO_5369 ?AUTO_5371 ) ) ( TRUCK-AT ?AUTO_5373 ?AUTO_5369 ) ( AIRPORT ?AUTO_5372 ) ( AIRPORT ?AUTO_5371 ) ( not ( = ?AUTO_5372 ?AUTO_5371 ) ) ( not ( = ?AUTO_5369 ?AUTO_5372 ) ) ( AIRPORT ?AUTO_5376 ) ( AIRPLANE-AT ?AUTO_5374 ?AUTO_5376 ) ( not ( = ?AUTO_5376 ?AUTO_5372 ) ) ( not ( = ?AUTO_5369 ?AUTO_5376 ) ) ( not ( = ?AUTO_5371 ?AUTO_5376 ) ) ( not ( = ?AUTO_5373 ?AUTO_5375 ) ) ( TRUCK-AT ?AUTO_5375 ?AUTO_5377 ) ( IN-CITY ?AUTO_5377 ?AUTO_5378 ) ( IN-CITY ?AUTO_5372 ?AUTO_5378 ) ( not ( = ?AUTO_5372 ?AUTO_5377 ) ) ( not ( = ?AUTO_5369 ?AUTO_5377 ) ) ( not ( = ?AUTO_5371 ?AUTO_5377 ) ) ( not ( = ?AUTO_5370 ?AUTO_5378 ) ) ( not ( = ?AUTO_5376 ?AUTO_5377 ) ) ( OBJ-AT ?AUTO_5368 ?AUTO_5377 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5368 ?AUTO_5375 ?AUTO_5377 )
      ( DELIVER-PKG ?AUTO_5368 ?AUTO_5369 )
      ( DELIVER-PKG-VERIFY ?AUTO_5368 ?AUTO_5369 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5379 - OBJ
      ?AUTO_5380 - LOCATION
    )
    :vars
    (
      ?AUTO_5381 - LOCATION
      ?AUTO_5382 - CITY
      ?AUTO_5385 - TRUCK
      ?AUTO_5383 - LOCATION
      ?AUTO_5388 - LOCATION
      ?AUTO_5384 - AIRPLANE
      ?AUTO_5387 - TRUCK
      ?AUTO_5386 - LOCATION
      ?AUTO_5389 - CITY
      ?AUTO_5390 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5381 ?AUTO_5382 ) ( IN-CITY ?AUTO_5380 ?AUTO_5382 ) ( not ( = ?AUTO_5380 ?AUTO_5381 ) ) ( TRUCK-AT ?AUTO_5385 ?AUTO_5380 ) ( AIRPORT ?AUTO_5383 ) ( AIRPORT ?AUTO_5381 ) ( not ( = ?AUTO_5383 ?AUTO_5381 ) ) ( not ( = ?AUTO_5380 ?AUTO_5383 ) ) ( AIRPORT ?AUTO_5388 ) ( AIRPLANE-AT ?AUTO_5384 ?AUTO_5388 ) ( not ( = ?AUTO_5388 ?AUTO_5383 ) ) ( not ( = ?AUTO_5380 ?AUTO_5388 ) ) ( not ( = ?AUTO_5381 ?AUTO_5388 ) ) ( not ( = ?AUTO_5385 ?AUTO_5387 ) ) ( IN-CITY ?AUTO_5386 ?AUTO_5389 ) ( IN-CITY ?AUTO_5383 ?AUTO_5389 ) ( not ( = ?AUTO_5383 ?AUTO_5386 ) ) ( not ( = ?AUTO_5380 ?AUTO_5386 ) ) ( not ( = ?AUTO_5381 ?AUTO_5386 ) ) ( not ( = ?AUTO_5382 ?AUTO_5389 ) ) ( not ( = ?AUTO_5388 ?AUTO_5386 ) ) ( OBJ-AT ?AUTO_5379 ?AUTO_5386 ) ( TRUCK-AT ?AUTO_5387 ?AUTO_5390 ) ( IN-CITY ?AUTO_5390 ?AUTO_5389 ) ( not ( = ?AUTO_5386 ?AUTO_5390 ) ) ( not ( = ?AUTO_5380 ?AUTO_5390 ) ) ( not ( = ?AUTO_5381 ?AUTO_5390 ) ) ( not ( = ?AUTO_5383 ?AUTO_5390 ) ) ( not ( = ?AUTO_5388 ?AUTO_5390 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5387 ?AUTO_5390 ?AUTO_5386 ?AUTO_5389 )
      ( DELIVER-PKG ?AUTO_5379 ?AUTO_5380 )
      ( DELIVER-PKG-VERIFY ?AUTO_5379 ?AUTO_5380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5393 - OBJ
      ?AUTO_5394 - LOCATION
    )
    :vars
    (
      ?AUTO_5395 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5395 ?AUTO_5394 ) ( IN-TRUCK ?AUTO_5393 ?AUTO_5395 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5393 ?AUTO_5395 ?AUTO_5394 )
      ( DELIVER-PKG-VERIFY ?AUTO_5393 ?AUTO_5394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5396 - OBJ
      ?AUTO_5397 - LOCATION
    )
    :vars
    (
      ?AUTO_5398 - TRUCK
      ?AUTO_5399 - LOCATION
      ?AUTO_5400 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5396 ?AUTO_5398 ) ( TRUCK-AT ?AUTO_5398 ?AUTO_5399 ) ( IN-CITY ?AUTO_5399 ?AUTO_5400 ) ( IN-CITY ?AUTO_5397 ?AUTO_5400 ) ( not ( = ?AUTO_5397 ?AUTO_5399 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5398 ?AUTO_5399 ?AUTO_5397 ?AUTO_5400 )
      ( DELIVER-PKG ?AUTO_5396 ?AUTO_5397 )
      ( DELIVER-PKG-VERIFY ?AUTO_5396 ?AUTO_5397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5405 - OBJ
      ?AUTO_5406 - LOCATION
    )
    :vars
    (
      ?AUTO_5409 - TRUCK
      ?AUTO_5407 - LOCATION
      ?AUTO_5408 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5409 ?AUTO_5407 ) ( IN-CITY ?AUTO_5407 ?AUTO_5408 ) ( IN-CITY ?AUTO_5406 ?AUTO_5408 ) ( not ( = ?AUTO_5406 ?AUTO_5407 ) ) ( OBJ-AT ?AUTO_5405 ?AUTO_5407 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5405 ?AUTO_5409 ?AUTO_5407 )
      ( DELIVER-PKG ?AUTO_5405 ?AUTO_5406 )
      ( DELIVER-PKG-VERIFY ?AUTO_5405 ?AUTO_5406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5410 - OBJ
      ?AUTO_5411 - LOCATION
    )
    :vars
    (
      ?AUTO_5412 - LOCATION
      ?AUTO_5413 - CITY
      ?AUTO_5414 - TRUCK
      ?AUTO_5415 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5412 ?AUTO_5413 ) ( IN-CITY ?AUTO_5411 ?AUTO_5413 ) ( not ( = ?AUTO_5411 ?AUTO_5412 ) ) ( OBJ-AT ?AUTO_5410 ?AUTO_5412 ) ( TRUCK-AT ?AUTO_5414 ?AUTO_5415 ) ( IN-CITY ?AUTO_5415 ?AUTO_5413 ) ( not ( = ?AUTO_5412 ?AUTO_5415 ) ) ( not ( = ?AUTO_5411 ?AUTO_5415 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5414 ?AUTO_5415 ?AUTO_5412 ?AUTO_5413 )
      ( DELIVER-PKG ?AUTO_5410 ?AUTO_5411 )
      ( DELIVER-PKG-VERIFY ?AUTO_5410 ?AUTO_5411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5418 - OBJ
      ?AUTO_5419 - LOCATION
    )
    :vars
    (
      ?AUTO_5420 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5420 ?AUTO_5419 ) ( IN-TRUCK ?AUTO_5418 ?AUTO_5420 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5418 ?AUTO_5420 ?AUTO_5419 )
      ( DELIVER-PKG-VERIFY ?AUTO_5418 ?AUTO_5419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5425 - OBJ
      ?AUTO_5426 - LOCATION
    )
    :vars
    (
      ?AUTO_5428 - TRUCK
      ?AUTO_5427 - LOCATION
      ?AUTO_5429 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5428 ?AUTO_5427 ) ( IN-CITY ?AUTO_5427 ?AUTO_5429 ) ( IN-CITY ?AUTO_5426 ?AUTO_5429 ) ( not ( = ?AUTO_5426 ?AUTO_5427 ) ) ( OBJ-AT ?AUTO_5425 ?AUTO_5427 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5425 ?AUTO_5428 ?AUTO_5427 )
      ( DELIVER-PKG ?AUTO_5425 ?AUTO_5426 )
      ( DELIVER-PKG-VERIFY ?AUTO_5425 ?AUTO_5426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5430 - OBJ
      ?AUTO_5431 - LOCATION
    )
    :vars
    (
      ?AUTO_5433 - LOCATION
      ?AUTO_5434 - CITY
      ?AUTO_5432 - TRUCK
      ?AUTO_5435 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5433 ?AUTO_5434 ) ( IN-CITY ?AUTO_5431 ?AUTO_5434 ) ( not ( = ?AUTO_5431 ?AUTO_5433 ) ) ( OBJ-AT ?AUTO_5430 ?AUTO_5433 ) ( TRUCK-AT ?AUTO_5432 ?AUTO_5435 ) ( IN-CITY ?AUTO_5435 ?AUTO_5434 ) ( not ( = ?AUTO_5433 ?AUTO_5435 ) ) ( not ( = ?AUTO_5431 ?AUTO_5435 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5432 ?AUTO_5435 ?AUTO_5433 ?AUTO_5434 )
      ( DELIVER-PKG ?AUTO_5430 ?AUTO_5431 )
      ( DELIVER-PKG-VERIFY ?AUTO_5430 ?AUTO_5431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5442 - OBJ
      ?AUTO_5443 - LOCATION
    )
    :vars
    (
      ?AUTO_5444 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5444 ?AUTO_5443 ) ( IN-TRUCK ?AUTO_5442 ?AUTO_5444 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5442 ?AUTO_5444 ?AUTO_5443 )
      ( DELIVER-PKG-VERIFY ?AUTO_5442 ?AUTO_5443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5445 - OBJ
      ?AUTO_5446 - LOCATION
    )
    :vars
    (
      ?AUTO_5447 - TRUCK
      ?AUTO_5448 - LOCATION
      ?AUTO_5449 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5445 ?AUTO_5447 ) ( TRUCK-AT ?AUTO_5447 ?AUTO_5448 ) ( IN-CITY ?AUTO_5448 ?AUTO_5449 ) ( IN-CITY ?AUTO_5446 ?AUTO_5449 ) ( not ( = ?AUTO_5446 ?AUTO_5448 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5447 ?AUTO_5448 ?AUTO_5446 ?AUTO_5449 )
      ( DELIVER-PKG ?AUTO_5445 ?AUTO_5446 )
      ( DELIVER-PKG-VERIFY ?AUTO_5445 ?AUTO_5446 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5450 - OBJ
      ?AUTO_5451 - LOCATION
    )
    :vars
    (
      ?AUTO_5452 - TRUCK
      ?AUTO_5453 - LOCATION
      ?AUTO_5454 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5452 ?AUTO_5453 ) ( IN-CITY ?AUTO_5453 ?AUTO_5454 ) ( IN-CITY ?AUTO_5451 ?AUTO_5454 ) ( not ( = ?AUTO_5451 ?AUTO_5453 ) ) ( OBJ-AT ?AUTO_5450 ?AUTO_5453 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5450 ?AUTO_5452 ?AUTO_5453 )
      ( DELIVER-PKG ?AUTO_5450 ?AUTO_5451 )
      ( DELIVER-PKG-VERIFY ?AUTO_5450 ?AUTO_5451 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5455 - OBJ
      ?AUTO_5456 - LOCATION
    )
    :vars
    (
      ?AUTO_5457 - LOCATION
      ?AUTO_5459 - CITY
      ?AUTO_5458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5457 ?AUTO_5459 ) ( IN-CITY ?AUTO_5456 ?AUTO_5459 ) ( not ( = ?AUTO_5456 ?AUTO_5457 ) ) ( OBJ-AT ?AUTO_5455 ?AUTO_5457 ) ( TRUCK-AT ?AUTO_5458 ?AUTO_5456 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5458 ?AUTO_5456 ?AUTO_5457 ?AUTO_5459 )
      ( DELIVER-PKG ?AUTO_5455 ?AUTO_5456 )
      ( DELIVER-PKG-VERIFY ?AUTO_5455 ?AUTO_5456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5478 - OBJ
      ?AUTO_5479 - LOCATION
    )
    :vars
    (
      ?AUTO_5480 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5480 ?AUTO_5479 ) ( IN-TRUCK ?AUTO_5478 ?AUTO_5480 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5478 ?AUTO_5480 ?AUTO_5479 )
      ( DELIVER-PKG-VERIFY ?AUTO_5478 ?AUTO_5479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5481 - OBJ
      ?AUTO_5482 - LOCATION
    )
    :vars
    (
      ?AUTO_5483 - TRUCK
      ?AUTO_5484 - LOCATION
      ?AUTO_5485 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5481 ?AUTO_5483 ) ( TRUCK-AT ?AUTO_5483 ?AUTO_5484 ) ( IN-CITY ?AUTO_5484 ?AUTO_5485 ) ( IN-CITY ?AUTO_5482 ?AUTO_5485 ) ( not ( = ?AUTO_5482 ?AUTO_5484 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5483 ?AUTO_5484 ?AUTO_5482 ?AUTO_5485 )
      ( DELIVER-PKG ?AUTO_5481 ?AUTO_5482 )
      ( DELIVER-PKG-VERIFY ?AUTO_5481 ?AUTO_5482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5512 - OBJ
      ?AUTO_5513 - LOCATION
    )
    :vars
    (
      ?AUTO_5514 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5512 ?AUTO_5514 ) ( AIRPLANE-AT ?AUTO_5514 ?AUTO_5513 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5512 ?AUTO_5514 ?AUTO_5513 )
      ( DELIVER-PKG-VERIFY ?AUTO_5512 ?AUTO_5513 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5517 - OBJ
      ?AUTO_5518 - LOCATION
    )
    :vars
    (
      ?AUTO_5519 - AIRPLANE
      ?AUTO_5520 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5517 ?AUTO_5519 ) ( AIRPORT ?AUTO_5520 ) ( AIRPORT ?AUTO_5518 ) ( AIRPLANE-AT ?AUTO_5519 ?AUTO_5520 ) ( not ( = ?AUTO_5520 ?AUTO_5518 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5519 ?AUTO_5520 ?AUTO_5518 )
      ( DELIVER-PKG ?AUTO_5517 ?AUTO_5518 )
      ( DELIVER-PKG-VERIFY ?AUTO_5517 ?AUTO_5518 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5521 - OBJ
      ?AUTO_5522 - LOCATION
    )
    :vars
    (
      ?AUTO_5524 - LOCATION
      ?AUTO_5523 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5524 ) ( AIRPORT ?AUTO_5522 ) ( AIRPLANE-AT ?AUTO_5523 ?AUTO_5524 ) ( not ( = ?AUTO_5524 ?AUTO_5522 ) ) ( OBJ-AT ?AUTO_5521 ?AUTO_5524 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5521 ?AUTO_5523 ?AUTO_5524 )
      ( DELIVER-PKG ?AUTO_5521 ?AUTO_5522 )
      ( DELIVER-PKG-VERIFY ?AUTO_5521 ?AUTO_5522 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5525 - OBJ
      ?AUTO_5526 - LOCATION
    )
    :vars
    (
      ?AUTO_5528 - LOCATION
      ?AUTO_5527 - AIRPLANE
      ?AUTO_5529 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5528 ) ( AIRPORT ?AUTO_5526 ) ( AIRPLANE-AT ?AUTO_5527 ?AUTO_5528 ) ( not ( = ?AUTO_5528 ?AUTO_5526 ) ) ( TRUCK-AT ?AUTO_5529 ?AUTO_5528 ) ( IN-TRUCK ?AUTO_5525 ?AUTO_5529 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5525 ?AUTO_5529 ?AUTO_5528 )
      ( DELIVER-PKG ?AUTO_5525 ?AUTO_5526 )
      ( DELIVER-PKG-VERIFY ?AUTO_5525 ?AUTO_5526 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5530 - OBJ
      ?AUTO_5531 - LOCATION
    )
    :vars
    (
      ?AUTO_5533 - LOCATION
      ?AUTO_5532 - AIRPLANE
      ?AUTO_5534 - TRUCK
      ?AUTO_5535 - LOCATION
      ?AUTO_5536 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5533 ) ( AIRPORT ?AUTO_5531 ) ( AIRPLANE-AT ?AUTO_5532 ?AUTO_5533 ) ( not ( = ?AUTO_5533 ?AUTO_5531 ) ) ( IN-TRUCK ?AUTO_5530 ?AUTO_5534 ) ( TRUCK-AT ?AUTO_5534 ?AUTO_5535 ) ( IN-CITY ?AUTO_5535 ?AUTO_5536 ) ( IN-CITY ?AUTO_5533 ?AUTO_5536 ) ( not ( = ?AUTO_5533 ?AUTO_5535 ) ) ( not ( = ?AUTO_5531 ?AUTO_5535 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5534 ?AUTO_5535 ?AUTO_5533 ?AUTO_5536 )
      ( DELIVER-PKG ?AUTO_5530 ?AUTO_5531 )
      ( DELIVER-PKG-VERIFY ?AUTO_5530 ?AUTO_5531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5545 - OBJ
      ?AUTO_5546 - LOCATION
    )
    :vars
    (
      ?AUTO_5548 - LOCATION
      ?AUTO_5550 - AIRPLANE
      ?AUTO_5547 - TRUCK
      ?AUTO_5551 - LOCATION
      ?AUTO_5549 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5548 ) ( AIRPORT ?AUTO_5546 ) ( AIRPLANE-AT ?AUTO_5550 ?AUTO_5548 ) ( not ( = ?AUTO_5548 ?AUTO_5546 ) ) ( TRUCK-AT ?AUTO_5547 ?AUTO_5551 ) ( IN-CITY ?AUTO_5551 ?AUTO_5549 ) ( IN-CITY ?AUTO_5548 ?AUTO_5549 ) ( not ( = ?AUTO_5548 ?AUTO_5551 ) ) ( not ( = ?AUTO_5546 ?AUTO_5551 ) ) ( OBJ-AT ?AUTO_5545 ?AUTO_5551 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5545 ?AUTO_5547 ?AUTO_5551 )
      ( DELIVER-PKG ?AUTO_5545 ?AUTO_5546 )
      ( DELIVER-PKG-VERIFY ?AUTO_5545 ?AUTO_5546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5568 - OBJ
      ?AUTO_5569 - LOCATION
    )
    :vars
    (
      ?AUTO_5570 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5568 ?AUTO_5570 ) ( AIRPLANE-AT ?AUTO_5570 ?AUTO_5569 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5568 ?AUTO_5570 ?AUTO_5569 )
      ( DELIVER-PKG-VERIFY ?AUTO_5568 ?AUTO_5569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5571 - OBJ
      ?AUTO_5572 - LOCATION
    )
    :vars
    (
      ?AUTO_5573 - AIRPLANE
      ?AUTO_5574 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5571 ?AUTO_5573 ) ( AIRPORT ?AUTO_5574 ) ( AIRPORT ?AUTO_5572 ) ( AIRPLANE-AT ?AUTO_5573 ?AUTO_5574 ) ( not ( = ?AUTO_5574 ?AUTO_5572 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5573 ?AUTO_5574 ?AUTO_5572 )
      ( DELIVER-PKG ?AUTO_5571 ?AUTO_5572 )
      ( DELIVER-PKG-VERIFY ?AUTO_5571 ?AUTO_5572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5577 - OBJ
      ?AUTO_5578 - LOCATION
    )
    :vars
    (
      ?AUTO_5580 - LOCATION
      ?AUTO_5579 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5580 ) ( AIRPORT ?AUTO_5578 ) ( AIRPLANE-AT ?AUTO_5579 ?AUTO_5580 ) ( not ( = ?AUTO_5580 ?AUTO_5578 ) ) ( OBJ-AT ?AUTO_5577 ?AUTO_5580 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5577 ?AUTO_5579 ?AUTO_5580 )
      ( DELIVER-PKG ?AUTO_5577 ?AUTO_5578 )
      ( DELIVER-PKG-VERIFY ?AUTO_5577 ?AUTO_5578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5581 - OBJ
      ?AUTO_5582 - LOCATION
    )
    :vars
    (
      ?AUTO_5584 - LOCATION
      ?AUTO_5583 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5584 ) ( AIRPORT ?AUTO_5582 ) ( not ( = ?AUTO_5584 ?AUTO_5582 ) ) ( OBJ-AT ?AUTO_5581 ?AUTO_5584 ) ( AIRPLANE-AT ?AUTO_5583 ?AUTO_5582 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5583 ?AUTO_5582 ?AUTO_5584 )
      ( DELIVER-PKG ?AUTO_5581 ?AUTO_5582 )
      ( DELIVER-PKG-VERIFY ?AUTO_5581 ?AUTO_5582 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5591 - OBJ
      ?AUTO_5592 - LOCATION
    )
    :vars
    (
      ?AUTO_5593 - LOCATION
      ?AUTO_5594 - AIRPLANE
      ?AUTO_5595 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5593 ) ( AIRPORT ?AUTO_5592 ) ( not ( = ?AUTO_5593 ?AUTO_5592 ) ) ( AIRPLANE-AT ?AUTO_5594 ?AUTO_5592 ) ( TRUCK-AT ?AUTO_5595 ?AUTO_5593 ) ( IN-TRUCK ?AUTO_5591 ?AUTO_5595 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5591 ?AUTO_5595 ?AUTO_5593 )
      ( DELIVER-PKG ?AUTO_5591 ?AUTO_5592 )
      ( DELIVER-PKG-VERIFY ?AUTO_5591 ?AUTO_5592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5596 - OBJ
      ?AUTO_5597 - LOCATION
    )
    :vars
    (
      ?AUTO_5598 - LOCATION
      ?AUTO_5600 - AIRPLANE
      ?AUTO_5599 - TRUCK
      ?AUTO_5601 - LOCATION
      ?AUTO_5602 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5598 ) ( AIRPORT ?AUTO_5597 ) ( not ( = ?AUTO_5598 ?AUTO_5597 ) ) ( AIRPLANE-AT ?AUTO_5600 ?AUTO_5597 ) ( IN-TRUCK ?AUTO_5596 ?AUTO_5599 ) ( TRUCK-AT ?AUTO_5599 ?AUTO_5601 ) ( IN-CITY ?AUTO_5601 ?AUTO_5602 ) ( IN-CITY ?AUTO_5598 ?AUTO_5602 ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( not ( = ?AUTO_5597 ?AUTO_5601 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5599 ?AUTO_5601 ?AUTO_5598 ?AUTO_5602 )
      ( DELIVER-PKG ?AUTO_5596 ?AUTO_5597 )
      ( DELIVER-PKG-VERIFY ?AUTO_5596 ?AUTO_5597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5603 - OBJ
      ?AUTO_5604 - LOCATION
    )
    :vars
    (
      ?AUTO_5609 - LOCATION
      ?AUTO_5608 - AIRPLANE
      ?AUTO_5606 - TRUCK
      ?AUTO_5607 - LOCATION
      ?AUTO_5605 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5609 ) ( AIRPORT ?AUTO_5604 ) ( not ( = ?AUTO_5609 ?AUTO_5604 ) ) ( AIRPLANE-AT ?AUTO_5608 ?AUTO_5604 ) ( TRUCK-AT ?AUTO_5606 ?AUTO_5607 ) ( IN-CITY ?AUTO_5607 ?AUTO_5605 ) ( IN-CITY ?AUTO_5609 ?AUTO_5605 ) ( not ( = ?AUTO_5609 ?AUTO_5607 ) ) ( not ( = ?AUTO_5604 ?AUTO_5607 ) ) ( OBJ-AT ?AUTO_5603 ?AUTO_5607 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5603 ?AUTO_5606 ?AUTO_5607 )
      ( DELIVER-PKG ?AUTO_5603 ?AUTO_5604 )
      ( DELIVER-PKG-VERIFY ?AUTO_5603 ?AUTO_5604 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5610 - OBJ
      ?AUTO_5611 - LOCATION
    )
    :vars
    (
      ?AUTO_5615 - LOCATION
      ?AUTO_5614 - AIRPLANE
      ?AUTO_5616 - LOCATION
      ?AUTO_5613 - CITY
      ?AUTO_5612 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5615 ) ( AIRPORT ?AUTO_5611 ) ( not ( = ?AUTO_5615 ?AUTO_5611 ) ) ( AIRPLANE-AT ?AUTO_5614 ?AUTO_5611 ) ( IN-CITY ?AUTO_5616 ?AUTO_5613 ) ( IN-CITY ?AUTO_5615 ?AUTO_5613 ) ( not ( = ?AUTO_5615 ?AUTO_5616 ) ) ( not ( = ?AUTO_5611 ?AUTO_5616 ) ) ( OBJ-AT ?AUTO_5610 ?AUTO_5616 ) ( TRUCK-AT ?AUTO_5612 ?AUTO_5615 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5612 ?AUTO_5615 ?AUTO_5616 ?AUTO_5613 )
      ( DELIVER-PKG ?AUTO_5610 ?AUTO_5611 )
      ( DELIVER-PKG-VERIFY ?AUTO_5610 ?AUTO_5611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5635 - OBJ
      ?AUTO_5636 - LOCATION
    )
    :vars
    (
      ?AUTO_5637 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5635 ?AUTO_5637 ) ( AIRPLANE-AT ?AUTO_5637 ?AUTO_5636 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5635 ?AUTO_5637 ?AUTO_5636 )
      ( DELIVER-PKG-VERIFY ?AUTO_5635 ?AUTO_5636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5638 - OBJ
      ?AUTO_5639 - LOCATION
    )
    :vars
    (
      ?AUTO_5640 - AIRPLANE
      ?AUTO_5641 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5638 ?AUTO_5640 ) ( AIRPORT ?AUTO_5641 ) ( AIRPORT ?AUTO_5639 ) ( AIRPLANE-AT ?AUTO_5640 ?AUTO_5641 ) ( not ( = ?AUTO_5641 ?AUTO_5639 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5640 ?AUTO_5641 ?AUTO_5639 )
      ( DELIVER-PKG ?AUTO_5638 ?AUTO_5639 )
      ( DELIVER-PKG-VERIFY ?AUTO_5638 ?AUTO_5639 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5644 - OBJ
      ?AUTO_5645 - LOCATION
    )
    :vars
    (
      ?AUTO_5647 - LOCATION
      ?AUTO_5646 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5647 ) ( AIRPORT ?AUTO_5645 ) ( AIRPLANE-AT ?AUTO_5646 ?AUTO_5647 ) ( not ( = ?AUTO_5647 ?AUTO_5645 ) ) ( OBJ-AT ?AUTO_5644 ?AUTO_5647 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5644 ?AUTO_5646 ?AUTO_5647 )
      ( DELIVER-PKG ?AUTO_5644 ?AUTO_5645 )
      ( DELIVER-PKG-VERIFY ?AUTO_5644 ?AUTO_5645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5648 - OBJ
      ?AUTO_5649 - LOCATION
    )
    :vars
    (
      ?AUTO_5651 - LOCATION
      ?AUTO_5650 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5651 ) ( AIRPORT ?AUTO_5649 ) ( not ( = ?AUTO_5651 ?AUTO_5649 ) ) ( OBJ-AT ?AUTO_5648 ?AUTO_5651 ) ( AIRPLANE-AT ?AUTO_5650 ?AUTO_5649 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5650 ?AUTO_5649 ?AUTO_5651 )
      ( DELIVER-PKG ?AUTO_5648 ?AUTO_5649 )
      ( DELIVER-PKG-VERIFY ?AUTO_5648 ?AUTO_5649 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5692 - OBJ
      ?AUTO_5693 - LOCATION
    )
    :vars
    (
      ?AUTO_5694 - LOCATION
      ?AUTO_5698 - AIRPLANE
      ?AUTO_5695 - LOCATION
      ?AUTO_5697 - CITY
      ?AUTO_5696 - TRUCK
      ?AUTO_5699 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5694 ) ( AIRPORT ?AUTO_5693 ) ( not ( = ?AUTO_5694 ?AUTO_5693 ) ) ( AIRPLANE-AT ?AUTO_5698 ?AUTO_5693 ) ( IN-CITY ?AUTO_5695 ?AUTO_5697 ) ( IN-CITY ?AUTO_5694 ?AUTO_5697 ) ( not ( = ?AUTO_5694 ?AUTO_5695 ) ) ( not ( = ?AUTO_5693 ?AUTO_5695 ) ) ( OBJ-AT ?AUTO_5692 ?AUTO_5695 ) ( TRUCK-AT ?AUTO_5696 ?AUTO_5699 ) ( IN-CITY ?AUTO_5699 ?AUTO_5697 ) ( not ( = ?AUTO_5695 ?AUTO_5699 ) ) ( not ( = ?AUTO_5693 ?AUTO_5699 ) ) ( not ( = ?AUTO_5694 ?AUTO_5699 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5696 ?AUTO_5699 ?AUTO_5695 ?AUTO_5697 )
      ( DELIVER-PKG ?AUTO_5692 ?AUTO_5693 )
      ( DELIVER-PKG-VERIFY ?AUTO_5692 ?AUTO_5693 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5702 - OBJ
      ?AUTO_5703 - LOCATION
    )
    :vars
    (
      ?AUTO_5704 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5702 ?AUTO_5704 ) ( AIRPLANE-AT ?AUTO_5704 ?AUTO_5703 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5702 ?AUTO_5704 ?AUTO_5703 )
      ( DELIVER-PKG-VERIFY ?AUTO_5702 ?AUTO_5703 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5709 - OBJ
      ?AUTO_5710 - LOCATION
    )
    :vars
    (
      ?AUTO_5711 - LOCATION
      ?AUTO_5712 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5711 ) ( AIRPORT ?AUTO_5710 ) ( AIRPLANE-AT ?AUTO_5712 ?AUTO_5711 ) ( not ( = ?AUTO_5711 ?AUTO_5710 ) ) ( OBJ-AT ?AUTO_5709 ?AUTO_5711 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5709 ?AUTO_5712 ?AUTO_5711 )
      ( DELIVER-PKG ?AUTO_5709 ?AUTO_5710 )
      ( DELIVER-PKG-VERIFY ?AUTO_5709 ?AUTO_5710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5753 - OBJ
      ?AUTO_5754 - LOCATION
    )
    :vars
    (
      ?AUTO_5759 - LOCATION
      ?AUTO_5758 - AIRPLANE
      ?AUTO_5755 - LOCATION
      ?AUTO_5757 - CITY
      ?AUTO_5756 - TRUCK
      ?AUTO_5760 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5759 ) ( AIRPORT ?AUTO_5754 ) ( not ( = ?AUTO_5759 ?AUTO_5754 ) ) ( AIRPLANE-AT ?AUTO_5758 ?AUTO_5754 ) ( IN-CITY ?AUTO_5755 ?AUTO_5757 ) ( IN-CITY ?AUTO_5759 ?AUTO_5757 ) ( not ( = ?AUTO_5759 ?AUTO_5755 ) ) ( not ( = ?AUTO_5754 ?AUTO_5755 ) ) ( OBJ-AT ?AUTO_5753 ?AUTO_5755 ) ( TRUCK-AT ?AUTO_5756 ?AUTO_5760 ) ( IN-CITY ?AUTO_5760 ?AUTO_5757 ) ( not ( = ?AUTO_5755 ?AUTO_5760 ) ) ( not ( = ?AUTO_5754 ?AUTO_5760 ) ) ( not ( = ?AUTO_5759 ?AUTO_5760 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5756 ?AUTO_5760 ?AUTO_5755 ?AUTO_5757 )
      ( DELIVER-PKG ?AUTO_5753 ?AUTO_5754 )
      ( DELIVER-PKG-VERIFY ?AUTO_5753 ?AUTO_5754 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5767 - OBJ
      ?AUTO_5768 - LOCATION
    )
    :vars
    (
      ?AUTO_5769 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5769 ?AUTO_5768 ) ( IN-TRUCK ?AUTO_5767 ?AUTO_5769 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5767 ?AUTO_5769 ?AUTO_5768 )
      ( DELIVER-PKG-VERIFY ?AUTO_5767 ?AUTO_5768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5770 - OBJ
      ?AUTO_5771 - LOCATION
    )
    :vars
    (
      ?AUTO_5772 - TRUCK
      ?AUTO_5773 - LOCATION
      ?AUTO_5774 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5770 ?AUTO_5772 ) ( TRUCK-AT ?AUTO_5772 ?AUTO_5773 ) ( IN-CITY ?AUTO_5773 ?AUTO_5774 ) ( IN-CITY ?AUTO_5771 ?AUTO_5774 ) ( not ( = ?AUTO_5771 ?AUTO_5773 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5772 ?AUTO_5773 ?AUTO_5771 ?AUTO_5774 )
      ( DELIVER-PKG ?AUTO_5770 ?AUTO_5771 )
      ( DELIVER-PKG-VERIFY ?AUTO_5770 ?AUTO_5771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5777 - OBJ
      ?AUTO_5778 - LOCATION
    )
    :vars
    (
      ?AUTO_5779 - TRUCK
      ?AUTO_5781 - LOCATION
      ?AUTO_5780 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5779 ?AUTO_5781 ) ( IN-CITY ?AUTO_5781 ?AUTO_5780 ) ( IN-CITY ?AUTO_5778 ?AUTO_5780 ) ( not ( = ?AUTO_5778 ?AUTO_5781 ) ) ( OBJ-AT ?AUTO_5777 ?AUTO_5781 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5777 ?AUTO_5779 ?AUTO_5781 )
      ( DELIVER-PKG ?AUTO_5777 ?AUTO_5778 )
      ( DELIVER-PKG-VERIFY ?AUTO_5777 ?AUTO_5778 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5784 - OBJ
      ?AUTO_5785 - LOCATION
    )
    :vars
    (
      ?AUTO_5786 - TRUCK
      ?AUTO_5787 - LOCATION
      ?AUTO_5788 - CITY
      ?AUTO_5789 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5786 ?AUTO_5787 ) ( IN-CITY ?AUTO_5787 ?AUTO_5788 ) ( IN-CITY ?AUTO_5785 ?AUTO_5788 ) ( not ( = ?AUTO_5785 ?AUTO_5787 ) ) ( IN-AIRPLANE ?AUTO_5784 ?AUTO_5789 ) ( AIRPLANE-AT ?AUTO_5789 ?AUTO_5787 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5784 ?AUTO_5789 ?AUTO_5787 )
      ( DELIVER-PKG ?AUTO_5784 ?AUTO_5785 )
      ( DELIVER-PKG-VERIFY ?AUTO_5784 ?AUTO_5785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5790 - OBJ
      ?AUTO_5791 - LOCATION
    )
    :vars
    (
      ?AUTO_5793 - TRUCK
      ?AUTO_5794 - LOCATION
      ?AUTO_5792 - CITY
      ?AUTO_5795 - AIRPLANE
      ?AUTO_5796 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5793 ?AUTO_5794 ) ( IN-CITY ?AUTO_5794 ?AUTO_5792 ) ( IN-CITY ?AUTO_5791 ?AUTO_5792 ) ( not ( = ?AUTO_5791 ?AUTO_5794 ) ) ( IN-AIRPLANE ?AUTO_5790 ?AUTO_5795 ) ( AIRPORT ?AUTO_5796 ) ( AIRPORT ?AUTO_5794 ) ( AIRPLANE-AT ?AUTO_5795 ?AUTO_5796 ) ( not ( = ?AUTO_5796 ?AUTO_5794 ) ) ( not ( = ?AUTO_5791 ?AUTO_5796 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5795 ?AUTO_5796 ?AUTO_5794 )
      ( DELIVER-PKG ?AUTO_5790 ?AUTO_5791 )
      ( DELIVER-PKG-VERIFY ?AUTO_5790 ?AUTO_5791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5799 - OBJ
      ?AUTO_5800 - LOCATION
    )
    :vars
    (
      ?AUTO_5804 - TRUCK
      ?AUTO_5803 - LOCATION
      ?AUTO_5805 - CITY
      ?AUTO_5802 - LOCATION
      ?AUTO_5801 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5804 ?AUTO_5803 ) ( IN-CITY ?AUTO_5803 ?AUTO_5805 ) ( IN-CITY ?AUTO_5800 ?AUTO_5805 ) ( not ( = ?AUTO_5800 ?AUTO_5803 ) ) ( AIRPORT ?AUTO_5802 ) ( AIRPORT ?AUTO_5803 ) ( AIRPLANE-AT ?AUTO_5801 ?AUTO_5802 ) ( not ( = ?AUTO_5802 ?AUTO_5803 ) ) ( not ( = ?AUTO_5800 ?AUTO_5802 ) ) ( OBJ-AT ?AUTO_5799 ?AUTO_5802 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5799 ?AUTO_5801 ?AUTO_5802 )
      ( DELIVER-PKG ?AUTO_5799 ?AUTO_5800 )
      ( DELIVER-PKG-VERIFY ?AUTO_5799 ?AUTO_5800 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5806 - OBJ
      ?AUTO_5807 - LOCATION
    )
    :vars
    (
      ?AUTO_5810 - TRUCK
      ?AUTO_5812 - LOCATION
      ?AUTO_5808 - CITY
      ?AUTO_5811 - LOCATION
      ?AUTO_5809 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5810 ?AUTO_5812 ) ( IN-CITY ?AUTO_5812 ?AUTO_5808 ) ( IN-CITY ?AUTO_5807 ?AUTO_5808 ) ( not ( = ?AUTO_5807 ?AUTO_5812 ) ) ( AIRPORT ?AUTO_5811 ) ( AIRPORT ?AUTO_5812 ) ( not ( = ?AUTO_5811 ?AUTO_5812 ) ) ( not ( = ?AUTO_5807 ?AUTO_5811 ) ) ( OBJ-AT ?AUTO_5806 ?AUTO_5811 ) ( AIRPLANE-AT ?AUTO_5809 ?AUTO_5812 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5809 ?AUTO_5812 ?AUTO_5811 )
      ( DELIVER-PKG ?AUTO_5806 ?AUTO_5807 )
      ( DELIVER-PKG-VERIFY ?AUTO_5806 ?AUTO_5807 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5829 - OBJ
      ?AUTO_5830 - LOCATION
    )
    :vars
    (
      ?AUTO_5835 - LOCATION
      ?AUTO_5833 - CITY
      ?AUTO_5831 - LOCATION
      ?AUTO_5832 - AIRPLANE
      ?AUTO_5834 - TRUCK
      ?AUTO_5836 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5835 ?AUTO_5833 ) ( IN-CITY ?AUTO_5830 ?AUTO_5833 ) ( not ( = ?AUTO_5830 ?AUTO_5835 ) ) ( AIRPORT ?AUTO_5831 ) ( AIRPORT ?AUTO_5835 ) ( not ( = ?AUTO_5831 ?AUTO_5835 ) ) ( not ( = ?AUTO_5830 ?AUTO_5831 ) ) ( OBJ-AT ?AUTO_5829 ?AUTO_5831 ) ( AIRPLANE-AT ?AUTO_5832 ?AUTO_5835 ) ( TRUCK-AT ?AUTO_5834 ?AUTO_5836 ) ( IN-CITY ?AUTO_5836 ?AUTO_5833 ) ( not ( = ?AUTO_5835 ?AUTO_5836 ) ) ( not ( = ?AUTO_5830 ?AUTO_5836 ) ) ( not ( = ?AUTO_5831 ?AUTO_5836 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5834 ?AUTO_5836 ?AUTO_5835 ?AUTO_5833 )
      ( DELIVER-PKG ?AUTO_5829 ?AUTO_5830 )
      ( DELIVER-PKG-VERIFY ?AUTO_5829 ?AUTO_5830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5849 - OBJ
      ?AUTO_5850 - LOCATION
    )
    :vars
    (
      ?AUTO_5852 - LOCATION
      ?AUTO_5854 - CITY
      ?AUTO_5853 - LOCATION
      ?AUTO_5855 - AIRPLANE
      ?AUTO_5851 - TRUCK
      ?AUTO_5856 - LOCATION
      ?AUTO_5857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5852 ?AUTO_5854 ) ( IN-CITY ?AUTO_5850 ?AUTO_5854 ) ( not ( = ?AUTO_5850 ?AUTO_5852 ) ) ( AIRPORT ?AUTO_5853 ) ( AIRPORT ?AUTO_5852 ) ( not ( = ?AUTO_5853 ?AUTO_5852 ) ) ( not ( = ?AUTO_5850 ?AUTO_5853 ) ) ( AIRPLANE-AT ?AUTO_5855 ?AUTO_5852 ) ( TRUCK-AT ?AUTO_5851 ?AUTO_5856 ) ( IN-CITY ?AUTO_5856 ?AUTO_5854 ) ( not ( = ?AUTO_5852 ?AUTO_5856 ) ) ( not ( = ?AUTO_5850 ?AUTO_5856 ) ) ( not ( = ?AUTO_5853 ?AUTO_5856 ) ) ( TRUCK-AT ?AUTO_5857 ?AUTO_5853 ) ( IN-TRUCK ?AUTO_5849 ?AUTO_5857 ) ( not ( = ?AUTO_5851 ?AUTO_5857 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5849 ?AUTO_5857 ?AUTO_5853 )
      ( DELIVER-PKG ?AUTO_5849 ?AUTO_5850 )
      ( DELIVER-PKG-VERIFY ?AUTO_5849 ?AUTO_5850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5858 - OBJ
      ?AUTO_5859 - LOCATION
    )
    :vars
    (
      ?AUTO_5862 - LOCATION
      ?AUTO_5865 - CITY
      ?AUTO_5866 - LOCATION
      ?AUTO_5864 - AIRPLANE
      ?AUTO_5863 - TRUCK
      ?AUTO_5861 - LOCATION
      ?AUTO_5860 - TRUCK
      ?AUTO_5867 - LOCATION
      ?AUTO_5868 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5862 ?AUTO_5865 ) ( IN-CITY ?AUTO_5859 ?AUTO_5865 ) ( not ( = ?AUTO_5859 ?AUTO_5862 ) ) ( AIRPORT ?AUTO_5866 ) ( AIRPORT ?AUTO_5862 ) ( not ( = ?AUTO_5866 ?AUTO_5862 ) ) ( not ( = ?AUTO_5859 ?AUTO_5866 ) ) ( AIRPLANE-AT ?AUTO_5864 ?AUTO_5862 ) ( TRUCK-AT ?AUTO_5863 ?AUTO_5861 ) ( IN-CITY ?AUTO_5861 ?AUTO_5865 ) ( not ( = ?AUTO_5862 ?AUTO_5861 ) ) ( not ( = ?AUTO_5859 ?AUTO_5861 ) ) ( not ( = ?AUTO_5866 ?AUTO_5861 ) ) ( IN-TRUCK ?AUTO_5858 ?AUTO_5860 ) ( not ( = ?AUTO_5863 ?AUTO_5860 ) ) ( TRUCK-AT ?AUTO_5860 ?AUTO_5867 ) ( IN-CITY ?AUTO_5867 ?AUTO_5868 ) ( IN-CITY ?AUTO_5866 ?AUTO_5868 ) ( not ( = ?AUTO_5866 ?AUTO_5867 ) ) ( not ( = ?AUTO_5859 ?AUTO_5867 ) ) ( not ( = ?AUTO_5862 ?AUTO_5867 ) ) ( not ( = ?AUTO_5865 ?AUTO_5868 ) ) ( not ( = ?AUTO_5861 ?AUTO_5867 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5860 ?AUTO_5867 ?AUTO_5866 ?AUTO_5868 )
      ( DELIVER-PKG ?AUTO_5858 ?AUTO_5859 )
      ( DELIVER-PKG-VERIFY ?AUTO_5858 ?AUTO_5859 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5873 - OBJ
      ?AUTO_5874 - LOCATION
    )
    :vars
    (
      ?AUTO_5877 - LOCATION
      ?AUTO_5876 - CITY
      ?AUTO_5882 - LOCATION
      ?AUTO_5879 - AIRPLANE
      ?AUTO_5878 - TRUCK
      ?AUTO_5883 - LOCATION
      ?AUTO_5881 - TRUCK
      ?AUTO_5880 - LOCATION
      ?AUTO_5875 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5877 ?AUTO_5876 ) ( IN-CITY ?AUTO_5874 ?AUTO_5876 ) ( not ( = ?AUTO_5874 ?AUTO_5877 ) ) ( AIRPORT ?AUTO_5882 ) ( AIRPORT ?AUTO_5877 ) ( not ( = ?AUTO_5882 ?AUTO_5877 ) ) ( not ( = ?AUTO_5874 ?AUTO_5882 ) ) ( AIRPLANE-AT ?AUTO_5879 ?AUTO_5877 ) ( TRUCK-AT ?AUTO_5878 ?AUTO_5883 ) ( IN-CITY ?AUTO_5883 ?AUTO_5876 ) ( not ( = ?AUTO_5877 ?AUTO_5883 ) ) ( not ( = ?AUTO_5874 ?AUTO_5883 ) ) ( not ( = ?AUTO_5882 ?AUTO_5883 ) ) ( not ( = ?AUTO_5878 ?AUTO_5881 ) ) ( TRUCK-AT ?AUTO_5881 ?AUTO_5880 ) ( IN-CITY ?AUTO_5880 ?AUTO_5875 ) ( IN-CITY ?AUTO_5882 ?AUTO_5875 ) ( not ( = ?AUTO_5882 ?AUTO_5880 ) ) ( not ( = ?AUTO_5874 ?AUTO_5880 ) ) ( not ( = ?AUTO_5877 ?AUTO_5880 ) ) ( not ( = ?AUTO_5876 ?AUTO_5875 ) ) ( not ( = ?AUTO_5883 ?AUTO_5880 ) ) ( OBJ-AT ?AUTO_5873 ?AUTO_5880 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5873 ?AUTO_5881 ?AUTO_5880 )
      ( DELIVER-PKG ?AUTO_5873 ?AUTO_5874 )
      ( DELIVER-PKG-VERIFY ?AUTO_5873 ?AUTO_5874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5884 - OBJ
      ?AUTO_5885 - LOCATION
    )
    :vars
    (
      ?AUTO_5891 - LOCATION
      ?AUTO_5886 - CITY
      ?AUTO_5889 - LOCATION
      ?AUTO_5892 - AIRPLANE
      ?AUTO_5887 - TRUCK
      ?AUTO_5894 - LOCATION
      ?AUTO_5888 - TRUCK
      ?AUTO_5893 - LOCATION
      ?AUTO_5890 - CITY
      ?AUTO_5895 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5891 ?AUTO_5886 ) ( IN-CITY ?AUTO_5885 ?AUTO_5886 ) ( not ( = ?AUTO_5885 ?AUTO_5891 ) ) ( AIRPORT ?AUTO_5889 ) ( AIRPORT ?AUTO_5891 ) ( not ( = ?AUTO_5889 ?AUTO_5891 ) ) ( not ( = ?AUTO_5885 ?AUTO_5889 ) ) ( AIRPLANE-AT ?AUTO_5892 ?AUTO_5891 ) ( TRUCK-AT ?AUTO_5887 ?AUTO_5894 ) ( IN-CITY ?AUTO_5894 ?AUTO_5886 ) ( not ( = ?AUTO_5891 ?AUTO_5894 ) ) ( not ( = ?AUTO_5885 ?AUTO_5894 ) ) ( not ( = ?AUTO_5889 ?AUTO_5894 ) ) ( not ( = ?AUTO_5887 ?AUTO_5888 ) ) ( IN-CITY ?AUTO_5893 ?AUTO_5890 ) ( IN-CITY ?AUTO_5889 ?AUTO_5890 ) ( not ( = ?AUTO_5889 ?AUTO_5893 ) ) ( not ( = ?AUTO_5885 ?AUTO_5893 ) ) ( not ( = ?AUTO_5891 ?AUTO_5893 ) ) ( not ( = ?AUTO_5886 ?AUTO_5890 ) ) ( not ( = ?AUTO_5894 ?AUTO_5893 ) ) ( OBJ-AT ?AUTO_5884 ?AUTO_5893 ) ( TRUCK-AT ?AUTO_5888 ?AUTO_5895 ) ( IN-CITY ?AUTO_5895 ?AUTO_5890 ) ( not ( = ?AUTO_5893 ?AUTO_5895 ) ) ( not ( = ?AUTO_5885 ?AUTO_5895 ) ) ( not ( = ?AUTO_5891 ?AUTO_5895 ) ) ( not ( = ?AUTO_5889 ?AUTO_5895 ) ) ( not ( = ?AUTO_5894 ?AUTO_5895 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5888 ?AUTO_5895 ?AUTO_5893 ?AUTO_5890 )
      ( DELIVER-PKG ?AUTO_5884 ?AUTO_5885 )
      ( DELIVER-PKG-VERIFY ?AUTO_5884 ?AUTO_5885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5898 - OBJ
      ?AUTO_5899 - LOCATION
    )
    :vars
    (
      ?AUTO_5900 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5900 ?AUTO_5899 ) ( IN-TRUCK ?AUTO_5898 ?AUTO_5900 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5898 ?AUTO_5900 ?AUTO_5899 )
      ( DELIVER-PKG-VERIFY ?AUTO_5898 ?AUTO_5899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5939 - OBJ
      ?AUTO_5940 - LOCATION
    )
    :vars
    (
      ?AUTO_5944 - LOCATION
      ?AUTO_5941 - CITY
      ?AUTO_5942 - LOCATION
      ?AUTO_5943 - AIRPLANE
      ?AUTO_5945 - TRUCK
      ?AUTO_5946 - LOCATION
      ?AUTO_5947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5944 ?AUTO_5941 ) ( IN-CITY ?AUTO_5940 ?AUTO_5941 ) ( not ( = ?AUTO_5940 ?AUTO_5944 ) ) ( AIRPORT ?AUTO_5942 ) ( AIRPORT ?AUTO_5944 ) ( not ( = ?AUTO_5942 ?AUTO_5944 ) ) ( not ( = ?AUTO_5940 ?AUTO_5942 ) ) ( AIRPLANE-AT ?AUTO_5943 ?AUTO_5944 ) ( TRUCK-AT ?AUTO_5945 ?AUTO_5946 ) ( IN-CITY ?AUTO_5946 ?AUTO_5941 ) ( not ( = ?AUTO_5944 ?AUTO_5946 ) ) ( not ( = ?AUTO_5940 ?AUTO_5946 ) ) ( not ( = ?AUTO_5942 ?AUTO_5946 ) ) ( TRUCK-AT ?AUTO_5947 ?AUTO_5942 ) ( IN-TRUCK ?AUTO_5939 ?AUTO_5947 ) ( not ( = ?AUTO_5945 ?AUTO_5947 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5939 ?AUTO_5947 ?AUTO_5942 )
      ( DELIVER-PKG ?AUTO_5939 ?AUTO_5940 )
      ( DELIVER-PKG-VERIFY ?AUTO_5939 ?AUTO_5940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5948 - OBJ
      ?AUTO_5949 - LOCATION
    )
    :vars
    (
      ?AUTO_5950 - LOCATION
      ?AUTO_5953 - CITY
      ?AUTO_5952 - LOCATION
      ?AUTO_5956 - AIRPLANE
      ?AUTO_5955 - TRUCK
      ?AUTO_5951 - LOCATION
      ?AUTO_5954 - TRUCK
      ?AUTO_5957 - LOCATION
      ?AUTO_5958 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5950 ?AUTO_5953 ) ( IN-CITY ?AUTO_5949 ?AUTO_5953 ) ( not ( = ?AUTO_5949 ?AUTO_5950 ) ) ( AIRPORT ?AUTO_5952 ) ( AIRPORT ?AUTO_5950 ) ( not ( = ?AUTO_5952 ?AUTO_5950 ) ) ( not ( = ?AUTO_5949 ?AUTO_5952 ) ) ( AIRPLANE-AT ?AUTO_5956 ?AUTO_5950 ) ( TRUCK-AT ?AUTO_5955 ?AUTO_5951 ) ( IN-CITY ?AUTO_5951 ?AUTO_5953 ) ( not ( = ?AUTO_5950 ?AUTO_5951 ) ) ( not ( = ?AUTO_5949 ?AUTO_5951 ) ) ( not ( = ?AUTO_5952 ?AUTO_5951 ) ) ( IN-TRUCK ?AUTO_5948 ?AUTO_5954 ) ( not ( = ?AUTO_5955 ?AUTO_5954 ) ) ( TRUCK-AT ?AUTO_5954 ?AUTO_5957 ) ( IN-CITY ?AUTO_5957 ?AUTO_5958 ) ( IN-CITY ?AUTO_5952 ?AUTO_5958 ) ( not ( = ?AUTO_5952 ?AUTO_5957 ) ) ( not ( = ?AUTO_5949 ?AUTO_5957 ) ) ( not ( = ?AUTO_5950 ?AUTO_5957 ) ) ( not ( = ?AUTO_5953 ?AUTO_5958 ) ) ( not ( = ?AUTO_5951 ?AUTO_5957 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5954 ?AUTO_5957 ?AUTO_5952 ?AUTO_5958 )
      ( DELIVER-PKG ?AUTO_5948 ?AUTO_5949 )
      ( DELIVER-PKG-VERIFY ?AUTO_5948 ?AUTO_5949 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5959 - OBJ
      ?AUTO_5960 - LOCATION
    )
    :vars
    (
      ?AUTO_5965 - LOCATION
      ?AUTO_5961 - CITY
      ?AUTO_5964 - LOCATION
      ?AUTO_5962 - AIRPLANE
      ?AUTO_5966 - TRUCK
      ?AUTO_5963 - LOCATION
      ?AUTO_5968 - TRUCK
      ?AUTO_5967 - LOCATION
      ?AUTO_5969 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5965 ?AUTO_5961 ) ( IN-CITY ?AUTO_5960 ?AUTO_5961 ) ( not ( = ?AUTO_5960 ?AUTO_5965 ) ) ( AIRPORT ?AUTO_5964 ) ( AIRPORT ?AUTO_5965 ) ( not ( = ?AUTO_5964 ?AUTO_5965 ) ) ( not ( = ?AUTO_5960 ?AUTO_5964 ) ) ( AIRPLANE-AT ?AUTO_5962 ?AUTO_5965 ) ( TRUCK-AT ?AUTO_5966 ?AUTO_5963 ) ( IN-CITY ?AUTO_5963 ?AUTO_5961 ) ( not ( = ?AUTO_5965 ?AUTO_5963 ) ) ( not ( = ?AUTO_5960 ?AUTO_5963 ) ) ( not ( = ?AUTO_5964 ?AUTO_5963 ) ) ( not ( = ?AUTO_5966 ?AUTO_5968 ) ) ( TRUCK-AT ?AUTO_5968 ?AUTO_5967 ) ( IN-CITY ?AUTO_5967 ?AUTO_5969 ) ( IN-CITY ?AUTO_5964 ?AUTO_5969 ) ( not ( = ?AUTO_5964 ?AUTO_5967 ) ) ( not ( = ?AUTO_5960 ?AUTO_5967 ) ) ( not ( = ?AUTO_5965 ?AUTO_5967 ) ) ( not ( = ?AUTO_5961 ?AUTO_5969 ) ) ( not ( = ?AUTO_5963 ?AUTO_5967 ) ) ( OBJ-AT ?AUTO_5959 ?AUTO_5967 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5959 ?AUTO_5968 ?AUTO_5967 )
      ( DELIVER-PKG ?AUTO_5959 ?AUTO_5960 )
      ( DELIVER-PKG-VERIFY ?AUTO_5959 ?AUTO_5960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5970 - OBJ
      ?AUTO_5971 - LOCATION
    )
    :vars
    (
      ?AUTO_5973 - LOCATION
      ?AUTO_5974 - CITY
      ?AUTO_5979 - LOCATION
      ?AUTO_5975 - AIRPLANE
      ?AUTO_5976 - TRUCK
      ?AUTO_5978 - LOCATION
      ?AUTO_5972 - TRUCK
      ?AUTO_5977 - LOCATION
      ?AUTO_5980 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5973 ?AUTO_5974 ) ( IN-CITY ?AUTO_5971 ?AUTO_5974 ) ( not ( = ?AUTO_5971 ?AUTO_5973 ) ) ( AIRPORT ?AUTO_5979 ) ( AIRPORT ?AUTO_5973 ) ( not ( = ?AUTO_5979 ?AUTO_5973 ) ) ( not ( = ?AUTO_5971 ?AUTO_5979 ) ) ( AIRPLANE-AT ?AUTO_5975 ?AUTO_5973 ) ( TRUCK-AT ?AUTO_5976 ?AUTO_5978 ) ( IN-CITY ?AUTO_5978 ?AUTO_5974 ) ( not ( = ?AUTO_5973 ?AUTO_5978 ) ) ( not ( = ?AUTO_5971 ?AUTO_5978 ) ) ( not ( = ?AUTO_5979 ?AUTO_5978 ) ) ( not ( = ?AUTO_5976 ?AUTO_5972 ) ) ( IN-CITY ?AUTO_5977 ?AUTO_5980 ) ( IN-CITY ?AUTO_5979 ?AUTO_5980 ) ( not ( = ?AUTO_5979 ?AUTO_5977 ) ) ( not ( = ?AUTO_5971 ?AUTO_5977 ) ) ( not ( = ?AUTO_5973 ?AUTO_5977 ) ) ( not ( = ?AUTO_5974 ?AUTO_5980 ) ) ( not ( = ?AUTO_5978 ?AUTO_5977 ) ) ( OBJ-AT ?AUTO_5970 ?AUTO_5977 ) ( TRUCK-AT ?AUTO_5972 ?AUTO_5979 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5972 ?AUTO_5979 ?AUTO_5977 ?AUTO_5980 )
      ( DELIVER-PKG ?AUTO_5970 ?AUTO_5971 )
      ( DELIVER-PKG-VERIFY ?AUTO_5970 ?AUTO_5971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5999 - OBJ
      ?AUTO_6000 - LOCATION
    )
    :vars
    (
      ?AUTO_6001 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6001 ?AUTO_6000 ) ( IN-TRUCK ?AUTO_5999 ?AUTO_6001 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5999 ?AUTO_6001 ?AUTO_6000 )
      ( DELIVER-PKG-VERIFY ?AUTO_5999 ?AUTO_6000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6002 - OBJ
      ?AUTO_6003 - LOCATION
    )
    :vars
    (
      ?AUTO_6004 - TRUCK
      ?AUTO_6005 - LOCATION
      ?AUTO_6006 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6002 ?AUTO_6004 ) ( TRUCK-AT ?AUTO_6004 ?AUTO_6005 ) ( IN-CITY ?AUTO_6005 ?AUTO_6006 ) ( IN-CITY ?AUTO_6003 ?AUTO_6006 ) ( not ( = ?AUTO_6003 ?AUTO_6005 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6004 ?AUTO_6005 ?AUTO_6003 ?AUTO_6006 )
      ( DELIVER-PKG ?AUTO_6002 ?AUTO_6003 )
      ( DELIVER-PKG-VERIFY ?AUTO_6002 ?AUTO_6003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6013 - OBJ
      ?AUTO_6014 - LOCATION
    )
    :vars
    (
      ?AUTO_6016 - TRUCK
      ?AUTO_6017 - LOCATION
      ?AUTO_6015 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6016 ?AUTO_6017 ) ( IN-CITY ?AUTO_6017 ?AUTO_6015 ) ( IN-CITY ?AUTO_6014 ?AUTO_6015 ) ( not ( = ?AUTO_6014 ?AUTO_6017 ) ) ( OBJ-AT ?AUTO_6013 ?AUTO_6017 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6013 ?AUTO_6016 ?AUTO_6017 )
      ( DELIVER-PKG ?AUTO_6013 ?AUTO_6014 )
      ( DELIVER-PKG-VERIFY ?AUTO_6013 ?AUTO_6014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6020 - OBJ
      ?AUTO_6021 - LOCATION
    )
    :vars
    (
      ?AUTO_6023 - TRUCK
      ?AUTO_6022 - LOCATION
      ?AUTO_6024 - CITY
      ?AUTO_6025 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6023 ?AUTO_6022 ) ( IN-CITY ?AUTO_6022 ?AUTO_6024 ) ( IN-CITY ?AUTO_6021 ?AUTO_6024 ) ( not ( = ?AUTO_6021 ?AUTO_6022 ) ) ( IN-AIRPLANE ?AUTO_6020 ?AUTO_6025 ) ( AIRPLANE-AT ?AUTO_6025 ?AUTO_6022 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6020 ?AUTO_6025 ?AUTO_6022 )
      ( DELIVER-PKG ?AUTO_6020 ?AUTO_6021 )
      ( DELIVER-PKG-VERIFY ?AUTO_6020 ?AUTO_6021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6030 - OBJ
      ?AUTO_6031 - LOCATION
    )
    :vars
    (
      ?AUTO_6036 - TRUCK
      ?AUTO_6034 - LOCATION
      ?AUTO_6035 - CITY
      ?AUTO_6032 - LOCATION
      ?AUTO_6033 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6036 ?AUTO_6034 ) ( IN-CITY ?AUTO_6034 ?AUTO_6035 ) ( IN-CITY ?AUTO_6031 ?AUTO_6035 ) ( not ( = ?AUTO_6031 ?AUTO_6034 ) ) ( AIRPORT ?AUTO_6032 ) ( AIRPORT ?AUTO_6034 ) ( AIRPLANE-AT ?AUTO_6033 ?AUTO_6032 ) ( not ( = ?AUTO_6032 ?AUTO_6034 ) ) ( not ( = ?AUTO_6031 ?AUTO_6032 ) ) ( OBJ-AT ?AUTO_6030 ?AUTO_6032 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6030 ?AUTO_6033 ?AUTO_6032 )
      ( DELIVER-PKG ?AUTO_6030 ?AUTO_6031 )
      ( DELIVER-PKG-VERIFY ?AUTO_6030 ?AUTO_6031 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6057 - OBJ
      ?AUTO_6058 - LOCATION
    )
    :vars
    (
      ?AUTO_6061 - LOCATION
      ?AUTO_6059 - CITY
      ?AUTO_6063 - LOCATION
      ?AUTO_6060 - AIRPLANE
      ?AUTO_6062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6061 ?AUTO_6059 ) ( IN-CITY ?AUTO_6058 ?AUTO_6059 ) ( not ( = ?AUTO_6058 ?AUTO_6061 ) ) ( AIRPORT ?AUTO_6063 ) ( AIRPORT ?AUTO_6061 ) ( not ( = ?AUTO_6063 ?AUTO_6061 ) ) ( not ( = ?AUTO_6058 ?AUTO_6063 ) ) ( OBJ-AT ?AUTO_6057 ?AUTO_6063 ) ( AIRPLANE-AT ?AUTO_6060 ?AUTO_6061 ) ( TRUCK-AT ?AUTO_6062 ?AUTO_6058 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6062 ?AUTO_6058 ?AUTO_6061 ?AUTO_6059 )
      ( DELIVER-PKG ?AUTO_6057 ?AUTO_6058 )
      ( DELIVER-PKG-VERIFY ?AUTO_6057 ?AUTO_6058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6074 - OBJ
      ?AUTO_6075 - LOCATION
    )
    :vars
    (
      ?AUTO_6077 - LOCATION
      ?AUTO_6080 - CITY
      ?AUTO_6076 - LOCATION
      ?AUTO_6079 - AIRPLANE
      ?AUTO_6078 - TRUCK
      ?AUTO_6081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6077 ?AUTO_6080 ) ( IN-CITY ?AUTO_6075 ?AUTO_6080 ) ( not ( = ?AUTO_6075 ?AUTO_6077 ) ) ( AIRPORT ?AUTO_6076 ) ( AIRPORT ?AUTO_6077 ) ( not ( = ?AUTO_6076 ?AUTO_6077 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( AIRPLANE-AT ?AUTO_6079 ?AUTO_6077 ) ( TRUCK-AT ?AUTO_6078 ?AUTO_6075 ) ( TRUCK-AT ?AUTO_6081 ?AUTO_6076 ) ( IN-TRUCK ?AUTO_6074 ?AUTO_6081 ) ( not ( = ?AUTO_6078 ?AUTO_6081 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6074 ?AUTO_6081 ?AUTO_6076 )
      ( DELIVER-PKG ?AUTO_6074 ?AUTO_6075 )
      ( DELIVER-PKG-VERIFY ?AUTO_6074 ?AUTO_6075 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6084 - OBJ
      ?AUTO_6085 - LOCATION
    )
    :vars
    (
      ?AUTO_6087 - LOCATION
      ?AUTO_6089 - CITY
      ?AUTO_6090 - LOCATION
      ?AUTO_6086 - AIRPLANE
      ?AUTO_6088 - TRUCK
      ?AUTO_6091 - TRUCK
      ?AUTO_6092 - LOCATION
      ?AUTO_6093 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6087 ?AUTO_6089 ) ( IN-CITY ?AUTO_6085 ?AUTO_6089 ) ( not ( = ?AUTO_6085 ?AUTO_6087 ) ) ( AIRPORT ?AUTO_6090 ) ( AIRPORT ?AUTO_6087 ) ( not ( = ?AUTO_6090 ?AUTO_6087 ) ) ( not ( = ?AUTO_6085 ?AUTO_6090 ) ) ( AIRPLANE-AT ?AUTO_6086 ?AUTO_6087 ) ( TRUCK-AT ?AUTO_6088 ?AUTO_6085 ) ( IN-TRUCK ?AUTO_6084 ?AUTO_6091 ) ( not ( = ?AUTO_6088 ?AUTO_6091 ) ) ( TRUCK-AT ?AUTO_6091 ?AUTO_6092 ) ( IN-CITY ?AUTO_6092 ?AUTO_6093 ) ( IN-CITY ?AUTO_6090 ?AUTO_6093 ) ( not ( = ?AUTO_6090 ?AUTO_6092 ) ) ( not ( = ?AUTO_6085 ?AUTO_6092 ) ) ( not ( = ?AUTO_6087 ?AUTO_6092 ) ) ( not ( = ?AUTO_6089 ?AUTO_6093 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6091 ?AUTO_6092 ?AUTO_6090 ?AUTO_6093 )
      ( DELIVER-PKG ?AUTO_6084 ?AUTO_6085 )
      ( DELIVER-PKG-VERIFY ?AUTO_6084 ?AUTO_6085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6094 - OBJ
      ?AUTO_6095 - LOCATION
    )
    :vars
    (
      ?AUTO_6101 - LOCATION
      ?AUTO_6102 - CITY
      ?AUTO_6103 - LOCATION
      ?AUTO_6099 - AIRPLANE
      ?AUTO_6096 - TRUCK
      ?AUTO_6100 - TRUCK
      ?AUTO_6098 - LOCATION
      ?AUTO_6097 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6101 ?AUTO_6102 ) ( IN-CITY ?AUTO_6095 ?AUTO_6102 ) ( not ( = ?AUTO_6095 ?AUTO_6101 ) ) ( AIRPORT ?AUTO_6103 ) ( AIRPORT ?AUTO_6101 ) ( not ( = ?AUTO_6103 ?AUTO_6101 ) ) ( not ( = ?AUTO_6095 ?AUTO_6103 ) ) ( AIRPLANE-AT ?AUTO_6099 ?AUTO_6101 ) ( TRUCK-AT ?AUTO_6096 ?AUTO_6095 ) ( not ( = ?AUTO_6096 ?AUTO_6100 ) ) ( TRUCK-AT ?AUTO_6100 ?AUTO_6098 ) ( IN-CITY ?AUTO_6098 ?AUTO_6097 ) ( IN-CITY ?AUTO_6103 ?AUTO_6097 ) ( not ( = ?AUTO_6103 ?AUTO_6098 ) ) ( not ( = ?AUTO_6095 ?AUTO_6098 ) ) ( not ( = ?AUTO_6101 ?AUTO_6098 ) ) ( not ( = ?AUTO_6102 ?AUTO_6097 ) ) ( OBJ-AT ?AUTO_6094 ?AUTO_6098 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6094 ?AUTO_6100 ?AUTO_6098 )
      ( DELIVER-PKG ?AUTO_6094 ?AUTO_6095 )
      ( DELIVER-PKG-VERIFY ?AUTO_6094 ?AUTO_6095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6104 - OBJ
      ?AUTO_6105 - LOCATION
    )
    :vars
    (
      ?AUTO_6112 - LOCATION
      ?AUTO_6107 - CITY
      ?AUTO_6111 - LOCATION
      ?AUTO_6106 - AIRPLANE
      ?AUTO_6113 - TRUCK
      ?AUTO_6110 - TRUCK
      ?AUTO_6109 - LOCATION
      ?AUTO_6108 - CITY
      ?AUTO_6114 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6112 ?AUTO_6107 ) ( IN-CITY ?AUTO_6105 ?AUTO_6107 ) ( not ( = ?AUTO_6105 ?AUTO_6112 ) ) ( AIRPORT ?AUTO_6111 ) ( AIRPORT ?AUTO_6112 ) ( not ( = ?AUTO_6111 ?AUTO_6112 ) ) ( not ( = ?AUTO_6105 ?AUTO_6111 ) ) ( AIRPLANE-AT ?AUTO_6106 ?AUTO_6112 ) ( TRUCK-AT ?AUTO_6113 ?AUTO_6105 ) ( not ( = ?AUTO_6113 ?AUTO_6110 ) ) ( IN-CITY ?AUTO_6109 ?AUTO_6108 ) ( IN-CITY ?AUTO_6111 ?AUTO_6108 ) ( not ( = ?AUTO_6111 ?AUTO_6109 ) ) ( not ( = ?AUTO_6105 ?AUTO_6109 ) ) ( not ( = ?AUTO_6112 ?AUTO_6109 ) ) ( not ( = ?AUTO_6107 ?AUTO_6108 ) ) ( OBJ-AT ?AUTO_6104 ?AUTO_6109 ) ( TRUCK-AT ?AUTO_6110 ?AUTO_6114 ) ( IN-CITY ?AUTO_6114 ?AUTO_6108 ) ( not ( = ?AUTO_6109 ?AUTO_6114 ) ) ( not ( = ?AUTO_6105 ?AUTO_6114 ) ) ( not ( = ?AUTO_6112 ?AUTO_6114 ) ) ( not ( = ?AUTO_6111 ?AUTO_6114 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6110 ?AUTO_6114 ?AUTO_6109 ?AUTO_6108 )
      ( DELIVER-PKG ?AUTO_6104 ?AUTO_6105 )
      ( DELIVER-PKG-VERIFY ?AUTO_6104 ?AUTO_6105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6117 - OBJ
      ?AUTO_6118 - LOCATION
    )
    :vars
    (
      ?AUTO_6119 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6119 ?AUTO_6118 ) ( IN-TRUCK ?AUTO_6117 ?AUTO_6119 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6117 ?AUTO_6119 ?AUTO_6118 )
      ( DELIVER-PKG-VERIFY ?AUTO_6117 ?AUTO_6118 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6120 - OBJ
      ?AUTO_6121 - LOCATION
    )
    :vars
    (
      ?AUTO_6122 - TRUCK
      ?AUTO_6123 - LOCATION
      ?AUTO_6124 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6120 ?AUTO_6122 ) ( TRUCK-AT ?AUTO_6122 ?AUTO_6123 ) ( IN-CITY ?AUTO_6123 ?AUTO_6124 ) ( IN-CITY ?AUTO_6121 ?AUTO_6124 ) ( not ( = ?AUTO_6121 ?AUTO_6123 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6122 ?AUTO_6123 ?AUTO_6121 ?AUTO_6124 )
      ( DELIVER-PKG ?AUTO_6120 ?AUTO_6121 )
      ( DELIVER-PKG-VERIFY ?AUTO_6120 ?AUTO_6121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6127 - OBJ
      ?AUTO_6128 - LOCATION
    )
    :vars
    (
      ?AUTO_6129 - TRUCK
      ?AUTO_6131 - LOCATION
      ?AUTO_6130 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6129 ?AUTO_6131 ) ( IN-CITY ?AUTO_6131 ?AUTO_6130 ) ( IN-CITY ?AUTO_6128 ?AUTO_6130 ) ( not ( = ?AUTO_6128 ?AUTO_6131 ) ) ( OBJ-AT ?AUTO_6127 ?AUTO_6131 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6127 ?AUTO_6129 ?AUTO_6131 )
      ( DELIVER-PKG ?AUTO_6127 ?AUTO_6128 )
      ( DELIVER-PKG-VERIFY ?AUTO_6127 ?AUTO_6128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6134 - OBJ
      ?AUTO_6135 - LOCATION
    )
    :vars
    (
      ?AUTO_6136 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6136 ?AUTO_6135 ) ( IN-TRUCK ?AUTO_6134 ?AUTO_6136 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6134 ?AUTO_6136 ?AUTO_6135 )
      ( DELIVER-PKG-VERIFY ?AUTO_6134 ?AUTO_6135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6143 - OBJ
      ?AUTO_6144 - LOCATION
    )
    :vars
    (
      ?AUTO_6146 - TRUCK
      ?AUTO_6145 - LOCATION
      ?AUTO_6147 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6146 ?AUTO_6145 ) ( IN-CITY ?AUTO_6145 ?AUTO_6147 ) ( IN-CITY ?AUTO_6144 ?AUTO_6147 ) ( not ( = ?AUTO_6144 ?AUTO_6145 ) ) ( OBJ-AT ?AUTO_6143 ?AUTO_6145 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6143 ?AUTO_6146 ?AUTO_6145 )
      ( DELIVER-PKG ?AUTO_6143 ?AUTO_6144 )
      ( DELIVER-PKG-VERIFY ?AUTO_6143 ?AUTO_6144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6152 - OBJ
      ?AUTO_6153 - LOCATION
    )
    :vars
    (
      ?AUTO_6154 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6152 ?AUTO_6154 ) ( AIRPLANE-AT ?AUTO_6154 ?AUTO_6153 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6152 ?AUTO_6154 ?AUTO_6153 )
      ( DELIVER-PKG-VERIFY ?AUTO_6152 ?AUTO_6153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6155 - OBJ
      ?AUTO_6156 - LOCATION
    )
    :vars
    (
      ?AUTO_6157 - AIRPLANE
      ?AUTO_6158 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6155 ?AUTO_6157 ) ( AIRPORT ?AUTO_6158 ) ( AIRPORT ?AUTO_6156 ) ( AIRPLANE-AT ?AUTO_6157 ?AUTO_6158 ) ( not ( = ?AUTO_6158 ?AUTO_6156 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6157 ?AUTO_6158 ?AUTO_6156 )
      ( DELIVER-PKG ?AUTO_6155 ?AUTO_6156 )
      ( DELIVER-PKG-VERIFY ?AUTO_6155 ?AUTO_6156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6165 - OBJ
      ?AUTO_6166 - LOCATION
    )
    :vars
    (
      ?AUTO_6168 - LOCATION
      ?AUTO_6167 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6168 ) ( AIRPORT ?AUTO_6166 ) ( AIRPLANE-AT ?AUTO_6167 ?AUTO_6168 ) ( not ( = ?AUTO_6168 ?AUTO_6166 ) ) ( OBJ-AT ?AUTO_6165 ?AUTO_6168 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6165 ?AUTO_6167 ?AUTO_6168 )
      ( DELIVER-PKG ?AUTO_6165 ?AUTO_6166 )
      ( DELIVER-PKG-VERIFY ?AUTO_6165 ?AUTO_6166 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6169 - OBJ
      ?AUTO_6170 - LOCATION
    )
    :vars
    (
      ?AUTO_6172 - LOCATION
      ?AUTO_6173 - LOCATION
      ?AUTO_6171 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6172 ) ( AIRPORT ?AUTO_6170 ) ( not ( = ?AUTO_6172 ?AUTO_6170 ) ) ( OBJ-AT ?AUTO_6169 ?AUTO_6172 ) ( AIRPORT ?AUTO_6173 ) ( AIRPLANE-AT ?AUTO_6171 ?AUTO_6173 ) ( not ( = ?AUTO_6173 ?AUTO_6172 ) ) ( not ( = ?AUTO_6170 ?AUTO_6173 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6171 ?AUTO_6173 ?AUTO_6172 )
      ( DELIVER-PKG ?AUTO_6169 ?AUTO_6170 )
      ( DELIVER-PKG-VERIFY ?AUTO_6169 ?AUTO_6170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6178 - OBJ
      ?AUTO_6179 - LOCATION
    )
    :vars
    (
      ?AUTO_6180 - LOCATION
      ?AUTO_6181 - LOCATION
      ?AUTO_6182 - AIRPLANE
      ?AUTO_6183 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6180 ) ( AIRPORT ?AUTO_6179 ) ( not ( = ?AUTO_6180 ?AUTO_6179 ) ) ( AIRPORT ?AUTO_6181 ) ( AIRPLANE-AT ?AUTO_6182 ?AUTO_6181 ) ( not ( = ?AUTO_6181 ?AUTO_6180 ) ) ( not ( = ?AUTO_6179 ?AUTO_6181 ) ) ( TRUCK-AT ?AUTO_6183 ?AUTO_6180 ) ( IN-TRUCK ?AUTO_6178 ?AUTO_6183 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6178 ?AUTO_6183 ?AUTO_6180 )
      ( DELIVER-PKG ?AUTO_6178 ?AUTO_6179 )
      ( DELIVER-PKG-VERIFY ?AUTO_6178 ?AUTO_6179 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6184 - OBJ
      ?AUTO_6185 - LOCATION
    )
    :vars
    (
      ?AUTO_6186 - LOCATION
      ?AUTO_6189 - LOCATION
      ?AUTO_6187 - AIRPLANE
      ?AUTO_6188 - TRUCK
      ?AUTO_6190 - LOCATION
      ?AUTO_6191 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6186 ) ( AIRPORT ?AUTO_6185 ) ( not ( = ?AUTO_6186 ?AUTO_6185 ) ) ( AIRPORT ?AUTO_6189 ) ( AIRPLANE-AT ?AUTO_6187 ?AUTO_6189 ) ( not ( = ?AUTO_6189 ?AUTO_6186 ) ) ( not ( = ?AUTO_6185 ?AUTO_6189 ) ) ( IN-TRUCK ?AUTO_6184 ?AUTO_6188 ) ( TRUCK-AT ?AUTO_6188 ?AUTO_6190 ) ( IN-CITY ?AUTO_6190 ?AUTO_6191 ) ( IN-CITY ?AUTO_6186 ?AUTO_6191 ) ( not ( = ?AUTO_6186 ?AUTO_6190 ) ) ( not ( = ?AUTO_6185 ?AUTO_6190 ) ) ( not ( = ?AUTO_6189 ?AUTO_6190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6188 ?AUTO_6190 ?AUTO_6186 ?AUTO_6191 )
      ( DELIVER-PKG ?AUTO_6184 ?AUTO_6185 )
      ( DELIVER-PKG-VERIFY ?AUTO_6184 ?AUTO_6185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6194 - OBJ
      ?AUTO_6195 - LOCATION
    )
    :vars
    (
      ?AUTO_6199 - LOCATION
      ?AUTO_6197 - LOCATION
      ?AUTO_6196 - AIRPLANE
      ?AUTO_6201 - TRUCK
      ?AUTO_6198 - LOCATION
      ?AUTO_6200 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6199 ) ( AIRPORT ?AUTO_6195 ) ( not ( = ?AUTO_6199 ?AUTO_6195 ) ) ( AIRPORT ?AUTO_6197 ) ( AIRPLANE-AT ?AUTO_6196 ?AUTO_6197 ) ( not ( = ?AUTO_6197 ?AUTO_6199 ) ) ( not ( = ?AUTO_6195 ?AUTO_6197 ) ) ( TRUCK-AT ?AUTO_6201 ?AUTO_6198 ) ( IN-CITY ?AUTO_6198 ?AUTO_6200 ) ( IN-CITY ?AUTO_6199 ?AUTO_6200 ) ( not ( = ?AUTO_6199 ?AUTO_6198 ) ) ( not ( = ?AUTO_6195 ?AUTO_6198 ) ) ( not ( = ?AUTO_6197 ?AUTO_6198 ) ) ( OBJ-AT ?AUTO_6194 ?AUTO_6198 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6194 ?AUTO_6201 ?AUTO_6198 )
      ( DELIVER-PKG ?AUTO_6194 ?AUTO_6195 )
      ( DELIVER-PKG-VERIFY ?AUTO_6194 ?AUTO_6195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6204 - OBJ
      ?AUTO_6205 - LOCATION
    )
    :vars
    (
      ?AUTO_6206 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6204 ?AUTO_6206 ) ( AIRPLANE-AT ?AUTO_6206 ?AUTO_6205 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6204 ?AUTO_6206 ?AUTO_6205 )
      ( DELIVER-PKG-VERIFY ?AUTO_6204 ?AUTO_6205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6211 - OBJ
      ?AUTO_6212 - LOCATION
    )
    :vars
    (
      ?AUTO_6213 - LOCATION
      ?AUTO_6214 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6213 ) ( AIRPORT ?AUTO_6212 ) ( AIRPLANE-AT ?AUTO_6214 ?AUTO_6213 ) ( not ( = ?AUTO_6213 ?AUTO_6212 ) ) ( OBJ-AT ?AUTO_6211 ?AUTO_6213 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6211 ?AUTO_6214 ?AUTO_6213 )
      ( DELIVER-PKG ?AUTO_6211 ?AUTO_6212 )
      ( DELIVER-PKG-VERIFY ?AUTO_6211 ?AUTO_6212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6215 - OBJ
      ?AUTO_6216 - LOCATION
    )
    :vars
    (
      ?AUTO_6218 - LOCATION
      ?AUTO_6219 - LOCATION
      ?AUTO_6217 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6218 ) ( AIRPORT ?AUTO_6216 ) ( not ( = ?AUTO_6218 ?AUTO_6216 ) ) ( OBJ-AT ?AUTO_6215 ?AUTO_6218 ) ( AIRPORT ?AUTO_6219 ) ( AIRPLANE-AT ?AUTO_6217 ?AUTO_6219 ) ( not ( = ?AUTO_6219 ?AUTO_6218 ) ) ( not ( = ?AUTO_6216 ?AUTO_6219 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6217 ?AUTO_6219 ?AUTO_6218 )
      ( DELIVER-PKG ?AUTO_6215 ?AUTO_6216 )
      ( DELIVER-PKG-VERIFY ?AUTO_6215 ?AUTO_6216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6240 - OBJ
      ?AUTO_6241 - LOCATION
    )
    :vars
    (
      ?AUTO_6242 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6240 ?AUTO_6242 ) ( AIRPLANE-AT ?AUTO_6242 ?AUTO_6241 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6240 ?AUTO_6242 ?AUTO_6241 )
      ( DELIVER-PKG-VERIFY ?AUTO_6240 ?AUTO_6241 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6243 - OBJ
      ?AUTO_6244 - LOCATION
    )
    :vars
    (
      ?AUTO_6245 - AIRPLANE
      ?AUTO_6246 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6243 ?AUTO_6245 ) ( AIRPORT ?AUTO_6246 ) ( AIRPORT ?AUTO_6244 ) ( AIRPLANE-AT ?AUTO_6245 ?AUTO_6246 ) ( not ( = ?AUTO_6246 ?AUTO_6244 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6245 ?AUTO_6246 ?AUTO_6244 )
      ( DELIVER-PKG ?AUTO_6243 ?AUTO_6244 )
      ( DELIVER-PKG-VERIFY ?AUTO_6243 ?AUTO_6244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6247 - OBJ
      ?AUTO_6248 - LOCATION
    )
    :vars
    (
      ?AUTO_6250 - LOCATION
      ?AUTO_6249 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6250 ) ( AIRPORT ?AUTO_6248 ) ( AIRPLANE-AT ?AUTO_6249 ?AUTO_6250 ) ( not ( = ?AUTO_6250 ?AUTO_6248 ) ) ( OBJ-AT ?AUTO_6247 ?AUTO_6250 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6247 ?AUTO_6249 ?AUTO_6250 )
      ( DELIVER-PKG ?AUTO_6247 ?AUTO_6248 )
      ( DELIVER-PKG-VERIFY ?AUTO_6247 ?AUTO_6248 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6251 - OBJ
      ?AUTO_6252 - LOCATION
    )
    :vars
    (
      ?AUTO_6254 - LOCATION
      ?AUTO_6255 - LOCATION
      ?AUTO_6253 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6254 ) ( AIRPORT ?AUTO_6252 ) ( not ( = ?AUTO_6254 ?AUTO_6252 ) ) ( OBJ-AT ?AUTO_6251 ?AUTO_6254 ) ( AIRPORT ?AUTO_6255 ) ( AIRPLANE-AT ?AUTO_6253 ?AUTO_6255 ) ( not ( = ?AUTO_6255 ?AUTO_6254 ) ) ( not ( = ?AUTO_6252 ?AUTO_6255 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6253 ?AUTO_6255 ?AUTO_6254 )
      ( DELIVER-PKG ?AUTO_6251 ?AUTO_6252 )
      ( DELIVER-PKG-VERIFY ?AUTO_6251 ?AUTO_6252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6286 - OBJ
      ?AUTO_6287 - LOCATION
    )
    :vars
    (
      ?AUTO_6288 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6288 ?AUTO_6287 ) ( IN-TRUCK ?AUTO_6286 ?AUTO_6288 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6286 ?AUTO_6288 ?AUTO_6287 )
      ( DELIVER-PKG-VERIFY ?AUTO_6286 ?AUTO_6287 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6289 - OBJ
      ?AUTO_6290 - LOCATION
    )
    :vars
    (
      ?AUTO_6291 - TRUCK
      ?AUTO_6292 - LOCATION
      ?AUTO_6293 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6289 ?AUTO_6291 ) ( TRUCK-AT ?AUTO_6291 ?AUTO_6292 ) ( IN-CITY ?AUTO_6292 ?AUTO_6293 ) ( IN-CITY ?AUTO_6290 ?AUTO_6293 ) ( not ( = ?AUTO_6290 ?AUTO_6292 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6291 ?AUTO_6292 ?AUTO_6290 ?AUTO_6293 )
      ( DELIVER-PKG ?AUTO_6289 ?AUTO_6290 )
      ( DELIVER-PKG-VERIFY ?AUTO_6289 ?AUTO_6290 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6320 - OBJ
      ?AUTO_6321 - LOCATION
    )
    :vars
    (
      ?AUTO_6322 - TRUCK
      ?AUTO_6324 - LOCATION
      ?AUTO_6323 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6322 ?AUTO_6324 ) ( IN-CITY ?AUTO_6324 ?AUTO_6323 ) ( IN-CITY ?AUTO_6321 ?AUTO_6323 ) ( not ( = ?AUTO_6321 ?AUTO_6324 ) ) ( OBJ-AT ?AUTO_6320 ?AUTO_6324 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6320 ?AUTO_6322 ?AUTO_6324 )
      ( DELIVER-PKG ?AUTO_6320 ?AUTO_6321 )
      ( DELIVER-PKG-VERIFY ?AUTO_6320 ?AUTO_6321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6335 - OBJ
      ?AUTO_6336 - LOCATION
    )
    :vars
    (
      ?AUTO_6337 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6335 ?AUTO_6337 ) ( AIRPLANE-AT ?AUTO_6337 ?AUTO_6336 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6335 ?AUTO_6337 ?AUTO_6336 )
      ( DELIVER-PKG-VERIFY ?AUTO_6335 ?AUTO_6336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6342 - OBJ
      ?AUTO_6343 - LOCATION
    )
    :vars
    (
      ?AUTO_6344 - AIRPLANE
      ?AUTO_6345 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6342 ?AUTO_6344 ) ( AIRPORT ?AUTO_6345 ) ( AIRPORT ?AUTO_6343 ) ( AIRPLANE-AT ?AUTO_6344 ?AUTO_6345 ) ( not ( = ?AUTO_6345 ?AUTO_6343 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6344 ?AUTO_6345 ?AUTO_6343 )
      ( DELIVER-PKG ?AUTO_6342 ?AUTO_6343 )
      ( DELIVER-PKG-VERIFY ?AUTO_6342 ?AUTO_6343 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6378 - OBJ
      ?AUTO_6379 - LOCATION
    )
    :vars
    (
      ?AUTO_6380 - LOCATION
      ?AUTO_6382 - LOCATION
      ?AUTO_6381 - AIRPLANE
      ?AUTO_6383 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6380 ) ( AIRPORT ?AUTO_6379 ) ( not ( = ?AUTO_6380 ?AUTO_6379 ) ) ( AIRPORT ?AUTO_6382 ) ( AIRPLANE-AT ?AUTO_6381 ?AUTO_6382 ) ( not ( = ?AUTO_6382 ?AUTO_6380 ) ) ( not ( = ?AUTO_6379 ?AUTO_6382 ) ) ( TRUCK-AT ?AUTO_6383 ?AUTO_6380 ) ( IN-TRUCK ?AUTO_6378 ?AUTO_6383 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6378 ?AUTO_6383 ?AUTO_6380 )
      ( DELIVER-PKG ?AUTO_6378 ?AUTO_6379 )
      ( DELIVER-PKG-VERIFY ?AUTO_6378 ?AUTO_6379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6390 - OBJ
      ?AUTO_6391 - LOCATION
    )
    :vars
    (
      ?AUTO_6397 - LOCATION
      ?AUTO_6393 - LOCATION
      ?AUTO_6396 - AIRPLANE
      ?AUTO_6394 - TRUCK
      ?AUTO_6392 - LOCATION
      ?AUTO_6395 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6397 ) ( AIRPORT ?AUTO_6391 ) ( not ( = ?AUTO_6397 ?AUTO_6391 ) ) ( AIRPORT ?AUTO_6393 ) ( AIRPLANE-AT ?AUTO_6396 ?AUTO_6393 ) ( not ( = ?AUTO_6393 ?AUTO_6397 ) ) ( not ( = ?AUTO_6391 ?AUTO_6393 ) ) ( TRUCK-AT ?AUTO_6394 ?AUTO_6392 ) ( IN-CITY ?AUTO_6392 ?AUTO_6395 ) ( IN-CITY ?AUTO_6397 ?AUTO_6395 ) ( not ( = ?AUTO_6397 ?AUTO_6392 ) ) ( not ( = ?AUTO_6391 ?AUTO_6392 ) ) ( not ( = ?AUTO_6393 ?AUTO_6392 ) ) ( OBJ-AT ?AUTO_6390 ?AUTO_6392 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6390 ?AUTO_6394 ?AUTO_6392 )
      ( DELIVER-PKG ?AUTO_6390 ?AUTO_6391 )
      ( DELIVER-PKG-VERIFY ?AUTO_6390 ?AUTO_6391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6402 - OBJ
      ?AUTO_6403 - LOCATION
    )
    :vars
    (
      ?AUTO_6404 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6402 ?AUTO_6404 ) ( AIRPLANE-AT ?AUTO_6404 ?AUTO_6403 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6402 ?AUTO_6404 ?AUTO_6403 )
      ( DELIVER-PKG-VERIFY ?AUTO_6402 ?AUTO_6403 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6413 - OBJ
      ?AUTO_6414 - LOCATION
    )
    :vars
    (
      ?AUTO_6415 - LOCATION
      ?AUTO_6416 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6415 ) ( AIRPORT ?AUTO_6414 ) ( AIRPLANE-AT ?AUTO_6416 ?AUTO_6415 ) ( not ( = ?AUTO_6415 ?AUTO_6414 ) ) ( OBJ-AT ?AUTO_6413 ?AUTO_6415 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6413 ?AUTO_6416 ?AUTO_6415 )
      ( DELIVER-PKG ?AUTO_6413 ?AUTO_6414 )
      ( DELIVER-PKG-VERIFY ?AUTO_6413 ?AUTO_6414 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6417 - OBJ
      ?AUTO_6418 - LOCATION
    )
    :vars
    (
      ?AUTO_6420 - LOCATION
      ?AUTO_6421 - LOCATION
      ?AUTO_6419 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6420 ) ( AIRPORT ?AUTO_6418 ) ( not ( = ?AUTO_6420 ?AUTO_6418 ) ) ( OBJ-AT ?AUTO_6417 ?AUTO_6420 ) ( AIRPORT ?AUTO_6421 ) ( AIRPLANE-AT ?AUTO_6419 ?AUTO_6421 ) ( not ( = ?AUTO_6421 ?AUTO_6420 ) ) ( not ( = ?AUTO_6418 ?AUTO_6421 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6419 ?AUTO_6421 ?AUTO_6420 )
      ( DELIVER-PKG ?AUTO_6417 ?AUTO_6418 )
      ( DELIVER-PKG-VERIFY ?AUTO_6417 ?AUTO_6418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6422 - OBJ
      ?AUTO_6423 - LOCATION
    )
    :vars
    (
      ?AUTO_6425 - LOCATION
      ?AUTO_6426 - LOCATION
      ?AUTO_6424 - AIRPLANE
      ?AUTO_6427 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6425 ) ( AIRPORT ?AUTO_6423 ) ( not ( = ?AUTO_6425 ?AUTO_6423 ) ) ( AIRPORT ?AUTO_6426 ) ( AIRPLANE-AT ?AUTO_6424 ?AUTO_6426 ) ( not ( = ?AUTO_6426 ?AUTO_6425 ) ) ( not ( = ?AUTO_6423 ?AUTO_6426 ) ) ( TRUCK-AT ?AUTO_6427 ?AUTO_6425 ) ( IN-TRUCK ?AUTO_6422 ?AUTO_6427 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6422 ?AUTO_6427 ?AUTO_6425 )
      ( DELIVER-PKG ?AUTO_6422 ?AUTO_6423 )
      ( DELIVER-PKG-VERIFY ?AUTO_6422 ?AUTO_6423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6428 - OBJ
      ?AUTO_6429 - LOCATION
    )
    :vars
    (
      ?AUTO_6430 - LOCATION
      ?AUTO_6432 - LOCATION
      ?AUTO_6431 - AIRPLANE
      ?AUTO_6433 - TRUCK
      ?AUTO_6434 - LOCATION
      ?AUTO_6435 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6430 ) ( AIRPORT ?AUTO_6429 ) ( not ( = ?AUTO_6430 ?AUTO_6429 ) ) ( AIRPORT ?AUTO_6432 ) ( AIRPLANE-AT ?AUTO_6431 ?AUTO_6432 ) ( not ( = ?AUTO_6432 ?AUTO_6430 ) ) ( not ( = ?AUTO_6429 ?AUTO_6432 ) ) ( IN-TRUCK ?AUTO_6428 ?AUTO_6433 ) ( TRUCK-AT ?AUTO_6433 ?AUTO_6434 ) ( IN-CITY ?AUTO_6434 ?AUTO_6435 ) ( IN-CITY ?AUTO_6430 ?AUTO_6435 ) ( not ( = ?AUTO_6430 ?AUTO_6434 ) ) ( not ( = ?AUTO_6429 ?AUTO_6434 ) ) ( not ( = ?AUTO_6432 ?AUTO_6434 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6433 ?AUTO_6434 ?AUTO_6430 ?AUTO_6435 )
      ( DELIVER-PKG ?AUTO_6428 ?AUTO_6429 )
      ( DELIVER-PKG-VERIFY ?AUTO_6428 ?AUTO_6429 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6462 - OBJ
      ?AUTO_6463 - LOCATION
    )
    :vars
    (
      ?AUTO_6464 - LOCATION
      ?AUTO_6467 - LOCATION
      ?AUTO_6465 - AIRPLANE
      ?AUTO_6469 - TRUCK
      ?AUTO_6468 - LOCATION
      ?AUTO_6466 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6464 ) ( AIRPORT ?AUTO_6463 ) ( not ( = ?AUTO_6464 ?AUTO_6463 ) ) ( AIRPORT ?AUTO_6467 ) ( AIRPLANE-AT ?AUTO_6465 ?AUTO_6467 ) ( not ( = ?AUTO_6467 ?AUTO_6464 ) ) ( not ( = ?AUTO_6463 ?AUTO_6467 ) ) ( TRUCK-AT ?AUTO_6469 ?AUTO_6468 ) ( IN-CITY ?AUTO_6468 ?AUTO_6466 ) ( IN-CITY ?AUTO_6464 ?AUTO_6466 ) ( not ( = ?AUTO_6464 ?AUTO_6468 ) ) ( not ( = ?AUTO_6463 ?AUTO_6468 ) ) ( not ( = ?AUTO_6467 ?AUTO_6468 ) ) ( OBJ-AT ?AUTO_6462 ?AUTO_6468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6462 ?AUTO_6469 ?AUTO_6468 )
      ( DELIVER-PKG ?AUTO_6462 ?AUTO_6463 )
      ( DELIVER-PKG-VERIFY ?AUTO_6462 ?AUTO_6463 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6480 - OBJ
      ?AUTO_6481 - LOCATION
    )
    :vars
    (
      ?AUTO_6482 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6482 ?AUTO_6481 ) ( IN-TRUCK ?AUTO_6480 ?AUTO_6482 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6480 ?AUTO_6482 ?AUTO_6481 )
      ( DELIVER-PKG-VERIFY ?AUTO_6480 ?AUTO_6481 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6487 - OBJ
      ?AUTO_6488 - LOCATION
    )
    :vars
    (
      ?AUTO_6489 - TRUCK
      ?AUTO_6490 - LOCATION
      ?AUTO_6491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6487 ?AUTO_6489 ) ( TRUCK-AT ?AUTO_6489 ?AUTO_6490 ) ( IN-CITY ?AUTO_6490 ?AUTO_6491 ) ( IN-CITY ?AUTO_6488 ?AUTO_6491 ) ( not ( = ?AUTO_6488 ?AUTO_6490 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6489 ?AUTO_6490 ?AUTO_6488 ?AUTO_6491 )
      ( DELIVER-PKG ?AUTO_6487 ?AUTO_6488 )
      ( DELIVER-PKG-VERIFY ?AUTO_6487 ?AUTO_6488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6492 - OBJ
      ?AUTO_6493 - LOCATION
    )
    :vars
    (
      ?AUTO_6494 - TRUCK
      ?AUTO_6495 - LOCATION
      ?AUTO_6496 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6494 ?AUTO_6495 ) ( IN-CITY ?AUTO_6495 ?AUTO_6496 ) ( IN-CITY ?AUTO_6493 ?AUTO_6496 ) ( not ( = ?AUTO_6493 ?AUTO_6495 ) ) ( OBJ-AT ?AUTO_6492 ?AUTO_6495 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6492 ?AUTO_6494 ?AUTO_6495 )
      ( DELIVER-PKG ?AUTO_6492 ?AUTO_6493 )
      ( DELIVER-PKG-VERIFY ?AUTO_6492 ?AUTO_6493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6505 - OBJ
      ?AUTO_6506 - LOCATION
    )
    :vars
    (
      ?AUTO_6507 - LOCATION
      ?AUTO_6509 - CITY
      ?AUTO_6508 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6507 ?AUTO_6509 ) ( IN-CITY ?AUTO_6506 ?AUTO_6509 ) ( not ( = ?AUTO_6506 ?AUTO_6507 ) ) ( OBJ-AT ?AUTO_6505 ?AUTO_6507 ) ( TRUCK-AT ?AUTO_6508 ?AUTO_6506 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6508 ?AUTO_6506 ?AUTO_6507 ?AUTO_6509 )
      ( DELIVER-PKG ?AUTO_6505 ?AUTO_6506 )
      ( DELIVER-PKG-VERIFY ?AUTO_6505 ?AUTO_6506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6520 - OBJ
      ?AUTO_6521 - LOCATION
    )
    :vars
    (
      ?AUTO_6524 - LOCATION
      ?AUTO_6522 - CITY
      ?AUTO_6523 - TRUCK
      ?AUTO_6525 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6524 ?AUTO_6522 ) ( IN-CITY ?AUTO_6521 ?AUTO_6522 ) ( not ( = ?AUTO_6521 ?AUTO_6524 ) ) ( TRUCK-AT ?AUTO_6523 ?AUTO_6521 ) ( IN-AIRPLANE ?AUTO_6520 ?AUTO_6525 ) ( AIRPLANE-AT ?AUTO_6525 ?AUTO_6524 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6520 ?AUTO_6525 ?AUTO_6524 )
      ( DELIVER-PKG ?AUTO_6520 ?AUTO_6521 )
      ( DELIVER-PKG-VERIFY ?AUTO_6520 ?AUTO_6521 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6526 - OBJ
      ?AUTO_6527 - LOCATION
    )
    :vars
    (
      ?AUTO_6528 - LOCATION
      ?AUTO_6529 - CITY
      ?AUTO_6530 - TRUCK
      ?AUTO_6531 - AIRPLANE
      ?AUTO_6532 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6528 ?AUTO_6529 ) ( IN-CITY ?AUTO_6527 ?AUTO_6529 ) ( not ( = ?AUTO_6527 ?AUTO_6528 ) ) ( TRUCK-AT ?AUTO_6530 ?AUTO_6527 ) ( IN-AIRPLANE ?AUTO_6526 ?AUTO_6531 ) ( AIRPORT ?AUTO_6532 ) ( AIRPORT ?AUTO_6528 ) ( AIRPLANE-AT ?AUTO_6531 ?AUTO_6532 ) ( not ( = ?AUTO_6532 ?AUTO_6528 ) ) ( not ( = ?AUTO_6527 ?AUTO_6532 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6531 ?AUTO_6532 ?AUTO_6528 )
      ( DELIVER-PKG ?AUTO_6526 ?AUTO_6527 )
      ( DELIVER-PKG-VERIFY ?AUTO_6526 ?AUTO_6527 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6539 - OBJ
      ?AUTO_6540 - LOCATION
    )
    :vars
    (
      ?AUTO_6543 - LOCATION
      ?AUTO_6541 - CITY
      ?AUTO_6544 - TRUCK
      ?AUTO_6542 - LOCATION
      ?AUTO_6545 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6543 ?AUTO_6541 ) ( IN-CITY ?AUTO_6540 ?AUTO_6541 ) ( not ( = ?AUTO_6540 ?AUTO_6543 ) ) ( TRUCK-AT ?AUTO_6544 ?AUTO_6540 ) ( AIRPORT ?AUTO_6542 ) ( AIRPORT ?AUTO_6543 ) ( AIRPLANE-AT ?AUTO_6545 ?AUTO_6542 ) ( not ( = ?AUTO_6542 ?AUTO_6543 ) ) ( not ( = ?AUTO_6540 ?AUTO_6542 ) ) ( OBJ-AT ?AUTO_6539 ?AUTO_6542 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6539 ?AUTO_6545 ?AUTO_6542 )
      ( DELIVER-PKG ?AUTO_6539 ?AUTO_6540 )
      ( DELIVER-PKG-VERIFY ?AUTO_6539 ?AUTO_6540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6546 - OBJ
      ?AUTO_6547 - LOCATION
    )
    :vars
    (
      ?AUTO_6550 - LOCATION
      ?AUTO_6551 - CITY
      ?AUTO_6548 - TRUCK
      ?AUTO_6552 - LOCATION
      ?AUTO_6553 - LOCATION
      ?AUTO_6549 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6550 ?AUTO_6551 ) ( IN-CITY ?AUTO_6547 ?AUTO_6551 ) ( not ( = ?AUTO_6547 ?AUTO_6550 ) ) ( TRUCK-AT ?AUTO_6548 ?AUTO_6547 ) ( AIRPORT ?AUTO_6552 ) ( AIRPORT ?AUTO_6550 ) ( not ( = ?AUTO_6552 ?AUTO_6550 ) ) ( not ( = ?AUTO_6547 ?AUTO_6552 ) ) ( OBJ-AT ?AUTO_6546 ?AUTO_6552 ) ( AIRPORT ?AUTO_6553 ) ( AIRPLANE-AT ?AUTO_6549 ?AUTO_6553 ) ( not ( = ?AUTO_6553 ?AUTO_6552 ) ) ( not ( = ?AUTO_6547 ?AUTO_6553 ) ) ( not ( = ?AUTO_6550 ?AUTO_6553 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6549 ?AUTO_6553 ?AUTO_6552 )
      ( DELIVER-PKG ?AUTO_6546 ?AUTO_6547 )
      ( DELIVER-PKG-VERIFY ?AUTO_6546 ?AUTO_6547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6558 - OBJ
      ?AUTO_6559 - LOCATION
    )
    :vars
    (
      ?AUTO_6560 - LOCATION
      ?AUTO_6561 - CITY
      ?AUTO_6562 - TRUCK
      ?AUTO_6565 - LOCATION
      ?AUTO_6564 - LOCATION
      ?AUTO_6563 - AIRPLANE
      ?AUTO_6566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6560 ?AUTO_6561 ) ( IN-CITY ?AUTO_6559 ?AUTO_6561 ) ( not ( = ?AUTO_6559 ?AUTO_6560 ) ) ( TRUCK-AT ?AUTO_6562 ?AUTO_6559 ) ( AIRPORT ?AUTO_6565 ) ( AIRPORT ?AUTO_6560 ) ( not ( = ?AUTO_6565 ?AUTO_6560 ) ) ( not ( = ?AUTO_6559 ?AUTO_6565 ) ) ( AIRPORT ?AUTO_6564 ) ( AIRPLANE-AT ?AUTO_6563 ?AUTO_6564 ) ( not ( = ?AUTO_6564 ?AUTO_6565 ) ) ( not ( = ?AUTO_6559 ?AUTO_6564 ) ) ( not ( = ?AUTO_6560 ?AUTO_6564 ) ) ( TRUCK-AT ?AUTO_6566 ?AUTO_6565 ) ( IN-TRUCK ?AUTO_6558 ?AUTO_6566 ) ( not ( = ?AUTO_6562 ?AUTO_6566 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6558 ?AUTO_6566 ?AUTO_6565 )
      ( DELIVER-PKG ?AUTO_6558 ?AUTO_6559 )
      ( DELIVER-PKG-VERIFY ?AUTO_6558 ?AUTO_6559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6567 - OBJ
      ?AUTO_6568 - LOCATION
    )
    :vars
    (
      ?AUTO_6574 - LOCATION
      ?AUTO_6571 - CITY
      ?AUTO_6570 - TRUCK
      ?AUTO_6569 - LOCATION
      ?AUTO_6572 - LOCATION
      ?AUTO_6573 - AIRPLANE
      ?AUTO_6575 - TRUCK
      ?AUTO_6576 - LOCATION
      ?AUTO_6577 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6574 ?AUTO_6571 ) ( IN-CITY ?AUTO_6568 ?AUTO_6571 ) ( not ( = ?AUTO_6568 ?AUTO_6574 ) ) ( TRUCK-AT ?AUTO_6570 ?AUTO_6568 ) ( AIRPORT ?AUTO_6569 ) ( AIRPORT ?AUTO_6574 ) ( not ( = ?AUTO_6569 ?AUTO_6574 ) ) ( not ( = ?AUTO_6568 ?AUTO_6569 ) ) ( AIRPORT ?AUTO_6572 ) ( AIRPLANE-AT ?AUTO_6573 ?AUTO_6572 ) ( not ( = ?AUTO_6572 ?AUTO_6569 ) ) ( not ( = ?AUTO_6568 ?AUTO_6572 ) ) ( not ( = ?AUTO_6574 ?AUTO_6572 ) ) ( IN-TRUCK ?AUTO_6567 ?AUTO_6575 ) ( not ( = ?AUTO_6570 ?AUTO_6575 ) ) ( TRUCK-AT ?AUTO_6575 ?AUTO_6576 ) ( IN-CITY ?AUTO_6576 ?AUTO_6577 ) ( IN-CITY ?AUTO_6569 ?AUTO_6577 ) ( not ( = ?AUTO_6569 ?AUTO_6576 ) ) ( not ( = ?AUTO_6568 ?AUTO_6576 ) ) ( not ( = ?AUTO_6574 ?AUTO_6576 ) ) ( not ( = ?AUTO_6571 ?AUTO_6577 ) ) ( not ( = ?AUTO_6572 ?AUTO_6576 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6575 ?AUTO_6576 ?AUTO_6569 ?AUTO_6577 )
      ( DELIVER-PKG ?AUTO_6567 ?AUTO_6568 )
      ( DELIVER-PKG-VERIFY ?AUTO_6567 ?AUTO_6568 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6580 - OBJ
      ?AUTO_6581 - LOCATION
    )
    :vars
    (
      ?AUTO_6584 - LOCATION
      ?AUTO_6583 - CITY
      ?AUTO_6589 - TRUCK
      ?AUTO_6590 - LOCATION
      ?AUTO_6587 - LOCATION
      ?AUTO_6588 - AIRPLANE
      ?AUTO_6585 - TRUCK
      ?AUTO_6582 - LOCATION
      ?AUTO_6586 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6584 ?AUTO_6583 ) ( IN-CITY ?AUTO_6581 ?AUTO_6583 ) ( not ( = ?AUTO_6581 ?AUTO_6584 ) ) ( TRUCK-AT ?AUTO_6589 ?AUTO_6581 ) ( AIRPORT ?AUTO_6590 ) ( AIRPORT ?AUTO_6584 ) ( not ( = ?AUTO_6590 ?AUTO_6584 ) ) ( not ( = ?AUTO_6581 ?AUTO_6590 ) ) ( AIRPORT ?AUTO_6587 ) ( AIRPLANE-AT ?AUTO_6588 ?AUTO_6587 ) ( not ( = ?AUTO_6587 ?AUTO_6590 ) ) ( not ( = ?AUTO_6581 ?AUTO_6587 ) ) ( not ( = ?AUTO_6584 ?AUTO_6587 ) ) ( not ( = ?AUTO_6589 ?AUTO_6585 ) ) ( TRUCK-AT ?AUTO_6585 ?AUTO_6582 ) ( IN-CITY ?AUTO_6582 ?AUTO_6586 ) ( IN-CITY ?AUTO_6590 ?AUTO_6586 ) ( not ( = ?AUTO_6590 ?AUTO_6582 ) ) ( not ( = ?AUTO_6581 ?AUTO_6582 ) ) ( not ( = ?AUTO_6584 ?AUTO_6582 ) ) ( not ( = ?AUTO_6583 ?AUTO_6586 ) ) ( not ( = ?AUTO_6587 ?AUTO_6582 ) ) ( OBJ-AT ?AUTO_6580 ?AUTO_6582 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6580 ?AUTO_6585 ?AUTO_6582 )
      ( DELIVER-PKG ?AUTO_6580 ?AUTO_6581 )
      ( DELIVER-PKG-VERIFY ?AUTO_6580 ?AUTO_6581 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6593 - OBJ
      ?AUTO_6594 - LOCATION
    )
    :vars
    (
      ?AUTO_6595 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6595 ?AUTO_6594 ) ( IN-TRUCK ?AUTO_6593 ?AUTO_6595 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6593 ?AUTO_6595 ?AUTO_6594 )
      ( DELIVER-PKG-VERIFY ?AUTO_6593 ?AUTO_6594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6596 - OBJ
      ?AUTO_6597 - LOCATION
    )
    :vars
    (
      ?AUTO_6598 - TRUCK
      ?AUTO_6599 - LOCATION
      ?AUTO_6600 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6596 ?AUTO_6598 ) ( TRUCK-AT ?AUTO_6598 ?AUTO_6599 ) ( IN-CITY ?AUTO_6599 ?AUTO_6600 ) ( IN-CITY ?AUTO_6597 ?AUTO_6600 ) ( not ( = ?AUTO_6597 ?AUTO_6599 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6598 ?AUTO_6599 ?AUTO_6597 ?AUTO_6600 )
      ( DELIVER-PKG ?AUTO_6596 ?AUTO_6597 )
      ( DELIVER-PKG-VERIFY ?AUTO_6596 ?AUTO_6597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6601 - OBJ
      ?AUTO_6602 - LOCATION
    )
    :vars
    (
      ?AUTO_6603 - TRUCK
      ?AUTO_6604 - LOCATION
      ?AUTO_6605 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6603 ?AUTO_6604 ) ( IN-CITY ?AUTO_6604 ?AUTO_6605 ) ( IN-CITY ?AUTO_6602 ?AUTO_6605 ) ( not ( = ?AUTO_6602 ?AUTO_6604 ) ) ( OBJ-AT ?AUTO_6601 ?AUTO_6604 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6601 ?AUTO_6603 ?AUTO_6604 )
      ( DELIVER-PKG ?AUTO_6601 ?AUTO_6602 )
      ( DELIVER-PKG-VERIFY ?AUTO_6601 ?AUTO_6602 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6606 - OBJ
      ?AUTO_6607 - LOCATION
    )
    :vars
    (
      ?AUTO_6608 - LOCATION
      ?AUTO_6610 - CITY
      ?AUTO_6609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6608 ?AUTO_6610 ) ( IN-CITY ?AUTO_6607 ?AUTO_6610 ) ( not ( = ?AUTO_6607 ?AUTO_6608 ) ) ( OBJ-AT ?AUTO_6606 ?AUTO_6608 ) ( TRUCK-AT ?AUTO_6609 ?AUTO_6607 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6609 ?AUTO_6607 ?AUTO_6608 ?AUTO_6610 )
      ( DELIVER-PKG ?AUTO_6606 ?AUTO_6607 )
      ( DELIVER-PKG-VERIFY ?AUTO_6606 ?AUTO_6607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6631 - OBJ
      ?AUTO_6632 - LOCATION
    )
    :vars
    (
      ?AUTO_6633 - LOCATION
      ?AUTO_6635 - CITY
      ?AUTO_6634 - TRUCK
      ?AUTO_6636 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6633 ?AUTO_6635 ) ( IN-CITY ?AUTO_6632 ?AUTO_6635 ) ( not ( = ?AUTO_6632 ?AUTO_6633 ) ) ( TRUCK-AT ?AUTO_6634 ?AUTO_6632 ) ( IN-AIRPLANE ?AUTO_6631 ?AUTO_6636 ) ( AIRPLANE-AT ?AUTO_6636 ?AUTO_6633 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6631 ?AUTO_6636 ?AUTO_6633 )
      ( DELIVER-PKG ?AUTO_6631 ?AUTO_6632 )
      ( DELIVER-PKG-VERIFY ?AUTO_6631 ?AUTO_6632 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6637 - OBJ
      ?AUTO_6638 - LOCATION
    )
    :vars
    (
      ?AUTO_6639 - LOCATION
      ?AUTO_6641 - CITY
      ?AUTO_6640 - TRUCK
      ?AUTO_6642 - AIRPLANE
      ?AUTO_6643 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6639 ?AUTO_6641 ) ( IN-CITY ?AUTO_6638 ?AUTO_6641 ) ( not ( = ?AUTO_6638 ?AUTO_6639 ) ) ( TRUCK-AT ?AUTO_6640 ?AUTO_6638 ) ( IN-AIRPLANE ?AUTO_6637 ?AUTO_6642 ) ( AIRPORT ?AUTO_6643 ) ( AIRPORT ?AUTO_6639 ) ( AIRPLANE-AT ?AUTO_6642 ?AUTO_6643 ) ( not ( = ?AUTO_6643 ?AUTO_6639 ) ) ( not ( = ?AUTO_6638 ?AUTO_6643 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6642 ?AUTO_6643 ?AUTO_6639 )
      ( DELIVER-PKG ?AUTO_6637 ?AUTO_6638 )
      ( DELIVER-PKG-VERIFY ?AUTO_6637 ?AUTO_6638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6644 - OBJ
      ?AUTO_6645 - LOCATION
    )
    :vars
    (
      ?AUTO_6648 - LOCATION
      ?AUTO_6649 - CITY
      ?AUTO_6647 - TRUCK
      ?AUTO_6650 - LOCATION
      ?AUTO_6646 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6648 ?AUTO_6649 ) ( IN-CITY ?AUTO_6645 ?AUTO_6649 ) ( not ( = ?AUTO_6645 ?AUTO_6648 ) ) ( TRUCK-AT ?AUTO_6647 ?AUTO_6645 ) ( AIRPORT ?AUTO_6650 ) ( AIRPORT ?AUTO_6648 ) ( AIRPLANE-AT ?AUTO_6646 ?AUTO_6650 ) ( not ( = ?AUTO_6650 ?AUTO_6648 ) ) ( not ( = ?AUTO_6645 ?AUTO_6650 ) ) ( OBJ-AT ?AUTO_6644 ?AUTO_6650 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6644 ?AUTO_6646 ?AUTO_6650 )
      ( DELIVER-PKG ?AUTO_6644 ?AUTO_6645 )
      ( DELIVER-PKG-VERIFY ?AUTO_6644 ?AUTO_6645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6651 - OBJ
      ?AUTO_6652 - LOCATION
    )
    :vars
    (
      ?AUTO_6656 - LOCATION
      ?AUTO_6655 - CITY
      ?AUTO_6654 - TRUCK
      ?AUTO_6657 - LOCATION
      ?AUTO_6658 - LOCATION
      ?AUTO_6653 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6656 ?AUTO_6655 ) ( IN-CITY ?AUTO_6652 ?AUTO_6655 ) ( not ( = ?AUTO_6652 ?AUTO_6656 ) ) ( TRUCK-AT ?AUTO_6654 ?AUTO_6652 ) ( AIRPORT ?AUTO_6657 ) ( AIRPORT ?AUTO_6656 ) ( not ( = ?AUTO_6657 ?AUTO_6656 ) ) ( not ( = ?AUTO_6652 ?AUTO_6657 ) ) ( OBJ-AT ?AUTO_6651 ?AUTO_6657 ) ( AIRPORT ?AUTO_6658 ) ( AIRPLANE-AT ?AUTO_6653 ?AUTO_6658 ) ( not ( = ?AUTO_6658 ?AUTO_6657 ) ) ( not ( = ?AUTO_6652 ?AUTO_6658 ) ) ( not ( = ?AUTO_6656 ?AUTO_6658 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6653 ?AUTO_6658 ?AUTO_6657 )
      ( DELIVER-PKG ?AUTO_6651 ?AUTO_6652 )
      ( DELIVER-PKG-VERIFY ?AUTO_6651 ?AUTO_6652 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6661 - OBJ
      ?AUTO_6662 - LOCATION
    )
    :vars
    (
      ?AUTO_6663 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6663 ?AUTO_6662 ) ( IN-TRUCK ?AUTO_6661 ?AUTO_6663 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6661 ?AUTO_6663 ?AUTO_6662 )
      ( DELIVER-PKG-VERIFY ?AUTO_6661 ?AUTO_6662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6664 - OBJ
      ?AUTO_6665 - LOCATION
    )
    :vars
    (
      ?AUTO_6666 - TRUCK
      ?AUTO_6667 - LOCATION
      ?AUTO_6668 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6664 ?AUTO_6666 ) ( TRUCK-AT ?AUTO_6666 ?AUTO_6667 ) ( IN-CITY ?AUTO_6667 ?AUTO_6668 ) ( IN-CITY ?AUTO_6665 ?AUTO_6668 ) ( not ( = ?AUTO_6665 ?AUTO_6667 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6666 ?AUTO_6667 ?AUTO_6665 ?AUTO_6668 )
      ( DELIVER-PKG ?AUTO_6664 ?AUTO_6665 )
      ( DELIVER-PKG-VERIFY ?AUTO_6664 ?AUTO_6665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6669 - OBJ
      ?AUTO_6670 - LOCATION
    )
    :vars
    (
      ?AUTO_6671 - TRUCK
      ?AUTO_6672 - LOCATION
      ?AUTO_6673 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6671 ?AUTO_6672 ) ( IN-CITY ?AUTO_6672 ?AUTO_6673 ) ( IN-CITY ?AUTO_6670 ?AUTO_6673 ) ( not ( = ?AUTO_6670 ?AUTO_6672 ) ) ( OBJ-AT ?AUTO_6669 ?AUTO_6672 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6669 ?AUTO_6671 ?AUTO_6672 )
      ( DELIVER-PKG ?AUTO_6669 ?AUTO_6670 )
      ( DELIVER-PKG-VERIFY ?AUTO_6669 ?AUTO_6670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6674 - OBJ
      ?AUTO_6675 - LOCATION
    )
    :vars
    (
      ?AUTO_6676 - LOCATION
      ?AUTO_6678 - CITY
      ?AUTO_6677 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6676 ?AUTO_6678 ) ( IN-CITY ?AUTO_6675 ?AUTO_6678 ) ( not ( = ?AUTO_6675 ?AUTO_6676 ) ) ( OBJ-AT ?AUTO_6674 ?AUTO_6676 ) ( TRUCK-AT ?AUTO_6677 ?AUTO_6675 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6677 ?AUTO_6675 ?AUTO_6676 ?AUTO_6678 )
      ( DELIVER-PKG ?AUTO_6674 ?AUTO_6675 )
      ( DELIVER-PKG-VERIFY ?AUTO_6674 ?AUTO_6675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6681 - OBJ
      ?AUTO_6682 - LOCATION
    )
    :vars
    (
      ?AUTO_6683 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6681 ?AUTO_6683 ) ( AIRPLANE-AT ?AUTO_6683 ?AUTO_6682 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6681 ?AUTO_6683 ?AUTO_6682 )
      ( DELIVER-PKG-VERIFY ?AUTO_6681 ?AUTO_6682 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6686 - OBJ
      ?AUTO_6687 - LOCATION
    )
    :vars
    (
      ?AUTO_6688 - AIRPLANE
      ?AUTO_6689 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6686 ?AUTO_6688 ) ( AIRPORT ?AUTO_6689 ) ( AIRPORT ?AUTO_6687 ) ( AIRPLANE-AT ?AUTO_6688 ?AUTO_6689 ) ( not ( = ?AUTO_6689 ?AUTO_6687 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6688 ?AUTO_6689 ?AUTO_6687 )
      ( DELIVER-PKG ?AUTO_6686 ?AUTO_6687 )
      ( DELIVER-PKG-VERIFY ?AUTO_6686 ?AUTO_6687 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6694 - OBJ
      ?AUTO_6695 - LOCATION
    )
    :vars
    (
      ?AUTO_6696 - LOCATION
      ?AUTO_6697 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6696 ) ( AIRPORT ?AUTO_6695 ) ( AIRPLANE-AT ?AUTO_6697 ?AUTO_6696 ) ( not ( = ?AUTO_6696 ?AUTO_6695 ) ) ( OBJ-AT ?AUTO_6694 ?AUTO_6696 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6694 ?AUTO_6697 ?AUTO_6696 )
      ( DELIVER-PKG ?AUTO_6694 ?AUTO_6695 )
      ( DELIVER-PKG-VERIFY ?AUTO_6694 ?AUTO_6695 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6698 - OBJ
      ?AUTO_6699 - LOCATION
    )
    :vars
    (
      ?AUTO_6700 - LOCATION
      ?AUTO_6702 - LOCATION
      ?AUTO_6701 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6700 ) ( AIRPORT ?AUTO_6699 ) ( not ( = ?AUTO_6700 ?AUTO_6699 ) ) ( OBJ-AT ?AUTO_6698 ?AUTO_6700 ) ( AIRPORT ?AUTO_6702 ) ( AIRPLANE-AT ?AUTO_6701 ?AUTO_6702 ) ( not ( = ?AUTO_6702 ?AUTO_6700 ) ) ( not ( = ?AUTO_6699 ?AUTO_6702 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6701 ?AUTO_6702 ?AUTO_6700 )
      ( DELIVER-PKG ?AUTO_6698 ?AUTO_6699 )
      ( DELIVER-PKG-VERIFY ?AUTO_6698 ?AUTO_6699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6703 - OBJ
      ?AUTO_6704 - LOCATION
    )
    :vars
    (
      ?AUTO_6705 - LOCATION
      ?AUTO_6707 - LOCATION
      ?AUTO_6706 - AIRPLANE
      ?AUTO_6708 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6705 ) ( AIRPORT ?AUTO_6704 ) ( not ( = ?AUTO_6705 ?AUTO_6704 ) ) ( AIRPORT ?AUTO_6707 ) ( AIRPLANE-AT ?AUTO_6706 ?AUTO_6707 ) ( not ( = ?AUTO_6707 ?AUTO_6705 ) ) ( not ( = ?AUTO_6704 ?AUTO_6707 ) ) ( TRUCK-AT ?AUTO_6708 ?AUTO_6705 ) ( IN-TRUCK ?AUTO_6703 ?AUTO_6708 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6703 ?AUTO_6708 ?AUTO_6705 )
      ( DELIVER-PKG ?AUTO_6703 ?AUTO_6704 )
      ( DELIVER-PKG-VERIFY ?AUTO_6703 ?AUTO_6704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6709 - OBJ
      ?AUTO_6710 - LOCATION
    )
    :vars
    (
      ?AUTO_6711 - LOCATION
      ?AUTO_6713 - LOCATION
      ?AUTO_6712 - AIRPLANE
      ?AUTO_6714 - TRUCK
      ?AUTO_6715 - LOCATION
      ?AUTO_6716 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6711 ) ( AIRPORT ?AUTO_6710 ) ( not ( = ?AUTO_6711 ?AUTO_6710 ) ) ( AIRPORT ?AUTO_6713 ) ( AIRPLANE-AT ?AUTO_6712 ?AUTO_6713 ) ( not ( = ?AUTO_6713 ?AUTO_6711 ) ) ( not ( = ?AUTO_6710 ?AUTO_6713 ) ) ( IN-TRUCK ?AUTO_6709 ?AUTO_6714 ) ( TRUCK-AT ?AUTO_6714 ?AUTO_6715 ) ( IN-CITY ?AUTO_6715 ?AUTO_6716 ) ( IN-CITY ?AUTO_6711 ?AUTO_6716 ) ( not ( = ?AUTO_6711 ?AUTO_6715 ) ) ( not ( = ?AUTO_6710 ?AUTO_6715 ) ) ( not ( = ?AUTO_6713 ?AUTO_6715 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6714 ?AUTO_6715 ?AUTO_6711 ?AUTO_6716 )
      ( DELIVER-PKG ?AUTO_6709 ?AUTO_6710 )
      ( DELIVER-PKG-VERIFY ?AUTO_6709 ?AUTO_6710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6717 - OBJ
      ?AUTO_6718 - LOCATION
    )
    :vars
    (
      ?AUTO_6719 - LOCATION
      ?AUTO_6724 - LOCATION
      ?AUTO_6720 - AIRPLANE
      ?AUTO_6721 - TRUCK
      ?AUTO_6723 - LOCATION
      ?AUTO_6722 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6719 ) ( AIRPORT ?AUTO_6718 ) ( not ( = ?AUTO_6719 ?AUTO_6718 ) ) ( AIRPORT ?AUTO_6724 ) ( AIRPLANE-AT ?AUTO_6720 ?AUTO_6724 ) ( not ( = ?AUTO_6724 ?AUTO_6719 ) ) ( not ( = ?AUTO_6718 ?AUTO_6724 ) ) ( TRUCK-AT ?AUTO_6721 ?AUTO_6723 ) ( IN-CITY ?AUTO_6723 ?AUTO_6722 ) ( IN-CITY ?AUTO_6719 ?AUTO_6722 ) ( not ( = ?AUTO_6719 ?AUTO_6723 ) ) ( not ( = ?AUTO_6718 ?AUTO_6723 ) ) ( not ( = ?AUTO_6724 ?AUTO_6723 ) ) ( OBJ-AT ?AUTO_6717 ?AUTO_6723 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6717 ?AUTO_6721 ?AUTO_6723 )
      ( DELIVER-PKG ?AUTO_6717 ?AUTO_6718 )
      ( DELIVER-PKG-VERIFY ?AUTO_6717 ?AUTO_6718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6725 - OBJ
      ?AUTO_6726 - LOCATION
    )
    :vars
    (
      ?AUTO_6727 - LOCATION
      ?AUTO_6730 - LOCATION
      ?AUTO_6728 - AIRPLANE
      ?AUTO_6729 - LOCATION
      ?AUTO_6732 - CITY
      ?AUTO_6731 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6727 ) ( AIRPORT ?AUTO_6726 ) ( not ( = ?AUTO_6727 ?AUTO_6726 ) ) ( AIRPORT ?AUTO_6730 ) ( AIRPLANE-AT ?AUTO_6728 ?AUTO_6730 ) ( not ( = ?AUTO_6730 ?AUTO_6727 ) ) ( not ( = ?AUTO_6726 ?AUTO_6730 ) ) ( IN-CITY ?AUTO_6729 ?AUTO_6732 ) ( IN-CITY ?AUTO_6727 ?AUTO_6732 ) ( not ( = ?AUTO_6727 ?AUTO_6729 ) ) ( not ( = ?AUTO_6726 ?AUTO_6729 ) ) ( not ( = ?AUTO_6730 ?AUTO_6729 ) ) ( OBJ-AT ?AUTO_6725 ?AUTO_6729 ) ( TRUCK-AT ?AUTO_6731 ?AUTO_6727 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6731 ?AUTO_6727 ?AUTO_6729 ?AUTO_6732 )
      ( DELIVER-PKG ?AUTO_6725 ?AUTO_6726 )
      ( DELIVER-PKG-VERIFY ?AUTO_6725 ?AUTO_6726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6735 - OBJ
      ?AUTO_6736 - LOCATION
    )
    :vars
    (
      ?AUTO_6737 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6735 ?AUTO_6737 ) ( AIRPLANE-AT ?AUTO_6737 ?AUTO_6736 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6735 ?AUTO_6737 ?AUTO_6736 )
      ( DELIVER-PKG-VERIFY ?AUTO_6735 ?AUTO_6736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6744 - OBJ
      ?AUTO_6745 - LOCATION
    )
    :vars
    (
      ?AUTO_6746 - LOCATION
      ?AUTO_6747 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6746 ) ( AIRPORT ?AUTO_6745 ) ( AIRPLANE-AT ?AUTO_6747 ?AUTO_6746 ) ( not ( = ?AUTO_6746 ?AUTO_6745 ) ) ( OBJ-AT ?AUTO_6744 ?AUTO_6746 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6744 ?AUTO_6747 ?AUTO_6746 )
      ( DELIVER-PKG ?AUTO_6744 ?AUTO_6745 )
      ( DELIVER-PKG-VERIFY ?AUTO_6744 ?AUTO_6745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6748 - OBJ
      ?AUTO_6749 - LOCATION
    )
    :vars
    (
      ?AUTO_6750 - LOCATION
      ?AUTO_6752 - LOCATION
      ?AUTO_6751 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6750 ) ( AIRPORT ?AUTO_6749 ) ( not ( = ?AUTO_6750 ?AUTO_6749 ) ) ( OBJ-AT ?AUTO_6748 ?AUTO_6750 ) ( AIRPORT ?AUTO_6752 ) ( AIRPLANE-AT ?AUTO_6751 ?AUTO_6752 ) ( not ( = ?AUTO_6752 ?AUTO_6750 ) ) ( not ( = ?AUTO_6749 ?AUTO_6752 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6751 ?AUTO_6752 ?AUTO_6750 )
      ( DELIVER-PKG ?AUTO_6748 ?AUTO_6749 )
      ( DELIVER-PKG-VERIFY ?AUTO_6748 ?AUTO_6749 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6767 - OBJ
      ?AUTO_6768 - LOCATION
    )
    :vars
    (
      ?AUTO_6769 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6767 ?AUTO_6769 ) ( AIRPLANE-AT ?AUTO_6769 ?AUTO_6768 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6767 ?AUTO_6769 ?AUTO_6768 )
      ( DELIVER-PKG-VERIFY ?AUTO_6767 ?AUTO_6768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6770 - OBJ
      ?AUTO_6771 - LOCATION
    )
    :vars
    (
      ?AUTO_6772 - AIRPLANE
      ?AUTO_6773 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6770 ?AUTO_6772 ) ( AIRPORT ?AUTO_6773 ) ( AIRPORT ?AUTO_6771 ) ( AIRPLANE-AT ?AUTO_6772 ?AUTO_6773 ) ( not ( = ?AUTO_6773 ?AUTO_6771 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6772 ?AUTO_6773 ?AUTO_6771 )
      ( DELIVER-PKG ?AUTO_6770 ?AUTO_6771 )
      ( DELIVER-PKG-VERIFY ?AUTO_6770 ?AUTO_6771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6778 - OBJ
      ?AUTO_6779 - LOCATION
    )
    :vars
    (
      ?AUTO_6780 - LOCATION
      ?AUTO_6781 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6780 ) ( AIRPORT ?AUTO_6779 ) ( AIRPLANE-AT ?AUTO_6781 ?AUTO_6780 ) ( not ( = ?AUTO_6780 ?AUTO_6779 ) ) ( OBJ-AT ?AUTO_6778 ?AUTO_6780 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6778 ?AUTO_6781 ?AUTO_6780 )
      ( DELIVER-PKG ?AUTO_6778 ?AUTO_6779 )
      ( DELIVER-PKG-VERIFY ?AUTO_6778 ?AUTO_6779 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6782 - OBJ
      ?AUTO_6783 - LOCATION
    )
    :vars
    (
      ?AUTO_6785 - LOCATION
      ?AUTO_6786 - LOCATION
      ?AUTO_6784 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6785 ) ( AIRPORT ?AUTO_6783 ) ( not ( = ?AUTO_6785 ?AUTO_6783 ) ) ( OBJ-AT ?AUTO_6782 ?AUTO_6785 ) ( AIRPORT ?AUTO_6786 ) ( AIRPLANE-AT ?AUTO_6784 ?AUTO_6786 ) ( not ( = ?AUTO_6786 ?AUTO_6785 ) ) ( not ( = ?AUTO_6783 ?AUTO_6786 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6784 ?AUTO_6786 ?AUTO_6785 )
      ( DELIVER-PKG ?AUTO_6782 ?AUTO_6783 )
      ( DELIVER-PKG-VERIFY ?AUTO_6782 ?AUTO_6783 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6793 - OBJ
      ?AUTO_6794 - LOCATION
    )
    :vars
    (
      ?AUTO_6795 - LOCATION
      ?AUTO_6797 - LOCATION
      ?AUTO_6796 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6795 ) ( AIRPORT ?AUTO_6794 ) ( not ( = ?AUTO_6795 ?AUTO_6794 ) ) ( OBJ-AT ?AUTO_6793 ?AUTO_6795 ) ( AIRPORT ?AUTO_6797 ) ( not ( = ?AUTO_6797 ?AUTO_6795 ) ) ( not ( = ?AUTO_6794 ?AUTO_6797 ) ) ( AIRPLANE-AT ?AUTO_6796 ?AUTO_6794 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6796 ?AUTO_6794 ?AUTO_6797 )
      ( DELIVER-PKG ?AUTO_6793 ?AUTO_6794 )
      ( DELIVER-PKG-VERIFY ?AUTO_6793 ?AUTO_6794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6808 - OBJ
      ?AUTO_6809 - LOCATION
    )
    :vars
    (
      ?AUTO_6810 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6810 ?AUTO_6809 ) ( IN-TRUCK ?AUTO_6808 ?AUTO_6810 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6808 ?AUTO_6810 ?AUTO_6809 )
      ( DELIVER-PKG-VERIFY ?AUTO_6808 ?AUTO_6809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6811 - OBJ
      ?AUTO_6812 - LOCATION
    )
    :vars
    (
      ?AUTO_6813 - TRUCK
      ?AUTO_6814 - LOCATION
      ?AUTO_6815 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6811 ?AUTO_6813 ) ( TRUCK-AT ?AUTO_6813 ?AUTO_6814 ) ( IN-CITY ?AUTO_6814 ?AUTO_6815 ) ( IN-CITY ?AUTO_6812 ?AUTO_6815 ) ( not ( = ?AUTO_6812 ?AUTO_6814 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6813 ?AUTO_6814 ?AUTO_6812 ?AUTO_6815 )
      ( DELIVER-PKG ?AUTO_6811 ?AUTO_6812 )
      ( DELIVER-PKG-VERIFY ?AUTO_6811 ?AUTO_6812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6816 - OBJ
      ?AUTO_6817 - LOCATION
    )
    :vars
    (
      ?AUTO_6818 - TRUCK
      ?AUTO_6819 - LOCATION
      ?AUTO_6820 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6818 ?AUTO_6819 ) ( IN-CITY ?AUTO_6819 ?AUTO_6820 ) ( IN-CITY ?AUTO_6817 ?AUTO_6820 ) ( not ( = ?AUTO_6817 ?AUTO_6819 ) ) ( OBJ-AT ?AUTO_6816 ?AUTO_6819 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6816 ?AUTO_6818 ?AUTO_6819 )
      ( DELIVER-PKG ?AUTO_6816 ?AUTO_6817 )
      ( DELIVER-PKG-VERIFY ?AUTO_6816 ?AUTO_6817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6821 - OBJ
      ?AUTO_6822 - LOCATION
    )
    :vars
    (
      ?AUTO_6823 - LOCATION
      ?AUTO_6825 - CITY
      ?AUTO_6824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6823 ?AUTO_6825 ) ( IN-CITY ?AUTO_6822 ?AUTO_6825 ) ( not ( = ?AUTO_6822 ?AUTO_6823 ) ) ( OBJ-AT ?AUTO_6821 ?AUTO_6823 ) ( TRUCK-AT ?AUTO_6824 ?AUTO_6822 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6824 ?AUTO_6822 ?AUTO_6823 ?AUTO_6825 )
      ( DELIVER-PKG ?AUTO_6821 ?AUTO_6822 )
      ( DELIVER-PKG-VERIFY ?AUTO_6821 ?AUTO_6822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6826 - OBJ
      ?AUTO_6827 - LOCATION
    )
    :vars
    (
      ?AUTO_6829 - LOCATION
      ?AUTO_6828 - CITY
      ?AUTO_6830 - TRUCK
      ?AUTO_6831 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6829 ?AUTO_6828 ) ( IN-CITY ?AUTO_6827 ?AUTO_6828 ) ( not ( = ?AUTO_6827 ?AUTO_6829 ) ) ( TRUCK-AT ?AUTO_6830 ?AUTO_6827 ) ( IN-AIRPLANE ?AUTO_6826 ?AUTO_6831 ) ( AIRPLANE-AT ?AUTO_6831 ?AUTO_6829 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6826 ?AUTO_6831 ?AUTO_6829 )
      ( DELIVER-PKG ?AUTO_6826 ?AUTO_6827 )
      ( DELIVER-PKG-VERIFY ?AUTO_6826 ?AUTO_6827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6832 - OBJ
      ?AUTO_6833 - LOCATION
    )
    :vars
    (
      ?AUTO_6834 - LOCATION
      ?AUTO_6835 - CITY
      ?AUTO_6837 - TRUCK
      ?AUTO_6836 - AIRPLANE
      ?AUTO_6838 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6834 ?AUTO_6835 ) ( IN-CITY ?AUTO_6833 ?AUTO_6835 ) ( not ( = ?AUTO_6833 ?AUTO_6834 ) ) ( TRUCK-AT ?AUTO_6837 ?AUTO_6833 ) ( IN-AIRPLANE ?AUTO_6832 ?AUTO_6836 ) ( AIRPORT ?AUTO_6838 ) ( AIRPORT ?AUTO_6834 ) ( AIRPLANE-AT ?AUTO_6836 ?AUTO_6838 ) ( not ( = ?AUTO_6838 ?AUTO_6834 ) ) ( not ( = ?AUTO_6833 ?AUTO_6838 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6836 ?AUTO_6838 ?AUTO_6834 )
      ( DELIVER-PKG ?AUTO_6832 ?AUTO_6833 )
      ( DELIVER-PKG-VERIFY ?AUTO_6832 ?AUTO_6833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6843 - OBJ
      ?AUTO_6844 - LOCATION
    )
    :vars
    (
      ?AUTO_6847 - LOCATION
      ?AUTO_6846 - CITY
      ?AUTO_6845 - TRUCK
      ?AUTO_6849 - LOCATION
      ?AUTO_6848 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6847 ?AUTO_6846 ) ( IN-CITY ?AUTO_6844 ?AUTO_6846 ) ( not ( = ?AUTO_6844 ?AUTO_6847 ) ) ( TRUCK-AT ?AUTO_6845 ?AUTO_6844 ) ( AIRPORT ?AUTO_6849 ) ( AIRPORT ?AUTO_6847 ) ( AIRPLANE-AT ?AUTO_6848 ?AUTO_6849 ) ( not ( = ?AUTO_6849 ?AUTO_6847 ) ) ( not ( = ?AUTO_6844 ?AUTO_6849 ) ) ( OBJ-AT ?AUTO_6843 ?AUTO_6849 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6843 ?AUTO_6848 ?AUTO_6849 )
      ( DELIVER-PKG ?AUTO_6843 ?AUTO_6844 )
      ( DELIVER-PKG-VERIFY ?AUTO_6843 ?AUTO_6844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6850 - OBJ
      ?AUTO_6851 - LOCATION
    )
    :vars
    (
      ?AUTO_6854 - LOCATION
      ?AUTO_6853 - CITY
      ?AUTO_6852 - TRUCK
      ?AUTO_6855 - LOCATION
      ?AUTO_6857 - LOCATION
      ?AUTO_6856 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6854 ?AUTO_6853 ) ( IN-CITY ?AUTO_6851 ?AUTO_6853 ) ( not ( = ?AUTO_6851 ?AUTO_6854 ) ) ( TRUCK-AT ?AUTO_6852 ?AUTO_6851 ) ( AIRPORT ?AUTO_6855 ) ( AIRPORT ?AUTO_6854 ) ( not ( = ?AUTO_6855 ?AUTO_6854 ) ) ( not ( = ?AUTO_6851 ?AUTO_6855 ) ) ( OBJ-AT ?AUTO_6850 ?AUTO_6855 ) ( AIRPORT ?AUTO_6857 ) ( AIRPLANE-AT ?AUTO_6856 ?AUTO_6857 ) ( not ( = ?AUTO_6857 ?AUTO_6855 ) ) ( not ( = ?AUTO_6851 ?AUTO_6857 ) ) ( not ( = ?AUTO_6854 ?AUTO_6857 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6856 ?AUTO_6857 ?AUTO_6855 )
      ( DELIVER-PKG ?AUTO_6850 ?AUTO_6851 )
      ( DELIVER-PKG-VERIFY ?AUTO_6850 ?AUTO_6851 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6876 - OBJ
      ?AUTO_6877 - LOCATION
    )
    :vars
    (
      ?AUTO_6878 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6878 ?AUTO_6877 ) ( IN-TRUCK ?AUTO_6876 ?AUTO_6878 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6876 ?AUTO_6878 ?AUTO_6877 )
      ( DELIVER-PKG-VERIFY ?AUTO_6876 ?AUTO_6877 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6879 - OBJ
      ?AUTO_6880 - LOCATION
    )
    :vars
    (
      ?AUTO_6881 - TRUCK
      ?AUTO_6882 - LOCATION
      ?AUTO_6883 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6879 ?AUTO_6881 ) ( TRUCK-AT ?AUTO_6881 ?AUTO_6882 ) ( IN-CITY ?AUTO_6882 ?AUTO_6883 ) ( IN-CITY ?AUTO_6880 ?AUTO_6883 ) ( not ( = ?AUTO_6880 ?AUTO_6882 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6881 ?AUTO_6882 ?AUTO_6880 ?AUTO_6883 )
      ( DELIVER-PKG ?AUTO_6879 ?AUTO_6880 )
      ( DELIVER-PKG-VERIFY ?AUTO_6879 ?AUTO_6880 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6886 - OBJ
      ?AUTO_6887 - LOCATION
    )
    :vars
    (
      ?AUTO_6888 - TRUCK
      ?AUTO_6890 - LOCATION
      ?AUTO_6889 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6888 ?AUTO_6890 ) ( IN-CITY ?AUTO_6890 ?AUTO_6889 ) ( IN-CITY ?AUTO_6887 ?AUTO_6889 ) ( not ( = ?AUTO_6887 ?AUTO_6890 ) ) ( OBJ-AT ?AUTO_6886 ?AUTO_6890 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6886 ?AUTO_6888 ?AUTO_6890 )
      ( DELIVER-PKG ?AUTO_6886 ?AUTO_6887 )
      ( DELIVER-PKG-VERIFY ?AUTO_6886 ?AUTO_6887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6891 - OBJ
      ?AUTO_6892 - LOCATION
    )
    :vars
    (
      ?AUTO_6894 - LOCATION
      ?AUTO_6895 - CITY
      ?AUTO_6893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6894 ?AUTO_6895 ) ( IN-CITY ?AUTO_6892 ?AUTO_6895 ) ( not ( = ?AUTO_6892 ?AUTO_6894 ) ) ( OBJ-AT ?AUTO_6891 ?AUTO_6894 ) ( TRUCK-AT ?AUTO_6893 ?AUTO_6892 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6893 ?AUTO_6892 ?AUTO_6894 ?AUTO_6895 )
      ( DELIVER-PKG ?AUTO_6891 ?AUTO_6892 )
      ( DELIVER-PKG-VERIFY ?AUTO_6891 ?AUTO_6892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6924 - OBJ
      ?AUTO_6925 - LOCATION
    )
    :vars
    (
      ?AUTO_6930 - LOCATION
      ?AUTO_6931 - CITY
      ?AUTO_6927 - TRUCK
      ?AUTO_6928 - LOCATION
      ?AUTO_6929 - LOCATION
      ?AUTO_6926 - AIRPLANE
      ?AUTO_6932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6930 ?AUTO_6931 ) ( IN-CITY ?AUTO_6925 ?AUTO_6931 ) ( not ( = ?AUTO_6925 ?AUTO_6930 ) ) ( TRUCK-AT ?AUTO_6927 ?AUTO_6925 ) ( AIRPORT ?AUTO_6928 ) ( AIRPORT ?AUTO_6930 ) ( not ( = ?AUTO_6928 ?AUTO_6930 ) ) ( not ( = ?AUTO_6925 ?AUTO_6928 ) ) ( AIRPORT ?AUTO_6929 ) ( AIRPLANE-AT ?AUTO_6926 ?AUTO_6929 ) ( not ( = ?AUTO_6929 ?AUTO_6928 ) ) ( not ( = ?AUTO_6925 ?AUTO_6929 ) ) ( not ( = ?AUTO_6930 ?AUTO_6929 ) ) ( TRUCK-AT ?AUTO_6932 ?AUTO_6928 ) ( IN-TRUCK ?AUTO_6924 ?AUTO_6932 ) ( not ( = ?AUTO_6927 ?AUTO_6932 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6924 ?AUTO_6932 ?AUTO_6928 )
      ( DELIVER-PKG ?AUTO_6924 ?AUTO_6925 )
      ( DELIVER-PKG-VERIFY ?AUTO_6924 ?AUTO_6925 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6933 - OBJ
      ?AUTO_6934 - LOCATION
    )
    :vars
    (
      ?AUTO_6938 - LOCATION
      ?AUTO_6935 - CITY
      ?AUTO_6936 - TRUCK
      ?AUTO_6939 - LOCATION
      ?AUTO_6940 - LOCATION
      ?AUTO_6941 - AIRPLANE
      ?AUTO_6937 - TRUCK
      ?AUTO_6942 - LOCATION
      ?AUTO_6943 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6938 ?AUTO_6935 ) ( IN-CITY ?AUTO_6934 ?AUTO_6935 ) ( not ( = ?AUTO_6934 ?AUTO_6938 ) ) ( TRUCK-AT ?AUTO_6936 ?AUTO_6934 ) ( AIRPORT ?AUTO_6939 ) ( AIRPORT ?AUTO_6938 ) ( not ( = ?AUTO_6939 ?AUTO_6938 ) ) ( not ( = ?AUTO_6934 ?AUTO_6939 ) ) ( AIRPORT ?AUTO_6940 ) ( AIRPLANE-AT ?AUTO_6941 ?AUTO_6940 ) ( not ( = ?AUTO_6940 ?AUTO_6939 ) ) ( not ( = ?AUTO_6934 ?AUTO_6940 ) ) ( not ( = ?AUTO_6938 ?AUTO_6940 ) ) ( IN-TRUCK ?AUTO_6933 ?AUTO_6937 ) ( not ( = ?AUTO_6936 ?AUTO_6937 ) ) ( TRUCK-AT ?AUTO_6937 ?AUTO_6942 ) ( IN-CITY ?AUTO_6942 ?AUTO_6943 ) ( IN-CITY ?AUTO_6939 ?AUTO_6943 ) ( not ( = ?AUTO_6939 ?AUTO_6942 ) ) ( not ( = ?AUTO_6934 ?AUTO_6942 ) ) ( not ( = ?AUTO_6938 ?AUTO_6942 ) ) ( not ( = ?AUTO_6935 ?AUTO_6943 ) ) ( not ( = ?AUTO_6940 ?AUTO_6942 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6937 ?AUTO_6942 ?AUTO_6939 ?AUTO_6943 )
      ( DELIVER-PKG ?AUTO_6933 ?AUTO_6934 )
      ( DELIVER-PKG-VERIFY ?AUTO_6933 ?AUTO_6934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6944 - OBJ
      ?AUTO_6945 - LOCATION
    )
    :vars
    (
      ?AUTO_6953 - LOCATION
      ?AUTO_6947 - CITY
      ?AUTO_6949 - TRUCK
      ?AUTO_6954 - LOCATION
      ?AUTO_6946 - LOCATION
      ?AUTO_6948 - AIRPLANE
      ?AUTO_6952 - TRUCK
      ?AUTO_6950 - LOCATION
      ?AUTO_6951 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6953 ?AUTO_6947 ) ( IN-CITY ?AUTO_6945 ?AUTO_6947 ) ( not ( = ?AUTO_6945 ?AUTO_6953 ) ) ( TRUCK-AT ?AUTO_6949 ?AUTO_6945 ) ( AIRPORT ?AUTO_6954 ) ( AIRPORT ?AUTO_6953 ) ( not ( = ?AUTO_6954 ?AUTO_6953 ) ) ( not ( = ?AUTO_6945 ?AUTO_6954 ) ) ( AIRPORT ?AUTO_6946 ) ( AIRPLANE-AT ?AUTO_6948 ?AUTO_6946 ) ( not ( = ?AUTO_6946 ?AUTO_6954 ) ) ( not ( = ?AUTO_6945 ?AUTO_6946 ) ) ( not ( = ?AUTO_6953 ?AUTO_6946 ) ) ( not ( = ?AUTO_6949 ?AUTO_6952 ) ) ( TRUCK-AT ?AUTO_6952 ?AUTO_6950 ) ( IN-CITY ?AUTO_6950 ?AUTO_6951 ) ( IN-CITY ?AUTO_6954 ?AUTO_6951 ) ( not ( = ?AUTO_6954 ?AUTO_6950 ) ) ( not ( = ?AUTO_6945 ?AUTO_6950 ) ) ( not ( = ?AUTO_6953 ?AUTO_6950 ) ) ( not ( = ?AUTO_6947 ?AUTO_6951 ) ) ( not ( = ?AUTO_6946 ?AUTO_6950 ) ) ( OBJ-AT ?AUTO_6944 ?AUTO_6950 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6944 ?AUTO_6952 ?AUTO_6950 )
      ( DELIVER-PKG ?AUTO_6944 ?AUTO_6945 )
      ( DELIVER-PKG-VERIFY ?AUTO_6944 ?AUTO_6945 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6955 - OBJ
      ?AUTO_6956 - LOCATION
    )
    :vars
    (
      ?AUTO_6962 - LOCATION
      ?AUTO_6958 - CITY
      ?AUTO_6961 - TRUCK
      ?AUTO_6965 - LOCATION
      ?AUTO_6957 - LOCATION
      ?AUTO_6959 - AIRPLANE
      ?AUTO_6964 - TRUCK
      ?AUTO_6960 - LOCATION
      ?AUTO_6963 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6962 ?AUTO_6958 ) ( IN-CITY ?AUTO_6956 ?AUTO_6958 ) ( not ( = ?AUTO_6956 ?AUTO_6962 ) ) ( TRUCK-AT ?AUTO_6961 ?AUTO_6956 ) ( AIRPORT ?AUTO_6965 ) ( AIRPORT ?AUTO_6962 ) ( not ( = ?AUTO_6965 ?AUTO_6962 ) ) ( not ( = ?AUTO_6956 ?AUTO_6965 ) ) ( AIRPORT ?AUTO_6957 ) ( AIRPLANE-AT ?AUTO_6959 ?AUTO_6957 ) ( not ( = ?AUTO_6957 ?AUTO_6965 ) ) ( not ( = ?AUTO_6956 ?AUTO_6957 ) ) ( not ( = ?AUTO_6962 ?AUTO_6957 ) ) ( not ( = ?AUTO_6961 ?AUTO_6964 ) ) ( IN-CITY ?AUTO_6960 ?AUTO_6963 ) ( IN-CITY ?AUTO_6965 ?AUTO_6963 ) ( not ( = ?AUTO_6965 ?AUTO_6960 ) ) ( not ( = ?AUTO_6956 ?AUTO_6960 ) ) ( not ( = ?AUTO_6962 ?AUTO_6960 ) ) ( not ( = ?AUTO_6958 ?AUTO_6963 ) ) ( not ( = ?AUTO_6957 ?AUTO_6960 ) ) ( OBJ-AT ?AUTO_6955 ?AUTO_6960 ) ( TRUCK-AT ?AUTO_6964 ?AUTO_6965 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6964 ?AUTO_6965 ?AUTO_6960 ?AUTO_6963 )
      ( DELIVER-PKG ?AUTO_6955 ?AUTO_6956 )
      ( DELIVER-PKG-VERIFY ?AUTO_6955 ?AUTO_6956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6968 - OBJ
      ?AUTO_6969 - LOCATION
    )
    :vars
    (
      ?AUTO_6970 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6970 ?AUTO_6969 ) ( IN-TRUCK ?AUTO_6968 ?AUTO_6970 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6968 ?AUTO_6970 ?AUTO_6969 )
      ( DELIVER-PKG-VERIFY ?AUTO_6968 ?AUTO_6969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6971 - OBJ
      ?AUTO_6972 - LOCATION
    )
    :vars
    (
      ?AUTO_6973 - TRUCK
      ?AUTO_6974 - LOCATION
      ?AUTO_6975 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6971 ?AUTO_6973 ) ( TRUCK-AT ?AUTO_6973 ?AUTO_6974 ) ( IN-CITY ?AUTO_6974 ?AUTO_6975 ) ( IN-CITY ?AUTO_6972 ?AUTO_6975 ) ( not ( = ?AUTO_6972 ?AUTO_6974 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6973 ?AUTO_6974 ?AUTO_6972 ?AUTO_6975 )
      ( DELIVER-PKG ?AUTO_6971 ?AUTO_6972 )
      ( DELIVER-PKG-VERIFY ?AUTO_6971 ?AUTO_6972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6980 - OBJ
      ?AUTO_6981 - LOCATION
    )
    :vars
    (
      ?AUTO_6984 - TRUCK
      ?AUTO_6982 - LOCATION
      ?AUTO_6983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6984 ?AUTO_6982 ) ( IN-CITY ?AUTO_6982 ?AUTO_6983 ) ( IN-CITY ?AUTO_6981 ?AUTO_6983 ) ( not ( = ?AUTO_6981 ?AUTO_6982 ) ) ( OBJ-AT ?AUTO_6980 ?AUTO_6982 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6980 ?AUTO_6984 ?AUTO_6982 )
      ( DELIVER-PKG ?AUTO_6980 ?AUTO_6981 )
      ( DELIVER-PKG-VERIFY ?AUTO_6980 ?AUTO_6981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6987 - OBJ
      ?AUTO_6988 - LOCATION
    )
    :vars
    (
      ?AUTO_6989 - LOCATION
      ?AUTO_6990 - CITY
      ?AUTO_6991 - TRUCK
      ?AUTO_6992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6989 ?AUTO_6990 ) ( IN-CITY ?AUTO_6988 ?AUTO_6990 ) ( not ( = ?AUTO_6988 ?AUTO_6989 ) ) ( OBJ-AT ?AUTO_6987 ?AUTO_6989 ) ( TRUCK-AT ?AUTO_6991 ?AUTO_6992 ) ( IN-CITY ?AUTO_6992 ?AUTO_6990 ) ( not ( = ?AUTO_6989 ?AUTO_6992 ) ) ( not ( = ?AUTO_6988 ?AUTO_6992 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6991 ?AUTO_6992 ?AUTO_6989 ?AUTO_6990 )
      ( DELIVER-PKG ?AUTO_6987 ?AUTO_6988 )
      ( DELIVER-PKG-VERIFY ?AUTO_6987 ?AUTO_6988 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7005 - OBJ
      ?AUTO_7006 - LOCATION
    )
    :vars
    (
      ?AUTO_7007 - LOCATION
      ?AUTO_7008 - CITY
      ?AUTO_7010 - TRUCK
      ?AUTO_7009 - LOCATION
      ?AUTO_7011 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7007 ?AUTO_7008 ) ( IN-CITY ?AUTO_7006 ?AUTO_7008 ) ( not ( = ?AUTO_7006 ?AUTO_7007 ) ) ( TRUCK-AT ?AUTO_7010 ?AUTO_7009 ) ( IN-CITY ?AUTO_7009 ?AUTO_7008 ) ( not ( = ?AUTO_7007 ?AUTO_7009 ) ) ( not ( = ?AUTO_7006 ?AUTO_7009 ) ) ( IN-AIRPLANE ?AUTO_7005 ?AUTO_7011 ) ( AIRPLANE-AT ?AUTO_7011 ?AUTO_7007 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7005 ?AUTO_7011 ?AUTO_7007 )
      ( DELIVER-PKG ?AUTO_7005 ?AUTO_7006 )
      ( DELIVER-PKG-VERIFY ?AUTO_7005 ?AUTO_7006 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7016 - OBJ
      ?AUTO_7017 - LOCATION
    )
    :vars
    (
      ?AUTO_7020 - LOCATION
      ?AUTO_7018 - CITY
      ?AUTO_7019 - TRUCK
      ?AUTO_7021 - LOCATION
      ?AUTO_7022 - AIRPLANE
      ?AUTO_7023 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7020 ?AUTO_7018 ) ( IN-CITY ?AUTO_7017 ?AUTO_7018 ) ( not ( = ?AUTO_7017 ?AUTO_7020 ) ) ( TRUCK-AT ?AUTO_7019 ?AUTO_7021 ) ( IN-CITY ?AUTO_7021 ?AUTO_7018 ) ( not ( = ?AUTO_7020 ?AUTO_7021 ) ) ( not ( = ?AUTO_7017 ?AUTO_7021 ) ) ( IN-AIRPLANE ?AUTO_7016 ?AUTO_7022 ) ( AIRPORT ?AUTO_7023 ) ( AIRPORT ?AUTO_7020 ) ( AIRPLANE-AT ?AUTO_7022 ?AUTO_7023 ) ( not ( = ?AUTO_7023 ?AUTO_7020 ) ) ( not ( = ?AUTO_7017 ?AUTO_7023 ) ) ( not ( = ?AUTO_7021 ?AUTO_7023 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7022 ?AUTO_7023 ?AUTO_7020 )
      ( DELIVER-PKG ?AUTO_7016 ?AUTO_7017 )
      ( DELIVER-PKG-VERIFY ?AUTO_7016 ?AUTO_7017 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7024 - OBJ
      ?AUTO_7025 - LOCATION
    )
    :vars
    (
      ?AUTO_7028 - LOCATION
      ?AUTO_7027 - CITY
      ?AUTO_7026 - TRUCK
      ?AUTO_7031 - LOCATION
      ?AUTO_7030 - LOCATION
      ?AUTO_7029 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7028 ?AUTO_7027 ) ( IN-CITY ?AUTO_7025 ?AUTO_7027 ) ( not ( = ?AUTO_7025 ?AUTO_7028 ) ) ( TRUCK-AT ?AUTO_7026 ?AUTO_7031 ) ( IN-CITY ?AUTO_7031 ?AUTO_7027 ) ( not ( = ?AUTO_7028 ?AUTO_7031 ) ) ( not ( = ?AUTO_7025 ?AUTO_7031 ) ) ( AIRPORT ?AUTO_7030 ) ( AIRPORT ?AUTO_7028 ) ( AIRPLANE-AT ?AUTO_7029 ?AUTO_7030 ) ( not ( = ?AUTO_7030 ?AUTO_7028 ) ) ( not ( = ?AUTO_7025 ?AUTO_7030 ) ) ( not ( = ?AUTO_7031 ?AUTO_7030 ) ) ( OBJ-AT ?AUTO_7024 ?AUTO_7030 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7024 ?AUTO_7029 ?AUTO_7030 )
      ( DELIVER-PKG ?AUTO_7024 ?AUTO_7025 )
      ( DELIVER-PKG-VERIFY ?AUTO_7024 ?AUTO_7025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7032 - OBJ
      ?AUTO_7033 - LOCATION
    )
    :vars
    (
      ?AUTO_7034 - LOCATION
      ?AUTO_7037 - CITY
      ?AUTO_7036 - TRUCK
      ?AUTO_7039 - LOCATION
      ?AUTO_7038 - LOCATION
      ?AUTO_7040 - LOCATION
      ?AUTO_7035 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7034 ?AUTO_7037 ) ( IN-CITY ?AUTO_7033 ?AUTO_7037 ) ( not ( = ?AUTO_7033 ?AUTO_7034 ) ) ( TRUCK-AT ?AUTO_7036 ?AUTO_7039 ) ( IN-CITY ?AUTO_7039 ?AUTO_7037 ) ( not ( = ?AUTO_7034 ?AUTO_7039 ) ) ( not ( = ?AUTO_7033 ?AUTO_7039 ) ) ( AIRPORT ?AUTO_7038 ) ( AIRPORT ?AUTO_7034 ) ( not ( = ?AUTO_7038 ?AUTO_7034 ) ) ( not ( = ?AUTO_7033 ?AUTO_7038 ) ) ( not ( = ?AUTO_7039 ?AUTO_7038 ) ) ( OBJ-AT ?AUTO_7032 ?AUTO_7038 ) ( AIRPORT ?AUTO_7040 ) ( AIRPLANE-AT ?AUTO_7035 ?AUTO_7040 ) ( not ( = ?AUTO_7040 ?AUTO_7038 ) ) ( not ( = ?AUTO_7033 ?AUTO_7040 ) ) ( not ( = ?AUTO_7034 ?AUTO_7040 ) ) ( not ( = ?AUTO_7039 ?AUTO_7040 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7035 ?AUTO_7040 ?AUTO_7038 )
      ( DELIVER-PKG ?AUTO_7032 ?AUTO_7033 )
      ( DELIVER-PKG-VERIFY ?AUTO_7032 ?AUTO_7033 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7043 - OBJ
      ?AUTO_7044 - LOCATION
    )
    :vars
    (
      ?AUTO_7045 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7045 ?AUTO_7044 ) ( IN-TRUCK ?AUTO_7043 ?AUTO_7045 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7043 ?AUTO_7045 ?AUTO_7044 )
      ( DELIVER-PKG-VERIFY ?AUTO_7043 ?AUTO_7044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7046 - OBJ
      ?AUTO_7047 - LOCATION
    )
    :vars
    (
      ?AUTO_7048 - TRUCK
      ?AUTO_7049 - LOCATION
      ?AUTO_7050 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7046 ?AUTO_7048 ) ( TRUCK-AT ?AUTO_7048 ?AUTO_7049 ) ( IN-CITY ?AUTO_7049 ?AUTO_7050 ) ( IN-CITY ?AUTO_7047 ?AUTO_7050 ) ( not ( = ?AUTO_7047 ?AUTO_7049 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7048 ?AUTO_7049 ?AUTO_7047 ?AUTO_7050 )
      ( DELIVER-PKG ?AUTO_7046 ?AUTO_7047 )
      ( DELIVER-PKG-VERIFY ?AUTO_7046 ?AUTO_7047 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7057 - OBJ
      ?AUTO_7058 - LOCATION
    )
    :vars
    (
      ?AUTO_7060 - TRUCK
      ?AUTO_7061 - LOCATION
      ?AUTO_7059 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7060 ?AUTO_7061 ) ( IN-CITY ?AUTO_7061 ?AUTO_7059 ) ( IN-CITY ?AUTO_7058 ?AUTO_7059 ) ( not ( = ?AUTO_7058 ?AUTO_7061 ) ) ( OBJ-AT ?AUTO_7057 ?AUTO_7061 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7057 ?AUTO_7060 ?AUTO_7061 )
      ( DELIVER-PKG ?AUTO_7057 ?AUTO_7058 )
      ( DELIVER-PKG-VERIFY ?AUTO_7057 ?AUTO_7058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7064 - OBJ
      ?AUTO_7065 - LOCATION
    )
    :vars
    (
      ?AUTO_7067 - LOCATION
      ?AUTO_7066 - CITY
      ?AUTO_7068 - TRUCK
      ?AUTO_7069 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7067 ?AUTO_7066 ) ( IN-CITY ?AUTO_7065 ?AUTO_7066 ) ( not ( = ?AUTO_7065 ?AUTO_7067 ) ) ( OBJ-AT ?AUTO_7064 ?AUTO_7067 ) ( TRUCK-AT ?AUTO_7068 ?AUTO_7069 ) ( IN-CITY ?AUTO_7069 ?AUTO_7066 ) ( not ( = ?AUTO_7067 ?AUTO_7069 ) ) ( not ( = ?AUTO_7065 ?AUTO_7069 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7068 ?AUTO_7069 ?AUTO_7067 ?AUTO_7066 )
      ( DELIVER-PKG ?AUTO_7064 ?AUTO_7065 )
      ( DELIVER-PKG-VERIFY ?AUTO_7064 ?AUTO_7065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7072 - OBJ
      ?AUTO_7073 - LOCATION
    )
    :vars
    (
      ?AUTO_7074 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7072 ?AUTO_7074 ) ( AIRPLANE-AT ?AUTO_7074 ?AUTO_7073 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7072 ?AUTO_7074 ?AUTO_7073 )
      ( DELIVER-PKG-VERIFY ?AUTO_7072 ?AUTO_7073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7075 - OBJ
      ?AUTO_7076 - LOCATION
    )
    :vars
    (
      ?AUTO_7077 - AIRPLANE
      ?AUTO_7078 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7075 ?AUTO_7077 ) ( AIRPORT ?AUTO_7078 ) ( AIRPORT ?AUTO_7076 ) ( AIRPLANE-AT ?AUTO_7077 ?AUTO_7078 ) ( not ( = ?AUTO_7078 ?AUTO_7076 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7077 ?AUTO_7078 ?AUTO_7076 )
      ( DELIVER-PKG ?AUTO_7075 ?AUTO_7076 )
      ( DELIVER-PKG-VERIFY ?AUTO_7075 ?AUTO_7076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7087 - OBJ
      ?AUTO_7088 - LOCATION
    )
    :vars
    (
      ?AUTO_7089 - LOCATION
      ?AUTO_7090 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7089 ) ( AIRPORT ?AUTO_7088 ) ( AIRPLANE-AT ?AUTO_7090 ?AUTO_7089 ) ( not ( = ?AUTO_7089 ?AUTO_7088 ) ) ( OBJ-AT ?AUTO_7087 ?AUTO_7089 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7087 ?AUTO_7090 ?AUTO_7089 )
      ( DELIVER-PKG ?AUTO_7087 ?AUTO_7088 )
      ( DELIVER-PKG-VERIFY ?AUTO_7087 ?AUTO_7088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7091 - OBJ
      ?AUTO_7092 - LOCATION
    )
    :vars
    (
      ?AUTO_7093 - LOCATION
      ?AUTO_7095 - LOCATION
      ?AUTO_7094 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7093 ) ( AIRPORT ?AUTO_7092 ) ( not ( = ?AUTO_7093 ?AUTO_7092 ) ) ( OBJ-AT ?AUTO_7091 ?AUTO_7093 ) ( AIRPORT ?AUTO_7095 ) ( AIRPLANE-AT ?AUTO_7094 ?AUTO_7095 ) ( not ( = ?AUTO_7095 ?AUTO_7093 ) ) ( not ( = ?AUTO_7092 ?AUTO_7095 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7094 ?AUTO_7095 ?AUTO_7093 )
      ( DELIVER-PKG ?AUTO_7091 ?AUTO_7092 )
      ( DELIVER-PKG-VERIFY ?AUTO_7091 ?AUTO_7092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7104 - OBJ
      ?AUTO_7105 - LOCATION
    )
    :vars
    (
      ?AUTO_7106 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7104 ?AUTO_7106 ) ( AIRPLANE-AT ?AUTO_7106 ?AUTO_7105 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7104 ?AUTO_7106 ?AUTO_7105 )
      ( DELIVER-PKG-VERIFY ?AUTO_7104 ?AUTO_7105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7111 - OBJ
      ?AUTO_7112 - LOCATION
    )
    :vars
    (
      ?AUTO_7114 - LOCATION
      ?AUTO_7113 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7114 ) ( AIRPORT ?AUTO_7112 ) ( AIRPLANE-AT ?AUTO_7113 ?AUTO_7114 ) ( not ( = ?AUTO_7114 ?AUTO_7112 ) ) ( OBJ-AT ?AUTO_7111 ?AUTO_7114 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7111 ?AUTO_7113 ?AUTO_7114 )
      ( DELIVER-PKG ?AUTO_7111 ?AUTO_7112 )
      ( DELIVER-PKG-VERIFY ?AUTO_7111 ?AUTO_7112 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7115 - OBJ
      ?AUTO_7116 - LOCATION
    )
    :vars
    (
      ?AUTO_7117 - LOCATION
      ?AUTO_7118 - AIRPLANE
      ?AUTO_7119 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7117 ) ( AIRPORT ?AUTO_7116 ) ( AIRPLANE-AT ?AUTO_7118 ?AUTO_7117 ) ( not ( = ?AUTO_7117 ?AUTO_7116 ) ) ( TRUCK-AT ?AUTO_7119 ?AUTO_7117 ) ( IN-TRUCK ?AUTO_7115 ?AUTO_7119 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7115 ?AUTO_7119 ?AUTO_7117 )
      ( DELIVER-PKG ?AUTO_7115 ?AUTO_7116 )
      ( DELIVER-PKG-VERIFY ?AUTO_7115 ?AUTO_7116 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7120 - OBJ
      ?AUTO_7121 - LOCATION
    )
    :vars
    (
      ?AUTO_7123 - LOCATION
      ?AUTO_7122 - AIRPLANE
      ?AUTO_7124 - TRUCK
      ?AUTO_7125 - LOCATION
      ?AUTO_7126 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7123 ) ( AIRPORT ?AUTO_7121 ) ( AIRPLANE-AT ?AUTO_7122 ?AUTO_7123 ) ( not ( = ?AUTO_7123 ?AUTO_7121 ) ) ( IN-TRUCK ?AUTO_7120 ?AUTO_7124 ) ( TRUCK-AT ?AUTO_7124 ?AUTO_7125 ) ( IN-CITY ?AUTO_7125 ?AUTO_7126 ) ( IN-CITY ?AUTO_7123 ?AUTO_7126 ) ( not ( = ?AUTO_7123 ?AUTO_7125 ) ) ( not ( = ?AUTO_7121 ?AUTO_7125 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7124 ?AUTO_7125 ?AUTO_7123 ?AUTO_7126 )
      ( DELIVER-PKG ?AUTO_7120 ?AUTO_7121 )
      ( DELIVER-PKG-VERIFY ?AUTO_7120 ?AUTO_7121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7133 - OBJ
      ?AUTO_7134 - LOCATION
    )
    :vars
    (
      ?AUTO_7138 - LOCATION
      ?AUTO_7137 - AIRPLANE
      ?AUTO_7135 - TRUCK
      ?AUTO_7136 - LOCATION
      ?AUTO_7139 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7138 ) ( AIRPORT ?AUTO_7134 ) ( AIRPLANE-AT ?AUTO_7137 ?AUTO_7138 ) ( not ( = ?AUTO_7138 ?AUTO_7134 ) ) ( TRUCK-AT ?AUTO_7135 ?AUTO_7136 ) ( IN-CITY ?AUTO_7136 ?AUTO_7139 ) ( IN-CITY ?AUTO_7138 ?AUTO_7139 ) ( not ( = ?AUTO_7138 ?AUTO_7136 ) ) ( not ( = ?AUTO_7134 ?AUTO_7136 ) ) ( OBJ-AT ?AUTO_7133 ?AUTO_7136 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7133 ?AUTO_7135 ?AUTO_7136 )
      ( DELIVER-PKG ?AUTO_7133 ?AUTO_7134 )
      ( DELIVER-PKG-VERIFY ?AUTO_7133 ?AUTO_7134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7142 - OBJ
      ?AUTO_7143 - LOCATION
    )
    :vars
    (
      ?AUTO_7146 - LOCATION
      ?AUTO_7147 - AIRPLANE
      ?AUTO_7144 - LOCATION
      ?AUTO_7148 - CITY
      ?AUTO_7145 - TRUCK
      ?AUTO_7149 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7146 ) ( AIRPORT ?AUTO_7143 ) ( AIRPLANE-AT ?AUTO_7147 ?AUTO_7146 ) ( not ( = ?AUTO_7146 ?AUTO_7143 ) ) ( IN-CITY ?AUTO_7144 ?AUTO_7148 ) ( IN-CITY ?AUTO_7146 ?AUTO_7148 ) ( not ( = ?AUTO_7146 ?AUTO_7144 ) ) ( not ( = ?AUTO_7143 ?AUTO_7144 ) ) ( OBJ-AT ?AUTO_7142 ?AUTO_7144 ) ( TRUCK-AT ?AUTO_7145 ?AUTO_7149 ) ( IN-CITY ?AUTO_7149 ?AUTO_7148 ) ( not ( = ?AUTO_7144 ?AUTO_7149 ) ) ( not ( = ?AUTO_7143 ?AUTO_7149 ) ) ( not ( = ?AUTO_7146 ?AUTO_7149 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7145 ?AUTO_7149 ?AUTO_7144 ?AUTO_7148 )
      ( DELIVER-PKG ?AUTO_7142 ?AUTO_7143 )
      ( DELIVER-PKG-VERIFY ?AUTO_7142 ?AUTO_7143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7152 - OBJ
      ?AUTO_7153 - LOCATION
    )
    :vars
    (
      ?AUTO_7154 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7154 ?AUTO_7153 ) ( IN-TRUCK ?AUTO_7152 ?AUTO_7154 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7152 ?AUTO_7154 ?AUTO_7153 )
      ( DELIVER-PKG-VERIFY ?AUTO_7152 ?AUTO_7153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7155 - OBJ
      ?AUTO_7156 - LOCATION
    )
    :vars
    (
      ?AUTO_7157 - TRUCK
      ?AUTO_7158 - LOCATION
      ?AUTO_7159 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7155 ?AUTO_7157 ) ( TRUCK-AT ?AUTO_7157 ?AUTO_7158 ) ( IN-CITY ?AUTO_7158 ?AUTO_7159 ) ( IN-CITY ?AUTO_7156 ?AUTO_7159 ) ( not ( = ?AUTO_7156 ?AUTO_7158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7157 ?AUTO_7158 ?AUTO_7156 ?AUTO_7159 )
      ( DELIVER-PKG ?AUTO_7155 ?AUTO_7156 )
      ( DELIVER-PKG-VERIFY ?AUTO_7155 ?AUTO_7156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7186 - OBJ
      ?AUTO_7187 - LOCATION
    )
    :vars
    (
      ?AUTO_7188 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7186 ?AUTO_7188 ) ( AIRPLANE-AT ?AUTO_7188 ?AUTO_7187 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7186 ?AUTO_7188 ?AUTO_7187 )
      ( DELIVER-PKG-VERIFY ?AUTO_7186 ?AUTO_7187 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7189 - OBJ
      ?AUTO_7190 - LOCATION
    )
    :vars
    (
      ?AUTO_7191 - AIRPLANE
      ?AUTO_7192 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7189 ?AUTO_7191 ) ( AIRPORT ?AUTO_7192 ) ( AIRPORT ?AUTO_7190 ) ( AIRPLANE-AT ?AUTO_7191 ?AUTO_7192 ) ( not ( = ?AUTO_7192 ?AUTO_7190 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7191 ?AUTO_7192 ?AUTO_7190 )
      ( DELIVER-PKG ?AUTO_7189 ?AUTO_7190 )
      ( DELIVER-PKG-VERIFY ?AUTO_7189 ?AUTO_7190 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7193 - OBJ
      ?AUTO_7194 - LOCATION
    )
    :vars
    (
      ?AUTO_7196 - LOCATION
      ?AUTO_7195 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7196 ) ( AIRPORT ?AUTO_7194 ) ( AIRPLANE-AT ?AUTO_7195 ?AUTO_7196 ) ( not ( = ?AUTO_7196 ?AUTO_7194 ) ) ( OBJ-AT ?AUTO_7193 ?AUTO_7196 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7193 ?AUTO_7195 ?AUTO_7196 )
      ( DELIVER-PKG ?AUTO_7193 ?AUTO_7194 )
      ( DELIVER-PKG-VERIFY ?AUTO_7193 ?AUTO_7194 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7197 - OBJ
      ?AUTO_7198 - LOCATION
    )
    :vars
    (
      ?AUTO_7200 - LOCATION
      ?AUTO_7199 - AIRPLANE
      ?AUTO_7201 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7200 ) ( AIRPORT ?AUTO_7198 ) ( AIRPLANE-AT ?AUTO_7199 ?AUTO_7200 ) ( not ( = ?AUTO_7200 ?AUTO_7198 ) ) ( TRUCK-AT ?AUTO_7201 ?AUTO_7200 ) ( IN-TRUCK ?AUTO_7197 ?AUTO_7201 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7197 ?AUTO_7201 ?AUTO_7200 )
      ( DELIVER-PKG ?AUTO_7197 ?AUTO_7198 )
      ( DELIVER-PKG-VERIFY ?AUTO_7197 ?AUTO_7198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7202 - OBJ
      ?AUTO_7203 - LOCATION
    )
    :vars
    (
      ?AUTO_7205 - LOCATION
      ?AUTO_7204 - AIRPLANE
      ?AUTO_7206 - TRUCK
      ?AUTO_7207 - LOCATION
      ?AUTO_7208 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7205 ) ( AIRPORT ?AUTO_7203 ) ( AIRPLANE-AT ?AUTO_7204 ?AUTO_7205 ) ( not ( = ?AUTO_7205 ?AUTO_7203 ) ) ( IN-TRUCK ?AUTO_7202 ?AUTO_7206 ) ( TRUCK-AT ?AUTO_7206 ?AUTO_7207 ) ( IN-CITY ?AUTO_7207 ?AUTO_7208 ) ( IN-CITY ?AUTO_7205 ?AUTO_7208 ) ( not ( = ?AUTO_7205 ?AUTO_7207 ) ) ( not ( = ?AUTO_7203 ?AUTO_7207 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7206 ?AUTO_7207 ?AUTO_7205 ?AUTO_7208 )
      ( DELIVER-PKG ?AUTO_7202 ?AUTO_7203 )
      ( DELIVER-PKG-VERIFY ?AUTO_7202 ?AUTO_7203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7213 - OBJ
      ?AUTO_7214 - LOCATION
    )
    :vars
    (
      ?AUTO_7216 - LOCATION
      ?AUTO_7218 - TRUCK
      ?AUTO_7219 - LOCATION
      ?AUTO_7217 - CITY
      ?AUTO_7215 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7216 ) ( AIRPORT ?AUTO_7214 ) ( not ( = ?AUTO_7216 ?AUTO_7214 ) ) ( IN-TRUCK ?AUTO_7213 ?AUTO_7218 ) ( TRUCK-AT ?AUTO_7218 ?AUTO_7219 ) ( IN-CITY ?AUTO_7219 ?AUTO_7217 ) ( IN-CITY ?AUTO_7216 ?AUTO_7217 ) ( not ( = ?AUTO_7216 ?AUTO_7219 ) ) ( not ( = ?AUTO_7214 ?AUTO_7219 ) ) ( AIRPLANE-AT ?AUTO_7215 ?AUTO_7214 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7215 ?AUTO_7214 ?AUTO_7216 )
      ( DELIVER-PKG ?AUTO_7213 ?AUTO_7214 )
      ( DELIVER-PKG-VERIFY ?AUTO_7213 ?AUTO_7214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7234 - OBJ
      ?AUTO_7235 - LOCATION
    )
    :vars
    (
      ?AUTO_7240 - LOCATION
      ?AUTO_7239 - TRUCK
      ?AUTO_7238 - LOCATION
      ?AUTO_7237 - CITY
      ?AUTO_7236 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7240 ) ( AIRPORT ?AUTO_7235 ) ( not ( = ?AUTO_7240 ?AUTO_7235 ) ) ( TRUCK-AT ?AUTO_7239 ?AUTO_7238 ) ( IN-CITY ?AUTO_7238 ?AUTO_7237 ) ( IN-CITY ?AUTO_7240 ?AUTO_7237 ) ( not ( = ?AUTO_7240 ?AUTO_7238 ) ) ( not ( = ?AUTO_7235 ?AUTO_7238 ) ) ( AIRPLANE-AT ?AUTO_7236 ?AUTO_7235 ) ( OBJ-AT ?AUTO_7234 ?AUTO_7238 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7234 ?AUTO_7239 ?AUTO_7238 )
      ( DELIVER-PKG ?AUTO_7234 ?AUTO_7235 )
      ( DELIVER-PKG-VERIFY ?AUTO_7234 ?AUTO_7235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7245 - OBJ
      ?AUTO_7246 - LOCATION
    )
    :vars
    (
      ?AUTO_7247 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7247 ?AUTO_7246 ) ( IN-TRUCK ?AUTO_7245 ?AUTO_7247 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7245 ?AUTO_7247 ?AUTO_7246 )
      ( DELIVER-PKG-VERIFY ?AUTO_7245 ?AUTO_7246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7248 - OBJ
      ?AUTO_7249 - LOCATION
    )
    :vars
    (
      ?AUTO_7250 - TRUCK
      ?AUTO_7251 - LOCATION
      ?AUTO_7252 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7248 ?AUTO_7250 ) ( TRUCK-AT ?AUTO_7250 ?AUTO_7251 ) ( IN-CITY ?AUTO_7251 ?AUTO_7252 ) ( IN-CITY ?AUTO_7249 ?AUTO_7252 ) ( not ( = ?AUTO_7249 ?AUTO_7251 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7250 ?AUTO_7251 ?AUTO_7249 ?AUTO_7252 )
      ( DELIVER-PKG ?AUTO_7248 ?AUTO_7249 )
      ( DELIVER-PKG-VERIFY ?AUTO_7248 ?AUTO_7249 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7259 - OBJ
      ?AUTO_7260 - LOCATION
    )
    :vars
    (
      ?AUTO_7262 - TRUCK
      ?AUTO_7263 - LOCATION
      ?AUTO_7261 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7262 ?AUTO_7263 ) ( IN-CITY ?AUTO_7263 ?AUTO_7261 ) ( IN-CITY ?AUTO_7260 ?AUTO_7261 ) ( not ( = ?AUTO_7260 ?AUTO_7263 ) ) ( OBJ-AT ?AUTO_7259 ?AUTO_7263 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7259 ?AUTO_7262 ?AUTO_7263 )
      ( DELIVER-PKG ?AUTO_7259 ?AUTO_7260 )
      ( DELIVER-PKG-VERIFY ?AUTO_7259 ?AUTO_7260 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7272 - OBJ
      ?AUTO_7273 - LOCATION
    )
    :vars
    (
      ?AUTO_7275 - LOCATION
      ?AUTO_7276 - CITY
      ?AUTO_7274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7275 ?AUTO_7276 ) ( IN-CITY ?AUTO_7273 ?AUTO_7276 ) ( not ( = ?AUTO_7273 ?AUTO_7275 ) ) ( OBJ-AT ?AUTO_7272 ?AUTO_7275 ) ( TRUCK-AT ?AUTO_7274 ?AUTO_7273 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7274 ?AUTO_7273 ?AUTO_7275 ?AUTO_7276 )
      ( DELIVER-PKG ?AUTO_7272 ?AUTO_7273 )
      ( DELIVER-PKG-VERIFY ?AUTO_7272 ?AUTO_7273 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7279 - OBJ
      ?AUTO_7280 - LOCATION
    )
    :vars
    (
      ?AUTO_7283 - LOCATION
      ?AUTO_7282 - CITY
      ?AUTO_7281 - TRUCK
      ?AUTO_7284 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7283 ?AUTO_7282 ) ( IN-CITY ?AUTO_7280 ?AUTO_7282 ) ( not ( = ?AUTO_7280 ?AUTO_7283 ) ) ( TRUCK-AT ?AUTO_7281 ?AUTO_7280 ) ( IN-AIRPLANE ?AUTO_7279 ?AUTO_7284 ) ( AIRPLANE-AT ?AUTO_7284 ?AUTO_7283 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7279 ?AUTO_7284 ?AUTO_7283 )
      ( DELIVER-PKG ?AUTO_7279 ?AUTO_7280 )
      ( DELIVER-PKG-VERIFY ?AUTO_7279 ?AUTO_7280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7285 - OBJ
      ?AUTO_7286 - LOCATION
    )
    :vars
    (
      ?AUTO_7289 - LOCATION
      ?AUTO_7287 - CITY
      ?AUTO_7288 - TRUCK
      ?AUTO_7290 - AIRPLANE
      ?AUTO_7291 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7289 ?AUTO_7287 ) ( IN-CITY ?AUTO_7286 ?AUTO_7287 ) ( not ( = ?AUTO_7286 ?AUTO_7289 ) ) ( TRUCK-AT ?AUTO_7288 ?AUTO_7286 ) ( IN-AIRPLANE ?AUTO_7285 ?AUTO_7290 ) ( AIRPORT ?AUTO_7291 ) ( AIRPORT ?AUTO_7289 ) ( AIRPLANE-AT ?AUTO_7290 ?AUTO_7291 ) ( not ( = ?AUTO_7291 ?AUTO_7289 ) ) ( not ( = ?AUTO_7286 ?AUTO_7291 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7290 ?AUTO_7291 ?AUTO_7289 )
      ( DELIVER-PKG ?AUTO_7285 ?AUTO_7286 )
      ( DELIVER-PKG-VERIFY ?AUTO_7285 ?AUTO_7286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7300 - OBJ
      ?AUTO_7301 - LOCATION
    )
    :vars
    (
      ?AUTO_7302 - LOCATION
      ?AUTO_7304 - CITY
      ?AUTO_7305 - TRUCK
      ?AUTO_7303 - LOCATION
      ?AUTO_7306 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7302 ?AUTO_7304 ) ( IN-CITY ?AUTO_7301 ?AUTO_7304 ) ( not ( = ?AUTO_7301 ?AUTO_7302 ) ) ( TRUCK-AT ?AUTO_7305 ?AUTO_7301 ) ( AIRPORT ?AUTO_7303 ) ( AIRPORT ?AUTO_7302 ) ( AIRPLANE-AT ?AUTO_7306 ?AUTO_7303 ) ( not ( = ?AUTO_7303 ?AUTO_7302 ) ) ( not ( = ?AUTO_7301 ?AUTO_7303 ) ) ( OBJ-AT ?AUTO_7300 ?AUTO_7303 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7300 ?AUTO_7306 ?AUTO_7303 )
      ( DELIVER-PKG ?AUTO_7300 ?AUTO_7301 )
      ( DELIVER-PKG-VERIFY ?AUTO_7300 ?AUTO_7301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7307 - OBJ
      ?AUTO_7308 - LOCATION
    )
    :vars
    (
      ?AUTO_7309 - LOCATION
      ?AUTO_7311 - CITY
      ?AUTO_7312 - TRUCK
      ?AUTO_7310 - LOCATION
      ?AUTO_7314 - LOCATION
      ?AUTO_7313 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7309 ?AUTO_7311 ) ( IN-CITY ?AUTO_7308 ?AUTO_7311 ) ( not ( = ?AUTO_7308 ?AUTO_7309 ) ) ( TRUCK-AT ?AUTO_7312 ?AUTO_7308 ) ( AIRPORT ?AUTO_7310 ) ( AIRPORT ?AUTO_7309 ) ( not ( = ?AUTO_7310 ?AUTO_7309 ) ) ( not ( = ?AUTO_7308 ?AUTO_7310 ) ) ( OBJ-AT ?AUTO_7307 ?AUTO_7310 ) ( AIRPORT ?AUTO_7314 ) ( AIRPLANE-AT ?AUTO_7313 ?AUTO_7314 ) ( not ( = ?AUTO_7314 ?AUTO_7310 ) ) ( not ( = ?AUTO_7308 ?AUTO_7314 ) ) ( not ( = ?AUTO_7309 ?AUTO_7314 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7313 ?AUTO_7314 ?AUTO_7310 )
      ( DELIVER-PKG ?AUTO_7307 ?AUTO_7308 )
      ( DELIVER-PKG-VERIFY ?AUTO_7307 ?AUTO_7308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7323 - OBJ
      ?AUTO_7324 - LOCATION
    )
    :vars
    (
      ?AUTO_7325 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7325 ?AUTO_7324 ) ( IN-TRUCK ?AUTO_7323 ?AUTO_7325 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7323 ?AUTO_7325 ?AUTO_7324 )
      ( DELIVER-PKG-VERIFY ?AUTO_7323 ?AUTO_7324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7334 - OBJ
      ?AUTO_7335 - LOCATION
    )
    :vars
    (
      ?AUTO_7337 - TRUCK
      ?AUTO_7338 - LOCATION
      ?AUTO_7336 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7337 ?AUTO_7338 ) ( IN-CITY ?AUTO_7338 ?AUTO_7336 ) ( IN-CITY ?AUTO_7335 ?AUTO_7336 ) ( not ( = ?AUTO_7335 ?AUTO_7338 ) ) ( OBJ-AT ?AUTO_7334 ?AUTO_7338 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7334 ?AUTO_7337 ?AUTO_7338 )
      ( DELIVER-PKG ?AUTO_7334 ?AUTO_7335 )
      ( DELIVER-PKG-VERIFY ?AUTO_7334 ?AUTO_7335 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7341 - OBJ
      ?AUTO_7342 - LOCATION
    )
    :vars
    (
      ?AUTO_7344 - TRUCK
      ?AUTO_7345 - LOCATION
      ?AUTO_7343 - CITY
      ?AUTO_7346 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7344 ?AUTO_7345 ) ( IN-CITY ?AUTO_7345 ?AUTO_7343 ) ( IN-CITY ?AUTO_7342 ?AUTO_7343 ) ( not ( = ?AUTO_7342 ?AUTO_7345 ) ) ( IN-AIRPLANE ?AUTO_7341 ?AUTO_7346 ) ( AIRPLANE-AT ?AUTO_7346 ?AUTO_7345 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7341 ?AUTO_7346 ?AUTO_7345 )
      ( DELIVER-PKG ?AUTO_7341 ?AUTO_7342 )
      ( DELIVER-PKG-VERIFY ?AUTO_7341 ?AUTO_7342 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7347 - OBJ
      ?AUTO_7348 - LOCATION
    )
    :vars
    (
      ?AUTO_7350 - TRUCK
      ?AUTO_7351 - LOCATION
      ?AUTO_7349 - CITY
      ?AUTO_7352 - AIRPLANE
      ?AUTO_7353 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7350 ?AUTO_7351 ) ( IN-CITY ?AUTO_7351 ?AUTO_7349 ) ( IN-CITY ?AUTO_7348 ?AUTO_7349 ) ( not ( = ?AUTO_7348 ?AUTO_7351 ) ) ( IN-AIRPLANE ?AUTO_7347 ?AUTO_7352 ) ( AIRPORT ?AUTO_7353 ) ( AIRPORT ?AUTO_7351 ) ( AIRPLANE-AT ?AUTO_7352 ?AUTO_7353 ) ( not ( = ?AUTO_7353 ?AUTO_7351 ) ) ( not ( = ?AUTO_7348 ?AUTO_7353 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7352 ?AUTO_7353 ?AUTO_7351 )
      ( DELIVER-PKG ?AUTO_7347 ?AUTO_7348 )
      ( DELIVER-PKG-VERIFY ?AUTO_7347 ?AUTO_7348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7354 - OBJ
      ?AUTO_7355 - LOCATION
    )
    :vars
    (
      ?AUTO_7356 - TRUCK
      ?AUTO_7359 - LOCATION
      ?AUTO_7358 - CITY
      ?AUTO_7360 - LOCATION
      ?AUTO_7357 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7356 ?AUTO_7359 ) ( IN-CITY ?AUTO_7359 ?AUTO_7358 ) ( IN-CITY ?AUTO_7355 ?AUTO_7358 ) ( not ( = ?AUTO_7355 ?AUTO_7359 ) ) ( AIRPORT ?AUTO_7360 ) ( AIRPORT ?AUTO_7359 ) ( AIRPLANE-AT ?AUTO_7357 ?AUTO_7360 ) ( not ( = ?AUTO_7360 ?AUTO_7359 ) ) ( not ( = ?AUTO_7355 ?AUTO_7360 ) ) ( OBJ-AT ?AUTO_7354 ?AUTO_7360 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7354 ?AUTO_7357 ?AUTO_7360 )
      ( DELIVER-PKG ?AUTO_7354 ?AUTO_7355 )
      ( DELIVER-PKG-VERIFY ?AUTO_7354 ?AUTO_7355 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7361 - OBJ
      ?AUTO_7362 - LOCATION
    )
    :vars
    (
      ?AUTO_7367 - TRUCK
      ?AUTO_7365 - LOCATION
      ?AUTO_7364 - CITY
      ?AUTO_7366 - LOCATION
      ?AUTO_7363 - AIRPLANE
      ?AUTO_7368 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7367 ?AUTO_7365 ) ( IN-CITY ?AUTO_7365 ?AUTO_7364 ) ( IN-CITY ?AUTO_7362 ?AUTO_7364 ) ( not ( = ?AUTO_7362 ?AUTO_7365 ) ) ( AIRPORT ?AUTO_7366 ) ( AIRPORT ?AUTO_7365 ) ( AIRPLANE-AT ?AUTO_7363 ?AUTO_7366 ) ( not ( = ?AUTO_7366 ?AUTO_7365 ) ) ( not ( = ?AUTO_7362 ?AUTO_7366 ) ) ( TRUCK-AT ?AUTO_7368 ?AUTO_7366 ) ( IN-TRUCK ?AUTO_7361 ?AUTO_7368 ) ( not ( = ?AUTO_7367 ?AUTO_7368 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7361 ?AUTO_7368 ?AUTO_7366 )
      ( DELIVER-PKG ?AUTO_7361 ?AUTO_7362 )
      ( DELIVER-PKG-VERIFY ?AUTO_7361 ?AUTO_7362 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7369 - OBJ
      ?AUTO_7370 - LOCATION
    )
    :vars
    (
      ?AUTO_7372 - TRUCK
      ?AUTO_7376 - LOCATION
      ?AUTO_7374 - CITY
      ?AUTO_7375 - LOCATION
      ?AUTO_7373 - AIRPLANE
      ?AUTO_7371 - TRUCK
      ?AUTO_7377 - LOCATION
      ?AUTO_7378 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7372 ?AUTO_7376 ) ( IN-CITY ?AUTO_7376 ?AUTO_7374 ) ( IN-CITY ?AUTO_7370 ?AUTO_7374 ) ( not ( = ?AUTO_7370 ?AUTO_7376 ) ) ( AIRPORT ?AUTO_7375 ) ( AIRPORT ?AUTO_7376 ) ( AIRPLANE-AT ?AUTO_7373 ?AUTO_7375 ) ( not ( = ?AUTO_7375 ?AUTO_7376 ) ) ( not ( = ?AUTO_7370 ?AUTO_7375 ) ) ( IN-TRUCK ?AUTO_7369 ?AUTO_7371 ) ( not ( = ?AUTO_7372 ?AUTO_7371 ) ) ( TRUCK-AT ?AUTO_7371 ?AUTO_7377 ) ( IN-CITY ?AUTO_7377 ?AUTO_7378 ) ( IN-CITY ?AUTO_7375 ?AUTO_7378 ) ( not ( = ?AUTO_7375 ?AUTO_7377 ) ) ( not ( = ?AUTO_7370 ?AUTO_7377 ) ) ( not ( = ?AUTO_7376 ?AUTO_7377 ) ) ( not ( = ?AUTO_7374 ?AUTO_7378 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7371 ?AUTO_7377 ?AUTO_7375 ?AUTO_7378 )
      ( DELIVER-PKG ?AUTO_7369 ?AUTO_7370 )
      ( DELIVER-PKG-VERIFY ?AUTO_7369 ?AUTO_7370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7383 - OBJ
      ?AUTO_7384 - LOCATION
    )
    :vars
    (
      ?AUTO_7388 - TRUCK
      ?AUTO_7385 - LOCATION
      ?AUTO_7390 - CITY
      ?AUTO_7391 - LOCATION
      ?AUTO_7392 - TRUCK
      ?AUTO_7389 - LOCATION
      ?AUTO_7386 - CITY
      ?AUTO_7387 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7388 ?AUTO_7385 ) ( IN-CITY ?AUTO_7385 ?AUTO_7390 ) ( IN-CITY ?AUTO_7384 ?AUTO_7390 ) ( not ( = ?AUTO_7384 ?AUTO_7385 ) ) ( AIRPORT ?AUTO_7391 ) ( AIRPORT ?AUTO_7385 ) ( not ( = ?AUTO_7391 ?AUTO_7385 ) ) ( not ( = ?AUTO_7384 ?AUTO_7391 ) ) ( IN-TRUCK ?AUTO_7383 ?AUTO_7392 ) ( not ( = ?AUTO_7388 ?AUTO_7392 ) ) ( TRUCK-AT ?AUTO_7392 ?AUTO_7389 ) ( IN-CITY ?AUTO_7389 ?AUTO_7386 ) ( IN-CITY ?AUTO_7391 ?AUTO_7386 ) ( not ( = ?AUTO_7391 ?AUTO_7389 ) ) ( not ( = ?AUTO_7384 ?AUTO_7389 ) ) ( not ( = ?AUTO_7385 ?AUTO_7389 ) ) ( not ( = ?AUTO_7390 ?AUTO_7386 ) ) ( AIRPLANE-AT ?AUTO_7387 ?AUTO_7385 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7387 ?AUTO_7385 ?AUTO_7391 )
      ( DELIVER-PKG ?AUTO_7383 ?AUTO_7384 )
      ( DELIVER-PKG-VERIFY ?AUTO_7383 ?AUTO_7384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7397 - OBJ
      ?AUTO_7398 - LOCATION
    )
    :vars
    (
      ?AUTO_7403 - LOCATION
      ?AUTO_7399 - CITY
      ?AUTO_7406 - LOCATION
      ?AUTO_7405 - TRUCK
      ?AUTO_7402 - TRUCK
      ?AUTO_7401 - LOCATION
      ?AUTO_7400 - CITY
      ?AUTO_7404 - AIRPLANE
      ?AUTO_7407 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7403 ?AUTO_7399 ) ( IN-CITY ?AUTO_7398 ?AUTO_7399 ) ( not ( = ?AUTO_7398 ?AUTO_7403 ) ) ( AIRPORT ?AUTO_7406 ) ( AIRPORT ?AUTO_7403 ) ( not ( = ?AUTO_7406 ?AUTO_7403 ) ) ( not ( = ?AUTO_7398 ?AUTO_7406 ) ) ( IN-TRUCK ?AUTO_7397 ?AUTO_7405 ) ( not ( = ?AUTO_7402 ?AUTO_7405 ) ) ( TRUCK-AT ?AUTO_7405 ?AUTO_7401 ) ( IN-CITY ?AUTO_7401 ?AUTO_7400 ) ( IN-CITY ?AUTO_7406 ?AUTO_7400 ) ( not ( = ?AUTO_7406 ?AUTO_7401 ) ) ( not ( = ?AUTO_7398 ?AUTO_7401 ) ) ( not ( = ?AUTO_7403 ?AUTO_7401 ) ) ( not ( = ?AUTO_7399 ?AUTO_7400 ) ) ( AIRPLANE-AT ?AUTO_7404 ?AUTO_7403 ) ( TRUCK-AT ?AUTO_7402 ?AUTO_7407 ) ( IN-CITY ?AUTO_7407 ?AUTO_7399 ) ( not ( = ?AUTO_7403 ?AUTO_7407 ) ) ( not ( = ?AUTO_7398 ?AUTO_7407 ) ) ( not ( = ?AUTO_7406 ?AUTO_7407 ) ) ( not ( = ?AUTO_7401 ?AUTO_7407 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7402 ?AUTO_7407 ?AUTO_7403 ?AUTO_7399 )
      ( DELIVER-PKG ?AUTO_7397 ?AUTO_7398 )
      ( DELIVER-PKG-VERIFY ?AUTO_7397 ?AUTO_7398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7416 - OBJ
      ?AUTO_7417 - LOCATION
    )
    :vars
    (
      ?AUTO_7421 - LOCATION
      ?AUTO_7425 - CITY
      ?AUTO_7418 - LOCATION
      ?AUTO_7420 - TRUCK
      ?AUTO_7419 - TRUCK
      ?AUTO_7423 - LOCATION
      ?AUTO_7424 - CITY
      ?AUTO_7422 - AIRPLANE
      ?AUTO_7426 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7421 ?AUTO_7425 ) ( IN-CITY ?AUTO_7417 ?AUTO_7425 ) ( not ( = ?AUTO_7417 ?AUTO_7421 ) ) ( AIRPORT ?AUTO_7418 ) ( AIRPORT ?AUTO_7421 ) ( not ( = ?AUTO_7418 ?AUTO_7421 ) ) ( not ( = ?AUTO_7417 ?AUTO_7418 ) ) ( not ( = ?AUTO_7420 ?AUTO_7419 ) ) ( TRUCK-AT ?AUTO_7419 ?AUTO_7423 ) ( IN-CITY ?AUTO_7423 ?AUTO_7424 ) ( IN-CITY ?AUTO_7418 ?AUTO_7424 ) ( not ( = ?AUTO_7418 ?AUTO_7423 ) ) ( not ( = ?AUTO_7417 ?AUTO_7423 ) ) ( not ( = ?AUTO_7421 ?AUTO_7423 ) ) ( not ( = ?AUTO_7425 ?AUTO_7424 ) ) ( AIRPLANE-AT ?AUTO_7422 ?AUTO_7421 ) ( TRUCK-AT ?AUTO_7420 ?AUTO_7426 ) ( IN-CITY ?AUTO_7426 ?AUTO_7425 ) ( not ( = ?AUTO_7421 ?AUTO_7426 ) ) ( not ( = ?AUTO_7417 ?AUTO_7426 ) ) ( not ( = ?AUTO_7418 ?AUTO_7426 ) ) ( not ( = ?AUTO_7423 ?AUTO_7426 ) ) ( OBJ-AT ?AUTO_7416 ?AUTO_7423 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7416 ?AUTO_7419 ?AUTO_7423 )
      ( DELIVER-PKG ?AUTO_7416 ?AUTO_7417 )
      ( DELIVER-PKG-VERIFY ?AUTO_7416 ?AUTO_7417 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7431 - OBJ
      ?AUTO_7432 - LOCATION
    )
    :vars
    (
      ?AUTO_7433 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7433 ?AUTO_7432 ) ( IN-TRUCK ?AUTO_7431 ?AUTO_7433 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7431 ?AUTO_7433 ?AUTO_7432 )
      ( DELIVER-PKG-VERIFY ?AUTO_7431 ?AUTO_7432 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7440 - OBJ
      ?AUTO_7441 - LOCATION
    )
    :vars
    (
      ?AUTO_7443 - TRUCK
      ?AUTO_7442 - LOCATION
      ?AUTO_7444 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7443 ?AUTO_7442 ) ( IN-CITY ?AUTO_7442 ?AUTO_7444 ) ( IN-CITY ?AUTO_7441 ?AUTO_7444 ) ( not ( = ?AUTO_7441 ?AUTO_7442 ) ) ( OBJ-AT ?AUTO_7440 ?AUTO_7442 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7440 ?AUTO_7443 ?AUTO_7442 )
      ( DELIVER-PKG ?AUTO_7440 ?AUTO_7441 )
      ( DELIVER-PKG-VERIFY ?AUTO_7440 ?AUTO_7441 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7461 - OBJ
      ?AUTO_7462 - LOCATION
    )
    :vars
    (
      ?AUTO_7463 - LOCATION
      ?AUTO_7465 - CITY
      ?AUTO_7464 - TRUCK
      ?AUTO_7466 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7463 ?AUTO_7465 ) ( IN-CITY ?AUTO_7462 ?AUTO_7465 ) ( not ( = ?AUTO_7462 ?AUTO_7463 ) ) ( TRUCK-AT ?AUTO_7464 ?AUTO_7462 ) ( IN-AIRPLANE ?AUTO_7461 ?AUTO_7466 ) ( AIRPLANE-AT ?AUTO_7466 ?AUTO_7463 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7461 ?AUTO_7466 ?AUTO_7463 )
      ( DELIVER-PKG ?AUTO_7461 ?AUTO_7462 )
      ( DELIVER-PKG-VERIFY ?AUTO_7461 ?AUTO_7462 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7471 - OBJ
      ?AUTO_7472 - LOCATION
    )
    :vars
    (
      ?AUTO_7474 - LOCATION
      ?AUTO_7477 - CITY
      ?AUTO_7475 - TRUCK
      ?AUTO_7473 - LOCATION
      ?AUTO_7476 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7474 ?AUTO_7477 ) ( IN-CITY ?AUTO_7472 ?AUTO_7477 ) ( not ( = ?AUTO_7472 ?AUTO_7474 ) ) ( TRUCK-AT ?AUTO_7475 ?AUTO_7472 ) ( AIRPORT ?AUTO_7473 ) ( AIRPORT ?AUTO_7474 ) ( AIRPLANE-AT ?AUTO_7476 ?AUTO_7473 ) ( not ( = ?AUTO_7473 ?AUTO_7474 ) ) ( not ( = ?AUTO_7472 ?AUTO_7473 ) ) ( OBJ-AT ?AUTO_7471 ?AUTO_7473 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7471 ?AUTO_7476 ?AUTO_7473 )
      ( DELIVER-PKG ?AUTO_7471 ?AUTO_7472 )
      ( DELIVER-PKG-VERIFY ?AUTO_7471 ?AUTO_7472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7478 - OBJ
      ?AUTO_7479 - LOCATION
    )
    :vars
    (
      ?AUTO_7481 - LOCATION
      ?AUTO_7484 - CITY
      ?AUTO_7482 - TRUCK
      ?AUTO_7480 - LOCATION
      ?AUTO_7483 - AIRPLANE
      ?AUTO_7485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7481 ?AUTO_7484 ) ( IN-CITY ?AUTO_7479 ?AUTO_7484 ) ( not ( = ?AUTO_7479 ?AUTO_7481 ) ) ( TRUCK-AT ?AUTO_7482 ?AUTO_7479 ) ( AIRPORT ?AUTO_7480 ) ( AIRPORT ?AUTO_7481 ) ( AIRPLANE-AT ?AUTO_7483 ?AUTO_7480 ) ( not ( = ?AUTO_7480 ?AUTO_7481 ) ) ( not ( = ?AUTO_7479 ?AUTO_7480 ) ) ( TRUCK-AT ?AUTO_7485 ?AUTO_7480 ) ( IN-TRUCK ?AUTO_7478 ?AUTO_7485 ) ( not ( = ?AUTO_7482 ?AUTO_7485 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7478 ?AUTO_7485 ?AUTO_7480 )
      ( DELIVER-PKG ?AUTO_7478 ?AUTO_7479 )
      ( DELIVER-PKG-VERIFY ?AUTO_7478 ?AUTO_7479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7486 - OBJ
      ?AUTO_7487 - LOCATION
    )
    :vars
    (
      ?AUTO_7490 - LOCATION
      ?AUTO_7493 - CITY
      ?AUTO_7491 - TRUCK
      ?AUTO_7492 - LOCATION
      ?AUTO_7488 - AIRPLANE
      ?AUTO_7489 - TRUCK
      ?AUTO_7494 - LOCATION
      ?AUTO_7495 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7490 ?AUTO_7493 ) ( IN-CITY ?AUTO_7487 ?AUTO_7493 ) ( not ( = ?AUTO_7487 ?AUTO_7490 ) ) ( TRUCK-AT ?AUTO_7491 ?AUTO_7487 ) ( AIRPORT ?AUTO_7492 ) ( AIRPORT ?AUTO_7490 ) ( AIRPLANE-AT ?AUTO_7488 ?AUTO_7492 ) ( not ( = ?AUTO_7492 ?AUTO_7490 ) ) ( not ( = ?AUTO_7487 ?AUTO_7492 ) ) ( IN-TRUCK ?AUTO_7486 ?AUTO_7489 ) ( not ( = ?AUTO_7491 ?AUTO_7489 ) ) ( TRUCK-AT ?AUTO_7489 ?AUTO_7494 ) ( IN-CITY ?AUTO_7494 ?AUTO_7495 ) ( IN-CITY ?AUTO_7492 ?AUTO_7495 ) ( not ( = ?AUTO_7492 ?AUTO_7494 ) ) ( not ( = ?AUTO_7487 ?AUTO_7494 ) ) ( not ( = ?AUTO_7490 ?AUTO_7494 ) ) ( not ( = ?AUTO_7493 ?AUTO_7495 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7489 ?AUTO_7494 ?AUTO_7492 ?AUTO_7495 )
      ( DELIVER-PKG ?AUTO_7486 ?AUTO_7487 )
      ( DELIVER-PKG-VERIFY ?AUTO_7486 ?AUTO_7487 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7502 - OBJ
      ?AUTO_7503 - LOCATION
    )
    :vars
    (
      ?AUTO_7511 - LOCATION
      ?AUTO_7507 - CITY
      ?AUTO_7504 - TRUCK
      ?AUTO_7509 - LOCATION
      ?AUTO_7505 - AIRPLANE
      ?AUTO_7510 - TRUCK
      ?AUTO_7506 - LOCATION
      ?AUTO_7508 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7511 ?AUTO_7507 ) ( IN-CITY ?AUTO_7503 ?AUTO_7507 ) ( not ( = ?AUTO_7503 ?AUTO_7511 ) ) ( TRUCK-AT ?AUTO_7504 ?AUTO_7503 ) ( AIRPORT ?AUTO_7509 ) ( AIRPORT ?AUTO_7511 ) ( AIRPLANE-AT ?AUTO_7505 ?AUTO_7509 ) ( not ( = ?AUTO_7509 ?AUTO_7511 ) ) ( not ( = ?AUTO_7503 ?AUTO_7509 ) ) ( not ( = ?AUTO_7504 ?AUTO_7510 ) ) ( TRUCK-AT ?AUTO_7510 ?AUTO_7506 ) ( IN-CITY ?AUTO_7506 ?AUTO_7508 ) ( IN-CITY ?AUTO_7509 ?AUTO_7508 ) ( not ( = ?AUTO_7509 ?AUTO_7506 ) ) ( not ( = ?AUTO_7503 ?AUTO_7506 ) ) ( not ( = ?AUTO_7511 ?AUTO_7506 ) ) ( not ( = ?AUTO_7507 ?AUTO_7508 ) ) ( OBJ-AT ?AUTO_7502 ?AUTO_7506 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7502 ?AUTO_7510 ?AUTO_7506 )
      ( DELIVER-PKG ?AUTO_7502 ?AUTO_7503 )
      ( DELIVER-PKG-VERIFY ?AUTO_7502 ?AUTO_7503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7514 - OBJ
      ?AUTO_7515 - LOCATION
    )
    :vars
    (
      ?AUTO_7522 - LOCATION
      ?AUTO_7520 - CITY
      ?AUTO_7523 - TRUCK
      ?AUTO_7521 - LOCATION
      ?AUTO_7516 - AIRPLANE
      ?AUTO_7517 - TRUCK
      ?AUTO_7519 - LOCATION
      ?AUTO_7518 - CITY
      ?AUTO_7524 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7522 ?AUTO_7520 ) ( IN-CITY ?AUTO_7515 ?AUTO_7520 ) ( not ( = ?AUTO_7515 ?AUTO_7522 ) ) ( TRUCK-AT ?AUTO_7523 ?AUTO_7515 ) ( AIRPORT ?AUTO_7521 ) ( AIRPORT ?AUTO_7522 ) ( AIRPLANE-AT ?AUTO_7516 ?AUTO_7521 ) ( not ( = ?AUTO_7521 ?AUTO_7522 ) ) ( not ( = ?AUTO_7515 ?AUTO_7521 ) ) ( not ( = ?AUTO_7523 ?AUTO_7517 ) ) ( IN-CITY ?AUTO_7519 ?AUTO_7518 ) ( IN-CITY ?AUTO_7521 ?AUTO_7518 ) ( not ( = ?AUTO_7521 ?AUTO_7519 ) ) ( not ( = ?AUTO_7515 ?AUTO_7519 ) ) ( not ( = ?AUTO_7522 ?AUTO_7519 ) ) ( not ( = ?AUTO_7520 ?AUTO_7518 ) ) ( OBJ-AT ?AUTO_7514 ?AUTO_7519 ) ( TRUCK-AT ?AUTO_7517 ?AUTO_7524 ) ( IN-CITY ?AUTO_7524 ?AUTO_7518 ) ( not ( = ?AUTO_7519 ?AUTO_7524 ) ) ( not ( = ?AUTO_7515 ?AUTO_7524 ) ) ( not ( = ?AUTO_7522 ?AUTO_7524 ) ) ( not ( = ?AUTO_7521 ?AUTO_7524 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7517 ?AUTO_7524 ?AUTO_7519 ?AUTO_7518 )
      ( DELIVER-PKG ?AUTO_7514 ?AUTO_7515 )
      ( DELIVER-PKG-VERIFY ?AUTO_7514 ?AUTO_7515 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7527 - OBJ
      ?AUTO_7528 - LOCATION
    )
    :vars
    (
      ?AUTO_7529 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7529 ?AUTO_7528 ) ( IN-TRUCK ?AUTO_7527 ?AUTO_7529 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7527 ?AUTO_7529 ?AUTO_7528 )
      ( DELIVER-PKG-VERIFY ?AUTO_7527 ?AUTO_7528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7530 - OBJ
      ?AUTO_7531 - LOCATION
    )
    :vars
    (
      ?AUTO_7532 - TRUCK
      ?AUTO_7533 - LOCATION
      ?AUTO_7534 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7530 ?AUTO_7532 ) ( TRUCK-AT ?AUTO_7532 ?AUTO_7533 ) ( IN-CITY ?AUTO_7533 ?AUTO_7534 ) ( IN-CITY ?AUTO_7531 ?AUTO_7534 ) ( not ( = ?AUTO_7531 ?AUTO_7533 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7532 ?AUTO_7533 ?AUTO_7531 ?AUTO_7534 )
      ( DELIVER-PKG ?AUTO_7530 ?AUTO_7531 )
      ( DELIVER-PKG-VERIFY ?AUTO_7530 ?AUTO_7531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7549 - OBJ
      ?AUTO_7550 - LOCATION
    )
    :vars
    (
      ?AUTO_7553 - TRUCK
      ?AUTO_7551 - LOCATION
      ?AUTO_7552 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7553 ?AUTO_7551 ) ( IN-CITY ?AUTO_7551 ?AUTO_7552 ) ( IN-CITY ?AUTO_7550 ?AUTO_7552 ) ( not ( = ?AUTO_7550 ?AUTO_7551 ) ) ( OBJ-AT ?AUTO_7549 ?AUTO_7551 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7549 ?AUTO_7553 ?AUTO_7551 )
      ( DELIVER-PKG ?AUTO_7549 ?AUTO_7550 )
      ( DELIVER-PKG-VERIFY ?AUTO_7549 ?AUTO_7550 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7556 - OBJ
      ?AUTO_7557 - LOCATION
    )
    :vars
    (
      ?AUTO_7558 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7558 ?AUTO_7557 ) ( IN-TRUCK ?AUTO_7556 ?AUTO_7558 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7556 ?AUTO_7558 ?AUTO_7557 )
      ( DELIVER-PKG-VERIFY ?AUTO_7556 ?AUTO_7557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7569 - OBJ
      ?AUTO_7570 - LOCATION
    )
    :vars
    (
      ?AUTO_7572 - TRUCK
      ?AUTO_7573 - LOCATION
      ?AUTO_7571 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7572 ?AUTO_7573 ) ( IN-CITY ?AUTO_7573 ?AUTO_7571 ) ( IN-CITY ?AUTO_7570 ?AUTO_7571 ) ( not ( = ?AUTO_7570 ?AUTO_7573 ) ) ( OBJ-AT ?AUTO_7569 ?AUTO_7573 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7569 ?AUTO_7572 ?AUTO_7573 )
      ( DELIVER-PKG ?AUTO_7569 ?AUTO_7570 )
      ( DELIVER-PKG-VERIFY ?AUTO_7569 ?AUTO_7570 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7586 - OBJ
      ?AUTO_7587 - LOCATION
    )
    :vars
    (
      ?AUTO_7588 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7586 ?AUTO_7588 ) ( AIRPLANE-AT ?AUTO_7588 ?AUTO_7587 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7586 ?AUTO_7588 ?AUTO_7587 )
      ( DELIVER-PKG-VERIFY ?AUTO_7586 ?AUTO_7587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7591 - OBJ
      ?AUTO_7592 - LOCATION
    )
    :vars
    (
      ?AUTO_7593 - AIRPLANE
      ?AUTO_7594 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7591 ?AUTO_7593 ) ( AIRPORT ?AUTO_7594 ) ( AIRPORT ?AUTO_7592 ) ( AIRPLANE-AT ?AUTO_7593 ?AUTO_7594 ) ( not ( = ?AUTO_7594 ?AUTO_7592 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7593 ?AUTO_7594 ?AUTO_7592 )
      ( DELIVER-PKG ?AUTO_7591 ?AUTO_7592 )
      ( DELIVER-PKG-VERIFY ?AUTO_7591 ?AUTO_7592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7611 - OBJ
      ?AUTO_7612 - LOCATION
    )
    :vars
    (
      ?AUTO_7613 - LOCATION
      ?AUTO_7614 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7613 ) ( AIRPORT ?AUTO_7612 ) ( AIRPLANE-AT ?AUTO_7614 ?AUTO_7613 ) ( not ( = ?AUTO_7613 ?AUTO_7612 ) ) ( OBJ-AT ?AUTO_7611 ?AUTO_7613 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7611 ?AUTO_7614 ?AUTO_7613 )
      ( DELIVER-PKG ?AUTO_7611 ?AUTO_7612 )
      ( DELIVER-PKG-VERIFY ?AUTO_7611 ?AUTO_7612 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7615 - OBJ
      ?AUTO_7616 - LOCATION
    )
    :vars
    (
      ?AUTO_7618 - LOCATION
      ?AUTO_7619 - LOCATION
      ?AUTO_7617 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7618 ) ( AIRPORT ?AUTO_7616 ) ( not ( = ?AUTO_7618 ?AUTO_7616 ) ) ( OBJ-AT ?AUTO_7615 ?AUTO_7618 ) ( AIRPORT ?AUTO_7619 ) ( AIRPLANE-AT ?AUTO_7617 ?AUTO_7619 ) ( not ( = ?AUTO_7619 ?AUTO_7618 ) ) ( not ( = ?AUTO_7616 ?AUTO_7619 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7617 ?AUTO_7619 ?AUTO_7618 )
      ( DELIVER-PKG ?AUTO_7615 ?AUTO_7616 )
      ( DELIVER-PKG-VERIFY ?AUTO_7615 ?AUTO_7616 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7626 - OBJ
      ?AUTO_7627 - LOCATION
    )
    :vars
    (
      ?AUTO_7628 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7626 ?AUTO_7628 ) ( AIRPLANE-AT ?AUTO_7628 ?AUTO_7627 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7626 ?AUTO_7628 ?AUTO_7627 )
      ( DELIVER-PKG-VERIFY ?AUTO_7626 ?AUTO_7627 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7661 - OBJ
      ?AUTO_7662 - LOCATION
    )
    :vars
    (
      ?AUTO_7663 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7661 ?AUTO_7663 ) ( AIRPLANE-AT ?AUTO_7663 ?AUTO_7662 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7661 ?AUTO_7663 ?AUTO_7662 )
      ( DELIVER-PKG-VERIFY ?AUTO_7661 ?AUTO_7662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7664 - OBJ
      ?AUTO_7665 - LOCATION
    )
    :vars
    (
      ?AUTO_7666 - AIRPLANE
      ?AUTO_7667 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7664 ?AUTO_7666 ) ( AIRPORT ?AUTO_7667 ) ( AIRPORT ?AUTO_7665 ) ( AIRPLANE-AT ?AUTO_7666 ?AUTO_7667 ) ( not ( = ?AUTO_7667 ?AUTO_7665 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7666 ?AUTO_7667 ?AUTO_7665 )
      ( DELIVER-PKG ?AUTO_7664 ?AUTO_7665 )
      ( DELIVER-PKG-VERIFY ?AUTO_7664 ?AUTO_7665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7676 - OBJ
      ?AUTO_7677 - LOCATION
    )
    :vars
    (
      ?AUTO_7679 - LOCATION
      ?AUTO_7678 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7679 ) ( AIRPORT ?AUTO_7677 ) ( AIRPLANE-AT ?AUTO_7678 ?AUTO_7679 ) ( not ( = ?AUTO_7679 ?AUTO_7677 ) ) ( OBJ-AT ?AUTO_7676 ?AUTO_7679 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7676 ?AUTO_7678 ?AUTO_7679 )
      ( DELIVER-PKG ?AUTO_7676 ?AUTO_7677 )
      ( DELIVER-PKG-VERIFY ?AUTO_7676 ?AUTO_7677 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7680 - OBJ
      ?AUTO_7681 - LOCATION
    )
    :vars
    (
      ?AUTO_7682 - LOCATION
      ?AUTO_7683 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7682 ) ( AIRPORT ?AUTO_7681 ) ( not ( = ?AUTO_7682 ?AUTO_7681 ) ) ( OBJ-AT ?AUTO_7680 ?AUTO_7682 ) ( AIRPLANE-AT ?AUTO_7683 ?AUTO_7681 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7683 ?AUTO_7681 ?AUTO_7682 )
      ( DELIVER-PKG ?AUTO_7680 ?AUTO_7681 )
      ( DELIVER-PKG-VERIFY ?AUTO_7680 ?AUTO_7681 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7688 - OBJ
      ?AUTO_7689 - LOCATION
    )
    :vars
    (
      ?AUTO_7690 - LOCATION
      ?AUTO_7691 - AIRPLANE
      ?AUTO_7692 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7690 ) ( AIRPORT ?AUTO_7689 ) ( not ( = ?AUTO_7690 ?AUTO_7689 ) ) ( AIRPLANE-AT ?AUTO_7691 ?AUTO_7689 ) ( TRUCK-AT ?AUTO_7692 ?AUTO_7690 ) ( IN-TRUCK ?AUTO_7688 ?AUTO_7692 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7688 ?AUTO_7692 ?AUTO_7690 )
      ( DELIVER-PKG ?AUTO_7688 ?AUTO_7689 )
      ( DELIVER-PKG-VERIFY ?AUTO_7688 ?AUTO_7689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7693 - OBJ
      ?AUTO_7694 - LOCATION
    )
    :vars
    (
      ?AUTO_7696 - LOCATION
      ?AUTO_7695 - AIRPLANE
      ?AUTO_7697 - TRUCK
      ?AUTO_7698 - LOCATION
      ?AUTO_7699 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7696 ) ( AIRPORT ?AUTO_7694 ) ( not ( = ?AUTO_7696 ?AUTO_7694 ) ) ( AIRPLANE-AT ?AUTO_7695 ?AUTO_7694 ) ( IN-TRUCK ?AUTO_7693 ?AUTO_7697 ) ( TRUCK-AT ?AUTO_7697 ?AUTO_7698 ) ( IN-CITY ?AUTO_7698 ?AUTO_7699 ) ( IN-CITY ?AUTO_7696 ?AUTO_7699 ) ( not ( = ?AUTO_7696 ?AUTO_7698 ) ) ( not ( = ?AUTO_7694 ?AUTO_7698 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7697 ?AUTO_7698 ?AUTO_7696 ?AUTO_7699 )
      ( DELIVER-PKG ?AUTO_7693 ?AUTO_7694 )
      ( DELIVER-PKG-VERIFY ?AUTO_7693 ?AUTO_7694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7700 - OBJ
      ?AUTO_7701 - LOCATION
    )
    :vars
    (
      ?AUTO_7702 - LOCATION
      ?AUTO_7706 - TRUCK
      ?AUTO_7705 - LOCATION
      ?AUTO_7704 - CITY
      ?AUTO_7707 - LOCATION
      ?AUTO_7703 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7702 ) ( AIRPORT ?AUTO_7701 ) ( not ( = ?AUTO_7702 ?AUTO_7701 ) ) ( IN-TRUCK ?AUTO_7700 ?AUTO_7706 ) ( TRUCK-AT ?AUTO_7706 ?AUTO_7705 ) ( IN-CITY ?AUTO_7705 ?AUTO_7704 ) ( IN-CITY ?AUTO_7702 ?AUTO_7704 ) ( not ( = ?AUTO_7702 ?AUTO_7705 ) ) ( not ( = ?AUTO_7701 ?AUTO_7705 ) ) ( AIRPORT ?AUTO_7707 ) ( AIRPLANE-AT ?AUTO_7703 ?AUTO_7707 ) ( not ( = ?AUTO_7707 ?AUTO_7701 ) ) ( not ( = ?AUTO_7702 ?AUTO_7707 ) ) ( not ( = ?AUTO_7705 ?AUTO_7707 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7703 ?AUTO_7707 ?AUTO_7701 )
      ( DELIVER-PKG ?AUTO_7700 ?AUTO_7701 )
      ( DELIVER-PKG-VERIFY ?AUTO_7700 ?AUTO_7701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7720 - OBJ
      ?AUTO_7721 - LOCATION
    )
    :vars
    (
      ?AUTO_7725 - LOCATION
      ?AUTO_7723 - TRUCK
      ?AUTO_7726 - LOCATION
      ?AUTO_7724 - CITY
      ?AUTO_7727 - LOCATION
      ?AUTO_7722 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7725 ) ( AIRPORT ?AUTO_7721 ) ( not ( = ?AUTO_7725 ?AUTO_7721 ) ) ( TRUCK-AT ?AUTO_7723 ?AUTO_7726 ) ( IN-CITY ?AUTO_7726 ?AUTO_7724 ) ( IN-CITY ?AUTO_7725 ?AUTO_7724 ) ( not ( = ?AUTO_7725 ?AUTO_7726 ) ) ( not ( = ?AUTO_7721 ?AUTO_7726 ) ) ( AIRPORT ?AUTO_7727 ) ( AIRPLANE-AT ?AUTO_7722 ?AUTO_7727 ) ( not ( = ?AUTO_7727 ?AUTO_7721 ) ) ( not ( = ?AUTO_7725 ?AUTO_7727 ) ) ( not ( = ?AUTO_7726 ?AUTO_7727 ) ) ( OBJ-AT ?AUTO_7720 ?AUTO_7726 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7720 ?AUTO_7723 ?AUTO_7726 )
      ( DELIVER-PKG ?AUTO_7720 ?AUTO_7721 )
      ( DELIVER-PKG-VERIFY ?AUTO_7720 ?AUTO_7721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7730 - OBJ
      ?AUTO_7731 - LOCATION
    )
    :vars
    (
      ?AUTO_7732 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7732 ?AUTO_7731 ) ( IN-TRUCK ?AUTO_7730 ?AUTO_7732 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7730 ?AUTO_7732 ?AUTO_7731 )
      ( DELIVER-PKG-VERIFY ?AUTO_7730 ?AUTO_7731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7735 - OBJ
      ?AUTO_7736 - LOCATION
    )
    :vars
    (
      ?AUTO_7737 - TRUCK
      ?AUTO_7738 - LOCATION
      ?AUTO_7739 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7735 ?AUTO_7737 ) ( TRUCK-AT ?AUTO_7737 ?AUTO_7738 ) ( IN-CITY ?AUTO_7738 ?AUTO_7739 ) ( IN-CITY ?AUTO_7736 ?AUTO_7739 ) ( not ( = ?AUTO_7736 ?AUTO_7738 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7737 ?AUTO_7738 ?AUTO_7736 ?AUTO_7739 )
      ( DELIVER-PKG ?AUTO_7735 ?AUTO_7736 )
      ( DELIVER-PKG-VERIFY ?AUTO_7735 ?AUTO_7736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7740 - OBJ
      ?AUTO_7741 - LOCATION
    )
    :vars
    (
      ?AUTO_7742 - TRUCK
      ?AUTO_7743 - LOCATION
      ?AUTO_7744 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7742 ?AUTO_7743 ) ( IN-CITY ?AUTO_7743 ?AUTO_7744 ) ( IN-CITY ?AUTO_7741 ?AUTO_7744 ) ( not ( = ?AUTO_7741 ?AUTO_7743 ) ) ( OBJ-AT ?AUTO_7740 ?AUTO_7743 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7740 ?AUTO_7742 ?AUTO_7743 )
      ( DELIVER-PKG ?AUTO_7740 ?AUTO_7741 )
      ( DELIVER-PKG-VERIFY ?AUTO_7740 ?AUTO_7741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7745 - OBJ
      ?AUTO_7746 - LOCATION
    )
    :vars
    (
      ?AUTO_7748 - TRUCK
      ?AUTO_7747 - LOCATION
      ?AUTO_7749 - CITY
      ?AUTO_7750 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7748 ?AUTO_7747 ) ( IN-CITY ?AUTO_7747 ?AUTO_7749 ) ( IN-CITY ?AUTO_7746 ?AUTO_7749 ) ( not ( = ?AUTO_7746 ?AUTO_7747 ) ) ( IN-AIRPLANE ?AUTO_7745 ?AUTO_7750 ) ( AIRPLANE-AT ?AUTO_7750 ?AUTO_7747 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7745 ?AUTO_7750 ?AUTO_7747 )
      ( DELIVER-PKG ?AUTO_7745 ?AUTO_7746 )
      ( DELIVER-PKG-VERIFY ?AUTO_7745 ?AUTO_7746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7751 - OBJ
      ?AUTO_7752 - LOCATION
    )
    :vars
    (
      ?AUTO_7753 - TRUCK
      ?AUTO_7755 - LOCATION
      ?AUTO_7754 - CITY
      ?AUTO_7756 - AIRPLANE
      ?AUTO_7757 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7753 ?AUTO_7755 ) ( IN-CITY ?AUTO_7755 ?AUTO_7754 ) ( IN-CITY ?AUTO_7752 ?AUTO_7754 ) ( not ( = ?AUTO_7752 ?AUTO_7755 ) ) ( IN-AIRPLANE ?AUTO_7751 ?AUTO_7756 ) ( AIRPORT ?AUTO_7757 ) ( AIRPORT ?AUTO_7755 ) ( AIRPLANE-AT ?AUTO_7756 ?AUTO_7757 ) ( not ( = ?AUTO_7757 ?AUTO_7755 ) ) ( not ( = ?AUTO_7752 ?AUTO_7757 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7756 ?AUTO_7757 ?AUTO_7755 )
      ( DELIVER-PKG ?AUTO_7751 ?AUTO_7752 )
      ( DELIVER-PKG-VERIFY ?AUTO_7751 ?AUTO_7752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7766 - OBJ
      ?AUTO_7767 - LOCATION
    )
    :vars
    (
      ?AUTO_7769 - TRUCK
      ?AUTO_7770 - LOCATION
      ?AUTO_7771 - CITY
      ?AUTO_7768 - LOCATION
      ?AUTO_7772 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7769 ?AUTO_7770 ) ( IN-CITY ?AUTO_7770 ?AUTO_7771 ) ( IN-CITY ?AUTO_7767 ?AUTO_7771 ) ( not ( = ?AUTO_7767 ?AUTO_7770 ) ) ( AIRPORT ?AUTO_7768 ) ( AIRPORT ?AUTO_7770 ) ( AIRPLANE-AT ?AUTO_7772 ?AUTO_7768 ) ( not ( = ?AUTO_7768 ?AUTO_7770 ) ) ( not ( = ?AUTO_7767 ?AUTO_7768 ) ) ( OBJ-AT ?AUTO_7766 ?AUTO_7768 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7766 ?AUTO_7772 ?AUTO_7768 )
      ( DELIVER-PKG ?AUTO_7766 ?AUTO_7767 )
      ( DELIVER-PKG-VERIFY ?AUTO_7766 ?AUTO_7767 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7773 - OBJ
      ?AUTO_7774 - LOCATION
    )
    :vars
    (
      ?AUTO_7775 - TRUCK
      ?AUTO_7777 - LOCATION
      ?AUTO_7778 - CITY
      ?AUTO_7776 - LOCATION
      ?AUTO_7779 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7775 ?AUTO_7777 ) ( IN-CITY ?AUTO_7777 ?AUTO_7778 ) ( IN-CITY ?AUTO_7774 ?AUTO_7778 ) ( not ( = ?AUTO_7774 ?AUTO_7777 ) ) ( AIRPORT ?AUTO_7776 ) ( AIRPORT ?AUTO_7777 ) ( not ( = ?AUTO_7776 ?AUTO_7777 ) ) ( not ( = ?AUTO_7774 ?AUTO_7776 ) ) ( OBJ-AT ?AUTO_7773 ?AUTO_7776 ) ( AIRPLANE-AT ?AUTO_7779 ?AUTO_7777 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7779 ?AUTO_7777 ?AUTO_7776 )
      ( DELIVER-PKG ?AUTO_7773 ?AUTO_7774 )
      ( DELIVER-PKG-VERIFY ?AUTO_7773 ?AUTO_7774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7784 - OBJ
      ?AUTO_7785 - LOCATION
    )
    :vars
    (
      ?AUTO_7790 - TRUCK
      ?AUTO_7788 - LOCATION
      ?AUTO_7786 - CITY
      ?AUTO_7789 - LOCATION
      ?AUTO_7787 - AIRPLANE
      ?AUTO_7791 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7790 ?AUTO_7788 ) ( IN-CITY ?AUTO_7788 ?AUTO_7786 ) ( IN-CITY ?AUTO_7785 ?AUTO_7786 ) ( not ( = ?AUTO_7785 ?AUTO_7788 ) ) ( AIRPORT ?AUTO_7789 ) ( AIRPORT ?AUTO_7788 ) ( not ( = ?AUTO_7789 ?AUTO_7788 ) ) ( not ( = ?AUTO_7785 ?AUTO_7789 ) ) ( AIRPLANE-AT ?AUTO_7787 ?AUTO_7788 ) ( TRUCK-AT ?AUTO_7791 ?AUTO_7789 ) ( IN-TRUCK ?AUTO_7784 ?AUTO_7791 ) ( not ( = ?AUTO_7790 ?AUTO_7791 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7784 ?AUTO_7791 ?AUTO_7789 )
      ( DELIVER-PKG ?AUTO_7784 ?AUTO_7785 )
      ( DELIVER-PKG-VERIFY ?AUTO_7784 ?AUTO_7785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7792 - OBJ
      ?AUTO_7793 - LOCATION
    )
    :vars
    (
      ?AUTO_7797 - TRUCK
      ?AUTO_7799 - LOCATION
      ?AUTO_7795 - CITY
      ?AUTO_7794 - LOCATION
      ?AUTO_7796 - AIRPLANE
      ?AUTO_7798 - TRUCK
      ?AUTO_7800 - LOCATION
      ?AUTO_7801 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7797 ?AUTO_7799 ) ( IN-CITY ?AUTO_7799 ?AUTO_7795 ) ( IN-CITY ?AUTO_7793 ?AUTO_7795 ) ( not ( = ?AUTO_7793 ?AUTO_7799 ) ) ( AIRPORT ?AUTO_7794 ) ( AIRPORT ?AUTO_7799 ) ( not ( = ?AUTO_7794 ?AUTO_7799 ) ) ( not ( = ?AUTO_7793 ?AUTO_7794 ) ) ( AIRPLANE-AT ?AUTO_7796 ?AUTO_7799 ) ( IN-TRUCK ?AUTO_7792 ?AUTO_7798 ) ( not ( = ?AUTO_7797 ?AUTO_7798 ) ) ( TRUCK-AT ?AUTO_7798 ?AUTO_7800 ) ( IN-CITY ?AUTO_7800 ?AUTO_7801 ) ( IN-CITY ?AUTO_7794 ?AUTO_7801 ) ( not ( = ?AUTO_7794 ?AUTO_7800 ) ) ( not ( = ?AUTO_7793 ?AUTO_7800 ) ) ( not ( = ?AUTO_7799 ?AUTO_7800 ) ) ( not ( = ?AUTO_7795 ?AUTO_7801 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7798 ?AUTO_7800 ?AUTO_7794 ?AUTO_7801 )
      ( DELIVER-PKG ?AUTO_7792 ?AUTO_7793 )
      ( DELIVER-PKG-VERIFY ?AUTO_7792 ?AUTO_7793 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7802 - OBJ
      ?AUTO_7803 - LOCATION
    )
    :vars
    (
      ?AUTO_7808 - TRUCK
      ?AUTO_7805 - LOCATION
      ?AUTO_7806 - CITY
      ?AUTO_7804 - LOCATION
      ?AUTO_7807 - TRUCK
      ?AUTO_7811 - LOCATION
      ?AUTO_7810 - CITY
      ?AUTO_7812 - LOCATION
      ?AUTO_7809 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7808 ?AUTO_7805 ) ( IN-CITY ?AUTO_7805 ?AUTO_7806 ) ( IN-CITY ?AUTO_7803 ?AUTO_7806 ) ( not ( = ?AUTO_7803 ?AUTO_7805 ) ) ( AIRPORT ?AUTO_7804 ) ( AIRPORT ?AUTO_7805 ) ( not ( = ?AUTO_7804 ?AUTO_7805 ) ) ( not ( = ?AUTO_7803 ?AUTO_7804 ) ) ( IN-TRUCK ?AUTO_7802 ?AUTO_7807 ) ( not ( = ?AUTO_7808 ?AUTO_7807 ) ) ( TRUCK-AT ?AUTO_7807 ?AUTO_7811 ) ( IN-CITY ?AUTO_7811 ?AUTO_7810 ) ( IN-CITY ?AUTO_7804 ?AUTO_7810 ) ( not ( = ?AUTO_7804 ?AUTO_7811 ) ) ( not ( = ?AUTO_7803 ?AUTO_7811 ) ) ( not ( = ?AUTO_7805 ?AUTO_7811 ) ) ( not ( = ?AUTO_7806 ?AUTO_7810 ) ) ( AIRPORT ?AUTO_7812 ) ( AIRPLANE-AT ?AUTO_7809 ?AUTO_7812 ) ( not ( = ?AUTO_7812 ?AUTO_7805 ) ) ( not ( = ?AUTO_7803 ?AUTO_7812 ) ) ( not ( = ?AUTO_7804 ?AUTO_7812 ) ) ( not ( = ?AUTO_7811 ?AUTO_7812 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7809 ?AUTO_7812 ?AUTO_7805 )
      ( DELIVER-PKG ?AUTO_7802 ?AUTO_7803 )
      ( DELIVER-PKG-VERIFY ?AUTO_7802 ?AUTO_7803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7825 - OBJ
      ?AUTO_7826 - LOCATION
    )
    :vars
    (
      ?AUTO_7835 - TRUCK
      ?AUTO_7827 - LOCATION
      ?AUTO_7830 - CITY
      ?AUTO_7829 - LOCATION
      ?AUTO_7833 - TRUCK
      ?AUTO_7832 - LOCATION
      ?AUTO_7831 - CITY
      ?AUTO_7828 - LOCATION
      ?AUTO_7834 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7835 ?AUTO_7827 ) ( IN-CITY ?AUTO_7827 ?AUTO_7830 ) ( IN-CITY ?AUTO_7826 ?AUTO_7830 ) ( not ( = ?AUTO_7826 ?AUTO_7827 ) ) ( AIRPORT ?AUTO_7829 ) ( AIRPORT ?AUTO_7827 ) ( not ( = ?AUTO_7829 ?AUTO_7827 ) ) ( not ( = ?AUTO_7826 ?AUTO_7829 ) ) ( not ( = ?AUTO_7835 ?AUTO_7833 ) ) ( TRUCK-AT ?AUTO_7833 ?AUTO_7832 ) ( IN-CITY ?AUTO_7832 ?AUTO_7831 ) ( IN-CITY ?AUTO_7829 ?AUTO_7831 ) ( not ( = ?AUTO_7829 ?AUTO_7832 ) ) ( not ( = ?AUTO_7826 ?AUTO_7832 ) ) ( not ( = ?AUTO_7827 ?AUTO_7832 ) ) ( not ( = ?AUTO_7830 ?AUTO_7831 ) ) ( AIRPORT ?AUTO_7828 ) ( AIRPLANE-AT ?AUTO_7834 ?AUTO_7828 ) ( not ( = ?AUTO_7828 ?AUTO_7827 ) ) ( not ( = ?AUTO_7826 ?AUTO_7828 ) ) ( not ( = ?AUTO_7829 ?AUTO_7828 ) ) ( not ( = ?AUTO_7832 ?AUTO_7828 ) ) ( OBJ-AT ?AUTO_7825 ?AUTO_7832 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7825 ?AUTO_7833 ?AUTO_7832 )
      ( DELIVER-PKG ?AUTO_7825 ?AUTO_7826 )
      ( DELIVER-PKG-VERIFY ?AUTO_7825 ?AUTO_7826 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7838 - OBJ
      ?AUTO_7839 - LOCATION
    )
    :vars
    (
      ?AUTO_7840 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7840 ?AUTO_7839 ) ( IN-TRUCK ?AUTO_7838 ?AUTO_7840 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7838 ?AUTO_7840 ?AUTO_7839 )
      ( DELIVER-PKG-VERIFY ?AUTO_7838 ?AUTO_7839 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7841 - OBJ
      ?AUTO_7842 - LOCATION
    )
    :vars
    (
      ?AUTO_7843 - TRUCK
      ?AUTO_7844 - LOCATION
      ?AUTO_7845 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7841 ?AUTO_7843 ) ( TRUCK-AT ?AUTO_7843 ?AUTO_7844 ) ( IN-CITY ?AUTO_7844 ?AUTO_7845 ) ( IN-CITY ?AUTO_7842 ?AUTO_7845 ) ( not ( = ?AUTO_7842 ?AUTO_7844 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7843 ?AUTO_7844 ?AUTO_7842 ?AUTO_7845 )
      ( DELIVER-PKG ?AUTO_7841 ?AUTO_7842 )
      ( DELIVER-PKG-VERIFY ?AUTO_7841 ?AUTO_7842 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7896 - OBJ
      ?AUTO_7897 - LOCATION
    )
    :vars
    (
      ?AUTO_7898 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7898 ?AUTO_7897 ) ( IN-TRUCK ?AUTO_7896 ?AUTO_7898 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7896 ?AUTO_7898 ?AUTO_7897 )
      ( DELIVER-PKG-VERIFY ?AUTO_7896 ?AUTO_7897 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7933 - OBJ
      ?AUTO_7934 - LOCATION
    )
    :vars
    (
      ?AUTO_7935 - LOCATION
      ?AUTO_7937 - CITY
      ?AUTO_7938 - AIRPLANE
      ?AUTO_7939 - LOCATION
      ?AUTO_7936 - TRUCK
      ?AUTO_7940 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7935 ?AUTO_7937 ) ( IN-CITY ?AUTO_7934 ?AUTO_7937 ) ( not ( = ?AUTO_7934 ?AUTO_7935 ) ) ( IN-AIRPLANE ?AUTO_7933 ?AUTO_7938 ) ( AIRPORT ?AUTO_7939 ) ( AIRPORT ?AUTO_7935 ) ( AIRPLANE-AT ?AUTO_7938 ?AUTO_7939 ) ( not ( = ?AUTO_7939 ?AUTO_7935 ) ) ( not ( = ?AUTO_7934 ?AUTO_7939 ) ) ( TRUCK-AT ?AUTO_7936 ?AUTO_7940 ) ( IN-CITY ?AUTO_7940 ?AUTO_7937 ) ( not ( = ?AUTO_7935 ?AUTO_7940 ) ) ( not ( = ?AUTO_7934 ?AUTO_7940 ) ) ( not ( = ?AUTO_7939 ?AUTO_7940 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7936 ?AUTO_7940 ?AUTO_7935 ?AUTO_7937 )
      ( DELIVER-PKG ?AUTO_7933 ?AUTO_7934 )
      ( DELIVER-PKG-VERIFY ?AUTO_7933 ?AUTO_7934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7949 - OBJ
      ?AUTO_7950 - LOCATION
    )
    :vars
    (
      ?AUTO_7952 - LOCATION
      ?AUTO_7951 - CITY
      ?AUTO_7955 - LOCATION
      ?AUTO_7956 - AIRPLANE
      ?AUTO_7953 - TRUCK
      ?AUTO_7954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7952 ?AUTO_7951 ) ( IN-CITY ?AUTO_7950 ?AUTO_7951 ) ( not ( = ?AUTO_7950 ?AUTO_7952 ) ) ( AIRPORT ?AUTO_7955 ) ( AIRPORT ?AUTO_7952 ) ( AIRPLANE-AT ?AUTO_7956 ?AUTO_7955 ) ( not ( = ?AUTO_7955 ?AUTO_7952 ) ) ( not ( = ?AUTO_7950 ?AUTO_7955 ) ) ( TRUCK-AT ?AUTO_7953 ?AUTO_7954 ) ( IN-CITY ?AUTO_7954 ?AUTO_7951 ) ( not ( = ?AUTO_7952 ?AUTO_7954 ) ) ( not ( = ?AUTO_7950 ?AUTO_7954 ) ) ( not ( = ?AUTO_7955 ?AUTO_7954 ) ) ( OBJ-AT ?AUTO_7949 ?AUTO_7955 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7949 ?AUTO_7956 ?AUTO_7955 )
      ( DELIVER-PKG ?AUTO_7949 ?AUTO_7950 )
      ( DELIVER-PKG-VERIFY ?AUTO_7949 ?AUTO_7950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7957 - OBJ
      ?AUTO_7958 - LOCATION
    )
    :vars
    (
      ?AUTO_7962 - LOCATION
      ?AUTO_7961 - CITY
      ?AUTO_7963 - LOCATION
      ?AUTO_7960 - TRUCK
      ?AUTO_7959 - LOCATION
      ?AUTO_7965 - LOCATION
      ?AUTO_7964 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7962 ?AUTO_7961 ) ( IN-CITY ?AUTO_7958 ?AUTO_7961 ) ( not ( = ?AUTO_7958 ?AUTO_7962 ) ) ( AIRPORT ?AUTO_7963 ) ( AIRPORT ?AUTO_7962 ) ( not ( = ?AUTO_7963 ?AUTO_7962 ) ) ( not ( = ?AUTO_7958 ?AUTO_7963 ) ) ( TRUCK-AT ?AUTO_7960 ?AUTO_7959 ) ( IN-CITY ?AUTO_7959 ?AUTO_7961 ) ( not ( = ?AUTO_7962 ?AUTO_7959 ) ) ( not ( = ?AUTO_7958 ?AUTO_7959 ) ) ( not ( = ?AUTO_7963 ?AUTO_7959 ) ) ( OBJ-AT ?AUTO_7957 ?AUTO_7963 ) ( AIRPORT ?AUTO_7965 ) ( AIRPLANE-AT ?AUTO_7964 ?AUTO_7965 ) ( not ( = ?AUTO_7965 ?AUTO_7963 ) ) ( not ( = ?AUTO_7958 ?AUTO_7965 ) ) ( not ( = ?AUTO_7962 ?AUTO_7965 ) ) ( not ( = ?AUTO_7959 ?AUTO_7965 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7964 ?AUTO_7965 ?AUTO_7963 )
      ( DELIVER-PKG ?AUTO_7957 ?AUTO_7958 )
      ( DELIVER-PKG-VERIFY ?AUTO_7957 ?AUTO_7958 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7972 - OBJ
      ?AUTO_7973 - LOCATION
    )
    :vars
    (
      ?AUTO_7974 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7974 ?AUTO_7973 ) ( IN-TRUCK ?AUTO_7972 ?AUTO_7974 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7972 ?AUTO_7974 ?AUTO_7973 )
      ( DELIVER-PKG-VERIFY ?AUTO_7972 ?AUTO_7973 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8031 - OBJ
      ?AUTO_8032 - LOCATION
    )
    :vars
    (
      ?AUTO_8033 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8031 ?AUTO_8033 ) ( AIRPLANE-AT ?AUTO_8033 ?AUTO_8032 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8031 ?AUTO_8033 ?AUTO_8032 )
      ( DELIVER-PKG-VERIFY ?AUTO_8031 ?AUTO_8032 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8034 - OBJ
      ?AUTO_8035 - LOCATION
    )
    :vars
    (
      ?AUTO_8036 - AIRPLANE
      ?AUTO_8037 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8034 ?AUTO_8036 ) ( AIRPORT ?AUTO_8037 ) ( AIRPORT ?AUTO_8035 ) ( AIRPLANE-AT ?AUTO_8036 ?AUTO_8037 ) ( not ( = ?AUTO_8037 ?AUTO_8035 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8036 ?AUTO_8037 ?AUTO_8035 )
      ( DELIVER-PKG ?AUTO_8034 ?AUTO_8035 )
      ( DELIVER-PKG-VERIFY ?AUTO_8034 ?AUTO_8035 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8038 - OBJ
      ?AUTO_8039 - LOCATION
    )
    :vars
    (
      ?AUTO_8041 - LOCATION
      ?AUTO_8040 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8041 ) ( AIRPORT ?AUTO_8039 ) ( AIRPLANE-AT ?AUTO_8040 ?AUTO_8041 ) ( not ( = ?AUTO_8041 ?AUTO_8039 ) ) ( OBJ-AT ?AUTO_8038 ?AUTO_8041 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8038 ?AUTO_8040 ?AUTO_8041 )
      ( DELIVER-PKG ?AUTO_8038 ?AUTO_8039 )
      ( DELIVER-PKG-VERIFY ?AUTO_8038 ?AUTO_8039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8042 - OBJ
      ?AUTO_8043 - LOCATION
    )
    :vars
    (
      ?AUTO_8045 - LOCATION
      ?AUTO_8044 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8045 ) ( AIRPORT ?AUTO_8043 ) ( not ( = ?AUTO_8045 ?AUTO_8043 ) ) ( OBJ-AT ?AUTO_8042 ?AUTO_8045 ) ( AIRPLANE-AT ?AUTO_8044 ?AUTO_8043 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8044 ?AUTO_8043 ?AUTO_8045 )
      ( DELIVER-PKG ?AUTO_8042 ?AUTO_8043 )
      ( DELIVER-PKG-VERIFY ?AUTO_8042 ?AUTO_8043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8058 - OBJ
      ?AUTO_8059 - LOCATION
    )
    :vars
    (
      ?AUTO_8060 - LOCATION
      ?AUTO_8062 - LOCATION
      ?AUTO_8061 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8060 ) ( AIRPORT ?AUTO_8059 ) ( not ( = ?AUTO_8060 ?AUTO_8059 ) ) ( OBJ-AT ?AUTO_8058 ?AUTO_8060 ) ( AIRPORT ?AUTO_8062 ) ( AIRPLANE-AT ?AUTO_8061 ?AUTO_8062 ) ( not ( = ?AUTO_8062 ?AUTO_8059 ) ) ( not ( = ?AUTO_8060 ?AUTO_8062 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8061 ?AUTO_8062 ?AUTO_8059 )
      ( DELIVER-PKG ?AUTO_8058 ?AUTO_8059 )
      ( DELIVER-PKG-VERIFY ?AUTO_8058 ?AUTO_8059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8109 - OBJ
      ?AUTO_8110 - LOCATION
    )
    :vars
    (
      ?AUTO_8111 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8111 ?AUTO_8110 ) ( IN-TRUCK ?AUTO_8109 ?AUTO_8111 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8109 ?AUTO_8111 ?AUTO_8110 )
      ( DELIVER-PKG-VERIFY ?AUTO_8109 ?AUTO_8110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8114 - OBJ
      ?AUTO_8115 - LOCATION
    )
    :vars
    (
      ?AUTO_8116 - TRUCK
      ?AUTO_8117 - LOCATION
      ?AUTO_8118 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8114 ?AUTO_8116 ) ( TRUCK-AT ?AUTO_8116 ?AUTO_8117 ) ( IN-CITY ?AUTO_8117 ?AUTO_8118 ) ( IN-CITY ?AUTO_8115 ?AUTO_8118 ) ( not ( = ?AUTO_8115 ?AUTO_8117 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8116 ?AUTO_8117 ?AUTO_8115 ?AUTO_8118 )
      ( DELIVER-PKG ?AUTO_8114 ?AUTO_8115 )
      ( DELIVER-PKG-VERIFY ?AUTO_8114 ?AUTO_8115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8119 - OBJ
      ?AUTO_8120 - LOCATION
    )
    :vars
    (
      ?AUTO_8121 - TRUCK
      ?AUTO_8122 - LOCATION
      ?AUTO_8123 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8121 ?AUTO_8122 ) ( IN-CITY ?AUTO_8122 ?AUTO_8123 ) ( IN-CITY ?AUTO_8120 ?AUTO_8123 ) ( not ( = ?AUTO_8120 ?AUTO_8122 ) ) ( OBJ-AT ?AUTO_8119 ?AUTO_8122 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8119 ?AUTO_8121 ?AUTO_8122 )
      ( DELIVER-PKG ?AUTO_8119 ?AUTO_8120 )
      ( DELIVER-PKG-VERIFY ?AUTO_8119 ?AUTO_8120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8124 - OBJ
      ?AUTO_8125 - LOCATION
    )
    :vars
    (
      ?AUTO_8127 - TRUCK
      ?AUTO_8126 - LOCATION
      ?AUTO_8128 - CITY
      ?AUTO_8129 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8127 ?AUTO_8126 ) ( IN-CITY ?AUTO_8126 ?AUTO_8128 ) ( IN-CITY ?AUTO_8125 ?AUTO_8128 ) ( not ( = ?AUTO_8125 ?AUTO_8126 ) ) ( IN-AIRPLANE ?AUTO_8124 ?AUTO_8129 ) ( AIRPLANE-AT ?AUTO_8129 ?AUTO_8126 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8124 ?AUTO_8129 ?AUTO_8126 )
      ( DELIVER-PKG ?AUTO_8124 ?AUTO_8125 )
      ( DELIVER-PKG-VERIFY ?AUTO_8124 ?AUTO_8125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8130 - OBJ
      ?AUTO_8131 - LOCATION
    )
    :vars
    (
      ?AUTO_8132 - TRUCK
      ?AUTO_8134 - LOCATION
      ?AUTO_8133 - CITY
      ?AUTO_8135 - AIRPLANE
      ?AUTO_8136 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8132 ?AUTO_8134 ) ( IN-CITY ?AUTO_8134 ?AUTO_8133 ) ( IN-CITY ?AUTO_8131 ?AUTO_8133 ) ( not ( = ?AUTO_8131 ?AUTO_8134 ) ) ( IN-AIRPLANE ?AUTO_8130 ?AUTO_8135 ) ( AIRPORT ?AUTO_8136 ) ( AIRPORT ?AUTO_8134 ) ( AIRPLANE-AT ?AUTO_8135 ?AUTO_8136 ) ( not ( = ?AUTO_8136 ?AUTO_8134 ) ) ( not ( = ?AUTO_8131 ?AUTO_8136 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8135 ?AUTO_8136 ?AUTO_8134 )
      ( DELIVER-PKG ?AUTO_8130 ?AUTO_8131 )
      ( DELIVER-PKG-VERIFY ?AUTO_8130 ?AUTO_8131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8137 - OBJ
      ?AUTO_8138 - LOCATION
    )
    :vars
    (
      ?AUTO_8140 - TRUCK
      ?AUTO_8141 - LOCATION
      ?AUTO_8139 - CITY
      ?AUTO_8142 - LOCATION
      ?AUTO_8143 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8140 ?AUTO_8141 ) ( IN-CITY ?AUTO_8141 ?AUTO_8139 ) ( IN-CITY ?AUTO_8138 ?AUTO_8139 ) ( not ( = ?AUTO_8138 ?AUTO_8141 ) ) ( AIRPORT ?AUTO_8142 ) ( AIRPORT ?AUTO_8141 ) ( AIRPLANE-AT ?AUTO_8143 ?AUTO_8142 ) ( not ( = ?AUTO_8142 ?AUTO_8141 ) ) ( not ( = ?AUTO_8138 ?AUTO_8142 ) ) ( OBJ-AT ?AUTO_8137 ?AUTO_8142 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8137 ?AUTO_8143 ?AUTO_8142 )
      ( DELIVER-PKG ?AUTO_8137 ?AUTO_8138 )
      ( DELIVER-PKG-VERIFY ?AUTO_8137 ?AUTO_8138 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8144 - OBJ
      ?AUTO_8145 - LOCATION
    )
    :vars
    (
      ?AUTO_8149 - TRUCK
      ?AUTO_8146 - LOCATION
      ?AUTO_8150 - CITY
      ?AUTO_8147 - LOCATION
      ?AUTO_8148 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8149 ?AUTO_8146 ) ( IN-CITY ?AUTO_8146 ?AUTO_8150 ) ( IN-CITY ?AUTO_8145 ?AUTO_8150 ) ( not ( = ?AUTO_8145 ?AUTO_8146 ) ) ( AIRPORT ?AUTO_8147 ) ( AIRPORT ?AUTO_8146 ) ( not ( = ?AUTO_8147 ?AUTO_8146 ) ) ( not ( = ?AUTO_8145 ?AUTO_8147 ) ) ( OBJ-AT ?AUTO_8144 ?AUTO_8147 ) ( AIRPLANE-AT ?AUTO_8148 ?AUTO_8146 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8148 ?AUTO_8146 ?AUTO_8147 )
      ( DELIVER-PKG ?AUTO_8144 ?AUTO_8145 )
      ( DELIVER-PKG-VERIFY ?AUTO_8144 ?AUTO_8145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8151 - OBJ
      ?AUTO_8152 - LOCATION
    )
    :vars
    (
      ?AUTO_8156 - LOCATION
      ?AUTO_8155 - CITY
      ?AUTO_8153 - LOCATION
      ?AUTO_8154 - AIRPLANE
      ?AUTO_8157 - TRUCK
      ?AUTO_8158 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8156 ?AUTO_8155 ) ( IN-CITY ?AUTO_8152 ?AUTO_8155 ) ( not ( = ?AUTO_8152 ?AUTO_8156 ) ) ( AIRPORT ?AUTO_8153 ) ( AIRPORT ?AUTO_8156 ) ( not ( = ?AUTO_8153 ?AUTO_8156 ) ) ( not ( = ?AUTO_8152 ?AUTO_8153 ) ) ( OBJ-AT ?AUTO_8151 ?AUTO_8153 ) ( AIRPLANE-AT ?AUTO_8154 ?AUTO_8156 ) ( TRUCK-AT ?AUTO_8157 ?AUTO_8158 ) ( IN-CITY ?AUTO_8158 ?AUTO_8155 ) ( not ( = ?AUTO_8156 ?AUTO_8158 ) ) ( not ( = ?AUTO_8152 ?AUTO_8158 ) ) ( not ( = ?AUTO_8153 ?AUTO_8158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8157 ?AUTO_8158 ?AUTO_8156 ?AUTO_8155 )
      ( DELIVER-PKG ?AUTO_8151 ?AUTO_8152 )
      ( DELIVER-PKG-VERIFY ?AUTO_8151 ?AUTO_8152 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8169 - OBJ
      ?AUTO_8170 - LOCATION
    )
    :vars
    (
      ?AUTO_8172 - TRUCK
      ?AUTO_8171 - LOCATION
      ?AUTO_8174 - CITY
      ?AUTO_8175 - LOCATION
      ?AUTO_8176 - LOCATION
      ?AUTO_8173 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8172 ?AUTO_8171 ) ( IN-CITY ?AUTO_8171 ?AUTO_8174 ) ( IN-CITY ?AUTO_8170 ?AUTO_8174 ) ( not ( = ?AUTO_8170 ?AUTO_8171 ) ) ( AIRPORT ?AUTO_8175 ) ( AIRPORT ?AUTO_8171 ) ( not ( = ?AUTO_8175 ?AUTO_8171 ) ) ( not ( = ?AUTO_8170 ?AUTO_8175 ) ) ( OBJ-AT ?AUTO_8169 ?AUTO_8175 ) ( AIRPORT ?AUTO_8176 ) ( AIRPLANE-AT ?AUTO_8173 ?AUTO_8176 ) ( not ( = ?AUTO_8176 ?AUTO_8171 ) ) ( not ( = ?AUTO_8170 ?AUTO_8176 ) ) ( not ( = ?AUTO_8175 ?AUTO_8176 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8173 ?AUTO_8176 ?AUTO_8171 )
      ( DELIVER-PKG ?AUTO_8169 ?AUTO_8170 )
      ( DELIVER-PKG-VERIFY ?AUTO_8169 ?AUTO_8170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8203 - OBJ
      ?AUTO_8204 - LOCATION
    )
    :vars
    (
      ?AUTO_8210 - LOCATION
      ?AUTO_8207 - CITY
      ?AUTO_8209 - LOCATION
      ?AUTO_8205 - LOCATION
      ?AUTO_8206 - AIRPLANE
      ?AUTO_8208 - TRUCK
      ?AUTO_8211 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8210 ?AUTO_8207 ) ( IN-CITY ?AUTO_8204 ?AUTO_8207 ) ( not ( = ?AUTO_8204 ?AUTO_8210 ) ) ( AIRPORT ?AUTO_8209 ) ( AIRPORT ?AUTO_8210 ) ( not ( = ?AUTO_8209 ?AUTO_8210 ) ) ( not ( = ?AUTO_8204 ?AUTO_8209 ) ) ( OBJ-AT ?AUTO_8203 ?AUTO_8209 ) ( AIRPORT ?AUTO_8205 ) ( AIRPLANE-AT ?AUTO_8206 ?AUTO_8205 ) ( not ( = ?AUTO_8205 ?AUTO_8210 ) ) ( not ( = ?AUTO_8204 ?AUTO_8205 ) ) ( not ( = ?AUTO_8209 ?AUTO_8205 ) ) ( TRUCK-AT ?AUTO_8208 ?AUTO_8211 ) ( IN-CITY ?AUTO_8211 ?AUTO_8207 ) ( not ( = ?AUTO_8210 ?AUTO_8211 ) ) ( not ( = ?AUTO_8204 ?AUTO_8211 ) ) ( not ( = ?AUTO_8209 ?AUTO_8211 ) ) ( not ( = ?AUTO_8205 ?AUTO_8211 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8208 ?AUTO_8211 ?AUTO_8210 ?AUTO_8207 )
      ( DELIVER-PKG ?AUTO_8203 ?AUTO_8204 )
      ( DELIVER-PKG-VERIFY ?AUTO_8203 ?AUTO_8204 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8230 - OBJ
      ?AUTO_8231 - LOCATION
    )
    :vars
    (
      ?AUTO_8232 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8232 ?AUTO_8231 ) ( IN-TRUCK ?AUTO_8230 ?AUTO_8232 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8230 ?AUTO_8232 ?AUTO_8231 )
      ( DELIVER-PKG-VERIFY ?AUTO_8230 ?AUTO_8231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8233 - OBJ
      ?AUTO_8234 - LOCATION
    )
    :vars
    (
      ?AUTO_8235 - TRUCK
      ?AUTO_8236 - LOCATION
      ?AUTO_8237 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8233 ?AUTO_8235 ) ( TRUCK-AT ?AUTO_8235 ?AUTO_8236 ) ( IN-CITY ?AUTO_8236 ?AUTO_8237 ) ( IN-CITY ?AUTO_8234 ?AUTO_8237 ) ( not ( = ?AUTO_8234 ?AUTO_8236 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8235 ?AUTO_8236 ?AUTO_8234 ?AUTO_8237 )
      ( DELIVER-PKG ?AUTO_8233 ?AUTO_8234 )
      ( DELIVER-PKG-VERIFY ?AUTO_8233 ?AUTO_8234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8240 - OBJ
      ?AUTO_8241 - LOCATION
    )
    :vars
    (
      ?AUTO_8242 - TRUCK
      ?AUTO_8244 - LOCATION
      ?AUTO_8243 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8242 ?AUTO_8244 ) ( IN-CITY ?AUTO_8244 ?AUTO_8243 ) ( IN-CITY ?AUTO_8241 ?AUTO_8243 ) ( not ( = ?AUTO_8241 ?AUTO_8244 ) ) ( OBJ-AT ?AUTO_8240 ?AUTO_8244 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8240 ?AUTO_8242 ?AUTO_8244 )
      ( DELIVER-PKG ?AUTO_8240 ?AUTO_8241 )
      ( DELIVER-PKG-VERIFY ?AUTO_8240 ?AUTO_8241 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8245 - OBJ
      ?AUTO_8246 - LOCATION
    )
    :vars
    (
      ?AUTO_8248 - LOCATION
      ?AUTO_8249 - CITY
      ?AUTO_8247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8248 ?AUTO_8249 ) ( IN-CITY ?AUTO_8246 ?AUTO_8249 ) ( not ( = ?AUTO_8246 ?AUTO_8248 ) ) ( OBJ-AT ?AUTO_8245 ?AUTO_8248 ) ( TRUCK-AT ?AUTO_8247 ?AUTO_8246 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8247 ?AUTO_8246 ?AUTO_8248 ?AUTO_8249 )
      ( DELIVER-PKG ?AUTO_8245 ?AUTO_8246 )
      ( DELIVER-PKG-VERIFY ?AUTO_8245 ?AUTO_8246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8260 - OBJ
      ?AUTO_8261 - LOCATION
    )
    :vars
    (
      ?AUTO_8262 - LOCATION
      ?AUTO_8263 - CITY
      ?AUTO_8264 - TRUCK
      ?AUTO_8265 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8262 ?AUTO_8263 ) ( IN-CITY ?AUTO_8261 ?AUTO_8263 ) ( not ( = ?AUTO_8261 ?AUTO_8262 ) ) ( OBJ-AT ?AUTO_8260 ?AUTO_8262 ) ( TRUCK-AT ?AUTO_8264 ?AUTO_8265 ) ( IN-CITY ?AUTO_8265 ?AUTO_8263 ) ( not ( = ?AUTO_8261 ?AUTO_8265 ) ) ( not ( = ?AUTO_8262 ?AUTO_8265 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8264 ?AUTO_8265 ?AUTO_8261 ?AUTO_8263 )
      ( DELIVER-PKG ?AUTO_8260 ?AUTO_8261 )
      ( DELIVER-PKG-VERIFY ?AUTO_8260 ?AUTO_8261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8324 - OBJ
      ?AUTO_8325 - LOCATION
    )
    :vars
    (
      ?AUTO_8326 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8324 ?AUTO_8326 ) ( AIRPLANE-AT ?AUTO_8326 ?AUTO_8325 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8324 ?AUTO_8326 ?AUTO_8325 )
      ( DELIVER-PKG-VERIFY ?AUTO_8324 ?AUTO_8325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8327 - OBJ
      ?AUTO_8328 - LOCATION
    )
    :vars
    (
      ?AUTO_8329 - AIRPLANE
      ?AUTO_8330 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8327 ?AUTO_8329 ) ( AIRPORT ?AUTO_8330 ) ( AIRPORT ?AUTO_8328 ) ( AIRPLANE-AT ?AUTO_8329 ?AUTO_8330 ) ( not ( = ?AUTO_8330 ?AUTO_8328 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8329 ?AUTO_8330 ?AUTO_8328 )
      ( DELIVER-PKG ?AUTO_8327 ?AUTO_8328 )
      ( DELIVER-PKG-VERIFY ?AUTO_8327 ?AUTO_8328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8331 - OBJ
      ?AUTO_8332 - LOCATION
    )
    :vars
    (
      ?AUTO_8334 - LOCATION
      ?AUTO_8333 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8334 ) ( AIRPORT ?AUTO_8332 ) ( AIRPLANE-AT ?AUTO_8333 ?AUTO_8334 ) ( not ( = ?AUTO_8334 ?AUTO_8332 ) ) ( OBJ-AT ?AUTO_8331 ?AUTO_8334 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8331 ?AUTO_8333 ?AUTO_8334 )
      ( DELIVER-PKG ?AUTO_8331 ?AUTO_8332 )
      ( DELIVER-PKG-VERIFY ?AUTO_8331 ?AUTO_8332 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8335 - OBJ
      ?AUTO_8336 - LOCATION
    )
    :vars
    (
      ?AUTO_8338 - LOCATION
      ?AUTO_8337 - AIRPLANE
      ?AUTO_8339 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8338 ) ( AIRPORT ?AUTO_8336 ) ( AIRPLANE-AT ?AUTO_8337 ?AUTO_8338 ) ( not ( = ?AUTO_8338 ?AUTO_8336 ) ) ( TRUCK-AT ?AUTO_8339 ?AUTO_8338 ) ( IN-TRUCK ?AUTO_8335 ?AUTO_8339 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8335 ?AUTO_8339 ?AUTO_8338 )
      ( DELIVER-PKG ?AUTO_8335 ?AUTO_8336 )
      ( DELIVER-PKG-VERIFY ?AUTO_8335 ?AUTO_8336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8340 - OBJ
      ?AUTO_8341 - LOCATION
    )
    :vars
    (
      ?AUTO_8342 - LOCATION
      ?AUTO_8344 - AIRPLANE
      ?AUTO_8343 - TRUCK
      ?AUTO_8345 - LOCATION
      ?AUTO_8346 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8342 ) ( AIRPORT ?AUTO_8341 ) ( AIRPLANE-AT ?AUTO_8344 ?AUTO_8342 ) ( not ( = ?AUTO_8342 ?AUTO_8341 ) ) ( IN-TRUCK ?AUTO_8340 ?AUTO_8343 ) ( TRUCK-AT ?AUTO_8343 ?AUTO_8345 ) ( IN-CITY ?AUTO_8345 ?AUTO_8346 ) ( IN-CITY ?AUTO_8342 ?AUTO_8346 ) ( not ( = ?AUTO_8342 ?AUTO_8345 ) ) ( not ( = ?AUTO_8341 ?AUTO_8345 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8343 ?AUTO_8345 ?AUTO_8342 ?AUTO_8346 )
      ( DELIVER-PKG ?AUTO_8340 ?AUTO_8341 )
      ( DELIVER-PKG-VERIFY ?AUTO_8340 ?AUTO_8341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8349 - OBJ
      ?AUTO_8350 - LOCATION
    )
    :vars
    (
      ?AUTO_8355 - LOCATION
      ?AUTO_8351 - AIRPLANE
      ?AUTO_8353 - TRUCK
      ?AUTO_8352 - LOCATION
      ?AUTO_8354 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8355 ) ( AIRPORT ?AUTO_8350 ) ( AIRPLANE-AT ?AUTO_8351 ?AUTO_8355 ) ( not ( = ?AUTO_8355 ?AUTO_8350 ) ) ( TRUCK-AT ?AUTO_8353 ?AUTO_8352 ) ( IN-CITY ?AUTO_8352 ?AUTO_8354 ) ( IN-CITY ?AUTO_8355 ?AUTO_8354 ) ( not ( = ?AUTO_8355 ?AUTO_8352 ) ) ( not ( = ?AUTO_8350 ?AUTO_8352 ) ) ( OBJ-AT ?AUTO_8349 ?AUTO_8352 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8349 ?AUTO_8353 ?AUTO_8352 )
      ( DELIVER-PKG ?AUTO_8349 ?AUTO_8350 )
      ( DELIVER-PKG-VERIFY ?AUTO_8349 ?AUTO_8350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8356 - OBJ
      ?AUTO_8357 - LOCATION
    )
    :vars
    (
      ?AUTO_8362 - LOCATION
      ?AUTO_8358 - AIRPLANE
      ?AUTO_8360 - LOCATION
      ?AUTO_8361 - CITY
      ?AUTO_8359 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8362 ) ( AIRPORT ?AUTO_8357 ) ( AIRPLANE-AT ?AUTO_8358 ?AUTO_8362 ) ( not ( = ?AUTO_8362 ?AUTO_8357 ) ) ( IN-CITY ?AUTO_8360 ?AUTO_8361 ) ( IN-CITY ?AUTO_8362 ?AUTO_8361 ) ( not ( = ?AUTO_8362 ?AUTO_8360 ) ) ( not ( = ?AUTO_8357 ?AUTO_8360 ) ) ( OBJ-AT ?AUTO_8356 ?AUTO_8360 ) ( TRUCK-AT ?AUTO_8359 ?AUTO_8362 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8359 ?AUTO_8362 ?AUTO_8360 ?AUTO_8361 )
      ( DELIVER-PKG ?AUTO_8356 ?AUTO_8357 )
      ( DELIVER-PKG-VERIFY ?AUTO_8356 ?AUTO_8357 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8367 - OBJ
      ?AUTO_8368 - LOCATION
    )
    :vars
    (
      ?AUTO_8372 - LOCATION
      ?AUTO_8373 - LOCATION
      ?AUTO_8369 - CITY
      ?AUTO_8371 - TRUCK
      ?AUTO_8370 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8372 ) ( AIRPORT ?AUTO_8368 ) ( not ( = ?AUTO_8372 ?AUTO_8368 ) ) ( IN-CITY ?AUTO_8373 ?AUTO_8369 ) ( IN-CITY ?AUTO_8372 ?AUTO_8369 ) ( not ( = ?AUTO_8372 ?AUTO_8373 ) ) ( not ( = ?AUTO_8368 ?AUTO_8373 ) ) ( OBJ-AT ?AUTO_8367 ?AUTO_8373 ) ( TRUCK-AT ?AUTO_8371 ?AUTO_8372 ) ( AIRPLANE-AT ?AUTO_8370 ?AUTO_8368 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8370 ?AUTO_8368 ?AUTO_8372 )
      ( DELIVER-PKG ?AUTO_8367 ?AUTO_8368 )
      ( DELIVER-PKG-VERIFY ?AUTO_8367 ?AUTO_8368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8378 - OBJ
      ?AUTO_8379 - LOCATION
    )
    :vars
    (
      ?AUTO_8383 - LOCATION
      ?AUTO_8384 - AIRPLANE
      ?AUTO_8381 - LOCATION
      ?AUTO_8380 - CITY
      ?AUTO_8382 - TRUCK
      ?AUTO_8385 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8383 ) ( AIRPORT ?AUTO_8379 ) ( AIRPLANE-AT ?AUTO_8384 ?AUTO_8383 ) ( not ( = ?AUTO_8383 ?AUTO_8379 ) ) ( IN-CITY ?AUTO_8381 ?AUTO_8380 ) ( IN-CITY ?AUTO_8383 ?AUTO_8380 ) ( not ( = ?AUTO_8383 ?AUTO_8381 ) ) ( not ( = ?AUTO_8379 ?AUTO_8381 ) ) ( OBJ-AT ?AUTO_8378 ?AUTO_8381 ) ( TRUCK-AT ?AUTO_8382 ?AUTO_8385 ) ( IN-CITY ?AUTO_8385 ?AUTO_8380 ) ( not ( = ?AUTO_8383 ?AUTO_8385 ) ) ( not ( = ?AUTO_8379 ?AUTO_8385 ) ) ( not ( = ?AUTO_8381 ?AUTO_8385 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8382 ?AUTO_8385 ?AUTO_8383 ?AUTO_8380 )
      ( DELIVER-PKG ?AUTO_8378 ?AUTO_8379 )
      ( DELIVER-PKG-VERIFY ?AUTO_8378 ?AUTO_8379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8396 - OBJ
      ?AUTO_8397 - LOCATION
    )
    :vars
    (
      ?AUTO_8402 - LOCATION
      ?AUTO_8401 - LOCATION
      ?AUTO_8400 - CITY
      ?AUTO_8398 - TRUCK
      ?AUTO_8403 - LOCATION
      ?AUTO_8399 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8402 ) ( AIRPORT ?AUTO_8397 ) ( not ( = ?AUTO_8402 ?AUTO_8397 ) ) ( IN-CITY ?AUTO_8401 ?AUTO_8400 ) ( IN-CITY ?AUTO_8402 ?AUTO_8400 ) ( not ( = ?AUTO_8402 ?AUTO_8401 ) ) ( not ( = ?AUTO_8397 ?AUTO_8401 ) ) ( OBJ-AT ?AUTO_8396 ?AUTO_8401 ) ( TRUCK-AT ?AUTO_8398 ?AUTO_8402 ) ( AIRPORT ?AUTO_8403 ) ( AIRPLANE-AT ?AUTO_8399 ?AUTO_8403 ) ( not ( = ?AUTO_8403 ?AUTO_8402 ) ) ( not ( = ?AUTO_8397 ?AUTO_8403 ) ) ( not ( = ?AUTO_8401 ?AUTO_8403 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8399 ?AUTO_8403 ?AUTO_8402 )
      ( DELIVER-PKG ?AUTO_8396 ?AUTO_8397 )
      ( DELIVER-PKG-VERIFY ?AUTO_8396 ?AUTO_8397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8430 - OBJ
      ?AUTO_8431 - LOCATION
    )
    :vars
    (
      ?AUTO_8433 - LOCATION
      ?AUTO_8435 - LOCATION
      ?AUTO_8432 - CITY
      ?AUTO_8436 - LOCATION
      ?AUTO_8434 - AIRPLANE
      ?AUTO_8437 - TRUCK
      ?AUTO_8438 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8433 ) ( AIRPORT ?AUTO_8431 ) ( not ( = ?AUTO_8433 ?AUTO_8431 ) ) ( IN-CITY ?AUTO_8435 ?AUTO_8432 ) ( IN-CITY ?AUTO_8433 ?AUTO_8432 ) ( not ( = ?AUTO_8433 ?AUTO_8435 ) ) ( not ( = ?AUTO_8431 ?AUTO_8435 ) ) ( OBJ-AT ?AUTO_8430 ?AUTO_8435 ) ( AIRPORT ?AUTO_8436 ) ( AIRPLANE-AT ?AUTO_8434 ?AUTO_8436 ) ( not ( = ?AUTO_8436 ?AUTO_8433 ) ) ( not ( = ?AUTO_8431 ?AUTO_8436 ) ) ( not ( = ?AUTO_8435 ?AUTO_8436 ) ) ( TRUCK-AT ?AUTO_8437 ?AUTO_8438 ) ( IN-CITY ?AUTO_8438 ?AUTO_8432 ) ( not ( = ?AUTO_8433 ?AUTO_8438 ) ) ( not ( = ?AUTO_8431 ?AUTO_8438 ) ) ( not ( = ?AUTO_8435 ?AUTO_8438 ) ) ( not ( = ?AUTO_8436 ?AUTO_8438 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8437 ?AUTO_8438 ?AUTO_8433 ?AUTO_8432 )
      ( DELIVER-PKG ?AUTO_8430 ?AUTO_8431 )
      ( DELIVER-PKG-VERIFY ?AUTO_8430 ?AUTO_8431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8441 - OBJ
      ?AUTO_8442 - LOCATION
    )
    :vars
    (
      ?AUTO_8443 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8443 ?AUTO_8442 ) ( IN-TRUCK ?AUTO_8441 ?AUTO_8443 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8441 ?AUTO_8443 ?AUTO_8442 )
      ( DELIVER-PKG-VERIFY ?AUTO_8441 ?AUTO_8442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8444 - OBJ
      ?AUTO_8445 - LOCATION
    )
    :vars
    (
      ?AUTO_8446 - TRUCK
      ?AUTO_8447 - LOCATION
      ?AUTO_8448 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8444 ?AUTO_8446 ) ( TRUCK-AT ?AUTO_8446 ?AUTO_8447 ) ( IN-CITY ?AUTO_8447 ?AUTO_8448 ) ( IN-CITY ?AUTO_8445 ?AUTO_8448 ) ( not ( = ?AUTO_8445 ?AUTO_8447 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8446 ?AUTO_8447 ?AUTO_8445 ?AUTO_8448 )
      ( DELIVER-PKG ?AUTO_8444 ?AUTO_8445 )
      ( DELIVER-PKG-VERIFY ?AUTO_8444 ?AUTO_8445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8449 - OBJ
      ?AUTO_8450 - LOCATION
    )
    :vars
    (
      ?AUTO_8451 - TRUCK
      ?AUTO_8452 - LOCATION
      ?AUTO_8453 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8451 ?AUTO_8452 ) ( IN-CITY ?AUTO_8452 ?AUTO_8453 ) ( IN-CITY ?AUTO_8450 ?AUTO_8453 ) ( not ( = ?AUTO_8450 ?AUTO_8452 ) ) ( OBJ-AT ?AUTO_8449 ?AUTO_8452 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8449 ?AUTO_8451 ?AUTO_8452 )
      ( DELIVER-PKG ?AUTO_8449 ?AUTO_8450 )
      ( DELIVER-PKG-VERIFY ?AUTO_8449 ?AUTO_8450 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8454 - OBJ
      ?AUTO_8455 - LOCATION
    )
    :vars
    (
      ?AUTO_8456 - LOCATION
      ?AUTO_8458 - CITY
      ?AUTO_8457 - TRUCK
      ?AUTO_8459 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8456 ?AUTO_8458 ) ( IN-CITY ?AUTO_8455 ?AUTO_8458 ) ( not ( = ?AUTO_8455 ?AUTO_8456 ) ) ( OBJ-AT ?AUTO_8454 ?AUTO_8456 ) ( TRUCK-AT ?AUTO_8457 ?AUTO_8459 ) ( IN-CITY ?AUTO_8459 ?AUTO_8458 ) ( not ( = ?AUTO_8456 ?AUTO_8459 ) ) ( not ( = ?AUTO_8455 ?AUTO_8459 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8457 ?AUTO_8459 ?AUTO_8456 ?AUTO_8458 )
      ( DELIVER-PKG ?AUTO_8454 ?AUTO_8455 )
      ( DELIVER-PKG-VERIFY ?AUTO_8454 ?AUTO_8455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8462 - OBJ
      ?AUTO_8463 - LOCATION
    )
    :vars
    (
      ?AUTO_8464 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8464 ?AUTO_8463 ) ( IN-TRUCK ?AUTO_8462 ?AUTO_8464 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8462 ?AUTO_8464 ?AUTO_8463 )
      ( DELIVER-PKG-VERIFY ?AUTO_8462 ?AUTO_8463 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8471 - OBJ
      ?AUTO_8472 - LOCATION
    )
    :vars
    (
      ?AUTO_8473 - TRUCK
      ?AUTO_8474 - LOCATION
      ?AUTO_8475 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8471 ?AUTO_8473 ) ( TRUCK-AT ?AUTO_8473 ?AUTO_8474 ) ( IN-CITY ?AUTO_8474 ?AUTO_8475 ) ( IN-CITY ?AUTO_8472 ?AUTO_8475 ) ( not ( = ?AUTO_8472 ?AUTO_8474 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8473 ?AUTO_8474 ?AUTO_8472 ?AUTO_8475 )
      ( DELIVER-PKG ?AUTO_8471 ?AUTO_8472 )
      ( DELIVER-PKG-VERIFY ?AUTO_8471 ?AUTO_8472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8476 - OBJ
      ?AUTO_8477 - LOCATION
    )
    :vars
    (
      ?AUTO_8478 - TRUCK
      ?AUTO_8479 - LOCATION
      ?AUTO_8480 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8478 ?AUTO_8479 ) ( IN-CITY ?AUTO_8479 ?AUTO_8480 ) ( IN-CITY ?AUTO_8477 ?AUTO_8480 ) ( not ( = ?AUTO_8477 ?AUTO_8479 ) ) ( OBJ-AT ?AUTO_8476 ?AUTO_8479 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8476 ?AUTO_8478 ?AUTO_8479 )
      ( DELIVER-PKG ?AUTO_8476 ?AUTO_8477 )
      ( DELIVER-PKG-VERIFY ?AUTO_8476 ?AUTO_8477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8497 - OBJ
      ?AUTO_8498 - LOCATION
    )
    :vars
    (
      ?AUTO_8499 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8499 ?AUTO_8498 ) ( IN-TRUCK ?AUTO_8497 ?AUTO_8499 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8497 ?AUTO_8499 ?AUTO_8498 )
      ( DELIVER-PKG-VERIFY ?AUTO_8497 ?AUTO_8498 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8500 - OBJ
      ?AUTO_8501 - LOCATION
    )
    :vars
    (
      ?AUTO_8502 - TRUCK
      ?AUTO_8503 - LOCATION
      ?AUTO_8504 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8500 ?AUTO_8502 ) ( TRUCK-AT ?AUTO_8502 ?AUTO_8503 ) ( IN-CITY ?AUTO_8503 ?AUTO_8504 ) ( IN-CITY ?AUTO_8501 ?AUTO_8504 ) ( not ( = ?AUTO_8501 ?AUTO_8503 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8502 ?AUTO_8503 ?AUTO_8501 ?AUTO_8504 )
      ( DELIVER-PKG ?AUTO_8500 ?AUTO_8501 )
      ( DELIVER-PKG-VERIFY ?AUTO_8500 ?AUTO_8501 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8505 - OBJ
      ?AUTO_8506 - LOCATION
    )
    :vars
    (
      ?AUTO_8507 - TRUCK
      ?AUTO_8508 - LOCATION
      ?AUTO_8509 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8507 ?AUTO_8508 ) ( IN-CITY ?AUTO_8508 ?AUTO_8509 ) ( IN-CITY ?AUTO_8506 ?AUTO_8509 ) ( not ( = ?AUTO_8506 ?AUTO_8508 ) ) ( OBJ-AT ?AUTO_8505 ?AUTO_8508 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8505 ?AUTO_8507 ?AUTO_8508 )
      ( DELIVER-PKG ?AUTO_8505 ?AUTO_8506 )
      ( DELIVER-PKG-VERIFY ?AUTO_8505 ?AUTO_8506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8510 - OBJ
      ?AUTO_8511 - LOCATION
    )
    :vars
    (
      ?AUTO_8512 - LOCATION
      ?AUTO_8514 - CITY
      ?AUTO_8513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8512 ?AUTO_8514 ) ( IN-CITY ?AUTO_8511 ?AUTO_8514 ) ( not ( = ?AUTO_8511 ?AUTO_8512 ) ) ( OBJ-AT ?AUTO_8510 ?AUTO_8512 ) ( TRUCK-AT ?AUTO_8513 ?AUTO_8511 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8513 ?AUTO_8511 ?AUTO_8512 ?AUTO_8514 )
      ( DELIVER-PKG ?AUTO_8510 ?AUTO_8511 )
      ( DELIVER-PKG-VERIFY ?AUTO_8510 ?AUTO_8511 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8543 - OBJ
      ?AUTO_8544 - LOCATION
    )
    :vars
    (
      ?AUTO_8545 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8543 ?AUTO_8545 ) ( AIRPLANE-AT ?AUTO_8545 ?AUTO_8544 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8543 ?AUTO_8545 ?AUTO_8544 )
      ( DELIVER-PKG-VERIFY ?AUTO_8543 ?AUTO_8544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8546 - OBJ
      ?AUTO_8547 - LOCATION
    )
    :vars
    (
      ?AUTO_8548 - AIRPLANE
      ?AUTO_8549 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8546 ?AUTO_8548 ) ( AIRPORT ?AUTO_8549 ) ( AIRPORT ?AUTO_8547 ) ( AIRPLANE-AT ?AUTO_8548 ?AUTO_8549 ) ( not ( = ?AUTO_8549 ?AUTO_8547 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8548 ?AUTO_8549 ?AUTO_8547 )
      ( DELIVER-PKG ?AUTO_8546 ?AUTO_8547 )
      ( DELIVER-PKG-VERIFY ?AUTO_8546 ?AUTO_8547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8554 - OBJ
      ?AUTO_8555 - LOCATION
    )
    :vars
    (
      ?AUTO_8556 - LOCATION
      ?AUTO_8557 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8556 ) ( AIRPORT ?AUTO_8555 ) ( AIRPLANE-AT ?AUTO_8557 ?AUTO_8556 ) ( not ( = ?AUTO_8556 ?AUTO_8555 ) ) ( OBJ-AT ?AUTO_8554 ?AUTO_8556 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8554 ?AUTO_8557 ?AUTO_8556 )
      ( DELIVER-PKG ?AUTO_8554 ?AUTO_8555 )
      ( DELIVER-PKG-VERIFY ?AUTO_8554 ?AUTO_8555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8558 - OBJ
      ?AUTO_8559 - LOCATION
    )
    :vars
    (
      ?AUTO_8560 - LOCATION
      ?AUTO_8561 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8560 ) ( AIRPORT ?AUTO_8559 ) ( not ( = ?AUTO_8560 ?AUTO_8559 ) ) ( OBJ-AT ?AUTO_8558 ?AUTO_8560 ) ( AIRPLANE-AT ?AUTO_8561 ?AUTO_8559 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8561 ?AUTO_8559 ?AUTO_8560 )
      ( DELIVER-PKG ?AUTO_8558 ?AUTO_8559 )
      ( DELIVER-PKG-VERIFY ?AUTO_8558 ?AUTO_8559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8588 - OBJ
      ?AUTO_8589 - LOCATION
    )
    :vars
    (
      ?AUTO_8591 - LOCATION
      ?AUTO_8590 - AIRPLANE
      ?AUTO_8592 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8591 ) ( AIRPORT ?AUTO_8589 ) ( not ( = ?AUTO_8591 ?AUTO_8589 ) ) ( AIRPLANE-AT ?AUTO_8590 ?AUTO_8589 ) ( TRUCK-AT ?AUTO_8592 ?AUTO_8591 ) ( IN-TRUCK ?AUTO_8588 ?AUTO_8592 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8588 ?AUTO_8592 ?AUTO_8591 )
      ( DELIVER-PKG ?AUTO_8588 ?AUTO_8589 )
      ( DELIVER-PKG-VERIFY ?AUTO_8588 ?AUTO_8589 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8593 - OBJ
      ?AUTO_8594 - LOCATION
    )
    :vars
    (
      ?AUTO_8596 - LOCATION
      ?AUTO_8595 - AIRPLANE
      ?AUTO_8597 - TRUCK
      ?AUTO_8598 - LOCATION
      ?AUTO_8599 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8596 ) ( AIRPORT ?AUTO_8594 ) ( not ( = ?AUTO_8596 ?AUTO_8594 ) ) ( AIRPLANE-AT ?AUTO_8595 ?AUTO_8594 ) ( IN-TRUCK ?AUTO_8593 ?AUTO_8597 ) ( TRUCK-AT ?AUTO_8597 ?AUTO_8598 ) ( IN-CITY ?AUTO_8598 ?AUTO_8599 ) ( IN-CITY ?AUTO_8596 ?AUTO_8599 ) ( not ( = ?AUTO_8596 ?AUTO_8598 ) ) ( not ( = ?AUTO_8594 ?AUTO_8598 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8597 ?AUTO_8598 ?AUTO_8596 ?AUTO_8599 )
      ( DELIVER-PKG ?AUTO_8593 ?AUTO_8594 )
      ( DELIVER-PKG-VERIFY ?AUTO_8593 ?AUTO_8594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8600 - OBJ
      ?AUTO_8601 - LOCATION
    )
    :vars
    (
      ?AUTO_8602 - LOCATION
      ?AUTO_8603 - AIRPLANE
      ?AUTO_8604 - TRUCK
      ?AUTO_8606 - LOCATION
      ?AUTO_8605 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8602 ) ( AIRPORT ?AUTO_8601 ) ( not ( = ?AUTO_8602 ?AUTO_8601 ) ) ( AIRPLANE-AT ?AUTO_8603 ?AUTO_8601 ) ( TRUCK-AT ?AUTO_8604 ?AUTO_8606 ) ( IN-CITY ?AUTO_8606 ?AUTO_8605 ) ( IN-CITY ?AUTO_8602 ?AUTO_8605 ) ( not ( = ?AUTO_8602 ?AUTO_8606 ) ) ( not ( = ?AUTO_8601 ?AUTO_8606 ) ) ( OBJ-AT ?AUTO_8600 ?AUTO_8606 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8600 ?AUTO_8604 ?AUTO_8606 )
      ( DELIVER-PKG ?AUTO_8600 ?AUTO_8601 )
      ( DELIVER-PKG-VERIFY ?AUTO_8600 ?AUTO_8601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8607 - OBJ
      ?AUTO_8608 - LOCATION
    )
    :vars
    (
      ?AUTO_8610 - LOCATION
      ?AUTO_8611 - AIRPLANE
      ?AUTO_8609 - LOCATION
      ?AUTO_8612 - CITY
      ?AUTO_8613 - TRUCK
      ?AUTO_8614 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8610 ) ( AIRPORT ?AUTO_8608 ) ( not ( = ?AUTO_8610 ?AUTO_8608 ) ) ( AIRPLANE-AT ?AUTO_8611 ?AUTO_8608 ) ( IN-CITY ?AUTO_8609 ?AUTO_8612 ) ( IN-CITY ?AUTO_8610 ?AUTO_8612 ) ( not ( = ?AUTO_8610 ?AUTO_8609 ) ) ( not ( = ?AUTO_8608 ?AUTO_8609 ) ) ( OBJ-AT ?AUTO_8607 ?AUTO_8609 ) ( TRUCK-AT ?AUTO_8613 ?AUTO_8614 ) ( IN-CITY ?AUTO_8614 ?AUTO_8612 ) ( not ( = ?AUTO_8609 ?AUTO_8614 ) ) ( not ( = ?AUTO_8608 ?AUTO_8614 ) ) ( not ( = ?AUTO_8610 ?AUTO_8614 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8613 ?AUTO_8614 ?AUTO_8609 ?AUTO_8612 )
      ( DELIVER-PKG ?AUTO_8607 ?AUTO_8608 )
      ( DELIVER-PKG-VERIFY ?AUTO_8607 ?AUTO_8608 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8617 - OBJ
      ?AUTO_8618 - LOCATION
    )
    :vars
    (
      ?AUTO_8619 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8617 ?AUTO_8619 ) ( AIRPLANE-AT ?AUTO_8619 ?AUTO_8618 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8617 ?AUTO_8619 ?AUTO_8618 )
      ( DELIVER-PKG-VERIFY ?AUTO_8617 ?AUTO_8618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8622 - OBJ
      ?AUTO_8623 - LOCATION
    )
    :vars
    (
      ?AUTO_8624 - AIRPLANE
      ?AUTO_8625 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8622 ?AUTO_8624 ) ( AIRPORT ?AUTO_8625 ) ( AIRPORT ?AUTO_8623 ) ( AIRPLANE-AT ?AUTO_8624 ?AUTO_8625 ) ( not ( = ?AUTO_8625 ?AUTO_8623 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8624 ?AUTO_8625 ?AUTO_8623 )
      ( DELIVER-PKG ?AUTO_8622 ?AUTO_8623 )
      ( DELIVER-PKG-VERIFY ?AUTO_8622 ?AUTO_8623 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8630 - OBJ
      ?AUTO_8631 - LOCATION
    )
    :vars
    (
      ?AUTO_8632 - LOCATION
      ?AUTO_8633 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8632 ) ( AIRPORT ?AUTO_8631 ) ( AIRPLANE-AT ?AUTO_8633 ?AUTO_8632 ) ( not ( = ?AUTO_8632 ?AUTO_8631 ) ) ( OBJ-AT ?AUTO_8630 ?AUTO_8632 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8630 ?AUTO_8633 ?AUTO_8632 )
      ( DELIVER-PKG ?AUTO_8630 ?AUTO_8631 )
      ( DELIVER-PKG-VERIFY ?AUTO_8630 ?AUTO_8631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8634 - OBJ
      ?AUTO_8635 - LOCATION
    )
    :vars
    (
      ?AUTO_8637 - LOCATION
      ?AUTO_8638 - LOCATION
      ?AUTO_8636 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8637 ) ( AIRPORT ?AUTO_8635 ) ( not ( = ?AUTO_8637 ?AUTO_8635 ) ) ( OBJ-AT ?AUTO_8634 ?AUTO_8637 ) ( AIRPORT ?AUTO_8638 ) ( AIRPLANE-AT ?AUTO_8636 ?AUTO_8638 ) ( not ( = ?AUTO_8638 ?AUTO_8637 ) ) ( not ( = ?AUTO_8635 ?AUTO_8638 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8636 ?AUTO_8638 ?AUTO_8637 )
      ( DELIVER-PKG ?AUTO_8634 ?AUTO_8635 )
      ( DELIVER-PKG-VERIFY ?AUTO_8634 ?AUTO_8635 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8679 - OBJ
      ?AUTO_8680 - LOCATION
    )
    :vars
    (
      ?AUTO_8681 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8681 ?AUTO_8680 ) ( IN-TRUCK ?AUTO_8679 ?AUTO_8681 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8679 ?AUTO_8681 ?AUTO_8680 )
      ( DELIVER-PKG-VERIFY ?AUTO_8679 ?AUTO_8680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8682 - OBJ
      ?AUTO_8683 - LOCATION
    )
    :vars
    (
      ?AUTO_8684 - TRUCK
      ?AUTO_8685 - LOCATION
      ?AUTO_8686 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8682 ?AUTO_8684 ) ( TRUCK-AT ?AUTO_8684 ?AUTO_8685 ) ( IN-CITY ?AUTO_8685 ?AUTO_8686 ) ( IN-CITY ?AUTO_8683 ?AUTO_8686 ) ( not ( = ?AUTO_8683 ?AUTO_8685 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8684 ?AUTO_8685 ?AUTO_8683 ?AUTO_8686 )
      ( DELIVER-PKG ?AUTO_8682 ?AUTO_8683 )
      ( DELIVER-PKG-VERIFY ?AUTO_8682 ?AUTO_8683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8727 - OBJ
      ?AUTO_8728 - LOCATION
    )
    :vars
    (
      ?AUTO_8730 - LOCATION
      ?AUTO_8729 - CITY
      ?AUTO_8731 - TRUCK
      ?AUTO_8732 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8730 ?AUTO_8729 ) ( IN-CITY ?AUTO_8728 ?AUTO_8729 ) ( not ( = ?AUTO_8728 ?AUTO_8730 ) ) ( OBJ-AT ?AUTO_8727 ?AUTO_8730 ) ( TRUCK-AT ?AUTO_8731 ?AUTO_8732 ) ( IN-CITY ?AUTO_8732 ?AUTO_8729 ) ( not ( = ?AUTO_8730 ?AUTO_8732 ) ) ( not ( = ?AUTO_8728 ?AUTO_8732 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8731 ?AUTO_8732 ?AUTO_8730 ?AUTO_8729 )
      ( DELIVER-PKG ?AUTO_8727 ?AUTO_8728 )
      ( DELIVER-PKG-VERIFY ?AUTO_8727 ?AUTO_8728 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8745 - OBJ
      ?AUTO_8746 - LOCATION
    )
    :vars
    (
      ?AUTO_8747 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8747 ?AUTO_8746 ) ( IN-TRUCK ?AUTO_8745 ?AUTO_8747 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8745 ?AUTO_8747 ?AUTO_8746 )
      ( DELIVER-PKG-VERIFY ?AUTO_8745 ?AUTO_8746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8784 - OBJ
      ?AUTO_8785 - LOCATION
    )
    :vars
    (
      ?AUTO_8788 - LOCATION
      ?AUTO_8787 - CITY
      ?AUTO_8786 - TRUCK
      ?AUTO_8789 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8788 ?AUTO_8787 ) ( IN-CITY ?AUTO_8785 ?AUTO_8787 ) ( not ( = ?AUTO_8785 ?AUTO_8788 ) ) ( OBJ-AT ?AUTO_8784 ?AUTO_8788 ) ( TRUCK-AT ?AUTO_8786 ?AUTO_8789 ) ( IN-CITY ?AUTO_8789 ?AUTO_8787 ) ( not ( = ?AUTO_8788 ?AUTO_8789 ) ) ( not ( = ?AUTO_8785 ?AUTO_8789 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8786 ?AUTO_8789 ?AUTO_8788 ?AUTO_8787 )
      ( DELIVER-PKG ?AUTO_8784 ?AUTO_8785 )
      ( DELIVER-PKG-VERIFY ?AUTO_8784 ?AUTO_8785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8810 - OBJ
      ?AUTO_8811 - LOCATION
    )
    :vars
    (
      ?AUTO_8812 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8812 ?AUTO_8811 ) ( IN-TRUCK ?AUTO_8810 ?AUTO_8812 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8810 ?AUTO_8812 ?AUTO_8811 )
      ( DELIVER-PKG-VERIFY ?AUTO_8810 ?AUTO_8811 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8873 - OBJ
      ?AUTO_8874 - LOCATION
    )
    :vars
    (
      ?AUTO_8875 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8875 ?AUTO_8874 ) ( IN-TRUCK ?AUTO_8873 ?AUTO_8875 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8873 ?AUTO_8875 ?AUTO_8874 )
      ( DELIVER-PKG-VERIFY ?AUTO_8873 ?AUTO_8874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8876 - OBJ
      ?AUTO_8877 - LOCATION
    )
    :vars
    (
      ?AUTO_8878 - TRUCK
      ?AUTO_8879 - LOCATION
      ?AUTO_8880 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8876 ?AUTO_8878 ) ( TRUCK-AT ?AUTO_8878 ?AUTO_8879 ) ( IN-CITY ?AUTO_8879 ?AUTO_8880 ) ( IN-CITY ?AUTO_8877 ?AUTO_8880 ) ( not ( = ?AUTO_8877 ?AUTO_8879 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8878 ?AUTO_8879 ?AUTO_8877 ?AUTO_8880 )
      ( DELIVER-PKG ?AUTO_8876 ?AUTO_8877 )
      ( DELIVER-PKG-VERIFY ?AUTO_8876 ?AUTO_8877 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8881 - OBJ
      ?AUTO_8882 - LOCATION
    )
    :vars
    (
      ?AUTO_8883 - TRUCK
      ?AUTO_8884 - LOCATION
      ?AUTO_8885 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8883 ?AUTO_8884 ) ( IN-CITY ?AUTO_8884 ?AUTO_8885 ) ( IN-CITY ?AUTO_8882 ?AUTO_8885 ) ( not ( = ?AUTO_8882 ?AUTO_8884 ) ) ( OBJ-AT ?AUTO_8881 ?AUTO_8884 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8881 ?AUTO_8883 ?AUTO_8884 )
      ( DELIVER-PKG ?AUTO_8881 ?AUTO_8882 )
      ( DELIVER-PKG-VERIFY ?AUTO_8881 ?AUTO_8882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8892 - OBJ
      ?AUTO_8893 - LOCATION
    )
    :vars
    (
      ?AUTO_8896 - LOCATION
      ?AUTO_8895 - CITY
      ?AUTO_8894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8896 ?AUTO_8895 ) ( IN-CITY ?AUTO_8893 ?AUTO_8895 ) ( not ( = ?AUTO_8893 ?AUTO_8896 ) ) ( OBJ-AT ?AUTO_8892 ?AUTO_8896 ) ( TRUCK-AT ?AUTO_8894 ?AUTO_8893 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8894 ?AUTO_8893 ?AUTO_8896 ?AUTO_8895 )
      ( DELIVER-PKG ?AUTO_8892 ?AUTO_8893 )
      ( DELIVER-PKG-VERIFY ?AUTO_8892 ?AUTO_8893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8903 - OBJ
      ?AUTO_8904 - LOCATION
    )
    :vars
    (
      ?AUTO_8907 - LOCATION
      ?AUTO_8906 - CITY
      ?AUTO_8905 - TRUCK
      ?AUTO_8908 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8907 ?AUTO_8906 ) ( IN-CITY ?AUTO_8904 ?AUTO_8906 ) ( not ( = ?AUTO_8904 ?AUTO_8907 ) ) ( TRUCK-AT ?AUTO_8905 ?AUTO_8904 ) ( IN-AIRPLANE ?AUTO_8903 ?AUTO_8908 ) ( AIRPLANE-AT ?AUTO_8908 ?AUTO_8907 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8903 ?AUTO_8908 ?AUTO_8907 )
      ( DELIVER-PKG ?AUTO_8903 ?AUTO_8904 )
      ( DELIVER-PKG-VERIFY ?AUTO_8903 ?AUTO_8904 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8909 - OBJ
      ?AUTO_8910 - LOCATION
    )
    :vars
    (
      ?AUTO_8913 - LOCATION
      ?AUTO_8911 - CITY
      ?AUTO_8912 - TRUCK
      ?AUTO_8914 - AIRPLANE
      ?AUTO_8915 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8913 ?AUTO_8911 ) ( IN-CITY ?AUTO_8910 ?AUTO_8911 ) ( not ( = ?AUTO_8910 ?AUTO_8913 ) ) ( TRUCK-AT ?AUTO_8912 ?AUTO_8910 ) ( IN-AIRPLANE ?AUTO_8909 ?AUTO_8914 ) ( AIRPORT ?AUTO_8915 ) ( AIRPORT ?AUTO_8913 ) ( AIRPLANE-AT ?AUTO_8914 ?AUTO_8915 ) ( not ( = ?AUTO_8915 ?AUTO_8913 ) ) ( not ( = ?AUTO_8910 ?AUTO_8915 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8914 ?AUTO_8915 ?AUTO_8913 )
      ( DELIVER-PKG ?AUTO_8909 ?AUTO_8910 )
      ( DELIVER-PKG-VERIFY ?AUTO_8909 ?AUTO_8910 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8920 - OBJ
      ?AUTO_8921 - LOCATION
    )
    :vars
    (
      ?AUTO_8926 - LOCATION
      ?AUTO_8922 - CITY
      ?AUTO_8923 - TRUCK
      ?AUTO_8925 - LOCATION
      ?AUTO_8924 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8926 ?AUTO_8922 ) ( IN-CITY ?AUTO_8921 ?AUTO_8922 ) ( not ( = ?AUTO_8921 ?AUTO_8926 ) ) ( TRUCK-AT ?AUTO_8923 ?AUTO_8921 ) ( AIRPORT ?AUTO_8925 ) ( AIRPORT ?AUTO_8926 ) ( AIRPLANE-AT ?AUTO_8924 ?AUTO_8925 ) ( not ( = ?AUTO_8925 ?AUTO_8926 ) ) ( not ( = ?AUTO_8921 ?AUTO_8925 ) ) ( OBJ-AT ?AUTO_8920 ?AUTO_8925 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8920 ?AUTO_8924 ?AUTO_8925 )
      ( DELIVER-PKG ?AUTO_8920 ?AUTO_8921 )
      ( DELIVER-PKG-VERIFY ?AUTO_8920 ?AUTO_8921 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8927 - OBJ
      ?AUTO_8928 - LOCATION
    )
    :vars
    (
      ?AUTO_8932 - LOCATION
      ?AUTO_8929 - CITY
      ?AUTO_8930 - TRUCK
      ?AUTO_8933 - LOCATION
      ?AUTO_8931 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8932 ?AUTO_8929 ) ( IN-CITY ?AUTO_8928 ?AUTO_8929 ) ( not ( = ?AUTO_8928 ?AUTO_8932 ) ) ( TRUCK-AT ?AUTO_8930 ?AUTO_8928 ) ( AIRPORT ?AUTO_8933 ) ( AIRPORT ?AUTO_8932 ) ( not ( = ?AUTO_8933 ?AUTO_8932 ) ) ( not ( = ?AUTO_8928 ?AUTO_8933 ) ) ( OBJ-AT ?AUTO_8927 ?AUTO_8933 ) ( AIRPLANE-AT ?AUTO_8931 ?AUTO_8932 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8931 ?AUTO_8932 ?AUTO_8933 )
      ( DELIVER-PKG ?AUTO_8927 ?AUTO_8928 )
      ( DELIVER-PKG-VERIFY ?AUTO_8927 ?AUTO_8928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8948 - OBJ
      ?AUTO_8949 - LOCATION
    )
    :vars
    (
      ?AUTO_8950 - LOCATION
      ?AUTO_8953 - CITY
      ?AUTO_8952 - LOCATION
      ?AUTO_8954 - AIRPLANE
      ?AUTO_8951 - TRUCK
      ?AUTO_8955 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8950 ?AUTO_8953 ) ( IN-CITY ?AUTO_8949 ?AUTO_8953 ) ( not ( = ?AUTO_8949 ?AUTO_8950 ) ) ( AIRPORT ?AUTO_8952 ) ( AIRPORT ?AUTO_8950 ) ( not ( = ?AUTO_8952 ?AUTO_8950 ) ) ( not ( = ?AUTO_8949 ?AUTO_8952 ) ) ( OBJ-AT ?AUTO_8948 ?AUTO_8952 ) ( AIRPLANE-AT ?AUTO_8954 ?AUTO_8950 ) ( TRUCK-AT ?AUTO_8951 ?AUTO_8955 ) ( IN-CITY ?AUTO_8955 ?AUTO_8953 ) ( not ( = ?AUTO_8949 ?AUTO_8955 ) ) ( not ( = ?AUTO_8950 ?AUTO_8955 ) ) ( not ( = ?AUTO_8952 ?AUTO_8955 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8951 ?AUTO_8955 ?AUTO_8949 ?AUTO_8953 )
      ( DELIVER-PKG ?AUTO_8948 ?AUTO_8949 )
      ( DELIVER-PKG-VERIFY ?AUTO_8948 ?AUTO_8949 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8966 - OBJ
      ?AUTO_8967 - LOCATION
    )
    :vars
    (
      ?AUTO_8971 - LOCATION
      ?AUTO_8968 - CITY
      ?AUTO_8972 - LOCATION
      ?AUTO_8973 - AIRPLANE
      ?AUTO_8970 - TRUCK
      ?AUTO_8969 - LOCATION
      ?AUTO_8974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8971 ?AUTO_8968 ) ( IN-CITY ?AUTO_8967 ?AUTO_8968 ) ( not ( = ?AUTO_8967 ?AUTO_8971 ) ) ( AIRPORT ?AUTO_8972 ) ( AIRPORT ?AUTO_8971 ) ( not ( = ?AUTO_8972 ?AUTO_8971 ) ) ( not ( = ?AUTO_8967 ?AUTO_8972 ) ) ( AIRPLANE-AT ?AUTO_8973 ?AUTO_8971 ) ( TRUCK-AT ?AUTO_8970 ?AUTO_8969 ) ( IN-CITY ?AUTO_8969 ?AUTO_8968 ) ( not ( = ?AUTO_8967 ?AUTO_8969 ) ) ( not ( = ?AUTO_8971 ?AUTO_8969 ) ) ( not ( = ?AUTO_8972 ?AUTO_8969 ) ) ( TRUCK-AT ?AUTO_8974 ?AUTO_8972 ) ( IN-TRUCK ?AUTO_8966 ?AUTO_8974 ) ( not ( = ?AUTO_8970 ?AUTO_8974 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8966 ?AUTO_8974 ?AUTO_8972 )
      ( DELIVER-PKG ?AUTO_8966 ?AUTO_8967 )
      ( DELIVER-PKG-VERIFY ?AUTO_8966 ?AUTO_8967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8975 - OBJ
      ?AUTO_8976 - LOCATION
    )
    :vars
    (
      ?AUTO_8980 - LOCATION
      ?AUTO_8978 - CITY
      ?AUTO_8981 - LOCATION
      ?AUTO_8982 - AIRPLANE
      ?AUTO_8979 - TRUCK
      ?AUTO_8977 - LOCATION
      ?AUTO_8983 - TRUCK
      ?AUTO_8984 - LOCATION
      ?AUTO_8985 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8980 ?AUTO_8978 ) ( IN-CITY ?AUTO_8976 ?AUTO_8978 ) ( not ( = ?AUTO_8976 ?AUTO_8980 ) ) ( AIRPORT ?AUTO_8981 ) ( AIRPORT ?AUTO_8980 ) ( not ( = ?AUTO_8981 ?AUTO_8980 ) ) ( not ( = ?AUTO_8976 ?AUTO_8981 ) ) ( AIRPLANE-AT ?AUTO_8982 ?AUTO_8980 ) ( TRUCK-AT ?AUTO_8979 ?AUTO_8977 ) ( IN-CITY ?AUTO_8977 ?AUTO_8978 ) ( not ( = ?AUTO_8976 ?AUTO_8977 ) ) ( not ( = ?AUTO_8980 ?AUTO_8977 ) ) ( not ( = ?AUTO_8981 ?AUTO_8977 ) ) ( IN-TRUCK ?AUTO_8975 ?AUTO_8983 ) ( not ( = ?AUTO_8979 ?AUTO_8983 ) ) ( TRUCK-AT ?AUTO_8983 ?AUTO_8984 ) ( IN-CITY ?AUTO_8984 ?AUTO_8985 ) ( IN-CITY ?AUTO_8981 ?AUTO_8985 ) ( not ( = ?AUTO_8981 ?AUTO_8984 ) ) ( not ( = ?AUTO_8976 ?AUTO_8984 ) ) ( not ( = ?AUTO_8980 ?AUTO_8984 ) ) ( not ( = ?AUTO_8978 ?AUTO_8985 ) ) ( not ( = ?AUTO_8977 ?AUTO_8984 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8983 ?AUTO_8984 ?AUTO_8981 ?AUTO_8985 )
      ( DELIVER-PKG ?AUTO_8975 ?AUTO_8976 )
      ( DELIVER-PKG-VERIFY ?AUTO_8975 ?AUTO_8976 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8986 - OBJ
      ?AUTO_8987 - LOCATION
    )
    :vars
    (
      ?AUTO_8994 - LOCATION
      ?AUTO_8988 - CITY
      ?AUTO_8990 - LOCATION
      ?AUTO_8995 - AIRPLANE
      ?AUTO_8993 - TRUCK
      ?AUTO_8989 - LOCATION
      ?AUTO_8996 - TRUCK
      ?AUTO_8992 - LOCATION
      ?AUTO_8991 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8994 ?AUTO_8988 ) ( IN-CITY ?AUTO_8987 ?AUTO_8988 ) ( not ( = ?AUTO_8987 ?AUTO_8994 ) ) ( AIRPORT ?AUTO_8990 ) ( AIRPORT ?AUTO_8994 ) ( not ( = ?AUTO_8990 ?AUTO_8994 ) ) ( not ( = ?AUTO_8987 ?AUTO_8990 ) ) ( AIRPLANE-AT ?AUTO_8995 ?AUTO_8994 ) ( TRUCK-AT ?AUTO_8993 ?AUTO_8989 ) ( IN-CITY ?AUTO_8989 ?AUTO_8988 ) ( not ( = ?AUTO_8987 ?AUTO_8989 ) ) ( not ( = ?AUTO_8994 ?AUTO_8989 ) ) ( not ( = ?AUTO_8990 ?AUTO_8989 ) ) ( not ( = ?AUTO_8993 ?AUTO_8996 ) ) ( TRUCK-AT ?AUTO_8996 ?AUTO_8992 ) ( IN-CITY ?AUTO_8992 ?AUTO_8991 ) ( IN-CITY ?AUTO_8990 ?AUTO_8991 ) ( not ( = ?AUTO_8990 ?AUTO_8992 ) ) ( not ( = ?AUTO_8987 ?AUTO_8992 ) ) ( not ( = ?AUTO_8994 ?AUTO_8992 ) ) ( not ( = ?AUTO_8988 ?AUTO_8991 ) ) ( not ( = ?AUTO_8989 ?AUTO_8992 ) ) ( OBJ-AT ?AUTO_8986 ?AUTO_8992 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8986 ?AUTO_8996 ?AUTO_8992 )
      ( DELIVER-PKG ?AUTO_8986 ?AUTO_8987 )
      ( DELIVER-PKG-VERIFY ?AUTO_8986 ?AUTO_8987 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8997 - OBJ
      ?AUTO_8998 - LOCATION
    )
    :vars
    (
      ?AUTO_9007 - LOCATION
      ?AUTO_9005 - CITY
      ?AUTO_9001 - LOCATION
      ?AUTO_9002 - AIRPLANE
      ?AUTO_9003 - TRUCK
      ?AUTO_8999 - LOCATION
      ?AUTO_9006 - TRUCK
      ?AUTO_9004 - LOCATION
      ?AUTO_9000 - CITY
      ?AUTO_9008 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9007 ?AUTO_9005 ) ( IN-CITY ?AUTO_8998 ?AUTO_9005 ) ( not ( = ?AUTO_8998 ?AUTO_9007 ) ) ( AIRPORT ?AUTO_9001 ) ( AIRPORT ?AUTO_9007 ) ( not ( = ?AUTO_9001 ?AUTO_9007 ) ) ( not ( = ?AUTO_8998 ?AUTO_9001 ) ) ( AIRPLANE-AT ?AUTO_9002 ?AUTO_9007 ) ( TRUCK-AT ?AUTO_9003 ?AUTO_8999 ) ( IN-CITY ?AUTO_8999 ?AUTO_9005 ) ( not ( = ?AUTO_8998 ?AUTO_8999 ) ) ( not ( = ?AUTO_9007 ?AUTO_8999 ) ) ( not ( = ?AUTO_9001 ?AUTO_8999 ) ) ( not ( = ?AUTO_9003 ?AUTO_9006 ) ) ( IN-CITY ?AUTO_9004 ?AUTO_9000 ) ( IN-CITY ?AUTO_9001 ?AUTO_9000 ) ( not ( = ?AUTO_9001 ?AUTO_9004 ) ) ( not ( = ?AUTO_8998 ?AUTO_9004 ) ) ( not ( = ?AUTO_9007 ?AUTO_9004 ) ) ( not ( = ?AUTO_9005 ?AUTO_9000 ) ) ( not ( = ?AUTO_8999 ?AUTO_9004 ) ) ( OBJ-AT ?AUTO_8997 ?AUTO_9004 ) ( TRUCK-AT ?AUTO_9006 ?AUTO_9008 ) ( IN-CITY ?AUTO_9008 ?AUTO_9000 ) ( not ( = ?AUTO_9004 ?AUTO_9008 ) ) ( not ( = ?AUTO_8998 ?AUTO_9008 ) ) ( not ( = ?AUTO_9007 ?AUTO_9008 ) ) ( not ( = ?AUTO_9001 ?AUTO_9008 ) ) ( not ( = ?AUTO_8999 ?AUTO_9008 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9006 ?AUTO_9008 ?AUTO_9004 ?AUTO_9000 )
      ( DELIVER-PKG ?AUTO_8997 ?AUTO_8998 )
      ( DELIVER-PKG-VERIFY ?AUTO_8997 ?AUTO_8998 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9011 - OBJ
      ?AUTO_9012 - LOCATION
    )
    :vars
    (
      ?AUTO_9013 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9011 ?AUTO_9013 ) ( AIRPLANE-AT ?AUTO_9013 ?AUTO_9012 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9011 ?AUTO_9013 ?AUTO_9012 )
      ( DELIVER-PKG-VERIFY ?AUTO_9011 ?AUTO_9012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9014 - OBJ
      ?AUTO_9015 - LOCATION
    )
    :vars
    (
      ?AUTO_9016 - AIRPLANE
      ?AUTO_9017 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9014 ?AUTO_9016 ) ( AIRPORT ?AUTO_9017 ) ( AIRPORT ?AUTO_9015 ) ( AIRPLANE-AT ?AUTO_9016 ?AUTO_9017 ) ( not ( = ?AUTO_9017 ?AUTO_9015 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9016 ?AUTO_9017 ?AUTO_9015 )
      ( DELIVER-PKG ?AUTO_9014 ?AUTO_9015 )
      ( DELIVER-PKG-VERIFY ?AUTO_9014 ?AUTO_9015 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9018 - OBJ
      ?AUTO_9019 - LOCATION
    )
    :vars
    (
      ?AUTO_9021 - LOCATION
      ?AUTO_9020 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9021 ) ( AIRPORT ?AUTO_9019 ) ( AIRPLANE-AT ?AUTO_9020 ?AUTO_9021 ) ( not ( = ?AUTO_9021 ?AUTO_9019 ) ) ( OBJ-AT ?AUTO_9018 ?AUTO_9021 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9018 ?AUTO_9020 ?AUTO_9021 )
      ( DELIVER-PKG ?AUTO_9018 ?AUTO_9019 )
      ( DELIVER-PKG-VERIFY ?AUTO_9018 ?AUTO_9019 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9022 - OBJ
      ?AUTO_9023 - LOCATION
    )
    :vars
    (
      ?AUTO_9025 - LOCATION
      ?AUTO_9024 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9025 ) ( AIRPORT ?AUTO_9023 ) ( not ( = ?AUTO_9025 ?AUTO_9023 ) ) ( OBJ-AT ?AUTO_9022 ?AUTO_9025 ) ( AIRPLANE-AT ?AUTO_9024 ?AUTO_9023 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9024 ?AUTO_9023 ?AUTO_9025 )
      ( DELIVER-PKG ?AUTO_9022 ?AUTO_9023 )
      ( DELIVER-PKG-VERIFY ?AUTO_9022 ?AUTO_9023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9038 - OBJ
      ?AUTO_9039 - LOCATION
    )
    :vars
    (
      ?AUTO_9040 - LOCATION
      ?AUTO_9041 - AIRPLANE
      ?AUTO_9042 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9040 ) ( AIRPORT ?AUTO_9039 ) ( not ( = ?AUTO_9040 ?AUTO_9039 ) ) ( AIRPLANE-AT ?AUTO_9041 ?AUTO_9039 ) ( TRUCK-AT ?AUTO_9042 ?AUTO_9040 ) ( IN-TRUCK ?AUTO_9038 ?AUTO_9042 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9038 ?AUTO_9042 ?AUTO_9040 )
      ( DELIVER-PKG ?AUTO_9038 ?AUTO_9039 )
      ( DELIVER-PKG-VERIFY ?AUTO_9038 ?AUTO_9039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9043 - OBJ
      ?AUTO_9044 - LOCATION
    )
    :vars
    (
      ?AUTO_9045 - LOCATION
      ?AUTO_9046 - AIRPLANE
      ?AUTO_9047 - TRUCK
      ?AUTO_9048 - LOCATION
      ?AUTO_9049 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9045 ) ( AIRPORT ?AUTO_9044 ) ( not ( = ?AUTO_9045 ?AUTO_9044 ) ) ( AIRPLANE-AT ?AUTO_9046 ?AUTO_9044 ) ( IN-TRUCK ?AUTO_9043 ?AUTO_9047 ) ( TRUCK-AT ?AUTO_9047 ?AUTO_9048 ) ( IN-CITY ?AUTO_9048 ?AUTO_9049 ) ( IN-CITY ?AUTO_9045 ?AUTO_9049 ) ( not ( = ?AUTO_9045 ?AUTO_9048 ) ) ( not ( = ?AUTO_9044 ?AUTO_9048 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9047 ?AUTO_9048 ?AUTO_9045 ?AUTO_9049 )
      ( DELIVER-PKG ?AUTO_9043 ?AUTO_9044 )
      ( DELIVER-PKG-VERIFY ?AUTO_9043 ?AUTO_9044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9054 - OBJ
      ?AUTO_9055 - LOCATION
    )
    :vars
    (
      ?AUTO_9058 - LOCATION
      ?AUTO_9057 - TRUCK
      ?AUTO_9056 - LOCATION
      ?AUTO_9059 - CITY
      ?AUTO_9060 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9058 ) ( AIRPORT ?AUTO_9055 ) ( not ( = ?AUTO_9058 ?AUTO_9055 ) ) ( IN-TRUCK ?AUTO_9054 ?AUTO_9057 ) ( TRUCK-AT ?AUTO_9057 ?AUTO_9056 ) ( IN-CITY ?AUTO_9056 ?AUTO_9059 ) ( IN-CITY ?AUTO_9058 ?AUTO_9059 ) ( not ( = ?AUTO_9058 ?AUTO_9056 ) ) ( not ( = ?AUTO_9055 ?AUTO_9056 ) ) ( AIRPLANE-AT ?AUTO_9060 ?AUTO_9058 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9060 ?AUTO_9058 ?AUTO_9055 )
      ( DELIVER-PKG ?AUTO_9054 ?AUTO_9055 )
      ( DELIVER-PKG-VERIFY ?AUTO_9054 ?AUTO_9055 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9063 - OBJ
      ?AUTO_9064 - LOCATION
    )
    :vars
    (
      ?AUTO_9069 - LOCATION
      ?AUTO_9066 - TRUCK
      ?AUTO_9067 - LOCATION
      ?AUTO_9065 - CITY
      ?AUTO_9070 - LOCATION
      ?AUTO_9068 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9069 ) ( AIRPORT ?AUTO_9064 ) ( not ( = ?AUTO_9069 ?AUTO_9064 ) ) ( IN-TRUCK ?AUTO_9063 ?AUTO_9066 ) ( TRUCK-AT ?AUTO_9066 ?AUTO_9067 ) ( IN-CITY ?AUTO_9067 ?AUTO_9065 ) ( IN-CITY ?AUTO_9069 ?AUTO_9065 ) ( not ( = ?AUTO_9069 ?AUTO_9067 ) ) ( not ( = ?AUTO_9064 ?AUTO_9067 ) ) ( AIRPORT ?AUTO_9070 ) ( AIRPLANE-AT ?AUTO_9068 ?AUTO_9070 ) ( not ( = ?AUTO_9070 ?AUTO_9069 ) ) ( not ( = ?AUTO_9064 ?AUTO_9070 ) ) ( not ( = ?AUTO_9067 ?AUTO_9070 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9068 ?AUTO_9070 ?AUTO_9069 )
      ( DELIVER-PKG ?AUTO_9063 ?AUTO_9064 )
      ( DELIVER-PKG-VERIFY ?AUTO_9063 ?AUTO_9064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9099 - OBJ
      ?AUTO_9100 - LOCATION
    )
    :vars
    (
      ?AUTO_9102 - LOCATION
      ?AUTO_9101 - TRUCK
      ?AUTO_9103 - LOCATION
      ?AUTO_9104 - CITY
      ?AUTO_9105 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9102 ) ( AIRPORT ?AUTO_9100 ) ( not ( = ?AUTO_9102 ?AUTO_9100 ) ) ( TRUCK-AT ?AUTO_9101 ?AUTO_9103 ) ( IN-CITY ?AUTO_9103 ?AUTO_9104 ) ( IN-CITY ?AUTO_9102 ?AUTO_9104 ) ( not ( = ?AUTO_9102 ?AUTO_9103 ) ) ( not ( = ?AUTO_9100 ?AUTO_9103 ) ) ( AIRPLANE-AT ?AUTO_9105 ?AUTO_9102 ) ( OBJ-AT ?AUTO_9099 ?AUTO_9103 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9099 ?AUTO_9101 ?AUTO_9103 )
      ( DELIVER-PKG ?AUTO_9099 ?AUTO_9100 )
      ( DELIVER-PKG-VERIFY ?AUTO_9099 ?AUTO_9100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9106 - OBJ
      ?AUTO_9107 - LOCATION
    )
    :vars
    (
      ?AUTO_9108 - LOCATION
      ?AUTO_9112 - LOCATION
      ?AUTO_9110 - CITY
      ?AUTO_9111 - AIRPLANE
      ?AUTO_9109 - TRUCK
      ?AUTO_9113 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9108 ) ( AIRPORT ?AUTO_9107 ) ( not ( = ?AUTO_9108 ?AUTO_9107 ) ) ( IN-CITY ?AUTO_9112 ?AUTO_9110 ) ( IN-CITY ?AUTO_9108 ?AUTO_9110 ) ( not ( = ?AUTO_9108 ?AUTO_9112 ) ) ( not ( = ?AUTO_9107 ?AUTO_9112 ) ) ( AIRPLANE-AT ?AUTO_9111 ?AUTO_9108 ) ( OBJ-AT ?AUTO_9106 ?AUTO_9112 ) ( TRUCK-AT ?AUTO_9109 ?AUTO_9113 ) ( IN-CITY ?AUTO_9113 ?AUTO_9110 ) ( not ( = ?AUTO_9112 ?AUTO_9113 ) ) ( not ( = ?AUTO_9107 ?AUTO_9113 ) ) ( not ( = ?AUTO_9108 ?AUTO_9113 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9109 ?AUTO_9113 ?AUTO_9112 ?AUTO_9110 )
      ( DELIVER-PKG ?AUTO_9106 ?AUTO_9107 )
      ( DELIVER-PKG-VERIFY ?AUTO_9106 ?AUTO_9107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9126 - OBJ
      ?AUTO_9127 - LOCATION
    )
    :vars
    (
      ?AUTO_9128 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9128 ?AUTO_9127 ) ( IN-TRUCK ?AUTO_9126 ?AUTO_9128 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9126 ?AUTO_9128 ?AUTO_9127 )
      ( DELIVER-PKG-VERIFY ?AUTO_9126 ?AUTO_9127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9129 - OBJ
      ?AUTO_9130 - LOCATION
    )
    :vars
    (
      ?AUTO_9131 - TRUCK
      ?AUTO_9132 - LOCATION
      ?AUTO_9133 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9129 ?AUTO_9131 ) ( TRUCK-AT ?AUTO_9131 ?AUTO_9132 ) ( IN-CITY ?AUTO_9132 ?AUTO_9133 ) ( IN-CITY ?AUTO_9130 ?AUTO_9133 ) ( not ( = ?AUTO_9130 ?AUTO_9132 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9131 ?AUTO_9132 ?AUTO_9130 ?AUTO_9133 )
      ( DELIVER-PKG ?AUTO_9129 ?AUTO_9130 )
      ( DELIVER-PKG-VERIFY ?AUTO_9129 ?AUTO_9130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9134 - OBJ
      ?AUTO_9135 - LOCATION
    )
    :vars
    (
      ?AUTO_9136 - TRUCK
      ?AUTO_9137 - LOCATION
      ?AUTO_9138 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9136 ?AUTO_9137 ) ( IN-CITY ?AUTO_9137 ?AUTO_9138 ) ( IN-CITY ?AUTO_9135 ?AUTO_9138 ) ( not ( = ?AUTO_9135 ?AUTO_9137 ) ) ( OBJ-AT ?AUTO_9134 ?AUTO_9137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9134 ?AUTO_9136 ?AUTO_9137 )
      ( DELIVER-PKG ?AUTO_9134 ?AUTO_9135 )
      ( DELIVER-PKG-VERIFY ?AUTO_9134 ?AUTO_9135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9139 - OBJ
      ?AUTO_9140 - LOCATION
    )
    :vars
    (
      ?AUTO_9141 - LOCATION
      ?AUTO_9143 - CITY
      ?AUTO_9142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9141 ?AUTO_9143 ) ( IN-CITY ?AUTO_9140 ?AUTO_9143 ) ( not ( = ?AUTO_9140 ?AUTO_9141 ) ) ( OBJ-AT ?AUTO_9139 ?AUTO_9141 ) ( TRUCK-AT ?AUTO_9142 ?AUTO_9140 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9142 ?AUTO_9140 ?AUTO_9141 ?AUTO_9143 )
      ( DELIVER-PKG ?AUTO_9139 ?AUTO_9140 )
      ( DELIVER-PKG-VERIFY ?AUTO_9139 ?AUTO_9140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9172 - OBJ
      ?AUTO_9173 - LOCATION
    )
    :vars
    (
      ?AUTO_9176 - LOCATION
      ?AUTO_9174 - CITY
      ?AUTO_9175 - TRUCK
      ?AUTO_9177 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9176 ?AUTO_9174 ) ( IN-CITY ?AUTO_9173 ?AUTO_9174 ) ( not ( = ?AUTO_9173 ?AUTO_9176 ) ) ( OBJ-AT ?AUTO_9172 ?AUTO_9176 ) ( TRUCK-AT ?AUTO_9175 ?AUTO_9177 ) ( IN-CITY ?AUTO_9177 ?AUTO_9174 ) ( not ( = ?AUTO_9173 ?AUTO_9177 ) ) ( not ( = ?AUTO_9176 ?AUTO_9177 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9175 ?AUTO_9177 ?AUTO_9173 ?AUTO_9174 )
      ( DELIVER-PKG ?AUTO_9172 ?AUTO_9173 )
      ( DELIVER-PKG-VERIFY ?AUTO_9172 ?AUTO_9173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9228 - OBJ
      ?AUTO_9229 - LOCATION
    )
    :vars
    (
      ?AUTO_9230 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9228 ?AUTO_9230 ) ( AIRPLANE-AT ?AUTO_9230 ?AUTO_9229 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9228 ?AUTO_9230 ?AUTO_9229 )
      ( DELIVER-PKG-VERIFY ?AUTO_9228 ?AUTO_9229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9231 - OBJ
      ?AUTO_9232 - LOCATION
    )
    :vars
    (
      ?AUTO_9233 - AIRPLANE
      ?AUTO_9234 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9231 ?AUTO_9233 ) ( AIRPORT ?AUTO_9234 ) ( AIRPORT ?AUTO_9232 ) ( AIRPLANE-AT ?AUTO_9233 ?AUTO_9234 ) ( not ( = ?AUTO_9234 ?AUTO_9232 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9233 ?AUTO_9234 ?AUTO_9232 )
      ( DELIVER-PKG ?AUTO_9231 ?AUTO_9232 )
      ( DELIVER-PKG-VERIFY ?AUTO_9231 ?AUTO_9232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9235 - OBJ
      ?AUTO_9236 - LOCATION
    )
    :vars
    (
      ?AUTO_9238 - LOCATION
      ?AUTO_9237 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9238 ) ( AIRPORT ?AUTO_9236 ) ( AIRPLANE-AT ?AUTO_9237 ?AUTO_9238 ) ( not ( = ?AUTO_9238 ?AUTO_9236 ) ) ( OBJ-AT ?AUTO_9235 ?AUTO_9238 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9235 ?AUTO_9237 ?AUTO_9238 )
      ( DELIVER-PKG ?AUTO_9235 ?AUTO_9236 )
      ( DELIVER-PKG-VERIFY ?AUTO_9235 ?AUTO_9236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9239 - OBJ
      ?AUTO_9240 - LOCATION
    )
    :vars
    (
      ?AUTO_9242 - LOCATION
      ?AUTO_9241 - AIRPLANE
      ?AUTO_9243 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9242 ) ( AIRPORT ?AUTO_9240 ) ( AIRPLANE-AT ?AUTO_9241 ?AUTO_9242 ) ( not ( = ?AUTO_9242 ?AUTO_9240 ) ) ( TRUCK-AT ?AUTO_9243 ?AUTO_9242 ) ( IN-TRUCK ?AUTO_9239 ?AUTO_9243 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9239 ?AUTO_9243 ?AUTO_9242 )
      ( DELIVER-PKG ?AUTO_9239 ?AUTO_9240 )
      ( DELIVER-PKG-VERIFY ?AUTO_9239 ?AUTO_9240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9244 - OBJ
      ?AUTO_9245 - LOCATION
    )
    :vars
    (
      ?AUTO_9247 - LOCATION
      ?AUTO_9246 - AIRPLANE
      ?AUTO_9248 - TRUCK
      ?AUTO_9249 - LOCATION
      ?AUTO_9250 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9247 ) ( AIRPORT ?AUTO_9245 ) ( AIRPLANE-AT ?AUTO_9246 ?AUTO_9247 ) ( not ( = ?AUTO_9247 ?AUTO_9245 ) ) ( IN-TRUCK ?AUTO_9244 ?AUTO_9248 ) ( TRUCK-AT ?AUTO_9248 ?AUTO_9249 ) ( IN-CITY ?AUTO_9249 ?AUTO_9250 ) ( IN-CITY ?AUTO_9247 ?AUTO_9250 ) ( not ( = ?AUTO_9247 ?AUTO_9249 ) ) ( not ( = ?AUTO_9245 ?AUTO_9249 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9248 ?AUTO_9249 ?AUTO_9247 ?AUTO_9250 )
      ( DELIVER-PKG ?AUTO_9244 ?AUTO_9245 )
      ( DELIVER-PKG-VERIFY ?AUTO_9244 ?AUTO_9245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9251 - OBJ
      ?AUTO_9252 - LOCATION
    )
    :vars
    (
      ?AUTO_9254 - LOCATION
      ?AUTO_9253 - AIRPLANE
      ?AUTO_9255 - TRUCK
      ?AUTO_9257 - LOCATION
      ?AUTO_9256 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9254 ) ( AIRPORT ?AUTO_9252 ) ( AIRPLANE-AT ?AUTO_9253 ?AUTO_9254 ) ( not ( = ?AUTO_9254 ?AUTO_9252 ) ) ( TRUCK-AT ?AUTO_9255 ?AUTO_9257 ) ( IN-CITY ?AUTO_9257 ?AUTO_9256 ) ( IN-CITY ?AUTO_9254 ?AUTO_9256 ) ( not ( = ?AUTO_9254 ?AUTO_9257 ) ) ( not ( = ?AUTO_9252 ?AUTO_9257 ) ) ( OBJ-AT ?AUTO_9251 ?AUTO_9257 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9251 ?AUTO_9255 ?AUTO_9257 )
      ( DELIVER-PKG ?AUTO_9251 ?AUTO_9252 )
      ( DELIVER-PKG-VERIFY ?AUTO_9251 ?AUTO_9252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9258 - OBJ
      ?AUTO_9259 - LOCATION
    )
    :vars
    (
      ?AUTO_9260 - LOCATION
      ?AUTO_9264 - AIRPLANE
      ?AUTO_9261 - LOCATION
      ?AUTO_9263 - CITY
      ?AUTO_9262 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9260 ) ( AIRPORT ?AUTO_9259 ) ( AIRPLANE-AT ?AUTO_9264 ?AUTO_9260 ) ( not ( = ?AUTO_9260 ?AUTO_9259 ) ) ( IN-CITY ?AUTO_9261 ?AUTO_9263 ) ( IN-CITY ?AUTO_9260 ?AUTO_9263 ) ( not ( = ?AUTO_9260 ?AUTO_9261 ) ) ( not ( = ?AUTO_9259 ?AUTO_9261 ) ) ( OBJ-AT ?AUTO_9258 ?AUTO_9261 ) ( TRUCK-AT ?AUTO_9262 ?AUTO_9260 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9262 ?AUTO_9260 ?AUTO_9261 ?AUTO_9263 )
      ( DELIVER-PKG ?AUTO_9258 ?AUTO_9259 )
      ( DELIVER-PKG-VERIFY ?AUTO_9258 ?AUTO_9259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9269 - OBJ
      ?AUTO_9270 - LOCATION
    )
    :vars
    (
      ?AUTO_9275 - LOCATION
      ?AUTO_9273 - LOCATION
      ?AUTO_9272 - CITY
      ?AUTO_9271 - TRUCK
      ?AUTO_9276 - LOCATION
      ?AUTO_9274 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9275 ) ( AIRPORT ?AUTO_9270 ) ( not ( = ?AUTO_9275 ?AUTO_9270 ) ) ( IN-CITY ?AUTO_9273 ?AUTO_9272 ) ( IN-CITY ?AUTO_9275 ?AUTO_9272 ) ( not ( = ?AUTO_9275 ?AUTO_9273 ) ) ( not ( = ?AUTO_9270 ?AUTO_9273 ) ) ( OBJ-AT ?AUTO_9269 ?AUTO_9273 ) ( TRUCK-AT ?AUTO_9271 ?AUTO_9275 ) ( AIRPORT ?AUTO_9276 ) ( AIRPLANE-AT ?AUTO_9274 ?AUTO_9276 ) ( not ( = ?AUTO_9276 ?AUTO_9275 ) ) ( not ( = ?AUTO_9270 ?AUTO_9276 ) ) ( not ( = ?AUTO_9273 ?AUTO_9276 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9274 ?AUTO_9276 ?AUTO_9275 )
      ( DELIVER-PKG ?AUTO_9269 ?AUTO_9270 )
      ( DELIVER-PKG-VERIFY ?AUTO_9269 ?AUTO_9270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9325 - OBJ
      ?AUTO_9326 - LOCATION
    )
    :vars
    (
      ?AUTO_9329 - LOCATION
      ?AUTO_9327 - LOCATION
      ?AUTO_9332 - CITY
      ?AUTO_9330 - LOCATION
      ?AUTO_9328 - AIRPLANE
      ?AUTO_9331 - TRUCK
      ?AUTO_9333 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9329 ) ( AIRPORT ?AUTO_9326 ) ( not ( = ?AUTO_9329 ?AUTO_9326 ) ) ( IN-CITY ?AUTO_9327 ?AUTO_9332 ) ( IN-CITY ?AUTO_9329 ?AUTO_9332 ) ( not ( = ?AUTO_9329 ?AUTO_9327 ) ) ( not ( = ?AUTO_9326 ?AUTO_9327 ) ) ( OBJ-AT ?AUTO_9325 ?AUTO_9327 ) ( AIRPORT ?AUTO_9330 ) ( AIRPLANE-AT ?AUTO_9328 ?AUTO_9330 ) ( not ( = ?AUTO_9330 ?AUTO_9329 ) ) ( not ( = ?AUTO_9326 ?AUTO_9330 ) ) ( not ( = ?AUTO_9327 ?AUTO_9330 ) ) ( TRUCK-AT ?AUTO_9331 ?AUTO_9333 ) ( IN-CITY ?AUTO_9333 ?AUTO_9332 ) ( not ( = ?AUTO_9329 ?AUTO_9333 ) ) ( not ( = ?AUTO_9326 ?AUTO_9333 ) ) ( not ( = ?AUTO_9327 ?AUTO_9333 ) ) ( not ( = ?AUTO_9330 ?AUTO_9333 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9331 ?AUTO_9333 ?AUTO_9329 ?AUTO_9332 )
      ( DELIVER-PKG ?AUTO_9325 ?AUTO_9326 )
      ( DELIVER-PKG-VERIFY ?AUTO_9325 ?AUTO_9326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9358 - OBJ
      ?AUTO_9359 - LOCATION
    )
    :vars
    (
      ?AUTO_9360 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9358 ?AUTO_9360 ) ( AIRPLANE-AT ?AUTO_9360 ?AUTO_9359 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9358 ?AUTO_9360 ?AUTO_9359 )
      ( DELIVER-PKG-VERIFY ?AUTO_9358 ?AUTO_9359 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9361 - OBJ
      ?AUTO_9362 - LOCATION
    )
    :vars
    (
      ?AUTO_9363 - AIRPLANE
      ?AUTO_9364 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9361 ?AUTO_9363 ) ( AIRPORT ?AUTO_9364 ) ( AIRPORT ?AUTO_9362 ) ( AIRPLANE-AT ?AUTO_9363 ?AUTO_9364 ) ( not ( = ?AUTO_9364 ?AUTO_9362 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9363 ?AUTO_9364 ?AUTO_9362 )
      ( DELIVER-PKG ?AUTO_9361 ?AUTO_9362 )
      ( DELIVER-PKG-VERIFY ?AUTO_9361 ?AUTO_9362 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9367 - OBJ
      ?AUTO_9368 - LOCATION
    )
    :vars
    (
      ?AUTO_9370 - LOCATION
      ?AUTO_9369 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9370 ) ( AIRPORT ?AUTO_9368 ) ( AIRPLANE-AT ?AUTO_9369 ?AUTO_9370 ) ( not ( = ?AUTO_9370 ?AUTO_9368 ) ) ( OBJ-AT ?AUTO_9367 ?AUTO_9370 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9367 ?AUTO_9369 ?AUTO_9370 )
      ( DELIVER-PKG ?AUTO_9367 ?AUTO_9368 )
      ( DELIVER-PKG-VERIFY ?AUTO_9367 ?AUTO_9368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9371 - OBJ
      ?AUTO_9372 - LOCATION
    )
    :vars
    (
      ?AUTO_9374 - LOCATION
      ?AUTO_9375 - LOCATION
      ?AUTO_9373 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9374 ) ( AIRPORT ?AUTO_9372 ) ( not ( = ?AUTO_9374 ?AUTO_9372 ) ) ( OBJ-AT ?AUTO_9371 ?AUTO_9374 ) ( AIRPORT ?AUTO_9375 ) ( AIRPLANE-AT ?AUTO_9373 ?AUTO_9375 ) ( not ( = ?AUTO_9375 ?AUTO_9374 ) ) ( not ( = ?AUTO_9372 ?AUTO_9375 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9373 ?AUTO_9375 ?AUTO_9374 )
      ( DELIVER-PKG ?AUTO_9371 ?AUTO_9372 )
      ( DELIVER-PKG-VERIFY ?AUTO_9371 ?AUTO_9372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9378 - OBJ
      ?AUTO_9379 - LOCATION
    )
    :vars
    (
      ?AUTO_9382 - LOCATION
      ?AUTO_9380 - LOCATION
      ?AUTO_9381 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9382 ) ( AIRPORT ?AUTO_9379 ) ( not ( = ?AUTO_9382 ?AUTO_9379 ) ) ( OBJ-AT ?AUTO_9378 ?AUTO_9382 ) ( AIRPORT ?AUTO_9380 ) ( not ( = ?AUTO_9380 ?AUTO_9382 ) ) ( not ( = ?AUTO_9379 ?AUTO_9380 ) ) ( AIRPLANE-AT ?AUTO_9381 ?AUTO_9379 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9381 ?AUTO_9379 ?AUTO_9380 )
      ( DELIVER-PKG ?AUTO_9378 ?AUTO_9379 )
      ( DELIVER-PKG-VERIFY ?AUTO_9378 ?AUTO_9379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9413 - OBJ
      ?AUTO_9414 - LOCATION
    )
    :vars
    (
      ?AUTO_9416 - LOCATION
      ?AUTO_9417 - LOCATION
      ?AUTO_9415 - AIRPLANE
      ?AUTO_9418 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9416 ) ( AIRPORT ?AUTO_9414 ) ( not ( = ?AUTO_9416 ?AUTO_9414 ) ) ( AIRPORT ?AUTO_9417 ) ( not ( = ?AUTO_9417 ?AUTO_9416 ) ) ( not ( = ?AUTO_9414 ?AUTO_9417 ) ) ( AIRPLANE-AT ?AUTO_9415 ?AUTO_9414 ) ( TRUCK-AT ?AUTO_9418 ?AUTO_9416 ) ( IN-TRUCK ?AUTO_9413 ?AUTO_9418 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9413 ?AUTO_9418 ?AUTO_9416 )
      ( DELIVER-PKG ?AUTO_9413 ?AUTO_9414 )
      ( DELIVER-PKG-VERIFY ?AUTO_9413 ?AUTO_9414 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9455 - OBJ
      ?AUTO_9456 - LOCATION
    )
    :vars
    (
      ?AUTO_9459 - LOCATION
      ?AUTO_9458 - AIRPLANE
      ?AUTO_9461 - LOCATION
      ?AUTO_9457 - CITY
      ?AUTO_9460 - TRUCK
      ?AUTO_9462 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9459 ) ( AIRPORT ?AUTO_9456 ) ( AIRPLANE-AT ?AUTO_9458 ?AUTO_9459 ) ( not ( = ?AUTO_9459 ?AUTO_9456 ) ) ( IN-CITY ?AUTO_9461 ?AUTO_9457 ) ( IN-CITY ?AUTO_9459 ?AUTO_9457 ) ( not ( = ?AUTO_9459 ?AUTO_9461 ) ) ( not ( = ?AUTO_9456 ?AUTO_9461 ) ) ( OBJ-AT ?AUTO_9455 ?AUTO_9461 ) ( TRUCK-AT ?AUTO_9460 ?AUTO_9462 ) ( IN-CITY ?AUTO_9462 ?AUTO_9457 ) ( not ( = ?AUTO_9461 ?AUTO_9462 ) ) ( not ( = ?AUTO_9456 ?AUTO_9462 ) ) ( not ( = ?AUTO_9459 ?AUTO_9462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9460 ?AUTO_9462 ?AUTO_9461 ?AUTO_9457 )
      ( DELIVER-PKG ?AUTO_9455 ?AUTO_9456 )
      ( DELIVER-PKG-VERIFY ?AUTO_9455 ?AUTO_9456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9483 - OBJ
      ?AUTO_9484 - LOCATION
    )
    :vars
    (
      ?AUTO_9485 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9485 ?AUTO_9484 ) ( IN-TRUCK ?AUTO_9483 ?AUTO_9485 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9483 ?AUTO_9485 ?AUTO_9484 )
      ( DELIVER-PKG-VERIFY ?AUTO_9483 ?AUTO_9484 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9490 - OBJ
      ?AUTO_9491 - LOCATION
    )
    :vars
    (
      ?AUTO_9492 - TRUCK
      ?AUTO_9493 - LOCATION
      ?AUTO_9494 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9490 ?AUTO_9492 ) ( TRUCK-AT ?AUTO_9492 ?AUTO_9493 ) ( IN-CITY ?AUTO_9493 ?AUTO_9494 ) ( IN-CITY ?AUTO_9491 ?AUTO_9494 ) ( not ( = ?AUTO_9491 ?AUTO_9493 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9492 ?AUTO_9493 ?AUTO_9491 ?AUTO_9494 )
      ( DELIVER-PKG ?AUTO_9490 ?AUTO_9491 )
      ( DELIVER-PKG-VERIFY ?AUTO_9490 ?AUTO_9491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9523 - OBJ
      ?AUTO_9524 - LOCATION
    )
    :vars
    (
      ?AUTO_9527 - TRUCK
      ?AUTO_9526 - LOCATION
      ?AUTO_9525 - CITY
      ?AUTO_9528 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9527 ?AUTO_9526 ) ( IN-CITY ?AUTO_9526 ?AUTO_9525 ) ( IN-CITY ?AUTO_9524 ?AUTO_9525 ) ( not ( = ?AUTO_9524 ?AUTO_9526 ) ) ( IN-AIRPLANE ?AUTO_9523 ?AUTO_9528 ) ( AIRPLANE-AT ?AUTO_9528 ?AUTO_9526 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9523 ?AUTO_9528 ?AUTO_9526 )
      ( DELIVER-PKG ?AUTO_9523 ?AUTO_9524 )
      ( DELIVER-PKG-VERIFY ?AUTO_9523 ?AUTO_9524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9529 - OBJ
      ?AUTO_9530 - LOCATION
    )
    :vars
    (
      ?AUTO_9533 - TRUCK
      ?AUTO_9532 - LOCATION
      ?AUTO_9531 - CITY
      ?AUTO_9534 - AIRPLANE
      ?AUTO_9535 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9533 ?AUTO_9532 ) ( IN-CITY ?AUTO_9532 ?AUTO_9531 ) ( IN-CITY ?AUTO_9530 ?AUTO_9531 ) ( not ( = ?AUTO_9530 ?AUTO_9532 ) ) ( IN-AIRPLANE ?AUTO_9529 ?AUTO_9534 ) ( AIRPORT ?AUTO_9535 ) ( AIRPORT ?AUTO_9532 ) ( AIRPLANE-AT ?AUTO_9534 ?AUTO_9535 ) ( not ( = ?AUTO_9535 ?AUTO_9532 ) ) ( not ( = ?AUTO_9530 ?AUTO_9535 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9534 ?AUTO_9535 ?AUTO_9532 )
      ( DELIVER-PKG ?AUTO_9529 ?AUTO_9530 )
      ( DELIVER-PKG-VERIFY ?AUTO_9529 ?AUTO_9530 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9536 - OBJ
      ?AUTO_9537 - LOCATION
    )
    :vars
    (
      ?AUTO_9541 - TRUCK
      ?AUTO_9538 - LOCATION
      ?AUTO_9540 - CITY
      ?AUTO_9542 - LOCATION
      ?AUTO_9539 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9541 ?AUTO_9538 ) ( IN-CITY ?AUTO_9538 ?AUTO_9540 ) ( IN-CITY ?AUTO_9537 ?AUTO_9540 ) ( not ( = ?AUTO_9537 ?AUTO_9538 ) ) ( AIRPORT ?AUTO_9542 ) ( AIRPORT ?AUTO_9538 ) ( AIRPLANE-AT ?AUTO_9539 ?AUTO_9542 ) ( not ( = ?AUTO_9542 ?AUTO_9538 ) ) ( not ( = ?AUTO_9537 ?AUTO_9542 ) ) ( OBJ-AT ?AUTO_9536 ?AUTO_9542 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9536 ?AUTO_9539 ?AUTO_9542 )
      ( DELIVER-PKG ?AUTO_9536 ?AUTO_9537 )
      ( DELIVER-PKG-VERIFY ?AUTO_9536 ?AUTO_9537 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9543 - OBJ
      ?AUTO_9544 - LOCATION
    )
    :vars
    (
      ?AUTO_9546 - TRUCK
      ?AUTO_9548 - LOCATION
      ?AUTO_9545 - CITY
      ?AUTO_9547 - LOCATION
      ?AUTO_9549 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9546 ?AUTO_9548 ) ( IN-CITY ?AUTO_9548 ?AUTO_9545 ) ( IN-CITY ?AUTO_9544 ?AUTO_9545 ) ( not ( = ?AUTO_9544 ?AUTO_9548 ) ) ( AIRPORT ?AUTO_9547 ) ( AIRPORT ?AUTO_9548 ) ( not ( = ?AUTO_9547 ?AUTO_9548 ) ) ( not ( = ?AUTO_9544 ?AUTO_9547 ) ) ( OBJ-AT ?AUTO_9543 ?AUTO_9547 ) ( AIRPLANE-AT ?AUTO_9549 ?AUTO_9548 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9549 ?AUTO_9548 ?AUTO_9547 )
      ( DELIVER-PKG ?AUTO_9543 ?AUTO_9544 )
      ( DELIVER-PKG-VERIFY ?AUTO_9543 ?AUTO_9544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9562 - OBJ
      ?AUTO_9563 - LOCATION
    )
    :vars
    (
      ?AUTO_9567 - TRUCK
      ?AUTO_9564 - LOCATION
      ?AUTO_9566 - CITY
      ?AUTO_9568 - LOCATION
      ?AUTO_9565 - AIRPLANE
      ?AUTO_9569 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9567 ?AUTO_9564 ) ( IN-CITY ?AUTO_9564 ?AUTO_9566 ) ( IN-CITY ?AUTO_9563 ?AUTO_9566 ) ( not ( = ?AUTO_9563 ?AUTO_9564 ) ) ( AIRPORT ?AUTO_9568 ) ( AIRPORT ?AUTO_9564 ) ( not ( = ?AUTO_9568 ?AUTO_9564 ) ) ( not ( = ?AUTO_9563 ?AUTO_9568 ) ) ( AIRPLANE-AT ?AUTO_9565 ?AUTO_9564 ) ( TRUCK-AT ?AUTO_9569 ?AUTO_9568 ) ( IN-TRUCK ?AUTO_9562 ?AUTO_9569 ) ( not ( = ?AUTO_9567 ?AUTO_9569 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9562 ?AUTO_9569 ?AUTO_9568 )
      ( DELIVER-PKG ?AUTO_9562 ?AUTO_9563 )
      ( DELIVER-PKG-VERIFY ?AUTO_9562 ?AUTO_9563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9570 - OBJ
      ?AUTO_9571 - LOCATION
    )
    :vars
    (
      ?AUTO_9576 - TRUCK
      ?AUTO_9573 - LOCATION
      ?AUTO_9575 - CITY
      ?AUTO_9577 - LOCATION
      ?AUTO_9572 - AIRPLANE
      ?AUTO_9574 - TRUCK
      ?AUTO_9578 - LOCATION
      ?AUTO_9579 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9576 ?AUTO_9573 ) ( IN-CITY ?AUTO_9573 ?AUTO_9575 ) ( IN-CITY ?AUTO_9571 ?AUTO_9575 ) ( not ( = ?AUTO_9571 ?AUTO_9573 ) ) ( AIRPORT ?AUTO_9577 ) ( AIRPORT ?AUTO_9573 ) ( not ( = ?AUTO_9577 ?AUTO_9573 ) ) ( not ( = ?AUTO_9571 ?AUTO_9577 ) ) ( AIRPLANE-AT ?AUTO_9572 ?AUTO_9573 ) ( IN-TRUCK ?AUTO_9570 ?AUTO_9574 ) ( not ( = ?AUTO_9576 ?AUTO_9574 ) ) ( TRUCK-AT ?AUTO_9574 ?AUTO_9578 ) ( IN-CITY ?AUTO_9578 ?AUTO_9579 ) ( IN-CITY ?AUTO_9577 ?AUTO_9579 ) ( not ( = ?AUTO_9577 ?AUTO_9578 ) ) ( not ( = ?AUTO_9571 ?AUTO_9578 ) ) ( not ( = ?AUTO_9573 ?AUTO_9578 ) ) ( not ( = ?AUTO_9575 ?AUTO_9579 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9574 ?AUTO_9578 ?AUTO_9577 ?AUTO_9579 )
      ( DELIVER-PKG ?AUTO_9570 ?AUTO_9571 )
      ( DELIVER-PKG-VERIFY ?AUTO_9570 ?AUTO_9571 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9582 - OBJ
      ?AUTO_9583 - LOCATION
    )
    :vars
    (
      ?AUTO_9591 - LOCATION
      ?AUTO_9584 - CITY
      ?AUTO_9589 - LOCATION
      ?AUTO_9590 - AIRPLANE
      ?AUTO_9585 - TRUCK
      ?AUTO_9588 - TRUCK
      ?AUTO_9587 - LOCATION
      ?AUTO_9586 - CITY
      ?AUTO_9592 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9591 ?AUTO_9584 ) ( IN-CITY ?AUTO_9583 ?AUTO_9584 ) ( not ( = ?AUTO_9583 ?AUTO_9591 ) ) ( AIRPORT ?AUTO_9589 ) ( AIRPORT ?AUTO_9591 ) ( not ( = ?AUTO_9589 ?AUTO_9591 ) ) ( not ( = ?AUTO_9583 ?AUTO_9589 ) ) ( AIRPLANE-AT ?AUTO_9590 ?AUTO_9591 ) ( IN-TRUCK ?AUTO_9582 ?AUTO_9585 ) ( not ( = ?AUTO_9588 ?AUTO_9585 ) ) ( TRUCK-AT ?AUTO_9585 ?AUTO_9587 ) ( IN-CITY ?AUTO_9587 ?AUTO_9586 ) ( IN-CITY ?AUTO_9589 ?AUTO_9586 ) ( not ( = ?AUTO_9589 ?AUTO_9587 ) ) ( not ( = ?AUTO_9583 ?AUTO_9587 ) ) ( not ( = ?AUTO_9591 ?AUTO_9587 ) ) ( not ( = ?AUTO_9584 ?AUTO_9586 ) ) ( TRUCK-AT ?AUTO_9588 ?AUTO_9592 ) ( IN-CITY ?AUTO_9592 ?AUTO_9584 ) ( not ( = ?AUTO_9591 ?AUTO_9592 ) ) ( not ( = ?AUTO_9583 ?AUTO_9592 ) ) ( not ( = ?AUTO_9589 ?AUTO_9592 ) ) ( not ( = ?AUTO_9587 ?AUTO_9592 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9588 ?AUTO_9592 ?AUTO_9591 ?AUTO_9584 )
      ( DELIVER-PKG ?AUTO_9582 ?AUTO_9583 )
      ( DELIVER-PKG-VERIFY ?AUTO_9582 ?AUTO_9583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9593 - OBJ
      ?AUTO_9594 - LOCATION
    )
    :vars
    (
      ?AUTO_9600 - LOCATION
      ?AUTO_9598 - CITY
      ?AUTO_9601 - LOCATION
      ?AUTO_9597 - TRUCK
      ?AUTO_9599 - TRUCK
      ?AUTO_9602 - LOCATION
      ?AUTO_9596 - CITY
      ?AUTO_9603 - LOCATION
      ?AUTO_9595 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9600 ?AUTO_9598 ) ( IN-CITY ?AUTO_9594 ?AUTO_9598 ) ( not ( = ?AUTO_9594 ?AUTO_9600 ) ) ( AIRPORT ?AUTO_9601 ) ( AIRPORT ?AUTO_9600 ) ( not ( = ?AUTO_9601 ?AUTO_9600 ) ) ( not ( = ?AUTO_9594 ?AUTO_9601 ) ) ( IN-TRUCK ?AUTO_9593 ?AUTO_9597 ) ( not ( = ?AUTO_9599 ?AUTO_9597 ) ) ( TRUCK-AT ?AUTO_9597 ?AUTO_9602 ) ( IN-CITY ?AUTO_9602 ?AUTO_9596 ) ( IN-CITY ?AUTO_9601 ?AUTO_9596 ) ( not ( = ?AUTO_9601 ?AUTO_9602 ) ) ( not ( = ?AUTO_9594 ?AUTO_9602 ) ) ( not ( = ?AUTO_9600 ?AUTO_9602 ) ) ( not ( = ?AUTO_9598 ?AUTO_9596 ) ) ( TRUCK-AT ?AUTO_9599 ?AUTO_9603 ) ( IN-CITY ?AUTO_9603 ?AUTO_9598 ) ( not ( = ?AUTO_9600 ?AUTO_9603 ) ) ( not ( = ?AUTO_9594 ?AUTO_9603 ) ) ( not ( = ?AUTO_9601 ?AUTO_9603 ) ) ( not ( = ?AUTO_9602 ?AUTO_9603 ) ) ( AIRPLANE-AT ?AUTO_9595 ?AUTO_9601 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9595 ?AUTO_9601 ?AUTO_9600 )
      ( DELIVER-PKG ?AUTO_9593 ?AUTO_9594 )
      ( DELIVER-PKG-VERIFY ?AUTO_9593 ?AUTO_9594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9606 - OBJ
      ?AUTO_9607 - LOCATION
    )
    :vars
    (
      ?AUTO_9615 - LOCATION
      ?AUTO_9612 - CITY
      ?AUTO_9610 - LOCATION
      ?AUTO_9613 - TRUCK
      ?AUTO_9608 - TRUCK
      ?AUTO_9614 - LOCATION
      ?AUTO_9611 - CITY
      ?AUTO_9609 - LOCATION
      ?AUTO_9617 - LOCATION
      ?AUTO_9616 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9615 ?AUTO_9612 ) ( IN-CITY ?AUTO_9607 ?AUTO_9612 ) ( not ( = ?AUTO_9607 ?AUTO_9615 ) ) ( AIRPORT ?AUTO_9610 ) ( AIRPORT ?AUTO_9615 ) ( not ( = ?AUTO_9610 ?AUTO_9615 ) ) ( not ( = ?AUTO_9607 ?AUTO_9610 ) ) ( IN-TRUCK ?AUTO_9606 ?AUTO_9613 ) ( not ( = ?AUTO_9608 ?AUTO_9613 ) ) ( TRUCK-AT ?AUTO_9613 ?AUTO_9614 ) ( IN-CITY ?AUTO_9614 ?AUTO_9611 ) ( IN-CITY ?AUTO_9610 ?AUTO_9611 ) ( not ( = ?AUTO_9610 ?AUTO_9614 ) ) ( not ( = ?AUTO_9607 ?AUTO_9614 ) ) ( not ( = ?AUTO_9615 ?AUTO_9614 ) ) ( not ( = ?AUTO_9612 ?AUTO_9611 ) ) ( TRUCK-AT ?AUTO_9608 ?AUTO_9609 ) ( IN-CITY ?AUTO_9609 ?AUTO_9612 ) ( not ( = ?AUTO_9615 ?AUTO_9609 ) ) ( not ( = ?AUTO_9607 ?AUTO_9609 ) ) ( not ( = ?AUTO_9610 ?AUTO_9609 ) ) ( not ( = ?AUTO_9614 ?AUTO_9609 ) ) ( AIRPORT ?AUTO_9617 ) ( AIRPLANE-AT ?AUTO_9616 ?AUTO_9617 ) ( not ( = ?AUTO_9617 ?AUTO_9610 ) ) ( not ( = ?AUTO_9607 ?AUTO_9617 ) ) ( not ( = ?AUTO_9615 ?AUTO_9617 ) ) ( not ( = ?AUTO_9614 ?AUTO_9617 ) ) ( not ( = ?AUTO_9609 ?AUTO_9617 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9616 ?AUTO_9617 ?AUTO_9610 )
      ( DELIVER-PKG ?AUTO_9606 ?AUTO_9607 )
      ( DELIVER-PKG-VERIFY ?AUTO_9606 ?AUTO_9607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9646 - OBJ
      ?AUTO_9647 - LOCATION
    )
    :vars
    (
      ?AUTO_9656 - LOCATION
      ?AUTO_9651 - CITY
      ?AUTO_9649 - LOCATION
      ?AUTO_9653 - TRUCK
      ?AUTO_9650 - TRUCK
      ?AUTO_9654 - LOCATION
      ?AUTO_9655 - CITY
      ?AUTO_9648 - LOCATION
      ?AUTO_9652 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9656 ?AUTO_9651 ) ( IN-CITY ?AUTO_9647 ?AUTO_9651 ) ( not ( = ?AUTO_9647 ?AUTO_9656 ) ) ( AIRPORT ?AUTO_9649 ) ( AIRPORT ?AUTO_9656 ) ( not ( = ?AUTO_9649 ?AUTO_9656 ) ) ( not ( = ?AUTO_9647 ?AUTO_9649 ) ) ( not ( = ?AUTO_9653 ?AUTO_9650 ) ) ( TRUCK-AT ?AUTO_9650 ?AUTO_9654 ) ( IN-CITY ?AUTO_9654 ?AUTO_9655 ) ( IN-CITY ?AUTO_9649 ?AUTO_9655 ) ( not ( = ?AUTO_9649 ?AUTO_9654 ) ) ( not ( = ?AUTO_9647 ?AUTO_9654 ) ) ( not ( = ?AUTO_9656 ?AUTO_9654 ) ) ( not ( = ?AUTO_9651 ?AUTO_9655 ) ) ( TRUCK-AT ?AUTO_9653 ?AUTO_9648 ) ( IN-CITY ?AUTO_9648 ?AUTO_9651 ) ( not ( = ?AUTO_9656 ?AUTO_9648 ) ) ( not ( = ?AUTO_9647 ?AUTO_9648 ) ) ( not ( = ?AUTO_9649 ?AUTO_9648 ) ) ( not ( = ?AUTO_9654 ?AUTO_9648 ) ) ( AIRPLANE-AT ?AUTO_9652 ?AUTO_9649 ) ( OBJ-AT ?AUTO_9646 ?AUTO_9654 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9646 ?AUTO_9650 ?AUTO_9654 )
      ( DELIVER-PKG ?AUTO_9646 ?AUTO_9647 )
      ( DELIVER-PKG-VERIFY ?AUTO_9646 ?AUTO_9647 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9657 - OBJ
      ?AUTO_9658 - LOCATION
    )
    :vars
    (
      ?AUTO_9661 - LOCATION
      ?AUTO_9664 - CITY
      ?AUTO_9660 - LOCATION
      ?AUTO_9662 - TRUCK
      ?AUTO_9667 - TRUCK
      ?AUTO_9659 - LOCATION
      ?AUTO_9666 - CITY
      ?AUTO_9665 - LOCATION
      ?AUTO_9663 - AIRPLANE
      ?AUTO_9668 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9661 ?AUTO_9664 ) ( IN-CITY ?AUTO_9658 ?AUTO_9664 ) ( not ( = ?AUTO_9658 ?AUTO_9661 ) ) ( AIRPORT ?AUTO_9660 ) ( AIRPORT ?AUTO_9661 ) ( not ( = ?AUTO_9660 ?AUTO_9661 ) ) ( not ( = ?AUTO_9658 ?AUTO_9660 ) ) ( not ( = ?AUTO_9662 ?AUTO_9667 ) ) ( IN-CITY ?AUTO_9659 ?AUTO_9666 ) ( IN-CITY ?AUTO_9660 ?AUTO_9666 ) ( not ( = ?AUTO_9660 ?AUTO_9659 ) ) ( not ( = ?AUTO_9658 ?AUTO_9659 ) ) ( not ( = ?AUTO_9661 ?AUTO_9659 ) ) ( not ( = ?AUTO_9664 ?AUTO_9666 ) ) ( TRUCK-AT ?AUTO_9662 ?AUTO_9665 ) ( IN-CITY ?AUTO_9665 ?AUTO_9664 ) ( not ( = ?AUTO_9661 ?AUTO_9665 ) ) ( not ( = ?AUTO_9658 ?AUTO_9665 ) ) ( not ( = ?AUTO_9660 ?AUTO_9665 ) ) ( not ( = ?AUTO_9659 ?AUTO_9665 ) ) ( AIRPLANE-AT ?AUTO_9663 ?AUTO_9660 ) ( OBJ-AT ?AUTO_9657 ?AUTO_9659 ) ( TRUCK-AT ?AUTO_9667 ?AUTO_9668 ) ( IN-CITY ?AUTO_9668 ?AUTO_9666 ) ( not ( = ?AUTO_9659 ?AUTO_9668 ) ) ( not ( = ?AUTO_9658 ?AUTO_9668 ) ) ( not ( = ?AUTO_9661 ?AUTO_9668 ) ) ( not ( = ?AUTO_9660 ?AUTO_9668 ) ) ( not ( = ?AUTO_9665 ?AUTO_9668 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9667 ?AUTO_9668 ?AUTO_9659 ?AUTO_9666 )
      ( DELIVER-PKG ?AUTO_9657 ?AUTO_9658 )
      ( DELIVER-PKG-VERIFY ?AUTO_9657 ?AUTO_9658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9681 - OBJ
      ?AUTO_9682 - LOCATION
    )
    :vars
    (
      ?AUTO_9683 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9683 ?AUTO_9682 ) ( IN-TRUCK ?AUTO_9681 ?AUTO_9683 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9681 ?AUTO_9683 ?AUTO_9682 )
      ( DELIVER-PKG-VERIFY ?AUTO_9681 ?AUTO_9682 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9684 - OBJ
      ?AUTO_9685 - LOCATION
    )
    :vars
    (
      ?AUTO_9686 - TRUCK
      ?AUTO_9687 - LOCATION
      ?AUTO_9688 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9684 ?AUTO_9686 ) ( TRUCK-AT ?AUTO_9686 ?AUTO_9687 ) ( IN-CITY ?AUTO_9687 ?AUTO_9688 ) ( IN-CITY ?AUTO_9685 ?AUTO_9688 ) ( not ( = ?AUTO_9685 ?AUTO_9687 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9686 ?AUTO_9687 ?AUTO_9685 ?AUTO_9688 )
      ( DELIVER-PKG ?AUTO_9684 ?AUTO_9685 )
      ( DELIVER-PKG-VERIFY ?AUTO_9684 ?AUTO_9685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9697 - OBJ
      ?AUTO_9698 - LOCATION
    )
    :vars
    (
      ?AUTO_9701 - TRUCK
      ?AUTO_9700 - LOCATION
      ?AUTO_9699 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9701 ?AUTO_9700 ) ( IN-CITY ?AUTO_9700 ?AUTO_9699 ) ( IN-CITY ?AUTO_9698 ?AUTO_9699 ) ( not ( = ?AUTO_9698 ?AUTO_9700 ) ) ( OBJ-AT ?AUTO_9697 ?AUTO_9700 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9697 ?AUTO_9701 ?AUTO_9700 )
      ( DELIVER-PKG ?AUTO_9697 ?AUTO_9698 )
      ( DELIVER-PKG-VERIFY ?AUTO_9697 ?AUTO_9698 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9702 - OBJ
      ?AUTO_9703 - LOCATION
    )
    :vars
    (
      ?AUTO_9706 - TRUCK
      ?AUTO_9704 - LOCATION
      ?AUTO_9705 - CITY
      ?AUTO_9707 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9706 ?AUTO_9704 ) ( IN-CITY ?AUTO_9704 ?AUTO_9705 ) ( IN-CITY ?AUTO_9703 ?AUTO_9705 ) ( not ( = ?AUTO_9703 ?AUTO_9704 ) ) ( IN-AIRPLANE ?AUTO_9702 ?AUTO_9707 ) ( AIRPLANE-AT ?AUTO_9707 ?AUTO_9704 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9702 ?AUTO_9707 ?AUTO_9704 )
      ( DELIVER-PKG ?AUTO_9702 ?AUTO_9703 )
      ( DELIVER-PKG-VERIFY ?AUTO_9702 ?AUTO_9703 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9708 - OBJ
      ?AUTO_9709 - LOCATION
    )
    :vars
    (
      ?AUTO_9711 - TRUCK
      ?AUTO_9710 - LOCATION
      ?AUTO_9712 - CITY
      ?AUTO_9713 - AIRPLANE
      ?AUTO_9714 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9711 ?AUTO_9710 ) ( IN-CITY ?AUTO_9710 ?AUTO_9712 ) ( IN-CITY ?AUTO_9709 ?AUTO_9712 ) ( not ( = ?AUTO_9709 ?AUTO_9710 ) ) ( IN-AIRPLANE ?AUTO_9708 ?AUTO_9713 ) ( AIRPORT ?AUTO_9714 ) ( AIRPORT ?AUTO_9710 ) ( AIRPLANE-AT ?AUTO_9713 ?AUTO_9714 ) ( not ( = ?AUTO_9714 ?AUTO_9710 ) ) ( not ( = ?AUTO_9709 ?AUTO_9714 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9713 ?AUTO_9714 ?AUTO_9710 )
      ( DELIVER-PKG ?AUTO_9708 ?AUTO_9709 )
      ( DELIVER-PKG-VERIFY ?AUTO_9708 ?AUTO_9709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9717 - OBJ
      ?AUTO_9718 - LOCATION
    )
    :vars
    (
      ?AUTO_9723 - TRUCK
      ?AUTO_9721 - LOCATION
      ?AUTO_9719 - CITY
      ?AUTO_9720 - LOCATION
      ?AUTO_9722 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9723 ?AUTO_9721 ) ( IN-CITY ?AUTO_9721 ?AUTO_9719 ) ( IN-CITY ?AUTO_9718 ?AUTO_9719 ) ( not ( = ?AUTO_9718 ?AUTO_9721 ) ) ( AIRPORT ?AUTO_9720 ) ( AIRPORT ?AUTO_9721 ) ( AIRPLANE-AT ?AUTO_9722 ?AUTO_9720 ) ( not ( = ?AUTO_9720 ?AUTO_9721 ) ) ( not ( = ?AUTO_9718 ?AUTO_9720 ) ) ( OBJ-AT ?AUTO_9717 ?AUTO_9720 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9717 ?AUTO_9722 ?AUTO_9720 )
      ( DELIVER-PKG ?AUTO_9717 ?AUTO_9718 )
      ( DELIVER-PKG-VERIFY ?AUTO_9717 ?AUTO_9718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9724 - OBJ
      ?AUTO_9725 - LOCATION
    )
    :vars
    (
      ?AUTO_9729 - TRUCK
      ?AUTO_9727 - LOCATION
      ?AUTO_9728 - CITY
      ?AUTO_9726 - LOCATION
      ?AUTO_9731 - LOCATION
      ?AUTO_9730 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9729 ?AUTO_9727 ) ( IN-CITY ?AUTO_9727 ?AUTO_9728 ) ( IN-CITY ?AUTO_9725 ?AUTO_9728 ) ( not ( = ?AUTO_9725 ?AUTO_9727 ) ) ( AIRPORT ?AUTO_9726 ) ( AIRPORT ?AUTO_9727 ) ( not ( = ?AUTO_9726 ?AUTO_9727 ) ) ( not ( = ?AUTO_9725 ?AUTO_9726 ) ) ( OBJ-AT ?AUTO_9724 ?AUTO_9726 ) ( AIRPORT ?AUTO_9731 ) ( AIRPLANE-AT ?AUTO_9730 ?AUTO_9731 ) ( not ( = ?AUTO_9731 ?AUTO_9726 ) ) ( not ( = ?AUTO_9725 ?AUTO_9731 ) ) ( not ( = ?AUTO_9727 ?AUTO_9731 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9730 ?AUTO_9731 ?AUTO_9726 )
      ( DELIVER-PKG ?AUTO_9724 ?AUTO_9725 )
      ( DELIVER-PKG-VERIFY ?AUTO_9724 ?AUTO_9725 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9734 - OBJ
      ?AUTO_9735 - LOCATION
    )
    :vars
    (
      ?AUTO_9739 - TRUCK
      ?AUTO_9740 - LOCATION
      ?AUTO_9736 - CITY
      ?AUTO_9738 - LOCATION
      ?AUTO_9741 - LOCATION
      ?AUTO_9737 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9739 ?AUTO_9740 ) ( IN-CITY ?AUTO_9740 ?AUTO_9736 ) ( IN-CITY ?AUTO_9735 ?AUTO_9736 ) ( not ( = ?AUTO_9735 ?AUTO_9740 ) ) ( AIRPORT ?AUTO_9738 ) ( AIRPORT ?AUTO_9740 ) ( not ( = ?AUTO_9738 ?AUTO_9740 ) ) ( not ( = ?AUTO_9735 ?AUTO_9738 ) ) ( OBJ-AT ?AUTO_9734 ?AUTO_9738 ) ( AIRPORT ?AUTO_9741 ) ( not ( = ?AUTO_9741 ?AUTO_9738 ) ) ( not ( = ?AUTO_9735 ?AUTO_9741 ) ) ( not ( = ?AUTO_9740 ?AUTO_9741 ) ) ( AIRPLANE-AT ?AUTO_9737 ?AUTO_9740 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9737 ?AUTO_9740 ?AUTO_9741 )
      ( DELIVER-PKG ?AUTO_9734 ?AUTO_9735 )
      ( DELIVER-PKG-VERIFY ?AUTO_9734 ?AUTO_9735 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9746 - OBJ
      ?AUTO_9747 - LOCATION
    )
    :vars
    (
      ?AUTO_9753 - LOCATION
      ?AUTO_9752 - CITY
      ?AUTO_9749 - LOCATION
      ?AUTO_9748 - LOCATION
      ?AUTO_9750 - AIRPLANE
      ?AUTO_9751 - TRUCK
      ?AUTO_9754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9753 ?AUTO_9752 ) ( IN-CITY ?AUTO_9747 ?AUTO_9752 ) ( not ( = ?AUTO_9747 ?AUTO_9753 ) ) ( AIRPORT ?AUTO_9749 ) ( AIRPORT ?AUTO_9753 ) ( not ( = ?AUTO_9749 ?AUTO_9753 ) ) ( not ( = ?AUTO_9747 ?AUTO_9749 ) ) ( OBJ-AT ?AUTO_9746 ?AUTO_9749 ) ( AIRPORT ?AUTO_9748 ) ( not ( = ?AUTO_9748 ?AUTO_9749 ) ) ( not ( = ?AUTO_9747 ?AUTO_9748 ) ) ( not ( = ?AUTO_9753 ?AUTO_9748 ) ) ( AIRPLANE-AT ?AUTO_9750 ?AUTO_9753 ) ( TRUCK-AT ?AUTO_9751 ?AUTO_9754 ) ( IN-CITY ?AUTO_9754 ?AUTO_9752 ) ( not ( = ?AUTO_9753 ?AUTO_9754 ) ) ( not ( = ?AUTO_9747 ?AUTO_9754 ) ) ( not ( = ?AUTO_9749 ?AUTO_9754 ) ) ( not ( = ?AUTO_9748 ?AUTO_9754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9751 ?AUTO_9754 ?AUTO_9753 ?AUTO_9752 )
      ( DELIVER-PKG ?AUTO_9746 ?AUTO_9747 )
      ( DELIVER-PKG-VERIFY ?AUTO_9746 ?AUTO_9747 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9779 - OBJ
      ?AUTO_9780 - LOCATION
    )
    :vars
    (
      ?AUTO_9782 - TRUCK
      ?AUTO_9785 - LOCATION
      ?AUTO_9783 - CITY
      ?AUTO_9781 - LOCATION
      ?AUTO_9786 - LOCATION
      ?AUTO_9784 - AIRPLANE
      ?AUTO_9787 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9782 ?AUTO_9785 ) ( IN-CITY ?AUTO_9785 ?AUTO_9783 ) ( IN-CITY ?AUTO_9780 ?AUTO_9783 ) ( not ( = ?AUTO_9780 ?AUTO_9785 ) ) ( AIRPORT ?AUTO_9781 ) ( AIRPORT ?AUTO_9785 ) ( not ( = ?AUTO_9781 ?AUTO_9785 ) ) ( not ( = ?AUTO_9780 ?AUTO_9781 ) ) ( AIRPORT ?AUTO_9786 ) ( not ( = ?AUTO_9786 ?AUTO_9781 ) ) ( not ( = ?AUTO_9780 ?AUTO_9786 ) ) ( not ( = ?AUTO_9785 ?AUTO_9786 ) ) ( AIRPLANE-AT ?AUTO_9784 ?AUTO_9785 ) ( TRUCK-AT ?AUTO_9787 ?AUTO_9781 ) ( IN-TRUCK ?AUTO_9779 ?AUTO_9787 ) ( not ( = ?AUTO_9782 ?AUTO_9787 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9779 ?AUTO_9787 ?AUTO_9781 )
      ( DELIVER-PKG ?AUTO_9779 ?AUTO_9780 )
      ( DELIVER-PKG-VERIFY ?AUTO_9779 ?AUTO_9780 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9822 - OBJ
      ?AUTO_9823 - LOCATION
    )
    :vars
    (
      ?AUTO_9825 - LOCATION
      ?AUTO_9826 - CITY
      ?AUTO_9829 - LOCATION
      ?AUTO_9828 - TRUCK
      ?AUTO_9824 - TRUCK
      ?AUTO_9827 - LOCATION
      ?AUTO_9830 - CITY
      ?AUTO_9832 - LOCATION
      ?AUTO_9831 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9825 ?AUTO_9826 ) ( IN-CITY ?AUTO_9823 ?AUTO_9826 ) ( not ( = ?AUTO_9823 ?AUTO_9825 ) ) ( AIRPORT ?AUTO_9829 ) ( AIRPORT ?AUTO_9825 ) ( not ( = ?AUTO_9829 ?AUTO_9825 ) ) ( not ( = ?AUTO_9823 ?AUTO_9829 ) ) ( not ( = ?AUTO_9828 ?AUTO_9824 ) ) ( TRUCK-AT ?AUTO_9824 ?AUTO_9827 ) ( IN-CITY ?AUTO_9827 ?AUTO_9830 ) ( IN-CITY ?AUTO_9829 ?AUTO_9830 ) ( not ( = ?AUTO_9829 ?AUTO_9827 ) ) ( not ( = ?AUTO_9823 ?AUTO_9827 ) ) ( not ( = ?AUTO_9825 ?AUTO_9827 ) ) ( not ( = ?AUTO_9826 ?AUTO_9830 ) ) ( TRUCK-AT ?AUTO_9828 ?AUTO_9832 ) ( IN-CITY ?AUTO_9832 ?AUTO_9826 ) ( not ( = ?AUTO_9825 ?AUTO_9832 ) ) ( not ( = ?AUTO_9823 ?AUTO_9832 ) ) ( not ( = ?AUTO_9829 ?AUTO_9832 ) ) ( not ( = ?AUTO_9827 ?AUTO_9832 ) ) ( AIRPLANE-AT ?AUTO_9831 ?AUTO_9829 ) ( OBJ-AT ?AUTO_9822 ?AUTO_9827 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9822 ?AUTO_9824 ?AUTO_9827 )
      ( DELIVER-PKG ?AUTO_9822 ?AUTO_9823 )
      ( DELIVER-PKG-VERIFY ?AUTO_9822 ?AUTO_9823 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9833 - OBJ
      ?AUTO_9834 - LOCATION
    )
    :vars
    (
      ?AUTO_9835 - LOCATION
      ?AUTO_9836 - CITY
      ?AUTO_9839 - LOCATION
      ?AUTO_9838 - TRUCK
      ?AUTO_9841 - TRUCK
      ?AUTO_9837 - LOCATION
      ?AUTO_9843 - CITY
      ?AUTO_9842 - LOCATION
      ?AUTO_9840 - AIRPLANE
      ?AUTO_9844 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9835 ?AUTO_9836 ) ( IN-CITY ?AUTO_9834 ?AUTO_9836 ) ( not ( = ?AUTO_9834 ?AUTO_9835 ) ) ( AIRPORT ?AUTO_9839 ) ( AIRPORT ?AUTO_9835 ) ( not ( = ?AUTO_9839 ?AUTO_9835 ) ) ( not ( = ?AUTO_9834 ?AUTO_9839 ) ) ( not ( = ?AUTO_9838 ?AUTO_9841 ) ) ( IN-CITY ?AUTO_9837 ?AUTO_9843 ) ( IN-CITY ?AUTO_9839 ?AUTO_9843 ) ( not ( = ?AUTO_9839 ?AUTO_9837 ) ) ( not ( = ?AUTO_9834 ?AUTO_9837 ) ) ( not ( = ?AUTO_9835 ?AUTO_9837 ) ) ( not ( = ?AUTO_9836 ?AUTO_9843 ) ) ( TRUCK-AT ?AUTO_9838 ?AUTO_9842 ) ( IN-CITY ?AUTO_9842 ?AUTO_9836 ) ( not ( = ?AUTO_9835 ?AUTO_9842 ) ) ( not ( = ?AUTO_9834 ?AUTO_9842 ) ) ( not ( = ?AUTO_9839 ?AUTO_9842 ) ) ( not ( = ?AUTO_9837 ?AUTO_9842 ) ) ( AIRPLANE-AT ?AUTO_9840 ?AUTO_9839 ) ( OBJ-AT ?AUTO_9833 ?AUTO_9837 ) ( TRUCK-AT ?AUTO_9841 ?AUTO_9844 ) ( IN-CITY ?AUTO_9844 ?AUTO_9843 ) ( not ( = ?AUTO_9837 ?AUTO_9844 ) ) ( not ( = ?AUTO_9834 ?AUTO_9844 ) ) ( not ( = ?AUTO_9835 ?AUTO_9844 ) ) ( not ( = ?AUTO_9839 ?AUTO_9844 ) ) ( not ( = ?AUTO_9842 ?AUTO_9844 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9841 ?AUTO_9844 ?AUTO_9837 ?AUTO_9843 )
      ( DELIVER-PKG ?AUTO_9833 ?AUTO_9834 )
      ( DELIVER-PKG-VERIFY ?AUTO_9833 ?AUTO_9834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9865 - OBJ
      ?AUTO_9866 - LOCATION
    )
    :vars
    (
      ?AUTO_9867 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9865 ?AUTO_9867 ) ( AIRPLANE-AT ?AUTO_9867 ?AUTO_9866 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9865 ?AUTO_9867 ?AUTO_9866 )
      ( DELIVER-PKG-VERIFY ?AUTO_9865 ?AUTO_9866 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9876 - OBJ
      ?AUTO_9877 - LOCATION
    )
    :vars
    (
      ?AUTO_9878 - AIRPLANE
      ?AUTO_9879 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9876 ?AUTO_9878 ) ( AIRPORT ?AUTO_9879 ) ( AIRPORT ?AUTO_9877 ) ( AIRPLANE-AT ?AUTO_9878 ?AUTO_9879 ) ( not ( = ?AUTO_9879 ?AUTO_9877 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9878 ?AUTO_9879 ?AUTO_9877 )
      ( DELIVER-PKG ?AUTO_9876 ?AUTO_9877 )
      ( DELIVER-PKG-VERIFY ?AUTO_9876 ?AUTO_9877 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9888 - OBJ
      ?AUTO_9889 - LOCATION
    )
    :vars
    (
      ?AUTO_9890 - LOCATION
      ?AUTO_9891 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9890 ) ( AIRPORT ?AUTO_9889 ) ( AIRPLANE-AT ?AUTO_9891 ?AUTO_9890 ) ( not ( = ?AUTO_9890 ?AUTO_9889 ) ) ( OBJ-AT ?AUTO_9888 ?AUTO_9890 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9888 ?AUTO_9891 ?AUTO_9890 )
      ( DELIVER-PKG ?AUTO_9888 ?AUTO_9889 )
      ( DELIVER-PKG-VERIFY ?AUTO_9888 ?AUTO_9889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9928 - OBJ
      ?AUTO_9929 - LOCATION
    )
    :vars
    (
      ?AUTO_9932 - LOCATION
      ?AUTO_9930 - LOCATION
      ?AUTO_9931 - AIRPLANE
      ?AUTO_9933 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9932 ) ( AIRPORT ?AUTO_9929 ) ( not ( = ?AUTO_9932 ?AUTO_9929 ) ) ( AIRPORT ?AUTO_9930 ) ( AIRPLANE-AT ?AUTO_9931 ?AUTO_9930 ) ( not ( = ?AUTO_9930 ?AUTO_9932 ) ) ( not ( = ?AUTO_9929 ?AUTO_9930 ) ) ( TRUCK-AT ?AUTO_9933 ?AUTO_9932 ) ( IN-TRUCK ?AUTO_9928 ?AUTO_9933 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9928 ?AUTO_9933 ?AUTO_9932 )
      ( DELIVER-PKG ?AUTO_9928 ?AUTO_9929 )
      ( DELIVER-PKG-VERIFY ?AUTO_9928 ?AUTO_9929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9938 - OBJ
      ?AUTO_9939 - LOCATION
    )
    :vars
    (
      ?AUTO_9943 - LOCATION
      ?AUTO_9940 - LOCATION
      ?AUTO_9942 - AIRPLANE
      ?AUTO_9941 - TRUCK
      ?AUTO_9944 - LOCATION
      ?AUTO_9945 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9943 ) ( AIRPORT ?AUTO_9939 ) ( not ( = ?AUTO_9943 ?AUTO_9939 ) ) ( AIRPORT ?AUTO_9940 ) ( AIRPLANE-AT ?AUTO_9942 ?AUTO_9940 ) ( not ( = ?AUTO_9940 ?AUTO_9943 ) ) ( not ( = ?AUTO_9939 ?AUTO_9940 ) ) ( IN-TRUCK ?AUTO_9938 ?AUTO_9941 ) ( TRUCK-AT ?AUTO_9941 ?AUTO_9944 ) ( IN-CITY ?AUTO_9944 ?AUTO_9945 ) ( IN-CITY ?AUTO_9943 ?AUTO_9945 ) ( not ( = ?AUTO_9943 ?AUTO_9944 ) ) ( not ( = ?AUTO_9939 ?AUTO_9944 ) ) ( not ( = ?AUTO_9940 ?AUTO_9944 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9941 ?AUTO_9944 ?AUTO_9943 ?AUTO_9945 )
      ( DELIVER-PKG ?AUTO_9938 ?AUTO_9939 )
      ( DELIVER-PKG-VERIFY ?AUTO_9938 ?AUTO_9939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10000 - OBJ
      ?AUTO_10001 - LOCATION
    )
    :vars
    (
      ?AUTO_10002 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10000 ?AUTO_10002 ) ( AIRPLANE-AT ?AUTO_10002 ?AUTO_10001 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10000 ?AUTO_10002 ?AUTO_10001 )
      ( DELIVER-PKG-VERIFY ?AUTO_10000 ?AUTO_10001 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10003 - OBJ
      ?AUTO_10004 - LOCATION
    )
    :vars
    (
      ?AUTO_10005 - AIRPLANE
      ?AUTO_10006 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10003 ?AUTO_10005 ) ( AIRPORT ?AUTO_10006 ) ( AIRPORT ?AUTO_10004 ) ( AIRPLANE-AT ?AUTO_10005 ?AUTO_10006 ) ( not ( = ?AUTO_10006 ?AUTO_10004 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10005 ?AUTO_10006 ?AUTO_10004 )
      ( DELIVER-PKG ?AUTO_10003 ?AUTO_10004 )
      ( DELIVER-PKG-VERIFY ?AUTO_10003 ?AUTO_10004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10015 - OBJ
      ?AUTO_10016 - LOCATION
    )
    :vars
    (
      ?AUTO_10017 - LOCATION
      ?AUTO_10018 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10017 ) ( AIRPORT ?AUTO_10016 ) ( AIRPLANE-AT ?AUTO_10018 ?AUTO_10017 ) ( not ( = ?AUTO_10017 ?AUTO_10016 ) ) ( OBJ-AT ?AUTO_10015 ?AUTO_10017 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10015 ?AUTO_10018 ?AUTO_10017 )
      ( DELIVER-PKG ?AUTO_10015 ?AUTO_10016 )
      ( DELIVER-PKG-VERIFY ?AUTO_10015 ?AUTO_10016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10019 - OBJ
      ?AUTO_10020 - LOCATION
    )
    :vars
    (
      ?AUTO_10021 - LOCATION
      ?AUTO_10023 - LOCATION
      ?AUTO_10022 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10021 ) ( AIRPORT ?AUTO_10020 ) ( not ( = ?AUTO_10021 ?AUTO_10020 ) ) ( OBJ-AT ?AUTO_10019 ?AUTO_10021 ) ( AIRPORT ?AUTO_10023 ) ( AIRPLANE-AT ?AUTO_10022 ?AUTO_10023 ) ( not ( = ?AUTO_10023 ?AUTO_10021 ) ) ( not ( = ?AUTO_10020 ?AUTO_10023 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10022 ?AUTO_10023 ?AUTO_10021 )
      ( DELIVER-PKG ?AUTO_10019 ?AUTO_10020 )
      ( DELIVER-PKG-VERIFY ?AUTO_10019 ?AUTO_10020 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10030 - OBJ
      ?AUTO_10031 - LOCATION
    )
    :vars
    (
      ?AUTO_10032 - LOCATION
      ?AUTO_10034 - LOCATION
      ?AUTO_10033 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10032 ) ( AIRPORT ?AUTO_10031 ) ( not ( = ?AUTO_10032 ?AUTO_10031 ) ) ( OBJ-AT ?AUTO_10030 ?AUTO_10032 ) ( AIRPORT ?AUTO_10034 ) ( not ( = ?AUTO_10034 ?AUTO_10032 ) ) ( not ( = ?AUTO_10031 ?AUTO_10034 ) ) ( AIRPLANE-AT ?AUTO_10033 ?AUTO_10031 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10033 ?AUTO_10031 ?AUTO_10034 )
      ( DELIVER-PKG ?AUTO_10030 ?AUTO_10031 )
      ( DELIVER-PKG-VERIFY ?AUTO_10030 ?AUTO_10031 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10103 - OBJ
      ?AUTO_10104 - LOCATION
    )
    :vars
    (
      ?AUTO_10105 - LOCATION
      ?AUTO_10109 - AIRPLANE
      ?AUTO_10107 - TRUCK
      ?AUTO_10106 - LOCATION
      ?AUTO_10108 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10105 ) ( AIRPORT ?AUTO_10104 ) ( not ( = ?AUTO_10105 ?AUTO_10104 ) ) ( AIRPLANE-AT ?AUTO_10109 ?AUTO_10104 ) ( TRUCK-AT ?AUTO_10107 ?AUTO_10106 ) ( IN-CITY ?AUTO_10106 ?AUTO_10108 ) ( IN-CITY ?AUTO_10105 ?AUTO_10108 ) ( not ( = ?AUTO_10105 ?AUTO_10106 ) ) ( not ( = ?AUTO_10104 ?AUTO_10106 ) ) ( OBJ-AT ?AUTO_10103 ?AUTO_10106 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10103 ?AUTO_10107 ?AUTO_10106 )
      ( DELIVER-PKG ?AUTO_10103 ?AUTO_10104 )
      ( DELIVER-PKG-VERIFY ?AUTO_10103 ?AUTO_10104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10110 - OBJ
      ?AUTO_10111 - LOCATION
    )
    :vars
    (
      ?AUTO_10114 - LOCATION
      ?AUTO_10115 - AIRPLANE
      ?AUTO_10112 - LOCATION
      ?AUTO_10113 - CITY
      ?AUTO_10116 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10114 ) ( AIRPORT ?AUTO_10111 ) ( not ( = ?AUTO_10114 ?AUTO_10111 ) ) ( AIRPLANE-AT ?AUTO_10115 ?AUTO_10111 ) ( IN-CITY ?AUTO_10112 ?AUTO_10113 ) ( IN-CITY ?AUTO_10114 ?AUTO_10113 ) ( not ( = ?AUTO_10114 ?AUTO_10112 ) ) ( not ( = ?AUTO_10111 ?AUTO_10112 ) ) ( OBJ-AT ?AUTO_10110 ?AUTO_10112 ) ( TRUCK-AT ?AUTO_10116 ?AUTO_10114 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10116 ?AUTO_10114 ?AUTO_10112 ?AUTO_10113 )
      ( DELIVER-PKG ?AUTO_10110 ?AUTO_10111 )
      ( DELIVER-PKG-VERIFY ?AUTO_10110 ?AUTO_10111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10145 - OBJ
      ?AUTO_10146 - LOCATION
    )
    :vars
    (
      ?AUTO_10147 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10147 ?AUTO_10146 ) ( IN-TRUCK ?AUTO_10145 ?AUTO_10147 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10145 ?AUTO_10147 ?AUTO_10146 )
      ( DELIVER-PKG-VERIFY ?AUTO_10145 ?AUTO_10146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10148 - OBJ
      ?AUTO_10149 - LOCATION
    )
    :vars
    (
      ?AUTO_10150 - TRUCK
      ?AUTO_10151 - LOCATION
      ?AUTO_10152 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10148 ?AUTO_10150 ) ( TRUCK-AT ?AUTO_10150 ?AUTO_10151 ) ( IN-CITY ?AUTO_10151 ?AUTO_10152 ) ( IN-CITY ?AUTO_10149 ?AUTO_10152 ) ( not ( = ?AUTO_10149 ?AUTO_10151 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10150 ?AUTO_10151 ?AUTO_10149 ?AUTO_10152 )
      ( DELIVER-PKG ?AUTO_10148 ?AUTO_10149 )
      ( DELIVER-PKG-VERIFY ?AUTO_10148 ?AUTO_10149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10153 - OBJ
      ?AUTO_10154 - LOCATION
    )
    :vars
    (
      ?AUTO_10155 - TRUCK
      ?AUTO_10156 - LOCATION
      ?AUTO_10157 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10155 ?AUTO_10156 ) ( IN-CITY ?AUTO_10156 ?AUTO_10157 ) ( IN-CITY ?AUTO_10154 ?AUTO_10157 ) ( not ( = ?AUTO_10154 ?AUTO_10156 ) ) ( OBJ-AT ?AUTO_10153 ?AUTO_10156 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10153 ?AUTO_10155 ?AUTO_10156 )
      ( DELIVER-PKG ?AUTO_10153 ?AUTO_10154 )
      ( DELIVER-PKG-VERIFY ?AUTO_10153 ?AUTO_10154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10158 - OBJ
      ?AUTO_10159 - LOCATION
    )
    :vars
    (
      ?AUTO_10161 - TRUCK
      ?AUTO_10160 - LOCATION
      ?AUTO_10162 - CITY
      ?AUTO_10163 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10161 ?AUTO_10160 ) ( IN-CITY ?AUTO_10160 ?AUTO_10162 ) ( IN-CITY ?AUTO_10159 ?AUTO_10162 ) ( not ( = ?AUTO_10159 ?AUTO_10160 ) ) ( IN-AIRPLANE ?AUTO_10158 ?AUTO_10163 ) ( AIRPLANE-AT ?AUTO_10163 ?AUTO_10160 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10158 ?AUTO_10163 ?AUTO_10160 )
      ( DELIVER-PKG ?AUTO_10158 ?AUTO_10159 )
      ( DELIVER-PKG-VERIFY ?AUTO_10158 ?AUTO_10159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10164 - OBJ
      ?AUTO_10165 - LOCATION
    )
    :vars
    (
      ?AUTO_10167 - TRUCK
      ?AUTO_10168 - LOCATION
      ?AUTO_10166 - CITY
      ?AUTO_10169 - AIRPLANE
      ?AUTO_10170 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10167 ?AUTO_10168 ) ( IN-CITY ?AUTO_10168 ?AUTO_10166 ) ( IN-CITY ?AUTO_10165 ?AUTO_10166 ) ( not ( = ?AUTO_10165 ?AUTO_10168 ) ) ( IN-AIRPLANE ?AUTO_10164 ?AUTO_10169 ) ( AIRPORT ?AUTO_10170 ) ( AIRPORT ?AUTO_10168 ) ( AIRPLANE-AT ?AUTO_10169 ?AUTO_10170 ) ( not ( = ?AUTO_10170 ?AUTO_10168 ) ) ( not ( = ?AUTO_10165 ?AUTO_10170 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10169 ?AUTO_10170 ?AUTO_10168 )
      ( DELIVER-PKG ?AUTO_10164 ?AUTO_10165 )
      ( DELIVER-PKG-VERIFY ?AUTO_10164 ?AUTO_10165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10179 - OBJ
      ?AUTO_10180 - LOCATION
    )
    :vars
    (
      ?AUTO_10185 - TRUCK
      ?AUTO_10181 - LOCATION
      ?AUTO_10182 - CITY
      ?AUTO_10183 - LOCATION
      ?AUTO_10184 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10185 ?AUTO_10181 ) ( IN-CITY ?AUTO_10181 ?AUTO_10182 ) ( IN-CITY ?AUTO_10180 ?AUTO_10182 ) ( not ( = ?AUTO_10180 ?AUTO_10181 ) ) ( AIRPORT ?AUTO_10183 ) ( AIRPORT ?AUTO_10181 ) ( AIRPLANE-AT ?AUTO_10184 ?AUTO_10183 ) ( not ( = ?AUTO_10183 ?AUTO_10181 ) ) ( not ( = ?AUTO_10180 ?AUTO_10183 ) ) ( OBJ-AT ?AUTO_10179 ?AUTO_10183 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10179 ?AUTO_10184 ?AUTO_10183 )
      ( DELIVER-PKG ?AUTO_10179 ?AUTO_10180 )
      ( DELIVER-PKG-VERIFY ?AUTO_10179 ?AUTO_10180 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10186 - OBJ
      ?AUTO_10187 - LOCATION
    )
    :vars
    (
      ?AUTO_10192 - TRUCK
      ?AUTO_10188 - LOCATION
      ?AUTO_10189 - CITY
      ?AUTO_10190 - LOCATION
      ?AUTO_10193 - LOCATION
      ?AUTO_10191 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10192 ?AUTO_10188 ) ( IN-CITY ?AUTO_10188 ?AUTO_10189 ) ( IN-CITY ?AUTO_10187 ?AUTO_10189 ) ( not ( = ?AUTO_10187 ?AUTO_10188 ) ) ( AIRPORT ?AUTO_10190 ) ( AIRPORT ?AUTO_10188 ) ( not ( = ?AUTO_10190 ?AUTO_10188 ) ) ( not ( = ?AUTO_10187 ?AUTO_10190 ) ) ( OBJ-AT ?AUTO_10186 ?AUTO_10190 ) ( AIRPORT ?AUTO_10193 ) ( AIRPLANE-AT ?AUTO_10191 ?AUTO_10193 ) ( not ( = ?AUTO_10193 ?AUTO_10190 ) ) ( not ( = ?AUTO_10187 ?AUTO_10193 ) ) ( not ( = ?AUTO_10188 ?AUTO_10193 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10191 ?AUTO_10193 ?AUTO_10190 )
      ( DELIVER-PKG ?AUTO_10186 ?AUTO_10187 )
      ( DELIVER-PKG-VERIFY ?AUTO_10186 ?AUTO_10187 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10200 - OBJ
      ?AUTO_10201 - LOCATION
    )
    :vars
    (
      ?AUTO_10202 - TRUCK
      ?AUTO_10204 - LOCATION
      ?AUTO_10207 - CITY
      ?AUTO_10206 - LOCATION
      ?AUTO_10203 - LOCATION
      ?AUTO_10205 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10202 ?AUTO_10204 ) ( IN-CITY ?AUTO_10204 ?AUTO_10207 ) ( IN-CITY ?AUTO_10201 ?AUTO_10207 ) ( not ( = ?AUTO_10201 ?AUTO_10204 ) ) ( AIRPORT ?AUTO_10206 ) ( AIRPORT ?AUTO_10204 ) ( not ( = ?AUTO_10206 ?AUTO_10204 ) ) ( not ( = ?AUTO_10201 ?AUTO_10206 ) ) ( OBJ-AT ?AUTO_10200 ?AUTO_10206 ) ( AIRPORT ?AUTO_10203 ) ( not ( = ?AUTO_10203 ?AUTO_10206 ) ) ( not ( = ?AUTO_10201 ?AUTO_10203 ) ) ( not ( = ?AUTO_10204 ?AUTO_10203 ) ) ( AIRPLANE-AT ?AUTO_10205 ?AUTO_10204 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10205 ?AUTO_10204 ?AUTO_10203 )
      ( DELIVER-PKG ?AUTO_10200 ?AUTO_10201 )
      ( DELIVER-PKG-VERIFY ?AUTO_10200 ?AUTO_10201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10238 - OBJ
      ?AUTO_10239 - LOCATION
    )
    :vars
    (
      ?AUTO_10243 - LOCATION
      ?AUTO_10244 - CITY
      ?AUTO_10242 - LOCATION
      ?AUTO_10241 - LOCATION
      ?AUTO_10245 - AIRPLANE
      ?AUTO_10240 - TRUCK
      ?AUTO_10246 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10243 ?AUTO_10244 ) ( IN-CITY ?AUTO_10239 ?AUTO_10244 ) ( not ( = ?AUTO_10239 ?AUTO_10243 ) ) ( AIRPORT ?AUTO_10242 ) ( AIRPORT ?AUTO_10243 ) ( not ( = ?AUTO_10242 ?AUTO_10243 ) ) ( not ( = ?AUTO_10239 ?AUTO_10242 ) ) ( OBJ-AT ?AUTO_10238 ?AUTO_10242 ) ( AIRPORT ?AUTO_10241 ) ( AIRPLANE-AT ?AUTO_10245 ?AUTO_10241 ) ( not ( = ?AUTO_10241 ?AUTO_10242 ) ) ( not ( = ?AUTO_10239 ?AUTO_10241 ) ) ( not ( = ?AUTO_10243 ?AUTO_10241 ) ) ( TRUCK-AT ?AUTO_10240 ?AUTO_10246 ) ( IN-CITY ?AUTO_10246 ?AUTO_10244 ) ( not ( = ?AUTO_10243 ?AUTO_10246 ) ) ( not ( = ?AUTO_10239 ?AUTO_10246 ) ) ( not ( = ?AUTO_10242 ?AUTO_10246 ) ) ( not ( = ?AUTO_10241 ?AUTO_10246 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10240 ?AUTO_10246 ?AUTO_10243 ?AUTO_10244 )
      ( DELIVER-PKG ?AUTO_10238 ?AUTO_10239 )
      ( DELIVER-PKG-VERIFY ?AUTO_10238 ?AUTO_10239 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10279 - OBJ
      ?AUTO_10280 - LOCATION
    )
    :vars
    (
      ?AUTO_10284 - LOCATION
      ?AUTO_10281 - CITY
      ?AUTO_10287 - LOCATION
      ?AUTO_10286 - LOCATION
      ?AUTO_10282 - AIRPLANE
      ?AUTO_10285 - TRUCK
      ?AUTO_10283 - LOCATION
      ?AUTO_10288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10284 ?AUTO_10281 ) ( IN-CITY ?AUTO_10280 ?AUTO_10281 ) ( not ( = ?AUTO_10280 ?AUTO_10284 ) ) ( AIRPORT ?AUTO_10287 ) ( AIRPORT ?AUTO_10284 ) ( not ( = ?AUTO_10287 ?AUTO_10284 ) ) ( not ( = ?AUTO_10280 ?AUTO_10287 ) ) ( AIRPORT ?AUTO_10286 ) ( not ( = ?AUTO_10286 ?AUTO_10287 ) ) ( not ( = ?AUTO_10280 ?AUTO_10286 ) ) ( not ( = ?AUTO_10284 ?AUTO_10286 ) ) ( AIRPLANE-AT ?AUTO_10282 ?AUTO_10284 ) ( TRUCK-AT ?AUTO_10285 ?AUTO_10283 ) ( IN-CITY ?AUTO_10283 ?AUTO_10281 ) ( not ( = ?AUTO_10284 ?AUTO_10283 ) ) ( not ( = ?AUTO_10280 ?AUTO_10283 ) ) ( not ( = ?AUTO_10287 ?AUTO_10283 ) ) ( not ( = ?AUTO_10286 ?AUTO_10283 ) ) ( TRUCK-AT ?AUTO_10288 ?AUTO_10287 ) ( IN-TRUCK ?AUTO_10279 ?AUTO_10288 ) ( not ( = ?AUTO_10285 ?AUTO_10288 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10279 ?AUTO_10288 ?AUTO_10287 )
      ( DELIVER-PKG ?AUTO_10279 ?AUTO_10280 )
      ( DELIVER-PKG-VERIFY ?AUTO_10279 ?AUTO_10280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10291 - OBJ
      ?AUTO_10292 - LOCATION
    )
    :vars
    (
      ?AUTO_10293 - LOCATION
      ?AUTO_10297 - CITY
      ?AUTO_10294 - LOCATION
      ?AUTO_10298 - AIRPLANE
      ?AUTO_10296 - TRUCK
      ?AUTO_10301 - TRUCK
      ?AUTO_10299 - LOCATION
      ?AUTO_10295 - CITY
      ?AUTO_10300 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10293 ?AUTO_10297 ) ( IN-CITY ?AUTO_10292 ?AUTO_10297 ) ( not ( = ?AUTO_10292 ?AUTO_10293 ) ) ( AIRPORT ?AUTO_10294 ) ( AIRPORT ?AUTO_10293 ) ( not ( = ?AUTO_10294 ?AUTO_10293 ) ) ( not ( = ?AUTO_10292 ?AUTO_10294 ) ) ( AIRPLANE-AT ?AUTO_10298 ?AUTO_10293 ) ( not ( = ?AUTO_10296 ?AUTO_10301 ) ) ( TRUCK-AT ?AUTO_10301 ?AUTO_10299 ) ( IN-CITY ?AUTO_10299 ?AUTO_10295 ) ( IN-CITY ?AUTO_10294 ?AUTO_10295 ) ( not ( = ?AUTO_10294 ?AUTO_10299 ) ) ( not ( = ?AUTO_10292 ?AUTO_10299 ) ) ( not ( = ?AUTO_10293 ?AUTO_10299 ) ) ( not ( = ?AUTO_10297 ?AUTO_10295 ) ) ( TRUCK-AT ?AUTO_10296 ?AUTO_10300 ) ( IN-CITY ?AUTO_10300 ?AUTO_10297 ) ( not ( = ?AUTO_10293 ?AUTO_10300 ) ) ( not ( = ?AUTO_10292 ?AUTO_10300 ) ) ( not ( = ?AUTO_10294 ?AUTO_10300 ) ) ( not ( = ?AUTO_10299 ?AUTO_10300 ) ) ( OBJ-AT ?AUTO_10291 ?AUTO_10299 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10291 ?AUTO_10301 ?AUTO_10299 )
      ( DELIVER-PKG ?AUTO_10291 ?AUTO_10292 )
      ( DELIVER-PKG-VERIFY ?AUTO_10291 ?AUTO_10292 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10302 - OBJ
      ?AUTO_10303 - LOCATION
    )
    :vars
    (
      ?AUTO_10304 - LOCATION
      ?AUTO_10305 - CITY
      ?AUTO_10311 - LOCATION
      ?AUTO_10306 - AIRPLANE
      ?AUTO_10312 - TRUCK
      ?AUTO_10309 - TRUCK
      ?AUTO_10307 - LOCATION
      ?AUTO_10308 - CITY
      ?AUTO_10310 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10304 ?AUTO_10305 ) ( IN-CITY ?AUTO_10303 ?AUTO_10305 ) ( not ( = ?AUTO_10303 ?AUTO_10304 ) ) ( AIRPORT ?AUTO_10311 ) ( AIRPORT ?AUTO_10304 ) ( not ( = ?AUTO_10311 ?AUTO_10304 ) ) ( not ( = ?AUTO_10303 ?AUTO_10311 ) ) ( AIRPLANE-AT ?AUTO_10306 ?AUTO_10304 ) ( not ( = ?AUTO_10312 ?AUTO_10309 ) ) ( IN-CITY ?AUTO_10307 ?AUTO_10308 ) ( IN-CITY ?AUTO_10311 ?AUTO_10308 ) ( not ( = ?AUTO_10311 ?AUTO_10307 ) ) ( not ( = ?AUTO_10303 ?AUTO_10307 ) ) ( not ( = ?AUTO_10304 ?AUTO_10307 ) ) ( not ( = ?AUTO_10305 ?AUTO_10308 ) ) ( TRUCK-AT ?AUTO_10312 ?AUTO_10310 ) ( IN-CITY ?AUTO_10310 ?AUTO_10305 ) ( not ( = ?AUTO_10304 ?AUTO_10310 ) ) ( not ( = ?AUTO_10303 ?AUTO_10310 ) ) ( not ( = ?AUTO_10311 ?AUTO_10310 ) ) ( not ( = ?AUTO_10307 ?AUTO_10310 ) ) ( OBJ-AT ?AUTO_10302 ?AUTO_10307 ) ( TRUCK-AT ?AUTO_10309 ?AUTO_10311 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10309 ?AUTO_10311 ?AUTO_10307 ?AUTO_10308 )
      ( DELIVER-PKG ?AUTO_10302 ?AUTO_10303 )
      ( DELIVER-PKG-VERIFY ?AUTO_10302 ?AUTO_10303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10315 - OBJ
      ?AUTO_10316 - LOCATION
    )
    :vars
    (
      ?AUTO_10317 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10317 ?AUTO_10316 ) ( IN-TRUCK ?AUTO_10315 ?AUTO_10317 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10315 ?AUTO_10317 ?AUTO_10316 )
      ( DELIVER-PKG-VERIFY ?AUTO_10315 ?AUTO_10316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10318 - OBJ
      ?AUTO_10319 - LOCATION
    )
    :vars
    (
      ?AUTO_10320 - TRUCK
      ?AUTO_10321 - LOCATION
      ?AUTO_10322 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10318 ?AUTO_10320 ) ( TRUCK-AT ?AUTO_10320 ?AUTO_10321 ) ( IN-CITY ?AUTO_10321 ?AUTO_10322 ) ( IN-CITY ?AUTO_10319 ?AUTO_10322 ) ( not ( = ?AUTO_10319 ?AUTO_10321 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10320 ?AUTO_10321 ?AUTO_10319 ?AUTO_10322 )
      ( DELIVER-PKG ?AUTO_10318 ?AUTO_10319 )
      ( DELIVER-PKG-VERIFY ?AUTO_10318 ?AUTO_10319 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10323 - OBJ
      ?AUTO_10324 - LOCATION
    )
    :vars
    (
      ?AUTO_10325 - TRUCK
      ?AUTO_10326 - LOCATION
      ?AUTO_10327 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10325 ?AUTO_10326 ) ( IN-CITY ?AUTO_10326 ?AUTO_10327 ) ( IN-CITY ?AUTO_10324 ?AUTO_10327 ) ( not ( = ?AUTO_10324 ?AUTO_10326 ) ) ( OBJ-AT ?AUTO_10323 ?AUTO_10326 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10323 ?AUTO_10325 ?AUTO_10326 )
      ( DELIVER-PKG ?AUTO_10323 ?AUTO_10324 )
      ( DELIVER-PKG-VERIFY ?AUTO_10323 ?AUTO_10324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10328 - OBJ
      ?AUTO_10329 - LOCATION
    )
    :vars
    (
      ?AUTO_10330 - LOCATION
      ?AUTO_10332 - CITY
      ?AUTO_10331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10330 ?AUTO_10332 ) ( IN-CITY ?AUTO_10329 ?AUTO_10332 ) ( not ( = ?AUTO_10329 ?AUTO_10330 ) ) ( OBJ-AT ?AUTO_10328 ?AUTO_10330 ) ( TRUCK-AT ?AUTO_10331 ?AUTO_10329 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10331 ?AUTO_10329 ?AUTO_10330 ?AUTO_10332 )
      ( DELIVER-PKG ?AUTO_10328 ?AUTO_10329 )
      ( DELIVER-PKG-VERIFY ?AUTO_10328 ?AUTO_10329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10345 - OBJ
      ?AUTO_10346 - LOCATION
    )
    :vars
    (
      ?AUTO_10347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10347 ?AUTO_10346 ) ( IN-TRUCK ?AUTO_10345 ?AUTO_10347 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10345 ?AUTO_10347 ?AUTO_10346 )
      ( DELIVER-PKG-VERIFY ?AUTO_10345 ?AUTO_10346 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10348 - OBJ
      ?AUTO_10349 - LOCATION
    )
    :vars
    (
      ?AUTO_10350 - TRUCK
      ?AUTO_10351 - LOCATION
      ?AUTO_10352 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10348 ?AUTO_10350 ) ( TRUCK-AT ?AUTO_10350 ?AUTO_10351 ) ( IN-CITY ?AUTO_10351 ?AUTO_10352 ) ( IN-CITY ?AUTO_10349 ?AUTO_10352 ) ( not ( = ?AUTO_10349 ?AUTO_10351 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10350 ?AUTO_10351 ?AUTO_10349 ?AUTO_10352 )
      ( DELIVER-PKG ?AUTO_10348 ?AUTO_10349 )
      ( DELIVER-PKG-VERIFY ?AUTO_10348 ?AUTO_10349 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10357 - OBJ
      ?AUTO_10358 - LOCATION
    )
    :vars
    (
      ?AUTO_10361 - TRUCK
      ?AUTO_10359 - LOCATION
      ?AUTO_10360 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10361 ?AUTO_10359 ) ( IN-CITY ?AUTO_10359 ?AUTO_10360 ) ( IN-CITY ?AUTO_10358 ?AUTO_10360 ) ( not ( = ?AUTO_10358 ?AUTO_10359 ) ) ( OBJ-AT ?AUTO_10357 ?AUTO_10359 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10357 ?AUTO_10361 ?AUTO_10359 )
      ( DELIVER-PKG ?AUTO_10357 ?AUTO_10358 )
      ( DELIVER-PKG-VERIFY ?AUTO_10357 ?AUTO_10358 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10362 - OBJ
      ?AUTO_10363 - LOCATION
    )
    :vars
    (
      ?AUTO_10364 - LOCATION
      ?AUTO_10365 - CITY
      ?AUTO_10366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10364 ?AUTO_10365 ) ( IN-CITY ?AUTO_10363 ?AUTO_10365 ) ( not ( = ?AUTO_10363 ?AUTO_10364 ) ) ( OBJ-AT ?AUTO_10362 ?AUTO_10364 ) ( TRUCK-AT ?AUTO_10366 ?AUTO_10363 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10366 ?AUTO_10363 ?AUTO_10364 ?AUTO_10365 )
      ( DELIVER-PKG ?AUTO_10362 ?AUTO_10363 )
      ( DELIVER-PKG-VERIFY ?AUTO_10362 ?AUTO_10363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10387 - OBJ
      ?AUTO_10388 - LOCATION
    )
    :vars
    (
      ?AUTO_10389 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10389 ?AUTO_10388 ) ( IN-TRUCK ?AUTO_10387 ?AUTO_10389 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10387 ?AUTO_10389 ?AUTO_10388 )
      ( DELIVER-PKG-VERIFY ?AUTO_10387 ?AUTO_10388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10396 - OBJ
      ?AUTO_10397 - LOCATION
    )
    :vars
    (
      ?AUTO_10399 - TRUCK
      ?AUTO_10400 - LOCATION
      ?AUTO_10398 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10399 ?AUTO_10400 ) ( IN-CITY ?AUTO_10400 ?AUTO_10398 ) ( IN-CITY ?AUTO_10397 ?AUTO_10398 ) ( not ( = ?AUTO_10397 ?AUTO_10400 ) ) ( OBJ-AT ?AUTO_10396 ?AUTO_10400 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10396 ?AUTO_10399 ?AUTO_10400 )
      ( DELIVER-PKG ?AUTO_10396 ?AUTO_10397 )
      ( DELIVER-PKG-VERIFY ?AUTO_10396 ?AUTO_10397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10425 - OBJ
      ?AUTO_10426 - LOCATION
    )
    :vars
    (
      ?AUTO_10427 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10427 ?AUTO_10426 ) ( IN-TRUCK ?AUTO_10425 ?AUTO_10427 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10425 ?AUTO_10427 ?AUTO_10426 )
      ( DELIVER-PKG-VERIFY ?AUTO_10425 ?AUTO_10426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10434 - OBJ
      ?AUTO_10435 - LOCATION
    )
    :vars
    (
      ?AUTO_10437 - TRUCK
      ?AUTO_10438 - LOCATION
      ?AUTO_10436 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10437 ?AUTO_10438 ) ( IN-CITY ?AUTO_10438 ?AUTO_10436 ) ( IN-CITY ?AUTO_10435 ?AUTO_10436 ) ( not ( = ?AUTO_10435 ?AUTO_10438 ) ) ( OBJ-AT ?AUTO_10434 ?AUTO_10438 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10434 ?AUTO_10437 ?AUTO_10438 )
      ( DELIVER-PKG ?AUTO_10434 ?AUTO_10435 )
      ( DELIVER-PKG-VERIFY ?AUTO_10434 ?AUTO_10435 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10465 - OBJ
      ?AUTO_10466 - LOCATION
    )
    :vars
    (
      ?AUTO_10467 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10465 ?AUTO_10467 ) ( AIRPLANE-AT ?AUTO_10467 ?AUTO_10466 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10465 ?AUTO_10467 ?AUTO_10466 )
      ( DELIVER-PKG-VERIFY ?AUTO_10465 ?AUTO_10466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10468 - OBJ
      ?AUTO_10469 - LOCATION
    )
    :vars
    (
      ?AUTO_10470 - AIRPLANE
      ?AUTO_10471 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10468 ?AUTO_10470 ) ( AIRPORT ?AUTO_10471 ) ( AIRPORT ?AUTO_10469 ) ( AIRPLANE-AT ?AUTO_10470 ?AUTO_10471 ) ( not ( = ?AUTO_10471 ?AUTO_10469 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10470 ?AUTO_10471 ?AUTO_10469 )
      ( DELIVER-PKG ?AUTO_10468 ?AUTO_10469 )
      ( DELIVER-PKG-VERIFY ?AUTO_10468 ?AUTO_10469 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10472 - OBJ
      ?AUTO_10473 - LOCATION
    )
    :vars
    (
      ?AUTO_10475 - LOCATION
      ?AUTO_10474 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10475 ) ( AIRPORT ?AUTO_10473 ) ( AIRPLANE-AT ?AUTO_10474 ?AUTO_10475 ) ( not ( = ?AUTO_10475 ?AUTO_10473 ) ) ( OBJ-AT ?AUTO_10472 ?AUTO_10475 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10472 ?AUTO_10474 ?AUTO_10475 )
      ( DELIVER-PKG ?AUTO_10472 ?AUTO_10473 )
      ( DELIVER-PKG-VERIFY ?AUTO_10472 ?AUTO_10473 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10476 - OBJ
      ?AUTO_10477 - LOCATION
    )
    :vars
    (
      ?AUTO_10479 - LOCATION
      ?AUTO_10480 - LOCATION
      ?AUTO_10478 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10479 ) ( AIRPORT ?AUTO_10477 ) ( not ( = ?AUTO_10479 ?AUTO_10477 ) ) ( OBJ-AT ?AUTO_10476 ?AUTO_10479 ) ( AIRPORT ?AUTO_10480 ) ( AIRPLANE-AT ?AUTO_10478 ?AUTO_10480 ) ( not ( = ?AUTO_10480 ?AUTO_10479 ) ) ( not ( = ?AUTO_10477 ?AUTO_10480 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10478 ?AUTO_10480 ?AUTO_10479 )
      ( DELIVER-PKG ?AUTO_10476 ?AUTO_10477 )
      ( DELIVER-PKG-VERIFY ?AUTO_10476 ?AUTO_10477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10505 - OBJ
      ?AUTO_10506 - LOCATION
    )
    :vars
    (
      ?AUTO_10508 - LOCATION
      ?AUTO_10509 - LOCATION
      ?AUTO_10507 - AIRPLANE
      ?AUTO_10510 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10508 ) ( AIRPORT ?AUTO_10506 ) ( not ( = ?AUTO_10508 ?AUTO_10506 ) ) ( AIRPORT ?AUTO_10509 ) ( AIRPLANE-AT ?AUTO_10507 ?AUTO_10509 ) ( not ( = ?AUTO_10509 ?AUTO_10508 ) ) ( not ( = ?AUTO_10506 ?AUTO_10509 ) ) ( TRUCK-AT ?AUTO_10510 ?AUTO_10508 ) ( IN-TRUCK ?AUTO_10505 ?AUTO_10510 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10505 ?AUTO_10510 ?AUTO_10508 )
      ( DELIVER-PKG ?AUTO_10505 ?AUTO_10506 )
      ( DELIVER-PKG-VERIFY ?AUTO_10505 ?AUTO_10506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10511 - OBJ
      ?AUTO_10512 - LOCATION
    )
    :vars
    (
      ?AUTO_10513 - LOCATION
      ?AUTO_10515 - LOCATION
      ?AUTO_10514 - AIRPLANE
      ?AUTO_10516 - TRUCK
      ?AUTO_10517 - LOCATION
      ?AUTO_10518 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10513 ) ( AIRPORT ?AUTO_10512 ) ( not ( = ?AUTO_10513 ?AUTO_10512 ) ) ( AIRPORT ?AUTO_10515 ) ( AIRPLANE-AT ?AUTO_10514 ?AUTO_10515 ) ( not ( = ?AUTO_10515 ?AUTO_10513 ) ) ( not ( = ?AUTO_10512 ?AUTO_10515 ) ) ( IN-TRUCK ?AUTO_10511 ?AUTO_10516 ) ( TRUCK-AT ?AUTO_10516 ?AUTO_10517 ) ( IN-CITY ?AUTO_10517 ?AUTO_10518 ) ( IN-CITY ?AUTO_10513 ?AUTO_10518 ) ( not ( = ?AUTO_10513 ?AUTO_10517 ) ) ( not ( = ?AUTO_10512 ?AUTO_10517 ) ) ( not ( = ?AUTO_10515 ?AUTO_10517 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10516 ?AUTO_10517 ?AUTO_10513 ?AUTO_10518 )
      ( DELIVER-PKG ?AUTO_10511 ?AUTO_10512 )
      ( DELIVER-PKG-VERIFY ?AUTO_10511 ?AUTO_10512 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10519 - OBJ
      ?AUTO_10520 - LOCATION
    )
    :vars
    (
      ?AUTO_10521 - LOCATION
      ?AUTO_10526 - LOCATION
      ?AUTO_10523 - AIRPLANE
      ?AUTO_10522 - TRUCK
      ?AUTO_10525 - LOCATION
      ?AUTO_10524 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10521 ) ( AIRPORT ?AUTO_10520 ) ( not ( = ?AUTO_10521 ?AUTO_10520 ) ) ( AIRPORT ?AUTO_10526 ) ( AIRPLANE-AT ?AUTO_10523 ?AUTO_10526 ) ( not ( = ?AUTO_10526 ?AUTO_10521 ) ) ( not ( = ?AUTO_10520 ?AUTO_10526 ) ) ( TRUCK-AT ?AUTO_10522 ?AUTO_10525 ) ( IN-CITY ?AUTO_10525 ?AUTO_10524 ) ( IN-CITY ?AUTO_10521 ?AUTO_10524 ) ( not ( = ?AUTO_10521 ?AUTO_10525 ) ) ( not ( = ?AUTO_10520 ?AUTO_10525 ) ) ( not ( = ?AUTO_10526 ?AUTO_10525 ) ) ( OBJ-AT ?AUTO_10519 ?AUTO_10525 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10519 ?AUTO_10522 ?AUTO_10525 )
      ( DELIVER-PKG ?AUTO_10519 ?AUTO_10520 )
      ( DELIVER-PKG-VERIFY ?AUTO_10519 ?AUTO_10520 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10527 - OBJ
      ?AUTO_10528 - LOCATION
    )
    :vars
    (
      ?AUTO_10529 - LOCATION
      ?AUTO_10532 - LOCATION
      ?AUTO_10533 - AIRPLANE
      ?AUTO_10531 - LOCATION
      ?AUTO_10534 - CITY
      ?AUTO_10530 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10529 ) ( AIRPORT ?AUTO_10528 ) ( not ( = ?AUTO_10529 ?AUTO_10528 ) ) ( AIRPORT ?AUTO_10532 ) ( AIRPLANE-AT ?AUTO_10533 ?AUTO_10532 ) ( not ( = ?AUTO_10532 ?AUTO_10529 ) ) ( not ( = ?AUTO_10528 ?AUTO_10532 ) ) ( IN-CITY ?AUTO_10531 ?AUTO_10534 ) ( IN-CITY ?AUTO_10529 ?AUTO_10534 ) ( not ( = ?AUTO_10529 ?AUTO_10531 ) ) ( not ( = ?AUTO_10528 ?AUTO_10531 ) ) ( not ( = ?AUTO_10532 ?AUTO_10531 ) ) ( OBJ-AT ?AUTO_10527 ?AUTO_10531 ) ( TRUCK-AT ?AUTO_10530 ?AUTO_10529 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10530 ?AUTO_10529 ?AUTO_10531 ?AUTO_10534 )
      ( DELIVER-PKG ?AUTO_10527 ?AUTO_10528 )
      ( DELIVER-PKG-VERIFY ?AUTO_10527 ?AUTO_10528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10547 - OBJ
      ?AUTO_10548 - LOCATION
    )
    :vars
    (
      ?AUTO_10549 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10549 ?AUTO_10548 ) ( IN-TRUCK ?AUTO_10547 ?AUTO_10549 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10547 ?AUTO_10549 ?AUTO_10548 )
      ( DELIVER-PKG-VERIFY ?AUTO_10547 ?AUTO_10548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10550 - OBJ
      ?AUTO_10551 - LOCATION
    )
    :vars
    (
      ?AUTO_10552 - TRUCK
      ?AUTO_10553 - LOCATION
      ?AUTO_10554 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10550 ?AUTO_10552 ) ( TRUCK-AT ?AUTO_10552 ?AUTO_10553 ) ( IN-CITY ?AUTO_10553 ?AUTO_10554 ) ( IN-CITY ?AUTO_10551 ?AUTO_10554 ) ( not ( = ?AUTO_10551 ?AUTO_10553 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10552 ?AUTO_10553 ?AUTO_10551 ?AUTO_10554 )
      ( DELIVER-PKG ?AUTO_10550 ?AUTO_10551 )
      ( DELIVER-PKG-VERIFY ?AUTO_10550 ?AUTO_10551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10555 - OBJ
      ?AUTO_10556 - LOCATION
    )
    :vars
    (
      ?AUTO_10557 - TRUCK
      ?AUTO_10558 - LOCATION
      ?AUTO_10559 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10557 ?AUTO_10558 ) ( IN-CITY ?AUTO_10558 ?AUTO_10559 ) ( IN-CITY ?AUTO_10556 ?AUTO_10559 ) ( not ( = ?AUTO_10556 ?AUTO_10558 ) ) ( OBJ-AT ?AUTO_10555 ?AUTO_10558 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10555 ?AUTO_10557 ?AUTO_10558 )
      ( DELIVER-PKG ?AUTO_10555 ?AUTO_10556 )
      ( DELIVER-PKG-VERIFY ?AUTO_10555 ?AUTO_10556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10562 - OBJ
      ?AUTO_10563 - LOCATION
    )
    :vars
    (
      ?AUTO_10564 - TRUCK
      ?AUTO_10566 - LOCATION
      ?AUTO_10565 - CITY
      ?AUTO_10567 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10564 ?AUTO_10566 ) ( IN-CITY ?AUTO_10566 ?AUTO_10565 ) ( IN-CITY ?AUTO_10563 ?AUTO_10565 ) ( not ( = ?AUTO_10563 ?AUTO_10566 ) ) ( IN-AIRPLANE ?AUTO_10562 ?AUTO_10567 ) ( AIRPLANE-AT ?AUTO_10567 ?AUTO_10566 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10562 ?AUTO_10567 ?AUTO_10566 )
      ( DELIVER-PKG ?AUTO_10562 ?AUTO_10563 )
      ( DELIVER-PKG-VERIFY ?AUTO_10562 ?AUTO_10563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10568 - OBJ
      ?AUTO_10569 - LOCATION
    )
    :vars
    (
      ?AUTO_10570 - TRUCK
      ?AUTO_10572 - LOCATION
      ?AUTO_10571 - CITY
      ?AUTO_10573 - AIRPLANE
      ?AUTO_10574 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10570 ?AUTO_10572 ) ( IN-CITY ?AUTO_10572 ?AUTO_10571 ) ( IN-CITY ?AUTO_10569 ?AUTO_10571 ) ( not ( = ?AUTO_10569 ?AUTO_10572 ) ) ( IN-AIRPLANE ?AUTO_10568 ?AUTO_10573 ) ( AIRPORT ?AUTO_10574 ) ( AIRPORT ?AUTO_10572 ) ( AIRPLANE-AT ?AUTO_10573 ?AUTO_10574 ) ( not ( = ?AUTO_10574 ?AUTO_10572 ) ) ( not ( = ?AUTO_10569 ?AUTO_10574 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10573 ?AUTO_10574 ?AUTO_10572 )
      ( DELIVER-PKG ?AUTO_10568 ?AUTO_10569 )
      ( DELIVER-PKG-VERIFY ?AUTO_10568 ?AUTO_10569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10575 - OBJ
      ?AUTO_10576 - LOCATION
    )
    :vars
    (
      ?AUTO_10578 - TRUCK
      ?AUTO_10580 - LOCATION
      ?AUTO_10579 - CITY
      ?AUTO_10581 - LOCATION
      ?AUTO_10577 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10578 ?AUTO_10580 ) ( IN-CITY ?AUTO_10580 ?AUTO_10579 ) ( IN-CITY ?AUTO_10576 ?AUTO_10579 ) ( not ( = ?AUTO_10576 ?AUTO_10580 ) ) ( AIRPORT ?AUTO_10581 ) ( AIRPORT ?AUTO_10580 ) ( AIRPLANE-AT ?AUTO_10577 ?AUTO_10581 ) ( not ( = ?AUTO_10581 ?AUTO_10580 ) ) ( not ( = ?AUTO_10576 ?AUTO_10581 ) ) ( OBJ-AT ?AUTO_10575 ?AUTO_10581 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10575 ?AUTO_10577 ?AUTO_10581 )
      ( DELIVER-PKG ?AUTO_10575 ?AUTO_10576 )
      ( DELIVER-PKG-VERIFY ?AUTO_10575 ?AUTO_10576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10582 - OBJ
      ?AUTO_10583 - LOCATION
    )
    :vars
    (
      ?AUTO_10588 - TRUCK
      ?AUTO_10585 - LOCATION
      ?AUTO_10584 - CITY
      ?AUTO_10586 - LOCATION
      ?AUTO_10589 - LOCATION
      ?AUTO_10587 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10588 ?AUTO_10585 ) ( IN-CITY ?AUTO_10585 ?AUTO_10584 ) ( IN-CITY ?AUTO_10583 ?AUTO_10584 ) ( not ( = ?AUTO_10583 ?AUTO_10585 ) ) ( AIRPORT ?AUTO_10586 ) ( AIRPORT ?AUTO_10585 ) ( not ( = ?AUTO_10586 ?AUTO_10585 ) ) ( not ( = ?AUTO_10583 ?AUTO_10586 ) ) ( OBJ-AT ?AUTO_10582 ?AUTO_10586 ) ( AIRPORT ?AUTO_10589 ) ( AIRPLANE-AT ?AUTO_10587 ?AUTO_10589 ) ( not ( = ?AUTO_10589 ?AUTO_10586 ) ) ( not ( = ?AUTO_10583 ?AUTO_10589 ) ) ( not ( = ?AUTO_10585 ?AUTO_10589 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10587 ?AUTO_10589 ?AUTO_10586 )
      ( DELIVER-PKG ?AUTO_10582 ?AUTO_10583 )
      ( DELIVER-PKG-VERIFY ?AUTO_10582 ?AUTO_10583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10614 - OBJ
      ?AUTO_10615 - LOCATION
    )
    :vars
    (
      ?AUTO_10620 - TRUCK
      ?AUTO_10617 - LOCATION
      ?AUTO_10621 - CITY
      ?AUTO_10616 - LOCATION
      ?AUTO_10618 - LOCATION
      ?AUTO_10619 - AIRPLANE
      ?AUTO_10622 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10620 ?AUTO_10617 ) ( IN-CITY ?AUTO_10617 ?AUTO_10621 ) ( IN-CITY ?AUTO_10615 ?AUTO_10621 ) ( not ( = ?AUTO_10615 ?AUTO_10617 ) ) ( AIRPORT ?AUTO_10616 ) ( AIRPORT ?AUTO_10617 ) ( not ( = ?AUTO_10616 ?AUTO_10617 ) ) ( not ( = ?AUTO_10615 ?AUTO_10616 ) ) ( AIRPORT ?AUTO_10618 ) ( AIRPLANE-AT ?AUTO_10619 ?AUTO_10618 ) ( not ( = ?AUTO_10618 ?AUTO_10616 ) ) ( not ( = ?AUTO_10615 ?AUTO_10618 ) ) ( not ( = ?AUTO_10617 ?AUTO_10618 ) ) ( TRUCK-AT ?AUTO_10622 ?AUTO_10616 ) ( IN-TRUCK ?AUTO_10614 ?AUTO_10622 ) ( not ( = ?AUTO_10620 ?AUTO_10622 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10614 ?AUTO_10622 ?AUTO_10616 )
      ( DELIVER-PKG ?AUTO_10614 ?AUTO_10615 )
      ( DELIVER-PKG-VERIFY ?AUTO_10614 ?AUTO_10615 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10623 - OBJ
      ?AUTO_10624 - LOCATION
    )
    :vars
    (
      ?AUTO_10629 - TRUCK
      ?AUTO_10627 - LOCATION
      ?AUTO_10628 - CITY
      ?AUTO_10626 - LOCATION
      ?AUTO_10630 - LOCATION
      ?AUTO_10631 - AIRPLANE
      ?AUTO_10625 - TRUCK
      ?AUTO_10632 - LOCATION
      ?AUTO_10633 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10629 ?AUTO_10627 ) ( IN-CITY ?AUTO_10627 ?AUTO_10628 ) ( IN-CITY ?AUTO_10624 ?AUTO_10628 ) ( not ( = ?AUTO_10624 ?AUTO_10627 ) ) ( AIRPORT ?AUTO_10626 ) ( AIRPORT ?AUTO_10627 ) ( not ( = ?AUTO_10626 ?AUTO_10627 ) ) ( not ( = ?AUTO_10624 ?AUTO_10626 ) ) ( AIRPORT ?AUTO_10630 ) ( AIRPLANE-AT ?AUTO_10631 ?AUTO_10630 ) ( not ( = ?AUTO_10630 ?AUTO_10626 ) ) ( not ( = ?AUTO_10624 ?AUTO_10630 ) ) ( not ( = ?AUTO_10627 ?AUTO_10630 ) ) ( IN-TRUCK ?AUTO_10623 ?AUTO_10625 ) ( not ( = ?AUTO_10629 ?AUTO_10625 ) ) ( TRUCK-AT ?AUTO_10625 ?AUTO_10632 ) ( IN-CITY ?AUTO_10632 ?AUTO_10633 ) ( IN-CITY ?AUTO_10626 ?AUTO_10633 ) ( not ( = ?AUTO_10626 ?AUTO_10632 ) ) ( not ( = ?AUTO_10624 ?AUTO_10632 ) ) ( not ( = ?AUTO_10627 ?AUTO_10632 ) ) ( not ( = ?AUTO_10628 ?AUTO_10633 ) ) ( not ( = ?AUTO_10630 ?AUTO_10632 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10625 ?AUTO_10632 ?AUTO_10626 ?AUTO_10633 )
      ( DELIVER-PKG ?AUTO_10623 ?AUTO_10624 )
      ( DELIVER-PKG-VERIFY ?AUTO_10623 ?AUTO_10624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10634 - OBJ
      ?AUTO_10635 - LOCATION
    )
    :vars
    (
      ?AUTO_10642 - TRUCK
      ?AUTO_10644 - LOCATION
      ?AUTO_10643 - CITY
      ?AUTO_10636 - LOCATION
      ?AUTO_10639 - LOCATION
      ?AUTO_10640 - AIRPLANE
      ?AUTO_10637 - TRUCK
      ?AUTO_10641 - LOCATION
      ?AUTO_10638 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10642 ?AUTO_10644 ) ( IN-CITY ?AUTO_10644 ?AUTO_10643 ) ( IN-CITY ?AUTO_10635 ?AUTO_10643 ) ( not ( = ?AUTO_10635 ?AUTO_10644 ) ) ( AIRPORT ?AUTO_10636 ) ( AIRPORT ?AUTO_10644 ) ( not ( = ?AUTO_10636 ?AUTO_10644 ) ) ( not ( = ?AUTO_10635 ?AUTO_10636 ) ) ( AIRPORT ?AUTO_10639 ) ( AIRPLANE-AT ?AUTO_10640 ?AUTO_10639 ) ( not ( = ?AUTO_10639 ?AUTO_10636 ) ) ( not ( = ?AUTO_10635 ?AUTO_10639 ) ) ( not ( = ?AUTO_10644 ?AUTO_10639 ) ) ( not ( = ?AUTO_10642 ?AUTO_10637 ) ) ( TRUCK-AT ?AUTO_10637 ?AUTO_10641 ) ( IN-CITY ?AUTO_10641 ?AUTO_10638 ) ( IN-CITY ?AUTO_10636 ?AUTO_10638 ) ( not ( = ?AUTO_10636 ?AUTO_10641 ) ) ( not ( = ?AUTO_10635 ?AUTO_10641 ) ) ( not ( = ?AUTO_10644 ?AUTO_10641 ) ) ( not ( = ?AUTO_10643 ?AUTO_10638 ) ) ( not ( = ?AUTO_10639 ?AUTO_10641 ) ) ( OBJ-AT ?AUTO_10634 ?AUTO_10641 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10634 ?AUTO_10637 ?AUTO_10641 )
      ( DELIVER-PKG ?AUTO_10634 ?AUTO_10635 )
      ( DELIVER-PKG-VERIFY ?AUTO_10634 ?AUTO_10635 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10645 - OBJ
      ?AUTO_10646 - LOCATION
    )
    :vars
    (
      ?AUTO_10653 - TRUCK
      ?AUTO_10655 - LOCATION
      ?AUTO_10652 - CITY
      ?AUTO_10649 - LOCATION
      ?AUTO_10651 - LOCATION
      ?AUTO_10647 - AIRPLANE
      ?AUTO_10648 - TRUCK
      ?AUTO_10650 - LOCATION
      ?AUTO_10654 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10653 ?AUTO_10655 ) ( IN-CITY ?AUTO_10655 ?AUTO_10652 ) ( IN-CITY ?AUTO_10646 ?AUTO_10652 ) ( not ( = ?AUTO_10646 ?AUTO_10655 ) ) ( AIRPORT ?AUTO_10649 ) ( AIRPORT ?AUTO_10655 ) ( not ( = ?AUTO_10649 ?AUTO_10655 ) ) ( not ( = ?AUTO_10646 ?AUTO_10649 ) ) ( AIRPORT ?AUTO_10651 ) ( AIRPLANE-AT ?AUTO_10647 ?AUTO_10651 ) ( not ( = ?AUTO_10651 ?AUTO_10649 ) ) ( not ( = ?AUTO_10646 ?AUTO_10651 ) ) ( not ( = ?AUTO_10655 ?AUTO_10651 ) ) ( not ( = ?AUTO_10653 ?AUTO_10648 ) ) ( IN-CITY ?AUTO_10650 ?AUTO_10654 ) ( IN-CITY ?AUTO_10649 ?AUTO_10654 ) ( not ( = ?AUTO_10649 ?AUTO_10650 ) ) ( not ( = ?AUTO_10646 ?AUTO_10650 ) ) ( not ( = ?AUTO_10655 ?AUTO_10650 ) ) ( not ( = ?AUTO_10652 ?AUTO_10654 ) ) ( not ( = ?AUTO_10651 ?AUTO_10650 ) ) ( OBJ-AT ?AUTO_10645 ?AUTO_10650 ) ( TRUCK-AT ?AUTO_10648 ?AUTO_10649 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10648 ?AUTO_10649 ?AUTO_10650 ?AUTO_10654 )
      ( DELIVER-PKG ?AUTO_10645 ?AUTO_10646 )
      ( DELIVER-PKG-VERIFY ?AUTO_10645 ?AUTO_10646 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10668 - OBJ
      ?AUTO_10669 - LOCATION
    )
    :vars
    (
      ?AUTO_10670 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10668 ?AUTO_10670 ) ( AIRPLANE-AT ?AUTO_10670 ?AUTO_10669 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10668 ?AUTO_10670 ?AUTO_10669 )
      ( DELIVER-PKG-VERIFY ?AUTO_10668 ?AUTO_10669 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10679 - OBJ
      ?AUTO_10680 - LOCATION
    )
    :vars
    (
      ?AUTO_10681 - AIRPLANE
      ?AUTO_10682 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10679 ?AUTO_10681 ) ( AIRPORT ?AUTO_10682 ) ( AIRPORT ?AUTO_10680 ) ( AIRPLANE-AT ?AUTO_10681 ?AUTO_10682 ) ( not ( = ?AUTO_10682 ?AUTO_10680 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10681 ?AUTO_10682 ?AUTO_10680 )
      ( DELIVER-PKG ?AUTO_10679 ?AUTO_10680 )
      ( DELIVER-PKG-VERIFY ?AUTO_10679 ?AUTO_10680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10703 - OBJ
      ?AUTO_10704 - LOCATION
    )
    :vars
    (
      ?AUTO_10707 - LOCATION
      ?AUTO_10706 - LOCATION
      ?AUTO_10705 - AIRPLANE
      ?AUTO_10708 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10707 ) ( AIRPORT ?AUTO_10704 ) ( not ( = ?AUTO_10707 ?AUTO_10704 ) ) ( AIRPORT ?AUTO_10706 ) ( AIRPLANE-AT ?AUTO_10705 ?AUTO_10706 ) ( not ( = ?AUTO_10706 ?AUTO_10707 ) ) ( not ( = ?AUTO_10704 ?AUTO_10706 ) ) ( TRUCK-AT ?AUTO_10708 ?AUTO_10707 ) ( IN-TRUCK ?AUTO_10703 ?AUTO_10708 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10703 ?AUTO_10708 ?AUTO_10707 )
      ( DELIVER-PKG ?AUTO_10703 ?AUTO_10704 )
      ( DELIVER-PKG-VERIFY ?AUTO_10703 ?AUTO_10704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10709 - OBJ
      ?AUTO_10710 - LOCATION
    )
    :vars
    (
      ?AUTO_10713 - LOCATION
      ?AUTO_10711 - LOCATION
      ?AUTO_10714 - AIRPLANE
      ?AUTO_10712 - TRUCK
      ?AUTO_10715 - LOCATION
      ?AUTO_10716 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10713 ) ( AIRPORT ?AUTO_10710 ) ( not ( = ?AUTO_10713 ?AUTO_10710 ) ) ( AIRPORT ?AUTO_10711 ) ( AIRPLANE-AT ?AUTO_10714 ?AUTO_10711 ) ( not ( = ?AUTO_10711 ?AUTO_10713 ) ) ( not ( = ?AUTO_10710 ?AUTO_10711 ) ) ( IN-TRUCK ?AUTO_10709 ?AUTO_10712 ) ( TRUCK-AT ?AUTO_10712 ?AUTO_10715 ) ( IN-CITY ?AUTO_10715 ?AUTO_10716 ) ( IN-CITY ?AUTO_10713 ?AUTO_10716 ) ( not ( = ?AUTO_10713 ?AUTO_10715 ) ) ( not ( = ?AUTO_10710 ?AUTO_10715 ) ) ( not ( = ?AUTO_10711 ?AUTO_10715 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10712 ?AUTO_10715 ?AUTO_10713 ?AUTO_10716 )
      ( DELIVER-PKG ?AUTO_10709 ?AUTO_10710 )
      ( DELIVER-PKG-VERIFY ?AUTO_10709 ?AUTO_10710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10721 - OBJ
      ?AUTO_10722 - LOCATION
    )
    :vars
    (
      ?AUTO_10728 - LOCATION
      ?AUTO_10726 - LOCATION
      ?AUTO_10727 - AIRPLANE
      ?AUTO_10725 - TRUCK
      ?AUTO_10723 - LOCATION
      ?AUTO_10724 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10728 ) ( AIRPORT ?AUTO_10722 ) ( not ( = ?AUTO_10728 ?AUTO_10722 ) ) ( AIRPORT ?AUTO_10726 ) ( AIRPLANE-AT ?AUTO_10727 ?AUTO_10726 ) ( not ( = ?AUTO_10726 ?AUTO_10728 ) ) ( not ( = ?AUTO_10722 ?AUTO_10726 ) ) ( TRUCK-AT ?AUTO_10725 ?AUTO_10723 ) ( IN-CITY ?AUTO_10723 ?AUTO_10724 ) ( IN-CITY ?AUTO_10728 ?AUTO_10724 ) ( not ( = ?AUTO_10728 ?AUTO_10723 ) ) ( not ( = ?AUTO_10722 ?AUTO_10723 ) ) ( not ( = ?AUTO_10726 ?AUTO_10723 ) ) ( OBJ-AT ?AUTO_10721 ?AUTO_10723 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10721 ?AUTO_10725 ?AUTO_10723 )
      ( DELIVER-PKG ?AUTO_10721 ?AUTO_10722 )
      ( DELIVER-PKG-VERIFY ?AUTO_10721 ?AUTO_10722 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10729 - OBJ
      ?AUTO_10730 - LOCATION
    )
    :vars
    (
      ?AUTO_10733 - LOCATION
      ?AUTO_10734 - LOCATION
      ?AUTO_10736 - AIRPLANE
      ?AUTO_10732 - LOCATION
      ?AUTO_10731 - CITY
      ?AUTO_10735 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10733 ) ( AIRPORT ?AUTO_10730 ) ( not ( = ?AUTO_10733 ?AUTO_10730 ) ) ( AIRPORT ?AUTO_10734 ) ( AIRPLANE-AT ?AUTO_10736 ?AUTO_10734 ) ( not ( = ?AUTO_10734 ?AUTO_10733 ) ) ( not ( = ?AUTO_10730 ?AUTO_10734 ) ) ( IN-CITY ?AUTO_10732 ?AUTO_10731 ) ( IN-CITY ?AUTO_10733 ?AUTO_10731 ) ( not ( = ?AUTO_10733 ?AUTO_10732 ) ) ( not ( = ?AUTO_10730 ?AUTO_10732 ) ) ( not ( = ?AUTO_10734 ?AUTO_10732 ) ) ( OBJ-AT ?AUTO_10729 ?AUTO_10732 ) ( TRUCK-AT ?AUTO_10735 ?AUTO_10733 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10735 ?AUTO_10733 ?AUTO_10732 ?AUTO_10731 )
      ( DELIVER-PKG ?AUTO_10729 ?AUTO_10730 )
      ( DELIVER-PKG-VERIFY ?AUTO_10729 ?AUTO_10730 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10757 - OBJ
      ?AUTO_10758 - LOCATION
    )
    :vars
    (
      ?AUTO_10759 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10759 ?AUTO_10758 ) ( IN-TRUCK ?AUTO_10757 ?AUTO_10759 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10757 ?AUTO_10759 ?AUTO_10758 )
      ( DELIVER-PKG-VERIFY ?AUTO_10757 ?AUTO_10758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10764 - OBJ
      ?AUTO_10765 - LOCATION
    )
    :vars
    (
      ?AUTO_10766 - TRUCK
      ?AUTO_10767 - LOCATION
      ?AUTO_10768 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10764 ?AUTO_10766 ) ( TRUCK-AT ?AUTO_10766 ?AUTO_10767 ) ( IN-CITY ?AUTO_10767 ?AUTO_10768 ) ( IN-CITY ?AUTO_10765 ?AUTO_10768 ) ( not ( = ?AUTO_10765 ?AUTO_10767 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10766 ?AUTO_10767 ?AUTO_10765 ?AUTO_10768 )
      ( DELIVER-PKG ?AUTO_10764 ?AUTO_10765 )
      ( DELIVER-PKG-VERIFY ?AUTO_10764 ?AUTO_10765 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10829 - OBJ
      ?AUTO_10830 - LOCATION
    )
    :vars
    (
      ?AUTO_10831 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10831 ?AUTO_10830 ) ( IN-TRUCK ?AUTO_10829 ?AUTO_10831 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10829 ?AUTO_10831 ?AUTO_10830 )
      ( DELIVER-PKG-VERIFY ?AUTO_10829 ?AUTO_10830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10900 - OBJ
      ?AUTO_10901 - LOCATION
    )
    :vars
    (
      ?AUTO_10902 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10900 ?AUTO_10902 ) ( AIRPLANE-AT ?AUTO_10902 ?AUTO_10901 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10900 ?AUTO_10902 ?AUTO_10901 )
      ( DELIVER-PKG-VERIFY ?AUTO_10900 ?AUTO_10901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10911 - OBJ
      ?AUTO_10912 - LOCATION
    )
    :vars
    (
      ?AUTO_10913 - AIRPLANE
      ?AUTO_10914 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10911 ?AUTO_10913 ) ( AIRPORT ?AUTO_10914 ) ( AIRPORT ?AUTO_10912 ) ( AIRPLANE-AT ?AUTO_10913 ?AUTO_10914 ) ( not ( = ?AUTO_10914 ?AUTO_10912 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10913 ?AUTO_10914 ?AUTO_10912 )
      ( DELIVER-PKG ?AUTO_10911 ?AUTO_10912 )
      ( DELIVER-PKG-VERIFY ?AUTO_10911 ?AUTO_10912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10979 - OBJ
      ?AUTO_10980 - LOCATION
    )
    :vars
    (
      ?AUTO_10981 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10979 ?AUTO_10981 ) ( AIRPLANE-AT ?AUTO_10981 ?AUTO_10980 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10979 ?AUTO_10981 ?AUTO_10980 )
      ( DELIVER-PKG-VERIFY ?AUTO_10979 ?AUTO_10980 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10982 - OBJ
      ?AUTO_10983 - LOCATION
    )
    :vars
    (
      ?AUTO_10984 - AIRPLANE
      ?AUTO_10985 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10982 ?AUTO_10984 ) ( AIRPORT ?AUTO_10985 ) ( AIRPORT ?AUTO_10983 ) ( AIRPLANE-AT ?AUTO_10984 ?AUTO_10985 ) ( not ( = ?AUTO_10985 ?AUTO_10983 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10984 ?AUTO_10985 ?AUTO_10983 )
      ( DELIVER-PKG ?AUTO_10982 ?AUTO_10983 )
      ( DELIVER-PKG-VERIFY ?AUTO_10982 ?AUTO_10983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11028 - OBJ
      ?AUTO_11029 - LOCATION
    )
    :vars
    (
      ?AUTO_11034 - TRUCK
      ?AUTO_11032 - LOCATION
      ?AUTO_11035 - CITY
      ?AUTO_11030 - LOCATION
      ?AUTO_11033 - LOCATION
      ?AUTO_11031 - AIRPLANE
      ?AUTO_11036 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11034 ?AUTO_11032 ) ( IN-CITY ?AUTO_11032 ?AUTO_11035 ) ( IN-CITY ?AUTO_11029 ?AUTO_11035 ) ( not ( = ?AUTO_11029 ?AUTO_11032 ) ) ( AIRPORT ?AUTO_11030 ) ( AIRPORT ?AUTO_11032 ) ( not ( = ?AUTO_11030 ?AUTO_11032 ) ) ( not ( = ?AUTO_11029 ?AUTO_11030 ) ) ( AIRPORT ?AUTO_11033 ) ( AIRPLANE-AT ?AUTO_11031 ?AUTO_11033 ) ( not ( = ?AUTO_11033 ?AUTO_11030 ) ) ( not ( = ?AUTO_11029 ?AUTO_11033 ) ) ( not ( = ?AUTO_11032 ?AUTO_11033 ) ) ( TRUCK-AT ?AUTO_11036 ?AUTO_11030 ) ( IN-TRUCK ?AUTO_11028 ?AUTO_11036 ) ( not ( = ?AUTO_11034 ?AUTO_11036 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11028 ?AUTO_11036 ?AUTO_11030 )
      ( DELIVER-PKG ?AUTO_11028 ?AUTO_11029 )
      ( DELIVER-PKG-VERIFY ?AUTO_11028 ?AUTO_11029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11043 - OBJ
      ?AUTO_11044 - LOCATION
    )
    :vars
    (
      ?AUTO_11046 - LOCATION
      ?AUTO_11048 - LOCATION
      ?AUTO_11045 - AIRPLANE
      ?AUTO_11049 - TRUCK
      ?AUTO_11047 - LOCATION
      ?AUTO_11050 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11046 ) ( AIRPORT ?AUTO_11044 ) ( not ( = ?AUTO_11046 ?AUTO_11044 ) ) ( AIRPORT ?AUTO_11048 ) ( AIRPLANE-AT ?AUTO_11045 ?AUTO_11048 ) ( not ( = ?AUTO_11048 ?AUTO_11046 ) ) ( not ( = ?AUTO_11044 ?AUTO_11048 ) ) ( TRUCK-AT ?AUTO_11049 ?AUTO_11047 ) ( IN-CITY ?AUTO_11047 ?AUTO_11050 ) ( IN-CITY ?AUTO_11046 ?AUTO_11050 ) ( not ( = ?AUTO_11046 ?AUTO_11047 ) ) ( not ( = ?AUTO_11044 ?AUTO_11047 ) ) ( not ( = ?AUTO_11048 ?AUTO_11047 ) ) ( OBJ-AT ?AUTO_11043 ?AUTO_11047 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11043 ?AUTO_11049 ?AUTO_11047 )
      ( DELIVER-PKG ?AUTO_11043 ?AUTO_11044 )
      ( DELIVER-PKG-VERIFY ?AUTO_11043 ?AUTO_11044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11075 - OBJ
      ?AUTO_11076 - LOCATION
    )
    :vars
    (
      ?AUTO_11077 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11077 ?AUTO_11076 ) ( IN-TRUCK ?AUTO_11075 ?AUTO_11077 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11075 ?AUTO_11077 ?AUTO_11076 )
      ( DELIVER-PKG-VERIFY ?AUTO_11075 ?AUTO_11076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11086 - OBJ
      ?AUTO_11087 - LOCATION
    )
    :vars
    (
      ?AUTO_11088 - TRUCK
      ?AUTO_11089 - LOCATION
      ?AUTO_11090 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11086 ?AUTO_11088 ) ( TRUCK-AT ?AUTO_11088 ?AUTO_11089 ) ( IN-CITY ?AUTO_11089 ?AUTO_11090 ) ( IN-CITY ?AUTO_11087 ?AUTO_11090 ) ( not ( = ?AUTO_11087 ?AUTO_11089 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11088 ?AUTO_11089 ?AUTO_11087 ?AUTO_11090 )
      ( DELIVER-PKG ?AUTO_11086 ?AUTO_11087 )
      ( DELIVER-PKG-VERIFY ?AUTO_11086 ?AUTO_11087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11091 - OBJ
      ?AUTO_11092 - LOCATION
    )
    :vars
    (
      ?AUTO_11093 - TRUCK
      ?AUTO_11094 - LOCATION
      ?AUTO_11095 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11093 ?AUTO_11094 ) ( IN-CITY ?AUTO_11094 ?AUTO_11095 ) ( IN-CITY ?AUTO_11092 ?AUTO_11095 ) ( not ( = ?AUTO_11092 ?AUTO_11094 ) ) ( OBJ-AT ?AUTO_11091 ?AUTO_11094 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11091 ?AUTO_11093 ?AUTO_11094 )
      ( DELIVER-PKG ?AUTO_11091 ?AUTO_11092 )
      ( DELIVER-PKG-VERIFY ?AUTO_11091 ?AUTO_11092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11102 - OBJ
      ?AUTO_11103 - LOCATION
    )
    :vars
    (
      ?AUTO_11104 - TRUCK
      ?AUTO_11106 - LOCATION
      ?AUTO_11105 - CITY
      ?AUTO_11107 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11104 ?AUTO_11106 ) ( IN-CITY ?AUTO_11106 ?AUTO_11105 ) ( IN-CITY ?AUTO_11103 ?AUTO_11105 ) ( not ( = ?AUTO_11103 ?AUTO_11106 ) ) ( IN-AIRPLANE ?AUTO_11102 ?AUTO_11107 ) ( AIRPLANE-AT ?AUTO_11107 ?AUTO_11106 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11102 ?AUTO_11107 ?AUTO_11106 )
      ( DELIVER-PKG ?AUTO_11102 ?AUTO_11103 )
      ( DELIVER-PKG-VERIFY ?AUTO_11102 ?AUTO_11103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11116 - OBJ
      ?AUTO_11117 - LOCATION
    )
    :vars
    (
      ?AUTO_11118 - TRUCK
      ?AUTO_11119 - LOCATION
      ?AUTO_11120 - CITY
      ?AUTO_11121 - AIRPLANE
      ?AUTO_11122 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11118 ?AUTO_11119 ) ( IN-CITY ?AUTO_11119 ?AUTO_11120 ) ( IN-CITY ?AUTO_11117 ?AUTO_11120 ) ( not ( = ?AUTO_11117 ?AUTO_11119 ) ) ( IN-AIRPLANE ?AUTO_11116 ?AUTO_11121 ) ( AIRPORT ?AUTO_11122 ) ( AIRPORT ?AUTO_11119 ) ( AIRPLANE-AT ?AUTO_11121 ?AUTO_11122 ) ( not ( = ?AUTO_11122 ?AUTO_11119 ) ) ( not ( = ?AUTO_11117 ?AUTO_11122 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11121 ?AUTO_11122 ?AUTO_11119 )
      ( DELIVER-PKG ?AUTO_11116 ?AUTO_11117 )
      ( DELIVER-PKG-VERIFY ?AUTO_11116 ?AUTO_11117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11145 - OBJ
      ?AUTO_11146 - LOCATION
    )
    :vars
    (
      ?AUTO_11150 - TRUCK
      ?AUTO_11151 - LOCATION
      ?AUTO_11152 - CITY
      ?AUTO_11148 - LOCATION
      ?AUTO_11147 - LOCATION
      ?AUTO_11153 - AIRPLANE
      ?AUTO_11149 - TRUCK
      ?AUTO_11154 - LOCATION
      ?AUTO_11155 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11150 ?AUTO_11151 ) ( IN-CITY ?AUTO_11151 ?AUTO_11152 ) ( IN-CITY ?AUTO_11146 ?AUTO_11152 ) ( not ( = ?AUTO_11146 ?AUTO_11151 ) ) ( AIRPORT ?AUTO_11148 ) ( AIRPORT ?AUTO_11151 ) ( not ( = ?AUTO_11148 ?AUTO_11151 ) ) ( not ( = ?AUTO_11146 ?AUTO_11148 ) ) ( AIRPORT ?AUTO_11147 ) ( AIRPLANE-AT ?AUTO_11153 ?AUTO_11147 ) ( not ( = ?AUTO_11147 ?AUTO_11148 ) ) ( not ( = ?AUTO_11146 ?AUTO_11147 ) ) ( not ( = ?AUTO_11151 ?AUTO_11147 ) ) ( IN-TRUCK ?AUTO_11145 ?AUTO_11149 ) ( not ( = ?AUTO_11150 ?AUTO_11149 ) ) ( TRUCK-AT ?AUTO_11149 ?AUTO_11154 ) ( IN-CITY ?AUTO_11154 ?AUTO_11155 ) ( IN-CITY ?AUTO_11148 ?AUTO_11155 ) ( not ( = ?AUTO_11148 ?AUTO_11154 ) ) ( not ( = ?AUTO_11146 ?AUTO_11154 ) ) ( not ( = ?AUTO_11151 ?AUTO_11154 ) ) ( not ( = ?AUTO_11152 ?AUTO_11155 ) ) ( not ( = ?AUTO_11147 ?AUTO_11154 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11149 ?AUTO_11154 ?AUTO_11148 ?AUTO_11155 )
      ( DELIVER-PKG ?AUTO_11145 ?AUTO_11146 )
      ( DELIVER-PKG-VERIFY ?AUTO_11145 ?AUTO_11146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11160 - OBJ
      ?AUTO_11161 - LOCATION
    )
    :vars
    (
      ?AUTO_11162 - TRUCK
      ?AUTO_11164 - LOCATION
      ?AUTO_11165 - CITY
      ?AUTO_11168 - LOCATION
      ?AUTO_11163 - LOCATION
      ?AUTO_11166 - AIRPLANE
      ?AUTO_11167 - TRUCK
      ?AUTO_11169 - LOCATION
      ?AUTO_11170 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11162 ?AUTO_11164 ) ( IN-CITY ?AUTO_11164 ?AUTO_11165 ) ( IN-CITY ?AUTO_11161 ?AUTO_11165 ) ( not ( = ?AUTO_11161 ?AUTO_11164 ) ) ( AIRPORT ?AUTO_11168 ) ( AIRPORT ?AUTO_11164 ) ( not ( = ?AUTO_11168 ?AUTO_11164 ) ) ( not ( = ?AUTO_11161 ?AUTO_11168 ) ) ( AIRPORT ?AUTO_11163 ) ( AIRPLANE-AT ?AUTO_11166 ?AUTO_11163 ) ( not ( = ?AUTO_11163 ?AUTO_11168 ) ) ( not ( = ?AUTO_11161 ?AUTO_11163 ) ) ( not ( = ?AUTO_11164 ?AUTO_11163 ) ) ( not ( = ?AUTO_11162 ?AUTO_11167 ) ) ( TRUCK-AT ?AUTO_11167 ?AUTO_11169 ) ( IN-CITY ?AUTO_11169 ?AUTO_11170 ) ( IN-CITY ?AUTO_11168 ?AUTO_11170 ) ( not ( = ?AUTO_11168 ?AUTO_11169 ) ) ( not ( = ?AUTO_11161 ?AUTO_11169 ) ) ( not ( = ?AUTO_11164 ?AUTO_11169 ) ) ( not ( = ?AUTO_11165 ?AUTO_11170 ) ) ( not ( = ?AUTO_11163 ?AUTO_11169 ) ) ( OBJ-AT ?AUTO_11160 ?AUTO_11169 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11160 ?AUTO_11167 ?AUTO_11169 )
      ( DELIVER-PKG ?AUTO_11160 ?AUTO_11161 )
      ( DELIVER-PKG-VERIFY ?AUTO_11160 ?AUTO_11161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11171 - OBJ
      ?AUTO_11172 - LOCATION
    )
    :vars
    (
      ?AUTO_11179 - TRUCK
      ?AUTO_11173 - LOCATION
      ?AUTO_11174 - CITY
      ?AUTO_11177 - LOCATION
      ?AUTO_11175 - LOCATION
      ?AUTO_11176 - AIRPLANE
      ?AUTO_11178 - TRUCK
      ?AUTO_11181 - LOCATION
      ?AUTO_11180 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11179 ?AUTO_11173 ) ( IN-CITY ?AUTO_11173 ?AUTO_11174 ) ( IN-CITY ?AUTO_11172 ?AUTO_11174 ) ( not ( = ?AUTO_11172 ?AUTO_11173 ) ) ( AIRPORT ?AUTO_11177 ) ( AIRPORT ?AUTO_11173 ) ( not ( = ?AUTO_11177 ?AUTO_11173 ) ) ( not ( = ?AUTO_11172 ?AUTO_11177 ) ) ( AIRPORT ?AUTO_11175 ) ( AIRPLANE-AT ?AUTO_11176 ?AUTO_11175 ) ( not ( = ?AUTO_11175 ?AUTO_11177 ) ) ( not ( = ?AUTO_11172 ?AUTO_11175 ) ) ( not ( = ?AUTO_11173 ?AUTO_11175 ) ) ( not ( = ?AUTO_11179 ?AUTO_11178 ) ) ( IN-CITY ?AUTO_11181 ?AUTO_11180 ) ( IN-CITY ?AUTO_11177 ?AUTO_11180 ) ( not ( = ?AUTO_11177 ?AUTO_11181 ) ) ( not ( = ?AUTO_11172 ?AUTO_11181 ) ) ( not ( = ?AUTO_11173 ?AUTO_11181 ) ) ( not ( = ?AUTO_11174 ?AUTO_11180 ) ) ( not ( = ?AUTO_11175 ?AUTO_11181 ) ) ( OBJ-AT ?AUTO_11171 ?AUTO_11181 ) ( TRUCK-AT ?AUTO_11178 ?AUTO_11177 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11178 ?AUTO_11177 ?AUTO_11181 ?AUTO_11180 )
      ( DELIVER-PKG ?AUTO_11171 ?AUTO_11172 )
      ( DELIVER-PKG-VERIFY ?AUTO_11171 ?AUTO_11172 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11184 - OBJ
      ?AUTO_11185 - LOCATION
    )
    :vars
    (
      ?AUTO_11194 - LOCATION
      ?AUTO_11187 - CITY
      ?AUTO_11193 - LOCATION
      ?AUTO_11189 - LOCATION
      ?AUTO_11186 - AIRPLANE
      ?AUTO_11190 - TRUCK
      ?AUTO_11192 - TRUCK
      ?AUTO_11191 - LOCATION
      ?AUTO_11188 - CITY
      ?AUTO_11195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11194 ?AUTO_11187 ) ( IN-CITY ?AUTO_11185 ?AUTO_11187 ) ( not ( = ?AUTO_11185 ?AUTO_11194 ) ) ( AIRPORT ?AUTO_11193 ) ( AIRPORT ?AUTO_11194 ) ( not ( = ?AUTO_11193 ?AUTO_11194 ) ) ( not ( = ?AUTO_11185 ?AUTO_11193 ) ) ( AIRPORT ?AUTO_11189 ) ( AIRPLANE-AT ?AUTO_11186 ?AUTO_11189 ) ( not ( = ?AUTO_11189 ?AUTO_11193 ) ) ( not ( = ?AUTO_11185 ?AUTO_11189 ) ) ( not ( = ?AUTO_11194 ?AUTO_11189 ) ) ( not ( = ?AUTO_11190 ?AUTO_11192 ) ) ( IN-CITY ?AUTO_11191 ?AUTO_11188 ) ( IN-CITY ?AUTO_11193 ?AUTO_11188 ) ( not ( = ?AUTO_11193 ?AUTO_11191 ) ) ( not ( = ?AUTO_11185 ?AUTO_11191 ) ) ( not ( = ?AUTO_11194 ?AUTO_11191 ) ) ( not ( = ?AUTO_11187 ?AUTO_11188 ) ) ( not ( = ?AUTO_11189 ?AUTO_11191 ) ) ( OBJ-AT ?AUTO_11184 ?AUTO_11191 ) ( TRUCK-AT ?AUTO_11192 ?AUTO_11193 ) ( TRUCK-AT ?AUTO_11190 ?AUTO_11195 ) ( IN-CITY ?AUTO_11195 ?AUTO_11187 ) ( not ( = ?AUTO_11194 ?AUTO_11195 ) ) ( not ( = ?AUTO_11185 ?AUTO_11195 ) ) ( not ( = ?AUTO_11193 ?AUTO_11195 ) ) ( not ( = ?AUTO_11189 ?AUTO_11195 ) ) ( not ( = ?AUTO_11191 ?AUTO_11195 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11190 ?AUTO_11195 ?AUTO_11194 ?AUTO_11187 )
      ( DELIVER-PKG ?AUTO_11184 ?AUTO_11185 )
      ( DELIVER-PKG-VERIFY ?AUTO_11184 ?AUTO_11185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11212 - OBJ
      ?AUTO_11213 - LOCATION
    )
    :vars
    (
      ?AUTO_11214 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11212 ?AUTO_11214 ) ( AIRPLANE-AT ?AUTO_11214 ?AUTO_11213 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11212 ?AUTO_11214 ?AUTO_11213 )
      ( DELIVER-PKG-VERIFY ?AUTO_11212 ?AUTO_11213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11217 - OBJ
      ?AUTO_11218 - LOCATION
    )
    :vars
    (
      ?AUTO_11219 - AIRPLANE
      ?AUTO_11220 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11217 ?AUTO_11219 ) ( AIRPORT ?AUTO_11220 ) ( AIRPORT ?AUTO_11218 ) ( AIRPLANE-AT ?AUTO_11219 ?AUTO_11220 ) ( not ( = ?AUTO_11220 ?AUTO_11218 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11219 ?AUTO_11220 ?AUTO_11218 )
      ( DELIVER-PKG ?AUTO_11217 ?AUTO_11218 )
      ( DELIVER-PKG-VERIFY ?AUTO_11217 ?AUTO_11218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11265 - OBJ
      ?AUTO_11266 - LOCATION
    )
    :vars
    (
      ?AUTO_11269 - LOCATION
      ?AUTO_11267 - LOCATION
      ?AUTO_11268 - AIRPLANE
      ?AUTO_11270 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11269 ) ( AIRPORT ?AUTO_11266 ) ( not ( = ?AUTO_11269 ?AUTO_11266 ) ) ( AIRPORT ?AUTO_11267 ) ( AIRPLANE-AT ?AUTO_11268 ?AUTO_11267 ) ( not ( = ?AUTO_11267 ?AUTO_11269 ) ) ( not ( = ?AUTO_11266 ?AUTO_11267 ) ) ( TRUCK-AT ?AUTO_11270 ?AUTO_11269 ) ( IN-TRUCK ?AUTO_11265 ?AUTO_11270 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11265 ?AUTO_11270 ?AUTO_11269 )
      ( DELIVER-PKG ?AUTO_11265 ?AUTO_11266 )
      ( DELIVER-PKG-VERIFY ?AUTO_11265 ?AUTO_11266 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11277 - OBJ
      ?AUTO_11278 - LOCATION
    )
    :vars
    (
      ?AUTO_11282 - LOCATION
      ?AUTO_11281 - LOCATION
      ?AUTO_11283 - AIRPLANE
      ?AUTO_11280 - TRUCK
      ?AUTO_11279 - LOCATION
      ?AUTO_11284 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11282 ) ( AIRPORT ?AUTO_11278 ) ( not ( = ?AUTO_11282 ?AUTO_11278 ) ) ( AIRPORT ?AUTO_11281 ) ( AIRPLANE-AT ?AUTO_11283 ?AUTO_11281 ) ( not ( = ?AUTO_11281 ?AUTO_11282 ) ) ( not ( = ?AUTO_11278 ?AUTO_11281 ) ) ( TRUCK-AT ?AUTO_11280 ?AUTO_11279 ) ( IN-CITY ?AUTO_11279 ?AUTO_11284 ) ( IN-CITY ?AUTO_11282 ?AUTO_11284 ) ( not ( = ?AUTO_11282 ?AUTO_11279 ) ) ( not ( = ?AUTO_11278 ?AUTO_11279 ) ) ( not ( = ?AUTO_11281 ?AUTO_11279 ) ) ( OBJ-AT ?AUTO_11277 ?AUTO_11279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11277 ?AUTO_11280 ?AUTO_11279 )
      ( DELIVER-PKG ?AUTO_11277 ?AUTO_11278 )
      ( DELIVER-PKG-VERIFY ?AUTO_11277 ?AUTO_11278 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11311 - OBJ
      ?AUTO_11312 - LOCATION
    )
    :vars
    (
      ?AUTO_11313 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11311 ?AUTO_11313 ) ( AIRPLANE-AT ?AUTO_11313 ?AUTO_11312 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11311 ?AUTO_11313 ?AUTO_11312 )
      ( DELIVER-PKG-VERIFY ?AUTO_11311 ?AUTO_11312 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11314 - OBJ
      ?AUTO_11315 - LOCATION
    )
    :vars
    (
      ?AUTO_11316 - AIRPLANE
      ?AUTO_11317 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11314 ?AUTO_11316 ) ( AIRPORT ?AUTO_11317 ) ( AIRPORT ?AUTO_11315 ) ( AIRPLANE-AT ?AUTO_11316 ?AUTO_11317 ) ( not ( = ?AUTO_11317 ?AUTO_11315 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11316 ?AUTO_11317 ?AUTO_11315 )
      ( DELIVER-PKG ?AUTO_11314 ?AUTO_11315 )
      ( DELIVER-PKG-VERIFY ?AUTO_11314 ?AUTO_11315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11320 - OBJ
      ?AUTO_11321 - LOCATION
    )
    :vars
    (
      ?AUTO_11323 - LOCATION
      ?AUTO_11322 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11323 ) ( AIRPORT ?AUTO_11321 ) ( AIRPLANE-AT ?AUTO_11322 ?AUTO_11323 ) ( not ( = ?AUTO_11323 ?AUTO_11321 ) ) ( OBJ-AT ?AUTO_11320 ?AUTO_11323 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11320 ?AUTO_11322 ?AUTO_11323 )
      ( DELIVER-PKG ?AUTO_11320 ?AUTO_11321 )
      ( DELIVER-PKG-VERIFY ?AUTO_11320 ?AUTO_11321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11324 - OBJ
      ?AUTO_11325 - LOCATION
    )
    :vars
    (
      ?AUTO_11327 - LOCATION
      ?AUTO_11326 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11327 ) ( AIRPORT ?AUTO_11325 ) ( not ( = ?AUTO_11327 ?AUTO_11325 ) ) ( OBJ-AT ?AUTO_11324 ?AUTO_11327 ) ( AIRPLANE-AT ?AUTO_11326 ?AUTO_11325 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11326 ?AUTO_11325 ?AUTO_11327 )
      ( DELIVER-PKG ?AUTO_11324 ?AUTO_11325 )
      ( DELIVER-PKG-VERIFY ?AUTO_11324 ?AUTO_11325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11346 - OBJ
      ?AUTO_11347 - LOCATION
    )
    :vars
    (
      ?AUTO_11348 - LOCATION
      ?AUTO_11349 - AIRPLANE
      ?AUTO_11350 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11348 ) ( AIRPORT ?AUTO_11347 ) ( not ( = ?AUTO_11348 ?AUTO_11347 ) ) ( AIRPLANE-AT ?AUTO_11349 ?AUTO_11347 ) ( TRUCK-AT ?AUTO_11350 ?AUTO_11348 ) ( IN-TRUCK ?AUTO_11346 ?AUTO_11350 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11346 ?AUTO_11350 ?AUTO_11348 )
      ( DELIVER-PKG ?AUTO_11346 ?AUTO_11347 )
      ( DELIVER-PKG-VERIFY ?AUTO_11346 ?AUTO_11347 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11355 - OBJ
      ?AUTO_11356 - LOCATION
    )
    :vars
    (
      ?AUTO_11357 - LOCATION
      ?AUTO_11358 - AIRPLANE
      ?AUTO_11359 - TRUCK
      ?AUTO_11360 - LOCATION
      ?AUTO_11361 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11357 ) ( AIRPORT ?AUTO_11356 ) ( not ( = ?AUTO_11357 ?AUTO_11356 ) ) ( AIRPLANE-AT ?AUTO_11358 ?AUTO_11356 ) ( IN-TRUCK ?AUTO_11355 ?AUTO_11359 ) ( TRUCK-AT ?AUTO_11359 ?AUTO_11360 ) ( IN-CITY ?AUTO_11360 ?AUTO_11361 ) ( IN-CITY ?AUTO_11357 ?AUTO_11361 ) ( not ( = ?AUTO_11357 ?AUTO_11360 ) ) ( not ( = ?AUTO_11356 ?AUTO_11360 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11359 ?AUTO_11360 ?AUTO_11357 ?AUTO_11361 )
      ( DELIVER-PKG ?AUTO_11355 ?AUTO_11356 )
      ( DELIVER-PKG-VERIFY ?AUTO_11355 ?AUTO_11356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11422 - OBJ
      ?AUTO_11423 - LOCATION
    )
    :vars
    (
      ?AUTO_11424 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11422 ?AUTO_11424 ) ( AIRPLANE-AT ?AUTO_11424 ?AUTO_11423 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11422 ?AUTO_11424 ?AUTO_11423 )
      ( DELIVER-PKG-VERIFY ?AUTO_11422 ?AUTO_11423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11429 - OBJ
      ?AUTO_11430 - LOCATION
    )
    :vars
    (
      ?AUTO_11431 - LOCATION
      ?AUTO_11432 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11431 ) ( AIRPORT ?AUTO_11430 ) ( AIRPLANE-AT ?AUTO_11432 ?AUTO_11431 ) ( not ( = ?AUTO_11431 ?AUTO_11430 ) ) ( OBJ-AT ?AUTO_11429 ?AUTO_11431 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11429 ?AUTO_11432 ?AUTO_11431 )
      ( DELIVER-PKG ?AUTO_11429 ?AUTO_11430 )
      ( DELIVER-PKG-VERIFY ?AUTO_11429 ?AUTO_11430 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11453 - OBJ
      ?AUTO_11454 - LOCATION
    )
    :vars
    (
      ?AUTO_11456 - LOCATION
      ?AUTO_11455 - AIRPLANE
      ?AUTO_11457 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11456 ) ( AIRPORT ?AUTO_11454 ) ( not ( = ?AUTO_11456 ?AUTO_11454 ) ) ( AIRPLANE-AT ?AUTO_11455 ?AUTO_11454 ) ( TRUCK-AT ?AUTO_11457 ?AUTO_11456 ) ( IN-TRUCK ?AUTO_11453 ?AUTO_11457 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11453 ?AUTO_11457 ?AUTO_11456 )
      ( DELIVER-PKG ?AUTO_11453 ?AUTO_11454 )
      ( DELIVER-PKG-VERIFY ?AUTO_11453 ?AUTO_11454 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11526 - OBJ
      ?AUTO_11527 - LOCATION
    )
    :vars
    (
      ?AUTO_11528 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11528 ?AUTO_11527 ) ( IN-TRUCK ?AUTO_11526 ?AUTO_11528 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11526 ?AUTO_11528 ?AUTO_11527 )
      ( DELIVER-PKG-VERIFY ?AUTO_11526 ?AUTO_11527 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11533 - OBJ
      ?AUTO_11534 - LOCATION
    )
    :vars
    (
      ?AUTO_11535 - TRUCK
      ?AUTO_11536 - LOCATION
      ?AUTO_11537 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11533 ?AUTO_11535 ) ( TRUCK-AT ?AUTO_11535 ?AUTO_11536 ) ( IN-CITY ?AUTO_11536 ?AUTO_11537 ) ( IN-CITY ?AUTO_11534 ?AUTO_11537 ) ( not ( = ?AUTO_11534 ?AUTO_11536 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11535 ?AUTO_11536 ?AUTO_11534 ?AUTO_11537 )
      ( DELIVER-PKG ?AUTO_11533 ?AUTO_11534 )
      ( DELIVER-PKG-VERIFY ?AUTO_11533 ?AUTO_11534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11538 - OBJ
      ?AUTO_11539 - LOCATION
    )
    :vars
    (
      ?AUTO_11540 - TRUCK
      ?AUTO_11541 - LOCATION
      ?AUTO_11542 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11540 ?AUTO_11541 ) ( IN-CITY ?AUTO_11541 ?AUTO_11542 ) ( IN-CITY ?AUTO_11539 ?AUTO_11542 ) ( not ( = ?AUTO_11539 ?AUTO_11541 ) ) ( OBJ-AT ?AUTO_11538 ?AUTO_11541 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11538 ?AUTO_11540 ?AUTO_11541 )
      ( DELIVER-PKG ?AUTO_11538 ?AUTO_11539 )
      ( DELIVER-PKG-VERIFY ?AUTO_11538 ?AUTO_11539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11545 - OBJ
      ?AUTO_11546 - LOCATION
    )
    :vars
    (
      ?AUTO_11549 - TRUCK
      ?AUTO_11547 - LOCATION
      ?AUTO_11548 - CITY
      ?AUTO_11550 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11549 ?AUTO_11547 ) ( IN-CITY ?AUTO_11547 ?AUTO_11548 ) ( IN-CITY ?AUTO_11546 ?AUTO_11548 ) ( not ( = ?AUTO_11546 ?AUTO_11547 ) ) ( IN-AIRPLANE ?AUTO_11545 ?AUTO_11550 ) ( AIRPLANE-AT ?AUTO_11550 ?AUTO_11547 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11545 ?AUTO_11550 ?AUTO_11547 )
      ( DELIVER-PKG ?AUTO_11545 ?AUTO_11546 )
      ( DELIVER-PKG-VERIFY ?AUTO_11545 ?AUTO_11546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11551 - OBJ
      ?AUTO_11552 - LOCATION
    )
    :vars
    (
      ?AUTO_11555 - TRUCK
      ?AUTO_11553 - LOCATION
      ?AUTO_11554 - CITY
      ?AUTO_11556 - AIRPLANE
      ?AUTO_11557 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11555 ?AUTO_11553 ) ( IN-CITY ?AUTO_11553 ?AUTO_11554 ) ( IN-CITY ?AUTO_11552 ?AUTO_11554 ) ( not ( = ?AUTO_11552 ?AUTO_11553 ) ) ( IN-AIRPLANE ?AUTO_11551 ?AUTO_11556 ) ( AIRPORT ?AUTO_11557 ) ( AIRPORT ?AUTO_11553 ) ( AIRPLANE-AT ?AUTO_11556 ?AUTO_11557 ) ( not ( = ?AUTO_11557 ?AUTO_11553 ) ) ( not ( = ?AUTO_11552 ?AUTO_11557 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11556 ?AUTO_11557 ?AUTO_11553 )
      ( DELIVER-PKG ?AUTO_11551 ?AUTO_11552 )
      ( DELIVER-PKG-VERIFY ?AUTO_11551 ?AUTO_11552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11560 - OBJ
      ?AUTO_11561 - LOCATION
    )
    :vars
    (
      ?AUTO_11562 - TRUCK
      ?AUTO_11563 - LOCATION
      ?AUTO_11566 - CITY
      ?AUTO_11564 - LOCATION
      ?AUTO_11565 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11562 ?AUTO_11563 ) ( IN-CITY ?AUTO_11563 ?AUTO_11566 ) ( IN-CITY ?AUTO_11561 ?AUTO_11566 ) ( not ( = ?AUTO_11561 ?AUTO_11563 ) ) ( AIRPORT ?AUTO_11564 ) ( AIRPORT ?AUTO_11563 ) ( AIRPLANE-AT ?AUTO_11565 ?AUTO_11564 ) ( not ( = ?AUTO_11564 ?AUTO_11563 ) ) ( not ( = ?AUTO_11561 ?AUTO_11564 ) ) ( OBJ-AT ?AUTO_11560 ?AUTO_11564 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11560 ?AUTO_11565 ?AUTO_11564 )
      ( DELIVER-PKG ?AUTO_11560 ?AUTO_11561 )
      ( DELIVER-PKG-VERIFY ?AUTO_11560 ?AUTO_11561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11567 - OBJ
      ?AUTO_11568 - LOCATION
    )
    :vars
    (
      ?AUTO_11571 - TRUCK
      ?AUTO_11569 - LOCATION
      ?AUTO_11570 - CITY
      ?AUTO_11573 - LOCATION
      ?AUTO_11572 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11571 ?AUTO_11569 ) ( IN-CITY ?AUTO_11569 ?AUTO_11570 ) ( IN-CITY ?AUTO_11568 ?AUTO_11570 ) ( not ( = ?AUTO_11568 ?AUTO_11569 ) ) ( AIRPORT ?AUTO_11573 ) ( AIRPORT ?AUTO_11569 ) ( not ( = ?AUTO_11573 ?AUTO_11569 ) ) ( not ( = ?AUTO_11568 ?AUTO_11573 ) ) ( OBJ-AT ?AUTO_11567 ?AUTO_11573 ) ( AIRPLANE-AT ?AUTO_11572 ?AUTO_11569 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11572 ?AUTO_11569 ?AUTO_11573 )
      ( DELIVER-PKG ?AUTO_11567 ?AUTO_11568 )
      ( DELIVER-PKG-VERIFY ?AUTO_11567 ?AUTO_11568 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11592 - OBJ
      ?AUTO_11593 - LOCATION
    )
    :vars
    (
      ?AUTO_11594 - TRUCK
      ?AUTO_11598 - LOCATION
      ?AUTO_11597 - CITY
      ?AUTO_11596 - LOCATION
      ?AUTO_11595 - AIRPLANE
      ?AUTO_11599 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11594 ?AUTO_11598 ) ( IN-CITY ?AUTO_11598 ?AUTO_11597 ) ( IN-CITY ?AUTO_11593 ?AUTO_11597 ) ( not ( = ?AUTO_11593 ?AUTO_11598 ) ) ( AIRPORT ?AUTO_11596 ) ( AIRPORT ?AUTO_11598 ) ( not ( = ?AUTO_11596 ?AUTO_11598 ) ) ( not ( = ?AUTO_11593 ?AUTO_11596 ) ) ( AIRPLANE-AT ?AUTO_11595 ?AUTO_11598 ) ( TRUCK-AT ?AUTO_11599 ?AUTO_11596 ) ( IN-TRUCK ?AUTO_11592 ?AUTO_11599 ) ( not ( = ?AUTO_11594 ?AUTO_11599 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11592 ?AUTO_11599 ?AUTO_11596 )
      ( DELIVER-PKG ?AUTO_11592 ?AUTO_11593 )
      ( DELIVER-PKG-VERIFY ?AUTO_11592 ?AUTO_11593 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11604 - OBJ
      ?AUTO_11605 - LOCATION
    )
    :vars
    (
      ?AUTO_11606 - TRUCK
      ?AUTO_11607 - LOCATION
      ?AUTO_11611 - CITY
      ?AUTO_11609 - LOCATION
      ?AUTO_11608 - AIRPLANE
      ?AUTO_11610 - TRUCK
      ?AUTO_11612 - LOCATION
      ?AUTO_11613 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11606 ?AUTO_11607 ) ( IN-CITY ?AUTO_11607 ?AUTO_11611 ) ( IN-CITY ?AUTO_11605 ?AUTO_11611 ) ( not ( = ?AUTO_11605 ?AUTO_11607 ) ) ( AIRPORT ?AUTO_11609 ) ( AIRPORT ?AUTO_11607 ) ( not ( = ?AUTO_11609 ?AUTO_11607 ) ) ( not ( = ?AUTO_11605 ?AUTO_11609 ) ) ( AIRPLANE-AT ?AUTO_11608 ?AUTO_11607 ) ( IN-TRUCK ?AUTO_11604 ?AUTO_11610 ) ( not ( = ?AUTO_11606 ?AUTO_11610 ) ) ( TRUCK-AT ?AUTO_11610 ?AUTO_11612 ) ( IN-CITY ?AUTO_11612 ?AUTO_11613 ) ( IN-CITY ?AUTO_11609 ?AUTO_11613 ) ( not ( = ?AUTO_11609 ?AUTO_11612 ) ) ( not ( = ?AUTO_11605 ?AUTO_11612 ) ) ( not ( = ?AUTO_11607 ?AUTO_11612 ) ) ( not ( = ?AUTO_11611 ?AUTO_11613 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11610 ?AUTO_11612 ?AUTO_11609 ?AUTO_11613 )
      ( DELIVER-PKG ?AUTO_11604 ?AUTO_11605 )
      ( DELIVER-PKG-VERIFY ?AUTO_11604 ?AUTO_11605 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11674 - OBJ
      ?AUTO_11675 - LOCATION
    )
    :vars
    (
      ?AUTO_11676 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11676 ?AUTO_11675 ) ( IN-TRUCK ?AUTO_11674 ?AUTO_11676 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11674 ?AUTO_11676 ?AUTO_11675 )
      ( DELIVER-PKG-VERIFY ?AUTO_11674 ?AUTO_11675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11679 - OBJ
      ?AUTO_11680 - LOCATION
    )
    :vars
    (
      ?AUTO_11681 - TRUCK
      ?AUTO_11682 - LOCATION
      ?AUTO_11683 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11679 ?AUTO_11681 ) ( TRUCK-AT ?AUTO_11681 ?AUTO_11682 ) ( IN-CITY ?AUTO_11682 ?AUTO_11683 ) ( IN-CITY ?AUTO_11680 ?AUTO_11683 ) ( not ( = ?AUTO_11680 ?AUTO_11682 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11681 ?AUTO_11682 ?AUTO_11680 ?AUTO_11683 )
      ( DELIVER-PKG ?AUTO_11679 ?AUTO_11680 )
      ( DELIVER-PKG-VERIFY ?AUTO_11679 ?AUTO_11680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11684 - OBJ
      ?AUTO_11685 - LOCATION
    )
    :vars
    (
      ?AUTO_11686 - TRUCK
      ?AUTO_11687 - LOCATION
      ?AUTO_11688 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11686 ?AUTO_11687 ) ( IN-CITY ?AUTO_11687 ?AUTO_11688 ) ( IN-CITY ?AUTO_11685 ?AUTO_11688 ) ( not ( = ?AUTO_11685 ?AUTO_11687 ) ) ( OBJ-AT ?AUTO_11684 ?AUTO_11687 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11684 ?AUTO_11686 ?AUTO_11687 )
      ( DELIVER-PKG ?AUTO_11684 ?AUTO_11685 )
      ( DELIVER-PKG-VERIFY ?AUTO_11684 ?AUTO_11685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11693 - OBJ
      ?AUTO_11694 - LOCATION
    )
    :vars
    (
      ?AUTO_11697 - TRUCK
      ?AUTO_11696 - LOCATION
      ?AUTO_11695 - CITY
      ?AUTO_11698 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11697 ?AUTO_11696 ) ( IN-CITY ?AUTO_11696 ?AUTO_11695 ) ( IN-CITY ?AUTO_11694 ?AUTO_11695 ) ( not ( = ?AUTO_11694 ?AUTO_11696 ) ) ( IN-AIRPLANE ?AUTO_11693 ?AUTO_11698 ) ( AIRPLANE-AT ?AUTO_11698 ?AUTO_11696 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11693 ?AUTO_11698 ?AUTO_11696 )
      ( DELIVER-PKG ?AUTO_11693 ?AUTO_11694 )
      ( DELIVER-PKG-VERIFY ?AUTO_11693 ?AUTO_11694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11703 - OBJ
      ?AUTO_11704 - LOCATION
    )
    :vars
    (
      ?AUTO_11705 - TRUCK
      ?AUTO_11706 - LOCATION
      ?AUTO_11709 - CITY
      ?AUTO_11708 - LOCATION
      ?AUTO_11707 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11705 ?AUTO_11706 ) ( IN-CITY ?AUTO_11706 ?AUTO_11709 ) ( IN-CITY ?AUTO_11704 ?AUTO_11709 ) ( not ( = ?AUTO_11704 ?AUTO_11706 ) ) ( AIRPORT ?AUTO_11708 ) ( AIRPORT ?AUTO_11706 ) ( AIRPLANE-AT ?AUTO_11707 ?AUTO_11708 ) ( not ( = ?AUTO_11708 ?AUTO_11706 ) ) ( not ( = ?AUTO_11704 ?AUTO_11708 ) ) ( OBJ-AT ?AUTO_11703 ?AUTO_11708 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11703 ?AUTO_11707 ?AUTO_11708 )
      ( DELIVER-PKG ?AUTO_11703 ?AUTO_11704 )
      ( DELIVER-PKG-VERIFY ?AUTO_11703 ?AUTO_11704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11730 - OBJ
      ?AUTO_11731 - LOCATION
    )
    :vars
    (
      ?AUTO_11732 - TRUCK
      ?AUTO_11733 - LOCATION
      ?AUTO_11734 - CITY
      ?AUTO_11735 - LOCATION
      ?AUTO_11736 - AIRPLANE
      ?AUTO_11737 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11732 ?AUTO_11733 ) ( IN-CITY ?AUTO_11733 ?AUTO_11734 ) ( IN-CITY ?AUTO_11731 ?AUTO_11734 ) ( not ( = ?AUTO_11731 ?AUTO_11733 ) ) ( AIRPORT ?AUTO_11735 ) ( AIRPORT ?AUTO_11733 ) ( not ( = ?AUTO_11735 ?AUTO_11733 ) ) ( not ( = ?AUTO_11731 ?AUTO_11735 ) ) ( AIRPLANE-AT ?AUTO_11736 ?AUTO_11733 ) ( TRUCK-AT ?AUTO_11737 ?AUTO_11735 ) ( IN-TRUCK ?AUTO_11730 ?AUTO_11737 ) ( not ( = ?AUTO_11732 ?AUTO_11737 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11730 ?AUTO_11737 ?AUTO_11735 )
      ( DELIVER-PKG ?AUTO_11730 ?AUTO_11731 )
      ( DELIVER-PKG-VERIFY ?AUTO_11730 ?AUTO_11731 ) )
  )

)

