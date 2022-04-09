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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17227 - SURFACE
      ?auto_17228 - SURFACE
    )
    :vars
    (
      ?auto_17229 - HOIST
      ?auto_17230 - PLACE
      ?auto_17232 - PLACE
      ?auto_17233 - HOIST
      ?auto_17234 - SURFACE
      ?auto_17231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17229 ?auto_17230 ) ( SURFACE-AT ?auto_17227 ?auto_17230 ) ( CLEAR ?auto_17227 ) ( IS-CRATE ?auto_17228 ) ( AVAILABLE ?auto_17229 ) ( not ( = ?auto_17232 ?auto_17230 ) ) ( HOIST-AT ?auto_17233 ?auto_17232 ) ( AVAILABLE ?auto_17233 ) ( SURFACE-AT ?auto_17228 ?auto_17232 ) ( ON ?auto_17228 ?auto_17234 ) ( CLEAR ?auto_17228 ) ( TRUCK-AT ?auto_17231 ?auto_17230 ) ( not ( = ?auto_17227 ?auto_17228 ) ) ( not ( = ?auto_17227 ?auto_17234 ) ) ( not ( = ?auto_17228 ?auto_17234 ) ) ( not ( = ?auto_17229 ?auto_17233 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17231 ?auto_17230 ?auto_17232 )
      ( !LIFT ?auto_17233 ?auto_17228 ?auto_17234 ?auto_17232 )
      ( !LOAD ?auto_17233 ?auto_17228 ?auto_17231 ?auto_17232 )
      ( !DRIVE ?auto_17231 ?auto_17232 ?auto_17230 )
      ( !UNLOAD ?auto_17229 ?auto_17228 ?auto_17231 ?auto_17230 )
      ( !DROP ?auto_17229 ?auto_17228 ?auto_17227 ?auto_17230 )
      ( MAKE-1CRATE-VERIFY ?auto_17227 ?auto_17228 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17248 - SURFACE
      ?auto_17249 - SURFACE
      ?auto_17250 - SURFACE
    )
    :vars
    (
      ?auto_17256 - HOIST
      ?auto_17255 - PLACE
      ?auto_17252 - PLACE
      ?auto_17253 - HOIST
      ?auto_17254 - SURFACE
      ?auto_17258 - PLACE
      ?auto_17257 - HOIST
      ?auto_17259 - SURFACE
      ?auto_17251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17256 ?auto_17255 ) ( IS-CRATE ?auto_17250 ) ( not ( = ?auto_17252 ?auto_17255 ) ) ( HOIST-AT ?auto_17253 ?auto_17252 ) ( AVAILABLE ?auto_17253 ) ( SURFACE-AT ?auto_17250 ?auto_17252 ) ( ON ?auto_17250 ?auto_17254 ) ( CLEAR ?auto_17250 ) ( not ( = ?auto_17249 ?auto_17250 ) ) ( not ( = ?auto_17249 ?auto_17254 ) ) ( not ( = ?auto_17250 ?auto_17254 ) ) ( not ( = ?auto_17256 ?auto_17253 ) ) ( SURFACE-AT ?auto_17248 ?auto_17255 ) ( CLEAR ?auto_17248 ) ( IS-CRATE ?auto_17249 ) ( AVAILABLE ?auto_17256 ) ( not ( = ?auto_17258 ?auto_17255 ) ) ( HOIST-AT ?auto_17257 ?auto_17258 ) ( AVAILABLE ?auto_17257 ) ( SURFACE-AT ?auto_17249 ?auto_17258 ) ( ON ?auto_17249 ?auto_17259 ) ( CLEAR ?auto_17249 ) ( TRUCK-AT ?auto_17251 ?auto_17255 ) ( not ( = ?auto_17248 ?auto_17249 ) ) ( not ( = ?auto_17248 ?auto_17259 ) ) ( not ( = ?auto_17249 ?auto_17259 ) ) ( not ( = ?auto_17256 ?auto_17257 ) ) ( not ( = ?auto_17248 ?auto_17250 ) ) ( not ( = ?auto_17248 ?auto_17254 ) ) ( not ( = ?auto_17250 ?auto_17259 ) ) ( not ( = ?auto_17252 ?auto_17258 ) ) ( not ( = ?auto_17253 ?auto_17257 ) ) ( not ( = ?auto_17254 ?auto_17259 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17248 ?auto_17249 )
      ( MAKE-1CRATE ?auto_17249 ?auto_17250 )
      ( MAKE-2CRATE-VERIFY ?auto_17248 ?auto_17249 ?auto_17250 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17274 - SURFACE
      ?auto_17275 - SURFACE
      ?auto_17276 - SURFACE
      ?auto_17277 - SURFACE
    )
    :vars
    (
      ?auto_17283 - HOIST
      ?auto_17280 - PLACE
      ?auto_17279 - PLACE
      ?auto_17282 - HOIST
      ?auto_17278 - SURFACE
      ?auto_17286 - PLACE
      ?auto_17288 - HOIST
      ?auto_17287 - SURFACE
      ?auto_17285 - PLACE
      ?auto_17289 - HOIST
      ?auto_17284 - SURFACE
      ?auto_17281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17283 ?auto_17280 ) ( IS-CRATE ?auto_17277 ) ( not ( = ?auto_17279 ?auto_17280 ) ) ( HOIST-AT ?auto_17282 ?auto_17279 ) ( AVAILABLE ?auto_17282 ) ( SURFACE-AT ?auto_17277 ?auto_17279 ) ( ON ?auto_17277 ?auto_17278 ) ( CLEAR ?auto_17277 ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( not ( = ?auto_17276 ?auto_17278 ) ) ( not ( = ?auto_17277 ?auto_17278 ) ) ( not ( = ?auto_17283 ?auto_17282 ) ) ( IS-CRATE ?auto_17276 ) ( not ( = ?auto_17286 ?auto_17280 ) ) ( HOIST-AT ?auto_17288 ?auto_17286 ) ( AVAILABLE ?auto_17288 ) ( SURFACE-AT ?auto_17276 ?auto_17286 ) ( ON ?auto_17276 ?auto_17287 ) ( CLEAR ?auto_17276 ) ( not ( = ?auto_17275 ?auto_17276 ) ) ( not ( = ?auto_17275 ?auto_17287 ) ) ( not ( = ?auto_17276 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( SURFACE-AT ?auto_17274 ?auto_17280 ) ( CLEAR ?auto_17274 ) ( IS-CRATE ?auto_17275 ) ( AVAILABLE ?auto_17283 ) ( not ( = ?auto_17285 ?auto_17280 ) ) ( HOIST-AT ?auto_17289 ?auto_17285 ) ( AVAILABLE ?auto_17289 ) ( SURFACE-AT ?auto_17275 ?auto_17285 ) ( ON ?auto_17275 ?auto_17284 ) ( CLEAR ?auto_17275 ) ( TRUCK-AT ?auto_17281 ?auto_17280 ) ( not ( = ?auto_17274 ?auto_17275 ) ) ( not ( = ?auto_17274 ?auto_17284 ) ) ( not ( = ?auto_17275 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17274 ?auto_17276 ) ) ( not ( = ?auto_17274 ?auto_17287 ) ) ( not ( = ?auto_17276 ?auto_17284 ) ) ( not ( = ?auto_17286 ?auto_17285 ) ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( not ( = ?auto_17287 ?auto_17284 ) ) ( not ( = ?auto_17274 ?auto_17277 ) ) ( not ( = ?auto_17274 ?auto_17278 ) ) ( not ( = ?auto_17275 ?auto_17277 ) ) ( not ( = ?auto_17275 ?auto_17278 ) ) ( not ( = ?auto_17277 ?auto_17287 ) ) ( not ( = ?auto_17277 ?auto_17284 ) ) ( not ( = ?auto_17279 ?auto_17286 ) ) ( not ( = ?auto_17279 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17289 ) ) ( not ( = ?auto_17278 ?auto_17287 ) ) ( not ( = ?auto_17278 ?auto_17284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17274 ?auto_17275 ?auto_17276 )
      ( MAKE-1CRATE ?auto_17276 ?auto_17277 )
      ( MAKE-3CRATE-VERIFY ?auto_17274 ?auto_17275 ?auto_17276 ?auto_17277 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17305 - SURFACE
      ?auto_17306 - SURFACE
      ?auto_17307 - SURFACE
      ?auto_17308 - SURFACE
      ?auto_17309 - SURFACE
    )
    :vars
    (
      ?auto_17310 - HOIST
      ?auto_17315 - PLACE
      ?auto_17314 - PLACE
      ?auto_17312 - HOIST
      ?auto_17311 - SURFACE
      ?auto_17319 - PLACE
      ?auto_17324 - HOIST
      ?auto_17320 - SURFACE
      ?auto_17316 - PLACE
      ?auto_17323 - HOIST
      ?auto_17317 - SURFACE
      ?auto_17318 - PLACE
      ?auto_17322 - HOIST
      ?auto_17321 - SURFACE
      ?auto_17313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17310 ?auto_17315 ) ( IS-CRATE ?auto_17309 ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( HOIST-AT ?auto_17312 ?auto_17314 ) ( AVAILABLE ?auto_17312 ) ( SURFACE-AT ?auto_17309 ?auto_17314 ) ( ON ?auto_17309 ?auto_17311 ) ( CLEAR ?auto_17309 ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( not ( = ?auto_17309 ?auto_17311 ) ) ( not ( = ?auto_17310 ?auto_17312 ) ) ( IS-CRATE ?auto_17308 ) ( not ( = ?auto_17319 ?auto_17315 ) ) ( HOIST-AT ?auto_17324 ?auto_17319 ) ( AVAILABLE ?auto_17324 ) ( SURFACE-AT ?auto_17308 ?auto_17319 ) ( ON ?auto_17308 ?auto_17320 ) ( CLEAR ?auto_17308 ) ( not ( = ?auto_17307 ?auto_17308 ) ) ( not ( = ?auto_17307 ?auto_17320 ) ) ( not ( = ?auto_17308 ?auto_17320 ) ) ( not ( = ?auto_17310 ?auto_17324 ) ) ( IS-CRATE ?auto_17307 ) ( not ( = ?auto_17316 ?auto_17315 ) ) ( HOIST-AT ?auto_17323 ?auto_17316 ) ( AVAILABLE ?auto_17323 ) ( SURFACE-AT ?auto_17307 ?auto_17316 ) ( ON ?auto_17307 ?auto_17317 ) ( CLEAR ?auto_17307 ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17317 ) ) ( not ( = ?auto_17307 ?auto_17317 ) ) ( not ( = ?auto_17310 ?auto_17323 ) ) ( SURFACE-AT ?auto_17305 ?auto_17315 ) ( CLEAR ?auto_17305 ) ( IS-CRATE ?auto_17306 ) ( AVAILABLE ?auto_17310 ) ( not ( = ?auto_17318 ?auto_17315 ) ) ( HOIST-AT ?auto_17322 ?auto_17318 ) ( AVAILABLE ?auto_17322 ) ( SURFACE-AT ?auto_17306 ?auto_17318 ) ( ON ?auto_17306 ?auto_17321 ) ( CLEAR ?auto_17306 ) ( TRUCK-AT ?auto_17313 ?auto_17315 ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17305 ?auto_17321 ) ) ( not ( = ?auto_17306 ?auto_17321 ) ) ( not ( = ?auto_17310 ?auto_17322 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17317 ) ) ( not ( = ?auto_17307 ?auto_17321 ) ) ( not ( = ?auto_17316 ?auto_17318 ) ) ( not ( = ?auto_17323 ?auto_17322 ) ) ( not ( = ?auto_17317 ?auto_17321 ) ) ( not ( = ?auto_17305 ?auto_17308 ) ) ( not ( = ?auto_17305 ?auto_17320 ) ) ( not ( = ?auto_17306 ?auto_17308 ) ) ( not ( = ?auto_17306 ?auto_17320 ) ) ( not ( = ?auto_17308 ?auto_17317 ) ) ( not ( = ?auto_17308 ?auto_17321 ) ) ( not ( = ?auto_17319 ?auto_17316 ) ) ( not ( = ?auto_17319 ?auto_17318 ) ) ( not ( = ?auto_17324 ?auto_17323 ) ) ( not ( = ?auto_17324 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17317 ) ) ( not ( = ?auto_17320 ?auto_17321 ) ) ( not ( = ?auto_17305 ?auto_17309 ) ) ( not ( = ?auto_17305 ?auto_17311 ) ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17306 ?auto_17311 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17311 ) ) ( not ( = ?auto_17309 ?auto_17320 ) ) ( not ( = ?auto_17309 ?auto_17317 ) ) ( not ( = ?auto_17309 ?auto_17321 ) ) ( not ( = ?auto_17314 ?auto_17319 ) ) ( not ( = ?auto_17314 ?auto_17316 ) ) ( not ( = ?auto_17314 ?auto_17318 ) ) ( not ( = ?auto_17312 ?auto_17324 ) ) ( not ( = ?auto_17312 ?auto_17323 ) ) ( not ( = ?auto_17312 ?auto_17322 ) ) ( not ( = ?auto_17311 ?auto_17320 ) ) ( not ( = ?auto_17311 ?auto_17317 ) ) ( not ( = ?auto_17311 ?auto_17321 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 )
      ( MAKE-1CRATE ?auto_17308 ?auto_17309 )
      ( MAKE-4CRATE-VERIFY ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 ?auto_17309 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17341 - SURFACE
      ?auto_17342 - SURFACE
      ?auto_17343 - SURFACE
      ?auto_17344 - SURFACE
      ?auto_17345 - SURFACE
      ?auto_17346 - SURFACE
    )
    :vars
    (
      ?auto_17348 - HOIST
      ?auto_17349 - PLACE
      ?auto_17347 - PLACE
      ?auto_17352 - HOIST
      ?auto_17350 - SURFACE
      ?auto_17355 - PLACE
      ?auto_17353 - HOIST
      ?auto_17354 - SURFACE
      ?auto_17360 - PLACE
      ?auto_17359 - HOIST
      ?auto_17357 - SURFACE
      ?auto_17361 - SURFACE
      ?auto_17362 - PLACE
      ?auto_17358 - HOIST
      ?auto_17356 - SURFACE
      ?auto_17351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17348 ?auto_17349 ) ( IS-CRATE ?auto_17346 ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( HOIST-AT ?auto_17352 ?auto_17347 ) ( SURFACE-AT ?auto_17346 ?auto_17347 ) ( ON ?auto_17346 ?auto_17350 ) ( CLEAR ?auto_17346 ) ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17350 ) ) ( not ( = ?auto_17346 ?auto_17350 ) ) ( not ( = ?auto_17348 ?auto_17352 ) ) ( IS-CRATE ?auto_17345 ) ( not ( = ?auto_17355 ?auto_17349 ) ) ( HOIST-AT ?auto_17353 ?auto_17355 ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17345 ?auto_17355 ) ( ON ?auto_17345 ?auto_17354 ) ( CLEAR ?auto_17345 ) ( not ( = ?auto_17344 ?auto_17345 ) ) ( not ( = ?auto_17344 ?auto_17354 ) ) ( not ( = ?auto_17345 ?auto_17354 ) ) ( not ( = ?auto_17348 ?auto_17353 ) ) ( IS-CRATE ?auto_17344 ) ( not ( = ?auto_17360 ?auto_17349 ) ) ( HOIST-AT ?auto_17359 ?auto_17360 ) ( AVAILABLE ?auto_17359 ) ( SURFACE-AT ?auto_17344 ?auto_17360 ) ( ON ?auto_17344 ?auto_17357 ) ( CLEAR ?auto_17344 ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17343 ?auto_17357 ) ) ( not ( = ?auto_17344 ?auto_17357 ) ) ( not ( = ?auto_17348 ?auto_17359 ) ) ( IS-CRATE ?auto_17343 ) ( AVAILABLE ?auto_17352 ) ( SURFACE-AT ?auto_17343 ?auto_17347 ) ( ON ?auto_17343 ?auto_17361 ) ( CLEAR ?auto_17343 ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( not ( = ?auto_17342 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17361 ) ) ( SURFACE-AT ?auto_17341 ?auto_17349 ) ( CLEAR ?auto_17341 ) ( IS-CRATE ?auto_17342 ) ( AVAILABLE ?auto_17348 ) ( not ( = ?auto_17362 ?auto_17349 ) ) ( HOIST-AT ?auto_17358 ?auto_17362 ) ( AVAILABLE ?auto_17358 ) ( SURFACE-AT ?auto_17342 ?auto_17362 ) ( ON ?auto_17342 ?auto_17356 ) ( CLEAR ?auto_17342 ) ( TRUCK-AT ?auto_17351 ?auto_17349 ) ( not ( = ?auto_17341 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17356 ) ) ( not ( = ?auto_17342 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17358 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( not ( = ?auto_17341 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17356 ) ) ( not ( = ?auto_17347 ?auto_17362 ) ) ( not ( = ?auto_17352 ?auto_17358 ) ) ( not ( = ?auto_17361 ?auto_17356 ) ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( not ( = ?auto_17341 ?auto_17357 ) ) ( not ( = ?auto_17342 ?auto_17344 ) ) ( not ( = ?auto_17342 ?auto_17357 ) ) ( not ( = ?auto_17344 ?auto_17361 ) ) ( not ( = ?auto_17344 ?auto_17356 ) ) ( not ( = ?auto_17360 ?auto_17347 ) ) ( not ( = ?auto_17360 ?auto_17362 ) ) ( not ( = ?auto_17359 ?auto_17352 ) ) ( not ( = ?auto_17359 ?auto_17358 ) ) ( not ( = ?auto_17357 ?auto_17361 ) ) ( not ( = ?auto_17357 ?auto_17356 ) ) ( not ( = ?auto_17341 ?auto_17345 ) ) ( not ( = ?auto_17341 ?auto_17354 ) ) ( not ( = ?auto_17342 ?auto_17345 ) ) ( not ( = ?auto_17342 ?auto_17354 ) ) ( not ( = ?auto_17343 ?auto_17345 ) ) ( not ( = ?auto_17343 ?auto_17354 ) ) ( not ( = ?auto_17345 ?auto_17357 ) ) ( not ( = ?auto_17345 ?auto_17361 ) ) ( not ( = ?auto_17345 ?auto_17356 ) ) ( not ( = ?auto_17355 ?auto_17360 ) ) ( not ( = ?auto_17355 ?auto_17347 ) ) ( not ( = ?auto_17355 ?auto_17362 ) ) ( not ( = ?auto_17353 ?auto_17359 ) ) ( not ( = ?auto_17353 ?auto_17352 ) ) ( not ( = ?auto_17353 ?auto_17358 ) ) ( not ( = ?auto_17354 ?auto_17357 ) ) ( not ( = ?auto_17354 ?auto_17361 ) ) ( not ( = ?auto_17354 ?auto_17356 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17341 ?auto_17350 ) ) ( not ( = ?auto_17342 ?auto_17346 ) ) ( not ( = ?auto_17342 ?auto_17350 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17350 ) ) ( not ( = ?auto_17344 ?auto_17346 ) ) ( not ( = ?auto_17344 ?auto_17350 ) ) ( not ( = ?auto_17346 ?auto_17354 ) ) ( not ( = ?auto_17346 ?auto_17357 ) ) ( not ( = ?auto_17346 ?auto_17361 ) ) ( not ( = ?auto_17346 ?auto_17356 ) ) ( not ( = ?auto_17350 ?auto_17354 ) ) ( not ( = ?auto_17350 ?auto_17357 ) ) ( not ( = ?auto_17350 ?auto_17361 ) ) ( not ( = ?auto_17350 ?auto_17356 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17341 ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 )
      ( MAKE-1CRATE ?auto_17345 ?auto_17346 )
      ( MAKE-5CRATE-VERIFY ?auto_17341 ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 ?auto_17346 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17380 - SURFACE
      ?auto_17381 - SURFACE
      ?auto_17382 - SURFACE
      ?auto_17383 - SURFACE
      ?auto_17384 - SURFACE
      ?auto_17385 - SURFACE
      ?auto_17386 - SURFACE
    )
    :vars
    (
      ?auto_17390 - HOIST
      ?auto_17389 - PLACE
      ?auto_17392 - PLACE
      ?auto_17391 - HOIST
      ?auto_17388 - SURFACE
      ?auto_17402 - PLACE
      ?auto_17404 - HOIST
      ?auto_17398 - SURFACE
      ?auto_17396 - PLACE
      ?auto_17393 - HOIST
      ?auto_17395 - SURFACE
      ?auto_17401 - PLACE
      ?auto_17400 - HOIST
      ?auto_17403 - SURFACE
      ?auto_17394 - SURFACE
      ?auto_17405 - PLACE
      ?auto_17399 - HOIST
      ?auto_17397 - SURFACE
      ?auto_17387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17390 ?auto_17389 ) ( IS-CRATE ?auto_17386 ) ( not ( = ?auto_17392 ?auto_17389 ) ) ( HOIST-AT ?auto_17391 ?auto_17392 ) ( AVAILABLE ?auto_17391 ) ( SURFACE-AT ?auto_17386 ?auto_17392 ) ( ON ?auto_17386 ?auto_17388 ) ( CLEAR ?auto_17386 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( IS-CRATE ?auto_17385 ) ( not ( = ?auto_17402 ?auto_17389 ) ) ( HOIST-AT ?auto_17404 ?auto_17402 ) ( SURFACE-AT ?auto_17385 ?auto_17402 ) ( ON ?auto_17385 ?auto_17398 ) ( CLEAR ?auto_17385 ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17398 ) ) ( not ( = ?auto_17385 ?auto_17398 ) ) ( not ( = ?auto_17390 ?auto_17404 ) ) ( IS-CRATE ?auto_17384 ) ( not ( = ?auto_17396 ?auto_17389 ) ) ( HOIST-AT ?auto_17393 ?auto_17396 ) ( AVAILABLE ?auto_17393 ) ( SURFACE-AT ?auto_17384 ?auto_17396 ) ( ON ?auto_17384 ?auto_17395 ) ( CLEAR ?auto_17384 ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17395 ) ) ( not ( = ?auto_17384 ?auto_17395 ) ) ( not ( = ?auto_17390 ?auto_17393 ) ) ( IS-CRATE ?auto_17383 ) ( not ( = ?auto_17401 ?auto_17389 ) ) ( HOIST-AT ?auto_17400 ?auto_17401 ) ( AVAILABLE ?auto_17400 ) ( SURFACE-AT ?auto_17383 ?auto_17401 ) ( ON ?auto_17383 ?auto_17403 ) ( CLEAR ?auto_17383 ) ( not ( = ?auto_17382 ?auto_17383 ) ) ( not ( = ?auto_17382 ?auto_17403 ) ) ( not ( = ?auto_17383 ?auto_17403 ) ) ( not ( = ?auto_17390 ?auto_17400 ) ) ( IS-CRATE ?auto_17382 ) ( AVAILABLE ?auto_17404 ) ( SURFACE-AT ?auto_17382 ?auto_17402 ) ( ON ?auto_17382 ?auto_17394 ) ( CLEAR ?auto_17382 ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17381 ?auto_17394 ) ) ( not ( = ?auto_17382 ?auto_17394 ) ) ( SURFACE-AT ?auto_17380 ?auto_17389 ) ( CLEAR ?auto_17380 ) ( IS-CRATE ?auto_17381 ) ( AVAILABLE ?auto_17390 ) ( not ( = ?auto_17405 ?auto_17389 ) ) ( HOIST-AT ?auto_17399 ?auto_17405 ) ( AVAILABLE ?auto_17399 ) ( SURFACE-AT ?auto_17381 ?auto_17405 ) ( ON ?auto_17381 ?auto_17397 ) ( CLEAR ?auto_17381 ) ( TRUCK-AT ?auto_17387 ?auto_17389 ) ( not ( = ?auto_17380 ?auto_17381 ) ) ( not ( = ?auto_17380 ?auto_17397 ) ) ( not ( = ?auto_17381 ?auto_17397 ) ) ( not ( = ?auto_17390 ?auto_17399 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17394 ) ) ( not ( = ?auto_17382 ?auto_17397 ) ) ( not ( = ?auto_17402 ?auto_17405 ) ) ( not ( = ?auto_17404 ?auto_17399 ) ) ( not ( = ?auto_17394 ?auto_17397 ) ) ( not ( = ?auto_17380 ?auto_17383 ) ) ( not ( = ?auto_17380 ?auto_17403 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17403 ) ) ( not ( = ?auto_17383 ?auto_17394 ) ) ( not ( = ?auto_17383 ?auto_17397 ) ) ( not ( = ?auto_17401 ?auto_17402 ) ) ( not ( = ?auto_17401 ?auto_17405 ) ) ( not ( = ?auto_17400 ?auto_17404 ) ) ( not ( = ?auto_17400 ?auto_17399 ) ) ( not ( = ?auto_17403 ?auto_17394 ) ) ( not ( = ?auto_17403 ?auto_17397 ) ) ( not ( = ?auto_17380 ?auto_17384 ) ) ( not ( = ?auto_17380 ?auto_17395 ) ) ( not ( = ?auto_17381 ?auto_17384 ) ) ( not ( = ?auto_17381 ?auto_17395 ) ) ( not ( = ?auto_17382 ?auto_17384 ) ) ( not ( = ?auto_17382 ?auto_17395 ) ) ( not ( = ?auto_17384 ?auto_17403 ) ) ( not ( = ?auto_17384 ?auto_17394 ) ) ( not ( = ?auto_17384 ?auto_17397 ) ) ( not ( = ?auto_17396 ?auto_17401 ) ) ( not ( = ?auto_17396 ?auto_17402 ) ) ( not ( = ?auto_17396 ?auto_17405 ) ) ( not ( = ?auto_17393 ?auto_17400 ) ) ( not ( = ?auto_17393 ?auto_17404 ) ) ( not ( = ?auto_17393 ?auto_17399 ) ) ( not ( = ?auto_17395 ?auto_17403 ) ) ( not ( = ?auto_17395 ?auto_17394 ) ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( not ( = ?auto_17380 ?auto_17385 ) ) ( not ( = ?auto_17380 ?auto_17398 ) ) ( not ( = ?auto_17381 ?auto_17385 ) ) ( not ( = ?auto_17381 ?auto_17398 ) ) ( not ( = ?auto_17382 ?auto_17385 ) ) ( not ( = ?auto_17382 ?auto_17398 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17398 ) ) ( not ( = ?auto_17385 ?auto_17395 ) ) ( not ( = ?auto_17385 ?auto_17403 ) ) ( not ( = ?auto_17385 ?auto_17394 ) ) ( not ( = ?auto_17385 ?auto_17397 ) ) ( not ( = ?auto_17398 ?auto_17395 ) ) ( not ( = ?auto_17398 ?auto_17403 ) ) ( not ( = ?auto_17398 ?auto_17394 ) ) ( not ( = ?auto_17398 ?auto_17397 ) ) ( not ( = ?auto_17380 ?auto_17386 ) ) ( not ( = ?auto_17380 ?auto_17388 ) ) ( not ( = ?auto_17381 ?auto_17386 ) ) ( not ( = ?auto_17381 ?auto_17388 ) ) ( not ( = ?auto_17382 ?auto_17386 ) ) ( not ( = ?auto_17382 ?auto_17388 ) ) ( not ( = ?auto_17383 ?auto_17386 ) ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( not ( = ?auto_17384 ?auto_17386 ) ) ( not ( = ?auto_17384 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17398 ) ) ( not ( = ?auto_17386 ?auto_17395 ) ) ( not ( = ?auto_17386 ?auto_17403 ) ) ( not ( = ?auto_17386 ?auto_17394 ) ) ( not ( = ?auto_17386 ?auto_17397 ) ) ( not ( = ?auto_17392 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17396 ) ) ( not ( = ?auto_17392 ?auto_17401 ) ) ( not ( = ?auto_17392 ?auto_17405 ) ) ( not ( = ?auto_17391 ?auto_17404 ) ) ( not ( = ?auto_17391 ?auto_17393 ) ) ( not ( = ?auto_17391 ?auto_17400 ) ) ( not ( = ?auto_17391 ?auto_17399 ) ) ( not ( = ?auto_17388 ?auto_17398 ) ) ( not ( = ?auto_17388 ?auto_17395 ) ) ( not ( = ?auto_17388 ?auto_17403 ) ) ( not ( = ?auto_17388 ?auto_17394 ) ) ( not ( = ?auto_17388 ?auto_17397 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 ?auto_17384 ?auto_17385 )
      ( MAKE-1CRATE ?auto_17385 ?auto_17386 )
      ( MAKE-6CRATE-VERIFY ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17424 - SURFACE
      ?auto_17425 - SURFACE
      ?auto_17426 - SURFACE
      ?auto_17427 - SURFACE
      ?auto_17428 - SURFACE
      ?auto_17429 - SURFACE
      ?auto_17430 - SURFACE
      ?auto_17431 - SURFACE
    )
    :vars
    (
      ?auto_17432 - HOIST
      ?auto_17435 - PLACE
      ?auto_17433 - PLACE
      ?auto_17434 - HOIST
      ?auto_17436 - SURFACE
      ?auto_17439 - PLACE
      ?auto_17441 - HOIST
      ?auto_17452 - SURFACE
      ?auto_17451 - PLACE
      ?auto_17438 - HOIST
      ?auto_17450 - SURFACE
      ?auto_17444 - PLACE
      ?auto_17443 - HOIST
      ?auto_17445 - SURFACE
      ?auto_17442 - PLACE
      ?auto_17447 - HOIST
      ?auto_17440 - SURFACE
      ?auto_17453 - SURFACE
      ?auto_17446 - PLACE
      ?auto_17449 - HOIST
      ?auto_17448 - SURFACE
      ?auto_17437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17432 ?auto_17435 ) ( IS-CRATE ?auto_17431 ) ( not ( = ?auto_17433 ?auto_17435 ) ) ( HOIST-AT ?auto_17434 ?auto_17433 ) ( AVAILABLE ?auto_17434 ) ( SURFACE-AT ?auto_17431 ?auto_17433 ) ( ON ?auto_17431 ?auto_17436 ) ( CLEAR ?auto_17431 ) ( not ( = ?auto_17430 ?auto_17431 ) ) ( not ( = ?auto_17430 ?auto_17436 ) ) ( not ( = ?auto_17431 ?auto_17436 ) ) ( not ( = ?auto_17432 ?auto_17434 ) ) ( IS-CRATE ?auto_17430 ) ( not ( = ?auto_17439 ?auto_17435 ) ) ( HOIST-AT ?auto_17441 ?auto_17439 ) ( AVAILABLE ?auto_17441 ) ( SURFACE-AT ?auto_17430 ?auto_17439 ) ( ON ?auto_17430 ?auto_17452 ) ( CLEAR ?auto_17430 ) ( not ( = ?auto_17429 ?auto_17430 ) ) ( not ( = ?auto_17429 ?auto_17452 ) ) ( not ( = ?auto_17430 ?auto_17452 ) ) ( not ( = ?auto_17432 ?auto_17441 ) ) ( IS-CRATE ?auto_17429 ) ( not ( = ?auto_17451 ?auto_17435 ) ) ( HOIST-AT ?auto_17438 ?auto_17451 ) ( SURFACE-AT ?auto_17429 ?auto_17451 ) ( ON ?auto_17429 ?auto_17450 ) ( CLEAR ?auto_17429 ) ( not ( = ?auto_17428 ?auto_17429 ) ) ( not ( = ?auto_17428 ?auto_17450 ) ) ( not ( = ?auto_17429 ?auto_17450 ) ) ( not ( = ?auto_17432 ?auto_17438 ) ) ( IS-CRATE ?auto_17428 ) ( not ( = ?auto_17444 ?auto_17435 ) ) ( HOIST-AT ?auto_17443 ?auto_17444 ) ( AVAILABLE ?auto_17443 ) ( SURFACE-AT ?auto_17428 ?auto_17444 ) ( ON ?auto_17428 ?auto_17445 ) ( CLEAR ?auto_17428 ) ( not ( = ?auto_17427 ?auto_17428 ) ) ( not ( = ?auto_17427 ?auto_17445 ) ) ( not ( = ?auto_17428 ?auto_17445 ) ) ( not ( = ?auto_17432 ?auto_17443 ) ) ( IS-CRATE ?auto_17427 ) ( not ( = ?auto_17442 ?auto_17435 ) ) ( HOIST-AT ?auto_17447 ?auto_17442 ) ( AVAILABLE ?auto_17447 ) ( SURFACE-AT ?auto_17427 ?auto_17442 ) ( ON ?auto_17427 ?auto_17440 ) ( CLEAR ?auto_17427 ) ( not ( = ?auto_17426 ?auto_17427 ) ) ( not ( = ?auto_17426 ?auto_17440 ) ) ( not ( = ?auto_17427 ?auto_17440 ) ) ( not ( = ?auto_17432 ?auto_17447 ) ) ( IS-CRATE ?auto_17426 ) ( AVAILABLE ?auto_17438 ) ( SURFACE-AT ?auto_17426 ?auto_17451 ) ( ON ?auto_17426 ?auto_17453 ) ( CLEAR ?auto_17426 ) ( not ( = ?auto_17425 ?auto_17426 ) ) ( not ( = ?auto_17425 ?auto_17453 ) ) ( not ( = ?auto_17426 ?auto_17453 ) ) ( SURFACE-AT ?auto_17424 ?auto_17435 ) ( CLEAR ?auto_17424 ) ( IS-CRATE ?auto_17425 ) ( AVAILABLE ?auto_17432 ) ( not ( = ?auto_17446 ?auto_17435 ) ) ( HOIST-AT ?auto_17449 ?auto_17446 ) ( AVAILABLE ?auto_17449 ) ( SURFACE-AT ?auto_17425 ?auto_17446 ) ( ON ?auto_17425 ?auto_17448 ) ( CLEAR ?auto_17425 ) ( TRUCK-AT ?auto_17437 ?auto_17435 ) ( not ( = ?auto_17424 ?auto_17425 ) ) ( not ( = ?auto_17424 ?auto_17448 ) ) ( not ( = ?auto_17425 ?auto_17448 ) ) ( not ( = ?auto_17432 ?auto_17449 ) ) ( not ( = ?auto_17424 ?auto_17426 ) ) ( not ( = ?auto_17424 ?auto_17453 ) ) ( not ( = ?auto_17426 ?auto_17448 ) ) ( not ( = ?auto_17451 ?auto_17446 ) ) ( not ( = ?auto_17438 ?auto_17449 ) ) ( not ( = ?auto_17453 ?auto_17448 ) ) ( not ( = ?auto_17424 ?auto_17427 ) ) ( not ( = ?auto_17424 ?auto_17440 ) ) ( not ( = ?auto_17425 ?auto_17427 ) ) ( not ( = ?auto_17425 ?auto_17440 ) ) ( not ( = ?auto_17427 ?auto_17453 ) ) ( not ( = ?auto_17427 ?auto_17448 ) ) ( not ( = ?auto_17442 ?auto_17451 ) ) ( not ( = ?auto_17442 ?auto_17446 ) ) ( not ( = ?auto_17447 ?auto_17438 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17440 ?auto_17453 ) ) ( not ( = ?auto_17440 ?auto_17448 ) ) ( not ( = ?auto_17424 ?auto_17428 ) ) ( not ( = ?auto_17424 ?auto_17445 ) ) ( not ( = ?auto_17425 ?auto_17428 ) ) ( not ( = ?auto_17425 ?auto_17445 ) ) ( not ( = ?auto_17426 ?auto_17428 ) ) ( not ( = ?auto_17426 ?auto_17445 ) ) ( not ( = ?auto_17428 ?auto_17440 ) ) ( not ( = ?auto_17428 ?auto_17453 ) ) ( not ( = ?auto_17428 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17442 ) ) ( not ( = ?auto_17444 ?auto_17451 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17443 ?auto_17447 ) ) ( not ( = ?auto_17443 ?auto_17438 ) ) ( not ( = ?auto_17443 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17440 ) ) ( not ( = ?auto_17445 ?auto_17453 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17424 ?auto_17429 ) ) ( not ( = ?auto_17424 ?auto_17450 ) ) ( not ( = ?auto_17425 ?auto_17429 ) ) ( not ( = ?auto_17425 ?auto_17450 ) ) ( not ( = ?auto_17426 ?auto_17429 ) ) ( not ( = ?auto_17426 ?auto_17450 ) ) ( not ( = ?auto_17427 ?auto_17429 ) ) ( not ( = ?auto_17427 ?auto_17450 ) ) ( not ( = ?auto_17429 ?auto_17445 ) ) ( not ( = ?auto_17429 ?auto_17440 ) ) ( not ( = ?auto_17429 ?auto_17453 ) ) ( not ( = ?auto_17429 ?auto_17448 ) ) ( not ( = ?auto_17450 ?auto_17445 ) ) ( not ( = ?auto_17450 ?auto_17440 ) ) ( not ( = ?auto_17450 ?auto_17453 ) ) ( not ( = ?auto_17450 ?auto_17448 ) ) ( not ( = ?auto_17424 ?auto_17430 ) ) ( not ( = ?auto_17424 ?auto_17452 ) ) ( not ( = ?auto_17425 ?auto_17430 ) ) ( not ( = ?auto_17425 ?auto_17452 ) ) ( not ( = ?auto_17426 ?auto_17430 ) ) ( not ( = ?auto_17426 ?auto_17452 ) ) ( not ( = ?auto_17427 ?auto_17430 ) ) ( not ( = ?auto_17427 ?auto_17452 ) ) ( not ( = ?auto_17428 ?auto_17430 ) ) ( not ( = ?auto_17428 ?auto_17452 ) ) ( not ( = ?auto_17430 ?auto_17450 ) ) ( not ( = ?auto_17430 ?auto_17445 ) ) ( not ( = ?auto_17430 ?auto_17440 ) ) ( not ( = ?auto_17430 ?auto_17453 ) ) ( not ( = ?auto_17430 ?auto_17448 ) ) ( not ( = ?auto_17439 ?auto_17451 ) ) ( not ( = ?auto_17439 ?auto_17444 ) ) ( not ( = ?auto_17439 ?auto_17442 ) ) ( not ( = ?auto_17439 ?auto_17446 ) ) ( not ( = ?auto_17441 ?auto_17438 ) ) ( not ( = ?auto_17441 ?auto_17443 ) ) ( not ( = ?auto_17441 ?auto_17447 ) ) ( not ( = ?auto_17441 ?auto_17449 ) ) ( not ( = ?auto_17452 ?auto_17450 ) ) ( not ( = ?auto_17452 ?auto_17445 ) ) ( not ( = ?auto_17452 ?auto_17440 ) ) ( not ( = ?auto_17452 ?auto_17453 ) ) ( not ( = ?auto_17452 ?auto_17448 ) ) ( not ( = ?auto_17424 ?auto_17431 ) ) ( not ( = ?auto_17424 ?auto_17436 ) ) ( not ( = ?auto_17425 ?auto_17431 ) ) ( not ( = ?auto_17425 ?auto_17436 ) ) ( not ( = ?auto_17426 ?auto_17431 ) ) ( not ( = ?auto_17426 ?auto_17436 ) ) ( not ( = ?auto_17427 ?auto_17431 ) ) ( not ( = ?auto_17427 ?auto_17436 ) ) ( not ( = ?auto_17428 ?auto_17431 ) ) ( not ( = ?auto_17428 ?auto_17436 ) ) ( not ( = ?auto_17429 ?auto_17431 ) ) ( not ( = ?auto_17429 ?auto_17436 ) ) ( not ( = ?auto_17431 ?auto_17452 ) ) ( not ( = ?auto_17431 ?auto_17450 ) ) ( not ( = ?auto_17431 ?auto_17445 ) ) ( not ( = ?auto_17431 ?auto_17440 ) ) ( not ( = ?auto_17431 ?auto_17453 ) ) ( not ( = ?auto_17431 ?auto_17448 ) ) ( not ( = ?auto_17433 ?auto_17439 ) ) ( not ( = ?auto_17433 ?auto_17451 ) ) ( not ( = ?auto_17433 ?auto_17444 ) ) ( not ( = ?auto_17433 ?auto_17442 ) ) ( not ( = ?auto_17433 ?auto_17446 ) ) ( not ( = ?auto_17434 ?auto_17441 ) ) ( not ( = ?auto_17434 ?auto_17438 ) ) ( not ( = ?auto_17434 ?auto_17443 ) ) ( not ( = ?auto_17434 ?auto_17447 ) ) ( not ( = ?auto_17434 ?auto_17449 ) ) ( not ( = ?auto_17436 ?auto_17452 ) ) ( not ( = ?auto_17436 ?auto_17450 ) ) ( not ( = ?auto_17436 ?auto_17445 ) ) ( not ( = ?auto_17436 ?auto_17440 ) ) ( not ( = ?auto_17436 ?auto_17453 ) ) ( not ( = ?auto_17436 ?auto_17448 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17424 ?auto_17425 ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ?auto_17430 )
      ( MAKE-1CRATE ?auto_17430 ?auto_17431 )
      ( MAKE-7CRATE-VERIFY ?auto_17424 ?auto_17425 ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ?auto_17430 ?auto_17431 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_17473 - SURFACE
      ?auto_17474 - SURFACE
      ?auto_17475 - SURFACE
      ?auto_17476 - SURFACE
      ?auto_17477 - SURFACE
      ?auto_17478 - SURFACE
      ?auto_17479 - SURFACE
      ?auto_17480 - SURFACE
      ?auto_17481 - SURFACE
    )
    :vars
    (
      ?auto_17486 - HOIST
      ?auto_17484 - PLACE
      ?auto_17482 - PLACE
      ?auto_17485 - HOIST
      ?auto_17483 - SURFACE
      ?auto_17488 - PLACE
      ?auto_17489 - HOIST
      ?auto_17506 - SURFACE
      ?auto_17491 - PLACE
      ?auto_17490 - HOIST
      ?auto_17493 - SURFACE
      ?auto_17504 - PLACE
      ?auto_17494 - HOIST
      ?auto_17503 - SURFACE
      ?auto_17495 - PLACE
      ?auto_17496 - HOIST
      ?auto_17505 - SURFACE
      ?auto_17497 - PLACE
      ?auto_17501 - HOIST
      ?auto_17492 - SURFACE
      ?auto_17498 - SURFACE
      ?auto_17499 - PLACE
      ?auto_17502 - HOIST
      ?auto_17500 - SURFACE
      ?auto_17487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17486 ?auto_17484 ) ( IS-CRATE ?auto_17481 ) ( not ( = ?auto_17482 ?auto_17484 ) ) ( HOIST-AT ?auto_17485 ?auto_17482 ) ( AVAILABLE ?auto_17485 ) ( SURFACE-AT ?auto_17481 ?auto_17482 ) ( ON ?auto_17481 ?auto_17483 ) ( CLEAR ?auto_17481 ) ( not ( = ?auto_17480 ?auto_17481 ) ) ( not ( = ?auto_17480 ?auto_17483 ) ) ( not ( = ?auto_17481 ?auto_17483 ) ) ( not ( = ?auto_17486 ?auto_17485 ) ) ( IS-CRATE ?auto_17480 ) ( not ( = ?auto_17488 ?auto_17484 ) ) ( HOIST-AT ?auto_17489 ?auto_17488 ) ( AVAILABLE ?auto_17489 ) ( SURFACE-AT ?auto_17480 ?auto_17488 ) ( ON ?auto_17480 ?auto_17506 ) ( CLEAR ?auto_17480 ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17479 ?auto_17506 ) ) ( not ( = ?auto_17480 ?auto_17506 ) ) ( not ( = ?auto_17486 ?auto_17489 ) ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17491 ?auto_17484 ) ) ( HOIST-AT ?auto_17490 ?auto_17491 ) ( AVAILABLE ?auto_17490 ) ( SURFACE-AT ?auto_17479 ?auto_17491 ) ( ON ?auto_17479 ?auto_17493 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17493 ) ) ( not ( = ?auto_17479 ?auto_17493 ) ) ( not ( = ?auto_17486 ?auto_17490 ) ) ( IS-CRATE ?auto_17478 ) ( not ( = ?auto_17504 ?auto_17484 ) ) ( HOIST-AT ?auto_17494 ?auto_17504 ) ( SURFACE-AT ?auto_17478 ?auto_17504 ) ( ON ?auto_17478 ?auto_17503 ) ( CLEAR ?auto_17478 ) ( not ( = ?auto_17477 ?auto_17478 ) ) ( not ( = ?auto_17477 ?auto_17503 ) ) ( not ( = ?auto_17478 ?auto_17503 ) ) ( not ( = ?auto_17486 ?auto_17494 ) ) ( IS-CRATE ?auto_17477 ) ( not ( = ?auto_17495 ?auto_17484 ) ) ( HOIST-AT ?auto_17496 ?auto_17495 ) ( AVAILABLE ?auto_17496 ) ( SURFACE-AT ?auto_17477 ?auto_17495 ) ( ON ?auto_17477 ?auto_17505 ) ( CLEAR ?auto_17477 ) ( not ( = ?auto_17476 ?auto_17477 ) ) ( not ( = ?auto_17476 ?auto_17505 ) ) ( not ( = ?auto_17477 ?auto_17505 ) ) ( not ( = ?auto_17486 ?auto_17496 ) ) ( IS-CRATE ?auto_17476 ) ( not ( = ?auto_17497 ?auto_17484 ) ) ( HOIST-AT ?auto_17501 ?auto_17497 ) ( AVAILABLE ?auto_17501 ) ( SURFACE-AT ?auto_17476 ?auto_17497 ) ( ON ?auto_17476 ?auto_17492 ) ( CLEAR ?auto_17476 ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17492 ) ) ( not ( = ?auto_17476 ?auto_17492 ) ) ( not ( = ?auto_17486 ?auto_17501 ) ) ( IS-CRATE ?auto_17475 ) ( AVAILABLE ?auto_17494 ) ( SURFACE-AT ?auto_17475 ?auto_17504 ) ( ON ?auto_17475 ?auto_17498 ) ( CLEAR ?auto_17475 ) ( not ( = ?auto_17474 ?auto_17475 ) ) ( not ( = ?auto_17474 ?auto_17498 ) ) ( not ( = ?auto_17475 ?auto_17498 ) ) ( SURFACE-AT ?auto_17473 ?auto_17484 ) ( CLEAR ?auto_17473 ) ( IS-CRATE ?auto_17474 ) ( AVAILABLE ?auto_17486 ) ( not ( = ?auto_17499 ?auto_17484 ) ) ( HOIST-AT ?auto_17502 ?auto_17499 ) ( AVAILABLE ?auto_17502 ) ( SURFACE-AT ?auto_17474 ?auto_17499 ) ( ON ?auto_17474 ?auto_17500 ) ( CLEAR ?auto_17474 ) ( TRUCK-AT ?auto_17487 ?auto_17484 ) ( not ( = ?auto_17473 ?auto_17474 ) ) ( not ( = ?auto_17473 ?auto_17500 ) ) ( not ( = ?auto_17474 ?auto_17500 ) ) ( not ( = ?auto_17486 ?auto_17502 ) ) ( not ( = ?auto_17473 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17498 ) ) ( not ( = ?auto_17475 ?auto_17500 ) ) ( not ( = ?auto_17504 ?auto_17499 ) ) ( not ( = ?auto_17494 ?auto_17502 ) ) ( not ( = ?auto_17498 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17473 ?auto_17492 ) ) ( not ( = ?auto_17474 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17492 ) ) ( not ( = ?auto_17476 ?auto_17498 ) ) ( not ( = ?auto_17476 ?auto_17500 ) ) ( not ( = ?auto_17497 ?auto_17504 ) ) ( not ( = ?auto_17497 ?auto_17499 ) ) ( not ( = ?auto_17501 ?auto_17494 ) ) ( not ( = ?auto_17501 ?auto_17502 ) ) ( not ( = ?auto_17492 ?auto_17498 ) ) ( not ( = ?auto_17492 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17477 ) ) ( not ( = ?auto_17473 ?auto_17505 ) ) ( not ( = ?auto_17474 ?auto_17477 ) ) ( not ( = ?auto_17474 ?auto_17505 ) ) ( not ( = ?auto_17475 ?auto_17477 ) ) ( not ( = ?auto_17475 ?auto_17505 ) ) ( not ( = ?auto_17477 ?auto_17492 ) ) ( not ( = ?auto_17477 ?auto_17498 ) ) ( not ( = ?auto_17477 ?auto_17500 ) ) ( not ( = ?auto_17495 ?auto_17497 ) ) ( not ( = ?auto_17495 ?auto_17504 ) ) ( not ( = ?auto_17495 ?auto_17499 ) ) ( not ( = ?auto_17496 ?auto_17501 ) ) ( not ( = ?auto_17496 ?auto_17494 ) ) ( not ( = ?auto_17496 ?auto_17502 ) ) ( not ( = ?auto_17505 ?auto_17492 ) ) ( not ( = ?auto_17505 ?auto_17498 ) ) ( not ( = ?auto_17505 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17478 ) ) ( not ( = ?auto_17473 ?auto_17503 ) ) ( not ( = ?auto_17474 ?auto_17478 ) ) ( not ( = ?auto_17474 ?auto_17503 ) ) ( not ( = ?auto_17475 ?auto_17478 ) ) ( not ( = ?auto_17475 ?auto_17503 ) ) ( not ( = ?auto_17476 ?auto_17478 ) ) ( not ( = ?auto_17476 ?auto_17503 ) ) ( not ( = ?auto_17478 ?auto_17505 ) ) ( not ( = ?auto_17478 ?auto_17492 ) ) ( not ( = ?auto_17478 ?auto_17498 ) ) ( not ( = ?auto_17478 ?auto_17500 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17492 ) ) ( not ( = ?auto_17503 ?auto_17498 ) ) ( not ( = ?auto_17503 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17479 ) ) ( not ( = ?auto_17473 ?auto_17493 ) ) ( not ( = ?auto_17474 ?auto_17479 ) ) ( not ( = ?auto_17474 ?auto_17493 ) ) ( not ( = ?auto_17475 ?auto_17479 ) ) ( not ( = ?auto_17475 ?auto_17493 ) ) ( not ( = ?auto_17476 ?auto_17479 ) ) ( not ( = ?auto_17476 ?auto_17493 ) ) ( not ( = ?auto_17477 ?auto_17479 ) ) ( not ( = ?auto_17477 ?auto_17493 ) ) ( not ( = ?auto_17479 ?auto_17503 ) ) ( not ( = ?auto_17479 ?auto_17505 ) ) ( not ( = ?auto_17479 ?auto_17492 ) ) ( not ( = ?auto_17479 ?auto_17498 ) ) ( not ( = ?auto_17479 ?auto_17500 ) ) ( not ( = ?auto_17491 ?auto_17504 ) ) ( not ( = ?auto_17491 ?auto_17495 ) ) ( not ( = ?auto_17491 ?auto_17497 ) ) ( not ( = ?auto_17491 ?auto_17499 ) ) ( not ( = ?auto_17490 ?auto_17494 ) ) ( not ( = ?auto_17490 ?auto_17496 ) ) ( not ( = ?auto_17490 ?auto_17501 ) ) ( not ( = ?auto_17490 ?auto_17502 ) ) ( not ( = ?auto_17493 ?auto_17503 ) ) ( not ( = ?auto_17493 ?auto_17505 ) ) ( not ( = ?auto_17493 ?auto_17492 ) ) ( not ( = ?auto_17493 ?auto_17498 ) ) ( not ( = ?auto_17493 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17480 ) ) ( not ( = ?auto_17473 ?auto_17506 ) ) ( not ( = ?auto_17474 ?auto_17480 ) ) ( not ( = ?auto_17474 ?auto_17506 ) ) ( not ( = ?auto_17475 ?auto_17480 ) ) ( not ( = ?auto_17475 ?auto_17506 ) ) ( not ( = ?auto_17476 ?auto_17480 ) ) ( not ( = ?auto_17476 ?auto_17506 ) ) ( not ( = ?auto_17477 ?auto_17480 ) ) ( not ( = ?auto_17477 ?auto_17506 ) ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17478 ?auto_17506 ) ) ( not ( = ?auto_17480 ?auto_17493 ) ) ( not ( = ?auto_17480 ?auto_17503 ) ) ( not ( = ?auto_17480 ?auto_17505 ) ) ( not ( = ?auto_17480 ?auto_17492 ) ) ( not ( = ?auto_17480 ?auto_17498 ) ) ( not ( = ?auto_17480 ?auto_17500 ) ) ( not ( = ?auto_17488 ?auto_17491 ) ) ( not ( = ?auto_17488 ?auto_17504 ) ) ( not ( = ?auto_17488 ?auto_17495 ) ) ( not ( = ?auto_17488 ?auto_17497 ) ) ( not ( = ?auto_17488 ?auto_17499 ) ) ( not ( = ?auto_17489 ?auto_17490 ) ) ( not ( = ?auto_17489 ?auto_17494 ) ) ( not ( = ?auto_17489 ?auto_17496 ) ) ( not ( = ?auto_17489 ?auto_17501 ) ) ( not ( = ?auto_17489 ?auto_17502 ) ) ( not ( = ?auto_17506 ?auto_17493 ) ) ( not ( = ?auto_17506 ?auto_17503 ) ) ( not ( = ?auto_17506 ?auto_17505 ) ) ( not ( = ?auto_17506 ?auto_17492 ) ) ( not ( = ?auto_17506 ?auto_17498 ) ) ( not ( = ?auto_17506 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17481 ) ) ( not ( = ?auto_17473 ?auto_17483 ) ) ( not ( = ?auto_17474 ?auto_17481 ) ) ( not ( = ?auto_17474 ?auto_17483 ) ) ( not ( = ?auto_17475 ?auto_17481 ) ) ( not ( = ?auto_17475 ?auto_17483 ) ) ( not ( = ?auto_17476 ?auto_17481 ) ) ( not ( = ?auto_17476 ?auto_17483 ) ) ( not ( = ?auto_17477 ?auto_17481 ) ) ( not ( = ?auto_17477 ?auto_17483 ) ) ( not ( = ?auto_17478 ?auto_17481 ) ) ( not ( = ?auto_17478 ?auto_17483 ) ) ( not ( = ?auto_17479 ?auto_17481 ) ) ( not ( = ?auto_17479 ?auto_17483 ) ) ( not ( = ?auto_17481 ?auto_17506 ) ) ( not ( = ?auto_17481 ?auto_17493 ) ) ( not ( = ?auto_17481 ?auto_17503 ) ) ( not ( = ?auto_17481 ?auto_17505 ) ) ( not ( = ?auto_17481 ?auto_17492 ) ) ( not ( = ?auto_17481 ?auto_17498 ) ) ( not ( = ?auto_17481 ?auto_17500 ) ) ( not ( = ?auto_17482 ?auto_17488 ) ) ( not ( = ?auto_17482 ?auto_17491 ) ) ( not ( = ?auto_17482 ?auto_17504 ) ) ( not ( = ?auto_17482 ?auto_17495 ) ) ( not ( = ?auto_17482 ?auto_17497 ) ) ( not ( = ?auto_17482 ?auto_17499 ) ) ( not ( = ?auto_17485 ?auto_17489 ) ) ( not ( = ?auto_17485 ?auto_17490 ) ) ( not ( = ?auto_17485 ?auto_17494 ) ) ( not ( = ?auto_17485 ?auto_17496 ) ) ( not ( = ?auto_17485 ?auto_17501 ) ) ( not ( = ?auto_17485 ?auto_17502 ) ) ( not ( = ?auto_17483 ?auto_17506 ) ) ( not ( = ?auto_17483 ?auto_17493 ) ) ( not ( = ?auto_17483 ?auto_17503 ) ) ( not ( = ?auto_17483 ?auto_17505 ) ) ( not ( = ?auto_17483 ?auto_17492 ) ) ( not ( = ?auto_17483 ?auto_17498 ) ) ( not ( = ?auto_17483 ?auto_17500 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17473 ?auto_17474 ?auto_17475 ?auto_17476 ?auto_17477 ?auto_17478 ?auto_17479 ?auto_17480 )
      ( MAKE-1CRATE ?auto_17480 ?auto_17481 )
      ( MAKE-8CRATE-VERIFY ?auto_17473 ?auto_17474 ?auto_17475 ?auto_17476 ?auto_17477 ?auto_17478 ?auto_17479 ?auto_17480 ?auto_17481 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_17527 - SURFACE
      ?auto_17528 - SURFACE
      ?auto_17529 - SURFACE
      ?auto_17530 - SURFACE
      ?auto_17531 - SURFACE
      ?auto_17532 - SURFACE
      ?auto_17533 - SURFACE
      ?auto_17534 - SURFACE
      ?auto_17535 - SURFACE
      ?auto_17536 - SURFACE
    )
    :vars
    (
      ?auto_17542 - HOIST
      ?auto_17537 - PLACE
      ?auto_17540 - PLACE
      ?auto_17539 - HOIST
      ?auto_17541 - SURFACE
      ?auto_17549 - PLACE
      ?auto_17546 - HOIST
      ?auto_17547 - SURFACE
      ?auto_17552 - PLACE
      ?auto_17545 - HOIST
      ?auto_17548 - SURFACE
      ?auto_17553 - PLACE
      ?auto_17563 - HOIST
      ?auto_17561 - SURFACE
      ?auto_17554 - PLACE
      ?auto_17560 - HOIST
      ?auto_17551 - SURFACE
      ?auto_17559 - PLACE
      ?auto_17543 - HOIST
      ?auto_17550 - SURFACE
      ?auto_17555 - PLACE
      ?auto_17558 - HOIST
      ?auto_17562 - SURFACE
      ?auto_17544 - SURFACE
      ?auto_17556 - PLACE
      ?auto_17564 - HOIST
      ?auto_17557 - SURFACE
      ?auto_17538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17542 ?auto_17537 ) ( IS-CRATE ?auto_17536 ) ( not ( = ?auto_17540 ?auto_17537 ) ) ( HOIST-AT ?auto_17539 ?auto_17540 ) ( AVAILABLE ?auto_17539 ) ( SURFACE-AT ?auto_17536 ?auto_17540 ) ( ON ?auto_17536 ?auto_17541 ) ( CLEAR ?auto_17536 ) ( not ( = ?auto_17535 ?auto_17536 ) ) ( not ( = ?auto_17535 ?auto_17541 ) ) ( not ( = ?auto_17536 ?auto_17541 ) ) ( not ( = ?auto_17542 ?auto_17539 ) ) ( IS-CRATE ?auto_17535 ) ( not ( = ?auto_17549 ?auto_17537 ) ) ( HOIST-AT ?auto_17546 ?auto_17549 ) ( AVAILABLE ?auto_17546 ) ( SURFACE-AT ?auto_17535 ?auto_17549 ) ( ON ?auto_17535 ?auto_17547 ) ( CLEAR ?auto_17535 ) ( not ( = ?auto_17534 ?auto_17535 ) ) ( not ( = ?auto_17534 ?auto_17547 ) ) ( not ( = ?auto_17535 ?auto_17547 ) ) ( not ( = ?auto_17542 ?auto_17546 ) ) ( IS-CRATE ?auto_17534 ) ( not ( = ?auto_17552 ?auto_17537 ) ) ( HOIST-AT ?auto_17545 ?auto_17552 ) ( AVAILABLE ?auto_17545 ) ( SURFACE-AT ?auto_17534 ?auto_17552 ) ( ON ?auto_17534 ?auto_17548 ) ( CLEAR ?auto_17534 ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17548 ) ) ( not ( = ?auto_17534 ?auto_17548 ) ) ( not ( = ?auto_17542 ?auto_17545 ) ) ( IS-CRATE ?auto_17533 ) ( not ( = ?auto_17553 ?auto_17537 ) ) ( HOIST-AT ?auto_17563 ?auto_17553 ) ( AVAILABLE ?auto_17563 ) ( SURFACE-AT ?auto_17533 ?auto_17553 ) ( ON ?auto_17533 ?auto_17561 ) ( CLEAR ?auto_17533 ) ( not ( = ?auto_17532 ?auto_17533 ) ) ( not ( = ?auto_17532 ?auto_17561 ) ) ( not ( = ?auto_17533 ?auto_17561 ) ) ( not ( = ?auto_17542 ?auto_17563 ) ) ( IS-CRATE ?auto_17532 ) ( not ( = ?auto_17554 ?auto_17537 ) ) ( HOIST-AT ?auto_17560 ?auto_17554 ) ( SURFACE-AT ?auto_17532 ?auto_17554 ) ( ON ?auto_17532 ?auto_17551 ) ( CLEAR ?auto_17532 ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17531 ?auto_17551 ) ) ( not ( = ?auto_17532 ?auto_17551 ) ) ( not ( = ?auto_17542 ?auto_17560 ) ) ( IS-CRATE ?auto_17531 ) ( not ( = ?auto_17559 ?auto_17537 ) ) ( HOIST-AT ?auto_17543 ?auto_17559 ) ( AVAILABLE ?auto_17543 ) ( SURFACE-AT ?auto_17531 ?auto_17559 ) ( ON ?auto_17531 ?auto_17550 ) ( CLEAR ?auto_17531 ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17550 ) ) ( not ( = ?auto_17531 ?auto_17550 ) ) ( not ( = ?auto_17542 ?auto_17543 ) ) ( IS-CRATE ?auto_17530 ) ( not ( = ?auto_17555 ?auto_17537 ) ) ( HOIST-AT ?auto_17558 ?auto_17555 ) ( AVAILABLE ?auto_17558 ) ( SURFACE-AT ?auto_17530 ?auto_17555 ) ( ON ?auto_17530 ?auto_17562 ) ( CLEAR ?auto_17530 ) ( not ( = ?auto_17529 ?auto_17530 ) ) ( not ( = ?auto_17529 ?auto_17562 ) ) ( not ( = ?auto_17530 ?auto_17562 ) ) ( not ( = ?auto_17542 ?auto_17558 ) ) ( IS-CRATE ?auto_17529 ) ( AVAILABLE ?auto_17560 ) ( SURFACE-AT ?auto_17529 ?auto_17554 ) ( ON ?auto_17529 ?auto_17544 ) ( CLEAR ?auto_17529 ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17528 ?auto_17544 ) ) ( not ( = ?auto_17529 ?auto_17544 ) ) ( SURFACE-AT ?auto_17527 ?auto_17537 ) ( CLEAR ?auto_17527 ) ( IS-CRATE ?auto_17528 ) ( AVAILABLE ?auto_17542 ) ( not ( = ?auto_17556 ?auto_17537 ) ) ( HOIST-AT ?auto_17564 ?auto_17556 ) ( AVAILABLE ?auto_17564 ) ( SURFACE-AT ?auto_17528 ?auto_17556 ) ( ON ?auto_17528 ?auto_17557 ) ( CLEAR ?auto_17528 ) ( TRUCK-AT ?auto_17538 ?auto_17537 ) ( not ( = ?auto_17527 ?auto_17528 ) ) ( not ( = ?auto_17527 ?auto_17557 ) ) ( not ( = ?auto_17528 ?auto_17557 ) ) ( not ( = ?auto_17542 ?auto_17564 ) ) ( not ( = ?auto_17527 ?auto_17529 ) ) ( not ( = ?auto_17527 ?auto_17544 ) ) ( not ( = ?auto_17529 ?auto_17557 ) ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17560 ?auto_17564 ) ) ( not ( = ?auto_17544 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17530 ) ) ( not ( = ?auto_17527 ?auto_17562 ) ) ( not ( = ?auto_17528 ?auto_17530 ) ) ( not ( = ?auto_17528 ?auto_17562 ) ) ( not ( = ?auto_17530 ?auto_17544 ) ) ( not ( = ?auto_17530 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17554 ) ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17558 ?auto_17560 ) ) ( not ( = ?auto_17558 ?auto_17564 ) ) ( not ( = ?auto_17562 ?auto_17544 ) ) ( not ( = ?auto_17562 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17531 ) ) ( not ( = ?auto_17527 ?auto_17550 ) ) ( not ( = ?auto_17528 ?auto_17531 ) ) ( not ( = ?auto_17528 ?auto_17550 ) ) ( not ( = ?auto_17529 ?auto_17531 ) ) ( not ( = ?auto_17529 ?auto_17550 ) ) ( not ( = ?auto_17531 ?auto_17562 ) ) ( not ( = ?auto_17531 ?auto_17544 ) ) ( not ( = ?auto_17531 ?auto_17557 ) ) ( not ( = ?auto_17559 ?auto_17555 ) ) ( not ( = ?auto_17559 ?auto_17554 ) ) ( not ( = ?auto_17559 ?auto_17556 ) ) ( not ( = ?auto_17543 ?auto_17558 ) ) ( not ( = ?auto_17543 ?auto_17560 ) ) ( not ( = ?auto_17543 ?auto_17564 ) ) ( not ( = ?auto_17550 ?auto_17562 ) ) ( not ( = ?auto_17550 ?auto_17544 ) ) ( not ( = ?auto_17550 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17532 ) ) ( not ( = ?auto_17527 ?auto_17551 ) ) ( not ( = ?auto_17528 ?auto_17532 ) ) ( not ( = ?auto_17528 ?auto_17551 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17529 ?auto_17551 ) ) ( not ( = ?auto_17530 ?auto_17532 ) ) ( not ( = ?auto_17530 ?auto_17551 ) ) ( not ( = ?auto_17532 ?auto_17550 ) ) ( not ( = ?auto_17532 ?auto_17562 ) ) ( not ( = ?auto_17532 ?auto_17544 ) ) ( not ( = ?auto_17532 ?auto_17557 ) ) ( not ( = ?auto_17551 ?auto_17550 ) ) ( not ( = ?auto_17551 ?auto_17562 ) ) ( not ( = ?auto_17551 ?auto_17544 ) ) ( not ( = ?auto_17551 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17533 ) ) ( not ( = ?auto_17527 ?auto_17561 ) ) ( not ( = ?auto_17528 ?auto_17533 ) ) ( not ( = ?auto_17528 ?auto_17561 ) ) ( not ( = ?auto_17529 ?auto_17533 ) ) ( not ( = ?auto_17529 ?auto_17561 ) ) ( not ( = ?auto_17530 ?auto_17533 ) ) ( not ( = ?auto_17530 ?auto_17561 ) ) ( not ( = ?auto_17531 ?auto_17533 ) ) ( not ( = ?auto_17531 ?auto_17561 ) ) ( not ( = ?auto_17533 ?auto_17551 ) ) ( not ( = ?auto_17533 ?auto_17550 ) ) ( not ( = ?auto_17533 ?auto_17562 ) ) ( not ( = ?auto_17533 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17557 ) ) ( not ( = ?auto_17553 ?auto_17554 ) ) ( not ( = ?auto_17553 ?auto_17559 ) ) ( not ( = ?auto_17553 ?auto_17555 ) ) ( not ( = ?auto_17553 ?auto_17556 ) ) ( not ( = ?auto_17563 ?auto_17560 ) ) ( not ( = ?auto_17563 ?auto_17543 ) ) ( not ( = ?auto_17563 ?auto_17558 ) ) ( not ( = ?auto_17563 ?auto_17564 ) ) ( not ( = ?auto_17561 ?auto_17551 ) ) ( not ( = ?auto_17561 ?auto_17550 ) ) ( not ( = ?auto_17561 ?auto_17562 ) ) ( not ( = ?auto_17561 ?auto_17544 ) ) ( not ( = ?auto_17561 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17534 ) ) ( not ( = ?auto_17527 ?auto_17548 ) ) ( not ( = ?auto_17528 ?auto_17534 ) ) ( not ( = ?auto_17528 ?auto_17548 ) ) ( not ( = ?auto_17529 ?auto_17534 ) ) ( not ( = ?auto_17529 ?auto_17548 ) ) ( not ( = ?auto_17530 ?auto_17534 ) ) ( not ( = ?auto_17530 ?auto_17548 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( not ( = ?auto_17531 ?auto_17548 ) ) ( not ( = ?auto_17532 ?auto_17534 ) ) ( not ( = ?auto_17532 ?auto_17548 ) ) ( not ( = ?auto_17534 ?auto_17561 ) ) ( not ( = ?auto_17534 ?auto_17551 ) ) ( not ( = ?auto_17534 ?auto_17550 ) ) ( not ( = ?auto_17534 ?auto_17562 ) ) ( not ( = ?auto_17534 ?auto_17544 ) ) ( not ( = ?auto_17534 ?auto_17557 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17554 ) ) ( not ( = ?auto_17552 ?auto_17559 ) ) ( not ( = ?auto_17552 ?auto_17555 ) ) ( not ( = ?auto_17552 ?auto_17556 ) ) ( not ( = ?auto_17545 ?auto_17563 ) ) ( not ( = ?auto_17545 ?auto_17560 ) ) ( not ( = ?auto_17545 ?auto_17543 ) ) ( not ( = ?auto_17545 ?auto_17558 ) ) ( not ( = ?auto_17545 ?auto_17564 ) ) ( not ( = ?auto_17548 ?auto_17561 ) ) ( not ( = ?auto_17548 ?auto_17551 ) ) ( not ( = ?auto_17548 ?auto_17550 ) ) ( not ( = ?auto_17548 ?auto_17562 ) ) ( not ( = ?auto_17548 ?auto_17544 ) ) ( not ( = ?auto_17548 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17535 ) ) ( not ( = ?auto_17527 ?auto_17547 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17547 ) ) ( not ( = ?auto_17529 ?auto_17535 ) ) ( not ( = ?auto_17529 ?auto_17547 ) ) ( not ( = ?auto_17530 ?auto_17535 ) ) ( not ( = ?auto_17530 ?auto_17547 ) ) ( not ( = ?auto_17531 ?auto_17535 ) ) ( not ( = ?auto_17531 ?auto_17547 ) ) ( not ( = ?auto_17532 ?auto_17535 ) ) ( not ( = ?auto_17532 ?auto_17547 ) ) ( not ( = ?auto_17533 ?auto_17535 ) ) ( not ( = ?auto_17533 ?auto_17547 ) ) ( not ( = ?auto_17535 ?auto_17548 ) ) ( not ( = ?auto_17535 ?auto_17561 ) ) ( not ( = ?auto_17535 ?auto_17551 ) ) ( not ( = ?auto_17535 ?auto_17550 ) ) ( not ( = ?auto_17535 ?auto_17562 ) ) ( not ( = ?auto_17535 ?auto_17544 ) ) ( not ( = ?auto_17535 ?auto_17557 ) ) ( not ( = ?auto_17549 ?auto_17552 ) ) ( not ( = ?auto_17549 ?auto_17553 ) ) ( not ( = ?auto_17549 ?auto_17554 ) ) ( not ( = ?auto_17549 ?auto_17559 ) ) ( not ( = ?auto_17549 ?auto_17555 ) ) ( not ( = ?auto_17549 ?auto_17556 ) ) ( not ( = ?auto_17546 ?auto_17545 ) ) ( not ( = ?auto_17546 ?auto_17563 ) ) ( not ( = ?auto_17546 ?auto_17560 ) ) ( not ( = ?auto_17546 ?auto_17543 ) ) ( not ( = ?auto_17546 ?auto_17558 ) ) ( not ( = ?auto_17546 ?auto_17564 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( not ( = ?auto_17547 ?auto_17561 ) ) ( not ( = ?auto_17547 ?auto_17551 ) ) ( not ( = ?auto_17547 ?auto_17550 ) ) ( not ( = ?auto_17547 ?auto_17562 ) ) ( not ( = ?auto_17547 ?auto_17544 ) ) ( not ( = ?auto_17547 ?auto_17557 ) ) ( not ( = ?auto_17527 ?auto_17536 ) ) ( not ( = ?auto_17527 ?auto_17541 ) ) ( not ( = ?auto_17528 ?auto_17536 ) ) ( not ( = ?auto_17528 ?auto_17541 ) ) ( not ( = ?auto_17529 ?auto_17536 ) ) ( not ( = ?auto_17529 ?auto_17541 ) ) ( not ( = ?auto_17530 ?auto_17536 ) ) ( not ( = ?auto_17530 ?auto_17541 ) ) ( not ( = ?auto_17531 ?auto_17536 ) ) ( not ( = ?auto_17531 ?auto_17541 ) ) ( not ( = ?auto_17532 ?auto_17536 ) ) ( not ( = ?auto_17532 ?auto_17541 ) ) ( not ( = ?auto_17533 ?auto_17536 ) ) ( not ( = ?auto_17533 ?auto_17541 ) ) ( not ( = ?auto_17534 ?auto_17536 ) ) ( not ( = ?auto_17534 ?auto_17541 ) ) ( not ( = ?auto_17536 ?auto_17547 ) ) ( not ( = ?auto_17536 ?auto_17548 ) ) ( not ( = ?auto_17536 ?auto_17561 ) ) ( not ( = ?auto_17536 ?auto_17551 ) ) ( not ( = ?auto_17536 ?auto_17550 ) ) ( not ( = ?auto_17536 ?auto_17562 ) ) ( not ( = ?auto_17536 ?auto_17544 ) ) ( not ( = ?auto_17536 ?auto_17557 ) ) ( not ( = ?auto_17540 ?auto_17549 ) ) ( not ( = ?auto_17540 ?auto_17552 ) ) ( not ( = ?auto_17540 ?auto_17553 ) ) ( not ( = ?auto_17540 ?auto_17554 ) ) ( not ( = ?auto_17540 ?auto_17559 ) ) ( not ( = ?auto_17540 ?auto_17555 ) ) ( not ( = ?auto_17540 ?auto_17556 ) ) ( not ( = ?auto_17539 ?auto_17546 ) ) ( not ( = ?auto_17539 ?auto_17545 ) ) ( not ( = ?auto_17539 ?auto_17563 ) ) ( not ( = ?auto_17539 ?auto_17560 ) ) ( not ( = ?auto_17539 ?auto_17543 ) ) ( not ( = ?auto_17539 ?auto_17558 ) ) ( not ( = ?auto_17539 ?auto_17564 ) ) ( not ( = ?auto_17541 ?auto_17547 ) ) ( not ( = ?auto_17541 ?auto_17548 ) ) ( not ( = ?auto_17541 ?auto_17561 ) ) ( not ( = ?auto_17541 ?auto_17551 ) ) ( not ( = ?auto_17541 ?auto_17550 ) ) ( not ( = ?auto_17541 ?auto_17562 ) ) ( not ( = ?auto_17541 ?auto_17544 ) ) ( not ( = ?auto_17541 ?auto_17557 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17527 ?auto_17528 ?auto_17529 ?auto_17530 ?auto_17531 ?auto_17532 ?auto_17533 ?auto_17534 ?auto_17535 )
      ( MAKE-1CRATE ?auto_17535 ?auto_17536 )
      ( MAKE-9CRATE-VERIFY ?auto_17527 ?auto_17528 ?auto_17529 ?auto_17530 ?auto_17531 ?auto_17532 ?auto_17533 ?auto_17534 ?auto_17535 ?auto_17536 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_17586 - SURFACE
      ?auto_17587 - SURFACE
      ?auto_17588 - SURFACE
      ?auto_17589 - SURFACE
      ?auto_17590 - SURFACE
      ?auto_17591 - SURFACE
      ?auto_17592 - SURFACE
      ?auto_17593 - SURFACE
      ?auto_17594 - SURFACE
      ?auto_17595 - SURFACE
      ?auto_17596 - SURFACE
    )
    :vars
    (
      ?auto_17598 - HOIST
      ?auto_17602 - PLACE
      ?auto_17601 - PLACE
      ?auto_17600 - HOIST
      ?auto_17599 - SURFACE
      ?auto_17611 - PLACE
      ?auto_17610 - HOIST
      ?auto_17612 - SURFACE
      ?auto_17623 - PLACE
      ?auto_17625 - HOIST
      ?auto_17603 - SURFACE
      ?auto_17615 - PLACE
      ?auto_17618 - HOIST
      ?auto_17626 - SURFACE
      ?auto_17619 - PLACE
      ?auto_17621 - HOIST
      ?auto_17608 - SURFACE
      ?auto_17616 - PLACE
      ?auto_17614 - HOIST
      ?auto_17617 - SURFACE
      ?auto_17620 - PLACE
      ?auto_17604 - HOIST
      ?auto_17627 - SURFACE
      ?auto_17607 - PLACE
      ?auto_17605 - HOIST
      ?auto_17622 - SURFACE
      ?auto_17606 - SURFACE
      ?auto_17624 - PLACE
      ?auto_17609 - HOIST
      ?auto_17613 - SURFACE
      ?auto_17597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17598 ?auto_17602 ) ( IS-CRATE ?auto_17596 ) ( not ( = ?auto_17601 ?auto_17602 ) ) ( HOIST-AT ?auto_17600 ?auto_17601 ) ( AVAILABLE ?auto_17600 ) ( SURFACE-AT ?auto_17596 ?auto_17601 ) ( ON ?auto_17596 ?auto_17599 ) ( CLEAR ?auto_17596 ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17599 ) ) ( not ( = ?auto_17596 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17600 ) ) ( IS-CRATE ?auto_17595 ) ( not ( = ?auto_17611 ?auto_17602 ) ) ( HOIST-AT ?auto_17610 ?auto_17611 ) ( AVAILABLE ?auto_17610 ) ( SURFACE-AT ?auto_17595 ?auto_17611 ) ( ON ?auto_17595 ?auto_17612 ) ( CLEAR ?auto_17595 ) ( not ( = ?auto_17594 ?auto_17595 ) ) ( not ( = ?auto_17594 ?auto_17612 ) ) ( not ( = ?auto_17595 ?auto_17612 ) ) ( not ( = ?auto_17598 ?auto_17610 ) ) ( IS-CRATE ?auto_17594 ) ( not ( = ?auto_17623 ?auto_17602 ) ) ( HOIST-AT ?auto_17625 ?auto_17623 ) ( AVAILABLE ?auto_17625 ) ( SURFACE-AT ?auto_17594 ?auto_17623 ) ( ON ?auto_17594 ?auto_17603 ) ( CLEAR ?auto_17594 ) ( not ( = ?auto_17593 ?auto_17594 ) ) ( not ( = ?auto_17593 ?auto_17603 ) ) ( not ( = ?auto_17594 ?auto_17603 ) ) ( not ( = ?auto_17598 ?auto_17625 ) ) ( IS-CRATE ?auto_17593 ) ( not ( = ?auto_17615 ?auto_17602 ) ) ( HOIST-AT ?auto_17618 ?auto_17615 ) ( AVAILABLE ?auto_17618 ) ( SURFACE-AT ?auto_17593 ?auto_17615 ) ( ON ?auto_17593 ?auto_17626 ) ( CLEAR ?auto_17593 ) ( not ( = ?auto_17592 ?auto_17593 ) ) ( not ( = ?auto_17592 ?auto_17626 ) ) ( not ( = ?auto_17593 ?auto_17626 ) ) ( not ( = ?auto_17598 ?auto_17618 ) ) ( IS-CRATE ?auto_17592 ) ( not ( = ?auto_17619 ?auto_17602 ) ) ( HOIST-AT ?auto_17621 ?auto_17619 ) ( AVAILABLE ?auto_17621 ) ( SURFACE-AT ?auto_17592 ?auto_17619 ) ( ON ?auto_17592 ?auto_17608 ) ( CLEAR ?auto_17592 ) ( not ( = ?auto_17591 ?auto_17592 ) ) ( not ( = ?auto_17591 ?auto_17608 ) ) ( not ( = ?auto_17592 ?auto_17608 ) ) ( not ( = ?auto_17598 ?auto_17621 ) ) ( IS-CRATE ?auto_17591 ) ( not ( = ?auto_17616 ?auto_17602 ) ) ( HOIST-AT ?auto_17614 ?auto_17616 ) ( SURFACE-AT ?auto_17591 ?auto_17616 ) ( ON ?auto_17591 ?auto_17617 ) ( CLEAR ?auto_17591 ) ( not ( = ?auto_17590 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17617 ) ) ( not ( = ?auto_17591 ?auto_17617 ) ) ( not ( = ?auto_17598 ?auto_17614 ) ) ( IS-CRATE ?auto_17590 ) ( not ( = ?auto_17620 ?auto_17602 ) ) ( HOIST-AT ?auto_17604 ?auto_17620 ) ( AVAILABLE ?auto_17604 ) ( SURFACE-AT ?auto_17590 ?auto_17620 ) ( ON ?auto_17590 ?auto_17627 ) ( CLEAR ?auto_17590 ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17627 ) ) ( not ( = ?auto_17590 ?auto_17627 ) ) ( not ( = ?auto_17598 ?auto_17604 ) ) ( IS-CRATE ?auto_17589 ) ( not ( = ?auto_17607 ?auto_17602 ) ) ( HOIST-AT ?auto_17605 ?auto_17607 ) ( AVAILABLE ?auto_17605 ) ( SURFACE-AT ?auto_17589 ?auto_17607 ) ( ON ?auto_17589 ?auto_17622 ) ( CLEAR ?auto_17589 ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17622 ) ) ( not ( = ?auto_17589 ?auto_17622 ) ) ( not ( = ?auto_17598 ?auto_17605 ) ) ( IS-CRATE ?auto_17588 ) ( AVAILABLE ?auto_17614 ) ( SURFACE-AT ?auto_17588 ?auto_17616 ) ( ON ?auto_17588 ?auto_17606 ) ( CLEAR ?auto_17588 ) ( not ( = ?auto_17587 ?auto_17588 ) ) ( not ( = ?auto_17587 ?auto_17606 ) ) ( not ( = ?auto_17588 ?auto_17606 ) ) ( SURFACE-AT ?auto_17586 ?auto_17602 ) ( CLEAR ?auto_17586 ) ( IS-CRATE ?auto_17587 ) ( AVAILABLE ?auto_17598 ) ( not ( = ?auto_17624 ?auto_17602 ) ) ( HOIST-AT ?auto_17609 ?auto_17624 ) ( AVAILABLE ?auto_17609 ) ( SURFACE-AT ?auto_17587 ?auto_17624 ) ( ON ?auto_17587 ?auto_17613 ) ( CLEAR ?auto_17587 ) ( TRUCK-AT ?auto_17597 ?auto_17602 ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( not ( = ?auto_17586 ?auto_17613 ) ) ( not ( = ?auto_17587 ?auto_17613 ) ) ( not ( = ?auto_17598 ?auto_17609 ) ) ( not ( = ?auto_17586 ?auto_17588 ) ) ( not ( = ?auto_17586 ?auto_17606 ) ) ( not ( = ?auto_17588 ?auto_17613 ) ) ( not ( = ?auto_17616 ?auto_17624 ) ) ( not ( = ?auto_17614 ?auto_17609 ) ) ( not ( = ?auto_17606 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17622 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17622 ) ) ( not ( = ?auto_17589 ?auto_17606 ) ) ( not ( = ?auto_17589 ?auto_17613 ) ) ( not ( = ?auto_17607 ?auto_17616 ) ) ( not ( = ?auto_17607 ?auto_17624 ) ) ( not ( = ?auto_17605 ?auto_17614 ) ) ( not ( = ?auto_17605 ?auto_17609 ) ) ( not ( = ?auto_17622 ?auto_17606 ) ) ( not ( = ?auto_17622 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17590 ) ) ( not ( = ?auto_17586 ?auto_17627 ) ) ( not ( = ?auto_17587 ?auto_17590 ) ) ( not ( = ?auto_17587 ?auto_17627 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17588 ?auto_17627 ) ) ( not ( = ?auto_17590 ?auto_17622 ) ) ( not ( = ?auto_17590 ?auto_17606 ) ) ( not ( = ?auto_17590 ?auto_17613 ) ) ( not ( = ?auto_17620 ?auto_17607 ) ) ( not ( = ?auto_17620 ?auto_17616 ) ) ( not ( = ?auto_17620 ?auto_17624 ) ) ( not ( = ?auto_17604 ?auto_17605 ) ) ( not ( = ?auto_17604 ?auto_17614 ) ) ( not ( = ?auto_17604 ?auto_17609 ) ) ( not ( = ?auto_17627 ?auto_17622 ) ) ( not ( = ?auto_17627 ?auto_17606 ) ) ( not ( = ?auto_17627 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17591 ) ) ( not ( = ?auto_17586 ?auto_17617 ) ) ( not ( = ?auto_17587 ?auto_17591 ) ) ( not ( = ?auto_17587 ?auto_17617 ) ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( not ( = ?auto_17588 ?auto_17617 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17589 ?auto_17617 ) ) ( not ( = ?auto_17591 ?auto_17627 ) ) ( not ( = ?auto_17591 ?auto_17622 ) ) ( not ( = ?auto_17591 ?auto_17606 ) ) ( not ( = ?auto_17591 ?auto_17613 ) ) ( not ( = ?auto_17617 ?auto_17627 ) ) ( not ( = ?auto_17617 ?auto_17622 ) ) ( not ( = ?auto_17617 ?auto_17606 ) ) ( not ( = ?auto_17617 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17592 ) ) ( not ( = ?auto_17586 ?auto_17608 ) ) ( not ( = ?auto_17587 ?auto_17592 ) ) ( not ( = ?auto_17587 ?auto_17608 ) ) ( not ( = ?auto_17588 ?auto_17592 ) ) ( not ( = ?auto_17588 ?auto_17608 ) ) ( not ( = ?auto_17589 ?auto_17592 ) ) ( not ( = ?auto_17589 ?auto_17608 ) ) ( not ( = ?auto_17590 ?auto_17592 ) ) ( not ( = ?auto_17590 ?auto_17608 ) ) ( not ( = ?auto_17592 ?auto_17617 ) ) ( not ( = ?auto_17592 ?auto_17627 ) ) ( not ( = ?auto_17592 ?auto_17622 ) ) ( not ( = ?auto_17592 ?auto_17606 ) ) ( not ( = ?auto_17592 ?auto_17613 ) ) ( not ( = ?auto_17619 ?auto_17616 ) ) ( not ( = ?auto_17619 ?auto_17620 ) ) ( not ( = ?auto_17619 ?auto_17607 ) ) ( not ( = ?auto_17619 ?auto_17624 ) ) ( not ( = ?auto_17621 ?auto_17614 ) ) ( not ( = ?auto_17621 ?auto_17604 ) ) ( not ( = ?auto_17621 ?auto_17605 ) ) ( not ( = ?auto_17621 ?auto_17609 ) ) ( not ( = ?auto_17608 ?auto_17617 ) ) ( not ( = ?auto_17608 ?auto_17627 ) ) ( not ( = ?auto_17608 ?auto_17622 ) ) ( not ( = ?auto_17608 ?auto_17606 ) ) ( not ( = ?auto_17608 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17593 ) ) ( not ( = ?auto_17586 ?auto_17626 ) ) ( not ( = ?auto_17587 ?auto_17593 ) ) ( not ( = ?auto_17587 ?auto_17626 ) ) ( not ( = ?auto_17588 ?auto_17593 ) ) ( not ( = ?auto_17588 ?auto_17626 ) ) ( not ( = ?auto_17589 ?auto_17593 ) ) ( not ( = ?auto_17589 ?auto_17626 ) ) ( not ( = ?auto_17590 ?auto_17593 ) ) ( not ( = ?auto_17590 ?auto_17626 ) ) ( not ( = ?auto_17591 ?auto_17593 ) ) ( not ( = ?auto_17591 ?auto_17626 ) ) ( not ( = ?auto_17593 ?auto_17608 ) ) ( not ( = ?auto_17593 ?auto_17617 ) ) ( not ( = ?auto_17593 ?auto_17627 ) ) ( not ( = ?auto_17593 ?auto_17622 ) ) ( not ( = ?auto_17593 ?auto_17606 ) ) ( not ( = ?auto_17593 ?auto_17613 ) ) ( not ( = ?auto_17615 ?auto_17619 ) ) ( not ( = ?auto_17615 ?auto_17616 ) ) ( not ( = ?auto_17615 ?auto_17620 ) ) ( not ( = ?auto_17615 ?auto_17607 ) ) ( not ( = ?auto_17615 ?auto_17624 ) ) ( not ( = ?auto_17618 ?auto_17621 ) ) ( not ( = ?auto_17618 ?auto_17614 ) ) ( not ( = ?auto_17618 ?auto_17604 ) ) ( not ( = ?auto_17618 ?auto_17605 ) ) ( not ( = ?auto_17618 ?auto_17609 ) ) ( not ( = ?auto_17626 ?auto_17608 ) ) ( not ( = ?auto_17626 ?auto_17617 ) ) ( not ( = ?auto_17626 ?auto_17627 ) ) ( not ( = ?auto_17626 ?auto_17622 ) ) ( not ( = ?auto_17626 ?auto_17606 ) ) ( not ( = ?auto_17626 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17594 ) ) ( not ( = ?auto_17586 ?auto_17603 ) ) ( not ( = ?auto_17587 ?auto_17594 ) ) ( not ( = ?auto_17587 ?auto_17603 ) ) ( not ( = ?auto_17588 ?auto_17594 ) ) ( not ( = ?auto_17588 ?auto_17603 ) ) ( not ( = ?auto_17589 ?auto_17594 ) ) ( not ( = ?auto_17589 ?auto_17603 ) ) ( not ( = ?auto_17590 ?auto_17594 ) ) ( not ( = ?auto_17590 ?auto_17603 ) ) ( not ( = ?auto_17591 ?auto_17594 ) ) ( not ( = ?auto_17591 ?auto_17603 ) ) ( not ( = ?auto_17592 ?auto_17594 ) ) ( not ( = ?auto_17592 ?auto_17603 ) ) ( not ( = ?auto_17594 ?auto_17626 ) ) ( not ( = ?auto_17594 ?auto_17608 ) ) ( not ( = ?auto_17594 ?auto_17617 ) ) ( not ( = ?auto_17594 ?auto_17627 ) ) ( not ( = ?auto_17594 ?auto_17622 ) ) ( not ( = ?auto_17594 ?auto_17606 ) ) ( not ( = ?auto_17594 ?auto_17613 ) ) ( not ( = ?auto_17623 ?auto_17615 ) ) ( not ( = ?auto_17623 ?auto_17619 ) ) ( not ( = ?auto_17623 ?auto_17616 ) ) ( not ( = ?auto_17623 ?auto_17620 ) ) ( not ( = ?auto_17623 ?auto_17607 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) ( not ( = ?auto_17625 ?auto_17618 ) ) ( not ( = ?auto_17625 ?auto_17621 ) ) ( not ( = ?auto_17625 ?auto_17614 ) ) ( not ( = ?auto_17625 ?auto_17604 ) ) ( not ( = ?auto_17625 ?auto_17605 ) ) ( not ( = ?auto_17625 ?auto_17609 ) ) ( not ( = ?auto_17603 ?auto_17626 ) ) ( not ( = ?auto_17603 ?auto_17608 ) ) ( not ( = ?auto_17603 ?auto_17617 ) ) ( not ( = ?auto_17603 ?auto_17627 ) ) ( not ( = ?auto_17603 ?auto_17622 ) ) ( not ( = ?auto_17603 ?auto_17606 ) ) ( not ( = ?auto_17603 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17595 ) ) ( not ( = ?auto_17586 ?auto_17612 ) ) ( not ( = ?auto_17587 ?auto_17595 ) ) ( not ( = ?auto_17587 ?auto_17612 ) ) ( not ( = ?auto_17588 ?auto_17595 ) ) ( not ( = ?auto_17588 ?auto_17612 ) ) ( not ( = ?auto_17589 ?auto_17595 ) ) ( not ( = ?auto_17589 ?auto_17612 ) ) ( not ( = ?auto_17590 ?auto_17595 ) ) ( not ( = ?auto_17590 ?auto_17612 ) ) ( not ( = ?auto_17591 ?auto_17595 ) ) ( not ( = ?auto_17591 ?auto_17612 ) ) ( not ( = ?auto_17592 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17612 ) ) ( not ( = ?auto_17593 ?auto_17595 ) ) ( not ( = ?auto_17593 ?auto_17612 ) ) ( not ( = ?auto_17595 ?auto_17603 ) ) ( not ( = ?auto_17595 ?auto_17626 ) ) ( not ( = ?auto_17595 ?auto_17608 ) ) ( not ( = ?auto_17595 ?auto_17617 ) ) ( not ( = ?auto_17595 ?auto_17627 ) ) ( not ( = ?auto_17595 ?auto_17622 ) ) ( not ( = ?auto_17595 ?auto_17606 ) ) ( not ( = ?auto_17595 ?auto_17613 ) ) ( not ( = ?auto_17611 ?auto_17623 ) ) ( not ( = ?auto_17611 ?auto_17615 ) ) ( not ( = ?auto_17611 ?auto_17619 ) ) ( not ( = ?auto_17611 ?auto_17616 ) ) ( not ( = ?auto_17611 ?auto_17620 ) ) ( not ( = ?auto_17611 ?auto_17607 ) ) ( not ( = ?auto_17611 ?auto_17624 ) ) ( not ( = ?auto_17610 ?auto_17625 ) ) ( not ( = ?auto_17610 ?auto_17618 ) ) ( not ( = ?auto_17610 ?auto_17621 ) ) ( not ( = ?auto_17610 ?auto_17614 ) ) ( not ( = ?auto_17610 ?auto_17604 ) ) ( not ( = ?auto_17610 ?auto_17605 ) ) ( not ( = ?auto_17610 ?auto_17609 ) ) ( not ( = ?auto_17612 ?auto_17603 ) ) ( not ( = ?auto_17612 ?auto_17626 ) ) ( not ( = ?auto_17612 ?auto_17608 ) ) ( not ( = ?auto_17612 ?auto_17617 ) ) ( not ( = ?auto_17612 ?auto_17627 ) ) ( not ( = ?auto_17612 ?auto_17622 ) ) ( not ( = ?auto_17612 ?auto_17606 ) ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17596 ) ) ( not ( = ?auto_17586 ?auto_17599 ) ) ( not ( = ?auto_17587 ?auto_17596 ) ) ( not ( = ?auto_17587 ?auto_17599 ) ) ( not ( = ?auto_17588 ?auto_17596 ) ) ( not ( = ?auto_17588 ?auto_17599 ) ) ( not ( = ?auto_17589 ?auto_17596 ) ) ( not ( = ?auto_17589 ?auto_17599 ) ) ( not ( = ?auto_17590 ?auto_17596 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( not ( = ?auto_17591 ?auto_17596 ) ) ( not ( = ?auto_17591 ?auto_17599 ) ) ( not ( = ?auto_17592 ?auto_17596 ) ) ( not ( = ?auto_17592 ?auto_17599 ) ) ( not ( = ?auto_17593 ?auto_17596 ) ) ( not ( = ?auto_17593 ?auto_17599 ) ) ( not ( = ?auto_17594 ?auto_17596 ) ) ( not ( = ?auto_17594 ?auto_17599 ) ) ( not ( = ?auto_17596 ?auto_17612 ) ) ( not ( = ?auto_17596 ?auto_17603 ) ) ( not ( = ?auto_17596 ?auto_17626 ) ) ( not ( = ?auto_17596 ?auto_17608 ) ) ( not ( = ?auto_17596 ?auto_17617 ) ) ( not ( = ?auto_17596 ?auto_17627 ) ) ( not ( = ?auto_17596 ?auto_17622 ) ) ( not ( = ?auto_17596 ?auto_17606 ) ) ( not ( = ?auto_17596 ?auto_17613 ) ) ( not ( = ?auto_17601 ?auto_17611 ) ) ( not ( = ?auto_17601 ?auto_17623 ) ) ( not ( = ?auto_17601 ?auto_17615 ) ) ( not ( = ?auto_17601 ?auto_17619 ) ) ( not ( = ?auto_17601 ?auto_17616 ) ) ( not ( = ?auto_17601 ?auto_17620 ) ) ( not ( = ?auto_17601 ?auto_17607 ) ) ( not ( = ?auto_17601 ?auto_17624 ) ) ( not ( = ?auto_17600 ?auto_17610 ) ) ( not ( = ?auto_17600 ?auto_17625 ) ) ( not ( = ?auto_17600 ?auto_17618 ) ) ( not ( = ?auto_17600 ?auto_17621 ) ) ( not ( = ?auto_17600 ?auto_17614 ) ) ( not ( = ?auto_17600 ?auto_17604 ) ) ( not ( = ?auto_17600 ?auto_17605 ) ) ( not ( = ?auto_17600 ?auto_17609 ) ) ( not ( = ?auto_17599 ?auto_17612 ) ) ( not ( = ?auto_17599 ?auto_17603 ) ) ( not ( = ?auto_17599 ?auto_17626 ) ) ( not ( = ?auto_17599 ?auto_17608 ) ) ( not ( = ?auto_17599 ?auto_17617 ) ) ( not ( = ?auto_17599 ?auto_17627 ) ) ( not ( = ?auto_17599 ?auto_17622 ) ) ( not ( = ?auto_17599 ?auto_17606 ) ) ( not ( = ?auto_17599 ?auto_17613 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ?auto_17590 ?auto_17591 ?auto_17592 ?auto_17593 ?auto_17594 ?auto_17595 )
      ( MAKE-1CRATE ?auto_17595 ?auto_17596 )
      ( MAKE-10CRATE-VERIFY ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ?auto_17590 ?auto_17591 ?auto_17592 ?auto_17593 ?auto_17594 ?auto_17595 ?auto_17596 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_17650 - SURFACE
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
      ?auto_17653 - SURFACE
      ?auto_17654 - SURFACE
      ?auto_17655 - SURFACE
      ?auto_17656 - SURFACE
      ?auto_17657 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17659 - SURFACE
      ?auto_17660 - SURFACE
      ?auto_17661 - SURFACE
    )
    :vars
    (
      ?auto_17665 - HOIST
      ?auto_17666 - PLACE
      ?auto_17664 - PLACE
      ?auto_17667 - HOIST
      ?auto_17662 - SURFACE
      ?auto_17695 - PLACE
      ?auto_17669 - HOIST
      ?auto_17670 - SURFACE
      ?auto_17686 - PLACE
      ?auto_17685 - HOIST
      ?auto_17673 - SURFACE
      ?auto_17688 - PLACE
      ?auto_17679 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17672 - PLACE
      ?auto_17683 - HOIST
      ?auto_17678 - SURFACE
      ?auto_17693 - PLACE
      ?auto_17694 - HOIST
      ?auto_17684 - SURFACE
      ?auto_17690 - PLACE
      ?auto_17676 - HOIST
      ?auto_17668 - SURFACE
      ?auto_17675 - PLACE
      ?auto_17682 - HOIST
      ?auto_17677 - SURFACE
      ?auto_17681 - PLACE
      ?auto_17692 - HOIST
      ?auto_17687 - SURFACE
      ?auto_17691 - SURFACE
      ?auto_17689 - PLACE
      ?auto_17680 - HOIST
      ?auto_17671 - SURFACE
      ?auto_17663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17665 ?auto_17666 ) ( IS-CRATE ?auto_17661 ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( HOIST-AT ?auto_17667 ?auto_17664 ) ( AVAILABLE ?auto_17667 ) ( SURFACE-AT ?auto_17661 ?auto_17664 ) ( ON ?auto_17661 ?auto_17662 ) ( CLEAR ?auto_17661 ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17661 ?auto_17662 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( IS-CRATE ?auto_17660 ) ( not ( = ?auto_17695 ?auto_17666 ) ) ( HOIST-AT ?auto_17669 ?auto_17695 ) ( AVAILABLE ?auto_17669 ) ( SURFACE-AT ?auto_17660 ?auto_17695 ) ( ON ?auto_17660 ?auto_17670 ) ( CLEAR ?auto_17660 ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17670 ) ) ( not ( = ?auto_17660 ?auto_17670 ) ) ( not ( = ?auto_17665 ?auto_17669 ) ) ( IS-CRATE ?auto_17659 ) ( not ( = ?auto_17686 ?auto_17666 ) ) ( HOIST-AT ?auto_17685 ?auto_17686 ) ( AVAILABLE ?auto_17685 ) ( SURFACE-AT ?auto_17659 ?auto_17686 ) ( ON ?auto_17659 ?auto_17673 ) ( CLEAR ?auto_17659 ) ( not ( = ?auto_17658 ?auto_17659 ) ) ( not ( = ?auto_17658 ?auto_17673 ) ) ( not ( = ?auto_17659 ?auto_17673 ) ) ( not ( = ?auto_17665 ?auto_17685 ) ) ( IS-CRATE ?auto_17658 ) ( not ( = ?auto_17688 ?auto_17666 ) ) ( HOIST-AT ?auto_17679 ?auto_17688 ) ( AVAILABLE ?auto_17679 ) ( SURFACE-AT ?auto_17658 ?auto_17688 ) ( ON ?auto_17658 ?auto_17674 ) ( CLEAR ?auto_17658 ) ( not ( = ?auto_17657 ?auto_17658 ) ) ( not ( = ?auto_17657 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17674 ) ) ( not ( = ?auto_17665 ?auto_17679 ) ) ( IS-CRATE ?auto_17657 ) ( not ( = ?auto_17672 ?auto_17666 ) ) ( HOIST-AT ?auto_17683 ?auto_17672 ) ( AVAILABLE ?auto_17683 ) ( SURFACE-AT ?auto_17657 ?auto_17672 ) ( ON ?auto_17657 ?auto_17678 ) ( CLEAR ?auto_17657 ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17678 ) ) ( not ( = ?auto_17657 ?auto_17678 ) ) ( not ( = ?auto_17665 ?auto_17683 ) ) ( IS-CRATE ?auto_17656 ) ( not ( = ?auto_17693 ?auto_17666 ) ) ( HOIST-AT ?auto_17694 ?auto_17693 ) ( AVAILABLE ?auto_17694 ) ( SURFACE-AT ?auto_17656 ?auto_17693 ) ( ON ?auto_17656 ?auto_17684 ) ( CLEAR ?auto_17656 ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17684 ) ) ( not ( = ?auto_17656 ?auto_17684 ) ) ( not ( = ?auto_17665 ?auto_17694 ) ) ( IS-CRATE ?auto_17655 ) ( not ( = ?auto_17690 ?auto_17666 ) ) ( HOIST-AT ?auto_17676 ?auto_17690 ) ( SURFACE-AT ?auto_17655 ?auto_17690 ) ( ON ?auto_17655 ?auto_17668 ) ( CLEAR ?auto_17655 ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17668 ) ) ( not ( = ?auto_17655 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17676 ) ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17675 ?auto_17666 ) ) ( HOIST-AT ?auto_17682 ?auto_17675 ) ( AVAILABLE ?auto_17682 ) ( SURFACE-AT ?auto_17654 ?auto_17675 ) ( ON ?auto_17654 ?auto_17677 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17677 ) ) ( not ( = ?auto_17654 ?auto_17677 ) ) ( not ( = ?auto_17665 ?auto_17682 ) ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17681 ?auto_17666 ) ) ( HOIST-AT ?auto_17692 ?auto_17681 ) ( AVAILABLE ?auto_17692 ) ( SURFACE-AT ?auto_17653 ?auto_17681 ) ( ON ?auto_17653 ?auto_17687 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17687 ) ) ( not ( = ?auto_17653 ?auto_17687 ) ) ( not ( = ?auto_17665 ?auto_17692 ) ) ( IS-CRATE ?auto_17652 ) ( AVAILABLE ?auto_17676 ) ( SURFACE-AT ?auto_17652 ?auto_17690 ) ( ON ?auto_17652 ?auto_17691 ) ( CLEAR ?auto_17652 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17691 ) ) ( not ( = ?auto_17652 ?auto_17691 ) ) ( SURFACE-AT ?auto_17650 ?auto_17666 ) ( CLEAR ?auto_17650 ) ( IS-CRATE ?auto_17651 ) ( AVAILABLE ?auto_17665 ) ( not ( = ?auto_17689 ?auto_17666 ) ) ( HOIST-AT ?auto_17680 ?auto_17689 ) ( AVAILABLE ?auto_17680 ) ( SURFACE-AT ?auto_17651 ?auto_17689 ) ( ON ?auto_17651 ?auto_17671 ) ( CLEAR ?auto_17651 ) ( TRUCK-AT ?auto_17663 ?auto_17666 ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17650 ?auto_17671 ) ) ( not ( = ?auto_17651 ?auto_17671 ) ) ( not ( = ?auto_17665 ?auto_17680 ) ) ( not ( = ?auto_17650 ?auto_17652 ) ) ( not ( = ?auto_17650 ?auto_17691 ) ) ( not ( = ?auto_17652 ?auto_17671 ) ) ( not ( = ?auto_17690 ?auto_17689 ) ) ( not ( = ?auto_17676 ?auto_17680 ) ) ( not ( = ?auto_17691 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17653 ) ) ( not ( = ?auto_17650 ?auto_17687 ) ) ( not ( = ?auto_17651 ?auto_17653 ) ) ( not ( = ?auto_17651 ?auto_17687 ) ) ( not ( = ?auto_17653 ?auto_17691 ) ) ( not ( = ?auto_17653 ?auto_17671 ) ) ( not ( = ?auto_17681 ?auto_17690 ) ) ( not ( = ?auto_17681 ?auto_17689 ) ) ( not ( = ?auto_17692 ?auto_17676 ) ) ( not ( = ?auto_17692 ?auto_17680 ) ) ( not ( = ?auto_17687 ?auto_17691 ) ) ( not ( = ?auto_17687 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17654 ) ) ( not ( = ?auto_17650 ?auto_17677 ) ) ( not ( = ?auto_17651 ?auto_17654 ) ) ( not ( = ?auto_17651 ?auto_17677 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17677 ) ) ( not ( = ?auto_17654 ?auto_17687 ) ) ( not ( = ?auto_17654 ?auto_17691 ) ) ( not ( = ?auto_17654 ?auto_17671 ) ) ( not ( = ?auto_17675 ?auto_17681 ) ) ( not ( = ?auto_17675 ?auto_17690 ) ) ( not ( = ?auto_17675 ?auto_17689 ) ) ( not ( = ?auto_17682 ?auto_17692 ) ) ( not ( = ?auto_17682 ?auto_17676 ) ) ( not ( = ?auto_17682 ?auto_17680 ) ) ( not ( = ?auto_17677 ?auto_17687 ) ) ( not ( = ?auto_17677 ?auto_17691 ) ) ( not ( = ?auto_17677 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17655 ) ) ( not ( = ?auto_17650 ?auto_17668 ) ) ( not ( = ?auto_17651 ?auto_17655 ) ) ( not ( = ?auto_17651 ?auto_17668 ) ) ( not ( = ?auto_17652 ?auto_17655 ) ) ( not ( = ?auto_17652 ?auto_17668 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17668 ) ) ( not ( = ?auto_17655 ?auto_17677 ) ) ( not ( = ?auto_17655 ?auto_17687 ) ) ( not ( = ?auto_17655 ?auto_17691 ) ) ( not ( = ?auto_17655 ?auto_17671 ) ) ( not ( = ?auto_17668 ?auto_17677 ) ) ( not ( = ?auto_17668 ?auto_17687 ) ) ( not ( = ?auto_17668 ?auto_17691 ) ) ( not ( = ?auto_17668 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17656 ) ) ( not ( = ?auto_17650 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17656 ) ) ( not ( = ?auto_17651 ?auto_17684 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17684 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17684 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17684 ) ) ( not ( = ?auto_17656 ?auto_17668 ) ) ( not ( = ?auto_17656 ?auto_17677 ) ) ( not ( = ?auto_17656 ?auto_17687 ) ) ( not ( = ?auto_17656 ?auto_17691 ) ) ( not ( = ?auto_17656 ?auto_17671 ) ) ( not ( = ?auto_17693 ?auto_17690 ) ) ( not ( = ?auto_17693 ?auto_17675 ) ) ( not ( = ?auto_17693 ?auto_17681 ) ) ( not ( = ?auto_17693 ?auto_17689 ) ) ( not ( = ?auto_17694 ?auto_17676 ) ) ( not ( = ?auto_17694 ?auto_17682 ) ) ( not ( = ?auto_17694 ?auto_17692 ) ) ( not ( = ?auto_17694 ?auto_17680 ) ) ( not ( = ?auto_17684 ?auto_17668 ) ) ( not ( = ?auto_17684 ?auto_17677 ) ) ( not ( = ?auto_17684 ?auto_17687 ) ) ( not ( = ?auto_17684 ?auto_17691 ) ) ( not ( = ?auto_17684 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17657 ) ) ( not ( = ?auto_17650 ?auto_17678 ) ) ( not ( = ?auto_17651 ?auto_17657 ) ) ( not ( = ?auto_17651 ?auto_17678 ) ) ( not ( = ?auto_17652 ?auto_17657 ) ) ( not ( = ?auto_17652 ?auto_17678 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17653 ?auto_17678 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17678 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17678 ) ) ( not ( = ?auto_17657 ?auto_17684 ) ) ( not ( = ?auto_17657 ?auto_17668 ) ) ( not ( = ?auto_17657 ?auto_17677 ) ) ( not ( = ?auto_17657 ?auto_17687 ) ) ( not ( = ?auto_17657 ?auto_17691 ) ) ( not ( = ?auto_17657 ?auto_17671 ) ) ( not ( = ?auto_17672 ?auto_17693 ) ) ( not ( = ?auto_17672 ?auto_17690 ) ) ( not ( = ?auto_17672 ?auto_17675 ) ) ( not ( = ?auto_17672 ?auto_17681 ) ) ( not ( = ?auto_17672 ?auto_17689 ) ) ( not ( = ?auto_17683 ?auto_17694 ) ) ( not ( = ?auto_17683 ?auto_17676 ) ) ( not ( = ?auto_17683 ?auto_17682 ) ) ( not ( = ?auto_17683 ?auto_17692 ) ) ( not ( = ?auto_17683 ?auto_17680 ) ) ( not ( = ?auto_17678 ?auto_17684 ) ) ( not ( = ?auto_17678 ?auto_17668 ) ) ( not ( = ?auto_17678 ?auto_17677 ) ) ( not ( = ?auto_17678 ?auto_17687 ) ) ( not ( = ?auto_17678 ?auto_17691 ) ) ( not ( = ?auto_17678 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17658 ) ) ( not ( = ?auto_17650 ?auto_17674 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17651 ?auto_17674 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17674 ) ) ( not ( = ?auto_17653 ?auto_17658 ) ) ( not ( = ?auto_17653 ?auto_17674 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17674 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17674 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17678 ) ) ( not ( = ?auto_17658 ?auto_17684 ) ) ( not ( = ?auto_17658 ?auto_17668 ) ) ( not ( = ?auto_17658 ?auto_17677 ) ) ( not ( = ?auto_17658 ?auto_17687 ) ) ( not ( = ?auto_17658 ?auto_17691 ) ) ( not ( = ?auto_17658 ?auto_17671 ) ) ( not ( = ?auto_17688 ?auto_17672 ) ) ( not ( = ?auto_17688 ?auto_17693 ) ) ( not ( = ?auto_17688 ?auto_17690 ) ) ( not ( = ?auto_17688 ?auto_17675 ) ) ( not ( = ?auto_17688 ?auto_17681 ) ) ( not ( = ?auto_17688 ?auto_17689 ) ) ( not ( = ?auto_17679 ?auto_17683 ) ) ( not ( = ?auto_17679 ?auto_17694 ) ) ( not ( = ?auto_17679 ?auto_17676 ) ) ( not ( = ?auto_17679 ?auto_17682 ) ) ( not ( = ?auto_17679 ?auto_17692 ) ) ( not ( = ?auto_17679 ?auto_17680 ) ) ( not ( = ?auto_17674 ?auto_17678 ) ) ( not ( = ?auto_17674 ?auto_17684 ) ) ( not ( = ?auto_17674 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17677 ) ) ( not ( = ?auto_17674 ?auto_17687 ) ) ( not ( = ?auto_17674 ?auto_17691 ) ) ( not ( = ?auto_17674 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17659 ) ) ( not ( = ?auto_17650 ?auto_17673 ) ) ( not ( = ?auto_17651 ?auto_17659 ) ) ( not ( = ?auto_17651 ?auto_17673 ) ) ( not ( = ?auto_17652 ?auto_17659 ) ) ( not ( = ?auto_17652 ?auto_17673 ) ) ( not ( = ?auto_17653 ?auto_17659 ) ) ( not ( = ?auto_17653 ?auto_17673 ) ) ( not ( = ?auto_17654 ?auto_17659 ) ) ( not ( = ?auto_17654 ?auto_17673 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( not ( = ?auto_17655 ?auto_17673 ) ) ( not ( = ?auto_17656 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17673 ) ) ( not ( = ?auto_17657 ?auto_17659 ) ) ( not ( = ?auto_17657 ?auto_17673 ) ) ( not ( = ?auto_17659 ?auto_17674 ) ) ( not ( = ?auto_17659 ?auto_17678 ) ) ( not ( = ?auto_17659 ?auto_17684 ) ) ( not ( = ?auto_17659 ?auto_17668 ) ) ( not ( = ?auto_17659 ?auto_17677 ) ) ( not ( = ?auto_17659 ?auto_17687 ) ) ( not ( = ?auto_17659 ?auto_17691 ) ) ( not ( = ?auto_17659 ?auto_17671 ) ) ( not ( = ?auto_17686 ?auto_17688 ) ) ( not ( = ?auto_17686 ?auto_17672 ) ) ( not ( = ?auto_17686 ?auto_17693 ) ) ( not ( = ?auto_17686 ?auto_17690 ) ) ( not ( = ?auto_17686 ?auto_17675 ) ) ( not ( = ?auto_17686 ?auto_17681 ) ) ( not ( = ?auto_17686 ?auto_17689 ) ) ( not ( = ?auto_17685 ?auto_17679 ) ) ( not ( = ?auto_17685 ?auto_17683 ) ) ( not ( = ?auto_17685 ?auto_17694 ) ) ( not ( = ?auto_17685 ?auto_17676 ) ) ( not ( = ?auto_17685 ?auto_17682 ) ) ( not ( = ?auto_17685 ?auto_17692 ) ) ( not ( = ?auto_17685 ?auto_17680 ) ) ( not ( = ?auto_17673 ?auto_17674 ) ) ( not ( = ?auto_17673 ?auto_17678 ) ) ( not ( = ?auto_17673 ?auto_17684 ) ) ( not ( = ?auto_17673 ?auto_17668 ) ) ( not ( = ?auto_17673 ?auto_17677 ) ) ( not ( = ?auto_17673 ?auto_17687 ) ) ( not ( = ?auto_17673 ?auto_17691 ) ) ( not ( = ?auto_17673 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17660 ) ) ( not ( = ?auto_17650 ?auto_17670 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17651 ?auto_17670 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17652 ?auto_17670 ) ) ( not ( = ?auto_17653 ?auto_17660 ) ) ( not ( = ?auto_17653 ?auto_17670 ) ) ( not ( = ?auto_17654 ?auto_17660 ) ) ( not ( = ?auto_17654 ?auto_17670 ) ) ( not ( = ?auto_17655 ?auto_17660 ) ) ( not ( = ?auto_17655 ?auto_17670 ) ) ( not ( = ?auto_17656 ?auto_17660 ) ) ( not ( = ?auto_17656 ?auto_17670 ) ) ( not ( = ?auto_17657 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17670 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17670 ) ) ( not ( = ?auto_17660 ?auto_17673 ) ) ( not ( = ?auto_17660 ?auto_17674 ) ) ( not ( = ?auto_17660 ?auto_17678 ) ) ( not ( = ?auto_17660 ?auto_17684 ) ) ( not ( = ?auto_17660 ?auto_17668 ) ) ( not ( = ?auto_17660 ?auto_17677 ) ) ( not ( = ?auto_17660 ?auto_17687 ) ) ( not ( = ?auto_17660 ?auto_17691 ) ) ( not ( = ?auto_17660 ?auto_17671 ) ) ( not ( = ?auto_17695 ?auto_17686 ) ) ( not ( = ?auto_17695 ?auto_17688 ) ) ( not ( = ?auto_17695 ?auto_17672 ) ) ( not ( = ?auto_17695 ?auto_17693 ) ) ( not ( = ?auto_17695 ?auto_17690 ) ) ( not ( = ?auto_17695 ?auto_17675 ) ) ( not ( = ?auto_17695 ?auto_17681 ) ) ( not ( = ?auto_17695 ?auto_17689 ) ) ( not ( = ?auto_17669 ?auto_17685 ) ) ( not ( = ?auto_17669 ?auto_17679 ) ) ( not ( = ?auto_17669 ?auto_17683 ) ) ( not ( = ?auto_17669 ?auto_17694 ) ) ( not ( = ?auto_17669 ?auto_17676 ) ) ( not ( = ?auto_17669 ?auto_17682 ) ) ( not ( = ?auto_17669 ?auto_17692 ) ) ( not ( = ?auto_17669 ?auto_17680 ) ) ( not ( = ?auto_17670 ?auto_17673 ) ) ( not ( = ?auto_17670 ?auto_17674 ) ) ( not ( = ?auto_17670 ?auto_17678 ) ) ( not ( = ?auto_17670 ?auto_17684 ) ) ( not ( = ?auto_17670 ?auto_17668 ) ) ( not ( = ?auto_17670 ?auto_17677 ) ) ( not ( = ?auto_17670 ?auto_17687 ) ) ( not ( = ?auto_17670 ?auto_17691 ) ) ( not ( = ?auto_17670 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17661 ) ) ( not ( = ?auto_17650 ?auto_17662 ) ) ( not ( = ?auto_17651 ?auto_17661 ) ) ( not ( = ?auto_17651 ?auto_17662 ) ) ( not ( = ?auto_17652 ?auto_17661 ) ) ( not ( = ?auto_17652 ?auto_17662 ) ) ( not ( = ?auto_17653 ?auto_17661 ) ) ( not ( = ?auto_17653 ?auto_17662 ) ) ( not ( = ?auto_17654 ?auto_17661 ) ) ( not ( = ?auto_17654 ?auto_17662 ) ) ( not ( = ?auto_17655 ?auto_17661 ) ) ( not ( = ?auto_17655 ?auto_17662 ) ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17656 ?auto_17662 ) ) ( not ( = ?auto_17657 ?auto_17661 ) ) ( not ( = ?auto_17657 ?auto_17662 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17661 ?auto_17670 ) ) ( not ( = ?auto_17661 ?auto_17673 ) ) ( not ( = ?auto_17661 ?auto_17674 ) ) ( not ( = ?auto_17661 ?auto_17678 ) ) ( not ( = ?auto_17661 ?auto_17684 ) ) ( not ( = ?auto_17661 ?auto_17668 ) ) ( not ( = ?auto_17661 ?auto_17677 ) ) ( not ( = ?auto_17661 ?auto_17687 ) ) ( not ( = ?auto_17661 ?auto_17691 ) ) ( not ( = ?auto_17661 ?auto_17671 ) ) ( not ( = ?auto_17664 ?auto_17695 ) ) ( not ( = ?auto_17664 ?auto_17686 ) ) ( not ( = ?auto_17664 ?auto_17688 ) ) ( not ( = ?auto_17664 ?auto_17672 ) ) ( not ( = ?auto_17664 ?auto_17693 ) ) ( not ( = ?auto_17664 ?auto_17690 ) ) ( not ( = ?auto_17664 ?auto_17675 ) ) ( not ( = ?auto_17664 ?auto_17681 ) ) ( not ( = ?auto_17664 ?auto_17689 ) ) ( not ( = ?auto_17667 ?auto_17669 ) ) ( not ( = ?auto_17667 ?auto_17685 ) ) ( not ( = ?auto_17667 ?auto_17679 ) ) ( not ( = ?auto_17667 ?auto_17683 ) ) ( not ( = ?auto_17667 ?auto_17694 ) ) ( not ( = ?auto_17667 ?auto_17676 ) ) ( not ( = ?auto_17667 ?auto_17682 ) ) ( not ( = ?auto_17667 ?auto_17692 ) ) ( not ( = ?auto_17667 ?auto_17680 ) ) ( not ( = ?auto_17662 ?auto_17670 ) ) ( not ( = ?auto_17662 ?auto_17673 ) ) ( not ( = ?auto_17662 ?auto_17674 ) ) ( not ( = ?auto_17662 ?auto_17678 ) ) ( not ( = ?auto_17662 ?auto_17684 ) ) ( not ( = ?auto_17662 ?auto_17668 ) ) ( not ( = ?auto_17662 ?auto_17677 ) ) ( not ( = ?auto_17662 ?auto_17687 ) ) ( not ( = ?auto_17662 ?auto_17691 ) ) ( not ( = ?auto_17662 ?auto_17671 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17650 ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17657 ?auto_17658 ?auto_17659 ?auto_17660 )
      ( MAKE-1CRATE ?auto_17660 ?auto_17661 )
      ( MAKE-11CRATE-VERIFY ?auto_17650 ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17657 ?auto_17658 ?auto_17659 ?auto_17660 ?auto_17661 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17719 - SURFACE
      ?auto_17720 - SURFACE
      ?auto_17721 - SURFACE
      ?auto_17722 - SURFACE
      ?auto_17723 - SURFACE
      ?auto_17724 - SURFACE
      ?auto_17725 - SURFACE
      ?auto_17726 - SURFACE
      ?auto_17727 - SURFACE
      ?auto_17728 - SURFACE
      ?auto_17729 - SURFACE
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
    )
    :vars
    (
      ?auto_17735 - HOIST
      ?auto_17733 - PLACE
      ?auto_17732 - PLACE
      ?auto_17737 - HOIST
      ?auto_17734 - SURFACE
      ?auto_17758 - PLACE
      ?auto_17747 - HOIST
      ?auto_17754 - SURFACE
      ?auto_17767 - PLACE
      ?auto_17763 - HOIST
      ?auto_17740 - SURFACE
      ?auto_17749 - PLACE
      ?auto_17743 - HOIST
      ?auto_17766 - SURFACE
      ?auto_17761 - PLACE
      ?auto_17753 - HOIST
      ?auto_17744 - SURFACE
      ?auto_17739 - PLACE
      ?auto_17768 - HOIST
      ?auto_17762 - SURFACE
      ?auto_17745 - PLACE
      ?auto_17751 - HOIST
      ?auto_17759 - SURFACE
      ?auto_17738 - PLACE
      ?auto_17752 - HOIST
      ?auto_17765 - SURFACE
      ?auto_17748 - PLACE
      ?auto_17764 - HOIST
      ?auto_17760 - SURFACE
      ?auto_17757 - PLACE
      ?auto_17742 - HOIST
      ?auto_17755 - SURFACE
      ?auto_17741 - SURFACE
      ?auto_17756 - PLACE
      ?auto_17746 - HOIST
      ?auto_17750 - SURFACE
      ?auto_17736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17735 ?auto_17733 ) ( IS-CRATE ?auto_17731 ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( HOIST-AT ?auto_17737 ?auto_17732 ) ( AVAILABLE ?auto_17737 ) ( SURFACE-AT ?auto_17731 ?auto_17732 ) ( ON ?auto_17731 ?auto_17734 ) ( CLEAR ?auto_17731 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17734 ) ) ( not ( = ?auto_17731 ?auto_17734 ) ) ( not ( = ?auto_17735 ?auto_17737 ) ) ( IS-CRATE ?auto_17730 ) ( not ( = ?auto_17758 ?auto_17733 ) ) ( HOIST-AT ?auto_17747 ?auto_17758 ) ( AVAILABLE ?auto_17747 ) ( SURFACE-AT ?auto_17730 ?auto_17758 ) ( ON ?auto_17730 ?auto_17754 ) ( CLEAR ?auto_17730 ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17754 ) ) ( not ( = ?auto_17730 ?auto_17754 ) ) ( not ( = ?auto_17735 ?auto_17747 ) ) ( IS-CRATE ?auto_17729 ) ( not ( = ?auto_17767 ?auto_17733 ) ) ( HOIST-AT ?auto_17763 ?auto_17767 ) ( AVAILABLE ?auto_17763 ) ( SURFACE-AT ?auto_17729 ?auto_17767 ) ( ON ?auto_17729 ?auto_17740 ) ( CLEAR ?auto_17729 ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17735 ?auto_17763 ) ) ( IS-CRATE ?auto_17728 ) ( not ( = ?auto_17749 ?auto_17733 ) ) ( HOIST-AT ?auto_17743 ?auto_17749 ) ( AVAILABLE ?auto_17743 ) ( SURFACE-AT ?auto_17728 ?auto_17749 ) ( ON ?auto_17728 ?auto_17766 ) ( CLEAR ?auto_17728 ) ( not ( = ?auto_17727 ?auto_17728 ) ) ( not ( = ?auto_17727 ?auto_17766 ) ) ( not ( = ?auto_17728 ?auto_17766 ) ) ( not ( = ?auto_17735 ?auto_17743 ) ) ( IS-CRATE ?auto_17727 ) ( not ( = ?auto_17761 ?auto_17733 ) ) ( HOIST-AT ?auto_17753 ?auto_17761 ) ( AVAILABLE ?auto_17753 ) ( SURFACE-AT ?auto_17727 ?auto_17761 ) ( ON ?auto_17727 ?auto_17744 ) ( CLEAR ?auto_17727 ) ( not ( = ?auto_17726 ?auto_17727 ) ) ( not ( = ?auto_17726 ?auto_17744 ) ) ( not ( = ?auto_17727 ?auto_17744 ) ) ( not ( = ?auto_17735 ?auto_17753 ) ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17739 ?auto_17733 ) ) ( HOIST-AT ?auto_17768 ?auto_17739 ) ( AVAILABLE ?auto_17768 ) ( SURFACE-AT ?auto_17726 ?auto_17739 ) ( ON ?auto_17726 ?auto_17762 ) ( CLEAR ?auto_17726 ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17762 ) ) ( not ( = ?auto_17726 ?auto_17762 ) ) ( not ( = ?auto_17735 ?auto_17768 ) ) ( IS-CRATE ?auto_17725 ) ( not ( = ?auto_17745 ?auto_17733 ) ) ( HOIST-AT ?auto_17751 ?auto_17745 ) ( AVAILABLE ?auto_17751 ) ( SURFACE-AT ?auto_17725 ?auto_17745 ) ( ON ?auto_17725 ?auto_17759 ) ( CLEAR ?auto_17725 ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17759 ) ) ( not ( = ?auto_17725 ?auto_17759 ) ) ( not ( = ?auto_17735 ?auto_17751 ) ) ( IS-CRATE ?auto_17724 ) ( not ( = ?auto_17738 ?auto_17733 ) ) ( HOIST-AT ?auto_17752 ?auto_17738 ) ( SURFACE-AT ?auto_17724 ?auto_17738 ) ( ON ?auto_17724 ?auto_17765 ) ( CLEAR ?auto_17724 ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17723 ?auto_17765 ) ) ( not ( = ?auto_17724 ?auto_17765 ) ) ( not ( = ?auto_17735 ?auto_17752 ) ) ( IS-CRATE ?auto_17723 ) ( not ( = ?auto_17748 ?auto_17733 ) ) ( HOIST-AT ?auto_17764 ?auto_17748 ) ( AVAILABLE ?auto_17764 ) ( SURFACE-AT ?auto_17723 ?auto_17748 ) ( ON ?auto_17723 ?auto_17760 ) ( CLEAR ?auto_17723 ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( not ( = ?auto_17722 ?auto_17760 ) ) ( not ( = ?auto_17723 ?auto_17760 ) ) ( not ( = ?auto_17735 ?auto_17764 ) ) ( IS-CRATE ?auto_17722 ) ( not ( = ?auto_17757 ?auto_17733 ) ) ( HOIST-AT ?auto_17742 ?auto_17757 ) ( AVAILABLE ?auto_17742 ) ( SURFACE-AT ?auto_17722 ?auto_17757 ) ( ON ?auto_17722 ?auto_17755 ) ( CLEAR ?auto_17722 ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17755 ) ) ( not ( = ?auto_17722 ?auto_17755 ) ) ( not ( = ?auto_17735 ?auto_17742 ) ) ( IS-CRATE ?auto_17721 ) ( AVAILABLE ?auto_17752 ) ( SURFACE-AT ?auto_17721 ?auto_17738 ) ( ON ?auto_17721 ?auto_17741 ) ( CLEAR ?auto_17721 ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17741 ) ) ( not ( = ?auto_17721 ?auto_17741 ) ) ( SURFACE-AT ?auto_17719 ?auto_17733 ) ( CLEAR ?auto_17719 ) ( IS-CRATE ?auto_17720 ) ( AVAILABLE ?auto_17735 ) ( not ( = ?auto_17756 ?auto_17733 ) ) ( HOIST-AT ?auto_17746 ?auto_17756 ) ( AVAILABLE ?auto_17746 ) ( SURFACE-AT ?auto_17720 ?auto_17756 ) ( ON ?auto_17720 ?auto_17750 ) ( CLEAR ?auto_17720 ) ( TRUCK-AT ?auto_17736 ?auto_17733 ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17750 ) ) ( not ( = ?auto_17720 ?auto_17750 ) ) ( not ( = ?auto_17735 ?auto_17746 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17741 ) ) ( not ( = ?auto_17721 ?auto_17750 ) ) ( not ( = ?auto_17738 ?auto_17756 ) ) ( not ( = ?auto_17752 ?auto_17746 ) ) ( not ( = ?auto_17741 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17722 ) ) ( not ( = ?auto_17719 ?auto_17755 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17720 ?auto_17755 ) ) ( not ( = ?auto_17722 ?auto_17741 ) ) ( not ( = ?auto_17722 ?auto_17750 ) ) ( not ( = ?auto_17757 ?auto_17738 ) ) ( not ( = ?auto_17757 ?auto_17756 ) ) ( not ( = ?auto_17742 ?auto_17752 ) ) ( not ( = ?auto_17742 ?auto_17746 ) ) ( not ( = ?auto_17755 ?auto_17741 ) ) ( not ( = ?auto_17755 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17723 ) ) ( not ( = ?auto_17719 ?auto_17760 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( not ( = ?auto_17720 ?auto_17760 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( not ( = ?auto_17721 ?auto_17760 ) ) ( not ( = ?auto_17723 ?auto_17755 ) ) ( not ( = ?auto_17723 ?auto_17741 ) ) ( not ( = ?auto_17723 ?auto_17750 ) ) ( not ( = ?auto_17748 ?auto_17757 ) ) ( not ( = ?auto_17748 ?auto_17738 ) ) ( not ( = ?auto_17748 ?auto_17756 ) ) ( not ( = ?auto_17764 ?auto_17742 ) ) ( not ( = ?auto_17764 ?auto_17752 ) ) ( not ( = ?auto_17764 ?auto_17746 ) ) ( not ( = ?auto_17760 ?auto_17755 ) ) ( not ( = ?auto_17760 ?auto_17741 ) ) ( not ( = ?auto_17760 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17724 ) ) ( not ( = ?auto_17719 ?auto_17765 ) ) ( not ( = ?auto_17720 ?auto_17724 ) ) ( not ( = ?auto_17720 ?auto_17765 ) ) ( not ( = ?auto_17721 ?auto_17724 ) ) ( not ( = ?auto_17721 ?auto_17765 ) ) ( not ( = ?auto_17722 ?auto_17724 ) ) ( not ( = ?auto_17722 ?auto_17765 ) ) ( not ( = ?auto_17724 ?auto_17760 ) ) ( not ( = ?auto_17724 ?auto_17755 ) ) ( not ( = ?auto_17724 ?auto_17741 ) ) ( not ( = ?auto_17724 ?auto_17750 ) ) ( not ( = ?auto_17765 ?auto_17760 ) ) ( not ( = ?auto_17765 ?auto_17755 ) ) ( not ( = ?auto_17765 ?auto_17741 ) ) ( not ( = ?auto_17765 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17725 ) ) ( not ( = ?auto_17719 ?auto_17759 ) ) ( not ( = ?auto_17720 ?auto_17725 ) ) ( not ( = ?auto_17720 ?auto_17759 ) ) ( not ( = ?auto_17721 ?auto_17725 ) ) ( not ( = ?auto_17721 ?auto_17759 ) ) ( not ( = ?auto_17722 ?auto_17725 ) ) ( not ( = ?auto_17722 ?auto_17759 ) ) ( not ( = ?auto_17723 ?auto_17725 ) ) ( not ( = ?auto_17723 ?auto_17759 ) ) ( not ( = ?auto_17725 ?auto_17765 ) ) ( not ( = ?auto_17725 ?auto_17760 ) ) ( not ( = ?auto_17725 ?auto_17755 ) ) ( not ( = ?auto_17725 ?auto_17741 ) ) ( not ( = ?auto_17725 ?auto_17750 ) ) ( not ( = ?auto_17745 ?auto_17738 ) ) ( not ( = ?auto_17745 ?auto_17748 ) ) ( not ( = ?auto_17745 ?auto_17757 ) ) ( not ( = ?auto_17745 ?auto_17756 ) ) ( not ( = ?auto_17751 ?auto_17752 ) ) ( not ( = ?auto_17751 ?auto_17764 ) ) ( not ( = ?auto_17751 ?auto_17742 ) ) ( not ( = ?auto_17751 ?auto_17746 ) ) ( not ( = ?auto_17759 ?auto_17765 ) ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17755 ) ) ( not ( = ?auto_17759 ?auto_17741 ) ) ( not ( = ?auto_17759 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17726 ) ) ( not ( = ?auto_17719 ?auto_17762 ) ) ( not ( = ?auto_17720 ?auto_17726 ) ) ( not ( = ?auto_17720 ?auto_17762 ) ) ( not ( = ?auto_17721 ?auto_17726 ) ) ( not ( = ?auto_17721 ?auto_17762 ) ) ( not ( = ?auto_17722 ?auto_17726 ) ) ( not ( = ?auto_17722 ?auto_17762 ) ) ( not ( = ?auto_17723 ?auto_17726 ) ) ( not ( = ?auto_17723 ?auto_17762 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17762 ) ) ( not ( = ?auto_17726 ?auto_17759 ) ) ( not ( = ?auto_17726 ?auto_17765 ) ) ( not ( = ?auto_17726 ?auto_17760 ) ) ( not ( = ?auto_17726 ?auto_17755 ) ) ( not ( = ?auto_17726 ?auto_17741 ) ) ( not ( = ?auto_17726 ?auto_17750 ) ) ( not ( = ?auto_17739 ?auto_17745 ) ) ( not ( = ?auto_17739 ?auto_17738 ) ) ( not ( = ?auto_17739 ?auto_17748 ) ) ( not ( = ?auto_17739 ?auto_17757 ) ) ( not ( = ?auto_17739 ?auto_17756 ) ) ( not ( = ?auto_17768 ?auto_17751 ) ) ( not ( = ?auto_17768 ?auto_17752 ) ) ( not ( = ?auto_17768 ?auto_17764 ) ) ( not ( = ?auto_17768 ?auto_17742 ) ) ( not ( = ?auto_17768 ?auto_17746 ) ) ( not ( = ?auto_17762 ?auto_17759 ) ) ( not ( = ?auto_17762 ?auto_17765 ) ) ( not ( = ?auto_17762 ?auto_17760 ) ) ( not ( = ?auto_17762 ?auto_17755 ) ) ( not ( = ?auto_17762 ?auto_17741 ) ) ( not ( = ?auto_17762 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17727 ) ) ( not ( = ?auto_17719 ?auto_17744 ) ) ( not ( = ?auto_17720 ?auto_17727 ) ) ( not ( = ?auto_17720 ?auto_17744 ) ) ( not ( = ?auto_17721 ?auto_17727 ) ) ( not ( = ?auto_17721 ?auto_17744 ) ) ( not ( = ?auto_17722 ?auto_17727 ) ) ( not ( = ?auto_17722 ?auto_17744 ) ) ( not ( = ?auto_17723 ?auto_17727 ) ) ( not ( = ?auto_17723 ?auto_17744 ) ) ( not ( = ?auto_17724 ?auto_17727 ) ) ( not ( = ?auto_17724 ?auto_17744 ) ) ( not ( = ?auto_17725 ?auto_17727 ) ) ( not ( = ?auto_17725 ?auto_17744 ) ) ( not ( = ?auto_17727 ?auto_17762 ) ) ( not ( = ?auto_17727 ?auto_17759 ) ) ( not ( = ?auto_17727 ?auto_17765 ) ) ( not ( = ?auto_17727 ?auto_17760 ) ) ( not ( = ?auto_17727 ?auto_17755 ) ) ( not ( = ?auto_17727 ?auto_17741 ) ) ( not ( = ?auto_17727 ?auto_17750 ) ) ( not ( = ?auto_17761 ?auto_17739 ) ) ( not ( = ?auto_17761 ?auto_17745 ) ) ( not ( = ?auto_17761 ?auto_17738 ) ) ( not ( = ?auto_17761 ?auto_17748 ) ) ( not ( = ?auto_17761 ?auto_17757 ) ) ( not ( = ?auto_17761 ?auto_17756 ) ) ( not ( = ?auto_17753 ?auto_17768 ) ) ( not ( = ?auto_17753 ?auto_17751 ) ) ( not ( = ?auto_17753 ?auto_17752 ) ) ( not ( = ?auto_17753 ?auto_17764 ) ) ( not ( = ?auto_17753 ?auto_17742 ) ) ( not ( = ?auto_17753 ?auto_17746 ) ) ( not ( = ?auto_17744 ?auto_17762 ) ) ( not ( = ?auto_17744 ?auto_17759 ) ) ( not ( = ?auto_17744 ?auto_17765 ) ) ( not ( = ?auto_17744 ?auto_17760 ) ) ( not ( = ?auto_17744 ?auto_17755 ) ) ( not ( = ?auto_17744 ?auto_17741 ) ) ( not ( = ?auto_17744 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17728 ) ) ( not ( = ?auto_17719 ?auto_17766 ) ) ( not ( = ?auto_17720 ?auto_17728 ) ) ( not ( = ?auto_17720 ?auto_17766 ) ) ( not ( = ?auto_17721 ?auto_17728 ) ) ( not ( = ?auto_17721 ?auto_17766 ) ) ( not ( = ?auto_17722 ?auto_17728 ) ) ( not ( = ?auto_17722 ?auto_17766 ) ) ( not ( = ?auto_17723 ?auto_17728 ) ) ( not ( = ?auto_17723 ?auto_17766 ) ) ( not ( = ?auto_17724 ?auto_17728 ) ) ( not ( = ?auto_17724 ?auto_17766 ) ) ( not ( = ?auto_17725 ?auto_17728 ) ) ( not ( = ?auto_17725 ?auto_17766 ) ) ( not ( = ?auto_17726 ?auto_17728 ) ) ( not ( = ?auto_17726 ?auto_17766 ) ) ( not ( = ?auto_17728 ?auto_17744 ) ) ( not ( = ?auto_17728 ?auto_17762 ) ) ( not ( = ?auto_17728 ?auto_17759 ) ) ( not ( = ?auto_17728 ?auto_17765 ) ) ( not ( = ?auto_17728 ?auto_17760 ) ) ( not ( = ?auto_17728 ?auto_17755 ) ) ( not ( = ?auto_17728 ?auto_17741 ) ) ( not ( = ?auto_17728 ?auto_17750 ) ) ( not ( = ?auto_17749 ?auto_17761 ) ) ( not ( = ?auto_17749 ?auto_17739 ) ) ( not ( = ?auto_17749 ?auto_17745 ) ) ( not ( = ?auto_17749 ?auto_17738 ) ) ( not ( = ?auto_17749 ?auto_17748 ) ) ( not ( = ?auto_17749 ?auto_17757 ) ) ( not ( = ?auto_17749 ?auto_17756 ) ) ( not ( = ?auto_17743 ?auto_17753 ) ) ( not ( = ?auto_17743 ?auto_17768 ) ) ( not ( = ?auto_17743 ?auto_17751 ) ) ( not ( = ?auto_17743 ?auto_17752 ) ) ( not ( = ?auto_17743 ?auto_17764 ) ) ( not ( = ?auto_17743 ?auto_17742 ) ) ( not ( = ?auto_17743 ?auto_17746 ) ) ( not ( = ?auto_17766 ?auto_17744 ) ) ( not ( = ?auto_17766 ?auto_17762 ) ) ( not ( = ?auto_17766 ?auto_17759 ) ) ( not ( = ?auto_17766 ?auto_17765 ) ) ( not ( = ?auto_17766 ?auto_17760 ) ) ( not ( = ?auto_17766 ?auto_17755 ) ) ( not ( = ?auto_17766 ?auto_17741 ) ) ( not ( = ?auto_17766 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17729 ) ) ( not ( = ?auto_17719 ?auto_17740 ) ) ( not ( = ?auto_17720 ?auto_17729 ) ) ( not ( = ?auto_17720 ?auto_17740 ) ) ( not ( = ?auto_17721 ?auto_17729 ) ) ( not ( = ?auto_17721 ?auto_17740 ) ) ( not ( = ?auto_17722 ?auto_17729 ) ) ( not ( = ?auto_17722 ?auto_17740 ) ) ( not ( = ?auto_17723 ?auto_17729 ) ) ( not ( = ?auto_17723 ?auto_17740 ) ) ( not ( = ?auto_17724 ?auto_17729 ) ) ( not ( = ?auto_17724 ?auto_17740 ) ) ( not ( = ?auto_17725 ?auto_17729 ) ) ( not ( = ?auto_17725 ?auto_17740 ) ) ( not ( = ?auto_17726 ?auto_17729 ) ) ( not ( = ?auto_17726 ?auto_17740 ) ) ( not ( = ?auto_17727 ?auto_17729 ) ) ( not ( = ?auto_17727 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17766 ) ) ( not ( = ?auto_17729 ?auto_17744 ) ) ( not ( = ?auto_17729 ?auto_17762 ) ) ( not ( = ?auto_17729 ?auto_17759 ) ) ( not ( = ?auto_17729 ?auto_17765 ) ) ( not ( = ?auto_17729 ?auto_17760 ) ) ( not ( = ?auto_17729 ?auto_17755 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17750 ) ) ( not ( = ?auto_17767 ?auto_17749 ) ) ( not ( = ?auto_17767 ?auto_17761 ) ) ( not ( = ?auto_17767 ?auto_17739 ) ) ( not ( = ?auto_17767 ?auto_17745 ) ) ( not ( = ?auto_17767 ?auto_17738 ) ) ( not ( = ?auto_17767 ?auto_17748 ) ) ( not ( = ?auto_17767 ?auto_17757 ) ) ( not ( = ?auto_17767 ?auto_17756 ) ) ( not ( = ?auto_17763 ?auto_17743 ) ) ( not ( = ?auto_17763 ?auto_17753 ) ) ( not ( = ?auto_17763 ?auto_17768 ) ) ( not ( = ?auto_17763 ?auto_17751 ) ) ( not ( = ?auto_17763 ?auto_17752 ) ) ( not ( = ?auto_17763 ?auto_17764 ) ) ( not ( = ?auto_17763 ?auto_17742 ) ) ( not ( = ?auto_17763 ?auto_17746 ) ) ( not ( = ?auto_17740 ?auto_17766 ) ) ( not ( = ?auto_17740 ?auto_17744 ) ) ( not ( = ?auto_17740 ?auto_17762 ) ) ( not ( = ?auto_17740 ?auto_17759 ) ) ( not ( = ?auto_17740 ?auto_17765 ) ) ( not ( = ?auto_17740 ?auto_17760 ) ) ( not ( = ?auto_17740 ?auto_17755 ) ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17730 ) ) ( not ( = ?auto_17719 ?auto_17754 ) ) ( not ( = ?auto_17720 ?auto_17730 ) ) ( not ( = ?auto_17720 ?auto_17754 ) ) ( not ( = ?auto_17721 ?auto_17730 ) ) ( not ( = ?auto_17721 ?auto_17754 ) ) ( not ( = ?auto_17722 ?auto_17730 ) ) ( not ( = ?auto_17722 ?auto_17754 ) ) ( not ( = ?auto_17723 ?auto_17730 ) ) ( not ( = ?auto_17723 ?auto_17754 ) ) ( not ( = ?auto_17724 ?auto_17730 ) ) ( not ( = ?auto_17724 ?auto_17754 ) ) ( not ( = ?auto_17725 ?auto_17730 ) ) ( not ( = ?auto_17725 ?auto_17754 ) ) ( not ( = ?auto_17726 ?auto_17730 ) ) ( not ( = ?auto_17726 ?auto_17754 ) ) ( not ( = ?auto_17727 ?auto_17730 ) ) ( not ( = ?auto_17727 ?auto_17754 ) ) ( not ( = ?auto_17728 ?auto_17730 ) ) ( not ( = ?auto_17728 ?auto_17754 ) ) ( not ( = ?auto_17730 ?auto_17740 ) ) ( not ( = ?auto_17730 ?auto_17766 ) ) ( not ( = ?auto_17730 ?auto_17744 ) ) ( not ( = ?auto_17730 ?auto_17762 ) ) ( not ( = ?auto_17730 ?auto_17759 ) ) ( not ( = ?auto_17730 ?auto_17765 ) ) ( not ( = ?auto_17730 ?auto_17760 ) ) ( not ( = ?auto_17730 ?auto_17755 ) ) ( not ( = ?auto_17730 ?auto_17741 ) ) ( not ( = ?auto_17730 ?auto_17750 ) ) ( not ( = ?auto_17758 ?auto_17767 ) ) ( not ( = ?auto_17758 ?auto_17749 ) ) ( not ( = ?auto_17758 ?auto_17761 ) ) ( not ( = ?auto_17758 ?auto_17739 ) ) ( not ( = ?auto_17758 ?auto_17745 ) ) ( not ( = ?auto_17758 ?auto_17738 ) ) ( not ( = ?auto_17758 ?auto_17748 ) ) ( not ( = ?auto_17758 ?auto_17757 ) ) ( not ( = ?auto_17758 ?auto_17756 ) ) ( not ( = ?auto_17747 ?auto_17763 ) ) ( not ( = ?auto_17747 ?auto_17743 ) ) ( not ( = ?auto_17747 ?auto_17753 ) ) ( not ( = ?auto_17747 ?auto_17768 ) ) ( not ( = ?auto_17747 ?auto_17751 ) ) ( not ( = ?auto_17747 ?auto_17752 ) ) ( not ( = ?auto_17747 ?auto_17764 ) ) ( not ( = ?auto_17747 ?auto_17742 ) ) ( not ( = ?auto_17747 ?auto_17746 ) ) ( not ( = ?auto_17754 ?auto_17740 ) ) ( not ( = ?auto_17754 ?auto_17766 ) ) ( not ( = ?auto_17754 ?auto_17744 ) ) ( not ( = ?auto_17754 ?auto_17762 ) ) ( not ( = ?auto_17754 ?auto_17759 ) ) ( not ( = ?auto_17754 ?auto_17765 ) ) ( not ( = ?auto_17754 ?auto_17760 ) ) ( not ( = ?auto_17754 ?auto_17755 ) ) ( not ( = ?auto_17754 ?auto_17741 ) ) ( not ( = ?auto_17754 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17731 ) ) ( not ( = ?auto_17719 ?auto_17734 ) ) ( not ( = ?auto_17720 ?auto_17731 ) ) ( not ( = ?auto_17720 ?auto_17734 ) ) ( not ( = ?auto_17721 ?auto_17731 ) ) ( not ( = ?auto_17721 ?auto_17734 ) ) ( not ( = ?auto_17722 ?auto_17731 ) ) ( not ( = ?auto_17722 ?auto_17734 ) ) ( not ( = ?auto_17723 ?auto_17731 ) ) ( not ( = ?auto_17723 ?auto_17734 ) ) ( not ( = ?auto_17724 ?auto_17731 ) ) ( not ( = ?auto_17724 ?auto_17734 ) ) ( not ( = ?auto_17725 ?auto_17731 ) ) ( not ( = ?auto_17725 ?auto_17734 ) ) ( not ( = ?auto_17726 ?auto_17731 ) ) ( not ( = ?auto_17726 ?auto_17734 ) ) ( not ( = ?auto_17727 ?auto_17731 ) ) ( not ( = ?auto_17727 ?auto_17734 ) ) ( not ( = ?auto_17728 ?auto_17731 ) ) ( not ( = ?auto_17728 ?auto_17734 ) ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( not ( = ?auto_17729 ?auto_17734 ) ) ( not ( = ?auto_17731 ?auto_17754 ) ) ( not ( = ?auto_17731 ?auto_17740 ) ) ( not ( = ?auto_17731 ?auto_17766 ) ) ( not ( = ?auto_17731 ?auto_17744 ) ) ( not ( = ?auto_17731 ?auto_17762 ) ) ( not ( = ?auto_17731 ?auto_17759 ) ) ( not ( = ?auto_17731 ?auto_17765 ) ) ( not ( = ?auto_17731 ?auto_17760 ) ) ( not ( = ?auto_17731 ?auto_17755 ) ) ( not ( = ?auto_17731 ?auto_17741 ) ) ( not ( = ?auto_17731 ?auto_17750 ) ) ( not ( = ?auto_17732 ?auto_17758 ) ) ( not ( = ?auto_17732 ?auto_17767 ) ) ( not ( = ?auto_17732 ?auto_17749 ) ) ( not ( = ?auto_17732 ?auto_17761 ) ) ( not ( = ?auto_17732 ?auto_17739 ) ) ( not ( = ?auto_17732 ?auto_17745 ) ) ( not ( = ?auto_17732 ?auto_17738 ) ) ( not ( = ?auto_17732 ?auto_17748 ) ) ( not ( = ?auto_17732 ?auto_17757 ) ) ( not ( = ?auto_17732 ?auto_17756 ) ) ( not ( = ?auto_17737 ?auto_17747 ) ) ( not ( = ?auto_17737 ?auto_17763 ) ) ( not ( = ?auto_17737 ?auto_17743 ) ) ( not ( = ?auto_17737 ?auto_17753 ) ) ( not ( = ?auto_17737 ?auto_17768 ) ) ( not ( = ?auto_17737 ?auto_17751 ) ) ( not ( = ?auto_17737 ?auto_17752 ) ) ( not ( = ?auto_17737 ?auto_17764 ) ) ( not ( = ?auto_17737 ?auto_17742 ) ) ( not ( = ?auto_17737 ?auto_17746 ) ) ( not ( = ?auto_17734 ?auto_17754 ) ) ( not ( = ?auto_17734 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17766 ) ) ( not ( = ?auto_17734 ?auto_17744 ) ) ( not ( = ?auto_17734 ?auto_17762 ) ) ( not ( = ?auto_17734 ?auto_17759 ) ) ( not ( = ?auto_17734 ?auto_17765 ) ) ( not ( = ?auto_17734 ?auto_17760 ) ) ( not ( = ?auto_17734 ?auto_17755 ) ) ( not ( = ?auto_17734 ?auto_17741 ) ) ( not ( = ?auto_17734 ?auto_17750 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17726 ?auto_17727 ?auto_17728 ?auto_17729 ?auto_17730 )
      ( MAKE-1CRATE ?auto_17730 ?auto_17731 )
      ( MAKE-12CRATE-VERIFY ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17726 ?auto_17727 ?auto_17728 ?auto_17729 ?auto_17730 ?auto_17731 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17793 - SURFACE
      ?auto_17794 - SURFACE
      ?auto_17795 - SURFACE
      ?auto_17796 - SURFACE
      ?auto_17797 - SURFACE
      ?auto_17798 - SURFACE
      ?auto_17799 - SURFACE
      ?auto_17800 - SURFACE
      ?auto_17801 - SURFACE
      ?auto_17802 - SURFACE
      ?auto_17803 - SURFACE
      ?auto_17804 - SURFACE
      ?auto_17805 - SURFACE
      ?auto_17806 - SURFACE
    )
    :vars
    (
      ?auto_17811 - HOIST
      ?auto_17807 - PLACE
      ?auto_17809 - PLACE
      ?auto_17810 - HOIST
      ?auto_17812 - SURFACE
      ?auto_17837 - PLACE
      ?auto_17832 - HOIST
      ?auto_17813 - SURFACE
      ?auto_17820 - PLACE
      ?auto_17824 - HOIST
      ?auto_17838 - SURFACE
      ?auto_17842 - PLACE
      ?auto_17833 - HOIST
      ?auto_17816 - SURFACE
      ?auto_17821 - PLACE
      ?auto_17815 - HOIST
      ?auto_17840 - SURFACE
      ?auto_17843 - PLACE
      ?auto_17822 - HOIST
      ?auto_17834 - SURFACE
      ?auto_17823 - PLACE
      ?auto_17841 - HOIST
      ?auto_17830 - SURFACE
      ?auto_17819 - PLACE
      ?auto_17836 - HOIST
      ?auto_17825 - SURFACE
      ?auto_17844 - PLACE
      ?auto_17828 - HOIST
      ?auto_17835 - SURFACE
      ?auto_17831 - PLACE
      ?auto_17818 - HOIST
      ?auto_17827 - SURFACE
      ?auto_17829 - PLACE
      ?auto_17839 - HOIST
      ?auto_17826 - SURFACE
      ?auto_17814 - SURFACE
      ?auto_17817 - SURFACE
      ?auto_17808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17811 ?auto_17807 ) ( IS-CRATE ?auto_17806 ) ( not ( = ?auto_17809 ?auto_17807 ) ) ( HOIST-AT ?auto_17810 ?auto_17809 ) ( SURFACE-AT ?auto_17806 ?auto_17809 ) ( ON ?auto_17806 ?auto_17812 ) ( CLEAR ?auto_17806 ) ( not ( = ?auto_17805 ?auto_17806 ) ) ( not ( = ?auto_17805 ?auto_17812 ) ) ( not ( = ?auto_17806 ?auto_17812 ) ) ( not ( = ?auto_17811 ?auto_17810 ) ) ( IS-CRATE ?auto_17805 ) ( not ( = ?auto_17837 ?auto_17807 ) ) ( HOIST-AT ?auto_17832 ?auto_17837 ) ( AVAILABLE ?auto_17832 ) ( SURFACE-AT ?auto_17805 ?auto_17837 ) ( ON ?auto_17805 ?auto_17813 ) ( CLEAR ?auto_17805 ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( not ( = ?auto_17804 ?auto_17813 ) ) ( not ( = ?auto_17805 ?auto_17813 ) ) ( not ( = ?auto_17811 ?auto_17832 ) ) ( IS-CRATE ?auto_17804 ) ( not ( = ?auto_17820 ?auto_17807 ) ) ( HOIST-AT ?auto_17824 ?auto_17820 ) ( AVAILABLE ?auto_17824 ) ( SURFACE-AT ?auto_17804 ?auto_17820 ) ( ON ?auto_17804 ?auto_17838 ) ( CLEAR ?auto_17804 ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( not ( = ?auto_17803 ?auto_17838 ) ) ( not ( = ?auto_17804 ?auto_17838 ) ) ( not ( = ?auto_17811 ?auto_17824 ) ) ( IS-CRATE ?auto_17803 ) ( not ( = ?auto_17842 ?auto_17807 ) ) ( HOIST-AT ?auto_17833 ?auto_17842 ) ( AVAILABLE ?auto_17833 ) ( SURFACE-AT ?auto_17803 ?auto_17842 ) ( ON ?auto_17803 ?auto_17816 ) ( CLEAR ?auto_17803 ) ( not ( = ?auto_17802 ?auto_17803 ) ) ( not ( = ?auto_17802 ?auto_17816 ) ) ( not ( = ?auto_17803 ?auto_17816 ) ) ( not ( = ?auto_17811 ?auto_17833 ) ) ( IS-CRATE ?auto_17802 ) ( not ( = ?auto_17821 ?auto_17807 ) ) ( HOIST-AT ?auto_17815 ?auto_17821 ) ( AVAILABLE ?auto_17815 ) ( SURFACE-AT ?auto_17802 ?auto_17821 ) ( ON ?auto_17802 ?auto_17840 ) ( CLEAR ?auto_17802 ) ( not ( = ?auto_17801 ?auto_17802 ) ) ( not ( = ?auto_17801 ?auto_17840 ) ) ( not ( = ?auto_17802 ?auto_17840 ) ) ( not ( = ?auto_17811 ?auto_17815 ) ) ( IS-CRATE ?auto_17801 ) ( not ( = ?auto_17843 ?auto_17807 ) ) ( HOIST-AT ?auto_17822 ?auto_17843 ) ( AVAILABLE ?auto_17822 ) ( SURFACE-AT ?auto_17801 ?auto_17843 ) ( ON ?auto_17801 ?auto_17834 ) ( CLEAR ?auto_17801 ) ( not ( = ?auto_17800 ?auto_17801 ) ) ( not ( = ?auto_17800 ?auto_17834 ) ) ( not ( = ?auto_17801 ?auto_17834 ) ) ( not ( = ?auto_17811 ?auto_17822 ) ) ( IS-CRATE ?auto_17800 ) ( not ( = ?auto_17823 ?auto_17807 ) ) ( HOIST-AT ?auto_17841 ?auto_17823 ) ( AVAILABLE ?auto_17841 ) ( SURFACE-AT ?auto_17800 ?auto_17823 ) ( ON ?auto_17800 ?auto_17830 ) ( CLEAR ?auto_17800 ) ( not ( = ?auto_17799 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17830 ) ) ( not ( = ?auto_17800 ?auto_17830 ) ) ( not ( = ?auto_17811 ?auto_17841 ) ) ( IS-CRATE ?auto_17799 ) ( not ( = ?auto_17819 ?auto_17807 ) ) ( HOIST-AT ?auto_17836 ?auto_17819 ) ( AVAILABLE ?auto_17836 ) ( SURFACE-AT ?auto_17799 ?auto_17819 ) ( ON ?auto_17799 ?auto_17825 ) ( CLEAR ?auto_17799 ) ( not ( = ?auto_17798 ?auto_17799 ) ) ( not ( = ?auto_17798 ?auto_17825 ) ) ( not ( = ?auto_17799 ?auto_17825 ) ) ( not ( = ?auto_17811 ?auto_17836 ) ) ( IS-CRATE ?auto_17798 ) ( not ( = ?auto_17844 ?auto_17807 ) ) ( HOIST-AT ?auto_17828 ?auto_17844 ) ( SURFACE-AT ?auto_17798 ?auto_17844 ) ( ON ?auto_17798 ?auto_17835 ) ( CLEAR ?auto_17798 ) ( not ( = ?auto_17797 ?auto_17798 ) ) ( not ( = ?auto_17797 ?auto_17835 ) ) ( not ( = ?auto_17798 ?auto_17835 ) ) ( not ( = ?auto_17811 ?auto_17828 ) ) ( IS-CRATE ?auto_17797 ) ( not ( = ?auto_17831 ?auto_17807 ) ) ( HOIST-AT ?auto_17818 ?auto_17831 ) ( AVAILABLE ?auto_17818 ) ( SURFACE-AT ?auto_17797 ?auto_17831 ) ( ON ?auto_17797 ?auto_17827 ) ( CLEAR ?auto_17797 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17827 ) ) ( not ( = ?auto_17797 ?auto_17827 ) ) ( not ( = ?auto_17811 ?auto_17818 ) ) ( IS-CRATE ?auto_17796 ) ( not ( = ?auto_17829 ?auto_17807 ) ) ( HOIST-AT ?auto_17839 ?auto_17829 ) ( AVAILABLE ?auto_17839 ) ( SURFACE-AT ?auto_17796 ?auto_17829 ) ( ON ?auto_17796 ?auto_17826 ) ( CLEAR ?auto_17796 ) ( not ( = ?auto_17795 ?auto_17796 ) ) ( not ( = ?auto_17795 ?auto_17826 ) ) ( not ( = ?auto_17796 ?auto_17826 ) ) ( not ( = ?auto_17811 ?auto_17839 ) ) ( IS-CRATE ?auto_17795 ) ( AVAILABLE ?auto_17828 ) ( SURFACE-AT ?auto_17795 ?auto_17844 ) ( ON ?auto_17795 ?auto_17814 ) ( CLEAR ?auto_17795 ) ( not ( = ?auto_17794 ?auto_17795 ) ) ( not ( = ?auto_17794 ?auto_17814 ) ) ( not ( = ?auto_17795 ?auto_17814 ) ) ( SURFACE-AT ?auto_17793 ?auto_17807 ) ( CLEAR ?auto_17793 ) ( IS-CRATE ?auto_17794 ) ( AVAILABLE ?auto_17811 ) ( AVAILABLE ?auto_17810 ) ( SURFACE-AT ?auto_17794 ?auto_17809 ) ( ON ?auto_17794 ?auto_17817 ) ( CLEAR ?auto_17794 ) ( TRUCK-AT ?auto_17808 ?auto_17807 ) ( not ( = ?auto_17793 ?auto_17794 ) ) ( not ( = ?auto_17793 ?auto_17817 ) ) ( not ( = ?auto_17794 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17795 ) ) ( not ( = ?auto_17793 ?auto_17814 ) ) ( not ( = ?auto_17795 ?auto_17817 ) ) ( not ( = ?auto_17844 ?auto_17809 ) ) ( not ( = ?auto_17828 ?auto_17810 ) ) ( not ( = ?auto_17814 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17796 ) ) ( not ( = ?auto_17793 ?auto_17826 ) ) ( not ( = ?auto_17794 ?auto_17796 ) ) ( not ( = ?auto_17794 ?auto_17826 ) ) ( not ( = ?auto_17796 ?auto_17814 ) ) ( not ( = ?auto_17796 ?auto_17817 ) ) ( not ( = ?auto_17829 ?auto_17844 ) ) ( not ( = ?auto_17829 ?auto_17809 ) ) ( not ( = ?auto_17839 ?auto_17828 ) ) ( not ( = ?auto_17839 ?auto_17810 ) ) ( not ( = ?auto_17826 ?auto_17814 ) ) ( not ( = ?auto_17826 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17797 ) ) ( not ( = ?auto_17793 ?auto_17827 ) ) ( not ( = ?auto_17794 ?auto_17797 ) ) ( not ( = ?auto_17794 ?auto_17827 ) ) ( not ( = ?auto_17795 ?auto_17797 ) ) ( not ( = ?auto_17795 ?auto_17827 ) ) ( not ( = ?auto_17797 ?auto_17826 ) ) ( not ( = ?auto_17797 ?auto_17814 ) ) ( not ( = ?auto_17797 ?auto_17817 ) ) ( not ( = ?auto_17831 ?auto_17829 ) ) ( not ( = ?auto_17831 ?auto_17844 ) ) ( not ( = ?auto_17831 ?auto_17809 ) ) ( not ( = ?auto_17818 ?auto_17839 ) ) ( not ( = ?auto_17818 ?auto_17828 ) ) ( not ( = ?auto_17818 ?auto_17810 ) ) ( not ( = ?auto_17827 ?auto_17826 ) ) ( not ( = ?auto_17827 ?auto_17814 ) ) ( not ( = ?auto_17827 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17798 ) ) ( not ( = ?auto_17793 ?auto_17835 ) ) ( not ( = ?auto_17794 ?auto_17798 ) ) ( not ( = ?auto_17794 ?auto_17835 ) ) ( not ( = ?auto_17795 ?auto_17798 ) ) ( not ( = ?auto_17795 ?auto_17835 ) ) ( not ( = ?auto_17796 ?auto_17798 ) ) ( not ( = ?auto_17796 ?auto_17835 ) ) ( not ( = ?auto_17798 ?auto_17827 ) ) ( not ( = ?auto_17798 ?auto_17826 ) ) ( not ( = ?auto_17798 ?auto_17814 ) ) ( not ( = ?auto_17798 ?auto_17817 ) ) ( not ( = ?auto_17835 ?auto_17827 ) ) ( not ( = ?auto_17835 ?auto_17826 ) ) ( not ( = ?auto_17835 ?auto_17814 ) ) ( not ( = ?auto_17835 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17799 ) ) ( not ( = ?auto_17793 ?auto_17825 ) ) ( not ( = ?auto_17794 ?auto_17799 ) ) ( not ( = ?auto_17794 ?auto_17825 ) ) ( not ( = ?auto_17795 ?auto_17799 ) ) ( not ( = ?auto_17795 ?auto_17825 ) ) ( not ( = ?auto_17796 ?auto_17799 ) ) ( not ( = ?auto_17796 ?auto_17825 ) ) ( not ( = ?auto_17797 ?auto_17799 ) ) ( not ( = ?auto_17797 ?auto_17825 ) ) ( not ( = ?auto_17799 ?auto_17835 ) ) ( not ( = ?auto_17799 ?auto_17827 ) ) ( not ( = ?auto_17799 ?auto_17826 ) ) ( not ( = ?auto_17799 ?auto_17814 ) ) ( not ( = ?auto_17799 ?auto_17817 ) ) ( not ( = ?auto_17819 ?auto_17844 ) ) ( not ( = ?auto_17819 ?auto_17831 ) ) ( not ( = ?auto_17819 ?auto_17829 ) ) ( not ( = ?auto_17819 ?auto_17809 ) ) ( not ( = ?auto_17836 ?auto_17828 ) ) ( not ( = ?auto_17836 ?auto_17818 ) ) ( not ( = ?auto_17836 ?auto_17839 ) ) ( not ( = ?auto_17836 ?auto_17810 ) ) ( not ( = ?auto_17825 ?auto_17835 ) ) ( not ( = ?auto_17825 ?auto_17827 ) ) ( not ( = ?auto_17825 ?auto_17826 ) ) ( not ( = ?auto_17825 ?auto_17814 ) ) ( not ( = ?auto_17825 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17800 ) ) ( not ( = ?auto_17793 ?auto_17830 ) ) ( not ( = ?auto_17794 ?auto_17800 ) ) ( not ( = ?auto_17794 ?auto_17830 ) ) ( not ( = ?auto_17795 ?auto_17800 ) ) ( not ( = ?auto_17795 ?auto_17830 ) ) ( not ( = ?auto_17796 ?auto_17800 ) ) ( not ( = ?auto_17796 ?auto_17830 ) ) ( not ( = ?auto_17797 ?auto_17800 ) ) ( not ( = ?auto_17797 ?auto_17830 ) ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17798 ?auto_17830 ) ) ( not ( = ?auto_17800 ?auto_17825 ) ) ( not ( = ?auto_17800 ?auto_17835 ) ) ( not ( = ?auto_17800 ?auto_17827 ) ) ( not ( = ?auto_17800 ?auto_17826 ) ) ( not ( = ?auto_17800 ?auto_17814 ) ) ( not ( = ?auto_17800 ?auto_17817 ) ) ( not ( = ?auto_17823 ?auto_17819 ) ) ( not ( = ?auto_17823 ?auto_17844 ) ) ( not ( = ?auto_17823 ?auto_17831 ) ) ( not ( = ?auto_17823 ?auto_17829 ) ) ( not ( = ?auto_17823 ?auto_17809 ) ) ( not ( = ?auto_17841 ?auto_17836 ) ) ( not ( = ?auto_17841 ?auto_17828 ) ) ( not ( = ?auto_17841 ?auto_17818 ) ) ( not ( = ?auto_17841 ?auto_17839 ) ) ( not ( = ?auto_17841 ?auto_17810 ) ) ( not ( = ?auto_17830 ?auto_17825 ) ) ( not ( = ?auto_17830 ?auto_17835 ) ) ( not ( = ?auto_17830 ?auto_17827 ) ) ( not ( = ?auto_17830 ?auto_17826 ) ) ( not ( = ?auto_17830 ?auto_17814 ) ) ( not ( = ?auto_17830 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17801 ) ) ( not ( = ?auto_17793 ?auto_17834 ) ) ( not ( = ?auto_17794 ?auto_17801 ) ) ( not ( = ?auto_17794 ?auto_17834 ) ) ( not ( = ?auto_17795 ?auto_17801 ) ) ( not ( = ?auto_17795 ?auto_17834 ) ) ( not ( = ?auto_17796 ?auto_17801 ) ) ( not ( = ?auto_17796 ?auto_17834 ) ) ( not ( = ?auto_17797 ?auto_17801 ) ) ( not ( = ?auto_17797 ?auto_17834 ) ) ( not ( = ?auto_17798 ?auto_17801 ) ) ( not ( = ?auto_17798 ?auto_17834 ) ) ( not ( = ?auto_17799 ?auto_17801 ) ) ( not ( = ?auto_17799 ?auto_17834 ) ) ( not ( = ?auto_17801 ?auto_17830 ) ) ( not ( = ?auto_17801 ?auto_17825 ) ) ( not ( = ?auto_17801 ?auto_17835 ) ) ( not ( = ?auto_17801 ?auto_17827 ) ) ( not ( = ?auto_17801 ?auto_17826 ) ) ( not ( = ?auto_17801 ?auto_17814 ) ) ( not ( = ?auto_17801 ?auto_17817 ) ) ( not ( = ?auto_17843 ?auto_17823 ) ) ( not ( = ?auto_17843 ?auto_17819 ) ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( not ( = ?auto_17843 ?auto_17831 ) ) ( not ( = ?auto_17843 ?auto_17829 ) ) ( not ( = ?auto_17843 ?auto_17809 ) ) ( not ( = ?auto_17822 ?auto_17841 ) ) ( not ( = ?auto_17822 ?auto_17836 ) ) ( not ( = ?auto_17822 ?auto_17828 ) ) ( not ( = ?auto_17822 ?auto_17818 ) ) ( not ( = ?auto_17822 ?auto_17839 ) ) ( not ( = ?auto_17822 ?auto_17810 ) ) ( not ( = ?auto_17834 ?auto_17830 ) ) ( not ( = ?auto_17834 ?auto_17825 ) ) ( not ( = ?auto_17834 ?auto_17835 ) ) ( not ( = ?auto_17834 ?auto_17827 ) ) ( not ( = ?auto_17834 ?auto_17826 ) ) ( not ( = ?auto_17834 ?auto_17814 ) ) ( not ( = ?auto_17834 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17802 ) ) ( not ( = ?auto_17793 ?auto_17840 ) ) ( not ( = ?auto_17794 ?auto_17802 ) ) ( not ( = ?auto_17794 ?auto_17840 ) ) ( not ( = ?auto_17795 ?auto_17802 ) ) ( not ( = ?auto_17795 ?auto_17840 ) ) ( not ( = ?auto_17796 ?auto_17802 ) ) ( not ( = ?auto_17796 ?auto_17840 ) ) ( not ( = ?auto_17797 ?auto_17802 ) ) ( not ( = ?auto_17797 ?auto_17840 ) ) ( not ( = ?auto_17798 ?auto_17802 ) ) ( not ( = ?auto_17798 ?auto_17840 ) ) ( not ( = ?auto_17799 ?auto_17802 ) ) ( not ( = ?auto_17799 ?auto_17840 ) ) ( not ( = ?auto_17800 ?auto_17802 ) ) ( not ( = ?auto_17800 ?auto_17840 ) ) ( not ( = ?auto_17802 ?auto_17834 ) ) ( not ( = ?auto_17802 ?auto_17830 ) ) ( not ( = ?auto_17802 ?auto_17825 ) ) ( not ( = ?auto_17802 ?auto_17835 ) ) ( not ( = ?auto_17802 ?auto_17827 ) ) ( not ( = ?auto_17802 ?auto_17826 ) ) ( not ( = ?auto_17802 ?auto_17814 ) ) ( not ( = ?auto_17802 ?auto_17817 ) ) ( not ( = ?auto_17821 ?auto_17843 ) ) ( not ( = ?auto_17821 ?auto_17823 ) ) ( not ( = ?auto_17821 ?auto_17819 ) ) ( not ( = ?auto_17821 ?auto_17844 ) ) ( not ( = ?auto_17821 ?auto_17831 ) ) ( not ( = ?auto_17821 ?auto_17829 ) ) ( not ( = ?auto_17821 ?auto_17809 ) ) ( not ( = ?auto_17815 ?auto_17822 ) ) ( not ( = ?auto_17815 ?auto_17841 ) ) ( not ( = ?auto_17815 ?auto_17836 ) ) ( not ( = ?auto_17815 ?auto_17828 ) ) ( not ( = ?auto_17815 ?auto_17818 ) ) ( not ( = ?auto_17815 ?auto_17839 ) ) ( not ( = ?auto_17815 ?auto_17810 ) ) ( not ( = ?auto_17840 ?auto_17834 ) ) ( not ( = ?auto_17840 ?auto_17830 ) ) ( not ( = ?auto_17840 ?auto_17825 ) ) ( not ( = ?auto_17840 ?auto_17835 ) ) ( not ( = ?auto_17840 ?auto_17827 ) ) ( not ( = ?auto_17840 ?auto_17826 ) ) ( not ( = ?auto_17840 ?auto_17814 ) ) ( not ( = ?auto_17840 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17803 ) ) ( not ( = ?auto_17793 ?auto_17816 ) ) ( not ( = ?auto_17794 ?auto_17803 ) ) ( not ( = ?auto_17794 ?auto_17816 ) ) ( not ( = ?auto_17795 ?auto_17803 ) ) ( not ( = ?auto_17795 ?auto_17816 ) ) ( not ( = ?auto_17796 ?auto_17803 ) ) ( not ( = ?auto_17796 ?auto_17816 ) ) ( not ( = ?auto_17797 ?auto_17803 ) ) ( not ( = ?auto_17797 ?auto_17816 ) ) ( not ( = ?auto_17798 ?auto_17803 ) ) ( not ( = ?auto_17798 ?auto_17816 ) ) ( not ( = ?auto_17799 ?auto_17803 ) ) ( not ( = ?auto_17799 ?auto_17816 ) ) ( not ( = ?auto_17800 ?auto_17803 ) ) ( not ( = ?auto_17800 ?auto_17816 ) ) ( not ( = ?auto_17801 ?auto_17803 ) ) ( not ( = ?auto_17801 ?auto_17816 ) ) ( not ( = ?auto_17803 ?auto_17840 ) ) ( not ( = ?auto_17803 ?auto_17834 ) ) ( not ( = ?auto_17803 ?auto_17830 ) ) ( not ( = ?auto_17803 ?auto_17825 ) ) ( not ( = ?auto_17803 ?auto_17835 ) ) ( not ( = ?auto_17803 ?auto_17827 ) ) ( not ( = ?auto_17803 ?auto_17826 ) ) ( not ( = ?auto_17803 ?auto_17814 ) ) ( not ( = ?auto_17803 ?auto_17817 ) ) ( not ( = ?auto_17842 ?auto_17821 ) ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( not ( = ?auto_17842 ?auto_17823 ) ) ( not ( = ?auto_17842 ?auto_17819 ) ) ( not ( = ?auto_17842 ?auto_17844 ) ) ( not ( = ?auto_17842 ?auto_17831 ) ) ( not ( = ?auto_17842 ?auto_17829 ) ) ( not ( = ?auto_17842 ?auto_17809 ) ) ( not ( = ?auto_17833 ?auto_17815 ) ) ( not ( = ?auto_17833 ?auto_17822 ) ) ( not ( = ?auto_17833 ?auto_17841 ) ) ( not ( = ?auto_17833 ?auto_17836 ) ) ( not ( = ?auto_17833 ?auto_17828 ) ) ( not ( = ?auto_17833 ?auto_17818 ) ) ( not ( = ?auto_17833 ?auto_17839 ) ) ( not ( = ?auto_17833 ?auto_17810 ) ) ( not ( = ?auto_17816 ?auto_17840 ) ) ( not ( = ?auto_17816 ?auto_17834 ) ) ( not ( = ?auto_17816 ?auto_17830 ) ) ( not ( = ?auto_17816 ?auto_17825 ) ) ( not ( = ?auto_17816 ?auto_17835 ) ) ( not ( = ?auto_17816 ?auto_17827 ) ) ( not ( = ?auto_17816 ?auto_17826 ) ) ( not ( = ?auto_17816 ?auto_17814 ) ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17804 ) ) ( not ( = ?auto_17793 ?auto_17838 ) ) ( not ( = ?auto_17794 ?auto_17804 ) ) ( not ( = ?auto_17794 ?auto_17838 ) ) ( not ( = ?auto_17795 ?auto_17804 ) ) ( not ( = ?auto_17795 ?auto_17838 ) ) ( not ( = ?auto_17796 ?auto_17804 ) ) ( not ( = ?auto_17796 ?auto_17838 ) ) ( not ( = ?auto_17797 ?auto_17804 ) ) ( not ( = ?auto_17797 ?auto_17838 ) ) ( not ( = ?auto_17798 ?auto_17804 ) ) ( not ( = ?auto_17798 ?auto_17838 ) ) ( not ( = ?auto_17799 ?auto_17804 ) ) ( not ( = ?auto_17799 ?auto_17838 ) ) ( not ( = ?auto_17800 ?auto_17804 ) ) ( not ( = ?auto_17800 ?auto_17838 ) ) ( not ( = ?auto_17801 ?auto_17804 ) ) ( not ( = ?auto_17801 ?auto_17838 ) ) ( not ( = ?auto_17802 ?auto_17804 ) ) ( not ( = ?auto_17802 ?auto_17838 ) ) ( not ( = ?auto_17804 ?auto_17816 ) ) ( not ( = ?auto_17804 ?auto_17840 ) ) ( not ( = ?auto_17804 ?auto_17834 ) ) ( not ( = ?auto_17804 ?auto_17830 ) ) ( not ( = ?auto_17804 ?auto_17825 ) ) ( not ( = ?auto_17804 ?auto_17835 ) ) ( not ( = ?auto_17804 ?auto_17827 ) ) ( not ( = ?auto_17804 ?auto_17826 ) ) ( not ( = ?auto_17804 ?auto_17814 ) ) ( not ( = ?auto_17804 ?auto_17817 ) ) ( not ( = ?auto_17820 ?auto_17842 ) ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( not ( = ?auto_17820 ?auto_17843 ) ) ( not ( = ?auto_17820 ?auto_17823 ) ) ( not ( = ?auto_17820 ?auto_17819 ) ) ( not ( = ?auto_17820 ?auto_17844 ) ) ( not ( = ?auto_17820 ?auto_17831 ) ) ( not ( = ?auto_17820 ?auto_17829 ) ) ( not ( = ?auto_17820 ?auto_17809 ) ) ( not ( = ?auto_17824 ?auto_17833 ) ) ( not ( = ?auto_17824 ?auto_17815 ) ) ( not ( = ?auto_17824 ?auto_17822 ) ) ( not ( = ?auto_17824 ?auto_17841 ) ) ( not ( = ?auto_17824 ?auto_17836 ) ) ( not ( = ?auto_17824 ?auto_17828 ) ) ( not ( = ?auto_17824 ?auto_17818 ) ) ( not ( = ?auto_17824 ?auto_17839 ) ) ( not ( = ?auto_17824 ?auto_17810 ) ) ( not ( = ?auto_17838 ?auto_17816 ) ) ( not ( = ?auto_17838 ?auto_17840 ) ) ( not ( = ?auto_17838 ?auto_17834 ) ) ( not ( = ?auto_17838 ?auto_17830 ) ) ( not ( = ?auto_17838 ?auto_17825 ) ) ( not ( = ?auto_17838 ?auto_17835 ) ) ( not ( = ?auto_17838 ?auto_17827 ) ) ( not ( = ?auto_17838 ?auto_17826 ) ) ( not ( = ?auto_17838 ?auto_17814 ) ) ( not ( = ?auto_17838 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17805 ) ) ( not ( = ?auto_17793 ?auto_17813 ) ) ( not ( = ?auto_17794 ?auto_17805 ) ) ( not ( = ?auto_17794 ?auto_17813 ) ) ( not ( = ?auto_17795 ?auto_17805 ) ) ( not ( = ?auto_17795 ?auto_17813 ) ) ( not ( = ?auto_17796 ?auto_17805 ) ) ( not ( = ?auto_17796 ?auto_17813 ) ) ( not ( = ?auto_17797 ?auto_17805 ) ) ( not ( = ?auto_17797 ?auto_17813 ) ) ( not ( = ?auto_17798 ?auto_17805 ) ) ( not ( = ?auto_17798 ?auto_17813 ) ) ( not ( = ?auto_17799 ?auto_17805 ) ) ( not ( = ?auto_17799 ?auto_17813 ) ) ( not ( = ?auto_17800 ?auto_17805 ) ) ( not ( = ?auto_17800 ?auto_17813 ) ) ( not ( = ?auto_17801 ?auto_17805 ) ) ( not ( = ?auto_17801 ?auto_17813 ) ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17802 ?auto_17813 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17803 ?auto_17813 ) ) ( not ( = ?auto_17805 ?auto_17838 ) ) ( not ( = ?auto_17805 ?auto_17816 ) ) ( not ( = ?auto_17805 ?auto_17840 ) ) ( not ( = ?auto_17805 ?auto_17834 ) ) ( not ( = ?auto_17805 ?auto_17830 ) ) ( not ( = ?auto_17805 ?auto_17825 ) ) ( not ( = ?auto_17805 ?auto_17835 ) ) ( not ( = ?auto_17805 ?auto_17827 ) ) ( not ( = ?auto_17805 ?auto_17826 ) ) ( not ( = ?auto_17805 ?auto_17814 ) ) ( not ( = ?auto_17805 ?auto_17817 ) ) ( not ( = ?auto_17837 ?auto_17820 ) ) ( not ( = ?auto_17837 ?auto_17842 ) ) ( not ( = ?auto_17837 ?auto_17821 ) ) ( not ( = ?auto_17837 ?auto_17843 ) ) ( not ( = ?auto_17837 ?auto_17823 ) ) ( not ( = ?auto_17837 ?auto_17819 ) ) ( not ( = ?auto_17837 ?auto_17844 ) ) ( not ( = ?auto_17837 ?auto_17831 ) ) ( not ( = ?auto_17837 ?auto_17829 ) ) ( not ( = ?auto_17837 ?auto_17809 ) ) ( not ( = ?auto_17832 ?auto_17824 ) ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17815 ) ) ( not ( = ?auto_17832 ?auto_17822 ) ) ( not ( = ?auto_17832 ?auto_17841 ) ) ( not ( = ?auto_17832 ?auto_17836 ) ) ( not ( = ?auto_17832 ?auto_17828 ) ) ( not ( = ?auto_17832 ?auto_17818 ) ) ( not ( = ?auto_17832 ?auto_17839 ) ) ( not ( = ?auto_17832 ?auto_17810 ) ) ( not ( = ?auto_17813 ?auto_17838 ) ) ( not ( = ?auto_17813 ?auto_17816 ) ) ( not ( = ?auto_17813 ?auto_17840 ) ) ( not ( = ?auto_17813 ?auto_17834 ) ) ( not ( = ?auto_17813 ?auto_17830 ) ) ( not ( = ?auto_17813 ?auto_17825 ) ) ( not ( = ?auto_17813 ?auto_17835 ) ) ( not ( = ?auto_17813 ?auto_17827 ) ) ( not ( = ?auto_17813 ?auto_17826 ) ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17817 ) ) ( not ( = ?auto_17793 ?auto_17806 ) ) ( not ( = ?auto_17793 ?auto_17812 ) ) ( not ( = ?auto_17794 ?auto_17806 ) ) ( not ( = ?auto_17794 ?auto_17812 ) ) ( not ( = ?auto_17795 ?auto_17806 ) ) ( not ( = ?auto_17795 ?auto_17812 ) ) ( not ( = ?auto_17796 ?auto_17806 ) ) ( not ( = ?auto_17796 ?auto_17812 ) ) ( not ( = ?auto_17797 ?auto_17806 ) ) ( not ( = ?auto_17797 ?auto_17812 ) ) ( not ( = ?auto_17798 ?auto_17806 ) ) ( not ( = ?auto_17798 ?auto_17812 ) ) ( not ( = ?auto_17799 ?auto_17806 ) ) ( not ( = ?auto_17799 ?auto_17812 ) ) ( not ( = ?auto_17800 ?auto_17806 ) ) ( not ( = ?auto_17800 ?auto_17812 ) ) ( not ( = ?auto_17801 ?auto_17806 ) ) ( not ( = ?auto_17801 ?auto_17812 ) ) ( not ( = ?auto_17802 ?auto_17806 ) ) ( not ( = ?auto_17802 ?auto_17812 ) ) ( not ( = ?auto_17803 ?auto_17806 ) ) ( not ( = ?auto_17803 ?auto_17812 ) ) ( not ( = ?auto_17804 ?auto_17806 ) ) ( not ( = ?auto_17804 ?auto_17812 ) ) ( not ( = ?auto_17806 ?auto_17813 ) ) ( not ( = ?auto_17806 ?auto_17838 ) ) ( not ( = ?auto_17806 ?auto_17816 ) ) ( not ( = ?auto_17806 ?auto_17840 ) ) ( not ( = ?auto_17806 ?auto_17834 ) ) ( not ( = ?auto_17806 ?auto_17830 ) ) ( not ( = ?auto_17806 ?auto_17825 ) ) ( not ( = ?auto_17806 ?auto_17835 ) ) ( not ( = ?auto_17806 ?auto_17827 ) ) ( not ( = ?auto_17806 ?auto_17826 ) ) ( not ( = ?auto_17806 ?auto_17814 ) ) ( not ( = ?auto_17806 ?auto_17817 ) ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17838 ) ) ( not ( = ?auto_17812 ?auto_17816 ) ) ( not ( = ?auto_17812 ?auto_17840 ) ) ( not ( = ?auto_17812 ?auto_17834 ) ) ( not ( = ?auto_17812 ?auto_17830 ) ) ( not ( = ?auto_17812 ?auto_17825 ) ) ( not ( = ?auto_17812 ?auto_17835 ) ) ( not ( = ?auto_17812 ?auto_17827 ) ) ( not ( = ?auto_17812 ?auto_17826 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17817 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 ?auto_17797 ?auto_17798 ?auto_17799 ?auto_17800 ?auto_17801 ?auto_17802 ?auto_17803 ?auto_17804 ?auto_17805 )
      ( MAKE-1CRATE ?auto_17805 ?auto_17806 )
      ( MAKE-13CRATE-VERIFY ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 ?auto_17797 ?auto_17798 ?auto_17799 ?auto_17800 ?auto_17801 ?auto_17802 ?auto_17803 ?auto_17804 ?auto_17805 ?auto_17806 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17870 - SURFACE
      ?auto_17871 - SURFACE
      ?auto_17872 - SURFACE
      ?auto_17873 - SURFACE
      ?auto_17874 - SURFACE
      ?auto_17875 - SURFACE
      ?auto_17876 - SURFACE
      ?auto_17877 - SURFACE
      ?auto_17878 - SURFACE
      ?auto_17879 - SURFACE
      ?auto_17880 - SURFACE
      ?auto_17881 - SURFACE
      ?auto_17882 - SURFACE
      ?auto_17884 - SURFACE
      ?auto_17883 - SURFACE
    )
    :vars
    (
      ?auto_17887 - HOIST
      ?auto_17885 - PLACE
      ?auto_17890 - PLACE
      ?auto_17888 - HOIST
      ?auto_17889 - SURFACE
      ?auto_17899 - PLACE
      ?auto_17919 - HOIST
      ?auto_17922 - SURFACE
      ?auto_17893 - PLACE
      ?auto_17902 - HOIST
      ?auto_17901 - SURFACE
      ?auto_17906 - PLACE
      ?auto_17905 - HOIST
      ?auto_17895 - SURFACE
      ?auto_17894 - PLACE
      ?auto_17924 - HOIST
      ?auto_17910 - SURFACE
      ?auto_17921 - PLACE
      ?auto_17925 - HOIST
      ?auto_17920 - SURFACE
      ?auto_17909 - PLACE
      ?auto_17915 - HOIST
      ?auto_17904 - SURFACE
      ?auto_17896 - PLACE
      ?auto_17908 - HOIST
      ?auto_17917 - SURFACE
      ?auto_17923 - PLACE
      ?auto_17916 - HOIST
      ?auto_17897 - SURFACE
      ?auto_17913 - PLACE
      ?auto_17892 - HOIST
      ?auto_17907 - SURFACE
      ?auto_17903 - PLACE
      ?auto_17898 - HOIST
      ?auto_17900 - SURFACE
      ?auto_17891 - PLACE
      ?auto_17914 - HOIST
      ?auto_17918 - SURFACE
      ?auto_17911 - SURFACE
      ?auto_17912 - SURFACE
      ?auto_17886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17887 ?auto_17885 ) ( IS-CRATE ?auto_17883 ) ( not ( = ?auto_17890 ?auto_17885 ) ) ( HOIST-AT ?auto_17888 ?auto_17890 ) ( AVAILABLE ?auto_17888 ) ( SURFACE-AT ?auto_17883 ?auto_17890 ) ( ON ?auto_17883 ?auto_17889 ) ( CLEAR ?auto_17883 ) ( not ( = ?auto_17884 ?auto_17883 ) ) ( not ( = ?auto_17884 ?auto_17889 ) ) ( not ( = ?auto_17883 ?auto_17889 ) ) ( not ( = ?auto_17887 ?auto_17888 ) ) ( IS-CRATE ?auto_17884 ) ( not ( = ?auto_17899 ?auto_17885 ) ) ( HOIST-AT ?auto_17919 ?auto_17899 ) ( SURFACE-AT ?auto_17884 ?auto_17899 ) ( ON ?auto_17884 ?auto_17922 ) ( CLEAR ?auto_17884 ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( not ( = ?auto_17882 ?auto_17922 ) ) ( not ( = ?auto_17884 ?auto_17922 ) ) ( not ( = ?auto_17887 ?auto_17919 ) ) ( IS-CRATE ?auto_17882 ) ( not ( = ?auto_17893 ?auto_17885 ) ) ( HOIST-AT ?auto_17902 ?auto_17893 ) ( AVAILABLE ?auto_17902 ) ( SURFACE-AT ?auto_17882 ?auto_17893 ) ( ON ?auto_17882 ?auto_17901 ) ( CLEAR ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17901 ) ) ( not ( = ?auto_17882 ?auto_17901 ) ) ( not ( = ?auto_17887 ?auto_17902 ) ) ( IS-CRATE ?auto_17881 ) ( not ( = ?auto_17906 ?auto_17885 ) ) ( HOIST-AT ?auto_17905 ?auto_17906 ) ( AVAILABLE ?auto_17905 ) ( SURFACE-AT ?auto_17881 ?auto_17906 ) ( ON ?auto_17881 ?auto_17895 ) ( CLEAR ?auto_17881 ) ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17895 ) ) ( not ( = ?auto_17881 ?auto_17895 ) ) ( not ( = ?auto_17887 ?auto_17905 ) ) ( IS-CRATE ?auto_17880 ) ( not ( = ?auto_17894 ?auto_17885 ) ) ( HOIST-AT ?auto_17924 ?auto_17894 ) ( AVAILABLE ?auto_17924 ) ( SURFACE-AT ?auto_17880 ?auto_17894 ) ( ON ?auto_17880 ?auto_17910 ) ( CLEAR ?auto_17880 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17910 ) ) ( not ( = ?auto_17880 ?auto_17910 ) ) ( not ( = ?auto_17887 ?auto_17924 ) ) ( IS-CRATE ?auto_17879 ) ( not ( = ?auto_17921 ?auto_17885 ) ) ( HOIST-AT ?auto_17925 ?auto_17921 ) ( AVAILABLE ?auto_17925 ) ( SURFACE-AT ?auto_17879 ?auto_17921 ) ( ON ?auto_17879 ?auto_17920 ) ( CLEAR ?auto_17879 ) ( not ( = ?auto_17878 ?auto_17879 ) ) ( not ( = ?auto_17878 ?auto_17920 ) ) ( not ( = ?auto_17879 ?auto_17920 ) ) ( not ( = ?auto_17887 ?auto_17925 ) ) ( IS-CRATE ?auto_17878 ) ( not ( = ?auto_17909 ?auto_17885 ) ) ( HOIST-AT ?auto_17915 ?auto_17909 ) ( AVAILABLE ?auto_17915 ) ( SURFACE-AT ?auto_17878 ?auto_17909 ) ( ON ?auto_17878 ?auto_17904 ) ( CLEAR ?auto_17878 ) ( not ( = ?auto_17877 ?auto_17878 ) ) ( not ( = ?auto_17877 ?auto_17904 ) ) ( not ( = ?auto_17878 ?auto_17904 ) ) ( not ( = ?auto_17887 ?auto_17915 ) ) ( IS-CRATE ?auto_17877 ) ( not ( = ?auto_17896 ?auto_17885 ) ) ( HOIST-AT ?auto_17908 ?auto_17896 ) ( AVAILABLE ?auto_17908 ) ( SURFACE-AT ?auto_17877 ?auto_17896 ) ( ON ?auto_17877 ?auto_17917 ) ( CLEAR ?auto_17877 ) ( not ( = ?auto_17876 ?auto_17877 ) ) ( not ( = ?auto_17876 ?auto_17917 ) ) ( not ( = ?auto_17877 ?auto_17917 ) ) ( not ( = ?auto_17887 ?auto_17908 ) ) ( IS-CRATE ?auto_17876 ) ( not ( = ?auto_17923 ?auto_17885 ) ) ( HOIST-AT ?auto_17916 ?auto_17923 ) ( AVAILABLE ?auto_17916 ) ( SURFACE-AT ?auto_17876 ?auto_17923 ) ( ON ?auto_17876 ?auto_17897 ) ( CLEAR ?auto_17876 ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( not ( = ?auto_17875 ?auto_17897 ) ) ( not ( = ?auto_17876 ?auto_17897 ) ) ( not ( = ?auto_17887 ?auto_17916 ) ) ( IS-CRATE ?auto_17875 ) ( not ( = ?auto_17913 ?auto_17885 ) ) ( HOIST-AT ?auto_17892 ?auto_17913 ) ( SURFACE-AT ?auto_17875 ?auto_17913 ) ( ON ?auto_17875 ?auto_17907 ) ( CLEAR ?auto_17875 ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17907 ) ) ( not ( = ?auto_17875 ?auto_17907 ) ) ( not ( = ?auto_17887 ?auto_17892 ) ) ( IS-CRATE ?auto_17874 ) ( not ( = ?auto_17903 ?auto_17885 ) ) ( HOIST-AT ?auto_17898 ?auto_17903 ) ( AVAILABLE ?auto_17898 ) ( SURFACE-AT ?auto_17874 ?auto_17903 ) ( ON ?auto_17874 ?auto_17900 ) ( CLEAR ?auto_17874 ) ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17900 ) ) ( not ( = ?auto_17874 ?auto_17900 ) ) ( not ( = ?auto_17887 ?auto_17898 ) ) ( IS-CRATE ?auto_17873 ) ( not ( = ?auto_17891 ?auto_17885 ) ) ( HOIST-AT ?auto_17914 ?auto_17891 ) ( AVAILABLE ?auto_17914 ) ( SURFACE-AT ?auto_17873 ?auto_17891 ) ( ON ?auto_17873 ?auto_17918 ) ( CLEAR ?auto_17873 ) ( not ( = ?auto_17872 ?auto_17873 ) ) ( not ( = ?auto_17872 ?auto_17918 ) ) ( not ( = ?auto_17873 ?auto_17918 ) ) ( not ( = ?auto_17887 ?auto_17914 ) ) ( IS-CRATE ?auto_17872 ) ( AVAILABLE ?auto_17892 ) ( SURFACE-AT ?auto_17872 ?auto_17913 ) ( ON ?auto_17872 ?auto_17911 ) ( CLEAR ?auto_17872 ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17911 ) ) ( not ( = ?auto_17872 ?auto_17911 ) ) ( SURFACE-AT ?auto_17870 ?auto_17885 ) ( CLEAR ?auto_17870 ) ( IS-CRATE ?auto_17871 ) ( AVAILABLE ?auto_17887 ) ( AVAILABLE ?auto_17919 ) ( SURFACE-AT ?auto_17871 ?auto_17899 ) ( ON ?auto_17871 ?auto_17912 ) ( CLEAR ?auto_17871 ) ( TRUCK-AT ?auto_17886 ?auto_17885 ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( not ( = ?auto_17870 ?auto_17912 ) ) ( not ( = ?auto_17871 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( not ( = ?auto_17870 ?auto_17911 ) ) ( not ( = ?auto_17872 ?auto_17912 ) ) ( not ( = ?auto_17913 ?auto_17899 ) ) ( not ( = ?auto_17892 ?auto_17919 ) ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17873 ) ) ( not ( = ?auto_17870 ?auto_17918 ) ) ( not ( = ?auto_17871 ?auto_17873 ) ) ( not ( = ?auto_17871 ?auto_17918 ) ) ( not ( = ?auto_17873 ?auto_17911 ) ) ( not ( = ?auto_17873 ?auto_17912 ) ) ( not ( = ?auto_17891 ?auto_17913 ) ) ( not ( = ?auto_17891 ?auto_17899 ) ) ( not ( = ?auto_17914 ?auto_17892 ) ) ( not ( = ?auto_17914 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17911 ) ) ( not ( = ?auto_17918 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17874 ) ) ( not ( = ?auto_17870 ?auto_17900 ) ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( not ( = ?auto_17871 ?auto_17900 ) ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( not ( = ?auto_17872 ?auto_17900 ) ) ( not ( = ?auto_17874 ?auto_17918 ) ) ( not ( = ?auto_17874 ?auto_17911 ) ) ( not ( = ?auto_17874 ?auto_17912 ) ) ( not ( = ?auto_17903 ?auto_17891 ) ) ( not ( = ?auto_17903 ?auto_17913 ) ) ( not ( = ?auto_17903 ?auto_17899 ) ) ( not ( = ?auto_17898 ?auto_17914 ) ) ( not ( = ?auto_17898 ?auto_17892 ) ) ( not ( = ?auto_17898 ?auto_17919 ) ) ( not ( = ?auto_17900 ?auto_17918 ) ) ( not ( = ?auto_17900 ?auto_17911 ) ) ( not ( = ?auto_17900 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17875 ) ) ( not ( = ?auto_17870 ?auto_17907 ) ) ( not ( = ?auto_17871 ?auto_17875 ) ) ( not ( = ?auto_17871 ?auto_17907 ) ) ( not ( = ?auto_17872 ?auto_17875 ) ) ( not ( = ?auto_17872 ?auto_17907 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17907 ) ) ( not ( = ?auto_17875 ?auto_17900 ) ) ( not ( = ?auto_17875 ?auto_17918 ) ) ( not ( = ?auto_17875 ?auto_17911 ) ) ( not ( = ?auto_17875 ?auto_17912 ) ) ( not ( = ?auto_17907 ?auto_17900 ) ) ( not ( = ?auto_17907 ?auto_17918 ) ) ( not ( = ?auto_17907 ?auto_17911 ) ) ( not ( = ?auto_17907 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17876 ) ) ( not ( = ?auto_17870 ?auto_17897 ) ) ( not ( = ?auto_17871 ?auto_17876 ) ) ( not ( = ?auto_17871 ?auto_17897 ) ) ( not ( = ?auto_17872 ?auto_17876 ) ) ( not ( = ?auto_17872 ?auto_17897 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) ( not ( = ?auto_17873 ?auto_17897 ) ) ( not ( = ?auto_17874 ?auto_17876 ) ) ( not ( = ?auto_17874 ?auto_17897 ) ) ( not ( = ?auto_17876 ?auto_17907 ) ) ( not ( = ?auto_17876 ?auto_17900 ) ) ( not ( = ?auto_17876 ?auto_17918 ) ) ( not ( = ?auto_17876 ?auto_17911 ) ) ( not ( = ?auto_17876 ?auto_17912 ) ) ( not ( = ?auto_17923 ?auto_17913 ) ) ( not ( = ?auto_17923 ?auto_17903 ) ) ( not ( = ?auto_17923 ?auto_17891 ) ) ( not ( = ?auto_17923 ?auto_17899 ) ) ( not ( = ?auto_17916 ?auto_17892 ) ) ( not ( = ?auto_17916 ?auto_17898 ) ) ( not ( = ?auto_17916 ?auto_17914 ) ) ( not ( = ?auto_17916 ?auto_17919 ) ) ( not ( = ?auto_17897 ?auto_17907 ) ) ( not ( = ?auto_17897 ?auto_17900 ) ) ( not ( = ?auto_17897 ?auto_17918 ) ) ( not ( = ?auto_17897 ?auto_17911 ) ) ( not ( = ?auto_17897 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17877 ) ) ( not ( = ?auto_17870 ?auto_17917 ) ) ( not ( = ?auto_17871 ?auto_17877 ) ) ( not ( = ?auto_17871 ?auto_17917 ) ) ( not ( = ?auto_17872 ?auto_17877 ) ) ( not ( = ?auto_17872 ?auto_17917 ) ) ( not ( = ?auto_17873 ?auto_17877 ) ) ( not ( = ?auto_17873 ?auto_17917 ) ) ( not ( = ?auto_17874 ?auto_17877 ) ) ( not ( = ?auto_17874 ?auto_17917 ) ) ( not ( = ?auto_17875 ?auto_17877 ) ) ( not ( = ?auto_17875 ?auto_17917 ) ) ( not ( = ?auto_17877 ?auto_17897 ) ) ( not ( = ?auto_17877 ?auto_17907 ) ) ( not ( = ?auto_17877 ?auto_17900 ) ) ( not ( = ?auto_17877 ?auto_17918 ) ) ( not ( = ?auto_17877 ?auto_17911 ) ) ( not ( = ?auto_17877 ?auto_17912 ) ) ( not ( = ?auto_17896 ?auto_17923 ) ) ( not ( = ?auto_17896 ?auto_17913 ) ) ( not ( = ?auto_17896 ?auto_17903 ) ) ( not ( = ?auto_17896 ?auto_17891 ) ) ( not ( = ?auto_17896 ?auto_17899 ) ) ( not ( = ?auto_17908 ?auto_17916 ) ) ( not ( = ?auto_17908 ?auto_17892 ) ) ( not ( = ?auto_17908 ?auto_17898 ) ) ( not ( = ?auto_17908 ?auto_17914 ) ) ( not ( = ?auto_17908 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17897 ) ) ( not ( = ?auto_17917 ?auto_17907 ) ) ( not ( = ?auto_17917 ?auto_17900 ) ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17911 ) ) ( not ( = ?auto_17917 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17878 ) ) ( not ( = ?auto_17870 ?auto_17904 ) ) ( not ( = ?auto_17871 ?auto_17878 ) ) ( not ( = ?auto_17871 ?auto_17904 ) ) ( not ( = ?auto_17872 ?auto_17878 ) ) ( not ( = ?auto_17872 ?auto_17904 ) ) ( not ( = ?auto_17873 ?auto_17878 ) ) ( not ( = ?auto_17873 ?auto_17904 ) ) ( not ( = ?auto_17874 ?auto_17878 ) ) ( not ( = ?auto_17874 ?auto_17904 ) ) ( not ( = ?auto_17875 ?auto_17878 ) ) ( not ( = ?auto_17875 ?auto_17904 ) ) ( not ( = ?auto_17876 ?auto_17878 ) ) ( not ( = ?auto_17876 ?auto_17904 ) ) ( not ( = ?auto_17878 ?auto_17917 ) ) ( not ( = ?auto_17878 ?auto_17897 ) ) ( not ( = ?auto_17878 ?auto_17907 ) ) ( not ( = ?auto_17878 ?auto_17900 ) ) ( not ( = ?auto_17878 ?auto_17918 ) ) ( not ( = ?auto_17878 ?auto_17911 ) ) ( not ( = ?auto_17878 ?auto_17912 ) ) ( not ( = ?auto_17909 ?auto_17896 ) ) ( not ( = ?auto_17909 ?auto_17923 ) ) ( not ( = ?auto_17909 ?auto_17913 ) ) ( not ( = ?auto_17909 ?auto_17903 ) ) ( not ( = ?auto_17909 ?auto_17891 ) ) ( not ( = ?auto_17909 ?auto_17899 ) ) ( not ( = ?auto_17915 ?auto_17908 ) ) ( not ( = ?auto_17915 ?auto_17916 ) ) ( not ( = ?auto_17915 ?auto_17892 ) ) ( not ( = ?auto_17915 ?auto_17898 ) ) ( not ( = ?auto_17915 ?auto_17914 ) ) ( not ( = ?auto_17915 ?auto_17919 ) ) ( not ( = ?auto_17904 ?auto_17917 ) ) ( not ( = ?auto_17904 ?auto_17897 ) ) ( not ( = ?auto_17904 ?auto_17907 ) ) ( not ( = ?auto_17904 ?auto_17900 ) ) ( not ( = ?auto_17904 ?auto_17918 ) ) ( not ( = ?auto_17904 ?auto_17911 ) ) ( not ( = ?auto_17904 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17879 ) ) ( not ( = ?auto_17870 ?auto_17920 ) ) ( not ( = ?auto_17871 ?auto_17879 ) ) ( not ( = ?auto_17871 ?auto_17920 ) ) ( not ( = ?auto_17872 ?auto_17879 ) ) ( not ( = ?auto_17872 ?auto_17920 ) ) ( not ( = ?auto_17873 ?auto_17879 ) ) ( not ( = ?auto_17873 ?auto_17920 ) ) ( not ( = ?auto_17874 ?auto_17879 ) ) ( not ( = ?auto_17874 ?auto_17920 ) ) ( not ( = ?auto_17875 ?auto_17879 ) ) ( not ( = ?auto_17875 ?auto_17920 ) ) ( not ( = ?auto_17876 ?auto_17879 ) ) ( not ( = ?auto_17876 ?auto_17920 ) ) ( not ( = ?auto_17877 ?auto_17879 ) ) ( not ( = ?auto_17877 ?auto_17920 ) ) ( not ( = ?auto_17879 ?auto_17904 ) ) ( not ( = ?auto_17879 ?auto_17917 ) ) ( not ( = ?auto_17879 ?auto_17897 ) ) ( not ( = ?auto_17879 ?auto_17907 ) ) ( not ( = ?auto_17879 ?auto_17900 ) ) ( not ( = ?auto_17879 ?auto_17918 ) ) ( not ( = ?auto_17879 ?auto_17911 ) ) ( not ( = ?auto_17879 ?auto_17912 ) ) ( not ( = ?auto_17921 ?auto_17909 ) ) ( not ( = ?auto_17921 ?auto_17896 ) ) ( not ( = ?auto_17921 ?auto_17923 ) ) ( not ( = ?auto_17921 ?auto_17913 ) ) ( not ( = ?auto_17921 ?auto_17903 ) ) ( not ( = ?auto_17921 ?auto_17891 ) ) ( not ( = ?auto_17921 ?auto_17899 ) ) ( not ( = ?auto_17925 ?auto_17915 ) ) ( not ( = ?auto_17925 ?auto_17908 ) ) ( not ( = ?auto_17925 ?auto_17916 ) ) ( not ( = ?auto_17925 ?auto_17892 ) ) ( not ( = ?auto_17925 ?auto_17898 ) ) ( not ( = ?auto_17925 ?auto_17914 ) ) ( not ( = ?auto_17925 ?auto_17919 ) ) ( not ( = ?auto_17920 ?auto_17904 ) ) ( not ( = ?auto_17920 ?auto_17917 ) ) ( not ( = ?auto_17920 ?auto_17897 ) ) ( not ( = ?auto_17920 ?auto_17907 ) ) ( not ( = ?auto_17920 ?auto_17900 ) ) ( not ( = ?auto_17920 ?auto_17918 ) ) ( not ( = ?auto_17920 ?auto_17911 ) ) ( not ( = ?auto_17920 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17880 ) ) ( not ( = ?auto_17870 ?auto_17910 ) ) ( not ( = ?auto_17871 ?auto_17880 ) ) ( not ( = ?auto_17871 ?auto_17910 ) ) ( not ( = ?auto_17872 ?auto_17880 ) ) ( not ( = ?auto_17872 ?auto_17910 ) ) ( not ( = ?auto_17873 ?auto_17880 ) ) ( not ( = ?auto_17873 ?auto_17910 ) ) ( not ( = ?auto_17874 ?auto_17880 ) ) ( not ( = ?auto_17874 ?auto_17910 ) ) ( not ( = ?auto_17875 ?auto_17880 ) ) ( not ( = ?auto_17875 ?auto_17910 ) ) ( not ( = ?auto_17876 ?auto_17880 ) ) ( not ( = ?auto_17876 ?auto_17910 ) ) ( not ( = ?auto_17877 ?auto_17880 ) ) ( not ( = ?auto_17877 ?auto_17910 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17910 ) ) ( not ( = ?auto_17880 ?auto_17920 ) ) ( not ( = ?auto_17880 ?auto_17904 ) ) ( not ( = ?auto_17880 ?auto_17917 ) ) ( not ( = ?auto_17880 ?auto_17897 ) ) ( not ( = ?auto_17880 ?auto_17907 ) ) ( not ( = ?auto_17880 ?auto_17900 ) ) ( not ( = ?auto_17880 ?auto_17918 ) ) ( not ( = ?auto_17880 ?auto_17911 ) ) ( not ( = ?auto_17880 ?auto_17912 ) ) ( not ( = ?auto_17894 ?auto_17921 ) ) ( not ( = ?auto_17894 ?auto_17909 ) ) ( not ( = ?auto_17894 ?auto_17896 ) ) ( not ( = ?auto_17894 ?auto_17923 ) ) ( not ( = ?auto_17894 ?auto_17913 ) ) ( not ( = ?auto_17894 ?auto_17903 ) ) ( not ( = ?auto_17894 ?auto_17891 ) ) ( not ( = ?auto_17894 ?auto_17899 ) ) ( not ( = ?auto_17924 ?auto_17925 ) ) ( not ( = ?auto_17924 ?auto_17915 ) ) ( not ( = ?auto_17924 ?auto_17908 ) ) ( not ( = ?auto_17924 ?auto_17916 ) ) ( not ( = ?auto_17924 ?auto_17892 ) ) ( not ( = ?auto_17924 ?auto_17898 ) ) ( not ( = ?auto_17924 ?auto_17914 ) ) ( not ( = ?auto_17924 ?auto_17919 ) ) ( not ( = ?auto_17910 ?auto_17920 ) ) ( not ( = ?auto_17910 ?auto_17904 ) ) ( not ( = ?auto_17910 ?auto_17917 ) ) ( not ( = ?auto_17910 ?auto_17897 ) ) ( not ( = ?auto_17910 ?auto_17907 ) ) ( not ( = ?auto_17910 ?auto_17900 ) ) ( not ( = ?auto_17910 ?auto_17918 ) ) ( not ( = ?auto_17910 ?auto_17911 ) ) ( not ( = ?auto_17910 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17881 ) ) ( not ( = ?auto_17870 ?auto_17895 ) ) ( not ( = ?auto_17871 ?auto_17881 ) ) ( not ( = ?auto_17871 ?auto_17895 ) ) ( not ( = ?auto_17872 ?auto_17881 ) ) ( not ( = ?auto_17872 ?auto_17895 ) ) ( not ( = ?auto_17873 ?auto_17881 ) ) ( not ( = ?auto_17873 ?auto_17895 ) ) ( not ( = ?auto_17874 ?auto_17881 ) ) ( not ( = ?auto_17874 ?auto_17895 ) ) ( not ( = ?auto_17875 ?auto_17881 ) ) ( not ( = ?auto_17875 ?auto_17895 ) ) ( not ( = ?auto_17876 ?auto_17881 ) ) ( not ( = ?auto_17876 ?auto_17895 ) ) ( not ( = ?auto_17877 ?auto_17881 ) ) ( not ( = ?auto_17877 ?auto_17895 ) ) ( not ( = ?auto_17878 ?auto_17881 ) ) ( not ( = ?auto_17878 ?auto_17895 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17895 ) ) ( not ( = ?auto_17881 ?auto_17910 ) ) ( not ( = ?auto_17881 ?auto_17920 ) ) ( not ( = ?auto_17881 ?auto_17904 ) ) ( not ( = ?auto_17881 ?auto_17917 ) ) ( not ( = ?auto_17881 ?auto_17897 ) ) ( not ( = ?auto_17881 ?auto_17907 ) ) ( not ( = ?auto_17881 ?auto_17900 ) ) ( not ( = ?auto_17881 ?auto_17918 ) ) ( not ( = ?auto_17881 ?auto_17911 ) ) ( not ( = ?auto_17881 ?auto_17912 ) ) ( not ( = ?auto_17906 ?auto_17894 ) ) ( not ( = ?auto_17906 ?auto_17921 ) ) ( not ( = ?auto_17906 ?auto_17909 ) ) ( not ( = ?auto_17906 ?auto_17896 ) ) ( not ( = ?auto_17906 ?auto_17923 ) ) ( not ( = ?auto_17906 ?auto_17913 ) ) ( not ( = ?auto_17906 ?auto_17903 ) ) ( not ( = ?auto_17906 ?auto_17891 ) ) ( not ( = ?auto_17906 ?auto_17899 ) ) ( not ( = ?auto_17905 ?auto_17924 ) ) ( not ( = ?auto_17905 ?auto_17925 ) ) ( not ( = ?auto_17905 ?auto_17915 ) ) ( not ( = ?auto_17905 ?auto_17908 ) ) ( not ( = ?auto_17905 ?auto_17916 ) ) ( not ( = ?auto_17905 ?auto_17892 ) ) ( not ( = ?auto_17905 ?auto_17898 ) ) ( not ( = ?auto_17905 ?auto_17914 ) ) ( not ( = ?auto_17905 ?auto_17919 ) ) ( not ( = ?auto_17895 ?auto_17910 ) ) ( not ( = ?auto_17895 ?auto_17920 ) ) ( not ( = ?auto_17895 ?auto_17904 ) ) ( not ( = ?auto_17895 ?auto_17917 ) ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( not ( = ?auto_17895 ?auto_17907 ) ) ( not ( = ?auto_17895 ?auto_17900 ) ) ( not ( = ?auto_17895 ?auto_17918 ) ) ( not ( = ?auto_17895 ?auto_17911 ) ) ( not ( = ?auto_17895 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17882 ) ) ( not ( = ?auto_17870 ?auto_17901 ) ) ( not ( = ?auto_17871 ?auto_17882 ) ) ( not ( = ?auto_17871 ?auto_17901 ) ) ( not ( = ?auto_17872 ?auto_17882 ) ) ( not ( = ?auto_17872 ?auto_17901 ) ) ( not ( = ?auto_17873 ?auto_17882 ) ) ( not ( = ?auto_17873 ?auto_17901 ) ) ( not ( = ?auto_17874 ?auto_17882 ) ) ( not ( = ?auto_17874 ?auto_17901 ) ) ( not ( = ?auto_17875 ?auto_17882 ) ) ( not ( = ?auto_17875 ?auto_17901 ) ) ( not ( = ?auto_17876 ?auto_17882 ) ) ( not ( = ?auto_17876 ?auto_17901 ) ) ( not ( = ?auto_17877 ?auto_17882 ) ) ( not ( = ?auto_17877 ?auto_17901 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17901 ) ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( not ( = ?auto_17879 ?auto_17901 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17901 ) ) ( not ( = ?auto_17882 ?auto_17895 ) ) ( not ( = ?auto_17882 ?auto_17910 ) ) ( not ( = ?auto_17882 ?auto_17920 ) ) ( not ( = ?auto_17882 ?auto_17904 ) ) ( not ( = ?auto_17882 ?auto_17917 ) ) ( not ( = ?auto_17882 ?auto_17897 ) ) ( not ( = ?auto_17882 ?auto_17907 ) ) ( not ( = ?auto_17882 ?auto_17900 ) ) ( not ( = ?auto_17882 ?auto_17918 ) ) ( not ( = ?auto_17882 ?auto_17911 ) ) ( not ( = ?auto_17882 ?auto_17912 ) ) ( not ( = ?auto_17893 ?auto_17906 ) ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( not ( = ?auto_17893 ?auto_17921 ) ) ( not ( = ?auto_17893 ?auto_17909 ) ) ( not ( = ?auto_17893 ?auto_17896 ) ) ( not ( = ?auto_17893 ?auto_17923 ) ) ( not ( = ?auto_17893 ?auto_17913 ) ) ( not ( = ?auto_17893 ?auto_17903 ) ) ( not ( = ?auto_17893 ?auto_17891 ) ) ( not ( = ?auto_17893 ?auto_17899 ) ) ( not ( = ?auto_17902 ?auto_17905 ) ) ( not ( = ?auto_17902 ?auto_17924 ) ) ( not ( = ?auto_17902 ?auto_17925 ) ) ( not ( = ?auto_17902 ?auto_17915 ) ) ( not ( = ?auto_17902 ?auto_17908 ) ) ( not ( = ?auto_17902 ?auto_17916 ) ) ( not ( = ?auto_17902 ?auto_17892 ) ) ( not ( = ?auto_17902 ?auto_17898 ) ) ( not ( = ?auto_17902 ?auto_17914 ) ) ( not ( = ?auto_17902 ?auto_17919 ) ) ( not ( = ?auto_17901 ?auto_17895 ) ) ( not ( = ?auto_17901 ?auto_17910 ) ) ( not ( = ?auto_17901 ?auto_17920 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17917 ) ) ( not ( = ?auto_17901 ?auto_17897 ) ) ( not ( = ?auto_17901 ?auto_17907 ) ) ( not ( = ?auto_17901 ?auto_17900 ) ) ( not ( = ?auto_17901 ?auto_17918 ) ) ( not ( = ?auto_17901 ?auto_17911 ) ) ( not ( = ?auto_17901 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17884 ) ) ( not ( = ?auto_17870 ?auto_17922 ) ) ( not ( = ?auto_17871 ?auto_17884 ) ) ( not ( = ?auto_17871 ?auto_17922 ) ) ( not ( = ?auto_17872 ?auto_17884 ) ) ( not ( = ?auto_17872 ?auto_17922 ) ) ( not ( = ?auto_17873 ?auto_17884 ) ) ( not ( = ?auto_17873 ?auto_17922 ) ) ( not ( = ?auto_17874 ?auto_17884 ) ) ( not ( = ?auto_17874 ?auto_17922 ) ) ( not ( = ?auto_17875 ?auto_17884 ) ) ( not ( = ?auto_17875 ?auto_17922 ) ) ( not ( = ?auto_17876 ?auto_17884 ) ) ( not ( = ?auto_17876 ?auto_17922 ) ) ( not ( = ?auto_17877 ?auto_17884 ) ) ( not ( = ?auto_17877 ?auto_17922 ) ) ( not ( = ?auto_17878 ?auto_17884 ) ) ( not ( = ?auto_17878 ?auto_17922 ) ) ( not ( = ?auto_17879 ?auto_17884 ) ) ( not ( = ?auto_17879 ?auto_17922 ) ) ( not ( = ?auto_17880 ?auto_17884 ) ) ( not ( = ?auto_17880 ?auto_17922 ) ) ( not ( = ?auto_17881 ?auto_17884 ) ) ( not ( = ?auto_17881 ?auto_17922 ) ) ( not ( = ?auto_17884 ?auto_17901 ) ) ( not ( = ?auto_17884 ?auto_17895 ) ) ( not ( = ?auto_17884 ?auto_17910 ) ) ( not ( = ?auto_17884 ?auto_17920 ) ) ( not ( = ?auto_17884 ?auto_17904 ) ) ( not ( = ?auto_17884 ?auto_17917 ) ) ( not ( = ?auto_17884 ?auto_17897 ) ) ( not ( = ?auto_17884 ?auto_17907 ) ) ( not ( = ?auto_17884 ?auto_17900 ) ) ( not ( = ?auto_17884 ?auto_17918 ) ) ( not ( = ?auto_17884 ?auto_17911 ) ) ( not ( = ?auto_17884 ?auto_17912 ) ) ( not ( = ?auto_17922 ?auto_17901 ) ) ( not ( = ?auto_17922 ?auto_17895 ) ) ( not ( = ?auto_17922 ?auto_17910 ) ) ( not ( = ?auto_17922 ?auto_17920 ) ) ( not ( = ?auto_17922 ?auto_17904 ) ) ( not ( = ?auto_17922 ?auto_17917 ) ) ( not ( = ?auto_17922 ?auto_17897 ) ) ( not ( = ?auto_17922 ?auto_17907 ) ) ( not ( = ?auto_17922 ?auto_17900 ) ) ( not ( = ?auto_17922 ?auto_17918 ) ) ( not ( = ?auto_17922 ?auto_17911 ) ) ( not ( = ?auto_17922 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17883 ) ) ( not ( = ?auto_17870 ?auto_17889 ) ) ( not ( = ?auto_17871 ?auto_17883 ) ) ( not ( = ?auto_17871 ?auto_17889 ) ) ( not ( = ?auto_17872 ?auto_17883 ) ) ( not ( = ?auto_17872 ?auto_17889 ) ) ( not ( = ?auto_17873 ?auto_17883 ) ) ( not ( = ?auto_17873 ?auto_17889 ) ) ( not ( = ?auto_17874 ?auto_17883 ) ) ( not ( = ?auto_17874 ?auto_17889 ) ) ( not ( = ?auto_17875 ?auto_17883 ) ) ( not ( = ?auto_17875 ?auto_17889 ) ) ( not ( = ?auto_17876 ?auto_17883 ) ) ( not ( = ?auto_17876 ?auto_17889 ) ) ( not ( = ?auto_17877 ?auto_17883 ) ) ( not ( = ?auto_17877 ?auto_17889 ) ) ( not ( = ?auto_17878 ?auto_17883 ) ) ( not ( = ?auto_17878 ?auto_17889 ) ) ( not ( = ?auto_17879 ?auto_17883 ) ) ( not ( = ?auto_17879 ?auto_17889 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17889 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17889 ) ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17889 ) ) ( not ( = ?auto_17883 ?auto_17922 ) ) ( not ( = ?auto_17883 ?auto_17901 ) ) ( not ( = ?auto_17883 ?auto_17895 ) ) ( not ( = ?auto_17883 ?auto_17910 ) ) ( not ( = ?auto_17883 ?auto_17920 ) ) ( not ( = ?auto_17883 ?auto_17904 ) ) ( not ( = ?auto_17883 ?auto_17917 ) ) ( not ( = ?auto_17883 ?auto_17897 ) ) ( not ( = ?auto_17883 ?auto_17907 ) ) ( not ( = ?auto_17883 ?auto_17900 ) ) ( not ( = ?auto_17883 ?auto_17918 ) ) ( not ( = ?auto_17883 ?auto_17911 ) ) ( not ( = ?auto_17883 ?auto_17912 ) ) ( not ( = ?auto_17890 ?auto_17899 ) ) ( not ( = ?auto_17890 ?auto_17893 ) ) ( not ( = ?auto_17890 ?auto_17906 ) ) ( not ( = ?auto_17890 ?auto_17894 ) ) ( not ( = ?auto_17890 ?auto_17921 ) ) ( not ( = ?auto_17890 ?auto_17909 ) ) ( not ( = ?auto_17890 ?auto_17896 ) ) ( not ( = ?auto_17890 ?auto_17923 ) ) ( not ( = ?auto_17890 ?auto_17913 ) ) ( not ( = ?auto_17890 ?auto_17903 ) ) ( not ( = ?auto_17890 ?auto_17891 ) ) ( not ( = ?auto_17888 ?auto_17919 ) ) ( not ( = ?auto_17888 ?auto_17902 ) ) ( not ( = ?auto_17888 ?auto_17905 ) ) ( not ( = ?auto_17888 ?auto_17924 ) ) ( not ( = ?auto_17888 ?auto_17925 ) ) ( not ( = ?auto_17888 ?auto_17915 ) ) ( not ( = ?auto_17888 ?auto_17908 ) ) ( not ( = ?auto_17888 ?auto_17916 ) ) ( not ( = ?auto_17888 ?auto_17892 ) ) ( not ( = ?auto_17888 ?auto_17898 ) ) ( not ( = ?auto_17888 ?auto_17914 ) ) ( not ( = ?auto_17889 ?auto_17922 ) ) ( not ( = ?auto_17889 ?auto_17901 ) ) ( not ( = ?auto_17889 ?auto_17895 ) ) ( not ( = ?auto_17889 ?auto_17910 ) ) ( not ( = ?auto_17889 ?auto_17920 ) ) ( not ( = ?auto_17889 ?auto_17904 ) ) ( not ( = ?auto_17889 ?auto_17917 ) ) ( not ( = ?auto_17889 ?auto_17897 ) ) ( not ( = ?auto_17889 ?auto_17907 ) ) ( not ( = ?auto_17889 ?auto_17900 ) ) ( not ( = ?auto_17889 ?auto_17918 ) ) ( not ( = ?auto_17889 ?auto_17911 ) ) ( not ( = ?auto_17889 ?auto_17912 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17870 ?auto_17871 ?auto_17872 ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ?auto_17877 ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17884 )
      ( MAKE-1CRATE ?auto_17884 ?auto_17883 )
      ( MAKE-14CRATE-VERIFY ?auto_17870 ?auto_17871 ?auto_17872 ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ?auto_17877 ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17884 ?auto_17883 ) )
  )

)

