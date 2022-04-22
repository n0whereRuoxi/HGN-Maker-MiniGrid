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
      ?AUTO_11 - AIRPLANE
      ?AUTO_13 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7 ?AUTO_11 ) ( AIRPORT ?AUTO_13 ) ( AIRPORT ?AUTO_8 ) ( AIRPLANE-AT ?AUTO_11 ?AUTO_13 ) ( not ( = ?AUTO_13 ?AUTO_8 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11 ?AUTO_13 ?AUTO_8 )
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
      ?AUTO_20 - LOCATION
      ?AUTO_19 - AIRPLANE
      ?AUTO_22 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_20 ) ( AIRPORT ?AUTO_16 ) ( AIRPLANE-AT ?AUTO_19 ?AUTO_20 ) ( not ( = ?AUTO_20 ?AUTO_16 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_22 ) ( AIRPLANE-AT ?AUTO_19 ?AUTO_22 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_15 ?AUTO_19 ?AUTO_22 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_24 - OBJ
      ?AUTO_25 - LOCATION
    )
    :vars
    (
      ?AUTO_26 - LOCATION
      ?AUTO_32 - LOCATION
      ?AUTO_29 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_26 ) ( AIRPORT ?AUTO_25 ) ( not ( = ?AUTO_26 ?AUTO_25 ) ) ( OBJ-AT ?AUTO_24 ?AUTO_26 ) ( AIRPORT ?AUTO_32 ) ( AIRPLANE-AT ?AUTO_29 ?AUTO_32 ) ( not ( = ?AUTO_32 ?AUTO_26 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_29 ?AUTO_32 ?AUTO_26 )
      ( DELIVER-PKG ?AUTO_24 ?AUTO_25 )
      ( DELIVER-PKG-VERIFY ?AUTO_24 ?AUTO_25 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_36 - OBJ
      ?AUTO_37 - LOCATION
    )
    :vars
    (
      ?AUTO_38 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_38 ?AUTO_37 ) ( IN-TRUCK ?AUTO_36 ?AUTO_38 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_36 ?AUTO_38 ?AUTO_37 )
      ( DELIVER-PKG-VERIFY ?AUTO_36 ?AUTO_37 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_41 - OBJ
      ?AUTO_42 - LOCATION
    )
    :vars
    (
      ?AUTO_43 - TRUCK
      ?AUTO_48 - LOCATION
      ?AUTO_47 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_41 ?AUTO_43 ) ( TRUCK-AT ?AUTO_43 ?AUTO_48 ) ( IN-CITY ?AUTO_48 ?AUTO_47 ) ( IN-CITY ?AUTO_42 ?AUTO_47 ) ( not ( = ?AUTO_42 ?AUTO_48 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_43 ?AUTO_48 ?AUTO_42 ?AUTO_47 )
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
      ?AUTO_54 - TRUCK
      ?AUTO_56 - LOCATION
      ?AUTO_55 - CITY
      ?AUTO_58 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_54 ?AUTO_56 ) ( IN-CITY ?AUTO_56 ?AUTO_55 ) ( IN-CITY ?AUTO_51 ?AUTO_55 ) ( not ( = ?AUTO_51 ?AUTO_56 ) ) ( TRUCK-AT ?AUTO_54 ?AUTO_58 ) ( OBJ-AT ?AUTO_50 ?AUTO_58 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_50 ?AUTO_54 ?AUTO_58 )
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
      ?AUTO_62 - LOCATION
      ?AUTO_66 - CITY
      ?AUTO_65 - TRUCK
      ?AUTO_70 - LOCATION
      ?AUTO_69 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_62 ?AUTO_66 ) ( IN-CITY ?AUTO_61 ?AUTO_66 ) ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( OBJ-AT ?AUTO_60 ?AUTO_62 ) ( TRUCK-AT ?AUTO_65 ?AUTO_70 ) ( IN-CITY ?AUTO_70 ?AUTO_69 ) ( IN-CITY ?AUTO_62 ?AUTO_69 ) ( not ( = ?AUTO_62 ?AUTO_70 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_65 ?AUTO_70 ?AUTO_62 ?AUTO_69 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_82 - OBJ
      ?AUTO_83 - LOCATION
    )
    :vars
    (
      ?AUTO_84 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_82 ?AUTO_84 ) ( AIRPLANE-AT ?AUTO_84 ?AUTO_83 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_82 ?AUTO_84 ?AUTO_83 )
      ( DELIVER-PKG-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_87 - OBJ
      ?AUTO_88 - LOCATION
    )
    :vars
    (
      ?AUTO_89 - AIRPLANE
      ?AUTO_93 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_87 ?AUTO_89 ) ( AIRPORT ?AUTO_93 ) ( AIRPORT ?AUTO_88 ) ( AIRPLANE-AT ?AUTO_89 ?AUTO_93 ) ( not ( = ?AUTO_93 ?AUTO_88 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_89 ?AUTO_93 ?AUTO_88 )
      ( DELIVER-PKG ?AUTO_87 ?AUTO_88 )
      ( DELIVER-PKG-VERIFY ?AUTO_87 ?AUTO_88 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_95 - OBJ
      ?AUTO_96 - LOCATION
    )
    :vars
    (
      ?AUTO_100 - LOCATION
      ?AUTO_99 - AIRPLANE
      ?AUTO_102 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_100 ) ( AIRPORT ?AUTO_96 ) ( AIRPLANE-AT ?AUTO_99 ?AUTO_100 ) ( not ( = ?AUTO_100 ?AUTO_96 ) ) ( OBJ-AT ?AUTO_95 ?AUTO_102 ) ( AIRPLANE-AT ?AUTO_99 ?AUTO_102 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_95 ?AUTO_99 ?AUTO_102 )
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
      ?AUTO_110 - LOCATION
      ?AUTO_109 - AIRPLANE
      ?AUTO_106 - LOCATION
      ?AUTO_111 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_110 ) ( AIRPORT ?AUTO_105 ) ( AIRPLANE-AT ?AUTO_109 ?AUTO_110 ) ( not ( = ?AUTO_110 ?AUTO_105 ) ) ( AIRPLANE-AT ?AUTO_109 ?AUTO_106 ) ( TRUCK-AT ?AUTO_111 ?AUTO_106 ) ( IN-TRUCK ?AUTO_104 ?AUTO_111 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_104 ?AUTO_111 ?AUTO_106 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_114 - OBJ
      ?AUTO_115 - LOCATION
    )
    :vars
    (
      ?AUTO_116 - LOCATION
      ?AUTO_120 - AIRPLANE
      ?AUTO_117 - LOCATION
      ?AUTO_121 - TRUCK
      ?AUTO_124 - LOCATION
      ?AUTO_123 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_116 ) ( AIRPORT ?AUTO_115 ) ( AIRPLANE-AT ?AUTO_120 ?AUTO_116 ) ( not ( = ?AUTO_116 ?AUTO_115 ) ) ( AIRPLANE-AT ?AUTO_120 ?AUTO_117 ) ( IN-TRUCK ?AUTO_114 ?AUTO_121 ) ( TRUCK-AT ?AUTO_121 ?AUTO_124 ) ( IN-CITY ?AUTO_124 ?AUTO_123 ) ( IN-CITY ?AUTO_117 ?AUTO_123 ) ( not ( = ?AUTO_117 ?AUTO_124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_121 ?AUTO_124 ?AUTO_117 ?AUTO_123 )
      ( DELIVER-PKG ?AUTO_114 ?AUTO_115 )
      ( DELIVER-PKG-VERIFY ?AUTO_114 ?AUTO_115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_126 - OBJ
      ?AUTO_127 - LOCATION
    )
    :vars
    (
      ?AUTO_133 - LOCATION
      ?AUTO_135 - AIRPLANE
      ?AUTO_134 - LOCATION
      ?AUTO_131 - TRUCK
      ?AUTO_129 - LOCATION
      ?AUTO_128 - CITY
      ?AUTO_137 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_133 ) ( AIRPORT ?AUTO_127 ) ( AIRPLANE-AT ?AUTO_135 ?AUTO_133 ) ( not ( = ?AUTO_133 ?AUTO_127 ) ) ( AIRPLANE-AT ?AUTO_135 ?AUTO_134 ) ( TRUCK-AT ?AUTO_131 ?AUTO_129 ) ( IN-CITY ?AUTO_129 ?AUTO_128 ) ( IN-CITY ?AUTO_134 ?AUTO_128 ) ( not ( = ?AUTO_134 ?AUTO_129 ) ) ( TRUCK-AT ?AUTO_131 ?AUTO_137 ) ( OBJ-AT ?AUTO_126 ?AUTO_137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_126 ?AUTO_131 ?AUTO_137 )
      ( DELIVER-PKG ?AUTO_126 ?AUTO_127 )
      ( DELIVER-PKG-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_139 - OBJ
      ?AUTO_140 - LOCATION
    )
    :vars
    (
      ?AUTO_145 - LOCATION
      ?AUTO_148 - AIRPLANE
      ?AUTO_144 - LOCATION
      ?AUTO_143 - LOCATION
      ?AUTO_146 - CITY
      ?AUTO_149 - TRUCK
      ?AUTO_152 - LOCATION
      ?AUTO_151 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_145 ) ( AIRPORT ?AUTO_140 ) ( AIRPLANE-AT ?AUTO_148 ?AUTO_145 ) ( not ( = ?AUTO_145 ?AUTO_140 ) ) ( AIRPLANE-AT ?AUTO_148 ?AUTO_144 ) ( IN-CITY ?AUTO_143 ?AUTO_146 ) ( IN-CITY ?AUTO_144 ?AUTO_146 ) ( not ( = ?AUTO_144 ?AUTO_143 ) ) ( OBJ-AT ?AUTO_139 ?AUTO_143 ) ( TRUCK-AT ?AUTO_149 ?AUTO_152 ) ( IN-CITY ?AUTO_152 ?AUTO_151 ) ( IN-CITY ?AUTO_143 ?AUTO_151 ) ( not ( = ?AUTO_143 ?AUTO_152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_149 ?AUTO_152 ?AUTO_143 ?AUTO_151 )
      ( DELIVER-PKG ?AUTO_139 ?AUTO_140 )
      ( DELIVER-PKG-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_156 - OBJ
      ?AUTO_157 - LOCATION
    )
    :vars
    (
      ?AUTO_160 - LOCATION
      ?AUTO_162 - LOCATION
      ?AUTO_167 - CITY
      ?AUTO_161 - TRUCK
      ?AUTO_164 - LOCATION
      ?AUTO_165 - CITY
      ?AUTO_169 - LOCATION
      ?AUTO_158 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_160 ) ( AIRPORT ?AUTO_157 ) ( not ( = ?AUTO_160 ?AUTO_157 ) ) ( IN-CITY ?AUTO_162 ?AUTO_167 ) ( IN-CITY ?AUTO_160 ?AUTO_167 ) ( not ( = ?AUTO_160 ?AUTO_162 ) ) ( OBJ-AT ?AUTO_156 ?AUTO_162 ) ( TRUCK-AT ?AUTO_161 ?AUTO_164 ) ( IN-CITY ?AUTO_164 ?AUTO_165 ) ( IN-CITY ?AUTO_162 ?AUTO_165 ) ( not ( = ?AUTO_162 ?AUTO_164 ) ) ( AIRPORT ?AUTO_169 ) ( AIRPLANE-AT ?AUTO_158 ?AUTO_169 ) ( not ( = ?AUTO_169 ?AUTO_160 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_158 ?AUTO_169 ?AUTO_160 )
      ( DELIVER-PKG ?AUTO_156 ?AUTO_157 )
      ( DELIVER-PKG-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_177 - OBJ
      ?AUTO_178 - LOCATION
    )
    :vars
    (
      ?AUTO_179 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_179 ?AUTO_178 ) ( IN-TRUCK ?AUTO_177 ?AUTO_179 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_177 ?AUTO_179 ?AUTO_178 )
      ( DELIVER-PKG-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_182 - OBJ
      ?AUTO_183 - LOCATION
    )
    :vars
    (
      ?AUTO_185 - TRUCK
      ?AUTO_189 - LOCATION
      ?AUTO_188 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_182 ?AUTO_185 ) ( TRUCK-AT ?AUTO_185 ?AUTO_189 ) ( IN-CITY ?AUTO_189 ?AUTO_188 ) ( IN-CITY ?AUTO_183 ?AUTO_188 ) ( not ( = ?AUTO_183 ?AUTO_189 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_185 ?AUTO_189 ?AUTO_183 ?AUTO_188 )
      ( DELIVER-PKG ?AUTO_182 ?AUTO_183 )
      ( DELIVER-PKG-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_197 - OBJ
      ?AUTO_198 - LOCATION
    )
    :vars
    (
      ?AUTO_200 - TRUCK
      ?AUTO_199 - LOCATION
      ?AUTO_203 - CITY
      ?AUTO_205 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_200 ?AUTO_199 ) ( IN-CITY ?AUTO_199 ?AUTO_203 ) ( IN-CITY ?AUTO_198 ?AUTO_203 ) ( not ( = ?AUTO_198 ?AUTO_199 ) ) ( TRUCK-AT ?AUTO_200 ?AUTO_205 ) ( OBJ-AT ?AUTO_197 ?AUTO_205 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_197 ?AUTO_200 ?AUTO_205 )
      ( DELIVER-PKG ?AUTO_197 ?AUTO_198 )
      ( DELIVER-PKG-VERIFY ?AUTO_197 ?AUTO_198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_222 - LOCATION
      ?AUTO_221 - CITY
      ?AUTO_218 - TRUCK
      ?AUTO_225 - LOCATION
      ?AUTO_224 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_222 ?AUTO_221 ) ( IN-CITY ?AUTO_216 ?AUTO_221 ) ( not ( = ?AUTO_216 ?AUTO_222 ) ) ( OBJ-AT ?AUTO_215 ?AUTO_222 ) ( TRUCK-AT ?AUTO_218 ?AUTO_225 ) ( IN-CITY ?AUTO_225 ?AUTO_224 ) ( IN-CITY ?AUTO_222 ?AUTO_224 ) ( not ( = ?AUTO_222 ?AUTO_225 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_218 ?AUTO_225 ?AUTO_222 ?AUTO_224 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_231 - OBJ
      ?AUTO_232 - LOCATION
    )
    :vars
    (
      ?AUTO_233 - LOCATION
      ?AUTO_235 - CITY
      ?AUTO_237 - TRUCK
      ?AUTO_239 - LOCATION
      ?AUTO_238 - CITY
      ?AUTO_240 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_233 ?AUTO_235 ) ( IN-CITY ?AUTO_232 ?AUTO_235 ) ( not ( = ?AUTO_232 ?AUTO_233 ) ) ( TRUCK-AT ?AUTO_237 ?AUTO_239 ) ( IN-CITY ?AUTO_239 ?AUTO_238 ) ( IN-CITY ?AUTO_233 ?AUTO_238 ) ( not ( = ?AUTO_233 ?AUTO_239 ) ) ( IN-AIRPLANE ?AUTO_231 ?AUTO_240 ) ( AIRPLANE-AT ?AUTO_240 ?AUTO_233 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_231 ?AUTO_240 ?AUTO_233 )
      ( DELIVER-PKG ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_243 - OBJ
      ?AUTO_244 - LOCATION
    )
    :vars
    (
      ?AUTO_249 - LOCATION
      ?AUTO_251 - CITY
      ?AUTO_250 - TRUCK
      ?AUTO_247 - LOCATION
      ?AUTO_248 - CITY
      ?AUTO_252 - AIRPLANE
      ?AUTO_254 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_249 ?AUTO_251 ) ( IN-CITY ?AUTO_244 ?AUTO_251 ) ( not ( = ?AUTO_244 ?AUTO_249 ) ) ( TRUCK-AT ?AUTO_250 ?AUTO_247 ) ( IN-CITY ?AUTO_247 ?AUTO_248 ) ( IN-CITY ?AUTO_249 ?AUTO_248 ) ( not ( = ?AUTO_249 ?AUTO_247 ) ) ( IN-AIRPLANE ?AUTO_243 ?AUTO_252 ) ( AIRPORT ?AUTO_254 ) ( AIRPORT ?AUTO_249 ) ( AIRPLANE-AT ?AUTO_252 ?AUTO_254 ) ( not ( = ?AUTO_254 ?AUTO_249 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_252 ?AUTO_254 ?AUTO_249 )
      ( DELIVER-PKG ?AUTO_243 ?AUTO_244 )
      ( DELIVER-PKG-VERIFY ?AUTO_243 ?AUTO_244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_256 - OBJ
      ?AUTO_257 - LOCATION
    )
    :vars
    (
      ?AUTO_263 - LOCATION
      ?AUTO_261 - CITY
      ?AUTO_264 - TRUCK
      ?AUTO_265 - LOCATION
      ?AUTO_262 - CITY
      ?AUTO_266 - LOCATION
      ?AUTO_258 - AIRPLANE
      ?AUTO_268 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_263 ?AUTO_261 ) ( IN-CITY ?AUTO_257 ?AUTO_261 ) ( not ( = ?AUTO_257 ?AUTO_263 ) ) ( TRUCK-AT ?AUTO_264 ?AUTO_265 ) ( IN-CITY ?AUTO_265 ?AUTO_262 ) ( IN-CITY ?AUTO_263 ?AUTO_262 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( AIRPORT ?AUTO_266 ) ( AIRPORT ?AUTO_263 ) ( AIRPLANE-AT ?AUTO_258 ?AUTO_266 ) ( not ( = ?AUTO_266 ?AUTO_263 ) ) ( OBJ-AT ?AUTO_256 ?AUTO_268 ) ( AIRPLANE-AT ?AUTO_258 ?AUTO_268 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_256 ?AUTO_258 ?AUTO_268 )
      ( DELIVER-PKG ?AUTO_256 ?AUTO_257 )
      ( DELIVER-PKG-VERIFY ?AUTO_256 ?AUTO_257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_270 - OBJ
      ?AUTO_271 - LOCATION
    )
    :vars
    (
      ?AUTO_279 - LOCATION
      ?AUTO_281 - CITY
      ?AUTO_272 - TRUCK
      ?AUTO_278 - LOCATION
      ?AUTO_280 - CITY
      ?AUTO_275 - LOCATION
      ?AUTO_283 - LOCATION
      ?AUTO_277 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_279 ?AUTO_281 ) ( IN-CITY ?AUTO_271 ?AUTO_281 ) ( not ( = ?AUTO_271 ?AUTO_279 ) ) ( TRUCK-AT ?AUTO_272 ?AUTO_278 ) ( IN-CITY ?AUTO_278 ?AUTO_280 ) ( IN-CITY ?AUTO_279 ?AUTO_280 ) ( not ( = ?AUTO_279 ?AUTO_278 ) ) ( AIRPORT ?AUTO_275 ) ( AIRPORT ?AUTO_279 ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) ( OBJ-AT ?AUTO_270 ?AUTO_275 ) ( AIRPORT ?AUTO_283 ) ( AIRPLANE-AT ?AUTO_277 ?AUTO_283 ) ( not ( = ?AUTO_283 ?AUTO_275 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_277 ?AUTO_283 ?AUTO_275 )
      ( DELIVER-PKG ?AUTO_270 ?AUTO_271 )
      ( DELIVER-PKG-VERIFY ?AUTO_270 ?AUTO_271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_287 - OBJ
      ?AUTO_288 - LOCATION
    )
    :vars
    (
      ?AUTO_289 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_289 ?AUTO_288 ) ( IN-TRUCK ?AUTO_287 ?AUTO_289 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_287 ?AUTO_289 ?AUTO_288 )
      ( DELIVER-PKG-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_302 - OBJ
      ?AUTO_303 - LOCATION
    )
    :vars
    (
      ?AUTO_305 - TRUCK
      ?AUTO_304 - LOCATION
      ?AUTO_308 - CITY
      ?AUTO_310 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_305 ?AUTO_304 ) ( IN-CITY ?AUTO_304 ?AUTO_308 ) ( IN-CITY ?AUTO_303 ?AUTO_308 ) ( not ( = ?AUTO_303 ?AUTO_304 ) ) ( TRUCK-AT ?AUTO_305 ?AUTO_310 ) ( OBJ-AT ?AUTO_302 ?AUTO_310 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_302 ?AUTO_305 ?AUTO_310 )
      ( DELIVER-PKG ?AUTO_302 ?AUTO_303 )
      ( DELIVER-PKG-VERIFY ?AUTO_302 ?AUTO_303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_314 - OBJ
      ?AUTO_315 - LOCATION
    )
    :vars
    (
      ?AUTO_319 - TRUCK
      ?AUTO_318 - LOCATION
      ?AUTO_320 - CITY
      ?AUTO_321 - LOCATION
      ?AUTO_322 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_319 ?AUTO_318 ) ( IN-CITY ?AUTO_318 ?AUTO_320 ) ( IN-CITY ?AUTO_315 ?AUTO_320 ) ( not ( = ?AUTO_315 ?AUTO_318 ) ) ( TRUCK-AT ?AUTO_319 ?AUTO_321 ) ( IN-AIRPLANE ?AUTO_314 ?AUTO_322 ) ( AIRPLANE-AT ?AUTO_322 ?AUTO_321 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_314 ?AUTO_322 ?AUTO_321 )
      ( DELIVER-PKG ?AUTO_314 ?AUTO_315 )
      ( DELIVER-PKG-VERIFY ?AUTO_314 ?AUTO_315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_325 - OBJ
      ?AUTO_326 - LOCATION
    )
    :vars
    (
      ?AUTO_331 - TRUCK
      ?AUTO_332 - LOCATION
      ?AUTO_329 - CITY
      ?AUTO_330 - LOCATION
      ?AUTO_333 - AIRPLANE
      ?AUTO_335 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_331 ?AUTO_332 ) ( IN-CITY ?AUTO_332 ?AUTO_329 ) ( IN-CITY ?AUTO_326 ?AUTO_329 ) ( not ( = ?AUTO_326 ?AUTO_332 ) ) ( TRUCK-AT ?AUTO_331 ?AUTO_330 ) ( IN-AIRPLANE ?AUTO_325 ?AUTO_333 ) ( AIRPORT ?AUTO_335 ) ( AIRPORT ?AUTO_330 ) ( AIRPLANE-AT ?AUTO_333 ?AUTO_335 ) ( not ( = ?AUTO_335 ?AUTO_330 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_333 ?AUTO_335 ?AUTO_330 )
      ( DELIVER-PKG ?AUTO_325 ?AUTO_326 )
      ( DELIVER-PKG-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_337 - OBJ
      ?AUTO_338 - LOCATION
    )
    :vars
    (
      ?AUTO_341 - TRUCK
      ?AUTO_343 - LOCATION
      ?AUTO_346 - CITY
      ?AUTO_345 - LOCATION
      ?AUTO_340 - LOCATION
      ?AUTO_344 - AIRPLANE
      ?AUTO_348 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_341 ?AUTO_343 ) ( IN-CITY ?AUTO_343 ?AUTO_346 ) ( IN-CITY ?AUTO_338 ?AUTO_346 ) ( not ( = ?AUTO_338 ?AUTO_343 ) ) ( TRUCK-AT ?AUTO_341 ?AUTO_345 ) ( AIRPORT ?AUTO_340 ) ( AIRPORT ?AUTO_345 ) ( AIRPLANE-AT ?AUTO_344 ?AUTO_340 ) ( not ( = ?AUTO_340 ?AUTO_345 ) ) ( OBJ-AT ?AUTO_337 ?AUTO_348 ) ( AIRPLANE-AT ?AUTO_344 ?AUTO_348 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_337 ?AUTO_344 ?AUTO_348 )
      ( DELIVER-PKG ?AUTO_337 ?AUTO_338 )
      ( DELIVER-PKG-VERIFY ?AUTO_337 ?AUTO_338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_350 - OBJ
      ?AUTO_351 - LOCATION
    )
    :vars
    (
      ?AUTO_352 - TRUCK
      ?AUTO_356 - LOCATION
      ?AUTO_358 - CITY
      ?AUTO_359 - LOCATION
      ?AUTO_354 - LOCATION
      ?AUTO_360 - AIRPLANE
      ?AUTO_357 - LOCATION
      ?AUTO_361 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_352 ?AUTO_356 ) ( IN-CITY ?AUTO_356 ?AUTO_358 ) ( IN-CITY ?AUTO_351 ?AUTO_358 ) ( not ( = ?AUTO_351 ?AUTO_356 ) ) ( TRUCK-AT ?AUTO_352 ?AUTO_359 ) ( AIRPORT ?AUTO_354 ) ( AIRPORT ?AUTO_359 ) ( AIRPLANE-AT ?AUTO_360 ?AUTO_354 ) ( not ( = ?AUTO_354 ?AUTO_359 ) ) ( AIRPLANE-AT ?AUTO_360 ?AUTO_357 ) ( TRUCK-AT ?AUTO_361 ?AUTO_357 ) ( IN-TRUCK ?AUTO_350 ?AUTO_361 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_350 ?AUTO_361 ?AUTO_357 )
      ( DELIVER-PKG ?AUTO_350 ?AUTO_351 )
      ( DELIVER-PKG-VERIFY ?AUTO_350 ?AUTO_351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_364 - OBJ
      ?AUTO_365 - LOCATION
    )
    :vars
    (
      ?AUTO_369 - TRUCK
      ?AUTO_371 - LOCATION
      ?AUTO_367 - CITY
      ?AUTO_366 - LOCATION
      ?AUTO_368 - LOCATION
      ?AUTO_372 - AIRPLANE
      ?AUTO_370 - LOCATION
      ?AUTO_373 - TRUCK
      ?AUTO_378 - LOCATION
      ?AUTO_377 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_369 ?AUTO_371 ) ( IN-CITY ?AUTO_371 ?AUTO_367 ) ( IN-CITY ?AUTO_365 ?AUTO_367 ) ( not ( = ?AUTO_365 ?AUTO_371 ) ) ( TRUCK-AT ?AUTO_369 ?AUTO_366 ) ( AIRPORT ?AUTO_368 ) ( AIRPORT ?AUTO_366 ) ( AIRPLANE-AT ?AUTO_372 ?AUTO_368 ) ( not ( = ?AUTO_368 ?AUTO_366 ) ) ( AIRPLANE-AT ?AUTO_372 ?AUTO_370 ) ( IN-TRUCK ?AUTO_364 ?AUTO_373 ) ( TRUCK-AT ?AUTO_373 ?AUTO_378 ) ( IN-CITY ?AUTO_378 ?AUTO_377 ) ( IN-CITY ?AUTO_370 ?AUTO_377 ) ( not ( = ?AUTO_370 ?AUTO_378 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_373 ?AUTO_378 ?AUTO_370 ?AUTO_377 )
      ( DELIVER-PKG ?AUTO_364 ?AUTO_365 )
      ( DELIVER-PKG-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_380 - OBJ
      ?AUTO_381 - LOCATION
    )
    :vars
    (
      ?AUTO_390 - TRUCK
      ?AUTO_383 - LOCATION
      ?AUTO_391 - CITY
      ?AUTO_382 - LOCATION
      ?AUTO_387 - LOCATION
      ?AUTO_393 - AIRPLANE
      ?AUTO_389 - LOCATION
      ?AUTO_392 - TRUCK
      ?AUTO_384 - LOCATION
      ?AUTO_385 - CITY
      ?AUTO_395 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_390 ?AUTO_383 ) ( IN-CITY ?AUTO_383 ?AUTO_391 ) ( IN-CITY ?AUTO_381 ?AUTO_391 ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( TRUCK-AT ?AUTO_390 ?AUTO_382 ) ( AIRPORT ?AUTO_387 ) ( AIRPORT ?AUTO_382 ) ( AIRPLANE-AT ?AUTO_393 ?AUTO_387 ) ( not ( = ?AUTO_387 ?AUTO_382 ) ) ( AIRPLANE-AT ?AUTO_393 ?AUTO_389 ) ( TRUCK-AT ?AUTO_392 ?AUTO_384 ) ( IN-CITY ?AUTO_384 ?AUTO_385 ) ( IN-CITY ?AUTO_389 ?AUTO_385 ) ( not ( = ?AUTO_389 ?AUTO_384 ) ) ( TRUCK-AT ?AUTO_392 ?AUTO_395 ) ( OBJ-AT ?AUTO_380 ?AUTO_395 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_380 ?AUTO_392 ?AUTO_395 )
      ( DELIVER-PKG ?AUTO_380 ?AUTO_381 )
      ( DELIVER-PKG-VERIFY ?AUTO_380 ?AUTO_381 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_397 - OBJ
      ?AUTO_398 - LOCATION
    )
    :vars
    (
      ?AUTO_404 - TRUCK
      ?AUTO_401 - LOCATION
      ?AUTO_405 - CITY
      ?AUTO_409 - LOCATION
      ?AUTO_403 - LOCATION
      ?AUTO_410 - AIRPLANE
      ?AUTO_411 - LOCATION
      ?AUTO_402 - LOCATION
      ?AUTO_406 - CITY
      ?AUTO_407 - TRUCK
      ?AUTO_414 - LOCATION
      ?AUTO_413 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_404 ?AUTO_401 ) ( IN-CITY ?AUTO_401 ?AUTO_405 ) ( IN-CITY ?AUTO_398 ?AUTO_405 ) ( not ( = ?AUTO_398 ?AUTO_401 ) ) ( TRUCK-AT ?AUTO_404 ?AUTO_409 ) ( AIRPORT ?AUTO_403 ) ( AIRPORT ?AUTO_409 ) ( AIRPLANE-AT ?AUTO_410 ?AUTO_403 ) ( not ( = ?AUTO_403 ?AUTO_409 ) ) ( AIRPLANE-AT ?AUTO_410 ?AUTO_411 ) ( IN-CITY ?AUTO_402 ?AUTO_406 ) ( IN-CITY ?AUTO_411 ?AUTO_406 ) ( not ( = ?AUTO_411 ?AUTO_402 ) ) ( OBJ-AT ?AUTO_397 ?AUTO_402 ) ( TRUCK-AT ?AUTO_407 ?AUTO_414 ) ( IN-CITY ?AUTO_414 ?AUTO_413 ) ( IN-CITY ?AUTO_402 ?AUTO_413 ) ( not ( = ?AUTO_402 ?AUTO_414 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_407 ?AUTO_414 ?AUTO_402 ?AUTO_413 )
      ( DELIVER-PKG ?AUTO_397 ?AUTO_398 )
      ( DELIVER-PKG-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_418 - OBJ
      ?AUTO_419 - LOCATION
    )
    :vars
    (
      ?AUTO_420 - TRUCK
      ?AUTO_432 - LOCATION
      ?AUTO_422 - CITY
      ?AUTO_431 - LOCATION
      ?AUTO_426 - LOCATION
      ?AUTO_429 - LOCATION
      ?AUTO_425 - CITY
      ?AUTO_423 - TRUCK
      ?AUTO_427 - LOCATION
      ?AUTO_428 - CITY
      ?AUTO_435 - LOCATION
      ?AUTO_424 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_420 ?AUTO_432 ) ( IN-CITY ?AUTO_432 ?AUTO_422 ) ( IN-CITY ?AUTO_419 ?AUTO_422 ) ( not ( = ?AUTO_419 ?AUTO_432 ) ) ( TRUCK-AT ?AUTO_420 ?AUTO_431 ) ( AIRPORT ?AUTO_426 ) ( AIRPORT ?AUTO_431 ) ( not ( = ?AUTO_426 ?AUTO_431 ) ) ( IN-CITY ?AUTO_429 ?AUTO_425 ) ( IN-CITY ?AUTO_426 ?AUTO_425 ) ( not ( = ?AUTO_426 ?AUTO_429 ) ) ( OBJ-AT ?AUTO_418 ?AUTO_429 ) ( TRUCK-AT ?AUTO_423 ?AUTO_427 ) ( IN-CITY ?AUTO_427 ?AUTO_428 ) ( IN-CITY ?AUTO_429 ?AUTO_428 ) ( not ( = ?AUTO_429 ?AUTO_427 ) ) ( AIRPORT ?AUTO_435 ) ( AIRPLANE-AT ?AUTO_424 ?AUTO_435 ) ( not ( = ?AUTO_435 ?AUTO_426 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_424 ?AUTO_435 ?AUTO_426 )
      ( DELIVER-PKG ?AUTO_418 ?AUTO_419 )
      ( DELIVER-PKG-VERIFY ?AUTO_418 ?AUTO_419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_443 - OBJ
      ?AUTO_444 - LOCATION
    )
    :vars
    (
      ?AUTO_445 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_445 ?AUTO_444 ) ( IN-TRUCK ?AUTO_443 ?AUTO_445 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_443 ?AUTO_445 ?AUTO_444 )
      ( DELIVER-PKG-VERIFY ?AUTO_443 ?AUTO_444 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_450 - OBJ
      ?AUTO_451 - LOCATION
    )
    :vars
    (
      ?AUTO_453 - TRUCK
      ?AUTO_457 - LOCATION
      ?AUTO_456 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_450 ?AUTO_453 ) ( TRUCK-AT ?AUTO_453 ?AUTO_457 ) ( IN-CITY ?AUTO_457 ?AUTO_456 ) ( IN-CITY ?AUTO_451 ?AUTO_456 ) ( not ( = ?AUTO_451 ?AUTO_457 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_453 ?AUTO_457 ?AUTO_451 ?AUTO_456 )
      ( DELIVER-PKG ?AUTO_450 ?AUTO_451 )
      ( DELIVER-PKG-VERIFY ?AUTO_450 ?AUTO_451 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_463 - OBJ
      ?AUTO_464 - LOCATION
    )
    :vars
    (
      ?AUTO_469 - TRUCK
      ?AUTO_466 - LOCATION
      ?AUTO_465 - CITY
      ?AUTO_471 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_469 ?AUTO_466 ) ( IN-CITY ?AUTO_466 ?AUTO_465 ) ( IN-CITY ?AUTO_464 ?AUTO_465 ) ( not ( = ?AUTO_464 ?AUTO_466 ) ) ( TRUCK-AT ?AUTO_469 ?AUTO_471 ) ( OBJ-AT ?AUTO_463 ?AUTO_471 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_463 ?AUTO_469 ?AUTO_471 )
      ( DELIVER-PKG ?AUTO_463 ?AUTO_464 )
      ( DELIVER-PKG-VERIFY ?AUTO_463 ?AUTO_464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_474 - OBJ
      ?AUTO_475 - LOCATION
    )
    :vars
    (
      ?AUTO_476 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_476 ?AUTO_475 ) ( IN-TRUCK ?AUTO_474 ?AUTO_476 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_474 ?AUTO_476 ?AUTO_475 )
      ( DELIVER-PKG-VERIFY ?AUTO_474 ?AUTO_475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_481 - OBJ
      ?AUTO_482 - LOCATION
    )
    :vars
    (
      ?AUTO_485 - TRUCK
      ?AUTO_488 - LOCATION
      ?AUTO_487 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_481 ?AUTO_485 ) ( TRUCK-AT ?AUTO_485 ?AUTO_488 ) ( IN-CITY ?AUTO_488 ?AUTO_487 ) ( IN-CITY ?AUTO_482 ?AUTO_487 ) ( not ( = ?AUTO_482 ?AUTO_488 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_485 ?AUTO_488 ?AUTO_482 ?AUTO_487 )
      ( DELIVER-PKG ?AUTO_481 ?AUTO_482 )
      ( DELIVER-PKG-VERIFY ?AUTO_481 ?AUTO_482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_490 - OBJ
      ?AUTO_491 - LOCATION
    )
    :vars
    (
      ?AUTO_494 - TRUCK
      ?AUTO_496 - LOCATION
      ?AUTO_495 - CITY
      ?AUTO_498 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_494 ?AUTO_496 ) ( IN-CITY ?AUTO_496 ?AUTO_495 ) ( IN-CITY ?AUTO_491 ?AUTO_495 ) ( not ( = ?AUTO_491 ?AUTO_496 ) ) ( TRUCK-AT ?AUTO_494 ?AUTO_498 ) ( OBJ-AT ?AUTO_490 ?AUTO_498 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_490 ?AUTO_494 ?AUTO_498 )
      ( DELIVER-PKG ?AUTO_490 ?AUTO_491 )
      ( DELIVER-PKG-VERIFY ?AUTO_490 ?AUTO_491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_502 - OBJ
      ?AUTO_503 - LOCATION
    )
    :vars
    (
      ?AUTO_504 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_502 ?AUTO_504 ) ( AIRPLANE-AT ?AUTO_504 ?AUTO_503 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_502 ?AUTO_504 ?AUTO_503 )
      ( DELIVER-PKG-VERIFY ?AUTO_502 ?AUTO_503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_507 - OBJ
      ?AUTO_508 - LOCATION
    )
    :vars
    (
      ?AUTO_511 - AIRPLANE
      ?AUTO_513 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_507 ?AUTO_511 ) ( AIRPORT ?AUTO_513 ) ( AIRPORT ?AUTO_508 ) ( AIRPLANE-AT ?AUTO_511 ?AUTO_513 ) ( not ( = ?AUTO_513 ?AUTO_508 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_511 ?AUTO_513 ?AUTO_508 )
      ( DELIVER-PKG ?AUTO_507 ?AUTO_508 )
      ( DELIVER-PKG-VERIFY ?AUTO_507 ?AUTO_508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_515 - OBJ
      ?AUTO_516 - LOCATION
    )
    :vars
    (
      ?AUTO_520 - LOCATION
      ?AUTO_519 - AIRPLANE
      ?AUTO_522 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_520 ) ( AIRPORT ?AUTO_516 ) ( AIRPLANE-AT ?AUTO_519 ?AUTO_520 ) ( not ( = ?AUTO_520 ?AUTO_516 ) ) ( OBJ-AT ?AUTO_515 ?AUTO_522 ) ( AIRPLANE-AT ?AUTO_519 ?AUTO_522 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_515 ?AUTO_519 ?AUTO_522 )
      ( DELIVER-PKG ?AUTO_515 ?AUTO_516 )
      ( DELIVER-PKG-VERIFY ?AUTO_515 ?AUTO_516 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_534 - OBJ
      ?AUTO_535 - LOCATION
    )
    :vars
    (
      ?AUTO_536 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_536 ?AUTO_535 ) ( IN-TRUCK ?AUTO_534 ?AUTO_536 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_534 ?AUTO_536 ?AUTO_535 )
      ( DELIVER-PKG-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_545 - OBJ
      ?AUTO_546 - LOCATION
    )
    :vars
    (
      ?AUTO_549 - TRUCK
      ?AUTO_552 - LOCATION
      ?AUTO_551 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_545 ?AUTO_549 ) ( TRUCK-AT ?AUTO_549 ?AUTO_552 ) ( IN-CITY ?AUTO_552 ?AUTO_551 ) ( IN-CITY ?AUTO_546 ?AUTO_551 ) ( not ( = ?AUTO_546 ?AUTO_552 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_549 ?AUTO_552 ?AUTO_546 ?AUTO_551 )
      ( DELIVER-PKG ?AUTO_545 ?AUTO_546 )
      ( DELIVER-PKG-VERIFY ?AUTO_545 ?AUTO_546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_554 - OBJ
      ?AUTO_555 - LOCATION
    )
    :vars
    (
      ?AUTO_558 - TRUCK
      ?AUTO_560 - LOCATION
      ?AUTO_559 - CITY
      ?AUTO_562 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_558 ?AUTO_560 ) ( IN-CITY ?AUTO_560 ?AUTO_559 ) ( IN-CITY ?AUTO_555 ?AUTO_559 ) ( not ( = ?AUTO_555 ?AUTO_560 ) ) ( TRUCK-AT ?AUTO_558 ?AUTO_562 ) ( OBJ-AT ?AUTO_554 ?AUTO_562 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_554 ?AUTO_558 ?AUTO_562 )
      ( DELIVER-PKG ?AUTO_554 ?AUTO_555 )
      ( DELIVER-PKG-VERIFY ?AUTO_554 ?AUTO_555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_564 - OBJ
      ?AUTO_565 - LOCATION
    )
    :vars
    (
      ?AUTO_568 - TRUCK
      ?AUTO_570 - LOCATION
      ?AUTO_569 - CITY
      ?AUTO_571 - LOCATION
      ?AUTO_572 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_568 ?AUTO_570 ) ( IN-CITY ?AUTO_570 ?AUTO_569 ) ( IN-CITY ?AUTO_565 ?AUTO_569 ) ( not ( = ?AUTO_565 ?AUTO_570 ) ) ( TRUCK-AT ?AUTO_568 ?AUTO_571 ) ( IN-AIRPLANE ?AUTO_564 ?AUTO_572 ) ( AIRPLANE-AT ?AUTO_572 ?AUTO_571 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_564 ?AUTO_572 ?AUTO_571 )
      ( DELIVER-PKG ?AUTO_564 ?AUTO_565 )
      ( DELIVER-PKG-VERIFY ?AUTO_564 ?AUTO_565 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_575 - OBJ
      ?AUTO_576 - LOCATION
    )
    :vars
    (
      ?AUTO_577 - TRUCK
      ?AUTO_580 - LOCATION
      ?AUTO_578 - CITY
      ?AUTO_583 - LOCATION
      ?AUTO_579 - AIRPLANE
      ?AUTO_585 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_577 ?AUTO_580 ) ( IN-CITY ?AUTO_580 ?AUTO_578 ) ( IN-CITY ?AUTO_576 ?AUTO_578 ) ( not ( = ?AUTO_576 ?AUTO_580 ) ) ( TRUCK-AT ?AUTO_577 ?AUTO_583 ) ( IN-AIRPLANE ?AUTO_575 ?AUTO_579 ) ( AIRPORT ?AUTO_585 ) ( AIRPORT ?AUTO_583 ) ( AIRPLANE-AT ?AUTO_579 ?AUTO_585 ) ( not ( = ?AUTO_585 ?AUTO_583 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_579 ?AUTO_585 ?AUTO_583 )
      ( DELIVER-PKG ?AUTO_575 ?AUTO_576 )
      ( DELIVER-PKG-VERIFY ?AUTO_575 ?AUTO_576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_587 - OBJ
      ?AUTO_588 - LOCATION
    )
    :vars
    (
      ?AUTO_593 - TRUCK
      ?AUTO_595 - LOCATION
      ?AUTO_589 - CITY
      ?AUTO_594 - LOCATION
      ?AUTO_590 - LOCATION
      ?AUTO_596 - AIRPLANE
      ?AUTO_598 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_593 ?AUTO_595 ) ( IN-CITY ?AUTO_595 ?AUTO_589 ) ( IN-CITY ?AUTO_588 ?AUTO_589 ) ( not ( = ?AUTO_588 ?AUTO_595 ) ) ( TRUCK-AT ?AUTO_593 ?AUTO_594 ) ( AIRPORT ?AUTO_590 ) ( AIRPORT ?AUTO_594 ) ( AIRPLANE-AT ?AUTO_596 ?AUTO_590 ) ( not ( = ?AUTO_590 ?AUTO_594 ) ) ( OBJ-AT ?AUTO_587 ?AUTO_598 ) ( AIRPLANE-AT ?AUTO_596 ?AUTO_598 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_587 ?AUTO_596 ?AUTO_598 )
      ( DELIVER-PKG ?AUTO_587 ?AUTO_588 )
      ( DELIVER-PKG-VERIFY ?AUTO_587 ?AUTO_588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_610 - OBJ
      ?AUTO_611 - LOCATION
    )
    :vars
    (
      ?AUTO_612 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_610 ?AUTO_612 ) ( AIRPLANE-AT ?AUTO_612 ?AUTO_611 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_610 ?AUTO_612 ?AUTO_611 )
      ( DELIVER-PKG-VERIFY ?AUTO_610 ?AUTO_611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_619 - OBJ
      ?AUTO_620 - LOCATION
    )
    :vars
    (
      ?AUTO_623 - AIRPLANE
      ?AUTO_625 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_619 ?AUTO_623 ) ( AIRPORT ?AUTO_625 ) ( AIRPORT ?AUTO_620 ) ( AIRPLANE-AT ?AUTO_623 ?AUTO_625 ) ( not ( = ?AUTO_625 ?AUTO_620 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_623 ?AUTO_625 ?AUTO_620 )
      ( DELIVER-PKG ?AUTO_619 ?AUTO_620 )
      ( DELIVER-PKG-VERIFY ?AUTO_619 ?AUTO_620 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_627 - OBJ
      ?AUTO_628 - LOCATION
    )
    :vars
    (
      ?AUTO_632 - LOCATION
      ?AUTO_631 - AIRPLANE
      ?AUTO_634 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_632 ) ( AIRPORT ?AUTO_628 ) ( AIRPLANE-AT ?AUTO_631 ?AUTO_632 ) ( not ( = ?AUTO_632 ?AUTO_628 ) ) ( OBJ-AT ?AUTO_627 ?AUTO_634 ) ( AIRPLANE-AT ?AUTO_631 ?AUTO_634 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_627 ?AUTO_631 ?AUTO_634 )
      ( DELIVER-PKG ?AUTO_627 ?AUTO_628 )
      ( DELIVER-PKG-VERIFY ?AUTO_627 ?AUTO_628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_642 - OBJ
      ?AUTO_643 - LOCATION
    )
    :vars
    (
      ?AUTO_647 - LOCATION
      ?AUTO_650 - LOCATION
      ?AUTO_648 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_647 ) ( AIRPORT ?AUTO_643 ) ( not ( = ?AUTO_647 ?AUTO_643 ) ) ( OBJ-AT ?AUTO_642 ?AUTO_647 ) ( AIRPORT ?AUTO_650 ) ( AIRPLANE-AT ?AUTO_648 ?AUTO_650 ) ( not ( = ?AUTO_650 ?AUTO_647 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_648 ?AUTO_650 ?AUTO_647 )
      ( DELIVER-PKG ?AUTO_642 ?AUTO_643 )
      ( DELIVER-PKG-VERIFY ?AUTO_642 ?AUTO_643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_664 - OBJ
      ?AUTO_665 - LOCATION
    )
    :vars
    (
      ?AUTO_666 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_666 ?AUTO_665 ) ( IN-TRUCK ?AUTO_664 ?AUTO_666 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_664 ?AUTO_666 ?AUTO_665 )
      ( DELIVER-PKG-VERIFY ?AUTO_664 ?AUTO_665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_669 - OBJ
      ?AUTO_670 - LOCATION
    )
    :vars
    (
      ?AUTO_673 - TRUCK
      ?AUTO_676 - LOCATION
      ?AUTO_675 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_669 ?AUTO_673 ) ( TRUCK-AT ?AUTO_673 ?AUTO_676 ) ( IN-CITY ?AUTO_676 ?AUTO_675 ) ( IN-CITY ?AUTO_670 ?AUTO_675 ) ( not ( = ?AUTO_670 ?AUTO_676 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_673 ?AUTO_676 ?AUTO_670 ?AUTO_675 )
      ( DELIVER-PKG ?AUTO_669 ?AUTO_670 )
      ( DELIVER-PKG-VERIFY ?AUTO_669 ?AUTO_670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_710 - OBJ
      ?AUTO_711 - LOCATION
    )
    :vars
    (
      ?AUTO_712 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_710 ?AUTO_712 ) ( AIRPLANE-AT ?AUTO_712 ?AUTO_711 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_710 ?AUTO_712 ?AUTO_711 )
      ( DELIVER-PKG-VERIFY ?AUTO_710 ?AUTO_711 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_723 - OBJ
      ?AUTO_724 - LOCATION
    )
    :vars
    (
      ?AUTO_727 - AIRPLANE
      ?AUTO_729 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_723 ?AUTO_727 ) ( AIRPORT ?AUTO_729 ) ( AIRPORT ?AUTO_724 ) ( AIRPLANE-AT ?AUTO_727 ?AUTO_729 ) ( not ( = ?AUTO_729 ?AUTO_724 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_727 ?AUTO_729 ?AUTO_724 )
      ( DELIVER-PKG ?AUTO_723 ?AUTO_724 )
      ( DELIVER-PKG-VERIFY ?AUTO_723 ?AUTO_724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_735 - OBJ
      ?AUTO_736 - LOCATION
    )
    :vars
    (
      ?AUTO_738 - LOCATION
      ?AUTO_740 - AIRPLANE
      ?AUTO_742 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_738 ) ( AIRPORT ?AUTO_736 ) ( AIRPLANE-AT ?AUTO_740 ?AUTO_738 ) ( not ( = ?AUTO_738 ?AUTO_736 ) ) ( OBJ-AT ?AUTO_735 ?AUTO_742 ) ( AIRPLANE-AT ?AUTO_740 ?AUTO_742 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_735 ?AUTO_740 ?AUTO_742 )
      ( DELIVER-PKG ?AUTO_735 ?AUTO_736 )
      ( DELIVER-PKG-VERIFY ?AUTO_735 ?AUTO_736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_744 - OBJ
      ?AUTO_745 - LOCATION
    )
    :vars
    (
      ?AUTO_750 - LOCATION
      ?AUTO_752 - LOCATION
      ?AUTO_749 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_750 ) ( AIRPORT ?AUTO_745 ) ( not ( = ?AUTO_750 ?AUTO_745 ) ) ( OBJ-AT ?AUTO_744 ?AUTO_750 ) ( AIRPORT ?AUTO_752 ) ( AIRPLANE-AT ?AUTO_749 ?AUTO_752 ) ( not ( = ?AUTO_752 ?AUTO_750 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_749 ?AUTO_752 ?AUTO_750 )
      ( DELIVER-PKG ?AUTO_744 ?AUTO_745 )
      ( DELIVER-PKG-VERIFY ?AUTO_744 ?AUTO_745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_766 - OBJ
      ?AUTO_767 - LOCATION
    )
    :vars
    (
      ?AUTO_769 - LOCATION
      ?AUTO_768 - LOCATION
      ?AUTO_771 - AIRPLANE
      ?AUTO_773 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_769 ) ( AIRPORT ?AUTO_767 ) ( not ( = ?AUTO_769 ?AUTO_767 ) ) ( AIRPORT ?AUTO_768 ) ( AIRPLANE-AT ?AUTO_771 ?AUTO_768 ) ( not ( = ?AUTO_768 ?AUTO_769 ) ) ( TRUCK-AT ?AUTO_773 ?AUTO_769 ) ( IN-TRUCK ?AUTO_766 ?AUTO_773 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_766 ?AUTO_773 ?AUTO_769 )
      ( DELIVER-PKG ?AUTO_766 ?AUTO_767 )
      ( DELIVER-PKG-VERIFY ?AUTO_766 ?AUTO_767 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_778 - OBJ
      ?AUTO_779 - LOCATION
    )
    :vars
    (
      ?AUTO_781 - LOCATION
      ?AUTO_784 - LOCATION
      ?AUTO_785 - AIRPLANE
      ?AUTO_783 - TRUCK
      ?AUTO_788 - LOCATION
      ?AUTO_787 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_781 ) ( AIRPORT ?AUTO_779 ) ( not ( = ?AUTO_781 ?AUTO_779 ) ) ( AIRPORT ?AUTO_784 ) ( AIRPLANE-AT ?AUTO_785 ?AUTO_784 ) ( not ( = ?AUTO_784 ?AUTO_781 ) ) ( IN-TRUCK ?AUTO_778 ?AUTO_783 ) ( TRUCK-AT ?AUTO_783 ?AUTO_788 ) ( IN-CITY ?AUTO_788 ?AUTO_787 ) ( IN-CITY ?AUTO_781 ?AUTO_787 ) ( not ( = ?AUTO_781 ?AUTO_788 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_783 ?AUTO_788 ?AUTO_781 ?AUTO_787 )
      ( DELIVER-PKG ?AUTO_778 ?AUTO_779 )
      ( DELIVER-PKG-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_790 - OBJ
      ?AUTO_791 - LOCATION
    )
    :vars
    (
      ?AUTO_795 - LOCATION
      ?AUTO_794 - LOCATION
      ?AUTO_796 - AIRPLANE
      ?AUTO_798 - TRUCK
      ?AUTO_799 - LOCATION
      ?AUTO_797 - CITY
      ?AUTO_801 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_795 ) ( AIRPORT ?AUTO_791 ) ( not ( = ?AUTO_795 ?AUTO_791 ) ) ( AIRPORT ?AUTO_794 ) ( AIRPLANE-AT ?AUTO_796 ?AUTO_794 ) ( not ( = ?AUTO_794 ?AUTO_795 ) ) ( TRUCK-AT ?AUTO_798 ?AUTO_799 ) ( IN-CITY ?AUTO_799 ?AUTO_797 ) ( IN-CITY ?AUTO_795 ?AUTO_797 ) ( not ( = ?AUTO_795 ?AUTO_799 ) ) ( TRUCK-AT ?AUTO_798 ?AUTO_801 ) ( OBJ-AT ?AUTO_790 ?AUTO_801 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_790 ?AUTO_798 ?AUTO_801 )
      ( DELIVER-PKG ?AUTO_790 ?AUTO_791 )
      ( DELIVER-PKG-VERIFY ?AUTO_790 ?AUTO_791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_805 - OBJ
      ?AUTO_806 - LOCATION
    )
    :vars
    (
      ?AUTO_807 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_805 ?AUTO_807 ) ( AIRPLANE-AT ?AUTO_807 ?AUTO_806 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_805 ?AUTO_807 ?AUTO_806 )
      ( DELIVER-PKG-VERIFY ?AUTO_805 ?AUTO_806 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_812 - OBJ
      ?AUTO_813 - LOCATION
    )
    :vars
    (
      ?AUTO_815 - AIRPLANE
      ?AUTO_818 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_812 ?AUTO_815 ) ( AIRPORT ?AUTO_818 ) ( AIRPORT ?AUTO_813 ) ( AIRPLANE-AT ?AUTO_815 ?AUTO_818 ) ( not ( = ?AUTO_818 ?AUTO_813 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_815 ?AUTO_818 ?AUTO_813 )
      ( DELIVER-PKG ?AUTO_812 ?AUTO_813 )
      ( DELIVER-PKG-VERIFY ?AUTO_812 ?AUTO_813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_820 - OBJ
      ?AUTO_821 - LOCATION
    )
    :vars
    (
      ?AUTO_825 - LOCATION
      ?AUTO_824 - AIRPLANE
      ?AUTO_827 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_825 ) ( AIRPORT ?AUTO_821 ) ( AIRPLANE-AT ?AUTO_824 ?AUTO_825 ) ( not ( = ?AUTO_825 ?AUTO_821 ) ) ( OBJ-AT ?AUTO_820 ?AUTO_827 ) ( AIRPLANE-AT ?AUTO_824 ?AUTO_827 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_820 ?AUTO_824 ?AUTO_827 )
      ( DELIVER-PKG ?AUTO_820 ?AUTO_821 )
      ( DELIVER-PKG-VERIFY ?AUTO_820 ?AUTO_821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_829 - OBJ
      ?AUTO_830 - LOCATION
    )
    :vars
    (
      ?AUTO_834 - LOCATION
      ?AUTO_833 - AIRPLANE
      ?AUTO_835 - LOCATION
      ?AUTO_836 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_834 ) ( AIRPORT ?AUTO_830 ) ( AIRPLANE-AT ?AUTO_833 ?AUTO_834 ) ( not ( = ?AUTO_834 ?AUTO_830 ) ) ( AIRPLANE-AT ?AUTO_833 ?AUTO_835 ) ( TRUCK-AT ?AUTO_836 ?AUTO_835 ) ( IN-TRUCK ?AUTO_829 ?AUTO_836 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_829 ?AUTO_836 ?AUTO_835 )
      ( DELIVER-PKG ?AUTO_829 ?AUTO_830 )
      ( DELIVER-PKG-VERIFY ?AUTO_829 ?AUTO_830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_839 - OBJ
      ?AUTO_840 - LOCATION
    )
    :vars
    (
      ?AUTO_842 - LOCATION
      ?AUTO_845 - AIRPLANE
      ?AUTO_844 - LOCATION
      ?AUTO_846 - TRUCK
      ?AUTO_849 - LOCATION
      ?AUTO_848 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_842 ) ( AIRPORT ?AUTO_840 ) ( AIRPLANE-AT ?AUTO_845 ?AUTO_842 ) ( not ( = ?AUTO_842 ?AUTO_840 ) ) ( AIRPLANE-AT ?AUTO_845 ?AUTO_844 ) ( IN-TRUCK ?AUTO_839 ?AUTO_846 ) ( TRUCK-AT ?AUTO_846 ?AUTO_849 ) ( IN-CITY ?AUTO_849 ?AUTO_848 ) ( IN-CITY ?AUTO_844 ?AUTO_848 ) ( not ( = ?AUTO_844 ?AUTO_849 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_846 ?AUTO_849 ?AUTO_844 ?AUTO_848 )
      ( DELIVER-PKG ?AUTO_839 ?AUTO_840 )
      ( DELIVER-PKG-VERIFY ?AUTO_839 ?AUTO_840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_875 - OBJ
      ?AUTO_876 - LOCATION
    )
    :vars
    (
      ?AUTO_879 - LOCATION
      ?AUTO_877 - AIRPLANE
      ?AUTO_881 - LOCATION
      ?AUTO_882 - TRUCK
      ?AUTO_878 - LOCATION
      ?AUTO_880 - CITY
      ?AUTO_886 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_879 ) ( AIRPORT ?AUTO_876 ) ( AIRPLANE-AT ?AUTO_877 ?AUTO_879 ) ( not ( = ?AUTO_879 ?AUTO_876 ) ) ( AIRPLANE-AT ?AUTO_877 ?AUTO_881 ) ( TRUCK-AT ?AUTO_882 ?AUTO_878 ) ( IN-CITY ?AUTO_878 ?AUTO_880 ) ( IN-CITY ?AUTO_881 ?AUTO_880 ) ( not ( = ?AUTO_881 ?AUTO_878 ) ) ( TRUCK-AT ?AUTO_882 ?AUTO_886 ) ( OBJ-AT ?AUTO_875 ?AUTO_886 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_875 ?AUTO_882 ?AUTO_886 )
      ( DELIVER-PKG ?AUTO_875 ?AUTO_876 )
      ( DELIVER-PKG-VERIFY ?AUTO_875 ?AUTO_876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_894 - OBJ
      ?AUTO_895 - LOCATION
    )
    :vars
    (
      ?AUTO_896 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_896 ?AUTO_895 ) ( IN-TRUCK ?AUTO_894 ?AUTO_896 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_894 ?AUTO_896 ?AUTO_895 )
      ( DELIVER-PKG-VERIFY ?AUTO_894 ?AUTO_895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_899 - OBJ
      ?AUTO_900 - LOCATION
    )
    :vars
    (
      ?AUTO_903 - TRUCK
      ?AUTO_906 - LOCATION
      ?AUTO_905 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_899 ?AUTO_903 ) ( TRUCK-AT ?AUTO_903 ?AUTO_906 ) ( IN-CITY ?AUTO_906 ?AUTO_905 ) ( IN-CITY ?AUTO_900 ?AUTO_905 ) ( not ( = ?AUTO_900 ?AUTO_906 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_903 ?AUTO_906 ?AUTO_900 ?AUTO_905 )
      ( DELIVER-PKG ?AUTO_899 ?AUTO_900 )
      ( DELIVER-PKG-VERIFY ?AUTO_899 ?AUTO_900 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_908 - OBJ
      ?AUTO_909 - LOCATION
    )
    :vars
    (
      ?AUTO_912 - TRUCK
      ?AUTO_914 - LOCATION
      ?AUTO_913 - CITY
      ?AUTO_916 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_912 ?AUTO_914 ) ( IN-CITY ?AUTO_914 ?AUTO_913 ) ( IN-CITY ?AUTO_909 ?AUTO_913 ) ( not ( = ?AUTO_909 ?AUTO_914 ) ) ( TRUCK-AT ?AUTO_912 ?AUTO_916 ) ( OBJ-AT ?AUTO_908 ?AUTO_916 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_908 ?AUTO_912 ?AUTO_916 )
      ( DELIVER-PKG ?AUTO_908 ?AUTO_909 )
      ( DELIVER-PKG-VERIFY ?AUTO_908 ?AUTO_909 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_920 - OBJ
      ?AUTO_921 - LOCATION
    )
    :vars
    (
      ?AUTO_927 - TRUCK
      ?AUTO_924 - LOCATION
      ?AUTO_922 - CITY
      ?AUTO_923 - LOCATION
      ?AUTO_928 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_927 ?AUTO_924 ) ( IN-CITY ?AUTO_924 ?AUTO_922 ) ( IN-CITY ?AUTO_921 ?AUTO_922 ) ( not ( = ?AUTO_921 ?AUTO_924 ) ) ( TRUCK-AT ?AUTO_927 ?AUTO_923 ) ( IN-AIRPLANE ?AUTO_920 ?AUTO_928 ) ( AIRPLANE-AT ?AUTO_928 ?AUTO_923 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_920 ?AUTO_928 ?AUTO_923 )
      ( DELIVER-PKG ?AUTO_920 ?AUTO_921 )
      ( DELIVER-PKG-VERIFY ?AUTO_920 ?AUTO_921 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_939 - OBJ
      ?AUTO_940 - LOCATION
    )
    :vars
    (
      ?AUTO_942 - TRUCK
      ?AUTO_945 - LOCATION
      ?AUTO_946 - CITY
      ?AUTO_947 - LOCATION
      ?AUTO_944 - AIRPLANE
      ?AUTO_949 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_942 ?AUTO_945 ) ( IN-CITY ?AUTO_945 ?AUTO_946 ) ( IN-CITY ?AUTO_940 ?AUTO_946 ) ( not ( = ?AUTO_940 ?AUTO_945 ) ) ( TRUCK-AT ?AUTO_942 ?AUTO_947 ) ( IN-AIRPLANE ?AUTO_939 ?AUTO_944 ) ( AIRPORT ?AUTO_949 ) ( AIRPORT ?AUTO_947 ) ( AIRPLANE-AT ?AUTO_944 ?AUTO_949 ) ( not ( = ?AUTO_949 ?AUTO_947 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_944 ?AUTO_949 ?AUTO_947 )
      ( DELIVER-PKG ?AUTO_939 ?AUTO_940 )
      ( DELIVER-PKG-VERIFY ?AUTO_939 ?AUTO_940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_955 - OBJ
      ?AUTO_956 - LOCATION
    )
    :vars
    (
      ?AUTO_960 - TRUCK
      ?AUTO_963 - LOCATION
      ?AUTO_962 - CITY
      ?AUTO_961 - LOCATION
      ?AUTO_964 - LOCATION
      ?AUTO_959 - AIRPLANE
      ?AUTO_966 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_960 ?AUTO_963 ) ( IN-CITY ?AUTO_963 ?AUTO_962 ) ( IN-CITY ?AUTO_956 ?AUTO_962 ) ( not ( = ?AUTO_956 ?AUTO_963 ) ) ( TRUCK-AT ?AUTO_960 ?AUTO_961 ) ( AIRPORT ?AUTO_964 ) ( AIRPORT ?AUTO_961 ) ( AIRPLANE-AT ?AUTO_959 ?AUTO_964 ) ( not ( = ?AUTO_964 ?AUTO_961 ) ) ( OBJ-AT ?AUTO_955 ?AUTO_966 ) ( AIRPLANE-AT ?AUTO_959 ?AUTO_966 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_955 ?AUTO_959 ?AUTO_966 )
      ( DELIVER-PKG ?AUTO_955 ?AUTO_956 )
      ( DELIVER-PKG-VERIFY ?AUTO_955 ?AUTO_956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_968 - OBJ
      ?AUTO_969 - LOCATION
    )
    :vars
    (
      ?AUTO_976 - TRUCK
      ?AUTO_973 - LOCATION
      ?AUTO_974 - CITY
      ?AUTO_975 - LOCATION
      ?AUTO_978 - LOCATION
      ?AUTO_980 - LOCATION
      ?AUTO_977 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_976 ?AUTO_973 ) ( IN-CITY ?AUTO_973 ?AUTO_974 ) ( IN-CITY ?AUTO_969 ?AUTO_974 ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( TRUCK-AT ?AUTO_976 ?AUTO_975 ) ( AIRPORT ?AUTO_978 ) ( AIRPORT ?AUTO_975 ) ( not ( = ?AUTO_978 ?AUTO_975 ) ) ( OBJ-AT ?AUTO_968 ?AUTO_978 ) ( AIRPORT ?AUTO_980 ) ( AIRPLANE-AT ?AUTO_977 ?AUTO_980 ) ( not ( = ?AUTO_980 ?AUTO_978 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_977 ?AUTO_980 ?AUTO_978 )
      ( DELIVER-PKG ?AUTO_968 ?AUTO_969 )
      ( DELIVER-PKG-VERIFY ?AUTO_968 ?AUTO_969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_994 - OBJ
      ?AUTO_995 - LOCATION
    )
    :vars
    (
      ?AUTO_996 - TRUCK
      ?AUTO_998 - LOCATION
      ?AUTO_1003 - CITY
      ?AUTO_997 - LOCATION
      ?AUTO_1004 - LOCATION
      ?AUTO_999 - LOCATION
      ?AUTO_1002 - AIRPLANE
      ?AUTO_1005 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_996 ?AUTO_998 ) ( IN-CITY ?AUTO_998 ?AUTO_1003 ) ( IN-CITY ?AUTO_995 ?AUTO_1003 ) ( not ( = ?AUTO_995 ?AUTO_998 ) ) ( TRUCK-AT ?AUTO_996 ?AUTO_997 ) ( AIRPORT ?AUTO_1004 ) ( AIRPORT ?AUTO_997 ) ( not ( = ?AUTO_1004 ?AUTO_997 ) ) ( AIRPORT ?AUTO_999 ) ( AIRPLANE-AT ?AUTO_1002 ?AUTO_999 ) ( not ( = ?AUTO_999 ?AUTO_1004 ) ) ( TRUCK-AT ?AUTO_1005 ?AUTO_1004 ) ( IN-TRUCK ?AUTO_994 ?AUTO_1005 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_994 ?AUTO_1005 ?AUTO_1004 )
      ( DELIVER-PKG ?AUTO_994 ?AUTO_995 )
      ( DELIVER-PKG-VERIFY ?AUTO_994 ?AUTO_995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1010 - OBJ
      ?AUTO_1011 - LOCATION
    )
    :vars
    (
      ?AUTO_1017 - TRUCK
      ?AUTO_1018 - LOCATION
      ?AUTO_1016 - CITY
      ?AUTO_1012 - LOCATION
      ?AUTO_1021 - LOCATION
      ?AUTO_1019 - LOCATION
      ?AUTO_1014 - AIRPLANE
      ?AUTO_1013 - TRUCK
      ?AUTO_1024 - LOCATION
      ?AUTO_1023 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1017 ?AUTO_1018 ) ( IN-CITY ?AUTO_1018 ?AUTO_1016 ) ( IN-CITY ?AUTO_1011 ?AUTO_1016 ) ( not ( = ?AUTO_1011 ?AUTO_1018 ) ) ( TRUCK-AT ?AUTO_1017 ?AUTO_1012 ) ( AIRPORT ?AUTO_1021 ) ( AIRPORT ?AUTO_1012 ) ( not ( = ?AUTO_1021 ?AUTO_1012 ) ) ( AIRPORT ?AUTO_1019 ) ( AIRPLANE-AT ?AUTO_1014 ?AUTO_1019 ) ( not ( = ?AUTO_1019 ?AUTO_1021 ) ) ( IN-TRUCK ?AUTO_1010 ?AUTO_1013 ) ( TRUCK-AT ?AUTO_1013 ?AUTO_1024 ) ( IN-CITY ?AUTO_1024 ?AUTO_1023 ) ( IN-CITY ?AUTO_1021 ?AUTO_1023 ) ( not ( = ?AUTO_1021 ?AUTO_1024 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1013 ?AUTO_1024 ?AUTO_1021 ?AUTO_1023 )
      ( DELIVER-PKG ?AUTO_1010 ?AUTO_1011 )
      ( DELIVER-PKG-VERIFY ?AUTO_1010 ?AUTO_1011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1026 - OBJ
      ?AUTO_1027 - LOCATION
    )
    :vars
    (
      ?AUTO_1037 - TRUCK
      ?AUTO_1034 - LOCATION
      ?AUTO_1031 - CITY
      ?AUTO_1032 - LOCATION
      ?AUTO_1033 - LOCATION
      ?AUTO_1038 - LOCATION
      ?AUTO_1039 - AIRPLANE
      ?AUTO_1036 - TRUCK
      ?AUTO_1029 - LOCATION
      ?AUTO_1028 - CITY
      ?AUTO_1041 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1037 ?AUTO_1034 ) ( IN-CITY ?AUTO_1034 ?AUTO_1031 ) ( IN-CITY ?AUTO_1027 ?AUTO_1031 ) ( not ( = ?AUTO_1027 ?AUTO_1034 ) ) ( TRUCK-AT ?AUTO_1037 ?AUTO_1032 ) ( AIRPORT ?AUTO_1033 ) ( AIRPORT ?AUTO_1032 ) ( not ( = ?AUTO_1033 ?AUTO_1032 ) ) ( AIRPORT ?AUTO_1038 ) ( AIRPLANE-AT ?AUTO_1039 ?AUTO_1038 ) ( not ( = ?AUTO_1038 ?AUTO_1033 ) ) ( TRUCK-AT ?AUTO_1036 ?AUTO_1029 ) ( IN-CITY ?AUTO_1029 ?AUTO_1028 ) ( IN-CITY ?AUTO_1033 ?AUTO_1028 ) ( not ( = ?AUTO_1033 ?AUTO_1029 ) ) ( TRUCK-AT ?AUTO_1036 ?AUTO_1041 ) ( OBJ-AT ?AUTO_1026 ?AUTO_1041 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1026 ?AUTO_1036 ?AUTO_1041 )
      ( DELIVER-PKG ?AUTO_1026 ?AUTO_1027 )
      ( DELIVER-PKG-VERIFY ?AUTO_1026 ?AUTO_1027 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1045 - OBJ
      ?AUTO_1046 - LOCATION
    )
    :vars
    (
      ?AUTO_1047 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1047 ?AUTO_1046 ) ( IN-TRUCK ?AUTO_1045 ?AUTO_1047 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1045 ?AUTO_1047 ?AUTO_1046 )
      ( DELIVER-PKG-VERIFY ?AUTO_1045 ?AUTO_1046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1050 - OBJ
      ?AUTO_1051 - LOCATION
    )
    :vars
    (
      ?AUTO_1053 - TRUCK
      ?AUTO_1057 - LOCATION
      ?AUTO_1056 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1050 ?AUTO_1053 ) ( TRUCK-AT ?AUTO_1053 ?AUTO_1057 ) ( IN-CITY ?AUTO_1057 ?AUTO_1056 ) ( IN-CITY ?AUTO_1051 ?AUTO_1056 ) ( not ( = ?AUTO_1051 ?AUTO_1057 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1053 ?AUTO_1057 ?AUTO_1051 ?AUTO_1056 )
      ( DELIVER-PKG ?AUTO_1050 ?AUTO_1051 )
      ( DELIVER-PKG-VERIFY ?AUTO_1050 ?AUTO_1051 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1059 - OBJ
      ?AUTO_1060 - LOCATION
    )
    :vars
    (
      ?AUTO_1061 - TRUCK
      ?AUTO_1065 - LOCATION
      ?AUTO_1064 - CITY
      ?AUTO_1067 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1061 ?AUTO_1065 ) ( IN-CITY ?AUTO_1065 ?AUTO_1064 ) ( IN-CITY ?AUTO_1060 ?AUTO_1064 ) ( not ( = ?AUTO_1060 ?AUTO_1065 ) ) ( TRUCK-AT ?AUTO_1061 ?AUTO_1067 ) ( OBJ-AT ?AUTO_1059 ?AUTO_1067 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1059 ?AUTO_1061 ?AUTO_1067 )
      ( DELIVER-PKG ?AUTO_1059 ?AUTO_1060 )
      ( DELIVER-PKG-VERIFY ?AUTO_1059 ?AUTO_1060 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1069 - OBJ
      ?AUTO_1070 - LOCATION
    )
    :vars
    (
      ?AUTO_1076 - LOCATION
      ?AUTO_1075 - CITY
      ?AUTO_1071 - TRUCK
      ?AUTO_1079 - LOCATION
      ?AUTO_1078 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1076 ?AUTO_1075 ) ( IN-CITY ?AUTO_1070 ?AUTO_1075 ) ( not ( = ?AUTO_1070 ?AUTO_1076 ) ) ( OBJ-AT ?AUTO_1069 ?AUTO_1076 ) ( TRUCK-AT ?AUTO_1071 ?AUTO_1079 ) ( IN-CITY ?AUTO_1079 ?AUTO_1078 ) ( IN-CITY ?AUTO_1076 ?AUTO_1078 ) ( not ( = ?AUTO_1076 ?AUTO_1079 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1071 ?AUTO_1079 ?AUTO_1076 ?AUTO_1078 )
      ( DELIVER-PKG ?AUTO_1069 ?AUTO_1070 )
      ( DELIVER-PKG-VERIFY ?AUTO_1069 ?AUTO_1070 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1087 - OBJ
      ?AUTO_1088 - LOCATION
    )
    :vars
    (
      ?AUTO_1093 - LOCATION
      ?AUTO_1095 - CITY
      ?AUTO_1094 - TRUCK
      ?AUTO_1089 - LOCATION
      ?AUTO_1091 - CITY
      ?AUTO_1096 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1093 ?AUTO_1095 ) ( IN-CITY ?AUTO_1088 ?AUTO_1095 ) ( not ( = ?AUTO_1088 ?AUTO_1093 ) ) ( TRUCK-AT ?AUTO_1094 ?AUTO_1089 ) ( IN-CITY ?AUTO_1089 ?AUTO_1091 ) ( IN-CITY ?AUTO_1093 ?AUTO_1091 ) ( not ( = ?AUTO_1093 ?AUTO_1089 ) ) ( IN-AIRPLANE ?AUTO_1087 ?AUTO_1096 ) ( AIRPLANE-AT ?AUTO_1096 ?AUTO_1093 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1087 ?AUTO_1096 ?AUTO_1093 )
      ( DELIVER-PKG ?AUTO_1087 ?AUTO_1088 )
      ( DELIVER-PKG-VERIFY ?AUTO_1087 ?AUTO_1088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1101 - OBJ
      ?AUTO_1102 - LOCATION
    )
    :vars
    (
      ?AUTO_1106 - LOCATION
      ?AUTO_1105 - CITY
      ?AUTO_1110 - TRUCK
      ?AUTO_1109 - LOCATION
      ?AUTO_1107 - CITY
      ?AUTO_1108 - AIRPLANE
      ?AUTO_1112 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1106 ?AUTO_1105 ) ( IN-CITY ?AUTO_1102 ?AUTO_1105 ) ( not ( = ?AUTO_1102 ?AUTO_1106 ) ) ( TRUCK-AT ?AUTO_1110 ?AUTO_1109 ) ( IN-CITY ?AUTO_1109 ?AUTO_1107 ) ( IN-CITY ?AUTO_1106 ?AUTO_1107 ) ( not ( = ?AUTO_1106 ?AUTO_1109 ) ) ( IN-AIRPLANE ?AUTO_1101 ?AUTO_1108 ) ( AIRPORT ?AUTO_1112 ) ( AIRPORT ?AUTO_1106 ) ( AIRPLANE-AT ?AUTO_1108 ?AUTO_1112 ) ( not ( = ?AUTO_1112 ?AUTO_1106 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1108 ?AUTO_1112 ?AUTO_1106 )
      ( DELIVER-PKG ?AUTO_1101 ?AUTO_1102 )
      ( DELIVER-PKG-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1114 - OBJ
      ?AUTO_1115 - LOCATION
    )
    :vars
    (
      ?AUTO_1123 - LOCATION
      ?AUTO_1118 - CITY
      ?AUTO_1122 - TRUCK
      ?AUTO_1117 - LOCATION
      ?AUTO_1116 - CITY
      ?AUTO_1121 - LOCATION
      ?AUTO_1124 - AIRPLANE
      ?AUTO_1126 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1123 ?AUTO_1118 ) ( IN-CITY ?AUTO_1115 ?AUTO_1118 ) ( not ( = ?AUTO_1115 ?AUTO_1123 ) ) ( TRUCK-AT ?AUTO_1122 ?AUTO_1117 ) ( IN-CITY ?AUTO_1117 ?AUTO_1116 ) ( IN-CITY ?AUTO_1123 ?AUTO_1116 ) ( not ( = ?AUTO_1123 ?AUTO_1117 ) ) ( AIRPORT ?AUTO_1121 ) ( AIRPORT ?AUTO_1123 ) ( AIRPLANE-AT ?AUTO_1124 ?AUTO_1121 ) ( not ( = ?AUTO_1121 ?AUTO_1123 ) ) ( OBJ-AT ?AUTO_1114 ?AUTO_1126 ) ( AIRPLANE-AT ?AUTO_1124 ?AUTO_1126 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1114 ?AUTO_1124 ?AUTO_1126 )
      ( DELIVER-PKG ?AUTO_1114 ?AUTO_1115 )
      ( DELIVER-PKG-VERIFY ?AUTO_1114 ?AUTO_1115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1128 - OBJ
      ?AUTO_1129 - LOCATION
    )
    :vars
    (
      ?AUTO_1138 - LOCATION
      ?AUTO_1136 - CITY
      ?AUTO_1137 - TRUCK
      ?AUTO_1135 - LOCATION
      ?AUTO_1139 - CITY
      ?AUTO_1134 - LOCATION
      ?AUTO_1133 - AIRPLANE
      ?AUTO_1132 - LOCATION
      ?AUTO_1140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1138 ?AUTO_1136 ) ( IN-CITY ?AUTO_1129 ?AUTO_1136 ) ( not ( = ?AUTO_1129 ?AUTO_1138 ) ) ( TRUCK-AT ?AUTO_1137 ?AUTO_1135 ) ( IN-CITY ?AUTO_1135 ?AUTO_1139 ) ( IN-CITY ?AUTO_1138 ?AUTO_1139 ) ( not ( = ?AUTO_1138 ?AUTO_1135 ) ) ( AIRPORT ?AUTO_1134 ) ( AIRPORT ?AUTO_1138 ) ( AIRPLANE-AT ?AUTO_1133 ?AUTO_1134 ) ( not ( = ?AUTO_1134 ?AUTO_1138 ) ) ( AIRPLANE-AT ?AUTO_1133 ?AUTO_1132 ) ( TRUCK-AT ?AUTO_1140 ?AUTO_1132 ) ( IN-TRUCK ?AUTO_1128 ?AUTO_1140 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1128 ?AUTO_1140 ?AUTO_1132 )
      ( DELIVER-PKG ?AUTO_1128 ?AUTO_1129 )
      ( DELIVER-PKG-VERIFY ?AUTO_1128 ?AUTO_1129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1143 - OBJ
      ?AUTO_1144 - LOCATION
    )
    :vars
    (
      ?AUTO_1145 - LOCATION
      ?AUTO_1151 - CITY
      ?AUTO_1150 - TRUCK
      ?AUTO_1146 - LOCATION
      ?AUTO_1152 - CITY
      ?AUTO_1149 - LOCATION
      ?AUTO_1153 - AIRPLANE
      ?AUTO_1154 - LOCATION
      ?AUTO_1155 - TRUCK
      ?AUTO_1158 - LOCATION
      ?AUTO_1157 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1145 ?AUTO_1151 ) ( IN-CITY ?AUTO_1144 ?AUTO_1151 ) ( not ( = ?AUTO_1144 ?AUTO_1145 ) ) ( TRUCK-AT ?AUTO_1150 ?AUTO_1146 ) ( IN-CITY ?AUTO_1146 ?AUTO_1152 ) ( IN-CITY ?AUTO_1145 ?AUTO_1152 ) ( not ( = ?AUTO_1145 ?AUTO_1146 ) ) ( AIRPORT ?AUTO_1149 ) ( AIRPORT ?AUTO_1145 ) ( AIRPLANE-AT ?AUTO_1153 ?AUTO_1149 ) ( not ( = ?AUTO_1149 ?AUTO_1145 ) ) ( AIRPLANE-AT ?AUTO_1153 ?AUTO_1154 ) ( IN-TRUCK ?AUTO_1143 ?AUTO_1155 ) ( TRUCK-AT ?AUTO_1155 ?AUTO_1158 ) ( IN-CITY ?AUTO_1158 ?AUTO_1157 ) ( IN-CITY ?AUTO_1154 ?AUTO_1157 ) ( not ( = ?AUTO_1154 ?AUTO_1158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1155 ?AUTO_1158 ?AUTO_1154 ?AUTO_1157 )
      ( DELIVER-PKG ?AUTO_1143 ?AUTO_1144 )
      ( DELIVER-PKG-VERIFY ?AUTO_1143 ?AUTO_1144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1184 - OBJ
      ?AUTO_1185 - LOCATION
    )
    :vars
    (
      ?AUTO_1195 - LOCATION
      ?AUTO_1191 - CITY
      ?AUTO_1188 - TRUCK
      ?AUTO_1196 - LOCATION
      ?AUTO_1194 - CITY
      ?AUTO_1197 - LOCATION
      ?AUTO_1193 - AIRPLANE
      ?AUTO_1189 - LOCATION
      ?AUTO_1187 - TRUCK
      ?AUTO_1192 - LOCATION
      ?AUTO_1186 - CITY
      ?AUTO_1200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1195 ?AUTO_1191 ) ( IN-CITY ?AUTO_1185 ?AUTO_1191 ) ( not ( = ?AUTO_1185 ?AUTO_1195 ) ) ( TRUCK-AT ?AUTO_1188 ?AUTO_1196 ) ( IN-CITY ?AUTO_1196 ?AUTO_1194 ) ( IN-CITY ?AUTO_1195 ?AUTO_1194 ) ( not ( = ?AUTO_1195 ?AUTO_1196 ) ) ( AIRPORT ?AUTO_1197 ) ( AIRPORT ?AUTO_1195 ) ( AIRPLANE-AT ?AUTO_1193 ?AUTO_1197 ) ( not ( = ?AUTO_1197 ?AUTO_1195 ) ) ( AIRPLANE-AT ?AUTO_1193 ?AUTO_1189 ) ( TRUCK-AT ?AUTO_1187 ?AUTO_1192 ) ( IN-CITY ?AUTO_1192 ?AUTO_1186 ) ( IN-CITY ?AUTO_1189 ?AUTO_1186 ) ( not ( = ?AUTO_1189 ?AUTO_1192 ) ) ( TRUCK-AT ?AUTO_1187 ?AUTO_1200 ) ( OBJ-AT ?AUTO_1184 ?AUTO_1200 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1184 ?AUTO_1187 ?AUTO_1200 )
      ( DELIVER-PKG ?AUTO_1184 ?AUTO_1185 )
      ( DELIVER-PKG-VERIFY ?AUTO_1184 ?AUTO_1185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1203 - OBJ
      ?AUTO_1204 - LOCATION
    )
    :vars
    (
      ?AUTO_1205 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1205 ?AUTO_1204 ) ( IN-TRUCK ?AUTO_1203 ?AUTO_1205 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1203 ?AUTO_1205 ?AUTO_1204 )
      ( DELIVER-PKG-VERIFY ?AUTO_1203 ?AUTO_1204 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1216 - OBJ
      ?AUTO_1217 - LOCATION
    )
    :vars
    (
      ?AUTO_1220 - TRUCK
      ?AUTO_1223 - LOCATION
      ?AUTO_1222 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1216 ?AUTO_1220 ) ( TRUCK-AT ?AUTO_1220 ?AUTO_1223 ) ( IN-CITY ?AUTO_1223 ?AUTO_1222 ) ( IN-CITY ?AUTO_1217 ?AUTO_1222 ) ( not ( = ?AUTO_1217 ?AUTO_1223 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1220 ?AUTO_1223 ?AUTO_1217 ?AUTO_1222 )
      ( DELIVER-PKG ?AUTO_1216 ?AUTO_1217 )
      ( DELIVER-PKG-VERIFY ?AUTO_1216 ?AUTO_1217 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1225 - OBJ
      ?AUTO_1226 - LOCATION
    )
    :vars
    (
      ?AUTO_1229 - TRUCK
      ?AUTO_1231 - LOCATION
      ?AUTO_1230 - CITY
      ?AUTO_1233 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1229 ?AUTO_1231 ) ( IN-CITY ?AUTO_1231 ?AUTO_1230 ) ( IN-CITY ?AUTO_1226 ?AUTO_1230 ) ( not ( = ?AUTO_1226 ?AUTO_1231 ) ) ( TRUCK-AT ?AUTO_1229 ?AUTO_1233 ) ( OBJ-AT ?AUTO_1225 ?AUTO_1233 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1225 ?AUTO_1229 ?AUTO_1233 )
      ( DELIVER-PKG ?AUTO_1225 ?AUTO_1226 )
      ( DELIVER-PKG-VERIFY ?AUTO_1225 ?AUTO_1226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1249 - OBJ
      ?AUTO_1250 - LOCATION
    )
    :vars
    (
      ?AUTO_1251 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1249 ?AUTO_1251 ) ( AIRPLANE-AT ?AUTO_1251 ?AUTO_1250 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1249 ?AUTO_1251 ?AUTO_1250 )
      ( DELIVER-PKG-VERIFY ?AUTO_1249 ?AUTO_1250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1260 - OBJ
      ?AUTO_1261 - LOCATION
    )
    :vars
    (
      ?AUTO_1263 - AIRPLANE
      ?AUTO_1266 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1260 ?AUTO_1263 ) ( AIRPORT ?AUTO_1266 ) ( AIRPORT ?AUTO_1261 ) ( AIRPLANE-AT ?AUTO_1263 ?AUTO_1266 ) ( not ( = ?AUTO_1266 ?AUTO_1261 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1263 ?AUTO_1266 ?AUTO_1261 )
      ( DELIVER-PKG ?AUTO_1260 ?AUTO_1261 )
      ( DELIVER-PKG-VERIFY ?AUTO_1260 ?AUTO_1261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1268 - OBJ
      ?AUTO_1269 - LOCATION
    )
    :vars
    (
      ?AUTO_1273 - LOCATION
      ?AUTO_1272 - AIRPLANE
      ?AUTO_1275 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1273 ) ( AIRPORT ?AUTO_1269 ) ( AIRPLANE-AT ?AUTO_1272 ?AUTO_1273 ) ( not ( = ?AUTO_1273 ?AUTO_1269 ) ) ( OBJ-AT ?AUTO_1268 ?AUTO_1275 ) ( AIRPLANE-AT ?AUTO_1272 ?AUTO_1275 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1268 ?AUTO_1272 ?AUTO_1275 )
      ( DELIVER-PKG ?AUTO_1268 ?AUTO_1269 )
      ( DELIVER-PKG-VERIFY ?AUTO_1268 ?AUTO_1269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1281 - OBJ
      ?AUTO_1282 - LOCATION
    )
    :vars
    (
      ?AUTO_1283 - LOCATION
      ?AUTO_1289 - LOCATION
      ?AUTO_1285 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1283 ) ( AIRPORT ?AUTO_1282 ) ( not ( = ?AUTO_1283 ?AUTO_1282 ) ) ( OBJ-AT ?AUTO_1281 ?AUTO_1283 ) ( AIRPORT ?AUTO_1289 ) ( AIRPLANE-AT ?AUTO_1285 ?AUTO_1289 ) ( not ( = ?AUTO_1289 ?AUTO_1283 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1285 ?AUTO_1289 ?AUTO_1283 )
      ( DELIVER-PKG ?AUTO_1281 ?AUTO_1282 )
      ( DELIVER-PKG-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1303 - OBJ
      ?AUTO_1304 - LOCATION
    )
    :vars
    (
      ?AUTO_1305 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1305 ?AUTO_1304 ) ( IN-TRUCK ?AUTO_1303 ?AUTO_1305 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1303 ?AUTO_1305 ?AUTO_1304 )
      ( DELIVER-PKG-VERIFY ?AUTO_1303 ?AUTO_1304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1316 - OBJ
      ?AUTO_1317 - LOCATION
    )
    :vars
    (
      ?AUTO_1320 - TRUCK
      ?AUTO_1323 - LOCATION
      ?AUTO_1322 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1316 ?AUTO_1320 ) ( TRUCK-AT ?AUTO_1320 ?AUTO_1323 ) ( IN-CITY ?AUTO_1323 ?AUTO_1322 ) ( IN-CITY ?AUTO_1317 ?AUTO_1322 ) ( not ( = ?AUTO_1317 ?AUTO_1323 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1320 ?AUTO_1323 ?AUTO_1317 ?AUTO_1322 )
      ( DELIVER-PKG ?AUTO_1316 ?AUTO_1317 )
      ( DELIVER-PKG-VERIFY ?AUTO_1316 ?AUTO_1317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1343 - OBJ
      ?AUTO_1344 - LOCATION
    )
    :vars
    (
      ?AUTO_1350 - LOCATION
      ?AUTO_1348 - CITY
      ?AUTO_1345 - TRUCK
      ?AUTO_1353 - LOCATION
      ?AUTO_1352 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1350 ?AUTO_1348 ) ( IN-CITY ?AUTO_1344 ?AUTO_1348 ) ( not ( = ?AUTO_1344 ?AUTO_1350 ) ) ( OBJ-AT ?AUTO_1343 ?AUTO_1350 ) ( TRUCK-AT ?AUTO_1345 ?AUTO_1353 ) ( IN-CITY ?AUTO_1353 ?AUTO_1352 ) ( IN-CITY ?AUTO_1350 ?AUTO_1352 ) ( not ( = ?AUTO_1350 ?AUTO_1353 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1345 ?AUTO_1353 ?AUTO_1350 ?AUTO_1352 )
      ( DELIVER-PKG ?AUTO_1343 ?AUTO_1344 )
      ( DELIVER-PKG-VERIFY ?AUTO_1343 ?AUTO_1344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1357 - OBJ
      ?AUTO_1358 - LOCATION
    )
    :vars
    (
      ?AUTO_1359 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1357 ?AUTO_1359 ) ( AIRPLANE-AT ?AUTO_1359 ?AUTO_1358 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1357 ?AUTO_1359 ?AUTO_1358 )
      ( DELIVER-PKG-VERIFY ?AUTO_1357 ?AUTO_1358 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1366 - OBJ
      ?AUTO_1367 - LOCATION
    )
    :vars
    (
      ?AUTO_1370 - AIRPLANE
      ?AUTO_1372 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1366 ?AUTO_1370 ) ( AIRPORT ?AUTO_1372 ) ( AIRPORT ?AUTO_1367 ) ( AIRPLANE-AT ?AUTO_1370 ?AUTO_1372 ) ( not ( = ?AUTO_1372 ?AUTO_1367 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1370 ?AUTO_1372 ?AUTO_1367 )
      ( DELIVER-PKG ?AUTO_1366 ?AUTO_1367 )
      ( DELIVER-PKG-VERIFY ?AUTO_1366 ?AUTO_1367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1404 - OBJ
      ?AUTO_1405 - LOCATION
    )
    :vars
    (
      ?AUTO_1406 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1404 ?AUTO_1406 ) ( AIRPLANE-AT ?AUTO_1406 ?AUTO_1405 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1404 ?AUTO_1406 ?AUTO_1405 )
      ( DELIVER-PKG-VERIFY ?AUTO_1404 ?AUTO_1405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1409 - OBJ
      ?AUTO_1410 - LOCATION
    )
    :vars
    (
      ?AUTO_1413 - AIRPLANE
      ?AUTO_1415 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1409 ?AUTO_1413 ) ( AIRPORT ?AUTO_1415 ) ( AIRPORT ?AUTO_1410 ) ( AIRPLANE-AT ?AUTO_1413 ?AUTO_1415 ) ( not ( = ?AUTO_1415 ?AUTO_1410 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1413 ?AUTO_1415 ?AUTO_1410 )
      ( DELIVER-PKG ?AUTO_1409 ?AUTO_1410 )
      ( DELIVER-PKG-VERIFY ?AUTO_1409 ?AUTO_1410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1419 - OBJ
      ?AUTO_1420 - LOCATION
    )
    :vars
    (
      ?AUTO_1424 - LOCATION
      ?AUTO_1421 - AIRPLANE
      ?AUTO_1426 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1424 ) ( AIRPORT ?AUTO_1420 ) ( AIRPLANE-AT ?AUTO_1421 ?AUTO_1424 ) ( not ( = ?AUTO_1424 ?AUTO_1420 ) ) ( OBJ-AT ?AUTO_1419 ?AUTO_1426 ) ( AIRPLANE-AT ?AUTO_1421 ?AUTO_1426 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1419 ?AUTO_1421 ?AUTO_1426 )
      ( DELIVER-PKG ?AUTO_1419 ?AUTO_1420 )
      ( DELIVER-PKG-VERIFY ?AUTO_1419 ?AUTO_1420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1428 - OBJ
      ?AUTO_1429 - LOCATION
    )
    :vars
    (
      ?AUTO_1433 - LOCATION
      ?AUTO_1432 - AIRPLANE
      ?AUTO_1434 - LOCATION
      ?AUTO_1435 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1433 ) ( AIRPORT ?AUTO_1429 ) ( AIRPLANE-AT ?AUTO_1432 ?AUTO_1433 ) ( not ( = ?AUTO_1433 ?AUTO_1429 ) ) ( AIRPLANE-AT ?AUTO_1432 ?AUTO_1434 ) ( TRUCK-AT ?AUTO_1435 ?AUTO_1434 ) ( IN-TRUCK ?AUTO_1428 ?AUTO_1435 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1428 ?AUTO_1435 ?AUTO_1434 )
      ( DELIVER-PKG ?AUTO_1428 ?AUTO_1429 )
      ( DELIVER-PKG-VERIFY ?AUTO_1428 ?AUTO_1429 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1446 - OBJ
      ?AUTO_1447 - LOCATION
    )
    :vars
    (
      ?AUTO_1453 - LOCATION
      ?AUTO_1448 - AIRPLANE
      ?AUTO_1452 - LOCATION
      ?AUTO_1451 - TRUCK
      ?AUTO_1456 - LOCATION
      ?AUTO_1455 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1453 ) ( AIRPORT ?AUTO_1447 ) ( AIRPLANE-AT ?AUTO_1448 ?AUTO_1453 ) ( not ( = ?AUTO_1453 ?AUTO_1447 ) ) ( AIRPLANE-AT ?AUTO_1448 ?AUTO_1452 ) ( IN-TRUCK ?AUTO_1446 ?AUTO_1451 ) ( TRUCK-AT ?AUTO_1451 ?AUTO_1456 ) ( IN-CITY ?AUTO_1456 ?AUTO_1455 ) ( IN-CITY ?AUTO_1452 ?AUTO_1455 ) ( not ( = ?AUTO_1452 ?AUTO_1456 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1451 ?AUTO_1456 ?AUTO_1452 ?AUTO_1455 )
      ( DELIVER-PKG ?AUTO_1446 ?AUTO_1447 )
      ( DELIVER-PKG-VERIFY ?AUTO_1446 ?AUTO_1447 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1474 - OBJ
      ?AUTO_1475 - LOCATION
    )
    :vars
    (
      ?AUTO_1483 - LOCATION
      ?AUTO_1479 - AIRPLANE
      ?AUTO_1477 - LOCATION
      ?AUTO_1480 - TRUCK
      ?AUTO_1481 - LOCATION
      ?AUTO_1476 - CITY
      ?AUTO_1485 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1483 ) ( AIRPORT ?AUTO_1475 ) ( AIRPLANE-AT ?AUTO_1479 ?AUTO_1483 ) ( not ( = ?AUTO_1483 ?AUTO_1475 ) ) ( AIRPLANE-AT ?AUTO_1479 ?AUTO_1477 ) ( TRUCK-AT ?AUTO_1480 ?AUTO_1481 ) ( IN-CITY ?AUTO_1481 ?AUTO_1476 ) ( IN-CITY ?AUTO_1477 ?AUTO_1476 ) ( not ( = ?AUTO_1477 ?AUTO_1481 ) ) ( TRUCK-AT ?AUTO_1480 ?AUTO_1485 ) ( OBJ-AT ?AUTO_1474 ?AUTO_1485 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1474 ?AUTO_1480 ?AUTO_1485 )
      ( DELIVER-PKG ?AUTO_1474 ?AUTO_1475 )
      ( DELIVER-PKG-VERIFY ?AUTO_1474 ?AUTO_1475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1487 - OBJ
      ?AUTO_1488 - LOCATION
    )
    :vars
    (
      ?AUTO_1491 - LOCATION
      ?AUTO_1496 - AIRPLANE
      ?AUTO_1493 - LOCATION
      ?AUTO_1497 - LOCATION
      ?AUTO_1495 - CITY
      ?AUTO_1494 - TRUCK
      ?AUTO_1500 - LOCATION
      ?AUTO_1499 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1491 ) ( AIRPORT ?AUTO_1488 ) ( AIRPLANE-AT ?AUTO_1496 ?AUTO_1491 ) ( not ( = ?AUTO_1491 ?AUTO_1488 ) ) ( AIRPLANE-AT ?AUTO_1496 ?AUTO_1493 ) ( IN-CITY ?AUTO_1497 ?AUTO_1495 ) ( IN-CITY ?AUTO_1493 ?AUTO_1495 ) ( not ( = ?AUTO_1493 ?AUTO_1497 ) ) ( OBJ-AT ?AUTO_1487 ?AUTO_1497 ) ( TRUCK-AT ?AUTO_1494 ?AUTO_1500 ) ( IN-CITY ?AUTO_1500 ?AUTO_1499 ) ( IN-CITY ?AUTO_1497 ?AUTO_1499 ) ( not ( = ?AUTO_1497 ?AUTO_1500 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1494 ?AUTO_1500 ?AUTO_1497 ?AUTO_1499 )
      ( DELIVER-PKG ?AUTO_1487 ?AUTO_1488 )
      ( DELIVER-PKG-VERIFY ?AUTO_1487 ?AUTO_1488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1504 - OBJ
      ?AUTO_1505 - LOCATION
    )
    :vars
    (
      ?AUTO_1506 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1504 ?AUTO_1506 ) ( AIRPLANE-AT ?AUTO_1506 ?AUTO_1505 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1504 ?AUTO_1506 ?AUTO_1505 )
      ( DELIVER-PKG-VERIFY ?AUTO_1504 ?AUTO_1505 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1551 - OBJ
      ?AUTO_1552 - LOCATION
    )
    :vars
    (
      ?AUTO_1553 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1553 ?AUTO_1552 ) ( IN-TRUCK ?AUTO_1551 ?AUTO_1553 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1551 ?AUTO_1553 ?AUTO_1552 )
      ( DELIVER-PKG-VERIFY ?AUTO_1551 ?AUTO_1552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1556 - OBJ
      ?AUTO_1557 - LOCATION
    )
    :vars
    (
      ?AUTO_1558 - TRUCK
      ?AUTO_1563 - LOCATION
      ?AUTO_1562 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1556 ?AUTO_1558 ) ( TRUCK-AT ?AUTO_1558 ?AUTO_1563 ) ( IN-CITY ?AUTO_1563 ?AUTO_1562 ) ( IN-CITY ?AUTO_1557 ?AUTO_1562 ) ( not ( = ?AUTO_1557 ?AUTO_1563 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1558 ?AUTO_1563 ?AUTO_1557 ?AUTO_1562 )
      ( DELIVER-PKG ?AUTO_1556 ?AUTO_1557 )
      ( DELIVER-PKG-VERIFY ?AUTO_1556 ?AUTO_1557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1571 - OBJ
      ?AUTO_1572 - LOCATION
    )
    :vars
    (
      ?AUTO_1573 - TRUCK
      ?AUTO_1576 - LOCATION
      ?AUTO_1577 - CITY
      ?AUTO_1579 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1573 ?AUTO_1576 ) ( IN-CITY ?AUTO_1576 ?AUTO_1577 ) ( IN-CITY ?AUTO_1572 ?AUTO_1577 ) ( not ( = ?AUTO_1572 ?AUTO_1576 ) ) ( TRUCK-AT ?AUTO_1573 ?AUTO_1579 ) ( OBJ-AT ?AUTO_1571 ?AUTO_1579 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1571 ?AUTO_1573 ?AUTO_1579 )
      ( DELIVER-PKG ?AUTO_1571 ?AUTO_1572 )
      ( DELIVER-PKG-VERIFY ?AUTO_1571 ?AUTO_1572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1583 - OBJ
      ?AUTO_1584 - LOCATION
    )
    :vars
    (
      ?AUTO_1586 - TRUCK
      ?AUTO_1585 - LOCATION
      ?AUTO_1588 - CITY
      ?AUTO_1589 - LOCATION
      ?AUTO_1591 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1586 ?AUTO_1585 ) ( IN-CITY ?AUTO_1585 ?AUTO_1588 ) ( IN-CITY ?AUTO_1584 ?AUTO_1588 ) ( not ( = ?AUTO_1584 ?AUTO_1585 ) ) ( TRUCK-AT ?AUTO_1586 ?AUTO_1589 ) ( IN-AIRPLANE ?AUTO_1583 ?AUTO_1591 ) ( AIRPLANE-AT ?AUTO_1591 ?AUTO_1589 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1583 ?AUTO_1591 ?AUTO_1589 )
      ( DELIVER-PKG ?AUTO_1583 ?AUTO_1584 )
      ( DELIVER-PKG-VERIFY ?AUTO_1583 ?AUTO_1584 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1594 - OBJ
      ?AUTO_1595 - LOCATION
    )
    :vars
    (
      ?AUTO_1598 - TRUCK
      ?AUTO_1600 - LOCATION
      ?AUTO_1599 - CITY
      ?AUTO_1601 - LOCATION
      ?AUTO_1602 - AIRPLANE
      ?AUTO_1604 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1598 ?AUTO_1600 ) ( IN-CITY ?AUTO_1600 ?AUTO_1599 ) ( IN-CITY ?AUTO_1595 ?AUTO_1599 ) ( not ( = ?AUTO_1595 ?AUTO_1600 ) ) ( TRUCK-AT ?AUTO_1598 ?AUTO_1601 ) ( IN-AIRPLANE ?AUTO_1594 ?AUTO_1602 ) ( AIRPORT ?AUTO_1604 ) ( AIRPORT ?AUTO_1601 ) ( AIRPLANE-AT ?AUTO_1602 ?AUTO_1604 ) ( not ( = ?AUTO_1604 ?AUTO_1601 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1602 ?AUTO_1604 ?AUTO_1601 )
      ( DELIVER-PKG ?AUTO_1594 ?AUTO_1595 )
      ( DELIVER-PKG-VERIFY ?AUTO_1594 ?AUTO_1595 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1608 - OBJ
      ?AUTO_1609 - LOCATION
    )
    :vars
    (
      ?AUTO_1615 - TRUCK
      ?AUTO_1611 - LOCATION
      ?AUTO_1614 - CITY
      ?AUTO_1617 - LOCATION
      ?AUTO_1612 - LOCATION
      ?AUTO_1613 - AIRPLANE
      ?AUTO_1619 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1615 ?AUTO_1611 ) ( IN-CITY ?AUTO_1611 ?AUTO_1614 ) ( IN-CITY ?AUTO_1609 ?AUTO_1614 ) ( not ( = ?AUTO_1609 ?AUTO_1611 ) ) ( TRUCK-AT ?AUTO_1615 ?AUTO_1617 ) ( AIRPORT ?AUTO_1612 ) ( AIRPORT ?AUTO_1617 ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1612 ) ( not ( = ?AUTO_1612 ?AUTO_1617 ) ) ( OBJ-AT ?AUTO_1608 ?AUTO_1619 ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1619 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1608 ?AUTO_1613 ?AUTO_1619 )
      ( DELIVER-PKG ?AUTO_1608 ?AUTO_1609 )
      ( DELIVER-PKG-VERIFY ?AUTO_1608 ?AUTO_1609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1621 - OBJ
      ?AUTO_1622 - LOCATION
    )
    :vars
    (
      ?AUTO_1629 - TRUCK
      ?AUTO_1630 - LOCATION
      ?AUTO_1626 - CITY
      ?AUTO_1625 - LOCATION
      ?AUTO_1628 - LOCATION
      ?AUTO_1627 - AIRPLANE
      ?AUTO_1631 - LOCATION
      ?AUTO_1632 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1629 ?AUTO_1630 ) ( IN-CITY ?AUTO_1630 ?AUTO_1626 ) ( IN-CITY ?AUTO_1622 ?AUTO_1626 ) ( not ( = ?AUTO_1622 ?AUTO_1630 ) ) ( TRUCK-AT ?AUTO_1629 ?AUTO_1625 ) ( AIRPORT ?AUTO_1628 ) ( AIRPORT ?AUTO_1625 ) ( AIRPLANE-AT ?AUTO_1627 ?AUTO_1628 ) ( not ( = ?AUTO_1628 ?AUTO_1625 ) ) ( AIRPLANE-AT ?AUTO_1627 ?AUTO_1631 ) ( TRUCK-AT ?AUTO_1632 ?AUTO_1631 ) ( IN-TRUCK ?AUTO_1621 ?AUTO_1632 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1621 ?AUTO_1632 ?AUTO_1631 )
      ( DELIVER-PKG ?AUTO_1621 ?AUTO_1622 )
      ( DELIVER-PKG-VERIFY ?AUTO_1621 ?AUTO_1622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1641 - OBJ
      ?AUTO_1642 - LOCATION
    )
    :vars
    (
      ?AUTO_1650 - LOCATION
      ?AUTO_1649 - CITY
      ?AUTO_1646 - LOCATION
      ?AUTO_1648 - AIRPLANE
      ?AUTO_1643 - LOCATION
      ?AUTO_1651 - TRUCK
      ?AUTO_1644 - TRUCK
      ?AUTO_1655 - LOCATION
      ?AUTO_1654 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1650 ?AUTO_1649 ) ( IN-CITY ?AUTO_1642 ?AUTO_1649 ) ( not ( = ?AUTO_1642 ?AUTO_1650 ) ) ( AIRPORT ?AUTO_1646 ) ( AIRPORT ?AUTO_1650 ) ( AIRPLANE-AT ?AUTO_1648 ?AUTO_1646 ) ( not ( = ?AUTO_1646 ?AUTO_1650 ) ) ( AIRPLANE-AT ?AUTO_1648 ?AUTO_1643 ) ( TRUCK-AT ?AUTO_1651 ?AUTO_1643 ) ( IN-TRUCK ?AUTO_1641 ?AUTO_1651 ) ( TRUCK-AT ?AUTO_1644 ?AUTO_1655 ) ( IN-CITY ?AUTO_1655 ?AUTO_1654 ) ( IN-CITY ?AUTO_1650 ?AUTO_1654 ) ( not ( = ?AUTO_1650 ?AUTO_1655 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1644 ?AUTO_1655 ?AUTO_1650 ?AUTO_1654 )
      ( DELIVER-PKG ?AUTO_1641 ?AUTO_1642 )
      ( DELIVER-PKG-VERIFY ?AUTO_1641 ?AUTO_1642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1657 - OBJ
      ?AUTO_1658 - LOCATION
    )
    :vars
    (
      ?AUTO_1666 - LOCATION
      ?AUTO_1662 - CITY
      ?AUTO_1667 - LOCATION
      ?AUTO_1664 - AIRPLANE
      ?AUTO_1665 - LOCATION
      ?AUTO_1663 - TRUCK
      ?AUTO_1661 - TRUCK
      ?AUTO_1669 - LOCATION
      ?AUTO_1668 - CITY
      ?AUTO_1672 - LOCATION
      ?AUTO_1671 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1666 ?AUTO_1662 ) ( IN-CITY ?AUTO_1658 ?AUTO_1662 ) ( not ( = ?AUTO_1658 ?AUTO_1666 ) ) ( AIRPORT ?AUTO_1667 ) ( AIRPORT ?AUTO_1666 ) ( AIRPLANE-AT ?AUTO_1664 ?AUTO_1667 ) ( not ( = ?AUTO_1667 ?AUTO_1666 ) ) ( AIRPLANE-AT ?AUTO_1664 ?AUTO_1665 ) ( IN-TRUCK ?AUTO_1657 ?AUTO_1663 ) ( TRUCK-AT ?AUTO_1661 ?AUTO_1669 ) ( IN-CITY ?AUTO_1669 ?AUTO_1668 ) ( IN-CITY ?AUTO_1666 ?AUTO_1668 ) ( not ( = ?AUTO_1666 ?AUTO_1669 ) ) ( TRUCK-AT ?AUTO_1663 ?AUTO_1672 ) ( IN-CITY ?AUTO_1672 ?AUTO_1671 ) ( IN-CITY ?AUTO_1665 ?AUTO_1671 ) ( not ( = ?AUTO_1665 ?AUTO_1672 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1663 ?AUTO_1672 ?AUTO_1665 ?AUTO_1671 )
      ( DELIVER-PKG ?AUTO_1657 ?AUTO_1658 )
      ( DELIVER-PKG-VERIFY ?AUTO_1657 ?AUTO_1658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1690 - OBJ
      ?AUTO_1691 - LOCATION
    )
    :vars
    (
      ?AUTO_1700 - LOCATION
      ?AUTO_1702 - CITY
      ?AUTO_1701 - LOCATION
      ?AUTO_1698 - AIRPLANE
      ?AUTO_1703 - LOCATION
      ?AUTO_1692 - TRUCK
      ?AUTO_1696 - LOCATION
      ?AUTO_1699 - CITY
      ?AUTO_1694 - TRUCK
      ?AUTO_1697 - LOCATION
      ?AUTO_1695 - CITY
      ?AUTO_1706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1700 ?AUTO_1702 ) ( IN-CITY ?AUTO_1691 ?AUTO_1702 ) ( not ( = ?AUTO_1691 ?AUTO_1700 ) ) ( AIRPORT ?AUTO_1701 ) ( AIRPORT ?AUTO_1700 ) ( AIRPLANE-AT ?AUTO_1698 ?AUTO_1701 ) ( not ( = ?AUTO_1701 ?AUTO_1700 ) ) ( AIRPLANE-AT ?AUTO_1698 ?AUTO_1703 ) ( TRUCK-AT ?AUTO_1692 ?AUTO_1696 ) ( IN-CITY ?AUTO_1696 ?AUTO_1699 ) ( IN-CITY ?AUTO_1700 ?AUTO_1699 ) ( not ( = ?AUTO_1700 ?AUTO_1696 ) ) ( TRUCK-AT ?AUTO_1694 ?AUTO_1697 ) ( IN-CITY ?AUTO_1697 ?AUTO_1695 ) ( IN-CITY ?AUTO_1703 ?AUTO_1695 ) ( not ( = ?AUTO_1703 ?AUTO_1697 ) ) ( TRUCK-AT ?AUTO_1694 ?AUTO_1706 ) ( OBJ-AT ?AUTO_1690 ?AUTO_1706 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1690 ?AUTO_1694 ?AUTO_1706 )
      ( DELIVER-PKG ?AUTO_1690 ?AUTO_1691 )
      ( DELIVER-PKG-VERIFY ?AUTO_1690 ?AUTO_1691 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1708 - OBJ
      ?AUTO_1709 - LOCATION
    )
    :vars
    (
      ?AUTO_1721 - LOCATION
      ?AUTO_1722 - CITY
      ?AUTO_1713 - LOCATION
      ?AUTO_1719 - AIRPLANE
      ?AUTO_1718 - LOCATION
      ?AUTO_1714 - TRUCK
      ?AUTO_1720 - LOCATION
      ?AUTO_1717 - CITY
      ?AUTO_1723 - LOCATION
      ?AUTO_1711 - CITY
      ?AUTO_1712 - TRUCK
      ?AUTO_1726 - LOCATION
      ?AUTO_1725 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1721 ?AUTO_1722 ) ( IN-CITY ?AUTO_1709 ?AUTO_1722 ) ( not ( = ?AUTO_1709 ?AUTO_1721 ) ) ( AIRPORT ?AUTO_1713 ) ( AIRPORT ?AUTO_1721 ) ( AIRPLANE-AT ?AUTO_1719 ?AUTO_1713 ) ( not ( = ?AUTO_1713 ?AUTO_1721 ) ) ( AIRPLANE-AT ?AUTO_1719 ?AUTO_1718 ) ( TRUCK-AT ?AUTO_1714 ?AUTO_1720 ) ( IN-CITY ?AUTO_1720 ?AUTO_1717 ) ( IN-CITY ?AUTO_1721 ?AUTO_1717 ) ( not ( = ?AUTO_1721 ?AUTO_1720 ) ) ( IN-CITY ?AUTO_1723 ?AUTO_1711 ) ( IN-CITY ?AUTO_1718 ?AUTO_1711 ) ( not ( = ?AUTO_1718 ?AUTO_1723 ) ) ( OBJ-AT ?AUTO_1708 ?AUTO_1723 ) ( TRUCK-AT ?AUTO_1712 ?AUTO_1726 ) ( IN-CITY ?AUTO_1726 ?AUTO_1725 ) ( IN-CITY ?AUTO_1723 ?AUTO_1725 ) ( not ( = ?AUTO_1723 ?AUTO_1726 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1712 ?AUTO_1726 ?AUTO_1723 ?AUTO_1725 )
      ( DELIVER-PKG ?AUTO_1708 ?AUTO_1709 )
      ( DELIVER-PKG-VERIFY ?AUTO_1708 ?AUTO_1709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1730 - OBJ
      ?AUTO_1731 - LOCATION
    )
    :vars
    (
      ?AUTO_1732 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1732 ?AUTO_1731 ) ( IN-TRUCK ?AUTO_1730 ?AUTO_1732 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1730 ?AUTO_1732 ?AUTO_1731 )
      ( DELIVER-PKG-VERIFY ?AUTO_1730 ?AUTO_1731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1745 - OBJ
      ?AUTO_1746 - LOCATION
    )
    :vars
    (
      ?AUTO_1749 - TRUCK
      ?AUTO_1747 - LOCATION
      ?AUTO_1748 - CITY
      ?AUTO_1753 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1749 ?AUTO_1747 ) ( IN-CITY ?AUTO_1747 ?AUTO_1748 ) ( IN-CITY ?AUTO_1746 ?AUTO_1748 ) ( not ( = ?AUTO_1746 ?AUTO_1747 ) ) ( TRUCK-AT ?AUTO_1749 ?AUTO_1753 ) ( OBJ-AT ?AUTO_1745 ?AUTO_1753 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1745 ?AUTO_1749 ?AUTO_1753 )
      ( DELIVER-PKG ?AUTO_1745 ?AUTO_1746 )
      ( DELIVER-PKG-VERIFY ?AUTO_1745 ?AUTO_1746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1777 - OBJ
      ?AUTO_1778 - LOCATION
    )
    :vars
    (
      ?AUTO_1785 - LOCATION
      ?AUTO_1783 - CITY
      ?AUTO_1786 - AIRPLANE
      ?AUTO_1782 - LOCATION
      ?AUTO_1780 - TRUCK
      ?AUTO_1789 - LOCATION
      ?AUTO_1788 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1785 ?AUTO_1783 ) ( IN-CITY ?AUTO_1778 ?AUTO_1783 ) ( not ( = ?AUTO_1778 ?AUTO_1785 ) ) ( IN-AIRPLANE ?AUTO_1777 ?AUTO_1786 ) ( AIRPORT ?AUTO_1782 ) ( AIRPORT ?AUTO_1785 ) ( AIRPLANE-AT ?AUTO_1786 ?AUTO_1782 ) ( not ( = ?AUTO_1782 ?AUTO_1785 ) ) ( TRUCK-AT ?AUTO_1780 ?AUTO_1789 ) ( IN-CITY ?AUTO_1789 ?AUTO_1788 ) ( IN-CITY ?AUTO_1785 ?AUTO_1788 ) ( not ( = ?AUTO_1785 ?AUTO_1789 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1780 ?AUTO_1789 ?AUTO_1785 ?AUTO_1788 )
      ( DELIVER-PKG ?AUTO_1777 ?AUTO_1778 )
      ( DELIVER-PKG-VERIFY ?AUTO_1777 ?AUTO_1778 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1803 - OBJ
      ?AUTO_1804 - LOCATION
    )
    :vars
    (
      ?AUTO_1807 - LOCATION
      ?AUTO_1811 - CITY
      ?AUTO_1810 - LOCATION
      ?AUTO_1805 - AIRPLANE
      ?AUTO_1809 - TRUCK
      ?AUTO_1812 - LOCATION
      ?AUTO_1808 - CITY
      ?AUTO_1815 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1807 ?AUTO_1811 ) ( IN-CITY ?AUTO_1804 ?AUTO_1811 ) ( not ( = ?AUTO_1804 ?AUTO_1807 ) ) ( AIRPORT ?AUTO_1810 ) ( AIRPORT ?AUTO_1807 ) ( AIRPLANE-AT ?AUTO_1805 ?AUTO_1810 ) ( not ( = ?AUTO_1810 ?AUTO_1807 ) ) ( TRUCK-AT ?AUTO_1809 ?AUTO_1812 ) ( IN-CITY ?AUTO_1812 ?AUTO_1808 ) ( IN-CITY ?AUTO_1807 ?AUTO_1808 ) ( not ( = ?AUTO_1807 ?AUTO_1812 ) ) ( OBJ-AT ?AUTO_1803 ?AUTO_1815 ) ( AIRPLANE-AT ?AUTO_1805 ?AUTO_1815 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1803 ?AUTO_1805 ?AUTO_1815 )
      ( DELIVER-PKG ?AUTO_1803 ?AUTO_1804 )
      ( DELIVER-PKG-VERIFY ?AUTO_1803 ?AUTO_1804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1817 - OBJ
      ?AUTO_1818 - LOCATION
    )
    :vars
    (
      ?AUTO_1821 - LOCATION
      ?AUTO_1822 - CITY
      ?AUTO_1824 - LOCATION
      ?AUTO_1828 - TRUCK
      ?AUTO_1825 - LOCATION
      ?AUTO_1827 - CITY
      ?AUTO_1830 - LOCATION
      ?AUTO_1823 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1821 ?AUTO_1822 ) ( IN-CITY ?AUTO_1818 ?AUTO_1822 ) ( not ( = ?AUTO_1818 ?AUTO_1821 ) ) ( AIRPORT ?AUTO_1824 ) ( AIRPORT ?AUTO_1821 ) ( not ( = ?AUTO_1824 ?AUTO_1821 ) ) ( TRUCK-AT ?AUTO_1828 ?AUTO_1825 ) ( IN-CITY ?AUTO_1825 ?AUTO_1827 ) ( IN-CITY ?AUTO_1821 ?AUTO_1827 ) ( not ( = ?AUTO_1821 ?AUTO_1825 ) ) ( OBJ-AT ?AUTO_1817 ?AUTO_1824 ) ( AIRPORT ?AUTO_1830 ) ( AIRPLANE-AT ?AUTO_1823 ?AUTO_1830 ) ( not ( = ?AUTO_1830 ?AUTO_1824 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1823 ?AUTO_1830 ?AUTO_1824 )
      ( DELIVER-PKG ?AUTO_1817 ?AUTO_1818 )
      ( DELIVER-PKG-VERIFY ?AUTO_1817 ?AUTO_1818 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1838 - OBJ
      ?AUTO_1839 - LOCATION
    )
    :vars
    (
      ?AUTO_1840 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1840 ?AUTO_1839 ) ( IN-TRUCK ?AUTO_1838 ?AUTO_1840 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1838 ?AUTO_1840 ?AUTO_1839 )
      ( DELIVER-PKG-VERIFY ?AUTO_1838 ?AUTO_1839 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1845 - OBJ
      ?AUTO_1846 - LOCATION
    )
    :vars
    (
      ?AUTO_1849 - TRUCK
      ?AUTO_1852 - LOCATION
      ?AUTO_1851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1845 ?AUTO_1849 ) ( TRUCK-AT ?AUTO_1849 ?AUTO_1852 ) ( IN-CITY ?AUTO_1852 ?AUTO_1851 ) ( IN-CITY ?AUTO_1846 ?AUTO_1851 ) ( not ( = ?AUTO_1846 ?AUTO_1852 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1849 ?AUTO_1852 ?AUTO_1846 ?AUTO_1851 )
      ( DELIVER-PKG ?AUTO_1845 ?AUTO_1846 )
      ( DELIVER-PKG-VERIFY ?AUTO_1845 ?AUTO_1846 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1858 - OBJ
      ?AUTO_1859 - LOCATION
    )
    :vars
    (
      ?AUTO_1864 - TRUCK
      ?AUTO_1863 - LOCATION
      ?AUTO_1860 - CITY
      ?AUTO_1866 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1864 ?AUTO_1863 ) ( IN-CITY ?AUTO_1863 ?AUTO_1860 ) ( IN-CITY ?AUTO_1859 ?AUTO_1860 ) ( not ( = ?AUTO_1859 ?AUTO_1863 ) ) ( TRUCK-AT ?AUTO_1864 ?AUTO_1866 ) ( OBJ-AT ?AUTO_1858 ?AUTO_1866 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1858 ?AUTO_1864 ?AUTO_1866 )
      ( DELIVER-PKG ?AUTO_1858 ?AUTO_1859 )
      ( DELIVER-PKG-VERIFY ?AUTO_1858 ?AUTO_1859 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1874 - OBJ
      ?AUTO_1875 - LOCATION
    )
    :vars
    (
      ?AUTO_1878 - TRUCK
      ?AUTO_1879 - LOCATION
      ?AUTO_1876 - CITY
      ?AUTO_1881 - LOCATION
      ?AUTO_1882 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1878 ?AUTO_1879 ) ( IN-CITY ?AUTO_1879 ?AUTO_1876 ) ( IN-CITY ?AUTO_1875 ?AUTO_1876 ) ( not ( = ?AUTO_1875 ?AUTO_1879 ) ) ( TRUCK-AT ?AUTO_1878 ?AUTO_1881 ) ( IN-AIRPLANE ?AUTO_1874 ?AUTO_1882 ) ( AIRPLANE-AT ?AUTO_1882 ?AUTO_1881 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1874 ?AUTO_1882 ?AUTO_1881 )
      ( DELIVER-PKG ?AUTO_1874 ?AUTO_1875 )
      ( DELIVER-PKG-VERIFY ?AUTO_1874 ?AUTO_1875 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1901 - OBJ
      ?AUTO_1902 - LOCATION
    )
    :vars
    (
      ?AUTO_1903 - LOCATION
      ?AUTO_1905 - CITY
      ?AUTO_1909 - AIRPLANE
      ?AUTO_1908 - LOCATION
      ?AUTO_1904 - TRUCK
      ?AUTO_1913 - LOCATION
      ?AUTO_1912 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1903 ?AUTO_1905 ) ( IN-CITY ?AUTO_1902 ?AUTO_1905 ) ( not ( = ?AUTO_1902 ?AUTO_1903 ) ) ( IN-AIRPLANE ?AUTO_1901 ?AUTO_1909 ) ( AIRPORT ?AUTO_1908 ) ( AIRPORT ?AUTO_1903 ) ( AIRPLANE-AT ?AUTO_1909 ?AUTO_1908 ) ( not ( = ?AUTO_1908 ?AUTO_1903 ) ) ( TRUCK-AT ?AUTO_1904 ?AUTO_1913 ) ( IN-CITY ?AUTO_1913 ?AUTO_1912 ) ( IN-CITY ?AUTO_1903 ?AUTO_1912 ) ( not ( = ?AUTO_1903 ?AUTO_1913 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1904 ?AUTO_1913 ?AUTO_1903 ?AUTO_1912 )
      ( DELIVER-PKG ?AUTO_1901 ?AUTO_1902 )
      ( DELIVER-PKG-VERIFY ?AUTO_1901 ?AUTO_1902 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1927 - OBJ
      ?AUTO_1928 - LOCATION
    )
    :vars
    (
      ?AUTO_1929 - LOCATION
      ?AUTO_1937 - CITY
      ?AUTO_1936 - LOCATION
      ?AUTO_1934 - AIRPLANE
      ?AUTO_1931 - TRUCK
      ?AUTO_1935 - LOCATION
      ?AUTO_1932 - CITY
      ?AUTO_1939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1929 ?AUTO_1937 ) ( IN-CITY ?AUTO_1928 ?AUTO_1937 ) ( not ( = ?AUTO_1928 ?AUTO_1929 ) ) ( AIRPORT ?AUTO_1936 ) ( AIRPORT ?AUTO_1929 ) ( AIRPLANE-AT ?AUTO_1934 ?AUTO_1936 ) ( not ( = ?AUTO_1936 ?AUTO_1929 ) ) ( TRUCK-AT ?AUTO_1931 ?AUTO_1935 ) ( IN-CITY ?AUTO_1935 ?AUTO_1932 ) ( IN-CITY ?AUTO_1929 ?AUTO_1932 ) ( not ( = ?AUTO_1929 ?AUTO_1935 ) ) ( OBJ-AT ?AUTO_1927 ?AUTO_1939 ) ( AIRPLANE-AT ?AUTO_1934 ?AUTO_1939 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1927 ?AUTO_1934 ?AUTO_1939 )
      ( DELIVER-PKG ?AUTO_1927 ?AUTO_1928 )
      ( DELIVER-PKG-VERIFY ?AUTO_1927 ?AUTO_1928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1942 - OBJ
      ?AUTO_1943 - LOCATION
    )
    :vars
    (
      ?AUTO_1944 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1944 ?AUTO_1943 ) ( IN-TRUCK ?AUTO_1942 ?AUTO_1944 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1942 ?AUTO_1944 ?AUTO_1943 )
      ( DELIVER-PKG-VERIFY ?AUTO_1942 ?AUTO_1943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1947 - OBJ
      ?AUTO_1948 - LOCATION
    )
    :vars
    (
      ?AUTO_1951 - TRUCK
      ?AUTO_1954 - LOCATION
      ?AUTO_1953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1947 ?AUTO_1951 ) ( TRUCK-AT ?AUTO_1951 ?AUTO_1954 ) ( IN-CITY ?AUTO_1954 ?AUTO_1953 ) ( IN-CITY ?AUTO_1948 ?AUTO_1953 ) ( not ( = ?AUTO_1948 ?AUTO_1954 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1951 ?AUTO_1954 ?AUTO_1948 ?AUTO_1953 )
      ( DELIVER-PKG ?AUTO_1947 ?AUTO_1948 )
      ( DELIVER-PKG-VERIFY ?AUTO_1947 ?AUTO_1948 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1956 - OBJ
      ?AUTO_1957 - LOCATION
    )
    :vars
    (
      ?AUTO_1960 - TRUCK
      ?AUTO_1962 - LOCATION
      ?AUTO_1961 - CITY
      ?AUTO_1964 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1960 ?AUTO_1962 ) ( IN-CITY ?AUTO_1962 ?AUTO_1961 ) ( IN-CITY ?AUTO_1957 ?AUTO_1961 ) ( not ( = ?AUTO_1957 ?AUTO_1962 ) ) ( TRUCK-AT ?AUTO_1960 ?AUTO_1964 ) ( OBJ-AT ?AUTO_1956 ?AUTO_1964 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1956 ?AUTO_1960 ?AUTO_1964 )
      ( DELIVER-PKG ?AUTO_1956 ?AUTO_1957 )
      ( DELIVER-PKG-VERIFY ?AUTO_1956 ?AUTO_1957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1968 - OBJ
      ?AUTO_1969 - LOCATION
    )
    :vars
    (
      ?AUTO_1970 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1968 ?AUTO_1970 ) ( AIRPLANE-AT ?AUTO_1970 ?AUTO_1969 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1968 ?AUTO_1970 ?AUTO_1969 )
      ( DELIVER-PKG-VERIFY ?AUTO_1968 ?AUTO_1969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1973 - OBJ
      ?AUTO_1974 - LOCATION
    )
    :vars
    (
      ?AUTO_1977 - AIRPLANE
      ?AUTO_1979 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1973 ?AUTO_1977 ) ( AIRPORT ?AUTO_1979 ) ( AIRPORT ?AUTO_1974 ) ( AIRPLANE-AT ?AUTO_1977 ?AUTO_1979 ) ( not ( = ?AUTO_1979 ?AUTO_1974 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1977 ?AUTO_1979 ?AUTO_1974 )
      ( DELIVER-PKG ?AUTO_1973 ?AUTO_1974 )
      ( DELIVER-PKG-VERIFY ?AUTO_1973 ?AUTO_1974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1985 - OBJ
      ?AUTO_1986 - LOCATION
    )
    :vars
    (
      ?AUTO_1987 - LOCATION
      ?AUTO_1990 - AIRPLANE
      ?AUTO_1992 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1987 ) ( AIRPORT ?AUTO_1986 ) ( AIRPLANE-AT ?AUTO_1990 ?AUTO_1987 ) ( not ( = ?AUTO_1987 ?AUTO_1986 ) ) ( OBJ-AT ?AUTO_1985 ?AUTO_1992 ) ( AIRPLANE-AT ?AUTO_1990 ?AUTO_1992 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1985 ?AUTO_1990 ?AUTO_1992 )
      ( DELIVER-PKG ?AUTO_1985 ?AUTO_1986 )
      ( DELIVER-PKG-VERIFY ?AUTO_1985 ?AUTO_1986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2002 - OBJ
      ?AUTO_2003 - LOCATION
    )
    :vars
    (
      ?AUTO_2004 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2002 ?AUTO_2004 ) ( AIRPLANE-AT ?AUTO_2004 ?AUTO_2003 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2002 ?AUTO_2004 ?AUTO_2003 )
      ( DELIVER-PKG-VERIFY ?AUTO_2002 ?AUTO_2003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2007 - OBJ
      ?AUTO_2008 - LOCATION
    )
    :vars
    (
      ?AUTO_2011 - AIRPLANE
      ?AUTO_2013 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2007 ?AUTO_2011 ) ( AIRPORT ?AUTO_2013 ) ( AIRPORT ?AUTO_2008 ) ( AIRPLANE-AT ?AUTO_2011 ?AUTO_2013 ) ( not ( = ?AUTO_2013 ?AUTO_2008 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2011 ?AUTO_2013 ?AUTO_2008 )
      ( DELIVER-PKG ?AUTO_2007 ?AUTO_2008 )
      ( DELIVER-PKG-VERIFY ?AUTO_2007 ?AUTO_2008 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2019 - OBJ
      ?AUTO_2020 - LOCATION
    )
    :vars
    (
      ?AUTO_2021 - LOCATION
      ?AUTO_2024 - AIRPLANE
      ?AUTO_2026 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2021 ) ( AIRPORT ?AUTO_2020 ) ( AIRPLANE-AT ?AUTO_2024 ?AUTO_2021 ) ( not ( = ?AUTO_2021 ?AUTO_2020 ) ) ( OBJ-AT ?AUTO_2019 ?AUTO_2026 ) ( AIRPLANE-AT ?AUTO_2024 ?AUTO_2026 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2019 ?AUTO_2024 ?AUTO_2026 )
      ( DELIVER-PKG ?AUTO_2019 ?AUTO_2020 )
      ( DELIVER-PKG-VERIFY ?AUTO_2019 ?AUTO_2020 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2028 - OBJ
      ?AUTO_2029 - LOCATION
    )
    :vars
    (
      ?AUTO_2034 - LOCATION
      ?AUTO_2036 - LOCATION
      ?AUTO_2033 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2034 ) ( AIRPORT ?AUTO_2029 ) ( not ( = ?AUTO_2034 ?AUTO_2029 ) ) ( OBJ-AT ?AUTO_2028 ?AUTO_2034 ) ( AIRPORT ?AUTO_2036 ) ( AIRPLANE-AT ?AUTO_2033 ?AUTO_2036 ) ( not ( = ?AUTO_2036 ?AUTO_2034 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2033 ?AUTO_2036 ?AUTO_2034 )
      ( DELIVER-PKG ?AUTO_2028 ?AUTO_2029 )
      ( DELIVER-PKG-VERIFY ?AUTO_2028 ?AUTO_2029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2040 - OBJ
      ?AUTO_2041 - LOCATION
    )
    :vars
    (
      ?AUTO_2042 - LOCATION
      ?AUTO_2045 - LOCATION
      ?AUTO_2043 - AIRPLANE
      ?AUTO_2047 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2042 ) ( AIRPORT ?AUTO_2041 ) ( not ( = ?AUTO_2042 ?AUTO_2041 ) ) ( AIRPORT ?AUTO_2045 ) ( AIRPLANE-AT ?AUTO_2043 ?AUTO_2045 ) ( not ( = ?AUTO_2045 ?AUTO_2042 ) ) ( TRUCK-AT ?AUTO_2047 ?AUTO_2042 ) ( IN-TRUCK ?AUTO_2040 ?AUTO_2047 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2040 ?AUTO_2047 ?AUTO_2042 )
      ( DELIVER-PKG ?AUTO_2040 ?AUTO_2041 )
      ( DELIVER-PKG-VERIFY ?AUTO_2040 ?AUTO_2041 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2050 - OBJ
      ?AUTO_2051 - LOCATION
    )
    :vars
    (
      ?AUTO_2056 - LOCATION
      ?AUTO_2055 - LOCATION
      ?AUTO_2054 - AIRPLANE
      ?AUTO_2057 - TRUCK
      ?AUTO_2060 - LOCATION
      ?AUTO_2059 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2056 ) ( AIRPORT ?AUTO_2051 ) ( not ( = ?AUTO_2056 ?AUTO_2051 ) ) ( AIRPORT ?AUTO_2055 ) ( AIRPLANE-AT ?AUTO_2054 ?AUTO_2055 ) ( not ( = ?AUTO_2055 ?AUTO_2056 ) ) ( IN-TRUCK ?AUTO_2050 ?AUTO_2057 ) ( TRUCK-AT ?AUTO_2057 ?AUTO_2060 ) ( IN-CITY ?AUTO_2060 ?AUTO_2059 ) ( IN-CITY ?AUTO_2056 ?AUTO_2059 ) ( not ( = ?AUTO_2056 ?AUTO_2060 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2057 ?AUTO_2060 ?AUTO_2056 ?AUTO_2059 )
      ( DELIVER-PKG ?AUTO_2050 ?AUTO_2051 )
      ( DELIVER-PKG-VERIFY ?AUTO_2050 ?AUTO_2051 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2062 - OBJ
      ?AUTO_2063 - LOCATION
    )
    :vars
    (
      ?AUTO_2069 - LOCATION
      ?AUTO_2065 - LOCATION
      ?AUTO_2070 - AIRPLANE
      ?AUTO_2066 - TRUCK
      ?AUTO_2071 - LOCATION
      ?AUTO_2064 - CITY
      ?AUTO_2073 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2069 ) ( AIRPORT ?AUTO_2063 ) ( not ( = ?AUTO_2069 ?AUTO_2063 ) ) ( AIRPORT ?AUTO_2065 ) ( AIRPLANE-AT ?AUTO_2070 ?AUTO_2065 ) ( not ( = ?AUTO_2065 ?AUTO_2069 ) ) ( TRUCK-AT ?AUTO_2066 ?AUTO_2071 ) ( IN-CITY ?AUTO_2071 ?AUTO_2064 ) ( IN-CITY ?AUTO_2069 ?AUTO_2064 ) ( not ( = ?AUTO_2069 ?AUTO_2071 ) ) ( TRUCK-AT ?AUTO_2066 ?AUTO_2073 ) ( OBJ-AT ?AUTO_2062 ?AUTO_2073 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2062 ?AUTO_2066 ?AUTO_2073 )
      ( DELIVER-PKG ?AUTO_2062 ?AUTO_2063 )
      ( DELIVER-PKG-VERIFY ?AUTO_2062 ?AUTO_2063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2077 - OBJ
      ?AUTO_2078 - LOCATION
    )
    :vars
    (
      ?AUTO_2079 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2079 ?AUTO_2078 ) ( IN-TRUCK ?AUTO_2077 ?AUTO_2079 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2077 ?AUTO_2079 ?AUTO_2078 )
      ( DELIVER-PKG-VERIFY ?AUTO_2077 ?AUTO_2078 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2082 - OBJ
      ?AUTO_2083 - LOCATION
    )
    :vars
    (
      ?AUTO_2086 - TRUCK
      ?AUTO_2089 - LOCATION
      ?AUTO_2088 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2082 ?AUTO_2086 ) ( TRUCK-AT ?AUTO_2086 ?AUTO_2089 ) ( IN-CITY ?AUTO_2089 ?AUTO_2088 ) ( IN-CITY ?AUTO_2083 ?AUTO_2088 ) ( not ( = ?AUTO_2083 ?AUTO_2089 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2086 ?AUTO_2089 ?AUTO_2083 ?AUTO_2088 )
      ( DELIVER-PKG ?AUTO_2082 ?AUTO_2083 )
      ( DELIVER-PKG-VERIFY ?AUTO_2082 ?AUTO_2083 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2091 - OBJ
      ?AUTO_2092 - LOCATION
    )
    :vars
    (
      ?AUTO_2095 - TRUCK
      ?AUTO_2097 - LOCATION
      ?AUTO_2096 - CITY
      ?AUTO_2099 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2095 ?AUTO_2097 ) ( IN-CITY ?AUTO_2097 ?AUTO_2096 ) ( IN-CITY ?AUTO_2092 ?AUTO_2096 ) ( not ( = ?AUTO_2092 ?AUTO_2097 ) ) ( TRUCK-AT ?AUTO_2095 ?AUTO_2099 ) ( OBJ-AT ?AUTO_2091 ?AUTO_2099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2091 ?AUTO_2095 ?AUTO_2099 )
      ( DELIVER-PKG ?AUTO_2091 ?AUTO_2092 )
      ( DELIVER-PKG-VERIFY ?AUTO_2091 ?AUTO_2092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2101 - OBJ
      ?AUTO_2102 - LOCATION
    )
    :vars
    (
      ?AUTO_2108 - LOCATION
      ?AUTO_2107 - CITY
      ?AUTO_2106 - TRUCK
      ?AUTO_2111 - LOCATION
      ?AUTO_2110 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2108 ?AUTO_2107 ) ( IN-CITY ?AUTO_2102 ?AUTO_2107 ) ( not ( = ?AUTO_2102 ?AUTO_2108 ) ) ( OBJ-AT ?AUTO_2101 ?AUTO_2108 ) ( TRUCK-AT ?AUTO_2106 ?AUTO_2111 ) ( IN-CITY ?AUTO_2111 ?AUTO_2110 ) ( IN-CITY ?AUTO_2108 ?AUTO_2110 ) ( not ( = ?AUTO_2108 ?AUTO_2111 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2106 ?AUTO_2111 ?AUTO_2108 ?AUTO_2110 )
      ( DELIVER-PKG ?AUTO_2101 ?AUTO_2102 )
      ( DELIVER-PKG-VERIFY ?AUTO_2101 ?AUTO_2102 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2117 - OBJ
      ?AUTO_2118 - LOCATION
    )
    :vars
    (
      ?AUTO_2119 - LOCATION
      ?AUTO_2124 - CITY
      ?AUTO_2121 - TRUCK
      ?AUTO_2122 - LOCATION
      ?AUTO_2125 - CITY
      ?AUTO_2126 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2119 ?AUTO_2124 ) ( IN-CITY ?AUTO_2118 ?AUTO_2124 ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) ( TRUCK-AT ?AUTO_2121 ?AUTO_2122 ) ( IN-CITY ?AUTO_2122 ?AUTO_2125 ) ( IN-CITY ?AUTO_2119 ?AUTO_2125 ) ( not ( = ?AUTO_2119 ?AUTO_2122 ) ) ( IN-AIRPLANE ?AUTO_2117 ?AUTO_2126 ) ( AIRPLANE-AT ?AUTO_2126 ?AUTO_2119 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2117 ?AUTO_2126 ?AUTO_2119 )
      ( DELIVER-PKG ?AUTO_2117 ?AUTO_2118 )
      ( DELIVER-PKG-VERIFY ?AUTO_2117 ?AUTO_2118 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2129 - OBJ
      ?AUTO_2130 - LOCATION
    )
    :vars
    (
      ?AUTO_2135 - LOCATION
      ?AUTO_2137 - CITY
      ?AUTO_2133 - TRUCK
      ?AUTO_2134 - LOCATION
      ?AUTO_2136 - CITY
      ?AUTO_2138 - AIRPLANE
      ?AUTO_2140 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2135 ?AUTO_2137 ) ( IN-CITY ?AUTO_2130 ?AUTO_2137 ) ( not ( = ?AUTO_2130 ?AUTO_2135 ) ) ( TRUCK-AT ?AUTO_2133 ?AUTO_2134 ) ( IN-CITY ?AUTO_2134 ?AUTO_2136 ) ( IN-CITY ?AUTO_2135 ?AUTO_2136 ) ( not ( = ?AUTO_2135 ?AUTO_2134 ) ) ( IN-AIRPLANE ?AUTO_2129 ?AUTO_2138 ) ( AIRPORT ?AUTO_2140 ) ( AIRPORT ?AUTO_2135 ) ( AIRPLANE-AT ?AUTO_2138 ?AUTO_2140 ) ( not ( = ?AUTO_2140 ?AUTO_2135 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2138 ?AUTO_2140 ?AUTO_2135 )
      ( DELIVER-PKG ?AUTO_2129 ?AUTO_2130 )
      ( DELIVER-PKG-VERIFY ?AUTO_2129 ?AUTO_2130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2146 - OBJ
      ?AUTO_2147 - LOCATION
    )
    :vars
    (
      ?AUTO_2150 - LOCATION
      ?AUTO_2151 - CITY
      ?AUTO_2148 - TRUCK
      ?AUTO_2155 - LOCATION
      ?AUTO_2153 - CITY
      ?AUTO_2154 - LOCATION
      ?AUTO_2156 - AIRPLANE
      ?AUTO_2158 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2150 ?AUTO_2151 ) ( IN-CITY ?AUTO_2147 ?AUTO_2151 ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) ( TRUCK-AT ?AUTO_2148 ?AUTO_2155 ) ( IN-CITY ?AUTO_2155 ?AUTO_2153 ) ( IN-CITY ?AUTO_2150 ?AUTO_2153 ) ( not ( = ?AUTO_2150 ?AUTO_2155 ) ) ( AIRPORT ?AUTO_2154 ) ( AIRPORT ?AUTO_2150 ) ( AIRPLANE-AT ?AUTO_2156 ?AUTO_2154 ) ( not ( = ?AUTO_2154 ?AUTO_2150 ) ) ( OBJ-AT ?AUTO_2146 ?AUTO_2158 ) ( AIRPLANE-AT ?AUTO_2156 ?AUTO_2158 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2146 ?AUTO_2156 ?AUTO_2158 )
      ( DELIVER-PKG ?AUTO_2146 ?AUTO_2147 )
      ( DELIVER-PKG-VERIFY ?AUTO_2146 ?AUTO_2147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2168 - OBJ
      ?AUTO_2169 - LOCATION
    )
    :vars
    (
      ?AUTO_2170 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2170 ?AUTO_2169 ) ( IN-TRUCK ?AUTO_2168 ?AUTO_2170 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2168 ?AUTO_2170 ?AUTO_2169 )
      ( DELIVER-PKG-VERIFY ?AUTO_2168 ?AUTO_2169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2173 - OBJ
      ?AUTO_2174 - LOCATION
    )
    :vars
    (
      ?AUTO_2177 - TRUCK
      ?AUTO_2180 - LOCATION
      ?AUTO_2179 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2173 ?AUTO_2177 ) ( TRUCK-AT ?AUTO_2177 ?AUTO_2180 ) ( IN-CITY ?AUTO_2180 ?AUTO_2179 ) ( IN-CITY ?AUTO_2174 ?AUTO_2179 ) ( not ( = ?AUTO_2174 ?AUTO_2180 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2177 ?AUTO_2180 ?AUTO_2174 ?AUTO_2179 )
      ( DELIVER-PKG ?AUTO_2173 ?AUTO_2174 )
      ( DELIVER-PKG-VERIFY ?AUTO_2173 ?AUTO_2174 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2182 - OBJ
      ?AUTO_2183 - LOCATION
    )
    :vars
    (
      ?AUTO_2186 - TRUCK
      ?AUTO_2188 - LOCATION
      ?AUTO_2187 - CITY
      ?AUTO_2190 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2186 ?AUTO_2188 ) ( IN-CITY ?AUTO_2188 ?AUTO_2187 ) ( IN-CITY ?AUTO_2183 ?AUTO_2187 ) ( not ( = ?AUTO_2183 ?AUTO_2188 ) ) ( TRUCK-AT ?AUTO_2186 ?AUTO_2190 ) ( OBJ-AT ?AUTO_2182 ?AUTO_2190 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2182 ?AUTO_2186 ?AUTO_2190 )
      ( DELIVER-PKG ?AUTO_2182 ?AUTO_2183 )
      ( DELIVER-PKG-VERIFY ?AUTO_2182 ?AUTO_2183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2192 - OBJ
      ?AUTO_2193 - LOCATION
    )
    :vars
    (
      ?AUTO_2199 - LOCATION
      ?AUTO_2198 - CITY
      ?AUTO_2197 - TRUCK
      ?AUTO_2202 - LOCATION
      ?AUTO_2201 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2199 ?AUTO_2198 ) ( IN-CITY ?AUTO_2193 ?AUTO_2198 ) ( not ( = ?AUTO_2193 ?AUTO_2199 ) ) ( OBJ-AT ?AUTO_2192 ?AUTO_2199 ) ( TRUCK-AT ?AUTO_2197 ?AUTO_2202 ) ( IN-CITY ?AUTO_2202 ?AUTO_2201 ) ( IN-CITY ?AUTO_2199 ?AUTO_2201 ) ( not ( = ?AUTO_2199 ?AUTO_2202 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2197 ?AUTO_2202 ?AUTO_2199 ?AUTO_2201 )
      ( DELIVER-PKG ?AUTO_2192 ?AUTO_2193 )
      ( DELIVER-PKG-VERIFY ?AUTO_2192 ?AUTO_2193 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2212 - OBJ
      ?AUTO_2213 - LOCATION
    )
    :vars
    (
      ?AUTO_2216 - LOCATION
      ?AUTO_2214 - CITY
      ?AUTO_2219 - TRUCK
      ?AUTO_2220 - LOCATION
      ?AUTO_2215 - CITY
      ?AUTO_2221 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2216 ?AUTO_2214 ) ( IN-CITY ?AUTO_2213 ?AUTO_2214 ) ( not ( = ?AUTO_2213 ?AUTO_2216 ) ) ( TRUCK-AT ?AUTO_2219 ?AUTO_2220 ) ( IN-CITY ?AUTO_2220 ?AUTO_2215 ) ( IN-CITY ?AUTO_2216 ?AUTO_2215 ) ( not ( = ?AUTO_2216 ?AUTO_2220 ) ) ( IN-AIRPLANE ?AUTO_2212 ?AUTO_2221 ) ( AIRPLANE-AT ?AUTO_2221 ?AUTO_2216 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2212 ?AUTO_2221 ?AUTO_2216 )
      ( DELIVER-PKG ?AUTO_2212 ?AUTO_2213 )
      ( DELIVER-PKG-VERIFY ?AUTO_2212 ?AUTO_2213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2224 - OBJ
      ?AUTO_2225 - LOCATION
    )
    :vars
    (
      ?AUTO_2232 - LOCATION
      ?AUTO_2229 - CITY
      ?AUTO_2228 - TRUCK
      ?AUTO_2230 - LOCATION
      ?AUTO_2231 - CITY
      ?AUTO_2233 - AIRPLANE
      ?AUTO_2235 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2232 ?AUTO_2229 ) ( IN-CITY ?AUTO_2225 ?AUTO_2229 ) ( not ( = ?AUTO_2225 ?AUTO_2232 ) ) ( TRUCK-AT ?AUTO_2228 ?AUTO_2230 ) ( IN-CITY ?AUTO_2230 ?AUTO_2231 ) ( IN-CITY ?AUTO_2232 ?AUTO_2231 ) ( not ( = ?AUTO_2232 ?AUTO_2230 ) ) ( IN-AIRPLANE ?AUTO_2224 ?AUTO_2233 ) ( AIRPORT ?AUTO_2235 ) ( AIRPORT ?AUTO_2232 ) ( AIRPLANE-AT ?AUTO_2233 ?AUTO_2235 ) ( not ( = ?AUTO_2235 ?AUTO_2232 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2233 ?AUTO_2235 ?AUTO_2232 )
      ( DELIVER-PKG ?AUTO_2224 ?AUTO_2225 )
      ( DELIVER-PKG-VERIFY ?AUTO_2224 ?AUTO_2225 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2241 - OBJ
      ?AUTO_2242 - LOCATION
    )
    :vars
    (
      ?AUTO_2246 - LOCATION
      ?AUTO_2245 - CITY
      ?AUTO_2249 - TRUCK
      ?AUTO_2243 - LOCATION
      ?AUTO_2244 - CITY
      ?AUTO_2248 - LOCATION
      ?AUTO_2251 - AIRPLANE
      ?AUTO_2253 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2246 ?AUTO_2245 ) ( IN-CITY ?AUTO_2242 ?AUTO_2245 ) ( not ( = ?AUTO_2242 ?AUTO_2246 ) ) ( TRUCK-AT ?AUTO_2249 ?AUTO_2243 ) ( IN-CITY ?AUTO_2243 ?AUTO_2244 ) ( IN-CITY ?AUTO_2246 ?AUTO_2244 ) ( not ( = ?AUTO_2246 ?AUTO_2243 ) ) ( AIRPORT ?AUTO_2248 ) ( AIRPORT ?AUTO_2246 ) ( AIRPLANE-AT ?AUTO_2251 ?AUTO_2248 ) ( not ( = ?AUTO_2248 ?AUTO_2246 ) ) ( OBJ-AT ?AUTO_2241 ?AUTO_2253 ) ( AIRPLANE-AT ?AUTO_2251 ?AUTO_2253 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2241 ?AUTO_2251 ?AUTO_2253 )
      ( DELIVER-PKG ?AUTO_2241 ?AUTO_2242 )
      ( DELIVER-PKG-VERIFY ?AUTO_2241 ?AUTO_2242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2255 - OBJ
      ?AUTO_2256 - LOCATION
    )
    :vars
    (
      ?AUTO_2258 - LOCATION
      ?AUTO_2263 - CITY
      ?AUTO_2262 - TRUCK
      ?AUTO_2265 - LOCATION
      ?AUTO_2261 - CITY
      ?AUTO_2259 - LOCATION
      ?AUTO_2268 - LOCATION
      ?AUTO_2264 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2258 ?AUTO_2263 ) ( IN-CITY ?AUTO_2256 ?AUTO_2263 ) ( not ( = ?AUTO_2256 ?AUTO_2258 ) ) ( TRUCK-AT ?AUTO_2262 ?AUTO_2265 ) ( IN-CITY ?AUTO_2265 ?AUTO_2261 ) ( IN-CITY ?AUTO_2258 ?AUTO_2261 ) ( not ( = ?AUTO_2258 ?AUTO_2265 ) ) ( AIRPORT ?AUTO_2259 ) ( AIRPORT ?AUTO_2258 ) ( not ( = ?AUTO_2259 ?AUTO_2258 ) ) ( OBJ-AT ?AUTO_2255 ?AUTO_2259 ) ( AIRPORT ?AUTO_2268 ) ( AIRPLANE-AT ?AUTO_2264 ?AUTO_2268 ) ( not ( = ?AUTO_2268 ?AUTO_2259 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2264 ?AUTO_2268 ?AUTO_2259 )
      ( DELIVER-PKG ?AUTO_2255 ?AUTO_2256 )
      ( DELIVER-PKG-VERIFY ?AUTO_2255 ?AUTO_2256 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2272 - OBJ
      ?AUTO_2273 - LOCATION
    )
    :vars
    (
      ?AUTO_2280 - LOCATION
      ?AUTO_2278 - CITY
      ?AUTO_2274 - TRUCK
      ?AUTO_2281 - LOCATION
      ?AUTO_2283 - CITY
      ?AUTO_2277 - LOCATION
      ?AUTO_2279 - LOCATION
      ?AUTO_2275 - AIRPLANE
      ?AUTO_2284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2280 ?AUTO_2278 ) ( IN-CITY ?AUTO_2273 ?AUTO_2278 ) ( not ( = ?AUTO_2273 ?AUTO_2280 ) ) ( TRUCK-AT ?AUTO_2274 ?AUTO_2281 ) ( IN-CITY ?AUTO_2281 ?AUTO_2283 ) ( IN-CITY ?AUTO_2280 ?AUTO_2283 ) ( not ( = ?AUTO_2280 ?AUTO_2281 ) ) ( AIRPORT ?AUTO_2277 ) ( AIRPORT ?AUTO_2280 ) ( not ( = ?AUTO_2277 ?AUTO_2280 ) ) ( AIRPORT ?AUTO_2279 ) ( AIRPLANE-AT ?AUTO_2275 ?AUTO_2279 ) ( not ( = ?AUTO_2279 ?AUTO_2277 ) ) ( TRUCK-AT ?AUTO_2284 ?AUTO_2277 ) ( IN-TRUCK ?AUTO_2272 ?AUTO_2284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2272 ?AUTO_2284 ?AUTO_2277 )
      ( DELIVER-PKG ?AUTO_2272 ?AUTO_2273 )
      ( DELIVER-PKG-VERIFY ?AUTO_2272 ?AUTO_2273 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2287 - OBJ
      ?AUTO_2288 - LOCATION
    )
    :vars
    (
      ?AUTO_2292 - LOCATION
      ?AUTO_2298 - CITY
      ?AUTO_2296 - TRUCK
      ?AUTO_2297 - LOCATION
      ?AUTO_2293 - CITY
      ?AUTO_2290 - LOCATION
      ?AUTO_2294 - LOCATION
      ?AUTO_2295 - AIRPLANE
      ?AUTO_2299 - TRUCK
      ?AUTO_2302 - LOCATION
      ?AUTO_2301 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2292 ?AUTO_2298 ) ( IN-CITY ?AUTO_2288 ?AUTO_2298 ) ( not ( = ?AUTO_2288 ?AUTO_2292 ) ) ( TRUCK-AT ?AUTO_2296 ?AUTO_2297 ) ( IN-CITY ?AUTO_2297 ?AUTO_2293 ) ( IN-CITY ?AUTO_2292 ?AUTO_2293 ) ( not ( = ?AUTO_2292 ?AUTO_2297 ) ) ( AIRPORT ?AUTO_2290 ) ( AIRPORT ?AUTO_2292 ) ( not ( = ?AUTO_2290 ?AUTO_2292 ) ) ( AIRPORT ?AUTO_2294 ) ( AIRPLANE-AT ?AUTO_2295 ?AUTO_2294 ) ( not ( = ?AUTO_2294 ?AUTO_2290 ) ) ( IN-TRUCK ?AUTO_2287 ?AUTO_2299 ) ( TRUCK-AT ?AUTO_2299 ?AUTO_2302 ) ( IN-CITY ?AUTO_2302 ?AUTO_2301 ) ( IN-CITY ?AUTO_2290 ?AUTO_2301 ) ( not ( = ?AUTO_2290 ?AUTO_2302 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2299 ?AUTO_2302 ?AUTO_2290 ?AUTO_2301 )
      ( DELIVER-PKG ?AUTO_2287 ?AUTO_2288 )
      ( DELIVER-PKG-VERIFY ?AUTO_2287 ?AUTO_2288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2304 - OBJ
      ?AUTO_2305 - LOCATION
    )
    :vars
    (
      ?AUTO_2312 - LOCATION
      ?AUTO_2314 - CITY
      ?AUTO_2306 - TRUCK
      ?AUTO_2308 - LOCATION
      ?AUTO_2313 - CITY
      ?AUTO_2309 - LOCATION
      ?AUTO_2316 - LOCATION
      ?AUTO_2317 - AIRPLANE
      ?AUTO_2307 - TRUCK
      ?AUTO_2318 - LOCATION
      ?AUTO_2315 - CITY
      ?AUTO_2320 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2312 ?AUTO_2314 ) ( IN-CITY ?AUTO_2305 ?AUTO_2314 ) ( not ( = ?AUTO_2305 ?AUTO_2312 ) ) ( TRUCK-AT ?AUTO_2306 ?AUTO_2308 ) ( IN-CITY ?AUTO_2308 ?AUTO_2313 ) ( IN-CITY ?AUTO_2312 ?AUTO_2313 ) ( not ( = ?AUTO_2312 ?AUTO_2308 ) ) ( AIRPORT ?AUTO_2309 ) ( AIRPORT ?AUTO_2312 ) ( not ( = ?AUTO_2309 ?AUTO_2312 ) ) ( AIRPORT ?AUTO_2316 ) ( AIRPLANE-AT ?AUTO_2317 ?AUTO_2316 ) ( not ( = ?AUTO_2316 ?AUTO_2309 ) ) ( TRUCK-AT ?AUTO_2307 ?AUTO_2318 ) ( IN-CITY ?AUTO_2318 ?AUTO_2315 ) ( IN-CITY ?AUTO_2309 ?AUTO_2315 ) ( not ( = ?AUTO_2309 ?AUTO_2318 ) ) ( TRUCK-AT ?AUTO_2307 ?AUTO_2320 ) ( OBJ-AT ?AUTO_2304 ?AUTO_2320 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2304 ?AUTO_2307 ?AUTO_2320 )
      ( DELIVER-PKG ?AUTO_2304 ?AUTO_2305 )
      ( DELIVER-PKG-VERIFY ?AUTO_2304 ?AUTO_2305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2323 - OBJ
      ?AUTO_2324 - LOCATION
    )
    :vars
    (
      ?AUTO_2325 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2325 ?AUTO_2324 ) ( IN-TRUCK ?AUTO_2323 ?AUTO_2325 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2323 ?AUTO_2325 ?AUTO_2324 )
      ( DELIVER-PKG-VERIFY ?AUTO_2323 ?AUTO_2324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2328 - OBJ
      ?AUTO_2329 - LOCATION
    )
    :vars
    (
      ?AUTO_2332 - TRUCK
      ?AUTO_2335 - LOCATION
      ?AUTO_2334 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2328 ?AUTO_2332 ) ( TRUCK-AT ?AUTO_2332 ?AUTO_2335 ) ( IN-CITY ?AUTO_2335 ?AUTO_2334 ) ( IN-CITY ?AUTO_2329 ?AUTO_2334 ) ( not ( = ?AUTO_2329 ?AUTO_2335 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2332 ?AUTO_2335 ?AUTO_2329 ?AUTO_2334 )
      ( DELIVER-PKG ?AUTO_2328 ?AUTO_2329 )
      ( DELIVER-PKG-VERIFY ?AUTO_2328 ?AUTO_2329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2341 - OBJ
      ?AUTO_2342 - LOCATION
    )
    :vars
    (
      ?AUTO_2347 - TRUCK
      ?AUTO_2344 - LOCATION
      ?AUTO_2343 - CITY
      ?AUTO_2349 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2347 ?AUTO_2344 ) ( IN-CITY ?AUTO_2344 ?AUTO_2343 ) ( IN-CITY ?AUTO_2342 ?AUTO_2343 ) ( not ( = ?AUTO_2342 ?AUTO_2344 ) ) ( TRUCK-AT ?AUTO_2347 ?AUTO_2349 ) ( OBJ-AT ?AUTO_2341 ?AUTO_2349 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2341 ?AUTO_2347 ?AUTO_2349 )
      ( DELIVER-PKG ?AUTO_2341 ?AUTO_2342 )
      ( DELIVER-PKG-VERIFY ?AUTO_2341 ?AUTO_2342 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2351 - OBJ
      ?AUTO_2352 - LOCATION
    )
    :vars
    (
      ?AUTO_2358 - LOCATION
      ?AUTO_2355 - CITY
      ?AUTO_2357 - TRUCK
      ?AUTO_2361 - LOCATION
      ?AUTO_2360 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2358 ?AUTO_2355 ) ( IN-CITY ?AUTO_2352 ?AUTO_2355 ) ( not ( = ?AUTO_2352 ?AUTO_2358 ) ) ( OBJ-AT ?AUTO_2351 ?AUTO_2358 ) ( TRUCK-AT ?AUTO_2357 ?AUTO_2361 ) ( IN-CITY ?AUTO_2361 ?AUTO_2360 ) ( IN-CITY ?AUTO_2358 ?AUTO_2360 ) ( not ( = ?AUTO_2358 ?AUTO_2361 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2357 ?AUTO_2361 ?AUTO_2358 ?AUTO_2360 )
      ( DELIVER-PKG ?AUTO_2351 ?AUTO_2352 )
      ( DELIVER-PKG-VERIFY ?AUTO_2351 ?AUTO_2352 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2367 - OBJ
      ?AUTO_2368 - LOCATION
    )
    :vars
    (
      ?AUTO_2369 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2369 ?AUTO_2368 ) ( IN-TRUCK ?AUTO_2367 ?AUTO_2369 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2367 ?AUTO_2369 ?AUTO_2368 )
      ( DELIVER-PKG-VERIFY ?AUTO_2367 ?AUTO_2368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2376 - OBJ
      ?AUTO_2377 - LOCATION
    )
    :vars
    (
      ?AUTO_2379 - TRUCK
      ?AUTO_2380 - LOCATION
      ?AUTO_2378 - CITY
      ?AUTO_2384 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2379 ?AUTO_2380 ) ( IN-CITY ?AUTO_2380 ?AUTO_2378 ) ( IN-CITY ?AUTO_2377 ?AUTO_2378 ) ( not ( = ?AUTO_2377 ?AUTO_2380 ) ) ( TRUCK-AT ?AUTO_2379 ?AUTO_2384 ) ( OBJ-AT ?AUTO_2376 ?AUTO_2384 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2376 ?AUTO_2379 ?AUTO_2384 )
      ( DELIVER-PKG ?AUTO_2376 ?AUTO_2377 )
      ( DELIVER-PKG-VERIFY ?AUTO_2376 ?AUTO_2377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2386 - OBJ
      ?AUTO_2387 - LOCATION
    )
    :vars
    (
      ?AUTO_2393 - LOCATION
      ?AUTO_2391 - CITY
      ?AUTO_2390 - TRUCK
      ?AUTO_2396 - LOCATION
      ?AUTO_2395 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2393 ?AUTO_2391 ) ( IN-CITY ?AUTO_2387 ?AUTO_2391 ) ( not ( = ?AUTO_2387 ?AUTO_2393 ) ) ( OBJ-AT ?AUTO_2386 ?AUTO_2393 ) ( TRUCK-AT ?AUTO_2390 ?AUTO_2396 ) ( IN-CITY ?AUTO_2396 ?AUTO_2395 ) ( IN-CITY ?AUTO_2393 ?AUTO_2395 ) ( not ( = ?AUTO_2393 ?AUTO_2396 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2390 ?AUTO_2396 ?AUTO_2393 ?AUTO_2395 )
      ( DELIVER-PKG ?AUTO_2386 ?AUTO_2387 )
      ( DELIVER-PKG-VERIFY ?AUTO_2386 ?AUTO_2387 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2406 - OBJ
      ?AUTO_2407 - LOCATION
    )
    :vars
    (
      ?AUTO_2408 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2406 ?AUTO_2408 ) ( AIRPLANE-AT ?AUTO_2408 ?AUTO_2407 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2406 ?AUTO_2408 ?AUTO_2407 )
      ( DELIVER-PKG-VERIFY ?AUTO_2406 ?AUTO_2407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2411 - OBJ
      ?AUTO_2412 - LOCATION
    )
    :vars
    (
      ?AUTO_2415 - AIRPLANE
      ?AUTO_2417 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2411 ?AUTO_2415 ) ( AIRPORT ?AUTO_2417 ) ( AIRPORT ?AUTO_2412 ) ( AIRPLANE-AT ?AUTO_2415 ?AUTO_2417 ) ( not ( = ?AUTO_2417 ?AUTO_2412 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2415 ?AUTO_2417 ?AUTO_2412 )
      ( DELIVER-PKG ?AUTO_2411 ?AUTO_2412 )
      ( DELIVER-PKG-VERIFY ?AUTO_2411 ?AUTO_2412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2421 - OBJ
      ?AUTO_2422 - LOCATION
    )
    :vars
    (
      ?AUTO_2426 - LOCATION
      ?AUTO_2423 - AIRPLANE
      ?AUTO_2428 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2426 ) ( AIRPORT ?AUTO_2422 ) ( AIRPLANE-AT ?AUTO_2423 ?AUTO_2426 ) ( not ( = ?AUTO_2426 ?AUTO_2422 ) ) ( OBJ-AT ?AUTO_2421 ?AUTO_2428 ) ( AIRPLANE-AT ?AUTO_2423 ?AUTO_2428 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2421 ?AUTO_2423 ?AUTO_2428 )
      ( DELIVER-PKG ?AUTO_2421 ?AUTO_2422 )
      ( DELIVER-PKG-VERIFY ?AUTO_2421 ?AUTO_2422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2430 - OBJ
      ?AUTO_2431 - LOCATION
    )
    :vars
    (
      ?AUTO_2436 - LOCATION
      ?AUTO_2438 - LOCATION
      ?AUTO_2434 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2436 ) ( AIRPORT ?AUTO_2431 ) ( not ( = ?AUTO_2436 ?AUTO_2431 ) ) ( OBJ-AT ?AUTO_2430 ?AUTO_2436 ) ( AIRPORT ?AUTO_2438 ) ( AIRPLANE-AT ?AUTO_2434 ?AUTO_2438 ) ( not ( = ?AUTO_2438 ?AUTO_2436 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2434 ?AUTO_2438 ?AUTO_2436 )
      ( DELIVER-PKG ?AUTO_2430 ?AUTO_2431 )
      ( DELIVER-PKG-VERIFY ?AUTO_2430 ?AUTO_2431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2442 - OBJ
      ?AUTO_2443 - LOCATION
    )
    :vars
    (
      ?AUTO_2444 - LOCATION
      ?AUTO_2448 - LOCATION
      ?AUTO_2446 - AIRPLANE
      ?AUTO_2449 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2444 ) ( AIRPORT ?AUTO_2443 ) ( not ( = ?AUTO_2444 ?AUTO_2443 ) ) ( AIRPORT ?AUTO_2448 ) ( AIRPLANE-AT ?AUTO_2446 ?AUTO_2448 ) ( not ( = ?AUTO_2448 ?AUTO_2444 ) ) ( TRUCK-AT ?AUTO_2449 ?AUTO_2444 ) ( IN-TRUCK ?AUTO_2442 ?AUTO_2449 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2442 ?AUTO_2449 ?AUTO_2444 )
      ( DELIVER-PKG ?AUTO_2442 ?AUTO_2443 )
      ( DELIVER-PKG-VERIFY ?AUTO_2442 ?AUTO_2443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2452 - OBJ
      ?AUTO_2453 - LOCATION
    )
    :vars
    (
      ?AUTO_2457 - LOCATION
      ?AUTO_2456 - LOCATION
      ?AUTO_2458 - AIRPLANE
      ?AUTO_2459 - TRUCK
      ?AUTO_2462 - LOCATION
      ?AUTO_2461 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2457 ) ( AIRPORT ?AUTO_2453 ) ( not ( = ?AUTO_2457 ?AUTO_2453 ) ) ( AIRPORT ?AUTO_2456 ) ( AIRPLANE-AT ?AUTO_2458 ?AUTO_2456 ) ( not ( = ?AUTO_2456 ?AUTO_2457 ) ) ( IN-TRUCK ?AUTO_2452 ?AUTO_2459 ) ( TRUCK-AT ?AUTO_2459 ?AUTO_2462 ) ( IN-CITY ?AUTO_2462 ?AUTO_2461 ) ( IN-CITY ?AUTO_2457 ?AUTO_2461 ) ( not ( = ?AUTO_2457 ?AUTO_2462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2459 ?AUTO_2462 ?AUTO_2457 ?AUTO_2461 )
      ( DELIVER-PKG ?AUTO_2452 ?AUTO_2453 )
      ( DELIVER-PKG-VERIFY ?AUTO_2452 ?AUTO_2453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2468 - OBJ
      ?AUTO_2469 - LOCATION
    )
    :vars
    (
      ?AUTO_2473 - LOCATION
      ?AUTO_2474 - LOCATION
      ?AUTO_2472 - AIRPLANE
      ?AUTO_2475 - TRUCK
      ?AUTO_2471 - LOCATION
      ?AUTO_2477 - CITY
      ?AUTO_2479 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2473 ) ( AIRPORT ?AUTO_2469 ) ( not ( = ?AUTO_2473 ?AUTO_2469 ) ) ( AIRPORT ?AUTO_2474 ) ( AIRPLANE-AT ?AUTO_2472 ?AUTO_2474 ) ( not ( = ?AUTO_2474 ?AUTO_2473 ) ) ( TRUCK-AT ?AUTO_2475 ?AUTO_2471 ) ( IN-CITY ?AUTO_2471 ?AUTO_2477 ) ( IN-CITY ?AUTO_2473 ?AUTO_2477 ) ( not ( = ?AUTO_2473 ?AUTO_2471 ) ) ( TRUCK-AT ?AUTO_2475 ?AUTO_2479 ) ( OBJ-AT ?AUTO_2468 ?AUTO_2479 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2468 ?AUTO_2475 ?AUTO_2479 )
      ( DELIVER-PKG ?AUTO_2468 ?AUTO_2469 )
      ( DELIVER-PKG-VERIFY ?AUTO_2468 ?AUTO_2469 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2481 - OBJ
      ?AUTO_2482 - LOCATION
    )
    :vars
    (
      ?AUTO_2490 - LOCATION
      ?AUTO_2489 - LOCATION
      ?AUTO_2488 - AIRPLANE
      ?AUTO_2491 - LOCATION
      ?AUTO_2486 - CITY
      ?AUTO_2485 - TRUCK
      ?AUTO_2494 - LOCATION
      ?AUTO_2493 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2490 ) ( AIRPORT ?AUTO_2482 ) ( not ( = ?AUTO_2490 ?AUTO_2482 ) ) ( AIRPORT ?AUTO_2489 ) ( AIRPLANE-AT ?AUTO_2488 ?AUTO_2489 ) ( not ( = ?AUTO_2489 ?AUTO_2490 ) ) ( IN-CITY ?AUTO_2491 ?AUTO_2486 ) ( IN-CITY ?AUTO_2490 ?AUTO_2486 ) ( not ( = ?AUTO_2490 ?AUTO_2491 ) ) ( OBJ-AT ?AUTO_2481 ?AUTO_2491 ) ( TRUCK-AT ?AUTO_2485 ?AUTO_2494 ) ( IN-CITY ?AUTO_2494 ?AUTO_2493 ) ( IN-CITY ?AUTO_2491 ?AUTO_2493 ) ( not ( = ?AUTO_2491 ?AUTO_2494 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2485 ?AUTO_2494 ?AUTO_2491 ?AUTO_2493 )
      ( DELIVER-PKG ?AUTO_2481 ?AUTO_2482 )
      ( DELIVER-PKG-VERIFY ?AUTO_2481 ?AUTO_2482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2500 - OBJ
      ?AUTO_2501 - LOCATION
    )
    :vars
    (
      ?AUTO_2502 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2500 ?AUTO_2502 ) ( AIRPLANE-AT ?AUTO_2502 ?AUTO_2501 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2500 ?AUTO_2502 ?AUTO_2501 )
      ( DELIVER-PKG-VERIFY ?AUTO_2500 ?AUTO_2501 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2509 - OBJ
      ?AUTO_2510 - LOCATION
    )
    :vars
    (
      ?AUTO_2513 - AIRPLANE
      ?AUTO_2515 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2509 ?AUTO_2513 ) ( AIRPORT ?AUTO_2515 ) ( AIRPORT ?AUTO_2510 ) ( AIRPLANE-AT ?AUTO_2513 ?AUTO_2515 ) ( not ( = ?AUTO_2515 ?AUTO_2510 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2513 ?AUTO_2515 ?AUTO_2510 )
      ( DELIVER-PKG ?AUTO_2509 ?AUTO_2510 )
      ( DELIVER-PKG-VERIFY ?AUTO_2509 ?AUTO_2510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2521 - OBJ
      ?AUTO_2522 - LOCATION
    )
    :vars
    (
      ?AUTO_2526 - LOCATION
      ?AUTO_2524 - AIRPLANE
      ?AUTO_2528 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2526 ) ( AIRPORT ?AUTO_2522 ) ( AIRPLANE-AT ?AUTO_2524 ?AUTO_2526 ) ( not ( = ?AUTO_2526 ?AUTO_2522 ) ) ( OBJ-AT ?AUTO_2521 ?AUTO_2528 ) ( AIRPLANE-AT ?AUTO_2524 ?AUTO_2528 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2521 ?AUTO_2524 ?AUTO_2528 )
      ( DELIVER-PKG ?AUTO_2521 ?AUTO_2522 )
      ( DELIVER-PKG-VERIFY ?AUTO_2521 ?AUTO_2522 ) )
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
      ?AUTO_2536 - LOCATION
      ?AUTO_2540 - AIRPLANE
      ?AUTO_2541 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2537 ) ( AIRPORT ?AUTO_2535 ) ( not ( = ?AUTO_2537 ?AUTO_2535 ) ) ( AIRPORT ?AUTO_2536 ) ( AIRPLANE-AT ?AUTO_2540 ?AUTO_2536 ) ( not ( = ?AUTO_2536 ?AUTO_2537 ) ) ( TRUCK-AT ?AUTO_2541 ?AUTO_2537 ) ( IN-TRUCK ?AUTO_2534 ?AUTO_2541 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2534 ?AUTO_2541 ?AUTO_2537 )
      ( DELIVER-PKG ?AUTO_2534 ?AUTO_2535 )
      ( DELIVER-PKG-VERIFY ?AUTO_2534 ?AUTO_2535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2548 - OBJ
      ?AUTO_2549 - LOCATION
    )
    :vars
    (
      ?AUTO_2554 - LOCATION
      ?AUTO_2553 - LOCATION
      ?AUTO_2551 - AIRPLANE
      ?AUTO_2552 - TRUCK
      ?AUTO_2557 - LOCATION
      ?AUTO_2556 - CITY
      ?AUTO_2559 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2554 ) ( AIRPORT ?AUTO_2549 ) ( not ( = ?AUTO_2554 ?AUTO_2549 ) ) ( AIRPORT ?AUTO_2553 ) ( AIRPLANE-AT ?AUTO_2551 ?AUTO_2553 ) ( not ( = ?AUTO_2553 ?AUTO_2554 ) ) ( TRUCK-AT ?AUTO_2552 ?AUTO_2557 ) ( IN-CITY ?AUTO_2557 ?AUTO_2556 ) ( IN-CITY ?AUTO_2554 ?AUTO_2556 ) ( not ( = ?AUTO_2554 ?AUTO_2557 ) ) ( TRUCK-AT ?AUTO_2552 ?AUTO_2559 ) ( OBJ-AT ?AUTO_2548 ?AUTO_2559 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2548 ?AUTO_2552 ?AUTO_2559 )
      ( DELIVER-PKG ?AUTO_2548 ?AUTO_2549 )
      ( DELIVER-PKG-VERIFY ?AUTO_2548 ?AUTO_2549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2561 - OBJ
      ?AUTO_2562 - LOCATION
    )
    :vars
    (
      ?AUTO_2570 - LOCATION
      ?AUTO_2568 - LOCATION
      ?AUTO_2567 - AIRPLANE
      ?AUTO_2571 - LOCATION
      ?AUTO_2566 - CITY
      ?AUTO_2569 - TRUCK
      ?AUTO_2574 - LOCATION
      ?AUTO_2573 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2570 ) ( AIRPORT ?AUTO_2562 ) ( not ( = ?AUTO_2570 ?AUTO_2562 ) ) ( AIRPORT ?AUTO_2568 ) ( AIRPLANE-AT ?AUTO_2567 ?AUTO_2568 ) ( not ( = ?AUTO_2568 ?AUTO_2570 ) ) ( IN-CITY ?AUTO_2571 ?AUTO_2566 ) ( IN-CITY ?AUTO_2570 ?AUTO_2566 ) ( not ( = ?AUTO_2570 ?AUTO_2571 ) ) ( OBJ-AT ?AUTO_2561 ?AUTO_2571 ) ( TRUCK-AT ?AUTO_2569 ?AUTO_2574 ) ( IN-CITY ?AUTO_2574 ?AUTO_2573 ) ( IN-CITY ?AUTO_2571 ?AUTO_2573 ) ( not ( = ?AUTO_2571 ?AUTO_2574 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2569 ?AUTO_2574 ?AUTO_2571 ?AUTO_2573 )
      ( DELIVER-PKG ?AUTO_2561 ?AUTO_2562 )
      ( DELIVER-PKG-VERIFY ?AUTO_2561 ?AUTO_2562 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2584 - OBJ
      ?AUTO_2585 - LOCATION
    )
    :vars
    (
      ?AUTO_2586 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2586 ?AUTO_2585 ) ( IN-TRUCK ?AUTO_2584 ?AUTO_2586 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2584 ?AUTO_2586 ?AUTO_2585 )
      ( DELIVER-PKG-VERIFY ?AUTO_2584 ?AUTO_2585 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2591 - OBJ
      ?AUTO_2592 - LOCATION
    )
    :vars
    (
      ?AUTO_2595 - TRUCK
      ?AUTO_2598 - LOCATION
      ?AUTO_2597 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2591 ?AUTO_2595 ) ( TRUCK-AT ?AUTO_2595 ?AUTO_2598 ) ( IN-CITY ?AUTO_2598 ?AUTO_2597 ) ( IN-CITY ?AUTO_2592 ?AUTO_2597 ) ( not ( = ?AUTO_2592 ?AUTO_2598 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2595 ?AUTO_2598 ?AUTO_2592 ?AUTO_2597 )
      ( DELIVER-PKG ?AUTO_2591 ?AUTO_2592 )
      ( DELIVER-PKG-VERIFY ?AUTO_2591 ?AUTO_2592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2600 - OBJ
      ?AUTO_2601 - LOCATION
    )
    :vars
    (
      ?AUTO_2604 - TRUCK
      ?AUTO_2606 - LOCATION
      ?AUTO_2605 - CITY
      ?AUTO_2608 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2604 ?AUTO_2606 ) ( IN-CITY ?AUTO_2606 ?AUTO_2605 ) ( IN-CITY ?AUTO_2601 ?AUTO_2605 ) ( not ( = ?AUTO_2601 ?AUTO_2606 ) ) ( TRUCK-AT ?AUTO_2604 ?AUTO_2608 ) ( OBJ-AT ?AUTO_2600 ?AUTO_2608 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2600 ?AUTO_2604 ?AUTO_2608 )
      ( DELIVER-PKG ?AUTO_2600 ?AUTO_2601 )
      ( DELIVER-PKG-VERIFY ?AUTO_2600 ?AUTO_2601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2612 - OBJ
      ?AUTO_2613 - LOCATION
    )
    :vars
    (
      ?AUTO_2616 - TRUCK
      ?AUTO_2618 - LOCATION
      ?AUTO_2617 - CITY
      ?AUTO_2619 - LOCATION
      ?AUTO_2620 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2616 ?AUTO_2618 ) ( IN-CITY ?AUTO_2618 ?AUTO_2617 ) ( IN-CITY ?AUTO_2613 ?AUTO_2617 ) ( not ( = ?AUTO_2613 ?AUTO_2618 ) ) ( TRUCK-AT ?AUTO_2616 ?AUTO_2619 ) ( IN-AIRPLANE ?AUTO_2612 ?AUTO_2620 ) ( AIRPLANE-AT ?AUTO_2620 ?AUTO_2619 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2612 ?AUTO_2620 ?AUTO_2619 )
      ( DELIVER-PKG ?AUTO_2612 ?AUTO_2613 )
      ( DELIVER-PKG-VERIFY ?AUTO_2612 ?AUTO_2613 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2623 - OBJ
      ?AUTO_2624 - LOCATION
    )
    :vars
    (
      ?AUTO_2630 - TRUCK
      ?AUTO_2628 - LOCATION
      ?AUTO_2629 - CITY
      ?AUTO_2627 - LOCATION
      ?AUTO_2631 - AIRPLANE
      ?AUTO_2633 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2630 ?AUTO_2628 ) ( IN-CITY ?AUTO_2628 ?AUTO_2629 ) ( IN-CITY ?AUTO_2624 ?AUTO_2629 ) ( not ( = ?AUTO_2624 ?AUTO_2628 ) ) ( TRUCK-AT ?AUTO_2630 ?AUTO_2627 ) ( IN-AIRPLANE ?AUTO_2623 ?AUTO_2631 ) ( AIRPORT ?AUTO_2633 ) ( AIRPORT ?AUTO_2627 ) ( AIRPLANE-AT ?AUTO_2631 ?AUTO_2633 ) ( not ( = ?AUTO_2633 ?AUTO_2627 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2631 ?AUTO_2633 ?AUTO_2627 )
      ( DELIVER-PKG ?AUTO_2623 ?AUTO_2624 )
      ( DELIVER-PKG-VERIFY ?AUTO_2623 ?AUTO_2624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2637 - OBJ
      ?AUTO_2638 - LOCATION
    )
    :vars
    (
      ?AUTO_2642 - TRUCK
      ?AUTO_2640 - LOCATION
      ?AUTO_2644 - CITY
      ?AUTO_2643 - LOCATION
      ?AUTO_2641 - LOCATION
      ?AUTO_2645 - AIRPLANE
      ?AUTO_2648 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2642 ?AUTO_2640 ) ( IN-CITY ?AUTO_2640 ?AUTO_2644 ) ( IN-CITY ?AUTO_2638 ?AUTO_2644 ) ( not ( = ?AUTO_2638 ?AUTO_2640 ) ) ( TRUCK-AT ?AUTO_2642 ?AUTO_2643 ) ( AIRPORT ?AUTO_2641 ) ( AIRPORT ?AUTO_2643 ) ( AIRPLANE-AT ?AUTO_2645 ?AUTO_2641 ) ( not ( = ?AUTO_2641 ?AUTO_2643 ) ) ( OBJ-AT ?AUTO_2637 ?AUTO_2648 ) ( AIRPLANE-AT ?AUTO_2645 ?AUTO_2648 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2637 ?AUTO_2645 ?AUTO_2648 )
      ( DELIVER-PKG ?AUTO_2637 ?AUTO_2638 )
      ( DELIVER-PKG-VERIFY ?AUTO_2637 ?AUTO_2638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2650 - OBJ
      ?AUTO_2651 - LOCATION
    )
    :vars
    (
      ?AUTO_2658 - TRUCK
      ?AUTO_2655 - LOCATION
      ?AUTO_2657 - CITY
      ?AUTO_2654 - LOCATION
      ?AUTO_2660 - LOCATION
      ?AUTO_2662 - LOCATION
      ?AUTO_2656 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2658 ?AUTO_2655 ) ( IN-CITY ?AUTO_2655 ?AUTO_2657 ) ( IN-CITY ?AUTO_2651 ?AUTO_2657 ) ( not ( = ?AUTO_2651 ?AUTO_2655 ) ) ( TRUCK-AT ?AUTO_2658 ?AUTO_2654 ) ( AIRPORT ?AUTO_2660 ) ( AIRPORT ?AUTO_2654 ) ( not ( = ?AUTO_2660 ?AUTO_2654 ) ) ( OBJ-AT ?AUTO_2650 ?AUTO_2660 ) ( AIRPORT ?AUTO_2662 ) ( AIRPLANE-AT ?AUTO_2656 ?AUTO_2662 ) ( not ( = ?AUTO_2662 ?AUTO_2660 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2656 ?AUTO_2662 ?AUTO_2660 )
      ( DELIVER-PKG ?AUTO_2650 ?AUTO_2651 )
      ( DELIVER-PKG-VERIFY ?AUTO_2650 ?AUTO_2651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2666 - OBJ
      ?AUTO_2667 - LOCATION
    )
    :vars
    (
      ?AUTO_2669 - TRUCK
      ?AUTO_2673 - LOCATION
      ?AUTO_2675 - CITY
      ?AUTO_2672 - LOCATION
      ?AUTO_2674 - LOCATION
      ?AUTO_2668 - LOCATION
      ?AUTO_2676 - AIRPLANE
      ?AUTO_2677 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2669 ?AUTO_2673 ) ( IN-CITY ?AUTO_2673 ?AUTO_2675 ) ( IN-CITY ?AUTO_2667 ?AUTO_2675 ) ( not ( = ?AUTO_2667 ?AUTO_2673 ) ) ( TRUCK-AT ?AUTO_2669 ?AUTO_2672 ) ( AIRPORT ?AUTO_2674 ) ( AIRPORT ?AUTO_2672 ) ( not ( = ?AUTO_2674 ?AUTO_2672 ) ) ( AIRPORT ?AUTO_2668 ) ( AIRPLANE-AT ?AUTO_2676 ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2674 ) ) ( TRUCK-AT ?AUTO_2677 ?AUTO_2674 ) ( IN-TRUCK ?AUTO_2666 ?AUTO_2677 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2666 ?AUTO_2677 ?AUTO_2674 )
      ( DELIVER-PKG ?AUTO_2666 ?AUTO_2667 )
      ( DELIVER-PKG-VERIFY ?AUTO_2666 ?AUTO_2667 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2680 - OBJ
      ?AUTO_2681 - LOCATION
    )
    :vars
    (
      ?AUTO_2685 - TRUCK
      ?AUTO_2688 - LOCATION
      ?AUTO_2689 - CITY
      ?AUTO_2686 - LOCATION
      ?AUTO_2684 - LOCATION
      ?AUTO_2687 - LOCATION
      ?AUTO_2690 - AIRPLANE
      ?AUTO_2691 - TRUCK
      ?AUTO_2694 - LOCATION
      ?AUTO_2693 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2685 ?AUTO_2688 ) ( IN-CITY ?AUTO_2688 ?AUTO_2689 ) ( IN-CITY ?AUTO_2681 ?AUTO_2689 ) ( not ( = ?AUTO_2681 ?AUTO_2688 ) ) ( TRUCK-AT ?AUTO_2685 ?AUTO_2686 ) ( AIRPORT ?AUTO_2684 ) ( AIRPORT ?AUTO_2686 ) ( not ( = ?AUTO_2684 ?AUTO_2686 ) ) ( AIRPORT ?AUTO_2687 ) ( AIRPLANE-AT ?AUTO_2690 ?AUTO_2687 ) ( not ( = ?AUTO_2687 ?AUTO_2684 ) ) ( IN-TRUCK ?AUTO_2680 ?AUTO_2691 ) ( TRUCK-AT ?AUTO_2691 ?AUTO_2694 ) ( IN-CITY ?AUTO_2694 ?AUTO_2693 ) ( IN-CITY ?AUTO_2684 ?AUTO_2693 ) ( not ( = ?AUTO_2684 ?AUTO_2694 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2691 ?AUTO_2694 ?AUTO_2684 ?AUTO_2693 )
      ( DELIVER-PKG ?AUTO_2680 ?AUTO_2681 )
      ( DELIVER-PKG-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2700 - OBJ
      ?AUTO_2701 - LOCATION
    )
    :vars
    (
      ?AUTO_2705 - TRUCK
      ?AUTO_2703 - LOCATION
      ?AUTO_2711 - CITY
      ?AUTO_2709 - LOCATION
      ?AUTO_2712 - LOCATION
      ?AUTO_2713 - LOCATION
      ?AUTO_2702 - AIRPLANE
      ?AUTO_2704 - TRUCK
      ?AUTO_2708 - LOCATION
      ?AUTO_2706 - CITY
      ?AUTO_2715 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2705 ?AUTO_2703 ) ( IN-CITY ?AUTO_2703 ?AUTO_2711 ) ( IN-CITY ?AUTO_2701 ?AUTO_2711 ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( TRUCK-AT ?AUTO_2705 ?AUTO_2709 ) ( AIRPORT ?AUTO_2712 ) ( AIRPORT ?AUTO_2709 ) ( not ( = ?AUTO_2712 ?AUTO_2709 ) ) ( AIRPORT ?AUTO_2713 ) ( AIRPLANE-AT ?AUTO_2702 ?AUTO_2713 ) ( not ( = ?AUTO_2713 ?AUTO_2712 ) ) ( TRUCK-AT ?AUTO_2704 ?AUTO_2708 ) ( IN-CITY ?AUTO_2708 ?AUTO_2706 ) ( IN-CITY ?AUTO_2712 ?AUTO_2706 ) ( not ( = ?AUTO_2712 ?AUTO_2708 ) ) ( TRUCK-AT ?AUTO_2704 ?AUTO_2715 ) ( OBJ-AT ?AUTO_2700 ?AUTO_2715 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2700 ?AUTO_2704 ?AUTO_2715 )
      ( DELIVER-PKG ?AUTO_2700 ?AUTO_2701 )
      ( DELIVER-PKG-VERIFY ?AUTO_2700 ?AUTO_2701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2717 - OBJ
      ?AUTO_2718 - LOCATION
    )
    :vars
    (
      ?AUTO_2722 - TRUCK
      ?AUTO_2726 - LOCATION
      ?AUTO_2725 - CITY
      ?AUTO_2721 - LOCATION
      ?AUTO_2724 - LOCATION
      ?AUTO_2720 - LOCATION
      ?AUTO_2730 - AIRPLANE
      ?AUTO_2723 - LOCATION
      ?AUTO_2727 - CITY
      ?AUTO_2729 - TRUCK
      ?AUTO_2734 - LOCATION
      ?AUTO_2733 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2722 ?AUTO_2726 ) ( IN-CITY ?AUTO_2726 ?AUTO_2725 ) ( IN-CITY ?AUTO_2718 ?AUTO_2725 ) ( not ( = ?AUTO_2718 ?AUTO_2726 ) ) ( TRUCK-AT ?AUTO_2722 ?AUTO_2721 ) ( AIRPORT ?AUTO_2724 ) ( AIRPORT ?AUTO_2721 ) ( not ( = ?AUTO_2724 ?AUTO_2721 ) ) ( AIRPORT ?AUTO_2720 ) ( AIRPLANE-AT ?AUTO_2730 ?AUTO_2720 ) ( not ( = ?AUTO_2720 ?AUTO_2724 ) ) ( IN-CITY ?AUTO_2723 ?AUTO_2727 ) ( IN-CITY ?AUTO_2724 ?AUTO_2727 ) ( not ( = ?AUTO_2724 ?AUTO_2723 ) ) ( OBJ-AT ?AUTO_2717 ?AUTO_2723 ) ( TRUCK-AT ?AUTO_2729 ?AUTO_2734 ) ( IN-CITY ?AUTO_2734 ?AUTO_2733 ) ( IN-CITY ?AUTO_2723 ?AUTO_2733 ) ( not ( = ?AUTO_2723 ?AUTO_2734 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2729 ?AUTO_2734 ?AUTO_2723 ?AUTO_2733 )
      ( DELIVER-PKG ?AUTO_2717 ?AUTO_2718 )
      ( DELIVER-PKG-VERIFY ?AUTO_2717 ?AUTO_2718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2736 - OBJ
      ?AUTO_2737 - LOCATION
    )
    :vars
    (
      ?AUTO_2750 - LOCATION
      ?AUTO_2744 - CITY
      ?AUTO_2747 - LOCATION
      ?AUTO_2741 - LOCATION
      ?AUTO_2743 - AIRPLANE
      ?AUTO_2738 - LOCATION
      ?AUTO_2746 - CITY
      ?AUTO_2748 - TRUCK
      ?AUTO_2742 - LOCATION
      ?AUTO_2751 - CITY
      ?AUTO_2745 - TRUCK
      ?AUTO_2754 - LOCATION
      ?AUTO_2753 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2750 ?AUTO_2744 ) ( IN-CITY ?AUTO_2737 ?AUTO_2744 ) ( not ( = ?AUTO_2737 ?AUTO_2750 ) ) ( AIRPORT ?AUTO_2747 ) ( AIRPORT ?AUTO_2750 ) ( not ( = ?AUTO_2747 ?AUTO_2750 ) ) ( AIRPORT ?AUTO_2741 ) ( AIRPLANE-AT ?AUTO_2743 ?AUTO_2741 ) ( not ( = ?AUTO_2741 ?AUTO_2747 ) ) ( IN-CITY ?AUTO_2738 ?AUTO_2746 ) ( IN-CITY ?AUTO_2747 ?AUTO_2746 ) ( not ( = ?AUTO_2747 ?AUTO_2738 ) ) ( OBJ-AT ?AUTO_2736 ?AUTO_2738 ) ( TRUCK-AT ?AUTO_2748 ?AUTO_2742 ) ( IN-CITY ?AUTO_2742 ?AUTO_2751 ) ( IN-CITY ?AUTO_2738 ?AUTO_2751 ) ( not ( = ?AUTO_2738 ?AUTO_2742 ) ) ( TRUCK-AT ?AUTO_2745 ?AUTO_2754 ) ( IN-CITY ?AUTO_2754 ?AUTO_2753 ) ( IN-CITY ?AUTO_2750 ?AUTO_2753 ) ( not ( = ?AUTO_2750 ?AUTO_2754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2745 ?AUTO_2754 ?AUTO_2750 ?AUTO_2753 )
      ( DELIVER-PKG ?AUTO_2736 ?AUTO_2737 )
      ( DELIVER-PKG-VERIFY ?AUTO_2736 ?AUTO_2737 ) )
  )

)

