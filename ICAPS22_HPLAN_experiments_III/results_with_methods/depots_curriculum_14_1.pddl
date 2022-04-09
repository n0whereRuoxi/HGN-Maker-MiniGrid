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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17237 - SURFACE
      ?auto_17238 - SURFACE
    )
    :vars
    (
      ?auto_17239 - HOIST
      ?auto_17240 - PLACE
      ?auto_17242 - PLACE
      ?auto_17243 - HOIST
      ?auto_17244 - SURFACE
      ?auto_17241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17239 ?auto_17240 ) ( SURFACE-AT ?auto_17237 ?auto_17240 ) ( CLEAR ?auto_17237 ) ( IS-CRATE ?auto_17238 ) ( AVAILABLE ?auto_17239 ) ( not ( = ?auto_17242 ?auto_17240 ) ) ( HOIST-AT ?auto_17243 ?auto_17242 ) ( AVAILABLE ?auto_17243 ) ( SURFACE-AT ?auto_17238 ?auto_17242 ) ( ON ?auto_17238 ?auto_17244 ) ( CLEAR ?auto_17238 ) ( TRUCK-AT ?auto_17241 ?auto_17240 ) ( not ( = ?auto_17237 ?auto_17238 ) ) ( not ( = ?auto_17237 ?auto_17244 ) ) ( not ( = ?auto_17238 ?auto_17244 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17241 ?auto_17240 ?auto_17242 )
      ( !LIFT ?auto_17243 ?auto_17238 ?auto_17244 ?auto_17242 )
      ( !LOAD ?auto_17243 ?auto_17238 ?auto_17241 ?auto_17242 )
      ( !DRIVE ?auto_17241 ?auto_17242 ?auto_17240 )
      ( !UNLOAD ?auto_17239 ?auto_17238 ?auto_17241 ?auto_17240 )
      ( !DROP ?auto_17239 ?auto_17238 ?auto_17237 ?auto_17240 )
      ( MAKE-1CRATE-VERIFY ?auto_17237 ?auto_17238 ) )
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
      ?auto_17253 - PLACE
      ?auto_17252 - HOIST
      ?auto_17251 - SURFACE
      ?auto_17258 - PLACE
      ?auto_17259 - HOIST
      ?auto_17257 - SURFACE
      ?auto_17254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17256 ?auto_17255 ) ( IS-CRATE ?auto_17250 ) ( not ( = ?auto_17253 ?auto_17255 ) ) ( HOIST-AT ?auto_17252 ?auto_17253 ) ( AVAILABLE ?auto_17252 ) ( SURFACE-AT ?auto_17250 ?auto_17253 ) ( ON ?auto_17250 ?auto_17251 ) ( CLEAR ?auto_17250 ) ( not ( = ?auto_17249 ?auto_17250 ) ) ( not ( = ?auto_17249 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17251 ) ) ( not ( = ?auto_17256 ?auto_17252 ) ) ( SURFACE-AT ?auto_17248 ?auto_17255 ) ( CLEAR ?auto_17248 ) ( IS-CRATE ?auto_17249 ) ( AVAILABLE ?auto_17256 ) ( not ( = ?auto_17258 ?auto_17255 ) ) ( HOIST-AT ?auto_17259 ?auto_17258 ) ( AVAILABLE ?auto_17259 ) ( SURFACE-AT ?auto_17249 ?auto_17258 ) ( ON ?auto_17249 ?auto_17257 ) ( CLEAR ?auto_17249 ) ( TRUCK-AT ?auto_17254 ?auto_17255 ) ( not ( = ?auto_17248 ?auto_17249 ) ) ( not ( = ?auto_17248 ?auto_17257 ) ) ( not ( = ?auto_17249 ?auto_17257 ) ) ( not ( = ?auto_17256 ?auto_17259 ) ) ( not ( = ?auto_17248 ?auto_17250 ) ) ( not ( = ?auto_17248 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17257 ) ) ( not ( = ?auto_17253 ?auto_17258 ) ) ( not ( = ?auto_17252 ?auto_17259 ) ) ( not ( = ?auto_17251 ?auto_17257 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17248 ?auto_17249 )
      ( MAKE-1CRATE ?auto_17249 ?auto_17250 )
      ( MAKE-2CRATE-VERIFY ?auto_17248 ?auto_17249 ?auto_17250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17262 - SURFACE
      ?auto_17263 - SURFACE
    )
    :vars
    (
      ?auto_17264 - HOIST
      ?auto_17265 - PLACE
      ?auto_17267 - PLACE
      ?auto_17268 - HOIST
      ?auto_17269 - SURFACE
      ?auto_17266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17264 ?auto_17265 ) ( SURFACE-AT ?auto_17262 ?auto_17265 ) ( CLEAR ?auto_17262 ) ( IS-CRATE ?auto_17263 ) ( AVAILABLE ?auto_17264 ) ( not ( = ?auto_17267 ?auto_17265 ) ) ( HOIST-AT ?auto_17268 ?auto_17267 ) ( AVAILABLE ?auto_17268 ) ( SURFACE-AT ?auto_17263 ?auto_17267 ) ( ON ?auto_17263 ?auto_17269 ) ( CLEAR ?auto_17263 ) ( TRUCK-AT ?auto_17266 ?auto_17265 ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17269 ) ) ( not ( = ?auto_17263 ?auto_17269 ) ) ( not ( = ?auto_17264 ?auto_17268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17266 ?auto_17265 ?auto_17267 )
      ( !LIFT ?auto_17268 ?auto_17263 ?auto_17269 ?auto_17267 )
      ( !LOAD ?auto_17268 ?auto_17263 ?auto_17266 ?auto_17267 )
      ( !DRIVE ?auto_17266 ?auto_17267 ?auto_17265 )
      ( !UNLOAD ?auto_17264 ?auto_17263 ?auto_17266 ?auto_17265 )
      ( !DROP ?auto_17264 ?auto_17263 ?auto_17262 ?auto_17265 )
      ( MAKE-1CRATE-VERIFY ?auto_17262 ?auto_17263 ) )
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
      ?auto_17279 - HOIST
      ?auto_17281 - PLACE
      ?auto_17282 - PLACE
      ?auto_17283 - HOIST
      ?auto_17280 - SURFACE
      ?auto_17285 - PLACE
      ?auto_17287 - HOIST
      ?auto_17289 - SURFACE
      ?auto_17288 - PLACE
      ?auto_17284 - HOIST
      ?auto_17286 - SURFACE
      ?auto_17278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17279 ?auto_17281 ) ( IS-CRATE ?auto_17277 ) ( not ( = ?auto_17282 ?auto_17281 ) ) ( HOIST-AT ?auto_17283 ?auto_17282 ) ( AVAILABLE ?auto_17283 ) ( SURFACE-AT ?auto_17277 ?auto_17282 ) ( ON ?auto_17277 ?auto_17280 ) ( CLEAR ?auto_17277 ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( not ( = ?auto_17276 ?auto_17280 ) ) ( not ( = ?auto_17277 ?auto_17280 ) ) ( not ( = ?auto_17279 ?auto_17283 ) ) ( IS-CRATE ?auto_17276 ) ( not ( = ?auto_17285 ?auto_17281 ) ) ( HOIST-AT ?auto_17287 ?auto_17285 ) ( AVAILABLE ?auto_17287 ) ( SURFACE-AT ?auto_17276 ?auto_17285 ) ( ON ?auto_17276 ?auto_17289 ) ( CLEAR ?auto_17276 ) ( not ( = ?auto_17275 ?auto_17276 ) ) ( not ( = ?auto_17275 ?auto_17289 ) ) ( not ( = ?auto_17276 ?auto_17289 ) ) ( not ( = ?auto_17279 ?auto_17287 ) ) ( SURFACE-AT ?auto_17274 ?auto_17281 ) ( CLEAR ?auto_17274 ) ( IS-CRATE ?auto_17275 ) ( AVAILABLE ?auto_17279 ) ( not ( = ?auto_17288 ?auto_17281 ) ) ( HOIST-AT ?auto_17284 ?auto_17288 ) ( AVAILABLE ?auto_17284 ) ( SURFACE-AT ?auto_17275 ?auto_17288 ) ( ON ?auto_17275 ?auto_17286 ) ( CLEAR ?auto_17275 ) ( TRUCK-AT ?auto_17278 ?auto_17281 ) ( not ( = ?auto_17274 ?auto_17275 ) ) ( not ( = ?auto_17274 ?auto_17286 ) ) ( not ( = ?auto_17275 ?auto_17286 ) ) ( not ( = ?auto_17279 ?auto_17284 ) ) ( not ( = ?auto_17274 ?auto_17276 ) ) ( not ( = ?auto_17274 ?auto_17289 ) ) ( not ( = ?auto_17276 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17287 ?auto_17284 ) ) ( not ( = ?auto_17289 ?auto_17286 ) ) ( not ( = ?auto_17274 ?auto_17277 ) ) ( not ( = ?auto_17274 ?auto_17280 ) ) ( not ( = ?auto_17275 ?auto_17277 ) ) ( not ( = ?auto_17275 ?auto_17280 ) ) ( not ( = ?auto_17277 ?auto_17289 ) ) ( not ( = ?auto_17277 ?auto_17286 ) ) ( not ( = ?auto_17282 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17280 ?auto_17289 ) ) ( not ( = ?auto_17280 ?auto_17286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17274 ?auto_17275 ?auto_17276 )
      ( MAKE-1CRATE ?auto_17276 ?auto_17277 )
      ( MAKE-3CRATE-VERIFY ?auto_17274 ?auto_17275 ?auto_17276 ?auto_17277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17292 - SURFACE
      ?auto_17293 - SURFACE
    )
    :vars
    (
      ?auto_17294 - HOIST
      ?auto_17295 - PLACE
      ?auto_17297 - PLACE
      ?auto_17298 - HOIST
      ?auto_17299 - SURFACE
      ?auto_17296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17294 ?auto_17295 ) ( SURFACE-AT ?auto_17292 ?auto_17295 ) ( CLEAR ?auto_17292 ) ( IS-CRATE ?auto_17293 ) ( AVAILABLE ?auto_17294 ) ( not ( = ?auto_17297 ?auto_17295 ) ) ( HOIST-AT ?auto_17298 ?auto_17297 ) ( AVAILABLE ?auto_17298 ) ( SURFACE-AT ?auto_17293 ?auto_17297 ) ( ON ?auto_17293 ?auto_17299 ) ( CLEAR ?auto_17293 ) ( TRUCK-AT ?auto_17296 ?auto_17295 ) ( not ( = ?auto_17292 ?auto_17293 ) ) ( not ( = ?auto_17292 ?auto_17299 ) ) ( not ( = ?auto_17293 ?auto_17299 ) ) ( not ( = ?auto_17294 ?auto_17298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17296 ?auto_17295 ?auto_17297 )
      ( !LIFT ?auto_17298 ?auto_17293 ?auto_17299 ?auto_17297 )
      ( !LOAD ?auto_17298 ?auto_17293 ?auto_17296 ?auto_17297 )
      ( !DRIVE ?auto_17296 ?auto_17297 ?auto_17295 )
      ( !UNLOAD ?auto_17294 ?auto_17293 ?auto_17296 ?auto_17295 )
      ( !DROP ?auto_17294 ?auto_17293 ?auto_17292 ?auto_17295 )
      ( MAKE-1CRATE-VERIFY ?auto_17292 ?auto_17293 ) )
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
      ?auto_17313 - PLACE
      ?auto_17315 - PLACE
      ?auto_17314 - HOIST
      ?auto_17312 - SURFACE
      ?auto_17319 - PLACE
      ?auto_17317 - HOIST
      ?auto_17316 - SURFACE
      ?auto_17322 - PLACE
      ?auto_17324 - HOIST
      ?auto_17320 - SURFACE
      ?auto_17321 - PLACE
      ?auto_17318 - HOIST
      ?auto_17323 - SURFACE
      ?auto_17311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17310 ?auto_17313 ) ( IS-CRATE ?auto_17309 ) ( not ( = ?auto_17315 ?auto_17313 ) ) ( HOIST-AT ?auto_17314 ?auto_17315 ) ( AVAILABLE ?auto_17314 ) ( SURFACE-AT ?auto_17309 ?auto_17315 ) ( ON ?auto_17309 ?auto_17312 ) ( CLEAR ?auto_17309 ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17308 ?auto_17312 ) ) ( not ( = ?auto_17309 ?auto_17312 ) ) ( not ( = ?auto_17310 ?auto_17314 ) ) ( IS-CRATE ?auto_17308 ) ( not ( = ?auto_17319 ?auto_17313 ) ) ( HOIST-AT ?auto_17317 ?auto_17319 ) ( AVAILABLE ?auto_17317 ) ( SURFACE-AT ?auto_17308 ?auto_17319 ) ( ON ?auto_17308 ?auto_17316 ) ( CLEAR ?auto_17308 ) ( not ( = ?auto_17307 ?auto_17308 ) ) ( not ( = ?auto_17307 ?auto_17316 ) ) ( not ( = ?auto_17308 ?auto_17316 ) ) ( not ( = ?auto_17310 ?auto_17317 ) ) ( IS-CRATE ?auto_17307 ) ( not ( = ?auto_17322 ?auto_17313 ) ) ( HOIST-AT ?auto_17324 ?auto_17322 ) ( AVAILABLE ?auto_17324 ) ( SURFACE-AT ?auto_17307 ?auto_17322 ) ( ON ?auto_17307 ?auto_17320 ) ( CLEAR ?auto_17307 ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17320 ) ) ( not ( = ?auto_17307 ?auto_17320 ) ) ( not ( = ?auto_17310 ?auto_17324 ) ) ( SURFACE-AT ?auto_17305 ?auto_17313 ) ( CLEAR ?auto_17305 ) ( IS-CRATE ?auto_17306 ) ( AVAILABLE ?auto_17310 ) ( not ( = ?auto_17321 ?auto_17313 ) ) ( HOIST-AT ?auto_17318 ?auto_17321 ) ( AVAILABLE ?auto_17318 ) ( SURFACE-AT ?auto_17306 ?auto_17321 ) ( ON ?auto_17306 ?auto_17323 ) ( CLEAR ?auto_17306 ) ( TRUCK-AT ?auto_17311 ?auto_17313 ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17305 ?auto_17323 ) ) ( not ( = ?auto_17306 ?auto_17323 ) ) ( not ( = ?auto_17310 ?auto_17318 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17320 ) ) ( not ( = ?auto_17307 ?auto_17323 ) ) ( not ( = ?auto_17322 ?auto_17321 ) ) ( not ( = ?auto_17324 ?auto_17318 ) ) ( not ( = ?auto_17320 ?auto_17323 ) ) ( not ( = ?auto_17305 ?auto_17308 ) ) ( not ( = ?auto_17305 ?auto_17316 ) ) ( not ( = ?auto_17306 ?auto_17308 ) ) ( not ( = ?auto_17306 ?auto_17316 ) ) ( not ( = ?auto_17308 ?auto_17320 ) ) ( not ( = ?auto_17308 ?auto_17323 ) ) ( not ( = ?auto_17319 ?auto_17322 ) ) ( not ( = ?auto_17319 ?auto_17321 ) ) ( not ( = ?auto_17317 ?auto_17324 ) ) ( not ( = ?auto_17317 ?auto_17318 ) ) ( not ( = ?auto_17316 ?auto_17320 ) ) ( not ( = ?auto_17316 ?auto_17323 ) ) ( not ( = ?auto_17305 ?auto_17309 ) ) ( not ( = ?auto_17305 ?auto_17312 ) ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17306 ?auto_17312 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17312 ) ) ( not ( = ?auto_17309 ?auto_17316 ) ) ( not ( = ?auto_17309 ?auto_17320 ) ) ( not ( = ?auto_17309 ?auto_17323 ) ) ( not ( = ?auto_17315 ?auto_17319 ) ) ( not ( = ?auto_17315 ?auto_17322 ) ) ( not ( = ?auto_17315 ?auto_17321 ) ) ( not ( = ?auto_17314 ?auto_17317 ) ) ( not ( = ?auto_17314 ?auto_17324 ) ) ( not ( = ?auto_17314 ?auto_17318 ) ) ( not ( = ?auto_17312 ?auto_17316 ) ) ( not ( = ?auto_17312 ?auto_17320 ) ) ( not ( = ?auto_17312 ?auto_17323 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 )
      ( MAKE-1CRATE ?auto_17308 ?auto_17309 )
      ( MAKE-4CRATE-VERIFY ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 ?auto_17309 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17327 - SURFACE
      ?auto_17328 - SURFACE
    )
    :vars
    (
      ?auto_17329 - HOIST
      ?auto_17330 - PLACE
      ?auto_17332 - PLACE
      ?auto_17333 - HOIST
      ?auto_17334 - SURFACE
      ?auto_17331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17329 ?auto_17330 ) ( SURFACE-AT ?auto_17327 ?auto_17330 ) ( CLEAR ?auto_17327 ) ( IS-CRATE ?auto_17328 ) ( AVAILABLE ?auto_17329 ) ( not ( = ?auto_17332 ?auto_17330 ) ) ( HOIST-AT ?auto_17333 ?auto_17332 ) ( AVAILABLE ?auto_17333 ) ( SURFACE-AT ?auto_17328 ?auto_17332 ) ( ON ?auto_17328 ?auto_17334 ) ( CLEAR ?auto_17328 ) ( TRUCK-AT ?auto_17331 ?auto_17330 ) ( not ( = ?auto_17327 ?auto_17328 ) ) ( not ( = ?auto_17327 ?auto_17334 ) ) ( not ( = ?auto_17328 ?auto_17334 ) ) ( not ( = ?auto_17329 ?auto_17333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17331 ?auto_17330 ?auto_17332 )
      ( !LIFT ?auto_17333 ?auto_17328 ?auto_17334 ?auto_17332 )
      ( !LOAD ?auto_17333 ?auto_17328 ?auto_17331 ?auto_17332 )
      ( !DRIVE ?auto_17331 ?auto_17332 ?auto_17330 )
      ( !UNLOAD ?auto_17329 ?auto_17328 ?auto_17331 ?auto_17330 )
      ( !DROP ?auto_17329 ?auto_17328 ?auto_17327 ?auto_17330 )
      ( MAKE-1CRATE-VERIFY ?auto_17327 ?auto_17328 ) )
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
      ?auto_17347 - PLACE
      ?auto_17350 - PLACE
      ?auto_17351 - HOIST
      ?auto_17349 - SURFACE
      ?auto_17360 - PLACE
      ?auto_17353 - HOIST
      ?auto_17359 - SURFACE
      ?auto_17362 - PLACE
      ?auto_17354 - HOIST
      ?auto_17356 - SURFACE
      ?auto_17361 - SURFACE
      ?auto_17358 - PLACE
      ?auto_17355 - HOIST
      ?auto_17357 - SURFACE
      ?auto_17352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17348 ?auto_17347 ) ( IS-CRATE ?auto_17346 ) ( not ( = ?auto_17350 ?auto_17347 ) ) ( HOIST-AT ?auto_17351 ?auto_17350 ) ( SURFACE-AT ?auto_17346 ?auto_17350 ) ( ON ?auto_17346 ?auto_17349 ) ( CLEAR ?auto_17346 ) ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17349 ) ) ( not ( = ?auto_17346 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17351 ) ) ( IS-CRATE ?auto_17345 ) ( not ( = ?auto_17360 ?auto_17347 ) ) ( HOIST-AT ?auto_17353 ?auto_17360 ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17345 ?auto_17360 ) ( ON ?auto_17345 ?auto_17359 ) ( CLEAR ?auto_17345 ) ( not ( = ?auto_17344 ?auto_17345 ) ) ( not ( = ?auto_17344 ?auto_17359 ) ) ( not ( = ?auto_17345 ?auto_17359 ) ) ( not ( = ?auto_17348 ?auto_17353 ) ) ( IS-CRATE ?auto_17344 ) ( not ( = ?auto_17362 ?auto_17347 ) ) ( HOIST-AT ?auto_17354 ?auto_17362 ) ( AVAILABLE ?auto_17354 ) ( SURFACE-AT ?auto_17344 ?auto_17362 ) ( ON ?auto_17344 ?auto_17356 ) ( CLEAR ?auto_17344 ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17343 ?auto_17356 ) ) ( not ( = ?auto_17344 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17354 ) ) ( IS-CRATE ?auto_17343 ) ( AVAILABLE ?auto_17351 ) ( SURFACE-AT ?auto_17343 ?auto_17350 ) ( ON ?auto_17343 ?auto_17361 ) ( CLEAR ?auto_17343 ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( not ( = ?auto_17342 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17361 ) ) ( SURFACE-AT ?auto_17341 ?auto_17347 ) ( CLEAR ?auto_17341 ) ( IS-CRATE ?auto_17342 ) ( AVAILABLE ?auto_17348 ) ( not ( = ?auto_17358 ?auto_17347 ) ) ( HOIST-AT ?auto_17355 ?auto_17358 ) ( AVAILABLE ?auto_17355 ) ( SURFACE-AT ?auto_17342 ?auto_17358 ) ( ON ?auto_17342 ?auto_17357 ) ( CLEAR ?auto_17342 ) ( TRUCK-AT ?auto_17352 ?auto_17347 ) ( not ( = ?auto_17341 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17357 ) ) ( not ( = ?auto_17342 ?auto_17357 ) ) ( not ( = ?auto_17348 ?auto_17355 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( not ( = ?auto_17341 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17357 ) ) ( not ( = ?auto_17350 ?auto_17358 ) ) ( not ( = ?auto_17351 ?auto_17355 ) ) ( not ( = ?auto_17361 ?auto_17357 ) ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( not ( = ?auto_17341 ?auto_17356 ) ) ( not ( = ?auto_17342 ?auto_17344 ) ) ( not ( = ?auto_17342 ?auto_17356 ) ) ( not ( = ?auto_17344 ?auto_17361 ) ) ( not ( = ?auto_17344 ?auto_17357 ) ) ( not ( = ?auto_17362 ?auto_17350 ) ) ( not ( = ?auto_17362 ?auto_17358 ) ) ( not ( = ?auto_17354 ?auto_17351 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17356 ?auto_17361 ) ) ( not ( = ?auto_17356 ?auto_17357 ) ) ( not ( = ?auto_17341 ?auto_17345 ) ) ( not ( = ?auto_17341 ?auto_17359 ) ) ( not ( = ?auto_17342 ?auto_17345 ) ) ( not ( = ?auto_17342 ?auto_17359 ) ) ( not ( = ?auto_17343 ?auto_17345 ) ) ( not ( = ?auto_17343 ?auto_17359 ) ) ( not ( = ?auto_17345 ?auto_17356 ) ) ( not ( = ?auto_17345 ?auto_17361 ) ) ( not ( = ?auto_17345 ?auto_17357 ) ) ( not ( = ?auto_17360 ?auto_17362 ) ) ( not ( = ?auto_17360 ?auto_17350 ) ) ( not ( = ?auto_17360 ?auto_17358 ) ) ( not ( = ?auto_17353 ?auto_17354 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( not ( = ?auto_17353 ?auto_17355 ) ) ( not ( = ?auto_17359 ?auto_17356 ) ) ( not ( = ?auto_17359 ?auto_17361 ) ) ( not ( = ?auto_17359 ?auto_17357 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17341 ?auto_17349 ) ) ( not ( = ?auto_17342 ?auto_17346 ) ) ( not ( = ?auto_17342 ?auto_17349 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17349 ) ) ( not ( = ?auto_17344 ?auto_17346 ) ) ( not ( = ?auto_17344 ?auto_17349 ) ) ( not ( = ?auto_17346 ?auto_17359 ) ) ( not ( = ?auto_17346 ?auto_17356 ) ) ( not ( = ?auto_17346 ?auto_17361 ) ) ( not ( = ?auto_17346 ?auto_17357 ) ) ( not ( = ?auto_17349 ?auto_17359 ) ) ( not ( = ?auto_17349 ?auto_17356 ) ) ( not ( = ?auto_17349 ?auto_17361 ) ) ( not ( = ?auto_17349 ?auto_17357 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17341 ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 )
      ( MAKE-1CRATE ?auto_17345 ?auto_17346 )
      ( MAKE-5CRATE-VERIFY ?auto_17341 ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 ?auto_17346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17365 - SURFACE
      ?auto_17366 - SURFACE
    )
    :vars
    (
      ?auto_17367 - HOIST
      ?auto_17368 - PLACE
      ?auto_17370 - PLACE
      ?auto_17371 - HOIST
      ?auto_17372 - SURFACE
      ?auto_17369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17367 ?auto_17368 ) ( SURFACE-AT ?auto_17365 ?auto_17368 ) ( CLEAR ?auto_17365 ) ( IS-CRATE ?auto_17366 ) ( AVAILABLE ?auto_17367 ) ( not ( = ?auto_17370 ?auto_17368 ) ) ( HOIST-AT ?auto_17371 ?auto_17370 ) ( AVAILABLE ?auto_17371 ) ( SURFACE-AT ?auto_17366 ?auto_17370 ) ( ON ?auto_17366 ?auto_17372 ) ( CLEAR ?auto_17366 ) ( TRUCK-AT ?auto_17369 ?auto_17368 ) ( not ( = ?auto_17365 ?auto_17366 ) ) ( not ( = ?auto_17365 ?auto_17372 ) ) ( not ( = ?auto_17366 ?auto_17372 ) ) ( not ( = ?auto_17367 ?auto_17371 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17369 ?auto_17368 ?auto_17370 )
      ( !LIFT ?auto_17371 ?auto_17366 ?auto_17372 ?auto_17370 )
      ( !LOAD ?auto_17371 ?auto_17366 ?auto_17369 ?auto_17370 )
      ( !DRIVE ?auto_17369 ?auto_17370 ?auto_17368 )
      ( !UNLOAD ?auto_17367 ?auto_17366 ?auto_17369 ?auto_17368 )
      ( !DROP ?auto_17367 ?auto_17366 ?auto_17365 ?auto_17368 )
      ( MAKE-1CRATE-VERIFY ?auto_17365 ?auto_17366 ) )
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
      ?auto_17388 - HOIST
      ?auto_17391 - PLACE
      ?auto_17392 - PLACE
      ?auto_17390 - HOIST
      ?auto_17389 - SURFACE
      ?auto_17402 - PLACE
      ?auto_17401 - HOIST
      ?auto_17403 - SURFACE
      ?auto_17395 - PLACE
      ?auto_17405 - HOIST
      ?auto_17396 - SURFACE
      ?auto_17394 - PLACE
      ?auto_17393 - HOIST
      ?auto_17399 - SURFACE
      ?auto_17398 - SURFACE
      ?auto_17397 - PLACE
      ?auto_17404 - HOIST
      ?auto_17400 - SURFACE
      ?auto_17387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17388 ?auto_17391 ) ( IS-CRATE ?auto_17386 ) ( not ( = ?auto_17392 ?auto_17391 ) ) ( HOIST-AT ?auto_17390 ?auto_17392 ) ( AVAILABLE ?auto_17390 ) ( SURFACE-AT ?auto_17386 ?auto_17392 ) ( ON ?auto_17386 ?auto_17389 ) ( CLEAR ?auto_17386 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( IS-CRATE ?auto_17385 ) ( not ( = ?auto_17402 ?auto_17391 ) ) ( HOIST-AT ?auto_17401 ?auto_17402 ) ( SURFACE-AT ?auto_17385 ?auto_17402 ) ( ON ?auto_17385 ?auto_17403 ) ( CLEAR ?auto_17385 ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17403 ) ) ( not ( = ?auto_17385 ?auto_17403 ) ) ( not ( = ?auto_17388 ?auto_17401 ) ) ( IS-CRATE ?auto_17384 ) ( not ( = ?auto_17395 ?auto_17391 ) ) ( HOIST-AT ?auto_17405 ?auto_17395 ) ( AVAILABLE ?auto_17405 ) ( SURFACE-AT ?auto_17384 ?auto_17395 ) ( ON ?auto_17384 ?auto_17396 ) ( CLEAR ?auto_17384 ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17396 ) ) ( not ( = ?auto_17384 ?auto_17396 ) ) ( not ( = ?auto_17388 ?auto_17405 ) ) ( IS-CRATE ?auto_17383 ) ( not ( = ?auto_17394 ?auto_17391 ) ) ( HOIST-AT ?auto_17393 ?auto_17394 ) ( AVAILABLE ?auto_17393 ) ( SURFACE-AT ?auto_17383 ?auto_17394 ) ( ON ?auto_17383 ?auto_17399 ) ( CLEAR ?auto_17383 ) ( not ( = ?auto_17382 ?auto_17383 ) ) ( not ( = ?auto_17382 ?auto_17399 ) ) ( not ( = ?auto_17383 ?auto_17399 ) ) ( not ( = ?auto_17388 ?auto_17393 ) ) ( IS-CRATE ?auto_17382 ) ( AVAILABLE ?auto_17401 ) ( SURFACE-AT ?auto_17382 ?auto_17402 ) ( ON ?auto_17382 ?auto_17398 ) ( CLEAR ?auto_17382 ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17381 ?auto_17398 ) ) ( not ( = ?auto_17382 ?auto_17398 ) ) ( SURFACE-AT ?auto_17380 ?auto_17391 ) ( CLEAR ?auto_17380 ) ( IS-CRATE ?auto_17381 ) ( AVAILABLE ?auto_17388 ) ( not ( = ?auto_17397 ?auto_17391 ) ) ( HOIST-AT ?auto_17404 ?auto_17397 ) ( AVAILABLE ?auto_17404 ) ( SURFACE-AT ?auto_17381 ?auto_17397 ) ( ON ?auto_17381 ?auto_17400 ) ( CLEAR ?auto_17381 ) ( TRUCK-AT ?auto_17387 ?auto_17391 ) ( not ( = ?auto_17380 ?auto_17381 ) ) ( not ( = ?auto_17380 ?auto_17400 ) ) ( not ( = ?auto_17381 ?auto_17400 ) ) ( not ( = ?auto_17388 ?auto_17404 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17398 ) ) ( not ( = ?auto_17382 ?auto_17400 ) ) ( not ( = ?auto_17402 ?auto_17397 ) ) ( not ( = ?auto_17401 ?auto_17404 ) ) ( not ( = ?auto_17398 ?auto_17400 ) ) ( not ( = ?auto_17380 ?auto_17383 ) ) ( not ( = ?auto_17380 ?auto_17399 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17399 ) ) ( not ( = ?auto_17383 ?auto_17398 ) ) ( not ( = ?auto_17383 ?auto_17400 ) ) ( not ( = ?auto_17394 ?auto_17402 ) ) ( not ( = ?auto_17394 ?auto_17397 ) ) ( not ( = ?auto_17393 ?auto_17401 ) ) ( not ( = ?auto_17393 ?auto_17404 ) ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( not ( = ?auto_17399 ?auto_17400 ) ) ( not ( = ?auto_17380 ?auto_17384 ) ) ( not ( = ?auto_17380 ?auto_17396 ) ) ( not ( = ?auto_17381 ?auto_17384 ) ) ( not ( = ?auto_17381 ?auto_17396 ) ) ( not ( = ?auto_17382 ?auto_17384 ) ) ( not ( = ?auto_17382 ?auto_17396 ) ) ( not ( = ?auto_17384 ?auto_17399 ) ) ( not ( = ?auto_17384 ?auto_17398 ) ) ( not ( = ?auto_17384 ?auto_17400 ) ) ( not ( = ?auto_17395 ?auto_17394 ) ) ( not ( = ?auto_17395 ?auto_17402 ) ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( not ( = ?auto_17405 ?auto_17393 ) ) ( not ( = ?auto_17405 ?auto_17401 ) ) ( not ( = ?auto_17405 ?auto_17404 ) ) ( not ( = ?auto_17396 ?auto_17399 ) ) ( not ( = ?auto_17396 ?auto_17398 ) ) ( not ( = ?auto_17396 ?auto_17400 ) ) ( not ( = ?auto_17380 ?auto_17385 ) ) ( not ( = ?auto_17380 ?auto_17403 ) ) ( not ( = ?auto_17381 ?auto_17385 ) ) ( not ( = ?auto_17381 ?auto_17403 ) ) ( not ( = ?auto_17382 ?auto_17385 ) ) ( not ( = ?auto_17382 ?auto_17403 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17403 ) ) ( not ( = ?auto_17385 ?auto_17396 ) ) ( not ( = ?auto_17385 ?auto_17399 ) ) ( not ( = ?auto_17385 ?auto_17398 ) ) ( not ( = ?auto_17385 ?auto_17400 ) ) ( not ( = ?auto_17403 ?auto_17396 ) ) ( not ( = ?auto_17403 ?auto_17399 ) ) ( not ( = ?auto_17403 ?auto_17398 ) ) ( not ( = ?auto_17403 ?auto_17400 ) ) ( not ( = ?auto_17380 ?auto_17386 ) ) ( not ( = ?auto_17380 ?auto_17389 ) ) ( not ( = ?auto_17381 ?auto_17386 ) ) ( not ( = ?auto_17381 ?auto_17389 ) ) ( not ( = ?auto_17382 ?auto_17386 ) ) ( not ( = ?auto_17382 ?auto_17389 ) ) ( not ( = ?auto_17383 ?auto_17386 ) ) ( not ( = ?auto_17383 ?auto_17389 ) ) ( not ( = ?auto_17384 ?auto_17386 ) ) ( not ( = ?auto_17384 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17403 ) ) ( not ( = ?auto_17386 ?auto_17396 ) ) ( not ( = ?auto_17386 ?auto_17399 ) ) ( not ( = ?auto_17386 ?auto_17398 ) ) ( not ( = ?auto_17386 ?auto_17400 ) ) ( not ( = ?auto_17392 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17395 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17397 ) ) ( not ( = ?auto_17390 ?auto_17401 ) ) ( not ( = ?auto_17390 ?auto_17405 ) ) ( not ( = ?auto_17390 ?auto_17393 ) ) ( not ( = ?auto_17390 ?auto_17404 ) ) ( not ( = ?auto_17389 ?auto_17403 ) ) ( not ( = ?auto_17389 ?auto_17396 ) ) ( not ( = ?auto_17389 ?auto_17399 ) ) ( not ( = ?auto_17389 ?auto_17398 ) ) ( not ( = ?auto_17389 ?auto_17400 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 ?auto_17384 ?auto_17385 )
      ( MAKE-1CRATE ?auto_17385 ?auto_17386 )
      ( MAKE-6CRATE-VERIFY ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17408 - SURFACE
      ?auto_17409 - SURFACE
    )
    :vars
    (
      ?auto_17410 - HOIST
      ?auto_17411 - PLACE
      ?auto_17413 - PLACE
      ?auto_17414 - HOIST
      ?auto_17415 - SURFACE
      ?auto_17412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17410 ?auto_17411 ) ( SURFACE-AT ?auto_17408 ?auto_17411 ) ( CLEAR ?auto_17408 ) ( IS-CRATE ?auto_17409 ) ( AVAILABLE ?auto_17410 ) ( not ( = ?auto_17413 ?auto_17411 ) ) ( HOIST-AT ?auto_17414 ?auto_17413 ) ( AVAILABLE ?auto_17414 ) ( SURFACE-AT ?auto_17409 ?auto_17413 ) ( ON ?auto_17409 ?auto_17415 ) ( CLEAR ?auto_17409 ) ( TRUCK-AT ?auto_17412 ?auto_17411 ) ( not ( = ?auto_17408 ?auto_17409 ) ) ( not ( = ?auto_17408 ?auto_17415 ) ) ( not ( = ?auto_17409 ?auto_17415 ) ) ( not ( = ?auto_17410 ?auto_17414 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17412 ?auto_17411 ?auto_17413 )
      ( !LIFT ?auto_17414 ?auto_17409 ?auto_17415 ?auto_17413 )
      ( !LOAD ?auto_17414 ?auto_17409 ?auto_17412 ?auto_17413 )
      ( !DRIVE ?auto_17412 ?auto_17413 ?auto_17411 )
      ( !UNLOAD ?auto_17410 ?auto_17409 ?auto_17412 ?auto_17411 )
      ( !DROP ?auto_17410 ?auto_17409 ?auto_17408 ?auto_17411 )
      ( MAKE-1CRATE-VERIFY ?auto_17408 ?auto_17409 ) )
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
      ?auto_17435 - HOIST
      ?auto_17434 - PLACE
      ?auto_17433 - PLACE
      ?auto_17436 - HOIST
      ?auto_17437 - SURFACE
      ?auto_17442 - PLACE
      ?auto_17452 - HOIST
      ?auto_17453 - SURFACE
      ?auto_17451 - PLACE
      ?auto_17449 - HOIST
      ?auto_17450 - SURFACE
      ?auto_17439 - PLACE
      ?auto_17444 - HOIST
      ?auto_17441 - SURFACE
      ?auto_17440 - PLACE
      ?auto_17438 - HOIST
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
      ?auto_17448 - PLACE
      ?auto_17443 - HOIST
      ?auto_17445 - SURFACE
      ?auto_17432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17435 ?auto_17434 ) ( IS-CRATE ?auto_17431 ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( HOIST-AT ?auto_17436 ?auto_17433 ) ( AVAILABLE ?auto_17436 ) ( SURFACE-AT ?auto_17431 ?auto_17433 ) ( ON ?auto_17431 ?auto_17437 ) ( CLEAR ?auto_17431 ) ( not ( = ?auto_17430 ?auto_17431 ) ) ( not ( = ?auto_17430 ?auto_17437 ) ) ( not ( = ?auto_17431 ?auto_17437 ) ) ( not ( = ?auto_17435 ?auto_17436 ) ) ( IS-CRATE ?auto_17430 ) ( not ( = ?auto_17442 ?auto_17434 ) ) ( HOIST-AT ?auto_17452 ?auto_17442 ) ( AVAILABLE ?auto_17452 ) ( SURFACE-AT ?auto_17430 ?auto_17442 ) ( ON ?auto_17430 ?auto_17453 ) ( CLEAR ?auto_17430 ) ( not ( = ?auto_17429 ?auto_17430 ) ) ( not ( = ?auto_17429 ?auto_17453 ) ) ( not ( = ?auto_17430 ?auto_17453 ) ) ( not ( = ?auto_17435 ?auto_17452 ) ) ( IS-CRATE ?auto_17429 ) ( not ( = ?auto_17451 ?auto_17434 ) ) ( HOIST-AT ?auto_17449 ?auto_17451 ) ( SURFACE-AT ?auto_17429 ?auto_17451 ) ( ON ?auto_17429 ?auto_17450 ) ( CLEAR ?auto_17429 ) ( not ( = ?auto_17428 ?auto_17429 ) ) ( not ( = ?auto_17428 ?auto_17450 ) ) ( not ( = ?auto_17429 ?auto_17450 ) ) ( not ( = ?auto_17435 ?auto_17449 ) ) ( IS-CRATE ?auto_17428 ) ( not ( = ?auto_17439 ?auto_17434 ) ) ( HOIST-AT ?auto_17444 ?auto_17439 ) ( AVAILABLE ?auto_17444 ) ( SURFACE-AT ?auto_17428 ?auto_17439 ) ( ON ?auto_17428 ?auto_17441 ) ( CLEAR ?auto_17428 ) ( not ( = ?auto_17427 ?auto_17428 ) ) ( not ( = ?auto_17427 ?auto_17441 ) ) ( not ( = ?auto_17428 ?auto_17441 ) ) ( not ( = ?auto_17435 ?auto_17444 ) ) ( IS-CRATE ?auto_17427 ) ( not ( = ?auto_17440 ?auto_17434 ) ) ( HOIST-AT ?auto_17438 ?auto_17440 ) ( AVAILABLE ?auto_17438 ) ( SURFACE-AT ?auto_17427 ?auto_17440 ) ( ON ?auto_17427 ?auto_17446 ) ( CLEAR ?auto_17427 ) ( not ( = ?auto_17426 ?auto_17427 ) ) ( not ( = ?auto_17426 ?auto_17446 ) ) ( not ( = ?auto_17427 ?auto_17446 ) ) ( not ( = ?auto_17435 ?auto_17438 ) ) ( IS-CRATE ?auto_17426 ) ( AVAILABLE ?auto_17449 ) ( SURFACE-AT ?auto_17426 ?auto_17451 ) ( ON ?auto_17426 ?auto_17447 ) ( CLEAR ?auto_17426 ) ( not ( = ?auto_17425 ?auto_17426 ) ) ( not ( = ?auto_17425 ?auto_17447 ) ) ( not ( = ?auto_17426 ?auto_17447 ) ) ( SURFACE-AT ?auto_17424 ?auto_17434 ) ( CLEAR ?auto_17424 ) ( IS-CRATE ?auto_17425 ) ( AVAILABLE ?auto_17435 ) ( not ( = ?auto_17448 ?auto_17434 ) ) ( HOIST-AT ?auto_17443 ?auto_17448 ) ( AVAILABLE ?auto_17443 ) ( SURFACE-AT ?auto_17425 ?auto_17448 ) ( ON ?auto_17425 ?auto_17445 ) ( CLEAR ?auto_17425 ) ( TRUCK-AT ?auto_17432 ?auto_17434 ) ( not ( = ?auto_17424 ?auto_17425 ) ) ( not ( = ?auto_17424 ?auto_17445 ) ) ( not ( = ?auto_17425 ?auto_17445 ) ) ( not ( = ?auto_17435 ?auto_17443 ) ) ( not ( = ?auto_17424 ?auto_17426 ) ) ( not ( = ?auto_17424 ?auto_17447 ) ) ( not ( = ?auto_17426 ?auto_17445 ) ) ( not ( = ?auto_17451 ?auto_17448 ) ) ( not ( = ?auto_17449 ?auto_17443 ) ) ( not ( = ?auto_17447 ?auto_17445 ) ) ( not ( = ?auto_17424 ?auto_17427 ) ) ( not ( = ?auto_17424 ?auto_17446 ) ) ( not ( = ?auto_17425 ?auto_17427 ) ) ( not ( = ?auto_17425 ?auto_17446 ) ) ( not ( = ?auto_17427 ?auto_17447 ) ) ( not ( = ?auto_17427 ?auto_17445 ) ) ( not ( = ?auto_17440 ?auto_17451 ) ) ( not ( = ?auto_17440 ?auto_17448 ) ) ( not ( = ?auto_17438 ?auto_17449 ) ) ( not ( = ?auto_17438 ?auto_17443 ) ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17445 ) ) ( not ( = ?auto_17424 ?auto_17428 ) ) ( not ( = ?auto_17424 ?auto_17441 ) ) ( not ( = ?auto_17425 ?auto_17428 ) ) ( not ( = ?auto_17425 ?auto_17441 ) ) ( not ( = ?auto_17426 ?auto_17428 ) ) ( not ( = ?auto_17426 ?auto_17441 ) ) ( not ( = ?auto_17428 ?auto_17446 ) ) ( not ( = ?auto_17428 ?auto_17447 ) ) ( not ( = ?auto_17428 ?auto_17445 ) ) ( not ( = ?auto_17439 ?auto_17440 ) ) ( not ( = ?auto_17439 ?auto_17451 ) ) ( not ( = ?auto_17439 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17438 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17443 ) ) ( not ( = ?auto_17441 ?auto_17446 ) ) ( not ( = ?auto_17441 ?auto_17447 ) ) ( not ( = ?auto_17441 ?auto_17445 ) ) ( not ( = ?auto_17424 ?auto_17429 ) ) ( not ( = ?auto_17424 ?auto_17450 ) ) ( not ( = ?auto_17425 ?auto_17429 ) ) ( not ( = ?auto_17425 ?auto_17450 ) ) ( not ( = ?auto_17426 ?auto_17429 ) ) ( not ( = ?auto_17426 ?auto_17450 ) ) ( not ( = ?auto_17427 ?auto_17429 ) ) ( not ( = ?auto_17427 ?auto_17450 ) ) ( not ( = ?auto_17429 ?auto_17441 ) ) ( not ( = ?auto_17429 ?auto_17446 ) ) ( not ( = ?auto_17429 ?auto_17447 ) ) ( not ( = ?auto_17429 ?auto_17445 ) ) ( not ( = ?auto_17450 ?auto_17441 ) ) ( not ( = ?auto_17450 ?auto_17446 ) ) ( not ( = ?auto_17450 ?auto_17447 ) ) ( not ( = ?auto_17450 ?auto_17445 ) ) ( not ( = ?auto_17424 ?auto_17430 ) ) ( not ( = ?auto_17424 ?auto_17453 ) ) ( not ( = ?auto_17425 ?auto_17430 ) ) ( not ( = ?auto_17425 ?auto_17453 ) ) ( not ( = ?auto_17426 ?auto_17430 ) ) ( not ( = ?auto_17426 ?auto_17453 ) ) ( not ( = ?auto_17427 ?auto_17430 ) ) ( not ( = ?auto_17427 ?auto_17453 ) ) ( not ( = ?auto_17428 ?auto_17430 ) ) ( not ( = ?auto_17428 ?auto_17453 ) ) ( not ( = ?auto_17430 ?auto_17450 ) ) ( not ( = ?auto_17430 ?auto_17441 ) ) ( not ( = ?auto_17430 ?auto_17446 ) ) ( not ( = ?auto_17430 ?auto_17447 ) ) ( not ( = ?auto_17430 ?auto_17445 ) ) ( not ( = ?auto_17442 ?auto_17451 ) ) ( not ( = ?auto_17442 ?auto_17439 ) ) ( not ( = ?auto_17442 ?auto_17440 ) ) ( not ( = ?auto_17442 ?auto_17448 ) ) ( not ( = ?auto_17452 ?auto_17449 ) ) ( not ( = ?auto_17452 ?auto_17444 ) ) ( not ( = ?auto_17452 ?auto_17438 ) ) ( not ( = ?auto_17452 ?auto_17443 ) ) ( not ( = ?auto_17453 ?auto_17450 ) ) ( not ( = ?auto_17453 ?auto_17441 ) ) ( not ( = ?auto_17453 ?auto_17446 ) ) ( not ( = ?auto_17453 ?auto_17447 ) ) ( not ( = ?auto_17453 ?auto_17445 ) ) ( not ( = ?auto_17424 ?auto_17431 ) ) ( not ( = ?auto_17424 ?auto_17437 ) ) ( not ( = ?auto_17425 ?auto_17431 ) ) ( not ( = ?auto_17425 ?auto_17437 ) ) ( not ( = ?auto_17426 ?auto_17431 ) ) ( not ( = ?auto_17426 ?auto_17437 ) ) ( not ( = ?auto_17427 ?auto_17431 ) ) ( not ( = ?auto_17427 ?auto_17437 ) ) ( not ( = ?auto_17428 ?auto_17431 ) ) ( not ( = ?auto_17428 ?auto_17437 ) ) ( not ( = ?auto_17429 ?auto_17431 ) ) ( not ( = ?auto_17429 ?auto_17437 ) ) ( not ( = ?auto_17431 ?auto_17453 ) ) ( not ( = ?auto_17431 ?auto_17450 ) ) ( not ( = ?auto_17431 ?auto_17441 ) ) ( not ( = ?auto_17431 ?auto_17446 ) ) ( not ( = ?auto_17431 ?auto_17447 ) ) ( not ( = ?auto_17431 ?auto_17445 ) ) ( not ( = ?auto_17433 ?auto_17442 ) ) ( not ( = ?auto_17433 ?auto_17451 ) ) ( not ( = ?auto_17433 ?auto_17439 ) ) ( not ( = ?auto_17433 ?auto_17440 ) ) ( not ( = ?auto_17433 ?auto_17448 ) ) ( not ( = ?auto_17436 ?auto_17452 ) ) ( not ( = ?auto_17436 ?auto_17449 ) ) ( not ( = ?auto_17436 ?auto_17444 ) ) ( not ( = ?auto_17436 ?auto_17438 ) ) ( not ( = ?auto_17436 ?auto_17443 ) ) ( not ( = ?auto_17437 ?auto_17453 ) ) ( not ( = ?auto_17437 ?auto_17450 ) ) ( not ( = ?auto_17437 ?auto_17441 ) ) ( not ( = ?auto_17437 ?auto_17446 ) ) ( not ( = ?auto_17437 ?auto_17447 ) ) ( not ( = ?auto_17437 ?auto_17445 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17424 ?auto_17425 ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ?auto_17430 )
      ( MAKE-1CRATE ?auto_17430 ?auto_17431 )
      ( MAKE-7CRATE-VERIFY ?auto_17424 ?auto_17425 ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ?auto_17430 ?auto_17431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17456 - SURFACE
      ?auto_17457 - SURFACE
    )
    :vars
    (
      ?auto_17458 - HOIST
      ?auto_17459 - PLACE
      ?auto_17461 - PLACE
      ?auto_17462 - HOIST
      ?auto_17463 - SURFACE
      ?auto_17460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17458 ?auto_17459 ) ( SURFACE-AT ?auto_17456 ?auto_17459 ) ( CLEAR ?auto_17456 ) ( IS-CRATE ?auto_17457 ) ( AVAILABLE ?auto_17458 ) ( not ( = ?auto_17461 ?auto_17459 ) ) ( HOIST-AT ?auto_17462 ?auto_17461 ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17457 ?auto_17461 ) ( ON ?auto_17457 ?auto_17463 ) ( CLEAR ?auto_17457 ) ( TRUCK-AT ?auto_17460 ?auto_17459 ) ( not ( = ?auto_17456 ?auto_17457 ) ) ( not ( = ?auto_17456 ?auto_17463 ) ) ( not ( = ?auto_17457 ?auto_17463 ) ) ( not ( = ?auto_17458 ?auto_17462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17460 ?auto_17459 ?auto_17461 )
      ( !LIFT ?auto_17462 ?auto_17457 ?auto_17463 ?auto_17461 )
      ( !LOAD ?auto_17462 ?auto_17457 ?auto_17460 ?auto_17461 )
      ( !DRIVE ?auto_17460 ?auto_17461 ?auto_17459 )
      ( !UNLOAD ?auto_17458 ?auto_17457 ?auto_17460 ?auto_17459 )
      ( !DROP ?auto_17458 ?auto_17457 ?auto_17456 ?auto_17459 )
      ( MAKE-1CRATE-VERIFY ?auto_17456 ?auto_17457 ) )
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
      ?auto_17481 - SURFACE
      ?auto_17480 - SURFACE
    )
    :vars
    (
      ?auto_17485 - HOIST
      ?auto_17483 - PLACE
      ?auto_17482 - PLACE
      ?auto_17487 - HOIST
      ?auto_17486 - SURFACE
      ?auto_17502 - PLACE
      ?auto_17503 - HOIST
      ?auto_17488 - SURFACE
      ?auto_17501 - PLACE
      ?auto_17489 - HOIST
      ?auto_17491 - SURFACE
      ?auto_17497 - PLACE
      ?auto_17495 - HOIST
      ?auto_17496 - SURFACE
      ?auto_17505 - PLACE
      ?auto_17499 - HOIST
      ?auto_17504 - SURFACE
      ?auto_17506 - PLACE
      ?auto_17490 - HOIST
      ?auto_17492 - SURFACE
      ?auto_17494 - SURFACE
      ?auto_17493 - PLACE
      ?auto_17500 - HOIST
      ?auto_17498 - SURFACE
      ?auto_17484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17485 ?auto_17483 ) ( IS-CRATE ?auto_17480 ) ( not ( = ?auto_17482 ?auto_17483 ) ) ( HOIST-AT ?auto_17487 ?auto_17482 ) ( AVAILABLE ?auto_17487 ) ( SURFACE-AT ?auto_17480 ?auto_17482 ) ( ON ?auto_17480 ?auto_17486 ) ( CLEAR ?auto_17480 ) ( not ( = ?auto_17481 ?auto_17480 ) ) ( not ( = ?auto_17481 ?auto_17486 ) ) ( not ( = ?auto_17480 ?auto_17486 ) ) ( not ( = ?auto_17485 ?auto_17487 ) ) ( IS-CRATE ?auto_17481 ) ( not ( = ?auto_17502 ?auto_17483 ) ) ( HOIST-AT ?auto_17503 ?auto_17502 ) ( AVAILABLE ?auto_17503 ) ( SURFACE-AT ?auto_17481 ?auto_17502 ) ( ON ?auto_17481 ?auto_17488 ) ( CLEAR ?auto_17481 ) ( not ( = ?auto_17479 ?auto_17481 ) ) ( not ( = ?auto_17479 ?auto_17488 ) ) ( not ( = ?auto_17481 ?auto_17488 ) ) ( not ( = ?auto_17485 ?auto_17503 ) ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17501 ?auto_17483 ) ) ( HOIST-AT ?auto_17489 ?auto_17501 ) ( AVAILABLE ?auto_17489 ) ( SURFACE-AT ?auto_17479 ?auto_17501 ) ( ON ?auto_17479 ?auto_17491 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17491 ) ) ( not ( = ?auto_17479 ?auto_17491 ) ) ( not ( = ?auto_17485 ?auto_17489 ) ) ( IS-CRATE ?auto_17478 ) ( not ( = ?auto_17497 ?auto_17483 ) ) ( HOIST-AT ?auto_17495 ?auto_17497 ) ( SURFACE-AT ?auto_17478 ?auto_17497 ) ( ON ?auto_17478 ?auto_17496 ) ( CLEAR ?auto_17478 ) ( not ( = ?auto_17477 ?auto_17478 ) ) ( not ( = ?auto_17477 ?auto_17496 ) ) ( not ( = ?auto_17478 ?auto_17496 ) ) ( not ( = ?auto_17485 ?auto_17495 ) ) ( IS-CRATE ?auto_17477 ) ( not ( = ?auto_17505 ?auto_17483 ) ) ( HOIST-AT ?auto_17499 ?auto_17505 ) ( AVAILABLE ?auto_17499 ) ( SURFACE-AT ?auto_17477 ?auto_17505 ) ( ON ?auto_17477 ?auto_17504 ) ( CLEAR ?auto_17477 ) ( not ( = ?auto_17476 ?auto_17477 ) ) ( not ( = ?auto_17476 ?auto_17504 ) ) ( not ( = ?auto_17477 ?auto_17504 ) ) ( not ( = ?auto_17485 ?auto_17499 ) ) ( IS-CRATE ?auto_17476 ) ( not ( = ?auto_17506 ?auto_17483 ) ) ( HOIST-AT ?auto_17490 ?auto_17506 ) ( AVAILABLE ?auto_17490 ) ( SURFACE-AT ?auto_17476 ?auto_17506 ) ( ON ?auto_17476 ?auto_17492 ) ( CLEAR ?auto_17476 ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17492 ) ) ( not ( = ?auto_17476 ?auto_17492 ) ) ( not ( = ?auto_17485 ?auto_17490 ) ) ( IS-CRATE ?auto_17475 ) ( AVAILABLE ?auto_17495 ) ( SURFACE-AT ?auto_17475 ?auto_17497 ) ( ON ?auto_17475 ?auto_17494 ) ( CLEAR ?auto_17475 ) ( not ( = ?auto_17474 ?auto_17475 ) ) ( not ( = ?auto_17474 ?auto_17494 ) ) ( not ( = ?auto_17475 ?auto_17494 ) ) ( SURFACE-AT ?auto_17473 ?auto_17483 ) ( CLEAR ?auto_17473 ) ( IS-CRATE ?auto_17474 ) ( AVAILABLE ?auto_17485 ) ( not ( = ?auto_17493 ?auto_17483 ) ) ( HOIST-AT ?auto_17500 ?auto_17493 ) ( AVAILABLE ?auto_17500 ) ( SURFACE-AT ?auto_17474 ?auto_17493 ) ( ON ?auto_17474 ?auto_17498 ) ( CLEAR ?auto_17474 ) ( TRUCK-AT ?auto_17484 ?auto_17483 ) ( not ( = ?auto_17473 ?auto_17474 ) ) ( not ( = ?auto_17473 ?auto_17498 ) ) ( not ( = ?auto_17474 ?auto_17498 ) ) ( not ( = ?auto_17485 ?auto_17500 ) ) ( not ( = ?auto_17473 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17494 ) ) ( not ( = ?auto_17475 ?auto_17498 ) ) ( not ( = ?auto_17497 ?auto_17493 ) ) ( not ( = ?auto_17495 ?auto_17500 ) ) ( not ( = ?auto_17494 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17473 ?auto_17492 ) ) ( not ( = ?auto_17474 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17492 ) ) ( not ( = ?auto_17476 ?auto_17494 ) ) ( not ( = ?auto_17476 ?auto_17498 ) ) ( not ( = ?auto_17506 ?auto_17497 ) ) ( not ( = ?auto_17506 ?auto_17493 ) ) ( not ( = ?auto_17490 ?auto_17495 ) ) ( not ( = ?auto_17490 ?auto_17500 ) ) ( not ( = ?auto_17492 ?auto_17494 ) ) ( not ( = ?auto_17492 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17477 ) ) ( not ( = ?auto_17473 ?auto_17504 ) ) ( not ( = ?auto_17474 ?auto_17477 ) ) ( not ( = ?auto_17474 ?auto_17504 ) ) ( not ( = ?auto_17475 ?auto_17477 ) ) ( not ( = ?auto_17475 ?auto_17504 ) ) ( not ( = ?auto_17477 ?auto_17492 ) ) ( not ( = ?auto_17477 ?auto_17494 ) ) ( not ( = ?auto_17477 ?auto_17498 ) ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17497 ) ) ( not ( = ?auto_17505 ?auto_17493 ) ) ( not ( = ?auto_17499 ?auto_17490 ) ) ( not ( = ?auto_17499 ?auto_17495 ) ) ( not ( = ?auto_17499 ?auto_17500 ) ) ( not ( = ?auto_17504 ?auto_17492 ) ) ( not ( = ?auto_17504 ?auto_17494 ) ) ( not ( = ?auto_17504 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17478 ) ) ( not ( = ?auto_17473 ?auto_17496 ) ) ( not ( = ?auto_17474 ?auto_17478 ) ) ( not ( = ?auto_17474 ?auto_17496 ) ) ( not ( = ?auto_17475 ?auto_17478 ) ) ( not ( = ?auto_17475 ?auto_17496 ) ) ( not ( = ?auto_17476 ?auto_17478 ) ) ( not ( = ?auto_17476 ?auto_17496 ) ) ( not ( = ?auto_17478 ?auto_17504 ) ) ( not ( = ?auto_17478 ?auto_17492 ) ) ( not ( = ?auto_17478 ?auto_17494 ) ) ( not ( = ?auto_17478 ?auto_17498 ) ) ( not ( = ?auto_17496 ?auto_17504 ) ) ( not ( = ?auto_17496 ?auto_17492 ) ) ( not ( = ?auto_17496 ?auto_17494 ) ) ( not ( = ?auto_17496 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17479 ) ) ( not ( = ?auto_17473 ?auto_17491 ) ) ( not ( = ?auto_17474 ?auto_17479 ) ) ( not ( = ?auto_17474 ?auto_17491 ) ) ( not ( = ?auto_17475 ?auto_17479 ) ) ( not ( = ?auto_17475 ?auto_17491 ) ) ( not ( = ?auto_17476 ?auto_17479 ) ) ( not ( = ?auto_17476 ?auto_17491 ) ) ( not ( = ?auto_17477 ?auto_17479 ) ) ( not ( = ?auto_17477 ?auto_17491 ) ) ( not ( = ?auto_17479 ?auto_17496 ) ) ( not ( = ?auto_17479 ?auto_17504 ) ) ( not ( = ?auto_17479 ?auto_17492 ) ) ( not ( = ?auto_17479 ?auto_17494 ) ) ( not ( = ?auto_17479 ?auto_17498 ) ) ( not ( = ?auto_17501 ?auto_17497 ) ) ( not ( = ?auto_17501 ?auto_17505 ) ) ( not ( = ?auto_17501 ?auto_17506 ) ) ( not ( = ?auto_17501 ?auto_17493 ) ) ( not ( = ?auto_17489 ?auto_17495 ) ) ( not ( = ?auto_17489 ?auto_17499 ) ) ( not ( = ?auto_17489 ?auto_17490 ) ) ( not ( = ?auto_17489 ?auto_17500 ) ) ( not ( = ?auto_17491 ?auto_17496 ) ) ( not ( = ?auto_17491 ?auto_17504 ) ) ( not ( = ?auto_17491 ?auto_17492 ) ) ( not ( = ?auto_17491 ?auto_17494 ) ) ( not ( = ?auto_17491 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17481 ) ) ( not ( = ?auto_17473 ?auto_17488 ) ) ( not ( = ?auto_17474 ?auto_17481 ) ) ( not ( = ?auto_17474 ?auto_17488 ) ) ( not ( = ?auto_17475 ?auto_17481 ) ) ( not ( = ?auto_17475 ?auto_17488 ) ) ( not ( = ?auto_17476 ?auto_17481 ) ) ( not ( = ?auto_17476 ?auto_17488 ) ) ( not ( = ?auto_17477 ?auto_17481 ) ) ( not ( = ?auto_17477 ?auto_17488 ) ) ( not ( = ?auto_17478 ?auto_17481 ) ) ( not ( = ?auto_17478 ?auto_17488 ) ) ( not ( = ?auto_17481 ?auto_17491 ) ) ( not ( = ?auto_17481 ?auto_17496 ) ) ( not ( = ?auto_17481 ?auto_17504 ) ) ( not ( = ?auto_17481 ?auto_17492 ) ) ( not ( = ?auto_17481 ?auto_17494 ) ) ( not ( = ?auto_17481 ?auto_17498 ) ) ( not ( = ?auto_17502 ?auto_17501 ) ) ( not ( = ?auto_17502 ?auto_17497 ) ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( not ( = ?auto_17502 ?auto_17506 ) ) ( not ( = ?auto_17502 ?auto_17493 ) ) ( not ( = ?auto_17503 ?auto_17489 ) ) ( not ( = ?auto_17503 ?auto_17495 ) ) ( not ( = ?auto_17503 ?auto_17499 ) ) ( not ( = ?auto_17503 ?auto_17490 ) ) ( not ( = ?auto_17503 ?auto_17500 ) ) ( not ( = ?auto_17488 ?auto_17491 ) ) ( not ( = ?auto_17488 ?auto_17496 ) ) ( not ( = ?auto_17488 ?auto_17504 ) ) ( not ( = ?auto_17488 ?auto_17492 ) ) ( not ( = ?auto_17488 ?auto_17494 ) ) ( not ( = ?auto_17488 ?auto_17498 ) ) ( not ( = ?auto_17473 ?auto_17480 ) ) ( not ( = ?auto_17473 ?auto_17486 ) ) ( not ( = ?auto_17474 ?auto_17480 ) ) ( not ( = ?auto_17474 ?auto_17486 ) ) ( not ( = ?auto_17475 ?auto_17480 ) ) ( not ( = ?auto_17475 ?auto_17486 ) ) ( not ( = ?auto_17476 ?auto_17480 ) ) ( not ( = ?auto_17476 ?auto_17486 ) ) ( not ( = ?auto_17477 ?auto_17480 ) ) ( not ( = ?auto_17477 ?auto_17486 ) ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17478 ?auto_17486 ) ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17479 ?auto_17486 ) ) ( not ( = ?auto_17480 ?auto_17488 ) ) ( not ( = ?auto_17480 ?auto_17491 ) ) ( not ( = ?auto_17480 ?auto_17496 ) ) ( not ( = ?auto_17480 ?auto_17504 ) ) ( not ( = ?auto_17480 ?auto_17492 ) ) ( not ( = ?auto_17480 ?auto_17494 ) ) ( not ( = ?auto_17480 ?auto_17498 ) ) ( not ( = ?auto_17482 ?auto_17502 ) ) ( not ( = ?auto_17482 ?auto_17501 ) ) ( not ( = ?auto_17482 ?auto_17497 ) ) ( not ( = ?auto_17482 ?auto_17505 ) ) ( not ( = ?auto_17482 ?auto_17506 ) ) ( not ( = ?auto_17482 ?auto_17493 ) ) ( not ( = ?auto_17487 ?auto_17503 ) ) ( not ( = ?auto_17487 ?auto_17489 ) ) ( not ( = ?auto_17487 ?auto_17495 ) ) ( not ( = ?auto_17487 ?auto_17499 ) ) ( not ( = ?auto_17487 ?auto_17490 ) ) ( not ( = ?auto_17487 ?auto_17500 ) ) ( not ( = ?auto_17486 ?auto_17488 ) ) ( not ( = ?auto_17486 ?auto_17491 ) ) ( not ( = ?auto_17486 ?auto_17496 ) ) ( not ( = ?auto_17486 ?auto_17504 ) ) ( not ( = ?auto_17486 ?auto_17492 ) ) ( not ( = ?auto_17486 ?auto_17494 ) ) ( not ( = ?auto_17486 ?auto_17498 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17473 ?auto_17474 ?auto_17475 ?auto_17476 ?auto_17477 ?auto_17478 ?auto_17479 ?auto_17481 )
      ( MAKE-1CRATE ?auto_17481 ?auto_17480 )
      ( MAKE-8CRATE-VERIFY ?auto_17473 ?auto_17474 ?auto_17475 ?auto_17476 ?auto_17477 ?auto_17478 ?auto_17479 ?auto_17481 ?auto_17480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
    )
    :vars
    (
      ?auto_17511 - HOIST
      ?auto_17512 - PLACE
      ?auto_17514 - PLACE
      ?auto_17515 - HOIST
      ?auto_17516 - SURFACE
      ?auto_17513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17511 ?auto_17512 ) ( SURFACE-AT ?auto_17509 ?auto_17512 ) ( CLEAR ?auto_17509 ) ( IS-CRATE ?auto_17510 ) ( AVAILABLE ?auto_17511 ) ( not ( = ?auto_17514 ?auto_17512 ) ) ( HOIST-AT ?auto_17515 ?auto_17514 ) ( AVAILABLE ?auto_17515 ) ( SURFACE-AT ?auto_17510 ?auto_17514 ) ( ON ?auto_17510 ?auto_17516 ) ( CLEAR ?auto_17510 ) ( TRUCK-AT ?auto_17513 ?auto_17512 ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17516 ) ) ( not ( = ?auto_17510 ?auto_17516 ) ) ( not ( = ?auto_17511 ?auto_17515 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17513 ?auto_17512 ?auto_17514 )
      ( !LIFT ?auto_17515 ?auto_17510 ?auto_17516 ?auto_17514 )
      ( !LOAD ?auto_17515 ?auto_17510 ?auto_17513 ?auto_17514 )
      ( !DRIVE ?auto_17513 ?auto_17514 ?auto_17512 )
      ( !UNLOAD ?auto_17511 ?auto_17510 ?auto_17513 ?auto_17512 )
      ( !DROP ?auto_17511 ?auto_17510 ?auto_17509 ?auto_17512 )
      ( MAKE-1CRATE-VERIFY ?auto_17509 ?auto_17510 ) )
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
      ?auto_17536 - SURFACE
      ?auto_17535 - SURFACE
      ?auto_17534 - SURFACE
    )
    :vars
    (
      ?auto_17540 - HOIST
      ?auto_17541 - PLACE
      ?auto_17538 - PLACE
      ?auto_17537 - HOIST
      ?auto_17542 - SURFACE
      ?auto_17549 - PLACE
      ?auto_17546 - HOIST
      ?auto_17547 - SURFACE
      ?auto_17548 - PLACE
      ?auto_17554 - HOIST
      ?auto_17551 - SURFACE
      ?auto_17560 - PLACE
      ?auto_17543 - HOIST
      ?auto_17544 - SURFACE
      ?auto_17557 - PLACE
      ?auto_17561 - HOIST
      ?auto_17555 - SURFACE
      ?auto_17550 - PLACE
      ?auto_17558 - HOIST
      ?auto_17552 - SURFACE
      ?auto_17553 - PLACE
      ?auto_17545 - HOIST
      ?auto_17564 - SURFACE
      ?auto_17562 - SURFACE
      ?auto_17563 - PLACE
      ?auto_17559 - HOIST
      ?auto_17556 - SURFACE
      ?auto_17539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17540 ?auto_17541 ) ( IS-CRATE ?auto_17534 ) ( not ( = ?auto_17538 ?auto_17541 ) ) ( HOIST-AT ?auto_17537 ?auto_17538 ) ( AVAILABLE ?auto_17537 ) ( SURFACE-AT ?auto_17534 ?auto_17538 ) ( ON ?auto_17534 ?auto_17542 ) ( CLEAR ?auto_17534 ) ( not ( = ?auto_17535 ?auto_17534 ) ) ( not ( = ?auto_17535 ?auto_17542 ) ) ( not ( = ?auto_17534 ?auto_17542 ) ) ( not ( = ?auto_17540 ?auto_17537 ) ) ( IS-CRATE ?auto_17535 ) ( not ( = ?auto_17549 ?auto_17541 ) ) ( HOIST-AT ?auto_17546 ?auto_17549 ) ( AVAILABLE ?auto_17546 ) ( SURFACE-AT ?auto_17535 ?auto_17549 ) ( ON ?auto_17535 ?auto_17547 ) ( CLEAR ?auto_17535 ) ( not ( = ?auto_17536 ?auto_17535 ) ) ( not ( = ?auto_17536 ?auto_17547 ) ) ( not ( = ?auto_17535 ?auto_17547 ) ) ( not ( = ?auto_17540 ?auto_17546 ) ) ( IS-CRATE ?auto_17536 ) ( not ( = ?auto_17548 ?auto_17541 ) ) ( HOIST-AT ?auto_17554 ?auto_17548 ) ( AVAILABLE ?auto_17554 ) ( SURFACE-AT ?auto_17536 ?auto_17548 ) ( ON ?auto_17536 ?auto_17551 ) ( CLEAR ?auto_17536 ) ( not ( = ?auto_17533 ?auto_17536 ) ) ( not ( = ?auto_17533 ?auto_17551 ) ) ( not ( = ?auto_17536 ?auto_17551 ) ) ( not ( = ?auto_17540 ?auto_17554 ) ) ( IS-CRATE ?auto_17533 ) ( not ( = ?auto_17560 ?auto_17541 ) ) ( HOIST-AT ?auto_17543 ?auto_17560 ) ( AVAILABLE ?auto_17543 ) ( SURFACE-AT ?auto_17533 ?auto_17560 ) ( ON ?auto_17533 ?auto_17544 ) ( CLEAR ?auto_17533 ) ( not ( = ?auto_17532 ?auto_17533 ) ) ( not ( = ?auto_17532 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17544 ) ) ( not ( = ?auto_17540 ?auto_17543 ) ) ( IS-CRATE ?auto_17532 ) ( not ( = ?auto_17557 ?auto_17541 ) ) ( HOIST-AT ?auto_17561 ?auto_17557 ) ( SURFACE-AT ?auto_17532 ?auto_17557 ) ( ON ?auto_17532 ?auto_17555 ) ( CLEAR ?auto_17532 ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17531 ?auto_17555 ) ) ( not ( = ?auto_17532 ?auto_17555 ) ) ( not ( = ?auto_17540 ?auto_17561 ) ) ( IS-CRATE ?auto_17531 ) ( not ( = ?auto_17550 ?auto_17541 ) ) ( HOIST-AT ?auto_17558 ?auto_17550 ) ( AVAILABLE ?auto_17558 ) ( SURFACE-AT ?auto_17531 ?auto_17550 ) ( ON ?auto_17531 ?auto_17552 ) ( CLEAR ?auto_17531 ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17552 ) ) ( not ( = ?auto_17531 ?auto_17552 ) ) ( not ( = ?auto_17540 ?auto_17558 ) ) ( IS-CRATE ?auto_17530 ) ( not ( = ?auto_17553 ?auto_17541 ) ) ( HOIST-AT ?auto_17545 ?auto_17553 ) ( AVAILABLE ?auto_17545 ) ( SURFACE-AT ?auto_17530 ?auto_17553 ) ( ON ?auto_17530 ?auto_17564 ) ( CLEAR ?auto_17530 ) ( not ( = ?auto_17529 ?auto_17530 ) ) ( not ( = ?auto_17529 ?auto_17564 ) ) ( not ( = ?auto_17530 ?auto_17564 ) ) ( not ( = ?auto_17540 ?auto_17545 ) ) ( IS-CRATE ?auto_17529 ) ( AVAILABLE ?auto_17561 ) ( SURFACE-AT ?auto_17529 ?auto_17557 ) ( ON ?auto_17529 ?auto_17562 ) ( CLEAR ?auto_17529 ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17528 ?auto_17562 ) ) ( not ( = ?auto_17529 ?auto_17562 ) ) ( SURFACE-AT ?auto_17527 ?auto_17541 ) ( CLEAR ?auto_17527 ) ( IS-CRATE ?auto_17528 ) ( AVAILABLE ?auto_17540 ) ( not ( = ?auto_17563 ?auto_17541 ) ) ( HOIST-AT ?auto_17559 ?auto_17563 ) ( AVAILABLE ?auto_17559 ) ( SURFACE-AT ?auto_17528 ?auto_17563 ) ( ON ?auto_17528 ?auto_17556 ) ( CLEAR ?auto_17528 ) ( TRUCK-AT ?auto_17539 ?auto_17541 ) ( not ( = ?auto_17527 ?auto_17528 ) ) ( not ( = ?auto_17527 ?auto_17556 ) ) ( not ( = ?auto_17528 ?auto_17556 ) ) ( not ( = ?auto_17540 ?auto_17559 ) ) ( not ( = ?auto_17527 ?auto_17529 ) ) ( not ( = ?auto_17527 ?auto_17562 ) ) ( not ( = ?auto_17529 ?auto_17556 ) ) ( not ( = ?auto_17557 ?auto_17563 ) ) ( not ( = ?auto_17561 ?auto_17559 ) ) ( not ( = ?auto_17562 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17530 ) ) ( not ( = ?auto_17527 ?auto_17564 ) ) ( not ( = ?auto_17528 ?auto_17530 ) ) ( not ( = ?auto_17528 ?auto_17564 ) ) ( not ( = ?auto_17530 ?auto_17562 ) ) ( not ( = ?auto_17530 ?auto_17556 ) ) ( not ( = ?auto_17553 ?auto_17557 ) ) ( not ( = ?auto_17553 ?auto_17563 ) ) ( not ( = ?auto_17545 ?auto_17561 ) ) ( not ( = ?auto_17545 ?auto_17559 ) ) ( not ( = ?auto_17564 ?auto_17562 ) ) ( not ( = ?auto_17564 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17531 ) ) ( not ( = ?auto_17527 ?auto_17552 ) ) ( not ( = ?auto_17528 ?auto_17531 ) ) ( not ( = ?auto_17528 ?auto_17552 ) ) ( not ( = ?auto_17529 ?auto_17531 ) ) ( not ( = ?auto_17529 ?auto_17552 ) ) ( not ( = ?auto_17531 ?auto_17564 ) ) ( not ( = ?auto_17531 ?auto_17562 ) ) ( not ( = ?auto_17531 ?auto_17556 ) ) ( not ( = ?auto_17550 ?auto_17553 ) ) ( not ( = ?auto_17550 ?auto_17557 ) ) ( not ( = ?auto_17550 ?auto_17563 ) ) ( not ( = ?auto_17558 ?auto_17545 ) ) ( not ( = ?auto_17558 ?auto_17561 ) ) ( not ( = ?auto_17558 ?auto_17559 ) ) ( not ( = ?auto_17552 ?auto_17564 ) ) ( not ( = ?auto_17552 ?auto_17562 ) ) ( not ( = ?auto_17552 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17532 ) ) ( not ( = ?auto_17527 ?auto_17555 ) ) ( not ( = ?auto_17528 ?auto_17532 ) ) ( not ( = ?auto_17528 ?auto_17555 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17529 ?auto_17555 ) ) ( not ( = ?auto_17530 ?auto_17532 ) ) ( not ( = ?auto_17530 ?auto_17555 ) ) ( not ( = ?auto_17532 ?auto_17552 ) ) ( not ( = ?auto_17532 ?auto_17564 ) ) ( not ( = ?auto_17532 ?auto_17562 ) ) ( not ( = ?auto_17532 ?auto_17556 ) ) ( not ( = ?auto_17555 ?auto_17552 ) ) ( not ( = ?auto_17555 ?auto_17564 ) ) ( not ( = ?auto_17555 ?auto_17562 ) ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17533 ) ) ( not ( = ?auto_17527 ?auto_17544 ) ) ( not ( = ?auto_17528 ?auto_17533 ) ) ( not ( = ?auto_17528 ?auto_17544 ) ) ( not ( = ?auto_17529 ?auto_17533 ) ) ( not ( = ?auto_17529 ?auto_17544 ) ) ( not ( = ?auto_17530 ?auto_17533 ) ) ( not ( = ?auto_17530 ?auto_17544 ) ) ( not ( = ?auto_17531 ?auto_17533 ) ) ( not ( = ?auto_17531 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17555 ) ) ( not ( = ?auto_17533 ?auto_17552 ) ) ( not ( = ?auto_17533 ?auto_17564 ) ) ( not ( = ?auto_17533 ?auto_17562 ) ) ( not ( = ?auto_17533 ?auto_17556 ) ) ( not ( = ?auto_17560 ?auto_17557 ) ) ( not ( = ?auto_17560 ?auto_17550 ) ) ( not ( = ?auto_17560 ?auto_17553 ) ) ( not ( = ?auto_17560 ?auto_17563 ) ) ( not ( = ?auto_17543 ?auto_17561 ) ) ( not ( = ?auto_17543 ?auto_17558 ) ) ( not ( = ?auto_17543 ?auto_17545 ) ) ( not ( = ?auto_17543 ?auto_17559 ) ) ( not ( = ?auto_17544 ?auto_17555 ) ) ( not ( = ?auto_17544 ?auto_17552 ) ) ( not ( = ?auto_17544 ?auto_17564 ) ) ( not ( = ?auto_17544 ?auto_17562 ) ) ( not ( = ?auto_17544 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17536 ) ) ( not ( = ?auto_17527 ?auto_17551 ) ) ( not ( = ?auto_17528 ?auto_17536 ) ) ( not ( = ?auto_17528 ?auto_17551 ) ) ( not ( = ?auto_17529 ?auto_17536 ) ) ( not ( = ?auto_17529 ?auto_17551 ) ) ( not ( = ?auto_17530 ?auto_17536 ) ) ( not ( = ?auto_17530 ?auto_17551 ) ) ( not ( = ?auto_17531 ?auto_17536 ) ) ( not ( = ?auto_17531 ?auto_17551 ) ) ( not ( = ?auto_17532 ?auto_17536 ) ) ( not ( = ?auto_17532 ?auto_17551 ) ) ( not ( = ?auto_17536 ?auto_17544 ) ) ( not ( = ?auto_17536 ?auto_17555 ) ) ( not ( = ?auto_17536 ?auto_17552 ) ) ( not ( = ?auto_17536 ?auto_17564 ) ) ( not ( = ?auto_17536 ?auto_17562 ) ) ( not ( = ?auto_17536 ?auto_17556 ) ) ( not ( = ?auto_17548 ?auto_17560 ) ) ( not ( = ?auto_17548 ?auto_17557 ) ) ( not ( = ?auto_17548 ?auto_17550 ) ) ( not ( = ?auto_17548 ?auto_17553 ) ) ( not ( = ?auto_17548 ?auto_17563 ) ) ( not ( = ?auto_17554 ?auto_17543 ) ) ( not ( = ?auto_17554 ?auto_17561 ) ) ( not ( = ?auto_17554 ?auto_17558 ) ) ( not ( = ?auto_17554 ?auto_17545 ) ) ( not ( = ?auto_17554 ?auto_17559 ) ) ( not ( = ?auto_17551 ?auto_17544 ) ) ( not ( = ?auto_17551 ?auto_17555 ) ) ( not ( = ?auto_17551 ?auto_17552 ) ) ( not ( = ?auto_17551 ?auto_17564 ) ) ( not ( = ?auto_17551 ?auto_17562 ) ) ( not ( = ?auto_17551 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17535 ) ) ( not ( = ?auto_17527 ?auto_17547 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17547 ) ) ( not ( = ?auto_17529 ?auto_17535 ) ) ( not ( = ?auto_17529 ?auto_17547 ) ) ( not ( = ?auto_17530 ?auto_17535 ) ) ( not ( = ?auto_17530 ?auto_17547 ) ) ( not ( = ?auto_17531 ?auto_17535 ) ) ( not ( = ?auto_17531 ?auto_17547 ) ) ( not ( = ?auto_17532 ?auto_17535 ) ) ( not ( = ?auto_17532 ?auto_17547 ) ) ( not ( = ?auto_17533 ?auto_17535 ) ) ( not ( = ?auto_17533 ?auto_17547 ) ) ( not ( = ?auto_17535 ?auto_17551 ) ) ( not ( = ?auto_17535 ?auto_17544 ) ) ( not ( = ?auto_17535 ?auto_17555 ) ) ( not ( = ?auto_17535 ?auto_17552 ) ) ( not ( = ?auto_17535 ?auto_17564 ) ) ( not ( = ?auto_17535 ?auto_17562 ) ) ( not ( = ?auto_17535 ?auto_17556 ) ) ( not ( = ?auto_17549 ?auto_17548 ) ) ( not ( = ?auto_17549 ?auto_17560 ) ) ( not ( = ?auto_17549 ?auto_17557 ) ) ( not ( = ?auto_17549 ?auto_17550 ) ) ( not ( = ?auto_17549 ?auto_17553 ) ) ( not ( = ?auto_17549 ?auto_17563 ) ) ( not ( = ?auto_17546 ?auto_17554 ) ) ( not ( = ?auto_17546 ?auto_17543 ) ) ( not ( = ?auto_17546 ?auto_17561 ) ) ( not ( = ?auto_17546 ?auto_17558 ) ) ( not ( = ?auto_17546 ?auto_17545 ) ) ( not ( = ?auto_17546 ?auto_17559 ) ) ( not ( = ?auto_17547 ?auto_17551 ) ) ( not ( = ?auto_17547 ?auto_17544 ) ) ( not ( = ?auto_17547 ?auto_17555 ) ) ( not ( = ?auto_17547 ?auto_17552 ) ) ( not ( = ?auto_17547 ?auto_17564 ) ) ( not ( = ?auto_17547 ?auto_17562 ) ) ( not ( = ?auto_17547 ?auto_17556 ) ) ( not ( = ?auto_17527 ?auto_17534 ) ) ( not ( = ?auto_17527 ?auto_17542 ) ) ( not ( = ?auto_17528 ?auto_17534 ) ) ( not ( = ?auto_17528 ?auto_17542 ) ) ( not ( = ?auto_17529 ?auto_17534 ) ) ( not ( = ?auto_17529 ?auto_17542 ) ) ( not ( = ?auto_17530 ?auto_17534 ) ) ( not ( = ?auto_17530 ?auto_17542 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( not ( = ?auto_17531 ?auto_17542 ) ) ( not ( = ?auto_17532 ?auto_17534 ) ) ( not ( = ?auto_17532 ?auto_17542 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17542 ) ) ( not ( = ?auto_17536 ?auto_17534 ) ) ( not ( = ?auto_17536 ?auto_17542 ) ) ( not ( = ?auto_17534 ?auto_17547 ) ) ( not ( = ?auto_17534 ?auto_17551 ) ) ( not ( = ?auto_17534 ?auto_17544 ) ) ( not ( = ?auto_17534 ?auto_17555 ) ) ( not ( = ?auto_17534 ?auto_17552 ) ) ( not ( = ?auto_17534 ?auto_17564 ) ) ( not ( = ?auto_17534 ?auto_17562 ) ) ( not ( = ?auto_17534 ?auto_17556 ) ) ( not ( = ?auto_17538 ?auto_17549 ) ) ( not ( = ?auto_17538 ?auto_17548 ) ) ( not ( = ?auto_17538 ?auto_17560 ) ) ( not ( = ?auto_17538 ?auto_17557 ) ) ( not ( = ?auto_17538 ?auto_17550 ) ) ( not ( = ?auto_17538 ?auto_17553 ) ) ( not ( = ?auto_17538 ?auto_17563 ) ) ( not ( = ?auto_17537 ?auto_17546 ) ) ( not ( = ?auto_17537 ?auto_17554 ) ) ( not ( = ?auto_17537 ?auto_17543 ) ) ( not ( = ?auto_17537 ?auto_17561 ) ) ( not ( = ?auto_17537 ?auto_17558 ) ) ( not ( = ?auto_17537 ?auto_17545 ) ) ( not ( = ?auto_17537 ?auto_17559 ) ) ( not ( = ?auto_17542 ?auto_17547 ) ) ( not ( = ?auto_17542 ?auto_17551 ) ) ( not ( = ?auto_17542 ?auto_17544 ) ) ( not ( = ?auto_17542 ?auto_17555 ) ) ( not ( = ?auto_17542 ?auto_17552 ) ) ( not ( = ?auto_17542 ?auto_17564 ) ) ( not ( = ?auto_17542 ?auto_17562 ) ) ( not ( = ?auto_17542 ?auto_17556 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17527 ?auto_17528 ?auto_17529 ?auto_17530 ?auto_17531 ?auto_17532 ?auto_17533 ?auto_17536 ?auto_17535 )
      ( MAKE-1CRATE ?auto_17535 ?auto_17534 )
      ( MAKE-9CRATE-VERIFY ?auto_17527 ?auto_17528 ?auto_17529 ?auto_17530 ?auto_17531 ?auto_17532 ?auto_17533 ?auto_17536 ?auto_17535 ?auto_17534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17567 - SURFACE
      ?auto_17568 - SURFACE
    )
    :vars
    (
      ?auto_17569 - HOIST
      ?auto_17570 - PLACE
      ?auto_17572 - PLACE
      ?auto_17573 - HOIST
      ?auto_17574 - SURFACE
      ?auto_17571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17569 ?auto_17570 ) ( SURFACE-AT ?auto_17567 ?auto_17570 ) ( CLEAR ?auto_17567 ) ( IS-CRATE ?auto_17568 ) ( AVAILABLE ?auto_17569 ) ( not ( = ?auto_17572 ?auto_17570 ) ) ( HOIST-AT ?auto_17573 ?auto_17572 ) ( AVAILABLE ?auto_17573 ) ( SURFACE-AT ?auto_17568 ?auto_17572 ) ( ON ?auto_17568 ?auto_17574 ) ( CLEAR ?auto_17568 ) ( TRUCK-AT ?auto_17571 ?auto_17570 ) ( not ( = ?auto_17567 ?auto_17568 ) ) ( not ( = ?auto_17567 ?auto_17574 ) ) ( not ( = ?auto_17568 ?auto_17574 ) ) ( not ( = ?auto_17569 ?auto_17573 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17571 ?auto_17570 ?auto_17572 )
      ( !LIFT ?auto_17573 ?auto_17568 ?auto_17574 ?auto_17572 )
      ( !LOAD ?auto_17573 ?auto_17568 ?auto_17571 ?auto_17572 )
      ( !DRIVE ?auto_17571 ?auto_17572 ?auto_17570 )
      ( !UNLOAD ?auto_17569 ?auto_17568 ?auto_17571 ?auto_17570 )
      ( !DROP ?auto_17569 ?auto_17568 ?auto_17567 ?auto_17570 )
      ( MAKE-1CRATE-VERIFY ?auto_17567 ?auto_17568 ) )
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
      ?auto_17595 - SURFACE
      ?auto_17594 - SURFACE
      ?auto_17593 - SURFACE
      ?auto_17596 - SURFACE
    )
    :vars
    (
      ?auto_17600 - HOIST
      ?auto_17599 - PLACE
      ?auto_17598 - PLACE
      ?auto_17602 - HOIST
      ?auto_17601 - SURFACE
      ?auto_17608 - PLACE
      ?auto_17626 - HOIST
      ?auto_17613 - SURFACE
      ?auto_17627 - PLACE
      ?auto_17614 - HOIST
      ?auto_17624 - SURFACE
      ?auto_17623 - PLACE
      ?auto_17616 - HOIST
      ?auto_17609 - SURFACE
      ?auto_17618 - PLACE
      ?auto_17607 - HOIST
      ?auto_17619 - SURFACE
      ?auto_17621 - PLACE
      ?auto_17620 - HOIST
      ?auto_17611 - SURFACE
      ?auto_17617 - PLACE
      ?auto_17622 - HOIST
      ?auto_17610 - SURFACE
      ?auto_17603 - PLACE
      ?auto_17604 - HOIST
      ?auto_17625 - SURFACE
      ?auto_17606 - SURFACE
      ?auto_17615 - PLACE
      ?auto_17605 - HOIST
      ?auto_17612 - SURFACE
      ?auto_17597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17600 ?auto_17599 ) ( IS-CRATE ?auto_17596 ) ( not ( = ?auto_17598 ?auto_17599 ) ) ( HOIST-AT ?auto_17602 ?auto_17598 ) ( AVAILABLE ?auto_17602 ) ( SURFACE-AT ?auto_17596 ?auto_17598 ) ( ON ?auto_17596 ?auto_17601 ) ( CLEAR ?auto_17596 ) ( not ( = ?auto_17593 ?auto_17596 ) ) ( not ( = ?auto_17593 ?auto_17601 ) ) ( not ( = ?auto_17596 ?auto_17601 ) ) ( not ( = ?auto_17600 ?auto_17602 ) ) ( IS-CRATE ?auto_17593 ) ( not ( = ?auto_17608 ?auto_17599 ) ) ( HOIST-AT ?auto_17626 ?auto_17608 ) ( AVAILABLE ?auto_17626 ) ( SURFACE-AT ?auto_17593 ?auto_17608 ) ( ON ?auto_17593 ?auto_17613 ) ( CLEAR ?auto_17593 ) ( not ( = ?auto_17594 ?auto_17593 ) ) ( not ( = ?auto_17594 ?auto_17613 ) ) ( not ( = ?auto_17593 ?auto_17613 ) ) ( not ( = ?auto_17600 ?auto_17626 ) ) ( IS-CRATE ?auto_17594 ) ( not ( = ?auto_17627 ?auto_17599 ) ) ( HOIST-AT ?auto_17614 ?auto_17627 ) ( AVAILABLE ?auto_17614 ) ( SURFACE-AT ?auto_17594 ?auto_17627 ) ( ON ?auto_17594 ?auto_17624 ) ( CLEAR ?auto_17594 ) ( not ( = ?auto_17595 ?auto_17594 ) ) ( not ( = ?auto_17595 ?auto_17624 ) ) ( not ( = ?auto_17594 ?auto_17624 ) ) ( not ( = ?auto_17600 ?auto_17614 ) ) ( IS-CRATE ?auto_17595 ) ( not ( = ?auto_17623 ?auto_17599 ) ) ( HOIST-AT ?auto_17616 ?auto_17623 ) ( AVAILABLE ?auto_17616 ) ( SURFACE-AT ?auto_17595 ?auto_17623 ) ( ON ?auto_17595 ?auto_17609 ) ( CLEAR ?auto_17595 ) ( not ( = ?auto_17592 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17609 ) ) ( not ( = ?auto_17595 ?auto_17609 ) ) ( not ( = ?auto_17600 ?auto_17616 ) ) ( IS-CRATE ?auto_17592 ) ( not ( = ?auto_17618 ?auto_17599 ) ) ( HOIST-AT ?auto_17607 ?auto_17618 ) ( AVAILABLE ?auto_17607 ) ( SURFACE-AT ?auto_17592 ?auto_17618 ) ( ON ?auto_17592 ?auto_17619 ) ( CLEAR ?auto_17592 ) ( not ( = ?auto_17591 ?auto_17592 ) ) ( not ( = ?auto_17591 ?auto_17619 ) ) ( not ( = ?auto_17592 ?auto_17619 ) ) ( not ( = ?auto_17600 ?auto_17607 ) ) ( IS-CRATE ?auto_17591 ) ( not ( = ?auto_17621 ?auto_17599 ) ) ( HOIST-AT ?auto_17620 ?auto_17621 ) ( SURFACE-AT ?auto_17591 ?auto_17621 ) ( ON ?auto_17591 ?auto_17611 ) ( CLEAR ?auto_17591 ) ( not ( = ?auto_17590 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17611 ) ) ( not ( = ?auto_17591 ?auto_17611 ) ) ( not ( = ?auto_17600 ?auto_17620 ) ) ( IS-CRATE ?auto_17590 ) ( not ( = ?auto_17617 ?auto_17599 ) ) ( HOIST-AT ?auto_17622 ?auto_17617 ) ( AVAILABLE ?auto_17622 ) ( SURFACE-AT ?auto_17590 ?auto_17617 ) ( ON ?auto_17590 ?auto_17610 ) ( CLEAR ?auto_17590 ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17610 ) ) ( not ( = ?auto_17590 ?auto_17610 ) ) ( not ( = ?auto_17600 ?auto_17622 ) ) ( IS-CRATE ?auto_17589 ) ( not ( = ?auto_17603 ?auto_17599 ) ) ( HOIST-AT ?auto_17604 ?auto_17603 ) ( AVAILABLE ?auto_17604 ) ( SURFACE-AT ?auto_17589 ?auto_17603 ) ( ON ?auto_17589 ?auto_17625 ) ( CLEAR ?auto_17589 ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17625 ) ) ( not ( = ?auto_17589 ?auto_17625 ) ) ( not ( = ?auto_17600 ?auto_17604 ) ) ( IS-CRATE ?auto_17588 ) ( AVAILABLE ?auto_17620 ) ( SURFACE-AT ?auto_17588 ?auto_17621 ) ( ON ?auto_17588 ?auto_17606 ) ( CLEAR ?auto_17588 ) ( not ( = ?auto_17587 ?auto_17588 ) ) ( not ( = ?auto_17587 ?auto_17606 ) ) ( not ( = ?auto_17588 ?auto_17606 ) ) ( SURFACE-AT ?auto_17586 ?auto_17599 ) ( CLEAR ?auto_17586 ) ( IS-CRATE ?auto_17587 ) ( AVAILABLE ?auto_17600 ) ( not ( = ?auto_17615 ?auto_17599 ) ) ( HOIST-AT ?auto_17605 ?auto_17615 ) ( AVAILABLE ?auto_17605 ) ( SURFACE-AT ?auto_17587 ?auto_17615 ) ( ON ?auto_17587 ?auto_17612 ) ( CLEAR ?auto_17587 ) ( TRUCK-AT ?auto_17597 ?auto_17599 ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( not ( = ?auto_17586 ?auto_17612 ) ) ( not ( = ?auto_17587 ?auto_17612 ) ) ( not ( = ?auto_17600 ?auto_17605 ) ) ( not ( = ?auto_17586 ?auto_17588 ) ) ( not ( = ?auto_17586 ?auto_17606 ) ) ( not ( = ?auto_17588 ?auto_17612 ) ) ( not ( = ?auto_17621 ?auto_17615 ) ) ( not ( = ?auto_17620 ?auto_17605 ) ) ( not ( = ?auto_17606 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17625 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17625 ) ) ( not ( = ?auto_17589 ?auto_17606 ) ) ( not ( = ?auto_17589 ?auto_17612 ) ) ( not ( = ?auto_17603 ?auto_17621 ) ) ( not ( = ?auto_17603 ?auto_17615 ) ) ( not ( = ?auto_17604 ?auto_17620 ) ) ( not ( = ?auto_17604 ?auto_17605 ) ) ( not ( = ?auto_17625 ?auto_17606 ) ) ( not ( = ?auto_17625 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17590 ) ) ( not ( = ?auto_17586 ?auto_17610 ) ) ( not ( = ?auto_17587 ?auto_17590 ) ) ( not ( = ?auto_17587 ?auto_17610 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17588 ?auto_17610 ) ) ( not ( = ?auto_17590 ?auto_17625 ) ) ( not ( = ?auto_17590 ?auto_17606 ) ) ( not ( = ?auto_17590 ?auto_17612 ) ) ( not ( = ?auto_17617 ?auto_17603 ) ) ( not ( = ?auto_17617 ?auto_17621 ) ) ( not ( = ?auto_17617 ?auto_17615 ) ) ( not ( = ?auto_17622 ?auto_17604 ) ) ( not ( = ?auto_17622 ?auto_17620 ) ) ( not ( = ?auto_17622 ?auto_17605 ) ) ( not ( = ?auto_17610 ?auto_17625 ) ) ( not ( = ?auto_17610 ?auto_17606 ) ) ( not ( = ?auto_17610 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17591 ) ) ( not ( = ?auto_17586 ?auto_17611 ) ) ( not ( = ?auto_17587 ?auto_17591 ) ) ( not ( = ?auto_17587 ?auto_17611 ) ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( not ( = ?auto_17588 ?auto_17611 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17589 ?auto_17611 ) ) ( not ( = ?auto_17591 ?auto_17610 ) ) ( not ( = ?auto_17591 ?auto_17625 ) ) ( not ( = ?auto_17591 ?auto_17606 ) ) ( not ( = ?auto_17591 ?auto_17612 ) ) ( not ( = ?auto_17611 ?auto_17610 ) ) ( not ( = ?auto_17611 ?auto_17625 ) ) ( not ( = ?auto_17611 ?auto_17606 ) ) ( not ( = ?auto_17611 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17592 ) ) ( not ( = ?auto_17586 ?auto_17619 ) ) ( not ( = ?auto_17587 ?auto_17592 ) ) ( not ( = ?auto_17587 ?auto_17619 ) ) ( not ( = ?auto_17588 ?auto_17592 ) ) ( not ( = ?auto_17588 ?auto_17619 ) ) ( not ( = ?auto_17589 ?auto_17592 ) ) ( not ( = ?auto_17589 ?auto_17619 ) ) ( not ( = ?auto_17590 ?auto_17592 ) ) ( not ( = ?auto_17590 ?auto_17619 ) ) ( not ( = ?auto_17592 ?auto_17611 ) ) ( not ( = ?auto_17592 ?auto_17610 ) ) ( not ( = ?auto_17592 ?auto_17625 ) ) ( not ( = ?auto_17592 ?auto_17606 ) ) ( not ( = ?auto_17592 ?auto_17612 ) ) ( not ( = ?auto_17618 ?auto_17621 ) ) ( not ( = ?auto_17618 ?auto_17617 ) ) ( not ( = ?auto_17618 ?auto_17603 ) ) ( not ( = ?auto_17618 ?auto_17615 ) ) ( not ( = ?auto_17607 ?auto_17620 ) ) ( not ( = ?auto_17607 ?auto_17622 ) ) ( not ( = ?auto_17607 ?auto_17604 ) ) ( not ( = ?auto_17607 ?auto_17605 ) ) ( not ( = ?auto_17619 ?auto_17611 ) ) ( not ( = ?auto_17619 ?auto_17610 ) ) ( not ( = ?auto_17619 ?auto_17625 ) ) ( not ( = ?auto_17619 ?auto_17606 ) ) ( not ( = ?auto_17619 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17595 ) ) ( not ( = ?auto_17586 ?auto_17609 ) ) ( not ( = ?auto_17587 ?auto_17595 ) ) ( not ( = ?auto_17587 ?auto_17609 ) ) ( not ( = ?auto_17588 ?auto_17595 ) ) ( not ( = ?auto_17588 ?auto_17609 ) ) ( not ( = ?auto_17589 ?auto_17595 ) ) ( not ( = ?auto_17589 ?auto_17609 ) ) ( not ( = ?auto_17590 ?auto_17595 ) ) ( not ( = ?auto_17590 ?auto_17609 ) ) ( not ( = ?auto_17591 ?auto_17595 ) ) ( not ( = ?auto_17591 ?auto_17609 ) ) ( not ( = ?auto_17595 ?auto_17619 ) ) ( not ( = ?auto_17595 ?auto_17611 ) ) ( not ( = ?auto_17595 ?auto_17610 ) ) ( not ( = ?auto_17595 ?auto_17625 ) ) ( not ( = ?auto_17595 ?auto_17606 ) ) ( not ( = ?auto_17595 ?auto_17612 ) ) ( not ( = ?auto_17623 ?auto_17618 ) ) ( not ( = ?auto_17623 ?auto_17621 ) ) ( not ( = ?auto_17623 ?auto_17617 ) ) ( not ( = ?auto_17623 ?auto_17603 ) ) ( not ( = ?auto_17623 ?auto_17615 ) ) ( not ( = ?auto_17616 ?auto_17607 ) ) ( not ( = ?auto_17616 ?auto_17620 ) ) ( not ( = ?auto_17616 ?auto_17622 ) ) ( not ( = ?auto_17616 ?auto_17604 ) ) ( not ( = ?auto_17616 ?auto_17605 ) ) ( not ( = ?auto_17609 ?auto_17619 ) ) ( not ( = ?auto_17609 ?auto_17611 ) ) ( not ( = ?auto_17609 ?auto_17610 ) ) ( not ( = ?auto_17609 ?auto_17625 ) ) ( not ( = ?auto_17609 ?auto_17606 ) ) ( not ( = ?auto_17609 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17594 ) ) ( not ( = ?auto_17586 ?auto_17624 ) ) ( not ( = ?auto_17587 ?auto_17594 ) ) ( not ( = ?auto_17587 ?auto_17624 ) ) ( not ( = ?auto_17588 ?auto_17594 ) ) ( not ( = ?auto_17588 ?auto_17624 ) ) ( not ( = ?auto_17589 ?auto_17594 ) ) ( not ( = ?auto_17589 ?auto_17624 ) ) ( not ( = ?auto_17590 ?auto_17594 ) ) ( not ( = ?auto_17590 ?auto_17624 ) ) ( not ( = ?auto_17591 ?auto_17594 ) ) ( not ( = ?auto_17591 ?auto_17624 ) ) ( not ( = ?auto_17592 ?auto_17594 ) ) ( not ( = ?auto_17592 ?auto_17624 ) ) ( not ( = ?auto_17594 ?auto_17609 ) ) ( not ( = ?auto_17594 ?auto_17619 ) ) ( not ( = ?auto_17594 ?auto_17611 ) ) ( not ( = ?auto_17594 ?auto_17610 ) ) ( not ( = ?auto_17594 ?auto_17625 ) ) ( not ( = ?auto_17594 ?auto_17606 ) ) ( not ( = ?auto_17594 ?auto_17612 ) ) ( not ( = ?auto_17627 ?auto_17623 ) ) ( not ( = ?auto_17627 ?auto_17618 ) ) ( not ( = ?auto_17627 ?auto_17621 ) ) ( not ( = ?auto_17627 ?auto_17617 ) ) ( not ( = ?auto_17627 ?auto_17603 ) ) ( not ( = ?auto_17627 ?auto_17615 ) ) ( not ( = ?auto_17614 ?auto_17616 ) ) ( not ( = ?auto_17614 ?auto_17607 ) ) ( not ( = ?auto_17614 ?auto_17620 ) ) ( not ( = ?auto_17614 ?auto_17622 ) ) ( not ( = ?auto_17614 ?auto_17604 ) ) ( not ( = ?auto_17614 ?auto_17605 ) ) ( not ( = ?auto_17624 ?auto_17609 ) ) ( not ( = ?auto_17624 ?auto_17619 ) ) ( not ( = ?auto_17624 ?auto_17611 ) ) ( not ( = ?auto_17624 ?auto_17610 ) ) ( not ( = ?auto_17624 ?auto_17625 ) ) ( not ( = ?auto_17624 ?auto_17606 ) ) ( not ( = ?auto_17624 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17593 ) ) ( not ( = ?auto_17586 ?auto_17613 ) ) ( not ( = ?auto_17587 ?auto_17593 ) ) ( not ( = ?auto_17587 ?auto_17613 ) ) ( not ( = ?auto_17588 ?auto_17593 ) ) ( not ( = ?auto_17588 ?auto_17613 ) ) ( not ( = ?auto_17589 ?auto_17593 ) ) ( not ( = ?auto_17589 ?auto_17613 ) ) ( not ( = ?auto_17590 ?auto_17593 ) ) ( not ( = ?auto_17590 ?auto_17613 ) ) ( not ( = ?auto_17591 ?auto_17593 ) ) ( not ( = ?auto_17591 ?auto_17613 ) ) ( not ( = ?auto_17592 ?auto_17593 ) ) ( not ( = ?auto_17592 ?auto_17613 ) ) ( not ( = ?auto_17595 ?auto_17593 ) ) ( not ( = ?auto_17595 ?auto_17613 ) ) ( not ( = ?auto_17593 ?auto_17624 ) ) ( not ( = ?auto_17593 ?auto_17609 ) ) ( not ( = ?auto_17593 ?auto_17619 ) ) ( not ( = ?auto_17593 ?auto_17611 ) ) ( not ( = ?auto_17593 ?auto_17610 ) ) ( not ( = ?auto_17593 ?auto_17625 ) ) ( not ( = ?auto_17593 ?auto_17606 ) ) ( not ( = ?auto_17593 ?auto_17612 ) ) ( not ( = ?auto_17608 ?auto_17627 ) ) ( not ( = ?auto_17608 ?auto_17623 ) ) ( not ( = ?auto_17608 ?auto_17618 ) ) ( not ( = ?auto_17608 ?auto_17621 ) ) ( not ( = ?auto_17608 ?auto_17617 ) ) ( not ( = ?auto_17608 ?auto_17603 ) ) ( not ( = ?auto_17608 ?auto_17615 ) ) ( not ( = ?auto_17626 ?auto_17614 ) ) ( not ( = ?auto_17626 ?auto_17616 ) ) ( not ( = ?auto_17626 ?auto_17607 ) ) ( not ( = ?auto_17626 ?auto_17620 ) ) ( not ( = ?auto_17626 ?auto_17622 ) ) ( not ( = ?auto_17626 ?auto_17604 ) ) ( not ( = ?auto_17626 ?auto_17605 ) ) ( not ( = ?auto_17613 ?auto_17624 ) ) ( not ( = ?auto_17613 ?auto_17609 ) ) ( not ( = ?auto_17613 ?auto_17619 ) ) ( not ( = ?auto_17613 ?auto_17611 ) ) ( not ( = ?auto_17613 ?auto_17610 ) ) ( not ( = ?auto_17613 ?auto_17625 ) ) ( not ( = ?auto_17613 ?auto_17606 ) ) ( not ( = ?auto_17613 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17596 ) ) ( not ( = ?auto_17586 ?auto_17601 ) ) ( not ( = ?auto_17587 ?auto_17596 ) ) ( not ( = ?auto_17587 ?auto_17601 ) ) ( not ( = ?auto_17588 ?auto_17596 ) ) ( not ( = ?auto_17588 ?auto_17601 ) ) ( not ( = ?auto_17589 ?auto_17596 ) ) ( not ( = ?auto_17589 ?auto_17601 ) ) ( not ( = ?auto_17590 ?auto_17596 ) ) ( not ( = ?auto_17590 ?auto_17601 ) ) ( not ( = ?auto_17591 ?auto_17596 ) ) ( not ( = ?auto_17591 ?auto_17601 ) ) ( not ( = ?auto_17592 ?auto_17596 ) ) ( not ( = ?auto_17592 ?auto_17601 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17601 ) ) ( not ( = ?auto_17594 ?auto_17596 ) ) ( not ( = ?auto_17594 ?auto_17601 ) ) ( not ( = ?auto_17596 ?auto_17613 ) ) ( not ( = ?auto_17596 ?auto_17624 ) ) ( not ( = ?auto_17596 ?auto_17609 ) ) ( not ( = ?auto_17596 ?auto_17619 ) ) ( not ( = ?auto_17596 ?auto_17611 ) ) ( not ( = ?auto_17596 ?auto_17610 ) ) ( not ( = ?auto_17596 ?auto_17625 ) ) ( not ( = ?auto_17596 ?auto_17606 ) ) ( not ( = ?auto_17596 ?auto_17612 ) ) ( not ( = ?auto_17598 ?auto_17608 ) ) ( not ( = ?auto_17598 ?auto_17627 ) ) ( not ( = ?auto_17598 ?auto_17623 ) ) ( not ( = ?auto_17598 ?auto_17618 ) ) ( not ( = ?auto_17598 ?auto_17621 ) ) ( not ( = ?auto_17598 ?auto_17617 ) ) ( not ( = ?auto_17598 ?auto_17603 ) ) ( not ( = ?auto_17598 ?auto_17615 ) ) ( not ( = ?auto_17602 ?auto_17626 ) ) ( not ( = ?auto_17602 ?auto_17614 ) ) ( not ( = ?auto_17602 ?auto_17616 ) ) ( not ( = ?auto_17602 ?auto_17607 ) ) ( not ( = ?auto_17602 ?auto_17620 ) ) ( not ( = ?auto_17602 ?auto_17622 ) ) ( not ( = ?auto_17602 ?auto_17604 ) ) ( not ( = ?auto_17602 ?auto_17605 ) ) ( not ( = ?auto_17601 ?auto_17613 ) ) ( not ( = ?auto_17601 ?auto_17624 ) ) ( not ( = ?auto_17601 ?auto_17609 ) ) ( not ( = ?auto_17601 ?auto_17619 ) ) ( not ( = ?auto_17601 ?auto_17611 ) ) ( not ( = ?auto_17601 ?auto_17610 ) ) ( not ( = ?auto_17601 ?auto_17625 ) ) ( not ( = ?auto_17601 ?auto_17606 ) ) ( not ( = ?auto_17601 ?auto_17612 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ?auto_17590 ?auto_17591 ?auto_17592 ?auto_17595 ?auto_17594 ?auto_17593 )
      ( MAKE-1CRATE ?auto_17593 ?auto_17596 )
      ( MAKE-10CRATE-VERIFY ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ?auto_17590 ?auto_17591 ?auto_17592 ?auto_17595 ?auto_17594 ?auto_17593 ?auto_17596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17630 - SURFACE
      ?auto_17631 - SURFACE
    )
    :vars
    (
      ?auto_17632 - HOIST
      ?auto_17633 - PLACE
      ?auto_17635 - PLACE
      ?auto_17636 - HOIST
      ?auto_17637 - SURFACE
      ?auto_17634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17632 ?auto_17633 ) ( SURFACE-AT ?auto_17630 ?auto_17633 ) ( CLEAR ?auto_17630 ) ( IS-CRATE ?auto_17631 ) ( AVAILABLE ?auto_17632 ) ( not ( = ?auto_17635 ?auto_17633 ) ) ( HOIST-AT ?auto_17636 ?auto_17635 ) ( AVAILABLE ?auto_17636 ) ( SURFACE-AT ?auto_17631 ?auto_17635 ) ( ON ?auto_17631 ?auto_17637 ) ( CLEAR ?auto_17631 ) ( TRUCK-AT ?auto_17634 ?auto_17633 ) ( not ( = ?auto_17630 ?auto_17631 ) ) ( not ( = ?auto_17630 ?auto_17637 ) ) ( not ( = ?auto_17631 ?auto_17637 ) ) ( not ( = ?auto_17632 ?auto_17636 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17634 ?auto_17633 ?auto_17635 )
      ( !LIFT ?auto_17636 ?auto_17631 ?auto_17637 ?auto_17635 )
      ( !LOAD ?auto_17636 ?auto_17631 ?auto_17634 ?auto_17635 )
      ( !DRIVE ?auto_17634 ?auto_17635 ?auto_17633 )
      ( !UNLOAD ?auto_17632 ?auto_17631 ?auto_17634 ?auto_17633 )
      ( !DROP ?auto_17632 ?auto_17631 ?auto_17630 ?auto_17633 )
      ( MAKE-1CRATE-VERIFY ?auto_17630 ?auto_17631 ) )
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
      ?auto_17659 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17657 - SURFACE
      ?auto_17660 - SURFACE
      ?auto_17661 - SURFACE
    )
    :vars
    (
      ?auto_17662 - HOIST
      ?auto_17666 - PLACE
      ?auto_17663 - PLACE
      ?auto_17667 - HOIST
      ?auto_17664 - SURFACE
      ?auto_17681 - PLACE
      ?auto_17677 - HOIST
      ?auto_17690 - SURFACE
      ?auto_17682 - PLACE
      ?auto_17673 - HOIST
      ?auto_17678 - SURFACE
      ?auto_17675 - PLACE
      ?auto_17691 - HOIST
      ?auto_17671 - SURFACE
      ?auto_17670 - PLACE
      ?auto_17674 - HOIST
      ?auto_17686 - SURFACE
      ?auto_17687 - PLACE
      ?auto_17689 - HOIST
      ?auto_17692 - SURFACE
      ?auto_17694 - PLACE
      ?auto_17695 - HOIST
      ?auto_17672 - SURFACE
      ?auto_17688 - PLACE
      ?auto_17668 - HOIST
      ?auto_17669 - SURFACE
      ?auto_17684 - PLACE
      ?auto_17685 - HOIST
      ?auto_17676 - SURFACE
      ?auto_17683 - SURFACE
      ?auto_17680 - PLACE
      ?auto_17693 - HOIST
      ?auto_17679 - SURFACE
      ?auto_17665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17662 ?auto_17666 ) ( IS-CRATE ?auto_17661 ) ( not ( = ?auto_17663 ?auto_17666 ) ) ( HOIST-AT ?auto_17667 ?auto_17663 ) ( AVAILABLE ?auto_17667 ) ( SURFACE-AT ?auto_17661 ?auto_17663 ) ( ON ?auto_17661 ?auto_17664 ) ( CLEAR ?auto_17661 ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17664 ) ) ( not ( = ?auto_17661 ?auto_17664 ) ) ( not ( = ?auto_17662 ?auto_17667 ) ) ( IS-CRATE ?auto_17660 ) ( not ( = ?auto_17681 ?auto_17666 ) ) ( HOIST-AT ?auto_17677 ?auto_17681 ) ( AVAILABLE ?auto_17677 ) ( SURFACE-AT ?auto_17660 ?auto_17681 ) ( ON ?auto_17660 ?auto_17690 ) ( CLEAR ?auto_17660 ) ( not ( = ?auto_17657 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17690 ) ) ( not ( = ?auto_17660 ?auto_17690 ) ) ( not ( = ?auto_17662 ?auto_17677 ) ) ( IS-CRATE ?auto_17657 ) ( not ( = ?auto_17682 ?auto_17666 ) ) ( HOIST-AT ?auto_17673 ?auto_17682 ) ( AVAILABLE ?auto_17673 ) ( SURFACE-AT ?auto_17657 ?auto_17682 ) ( ON ?auto_17657 ?auto_17678 ) ( CLEAR ?auto_17657 ) ( not ( = ?auto_17658 ?auto_17657 ) ) ( not ( = ?auto_17658 ?auto_17678 ) ) ( not ( = ?auto_17657 ?auto_17678 ) ) ( not ( = ?auto_17662 ?auto_17673 ) ) ( IS-CRATE ?auto_17658 ) ( not ( = ?auto_17675 ?auto_17666 ) ) ( HOIST-AT ?auto_17691 ?auto_17675 ) ( AVAILABLE ?auto_17691 ) ( SURFACE-AT ?auto_17658 ?auto_17675 ) ( ON ?auto_17658 ?auto_17671 ) ( CLEAR ?auto_17658 ) ( not ( = ?auto_17659 ?auto_17658 ) ) ( not ( = ?auto_17659 ?auto_17671 ) ) ( not ( = ?auto_17658 ?auto_17671 ) ) ( not ( = ?auto_17662 ?auto_17691 ) ) ( IS-CRATE ?auto_17659 ) ( not ( = ?auto_17670 ?auto_17666 ) ) ( HOIST-AT ?auto_17674 ?auto_17670 ) ( AVAILABLE ?auto_17674 ) ( SURFACE-AT ?auto_17659 ?auto_17670 ) ( ON ?auto_17659 ?auto_17686 ) ( CLEAR ?auto_17659 ) ( not ( = ?auto_17656 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17686 ) ) ( not ( = ?auto_17659 ?auto_17686 ) ) ( not ( = ?auto_17662 ?auto_17674 ) ) ( IS-CRATE ?auto_17656 ) ( not ( = ?auto_17687 ?auto_17666 ) ) ( HOIST-AT ?auto_17689 ?auto_17687 ) ( AVAILABLE ?auto_17689 ) ( SURFACE-AT ?auto_17656 ?auto_17687 ) ( ON ?auto_17656 ?auto_17692 ) ( CLEAR ?auto_17656 ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17692 ) ) ( not ( = ?auto_17656 ?auto_17692 ) ) ( not ( = ?auto_17662 ?auto_17689 ) ) ( IS-CRATE ?auto_17655 ) ( not ( = ?auto_17694 ?auto_17666 ) ) ( HOIST-AT ?auto_17695 ?auto_17694 ) ( SURFACE-AT ?auto_17655 ?auto_17694 ) ( ON ?auto_17655 ?auto_17672 ) ( CLEAR ?auto_17655 ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17672 ) ) ( not ( = ?auto_17655 ?auto_17672 ) ) ( not ( = ?auto_17662 ?auto_17695 ) ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17688 ?auto_17666 ) ) ( HOIST-AT ?auto_17668 ?auto_17688 ) ( AVAILABLE ?auto_17668 ) ( SURFACE-AT ?auto_17654 ?auto_17688 ) ( ON ?auto_17654 ?auto_17669 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17669 ) ) ( not ( = ?auto_17654 ?auto_17669 ) ) ( not ( = ?auto_17662 ?auto_17668 ) ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17684 ?auto_17666 ) ) ( HOIST-AT ?auto_17685 ?auto_17684 ) ( AVAILABLE ?auto_17685 ) ( SURFACE-AT ?auto_17653 ?auto_17684 ) ( ON ?auto_17653 ?auto_17676 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17676 ) ) ( not ( = ?auto_17653 ?auto_17676 ) ) ( not ( = ?auto_17662 ?auto_17685 ) ) ( IS-CRATE ?auto_17652 ) ( AVAILABLE ?auto_17695 ) ( SURFACE-AT ?auto_17652 ?auto_17694 ) ( ON ?auto_17652 ?auto_17683 ) ( CLEAR ?auto_17652 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17683 ) ) ( not ( = ?auto_17652 ?auto_17683 ) ) ( SURFACE-AT ?auto_17650 ?auto_17666 ) ( CLEAR ?auto_17650 ) ( IS-CRATE ?auto_17651 ) ( AVAILABLE ?auto_17662 ) ( not ( = ?auto_17680 ?auto_17666 ) ) ( HOIST-AT ?auto_17693 ?auto_17680 ) ( AVAILABLE ?auto_17693 ) ( SURFACE-AT ?auto_17651 ?auto_17680 ) ( ON ?auto_17651 ?auto_17679 ) ( CLEAR ?auto_17651 ) ( TRUCK-AT ?auto_17665 ?auto_17666 ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17650 ?auto_17679 ) ) ( not ( = ?auto_17651 ?auto_17679 ) ) ( not ( = ?auto_17662 ?auto_17693 ) ) ( not ( = ?auto_17650 ?auto_17652 ) ) ( not ( = ?auto_17650 ?auto_17683 ) ) ( not ( = ?auto_17652 ?auto_17679 ) ) ( not ( = ?auto_17694 ?auto_17680 ) ) ( not ( = ?auto_17695 ?auto_17693 ) ) ( not ( = ?auto_17683 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17653 ) ) ( not ( = ?auto_17650 ?auto_17676 ) ) ( not ( = ?auto_17651 ?auto_17653 ) ) ( not ( = ?auto_17651 ?auto_17676 ) ) ( not ( = ?auto_17653 ?auto_17683 ) ) ( not ( = ?auto_17653 ?auto_17679 ) ) ( not ( = ?auto_17684 ?auto_17694 ) ) ( not ( = ?auto_17684 ?auto_17680 ) ) ( not ( = ?auto_17685 ?auto_17695 ) ) ( not ( = ?auto_17685 ?auto_17693 ) ) ( not ( = ?auto_17676 ?auto_17683 ) ) ( not ( = ?auto_17676 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17654 ) ) ( not ( = ?auto_17650 ?auto_17669 ) ) ( not ( = ?auto_17651 ?auto_17654 ) ) ( not ( = ?auto_17651 ?auto_17669 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17669 ) ) ( not ( = ?auto_17654 ?auto_17676 ) ) ( not ( = ?auto_17654 ?auto_17683 ) ) ( not ( = ?auto_17654 ?auto_17679 ) ) ( not ( = ?auto_17688 ?auto_17684 ) ) ( not ( = ?auto_17688 ?auto_17694 ) ) ( not ( = ?auto_17688 ?auto_17680 ) ) ( not ( = ?auto_17668 ?auto_17685 ) ) ( not ( = ?auto_17668 ?auto_17695 ) ) ( not ( = ?auto_17668 ?auto_17693 ) ) ( not ( = ?auto_17669 ?auto_17676 ) ) ( not ( = ?auto_17669 ?auto_17683 ) ) ( not ( = ?auto_17669 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17655 ) ) ( not ( = ?auto_17650 ?auto_17672 ) ) ( not ( = ?auto_17651 ?auto_17655 ) ) ( not ( = ?auto_17651 ?auto_17672 ) ) ( not ( = ?auto_17652 ?auto_17655 ) ) ( not ( = ?auto_17652 ?auto_17672 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17672 ) ) ( not ( = ?auto_17655 ?auto_17669 ) ) ( not ( = ?auto_17655 ?auto_17676 ) ) ( not ( = ?auto_17655 ?auto_17683 ) ) ( not ( = ?auto_17655 ?auto_17679 ) ) ( not ( = ?auto_17672 ?auto_17669 ) ) ( not ( = ?auto_17672 ?auto_17676 ) ) ( not ( = ?auto_17672 ?auto_17683 ) ) ( not ( = ?auto_17672 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17656 ) ) ( not ( = ?auto_17650 ?auto_17692 ) ) ( not ( = ?auto_17651 ?auto_17656 ) ) ( not ( = ?auto_17651 ?auto_17692 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17692 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17692 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17692 ) ) ( not ( = ?auto_17656 ?auto_17672 ) ) ( not ( = ?auto_17656 ?auto_17669 ) ) ( not ( = ?auto_17656 ?auto_17676 ) ) ( not ( = ?auto_17656 ?auto_17683 ) ) ( not ( = ?auto_17656 ?auto_17679 ) ) ( not ( = ?auto_17687 ?auto_17694 ) ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( not ( = ?auto_17687 ?auto_17684 ) ) ( not ( = ?auto_17687 ?auto_17680 ) ) ( not ( = ?auto_17689 ?auto_17695 ) ) ( not ( = ?auto_17689 ?auto_17668 ) ) ( not ( = ?auto_17689 ?auto_17685 ) ) ( not ( = ?auto_17689 ?auto_17693 ) ) ( not ( = ?auto_17692 ?auto_17672 ) ) ( not ( = ?auto_17692 ?auto_17669 ) ) ( not ( = ?auto_17692 ?auto_17676 ) ) ( not ( = ?auto_17692 ?auto_17683 ) ) ( not ( = ?auto_17692 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17659 ) ) ( not ( = ?auto_17650 ?auto_17686 ) ) ( not ( = ?auto_17651 ?auto_17659 ) ) ( not ( = ?auto_17651 ?auto_17686 ) ) ( not ( = ?auto_17652 ?auto_17659 ) ) ( not ( = ?auto_17652 ?auto_17686 ) ) ( not ( = ?auto_17653 ?auto_17659 ) ) ( not ( = ?auto_17653 ?auto_17686 ) ) ( not ( = ?auto_17654 ?auto_17659 ) ) ( not ( = ?auto_17654 ?auto_17686 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( not ( = ?auto_17655 ?auto_17686 ) ) ( not ( = ?auto_17659 ?auto_17692 ) ) ( not ( = ?auto_17659 ?auto_17672 ) ) ( not ( = ?auto_17659 ?auto_17669 ) ) ( not ( = ?auto_17659 ?auto_17676 ) ) ( not ( = ?auto_17659 ?auto_17683 ) ) ( not ( = ?auto_17659 ?auto_17679 ) ) ( not ( = ?auto_17670 ?auto_17687 ) ) ( not ( = ?auto_17670 ?auto_17694 ) ) ( not ( = ?auto_17670 ?auto_17688 ) ) ( not ( = ?auto_17670 ?auto_17684 ) ) ( not ( = ?auto_17670 ?auto_17680 ) ) ( not ( = ?auto_17674 ?auto_17689 ) ) ( not ( = ?auto_17674 ?auto_17695 ) ) ( not ( = ?auto_17674 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17685 ) ) ( not ( = ?auto_17674 ?auto_17693 ) ) ( not ( = ?auto_17686 ?auto_17692 ) ) ( not ( = ?auto_17686 ?auto_17672 ) ) ( not ( = ?auto_17686 ?auto_17669 ) ) ( not ( = ?auto_17686 ?auto_17676 ) ) ( not ( = ?auto_17686 ?auto_17683 ) ) ( not ( = ?auto_17686 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17658 ) ) ( not ( = ?auto_17650 ?auto_17671 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17651 ?auto_17671 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17671 ) ) ( not ( = ?auto_17653 ?auto_17658 ) ) ( not ( = ?auto_17653 ?auto_17671 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17671 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17671 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17671 ) ) ( not ( = ?auto_17658 ?auto_17686 ) ) ( not ( = ?auto_17658 ?auto_17692 ) ) ( not ( = ?auto_17658 ?auto_17672 ) ) ( not ( = ?auto_17658 ?auto_17669 ) ) ( not ( = ?auto_17658 ?auto_17676 ) ) ( not ( = ?auto_17658 ?auto_17683 ) ) ( not ( = ?auto_17658 ?auto_17679 ) ) ( not ( = ?auto_17675 ?auto_17670 ) ) ( not ( = ?auto_17675 ?auto_17687 ) ) ( not ( = ?auto_17675 ?auto_17694 ) ) ( not ( = ?auto_17675 ?auto_17688 ) ) ( not ( = ?auto_17675 ?auto_17684 ) ) ( not ( = ?auto_17675 ?auto_17680 ) ) ( not ( = ?auto_17691 ?auto_17674 ) ) ( not ( = ?auto_17691 ?auto_17689 ) ) ( not ( = ?auto_17691 ?auto_17695 ) ) ( not ( = ?auto_17691 ?auto_17668 ) ) ( not ( = ?auto_17691 ?auto_17685 ) ) ( not ( = ?auto_17691 ?auto_17693 ) ) ( not ( = ?auto_17671 ?auto_17686 ) ) ( not ( = ?auto_17671 ?auto_17692 ) ) ( not ( = ?auto_17671 ?auto_17672 ) ) ( not ( = ?auto_17671 ?auto_17669 ) ) ( not ( = ?auto_17671 ?auto_17676 ) ) ( not ( = ?auto_17671 ?auto_17683 ) ) ( not ( = ?auto_17671 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17657 ) ) ( not ( = ?auto_17650 ?auto_17678 ) ) ( not ( = ?auto_17651 ?auto_17657 ) ) ( not ( = ?auto_17651 ?auto_17678 ) ) ( not ( = ?auto_17652 ?auto_17657 ) ) ( not ( = ?auto_17652 ?auto_17678 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17653 ?auto_17678 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17678 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17678 ) ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17678 ) ) ( not ( = ?auto_17659 ?auto_17657 ) ) ( not ( = ?auto_17659 ?auto_17678 ) ) ( not ( = ?auto_17657 ?auto_17671 ) ) ( not ( = ?auto_17657 ?auto_17686 ) ) ( not ( = ?auto_17657 ?auto_17692 ) ) ( not ( = ?auto_17657 ?auto_17672 ) ) ( not ( = ?auto_17657 ?auto_17669 ) ) ( not ( = ?auto_17657 ?auto_17676 ) ) ( not ( = ?auto_17657 ?auto_17683 ) ) ( not ( = ?auto_17657 ?auto_17679 ) ) ( not ( = ?auto_17682 ?auto_17675 ) ) ( not ( = ?auto_17682 ?auto_17670 ) ) ( not ( = ?auto_17682 ?auto_17687 ) ) ( not ( = ?auto_17682 ?auto_17694 ) ) ( not ( = ?auto_17682 ?auto_17688 ) ) ( not ( = ?auto_17682 ?auto_17684 ) ) ( not ( = ?auto_17682 ?auto_17680 ) ) ( not ( = ?auto_17673 ?auto_17691 ) ) ( not ( = ?auto_17673 ?auto_17674 ) ) ( not ( = ?auto_17673 ?auto_17689 ) ) ( not ( = ?auto_17673 ?auto_17695 ) ) ( not ( = ?auto_17673 ?auto_17668 ) ) ( not ( = ?auto_17673 ?auto_17685 ) ) ( not ( = ?auto_17673 ?auto_17693 ) ) ( not ( = ?auto_17678 ?auto_17671 ) ) ( not ( = ?auto_17678 ?auto_17686 ) ) ( not ( = ?auto_17678 ?auto_17692 ) ) ( not ( = ?auto_17678 ?auto_17672 ) ) ( not ( = ?auto_17678 ?auto_17669 ) ) ( not ( = ?auto_17678 ?auto_17676 ) ) ( not ( = ?auto_17678 ?auto_17683 ) ) ( not ( = ?auto_17678 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17660 ) ) ( not ( = ?auto_17650 ?auto_17690 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17651 ?auto_17690 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17652 ?auto_17690 ) ) ( not ( = ?auto_17653 ?auto_17660 ) ) ( not ( = ?auto_17653 ?auto_17690 ) ) ( not ( = ?auto_17654 ?auto_17660 ) ) ( not ( = ?auto_17654 ?auto_17690 ) ) ( not ( = ?auto_17655 ?auto_17660 ) ) ( not ( = ?auto_17655 ?auto_17690 ) ) ( not ( = ?auto_17656 ?auto_17660 ) ) ( not ( = ?auto_17656 ?auto_17690 ) ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17690 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17690 ) ) ( not ( = ?auto_17660 ?auto_17678 ) ) ( not ( = ?auto_17660 ?auto_17671 ) ) ( not ( = ?auto_17660 ?auto_17686 ) ) ( not ( = ?auto_17660 ?auto_17692 ) ) ( not ( = ?auto_17660 ?auto_17672 ) ) ( not ( = ?auto_17660 ?auto_17669 ) ) ( not ( = ?auto_17660 ?auto_17676 ) ) ( not ( = ?auto_17660 ?auto_17683 ) ) ( not ( = ?auto_17660 ?auto_17679 ) ) ( not ( = ?auto_17681 ?auto_17682 ) ) ( not ( = ?auto_17681 ?auto_17675 ) ) ( not ( = ?auto_17681 ?auto_17670 ) ) ( not ( = ?auto_17681 ?auto_17687 ) ) ( not ( = ?auto_17681 ?auto_17694 ) ) ( not ( = ?auto_17681 ?auto_17688 ) ) ( not ( = ?auto_17681 ?auto_17684 ) ) ( not ( = ?auto_17681 ?auto_17680 ) ) ( not ( = ?auto_17677 ?auto_17673 ) ) ( not ( = ?auto_17677 ?auto_17691 ) ) ( not ( = ?auto_17677 ?auto_17674 ) ) ( not ( = ?auto_17677 ?auto_17689 ) ) ( not ( = ?auto_17677 ?auto_17695 ) ) ( not ( = ?auto_17677 ?auto_17668 ) ) ( not ( = ?auto_17677 ?auto_17685 ) ) ( not ( = ?auto_17677 ?auto_17693 ) ) ( not ( = ?auto_17690 ?auto_17678 ) ) ( not ( = ?auto_17690 ?auto_17671 ) ) ( not ( = ?auto_17690 ?auto_17686 ) ) ( not ( = ?auto_17690 ?auto_17692 ) ) ( not ( = ?auto_17690 ?auto_17672 ) ) ( not ( = ?auto_17690 ?auto_17669 ) ) ( not ( = ?auto_17690 ?auto_17676 ) ) ( not ( = ?auto_17690 ?auto_17683 ) ) ( not ( = ?auto_17690 ?auto_17679 ) ) ( not ( = ?auto_17650 ?auto_17661 ) ) ( not ( = ?auto_17650 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17661 ) ) ( not ( = ?auto_17651 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17661 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17653 ?auto_17661 ) ) ( not ( = ?auto_17653 ?auto_17664 ) ) ( not ( = ?auto_17654 ?auto_17661 ) ) ( not ( = ?auto_17654 ?auto_17664 ) ) ( not ( = ?auto_17655 ?auto_17661 ) ) ( not ( = ?auto_17655 ?auto_17664 ) ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17656 ?auto_17664 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17659 ?auto_17664 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17664 ) ) ( not ( = ?auto_17657 ?auto_17661 ) ) ( not ( = ?auto_17657 ?auto_17664 ) ) ( not ( = ?auto_17661 ?auto_17690 ) ) ( not ( = ?auto_17661 ?auto_17678 ) ) ( not ( = ?auto_17661 ?auto_17671 ) ) ( not ( = ?auto_17661 ?auto_17686 ) ) ( not ( = ?auto_17661 ?auto_17692 ) ) ( not ( = ?auto_17661 ?auto_17672 ) ) ( not ( = ?auto_17661 ?auto_17669 ) ) ( not ( = ?auto_17661 ?auto_17676 ) ) ( not ( = ?auto_17661 ?auto_17683 ) ) ( not ( = ?auto_17661 ?auto_17679 ) ) ( not ( = ?auto_17663 ?auto_17681 ) ) ( not ( = ?auto_17663 ?auto_17682 ) ) ( not ( = ?auto_17663 ?auto_17675 ) ) ( not ( = ?auto_17663 ?auto_17670 ) ) ( not ( = ?auto_17663 ?auto_17687 ) ) ( not ( = ?auto_17663 ?auto_17694 ) ) ( not ( = ?auto_17663 ?auto_17688 ) ) ( not ( = ?auto_17663 ?auto_17684 ) ) ( not ( = ?auto_17663 ?auto_17680 ) ) ( not ( = ?auto_17667 ?auto_17677 ) ) ( not ( = ?auto_17667 ?auto_17673 ) ) ( not ( = ?auto_17667 ?auto_17691 ) ) ( not ( = ?auto_17667 ?auto_17674 ) ) ( not ( = ?auto_17667 ?auto_17689 ) ) ( not ( = ?auto_17667 ?auto_17695 ) ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17685 ) ) ( not ( = ?auto_17667 ?auto_17693 ) ) ( not ( = ?auto_17664 ?auto_17690 ) ) ( not ( = ?auto_17664 ?auto_17678 ) ) ( not ( = ?auto_17664 ?auto_17671 ) ) ( not ( = ?auto_17664 ?auto_17686 ) ) ( not ( = ?auto_17664 ?auto_17692 ) ) ( not ( = ?auto_17664 ?auto_17672 ) ) ( not ( = ?auto_17664 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17676 ) ) ( not ( = ?auto_17664 ?auto_17683 ) ) ( not ( = ?auto_17664 ?auto_17679 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17650 ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17659 ?auto_17658 ?auto_17657 ?auto_17660 )
      ( MAKE-1CRATE ?auto_17660 ?auto_17661 )
      ( MAKE-11CRATE-VERIFY ?auto_17650 ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17659 ?auto_17658 ?auto_17657 ?auto_17660 ?auto_17661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17698 - SURFACE
      ?auto_17699 - SURFACE
    )
    :vars
    (
      ?auto_17700 - HOIST
      ?auto_17701 - PLACE
      ?auto_17703 - PLACE
      ?auto_17704 - HOIST
      ?auto_17705 - SURFACE
      ?auto_17702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17700 ?auto_17701 ) ( SURFACE-AT ?auto_17698 ?auto_17701 ) ( CLEAR ?auto_17698 ) ( IS-CRATE ?auto_17699 ) ( AVAILABLE ?auto_17700 ) ( not ( = ?auto_17703 ?auto_17701 ) ) ( HOIST-AT ?auto_17704 ?auto_17703 ) ( AVAILABLE ?auto_17704 ) ( SURFACE-AT ?auto_17699 ?auto_17703 ) ( ON ?auto_17699 ?auto_17705 ) ( CLEAR ?auto_17699 ) ( TRUCK-AT ?auto_17702 ?auto_17701 ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17705 ) ) ( not ( = ?auto_17699 ?auto_17705 ) ) ( not ( = ?auto_17700 ?auto_17704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17702 ?auto_17701 ?auto_17703 )
      ( !LIFT ?auto_17704 ?auto_17699 ?auto_17705 ?auto_17703 )
      ( !LOAD ?auto_17704 ?auto_17699 ?auto_17702 ?auto_17703 )
      ( !DRIVE ?auto_17702 ?auto_17703 ?auto_17701 )
      ( !UNLOAD ?auto_17700 ?auto_17699 ?auto_17702 ?auto_17701 )
      ( !DROP ?auto_17700 ?auto_17699 ?auto_17698 ?auto_17701 )
      ( MAKE-1CRATE-VERIFY ?auto_17698 ?auto_17699 ) )
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
      ?auto_17728 - SURFACE
      ?auto_17727 - SURFACE
      ?auto_17726 - SURFACE
      ?auto_17729 - SURFACE
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
    )
    :vars
    (
      ?auto_17734 - HOIST
      ?auto_17733 - PLACE
      ?auto_17732 - PLACE
      ?auto_17736 - HOIST
      ?auto_17737 - SURFACE
      ?auto_17745 - PLACE
      ?auto_17750 - HOIST
      ?auto_17753 - SURFACE
      ?auto_17743 - PLACE
      ?auto_17762 - HOIST
      ?auto_17739 - SURFACE
      ?auto_17765 - PLACE
      ?auto_17757 - HOIST
      ?auto_17761 - SURFACE
      ?auto_17764 - PLACE
      ?auto_17754 - HOIST
      ?auto_17755 - SURFACE
      ?auto_17747 - PLACE
      ?auto_17766 - HOIST
      ?auto_17751 - SURFACE
      ?auto_17749 - PLACE
      ?auto_17742 - HOIST
      ?auto_17746 - SURFACE
      ?auto_17758 - PLACE
      ?auto_17738 - HOIST
      ?auto_17756 - SURFACE
      ?auto_17760 - PLACE
      ?auto_17752 - HOIST
      ?auto_17740 - SURFACE
      ?auto_17748 - PLACE
      ?auto_17767 - HOIST
      ?auto_17759 - SURFACE
      ?auto_17741 - SURFACE
      ?auto_17763 - PLACE
      ?auto_17768 - HOIST
      ?auto_17744 - SURFACE
      ?auto_17735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17734 ?auto_17733 ) ( IS-CRATE ?auto_17731 ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( HOIST-AT ?auto_17736 ?auto_17732 ) ( AVAILABLE ?auto_17736 ) ( SURFACE-AT ?auto_17731 ?auto_17732 ) ( ON ?auto_17731 ?auto_17737 ) ( CLEAR ?auto_17731 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17737 ) ) ( not ( = ?auto_17731 ?auto_17737 ) ) ( not ( = ?auto_17734 ?auto_17736 ) ) ( IS-CRATE ?auto_17730 ) ( not ( = ?auto_17745 ?auto_17733 ) ) ( HOIST-AT ?auto_17750 ?auto_17745 ) ( AVAILABLE ?auto_17750 ) ( SURFACE-AT ?auto_17730 ?auto_17745 ) ( ON ?auto_17730 ?auto_17753 ) ( CLEAR ?auto_17730 ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17753 ) ) ( not ( = ?auto_17730 ?auto_17753 ) ) ( not ( = ?auto_17734 ?auto_17750 ) ) ( IS-CRATE ?auto_17729 ) ( not ( = ?auto_17743 ?auto_17733 ) ) ( HOIST-AT ?auto_17762 ?auto_17743 ) ( AVAILABLE ?auto_17762 ) ( SURFACE-AT ?auto_17729 ?auto_17743 ) ( ON ?auto_17729 ?auto_17739 ) ( CLEAR ?auto_17729 ) ( not ( = ?auto_17726 ?auto_17729 ) ) ( not ( = ?auto_17726 ?auto_17739 ) ) ( not ( = ?auto_17729 ?auto_17739 ) ) ( not ( = ?auto_17734 ?auto_17762 ) ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17765 ?auto_17733 ) ) ( HOIST-AT ?auto_17757 ?auto_17765 ) ( AVAILABLE ?auto_17757 ) ( SURFACE-AT ?auto_17726 ?auto_17765 ) ( ON ?auto_17726 ?auto_17761 ) ( CLEAR ?auto_17726 ) ( not ( = ?auto_17727 ?auto_17726 ) ) ( not ( = ?auto_17727 ?auto_17761 ) ) ( not ( = ?auto_17726 ?auto_17761 ) ) ( not ( = ?auto_17734 ?auto_17757 ) ) ( IS-CRATE ?auto_17727 ) ( not ( = ?auto_17764 ?auto_17733 ) ) ( HOIST-AT ?auto_17754 ?auto_17764 ) ( AVAILABLE ?auto_17754 ) ( SURFACE-AT ?auto_17727 ?auto_17764 ) ( ON ?auto_17727 ?auto_17755 ) ( CLEAR ?auto_17727 ) ( not ( = ?auto_17728 ?auto_17727 ) ) ( not ( = ?auto_17728 ?auto_17755 ) ) ( not ( = ?auto_17727 ?auto_17755 ) ) ( not ( = ?auto_17734 ?auto_17754 ) ) ( IS-CRATE ?auto_17728 ) ( not ( = ?auto_17747 ?auto_17733 ) ) ( HOIST-AT ?auto_17766 ?auto_17747 ) ( AVAILABLE ?auto_17766 ) ( SURFACE-AT ?auto_17728 ?auto_17747 ) ( ON ?auto_17728 ?auto_17751 ) ( CLEAR ?auto_17728 ) ( not ( = ?auto_17725 ?auto_17728 ) ) ( not ( = ?auto_17725 ?auto_17751 ) ) ( not ( = ?auto_17728 ?auto_17751 ) ) ( not ( = ?auto_17734 ?auto_17766 ) ) ( IS-CRATE ?auto_17725 ) ( not ( = ?auto_17749 ?auto_17733 ) ) ( HOIST-AT ?auto_17742 ?auto_17749 ) ( AVAILABLE ?auto_17742 ) ( SURFACE-AT ?auto_17725 ?auto_17749 ) ( ON ?auto_17725 ?auto_17746 ) ( CLEAR ?auto_17725 ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17746 ) ) ( not ( = ?auto_17725 ?auto_17746 ) ) ( not ( = ?auto_17734 ?auto_17742 ) ) ( IS-CRATE ?auto_17724 ) ( not ( = ?auto_17758 ?auto_17733 ) ) ( HOIST-AT ?auto_17738 ?auto_17758 ) ( SURFACE-AT ?auto_17724 ?auto_17758 ) ( ON ?auto_17724 ?auto_17756 ) ( CLEAR ?auto_17724 ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17723 ?auto_17756 ) ) ( not ( = ?auto_17724 ?auto_17756 ) ) ( not ( = ?auto_17734 ?auto_17738 ) ) ( IS-CRATE ?auto_17723 ) ( not ( = ?auto_17760 ?auto_17733 ) ) ( HOIST-AT ?auto_17752 ?auto_17760 ) ( AVAILABLE ?auto_17752 ) ( SURFACE-AT ?auto_17723 ?auto_17760 ) ( ON ?auto_17723 ?auto_17740 ) ( CLEAR ?auto_17723 ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( not ( = ?auto_17722 ?auto_17740 ) ) ( not ( = ?auto_17723 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17752 ) ) ( IS-CRATE ?auto_17722 ) ( not ( = ?auto_17748 ?auto_17733 ) ) ( HOIST-AT ?auto_17767 ?auto_17748 ) ( AVAILABLE ?auto_17767 ) ( SURFACE-AT ?auto_17722 ?auto_17748 ) ( ON ?auto_17722 ?auto_17759 ) ( CLEAR ?auto_17722 ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17759 ) ) ( not ( = ?auto_17722 ?auto_17759 ) ) ( not ( = ?auto_17734 ?auto_17767 ) ) ( IS-CRATE ?auto_17721 ) ( AVAILABLE ?auto_17738 ) ( SURFACE-AT ?auto_17721 ?auto_17758 ) ( ON ?auto_17721 ?auto_17741 ) ( CLEAR ?auto_17721 ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17741 ) ) ( not ( = ?auto_17721 ?auto_17741 ) ) ( SURFACE-AT ?auto_17719 ?auto_17733 ) ( CLEAR ?auto_17719 ) ( IS-CRATE ?auto_17720 ) ( AVAILABLE ?auto_17734 ) ( not ( = ?auto_17763 ?auto_17733 ) ) ( HOIST-AT ?auto_17768 ?auto_17763 ) ( AVAILABLE ?auto_17768 ) ( SURFACE-AT ?auto_17720 ?auto_17763 ) ( ON ?auto_17720 ?auto_17744 ) ( CLEAR ?auto_17720 ) ( TRUCK-AT ?auto_17735 ?auto_17733 ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17744 ) ) ( not ( = ?auto_17720 ?auto_17744 ) ) ( not ( = ?auto_17734 ?auto_17768 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17741 ) ) ( not ( = ?auto_17721 ?auto_17744 ) ) ( not ( = ?auto_17758 ?auto_17763 ) ) ( not ( = ?auto_17738 ?auto_17768 ) ) ( not ( = ?auto_17741 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17722 ) ) ( not ( = ?auto_17719 ?auto_17759 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17720 ?auto_17759 ) ) ( not ( = ?auto_17722 ?auto_17741 ) ) ( not ( = ?auto_17722 ?auto_17744 ) ) ( not ( = ?auto_17748 ?auto_17758 ) ) ( not ( = ?auto_17748 ?auto_17763 ) ) ( not ( = ?auto_17767 ?auto_17738 ) ) ( not ( = ?auto_17767 ?auto_17768 ) ) ( not ( = ?auto_17759 ?auto_17741 ) ) ( not ( = ?auto_17759 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17723 ) ) ( not ( = ?auto_17719 ?auto_17740 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( not ( = ?auto_17720 ?auto_17740 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( not ( = ?auto_17721 ?auto_17740 ) ) ( not ( = ?auto_17723 ?auto_17759 ) ) ( not ( = ?auto_17723 ?auto_17741 ) ) ( not ( = ?auto_17723 ?auto_17744 ) ) ( not ( = ?auto_17760 ?auto_17748 ) ) ( not ( = ?auto_17760 ?auto_17758 ) ) ( not ( = ?auto_17760 ?auto_17763 ) ) ( not ( = ?auto_17752 ?auto_17767 ) ) ( not ( = ?auto_17752 ?auto_17738 ) ) ( not ( = ?auto_17752 ?auto_17768 ) ) ( not ( = ?auto_17740 ?auto_17759 ) ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17724 ) ) ( not ( = ?auto_17719 ?auto_17756 ) ) ( not ( = ?auto_17720 ?auto_17724 ) ) ( not ( = ?auto_17720 ?auto_17756 ) ) ( not ( = ?auto_17721 ?auto_17724 ) ) ( not ( = ?auto_17721 ?auto_17756 ) ) ( not ( = ?auto_17722 ?auto_17724 ) ) ( not ( = ?auto_17722 ?auto_17756 ) ) ( not ( = ?auto_17724 ?auto_17740 ) ) ( not ( = ?auto_17724 ?auto_17759 ) ) ( not ( = ?auto_17724 ?auto_17741 ) ) ( not ( = ?auto_17724 ?auto_17744 ) ) ( not ( = ?auto_17756 ?auto_17740 ) ) ( not ( = ?auto_17756 ?auto_17759 ) ) ( not ( = ?auto_17756 ?auto_17741 ) ) ( not ( = ?auto_17756 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17725 ) ) ( not ( = ?auto_17719 ?auto_17746 ) ) ( not ( = ?auto_17720 ?auto_17725 ) ) ( not ( = ?auto_17720 ?auto_17746 ) ) ( not ( = ?auto_17721 ?auto_17725 ) ) ( not ( = ?auto_17721 ?auto_17746 ) ) ( not ( = ?auto_17722 ?auto_17725 ) ) ( not ( = ?auto_17722 ?auto_17746 ) ) ( not ( = ?auto_17723 ?auto_17725 ) ) ( not ( = ?auto_17723 ?auto_17746 ) ) ( not ( = ?auto_17725 ?auto_17756 ) ) ( not ( = ?auto_17725 ?auto_17740 ) ) ( not ( = ?auto_17725 ?auto_17759 ) ) ( not ( = ?auto_17725 ?auto_17741 ) ) ( not ( = ?auto_17725 ?auto_17744 ) ) ( not ( = ?auto_17749 ?auto_17758 ) ) ( not ( = ?auto_17749 ?auto_17760 ) ) ( not ( = ?auto_17749 ?auto_17748 ) ) ( not ( = ?auto_17749 ?auto_17763 ) ) ( not ( = ?auto_17742 ?auto_17738 ) ) ( not ( = ?auto_17742 ?auto_17752 ) ) ( not ( = ?auto_17742 ?auto_17767 ) ) ( not ( = ?auto_17742 ?auto_17768 ) ) ( not ( = ?auto_17746 ?auto_17756 ) ) ( not ( = ?auto_17746 ?auto_17740 ) ) ( not ( = ?auto_17746 ?auto_17759 ) ) ( not ( = ?auto_17746 ?auto_17741 ) ) ( not ( = ?auto_17746 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17728 ) ) ( not ( = ?auto_17719 ?auto_17751 ) ) ( not ( = ?auto_17720 ?auto_17728 ) ) ( not ( = ?auto_17720 ?auto_17751 ) ) ( not ( = ?auto_17721 ?auto_17728 ) ) ( not ( = ?auto_17721 ?auto_17751 ) ) ( not ( = ?auto_17722 ?auto_17728 ) ) ( not ( = ?auto_17722 ?auto_17751 ) ) ( not ( = ?auto_17723 ?auto_17728 ) ) ( not ( = ?auto_17723 ?auto_17751 ) ) ( not ( = ?auto_17724 ?auto_17728 ) ) ( not ( = ?auto_17724 ?auto_17751 ) ) ( not ( = ?auto_17728 ?auto_17746 ) ) ( not ( = ?auto_17728 ?auto_17756 ) ) ( not ( = ?auto_17728 ?auto_17740 ) ) ( not ( = ?auto_17728 ?auto_17759 ) ) ( not ( = ?auto_17728 ?auto_17741 ) ) ( not ( = ?auto_17728 ?auto_17744 ) ) ( not ( = ?auto_17747 ?auto_17749 ) ) ( not ( = ?auto_17747 ?auto_17758 ) ) ( not ( = ?auto_17747 ?auto_17760 ) ) ( not ( = ?auto_17747 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17763 ) ) ( not ( = ?auto_17766 ?auto_17742 ) ) ( not ( = ?auto_17766 ?auto_17738 ) ) ( not ( = ?auto_17766 ?auto_17752 ) ) ( not ( = ?auto_17766 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17768 ) ) ( not ( = ?auto_17751 ?auto_17746 ) ) ( not ( = ?auto_17751 ?auto_17756 ) ) ( not ( = ?auto_17751 ?auto_17740 ) ) ( not ( = ?auto_17751 ?auto_17759 ) ) ( not ( = ?auto_17751 ?auto_17741 ) ) ( not ( = ?auto_17751 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17727 ) ) ( not ( = ?auto_17719 ?auto_17755 ) ) ( not ( = ?auto_17720 ?auto_17727 ) ) ( not ( = ?auto_17720 ?auto_17755 ) ) ( not ( = ?auto_17721 ?auto_17727 ) ) ( not ( = ?auto_17721 ?auto_17755 ) ) ( not ( = ?auto_17722 ?auto_17727 ) ) ( not ( = ?auto_17722 ?auto_17755 ) ) ( not ( = ?auto_17723 ?auto_17727 ) ) ( not ( = ?auto_17723 ?auto_17755 ) ) ( not ( = ?auto_17724 ?auto_17727 ) ) ( not ( = ?auto_17724 ?auto_17755 ) ) ( not ( = ?auto_17725 ?auto_17727 ) ) ( not ( = ?auto_17725 ?auto_17755 ) ) ( not ( = ?auto_17727 ?auto_17751 ) ) ( not ( = ?auto_17727 ?auto_17746 ) ) ( not ( = ?auto_17727 ?auto_17756 ) ) ( not ( = ?auto_17727 ?auto_17740 ) ) ( not ( = ?auto_17727 ?auto_17759 ) ) ( not ( = ?auto_17727 ?auto_17741 ) ) ( not ( = ?auto_17727 ?auto_17744 ) ) ( not ( = ?auto_17764 ?auto_17747 ) ) ( not ( = ?auto_17764 ?auto_17749 ) ) ( not ( = ?auto_17764 ?auto_17758 ) ) ( not ( = ?auto_17764 ?auto_17760 ) ) ( not ( = ?auto_17764 ?auto_17748 ) ) ( not ( = ?auto_17764 ?auto_17763 ) ) ( not ( = ?auto_17754 ?auto_17766 ) ) ( not ( = ?auto_17754 ?auto_17742 ) ) ( not ( = ?auto_17754 ?auto_17738 ) ) ( not ( = ?auto_17754 ?auto_17752 ) ) ( not ( = ?auto_17754 ?auto_17767 ) ) ( not ( = ?auto_17754 ?auto_17768 ) ) ( not ( = ?auto_17755 ?auto_17751 ) ) ( not ( = ?auto_17755 ?auto_17746 ) ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( not ( = ?auto_17755 ?auto_17740 ) ) ( not ( = ?auto_17755 ?auto_17759 ) ) ( not ( = ?auto_17755 ?auto_17741 ) ) ( not ( = ?auto_17755 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17726 ) ) ( not ( = ?auto_17719 ?auto_17761 ) ) ( not ( = ?auto_17720 ?auto_17726 ) ) ( not ( = ?auto_17720 ?auto_17761 ) ) ( not ( = ?auto_17721 ?auto_17726 ) ) ( not ( = ?auto_17721 ?auto_17761 ) ) ( not ( = ?auto_17722 ?auto_17726 ) ) ( not ( = ?auto_17722 ?auto_17761 ) ) ( not ( = ?auto_17723 ?auto_17726 ) ) ( not ( = ?auto_17723 ?auto_17761 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17761 ) ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17761 ) ) ( not ( = ?auto_17728 ?auto_17726 ) ) ( not ( = ?auto_17728 ?auto_17761 ) ) ( not ( = ?auto_17726 ?auto_17755 ) ) ( not ( = ?auto_17726 ?auto_17751 ) ) ( not ( = ?auto_17726 ?auto_17746 ) ) ( not ( = ?auto_17726 ?auto_17756 ) ) ( not ( = ?auto_17726 ?auto_17740 ) ) ( not ( = ?auto_17726 ?auto_17759 ) ) ( not ( = ?auto_17726 ?auto_17741 ) ) ( not ( = ?auto_17726 ?auto_17744 ) ) ( not ( = ?auto_17765 ?auto_17764 ) ) ( not ( = ?auto_17765 ?auto_17747 ) ) ( not ( = ?auto_17765 ?auto_17749 ) ) ( not ( = ?auto_17765 ?auto_17758 ) ) ( not ( = ?auto_17765 ?auto_17760 ) ) ( not ( = ?auto_17765 ?auto_17748 ) ) ( not ( = ?auto_17765 ?auto_17763 ) ) ( not ( = ?auto_17757 ?auto_17754 ) ) ( not ( = ?auto_17757 ?auto_17766 ) ) ( not ( = ?auto_17757 ?auto_17742 ) ) ( not ( = ?auto_17757 ?auto_17738 ) ) ( not ( = ?auto_17757 ?auto_17752 ) ) ( not ( = ?auto_17757 ?auto_17767 ) ) ( not ( = ?auto_17757 ?auto_17768 ) ) ( not ( = ?auto_17761 ?auto_17755 ) ) ( not ( = ?auto_17761 ?auto_17751 ) ) ( not ( = ?auto_17761 ?auto_17746 ) ) ( not ( = ?auto_17761 ?auto_17756 ) ) ( not ( = ?auto_17761 ?auto_17740 ) ) ( not ( = ?auto_17761 ?auto_17759 ) ) ( not ( = ?auto_17761 ?auto_17741 ) ) ( not ( = ?auto_17761 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17729 ) ) ( not ( = ?auto_17719 ?auto_17739 ) ) ( not ( = ?auto_17720 ?auto_17729 ) ) ( not ( = ?auto_17720 ?auto_17739 ) ) ( not ( = ?auto_17721 ?auto_17729 ) ) ( not ( = ?auto_17721 ?auto_17739 ) ) ( not ( = ?auto_17722 ?auto_17729 ) ) ( not ( = ?auto_17722 ?auto_17739 ) ) ( not ( = ?auto_17723 ?auto_17729 ) ) ( not ( = ?auto_17723 ?auto_17739 ) ) ( not ( = ?auto_17724 ?auto_17729 ) ) ( not ( = ?auto_17724 ?auto_17739 ) ) ( not ( = ?auto_17725 ?auto_17729 ) ) ( not ( = ?auto_17725 ?auto_17739 ) ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17739 ) ) ( not ( = ?auto_17727 ?auto_17729 ) ) ( not ( = ?auto_17727 ?auto_17739 ) ) ( not ( = ?auto_17729 ?auto_17761 ) ) ( not ( = ?auto_17729 ?auto_17755 ) ) ( not ( = ?auto_17729 ?auto_17751 ) ) ( not ( = ?auto_17729 ?auto_17746 ) ) ( not ( = ?auto_17729 ?auto_17756 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17759 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17765 ) ) ( not ( = ?auto_17743 ?auto_17764 ) ) ( not ( = ?auto_17743 ?auto_17747 ) ) ( not ( = ?auto_17743 ?auto_17749 ) ) ( not ( = ?auto_17743 ?auto_17758 ) ) ( not ( = ?auto_17743 ?auto_17760 ) ) ( not ( = ?auto_17743 ?auto_17748 ) ) ( not ( = ?auto_17743 ?auto_17763 ) ) ( not ( = ?auto_17762 ?auto_17757 ) ) ( not ( = ?auto_17762 ?auto_17754 ) ) ( not ( = ?auto_17762 ?auto_17766 ) ) ( not ( = ?auto_17762 ?auto_17742 ) ) ( not ( = ?auto_17762 ?auto_17738 ) ) ( not ( = ?auto_17762 ?auto_17752 ) ) ( not ( = ?auto_17762 ?auto_17767 ) ) ( not ( = ?auto_17762 ?auto_17768 ) ) ( not ( = ?auto_17739 ?auto_17761 ) ) ( not ( = ?auto_17739 ?auto_17755 ) ) ( not ( = ?auto_17739 ?auto_17751 ) ) ( not ( = ?auto_17739 ?auto_17746 ) ) ( not ( = ?auto_17739 ?auto_17756 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17759 ) ) ( not ( = ?auto_17739 ?auto_17741 ) ) ( not ( = ?auto_17739 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17730 ) ) ( not ( = ?auto_17719 ?auto_17753 ) ) ( not ( = ?auto_17720 ?auto_17730 ) ) ( not ( = ?auto_17720 ?auto_17753 ) ) ( not ( = ?auto_17721 ?auto_17730 ) ) ( not ( = ?auto_17721 ?auto_17753 ) ) ( not ( = ?auto_17722 ?auto_17730 ) ) ( not ( = ?auto_17722 ?auto_17753 ) ) ( not ( = ?auto_17723 ?auto_17730 ) ) ( not ( = ?auto_17723 ?auto_17753 ) ) ( not ( = ?auto_17724 ?auto_17730 ) ) ( not ( = ?auto_17724 ?auto_17753 ) ) ( not ( = ?auto_17725 ?auto_17730 ) ) ( not ( = ?auto_17725 ?auto_17753 ) ) ( not ( = ?auto_17728 ?auto_17730 ) ) ( not ( = ?auto_17728 ?auto_17753 ) ) ( not ( = ?auto_17727 ?auto_17730 ) ) ( not ( = ?auto_17727 ?auto_17753 ) ) ( not ( = ?auto_17726 ?auto_17730 ) ) ( not ( = ?auto_17726 ?auto_17753 ) ) ( not ( = ?auto_17730 ?auto_17739 ) ) ( not ( = ?auto_17730 ?auto_17761 ) ) ( not ( = ?auto_17730 ?auto_17755 ) ) ( not ( = ?auto_17730 ?auto_17751 ) ) ( not ( = ?auto_17730 ?auto_17746 ) ) ( not ( = ?auto_17730 ?auto_17756 ) ) ( not ( = ?auto_17730 ?auto_17740 ) ) ( not ( = ?auto_17730 ?auto_17759 ) ) ( not ( = ?auto_17730 ?auto_17741 ) ) ( not ( = ?auto_17730 ?auto_17744 ) ) ( not ( = ?auto_17745 ?auto_17743 ) ) ( not ( = ?auto_17745 ?auto_17765 ) ) ( not ( = ?auto_17745 ?auto_17764 ) ) ( not ( = ?auto_17745 ?auto_17747 ) ) ( not ( = ?auto_17745 ?auto_17749 ) ) ( not ( = ?auto_17745 ?auto_17758 ) ) ( not ( = ?auto_17745 ?auto_17760 ) ) ( not ( = ?auto_17745 ?auto_17748 ) ) ( not ( = ?auto_17745 ?auto_17763 ) ) ( not ( = ?auto_17750 ?auto_17762 ) ) ( not ( = ?auto_17750 ?auto_17757 ) ) ( not ( = ?auto_17750 ?auto_17754 ) ) ( not ( = ?auto_17750 ?auto_17766 ) ) ( not ( = ?auto_17750 ?auto_17742 ) ) ( not ( = ?auto_17750 ?auto_17738 ) ) ( not ( = ?auto_17750 ?auto_17752 ) ) ( not ( = ?auto_17750 ?auto_17767 ) ) ( not ( = ?auto_17750 ?auto_17768 ) ) ( not ( = ?auto_17753 ?auto_17739 ) ) ( not ( = ?auto_17753 ?auto_17761 ) ) ( not ( = ?auto_17753 ?auto_17755 ) ) ( not ( = ?auto_17753 ?auto_17751 ) ) ( not ( = ?auto_17753 ?auto_17746 ) ) ( not ( = ?auto_17753 ?auto_17756 ) ) ( not ( = ?auto_17753 ?auto_17740 ) ) ( not ( = ?auto_17753 ?auto_17759 ) ) ( not ( = ?auto_17753 ?auto_17741 ) ) ( not ( = ?auto_17753 ?auto_17744 ) ) ( not ( = ?auto_17719 ?auto_17731 ) ) ( not ( = ?auto_17719 ?auto_17737 ) ) ( not ( = ?auto_17720 ?auto_17731 ) ) ( not ( = ?auto_17720 ?auto_17737 ) ) ( not ( = ?auto_17721 ?auto_17731 ) ) ( not ( = ?auto_17721 ?auto_17737 ) ) ( not ( = ?auto_17722 ?auto_17731 ) ) ( not ( = ?auto_17722 ?auto_17737 ) ) ( not ( = ?auto_17723 ?auto_17731 ) ) ( not ( = ?auto_17723 ?auto_17737 ) ) ( not ( = ?auto_17724 ?auto_17731 ) ) ( not ( = ?auto_17724 ?auto_17737 ) ) ( not ( = ?auto_17725 ?auto_17731 ) ) ( not ( = ?auto_17725 ?auto_17737 ) ) ( not ( = ?auto_17728 ?auto_17731 ) ) ( not ( = ?auto_17728 ?auto_17737 ) ) ( not ( = ?auto_17727 ?auto_17731 ) ) ( not ( = ?auto_17727 ?auto_17737 ) ) ( not ( = ?auto_17726 ?auto_17731 ) ) ( not ( = ?auto_17726 ?auto_17737 ) ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( not ( = ?auto_17729 ?auto_17737 ) ) ( not ( = ?auto_17731 ?auto_17753 ) ) ( not ( = ?auto_17731 ?auto_17739 ) ) ( not ( = ?auto_17731 ?auto_17761 ) ) ( not ( = ?auto_17731 ?auto_17755 ) ) ( not ( = ?auto_17731 ?auto_17751 ) ) ( not ( = ?auto_17731 ?auto_17746 ) ) ( not ( = ?auto_17731 ?auto_17756 ) ) ( not ( = ?auto_17731 ?auto_17740 ) ) ( not ( = ?auto_17731 ?auto_17759 ) ) ( not ( = ?auto_17731 ?auto_17741 ) ) ( not ( = ?auto_17731 ?auto_17744 ) ) ( not ( = ?auto_17732 ?auto_17745 ) ) ( not ( = ?auto_17732 ?auto_17743 ) ) ( not ( = ?auto_17732 ?auto_17765 ) ) ( not ( = ?auto_17732 ?auto_17764 ) ) ( not ( = ?auto_17732 ?auto_17747 ) ) ( not ( = ?auto_17732 ?auto_17749 ) ) ( not ( = ?auto_17732 ?auto_17758 ) ) ( not ( = ?auto_17732 ?auto_17760 ) ) ( not ( = ?auto_17732 ?auto_17748 ) ) ( not ( = ?auto_17732 ?auto_17763 ) ) ( not ( = ?auto_17736 ?auto_17750 ) ) ( not ( = ?auto_17736 ?auto_17762 ) ) ( not ( = ?auto_17736 ?auto_17757 ) ) ( not ( = ?auto_17736 ?auto_17754 ) ) ( not ( = ?auto_17736 ?auto_17766 ) ) ( not ( = ?auto_17736 ?auto_17742 ) ) ( not ( = ?auto_17736 ?auto_17738 ) ) ( not ( = ?auto_17736 ?auto_17752 ) ) ( not ( = ?auto_17736 ?auto_17767 ) ) ( not ( = ?auto_17736 ?auto_17768 ) ) ( not ( = ?auto_17737 ?auto_17753 ) ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17737 ?auto_17761 ) ) ( not ( = ?auto_17737 ?auto_17755 ) ) ( not ( = ?auto_17737 ?auto_17751 ) ) ( not ( = ?auto_17737 ?auto_17746 ) ) ( not ( = ?auto_17737 ?auto_17756 ) ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17737 ?auto_17759 ) ) ( not ( = ?auto_17737 ?auto_17741 ) ) ( not ( = ?auto_17737 ?auto_17744 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17728 ?auto_17727 ?auto_17726 ?auto_17729 ?auto_17730 )
      ( MAKE-1CRATE ?auto_17730 ?auto_17731 )
      ( MAKE-12CRATE-VERIFY ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17728 ?auto_17727 ?auto_17726 ?auto_17729 ?auto_17730 ?auto_17731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17771 - SURFACE
      ?auto_17772 - SURFACE
    )
    :vars
    (
      ?auto_17773 - HOIST
      ?auto_17774 - PLACE
      ?auto_17776 - PLACE
      ?auto_17777 - HOIST
      ?auto_17778 - SURFACE
      ?auto_17775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17773 ?auto_17774 ) ( SURFACE-AT ?auto_17771 ?auto_17774 ) ( CLEAR ?auto_17771 ) ( IS-CRATE ?auto_17772 ) ( AVAILABLE ?auto_17773 ) ( not ( = ?auto_17776 ?auto_17774 ) ) ( HOIST-AT ?auto_17777 ?auto_17776 ) ( AVAILABLE ?auto_17777 ) ( SURFACE-AT ?auto_17772 ?auto_17776 ) ( ON ?auto_17772 ?auto_17778 ) ( CLEAR ?auto_17772 ) ( TRUCK-AT ?auto_17775 ?auto_17774 ) ( not ( = ?auto_17771 ?auto_17772 ) ) ( not ( = ?auto_17771 ?auto_17778 ) ) ( not ( = ?auto_17772 ?auto_17778 ) ) ( not ( = ?auto_17773 ?auto_17777 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17775 ?auto_17774 ?auto_17776 )
      ( !LIFT ?auto_17777 ?auto_17772 ?auto_17778 ?auto_17776 )
      ( !LOAD ?auto_17777 ?auto_17772 ?auto_17775 ?auto_17776 )
      ( !DRIVE ?auto_17775 ?auto_17776 ?auto_17774 )
      ( !UNLOAD ?auto_17773 ?auto_17772 ?auto_17775 ?auto_17774 )
      ( !DROP ?auto_17773 ?auto_17772 ?auto_17771 ?auto_17774 )
      ( MAKE-1CRATE-VERIFY ?auto_17771 ?auto_17772 ) )
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
      ?auto_17802 - SURFACE
      ?auto_17801 - SURFACE
      ?auto_17800 - SURFACE
      ?auto_17803 - SURFACE
      ?auto_17804 - SURFACE
      ?auto_17805 - SURFACE
      ?auto_17806 - SURFACE
    )
    :vars
    (
      ?auto_17812 - HOIST
      ?auto_17810 - PLACE
      ?auto_17809 - PLACE
      ?auto_17807 - HOIST
      ?auto_17808 - SURFACE
      ?auto_17822 - PLACE
      ?auto_17821 - HOIST
      ?auto_17843 - SURFACE
      ?auto_17815 - PLACE
      ?auto_17816 - HOIST
      ?auto_17838 - SURFACE
      ?auto_17829 - PLACE
      ?auto_17833 - HOIST
      ?auto_17839 - SURFACE
      ?auto_17824 - PLACE
      ?auto_17820 - HOIST
      ?auto_17832 - SURFACE
      ?auto_17813 - PLACE
      ?auto_17819 - HOIST
      ?auto_17814 - SURFACE
      ?auto_17830 - PLACE
      ?auto_17826 - HOIST
      ?auto_17818 - SURFACE
      ?auto_17837 - PLACE
      ?auto_17825 - HOIST
      ?auto_17840 - SURFACE
      ?auto_17836 - PLACE
      ?auto_17817 - HOIST
      ?auto_17834 - SURFACE
      ?auto_17841 - PLACE
      ?auto_17842 - HOIST
      ?auto_17828 - SURFACE
      ?auto_17844 - PLACE
      ?auto_17835 - HOIST
      ?auto_17831 - SURFACE
      ?auto_17827 - SURFACE
      ?auto_17823 - SURFACE
      ?auto_17811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17812 ?auto_17810 ) ( IS-CRATE ?auto_17806 ) ( not ( = ?auto_17809 ?auto_17810 ) ) ( HOIST-AT ?auto_17807 ?auto_17809 ) ( SURFACE-AT ?auto_17806 ?auto_17809 ) ( ON ?auto_17806 ?auto_17808 ) ( CLEAR ?auto_17806 ) ( not ( = ?auto_17805 ?auto_17806 ) ) ( not ( = ?auto_17805 ?auto_17808 ) ) ( not ( = ?auto_17806 ?auto_17808 ) ) ( not ( = ?auto_17812 ?auto_17807 ) ) ( IS-CRATE ?auto_17805 ) ( not ( = ?auto_17822 ?auto_17810 ) ) ( HOIST-AT ?auto_17821 ?auto_17822 ) ( AVAILABLE ?auto_17821 ) ( SURFACE-AT ?auto_17805 ?auto_17822 ) ( ON ?auto_17805 ?auto_17843 ) ( CLEAR ?auto_17805 ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( not ( = ?auto_17804 ?auto_17843 ) ) ( not ( = ?auto_17805 ?auto_17843 ) ) ( not ( = ?auto_17812 ?auto_17821 ) ) ( IS-CRATE ?auto_17804 ) ( not ( = ?auto_17815 ?auto_17810 ) ) ( HOIST-AT ?auto_17816 ?auto_17815 ) ( AVAILABLE ?auto_17816 ) ( SURFACE-AT ?auto_17804 ?auto_17815 ) ( ON ?auto_17804 ?auto_17838 ) ( CLEAR ?auto_17804 ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( not ( = ?auto_17803 ?auto_17838 ) ) ( not ( = ?auto_17804 ?auto_17838 ) ) ( not ( = ?auto_17812 ?auto_17816 ) ) ( IS-CRATE ?auto_17803 ) ( not ( = ?auto_17829 ?auto_17810 ) ) ( HOIST-AT ?auto_17833 ?auto_17829 ) ( AVAILABLE ?auto_17833 ) ( SURFACE-AT ?auto_17803 ?auto_17829 ) ( ON ?auto_17803 ?auto_17839 ) ( CLEAR ?auto_17803 ) ( not ( = ?auto_17800 ?auto_17803 ) ) ( not ( = ?auto_17800 ?auto_17839 ) ) ( not ( = ?auto_17803 ?auto_17839 ) ) ( not ( = ?auto_17812 ?auto_17833 ) ) ( IS-CRATE ?auto_17800 ) ( not ( = ?auto_17824 ?auto_17810 ) ) ( HOIST-AT ?auto_17820 ?auto_17824 ) ( AVAILABLE ?auto_17820 ) ( SURFACE-AT ?auto_17800 ?auto_17824 ) ( ON ?auto_17800 ?auto_17832 ) ( CLEAR ?auto_17800 ) ( not ( = ?auto_17801 ?auto_17800 ) ) ( not ( = ?auto_17801 ?auto_17832 ) ) ( not ( = ?auto_17800 ?auto_17832 ) ) ( not ( = ?auto_17812 ?auto_17820 ) ) ( IS-CRATE ?auto_17801 ) ( not ( = ?auto_17813 ?auto_17810 ) ) ( HOIST-AT ?auto_17819 ?auto_17813 ) ( AVAILABLE ?auto_17819 ) ( SURFACE-AT ?auto_17801 ?auto_17813 ) ( ON ?auto_17801 ?auto_17814 ) ( CLEAR ?auto_17801 ) ( not ( = ?auto_17802 ?auto_17801 ) ) ( not ( = ?auto_17802 ?auto_17814 ) ) ( not ( = ?auto_17801 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17819 ) ) ( IS-CRATE ?auto_17802 ) ( not ( = ?auto_17830 ?auto_17810 ) ) ( HOIST-AT ?auto_17826 ?auto_17830 ) ( AVAILABLE ?auto_17826 ) ( SURFACE-AT ?auto_17802 ?auto_17830 ) ( ON ?auto_17802 ?auto_17818 ) ( CLEAR ?auto_17802 ) ( not ( = ?auto_17799 ?auto_17802 ) ) ( not ( = ?auto_17799 ?auto_17818 ) ) ( not ( = ?auto_17802 ?auto_17818 ) ) ( not ( = ?auto_17812 ?auto_17826 ) ) ( IS-CRATE ?auto_17799 ) ( not ( = ?auto_17837 ?auto_17810 ) ) ( HOIST-AT ?auto_17825 ?auto_17837 ) ( AVAILABLE ?auto_17825 ) ( SURFACE-AT ?auto_17799 ?auto_17837 ) ( ON ?auto_17799 ?auto_17840 ) ( CLEAR ?auto_17799 ) ( not ( = ?auto_17798 ?auto_17799 ) ) ( not ( = ?auto_17798 ?auto_17840 ) ) ( not ( = ?auto_17799 ?auto_17840 ) ) ( not ( = ?auto_17812 ?auto_17825 ) ) ( IS-CRATE ?auto_17798 ) ( not ( = ?auto_17836 ?auto_17810 ) ) ( HOIST-AT ?auto_17817 ?auto_17836 ) ( SURFACE-AT ?auto_17798 ?auto_17836 ) ( ON ?auto_17798 ?auto_17834 ) ( CLEAR ?auto_17798 ) ( not ( = ?auto_17797 ?auto_17798 ) ) ( not ( = ?auto_17797 ?auto_17834 ) ) ( not ( = ?auto_17798 ?auto_17834 ) ) ( not ( = ?auto_17812 ?auto_17817 ) ) ( IS-CRATE ?auto_17797 ) ( not ( = ?auto_17841 ?auto_17810 ) ) ( HOIST-AT ?auto_17842 ?auto_17841 ) ( AVAILABLE ?auto_17842 ) ( SURFACE-AT ?auto_17797 ?auto_17841 ) ( ON ?auto_17797 ?auto_17828 ) ( CLEAR ?auto_17797 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17828 ) ) ( not ( = ?auto_17797 ?auto_17828 ) ) ( not ( = ?auto_17812 ?auto_17842 ) ) ( IS-CRATE ?auto_17796 ) ( not ( = ?auto_17844 ?auto_17810 ) ) ( HOIST-AT ?auto_17835 ?auto_17844 ) ( AVAILABLE ?auto_17835 ) ( SURFACE-AT ?auto_17796 ?auto_17844 ) ( ON ?auto_17796 ?auto_17831 ) ( CLEAR ?auto_17796 ) ( not ( = ?auto_17795 ?auto_17796 ) ) ( not ( = ?auto_17795 ?auto_17831 ) ) ( not ( = ?auto_17796 ?auto_17831 ) ) ( not ( = ?auto_17812 ?auto_17835 ) ) ( IS-CRATE ?auto_17795 ) ( AVAILABLE ?auto_17817 ) ( SURFACE-AT ?auto_17795 ?auto_17836 ) ( ON ?auto_17795 ?auto_17827 ) ( CLEAR ?auto_17795 ) ( not ( = ?auto_17794 ?auto_17795 ) ) ( not ( = ?auto_17794 ?auto_17827 ) ) ( not ( = ?auto_17795 ?auto_17827 ) ) ( SURFACE-AT ?auto_17793 ?auto_17810 ) ( CLEAR ?auto_17793 ) ( IS-CRATE ?auto_17794 ) ( AVAILABLE ?auto_17812 ) ( AVAILABLE ?auto_17807 ) ( SURFACE-AT ?auto_17794 ?auto_17809 ) ( ON ?auto_17794 ?auto_17823 ) ( CLEAR ?auto_17794 ) ( TRUCK-AT ?auto_17811 ?auto_17810 ) ( not ( = ?auto_17793 ?auto_17794 ) ) ( not ( = ?auto_17793 ?auto_17823 ) ) ( not ( = ?auto_17794 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17795 ) ) ( not ( = ?auto_17793 ?auto_17827 ) ) ( not ( = ?auto_17795 ?auto_17823 ) ) ( not ( = ?auto_17836 ?auto_17809 ) ) ( not ( = ?auto_17817 ?auto_17807 ) ) ( not ( = ?auto_17827 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17796 ) ) ( not ( = ?auto_17793 ?auto_17831 ) ) ( not ( = ?auto_17794 ?auto_17796 ) ) ( not ( = ?auto_17794 ?auto_17831 ) ) ( not ( = ?auto_17796 ?auto_17827 ) ) ( not ( = ?auto_17796 ?auto_17823 ) ) ( not ( = ?auto_17844 ?auto_17836 ) ) ( not ( = ?auto_17844 ?auto_17809 ) ) ( not ( = ?auto_17835 ?auto_17817 ) ) ( not ( = ?auto_17835 ?auto_17807 ) ) ( not ( = ?auto_17831 ?auto_17827 ) ) ( not ( = ?auto_17831 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17797 ) ) ( not ( = ?auto_17793 ?auto_17828 ) ) ( not ( = ?auto_17794 ?auto_17797 ) ) ( not ( = ?auto_17794 ?auto_17828 ) ) ( not ( = ?auto_17795 ?auto_17797 ) ) ( not ( = ?auto_17795 ?auto_17828 ) ) ( not ( = ?auto_17797 ?auto_17831 ) ) ( not ( = ?auto_17797 ?auto_17827 ) ) ( not ( = ?auto_17797 ?auto_17823 ) ) ( not ( = ?auto_17841 ?auto_17844 ) ) ( not ( = ?auto_17841 ?auto_17836 ) ) ( not ( = ?auto_17841 ?auto_17809 ) ) ( not ( = ?auto_17842 ?auto_17835 ) ) ( not ( = ?auto_17842 ?auto_17817 ) ) ( not ( = ?auto_17842 ?auto_17807 ) ) ( not ( = ?auto_17828 ?auto_17831 ) ) ( not ( = ?auto_17828 ?auto_17827 ) ) ( not ( = ?auto_17828 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17798 ) ) ( not ( = ?auto_17793 ?auto_17834 ) ) ( not ( = ?auto_17794 ?auto_17798 ) ) ( not ( = ?auto_17794 ?auto_17834 ) ) ( not ( = ?auto_17795 ?auto_17798 ) ) ( not ( = ?auto_17795 ?auto_17834 ) ) ( not ( = ?auto_17796 ?auto_17798 ) ) ( not ( = ?auto_17796 ?auto_17834 ) ) ( not ( = ?auto_17798 ?auto_17828 ) ) ( not ( = ?auto_17798 ?auto_17831 ) ) ( not ( = ?auto_17798 ?auto_17827 ) ) ( not ( = ?auto_17798 ?auto_17823 ) ) ( not ( = ?auto_17834 ?auto_17828 ) ) ( not ( = ?auto_17834 ?auto_17831 ) ) ( not ( = ?auto_17834 ?auto_17827 ) ) ( not ( = ?auto_17834 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17799 ) ) ( not ( = ?auto_17793 ?auto_17840 ) ) ( not ( = ?auto_17794 ?auto_17799 ) ) ( not ( = ?auto_17794 ?auto_17840 ) ) ( not ( = ?auto_17795 ?auto_17799 ) ) ( not ( = ?auto_17795 ?auto_17840 ) ) ( not ( = ?auto_17796 ?auto_17799 ) ) ( not ( = ?auto_17796 ?auto_17840 ) ) ( not ( = ?auto_17797 ?auto_17799 ) ) ( not ( = ?auto_17797 ?auto_17840 ) ) ( not ( = ?auto_17799 ?auto_17834 ) ) ( not ( = ?auto_17799 ?auto_17828 ) ) ( not ( = ?auto_17799 ?auto_17831 ) ) ( not ( = ?auto_17799 ?auto_17827 ) ) ( not ( = ?auto_17799 ?auto_17823 ) ) ( not ( = ?auto_17837 ?auto_17836 ) ) ( not ( = ?auto_17837 ?auto_17841 ) ) ( not ( = ?auto_17837 ?auto_17844 ) ) ( not ( = ?auto_17837 ?auto_17809 ) ) ( not ( = ?auto_17825 ?auto_17817 ) ) ( not ( = ?auto_17825 ?auto_17842 ) ) ( not ( = ?auto_17825 ?auto_17835 ) ) ( not ( = ?auto_17825 ?auto_17807 ) ) ( not ( = ?auto_17840 ?auto_17834 ) ) ( not ( = ?auto_17840 ?auto_17828 ) ) ( not ( = ?auto_17840 ?auto_17831 ) ) ( not ( = ?auto_17840 ?auto_17827 ) ) ( not ( = ?auto_17840 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17802 ) ) ( not ( = ?auto_17793 ?auto_17818 ) ) ( not ( = ?auto_17794 ?auto_17802 ) ) ( not ( = ?auto_17794 ?auto_17818 ) ) ( not ( = ?auto_17795 ?auto_17802 ) ) ( not ( = ?auto_17795 ?auto_17818 ) ) ( not ( = ?auto_17796 ?auto_17802 ) ) ( not ( = ?auto_17796 ?auto_17818 ) ) ( not ( = ?auto_17797 ?auto_17802 ) ) ( not ( = ?auto_17797 ?auto_17818 ) ) ( not ( = ?auto_17798 ?auto_17802 ) ) ( not ( = ?auto_17798 ?auto_17818 ) ) ( not ( = ?auto_17802 ?auto_17840 ) ) ( not ( = ?auto_17802 ?auto_17834 ) ) ( not ( = ?auto_17802 ?auto_17828 ) ) ( not ( = ?auto_17802 ?auto_17831 ) ) ( not ( = ?auto_17802 ?auto_17827 ) ) ( not ( = ?auto_17802 ?auto_17823 ) ) ( not ( = ?auto_17830 ?auto_17837 ) ) ( not ( = ?auto_17830 ?auto_17836 ) ) ( not ( = ?auto_17830 ?auto_17841 ) ) ( not ( = ?auto_17830 ?auto_17844 ) ) ( not ( = ?auto_17830 ?auto_17809 ) ) ( not ( = ?auto_17826 ?auto_17825 ) ) ( not ( = ?auto_17826 ?auto_17817 ) ) ( not ( = ?auto_17826 ?auto_17842 ) ) ( not ( = ?auto_17826 ?auto_17835 ) ) ( not ( = ?auto_17826 ?auto_17807 ) ) ( not ( = ?auto_17818 ?auto_17840 ) ) ( not ( = ?auto_17818 ?auto_17834 ) ) ( not ( = ?auto_17818 ?auto_17828 ) ) ( not ( = ?auto_17818 ?auto_17831 ) ) ( not ( = ?auto_17818 ?auto_17827 ) ) ( not ( = ?auto_17818 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17801 ) ) ( not ( = ?auto_17793 ?auto_17814 ) ) ( not ( = ?auto_17794 ?auto_17801 ) ) ( not ( = ?auto_17794 ?auto_17814 ) ) ( not ( = ?auto_17795 ?auto_17801 ) ) ( not ( = ?auto_17795 ?auto_17814 ) ) ( not ( = ?auto_17796 ?auto_17801 ) ) ( not ( = ?auto_17796 ?auto_17814 ) ) ( not ( = ?auto_17797 ?auto_17801 ) ) ( not ( = ?auto_17797 ?auto_17814 ) ) ( not ( = ?auto_17798 ?auto_17801 ) ) ( not ( = ?auto_17798 ?auto_17814 ) ) ( not ( = ?auto_17799 ?auto_17801 ) ) ( not ( = ?auto_17799 ?auto_17814 ) ) ( not ( = ?auto_17801 ?auto_17818 ) ) ( not ( = ?auto_17801 ?auto_17840 ) ) ( not ( = ?auto_17801 ?auto_17834 ) ) ( not ( = ?auto_17801 ?auto_17828 ) ) ( not ( = ?auto_17801 ?auto_17831 ) ) ( not ( = ?auto_17801 ?auto_17827 ) ) ( not ( = ?auto_17801 ?auto_17823 ) ) ( not ( = ?auto_17813 ?auto_17830 ) ) ( not ( = ?auto_17813 ?auto_17837 ) ) ( not ( = ?auto_17813 ?auto_17836 ) ) ( not ( = ?auto_17813 ?auto_17841 ) ) ( not ( = ?auto_17813 ?auto_17844 ) ) ( not ( = ?auto_17813 ?auto_17809 ) ) ( not ( = ?auto_17819 ?auto_17826 ) ) ( not ( = ?auto_17819 ?auto_17825 ) ) ( not ( = ?auto_17819 ?auto_17817 ) ) ( not ( = ?auto_17819 ?auto_17842 ) ) ( not ( = ?auto_17819 ?auto_17835 ) ) ( not ( = ?auto_17819 ?auto_17807 ) ) ( not ( = ?auto_17814 ?auto_17818 ) ) ( not ( = ?auto_17814 ?auto_17840 ) ) ( not ( = ?auto_17814 ?auto_17834 ) ) ( not ( = ?auto_17814 ?auto_17828 ) ) ( not ( = ?auto_17814 ?auto_17831 ) ) ( not ( = ?auto_17814 ?auto_17827 ) ) ( not ( = ?auto_17814 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17800 ) ) ( not ( = ?auto_17793 ?auto_17832 ) ) ( not ( = ?auto_17794 ?auto_17800 ) ) ( not ( = ?auto_17794 ?auto_17832 ) ) ( not ( = ?auto_17795 ?auto_17800 ) ) ( not ( = ?auto_17795 ?auto_17832 ) ) ( not ( = ?auto_17796 ?auto_17800 ) ) ( not ( = ?auto_17796 ?auto_17832 ) ) ( not ( = ?auto_17797 ?auto_17800 ) ) ( not ( = ?auto_17797 ?auto_17832 ) ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17798 ?auto_17832 ) ) ( not ( = ?auto_17799 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17832 ) ) ( not ( = ?auto_17802 ?auto_17800 ) ) ( not ( = ?auto_17802 ?auto_17832 ) ) ( not ( = ?auto_17800 ?auto_17814 ) ) ( not ( = ?auto_17800 ?auto_17818 ) ) ( not ( = ?auto_17800 ?auto_17840 ) ) ( not ( = ?auto_17800 ?auto_17834 ) ) ( not ( = ?auto_17800 ?auto_17828 ) ) ( not ( = ?auto_17800 ?auto_17831 ) ) ( not ( = ?auto_17800 ?auto_17827 ) ) ( not ( = ?auto_17800 ?auto_17823 ) ) ( not ( = ?auto_17824 ?auto_17813 ) ) ( not ( = ?auto_17824 ?auto_17830 ) ) ( not ( = ?auto_17824 ?auto_17837 ) ) ( not ( = ?auto_17824 ?auto_17836 ) ) ( not ( = ?auto_17824 ?auto_17841 ) ) ( not ( = ?auto_17824 ?auto_17844 ) ) ( not ( = ?auto_17824 ?auto_17809 ) ) ( not ( = ?auto_17820 ?auto_17819 ) ) ( not ( = ?auto_17820 ?auto_17826 ) ) ( not ( = ?auto_17820 ?auto_17825 ) ) ( not ( = ?auto_17820 ?auto_17817 ) ) ( not ( = ?auto_17820 ?auto_17842 ) ) ( not ( = ?auto_17820 ?auto_17835 ) ) ( not ( = ?auto_17820 ?auto_17807 ) ) ( not ( = ?auto_17832 ?auto_17814 ) ) ( not ( = ?auto_17832 ?auto_17818 ) ) ( not ( = ?auto_17832 ?auto_17840 ) ) ( not ( = ?auto_17832 ?auto_17834 ) ) ( not ( = ?auto_17832 ?auto_17828 ) ) ( not ( = ?auto_17832 ?auto_17831 ) ) ( not ( = ?auto_17832 ?auto_17827 ) ) ( not ( = ?auto_17832 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17803 ) ) ( not ( = ?auto_17793 ?auto_17839 ) ) ( not ( = ?auto_17794 ?auto_17803 ) ) ( not ( = ?auto_17794 ?auto_17839 ) ) ( not ( = ?auto_17795 ?auto_17803 ) ) ( not ( = ?auto_17795 ?auto_17839 ) ) ( not ( = ?auto_17796 ?auto_17803 ) ) ( not ( = ?auto_17796 ?auto_17839 ) ) ( not ( = ?auto_17797 ?auto_17803 ) ) ( not ( = ?auto_17797 ?auto_17839 ) ) ( not ( = ?auto_17798 ?auto_17803 ) ) ( not ( = ?auto_17798 ?auto_17839 ) ) ( not ( = ?auto_17799 ?auto_17803 ) ) ( not ( = ?auto_17799 ?auto_17839 ) ) ( not ( = ?auto_17802 ?auto_17803 ) ) ( not ( = ?auto_17802 ?auto_17839 ) ) ( not ( = ?auto_17801 ?auto_17803 ) ) ( not ( = ?auto_17801 ?auto_17839 ) ) ( not ( = ?auto_17803 ?auto_17832 ) ) ( not ( = ?auto_17803 ?auto_17814 ) ) ( not ( = ?auto_17803 ?auto_17818 ) ) ( not ( = ?auto_17803 ?auto_17840 ) ) ( not ( = ?auto_17803 ?auto_17834 ) ) ( not ( = ?auto_17803 ?auto_17828 ) ) ( not ( = ?auto_17803 ?auto_17831 ) ) ( not ( = ?auto_17803 ?auto_17827 ) ) ( not ( = ?auto_17803 ?auto_17823 ) ) ( not ( = ?auto_17829 ?auto_17824 ) ) ( not ( = ?auto_17829 ?auto_17813 ) ) ( not ( = ?auto_17829 ?auto_17830 ) ) ( not ( = ?auto_17829 ?auto_17837 ) ) ( not ( = ?auto_17829 ?auto_17836 ) ) ( not ( = ?auto_17829 ?auto_17841 ) ) ( not ( = ?auto_17829 ?auto_17844 ) ) ( not ( = ?auto_17829 ?auto_17809 ) ) ( not ( = ?auto_17833 ?auto_17820 ) ) ( not ( = ?auto_17833 ?auto_17819 ) ) ( not ( = ?auto_17833 ?auto_17826 ) ) ( not ( = ?auto_17833 ?auto_17825 ) ) ( not ( = ?auto_17833 ?auto_17817 ) ) ( not ( = ?auto_17833 ?auto_17842 ) ) ( not ( = ?auto_17833 ?auto_17835 ) ) ( not ( = ?auto_17833 ?auto_17807 ) ) ( not ( = ?auto_17839 ?auto_17832 ) ) ( not ( = ?auto_17839 ?auto_17814 ) ) ( not ( = ?auto_17839 ?auto_17818 ) ) ( not ( = ?auto_17839 ?auto_17840 ) ) ( not ( = ?auto_17839 ?auto_17834 ) ) ( not ( = ?auto_17839 ?auto_17828 ) ) ( not ( = ?auto_17839 ?auto_17831 ) ) ( not ( = ?auto_17839 ?auto_17827 ) ) ( not ( = ?auto_17839 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17804 ) ) ( not ( = ?auto_17793 ?auto_17838 ) ) ( not ( = ?auto_17794 ?auto_17804 ) ) ( not ( = ?auto_17794 ?auto_17838 ) ) ( not ( = ?auto_17795 ?auto_17804 ) ) ( not ( = ?auto_17795 ?auto_17838 ) ) ( not ( = ?auto_17796 ?auto_17804 ) ) ( not ( = ?auto_17796 ?auto_17838 ) ) ( not ( = ?auto_17797 ?auto_17804 ) ) ( not ( = ?auto_17797 ?auto_17838 ) ) ( not ( = ?auto_17798 ?auto_17804 ) ) ( not ( = ?auto_17798 ?auto_17838 ) ) ( not ( = ?auto_17799 ?auto_17804 ) ) ( not ( = ?auto_17799 ?auto_17838 ) ) ( not ( = ?auto_17802 ?auto_17804 ) ) ( not ( = ?auto_17802 ?auto_17838 ) ) ( not ( = ?auto_17801 ?auto_17804 ) ) ( not ( = ?auto_17801 ?auto_17838 ) ) ( not ( = ?auto_17800 ?auto_17804 ) ) ( not ( = ?auto_17800 ?auto_17838 ) ) ( not ( = ?auto_17804 ?auto_17839 ) ) ( not ( = ?auto_17804 ?auto_17832 ) ) ( not ( = ?auto_17804 ?auto_17814 ) ) ( not ( = ?auto_17804 ?auto_17818 ) ) ( not ( = ?auto_17804 ?auto_17840 ) ) ( not ( = ?auto_17804 ?auto_17834 ) ) ( not ( = ?auto_17804 ?auto_17828 ) ) ( not ( = ?auto_17804 ?auto_17831 ) ) ( not ( = ?auto_17804 ?auto_17827 ) ) ( not ( = ?auto_17804 ?auto_17823 ) ) ( not ( = ?auto_17815 ?auto_17829 ) ) ( not ( = ?auto_17815 ?auto_17824 ) ) ( not ( = ?auto_17815 ?auto_17813 ) ) ( not ( = ?auto_17815 ?auto_17830 ) ) ( not ( = ?auto_17815 ?auto_17837 ) ) ( not ( = ?auto_17815 ?auto_17836 ) ) ( not ( = ?auto_17815 ?auto_17841 ) ) ( not ( = ?auto_17815 ?auto_17844 ) ) ( not ( = ?auto_17815 ?auto_17809 ) ) ( not ( = ?auto_17816 ?auto_17833 ) ) ( not ( = ?auto_17816 ?auto_17820 ) ) ( not ( = ?auto_17816 ?auto_17819 ) ) ( not ( = ?auto_17816 ?auto_17826 ) ) ( not ( = ?auto_17816 ?auto_17825 ) ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( not ( = ?auto_17816 ?auto_17842 ) ) ( not ( = ?auto_17816 ?auto_17835 ) ) ( not ( = ?auto_17816 ?auto_17807 ) ) ( not ( = ?auto_17838 ?auto_17839 ) ) ( not ( = ?auto_17838 ?auto_17832 ) ) ( not ( = ?auto_17838 ?auto_17814 ) ) ( not ( = ?auto_17838 ?auto_17818 ) ) ( not ( = ?auto_17838 ?auto_17840 ) ) ( not ( = ?auto_17838 ?auto_17834 ) ) ( not ( = ?auto_17838 ?auto_17828 ) ) ( not ( = ?auto_17838 ?auto_17831 ) ) ( not ( = ?auto_17838 ?auto_17827 ) ) ( not ( = ?auto_17838 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17805 ) ) ( not ( = ?auto_17793 ?auto_17843 ) ) ( not ( = ?auto_17794 ?auto_17805 ) ) ( not ( = ?auto_17794 ?auto_17843 ) ) ( not ( = ?auto_17795 ?auto_17805 ) ) ( not ( = ?auto_17795 ?auto_17843 ) ) ( not ( = ?auto_17796 ?auto_17805 ) ) ( not ( = ?auto_17796 ?auto_17843 ) ) ( not ( = ?auto_17797 ?auto_17805 ) ) ( not ( = ?auto_17797 ?auto_17843 ) ) ( not ( = ?auto_17798 ?auto_17805 ) ) ( not ( = ?auto_17798 ?auto_17843 ) ) ( not ( = ?auto_17799 ?auto_17805 ) ) ( not ( = ?auto_17799 ?auto_17843 ) ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17802 ?auto_17843 ) ) ( not ( = ?auto_17801 ?auto_17805 ) ) ( not ( = ?auto_17801 ?auto_17843 ) ) ( not ( = ?auto_17800 ?auto_17805 ) ) ( not ( = ?auto_17800 ?auto_17843 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17803 ?auto_17843 ) ) ( not ( = ?auto_17805 ?auto_17838 ) ) ( not ( = ?auto_17805 ?auto_17839 ) ) ( not ( = ?auto_17805 ?auto_17832 ) ) ( not ( = ?auto_17805 ?auto_17814 ) ) ( not ( = ?auto_17805 ?auto_17818 ) ) ( not ( = ?auto_17805 ?auto_17840 ) ) ( not ( = ?auto_17805 ?auto_17834 ) ) ( not ( = ?auto_17805 ?auto_17828 ) ) ( not ( = ?auto_17805 ?auto_17831 ) ) ( not ( = ?auto_17805 ?auto_17827 ) ) ( not ( = ?auto_17805 ?auto_17823 ) ) ( not ( = ?auto_17822 ?auto_17815 ) ) ( not ( = ?auto_17822 ?auto_17829 ) ) ( not ( = ?auto_17822 ?auto_17824 ) ) ( not ( = ?auto_17822 ?auto_17813 ) ) ( not ( = ?auto_17822 ?auto_17830 ) ) ( not ( = ?auto_17822 ?auto_17837 ) ) ( not ( = ?auto_17822 ?auto_17836 ) ) ( not ( = ?auto_17822 ?auto_17841 ) ) ( not ( = ?auto_17822 ?auto_17844 ) ) ( not ( = ?auto_17822 ?auto_17809 ) ) ( not ( = ?auto_17821 ?auto_17816 ) ) ( not ( = ?auto_17821 ?auto_17833 ) ) ( not ( = ?auto_17821 ?auto_17820 ) ) ( not ( = ?auto_17821 ?auto_17819 ) ) ( not ( = ?auto_17821 ?auto_17826 ) ) ( not ( = ?auto_17821 ?auto_17825 ) ) ( not ( = ?auto_17821 ?auto_17817 ) ) ( not ( = ?auto_17821 ?auto_17842 ) ) ( not ( = ?auto_17821 ?auto_17835 ) ) ( not ( = ?auto_17821 ?auto_17807 ) ) ( not ( = ?auto_17843 ?auto_17838 ) ) ( not ( = ?auto_17843 ?auto_17839 ) ) ( not ( = ?auto_17843 ?auto_17832 ) ) ( not ( = ?auto_17843 ?auto_17814 ) ) ( not ( = ?auto_17843 ?auto_17818 ) ) ( not ( = ?auto_17843 ?auto_17840 ) ) ( not ( = ?auto_17843 ?auto_17834 ) ) ( not ( = ?auto_17843 ?auto_17828 ) ) ( not ( = ?auto_17843 ?auto_17831 ) ) ( not ( = ?auto_17843 ?auto_17827 ) ) ( not ( = ?auto_17843 ?auto_17823 ) ) ( not ( = ?auto_17793 ?auto_17806 ) ) ( not ( = ?auto_17793 ?auto_17808 ) ) ( not ( = ?auto_17794 ?auto_17806 ) ) ( not ( = ?auto_17794 ?auto_17808 ) ) ( not ( = ?auto_17795 ?auto_17806 ) ) ( not ( = ?auto_17795 ?auto_17808 ) ) ( not ( = ?auto_17796 ?auto_17806 ) ) ( not ( = ?auto_17796 ?auto_17808 ) ) ( not ( = ?auto_17797 ?auto_17806 ) ) ( not ( = ?auto_17797 ?auto_17808 ) ) ( not ( = ?auto_17798 ?auto_17806 ) ) ( not ( = ?auto_17798 ?auto_17808 ) ) ( not ( = ?auto_17799 ?auto_17806 ) ) ( not ( = ?auto_17799 ?auto_17808 ) ) ( not ( = ?auto_17802 ?auto_17806 ) ) ( not ( = ?auto_17802 ?auto_17808 ) ) ( not ( = ?auto_17801 ?auto_17806 ) ) ( not ( = ?auto_17801 ?auto_17808 ) ) ( not ( = ?auto_17800 ?auto_17806 ) ) ( not ( = ?auto_17800 ?auto_17808 ) ) ( not ( = ?auto_17803 ?auto_17806 ) ) ( not ( = ?auto_17803 ?auto_17808 ) ) ( not ( = ?auto_17804 ?auto_17806 ) ) ( not ( = ?auto_17804 ?auto_17808 ) ) ( not ( = ?auto_17806 ?auto_17843 ) ) ( not ( = ?auto_17806 ?auto_17838 ) ) ( not ( = ?auto_17806 ?auto_17839 ) ) ( not ( = ?auto_17806 ?auto_17832 ) ) ( not ( = ?auto_17806 ?auto_17814 ) ) ( not ( = ?auto_17806 ?auto_17818 ) ) ( not ( = ?auto_17806 ?auto_17840 ) ) ( not ( = ?auto_17806 ?auto_17834 ) ) ( not ( = ?auto_17806 ?auto_17828 ) ) ( not ( = ?auto_17806 ?auto_17831 ) ) ( not ( = ?auto_17806 ?auto_17827 ) ) ( not ( = ?auto_17806 ?auto_17823 ) ) ( not ( = ?auto_17808 ?auto_17843 ) ) ( not ( = ?auto_17808 ?auto_17838 ) ) ( not ( = ?auto_17808 ?auto_17839 ) ) ( not ( = ?auto_17808 ?auto_17832 ) ) ( not ( = ?auto_17808 ?auto_17814 ) ) ( not ( = ?auto_17808 ?auto_17818 ) ) ( not ( = ?auto_17808 ?auto_17840 ) ) ( not ( = ?auto_17808 ?auto_17834 ) ) ( not ( = ?auto_17808 ?auto_17828 ) ) ( not ( = ?auto_17808 ?auto_17831 ) ) ( not ( = ?auto_17808 ?auto_17827 ) ) ( not ( = ?auto_17808 ?auto_17823 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 ?auto_17797 ?auto_17798 ?auto_17799 ?auto_17802 ?auto_17801 ?auto_17800 ?auto_17803 ?auto_17804 ?auto_17805 )
      ( MAKE-1CRATE ?auto_17805 ?auto_17806 )
      ( MAKE-13CRATE-VERIFY ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 ?auto_17797 ?auto_17798 ?auto_17799 ?auto_17802 ?auto_17801 ?auto_17800 ?auto_17803 ?auto_17804 ?auto_17805 ?auto_17806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17847 - SURFACE
      ?auto_17848 - SURFACE
    )
    :vars
    (
      ?auto_17849 - HOIST
      ?auto_17850 - PLACE
      ?auto_17852 - PLACE
      ?auto_17853 - HOIST
      ?auto_17854 - SURFACE
      ?auto_17851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17849 ?auto_17850 ) ( SURFACE-AT ?auto_17847 ?auto_17850 ) ( CLEAR ?auto_17847 ) ( IS-CRATE ?auto_17848 ) ( AVAILABLE ?auto_17849 ) ( not ( = ?auto_17852 ?auto_17850 ) ) ( HOIST-AT ?auto_17853 ?auto_17852 ) ( AVAILABLE ?auto_17853 ) ( SURFACE-AT ?auto_17848 ?auto_17852 ) ( ON ?auto_17848 ?auto_17854 ) ( CLEAR ?auto_17848 ) ( TRUCK-AT ?auto_17851 ?auto_17850 ) ( not ( = ?auto_17847 ?auto_17848 ) ) ( not ( = ?auto_17847 ?auto_17854 ) ) ( not ( = ?auto_17848 ?auto_17854 ) ) ( not ( = ?auto_17849 ?auto_17853 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17851 ?auto_17850 ?auto_17852 )
      ( !LIFT ?auto_17853 ?auto_17848 ?auto_17854 ?auto_17852 )
      ( !LOAD ?auto_17853 ?auto_17848 ?auto_17851 ?auto_17852 )
      ( !DRIVE ?auto_17851 ?auto_17852 ?auto_17850 )
      ( !UNLOAD ?auto_17849 ?auto_17848 ?auto_17851 ?auto_17850 )
      ( !DROP ?auto_17849 ?auto_17848 ?auto_17847 ?auto_17850 )
      ( MAKE-1CRATE-VERIFY ?auto_17847 ?auto_17848 ) )
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
      ?auto_17879 - SURFACE
      ?auto_17878 - SURFACE
      ?auto_17877 - SURFACE
      ?auto_17880 - SURFACE
      ?auto_17881 - SURFACE
      ?auto_17882 - SURFACE
      ?auto_17883 - SURFACE
      ?auto_17884 - SURFACE
    )
    :vars
    (
      ?auto_17889 - HOIST
      ?auto_17885 - PLACE
      ?auto_17887 - PLACE
      ?auto_17886 - HOIST
      ?auto_17890 - SURFACE
      ?auto_17924 - PLACE
      ?auto_17893 - HOIST
      ?auto_17898 - SURFACE
      ?auto_17913 - PLACE
      ?auto_17897 - HOIST
      ?auto_17922 - SURFACE
      ?auto_17902 - PLACE
      ?auto_17905 - HOIST
      ?auto_17900 - SURFACE
      ?auto_17916 - PLACE
      ?auto_17899 - HOIST
      ?auto_17921 - SURFACE
      ?auto_17892 - PLACE
      ?auto_17911 - HOIST
      ?auto_17910 - SURFACE
      ?auto_17909 - PLACE
      ?auto_17914 - HOIST
      ?auto_17906 - SURFACE
      ?auto_17896 - PLACE
      ?auto_17894 - HOIST
      ?auto_17920 - SURFACE
      ?auto_17891 - PLACE
      ?auto_17917 - HOIST
      ?auto_17901 - SURFACE
      ?auto_17895 - PLACE
      ?auto_17908 - HOIST
      ?auto_17915 - SURFACE
      ?auto_17923 - PLACE
      ?auto_17903 - HOIST
      ?auto_17918 - SURFACE
      ?auto_17907 - PLACE
      ?auto_17925 - HOIST
      ?auto_17904 - SURFACE
      ?auto_17919 - SURFACE
      ?auto_17912 - SURFACE
      ?auto_17888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17889 ?auto_17885 ) ( IS-CRATE ?auto_17884 ) ( not ( = ?auto_17887 ?auto_17885 ) ) ( HOIST-AT ?auto_17886 ?auto_17887 ) ( AVAILABLE ?auto_17886 ) ( SURFACE-AT ?auto_17884 ?auto_17887 ) ( ON ?auto_17884 ?auto_17890 ) ( CLEAR ?auto_17884 ) ( not ( = ?auto_17883 ?auto_17884 ) ) ( not ( = ?auto_17883 ?auto_17890 ) ) ( not ( = ?auto_17884 ?auto_17890 ) ) ( not ( = ?auto_17889 ?auto_17886 ) ) ( IS-CRATE ?auto_17883 ) ( not ( = ?auto_17924 ?auto_17885 ) ) ( HOIST-AT ?auto_17893 ?auto_17924 ) ( SURFACE-AT ?auto_17883 ?auto_17924 ) ( ON ?auto_17883 ?auto_17898 ) ( CLEAR ?auto_17883 ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17898 ) ) ( not ( = ?auto_17883 ?auto_17898 ) ) ( not ( = ?auto_17889 ?auto_17893 ) ) ( IS-CRATE ?auto_17882 ) ( not ( = ?auto_17913 ?auto_17885 ) ) ( HOIST-AT ?auto_17897 ?auto_17913 ) ( AVAILABLE ?auto_17897 ) ( SURFACE-AT ?auto_17882 ?auto_17913 ) ( ON ?auto_17882 ?auto_17922 ) ( CLEAR ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17922 ) ) ( not ( = ?auto_17882 ?auto_17922 ) ) ( not ( = ?auto_17889 ?auto_17897 ) ) ( IS-CRATE ?auto_17881 ) ( not ( = ?auto_17902 ?auto_17885 ) ) ( HOIST-AT ?auto_17905 ?auto_17902 ) ( AVAILABLE ?auto_17905 ) ( SURFACE-AT ?auto_17881 ?auto_17902 ) ( ON ?auto_17881 ?auto_17900 ) ( CLEAR ?auto_17881 ) ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17900 ) ) ( not ( = ?auto_17881 ?auto_17900 ) ) ( not ( = ?auto_17889 ?auto_17905 ) ) ( IS-CRATE ?auto_17880 ) ( not ( = ?auto_17916 ?auto_17885 ) ) ( HOIST-AT ?auto_17899 ?auto_17916 ) ( AVAILABLE ?auto_17899 ) ( SURFACE-AT ?auto_17880 ?auto_17916 ) ( ON ?auto_17880 ?auto_17921 ) ( CLEAR ?auto_17880 ) ( not ( = ?auto_17877 ?auto_17880 ) ) ( not ( = ?auto_17877 ?auto_17921 ) ) ( not ( = ?auto_17880 ?auto_17921 ) ) ( not ( = ?auto_17889 ?auto_17899 ) ) ( IS-CRATE ?auto_17877 ) ( not ( = ?auto_17892 ?auto_17885 ) ) ( HOIST-AT ?auto_17911 ?auto_17892 ) ( AVAILABLE ?auto_17911 ) ( SURFACE-AT ?auto_17877 ?auto_17892 ) ( ON ?auto_17877 ?auto_17910 ) ( CLEAR ?auto_17877 ) ( not ( = ?auto_17878 ?auto_17877 ) ) ( not ( = ?auto_17878 ?auto_17910 ) ) ( not ( = ?auto_17877 ?auto_17910 ) ) ( not ( = ?auto_17889 ?auto_17911 ) ) ( IS-CRATE ?auto_17878 ) ( not ( = ?auto_17909 ?auto_17885 ) ) ( HOIST-AT ?auto_17914 ?auto_17909 ) ( AVAILABLE ?auto_17914 ) ( SURFACE-AT ?auto_17878 ?auto_17909 ) ( ON ?auto_17878 ?auto_17906 ) ( CLEAR ?auto_17878 ) ( not ( = ?auto_17879 ?auto_17878 ) ) ( not ( = ?auto_17879 ?auto_17906 ) ) ( not ( = ?auto_17878 ?auto_17906 ) ) ( not ( = ?auto_17889 ?auto_17914 ) ) ( IS-CRATE ?auto_17879 ) ( not ( = ?auto_17896 ?auto_17885 ) ) ( HOIST-AT ?auto_17894 ?auto_17896 ) ( AVAILABLE ?auto_17894 ) ( SURFACE-AT ?auto_17879 ?auto_17896 ) ( ON ?auto_17879 ?auto_17920 ) ( CLEAR ?auto_17879 ) ( not ( = ?auto_17876 ?auto_17879 ) ) ( not ( = ?auto_17876 ?auto_17920 ) ) ( not ( = ?auto_17879 ?auto_17920 ) ) ( not ( = ?auto_17889 ?auto_17894 ) ) ( IS-CRATE ?auto_17876 ) ( not ( = ?auto_17891 ?auto_17885 ) ) ( HOIST-AT ?auto_17917 ?auto_17891 ) ( AVAILABLE ?auto_17917 ) ( SURFACE-AT ?auto_17876 ?auto_17891 ) ( ON ?auto_17876 ?auto_17901 ) ( CLEAR ?auto_17876 ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( not ( = ?auto_17875 ?auto_17901 ) ) ( not ( = ?auto_17876 ?auto_17901 ) ) ( not ( = ?auto_17889 ?auto_17917 ) ) ( IS-CRATE ?auto_17875 ) ( not ( = ?auto_17895 ?auto_17885 ) ) ( HOIST-AT ?auto_17908 ?auto_17895 ) ( SURFACE-AT ?auto_17875 ?auto_17895 ) ( ON ?auto_17875 ?auto_17915 ) ( CLEAR ?auto_17875 ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17915 ) ) ( not ( = ?auto_17875 ?auto_17915 ) ) ( not ( = ?auto_17889 ?auto_17908 ) ) ( IS-CRATE ?auto_17874 ) ( not ( = ?auto_17923 ?auto_17885 ) ) ( HOIST-AT ?auto_17903 ?auto_17923 ) ( AVAILABLE ?auto_17903 ) ( SURFACE-AT ?auto_17874 ?auto_17923 ) ( ON ?auto_17874 ?auto_17918 ) ( CLEAR ?auto_17874 ) ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17918 ) ) ( not ( = ?auto_17874 ?auto_17918 ) ) ( not ( = ?auto_17889 ?auto_17903 ) ) ( IS-CRATE ?auto_17873 ) ( not ( = ?auto_17907 ?auto_17885 ) ) ( HOIST-AT ?auto_17925 ?auto_17907 ) ( AVAILABLE ?auto_17925 ) ( SURFACE-AT ?auto_17873 ?auto_17907 ) ( ON ?auto_17873 ?auto_17904 ) ( CLEAR ?auto_17873 ) ( not ( = ?auto_17872 ?auto_17873 ) ) ( not ( = ?auto_17872 ?auto_17904 ) ) ( not ( = ?auto_17873 ?auto_17904 ) ) ( not ( = ?auto_17889 ?auto_17925 ) ) ( IS-CRATE ?auto_17872 ) ( AVAILABLE ?auto_17908 ) ( SURFACE-AT ?auto_17872 ?auto_17895 ) ( ON ?auto_17872 ?auto_17919 ) ( CLEAR ?auto_17872 ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17919 ) ) ( not ( = ?auto_17872 ?auto_17919 ) ) ( SURFACE-AT ?auto_17870 ?auto_17885 ) ( CLEAR ?auto_17870 ) ( IS-CRATE ?auto_17871 ) ( AVAILABLE ?auto_17889 ) ( AVAILABLE ?auto_17893 ) ( SURFACE-AT ?auto_17871 ?auto_17924 ) ( ON ?auto_17871 ?auto_17912 ) ( CLEAR ?auto_17871 ) ( TRUCK-AT ?auto_17888 ?auto_17885 ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( not ( = ?auto_17870 ?auto_17912 ) ) ( not ( = ?auto_17871 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( not ( = ?auto_17870 ?auto_17919 ) ) ( not ( = ?auto_17872 ?auto_17912 ) ) ( not ( = ?auto_17895 ?auto_17924 ) ) ( not ( = ?auto_17908 ?auto_17893 ) ) ( not ( = ?auto_17919 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17873 ) ) ( not ( = ?auto_17870 ?auto_17904 ) ) ( not ( = ?auto_17871 ?auto_17873 ) ) ( not ( = ?auto_17871 ?auto_17904 ) ) ( not ( = ?auto_17873 ?auto_17919 ) ) ( not ( = ?auto_17873 ?auto_17912 ) ) ( not ( = ?auto_17907 ?auto_17895 ) ) ( not ( = ?auto_17907 ?auto_17924 ) ) ( not ( = ?auto_17925 ?auto_17908 ) ) ( not ( = ?auto_17925 ?auto_17893 ) ) ( not ( = ?auto_17904 ?auto_17919 ) ) ( not ( = ?auto_17904 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17874 ) ) ( not ( = ?auto_17870 ?auto_17918 ) ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( not ( = ?auto_17871 ?auto_17918 ) ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( not ( = ?auto_17872 ?auto_17918 ) ) ( not ( = ?auto_17874 ?auto_17904 ) ) ( not ( = ?auto_17874 ?auto_17919 ) ) ( not ( = ?auto_17874 ?auto_17912 ) ) ( not ( = ?auto_17923 ?auto_17907 ) ) ( not ( = ?auto_17923 ?auto_17895 ) ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17903 ?auto_17925 ) ) ( not ( = ?auto_17903 ?auto_17908 ) ) ( not ( = ?auto_17903 ?auto_17893 ) ) ( not ( = ?auto_17918 ?auto_17904 ) ) ( not ( = ?auto_17918 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17875 ) ) ( not ( = ?auto_17870 ?auto_17915 ) ) ( not ( = ?auto_17871 ?auto_17875 ) ) ( not ( = ?auto_17871 ?auto_17915 ) ) ( not ( = ?auto_17872 ?auto_17875 ) ) ( not ( = ?auto_17872 ?auto_17915 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17915 ) ) ( not ( = ?auto_17875 ?auto_17918 ) ) ( not ( = ?auto_17875 ?auto_17904 ) ) ( not ( = ?auto_17875 ?auto_17919 ) ) ( not ( = ?auto_17875 ?auto_17912 ) ) ( not ( = ?auto_17915 ?auto_17918 ) ) ( not ( = ?auto_17915 ?auto_17904 ) ) ( not ( = ?auto_17915 ?auto_17919 ) ) ( not ( = ?auto_17915 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17876 ) ) ( not ( = ?auto_17870 ?auto_17901 ) ) ( not ( = ?auto_17871 ?auto_17876 ) ) ( not ( = ?auto_17871 ?auto_17901 ) ) ( not ( = ?auto_17872 ?auto_17876 ) ) ( not ( = ?auto_17872 ?auto_17901 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) ( not ( = ?auto_17873 ?auto_17901 ) ) ( not ( = ?auto_17874 ?auto_17876 ) ) ( not ( = ?auto_17874 ?auto_17901 ) ) ( not ( = ?auto_17876 ?auto_17915 ) ) ( not ( = ?auto_17876 ?auto_17918 ) ) ( not ( = ?auto_17876 ?auto_17904 ) ) ( not ( = ?auto_17876 ?auto_17919 ) ) ( not ( = ?auto_17876 ?auto_17912 ) ) ( not ( = ?auto_17891 ?auto_17895 ) ) ( not ( = ?auto_17891 ?auto_17923 ) ) ( not ( = ?auto_17891 ?auto_17907 ) ) ( not ( = ?auto_17891 ?auto_17924 ) ) ( not ( = ?auto_17917 ?auto_17908 ) ) ( not ( = ?auto_17917 ?auto_17903 ) ) ( not ( = ?auto_17917 ?auto_17925 ) ) ( not ( = ?auto_17917 ?auto_17893 ) ) ( not ( = ?auto_17901 ?auto_17915 ) ) ( not ( = ?auto_17901 ?auto_17918 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17919 ) ) ( not ( = ?auto_17901 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17879 ) ) ( not ( = ?auto_17870 ?auto_17920 ) ) ( not ( = ?auto_17871 ?auto_17879 ) ) ( not ( = ?auto_17871 ?auto_17920 ) ) ( not ( = ?auto_17872 ?auto_17879 ) ) ( not ( = ?auto_17872 ?auto_17920 ) ) ( not ( = ?auto_17873 ?auto_17879 ) ) ( not ( = ?auto_17873 ?auto_17920 ) ) ( not ( = ?auto_17874 ?auto_17879 ) ) ( not ( = ?auto_17874 ?auto_17920 ) ) ( not ( = ?auto_17875 ?auto_17879 ) ) ( not ( = ?auto_17875 ?auto_17920 ) ) ( not ( = ?auto_17879 ?auto_17901 ) ) ( not ( = ?auto_17879 ?auto_17915 ) ) ( not ( = ?auto_17879 ?auto_17918 ) ) ( not ( = ?auto_17879 ?auto_17904 ) ) ( not ( = ?auto_17879 ?auto_17919 ) ) ( not ( = ?auto_17879 ?auto_17912 ) ) ( not ( = ?auto_17896 ?auto_17891 ) ) ( not ( = ?auto_17896 ?auto_17895 ) ) ( not ( = ?auto_17896 ?auto_17923 ) ) ( not ( = ?auto_17896 ?auto_17907 ) ) ( not ( = ?auto_17896 ?auto_17924 ) ) ( not ( = ?auto_17894 ?auto_17917 ) ) ( not ( = ?auto_17894 ?auto_17908 ) ) ( not ( = ?auto_17894 ?auto_17903 ) ) ( not ( = ?auto_17894 ?auto_17925 ) ) ( not ( = ?auto_17894 ?auto_17893 ) ) ( not ( = ?auto_17920 ?auto_17901 ) ) ( not ( = ?auto_17920 ?auto_17915 ) ) ( not ( = ?auto_17920 ?auto_17918 ) ) ( not ( = ?auto_17920 ?auto_17904 ) ) ( not ( = ?auto_17920 ?auto_17919 ) ) ( not ( = ?auto_17920 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17878 ) ) ( not ( = ?auto_17870 ?auto_17906 ) ) ( not ( = ?auto_17871 ?auto_17878 ) ) ( not ( = ?auto_17871 ?auto_17906 ) ) ( not ( = ?auto_17872 ?auto_17878 ) ) ( not ( = ?auto_17872 ?auto_17906 ) ) ( not ( = ?auto_17873 ?auto_17878 ) ) ( not ( = ?auto_17873 ?auto_17906 ) ) ( not ( = ?auto_17874 ?auto_17878 ) ) ( not ( = ?auto_17874 ?auto_17906 ) ) ( not ( = ?auto_17875 ?auto_17878 ) ) ( not ( = ?auto_17875 ?auto_17906 ) ) ( not ( = ?auto_17876 ?auto_17878 ) ) ( not ( = ?auto_17876 ?auto_17906 ) ) ( not ( = ?auto_17878 ?auto_17920 ) ) ( not ( = ?auto_17878 ?auto_17901 ) ) ( not ( = ?auto_17878 ?auto_17915 ) ) ( not ( = ?auto_17878 ?auto_17918 ) ) ( not ( = ?auto_17878 ?auto_17904 ) ) ( not ( = ?auto_17878 ?auto_17919 ) ) ( not ( = ?auto_17878 ?auto_17912 ) ) ( not ( = ?auto_17909 ?auto_17896 ) ) ( not ( = ?auto_17909 ?auto_17891 ) ) ( not ( = ?auto_17909 ?auto_17895 ) ) ( not ( = ?auto_17909 ?auto_17923 ) ) ( not ( = ?auto_17909 ?auto_17907 ) ) ( not ( = ?auto_17909 ?auto_17924 ) ) ( not ( = ?auto_17914 ?auto_17894 ) ) ( not ( = ?auto_17914 ?auto_17917 ) ) ( not ( = ?auto_17914 ?auto_17908 ) ) ( not ( = ?auto_17914 ?auto_17903 ) ) ( not ( = ?auto_17914 ?auto_17925 ) ) ( not ( = ?auto_17914 ?auto_17893 ) ) ( not ( = ?auto_17906 ?auto_17920 ) ) ( not ( = ?auto_17906 ?auto_17901 ) ) ( not ( = ?auto_17906 ?auto_17915 ) ) ( not ( = ?auto_17906 ?auto_17918 ) ) ( not ( = ?auto_17906 ?auto_17904 ) ) ( not ( = ?auto_17906 ?auto_17919 ) ) ( not ( = ?auto_17906 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17877 ) ) ( not ( = ?auto_17870 ?auto_17910 ) ) ( not ( = ?auto_17871 ?auto_17877 ) ) ( not ( = ?auto_17871 ?auto_17910 ) ) ( not ( = ?auto_17872 ?auto_17877 ) ) ( not ( = ?auto_17872 ?auto_17910 ) ) ( not ( = ?auto_17873 ?auto_17877 ) ) ( not ( = ?auto_17873 ?auto_17910 ) ) ( not ( = ?auto_17874 ?auto_17877 ) ) ( not ( = ?auto_17874 ?auto_17910 ) ) ( not ( = ?auto_17875 ?auto_17877 ) ) ( not ( = ?auto_17875 ?auto_17910 ) ) ( not ( = ?auto_17876 ?auto_17877 ) ) ( not ( = ?auto_17876 ?auto_17910 ) ) ( not ( = ?auto_17879 ?auto_17877 ) ) ( not ( = ?auto_17879 ?auto_17910 ) ) ( not ( = ?auto_17877 ?auto_17906 ) ) ( not ( = ?auto_17877 ?auto_17920 ) ) ( not ( = ?auto_17877 ?auto_17901 ) ) ( not ( = ?auto_17877 ?auto_17915 ) ) ( not ( = ?auto_17877 ?auto_17918 ) ) ( not ( = ?auto_17877 ?auto_17904 ) ) ( not ( = ?auto_17877 ?auto_17919 ) ) ( not ( = ?auto_17877 ?auto_17912 ) ) ( not ( = ?auto_17892 ?auto_17909 ) ) ( not ( = ?auto_17892 ?auto_17896 ) ) ( not ( = ?auto_17892 ?auto_17891 ) ) ( not ( = ?auto_17892 ?auto_17895 ) ) ( not ( = ?auto_17892 ?auto_17923 ) ) ( not ( = ?auto_17892 ?auto_17907 ) ) ( not ( = ?auto_17892 ?auto_17924 ) ) ( not ( = ?auto_17911 ?auto_17914 ) ) ( not ( = ?auto_17911 ?auto_17894 ) ) ( not ( = ?auto_17911 ?auto_17917 ) ) ( not ( = ?auto_17911 ?auto_17908 ) ) ( not ( = ?auto_17911 ?auto_17903 ) ) ( not ( = ?auto_17911 ?auto_17925 ) ) ( not ( = ?auto_17911 ?auto_17893 ) ) ( not ( = ?auto_17910 ?auto_17906 ) ) ( not ( = ?auto_17910 ?auto_17920 ) ) ( not ( = ?auto_17910 ?auto_17901 ) ) ( not ( = ?auto_17910 ?auto_17915 ) ) ( not ( = ?auto_17910 ?auto_17918 ) ) ( not ( = ?auto_17910 ?auto_17904 ) ) ( not ( = ?auto_17910 ?auto_17919 ) ) ( not ( = ?auto_17910 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17880 ) ) ( not ( = ?auto_17870 ?auto_17921 ) ) ( not ( = ?auto_17871 ?auto_17880 ) ) ( not ( = ?auto_17871 ?auto_17921 ) ) ( not ( = ?auto_17872 ?auto_17880 ) ) ( not ( = ?auto_17872 ?auto_17921 ) ) ( not ( = ?auto_17873 ?auto_17880 ) ) ( not ( = ?auto_17873 ?auto_17921 ) ) ( not ( = ?auto_17874 ?auto_17880 ) ) ( not ( = ?auto_17874 ?auto_17921 ) ) ( not ( = ?auto_17875 ?auto_17880 ) ) ( not ( = ?auto_17875 ?auto_17921 ) ) ( not ( = ?auto_17876 ?auto_17880 ) ) ( not ( = ?auto_17876 ?auto_17921 ) ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17921 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17921 ) ) ( not ( = ?auto_17880 ?auto_17910 ) ) ( not ( = ?auto_17880 ?auto_17906 ) ) ( not ( = ?auto_17880 ?auto_17920 ) ) ( not ( = ?auto_17880 ?auto_17901 ) ) ( not ( = ?auto_17880 ?auto_17915 ) ) ( not ( = ?auto_17880 ?auto_17918 ) ) ( not ( = ?auto_17880 ?auto_17904 ) ) ( not ( = ?auto_17880 ?auto_17919 ) ) ( not ( = ?auto_17880 ?auto_17912 ) ) ( not ( = ?auto_17916 ?auto_17892 ) ) ( not ( = ?auto_17916 ?auto_17909 ) ) ( not ( = ?auto_17916 ?auto_17896 ) ) ( not ( = ?auto_17916 ?auto_17891 ) ) ( not ( = ?auto_17916 ?auto_17895 ) ) ( not ( = ?auto_17916 ?auto_17923 ) ) ( not ( = ?auto_17916 ?auto_17907 ) ) ( not ( = ?auto_17916 ?auto_17924 ) ) ( not ( = ?auto_17899 ?auto_17911 ) ) ( not ( = ?auto_17899 ?auto_17914 ) ) ( not ( = ?auto_17899 ?auto_17894 ) ) ( not ( = ?auto_17899 ?auto_17917 ) ) ( not ( = ?auto_17899 ?auto_17908 ) ) ( not ( = ?auto_17899 ?auto_17903 ) ) ( not ( = ?auto_17899 ?auto_17925 ) ) ( not ( = ?auto_17899 ?auto_17893 ) ) ( not ( = ?auto_17921 ?auto_17910 ) ) ( not ( = ?auto_17921 ?auto_17906 ) ) ( not ( = ?auto_17921 ?auto_17920 ) ) ( not ( = ?auto_17921 ?auto_17901 ) ) ( not ( = ?auto_17921 ?auto_17915 ) ) ( not ( = ?auto_17921 ?auto_17918 ) ) ( not ( = ?auto_17921 ?auto_17904 ) ) ( not ( = ?auto_17921 ?auto_17919 ) ) ( not ( = ?auto_17921 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17881 ) ) ( not ( = ?auto_17870 ?auto_17900 ) ) ( not ( = ?auto_17871 ?auto_17881 ) ) ( not ( = ?auto_17871 ?auto_17900 ) ) ( not ( = ?auto_17872 ?auto_17881 ) ) ( not ( = ?auto_17872 ?auto_17900 ) ) ( not ( = ?auto_17873 ?auto_17881 ) ) ( not ( = ?auto_17873 ?auto_17900 ) ) ( not ( = ?auto_17874 ?auto_17881 ) ) ( not ( = ?auto_17874 ?auto_17900 ) ) ( not ( = ?auto_17875 ?auto_17881 ) ) ( not ( = ?auto_17875 ?auto_17900 ) ) ( not ( = ?auto_17876 ?auto_17881 ) ) ( not ( = ?auto_17876 ?auto_17900 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17900 ) ) ( not ( = ?auto_17878 ?auto_17881 ) ) ( not ( = ?auto_17878 ?auto_17900 ) ) ( not ( = ?auto_17877 ?auto_17881 ) ) ( not ( = ?auto_17877 ?auto_17900 ) ) ( not ( = ?auto_17881 ?auto_17921 ) ) ( not ( = ?auto_17881 ?auto_17910 ) ) ( not ( = ?auto_17881 ?auto_17906 ) ) ( not ( = ?auto_17881 ?auto_17920 ) ) ( not ( = ?auto_17881 ?auto_17901 ) ) ( not ( = ?auto_17881 ?auto_17915 ) ) ( not ( = ?auto_17881 ?auto_17918 ) ) ( not ( = ?auto_17881 ?auto_17904 ) ) ( not ( = ?auto_17881 ?auto_17919 ) ) ( not ( = ?auto_17881 ?auto_17912 ) ) ( not ( = ?auto_17902 ?auto_17916 ) ) ( not ( = ?auto_17902 ?auto_17892 ) ) ( not ( = ?auto_17902 ?auto_17909 ) ) ( not ( = ?auto_17902 ?auto_17896 ) ) ( not ( = ?auto_17902 ?auto_17891 ) ) ( not ( = ?auto_17902 ?auto_17895 ) ) ( not ( = ?auto_17902 ?auto_17923 ) ) ( not ( = ?auto_17902 ?auto_17907 ) ) ( not ( = ?auto_17902 ?auto_17924 ) ) ( not ( = ?auto_17905 ?auto_17899 ) ) ( not ( = ?auto_17905 ?auto_17911 ) ) ( not ( = ?auto_17905 ?auto_17914 ) ) ( not ( = ?auto_17905 ?auto_17894 ) ) ( not ( = ?auto_17905 ?auto_17917 ) ) ( not ( = ?auto_17905 ?auto_17908 ) ) ( not ( = ?auto_17905 ?auto_17903 ) ) ( not ( = ?auto_17905 ?auto_17925 ) ) ( not ( = ?auto_17905 ?auto_17893 ) ) ( not ( = ?auto_17900 ?auto_17921 ) ) ( not ( = ?auto_17900 ?auto_17910 ) ) ( not ( = ?auto_17900 ?auto_17906 ) ) ( not ( = ?auto_17900 ?auto_17920 ) ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17915 ) ) ( not ( = ?auto_17900 ?auto_17918 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17919 ) ) ( not ( = ?auto_17900 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17882 ) ) ( not ( = ?auto_17870 ?auto_17922 ) ) ( not ( = ?auto_17871 ?auto_17882 ) ) ( not ( = ?auto_17871 ?auto_17922 ) ) ( not ( = ?auto_17872 ?auto_17882 ) ) ( not ( = ?auto_17872 ?auto_17922 ) ) ( not ( = ?auto_17873 ?auto_17882 ) ) ( not ( = ?auto_17873 ?auto_17922 ) ) ( not ( = ?auto_17874 ?auto_17882 ) ) ( not ( = ?auto_17874 ?auto_17922 ) ) ( not ( = ?auto_17875 ?auto_17882 ) ) ( not ( = ?auto_17875 ?auto_17922 ) ) ( not ( = ?auto_17876 ?auto_17882 ) ) ( not ( = ?auto_17876 ?auto_17922 ) ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( not ( = ?auto_17879 ?auto_17922 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17922 ) ) ( not ( = ?auto_17877 ?auto_17882 ) ) ( not ( = ?auto_17877 ?auto_17922 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17922 ) ) ( not ( = ?auto_17882 ?auto_17900 ) ) ( not ( = ?auto_17882 ?auto_17921 ) ) ( not ( = ?auto_17882 ?auto_17910 ) ) ( not ( = ?auto_17882 ?auto_17906 ) ) ( not ( = ?auto_17882 ?auto_17920 ) ) ( not ( = ?auto_17882 ?auto_17901 ) ) ( not ( = ?auto_17882 ?auto_17915 ) ) ( not ( = ?auto_17882 ?auto_17918 ) ) ( not ( = ?auto_17882 ?auto_17904 ) ) ( not ( = ?auto_17882 ?auto_17919 ) ) ( not ( = ?auto_17882 ?auto_17912 ) ) ( not ( = ?auto_17913 ?auto_17902 ) ) ( not ( = ?auto_17913 ?auto_17916 ) ) ( not ( = ?auto_17913 ?auto_17892 ) ) ( not ( = ?auto_17913 ?auto_17909 ) ) ( not ( = ?auto_17913 ?auto_17896 ) ) ( not ( = ?auto_17913 ?auto_17891 ) ) ( not ( = ?auto_17913 ?auto_17895 ) ) ( not ( = ?auto_17913 ?auto_17923 ) ) ( not ( = ?auto_17913 ?auto_17907 ) ) ( not ( = ?auto_17913 ?auto_17924 ) ) ( not ( = ?auto_17897 ?auto_17905 ) ) ( not ( = ?auto_17897 ?auto_17899 ) ) ( not ( = ?auto_17897 ?auto_17911 ) ) ( not ( = ?auto_17897 ?auto_17914 ) ) ( not ( = ?auto_17897 ?auto_17894 ) ) ( not ( = ?auto_17897 ?auto_17917 ) ) ( not ( = ?auto_17897 ?auto_17908 ) ) ( not ( = ?auto_17897 ?auto_17903 ) ) ( not ( = ?auto_17897 ?auto_17925 ) ) ( not ( = ?auto_17897 ?auto_17893 ) ) ( not ( = ?auto_17922 ?auto_17900 ) ) ( not ( = ?auto_17922 ?auto_17921 ) ) ( not ( = ?auto_17922 ?auto_17910 ) ) ( not ( = ?auto_17922 ?auto_17906 ) ) ( not ( = ?auto_17922 ?auto_17920 ) ) ( not ( = ?auto_17922 ?auto_17901 ) ) ( not ( = ?auto_17922 ?auto_17915 ) ) ( not ( = ?auto_17922 ?auto_17918 ) ) ( not ( = ?auto_17922 ?auto_17904 ) ) ( not ( = ?auto_17922 ?auto_17919 ) ) ( not ( = ?auto_17922 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17883 ) ) ( not ( = ?auto_17870 ?auto_17898 ) ) ( not ( = ?auto_17871 ?auto_17883 ) ) ( not ( = ?auto_17871 ?auto_17898 ) ) ( not ( = ?auto_17872 ?auto_17883 ) ) ( not ( = ?auto_17872 ?auto_17898 ) ) ( not ( = ?auto_17873 ?auto_17883 ) ) ( not ( = ?auto_17873 ?auto_17898 ) ) ( not ( = ?auto_17874 ?auto_17883 ) ) ( not ( = ?auto_17874 ?auto_17898 ) ) ( not ( = ?auto_17875 ?auto_17883 ) ) ( not ( = ?auto_17875 ?auto_17898 ) ) ( not ( = ?auto_17876 ?auto_17883 ) ) ( not ( = ?auto_17876 ?auto_17898 ) ) ( not ( = ?auto_17879 ?auto_17883 ) ) ( not ( = ?auto_17879 ?auto_17898 ) ) ( not ( = ?auto_17878 ?auto_17883 ) ) ( not ( = ?auto_17878 ?auto_17898 ) ) ( not ( = ?auto_17877 ?auto_17883 ) ) ( not ( = ?auto_17877 ?auto_17898 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17898 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17898 ) ) ( not ( = ?auto_17883 ?auto_17922 ) ) ( not ( = ?auto_17883 ?auto_17900 ) ) ( not ( = ?auto_17883 ?auto_17921 ) ) ( not ( = ?auto_17883 ?auto_17910 ) ) ( not ( = ?auto_17883 ?auto_17906 ) ) ( not ( = ?auto_17883 ?auto_17920 ) ) ( not ( = ?auto_17883 ?auto_17901 ) ) ( not ( = ?auto_17883 ?auto_17915 ) ) ( not ( = ?auto_17883 ?auto_17918 ) ) ( not ( = ?auto_17883 ?auto_17904 ) ) ( not ( = ?auto_17883 ?auto_17919 ) ) ( not ( = ?auto_17883 ?auto_17912 ) ) ( not ( = ?auto_17898 ?auto_17922 ) ) ( not ( = ?auto_17898 ?auto_17900 ) ) ( not ( = ?auto_17898 ?auto_17921 ) ) ( not ( = ?auto_17898 ?auto_17910 ) ) ( not ( = ?auto_17898 ?auto_17906 ) ) ( not ( = ?auto_17898 ?auto_17920 ) ) ( not ( = ?auto_17898 ?auto_17901 ) ) ( not ( = ?auto_17898 ?auto_17915 ) ) ( not ( = ?auto_17898 ?auto_17918 ) ) ( not ( = ?auto_17898 ?auto_17904 ) ) ( not ( = ?auto_17898 ?auto_17919 ) ) ( not ( = ?auto_17898 ?auto_17912 ) ) ( not ( = ?auto_17870 ?auto_17884 ) ) ( not ( = ?auto_17870 ?auto_17890 ) ) ( not ( = ?auto_17871 ?auto_17884 ) ) ( not ( = ?auto_17871 ?auto_17890 ) ) ( not ( = ?auto_17872 ?auto_17884 ) ) ( not ( = ?auto_17872 ?auto_17890 ) ) ( not ( = ?auto_17873 ?auto_17884 ) ) ( not ( = ?auto_17873 ?auto_17890 ) ) ( not ( = ?auto_17874 ?auto_17884 ) ) ( not ( = ?auto_17874 ?auto_17890 ) ) ( not ( = ?auto_17875 ?auto_17884 ) ) ( not ( = ?auto_17875 ?auto_17890 ) ) ( not ( = ?auto_17876 ?auto_17884 ) ) ( not ( = ?auto_17876 ?auto_17890 ) ) ( not ( = ?auto_17879 ?auto_17884 ) ) ( not ( = ?auto_17879 ?auto_17890 ) ) ( not ( = ?auto_17878 ?auto_17884 ) ) ( not ( = ?auto_17878 ?auto_17890 ) ) ( not ( = ?auto_17877 ?auto_17884 ) ) ( not ( = ?auto_17877 ?auto_17890 ) ) ( not ( = ?auto_17880 ?auto_17884 ) ) ( not ( = ?auto_17880 ?auto_17890 ) ) ( not ( = ?auto_17881 ?auto_17884 ) ) ( not ( = ?auto_17881 ?auto_17890 ) ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( not ( = ?auto_17882 ?auto_17890 ) ) ( not ( = ?auto_17884 ?auto_17898 ) ) ( not ( = ?auto_17884 ?auto_17922 ) ) ( not ( = ?auto_17884 ?auto_17900 ) ) ( not ( = ?auto_17884 ?auto_17921 ) ) ( not ( = ?auto_17884 ?auto_17910 ) ) ( not ( = ?auto_17884 ?auto_17906 ) ) ( not ( = ?auto_17884 ?auto_17920 ) ) ( not ( = ?auto_17884 ?auto_17901 ) ) ( not ( = ?auto_17884 ?auto_17915 ) ) ( not ( = ?auto_17884 ?auto_17918 ) ) ( not ( = ?auto_17884 ?auto_17904 ) ) ( not ( = ?auto_17884 ?auto_17919 ) ) ( not ( = ?auto_17884 ?auto_17912 ) ) ( not ( = ?auto_17887 ?auto_17924 ) ) ( not ( = ?auto_17887 ?auto_17913 ) ) ( not ( = ?auto_17887 ?auto_17902 ) ) ( not ( = ?auto_17887 ?auto_17916 ) ) ( not ( = ?auto_17887 ?auto_17892 ) ) ( not ( = ?auto_17887 ?auto_17909 ) ) ( not ( = ?auto_17887 ?auto_17896 ) ) ( not ( = ?auto_17887 ?auto_17891 ) ) ( not ( = ?auto_17887 ?auto_17895 ) ) ( not ( = ?auto_17887 ?auto_17923 ) ) ( not ( = ?auto_17887 ?auto_17907 ) ) ( not ( = ?auto_17886 ?auto_17893 ) ) ( not ( = ?auto_17886 ?auto_17897 ) ) ( not ( = ?auto_17886 ?auto_17905 ) ) ( not ( = ?auto_17886 ?auto_17899 ) ) ( not ( = ?auto_17886 ?auto_17911 ) ) ( not ( = ?auto_17886 ?auto_17914 ) ) ( not ( = ?auto_17886 ?auto_17894 ) ) ( not ( = ?auto_17886 ?auto_17917 ) ) ( not ( = ?auto_17886 ?auto_17908 ) ) ( not ( = ?auto_17886 ?auto_17903 ) ) ( not ( = ?auto_17886 ?auto_17925 ) ) ( not ( = ?auto_17890 ?auto_17898 ) ) ( not ( = ?auto_17890 ?auto_17922 ) ) ( not ( = ?auto_17890 ?auto_17900 ) ) ( not ( = ?auto_17890 ?auto_17921 ) ) ( not ( = ?auto_17890 ?auto_17910 ) ) ( not ( = ?auto_17890 ?auto_17906 ) ) ( not ( = ?auto_17890 ?auto_17920 ) ) ( not ( = ?auto_17890 ?auto_17901 ) ) ( not ( = ?auto_17890 ?auto_17915 ) ) ( not ( = ?auto_17890 ?auto_17918 ) ) ( not ( = ?auto_17890 ?auto_17904 ) ) ( not ( = ?auto_17890 ?auto_17919 ) ) ( not ( = ?auto_17890 ?auto_17912 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17870 ?auto_17871 ?auto_17872 ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ?auto_17879 ?auto_17878 ?auto_17877 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17883 )
      ( MAKE-1CRATE ?auto_17883 ?auto_17884 )
      ( MAKE-14CRATE-VERIFY ?auto_17870 ?auto_17871 ?auto_17872 ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ?auto_17879 ?auto_17878 ?auto_17877 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17883 ?auto_17884 ) )
  )

)

