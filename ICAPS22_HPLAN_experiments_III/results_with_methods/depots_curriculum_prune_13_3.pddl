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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15239 - SURFACE
      ?auto_15240 - SURFACE
      ?auto_15241 - SURFACE
    )
    :vars
    (
      ?auto_15243 - HOIST
      ?auto_15246 - PLACE
      ?auto_15245 - PLACE
      ?auto_15247 - HOIST
      ?auto_15242 - SURFACE
      ?auto_15248 - PLACE
      ?auto_15249 - HOIST
      ?auto_15250 - SURFACE
      ?auto_15244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15243 ?auto_15246 ) ( IS-CRATE ?auto_15241 ) ( not ( = ?auto_15245 ?auto_15246 ) ) ( HOIST-AT ?auto_15247 ?auto_15245 ) ( AVAILABLE ?auto_15247 ) ( SURFACE-AT ?auto_15241 ?auto_15245 ) ( ON ?auto_15241 ?auto_15242 ) ( CLEAR ?auto_15241 ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15242 ) ) ( not ( = ?auto_15243 ?auto_15247 ) ) ( SURFACE-AT ?auto_15239 ?auto_15246 ) ( CLEAR ?auto_15239 ) ( IS-CRATE ?auto_15240 ) ( AVAILABLE ?auto_15243 ) ( not ( = ?auto_15248 ?auto_15246 ) ) ( HOIST-AT ?auto_15249 ?auto_15248 ) ( AVAILABLE ?auto_15249 ) ( SURFACE-AT ?auto_15240 ?auto_15248 ) ( ON ?auto_15240 ?auto_15250 ) ( CLEAR ?auto_15240 ) ( TRUCK-AT ?auto_15244 ?auto_15246 ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15250 ) ) ( not ( = ?auto_15240 ?auto_15250 ) ) ( not ( = ?auto_15243 ?auto_15249 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( not ( = ?auto_15239 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15250 ) ) ( not ( = ?auto_15245 ?auto_15248 ) ) ( not ( = ?auto_15247 ?auto_15249 ) ) ( not ( = ?auto_15242 ?auto_15250 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15239 ?auto_15240 )
      ( MAKE-1CRATE ?auto_15240 ?auto_15241 )
      ( MAKE-2CRATE-VERIFY ?auto_15239 ?auto_15240 ?auto_15241 ) )
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
      ?auto_15271 - PLACE
      ?auto_15272 - PLACE
      ?auto_15270 - HOIST
      ?auto_15274 - SURFACE
      ?auto_15278 - PLACE
      ?auto_15276 - HOIST
      ?auto_15275 - SURFACE
      ?auto_15279 - PLACE
      ?auto_15277 - HOIST
      ?auto_15280 - SURFACE
      ?auto_15273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15269 ?auto_15271 ) ( IS-CRATE ?auto_15268 ) ( not ( = ?auto_15272 ?auto_15271 ) ) ( HOIST-AT ?auto_15270 ?auto_15272 ) ( AVAILABLE ?auto_15270 ) ( SURFACE-AT ?auto_15268 ?auto_15272 ) ( ON ?auto_15268 ?auto_15274 ) ( CLEAR ?auto_15268 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15274 ) ) ( not ( = ?auto_15268 ?auto_15274 ) ) ( not ( = ?auto_15269 ?auto_15270 ) ) ( IS-CRATE ?auto_15267 ) ( not ( = ?auto_15278 ?auto_15271 ) ) ( HOIST-AT ?auto_15276 ?auto_15278 ) ( AVAILABLE ?auto_15276 ) ( SURFACE-AT ?auto_15267 ?auto_15278 ) ( ON ?auto_15267 ?auto_15275 ) ( CLEAR ?auto_15267 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15275 ) ) ( not ( = ?auto_15267 ?auto_15275 ) ) ( not ( = ?auto_15269 ?auto_15276 ) ) ( SURFACE-AT ?auto_15265 ?auto_15271 ) ( CLEAR ?auto_15265 ) ( IS-CRATE ?auto_15266 ) ( AVAILABLE ?auto_15269 ) ( not ( = ?auto_15279 ?auto_15271 ) ) ( HOIST-AT ?auto_15277 ?auto_15279 ) ( AVAILABLE ?auto_15277 ) ( SURFACE-AT ?auto_15266 ?auto_15279 ) ( ON ?auto_15266 ?auto_15280 ) ( CLEAR ?auto_15266 ) ( TRUCK-AT ?auto_15273 ?auto_15271 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15280 ) ) ( not ( = ?auto_15266 ?auto_15280 ) ) ( not ( = ?auto_15269 ?auto_15277 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15275 ) ) ( not ( = ?auto_15267 ?auto_15280 ) ) ( not ( = ?auto_15278 ?auto_15279 ) ) ( not ( = ?auto_15276 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15280 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15274 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15274 ) ) ( not ( = ?auto_15268 ?auto_15275 ) ) ( not ( = ?auto_15268 ?auto_15280 ) ) ( not ( = ?auto_15272 ?auto_15278 ) ) ( not ( = ?auto_15272 ?auto_15279 ) ) ( not ( = ?auto_15270 ?auto_15276 ) ) ( not ( = ?auto_15270 ?auto_15277 ) ) ( not ( = ?auto_15274 ?auto_15275 ) ) ( not ( = ?auto_15274 ?auto_15280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15265 ?auto_15266 ?auto_15267 )
      ( MAKE-1CRATE ?auto_15267 ?auto_15268 )
      ( MAKE-3CRATE-VERIFY ?auto_15265 ?auto_15266 ?auto_15267 ?auto_15268 ) )
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
      ?auto_15301 - HOIST
      ?auto_15304 - PLACE
      ?auto_15302 - PLACE
      ?auto_15305 - HOIST
      ?auto_15306 - SURFACE
      ?auto_15311 - PLACE
      ?auto_15314 - HOIST
      ?auto_15315 - SURFACE
      ?auto_15310 - PLACE
      ?auto_15312 - HOIST
      ?auto_15313 - SURFACE
      ?auto_15309 - PLACE
      ?auto_15308 - HOIST
      ?auto_15307 - SURFACE
      ?auto_15303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15301 ?auto_15304 ) ( IS-CRATE ?auto_15300 ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( HOIST-AT ?auto_15305 ?auto_15302 ) ( AVAILABLE ?auto_15305 ) ( SURFACE-AT ?auto_15300 ?auto_15302 ) ( ON ?auto_15300 ?auto_15306 ) ( CLEAR ?auto_15300 ) ( not ( = ?auto_15299 ?auto_15300 ) ) ( not ( = ?auto_15299 ?auto_15306 ) ) ( not ( = ?auto_15300 ?auto_15306 ) ) ( not ( = ?auto_15301 ?auto_15305 ) ) ( IS-CRATE ?auto_15299 ) ( not ( = ?auto_15311 ?auto_15304 ) ) ( HOIST-AT ?auto_15314 ?auto_15311 ) ( AVAILABLE ?auto_15314 ) ( SURFACE-AT ?auto_15299 ?auto_15311 ) ( ON ?auto_15299 ?auto_15315 ) ( CLEAR ?auto_15299 ) ( not ( = ?auto_15298 ?auto_15299 ) ) ( not ( = ?auto_15298 ?auto_15315 ) ) ( not ( = ?auto_15299 ?auto_15315 ) ) ( not ( = ?auto_15301 ?auto_15314 ) ) ( IS-CRATE ?auto_15298 ) ( not ( = ?auto_15310 ?auto_15304 ) ) ( HOIST-AT ?auto_15312 ?auto_15310 ) ( AVAILABLE ?auto_15312 ) ( SURFACE-AT ?auto_15298 ?auto_15310 ) ( ON ?auto_15298 ?auto_15313 ) ( CLEAR ?auto_15298 ) ( not ( = ?auto_15297 ?auto_15298 ) ) ( not ( = ?auto_15297 ?auto_15313 ) ) ( not ( = ?auto_15298 ?auto_15313 ) ) ( not ( = ?auto_15301 ?auto_15312 ) ) ( SURFACE-AT ?auto_15296 ?auto_15304 ) ( CLEAR ?auto_15296 ) ( IS-CRATE ?auto_15297 ) ( AVAILABLE ?auto_15301 ) ( not ( = ?auto_15309 ?auto_15304 ) ) ( HOIST-AT ?auto_15308 ?auto_15309 ) ( AVAILABLE ?auto_15308 ) ( SURFACE-AT ?auto_15297 ?auto_15309 ) ( ON ?auto_15297 ?auto_15307 ) ( CLEAR ?auto_15297 ) ( TRUCK-AT ?auto_15303 ?auto_15304 ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15307 ) ) ( not ( = ?auto_15297 ?auto_15307 ) ) ( not ( = ?auto_15301 ?auto_15308 ) ) ( not ( = ?auto_15296 ?auto_15298 ) ) ( not ( = ?auto_15296 ?auto_15313 ) ) ( not ( = ?auto_15298 ?auto_15307 ) ) ( not ( = ?auto_15310 ?auto_15309 ) ) ( not ( = ?auto_15312 ?auto_15308 ) ) ( not ( = ?auto_15313 ?auto_15307 ) ) ( not ( = ?auto_15296 ?auto_15299 ) ) ( not ( = ?auto_15296 ?auto_15315 ) ) ( not ( = ?auto_15297 ?auto_15299 ) ) ( not ( = ?auto_15297 ?auto_15315 ) ) ( not ( = ?auto_15299 ?auto_15313 ) ) ( not ( = ?auto_15299 ?auto_15307 ) ) ( not ( = ?auto_15311 ?auto_15310 ) ) ( not ( = ?auto_15311 ?auto_15309 ) ) ( not ( = ?auto_15314 ?auto_15312 ) ) ( not ( = ?auto_15314 ?auto_15308 ) ) ( not ( = ?auto_15315 ?auto_15313 ) ) ( not ( = ?auto_15315 ?auto_15307 ) ) ( not ( = ?auto_15296 ?auto_15300 ) ) ( not ( = ?auto_15296 ?auto_15306 ) ) ( not ( = ?auto_15297 ?auto_15300 ) ) ( not ( = ?auto_15297 ?auto_15306 ) ) ( not ( = ?auto_15298 ?auto_15300 ) ) ( not ( = ?auto_15298 ?auto_15306 ) ) ( not ( = ?auto_15300 ?auto_15315 ) ) ( not ( = ?auto_15300 ?auto_15313 ) ) ( not ( = ?auto_15300 ?auto_15307 ) ) ( not ( = ?auto_15302 ?auto_15311 ) ) ( not ( = ?auto_15302 ?auto_15310 ) ) ( not ( = ?auto_15302 ?auto_15309 ) ) ( not ( = ?auto_15305 ?auto_15314 ) ) ( not ( = ?auto_15305 ?auto_15312 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15306 ?auto_15315 ) ) ( not ( = ?auto_15306 ?auto_15313 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15296 ?auto_15297 ?auto_15298 ?auto_15299 )
      ( MAKE-1CRATE ?auto_15299 ?auto_15300 )
      ( MAKE-4CRATE-VERIFY ?auto_15296 ?auto_15297 ?auto_15298 ?auto_15299 ?auto_15300 ) )
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
      ?auto_15341 - PLACE
      ?auto_15340 - PLACE
      ?auto_15339 - HOIST
      ?auto_15338 - SURFACE
      ?auto_15346 - PLACE
      ?auto_15344 - HOIST
      ?auto_15353 - SURFACE
      ?auto_15351 - PLACE
      ?auto_15350 - HOIST
      ?auto_15345 - SURFACE
      ?auto_15348 - PLACE
      ?auto_15352 - HOIST
      ?auto_15349 - SURFACE
      ?auto_15347 - SURFACE
      ?auto_15343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15342 ?auto_15341 ) ( IS-CRATE ?auto_15337 ) ( not ( = ?auto_15340 ?auto_15341 ) ) ( HOIST-AT ?auto_15339 ?auto_15340 ) ( SURFACE-AT ?auto_15337 ?auto_15340 ) ( ON ?auto_15337 ?auto_15338 ) ( CLEAR ?auto_15337 ) ( not ( = ?auto_15336 ?auto_15337 ) ) ( not ( = ?auto_15336 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15342 ?auto_15339 ) ) ( IS-CRATE ?auto_15336 ) ( not ( = ?auto_15346 ?auto_15341 ) ) ( HOIST-AT ?auto_15344 ?auto_15346 ) ( AVAILABLE ?auto_15344 ) ( SURFACE-AT ?auto_15336 ?auto_15346 ) ( ON ?auto_15336 ?auto_15353 ) ( CLEAR ?auto_15336 ) ( not ( = ?auto_15335 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15353 ) ) ( not ( = ?auto_15336 ?auto_15353 ) ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( IS-CRATE ?auto_15335 ) ( not ( = ?auto_15351 ?auto_15341 ) ) ( HOIST-AT ?auto_15350 ?auto_15351 ) ( AVAILABLE ?auto_15350 ) ( SURFACE-AT ?auto_15335 ?auto_15351 ) ( ON ?auto_15335 ?auto_15345 ) ( CLEAR ?auto_15335 ) ( not ( = ?auto_15334 ?auto_15335 ) ) ( not ( = ?auto_15334 ?auto_15345 ) ) ( not ( = ?auto_15335 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15350 ) ) ( IS-CRATE ?auto_15334 ) ( not ( = ?auto_15348 ?auto_15341 ) ) ( HOIST-AT ?auto_15352 ?auto_15348 ) ( AVAILABLE ?auto_15352 ) ( SURFACE-AT ?auto_15334 ?auto_15348 ) ( ON ?auto_15334 ?auto_15349 ) ( CLEAR ?auto_15334 ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15349 ) ) ( not ( = ?auto_15334 ?auto_15349 ) ) ( not ( = ?auto_15342 ?auto_15352 ) ) ( SURFACE-AT ?auto_15332 ?auto_15341 ) ( CLEAR ?auto_15332 ) ( IS-CRATE ?auto_15333 ) ( AVAILABLE ?auto_15342 ) ( AVAILABLE ?auto_15339 ) ( SURFACE-AT ?auto_15333 ?auto_15340 ) ( ON ?auto_15333 ?auto_15347 ) ( CLEAR ?auto_15333 ) ( TRUCK-AT ?auto_15343 ?auto_15341 ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( not ( = ?auto_15332 ?auto_15347 ) ) ( not ( = ?auto_15333 ?auto_15347 ) ) ( not ( = ?auto_15332 ?auto_15334 ) ) ( not ( = ?auto_15332 ?auto_15349 ) ) ( not ( = ?auto_15334 ?auto_15347 ) ) ( not ( = ?auto_15348 ?auto_15340 ) ) ( not ( = ?auto_15352 ?auto_15339 ) ) ( not ( = ?auto_15349 ?auto_15347 ) ) ( not ( = ?auto_15332 ?auto_15335 ) ) ( not ( = ?auto_15332 ?auto_15345 ) ) ( not ( = ?auto_15333 ?auto_15335 ) ) ( not ( = ?auto_15333 ?auto_15345 ) ) ( not ( = ?auto_15335 ?auto_15349 ) ) ( not ( = ?auto_15335 ?auto_15347 ) ) ( not ( = ?auto_15351 ?auto_15348 ) ) ( not ( = ?auto_15351 ?auto_15340 ) ) ( not ( = ?auto_15350 ?auto_15352 ) ) ( not ( = ?auto_15350 ?auto_15339 ) ) ( not ( = ?auto_15345 ?auto_15349 ) ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15332 ?auto_15336 ) ) ( not ( = ?auto_15332 ?auto_15353 ) ) ( not ( = ?auto_15333 ?auto_15336 ) ) ( not ( = ?auto_15333 ?auto_15353 ) ) ( not ( = ?auto_15334 ?auto_15336 ) ) ( not ( = ?auto_15334 ?auto_15353 ) ) ( not ( = ?auto_15336 ?auto_15345 ) ) ( not ( = ?auto_15336 ?auto_15349 ) ) ( not ( = ?auto_15336 ?auto_15347 ) ) ( not ( = ?auto_15346 ?auto_15351 ) ) ( not ( = ?auto_15346 ?auto_15348 ) ) ( not ( = ?auto_15346 ?auto_15340 ) ) ( not ( = ?auto_15344 ?auto_15350 ) ) ( not ( = ?auto_15344 ?auto_15352 ) ) ( not ( = ?auto_15344 ?auto_15339 ) ) ( not ( = ?auto_15353 ?auto_15345 ) ) ( not ( = ?auto_15353 ?auto_15349 ) ) ( not ( = ?auto_15353 ?auto_15347 ) ) ( not ( = ?auto_15332 ?auto_15337 ) ) ( not ( = ?auto_15332 ?auto_15338 ) ) ( not ( = ?auto_15333 ?auto_15337 ) ) ( not ( = ?auto_15333 ?auto_15338 ) ) ( not ( = ?auto_15334 ?auto_15337 ) ) ( not ( = ?auto_15334 ?auto_15338 ) ) ( not ( = ?auto_15335 ?auto_15337 ) ) ( not ( = ?auto_15335 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15353 ) ) ( not ( = ?auto_15337 ?auto_15345 ) ) ( not ( = ?auto_15337 ?auto_15349 ) ) ( not ( = ?auto_15337 ?auto_15347 ) ) ( not ( = ?auto_15338 ?auto_15353 ) ) ( not ( = ?auto_15338 ?auto_15345 ) ) ( not ( = ?auto_15338 ?auto_15349 ) ) ( not ( = ?auto_15338 ?auto_15347 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15332 ?auto_15333 ?auto_15334 ?auto_15335 ?auto_15336 )
      ( MAKE-1CRATE ?auto_15336 ?auto_15337 )
      ( MAKE-5CRATE-VERIFY ?auto_15332 ?auto_15333 ?auto_15334 ?auto_15335 ?auto_15336 ?auto_15337 ) )
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
      ?auto_15383 - HOIST
      ?auto_15382 - PLACE
      ?auto_15380 - PLACE
      ?auto_15381 - HOIST
      ?auto_15379 - SURFACE
      ?auto_15388 - PLACE
      ?auto_15393 - HOIST
      ?auto_15387 - SURFACE
      ?auto_15384 - PLACE
      ?auto_15396 - HOIST
      ?auto_15389 - SURFACE
      ?auto_15395 - PLACE
      ?auto_15392 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15391 - PLACE
      ?auto_15386 - HOIST
      ?auto_15394 - SURFACE
      ?auto_15390 - SURFACE
      ?auto_15378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15383 ?auto_15382 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15380 ?auto_15382 ) ) ( HOIST-AT ?auto_15381 ?auto_15380 ) ( AVAILABLE ?auto_15381 ) ( SURFACE-AT ?auto_15377 ?auto_15380 ) ( ON ?auto_15377 ?auto_15379 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15379 ) ) ( not ( = ?auto_15377 ?auto_15379 ) ) ( not ( = ?auto_15383 ?auto_15381 ) ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15388 ?auto_15382 ) ) ( HOIST-AT ?auto_15393 ?auto_15388 ) ( SURFACE-AT ?auto_15376 ?auto_15388 ) ( ON ?auto_15376 ?auto_15387 ) ( CLEAR ?auto_15376 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15387 ) ) ( not ( = ?auto_15376 ?auto_15387 ) ) ( not ( = ?auto_15383 ?auto_15393 ) ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15384 ?auto_15382 ) ) ( HOIST-AT ?auto_15396 ?auto_15384 ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15375 ?auto_15384 ) ( ON ?auto_15375 ?auto_15389 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15389 ) ) ( not ( = ?auto_15375 ?auto_15389 ) ) ( not ( = ?auto_15383 ?auto_15396 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15395 ?auto_15382 ) ) ( HOIST-AT ?auto_15392 ?auto_15395 ) ( AVAILABLE ?auto_15392 ) ( SURFACE-AT ?auto_15374 ?auto_15395 ) ( ON ?auto_15374 ?auto_15385 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15385 ) ) ( not ( = ?auto_15374 ?auto_15385 ) ) ( not ( = ?auto_15383 ?auto_15392 ) ) ( IS-CRATE ?auto_15373 ) ( not ( = ?auto_15391 ?auto_15382 ) ) ( HOIST-AT ?auto_15386 ?auto_15391 ) ( AVAILABLE ?auto_15386 ) ( SURFACE-AT ?auto_15373 ?auto_15391 ) ( ON ?auto_15373 ?auto_15394 ) ( CLEAR ?auto_15373 ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15394 ) ) ( not ( = ?auto_15373 ?auto_15394 ) ) ( not ( = ?auto_15383 ?auto_15386 ) ) ( SURFACE-AT ?auto_15371 ?auto_15382 ) ( CLEAR ?auto_15371 ) ( IS-CRATE ?auto_15372 ) ( AVAILABLE ?auto_15383 ) ( AVAILABLE ?auto_15393 ) ( SURFACE-AT ?auto_15372 ?auto_15388 ) ( ON ?auto_15372 ?auto_15390 ) ( CLEAR ?auto_15372 ) ( TRUCK-AT ?auto_15378 ?auto_15382 ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15390 ) ) ( not ( = ?auto_15372 ?auto_15390 ) ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15394 ) ) ( not ( = ?auto_15373 ?auto_15390 ) ) ( not ( = ?auto_15391 ?auto_15388 ) ) ( not ( = ?auto_15386 ?auto_15393 ) ) ( not ( = ?auto_15394 ?auto_15390 ) ) ( not ( = ?auto_15371 ?auto_15374 ) ) ( not ( = ?auto_15371 ?auto_15385 ) ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15385 ) ) ( not ( = ?auto_15374 ?auto_15394 ) ) ( not ( = ?auto_15374 ?auto_15390 ) ) ( not ( = ?auto_15395 ?auto_15391 ) ) ( not ( = ?auto_15395 ?auto_15388 ) ) ( not ( = ?auto_15392 ?auto_15386 ) ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15385 ?auto_15394 ) ) ( not ( = ?auto_15385 ?auto_15390 ) ) ( not ( = ?auto_15371 ?auto_15375 ) ) ( not ( = ?auto_15371 ?auto_15389 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15389 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15389 ) ) ( not ( = ?auto_15375 ?auto_15385 ) ) ( not ( = ?auto_15375 ?auto_15394 ) ) ( not ( = ?auto_15375 ?auto_15390 ) ) ( not ( = ?auto_15384 ?auto_15395 ) ) ( not ( = ?auto_15384 ?auto_15391 ) ) ( not ( = ?auto_15384 ?auto_15388 ) ) ( not ( = ?auto_15396 ?auto_15392 ) ) ( not ( = ?auto_15396 ?auto_15386 ) ) ( not ( = ?auto_15396 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15385 ) ) ( not ( = ?auto_15389 ?auto_15394 ) ) ( not ( = ?auto_15389 ?auto_15390 ) ) ( not ( = ?auto_15371 ?auto_15376 ) ) ( not ( = ?auto_15371 ?auto_15387 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15387 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15387 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15387 ) ) ( not ( = ?auto_15376 ?auto_15389 ) ) ( not ( = ?auto_15376 ?auto_15385 ) ) ( not ( = ?auto_15376 ?auto_15394 ) ) ( not ( = ?auto_15376 ?auto_15390 ) ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15385 ) ) ( not ( = ?auto_15387 ?auto_15394 ) ) ( not ( = ?auto_15387 ?auto_15390 ) ) ( not ( = ?auto_15371 ?auto_15377 ) ) ( not ( = ?auto_15371 ?auto_15379 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15372 ?auto_15379 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) ( not ( = ?auto_15373 ?auto_15379 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15379 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15379 ) ) ( not ( = ?auto_15377 ?auto_15387 ) ) ( not ( = ?auto_15377 ?auto_15389 ) ) ( not ( = ?auto_15377 ?auto_15385 ) ) ( not ( = ?auto_15377 ?auto_15394 ) ) ( not ( = ?auto_15377 ?auto_15390 ) ) ( not ( = ?auto_15380 ?auto_15388 ) ) ( not ( = ?auto_15380 ?auto_15384 ) ) ( not ( = ?auto_15380 ?auto_15395 ) ) ( not ( = ?auto_15380 ?auto_15391 ) ) ( not ( = ?auto_15381 ?auto_15393 ) ) ( not ( = ?auto_15381 ?auto_15396 ) ) ( not ( = ?auto_15381 ?auto_15392 ) ) ( not ( = ?auto_15381 ?auto_15386 ) ) ( not ( = ?auto_15379 ?auto_15387 ) ) ( not ( = ?auto_15379 ?auto_15389 ) ) ( not ( = ?auto_15379 ?auto_15385 ) ) ( not ( = ?auto_15379 ?auto_15394 ) ) ( not ( = ?auto_15379 ?auto_15390 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15371 ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 )
      ( MAKE-1CRATE ?auto_15376 ?auto_15377 )
      ( MAKE-6CRATE-VERIFY ?auto_15371 ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ) )
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
      ?auto_15421 - SURFACE
      ?auto_15422 - SURFACE
    )
    :vars
    (
      ?auto_15426 - HOIST
      ?auto_15425 - PLACE
      ?auto_15428 - PLACE
      ?auto_15423 - HOIST
      ?auto_15424 - SURFACE
      ?auto_15444 - PLACE
      ?auto_15435 - HOIST
      ?auto_15429 - SURFACE
      ?auto_15440 - PLACE
      ?auto_15438 - HOIST
      ?auto_15431 - SURFACE
      ?auto_15434 - PLACE
      ?auto_15433 - HOIST
      ?auto_15430 - SURFACE
      ?auto_15443 - PLACE
      ?auto_15441 - HOIST
      ?auto_15437 - SURFACE
      ?auto_15436 - PLACE
      ?auto_15439 - HOIST
      ?auto_15432 - SURFACE
      ?auto_15442 - SURFACE
      ?auto_15427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15426 ?auto_15425 ) ( IS-CRATE ?auto_15422 ) ( not ( = ?auto_15428 ?auto_15425 ) ) ( HOIST-AT ?auto_15423 ?auto_15428 ) ( AVAILABLE ?auto_15423 ) ( SURFACE-AT ?auto_15422 ?auto_15428 ) ( ON ?auto_15422 ?auto_15424 ) ( CLEAR ?auto_15422 ) ( not ( = ?auto_15421 ?auto_15422 ) ) ( not ( = ?auto_15421 ?auto_15424 ) ) ( not ( = ?auto_15422 ?auto_15424 ) ) ( not ( = ?auto_15426 ?auto_15423 ) ) ( IS-CRATE ?auto_15421 ) ( not ( = ?auto_15444 ?auto_15425 ) ) ( HOIST-AT ?auto_15435 ?auto_15444 ) ( AVAILABLE ?auto_15435 ) ( SURFACE-AT ?auto_15421 ?auto_15444 ) ( ON ?auto_15421 ?auto_15429 ) ( CLEAR ?auto_15421 ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15429 ) ) ( not ( = ?auto_15421 ?auto_15429 ) ) ( not ( = ?auto_15426 ?auto_15435 ) ) ( IS-CRATE ?auto_15420 ) ( not ( = ?auto_15440 ?auto_15425 ) ) ( HOIST-AT ?auto_15438 ?auto_15440 ) ( SURFACE-AT ?auto_15420 ?auto_15440 ) ( ON ?auto_15420 ?auto_15431 ) ( CLEAR ?auto_15420 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15431 ) ) ( not ( = ?auto_15420 ?auto_15431 ) ) ( not ( = ?auto_15426 ?auto_15438 ) ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15434 ?auto_15425 ) ) ( HOIST-AT ?auto_15433 ?auto_15434 ) ( AVAILABLE ?auto_15433 ) ( SURFACE-AT ?auto_15419 ?auto_15434 ) ( ON ?auto_15419 ?auto_15430 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15430 ) ) ( not ( = ?auto_15419 ?auto_15430 ) ) ( not ( = ?auto_15426 ?auto_15433 ) ) ( IS-CRATE ?auto_15418 ) ( not ( = ?auto_15443 ?auto_15425 ) ) ( HOIST-AT ?auto_15441 ?auto_15443 ) ( AVAILABLE ?auto_15441 ) ( SURFACE-AT ?auto_15418 ?auto_15443 ) ( ON ?auto_15418 ?auto_15437 ) ( CLEAR ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15437 ) ) ( not ( = ?auto_15418 ?auto_15437 ) ) ( not ( = ?auto_15426 ?auto_15441 ) ) ( IS-CRATE ?auto_15417 ) ( not ( = ?auto_15436 ?auto_15425 ) ) ( HOIST-AT ?auto_15439 ?auto_15436 ) ( AVAILABLE ?auto_15439 ) ( SURFACE-AT ?auto_15417 ?auto_15436 ) ( ON ?auto_15417 ?auto_15432 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15432 ) ) ( not ( = ?auto_15417 ?auto_15432 ) ) ( not ( = ?auto_15426 ?auto_15439 ) ) ( SURFACE-AT ?auto_15415 ?auto_15425 ) ( CLEAR ?auto_15415 ) ( IS-CRATE ?auto_15416 ) ( AVAILABLE ?auto_15426 ) ( AVAILABLE ?auto_15438 ) ( SURFACE-AT ?auto_15416 ?auto_15440 ) ( ON ?auto_15416 ?auto_15442 ) ( CLEAR ?auto_15416 ) ( TRUCK-AT ?auto_15427 ?auto_15425 ) ( not ( = ?auto_15415 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15442 ) ) ( not ( = ?auto_15416 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15432 ) ) ( not ( = ?auto_15417 ?auto_15442 ) ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15438 ) ) ( not ( = ?auto_15432 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15437 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15437 ) ) ( not ( = ?auto_15418 ?auto_15432 ) ) ( not ( = ?auto_15418 ?auto_15442 ) ) ( not ( = ?auto_15443 ?auto_15436 ) ) ( not ( = ?auto_15443 ?auto_15440 ) ) ( not ( = ?auto_15441 ?auto_15439 ) ) ( not ( = ?auto_15441 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15432 ) ) ( not ( = ?auto_15437 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15415 ?auto_15430 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15416 ?auto_15430 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15430 ) ) ( not ( = ?auto_15419 ?auto_15437 ) ) ( not ( = ?auto_15419 ?auto_15432 ) ) ( not ( = ?auto_15419 ?auto_15442 ) ) ( not ( = ?auto_15434 ?auto_15443 ) ) ( not ( = ?auto_15434 ?auto_15436 ) ) ( not ( = ?auto_15434 ?auto_15440 ) ) ( not ( = ?auto_15433 ?auto_15441 ) ) ( not ( = ?auto_15433 ?auto_15439 ) ) ( not ( = ?auto_15433 ?auto_15438 ) ) ( not ( = ?auto_15430 ?auto_15437 ) ) ( not ( = ?auto_15430 ?auto_15432 ) ) ( not ( = ?auto_15430 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15420 ) ) ( not ( = ?auto_15415 ?auto_15431 ) ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( not ( = ?auto_15416 ?auto_15431 ) ) ( not ( = ?auto_15417 ?auto_15420 ) ) ( not ( = ?auto_15417 ?auto_15431 ) ) ( not ( = ?auto_15418 ?auto_15420 ) ) ( not ( = ?auto_15418 ?auto_15431 ) ) ( not ( = ?auto_15420 ?auto_15430 ) ) ( not ( = ?auto_15420 ?auto_15437 ) ) ( not ( = ?auto_15420 ?auto_15432 ) ) ( not ( = ?auto_15420 ?auto_15442 ) ) ( not ( = ?auto_15431 ?auto_15430 ) ) ( not ( = ?auto_15431 ?auto_15437 ) ) ( not ( = ?auto_15431 ?auto_15432 ) ) ( not ( = ?auto_15431 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15421 ) ) ( not ( = ?auto_15415 ?auto_15429 ) ) ( not ( = ?auto_15416 ?auto_15421 ) ) ( not ( = ?auto_15416 ?auto_15429 ) ) ( not ( = ?auto_15417 ?auto_15421 ) ) ( not ( = ?auto_15417 ?auto_15429 ) ) ( not ( = ?auto_15418 ?auto_15421 ) ) ( not ( = ?auto_15418 ?auto_15429 ) ) ( not ( = ?auto_15419 ?auto_15421 ) ) ( not ( = ?auto_15419 ?auto_15429 ) ) ( not ( = ?auto_15421 ?auto_15431 ) ) ( not ( = ?auto_15421 ?auto_15430 ) ) ( not ( = ?auto_15421 ?auto_15437 ) ) ( not ( = ?auto_15421 ?auto_15432 ) ) ( not ( = ?auto_15421 ?auto_15442 ) ) ( not ( = ?auto_15444 ?auto_15440 ) ) ( not ( = ?auto_15444 ?auto_15434 ) ) ( not ( = ?auto_15444 ?auto_15443 ) ) ( not ( = ?auto_15444 ?auto_15436 ) ) ( not ( = ?auto_15435 ?auto_15438 ) ) ( not ( = ?auto_15435 ?auto_15433 ) ) ( not ( = ?auto_15435 ?auto_15441 ) ) ( not ( = ?auto_15435 ?auto_15439 ) ) ( not ( = ?auto_15429 ?auto_15431 ) ) ( not ( = ?auto_15429 ?auto_15430 ) ) ( not ( = ?auto_15429 ?auto_15437 ) ) ( not ( = ?auto_15429 ?auto_15432 ) ) ( not ( = ?auto_15429 ?auto_15442 ) ) ( not ( = ?auto_15415 ?auto_15422 ) ) ( not ( = ?auto_15415 ?auto_15424 ) ) ( not ( = ?auto_15416 ?auto_15422 ) ) ( not ( = ?auto_15416 ?auto_15424 ) ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( not ( = ?auto_15417 ?auto_15424 ) ) ( not ( = ?auto_15418 ?auto_15422 ) ) ( not ( = ?auto_15418 ?auto_15424 ) ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15424 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15424 ) ) ( not ( = ?auto_15422 ?auto_15429 ) ) ( not ( = ?auto_15422 ?auto_15431 ) ) ( not ( = ?auto_15422 ?auto_15430 ) ) ( not ( = ?auto_15422 ?auto_15437 ) ) ( not ( = ?auto_15422 ?auto_15432 ) ) ( not ( = ?auto_15422 ?auto_15442 ) ) ( not ( = ?auto_15428 ?auto_15444 ) ) ( not ( = ?auto_15428 ?auto_15440 ) ) ( not ( = ?auto_15428 ?auto_15434 ) ) ( not ( = ?auto_15428 ?auto_15443 ) ) ( not ( = ?auto_15428 ?auto_15436 ) ) ( not ( = ?auto_15423 ?auto_15435 ) ) ( not ( = ?auto_15423 ?auto_15438 ) ) ( not ( = ?auto_15423 ?auto_15433 ) ) ( not ( = ?auto_15423 ?auto_15441 ) ) ( not ( = ?auto_15423 ?auto_15439 ) ) ( not ( = ?auto_15424 ?auto_15429 ) ) ( not ( = ?auto_15424 ?auto_15431 ) ) ( not ( = ?auto_15424 ?auto_15430 ) ) ( not ( = ?auto_15424 ?auto_15437 ) ) ( not ( = ?auto_15424 ?auto_15432 ) ) ( not ( = ?auto_15424 ?auto_15442 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ?auto_15420 ?auto_15421 )
      ( MAKE-1CRATE ?auto_15421 ?auto_15422 )
      ( MAKE-7CRATE-VERIFY ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ?auto_15420 ?auto_15421 ?auto_15422 ) )
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
      ?auto_15470 - SURFACE
      ?auto_15471 - SURFACE
      ?auto_15472 - SURFACE
    )
    :vars
    (
      ?auto_15476 - HOIST
      ?auto_15474 - PLACE
      ?auto_15478 - PLACE
      ?auto_15477 - HOIST
      ?auto_15473 - SURFACE
      ?auto_15491 - PLACE
      ?auto_15483 - HOIST
      ?auto_15495 - SURFACE
      ?auto_15486 - PLACE
      ?auto_15493 - HOIST
      ?auto_15492 - SURFACE
      ?auto_15480 - PLACE
      ?auto_15487 - HOIST
      ?auto_15489 - SURFACE
      ?auto_15481 - PLACE
      ?auto_15496 - HOIST
      ?auto_15497 - SURFACE
      ?auto_15488 - PLACE
      ?auto_15482 - HOIST
      ?auto_15485 - SURFACE
      ?auto_15490 - PLACE
      ?auto_15494 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15479 - SURFACE
      ?auto_15475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15476 ?auto_15474 ) ( IS-CRATE ?auto_15472 ) ( not ( = ?auto_15478 ?auto_15474 ) ) ( HOIST-AT ?auto_15477 ?auto_15478 ) ( AVAILABLE ?auto_15477 ) ( SURFACE-AT ?auto_15472 ?auto_15478 ) ( ON ?auto_15472 ?auto_15473 ) ( CLEAR ?auto_15472 ) ( not ( = ?auto_15471 ?auto_15472 ) ) ( not ( = ?auto_15471 ?auto_15473 ) ) ( not ( = ?auto_15472 ?auto_15473 ) ) ( not ( = ?auto_15476 ?auto_15477 ) ) ( IS-CRATE ?auto_15471 ) ( not ( = ?auto_15491 ?auto_15474 ) ) ( HOIST-AT ?auto_15483 ?auto_15491 ) ( AVAILABLE ?auto_15483 ) ( SURFACE-AT ?auto_15471 ?auto_15491 ) ( ON ?auto_15471 ?auto_15495 ) ( CLEAR ?auto_15471 ) ( not ( = ?auto_15470 ?auto_15471 ) ) ( not ( = ?auto_15470 ?auto_15495 ) ) ( not ( = ?auto_15471 ?auto_15495 ) ) ( not ( = ?auto_15476 ?auto_15483 ) ) ( IS-CRATE ?auto_15470 ) ( not ( = ?auto_15486 ?auto_15474 ) ) ( HOIST-AT ?auto_15493 ?auto_15486 ) ( AVAILABLE ?auto_15493 ) ( SURFACE-AT ?auto_15470 ?auto_15486 ) ( ON ?auto_15470 ?auto_15492 ) ( CLEAR ?auto_15470 ) ( not ( = ?auto_15469 ?auto_15470 ) ) ( not ( = ?auto_15469 ?auto_15492 ) ) ( not ( = ?auto_15470 ?auto_15492 ) ) ( not ( = ?auto_15476 ?auto_15493 ) ) ( IS-CRATE ?auto_15469 ) ( not ( = ?auto_15480 ?auto_15474 ) ) ( HOIST-AT ?auto_15487 ?auto_15480 ) ( SURFACE-AT ?auto_15469 ?auto_15480 ) ( ON ?auto_15469 ?auto_15489 ) ( CLEAR ?auto_15469 ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15489 ) ) ( not ( = ?auto_15469 ?auto_15489 ) ) ( not ( = ?auto_15476 ?auto_15487 ) ) ( IS-CRATE ?auto_15468 ) ( not ( = ?auto_15481 ?auto_15474 ) ) ( HOIST-AT ?auto_15496 ?auto_15481 ) ( AVAILABLE ?auto_15496 ) ( SURFACE-AT ?auto_15468 ?auto_15481 ) ( ON ?auto_15468 ?auto_15497 ) ( CLEAR ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15497 ) ) ( not ( = ?auto_15468 ?auto_15497 ) ) ( not ( = ?auto_15476 ?auto_15496 ) ) ( IS-CRATE ?auto_15467 ) ( not ( = ?auto_15488 ?auto_15474 ) ) ( HOIST-AT ?auto_15482 ?auto_15488 ) ( AVAILABLE ?auto_15482 ) ( SURFACE-AT ?auto_15467 ?auto_15488 ) ( ON ?auto_15467 ?auto_15485 ) ( CLEAR ?auto_15467 ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15485 ) ) ( not ( = ?auto_15467 ?auto_15485 ) ) ( not ( = ?auto_15476 ?auto_15482 ) ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15490 ?auto_15474 ) ) ( HOIST-AT ?auto_15494 ?auto_15490 ) ( AVAILABLE ?auto_15494 ) ( SURFACE-AT ?auto_15466 ?auto_15490 ) ( ON ?auto_15466 ?auto_15484 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15465 ?auto_15484 ) ) ( not ( = ?auto_15466 ?auto_15484 ) ) ( not ( = ?auto_15476 ?auto_15494 ) ) ( SURFACE-AT ?auto_15464 ?auto_15474 ) ( CLEAR ?auto_15464 ) ( IS-CRATE ?auto_15465 ) ( AVAILABLE ?auto_15476 ) ( AVAILABLE ?auto_15487 ) ( SURFACE-AT ?auto_15465 ?auto_15480 ) ( ON ?auto_15465 ?auto_15479 ) ( CLEAR ?auto_15465 ) ( TRUCK-AT ?auto_15475 ?auto_15474 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15464 ?auto_15479 ) ) ( not ( = ?auto_15465 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15464 ?auto_15484 ) ) ( not ( = ?auto_15466 ?auto_15479 ) ) ( not ( = ?auto_15490 ?auto_15480 ) ) ( not ( = ?auto_15494 ?auto_15487 ) ) ( not ( = ?auto_15484 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15464 ?auto_15485 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15485 ) ) ( not ( = ?auto_15467 ?auto_15484 ) ) ( not ( = ?auto_15467 ?auto_15479 ) ) ( not ( = ?auto_15488 ?auto_15490 ) ) ( not ( = ?auto_15488 ?auto_15480 ) ) ( not ( = ?auto_15482 ?auto_15494 ) ) ( not ( = ?auto_15482 ?auto_15487 ) ) ( not ( = ?auto_15485 ?auto_15484 ) ) ( not ( = ?auto_15485 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15468 ) ) ( not ( = ?auto_15464 ?auto_15497 ) ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( not ( = ?auto_15465 ?auto_15497 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15497 ) ) ( not ( = ?auto_15468 ?auto_15485 ) ) ( not ( = ?auto_15468 ?auto_15484 ) ) ( not ( = ?auto_15468 ?auto_15479 ) ) ( not ( = ?auto_15481 ?auto_15488 ) ) ( not ( = ?auto_15481 ?auto_15490 ) ) ( not ( = ?auto_15481 ?auto_15480 ) ) ( not ( = ?auto_15496 ?auto_15482 ) ) ( not ( = ?auto_15496 ?auto_15494 ) ) ( not ( = ?auto_15496 ?auto_15487 ) ) ( not ( = ?auto_15497 ?auto_15485 ) ) ( not ( = ?auto_15497 ?auto_15484 ) ) ( not ( = ?auto_15497 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15469 ) ) ( not ( = ?auto_15464 ?auto_15489 ) ) ( not ( = ?auto_15465 ?auto_15469 ) ) ( not ( = ?auto_15465 ?auto_15489 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15489 ) ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15467 ?auto_15489 ) ) ( not ( = ?auto_15469 ?auto_15497 ) ) ( not ( = ?auto_15469 ?auto_15485 ) ) ( not ( = ?auto_15469 ?auto_15484 ) ) ( not ( = ?auto_15469 ?auto_15479 ) ) ( not ( = ?auto_15489 ?auto_15497 ) ) ( not ( = ?auto_15489 ?auto_15485 ) ) ( not ( = ?auto_15489 ?auto_15484 ) ) ( not ( = ?auto_15489 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15470 ) ) ( not ( = ?auto_15464 ?auto_15492 ) ) ( not ( = ?auto_15465 ?auto_15470 ) ) ( not ( = ?auto_15465 ?auto_15492 ) ) ( not ( = ?auto_15466 ?auto_15470 ) ) ( not ( = ?auto_15466 ?auto_15492 ) ) ( not ( = ?auto_15467 ?auto_15470 ) ) ( not ( = ?auto_15467 ?auto_15492 ) ) ( not ( = ?auto_15468 ?auto_15470 ) ) ( not ( = ?auto_15468 ?auto_15492 ) ) ( not ( = ?auto_15470 ?auto_15489 ) ) ( not ( = ?auto_15470 ?auto_15497 ) ) ( not ( = ?auto_15470 ?auto_15485 ) ) ( not ( = ?auto_15470 ?auto_15484 ) ) ( not ( = ?auto_15470 ?auto_15479 ) ) ( not ( = ?auto_15486 ?auto_15480 ) ) ( not ( = ?auto_15486 ?auto_15481 ) ) ( not ( = ?auto_15486 ?auto_15488 ) ) ( not ( = ?auto_15486 ?auto_15490 ) ) ( not ( = ?auto_15493 ?auto_15487 ) ) ( not ( = ?auto_15493 ?auto_15496 ) ) ( not ( = ?auto_15493 ?auto_15482 ) ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15492 ?auto_15489 ) ) ( not ( = ?auto_15492 ?auto_15497 ) ) ( not ( = ?auto_15492 ?auto_15485 ) ) ( not ( = ?auto_15492 ?auto_15484 ) ) ( not ( = ?auto_15492 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15471 ) ) ( not ( = ?auto_15464 ?auto_15495 ) ) ( not ( = ?auto_15465 ?auto_15471 ) ) ( not ( = ?auto_15465 ?auto_15495 ) ) ( not ( = ?auto_15466 ?auto_15471 ) ) ( not ( = ?auto_15466 ?auto_15495 ) ) ( not ( = ?auto_15467 ?auto_15471 ) ) ( not ( = ?auto_15467 ?auto_15495 ) ) ( not ( = ?auto_15468 ?auto_15471 ) ) ( not ( = ?auto_15468 ?auto_15495 ) ) ( not ( = ?auto_15469 ?auto_15471 ) ) ( not ( = ?auto_15469 ?auto_15495 ) ) ( not ( = ?auto_15471 ?auto_15492 ) ) ( not ( = ?auto_15471 ?auto_15489 ) ) ( not ( = ?auto_15471 ?auto_15497 ) ) ( not ( = ?auto_15471 ?auto_15485 ) ) ( not ( = ?auto_15471 ?auto_15484 ) ) ( not ( = ?auto_15471 ?auto_15479 ) ) ( not ( = ?auto_15491 ?auto_15486 ) ) ( not ( = ?auto_15491 ?auto_15480 ) ) ( not ( = ?auto_15491 ?auto_15481 ) ) ( not ( = ?auto_15491 ?auto_15488 ) ) ( not ( = ?auto_15491 ?auto_15490 ) ) ( not ( = ?auto_15483 ?auto_15493 ) ) ( not ( = ?auto_15483 ?auto_15487 ) ) ( not ( = ?auto_15483 ?auto_15496 ) ) ( not ( = ?auto_15483 ?auto_15482 ) ) ( not ( = ?auto_15483 ?auto_15494 ) ) ( not ( = ?auto_15495 ?auto_15492 ) ) ( not ( = ?auto_15495 ?auto_15489 ) ) ( not ( = ?auto_15495 ?auto_15497 ) ) ( not ( = ?auto_15495 ?auto_15485 ) ) ( not ( = ?auto_15495 ?auto_15484 ) ) ( not ( = ?auto_15495 ?auto_15479 ) ) ( not ( = ?auto_15464 ?auto_15472 ) ) ( not ( = ?auto_15464 ?auto_15473 ) ) ( not ( = ?auto_15465 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15473 ) ) ( not ( = ?auto_15466 ?auto_15472 ) ) ( not ( = ?auto_15466 ?auto_15473 ) ) ( not ( = ?auto_15467 ?auto_15472 ) ) ( not ( = ?auto_15467 ?auto_15473 ) ) ( not ( = ?auto_15468 ?auto_15472 ) ) ( not ( = ?auto_15468 ?auto_15473 ) ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15469 ?auto_15473 ) ) ( not ( = ?auto_15470 ?auto_15472 ) ) ( not ( = ?auto_15470 ?auto_15473 ) ) ( not ( = ?auto_15472 ?auto_15495 ) ) ( not ( = ?auto_15472 ?auto_15492 ) ) ( not ( = ?auto_15472 ?auto_15489 ) ) ( not ( = ?auto_15472 ?auto_15497 ) ) ( not ( = ?auto_15472 ?auto_15485 ) ) ( not ( = ?auto_15472 ?auto_15484 ) ) ( not ( = ?auto_15472 ?auto_15479 ) ) ( not ( = ?auto_15478 ?auto_15491 ) ) ( not ( = ?auto_15478 ?auto_15486 ) ) ( not ( = ?auto_15478 ?auto_15480 ) ) ( not ( = ?auto_15478 ?auto_15481 ) ) ( not ( = ?auto_15478 ?auto_15488 ) ) ( not ( = ?auto_15478 ?auto_15490 ) ) ( not ( = ?auto_15477 ?auto_15483 ) ) ( not ( = ?auto_15477 ?auto_15493 ) ) ( not ( = ?auto_15477 ?auto_15487 ) ) ( not ( = ?auto_15477 ?auto_15496 ) ) ( not ( = ?auto_15477 ?auto_15482 ) ) ( not ( = ?auto_15477 ?auto_15494 ) ) ( not ( = ?auto_15473 ?auto_15495 ) ) ( not ( = ?auto_15473 ?auto_15492 ) ) ( not ( = ?auto_15473 ?auto_15489 ) ) ( not ( = ?auto_15473 ?auto_15497 ) ) ( not ( = ?auto_15473 ?auto_15485 ) ) ( not ( = ?auto_15473 ?auto_15484 ) ) ( not ( = ?auto_15473 ?auto_15479 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ?auto_15469 ?auto_15470 ?auto_15471 )
      ( MAKE-1CRATE ?auto_15471 ?auto_15472 )
      ( MAKE-8CRATE-VERIFY ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ?auto_15469 ?auto_15470 ?auto_15471 ?auto_15472 ) )
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
      ?auto_15524 - SURFACE
      ?auto_15525 - SURFACE
      ?auto_15526 - SURFACE
      ?auto_15527 - SURFACE
    )
    :vars
    (
      ?auto_15529 - HOIST
      ?auto_15533 - PLACE
      ?auto_15531 - PLACE
      ?auto_15532 - HOIST
      ?auto_15528 - SURFACE
      ?auto_15534 - PLACE
      ?auto_15542 - HOIST
      ?auto_15535 - SURFACE
      ?auto_15540 - PLACE
      ?auto_15548 - HOIST
      ?auto_15536 - SURFACE
      ?auto_15541 - PLACE
      ?auto_15550 - HOIST
      ?auto_15553 - SURFACE
      ?auto_15549 - PLACE
      ?auto_15537 - HOIST
      ?auto_15539 - SURFACE
      ?auto_15546 - PLACE
      ?auto_15547 - HOIST
      ?auto_15538 - SURFACE
      ?auto_15551 - SURFACE
      ?auto_15552 - PLACE
      ?auto_15544 - HOIST
      ?auto_15543 - SURFACE
      ?auto_15545 - SURFACE
      ?auto_15530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15529 ?auto_15533 ) ( IS-CRATE ?auto_15527 ) ( not ( = ?auto_15531 ?auto_15533 ) ) ( HOIST-AT ?auto_15532 ?auto_15531 ) ( SURFACE-AT ?auto_15527 ?auto_15531 ) ( ON ?auto_15527 ?auto_15528 ) ( CLEAR ?auto_15527 ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( not ( = ?auto_15529 ?auto_15532 ) ) ( IS-CRATE ?auto_15526 ) ( not ( = ?auto_15534 ?auto_15533 ) ) ( HOIST-AT ?auto_15542 ?auto_15534 ) ( AVAILABLE ?auto_15542 ) ( SURFACE-AT ?auto_15526 ?auto_15534 ) ( ON ?auto_15526 ?auto_15535 ) ( CLEAR ?auto_15526 ) ( not ( = ?auto_15525 ?auto_15526 ) ) ( not ( = ?auto_15525 ?auto_15535 ) ) ( not ( = ?auto_15526 ?auto_15535 ) ) ( not ( = ?auto_15529 ?auto_15542 ) ) ( IS-CRATE ?auto_15525 ) ( not ( = ?auto_15540 ?auto_15533 ) ) ( HOIST-AT ?auto_15548 ?auto_15540 ) ( AVAILABLE ?auto_15548 ) ( SURFACE-AT ?auto_15525 ?auto_15540 ) ( ON ?auto_15525 ?auto_15536 ) ( CLEAR ?auto_15525 ) ( not ( = ?auto_15524 ?auto_15525 ) ) ( not ( = ?auto_15524 ?auto_15536 ) ) ( not ( = ?auto_15525 ?auto_15536 ) ) ( not ( = ?auto_15529 ?auto_15548 ) ) ( IS-CRATE ?auto_15524 ) ( not ( = ?auto_15541 ?auto_15533 ) ) ( HOIST-AT ?auto_15550 ?auto_15541 ) ( AVAILABLE ?auto_15550 ) ( SURFACE-AT ?auto_15524 ?auto_15541 ) ( ON ?auto_15524 ?auto_15553 ) ( CLEAR ?auto_15524 ) ( not ( = ?auto_15523 ?auto_15524 ) ) ( not ( = ?auto_15523 ?auto_15553 ) ) ( not ( = ?auto_15524 ?auto_15553 ) ) ( not ( = ?auto_15529 ?auto_15550 ) ) ( IS-CRATE ?auto_15523 ) ( not ( = ?auto_15549 ?auto_15533 ) ) ( HOIST-AT ?auto_15537 ?auto_15549 ) ( SURFACE-AT ?auto_15523 ?auto_15549 ) ( ON ?auto_15523 ?auto_15539 ) ( CLEAR ?auto_15523 ) ( not ( = ?auto_15522 ?auto_15523 ) ) ( not ( = ?auto_15522 ?auto_15539 ) ) ( not ( = ?auto_15523 ?auto_15539 ) ) ( not ( = ?auto_15529 ?auto_15537 ) ) ( IS-CRATE ?auto_15522 ) ( not ( = ?auto_15546 ?auto_15533 ) ) ( HOIST-AT ?auto_15547 ?auto_15546 ) ( AVAILABLE ?auto_15547 ) ( SURFACE-AT ?auto_15522 ?auto_15546 ) ( ON ?auto_15522 ?auto_15538 ) ( CLEAR ?auto_15522 ) ( not ( = ?auto_15521 ?auto_15522 ) ) ( not ( = ?auto_15521 ?auto_15538 ) ) ( not ( = ?auto_15522 ?auto_15538 ) ) ( not ( = ?auto_15529 ?auto_15547 ) ) ( IS-CRATE ?auto_15521 ) ( AVAILABLE ?auto_15532 ) ( SURFACE-AT ?auto_15521 ?auto_15531 ) ( ON ?auto_15521 ?auto_15551 ) ( CLEAR ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15520 ?auto_15551 ) ) ( not ( = ?auto_15521 ?auto_15551 ) ) ( IS-CRATE ?auto_15520 ) ( not ( = ?auto_15552 ?auto_15533 ) ) ( HOIST-AT ?auto_15544 ?auto_15552 ) ( AVAILABLE ?auto_15544 ) ( SURFACE-AT ?auto_15520 ?auto_15552 ) ( ON ?auto_15520 ?auto_15543 ) ( CLEAR ?auto_15520 ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15543 ) ) ( not ( = ?auto_15520 ?auto_15543 ) ) ( not ( = ?auto_15529 ?auto_15544 ) ) ( SURFACE-AT ?auto_15518 ?auto_15533 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15519 ) ( AVAILABLE ?auto_15529 ) ( AVAILABLE ?auto_15537 ) ( SURFACE-AT ?auto_15519 ?auto_15549 ) ( ON ?auto_15519 ?auto_15545 ) ( CLEAR ?auto_15519 ) ( TRUCK-AT ?auto_15530 ?auto_15533 ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15545 ) ) ( not ( = ?auto_15519 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15543 ) ) ( not ( = ?auto_15520 ?auto_15545 ) ) ( not ( = ?auto_15552 ?auto_15549 ) ) ( not ( = ?auto_15544 ?auto_15537 ) ) ( not ( = ?auto_15543 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15518 ?auto_15551 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15551 ) ) ( not ( = ?auto_15521 ?auto_15543 ) ) ( not ( = ?auto_15521 ?auto_15545 ) ) ( not ( = ?auto_15531 ?auto_15552 ) ) ( not ( = ?auto_15531 ?auto_15549 ) ) ( not ( = ?auto_15532 ?auto_15544 ) ) ( not ( = ?auto_15532 ?auto_15537 ) ) ( not ( = ?auto_15551 ?auto_15543 ) ) ( not ( = ?auto_15551 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15522 ) ) ( not ( = ?auto_15518 ?auto_15538 ) ) ( not ( = ?auto_15519 ?auto_15522 ) ) ( not ( = ?auto_15519 ?auto_15538 ) ) ( not ( = ?auto_15520 ?auto_15522 ) ) ( not ( = ?auto_15520 ?auto_15538 ) ) ( not ( = ?auto_15522 ?auto_15551 ) ) ( not ( = ?auto_15522 ?auto_15543 ) ) ( not ( = ?auto_15522 ?auto_15545 ) ) ( not ( = ?auto_15546 ?auto_15531 ) ) ( not ( = ?auto_15546 ?auto_15552 ) ) ( not ( = ?auto_15546 ?auto_15549 ) ) ( not ( = ?auto_15547 ?auto_15532 ) ) ( not ( = ?auto_15547 ?auto_15544 ) ) ( not ( = ?auto_15547 ?auto_15537 ) ) ( not ( = ?auto_15538 ?auto_15551 ) ) ( not ( = ?auto_15538 ?auto_15543 ) ) ( not ( = ?auto_15538 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15523 ) ) ( not ( = ?auto_15518 ?auto_15539 ) ) ( not ( = ?auto_15519 ?auto_15523 ) ) ( not ( = ?auto_15519 ?auto_15539 ) ) ( not ( = ?auto_15520 ?auto_15523 ) ) ( not ( = ?auto_15520 ?auto_15539 ) ) ( not ( = ?auto_15521 ?auto_15523 ) ) ( not ( = ?auto_15521 ?auto_15539 ) ) ( not ( = ?auto_15523 ?auto_15538 ) ) ( not ( = ?auto_15523 ?auto_15551 ) ) ( not ( = ?auto_15523 ?auto_15543 ) ) ( not ( = ?auto_15523 ?auto_15545 ) ) ( not ( = ?auto_15539 ?auto_15538 ) ) ( not ( = ?auto_15539 ?auto_15551 ) ) ( not ( = ?auto_15539 ?auto_15543 ) ) ( not ( = ?auto_15539 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15524 ) ) ( not ( = ?auto_15518 ?auto_15553 ) ) ( not ( = ?auto_15519 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15553 ) ) ( not ( = ?auto_15520 ?auto_15524 ) ) ( not ( = ?auto_15520 ?auto_15553 ) ) ( not ( = ?auto_15521 ?auto_15524 ) ) ( not ( = ?auto_15521 ?auto_15553 ) ) ( not ( = ?auto_15522 ?auto_15524 ) ) ( not ( = ?auto_15522 ?auto_15553 ) ) ( not ( = ?auto_15524 ?auto_15539 ) ) ( not ( = ?auto_15524 ?auto_15538 ) ) ( not ( = ?auto_15524 ?auto_15551 ) ) ( not ( = ?auto_15524 ?auto_15543 ) ) ( not ( = ?auto_15524 ?auto_15545 ) ) ( not ( = ?auto_15541 ?auto_15549 ) ) ( not ( = ?auto_15541 ?auto_15546 ) ) ( not ( = ?auto_15541 ?auto_15531 ) ) ( not ( = ?auto_15541 ?auto_15552 ) ) ( not ( = ?auto_15550 ?auto_15537 ) ) ( not ( = ?auto_15550 ?auto_15547 ) ) ( not ( = ?auto_15550 ?auto_15532 ) ) ( not ( = ?auto_15550 ?auto_15544 ) ) ( not ( = ?auto_15553 ?auto_15539 ) ) ( not ( = ?auto_15553 ?auto_15538 ) ) ( not ( = ?auto_15553 ?auto_15551 ) ) ( not ( = ?auto_15553 ?auto_15543 ) ) ( not ( = ?auto_15553 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15536 ) ) ( not ( = ?auto_15519 ?auto_15525 ) ) ( not ( = ?auto_15519 ?auto_15536 ) ) ( not ( = ?auto_15520 ?auto_15525 ) ) ( not ( = ?auto_15520 ?auto_15536 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15536 ) ) ( not ( = ?auto_15522 ?auto_15525 ) ) ( not ( = ?auto_15522 ?auto_15536 ) ) ( not ( = ?auto_15523 ?auto_15525 ) ) ( not ( = ?auto_15523 ?auto_15536 ) ) ( not ( = ?auto_15525 ?auto_15553 ) ) ( not ( = ?auto_15525 ?auto_15539 ) ) ( not ( = ?auto_15525 ?auto_15538 ) ) ( not ( = ?auto_15525 ?auto_15551 ) ) ( not ( = ?auto_15525 ?auto_15543 ) ) ( not ( = ?auto_15525 ?auto_15545 ) ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( not ( = ?auto_15540 ?auto_15549 ) ) ( not ( = ?auto_15540 ?auto_15546 ) ) ( not ( = ?auto_15540 ?auto_15531 ) ) ( not ( = ?auto_15540 ?auto_15552 ) ) ( not ( = ?auto_15548 ?auto_15550 ) ) ( not ( = ?auto_15548 ?auto_15537 ) ) ( not ( = ?auto_15548 ?auto_15547 ) ) ( not ( = ?auto_15548 ?auto_15532 ) ) ( not ( = ?auto_15548 ?auto_15544 ) ) ( not ( = ?auto_15536 ?auto_15553 ) ) ( not ( = ?auto_15536 ?auto_15539 ) ) ( not ( = ?auto_15536 ?auto_15538 ) ) ( not ( = ?auto_15536 ?auto_15551 ) ) ( not ( = ?auto_15536 ?auto_15543 ) ) ( not ( = ?auto_15536 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15526 ) ) ( not ( = ?auto_15518 ?auto_15535 ) ) ( not ( = ?auto_15519 ?auto_15526 ) ) ( not ( = ?auto_15519 ?auto_15535 ) ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15535 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15521 ?auto_15535 ) ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15522 ?auto_15535 ) ) ( not ( = ?auto_15523 ?auto_15526 ) ) ( not ( = ?auto_15523 ?auto_15535 ) ) ( not ( = ?auto_15524 ?auto_15526 ) ) ( not ( = ?auto_15524 ?auto_15535 ) ) ( not ( = ?auto_15526 ?auto_15536 ) ) ( not ( = ?auto_15526 ?auto_15553 ) ) ( not ( = ?auto_15526 ?auto_15539 ) ) ( not ( = ?auto_15526 ?auto_15538 ) ) ( not ( = ?auto_15526 ?auto_15551 ) ) ( not ( = ?auto_15526 ?auto_15543 ) ) ( not ( = ?auto_15526 ?auto_15545 ) ) ( not ( = ?auto_15534 ?auto_15540 ) ) ( not ( = ?auto_15534 ?auto_15541 ) ) ( not ( = ?auto_15534 ?auto_15549 ) ) ( not ( = ?auto_15534 ?auto_15546 ) ) ( not ( = ?auto_15534 ?auto_15531 ) ) ( not ( = ?auto_15534 ?auto_15552 ) ) ( not ( = ?auto_15542 ?auto_15548 ) ) ( not ( = ?auto_15542 ?auto_15550 ) ) ( not ( = ?auto_15542 ?auto_15537 ) ) ( not ( = ?auto_15542 ?auto_15547 ) ) ( not ( = ?auto_15542 ?auto_15532 ) ) ( not ( = ?auto_15542 ?auto_15544 ) ) ( not ( = ?auto_15535 ?auto_15536 ) ) ( not ( = ?auto_15535 ?auto_15553 ) ) ( not ( = ?auto_15535 ?auto_15539 ) ) ( not ( = ?auto_15535 ?auto_15538 ) ) ( not ( = ?auto_15535 ?auto_15551 ) ) ( not ( = ?auto_15535 ?auto_15543 ) ) ( not ( = ?auto_15535 ?auto_15545 ) ) ( not ( = ?auto_15518 ?auto_15527 ) ) ( not ( = ?auto_15518 ?auto_15528 ) ) ( not ( = ?auto_15519 ?auto_15527 ) ) ( not ( = ?auto_15519 ?auto_15528 ) ) ( not ( = ?auto_15520 ?auto_15527 ) ) ( not ( = ?auto_15520 ?auto_15528 ) ) ( not ( = ?auto_15521 ?auto_15527 ) ) ( not ( = ?auto_15521 ?auto_15528 ) ) ( not ( = ?auto_15522 ?auto_15527 ) ) ( not ( = ?auto_15522 ?auto_15528 ) ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( not ( = ?auto_15523 ?auto_15528 ) ) ( not ( = ?auto_15524 ?auto_15527 ) ) ( not ( = ?auto_15524 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15527 ) ) ( not ( = ?auto_15525 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15536 ) ) ( not ( = ?auto_15527 ?auto_15553 ) ) ( not ( = ?auto_15527 ?auto_15539 ) ) ( not ( = ?auto_15527 ?auto_15538 ) ) ( not ( = ?auto_15527 ?auto_15551 ) ) ( not ( = ?auto_15527 ?auto_15543 ) ) ( not ( = ?auto_15527 ?auto_15545 ) ) ( not ( = ?auto_15528 ?auto_15535 ) ) ( not ( = ?auto_15528 ?auto_15536 ) ) ( not ( = ?auto_15528 ?auto_15553 ) ) ( not ( = ?auto_15528 ?auto_15539 ) ) ( not ( = ?auto_15528 ?auto_15538 ) ) ( not ( = ?auto_15528 ?auto_15551 ) ) ( not ( = ?auto_15528 ?auto_15543 ) ) ( not ( = ?auto_15528 ?auto_15545 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15518 ?auto_15519 ?auto_15520 ?auto_15521 ?auto_15522 ?auto_15523 ?auto_15524 ?auto_15525 ?auto_15526 )
      ( MAKE-1CRATE ?auto_15526 ?auto_15527 )
      ( MAKE-9CRATE-VERIFY ?auto_15518 ?auto_15519 ?auto_15520 ?auto_15521 ?auto_15522 ?auto_15523 ?auto_15524 ?auto_15525 ?auto_15526 ?auto_15527 ) )
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
      ?auto_15581 - SURFACE
      ?auto_15582 - SURFACE
      ?auto_15583 - SURFACE
      ?auto_15584 - SURFACE
      ?auto_15585 - SURFACE
    )
    :vars
    (
      ?auto_15586 - HOIST
      ?auto_15588 - PLACE
      ?auto_15589 - PLACE
      ?auto_15590 - HOIST
      ?auto_15591 - SURFACE
      ?auto_15610 - PLACE
      ?auto_15600 - HOIST
      ?auto_15595 - SURFACE
      ?auto_15609 - PLACE
      ?auto_15592 - HOIST
      ?auto_15612 - SURFACE
      ?auto_15606 - PLACE
      ?auto_15598 - HOIST
      ?auto_15599 - SURFACE
      ?auto_15594 - PLACE
      ?auto_15607 - HOIST
      ?auto_15601 - SURFACE
      ?auto_15603 - SURFACE
      ?auto_15596 - PLACE
      ?auto_15605 - HOIST
      ?auto_15593 - SURFACE
      ?auto_15608 - SURFACE
      ?auto_15604 - PLACE
      ?auto_15597 - HOIST
      ?auto_15611 - SURFACE
      ?auto_15602 - SURFACE
      ?auto_15587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15586 ?auto_15588 ) ( IS-CRATE ?auto_15585 ) ( not ( = ?auto_15589 ?auto_15588 ) ) ( HOIST-AT ?auto_15590 ?auto_15589 ) ( SURFACE-AT ?auto_15585 ?auto_15589 ) ( ON ?auto_15585 ?auto_15591 ) ( CLEAR ?auto_15585 ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15591 ) ) ( not ( = ?auto_15585 ?auto_15591 ) ) ( not ( = ?auto_15586 ?auto_15590 ) ) ( IS-CRATE ?auto_15584 ) ( not ( = ?auto_15610 ?auto_15588 ) ) ( HOIST-AT ?auto_15600 ?auto_15610 ) ( SURFACE-AT ?auto_15584 ?auto_15610 ) ( ON ?auto_15584 ?auto_15595 ) ( CLEAR ?auto_15584 ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15583 ?auto_15595 ) ) ( not ( = ?auto_15584 ?auto_15595 ) ) ( not ( = ?auto_15586 ?auto_15600 ) ) ( IS-CRATE ?auto_15583 ) ( not ( = ?auto_15609 ?auto_15588 ) ) ( HOIST-AT ?auto_15592 ?auto_15609 ) ( AVAILABLE ?auto_15592 ) ( SURFACE-AT ?auto_15583 ?auto_15609 ) ( ON ?auto_15583 ?auto_15612 ) ( CLEAR ?auto_15583 ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15612 ) ) ( not ( = ?auto_15583 ?auto_15612 ) ) ( not ( = ?auto_15586 ?auto_15592 ) ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15606 ?auto_15588 ) ) ( HOIST-AT ?auto_15598 ?auto_15606 ) ( AVAILABLE ?auto_15598 ) ( SURFACE-AT ?auto_15582 ?auto_15606 ) ( ON ?auto_15582 ?auto_15599 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15599 ) ) ( not ( = ?auto_15582 ?auto_15599 ) ) ( not ( = ?auto_15586 ?auto_15598 ) ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15594 ?auto_15588 ) ) ( HOIST-AT ?auto_15607 ?auto_15594 ) ( AVAILABLE ?auto_15607 ) ( SURFACE-AT ?auto_15581 ?auto_15594 ) ( ON ?auto_15581 ?auto_15601 ) ( CLEAR ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15601 ) ) ( not ( = ?auto_15581 ?auto_15601 ) ) ( not ( = ?auto_15586 ?auto_15607 ) ) ( IS-CRATE ?auto_15580 ) ( SURFACE-AT ?auto_15580 ?auto_15589 ) ( ON ?auto_15580 ?auto_15603 ) ( CLEAR ?auto_15580 ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15603 ) ) ( not ( = ?auto_15580 ?auto_15603 ) ) ( IS-CRATE ?auto_15579 ) ( not ( = ?auto_15596 ?auto_15588 ) ) ( HOIST-AT ?auto_15605 ?auto_15596 ) ( AVAILABLE ?auto_15605 ) ( SURFACE-AT ?auto_15579 ?auto_15596 ) ( ON ?auto_15579 ?auto_15593 ) ( CLEAR ?auto_15579 ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15593 ) ) ( not ( = ?auto_15579 ?auto_15593 ) ) ( not ( = ?auto_15586 ?auto_15605 ) ) ( IS-CRATE ?auto_15578 ) ( AVAILABLE ?auto_15600 ) ( SURFACE-AT ?auto_15578 ?auto_15610 ) ( ON ?auto_15578 ?auto_15608 ) ( CLEAR ?auto_15578 ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15608 ) ) ( not ( = ?auto_15578 ?auto_15608 ) ) ( IS-CRATE ?auto_15577 ) ( not ( = ?auto_15604 ?auto_15588 ) ) ( HOIST-AT ?auto_15597 ?auto_15604 ) ( AVAILABLE ?auto_15597 ) ( SURFACE-AT ?auto_15577 ?auto_15604 ) ( ON ?auto_15577 ?auto_15611 ) ( CLEAR ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15611 ) ) ( not ( = ?auto_15577 ?auto_15611 ) ) ( not ( = ?auto_15586 ?auto_15597 ) ) ( SURFACE-AT ?auto_15575 ?auto_15588 ) ( CLEAR ?auto_15575 ) ( IS-CRATE ?auto_15576 ) ( AVAILABLE ?auto_15586 ) ( AVAILABLE ?auto_15590 ) ( SURFACE-AT ?auto_15576 ?auto_15589 ) ( ON ?auto_15576 ?auto_15602 ) ( CLEAR ?auto_15576 ) ( TRUCK-AT ?auto_15587 ?auto_15588 ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15602 ) ) ( not ( = ?auto_15576 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15577 ) ) ( not ( = ?auto_15575 ?auto_15611 ) ) ( not ( = ?auto_15577 ?auto_15602 ) ) ( not ( = ?auto_15604 ?auto_15589 ) ) ( not ( = ?auto_15597 ?auto_15590 ) ) ( not ( = ?auto_15611 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15578 ) ) ( not ( = ?auto_15575 ?auto_15608 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15576 ?auto_15608 ) ) ( not ( = ?auto_15578 ?auto_15611 ) ) ( not ( = ?auto_15578 ?auto_15602 ) ) ( not ( = ?auto_15610 ?auto_15604 ) ) ( not ( = ?auto_15610 ?auto_15589 ) ) ( not ( = ?auto_15600 ?auto_15597 ) ) ( not ( = ?auto_15600 ?auto_15590 ) ) ( not ( = ?auto_15608 ?auto_15611 ) ) ( not ( = ?auto_15608 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( not ( = ?auto_15575 ?auto_15593 ) ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15576 ?auto_15593 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15593 ) ) ( not ( = ?auto_15579 ?auto_15608 ) ) ( not ( = ?auto_15579 ?auto_15611 ) ) ( not ( = ?auto_15579 ?auto_15602 ) ) ( not ( = ?auto_15596 ?auto_15610 ) ) ( not ( = ?auto_15596 ?auto_15604 ) ) ( not ( = ?auto_15596 ?auto_15589 ) ) ( not ( = ?auto_15605 ?auto_15600 ) ) ( not ( = ?auto_15605 ?auto_15597 ) ) ( not ( = ?auto_15605 ?auto_15590 ) ) ( not ( = ?auto_15593 ?auto_15608 ) ) ( not ( = ?auto_15593 ?auto_15611 ) ) ( not ( = ?auto_15593 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15580 ) ) ( not ( = ?auto_15575 ?auto_15603 ) ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15576 ?auto_15603 ) ) ( not ( = ?auto_15577 ?auto_15580 ) ) ( not ( = ?auto_15577 ?auto_15603 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15603 ) ) ( not ( = ?auto_15580 ?auto_15593 ) ) ( not ( = ?auto_15580 ?auto_15608 ) ) ( not ( = ?auto_15580 ?auto_15611 ) ) ( not ( = ?auto_15580 ?auto_15602 ) ) ( not ( = ?auto_15603 ?auto_15593 ) ) ( not ( = ?auto_15603 ?auto_15608 ) ) ( not ( = ?auto_15603 ?auto_15611 ) ) ( not ( = ?auto_15603 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15581 ) ) ( not ( = ?auto_15575 ?auto_15601 ) ) ( not ( = ?auto_15576 ?auto_15581 ) ) ( not ( = ?auto_15576 ?auto_15601 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( not ( = ?auto_15577 ?auto_15601 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15601 ) ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15579 ?auto_15601 ) ) ( not ( = ?auto_15581 ?auto_15603 ) ) ( not ( = ?auto_15581 ?auto_15593 ) ) ( not ( = ?auto_15581 ?auto_15608 ) ) ( not ( = ?auto_15581 ?auto_15611 ) ) ( not ( = ?auto_15581 ?auto_15602 ) ) ( not ( = ?auto_15594 ?auto_15589 ) ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15594 ?auto_15610 ) ) ( not ( = ?auto_15594 ?auto_15604 ) ) ( not ( = ?auto_15607 ?auto_15590 ) ) ( not ( = ?auto_15607 ?auto_15605 ) ) ( not ( = ?auto_15607 ?auto_15600 ) ) ( not ( = ?auto_15607 ?auto_15597 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15593 ) ) ( not ( = ?auto_15601 ?auto_15608 ) ) ( not ( = ?auto_15601 ?auto_15611 ) ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15582 ) ) ( not ( = ?auto_15575 ?auto_15599 ) ) ( not ( = ?auto_15576 ?auto_15582 ) ) ( not ( = ?auto_15576 ?auto_15599 ) ) ( not ( = ?auto_15577 ?auto_15582 ) ) ( not ( = ?auto_15577 ?auto_15599 ) ) ( not ( = ?auto_15578 ?auto_15582 ) ) ( not ( = ?auto_15578 ?auto_15599 ) ) ( not ( = ?auto_15579 ?auto_15582 ) ) ( not ( = ?auto_15579 ?auto_15599 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15599 ) ) ( not ( = ?auto_15582 ?auto_15601 ) ) ( not ( = ?auto_15582 ?auto_15603 ) ) ( not ( = ?auto_15582 ?auto_15593 ) ) ( not ( = ?auto_15582 ?auto_15608 ) ) ( not ( = ?auto_15582 ?auto_15611 ) ) ( not ( = ?auto_15582 ?auto_15602 ) ) ( not ( = ?auto_15606 ?auto_15594 ) ) ( not ( = ?auto_15606 ?auto_15589 ) ) ( not ( = ?auto_15606 ?auto_15596 ) ) ( not ( = ?auto_15606 ?auto_15610 ) ) ( not ( = ?auto_15606 ?auto_15604 ) ) ( not ( = ?auto_15598 ?auto_15607 ) ) ( not ( = ?auto_15598 ?auto_15590 ) ) ( not ( = ?auto_15598 ?auto_15605 ) ) ( not ( = ?auto_15598 ?auto_15600 ) ) ( not ( = ?auto_15598 ?auto_15597 ) ) ( not ( = ?auto_15599 ?auto_15601 ) ) ( not ( = ?auto_15599 ?auto_15603 ) ) ( not ( = ?auto_15599 ?auto_15593 ) ) ( not ( = ?auto_15599 ?auto_15608 ) ) ( not ( = ?auto_15599 ?auto_15611 ) ) ( not ( = ?auto_15599 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15583 ) ) ( not ( = ?auto_15575 ?auto_15612 ) ) ( not ( = ?auto_15576 ?auto_15583 ) ) ( not ( = ?auto_15576 ?auto_15612 ) ) ( not ( = ?auto_15577 ?auto_15583 ) ) ( not ( = ?auto_15577 ?auto_15612 ) ) ( not ( = ?auto_15578 ?auto_15583 ) ) ( not ( = ?auto_15578 ?auto_15612 ) ) ( not ( = ?auto_15579 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15612 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15612 ) ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15612 ) ) ( not ( = ?auto_15583 ?auto_15599 ) ) ( not ( = ?auto_15583 ?auto_15601 ) ) ( not ( = ?auto_15583 ?auto_15603 ) ) ( not ( = ?auto_15583 ?auto_15593 ) ) ( not ( = ?auto_15583 ?auto_15608 ) ) ( not ( = ?auto_15583 ?auto_15611 ) ) ( not ( = ?auto_15583 ?auto_15602 ) ) ( not ( = ?auto_15609 ?auto_15606 ) ) ( not ( = ?auto_15609 ?auto_15594 ) ) ( not ( = ?auto_15609 ?auto_15589 ) ) ( not ( = ?auto_15609 ?auto_15596 ) ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15604 ) ) ( not ( = ?auto_15592 ?auto_15598 ) ) ( not ( = ?auto_15592 ?auto_15607 ) ) ( not ( = ?auto_15592 ?auto_15590 ) ) ( not ( = ?auto_15592 ?auto_15605 ) ) ( not ( = ?auto_15592 ?auto_15600 ) ) ( not ( = ?auto_15592 ?auto_15597 ) ) ( not ( = ?auto_15612 ?auto_15599 ) ) ( not ( = ?auto_15612 ?auto_15601 ) ) ( not ( = ?auto_15612 ?auto_15603 ) ) ( not ( = ?auto_15612 ?auto_15593 ) ) ( not ( = ?auto_15612 ?auto_15608 ) ) ( not ( = ?auto_15612 ?auto_15611 ) ) ( not ( = ?auto_15612 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15584 ) ) ( not ( = ?auto_15575 ?auto_15595 ) ) ( not ( = ?auto_15576 ?auto_15584 ) ) ( not ( = ?auto_15576 ?auto_15595 ) ) ( not ( = ?auto_15577 ?auto_15584 ) ) ( not ( = ?auto_15577 ?auto_15595 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15595 ) ) ( not ( = ?auto_15579 ?auto_15584 ) ) ( not ( = ?auto_15579 ?auto_15595 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15595 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15595 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15595 ) ) ( not ( = ?auto_15584 ?auto_15612 ) ) ( not ( = ?auto_15584 ?auto_15599 ) ) ( not ( = ?auto_15584 ?auto_15601 ) ) ( not ( = ?auto_15584 ?auto_15603 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15608 ) ) ( not ( = ?auto_15584 ?auto_15611 ) ) ( not ( = ?auto_15584 ?auto_15602 ) ) ( not ( = ?auto_15595 ?auto_15612 ) ) ( not ( = ?auto_15595 ?auto_15599 ) ) ( not ( = ?auto_15595 ?auto_15601 ) ) ( not ( = ?auto_15595 ?auto_15603 ) ) ( not ( = ?auto_15595 ?auto_15593 ) ) ( not ( = ?auto_15595 ?auto_15608 ) ) ( not ( = ?auto_15595 ?auto_15611 ) ) ( not ( = ?auto_15595 ?auto_15602 ) ) ( not ( = ?auto_15575 ?auto_15585 ) ) ( not ( = ?auto_15575 ?auto_15591 ) ) ( not ( = ?auto_15576 ?auto_15585 ) ) ( not ( = ?auto_15576 ?auto_15591 ) ) ( not ( = ?auto_15577 ?auto_15585 ) ) ( not ( = ?auto_15577 ?auto_15591 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15591 ) ) ( not ( = ?auto_15579 ?auto_15585 ) ) ( not ( = ?auto_15579 ?auto_15591 ) ) ( not ( = ?auto_15580 ?auto_15585 ) ) ( not ( = ?auto_15580 ?auto_15591 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) ( not ( = ?auto_15581 ?auto_15591 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15591 ) ) ( not ( = ?auto_15583 ?auto_15585 ) ) ( not ( = ?auto_15583 ?auto_15591 ) ) ( not ( = ?auto_15585 ?auto_15595 ) ) ( not ( = ?auto_15585 ?auto_15612 ) ) ( not ( = ?auto_15585 ?auto_15599 ) ) ( not ( = ?auto_15585 ?auto_15601 ) ) ( not ( = ?auto_15585 ?auto_15603 ) ) ( not ( = ?auto_15585 ?auto_15593 ) ) ( not ( = ?auto_15585 ?auto_15608 ) ) ( not ( = ?auto_15585 ?auto_15611 ) ) ( not ( = ?auto_15585 ?auto_15602 ) ) ( not ( = ?auto_15591 ?auto_15595 ) ) ( not ( = ?auto_15591 ?auto_15612 ) ) ( not ( = ?auto_15591 ?auto_15599 ) ) ( not ( = ?auto_15591 ?auto_15601 ) ) ( not ( = ?auto_15591 ?auto_15603 ) ) ( not ( = ?auto_15591 ?auto_15593 ) ) ( not ( = ?auto_15591 ?auto_15608 ) ) ( not ( = ?auto_15591 ?auto_15611 ) ) ( not ( = ?auto_15591 ?auto_15602 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 ?auto_15580 ?auto_15581 ?auto_15582 ?auto_15583 ?auto_15584 )
      ( MAKE-1CRATE ?auto_15584 ?auto_15585 )
      ( MAKE-10CRATE-VERIFY ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 ?auto_15580 ?auto_15581 ?auto_15582 ?auto_15583 ?auto_15584 ?auto_15585 ) )
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
      ?auto_15641 - SURFACE
      ?auto_15642 - SURFACE
      ?auto_15643 - SURFACE
      ?auto_15644 - SURFACE
      ?auto_15645 - SURFACE
      ?auto_15646 - SURFACE
    )
    :vars
    (
      ?auto_15649 - HOIST
      ?auto_15652 - PLACE
      ?auto_15651 - PLACE
      ?auto_15647 - HOIST
      ?auto_15650 - SURFACE
      ?auto_15660 - PLACE
      ?auto_15659 - HOIST
      ?auto_15671 - SURFACE
      ?auto_15654 - PLACE
      ?auto_15656 - HOIST
      ?auto_15670 - SURFACE
      ?auto_15655 - PLACE
      ?auto_15674 - HOIST
      ?auto_15675 - SURFACE
      ?auto_15657 - PLACE
      ?auto_15666 - HOIST
      ?auto_15669 - SURFACE
      ?auto_15673 - PLACE
      ?auto_15665 - HOIST
      ?auto_15672 - SURFACE
      ?auto_15653 - SURFACE
      ?auto_15663 - PLACE
      ?auto_15667 - HOIST
      ?auto_15668 - SURFACE
      ?auto_15676 - SURFACE
      ?auto_15664 - PLACE
      ?auto_15661 - HOIST
      ?auto_15662 - SURFACE
      ?auto_15658 - SURFACE
      ?auto_15648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15649 ?auto_15652 ) ( IS-CRATE ?auto_15646 ) ( not ( = ?auto_15651 ?auto_15652 ) ) ( HOIST-AT ?auto_15647 ?auto_15651 ) ( AVAILABLE ?auto_15647 ) ( SURFACE-AT ?auto_15646 ?auto_15651 ) ( ON ?auto_15646 ?auto_15650 ) ( CLEAR ?auto_15646 ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15650 ) ) ( not ( = ?auto_15646 ?auto_15650 ) ) ( not ( = ?auto_15649 ?auto_15647 ) ) ( IS-CRATE ?auto_15645 ) ( not ( = ?auto_15660 ?auto_15652 ) ) ( HOIST-AT ?auto_15659 ?auto_15660 ) ( SURFACE-AT ?auto_15645 ?auto_15660 ) ( ON ?auto_15645 ?auto_15671 ) ( CLEAR ?auto_15645 ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15671 ) ) ( not ( = ?auto_15645 ?auto_15671 ) ) ( not ( = ?auto_15649 ?auto_15659 ) ) ( IS-CRATE ?auto_15644 ) ( not ( = ?auto_15654 ?auto_15652 ) ) ( HOIST-AT ?auto_15656 ?auto_15654 ) ( SURFACE-AT ?auto_15644 ?auto_15654 ) ( ON ?auto_15644 ?auto_15670 ) ( CLEAR ?auto_15644 ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15670 ) ) ( not ( = ?auto_15644 ?auto_15670 ) ) ( not ( = ?auto_15649 ?auto_15656 ) ) ( IS-CRATE ?auto_15643 ) ( not ( = ?auto_15655 ?auto_15652 ) ) ( HOIST-AT ?auto_15674 ?auto_15655 ) ( AVAILABLE ?auto_15674 ) ( SURFACE-AT ?auto_15643 ?auto_15655 ) ( ON ?auto_15643 ?auto_15675 ) ( CLEAR ?auto_15643 ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15675 ) ) ( not ( = ?auto_15643 ?auto_15675 ) ) ( not ( = ?auto_15649 ?auto_15674 ) ) ( IS-CRATE ?auto_15642 ) ( not ( = ?auto_15657 ?auto_15652 ) ) ( HOIST-AT ?auto_15666 ?auto_15657 ) ( AVAILABLE ?auto_15666 ) ( SURFACE-AT ?auto_15642 ?auto_15657 ) ( ON ?auto_15642 ?auto_15669 ) ( CLEAR ?auto_15642 ) ( not ( = ?auto_15641 ?auto_15642 ) ) ( not ( = ?auto_15641 ?auto_15669 ) ) ( not ( = ?auto_15642 ?auto_15669 ) ) ( not ( = ?auto_15649 ?auto_15666 ) ) ( IS-CRATE ?auto_15641 ) ( not ( = ?auto_15673 ?auto_15652 ) ) ( HOIST-AT ?auto_15665 ?auto_15673 ) ( AVAILABLE ?auto_15665 ) ( SURFACE-AT ?auto_15641 ?auto_15673 ) ( ON ?auto_15641 ?auto_15672 ) ( CLEAR ?auto_15641 ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15672 ) ) ( not ( = ?auto_15641 ?auto_15672 ) ) ( not ( = ?auto_15649 ?auto_15665 ) ) ( IS-CRATE ?auto_15640 ) ( SURFACE-AT ?auto_15640 ?auto_15660 ) ( ON ?auto_15640 ?auto_15653 ) ( CLEAR ?auto_15640 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15653 ) ) ( not ( = ?auto_15640 ?auto_15653 ) ) ( IS-CRATE ?auto_15639 ) ( not ( = ?auto_15663 ?auto_15652 ) ) ( HOIST-AT ?auto_15667 ?auto_15663 ) ( AVAILABLE ?auto_15667 ) ( SURFACE-AT ?auto_15639 ?auto_15663 ) ( ON ?auto_15639 ?auto_15668 ) ( CLEAR ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15668 ) ) ( not ( = ?auto_15639 ?auto_15668 ) ) ( not ( = ?auto_15649 ?auto_15667 ) ) ( IS-CRATE ?auto_15638 ) ( AVAILABLE ?auto_15656 ) ( SURFACE-AT ?auto_15638 ?auto_15654 ) ( ON ?auto_15638 ?auto_15676 ) ( CLEAR ?auto_15638 ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( not ( = ?auto_15637 ?auto_15676 ) ) ( not ( = ?auto_15638 ?auto_15676 ) ) ( IS-CRATE ?auto_15637 ) ( not ( = ?auto_15664 ?auto_15652 ) ) ( HOIST-AT ?auto_15661 ?auto_15664 ) ( AVAILABLE ?auto_15661 ) ( SURFACE-AT ?auto_15637 ?auto_15664 ) ( ON ?auto_15637 ?auto_15662 ) ( CLEAR ?auto_15637 ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15662 ) ) ( not ( = ?auto_15637 ?auto_15662 ) ) ( not ( = ?auto_15649 ?auto_15661 ) ) ( SURFACE-AT ?auto_15635 ?auto_15652 ) ( CLEAR ?auto_15635 ) ( IS-CRATE ?auto_15636 ) ( AVAILABLE ?auto_15649 ) ( AVAILABLE ?auto_15659 ) ( SURFACE-AT ?auto_15636 ?auto_15660 ) ( ON ?auto_15636 ?auto_15658 ) ( CLEAR ?auto_15636 ) ( TRUCK-AT ?auto_15648 ?auto_15652 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15658 ) ) ( not ( = ?auto_15636 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15635 ?auto_15662 ) ) ( not ( = ?auto_15637 ?auto_15658 ) ) ( not ( = ?auto_15664 ?auto_15660 ) ) ( not ( = ?auto_15661 ?auto_15659 ) ) ( not ( = ?auto_15662 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15638 ) ) ( not ( = ?auto_15635 ?auto_15676 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15676 ) ) ( not ( = ?auto_15638 ?auto_15662 ) ) ( not ( = ?auto_15638 ?auto_15658 ) ) ( not ( = ?auto_15654 ?auto_15664 ) ) ( not ( = ?auto_15654 ?auto_15660 ) ) ( not ( = ?auto_15656 ?auto_15661 ) ) ( not ( = ?auto_15656 ?auto_15659 ) ) ( not ( = ?auto_15676 ?auto_15662 ) ) ( not ( = ?auto_15676 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15639 ) ) ( not ( = ?auto_15635 ?auto_15668 ) ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15636 ?auto_15668 ) ) ( not ( = ?auto_15637 ?auto_15639 ) ) ( not ( = ?auto_15637 ?auto_15668 ) ) ( not ( = ?auto_15639 ?auto_15676 ) ) ( not ( = ?auto_15639 ?auto_15662 ) ) ( not ( = ?auto_15639 ?auto_15658 ) ) ( not ( = ?auto_15663 ?auto_15654 ) ) ( not ( = ?auto_15663 ?auto_15664 ) ) ( not ( = ?auto_15663 ?auto_15660 ) ) ( not ( = ?auto_15667 ?auto_15656 ) ) ( not ( = ?auto_15667 ?auto_15661 ) ) ( not ( = ?auto_15667 ?auto_15659 ) ) ( not ( = ?auto_15668 ?auto_15676 ) ) ( not ( = ?auto_15668 ?auto_15662 ) ) ( not ( = ?auto_15668 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15640 ) ) ( not ( = ?auto_15635 ?auto_15653 ) ) ( not ( = ?auto_15636 ?auto_15640 ) ) ( not ( = ?auto_15636 ?auto_15653 ) ) ( not ( = ?auto_15637 ?auto_15640 ) ) ( not ( = ?auto_15637 ?auto_15653 ) ) ( not ( = ?auto_15638 ?auto_15640 ) ) ( not ( = ?auto_15638 ?auto_15653 ) ) ( not ( = ?auto_15640 ?auto_15668 ) ) ( not ( = ?auto_15640 ?auto_15676 ) ) ( not ( = ?auto_15640 ?auto_15662 ) ) ( not ( = ?auto_15640 ?auto_15658 ) ) ( not ( = ?auto_15653 ?auto_15668 ) ) ( not ( = ?auto_15653 ?auto_15676 ) ) ( not ( = ?auto_15653 ?auto_15662 ) ) ( not ( = ?auto_15653 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15641 ) ) ( not ( = ?auto_15635 ?auto_15672 ) ) ( not ( = ?auto_15636 ?auto_15641 ) ) ( not ( = ?auto_15636 ?auto_15672 ) ) ( not ( = ?auto_15637 ?auto_15641 ) ) ( not ( = ?auto_15637 ?auto_15672 ) ) ( not ( = ?auto_15638 ?auto_15641 ) ) ( not ( = ?auto_15638 ?auto_15672 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15639 ?auto_15672 ) ) ( not ( = ?auto_15641 ?auto_15653 ) ) ( not ( = ?auto_15641 ?auto_15668 ) ) ( not ( = ?auto_15641 ?auto_15676 ) ) ( not ( = ?auto_15641 ?auto_15662 ) ) ( not ( = ?auto_15641 ?auto_15658 ) ) ( not ( = ?auto_15673 ?auto_15660 ) ) ( not ( = ?auto_15673 ?auto_15663 ) ) ( not ( = ?auto_15673 ?auto_15654 ) ) ( not ( = ?auto_15673 ?auto_15664 ) ) ( not ( = ?auto_15665 ?auto_15659 ) ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15665 ?auto_15656 ) ) ( not ( = ?auto_15665 ?auto_15661 ) ) ( not ( = ?auto_15672 ?auto_15653 ) ) ( not ( = ?auto_15672 ?auto_15668 ) ) ( not ( = ?auto_15672 ?auto_15676 ) ) ( not ( = ?auto_15672 ?auto_15662 ) ) ( not ( = ?auto_15672 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15642 ) ) ( not ( = ?auto_15635 ?auto_15669 ) ) ( not ( = ?auto_15636 ?auto_15642 ) ) ( not ( = ?auto_15636 ?auto_15669 ) ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15637 ?auto_15669 ) ) ( not ( = ?auto_15638 ?auto_15642 ) ) ( not ( = ?auto_15638 ?auto_15669 ) ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15639 ?auto_15669 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15669 ) ) ( not ( = ?auto_15642 ?auto_15672 ) ) ( not ( = ?auto_15642 ?auto_15653 ) ) ( not ( = ?auto_15642 ?auto_15668 ) ) ( not ( = ?auto_15642 ?auto_15676 ) ) ( not ( = ?auto_15642 ?auto_15662 ) ) ( not ( = ?auto_15642 ?auto_15658 ) ) ( not ( = ?auto_15657 ?auto_15673 ) ) ( not ( = ?auto_15657 ?auto_15660 ) ) ( not ( = ?auto_15657 ?auto_15663 ) ) ( not ( = ?auto_15657 ?auto_15654 ) ) ( not ( = ?auto_15657 ?auto_15664 ) ) ( not ( = ?auto_15666 ?auto_15665 ) ) ( not ( = ?auto_15666 ?auto_15659 ) ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15656 ) ) ( not ( = ?auto_15666 ?auto_15661 ) ) ( not ( = ?auto_15669 ?auto_15672 ) ) ( not ( = ?auto_15669 ?auto_15653 ) ) ( not ( = ?auto_15669 ?auto_15668 ) ) ( not ( = ?auto_15669 ?auto_15676 ) ) ( not ( = ?auto_15669 ?auto_15662 ) ) ( not ( = ?auto_15669 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15635 ?auto_15675 ) ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( not ( = ?auto_15636 ?auto_15675 ) ) ( not ( = ?auto_15637 ?auto_15643 ) ) ( not ( = ?auto_15637 ?auto_15675 ) ) ( not ( = ?auto_15638 ?auto_15643 ) ) ( not ( = ?auto_15638 ?auto_15675 ) ) ( not ( = ?auto_15639 ?auto_15643 ) ) ( not ( = ?auto_15639 ?auto_15675 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15675 ) ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15641 ?auto_15675 ) ) ( not ( = ?auto_15643 ?auto_15669 ) ) ( not ( = ?auto_15643 ?auto_15672 ) ) ( not ( = ?auto_15643 ?auto_15653 ) ) ( not ( = ?auto_15643 ?auto_15668 ) ) ( not ( = ?auto_15643 ?auto_15676 ) ) ( not ( = ?auto_15643 ?auto_15662 ) ) ( not ( = ?auto_15643 ?auto_15658 ) ) ( not ( = ?auto_15655 ?auto_15657 ) ) ( not ( = ?auto_15655 ?auto_15673 ) ) ( not ( = ?auto_15655 ?auto_15660 ) ) ( not ( = ?auto_15655 ?auto_15663 ) ) ( not ( = ?auto_15655 ?auto_15654 ) ) ( not ( = ?auto_15655 ?auto_15664 ) ) ( not ( = ?auto_15674 ?auto_15666 ) ) ( not ( = ?auto_15674 ?auto_15665 ) ) ( not ( = ?auto_15674 ?auto_15659 ) ) ( not ( = ?auto_15674 ?auto_15667 ) ) ( not ( = ?auto_15674 ?auto_15656 ) ) ( not ( = ?auto_15674 ?auto_15661 ) ) ( not ( = ?auto_15675 ?auto_15669 ) ) ( not ( = ?auto_15675 ?auto_15672 ) ) ( not ( = ?auto_15675 ?auto_15653 ) ) ( not ( = ?auto_15675 ?auto_15668 ) ) ( not ( = ?auto_15675 ?auto_15676 ) ) ( not ( = ?auto_15675 ?auto_15662 ) ) ( not ( = ?auto_15675 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15644 ) ) ( not ( = ?auto_15635 ?auto_15670 ) ) ( not ( = ?auto_15636 ?auto_15644 ) ) ( not ( = ?auto_15636 ?auto_15670 ) ) ( not ( = ?auto_15637 ?auto_15644 ) ) ( not ( = ?auto_15637 ?auto_15670 ) ) ( not ( = ?auto_15638 ?auto_15644 ) ) ( not ( = ?auto_15638 ?auto_15670 ) ) ( not ( = ?auto_15639 ?auto_15644 ) ) ( not ( = ?auto_15639 ?auto_15670 ) ) ( not ( = ?auto_15640 ?auto_15644 ) ) ( not ( = ?auto_15640 ?auto_15670 ) ) ( not ( = ?auto_15641 ?auto_15644 ) ) ( not ( = ?auto_15641 ?auto_15670 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) ( not ( = ?auto_15642 ?auto_15670 ) ) ( not ( = ?auto_15644 ?auto_15675 ) ) ( not ( = ?auto_15644 ?auto_15669 ) ) ( not ( = ?auto_15644 ?auto_15672 ) ) ( not ( = ?auto_15644 ?auto_15653 ) ) ( not ( = ?auto_15644 ?auto_15668 ) ) ( not ( = ?auto_15644 ?auto_15676 ) ) ( not ( = ?auto_15644 ?auto_15662 ) ) ( not ( = ?auto_15644 ?auto_15658 ) ) ( not ( = ?auto_15670 ?auto_15675 ) ) ( not ( = ?auto_15670 ?auto_15669 ) ) ( not ( = ?auto_15670 ?auto_15672 ) ) ( not ( = ?auto_15670 ?auto_15653 ) ) ( not ( = ?auto_15670 ?auto_15668 ) ) ( not ( = ?auto_15670 ?auto_15676 ) ) ( not ( = ?auto_15670 ?auto_15662 ) ) ( not ( = ?auto_15670 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15635 ?auto_15671 ) ) ( not ( = ?auto_15636 ?auto_15645 ) ) ( not ( = ?auto_15636 ?auto_15671 ) ) ( not ( = ?auto_15637 ?auto_15645 ) ) ( not ( = ?auto_15637 ?auto_15671 ) ) ( not ( = ?auto_15638 ?auto_15645 ) ) ( not ( = ?auto_15638 ?auto_15671 ) ) ( not ( = ?auto_15639 ?auto_15645 ) ) ( not ( = ?auto_15639 ?auto_15671 ) ) ( not ( = ?auto_15640 ?auto_15645 ) ) ( not ( = ?auto_15640 ?auto_15671 ) ) ( not ( = ?auto_15641 ?auto_15645 ) ) ( not ( = ?auto_15641 ?auto_15671 ) ) ( not ( = ?auto_15642 ?auto_15645 ) ) ( not ( = ?auto_15642 ?auto_15671 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) ( not ( = ?auto_15643 ?auto_15671 ) ) ( not ( = ?auto_15645 ?auto_15670 ) ) ( not ( = ?auto_15645 ?auto_15675 ) ) ( not ( = ?auto_15645 ?auto_15669 ) ) ( not ( = ?auto_15645 ?auto_15672 ) ) ( not ( = ?auto_15645 ?auto_15653 ) ) ( not ( = ?auto_15645 ?auto_15668 ) ) ( not ( = ?auto_15645 ?auto_15676 ) ) ( not ( = ?auto_15645 ?auto_15662 ) ) ( not ( = ?auto_15645 ?auto_15658 ) ) ( not ( = ?auto_15671 ?auto_15670 ) ) ( not ( = ?auto_15671 ?auto_15675 ) ) ( not ( = ?auto_15671 ?auto_15669 ) ) ( not ( = ?auto_15671 ?auto_15672 ) ) ( not ( = ?auto_15671 ?auto_15653 ) ) ( not ( = ?auto_15671 ?auto_15668 ) ) ( not ( = ?auto_15671 ?auto_15676 ) ) ( not ( = ?auto_15671 ?auto_15662 ) ) ( not ( = ?auto_15671 ?auto_15658 ) ) ( not ( = ?auto_15635 ?auto_15646 ) ) ( not ( = ?auto_15635 ?auto_15650 ) ) ( not ( = ?auto_15636 ?auto_15646 ) ) ( not ( = ?auto_15636 ?auto_15650 ) ) ( not ( = ?auto_15637 ?auto_15646 ) ) ( not ( = ?auto_15637 ?auto_15650 ) ) ( not ( = ?auto_15638 ?auto_15646 ) ) ( not ( = ?auto_15638 ?auto_15650 ) ) ( not ( = ?auto_15639 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15650 ) ) ( not ( = ?auto_15640 ?auto_15646 ) ) ( not ( = ?auto_15640 ?auto_15650 ) ) ( not ( = ?auto_15641 ?auto_15646 ) ) ( not ( = ?auto_15641 ?auto_15650 ) ) ( not ( = ?auto_15642 ?auto_15646 ) ) ( not ( = ?auto_15642 ?auto_15650 ) ) ( not ( = ?auto_15643 ?auto_15646 ) ) ( not ( = ?auto_15643 ?auto_15650 ) ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15650 ) ) ( not ( = ?auto_15646 ?auto_15671 ) ) ( not ( = ?auto_15646 ?auto_15670 ) ) ( not ( = ?auto_15646 ?auto_15675 ) ) ( not ( = ?auto_15646 ?auto_15669 ) ) ( not ( = ?auto_15646 ?auto_15672 ) ) ( not ( = ?auto_15646 ?auto_15653 ) ) ( not ( = ?auto_15646 ?auto_15668 ) ) ( not ( = ?auto_15646 ?auto_15676 ) ) ( not ( = ?auto_15646 ?auto_15662 ) ) ( not ( = ?auto_15646 ?auto_15658 ) ) ( not ( = ?auto_15651 ?auto_15660 ) ) ( not ( = ?auto_15651 ?auto_15654 ) ) ( not ( = ?auto_15651 ?auto_15655 ) ) ( not ( = ?auto_15651 ?auto_15657 ) ) ( not ( = ?auto_15651 ?auto_15673 ) ) ( not ( = ?auto_15651 ?auto_15663 ) ) ( not ( = ?auto_15651 ?auto_15664 ) ) ( not ( = ?auto_15647 ?auto_15659 ) ) ( not ( = ?auto_15647 ?auto_15656 ) ) ( not ( = ?auto_15647 ?auto_15674 ) ) ( not ( = ?auto_15647 ?auto_15666 ) ) ( not ( = ?auto_15647 ?auto_15665 ) ) ( not ( = ?auto_15647 ?auto_15667 ) ) ( not ( = ?auto_15647 ?auto_15661 ) ) ( not ( = ?auto_15650 ?auto_15671 ) ) ( not ( = ?auto_15650 ?auto_15670 ) ) ( not ( = ?auto_15650 ?auto_15675 ) ) ( not ( = ?auto_15650 ?auto_15669 ) ) ( not ( = ?auto_15650 ?auto_15672 ) ) ( not ( = ?auto_15650 ?auto_15653 ) ) ( not ( = ?auto_15650 ?auto_15668 ) ) ( not ( = ?auto_15650 ?auto_15676 ) ) ( not ( = ?auto_15650 ?auto_15662 ) ) ( not ( = ?auto_15650 ?auto_15658 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15635 ?auto_15636 ?auto_15637 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15641 ?auto_15642 ?auto_15643 ?auto_15644 ?auto_15645 )
      ( MAKE-1CRATE ?auto_15645 ?auto_15646 )
      ( MAKE-11CRATE-VERIFY ?auto_15635 ?auto_15636 ?auto_15637 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15641 ?auto_15642 ?auto_15643 ?auto_15644 ?auto_15645 ?auto_15646 ) )
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
      ?auto_15706 - SURFACE
      ?auto_15707 - SURFACE
      ?auto_15708 - SURFACE
      ?auto_15709 - SURFACE
      ?auto_15710 - SURFACE
      ?auto_15711 - SURFACE
      ?auto_15712 - SURFACE
    )
    :vars
    (
      ?auto_15716 - HOIST
      ?auto_15715 - PLACE
      ?auto_15714 - PLACE
      ?auto_15718 - HOIST
      ?auto_15717 - SURFACE
      ?auto_15735 - SURFACE
      ?auto_15736 - PLACE
      ?auto_15721 - HOIST
      ?auto_15724 - SURFACE
      ?auto_15725 - PLACE
      ?auto_15734 - HOIST
      ?auto_15722 - SURFACE
      ?auto_15737 - PLACE
      ?auto_15723 - HOIST
      ?auto_15719 - SURFACE
      ?auto_15729 - PLACE
      ?auto_15743 - HOIST
      ?auto_15740 - SURFACE
      ?auto_15731 - PLACE
      ?auto_15728 - HOIST
      ?auto_15741 - SURFACE
      ?auto_15727 - SURFACE
      ?auto_15738 - PLACE
      ?auto_15720 - HOIST
      ?auto_15742 - SURFACE
      ?auto_15726 - SURFACE
      ?auto_15730 - PLACE
      ?auto_15733 - HOIST
      ?auto_15739 - SURFACE
      ?auto_15732 - SURFACE
      ?auto_15713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15716 ?auto_15715 ) ( IS-CRATE ?auto_15712 ) ( not ( = ?auto_15714 ?auto_15715 ) ) ( HOIST-AT ?auto_15718 ?auto_15714 ) ( SURFACE-AT ?auto_15712 ?auto_15714 ) ( ON ?auto_15712 ?auto_15717 ) ( CLEAR ?auto_15712 ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15717 ) ) ( not ( = ?auto_15712 ?auto_15717 ) ) ( not ( = ?auto_15716 ?auto_15718 ) ) ( IS-CRATE ?auto_15711 ) ( AVAILABLE ?auto_15718 ) ( SURFACE-AT ?auto_15711 ?auto_15714 ) ( ON ?auto_15711 ?auto_15735 ) ( CLEAR ?auto_15711 ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15735 ) ) ( not ( = ?auto_15711 ?auto_15735 ) ) ( IS-CRATE ?auto_15710 ) ( not ( = ?auto_15736 ?auto_15715 ) ) ( HOIST-AT ?auto_15721 ?auto_15736 ) ( SURFACE-AT ?auto_15710 ?auto_15736 ) ( ON ?auto_15710 ?auto_15724 ) ( CLEAR ?auto_15710 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15724 ) ) ( not ( = ?auto_15710 ?auto_15724 ) ) ( not ( = ?auto_15716 ?auto_15721 ) ) ( IS-CRATE ?auto_15709 ) ( not ( = ?auto_15725 ?auto_15715 ) ) ( HOIST-AT ?auto_15734 ?auto_15725 ) ( SURFACE-AT ?auto_15709 ?auto_15725 ) ( ON ?auto_15709 ?auto_15722 ) ( CLEAR ?auto_15709 ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15722 ) ) ( not ( = ?auto_15709 ?auto_15722 ) ) ( not ( = ?auto_15716 ?auto_15734 ) ) ( IS-CRATE ?auto_15708 ) ( not ( = ?auto_15737 ?auto_15715 ) ) ( HOIST-AT ?auto_15723 ?auto_15737 ) ( AVAILABLE ?auto_15723 ) ( SURFACE-AT ?auto_15708 ?auto_15737 ) ( ON ?auto_15708 ?auto_15719 ) ( CLEAR ?auto_15708 ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15719 ) ) ( not ( = ?auto_15708 ?auto_15719 ) ) ( not ( = ?auto_15716 ?auto_15723 ) ) ( IS-CRATE ?auto_15707 ) ( not ( = ?auto_15729 ?auto_15715 ) ) ( HOIST-AT ?auto_15743 ?auto_15729 ) ( AVAILABLE ?auto_15743 ) ( SURFACE-AT ?auto_15707 ?auto_15729 ) ( ON ?auto_15707 ?auto_15740 ) ( CLEAR ?auto_15707 ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15740 ) ) ( not ( = ?auto_15707 ?auto_15740 ) ) ( not ( = ?auto_15716 ?auto_15743 ) ) ( IS-CRATE ?auto_15706 ) ( not ( = ?auto_15731 ?auto_15715 ) ) ( HOIST-AT ?auto_15728 ?auto_15731 ) ( AVAILABLE ?auto_15728 ) ( SURFACE-AT ?auto_15706 ?auto_15731 ) ( ON ?auto_15706 ?auto_15741 ) ( CLEAR ?auto_15706 ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15741 ) ) ( not ( = ?auto_15706 ?auto_15741 ) ) ( not ( = ?auto_15716 ?auto_15728 ) ) ( IS-CRATE ?auto_15705 ) ( SURFACE-AT ?auto_15705 ?auto_15736 ) ( ON ?auto_15705 ?auto_15727 ) ( CLEAR ?auto_15705 ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( not ( = ?auto_15704 ?auto_15727 ) ) ( not ( = ?auto_15705 ?auto_15727 ) ) ( IS-CRATE ?auto_15704 ) ( not ( = ?auto_15738 ?auto_15715 ) ) ( HOIST-AT ?auto_15720 ?auto_15738 ) ( AVAILABLE ?auto_15720 ) ( SURFACE-AT ?auto_15704 ?auto_15738 ) ( ON ?auto_15704 ?auto_15742 ) ( CLEAR ?auto_15704 ) ( not ( = ?auto_15703 ?auto_15704 ) ) ( not ( = ?auto_15703 ?auto_15742 ) ) ( not ( = ?auto_15704 ?auto_15742 ) ) ( not ( = ?auto_15716 ?auto_15720 ) ) ( IS-CRATE ?auto_15703 ) ( AVAILABLE ?auto_15734 ) ( SURFACE-AT ?auto_15703 ?auto_15725 ) ( ON ?auto_15703 ?auto_15726 ) ( CLEAR ?auto_15703 ) ( not ( = ?auto_15702 ?auto_15703 ) ) ( not ( = ?auto_15702 ?auto_15726 ) ) ( not ( = ?auto_15703 ?auto_15726 ) ) ( IS-CRATE ?auto_15702 ) ( not ( = ?auto_15730 ?auto_15715 ) ) ( HOIST-AT ?auto_15733 ?auto_15730 ) ( AVAILABLE ?auto_15733 ) ( SURFACE-AT ?auto_15702 ?auto_15730 ) ( ON ?auto_15702 ?auto_15739 ) ( CLEAR ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15739 ) ) ( not ( = ?auto_15702 ?auto_15739 ) ) ( not ( = ?auto_15716 ?auto_15733 ) ) ( SURFACE-AT ?auto_15700 ?auto_15715 ) ( CLEAR ?auto_15700 ) ( IS-CRATE ?auto_15701 ) ( AVAILABLE ?auto_15716 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15701 ?auto_15736 ) ( ON ?auto_15701 ?auto_15732 ) ( CLEAR ?auto_15701 ) ( TRUCK-AT ?auto_15713 ?auto_15715 ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15700 ?auto_15732 ) ) ( not ( = ?auto_15701 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15739 ) ) ( not ( = ?auto_15702 ?auto_15732 ) ) ( not ( = ?auto_15730 ?auto_15736 ) ) ( not ( = ?auto_15733 ?auto_15721 ) ) ( not ( = ?auto_15739 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15703 ) ) ( not ( = ?auto_15700 ?auto_15726 ) ) ( not ( = ?auto_15701 ?auto_15703 ) ) ( not ( = ?auto_15701 ?auto_15726 ) ) ( not ( = ?auto_15703 ?auto_15739 ) ) ( not ( = ?auto_15703 ?auto_15732 ) ) ( not ( = ?auto_15725 ?auto_15730 ) ) ( not ( = ?auto_15725 ?auto_15736 ) ) ( not ( = ?auto_15734 ?auto_15733 ) ) ( not ( = ?auto_15734 ?auto_15721 ) ) ( not ( = ?auto_15726 ?auto_15739 ) ) ( not ( = ?auto_15726 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15704 ) ) ( not ( = ?auto_15700 ?auto_15742 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15701 ?auto_15742 ) ) ( not ( = ?auto_15702 ?auto_15704 ) ) ( not ( = ?auto_15702 ?auto_15742 ) ) ( not ( = ?auto_15704 ?auto_15726 ) ) ( not ( = ?auto_15704 ?auto_15739 ) ) ( not ( = ?auto_15704 ?auto_15732 ) ) ( not ( = ?auto_15738 ?auto_15725 ) ) ( not ( = ?auto_15738 ?auto_15730 ) ) ( not ( = ?auto_15738 ?auto_15736 ) ) ( not ( = ?auto_15720 ?auto_15734 ) ) ( not ( = ?auto_15720 ?auto_15733 ) ) ( not ( = ?auto_15720 ?auto_15721 ) ) ( not ( = ?auto_15742 ?auto_15726 ) ) ( not ( = ?auto_15742 ?auto_15739 ) ) ( not ( = ?auto_15742 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15705 ) ) ( not ( = ?auto_15700 ?auto_15727 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15727 ) ) ( not ( = ?auto_15702 ?auto_15705 ) ) ( not ( = ?auto_15702 ?auto_15727 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15727 ) ) ( not ( = ?auto_15705 ?auto_15742 ) ) ( not ( = ?auto_15705 ?auto_15726 ) ) ( not ( = ?auto_15705 ?auto_15739 ) ) ( not ( = ?auto_15705 ?auto_15732 ) ) ( not ( = ?auto_15727 ?auto_15742 ) ) ( not ( = ?auto_15727 ?auto_15726 ) ) ( not ( = ?auto_15727 ?auto_15739 ) ) ( not ( = ?auto_15727 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15706 ) ) ( not ( = ?auto_15700 ?auto_15741 ) ) ( not ( = ?auto_15701 ?auto_15706 ) ) ( not ( = ?auto_15701 ?auto_15741 ) ) ( not ( = ?auto_15702 ?auto_15706 ) ) ( not ( = ?auto_15702 ?auto_15741 ) ) ( not ( = ?auto_15703 ?auto_15706 ) ) ( not ( = ?auto_15703 ?auto_15741 ) ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15704 ?auto_15741 ) ) ( not ( = ?auto_15706 ?auto_15727 ) ) ( not ( = ?auto_15706 ?auto_15742 ) ) ( not ( = ?auto_15706 ?auto_15726 ) ) ( not ( = ?auto_15706 ?auto_15739 ) ) ( not ( = ?auto_15706 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15736 ) ) ( not ( = ?auto_15731 ?auto_15738 ) ) ( not ( = ?auto_15731 ?auto_15725 ) ) ( not ( = ?auto_15731 ?auto_15730 ) ) ( not ( = ?auto_15728 ?auto_15721 ) ) ( not ( = ?auto_15728 ?auto_15720 ) ) ( not ( = ?auto_15728 ?auto_15734 ) ) ( not ( = ?auto_15728 ?auto_15733 ) ) ( not ( = ?auto_15741 ?auto_15727 ) ) ( not ( = ?auto_15741 ?auto_15742 ) ) ( not ( = ?auto_15741 ?auto_15726 ) ) ( not ( = ?auto_15741 ?auto_15739 ) ) ( not ( = ?auto_15741 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15700 ?auto_15740 ) ) ( not ( = ?auto_15701 ?auto_15707 ) ) ( not ( = ?auto_15701 ?auto_15740 ) ) ( not ( = ?auto_15702 ?auto_15707 ) ) ( not ( = ?auto_15702 ?auto_15740 ) ) ( not ( = ?auto_15703 ?auto_15707 ) ) ( not ( = ?auto_15703 ?auto_15740 ) ) ( not ( = ?auto_15704 ?auto_15707 ) ) ( not ( = ?auto_15704 ?auto_15740 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15740 ) ) ( not ( = ?auto_15707 ?auto_15741 ) ) ( not ( = ?auto_15707 ?auto_15727 ) ) ( not ( = ?auto_15707 ?auto_15742 ) ) ( not ( = ?auto_15707 ?auto_15726 ) ) ( not ( = ?auto_15707 ?auto_15739 ) ) ( not ( = ?auto_15707 ?auto_15732 ) ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15736 ) ) ( not ( = ?auto_15729 ?auto_15738 ) ) ( not ( = ?auto_15729 ?auto_15725 ) ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15743 ?auto_15728 ) ) ( not ( = ?auto_15743 ?auto_15721 ) ) ( not ( = ?auto_15743 ?auto_15720 ) ) ( not ( = ?auto_15743 ?auto_15734 ) ) ( not ( = ?auto_15743 ?auto_15733 ) ) ( not ( = ?auto_15740 ?auto_15741 ) ) ( not ( = ?auto_15740 ?auto_15727 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( not ( = ?auto_15740 ?auto_15726 ) ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( not ( = ?auto_15740 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15700 ?auto_15719 ) ) ( not ( = ?auto_15701 ?auto_15708 ) ) ( not ( = ?auto_15701 ?auto_15719 ) ) ( not ( = ?auto_15702 ?auto_15708 ) ) ( not ( = ?auto_15702 ?auto_15719 ) ) ( not ( = ?auto_15703 ?auto_15708 ) ) ( not ( = ?auto_15703 ?auto_15719 ) ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( not ( = ?auto_15704 ?auto_15719 ) ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15705 ?auto_15719 ) ) ( not ( = ?auto_15706 ?auto_15708 ) ) ( not ( = ?auto_15706 ?auto_15719 ) ) ( not ( = ?auto_15708 ?auto_15740 ) ) ( not ( = ?auto_15708 ?auto_15741 ) ) ( not ( = ?auto_15708 ?auto_15727 ) ) ( not ( = ?auto_15708 ?auto_15742 ) ) ( not ( = ?auto_15708 ?auto_15726 ) ) ( not ( = ?auto_15708 ?auto_15739 ) ) ( not ( = ?auto_15708 ?auto_15732 ) ) ( not ( = ?auto_15737 ?auto_15729 ) ) ( not ( = ?auto_15737 ?auto_15731 ) ) ( not ( = ?auto_15737 ?auto_15736 ) ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15725 ) ) ( not ( = ?auto_15737 ?auto_15730 ) ) ( not ( = ?auto_15723 ?auto_15743 ) ) ( not ( = ?auto_15723 ?auto_15728 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( not ( = ?auto_15723 ?auto_15720 ) ) ( not ( = ?auto_15723 ?auto_15734 ) ) ( not ( = ?auto_15723 ?auto_15733 ) ) ( not ( = ?auto_15719 ?auto_15740 ) ) ( not ( = ?auto_15719 ?auto_15741 ) ) ( not ( = ?auto_15719 ?auto_15727 ) ) ( not ( = ?auto_15719 ?auto_15742 ) ) ( not ( = ?auto_15719 ?auto_15726 ) ) ( not ( = ?auto_15719 ?auto_15739 ) ) ( not ( = ?auto_15719 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15709 ) ) ( not ( = ?auto_15700 ?auto_15722 ) ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( not ( = ?auto_15701 ?auto_15722 ) ) ( not ( = ?auto_15702 ?auto_15709 ) ) ( not ( = ?auto_15702 ?auto_15722 ) ) ( not ( = ?auto_15703 ?auto_15709 ) ) ( not ( = ?auto_15703 ?auto_15722 ) ) ( not ( = ?auto_15704 ?auto_15709 ) ) ( not ( = ?auto_15704 ?auto_15722 ) ) ( not ( = ?auto_15705 ?auto_15709 ) ) ( not ( = ?auto_15705 ?auto_15722 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15722 ) ) ( not ( = ?auto_15707 ?auto_15709 ) ) ( not ( = ?auto_15707 ?auto_15722 ) ) ( not ( = ?auto_15709 ?auto_15719 ) ) ( not ( = ?auto_15709 ?auto_15740 ) ) ( not ( = ?auto_15709 ?auto_15741 ) ) ( not ( = ?auto_15709 ?auto_15727 ) ) ( not ( = ?auto_15709 ?auto_15742 ) ) ( not ( = ?auto_15709 ?auto_15726 ) ) ( not ( = ?auto_15709 ?auto_15739 ) ) ( not ( = ?auto_15709 ?auto_15732 ) ) ( not ( = ?auto_15722 ?auto_15719 ) ) ( not ( = ?auto_15722 ?auto_15740 ) ) ( not ( = ?auto_15722 ?auto_15741 ) ) ( not ( = ?auto_15722 ?auto_15727 ) ) ( not ( = ?auto_15722 ?auto_15742 ) ) ( not ( = ?auto_15722 ?auto_15726 ) ) ( not ( = ?auto_15722 ?auto_15739 ) ) ( not ( = ?auto_15722 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15710 ) ) ( not ( = ?auto_15700 ?auto_15724 ) ) ( not ( = ?auto_15701 ?auto_15710 ) ) ( not ( = ?auto_15701 ?auto_15724 ) ) ( not ( = ?auto_15702 ?auto_15710 ) ) ( not ( = ?auto_15702 ?auto_15724 ) ) ( not ( = ?auto_15703 ?auto_15710 ) ) ( not ( = ?auto_15703 ?auto_15724 ) ) ( not ( = ?auto_15704 ?auto_15710 ) ) ( not ( = ?auto_15704 ?auto_15724 ) ) ( not ( = ?auto_15705 ?auto_15710 ) ) ( not ( = ?auto_15705 ?auto_15724 ) ) ( not ( = ?auto_15706 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15724 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( not ( = ?auto_15707 ?auto_15724 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( not ( = ?auto_15708 ?auto_15724 ) ) ( not ( = ?auto_15710 ?auto_15722 ) ) ( not ( = ?auto_15710 ?auto_15719 ) ) ( not ( = ?auto_15710 ?auto_15740 ) ) ( not ( = ?auto_15710 ?auto_15741 ) ) ( not ( = ?auto_15710 ?auto_15727 ) ) ( not ( = ?auto_15710 ?auto_15742 ) ) ( not ( = ?auto_15710 ?auto_15726 ) ) ( not ( = ?auto_15710 ?auto_15739 ) ) ( not ( = ?auto_15710 ?auto_15732 ) ) ( not ( = ?auto_15724 ?auto_15722 ) ) ( not ( = ?auto_15724 ?auto_15719 ) ) ( not ( = ?auto_15724 ?auto_15740 ) ) ( not ( = ?auto_15724 ?auto_15741 ) ) ( not ( = ?auto_15724 ?auto_15727 ) ) ( not ( = ?auto_15724 ?auto_15742 ) ) ( not ( = ?auto_15724 ?auto_15726 ) ) ( not ( = ?auto_15724 ?auto_15739 ) ) ( not ( = ?auto_15724 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15711 ) ) ( not ( = ?auto_15700 ?auto_15735 ) ) ( not ( = ?auto_15701 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15735 ) ) ( not ( = ?auto_15702 ?auto_15711 ) ) ( not ( = ?auto_15702 ?auto_15735 ) ) ( not ( = ?auto_15703 ?auto_15711 ) ) ( not ( = ?auto_15703 ?auto_15735 ) ) ( not ( = ?auto_15704 ?auto_15711 ) ) ( not ( = ?auto_15704 ?auto_15735 ) ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( not ( = ?auto_15705 ?auto_15735 ) ) ( not ( = ?auto_15706 ?auto_15711 ) ) ( not ( = ?auto_15706 ?auto_15735 ) ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15707 ?auto_15735 ) ) ( not ( = ?auto_15708 ?auto_15711 ) ) ( not ( = ?auto_15708 ?auto_15735 ) ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15735 ) ) ( not ( = ?auto_15711 ?auto_15724 ) ) ( not ( = ?auto_15711 ?auto_15722 ) ) ( not ( = ?auto_15711 ?auto_15719 ) ) ( not ( = ?auto_15711 ?auto_15740 ) ) ( not ( = ?auto_15711 ?auto_15741 ) ) ( not ( = ?auto_15711 ?auto_15727 ) ) ( not ( = ?auto_15711 ?auto_15742 ) ) ( not ( = ?auto_15711 ?auto_15726 ) ) ( not ( = ?auto_15711 ?auto_15739 ) ) ( not ( = ?auto_15711 ?auto_15732 ) ) ( not ( = ?auto_15714 ?auto_15736 ) ) ( not ( = ?auto_15714 ?auto_15725 ) ) ( not ( = ?auto_15714 ?auto_15737 ) ) ( not ( = ?auto_15714 ?auto_15729 ) ) ( not ( = ?auto_15714 ?auto_15731 ) ) ( not ( = ?auto_15714 ?auto_15738 ) ) ( not ( = ?auto_15714 ?auto_15730 ) ) ( not ( = ?auto_15718 ?auto_15721 ) ) ( not ( = ?auto_15718 ?auto_15734 ) ) ( not ( = ?auto_15718 ?auto_15723 ) ) ( not ( = ?auto_15718 ?auto_15743 ) ) ( not ( = ?auto_15718 ?auto_15728 ) ) ( not ( = ?auto_15718 ?auto_15720 ) ) ( not ( = ?auto_15718 ?auto_15733 ) ) ( not ( = ?auto_15735 ?auto_15724 ) ) ( not ( = ?auto_15735 ?auto_15722 ) ) ( not ( = ?auto_15735 ?auto_15719 ) ) ( not ( = ?auto_15735 ?auto_15740 ) ) ( not ( = ?auto_15735 ?auto_15741 ) ) ( not ( = ?auto_15735 ?auto_15727 ) ) ( not ( = ?auto_15735 ?auto_15742 ) ) ( not ( = ?auto_15735 ?auto_15726 ) ) ( not ( = ?auto_15735 ?auto_15739 ) ) ( not ( = ?auto_15735 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15712 ) ) ( not ( = ?auto_15700 ?auto_15717 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( not ( = ?auto_15701 ?auto_15717 ) ) ( not ( = ?auto_15702 ?auto_15712 ) ) ( not ( = ?auto_15702 ?auto_15717 ) ) ( not ( = ?auto_15703 ?auto_15712 ) ) ( not ( = ?auto_15703 ?auto_15717 ) ) ( not ( = ?auto_15704 ?auto_15712 ) ) ( not ( = ?auto_15704 ?auto_15717 ) ) ( not ( = ?auto_15705 ?auto_15712 ) ) ( not ( = ?auto_15705 ?auto_15717 ) ) ( not ( = ?auto_15706 ?auto_15712 ) ) ( not ( = ?auto_15706 ?auto_15717 ) ) ( not ( = ?auto_15707 ?auto_15712 ) ) ( not ( = ?auto_15707 ?auto_15717 ) ) ( not ( = ?auto_15708 ?auto_15712 ) ) ( not ( = ?auto_15708 ?auto_15717 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15709 ?auto_15717 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15717 ) ) ( not ( = ?auto_15712 ?auto_15735 ) ) ( not ( = ?auto_15712 ?auto_15724 ) ) ( not ( = ?auto_15712 ?auto_15722 ) ) ( not ( = ?auto_15712 ?auto_15719 ) ) ( not ( = ?auto_15712 ?auto_15740 ) ) ( not ( = ?auto_15712 ?auto_15741 ) ) ( not ( = ?auto_15712 ?auto_15727 ) ) ( not ( = ?auto_15712 ?auto_15742 ) ) ( not ( = ?auto_15712 ?auto_15726 ) ) ( not ( = ?auto_15712 ?auto_15739 ) ) ( not ( = ?auto_15712 ?auto_15732 ) ) ( not ( = ?auto_15717 ?auto_15735 ) ) ( not ( = ?auto_15717 ?auto_15724 ) ) ( not ( = ?auto_15717 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15719 ) ) ( not ( = ?auto_15717 ?auto_15740 ) ) ( not ( = ?auto_15717 ?auto_15741 ) ) ( not ( = ?auto_15717 ?auto_15727 ) ) ( not ( = ?auto_15717 ?auto_15742 ) ) ( not ( = ?auto_15717 ?auto_15726 ) ) ( not ( = ?auto_15717 ?auto_15739 ) ) ( not ( = ?auto_15717 ?auto_15732 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15700 ?auto_15701 ?auto_15702 ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15707 ?auto_15708 ?auto_15709 ?auto_15710 ?auto_15711 )
      ( MAKE-1CRATE ?auto_15711 ?auto_15712 )
      ( MAKE-12CRATE-VERIFY ?auto_15700 ?auto_15701 ?auto_15702 ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15707 ?auto_15708 ?auto_15709 ?auto_15710 ?auto_15711 ?auto_15712 ) )
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
      ?auto_15774 - SURFACE
      ?auto_15775 - SURFACE
      ?auto_15776 - SURFACE
      ?auto_15777 - SURFACE
      ?auto_15778 - SURFACE
      ?auto_15779 - SURFACE
      ?auto_15780 - SURFACE
      ?auto_15781 - SURFACE
    )
    :vars
    (
      ?auto_15782 - HOIST
      ?auto_15787 - PLACE
      ?auto_15785 - PLACE
      ?auto_15784 - HOIST
      ?auto_15786 - SURFACE
      ?auto_15797 - PLACE
      ?auto_15798 - HOIST
      ?auto_15792 - SURFACE
      ?auto_15812 - SURFACE
      ?auto_15795 - PLACE
      ?auto_15800 - HOIST
      ?auto_15799 - SURFACE
      ?auto_15788 - PLACE
      ?auto_15813 - HOIST
      ?auto_15802 - SURFACE
      ?auto_15806 - PLACE
      ?auto_15789 - HOIST
      ?auto_15805 - SURFACE
      ?auto_15803 - PLACE
      ?auto_15807 - HOIST
      ?auto_15804 - SURFACE
      ?auto_15794 - PLACE
      ?auto_15801 - HOIST
      ?auto_15809 - SURFACE
      ?auto_15810 - SURFACE
      ?auto_15791 - SURFACE
      ?auto_15796 - SURFACE
      ?auto_15811 - PLACE
      ?auto_15808 - HOIST
      ?auto_15790 - SURFACE
      ?auto_15793 - SURFACE
      ?auto_15783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15782 ?auto_15787 ) ( IS-CRATE ?auto_15781 ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( HOIST-AT ?auto_15784 ?auto_15785 ) ( SURFACE-AT ?auto_15781 ?auto_15785 ) ( ON ?auto_15781 ?auto_15786 ) ( CLEAR ?auto_15781 ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15786 ) ) ( not ( = ?auto_15781 ?auto_15786 ) ) ( not ( = ?auto_15782 ?auto_15784 ) ) ( IS-CRATE ?auto_15780 ) ( not ( = ?auto_15797 ?auto_15787 ) ) ( HOIST-AT ?auto_15798 ?auto_15797 ) ( SURFACE-AT ?auto_15780 ?auto_15797 ) ( ON ?auto_15780 ?auto_15792 ) ( CLEAR ?auto_15780 ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15792 ) ) ( not ( = ?auto_15780 ?auto_15792 ) ) ( not ( = ?auto_15782 ?auto_15798 ) ) ( IS-CRATE ?auto_15779 ) ( AVAILABLE ?auto_15798 ) ( SURFACE-AT ?auto_15779 ?auto_15797 ) ( ON ?auto_15779 ?auto_15812 ) ( CLEAR ?auto_15779 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15812 ) ) ( not ( = ?auto_15779 ?auto_15812 ) ) ( IS-CRATE ?auto_15778 ) ( not ( = ?auto_15795 ?auto_15787 ) ) ( HOIST-AT ?auto_15800 ?auto_15795 ) ( SURFACE-AT ?auto_15778 ?auto_15795 ) ( ON ?auto_15778 ?auto_15799 ) ( CLEAR ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15799 ) ) ( not ( = ?auto_15778 ?auto_15799 ) ) ( not ( = ?auto_15782 ?auto_15800 ) ) ( IS-CRATE ?auto_15777 ) ( not ( = ?auto_15788 ?auto_15787 ) ) ( HOIST-AT ?auto_15813 ?auto_15788 ) ( SURFACE-AT ?auto_15777 ?auto_15788 ) ( ON ?auto_15777 ?auto_15802 ) ( CLEAR ?auto_15777 ) ( not ( = ?auto_15776 ?auto_15777 ) ) ( not ( = ?auto_15776 ?auto_15802 ) ) ( not ( = ?auto_15777 ?auto_15802 ) ) ( not ( = ?auto_15782 ?auto_15813 ) ) ( IS-CRATE ?auto_15776 ) ( not ( = ?auto_15806 ?auto_15787 ) ) ( HOIST-AT ?auto_15789 ?auto_15806 ) ( AVAILABLE ?auto_15789 ) ( SURFACE-AT ?auto_15776 ?auto_15806 ) ( ON ?auto_15776 ?auto_15805 ) ( CLEAR ?auto_15776 ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15775 ?auto_15805 ) ) ( not ( = ?auto_15776 ?auto_15805 ) ) ( not ( = ?auto_15782 ?auto_15789 ) ) ( IS-CRATE ?auto_15775 ) ( not ( = ?auto_15803 ?auto_15787 ) ) ( HOIST-AT ?auto_15807 ?auto_15803 ) ( AVAILABLE ?auto_15807 ) ( SURFACE-AT ?auto_15775 ?auto_15803 ) ( ON ?auto_15775 ?auto_15804 ) ( CLEAR ?auto_15775 ) ( not ( = ?auto_15774 ?auto_15775 ) ) ( not ( = ?auto_15774 ?auto_15804 ) ) ( not ( = ?auto_15775 ?auto_15804 ) ) ( not ( = ?auto_15782 ?auto_15807 ) ) ( IS-CRATE ?auto_15774 ) ( not ( = ?auto_15794 ?auto_15787 ) ) ( HOIST-AT ?auto_15801 ?auto_15794 ) ( AVAILABLE ?auto_15801 ) ( SURFACE-AT ?auto_15774 ?auto_15794 ) ( ON ?auto_15774 ?auto_15809 ) ( CLEAR ?auto_15774 ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15809 ) ) ( not ( = ?auto_15774 ?auto_15809 ) ) ( not ( = ?auto_15782 ?auto_15801 ) ) ( IS-CRATE ?auto_15773 ) ( SURFACE-AT ?auto_15773 ?auto_15795 ) ( ON ?auto_15773 ?auto_15810 ) ( CLEAR ?auto_15773 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15810 ) ) ( not ( = ?auto_15773 ?auto_15810 ) ) ( IS-CRATE ?auto_15772 ) ( AVAILABLE ?auto_15784 ) ( SURFACE-AT ?auto_15772 ?auto_15785 ) ( ON ?auto_15772 ?auto_15791 ) ( CLEAR ?auto_15772 ) ( not ( = ?auto_15771 ?auto_15772 ) ) ( not ( = ?auto_15771 ?auto_15791 ) ) ( not ( = ?auto_15772 ?auto_15791 ) ) ( IS-CRATE ?auto_15771 ) ( AVAILABLE ?auto_15813 ) ( SURFACE-AT ?auto_15771 ?auto_15788 ) ( ON ?auto_15771 ?auto_15796 ) ( CLEAR ?auto_15771 ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15796 ) ) ( not ( = ?auto_15771 ?auto_15796 ) ) ( IS-CRATE ?auto_15770 ) ( not ( = ?auto_15811 ?auto_15787 ) ) ( HOIST-AT ?auto_15808 ?auto_15811 ) ( AVAILABLE ?auto_15808 ) ( SURFACE-AT ?auto_15770 ?auto_15811 ) ( ON ?auto_15770 ?auto_15790 ) ( CLEAR ?auto_15770 ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15790 ) ) ( not ( = ?auto_15770 ?auto_15790 ) ) ( not ( = ?auto_15782 ?auto_15808 ) ) ( SURFACE-AT ?auto_15768 ?auto_15787 ) ( CLEAR ?auto_15768 ) ( IS-CRATE ?auto_15769 ) ( AVAILABLE ?auto_15782 ) ( AVAILABLE ?auto_15800 ) ( SURFACE-AT ?auto_15769 ?auto_15795 ) ( ON ?auto_15769 ?auto_15793 ) ( CLEAR ?auto_15769 ) ( TRUCK-AT ?auto_15783 ?auto_15787 ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15793 ) ) ( not ( = ?auto_15769 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15770 ) ) ( not ( = ?auto_15768 ?auto_15790 ) ) ( not ( = ?auto_15770 ?auto_15793 ) ) ( not ( = ?auto_15811 ?auto_15795 ) ) ( not ( = ?auto_15808 ?auto_15800 ) ) ( not ( = ?auto_15790 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15796 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15796 ) ) ( not ( = ?auto_15771 ?auto_15790 ) ) ( not ( = ?auto_15771 ?auto_15793 ) ) ( not ( = ?auto_15788 ?auto_15811 ) ) ( not ( = ?auto_15788 ?auto_15795 ) ) ( not ( = ?auto_15813 ?auto_15808 ) ) ( not ( = ?auto_15813 ?auto_15800 ) ) ( not ( = ?auto_15796 ?auto_15790 ) ) ( not ( = ?auto_15796 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15772 ) ) ( not ( = ?auto_15768 ?auto_15791 ) ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15769 ?auto_15791 ) ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( not ( = ?auto_15770 ?auto_15791 ) ) ( not ( = ?auto_15772 ?auto_15796 ) ) ( not ( = ?auto_15772 ?auto_15790 ) ) ( not ( = ?auto_15772 ?auto_15793 ) ) ( not ( = ?auto_15785 ?auto_15788 ) ) ( not ( = ?auto_15785 ?auto_15811 ) ) ( not ( = ?auto_15785 ?auto_15795 ) ) ( not ( = ?auto_15784 ?auto_15813 ) ) ( not ( = ?auto_15784 ?auto_15808 ) ) ( not ( = ?auto_15784 ?auto_15800 ) ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15791 ?auto_15790 ) ) ( not ( = ?auto_15791 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15773 ) ) ( not ( = ?auto_15768 ?auto_15810 ) ) ( not ( = ?auto_15769 ?auto_15773 ) ) ( not ( = ?auto_15769 ?auto_15810 ) ) ( not ( = ?auto_15770 ?auto_15773 ) ) ( not ( = ?auto_15770 ?auto_15810 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15810 ) ) ( not ( = ?auto_15773 ?auto_15791 ) ) ( not ( = ?auto_15773 ?auto_15796 ) ) ( not ( = ?auto_15773 ?auto_15790 ) ) ( not ( = ?auto_15773 ?auto_15793 ) ) ( not ( = ?auto_15810 ?auto_15791 ) ) ( not ( = ?auto_15810 ?auto_15796 ) ) ( not ( = ?auto_15810 ?auto_15790 ) ) ( not ( = ?auto_15810 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( not ( = ?auto_15768 ?auto_15809 ) ) ( not ( = ?auto_15769 ?auto_15774 ) ) ( not ( = ?auto_15769 ?auto_15809 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( not ( = ?auto_15770 ?auto_15809 ) ) ( not ( = ?auto_15771 ?auto_15774 ) ) ( not ( = ?auto_15771 ?auto_15809 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15809 ) ) ( not ( = ?auto_15774 ?auto_15810 ) ) ( not ( = ?auto_15774 ?auto_15791 ) ) ( not ( = ?auto_15774 ?auto_15796 ) ) ( not ( = ?auto_15774 ?auto_15790 ) ) ( not ( = ?auto_15774 ?auto_15793 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15785 ) ) ( not ( = ?auto_15794 ?auto_15788 ) ) ( not ( = ?auto_15794 ?auto_15811 ) ) ( not ( = ?auto_15801 ?auto_15800 ) ) ( not ( = ?auto_15801 ?auto_15784 ) ) ( not ( = ?auto_15801 ?auto_15813 ) ) ( not ( = ?auto_15801 ?auto_15808 ) ) ( not ( = ?auto_15809 ?auto_15810 ) ) ( not ( = ?auto_15809 ?auto_15791 ) ) ( not ( = ?auto_15809 ?auto_15796 ) ) ( not ( = ?auto_15809 ?auto_15790 ) ) ( not ( = ?auto_15809 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( not ( = ?auto_15768 ?auto_15804 ) ) ( not ( = ?auto_15769 ?auto_15775 ) ) ( not ( = ?auto_15769 ?auto_15804 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( not ( = ?auto_15770 ?auto_15804 ) ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( not ( = ?auto_15771 ?auto_15804 ) ) ( not ( = ?auto_15772 ?auto_15775 ) ) ( not ( = ?auto_15772 ?auto_15804 ) ) ( not ( = ?auto_15773 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15804 ) ) ( not ( = ?auto_15775 ?auto_15809 ) ) ( not ( = ?auto_15775 ?auto_15810 ) ) ( not ( = ?auto_15775 ?auto_15791 ) ) ( not ( = ?auto_15775 ?auto_15796 ) ) ( not ( = ?auto_15775 ?auto_15790 ) ) ( not ( = ?auto_15775 ?auto_15793 ) ) ( not ( = ?auto_15803 ?auto_15794 ) ) ( not ( = ?auto_15803 ?auto_15795 ) ) ( not ( = ?auto_15803 ?auto_15785 ) ) ( not ( = ?auto_15803 ?auto_15788 ) ) ( not ( = ?auto_15803 ?auto_15811 ) ) ( not ( = ?auto_15807 ?auto_15801 ) ) ( not ( = ?auto_15807 ?auto_15800 ) ) ( not ( = ?auto_15807 ?auto_15784 ) ) ( not ( = ?auto_15807 ?auto_15813 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) ( not ( = ?auto_15804 ?auto_15809 ) ) ( not ( = ?auto_15804 ?auto_15810 ) ) ( not ( = ?auto_15804 ?auto_15791 ) ) ( not ( = ?auto_15804 ?auto_15796 ) ) ( not ( = ?auto_15804 ?auto_15790 ) ) ( not ( = ?auto_15804 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15776 ) ) ( not ( = ?auto_15768 ?auto_15805 ) ) ( not ( = ?auto_15769 ?auto_15776 ) ) ( not ( = ?auto_15769 ?auto_15805 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( not ( = ?auto_15770 ?auto_15805 ) ) ( not ( = ?auto_15771 ?auto_15776 ) ) ( not ( = ?auto_15771 ?auto_15805 ) ) ( not ( = ?auto_15772 ?auto_15776 ) ) ( not ( = ?auto_15772 ?auto_15805 ) ) ( not ( = ?auto_15773 ?auto_15776 ) ) ( not ( = ?auto_15773 ?auto_15805 ) ) ( not ( = ?auto_15774 ?auto_15776 ) ) ( not ( = ?auto_15774 ?auto_15805 ) ) ( not ( = ?auto_15776 ?auto_15804 ) ) ( not ( = ?auto_15776 ?auto_15809 ) ) ( not ( = ?auto_15776 ?auto_15810 ) ) ( not ( = ?auto_15776 ?auto_15791 ) ) ( not ( = ?auto_15776 ?auto_15796 ) ) ( not ( = ?auto_15776 ?auto_15790 ) ) ( not ( = ?auto_15776 ?auto_15793 ) ) ( not ( = ?auto_15806 ?auto_15803 ) ) ( not ( = ?auto_15806 ?auto_15794 ) ) ( not ( = ?auto_15806 ?auto_15795 ) ) ( not ( = ?auto_15806 ?auto_15785 ) ) ( not ( = ?auto_15806 ?auto_15788 ) ) ( not ( = ?auto_15806 ?auto_15811 ) ) ( not ( = ?auto_15789 ?auto_15807 ) ) ( not ( = ?auto_15789 ?auto_15801 ) ) ( not ( = ?auto_15789 ?auto_15800 ) ) ( not ( = ?auto_15789 ?auto_15784 ) ) ( not ( = ?auto_15789 ?auto_15813 ) ) ( not ( = ?auto_15789 ?auto_15808 ) ) ( not ( = ?auto_15805 ?auto_15804 ) ) ( not ( = ?auto_15805 ?auto_15809 ) ) ( not ( = ?auto_15805 ?auto_15810 ) ) ( not ( = ?auto_15805 ?auto_15791 ) ) ( not ( = ?auto_15805 ?auto_15796 ) ) ( not ( = ?auto_15805 ?auto_15790 ) ) ( not ( = ?auto_15805 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15777 ) ) ( not ( = ?auto_15768 ?auto_15802 ) ) ( not ( = ?auto_15769 ?auto_15777 ) ) ( not ( = ?auto_15769 ?auto_15802 ) ) ( not ( = ?auto_15770 ?auto_15777 ) ) ( not ( = ?auto_15770 ?auto_15802 ) ) ( not ( = ?auto_15771 ?auto_15777 ) ) ( not ( = ?auto_15771 ?auto_15802 ) ) ( not ( = ?auto_15772 ?auto_15777 ) ) ( not ( = ?auto_15772 ?auto_15802 ) ) ( not ( = ?auto_15773 ?auto_15777 ) ) ( not ( = ?auto_15773 ?auto_15802 ) ) ( not ( = ?auto_15774 ?auto_15777 ) ) ( not ( = ?auto_15774 ?auto_15802 ) ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( not ( = ?auto_15775 ?auto_15802 ) ) ( not ( = ?auto_15777 ?auto_15805 ) ) ( not ( = ?auto_15777 ?auto_15804 ) ) ( not ( = ?auto_15777 ?auto_15809 ) ) ( not ( = ?auto_15777 ?auto_15810 ) ) ( not ( = ?auto_15777 ?auto_15791 ) ) ( not ( = ?auto_15777 ?auto_15796 ) ) ( not ( = ?auto_15777 ?auto_15790 ) ) ( not ( = ?auto_15777 ?auto_15793 ) ) ( not ( = ?auto_15802 ?auto_15805 ) ) ( not ( = ?auto_15802 ?auto_15804 ) ) ( not ( = ?auto_15802 ?auto_15809 ) ) ( not ( = ?auto_15802 ?auto_15810 ) ) ( not ( = ?auto_15802 ?auto_15791 ) ) ( not ( = ?auto_15802 ?auto_15796 ) ) ( not ( = ?auto_15802 ?auto_15790 ) ) ( not ( = ?auto_15802 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15778 ) ) ( not ( = ?auto_15768 ?auto_15799 ) ) ( not ( = ?auto_15769 ?auto_15778 ) ) ( not ( = ?auto_15769 ?auto_15799 ) ) ( not ( = ?auto_15770 ?auto_15778 ) ) ( not ( = ?auto_15770 ?auto_15799 ) ) ( not ( = ?auto_15771 ?auto_15778 ) ) ( not ( = ?auto_15771 ?auto_15799 ) ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( not ( = ?auto_15772 ?auto_15799 ) ) ( not ( = ?auto_15773 ?auto_15778 ) ) ( not ( = ?auto_15773 ?auto_15799 ) ) ( not ( = ?auto_15774 ?auto_15778 ) ) ( not ( = ?auto_15774 ?auto_15799 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15799 ) ) ( not ( = ?auto_15776 ?auto_15778 ) ) ( not ( = ?auto_15776 ?auto_15799 ) ) ( not ( = ?auto_15778 ?auto_15802 ) ) ( not ( = ?auto_15778 ?auto_15805 ) ) ( not ( = ?auto_15778 ?auto_15804 ) ) ( not ( = ?auto_15778 ?auto_15809 ) ) ( not ( = ?auto_15778 ?auto_15810 ) ) ( not ( = ?auto_15778 ?auto_15791 ) ) ( not ( = ?auto_15778 ?auto_15796 ) ) ( not ( = ?auto_15778 ?auto_15790 ) ) ( not ( = ?auto_15778 ?auto_15793 ) ) ( not ( = ?auto_15799 ?auto_15802 ) ) ( not ( = ?auto_15799 ?auto_15805 ) ) ( not ( = ?auto_15799 ?auto_15804 ) ) ( not ( = ?auto_15799 ?auto_15809 ) ) ( not ( = ?auto_15799 ?auto_15810 ) ) ( not ( = ?auto_15799 ?auto_15791 ) ) ( not ( = ?auto_15799 ?auto_15796 ) ) ( not ( = ?auto_15799 ?auto_15790 ) ) ( not ( = ?auto_15799 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15779 ) ) ( not ( = ?auto_15768 ?auto_15812 ) ) ( not ( = ?auto_15769 ?auto_15779 ) ) ( not ( = ?auto_15769 ?auto_15812 ) ) ( not ( = ?auto_15770 ?auto_15779 ) ) ( not ( = ?auto_15770 ?auto_15812 ) ) ( not ( = ?auto_15771 ?auto_15779 ) ) ( not ( = ?auto_15771 ?auto_15812 ) ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15772 ?auto_15812 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( not ( = ?auto_15773 ?auto_15812 ) ) ( not ( = ?auto_15774 ?auto_15779 ) ) ( not ( = ?auto_15774 ?auto_15812 ) ) ( not ( = ?auto_15775 ?auto_15779 ) ) ( not ( = ?auto_15775 ?auto_15812 ) ) ( not ( = ?auto_15776 ?auto_15779 ) ) ( not ( = ?auto_15776 ?auto_15812 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15812 ) ) ( not ( = ?auto_15779 ?auto_15799 ) ) ( not ( = ?auto_15779 ?auto_15802 ) ) ( not ( = ?auto_15779 ?auto_15805 ) ) ( not ( = ?auto_15779 ?auto_15804 ) ) ( not ( = ?auto_15779 ?auto_15809 ) ) ( not ( = ?auto_15779 ?auto_15810 ) ) ( not ( = ?auto_15779 ?auto_15791 ) ) ( not ( = ?auto_15779 ?auto_15796 ) ) ( not ( = ?auto_15779 ?auto_15790 ) ) ( not ( = ?auto_15779 ?auto_15793 ) ) ( not ( = ?auto_15797 ?auto_15795 ) ) ( not ( = ?auto_15797 ?auto_15788 ) ) ( not ( = ?auto_15797 ?auto_15806 ) ) ( not ( = ?auto_15797 ?auto_15803 ) ) ( not ( = ?auto_15797 ?auto_15794 ) ) ( not ( = ?auto_15797 ?auto_15785 ) ) ( not ( = ?auto_15797 ?auto_15811 ) ) ( not ( = ?auto_15798 ?auto_15800 ) ) ( not ( = ?auto_15798 ?auto_15813 ) ) ( not ( = ?auto_15798 ?auto_15789 ) ) ( not ( = ?auto_15798 ?auto_15807 ) ) ( not ( = ?auto_15798 ?auto_15801 ) ) ( not ( = ?auto_15798 ?auto_15784 ) ) ( not ( = ?auto_15798 ?auto_15808 ) ) ( not ( = ?auto_15812 ?auto_15799 ) ) ( not ( = ?auto_15812 ?auto_15802 ) ) ( not ( = ?auto_15812 ?auto_15805 ) ) ( not ( = ?auto_15812 ?auto_15804 ) ) ( not ( = ?auto_15812 ?auto_15809 ) ) ( not ( = ?auto_15812 ?auto_15810 ) ) ( not ( = ?auto_15812 ?auto_15791 ) ) ( not ( = ?auto_15812 ?auto_15796 ) ) ( not ( = ?auto_15812 ?auto_15790 ) ) ( not ( = ?auto_15812 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15780 ) ) ( not ( = ?auto_15768 ?auto_15792 ) ) ( not ( = ?auto_15769 ?auto_15780 ) ) ( not ( = ?auto_15769 ?auto_15792 ) ) ( not ( = ?auto_15770 ?auto_15780 ) ) ( not ( = ?auto_15770 ?auto_15792 ) ) ( not ( = ?auto_15771 ?auto_15780 ) ) ( not ( = ?auto_15771 ?auto_15792 ) ) ( not ( = ?auto_15772 ?auto_15780 ) ) ( not ( = ?auto_15772 ?auto_15792 ) ) ( not ( = ?auto_15773 ?auto_15780 ) ) ( not ( = ?auto_15773 ?auto_15792 ) ) ( not ( = ?auto_15774 ?auto_15780 ) ) ( not ( = ?auto_15774 ?auto_15792 ) ) ( not ( = ?auto_15775 ?auto_15780 ) ) ( not ( = ?auto_15775 ?auto_15792 ) ) ( not ( = ?auto_15776 ?auto_15780 ) ) ( not ( = ?auto_15776 ?auto_15792 ) ) ( not ( = ?auto_15777 ?auto_15780 ) ) ( not ( = ?auto_15777 ?auto_15792 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15792 ) ) ( not ( = ?auto_15780 ?auto_15812 ) ) ( not ( = ?auto_15780 ?auto_15799 ) ) ( not ( = ?auto_15780 ?auto_15802 ) ) ( not ( = ?auto_15780 ?auto_15805 ) ) ( not ( = ?auto_15780 ?auto_15804 ) ) ( not ( = ?auto_15780 ?auto_15809 ) ) ( not ( = ?auto_15780 ?auto_15810 ) ) ( not ( = ?auto_15780 ?auto_15791 ) ) ( not ( = ?auto_15780 ?auto_15796 ) ) ( not ( = ?auto_15780 ?auto_15790 ) ) ( not ( = ?auto_15780 ?auto_15793 ) ) ( not ( = ?auto_15792 ?auto_15812 ) ) ( not ( = ?auto_15792 ?auto_15799 ) ) ( not ( = ?auto_15792 ?auto_15802 ) ) ( not ( = ?auto_15792 ?auto_15805 ) ) ( not ( = ?auto_15792 ?auto_15804 ) ) ( not ( = ?auto_15792 ?auto_15809 ) ) ( not ( = ?auto_15792 ?auto_15810 ) ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( not ( = ?auto_15792 ?auto_15796 ) ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15781 ) ) ( not ( = ?auto_15768 ?auto_15786 ) ) ( not ( = ?auto_15769 ?auto_15781 ) ) ( not ( = ?auto_15769 ?auto_15786 ) ) ( not ( = ?auto_15770 ?auto_15781 ) ) ( not ( = ?auto_15770 ?auto_15786 ) ) ( not ( = ?auto_15771 ?auto_15781 ) ) ( not ( = ?auto_15771 ?auto_15786 ) ) ( not ( = ?auto_15772 ?auto_15781 ) ) ( not ( = ?auto_15772 ?auto_15786 ) ) ( not ( = ?auto_15773 ?auto_15781 ) ) ( not ( = ?auto_15773 ?auto_15786 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15774 ?auto_15786 ) ) ( not ( = ?auto_15775 ?auto_15781 ) ) ( not ( = ?auto_15775 ?auto_15786 ) ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( not ( = ?auto_15776 ?auto_15786 ) ) ( not ( = ?auto_15777 ?auto_15781 ) ) ( not ( = ?auto_15777 ?auto_15786 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15786 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15786 ) ) ( not ( = ?auto_15781 ?auto_15792 ) ) ( not ( = ?auto_15781 ?auto_15812 ) ) ( not ( = ?auto_15781 ?auto_15799 ) ) ( not ( = ?auto_15781 ?auto_15802 ) ) ( not ( = ?auto_15781 ?auto_15805 ) ) ( not ( = ?auto_15781 ?auto_15804 ) ) ( not ( = ?auto_15781 ?auto_15809 ) ) ( not ( = ?auto_15781 ?auto_15810 ) ) ( not ( = ?auto_15781 ?auto_15791 ) ) ( not ( = ?auto_15781 ?auto_15796 ) ) ( not ( = ?auto_15781 ?auto_15790 ) ) ( not ( = ?auto_15781 ?auto_15793 ) ) ( not ( = ?auto_15786 ?auto_15792 ) ) ( not ( = ?auto_15786 ?auto_15812 ) ) ( not ( = ?auto_15786 ?auto_15799 ) ) ( not ( = ?auto_15786 ?auto_15802 ) ) ( not ( = ?auto_15786 ?auto_15805 ) ) ( not ( = ?auto_15786 ?auto_15804 ) ) ( not ( = ?auto_15786 ?auto_15809 ) ) ( not ( = ?auto_15786 ?auto_15810 ) ) ( not ( = ?auto_15786 ?auto_15791 ) ) ( not ( = ?auto_15786 ?auto_15796 ) ) ( not ( = ?auto_15786 ?auto_15790 ) ) ( not ( = ?auto_15786 ?auto_15793 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15776 ?auto_15777 ?auto_15778 ?auto_15779 ?auto_15780 )
      ( MAKE-1CRATE ?auto_15780 ?auto_15781 )
      ( MAKE-13CRATE-VERIFY ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15776 ?auto_15777 ?auto_15778 ?auto_15779 ?auto_15780 ?auto_15781 ) )
  )

)

