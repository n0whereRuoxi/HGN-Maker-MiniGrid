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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15218 - SURFACE
      ?auto_15219 - SURFACE
    )
    :vars
    (
      ?auto_15220 - HOIST
      ?auto_15221 - PLACE
      ?auto_15223 - PLACE
      ?auto_15224 - HOIST
      ?auto_15225 - SURFACE
      ?auto_15222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15220 ?auto_15221 ) ( SURFACE-AT ?auto_15218 ?auto_15221 ) ( CLEAR ?auto_15218 ) ( IS-CRATE ?auto_15219 ) ( AVAILABLE ?auto_15220 ) ( not ( = ?auto_15223 ?auto_15221 ) ) ( HOIST-AT ?auto_15224 ?auto_15223 ) ( AVAILABLE ?auto_15224 ) ( SURFACE-AT ?auto_15219 ?auto_15223 ) ( ON ?auto_15219 ?auto_15225 ) ( CLEAR ?auto_15219 ) ( TRUCK-AT ?auto_15222 ?auto_15221 ) ( not ( = ?auto_15218 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15225 ) ) ( not ( = ?auto_15219 ?auto_15225 ) ) ( not ( = ?auto_15220 ?auto_15224 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15222 ?auto_15221 ?auto_15223 )
      ( !LIFT ?auto_15224 ?auto_15219 ?auto_15225 ?auto_15223 )
      ( !LOAD ?auto_15224 ?auto_15219 ?auto_15222 ?auto_15223 )
      ( !DRIVE ?auto_15222 ?auto_15223 ?auto_15221 )
      ( !UNLOAD ?auto_15220 ?auto_15219 ?auto_15222 ?auto_15221 )
      ( !DROP ?auto_15220 ?auto_15219 ?auto_15218 ?auto_15221 )
      ( MAKE-1CRATE-VERIFY ?auto_15218 ?auto_15219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15228 - SURFACE
      ?auto_15229 - SURFACE
    )
    :vars
    (
      ?auto_15230 - HOIST
      ?auto_15231 - PLACE
      ?auto_15233 - PLACE
      ?auto_15234 - HOIST
      ?auto_15235 - SURFACE
      ?auto_15232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15230 ?auto_15231 ) ( SURFACE-AT ?auto_15228 ?auto_15231 ) ( CLEAR ?auto_15228 ) ( IS-CRATE ?auto_15229 ) ( AVAILABLE ?auto_15230 ) ( not ( = ?auto_15233 ?auto_15231 ) ) ( HOIST-AT ?auto_15234 ?auto_15233 ) ( AVAILABLE ?auto_15234 ) ( SURFACE-AT ?auto_15229 ?auto_15233 ) ( ON ?auto_15229 ?auto_15235 ) ( CLEAR ?auto_15229 ) ( TRUCK-AT ?auto_15232 ?auto_15231 ) ( not ( = ?auto_15228 ?auto_15229 ) ) ( not ( = ?auto_15228 ?auto_15235 ) ) ( not ( = ?auto_15229 ?auto_15235 ) ) ( not ( = ?auto_15230 ?auto_15234 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15232 ?auto_15231 ?auto_15233 )
      ( !LIFT ?auto_15234 ?auto_15229 ?auto_15235 ?auto_15233 )
      ( !LOAD ?auto_15234 ?auto_15229 ?auto_15232 ?auto_15233 )
      ( !DRIVE ?auto_15232 ?auto_15233 ?auto_15231 )
      ( !UNLOAD ?auto_15230 ?auto_15229 ?auto_15232 ?auto_15231 )
      ( !DROP ?auto_15230 ?auto_15229 ?auto_15228 ?auto_15231 )
      ( MAKE-1CRATE-VERIFY ?auto_15228 ?auto_15229 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15239 - SURFACE
      ?auto_15240 - SURFACE
      ?auto_15241 - SURFACE
    )
    :vars
    (
      ?auto_15245 - HOIST
      ?auto_15242 - PLACE
      ?auto_15247 - PLACE
      ?auto_15243 - HOIST
      ?auto_15246 - SURFACE
      ?auto_15248 - PLACE
      ?auto_15249 - HOIST
      ?auto_15250 - SURFACE
      ?auto_15244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15245 ?auto_15242 ) ( IS-CRATE ?auto_15241 ) ( not ( = ?auto_15247 ?auto_15242 ) ) ( HOIST-AT ?auto_15243 ?auto_15247 ) ( AVAILABLE ?auto_15243 ) ( SURFACE-AT ?auto_15241 ?auto_15247 ) ( ON ?auto_15241 ?auto_15246 ) ( CLEAR ?auto_15241 ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15246 ) ) ( not ( = ?auto_15241 ?auto_15246 ) ) ( not ( = ?auto_15245 ?auto_15243 ) ) ( SURFACE-AT ?auto_15239 ?auto_15242 ) ( CLEAR ?auto_15239 ) ( IS-CRATE ?auto_15240 ) ( AVAILABLE ?auto_15245 ) ( not ( = ?auto_15248 ?auto_15242 ) ) ( HOIST-AT ?auto_15249 ?auto_15248 ) ( AVAILABLE ?auto_15249 ) ( SURFACE-AT ?auto_15240 ?auto_15248 ) ( ON ?auto_15240 ?auto_15250 ) ( CLEAR ?auto_15240 ) ( TRUCK-AT ?auto_15244 ?auto_15242 ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15250 ) ) ( not ( = ?auto_15240 ?auto_15250 ) ) ( not ( = ?auto_15245 ?auto_15249 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( not ( = ?auto_15239 ?auto_15246 ) ) ( not ( = ?auto_15241 ?auto_15250 ) ) ( not ( = ?auto_15247 ?auto_15248 ) ) ( not ( = ?auto_15243 ?auto_15249 ) ) ( not ( = ?auto_15246 ?auto_15250 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15239 ?auto_15240 )
      ( MAKE-1CRATE ?auto_15240 ?auto_15241 )
      ( MAKE-2CRATE-VERIFY ?auto_15239 ?auto_15240 ?auto_15241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15253 - SURFACE
      ?auto_15254 - SURFACE
    )
    :vars
    (
      ?auto_15255 - HOIST
      ?auto_15256 - PLACE
      ?auto_15258 - PLACE
      ?auto_15259 - HOIST
      ?auto_15260 - SURFACE
      ?auto_15257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15255 ?auto_15256 ) ( SURFACE-AT ?auto_15253 ?auto_15256 ) ( CLEAR ?auto_15253 ) ( IS-CRATE ?auto_15254 ) ( AVAILABLE ?auto_15255 ) ( not ( = ?auto_15258 ?auto_15256 ) ) ( HOIST-AT ?auto_15259 ?auto_15258 ) ( AVAILABLE ?auto_15259 ) ( SURFACE-AT ?auto_15254 ?auto_15258 ) ( ON ?auto_15254 ?auto_15260 ) ( CLEAR ?auto_15254 ) ( TRUCK-AT ?auto_15257 ?auto_15256 ) ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15253 ?auto_15260 ) ) ( not ( = ?auto_15254 ?auto_15260 ) ) ( not ( = ?auto_15255 ?auto_15259 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15257 ?auto_15256 ?auto_15258 )
      ( !LIFT ?auto_15259 ?auto_15254 ?auto_15260 ?auto_15258 )
      ( !LOAD ?auto_15259 ?auto_15254 ?auto_15257 ?auto_15258 )
      ( !DRIVE ?auto_15257 ?auto_15258 ?auto_15256 )
      ( !UNLOAD ?auto_15255 ?auto_15254 ?auto_15257 ?auto_15256 )
      ( !DROP ?auto_15255 ?auto_15254 ?auto_15253 ?auto_15256 )
      ( MAKE-1CRATE-VERIFY ?auto_15253 ?auto_15254 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15265 - SURFACE
      ?auto_15266 - SURFACE
      ?auto_15267 - SURFACE
      ?auto_15268 - SURFACE
    )
    :vars
    (
      ?auto_15269 - HOIST
      ?auto_15272 - PLACE
      ?auto_15270 - PLACE
      ?auto_15273 - HOIST
      ?auto_15271 - SURFACE
      ?auto_15275 - PLACE
      ?auto_15278 - HOIST
      ?auto_15279 - SURFACE
      ?auto_15276 - PLACE
      ?auto_15280 - HOIST
      ?auto_15277 - SURFACE
      ?auto_15274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15269 ?auto_15272 ) ( IS-CRATE ?auto_15268 ) ( not ( = ?auto_15270 ?auto_15272 ) ) ( HOIST-AT ?auto_15273 ?auto_15270 ) ( AVAILABLE ?auto_15273 ) ( SURFACE-AT ?auto_15268 ?auto_15270 ) ( ON ?auto_15268 ?auto_15271 ) ( CLEAR ?auto_15268 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15271 ) ) ( not ( = ?auto_15268 ?auto_15271 ) ) ( not ( = ?auto_15269 ?auto_15273 ) ) ( IS-CRATE ?auto_15267 ) ( not ( = ?auto_15275 ?auto_15272 ) ) ( HOIST-AT ?auto_15278 ?auto_15275 ) ( AVAILABLE ?auto_15278 ) ( SURFACE-AT ?auto_15267 ?auto_15275 ) ( ON ?auto_15267 ?auto_15279 ) ( CLEAR ?auto_15267 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15279 ) ) ( not ( = ?auto_15267 ?auto_15279 ) ) ( not ( = ?auto_15269 ?auto_15278 ) ) ( SURFACE-AT ?auto_15265 ?auto_15272 ) ( CLEAR ?auto_15265 ) ( IS-CRATE ?auto_15266 ) ( AVAILABLE ?auto_15269 ) ( not ( = ?auto_15276 ?auto_15272 ) ) ( HOIST-AT ?auto_15280 ?auto_15276 ) ( AVAILABLE ?auto_15280 ) ( SURFACE-AT ?auto_15266 ?auto_15276 ) ( ON ?auto_15266 ?auto_15277 ) ( CLEAR ?auto_15266 ) ( TRUCK-AT ?auto_15274 ?auto_15272 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15277 ) ) ( not ( = ?auto_15266 ?auto_15277 ) ) ( not ( = ?auto_15269 ?auto_15280 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15279 ) ) ( not ( = ?auto_15267 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15276 ) ) ( not ( = ?auto_15278 ?auto_15280 ) ) ( not ( = ?auto_15279 ?auto_15277 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15271 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15271 ) ) ( not ( = ?auto_15268 ?auto_15279 ) ) ( not ( = ?auto_15268 ?auto_15277 ) ) ( not ( = ?auto_15270 ?auto_15275 ) ) ( not ( = ?auto_15270 ?auto_15276 ) ) ( not ( = ?auto_15273 ?auto_15278 ) ) ( not ( = ?auto_15273 ?auto_15280 ) ) ( not ( = ?auto_15271 ?auto_15279 ) ) ( not ( = ?auto_15271 ?auto_15277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15265 ?auto_15266 ?auto_15267 )
      ( MAKE-1CRATE ?auto_15267 ?auto_15268 )
      ( MAKE-3CRATE-VERIFY ?auto_15265 ?auto_15266 ?auto_15267 ?auto_15268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15283 - SURFACE
      ?auto_15284 - SURFACE
    )
    :vars
    (
      ?auto_15285 - HOIST
      ?auto_15286 - PLACE
      ?auto_15288 - PLACE
      ?auto_15289 - HOIST
      ?auto_15290 - SURFACE
      ?auto_15287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15285 ?auto_15286 ) ( SURFACE-AT ?auto_15283 ?auto_15286 ) ( CLEAR ?auto_15283 ) ( IS-CRATE ?auto_15284 ) ( AVAILABLE ?auto_15285 ) ( not ( = ?auto_15288 ?auto_15286 ) ) ( HOIST-AT ?auto_15289 ?auto_15288 ) ( AVAILABLE ?auto_15289 ) ( SURFACE-AT ?auto_15284 ?auto_15288 ) ( ON ?auto_15284 ?auto_15290 ) ( CLEAR ?auto_15284 ) ( TRUCK-AT ?auto_15287 ?auto_15286 ) ( not ( = ?auto_15283 ?auto_15284 ) ) ( not ( = ?auto_15283 ?auto_15290 ) ) ( not ( = ?auto_15284 ?auto_15290 ) ) ( not ( = ?auto_15285 ?auto_15289 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15287 ?auto_15286 ?auto_15288 )
      ( !LIFT ?auto_15289 ?auto_15284 ?auto_15290 ?auto_15288 )
      ( !LOAD ?auto_15289 ?auto_15284 ?auto_15287 ?auto_15288 )
      ( !DRIVE ?auto_15287 ?auto_15288 ?auto_15286 )
      ( !UNLOAD ?auto_15285 ?auto_15284 ?auto_15287 ?auto_15286 )
      ( !DROP ?auto_15285 ?auto_15284 ?auto_15283 ?auto_15286 )
      ( MAKE-1CRATE-VERIFY ?auto_15283 ?auto_15284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15296 - SURFACE
      ?auto_15297 - SURFACE
      ?auto_15298 - SURFACE
      ?auto_15299 - SURFACE
      ?auto_15300 - SURFACE
    )
    :vars
    (
      ?auto_15304 - HOIST
      ?auto_15301 - PLACE
      ?auto_15306 - PLACE
      ?auto_15305 - HOIST
      ?auto_15303 - SURFACE
      ?auto_15307 - PLACE
      ?auto_15309 - HOIST
      ?auto_15310 - SURFACE
      ?auto_15313 - PLACE
      ?auto_15308 - HOIST
      ?auto_15315 - SURFACE
      ?auto_15314 - PLACE
      ?auto_15312 - HOIST
      ?auto_15311 - SURFACE
      ?auto_15302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15304 ?auto_15301 ) ( IS-CRATE ?auto_15300 ) ( not ( = ?auto_15306 ?auto_15301 ) ) ( HOIST-AT ?auto_15305 ?auto_15306 ) ( AVAILABLE ?auto_15305 ) ( SURFACE-AT ?auto_15300 ?auto_15306 ) ( ON ?auto_15300 ?auto_15303 ) ( CLEAR ?auto_15300 ) ( not ( = ?auto_15299 ?auto_15300 ) ) ( not ( = ?auto_15299 ?auto_15303 ) ) ( not ( = ?auto_15300 ?auto_15303 ) ) ( not ( = ?auto_15304 ?auto_15305 ) ) ( IS-CRATE ?auto_15299 ) ( not ( = ?auto_15307 ?auto_15301 ) ) ( HOIST-AT ?auto_15309 ?auto_15307 ) ( AVAILABLE ?auto_15309 ) ( SURFACE-AT ?auto_15299 ?auto_15307 ) ( ON ?auto_15299 ?auto_15310 ) ( CLEAR ?auto_15299 ) ( not ( = ?auto_15298 ?auto_15299 ) ) ( not ( = ?auto_15298 ?auto_15310 ) ) ( not ( = ?auto_15299 ?auto_15310 ) ) ( not ( = ?auto_15304 ?auto_15309 ) ) ( IS-CRATE ?auto_15298 ) ( not ( = ?auto_15313 ?auto_15301 ) ) ( HOIST-AT ?auto_15308 ?auto_15313 ) ( AVAILABLE ?auto_15308 ) ( SURFACE-AT ?auto_15298 ?auto_15313 ) ( ON ?auto_15298 ?auto_15315 ) ( CLEAR ?auto_15298 ) ( not ( = ?auto_15297 ?auto_15298 ) ) ( not ( = ?auto_15297 ?auto_15315 ) ) ( not ( = ?auto_15298 ?auto_15315 ) ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( SURFACE-AT ?auto_15296 ?auto_15301 ) ( CLEAR ?auto_15296 ) ( IS-CRATE ?auto_15297 ) ( AVAILABLE ?auto_15304 ) ( not ( = ?auto_15314 ?auto_15301 ) ) ( HOIST-AT ?auto_15312 ?auto_15314 ) ( AVAILABLE ?auto_15312 ) ( SURFACE-AT ?auto_15297 ?auto_15314 ) ( ON ?auto_15297 ?auto_15311 ) ( CLEAR ?auto_15297 ) ( TRUCK-AT ?auto_15302 ?auto_15301 ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15311 ) ) ( not ( = ?auto_15297 ?auto_15311 ) ) ( not ( = ?auto_15304 ?auto_15312 ) ) ( not ( = ?auto_15296 ?auto_15298 ) ) ( not ( = ?auto_15296 ?auto_15315 ) ) ( not ( = ?auto_15298 ?auto_15311 ) ) ( not ( = ?auto_15313 ?auto_15314 ) ) ( not ( = ?auto_15308 ?auto_15312 ) ) ( not ( = ?auto_15315 ?auto_15311 ) ) ( not ( = ?auto_15296 ?auto_15299 ) ) ( not ( = ?auto_15296 ?auto_15310 ) ) ( not ( = ?auto_15297 ?auto_15299 ) ) ( not ( = ?auto_15297 ?auto_15310 ) ) ( not ( = ?auto_15299 ?auto_15315 ) ) ( not ( = ?auto_15299 ?auto_15311 ) ) ( not ( = ?auto_15307 ?auto_15313 ) ) ( not ( = ?auto_15307 ?auto_15314 ) ) ( not ( = ?auto_15309 ?auto_15308 ) ) ( not ( = ?auto_15309 ?auto_15312 ) ) ( not ( = ?auto_15310 ?auto_15315 ) ) ( not ( = ?auto_15310 ?auto_15311 ) ) ( not ( = ?auto_15296 ?auto_15300 ) ) ( not ( = ?auto_15296 ?auto_15303 ) ) ( not ( = ?auto_15297 ?auto_15300 ) ) ( not ( = ?auto_15297 ?auto_15303 ) ) ( not ( = ?auto_15298 ?auto_15300 ) ) ( not ( = ?auto_15298 ?auto_15303 ) ) ( not ( = ?auto_15300 ?auto_15310 ) ) ( not ( = ?auto_15300 ?auto_15315 ) ) ( not ( = ?auto_15300 ?auto_15311 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15313 ) ) ( not ( = ?auto_15306 ?auto_15314 ) ) ( not ( = ?auto_15305 ?auto_15309 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15312 ) ) ( not ( = ?auto_15303 ?auto_15310 ) ) ( not ( = ?auto_15303 ?auto_15315 ) ) ( not ( = ?auto_15303 ?auto_15311 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15296 ?auto_15297 ?auto_15298 ?auto_15299 )
      ( MAKE-1CRATE ?auto_15299 ?auto_15300 )
      ( MAKE-4CRATE-VERIFY ?auto_15296 ?auto_15297 ?auto_15298 ?auto_15299 ?auto_15300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15318 - SURFACE
      ?auto_15319 - SURFACE
    )
    :vars
    (
      ?auto_15320 - HOIST
      ?auto_15321 - PLACE
      ?auto_15323 - PLACE
      ?auto_15324 - HOIST
      ?auto_15325 - SURFACE
      ?auto_15322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15320 ?auto_15321 ) ( SURFACE-AT ?auto_15318 ?auto_15321 ) ( CLEAR ?auto_15318 ) ( IS-CRATE ?auto_15319 ) ( AVAILABLE ?auto_15320 ) ( not ( = ?auto_15323 ?auto_15321 ) ) ( HOIST-AT ?auto_15324 ?auto_15323 ) ( AVAILABLE ?auto_15324 ) ( SURFACE-AT ?auto_15319 ?auto_15323 ) ( ON ?auto_15319 ?auto_15325 ) ( CLEAR ?auto_15319 ) ( TRUCK-AT ?auto_15322 ?auto_15321 ) ( not ( = ?auto_15318 ?auto_15319 ) ) ( not ( = ?auto_15318 ?auto_15325 ) ) ( not ( = ?auto_15319 ?auto_15325 ) ) ( not ( = ?auto_15320 ?auto_15324 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15322 ?auto_15321 ?auto_15323 )
      ( !LIFT ?auto_15324 ?auto_15319 ?auto_15325 ?auto_15323 )
      ( !LOAD ?auto_15324 ?auto_15319 ?auto_15322 ?auto_15323 )
      ( !DRIVE ?auto_15322 ?auto_15323 ?auto_15321 )
      ( !UNLOAD ?auto_15320 ?auto_15319 ?auto_15322 ?auto_15321 )
      ( !DROP ?auto_15320 ?auto_15319 ?auto_15318 ?auto_15321 )
      ( MAKE-1CRATE-VERIFY ?auto_15318 ?auto_15319 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15332 - SURFACE
      ?auto_15333 - SURFACE
      ?auto_15334 - SURFACE
      ?auto_15335 - SURFACE
      ?auto_15336 - SURFACE
      ?auto_15337 - SURFACE
    )
    :vars
    (
      ?auto_15342 - HOIST
      ?auto_15339 - PLACE
      ?auto_15340 - PLACE
      ?auto_15341 - HOIST
      ?auto_15338 - SURFACE
      ?auto_15353 - PLACE
      ?auto_15351 - HOIST
      ?auto_15350 - SURFACE
      ?auto_15347 - PLACE
      ?auto_15348 - HOIST
      ?auto_15345 - SURFACE
      ?auto_15349 - PLACE
      ?auto_15346 - HOIST
      ?auto_15352 - SURFACE
      ?auto_15344 - SURFACE
      ?auto_15343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15342 ?auto_15339 ) ( IS-CRATE ?auto_15337 ) ( not ( = ?auto_15340 ?auto_15339 ) ) ( HOIST-AT ?auto_15341 ?auto_15340 ) ( SURFACE-AT ?auto_15337 ?auto_15340 ) ( ON ?auto_15337 ?auto_15338 ) ( CLEAR ?auto_15337 ) ( not ( = ?auto_15336 ?auto_15337 ) ) ( not ( = ?auto_15336 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15342 ?auto_15341 ) ) ( IS-CRATE ?auto_15336 ) ( not ( = ?auto_15353 ?auto_15339 ) ) ( HOIST-AT ?auto_15351 ?auto_15353 ) ( AVAILABLE ?auto_15351 ) ( SURFACE-AT ?auto_15336 ?auto_15353 ) ( ON ?auto_15336 ?auto_15350 ) ( CLEAR ?auto_15336 ) ( not ( = ?auto_15335 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15350 ) ) ( not ( = ?auto_15336 ?auto_15350 ) ) ( not ( = ?auto_15342 ?auto_15351 ) ) ( IS-CRATE ?auto_15335 ) ( not ( = ?auto_15347 ?auto_15339 ) ) ( HOIST-AT ?auto_15348 ?auto_15347 ) ( AVAILABLE ?auto_15348 ) ( SURFACE-AT ?auto_15335 ?auto_15347 ) ( ON ?auto_15335 ?auto_15345 ) ( CLEAR ?auto_15335 ) ( not ( = ?auto_15334 ?auto_15335 ) ) ( not ( = ?auto_15334 ?auto_15345 ) ) ( not ( = ?auto_15335 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15348 ) ) ( IS-CRATE ?auto_15334 ) ( not ( = ?auto_15349 ?auto_15339 ) ) ( HOIST-AT ?auto_15346 ?auto_15349 ) ( AVAILABLE ?auto_15346 ) ( SURFACE-AT ?auto_15334 ?auto_15349 ) ( ON ?auto_15334 ?auto_15352 ) ( CLEAR ?auto_15334 ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15352 ) ) ( not ( = ?auto_15334 ?auto_15352 ) ) ( not ( = ?auto_15342 ?auto_15346 ) ) ( SURFACE-AT ?auto_15332 ?auto_15339 ) ( CLEAR ?auto_15332 ) ( IS-CRATE ?auto_15333 ) ( AVAILABLE ?auto_15342 ) ( AVAILABLE ?auto_15341 ) ( SURFACE-AT ?auto_15333 ?auto_15340 ) ( ON ?auto_15333 ?auto_15344 ) ( CLEAR ?auto_15333 ) ( TRUCK-AT ?auto_15343 ?auto_15339 ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( not ( = ?auto_15332 ?auto_15344 ) ) ( not ( = ?auto_15333 ?auto_15344 ) ) ( not ( = ?auto_15332 ?auto_15334 ) ) ( not ( = ?auto_15332 ?auto_15352 ) ) ( not ( = ?auto_15334 ?auto_15344 ) ) ( not ( = ?auto_15349 ?auto_15340 ) ) ( not ( = ?auto_15346 ?auto_15341 ) ) ( not ( = ?auto_15352 ?auto_15344 ) ) ( not ( = ?auto_15332 ?auto_15335 ) ) ( not ( = ?auto_15332 ?auto_15345 ) ) ( not ( = ?auto_15333 ?auto_15335 ) ) ( not ( = ?auto_15333 ?auto_15345 ) ) ( not ( = ?auto_15335 ?auto_15352 ) ) ( not ( = ?auto_15335 ?auto_15344 ) ) ( not ( = ?auto_15347 ?auto_15349 ) ) ( not ( = ?auto_15347 ?auto_15340 ) ) ( not ( = ?auto_15348 ?auto_15346 ) ) ( not ( = ?auto_15348 ?auto_15341 ) ) ( not ( = ?auto_15345 ?auto_15352 ) ) ( not ( = ?auto_15345 ?auto_15344 ) ) ( not ( = ?auto_15332 ?auto_15336 ) ) ( not ( = ?auto_15332 ?auto_15350 ) ) ( not ( = ?auto_15333 ?auto_15336 ) ) ( not ( = ?auto_15333 ?auto_15350 ) ) ( not ( = ?auto_15334 ?auto_15336 ) ) ( not ( = ?auto_15334 ?auto_15350 ) ) ( not ( = ?auto_15336 ?auto_15345 ) ) ( not ( = ?auto_15336 ?auto_15352 ) ) ( not ( = ?auto_15336 ?auto_15344 ) ) ( not ( = ?auto_15353 ?auto_15347 ) ) ( not ( = ?auto_15353 ?auto_15349 ) ) ( not ( = ?auto_15353 ?auto_15340 ) ) ( not ( = ?auto_15351 ?auto_15348 ) ) ( not ( = ?auto_15351 ?auto_15346 ) ) ( not ( = ?auto_15351 ?auto_15341 ) ) ( not ( = ?auto_15350 ?auto_15345 ) ) ( not ( = ?auto_15350 ?auto_15352 ) ) ( not ( = ?auto_15350 ?auto_15344 ) ) ( not ( = ?auto_15332 ?auto_15337 ) ) ( not ( = ?auto_15332 ?auto_15338 ) ) ( not ( = ?auto_15333 ?auto_15337 ) ) ( not ( = ?auto_15333 ?auto_15338 ) ) ( not ( = ?auto_15334 ?auto_15337 ) ) ( not ( = ?auto_15334 ?auto_15338 ) ) ( not ( = ?auto_15335 ?auto_15337 ) ) ( not ( = ?auto_15335 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15350 ) ) ( not ( = ?auto_15337 ?auto_15345 ) ) ( not ( = ?auto_15337 ?auto_15352 ) ) ( not ( = ?auto_15337 ?auto_15344 ) ) ( not ( = ?auto_15338 ?auto_15350 ) ) ( not ( = ?auto_15338 ?auto_15345 ) ) ( not ( = ?auto_15338 ?auto_15352 ) ) ( not ( = ?auto_15338 ?auto_15344 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15332 ?auto_15333 ?auto_15334 ?auto_15335 ?auto_15336 )
      ( MAKE-1CRATE ?auto_15336 ?auto_15337 )
      ( MAKE-5CRATE-VERIFY ?auto_15332 ?auto_15333 ?auto_15334 ?auto_15335 ?auto_15336 ?auto_15337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15356 - SURFACE
      ?auto_15357 - SURFACE
    )
    :vars
    (
      ?auto_15358 - HOIST
      ?auto_15359 - PLACE
      ?auto_15361 - PLACE
      ?auto_15362 - HOIST
      ?auto_15363 - SURFACE
      ?auto_15360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15358 ?auto_15359 ) ( SURFACE-AT ?auto_15356 ?auto_15359 ) ( CLEAR ?auto_15356 ) ( IS-CRATE ?auto_15357 ) ( AVAILABLE ?auto_15358 ) ( not ( = ?auto_15361 ?auto_15359 ) ) ( HOIST-AT ?auto_15362 ?auto_15361 ) ( AVAILABLE ?auto_15362 ) ( SURFACE-AT ?auto_15357 ?auto_15361 ) ( ON ?auto_15357 ?auto_15363 ) ( CLEAR ?auto_15357 ) ( TRUCK-AT ?auto_15360 ?auto_15359 ) ( not ( = ?auto_15356 ?auto_15357 ) ) ( not ( = ?auto_15356 ?auto_15363 ) ) ( not ( = ?auto_15357 ?auto_15363 ) ) ( not ( = ?auto_15358 ?auto_15362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15360 ?auto_15359 ?auto_15361 )
      ( !LIFT ?auto_15362 ?auto_15357 ?auto_15363 ?auto_15361 )
      ( !LOAD ?auto_15362 ?auto_15357 ?auto_15360 ?auto_15361 )
      ( !DRIVE ?auto_15360 ?auto_15361 ?auto_15359 )
      ( !UNLOAD ?auto_15358 ?auto_15357 ?auto_15360 ?auto_15359 )
      ( !DROP ?auto_15358 ?auto_15357 ?auto_15356 ?auto_15359 )
      ( MAKE-1CRATE-VERIFY ?auto_15356 ?auto_15357 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15371 - SURFACE
      ?auto_15372 - SURFACE
      ?auto_15373 - SURFACE
      ?auto_15374 - SURFACE
      ?auto_15375 - SURFACE
      ?auto_15376 - SURFACE
      ?auto_15377 - SURFACE
    )
    :vars
    (
      ?auto_15379 - HOIST
      ?auto_15381 - PLACE
      ?auto_15383 - PLACE
      ?auto_15380 - HOIST
      ?auto_15378 - SURFACE
      ?auto_15393 - PLACE
      ?auto_15396 - HOIST
      ?auto_15395 - SURFACE
      ?auto_15385 - PLACE
      ?auto_15387 - HOIST
      ?auto_15391 - SURFACE
      ?auto_15390 - PLACE
      ?auto_15389 - HOIST
      ?auto_15394 - SURFACE
      ?auto_15392 - PLACE
      ?auto_15388 - HOIST
      ?auto_15386 - SURFACE
      ?auto_15384 - SURFACE
      ?auto_15382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15379 ?auto_15381 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15383 ?auto_15381 ) ) ( HOIST-AT ?auto_15380 ?auto_15383 ) ( AVAILABLE ?auto_15380 ) ( SURFACE-AT ?auto_15377 ?auto_15383 ) ( ON ?auto_15377 ?auto_15378 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15378 ) ) ( not ( = ?auto_15379 ?auto_15380 ) ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15393 ?auto_15381 ) ) ( HOIST-AT ?auto_15396 ?auto_15393 ) ( SURFACE-AT ?auto_15376 ?auto_15393 ) ( ON ?auto_15376 ?auto_15395 ) ( CLEAR ?auto_15376 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15395 ) ) ( not ( = ?auto_15376 ?auto_15395 ) ) ( not ( = ?auto_15379 ?auto_15396 ) ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15385 ?auto_15381 ) ) ( HOIST-AT ?auto_15387 ?auto_15385 ) ( AVAILABLE ?auto_15387 ) ( SURFACE-AT ?auto_15375 ?auto_15385 ) ( ON ?auto_15375 ?auto_15391 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15391 ) ) ( not ( = ?auto_15375 ?auto_15391 ) ) ( not ( = ?auto_15379 ?auto_15387 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15390 ?auto_15381 ) ) ( HOIST-AT ?auto_15389 ?auto_15390 ) ( AVAILABLE ?auto_15389 ) ( SURFACE-AT ?auto_15374 ?auto_15390 ) ( ON ?auto_15374 ?auto_15394 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15394 ) ) ( not ( = ?auto_15374 ?auto_15394 ) ) ( not ( = ?auto_15379 ?auto_15389 ) ) ( IS-CRATE ?auto_15373 ) ( not ( = ?auto_15392 ?auto_15381 ) ) ( HOIST-AT ?auto_15388 ?auto_15392 ) ( AVAILABLE ?auto_15388 ) ( SURFACE-AT ?auto_15373 ?auto_15392 ) ( ON ?auto_15373 ?auto_15386 ) ( CLEAR ?auto_15373 ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15386 ) ) ( not ( = ?auto_15373 ?auto_15386 ) ) ( not ( = ?auto_15379 ?auto_15388 ) ) ( SURFACE-AT ?auto_15371 ?auto_15381 ) ( CLEAR ?auto_15371 ) ( IS-CRATE ?auto_15372 ) ( AVAILABLE ?auto_15379 ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15372 ?auto_15393 ) ( ON ?auto_15372 ?auto_15384 ) ( CLEAR ?auto_15372 ) ( TRUCK-AT ?auto_15382 ?auto_15381 ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15384 ) ) ( not ( = ?auto_15372 ?auto_15384 ) ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15386 ) ) ( not ( = ?auto_15373 ?auto_15384 ) ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15388 ?auto_15396 ) ) ( not ( = ?auto_15386 ?auto_15384 ) ) ( not ( = ?auto_15371 ?auto_15374 ) ) ( not ( = ?auto_15371 ?auto_15394 ) ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15394 ) ) ( not ( = ?auto_15374 ?auto_15386 ) ) ( not ( = ?auto_15374 ?auto_15384 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15388 ) ) ( not ( = ?auto_15389 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15386 ) ) ( not ( = ?auto_15394 ?auto_15384 ) ) ( not ( = ?auto_15371 ?auto_15375 ) ) ( not ( = ?auto_15371 ?auto_15391 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15391 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15391 ) ) ( not ( = ?auto_15375 ?auto_15394 ) ) ( not ( = ?auto_15375 ?auto_15386 ) ) ( not ( = ?auto_15375 ?auto_15384 ) ) ( not ( = ?auto_15385 ?auto_15390 ) ) ( not ( = ?auto_15385 ?auto_15392 ) ) ( not ( = ?auto_15385 ?auto_15393 ) ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15396 ) ) ( not ( = ?auto_15391 ?auto_15394 ) ) ( not ( = ?auto_15391 ?auto_15386 ) ) ( not ( = ?auto_15391 ?auto_15384 ) ) ( not ( = ?auto_15371 ?auto_15376 ) ) ( not ( = ?auto_15371 ?auto_15395 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15395 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15395 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15395 ) ) ( not ( = ?auto_15376 ?auto_15391 ) ) ( not ( = ?auto_15376 ?auto_15394 ) ) ( not ( = ?auto_15376 ?auto_15386 ) ) ( not ( = ?auto_15376 ?auto_15384 ) ) ( not ( = ?auto_15395 ?auto_15391 ) ) ( not ( = ?auto_15395 ?auto_15394 ) ) ( not ( = ?auto_15395 ?auto_15386 ) ) ( not ( = ?auto_15395 ?auto_15384 ) ) ( not ( = ?auto_15371 ?auto_15377 ) ) ( not ( = ?auto_15371 ?auto_15378 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15372 ?auto_15378 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) ( not ( = ?auto_15373 ?auto_15378 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15378 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15395 ) ) ( not ( = ?auto_15377 ?auto_15391 ) ) ( not ( = ?auto_15377 ?auto_15394 ) ) ( not ( = ?auto_15377 ?auto_15386 ) ) ( not ( = ?auto_15377 ?auto_15384 ) ) ( not ( = ?auto_15383 ?auto_15393 ) ) ( not ( = ?auto_15383 ?auto_15385 ) ) ( not ( = ?auto_15383 ?auto_15390 ) ) ( not ( = ?auto_15383 ?auto_15392 ) ) ( not ( = ?auto_15380 ?auto_15396 ) ) ( not ( = ?auto_15380 ?auto_15387 ) ) ( not ( = ?auto_15380 ?auto_15389 ) ) ( not ( = ?auto_15380 ?auto_15388 ) ) ( not ( = ?auto_15378 ?auto_15395 ) ) ( not ( = ?auto_15378 ?auto_15391 ) ) ( not ( = ?auto_15378 ?auto_15394 ) ) ( not ( = ?auto_15378 ?auto_15386 ) ) ( not ( = ?auto_15378 ?auto_15384 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15371 ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 )
      ( MAKE-1CRATE ?auto_15376 ?auto_15377 )
      ( MAKE-6CRATE-VERIFY ?auto_15371 ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15399 - SURFACE
      ?auto_15400 - SURFACE
    )
    :vars
    (
      ?auto_15401 - HOIST
      ?auto_15402 - PLACE
      ?auto_15404 - PLACE
      ?auto_15405 - HOIST
      ?auto_15406 - SURFACE
      ?auto_15403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15401 ?auto_15402 ) ( SURFACE-AT ?auto_15399 ?auto_15402 ) ( CLEAR ?auto_15399 ) ( IS-CRATE ?auto_15400 ) ( AVAILABLE ?auto_15401 ) ( not ( = ?auto_15404 ?auto_15402 ) ) ( HOIST-AT ?auto_15405 ?auto_15404 ) ( AVAILABLE ?auto_15405 ) ( SURFACE-AT ?auto_15400 ?auto_15404 ) ( ON ?auto_15400 ?auto_15406 ) ( CLEAR ?auto_15400 ) ( TRUCK-AT ?auto_15403 ?auto_15402 ) ( not ( = ?auto_15399 ?auto_15400 ) ) ( not ( = ?auto_15399 ?auto_15406 ) ) ( not ( = ?auto_15400 ?auto_15406 ) ) ( not ( = ?auto_15401 ?auto_15405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15403 ?auto_15402 ?auto_15404 )
      ( !LIFT ?auto_15405 ?auto_15400 ?auto_15406 ?auto_15404 )
      ( !LOAD ?auto_15405 ?auto_15400 ?auto_15403 ?auto_15404 )
      ( !DRIVE ?auto_15403 ?auto_15404 ?auto_15402 )
      ( !UNLOAD ?auto_15401 ?auto_15400 ?auto_15403 ?auto_15402 )
      ( !DROP ?auto_15401 ?auto_15400 ?auto_15399 ?auto_15402 )
      ( MAKE-1CRATE-VERIFY ?auto_15399 ?auto_15400 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_15415 - SURFACE
      ?auto_15416 - SURFACE
      ?auto_15417 - SURFACE
      ?auto_15418 - SURFACE
      ?auto_15419 - SURFACE
      ?auto_15420 - SURFACE
      ?auto_15422 - SURFACE
      ?auto_15421 - SURFACE
    )
    :vars
    (
      ?auto_15426 - HOIST
      ?auto_15428 - PLACE
      ?auto_15424 - PLACE
      ?auto_15425 - HOIST
      ?auto_15423 - SURFACE
      ?auto_15432 - PLACE
      ?auto_15437 - HOIST
      ?auto_15436 - SURFACE
      ?auto_15431 - PLACE
      ?auto_15441 - HOIST
      ?auto_15440 - SURFACE
      ?auto_15433 - PLACE
      ?auto_15434 - HOIST
      ?auto_15442 - SURFACE
      ?auto_15443 - PLACE
      ?auto_15444 - HOIST
      ?auto_15430 - SURFACE
      ?auto_15439 - PLACE
      ?auto_15429 - HOIST
      ?auto_15435 - SURFACE
      ?auto_15438 - SURFACE
      ?auto_15427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15426 ?auto_15428 ) ( IS-CRATE ?auto_15421 ) ( not ( = ?auto_15424 ?auto_15428 ) ) ( HOIST-AT ?auto_15425 ?auto_15424 ) ( AVAILABLE ?auto_15425 ) ( SURFACE-AT ?auto_15421 ?auto_15424 ) ( ON ?auto_15421 ?auto_15423 ) ( CLEAR ?auto_15421 ) ( not ( = ?auto_15422 ?auto_15421 ) ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) ( not ( = ?auto_15426 ?auto_15425 ) ) ( IS-CRATE ?auto_15422 ) ( not ( = ?auto_15432 ?auto_15428 ) ) ( HOIST-AT ?auto_15437 ?auto_15432 ) ( AVAILABLE ?auto_15437 ) ( SURFACE-AT ?auto_15422 ?auto_15432 ) ( ON ?auto_15422 ?auto_15436 ) ( CLEAR ?auto_15422 ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15436 ) ) ( not ( = ?auto_15422 ?auto_15436 ) ) ( not ( = ?auto_15426 ?auto_15437 ) ) ( IS-CRATE ?auto_15420 ) ( not ( = ?auto_15431 ?auto_15428 ) ) ( HOIST-AT ?auto_15441 ?auto_15431 ) ( SURFACE-AT ?auto_15420 ?auto_15431 ) ( ON ?auto_15420 ?auto_15440 ) ( CLEAR ?auto_15420 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15440 ) ) ( not ( = ?auto_15420 ?auto_15440 ) ) ( not ( = ?auto_15426 ?auto_15441 ) ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15433 ?auto_15428 ) ) ( HOIST-AT ?auto_15434 ?auto_15433 ) ( AVAILABLE ?auto_15434 ) ( SURFACE-AT ?auto_15419 ?auto_15433 ) ( ON ?auto_15419 ?auto_15442 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15442 ) ) ( not ( = ?auto_15419 ?auto_15442 ) ) ( not ( = ?auto_15426 ?auto_15434 ) ) ( IS-CRATE ?auto_15418 ) ( not ( = ?auto_15443 ?auto_15428 ) ) ( HOIST-AT ?auto_15444 ?auto_15443 ) ( AVAILABLE ?auto_15444 ) ( SURFACE-AT ?auto_15418 ?auto_15443 ) ( ON ?auto_15418 ?auto_15430 ) ( CLEAR ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15430 ) ) ( not ( = ?auto_15418 ?auto_15430 ) ) ( not ( = ?auto_15426 ?auto_15444 ) ) ( IS-CRATE ?auto_15417 ) ( not ( = ?auto_15439 ?auto_15428 ) ) ( HOIST-AT ?auto_15429 ?auto_15439 ) ( AVAILABLE ?auto_15429 ) ( SURFACE-AT ?auto_15417 ?auto_15439 ) ( ON ?auto_15417 ?auto_15435 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15435 ) ) ( not ( = ?auto_15417 ?auto_15435 ) ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( SURFACE-AT ?auto_15415 ?auto_15428 ) ( CLEAR ?auto_15415 ) ( IS-CRATE ?auto_15416 ) ( AVAILABLE ?auto_15426 ) ( AVAILABLE ?auto_15441 ) ( SURFACE-AT ?auto_15416 ?auto_15431 ) ( ON ?auto_15416 ?auto_15438 ) ( CLEAR ?auto_15416 ) ( TRUCK-AT ?auto_15427 ?auto_15428 ) ( not ( = ?auto_15415 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15438 ) ) ( not ( = ?auto_15416 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15435 ) ) ( not ( = ?auto_15417 ?auto_15438 ) ) ( not ( = ?auto_15439 ?auto_15431 ) ) ( not ( = ?auto_15429 ?auto_15441 ) ) ( not ( = ?auto_15435 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15430 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15430 ) ) ( not ( = ?auto_15418 ?auto_15435 ) ) ( not ( = ?auto_15418 ?auto_15438 ) ) ( not ( = ?auto_15443 ?auto_15439 ) ) ( not ( = ?auto_15443 ?auto_15431 ) ) ( not ( = ?auto_15444 ?auto_15429 ) ) ( not ( = ?auto_15444 ?auto_15441 ) ) ( not ( = ?auto_15430 ?auto_15435 ) ) ( not ( = ?auto_15430 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15415 ?auto_15442 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15416 ?auto_15442 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15442 ) ) ( not ( = ?auto_15419 ?auto_15430 ) ) ( not ( = ?auto_15419 ?auto_15435 ) ) ( not ( = ?auto_15419 ?auto_15438 ) ) ( not ( = ?auto_15433 ?auto_15443 ) ) ( not ( = ?auto_15433 ?auto_15439 ) ) ( not ( = ?auto_15433 ?auto_15431 ) ) ( not ( = ?auto_15434 ?auto_15444 ) ) ( not ( = ?auto_15434 ?auto_15429 ) ) ( not ( = ?auto_15434 ?auto_15441 ) ) ( not ( = ?auto_15442 ?auto_15430 ) ) ( not ( = ?auto_15442 ?auto_15435 ) ) ( not ( = ?auto_15442 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15420 ) ) ( not ( = ?auto_15415 ?auto_15440 ) ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( not ( = ?auto_15416 ?auto_15440 ) ) ( not ( = ?auto_15417 ?auto_15420 ) ) ( not ( = ?auto_15417 ?auto_15440 ) ) ( not ( = ?auto_15418 ?auto_15420 ) ) ( not ( = ?auto_15418 ?auto_15440 ) ) ( not ( = ?auto_15420 ?auto_15442 ) ) ( not ( = ?auto_15420 ?auto_15430 ) ) ( not ( = ?auto_15420 ?auto_15435 ) ) ( not ( = ?auto_15420 ?auto_15438 ) ) ( not ( = ?auto_15440 ?auto_15442 ) ) ( not ( = ?auto_15440 ?auto_15430 ) ) ( not ( = ?auto_15440 ?auto_15435 ) ) ( not ( = ?auto_15440 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15422 ) ) ( not ( = ?auto_15415 ?auto_15436 ) ) ( not ( = ?auto_15416 ?auto_15422 ) ) ( not ( = ?auto_15416 ?auto_15436 ) ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( not ( = ?auto_15417 ?auto_15436 ) ) ( not ( = ?auto_15418 ?auto_15422 ) ) ( not ( = ?auto_15418 ?auto_15436 ) ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15436 ) ) ( not ( = ?auto_15422 ?auto_15440 ) ) ( not ( = ?auto_15422 ?auto_15442 ) ) ( not ( = ?auto_15422 ?auto_15430 ) ) ( not ( = ?auto_15422 ?auto_15435 ) ) ( not ( = ?auto_15422 ?auto_15438 ) ) ( not ( = ?auto_15432 ?auto_15431 ) ) ( not ( = ?auto_15432 ?auto_15433 ) ) ( not ( = ?auto_15432 ?auto_15443 ) ) ( not ( = ?auto_15432 ?auto_15439 ) ) ( not ( = ?auto_15437 ?auto_15441 ) ) ( not ( = ?auto_15437 ?auto_15434 ) ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( not ( = ?auto_15437 ?auto_15429 ) ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15436 ?auto_15442 ) ) ( not ( = ?auto_15436 ?auto_15430 ) ) ( not ( = ?auto_15436 ?auto_15435 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15415 ?auto_15421 ) ) ( not ( = ?auto_15415 ?auto_15423 ) ) ( not ( = ?auto_15416 ?auto_15421 ) ) ( not ( = ?auto_15416 ?auto_15423 ) ) ( not ( = ?auto_15417 ?auto_15421 ) ) ( not ( = ?auto_15417 ?auto_15423 ) ) ( not ( = ?auto_15418 ?auto_15421 ) ) ( not ( = ?auto_15418 ?auto_15423 ) ) ( not ( = ?auto_15419 ?auto_15421 ) ) ( not ( = ?auto_15419 ?auto_15423 ) ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15423 ) ) ( not ( = ?auto_15421 ?auto_15436 ) ) ( not ( = ?auto_15421 ?auto_15440 ) ) ( not ( = ?auto_15421 ?auto_15442 ) ) ( not ( = ?auto_15421 ?auto_15430 ) ) ( not ( = ?auto_15421 ?auto_15435 ) ) ( not ( = ?auto_15421 ?auto_15438 ) ) ( not ( = ?auto_15424 ?auto_15432 ) ) ( not ( = ?auto_15424 ?auto_15431 ) ) ( not ( = ?auto_15424 ?auto_15433 ) ) ( not ( = ?auto_15424 ?auto_15443 ) ) ( not ( = ?auto_15424 ?auto_15439 ) ) ( not ( = ?auto_15425 ?auto_15437 ) ) ( not ( = ?auto_15425 ?auto_15441 ) ) ( not ( = ?auto_15425 ?auto_15434 ) ) ( not ( = ?auto_15425 ?auto_15444 ) ) ( not ( = ?auto_15425 ?auto_15429 ) ) ( not ( = ?auto_15423 ?auto_15436 ) ) ( not ( = ?auto_15423 ?auto_15440 ) ) ( not ( = ?auto_15423 ?auto_15442 ) ) ( not ( = ?auto_15423 ?auto_15430 ) ) ( not ( = ?auto_15423 ?auto_15435 ) ) ( not ( = ?auto_15423 ?auto_15438 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ?auto_15420 ?auto_15422 )
      ( MAKE-1CRATE ?auto_15422 ?auto_15421 )
      ( MAKE-7CRATE-VERIFY ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ?auto_15420 ?auto_15422 ?auto_15421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15447 - SURFACE
      ?auto_15448 - SURFACE
    )
    :vars
    (
      ?auto_15449 - HOIST
      ?auto_15450 - PLACE
      ?auto_15452 - PLACE
      ?auto_15453 - HOIST
      ?auto_15454 - SURFACE
      ?auto_15451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15449 ?auto_15450 ) ( SURFACE-AT ?auto_15447 ?auto_15450 ) ( CLEAR ?auto_15447 ) ( IS-CRATE ?auto_15448 ) ( AVAILABLE ?auto_15449 ) ( not ( = ?auto_15452 ?auto_15450 ) ) ( HOIST-AT ?auto_15453 ?auto_15452 ) ( AVAILABLE ?auto_15453 ) ( SURFACE-AT ?auto_15448 ?auto_15452 ) ( ON ?auto_15448 ?auto_15454 ) ( CLEAR ?auto_15448 ) ( TRUCK-AT ?auto_15451 ?auto_15450 ) ( not ( = ?auto_15447 ?auto_15448 ) ) ( not ( = ?auto_15447 ?auto_15454 ) ) ( not ( = ?auto_15448 ?auto_15454 ) ) ( not ( = ?auto_15449 ?auto_15453 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15451 ?auto_15450 ?auto_15452 )
      ( !LIFT ?auto_15453 ?auto_15448 ?auto_15454 ?auto_15452 )
      ( !LOAD ?auto_15453 ?auto_15448 ?auto_15451 ?auto_15452 )
      ( !DRIVE ?auto_15451 ?auto_15452 ?auto_15450 )
      ( !UNLOAD ?auto_15449 ?auto_15448 ?auto_15451 ?auto_15450 )
      ( !DROP ?auto_15449 ?auto_15448 ?auto_15447 ?auto_15450 )
      ( MAKE-1CRATE-VERIFY ?auto_15447 ?auto_15448 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_15464 - SURFACE
      ?auto_15465 - SURFACE
      ?auto_15466 - SURFACE
      ?auto_15467 - SURFACE
      ?auto_15468 - SURFACE
      ?auto_15469 - SURFACE
      ?auto_15472 - SURFACE
      ?auto_15471 - SURFACE
      ?auto_15470 - SURFACE
    )
    :vars
    (
      ?auto_15476 - HOIST
      ?auto_15473 - PLACE
      ?auto_15477 - PLACE
      ?auto_15475 - HOIST
      ?auto_15474 - SURFACE
      ?auto_15480 - PLACE
      ?auto_15494 - HOIST
      ?auto_15492 - SURFACE
      ?auto_15496 - PLACE
      ?auto_15481 - HOIST
      ?auto_15487 - SURFACE
      ?auto_15495 - PLACE
      ?auto_15485 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15490 - PLACE
      ?auto_15489 - HOIST
      ?auto_15486 - SURFACE
      ?auto_15479 - PLACE
      ?auto_15493 - HOIST
      ?auto_15491 - SURFACE
      ?auto_15482 - PLACE
      ?auto_15497 - HOIST
      ?auto_15488 - SURFACE
      ?auto_15483 - SURFACE
      ?auto_15478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15476 ?auto_15473 ) ( IS-CRATE ?auto_15470 ) ( not ( = ?auto_15477 ?auto_15473 ) ) ( HOIST-AT ?auto_15475 ?auto_15477 ) ( AVAILABLE ?auto_15475 ) ( SURFACE-AT ?auto_15470 ?auto_15477 ) ( ON ?auto_15470 ?auto_15474 ) ( CLEAR ?auto_15470 ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( not ( = ?auto_15471 ?auto_15474 ) ) ( not ( = ?auto_15470 ?auto_15474 ) ) ( not ( = ?auto_15476 ?auto_15475 ) ) ( IS-CRATE ?auto_15471 ) ( not ( = ?auto_15480 ?auto_15473 ) ) ( HOIST-AT ?auto_15494 ?auto_15480 ) ( AVAILABLE ?auto_15494 ) ( SURFACE-AT ?auto_15471 ?auto_15480 ) ( ON ?auto_15471 ?auto_15492 ) ( CLEAR ?auto_15471 ) ( not ( = ?auto_15472 ?auto_15471 ) ) ( not ( = ?auto_15472 ?auto_15492 ) ) ( not ( = ?auto_15471 ?auto_15492 ) ) ( not ( = ?auto_15476 ?auto_15494 ) ) ( IS-CRATE ?auto_15472 ) ( not ( = ?auto_15496 ?auto_15473 ) ) ( HOIST-AT ?auto_15481 ?auto_15496 ) ( AVAILABLE ?auto_15481 ) ( SURFACE-AT ?auto_15472 ?auto_15496 ) ( ON ?auto_15472 ?auto_15487 ) ( CLEAR ?auto_15472 ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15469 ?auto_15487 ) ) ( not ( = ?auto_15472 ?auto_15487 ) ) ( not ( = ?auto_15476 ?auto_15481 ) ) ( IS-CRATE ?auto_15469 ) ( not ( = ?auto_15495 ?auto_15473 ) ) ( HOIST-AT ?auto_15485 ?auto_15495 ) ( SURFACE-AT ?auto_15469 ?auto_15495 ) ( ON ?auto_15469 ?auto_15484 ) ( CLEAR ?auto_15469 ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15484 ) ) ( not ( = ?auto_15469 ?auto_15484 ) ) ( not ( = ?auto_15476 ?auto_15485 ) ) ( IS-CRATE ?auto_15468 ) ( not ( = ?auto_15490 ?auto_15473 ) ) ( HOIST-AT ?auto_15489 ?auto_15490 ) ( AVAILABLE ?auto_15489 ) ( SURFACE-AT ?auto_15468 ?auto_15490 ) ( ON ?auto_15468 ?auto_15486 ) ( CLEAR ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15486 ) ) ( not ( = ?auto_15468 ?auto_15486 ) ) ( not ( = ?auto_15476 ?auto_15489 ) ) ( IS-CRATE ?auto_15467 ) ( not ( = ?auto_15479 ?auto_15473 ) ) ( HOIST-AT ?auto_15493 ?auto_15479 ) ( AVAILABLE ?auto_15493 ) ( SURFACE-AT ?auto_15467 ?auto_15479 ) ( ON ?auto_15467 ?auto_15491 ) ( CLEAR ?auto_15467 ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15491 ) ) ( not ( = ?auto_15467 ?auto_15491 ) ) ( not ( = ?auto_15476 ?auto_15493 ) ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15482 ?auto_15473 ) ) ( HOIST-AT ?auto_15497 ?auto_15482 ) ( AVAILABLE ?auto_15497 ) ( SURFACE-AT ?auto_15466 ?auto_15482 ) ( ON ?auto_15466 ?auto_15488 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15465 ?auto_15488 ) ) ( not ( = ?auto_15466 ?auto_15488 ) ) ( not ( = ?auto_15476 ?auto_15497 ) ) ( SURFACE-AT ?auto_15464 ?auto_15473 ) ( CLEAR ?auto_15464 ) ( IS-CRATE ?auto_15465 ) ( AVAILABLE ?auto_15476 ) ( AVAILABLE ?auto_15485 ) ( SURFACE-AT ?auto_15465 ?auto_15495 ) ( ON ?auto_15465 ?auto_15483 ) ( CLEAR ?auto_15465 ) ( TRUCK-AT ?auto_15478 ?auto_15473 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15464 ?auto_15483 ) ) ( not ( = ?auto_15465 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15464 ?auto_15488 ) ) ( not ( = ?auto_15466 ?auto_15483 ) ) ( not ( = ?auto_15482 ?auto_15495 ) ) ( not ( = ?auto_15497 ?auto_15485 ) ) ( not ( = ?auto_15488 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15464 ?auto_15491 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15491 ) ) ( not ( = ?auto_15467 ?auto_15488 ) ) ( not ( = ?auto_15467 ?auto_15483 ) ) ( not ( = ?auto_15479 ?auto_15482 ) ) ( not ( = ?auto_15479 ?auto_15495 ) ) ( not ( = ?auto_15493 ?auto_15497 ) ) ( not ( = ?auto_15493 ?auto_15485 ) ) ( not ( = ?auto_15491 ?auto_15488 ) ) ( not ( = ?auto_15491 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15468 ) ) ( not ( = ?auto_15464 ?auto_15486 ) ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( not ( = ?auto_15465 ?auto_15486 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15486 ) ) ( not ( = ?auto_15468 ?auto_15491 ) ) ( not ( = ?auto_15468 ?auto_15488 ) ) ( not ( = ?auto_15468 ?auto_15483 ) ) ( not ( = ?auto_15490 ?auto_15479 ) ) ( not ( = ?auto_15490 ?auto_15482 ) ) ( not ( = ?auto_15490 ?auto_15495 ) ) ( not ( = ?auto_15489 ?auto_15493 ) ) ( not ( = ?auto_15489 ?auto_15497 ) ) ( not ( = ?auto_15489 ?auto_15485 ) ) ( not ( = ?auto_15486 ?auto_15491 ) ) ( not ( = ?auto_15486 ?auto_15488 ) ) ( not ( = ?auto_15486 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15469 ) ) ( not ( = ?auto_15464 ?auto_15484 ) ) ( not ( = ?auto_15465 ?auto_15469 ) ) ( not ( = ?auto_15465 ?auto_15484 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15484 ) ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15467 ?auto_15484 ) ) ( not ( = ?auto_15469 ?auto_15486 ) ) ( not ( = ?auto_15469 ?auto_15491 ) ) ( not ( = ?auto_15469 ?auto_15488 ) ) ( not ( = ?auto_15469 ?auto_15483 ) ) ( not ( = ?auto_15484 ?auto_15486 ) ) ( not ( = ?auto_15484 ?auto_15491 ) ) ( not ( = ?auto_15484 ?auto_15488 ) ) ( not ( = ?auto_15484 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15472 ) ) ( not ( = ?auto_15464 ?auto_15487 ) ) ( not ( = ?auto_15465 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15487 ) ) ( not ( = ?auto_15466 ?auto_15472 ) ) ( not ( = ?auto_15466 ?auto_15487 ) ) ( not ( = ?auto_15467 ?auto_15472 ) ) ( not ( = ?auto_15467 ?auto_15487 ) ) ( not ( = ?auto_15468 ?auto_15472 ) ) ( not ( = ?auto_15468 ?auto_15487 ) ) ( not ( = ?auto_15472 ?auto_15484 ) ) ( not ( = ?auto_15472 ?auto_15486 ) ) ( not ( = ?auto_15472 ?auto_15491 ) ) ( not ( = ?auto_15472 ?auto_15488 ) ) ( not ( = ?auto_15472 ?auto_15483 ) ) ( not ( = ?auto_15496 ?auto_15495 ) ) ( not ( = ?auto_15496 ?auto_15490 ) ) ( not ( = ?auto_15496 ?auto_15479 ) ) ( not ( = ?auto_15496 ?auto_15482 ) ) ( not ( = ?auto_15481 ?auto_15485 ) ) ( not ( = ?auto_15481 ?auto_15489 ) ) ( not ( = ?auto_15481 ?auto_15493 ) ) ( not ( = ?auto_15481 ?auto_15497 ) ) ( not ( = ?auto_15487 ?auto_15484 ) ) ( not ( = ?auto_15487 ?auto_15486 ) ) ( not ( = ?auto_15487 ?auto_15491 ) ) ( not ( = ?auto_15487 ?auto_15488 ) ) ( not ( = ?auto_15487 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15471 ) ) ( not ( = ?auto_15464 ?auto_15492 ) ) ( not ( = ?auto_15465 ?auto_15471 ) ) ( not ( = ?auto_15465 ?auto_15492 ) ) ( not ( = ?auto_15466 ?auto_15471 ) ) ( not ( = ?auto_15466 ?auto_15492 ) ) ( not ( = ?auto_15467 ?auto_15471 ) ) ( not ( = ?auto_15467 ?auto_15492 ) ) ( not ( = ?auto_15468 ?auto_15471 ) ) ( not ( = ?auto_15468 ?auto_15492 ) ) ( not ( = ?auto_15469 ?auto_15471 ) ) ( not ( = ?auto_15469 ?auto_15492 ) ) ( not ( = ?auto_15471 ?auto_15487 ) ) ( not ( = ?auto_15471 ?auto_15484 ) ) ( not ( = ?auto_15471 ?auto_15486 ) ) ( not ( = ?auto_15471 ?auto_15491 ) ) ( not ( = ?auto_15471 ?auto_15488 ) ) ( not ( = ?auto_15471 ?auto_15483 ) ) ( not ( = ?auto_15480 ?auto_15496 ) ) ( not ( = ?auto_15480 ?auto_15495 ) ) ( not ( = ?auto_15480 ?auto_15490 ) ) ( not ( = ?auto_15480 ?auto_15479 ) ) ( not ( = ?auto_15480 ?auto_15482 ) ) ( not ( = ?auto_15494 ?auto_15481 ) ) ( not ( = ?auto_15494 ?auto_15485 ) ) ( not ( = ?auto_15494 ?auto_15489 ) ) ( not ( = ?auto_15494 ?auto_15493 ) ) ( not ( = ?auto_15494 ?auto_15497 ) ) ( not ( = ?auto_15492 ?auto_15487 ) ) ( not ( = ?auto_15492 ?auto_15484 ) ) ( not ( = ?auto_15492 ?auto_15486 ) ) ( not ( = ?auto_15492 ?auto_15491 ) ) ( not ( = ?auto_15492 ?auto_15488 ) ) ( not ( = ?auto_15492 ?auto_15483 ) ) ( not ( = ?auto_15464 ?auto_15470 ) ) ( not ( = ?auto_15464 ?auto_15474 ) ) ( not ( = ?auto_15465 ?auto_15470 ) ) ( not ( = ?auto_15465 ?auto_15474 ) ) ( not ( = ?auto_15466 ?auto_15470 ) ) ( not ( = ?auto_15466 ?auto_15474 ) ) ( not ( = ?auto_15467 ?auto_15470 ) ) ( not ( = ?auto_15467 ?auto_15474 ) ) ( not ( = ?auto_15468 ?auto_15470 ) ) ( not ( = ?auto_15468 ?auto_15474 ) ) ( not ( = ?auto_15469 ?auto_15470 ) ) ( not ( = ?auto_15469 ?auto_15474 ) ) ( not ( = ?auto_15472 ?auto_15470 ) ) ( not ( = ?auto_15472 ?auto_15474 ) ) ( not ( = ?auto_15470 ?auto_15492 ) ) ( not ( = ?auto_15470 ?auto_15487 ) ) ( not ( = ?auto_15470 ?auto_15484 ) ) ( not ( = ?auto_15470 ?auto_15486 ) ) ( not ( = ?auto_15470 ?auto_15491 ) ) ( not ( = ?auto_15470 ?auto_15488 ) ) ( not ( = ?auto_15470 ?auto_15483 ) ) ( not ( = ?auto_15477 ?auto_15480 ) ) ( not ( = ?auto_15477 ?auto_15496 ) ) ( not ( = ?auto_15477 ?auto_15495 ) ) ( not ( = ?auto_15477 ?auto_15490 ) ) ( not ( = ?auto_15477 ?auto_15479 ) ) ( not ( = ?auto_15477 ?auto_15482 ) ) ( not ( = ?auto_15475 ?auto_15494 ) ) ( not ( = ?auto_15475 ?auto_15481 ) ) ( not ( = ?auto_15475 ?auto_15485 ) ) ( not ( = ?auto_15475 ?auto_15489 ) ) ( not ( = ?auto_15475 ?auto_15493 ) ) ( not ( = ?auto_15475 ?auto_15497 ) ) ( not ( = ?auto_15474 ?auto_15492 ) ) ( not ( = ?auto_15474 ?auto_15487 ) ) ( not ( = ?auto_15474 ?auto_15484 ) ) ( not ( = ?auto_15474 ?auto_15486 ) ) ( not ( = ?auto_15474 ?auto_15491 ) ) ( not ( = ?auto_15474 ?auto_15488 ) ) ( not ( = ?auto_15474 ?auto_15483 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ?auto_15469 ?auto_15472 ?auto_15471 )
      ( MAKE-1CRATE ?auto_15471 ?auto_15470 )
      ( MAKE-8CRATE-VERIFY ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ?auto_15469 ?auto_15472 ?auto_15471 ?auto_15470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15500 - SURFACE
      ?auto_15501 - SURFACE
    )
    :vars
    (
      ?auto_15502 - HOIST
      ?auto_15503 - PLACE
      ?auto_15505 - PLACE
      ?auto_15506 - HOIST
      ?auto_15507 - SURFACE
      ?auto_15504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15502 ?auto_15503 ) ( SURFACE-AT ?auto_15500 ?auto_15503 ) ( CLEAR ?auto_15500 ) ( IS-CRATE ?auto_15501 ) ( AVAILABLE ?auto_15502 ) ( not ( = ?auto_15505 ?auto_15503 ) ) ( HOIST-AT ?auto_15506 ?auto_15505 ) ( AVAILABLE ?auto_15506 ) ( SURFACE-AT ?auto_15501 ?auto_15505 ) ( ON ?auto_15501 ?auto_15507 ) ( CLEAR ?auto_15501 ) ( TRUCK-AT ?auto_15504 ?auto_15503 ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( not ( = ?auto_15500 ?auto_15507 ) ) ( not ( = ?auto_15501 ?auto_15507 ) ) ( not ( = ?auto_15502 ?auto_15506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15504 ?auto_15503 ?auto_15505 )
      ( !LIFT ?auto_15506 ?auto_15501 ?auto_15507 ?auto_15505 )
      ( !LOAD ?auto_15506 ?auto_15501 ?auto_15504 ?auto_15505 )
      ( !DRIVE ?auto_15504 ?auto_15505 ?auto_15503 )
      ( !UNLOAD ?auto_15502 ?auto_15501 ?auto_15504 ?auto_15503 )
      ( !DROP ?auto_15502 ?auto_15501 ?auto_15500 ?auto_15503 )
      ( MAKE-1CRATE-VERIFY ?auto_15500 ?auto_15501 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_15518 - SURFACE
      ?auto_15519 - SURFACE
      ?auto_15520 - SURFACE
      ?auto_15521 - SURFACE
      ?auto_15522 - SURFACE
      ?auto_15523 - SURFACE
      ?auto_15526 - SURFACE
      ?auto_15525 - SURFACE
      ?auto_15524 - SURFACE
      ?auto_15527 - SURFACE
    )
    :vars
    (
      ?auto_15531 - HOIST
      ?auto_15529 - PLACE
      ?auto_15530 - PLACE
      ?auto_15532 - HOIST
      ?auto_15528 - SURFACE
      ?auto_15537 - PLACE
      ?auto_15534 - HOIST
      ?auto_15538 - SURFACE
      ?auto_15536 - PLACE
      ?auto_15542 - HOIST
      ?auto_15548 - SURFACE
      ?auto_15539 - PLACE
      ?auto_15535 - HOIST
      ?auto_15543 - SURFACE
      ?auto_15540 - PLACE
      ?auto_15550 - HOIST
      ?auto_15551 - SURFACE
      ?auto_15546 - PLACE
      ?auto_15544 - HOIST
      ?auto_15549 - SURFACE
      ?auto_15547 - SURFACE
      ?auto_15553 - PLACE
      ?auto_15541 - HOIST
      ?auto_15545 - SURFACE
      ?auto_15552 - SURFACE
      ?auto_15533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15531 ?auto_15529 ) ( IS-CRATE ?auto_15527 ) ( not ( = ?auto_15530 ?auto_15529 ) ) ( HOIST-AT ?auto_15532 ?auto_15530 ) ( SURFACE-AT ?auto_15527 ?auto_15530 ) ( ON ?auto_15527 ?auto_15528 ) ( CLEAR ?auto_15527 ) ( not ( = ?auto_15524 ?auto_15527 ) ) ( not ( = ?auto_15524 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( not ( = ?auto_15531 ?auto_15532 ) ) ( IS-CRATE ?auto_15524 ) ( not ( = ?auto_15537 ?auto_15529 ) ) ( HOIST-AT ?auto_15534 ?auto_15537 ) ( AVAILABLE ?auto_15534 ) ( SURFACE-AT ?auto_15524 ?auto_15537 ) ( ON ?auto_15524 ?auto_15538 ) ( CLEAR ?auto_15524 ) ( not ( = ?auto_15525 ?auto_15524 ) ) ( not ( = ?auto_15525 ?auto_15538 ) ) ( not ( = ?auto_15524 ?auto_15538 ) ) ( not ( = ?auto_15531 ?auto_15534 ) ) ( IS-CRATE ?auto_15525 ) ( not ( = ?auto_15536 ?auto_15529 ) ) ( HOIST-AT ?auto_15542 ?auto_15536 ) ( AVAILABLE ?auto_15542 ) ( SURFACE-AT ?auto_15525 ?auto_15536 ) ( ON ?auto_15525 ?auto_15548 ) ( CLEAR ?auto_15525 ) ( not ( = ?auto_15526 ?auto_15525 ) ) ( not ( = ?auto_15526 ?auto_15548 ) ) ( not ( = ?auto_15525 ?auto_15548 ) ) ( not ( = ?auto_15531 ?auto_15542 ) ) ( IS-CRATE ?auto_15526 ) ( not ( = ?auto_15539 ?auto_15529 ) ) ( HOIST-AT ?auto_15535 ?auto_15539 ) ( AVAILABLE ?auto_15535 ) ( SURFACE-AT ?auto_15526 ?auto_15539 ) ( ON ?auto_15526 ?auto_15543 ) ( CLEAR ?auto_15526 ) ( not ( = ?auto_15523 ?auto_15526 ) ) ( not ( = ?auto_15523 ?auto_15543 ) ) ( not ( = ?auto_15526 ?auto_15543 ) ) ( not ( = ?auto_15531 ?auto_15535 ) ) ( IS-CRATE ?auto_15523 ) ( not ( = ?auto_15540 ?auto_15529 ) ) ( HOIST-AT ?auto_15550 ?auto_15540 ) ( SURFACE-AT ?auto_15523 ?auto_15540 ) ( ON ?auto_15523 ?auto_15551 ) ( CLEAR ?auto_15523 ) ( not ( = ?auto_15522 ?auto_15523 ) ) ( not ( = ?auto_15522 ?auto_15551 ) ) ( not ( = ?auto_15523 ?auto_15551 ) ) ( not ( = ?auto_15531 ?auto_15550 ) ) ( IS-CRATE ?auto_15522 ) ( not ( = ?auto_15546 ?auto_15529 ) ) ( HOIST-AT ?auto_15544 ?auto_15546 ) ( AVAILABLE ?auto_15544 ) ( SURFACE-AT ?auto_15522 ?auto_15546 ) ( ON ?auto_15522 ?auto_15549 ) ( CLEAR ?auto_15522 ) ( not ( = ?auto_15521 ?auto_15522 ) ) ( not ( = ?auto_15521 ?auto_15549 ) ) ( not ( = ?auto_15522 ?auto_15549 ) ) ( not ( = ?auto_15531 ?auto_15544 ) ) ( IS-CRATE ?auto_15521 ) ( AVAILABLE ?auto_15532 ) ( SURFACE-AT ?auto_15521 ?auto_15530 ) ( ON ?auto_15521 ?auto_15547 ) ( CLEAR ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15520 ?auto_15547 ) ) ( not ( = ?auto_15521 ?auto_15547 ) ) ( IS-CRATE ?auto_15520 ) ( not ( = ?auto_15553 ?auto_15529 ) ) ( HOIST-AT ?auto_15541 ?auto_15553 ) ( AVAILABLE ?auto_15541 ) ( SURFACE-AT ?auto_15520 ?auto_15553 ) ( ON ?auto_15520 ?auto_15545 ) ( CLEAR ?auto_15520 ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15545 ) ) ( not ( = ?auto_15520 ?auto_15545 ) ) ( not ( = ?auto_15531 ?auto_15541 ) ) ( SURFACE-AT ?auto_15518 ?auto_15529 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15519 ) ( AVAILABLE ?auto_15531 ) ( AVAILABLE ?auto_15550 ) ( SURFACE-AT ?auto_15519 ?auto_15540 ) ( ON ?auto_15519 ?auto_15552 ) ( CLEAR ?auto_15519 ) ( TRUCK-AT ?auto_15533 ?auto_15529 ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15552 ) ) ( not ( = ?auto_15519 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15545 ) ) ( not ( = ?auto_15520 ?auto_15552 ) ) ( not ( = ?auto_15553 ?auto_15540 ) ) ( not ( = ?auto_15541 ?auto_15550 ) ) ( not ( = ?auto_15545 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15518 ?auto_15547 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15547 ) ) ( not ( = ?auto_15521 ?auto_15545 ) ) ( not ( = ?auto_15521 ?auto_15552 ) ) ( not ( = ?auto_15530 ?auto_15553 ) ) ( not ( = ?auto_15530 ?auto_15540 ) ) ( not ( = ?auto_15532 ?auto_15541 ) ) ( not ( = ?auto_15532 ?auto_15550 ) ) ( not ( = ?auto_15547 ?auto_15545 ) ) ( not ( = ?auto_15547 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15522 ) ) ( not ( = ?auto_15518 ?auto_15549 ) ) ( not ( = ?auto_15519 ?auto_15522 ) ) ( not ( = ?auto_15519 ?auto_15549 ) ) ( not ( = ?auto_15520 ?auto_15522 ) ) ( not ( = ?auto_15520 ?auto_15549 ) ) ( not ( = ?auto_15522 ?auto_15547 ) ) ( not ( = ?auto_15522 ?auto_15545 ) ) ( not ( = ?auto_15522 ?auto_15552 ) ) ( not ( = ?auto_15546 ?auto_15530 ) ) ( not ( = ?auto_15546 ?auto_15553 ) ) ( not ( = ?auto_15546 ?auto_15540 ) ) ( not ( = ?auto_15544 ?auto_15532 ) ) ( not ( = ?auto_15544 ?auto_15541 ) ) ( not ( = ?auto_15544 ?auto_15550 ) ) ( not ( = ?auto_15549 ?auto_15547 ) ) ( not ( = ?auto_15549 ?auto_15545 ) ) ( not ( = ?auto_15549 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15523 ) ) ( not ( = ?auto_15518 ?auto_15551 ) ) ( not ( = ?auto_15519 ?auto_15523 ) ) ( not ( = ?auto_15519 ?auto_15551 ) ) ( not ( = ?auto_15520 ?auto_15523 ) ) ( not ( = ?auto_15520 ?auto_15551 ) ) ( not ( = ?auto_15521 ?auto_15523 ) ) ( not ( = ?auto_15521 ?auto_15551 ) ) ( not ( = ?auto_15523 ?auto_15549 ) ) ( not ( = ?auto_15523 ?auto_15547 ) ) ( not ( = ?auto_15523 ?auto_15545 ) ) ( not ( = ?auto_15523 ?auto_15552 ) ) ( not ( = ?auto_15551 ?auto_15549 ) ) ( not ( = ?auto_15551 ?auto_15547 ) ) ( not ( = ?auto_15551 ?auto_15545 ) ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15526 ) ) ( not ( = ?auto_15518 ?auto_15543 ) ) ( not ( = ?auto_15519 ?auto_15526 ) ) ( not ( = ?auto_15519 ?auto_15543 ) ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15543 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15521 ?auto_15543 ) ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15522 ?auto_15543 ) ) ( not ( = ?auto_15526 ?auto_15551 ) ) ( not ( = ?auto_15526 ?auto_15549 ) ) ( not ( = ?auto_15526 ?auto_15547 ) ) ( not ( = ?auto_15526 ?auto_15545 ) ) ( not ( = ?auto_15526 ?auto_15552 ) ) ( not ( = ?auto_15539 ?auto_15540 ) ) ( not ( = ?auto_15539 ?auto_15546 ) ) ( not ( = ?auto_15539 ?auto_15530 ) ) ( not ( = ?auto_15539 ?auto_15553 ) ) ( not ( = ?auto_15535 ?auto_15550 ) ) ( not ( = ?auto_15535 ?auto_15544 ) ) ( not ( = ?auto_15535 ?auto_15532 ) ) ( not ( = ?auto_15535 ?auto_15541 ) ) ( not ( = ?auto_15543 ?auto_15551 ) ) ( not ( = ?auto_15543 ?auto_15549 ) ) ( not ( = ?auto_15543 ?auto_15547 ) ) ( not ( = ?auto_15543 ?auto_15545 ) ) ( not ( = ?auto_15543 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15548 ) ) ( not ( = ?auto_15519 ?auto_15525 ) ) ( not ( = ?auto_15519 ?auto_15548 ) ) ( not ( = ?auto_15520 ?auto_15525 ) ) ( not ( = ?auto_15520 ?auto_15548 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15548 ) ) ( not ( = ?auto_15522 ?auto_15525 ) ) ( not ( = ?auto_15522 ?auto_15548 ) ) ( not ( = ?auto_15523 ?auto_15525 ) ) ( not ( = ?auto_15523 ?auto_15548 ) ) ( not ( = ?auto_15525 ?auto_15543 ) ) ( not ( = ?auto_15525 ?auto_15551 ) ) ( not ( = ?auto_15525 ?auto_15549 ) ) ( not ( = ?auto_15525 ?auto_15547 ) ) ( not ( = ?auto_15525 ?auto_15545 ) ) ( not ( = ?auto_15525 ?auto_15552 ) ) ( not ( = ?auto_15536 ?auto_15539 ) ) ( not ( = ?auto_15536 ?auto_15540 ) ) ( not ( = ?auto_15536 ?auto_15546 ) ) ( not ( = ?auto_15536 ?auto_15530 ) ) ( not ( = ?auto_15536 ?auto_15553 ) ) ( not ( = ?auto_15542 ?auto_15535 ) ) ( not ( = ?auto_15542 ?auto_15550 ) ) ( not ( = ?auto_15542 ?auto_15544 ) ) ( not ( = ?auto_15542 ?auto_15532 ) ) ( not ( = ?auto_15542 ?auto_15541 ) ) ( not ( = ?auto_15548 ?auto_15543 ) ) ( not ( = ?auto_15548 ?auto_15551 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15547 ) ) ( not ( = ?auto_15548 ?auto_15545 ) ) ( not ( = ?auto_15548 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15524 ) ) ( not ( = ?auto_15518 ?auto_15538 ) ) ( not ( = ?auto_15519 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15538 ) ) ( not ( = ?auto_15520 ?auto_15524 ) ) ( not ( = ?auto_15520 ?auto_15538 ) ) ( not ( = ?auto_15521 ?auto_15524 ) ) ( not ( = ?auto_15521 ?auto_15538 ) ) ( not ( = ?auto_15522 ?auto_15524 ) ) ( not ( = ?auto_15522 ?auto_15538 ) ) ( not ( = ?auto_15523 ?auto_15524 ) ) ( not ( = ?auto_15523 ?auto_15538 ) ) ( not ( = ?auto_15526 ?auto_15524 ) ) ( not ( = ?auto_15526 ?auto_15538 ) ) ( not ( = ?auto_15524 ?auto_15548 ) ) ( not ( = ?auto_15524 ?auto_15543 ) ) ( not ( = ?auto_15524 ?auto_15551 ) ) ( not ( = ?auto_15524 ?auto_15549 ) ) ( not ( = ?auto_15524 ?auto_15547 ) ) ( not ( = ?auto_15524 ?auto_15545 ) ) ( not ( = ?auto_15524 ?auto_15552 ) ) ( not ( = ?auto_15537 ?auto_15536 ) ) ( not ( = ?auto_15537 ?auto_15539 ) ) ( not ( = ?auto_15537 ?auto_15540 ) ) ( not ( = ?auto_15537 ?auto_15546 ) ) ( not ( = ?auto_15537 ?auto_15530 ) ) ( not ( = ?auto_15537 ?auto_15553 ) ) ( not ( = ?auto_15534 ?auto_15542 ) ) ( not ( = ?auto_15534 ?auto_15535 ) ) ( not ( = ?auto_15534 ?auto_15550 ) ) ( not ( = ?auto_15534 ?auto_15544 ) ) ( not ( = ?auto_15534 ?auto_15532 ) ) ( not ( = ?auto_15534 ?auto_15541 ) ) ( not ( = ?auto_15538 ?auto_15548 ) ) ( not ( = ?auto_15538 ?auto_15543 ) ) ( not ( = ?auto_15538 ?auto_15551 ) ) ( not ( = ?auto_15538 ?auto_15549 ) ) ( not ( = ?auto_15538 ?auto_15547 ) ) ( not ( = ?auto_15538 ?auto_15545 ) ) ( not ( = ?auto_15538 ?auto_15552 ) ) ( not ( = ?auto_15518 ?auto_15527 ) ) ( not ( = ?auto_15518 ?auto_15528 ) ) ( not ( = ?auto_15519 ?auto_15527 ) ) ( not ( = ?auto_15519 ?auto_15528 ) ) ( not ( = ?auto_15520 ?auto_15527 ) ) ( not ( = ?auto_15520 ?auto_15528 ) ) ( not ( = ?auto_15521 ?auto_15527 ) ) ( not ( = ?auto_15521 ?auto_15528 ) ) ( not ( = ?auto_15522 ?auto_15527 ) ) ( not ( = ?auto_15522 ?auto_15528 ) ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( not ( = ?auto_15523 ?auto_15528 ) ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15527 ) ) ( not ( = ?auto_15525 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15538 ) ) ( not ( = ?auto_15527 ?auto_15548 ) ) ( not ( = ?auto_15527 ?auto_15543 ) ) ( not ( = ?auto_15527 ?auto_15551 ) ) ( not ( = ?auto_15527 ?auto_15549 ) ) ( not ( = ?auto_15527 ?auto_15547 ) ) ( not ( = ?auto_15527 ?auto_15545 ) ) ( not ( = ?auto_15527 ?auto_15552 ) ) ( not ( = ?auto_15528 ?auto_15538 ) ) ( not ( = ?auto_15528 ?auto_15548 ) ) ( not ( = ?auto_15528 ?auto_15543 ) ) ( not ( = ?auto_15528 ?auto_15551 ) ) ( not ( = ?auto_15528 ?auto_15549 ) ) ( not ( = ?auto_15528 ?auto_15547 ) ) ( not ( = ?auto_15528 ?auto_15545 ) ) ( not ( = ?auto_15528 ?auto_15552 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15518 ?auto_15519 ?auto_15520 ?auto_15521 ?auto_15522 ?auto_15523 ?auto_15526 ?auto_15525 ?auto_15524 )
      ( MAKE-1CRATE ?auto_15524 ?auto_15527 )
      ( MAKE-9CRATE-VERIFY ?auto_15518 ?auto_15519 ?auto_15520 ?auto_15521 ?auto_15522 ?auto_15523 ?auto_15526 ?auto_15525 ?auto_15524 ?auto_15527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15556 - SURFACE
      ?auto_15557 - SURFACE
    )
    :vars
    (
      ?auto_15558 - HOIST
      ?auto_15559 - PLACE
      ?auto_15561 - PLACE
      ?auto_15562 - HOIST
      ?auto_15563 - SURFACE
      ?auto_15560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15558 ?auto_15559 ) ( SURFACE-AT ?auto_15556 ?auto_15559 ) ( CLEAR ?auto_15556 ) ( IS-CRATE ?auto_15557 ) ( AVAILABLE ?auto_15558 ) ( not ( = ?auto_15561 ?auto_15559 ) ) ( HOIST-AT ?auto_15562 ?auto_15561 ) ( AVAILABLE ?auto_15562 ) ( SURFACE-AT ?auto_15557 ?auto_15561 ) ( ON ?auto_15557 ?auto_15563 ) ( CLEAR ?auto_15557 ) ( TRUCK-AT ?auto_15560 ?auto_15559 ) ( not ( = ?auto_15556 ?auto_15557 ) ) ( not ( = ?auto_15556 ?auto_15563 ) ) ( not ( = ?auto_15557 ?auto_15563 ) ) ( not ( = ?auto_15558 ?auto_15562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15560 ?auto_15559 ?auto_15561 )
      ( !LIFT ?auto_15562 ?auto_15557 ?auto_15563 ?auto_15561 )
      ( !LOAD ?auto_15562 ?auto_15557 ?auto_15560 ?auto_15561 )
      ( !DRIVE ?auto_15560 ?auto_15561 ?auto_15559 )
      ( !UNLOAD ?auto_15558 ?auto_15557 ?auto_15560 ?auto_15559 )
      ( !DROP ?auto_15558 ?auto_15557 ?auto_15556 ?auto_15559 )
      ( MAKE-1CRATE-VERIFY ?auto_15556 ?auto_15557 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_15575 - SURFACE
      ?auto_15576 - SURFACE
      ?auto_15577 - SURFACE
      ?auto_15578 - SURFACE
      ?auto_15579 - SURFACE
      ?auto_15580 - SURFACE
      ?auto_15583 - SURFACE
      ?auto_15582 - SURFACE
      ?auto_15581 - SURFACE
      ?auto_15584 - SURFACE
      ?auto_15585 - SURFACE
    )
    :vars
    (
      ?auto_15590 - HOIST
      ?auto_15588 - PLACE
      ?auto_15587 - PLACE
      ?auto_15591 - HOIST
      ?auto_15586 - SURFACE
      ?auto_15605 - PLACE
      ?auto_15596 - HOIST
      ?auto_15595 - SURFACE
      ?auto_15604 - PLACE
      ?auto_15609 - HOIST
      ?auto_15607 - SURFACE
      ?auto_15601 - PLACE
      ?auto_15594 - HOIST
      ?auto_15599 - SURFACE
      ?auto_15606 - PLACE
      ?auto_15610 - HOIST
      ?auto_15593 - SURFACE
      ?auto_15603 - SURFACE
      ?auto_15608 - PLACE
      ?auto_15602 - HOIST
      ?auto_15612 - SURFACE
      ?auto_15597 - SURFACE
      ?auto_15600 - PLACE
      ?auto_15592 - HOIST
      ?auto_15611 - SURFACE
      ?auto_15598 - SURFACE
      ?auto_15589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15590 ?auto_15588 ) ( IS-CRATE ?auto_15585 ) ( not ( = ?auto_15587 ?auto_15588 ) ) ( HOIST-AT ?auto_15591 ?auto_15587 ) ( SURFACE-AT ?auto_15585 ?auto_15587 ) ( ON ?auto_15585 ?auto_15586 ) ( CLEAR ?auto_15585 ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( not ( = ?auto_15585 ?auto_15586 ) ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( IS-CRATE ?auto_15584 ) ( not ( = ?auto_15605 ?auto_15588 ) ) ( HOIST-AT ?auto_15596 ?auto_15605 ) ( SURFACE-AT ?auto_15584 ?auto_15605 ) ( ON ?auto_15584 ?auto_15595 ) ( CLEAR ?auto_15584 ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15595 ) ) ( not ( = ?auto_15584 ?auto_15595 ) ) ( not ( = ?auto_15590 ?auto_15596 ) ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15604 ?auto_15588 ) ) ( HOIST-AT ?auto_15609 ?auto_15604 ) ( AVAILABLE ?auto_15609 ) ( SURFACE-AT ?auto_15581 ?auto_15604 ) ( ON ?auto_15581 ?auto_15607 ) ( CLEAR ?auto_15581 ) ( not ( = ?auto_15582 ?auto_15581 ) ) ( not ( = ?auto_15582 ?auto_15607 ) ) ( not ( = ?auto_15581 ?auto_15607 ) ) ( not ( = ?auto_15590 ?auto_15609 ) ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15601 ?auto_15588 ) ) ( HOIST-AT ?auto_15594 ?auto_15601 ) ( AVAILABLE ?auto_15594 ) ( SURFACE-AT ?auto_15582 ?auto_15601 ) ( ON ?auto_15582 ?auto_15599 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15583 ?auto_15582 ) ) ( not ( = ?auto_15583 ?auto_15599 ) ) ( not ( = ?auto_15582 ?auto_15599 ) ) ( not ( = ?auto_15590 ?auto_15594 ) ) ( IS-CRATE ?auto_15583 ) ( not ( = ?auto_15606 ?auto_15588 ) ) ( HOIST-AT ?auto_15610 ?auto_15606 ) ( AVAILABLE ?auto_15610 ) ( SURFACE-AT ?auto_15583 ?auto_15606 ) ( ON ?auto_15583 ?auto_15593 ) ( CLEAR ?auto_15583 ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15593 ) ) ( not ( = ?auto_15583 ?auto_15593 ) ) ( not ( = ?auto_15590 ?auto_15610 ) ) ( IS-CRATE ?auto_15580 ) ( SURFACE-AT ?auto_15580 ?auto_15587 ) ( ON ?auto_15580 ?auto_15603 ) ( CLEAR ?auto_15580 ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15603 ) ) ( not ( = ?auto_15580 ?auto_15603 ) ) ( IS-CRATE ?auto_15579 ) ( not ( = ?auto_15608 ?auto_15588 ) ) ( HOIST-AT ?auto_15602 ?auto_15608 ) ( AVAILABLE ?auto_15602 ) ( SURFACE-AT ?auto_15579 ?auto_15608 ) ( ON ?auto_15579 ?auto_15612 ) ( CLEAR ?auto_15579 ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15612 ) ) ( not ( = ?auto_15579 ?auto_15612 ) ) ( not ( = ?auto_15590 ?auto_15602 ) ) ( IS-CRATE ?auto_15578 ) ( AVAILABLE ?auto_15596 ) ( SURFACE-AT ?auto_15578 ?auto_15605 ) ( ON ?auto_15578 ?auto_15597 ) ( CLEAR ?auto_15578 ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15597 ) ) ( not ( = ?auto_15578 ?auto_15597 ) ) ( IS-CRATE ?auto_15577 ) ( not ( = ?auto_15600 ?auto_15588 ) ) ( HOIST-AT ?auto_15592 ?auto_15600 ) ( AVAILABLE ?auto_15592 ) ( SURFACE-AT ?auto_15577 ?auto_15600 ) ( ON ?auto_15577 ?auto_15611 ) ( CLEAR ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15611 ) ) ( not ( = ?auto_15577 ?auto_15611 ) ) ( not ( = ?auto_15590 ?auto_15592 ) ) ( SURFACE-AT ?auto_15575 ?auto_15588 ) ( CLEAR ?auto_15575 ) ( IS-CRATE ?auto_15576 ) ( AVAILABLE ?auto_15590 ) ( AVAILABLE ?auto_15591 ) ( SURFACE-AT ?auto_15576 ?auto_15587 ) ( ON ?auto_15576 ?auto_15598 ) ( CLEAR ?auto_15576 ) ( TRUCK-AT ?auto_15589 ?auto_15588 ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15598 ) ) ( not ( = ?auto_15576 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15577 ) ) ( not ( = ?auto_15575 ?auto_15611 ) ) ( not ( = ?auto_15577 ?auto_15598 ) ) ( not ( = ?auto_15600 ?auto_15587 ) ) ( not ( = ?auto_15592 ?auto_15591 ) ) ( not ( = ?auto_15611 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15578 ) ) ( not ( = ?auto_15575 ?auto_15597 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15576 ?auto_15597 ) ) ( not ( = ?auto_15578 ?auto_15611 ) ) ( not ( = ?auto_15578 ?auto_15598 ) ) ( not ( = ?auto_15605 ?auto_15600 ) ) ( not ( = ?auto_15605 ?auto_15587 ) ) ( not ( = ?auto_15596 ?auto_15592 ) ) ( not ( = ?auto_15596 ?auto_15591 ) ) ( not ( = ?auto_15597 ?auto_15611 ) ) ( not ( = ?auto_15597 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( not ( = ?auto_15575 ?auto_15612 ) ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15576 ?auto_15612 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15612 ) ) ( not ( = ?auto_15579 ?auto_15597 ) ) ( not ( = ?auto_15579 ?auto_15611 ) ) ( not ( = ?auto_15579 ?auto_15598 ) ) ( not ( = ?auto_15608 ?auto_15605 ) ) ( not ( = ?auto_15608 ?auto_15600 ) ) ( not ( = ?auto_15608 ?auto_15587 ) ) ( not ( = ?auto_15602 ?auto_15596 ) ) ( not ( = ?auto_15602 ?auto_15592 ) ) ( not ( = ?auto_15602 ?auto_15591 ) ) ( not ( = ?auto_15612 ?auto_15597 ) ) ( not ( = ?auto_15612 ?auto_15611 ) ) ( not ( = ?auto_15612 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15580 ) ) ( not ( = ?auto_15575 ?auto_15603 ) ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15576 ?auto_15603 ) ) ( not ( = ?auto_15577 ?auto_15580 ) ) ( not ( = ?auto_15577 ?auto_15603 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15603 ) ) ( not ( = ?auto_15580 ?auto_15612 ) ) ( not ( = ?auto_15580 ?auto_15597 ) ) ( not ( = ?auto_15580 ?auto_15611 ) ) ( not ( = ?auto_15580 ?auto_15598 ) ) ( not ( = ?auto_15603 ?auto_15612 ) ) ( not ( = ?auto_15603 ?auto_15597 ) ) ( not ( = ?auto_15603 ?auto_15611 ) ) ( not ( = ?auto_15603 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15583 ) ) ( not ( = ?auto_15575 ?auto_15593 ) ) ( not ( = ?auto_15576 ?auto_15583 ) ) ( not ( = ?auto_15576 ?auto_15593 ) ) ( not ( = ?auto_15577 ?auto_15583 ) ) ( not ( = ?auto_15577 ?auto_15593 ) ) ( not ( = ?auto_15578 ?auto_15583 ) ) ( not ( = ?auto_15578 ?auto_15593 ) ) ( not ( = ?auto_15579 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15593 ) ) ( not ( = ?auto_15583 ?auto_15603 ) ) ( not ( = ?auto_15583 ?auto_15612 ) ) ( not ( = ?auto_15583 ?auto_15597 ) ) ( not ( = ?auto_15583 ?auto_15611 ) ) ( not ( = ?auto_15583 ?auto_15598 ) ) ( not ( = ?auto_15606 ?auto_15587 ) ) ( not ( = ?auto_15606 ?auto_15608 ) ) ( not ( = ?auto_15606 ?auto_15605 ) ) ( not ( = ?auto_15606 ?auto_15600 ) ) ( not ( = ?auto_15610 ?auto_15591 ) ) ( not ( = ?auto_15610 ?auto_15602 ) ) ( not ( = ?auto_15610 ?auto_15596 ) ) ( not ( = ?auto_15610 ?auto_15592 ) ) ( not ( = ?auto_15593 ?auto_15603 ) ) ( not ( = ?auto_15593 ?auto_15612 ) ) ( not ( = ?auto_15593 ?auto_15597 ) ) ( not ( = ?auto_15593 ?auto_15611 ) ) ( not ( = ?auto_15593 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15582 ) ) ( not ( = ?auto_15575 ?auto_15599 ) ) ( not ( = ?auto_15576 ?auto_15582 ) ) ( not ( = ?auto_15576 ?auto_15599 ) ) ( not ( = ?auto_15577 ?auto_15582 ) ) ( not ( = ?auto_15577 ?auto_15599 ) ) ( not ( = ?auto_15578 ?auto_15582 ) ) ( not ( = ?auto_15578 ?auto_15599 ) ) ( not ( = ?auto_15579 ?auto_15582 ) ) ( not ( = ?auto_15579 ?auto_15599 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15599 ) ) ( not ( = ?auto_15582 ?auto_15593 ) ) ( not ( = ?auto_15582 ?auto_15603 ) ) ( not ( = ?auto_15582 ?auto_15612 ) ) ( not ( = ?auto_15582 ?auto_15597 ) ) ( not ( = ?auto_15582 ?auto_15611 ) ) ( not ( = ?auto_15582 ?auto_15598 ) ) ( not ( = ?auto_15601 ?auto_15606 ) ) ( not ( = ?auto_15601 ?auto_15587 ) ) ( not ( = ?auto_15601 ?auto_15608 ) ) ( not ( = ?auto_15601 ?auto_15605 ) ) ( not ( = ?auto_15601 ?auto_15600 ) ) ( not ( = ?auto_15594 ?auto_15610 ) ) ( not ( = ?auto_15594 ?auto_15591 ) ) ( not ( = ?auto_15594 ?auto_15602 ) ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15594 ?auto_15592 ) ) ( not ( = ?auto_15599 ?auto_15593 ) ) ( not ( = ?auto_15599 ?auto_15603 ) ) ( not ( = ?auto_15599 ?auto_15612 ) ) ( not ( = ?auto_15599 ?auto_15597 ) ) ( not ( = ?auto_15599 ?auto_15611 ) ) ( not ( = ?auto_15599 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15581 ) ) ( not ( = ?auto_15575 ?auto_15607 ) ) ( not ( = ?auto_15576 ?auto_15581 ) ) ( not ( = ?auto_15576 ?auto_15607 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( not ( = ?auto_15577 ?auto_15607 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15607 ) ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15579 ?auto_15607 ) ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15607 ) ) ( not ( = ?auto_15583 ?auto_15581 ) ) ( not ( = ?auto_15583 ?auto_15607 ) ) ( not ( = ?auto_15581 ?auto_15599 ) ) ( not ( = ?auto_15581 ?auto_15593 ) ) ( not ( = ?auto_15581 ?auto_15603 ) ) ( not ( = ?auto_15581 ?auto_15612 ) ) ( not ( = ?auto_15581 ?auto_15597 ) ) ( not ( = ?auto_15581 ?auto_15611 ) ) ( not ( = ?auto_15581 ?auto_15598 ) ) ( not ( = ?auto_15604 ?auto_15601 ) ) ( not ( = ?auto_15604 ?auto_15606 ) ) ( not ( = ?auto_15604 ?auto_15587 ) ) ( not ( = ?auto_15604 ?auto_15608 ) ) ( not ( = ?auto_15604 ?auto_15605 ) ) ( not ( = ?auto_15604 ?auto_15600 ) ) ( not ( = ?auto_15609 ?auto_15594 ) ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15591 ) ) ( not ( = ?auto_15609 ?auto_15602 ) ) ( not ( = ?auto_15609 ?auto_15596 ) ) ( not ( = ?auto_15609 ?auto_15592 ) ) ( not ( = ?auto_15607 ?auto_15599 ) ) ( not ( = ?auto_15607 ?auto_15593 ) ) ( not ( = ?auto_15607 ?auto_15603 ) ) ( not ( = ?auto_15607 ?auto_15612 ) ) ( not ( = ?auto_15607 ?auto_15597 ) ) ( not ( = ?auto_15607 ?auto_15611 ) ) ( not ( = ?auto_15607 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15584 ) ) ( not ( = ?auto_15575 ?auto_15595 ) ) ( not ( = ?auto_15576 ?auto_15584 ) ) ( not ( = ?auto_15576 ?auto_15595 ) ) ( not ( = ?auto_15577 ?auto_15584 ) ) ( not ( = ?auto_15577 ?auto_15595 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15595 ) ) ( not ( = ?auto_15579 ?auto_15584 ) ) ( not ( = ?auto_15579 ?auto_15595 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15595 ) ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15583 ?auto_15595 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15595 ) ) ( not ( = ?auto_15584 ?auto_15607 ) ) ( not ( = ?auto_15584 ?auto_15599 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15603 ) ) ( not ( = ?auto_15584 ?auto_15612 ) ) ( not ( = ?auto_15584 ?auto_15597 ) ) ( not ( = ?auto_15584 ?auto_15611 ) ) ( not ( = ?auto_15584 ?auto_15598 ) ) ( not ( = ?auto_15595 ?auto_15607 ) ) ( not ( = ?auto_15595 ?auto_15599 ) ) ( not ( = ?auto_15595 ?auto_15593 ) ) ( not ( = ?auto_15595 ?auto_15603 ) ) ( not ( = ?auto_15595 ?auto_15612 ) ) ( not ( = ?auto_15595 ?auto_15597 ) ) ( not ( = ?auto_15595 ?auto_15611 ) ) ( not ( = ?auto_15595 ?auto_15598 ) ) ( not ( = ?auto_15575 ?auto_15585 ) ) ( not ( = ?auto_15575 ?auto_15586 ) ) ( not ( = ?auto_15576 ?auto_15585 ) ) ( not ( = ?auto_15576 ?auto_15586 ) ) ( not ( = ?auto_15577 ?auto_15585 ) ) ( not ( = ?auto_15577 ?auto_15586 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15586 ) ) ( not ( = ?auto_15579 ?auto_15585 ) ) ( not ( = ?auto_15579 ?auto_15586 ) ) ( not ( = ?auto_15580 ?auto_15585 ) ) ( not ( = ?auto_15580 ?auto_15586 ) ) ( not ( = ?auto_15583 ?auto_15585 ) ) ( not ( = ?auto_15583 ?auto_15586 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15586 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) ( not ( = ?auto_15581 ?auto_15586 ) ) ( not ( = ?auto_15585 ?auto_15595 ) ) ( not ( = ?auto_15585 ?auto_15607 ) ) ( not ( = ?auto_15585 ?auto_15599 ) ) ( not ( = ?auto_15585 ?auto_15593 ) ) ( not ( = ?auto_15585 ?auto_15603 ) ) ( not ( = ?auto_15585 ?auto_15612 ) ) ( not ( = ?auto_15585 ?auto_15597 ) ) ( not ( = ?auto_15585 ?auto_15611 ) ) ( not ( = ?auto_15585 ?auto_15598 ) ) ( not ( = ?auto_15586 ?auto_15595 ) ) ( not ( = ?auto_15586 ?auto_15607 ) ) ( not ( = ?auto_15586 ?auto_15599 ) ) ( not ( = ?auto_15586 ?auto_15593 ) ) ( not ( = ?auto_15586 ?auto_15603 ) ) ( not ( = ?auto_15586 ?auto_15612 ) ) ( not ( = ?auto_15586 ?auto_15597 ) ) ( not ( = ?auto_15586 ?auto_15611 ) ) ( not ( = ?auto_15586 ?auto_15598 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 ?auto_15580 ?auto_15583 ?auto_15582 ?auto_15581 ?auto_15584 )
      ( MAKE-1CRATE ?auto_15584 ?auto_15585 )
      ( MAKE-10CRATE-VERIFY ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 ?auto_15580 ?auto_15583 ?auto_15582 ?auto_15581 ?auto_15584 ?auto_15585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15615 - SURFACE
      ?auto_15616 - SURFACE
    )
    :vars
    (
      ?auto_15617 - HOIST
      ?auto_15618 - PLACE
      ?auto_15620 - PLACE
      ?auto_15621 - HOIST
      ?auto_15622 - SURFACE
      ?auto_15619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15617 ?auto_15618 ) ( SURFACE-AT ?auto_15615 ?auto_15618 ) ( CLEAR ?auto_15615 ) ( IS-CRATE ?auto_15616 ) ( AVAILABLE ?auto_15617 ) ( not ( = ?auto_15620 ?auto_15618 ) ) ( HOIST-AT ?auto_15621 ?auto_15620 ) ( AVAILABLE ?auto_15621 ) ( SURFACE-AT ?auto_15616 ?auto_15620 ) ( ON ?auto_15616 ?auto_15622 ) ( CLEAR ?auto_15616 ) ( TRUCK-AT ?auto_15619 ?auto_15618 ) ( not ( = ?auto_15615 ?auto_15616 ) ) ( not ( = ?auto_15615 ?auto_15622 ) ) ( not ( = ?auto_15616 ?auto_15622 ) ) ( not ( = ?auto_15617 ?auto_15621 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15619 ?auto_15618 ?auto_15620 )
      ( !LIFT ?auto_15621 ?auto_15616 ?auto_15622 ?auto_15620 )
      ( !LOAD ?auto_15621 ?auto_15616 ?auto_15619 ?auto_15620 )
      ( !DRIVE ?auto_15619 ?auto_15620 ?auto_15618 )
      ( !UNLOAD ?auto_15617 ?auto_15616 ?auto_15619 ?auto_15618 )
      ( !DROP ?auto_15617 ?auto_15616 ?auto_15615 ?auto_15618 )
      ( MAKE-1CRATE-VERIFY ?auto_15615 ?auto_15616 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15635 - SURFACE
      ?auto_15636 - SURFACE
      ?auto_15637 - SURFACE
      ?auto_15638 - SURFACE
      ?auto_15639 - SURFACE
      ?auto_15640 - SURFACE
      ?auto_15643 - SURFACE
      ?auto_15642 - SURFACE
      ?auto_15641 - SURFACE
      ?auto_15644 - SURFACE
      ?auto_15646 - SURFACE
      ?auto_15645 - SURFACE
    )
    :vars
    (
      ?auto_15652 - HOIST
      ?auto_15650 - PLACE
      ?auto_15647 - PLACE
      ?auto_15648 - HOIST
      ?auto_15649 - SURFACE
      ?auto_15676 - PLACE
      ?auto_15670 - HOIST
      ?auto_15672 - SURFACE
      ?auto_15655 - PLACE
      ?auto_15665 - HOIST
      ?auto_15659 - SURFACE
      ?auto_15668 - PLACE
      ?auto_15664 - HOIST
      ?auto_15653 - SURFACE
      ?auto_15667 - PLACE
      ?auto_15662 - HOIST
      ?auto_15674 - SURFACE
      ?auto_15666 - PLACE
      ?auto_15663 - HOIST
      ?auto_15654 - SURFACE
      ?auto_15660 - SURFACE
      ?auto_15661 - PLACE
      ?auto_15669 - HOIST
      ?auto_15675 - SURFACE
      ?auto_15657 - SURFACE
      ?auto_15671 - PLACE
      ?auto_15658 - HOIST
      ?auto_15673 - SURFACE
      ?auto_15656 - SURFACE
      ?auto_15651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15652 ?auto_15650 ) ( IS-CRATE ?auto_15645 ) ( not ( = ?auto_15647 ?auto_15650 ) ) ( HOIST-AT ?auto_15648 ?auto_15647 ) ( AVAILABLE ?auto_15648 ) ( SURFACE-AT ?auto_15645 ?auto_15647 ) ( ON ?auto_15645 ?auto_15649 ) ( CLEAR ?auto_15645 ) ( not ( = ?auto_15646 ?auto_15645 ) ) ( not ( = ?auto_15646 ?auto_15649 ) ) ( not ( = ?auto_15645 ?auto_15649 ) ) ( not ( = ?auto_15652 ?auto_15648 ) ) ( IS-CRATE ?auto_15646 ) ( not ( = ?auto_15676 ?auto_15650 ) ) ( HOIST-AT ?auto_15670 ?auto_15676 ) ( SURFACE-AT ?auto_15646 ?auto_15676 ) ( ON ?auto_15646 ?auto_15672 ) ( CLEAR ?auto_15646 ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15672 ) ) ( not ( = ?auto_15646 ?auto_15672 ) ) ( not ( = ?auto_15652 ?auto_15670 ) ) ( IS-CRATE ?auto_15644 ) ( not ( = ?auto_15655 ?auto_15650 ) ) ( HOIST-AT ?auto_15665 ?auto_15655 ) ( SURFACE-AT ?auto_15644 ?auto_15655 ) ( ON ?auto_15644 ?auto_15659 ) ( CLEAR ?auto_15644 ) ( not ( = ?auto_15641 ?auto_15644 ) ) ( not ( = ?auto_15641 ?auto_15659 ) ) ( not ( = ?auto_15644 ?auto_15659 ) ) ( not ( = ?auto_15652 ?auto_15665 ) ) ( IS-CRATE ?auto_15641 ) ( not ( = ?auto_15668 ?auto_15650 ) ) ( HOIST-AT ?auto_15664 ?auto_15668 ) ( AVAILABLE ?auto_15664 ) ( SURFACE-AT ?auto_15641 ?auto_15668 ) ( ON ?auto_15641 ?auto_15653 ) ( CLEAR ?auto_15641 ) ( not ( = ?auto_15642 ?auto_15641 ) ) ( not ( = ?auto_15642 ?auto_15653 ) ) ( not ( = ?auto_15641 ?auto_15653 ) ) ( not ( = ?auto_15652 ?auto_15664 ) ) ( IS-CRATE ?auto_15642 ) ( not ( = ?auto_15667 ?auto_15650 ) ) ( HOIST-AT ?auto_15662 ?auto_15667 ) ( AVAILABLE ?auto_15662 ) ( SURFACE-AT ?auto_15642 ?auto_15667 ) ( ON ?auto_15642 ?auto_15674 ) ( CLEAR ?auto_15642 ) ( not ( = ?auto_15643 ?auto_15642 ) ) ( not ( = ?auto_15643 ?auto_15674 ) ) ( not ( = ?auto_15642 ?auto_15674 ) ) ( not ( = ?auto_15652 ?auto_15662 ) ) ( IS-CRATE ?auto_15643 ) ( not ( = ?auto_15666 ?auto_15650 ) ) ( HOIST-AT ?auto_15663 ?auto_15666 ) ( AVAILABLE ?auto_15663 ) ( SURFACE-AT ?auto_15643 ?auto_15666 ) ( ON ?auto_15643 ?auto_15654 ) ( CLEAR ?auto_15643 ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15654 ) ) ( not ( = ?auto_15643 ?auto_15654 ) ) ( not ( = ?auto_15652 ?auto_15663 ) ) ( IS-CRATE ?auto_15640 ) ( SURFACE-AT ?auto_15640 ?auto_15676 ) ( ON ?auto_15640 ?auto_15660 ) ( CLEAR ?auto_15640 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15660 ) ) ( not ( = ?auto_15640 ?auto_15660 ) ) ( IS-CRATE ?auto_15639 ) ( not ( = ?auto_15661 ?auto_15650 ) ) ( HOIST-AT ?auto_15669 ?auto_15661 ) ( AVAILABLE ?auto_15669 ) ( SURFACE-AT ?auto_15639 ?auto_15661 ) ( ON ?auto_15639 ?auto_15675 ) ( CLEAR ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15675 ) ) ( not ( = ?auto_15639 ?auto_15675 ) ) ( not ( = ?auto_15652 ?auto_15669 ) ) ( IS-CRATE ?auto_15638 ) ( AVAILABLE ?auto_15665 ) ( SURFACE-AT ?auto_15638 ?auto_15655 ) ( ON ?auto_15638 ?auto_15657 ) ( CLEAR ?auto_15638 ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( not ( = ?auto_15637 ?auto_15657 ) ) ( not ( = ?auto_15638 ?auto_15657 ) ) ( IS-CRATE ?auto_15637 ) ( not ( = ?auto_15671 ?auto_15650 ) ) ( HOIST-AT ?auto_15658 ?auto_15671 ) ( AVAILABLE ?auto_15658 ) ( SURFACE-AT ?auto_15637 ?auto_15671 ) ( ON ?auto_15637 ?auto_15673 ) ( CLEAR ?auto_15637 ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15673 ) ) ( not ( = ?auto_15637 ?auto_15673 ) ) ( not ( = ?auto_15652 ?auto_15658 ) ) ( SURFACE-AT ?auto_15635 ?auto_15650 ) ( CLEAR ?auto_15635 ) ( IS-CRATE ?auto_15636 ) ( AVAILABLE ?auto_15652 ) ( AVAILABLE ?auto_15670 ) ( SURFACE-AT ?auto_15636 ?auto_15676 ) ( ON ?auto_15636 ?auto_15656 ) ( CLEAR ?auto_15636 ) ( TRUCK-AT ?auto_15651 ?auto_15650 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15656 ) ) ( not ( = ?auto_15636 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15635 ?auto_15673 ) ) ( not ( = ?auto_15637 ?auto_15656 ) ) ( not ( = ?auto_15671 ?auto_15676 ) ) ( not ( = ?auto_15658 ?auto_15670 ) ) ( not ( = ?auto_15673 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15638 ) ) ( not ( = ?auto_15635 ?auto_15657 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15657 ) ) ( not ( = ?auto_15638 ?auto_15673 ) ) ( not ( = ?auto_15638 ?auto_15656 ) ) ( not ( = ?auto_15655 ?auto_15671 ) ) ( not ( = ?auto_15655 ?auto_15676 ) ) ( not ( = ?auto_15665 ?auto_15658 ) ) ( not ( = ?auto_15665 ?auto_15670 ) ) ( not ( = ?auto_15657 ?auto_15673 ) ) ( not ( = ?auto_15657 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15639 ) ) ( not ( = ?auto_15635 ?auto_15675 ) ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15636 ?auto_15675 ) ) ( not ( = ?auto_15637 ?auto_15639 ) ) ( not ( = ?auto_15637 ?auto_15675 ) ) ( not ( = ?auto_15639 ?auto_15657 ) ) ( not ( = ?auto_15639 ?auto_15673 ) ) ( not ( = ?auto_15639 ?auto_15656 ) ) ( not ( = ?auto_15661 ?auto_15655 ) ) ( not ( = ?auto_15661 ?auto_15671 ) ) ( not ( = ?auto_15661 ?auto_15676 ) ) ( not ( = ?auto_15669 ?auto_15665 ) ) ( not ( = ?auto_15669 ?auto_15658 ) ) ( not ( = ?auto_15669 ?auto_15670 ) ) ( not ( = ?auto_15675 ?auto_15657 ) ) ( not ( = ?auto_15675 ?auto_15673 ) ) ( not ( = ?auto_15675 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15640 ) ) ( not ( = ?auto_15635 ?auto_15660 ) ) ( not ( = ?auto_15636 ?auto_15640 ) ) ( not ( = ?auto_15636 ?auto_15660 ) ) ( not ( = ?auto_15637 ?auto_15640 ) ) ( not ( = ?auto_15637 ?auto_15660 ) ) ( not ( = ?auto_15638 ?auto_15640 ) ) ( not ( = ?auto_15638 ?auto_15660 ) ) ( not ( = ?auto_15640 ?auto_15675 ) ) ( not ( = ?auto_15640 ?auto_15657 ) ) ( not ( = ?auto_15640 ?auto_15673 ) ) ( not ( = ?auto_15640 ?auto_15656 ) ) ( not ( = ?auto_15660 ?auto_15675 ) ) ( not ( = ?auto_15660 ?auto_15657 ) ) ( not ( = ?auto_15660 ?auto_15673 ) ) ( not ( = ?auto_15660 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15635 ?auto_15654 ) ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( not ( = ?auto_15636 ?auto_15654 ) ) ( not ( = ?auto_15637 ?auto_15643 ) ) ( not ( = ?auto_15637 ?auto_15654 ) ) ( not ( = ?auto_15638 ?auto_15643 ) ) ( not ( = ?auto_15638 ?auto_15654 ) ) ( not ( = ?auto_15639 ?auto_15643 ) ) ( not ( = ?auto_15639 ?auto_15654 ) ) ( not ( = ?auto_15643 ?auto_15660 ) ) ( not ( = ?auto_15643 ?auto_15675 ) ) ( not ( = ?auto_15643 ?auto_15657 ) ) ( not ( = ?auto_15643 ?auto_15673 ) ) ( not ( = ?auto_15643 ?auto_15656 ) ) ( not ( = ?auto_15666 ?auto_15676 ) ) ( not ( = ?auto_15666 ?auto_15661 ) ) ( not ( = ?auto_15666 ?auto_15655 ) ) ( not ( = ?auto_15666 ?auto_15671 ) ) ( not ( = ?auto_15663 ?auto_15670 ) ) ( not ( = ?auto_15663 ?auto_15669 ) ) ( not ( = ?auto_15663 ?auto_15665 ) ) ( not ( = ?auto_15663 ?auto_15658 ) ) ( not ( = ?auto_15654 ?auto_15660 ) ) ( not ( = ?auto_15654 ?auto_15675 ) ) ( not ( = ?auto_15654 ?auto_15657 ) ) ( not ( = ?auto_15654 ?auto_15673 ) ) ( not ( = ?auto_15654 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15642 ) ) ( not ( = ?auto_15635 ?auto_15674 ) ) ( not ( = ?auto_15636 ?auto_15642 ) ) ( not ( = ?auto_15636 ?auto_15674 ) ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15637 ?auto_15674 ) ) ( not ( = ?auto_15638 ?auto_15642 ) ) ( not ( = ?auto_15638 ?auto_15674 ) ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15639 ?auto_15674 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15674 ) ) ( not ( = ?auto_15642 ?auto_15654 ) ) ( not ( = ?auto_15642 ?auto_15660 ) ) ( not ( = ?auto_15642 ?auto_15675 ) ) ( not ( = ?auto_15642 ?auto_15657 ) ) ( not ( = ?auto_15642 ?auto_15673 ) ) ( not ( = ?auto_15642 ?auto_15656 ) ) ( not ( = ?auto_15667 ?auto_15666 ) ) ( not ( = ?auto_15667 ?auto_15676 ) ) ( not ( = ?auto_15667 ?auto_15661 ) ) ( not ( = ?auto_15667 ?auto_15655 ) ) ( not ( = ?auto_15667 ?auto_15671 ) ) ( not ( = ?auto_15662 ?auto_15663 ) ) ( not ( = ?auto_15662 ?auto_15670 ) ) ( not ( = ?auto_15662 ?auto_15669 ) ) ( not ( = ?auto_15662 ?auto_15665 ) ) ( not ( = ?auto_15662 ?auto_15658 ) ) ( not ( = ?auto_15674 ?auto_15654 ) ) ( not ( = ?auto_15674 ?auto_15660 ) ) ( not ( = ?auto_15674 ?auto_15675 ) ) ( not ( = ?auto_15674 ?auto_15657 ) ) ( not ( = ?auto_15674 ?auto_15673 ) ) ( not ( = ?auto_15674 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15641 ) ) ( not ( = ?auto_15635 ?auto_15653 ) ) ( not ( = ?auto_15636 ?auto_15641 ) ) ( not ( = ?auto_15636 ?auto_15653 ) ) ( not ( = ?auto_15637 ?auto_15641 ) ) ( not ( = ?auto_15637 ?auto_15653 ) ) ( not ( = ?auto_15638 ?auto_15641 ) ) ( not ( = ?auto_15638 ?auto_15653 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15639 ?auto_15653 ) ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15653 ) ) ( not ( = ?auto_15643 ?auto_15641 ) ) ( not ( = ?auto_15643 ?auto_15653 ) ) ( not ( = ?auto_15641 ?auto_15674 ) ) ( not ( = ?auto_15641 ?auto_15654 ) ) ( not ( = ?auto_15641 ?auto_15660 ) ) ( not ( = ?auto_15641 ?auto_15675 ) ) ( not ( = ?auto_15641 ?auto_15657 ) ) ( not ( = ?auto_15641 ?auto_15673 ) ) ( not ( = ?auto_15641 ?auto_15656 ) ) ( not ( = ?auto_15668 ?auto_15667 ) ) ( not ( = ?auto_15668 ?auto_15666 ) ) ( not ( = ?auto_15668 ?auto_15676 ) ) ( not ( = ?auto_15668 ?auto_15661 ) ) ( not ( = ?auto_15668 ?auto_15655 ) ) ( not ( = ?auto_15668 ?auto_15671 ) ) ( not ( = ?auto_15664 ?auto_15662 ) ) ( not ( = ?auto_15664 ?auto_15663 ) ) ( not ( = ?auto_15664 ?auto_15670 ) ) ( not ( = ?auto_15664 ?auto_15669 ) ) ( not ( = ?auto_15664 ?auto_15665 ) ) ( not ( = ?auto_15664 ?auto_15658 ) ) ( not ( = ?auto_15653 ?auto_15674 ) ) ( not ( = ?auto_15653 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15660 ) ) ( not ( = ?auto_15653 ?auto_15675 ) ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( not ( = ?auto_15653 ?auto_15673 ) ) ( not ( = ?auto_15653 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15644 ) ) ( not ( = ?auto_15635 ?auto_15659 ) ) ( not ( = ?auto_15636 ?auto_15644 ) ) ( not ( = ?auto_15636 ?auto_15659 ) ) ( not ( = ?auto_15637 ?auto_15644 ) ) ( not ( = ?auto_15637 ?auto_15659 ) ) ( not ( = ?auto_15638 ?auto_15644 ) ) ( not ( = ?auto_15638 ?auto_15659 ) ) ( not ( = ?auto_15639 ?auto_15644 ) ) ( not ( = ?auto_15639 ?auto_15659 ) ) ( not ( = ?auto_15640 ?auto_15644 ) ) ( not ( = ?auto_15640 ?auto_15659 ) ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15659 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) ( not ( = ?auto_15642 ?auto_15659 ) ) ( not ( = ?auto_15644 ?auto_15653 ) ) ( not ( = ?auto_15644 ?auto_15674 ) ) ( not ( = ?auto_15644 ?auto_15654 ) ) ( not ( = ?auto_15644 ?auto_15660 ) ) ( not ( = ?auto_15644 ?auto_15675 ) ) ( not ( = ?auto_15644 ?auto_15657 ) ) ( not ( = ?auto_15644 ?auto_15673 ) ) ( not ( = ?auto_15644 ?auto_15656 ) ) ( not ( = ?auto_15659 ?auto_15653 ) ) ( not ( = ?auto_15659 ?auto_15674 ) ) ( not ( = ?auto_15659 ?auto_15654 ) ) ( not ( = ?auto_15659 ?auto_15660 ) ) ( not ( = ?auto_15659 ?auto_15675 ) ) ( not ( = ?auto_15659 ?auto_15657 ) ) ( not ( = ?auto_15659 ?auto_15673 ) ) ( not ( = ?auto_15659 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15646 ) ) ( not ( = ?auto_15635 ?auto_15672 ) ) ( not ( = ?auto_15636 ?auto_15646 ) ) ( not ( = ?auto_15636 ?auto_15672 ) ) ( not ( = ?auto_15637 ?auto_15646 ) ) ( not ( = ?auto_15637 ?auto_15672 ) ) ( not ( = ?auto_15638 ?auto_15646 ) ) ( not ( = ?auto_15638 ?auto_15672 ) ) ( not ( = ?auto_15639 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15672 ) ) ( not ( = ?auto_15640 ?auto_15646 ) ) ( not ( = ?auto_15640 ?auto_15672 ) ) ( not ( = ?auto_15643 ?auto_15646 ) ) ( not ( = ?auto_15643 ?auto_15672 ) ) ( not ( = ?auto_15642 ?auto_15646 ) ) ( not ( = ?auto_15642 ?auto_15672 ) ) ( not ( = ?auto_15641 ?auto_15646 ) ) ( not ( = ?auto_15641 ?auto_15672 ) ) ( not ( = ?auto_15646 ?auto_15659 ) ) ( not ( = ?auto_15646 ?auto_15653 ) ) ( not ( = ?auto_15646 ?auto_15674 ) ) ( not ( = ?auto_15646 ?auto_15654 ) ) ( not ( = ?auto_15646 ?auto_15660 ) ) ( not ( = ?auto_15646 ?auto_15675 ) ) ( not ( = ?auto_15646 ?auto_15657 ) ) ( not ( = ?auto_15646 ?auto_15673 ) ) ( not ( = ?auto_15646 ?auto_15656 ) ) ( not ( = ?auto_15672 ?auto_15659 ) ) ( not ( = ?auto_15672 ?auto_15653 ) ) ( not ( = ?auto_15672 ?auto_15674 ) ) ( not ( = ?auto_15672 ?auto_15654 ) ) ( not ( = ?auto_15672 ?auto_15660 ) ) ( not ( = ?auto_15672 ?auto_15675 ) ) ( not ( = ?auto_15672 ?auto_15657 ) ) ( not ( = ?auto_15672 ?auto_15673 ) ) ( not ( = ?auto_15672 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15635 ?auto_15649 ) ) ( not ( = ?auto_15636 ?auto_15645 ) ) ( not ( = ?auto_15636 ?auto_15649 ) ) ( not ( = ?auto_15637 ?auto_15645 ) ) ( not ( = ?auto_15637 ?auto_15649 ) ) ( not ( = ?auto_15638 ?auto_15645 ) ) ( not ( = ?auto_15638 ?auto_15649 ) ) ( not ( = ?auto_15639 ?auto_15645 ) ) ( not ( = ?auto_15639 ?auto_15649 ) ) ( not ( = ?auto_15640 ?auto_15645 ) ) ( not ( = ?auto_15640 ?auto_15649 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) ( not ( = ?auto_15643 ?auto_15649 ) ) ( not ( = ?auto_15642 ?auto_15645 ) ) ( not ( = ?auto_15642 ?auto_15649 ) ) ( not ( = ?auto_15641 ?auto_15645 ) ) ( not ( = ?auto_15641 ?auto_15649 ) ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15649 ) ) ( not ( = ?auto_15645 ?auto_15672 ) ) ( not ( = ?auto_15645 ?auto_15659 ) ) ( not ( = ?auto_15645 ?auto_15653 ) ) ( not ( = ?auto_15645 ?auto_15674 ) ) ( not ( = ?auto_15645 ?auto_15654 ) ) ( not ( = ?auto_15645 ?auto_15660 ) ) ( not ( = ?auto_15645 ?auto_15675 ) ) ( not ( = ?auto_15645 ?auto_15657 ) ) ( not ( = ?auto_15645 ?auto_15673 ) ) ( not ( = ?auto_15645 ?auto_15656 ) ) ( not ( = ?auto_15647 ?auto_15676 ) ) ( not ( = ?auto_15647 ?auto_15655 ) ) ( not ( = ?auto_15647 ?auto_15668 ) ) ( not ( = ?auto_15647 ?auto_15667 ) ) ( not ( = ?auto_15647 ?auto_15666 ) ) ( not ( = ?auto_15647 ?auto_15661 ) ) ( not ( = ?auto_15647 ?auto_15671 ) ) ( not ( = ?auto_15648 ?auto_15670 ) ) ( not ( = ?auto_15648 ?auto_15665 ) ) ( not ( = ?auto_15648 ?auto_15664 ) ) ( not ( = ?auto_15648 ?auto_15662 ) ) ( not ( = ?auto_15648 ?auto_15663 ) ) ( not ( = ?auto_15648 ?auto_15669 ) ) ( not ( = ?auto_15648 ?auto_15658 ) ) ( not ( = ?auto_15649 ?auto_15672 ) ) ( not ( = ?auto_15649 ?auto_15659 ) ) ( not ( = ?auto_15649 ?auto_15653 ) ) ( not ( = ?auto_15649 ?auto_15674 ) ) ( not ( = ?auto_15649 ?auto_15654 ) ) ( not ( = ?auto_15649 ?auto_15660 ) ) ( not ( = ?auto_15649 ?auto_15675 ) ) ( not ( = ?auto_15649 ?auto_15657 ) ) ( not ( = ?auto_15649 ?auto_15673 ) ) ( not ( = ?auto_15649 ?auto_15656 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15635 ?auto_15636 ?auto_15637 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15643 ?auto_15642 ?auto_15641 ?auto_15644 ?auto_15646 )
      ( MAKE-1CRATE ?auto_15646 ?auto_15645 )
      ( MAKE-11CRATE-VERIFY ?auto_15635 ?auto_15636 ?auto_15637 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15643 ?auto_15642 ?auto_15641 ?auto_15644 ?auto_15646 ?auto_15645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15679 - SURFACE
      ?auto_15680 - SURFACE
    )
    :vars
    (
      ?auto_15681 - HOIST
      ?auto_15682 - PLACE
      ?auto_15684 - PLACE
      ?auto_15685 - HOIST
      ?auto_15686 - SURFACE
      ?auto_15683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15681 ?auto_15682 ) ( SURFACE-AT ?auto_15679 ?auto_15682 ) ( CLEAR ?auto_15679 ) ( IS-CRATE ?auto_15680 ) ( AVAILABLE ?auto_15681 ) ( not ( = ?auto_15684 ?auto_15682 ) ) ( HOIST-AT ?auto_15685 ?auto_15684 ) ( AVAILABLE ?auto_15685 ) ( SURFACE-AT ?auto_15680 ?auto_15684 ) ( ON ?auto_15680 ?auto_15686 ) ( CLEAR ?auto_15680 ) ( TRUCK-AT ?auto_15683 ?auto_15682 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15686 ) ) ( not ( = ?auto_15680 ?auto_15686 ) ) ( not ( = ?auto_15681 ?auto_15685 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15683 ?auto_15682 ?auto_15684 )
      ( !LIFT ?auto_15685 ?auto_15680 ?auto_15686 ?auto_15684 )
      ( !LOAD ?auto_15685 ?auto_15680 ?auto_15683 ?auto_15684 )
      ( !DRIVE ?auto_15683 ?auto_15684 ?auto_15682 )
      ( !UNLOAD ?auto_15681 ?auto_15680 ?auto_15683 ?auto_15682 )
      ( !DROP ?auto_15681 ?auto_15680 ?auto_15679 ?auto_15682 )
      ( MAKE-1CRATE-VERIFY ?auto_15679 ?auto_15680 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15700 - SURFACE
      ?auto_15701 - SURFACE
      ?auto_15702 - SURFACE
      ?auto_15703 - SURFACE
      ?auto_15704 - SURFACE
      ?auto_15705 - SURFACE
      ?auto_15708 - SURFACE
      ?auto_15707 - SURFACE
      ?auto_15706 - SURFACE
      ?auto_15709 - SURFACE
      ?auto_15711 - SURFACE
      ?auto_15710 - SURFACE
      ?auto_15712 - SURFACE
    )
    :vars
    (
      ?auto_15718 - HOIST
      ?auto_15716 - PLACE
      ?auto_15717 - PLACE
      ?auto_15714 - HOIST
      ?auto_15713 - SURFACE
      ?auto_15727 - SURFACE
      ?auto_15721 - PLACE
      ?auto_15732 - HOIST
      ?auto_15740 - SURFACE
      ?auto_15729 - PLACE
      ?auto_15734 - HOIST
      ?auto_15731 - SURFACE
      ?auto_15722 - PLACE
      ?auto_15743 - HOIST
      ?auto_15719 - SURFACE
      ?auto_15741 - PLACE
      ?auto_15726 - HOIST
      ?auto_15735 - SURFACE
      ?auto_15737 - PLACE
      ?auto_15724 - HOIST
      ?auto_15736 - SURFACE
      ?auto_15733 - SURFACE
      ?auto_15738 - PLACE
      ?auto_15730 - HOIST
      ?auto_15720 - SURFACE
      ?auto_15739 - SURFACE
      ?auto_15723 - PLACE
      ?auto_15728 - HOIST
      ?auto_15725 - SURFACE
      ?auto_15742 - SURFACE
      ?auto_15715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15718 ?auto_15716 ) ( IS-CRATE ?auto_15712 ) ( not ( = ?auto_15717 ?auto_15716 ) ) ( HOIST-AT ?auto_15714 ?auto_15717 ) ( SURFACE-AT ?auto_15712 ?auto_15717 ) ( ON ?auto_15712 ?auto_15713 ) ( CLEAR ?auto_15712 ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15713 ) ) ( not ( = ?auto_15712 ?auto_15713 ) ) ( not ( = ?auto_15718 ?auto_15714 ) ) ( IS-CRATE ?auto_15710 ) ( AVAILABLE ?auto_15714 ) ( SURFACE-AT ?auto_15710 ?auto_15717 ) ( ON ?auto_15710 ?auto_15727 ) ( CLEAR ?auto_15710 ) ( not ( = ?auto_15711 ?auto_15710 ) ) ( not ( = ?auto_15711 ?auto_15727 ) ) ( not ( = ?auto_15710 ?auto_15727 ) ) ( IS-CRATE ?auto_15711 ) ( not ( = ?auto_15721 ?auto_15716 ) ) ( HOIST-AT ?auto_15732 ?auto_15721 ) ( SURFACE-AT ?auto_15711 ?auto_15721 ) ( ON ?auto_15711 ?auto_15740 ) ( CLEAR ?auto_15711 ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15740 ) ) ( not ( = ?auto_15711 ?auto_15740 ) ) ( not ( = ?auto_15718 ?auto_15732 ) ) ( IS-CRATE ?auto_15709 ) ( not ( = ?auto_15729 ?auto_15716 ) ) ( HOIST-AT ?auto_15734 ?auto_15729 ) ( SURFACE-AT ?auto_15709 ?auto_15729 ) ( ON ?auto_15709 ?auto_15731 ) ( CLEAR ?auto_15709 ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15731 ) ) ( not ( = ?auto_15709 ?auto_15731 ) ) ( not ( = ?auto_15718 ?auto_15734 ) ) ( IS-CRATE ?auto_15706 ) ( not ( = ?auto_15722 ?auto_15716 ) ) ( HOIST-AT ?auto_15743 ?auto_15722 ) ( AVAILABLE ?auto_15743 ) ( SURFACE-AT ?auto_15706 ?auto_15722 ) ( ON ?auto_15706 ?auto_15719 ) ( CLEAR ?auto_15706 ) ( not ( = ?auto_15707 ?auto_15706 ) ) ( not ( = ?auto_15707 ?auto_15719 ) ) ( not ( = ?auto_15706 ?auto_15719 ) ) ( not ( = ?auto_15718 ?auto_15743 ) ) ( IS-CRATE ?auto_15707 ) ( not ( = ?auto_15741 ?auto_15716 ) ) ( HOIST-AT ?auto_15726 ?auto_15741 ) ( AVAILABLE ?auto_15726 ) ( SURFACE-AT ?auto_15707 ?auto_15741 ) ( ON ?auto_15707 ?auto_15735 ) ( CLEAR ?auto_15707 ) ( not ( = ?auto_15708 ?auto_15707 ) ) ( not ( = ?auto_15708 ?auto_15735 ) ) ( not ( = ?auto_15707 ?auto_15735 ) ) ( not ( = ?auto_15718 ?auto_15726 ) ) ( IS-CRATE ?auto_15708 ) ( not ( = ?auto_15737 ?auto_15716 ) ) ( HOIST-AT ?auto_15724 ?auto_15737 ) ( AVAILABLE ?auto_15724 ) ( SURFACE-AT ?auto_15708 ?auto_15737 ) ( ON ?auto_15708 ?auto_15736 ) ( CLEAR ?auto_15708 ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15705 ?auto_15736 ) ) ( not ( = ?auto_15708 ?auto_15736 ) ) ( not ( = ?auto_15718 ?auto_15724 ) ) ( IS-CRATE ?auto_15705 ) ( SURFACE-AT ?auto_15705 ?auto_15721 ) ( ON ?auto_15705 ?auto_15733 ) ( CLEAR ?auto_15705 ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( not ( = ?auto_15704 ?auto_15733 ) ) ( not ( = ?auto_15705 ?auto_15733 ) ) ( IS-CRATE ?auto_15704 ) ( not ( = ?auto_15738 ?auto_15716 ) ) ( HOIST-AT ?auto_15730 ?auto_15738 ) ( AVAILABLE ?auto_15730 ) ( SURFACE-AT ?auto_15704 ?auto_15738 ) ( ON ?auto_15704 ?auto_15720 ) ( CLEAR ?auto_15704 ) ( not ( = ?auto_15703 ?auto_15704 ) ) ( not ( = ?auto_15703 ?auto_15720 ) ) ( not ( = ?auto_15704 ?auto_15720 ) ) ( not ( = ?auto_15718 ?auto_15730 ) ) ( IS-CRATE ?auto_15703 ) ( AVAILABLE ?auto_15734 ) ( SURFACE-AT ?auto_15703 ?auto_15729 ) ( ON ?auto_15703 ?auto_15739 ) ( CLEAR ?auto_15703 ) ( not ( = ?auto_15702 ?auto_15703 ) ) ( not ( = ?auto_15702 ?auto_15739 ) ) ( not ( = ?auto_15703 ?auto_15739 ) ) ( IS-CRATE ?auto_15702 ) ( not ( = ?auto_15723 ?auto_15716 ) ) ( HOIST-AT ?auto_15728 ?auto_15723 ) ( AVAILABLE ?auto_15728 ) ( SURFACE-AT ?auto_15702 ?auto_15723 ) ( ON ?auto_15702 ?auto_15725 ) ( CLEAR ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15725 ) ) ( not ( = ?auto_15702 ?auto_15725 ) ) ( not ( = ?auto_15718 ?auto_15728 ) ) ( SURFACE-AT ?auto_15700 ?auto_15716 ) ( CLEAR ?auto_15700 ) ( IS-CRATE ?auto_15701 ) ( AVAILABLE ?auto_15718 ) ( AVAILABLE ?auto_15732 ) ( SURFACE-AT ?auto_15701 ?auto_15721 ) ( ON ?auto_15701 ?auto_15742 ) ( CLEAR ?auto_15701 ) ( TRUCK-AT ?auto_15715 ?auto_15716 ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15700 ?auto_15742 ) ) ( not ( = ?auto_15701 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15725 ) ) ( not ( = ?auto_15702 ?auto_15742 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( not ( = ?auto_15728 ?auto_15732 ) ) ( not ( = ?auto_15725 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15703 ) ) ( not ( = ?auto_15700 ?auto_15739 ) ) ( not ( = ?auto_15701 ?auto_15703 ) ) ( not ( = ?auto_15701 ?auto_15739 ) ) ( not ( = ?auto_15703 ?auto_15725 ) ) ( not ( = ?auto_15703 ?auto_15742 ) ) ( not ( = ?auto_15729 ?auto_15723 ) ) ( not ( = ?auto_15729 ?auto_15721 ) ) ( not ( = ?auto_15734 ?auto_15728 ) ) ( not ( = ?auto_15734 ?auto_15732 ) ) ( not ( = ?auto_15739 ?auto_15725 ) ) ( not ( = ?auto_15739 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15704 ) ) ( not ( = ?auto_15700 ?auto_15720 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15701 ?auto_15720 ) ) ( not ( = ?auto_15702 ?auto_15704 ) ) ( not ( = ?auto_15702 ?auto_15720 ) ) ( not ( = ?auto_15704 ?auto_15739 ) ) ( not ( = ?auto_15704 ?auto_15725 ) ) ( not ( = ?auto_15704 ?auto_15742 ) ) ( not ( = ?auto_15738 ?auto_15729 ) ) ( not ( = ?auto_15738 ?auto_15723 ) ) ( not ( = ?auto_15738 ?auto_15721 ) ) ( not ( = ?auto_15730 ?auto_15734 ) ) ( not ( = ?auto_15730 ?auto_15728 ) ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( not ( = ?auto_15720 ?auto_15739 ) ) ( not ( = ?auto_15720 ?auto_15725 ) ) ( not ( = ?auto_15720 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15705 ) ) ( not ( = ?auto_15700 ?auto_15733 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15733 ) ) ( not ( = ?auto_15702 ?auto_15705 ) ) ( not ( = ?auto_15702 ?auto_15733 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15733 ) ) ( not ( = ?auto_15705 ?auto_15720 ) ) ( not ( = ?auto_15705 ?auto_15739 ) ) ( not ( = ?auto_15705 ?auto_15725 ) ) ( not ( = ?auto_15705 ?auto_15742 ) ) ( not ( = ?auto_15733 ?auto_15720 ) ) ( not ( = ?auto_15733 ?auto_15739 ) ) ( not ( = ?auto_15733 ?auto_15725 ) ) ( not ( = ?auto_15733 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15700 ?auto_15736 ) ) ( not ( = ?auto_15701 ?auto_15708 ) ) ( not ( = ?auto_15701 ?auto_15736 ) ) ( not ( = ?auto_15702 ?auto_15708 ) ) ( not ( = ?auto_15702 ?auto_15736 ) ) ( not ( = ?auto_15703 ?auto_15708 ) ) ( not ( = ?auto_15703 ?auto_15736 ) ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( not ( = ?auto_15704 ?auto_15736 ) ) ( not ( = ?auto_15708 ?auto_15733 ) ) ( not ( = ?auto_15708 ?auto_15720 ) ) ( not ( = ?auto_15708 ?auto_15739 ) ) ( not ( = ?auto_15708 ?auto_15725 ) ) ( not ( = ?auto_15708 ?auto_15742 ) ) ( not ( = ?auto_15737 ?auto_15721 ) ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15729 ) ) ( not ( = ?auto_15737 ?auto_15723 ) ) ( not ( = ?auto_15724 ?auto_15732 ) ) ( not ( = ?auto_15724 ?auto_15730 ) ) ( not ( = ?auto_15724 ?auto_15734 ) ) ( not ( = ?auto_15724 ?auto_15728 ) ) ( not ( = ?auto_15736 ?auto_15733 ) ) ( not ( = ?auto_15736 ?auto_15720 ) ) ( not ( = ?auto_15736 ?auto_15739 ) ) ( not ( = ?auto_15736 ?auto_15725 ) ) ( not ( = ?auto_15736 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15700 ?auto_15735 ) ) ( not ( = ?auto_15701 ?auto_15707 ) ) ( not ( = ?auto_15701 ?auto_15735 ) ) ( not ( = ?auto_15702 ?auto_15707 ) ) ( not ( = ?auto_15702 ?auto_15735 ) ) ( not ( = ?auto_15703 ?auto_15707 ) ) ( not ( = ?auto_15703 ?auto_15735 ) ) ( not ( = ?auto_15704 ?auto_15707 ) ) ( not ( = ?auto_15704 ?auto_15735 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15735 ) ) ( not ( = ?auto_15707 ?auto_15736 ) ) ( not ( = ?auto_15707 ?auto_15733 ) ) ( not ( = ?auto_15707 ?auto_15720 ) ) ( not ( = ?auto_15707 ?auto_15739 ) ) ( not ( = ?auto_15707 ?auto_15725 ) ) ( not ( = ?auto_15707 ?auto_15742 ) ) ( not ( = ?auto_15741 ?auto_15737 ) ) ( not ( = ?auto_15741 ?auto_15721 ) ) ( not ( = ?auto_15741 ?auto_15738 ) ) ( not ( = ?auto_15741 ?auto_15729 ) ) ( not ( = ?auto_15741 ?auto_15723 ) ) ( not ( = ?auto_15726 ?auto_15724 ) ) ( not ( = ?auto_15726 ?auto_15732 ) ) ( not ( = ?auto_15726 ?auto_15730 ) ) ( not ( = ?auto_15726 ?auto_15734 ) ) ( not ( = ?auto_15726 ?auto_15728 ) ) ( not ( = ?auto_15735 ?auto_15736 ) ) ( not ( = ?auto_15735 ?auto_15733 ) ) ( not ( = ?auto_15735 ?auto_15720 ) ) ( not ( = ?auto_15735 ?auto_15739 ) ) ( not ( = ?auto_15735 ?auto_15725 ) ) ( not ( = ?auto_15735 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15706 ) ) ( not ( = ?auto_15700 ?auto_15719 ) ) ( not ( = ?auto_15701 ?auto_15706 ) ) ( not ( = ?auto_15701 ?auto_15719 ) ) ( not ( = ?auto_15702 ?auto_15706 ) ) ( not ( = ?auto_15702 ?auto_15719 ) ) ( not ( = ?auto_15703 ?auto_15706 ) ) ( not ( = ?auto_15703 ?auto_15719 ) ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15704 ?auto_15719 ) ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15719 ) ) ( not ( = ?auto_15708 ?auto_15706 ) ) ( not ( = ?auto_15708 ?auto_15719 ) ) ( not ( = ?auto_15706 ?auto_15735 ) ) ( not ( = ?auto_15706 ?auto_15736 ) ) ( not ( = ?auto_15706 ?auto_15733 ) ) ( not ( = ?auto_15706 ?auto_15720 ) ) ( not ( = ?auto_15706 ?auto_15739 ) ) ( not ( = ?auto_15706 ?auto_15725 ) ) ( not ( = ?auto_15706 ?auto_15742 ) ) ( not ( = ?auto_15722 ?auto_15741 ) ) ( not ( = ?auto_15722 ?auto_15737 ) ) ( not ( = ?auto_15722 ?auto_15721 ) ) ( not ( = ?auto_15722 ?auto_15738 ) ) ( not ( = ?auto_15722 ?auto_15729 ) ) ( not ( = ?auto_15722 ?auto_15723 ) ) ( not ( = ?auto_15743 ?auto_15726 ) ) ( not ( = ?auto_15743 ?auto_15724 ) ) ( not ( = ?auto_15743 ?auto_15732 ) ) ( not ( = ?auto_15743 ?auto_15730 ) ) ( not ( = ?auto_15743 ?auto_15734 ) ) ( not ( = ?auto_15743 ?auto_15728 ) ) ( not ( = ?auto_15719 ?auto_15735 ) ) ( not ( = ?auto_15719 ?auto_15736 ) ) ( not ( = ?auto_15719 ?auto_15733 ) ) ( not ( = ?auto_15719 ?auto_15720 ) ) ( not ( = ?auto_15719 ?auto_15739 ) ) ( not ( = ?auto_15719 ?auto_15725 ) ) ( not ( = ?auto_15719 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15709 ) ) ( not ( = ?auto_15700 ?auto_15731 ) ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( not ( = ?auto_15701 ?auto_15731 ) ) ( not ( = ?auto_15702 ?auto_15709 ) ) ( not ( = ?auto_15702 ?auto_15731 ) ) ( not ( = ?auto_15703 ?auto_15709 ) ) ( not ( = ?auto_15703 ?auto_15731 ) ) ( not ( = ?auto_15704 ?auto_15709 ) ) ( not ( = ?auto_15704 ?auto_15731 ) ) ( not ( = ?auto_15705 ?auto_15709 ) ) ( not ( = ?auto_15705 ?auto_15731 ) ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15731 ) ) ( not ( = ?auto_15707 ?auto_15709 ) ) ( not ( = ?auto_15707 ?auto_15731 ) ) ( not ( = ?auto_15709 ?auto_15719 ) ) ( not ( = ?auto_15709 ?auto_15735 ) ) ( not ( = ?auto_15709 ?auto_15736 ) ) ( not ( = ?auto_15709 ?auto_15733 ) ) ( not ( = ?auto_15709 ?auto_15720 ) ) ( not ( = ?auto_15709 ?auto_15739 ) ) ( not ( = ?auto_15709 ?auto_15725 ) ) ( not ( = ?auto_15709 ?auto_15742 ) ) ( not ( = ?auto_15731 ?auto_15719 ) ) ( not ( = ?auto_15731 ?auto_15735 ) ) ( not ( = ?auto_15731 ?auto_15736 ) ) ( not ( = ?auto_15731 ?auto_15733 ) ) ( not ( = ?auto_15731 ?auto_15720 ) ) ( not ( = ?auto_15731 ?auto_15739 ) ) ( not ( = ?auto_15731 ?auto_15725 ) ) ( not ( = ?auto_15731 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15711 ) ) ( not ( = ?auto_15700 ?auto_15740 ) ) ( not ( = ?auto_15701 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15740 ) ) ( not ( = ?auto_15702 ?auto_15711 ) ) ( not ( = ?auto_15702 ?auto_15740 ) ) ( not ( = ?auto_15703 ?auto_15711 ) ) ( not ( = ?auto_15703 ?auto_15740 ) ) ( not ( = ?auto_15704 ?auto_15711 ) ) ( not ( = ?auto_15704 ?auto_15740 ) ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( not ( = ?auto_15705 ?auto_15740 ) ) ( not ( = ?auto_15708 ?auto_15711 ) ) ( not ( = ?auto_15708 ?auto_15740 ) ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15707 ?auto_15740 ) ) ( not ( = ?auto_15706 ?auto_15711 ) ) ( not ( = ?auto_15706 ?auto_15740 ) ) ( not ( = ?auto_15711 ?auto_15731 ) ) ( not ( = ?auto_15711 ?auto_15719 ) ) ( not ( = ?auto_15711 ?auto_15735 ) ) ( not ( = ?auto_15711 ?auto_15736 ) ) ( not ( = ?auto_15711 ?auto_15733 ) ) ( not ( = ?auto_15711 ?auto_15720 ) ) ( not ( = ?auto_15711 ?auto_15739 ) ) ( not ( = ?auto_15711 ?auto_15725 ) ) ( not ( = ?auto_15711 ?auto_15742 ) ) ( not ( = ?auto_15740 ?auto_15731 ) ) ( not ( = ?auto_15740 ?auto_15719 ) ) ( not ( = ?auto_15740 ?auto_15735 ) ) ( not ( = ?auto_15740 ?auto_15736 ) ) ( not ( = ?auto_15740 ?auto_15733 ) ) ( not ( = ?auto_15740 ?auto_15720 ) ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( not ( = ?auto_15740 ?auto_15725 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15710 ) ) ( not ( = ?auto_15700 ?auto_15727 ) ) ( not ( = ?auto_15701 ?auto_15710 ) ) ( not ( = ?auto_15701 ?auto_15727 ) ) ( not ( = ?auto_15702 ?auto_15710 ) ) ( not ( = ?auto_15702 ?auto_15727 ) ) ( not ( = ?auto_15703 ?auto_15710 ) ) ( not ( = ?auto_15703 ?auto_15727 ) ) ( not ( = ?auto_15704 ?auto_15710 ) ) ( not ( = ?auto_15704 ?auto_15727 ) ) ( not ( = ?auto_15705 ?auto_15710 ) ) ( not ( = ?auto_15705 ?auto_15727 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( not ( = ?auto_15708 ?auto_15727 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( not ( = ?auto_15707 ?auto_15727 ) ) ( not ( = ?auto_15706 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15727 ) ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15727 ) ) ( not ( = ?auto_15710 ?auto_15740 ) ) ( not ( = ?auto_15710 ?auto_15731 ) ) ( not ( = ?auto_15710 ?auto_15719 ) ) ( not ( = ?auto_15710 ?auto_15735 ) ) ( not ( = ?auto_15710 ?auto_15736 ) ) ( not ( = ?auto_15710 ?auto_15733 ) ) ( not ( = ?auto_15710 ?auto_15720 ) ) ( not ( = ?auto_15710 ?auto_15739 ) ) ( not ( = ?auto_15710 ?auto_15725 ) ) ( not ( = ?auto_15710 ?auto_15742 ) ) ( not ( = ?auto_15717 ?auto_15721 ) ) ( not ( = ?auto_15717 ?auto_15729 ) ) ( not ( = ?auto_15717 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15741 ) ) ( not ( = ?auto_15717 ?auto_15737 ) ) ( not ( = ?auto_15717 ?auto_15738 ) ) ( not ( = ?auto_15717 ?auto_15723 ) ) ( not ( = ?auto_15714 ?auto_15732 ) ) ( not ( = ?auto_15714 ?auto_15734 ) ) ( not ( = ?auto_15714 ?auto_15743 ) ) ( not ( = ?auto_15714 ?auto_15726 ) ) ( not ( = ?auto_15714 ?auto_15724 ) ) ( not ( = ?auto_15714 ?auto_15730 ) ) ( not ( = ?auto_15714 ?auto_15728 ) ) ( not ( = ?auto_15727 ?auto_15740 ) ) ( not ( = ?auto_15727 ?auto_15731 ) ) ( not ( = ?auto_15727 ?auto_15719 ) ) ( not ( = ?auto_15727 ?auto_15735 ) ) ( not ( = ?auto_15727 ?auto_15736 ) ) ( not ( = ?auto_15727 ?auto_15733 ) ) ( not ( = ?auto_15727 ?auto_15720 ) ) ( not ( = ?auto_15727 ?auto_15739 ) ) ( not ( = ?auto_15727 ?auto_15725 ) ) ( not ( = ?auto_15727 ?auto_15742 ) ) ( not ( = ?auto_15700 ?auto_15712 ) ) ( not ( = ?auto_15700 ?auto_15713 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( not ( = ?auto_15701 ?auto_15713 ) ) ( not ( = ?auto_15702 ?auto_15712 ) ) ( not ( = ?auto_15702 ?auto_15713 ) ) ( not ( = ?auto_15703 ?auto_15712 ) ) ( not ( = ?auto_15703 ?auto_15713 ) ) ( not ( = ?auto_15704 ?auto_15712 ) ) ( not ( = ?auto_15704 ?auto_15713 ) ) ( not ( = ?auto_15705 ?auto_15712 ) ) ( not ( = ?auto_15705 ?auto_15713 ) ) ( not ( = ?auto_15708 ?auto_15712 ) ) ( not ( = ?auto_15708 ?auto_15713 ) ) ( not ( = ?auto_15707 ?auto_15712 ) ) ( not ( = ?auto_15707 ?auto_15713 ) ) ( not ( = ?auto_15706 ?auto_15712 ) ) ( not ( = ?auto_15706 ?auto_15713 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15709 ?auto_15713 ) ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15713 ) ) ( not ( = ?auto_15712 ?auto_15727 ) ) ( not ( = ?auto_15712 ?auto_15740 ) ) ( not ( = ?auto_15712 ?auto_15731 ) ) ( not ( = ?auto_15712 ?auto_15719 ) ) ( not ( = ?auto_15712 ?auto_15735 ) ) ( not ( = ?auto_15712 ?auto_15736 ) ) ( not ( = ?auto_15712 ?auto_15733 ) ) ( not ( = ?auto_15712 ?auto_15720 ) ) ( not ( = ?auto_15712 ?auto_15739 ) ) ( not ( = ?auto_15712 ?auto_15725 ) ) ( not ( = ?auto_15712 ?auto_15742 ) ) ( not ( = ?auto_15713 ?auto_15727 ) ) ( not ( = ?auto_15713 ?auto_15740 ) ) ( not ( = ?auto_15713 ?auto_15731 ) ) ( not ( = ?auto_15713 ?auto_15719 ) ) ( not ( = ?auto_15713 ?auto_15735 ) ) ( not ( = ?auto_15713 ?auto_15736 ) ) ( not ( = ?auto_15713 ?auto_15733 ) ) ( not ( = ?auto_15713 ?auto_15720 ) ) ( not ( = ?auto_15713 ?auto_15739 ) ) ( not ( = ?auto_15713 ?auto_15725 ) ) ( not ( = ?auto_15713 ?auto_15742 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15700 ?auto_15701 ?auto_15702 ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15708 ?auto_15707 ?auto_15706 ?auto_15709 ?auto_15711 ?auto_15710 )
      ( MAKE-1CRATE ?auto_15710 ?auto_15712 )
      ( MAKE-12CRATE-VERIFY ?auto_15700 ?auto_15701 ?auto_15702 ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15708 ?auto_15707 ?auto_15706 ?auto_15709 ?auto_15711 ?auto_15710 ?auto_15712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15746 - SURFACE
      ?auto_15747 - SURFACE
    )
    :vars
    (
      ?auto_15748 - HOIST
      ?auto_15749 - PLACE
      ?auto_15751 - PLACE
      ?auto_15752 - HOIST
      ?auto_15753 - SURFACE
      ?auto_15750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15748 ?auto_15749 ) ( SURFACE-AT ?auto_15746 ?auto_15749 ) ( CLEAR ?auto_15746 ) ( IS-CRATE ?auto_15747 ) ( AVAILABLE ?auto_15748 ) ( not ( = ?auto_15751 ?auto_15749 ) ) ( HOIST-AT ?auto_15752 ?auto_15751 ) ( AVAILABLE ?auto_15752 ) ( SURFACE-AT ?auto_15747 ?auto_15751 ) ( ON ?auto_15747 ?auto_15753 ) ( CLEAR ?auto_15747 ) ( TRUCK-AT ?auto_15750 ?auto_15749 ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( not ( = ?auto_15746 ?auto_15753 ) ) ( not ( = ?auto_15747 ?auto_15753 ) ) ( not ( = ?auto_15748 ?auto_15752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15750 ?auto_15749 ?auto_15751 )
      ( !LIFT ?auto_15752 ?auto_15747 ?auto_15753 ?auto_15751 )
      ( !LOAD ?auto_15752 ?auto_15747 ?auto_15750 ?auto_15751 )
      ( !DRIVE ?auto_15750 ?auto_15751 ?auto_15749 )
      ( !UNLOAD ?auto_15748 ?auto_15747 ?auto_15750 ?auto_15749 )
      ( !DROP ?auto_15748 ?auto_15747 ?auto_15746 ?auto_15749 )
      ( MAKE-1CRATE-VERIFY ?auto_15746 ?auto_15747 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15768 - SURFACE
      ?auto_15769 - SURFACE
      ?auto_15770 - SURFACE
      ?auto_15771 - SURFACE
      ?auto_15772 - SURFACE
      ?auto_15773 - SURFACE
      ?auto_15776 - SURFACE
      ?auto_15775 - SURFACE
      ?auto_15774 - SURFACE
      ?auto_15777 - SURFACE
      ?auto_15779 - SURFACE
      ?auto_15778 - SURFACE
      ?auto_15780 - SURFACE
      ?auto_15781 - SURFACE
    )
    :vars
    (
      ?auto_15783 - HOIST
      ?auto_15786 - PLACE
      ?auto_15782 - PLACE
      ?auto_15787 - HOIST
      ?auto_15785 - SURFACE
      ?auto_15810 - PLACE
      ?auto_15801 - HOIST
      ?auto_15797 - SURFACE
      ?auto_15803 - SURFACE
      ?auto_15808 - PLACE
      ?auto_15796 - HOIST
      ?auto_15790 - SURFACE
      ?auto_15802 - PLACE
      ?auto_15788 - HOIST
      ?auto_15793 - SURFACE
      ?auto_15806 - PLACE
      ?auto_15791 - HOIST
      ?auto_15812 - SURFACE
      ?auto_15800 - PLACE
      ?auto_15811 - HOIST
      ?auto_15792 - SURFACE
      ?auto_15813 - PLACE
      ?auto_15807 - HOIST
      ?auto_15798 - SURFACE
      ?auto_15799 - SURFACE
      ?auto_15804 - SURFACE
      ?auto_15795 - SURFACE
      ?auto_15789 - PLACE
      ?auto_15809 - HOIST
      ?auto_15805 - SURFACE
      ?auto_15794 - SURFACE
      ?auto_15784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15783 ?auto_15786 ) ( IS-CRATE ?auto_15781 ) ( not ( = ?auto_15782 ?auto_15786 ) ) ( HOIST-AT ?auto_15787 ?auto_15782 ) ( SURFACE-AT ?auto_15781 ?auto_15782 ) ( ON ?auto_15781 ?auto_15785 ) ( CLEAR ?auto_15781 ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15785 ) ) ( not ( = ?auto_15781 ?auto_15785 ) ) ( not ( = ?auto_15783 ?auto_15787 ) ) ( IS-CRATE ?auto_15780 ) ( not ( = ?auto_15810 ?auto_15786 ) ) ( HOIST-AT ?auto_15801 ?auto_15810 ) ( SURFACE-AT ?auto_15780 ?auto_15810 ) ( ON ?auto_15780 ?auto_15797 ) ( CLEAR ?auto_15780 ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15797 ) ) ( not ( = ?auto_15780 ?auto_15797 ) ) ( not ( = ?auto_15783 ?auto_15801 ) ) ( IS-CRATE ?auto_15778 ) ( AVAILABLE ?auto_15801 ) ( SURFACE-AT ?auto_15778 ?auto_15810 ) ( ON ?auto_15778 ?auto_15803 ) ( CLEAR ?auto_15778 ) ( not ( = ?auto_15779 ?auto_15778 ) ) ( not ( = ?auto_15779 ?auto_15803 ) ) ( not ( = ?auto_15778 ?auto_15803 ) ) ( IS-CRATE ?auto_15779 ) ( not ( = ?auto_15808 ?auto_15786 ) ) ( HOIST-AT ?auto_15796 ?auto_15808 ) ( SURFACE-AT ?auto_15779 ?auto_15808 ) ( ON ?auto_15779 ?auto_15790 ) ( CLEAR ?auto_15779 ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15790 ) ) ( not ( = ?auto_15779 ?auto_15790 ) ) ( not ( = ?auto_15783 ?auto_15796 ) ) ( IS-CRATE ?auto_15777 ) ( not ( = ?auto_15802 ?auto_15786 ) ) ( HOIST-AT ?auto_15788 ?auto_15802 ) ( SURFACE-AT ?auto_15777 ?auto_15802 ) ( ON ?auto_15777 ?auto_15793 ) ( CLEAR ?auto_15777 ) ( not ( = ?auto_15774 ?auto_15777 ) ) ( not ( = ?auto_15774 ?auto_15793 ) ) ( not ( = ?auto_15777 ?auto_15793 ) ) ( not ( = ?auto_15783 ?auto_15788 ) ) ( IS-CRATE ?auto_15774 ) ( not ( = ?auto_15806 ?auto_15786 ) ) ( HOIST-AT ?auto_15791 ?auto_15806 ) ( AVAILABLE ?auto_15791 ) ( SURFACE-AT ?auto_15774 ?auto_15806 ) ( ON ?auto_15774 ?auto_15812 ) ( CLEAR ?auto_15774 ) ( not ( = ?auto_15775 ?auto_15774 ) ) ( not ( = ?auto_15775 ?auto_15812 ) ) ( not ( = ?auto_15774 ?auto_15812 ) ) ( not ( = ?auto_15783 ?auto_15791 ) ) ( IS-CRATE ?auto_15775 ) ( not ( = ?auto_15800 ?auto_15786 ) ) ( HOIST-AT ?auto_15811 ?auto_15800 ) ( AVAILABLE ?auto_15811 ) ( SURFACE-AT ?auto_15775 ?auto_15800 ) ( ON ?auto_15775 ?auto_15792 ) ( CLEAR ?auto_15775 ) ( not ( = ?auto_15776 ?auto_15775 ) ) ( not ( = ?auto_15776 ?auto_15792 ) ) ( not ( = ?auto_15775 ?auto_15792 ) ) ( not ( = ?auto_15783 ?auto_15811 ) ) ( IS-CRATE ?auto_15776 ) ( not ( = ?auto_15813 ?auto_15786 ) ) ( HOIST-AT ?auto_15807 ?auto_15813 ) ( AVAILABLE ?auto_15807 ) ( SURFACE-AT ?auto_15776 ?auto_15813 ) ( ON ?auto_15776 ?auto_15798 ) ( CLEAR ?auto_15776 ) ( not ( = ?auto_15773 ?auto_15776 ) ) ( not ( = ?auto_15773 ?auto_15798 ) ) ( not ( = ?auto_15776 ?auto_15798 ) ) ( not ( = ?auto_15783 ?auto_15807 ) ) ( IS-CRATE ?auto_15773 ) ( SURFACE-AT ?auto_15773 ?auto_15808 ) ( ON ?auto_15773 ?auto_15799 ) ( CLEAR ?auto_15773 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15799 ) ) ( not ( = ?auto_15773 ?auto_15799 ) ) ( IS-CRATE ?auto_15772 ) ( AVAILABLE ?auto_15787 ) ( SURFACE-AT ?auto_15772 ?auto_15782 ) ( ON ?auto_15772 ?auto_15804 ) ( CLEAR ?auto_15772 ) ( not ( = ?auto_15771 ?auto_15772 ) ) ( not ( = ?auto_15771 ?auto_15804 ) ) ( not ( = ?auto_15772 ?auto_15804 ) ) ( IS-CRATE ?auto_15771 ) ( AVAILABLE ?auto_15788 ) ( SURFACE-AT ?auto_15771 ?auto_15802 ) ( ON ?auto_15771 ?auto_15795 ) ( CLEAR ?auto_15771 ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15795 ) ) ( not ( = ?auto_15771 ?auto_15795 ) ) ( IS-CRATE ?auto_15770 ) ( not ( = ?auto_15789 ?auto_15786 ) ) ( HOIST-AT ?auto_15809 ?auto_15789 ) ( AVAILABLE ?auto_15809 ) ( SURFACE-AT ?auto_15770 ?auto_15789 ) ( ON ?auto_15770 ?auto_15805 ) ( CLEAR ?auto_15770 ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15805 ) ) ( not ( = ?auto_15770 ?auto_15805 ) ) ( not ( = ?auto_15783 ?auto_15809 ) ) ( SURFACE-AT ?auto_15768 ?auto_15786 ) ( CLEAR ?auto_15768 ) ( IS-CRATE ?auto_15769 ) ( AVAILABLE ?auto_15783 ) ( AVAILABLE ?auto_15796 ) ( SURFACE-AT ?auto_15769 ?auto_15808 ) ( ON ?auto_15769 ?auto_15794 ) ( CLEAR ?auto_15769 ) ( TRUCK-AT ?auto_15784 ?auto_15786 ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15794 ) ) ( not ( = ?auto_15769 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15770 ) ) ( not ( = ?auto_15768 ?auto_15805 ) ) ( not ( = ?auto_15770 ?auto_15794 ) ) ( not ( = ?auto_15789 ?auto_15808 ) ) ( not ( = ?auto_15809 ?auto_15796 ) ) ( not ( = ?auto_15805 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15795 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15795 ) ) ( not ( = ?auto_15771 ?auto_15805 ) ) ( not ( = ?auto_15771 ?auto_15794 ) ) ( not ( = ?auto_15802 ?auto_15789 ) ) ( not ( = ?auto_15802 ?auto_15808 ) ) ( not ( = ?auto_15788 ?auto_15809 ) ) ( not ( = ?auto_15788 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15805 ) ) ( not ( = ?auto_15795 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15772 ) ) ( not ( = ?auto_15768 ?auto_15804 ) ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15769 ?auto_15804 ) ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( not ( = ?auto_15770 ?auto_15804 ) ) ( not ( = ?auto_15772 ?auto_15795 ) ) ( not ( = ?auto_15772 ?auto_15805 ) ) ( not ( = ?auto_15772 ?auto_15794 ) ) ( not ( = ?auto_15782 ?auto_15802 ) ) ( not ( = ?auto_15782 ?auto_15789 ) ) ( not ( = ?auto_15782 ?auto_15808 ) ) ( not ( = ?auto_15787 ?auto_15788 ) ) ( not ( = ?auto_15787 ?auto_15809 ) ) ( not ( = ?auto_15787 ?auto_15796 ) ) ( not ( = ?auto_15804 ?auto_15795 ) ) ( not ( = ?auto_15804 ?auto_15805 ) ) ( not ( = ?auto_15804 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15773 ) ) ( not ( = ?auto_15768 ?auto_15799 ) ) ( not ( = ?auto_15769 ?auto_15773 ) ) ( not ( = ?auto_15769 ?auto_15799 ) ) ( not ( = ?auto_15770 ?auto_15773 ) ) ( not ( = ?auto_15770 ?auto_15799 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15799 ) ) ( not ( = ?auto_15773 ?auto_15804 ) ) ( not ( = ?auto_15773 ?auto_15795 ) ) ( not ( = ?auto_15773 ?auto_15805 ) ) ( not ( = ?auto_15773 ?auto_15794 ) ) ( not ( = ?auto_15799 ?auto_15804 ) ) ( not ( = ?auto_15799 ?auto_15795 ) ) ( not ( = ?auto_15799 ?auto_15805 ) ) ( not ( = ?auto_15799 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15776 ) ) ( not ( = ?auto_15768 ?auto_15798 ) ) ( not ( = ?auto_15769 ?auto_15776 ) ) ( not ( = ?auto_15769 ?auto_15798 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( not ( = ?auto_15770 ?auto_15798 ) ) ( not ( = ?auto_15771 ?auto_15776 ) ) ( not ( = ?auto_15771 ?auto_15798 ) ) ( not ( = ?auto_15772 ?auto_15776 ) ) ( not ( = ?auto_15772 ?auto_15798 ) ) ( not ( = ?auto_15776 ?auto_15799 ) ) ( not ( = ?auto_15776 ?auto_15804 ) ) ( not ( = ?auto_15776 ?auto_15795 ) ) ( not ( = ?auto_15776 ?auto_15805 ) ) ( not ( = ?auto_15776 ?auto_15794 ) ) ( not ( = ?auto_15813 ?auto_15808 ) ) ( not ( = ?auto_15813 ?auto_15782 ) ) ( not ( = ?auto_15813 ?auto_15802 ) ) ( not ( = ?auto_15813 ?auto_15789 ) ) ( not ( = ?auto_15807 ?auto_15796 ) ) ( not ( = ?auto_15807 ?auto_15787 ) ) ( not ( = ?auto_15807 ?auto_15788 ) ) ( not ( = ?auto_15807 ?auto_15809 ) ) ( not ( = ?auto_15798 ?auto_15799 ) ) ( not ( = ?auto_15798 ?auto_15804 ) ) ( not ( = ?auto_15798 ?auto_15795 ) ) ( not ( = ?auto_15798 ?auto_15805 ) ) ( not ( = ?auto_15798 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( not ( = ?auto_15768 ?auto_15792 ) ) ( not ( = ?auto_15769 ?auto_15775 ) ) ( not ( = ?auto_15769 ?auto_15792 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( not ( = ?auto_15770 ?auto_15792 ) ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( not ( = ?auto_15771 ?auto_15792 ) ) ( not ( = ?auto_15772 ?auto_15775 ) ) ( not ( = ?auto_15772 ?auto_15792 ) ) ( not ( = ?auto_15773 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15792 ) ) ( not ( = ?auto_15775 ?auto_15798 ) ) ( not ( = ?auto_15775 ?auto_15799 ) ) ( not ( = ?auto_15775 ?auto_15804 ) ) ( not ( = ?auto_15775 ?auto_15795 ) ) ( not ( = ?auto_15775 ?auto_15805 ) ) ( not ( = ?auto_15775 ?auto_15794 ) ) ( not ( = ?auto_15800 ?auto_15813 ) ) ( not ( = ?auto_15800 ?auto_15808 ) ) ( not ( = ?auto_15800 ?auto_15782 ) ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15800 ?auto_15789 ) ) ( not ( = ?auto_15811 ?auto_15807 ) ) ( not ( = ?auto_15811 ?auto_15796 ) ) ( not ( = ?auto_15811 ?auto_15787 ) ) ( not ( = ?auto_15811 ?auto_15788 ) ) ( not ( = ?auto_15811 ?auto_15809 ) ) ( not ( = ?auto_15792 ?auto_15798 ) ) ( not ( = ?auto_15792 ?auto_15799 ) ) ( not ( = ?auto_15792 ?auto_15804 ) ) ( not ( = ?auto_15792 ?auto_15795 ) ) ( not ( = ?auto_15792 ?auto_15805 ) ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( not ( = ?auto_15768 ?auto_15812 ) ) ( not ( = ?auto_15769 ?auto_15774 ) ) ( not ( = ?auto_15769 ?auto_15812 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( not ( = ?auto_15770 ?auto_15812 ) ) ( not ( = ?auto_15771 ?auto_15774 ) ) ( not ( = ?auto_15771 ?auto_15812 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15812 ) ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15812 ) ) ( not ( = ?auto_15776 ?auto_15774 ) ) ( not ( = ?auto_15776 ?auto_15812 ) ) ( not ( = ?auto_15774 ?auto_15792 ) ) ( not ( = ?auto_15774 ?auto_15798 ) ) ( not ( = ?auto_15774 ?auto_15799 ) ) ( not ( = ?auto_15774 ?auto_15804 ) ) ( not ( = ?auto_15774 ?auto_15795 ) ) ( not ( = ?auto_15774 ?auto_15805 ) ) ( not ( = ?auto_15774 ?auto_15794 ) ) ( not ( = ?auto_15806 ?auto_15800 ) ) ( not ( = ?auto_15806 ?auto_15813 ) ) ( not ( = ?auto_15806 ?auto_15808 ) ) ( not ( = ?auto_15806 ?auto_15782 ) ) ( not ( = ?auto_15806 ?auto_15802 ) ) ( not ( = ?auto_15806 ?auto_15789 ) ) ( not ( = ?auto_15791 ?auto_15811 ) ) ( not ( = ?auto_15791 ?auto_15807 ) ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15791 ?auto_15787 ) ) ( not ( = ?auto_15791 ?auto_15788 ) ) ( not ( = ?auto_15791 ?auto_15809 ) ) ( not ( = ?auto_15812 ?auto_15792 ) ) ( not ( = ?auto_15812 ?auto_15798 ) ) ( not ( = ?auto_15812 ?auto_15799 ) ) ( not ( = ?auto_15812 ?auto_15804 ) ) ( not ( = ?auto_15812 ?auto_15795 ) ) ( not ( = ?auto_15812 ?auto_15805 ) ) ( not ( = ?auto_15812 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15777 ) ) ( not ( = ?auto_15768 ?auto_15793 ) ) ( not ( = ?auto_15769 ?auto_15777 ) ) ( not ( = ?auto_15769 ?auto_15793 ) ) ( not ( = ?auto_15770 ?auto_15777 ) ) ( not ( = ?auto_15770 ?auto_15793 ) ) ( not ( = ?auto_15771 ?auto_15777 ) ) ( not ( = ?auto_15771 ?auto_15793 ) ) ( not ( = ?auto_15772 ?auto_15777 ) ) ( not ( = ?auto_15772 ?auto_15793 ) ) ( not ( = ?auto_15773 ?auto_15777 ) ) ( not ( = ?auto_15773 ?auto_15793 ) ) ( not ( = ?auto_15776 ?auto_15777 ) ) ( not ( = ?auto_15776 ?auto_15793 ) ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( not ( = ?auto_15775 ?auto_15793 ) ) ( not ( = ?auto_15777 ?auto_15812 ) ) ( not ( = ?auto_15777 ?auto_15792 ) ) ( not ( = ?auto_15777 ?auto_15798 ) ) ( not ( = ?auto_15777 ?auto_15799 ) ) ( not ( = ?auto_15777 ?auto_15804 ) ) ( not ( = ?auto_15777 ?auto_15795 ) ) ( not ( = ?auto_15777 ?auto_15805 ) ) ( not ( = ?auto_15777 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15812 ) ) ( not ( = ?auto_15793 ?auto_15792 ) ) ( not ( = ?auto_15793 ?auto_15798 ) ) ( not ( = ?auto_15793 ?auto_15799 ) ) ( not ( = ?auto_15793 ?auto_15804 ) ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( not ( = ?auto_15793 ?auto_15805 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15779 ) ) ( not ( = ?auto_15768 ?auto_15790 ) ) ( not ( = ?auto_15769 ?auto_15779 ) ) ( not ( = ?auto_15769 ?auto_15790 ) ) ( not ( = ?auto_15770 ?auto_15779 ) ) ( not ( = ?auto_15770 ?auto_15790 ) ) ( not ( = ?auto_15771 ?auto_15779 ) ) ( not ( = ?auto_15771 ?auto_15790 ) ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15772 ?auto_15790 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( not ( = ?auto_15773 ?auto_15790 ) ) ( not ( = ?auto_15776 ?auto_15779 ) ) ( not ( = ?auto_15776 ?auto_15790 ) ) ( not ( = ?auto_15775 ?auto_15779 ) ) ( not ( = ?auto_15775 ?auto_15790 ) ) ( not ( = ?auto_15774 ?auto_15779 ) ) ( not ( = ?auto_15774 ?auto_15790 ) ) ( not ( = ?auto_15779 ?auto_15793 ) ) ( not ( = ?auto_15779 ?auto_15812 ) ) ( not ( = ?auto_15779 ?auto_15792 ) ) ( not ( = ?auto_15779 ?auto_15798 ) ) ( not ( = ?auto_15779 ?auto_15799 ) ) ( not ( = ?auto_15779 ?auto_15804 ) ) ( not ( = ?auto_15779 ?auto_15795 ) ) ( not ( = ?auto_15779 ?auto_15805 ) ) ( not ( = ?auto_15779 ?auto_15794 ) ) ( not ( = ?auto_15790 ?auto_15793 ) ) ( not ( = ?auto_15790 ?auto_15812 ) ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( not ( = ?auto_15790 ?auto_15798 ) ) ( not ( = ?auto_15790 ?auto_15799 ) ) ( not ( = ?auto_15790 ?auto_15804 ) ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( not ( = ?auto_15790 ?auto_15805 ) ) ( not ( = ?auto_15790 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15778 ) ) ( not ( = ?auto_15768 ?auto_15803 ) ) ( not ( = ?auto_15769 ?auto_15778 ) ) ( not ( = ?auto_15769 ?auto_15803 ) ) ( not ( = ?auto_15770 ?auto_15778 ) ) ( not ( = ?auto_15770 ?auto_15803 ) ) ( not ( = ?auto_15771 ?auto_15778 ) ) ( not ( = ?auto_15771 ?auto_15803 ) ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( not ( = ?auto_15772 ?auto_15803 ) ) ( not ( = ?auto_15773 ?auto_15778 ) ) ( not ( = ?auto_15773 ?auto_15803 ) ) ( not ( = ?auto_15776 ?auto_15778 ) ) ( not ( = ?auto_15776 ?auto_15803 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15803 ) ) ( not ( = ?auto_15774 ?auto_15778 ) ) ( not ( = ?auto_15774 ?auto_15803 ) ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15803 ) ) ( not ( = ?auto_15778 ?auto_15790 ) ) ( not ( = ?auto_15778 ?auto_15793 ) ) ( not ( = ?auto_15778 ?auto_15812 ) ) ( not ( = ?auto_15778 ?auto_15792 ) ) ( not ( = ?auto_15778 ?auto_15798 ) ) ( not ( = ?auto_15778 ?auto_15799 ) ) ( not ( = ?auto_15778 ?auto_15804 ) ) ( not ( = ?auto_15778 ?auto_15795 ) ) ( not ( = ?auto_15778 ?auto_15805 ) ) ( not ( = ?auto_15778 ?auto_15794 ) ) ( not ( = ?auto_15810 ?auto_15808 ) ) ( not ( = ?auto_15810 ?auto_15802 ) ) ( not ( = ?auto_15810 ?auto_15806 ) ) ( not ( = ?auto_15810 ?auto_15800 ) ) ( not ( = ?auto_15810 ?auto_15813 ) ) ( not ( = ?auto_15810 ?auto_15782 ) ) ( not ( = ?auto_15810 ?auto_15789 ) ) ( not ( = ?auto_15801 ?auto_15796 ) ) ( not ( = ?auto_15801 ?auto_15788 ) ) ( not ( = ?auto_15801 ?auto_15791 ) ) ( not ( = ?auto_15801 ?auto_15811 ) ) ( not ( = ?auto_15801 ?auto_15807 ) ) ( not ( = ?auto_15801 ?auto_15787 ) ) ( not ( = ?auto_15801 ?auto_15809 ) ) ( not ( = ?auto_15803 ?auto_15790 ) ) ( not ( = ?auto_15803 ?auto_15793 ) ) ( not ( = ?auto_15803 ?auto_15812 ) ) ( not ( = ?auto_15803 ?auto_15792 ) ) ( not ( = ?auto_15803 ?auto_15798 ) ) ( not ( = ?auto_15803 ?auto_15799 ) ) ( not ( = ?auto_15803 ?auto_15804 ) ) ( not ( = ?auto_15803 ?auto_15795 ) ) ( not ( = ?auto_15803 ?auto_15805 ) ) ( not ( = ?auto_15803 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15780 ) ) ( not ( = ?auto_15768 ?auto_15797 ) ) ( not ( = ?auto_15769 ?auto_15780 ) ) ( not ( = ?auto_15769 ?auto_15797 ) ) ( not ( = ?auto_15770 ?auto_15780 ) ) ( not ( = ?auto_15770 ?auto_15797 ) ) ( not ( = ?auto_15771 ?auto_15780 ) ) ( not ( = ?auto_15771 ?auto_15797 ) ) ( not ( = ?auto_15772 ?auto_15780 ) ) ( not ( = ?auto_15772 ?auto_15797 ) ) ( not ( = ?auto_15773 ?auto_15780 ) ) ( not ( = ?auto_15773 ?auto_15797 ) ) ( not ( = ?auto_15776 ?auto_15780 ) ) ( not ( = ?auto_15776 ?auto_15797 ) ) ( not ( = ?auto_15775 ?auto_15780 ) ) ( not ( = ?auto_15775 ?auto_15797 ) ) ( not ( = ?auto_15774 ?auto_15780 ) ) ( not ( = ?auto_15774 ?auto_15797 ) ) ( not ( = ?auto_15777 ?auto_15780 ) ) ( not ( = ?auto_15777 ?auto_15797 ) ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15797 ) ) ( not ( = ?auto_15780 ?auto_15803 ) ) ( not ( = ?auto_15780 ?auto_15790 ) ) ( not ( = ?auto_15780 ?auto_15793 ) ) ( not ( = ?auto_15780 ?auto_15812 ) ) ( not ( = ?auto_15780 ?auto_15792 ) ) ( not ( = ?auto_15780 ?auto_15798 ) ) ( not ( = ?auto_15780 ?auto_15799 ) ) ( not ( = ?auto_15780 ?auto_15804 ) ) ( not ( = ?auto_15780 ?auto_15795 ) ) ( not ( = ?auto_15780 ?auto_15805 ) ) ( not ( = ?auto_15780 ?auto_15794 ) ) ( not ( = ?auto_15797 ?auto_15803 ) ) ( not ( = ?auto_15797 ?auto_15790 ) ) ( not ( = ?auto_15797 ?auto_15793 ) ) ( not ( = ?auto_15797 ?auto_15812 ) ) ( not ( = ?auto_15797 ?auto_15792 ) ) ( not ( = ?auto_15797 ?auto_15798 ) ) ( not ( = ?auto_15797 ?auto_15799 ) ) ( not ( = ?auto_15797 ?auto_15804 ) ) ( not ( = ?auto_15797 ?auto_15795 ) ) ( not ( = ?auto_15797 ?auto_15805 ) ) ( not ( = ?auto_15797 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15781 ) ) ( not ( = ?auto_15768 ?auto_15785 ) ) ( not ( = ?auto_15769 ?auto_15781 ) ) ( not ( = ?auto_15769 ?auto_15785 ) ) ( not ( = ?auto_15770 ?auto_15781 ) ) ( not ( = ?auto_15770 ?auto_15785 ) ) ( not ( = ?auto_15771 ?auto_15781 ) ) ( not ( = ?auto_15771 ?auto_15785 ) ) ( not ( = ?auto_15772 ?auto_15781 ) ) ( not ( = ?auto_15772 ?auto_15785 ) ) ( not ( = ?auto_15773 ?auto_15781 ) ) ( not ( = ?auto_15773 ?auto_15785 ) ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( not ( = ?auto_15776 ?auto_15785 ) ) ( not ( = ?auto_15775 ?auto_15781 ) ) ( not ( = ?auto_15775 ?auto_15785 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15774 ?auto_15785 ) ) ( not ( = ?auto_15777 ?auto_15781 ) ) ( not ( = ?auto_15777 ?auto_15785 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15785 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15785 ) ) ( not ( = ?auto_15781 ?auto_15797 ) ) ( not ( = ?auto_15781 ?auto_15803 ) ) ( not ( = ?auto_15781 ?auto_15790 ) ) ( not ( = ?auto_15781 ?auto_15793 ) ) ( not ( = ?auto_15781 ?auto_15812 ) ) ( not ( = ?auto_15781 ?auto_15792 ) ) ( not ( = ?auto_15781 ?auto_15798 ) ) ( not ( = ?auto_15781 ?auto_15799 ) ) ( not ( = ?auto_15781 ?auto_15804 ) ) ( not ( = ?auto_15781 ?auto_15795 ) ) ( not ( = ?auto_15781 ?auto_15805 ) ) ( not ( = ?auto_15781 ?auto_15794 ) ) ( not ( = ?auto_15785 ?auto_15797 ) ) ( not ( = ?auto_15785 ?auto_15803 ) ) ( not ( = ?auto_15785 ?auto_15790 ) ) ( not ( = ?auto_15785 ?auto_15793 ) ) ( not ( = ?auto_15785 ?auto_15812 ) ) ( not ( = ?auto_15785 ?auto_15792 ) ) ( not ( = ?auto_15785 ?auto_15798 ) ) ( not ( = ?auto_15785 ?auto_15799 ) ) ( not ( = ?auto_15785 ?auto_15804 ) ) ( not ( = ?auto_15785 ?auto_15795 ) ) ( not ( = ?auto_15785 ?auto_15805 ) ) ( not ( = ?auto_15785 ?auto_15794 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15776 ?auto_15775 ?auto_15774 ?auto_15777 ?auto_15779 ?auto_15778 ?auto_15780 )
      ( MAKE-1CRATE ?auto_15780 ?auto_15781 )
      ( MAKE-13CRATE-VERIFY ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15776 ?auto_15775 ?auto_15774 ?auto_15777 ?auto_15779 ?auto_15778 ?auto_15780 ?auto_15781 ) )
  )

)

