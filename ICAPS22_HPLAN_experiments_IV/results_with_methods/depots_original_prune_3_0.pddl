( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_116 - SURFACE
      ?auto_115 - SURFACE
    )
    :vars
    (
      ?auto_117 - HOIST
      ?auto_118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117 ?auto_118 ) ( SURFACE-AT ?auto_115 ?auto_118 ) ( CLEAR ?auto_115 ) ( LIFTING ?auto_117 ?auto_116 ) ( IS-CRATE ?auto_116 ) ( not ( = ?auto_116 ?auto_115 ) ) )
    :subtasks
    ( ( !DROP ?auto_117 ?auto_116 ?auto_115 ?auto_118 )
      ( MAKE-ON-VERIFY ?auto_116 ?auto_115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_120 - SURFACE
      ?auto_119 - SURFACE
    )
    :vars
    (
      ?auto_122 - HOIST
      ?auto_121 - PLACE
      ?auto_123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_122 ?auto_121 ) ( SURFACE-AT ?auto_119 ?auto_121 ) ( CLEAR ?auto_119 ) ( IS-CRATE ?auto_120 ) ( not ( = ?auto_120 ?auto_119 ) ) ( TRUCK-AT ?auto_123 ?auto_121 ) ( AVAILABLE ?auto_122 ) ( IN ?auto_120 ?auto_123 ) )
    :subtasks
    ( ( !UNLOAD ?auto_122 ?auto_120 ?auto_123 ?auto_121 )
      ( MAKE-ON ?auto_120 ?auto_119 )
      ( MAKE-ON-VERIFY ?auto_120 ?auto_119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_125 - SURFACE
      ?auto_124 - SURFACE
    )
    :vars
    (
      ?auto_127 - HOIST
      ?auto_128 - PLACE
      ?auto_126 - TRUCK
      ?auto_129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127 ?auto_128 ) ( SURFACE-AT ?auto_124 ?auto_128 ) ( CLEAR ?auto_124 ) ( IS-CRATE ?auto_125 ) ( not ( = ?auto_125 ?auto_124 ) ) ( AVAILABLE ?auto_127 ) ( IN ?auto_125 ?auto_126 ) ( TRUCK-AT ?auto_126 ?auto_129 ) ( not ( = ?auto_129 ?auto_128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_126 ?auto_129 ?auto_128 )
      ( MAKE-ON ?auto_125 ?auto_124 )
      ( MAKE-ON-VERIFY ?auto_125 ?auto_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_131 - SURFACE
      ?auto_130 - SURFACE
    )
    :vars
    (
      ?auto_132 - HOIST
      ?auto_135 - PLACE
      ?auto_134 - TRUCK
      ?auto_133 - PLACE
      ?auto_136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_132 ?auto_135 ) ( SURFACE-AT ?auto_130 ?auto_135 ) ( CLEAR ?auto_130 ) ( IS-CRATE ?auto_131 ) ( not ( = ?auto_131 ?auto_130 ) ) ( AVAILABLE ?auto_132 ) ( TRUCK-AT ?auto_134 ?auto_133 ) ( not ( = ?auto_133 ?auto_135 ) ) ( HOIST-AT ?auto_136 ?auto_133 ) ( LIFTING ?auto_136 ?auto_131 ) ( not ( = ?auto_132 ?auto_136 ) ) )
    :subtasks
    ( ( !LOAD ?auto_136 ?auto_131 ?auto_134 ?auto_133 )
      ( MAKE-ON ?auto_131 ?auto_130 )
      ( MAKE-ON-VERIFY ?auto_131 ?auto_130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_138 - SURFACE
      ?auto_137 - SURFACE
    )
    :vars
    (
      ?auto_143 - HOIST
      ?auto_139 - PLACE
      ?auto_140 - TRUCK
      ?auto_141 - PLACE
      ?auto_142 - HOIST
      ?auto_144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_143 ?auto_139 ) ( SURFACE-AT ?auto_137 ?auto_139 ) ( CLEAR ?auto_137 ) ( IS-CRATE ?auto_138 ) ( not ( = ?auto_138 ?auto_137 ) ) ( AVAILABLE ?auto_143 ) ( TRUCK-AT ?auto_140 ?auto_141 ) ( not ( = ?auto_141 ?auto_139 ) ) ( HOIST-AT ?auto_142 ?auto_141 ) ( not ( = ?auto_143 ?auto_142 ) ) ( AVAILABLE ?auto_142 ) ( SURFACE-AT ?auto_138 ?auto_141 ) ( ON ?auto_138 ?auto_144 ) ( CLEAR ?auto_138 ) ( not ( = ?auto_138 ?auto_144 ) ) ( not ( = ?auto_137 ?auto_144 ) ) )
    :subtasks
    ( ( !LIFT ?auto_142 ?auto_138 ?auto_144 ?auto_141 )
      ( MAKE-ON ?auto_138 ?auto_137 )
      ( MAKE-ON-VERIFY ?auto_138 ?auto_137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_146 - SURFACE
      ?auto_145 - SURFACE
    )
    :vars
    (
      ?auto_148 - HOIST
      ?auto_150 - PLACE
      ?auto_152 - PLACE
      ?auto_147 - HOIST
      ?auto_149 - SURFACE
      ?auto_151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148 ?auto_150 ) ( SURFACE-AT ?auto_145 ?auto_150 ) ( CLEAR ?auto_145 ) ( IS-CRATE ?auto_146 ) ( not ( = ?auto_146 ?auto_145 ) ) ( AVAILABLE ?auto_148 ) ( not ( = ?auto_152 ?auto_150 ) ) ( HOIST-AT ?auto_147 ?auto_152 ) ( not ( = ?auto_148 ?auto_147 ) ) ( AVAILABLE ?auto_147 ) ( SURFACE-AT ?auto_146 ?auto_152 ) ( ON ?auto_146 ?auto_149 ) ( CLEAR ?auto_146 ) ( not ( = ?auto_146 ?auto_149 ) ) ( not ( = ?auto_145 ?auto_149 ) ) ( TRUCK-AT ?auto_151 ?auto_150 ) )
    :subtasks
    ( ( !DRIVE ?auto_151 ?auto_150 ?auto_152 )
      ( MAKE-ON ?auto_146 ?auto_145 )
      ( MAKE-ON-VERIFY ?auto_146 ?auto_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_194 - SURFACE
      ?auto_193 - SURFACE
    )
    :vars
    (
      ?auto_195 - HOIST
      ?auto_197 - PLACE
      ?auto_199 - PLACE
      ?auto_198 - HOIST
      ?auto_196 - SURFACE
      ?auto_200 - TRUCK
      ?auto_201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195 ?auto_197 ) ( IS-CRATE ?auto_194 ) ( not ( = ?auto_194 ?auto_193 ) ) ( not ( = ?auto_199 ?auto_197 ) ) ( HOIST-AT ?auto_198 ?auto_199 ) ( not ( = ?auto_195 ?auto_198 ) ) ( AVAILABLE ?auto_198 ) ( SURFACE-AT ?auto_194 ?auto_199 ) ( ON ?auto_194 ?auto_196 ) ( CLEAR ?auto_194 ) ( not ( = ?auto_194 ?auto_196 ) ) ( not ( = ?auto_193 ?auto_196 ) ) ( TRUCK-AT ?auto_200 ?auto_197 ) ( SURFACE-AT ?auto_201 ?auto_197 ) ( CLEAR ?auto_201 ) ( LIFTING ?auto_195 ?auto_193 ) ( IS-CRATE ?auto_193 ) ( not ( = ?auto_194 ?auto_201 ) ) ( not ( = ?auto_193 ?auto_201 ) ) ( not ( = ?auto_196 ?auto_201 ) ) )
    :subtasks
    ( ( !DROP ?auto_195 ?auto_193 ?auto_201 ?auto_197 )
      ( MAKE-ON ?auto_194 ?auto_193 )
      ( MAKE-ON-VERIFY ?auto_194 ?auto_193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_203 - SURFACE
      ?auto_202 - SURFACE
    )
    :vars
    (
      ?auto_208 - HOIST
      ?auto_207 - PLACE
      ?auto_205 - PLACE
      ?auto_210 - HOIST
      ?auto_209 - SURFACE
      ?auto_206 - TRUCK
      ?auto_204 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208 ?auto_207 ) ( IS-CRATE ?auto_203 ) ( not ( = ?auto_203 ?auto_202 ) ) ( not ( = ?auto_205 ?auto_207 ) ) ( HOIST-AT ?auto_210 ?auto_205 ) ( not ( = ?auto_208 ?auto_210 ) ) ( AVAILABLE ?auto_210 ) ( SURFACE-AT ?auto_203 ?auto_205 ) ( ON ?auto_203 ?auto_209 ) ( CLEAR ?auto_203 ) ( not ( = ?auto_203 ?auto_209 ) ) ( not ( = ?auto_202 ?auto_209 ) ) ( TRUCK-AT ?auto_206 ?auto_207 ) ( SURFACE-AT ?auto_204 ?auto_207 ) ( CLEAR ?auto_204 ) ( IS-CRATE ?auto_202 ) ( not ( = ?auto_203 ?auto_204 ) ) ( not ( = ?auto_202 ?auto_204 ) ) ( not ( = ?auto_209 ?auto_204 ) ) ( AVAILABLE ?auto_208 ) ( IN ?auto_202 ?auto_206 ) )
    :subtasks
    ( ( !UNLOAD ?auto_208 ?auto_202 ?auto_206 ?auto_207 )
      ( MAKE-ON ?auto_203 ?auto_202 )
      ( MAKE-ON-VERIFY ?auto_203 ?auto_202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_218 - SURFACE
      ?auto_217 - SURFACE
    )
    :vars
    (
      ?auto_221 - HOIST
      ?auto_223 - PLACE
      ?auto_222 - PLACE
      ?auto_224 - HOIST
      ?auto_220 - SURFACE
      ?auto_219 - TRUCK
      ?auto_225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_221 ?auto_223 ) ( SURFACE-AT ?auto_217 ?auto_223 ) ( CLEAR ?auto_217 ) ( IS-CRATE ?auto_218 ) ( not ( = ?auto_218 ?auto_217 ) ) ( AVAILABLE ?auto_221 ) ( not ( = ?auto_222 ?auto_223 ) ) ( HOIST-AT ?auto_224 ?auto_222 ) ( not ( = ?auto_221 ?auto_224 ) ) ( AVAILABLE ?auto_224 ) ( SURFACE-AT ?auto_218 ?auto_222 ) ( ON ?auto_218 ?auto_220 ) ( CLEAR ?auto_218 ) ( not ( = ?auto_218 ?auto_220 ) ) ( not ( = ?auto_217 ?auto_220 ) ) ( TRUCK-AT ?auto_219 ?auto_225 ) ( not ( = ?auto_225 ?auto_223 ) ) ( not ( = ?auto_222 ?auto_225 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_219 ?auto_225 ?auto_223 )
      ( MAKE-ON ?auto_218 ?auto_217 )
      ( MAKE-ON-VERIFY ?auto_218 ?auto_217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_285 - SURFACE
      ?auto_284 - SURFACE
    )
    :vars
    (
      ?auto_287 - HOIST
      ?auto_289 - PLACE
      ?auto_291 - PLACE
      ?auto_292 - HOIST
      ?auto_290 - SURFACE
      ?auto_288 - SURFACE
      ?auto_286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_289 ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_285 ?auto_284 ) ) ( not ( = ?auto_291 ?auto_289 ) ) ( HOIST-AT ?auto_292 ?auto_291 ) ( not ( = ?auto_287 ?auto_292 ) ) ( AVAILABLE ?auto_292 ) ( SURFACE-AT ?auto_285 ?auto_291 ) ( ON ?auto_285 ?auto_290 ) ( CLEAR ?auto_285 ) ( not ( = ?auto_285 ?auto_290 ) ) ( not ( = ?auto_284 ?auto_290 ) ) ( SURFACE-AT ?auto_288 ?auto_289 ) ( CLEAR ?auto_288 ) ( IS-CRATE ?auto_284 ) ( not ( = ?auto_285 ?auto_288 ) ) ( not ( = ?auto_284 ?auto_288 ) ) ( not ( = ?auto_290 ?auto_288 ) ) ( AVAILABLE ?auto_287 ) ( IN ?auto_284 ?auto_286 ) ( TRUCK-AT ?auto_286 ?auto_291 ) )
    :subtasks
    ( ( !DRIVE ?auto_286 ?auto_291 ?auto_289 )
      ( MAKE-ON ?auto_285 ?auto_284 )
      ( MAKE-ON-VERIFY ?auto_285 ?auto_284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_294 - SURFACE
      ?auto_293 - SURFACE
    )
    :vars
    (
      ?auto_298 - HOIST
      ?auto_297 - PLACE
      ?auto_295 - PLACE
      ?auto_299 - HOIST
      ?auto_296 - SURFACE
      ?auto_301 - SURFACE
      ?auto_300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298 ?auto_297 ) ( IS-CRATE ?auto_294 ) ( not ( = ?auto_294 ?auto_293 ) ) ( not ( = ?auto_295 ?auto_297 ) ) ( HOIST-AT ?auto_299 ?auto_295 ) ( not ( = ?auto_298 ?auto_299 ) ) ( SURFACE-AT ?auto_294 ?auto_295 ) ( ON ?auto_294 ?auto_296 ) ( CLEAR ?auto_294 ) ( not ( = ?auto_294 ?auto_296 ) ) ( not ( = ?auto_293 ?auto_296 ) ) ( SURFACE-AT ?auto_301 ?auto_297 ) ( CLEAR ?auto_301 ) ( IS-CRATE ?auto_293 ) ( not ( = ?auto_294 ?auto_301 ) ) ( not ( = ?auto_293 ?auto_301 ) ) ( not ( = ?auto_296 ?auto_301 ) ) ( AVAILABLE ?auto_298 ) ( TRUCK-AT ?auto_300 ?auto_295 ) ( LIFTING ?auto_299 ?auto_293 ) )
    :subtasks
    ( ( !LOAD ?auto_299 ?auto_293 ?auto_300 ?auto_295 )
      ( MAKE-ON ?auto_294 ?auto_293 )
      ( MAKE-ON-VERIFY ?auto_294 ?auto_293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_303 - SURFACE
      ?auto_302 - SURFACE
    )
    :vars
    (
      ?auto_305 - HOIST
      ?auto_308 - PLACE
      ?auto_309 - PLACE
      ?auto_307 - HOIST
      ?auto_310 - SURFACE
      ?auto_304 - SURFACE
      ?auto_306 - TRUCK
      ?auto_311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_305 ?auto_308 ) ( IS-CRATE ?auto_303 ) ( not ( = ?auto_303 ?auto_302 ) ) ( not ( = ?auto_309 ?auto_308 ) ) ( HOIST-AT ?auto_307 ?auto_309 ) ( not ( = ?auto_305 ?auto_307 ) ) ( SURFACE-AT ?auto_303 ?auto_309 ) ( ON ?auto_303 ?auto_310 ) ( CLEAR ?auto_303 ) ( not ( = ?auto_303 ?auto_310 ) ) ( not ( = ?auto_302 ?auto_310 ) ) ( SURFACE-AT ?auto_304 ?auto_308 ) ( CLEAR ?auto_304 ) ( IS-CRATE ?auto_302 ) ( not ( = ?auto_303 ?auto_304 ) ) ( not ( = ?auto_302 ?auto_304 ) ) ( not ( = ?auto_310 ?auto_304 ) ) ( AVAILABLE ?auto_305 ) ( TRUCK-AT ?auto_306 ?auto_309 ) ( AVAILABLE ?auto_307 ) ( SURFACE-AT ?auto_302 ?auto_309 ) ( ON ?auto_302 ?auto_311 ) ( CLEAR ?auto_302 ) ( not ( = ?auto_303 ?auto_311 ) ) ( not ( = ?auto_302 ?auto_311 ) ) ( not ( = ?auto_310 ?auto_311 ) ) ( not ( = ?auto_304 ?auto_311 ) ) )
    :subtasks
    ( ( !LIFT ?auto_307 ?auto_302 ?auto_311 ?auto_309 )
      ( MAKE-ON ?auto_303 ?auto_302 )
      ( MAKE-ON-VERIFY ?auto_303 ?auto_302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_313 - SURFACE
      ?auto_312 - SURFACE
    )
    :vars
    (
      ?auto_314 - HOIST
      ?auto_319 - PLACE
      ?auto_317 - PLACE
      ?auto_316 - HOIST
      ?auto_321 - SURFACE
      ?auto_318 - SURFACE
      ?auto_315 - SURFACE
      ?auto_320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_314 ?auto_319 ) ( IS-CRATE ?auto_313 ) ( not ( = ?auto_313 ?auto_312 ) ) ( not ( = ?auto_317 ?auto_319 ) ) ( HOIST-AT ?auto_316 ?auto_317 ) ( not ( = ?auto_314 ?auto_316 ) ) ( SURFACE-AT ?auto_313 ?auto_317 ) ( ON ?auto_313 ?auto_321 ) ( CLEAR ?auto_313 ) ( not ( = ?auto_313 ?auto_321 ) ) ( not ( = ?auto_312 ?auto_321 ) ) ( SURFACE-AT ?auto_318 ?auto_319 ) ( CLEAR ?auto_318 ) ( IS-CRATE ?auto_312 ) ( not ( = ?auto_313 ?auto_318 ) ) ( not ( = ?auto_312 ?auto_318 ) ) ( not ( = ?auto_321 ?auto_318 ) ) ( AVAILABLE ?auto_314 ) ( AVAILABLE ?auto_316 ) ( SURFACE-AT ?auto_312 ?auto_317 ) ( ON ?auto_312 ?auto_315 ) ( CLEAR ?auto_312 ) ( not ( = ?auto_313 ?auto_315 ) ) ( not ( = ?auto_312 ?auto_315 ) ) ( not ( = ?auto_321 ?auto_315 ) ) ( not ( = ?auto_318 ?auto_315 ) ) ( TRUCK-AT ?auto_320 ?auto_319 ) )
    :subtasks
    ( ( !DRIVE ?auto_320 ?auto_319 ?auto_317 )
      ( MAKE-ON ?auto_313 ?auto_312 )
      ( MAKE-ON-VERIFY ?auto_313 ?auto_312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_323 - SURFACE
      ?auto_322 - SURFACE
    )
    :vars
    (
      ?auto_328 - HOIST
      ?auto_327 - PLACE
      ?auto_330 - PLACE
      ?auto_329 - HOIST
      ?auto_326 - SURFACE
      ?auto_325 - SURFACE
      ?auto_324 - SURFACE
      ?auto_331 - TRUCK
      ?auto_332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328 ?auto_327 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_323 ?auto_322 ) ) ( not ( = ?auto_330 ?auto_327 ) ) ( HOIST-AT ?auto_329 ?auto_330 ) ( not ( = ?auto_328 ?auto_329 ) ) ( SURFACE-AT ?auto_323 ?auto_330 ) ( ON ?auto_323 ?auto_326 ) ( CLEAR ?auto_323 ) ( not ( = ?auto_323 ?auto_326 ) ) ( not ( = ?auto_322 ?auto_326 ) ) ( IS-CRATE ?auto_322 ) ( not ( = ?auto_323 ?auto_325 ) ) ( not ( = ?auto_322 ?auto_325 ) ) ( not ( = ?auto_326 ?auto_325 ) ) ( AVAILABLE ?auto_329 ) ( SURFACE-AT ?auto_322 ?auto_330 ) ( ON ?auto_322 ?auto_324 ) ( CLEAR ?auto_322 ) ( not ( = ?auto_323 ?auto_324 ) ) ( not ( = ?auto_322 ?auto_324 ) ) ( not ( = ?auto_326 ?auto_324 ) ) ( not ( = ?auto_325 ?auto_324 ) ) ( TRUCK-AT ?auto_331 ?auto_327 ) ( SURFACE-AT ?auto_332 ?auto_327 ) ( CLEAR ?auto_332 ) ( LIFTING ?auto_328 ?auto_325 ) ( IS-CRATE ?auto_325 ) ( not ( = ?auto_323 ?auto_332 ) ) ( not ( = ?auto_322 ?auto_332 ) ) ( not ( = ?auto_326 ?auto_332 ) ) ( not ( = ?auto_325 ?auto_332 ) ) ( not ( = ?auto_324 ?auto_332 ) ) )
    :subtasks
    ( ( !DROP ?auto_328 ?auto_325 ?auto_332 ?auto_327 )
      ( MAKE-ON ?auto_323 ?auto_322 )
      ( MAKE-ON-VERIFY ?auto_323 ?auto_322 ) )
  )

)

