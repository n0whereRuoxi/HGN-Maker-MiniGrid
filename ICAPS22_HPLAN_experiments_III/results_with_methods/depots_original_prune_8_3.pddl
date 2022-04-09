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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139229 - SURFACE
      ?auto_139230 - SURFACE
    )
    :vars
    (
      ?auto_139231 - HOIST
      ?auto_139232 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139231 ?auto_139232 ) ( SURFACE-AT ?auto_139229 ?auto_139232 ) ( CLEAR ?auto_139229 ) ( LIFTING ?auto_139231 ?auto_139230 ) ( IS-CRATE ?auto_139230 ) ( not ( = ?auto_139229 ?auto_139230 ) ) )
    :subtasks
    ( ( !DROP ?auto_139231 ?auto_139230 ?auto_139229 ?auto_139232 )
      ( MAKE-1CRATE-VERIFY ?auto_139229 ?auto_139230 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139233 - SURFACE
      ?auto_139234 - SURFACE
    )
    :vars
    (
      ?auto_139235 - HOIST
      ?auto_139236 - PLACE
      ?auto_139237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139235 ?auto_139236 ) ( SURFACE-AT ?auto_139233 ?auto_139236 ) ( CLEAR ?auto_139233 ) ( IS-CRATE ?auto_139234 ) ( not ( = ?auto_139233 ?auto_139234 ) ) ( TRUCK-AT ?auto_139237 ?auto_139236 ) ( AVAILABLE ?auto_139235 ) ( IN ?auto_139234 ?auto_139237 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139235 ?auto_139234 ?auto_139237 ?auto_139236 )
      ( MAKE-1CRATE ?auto_139233 ?auto_139234 )
      ( MAKE-1CRATE-VERIFY ?auto_139233 ?auto_139234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139238 - SURFACE
      ?auto_139239 - SURFACE
    )
    :vars
    (
      ?auto_139240 - HOIST
      ?auto_139241 - PLACE
      ?auto_139242 - TRUCK
      ?auto_139243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139240 ?auto_139241 ) ( SURFACE-AT ?auto_139238 ?auto_139241 ) ( CLEAR ?auto_139238 ) ( IS-CRATE ?auto_139239 ) ( not ( = ?auto_139238 ?auto_139239 ) ) ( AVAILABLE ?auto_139240 ) ( IN ?auto_139239 ?auto_139242 ) ( TRUCK-AT ?auto_139242 ?auto_139243 ) ( not ( = ?auto_139243 ?auto_139241 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139242 ?auto_139243 ?auto_139241 )
      ( MAKE-1CRATE ?auto_139238 ?auto_139239 )
      ( MAKE-1CRATE-VERIFY ?auto_139238 ?auto_139239 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139244 - SURFACE
      ?auto_139245 - SURFACE
    )
    :vars
    (
      ?auto_139248 - HOIST
      ?auto_139246 - PLACE
      ?auto_139247 - TRUCK
      ?auto_139249 - PLACE
      ?auto_139250 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139248 ?auto_139246 ) ( SURFACE-AT ?auto_139244 ?auto_139246 ) ( CLEAR ?auto_139244 ) ( IS-CRATE ?auto_139245 ) ( not ( = ?auto_139244 ?auto_139245 ) ) ( AVAILABLE ?auto_139248 ) ( TRUCK-AT ?auto_139247 ?auto_139249 ) ( not ( = ?auto_139249 ?auto_139246 ) ) ( HOIST-AT ?auto_139250 ?auto_139249 ) ( LIFTING ?auto_139250 ?auto_139245 ) ( not ( = ?auto_139248 ?auto_139250 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139250 ?auto_139245 ?auto_139247 ?auto_139249 )
      ( MAKE-1CRATE ?auto_139244 ?auto_139245 )
      ( MAKE-1CRATE-VERIFY ?auto_139244 ?auto_139245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139251 - SURFACE
      ?auto_139252 - SURFACE
    )
    :vars
    (
      ?auto_139255 - HOIST
      ?auto_139253 - PLACE
      ?auto_139257 - TRUCK
      ?auto_139254 - PLACE
      ?auto_139256 - HOIST
      ?auto_139258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139255 ?auto_139253 ) ( SURFACE-AT ?auto_139251 ?auto_139253 ) ( CLEAR ?auto_139251 ) ( IS-CRATE ?auto_139252 ) ( not ( = ?auto_139251 ?auto_139252 ) ) ( AVAILABLE ?auto_139255 ) ( TRUCK-AT ?auto_139257 ?auto_139254 ) ( not ( = ?auto_139254 ?auto_139253 ) ) ( HOIST-AT ?auto_139256 ?auto_139254 ) ( not ( = ?auto_139255 ?auto_139256 ) ) ( AVAILABLE ?auto_139256 ) ( SURFACE-AT ?auto_139252 ?auto_139254 ) ( ON ?auto_139252 ?auto_139258 ) ( CLEAR ?auto_139252 ) ( not ( = ?auto_139251 ?auto_139258 ) ) ( not ( = ?auto_139252 ?auto_139258 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139256 ?auto_139252 ?auto_139258 ?auto_139254 )
      ( MAKE-1CRATE ?auto_139251 ?auto_139252 )
      ( MAKE-1CRATE-VERIFY ?auto_139251 ?auto_139252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139259 - SURFACE
      ?auto_139260 - SURFACE
    )
    :vars
    (
      ?auto_139263 - HOIST
      ?auto_139266 - PLACE
      ?auto_139261 - PLACE
      ?auto_139262 - HOIST
      ?auto_139264 - SURFACE
      ?auto_139265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139263 ?auto_139266 ) ( SURFACE-AT ?auto_139259 ?auto_139266 ) ( CLEAR ?auto_139259 ) ( IS-CRATE ?auto_139260 ) ( not ( = ?auto_139259 ?auto_139260 ) ) ( AVAILABLE ?auto_139263 ) ( not ( = ?auto_139261 ?auto_139266 ) ) ( HOIST-AT ?auto_139262 ?auto_139261 ) ( not ( = ?auto_139263 ?auto_139262 ) ) ( AVAILABLE ?auto_139262 ) ( SURFACE-AT ?auto_139260 ?auto_139261 ) ( ON ?auto_139260 ?auto_139264 ) ( CLEAR ?auto_139260 ) ( not ( = ?auto_139259 ?auto_139264 ) ) ( not ( = ?auto_139260 ?auto_139264 ) ) ( TRUCK-AT ?auto_139265 ?auto_139266 ) )
    :subtasks
    ( ( !DRIVE ?auto_139265 ?auto_139266 ?auto_139261 )
      ( MAKE-1CRATE ?auto_139259 ?auto_139260 )
      ( MAKE-1CRATE-VERIFY ?auto_139259 ?auto_139260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139276 - SURFACE
      ?auto_139277 - SURFACE
      ?auto_139278 - SURFACE
    )
    :vars
    (
      ?auto_139279 - HOIST
      ?auto_139280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139279 ?auto_139280 ) ( SURFACE-AT ?auto_139277 ?auto_139280 ) ( CLEAR ?auto_139277 ) ( LIFTING ?auto_139279 ?auto_139278 ) ( IS-CRATE ?auto_139278 ) ( not ( = ?auto_139277 ?auto_139278 ) ) ( ON ?auto_139277 ?auto_139276 ) ( not ( = ?auto_139276 ?auto_139277 ) ) ( not ( = ?auto_139276 ?auto_139278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139277 ?auto_139278 )
      ( MAKE-2CRATE-VERIFY ?auto_139276 ?auto_139277 ?auto_139278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139286 - SURFACE
      ?auto_139287 - SURFACE
      ?auto_139288 - SURFACE
    )
    :vars
    (
      ?auto_139289 - HOIST
      ?auto_139290 - PLACE
      ?auto_139291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139289 ?auto_139290 ) ( SURFACE-AT ?auto_139287 ?auto_139290 ) ( CLEAR ?auto_139287 ) ( IS-CRATE ?auto_139288 ) ( not ( = ?auto_139287 ?auto_139288 ) ) ( TRUCK-AT ?auto_139291 ?auto_139290 ) ( AVAILABLE ?auto_139289 ) ( IN ?auto_139288 ?auto_139291 ) ( ON ?auto_139287 ?auto_139286 ) ( not ( = ?auto_139286 ?auto_139287 ) ) ( not ( = ?auto_139286 ?auto_139288 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139287 ?auto_139288 )
      ( MAKE-2CRATE-VERIFY ?auto_139286 ?auto_139287 ?auto_139288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139292 - SURFACE
      ?auto_139293 - SURFACE
    )
    :vars
    (
      ?auto_139296 - HOIST
      ?auto_139297 - PLACE
      ?auto_139295 - TRUCK
      ?auto_139294 - SURFACE
      ?auto_139298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139296 ?auto_139297 ) ( SURFACE-AT ?auto_139292 ?auto_139297 ) ( CLEAR ?auto_139292 ) ( IS-CRATE ?auto_139293 ) ( not ( = ?auto_139292 ?auto_139293 ) ) ( AVAILABLE ?auto_139296 ) ( IN ?auto_139293 ?auto_139295 ) ( ON ?auto_139292 ?auto_139294 ) ( not ( = ?auto_139294 ?auto_139292 ) ) ( not ( = ?auto_139294 ?auto_139293 ) ) ( TRUCK-AT ?auto_139295 ?auto_139298 ) ( not ( = ?auto_139298 ?auto_139297 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139295 ?auto_139298 ?auto_139297 )
      ( MAKE-2CRATE ?auto_139294 ?auto_139292 ?auto_139293 )
      ( MAKE-1CRATE-VERIFY ?auto_139292 ?auto_139293 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139299 - SURFACE
      ?auto_139300 - SURFACE
      ?auto_139301 - SURFACE
    )
    :vars
    (
      ?auto_139305 - HOIST
      ?auto_139303 - PLACE
      ?auto_139304 - TRUCK
      ?auto_139302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139305 ?auto_139303 ) ( SURFACE-AT ?auto_139300 ?auto_139303 ) ( CLEAR ?auto_139300 ) ( IS-CRATE ?auto_139301 ) ( not ( = ?auto_139300 ?auto_139301 ) ) ( AVAILABLE ?auto_139305 ) ( IN ?auto_139301 ?auto_139304 ) ( ON ?auto_139300 ?auto_139299 ) ( not ( = ?auto_139299 ?auto_139300 ) ) ( not ( = ?auto_139299 ?auto_139301 ) ) ( TRUCK-AT ?auto_139304 ?auto_139302 ) ( not ( = ?auto_139302 ?auto_139303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139300 ?auto_139301 )
      ( MAKE-2CRATE-VERIFY ?auto_139299 ?auto_139300 ?auto_139301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139306 - SURFACE
      ?auto_139307 - SURFACE
    )
    :vars
    (
      ?auto_139311 - HOIST
      ?auto_139309 - PLACE
      ?auto_139308 - SURFACE
      ?auto_139312 - TRUCK
      ?auto_139310 - PLACE
      ?auto_139313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139311 ?auto_139309 ) ( SURFACE-AT ?auto_139306 ?auto_139309 ) ( CLEAR ?auto_139306 ) ( IS-CRATE ?auto_139307 ) ( not ( = ?auto_139306 ?auto_139307 ) ) ( AVAILABLE ?auto_139311 ) ( ON ?auto_139306 ?auto_139308 ) ( not ( = ?auto_139308 ?auto_139306 ) ) ( not ( = ?auto_139308 ?auto_139307 ) ) ( TRUCK-AT ?auto_139312 ?auto_139310 ) ( not ( = ?auto_139310 ?auto_139309 ) ) ( HOIST-AT ?auto_139313 ?auto_139310 ) ( LIFTING ?auto_139313 ?auto_139307 ) ( not ( = ?auto_139311 ?auto_139313 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139313 ?auto_139307 ?auto_139312 ?auto_139310 )
      ( MAKE-2CRATE ?auto_139308 ?auto_139306 ?auto_139307 )
      ( MAKE-1CRATE-VERIFY ?auto_139306 ?auto_139307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139314 - SURFACE
      ?auto_139315 - SURFACE
      ?auto_139316 - SURFACE
    )
    :vars
    (
      ?auto_139320 - HOIST
      ?auto_139317 - PLACE
      ?auto_139319 - TRUCK
      ?auto_139321 - PLACE
      ?auto_139318 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139320 ?auto_139317 ) ( SURFACE-AT ?auto_139315 ?auto_139317 ) ( CLEAR ?auto_139315 ) ( IS-CRATE ?auto_139316 ) ( not ( = ?auto_139315 ?auto_139316 ) ) ( AVAILABLE ?auto_139320 ) ( ON ?auto_139315 ?auto_139314 ) ( not ( = ?auto_139314 ?auto_139315 ) ) ( not ( = ?auto_139314 ?auto_139316 ) ) ( TRUCK-AT ?auto_139319 ?auto_139321 ) ( not ( = ?auto_139321 ?auto_139317 ) ) ( HOIST-AT ?auto_139318 ?auto_139321 ) ( LIFTING ?auto_139318 ?auto_139316 ) ( not ( = ?auto_139320 ?auto_139318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139315 ?auto_139316 )
      ( MAKE-2CRATE-VERIFY ?auto_139314 ?auto_139315 ?auto_139316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139322 - SURFACE
      ?auto_139323 - SURFACE
    )
    :vars
    (
      ?auto_139329 - HOIST
      ?auto_139327 - PLACE
      ?auto_139324 - SURFACE
      ?auto_139325 - TRUCK
      ?auto_139326 - PLACE
      ?auto_139328 - HOIST
      ?auto_139330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139329 ?auto_139327 ) ( SURFACE-AT ?auto_139322 ?auto_139327 ) ( CLEAR ?auto_139322 ) ( IS-CRATE ?auto_139323 ) ( not ( = ?auto_139322 ?auto_139323 ) ) ( AVAILABLE ?auto_139329 ) ( ON ?auto_139322 ?auto_139324 ) ( not ( = ?auto_139324 ?auto_139322 ) ) ( not ( = ?auto_139324 ?auto_139323 ) ) ( TRUCK-AT ?auto_139325 ?auto_139326 ) ( not ( = ?auto_139326 ?auto_139327 ) ) ( HOIST-AT ?auto_139328 ?auto_139326 ) ( not ( = ?auto_139329 ?auto_139328 ) ) ( AVAILABLE ?auto_139328 ) ( SURFACE-AT ?auto_139323 ?auto_139326 ) ( ON ?auto_139323 ?auto_139330 ) ( CLEAR ?auto_139323 ) ( not ( = ?auto_139322 ?auto_139330 ) ) ( not ( = ?auto_139323 ?auto_139330 ) ) ( not ( = ?auto_139324 ?auto_139330 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139328 ?auto_139323 ?auto_139330 ?auto_139326 )
      ( MAKE-2CRATE ?auto_139324 ?auto_139322 ?auto_139323 )
      ( MAKE-1CRATE-VERIFY ?auto_139322 ?auto_139323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139331 - SURFACE
      ?auto_139332 - SURFACE
      ?auto_139333 - SURFACE
    )
    :vars
    (
      ?auto_139337 - HOIST
      ?auto_139338 - PLACE
      ?auto_139334 - TRUCK
      ?auto_139336 - PLACE
      ?auto_139335 - HOIST
      ?auto_139339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139337 ?auto_139338 ) ( SURFACE-AT ?auto_139332 ?auto_139338 ) ( CLEAR ?auto_139332 ) ( IS-CRATE ?auto_139333 ) ( not ( = ?auto_139332 ?auto_139333 ) ) ( AVAILABLE ?auto_139337 ) ( ON ?auto_139332 ?auto_139331 ) ( not ( = ?auto_139331 ?auto_139332 ) ) ( not ( = ?auto_139331 ?auto_139333 ) ) ( TRUCK-AT ?auto_139334 ?auto_139336 ) ( not ( = ?auto_139336 ?auto_139338 ) ) ( HOIST-AT ?auto_139335 ?auto_139336 ) ( not ( = ?auto_139337 ?auto_139335 ) ) ( AVAILABLE ?auto_139335 ) ( SURFACE-AT ?auto_139333 ?auto_139336 ) ( ON ?auto_139333 ?auto_139339 ) ( CLEAR ?auto_139333 ) ( not ( = ?auto_139332 ?auto_139339 ) ) ( not ( = ?auto_139333 ?auto_139339 ) ) ( not ( = ?auto_139331 ?auto_139339 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139332 ?auto_139333 )
      ( MAKE-2CRATE-VERIFY ?auto_139331 ?auto_139332 ?auto_139333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139340 - SURFACE
      ?auto_139341 - SURFACE
    )
    :vars
    (
      ?auto_139347 - HOIST
      ?auto_139344 - PLACE
      ?auto_139342 - SURFACE
      ?auto_139348 - PLACE
      ?auto_139346 - HOIST
      ?auto_139343 - SURFACE
      ?auto_139345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139347 ?auto_139344 ) ( SURFACE-AT ?auto_139340 ?auto_139344 ) ( CLEAR ?auto_139340 ) ( IS-CRATE ?auto_139341 ) ( not ( = ?auto_139340 ?auto_139341 ) ) ( AVAILABLE ?auto_139347 ) ( ON ?auto_139340 ?auto_139342 ) ( not ( = ?auto_139342 ?auto_139340 ) ) ( not ( = ?auto_139342 ?auto_139341 ) ) ( not ( = ?auto_139348 ?auto_139344 ) ) ( HOIST-AT ?auto_139346 ?auto_139348 ) ( not ( = ?auto_139347 ?auto_139346 ) ) ( AVAILABLE ?auto_139346 ) ( SURFACE-AT ?auto_139341 ?auto_139348 ) ( ON ?auto_139341 ?auto_139343 ) ( CLEAR ?auto_139341 ) ( not ( = ?auto_139340 ?auto_139343 ) ) ( not ( = ?auto_139341 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139343 ) ) ( TRUCK-AT ?auto_139345 ?auto_139344 ) )
    :subtasks
    ( ( !DRIVE ?auto_139345 ?auto_139344 ?auto_139348 )
      ( MAKE-2CRATE ?auto_139342 ?auto_139340 ?auto_139341 )
      ( MAKE-1CRATE-VERIFY ?auto_139340 ?auto_139341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139349 - SURFACE
      ?auto_139350 - SURFACE
      ?auto_139351 - SURFACE
    )
    :vars
    (
      ?auto_139353 - HOIST
      ?auto_139356 - PLACE
      ?auto_139354 - PLACE
      ?auto_139352 - HOIST
      ?auto_139355 - SURFACE
      ?auto_139357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139353 ?auto_139356 ) ( SURFACE-AT ?auto_139350 ?auto_139356 ) ( CLEAR ?auto_139350 ) ( IS-CRATE ?auto_139351 ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( AVAILABLE ?auto_139353 ) ( ON ?auto_139350 ?auto_139349 ) ( not ( = ?auto_139349 ?auto_139350 ) ) ( not ( = ?auto_139349 ?auto_139351 ) ) ( not ( = ?auto_139354 ?auto_139356 ) ) ( HOIST-AT ?auto_139352 ?auto_139354 ) ( not ( = ?auto_139353 ?auto_139352 ) ) ( AVAILABLE ?auto_139352 ) ( SURFACE-AT ?auto_139351 ?auto_139354 ) ( ON ?auto_139351 ?auto_139355 ) ( CLEAR ?auto_139351 ) ( not ( = ?auto_139350 ?auto_139355 ) ) ( not ( = ?auto_139351 ?auto_139355 ) ) ( not ( = ?auto_139349 ?auto_139355 ) ) ( TRUCK-AT ?auto_139357 ?auto_139356 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139350 ?auto_139351 )
      ( MAKE-2CRATE-VERIFY ?auto_139349 ?auto_139350 ?auto_139351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139358 - SURFACE
      ?auto_139359 - SURFACE
    )
    :vars
    (
      ?auto_139362 - HOIST
      ?auto_139363 - PLACE
      ?auto_139361 - SURFACE
      ?auto_139366 - PLACE
      ?auto_139360 - HOIST
      ?auto_139364 - SURFACE
      ?auto_139365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139362 ?auto_139363 ) ( IS-CRATE ?auto_139359 ) ( not ( = ?auto_139358 ?auto_139359 ) ) ( not ( = ?auto_139361 ?auto_139358 ) ) ( not ( = ?auto_139361 ?auto_139359 ) ) ( not ( = ?auto_139366 ?auto_139363 ) ) ( HOIST-AT ?auto_139360 ?auto_139366 ) ( not ( = ?auto_139362 ?auto_139360 ) ) ( AVAILABLE ?auto_139360 ) ( SURFACE-AT ?auto_139359 ?auto_139366 ) ( ON ?auto_139359 ?auto_139364 ) ( CLEAR ?auto_139359 ) ( not ( = ?auto_139358 ?auto_139364 ) ) ( not ( = ?auto_139359 ?auto_139364 ) ) ( not ( = ?auto_139361 ?auto_139364 ) ) ( TRUCK-AT ?auto_139365 ?auto_139363 ) ( SURFACE-AT ?auto_139361 ?auto_139363 ) ( CLEAR ?auto_139361 ) ( LIFTING ?auto_139362 ?auto_139358 ) ( IS-CRATE ?auto_139358 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139361 ?auto_139358 )
      ( MAKE-2CRATE ?auto_139361 ?auto_139358 ?auto_139359 )
      ( MAKE-1CRATE-VERIFY ?auto_139358 ?auto_139359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139367 - SURFACE
      ?auto_139368 - SURFACE
      ?auto_139369 - SURFACE
    )
    :vars
    (
      ?auto_139372 - HOIST
      ?auto_139373 - PLACE
      ?auto_139375 - PLACE
      ?auto_139374 - HOIST
      ?auto_139370 - SURFACE
      ?auto_139371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139372 ?auto_139373 ) ( IS-CRATE ?auto_139369 ) ( not ( = ?auto_139368 ?auto_139369 ) ) ( not ( = ?auto_139367 ?auto_139368 ) ) ( not ( = ?auto_139367 ?auto_139369 ) ) ( not ( = ?auto_139375 ?auto_139373 ) ) ( HOIST-AT ?auto_139374 ?auto_139375 ) ( not ( = ?auto_139372 ?auto_139374 ) ) ( AVAILABLE ?auto_139374 ) ( SURFACE-AT ?auto_139369 ?auto_139375 ) ( ON ?auto_139369 ?auto_139370 ) ( CLEAR ?auto_139369 ) ( not ( = ?auto_139368 ?auto_139370 ) ) ( not ( = ?auto_139369 ?auto_139370 ) ) ( not ( = ?auto_139367 ?auto_139370 ) ) ( TRUCK-AT ?auto_139371 ?auto_139373 ) ( SURFACE-AT ?auto_139367 ?auto_139373 ) ( CLEAR ?auto_139367 ) ( LIFTING ?auto_139372 ?auto_139368 ) ( IS-CRATE ?auto_139368 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139368 ?auto_139369 )
      ( MAKE-2CRATE-VERIFY ?auto_139367 ?auto_139368 ?auto_139369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139376 - SURFACE
      ?auto_139377 - SURFACE
    )
    :vars
    (
      ?auto_139380 - HOIST
      ?auto_139378 - PLACE
      ?auto_139381 - SURFACE
      ?auto_139384 - PLACE
      ?auto_139383 - HOIST
      ?auto_139382 - SURFACE
      ?auto_139379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139380 ?auto_139378 ) ( IS-CRATE ?auto_139377 ) ( not ( = ?auto_139376 ?auto_139377 ) ) ( not ( = ?auto_139381 ?auto_139376 ) ) ( not ( = ?auto_139381 ?auto_139377 ) ) ( not ( = ?auto_139384 ?auto_139378 ) ) ( HOIST-AT ?auto_139383 ?auto_139384 ) ( not ( = ?auto_139380 ?auto_139383 ) ) ( AVAILABLE ?auto_139383 ) ( SURFACE-AT ?auto_139377 ?auto_139384 ) ( ON ?auto_139377 ?auto_139382 ) ( CLEAR ?auto_139377 ) ( not ( = ?auto_139376 ?auto_139382 ) ) ( not ( = ?auto_139377 ?auto_139382 ) ) ( not ( = ?auto_139381 ?auto_139382 ) ) ( TRUCK-AT ?auto_139379 ?auto_139378 ) ( SURFACE-AT ?auto_139381 ?auto_139378 ) ( CLEAR ?auto_139381 ) ( IS-CRATE ?auto_139376 ) ( AVAILABLE ?auto_139380 ) ( IN ?auto_139376 ?auto_139379 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139380 ?auto_139376 ?auto_139379 ?auto_139378 )
      ( MAKE-2CRATE ?auto_139381 ?auto_139376 ?auto_139377 )
      ( MAKE-1CRATE-VERIFY ?auto_139376 ?auto_139377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139385 - SURFACE
      ?auto_139386 - SURFACE
      ?auto_139387 - SURFACE
    )
    :vars
    (
      ?auto_139392 - HOIST
      ?auto_139391 - PLACE
      ?auto_139393 - PLACE
      ?auto_139388 - HOIST
      ?auto_139389 - SURFACE
      ?auto_139390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139392 ?auto_139391 ) ( IS-CRATE ?auto_139387 ) ( not ( = ?auto_139386 ?auto_139387 ) ) ( not ( = ?auto_139385 ?auto_139386 ) ) ( not ( = ?auto_139385 ?auto_139387 ) ) ( not ( = ?auto_139393 ?auto_139391 ) ) ( HOIST-AT ?auto_139388 ?auto_139393 ) ( not ( = ?auto_139392 ?auto_139388 ) ) ( AVAILABLE ?auto_139388 ) ( SURFACE-AT ?auto_139387 ?auto_139393 ) ( ON ?auto_139387 ?auto_139389 ) ( CLEAR ?auto_139387 ) ( not ( = ?auto_139386 ?auto_139389 ) ) ( not ( = ?auto_139387 ?auto_139389 ) ) ( not ( = ?auto_139385 ?auto_139389 ) ) ( TRUCK-AT ?auto_139390 ?auto_139391 ) ( SURFACE-AT ?auto_139385 ?auto_139391 ) ( CLEAR ?auto_139385 ) ( IS-CRATE ?auto_139386 ) ( AVAILABLE ?auto_139392 ) ( IN ?auto_139386 ?auto_139390 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139386 ?auto_139387 )
      ( MAKE-2CRATE-VERIFY ?auto_139385 ?auto_139386 ?auto_139387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139430 - SURFACE
      ?auto_139431 - SURFACE
    )
    :vars
    (
      ?auto_139437 - HOIST
      ?auto_139432 - PLACE
      ?auto_139434 - SURFACE
      ?auto_139435 - PLACE
      ?auto_139438 - HOIST
      ?auto_139436 - SURFACE
      ?auto_139433 - TRUCK
      ?auto_139439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139437 ?auto_139432 ) ( SURFACE-AT ?auto_139430 ?auto_139432 ) ( CLEAR ?auto_139430 ) ( IS-CRATE ?auto_139431 ) ( not ( = ?auto_139430 ?auto_139431 ) ) ( AVAILABLE ?auto_139437 ) ( ON ?auto_139430 ?auto_139434 ) ( not ( = ?auto_139434 ?auto_139430 ) ) ( not ( = ?auto_139434 ?auto_139431 ) ) ( not ( = ?auto_139435 ?auto_139432 ) ) ( HOIST-AT ?auto_139438 ?auto_139435 ) ( not ( = ?auto_139437 ?auto_139438 ) ) ( AVAILABLE ?auto_139438 ) ( SURFACE-AT ?auto_139431 ?auto_139435 ) ( ON ?auto_139431 ?auto_139436 ) ( CLEAR ?auto_139431 ) ( not ( = ?auto_139430 ?auto_139436 ) ) ( not ( = ?auto_139431 ?auto_139436 ) ) ( not ( = ?auto_139434 ?auto_139436 ) ) ( TRUCK-AT ?auto_139433 ?auto_139439 ) ( not ( = ?auto_139439 ?auto_139432 ) ) ( not ( = ?auto_139435 ?auto_139439 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139433 ?auto_139439 ?auto_139432 )
      ( MAKE-1CRATE ?auto_139430 ?auto_139431 )
      ( MAKE-1CRATE-VERIFY ?auto_139430 ?auto_139431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139469 - SURFACE
      ?auto_139470 - SURFACE
      ?auto_139471 - SURFACE
      ?auto_139472 - SURFACE
    )
    :vars
    (
      ?auto_139473 - HOIST
      ?auto_139474 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139473 ?auto_139474 ) ( SURFACE-AT ?auto_139471 ?auto_139474 ) ( CLEAR ?auto_139471 ) ( LIFTING ?auto_139473 ?auto_139472 ) ( IS-CRATE ?auto_139472 ) ( not ( = ?auto_139471 ?auto_139472 ) ) ( ON ?auto_139470 ?auto_139469 ) ( ON ?auto_139471 ?auto_139470 ) ( not ( = ?auto_139469 ?auto_139470 ) ) ( not ( = ?auto_139469 ?auto_139471 ) ) ( not ( = ?auto_139469 ?auto_139472 ) ) ( not ( = ?auto_139470 ?auto_139471 ) ) ( not ( = ?auto_139470 ?auto_139472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139471 ?auto_139472 )
      ( MAKE-3CRATE-VERIFY ?auto_139469 ?auto_139470 ?auto_139471 ?auto_139472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139486 - SURFACE
      ?auto_139487 - SURFACE
      ?auto_139488 - SURFACE
      ?auto_139489 - SURFACE
    )
    :vars
    (
      ?auto_139492 - HOIST
      ?auto_139490 - PLACE
      ?auto_139491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139492 ?auto_139490 ) ( SURFACE-AT ?auto_139488 ?auto_139490 ) ( CLEAR ?auto_139488 ) ( IS-CRATE ?auto_139489 ) ( not ( = ?auto_139488 ?auto_139489 ) ) ( TRUCK-AT ?auto_139491 ?auto_139490 ) ( AVAILABLE ?auto_139492 ) ( IN ?auto_139489 ?auto_139491 ) ( ON ?auto_139488 ?auto_139487 ) ( not ( = ?auto_139487 ?auto_139488 ) ) ( not ( = ?auto_139487 ?auto_139489 ) ) ( ON ?auto_139487 ?auto_139486 ) ( not ( = ?auto_139486 ?auto_139487 ) ) ( not ( = ?auto_139486 ?auto_139488 ) ) ( not ( = ?auto_139486 ?auto_139489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139487 ?auto_139488 ?auto_139489 )
      ( MAKE-3CRATE-VERIFY ?auto_139486 ?auto_139487 ?auto_139488 ?auto_139489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139507 - SURFACE
      ?auto_139508 - SURFACE
      ?auto_139509 - SURFACE
      ?auto_139510 - SURFACE
    )
    :vars
    (
      ?auto_139514 - HOIST
      ?auto_139513 - PLACE
      ?auto_139511 - TRUCK
      ?auto_139512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139514 ?auto_139513 ) ( SURFACE-AT ?auto_139509 ?auto_139513 ) ( CLEAR ?auto_139509 ) ( IS-CRATE ?auto_139510 ) ( not ( = ?auto_139509 ?auto_139510 ) ) ( AVAILABLE ?auto_139514 ) ( IN ?auto_139510 ?auto_139511 ) ( ON ?auto_139509 ?auto_139508 ) ( not ( = ?auto_139508 ?auto_139509 ) ) ( not ( = ?auto_139508 ?auto_139510 ) ) ( TRUCK-AT ?auto_139511 ?auto_139512 ) ( not ( = ?auto_139512 ?auto_139513 ) ) ( ON ?auto_139508 ?auto_139507 ) ( not ( = ?auto_139507 ?auto_139508 ) ) ( not ( = ?auto_139507 ?auto_139509 ) ) ( not ( = ?auto_139507 ?auto_139510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139508 ?auto_139509 ?auto_139510 )
      ( MAKE-3CRATE-VERIFY ?auto_139507 ?auto_139508 ?auto_139509 ?auto_139510 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139531 - SURFACE
      ?auto_139532 - SURFACE
      ?auto_139533 - SURFACE
      ?auto_139534 - SURFACE
    )
    :vars
    (
      ?auto_139537 - HOIST
      ?auto_139538 - PLACE
      ?auto_139539 - TRUCK
      ?auto_139535 - PLACE
      ?auto_139536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139537 ?auto_139538 ) ( SURFACE-AT ?auto_139533 ?auto_139538 ) ( CLEAR ?auto_139533 ) ( IS-CRATE ?auto_139534 ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( AVAILABLE ?auto_139537 ) ( ON ?auto_139533 ?auto_139532 ) ( not ( = ?auto_139532 ?auto_139533 ) ) ( not ( = ?auto_139532 ?auto_139534 ) ) ( TRUCK-AT ?auto_139539 ?auto_139535 ) ( not ( = ?auto_139535 ?auto_139538 ) ) ( HOIST-AT ?auto_139536 ?auto_139535 ) ( LIFTING ?auto_139536 ?auto_139534 ) ( not ( = ?auto_139537 ?auto_139536 ) ) ( ON ?auto_139532 ?auto_139531 ) ( not ( = ?auto_139531 ?auto_139532 ) ) ( not ( = ?auto_139531 ?auto_139533 ) ) ( not ( = ?auto_139531 ?auto_139534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139532 ?auto_139533 ?auto_139534 )
      ( MAKE-3CRATE-VERIFY ?auto_139531 ?auto_139532 ?auto_139533 ?auto_139534 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139558 - SURFACE
      ?auto_139559 - SURFACE
      ?auto_139560 - SURFACE
      ?auto_139561 - SURFACE
    )
    :vars
    (
      ?auto_139566 - HOIST
      ?auto_139562 - PLACE
      ?auto_139564 - TRUCK
      ?auto_139565 - PLACE
      ?auto_139567 - HOIST
      ?auto_139563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139566 ?auto_139562 ) ( SURFACE-AT ?auto_139560 ?auto_139562 ) ( CLEAR ?auto_139560 ) ( IS-CRATE ?auto_139561 ) ( not ( = ?auto_139560 ?auto_139561 ) ) ( AVAILABLE ?auto_139566 ) ( ON ?auto_139560 ?auto_139559 ) ( not ( = ?auto_139559 ?auto_139560 ) ) ( not ( = ?auto_139559 ?auto_139561 ) ) ( TRUCK-AT ?auto_139564 ?auto_139565 ) ( not ( = ?auto_139565 ?auto_139562 ) ) ( HOIST-AT ?auto_139567 ?auto_139565 ) ( not ( = ?auto_139566 ?auto_139567 ) ) ( AVAILABLE ?auto_139567 ) ( SURFACE-AT ?auto_139561 ?auto_139565 ) ( ON ?auto_139561 ?auto_139563 ) ( CLEAR ?auto_139561 ) ( not ( = ?auto_139560 ?auto_139563 ) ) ( not ( = ?auto_139561 ?auto_139563 ) ) ( not ( = ?auto_139559 ?auto_139563 ) ) ( ON ?auto_139559 ?auto_139558 ) ( not ( = ?auto_139558 ?auto_139559 ) ) ( not ( = ?auto_139558 ?auto_139560 ) ) ( not ( = ?auto_139558 ?auto_139561 ) ) ( not ( = ?auto_139558 ?auto_139563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139559 ?auto_139560 ?auto_139561 )
      ( MAKE-3CRATE-VERIFY ?auto_139558 ?auto_139559 ?auto_139560 ?auto_139561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139586 - SURFACE
      ?auto_139587 - SURFACE
      ?auto_139588 - SURFACE
      ?auto_139589 - SURFACE
    )
    :vars
    (
      ?auto_139592 - HOIST
      ?auto_139594 - PLACE
      ?auto_139591 - PLACE
      ?auto_139590 - HOIST
      ?auto_139595 - SURFACE
      ?auto_139593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139592 ?auto_139594 ) ( SURFACE-AT ?auto_139588 ?auto_139594 ) ( CLEAR ?auto_139588 ) ( IS-CRATE ?auto_139589 ) ( not ( = ?auto_139588 ?auto_139589 ) ) ( AVAILABLE ?auto_139592 ) ( ON ?auto_139588 ?auto_139587 ) ( not ( = ?auto_139587 ?auto_139588 ) ) ( not ( = ?auto_139587 ?auto_139589 ) ) ( not ( = ?auto_139591 ?auto_139594 ) ) ( HOIST-AT ?auto_139590 ?auto_139591 ) ( not ( = ?auto_139592 ?auto_139590 ) ) ( AVAILABLE ?auto_139590 ) ( SURFACE-AT ?auto_139589 ?auto_139591 ) ( ON ?auto_139589 ?auto_139595 ) ( CLEAR ?auto_139589 ) ( not ( = ?auto_139588 ?auto_139595 ) ) ( not ( = ?auto_139589 ?auto_139595 ) ) ( not ( = ?auto_139587 ?auto_139595 ) ) ( TRUCK-AT ?auto_139593 ?auto_139594 ) ( ON ?auto_139587 ?auto_139586 ) ( not ( = ?auto_139586 ?auto_139587 ) ) ( not ( = ?auto_139586 ?auto_139588 ) ) ( not ( = ?auto_139586 ?auto_139589 ) ) ( not ( = ?auto_139586 ?auto_139595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139587 ?auto_139588 ?auto_139589 )
      ( MAKE-3CRATE-VERIFY ?auto_139586 ?auto_139587 ?auto_139588 ?auto_139589 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139614 - SURFACE
      ?auto_139615 - SURFACE
      ?auto_139616 - SURFACE
      ?auto_139617 - SURFACE
    )
    :vars
    (
      ?auto_139623 - HOIST
      ?auto_139620 - PLACE
      ?auto_139618 - PLACE
      ?auto_139621 - HOIST
      ?auto_139619 - SURFACE
      ?auto_139622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139623 ?auto_139620 ) ( IS-CRATE ?auto_139617 ) ( not ( = ?auto_139616 ?auto_139617 ) ) ( not ( = ?auto_139615 ?auto_139616 ) ) ( not ( = ?auto_139615 ?auto_139617 ) ) ( not ( = ?auto_139618 ?auto_139620 ) ) ( HOIST-AT ?auto_139621 ?auto_139618 ) ( not ( = ?auto_139623 ?auto_139621 ) ) ( AVAILABLE ?auto_139621 ) ( SURFACE-AT ?auto_139617 ?auto_139618 ) ( ON ?auto_139617 ?auto_139619 ) ( CLEAR ?auto_139617 ) ( not ( = ?auto_139616 ?auto_139619 ) ) ( not ( = ?auto_139617 ?auto_139619 ) ) ( not ( = ?auto_139615 ?auto_139619 ) ) ( TRUCK-AT ?auto_139622 ?auto_139620 ) ( SURFACE-AT ?auto_139615 ?auto_139620 ) ( CLEAR ?auto_139615 ) ( LIFTING ?auto_139623 ?auto_139616 ) ( IS-CRATE ?auto_139616 ) ( ON ?auto_139615 ?auto_139614 ) ( not ( = ?auto_139614 ?auto_139615 ) ) ( not ( = ?auto_139614 ?auto_139616 ) ) ( not ( = ?auto_139614 ?auto_139617 ) ) ( not ( = ?auto_139614 ?auto_139619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139615 ?auto_139616 ?auto_139617 )
      ( MAKE-3CRATE-VERIFY ?auto_139614 ?auto_139615 ?auto_139616 ?auto_139617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139642 - SURFACE
      ?auto_139643 - SURFACE
      ?auto_139644 - SURFACE
      ?auto_139645 - SURFACE
    )
    :vars
    (
      ?auto_139650 - HOIST
      ?auto_139647 - PLACE
      ?auto_139646 - PLACE
      ?auto_139651 - HOIST
      ?auto_139649 - SURFACE
      ?auto_139648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139650 ?auto_139647 ) ( IS-CRATE ?auto_139645 ) ( not ( = ?auto_139644 ?auto_139645 ) ) ( not ( = ?auto_139643 ?auto_139644 ) ) ( not ( = ?auto_139643 ?auto_139645 ) ) ( not ( = ?auto_139646 ?auto_139647 ) ) ( HOIST-AT ?auto_139651 ?auto_139646 ) ( not ( = ?auto_139650 ?auto_139651 ) ) ( AVAILABLE ?auto_139651 ) ( SURFACE-AT ?auto_139645 ?auto_139646 ) ( ON ?auto_139645 ?auto_139649 ) ( CLEAR ?auto_139645 ) ( not ( = ?auto_139644 ?auto_139649 ) ) ( not ( = ?auto_139645 ?auto_139649 ) ) ( not ( = ?auto_139643 ?auto_139649 ) ) ( TRUCK-AT ?auto_139648 ?auto_139647 ) ( SURFACE-AT ?auto_139643 ?auto_139647 ) ( CLEAR ?auto_139643 ) ( IS-CRATE ?auto_139644 ) ( AVAILABLE ?auto_139650 ) ( IN ?auto_139644 ?auto_139648 ) ( ON ?auto_139643 ?auto_139642 ) ( not ( = ?auto_139642 ?auto_139643 ) ) ( not ( = ?auto_139642 ?auto_139644 ) ) ( not ( = ?auto_139642 ?auto_139645 ) ) ( not ( = ?auto_139642 ?auto_139649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139643 ?auto_139644 ?auto_139645 )
      ( MAKE-3CRATE-VERIFY ?auto_139642 ?auto_139643 ?auto_139644 ?auto_139645 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_139933 - SURFACE
      ?auto_139934 - SURFACE
      ?auto_139935 - SURFACE
      ?auto_139937 - SURFACE
      ?auto_139936 - SURFACE
    )
    :vars
    (
      ?auto_139938 - HOIST
      ?auto_139939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139938 ?auto_139939 ) ( SURFACE-AT ?auto_139937 ?auto_139939 ) ( CLEAR ?auto_139937 ) ( LIFTING ?auto_139938 ?auto_139936 ) ( IS-CRATE ?auto_139936 ) ( not ( = ?auto_139937 ?auto_139936 ) ) ( ON ?auto_139934 ?auto_139933 ) ( ON ?auto_139935 ?auto_139934 ) ( ON ?auto_139937 ?auto_139935 ) ( not ( = ?auto_139933 ?auto_139934 ) ) ( not ( = ?auto_139933 ?auto_139935 ) ) ( not ( = ?auto_139933 ?auto_139937 ) ) ( not ( = ?auto_139933 ?auto_139936 ) ) ( not ( = ?auto_139934 ?auto_139935 ) ) ( not ( = ?auto_139934 ?auto_139937 ) ) ( not ( = ?auto_139934 ?auto_139936 ) ) ( not ( = ?auto_139935 ?auto_139937 ) ) ( not ( = ?auto_139935 ?auto_139936 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139937 ?auto_139936 )
      ( MAKE-4CRATE-VERIFY ?auto_139933 ?auto_139934 ?auto_139935 ?auto_139937 ?auto_139936 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_139958 - SURFACE
      ?auto_139959 - SURFACE
      ?auto_139960 - SURFACE
      ?auto_139962 - SURFACE
      ?auto_139961 - SURFACE
    )
    :vars
    (
      ?auto_139964 - HOIST
      ?auto_139965 - PLACE
      ?auto_139963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139964 ?auto_139965 ) ( SURFACE-AT ?auto_139962 ?auto_139965 ) ( CLEAR ?auto_139962 ) ( IS-CRATE ?auto_139961 ) ( not ( = ?auto_139962 ?auto_139961 ) ) ( TRUCK-AT ?auto_139963 ?auto_139965 ) ( AVAILABLE ?auto_139964 ) ( IN ?auto_139961 ?auto_139963 ) ( ON ?auto_139962 ?auto_139960 ) ( not ( = ?auto_139960 ?auto_139962 ) ) ( not ( = ?auto_139960 ?auto_139961 ) ) ( ON ?auto_139959 ?auto_139958 ) ( ON ?auto_139960 ?auto_139959 ) ( not ( = ?auto_139958 ?auto_139959 ) ) ( not ( = ?auto_139958 ?auto_139960 ) ) ( not ( = ?auto_139958 ?auto_139962 ) ) ( not ( = ?auto_139958 ?auto_139961 ) ) ( not ( = ?auto_139959 ?auto_139960 ) ) ( not ( = ?auto_139959 ?auto_139962 ) ) ( not ( = ?auto_139959 ?auto_139961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139960 ?auto_139962 ?auto_139961 )
      ( MAKE-4CRATE-VERIFY ?auto_139958 ?auto_139959 ?auto_139960 ?auto_139962 ?auto_139961 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_139988 - SURFACE
      ?auto_139989 - SURFACE
      ?auto_139990 - SURFACE
      ?auto_139992 - SURFACE
      ?auto_139991 - SURFACE
    )
    :vars
    (
      ?auto_139994 - HOIST
      ?auto_139996 - PLACE
      ?auto_139993 - TRUCK
      ?auto_139995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139994 ?auto_139996 ) ( SURFACE-AT ?auto_139992 ?auto_139996 ) ( CLEAR ?auto_139992 ) ( IS-CRATE ?auto_139991 ) ( not ( = ?auto_139992 ?auto_139991 ) ) ( AVAILABLE ?auto_139994 ) ( IN ?auto_139991 ?auto_139993 ) ( ON ?auto_139992 ?auto_139990 ) ( not ( = ?auto_139990 ?auto_139992 ) ) ( not ( = ?auto_139990 ?auto_139991 ) ) ( TRUCK-AT ?auto_139993 ?auto_139995 ) ( not ( = ?auto_139995 ?auto_139996 ) ) ( ON ?auto_139989 ?auto_139988 ) ( ON ?auto_139990 ?auto_139989 ) ( not ( = ?auto_139988 ?auto_139989 ) ) ( not ( = ?auto_139988 ?auto_139990 ) ) ( not ( = ?auto_139988 ?auto_139992 ) ) ( not ( = ?auto_139988 ?auto_139991 ) ) ( not ( = ?auto_139989 ?auto_139990 ) ) ( not ( = ?auto_139989 ?auto_139992 ) ) ( not ( = ?auto_139989 ?auto_139991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139990 ?auto_139992 ?auto_139991 )
      ( MAKE-4CRATE-VERIFY ?auto_139988 ?auto_139989 ?auto_139990 ?auto_139992 ?auto_139991 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140022 - SURFACE
      ?auto_140023 - SURFACE
      ?auto_140024 - SURFACE
      ?auto_140026 - SURFACE
      ?auto_140025 - SURFACE
    )
    :vars
    (
      ?auto_140028 - HOIST
      ?auto_140030 - PLACE
      ?auto_140029 - TRUCK
      ?auto_140027 - PLACE
      ?auto_140031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_140028 ?auto_140030 ) ( SURFACE-AT ?auto_140026 ?auto_140030 ) ( CLEAR ?auto_140026 ) ( IS-CRATE ?auto_140025 ) ( not ( = ?auto_140026 ?auto_140025 ) ) ( AVAILABLE ?auto_140028 ) ( ON ?auto_140026 ?auto_140024 ) ( not ( = ?auto_140024 ?auto_140026 ) ) ( not ( = ?auto_140024 ?auto_140025 ) ) ( TRUCK-AT ?auto_140029 ?auto_140027 ) ( not ( = ?auto_140027 ?auto_140030 ) ) ( HOIST-AT ?auto_140031 ?auto_140027 ) ( LIFTING ?auto_140031 ?auto_140025 ) ( not ( = ?auto_140028 ?auto_140031 ) ) ( ON ?auto_140023 ?auto_140022 ) ( ON ?auto_140024 ?auto_140023 ) ( not ( = ?auto_140022 ?auto_140023 ) ) ( not ( = ?auto_140022 ?auto_140024 ) ) ( not ( = ?auto_140022 ?auto_140026 ) ) ( not ( = ?auto_140022 ?auto_140025 ) ) ( not ( = ?auto_140023 ?auto_140024 ) ) ( not ( = ?auto_140023 ?auto_140026 ) ) ( not ( = ?auto_140023 ?auto_140025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140024 ?auto_140026 ?auto_140025 )
      ( MAKE-4CRATE-VERIFY ?auto_140022 ?auto_140023 ?auto_140024 ?auto_140026 ?auto_140025 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140060 - SURFACE
      ?auto_140061 - SURFACE
      ?auto_140062 - SURFACE
      ?auto_140064 - SURFACE
      ?auto_140063 - SURFACE
    )
    :vars
    (
      ?auto_140069 - HOIST
      ?auto_140066 - PLACE
      ?auto_140068 - TRUCK
      ?auto_140067 - PLACE
      ?auto_140070 - HOIST
      ?auto_140065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140069 ?auto_140066 ) ( SURFACE-AT ?auto_140064 ?auto_140066 ) ( CLEAR ?auto_140064 ) ( IS-CRATE ?auto_140063 ) ( not ( = ?auto_140064 ?auto_140063 ) ) ( AVAILABLE ?auto_140069 ) ( ON ?auto_140064 ?auto_140062 ) ( not ( = ?auto_140062 ?auto_140064 ) ) ( not ( = ?auto_140062 ?auto_140063 ) ) ( TRUCK-AT ?auto_140068 ?auto_140067 ) ( not ( = ?auto_140067 ?auto_140066 ) ) ( HOIST-AT ?auto_140070 ?auto_140067 ) ( not ( = ?auto_140069 ?auto_140070 ) ) ( AVAILABLE ?auto_140070 ) ( SURFACE-AT ?auto_140063 ?auto_140067 ) ( ON ?auto_140063 ?auto_140065 ) ( CLEAR ?auto_140063 ) ( not ( = ?auto_140064 ?auto_140065 ) ) ( not ( = ?auto_140063 ?auto_140065 ) ) ( not ( = ?auto_140062 ?auto_140065 ) ) ( ON ?auto_140061 ?auto_140060 ) ( ON ?auto_140062 ?auto_140061 ) ( not ( = ?auto_140060 ?auto_140061 ) ) ( not ( = ?auto_140060 ?auto_140062 ) ) ( not ( = ?auto_140060 ?auto_140064 ) ) ( not ( = ?auto_140060 ?auto_140063 ) ) ( not ( = ?auto_140060 ?auto_140065 ) ) ( not ( = ?auto_140061 ?auto_140062 ) ) ( not ( = ?auto_140061 ?auto_140064 ) ) ( not ( = ?auto_140061 ?auto_140063 ) ) ( not ( = ?auto_140061 ?auto_140065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140062 ?auto_140064 ?auto_140063 )
      ( MAKE-4CRATE-VERIFY ?auto_140060 ?auto_140061 ?auto_140062 ?auto_140064 ?auto_140063 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140099 - SURFACE
      ?auto_140100 - SURFACE
      ?auto_140101 - SURFACE
      ?auto_140103 - SURFACE
      ?auto_140102 - SURFACE
    )
    :vars
    (
      ?auto_140106 - HOIST
      ?auto_140108 - PLACE
      ?auto_140109 - PLACE
      ?auto_140105 - HOIST
      ?auto_140107 - SURFACE
      ?auto_140104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140106 ?auto_140108 ) ( SURFACE-AT ?auto_140103 ?auto_140108 ) ( CLEAR ?auto_140103 ) ( IS-CRATE ?auto_140102 ) ( not ( = ?auto_140103 ?auto_140102 ) ) ( AVAILABLE ?auto_140106 ) ( ON ?auto_140103 ?auto_140101 ) ( not ( = ?auto_140101 ?auto_140103 ) ) ( not ( = ?auto_140101 ?auto_140102 ) ) ( not ( = ?auto_140109 ?auto_140108 ) ) ( HOIST-AT ?auto_140105 ?auto_140109 ) ( not ( = ?auto_140106 ?auto_140105 ) ) ( AVAILABLE ?auto_140105 ) ( SURFACE-AT ?auto_140102 ?auto_140109 ) ( ON ?auto_140102 ?auto_140107 ) ( CLEAR ?auto_140102 ) ( not ( = ?auto_140103 ?auto_140107 ) ) ( not ( = ?auto_140102 ?auto_140107 ) ) ( not ( = ?auto_140101 ?auto_140107 ) ) ( TRUCK-AT ?auto_140104 ?auto_140108 ) ( ON ?auto_140100 ?auto_140099 ) ( ON ?auto_140101 ?auto_140100 ) ( not ( = ?auto_140099 ?auto_140100 ) ) ( not ( = ?auto_140099 ?auto_140101 ) ) ( not ( = ?auto_140099 ?auto_140103 ) ) ( not ( = ?auto_140099 ?auto_140102 ) ) ( not ( = ?auto_140099 ?auto_140107 ) ) ( not ( = ?auto_140100 ?auto_140101 ) ) ( not ( = ?auto_140100 ?auto_140103 ) ) ( not ( = ?auto_140100 ?auto_140102 ) ) ( not ( = ?auto_140100 ?auto_140107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140101 ?auto_140103 ?auto_140102 )
      ( MAKE-4CRATE-VERIFY ?auto_140099 ?auto_140100 ?auto_140101 ?auto_140103 ?auto_140102 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140138 - SURFACE
      ?auto_140139 - SURFACE
      ?auto_140140 - SURFACE
      ?auto_140142 - SURFACE
      ?auto_140141 - SURFACE
    )
    :vars
    (
      ?auto_140145 - HOIST
      ?auto_140148 - PLACE
      ?auto_140144 - PLACE
      ?auto_140143 - HOIST
      ?auto_140146 - SURFACE
      ?auto_140147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140145 ?auto_140148 ) ( IS-CRATE ?auto_140141 ) ( not ( = ?auto_140142 ?auto_140141 ) ) ( not ( = ?auto_140140 ?auto_140142 ) ) ( not ( = ?auto_140140 ?auto_140141 ) ) ( not ( = ?auto_140144 ?auto_140148 ) ) ( HOIST-AT ?auto_140143 ?auto_140144 ) ( not ( = ?auto_140145 ?auto_140143 ) ) ( AVAILABLE ?auto_140143 ) ( SURFACE-AT ?auto_140141 ?auto_140144 ) ( ON ?auto_140141 ?auto_140146 ) ( CLEAR ?auto_140141 ) ( not ( = ?auto_140142 ?auto_140146 ) ) ( not ( = ?auto_140141 ?auto_140146 ) ) ( not ( = ?auto_140140 ?auto_140146 ) ) ( TRUCK-AT ?auto_140147 ?auto_140148 ) ( SURFACE-AT ?auto_140140 ?auto_140148 ) ( CLEAR ?auto_140140 ) ( LIFTING ?auto_140145 ?auto_140142 ) ( IS-CRATE ?auto_140142 ) ( ON ?auto_140139 ?auto_140138 ) ( ON ?auto_140140 ?auto_140139 ) ( not ( = ?auto_140138 ?auto_140139 ) ) ( not ( = ?auto_140138 ?auto_140140 ) ) ( not ( = ?auto_140138 ?auto_140142 ) ) ( not ( = ?auto_140138 ?auto_140141 ) ) ( not ( = ?auto_140138 ?auto_140146 ) ) ( not ( = ?auto_140139 ?auto_140140 ) ) ( not ( = ?auto_140139 ?auto_140142 ) ) ( not ( = ?auto_140139 ?auto_140141 ) ) ( not ( = ?auto_140139 ?auto_140146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140140 ?auto_140142 ?auto_140141 )
      ( MAKE-4CRATE-VERIFY ?auto_140138 ?auto_140139 ?auto_140140 ?auto_140142 ?auto_140141 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140177 - SURFACE
      ?auto_140178 - SURFACE
      ?auto_140179 - SURFACE
      ?auto_140181 - SURFACE
      ?auto_140180 - SURFACE
    )
    :vars
    (
      ?auto_140184 - HOIST
      ?auto_140183 - PLACE
      ?auto_140182 - PLACE
      ?auto_140185 - HOIST
      ?auto_140186 - SURFACE
      ?auto_140187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140184 ?auto_140183 ) ( IS-CRATE ?auto_140180 ) ( not ( = ?auto_140181 ?auto_140180 ) ) ( not ( = ?auto_140179 ?auto_140181 ) ) ( not ( = ?auto_140179 ?auto_140180 ) ) ( not ( = ?auto_140182 ?auto_140183 ) ) ( HOIST-AT ?auto_140185 ?auto_140182 ) ( not ( = ?auto_140184 ?auto_140185 ) ) ( AVAILABLE ?auto_140185 ) ( SURFACE-AT ?auto_140180 ?auto_140182 ) ( ON ?auto_140180 ?auto_140186 ) ( CLEAR ?auto_140180 ) ( not ( = ?auto_140181 ?auto_140186 ) ) ( not ( = ?auto_140180 ?auto_140186 ) ) ( not ( = ?auto_140179 ?auto_140186 ) ) ( TRUCK-AT ?auto_140187 ?auto_140183 ) ( SURFACE-AT ?auto_140179 ?auto_140183 ) ( CLEAR ?auto_140179 ) ( IS-CRATE ?auto_140181 ) ( AVAILABLE ?auto_140184 ) ( IN ?auto_140181 ?auto_140187 ) ( ON ?auto_140178 ?auto_140177 ) ( ON ?auto_140179 ?auto_140178 ) ( not ( = ?auto_140177 ?auto_140178 ) ) ( not ( = ?auto_140177 ?auto_140179 ) ) ( not ( = ?auto_140177 ?auto_140181 ) ) ( not ( = ?auto_140177 ?auto_140180 ) ) ( not ( = ?auto_140177 ?auto_140186 ) ) ( not ( = ?auto_140178 ?auto_140179 ) ) ( not ( = ?auto_140178 ?auto_140181 ) ) ( not ( = ?auto_140178 ?auto_140180 ) ) ( not ( = ?auto_140178 ?auto_140186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140179 ?auto_140181 ?auto_140180 )
      ( MAKE-4CRATE-VERIFY ?auto_140177 ?auto_140178 ?auto_140179 ?auto_140181 ?auto_140180 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_140837 - SURFACE
      ?auto_140838 - SURFACE
      ?auto_140839 - SURFACE
      ?auto_140841 - SURFACE
      ?auto_140840 - SURFACE
      ?auto_140842 - SURFACE
    )
    :vars
    (
      ?auto_140843 - HOIST
      ?auto_140844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140843 ?auto_140844 ) ( SURFACE-AT ?auto_140840 ?auto_140844 ) ( CLEAR ?auto_140840 ) ( LIFTING ?auto_140843 ?auto_140842 ) ( IS-CRATE ?auto_140842 ) ( not ( = ?auto_140840 ?auto_140842 ) ) ( ON ?auto_140838 ?auto_140837 ) ( ON ?auto_140839 ?auto_140838 ) ( ON ?auto_140841 ?auto_140839 ) ( ON ?auto_140840 ?auto_140841 ) ( not ( = ?auto_140837 ?auto_140838 ) ) ( not ( = ?auto_140837 ?auto_140839 ) ) ( not ( = ?auto_140837 ?auto_140841 ) ) ( not ( = ?auto_140837 ?auto_140840 ) ) ( not ( = ?auto_140837 ?auto_140842 ) ) ( not ( = ?auto_140838 ?auto_140839 ) ) ( not ( = ?auto_140838 ?auto_140841 ) ) ( not ( = ?auto_140838 ?auto_140840 ) ) ( not ( = ?auto_140838 ?auto_140842 ) ) ( not ( = ?auto_140839 ?auto_140841 ) ) ( not ( = ?auto_140839 ?auto_140840 ) ) ( not ( = ?auto_140839 ?auto_140842 ) ) ( not ( = ?auto_140841 ?auto_140840 ) ) ( not ( = ?auto_140841 ?auto_140842 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140840 ?auto_140842 )
      ( MAKE-5CRATE-VERIFY ?auto_140837 ?auto_140838 ?auto_140839 ?auto_140841 ?auto_140840 ?auto_140842 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_140871 - SURFACE
      ?auto_140872 - SURFACE
      ?auto_140873 - SURFACE
      ?auto_140875 - SURFACE
      ?auto_140874 - SURFACE
      ?auto_140876 - SURFACE
    )
    :vars
    (
      ?auto_140877 - HOIST
      ?auto_140879 - PLACE
      ?auto_140878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140877 ?auto_140879 ) ( SURFACE-AT ?auto_140874 ?auto_140879 ) ( CLEAR ?auto_140874 ) ( IS-CRATE ?auto_140876 ) ( not ( = ?auto_140874 ?auto_140876 ) ) ( TRUCK-AT ?auto_140878 ?auto_140879 ) ( AVAILABLE ?auto_140877 ) ( IN ?auto_140876 ?auto_140878 ) ( ON ?auto_140874 ?auto_140875 ) ( not ( = ?auto_140875 ?auto_140874 ) ) ( not ( = ?auto_140875 ?auto_140876 ) ) ( ON ?auto_140872 ?auto_140871 ) ( ON ?auto_140873 ?auto_140872 ) ( ON ?auto_140875 ?auto_140873 ) ( not ( = ?auto_140871 ?auto_140872 ) ) ( not ( = ?auto_140871 ?auto_140873 ) ) ( not ( = ?auto_140871 ?auto_140875 ) ) ( not ( = ?auto_140871 ?auto_140874 ) ) ( not ( = ?auto_140871 ?auto_140876 ) ) ( not ( = ?auto_140872 ?auto_140873 ) ) ( not ( = ?auto_140872 ?auto_140875 ) ) ( not ( = ?auto_140872 ?auto_140874 ) ) ( not ( = ?auto_140872 ?auto_140876 ) ) ( not ( = ?auto_140873 ?auto_140875 ) ) ( not ( = ?auto_140873 ?auto_140874 ) ) ( not ( = ?auto_140873 ?auto_140876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140875 ?auto_140874 ?auto_140876 )
      ( MAKE-5CRATE-VERIFY ?auto_140871 ?auto_140872 ?auto_140873 ?auto_140875 ?auto_140874 ?auto_140876 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_140911 - SURFACE
      ?auto_140912 - SURFACE
      ?auto_140913 - SURFACE
      ?auto_140915 - SURFACE
      ?auto_140914 - SURFACE
      ?auto_140916 - SURFACE
    )
    :vars
    (
      ?auto_140918 - HOIST
      ?auto_140917 - PLACE
      ?auto_140920 - TRUCK
      ?auto_140919 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140918 ?auto_140917 ) ( SURFACE-AT ?auto_140914 ?auto_140917 ) ( CLEAR ?auto_140914 ) ( IS-CRATE ?auto_140916 ) ( not ( = ?auto_140914 ?auto_140916 ) ) ( AVAILABLE ?auto_140918 ) ( IN ?auto_140916 ?auto_140920 ) ( ON ?auto_140914 ?auto_140915 ) ( not ( = ?auto_140915 ?auto_140914 ) ) ( not ( = ?auto_140915 ?auto_140916 ) ) ( TRUCK-AT ?auto_140920 ?auto_140919 ) ( not ( = ?auto_140919 ?auto_140917 ) ) ( ON ?auto_140912 ?auto_140911 ) ( ON ?auto_140913 ?auto_140912 ) ( ON ?auto_140915 ?auto_140913 ) ( not ( = ?auto_140911 ?auto_140912 ) ) ( not ( = ?auto_140911 ?auto_140913 ) ) ( not ( = ?auto_140911 ?auto_140915 ) ) ( not ( = ?auto_140911 ?auto_140914 ) ) ( not ( = ?auto_140911 ?auto_140916 ) ) ( not ( = ?auto_140912 ?auto_140913 ) ) ( not ( = ?auto_140912 ?auto_140915 ) ) ( not ( = ?auto_140912 ?auto_140914 ) ) ( not ( = ?auto_140912 ?auto_140916 ) ) ( not ( = ?auto_140913 ?auto_140915 ) ) ( not ( = ?auto_140913 ?auto_140914 ) ) ( not ( = ?auto_140913 ?auto_140916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140915 ?auto_140914 ?auto_140916 )
      ( MAKE-5CRATE-VERIFY ?auto_140911 ?auto_140912 ?auto_140913 ?auto_140915 ?auto_140914 ?auto_140916 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_140956 - SURFACE
      ?auto_140957 - SURFACE
      ?auto_140958 - SURFACE
      ?auto_140960 - SURFACE
      ?auto_140959 - SURFACE
      ?auto_140961 - SURFACE
    )
    :vars
    (
      ?auto_140964 - HOIST
      ?auto_140962 - PLACE
      ?auto_140965 - TRUCK
      ?auto_140966 - PLACE
      ?auto_140963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_140964 ?auto_140962 ) ( SURFACE-AT ?auto_140959 ?auto_140962 ) ( CLEAR ?auto_140959 ) ( IS-CRATE ?auto_140961 ) ( not ( = ?auto_140959 ?auto_140961 ) ) ( AVAILABLE ?auto_140964 ) ( ON ?auto_140959 ?auto_140960 ) ( not ( = ?auto_140960 ?auto_140959 ) ) ( not ( = ?auto_140960 ?auto_140961 ) ) ( TRUCK-AT ?auto_140965 ?auto_140966 ) ( not ( = ?auto_140966 ?auto_140962 ) ) ( HOIST-AT ?auto_140963 ?auto_140966 ) ( LIFTING ?auto_140963 ?auto_140961 ) ( not ( = ?auto_140964 ?auto_140963 ) ) ( ON ?auto_140957 ?auto_140956 ) ( ON ?auto_140958 ?auto_140957 ) ( ON ?auto_140960 ?auto_140958 ) ( not ( = ?auto_140956 ?auto_140957 ) ) ( not ( = ?auto_140956 ?auto_140958 ) ) ( not ( = ?auto_140956 ?auto_140960 ) ) ( not ( = ?auto_140956 ?auto_140959 ) ) ( not ( = ?auto_140956 ?auto_140961 ) ) ( not ( = ?auto_140957 ?auto_140958 ) ) ( not ( = ?auto_140957 ?auto_140960 ) ) ( not ( = ?auto_140957 ?auto_140959 ) ) ( not ( = ?auto_140957 ?auto_140961 ) ) ( not ( = ?auto_140958 ?auto_140960 ) ) ( not ( = ?auto_140958 ?auto_140959 ) ) ( not ( = ?auto_140958 ?auto_140961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140960 ?auto_140959 ?auto_140961 )
      ( MAKE-5CRATE-VERIFY ?auto_140956 ?auto_140957 ?auto_140958 ?auto_140960 ?auto_140959 ?auto_140961 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141006 - SURFACE
      ?auto_141007 - SURFACE
      ?auto_141008 - SURFACE
      ?auto_141010 - SURFACE
      ?auto_141009 - SURFACE
      ?auto_141011 - SURFACE
    )
    :vars
    (
      ?auto_141016 - HOIST
      ?auto_141014 - PLACE
      ?auto_141017 - TRUCK
      ?auto_141012 - PLACE
      ?auto_141013 - HOIST
      ?auto_141015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141016 ?auto_141014 ) ( SURFACE-AT ?auto_141009 ?auto_141014 ) ( CLEAR ?auto_141009 ) ( IS-CRATE ?auto_141011 ) ( not ( = ?auto_141009 ?auto_141011 ) ) ( AVAILABLE ?auto_141016 ) ( ON ?auto_141009 ?auto_141010 ) ( not ( = ?auto_141010 ?auto_141009 ) ) ( not ( = ?auto_141010 ?auto_141011 ) ) ( TRUCK-AT ?auto_141017 ?auto_141012 ) ( not ( = ?auto_141012 ?auto_141014 ) ) ( HOIST-AT ?auto_141013 ?auto_141012 ) ( not ( = ?auto_141016 ?auto_141013 ) ) ( AVAILABLE ?auto_141013 ) ( SURFACE-AT ?auto_141011 ?auto_141012 ) ( ON ?auto_141011 ?auto_141015 ) ( CLEAR ?auto_141011 ) ( not ( = ?auto_141009 ?auto_141015 ) ) ( not ( = ?auto_141011 ?auto_141015 ) ) ( not ( = ?auto_141010 ?auto_141015 ) ) ( ON ?auto_141007 ?auto_141006 ) ( ON ?auto_141008 ?auto_141007 ) ( ON ?auto_141010 ?auto_141008 ) ( not ( = ?auto_141006 ?auto_141007 ) ) ( not ( = ?auto_141006 ?auto_141008 ) ) ( not ( = ?auto_141006 ?auto_141010 ) ) ( not ( = ?auto_141006 ?auto_141009 ) ) ( not ( = ?auto_141006 ?auto_141011 ) ) ( not ( = ?auto_141006 ?auto_141015 ) ) ( not ( = ?auto_141007 ?auto_141008 ) ) ( not ( = ?auto_141007 ?auto_141010 ) ) ( not ( = ?auto_141007 ?auto_141009 ) ) ( not ( = ?auto_141007 ?auto_141011 ) ) ( not ( = ?auto_141007 ?auto_141015 ) ) ( not ( = ?auto_141008 ?auto_141010 ) ) ( not ( = ?auto_141008 ?auto_141009 ) ) ( not ( = ?auto_141008 ?auto_141011 ) ) ( not ( = ?auto_141008 ?auto_141015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141010 ?auto_141009 ?auto_141011 )
      ( MAKE-5CRATE-VERIFY ?auto_141006 ?auto_141007 ?auto_141008 ?auto_141010 ?auto_141009 ?auto_141011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141057 - SURFACE
      ?auto_141058 - SURFACE
      ?auto_141059 - SURFACE
      ?auto_141061 - SURFACE
      ?auto_141060 - SURFACE
      ?auto_141062 - SURFACE
    )
    :vars
    (
      ?auto_141065 - HOIST
      ?auto_141064 - PLACE
      ?auto_141066 - PLACE
      ?auto_141063 - HOIST
      ?auto_141068 - SURFACE
      ?auto_141067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141065 ?auto_141064 ) ( SURFACE-AT ?auto_141060 ?auto_141064 ) ( CLEAR ?auto_141060 ) ( IS-CRATE ?auto_141062 ) ( not ( = ?auto_141060 ?auto_141062 ) ) ( AVAILABLE ?auto_141065 ) ( ON ?auto_141060 ?auto_141061 ) ( not ( = ?auto_141061 ?auto_141060 ) ) ( not ( = ?auto_141061 ?auto_141062 ) ) ( not ( = ?auto_141066 ?auto_141064 ) ) ( HOIST-AT ?auto_141063 ?auto_141066 ) ( not ( = ?auto_141065 ?auto_141063 ) ) ( AVAILABLE ?auto_141063 ) ( SURFACE-AT ?auto_141062 ?auto_141066 ) ( ON ?auto_141062 ?auto_141068 ) ( CLEAR ?auto_141062 ) ( not ( = ?auto_141060 ?auto_141068 ) ) ( not ( = ?auto_141062 ?auto_141068 ) ) ( not ( = ?auto_141061 ?auto_141068 ) ) ( TRUCK-AT ?auto_141067 ?auto_141064 ) ( ON ?auto_141058 ?auto_141057 ) ( ON ?auto_141059 ?auto_141058 ) ( ON ?auto_141061 ?auto_141059 ) ( not ( = ?auto_141057 ?auto_141058 ) ) ( not ( = ?auto_141057 ?auto_141059 ) ) ( not ( = ?auto_141057 ?auto_141061 ) ) ( not ( = ?auto_141057 ?auto_141060 ) ) ( not ( = ?auto_141057 ?auto_141062 ) ) ( not ( = ?auto_141057 ?auto_141068 ) ) ( not ( = ?auto_141058 ?auto_141059 ) ) ( not ( = ?auto_141058 ?auto_141061 ) ) ( not ( = ?auto_141058 ?auto_141060 ) ) ( not ( = ?auto_141058 ?auto_141062 ) ) ( not ( = ?auto_141058 ?auto_141068 ) ) ( not ( = ?auto_141059 ?auto_141061 ) ) ( not ( = ?auto_141059 ?auto_141060 ) ) ( not ( = ?auto_141059 ?auto_141062 ) ) ( not ( = ?auto_141059 ?auto_141068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141061 ?auto_141060 ?auto_141062 )
      ( MAKE-5CRATE-VERIFY ?auto_141057 ?auto_141058 ?auto_141059 ?auto_141061 ?auto_141060 ?auto_141062 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141108 - SURFACE
      ?auto_141109 - SURFACE
      ?auto_141110 - SURFACE
      ?auto_141112 - SURFACE
      ?auto_141111 - SURFACE
      ?auto_141113 - SURFACE
    )
    :vars
    (
      ?auto_141114 - HOIST
      ?auto_141119 - PLACE
      ?auto_141116 - PLACE
      ?auto_141115 - HOIST
      ?auto_141118 - SURFACE
      ?auto_141117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141114 ?auto_141119 ) ( IS-CRATE ?auto_141113 ) ( not ( = ?auto_141111 ?auto_141113 ) ) ( not ( = ?auto_141112 ?auto_141111 ) ) ( not ( = ?auto_141112 ?auto_141113 ) ) ( not ( = ?auto_141116 ?auto_141119 ) ) ( HOIST-AT ?auto_141115 ?auto_141116 ) ( not ( = ?auto_141114 ?auto_141115 ) ) ( AVAILABLE ?auto_141115 ) ( SURFACE-AT ?auto_141113 ?auto_141116 ) ( ON ?auto_141113 ?auto_141118 ) ( CLEAR ?auto_141113 ) ( not ( = ?auto_141111 ?auto_141118 ) ) ( not ( = ?auto_141113 ?auto_141118 ) ) ( not ( = ?auto_141112 ?auto_141118 ) ) ( TRUCK-AT ?auto_141117 ?auto_141119 ) ( SURFACE-AT ?auto_141112 ?auto_141119 ) ( CLEAR ?auto_141112 ) ( LIFTING ?auto_141114 ?auto_141111 ) ( IS-CRATE ?auto_141111 ) ( ON ?auto_141109 ?auto_141108 ) ( ON ?auto_141110 ?auto_141109 ) ( ON ?auto_141112 ?auto_141110 ) ( not ( = ?auto_141108 ?auto_141109 ) ) ( not ( = ?auto_141108 ?auto_141110 ) ) ( not ( = ?auto_141108 ?auto_141112 ) ) ( not ( = ?auto_141108 ?auto_141111 ) ) ( not ( = ?auto_141108 ?auto_141113 ) ) ( not ( = ?auto_141108 ?auto_141118 ) ) ( not ( = ?auto_141109 ?auto_141110 ) ) ( not ( = ?auto_141109 ?auto_141112 ) ) ( not ( = ?auto_141109 ?auto_141111 ) ) ( not ( = ?auto_141109 ?auto_141113 ) ) ( not ( = ?auto_141109 ?auto_141118 ) ) ( not ( = ?auto_141110 ?auto_141112 ) ) ( not ( = ?auto_141110 ?auto_141111 ) ) ( not ( = ?auto_141110 ?auto_141113 ) ) ( not ( = ?auto_141110 ?auto_141118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141112 ?auto_141111 ?auto_141113 )
      ( MAKE-5CRATE-VERIFY ?auto_141108 ?auto_141109 ?auto_141110 ?auto_141112 ?auto_141111 ?auto_141113 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141159 - SURFACE
      ?auto_141160 - SURFACE
      ?auto_141161 - SURFACE
      ?auto_141163 - SURFACE
      ?auto_141162 - SURFACE
      ?auto_141164 - SURFACE
    )
    :vars
    (
      ?auto_141168 - HOIST
      ?auto_141165 - PLACE
      ?auto_141170 - PLACE
      ?auto_141169 - HOIST
      ?auto_141167 - SURFACE
      ?auto_141166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141168 ?auto_141165 ) ( IS-CRATE ?auto_141164 ) ( not ( = ?auto_141162 ?auto_141164 ) ) ( not ( = ?auto_141163 ?auto_141162 ) ) ( not ( = ?auto_141163 ?auto_141164 ) ) ( not ( = ?auto_141170 ?auto_141165 ) ) ( HOIST-AT ?auto_141169 ?auto_141170 ) ( not ( = ?auto_141168 ?auto_141169 ) ) ( AVAILABLE ?auto_141169 ) ( SURFACE-AT ?auto_141164 ?auto_141170 ) ( ON ?auto_141164 ?auto_141167 ) ( CLEAR ?auto_141164 ) ( not ( = ?auto_141162 ?auto_141167 ) ) ( not ( = ?auto_141164 ?auto_141167 ) ) ( not ( = ?auto_141163 ?auto_141167 ) ) ( TRUCK-AT ?auto_141166 ?auto_141165 ) ( SURFACE-AT ?auto_141163 ?auto_141165 ) ( CLEAR ?auto_141163 ) ( IS-CRATE ?auto_141162 ) ( AVAILABLE ?auto_141168 ) ( IN ?auto_141162 ?auto_141166 ) ( ON ?auto_141160 ?auto_141159 ) ( ON ?auto_141161 ?auto_141160 ) ( ON ?auto_141163 ?auto_141161 ) ( not ( = ?auto_141159 ?auto_141160 ) ) ( not ( = ?auto_141159 ?auto_141161 ) ) ( not ( = ?auto_141159 ?auto_141163 ) ) ( not ( = ?auto_141159 ?auto_141162 ) ) ( not ( = ?auto_141159 ?auto_141164 ) ) ( not ( = ?auto_141159 ?auto_141167 ) ) ( not ( = ?auto_141160 ?auto_141161 ) ) ( not ( = ?auto_141160 ?auto_141163 ) ) ( not ( = ?auto_141160 ?auto_141162 ) ) ( not ( = ?auto_141160 ?auto_141164 ) ) ( not ( = ?auto_141160 ?auto_141167 ) ) ( not ( = ?auto_141161 ?auto_141163 ) ) ( not ( = ?auto_141161 ?auto_141162 ) ) ( not ( = ?auto_141161 ?auto_141164 ) ) ( not ( = ?auto_141161 ?auto_141167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141163 ?auto_141162 ?auto_141164 )
      ( MAKE-5CRATE-VERIFY ?auto_141159 ?auto_141160 ?auto_141161 ?auto_141163 ?auto_141162 ?auto_141164 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142368 - SURFACE
      ?auto_142369 - SURFACE
      ?auto_142370 - SURFACE
      ?auto_142372 - SURFACE
      ?auto_142371 - SURFACE
      ?auto_142373 - SURFACE
      ?auto_142374 - SURFACE
    )
    :vars
    (
      ?auto_142375 - HOIST
      ?auto_142376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142375 ?auto_142376 ) ( SURFACE-AT ?auto_142373 ?auto_142376 ) ( CLEAR ?auto_142373 ) ( LIFTING ?auto_142375 ?auto_142374 ) ( IS-CRATE ?auto_142374 ) ( not ( = ?auto_142373 ?auto_142374 ) ) ( ON ?auto_142369 ?auto_142368 ) ( ON ?auto_142370 ?auto_142369 ) ( ON ?auto_142372 ?auto_142370 ) ( ON ?auto_142371 ?auto_142372 ) ( ON ?auto_142373 ?auto_142371 ) ( not ( = ?auto_142368 ?auto_142369 ) ) ( not ( = ?auto_142368 ?auto_142370 ) ) ( not ( = ?auto_142368 ?auto_142372 ) ) ( not ( = ?auto_142368 ?auto_142371 ) ) ( not ( = ?auto_142368 ?auto_142373 ) ) ( not ( = ?auto_142368 ?auto_142374 ) ) ( not ( = ?auto_142369 ?auto_142370 ) ) ( not ( = ?auto_142369 ?auto_142372 ) ) ( not ( = ?auto_142369 ?auto_142371 ) ) ( not ( = ?auto_142369 ?auto_142373 ) ) ( not ( = ?auto_142369 ?auto_142374 ) ) ( not ( = ?auto_142370 ?auto_142372 ) ) ( not ( = ?auto_142370 ?auto_142371 ) ) ( not ( = ?auto_142370 ?auto_142373 ) ) ( not ( = ?auto_142370 ?auto_142374 ) ) ( not ( = ?auto_142372 ?auto_142371 ) ) ( not ( = ?auto_142372 ?auto_142373 ) ) ( not ( = ?auto_142372 ?auto_142374 ) ) ( not ( = ?auto_142371 ?auto_142373 ) ) ( not ( = ?auto_142371 ?auto_142374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_142373 ?auto_142374 )
      ( MAKE-6CRATE-VERIFY ?auto_142368 ?auto_142369 ?auto_142370 ?auto_142372 ?auto_142371 ?auto_142373 ?auto_142374 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142412 - SURFACE
      ?auto_142413 - SURFACE
      ?auto_142414 - SURFACE
      ?auto_142416 - SURFACE
      ?auto_142415 - SURFACE
      ?auto_142417 - SURFACE
      ?auto_142418 - SURFACE
    )
    :vars
    (
      ?auto_142420 - HOIST
      ?auto_142419 - PLACE
      ?auto_142421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142420 ?auto_142419 ) ( SURFACE-AT ?auto_142417 ?auto_142419 ) ( CLEAR ?auto_142417 ) ( IS-CRATE ?auto_142418 ) ( not ( = ?auto_142417 ?auto_142418 ) ) ( TRUCK-AT ?auto_142421 ?auto_142419 ) ( AVAILABLE ?auto_142420 ) ( IN ?auto_142418 ?auto_142421 ) ( ON ?auto_142417 ?auto_142415 ) ( not ( = ?auto_142415 ?auto_142417 ) ) ( not ( = ?auto_142415 ?auto_142418 ) ) ( ON ?auto_142413 ?auto_142412 ) ( ON ?auto_142414 ?auto_142413 ) ( ON ?auto_142416 ?auto_142414 ) ( ON ?auto_142415 ?auto_142416 ) ( not ( = ?auto_142412 ?auto_142413 ) ) ( not ( = ?auto_142412 ?auto_142414 ) ) ( not ( = ?auto_142412 ?auto_142416 ) ) ( not ( = ?auto_142412 ?auto_142415 ) ) ( not ( = ?auto_142412 ?auto_142417 ) ) ( not ( = ?auto_142412 ?auto_142418 ) ) ( not ( = ?auto_142413 ?auto_142414 ) ) ( not ( = ?auto_142413 ?auto_142416 ) ) ( not ( = ?auto_142413 ?auto_142415 ) ) ( not ( = ?auto_142413 ?auto_142417 ) ) ( not ( = ?auto_142413 ?auto_142418 ) ) ( not ( = ?auto_142414 ?auto_142416 ) ) ( not ( = ?auto_142414 ?auto_142415 ) ) ( not ( = ?auto_142414 ?auto_142417 ) ) ( not ( = ?auto_142414 ?auto_142418 ) ) ( not ( = ?auto_142416 ?auto_142415 ) ) ( not ( = ?auto_142416 ?auto_142417 ) ) ( not ( = ?auto_142416 ?auto_142418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142415 ?auto_142417 ?auto_142418 )
      ( MAKE-6CRATE-VERIFY ?auto_142412 ?auto_142413 ?auto_142414 ?auto_142416 ?auto_142415 ?auto_142417 ?auto_142418 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142463 - SURFACE
      ?auto_142464 - SURFACE
      ?auto_142465 - SURFACE
      ?auto_142467 - SURFACE
      ?auto_142466 - SURFACE
      ?auto_142468 - SURFACE
      ?auto_142469 - SURFACE
    )
    :vars
    (
      ?auto_142473 - HOIST
      ?auto_142471 - PLACE
      ?auto_142470 - TRUCK
      ?auto_142472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142473 ?auto_142471 ) ( SURFACE-AT ?auto_142468 ?auto_142471 ) ( CLEAR ?auto_142468 ) ( IS-CRATE ?auto_142469 ) ( not ( = ?auto_142468 ?auto_142469 ) ) ( AVAILABLE ?auto_142473 ) ( IN ?auto_142469 ?auto_142470 ) ( ON ?auto_142468 ?auto_142466 ) ( not ( = ?auto_142466 ?auto_142468 ) ) ( not ( = ?auto_142466 ?auto_142469 ) ) ( TRUCK-AT ?auto_142470 ?auto_142472 ) ( not ( = ?auto_142472 ?auto_142471 ) ) ( ON ?auto_142464 ?auto_142463 ) ( ON ?auto_142465 ?auto_142464 ) ( ON ?auto_142467 ?auto_142465 ) ( ON ?auto_142466 ?auto_142467 ) ( not ( = ?auto_142463 ?auto_142464 ) ) ( not ( = ?auto_142463 ?auto_142465 ) ) ( not ( = ?auto_142463 ?auto_142467 ) ) ( not ( = ?auto_142463 ?auto_142466 ) ) ( not ( = ?auto_142463 ?auto_142468 ) ) ( not ( = ?auto_142463 ?auto_142469 ) ) ( not ( = ?auto_142464 ?auto_142465 ) ) ( not ( = ?auto_142464 ?auto_142467 ) ) ( not ( = ?auto_142464 ?auto_142466 ) ) ( not ( = ?auto_142464 ?auto_142468 ) ) ( not ( = ?auto_142464 ?auto_142469 ) ) ( not ( = ?auto_142465 ?auto_142467 ) ) ( not ( = ?auto_142465 ?auto_142466 ) ) ( not ( = ?auto_142465 ?auto_142468 ) ) ( not ( = ?auto_142465 ?auto_142469 ) ) ( not ( = ?auto_142467 ?auto_142466 ) ) ( not ( = ?auto_142467 ?auto_142468 ) ) ( not ( = ?auto_142467 ?auto_142469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142466 ?auto_142468 ?auto_142469 )
      ( MAKE-6CRATE-VERIFY ?auto_142463 ?auto_142464 ?auto_142465 ?auto_142467 ?auto_142466 ?auto_142468 ?auto_142469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142520 - SURFACE
      ?auto_142521 - SURFACE
      ?auto_142522 - SURFACE
      ?auto_142524 - SURFACE
      ?auto_142523 - SURFACE
      ?auto_142525 - SURFACE
      ?auto_142526 - SURFACE
    )
    :vars
    (
      ?auto_142528 - HOIST
      ?auto_142529 - PLACE
      ?auto_142527 - TRUCK
      ?auto_142531 - PLACE
      ?auto_142530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_142528 ?auto_142529 ) ( SURFACE-AT ?auto_142525 ?auto_142529 ) ( CLEAR ?auto_142525 ) ( IS-CRATE ?auto_142526 ) ( not ( = ?auto_142525 ?auto_142526 ) ) ( AVAILABLE ?auto_142528 ) ( ON ?auto_142525 ?auto_142523 ) ( not ( = ?auto_142523 ?auto_142525 ) ) ( not ( = ?auto_142523 ?auto_142526 ) ) ( TRUCK-AT ?auto_142527 ?auto_142531 ) ( not ( = ?auto_142531 ?auto_142529 ) ) ( HOIST-AT ?auto_142530 ?auto_142531 ) ( LIFTING ?auto_142530 ?auto_142526 ) ( not ( = ?auto_142528 ?auto_142530 ) ) ( ON ?auto_142521 ?auto_142520 ) ( ON ?auto_142522 ?auto_142521 ) ( ON ?auto_142524 ?auto_142522 ) ( ON ?auto_142523 ?auto_142524 ) ( not ( = ?auto_142520 ?auto_142521 ) ) ( not ( = ?auto_142520 ?auto_142522 ) ) ( not ( = ?auto_142520 ?auto_142524 ) ) ( not ( = ?auto_142520 ?auto_142523 ) ) ( not ( = ?auto_142520 ?auto_142525 ) ) ( not ( = ?auto_142520 ?auto_142526 ) ) ( not ( = ?auto_142521 ?auto_142522 ) ) ( not ( = ?auto_142521 ?auto_142524 ) ) ( not ( = ?auto_142521 ?auto_142523 ) ) ( not ( = ?auto_142521 ?auto_142525 ) ) ( not ( = ?auto_142521 ?auto_142526 ) ) ( not ( = ?auto_142522 ?auto_142524 ) ) ( not ( = ?auto_142522 ?auto_142523 ) ) ( not ( = ?auto_142522 ?auto_142525 ) ) ( not ( = ?auto_142522 ?auto_142526 ) ) ( not ( = ?auto_142524 ?auto_142523 ) ) ( not ( = ?auto_142524 ?auto_142525 ) ) ( not ( = ?auto_142524 ?auto_142526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142523 ?auto_142525 ?auto_142526 )
      ( MAKE-6CRATE-VERIFY ?auto_142520 ?auto_142521 ?auto_142522 ?auto_142524 ?auto_142523 ?auto_142525 ?auto_142526 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142583 - SURFACE
      ?auto_142584 - SURFACE
      ?auto_142585 - SURFACE
      ?auto_142587 - SURFACE
      ?auto_142586 - SURFACE
      ?auto_142588 - SURFACE
      ?auto_142589 - SURFACE
    )
    :vars
    (
      ?auto_142594 - HOIST
      ?auto_142593 - PLACE
      ?auto_142592 - TRUCK
      ?auto_142595 - PLACE
      ?auto_142591 - HOIST
      ?auto_142590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142594 ?auto_142593 ) ( SURFACE-AT ?auto_142588 ?auto_142593 ) ( CLEAR ?auto_142588 ) ( IS-CRATE ?auto_142589 ) ( not ( = ?auto_142588 ?auto_142589 ) ) ( AVAILABLE ?auto_142594 ) ( ON ?auto_142588 ?auto_142586 ) ( not ( = ?auto_142586 ?auto_142588 ) ) ( not ( = ?auto_142586 ?auto_142589 ) ) ( TRUCK-AT ?auto_142592 ?auto_142595 ) ( not ( = ?auto_142595 ?auto_142593 ) ) ( HOIST-AT ?auto_142591 ?auto_142595 ) ( not ( = ?auto_142594 ?auto_142591 ) ) ( AVAILABLE ?auto_142591 ) ( SURFACE-AT ?auto_142589 ?auto_142595 ) ( ON ?auto_142589 ?auto_142590 ) ( CLEAR ?auto_142589 ) ( not ( = ?auto_142588 ?auto_142590 ) ) ( not ( = ?auto_142589 ?auto_142590 ) ) ( not ( = ?auto_142586 ?auto_142590 ) ) ( ON ?auto_142584 ?auto_142583 ) ( ON ?auto_142585 ?auto_142584 ) ( ON ?auto_142587 ?auto_142585 ) ( ON ?auto_142586 ?auto_142587 ) ( not ( = ?auto_142583 ?auto_142584 ) ) ( not ( = ?auto_142583 ?auto_142585 ) ) ( not ( = ?auto_142583 ?auto_142587 ) ) ( not ( = ?auto_142583 ?auto_142586 ) ) ( not ( = ?auto_142583 ?auto_142588 ) ) ( not ( = ?auto_142583 ?auto_142589 ) ) ( not ( = ?auto_142583 ?auto_142590 ) ) ( not ( = ?auto_142584 ?auto_142585 ) ) ( not ( = ?auto_142584 ?auto_142587 ) ) ( not ( = ?auto_142584 ?auto_142586 ) ) ( not ( = ?auto_142584 ?auto_142588 ) ) ( not ( = ?auto_142584 ?auto_142589 ) ) ( not ( = ?auto_142584 ?auto_142590 ) ) ( not ( = ?auto_142585 ?auto_142587 ) ) ( not ( = ?auto_142585 ?auto_142586 ) ) ( not ( = ?auto_142585 ?auto_142588 ) ) ( not ( = ?auto_142585 ?auto_142589 ) ) ( not ( = ?auto_142585 ?auto_142590 ) ) ( not ( = ?auto_142587 ?auto_142586 ) ) ( not ( = ?auto_142587 ?auto_142588 ) ) ( not ( = ?auto_142587 ?auto_142589 ) ) ( not ( = ?auto_142587 ?auto_142590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142586 ?auto_142588 ?auto_142589 )
      ( MAKE-6CRATE-VERIFY ?auto_142583 ?auto_142584 ?auto_142585 ?auto_142587 ?auto_142586 ?auto_142588 ?auto_142589 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142647 - SURFACE
      ?auto_142648 - SURFACE
      ?auto_142649 - SURFACE
      ?auto_142651 - SURFACE
      ?auto_142650 - SURFACE
      ?auto_142652 - SURFACE
      ?auto_142653 - SURFACE
    )
    :vars
    (
      ?auto_142654 - HOIST
      ?auto_142657 - PLACE
      ?auto_142658 - PLACE
      ?auto_142655 - HOIST
      ?auto_142659 - SURFACE
      ?auto_142656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142654 ?auto_142657 ) ( SURFACE-AT ?auto_142652 ?auto_142657 ) ( CLEAR ?auto_142652 ) ( IS-CRATE ?auto_142653 ) ( not ( = ?auto_142652 ?auto_142653 ) ) ( AVAILABLE ?auto_142654 ) ( ON ?auto_142652 ?auto_142650 ) ( not ( = ?auto_142650 ?auto_142652 ) ) ( not ( = ?auto_142650 ?auto_142653 ) ) ( not ( = ?auto_142658 ?auto_142657 ) ) ( HOIST-AT ?auto_142655 ?auto_142658 ) ( not ( = ?auto_142654 ?auto_142655 ) ) ( AVAILABLE ?auto_142655 ) ( SURFACE-AT ?auto_142653 ?auto_142658 ) ( ON ?auto_142653 ?auto_142659 ) ( CLEAR ?auto_142653 ) ( not ( = ?auto_142652 ?auto_142659 ) ) ( not ( = ?auto_142653 ?auto_142659 ) ) ( not ( = ?auto_142650 ?auto_142659 ) ) ( TRUCK-AT ?auto_142656 ?auto_142657 ) ( ON ?auto_142648 ?auto_142647 ) ( ON ?auto_142649 ?auto_142648 ) ( ON ?auto_142651 ?auto_142649 ) ( ON ?auto_142650 ?auto_142651 ) ( not ( = ?auto_142647 ?auto_142648 ) ) ( not ( = ?auto_142647 ?auto_142649 ) ) ( not ( = ?auto_142647 ?auto_142651 ) ) ( not ( = ?auto_142647 ?auto_142650 ) ) ( not ( = ?auto_142647 ?auto_142652 ) ) ( not ( = ?auto_142647 ?auto_142653 ) ) ( not ( = ?auto_142647 ?auto_142659 ) ) ( not ( = ?auto_142648 ?auto_142649 ) ) ( not ( = ?auto_142648 ?auto_142651 ) ) ( not ( = ?auto_142648 ?auto_142650 ) ) ( not ( = ?auto_142648 ?auto_142652 ) ) ( not ( = ?auto_142648 ?auto_142653 ) ) ( not ( = ?auto_142648 ?auto_142659 ) ) ( not ( = ?auto_142649 ?auto_142651 ) ) ( not ( = ?auto_142649 ?auto_142650 ) ) ( not ( = ?auto_142649 ?auto_142652 ) ) ( not ( = ?auto_142649 ?auto_142653 ) ) ( not ( = ?auto_142649 ?auto_142659 ) ) ( not ( = ?auto_142651 ?auto_142650 ) ) ( not ( = ?auto_142651 ?auto_142652 ) ) ( not ( = ?auto_142651 ?auto_142653 ) ) ( not ( = ?auto_142651 ?auto_142659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142650 ?auto_142652 ?auto_142653 )
      ( MAKE-6CRATE-VERIFY ?auto_142647 ?auto_142648 ?auto_142649 ?auto_142651 ?auto_142650 ?auto_142652 ?auto_142653 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142711 - SURFACE
      ?auto_142712 - SURFACE
      ?auto_142713 - SURFACE
      ?auto_142715 - SURFACE
      ?auto_142714 - SURFACE
      ?auto_142716 - SURFACE
      ?auto_142717 - SURFACE
    )
    :vars
    (
      ?auto_142721 - HOIST
      ?auto_142722 - PLACE
      ?auto_142718 - PLACE
      ?auto_142723 - HOIST
      ?auto_142719 - SURFACE
      ?auto_142720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142721 ?auto_142722 ) ( IS-CRATE ?auto_142717 ) ( not ( = ?auto_142716 ?auto_142717 ) ) ( not ( = ?auto_142714 ?auto_142716 ) ) ( not ( = ?auto_142714 ?auto_142717 ) ) ( not ( = ?auto_142718 ?auto_142722 ) ) ( HOIST-AT ?auto_142723 ?auto_142718 ) ( not ( = ?auto_142721 ?auto_142723 ) ) ( AVAILABLE ?auto_142723 ) ( SURFACE-AT ?auto_142717 ?auto_142718 ) ( ON ?auto_142717 ?auto_142719 ) ( CLEAR ?auto_142717 ) ( not ( = ?auto_142716 ?auto_142719 ) ) ( not ( = ?auto_142717 ?auto_142719 ) ) ( not ( = ?auto_142714 ?auto_142719 ) ) ( TRUCK-AT ?auto_142720 ?auto_142722 ) ( SURFACE-AT ?auto_142714 ?auto_142722 ) ( CLEAR ?auto_142714 ) ( LIFTING ?auto_142721 ?auto_142716 ) ( IS-CRATE ?auto_142716 ) ( ON ?auto_142712 ?auto_142711 ) ( ON ?auto_142713 ?auto_142712 ) ( ON ?auto_142715 ?auto_142713 ) ( ON ?auto_142714 ?auto_142715 ) ( not ( = ?auto_142711 ?auto_142712 ) ) ( not ( = ?auto_142711 ?auto_142713 ) ) ( not ( = ?auto_142711 ?auto_142715 ) ) ( not ( = ?auto_142711 ?auto_142714 ) ) ( not ( = ?auto_142711 ?auto_142716 ) ) ( not ( = ?auto_142711 ?auto_142717 ) ) ( not ( = ?auto_142711 ?auto_142719 ) ) ( not ( = ?auto_142712 ?auto_142713 ) ) ( not ( = ?auto_142712 ?auto_142715 ) ) ( not ( = ?auto_142712 ?auto_142714 ) ) ( not ( = ?auto_142712 ?auto_142716 ) ) ( not ( = ?auto_142712 ?auto_142717 ) ) ( not ( = ?auto_142712 ?auto_142719 ) ) ( not ( = ?auto_142713 ?auto_142715 ) ) ( not ( = ?auto_142713 ?auto_142714 ) ) ( not ( = ?auto_142713 ?auto_142716 ) ) ( not ( = ?auto_142713 ?auto_142717 ) ) ( not ( = ?auto_142713 ?auto_142719 ) ) ( not ( = ?auto_142715 ?auto_142714 ) ) ( not ( = ?auto_142715 ?auto_142716 ) ) ( not ( = ?auto_142715 ?auto_142717 ) ) ( not ( = ?auto_142715 ?auto_142719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142714 ?auto_142716 ?auto_142717 )
      ( MAKE-6CRATE-VERIFY ?auto_142711 ?auto_142712 ?auto_142713 ?auto_142715 ?auto_142714 ?auto_142716 ?auto_142717 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142775 - SURFACE
      ?auto_142776 - SURFACE
      ?auto_142777 - SURFACE
      ?auto_142779 - SURFACE
      ?auto_142778 - SURFACE
      ?auto_142780 - SURFACE
      ?auto_142781 - SURFACE
    )
    :vars
    (
      ?auto_142782 - HOIST
      ?auto_142785 - PLACE
      ?auto_142784 - PLACE
      ?auto_142783 - HOIST
      ?auto_142786 - SURFACE
      ?auto_142787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142782 ?auto_142785 ) ( IS-CRATE ?auto_142781 ) ( not ( = ?auto_142780 ?auto_142781 ) ) ( not ( = ?auto_142778 ?auto_142780 ) ) ( not ( = ?auto_142778 ?auto_142781 ) ) ( not ( = ?auto_142784 ?auto_142785 ) ) ( HOIST-AT ?auto_142783 ?auto_142784 ) ( not ( = ?auto_142782 ?auto_142783 ) ) ( AVAILABLE ?auto_142783 ) ( SURFACE-AT ?auto_142781 ?auto_142784 ) ( ON ?auto_142781 ?auto_142786 ) ( CLEAR ?auto_142781 ) ( not ( = ?auto_142780 ?auto_142786 ) ) ( not ( = ?auto_142781 ?auto_142786 ) ) ( not ( = ?auto_142778 ?auto_142786 ) ) ( TRUCK-AT ?auto_142787 ?auto_142785 ) ( SURFACE-AT ?auto_142778 ?auto_142785 ) ( CLEAR ?auto_142778 ) ( IS-CRATE ?auto_142780 ) ( AVAILABLE ?auto_142782 ) ( IN ?auto_142780 ?auto_142787 ) ( ON ?auto_142776 ?auto_142775 ) ( ON ?auto_142777 ?auto_142776 ) ( ON ?auto_142779 ?auto_142777 ) ( ON ?auto_142778 ?auto_142779 ) ( not ( = ?auto_142775 ?auto_142776 ) ) ( not ( = ?auto_142775 ?auto_142777 ) ) ( not ( = ?auto_142775 ?auto_142779 ) ) ( not ( = ?auto_142775 ?auto_142778 ) ) ( not ( = ?auto_142775 ?auto_142780 ) ) ( not ( = ?auto_142775 ?auto_142781 ) ) ( not ( = ?auto_142775 ?auto_142786 ) ) ( not ( = ?auto_142776 ?auto_142777 ) ) ( not ( = ?auto_142776 ?auto_142779 ) ) ( not ( = ?auto_142776 ?auto_142778 ) ) ( not ( = ?auto_142776 ?auto_142780 ) ) ( not ( = ?auto_142776 ?auto_142781 ) ) ( not ( = ?auto_142776 ?auto_142786 ) ) ( not ( = ?auto_142777 ?auto_142779 ) ) ( not ( = ?auto_142777 ?auto_142778 ) ) ( not ( = ?auto_142777 ?auto_142780 ) ) ( not ( = ?auto_142777 ?auto_142781 ) ) ( not ( = ?auto_142777 ?auto_142786 ) ) ( not ( = ?auto_142779 ?auto_142778 ) ) ( not ( = ?auto_142779 ?auto_142780 ) ) ( not ( = ?auto_142779 ?auto_142781 ) ) ( not ( = ?auto_142779 ?auto_142786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142778 ?auto_142780 ?auto_142781 )
      ( MAKE-6CRATE-VERIFY ?auto_142775 ?auto_142776 ?auto_142777 ?auto_142779 ?auto_142778 ?auto_142780 ?auto_142781 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144731 - SURFACE
      ?auto_144732 - SURFACE
      ?auto_144733 - SURFACE
      ?auto_144735 - SURFACE
      ?auto_144734 - SURFACE
      ?auto_144736 - SURFACE
      ?auto_144737 - SURFACE
      ?auto_144738 - SURFACE
    )
    :vars
    (
      ?auto_144739 - HOIST
      ?auto_144740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_144739 ?auto_144740 ) ( SURFACE-AT ?auto_144737 ?auto_144740 ) ( CLEAR ?auto_144737 ) ( LIFTING ?auto_144739 ?auto_144738 ) ( IS-CRATE ?auto_144738 ) ( not ( = ?auto_144737 ?auto_144738 ) ) ( ON ?auto_144732 ?auto_144731 ) ( ON ?auto_144733 ?auto_144732 ) ( ON ?auto_144735 ?auto_144733 ) ( ON ?auto_144734 ?auto_144735 ) ( ON ?auto_144736 ?auto_144734 ) ( ON ?auto_144737 ?auto_144736 ) ( not ( = ?auto_144731 ?auto_144732 ) ) ( not ( = ?auto_144731 ?auto_144733 ) ) ( not ( = ?auto_144731 ?auto_144735 ) ) ( not ( = ?auto_144731 ?auto_144734 ) ) ( not ( = ?auto_144731 ?auto_144736 ) ) ( not ( = ?auto_144731 ?auto_144737 ) ) ( not ( = ?auto_144731 ?auto_144738 ) ) ( not ( = ?auto_144732 ?auto_144733 ) ) ( not ( = ?auto_144732 ?auto_144735 ) ) ( not ( = ?auto_144732 ?auto_144734 ) ) ( not ( = ?auto_144732 ?auto_144736 ) ) ( not ( = ?auto_144732 ?auto_144737 ) ) ( not ( = ?auto_144732 ?auto_144738 ) ) ( not ( = ?auto_144733 ?auto_144735 ) ) ( not ( = ?auto_144733 ?auto_144734 ) ) ( not ( = ?auto_144733 ?auto_144736 ) ) ( not ( = ?auto_144733 ?auto_144737 ) ) ( not ( = ?auto_144733 ?auto_144738 ) ) ( not ( = ?auto_144735 ?auto_144734 ) ) ( not ( = ?auto_144735 ?auto_144736 ) ) ( not ( = ?auto_144735 ?auto_144737 ) ) ( not ( = ?auto_144735 ?auto_144738 ) ) ( not ( = ?auto_144734 ?auto_144736 ) ) ( not ( = ?auto_144734 ?auto_144737 ) ) ( not ( = ?auto_144734 ?auto_144738 ) ) ( not ( = ?auto_144736 ?auto_144737 ) ) ( not ( = ?auto_144736 ?auto_144738 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_144737 ?auto_144738 )
      ( MAKE-7CRATE-VERIFY ?auto_144731 ?auto_144732 ?auto_144733 ?auto_144735 ?auto_144734 ?auto_144736 ?auto_144737 ?auto_144738 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144786 - SURFACE
      ?auto_144787 - SURFACE
      ?auto_144788 - SURFACE
      ?auto_144790 - SURFACE
      ?auto_144789 - SURFACE
      ?auto_144791 - SURFACE
      ?auto_144792 - SURFACE
      ?auto_144793 - SURFACE
    )
    :vars
    (
      ?auto_144796 - HOIST
      ?auto_144795 - PLACE
      ?auto_144794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144796 ?auto_144795 ) ( SURFACE-AT ?auto_144792 ?auto_144795 ) ( CLEAR ?auto_144792 ) ( IS-CRATE ?auto_144793 ) ( not ( = ?auto_144792 ?auto_144793 ) ) ( TRUCK-AT ?auto_144794 ?auto_144795 ) ( AVAILABLE ?auto_144796 ) ( IN ?auto_144793 ?auto_144794 ) ( ON ?auto_144792 ?auto_144791 ) ( not ( = ?auto_144791 ?auto_144792 ) ) ( not ( = ?auto_144791 ?auto_144793 ) ) ( ON ?auto_144787 ?auto_144786 ) ( ON ?auto_144788 ?auto_144787 ) ( ON ?auto_144790 ?auto_144788 ) ( ON ?auto_144789 ?auto_144790 ) ( ON ?auto_144791 ?auto_144789 ) ( not ( = ?auto_144786 ?auto_144787 ) ) ( not ( = ?auto_144786 ?auto_144788 ) ) ( not ( = ?auto_144786 ?auto_144790 ) ) ( not ( = ?auto_144786 ?auto_144789 ) ) ( not ( = ?auto_144786 ?auto_144791 ) ) ( not ( = ?auto_144786 ?auto_144792 ) ) ( not ( = ?auto_144786 ?auto_144793 ) ) ( not ( = ?auto_144787 ?auto_144788 ) ) ( not ( = ?auto_144787 ?auto_144790 ) ) ( not ( = ?auto_144787 ?auto_144789 ) ) ( not ( = ?auto_144787 ?auto_144791 ) ) ( not ( = ?auto_144787 ?auto_144792 ) ) ( not ( = ?auto_144787 ?auto_144793 ) ) ( not ( = ?auto_144788 ?auto_144790 ) ) ( not ( = ?auto_144788 ?auto_144789 ) ) ( not ( = ?auto_144788 ?auto_144791 ) ) ( not ( = ?auto_144788 ?auto_144792 ) ) ( not ( = ?auto_144788 ?auto_144793 ) ) ( not ( = ?auto_144790 ?auto_144789 ) ) ( not ( = ?auto_144790 ?auto_144791 ) ) ( not ( = ?auto_144790 ?auto_144792 ) ) ( not ( = ?auto_144790 ?auto_144793 ) ) ( not ( = ?auto_144789 ?auto_144791 ) ) ( not ( = ?auto_144789 ?auto_144792 ) ) ( not ( = ?auto_144789 ?auto_144793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_144791 ?auto_144792 ?auto_144793 )
      ( MAKE-7CRATE-VERIFY ?auto_144786 ?auto_144787 ?auto_144788 ?auto_144790 ?auto_144789 ?auto_144791 ?auto_144792 ?auto_144793 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144849 - SURFACE
      ?auto_144850 - SURFACE
      ?auto_144851 - SURFACE
      ?auto_144853 - SURFACE
      ?auto_144852 - SURFACE
      ?auto_144854 - SURFACE
      ?auto_144855 - SURFACE
      ?auto_144856 - SURFACE
    )
    :vars
    (
      ?auto_144859 - HOIST
      ?auto_144857 - PLACE
      ?auto_144860 - TRUCK
      ?auto_144858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_144859 ?auto_144857 ) ( SURFACE-AT ?auto_144855 ?auto_144857 ) ( CLEAR ?auto_144855 ) ( IS-CRATE ?auto_144856 ) ( not ( = ?auto_144855 ?auto_144856 ) ) ( AVAILABLE ?auto_144859 ) ( IN ?auto_144856 ?auto_144860 ) ( ON ?auto_144855 ?auto_144854 ) ( not ( = ?auto_144854 ?auto_144855 ) ) ( not ( = ?auto_144854 ?auto_144856 ) ) ( TRUCK-AT ?auto_144860 ?auto_144858 ) ( not ( = ?auto_144858 ?auto_144857 ) ) ( ON ?auto_144850 ?auto_144849 ) ( ON ?auto_144851 ?auto_144850 ) ( ON ?auto_144853 ?auto_144851 ) ( ON ?auto_144852 ?auto_144853 ) ( ON ?auto_144854 ?auto_144852 ) ( not ( = ?auto_144849 ?auto_144850 ) ) ( not ( = ?auto_144849 ?auto_144851 ) ) ( not ( = ?auto_144849 ?auto_144853 ) ) ( not ( = ?auto_144849 ?auto_144852 ) ) ( not ( = ?auto_144849 ?auto_144854 ) ) ( not ( = ?auto_144849 ?auto_144855 ) ) ( not ( = ?auto_144849 ?auto_144856 ) ) ( not ( = ?auto_144850 ?auto_144851 ) ) ( not ( = ?auto_144850 ?auto_144853 ) ) ( not ( = ?auto_144850 ?auto_144852 ) ) ( not ( = ?auto_144850 ?auto_144854 ) ) ( not ( = ?auto_144850 ?auto_144855 ) ) ( not ( = ?auto_144850 ?auto_144856 ) ) ( not ( = ?auto_144851 ?auto_144853 ) ) ( not ( = ?auto_144851 ?auto_144852 ) ) ( not ( = ?auto_144851 ?auto_144854 ) ) ( not ( = ?auto_144851 ?auto_144855 ) ) ( not ( = ?auto_144851 ?auto_144856 ) ) ( not ( = ?auto_144853 ?auto_144852 ) ) ( not ( = ?auto_144853 ?auto_144854 ) ) ( not ( = ?auto_144853 ?auto_144855 ) ) ( not ( = ?auto_144853 ?auto_144856 ) ) ( not ( = ?auto_144852 ?auto_144854 ) ) ( not ( = ?auto_144852 ?auto_144855 ) ) ( not ( = ?auto_144852 ?auto_144856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_144854 ?auto_144855 ?auto_144856 )
      ( MAKE-7CRATE-VERIFY ?auto_144849 ?auto_144850 ?auto_144851 ?auto_144853 ?auto_144852 ?auto_144854 ?auto_144855 ?auto_144856 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144919 - SURFACE
      ?auto_144920 - SURFACE
      ?auto_144921 - SURFACE
      ?auto_144923 - SURFACE
      ?auto_144922 - SURFACE
      ?auto_144924 - SURFACE
      ?auto_144925 - SURFACE
      ?auto_144926 - SURFACE
    )
    :vars
    (
      ?auto_144930 - HOIST
      ?auto_144928 - PLACE
      ?auto_144927 - TRUCK
      ?auto_144931 - PLACE
      ?auto_144929 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_144930 ?auto_144928 ) ( SURFACE-AT ?auto_144925 ?auto_144928 ) ( CLEAR ?auto_144925 ) ( IS-CRATE ?auto_144926 ) ( not ( = ?auto_144925 ?auto_144926 ) ) ( AVAILABLE ?auto_144930 ) ( ON ?auto_144925 ?auto_144924 ) ( not ( = ?auto_144924 ?auto_144925 ) ) ( not ( = ?auto_144924 ?auto_144926 ) ) ( TRUCK-AT ?auto_144927 ?auto_144931 ) ( not ( = ?auto_144931 ?auto_144928 ) ) ( HOIST-AT ?auto_144929 ?auto_144931 ) ( LIFTING ?auto_144929 ?auto_144926 ) ( not ( = ?auto_144930 ?auto_144929 ) ) ( ON ?auto_144920 ?auto_144919 ) ( ON ?auto_144921 ?auto_144920 ) ( ON ?auto_144923 ?auto_144921 ) ( ON ?auto_144922 ?auto_144923 ) ( ON ?auto_144924 ?auto_144922 ) ( not ( = ?auto_144919 ?auto_144920 ) ) ( not ( = ?auto_144919 ?auto_144921 ) ) ( not ( = ?auto_144919 ?auto_144923 ) ) ( not ( = ?auto_144919 ?auto_144922 ) ) ( not ( = ?auto_144919 ?auto_144924 ) ) ( not ( = ?auto_144919 ?auto_144925 ) ) ( not ( = ?auto_144919 ?auto_144926 ) ) ( not ( = ?auto_144920 ?auto_144921 ) ) ( not ( = ?auto_144920 ?auto_144923 ) ) ( not ( = ?auto_144920 ?auto_144922 ) ) ( not ( = ?auto_144920 ?auto_144924 ) ) ( not ( = ?auto_144920 ?auto_144925 ) ) ( not ( = ?auto_144920 ?auto_144926 ) ) ( not ( = ?auto_144921 ?auto_144923 ) ) ( not ( = ?auto_144921 ?auto_144922 ) ) ( not ( = ?auto_144921 ?auto_144924 ) ) ( not ( = ?auto_144921 ?auto_144925 ) ) ( not ( = ?auto_144921 ?auto_144926 ) ) ( not ( = ?auto_144923 ?auto_144922 ) ) ( not ( = ?auto_144923 ?auto_144924 ) ) ( not ( = ?auto_144923 ?auto_144925 ) ) ( not ( = ?auto_144923 ?auto_144926 ) ) ( not ( = ?auto_144922 ?auto_144924 ) ) ( not ( = ?auto_144922 ?auto_144925 ) ) ( not ( = ?auto_144922 ?auto_144926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_144924 ?auto_144925 ?auto_144926 )
      ( MAKE-7CRATE-VERIFY ?auto_144919 ?auto_144920 ?auto_144921 ?auto_144923 ?auto_144922 ?auto_144924 ?auto_144925 ?auto_144926 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144996 - SURFACE
      ?auto_144997 - SURFACE
      ?auto_144998 - SURFACE
      ?auto_145000 - SURFACE
      ?auto_144999 - SURFACE
      ?auto_145001 - SURFACE
      ?auto_145002 - SURFACE
      ?auto_145003 - SURFACE
    )
    :vars
    (
      ?auto_145004 - HOIST
      ?auto_145005 - PLACE
      ?auto_145009 - TRUCK
      ?auto_145008 - PLACE
      ?auto_145007 - HOIST
      ?auto_145006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_145004 ?auto_145005 ) ( SURFACE-AT ?auto_145002 ?auto_145005 ) ( CLEAR ?auto_145002 ) ( IS-CRATE ?auto_145003 ) ( not ( = ?auto_145002 ?auto_145003 ) ) ( AVAILABLE ?auto_145004 ) ( ON ?auto_145002 ?auto_145001 ) ( not ( = ?auto_145001 ?auto_145002 ) ) ( not ( = ?auto_145001 ?auto_145003 ) ) ( TRUCK-AT ?auto_145009 ?auto_145008 ) ( not ( = ?auto_145008 ?auto_145005 ) ) ( HOIST-AT ?auto_145007 ?auto_145008 ) ( not ( = ?auto_145004 ?auto_145007 ) ) ( AVAILABLE ?auto_145007 ) ( SURFACE-AT ?auto_145003 ?auto_145008 ) ( ON ?auto_145003 ?auto_145006 ) ( CLEAR ?auto_145003 ) ( not ( = ?auto_145002 ?auto_145006 ) ) ( not ( = ?auto_145003 ?auto_145006 ) ) ( not ( = ?auto_145001 ?auto_145006 ) ) ( ON ?auto_144997 ?auto_144996 ) ( ON ?auto_144998 ?auto_144997 ) ( ON ?auto_145000 ?auto_144998 ) ( ON ?auto_144999 ?auto_145000 ) ( ON ?auto_145001 ?auto_144999 ) ( not ( = ?auto_144996 ?auto_144997 ) ) ( not ( = ?auto_144996 ?auto_144998 ) ) ( not ( = ?auto_144996 ?auto_145000 ) ) ( not ( = ?auto_144996 ?auto_144999 ) ) ( not ( = ?auto_144996 ?auto_145001 ) ) ( not ( = ?auto_144996 ?auto_145002 ) ) ( not ( = ?auto_144996 ?auto_145003 ) ) ( not ( = ?auto_144996 ?auto_145006 ) ) ( not ( = ?auto_144997 ?auto_144998 ) ) ( not ( = ?auto_144997 ?auto_145000 ) ) ( not ( = ?auto_144997 ?auto_144999 ) ) ( not ( = ?auto_144997 ?auto_145001 ) ) ( not ( = ?auto_144997 ?auto_145002 ) ) ( not ( = ?auto_144997 ?auto_145003 ) ) ( not ( = ?auto_144997 ?auto_145006 ) ) ( not ( = ?auto_144998 ?auto_145000 ) ) ( not ( = ?auto_144998 ?auto_144999 ) ) ( not ( = ?auto_144998 ?auto_145001 ) ) ( not ( = ?auto_144998 ?auto_145002 ) ) ( not ( = ?auto_144998 ?auto_145003 ) ) ( not ( = ?auto_144998 ?auto_145006 ) ) ( not ( = ?auto_145000 ?auto_144999 ) ) ( not ( = ?auto_145000 ?auto_145001 ) ) ( not ( = ?auto_145000 ?auto_145002 ) ) ( not ( = ?auto_145000 ?auto_145003 ) ) ( not ( = ?auto_145000 ?auto_145006 ) ) ( not ( = ?auto_144999 ?auto_145001 ) ) ( not ( = ?auto_144999 ?auto_145002 ) ) ( not ( = ?auto_144999 ?auto_145003 ) ) ( not ( = ?auto_144999 ?auto_145006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145001 ?auto_145002 ?auto_145003 )
      ( MAKE-7CRATE-VERIFY ?auto_144996 ?auto_144997 ?auto_144998 ?auto_145000 ?auto_144999 ?auto_145001 ?auto_145002 ?auto_145003 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145074 - SURFACE
      ?auto_145075 - SURFACE
      ?auto_145076 - SURFACE
      ?auto_145078 - SURFACE
      ?auto_145077 - SURFACE
      ?auto_145079 - SURFACE
      ?auto_145080 - SURFACE
      ?auto_145081 - SURFACE
    )
    :vars
    (
      ?auto_145085 - HOIST
      ?auto_145083 - PLACE
      ?auto_145087 - PLACE
      ?auto_145084 - HOIST
      ?auto_145086 - SURFACE
      ?auto_145082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145085 ?auto_145083 ) ( SURFACE-AT ?auto_145080 ?auto_145083 ) ( CLEAR ?auto_145080 ) ( IS-CRATE ?auto_145081 ) ( not ( = ?auto_145080 ?auto_145081 ) ) ( AVAILABLE ?auto_145085 ) ( ON ?auto_145080 ?auto_145079 ) ( not ( = ?auto_145079 ?auto_145080 ) ) ( not ( = ?auto_145079 ?auto_145081 ) ) ( not ( = ?auto_145087 ?auto_145083 ) ) ( HOIST-AT ?auto_145084 ?auto_145087 ) ( not ( = ?auto_145085 ?auto_145084 ) ) ( AVAILABLE ?auto_145084 ) ( SURFACE-AT ?auto_145081 ?auto_145087 ) ( ON ?auto_145081 ?auto_145086 ) ( CLEAR ?auto_145081 ) ( not ( = ?auto_145080 ?auto_145086 ) ) ( not ( = ?auto_145081 ?auto_145086 ) ) ( not ( = ?auto_145079 ?auto_145086 ) ) ( TRUCK-AT ?auto_145082 ?auto_145083 ) ( ON ?auto_145075 ?auto_145074 ) ( ON ?auto_145076 ?auto_145075 ) ( ON ?auto_145078 ?auto_145076 ) ( ON ?auto_145077 ?auto_145078 ) ( ON ?auto_145079 ?auto_145077 ) ( not ( = ?auto_145074 ?auto_145075 ) ) ( not ( = ?auto_145074 ?auto_145076 ) ) ( not ( = ?auto_145074 ?auto_145078 ) ) ( not ( = ?auto_145074 ?auto_145077 ) ) ( not ( = ?auto_145074 ?auto_145079 ) ) ( not ( = ?auto_145074 ?auto_145080 ) ) ( not ( = ?auto_145074 ?auto_145081 ) ) ( not ( = ?auto_145074 ?auto_145086 ) ) ( not ( = ?auto_145075 ?auto_145076 ) ) ( not ( = ?auto_145075 ?auto_145078 ) ) ( not ( = ?auto_145075 ?auto_145077 ) ) ( not ( = ?auto_145075 ?auto_145079 ) ) ( not ( = ?auto_145075 ?auto_145080 ) ) ( not ( = ?auto_145075 ?auto_145081 ) ) ( not ( = ?auto_145075 ?auto_145086 ) ) ( not ( = ?auto_145076 ?auto_145078 ) ) ( not ( = ?auto_145076 ?auto_145077 ) ) ( not ( = ?auto_145076 ?auto_145079 ) ) ( not ( = ?auto_145076 ?auto_145080 ) ) ( not ( = ?auto_145076 ?auto_145081 ) ) ( not ( = ?auto_145076 ?auto_145086 ) ) ( not ( = ?auto_145078 ?auto_145077 ) ) ( not ( = ?auto_145078 ?auto_145079 ) ) ( not ( = ?auto_145078 ?auto_145080 ) ) ( not ( = ?auto_145078 ?auto_145081 ) ) ( not ( = ?auto_145078 ?auto_145086 ) ) ( not ( = ?auto_145077 ?auto_145079 ) ) ( not ( = ?auto_145077 ?auto_145080 ) ) ( not ( = ?auto_145077 ?auto_145081 ) ) ( not ( = ?auto_145077 ?auto_145086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145079 ?auto_145080 ?auto_145081 )
      ( MAKE-7CRATE-VERIFY ?auto_145074 ?auto_145075 ?auto_145076 ?auto_145078 ?auto_145077 ?auto_145079 ?auto_145080 ?auto_145081 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145152 - SURFACE
      ?auto_145153 - SURFACE
      ?auto_145154 - SURFACE
      ?auto_145156 - SURFACE
      ?auto_145155 - SURFACE
      ?auto_145157 - SURFACE
      ?auto_145158 - SURFACE
      ?auto_145159 - SURFACE
    )
    :vars
    (
      ?auto_145162 - HOIST
      ?auto_145161 - PLACE
      ?auto_145165 - PLACE
      ?auto_145163 - HOIST
      ?auto_145160 - SURFACE
      ?auto_145164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145162 ?auto_145161 ) ( IS-CRATE ?auto_145159 ) ( not ( = ?auto_145158 ?auto_145159 ) ) ( not ( = ?auto_145157 ?auto_145158 ) ) ( not ( = ?auto_145157 ?auto_145159 ) ) ( not ( = ?auto_145165 ?auto_145161 ) ) ( HOIST-AT ?auto_145163 ?auto_145165 ) ( not ( = ?auto_145162 ?auto_145163 ) ) ( AVAILABLE ?auto_145163 ) ( SURFACE-AT ?auto_145159 ?auto_145165 ) ( ON ?auto_145159 ?auto_145160 ) ( CLEAR ?auto_145159 ) ( not ( = ?auto_145158 ?auto_145160 ) ) ( not ( = ?auto_145159 ?auto_145160 ) ) ( not ( = ?auto_145157 ?auto_145160 ) ) ( TRUCK-AT ?auto_145164 ?auto_145161 ) ( SURFACE-AT ?auto_145157 ?auto_145161 ) ( CLEAR ?auto_145157 ) ( LIFTING ?auto_145162 ?auto_145158 ) ( IS-CRATE ?auto_145158 ) ( ON ?auto_145153 ?auto_145152 ) ( ON ?auto_145154 ?auto_145153 ) ( ON ?auto_145156 ?auto_145154 ) ( ON ?auto_145155 ?auto_145156 ) ( ON ?auto_145157 ?auto_145155 ) ( not ( = ?auto_145152 ?auto_145153 ) ) ( not ( = ?auto_145152 ?auto_145154 ) ) ( not ( = ?auto_145152 ?auto_145156 ) ) ( not ( = ?auto_145152 ?auto_145155 ) ) ( not ( = ?auto_145152 ?auto_145157 ) ) ( not ( = ?auto_145152 ?auto_145158 ) ) ( not ( = ?auto_145152 ?auto_145159 ) ) ( not ( = ?auto_145152 ?auto_145160 ) ) ( not ( = ?auto_145153 ?auto_145154 ) ) ( not ( = ?auto_145153 ?auto_145156 ) ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145157 ) ) ( not ( = ?auto_145153 ?auto_145158 ) ) ( not ( = ?auto_145153 ?auto_145159 ) ) ( not ( = ?auto_145153 ?auto_145160 ) ) ( not ( = ?auto_145154 ?auto_145156 ) ) ( not ( = ?auto_145154 ?auto_145155 ) ) ( not ( = ?auto_145154 ?auto_145157 ) ) ( not ( = ?auto_145154 ?auto_145158 ) ) ( not ( = ?auto_145154 ?auto_145159 ) ) ( not ( = ?auto_145154 ?auto_145160 ) ) ( not ( = ?auto_145156 ?auto_145155 ) ) ( not ( = ?auto_145156 ?auto_145157 ) ) ( not ( = ?auto_145156 ?auto_145158 ) ) ( not ( = ?auto_145156 ?auto_145159 ) ) ( not ( = ?auto_145156 ?auto_145160 ) ) ( not ( = ?auto_145155 ?auto_145157 ) ) ( not ( = ?auto_145155 ?auto_145158 ) ) ( not ( = ?auto_145155 ?auto_145159 ) ) ( not ( = ?auto_145155 ?auto_145160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145157 ?auto_145158 ?auto_145159 )
      ( MAKE-7CRATE-VERIFY ?auto_145152 ?auto_145153 ?auto_145154 ?auto_145156 ?auto_145155 ?auto_145157 ?auto_145158 ?auto_145159 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145230 - SURFACE
      ?auto_145231 - SURFACE
      ?auto_145232 - SURFACE
      ?auto_145234 - SURFACE
      ?auto_145233 - SURFACE
      ?auto_145235 - SURFACE
      ?auto_145236 - SURFACE
      ?auto_145237 - SURFACE
    )
    :vars
    (
      ?auto_145243 - HOIST
      ?auto_145242 - PLACE
      ?auto_145238 - PLACE
      ?auto_145239 - HOIST
      ?auto_145241 - SURFACE
      ?auto_145240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145243 ?auto_145242 ) ( IS-CRATE ?auto_145237 ) ( not ( = ?auto_145236 ?auto_145237 ) ) ( not ( = ?auto_145235 ?auto_145236 ) ) ( not ( = ?auto_145235 ?auto_145237 ) ) ( not ( = ?auto_145238 ?auto_145242 ) ) ( HOIST-AT ?auto_145239 ?auto_145238 ) ( not ( = ?auto_145243 ?auto_145239 ) ) ( AVAILABLE ?auto_145239 ) ( SURFACE-AT ?auto_145237 ?auto_145238 ) ( ON ?auto_145237 ?auto_145241 ) ( CLEAR ?auto_145237 ) ( not ( = ?auto_145236 ?auto_145241 ) ) ( not ( = ?auto_145237 ?auto_145241 ) ) ( not ( = ?auto_145235 ?auto_145241 ) ) ( TRUCK-AT ?auto_145240 ?auto_145242 ) ( SURFACE-AT ?auto_145235 ?auto_145242 ) ( CLEAR ?auto_145235 ) ( IS-CRATE ?auto_145236 ) ( AVAILABLE ?auto_145243 ) ( IN ?auto_145236 ?auto_145240 ) ( ON ?auto_145231 ?auto_145230 ) ( ON ?auto_145232 ?auto_145231 ) ( ON ?auto_145234 ?auto_145232 ) ( ON ?auto_145233 ?auto_145234 ) ( ON ?auto_145235 ?auto_145233 ) ( not ( = ?auto_145230 ?auto_145231 ) ) ( not ( = ?auto_145230 ?auto_145232 ) ) ( not ( = ?auto_145230 ?auto_145234 ) ) ( not ( = ?auto_145230 ?auto_145233 ) ) ( not ( = ?auto_145230 ?auto_145235 ) ) ( not ( = ?auto_145230 ?auto_145236 ) ) ( not ( = ?auto_145230 ?auto_145237 ) ) ( not ( = ?auto_145230 ?auto_145241 ) ) ( not ( = ?auto_145231 ?auto_145232 ) ) ( not ( = ?auto_145231 ?auto_145234 ) ) ( not ( = ?auto_145231 ?auto_145233 ) ) ( not ( = ?auto_145231 ?auto_145235 ) ) ( not ( = ?auto_145231 ?auto_145236 ) ) ( not ( = ?auto_145231 ?auto_145237 ) ) ( not ( = ?auto_145231 ?auto_145241 ) ) ( not ( = ?auto_145232 ?auto_145234 ) ) ( not ( = ?auto_145232 ?auto_145233 ) ) ( not ( = ?auto_145232 ?auto_145235 ) ) ( not ( = ?auto_145232 ?auto_145236 ) ) ( not ( = ?auto_145232 ?auto_145237 ) ) ( not ( = ?auto_145232 ?auto_145241 ) ) ( not ( = ?auto_145234 ?auto_145233 ) ) ( not ( = ?auto_145234 ?auto_145235 ) ) ( not ( = ?auto_145234 ?auto_145236 ) ) ( not ( = ?auto_145234 ?auto_145237 ) ) ( not ( = ?auto_145234 ?auto_145241 ) ) ( not ( = ?auto_145233 ?auto_145235 ) ) ( not ( = ?auto_145233 ?auto_145236 ) ) ( not ( = ?auto_145233 ?auto_145237 ) ) ( not ( = ?auto_145233 ?auto_145241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145235 ?auto_145236 ?auto_145237 )
      ( MAKE-7CRATE-VERIFY ?auto_145230 ?auto_145231 ?auto_145232 ?auto_145234 ?auto_145233 ?auto_145235 ?auto_145236 ?auto_145237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_146307 - SURFACE
      ?auto_146308 - SURFACE
    )
    :vars
    (
      ?auto_146313 - HOIST
      ?auto_146311 - PLACE
      ?auto_146309 - SURFACE
      ?auto_146310 - TRUCK
      ?auto_146315 - PLACE
      ?auto_146312 - HOIST
      ?auto_146314 - SURFACE
      ?auto_146316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_146313 ?auto_146311 ) ( SURFACE-AT ?auto_146307 ?auto_146311 ) ( CLEAR ?auto_146307 ) ( IS-CRATE ?auto_146308 ) ( not ( = ?auto_146307 ?auto_146308 ) ) ( AVAILABLE ?auto_146313 ) ( ON ?auto_146307 ?auto_146309 ) ( not ( = ?auto_146309 ?auto_146307 ) ) ( not ( = ?auto_146309 ?auto_146308 ) ) ( TRUCK-AT ?auto_146310 ?auto_146315 ) ( not ( = ?auto_146315 ?auto_146311 ) ) ( HOIST-AT ?auto_146312 ?auto_146315 ) ( not ( = ?auto_146313 ?auto_146312 ) ) ( SURFACE-AT ?auto_146308 ?auto_146315 ) ( ON ?auto_146308 ?auto_146314 ) ( CLEAR ?auto_146308 ) ( not ( = ?auto_146307 ?auto_146314 ) ) ( not ( = ?auto_146308 ?auto_146314 ) ) ( not ( = ?auto_146309 ?auto_146314 ) ) ( LIFTING ?auto_146312 ?auto_146316 ) ( IS-CRATE ?auto_146316 ) ( not ( = ?auto_146307 ?auto_146316 ) ) ( not ( = ?auto_146308 ?auto_146316 ) ) ( not ( = ?auto_146309 ?auto_146316 ) ) ( not ( = ?auto_146314 ?auto_146316 ) ) )
    :subtasks
    ( ( !LOAD ?auto_146312 ?auto_146316 ?auto_146310 ?auto_146315 )
      ( MAKE-1CRATE ?auto_146307 ?auto_146308 )
      ( MAKE-1CRATE-VERIFY ?auto_146307 ?auto_146308 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148140 - SURFACE
      ?auto_148141 - SURFACE
      ?auto_148142 - SURFACE
      ?auto_148144 - SURFACE
      ?auto_148143 - SURFACE
      ?auto_148145 - SURFACE
      ?auto_148146 - SURFACE
      ?auto_148147 - SURFACE
      ?auto_148148 - SURFACE
    )
    :vars
    (
      ?auto_148150 - HOIST
      ?auto_148149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148150 ?auto_148149 ) ( SURFACE-AT ?auto_148147 ?auto_148149 ) ( CLEAR ?auto_148147 ) ( LIFTING ?auto_148150 ?auto_148148 ) ( IS-CRATE ?auto_148148 ) ( not ( = ?auto_148147 ?auto_148148 ) ) ( ON ?auto_148141 ?auto_148140 ) ( ON ?auto_148142 ?auto_148141 ) ( ON ?auto_148144 ?auto_148142 ) ( ON ?auto_148143 ?auto_148144 ) ( ON ?auto_148145 ?auto_148143 ) ( ON ?auto_148146 ?auto_148145 ) ( ON ?auto_148147 ?auto_148146 ) ( not ( = ?auto_148140 ?auto_148141 ) ) ( not ( = ?auto_148140 ?auto_148142 ) ) ( not ( = ?auto_148140 ?auto_148144 ) ) ( not ( = ?auto_148140 ?auto_148143 ) ) ( not ( = ?auto_148140 ?auto_148145 ) ) ( not ( = ?auto_148140 ?auto_148146 ) ) ( not ( = ?auto_148140 ?auto_148147 ) ) ( not ( = ?auto_148140 ?auto_148148 ) ) ( not ( = ?auto_148141 ?auto_148142 ) ) ( not ( = ?auto_148141 ?auto_148144 ) ) ( not ( = ?auto_148141 ?auto_148143 ) ) ( not ( = ?auto_148141 ?auto_148145 ) ) ( not ( = ?auto_148141 ?auto_148146 ) ) ( not ( = ?auto_148141 ?auto_148147 ) ) ( not ( = ?auto_148141 ?auto_148148 ) ) ( not ( = ?auto_148142 ?auto_148144 ) ) ( not ( = ?auto_148142 ?auto_148143 ) ) ( not ( = ?auto_148142 ?auto_148145 ) ) ( not ( = ?auto_148142 ?auto_148146 ) ) ( not ( = ?auto_148142 ?auto_148147 ) ) ( not ( = ?auto_148142 ?auto_148148 ) ) ( not ( = ?auto_148144 ?auto_148143 ) ) ( not ( = ?auto_148144 ?auto_148145 ) ) ( not ( = ?auto_148144 ?auto_148146 ) ) ( not ( = ?auto_148144 ?auto_148147 ) ) ( not ( = ?auto_148144 ?auto_148148 ) ) ( not ( = ?auto_148143 ?auto_148145 ) ) ( not ( = ?auto_148143 ?auto_148146 ) ) ( not ( = ?auto_148143 ?auto_148147 ) ) ( not ( = ?auto_148143 ?auto_148148 ) ) ( not ( = ?auto_148145 ?auto_148146 ) ) ( not ( = ?auto_148145 ?auto_148147 ) ) ( not ( = ?auto_148145 ?auto_148148 ) ) ( not ( = ?auto_148146 ?auto_148147 ) ) ( not ( = ?auto_148146 ?auto_148148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_148147 ?auto_148148 )
      ( MAKE-8CRATE-VERIFY ?auto_148140 ?auto_148141 ?auto_148142 ?auto_148144 ?auto_148143 ?auto_148145 ?auto_148146 ?auto_148147 ?auto_148148 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148207 - SURFACE
      ?auto_148208 - SURFACE
      ?auto_148209 - SURFACE
      ?auto_148211 - SURFACE
      ?auto_148210 - SURFACE
      ?auto_148212 - SURFACE
      ?auto_148213 - SURFACE
      ?auto_148214 - SURFACE
      ?auto_148215 - SURFACE
    )
    :vars
    (
      ?auto_148218 - HOIST
      ?auto_148217 - PLACE
      ?auto_148216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148218 ?auto_148217 ) ( SURFACE-AT ?auto_148214 ?auto_148217 ) ( CLEAR ?auto_148214 ) ( IS-CRATE ?auto_148215 ) ( not ( = ?auto_148214 ?auto_148215 ) ) ( TRUCK-AT ?auto_148216 ?auto_148217 ) ( AVAILABLE ?auto_148218 ) ( IN ?auto_148215 ?auto_148216 ) ( ON ?auto_148214 ?auto_148213 ) ( not ( = ?auto_148213 ?auto_148214 ) ) ( not ( = ?auto_148213 ?auto_148215 ) ) ( ON ?auto_148208 ?auto_148207 ) ( ON ?auto_148209 ?auto_148208 ) ( ON ?auto_148211 ?auto_148209 ) ( ON ?auto_148210 ?auto_148211 ) ( ON ?auto_148212 ?auto_148210 ) ( ON ?auto_148213 ?auto_148212 ) ( not ( = ?auto_148207 ?auto_148208 ) ) ( not ( = ?auto_148207 ?auto_148209 ) ) ( not ( = ?auto_148207 ?auto_148211 ) ) ( not ( = ?auto_148207 ?auto_148210 ) ) ( not ( = ?auto_148207 ?auto_148212 ) ) ( not ( = ?auto_148207 ?auto_148213 ) ) ( not ( = ?auto_148207 ?auto_148214 ) ) ( not ( = ?auto_148207 ?auto_148215 ) ) ( not ( = ?auto_148208 ?auto_148209 ) ) ( not ( = ?auto_148208 ?auto_148211 ) ) ( not ( = ?auto_148208 ?auto_148210 ) ) ( not ( = ?auto_148208 ?auto_148212 ) ) ( not ( = ?auto_148208 ?auto_148213 ) ) ( not ( = ?auto_148208 ?auto_148214 ) ) ( not ( = ?auto_148208 ?auto_148215 ) ) ( not ( = ?auto_148209 ?auto_148211 ) ) ( not ( = ?auto_148209 ?auto_148210 ) ) ( not ( = ?auto_148209 ?auto_148212 ) ) ( not ( = ?auto_148209 ?auto_148213 ) ) ( not ( = ?auto_148209 ?auto_148214 ) ) ( not ( = ?auto_148209 ?auto_148215 ) ) ( not ( = ?auto_148211 ?auto_148210 ) ) ( not ( = ?auto_148211 ?auto_148212 ) ) ( not ( = ?auto_148211 ?auto_148213 ) ) ( not ( = ?auto_148211 ?auto_148214 ) ) ( not ( = ?auto_148211 ?auto_148215 ) ) ( not ( = ?auto_148210 ?auto_148212 ) ) ( not ( = ?auto_148210 ?auto_148213 ) ) ( not ( = ?auto_148210 ?auto_148214 ) ) ( not ( = ?auto_148210 ?auto_148215 ) ) ( not ( = ?auto_148212 ?auto_148213 ) ) ( not ( = ?auto_148212 ?auto_148214 ) ) ( not ( = ?auto_148212 ?auto_148215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148213 ?auto_148214 ?auto_148215 )
      ( MAKE-8CRATE-VERIFY ?auto_148207 ?auto_148208 ?auto_148209 ?auto_148211 ?auto_148210 ?auto_148212 ?auto_148213 ?auto_148214 ?auto_148215 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148283 - SURFACE
      ?auto_148284 - SURFACE
      ?auto_148285 - SURFACE
      ?auto_148287 - SURFACE
      ?auto_148286 - SURFACE
      ?auto_148288 - SURFACE
      ?auto_148289 - SURFACE
      ?auto_148290 - SURFACE
      ?auto_148291 - SURFACE
    )
    :vars
    (
      ?auto_148295 - HOIST
      ?auto_148292 - PLACE
      ?auto_148294 - TRUCK
      ?auto_148293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148295 ?auto_148292 ) ( SURFACE-AT ?auto_148290 ?auto_148292 ) ( CLEAR ?auto_148290 ) ( IS-CRATE ?auto_148291 ) ( not ( = ?auto_148290 ?auto_148291 ) ) ( AVAILABLE ?auto_148295 ) ( IN ?auto_148291 ?auto_148294 ) ( ON ?auto_148290 ?auto_148289 ) ( not ( = ?auto_148289 ?auto_148290 ) ) ( not ( = ?auto_148289 ?auto_148291 ) ) ( TRUCK-AT ?auto_148294 ?auto_148293 ) ( not ( = ?auto_148293 ?auto_148292 ) ) ( ON ?auto_148284 ?auto_148283 ) ( ON ?auto_148285 ?auto_148284 ) ( ON ?auto_148287 ?auto_148285 ) ( ON ?auto_148286 ?auto_148287 ) ( ON ?auto_148288 ?auto_148286 ) ( ON ?auto_148289 ?auto_148288 ) ( not ( = ?auto_148283 ?auto_148284 ) ) ( not ( = ?auto_148283 ?auto_148285 ) ) ( not ( = ?auto_148283 ?auto_148287 ) ) ( not ( = ?auto_148283 ?auto_148286 ) ) ( not ( = ?auto_148283 ?auto_148288 ) ) ( not ( = ?auto_148283 ?auto_148289 ) ) ( not ( = ?auto_148283 ?auto_148290 ) ) ( not ( = ?auto_148283 ?auto_148291 ) ) ( not ( = ?auto_148284 ?auto_148285 ) ) ( not ( = ?auto_148284 ?auto_148287 ) ) ( not ( = ?auto_148284 ?auto_148286 ) ) ( not ( = ?auto_148284 ?auto_148288 ) ) ( not ( = ?auto_148284 ?auto_148289 ) ) ( not ( = ?auto_148284 ?auto_148290 ) ) ( not ( = ?auto_148284 ?auto_148291 ) ) ( not ( = ?auto_148285 ?auto_148287 ) ) ( not ( = ?auto_148285 ?auto_148286 ) ) ( not ( = ?auto_148285 ?auto_148288 ) ) ( not ( = ?auto_148285 ?auto_148289 ) ) ( not ( = ?auto_148285 ?auto_148290 ) ) ( not ( = ?auto_148285 ?auto_148291 ) ) ( not ( = ?auto_148287 ?auto_148286 ) ) ( not ( = ?auto_148287 ?auto_148288 ) ) ( not ( = ?auto_148287 ?auto_148289 ) ) ( not ( = ?auto_148287 ?auto_148290 ) ) ( not ( = ?auto_148287 ?auto_148291 ) ) ( not ( = ?auto_148286 ?auto_148288 ) ) ( not ( = ?auto_148286 ?auto_148289 ) ) ( not ( = ?auto_148286 ?auto_148290 ) ) ( not ( = ?auto_148286 ?auto_148291 ) ) ( not ( = ?auto_148288 ?auto_148289 ) ) ( not ( = ?auto_148288 ?auto_148290 ) ) ( not ( = ?auto_148288 ?auto_148291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148289 ?auto_148290 ?auto_148291 )
      ( MAKE-8CRATE-VERIFY ?auto_148283 ?auto_148284 ?auto_148285 ?auto_148287 ?auto_148286 ?auto_148288 ?auto_148289 ?auto_148290 ?auto_148291 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148367 - SURFACE
      ?auto_148368 - SURFACE
      ?auto_148369 - SURFACE
      ?auto_148371 - SURFACE
      ?auto_148370 - SURFACE
      ?auto_148372 - SURFACE
      ?auto_148373 - SURFACE
      ?auto_148374 - SURFACE
      ?auto_148375 - SURFACE
    )
    :vars
    (
      ?auto_148376 - HOIST
      ?auto_148380 - PLACE
      ?auto_148379 - TRUCK
      ?auto_148378 - PLACE
      ?auto_148377 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_148376 ?auto_148380 ) ( SURFACE-AT ?auto_148374 ?auto_148380 ) ( CLEAR ?auto_148374 ) ( IS-CRATE ?auto_148375 ) ( not ( = ?auto_148374 ?auto_148375 ) ) ( AVAILABLE ?auto_148376 ) ( ON ?auto_148374 ?auto_148373 ) ( not ( = ?auto_148373 ?auto_148374 ) ) ( not ( = ?auto_148373 ?auto_148375 ) ) ( TRUCK-AT ?auto_148379 ?auto_148378 ) ( not ( = ?auto_148378 ?auto_148380 ) ) ( HOIST-AT ?auto_148377 ?auto_148378 ) ( LIFTING ?auto_148377 ?auto_148375 ) ( not ( = ?auto_148376 ?auto_148377 ) ) ( ON ?auto_148368 ?auto_148367 ) ( ON ?auto_148369 ?auto_148368 ) ( ON ?auto_148371 ?auto_148369 ) ( ON ?auto_148370 ?auto_148371 ) ( ON ?auto_148372 ?auto_148370 ) ( ON ?auto_148373 ?auto_148372 ) ( not ( = ?auto_148367 ?auto_148368 ) ) ( not ( = ?auto_148367 ?auto_148369 ) ) ( not ( = ?auto_148367 ?auto_148371 ) ) ( not ( = ?auto_148367 ?auto_148370 ) ) ( not ( = ?auto_148367 ?auto_148372 ) ) ( not ( = ?auto_148367 ?auto_148373 ) ) ( not ( = ?auto_148367 ?auto_148374 ) ) ( not ( = ?auto_148367 ?auto_148375 ) ) ( not ( = ?auto_148368 ?auto_148369 ) ) ( not ( = ?auto_148368 ?auto_148371 ) ) ( not ( = ?auto_148368 ?auto_148370 ) ) ( not ( = ?auto_148368 ?auto_148372 ) ) ( not ( = ?auto_148368 ?auto_148373 ) ) ( not ( = ?auto_148368 ?auto_148374 ) ) ( not ( = ?auto_148368 ?auto_148375 ) ) ( not ( = ?auto_148369 ?auto_148371 ) ) ( not ( = ?auto_148369 ?auto_148370 ) ) ( not ( = ?auto_148369 ?auto_148372 ) ) ( not ( = ?auto_148369 ?auto_148373 ) ) ( not ( = ?auto_148369 ?auto_148374 ) ) ( not ( = ?auto_148369 ?auto_148375 ) ) ( not ( = ?auto_148371 ?auto_148370 ) ) ( not ( = ?auto_148371 ?auto_148372 ) ) ( not ( = ?auto_148371 ?auto_148373 ) ) ( not ( = ?auto_148371 ?auto_148374 ) ) ( not ( = ?auto_148371 ?auto_148375 ) ) ( not ( = ?auto_148370 ?auto_148372 ) ) ( not ( = ?auto_148370 ?auto_148373 ) ) ( not ( = ?auto_148370 ?auto_148374 ) ) ( not ( = ?auto_148370 ?auto_148375 ) ) ( not ( = ?auto_148372 ?auto_148373 ) ) ( not ( = ?auto_148372 ?auto_148374 ) ) ( not ( = ?auto_148372 ?auto_148375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148373 ?auto_148374 ?auto_148375 )
      ( MAKE-8CRATE-VERIFY ?auto_148367 ?auto_148368 ?auto_148369 ?auto_148371 ?auto_148370 ?auto_148372 ?auto_148373 ?auto_148374 ?auto_148375 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148459 - SURFACE
      ?auto_148460 - SURFACE
      ?auto_148461 - SURFACE
      ?auto_148463 - SURFACE
      ?auto_148462 - SURFACE
      ?auto_148464 - SURFACE
      ?auto_148465 - SURFACE
      ?auto_148466 - SURFACE
      ?auto_148467 - SURFACE
    )
    :vars
    (
      ?auto_148468 - HOIST
      ?auto_148472 - PLACE
      ?auto_148469 - TRUCK
      ?auto_148471 - PLACE
      ?auto_148470 - HOIST
      ?auto_148473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148468 ?auto_148472 ) ( SURFACE-AT ?auto_148466 ?auto_148472 ) ( CLEAR ?auto_148466 ) ( IS-CRATE ?auto_148467 ) ( not ( = ?auto_148466 ?auto_148467 ) ) ( AVAILABLE ?auto_148468 ) ( ON ?auto_148466 ?auto_148465 ) ( not ( = ?auto_148465 ?auto_148466 ) ) ( not ( = ?auto_148465 ?auto_148467 ) ) ( TRUCK-AT ?auto_148469 ?auto_148471 ) ( not ( = ?auto_148471 ?auto_148472 ) ) ( HOIST-AT ?auto_148470 ?auto_148471 ) ( not ( = ?auto_148468 ?auto_148470 ) ) ( AVAILABLE ?auto_148470 ) ( SURFACE-AT ?auto_148467 ?auto_148471 ) ( ON ?auto_148467 ?auto_148473 ) ( CLEAR ?auto_148467 ) ( not ( = ?auto_148466 ?auto_148473 ) ) ( not ( = ?auto_148467 ?auto_148473 ) ) ( not ( = ?auto_148465 ?auto_148473 ) ) ( ON ?auto_148460 ?auto_148459 ) ( ON ?auto_148461 ?auto_148460 ) ( ON ?auto_148463 ?auto_148461 ) ( ON ?auto_148462 ?auto_148463 ) ( ON ?auto_148464 ?auto_148462 ) ( ON ?auto_148465 ?auto_148464 ) ( not ( = ?auto_148459 ?auto_148460 ) ) ( not ( = ?auto_148459 ?auto_148461 ) ) ( not ( = ?auto_148459 ?auto_148463 ) ) ( not ( = ?auto_148459 ?auto_148462 ) ) ( not ( = ?auto_148459 ?auto_148464 ) ) ( not ( = ?auto_148459 ?auto_148465 ) ) ( not ( = ?auto_148459 ?auto_148466 ) ) ( not ( = ?auto_148459 ?auto_148467 ) ) ( not ( = ?auto_148459 ?auto_148473 ) ) ( not ( = ?auto_148460 ?auto_148461 ) ) ( not ( = ?auto_148460 ?auto_148463 ) ) ( not ( = ?auto_148460 ?auto_148462 ) ) ( not ( = ?auto_148460 ?auto_148464 ) ) ( not ( = ?auto_148460 ?auto_148465 ) ) ( not ( = ?auto_148460 ?auto_148466 ) ) ( not ( = ?auto_148460 ?auto_148467 ) ) ( not ( = ?auto_148460 ?auto_148473 ) ) ( not ( = ?auto_148461 ?auto_148463 ) ) ( not ( = ?auto_148461 ?auto_148462 ) ) ( not ( = ?auto_148461 ?auto_148464 ) ) ( not ( = ?auto_148461 ?auto_148465 ) ) ( not ( = ?auto_148461 ?auto_148466 ) ) ( not ( = ?auto_148461 ?auto_148467 ) ) ( not ( = ?auto_148461 ?auto_148473 ) ) ( not ( = ?auto_148463 ?auto_148462 ) ) ( not ( = ?auto_148463 ?auto_148464 ) ) ( not ( = ?auto_148463 ?auto_148465 ) ) ( not ( = ?auto_148463 ?auto_148466 ) ) ( not ( = ?auto_148463 ?auto_148467 ) ) ( not ( = ?auto_148463 ?auto_148473 ) ) ( not ( = ?auto_148462 ?auto_148464 ) ) ( not ( = ?auto_148462 ?auto_148465 ) ) ( not ( = ?auto_148462 ?auto_148466 ) ) ( not ( = ?auto_148462 ?auto_148467 ) ) ( not ( = ?auto_148462 ?auto_148473 ) ) ( not ( = ?auto_148464 ?auto_148465 ) ) ( not ( = ?auto_148464 ?auto_148466 ) ) ( not ( = ?auto_148464 ?auto_148467 ) ) ( not ( = ?auto_148464 ?auto_148473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148465 ?auto_148466 ?auto_148467 )
      ( MAKE-8CRATE-VERIFY ?auto_148459 ?auto_148460 ?auto_148461 ?auto_148463 ?auto_148462 ?auto_148464 ?auto_148465 ?auto_148466 ?auto_148467 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148552 - SURFACE
      ?auto_148553 - SURFACE
      ?auto_148554 - SURFACE
      ?auto_148556 - SURFACE
      ?auto_148555 - SURFACE
      ?auto_148557 - SURFACE
      ?auto_148558 - SURFACE
      ?auto_148559 - SURFACE
      ?auto_148560 - SURFACE
    )
    :vars
    (
      ?auto_148561 - HOIST
      ?auto_148566 - PLACE
      ?auto_148564 - PLACE
      ?auto_148562 - HOIST
      ?auto_148565 - SURFACE
      ?auto_148563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148561 ?auto_148566 ) ( SURFACE-AT ?auto_148559 ?auto_148566 ) ( CLEAR ?auto_148559 ) ( IS-CRATE ?auto_148560 ) ( not ( = ?auto_148559 ?auto_148560 ) ) ( AVAILABLE ?auto_148561 ) ( ON ?auto_148559 ?auto_148558 ) ( not ( = ?auto_148558 ?auto_148559 ) ) ( not ( = ?auto_148558 ?auto_148560 ) ) ( not ( = ?auto_148564 ?auto_148566 ) ) ( HOIST-AT ?auto_148562 ?auto_148564 ) ( not ( = ?auto_148561 ?auto_148562 ) ) ( AVAILABLE ?auto_148562 ) ( SURFACE-AT ?auto_148560 ?auto_148564 ) ( ON ?auto_148560 ?auto_148565 ) ( CLEAR ?auto_148560 ) ( not ( = ?auto_148559 ?auto_148565 ) ) ( not ( = ?auto_148560 ?auto_148565 ) ) ( not ( = ?auto_148558 ?auto_148565 ) ) ( TRUCK-AT ?auto_148563 ?auto_148566 ) ( ON ?auto_148553 ?auto_148552 ) ( ON ?auto_148554 ?auto_148553 ) ( ON ?auto_148556 ?auto_148554 ) ( ON ?auto_148555 ?auto_148556 ) ( ON ?auto_148557 ?auto_148555 ) ( ON ?auto_148558 ?auto_148557 ) ( not ( = ?auto_148552 ?auto_148553 ) ) ( not ( = ?auto_148552 ?auto_148554 ) ) ( not ( = ?auto_148552 ?auto_148556 ) ) ( not ( = ?auto_148552 ?auto_148555 ) ) ( not ( = ?auto_148552 ?auto_148557 ) ) ( not ( = ?auto_148552 ?auto_148558 ) ) ( not ( = ?auto_148552 ?auto_148559 ) ) ( not ( = ?auto_148552 ?auto_148560 ) ) ( not ( = ?auto_148552 ?auto_148565 ) ) ( not ( = ?auto_148553 ?auto_148554 ) ) ( not ( = ?auto_148553 ?auto_148556 ) ) ( not ( = ?auto_148553 ?auto_148555 ) ) ( not ( = ?auto_148553 ?auto_148557 ) ) ( not ( = ?auto_148553 ?auto_148558 ) ) ( not ( = ?auto_148553 ?auto_148559 ) ) ( not ( = ?auto_148553 ?auto_148560 ) ) ( not ( = ?auto_148553 ?auto_148565 ) ) ( not ( = ?auto_148554 ?auto_148556 ) ) ( not ( = ?auto_148554 ?auto_148555 ) ) ( not ( = ?auto_148554 ?auto_148557 ) ) ( not ( = ?auto_148554 ?auto_148558 ) ) ( not ( = ?auto_148554 ?auto_148559 ) ) ( not ( = ?auto_148554 ?auto_148560 ) ) ( not ( = ?auto_148554 ?auto_148565 ) ) ( not ( = ?auto_148556 ?auto_148555 ) ) ( not ( = ?auto_148556 ?auto_148557 ) ) ( not ( = ?auto_148556 ?auto_148558 ) ) ( not ( = ?auto_148556 ?auto_148559 ) ) ( not ( = ?auto_148556 ?auto_148560 ) ) ( not ( = ?auto_148556 ?auto_148565 ) ) ( not ( = ?auto_148555 ?auto_148557 ) ) ( not ( = ?auto_148555 ?auto_148558 ) ) ( not ( = ?auto_148555 ?auto_148559 ) ) ( not ( = ?auto_148555 ?auto_148560 ) ) ( not ( = ?auto_148555 ?auto_148565 ) ) ( not ( = ?auto_148557 ?auto_148558 ) ) ( not ( = ?auto_148557 ?auto_148559 ) ) ( not ( = ?auto_148557 ?auto_148560 ) ) ( not ( = ?auto_148557 ?auto_148565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148558 ?auto_148559 ?auto_148560 )
      ( MAKE-8CRATE-VERIFY ?auto_148552 ?auto_148553 ?auto_148554 ?auto_148556 ?auto_148555 ?auto_148557 ?auto_148558 ?auto_148559 ?auto_148560 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148645 - SURFACE
      ?auto_148646 - SURFACE
      ?auto_148647 - SURFACE
      ?auto_148649 - SURFACE
      ?auto_148648 - SURFACE
      ?auto_148650 - SURFACE
      ?auto_148651 - SURFACE
      ?auto_148652 - SURFACE
      ?auto_148653 - SURFACE
    )
    :vars
    (
      ?auto_148659 - HOIST
      ?auto_148657 - PLACE
      ?auto_148655 - PLACE
      ?auto_148656 - HOIST
      ?auto_148654 - SURFACE
      ?auto_148658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148659 ?auto_148657 ) ( IS-CRATE ?auto_148653 ) ( not ( = ?auto_148652 ?auto_148653 ) ) ( not ( = ?auto_148651 ?auto_148652 ) ) ( not ( = ?auto_148651 ?auto_148653 ) ) ( not ( = ?auto_148655 ?auto_148657 ) ) ( HOIST-AT ?auto_148656 ?auto_148655 ) ( not ( = ?auto_148659 ?auto_148656 ) ) ( AVAILABLE ?auto_148656 ) ( SURFACE-AT ?auto_148653 ?auto_148655 ) ( ON ?auto_148653 ?auto_148654 ) ( CLEAR ?auto_148653 ) ( not ( = ?auto_148652 ?auto_148654 ) ) ( not ( = ?auto_148653 ?auto_148654 ) ) ( not ( = ?auto_148651 ?auto_148654 ) ) ( TRUCK-AT ?auto_148658 ?auto_148657 ) ( SURFACE-AT ?auto_148651 ?auto_148657 ) ( CLEAR ?auto_148651 ) ( LIFTING ?auto_148659 ?auto_148652 ) ( IS-CRATE ?auto_148652 ) ( ON ?auto_148646 ?auto_148645 ) ( ON ?auto_148647 ?auto_148646 ) ( ON ?auto_148649 ?auto_148647 ) ( ON ?auto_148648 ?auto_148649 ) ( ON ?auto_148650 ?auto_148648 ) ( ON ?auto_148651 ?auto_148650 ) ( not ( = ?auto_148645 ?auto_148646 ) ) ( not ( = ?auto_148645 ?auto_148647 ) ) ( not ( = ?auto_148645 ?auto_148649 ) ) ( not ( = ?auto_148645 ?auto_148648 ) ) ( not ( = ?auto_148645 ?auto_148650 ) ) ( not ( = ?auto_148645 ?auto_148651 ) ) ( not ( = ?auto_148645 ?auto_148652 ) ) ( not ( = ?auto_148645 ?auto_148653 ) ) ( not ( = ?auto_148645 ?auto_148654 ) ) ( not ( = ?auto_148646 ?auto_148647 ) ) ( not ( = ?auto_148646 ?auto_148649 ) ) ( not ( = ?auto_148646 ?auto_148648 ) ) ( not ( = ?auto_148646 ?auto_148650 ) ) ( not ( = ?auto_148646 ?auto_148651 ) ) ( not ( = ?auto_148646 ?auto_148652 ) ) ( not ( = ?auto_148646 ?auto_148653 ) ) ( not ( = ?auto_148646 ?auto_148654 ) ) ( not ( = ?auto_148647 ?auto_148649 ) ) ( not ( = ?auto_148647 ?auto_148648 ) ) ( not ( = ?auto_148647 ?auto_148650 ) ) ( not ( = ?auto_148647 ?auto_148651 ) ) ( not ( = ?auto_148647 ?auto_148652 ) ) ( not ( = ?auto_148647 ?auto_148653 ) ) ( not ( = ?auto_148647 ?auto_148654 ) ) ( not ( = ?auto_148649 ?auto_148648 ) ) ( not ( = ?auto_148649 ?auto_148650 ) ) ( not ( = ?auto_148649 ?auto_148651 ) ) ( not ( = ?auto_148649 ?auto_148652 ) ) ( not ( = ?auto_148649 ?auto_148653 ) ) ( not ( = ?auto_148649 ?auto_148654 ) ) ( not ( = ?auto_148648 ?auto_148650 ) ) ( not ( = ?auto_148648 ?auto_148651 ) ) ( not ( = ?auto_148648 ?auto_148652 ) ) ( not ( = ?auto_148648 ?auto_148653 ) ) ( not ( = ?auto_148648 ?auto_148654 ) ) ( not ( = ?auto_148650 ?auto_148651 ) ) ( not ( = ?auto_148650 ?auto_148652 ) ) ( not ( = ?auto_148650 ?auto_148653 ) ) ( not ( = ?auto_148650 ?auto_148654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148651 ?auto_148652 ?auto_148653 )
      ( MAKE-8CRATE-VERIFY ?auto_148645 ?auto_148646 ?auto_148647 ?auto_148649 ?auto_148648 ?auto_148650 ?auto_148651 ?auto_148652 ?auto_148653 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148738 - SURFACE
      ?auto_148739 - SURFACE
      ?auto_148740 - SURFACE
      ?auto_148742 - SURFACE
      ?auto_148741 - SURFACE
      ?auto_148743 - SURFACE
      ?auto_148744 - SURFACE
      ?auto_148745 - SURFACE
      ?auto_148746 - SURFACE
    )
    :vars
    (
      ?auto_148751 - HOIST
      ?auto_148752 - PLACE
      ?auto_148749 - PLACE
      ?auto_148747 - HOIST
      ?auto_148750 - SURFACE
      ?auto_148748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148751 ?auto_148752 ) ( IS-CRATE ?auto_148746 ) ( not ( = ?auto_148745 ?auto_148746 ) ) ( not ( = ?auto_148744 ?auto_148745 ) ) ( not ( = ?auto_148744 ?auto_148746 ) ) ( not ( = ?auto_148749 ?auto_148752 ) ) ( HOIST-AT ?auto_148747 ?auto_148749 ) ( not ( = ?auto_148751 ?auto_148747 ) ) ( AVAILABLE ?auto_148747 ) ( SURFACE-AT ?auto_148746 ?auto_148749 ) ( ON ?auto_148746 ?auto_148750 ) ( CLEAR ?auto_148746 ) ( not ( = ?auto_148745 ?auto_148750 ) ) ( not ( = ?auto_148746 ?auto_148750 ) ) ( not ( = ?auto_148744 ?auto_148750 ) ) ( TRUCK-AT ?auto_148748 ?auto_148752 ) ( SURFACE-AT ?auto_148744 ?auto_148752 ) ( CLEAR ?auto_148744 ) ( IS-CRATE ?auto_148745 ) ( AVAILABLE ?auto_148751 ) ( IN ?auto_148745 ?auto_148748 ) ( ON ?auto_148739 ?auto_148738 ) ( ON ?auto_148740 ?auto_148739 ) ( ON ?auto_148742 ?auto_148740 ) ( ON ?auto_148741 ?auto_148742 ) ( ON ?auto_148743 ?auto_148741 ) ( ON ?auto_148744 ?auto_148743 ) ( not ( = ?auto_148738 ?auto_148739 ) ) ( not ( = ?auto_148738 ?auto_148740 ) ) ( not ( = ?auto_148738 ?auto_148742 ) ) ( not ( = ?auto_148738 ?auto_148741 ) ) ( not ( = ?auto_148738 ?auto_148743 ) ) ( not ( = ?auto_148738 ?auto_148744 ) ) ( not ( = ?auto_148738 ?auto_148745 ) ) ( not ( = ?auto_148738 ?auto_148746 ) ) ( not ( = ?auto_148738 ?auto_148750 ) ) ( not ( = ?auto_148739 ?auto_148740 ) ) ( not ( = ?auto_148739 ?auto_148742 ) ) ( not ( = ?auto_148739 ?auto_148741 ) ) ( not ( = ?auto_148739 ?auto_148743 ) ) ( not ( = ?auto_148739 ?auto_148744 ) ) ( not ( = ?auto_148739 ?auto_148745 ) ) ( not ( = ?auto_148739 ?auto_148746 ) ) ( not ( = ?auto_148739 ?auto_148750 ) ) ( not ( = ?auto_148740 ?auto_148742 ) ) ( not ( = ?auto_148740 ?auto_148741 ) ) ( not ( = ?auto_148740 ?auto_148743 ) ) ( not ( = ?auto_148740 ?auto_148744 ) ) ( not ( = ?auto_148740 ?auto_148745 ) ) ( not ( = ?auto_148740 ?auto_148746 ) ) ( not ( = ?auto_148740 ?auto_148750 ) ) ( not ( = ?auto_148742 ?auto_148741 ) ) ( not ( = ?auto_148742 ?auto_148743 ) ) ( not ( = ?auto_148742 ?auto_148744 ) ) ( not ( = ?auto_148742 ?auto_148745 ) ) ( not ( = ?auto_148742 ?auto_148746 ) ) ( not ( = ?auto_148742 ?auto_148750 ) ) ( not ( = ?auto_148741 ?auto_148743 ) ) ( not ( = ?auto_148741 ?auto_148744 ) ) ( not ( = ?auto_148741 ?auto_148745 ) ) ( not ( = ?auto_148741 ?auto_148746 ) ) ( not ( = ?auto_148741 ?auto_148750 ) ) ( not ( = ?auto_148743 ?auto_148744 ) ) ( not ( = ?auto_148743 ?auto_148745 ) ) ( not ( = ?auto_148743 ?auto_148746 ) ) ( not ( = ?auto_148743 ?auto_148750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148744 ?auto_148745 ?auto_148746 )
      ( MAKE-8CRATE-VERIFY ?auto_148738 ?auto_148739 ?auto_148740 ?auto_148742 ?auto_148741 ?auto_148743 ?auto_148744 ?auto_148745 ?auto_148746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_150633 - SURFACE
      ?auto_150634 - SURFACE
    )
    :vars
    (
      ?auto_150640 - HOIST
      ?auto_150635 - PLACE
      ?auto_150638 - SURFACE
      ?auto_150639 - PLACE
      ?auto_150641 - HOIST
      ?auto_150636 - SURFACE
      ?auto_150637 - TRUCK
      ?auto_150642 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_150640 ?auto_150635 ) ( SURFACE-AT ?auto_150633 ?auto_150635 ) ( CLEAR ?auto_150633 ) ( IS-CRATE ?auto_150634 ) ( not ( = ?auto_150633 ?auto_150634 ) ) ( ON ?auto_150633 ?auto_150638 ) ( not ( = ?auto_150638 ?auto_150633 ) ) ( not ( = ?auto_150638 ?auto_150634 ) ) ( not ( = ?auto_150639 ?auto_150635 ) ) ( HOIST-AT ?auto_150641 ?auto_150639 ) ( not ( = ?auto_150640 ?auto_150641 ) ) ( AVAILABLE ?auto_150641 ) ( SURFACE-AT ?auto_150634 ?auto_150639 ) ( ON ?auto_150634 ?auto_150636 ) ( CLEAR ?auto_150634 ) ( not ( = ?auto_150633 ?auto_150636 ) ) ( not ( = ?auto_150634 ?auto_150636 ) ) ( not ( = ?auto_150638 ?auto_150636 ) ) ( TRUCK-AT ?auto_150637 ?auto_150635 ) ( LIFTING ?auto_150640 ?auto_150642 ) ( IS-CRATE ?auto_150642 ) ( not ( = ?auto_150633 ?auto_150642 ) ) ( not ( = ?auto_150634 ?auto_150642 ) ) ( not ( = ?auto_150638 ?auto_150642 ) ) ( not ( = ?auto_150636 ?auto_150642 ) ) )
    :subtasks
    ( ( !LOAD ?auto_150640 ?auto_150642 ?auto_150637 ?auto_150635 )
      ( MAKE-1CRATE ?auto_150633 ?auto_150634 )
      ( MAKE-1CRATE-VERIFY ?auto_150633 ?auto_150634 ) )
  )

)

