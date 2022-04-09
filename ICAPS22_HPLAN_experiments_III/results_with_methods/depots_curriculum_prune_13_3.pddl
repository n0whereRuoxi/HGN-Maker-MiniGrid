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
      ?auto_15244 - HOIST
      ?auto_15245 - PLACE
      ?auto_15247 - PLACE
      ?auto_15246 - HOIST
      ?auto_15242 - SURFACE
      ?auto_15248 - PLACE
      ?auto_15250 - HOIST
      ?auto_15249 - SURFACE
      ?auto_15243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15244 ?auto_15245 ) ( IS-CRATE ?auto_15241 ) ( not ( = ?auto_15247 ?auto_15245 ) ) ( HOIST-AT ?auto_15246 ?auto_15247 ) ( AVAILABLE ?auto_15246 ) ( SURFACE-AT ?auto_15241 ?auto_15247 ) ( ON ?auto_15241 ?auto_15242 ) ( CLEAR ?auto_15241 ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15242 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( SURFACE-AT ?auto_15239 ?auto_15245 ) ( CLEAR ?auto_15239 ) ( IS-CRATE ?auto_15240 ) ( AVAILABLE ?auto_15244 ) ( not ( = ?auto_15248 ?auto_15245 ) ) ( HOIST-AT ?auto_15250 ?auto_15248 ) ( AVAILABLE ?auto_15250 ) ( SURFACE-AT ?auto_15240 ?auto_15248 ) ( ON ?auto_15240 ?auto_15249 ) ( CLEAR ?auto_15240 ) ( TRUCK-AT ?auto_15243 ?auto_15245 ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15249 ) ) ( not ( = ?auto_15240 ?auto_15249 ) ) ( not ( = ?auto_15244 ?auto_15250 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( not ( = ?auto_15239 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15249 ) ) ( not ( = ?auto_15247 ?auto_15248 ) ) ( not ( = ?auto_15246 ?auto_15250 ) ) ( not ( = ?auto_15242 ?auto_15249 ) ) )
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
      ?auto_15271 - HOIST
      ?auto_15272 - PLACE
      ?auto_15269 - PLACE
      ?auto_15273 - HOIST
      ?auto_15274 - SURFACE
      ?auto_15275 - PLACE
      ?auto_15276 - HOIST
      ?auto_15279 - SURFACE
      ?auto_15280 - PLACE
      ?auto_15277 - HOIST
      ?auto_15278 - SURFACE
      ?auto_15270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15271 ?auto_15272 ) ( IS-CRATE ?auto_15268 ) ( not ( = ?auto_15269 ?auto_15272 ) ) ( HOIST-AT ?auto_15273 ?auto_15269 ) ( AVAILABLE ?auto_15273 ) ( SURFACE-AT ?auto_15268 ?auto_15269 ) ( ON ?auto_15268 ?auto_15274 ) ( CLEAR ?auto_15268 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15274 ) ) ( not ( = ?auto_15268 ?auto_15274 ) ) ( not ( = ?auto_15271 ?auto_15273 ) ) ( IS-CRATE ?auto_15267 ) ( not ( = ?auto_15275 ?auto_15272 ) ) ( HOIST-AT ?auto_15276 ?auto_15275 ) ( AVAILABLE ?auto_15276 ) ( SURFACE-AT ?auto_15267 ?auto_15275 ) ( ON ?auto_15267 ?auto_15279 ) ( CLEAR ?auto_15267 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15279 ) ) ( not ( = ?auto_15267 ?auto_15279 ) ) ( not ( = ?auto_15271 ?auto_15276 ) ) ( SURFACE-AT ?auto_15265 ?auto_15272 ) ( CLEAR ?auto_15265 ) ( IS-CRATE ?auto_15266 ) ( AVAILABLE ?auto_15271 ) ( not ( = ?auto_15280 ?auto_15272 ) ) ( HOIST-AT ?auto_15277 ?auto_15280 ) ( AVAILABLE ?auto_15277 ) ( SURFACE-AT ?auto_15266 ?auto_15280 ) ( ON ?auto_15266 ?auto_15278 ) ( CLEAR ?auto_15266 ) ( TRUCK-AT ?auto_15270 ?auto_15272 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15278 ) ) ( not ( = ?auto_15266 ?auto_15278 ) ) ( not ( = ?auto_15271 ?auto_15277 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15279 ) ) ( not ( = ?auto_15267 ?auto_15278 ) ) ( not ( = ?auto_15275 ?auto_15280 ) ) ( not ( = ?auto_15276 ?auto_15277 ) ) ( not ( = ?auto_15279 ?auto_15278 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15274 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15274 ) ) ( not ( = ?auto_15268 ?auto_15279 ) ) ( not ( = ?auto_15268 ?auto_15278 ) ) ( not ( = ?auto_15269 ?auto_15275 ) ) ( not ( = ?auto_15269 ?auto_15280 ) ) ( not ( = ?auto_15273 ?auto_15276 ) ) ( not ( = ?auto_15273 ?auto_15277 ) ) ( not ( = ?auto_15274 ?auto_15279 ) ) ( not ( = ?auto_15274 ?auto_15278 ) ) )
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
      ?auto_15302 - HOIST
      ?auto_15306 - PLACE
      ?auto_15304 - PLACE
      ?auto_15301 - HOIST
      ?auto_15305 - SURFACE
      ?auto_15308 - PLACE
      ?auto_15309 - HOIST
      ?auto_15315 - SURFACE
      ?auto_15311 - PLACE
      ?auto_15310 - HOIST
      ?auto_15313 - SURFACE
      ?auto_15312 - PLACE
      ?auto_15307 - HOIST
      ?auto_15314 - SURFACE
      ?auto_15303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15302 ?auto_15306 ) ( IS-CRATE ?auto_15300 ) ( not ( = ?auto_15304 ?auto_15306 ) ) ( HOIST-AT ?auto_15301 ?auto_15304 ) ( AVAILABLE ?auto_15301 ) ( SURFACE-AT ?auto_15300 ?auto_15304 ) ( ON ?auto_15300 ?auto_15305 ) ( CLEAR ?auto_15300 ) ( not ( = ?auto_15299 ?auto_15300 ) ) ( not ( = ?auto_15299 ?auto_15305 ) ) ( not ( = ?auto_15300 ?auto_15305 ) ) ( not ( = ?auto_15302 ?auto_15301 ) ) ( IS-CRATE ?auto_15299 ) ( not ( = ?auto_15308 ?auto_15306 ) ) ( HOIST-AT ?auto_15309 ?auto_15308 ) ( AVAILABLE ?auto_15309 ) ( SURFACE-AT ?auto_15299 ?auto_15308 ) ( ON ?auto_15299 ?auto_15315 ) ( CLEAR ?auto_15299 ) ( not ( = ?auto_15298 ?auto_15299 ) ) ( not ( = ?auto_15298 ?auto_15315 ) ) ( not ( = ?auto_15299 ?auto_15315 ) ) ( not ( = ?auto_15302 ?auto_15309 ) ) ( IS-CRATE ?auto_15298 ) ( not ( = ?auto_15311 ?auto_15306 ) ) ( HOIST-AT ?auto_15310 ?auto_15311 ) ( AVAILABLE ?auto_15310 ) ( SURFACE-AT ?auto_15298 ?auto_15311 ) ( ON ?auto_15298 ?auto_15313 ) ( CLEAR ?auto_15298 ) ( not ( = ?auto_15297 ?auto_15298 ) ) ( not ( = ?auto_15297 ?auto_15313 ) ) ( not ( = ?auto_15298 ?auto_15313 ) ) ( not ( = ?auto_15302 ?auto_15310 ) ) ( SURFACE-AT ?auto_15296 ?auto_15306 ) ( CLEAR ?auto_15296 ) ( IS-CRATE ?auto_15297 ) ( AVAILABLE ?auto_15302 ) ( not ( = ?auto_15312 ?auto_15306 ) ) ( HOIST-AT ?auto_15307 ?auto_15312 ) ( AVAILABLE ?auto_15307 ) ( SURFACE-AT ?auto_15297 ?auto_15312 ) ( ON ?auto_15297 ?auto_15314 ) ( CLEAR ?auto_15297 ) ( TRUCK-AT ?auto_15303 ?auto_15306 ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15314 ) ) ( not ( = ?auto_15297 ?auto_15314 ) ) ( not ( = ?auto_15302 ?auto_15307 ) ) ( not ( = ?auto_15296 ?auto_15298 ) ) ( not ( = ?auto_15296 ?auto_15313 ) ) ( not ( = ?auto_15298 ?auto_15314 ) ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( not ( = ?auto_15310 ?auto_15307 ) ) ( not ( = ?auto_15313 ?auto_15314 ) ) ( not ( = ?auto_15296 ?auto_15299 ) ) ( not ( = ?auto_15296 ?auto_15315 ) ) ( not ( = ?auto_15297 ?auto_15299 ) ) ( not ( = ?auto_15297 ?auto_15315 ) ) ( not ( = ?auto_15299 ?auto_15313 ) ) ( not ( = ?auto_15299 ?auto_15314 ) ) ( not ( = ?auto_15308 ?auto_15311 ) ) ( not ( = ?auto_15308 ?auto_15312 ) ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15307 ) ) ( not ( = ?auto_15315 ?auto_15313 ) ) ( not ( = ?auto_15315 ?auto_15314 ) ) ( not ( = ?auto_15296 ?auto_15300 ) ) ( not ( = ?auto_15296 ?auto_15305 ) ) ( not ( = ?auto_15297 ?auto_15300 ) ) ( not ( = ?auto_15297 ?auto_15305 ) ) ( not ( = ?auto_15298 ?auto_15300 ) ) ( not ( = ?auto_15298 ?auto_15305 ) ) ( not ( = ?auto_15300 ?auto_15315 ) ) ( not ( = ?auto_15300 ?auto_15313 ) ) ( not ( = ?auto_15300 ?auto_15314 ) ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( not ( = ?auto_15304 ?auto_15311 ) ) ( not ( = ?auto_15304 ?auto_15312 ) ) ( not ( = ?auto_15301 ?auto_15309 ) ) ( not ( = ?auto_15301 ?auto_15310 ) ) ( not ( = ?auto_15301 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15315 ) ) ( not ( = ?auto_15305 ?auto_15313 ) ) ( not ( = ?auto_15305 ?auto_15314 ) ) )
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
      ?auto_15339 - HOIST
      ?auto_15343 - PLACE
      ?auto_15342 - PLACE
      ?auto_15340 - HOIST
      ?auto_15341 - SURFACE
      ?auto_15347 - PLACE
      ?auto_15352 - HOIST
      ?auto_15349 - SURFACE
      ?auto_15346 - PLACE
      ?auto_15353 - HOIST
      ?auto_15351 - SURFACE
      ?auto_15344 - PLACE
      ?auto_15345 - HOIST
      ?auto_15350 - SURFACE
      ?auto_15348 - SURFACE
      ?auto_15338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15339 ?auto_15343 ) ( IS-CRATE ?auto_15337 ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( HOIST-AT ?auto_15340 ?auto_15342 ) ( SURFACE-AT ?auto_15337 ?auto_15342 ) ( ON ?auto_15337 ?auto_15341 ) ( CLEAR ?auto_15337 ) ( not ( = ?auto_15336 ?auto_15337 ) ) ( not ( = ?auto_15336 ?auto_15341 ) ) ( not ( = ?auto_15337 ?auto_15341 ) ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( IS-CRATE ?auto_15336 ) ( not ( = ?auto_15347 ?auto_15343 ) ) ( HOIST-AT ?auto_15352 ?auto_15347 ) ( AVAILABLE ?auto_15352 ) ( SURFACE-AT ?auto_15336 ?auto_15347 ) ( ON ?auto_15336 ?auto_15349 ) ( CLEAR ?auto_15336 ) ( not ( = ?auto_15335 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15349 ) ) ( not ( = ?auto_15336 ?auto_15349 ) ) ( not ( = ?auto_15339 ?auto_15352 ) ) ( IS-CRATE ?auto_15335 ) ( not ( = ?auto_15346 ?auto_15343 ) ) ( HOIST-AT ?auto_15353 ?auto_15346 ) ( AVAILABLE ?auto_15353 ) ( SURFACE-AT ?auto_15335 ?auto_15346 ) ( ON ?auto_15335 ?auto_15351 ) ( CLEAR ?auto_15335 ) ( not ( = ?auto_15334 ?auto_15335 ) ) ( not ( = ?auto_15334 ?auto_15351 ) ) ( not ( = ?auto_15335 ?auto_15351 ) ) ( not ( = ?auto_15339 ?auto_15353 ) ) ( IS-CRATE ?auto_15334 ) ( not ( = ?auto_15344 ?auto_15343 ) ) ( HOIST-AT ?auto_15345 ?auto_15344 ) ( AVAILABLE ?auto_15345 ) ( SURFACE-AT ?auto_15334 ?auto_15344 ) ( ON ?auto_15334 ?auto_15350 ) ( CLEAR ?auto_15334 ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15350 ) ) ( not ( = ?auto_15334 ?auto_15350 ) ) ( not ( = ?auto_15339 ?auto_15345 ) ) ( SURFACE-AT ?auto_15332 ?auto_15343 ) ( CLEAR ?auto_15332 ) ( IS-CRATE ?auto_15333 ) ( AVAILABLE ?auto_15339 ) ( AVAILABLE ?auto_15340 ) ( SURFACE-AT ?auto_15333 ?auto_15342 ) ( ON ?auto_15333 ?auto_15348 ) ( CLEAR ?auto_15333 ) ( TRUCK-AT ?auto_15338 ?auto_15343 ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( not ( = ?auto_15332 ?auto_15348 ) ) ( not ( = ?auto_15333 ?auto_15348 ) ) ( not ( = ?auto_15332 ?auto_15334 ) ) ( not ( = ?auto_15332 ?auto_15350 ) ) ( not ( = ?auto_15334 ?auto_15348 ) ) ( not ( = ?auto_15344 ?auto_15342 ) ) ( not ( = ?auto_15345 ?auto_15340 ) ) ( not ( = ?auto_15350 ?auto_15348 ) ) ( not ( = ?auto_15332 ?auto_15335 ) ) ( not ( = ?auto_15332 ?auto_15351 ) ) ( not ( = ?auto_15333 ?auto_15335 ) ) ( not ( = ?auto_15333 ?auto_15351 ) ) ( not ( = ?auto_15335 ?auto_15350 ) ) ( not ( = ?auto_15335 ?auto_15348 ) ) ( not ( = ?auto_15346 ?auto_15344 ) ) ( not ( = ?auto_15346 ?auto_15342 ) ) ( not ( = ?auto_15353 ?auto_15345 ) ) ( not ( = ?auto_15353 ?auto_15340 ) ) ( not ( = ?auto_15351 ?auto_15350 ) ) ( not ( = ?auto_15351 ?auto_15348 ) ) ( not ( = ?auto_15332 ?auto_15336 ) ) ( not ( = ?auto_15332 ?auto_15349 ) ) ( not ( = ?auto_15333 ?auto_15336 ) ) ( not ( = ?auto_15333 ?auto_15349 ) ) ( not ( = ?auto_15334 ?auto_15336 ) ) ( not ( = ?auto_15334 ?auto_15349 ) ) ( not ( = ?auto_15336 ?auto_15351 ) ) ( not ( = ?auto_15336 ?auto_15350 ) ) ( not ( = ?auto_15336 ?auto_15348 ) ) ( not ( = ?auto_15347 ?auto_15346 ) ) ( not ( = ?auto_15347 ?auto_15344 ) ) ( not ( = ?auto_15347 ?auto_15342 ) ) ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15352 ?auto_15345 ) ) ( not ( = ?auto_15352 ?auto_15340 ) ) ( not ( = ?auto_15349 ?auto_15351 ) ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15348 ) ) ( not ( = ?auto_15332 ?auto_15337 ) ) ( not ( = ?auto_15332 ?auto_15341 ) ) ( not ( = ?auto_15333 ?auto_15337 ) ) ( not ( = ?auto_15333 ?auto_15341 ) ) ( not ( = ?auto_15334 ?auto_15337 ) ) ( not ( = ?auto_15334 ?auto_15341 ) ) ( not ( = ?auto_15335 ?auto_15337 ) ) ( not ( = ?auto_15335 ?auto_15341 ) ) ( not ( = ?auto_15337 ?auto_15349 ) ) ( not ( = ?auto_15337 ?auto_15351 ) ) ( not ( = ?auto_15337 ?auto_15350 ) ) ( not ( = ?auto_15337 ?auto_15348 ) ) ( not ( = ?auto_15341 ?auto_15349 ) ) ( not ( = ?auto_15341 ?auto_15351 ) ) ( not ( = ?auto_15341 ?auto_15350 ) ) ( not ( = ?auto_15341 ?auto_15348 ) ) )
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
      ?auto_15382 - HOIST
      ?auto_15381 - PLACE
      ?auto_15379 - PLACE
      ?auto_15380 - HOIST
      ?auto_15378 - SURFACE
      ?auto_15387 - PLACE
      ?auto_15386 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15388 - PLACE
      ?auto_15389 - HOIST
      ?auto_15390 - SURFACE
      ?auto_15393 - PLACE
      ?auto_15384 - HOIST
      ?auto_15392 - SURFACE
      ?auto_15395 - PLACE
      ?auto_15394 - HOIST
      ?auto_15396 - SURFACE
      ?auto_15391 - SURFACE
      ?auto_15383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15382 ?auto_15381 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15379 ?auto_15381 ) ) ( HOIST-AT ?auto_15380 ?auto_15379 ) ( AVAILABLE ?auto_15380 ) ( SURFACE-AT ?auto_15377 ?auto_15379 ) ( ON ?auto_15377 ?auto_15378 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15378 ) ) ( not ( = ?auto_15382 ?auto_15380 ) ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15387 ?auto_15381 ) ) ( HOIST-AT ?auto_15386 ?auto_15387 ) ( SURFACE-AT ?auto_15376 ?auto_15387 ) ( ON ?auto_15376 ?auto_15385 ) ( CLEAR ?auto_15376 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15385 ) ) ( not ( = ?auto_15376 ?auto_15385 ) ) ( not ( = ?auto_15382 ?auto_15386 ) ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15388 ?auto_15381 ) ) ( HOIST-AT ?auto_15389 ?auto_15388 ) ( AVAILABLE ?auto_15389 ) ( SURFACE-AT ?auto_15375 ?auto_15388 ) ( ON ?auto_15375 ?auto_15390 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15390 ) ) ( not ( = ?auto_15375 ?auto_15390 ) ) ( not ( = ?auto_15382 ?auto_15389 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15393 ?auto_15381 ) ) ( HOIST-AT ?auto_15384 ?auto_15393 ) ( AVAILABLE ?auto_15384 ) ( SURFACE-AT ?auto_15374 ?auto_15393 ) ( ON ?auto_15374 ?auto_15392 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15392 ) ) ( not ( = ?auto_15374 ?auto_15392 ) ) ( not ( = ?auto_15382 ?auto_15384 ) ) ( IS-CRATE ?auto_15373 ) ( not ( = ?auto_15395 ?auto_15381 ) ) ( HOIST-AT ?auto_15394 ?auto_15395 ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15373 ?auto_15395 ) ( ON ?auto_15373 ?auto_15396 ) ( CLEAR ?auto_15373 ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15396 ) ) ( not ( = ?auto_15373 ?auto_15396 ) ) ( not ( = ?auto_15382 ?auto_15394 ) ) ( SURFACE-AT ?auto_15371 ?auto_15381 ) ( CLEAR ?auto_15371 ) ( IS-CRATE ?auto_15372 ) ( AVAILABLE ?auto_15382 ) ( AVAILABLE ?auto_15386 ) ( SURFACE-AT ?auto_15372 ?auto_15387 ) ( ON ?auto_15372 ?auto_15391 ) ( CLEAR ?auto_15372 ) ( TRUCK-AT ?auto_15383 ?auto_15381 ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15391 ) ) ( not ( = ?auto_15372 ?auto_15391 ) ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15396 ) ) ( not ( = ?auto_15373 ?auto_15391 ) ) ( not ( = ?auto_15395 ?auto_15387 ) ) ( not ( = ?auto_15394 ?auto_15386 ) ) ( not ( = ?auto_15396 ?auto_15391 ) ) ( not ( = ?auto_15371 ?auto_15374 ) ) ( not ( = ?auto_15371 ?auto_15392 ) ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15392 ) ) ( not ( = ?auto_15374 ?auto_15396 ) ) ( not ( = ?auto_15374 ?auto_15391 ) ) ( not ( = ?auto_15393 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15387 ) ) ( not ( = ?auto_15384 ?auto_15394 ) ) ( not ( = ?auto_15384 ?auto_15386 ) ) ( not ( = ?auto_15392 ?auto_15396 ) ) ( not ( = ?auto_15392 ?auto_15391 ) ) ( not ( = ?auto_15371 ?auto_15375 ) ) ( not ( = ?auto_15371 ?auto_15390 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15390 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15390 ) ) ( not ( = ?auto_15375 ?auto_15392 ) ) ( not ( = ?auto_15375 ?auto_15396 ) ) ( not ( = ?auto_15375 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15393 ) ) ( not ( = ?auto_15388 ?auto_15395 ) ) ( not ( = ?auto_15388 ?auto_15387 ) ) ( not ( = ?auto_15389 ?auto_15384 ) ) ( not ( = ?auto_15389 ?auto_15394 ) ) ( not ( = ?auto_15389 ?auto_15386 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15396 ) ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15371 ?auto_15376 ) ) ( not ( = ?auto_15371 ?auto_15385 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15385 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15385 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15385 ) ) ( not ( = ?auto_15376 ?auto_15390 ) ) ( not ( = ?auto_15376 ?auto_15392 ) ) ( not ( = ?auto_15376 ?auto_15396 ) ) ( not ( = ?auto_15376 ?auto_15391 ) ) ( not ( = ?auto_15385 ?auto_15390 ) ) ( not ( = ?auto_15385 ?auto_15392 ) ) ( not ( = ?auto_15385 ?auto_15396 ) ) ( not ( = ?auto_15385 ?auto_15391 ) ) ( not ( = ?auto_15371 ?auto_15377 ) ) ( not ( = ?auto_15371 ?auto_15378 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15372 ?auto_15378 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) ( not ( = ?auto_15373 ?auto_15378 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15378 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15385 ) ) ( not ( = ?auto_15377 ?auto_15390 ) ) ( not ( = ?auto_15377 ?auto_15392 ) ) ( not ( = ?auto_15377 ?auto_15396 ) ) ( not ( = ?auto_15377 ?auto_15391 ) ) ( not ( = ?auto_15379 ?auto_15387 ) ) ( not ( = ?auto_15379 ?auto_15388 ) ) ( not ( = ?auto_15379 ?auto_15393 ) ) ( not ( = ?auto_15379 ?auto_15395 ) ) ( not ( = ?auto_15380 ?auto_15386 ) ) ( not ( = ?auto_15380 ?auto_15389 ) ) ( not ( = ?auto_15380 ?auto_15384 ) ) ( not ( = ?auto_15380 ?auto_15394 ) ) ( not ( = ?auto_15378 ?auto_15385 ) ) ( not ( = ?auto_15378 ?auto_15390 ) ) ( not ( = ?auto_15378 ?auto_15392 ) ) ( not ( = ?auto_15378 ?auto_15396 ) ) ( not ( = ?auto_15378 ?auto_15391 ) ) )
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
      ?auto_15427 - HOIST
      ?auto_15428 - PLACE
      ?auto_15426 - PLACE
      ?auto_15425 - HOIST
      ?auto_15423 - SURFACE
      ?auto_15440 - PLACE
      ?auto_15441 - HOIST
      ?auto_15442 - SURFACE
      ?auto_15438 - PLACE
      ?auto_15433 - HOIST
      ?auto_15431 - SURFACE
      ?auto_15437 - PLACE
      ?auto_15435 - HOIST
      ?auto_15439 - SURFACE
      ?auto_15432 - PLACE
      ?auto_15443 - HOIST
      ?auto_15430 - SURFACE
      ?auto_15429 - PLACE
      ?auto_15444 - HOIST
      ?auto_15436 - SURFACE
      ?auto_15434 - SURFACE
      ?auto_15424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15427 ?auto_15428 ) ( IS-CRATE ?auto_15422 ) ( not ( = ?auto_15426 ?auto_15428 ) ) ( HOIST-AT ?auto_15425 ?auto_15426 ) ( AVAILABLE ?auto_15425 ) ( SURFACE-AT ?auto_15422 ?auto_15426 ) ( ON ?auto_15422 ?auto_15423 ) ( CLEAR ?auto_15422 ) ( not ( = ?auto_15421 ?auto_15422 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( not ( = ?auto_15427 ?auto_15425 ) ) ( IS-CRATE ?auto_15421 ) ( not ( = ?auto_15440 ?auto_15428 ) ) ( HOIST-AT ?auto_15441 ?auto_15440 ) ( AVAILABLE ?auto_15441 ) ( SURFACE-AT ?auto_15421 ?auto_15440 ) ( ON ?auto_15421 ?auto_15442 ) ( CLEAR ?auto_15421 ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15442 ) ) ( not ( = ?auto_15421 ?auto_15442 ) ) ( not ( = ?auto_15427 ?auto_15441 ) ) ( IS-CRATE ?auto_15420 ) ( not ( = ?auto_15438 ?auto_15428 ) ) ( HOIST-AT ?auto_15433 ?auto_15438 ) ( SURFACE-AT ?auto_15420 ?auto_15438 ) ( ON ?auto_15420 ?auto_15431 ) ( CLEAR ?auto_15420 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15431 ) ) ( not ( = ?auto_15420 ?auto_15431 ) ) ( not ( = ?auto_15427 ?auto_15433 ) ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15437 ?auto_15428 ) ) ( HOIST-AT ?auto_15435 ?auto_15437 ) ( AVAILABLE ?auto_15435 ) ( SURFACE-AT ?auto_15419 ?auto_15437 ) ( ON ?auto_15419 ?auto_15439 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15439 ) ) ( not ( = ?auto_15419 ?auto_15439 ) ) ( not ( = ?auto_15427 ?auto_15435 ) ) ( IS-CRATE ?auto_15418 ) ( not ( = ?auto_15432 ?auto_15428 ) ) ( HOIST-AT ?auto_15443 ?auto_15432 ) ( AVAILABLE ?auto_15443 ) ( SURFACE-AT ?auto_15418 ?auto_15432 ) ( ON ?auto_15418 ?auto_15430 ) ( CLEAR ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15430 ) ) ( not ( = ?auto_15418 ?auto_15430 ) ) ( not ( = ?auto_15427 ?auto_15443 ) ) ( IS-CRATE ?auto_15417 ) ( not ( = ?auto_15429 ?auto_15428 ) ) ( HOIST-AT ?auto_15444 ?auto_15429 ) ( AVAILABLE ?auto_15444 ) ( SURFACE-AT ?auto_15417 ?auto_15429 ) ( ON ?auto_15417 ?auto_15436 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15436 ) ) ( not ( = ?auto_15417 ?auto_15436 ) ) ( not ( = ?auto_15427 ?auto_15444 ) ) ( SURFACE-AT ?auto_15415 ?auto_15428 ) ( CLEAR ?auto_15415 ) ( IS-CRATE ?auto_15416 ) ( AVAILABLE ?auto_15427 ) ( AVAILABLE ?auto_15433 ) ( SURFACE-AT ?auto_15416 ?auto_15438 ) ( ON ?auto_15416 ?auto_15434 ) ( CLEAR ?auto_15416 ) ( TRUCK-AT ?auto_15424 ?auto_15428 ) ( not ( = ?auto_15415 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15434 ) ) ( not ( = ?auto_15416 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15436 ) ) ( not ( = ?auto_15417 ?auto_15434 ) ) ( not ( = ?auto_15429 ?auto_15438 ) ) ( not ( = ?auto_15444 ?auto_15433 ) ) ( not ( = ?auto_15436 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15430 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15430 ) ) ( not ( = ?auto_15418 ?auto_15436 ) ) ( not ( = ?auto_15418 ?auto_15434 ) ) ( not ( = ?auto_15432 ?auto_15429 ) ) ( not ( = ?auto_15432 ?auto_15438 ) ) ( not ( = ?auto_15443 ?auto_15444 ) ) ( not ( = ?auto_15443 ?auto_15433 ) ) ( not ( = ?auto_15430 ?auto_15436 ) ) ( not ( = ?auto_15430 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15415 ?auto_15439 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15416 ?auto_15439 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15439 ) ) ( not ( = ?auto_15419 ?auto_15430 ) ) ( not ( = ?auto_15419 ?auto_15436 ) ) ( not ( = ?auto_15419 ?auto_15434 ) ) ( not ( = ?auto_15437 ?auto_15432 ) ) ( not ( = ?auto_15437 ?auto_15429 ) ) ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15435 ?auto_15443 ) ) ( not ( = ?auto_15435 ?auto_15444 ) ) ( not ( = ?auto_15435 ?auto_15433 ) ) ( not ( = ?auto_15439 ?auto_15430 ) ) ( not ( = ?auto_15439 ?auto_15436 ) ) ( not ( = ?auto_15439 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15420 ) ) ( not ( = ?auto_15415 ?auto_15431 ) ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( not ( = ?auto_15416 ?auto_15431 ) ) ( not ( = ?auto_15417 ?auto_15420 ) ) ( not ( = ?auto_15417 ?auto_15431 ) ) ( not ( = ?auto_15418 ?auto_15420 ) ) ( not ( = ?auto_15418 ?auto_15431 ) ) ( not ( = ?auto_15420 ?auto_15439 ) ) ( not ( = ?auto_15420 ?auto_15430 ) ) ( not ( = ?auto_15420 ?auto_15436 ) ) ( not ( = ?auto_15420 ?auto_15434 ) ) ( not ( = ?auto_15431 ?auto_15439 ) ) ( not ( = ?auto_15431 ?auto_15430 ) ) ( not ( = ?auto_15431 ?auto_15436 ) ) ( not ( = ?auto_15431 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15421 ) ) ( not ( = ?auto_15415 ?auto_15442 ) ) ( not ( = ?auto_15416 ?auto_15421 ) ) ( not ( = ?auto_15416 ?auto_15442 ) ) ( not ( = ?auto_15417 ?auto_15421 ) ) ( not ( = ?auto_15417 ?auto_15442 ) ) ( not ( = ?auto_15418 ?auto_15421 ) ) ( not ( = ?auto_15418 ?auto_15442 ) ) ( not ( = ?auto_15419 ?auto_15421 ) ) ( not ( = ?auto_15419 ?auto_15442 ) ) ( not ( = ?auto_15421 ?auto_15431 ) ) ( not ( = ?auto_15421 ?auto_15439 ) ) ( not ( = ?auto_15421 ?auto_15430 ) ) ( not ( = ?auto_15421 ?auto_15436 ) ) ( not ( = ?auto_15421 ?auto_15434 ) ) ( not ( = ?auto_15440 ?auto_15438 ) ) ( not ( = ?auto_15440 ?auto_15437 ) ) ( not ( = ?auto_15440 ?auto_15432 ) ) ( not ( = ?auto_15440 ?auto_15429 ) ) ( not ( = ?auto_15441 ?auto_15433 ) ) ( not ( = ?auto_15441 ?auto_15435 ) ) ( not ( = ?auto_15441 ?auto_15443 ) ) ( not ( = ?auto_15441 ?auto_15444 ) ) ( not ( = ?auto_15442 ?auto_15431 ) ) ( not ( = ?auto_15442 ?auto_15439 ) ) ( not ( = ?auto_15442 ?auto_15430 ) ) ( not ( = ?auto_15442 ?auto_15436 ) ) ( not ( = ?auto_15442 ?auto_15434 ) ) ( not ( = ?auto_15415 ?auto_15422 ) ) ( not ( = ?auto_15415 ?auto_15423 ) ) ( not ( = ?auto_15416 ?auto_15422 ) ) ( not ( = ?auto_15416 ?auto_15423 ) ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( not ( = ?auto_15417 ?auto_15423 ) ) ( not ( = ?auto_15418 ?auto_15422 ) ) ( not ( = ?auto_15418 ?auto_15423 ) ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15423 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15423 ) ) ( not ( = ?auto_15422 ?auto_15442 ) ) ( not ( = ?auto_15422 ?auto_15431 ) ) ( not ( = ?auto_15422 ?auto_15439 ) ) ( not ( = ?auto_15422 ?auto_15430 ) ) ( not ( = ?auto_15422 ?auto_15436 ) ) ( not ( = ?auto_15422 ?auto_15434 ) ) ( not ( = ?auto_15426 ?auto_15440 ) ) ( not ( = ?auto_15426 ?auto_15438 ) ) ( not ( = ?auto_15426 ?auto_15437 ) ) ( not ( = ?auto_15426 ?auto_15432 ) ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( not ( = ?auto_15425 ?auto_15441 ) ) ( not ( = ?auto_15425 ?auto_15433 ) ) ( not ( = ?auto_15425 ?auto_15435 ) ) ( not ( = ?auto_15425 ?auto_15443 ) ) ( not ( = ?auto_15425 ?auto_15444 ) ) ( not ( = ?auto_15423 ?auto_15442 ) ) ( not ( = ?auto_15423 ?auto_15431 ) ) ( not ( = ?auto_15423 ?auto_15439 ) ) ( not ( = ?auto_15423 ?auto_15430 ) ) ( not ( = ?auto_15423 ?auto_15436 ) ) ( not ( = ?auto_15423 ?auto_15434 ) ) )
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
      ?auto_15474 - HOIST
      ?auto_15475 - PLACE
      ?auto_15477 - PLACE
      ?auto_15478 - HOIST
      ?auto_15476 - SURFACE
      ?auto_15491 - PLACE
      ?auto_15481 - HOIST
      ?auto_15483 - SURFACE
      ?auto_15484 - PLACE
      ?auto_15493 - HOIST
      ?auto_15482 - SURFACE
      ?auto_15480 - PLACE
      ?auto_15485 - HOIST
      ?auto_15497 - SURFACE
      ?auto_15496 - PLACE
      ?auto_15489 - HOIST
      ?auto_15479 - SURFACE
      ?auto_15486 - PLACE
      ?auto_15494 - HOIST
      ?auto_15487 - SURFACE
      ?auto_15488 - PLACE
      ?auto_15495 - HOIST
      ?auto_15490 - SURFACE
      ?auto_15492 - SURFACE
      ?auto_15473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15474 ?auto_15475 ) ( IS-CRATE ?auto_15472 ) ( not ( = ?auto_15477 ?auto_15475 ) ) ( HOIST-AT ?auto_15478 ?auto_15477 ) ( AVAILABLE ?auto_15478 ) ( SURFACE-AT ?auto_15472 ?auto_15477 ) ( ON ?auto_15472 ?auto_15476 ) ( CLEAR ?auto_15472 ) ( not ( = ?auto_15471 ?auto_15472 ) ) ( not ( = ?auto_15471 ?auto_15476 ) ) ( not ( = ?auto_15472 ?auto_15476 ) ) ( not ( = ?auto_15474 ?auto_15478 ) ) ( IS-CRATE ?auto_15471 ) ( not ( = ?auto_15491 ?auto_15475 ) ) ( HOIST-AT ?auto_15481 ?auto_15491 ) ( AVAILABLE ?auto_15481 ) ( SURFACE-AT ?auto_15471 ?auto_15491 ) ( ON ?auto_15471 ?auto_15483 ) ( CLEAR ?auto_15471 ) ( not ( = ?auto_15470 ?auto_15471 ) ) ( not ( = ?auto_15470 ?auto_15483 ) ) ( not ( = ?auto_15471 ?auto_15483 ) ) ( not ( = ?auto_15474 ?auto_15481 ) ) ( IS-CRATE ?auto_15470 ) ( not ( = ?auto_15484 ?auto_15475 ) ) ( HOIST-AT ?auto_15493 ?auto_15484 ) ( AVAILABLE ?auto_15493 ) ( SURFACE-AT ?auto_15470 ?auto_15484 ) ( ON ?auto_15470 ?auto_15482 ) ( CLEAR ?auto_15470 ) ( not ( = ?auto_15469 ?auto_15470 ) ) ( not ( = ?auto_15469 ?auto_15482 ) ) ( not ( = ?auto_15470 ?auto_15482 ) ) ( not ( = ?auto_15474 ?auto_15493 ) ) ( IS-CRATE ?auto_15469 ) ( not ( = ?auto_15480 ?auto_15475 ) ) ( HOIST-AT ?auto_15485 ?auto_15480 ) ( SURFACE-AT ?auto_15469 ?auto_15480 ) ( ON ?auto_15469 ?auto_15497 ) ( CLEAR ?auto_15469 ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15497 ) ) ( not ( = ?auto_15469 ?auto_15497 ) ) ( not ( = ?auto_15474 ?auto_15485 ) ) ( IS-CRATE ?auto_15468 ) ( not ( = ?auto_15496 ?auto_15475 ) ) ( HOIST-AT ?auto_15489 ?auto_15496 ) ( AVAILABLE ?auto_15489 ) ( SURFACE-AT ?auto_15468 ?auto_15496 ) ( ON ?auto_15468 ?auto_15479 ) ( CLEAR ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15479 ) ) ( not ( = ?auto_15468 ?auto_15479 ) ) ( not ( = ?auto_15474 ?auto_15489 ) ) ( IS-CRATE ?auto_15467 ) ( not ( = ?auto_15486 ?auto_15475 ) ) ( HOIST-AT ?auto_15494 ?auto_15486 ) ( AVAILABLE ?auto_15494 ) ( SURFACE-AT ?auto_15467 ?auto_15486 ) ( ON ?auto_15467 ?auto_15487 ) ( CLEAR ?auto_15467 ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15487 ) ) ( not ( = ?auto_15467 ?auto_15487 ) ) ( not ( = ?auto_15474 ?auto_15494 ) ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15488 ?auto_15475 ) ) ( HOIST-AT ?auto_15495 ?auto_15488 ) ( AVAILABLE ?auto_15495 ) ( SURFACE-AT ?auto_15466 ?auto_15488 ) ( ON ?auto_15466 ?auto_15490 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15465 ?auto_15490 ) ) ( not ( = ?auto_15466 ?auto_15490 ) ) ( not ( = ?auto_15474 ?auto_15495 ) ) ( SURFACE-AT ?auto_15464 ?auto_15475 ) ( CLEAR ?auto_15464 ) ( IS-CRATE ?auto_15465 ) ( AVAILABLE ?auto_15474 ) ( AVAILABLE ?auto_15485 ) ( SURFACE-AT ?auto_15465 ?auto_15480 ) ( ON ?auto_15465 ?auto_15492 ) ( CLEAR ?auto_15465 ) ( TRUCK-AT ?auto_15473 ?auto_15475 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15464 ?auto_15492 ) ) ( not ( = ?auto_15465 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15464 ?auto_15490 ) ) ( not ( = ?auto_15466 ?auto_15492 ) ) ( not ( = ?auto_15488 ?auto_15480 ) ) ( not ( = ?auto_15495 ?auto_15485 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15464 ?auto_15487 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15487 ) ) ( not ( = ?auto_15467 ?auto_15490 ) ) ( not ( = ?auto_15467 ?auto_15492 ) ) ( not ( = ?auto_15486 ?auto_15488 ) ) ( not ( = ?auto_15486 ?auto_15480 ) ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15485 ) ) ( not ( = ?auto_15487 ?auto_15490 ) ) ( not ( = ?auto_15487 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15468 ) ) ( not ( = ?auto_15464 ?auto_15479 ) ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( not ( = ?auto_15465 ?auto_15479 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15479 ) ) ( not ( = ?auto_15468 ?auto_15487 ) ) ( not ( = ?auto_15468 ?auto_15490 ) ) ( not ( = ?auto_15468 ?auto_15492 ) ) ( not ( = ?auto_15496 ?auto_15486 ) ) ( not ( = ?auto_15496 ?auto_15488 ) ) ( not ( = ?auto_15496 ?auto_15480 ) ) ( not ( = ?auto_15489 ?auto_15494 ) ) ( not ( = ?auto_15489 ?auto_15495 ) ) ( not ( = ?auto_15489 ?auto_15485 ) ) ( not ( = ?auto_15479 ?auto_15487 ) ) ( not ( = ?auto_15479 ?auto_15490 ) ) ( not ( = ?auto_15479 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15469 ) ) ( not ( = ?auto_15464 ?auto_15497 ) ) ( not ( = ?auto_15465 ?auto_15469 ) ) ( not ( = ?auto_15465 ?auto_15497 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15497 ) ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15467 ?auto_15497 ) ) ( not ( = ?auto_15469 ?auto_15479 ) ) ( not ( = ?auto_15469 ?auto_15487 ) ) ( not ( = ?auto_15469 ?auto_15490 ) ) ( not ( = ?auto_15469 ?auto_15492 ) ) ( not ( = ?auto_15497 ?auto_15479 ) ) ( not ( = ?auto_15497 ?auto_15487 ) ) ( not ( = ?auto_15497 ?auto_15490 ) ) ( not ( = ?auto_15497 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15470 ) ) ( not ( = ?auto_15464 ?auto_15482 ) ) ( not ( = ?auto_15465 ?auto_15470 ) ) ( not ( = ?auto_15465 ?auto_15482 ) ) ( not ( = ?auto_15466 ?auto_15470 ) ) ( not ( = ?auto_15466 ?auto_15482 ) ) ( not ( = ?auto_15467 ?auto_15470 ) ) ( not ( = ?auto_15467 ?auto_15482 ) ) ( not ( = ?auto_15468 ?auto_15470 ) ) ( not ( = ?auto_15468 ?auto_15482 ) ) ( not ( = ?auto_15470 ?auto_15497 ) ) ( not ( = ?auto_15470 ?auto_15479 ) ) ( not ( = ?auto_15470 ?auto_15487 ) ) ( not ( = ?auto_15470 ?auto_15490 ) ) ( not ( = ?auto_15470 ?auto_15492 ) ) ( not ( = ?auto_15484 ?auto_15480 ) ) ( not ( = ?auto_15484 ?auto_15496 ) ) ( not ( = ?auto_15484 ?auto_15486 ) ) ( not ( = ?auto_15484 ?auto_15488 ) ) ( not ( = ?auto_15493 ?auto_15485 ) ) ( not ( = ?auto_15493 ?auto_15489 ) ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15495 ) ) ( not ( = ?auto_15482 ?auto_15497 ) ) ( not ( = ?auto_15482 ?auto_15479 ) ) ( not ( = ?auto_15482 ?auto_15487 ) ) ( not ( = ?auto_15482 ?auto_15490 ) ) ( not ( = ?auto_15482 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15471 ) ) ( not ( = ?auto_15464 ?auto_15483 ) ) ( not ( = ?auto_15465 ?auto_15471 ) ) ( not ( = ?auto_15465 ?auto_15483 ) ) ( not ( = ?auto_15466 ?auto_15471 ) ) ( not ( = ?auto_15466 ?auto_15483 ) ) ( not ( = ?auto_15467 ?auto_15471 ) ) ( not ( = ?auto_15467 ?auto_15483 ) ) ( not ( = ?auto_15468 ?auto_15471 ) ) ( not ( = ?auto_15468 ?auto_15483 ) ) ( not ( = ?auto_15469 ?auto_15471 ) ) ( not ( = ?auto_15469 ?auto_15483 ) ) ( not ( = ?auto_15471 ?auto_15482 ) ) ( not ( = ?auto_15471 ?auto_15497 ) ) ( not ( = ?auto_15471 ?auto_15479 ) ) ( not ( = ?auto_15471 ?auto_15487 ) ) ( not ( = ?auto_15471 ?auto_15490 ) ) ( not ( = ?auto_15471 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15484 ) ) ( not ( = ?auto_15491 ?auto_15480 ) ) ( not ( = ?auto_15491 ?auto_15496 ) ) ( not ( = ?auto_15491 ?auto_15486 ) ) ( not ( = ?auto_15491 ?auto_15488 ) ) ( not ( = ?auto_15481 ?auto_15493 ) ) ( not ( = ?auto_15481 ?auto_15485 ) ) ( not ( = ?auto_15481 ?auto_15489 ) ) ( not ( = ?auto_15481 ?auto_15494 ) ) ( not ( = ?auto_15481 ?auto_15495 ) ) ( not ( = ?auto_15483 ?auto_15482 ) ) ( not ( = ?auto_15483 ?auto_15497 ) ) ( not ( = ?auto_15483 ?auto_15479 ) ) ( not ( = ?auto_15483 ?auto_15487 ) ) ( not ( = ?auto_15483 ?auto_15490 ) ) ( not ( = ?auto_15483 ?auto_15492 ) ) ( not ( = ?auto_15464 ?auto_15472 ) ) ( not ( = ?auto_15464 ?auto_15476 ) ) ( not ( = ?auto_15465 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15476 ) ) ( not ( = ?auto_15466 ?auto_15472 ) ) ( not ( = ?auto_15466 ?auto_15476 ) ) ( not ( = ?auto_15467 ?auto_15472 ) ) ( not ( = ?auto_15467 ?auto_15476 ) ) ( not ( = ?auto_15468 ?auto_15472 ) ) ( not ( = ?auto_15468 ?auto_15476 ) ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15469 ?auto_15476 ) ) ( not ( = ?auto_15470 ?auto_15472 ) ) ( not ( = ?auto_15470 ?auto_15476 ) ) ( not ( = ?auto_15472 ?auto_15483 ) ) ( not ( = ?auto_15472 ?auto_15482 ) ) ( not ( = ?auto_15472 ?auto_15497 ) ) ( not ( = ?auto_15472 ?auto_15479 ) ) ( not ( = ?auto_15472 ?auto_15487 ) ) ( not ( = ?auto_15472 ?auto_15490 ) ) ( not ( = ?auto_15472 ?auto_15492 ) ) ( not ( = ?auto_15477 ?auto_15491 ) ) ( not ( = ?auto_15477 ?auto_15484 ) ) ( not ( = ?auto_15477 ?auto_15480 ) ) ( not ( = ?auto_15477 ?auto_15496 ) ) ( not ( = ?auto_15477 ?auto_15486 ) ) ( not ( = ?auto_15477 ?auto_15488 ) ) ( not ( = ?auto_15478 ?auto_15481 ) ) ( not ( = ?auto_15478 ?auto_15493 ) ) ( not ( = ?auto_15478 ?auto_15485 ) ) ( not ( = ?auto_15478 ?auto_15489 ) ) ( not ( = ?auto_15478 ?auto_15494 ) ) ( not ( = ?auto_15478 ?auto_15495 ) ) ( not ( = ?auto_15476 ?auto_15483 ) ) ( not ( = ?auto_15476 ?auto_15482 ) ) ( not ( = ?auto_15476 ?auto_15497 ) ) ( not ( = ?auto_15476 ?auto_15479 ) ) ( not ( = ?auto_15476 ?auto_15487 ) ) ( not ( = ?auto_15476 ?auto_15490 ) ) ( not ( = ?auto_15476 ?auto_15492 ) ) )
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
      ?auto_15532 - HOIST
      ?auto_15529 - PLACE
      ?auto_15528 - PLACE
      ?auto_15533 - HOIST
      ?auto_15531 - SURFACE
      ?auto_15541 - PLACE
      ?auto_15545 - HOIST
      ?auto_15544 - SURFACE
      ?auto_15538 - PLACE
      ?auto_15547 - HOIST
      ?auto_15546 - SURFACE
      ?auto_15550 - PLACE
      ?auto_15553 - HOIST
      ?auto_15548 - SURFACE
      ?auto_15551 - PLACE
      ?auto_15539 - HOIST
      ?auto_15540 - SURFACE
      ?auto_15536 - PLACE
      ?auto_15552 - HOIST
      ?auto_15534 - SURFACE
      ?auto_15535 - SURFACE
      ?auto_15537 - PLACE
      ?auto_15543 - HOIST
      ?auto_15549 - SURFACE
      ?auto_15542 - SURFACE
      ?auto_15530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15532 ?auto_15529 ) ( IS-CRATE ?auto_15527 ) ( not ( = ?auto_15528 ?auto_15529 ) ) ( HOIST-AT ?auto_15533 ?auto_15528 ) ( SURFACE-AT ?auto_15527 ?auto_15528 ) ( ON ?auto_15527 ?auto_15531 ) ( CLEAR ?auto_15527 ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15531 ) ) ( not ( = ?auto_15527 ?auto_15531 ) ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( IS-CRATE ?auto_15526 ) ( not ( = ?auto_15541 ?auto_15529 ) ) ( HOIST-AT ?auto_15545 ?auto_15541 ) ( AVAILABLE ?auto_15545 ) ( SURFACE-AT ?auto_15526 ?auto_15541 ) ( ON ?auto_15526 ?auto_15544 ) ( CLEAR ?auto_15526 ) ( not ( = ?auto_15525 ?auto_15526 ) ) ( not ( = ?auto_15525 ?auto_15544 ) ) ( not ( = ?auto_15526 ?auto_15544 ) ) ( not ( = ?auto_15532 ?auto_15545 ) ) ( IS-CRATE ?auto_15525 ) ( not ( = ?auto_15538 ?auto_15529 ) ) ( HOIST-AT ?auto_15547 ?auto_15538 ) ( AVAILABLE ?auto_15547 ) ( SURFACE-AT ?auto_15525 ?auto_15538 ) ( ON ?auto_15525 ?auto_15546 ) ( CLEAR ?auto_15525 ) ( not ( = ?auto_15524 ?auto_15525 ) ) ( not ( = ?auto_15524 ?auto_15546 ) ) ( not ( = ?auto_15525 ?auto_15546 ) ) ( not ( = ?auto_15532 ?auto_15547 ) ) ( IS-CRATE ?auto_15524 ) ( not ( = ?auto_15550 ?auto_15529 ) ) ( HOIST-AT ?auto_15553 ?auto_15550 ) ( AVAILABLE ?auto_15553 ) ( SURFACE-AT ?auto_15524 ?auto_15550 ) ( ON ?auto_15524 ?auto_15548 ) ( CLEAR ?auto_15524 ) ( not ( = ?auto_15523 ?auto_15524 ) ) ( not ( = ?auto_15523 ?auto_15548 ) ) ( not ( = ?auto_15524 ?auto_15548 ) ) ( not ( = ?auto_15532 ?auto_15553 ) ) ( IS-CRATE ?auto_15523 ) ( not ( = ?auto_15551 ?auto_15529 ) ) ( HOIST-AT ?auto_15539 ?auto_15551 ) ( SURFACE-AT ?auto_15523 ?auto_15551 ) ( ON ?auto_15523 ?auto_15540 ) ( CLEAR ?auto_15523 ) ( not ( = ?auto_15522 ?auto_15523 ) ) ( not ( = ?auto_15522 ?auto_15540 ) ) ( not ( = ?auto_15523 ?auto_15540 ) ) ( not ( = ?auto_15532 ?auto_15539 ) ) ( IS-CRATE ?auto_15522 ) ( not ( = ?auto_15536 ?auto_15529 ) ) ( HOIST-AT ?auto_15552 ?auto_15536 ) ( AVAILABLE ?auto_15552 ) ( SURFACE-AT ?auto_15522 ?auto_15536 ) ( ON ?auto_15522 ?auto_15534 ) ( CLEAR ?auto_15522 ) ( not ( = ?auto_15521 ?auto_15522 ) ) ( not ( = ?auto_15521 ?auto_15534 ) ) ( not ( = ?auto_15522 ?auto_15534 ) ) ( not ( = ?auto_15532 ?auto_15552 ) ) ( IS-CRATE ?auto_15521 ) ( AVAILABLE ?auto_15533 ) ( SURFACE-AT ?auto_15521 ?auto_15528 ) ( ON ?auto_15521 ?auto_15535 ) ( CLEAR ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15520 ?auto_15535 ) ) ( not ( = ?auto_15521 ?auto_15535 ) ) ( IS-CRATE ?auto_15520 ) ( not ( = ?auto_15537 ?auto_15529 ) ) ( HOIST-AT ?auto_15543 ?auto_15537 ) ( AVAILABLE ?auto_15543 ) ( SURFACE-AT ?auto_15520 ?auto_15537 ) ( ON ?auto_15520 ?auto_15549 ) ( CLEAR ?auto_15520 ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15549 ) ) ( not ( = ?auto_15520 ?auto_15549 ) ) ( not ( = ?auto_15532 ?auto_15543 ) ) ( SURFACE-AT ?auto_15518 ?auto_15529 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15519 ) ( AVAILABLE ?auto_15532 ) ( AVAILABLE ?auto_15539 ) ( SURFACE-AT ?auto_15519 ?auto_15551 ) ( ON ?auto_15519 ?auto_15542 ) ( CLEAR ?auto_15519 ) ( TRUCK-AT ?auto_15530 ?auto_15529 ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15542 ) ) ( not ( = ?auto_15519 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15549 ) ) ( not ( = ?auto_15520 ?auto_15542 ) ) ( not ( = ?auto_15537 ?auto_15551 ) ) ( not ( = ?auto_15543 ?auto_15539 ) ) ( not ( = ?auto_15549 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15518 ?auto_15535 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15535 ) ) ( not ( = ?auto_15521 ?auto_15549 ) ) ( not ( = ?auto_15521 ?auto_15542 ) ) ( not ( = ?auto_15528 ?auto_15537 ) ) ( not ( = ?auto_15528 ?auto_15551 ) ) ( not ( = ?auto_15533 ?auto_15543 ) ) ( not ( = ?auto_15533 ?auto_15539 ) ) ( not ( = ?auto_15535 ?auto_15549 ) ) ( not ( = ?auto_15535 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15522 ) ) ( not ( = ?auto_15518 ?auto_15534 ) ) ( not ( = ?auto_15519 ?auto_15522 ) ) ( not ( = ?auto_15519 ?auto_15534 ) ) ( not ( = ?auto_15520 ?auto_15522 ) ) ( not ( = ?auto_15520 ?auto_15534 ) ) ( not ( = ?auto_15522 ?auto_15535 ) ) ( not ( = ?auto_15522 ?auto_15549 ) ) ( not ( = ?auto_15522 ?auto_15542 ) ) ( not ( = ?auto_15536 ?auto_15528 ) ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( not ( = ?auto_15536 ?auto_15551 ) ) ( not ( = ?auto_15552 ?auto_15533 ) ) ( not ( = ?auto_15552 ?auto_15543 ) ) ( not ( = ?auto_15552 ?auto_15539 ) ) ( not ( = ?auto_15534 ?auto_15535 ) ) ( not ( = ?auto_15534 ?auto_15549 ) ) ( not ( = ?auto_15534 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15523 ) ) ( not ( = ?auto_15518 ?auto_15540 ) ) ( not ( = ?auto_15519 ?auto_15523 ) ) ( not ( = ?auto_15519 ?auto_15540 ) ) ( not ( = ?auto_15520 ?auto_15523 ) ) ( not ( = ?auto_15520 ?auto_15540 ) ) ( not ( = ?auto_15521 ?auto_15523 ) ) ( not ( = ?auto_15521 ?auto_15540 ) ) ( not ( = ?auto_15523 ?auto_15534 ) ) ( not ( = ?auto_15523 ?auto_15535 ) ) ( not ( = ?auto_15523 ?auto_15549 ) ) ( not ( = ?auto_15523 ?auto_15542 ) ) ( not ( = ?auto_15540 ?auto_15534 ) ) ( not ( = ?auto_15540 ?auto_15535 ) ) ( not ( = ?auto_15540 ?auto_15549 ) ) ( not ( = ?auto_15540 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15524 ) ) ( not ( = ?auto_15518 ?auto_15548 ) ) ( not ( = ?auto_15519 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15548 ) ) ( not ( = ?auto_15520 ?auto_15524 ) ) ( not ( = ?auto_15520 ?auto_15548 ) ) ( not ( = ?auto_15521 ?auto_15524 ) ) ( not ( = ?auto_15521 ?auto_15548 ) ) ( not ( = ?auto_15522 ?auto_15524 ) ) ( not ( = ?auto_15522 ?auto_15548 ) ) ( not ( = ?auto_15524 ?auto_15540 ) ) ( not ( = ?auto_15524 ?auto_15534 ) ) ( not ( = ?auto_15524 ?auto_15535 ) ) ( not ( = ?auto_15524 ?auto_15549 ) ) ( not ( = ?auto_15524 ?auto_15542 ) ) ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15536 ) ) ( not ( = ?auto_15550 ?auto_15528 ) ) ( not ( = ?auto_15550 ?auto_15537 ) ) ( not ( = ?auto_15553 ?auto_15539 ) ) ( not ( = ?auto_15553 ?auto_15552 ) ) ( not ( = ?auto_15553 ?auto_15533 ) ) ( not ( = ?auto_15553 ?auto_15543 ) ) ( not ( = ?auto_15548 ?auto_15540 ) ) ( not ( = ?auto_15548 ?auto_15534 ) ) ( not ( = ?auto_15548 ?auto_15535 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15546 ) ) ( not ( = ?auto_15519 ?auto_15525 ) ) ( not ( = ?auto_15519 ?auto_15546 ) ) ( not ( = ?auto_15520 ?auto_15525 ) ) ( not ( = ?auto_15520 ?auto_15546 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15546 ) ) ( not ( = ?auto_15522 ?auto_15525 ) ) ( not ( = ?auto_15522 ?auto_15546 ) ) ( not ( = ?auto_15523 ?auto_15525 ) ) ( not ( = ?auto_15523 ?auto_15546 ) ) ( not ( = ?auto_15525 ?auto_15548 ) ) ( not ( = ?auto_15525 ?auto_15540 ) ) ( not ( = ?auto_15525 ?auto_15534 ) ) ( not ( = ?auto_15525 ?auto_15535 ) ) ( not ( = ?auto_15525 ?auto_15549 ) ) ( not ( = ?auto_15525 ?auto_15542 ) ) ( not ( = ?auto_15538 ?auto_15550 ) ) ( not ( = ?auto_15538 ?auto_15551 ) ) ( not ( = ?auto_15538 ?auto_15536 ) ) ( not ( = ?auto_15538 ?auto_15528 ) ) ( not ( = ?auto_15538 ?auto_15537 ) ) ( not ( = ?auto_15547 ?auto_15553 ) ) ( not ( = ?auto_15547 ?auto_15539 ) ) ( not ( = ?auto_15547 ?auto_15552 ) ) ( not ( = ?auto_15547 ?auto_15533 ) ) ( not ( = ?auto_15547 ?auto_15543 ) ) ( not ( = ?auto_15546 ?auto_15548 ) ) ( not ( = ?auto_15546 ?auto_15540 ) ) ( not ( = ?auto_15546 ?auto_15534 ) ) ( not ( = ?auto_15546 ?auto_15535 ) ) ( not ( = ?auto_15546 ?auto_15549 ) ) ( not ( = ?auto_15546 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15526 ) ) ( not ( = ?auto_15518 ?auto_15544 ) ) ( not ( = ?auto_15519 ?auto_15526 ) ) ( not ( = ?auto_15519 ?auto_15544 ) ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15544 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15521 ?auto_15544 ) ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15522 ?auto_15544 ) ) ( not ( = ?auto_15523 ?auto_15526 ) ) ( not ( = ?auto_15523 ?auto_15544 ) ) ( not ( = ?auto_15524 ?auto_15526 ) ) ( not ( = ?auto_15524 ?auto_15544 ) ) ( not ( = ?auto_15526 ?auto_15546 ) ) ( not ( = ?auto_15526 ?auto_15548 ) ) ( not ( = ?auto_15526 ?auto_15540 ) ) ( not ( = ?auto_15526 ?auto_15534 ) ) ( not ( = ?auto_15526 ?auto_15535 ) ) ( not ( = ?auto_15526 ?auto_15549 ) ) ( not ( = ?auto_15526 ?auto_15542 ) ) ( not ( = ?auto_15541 ?auto_15538 ) ) ( not ( = ?auto_15541 ?auto_15550 ) ) ( not ( = ?auto_15541 ?auto_15551 ) ) ( not ( = ?auto_15541 ?auto_15536 ) ) ( not ( = ?auto_15541 ?auto_15528 ) ) ( not ( = ?auto_15541 ?auto_15537 ) ) ( not ( = ?auto_15545 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15553 ) ) ( not ( = ?auto_15545 ?auto_15539 ) ) ( not ( = ?auto_15545 ?auto_15552 ) ) ( not ( = ?auto_15545 ?auto_15533 ) ) ( not ( = ?auto_15545 ?auto_15543 ) ) ( not ( = ?auto_15544 ?auto_15546 ) ) ( not ( = ?auto_15544 ?auto_15548 ) ) ( not ( = ?auto_15544 ?auto_15540 ) ) ( not ( = ?auto_15544 ?auto_15534 ) ) ( not ( = ?auto_15544 ?auto_15535 ) ) ( not ( = ?auto_15544 ?auto_15549 ) ) ( not ( = ?auto_15544 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15527 ) ) ( not ( = ?auto_15518 ?auto_15531 ) ) ( not ( = ?auto_15519 ?auto_15527 ) ) ( not ( = ?auto_15519 ?auto_15531 ) ) ( not ( = ?auto_15520 ?auto_15527 ) ) ( not ( = ?auto_15520 ?auto_15531 ) ) ( not ( = ?auto_15521 ?auto_15527 ) ) ( not ( = ?auto_15521 ?auto_15531 ) ) ( not ( = ?auto_15522 ?auto_15527 ) ) ( not ( = ?auto_15522 ?auto_15531 ) ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( not ( = ?auto_15523 ?auto_15531 ) ) ( not ( = ?auto_15524 ?auto_15527 ) ) ( not ( = ?auto_15524 ?auto_15531 ) ) ( not ( = ?auto_15525 ?auto_15527 ) ) ( not ( = ?auto_15525 ?auto_15531 ) ) ( not ( = ?auto_15527 ?auto_15544 ) ) ( not ( = ?auto_15527 ?auto_15546 ) ) ( not ( = ?auto_15527 ?auto_15548 ) ) ( not ( = ?auto_15527 ?auto_15540 ) ) ( not ( = ?auto_15527 ?auto_15534 ) ) ( not ( = ?auto_15527 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15549 ) ) ( not ( = ?auto_15527 ?auto_15542 ) ) ( not ( = ?auto_15531 ?auto_15544 ) ) ( not ( = ?auto_15531 ?auto_15546 ) ) ( not ( = ?auto_15531 ?auto_15548 ) ) ( not ( = ?auto_15531 ?auto_15540 ) ) ( not ( = ?auto_15531 ?auto_15534 ) ) ( not ( = ?auto_15531 ?auto_15535 ) ) ( not ( = ?auto_15531 ?auto_15549 ) ) ( not ( = ?auto_15531 ?auto_15542 ) ) )
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
      ?auto_15590 - HOIST
      ?auto_15589 - PLACE
      ?auto_15588 - PLACE
      ?auto_15587 - HOIST
      ?auto_15586 - SURFACE
      ?auto_15592 - PLACE
      ?auto_15607 - HOIST
      ?auto_15599 - SURFACE
      ?auto_15605 - PLACE
      ?auto_15600 - HOIST
      ?auto_15610 - SURFACE
      ?auto_15595 - PLACE
      ?auto_15611 - HOIST
      ?auto_15598 - SURFACE
      ?auto_15602 - PLACE
      ?auto_15597 - HOIST
      ?auto_15612 - SURFACE
      ?auto_15601 - SURFACE
      ?auto_15609 - PLACE
      ?auto_15596 - HOIST
      ?auto_15603 - SURFACE
      ?auto_15604 - SURFACE
      ?auto_15608 - PLACE
      ?auto_15594 - HOIST
      ?auto_15593 - SURFACE
      ?auto_15606 - SURFACE
      ?auto_15591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15590 ?auto_15589 ) ( IS-CRATE ?auto_15585 ) ( not ( = ?auto_15588 ?auto_15589 ) ) ( HOIST-AT ?auto_15587 ?auto_15588 ) ( SURFACE-AT ?auto_15585 ?auto_15588 ) ( ON ?auto_15585 ?auto_15586 ) ( CLEAR ?auto_15585 ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( not ( = ?auto_15585 ?auto_15586 ) ) ( not ( = ?auto_15590 ?auto_15587 ) ) ( IS-CRATE ?auto_15584 ) ( not ( = ?auto_15592 ?auto_15589 ) ) ( HOIST-AT ?auto_15607 ?auto_15592 ) ( SURFACE-AT ?auto_15584 ?auto_15592 ) ( ON ?auto_15584 ?auto_15599 ) ( CLEAR ?auto_15584 ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15583 ?auto_15599 ) ) ( not ( = ?auto_15584 ?auto_15599 ) ) ( not ( = ?auto_15590 ?auto_15607 ) ) ( IS-CRATE ?auto_15583 ) ( not ( = ?auto_15605 ?auto_15589 ) ) ( HOIST-AT ?auto_15600 ?auto_15605 ) ( AVAILABLE ?auto_15600 ) ( SURFACE-AT ?auto_15583 ?auto_15605 ) ( ON ?auto_15583 ?auto_15610 ) ( CLEAR ?auto_15583 ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15610 ) ) ( not ( = ?auto_15583 ?auto_15610 ) ) ( not ( = ?auto_15590 ?auto_15600 ) ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15595 ?auto_15589 ) ) ( HOIST-AT ?auto_15611 ?auto_15595 ) ( AVAILABLE ?auto_15611 ) ( SURFACE-AT ?auto_15582 ?auto_15595 ) ( ON ?auto_15582 ?auto_15598 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15598 ) ) ( not ( = ?auto_15582 ?auto_15598 ) ) ( not ( = ?auto_15590 ?auto_15611 ) ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15602 ?auto_15589 ) ) ( HOIST-AT ?auto_15597 ?auto_15602 ) ( AVAILABLE ?auto_15597 ) ( SURFACE-AT ?auto_15581 ?auto_15602 ) ( ON ?auto_15581 ?auto_15612 ) ( CLEAR ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15612 ) ) ( not ( = ?auto_15581 ?auto_15612 ) ) ( not ( = ?auto_15590 ?auto_15597 ) ) ( IS-CRATE ?auto_15580 ) ( SURFACE-AT ?auto_15580 ?auto_15588 ) ( ON ?auto_15580 ?auto_15601 ) ( CLEAR ?auto_15580 ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15601 ) ) ( not ( = ?auto_15580 ?auto_15601 ) ) ( IS-CRATE ?auto_15579 ) ( not ( = ?auto_15609 ?auto_15589 ) ) ( HOIST-AT ?auto_15596 ?auto_15609 ) ( AVAILABLE ?auto_15596 ) ( SURFACE-AT ?auto_15579 ?auto_15609 ) ( ON ?auto_15579 ?auto_15603 ) ( CLEAR ?auto_15579 ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15603 ) ) ( not ( = ?auto_15579 ?auto_15603 ) ) ( not ( = ?auto_15590 ?auto_15596 ) ) ( IS-CRATE ?auto_15578 ) ( AVAILABLE ?auto_15607 ) ( SURFACE-AT ?auto_15578 ?auto_15592 ) ( ON ?auto_15578 ?auto_15604 ) ( CLEAR ?auto_15578 ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15604 ) ) ( not ( = ?auto_15578 ?auto_15604 ) ) ( IS-CRATE ?auto_15577 ) ( not ( = ?auto_15608 ?auto_15589 ) ) ( HOIST-AT ?auto_15594 ?auto_15608 ) ( AVAILABLE ?auto_15594 ) ( SURFACE-AT ?auto_15577 ?auto_15608 ) ( ON ?auto_15577 ?auto_15593 ) ( CLEAR ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15593 ) ) ( not ( = ?auto_15577 ?auto_15593 ) ) ( not ( = ?auto_15590 ?auto_15594 ) ) ( SURFACE-AT ?auto_15575 ?auto_15589 ) ( CLEAR ?auto_15575 ) ( IS-CRATE ?auto_15576 ) ( AVAILABLE ?auto_15590 ) ( AVAILABLE ?auto_15587 ) ( SURFACE-AT ?auto_15576 ?auto_15588 ) ( ON ?auto_15576 ?auto_15606 ) ( CLEAR ?auto_15576 ) ( TRUCK-AT ?auto_15591 ?auto_15589 ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15606 ) ) ( not ( = ?auto_15576 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15577 ) ) ( not ( = ?auto_15575 ?auto_15593 ) ) ( not ( = ?auto_15577 ?auto_15606 ) ) ( not ( = ?auto_15608 ?auto_15588 ) ) ( not ( = ?auto_15594 ?auto_15587 ) ) ( not ( = ?auto_15593 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15578 ) ) ( not ( = ?auto_15575 ?auto_15604 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15576 ?auto_15604 ) ) ( not ( = ?auto_15578 ?auto_15593 ) ) ( not ( = ?auto_15578 ?auto_15606 ) ) ( not ( = ?auto_15592 ?auto_15608 ) ) ( not ( = ?auto_15592 ?auto_15588 ) ) ( not ( = ?auto_15607 ?auto_15594 ) ) ( not ( = ?auto_15607 ?auto_15587 ) ) ( not ( = ?auto_15604 ?auto_15593 ) ) ( not ( = ?auto_15604 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( not ( = ?auto_15575 ?auto_15603 ) ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15576 ?auto_15603 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15603 ) ) ( not ( = ?auto_15579 ?auto_15604 ) ) ( not ( = ?auto_15579 ?auto_15593 ) ) ( not ( = ?auto_15579 ?auto_15606 ) ) ( not ( = ?auto_15609 ?auto_15592 ) ) ( not ( = ?auto_15609 ?auto_15608 ) ) ( not ( = ?auto_15609 ?auto_15588 ) ) ( not ( = ?auto_15596 ?auto_15607 ) ) ( not ( = ?auto_15596 ?auto_15594 ) ) ( not ( = ?auto_15596 ?auto_15587 ) ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( not ( = ?auto_15603 ?auto_15593 ) ) ( not ( = ?auto_15603 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15580 ) ) ( not ( = ?auto_15575 ?auto_15601 ) ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15576 ?auto_15601 ) ) ( not ( = ?auto_15577 ?auto_15580 ) ) ( not ( = ?auto_15577 ?auto_15601 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15601 ) ) ( not ( = ?auto_15580 ?auto_15603 ) ) ( not ( = ?auto_15580 ?auto_15604 ) ) ( not ( = ?auto_15580 ?auto_15593 ) ) ( not ( = ?auto_15580 ?auto_15606 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15604 ) ) ( not ( = ?auto_15601 ?auto_15593 ) ) ( not ( = ?auto_15601 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15581 ) ) ( not ( = ?auto_15575 ?auto_15612 ) ) ( not ( = ?auto_15576 ?auto_15581 ) ) ( not ( = ?auto_15576 ?auto_15612 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( not ( = ?auto_15577 ?auto_15612 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15612 ) ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15579 ?auto_15612 ) ) ( not ( = ?auto_15581 ?auto_15601 ) ) ( not ( = ?auto_15581 ?auto_15603 ) ) ( not ( = ?auto_15581 ?auto_15604 ) ) ( not ( = ?auto_15581 ?auto_15593 ) ) ( not ( = ?auto_15581 ?auto_15606 ) ) ( not ( = ?auto_15602 ?auto_15588 ) ) ( not ( = ?auto_15602 ?auto_15609 ) ) ( not ( = ?auto_15602 ?auto_15592 ) ) ( not ( = ?auto_15602 ?auto_15608 ) ) ( not ( = ?auto_15597 ?auto_15587 ) ) ( not ( = ?auto_15597 ?auto_15596 ) ) ( not ( = ?auto_15597 ?auto_15607 ) ) ( not ( = ?auto_15597 ?auto_15594 ) ) ( not ( = ?auto_15612 ?auto_15601 ) ) ( not ( = ?auto_15612 ?auto_15603 ) ) ( not ( = ?auto_15612 ?auto_15604 ) ) ( not ( = ?auto_15612 ?auto_15593 ) ) ( not ( = ?auto_15612 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15582 ) ) ( not ( = ?auto_15575 ?auto_15598 ) ) ( not ( = ?auto_15576 ?auto_15582 ) ) ( not ( = ?auto_15576 ?auto_15598 ) ) ( not ( = ?auto_15577 ?auto_15582 ) ) ( not ( = ?auto_15577 ?auto_15598 ) ) ( not ( = ?auto_15578 ?auto_15582 ) ) ( not ( = ?auto_15578 ?auto_15598 ) ) ( not ( = ?auto_15579 ?auto_15582 ) ) ( not ( = ?auto_15579 ?auto_15598 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15598 ) ) ( not ( = ?auto_15582 ?auto_15612 ) ) ( not ( = ?auto_15582 ?auto_15601 ) ) ( not ( = ?auto_15582 ?auto_15603 ) ) ( not ( = ?auto_15582 ?auto_15604 ) ) ( not ( = ?auto_15582 ?auto_15593 ) ) ( not ( = ?auto_15582 ?auto_15606 ) ) ( not ( = ?auto_15595 ?auto_15602 ) ) ( not ( = ?auto_15595 ?auto_15588 ) ) ( not ( = ?auto_15595 ?auto_15609 ) ) ( not ( = ?auto_15595 ?auto_15592 ) ) ( not ( = ?auto_15595 ?auto_15608 ) ) ( not ( = ?auto_15611 ?auto_15597 ) ) ( not ( = ?auto_15611 ?auto_15587 ) ) ( not ( = ?auto_15611 ?auto_15596 ) ) ( not ( = ?auto_15611 ?auto_15607 ) ) ( not ( = ?auto_15611 ?auto_15594 ) ) ( not ( = ?auto_15598 ?auto_15612 ) ) ( not ( = ?auto_15598 ?auto_15601 ) ) ( not ( = ?auto_15598 ?auto_15603 ) ) ( not ( = ?auto_15598 ?auto_15604 ) ) ( not ( = ?auto_15598 ?auto_15593 ) ) ( not ( = ?auto_15598 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15583 ) ) ( not ( = ?auto_15575 ?auto_15610 ) ) ( not ( = ?auto_15576 ?auto_15583 ) ) ( not ( = ?auto_15576 ?auto_15610 ) ) ( not ( = ?auto_15577 ?auto_15583 ) ) ( not ( = ?auto_15577 ?auto_15610 ) ) ( not ( = ?auto_15578 ?auto_15583 ) ) ( not ( = ?auto_15578 ?auto_15610 ) ) ( not ( = ?auto_15579 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15610 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15610 ) ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15610 ) ) ( not ( = ?auto_15583 ?auto_15598 ) ) ( not ( = ?auto_15583 ?auto_15612 ) ) ( not ( = ?auto_15583 ?auto_15601 ) ) ( not ( = ?auto_15583 ?auto_15603 ) ) ( not ( = ?auto_15583 ?auto_15604 ) ) ( not ( = ?auto_15583 ?auto_15593 ) ) ( not ( = ?auto_15583 ?auto_15606 ) ) ( not ( = ?auto_15605 ?auto_15595 ) ) ( not ( = ?auto_15605 ?auto_15602 ) ) ( not ( = ?auto_15605 ?auto_15588 ) ) ( not ( = ?auto_15605 ?auto_15609 ) ) ( not ( = ?auto_15605 ?auto_15592 ) ) ( not ( = ?auto_15605 ?auto_15608 ) ) ( not ( = ?auto_15600 ?auto_15611 ) ) ( not ( = ?auto_15600 ?auto_15597 ) ) ( not ( = ?auto_15600 ?auto_15587 ) ) ( not ( = ?auto_15600 ?auto_15596 ) ) ( not ( = ?auto_15600 ?auto_15607 ) ) ( not ( = ?auto_15600 ?auto_15594 ) ) ( not ( = ?auto_15610 ?auto_15598 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15601 ) ) ( not ( = ?auto_15610 ?auto_15603 ) ) ( not ( = ?auto_15610 ?auto_15604 ) ) ( not ( = ?auto_15610 ?auto_15593 ) ) ( not ( = ?auto_15610 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15584 ) ) ( not ( = ?auto_15575 ?auto_15599 ) ) ( not ( = ?auto_15576 ?auto_15584 ) ) ( not ( = ?auto_15576 ?auto_15599 ) ) ( not ( = ?auto_15577 ?auto_15584 ) ) ( not ( = ?auto_15577 ?auto_15599 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15599 ) ) ( not ( = ?auto_15579 ?auto_15584 ) ) ( not ( = ?auto_15579 ?auto_15599 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15599 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15599 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15599 ) ) ( not ( = ?auto_15584 ?auto_15610 ) ) ( not ( = ?auto_15584 ?auto_15598 ) ) ( not ( = ?auto_15584 ?auto_15612 ) ) ( not ( = ?auto_15584 ?auto_15601 ) ) ( not ( = ?auto_15584 ?auto_15603 ) ) ( not ( = ?auto_15584 ?auto_15604 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15606 ) ) ( not ( = ?auto_15599 ?auto_15610 ) ) ( not ( = ?auto_15599 ?auto_15598 ) ) ( not ( = ?auto_15599 ?auto_15612 ) ) ( not ( = ?auto_15599 ?auto_15601 ) ) ( not ( = ?auto_15599 ?auto_15603 ) ) ( not ( = ?auto_15599 ?auto_15604 ) ) ( not ( = ?auto_15599 ?auto_15593 ) ) ( not ( = ?auto_15599 ?auto_15606 ) ) ( not ( = ?auto_15575 ?auto_15585 ) ) ( not ( = ?auto_15575 ?auto_15586 ) ) ( not ( = ?auto_15576 ?auto_15585 ) ) ( not ( = ?auto_15576 ?auto_15586 ) ) ( not ( = ?auto_15577 ?auto_15585 ) ) ( not ( = ?auto_15577 ?auto_15586 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15586 ) ) ( not ( = ?auto_15579 ?auto_15585 ) ) ( not ( = ?auto_15579 ?auto_15586 ) ) ( not ( = ?auto_15580 ?auto_15585 ) ) ( not ( = ?auto_15580 ?auto_15586 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) ( not ( = ?auto_15581 ?auto_15586 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15586 ) ) ( not ( = ?auto_15583 ?auto_15585 ) ) ( not ( = ?auto_15583 ?auto_15586 ) ) ( not ( = ?auto_15585 ?auto_15599 ) ) ( not ( = ?auto_15585 ?auto_15610 ) ) ( not ( = ?auto_15585 ?auto_15598 ) ) ( not ( = ?auto_15585 ?auto_15612 ) ) ( not ( = ?auto_15585 ?auto_15601 ) ) ( not ( = ?auto_15585 ?auto_15603 ) ) ( not ( = ?auto_15585 ?auto_15604 ) ) ( not ( = ?auto_15585 ?auto_15593 ) ) ( not ( = ?auto_15585 ?auto_15606 ) ) ( not ( = ?auto_15586 ?auto_15599 ) ) ( not ( = ?auto_15586 ?auto_15610 ) ) ( not ( = ?auto_15586 ?auto_15598 ) ) ( not ( = ?auto_15586 ?auto_15612 ) ) ( not ( = ?auto_15586 ?auto_15601 ) ) ( not ( = ?auto_15586 ?auto_15603 ) ) ( not ( = ?auto_15586 ?auto_15604 ) ) ( not ( = ?auto_15586 ?auto_15593 ) ) ( not ( = ?auto_15586 ?auto_15606 ) ) )
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
      ?auto_15648 - PLACE
      ?auto_15651 - HOIST
      ?auto_15647 - SURFACE
      ?auto_15663 - PLACE
      ?auto_15675 - HOIST
      ?auto_15674 - SURFACE
      ?auto_15656 - PLACE
      ?auto_15664 - HOIST
      ?auto_15658 - SURFACE
      ?auto_15665 - PLACE
      ?auto_15662 - HOIST
      ?auto_15654 - SURFACE
      ?auto_15653 - PLACE
      ?auto_15668 - HOIST
      ?auto_15670 - SURFACE
      ?auto_15672 - PLACE
      ?auto_15659 - HOIST
      ?auto_15669 - SURFACE
      ?auto_15666 - SURFACE
      ?auto_15660 - PLACE
      ?auto_15667 - HOIST
      ?auto_15655 - SURFACE
      ?auto_15671 - SURFACE
      ?auto_15676 - PLACE
      ?auto_15657 - HOIST
      ?auto_15661 - SURFACE
      ?auto_15673 - SURFACE
      ?auto_15650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15649 ?auto_15652 ) ( IS-CRATE ?auto_15646 ) ( not ( = ?auto_15648 ?auto_15652 ) ) ( HOIST-AT ?auto_15651 ?auto_15648 ) ( AVAILABLE ?auto_15651 ) ( SURFACE-AT ?auto_15646 ?auto_15648 ) ( ON ?auto_15646 ?auto_15647 ) ( CLEAR ?auto_15646 ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( not ( = ?auto_15649 ?auto_15651 ) ) ( IS-CRATE ?auto_15645 ) ( not ( = ?auto_15663 ?auto_15652 ) ) ( HOIST-AT ?auto_15675 ?auto_15663 ) ( SURFACE-AT ?auto_15645 ?auto_15663 ) ( ON ?auto_15645 ?auto_15674 ) ( CLEAR ?auto_15645 ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15674 ) ) ( not ( = ?auto_15645 ?auto_15674 ) ) ( not ( = ?auto_15649 ?auto_15675 ) ) ( IS-CRATE ?auto_15644 ) ( not ( = ?auto_15656 ?auto_15652 ) ) ( HOIST-AT ?auto_15664 ?auto_15656 ) ( SURFACE-AT ?auto_15644 ?auto_15656 ) ( ON ?auto_15644 ?auto_15658 ) ( CLEAR ?auto_15644 ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15658 ) ) ( not ( = ?auto_15644 ?auto_15658 ) ) ( not ( = ?auto_15649 ?auto_15664 ) ) ( IS-CRATE ?auto_15643 ) ( not ( = ?auto_15665 ?auto_15652 ) ) ( HOIST-AT ?auto_15662 ?auto_15665 ) ( AVAILABLE ?auto_15662 ) ( SURFACE-AT ?auto_15643 ?auto_15665 ) ( ON ?auto_15643 ?auto_15654 ) ( CLEAR ?auto_15643 ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15654 ) ) ( not ( = ?auto_15643 ?auto_15654 ) ) ( not ( = ?auto_15649 ?auto_15662 ) ) ( IS-CRATE ?auto_15642 ) ( not ( = ?auto_15653 ?auto_15652 ) ) ( HOIST-AT ?auto_15668 ?auto_15653 ) ( AVAILABLE ?auto_15668 ) ( SURFACE-AT ?auto_15642 ?auto_15653 ) ( ON ?auto_15642 ?auto_15670 ) ( CLEAR ?auto_15642 ) ( not ( = ?auto_15641 ?auto_15642 ) ) ( not ( = ?auto_15641 ?auto_15670 ) ) ( not ( = ?auto_15642 ?auto_15670 ) ) ( not ( = ?auto_15649 ?auto_15668 ) ) ( IS-CRATE ?auto_15641 ) ( not ( = ?auto_15672 ?auto_15652 ) ) ( HOIST-AT ?auto_15659 ?auto_15672 ) ( AVAILABLE ?auto_15659 ) ( SURFACE-AT ?auto_15641 ?auto_15672 ) ( ON ?auto_15641 ?auto_15669 ) ( CLEAR ?auto_15641 ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15669 ) ) ( not ( = ?auto_15641 ?auto_15669 ) ) ( not ( = ?auto_15649 ?auto_15659 ) ) ( IS-CRATE ?auto_15640 ) ( SURFACE-AT ?auto_15640 ?auto_15663 ) ( ON ?auto_15640 ?auto_15666 ) ( CLEAR ?auto_15640 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15666 ) ) ( not ( = ?auto_15640 ?auto_15666 ) ) ( IS-CRATE ?auto_15639 ) ( not ( = ?auto_15660 ?auto_15652 ) ) ( HOIST-AT ?auto_15667 ?auto_15660 ) ( AVAILABLE ?auto_15667 ) ( SURFACE-AT ?auto_15639 ?auto_15660 ) ( ON ?auto_15639 ?auto_15655 ) ( CLEAR ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15655 ) ) ( not ( = ?auto_15639 ?auto_15655 ) ) ( not ( = ?auto_15649 ?auto_15667 ) ) ( IS-CRATE ?auto_15638 ) ( AVAILABLE ?auto_15664 ) ( SURFACE-AT ?auto_15638 ?auto_15656 ) ( ON ?auto_15638 ?auto_15671 ) ( CLEAR ?auto_15638 ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( not ( = ?auto_15637 ?auto_15671 ) ) ( not ( = ?auto_15638 ?auto_15671 ) ) ( IS-CRATE ?auto_15637 ) ( not ( = ?auto_15676 ?auto_15652 ) ) ( HOIST-AT ?auto_15657 ?auto_15676 ) ( AVAILABLE ?auto_15657 ) ( SURFACE-AT ?auto_15637 ?auto_15676 ) ( ON ?auto_15637 ?auto_15661 ) ( CLEAR ?auto_15637 ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15661 ) ) ( not ( = ?auto_15637 ?auto_15661 ) ) ( not ( = ?auto_15649 ?auto_15657 ) ) ( SURFACE-AT ?auto_15635 ?auto_15652 ) ( CLEAR ?auto_15635 ) ( IS-CRATE ?auto_15636 ) ( AVAILABLE ?auto_15649 ) ( AVAILABLE ?auto_15675 ) ( SURFACE-AT ?auto_15636 ?auto_15663 ) ( ON ?auto_15636 ?auto_15673 ) ( CLEAR ?auto_15636 ) ( TRUCK-AT ?auto_15650 ?auto_15652 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15673 ) ) ( not ( = ?auto_15636 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15635 ?auto_15661 ) ) ( not ( = ?auto_15637 ?auto_15673 ) ) ( not ( = ?auto_15676 ?auto_15663 ) ) ( not ( = ?auto_15657 ?auto_15675 ) ) ( not ( = ?auto_15661 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15638 ) ) ( not ( = ?auto_15635 ?auto_15671 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15671 ) ) ( not ( = ?auto_15638 ?auto_15661 ) ) ( not ( = ?auto_15638 ?auto_15673 ) ) ( not ( = ?auto_15656 ?auto_15676 ) ) ( not ( = ?auto_15656 ?auto_15663 ) ) ( not ( = ?auto_15664 ?auto_15657 ) ) ( not ( = ?auto_15664 ?auto_15675 ) ) ( not ( = ?auto_15671 ?auto_15661 ) ) ( not ( = ?auto_15671 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15639 ) ) ( not ( = ?auto_15635 ?auto_15655 ) ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15636 ?auto_15655 ) ) ( not ( = ?auto_15637 ?auto_15639 ) ) ( not ( = ?auto_15637 ?auto_15655 ) ) ( not ( = ?auto_15639 ?auto_15671 ) ) ( not ( = ?auto_15639 ?auto_15661 ) ) ( not ( = ?auto_15639 ?auto_15673 ) ) ( not ( = ?auto_15660 ?auto_15656 ) ) ( not ( = ?auto_15660 ?auto_15676 ) ) ( not ( = ?auto_15660 ?auto_15663 ) ) ( not ( = ?auto_15667 ?auto_15664 ) ) ( not ( = ?auto_15667 ?auto_15657 ) ) ( not ( = ?auto_15667 ?auto_15675 ) ) ( not ( = ?auto_15655 ?auto_15671 ) ) ( not ( = ?auto_15655 ?auto_15661 ) ) ( not ( = ?auto_15655 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15640 ) ) ( not ( = ?auto_15635 ?auto_15666 ) ) ( not ( = ?auto_15636 ?auto_15640 ) ) ( not ( = ?auto_15636 ?auto_15666 ) ) ( not ( = ?auto_15637 ?auto_15640 ) ) ( not ( = ?auto_15637 ?auto_15666 ) ) ( not ( = ?auto_15638 ?auto_15640 ) ) ( not ( = ?auto_15638 ?auto_15666 ) ) ( not ( = ?auto_15640 ?auto_15655 ) ) ( not ( = ?auto_15640 ?auto_15671 ) ) ( not ( = ?auto_15640 ?auto_15661 ) ) ( not ( = ?auto_15640 ?auto_15673 ) ) ( not ( = ?auto_15666 ?auto_15655 ) ) ( not ( = ?auto_15666 ?auto_15671 ) ) ( not ( = ?auto_15666 ?auto_15661 ) ) ( not ( = ?auto_15666 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15641 ) ) ( not ( = ?auto_15635 ?auto_15669 ) ) ( not ( = ?auto_15636 ?auto_15641 ) ) ( not ( = ?auto_15636 ?auto_15669 ) ) ( not ( = ?auto_15637 ?auto_15641 ) ) ( not ( = ?auto_15637 ?auto_15669 ) ) ( not ( = ?auto_15638 ?auto_15641 ) ) ( not ( = ?auto_15638 ?auto_15669 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15639 ?auto_15669 ) ) ( not ( = ?auto_15641 ?auto_15666 ) ) ( not ( = ?auto_15641 ?auto_15655 ) ) ( not ( = ?auto_15641 ?auto_15671 ) ) ( not ( = ?auto_15641 ?auto_15661 ) ) ( not ( = ?auto_15641 ?auto_15673 ) ) ( not ( = ?auto_15672 ?auto_15663 ) ) ( not ( = ?auto_15672 ?auto_15660 ) ) ( not ( = ?auto_15672 ?auto_15656 ) ) ( not ( = ?auto_15672 ?auto_15676 ) ) ( not ( = ?auto_15659 ?auto_15675 ) ) ( not ( = ?auto_15659 ?auto_15667 ) ) ( not ( = ?auto_15659 ?auto_15664 ) ) ( not ( = ?auto_15659 ?auto_15657 ) ) ( not ( = ?auto_15669 ?auto_15666 ) ) ( not ( = ?auto_15669 ?auto_15655 ) ) ( not ( = ?auto_15669 ?auto_15671 ) ) ( not ( = ?auto_15669 ?auto_15661 ) ) ( not ( = ?auto_15669 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15642 ) ) ( not ( = ?auto_15635 ?auto_15670 ) ) ( not ( = ?auto_15636 ?auto_15642 ) ) ( not ( = ?auto_15636 ?auto_15670 ) ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15637 ?auto_15670 ) ) ( not ( = ?auto_15638 ?auto_15642 ) ) ( not ( = ?auto_15638 ?auto_15670 ) ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15639 ?auto_15670 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15670 ) ) ( not ( = ?auto_15642 ?auto_15669 ) ) ( not ( = ?auto_15642 ?auto_15666 ) ) ( not ( = ?auto_15642 ?auto_15655 ) ) ( not ( = ?auto_15642 ?auto_15671 ) ) ( not ( = ?auto_15642 ?auto_15661 ) ) ( not ( = ?auto_15642 ?auto_15673 ) ) ( not ( = ?auto_15653 ?auto_15672 ) ) ( not ( = ?auto_15653 ?auto_15663 ) ) ( not ( = ?auto_15653 ?auto_15660 ) ) ( not ( = ?auto_15653 ?auto_15656 ) ) ( not ( = ?auto_15653 ?auto_15676 ) ) ( not ( = ?auto_15668 ?auto_15659 ) ) ( not ( = ?auto_15668 ?auto_15675 ) ) ( not ( = ?auto_15668 ?auto_15667 ) ) ( not ( = ?auto_15668 ?auto_15664 ) ) ( not ( = ?auto_15668 ?auto_15657 ) ) ( not ( = ?auto_15670 ?auto_15669 ) ) ( not ( = ?auto_15670 ?auto_15666 ) ) ( not ( = ?auto_15670 ?auto_15655 ) ) ( not ( = ?auto_15670 ?auto_15671 ) ) ( not ( = ?auto_15670 ?auto_15661 ) ) ( not ( = ?auto_15670 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15635 ?auto_15654 ) ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( not ( = ?auto_15636 ?auto_15654 ) ) ( not ( = ?auto_15637 ?auto_15643 ) ) ( not ( = ?auto_15637 ?auto_15654 ) ) ( not ( = ?auto_15638 ?auto_15643 ) ) ( not ( = ?auto_15638 ?auto_15654 ) ) ( not ( = ?auto_15639 ?auto_15643 ) ) ( not ( = ?auto_15639 ?auto_15654 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15654 ) ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15641 ?auto_15654 ) ) ( not ( = ?auto_15643 ?auto_15670 ) ) ( not ( = ?auto_15643 ?auto_15669 ) ) ( not ( = ?auto_15643 ?auto_15666 ) ) ( not ( = ?auto_15643 ?auto_15655 ) ) ( not ( = ?auto_15643 ?auto_15671 ) ) ( not ( = ?auto_15643 ?auto_15661 ) ) ( not ( = ?auto_15643 ?auto_15673 ) ) ( not ( = ?auto_15665 ?auto_15653 ) ) ( not ( = ?auto_15665 ?auto_15672 ) ) ( not ( = ?auto_15665 ?auto_15663 ) ) ( not ( = ?auto_15665 ?auto_15660 ) ) ( not ( = ?auto_15665 ?auto_15656 ) ) ( not ( = ?auto_15665 ?auto_15676 ) ) ( not ( = ?auto_15662 ?auto_15668 ) ) ( not ( = ?auto_15662 ?auto_15659 ) ) ( not ( = ?auto_15662 ?auto_15675 ) ) ( not ( = ?auto_15662 ?auto_15667 ) ) ( not ( = ?auto_15662 ?auto_15664 ) ) ( not ( = ?auto_15662 ?auto_15657 ) ) ( not ( = ?auto_15654 ?auto_15670 ) ) ( not ( = ?auto_15654 ?auto_15669 ) ) ( not ( = ?auto_15654 ?auto_15666 ) ) ( not ( = ?auto_15654 ?auto_15655 ) ) ( not ( = ?auto_15654 ?auto_15671 ) ) ( not ( = ?auto_15654 ?auto_15661 ) ) ( not ( = ?auto_15654 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15644 ) ) ( not ( = ?auto_15635 ?auto_15658 ) ) ( not ( = ?auto_15636 ?auto_15644 ) ) ( not ( = ?auto_15636 ?auto_15658 ) ) ( not ( = ?auto_15637 ?auto_15644 ) ) ( not ( = ?auto_15637 ?auto_15658 ) ) ( not ( = ?auto_15638 ?auto_15644 ) ) ( not ( = ?auto_15638 ?auto_15658 ) ) ( not ( = ?auto_15639 ?auto_15644 ) ) ( not ( = ?auto_15639 ?auto_15658 ) ) ( not ( = ?auto_15640 ?auto_15644 ) ) ( not ( = ?auto_15640 ?auto_15658 ) ) ( not ( = ?auto_15641 ?auto_15644 ) ) ( not ( = ?auto_15641 ?auto_15658 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) ( not ( = ?auto_15642 ?auto_15658 ) ) ( not ( = ?auto_15644 ?auto_15654 ) ) ( not ( = ?auto_15644 ?auto_15670 ) ) ( not ( = ?auto_15644 ?auto_15669 ) ) ( not ( = ?auto_15644 ?auto_15666 ) ) ( not ( = ?auto_15644 ?auto_15655 ) ) ( not ( = ?auto_15644 ?auto_15671 ) ) ( not ( = ?auto_15644 ?auto_15661 ) ) ( not ( = ?auto_15644 ?auto_15673 ) ) ( not ( = ?auto_15658 ?auto_15654 ) ) ( not ( = ?auto_15658 ?auto_15670 ) ) ( not ( = ?auto_15658 ?auto_15669 ) ) ( not ( = ?auto_15658 ?auto_15666 ) ) ( not ( = ?auto_15658 ?auto_15655 ) ) ( not ( = ?auto_15658 ?auto_15671 ) ) ( not ( = ?auto_15658 ?auto_15661 ) ) ( not ( = ?auto_15658 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15635 ?auto_15674 ) ) ( not ( = ?auto_15636 ?auto_15645 ) ) ( not ( = ?auto_15636 ?auto_15674 ) ) ( not ( = ?auto_15637 ?auto_15645 ) ) ( not ( = ?auto_15637 ?auto_15674 ) ) ( not ( = ?auto_15638 ?auto_15645 ) ) ( not ( = ?auto_15638 ?auto_15674 ) ) ( not ( = ?auto_15639 ?auto_15645 ) ) ( not ( = ?auto_15639 ?auto_15674 ) ) ( not ( = ?auto_15640 ?auto_15645 ) ) ( not ( = ?auto_15640 ?auto_15674 ) ) ( not ( = ?auto_15641 ?auto_15645 ) ) ( not ( = ?auto_15641 ?auto_15674 ) ) ( not ( = ?auto_15642 ?auto_15645 ) ) ( not ( = ?auto_15642 ?auto_15674 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) ( not ( = ?auto_15643 ?auto_15674 ) ) ( not ( = ?auto_15645 ?auto_15658 ) ) ( not ( = ?auto_15645 ?auto_15654 ) ) ( not ( = ?auto_15645 ?auto_15670 ) ) ( not ( = ?auto_15645 ?auto_15669 ) ) ( not ( = ?auto_15645 ?auto_15666 ) ) ( not ( = ?auto_15645 ?auto_15655 ) ) ( not ( = ?auto_15645 ?auto_15671 ) ) ( not ( = ?auto_15645 ?auto_15661 ) ) ( not ( = ?auto_15645 ?auto_15673 ) ) ( not ( = ?auto_15674 ?auto_15658 ) ) ( not ( = ?auto_15674 ?auto_15654 ) ) ( not ( = ?auto_15674 ?auto_15670 ) ) ( not ( = ?auto_15674 ?auto_15669 ) ) ( not ( = ?auto_15674 ?auto_15666 ) ) ( not ( = ?auto_15674 ?auto_15655 ) ) ( not ( = ?auto_15674 ?auto_15671 ) ) ( not ( = ?auto_15674 ?auto_15661 ) ) ( not ( = ?auto_15674 ?auto_15673 ) ) ( not ( = ?auto_15635 ?auto_15646 ) ) ( not ( = ?auto_15635 ?auto_15647 ) ) ( not ( = ?auto_15636 ?auto_15646 ) ) ( not ( = ?auto_15636 ?auto_15647 ) ) ( not ( = ?auto_15637 ?auto_15646 ) ) ( not ( = ?auto_15637 ?auto_15647 ) ) ( not ( = ?auto_15638 ?auto_15646 ) ) ( not ( = ?auto_15638 ?auto_15647 ) ) ( not ( = ?auto_15639 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15647 ) ) ( not ( = ?auto_15640 ?auto_15646 ) ) ( not ( = ?auto_15640 ?auto_15647 ) ) ( not ( = ?auto_15641 ?auto_15646 ) ) ( not ( = ?auto_15641 ?auto_15647 ) ) ( not ( = ?auto_15642 ?auto_15646 ) ) ( not ( = ?auto_15642 ?auto_15647 ) ) ( not ( = ?auto_15643 ?auto_15646 ) ) ( not ( = ?auto_15643 ?auto_15647 ) ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15674 ) ) ( not ( = ?auto_15646 ?auto_15658 ) ) ( not ( = ?auto_15646 ?auto_15654 ) ) ( not ( = ?auto_15646 ?auto_15670 ) ) ( not ( = ?auto_15646 ?auto_15669 ) ) ( not ( = ?auto_15646 ?auto_15666 ) ) ( not ( = ?auto_15646 ?auto_15655 ) ) ( not ( = ?auto_15646 ?auto_15671 ) ) ( not ( = ?auto_15646 ?auto_15661 ) ) ( not ( = ?auto_15646 ?auto_15673 ) ) ( not ( = ?auto_15648 ?auto_15663 ) ) ( not ( = ?auto_15648 ?auto_15656 ) ) ( not ( = ?auto_15648 ?auto_15665 ) ) ( not ( = ?auto_15648 ?auto_15653 ) ) ( not ( = ?auto_15648 ?auto_15672 ) ) ( not ( = ?auto_15648 ?auto_15660 ) ) ( not ( = ?auto_15648 ?auto_15676 ) ) ( not ( = ?auto_15651 ?auto_15675 ) ) ( not ( = ?auto_15651 ?auto_15664 ) ) ( not ( = ?auto_15651 ?auto_15662 ) ) ( not ( = ?auto_15651 ?auto_15668 ) ) ( not ( = ?auto_15651 ?auto_15659 ) ) ( not ( = ?auto_15651 ?auto_15667 ) ) ( not ( = ?auto_15651 ?auto_15657 ) ) ( not ( = ?auto_15647 ?auto_15674 ) ) ( not ( = ?auto_15647 ?auto_15658 ) ) ( not ( = ?auto_15647 ?auto_15654 ) ) ( not ( = ?auto_15647 ?auto_15670 ) ) ( not ( = ?auto_15647 ?auto_15669 ) ) ( not ( = ?auto_15647 ?auto_15666 ) ) ( not ( = ?auto_15647 ?auto_15655 ) ) ( not ( = ?auto_15647 ?auto_15671 ) ) ( not ( = ?auto_15647 ?auto_15661 ) ) ( not ( = ?auto_15647 ?auto_15673 ) ) )
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
      ?auto_15713 - HOIST
      ?auto_15714 - PLACE
      ?auto_15717 - PLACE
      ?auto_15716 - HOIST
      ?auto_15718 - SURFACE
      ?auto_15727 - SURFACE
      ?auto_15736 - PLACE
      ?auto_15720 - HOIST
      ?auto_15739 - SURFACE
      ?auto_15742 - PLACE
      ?auto_15724 - HOIST
      ?auto_15733 - SURFACE
      ?auto_15743 - PLACE
      ?auto_15735 - HOIST
      ?auto_15729 - SURFACE
      ?auto_15722 - PLACE
      ?auto_15734 - HOIST
      ?auto_15738 - SURFACE
      ?auto_15723 - PLACE
      ?auto_15719 - HOIST
      ?auto_15741 - SURFACE
      ?auto_15732 - SURFACE
      ?auto_15737 - PLACE
      ?auto_15731 - HOIST
      ?auto_15730 - SURFACE
      ?auto_15726 - SURFACE
      ?auto_15740 - PLACE
      ?auto_15721 - HOIST
      ?auto_15725 - SURFACE
      ?auto_15728 - SURFACE
      ?auto_15715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15713 ?auto_15714 ) ( IS-CRATE ?auto_15712 ) ( not ( = ?auto_15717 ?auto_15714 ) ) ( HOIST-AT ?auto_15716 ?auto_15717 ) ( SURFACE-AT ?auto_15712 ?auto_15717 ) ( ON ?auto_15712 ?auto_15718 ) ( CLEAR ?auto_15712 ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15718 ) ) ( not ( = ?auto_15712 ?auto_15718 ) ) ( not ( = ?auto_15713 ?auto_15716 ) ) ( IS-CRATE ?auto_15711 ) ( AVAILABLE ?auto_15716 ) ( SURFACE-AT ?auto_15711 ?auto_15717 ) ( ON ?auto_15711 ?auto_15727 ) ( CLEAR ?auto_15711 ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15727 ) ) ( not ( = ?auto_15711 ?auto_15727 ) ) ( IS-CRATE ?auto_15710 ) ( not ( = ?auto_15736 ?auto_15714 ) ) ( HOIST-AT ?auto_15720 ?auto_15736 ) ( SURFACE-AT ?auto_15710 ?auto_15736 ) ( ON ?auto_15710 ?auto_15739 ) ( CLEAR ?auto_15710 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15739 ) ) ( not ( = ?auto_15710 ?auto_15739 ) ) ( not ( = ?auto_15713 ?auto_15720 ) ) ( IS-CRATE ?auto_15709 ) ( not ( = ?auto_15742 ?auto_15714 ) ) ( HOIST-AT ?auto_15724 ?auto_15742 ) ( SURFACE-AT ?auto_15709 ?auto_15742 ) ( ON ?auto_15709 ?auto_15733 ) ( CLEAR ?auto_15709 ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15733 ) ) ( not ( = ?auto_15709 ?auto_15733 ) ) ( not ( = ?auto_15713 ?auto_15724 ) ) ( IS-CRATE ?auto_15708 ) ( not ( = ?auto_15743 ?auto_15714 ) ) ( HOIST-AT ?auto_15735 ?auto_15743 ) ( AVAILABLE ?auto_15735 ) ( SURFACE-AT ?auto_15708 ?auto_15743 ) ( ON ?auto_15708 ?auto_15729 ) ( CLEAR ?auto_15708 ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15729 ) ) ( not ( = ?auto_15708 ?auto_15729 ) ) ( not ( = ?auto_15713 ?auto_15735 ) ) ( IS-CRATE ?auto_15707 ) ( not ( = ?auto_15722 ?auto_15714 ) ) ( HOIST-AT ?auto_15734 ?auto_15722 ) ( AVAILABLE ?auto_15734 ) ( SURFACE-AT ?auto_15707 ?auto_15722 ) ( ON ?auto_15707 ?auto_15738 ) ( CLEAR ?auto_15707 ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15738 ) ) ( not ( = ?auto_15707 ?auto_15738 ) ) ( not ( = ?auto_15713 ?auto_15734 ) ) ( IS-CRATE ?auto_15706 ) ( not ( = ?auto_15723 ?auto_15714 ) ) ( HOIST-AT ?auto_15719 ?auto_15723 ) ( AVAILABLE ?auto_15719 ) ( SURFACE-AT ?auto_15706 ?auto_15723 ) ( ON ?auto_15706 ?auto_15741 ) ( CLEAR ?auto_15706 ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15741 ) ) ( not ( = ?auto_15706 ?auto_15741 ) ) ( not ( = ?auto_15713 ?auto_15719 ) ) ( IS-CRATE ?auto_15705 ) ( SURFACE-AT ?auto_15705 ?auto_15736 ) ( ON ?auto_15705 ?auto_15732 ) ( CLEAR ?auto_15705 ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( not ( = ?auto_15704 ?auto_15732 ) ) ( not ( = ?auto_15705 ?auto_15732 ) ) ( IS-CRATE ?auto_15704 ) ( not ( = ?auto_15737 ?auto_15714 ) ) ( HOIST-AT ?auto_15731 ?auto_15737 ) ( AVAILABLE ?auto_15731 ) ( SURFACE-AT ?auto_15704 ?auto_15737 ) ( ON ?auto_15704 ?auto_15730 ) ( CLEAR ?auto_15704 ) ( not ( = ?auto_15703 ?auto_15704 ) ) ( not ( = ?auto_15703 ?auto_15730 ) ) ( not ( = ?auto_15704 ?auto_15730 ) ) ( not ( = ?auto_15713 ?auto_15731 ) ) ( IS-CRATE ?auto_15703 ) ( AVAILABLE ?auto_15724 ) ( SURFACE-AT ?auto_15703 ?auto_15742 ) ( ON ?auto_15703 ?auto_15726 ) ( CLEAR ?auto_15703 ) ( not ( = ?auto_15702 ?auto_15703 ) ) ( not ( = ?auto_15702 ?auto_15726 ) ) ( not ( = ?auto_15703 ?auto_15726 ) ) ( IS-CRATE ?auto_15702 ) ( not ( = ?auto_15740 ?auto_15714 ) ) ( HOIST-AT ?auto_15721 ?auto_15740 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15702 ?auto_15740 ) ( ON ?auto_15702 ?auto_15725 ) ( CLEAR ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15725 ) ) ( not ( = ?auto_15702 ?auto_15725 ) ) ( not ( = ?auto_15713 ?auto_15721 ) ) ( SURFACE-AT ?auto_15700 ?auto_15714 ) ( CLEAR ?auto_15700 ) ( IS-CRATE ?auto_15701 ) ( AVAILABLE ?auto_15713 ) ( AVAILABLE ?auto_15720 ) ( SURFACE-AT ?auto_15701 ?auto_15736 ) ( ON ?auto_15701 ?auto_15728 ) ( CLEAR ?auto_15701 ) ( TRUCK-AT ?auto_15715 ?auto_15714 ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15700 ?auto_15728 ) ) ( not ( = ?auto_15701 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15725 ) ) ( not ( = ?auto_15702 ?auto_15728 ) ) ( not ( = ?auto_15740 ?auto_15736 ) ) ( not ( = ?auto_15721 ?auto_15720 ) ) ( not ( = ?auto_15725 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15703 ) ) ( not ( = ?auto_15700 ?auto_15726 ) ) ( not ( = ?auto_15701 ?auto_15703 ) ) ( not ( = ?auto_15701 ?auto_15726 ) ) ( not ( = ?auto_15703 ?auto_15725 ) ) ( not ( = ?auto_15703 ?auto_15728 ) ) ( not ( = ?auto_15742 ?auto_15740 ) ) ( not ( = ?auto_15742 ?auto_15736 ) ) ( not ( = ?auto_15724 ?auto_15721 ) ) ( not ( = ?auto_15724 ?auto_15720 ) ) ( not ( = ?auto_15726 ?auto_15725 ) ) ( not ( = ?auto_15726 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15704 ) ) ( not ( = ?auto_15700 ?auto_15730 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15701 ?auto_15730 ) ) ( not ( = ?auto_15702 ?auto_15704 ) ) ( not ( = ?auto_15702 ?auto_15730 ) ) ( not ( = ?auto_15704 ?auto_15726 ) ) ( not ( = ?auto_15704 ?auto_15725 ) ) ( not ( = ?auto_15704 ?auto_15728 ) ) ( not ( = ?auto_15737 ?auto_15742 ) ) ( not ( = ?auto_15737 ?auto_15740 ) ) ( not ( = ?auto_15737 ?auto_15736 ) ) ( not ( = ?auto_15731 ?auto_15724 ) ) ( not ( = ?auto_15731 ?auto_15721 ) ) ( not ( = ?auto_15731 ?auto_15720 ) ) ( not ( = ?auto_15730 ?auto_15726 ) ) ( not ( = ?auto_15730 ?auto_15725 ) ) ( not ( = ?auto_15730 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15705 ) ) ( not ( = ?auto_15700 ?auto_15732 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15732 ) ) ( not ( = ?auto_15702 ?auto_15705 ) ) ( not ( = ?auto_15702 ?auto_15732 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15732 ) ) ( not ( = ?auto_15705 ?auto_15730 ) ) ( not ( = ?auto_15705 ?auto_15726 ) ) ( not ( = ?auto_15705 ?auto_15725 ) ) ( not ( = ?auto_15705 ?auto_15728 ) ) ( not ( = ?auto_15732 ?auto_15730 ) ) ( not ( = ?auto_15732 ?auto_15726 ) ) ( not ( = ?auto_15732 ?auto_15725 ) ) ( not ( = ?auto_15732 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15706 ) ) ( not ( = ?auto_15700 ?auto_15741 ) ) ( not ( = ?auto_15701 ?auto_15706 ) ) ( not ( = ?auto_15701 ?auto_15741 ) ) ( not ( = ?auto_15702 ?auto_15706 ) ) ( not ( = ?auto_15702 ?auto_15741 ) ) ( not ( = ?auto_15703 ?auto_15706 ) ) ( not ( = ?auto_15703 ?auto_15741 ) ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15704 ?auto_15741 ) ) ( not ( = ?auto_15706 ?auto_15732 ) ) ( not ( = ?auto_15706 ?auto_15730 ) ) ( not ( = ?auto_15706 ?auto_15726 ) ) ( not ( = ?auto_15706 ?auto_15725 ) ) ( not ( = ?auto_15706 ?auto_15728 ) ) ( not ( = ?auto_15723 ?auto_15736 ) ) ( not ( = ?auto_15723 ?auto_15737 ) ) ( not ( = ?auto_15723 ?auto_15742 ) ) ( not ( = ?auto_15723 ?auto_15740 ) ) ( not ( = ?auto_15719 ?auto_15720 ) ) ( not ( = ?auto_15719 ?auto_15731 ) ) ( not ( = ?auto_15719 ?auto_15724 ) ) ( not ( = ?auto_15719 ?auto_15721 ) ) ( not ( = ?auto_15741 ?auto_15732 ) ) ( not ( = ?auto_15741 ?auto_15730 ) ) ( not ( = ?auto_15741 ?auto_15726 ) ) ( not ( = ?auto_15741 ?auto_15725 ) ) ( not ( = ?auto_15741 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15700 ?auto_15738 ) ) ( not ( = ?auto_15701 ?auto_15707 ) ) ( not ( = ?auto_15701 ?auto_15738 ) ) ( not ( = ?auto_15702 ?auto_15707 ) ) ( not ( = ?auto_15702 ?auto_15738 ) ) ( not ( = ?auto_15703 ?auto_15707 ) ) ( not ( = ?auto_15703 ?auto_15738 ) ) ( not ( = ?auto_15704 ?auto_15707 ) ) ( not ( = ?auto_15704 ?auto_15738 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15738 ) ) ( not ( = ?auto_15707 ?auto_15741 ) ) ( not ( = ?auto_15707 ?auto_15732 ) ) ( not ( = ?auto_15707 ?auto_15730 ) ) ( not ( = ?auto_15707 ?auto_15726 ) ) ( not ( = ?auto_15707 ?auto_15725 ) ) ( not ( = ?auto_15707 ?auto_15728 ) ) ( not ( = ?auto_15722 ?auto_15723 ) ) ( not ( = ?auto_15722 ?auto_15736 ) ) ( not ( = ?auto_15722 ?auto_15737 ) ) ( not ( = ?auto_15722 ?auto_15742 ) ) ( not ( = ?auto_15722 ?auto_15740 ) ) ( not ( = ?auto_15734 ?auto_15719 ) ) ( not ( = ?auto_15734 ?auto_15720 ) ) ( not ( = ?auto_15734 ?auto_15731 ) ) ( not ( = ?auto_15734 ?auto_15724 ) ) ( not ( = ?auto_15734 ?auto_15721 ) ) ( not ( = ?auto_15738 ?auto_15741 ) ) ( not ( = ?auto_15738 ?auto_15732 ) ) ( not ( = ?auto_15738 ?auto_15730 ) ) ( not ( = ?auto_15738 ?auto_15726 ) ) ( not ( = ?auto_15738 ?auto_15725 ) ) ( not ( = ?auto_15738 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15700 ?auto_15729 ) ) ( not ( = ?auto_15701 ?auto_15708 ) ) ( not ( = ?auto_15701 ?auto_15729 ) ) ( not ( = ?auto_15702 ?auto_15708 ) ) ( not ( = ?auto_15702 ?auto_15729 ) ) ( not ( = ?auto_15703 ?auto_15708 ) ) ( not ( = ?auto_15703 ?auto_15729 ) ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( not ( = ?auto_15704 ?auto_15729 ) ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15705 ?auto_15729 ) ) ( not ( = ?auto_15706 ?auto_15708 ) ) ( not ( = ?auto_15706 ?auto_15729 ) ) ( not ( = ?auto_15708 ?auto_15738 ) ) ( not ( = ?auto_15708 ?auto_15741 ) ) ( not ( = ?auto_15708 ?auto_15732 ) ) ( not ( = ?auto_15708 ?auto_15730 ) ) ( not ( = ?auto_15708 ?auto_15726 ) ) ( not ( = ?auto_15708 ?auto_15725 ) ) ( not ( = ?auto_15708 ?auto_15728 ) ) ( not ( = ?auto_15743 ?auto_15722 ) ) ( not ( = ?auto_15743 ?auto_15723 ) ) ( not ( = ?auto_15743 ?auto_15736 ) ) ( not ( = ?auto_15743 ?auto_15737 ) ) ( not ( = ?auto_15743 ?auto_15742 ) ) ( not ( = ?auto_15743 ?auto_15740 ) ) ( not ( = ?auto_15735 ?auto_15734 ) ) ( not ( = ?auto_15735 ?auto_15719 ) ) ( not ( = ?auto_15735 ?auto_15720 ) ) ( not ( = ?auto_15735 ?auto_15731 ) ) ( not ( = ?auto_15735 ?auto_15724 ) ) ( not ( = ?auto_15735 ?auto_15721 ) ) ( not ( = ?auto_15729 ?auto_15738 ) ) ( not ( = ?auto_15729 ?auto_15741 ) ) ( not ( = ?auto_15729 ?auto_15732 ) ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15726 ) ) ( not ( = ?auto_15729 ?auto_15725 ) ) ( not ( = ?auto_15729 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15709 ) ) ( not ( = ?auto_15700 ?auto_15733 ) ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( not ( = ?auto_15701 ?auto_15733 ) ) ( not ( = ?auto_15702 ?auto_15709 ) ) ( not ( = ?auto_15702 ?auto_15733 ) ) ( not ( = ?auto_15703 ?auto_15709 ) ) ( not ( = ?auto_15703 ?auto_15733 ) ) ( not ( = ?auto_15704 ?auto_15709 ) ) ( not ( = ?auto_15704 ?auto_15733 ) ) ( not ( = ?auto_15705 ?auto_15709 ) ) ( not ( = ?auto_15705 ?auto_15733 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15733 ) ) ( not ( = ?auto_15707 ?auto_15709 ) ) ( not ( = ?auto_15707 ?auto_15733 ) ) ( not ( = ?auto_15709 ?auto_15729 ) ) ( not ( = ?auto_15709 ?auto_15738 ) ) ( not ( = ?auto_15709 ?auto_15741 ) ) ( not ( = ?auto_15709 ?auto_15732 ) ) ( not ( = ?auto_15709 ?auto_15730 ) ) ( not ( = ?auto_15709 ?auto_15726 ) ) ( not ( = ?auto_15709 ?auto_15725 ) ) ( not ( = ?auto_15709 ?auto_15728 ) ) ( not ( = ?auto_15733 ?auto_15729 ) ) ( not ( = ?auto_15733 ?auto_15738 ) ) ( not ( = ?auto_15733 ?auto_15741 ) ) ( not ( = ?auto_15733 ?auto_15732 ) ) ( not ( = ?auto_15733 ?auto_15730 ) ) ( not ( = ?auto_15733 ?auto_15726 ) ) ( not ( = ?auto_15733 ?auto_15725 ) ) ( not ( = ?auto_15733 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15710 ) ) ( not ( = ?auto_15700 ?auto_15739 ) ) ( not ( = ?auto_15701 ?auto_15710 ) ) ( not ( = ?auto_15701 ?auto_15739 ) ) ( not ( = ?auto_15702 ?auto_15710 ) ) ( not ( = ?auto_15702 ?auto_15739 ) ) ( not ( = ?auto_15703 ?auto_15710 ) ) ( not ( = ?auto_15703 ?auto_15739 ) ) ( not ( = ?auto_15704 ?auto_15710 ) ) ( not ( = ?auto_15704 ?auto_15739 ) ) ( not ( = ?auto_15705 ?auto_15710 ) ) ( not ( = ?auto_15705 ?auto_15739 ) ) ( not ( = ?auto_15706 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15739 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( not ( = ?auto_15707 ?auto_15739 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( not ( = ?auto_15708 ?auto_15739 ) ) ( not ( = ?auto_15710 ?auto_15733 ) ) ( not ( = ?auto_15710 ?auto_15729 ) ) ( not ( = ?auto_15710 ?auto_15738 ) ) ( not ( = ?auto_15710 ?auto_15741 ) ) ( not ( = ?auto_15710 ?auto_15732 ) ) ( not ( = ?auto_15710 ?auto_15730 ) ) ( not ( = ?auto_15710 ?auto_15726 ) ) ( not ( = ?auto_15710 ?auto_15725 ) ) ( not ( = ?auto_15710 ?auto_15728 ) ) ( not ( = ?auto_15739 ?auto_15733 ) ) ( not ( = ?auto_15739 ?auto_15729 ) ) ( not ( = ?auto_15739 ?auto_15738 ) ) ( not ( = ?auto_15739 ?auto_15741 ) ) ( not ( = ?auto_15739 ?auto_15732 ) ) ( not ( = ?auto_15739 ?auto_15730 ) ) ( not ( = ?auto_15739 ?auto_15726 ) ) ( not ( = ?auto_15739 ?auto_15725 ) ) ( not ( = ?auto_15739 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15711 ) ) ( not ( = ?auto_15700 ?auto_15727 ) ) ( not ( = ?auto_15701 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15727 ) ) ( not ( = ?auto_15702 ?auto_15711 ) ) ( not ( = ?auto_15702 ?auto_15727 ) ) ( not ( = ?auto_15703 ?auto_15711 ) ) ( not ( = ?auto_15703 ?auto_15727 ) ) ( not ( = ?auto_15704 ?auto_15711 ) ) ( not ( = ?auto_15704 ?auto_15727 ) ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( not ( = ?auto_15705 ?auto_15727 ) ) ( not ( = ?auto_15706 ?auto_15711 ) ) ( not ( = ?auto_15706 ?auto_15727 ) ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15707 ?auto_15727 ) ) ( not ( = ?auto_15708 ?auto_15711 ) ) ( not ( = ?auto_15708 ?auto_15727 ) ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15727 ) ) ( not ( = ?auto_15711 ?auto_15739 ) ) ( not ( = ?auto_15711 ?auto_15733 ) ) ( not ( = ?auto_15711 ?auto_15729 ) ) ( not ( = ?auto_15711 ?auto_15738 ) ) ( not ( = ?auto_15711 ?auto_15741 ) ) ( not ( = ?auto_15711 ?auto_15732 ) ) ( not ( = ?auto_15711 ?auto_15730 ) ) ( not ( = ?auto_15711 ?auto_15726 ) ) ( not ( = ?auto_15711 ?auto_15725 ) ) ( not ( = ?auto_15711 ?auto_15728 ) ) ( not ( = ?auto_15717 ?auto_15736 ) ) ( not ( = ?auto_15717 ?auto_15742 ) ) ( not ( = ?auto_15717 ?auto_15743 ) ) ( not ( = ?auto_15717 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15723 ) ) ( not ( = ?auto_15717 ?auto_15737 ) ) ( not ( = ?auto_15717 ?auto_15740 ) ) ( not ( = ?auto_15716 ?auto_15720 ) ) ( not ( = ?auto_15716 ?auto_15724 ) ) ( not ( = ?auto_15716 ?auto_15735 ) ) ( not ( = ?auto_15716 ?auto_15734 ) ) ( not ( = ?auto_15716 ?auto_15719 ) ) ( not ( = ?auto_15716 ?auto_15731 ) ) ( not ( = ?auto_15716 ?auto_15721 ) ) ( not ( = ?auto_15727 ?auto_15739 ) ) ( not ( = ?auto_15727 ?auto_15733 ) ) ( not ( = ?auto_15727 ?auto_15729 ) ) ( not ( = ?auto_15727 ?auto_15738 ) ) ( not ( = ?auto_15727 ?auto_15741 ) ) ( not ( = ?auto_15727 ?auto_15732 ) ) ( not ( = ?auto_15727 ?auto_15730 ) ) ( not ( = ?auto_15727 ?auto_15726 ) ) ( not ( = ?auto_15727 ?auto_15725 ) ) ( not ( = ?auto_15727 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15712 ) ) ( not ( = ?auto_15700 ?auto_15718 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( not ( = ?auto_15701 ?auto_15718 ) ) ( not ( = ?auto_15702 ?auto_15712 ) ) ( not ( = ?auto_15702 ?auto_15718 ) ) ( not ( = ?auto_15703 ?auto_15712 ) ) ( not ( = ?auto_15703 ?auto_15718 ) ) ( not ( = ?auto_15704 ?auto_15712 ) ) ( not ( = ?auto_15704 ?auto_15718 ) ) ( not ( = ?auto_15705 ?auto_15712 ) ) ( not ( = ?auto_15705 ?auto_15718 ) ) ( not ( = ?auto_15706 ?auto_15712 ) ) ( not ( = ?auto_15706 ?auto_15718 ) ) ( not ( = ?auto_15707 ?auto_15712 ) ) ( not ( = ?auto_15707 ?auto_15718 ) ) ( not ( = ?auto_15708 ?auto_15712 ) ) ( not ( = ?auto_15708 ?auto_15718 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15709 ?auto_15718 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15718 ) ) ( not ( = ?auto_15712 ?auto_15727 ) ) ( not ( = ?auto_15712 ?auto_15739 ) ) ( not ( = ?auto_15712 ?auto_15733 ) ) ( not ( = ?auto_15712 ?auto_15729 ) ) ( not ( = ?auto_15712 ?auto_15738 ) ) ( not ( = ?auto_15712 ?auto_15741 ) ) ( not ( = ?auto_15712 ?auto_15732 ) ) ( not ( = ?auto_15712 ?auto_15730 ) ) ( not ( = ?auto_15712 ?auto_15726 ) ) ( not ( = ?auto_15712 ?auto_15725 ) ) ( not ( = ?auto_15712 ?auto_15728 ) ) ( not ( = ?auto_15718 ?auto_15727 ) ) ( not ( = ?auto_15718 ?auto_15739 ) ) ( not ( = ?auto_15718 ?auto_15733 ) ) ( not ( = ?auto_15718 ?auto_15729 ) ) ( not ( = ?auto_15718 ?auto_15738 ) ) ( not ( = ?auto_15718 ?auto_15741 ) ) ( not ( = ?auto_15718 ?auto_15732 ) ) ( not ( = ?auto_15718 ?auto_15730 ) ) ( not ( = ?auto_15718 ?auto_15726 ) ) ( not ( = ?auto_15718 ?auto_15725 ) ) ( not ( = ?auto_15718 ?auto_15728 ) ) )
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
      ?auto_15785 - HOIST
      ?auto_15783 - PLACE
      ?auto_15787 - PLACE
      ?auto_15786 - HOIST
      ?auto_15784 - SURFACE
      ?auto_15800 - PLACE
      ?auto_15812 - HOIST
      ?auto_15805 - SURFACE
      ?auto_15811 - SURFACE
      ?auto_15809 - PLACE
      ?auto_15788 - HOIST
      ?auto_15794 - SURFACE
      ?auto_15789 - PLACE
      ?auto_15797 - HOIST
      ?auto_15799 - SURFACE
      ?auto_15808 - PLACE
      ?auto_15793 - HOIST
      ?auto_15804 - SURFACE
      ?auto_15802 - PLACE
      ?auto_15790 - HOIST
      ?auto_15810 - SURFACE
      ?auto_15803 - PLACE
      ?auto_15807 - HOIST
      ?auto_15795 - SURFACE
      ?auto_15792 - SURFACE
      ?auto_15796 - SURFACE
      ?auto_15791 - SURFACE
      ?auto_15806 - PLACE
      ?auto_15798 - HOIST
      ?auto_15813 - SURFACE
      ?auto_15801 - SURFACE
      ?auto_15782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15785 ?auto_15783 ) ( IS-CRATE ?auto_15781 ) ( not ( = ?auto_15787 ?auto_15783 ) ) ( HOIST-AT ?auto_15786 ?auto_15787 ) ( SURFACE-AT ?auto_15781 ?auto_15787 ) ( ON ?auto_15781 ?auto_15784 ) ( CLEAR ?auto_15781 ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15784 ) ) ( not ( = ?auto_15781 ?auto_15784 ) ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( IS-CRATE ?auto_15780 ) ( not ( = ?auto_15800 ?auto_15783 ) ) ( HOIST-AT ?auto_15812 ?auto_15800 ) ( SURFACE-AT ?auto_15780 ?auto_15800 ) ( ON ?auto_15780 ?auto_15805 ) ( CLEAR ?auto_15780 ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15805 ) ) ( not ( = ?auto_15780 ?auto_15805 ) ) ( not ( = ?auto_15785 ?auto_15812 ) ) ( IS-CRATE ?auto_15779 ) ( AVAILABLE ?auto_15812 ) ( SURFACE-AT ?auto_15779 ?auto_15800 ) ( ON ?auto_15779 ?auto_15811 ) ( CLEAR ?auto_15779 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15811 ) ) ( not ( = ?auto_15779 ?auto_15811 ) ) ( IS-CRATE ?auto_15778 ) ( not ( = ?auto_15809 ?auto_15783 ) ) ( HOIST-AT ?auto_15788 ?auto_15809 ) ( SURFACE-AT ?auto_15778 ?auto_15809 ) ( ON ?auto_15778 ?auto_15794 ) ( CLEAR ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15794 ) ) ( not ( = ?auto_15778 ?auto_15794 ) ) ( not ( = ?auto_15785 ?auto_15788 ) ) ( IS-CRATE ?auto_15777 ) ( not ( = ?auto_15789 ?auto_15783 ) ) ( HOIST-AT ?auto_15797 ?auto_15789 ) ( SURFACE-AT ?auto_15777 ?auto_15789 ) ( ON ?auto_15777 ?auto_15799 ) ( CLEAR ?auto_15777 ) ( not ( = ?auto_15776 ?auto_15777 ) ) ( not ( = ?auto_15776 ?auto_15799 ) ) ( not ( = ?auto_15777 ?auto_15799 ) ) ( not ( = ?auto_15785 ?auto_15797 ) ) ( IS-CRATE ?auto_15776 ) ( not ( = ?auto_15808 ?auto_15783 ) ) ( HOIST-AT ?auto_15793 ?auto_15808 ) ( AVAILABLE ?auto_15793 ) ( SURFACE-AT ?auto_15776 ?auto_15808 ) ( ON ?auto_15776 ?auto_15804 ) ( CLEAR ?auto_15776 ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15775 ?auto_15804 ) ) ( not ( = ?auto_15776 ?auto_15804 ) ) ( not ( = ?auto_15785 ?auto_15793 ) ) ( IS-CRATE ?auto_15775 ) ( not ( = ?auto_15802 ?auto_15783 ) ) ( HOIST-AT ?auto_15790 ?auto_15802 ) ( AVAILABLE ?auto_15790 ) ( SURFACE-AT ?auto_15775 ?auto_15802 ) ( ON ?auto_15775 ?auto_15810 ) ( CLEAR ?auto_15775 ) ( not ( = ?auto_15774 ?auto_15775 ) ) ( not ( = ?auto_15774 ?auto_15810 ) ) ( not ( = ?auto_15775 ?auto_15810 ) ) ( not ( = ?auto_15785 ?auto_15790 ) ) ( IS-CRATE ?auto_15774 ) ( not ( = ?auto_15803 ?auto_15783 ) ) ( HOIST-AT ?auto_15807 ?auto_15803 ) ( AVAILABLE ?auto_15807 ) ( SURFACE-AT ?auto_15774 ?auto_15803 ) ( ON ?auto_15774 ?auto_15795 ) ( CLEAR ?auto_15774 ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15795 ) ) ( not ( = ?auto_15774 ?auto_15795 ) ) ( not ( = ?auto_15785 ?auto_15807 ) ) ( IS-CRATE ?auto_15773 ) ( SURFACE-AT ?auto_15773 ?auto_15809 ) ( ON ?auto_15773 ?auto_15792 ) ( CLEAR ?auto_15773 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15792 ) ) ( not ( = ?auto_15773 ?auto_15792 ) ) ( IS-CRATE ?auto_15772 ) ( AVAILABLE ?auto_15786 ) ( SURFACE-AT ?auto_15772 ?auto_15787 ) ( ON ?auto_15772 ?auto_15796 ) ( CLEAR ?auto_15772 ) ( not ( = ?auto_15771 ?auto_15772 ) ) ( not ( = ?auto_15771 ?auto_15796 ) ) ( not ( = ?auto_15772 ?auto_15796 ) ) ( IS-CRATE ?auto_15771 ) ( AVAILABLE ?auto_15797 ) ( SURFACE-AT ?auto_15771 ?auto_15789 ) ( ON ?auto_15771 ?auto_15791 ) ( CLEAR ?auto_15771 ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15791 ) ) ( not ( = ?auto_15771 ?auto_15791 ) ) ( IS-CRATE ?auto_15770 ) ( not ( = ?auto_15806 ?auto_15783 ) ) ( HOIST-AT ?auto_15798 ?auto_15806 ) ( AVAILABLE ?auto_15798 ) ( SURFACE-AT ?auto_15770 ?auto_15806 ) ( ON ?auto_15770 ?auto_15813 ) ( CLEAR ?auto_15770 ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15813 ) ) ( not ( = ?auto_15770 ?auto_15813 ) ) ( not ( = ?auto_15785 ?auto_15798 ) ) ( SURFACE-AT ?auto_15768 ?auto_15783 ) ( CLEAR ?auto_15768 ) ( IS-CRATE ?auto_15769 ) ( AVAILABLE ?auto_15785 ) ( AVAILABLE ?auto_15788 ) ( SURFACE-AT ?auto_15769 ?auto_15809 ) ( ON ?auto_15769 ?auto_15801 ) ( CLEAR ?auto_15769 ) ( TRUCK-AT ?auto_15782 ?auto_15783 ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15801 ) ) ( not ( = ?auto_15769 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15770 ) ) ( not ( = ?auto_15768 ?auto_15813 ) ) ( not ( = ?auto_15770 ?auto_15801 ) ) ( not ( = ?auto_15806 ?auto_15809 ) ) ( not ( = ?auto_15798 ?auto_15788 ) ) ( not ( = ?auto_15813 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15791 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15791 ) ) ( not ( = ?auto_15771 ?auto_15813 ) ) ( not ( = ?auto_15771 ?auto_15801 ) ) ( not ( = ?auto_15789 ?auto_15806 ) ) ( not ( = ?auto_15789 ?auto_15809 ) ) ( not ( = ?auto_15797 ?auto_15798 ) ) ( not ( = ?auto_15797 ?auto_15788 ) ) ( not ( = ?auto_15791 ?auto_15813 ) ) ( not ( = ?auto_15791 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15772 ) ) ( not ( = ?auto_15768 ?auto_15796 ) ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15769 ?auto_15796 ) ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( not ( = ?auto_15770 ?auto_15796 ) ) ( not ( = ?auto_15772 ?auto_15791 ) ) ( not ( = ?auto_15772 ?auto_15813 ) ) ( not ( = ?auto_15772 ?auto_15801 ) ) ( not ( = ?auto_15787 ?auto_15789 ) ) ( not ( = ?auto_15787 ?auto_15806 ) ) ( not ( = ?auto_15787 ?auto_15809 ) ) ( not ( = ?auto_15786 ?auto_15797 ) ) ( not ( = ?auto_15786 ?auto_15798 ) ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15796 ?auto_15791 ) ) ( not ( = ?auto_15796 ?auto_15813 ) ) ( not ( = ?auto_15796 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15773 ) ) ( not ( = ?auto_15768 ?auto_15792 ) ) ( not ( = ?auto_15769 ?auto_15773 ) ) ( not ( = ?auto_15769 ?auto_15792 ) ) ( not ( = ?auto_15770 ?auto_15773 ) ) ( not ( = ?auto_15770 ?auto_15792 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15792 ) ) ( not ( = ?auto_15773 ?auto_15796 ) ) ( not ( = ?auto_15773 ?auto_15791 ) ) ( not ( = ?auto_15773 ?auto_15813 ) ) ( not ( = ?auto_15773 ?auto_15801 ) ) ( not ( = ?auto_15792 ?auto_15796 ) ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( not ( = ?auto_15792 ?auto_15813 ) ) ( not ( = ?auto_15792 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( not ( = ?auto_15768 ?auto_15795 ) ) ( not ( = ?auto_15769 ?auto_15774 ) ) ( not ( = ?auto_15769 ?auto_15795 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( not ( = ?auto_15770 ?auto_15795 ) ) ( not ( = ?auto_15771 ?auto_15774 ) ) ( not ( = ?auto_15771 ?auto_15795 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15795 ) ) ( not ( = ?auto_15774 ?auto_15792 ) ) ( not ( = ?auto_15774 ?auto_15796 ) ) ( not ( = ?auto_15774 ?auto_15791 ) ) ( not ( = ?auto_15774 ?auto_15813 ) ) ( not ( = ?auto_15774 ?auto_15801 ) ) ( not ( = ?auto_15803 ?auto_15809 ) ) ( not ( = ?auto_15803 ?auto_15787 ) ) ( not ( = ?auto_15803 ?auto_15789 ) ) ( not ( = ?auto_15803 ?auto_15806 ) ) ( not ( = ?auto_15807 ?auto_15788 ) ) ( not ( = ?auto_15807 ?auto_15786 ) ) ( not ( = ?auto_15807 ?auto_15797 ) ) ( not ( = ?auto_15807 ?auto_15798 ) ) ( not ( = ?auto_15795 ?auto_15792 ) ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15791 ) ) ( not ( = ?auto_15795 ?auto_15813 ) ) ( not ( = ?auto_15795 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( not ( = ?auto_15768 ?auto_15810 ) ) ( not ( = ?auto_15769 ?auto_15775 ) ) ( not ( = ?auto_15769 ?auto_15810 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( not ( = ?auto_15770 ?auto_15810 ) ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( not ( = ?auto_15771 ?auto_15810 ) ) ( not ( = ?auto_15772 ?auto_15775 ) ) ( not ( = ?auto_15772 ?auto_15810 ) ) ( not ( = ?auto_15773 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15810 ) ) ( not ( = ?auto_15775 ?auto_15795 ) ) ( not ( = ?auto_15775 ?auto_15792 ) ) ( not ( = ?auto_15775 ?auto_15796 ) ) ( not ( = ?auto_15775 ?auto_15791 ) ) ( not ( = ?auto_15775 ?auto_15813 ) ) ( not ( = ?auto_15775 ?auto_15801 ) ) ( not ( = ?auto_15802 ?auto_15803 ) ) ( not ( = ?auto_15802 ?auto_15809 ) ) ( not ( = ?auto_15802 ?auto_15787 ) ) ( not ( = ?auto_15802 ?auto_15789 ) ) ( not ( = ?auto_15802 ?auto_15806 ) ) ( not ( = ?auto_15790 ?auto_15807 ) ) ( not ( = ?auto_15790 ?auto_15788 ) ) ( not ( = ?auto_15790 ?auto_15786 ) ) ( not ( = ?auto_15790 ?auto_15797 ) ) ( not ( = ?auto_15790 ?auto_15798 ) ) ( not ( = ?auto_15810 ?auto_15795 ) ) ( not ( = ?auto_15810 ?auto_15792 ) ) ( not ( = ?auto_15810 ?auto_15796 ) ) ( not ( = ?auto_15810 ?auto_15791 ) ) ( not ( = ?auto_15810 ?auto_15813 ) ) ( not ( = ?auto_15810 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15776 ) ) ( not ( = ?auto_15768 ?auto_15804 ) ) ( not ( = ?auto_15769 ?auto_15776 ) ) ( not ( = ?auto_15769 ?auto_15804 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( not ( = ?auto_15770 ?auto_15804 ) ) ( not ( = ?auto_15771 ?auto_15776 ) ) ( not ( = ?auto_15771 ?auto_15804 ) ) ( not ( = ?auto_15772 ?auto_15776 ) ) ( not ( = ?auto_15772 ?auto_15804 ) ) ( not ( = ?auto_15773 ?auto_15776 ) ) ( not ( = ?auto_15773 ?auto_15804 ) ) ( not ( = ?auto_15774 ?auto_15776 ) ) ( not ( = ?auto_15774 ?auto_15804 ) ) ( not ( = ?auto_15776 ?auto_15810 ) ) ( not ( = ?auto_15776 ?auto_15795 ) ) ( not ( = ?auto_15776 ?auto_15792 ) ) ( not ( = ?auto_15776 ?auto_15796 ) ) ( not ( = ?auto_15776 ?auto_15791 ) ) ( not ( = ?auto_15776 ?auto_15813 ) ) ( not ( = ?auto_15776 ?auto_15801 ) ) ( not ( = ?auto_15808 ?auto_15802 ) ) ( not ( = ?auto_15808 ?auto_15803 ) ) ( not ( = ?auto_15808 ?auto_15809 ) ) ( not ( = ?auto_15808 ?auto_15787 ) ) ( not ( = ?auto_15808 ?auto_15789 ) ) ( not ( = ?auto_15808 ?auto_15806 ) ) ( not ( = ?auto_15793 ?auto_15790 ) ) ( not ( = ?auto_15793 ?auto_15807 ) ) ( not ( = ?auto_15793 ?auto_15788 ) ) ( not ( = ?auto_15793 ?auto_15786 ) ) ( not ( = ?auto_15793 ?auto_15797 ) ) ( not ( = ?auto_15793 ?auto_15798 ) ) ( not ( = ?auto_15804 ?auto_15810 ) ) ( not ( = ?auto_15804 ?auto_15795 ) ) ( not ( = ?auto_15804 ?auto_15792 ) ) ( not ( = ?auto_15804 ?auto_15796 ) ) ( not ( = ?auto_15804 ?auto_15791 ) ) ( not ( = ?auto_15804 ?auto_15813 ) ) ( not ( = ?auto_15804 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15777 ) ) ( not ( = ?auto_15768 ?auto_15799 ) ) ( not ( = ?auto_15769 ?auto_15777 ) ) ( not ( = ?auto_15769 ?auto_15799 ) ) ( not ( = ?auto_15770 ?auto_15777 ) ) ( not ( = ?auto_15770 ?auto_15799 ) ) ( not ( = ?auto_15771 ?auto_15777 ) ) ( not ( = ?auto_15771 ?auto_15799 ) ) ( not ( = ?auto_15772 ?auto_15777 ) ) ( not ( = ?auto_15772 ?auto_15799 ) ) ( not ( = ?auto_15773 ?auto_15777 ) ) ( not ( = ?auto_15773 ?auto_15799 ) ) ( not ( = ?auto_15774 ?auto_15777 ) ) ( not ( = ?auto_15774 ?auto_15799 ) ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( not ( = ?auto_15775 ?auto_15799 ) ) ( not ( = ?auto_15777 ?auto_15804 ) ) ( not ( = ?auto_15777 ?auto_15810 ) ) ( not ( = ?auto_15777 ?auto_15795 ) ) ( not ( = ?auto_15777 ?auto_15792 ) ) ( not ( = ?auto_15777 ?auto_15796 ) ) ( not ( = ?auto_15777 ?auto_15791 ) ) ( not ( = ?auto_15777 ?auto_15813 ) ) ( not ( = ?auto_15777 ?auto_15801 ) ) ( not ( = ?auto_15799 ?auto_15804 ) ) ( not ( = ?auto_15799 ?auto_15810 ) ) ( not ( = ?auto_15799 ?auto_15795 ) ) ( not ( = ?auto_15799 ?auto_15792 ) ) ( not ( = ?auto_15799 ?auto_15796 ) ) ( not ( = ?auto_15799 ?auto_15791 ) ) ( not ( = ?auto_15799 ?auto_15813 ) ) ( not ( = ?auto_15799 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15778 ) ) ( not ( = ?auto_15768 ?auto_15794 ) ) ( not ( = ?auto_15769 ?auto_15778 ) ) ( not ( = ?auto_15769 ?auto_15794 ) ) ( not ( = ?auto_15770 ?auto_15778 ) ) ( not ( = ?auto_15770 ?auto_15794 ) ) ( not ( = ?auto_15771 ?auto_15778 ) ) ( not ( = ?auto_15771 ?auto_15794 ) ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( not ( = ?auto_15772 ?auto_15794 ) ) ( not ( = ?auto_15773 ?auto_15778 ) ) ( not ( = ?auto_15773 ?auto_15794 ) ) ( not ( = ?auto_15774 ?auto_15778 ) ) ( not ( = ?auto_15774 ?auto_15794 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15794 ) ) ( not ( = ?auto_15776 ?auto_15778 ) ) ( not ( = ?auto_15776 ?auto_15794 ) ) ( not ( = ?auto_15778 ?auto_15799 ) ) ( not ( = ?auto_15778 ?auto_15804 ) ) ( not ( = ?auto_15778 ?auto_15810 ) ) ( not ( = ?auto_15778 ?auto_15795 ) ) ( not ( = ?auto_15778 ?auto_15792 ) ) ( not ( = ?auto_15778 ?auto_15796 ) ) ( not ( = ?auto_15778 ?auto_15791 ) ) ( not ( = ?auto_15778 ?auto_15813 ) ) ( not ( = ?auto_15778 ?auto_15801 ) ) ( not ( = ?auto_15794 ?auto_15799 ) ) ( not ( = ?auto_15794 ?auto_15804 ) ) ( not ( = ?auto_15794 ?auto_15810 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15792 ) ) ( not ( = ?auto_15794 ?auto_15796 ) ) ( not ( = ?auto_15794 ?auto_15791 ) ) ( not ( = ?auto_15794 ?auto_15813 ) ) ( not ( = ?auto_15794 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15779 ) ) ( not ( = ?auto_15768 ?auto_15811 ) ) ( not ( = ?auto_15769 ?auto_15779 ) ) ( not ( = ?auto_15769 ?auto_15811 ) ) ( not ( = ?auto_15770 ?auto_15779 ) ) ( not ( = ?auto_15770 ?auto_15811 ) ) ( not ( = ?auto_15771 ?auto_15779 ) ) ( not ( = ?auto_15771 ?auto_15811 ) ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15772 ?auto_15811 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( not ( = ?auto_15773 ?auto_15811 ) ) ( not ( = ?auto_15774 ?auto_15779 ) ) ( not ( = ?auto_15774 ?auto_15811 ) ) ( not ( = ?auto_15775 ?auto_15779 ) ) ( not ( = ?auto_15775 ?auto_15811 ) ) ( not ( = ?auto_15776 ?auto_15779 ) ) ( not ( = ?auto_15776 ?auto_15811 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15811 ) ) ( not ( = ?auto_15779 ?auto_15794 ) ) ( not ( = ?auto_15779 ?auto_15799 ) ) ( not ( = ?auto_15779 ?auto_15804 ) ) ( not ( = ?auto_15779 ?auto_15810 ) ) ( not ( = ?auto_15779 ?auto_15795 ) ) ( not ( = ?auto_15779 ?auto_15792 ) ) ( not ( = ?auto_15779 ?auto_15796 ) ) ( not ( = ?auto_15779 ?auto_15791 ) ) ( not ( = ?auto_15779 ?auto_15813 ) ) ( not ( = ?auto_15779 ?auto_15801 ) ) ( not ( = ?auto_15800 ?auto_15809 ) ) ( not ( = ?auto_15800 ?auto_15789 ) ) ( not ( = ?auto_15800 ?auto_15808 ) ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15800 ?auto_15803 ) ) ( not ( = ?auto_15800 ?auto_15787 ) ) ( not ( = ?auto_15800 ?auto_15806 ) ) ( not ( = ?auto_15812 ?auto_15788 ) ) ( not ( = ?auto_15812 ?auto_15797 ) ) ( not ( = ?auto_15812 ?auto_15793 ) ) ( not ( = ?auto_15812 ?auto_15790 ) ) ( not ( = ?auto_15812 ?auto_15807 ) ) ( not ( = ?auto_15812 ?auto_15786 ) ) ( not ( = ?auto_15812 ?auto_15798 ) ) ( not ( = ?auto_15811 ?auto_15794 ) ) ( not ( = ?auto_15811 ?auto_15799 ) ) ( not ( = ?auto_15811 ?auto_15804 ) ) ( not ( = ?auto_15811 ?auto_15810 ) ) ( not ( = ?auto_15811 ?auto_15795 ) ) ( not ( = ?auto_15811 ?auto_15792 ) ) ( not ( = ?auto_15811 ?auto_15796 ) ) ( not ( = ?auto_15811 ?auto_15791 ) ) ( not ( = ?auto_15811 ?auto_15813 ) ) ( not ( = ?auto_15811 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15780 ) ) ( not ( = ?auto_15768 ?auto_15805 ) ) ( not ( = ?auto_15769 ?auto_15780 ) ) ( not ( = ?auto_15769 ?auto_15805 ) ) ( not ( = ?auto_15770 ?auto_15780 ) ) ( not ( = ?auto_15770 ?auto_15805 ) ) ( not ( = ?auto_15771 ?auto_15780 ) ) ( not ( = ?auto_15771 ?auto_15805 ) ) ( not ( = ?auto_15772 ?auto_15780 ) ) ( not ( = ?auto_15772 ?auto_15805 ) ) ( not ( = ?auto_15773 ?auto_15780 ) ) ( not ( = ?auto_15773 ?auto_15805 ) ) ( not ( = ?auto_15774 ?auto_15780 ) ) ( not ( = ?auto_15774 ?auto_15805 ) ) ( not ( = ?auto_15775 ?auto_15780 ) ) ( not ( = ?auto_15775 ?auto_15805 ) ) ( not ( = ?auto_15776 ?auto_15780 ) ) ( not ( = ?auto_15776 ?auto_15805 ) ) ( not ( = ?auto_15777 ?auto_15780 ) ) ( not ( = ?auto_15777 ?auto_15805 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15805 ) ) ( not ( = ?auto_15780 ?auto_15811 ) ) ( not ( = ?auto_15780 ?auto_15794 ) ) ( not ( = ?auto_15780 ?auto_15799 ) ) ( not ( = ?auto_15780 ?auto_15804 ) ) ( not ( = ?auto_15780 ?auto_15810 ) ) ( not ( = ?auto_15780 ?auto_15795 ) ) ( not ( = ?auto_15780 ?auto_15792 ) ) ( not ( = ?auto_15780 ?auto_15796 ) ) ( not ( = ?auto_15780 ?auto_15791 ) ) ( not ( = ?auto_15780 ?auto_15813 ) ) ( not ( = ?auto_15780 ?auto_15801 ) ) ( not ( = ?auto_15805 ?auto_15811 ) ) ( not ( = ?auto_15805 ?auto_15794 ) ) ( not ( = ?auto_15805 ?auto_15799 ) ) ( not ( = ?auto_15805 ?auto_15804 ) ) ( not ( = ?auto_15805 ?auto_15810 ) ) ( not ( = ?auto_15805 ?auto_15795 ) ) ( not ( = ?auto_15805 ?auto_15792 ) ) ( not ( = ?auto_15805 ?auto_15796 ) ) ( not ( = ?auto_15805 ?auto_15791 ) ) ( not ( = ?auto_15805 ?auto_15813 ) ) ( not ( = ?auto_15805 ?auto_15801 ) ) ( not ( = ?auto_15768 ?auto_15781 ) ) ( not ( = ?auto_15768 ?auto_15784 ) ) ( not ( = ?auto_15769 ?auto_15781 ) ) ( not ( = ?auto_15769 ?auto_15784 ) ) ( not ( = ?auto_15770 ?auto_15781 ) ) ( not ( = ?auto_15770 ?auto_15784 ) ) ( not ( = ?auto_15771 ?auto_15781 ) ) ( not ( = ?auto_15771 ?auto_15784 ) ) ( not ( = ?auto_15772 ?auto_15781 ) ) ( not ( = ?auto_15772 ?auto_15784 ) ) ( not ( = ?auto_15773 ?auto_15781 ) ) ( not ( = ?auto_15773 ?auto_15784 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15774 ?auto_15784 ) ) ( not ( = ?auto_15775 ?auto_15781 ) ) ( not ( = ?auto_15775 ?auto_15784 ) ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( not ( = ?auto_15776 ?auto_15784 ) ) ( not ( = ?auto_15777 ?auto_15781 ) ) ( not ( = ?auto_15777 ?auto_15784 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15784 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15784 ) ) ( not ( = ?auto_15781 ?auto_15805 ) ) ( not ( = ?auto_15781 ?auto_15811 ) ) ( not ( = ?auto_15781 ?auto_15794 ) ) ( not ( = ?auto_15781 ?auto_15799 ) ) ( not ( = ?auto_15781 ?auto_15804 ) ) ( not ( = ?auto_15781 ?auto_15810 ) ) ( not ( = ?auto_15781 ?auto_15795 ) ) ( not ( = ?auto_15781 ?auto_15792 ) ) ( not ( = ?auto_15781 ?auto_15796 ) ) ( not ( = ?auto_15781 ?auto_15791 ) ) ( not ( = ?auto_15781 ?auto_15813 ) ) ( not ( = ?auto_15781 ?auto_15801 ) ) ( not ( = ?auto_15784 ?auto_15805 ) ) ( not ( = ?auto_15784 ?auto_15811 ) ) ( not ( = ?auto_15784 ?auto_15794 ) ) ( not ( = ?auto_15784 ?auto_15799 ) ) ( not ( = ?auto_15784 ?auto_15804 ) ) ( not ( = ?auto_15784 ?auto_15810 ) ) ( not ( = ?auto_15784 ?auto_15795 ) ) ( not ( = ?auto_15784 ?auto_15792 ) ) ( not ( = ?auto_15784 ?auto_15796 ) ) ( not ( = ?auto_15784 ?auto_15791 ) ) ( not ( = ?auto_15784 ?auto_15813 ) ) ( not ( = ?auto_15784 ?auto_15801 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15776 ?auto_15777 ?auto_15778 ?auto_15779 ?auto_15780 )
      ( MAKE-1CRATE ?auto_15780 ?auto_15781 )
      ( MAKE-13CRATE-VERIFY ?auto_15768 ?auto_15769 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15776 ?auto_15777 ?auto_15778 ?auto_15779 ?auto_15780 ?auto_15781 ) )
  )

)

