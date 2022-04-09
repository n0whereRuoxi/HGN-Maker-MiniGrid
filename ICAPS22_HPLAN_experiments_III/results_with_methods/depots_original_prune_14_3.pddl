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
      ?auto_1428240 - SURFACE
      ?auto_1428241 - SURFACE
    )
    :vars
    (
      ?auto_1428242 - HOIST
      ?auto_1428243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428242 ?auto_1428243 ) ( SURFACE-AT ?auto_1428240 ?auto_1428243 ) ( CLEAR ?auto_1428240 ) ( LIFTING ?auto_1428242 ?auto_1428241 ) ( IS-CRATE ?auto_1428241 ) ( not ( = ?auto_1428240 ?auto_1428241 ) ) )
    :subtasks
    ( ( !DROP ?auto_1428242 ?auto_1428241 ?auto_1428240 ?auto_1428243 )
      ( MAKE-1CRATE-VERIFY ?auto_1428240 ?auto_1428241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428244 - SURFACE
      ?auto_1428245 - SURFACE
    )
    :vars
    (
      ?auto_1428246 - HOIST
      ?auto_1428247 - PLACE
      ?auto_1428248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428246 ?auto_1428247 ) ( SURFACE-AT ?auto_1428244 ?auto_1428247 ) ( CLEAR ?auto_1428244 ) ( IS-CRATE ?auto_1428245 ) ( not ( = ?auto_1428244 ?auto_1428245 ) ) ( TRUCK-AT ?auto_1428248 ?auto_1428247 ) ( AVAILABLE ?auto_1428246 ) ( IN ?auto_1428245 ?auto_1428248 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1428246 ?auto_1428245 ?auto_1428248 ?auto_1428247 )
      ( MAKE-1CRATE ?auto_1428244 ?auto_1428245 )
      ( MAKE-1CRATE-VERIFY ?auto_1428244 ?auto_1428245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428249 - SURFACE
      ?auto_1428250 - SURFACE
    )
    :vars
    (
      ?auto_1428252 - HOIST
      ?auto_1428251 - PLACE
      ?auto_1428253 - TRUCK
      ?auto_1428254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428252 ?auto_1428251 ) ( SURFACE-AT ?auto_1428249 ?auto_1428251 ) ( CLEAR ?auto_1428249 ) ( IS-CRATE ?auto_1428250 ) ( not ( = ?auto_1428249 ?auto_1428250 ) ) ( AVAILABLE ?auto_1428252 ) ( IN ?auto_1428250 ?auto_1428253 ) ( TRUCK-AT ?auto_1428253 ?auto_1428254 ) ( not ( = ?auto_1428254 ?auto_1428251 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1428253 ?auto_1428254 ?auto_1428251 )
      ( MAKE-1CRATE ?auto_1428249 ?auto_1428250 )
      ( MAKE-1CRATE-VERIFY ?auto_1428249 ?auto_1428250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428255 - SURFACE
      ?auto_1428256 - SURFACE
    )
    :vars
    (
      ?auto_1428258 - HOIST
      ?auto_1428259 - PLACE
      ?auto_1428257 - TRUCK
      ?auto_1428260 - PLACE
      ?auto_1428261 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428258 ?auto_1428259 ) ( SURFACE-AT ?auto_1428255 ?auto_1428259 ) ( CLEAR ?auto_1428255 ) ( IS-CRATE ?auto_1428256 ) ( not ( = ?auto_1428255 ?auto_1428256 ) ) ( AVAILABLE ?auto_1428258 ) ( TRUCK-AT ?auto_1428257 ?auto_1428260 ) ( not ( = ?auto_1428260 ?auto_1428259 ) ) ( HOIST-AT ?auto_1428261 ?auto_1428260 ) ( LIFTING ?auto_1428261 ?auto_1428256 ) ( not ( = ?auto_1428258 ?auto_1428261 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1428261 ?auto_1428256 ?auto_1428257 ?auto_1428260 )
      ( MAKE-1CRATE ?auto_1428255 ?auto_1428256 )
      ( MAKE-1CRATE-VERIFY ?auto_1428255 ?auto_1428256 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428262 - SURFACE
      ?auto_1428263 - SURFACE
    )
    :vars
    (
      ?auto_1428267 - HOIST
      ?auto_1428266 - PLACE
      ?auto_1428264 - TRUCK
      ?auto_1428268 - PLACE
      ?auto_1428265 - HOIST
      ?auto_1428269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428267 ?auto_1428266 ) ( SURFACE-AT ?auto_1428262 ?auto_1428266 ) ( CLEAR ?auto_1428262 ) ( IS-CRATE ?auto_1428263 ) ( not ( = ?auto_1428262 ?auto_1428263 ) ) ( AVAILABLE ?auto_1428267 ) ( TRUCK-AT ?auto_1428264 ?auto_1428268 ) ( not ( = ?auto_1428268 ?auto_1428266 ) ) ( HOIST-AT ?auto_1428265 ?auto_1428268 ) ( not ( = ?auto_1428267 ?auto_1428265 ) ) ( AVAILABLE ?auto_1428265 ) ( SURFACE-AT ?auto_1428263 ?auto_1428268 ) ( ON ?auto_1428263 ?auto_1428269 ) ( CLEAR ?auto_1428263 ) ( not ( = ?auto_1428262 ?auto_1428269 ) ) ( not ( = ?auto_1428263 ?auto_1428269 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1428265 ?auto_1428263 ?auto_1428269 ?auto_1428268 )
      ( MAKE-1CRATE ?auto_1428262 ?auto_1428263 )
      ( MAKE-1CRATE-VERIFY ?auto_1428262 ?auto_1428263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428270 - SURFACE
      ?auto_1428271 - SURFACE
    )
    :vars
    (
      ?auto_1428275 - HOIST
      ?auto_1428277 - PLACE
      ?auto_1428274 - PLACE
      ?auto_1428276 - HOIST
      ?auto_1428272 - SURFACE
      ?auto_1428273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428275 ?auto_1428277 ) ( SURFACE-AT ?auto_1428270 ?auto_1428277 ) ( CLEAR ?auto_1428270 ) ( IS-CRATE ?auto_1428271 ) ( not ( = ?auto_1428270 ?auto_1428271 ) ) ( AVAILABLE ?auto_1428275 ) ( not ( = ?auto_1428274 ?auto_1428277 ) ) ( HOIST-AT ?auto_1428276 ?auto_1428274 ) ( not ( = ?auto_1428275 ?auto_1428276 ) ) ( AVAILABLE ?auto_1428276 ) ( SURFACE-AT ?auto_1428271 ?auto_1428274 ) ( ON ?auto_1428271 ?auto_1428272 ) ( CLEAR ?auto_1428271 ) ( not ( = ?auto_1428270 ?auto_1428272 ) ) ( not ( = ?auto_1428271 ?auto_1428272 ) ) ( TRUCK-AT ?auto_1428273 ?auto_1428277 ) )
    :subtasks
    ( ( !DRIVE ?auto_1428273 ?auto_1428277 ?auto_1428274 )
      ( MAKE-1CRATE ?auto_1428270 ?auto_1428271 )
      ( MAKE-1CRATE-VERIFY ?auto_1428270 ?auto_1428271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428287 - SURFACE
      ?auto_1428288 - SURFACE
      ?auto_1428289 - SURFACE
    )
    :vars
    (
      ?auto_1428291 - HOIST
      ?auto_1428290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428291 ?auto_1428290 ) ( SURFACE-AT ?auto_1428288 ?auto_1428290 ) ( CLEAR ?auto_1428288 ) ( LIFTING ?auto_1428291 ?auto_1428289 ) ( IS-CRATE ?auto_1428289 ) ( not ( = ?auto_1428288 ?auto_1428289 ) ) ( ON ?auto_1428288 ?auto_1428287 ) ( not ( = ?auto_1428287 ?auto_1428288 ) ) ( not ( = ?auto_1428287 ?auto_1428289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428288 ?auto_1428289 )
      ( MAKE-2CRATE-VERIFY ?auto_1428287 ?auto_1428288 ?auto_1428289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428297 - SURFACE
      ?auto_1428298 - SURFACE
      ?auto_1428299 - SURFACE
    )
    :vars
    (
      ?auto_1428300 - HOIST
      ?auto_1428302 - PLACE
      ?auto_1428301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428300 ?auto_1428302 ) ( SURFACE-AT ?auto_1428298 ?auto_1428302 ) ( CLEAR ?auto_1428298 ) ( IS-CRATE ?auto_1428299 ) ( not ( = ?auto_1428298 ?auto_1428299 ) ) ( TRUCK-AT ?auto_1428301 ?auto_1428302 ) ( AVAILABLE ?auto_1428300 ) ( IN ?auto_1428299 ?auto_1428301 ) ( ON ?auto_1428298 ?auto_1428297 ) ( not ( = ?auto_1428297 ?auto_1428298 ) ) ( not ( = ?auto_1428297 ?auto_1428299 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428298 ?auto_1428299 )
      ( MAKE-2CRATE-VERIFY ?auto_1428297 ?auto_1428298 ?auto_1428299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428303 - SURFACE
      ?auto_1428304 - SURFACE
    )
    :vars
    (
      ?auto_1428307 - HOIST
      ?auto_1428305 - PLACE
      ?auto_1428306 - TRUCK
      ?auto_1428308 - SURFACE
      ?auto_1428309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428307 ?auto_1428305 ) ( SURFACE-AT ?auto_1428303 ?auto_1428305 ) ( CLEAR ?auto_1428303 ) ( IS-CRATE ?auto_1428304 ) ( not ( = ?auto_1428303 ?auto_1428304 ) ) ( AVAILABLE ?auto_1428307 ) ( IN ?auto_1428304 ?auto_1428306 ) ( ON ?auto_1428303 ?auto_1428308 ) ( not ( = ?auto_1428308 ?auto_1428303 ) ) ( not ( = ?auto_1428308 ?auto_1428304 ) ) ( TRUCK-AT ?auto_1428306 ?auto_1428309 ) ( not ( = ?auto_1428309 ?auto_1428305 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1428306 ?auto_1428309 ?auto_1428305 )
      ( MAKE-2CRATE ?auto_1428308 ?auto_1428303 ?auto_1428304 )
      ( MAKE-1CRATE-VERIFY ?auto_1428303 ?auto_1428304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428310 - SURFACE
      ?auto_1428311 - SURFACE
      ?auto_1428312 - SURFACE
    )
    :vars
    (
      ?auto_1428314 - HOIST
      ?auto_1428316 - PLACE
      ?auto_1428315 - TRUCK
      ?auto_1428313 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428314 ?auto_1428316 ) ( SURFACE-AT ?auto_1428311 ?auto_1428316 ) ( CLEAR ?auto_1428311 ) ( IS-CRATE ?auto_1428312 ) ( not ( = ?auto_1428311 ?auto_1428312 ) ) ( AVAILABLE ?auto_1428314 ) ( IN ?auto_1428312 ?auto_1428315 ) ( ON ?auto_1428311 ?auto_1428310 ) ( not ( = ?auto_1428310 ?auto_1428311 ) ) ( not ( = ?auto_1428310 ?auto_1428312 ) ) ( TRUCK-AT ?auto_1428315 ?auto_1428313 ) ( not ( = ?auto_1428313 ?auto_1428316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428311 ?auto_1428312 )
      ( MAKE-2CRATE-VERIFY ?auto_1428310 ?auto_1428311 ?auto_1428312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428317 - SURFACE
      ?auto_1428318 - SURFACE
    )
    :vars
    (
      ?auto_1428323 - HOIST
      ?auto_1428320 - PLACE
      ?auto_1428319 - SURFACE
      ?auto_1428322 - TRUCK
      ?auto_1428321 - PLACE
      ?auto_1428324 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428323 ?auto_1428320 ) ( SURFACE-AT ?auto_1428317 ?auto_1428320 ) ( CLEAR ?auto_1428317 ) ( IS-CRATE ?auto_1428318 ) ( not ( = ?auto_1428317 ?auto_1428318 ) ) ( AVAILABLE ?auto_1428323 ) ( ON ?auto_1428317 ?auto_1428319 ) ( not ( = ?auto_1428319 ?auto_1428317 ) ) ( not ( = ?auto_1428319 ?auto_1428318 ) ) ( TRUCK-AT ?auto_1428322 ?auto_1428321 ) ( not ( = ?auto_1428321 ?auto_1428320 ) ) ( HOIST-AT ?auto_1428324 ?auto_1428321 ) ( LIFTING ?auto_1428324 ?auto_1428318 ) ( not ( = ?auto_1428323 ?auto_1428324 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1428324 ?auto_1428318 ?auto_1428322 ?auto_1428321 )
      ( MAKE-2CRATE ?auto_1428319 ?auto_1428317 ?auto_1428318 )
      ( MAKE-1CRATE-VERIFY ?auto_1428317 ?auto_1428318 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428325 - SURFACE
      ?auto_1428326 - SURFACE
      ?auto_1428327 - SURFACE
    )
    :vars
    (
      ?auto_1428332 - HOIST
      ?auto_1428331 - PLACE
      ?auto_1428328 - TRUCK
      ?auto_1428329 - PLACE
      ?auto_1428330 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428332 ?auto_1428331 ) ( SURFACE-AT ?auto_1428326 ?auto_1428331 ) ( CLEAR ?auto_1428326 ) ( IS-CRATE ?auto_1428327 ) ( not ( = ?auto_1428326 ?auto_1428327 ) ) ( AVAILABLE ?auto_1428332 ) ( ON ?auto_1428326 ?auto_1428325 ) ( not ( = ?auto_1428325 ?auto_1428326 ) ) ( not ( = ?auto_1428325 ?auto_1428327 ) ) ( TRUCK-AT ?auto_1428328 ?auto_1428329 ) ( not ( = ?auto_1428329 ?auto_1428331 ) ) ( HOIST-AT ?auto_1428330 ?auto_1428329 ) ( LIFTING ?auto_1428330 ?auto_1428327 ) ( not ( = ?auto_1428332 ?auto_1428330 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428326 ?auto_1428327 )
      ( MAKE-2CRATE-VERIFY ?auto_1428325 ?auto_1428326 ?auto_1428327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428333 - SURFACE
      ?auto_1428334 - SURFACE
    )
    :vars
    (
      ?auto_1428339 - HOIST
      ?auto_1428335 - PLACE
      ?auto_1428336 - SURFACE
      ?auto_1428338 - TRUCK
      ?auto_1428337 - PLACE
      ?auto_1428340 - HOIST
      ?auto_1428341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428339 ?auto_1428335 ) ( SURFACE-AT ?auto_1428333 ?auto_1428335 ) ( CLEAR ?auto_1428333 ) ( IS-CRATE ?auto_1428334 ) ( not ( = ?auto_1428333 ?auto_1428334 ) ) ( AVAILABLE ?auto_1428339 ) ( ON ?auto_1428333 ?auto_1428336 ) ( not ( = ?auto_1428336 ?auto_1428333 ) ) ( not ( = ?auto_1428336 ?auto_1428334 ) ) ( TRUCK-AT ?auto_1428338 ?auto_1428337 ) ( not ( = ?auto_1428337 ?auto_1428335 ) ) ( HOIST-AT ?auto_1428340 ?auto_1428337 ) ( not ( = ?auto_1428339 ?auto_1428340 ) ) ( AVAILABLE ?auto_1428340 ) ( SURFACE-AT ?auto_1428334 ?auto_1428337 ) ( ON ?auto_1428334 ?auto_1428341 ) ( CLEAR ?auto_1428334 ) ( not ( = ?auto_1428333 ?auto_1428341 ) ) ( not ( = ?auto_1428334 ?auto_1428341 ) ) ( not ( = ?auto_1428336 ?auto_1428341 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1428340 ?auto_1428334 ?auto_1428341 ?auto_1428337 )
      ( MAKE-2CRATE ?auto_1428336 ?auto_1428333 ?auto_1428334 )
      ( MAKE-1CRATE-VERIFY ?auto_1428333 ?auto_1428334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428342 - SURFACE
      ?auto_1428343 - SURFACE
      ?auto_1428344 - SURFACE
    )
    :vars
    (
      ?auto_1428348 - HOIST
      ?auto_1428347 - PLACE
      ?auto_1428346 - TRUCK
      ?auto_1428345 - PLACE
      ?auto_1428349 - HOIST
      ?auto_1428350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428348 ?auto_1428347 ) ( SURFACE-AT ?auto_1428343 ?auto_1428347 ) ( CLEAR ?auto_1428343 ) ( IS-CRATE ?auto_1428344 ) ( not ( = ?auto_1428343 ?auto_1428344 ) ) ( AVAILABLE ?auto_1428348 ) ( ON ?auto_1428343 ?auto_1428342 ) ( not ( = ?auto_1428342 ?auto_1428343 ) ) ( not ( = ?auto_1428342 ?auto_1428344 ) ) ( TRUCK-AT ?auto_1428346 ?auto_1428345 ) ( not ( = ?auto_1428345 ?auto_1428347 ) ) ( HOIST-AT ?auto_1428349 ?auto_1428345 ) ( not ( = ?auto_1428348 ?auto_1428349 ) ) ( AVAILABLE ?auto_1428349 ) ( SURFACE-AT ?auto_1428344 ?auto_1428345 ) ( ON ?auto_1428344 ?auto_1428350 ) ( CLEAR ?auto_1428344 ) ( not ( = ?auto_1428343 ?auto_1428350 ) ) ( not ( = ?auto_1428344 ?auto_1428350 ) ) ( not ( = ?auto_1428342 ?auto_1428350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428343 ?auto_1428344 )
      ( MAKE-2CRATE-VERIFY ?auto_1428342 ?auto_1428343 ?auto_1428344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428351 - SURFACE
      ?auto_1428352 - SURFACE
    )
    :vars
    (
      ?auto_1428358 - HOIST
      ?auto_1428355 - PLACE
      ?auto_1428356 - SURFACE
      ?auto_1428359 - PLACE
      ?auto_1428354 - HOIST
      ?auto_1428357 - SURFACE
      ?auto_1428353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428358 ?auto_1428355 ) ( SURFACE-AT ?auto_1428351 ?auto_1428355 ) ( CLEAR ?auto_1428351 ) ( IS-CRATE ?auto_1428352 ) ( not ( = ?auto_1428351 ?auto_1428352 ) ) ( AVAILABLE ?auto_1428358 ) ( ON ?auto_1428351 ?auto_1428356 ) ( not ( = ?auto_1428356 ?auto_1428351 ) ) ( not ( = ?auto_1428356 ?auto_1428352 ) ) ( not ( = ?auto_1428359 ?auto_1428355 ) ) ( HOIST-AT ?auto_1428354 ?auto_1428359 ) ( not ( = ?auto_1428358 ?auto_1428354 ) ) ( AVAILABLE ?auto_1428354 ) ( SURFACE-AT ?auto_1428352 ?auto_1428359 ) ( ON ?auto_1428352 ?auto_1428357 ) ( CLEAR ?auto_1428352 ) ( not ( = ?auto_1428351 ?auto_1428357 ) ) ( not ( = ?auto_1428352 ?auto_1428357 ) ) ( not ( = ?auto_1428356 ?auto_1428357 ) ) ( TRUCK-AT ?auto_1428353 ?auto_1428355 ) )
    :subtasks
    ( ( !DRIVE ?auto_1428353 ?auto_1428355 ?auto_1428359 )
      ( MAKE-2CRATE ?auto_1428356 ?auto_1428351 ?auto_1428352 )
      ( MAKE-1CRATE-VERIFY ?auto_1428351 ?auto_1428352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428360 - SURFACE
      ?auto_1428361 - SURFACE
      ?auto_1428362 - SURFACE
    )
    :vars
    (
      ?auto_1428365 - HOIST
      ?auto_1428363 - PLACE
      ?auto_1428364 - PLACE
      ?auto_1428367 - HOIST
      ?auto_1428368 - SURFACE
      ?auto_1428366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428365 ?auto_1428363 ) ( SURFACE-AT ?auto_1428361 ?auto_1428363 ) ( CLEAR ?auto_1428361 ) ( IS-CRATE ?auto_1428362 ) ( not ( = ?auto_1428361 ?auto_1428362 ) ) ( AVAILABLE ?auto_1428365 ) ( ON ?auto_1428361 ?auto_1428360 ) ( not ( = ?auto_1428360 ?auto_1428361 ) ) ( not ( = ?auto_1428360 ?auto_1428362 ) ) ( not ( = ?auto_1428364 ?auto_1428363 ) ) ( HOIST-AT ?auto_1428367 ?auto_1428364 ) ( not ( = ?auto_1428365 ?auto_1428367 ) ) ( AVAILABLE ?auto_1428367 ) ( SURFACE-AT ?auto_1428362 ?auto_1428364 ) ( ON ?auto_1428362 ?auto_1428368 ) ( CLEAR ?auto_1428362 ) ( not ( = ?auto_1428361 ?auto_1428368 ) ) ( not ( = ?auto_1428362 ?auto_1428368 ) ) ( not ( = ?auto_1428360 ?auto_1428368 ) ) ( TRUCK-AT ?auto_1428366 ?auto_1428363 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428361 ?auto_1428362 )
      ( MAKE-2CRATE-VERIFY ?auto_1428360 ?auto_1428361 ?auto_1428362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428369 - SURFACE
      ?auto_1428370 - SURFACE
    )
    :vars
    (
      ?auto_1428374 - HOIST
      ?auto_1428376 - PLACE
      ?auto_1428371 - SURFACE
      ?auto_1428377 - PLACE
      ?auto_1428373 - HOIST
      ?auto_1428372 - SURFACE
      ?auto_1428375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428374 ?auto_1428376 ) ( IS-CRATE ?auto_1428370 ) ( not ( = ?auto_1428369 ?auto_1428370 ) ) ( not ( = ?auto_1428371 ?auto_1428369 ) ) ( not ( = ?auto_1428371 ?auto_1428370 ) ) ( not ( = ?auto_1428377 ?auto_1428376 ) ) ( HOIST-AT ?auto_1428373 ?auto_1428377 ) ( not ( = ?auto_1428374 ?auto_1428373 ) ) ( AVAILABLE ?auto_1428373 ) ( SURFACE-AT ?auto_1428370 ?auto_1428377 ) ( ON ?auto_1428370 ?auto_1428372 ) ( CLEAR ?auto_1428370 ) ( not ( = ?auto_1428369 ?auto_1428372 ) ) ( not ( = ?auto_1428370 ?auto_1428372 ) ) ( not ( = ?auto_1428371 ?auto_1428372 ) ) ( TRUCK-AT ?auto_1428375 ?auto_1428376 ) ( SURFACE-AT ?auto_1428371 ?auto_1428376 ) ( CLEAR ?auto_1428371 ) ( LIFTING ?auto_1428374 ?auto_1428369 ) ( IS-CRATE ?auto_1428369 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428371 ?auto_1428369 )
      ( MAKE-2CRATE ?auto_1428371 ?auto_1428369 ?auto_1428370 )
      ( MAKE-1CRATE-VERIFY ?auto_1428369 ?auto_1428370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428378 - SURFACE
      ?auto_1428379 - SURFACE
      ?auto_1428380 - SURFACE
    )
    :vars
    (
      ?auto_1428385 - HOIST
      ?auto_1428383 - PLACE
      ?auto_1428381 - PLACE
      ?auto_1428386 - HOIST
      ?auto_1428384 - SURFACE
      ?auto_1428382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428385 ?auto_1428383 ) ( IS-CRATE ?auto_1428380 ) ( not ( = ?auto_1428379 ?auto_1428380 ) ) ( not ( = ?auto_1428378 ?auto_1428379 ) ) ( not ( = ?auto_1428378 ?auto_1428380 ) ) ( not ( = ?auto_1428381 ?auto_1428383 ) ) ( HOIST-AT ?auto_1428386 ?auto_1428381 ) ( not ( = ?auto_1428385 ?auto_1428386 ) ) ( AVAILABLE ?auto_1428386 ) ( SURFACE-AT ?auto_1428380 ?auto_1428381 ) ( ON ?auto_1428380 ?auto_1428384 ) ( CLEAR ?auto_1428380 ) ( not ( = ?auto_1428379 ?auto_1428384 ) ) ( not ( = ?auto_1428380 ?auto_1428384 ) ) ( not ( = ?auto_1428378 ?auto_1428384 ) ) ( TRUCK-AT ?auto_1428382 ?auto_1428383 ) ( SURFACE-AT ?auto_1428378 ?auto_1428383 ) ( CLEAR ?auto_1428378 ) ( LIFTING ?auto_1428385 ?auto_1428379 ) ( IS-CRATE ?auto_1428379 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428379 ?auto_1428380 )
      ( MAKE-2CRATE-VERIFY ?auto_1428378 ?auto_1428379 ?auto_1428380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428387 - SURFACE
      ?auto_1428388 - SURFACE
    )
    :vars
    (
      ?auto_1428393 - HOIST
      ?auto_1428391 - PLACE
      ?auto_1428394 - SURFACE
      ?auto_1428395 - PLACE
      ?auto_1428392 - HOIST
      ?auto_1428390 - SURFACE
      ?auto_1428389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428393 ?auto_1428391 ) ( IS-CRATE ?auto_1428388 ) ( not ( = ?auto_1428387 ?auto_1428388 ) ) ( not ( = ?auto_1428394 ?auto_1428387 ) ) ( not ( = ?auto_1428394 ?auto_1428388 ) ) ( not ( = ?auto_1428395 ?auto_1428391 ) ) ( HOIST-AT ?auto_1428392 ?auto_1428395 ) ( not ( = ?auto_1428393 ?auto_1428392 ) ) ( AVAILABLE ?auto_1428392 ) ( SURFACE-AT ?auto_1428388 ?auto_1428395 ) ( ON ?auto_1428388 ?auto_1428390 ) ( CLEAR ?auto_1428388 ) ( not ( = ?auto_1428387 ?auto_1428390 ) ) ( not ( = ?auto_1428388 ?auto_1428390 ) ) ( not ( = ?auto_1428394 ?auto_1428390 ) ) ( TRUCK-AT ?auto_1428389 ?auto_1428391 ) ( SURFACE-AT ?auto_1428394 ?auto_1428391 ) ( CLEAR ?auto_1428394 ) ( IS-CRATE ?auto_1428387 ) ( AVAILABLE ?auto_1428393 ) ( IN ?auto_1428387 ?auto_1428389 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1428393 ?auto_1428387 ?auto_1428389 ?auto_1428391 )
      ( MAKE-2CRATE ?auto_1428394 ?auto_1428387 ?auto_1428388 )
      ( MAKE-1CRATE-VERIFY ?auto_1428387 ?auto_1428388 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428396 - SURFACE
      ?auto_1428397 - SURFACE
      ?auto_1428398 - SURFACE
    )
    :vars
    (
      ?auto_1428399 - HOIST
      ?auto_1428400 - PLACE
      ?auto_1428402 - PLACE
      ?auto_1428401 - HOIST
      ?auto_1428403 - SURFACE
      ?auto_1428404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428399 ?auto_1428400 ) ( IS-CRATE ?auto_1428398 ) ( not ( = ?auto_1428397 ?auto_1428398 ) ) ( not ( = ?auto_1428396 ?auto_1428397 ) ) ( not ( = ?auto_1428396 ?auto_1428398 ) ) ( not ( = ?auto_1428402 ?auto_1428400 ) ) ( HOIST-AT ?auto_1428401 ?auto_1428402 ) ( not ( = ?auto_1428399 ?auto_1428401 ) ) ( AVAILABLE ?auto_1428401 ) ( SURFACE-AT ?auto_1428398 ?auto_1428402 ) ( ON ?auto_1428398 ?auto_1428403 ) ( CLEAR ?auto_1428398 ) ( not ( = ?auto_1428397 ?auto_1428403 ) ) ( not ( = ?auto_1428398 ?auto_1428403 ) ) ( not ( = ?auto_1428396 ?auto_1428403 ) ) ( TRUCK-AT ?auto_1428404 ?auto_1428400 ) ( SURFACE-AT ?auto_1428396 ?auto_1428400 ) ( CLEAR ?auto_1428396 ) ( IS-CRATE ?auto_1428397 ) ( AVAILABLE ?auto_1428399 ) ( IN ?auto_1428397 ?auto_1428404 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428397 ?auto_1428398 )
      ( MAKE-2CRATE-VERIFY ?auto_1428396 ?auto_1428397 ?auto_1428398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428441 - SURFACE
      ?auto_1428442 - SURFACE
    )
    :vars
    (
      ?auto_1428447 - HOIST
      ?auto_1428443 - PLACE
      ?auto_1428449 - SURFACE
      ?auto_1428444 - PLACE
      ?auto_1428446 - HOIST
      ?auto_1428448 - SURFACE
      ?auto_1428445 - TRUCK
      ?auto_1428450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428447 ?auto_1428443 ) ( SURFACE-AT ?auto_1428441 ?auto_1428443 ) ( CLEAR ?auto_1428441 ) ( IS-CRATE ?auto_1428442 ) ( not ( = ?auto_1428441 ?auto_1428442 ) ) ( AVAILABLE ?auto_1428447 ) ( ON ?auto_1428441 ?auto_1428449 ) ( not ( = ?auto_1428449 ?auto_1428441 ) ) ( not ( = ?auto_1428449 ?auto_1428442 ) ) ( not ( = ?auto_1428444 ?auto_1428443 ) ) ( HOIST-AT ?auto_1428446 ?auto_1428444 ) ( not ( = ?auto_1428447 ?auto_1428446 ) ) ( AVAILABLE ?auto_1428446 ) ( SURFACE-AT ?auto_1428442 ?auto_1428444 ) ( ON ?auto_1428442 ?auto_1428448 ) ( CLEAR ?auto_1428442 ) ( not ( = ?auto_1428441 ?auto_1428448 ) ) ( not ( = ?auto_1428442 ?auto_1428448 ) ) ( not ( = ?auto_1428449 ?auto_1428448 ) ) ( TRUCK-AT ?auto_1428445 ?auto_1428450 ) ( not ( = ?auto_1428450 ?auto_1428443 ) ) ( not ( = ?auto_1428444 ?auto_1428450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1428445 ?auto_1428450 ?auto_1428443 )
      ( MAKE-1CRATE ?auto_1428441 ?auto_1428442 )
      ( MAKE-1CRATE-VERIFY ?auto_1428441 ?auto_1428442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428480 - SURFACE
      ?auto_1428481 - SURFACE
      ?auto_1428482 - SURFACE
      ?auto_1428483 - SURFACE
    )
    :vars
    (
      ?auto_1428484 - HOIST
      ?auto_1428485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428484 ?auto_1428485 ) ( SURFACE-AT ?auto_1428482 ?auto_1428485 ) ( CLEAR ?auto_1428482 ) ( LIFTING ?auto_1428484 ?auto_1428483 ) ( IS-CRATE ?auto_1428483 ) ( not ( = ?auto_1428482 ?auto_1428483 ) ) ( ON ?auto_1428481 ?auto_1428480 ) ( ON ?auto_1428482 ?auto_1428481 ) ( not ( = ?auto_1428480 ?auto_1428481 ) ) ( not ( = ?auto_1428480 ?auto_1428482 ) ) ( not ( = ?auto_1428480 ?auto_1428483 ) ) ( not ( = ?auto_1428481 ?auto_1428482 ) ) ( not ( = ?auto_1428481 ?auto_1428483 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428482 ?auto_1428483 )
      ( MAKE-3CRATE-VERIFY ?auto_1428480 ?auto_1428481 ?auto_1428482 ?auto_1428483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428497 - SURFACE
      ?auto_1428498 - SURFACE
      ?auto_1428499 - SURFACE
      ?auto_1428500 - SURFACE
    )
    :vars
    (
      ?auto_1428503 - HOIST
      ?auto_1428501 - PLACE
      ?auto_1428502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428503 ?auto_1428501 ) ( SURFACE-AT ?auto_1428499 ?auto_1428501 ) ( CLEAR ?auto_1428499 ) ( IS-CRATE ?auto_1428500 ) ( not ( = ?auto_1428499 ?auto_1428500 ) ) ( TRUCK-AT ?auto_1428502 ?auto_1428501 ) ( AVAILABLE ?auto_1428503 ) ( IN ?auto_1428500 ?auto_1428502 ) ( ON ?auto_1428499 ?auto_1428498 ) ( not ( = ?auto_1428498 ?auto_1428499 ) ) ( not ( = ?auto_1428498 ?auto_1428500 ) ) ( ON ?auto_1428498 ?auto_1428497 ) ( not ( = ?auto_1428497 ?auto_1428498 ) ) ( not ( = ?auto_1428497 ?auto_1428499 ) ) ( not ( = ?auto_1428497 ?auto_1428500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428498 ?auto_1428499 ?auto_1428500 )
      ( MAKE-3CRATE-VERIFY ?auto_1428497 ?auto_1428498 ?auto_1428499 ?auto_1428500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428518 - SURFACE
      ?auto_1428519 - SURFACE
      ?auto_1428520 - SURFACE
      ?auto_1428521 - SURFACE
    )
    :vars
    (
      ?auto_1428522 - HOIST
      ?auto_1428524 - PLACE
      ?auto_1428525 - TRUCK
      ?auto_1428523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428522 ?auto_1428524 ) ( SURFACE-AT ?auto_1428520 ?auto_1428524 ) ( CLEAR ?auto_1428520 ) ( IS-CRATE ?auto_1428521 ) ( not ( = ?auto_1428520 ?auto_1428521 ) ) ( AVAILABLE ?auto_1428522 ) ( IN ?auto_1428521 ?auto_1428525 ) ( ON ?auto_1428520 ?auto_1428519 ) ( not ( = ?auto_1428519 ?auto_1428520 ) ) ( not ( = ?auto_1428519 ?auto_1428521 ) ) ( TRUCK-AT ?auto_1428525 ?auto_1428523 ) ( not ( = ?auto_1428523 ?auto_1428524 ) ) ( ON ?auto_1428519 ?auto_1428518 ) ( not ( = ?auto_1428518 ?auto_1428519 ) ) ( not ( = ?auto_1428518 ?auto_1428520 ) ) ( not ( = ?auto_1428518 ?auto_1428521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428519 ?auto_1428520 ?auto_1428521 )
      ( MAKE-3CRATE-VERIFY ?auto_1428518 ?auto_1428519 ?auto_1428520 ?auto_1428521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428542 - SURFACE
      ?auto_1428543 - SURFACE
      ?auto_1428544 - SURFACE
      ?auto_1428545 - SURFACE
    )
    :vars
    (
      ?auto_1428546 - HOIST
      ?auto_1428548 - PLACE
      ?auto_1428550 - TRUCK
      ?auto_1428549 - PLACE
      ?auto_1428547 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428546 ?auto_1428548 ) ( SURFACE-AT ?auto_1428544 ?auto_1428548 ) ( CLEAR ?auto_1428544 ) ( IS-CRATE ?auto_1428545 ) ( not ( = ?auto_1428544 ?auto_1428545 ) ) ( AVAILABLE ?auto_1428546 ) ( ON ?auto_1428544 ?auto_1428543 ) ( not ( = ?auto_1428543 ?auto_1428544 ) ) ( not ( = ?auto_1428543 ?auto_1428545 ) ) ( TRUCK-AT ?auto_1428550 ?auto_1428549 ) ( not ( = ?auto_1428549 ?auto_1428548 ) ) ( HOIST-AT ?auto_1428547 ?auto_1428549 ) ( LIFTING ?auto_1428547 ?auto_1428545 ) ( not ( = ?auto_1428546 ?auto_1428547 ) ) ( ON ?auto_1428543 ?auto_1428542 ) ( not ( = ?auto_1428542 ?auto_1428543 ) ) ( not ( = ?auto_1428542 ?auto_1428544 ) ) ( not ( = ?auto_1428542 ?auto_1428545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428543 ?auto_1428544 ?auto_1428545 )
      ( MAKE-3CRATE-VERIFY ?auto_1428542 ?auto_1428543 ?auto_1428544 ?auto_1428545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428569 - SURFACE
      ?auto_1428570 - SURFACE
      ?auto_1428571 - SURFACE
      ?auto_1428572 - SURFACE
    )
    :vars
    (
      ?auto_1428578 - HOIST
      ?auto_1428573 - PLACE
      ?auto_1428575 - TRUCK
      ?auto_1428576 - PLACE
      ?auto_1428577 - HOIST
      ?auto_1428574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428578 ?auto_1428573 ) ( SURFACE-AT ?auto_1428571 ?auto_1428573 ) ( CLEAR ?auto_1428571 ) ( IS-CRATE ?auto_1428572 ) ( not ( = ?auto_1428571 ?auto_1428572 ) ) ( AVAILABLE ?auto_1428578 ) ( ON ?auto_1428571 ?auto_1428570 ) ( not ( = ?auto_1428570 ?auto_1428571 ) ) ( not ( = ?auto_1428570 ?auto_1428572 ) ) ( TRUCK-AT ?auto_1428575 ?auto_1428576 ) ( not ( = ?auto_1428576 ?auto_1428573 ) ) ( HOIST-AT ?auto_1428577 ?auto_1428576 ) ( not ( = ?auto_1428578 ?auto_1428577 ) ) ( AVAILABLE ?auto_1428577 ) ( SURFACE-AT ?auto_1428572 ?auto_1428576 ) ( ON ?auto_1428572 ?auto_1428574 ) ( CLEAR ?auto_1428572 ) ( not ( = ?auto_1428571 ?auto_1428574 ) ) ( not ( = ?auto_1428572 ?auto_1428574 ) ) ( not ( = ?auto_1428570 ?auto_1428574 ) ) ( ON ?auto_1428570 ?auto_1428569 ) ( not ( = ?auto_1428569 ?auto_1428570 ) ) ( not ( = ?auto_1428569 ?auto_1428571 ) ) ( not ( = ?auto_1428569 ?auto_1428572 ) ) ( not ( = ?auto_1428569 ?auto_1428574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428570 ?auto_1428571 ?auto_1428572 )
      ( MAKE-3CRATE-VERIFY ?auto_1428569 ?auto_1428570 ?auto_1428571 ?auto_1428572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428597 - SURFACE
      ?auto_1428598 - SURFACE
      ?auto_1428599 - SURFACE
      ?auto_1428600 - SURFACE
    )
    :vars
    (
      ?auto_1428605 - HOIST
      ?auto_1428603 - PLACE
      ?auto_1428602 - PLACE
      ?auto_1428601 - HOIST
      ?auto_1428604 - SURFACE
      ?auto_1428606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428605 ?auto_1428603 ) ( SURFACE-AT ?auto_1428599 ?auto_1428603 ) ( CLEAR ?auto_1428599 ) ( IS-CRATE ?auto_1428600 ) ( not ( = ?auto_1428599 ?auto_1428600 ) ) ( AVAILABLE ?auto_1428605 ) ( ON ?auto_1428599 ?auto_1428598 ) ( not ( = ?auto_1428598 ?auto_1428599 ) ) ( not ( = ?auto_1428598 ?auto_1428600 ) ) ( not ( = ?auto_1428602 ?auto_1428603 ) ) ( HOIST-AT ?auto_1428601 ?auto_1428602 ) ( not ( = ?auto_1428605 ?auto_1428601 ) ) ( AVAILABLE ?auto_1428601 ) ( SURFACE-AT ?auto_1428600 ?auto_1428602 ) ( ON ?auto_1428600 ?auto_1428604 ) ( CLEAR ?auto_1428600 ) ( not ( = ?auto_1428599 ?auto_1428604 ) ) ( not ( = ?auto_1428600 ?auto_1428604 ) ) ( not ( = ?auto_1428598 ?auto_1428604 ) ) ( TRUCK-AT ?auto_1428606 ?auto_1428603 ) ( ON ?auto_1428598 ?auto_1428597 ) ( not ( = ?auto_1428597 ?auto_1428598 ) ) ( not ( = ?auto_1428597 ?auto_1428599 ) ) ( not ( = ?auto_1428597 ?auto_1428600 ) ) ( not ( = ?auto_1428597 ?auto_1428604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428598 ?auto_1428599 ?auto_1428600 )
      ( MAKE-3CRATE-VERIFY ?auto_1428597 ?auto_1428598 ?auto_1428599 ?auto_1428600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428625 - SURFACE
      ?auto_1428626 - SURFACE
      ?auto_1428627 - SURFACE
      ?auto_1428628 - SURFACE
    )
    :vars
    (
      ?auto_1428634 - HOIST
      ?auto_1428630 - PLACE
      ?auto_1428633 - PLACE
      ?auto_1428629 - HOIST
      ?auto_1428631 - SURFACE
      ?auto_1428632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428634 ?auto_1428630 ) ( IS-CRATE ?auto_1428628 ) ( not ( = ?auto_1428627 ?auto_1428628 ) ) ( not ( = ?auto_1428626 ?auto_1428627 ) ) ( not ( = ?auto_1428626 ?auto_1428628 ) ) ( not ( = ?auto_1428633 ?auto_1428630 ) ) ( HOIST-AT ?auto_1428629 ?auto_1428633 ) ( not ( = ?auto_1428634 ?auto_1428629 ) ) ( AVAILABLE ?auto_1428629 ) ( SURFACE-AT ?auto_1428628 ?auto_1428633 ) ( ON ?auto_1428628 ?auto_1428631 ) ( CLEAR ?auto_1428628 ) ( not ( = ?auto_1428627 ?auto_1428631 ) ) ( not ( = ?auto_1428628 ?auto_1428631 ) ) ( not ( = ?auto_1428626 ?auto_1428631 ) ) ( TRUCK-AT ?auto_1428632 ?auto_1428630 ) ( SURFACE-AT ?auto_1428626 ?auto_1428630 ) ( CLEAR ?auto_1428626 ) ( LIFTING ?auto_1428634 ?auto_1428627 ) ( IS-CRATE ?auto_1428627 ) ( ON ?auto_1428626 ?auto_1428625 ) ( not ( = ?auto_1428625 ?auto_1428626 ) ) ( not ( = ?auto_1428625 ?auto_1428627 ) ) ( not ( = ?auto_1428625 ?auto_1428628 ) ) ( not ( = ?auto_1428625 ?auto_1428631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428626 ?auto_1428627 ?auto_1428628 )
      ( MAKE-3CRATE-VERIFY ?auto_1428625 ?auto_1428626 ?auto_1428627 ?auto_1428628 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428653 - SURFACE
      ?auto_1428654 - SURFACE
      ?auto_1428655 - SURFACE
      ?auto_1428656 - SURFACE
    )
    :vars
    (
      ?auto_1428661 - HOIST
      ?auto_1428662 - PLACE
      ?auto_1428657 - PLACE
      ?auto_1428660 - HOIST
      ?auto_1428659 - SURFACE
      ?auto_1428658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428661 ?auto_1428662 ) ( IS-CRATE ?auto_1428656 ) ( not ( = ?auto_1428655 ?auto_1428656 ) ) ( not ( = ?auto_1428654 ?auto_1428655 ) ) ( not ( = ?auto_1428654 ?auto_1428656 ) ) ( not ( = ?auto_1428657 ?auto_1428662 ) ) ( HOIST-AT ?auto_1428660 ?auto_1428657 ) ( not ( = ?auto_1428661 ?auto_1428660 ) ) ( AVAILABLE ?auto_1428660 ) ( SURFACE-AT ?auto_1428656 ?auto_1428657 ) ( ON ?auto_1428656 ?auto_1428659 ) ( CLEAR ?auto_1428656 ) ( not ( = ?auto_1428655 ?auto_1428659 ) ) ( not ( = ?auto_1428656 ?auto_1428659 ) ) ( not ( = ?auto_1428654 ?auto_1428659 ) ) ( TRUCK-AT ?auto_1428658 ?auto_1428662 ) ( SURFACE-AT ?auto_1428654 ?auto_1428662 ) ( CLEAR ?auto_1428654 ) ( IS-CRATE ?auto_1428655 ) ( AVAILABLE ?auto_1428661 ) ( IN ?auto_1428655 ?auto_1428658 ) ( ON ?auto_1428654 ?auto_1428653 ) ( not ( = ?auto_1428653 ?auto_1428654 ) ) ( not ( = ?auto_1428653 ?auto_1428655 ) ) ( not ( = ?auto_1428653 ?auto_1428656 ) ) ( not ( = ?auto_1428653 ?auto_1428659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428654 ?auto_1428655 ?auto_1428656 )
      ( MAKE-3CRATE-VERIFY ?auto_1428653 ?auto_1428654 ?auto_1428655 ?auto_1428656 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428944 - SURFACE
      ?auto_1428945 - SURFACE
      ?auto_1428946 - SURFACE
      ?auto_1428947 - SURFACE
      ?auto_1428948 - SURFACE
    )
    :vars
    (
      ?auto_1428949 - HOIST
      ?auto_1428950 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428949 ?auto_1428950 ) ( SURFACE-AT ?auto_1428947 ?auto_1428950 ) ( CLEAR ?auto_1428947 ) ( LIFTING ?auto_1428949 ?auto_1428948 ) ( IS-CRATE ?auto_1428948 ) ( not ( = ?auto_1428947 ?auto_1428948 ) ) ( ON ?auto_1428945 ?auto_1428944 ) ( ON ?auto_1428946 ?auto_1428945 ) ( ON ?auto_1428947 ?auto_1428946 ) ( not ( = ?auto_1428944 ?auto_1428945 ) ) ( not ( = ?auto_1428944 ?auto_1428946 ) ) ( not ( = ?auto_1428944 ?auto_1428947 ) ) ( not ( = ?auto_1428944 ?auto_1428948 ) ) ( not ( = ?auto_1428945 ?auto_1428946 ) ) ( not ( = ?auto_1428945 ?auto_1428947 ) ) ( not ( = ?auto_1428945 ?auto_1428948 ) ) ( not ( = ?auto_1428946 ?auto_1428947 ) ) ( not ( = ?auto_1428946 ?auto_1428948 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428947 ?auto_1428948 )
      ( MAKE-4CRATE-VERIFY ?auto_1428944 ?auto_1428945 ?auto_1428946 ?auto_1428947 ?auto_1428948 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428969 - SURFACE
      ?auto_1428970 - SURFACE
      ?auto_1428971 - SURFACE
      ?auto_1428972 - SURFACE
      ?auto_1428973 - SURFACE
    )
    :vars
    (
      ?auto_1428975 - HOIST
      ?auto_1428974 - PLACE
      ?auto_1428976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428975 ?auto_1428974 ) ( SURFACE-AT ?auto_1428972 ?auto_1428974 ) ( CLEAR ?auto_1428972 ) ( IS-CRATE ?auto_1428973 ) ( not ( = ?auto_1428972 ?auto_1428973 ) ) ( TRUCK-AT ?auto_1428976 ?auto_1428974 ) ( AVAILABLE ?auto_1428975 ) ( IN ?auto_1428973 ?auto_1428976 ) ( ON ?auto_1428972 ?auto_1428971 ) ( not ( = ?auto_1428971 ?auto_1428972 ) ) ( not ( = ?auto_1428971 ?auto_1428973 ) ) ( ON ?auto_1428970 ?auto_1428969 ) ( ON ?auto_1428971 ?auto_1428970 ) ( not ( = ?auto_1428969 ?auto_1428970 ) ) ( not ( = ?auto_1428969 ?auto_1428971 ) ) ( not ( = ?auto_1428969 ?auto_1428972 ) ) ( not ( = ?auto_1428969 ?auto_1428973 ) ) ( not ( = ?auto_1428970 ?auto_1428971 ) ) ( not ( = ?auto_1428970 ?auto_1428972 ) ) ( not ( = ?auto_1428970 ?auto_1428973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428971 ?auto_1428972 ?auto_1428973 )
      ( MAKE-4CRATE-VERIFY ?auto_1428969 ?auto_1428970 ?auto_1428971 ?auto_1428972 ?auto_1428973 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428999 - SURFACE
      ?auto_1429000 - SURFACE
      ?auto_1429001 - SURFACE
      ?auto_1429002 - SURFACE
      ?auto_1429003 - SURFACE
    )
    :vars
    (
      ?auto_1429004 - HOIST
      ?auto_1429006 - PLACE
      ?auto_1429007 - TRUCK
      ?auto_1429005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429004 ?auto_1429006 ) ( SURFACE-AT ?auto_1429002 ?auto_1429006 ) ( CLEAR ?auto_1429002 ) ( IS-CRATE ?auto_1429003 ) ( not ( = ?auto_1429002 ?auto_1429003 ) ) ( AVAILABLE ?auto_1429004 ) ( IN ?auto_1429003 ?auto_1429007 ) ( ON ?auto_1429002 ?auto_1429001 ) ( not ( = ?auto_1429001 ?auto_1429002 ) ) ( not ( = ?auto_1429001 ?auto_1429003 ) ) ( TRUCK-AT ?auto_1429007 ?auto_1429005 ) ( not ( = ?auto_1429005 ?auto_1429006 ) ) ( ON ?auto_1429000 ?auto_1428999 ) ( ON ?auto_1429001 ?auto_1429000 ) ( not ( = ?auto_1428999 ?auto_1429000 ) ) ( not ( = ?auto_1428999 ?auto_1429001 ) ) ( not ( = ?auto_1428999 ?auto_1429002 ) ) ( not ( = ?auto_1428999 ?auto_1429003 ) ) ( not ( = ?auto_1429000 ?auto_1429001 ) ) ( not ( = ?auto_1429000 ?auto_1429002 ) ) ( not ( = ?auto_1429000 ?auto_1429003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429001 ?auto_1429002 ?auto_1429003 )
      ( MAKE-4CRATE-VERIFY ?auto_1428999 ?auto_1429000 ?auto_1429001 ?auto_1429002 ?auto_1429003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1429033 - SURFACE
      ?auto_1429034 - SURFACE
      ?auto_1429035 - SURFACE
      ?auto_1429036 - SURFACE
      ?auto_1429037 - SURFACE
    )
    :vars
    (
      ?auto_1429041 - HOIST
      ?auto_1429042 - PLACE
      ?auto_1429040 - TRUCK
      ?auto_1429038 - PLACE
      ?auto_1429039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429041 ?auto_1429042 ) ( SURFACE-AT ?auto_1429036 ?auto_1429042 ) ( CLEAR ?auto_1429036 ) ( IS-CRATE ?auto_1429037 ) ( not ( = ?auto_1429036 ?auto_1429037 ) ) ( AVAILABLE ?auto_1429041 ) ( ON ?auto_1429036 ?auto_1429035 ) ( not ( = ?auto_1429035 ?auto_1429036 ) ) ( not ( = ?auto_1429035 ?auto_1429037 ) ) ( TRUCK-AT ?auto_1429040 ?auto_1429038 ) ( not ( = ?auto_1429038 ?auto_1429042 ) ) ( HOIST-AT ?auto_1429039 ?auto_1429038 ) ( LIFTING ?auto_1429039 ?auto_1429037 ) ( not ( = ?auto_1429041 ?auto_1429039 ) ) ( ON ?auto_1429034 ?auto_1429033 ) ( ON ?auto_1429035 ?auto_1429034 ) ( not ( = ?auto_1429033 ?auto_1429034 ) ) ( not ( = ?auto_1429033 ?auto_1429035 ) ) ( not ( = ?auto_1429033 ?auto_1429036 ) ) ( not ( = ?auto_1429033 ?auto_1429037 ) ) ( not ( = ?auto_1429034 ?auto_1429035 ) ) ( not ( = ?auto_1429034 ?auto_1429036 ) ) ( not ( = ?auto_1429034 ?auto_1429037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429035 ?auto_1429036 ?auto_1429037 )
      ( MAKE-4CRATE-VERIFY ?auto_1429033 ?auto_1429034 ?auto_1429035 ?auto_1429036 ?auto_1429037 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1429071 - SURFACE
      ?auto_1429072 - SURFACE
      ?auto_1429073 - SURFACE
      ?auto_1429074 - SURFACE
      ?auto_1429075 - SURFACE
    )
    :vars
    (
      ?auto_1429079 - HOIST
      ?auto_1429076 - PLACE
      ?auto_1429077 - TRUCK
      ?auto_1429080 - PLACE
      ?auto_1429078 - HOIST
      ?auto_1429081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429079 ?auto_1429076 ) ( SURFACE-AT ?auto_1429074 ?auto_1429076 ) ( CLEAR ?auto_1429074 ) ( IS-CRATE ?auto_1429075 ) ( not ( = ?auto_1429074 ?auto_1429075 ) ) ( AVAILABLE ?auto_1429079 ) ( ON ?auto_1429074 ?auto_1429073 ) ( not ( = ?auto_1429073 ?auto_1429074 ) ) ( not ( = ?auto_1429073 ?auto_1429075 ) ) ( TRUCK-AT ?auto_1429077 ?auto_1429080 ) ( not ( = ?auto_1429080 ?auto_1429076 ) ) ( HOIST-AT ?auto_1429078 ?auto_1429080 ) ( not ( = ?auto_1429079 ?auto_1429078 ) ) ( AVAILABLE ?auto_1429078 ) ( SURFACE-AT ?auto_1429075 ?auto_1429080 ) ( ON ?auto_1429075 ?auto_1429081 ) ( CLEAR ?auto_1429075 ) ( not ( = ?auto_1429074 ?auto_1429081 ) ) ( not ( = ?auto_1429075 ?auto_1429081 ) ) ( not ( = ?auto_1429073 ?auto_1429081 ) ) ( ON ?auto_1429072 ?auto_1429071 ) ( ON ?auto_1429073 ?auto_1429072 ) ( not ( = ?auto_1429071 ?auto_1429072 ) ) ( not ( = ?auto_1429071 ?auto_1429073 ) ) ( not ( = ?auto_1429071 ?auto_1429074 ) ) ( not ( = ?auto_1429071 ?auto_1429075 ) ) ( not ( = ?auto_1429071 ?auto_1429081 ) ) ( not ( = ?auto_1429072 ?auto_1429073 ) ) ( not ( = ?auto_1429072 ?auto_1429074 ) ) ( not ( = ?auto_1429072 ?auto_1429075 ) ) ( not ( = ?auto_1429072 ?auto_1429081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429073 ?auto_1429074 ?auto_1429075 )
      ( MAKE-4CRATE-VERIFY ?auto_1429071 ?auto_1429072 ?auto_1429073 ?auto_1429074 ?auto_1429075 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1429110 - SURFACE
      ?auto_1429111 - SURFACE
      ?auto_1429112 - SURFACE
      ?auto_1429113 - SURFACE
      ?auto_1429114 - SURFACE
    )
    :vars
    (
      ?auto_1429120 - HOIST
      ?auto_1429119 - PLACE
      ?auto_1429116 - PLACE
      ?auto_1429118 - HOIST
      ?auto_1429117 - SURFACE
      ?auto_1429115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429120 ?auto_1429119 ) ( SURFACE-AT ?auto_1429113 ?auto_1429119 ) ( CLEAR ?auto_1429113 ) ( IS-CRATE ?auto_1429114 ) ( not ( = ?auto_1429113 ?auto_1429114 ) ) ( AVAILABLE ?auto_1429120 ) ( ON ?auto_1429113 ?auto_1429112 ) ( not ( = ?auto_1429112 ?auto_1429113 ) ) ( not ( = ?auto_1429112 ?auto_1429114 ) ) ( not ( = ?auto_1429116 ?auto_1429119 ) ) ( HOIST-AT ?auto_1429118 ?auto_1429116 ) ( not ( = ?auto_1429120 ?auto_1429118 ) ) ( AVAILABLE ?auto_1429118 ) ( SURFACE-AT ?auto_1429114 ?auto_1429116 ) ( ON ?auto_1429114 ?auto_1429117 ) ( CLEAR ?auto_1429114 ) ( not ( = ?auto_1429113 ?auto_1429117 ) ) ( not ( = ?auto_1429114 ?auto_1429117 ) ) ( not ( = ?auto_1429112 ?auto_1429117 ) ) ( TRUCK-AT ?auto_1429115 ?auto_1429119 ) ( ON ?auto_1429111 ?auto_1429110 ) ( ON ?auto_1429112 ?auto_1429111 ) ( not ( = ?auto_1429110 ?auto_1429111 ) ) ( not ( = ?auto_1429110 ?auto_1429112 ) ) ( not ( = ?auto_1429110 ?auto_1429113 ) ) ( not ( = ?auto_1429110 ?auto_1429114 ) ) ( not ( = ?auto_1429110 ?auto_1429117 ) ) ( not ( = ?auto_1429111 ?auto_1429112 ) ) ( not ( = ?auto_1429111 ?auto_1429113 ) ) ( not ( = ?auto_1429111 ?auto_1429114 ) ) ( not ( = ?auto_1429111 ?auto_1429117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429112 ?auto_1429113 ?auto_1429114 )
      ( MAKE-4CRATE-VERIFY ?auto_1429110 ?auto_1429111 ?auto_1429112 ?auto_1429113 ?auto_1429114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1429149 - SURFACE
      ?auto_1429150 - SURFACE
      ?auto_1429151 - SURFACE
      ?auto_1429152 - SURFACE
      ?auto_1429153 - SURFACE
    )
    :vars
    (
      ?auto_1429157 - HOIST
      ?auto_1429159 - PLACE
      ?auto_1429155 - PLACE
      ?auto_1429156 - HOIST
      ?auto_1429154 - SURFACE
      ?auto_1429158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429157 ?auto_1429159 ) ( IS-CRATE ?auto_1429153 ) ( not ( = ?auto_1429152 ?auto_1429153 ) ) ( not ( = ?auto_1429151 ?auto_1429152 ) ) ( not ( = ?auto_1429151 ?auto_1429153 ) ) ( not ( = ?auto_1429155 ?auto_1429159 ) ) ( HOIST-AT ?auto_1429156 ?auto_1429155 ) ( not ( = ?auto_1429157 ?auto_1429156 ) ) ( AVAILABLE ?auto_1429156 ) ( SURFACE-AT ?auto_1429153 ?auto_1429155 ) ( ON ?auto_1429153 ?auto_1429154 ) ( CLEAR ?auto_1429153 ) ( not ( = ?auto_1429152 ?auto_1429154 ) ) ( not ( = ?auto_1429153 ?auto_1429154 ) ) ( not ( = ?auto_1429151 ?auto_1429154 ) ) ( TRUCK-AT ?auto_1429158 ?auto_1429159 ) ( SURFACE-AT ?auto_1429151 ?auto_1429159 ) ( CLEAR ?auto_1429151 ) ( LIFTING ?auto_1429157 ?auto_1429152 ) ( IS-CRATE ?auto_1429152 ) ( ON ?auto_1429150 ?auto_1429149 ) ( ON ?auto_1429151 ?auto_1429150 ) ( not ( = ?auto_1429149 ?auto_1429150 ) ) ( not ( = ?auto_1429149 ?auto_1429151 ) ) ( not ( = ?auto_1429149 ?auto_1429152 ) ) ( not ( = ?auto_1429149 ?auto_1429153 ) ) ( not ( = ?auto_1429149 ?auto_1429154 ) ) ( not ( = ?auto_1429150 ?auto_1429151 ) ) ( not ( = ?auto_1429150 ?auto_1429152 ) ) ( not ( = ?auto_1429150 ?auto_1429153 ) ) ( not ( = ?auto_1429150 ?auto_1429154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429151 ?auto_1429152 ?auto_1429153 )
      ( MAKE-4CRATE-VERIFY ?auto_1429149 ?auto_1429150 ?auto_1429151 ?auto_1429152 ?auto_1429153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1429188 - SURFACE
      ?auto_1429189 - SURFACE
      ?auto_1429190 - SURFACE
      ?auto_1429191 - SURFACE
      ?auto_1429192 - SURFACE
    )
    :vars
    (
      ?auto_1429193 - HOIST
      ?auto_1429197 - PLACE
      ?auto_1429195 - PLACE
      ?auto_1429194 - HOIST
      ?auto_1429196 - SURFACE
      ?auto_1429198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429193 ?auto_1429197 ) ( IS-CRATE ?auto_1429192 ) ( not ( = ?auto_1429191 ?auto_1429192 ) ) ( not ( = ?auto_1429190 ?auto_1429191 ) ) ( not ( = ?auto_1429190 ?auto_1429192 ) ) ( not ( = ?auto_1429195 ?auto_1429197 ) ) ( HOIST-AT ?auto_1429194 ?auto_1429195 ) ( not ( = ?auto_1429193 ?auto_1429194 ) ) ( AVAILABLE ?auto_1429194 ) ( SURFACE-AT ?auto_1429192 ?auto_1429195 ) ( ON ?auto_1429192 ?auto_1429196 ) ( CLEAR ?auto_1429192 ) ( not ( = ?auto_1429191 ?auto_1429196 ) ) ( not ( = ?auto_1429192 ?auto_1429196 ) ) ( not ( = ?auto_1429190 ?auto_1429196 ) ) ( TRUCK-AT ?auto_1429198 ?auto_1429197 ) ( SURFACE-AT ?auto_1429190 ?auto_1429197 ) ( CLEAR ?auto_1429190 ) ( IS-CRATE ?auto_1429191 ) ( AVAILABLE ?auto_1429193 ) ( IN ?auto_1429191 ?auto_1429198 ) ( ON ?auto_1429189 ?auto_1429188 ) ( ON ?auto_1429190 ?auto_1429189 ) ( not ( = ?auto_1429188 ?auto_1429189 ) ) ( not ( = ?auto_1429188 ?auto_1429190 ) ) ( not ( = ?auto_1429188 ?auto_1429191 ) ) ( not ( = ?auto_1429188 ?auto_1429192 ) ) ( not ( = ?auto_1429188 ?auto_1429196 ) ) ( not ( = ?auto_1429189 ?auto_1429190 ) ) ( not ( = ?auto_1429189 ?auto_1429191 ) ) ( not ( = ?auto_1429189 ?auto_1429192 ) ) ( not ( = ?auto_1429189 ?auto_1429196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429190 ?auto_1429191 ?auto_1429192 )
      ( MAKE-4CRATE-VERIFY ?auto_1429188 ?auto_1429189 ?auto_1429190 ?auto_1429191 ?auto_1429192 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1429689 - SURFACE
      ?auto_1429690 - SURFACE
    )
    :vars
    (
      ?auto_1429692 - HOIST
      ?auto_1429694 - PLACE
      ?auto_1429697 - SURFACE
      ?auto_1429696 - TRUCK
      ?auto_1429691 - PLACE
      ?auto_1429693 - HOIST
      ?auto_1429695 - SURFACE
      ?auto_1429698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429692 ?auto_1429694 ) ( SURFACE-AT ?auto_1429689 ?auto_1429694 ) ( CLEAR ?auto_1429689 ) ( IS-CRATE ?auto_1429690 ) ( not ( = ?auto_1429689 ?auto_1429690 ) ) ( AVAILABLE ?auto_1429692 ) ( ON ?auto_1429689 ?auto_1429697 ) ( not ( = ?auto_1429697 ?auto_1429689 ) ) ( not ( = ?auto_1429697 ?auto_1429690 ) ) ( TRUCK-AT ?auto_1429696 ?auto_1429691 ) ( not ( = ?auto_1429691 ?auto_1429694 ) ) ( HOIST-AT ?auto_1429693 ?auto_1429691 ) ( not ( = ?auto_1429692 ?auto_1429693 ) ) ( SURFACE-AT ?auto_1429690 ?auto_1429691 ) ( ON ?auto_1429690 ?auto_1429695 ) ( CLEAR ?auto_1429690 ) ( not ( = ?auto_1429689 ?auto_1429695 ) ) ( not ( = ?auto_1429690 ?auto_1429695 ) ) ( not ( = ?auto_1429697 ?auto_1429695 ) ) ( LIFTING ?auto_1429693 ?auto_1429698 ) ( IS-CRATE ?auto_1429698 ) ( not ( = ?auto_1429689 ?auto_1429698 ) ) ( not ( = ?auto_1429690 ?auto_1429698 ) ) ( not ( = ?auto_1429697 ?auto_1429698 ) ) ( not ( = ?auto_1429695 ?auto_1429698 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1429693 ?auto_1429698 ?auto_1429696 ?auto_1429691 )
      ( MAKE-1CRATE ?auto_1429689 ?auto_1429690 )
      ( MAKE-1CRATE-VERIFY ?auto_1429689 ?auto_1429690 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429848 - SURFACE
      ?auto_1429849 - SURFACE
      ?auto_1429850 - SURFACE
      ?auto_1429851 - SURFACE
      ?auto_1429852 - SURFACE
      ?auto_1429853 - SURFACE
    )
    :vars
    (
      ?auto_1429855 - HOIST
      ?auto_1429854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429855 ?auto_1429854 ) ( SURFACE-AT ?auto_1429852 ?auto_1429854 ) ( CLEAR ?auto_1429852 ) ( LIFTING ?auto_1429855 ?auto_1429853 ) ( IS-CRATE ?auto_1429853 ) ( not ( = ?auto_1429852 ?auto_1429853 ) ) ( ON ?auto_1429849 ?auto_1429848 ) ( ON ?auto_1429850 ?auto_1429849 ) ( ON ?auto_1429851 ?auto_1429850 ) ( ON ?auto_1429852 ?auto_1429851 ) ( not ( = ?auto_1429848 ?auto_1429849 ) ) ( not ( = ?auto_1429848 ?auto_1429850 ) ) ( not ( = ?auto_1429848 ?auto_1429851 ) ) ( not ( = ?auto_1429848 ?auto_1429852 ) ) ( not ( = ?auto_1429848 ?auto_1429853 ) ) ( not ( = ?auto_1429849 ?auto_1429850 ) ) ( not ( = ?auto_1429849 ?auto_1429851 ) ) ( not ( = ?auto_1429849 ?auto_1429852 ) ) ( not ( = ?auto_1429849 ?auto_1429853 ) ) ( not ( = ?auto_1429850 ?auto_1429851 ) ) ( not ( = ?auto_1429850 ?auto_1429852 ) ) ( not ( = ?auto_1429850 ?auto_1429853 ) ) ( not ( = ?auto_1429851 ?auto_1429852 ) ) ( not ( = ?auto_1429851 ?auto_1429853 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1429852 ?auto_1429853 )
      ( MAKE-5CRATE-VERIFY ?auto_1429848 ?auto_1429849 ?auto_1429850 ?auto_1429851 ?auto_1429852 ?auto_1429853 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429882 - SURFACE
      ?auto_1429883 - SURFACE
      ?auto_1429884 - SURFACE
      ?auto_1429885 - SURFACE
      ?auto_1429886 - SURFACE
      ?auto_1429887 - SURFACE
    )
    :vars
    (
      ?auto_1429889 - HOIST
      ?auto_1429888 - PLACE
      ?auto_1429890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429889 ?auto_1429888 ) ( SURFACE-AT ?auto_1429886 ?auto_1429888 ) ( CLEAR ?auto_1429886 ) ( IS-CRATE ?auto_1429887 ) ( not ( = ?auto_1429886 ?auto_1429887 ) ) ( TRUCK-AT ?auto_1429890 ?auto_1429888 ) ( AVAILABLE ?auto_1429889 ) ( IN ?auto_1429887 ?auto_1429890 ) ( ON ?auto_1429886 ?auto_1429885 ) ( not ( = ?auto_1429885 ?auto_1429886 ) ) ( not ( = ?auto_1429885 ?auto_1429887 ) ) ( ON ?auto_1429883 ?auto_1429882 ) ( ON ?auto_1429884 ?auto_1429883 ) ( ON ?auto_1429885 ?auto_1429884 ) ( not ( = ?auto_1429882 ?auto_1429883 ) ) ( not ( = ?auto_1429882 ?auto_1429884 ) ) ( not ( = ?auto_1429882 ?auto_1429885 ) ) ( not ( = ?auto_1429882 ?auto_1429886 ) ) ( not ( = ?auto_1429882 ?auto_1429887 ) ) ( not ( = ?auto_1429883 ?auto_1429884 ) ) ( not ( = ?auto_1429883 ?auto_1429885 ) ) ( not ( = ?auto_1429883 ?auto_1429886 ) ) ( not ( = ?auto_1429883 ?auto_1429887 ) ) ( not ( = ?auto_1429884 ?auto_1429885 ) ) ( not ( = ?auto_1429884 ?auto_1429886 ) ) ( not ( = ?auto_1429884 ?auto_1429887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429885 ?auto_1429886 ?auto_1429887 )
      ( MAKE-5CRATE-VERIFY ?auto_1429882 ?auto_1429883 ?auto_1429884 ?auto_1429885 ?auto_1429886 ?auto_1429887 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429922 - SURFACE
      ?auto_1429923 - SURFACE
      ?auto_1429924 - SURFACE
      ?auto_1429925 - SURFACE
      ?auto_1429926 - SURFACE
      ?auto_1429927 - SURFACE
    )
    :vars
    (
      ?auto_1429928 - HOIST
      ?auto_1429931 - PLACE
      ?auto_1429930 - TRUCK
      ?auto_1429929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429928 ?auto_1429931 ) ( SURFACE-AT ?auto_1429926 ?auto_1429931 ) ( CLEAR ?auto_1429926 ) ( IS-CRATE ?auto_1429927 ) ( not ( = ?auto_1429926 ?auto_1429927 ) ) ( AVAILABLE ?auto_1429928 ) ( IN ?auto_1429927 ?auto_1429930 ) ( ON ?auto_1429926 ?auto_1429925 ) ( not ( = ?auto_1429925 ?auto_1429926 ) ) ( not ( = ?auto_1429925 ?auto_1429927 ) ) ( TRUCK-AT ?auto_1429930 ?auto_1429929 ) ( not ( = ?auto_1429929 ?auto_1429931 ) ) ( ON ?auto_1429923 ?auto_1429922 ) ( ON ?auto_1429924 ?auto_1429923 ) ( ON ?auto_1429925 ?auto_1429924 ) ( not ( = ?auto_1429922 ?auto_1429923 ) ) ( not ( = ?auto_1429922 ?auto_1429924 ) ) ( not ( = ?auto_1429922 ?auto_1429925 ) ) ( not ( = ?auto_1429922 ?auto_1429926 ) ) ( not ( = ?auto_1429922 ?auto_1429927 ) ) ( not ( = ?auto_1429923 ?auto_1429924 ) ) ( not ( = ?auto_1429923 ?auto_1429925 ) ) ( not ( = ?auto_1429923 ?auto_1429926 ) ) ( not ( = ?auto_1429923 ?auto_1429927 ) ) ( not ( = ?auto_1429924 ?auto_1429925 ) ) ( not ( = ?auto_1429924 ?auto_1429926 ) ) ( not ( = ?auto_1429924 ?auto_1429927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429925 ?auto_1429926 ?auto_1429927 )
      ( MAKE-5CRATE-VERIFY ?auto_1429922 ?auto_1429923 ?auto_1429924 ?auto_1429925 ?auto_1429926 ?auto_1429927 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429967 - SURFACE
      ?auto_1429968 - SURFACE
      ?auto_1429969 - SURFACE
      ?auto_1429970 - SURFACE
      ?auto_1429971 - SURFACE
      ?auto_1429972 - SURFACE
    )
    :vars
    (
      ?auto_1429973 - HOIST
      ?auto_1429976 - PLACE
      ?auto_1429977 - TRUCK
      ?auto_1429975 - PLACE
      ?auto_1429974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429973 ?auto_1429976 ) ( SURFACE-AT ?auto_1429971 ?auto_1429976 ) ( CLEAR ?auto_1429971 ) ( IS-CRATE ?auto_1429972 ) ( not ( = ?auto_1429971 ?auto_1429972 ) ) ( AVAILABLE ?auto_1429973 ) ( ON ?auto_1429971 ?auto_1429970 ) ( not ( = ?auto_1429970 ?auto_1429971 ) ) ( not ( = ?auto_1429970 ?auto_1429972 ) ) ( TRUCK-AT ?auto_1429977 ?auto_1429975 ) ( not ( = ?auto_1429975 ?auto_1429976 ) ) ( HOIST-AT ?auto_1429974 ?auto_1429975 ) ( LIFTING ?auto_1429974 ?auto_1429972 ) ( not ( = ?auto_1429973 ?auto_1429974 ) ) ( ON ?auto_1429968 ?auto_1429967 ) ( ON ?auto_1429969 ?auto_1429968 ) ( ON ?auto_1429970 ?auto_1429969 ) ( not ( = ?auto_1429967 ?auto_1429968 ) ) ( not ( = ?auto_1429967 ?auto_1429969 ) ) ( not ( = ?auto_1429967 ?auto_1429970 ) ) ( not ( = ?auto_1429967 ?auto_1429971 ) ) ( not ( = ?auto_1429967 ?auto_1429972 ) ) ( not ( = ?auto_1429968 ?auto_1429969 ) ) ( not ( = ?auto_1429968 ?auto_1429970 ) ) ( not ( = ?auto_1429968 ?auto_1429971 ) ) ( not ( = ?auto_1429968 ?auto_1429972 ) ) ( not ( = ?auto_1429969 ?auto_1429970 ) ) ( not ( = ?auto_1429969 ?auto_1429971 ) ) ( not ( = ?auto_1429969 ?auto_1429972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429970 ?auto_1429971 ?auto_1429972 )
      ( MAKE-5CRATE-VERIFY ?auto_1429967 ?auto_1429968 ?auto_1429969 ?auto_1429970 ?auto_1429971 ?auto_1429972 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1430017 - SURFACE
      ?auto_1430018 - SURFACE
      ?auto_1430019 - SURFACE
      ?auto_1430020 - SURFACE
      ?auto_1430021 - SURFACE
      ?auto_1430022 - SURFACE
    )
    :vars
    (
      ?auto_1430025 - HOIST
      ?auto_1430028 - PLACE
      ?auto_1430027 - TRUCK
      ?auto_1430026 - PLACE
      ?auto_1430023 - HOIST
      ?auto_1430024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430025 ?auto_1430028 ) ( SURFACE-AT ?auto_1430021 ?auto_1430028 ) ( CLEAR ?auto_1430021 ) ( IS-CRATE ?auto_1430022 ) ( not ( = ?auto_1430021 ?auto_1430022 ) ) ( AVAILABLE ?auto_1430025 ) ( ON ?auto_1430021 ?auto_1430020 ) ( not ( = ?auto_1430020 ?auto_1430021 ) ) ( not ( = ?auto_1430020 ?auto_1430022 ) ) ( TRUCK-AT ?auto_1430027 ?auto_1430026 ) ( not ( = ?auto_1430026 ?auto_1430028 ) ) ( HOIST-AT ?auto_1430023 ?auto_1430026 ) ( not ( = ?auto_1430025 ?auto_1430023 ) ) ( AVAILABLE ?auto_1430023 ) ( SURFACE-AT ?auto_1430022 ?auto_1430026 ) ( ON ?auto_1430022 ?auto_1430024 ) ( CLEAR ?auto_1430022 ) ( not ( = ?auto_1430021 ?auto_1430024 ) ) ( not ( = ?auto_1430022 ?auto_1430024 ) ) ( not ( = ?auto_1430020 ?auto_1430024 ) ) ( ON ?auto_1430018 ?auto_1430017 ) ( ON ?auto_1430019 ?auto_1430018 ) ( ON ?auto_1430020 ?auto_1430019 ) ( not ( = ?auto_1430017 ?auto_1430018 ) ) ( not ( = ?auto_1430017 ?auto_1430019 ) ) ( not ( = ?auto_1430017 ?auto_1430020 ) ) ( not ( = ?auto_1430017 ?auto_1430021 ) ) ( not ( = ?auto_1430017 ?auto_1430022 ) ) ( not ( = ?auto_1430017 ?auto_1430024 ) ) ( not ( = ?auto_1430018 ?auto_1430019 ) ) ( not ( = ?auto_1430018 ?auto_1430020 ) ) ( not ( = ?auto_1430018 ?auto_1430021 ) ) ( not ( = ?auto_1430018 ?auto_1430022 ) ) ( not ( = ?auto_1430018 ?auto_1430024 ) ) ( not ( = ?auto_1430019 ?auto_1430020 ) ) ( not ( = ?auto_1430019 ?auto_1430021 ) ) ( not ( = ?auto_1430019 ?auto_1430022 ) ) ( not ( = ?auto_1430019 ?auto_1430024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430020 ?auto_1430021 ?auto_1430022 )
      ( MAKE-5CRATE-VERIFY ?auto_1430017 ?auto_1430018 ?auto_1430019 ?auto_1430020 ?auto_1430021 ?auto_1430022 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1430068 - SURFACE
      ?auto_1430069 - SURFACE
      ?auto_1430070 - SURFACE
      ?auto_1430071 - SURFACE
      ?auto_1430072 - SURFACE
      ?auto_1430073 - SURFACE
    )
    :vars
    (
      ?auto_1430079 - HOIST
      ?auto_1430074 - PLACE
      ?auto_1430077 - PLACE
      ?auto_1430075 - HOIST
      ?auto_1430078 - SURFACE
      ?auto_1430076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430079 ?auto_1430074 ) ( SURFACE-AT ?auto_1430072 ?auto_1430074 ) ( CLEAR ?auto_1430072 ) ( IS-CRATE ?auto_1430073 ) ( not ( = ?auto_1430072 ?auto_1430073 ) ) ( AVAILABLE ?auto_1430079 ) ( ON ?auto_1430072 ?auto_1430071 ) ( not ( = ?auto_1430071 ?auto_1430072 ) ) ( not ( = ?auto_1430071 ?auto_1430073 ) ) ( not ( = ?auto_1430077 ?auto_1430074 ) ) ( HOIST-AT ?auto_1430075 ?auto_1430077 ) ( not ( = ?auto_1430079 ?auto_1430075 ) ) ( AVAILABLE ?auto_1430075 ) ( SURFACE-AT ?auto_1430073 ?auto_1430077 ) ( ON ?auto_1430073 ?auto_1430078 ) ( CLEAR ?auto_1430073 ) ( not ( = ?auto_1430072 ?auto_1430078 ) ) ( not ( = ?auto_1430073 ?auto_1430078 ) ) ( not ( = ?auto_1430071 ?auto_1430078 ) ) ( TRUCK-AT ?auto_1430076 ?auto_1430074 ) ( ON ?auto_1430069 ?auto_1430068 ) ( ON ?auto_1430070 ?auto_1430069 ) ( ON ?auto_1430071 ?auto_1430070 ) ( not ( = ?auto_1430068 ?auto_1430069 ) ) ( not ( = ?auto_1430068 ?auto_1430070 ) ) ( not ( = ?auto_1430068 ?auto_1430071 ) ) ( not ( = ?auto_1430068 ?auto_1430072 ) ) ( not ( = ?auto_1430068 ?auto_1430073 ) ) ( not ( = ?auto_1430068 ?auto_1430078 ) ) ( not ( = ?auto_1430069 ?auto_1430070 ) ) ( not ( = ?auto_1430069 ?auto_1430071 ) ) ( not ( = ?auto_1430069 ?auto_1430072 ) ) ( not ( = ?auto_1430069 ?auto_1430073 ) ) ( not ( = ?auto_1430069 ?auto_1430078 ) ) ( not ( = ?auto_1430070 ?auto_1430071 ) ) ( not ( = ?auto_1430070 ?auto_1430072 ) ) ( not ( = ?auto_1430070 ?auto_1430073 ) ) ( not ( = ?auto_1430070 ?auto_1430078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430071 ?auto_1430072 ?auto_1430073 )
      ( MAKE-5CRATE-VERIFY ?auto_1430068 ?auto_1430069 ?auto_1430070 ?auto_1430071 ?auto_1430072 ?auto_1430073 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1430119 - SURFACE
      ?auto_1430120 - SURFACE
      ?auto_1430121 - SURFACE
      ?auto_1430122 - SURFACE
      ?auto_1430123 - SURFACE
      ?auto_1430124 - SURFACE
    )
    :vars
    (
      ?auto_1430130 - HOIST
      ?auto_1430128 - PLACE
      ?auto_1430127 - PLACE
      ?auto_1430129 - HOIST
      ?auto_1430125 - SURFACE
      ?auto_1430126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430130 ?auto_1430128 ) ( IS-CRATE ?auto_1430124 ) ( not ( = ?auto_1430123 ?auto_1430124 ) ) ( not ( = ?auto_1430122 ?auto_1430123 ) ) ( not ( = ?auto_1430122 ?auto_1430124 ) ) ( not ( = ?auto_1430127 ?auto_1430128 ) ) ( HOIST-AT ?auto_1430129 ?auto_1430127 ) ( not ( = ?auto_1430130 ?auto_1430129 ) ) ( AVAILABLE ?auto_1430129 ) ( SURFACE-AT ?auto_1430124 ?auto_1430127 ) ( ON ?auto_1430124 ?auto_1430125 ) ( CLEAR ?auto_1430124 ) ( not ( = ?auto_1430123 ?auto_1430125 ) ) ( not ( = ?auto_1430124 ?auto_1430125 ) ) ( not ( = ?auto_1430122 ?auto_1430125 ) ) ( TRUCK-AT ?auto_1430126 ?auto_1430128 ) ( SURFACE-AT ?auto_1430122 ?auto_1430128 ) ( CLEAR ?auto_1430122 ) ( LIFTING ?auto_1430130 ?auto_1430123 ) ( IS-CRATE ?auto_1430123 ) ( ON ?auto_1430120 ?auto_1430119 ) ( ON ?auto_1430121 ?auto_1430120 ) ( ON ?auto_1430122 ?auto_1430121 ) ( not ( = ?auto_1430119 ?auto_1430120 ) ) ( not ( = ?auto_1430119 ?auto_1430121 ) ) ( not ( = ?auto_1430119 ?auto_1430122 ) ) ( not ( = ?auto_1430119 ?auto_1430123 ) ) ( not ( = ?auto_1430119 ?auto_1430124 ) ) ( not ( = ?auto_1430119 ?auto_1430125 ) ) ( not ( = ?auto_1430120 ?auto_1430121 ) ) ( not ( = ?auto_1430120 ?auto_1430122 ) ) ( not ( = ?auto_1430120 ?auto_1430123 ) ) ( not ( = ?auto_1430120 ?auto_1430124 ) ) ( not ( = ?auto_1430120 ?auto_1430125 ) ) ( not ( = ?auto_1430121 ?auto_1430122 ) ) ( not ( = ?auto_1430121 ?auto_1430123 ) ) ( not ( = ?auto_1430121 ?auto_1430124 ) ) ( not ( = ?auto_1430121 ?auto_1430125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430122 ?auto_1430123 ?auto_1430124 )
      ( MAKE-5CRATE-VERIFY ?auto_1430119 ?auto_1430120 ?auto_1430121 ?auto_1430122 ?auto_1430123 ?auto_1430124 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1430170 - SURFACE
      ?auto_1430171 - SURFACE
      ?auto_1430172 - SURFACE
      ?auto_1430173 - SURFACE
      ?auto_1430174 - SURFACE
      ?auto_1430175 - SURFACE
    )
    :vars
    (
      ?auto_1430177 - HOIST
      ?auto_1430181 - PLACE
      ?auto_1430180 - PLACE
      ?auto_1430176 - HOIST
      ?auto_1430179 - SURFACE
      ?auto_1430178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430177 ?auto_1430181 ) ( IS-CRATE ?auto_1430175 ) ( not ( = ?auto_1430174 ?auto_1430175 ) ) ( not ( = ?auto_1430173 ?auto_1430174 ) ) ( not ( = ?auto_1430173 ?auto_1430175 ) ) ( not ( = ?auto_1430180 ?auto_1430181 ) ) ( HOIST-AT ?auto_1430176 ?auto_1430180 ) ( not ( = ?auto_1430177 ?auto_1430176 ) ) ( AVAILABLE ?auto_1430176 ) ( SURFACE-AT ?auto_1430175 ?auto_1430180 ) ( ON ?auto_1430175 ?auto_1430179 ) ( CLEAR ?auto_1430175 ) ( not ( = ?auto_1430174 ?auto_1430179 ) ) ( not ( = ?auto_1430175 ?auto_1430179 ) ) ( not ( = ?auto_1430173 ?auto_1430179 ) ) ( TRUCK-AT ?auto_1430178 ?auto_1430181 ) ( SURFACE-AT ?auto_1430173 ?auto_1430181 ) ( CLEAR ?auto_1430173 ) ( IS-CRATE ?auto_1430174 ) ( AVAILABLE ?auto_1430177 ) ( IN ?auto_1430174 ?auto_1430178 ) ( ON ?auto_1430171 ?auto_1430170 ) ( ON ?auto_1430172 ?auto_1430171 ) ( ON ?auto_1430173 ?auto_1430172 ) ( not ( = ?auto_1430170 ?auto_1430171 ) ) ( not ( = ?auto_1430170 ?auto_1430172 ) ) ( not ( = ?auto_1430170 ?auto_1430173 ) ) ( not ( = ?auto_1430170 ?auto_1430174 ) ) ( not ( = ?auto_1430170 ?auto_1430175 ) ) ( not ( = ?auto_1430170 ?auto_1430179 ) ) ( not ( = ?auto_1430171 ?auto_1430172 ) ) ( not ( = ?auto_1430171 ?auto_1430173 ) ) ( not ( = ?auto_1430171 ?auto_1430174 ) ) ( not ( = ?auto_1430171 ?auto_1430175 ) ) ( not ( = ?auto_1430171 ?auto_1430179 ) ) ( not ( = ?auto_1430172 ?auto_1430173 ) ) ( not ( = ?auto_1430172 ?auto_1430174 ) ) ( not ( = ?auto_1430172 ?auto_1430175 ) ) ( not ( = ?auto_1430172 ?auto_1430179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430173 ?auto_1430174 ?auto_1430175 )
      ( MAKE-5CRATE-VERIFY ?auto_1430170 ?auto_1430171 ?auto_1430172 ?auto_1430173 ?auto_1430174 ?auto_1430175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1431162 - SURFACE
      ?auto_1431163 - SURFACE
    )
    :vars
    (
      ?auto_1431166 - HOIST
      ?auto_1431169 - PLACE
      ?auto_1431168 - SURFACE
      ?auto_1431167 - PLACE
      ?auto_1431164 - HOIST
      ?auto_1431170 - SURFACE
      ?auto_1431165 - TRUCK
      ?auto_1431171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431166 ?auto_1431169 ) ( SURFACE-AT ?auto_1431162 ?auto_1431169 ) ( CLEAR ?auto_1431162 ) ( IS-CRATE ?auto_1431163 ) ( not ( = ?auto_1431162 ?auto_1431163 ) ) ( ON ?auto_1431162 ?auto_1431168 ) ( not ( = ?auto_1431168 ?auto_1431162 ) ) ( not ( = ?auto_1431168 ?auto_1431163 ) ) ( not ( = ?auto_1431167 ?auto_1431169 ) ) ( HOIST-AT ?auto_1431164 ?auto_1431167 ) ( not ( = ?auto_1431166 ?auto_1431164 ) ) ( AVAILABLE ?auto_1431164 ) ( SURFACE-AT ?auto_1431163 ?auto_1431167 ) ( ON ?auto_1431163 ?auto_1431170 ) ( CLEAR ?auto_1431163 ) ( not ( = ?auto_1431162 ?auto_1431170 ) ) ( not ( = ?auto_1431163 ?auto_1431170 ) ) ( not ( = ?auto_1431168 ?auto_1431170 ) ) ( TRUCK-AT ?auto_1431165 ?auto_1431169 ) ( LIFTING ?auto_1431166 ?auto_1431171 ) ( IS-CRATE ?auto_1431171 ) ( not ( = ?auto_1431162 ?auto_1431171 ) ) ( not ( = ?auto_1431163 ?auto_1431171 ) ) ( not ( = ?auto_1431168 ?auto_1431171 ) ) ( not ( = ?auto_1431170 ?auto_1431171 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1431166 ?auto_1431171 ?auto_1431165 ?auto_1431169 )
      ( MAKE-1CRATE ?auto_1431162 ?auto_1431163 )
      ( MAKE-1CRATE-VERIFY ?auto_1431162 ?auto_1431163 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431377 - SURFACE
      ?auto_1431378 - SURFACE
      ?auto_1431379 - SURFACE
      ?auto_1431380 - SURFACE
      ?auto_1431381 - SURFACE
      ?auto_1431382 - SURFACE
      ?auto_1431383 - SURFACE
    )
    :vars
    (
      ?auto_1431384 - HOIST
      ?auto_1431385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431384 ?auto_1431385 ) ( SURFACE-AT ?auto_1431382 ?auto_1431385 ) ( CLEAR ?auto_1431382 ) ( LIFTING ?auto_1431384 ?auto_1431383 ) ( IS-CRATE ?auto_1431383 ) ( not ( = ?auto_1431382 ?auto_1431383 ) ) ( ON ?auto_1431378 ?auto_1431377 ) ( ON ?auto_1431379 ?auto_1431378 ) ( ON ?auto_1431380 ?auto_1431379 ) ( ON ?auto_1431381 ?auto_1431380 ) ( ON ?auto_1431382 ?auto_1431381 ) ( not ( = ?auto_1431377 ?auto_1431378 ) ) ( not ( = ?auto_1431377 ?auto_1431379 ) ) ( not ( = ?auto_1431377 ?auto_1431380 ) ) ( not ( = ?auto_1431377 ?auto_1431381 ) ) ( not ( = ?auto_1431377 ?auto_1431382 ) ) ( not ( = ?auto_1431377 ?auto_1431383 ) ) ( not ( = ?auto_1431378 ?auto_1431379 ) ) ( not ( = ?auto_1431378 ?auto_1431380 ) ) ( not ( = ?auto_1431378 ?auto_1431381 ) ) ( not ( = ?auto_1431378 ?auto_1431382 ) ) ( not ( = ?auto_1431378 ?auto_1431383 ) ) ( not ( = ?auto_1431379 ?auto_1431380 ) ) ( not ( = ?auto_1431379 ?auto_1431381 ) ) ( not ( = ?auto_1431379 ?auto_1431382 ) ) ( not ( = ?auto_1431379 ?auto_1431383 ) ) ( not ( = ?auto_1431380 ?auto_1431381 ) ) ( not ( = ?auto_1431380 ?auto_1431382 ) ) ( not ( = ?auto_1431380 ?auto_1431383 ) ) ( not ( = ?auto_1431381 ?auto_1431382 ) ) ( not ( = ?auto_1431381 ?auto_1431383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1431382 ?auto_1431383 )
      ( MAKE-6CRATE-VERIFY ?auto_1431377 ?auto_1431378 ?auto_1431379 ?auto_1431380 ?auto_1431381 ?auto_1431382 ?auto_1431383 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431421 - SURFACE
      ?auto_1431422 - SURFACE
      ?auto_1431423 - SURFACE
      ?auto_1431424 - SURFACE
      ?auto_1431425 - SURFACE
      ?auto_1431426 - SURFACE
      ?auto_1431427 - SURFACE
    )
    :vars
    (
      ?auto_1431430 - HOIST
      ?auto_1431429 - PLACE
      ?auto_1431428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431430 ?auto_1431429 ) ( SURFACE-AT ?auto_1431426 ?auto_1431429 ) ( CLEAR ?auto_1431426 ) ( IS-CRATE ?auto_1431427 ) ( not ( = ?auto_1431426 ?auto_1431427 ) ) ( TRUCK-AT ?auto_1431428 ?auto_1431429 ) ( AVAILABLE ?auto_1431430 ) ( IN ?auto_1431427 ?auto_1431428 ) ( ON ?auto_1431426 ?auto_1431425 ) ( not ( = ?auto_1431425 ?auto_1431426 ) ) ( not ( = ?auto_1431425 ?auto_1431427 ) ) ( ON ?auto_1431422 ?auto_1431421 ) ( ON ?auto_1431423 ?auto_1431422 ) ( ON ?auto_1431424 ?auto_1431423 ) ( ON ?auto_1431425 ?auto_1431424 ) ( not ( = ?auto_1431421 ?auto_1431422 ) ) ( not ( = ?auto_1431421 ?auto_1431423 ) ) ( not ( = ?auto_1431421 ?auto_1431424 ) ) ( not ( = ?auto_1431421 ?auto_1431425 ) ) ( not ( = ?auto_1431421 ?auto_1431426 ) ) ( not ( = ?auto_1431421 ?auto_1431427 ) ) ( not ( = ?auto_1431422 ?auto_1431423 ) ) ( not ( = ?auto_1431422 ?auto_1431424 ) ) ( not ( = ?auto_1431422 ?auto_1431425 ) ) ( not ( = ?auto_1431422 ?auto_1431426 ) ) ( not ( = ?auto_1431422 ?auto_1431427 ) ) ( not ( = ?auto_1431423 ?auto_1431424 ) ) ( not ( = ?auto_1431423 ?auto_1431425 ) ) ( not ( = ?auto_1431423 ?auto_1431426 ) ) ( not ( = ?auto_1431423 ?auto_1431427 ) ) ( not ( = ?auto_1431424 ?auto_1431425 ) ) ( not ( = ?auto_1431424 ?auto_1431426 ) ) ( not ( = ?auto_1431424 ?auto_1431427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431425 ?auto_1431426 ?auto_1431427 )
      ( MAKE-6CRATE-VERIFY ?auto_1431421 ?auto_1431422 ?auto_1431423 ?auto_1431424 ?auto_1431425 ?auto_1431426 ?auto_1431427 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431472 - SURFACE
      ?auto_1431473 - SURFACE
      ?auto_1431474 - SURFACE
      ?auto_1431475 - SURFACE
      ?auto_1431476 - SURFACE
      ?auto_1431477 - SURFACE
      ?auto_1431478 - SURFACE
    )
    :vars
    (
      ?auto_1431479 - HOIST
      ?auto_1431481 - PLACE
      ?auto_1431482 - TRUCK
      ?auto_1431480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431479 ?auto_1431481 ) ( SURFACE-AT ?auto_1431477 ?auto_1431481 ) ( CLEAR ?auto_1431477 ) ( IS-CRATE ?auto_1431478 ) ( not ( = ?auto_1431477 ?auto_1431478 ) ) ( AVAILABLE ?auto_1431479 ) ( IN ?auto_1431478 ?auto_1431482 ) ( ON ?auto_1431477 ?auto_1431476 ) ( not ( = ?auto_1431476 ?auto_1431477 ) ) ( not ( = ?auto_1431476 ?auto_1431478 ) ) ( TRUCK-AT ?auto_1431482 ?auto_1431480 ) ( not ( = ?auto_1431480 ?auto_1431481 ) ) ( ON ?auto_1431473 ?auto_1431472 ) ( ON ?auto_1431474 ?auto_1431473 ) ( ON ?auto_1431475 ?auto_1431474 ) ( ON ?auto_1431476 ?auto_1431475 ) ( not ( = ?auto_1431472 ?auto_1431473 ) ) ( not ( = ?auto_1431472 ?auto_1431474 ) ) ( not ( = ?auto_1431472 ?auto_1431475 ) ) ( not ( = ?auto_1431472 ?auto_1431476 ) ) ( not ( = ?auto_1431472 ?auto_1431477 ) ) ( not ( = ?auto_1431472 ?auto_1431478 ) ) ( not ( = ?auto_1431473 ?auto_1431474 ) ) ( not ( = ?auto_1431473 ?auto_1431475 ) ) ( not ( = ?auto_1431473 ?auto_1431476 ) ) ( not ( = ?auto_1431473 ?auto_1431477 ) ) ( not ( = ?auto_1431473 ?auto_1431478 ) ) ( not ( = ?auto_1431474 ?auto_1431475 ) ) ( not ( = ?auto_1431474 ?auto_1431476 ) ) ( not ( = ?auto_1431474 ?auto_1431477 ) ) ( not ( = ?auto_1431474 ?auto_1431478 ) ) ( not ( = ?auto_1431475 ?auto_1431476 ) ) ( not ( = ?auto_1431475 ?auto_1431477 ) ) ( not ( = ?auto_1431475 ?auto_1431478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431476 ?auto_1431477 ?auto_1431478 )
      ( MAKE-6CRATE-VERIFY ?auto_1431472 ?auto_1431473 ?auto_1431474 ?auto_1431475 ?auto_1431476 ?auto_1431477 ?auto_1431478 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431529 - SURFACE
      ?auto_1431530 - SURFACE
      ?auto_1431531 - SURFACE
      ?auto_1431532 - SURFACE
      ?auto_1431533 - SURFACE
      ?auto_1431534 - SURFACE
      ?auto_1431535 - SURFACE
    )
    :vars
    (
      ?auto_1431539 - HOIST
      ?auto_1431537 - PLACE
      ?auto_1431540 - TRUCK
      ?auto_1431536 - PLACE
      ?auto_1431538 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431539 ?auto_1431537 ) ( SURFACE-AT ?auto_1431534 ?auto_1431537 ) ( CLEAR ?auto_1431534 ) ( IS-CRATE ?auto_1431535 ) ( not ( = ?auto_1431534 ?auto_1431535 ) ) ( AVAILABLE ?auto_1431539 ) ( ON ?auto_1431534 ?auto_1431533 ) ( not ( = ?auto_1431533 ?auto_1431534 ) ) ( not ( = ?auto_1431533 ?auto_1431535 ) ) ( TRUCK-AT ?auto_1431540 ?auto_1431536 ) ( not ( = ?auto_1431536 ?auto_1431537 ) ) ( HOIST-AT ?auto_1431538 ?auto_1431536 ) ( LIFTING ?auto_1431538 ?auto_1431535 ) ( not ( = ?auto_1431539 ?auto_1431538 ) ) ( ON ?auto_1431530 ?auto_1431529 ) ( ON ?auto_1431531 ?auto_1431530 ) ( ON ?auto_1431532 ?auto_1431531 ) ( ON ?auto_1431533 ?auto_1431532 ) ( not ( = ?auto_1431529 ?auto_1431530 ) ) ( not ( = ?auto_1431529 ?auto_1431531 ) ) ( not ( = ?auto_1431529 ?auto_1431532 ) ) ( not ( = ?auto_1431529 ?auto_1431533 ) ) ( not ( = ?auto_1431529 ?auto_1431534 ) ) ( not ( = ?auto_1431529 ?auto_1431535 ) ) ( not ( = ?auto_1431530 ?auto_1431531 ) ) ( not ( = ?auto_1431530 ?auto_1431532 ) ) ( not ( = ?auto_1431530 ?auto_1431533 ) ) ( not ( = ?auto_1431530 ?auto_1431534 ) ) ( not ( = ?auto_1431530 ?auto_1431535 ) ) ( not ( = ?auto_1431531 ?auto_1431532 ) ) ( not ( = ?auto_1431531 ?auto_1431533 ) ) ( not ( = ?auto_1431531 ?auto_1431534 ) ) ( not ( = ?auto_1431531 ?auto_1431535 ) ) ( not ( = ?auto_1431532 ?auto_1431533 ) ) ( not ( = ?auto_1431532 ?auto_1431534 ) ) ( not ( = ?auto_1431532 ?auto_1431535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431533 ?auto_1431534 ?auto_1431535 )
      ( MAKE-6CRATE-VERIFY ?auto_1431529 ?auto_1431530 ?auto_1431531 ?auto_1431532 ?auto_1431533 ?auto_1431534 ?auto_1431535 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431592 - SURFACE
      ?auto_1431593 - SURFACE
      ?auto_1431594 - SURFACE
      ?auto_1431595 - SURFACE
      ?auto_1431596 - SURFACE
      ?auto_1431597 - SURFACE
      ?auto_1431598 - SURFACE
    )
    :vars
    (
      ?auto_1431604 - HOIST
      ?auto_1431601 - PLACE
      ?auto_1431600 - TRUCK
      ?auto_1431599 - PLACE
      ?auto_1431603 - HOIST
      ?auto_1431602 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431604 ?auto_1431601 ) ( SURFACE-AT ?auto_1431597 ?auto_1431601 ) ( CLEAR ?auto_1431597 ) ( IS-CRATE ?auto_1431598 ) ( not ( = ?auto_1431597 ?auto_1431598 ) ) ( AVAILABLE ?auto_1431604 ) ( ON ?auto_1431597 ?auto_1431596 ) ( not ( = ?auto_1431596 ?auto_1431597 ) ) ( not ( = ?auto_1431596 ?auto_1431598 ) ) ( TRUCK-AT ?auto_1431600 ?auto_1431599 ) ( not ( = ?auto_1431599 ?auto_1431601 ) ) ( HOIST-AT ?auto_1431603 ?auto_1431599 ) ( not ( = ?auto_1431604 ?auto_1431603 ) ) ( AVAILABLE ?auto_1431603 ) ( SURFACE-AT ?auto_1431598 ?auto_1431599 ) ( ON ?auto_1431598 ?auto_1431602 ) ( CLEAR ?auto_1431598 ) ( not ( = ?auto_1431597 ?auto_1431602 ) ) ( not ( = ?auto_1431598 ?auto_1431602 ) ) ( not ( = ?auto_1431596 ?auto_1431602 ) ) ( ON ?auto_1431593 ?auto_1431592 ) ( ON ?auto_1431594 ?auto_1431593 ) ( ON ?auto_1431595 ?auto_1431594 ) ( ON ?auto_1431596 ?auto_1431595 ) ( not ( = ?auto_1431592 ?auto_1431593 ) ) ( not ( = ?auto_1431592 ?auto_1431594 ) ) ( not ( = ?auto_1431592 ?auto_1431595 ) ) ( not ( = ?auto_1431592 ?auto_1431596 ) ) ( not ( = ?auto_1431592 ?auto_1431597 ) ) ( not ( = ?auto_1431592 ?auto_1431598 ) ) ( not ( = ?auto_1431592 ?auto_1431602 ) ) ( not ( = ?auto_1431593 ?auto_1431594 ) ) ( not ( = ?auto_1431593 ?auto_1431595 ) ) ( not ( = ?auto_1431593 ?auto_1431596 ) ) ( not ( = ?auto_1431593 ?auto_1431597 ) ) ( not ( = ?auto_1431593 ?auto_1431598 ) ) ( not ( = ?auto_1431593 ?auto_1431602 ) ) ( not ( = ?auto_1431594 ?auto_1431595 ) ) ( not ( = ?auto_1431594 ?auto_1431596 ) ) ( not ( = ?auto_1431594 ?auto_1431597 ) ) ( not ( = ?auto_1431594 ?auto_1431598 ) ) ( not ( = ?auto_1431594 ?auto_1431602 ) ) ( not ( = ?auto_1431595 ?auto_1431596 ) ) ( not ( = ?auto_1431595 ?auto_1431597 ) ) ( not ( = ?auto_1431595 ?auto_1431598 ) ) ( not ( = ?auto_1431595 ?auto_1431602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431596 ?auto_1431597 ?auto_1431598 )
      ( MAKE-6CRATE-VERIFY ?auto_1431592 ?auto_1431593 ?auto_1431594 ?auto_1431595 ?auto_1431596 ?auto_1431597 ?auto_1431598 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431656 - SURFACE
      ?auto_1431657 - SURFACE
      ?auto_1431658 - SURFACE
      ?auto_1431659 - SURFACE
      ?auto_1431660 - SURFACE
      ?auto_1431661 - SURFACE
      ?auto_1431662 - SURFACE
    )
    :vars
    (
      ?auto_1431665 - HOIST
      ?auto_1431666 - PLACE
      ?auto_1431668 - PLACE
      ?auto_1431663 - HOIST
      ?auto_1431667 - SURFACE
      ?auto_1431664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431665 ?auto_1431666 ) ( SURFACE-AT ?auto_1431661 ?auto_1431666 ) ( CLEAR ?auto_1431661 ) ( IS-CRATE ?auto_1431662 ) ( not ( = ?auto_1431661 ?auto_1431662 ) ) ( AVAILABLE ?auto_1431665 ) ( ON ?auto_1431661 ?auto_1431660 ) ( not ( = ?auto_1431660 ?auto_1431661 ) ) ( not ( = ?auto_1431660 ?auto_1431662 ) ) ( not ( = ?auto_1431668 ?auto_1431666 ) ) ( HOIST-AT ?auto_1431663 ?auto_1431668 ) ( not ( = ?auto_1431665 ?auto_1431663 ) ) ( AVAILABLE ?auto_1431663 ) ( SURFACE-AT ?auto_1431662 ?auto_1431668 ) ( ON ?auto_1431662 ?auto_1431667 ) ( CLEAR ?auto_1431662 ) ( not ( = ?auto_1431661 ?auto_1431667 ) ) ( not ( = ?auto_1431662 ?auto_1431667 ) ) ( not ( = ?auto_1431660 ?auto_1431667 ) ) ( TRUCK-AT ?auto_1431664 ?auto_1431666 ) ( ON ?auto_1431657 ?auto_1431656 ) ( ON ?auto_1431658 ?auto_1431657 ) ( ON ?auto_1431659 ?auto_1431658 ) ( ON ?auto_1431660 ?auto_1431659 ) ( not ( = ?auto_1431656 ?auto_1431657 ) ) ( not ( = ?auto_1431656 ?auto_1431658 ) ) ( not ( = ?auto_1431656 ?auto_1431659 ) ) ( not ( = ?auto_1431656 ?auto_1431660 ) ) ( not ( = ?auto_1431656 ?auto_1431661 ) ) ( not ( = ?auto_1431656 ?auto_1431662 ) ) ( not ( = ?auto_1431656 ?auto_1431667 ) ) ( not ( = ?auto_1431657 ?auto_1431658 ) ) ( not ( = ?auto_1431657 ?auto_1431659 ) ) ( not ( = ?auto_1431657 ?auto_1431660 ) ) ( not ( = ?auto_1431657 ?auto_1431661 ) ) ( not ( = ?auto_1431657 ?auto_1431662 ) ) ( not ( = ?auto_1431657 ?auto_1431667 ) ) ( not ( = ?auto_1431658 ?auto_1431659 ) ) ( not ( = ?auto_1431658 ?auto_1431660 ) ) ( not ( = ?auto_1431658 ?auto_1431661 ) ) ( not ( = ?auto_1431658 ?auto_1431662 ) ) ( not ( = ?auto_1431658 ?auto_1431667 ) ) ( not ( = ?auto_1431659 ?auto_1431660 ) ) ( not ( = ?auto_1431659 ?auto_1431661 ) ) ( not ( = ?auto_1431659 ?auto_1431662 ) ) ( not ( = ?auto_1431659 ?auto_1431667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431660 ?auto_1431661 ?auto_1431662 )
      ( MAKE-6CRATE-VERIFY ?auto_1431656 ?auto_1431657 ?auto_1431658 ?auto_1431659 ?auto_1431660 ?auto_1431661 ?auto_1431662 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431720 - SURFACE
      ?auto_1431721 - SURFACE
      ?auto_1431722 - SURFACE
      ?auto_1431723 - SURFACE
      ?auto_1431724 - SURFACE
      ?auto_1431725 - SURFACE
      ?auto_1431726 - SURFACE
    )
    :vars
    (
      ?auto_1431728 - HOIST
      ?auto_1431729 - PLACE
      ?auto_1431727 - PLACE
      ?auto_1431731 - HOIST
      ?auto_1431730 - SURFACE
      ?auto_1431732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431728 ?auto_1431729 ) ( IS-CRATE ?auto_1431726 ) ( not ( = ?auto_1431725 ?auto_1431726 ) ) ( not ( = ?auto_1431724 ?auto_1431725 ) ) ( not ( = ?auto_1431724 ?auto_1431726 ) ) ( not ( = ?auto_1431727 ?auto_1431729 ) ) ( HOIST-AT ?auto_1431731 ?auto_1431727 ) ( not ( = ?auto_1431728 ?auto_1431731 ) ) ( AVAILABLE ?auto_1431731 ) ( SURFACE-AT ?auto_1431726 ?auto_1431727 ) ( ON ?auto_1431726 ?auto_1431730 ) ( CLEAR ?auto_1431726 ) ( not ( = ?auto_1431725 ?auto_1431730 ) ) ( not ( = ?auto_1431726 ?auto_1431730 ) ) ( not ( = ?auto_1431724 ?auto_1431730 ) ) ( TRUCK-AT ?auto_1431732 ?auto_1431729 ) ( SURFACE-AT ?auto_1431724 ?auto_1431729 ) ( CLEAR ?auto_1431724 ) ( LIFTING ?auto_1431728 ?auto_1431725 ) ( IS-CRATE ?auto_1431725 ) ( ON ?auto_1431721 ?auto_1431720 ) ( ON ?auto_1431722 ?auto_1431721 ) ( ON ?auto_1431723 ?auto_1431722 ) ( ON ?auto_1431724 ?auto_1431723 ) ( not ( = ?auto_1431720 ?auto_1431721 ) ) ( not ( = ?auto_1431720 ?auto_1431722 ) ) ( not ( = ?auto_1431720 ?auto_1431723 ) ) ( not ( = ?auto_1431720 ?auto_1431724 ) ) ( not ( = ?auto_1431720 ?auto_1431725 ) ) ( not ( = ?auto_1431720 ?auto_1431726 ) ) ( not ( = ?auto_1431720 ?auto_1431730 ) ) ( not ( = ?auto_1431721 ?auto_1431722 ) ) ( not ( = ?auto_1431721 ?auto_1431723 ) ) ( not ( = ?auto_1431721 ?auto_1431724 ) ) ( not ( = ?auto_1431721 ?auto_1431725 ) ) ( not ( = ?auto_1431721 ?auto_1431726 ) ) ( not ( = ?auto_1431721 ?auto_1431730 ) ) ( not ( = ?auto_1431722 ?auto_1431723 ) ) ( not ( = ?auto_1431722 ?auto_1431724 ) ) ( not ( = ?auto_1431722 ?auto_1431725 ) ) ( not ( = ?auto_1431722 ?auto_1431726 ) ) ( not ( = ?auto_1431722 ?auto_1431730 ) ) ( not ( = ?auto_1431723 ?auto_1431724 ) ) ( not ( = ?auto_1431723 ?auto_1431725 ) ) ( not ( = ?auto_1431723 ?auto_1431726 ) ) ( not ( = ?auto_1431723 ?auto_1431730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431724 ?auto_1431725 ?auto_1431726 )
      ( MAKE-6CRATE-VERIFY ?auto_1431720 ?auto_1431721 ?auto_1431722 ?auto_1431723 ?auto_1431724 ?auto_1431725 ?auto_1431726 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431784 - SURFACE
      ?auto_1431785 - SURFACE
      ?auto_1431786 - SURFACE
      ?auto_1431787 - SURFACE
      ?auto_1431788 - SURFACE
      ?auto_1431789 - SURFACE
      ?auto_1431790 - SURFACE
    )
    :vars
    (
      ?auto_1431795 - HOIST
      ?auto_1431794 - PLACE
      ?auto_1431791 - PLACE
      ?auto_1431793 - HOIST
      ?auto_1431796 - SURFACE
      ?auto_1431792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431795 ?auto_1431794 ) ( IS-CRATE ?auto_1431790 ) ( not ( = ?auto_1431789 ?auto_1431790 ) ) ( not ( = ?auto_1431788 ?auto_1431789 ) ) ( not ( = ?auto_1431788 ?auto_1431790 ) ) ( not ( = ?auto_1431791 ?auto_1431794 ) ) ( HOIST-AT ?auto_1431793 ?auto_1431791 ) ( not ( = ?auto_1431795 ?auto_1431793 ) ) ( AVAILABLE ?auto_1431793 ) ( SURFACE-AT ?auto_1431790 ?auto_1431791 ) ( ON ?auto_1431790 ?auto_1431796 ) ( CLEAR ?auto_1431790 ) ( not ( = ?auto_1431789 ?auto_1431796 ) ) ( not ( = ?auto_1431790 ?auto_1431796 ) ) ( not ( = ?auto_1431788 ?auto_1431796 ) ) ( TRUCK-AT ?auto_1431792 ?auto_1431794 ) ( SURFACE-AT ?auto_1431788 ?auto_1431794 ) ( CLEAR ?auto_1431788 ) ( IS-CRATE ?auto_1431789 ) ( AVAILABLE ?auto_1431795 ) ( IN ?auto_1431789 ?auto_1431792 ) ( ON ?auto_1431785 ?auto_1431784 ) ( ON ?auto_1431786 ?auto_1431785 ) ( ON ?auto_1431787 ?auto_1431786 ) ( ON ?auto_1431788 ?auto_1431787 ) ( not ( = ?auto_1431784 ?auto_1431785 ) ) ( not ( = ?auto_1431784 ?auto_1431786 ) ) ( not ( = ?auto_1431784 ?auto_1431787 ) ) ( not ( = ?auto_1431784 ?auto_1431788 ) ) ( not ( = ?auto_1431784 ?auto_1431789 ) ) ( not ( = ?auto_1431784 ?auto_1431790 ) ) ( not ( = ?auto_1431784 ?auto_1431796 ) ) ( not ( = ?auto_1431785 ?auto_1431786 ) ) ( not ( = ?auto_1431785 ?auto_1431787 ) ) ( not ( = ?auto_1431785 ?auto_1431788 ) ) ( not ( = ?auto_1431785 ?auto_1431789 ) ) ( not ( = ?auto_1431785 ?auto_1431790 ) ) ( not ( = ?auto_1431785 ?auto_1431796 ) ) ( not ( = ?auto_1431786 ?auto_1431787 ) ) ( not ( = ?auto_1431786 ?auto_1431788 ) ) ( not ( = ?auto_1431786 ?auto_1431789 ) ) ( not ( = ?auto_1431786 ?auto_1431790 ) ) ( not ( = ?auto_1431786 ?auto_1431796 ) ) ( not ( = ?auto_1431787 ?auto_1431788 ) ) ( not ( = ?auto_1431787 ?auto_1431789 ) ) ( not ( = ?auto_1431787 ?auto_1431790 ) ) ( not ( = ?auto_1431787 ?auto_1431796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431788 ?auto_1431789 ?auto_1431790 )
      ( MAKE-6CRATE-VERIFY ?auto_1431784 ?auto_1431785 ?auto_1431786 ?auto_1431787 ?auto_1431788 ?auto_1431789 ?auto_1431790 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433740 - SURFACE
      ?auto_1433741 - SURFACE
      ?auto_1433742 - SURFACE
      ?auto_1433743 - SURFACE
      ?auto_1433744 - SURFACE
      ?auto_1433745 - SURFACE
      ?auto_1433746 - SURFACE
      ?auto_1433747 - SURFACE
    )
    :vars
    (
      ?auto_1433749 - HOIST
      ?auto_1433748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433749 ?auto_1433748 ) ( SURFACE-AT ?auto_1433746 ?auto_1433748 ) ( CLEAR ?auto_1433746 ) ( LIFTING ?auto_1433749 ?auto_1433747 ) ( IS-CRATE ?auto_1433747 ) ( not ( = ?auto_1433746 ?auto_1433747 ) ) ( ON ?auto_1433741 ?auto_1433740 ) ( ON ?auto_1433742 ?auto_1433741 ) ( ON ?auto_1433743 ?auto_1433742 ) ( ON ?auto_1433744 ?auto_1433743 ) ( ON ?auto_1433745 ?auto_1433744 ) ( ON ?auto_1433746 ?auto_1433745 ) ( not ( = ?auto_1433740 ?auto_1433741 ) ) ( not ( = ?auto_1433740 ?auto_1433742 ) ) ( not ( = ?auto_1433740 ?auto_1433743 ) ) ( not ( = ?auto_1433740 ?auto_1433744 ) ) ( not ( = ?auto_1433740 ?auto_1433745 ) ) ( not ( = ?auto_1433740 ?auto_1433746 ) ) ( not ( = ?auto_1433740 ?auto_1433747 ) ) ( not ( = ?auto_1433741 ?auto_1433742 ) ) ( not ( = ?auto_1433741 ?auto_1433743 ) ) ( not ( = ?auto_1433741 ?auto_1433744 ) ) ( not ( = ?auto_1433741 ?auto_1433745 ) ) ( not ( = ?auto_1433741 ?auto_1433746 ) ) ( not ( = ?auto_1433741 ?auto_1433747 ) ) ( not ( = ?auto_1433742 ?auto_1433743 ) ) ( not ( = ?auto_1433742 ?auto_1433744 ) ) ( not ( = ?auto_1433742 ?auto_1433745 ) ) ( not ( = ?auto_1433742 ?auto_1433746 ) ) ( not ( = ?auto_1433742 ?auto_1433747 ) ) ( not ( = ?auto_1433743 ?auto_1433744 ) ) ( not ( = ?auto_1433743 ?auto_1433745 ) ) ( not ( = ?auto_1433743 ?auto_1433746 ) ) ( not ( = ?auto_1433743 ?auto_1433747 ) ) ( not ( = ?auto_1433744 ?auto_1433745 ) ) ( not ( = ?auto_1433744 ?auto_1433746 ) ) ( not ( = ?auto_1433744 ?auto_1433747 ) ) ( not ( = ?auto_1433745 ?auto_1433746 ) ) ( not ( = ?auto_1433745 ?auto_1433747 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1433746 ?auto_1433747 )
      ( MAKE-7CRATE-VERIFY ?auto_1433740 ?auto_1433741 ?auto_1433742 ?auto_1433743 ?auto_1433744 ?auto_1433745 ?auto_1433746 ?auto_1433747 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433795 - SURFACE
      ?auto_1433796 - SURFACE
      ?auto_1433797 - SURFACE
      ?auto_1433798 - SURFACE
      ?auto_1433799 - SURFACE
      ?auto_1433800 - SURFACE
      ?auto_1433801 - SURFACE
      ?auto_1433802 - SURFACE
    )
    :vars
    (
      ?auto_1433804 - HOIST
      ?auto_1433805 - PLACE
      ?auto_1433803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433804 ?auto_1433805 ) ( SURFACE-AT ?auto_1433801 ?auto_1433805 ) ( CLEAR ?auto_1433801 ) ( IS-CRATE ?auto_1433802 ) ( not ( = ?auto_1433801 ?auto_1433802 ) ) ( TRUCK-AT ?auto_1433803 ?auto_1433805 ) ( AVAILABLE ?auto_1433804 ) ( IN ?auto_1433802 ?auto_1433803 ) ( ON ?auto_1433801 ?auto_1433800 ) ( not ( = ?auto_1433800 ?auto_1433801 ) ) ( not ( = ?auto_1433800 ?auto_1433802 ) ) ( ON ?auto_1433796 ?auto_1433795 ) ( ON ?auto_1433797 ?auto_1433796 ) ( ON ?auto_1433798 ?auto_1433797 ) ( ON ?auto_1433799 ?auto_1433798 ) ( ON ?auto_1433800 ?auto_1433799 ) ( not ( = ?auto_1433795 ?auto_1433796 ) ) ( not ( = ?auto_1433795 ?auto_1433797 ) ) ( not ( = ?auto_1433795 ?auto_1433798 ) ) ( not ( = ?auto_1433795 ?auto_1433799 ) ) ( not ( = ?auto_1433795 ?auto_1433800 ) ) ( not ( = ?auto_1433795 ?auto_1433801 ) ) ( not ( = ?auto_1433795 ?auto_1433802 ) ) ( not ( = ?auto_1433796 ?auto_1433797 ) ) ( not ( = ?auto_1433796 ?auto_1433798 ) ) ( not ( = ?auto_1433796 ?auto_1433799 ) ) ( not ( = ?auto_1433796 ?auto_1433800 ) ) ( not ( = ?auto_1433796 ?auto_1433801 ) ) ( not ( = ?auto_1433796 ?auto_1433802 ) ) ( not ( = ?auto_1433797 ?auto_1433798 ) ) ( not ( = ?auto_1433797 ?auto_1433799 ) ) ( not ( = ?auto_1433797 ?auto_1433800 ) ) ( not ( = ?auto_1433797 ?auto_1433801 ) ) ( not ( = ?auto_1433797 ?auto_1433802 ) ) ( not ( = ?auto_1433798 ?auto_1433799 ) ) ( not ( = ?auto_1433798 ?auto_1433800 ) ) ( not ( = ?auto_1433798 ?auto_1433801 ) ) ( not ( = ?auto_1433798 ?auto_1433802 ) ) ( not ( = ?auto_1433799 ?auto_1433800 ) ) ( not ( = ?auto_1433799 ?auto_1433801 ) ) ( not ( = ?auto_1433799 ?auto_1433802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433800 ?auto_1433801 ?auto_1433802 )
      ( MAKE-7CRATE-VERIFY ?auto_1433795 ?auto_1433796 ?auto_1433797 ?auto_1433798 ?auto_1433799 ?auto_1433800 ?auto_1433801 ?auto_1433802 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433858 - SURFACE
      ?auto_1433859 - SURFACE
      ?auto_1433860 - SURFACE
      ?auto_1433861 - SURFACE
      ?auto_1433862 - SURFACE
      ?auto_1433863 - SURFACE
      ?auto_1433864 - SURFACE
      ?auto_1433865 - SURFACE
    )
    :vars
    (
      ?auto_1433869 - HOIST
      ?auto_1433868 - PLACE
      ?auto_1433867 - TRUCK
      ?auto_1433866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433869 ?auto_1433868 ) ( SURFACE-AT ?auto_1433864 ?auto_1433868 ) ( CLEAR ?auto_1433864 ) ( IS-CRATE ?auto_1433865 ) ( not ( = ?auto_1433864 ?auto_1433865 ) ) ( AVAILABLE ?auto_1433869 ) ( IN ?auto_1433865 ?auto_1433867 ) ( ON ?auto_1433864 ?auto_1433863 ) ( not ( = ?auto_1433863 ?auto_1433864 ) ) ( not ( = ?auto_1433863 ?auto_1433865 ) ) ( TRUCK-AT ?auto_1433867 ?auto_1433866 ) ( not ( = ?auto_1433866 ?auto_1433868 ) ) ( ON ?auto_1433859 ?auto_1433858 ) ( ON ?auto_1433860 ?auto_1433859 ) ( ON ?auto_1433861 ?auto_1433860 ) ( ON ?auto_1433862 ?auto_1433861 ) ( ON ?auto_1433863 ?auto_1433862 ) ( not ( = ?auto_1433858 ?auto_1433859 ) ) ( not ( = ?auto_1433858 ?auto_1433860 ) ) ( not ( = ?auto_1433858 ?auto_1433861 ) ) ( not ( = ?auto_1433858 ?auto_1433862 ) ) ( not ( = ?auto_1433858 ?auto_1433863 ) ) ( not ( = ?auto_1433858 ?auto_1433864 ) ) ( not ( = ?auto_1433858 ?auto_1433865 ) ) ( not ( = ?auto_1433859 ?auto_1433860 ) ) ( not ( = ?auto_1433859 ?auto_1433861 ) ) ( not ( = ?auto_1433859 ?auto_1433862 ) ) ( not ( = ?auto_1433859 ?auto_1433863 ) ) ( not ( = ?auto_1433859 ?auto_1433864 ) ) ( not ( = ?auto_1433859 ?auto_1433865 ) ) ( not ( = ?auto_1433860 ?auto_1433861 ) ) ( not ( = ?auto_1433860 ?auto_1433862 ) ) ( not ( = ?auto_1433860 ?auto_1433863 ) ) ( not ( = ?auto_1433860 ?auto_1433864 ) ) ( not ( = ?auto_1433860 ?auto_1433865 ) ) ( not ( = ?auto_1433861 ?auto_1433862 ) ) ( not ( = ?auto_1433861 ?auto_1433863 ) ) ( not ( = ?auto_1433861 ?auto_1433864 ) ) ( not ( = ?auto_1433861 ?auto_1433865 ) ) ( not ( = ?auto_1433862 ?auto_1433863 ) ) ( not ( = ?auto_1433862 ?auto_1433864 ) ) ( not ( = ?auto_1433862 ?auto_1433865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433863 ?auto_1433864 ?auto_1433865 )
      ( MAKE-7CRATE-VERIFY ?auto_1433858 ?auto_1433859 ?auto_1433860 ?auto_1433861 ?auto_1433862 ?auto_1433863 ?auto_1433864 ?auto_1433865 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433928 - SURFACE
      ?auto_1433929 - SURFACE
      ?auto_1433930 - SURFACE
      ?auto_1433931 - SURFACE
      ?auto_1433932 - SURFACE
      ?auto_1433933 - SURFACE
      ?auto_1433934 - SURFACE
      ?auto_1433935 - SURFACE
    )
    :vars
    (
      ?auto_1433940 - HOIST
      ?auto_1433937 - PLACE
      ?auto_1433939 - TRUCK
      ?auto_1433936 - PLACE
      ?auto_1433938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433940 ?auto_1433937 ) ( SURFACE-AT ?auto_1433934 ?auto_1433937 ) ( CLEAR ?auto_1433934 ) ( IS-CRATE ?auto_1433935 ) ( not ( = ?auto_1433934 ?auto_1433935 ) ) ( AVAILABLE ?auto_1433940 ) ( ON ?auto_1433934 ?auto_1433933 ) ( not ( = ?auto_1433933 ?auto_1433934 ) ) ( not ( = ?auto_1433933 ?auto_1433935 ) ) ( TRUCK-AT ?auto_1433939 ?auto_1433936 ) ( not ( = ?auto_1433936 ?auto_1433937 ) ) ( HOIST-AT ?auto_1433938 ?auto_1433936 ) ( LIFTING ?auto_1433938 ?auto_1433935 ) ( not ( = ?auto_1433940 ?auto_1433938 ) ) ( ON ?auto_1433929 ?auto_1433928 ) ( ON ?auto_1433930 ?auto_1433929 ) ( ON ?auto_1433931 ?auto_1433930 ) ( ON ?auto_1433932 ?auto_1433931 ) ( ON ?auto_1433933 ?auto_1433932 ) ( not ( = ?auto_1433928 ?auto_1433929 ) ) ( not ( = ?auto_1433928 ?auto_1433930 ) ) ( not ( = ?auto_1433928 ?auto_1433931 ) ) ( not ( = ?auto_1433928 ?auto_1433932 ) ) ( not ( = ?auto_1433928 ?auto_1433933 ) ) ( not ( = ?auto_1433928 ?auto_1433934 ) ) ( not ( = ?auto_1433928 ?auto_1433935 ) ) ( not ( = ?auto_1433929 ?auto_1433930 ) ) ( not ( = ?auto_1433929 ?auto_1433931 ) ) ( not ( = ?auto_1433929 ?auto_1433932 ) ) ( not ( = ?auto_1433929 ?auto_1433933 ) ) ( not ( = ?auto_1433929 ?auto_1433934 ) ) ( not ( = ?auto_1433929 ?auto_1433935 ) ) ( not ( = ?auto_1433930 ?auto_1433931 ) ) ( not ( = ?auto_1433930 ?auto_1433932 ) ) ( not ( = ?auto_1433930 ?auto_1433933 ) ) ( not ( = ?auto_1433930 ?auto_1433934 ) ) ( not ( = ?auto_1433930 ?auto_1433935 ) ) ( not ( = ?auto_1433931 ?auto_1433932 ) ) ( not ( = ?auto_1433931 ?auto_1433933 ) ) ( not ( = ?auto_1433931 ?auto_1433934 ) ) ( not ( = ?auto_1433931 ?auto_1433935 ) ) ( not ( = ?auto_1433932 ?auto_1433933 ) ) ( not ( = ?auto_1433932 ?auto_1433934 ) ) ( not ( = ?auto_1433932 ?auto_1433935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433933 ?auto_1433934 ?auto_1433935 )
      ( MAKE-7CRATE-VERIFY ?auto_1433928 ?auto_1433929 ?auto_1433930 ?auto_1433931 ?auto_1433932 ?auto_1433933 ?auto_1433934 ?auto_1433935 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1434005 - SURFACE
      ?auto_1434006 - SURFACE
      ?auto_1434007 - SURFACE
      ?auto_1434008 - SURFACE
      ?auto_1434009 - SURFACE
      ?auto_1434010 - SURFACE
      ?auto_1434011 - SURFACE
      ?auto_1434012 - SURFACE
    )
    :vars
    (
      ?auto_1434013 - HOIST
      ?auto_1434017 - PLACE
      ?auto_1434014 - TRUCK
      ?auto_1434015 - PLACE
      ?auto_1434018 - HOIST
      ?auto_1434016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434013 ?auto_1434017 ) ( SURFACE-AT ?auto_1434011 ?auto_1434017 ) ( CLEAR ?auto_1434011 ) ( IS-CRATE ?auto_1434012 ) ( not ( = ?auto_1434011 ?auto_1434012 ) ) ( AVAILABLE ?auto_1434013 ) ( ON ?auto_1434011 ?auto_1434010 ) ( not ( = ?auto_1434010 ?auto_1434011 ) ) ( not ( = ?auto_1434010 ?auto_1434012 ) ) ( TRUCK-AT ?auto_1434014 ?auto_1434015 ) ( not ( = ?auto_1434015 ?auto_1434017 ) ) ( HOIST-AT ?auto_1434018 ?auto_1434015 ) ( not ( = ?auto_1434013 ?auto_1434018 ) ) ( AVAILABLE ?auto_1434018 ) ( SURFACE-AT ?auto_1434012 ?auto_1434015 ) ( ON ?auto_1434012 ?auto_1434016 ) ( CLEAR ?auto_1434012 ) ( not ( = ?auto_1434011 ?auto_1434016 ) ) ( not ( = ?auto_1434012 ?auto_1434016 ) ) ( not ( = ?auto_1434010 ?auto_1434016 ) ) ( ON ?auto_1434006 ?auto_1434005 ) ( ON ?auto_1434007 ?auto_1434006 ) ( ON ?auto_1434008 ?auto_1434007 ) ( ON ?auto_1434009 ?auto_1434008 ) ( ON ?auto_1434010 ?auto_1434009 ) ( not ( = ?auto_1434005 ?auto_1434006 ) ) ( not ( = ?auto_1434005 ?auto_1434007 ) ) ( not ( = ?auto_1434005 ?auto_1434008 ) ) ( not ( = ?auto_1434005 ?auto_1434009 ) ) ( not ( = ?auto_1434005 ?auto_1434010 ) ) ( not ( = ?auto_1434005 ?auto_1434011 ) ) ( not ( = ?auto_1434005 ?auto_1434012 ) ) ( not ( = ?auto_1434005 ?auto_1434016 ) ) ( not ( = ?auto_1434006 ?auto_1434007 ) ) ( not ( = ?auto_1434006 ?auto_1434008 ) ) ( not ( = ?auto_1434006 ?auto_1434009 ) ) ( not ( = ?auto_1434006 ?auto_1434010 ) ) ( not ( = ?auto_1434006 ?auto_1434011 ) ) ( not ( = ?auto_1434006 ?auto_1434012 ) ) ( not ( = ?auto_1434006 ?auto_1434016 ) ) ( not ( = ?auto_1434007 ?auto_1434008 ) ) ( not ( = ?auto_1434007 ?auto_1434009 ) ) ( not ( = ?auto_1434007 ?auto_1434010 ) ) ( not ( = ?auto_1434007 ?auto_1434011 ) ) ( not ( = ?auto_1434007 ?auto_1434012 ) ) ( not ( = ?auto_1434007 ?auto_1434016 ) ) ( not ( = ?auto_1434008 ?auto_1434009 ) ) ( not ( = ?auto_1434008 ?auto_1434010 ) ) ( not ( = ?auto_1434008 ?auto_1434011 ) ) ( not ( = ?auto_1434008 ?auto_1434012 ) ) ( not ( = ?auto_1434008 ?auto_1434016 ) ) ( not ( = ?auto_1434009 ?auto_1434010 ) ) ( not ( = ?auto_1434009 ?auto_1434011 ) ) ( not ( = ?auto_1434009 ?auto_1434012 ) ) ( not ( = ?auto_1434009 ?auto_1434016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1434010 ?auto_1434011 ?auto_1434012 )
      ( MAKE-7CRATE-VERIFY ?auto_1434005 ?auto_1434006 ?auto_1434007 ?auto_1434008 ?auto_1434009 ?auto_1434010 ?auto_1434011 ?auto_1434012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1434083 - SURFACE
      ?auto_1434084 - SURFACE
      ?auto_1434085 - SURFACE
      ?auto_1434086 - SURFACE
      ?auto_1434087 - SURFACE
      ?auto_1434088 - SURFACE
      ?auto_1434089 - SURFACE
      ?auto_1434090 - SURFACE
    )
    :vars
    (
      ?auto_1434095 - HOIST
      ?auto_1434092 - PLACE
      ?auto_1434096 - PLACE
      ?auto_1434093 - HOIST
      ?auto_1434094 - SURFACE
      ?auto_1434091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434095 ?auto_1434092 ) ( SURFACE-AT ?auto_1434089 ?auto_1434092 ) ( CLEAR ?auto_1434089 ) ( IS-CRATE ?auto_1434090 ) ( not ( = ?auto_1434089 ?auto_1434090 ) ) ( AVAILABLE ?auto_1434095 ) ( ON ?auto_1434089 ?auto_1434088 ) ( not ( = ?auto_1434088 ?auto_1434089 ) ) ( not ( = ?auto_1434088 ?auto_1434090 ) ) ( not ( = ?auto_1434096 ?auto_1434092 ) ) ( HOIST-AT ?auto_1434093 ?auto_1434096 ) ( not ( = ?auto_1434095 ?auto_1434093 ) ) ( AVAILABLE ?auto_1434093 ) ( SURFACE-AT ?auto_1434090 ?auto_1434096 ) ( ON ?auto_1434090 ?auto_1434094 ) ( CLEAR ?auto_1434090 ) ( not ( = ?auto_1434089 ?auto_1434094 ) ) ( not ( = ?auto_1434090 ?auto_1434094 ) ) ( not ( = ?auto_1434088 ?auto_1434094 ) ) ( TRUCK-AT ?auto_1434091 ?auto_1434092 ) ( ON ?auto_1434084 ?auto_1434083 ) ( ON ?auto_1434085 ?auto_1434084 ) ( ON ?auto_1434086 ?auto_1434085 ) ( ON ?auto_1434087 ?auto_1434086 ) ( ON ?auto_1434088 ?auto_1434087 ) ( not ( = ?auto_1434083 ?auto_1434084 ) ) ( not ( = ?auto_1434083 ?auto_1434085 ) ) ( not ( = ?auto_1434083 ?auto_1434086 ) ) ( not ( = ?auto_1434083 ?auto_1434087 ) ) ( not ( = ?auto_1434083 ?auto_1434088 ) ) ( not ( = ?auto_1434083 ?auto_1434089 ) ) ( not ( = ?auto_1434083 ?auto_1434090 ) ) ( not ( = ?auto_1434083 ?auto_1434094 ) ) ( not ( = ?auto_1434084 ?auto_1434085 ) ) ( not ( = ?auto_1434084 ?auto_1434086 ) ) ( not ( = ?auto_1434084 ?auto_1434087 ) ) ( not ( = ?auto_1434084 ?auto_1434088 ) ) ( not ( = ?auto_1434084 ?auto_1434089 ) ) ( not ( = ?auto_1434084 ?auto_1434090 ) ) ( not ( = ?auto_1434084 ?auto_1434094 ) ) ( not ( = ?auto_1434085 ?auto_1434086 ) ) ( not ( = ?auto_1434085 ?auto_1434087 ) ) ( not ( = ?auto_1434085 ?auto_1434088 ) ) ( not ( = ?auto_1434085 ?auto_1434089 ) ) ( not ( = ?auto_1434085 ?auto_1434090 ) ) ( not ( = ?auto_1434085 ?auto_1434094 ) ) ( not ( = ?auto_1434086 ?auto_1434087 ) ) ( not ( = ?auto_1434086 ?auto_1434088 ) ) ( not ( = ?auto_1434086 ?auto_1434089 ) ) ( not ( = ?auto_1434086 ?auto_1434090 ) ) ( not ( = ?auto_1434086 ?auto_1434094 ) ) ( not ( = ?auto_1434087 ?auto_1434088 ) ) ( not ( = ?auto_1434087 ?auto_1434089 ) ) ( not ( = ?auto_1434087 ?auto_1434090 ) ) ( not ( = ?auto_1434087 ?auto_1434094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1434088 ?auto_1434089 ?auto_1434090 )
      ( MAKE-7CRATE-VERIFY ?auto_1434083 ?auto_1434084 ?auto_1434085 ?auto_1434086 ?auto_1434087 ?auto_1434088 ?auto_1434089 ?auto_1434090 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1434161 - SURFACE
      ?auto_1434162 - SURFACE
      ?auto_1434163 - SURFACE
      ?auto_1434164 - SURFACE
      ?auto_1434165 - SURFACE
      ?auto_1434166 - SURFACE
      ?auto_1434167 - SURFACE
      ?auto_1434168 - SURFACE
    )
    :vars
    (
      ?auto_1434169 - HOIST
      ?auto_1434172 - PLACE
      ?auto_1434170 - PLACE
      ?auto_1434173 - HOIST
      ?auto_1434171 - SURFACE
      ?auto_1434174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434169 ?auto_1434172 ) ( IS-CRATE ?auto_1434168 ) ( not ( = ?auto_1434167 ?auto_1434168 ) ) ( not ( = ?auto_1434166 ?auto_1434167 ) ) ( not ( = ?auto_1434166 ?auto_1434168 ) ) ( not ( = ?auto_1434170 ?auto_1434172 ) ) ( HOIST-AT ?auto_1434173 ?auto_1434170 ) ( not ( = ?auto_1434169 ?auto_1434173 ) ) ( AVAILABLE ?auto_1434173 ) ( SURFACE-AT ?auto_1434168 ?auto_1434170 ) ( ON ?auto_1434168 ?auto_1434171 ) ( CLEAR ?auto_1434168 ) ( not ( = ?auto_1434167 ?auto_1434171 ) ) ( not ( = ?auto_1434168 ?auto_1434171 ) ) ( not ( = ?auto_1434166 ?auto_1434171 ) ) ( TRUCK-AT ?auto_1434174 ?auto_1434172 ) ( SURFACE-AT ?auto_1434166 ?auto_1434172 ) ( CLEAR ?auto_1434166 ) ( LIFTING ?auto_1434169 ?auto_1434167 ) ( IS-CRATE ?auto_1434167 ) ( ON ?auto_1434162 ?auto_1434161 ) ( ON ?auto_1434163 ?auto_1434162 ) ( ON ?auto_1434164 ?auto_1434163 ) ( ON ?auto_1434165 ?auto_1434164 ) ( ON ?auto_1434166 ?auto_1434165 ) ( not ( = ?auto_1434161 ?auto_1434162 ) ) ( not ( = ?auto_1434161 ?auto_1434163 ) ) ( not ( = ?auto_1434161 ?auto_1434164 ) ) ( not ( = ?auto_1434161 ?auto_1434165 ) ) ( not ( = ?auto_1434161 ?auto_1434166 ) ) ( not ( = ?auto_1434161 ?auto_1434167 ) ) ( not ( = ?auto_1434161 ?auto_1434168 ) ) ( not ( = ?auto_1434161 ?auto_1434171 ) ) ( not ( = ?auto_1434162 ?auto_1434163 ) ) ( not ( = ?auto_1434162 ?auto_1434164 ) ) ( not ( = ?auto_1434162 ?auto_1434165 ) ) ( not ( = ?auto_1434162 ?auto_1434166 ) ) ( not ( = ?auto_1434162 ?auto_1434167 ) ) ( not ( = ?auto_1434162 ?auto_1434168 ) ) ( not ( = ?auto_1434162 ?auto_1434171 ) ) ( not ( = ?auto_1434163 ?auto_1434164 ) ) ( not ( = ?auto_1434163 ?auto_1434165 ) ) ( not ( = ?auto_1434163 ?auto_1434166 ) ) ( not ( = ?auto_1434163 ?auto_1434167 ) ) ( not ( = ?auto_1434163 ?auto_1434168 ) ) ( not ( = ?auto_1434163 ?auto_1434171 ) ) ( not ( = ?auto_1434164 ?auto_1434165 ) ) ( not ( = ?auto_1434164 ?auto_1434166 ) ) ( not ( = ?auto_1434164 ?auto_1434167 ) ) ( not ( = ?auto_1434164 ?auto_1434168 ) ) ( not ( = ?auto_1434164 ?auto_1434171 ) ) ( not ( = ?auto_1434165 ?auto_1434166 ) ) ( not ( = ?auto_1434165 ?auto_1434167 ) ) ( not ( = ?auto_1434165 ?auto_1434168 ) ) ( not ( = ?auto_1434165 ?auto_1434171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1434166 ?auto_1434167 ?auto_1434168 )
      ( MAKE-7CRATE-VERIFY ?auto_1434161 ?auto_1434162 ?auto_1434163 ?auto_1434164 ?auto_1434165 ?auto_1434166 ?auto_1434167 ?auto_1434168 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1434239 - SURFACE
      ?auto_1434240 - SURFACE
      ?auto_1434241 - SURFACE
      ?auto_1434242 - SURFACE
      ?auto_1434243 - SURFACE
      ?auto_1434244 - SURFACE
      ?auto_1434245 - SURFACE
      ?auto_1434246 - SURFACE
    )
    :vars
    (
      ?auto_1434248 - HOIST
      ?auto_1434251 - PLACE
      ?auto_1434252 - PLACE
      ?auto_1434247 - HOIST
      ?auto_1434250 - SURFACE
      ?auto_1434249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434248 ?auto_1434251 ) ( IS-CRATE ?auto_1434246 ) ( not ( = ?auto_1434245 ?auto_1434246 ) ) ( not ( = ?auto_1434244 ?auto_1434245 ) ) ( not ( = ?auto_1434244 ?auto_1434246 ) ) ( not ( = ?auto_1434252 ?auto_1434251 ) ) ( HOIST-AT ?auto_1434247 ?auto_1434252 ) ( not ( = ?auto_1434248 ?auto_1434247 ) ) ( AVAILABLE ?auto_1434247 ) ( SURFACE-AT ?auto_1434246 ?auto_1434252 ) ( ON ?auto_1434246 ?auto_1434250 ) ( CLEAR ?auto_1434246 ) ( not ( = ?auto_1434245 ?auto_1434250 ) ) ( not ( = ?auto_1434246 ?auto_1434250 ) ) ( not ( = ?auto_1434244 ?auto_1434250 ) ) ( TRUCK-AT ?auto_1434249 ?auto_1434251 ) ( SURFACE-AT ?auto_1434244 ?auto_1434251 ) ( CLEAR ?auto_1434244 ) ( IS-CRATE ?auto_1434245 ) ( AVAILABLE ?auto_1434248 ) ( IN ?auto_1434245 ?auto_1434249 ) ( ON ?auto_1434240 ?auto_1434239 ) ( ON ?auto_1434241 ?auto_1434240 ) ( ON ?auto_1434242 ?auto_1434241 ) ( ON ?auto_1434243 ?auto_1434242 ) ( ON ?auto_1434244 ?auto_1434243 ) ( not ( = ?auto_1434239 ?auto_1434240 ) ) ( not ( = ?auto_1434239 ?auto_1434241 ) ) ( not ( = ?auto_1434239 ?auto_1434242 ) ) ( not ( = ?auto_1434239 ?auto_1434243 ) ) ( not ( = ?auto_1434239 ?auto_1434244 ) ) ( not ( = ?auto_1434239 ?auto_1434245 ) ) ( not ( = ?auto_1434239 ?auto_1434246 ) ) ( not ( = ?auto_1434239 ?auto_1434250 ) ) ( not ( = ?auto_1434240 ?auto_1434241 ) ) ( not ( = ?auto_1434240 ?auto_1434242 ) ) ( not ( = ?auto_1434240 ?auto_1434243 ) ) ( not ( = ?auto_1434240 ?auto_1434244 ) ) ( not ( = ?auto_1434240 ?auto_1434245 ) ) ( not ( = ?auto_1434240 ?auto_1434246 ) ) ( not ( = ?auto_1434240 ?auto_1434250 ) ) ( not ( = ?auto_1434241 ?auto_1434242 ) ) ( not ( = ?auto_1434241 ?auto_1434243 ) ) ( not ( = ?auto_1434241 ?auto_1434244 ) ) ( not ( = ?auto_1434241 ?auto_1434245 ) ) ( not ( = ?auto_1434241 ?auto_1434246 ) ) ( not ( = ?auto_1434241 ?auto_1434250 ) ) ( not ( = ?auto_1434242 ?auto_1434243 ) ) ( not ( = ?auto_1434242 ?auto_1434244 ) ) ( not ( = ?auto_1434242 ?auto_1434245 ) ) ( not ( = ?auto_1434242 ?auto_1434246 ) ) ( not ( = ?auto_1434242 ?auto_1434250 ) ) ( not ( = ?auto_1434243 ?auto_1434244 ) ) ( not ( = ?auto_1434243 ?auto_1434245 ) ) ( not ( = ?auto_1434243 ?auto_1434246 ) ) ( not ( = ?auto_1434243 ?auto_1434250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1434244 ?auto_1434245 ?auto_1434246 )
      ( MAKE-7CRATE-VERIFY ?auto_1434239 ?auto_1434240 ?auto_1434241 ?auto_1434242 ?auto_1434243 ?auto_1434244 ?auto_1434245 ?auto_1434246 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437158 - SURFACE
      ?auto_1437159 - SURFACE
      ?auto_1437160 - SURFACE
      ?auto_1437161 - SURFACE
      ?auto_1437162 - SURFACE
      ?auto_1437163 - SURFACE
      ?auto_1437164 - SURFACE
      ?auto_1437165 - SURFACE
      ?auto_1437166 - SURFACE
    )
    :vars
    (
      ?auto_1437167 - HOIST
      ?auto_1437168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437167 ?auto_1437168 ) ( SURFACE-AT ?auto_1437165 ?auto_1437168 ) ( CLEAR ?auto_1437165 ) ( LIFTING ?auto_1437167 ?auto_1437166 ) ( IS-CRATE ?auto_1437166 ) ( not ( = ?auto_1437165 ?auto_1437166 ) ) ( ON ?auto_1437159 ?auto_1437158 ) ( ON ?auto_1437160 ?auto_1437159 ) ( ON ?auto_1437161 ?auto_1437160 ) ( ON ?auto_1437162 ?auto_1437161 ) ( ON ?auto_1437163 ?auto_1437162 ) ( ON ?auto_1437164 ?auto_1437163 ) ( ON ?auto_1437165 ?auto_1437164 ) ( not ( = ?auto_1437158 ?auto_1437159 ) ) ( not ( = ?auto_1437158 ?auto_1437160 ) ) ( not ( = ?auto_1437158 ?auto_1437161 ) ) ( not ( = ?auto_1437158 ?auto_1437162 ) ) ( not ( = ?auto_1437158 ?auto_1437163 ) ) ( not ( = ?auto_1437158 ?auto_1437164 ) ) ( not ( = ?auto_1437158 ?auto_1437165 ) ) ( not ( = ?auto_1437158 ?auto_1437166 ) ) ( not ( = ?auto_1437159 ?auto_1437160 ) ) ( not ( = ?auto_1437159 ?auto_1437161 ) ) ( not ( = ?auto_1437159 ?auto_1437162 ) ) ( not ( = ?auto_1437159 ?auto_1437163 ) ) ( not ( = ?auto_1437159 ?auto_1437164 ) ) ( not ( = ?auto_1437159 ?auto_1437165 ) ) ( not ( = ?auto_1437159 ?auto_1437166 ) ) ( not ( = ?auto_1437160 ?auto_1437161 ) ) ( not ( = ?auto_1437160 ?auto_1437162 ) ) ( not ( = ?auto_1437160 ?auto_1437163 ) ) ( not ( = ?auto_1437160 ?auto_1437164 ) ) ( not ( = ?auto_1437160 ?auto_1437165 ) ) ( not ( = ?auto_1437160 ?auto_1437166 ) ) ( not ( = ?auto_1437161 ?auto_1437162 ) ) ( not ( = ?auto_1437161 ?auto_1437163 ) ) ( not ( = ?auto_1437161 ?auto_1437164 ) ) ( not ( = ?auto_1437161 ?auto_1437165 ) ) ( not ( = ?auto_1437161 ?auto_1437166 ) ) ( not ( = ?auto_1437162 ?auto_1437163 ) ) ( not ( = ?auto_1437162 ?auto_1437164 ) ) ( not ( = ?auto_1437162 ?auto_1437165 ) ) ( not ( = ?auto_1437162 ?auto_1437166 ) ) ( not ( = ?auto_1437163 ?auto_1437164 ) ) ( not ( = ?auto_1437163 ?auto_1437165 ) ) ( not ( = ?auto_1437163 ?auto_1437166 ) ) ( not ( = ?auto_1437164 ?auto_1437165 ) ) ( not ( = ?auto_1437164 ?auto_1437166 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1437165 ?auto_1437166 )
      ( MAKE-8CRATE-VERIFY ?auto_1437158 ?auto_1437159 ?auto_1437160 ?auto_1437161 ?auto_1437162 ?auto_1437163 ?auto_1437164 ?auto_1437165 ?auto_1437166 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437225 - SURFACE
      ?auto_1437226 - SURFACE
      ?auto_1437227 - SURFACE
      ?auto_1437228 - SURFACE
      ?auto_1437229 - SURFACE
      ?auto_1437230 - SURFACE
      ?auto_1437231 - SURFACE
      ?auto_1437232 - SURFACE
      ?auto_1437233 - SURFACE
    )
    :vars
    (
      ?auto_1437234 - HOIST
      ?auto_1437235 - PLACE
      ?auto_1437236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437234 ?auto_1437235 ) ( SURFACE-AT ?auto_1437232 ?auto_1437235 ) ( CLEAR ?auto_1437232 ) ( IS-CRATE ?auto_1437233 ) ( not ( = ?auto_1437232 ?auto_1437233 ) ) ( TRUCK-AT ?auto_1437236 ?auto_1437235 ) ( AVAILABLE ?auto_1437234 ) ( IN ?auto_1437233 ?auto_1437236 ) ( ON ?auto_1437232 ?auto_1437231 ) ( not ( = ?auto_1437231 ?auto_1437232 ) ) ( not ( = ?auto_1437231 ?auto_1437233 ) ) ( ON ?auto_1437226 ?auto_1437225 ) ( ON ?auto_1437227 ?auto_1437226 ) ( ON ?auto_1437228 ?auto_1437227 ) ( ON ?auto_1437229 ?auto_1437228 ) ( ON ?auto_1437230 ?auto_1437229 ) ( ON ?auto_1437231 ?auto_1437230 ) ( not ( = ?auto_1437225 ?auto_1437226 ) ) ( not ( = ?auto_1437225 ?auto_1437227 ) ) ( not ( = ?auto_1437225 ?auto_1437228 ) ) ( not ( = ?auto_1437225 ?auto_1437229 ) ) ( not ( = ?auto_1437225 ?auto_1437230 ) ) ( not ( = ?auto_1437225 ?auto_1437231 ) ) ( not ( = ?auto_1437225 ?auto_1437232 ) ) ( not ( = ?auto_1437225 ?auto_1437233 ) ) ( not ( = ?auto_1437226 ?auto_1437227 ) ) ( not ( = ?auto_1437226 ?auto_1437228 ) ) ( not ( = ?auto_1437226 ?auto_1437229 ) ) ( not ( = ?auto_1437226 ?auto_1437230 ) ) ( not ( = ?auto_1437226 ?auto_1437231 ) ) ( not ( = ?auto_1437226 ?auto_1437232 ) ) ( not ( = ?auto_1437226 ?auto_1437233 ) ) ( not ( = ?auto_1437227 ?auto_1437228 ) ) ( not ( = ?auto_1437227 ?auto_1437229 ) ) ( not ( = ?auto_1437227 ?auto_1437230 ) ) ( not ( = ?auto_1437227 ?auto_1437231 ) ) ( not ( = ?auto_1437227 ?auto_1437232 ) ) ( not ( = ?auto_1437227 ?auto_1437233 ) ) ( not ( = ?auto_1437228 ?auto_1437229 ) ) ( not ( = ?auto_1437228 ?auto_1437230 ) ) ( not ( = ?auto_1437228 ?auto_1437231 ) ) ( not ( = ?auto_1437228 ?auto_1437232 ) ) ( not ( = ?auto_1437228 ?auto_1437233 ) ) ( not ( = ?auto_1437229 ?auto_1437230 ) ) ( not ( = ?auto_1437229 ?auto_1437231 ) ) ( not ( = ?auto_1437229 ?auto_1437232 ) ) ( not ( = ?auto_1437229 ?auto_1437233 ) ) ( not ( = ?auto_1437230 ?auto_1437231 ) ) ( not ( = ?auto_1437230 ?auto_1437232 ) ) ( not ( = ?auto_1437230 ?auto_1437233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437231 ?auto_1437232 ?auto_1437233 )
      ( MAKE-8CRATE-VERIFY ?auto_1437225 ?auto_1437226 ?auto_1437227 ?auto_1437228 ?auto_1437229 ?auto_1437230 ?auto_1437231 ?auto_1437232 ?auto_1437233 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437301 - SURFACE
      ?auto_1437302 - SURFACE
      ?auto_1437303 - SURFACE
      ?auto_1437304 - SURFACE
      ?auto_1437305 - SURFACE
      ?auto_1437306 - SURFACE
      ?auto_1437307 - SURFACE
      ?auto_1437308 - SURFACE
      ?auto_1437309 - SURFACE
    )
    :vars
    (
      ?auto_1437312 - HOIST
      ?auto_1437310 - PLACE
      ?auto_1437313 - TRUCK
      ?auto_1437311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437312 ?auto_1437310 ) ( SURFACE-AT ?auto_1437308 ?auto_1437310 ) ( CLEAR ?auto_1437308 ) ( IS-CRATE ?auto_1437309 ) ( not ( = ?auto_1437308 ?auto_1437309 ) ) ( AVAILABLE ?auto_1437312 ) ( IN ?auto_1437309 ?auto_1437313 ) ( ON ?auto_1437308 ?auto_1437307 ) ( not ( = ?auto_1437307 ?auto_1437308 ) ) ( not ( = ?auto_1437307 ?auto_1437309 ) ) ( TRUCK-AT ?auto_1437313 ?auto_1437311 ) ( not ( = ?auto_1437311 ?auto_1437310 ) ) ( ON ?auto_1437302 ?auto_1437301 ) ( ON ?auto_1437303 ?auto_1437302 ) ( ON ?auto_1437304 ?auto_1437303 ) ( ON ?auto_1437305 ?auto_1437304 ) ( ON ?auto_1437306 ?auto_1437305 ) ( ON ?auto_1437307 ?auto_1437306 ) ( not ( = ?auto_1437301 ?auto_1437302 ) ) ( not ( = ?auto_1437301 ?auto_1437303 ) ) ( not ( = ?auto_1437301 ?auto_1437304 ) ) ( not ( = ?auto_1437301 ?auto_1437305 ) ) ( not ( = ?auto_1437301 ?auto_1437306 ) ) ( not ( = ?auto_1437301 ?auto_1437307 ) ) ( not ( = ?auto_1437301 ?auto_1437308 ) ) ( not ( = ?auto_1437301 ?auto_1437309 ) ) ( not ( = ?auto_1437302 ?auto_1437303 ) ) ( not ( = ?auto_1437302 ?auto_1437304 ) ) ( not ( = ?auto_1437302 ?auto_1437305 ) ) ( not ( = ?auto_1437302 ?auto_1437306 ) ) ( not ( = ?auto_1437302 ?auto_1437307 ) ) ( not ( = ?auto_1437302 ?auto_1437308 ) ) ( not ( = ?auto_1437302 ?auto_1437309 ) ) ( not ( = ?auto_1437303 ?auto_1437304 ) ) ( not ( = ?auto_1437303 ?auto_1437305 ) ) ( not ( = ?auto_1437303 ?auto_1437306 ) ) ( not ( = ?auto_1437303 ?auto_1437307 ) ) ( not ( = ?auto_1437303 ?auto_1437308 ) ) ( not ( = ?auto_1437303 ?auto_1437309 ) ) ( not ( = ?auto_1437304 ?auto_1437305 ) ) ( not ( = ?auto_1437304 ?auto_1437306 ) ) ( not ( = ?auto_1437304 ?auto_1437307 ) ) ( not ( = ?auto_1437304 ?auto_1437308 ) ) ( not ( = ?auto_1437304 ?auto_1437309 ) ) ( not ( = ?auto_1437305 ?auto_1437306 ) ) ( not ( = ?auto_1437305 ?auto_1437307 ) ) ( not ( = ?auto_1437305 ?auto_1437308 ) ) ( not ( = ?auto_1437305 ?auto_1437309 ) ) ( not ( = ?auto_1437306 ?auto_1437307 ) ) ( not ( = ?auto_1437306 ?auto_1437308 ) ) ( not ( = ?auto_1437306 ?auto_1437309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437307 ?auto_1437308 ?auto_1437309 )
      ( MAKE-8CRATE-VERIFY ?auto_1437301 ?auto_1437302 ?auto_1437303 ?auto_1437304 ?auto_1437305 ?auto_1437306 ?auto_1437307 ?auto_1437308 ?auto_1437309 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437385 - SURFACE
      ?auto_1437386 - SURFACE
      ?auto_1437387 - SURFACE
      ?auto_1437388 - SURFACE
      ?auto_1437389 - SURFACE
      ?auto_1437390 - SURFACE
      ?auto_1437391 - SURFACE
      ?auto_1437392 - SURFACE
      ?auto_1437393 - SURFACE
    )
    :vars
    (
      ?auto_1437395 - HOIST
      ?auto_1437396 - PLACE
      ?auto_1437397 - TRUCK
      ?auto_1437398 - PLACE
      ?auto_1437394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437395 ?auto_1437396 ) ( SURFACE-AT ?auto_1437392 ?auto_1437396 ) ( CLEAR ?auto_1437392 ) ( IS-CRATE ?auto_1437393 ) ( not ( = ?auto_1437392 ?auto_1437393 ) ) ( AVAILABLE ?auto_1437395 ) ( ON ?auto_1437392 ?auto_1437391 ) ( not ( = ?auto_1437391 ?auto_1437392 ) ) ( not ( = ?auto_1437391 ?auto_1437393 ) ) ( TRUCK-AT ?auto_1437397 ?auto_1437398 ) ( not ( = ?auto_1437398 ?auto_1437396 ) ) ( HOIST-AT ?auto_1437394 ?auto_1437398 ) ( LIFTING ?auto_1437394 ?auto_1437393 ) ( not ( = ?auto_1437395 ?auto_1437394 ) ) ( ON ?auto_1437386 ?auto_1437385 ) ( ON ?auto_1437387 ?auto_1437386 ) ( ON ?auto_1437388 ?auto_1437387 ) ( ON ?auto_1437389 ?auto_1437388 ) ( ON ?auto_1437390 ?auto_1437389 ) ( ON ?auto_1437391 ?auto_1437390 ) ( not ( = ?auto_1437385 ?auto_1437386 ) ) ( not ( = ?auto_1437385 ?auto_1437387 ) ) ( not ( = ?auto_1437385 ?auto_1437388 ) ) ( not ( = ?auto_1437385 ?auto_1437389 ) ) ( not ( = ?auto_1437385 ?auto_1437390 ) ) ( not ( = ?auto_1437385 ?auto_1437391 ) ) ( not ( = ?auto_1437385 ?auto_1437392 ) ) ( not ( = ?auto_1437385 ?auto_1437393 ) ) ( not ( = ?auto_1437386 ?auto_1437387 ) ) ( not ( = ?auto_1437386 ?auto_1437388 ) ) ( not ( = ?auto_1437386 ?auto_1437389 ) ) ( not ( = ?auto_1437386 ?auto_1437390 ) ) ( not ( = ?auto_1437386 ?auto_1437391 ) ) ( not ( = ?auto_1437386 ?auto_1437392 ) ) ( not ( = ?auto_1437386 ?auto_1437393 ) ) ( not ( = ?auto_1437387 ?auto_1437388 ) ) ( not ( = ?auto_1437387 ?auto_1437389 ) ) ( not ( = ?auto_1437387 ?auto_1437390 ) ) ( not ( = ?auto_1437387 ?auto_1437391 ) ) ( not ( = ?auto_1437387 ?auto_1437392 ) ) ( not ( = ?auto_1437387 ?auto_1437393 ) ) ( not ( = ?auto_1437388 ?auto_1437389 ) ) ( not ( = ?auto_1437388 ?auto_1437390 ) ) ( not ( = ?auto_1437388 ?auto_1437391 ) ) ( not ( = ?auto_1437388 ?auto_1437392 ) ) ( not ( = ?auto_1437388 ?auto_1437393 ) ) ( not ( = ?auto_1437389 ?auto_1437390 ) ) ( not ( = ?auto_1437389 ?auto_1437391 ) ) ( not ( = ?auto_1437389 ?auto_1437392 ) ) ( not ( = ?auto_1437389 ?auto_1437393 ) ) ( not ( = ?auto_1437390 ?auto_1437391 ) ) ( not ( = ?auto_1437390 ?auto_1437392 ) ) ( not ( = ?auto_1437390 ?auto_1437393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437391 ?auto_1437392 ?auto_1437393 )
      ( MAKE-8CRATE-VERIFY ?auto_1437385 ?auto_1437386 ?auto_1437387 ?auto_1437388 ?auto_1437389 ?auto_1437390 ?auto_1437391 ?auto_1437392 ?auto_1437393 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437477 - SURFACE
      ?auto_1437478 - SURFACE
      ?auto_1437479 - SURFACE
      ?auto_1437480 - SURFACE
      ?auto_1437481 - SURFACE
      ?auto_1437482 - SURFACE
      ?auto_1437483 - SURFACE
      ?auto_1437484 - SURFACE
      ?auto_1437485 - SURFACE
    )
    :vars
    (
      ?auto_1437489 - HOIST
      ?auto_1437488 - PLACE
      ?auto_1437486 - TRUCK
      ?auto_1437487 - PLACE
      ?auto_1437491 - HOIST
      ?auto_1437490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437489 ?auto_1437488 ) ( SURFACE-AT ?auto_1437484 ?auto_1437488 ) ( CLEAR ?auto_1437484 ) ( IS-CRATE ?auto_1437485 ) ( not ( = ?auto_1437484 ?auto_1437485 ) ) ( AVAILABLE ?auto_1437489 ) ( ON ?auto_1437484 ?auto_1437483 ) ( not ( = ?auto_1437483 ?auto_1437484 ) ) ( not ( = ?auto_1437483 ?auto_1437485 ) ) ( TRUCK-AT ?auto_1437486 ?auto_1437487 ) ( not ( = ?auto_1437487 ?auto_1437488 ) ) ( HOIST-AT ?auto_1437491 ?auto_1437487 ) ( not ( = ?auto_1437489 ?auto_1437491 ) ) ( AVAILABLE ?auto_1437491 ) ( SURFACE-AT ?auto_1437485 ?auto_1437487 ) ( ON ?auto_1437485 ?auto_1437490 ) ( CLEAR ?auto_1437485 ) ( not ( = ?auto_1437484 ?auto_1437490 ) ) ( not ( = ?auto_1437485 ?auto_1437490 ) ) ( not ( = ?auto_1437483 ?auto_1437490 ) ) ( ON ?auto_1437478 ?auto_1437477 ) ( ON ?auto_1437479 ?auto_1437478 ) ( ON ?auto_1437480 ?auto_1437479 ) ( ON ?auto_1437481 ?auto_1437480 ) ( ON ?auto_1437482 ?auto_1437481 ) ( ON ?auto_1437483 ?auto_1437482 ) ( not ( = ?auto_1437477 ?auto_1437478 ) ) ( not ( = ?auto_1437477 ?auto_1437479 ) ) ( not ( = ?auto_1437477 ?auto_1437480 ) ) ( not ( = ?auto_1437477 ?auto_1437481 ) ) ( not ( = ?auto_1437477 ?auto_1437482 ) ) ( not ( = ?auto_1437477 ?auto_1437483 ) ) ( not ( = ?auto_1437477 ?auto_1437484 ) ) ( not ( = ?auto_1437477 ?auto_1437485 ) ) ( not ( = ?auto_1437477 ?auto_1437490 ) ) ( not ( = ?auto_1437478 ?auto_1437479 ) ) ( not ( = ?auto_1437478 ?auto_1437480 ) ) ( not ( = ?auto_1437478 ?auto_1437481 ) ) ( not ( = ?auto_1437478 ?auto_1437482 ) ) ( not ( = ?auto_1437478 ?auto_1437483 ) ) ( not ( = ?auto_1437478 ?auto_1437484 ) ) ( not ( = ?auto_1437478 ?auto_1437485 ) ) ( not ( = ?auto_1437478 ?auto_1437490 ) ) ( not ( = ?auto_1437479 ?auto_1437480 ) ) ( not ( = ?auto_1437479 ?auto_1437481 ) ) ( not ( = ?auto_1437479 ?auto_1437482 ) ) ( not ( = ?auto_1437479 ?auto_1437483 ) ) ( not ( = ?auto_1437479 ?auto_1437484 ) ) ( not ( = ?auto_1437479 ?auto_1437485 ) ) ( not ( = ?auto_1437479 ?auto_1437490 ) ) ( not ( = ?auto_1437480 ?auto_1437481 ) ) ( not ( = ?auto_1437480 ?auto_1437482 ) ) ( not ( = ?auto_1437480 ?auto_1437483 ) ) ( not ( = ?auto_1437480 ?auto_1437484 ) ) ( not ( = ?auto_1437480 ?auto_1437485 ) ) ( not ( = ?auto_1437480 ?auto_1437490 ) ) ( not ( = ?auto_1437481 ?auto_1437482 ) ) ( not ( = ?auto_1437481 ?auto_1437483 ) ) ( not ( = ?auto_1437481 ?auto_1437484 ) ) ( not ( = ?auto_1437481 ?auto_1437485 ) ) ( not ( = ?auto_1437481 ?auto_1437490 ) ) ( not ( = ?auto_1437482 ?auto_1437483 ) ) ( not ( = ?auto_1437482 ?auto_1437484 ) ) ( not ( = ?auto_1437482 ?auto_1437485 ) ) ( not ( = ?auto_1437482 ?auto_1437490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437483 ?auto_1437484 ?auto_1437485 )
      ( MAKE-8CRATE-VERIFY ?auto_1437477 ?auto_1437478 ?auto_1437479 ?auto_1437480 ?auto_1437481 ?auto_1437482 ?auto_1437483 ?auto_1437484 ?auto_1437485 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437570 - SURFACE
      ?auto_1437571 - SURFACE
      ?auto_1437572 - SURFACE
      ?auto_1437573 - SURFACE
      ?auto_1437574 - SURFACE
      ?auto_1437575 - SURFACE
      ?auto_1437576 - SURFACE
      ?auto_1437577 - SURFACE
      ?auto_1437578 - SURFACE
    )
    :vars
    (
      ?auto_1437583 - HOIST
      ?auto_1437580 - PLACE
      ?auto_1437581 - PLACE
      ?auto_1437584 - HOIST
      ?auto_1437582 - SURFACE
      ?auto_1437579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437583 ?auto_1437580 ) ( SURFACE-AT ?auto_1437577 ?auto_1437580 ) ( CLEAR ?auto_1437577 ) ( IS-CRATE ?auto_1437578 ) ( not ( = ?auto_1437577 ?auto_1437578 ) ) ( AVAILABLE ?auto_1437583 ) ( ON ?auto_1437577 ?auto_1437576 ) ( not ( = ?auto_1437576 ?auto_1437577 ) ) ( not ( = ?auto_1437576 ?auto_1437578 ) ) ( not ( = ?auto_1437581 ?auto_1437580 ) ) ( HOIST-AT ?auto_1437584 ?auto_1437581 ) ( not ( = ?auto_1437583 ?auto_1437584 ) ) ( AVAILABLE ?auto_1437584 ) ( SURFACE-AT ?auto_1437578 ?auto_1437581 ) ( ON ?auto_1437578 ?auto_1437582 ) ( CLEAR ?auto_1437578 ) ( not ( = ?auto_1437577 ?auto_1437582 ) ) ( not ( = ?auto_1437578 ?auto_1437582 ) ) ( not ( = ?auto_1437576 ?auto_1437582 ) ) ( TRUCK-AT ?auto_1437579 ?auto_1437580 ) ( ON ?auto_1437571 ?auto_1437570 ) ( ON ?auto_1437572 ?auto_1437571 ) ( ON ?auto_1437573 ?auto_1437572 ) ( ON ?auto_1437574 ?auto_1437573 ) ( ON ?auto_1437575 ?auto_1437574 ) ( ON ?auto_1437576 ?auto_1437575 ) ( not ( = ?auto_1437570 ?auto_1437571 ) ) ( not ( = ?auto_1437570 ?auto_1437572 ) ) ( not ( = ?auto_1437570 ?auto_1437573 ) ) ( not ( = ?auto_1437570 ?auto_1437574 ) ) ( not ( = ?auto_1437570 ?auto_1437575 ) ) ( not ( = ?auto_1437570 ?auto_1437576 ) ) ( not ( = ?auto_1437570 ?auto_1437577 ) ) ( not ( = ?auto_1437570 ?auto_1437578 ) ) ( not ( = ?auto_1437570 ?auto_1437582 ) ) ( not ( = ?auto_1437571 ?auto_1437572 ) ) ( not ( = ?auto_1437571 ?auto_1437573 ) ) ( not ( = ?auto_1437571 ?auto_1437574 ) ) ( not ( = ?auto_1437571 ?auto_1437575 ) ) ( not ( = ?auto_1437571 ?auto_1437576 ) ) ( not ( = ?auto_1437571 ?auto_1437577 ) ) ( not ( = ?auto_1437571 ?auto_1437578 ) ) ( not ( = ?auto_1437571 ?auto_1437582 ) ) ( not ( = ?auto_1437572 ?auto_1437573 ) ) ( not ( = ?auto_1437572 ?auto_1437574 ) ) ( not ( = ?auto_1437572 ?auto_1437575 ) ) ( not ( = ?auto_1437572 ?auto_1437576 ) ) ( not ( = ?auto_1437572 ?auto_1437577 ) ) ( not ( = ?auto_1437572 ?auto_1437578 ) ) ( not ( = ?auto_1437572 ?auto_1437582 ) ) ( not ( = ?auto_1437573 ?auto_1437574 ) ) ( not ( = ?auto_1437573 ?auto_1437575 ) ) ( not ( = ?auto_1437573 ?auto_1437576 ) ) ( not ( = ?auto_1437573 ?auto_1437577 ) ) ( not ( = ?auto_1437573 ?auto_1437578 ) ) ( not ( = ?auto_1437573 ?auto_1437582 ) ) ( not ( = ?auto_1437574 ?auto_1437575 ) ) ( not ( = ?auto_1437574 ?auto_1437576 ) ) ( not ( = ?auto_1437574 ?auto_1437577 ) ) ( not ( = ?auto_1437574 ?auto_1437578 ) ) ( not ( = ?auto_1437574 ?auto_1437582 ) ) ( not ( = ?auto_1437575 ?auto_1437576 ) ) ( not ( = ?auto_1437575 ?auto_1437577 ) ) ( not ( = ?auto_1437575 ?auto_1437578 ) ) ( not ( = ?auto_1437575 ?auto_1437582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437576 ?auto_1437577 ?auto_1437578 )
      ( MAKE-8CRATE-VERIFY ?auto_1437570 ?auto_1437571 ?auto_1437572 ?auto_1437573 ?auto_1437574 ?auto_1437575 ?auto_1437576 ?auto_1437577 ?auto_1437578 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437663 - SURFACE
      ?auto_1437664 - SURFACE
      ?auto_1437665 - SURFACE
      ?auto_1437666 - SURFACE
      ?auto_1437667 - SURFACE
      ?auto_1437668 - SURFACE
      ?auto_1437669 - SURFACE
      ?auto_1437670 - SURFACE
      ?auto_1437671 - SURFACE
    )
    :vars
    (
      ?auto_1437673 - HOIST
      ?auto_1437676 - PLACE
      ?auto_1437677 - PLACE
      ?auto_1437672 - HOIST
      ?auto_1437675 - SURFACE
      ?auto_1437674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437673 ?auto_1437676 ) ( IS-CRATE ?auto_1437671 ) ( not ( = ?auto_1437670 ?auto_1437671 ) ) ( not ( = ?auto_1437669 ?auto_1437670 ) ) ( not ( = ?auto_1437669 ?auto_1437671 ) ) ( not ( = ?auto_1437677 ?auto_1437676 ) ) ( HOIST-AT ?auto_1437672 ?auto_1437677 ) ( not ( = ?auto_1437673 ?auto_1437672 ) ) ( AVAILABLE ?auto_1437672 ) ( SURFACE-AT ?auto_1437671 ?auto_1437677 ) ( ON ?auto_1437671 ?auto_1437675 ) ( CLEAR ?auto_1437671 ) ( not ( = ?auto_1437670 ?auto_1437675 ) ) ( not ( = ?auto_1437671 ?auto_1437675 ) ) ( not ( = ?auto_1437669 ?auto_1437675 ) ) ( TRUCK-AT ?auto_1437674 ?auto_1437676 ) ( SURFACE-AT ?auto_1437669 ?auto_1437676 ) ( CLEAR ?auto_1437669 ) ( LIFTING ?auto_1437673 ?auto_1437670 ) ( IS-CRATE ?auto_1437670 ) ( ON ?auto_1437664 ?auto_1437663 ) ( ON ?auto_1437665 ?auto_1437664 ) ( ON ?auto_1437666 ?auto_1437665 ) ( ON ?auto_1437667 ?auto_1437666 ) ( ON ?auto_1437668 ?auto_1437667 ) ( ON ?auto_1437669 ?auto_1437668 ) ( not ( = ?auto_1437663 ?auto_1437664 ) ) ( not ( = ?auto_1437663 ?auto_1437665 ) ) ( not ( = ?auto_1437663 ?auto_1437666 ) ) ( not ( = ?auto_1437663 ?auto_1437667 ) ) ( not ( = ?auto_1437663 ?auto_1437668 ) ) ( not ( = ?auto_1437663 ?auto_1437669 ) ) ( not ( = ?auto_1437663 ?auto_1437670 ) ) ( not ( = ?auto_1437663 ?auto_1437671 ) ) ( not ( = ?auto_1437663 ?auto_1437675 ) ) ( not ( = ?auto_1437664 ?auto_1437665 ) ) ( not ( = ?auto_1437664 ?auto_1437666 ) ) ( not ( = ?auto_1437664 ?auto_1437667 ) ) ( not ( = ?auto_1437664 ?auto_1437668 ) ) ( not ( = ?auto_1437664 ?auto_1437669 ) ) ( not ( = ?auto_1437664 ?auto_1437670 ) ) ( not ( = ?auto_1437664 ?auto_1437671 ) ) ( not ( = ?auto_1437664 ?auto_1437675 ) ) ( not ( = ?auto_1437665 ?auto_1437666 ) ) ( not ( = ?auto_1437665 ?auto_1437667 ) ) ( not ( = ?auto_1437665 ?auto_1437668 ) ) ( not ( = ?auto_1437665 ?auto_1437669 ) ) ( not ( = ?auto_1437665 ?auto_1437670 ) ) ( not ( = ?auto_1437665 ?auto_1437671 ) ) ( not ( = ?auto_1437665 ?auto_1437675 ) ) ( not ( = ?auto_1437666 ?auto_1437667 ) ) ( not ( = ?auto_1437666 ?auto_1437668 ) ) ( not ( = ?auto_1437666 ?auto_1437669 ) ) ( not ( = ?auto_1437666 ?auto_1437670 ) ) ( not ( = ?auto_1437666 ?auto_1437671 ) ) ( not ( = ?auto_1437666 ?auto_1437675 ) ) ( not ( = ?auto_1437667 ?auto_1437668 ) ) ( not ( = ?auto_1437667 ?auto_1437669 ) ) ( not ( = ?auto_1437667 ?auto_1437670 ) ) ( not ( = ?auto_1437667 ?auto_1437671 ) ) ( not ( = ?auto_1437667 ?auto_1437675 ) ) ( not ( = ?auto_1437668 ?auto_1437669 ) ) ( not ( = ?auto_1437668 ?auto_1437670 ) ) ( not ( = ?auto_1437668 ?auto_1437671 ) ) ( not ( = ?auto_1437668 ?auto_1437675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437669 ?auto_1437670 ?auto_1437671 )
      ( MAKE-8CRATE-VERIFY ?auto_1437663 ?auto_1437664 ?auto_1437665 ?auto_1437666 ?auto_1437667 ?auto_1437668 ?auto_1437669 ?auto_1437670 ?auto_1437671 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437756 - SURFACE
      ?auto_1437757 - SURFACE
      ?auto_1437758 - SURFACE
      ?auto_1437759 - SURFACE
      ?auto_1437760 - SURFACE
      ?auto_1437761 - SURFACE
      ?auto_1437762 - SURFACE
      ?auto_1437763 - SURFACE
      ?auto_1437764 - SURFACE
    )
    :vars
    (
      ?auto_1437769 - HOIST
      ?auto_1437770 - PLACE
      ?auto_1437766 - PLACE
      ?auto_1437768 - HOIST
      ?auto_1437765 - SURFACE
      ?auto_1437767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437769 ?auto_1437770 ) ( IS-CRATE ?auto_1437764 ) ( not ( = ?auto_1437763 ?auto_1437764 ) ) ( not ( = ?auto_1437762 ?auto_1437763 ) ) ( not ( = ?auto_1437762 ?auto_1437764 ) ) ( not ( = ?auto_1437766 ?auto_1437770 ) ) ( HOIST-AT ?auto_1437768 ?auto_1437766 ) ( not ( = ?auto_1437769 ?auto_1437768 ) ) ( AVAILABLE ?auto_1437768 ) ( SURFACE-AT ?auto_1437764 ?auto_1437766 ) ( ON ?auto_1437764 ?auto_1437765 ) ( CLEAR ?auto_1437764 ) ( not ( = ?auto_1437763 ?auto_1437765 ) ) ( not ( = ?auto_1437764 ?auto_1437765 ) ) ( not ( = ?auto_1437762 ?auto_1437765 ) ) ( TRUCK-AT ?auto_1437767 ?auto_1437770 ) ( SURFACE-AT ?auto_1437762 ?auto_1437770 ) ( CLEAR ?auto_1437762 ) ( IS-CRATE ?auto_1437763 ) ( AVAILABLE ?auto_1437769 ) ( IN ?auto_1437763 ?auto_1437767 ) ( ON ?auto_1437757 ?auto_1437756 ) ( ON ?auto_1437758 ?auto_1437757 ) ( ON ?auto_1437759 ?auto_1437758 ) ( ON ?auto_1437760 ?auto_1437759 ) ( ON ?auto_1437761 ?auto_1437760 ) ( ON ?auto_1437762 ?auto_1437761 ) ( not ( = ?auto_1437756 ?auto_1437757 ) ) ( not ( = ?auto_1437756 ?auto_1437758 ) ) ( not ( = ?auto_1437756 ?auto_1437759 ) ) ( not ( = ?auto_1437756 ?auto_1437760 ) ) ( not ( = ?auto_1437756 ?auto_1437761 ) ) ( not ( = ?auto_1437756 ?auto_1437762 ) ) ( not ( = ?auto_1437756 ?auto_1437763 ) ) ( not ( = ?auto_1437756 ?auto_1437764 ) ) ( not ( = ?auto_1437756 ?auto_1437765 ) ) ( not ( = ?auto_1437757 ?auto_1437758 ) ) ( not ( = ?auto_1437757 ?auto_1437759 ) ) ( not ( = ?auto_1437757 ?auto_1437760 ) ) ( not ( = ?auto_1437757 ?auto_1437761 ) ) ( not ( = ?auto_1437757 ?auto_1437762 ) ) ( not ( = ?auto_1437757 ?auto_1437763 ) ) ( not ( = ?auto_1437757 ?auto_1437764 ) ) ( not ( = ?auto_1437757 ?auto_1437765 ) ) ( not ( = ?auto_1437758 ?auto_1437759 ) ) ( not ( = ?auto_1437758 ?auto_1437760 ) ) ( not ( = ?auto_1437758 ?auto_1437761 ) ) ( not ( = ?auto_1437758 ?auto_1437762 ) ) ( not ( = ?auto_1437758 ?auto_1437763 ) ) ( not ( = ?auto_1437758 ?auto_1437764 ) ) ( not ( = ?auto_1437758 ?auto_1437765 ) ) ( not ( = ?auto_1437759 ?auto_1437760 ) ) ( not ( = ?auto_1437759 ?auto_1437761 ) ) ( not ( = ?auto_1437759 ?auto_1437762 ) ) ( not ( = ?auto_1437759 ?auto_1437763 ) ) ( not ( = ?auto_1437759 ?auto_1437764 ) ) ( not ( = ?auto_1437759 ?auto_1437765 ) ) ( not ( = ?auto_1437760 ?auto_1437761 ) ) ( not ( = ?auto_1437760 ?auto_1437762 ) ) ( not ( = ?auto_1437760 ?auto_1437763 ) ) ( not ( = ?auto_1437760 ?auto_1437764 ) ) ( not ( = ?auto_1437760 ?auto_1437765 ) ) ( not ( = ?auto_1437761 ?auto_1437762 ) ) ( not ( = ?auto_1437761 ?auto_1437763 ) ) ( not ( = ?auto_1437761 ?auto_1437764 ) ) ( not ( = ?auto_1437761 ?auto_1437765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437762 ?auto_1437763 ?auto_1437764 )
      ( MAKE-8CRATE-VERIFY ?auto_1437756 ?auto_1437757 ?auto_1437758 ?auto_1437759 ?auto_1437760 ?auto_1437761 ?auto_1437762 ?auto_1437763 ?auto_1437764 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441872 - SURFACE
      ?auto_1441873 - SURFACE
      ?auto_1441874 - SURFACE
      ?auto_1441875 - SURFACE
      ?auto_1441876 - SURFACE
      ?auto_1441877 - SURFACE
      ?auto_1441878 - SURFACE
      ?auto_1441879 - SURFACE
      ?auto_1441880 - SURFACE
      ?auto_1441881 - SURFACE
    )
    :vars
    (
      ?auto_1441883 - HOIST
      ?auto_1441882 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441883 ?auto_1441882 ) ( SURFACE-AT ?auto_1441880 ?auto_1441882 ) ( CLEAR ?auto_1441880 ) ( LIFTING ?auto_1441883 ?auto_1441881 ) ( IS-CRATE ?auto_1441881 ) ( not ( = ?auto_1441880 ?auto_1441881 ) ) ( ON ?auto_1441873 ?auto_1441872 ) ( ON ?auto_1441874 ?auto_1441873 ) ( ON ?auto_1441875 ?auto_1441874 ) ( ON ?auto_1441876 ?auto_1441875 ) ( ON ?auto_1441877 ?auto_1441876 ) ( ON ?auto_1441878 ?auto_1441877 ) ( ON ?auto_1441879 ?auto_1441878 ) ( ON ?auto_1441880 ?auto_1441879 ) ( not ( = ?auto_1441872 ?auto_1441873 ) ) ( not ( = ?auto_1441872 ?auto_1441874 ) ) ( not ( = ?auto_1441872 ?auto_1441875 ) ) ( not ( = ?auto_1441872 ?auto_1441876 ) ) ( not ( = ?auto_1441872 ?auto_1441877 ) ) ( not ( = ?auto_1441872 ?auto_1441878 ) ) ( not ( = ?auto_1441872 ?auto_1441879 ) ) ( not ( = ?auto_1441872 ?auto_1441880 ) ) ( not ( = ?auto_1441872 ?auto_1441881 ) ) ( not ( = ?auto_1441873 ?auto_1441874 ) ) ( not ( = ?auto_1441873 ?auto_1441875 ) ) ( not ( = ?auto_1441873 ?auto_1441876 ) ) ( not ( = ?auto_1441873 ?auto_1441877 ) ) ( not ( = ?auto_1441873 ?auto_1441878 ) ) ( not ( = ?auto_1441873 ?auto_1441879 ) ) ( not ( = ?auto_1441873 ?auto_1441880 ) ) ( not ( = ?auto_1441873 ?auto_1441881 ) ) ( not ( = ?auto_1441874 ?auto_1441875 ) ) ( not ( = ?auto_1441874 ?auto_1441876 ) ) ( not ( = ?auto_1441874 ?auto_1441877 ) ) ( not ( = ?auto_1441874 ?auto_1441878 ) ) ( not ( = ?auto_1441874 ?auto_1441879 ) ) ( not ( = ?auto_1441874 ?auto_1441880 ) ) ( not ( = ?auto_1441874 ?auto_1441881 ) ) ( not ( = ?auto_1441875 ?auto_1441876 ) ) ( not ( = ?auto_1441875 ?auto_1441877 ) ) ( not ( = ?auto_1441875 ?auto_1441878 ) ) ( not ( = ?auto_1441875 ?auto_1441879 ) ) ( not ( = ?auto_1441875 ?auto_1441880 ) ) ( not ( = ?auto_1441875 ?auto_1441881 ) ) ( not ( = ?auto_1441876 ?auto_1441877 ) ) ( not ( = ?auto_1441876 ?auto_1441878 ) ) ( not ( = ?auto_1441876 ?auto_1441879 ) ) ( not ( = ?auto_1441876 ?auto_1441880 ) ) ( not ( = ?auto_1441876 ?auto_1441881 ) ) ( not ( = ?auto_1441877 ?auto_1441878 ) ) ( not ( = ?auto_1441877 ?auto_1441879 ) ) ( not ( = ?auto_1441877 ?auto_1441880 ) ) ( not ( = ?auto_1441877 ?auto_1441881 ) ) ( not ( = ?auto_1441878 ?auto_1441879 ) ) ( not ( = ?auto_1441878 ?auto_1441880 ) ) ( not ( = ?auto_1441878 ?auto_1441881 ) ) ( not ( = ?auto_1441879 ?auto_1441880 ) ) ( not ( = ?auto_1441879 ?auto_1441881 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1441880 ?auto_1441881 )
      ( MAKE-9CRATE-VERIFY ?auto_1441872 ?auto_1441873 ?auto_1441874 ?auto_1441875 ?auto_1441876 ?auto_1441877 ?auto_1441878 ?auto_1441879 ?auto_1441880 ?auto_1441881 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441952 - SURFACE
      ?auto_1441953 - SURFACE
      ?auto_1441954 - SURFACE
      ?auto_1441955 - SURFACE
      ?auto_1441956 - SURFACE
      ?auto_1441957 - SURFACE
      ?auto_1441958 - SURFACE
      ?auto_1441959 - SURFACE
      ?auto_1441960 - SURFACE
      ?auto_1441961 - SURFACE
    )
    :vars
    (
      ?auto_1441962 - HOIST
      ?auto_1441963 - PLACE
      ?auto_1441964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441962 ?auto_1441963 ) ( SURFACE-AT ?auto_1441960 ?auto_1441963 ) ( CLEAR ?auto_1441960 ) ( IS-CRATE ?auto_1441961 ) ( not ( = ?auto_1441960 ?auto_1441961 ) ) ( TRUCK-AT ?auto_1441964 ?auto_1441963 ) ( AVAILABLE ?auto_1441962 ) ( IN ?auto_1441961 ?auto_1441964 ) ( ON ?auto_1441960 ?auto_1441959 ) ( not ( = ?auto_1441959 ?auto_1441960 ) ) ( not ( = ?auto_1441959 ?auto_1441961 ) ) ( ON ?auto_1441953 ?auto_1441952 ) ( ON ?auto_1441954 ?auto_1441953 ) ( ON ?auto_1441955 ?auto_1441954 ) ( ON ?auto_1441956 ?auto_1441955 ) ( ON ?auto_1441957 ?auto_1441956 ) ( ON ?auto_1441958 ?auto_1441957 ) ( ON ?auto_1441959 ?auto_1441958 ) ( not ( = ?auto_1441952 ?auto_1441953 ) ) ( not ( = ?auto_1441952 ?auto_1441954 ) ) ( not ( = ?auto_1441952 ?auto_1441955 ) ) ( not ( = ?auto_1441952 ?auto_1441956 ) ) ( not ( = ?auto_1441952 ?auto_1441957 ) ) ( not ( = ?auto_1441952 ?auto_1441958 ) ) ( not ( = ?auto_1441952 ?auto_1441959 ) ) ( not ( = ?auto_1441952 ?auto_1441960 ) ) ( not ( = ?auto_1441952 ?auto_1441961 ) ) ( not ( = ?auto_1441953 ?auto_1441954 ) ) ( not ( = ?auto_1441953 ?auto_1441955 ) ) ( not ( = ?auto_1441953 ?auto_1441956 ) ) ( not ( = ?auto_1441953 ?auto_1441957 ) ) ( not ( = ?auto_1441953 ?auto_1441958 ) ) ( not ( = ?auto_1441953 ?auto_1441959 ) ) ( not ( = ?auto_1441953 ?auto_1441960 ) ) ( not ( = ?auto_1441953 ?auto_1441961 ) ) ( not ( = ?auto_1441954 ?auto_1441955 ) ) ( not ( = ?auto_1441954 ?auto_1441956 ) ) ( not ( = ?auto_1441954 ?auto_1441957 ) ) ( not ( = ?auto_1441954 ?auto_1441958 ) ) ( not ( = ?auto_1441954 ?auto_1441959 ) ) ( not ( = ?auto_1441954 ?auto_1441960 ) ) ( not ( = ?auto_1441954 ?auto_1441961 ) ) ( not ( = ?auto_1441955 ?auto_1441956 ) ) ( not ( = ?auto_1441955 ?auto_1441957 ) ) ( not ( = ?auto_1441955 ?auto_1441958 ) ) ( not ( = ?auto_1441955 ?auto_1441959 ) ) ( not ( = ?auto_1441955 ?auto_1441960 ) ) ( not ( = ?auto_1441955 ?auto_1441961 ) ) ( not ( = ?auto_1441956 ?auto_1441957 ) ) ( not ( = ?auto_1441956 ?auto_1441958 ) ) ( not ( = ?auto_1441956 ?auto_1441959 ) ) ( not ( = ?auto_1441956 ?auto_1441960 ) ) ( not ( = ?auto_1441956 ?auto_1441961 ) ) ( not ( = ?auto_1441957 ?auto_1441958 ) ) ( not ( = ?auto_1441957 ?auto_1441959 ) ) ( not ( = ?auto_1441957 ?auto_1441960 ) ) ( not ( = ?auto_1441957 ?auto_1441961 ) ) ( not ( = ?auto_1441958 ?auto_1441959 ) ) ( not ( = ?auto_1441958 ?auto_1441960 ) ) ( not ( = ?auto_1441958 ?auto_1441961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441959 ?auto_1441960 ?auto_1441961 )
      ( MAKE-9CRATE-VERIFY ?auto_1441952 ?auto_1441953 ?auto_1441954 ?auto_1441955 ?auto_1441956 ?auto_1441957 ?auto_1441958 ?auto_1441959 ?auto_1441960 ?auto_1441961 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442042 - SURFACE
      ?auto_1442043 - SURFACE
      ?auto_1442044 - SURFACE
      ?auto_1442045 - SURFACE
      ?auto_1442046 - SURFACE
      ?auto_1442047 - SURFACE
      ?auto_1442048 - SURFACE
      ?auto_1442049 - SURFACE
      ?auto_1442050 - SURFACE
      ?auto_1442051 - SURFACE
    )
    :vars
    (
      ?auto_1442055 - HOIST
      ?auto_1442053 - PLACE
      ?auto_1442052 - TRUCK
      ?auto_1442054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442055 ?auto_1442053 ) ( SURFACE-AT ?auto_1442050 ?auto_1442053 ) ( CLEAR ?auto_1442050 ) ( IS-CRATE ?auto_1442051 ) ( not ( = ?auto_1442050 ?auto_1442051 ) ) ( AVAILABLE ?auto_1442055 ) ( IN ?auto_1442051 ?auto_1442052 ) ( ON ?auto_1442050 ?auto_1442049 ) ( not ( = ?auto_1442049 ?auto_1442050 ) ) ( not ( = ?auto_1442049 ?auto_1442051 ) ) ( TRUCK-AT ?auto_1442052 ?auto_1442054 ) ( not ( = ?auto_1442054 ?auto_1442053 ) ) ( ON ?auto_1442043 ?auto_1442042 ) ( ON ?auto_1442044 ?auto_1442043 ) ( ON ?auto_1442045 ?auto_1442044 ) ( ON ?auto_1442046 ?auto_1442045 ) ( ON ?auto_1442047 ?auto_1442046 ) ( ON ?auto_1442048 ?auto_1442047 ) ( ON ?auto_1442049 ?auto_1442048 ) ( not ( = ?auto_1442042 ?auto_1442043 ) ) ( not ( = ?auto_1442042 ?auto_1442044 ) ) ( not ( = ?auto_1442042 ?auto_1442045 ) ) ( not ( = ?auto_1442042 ?auto_1442046 ) ) ( not ( = ?auto_1442042 ?auto_1442047 ) ) ( not ( = ?auto_1442042 ?auto_1442048 ) ) ( not ( = ?auto_1442042 ?auto_1442049 ) ) ( not ( = ?auto_1442042 ?auto_1442050 ) ) ( not ( = ?auto_1442042 ?auto_1442051 ) ) ( not ( = ?auto_1442043 ?auto_1442044 ) ) ( not ( = ?auto_1442043 ?auto_1442045 ) ) ( not ( = ?auto_1442043 ?auto_1442046 ) ) ( not ( = ?auto_1442043 ?auto_1442047 ) ) ( not ( = ?auto_1442043 ?auto_1442048 ) ) ( not ( = ?auto_1442043 ?auto_1442049 ) ) ( not ( = ?auto_1442043 ?auto_1442050 ) ) ( not ( = ?auto_1442043 ?auto_1442051 ) ) ( not ( = ?auto_1442044 ?auto_1442045 ) ) ( not ( = ?auto_1442044 ?auto_1442046 ) ) ( not ( = ?auto_1442044 ?auto_1442047 ) ) ( not ( = ?auto_1442044 ?auto_1442048 ) ) ( not ( = ?auto_1442044 ?auto_1442049 ) ) ( not ( = ?auto_1442044 ?auto_1442050 ) ) ( not ( = ?auto_1442044 ?auto_1442051 ) ) ( not ( = ?auto_1442045 ?auto_1442046 ) ) ( not ( = ?auto_1442045 ?auto_1442047 ) ) ( not ( = ?auto_1442045 ?auto_1442048 ) ) ( not ( = ?auto_1442045 ?auto_1442049 ) ) ( not ( = ?auto_1442045 ?auto_1442050 ) ) ( not ( = ?auto_1442045 ?auto_1442051 ) ) ( not ( = ?auto_1442046 ?auto_1442047 ) ) ( not ( = ?auto_1442046 ?auto_1442048 ) ) ( not ( = ?auto_1442046 ?auto_1442049 ) ) ( not ( = ?auto_1442046 ?auto_1442050 ) ) ( not ( = ?auto_1442046 ?auto_1442051 ) ) ( not ( = ?auto_1442047 ?auto_1442048 ) ) ( not ( = ?auto_1442047 ?auto_1442049 ) ) ( not ( = ?auto_1442047 ?auto_1442050 ) ) ( not ( = ?auto_1442047 ?auto_1442051 ) ) ( not ( = ?auto_1442048 ?auto_1442049 ) ) ( not ( = ?auto_1442048 ?auto_1442050 ) ) ( not ( = ?auto_1442048 ?auto_1442051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442049 ?auto_1442050 ?auto_1442051 )
      ( MAKE-9CRATE-VERIFY ?auto_1442042 ?auto_1442043 ?auto_1442044 ?auto_1442045 ?auto_1442046 ?auto_1442047 ?auto_1442048 ?auto_1442049 ?auto_1442050 ?auto_1442051 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442141 - SURFACE
      ?auto_1442142 - SURFACE
      ?auto_1442143 - SURFACE
      ?auto_1442144 - SURFACE
      ?auto_1442145 - SURFACE
      ?auto_1442146 - SURFACE
      ?auto_1442147 - SURFACE
      ?auto_1442148 - SURFACE
      ?auto_1442149 - SURFACE
      ?auto_1442150 - SURFACE
    )
    :vars
    (
      ?auto_1442154 - HOIST
      ?auto_1442152 - PLACE
      ?auto_1442151 - TRUCK
      ?auto_1442153 - PLACE
      ?auto_1442155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442154 ?auto_1442152 ) ( SURFACE-AT ?auto_1442149 ?auto_1442152 ) ( CLEAR ?auto_1442149 ) ( IS-CRATE ?auto_1442150 ) ( not ( = ?auto_1442149 ?auto_1442150 ) ) ( AVAILABLE ?auto_1442154 ) ( ON ?auto_1442149 ?auto_1442148 ) ( not ( = ?auto_1442148 ?auto_1442149 ) ) ( not ( = ?auto_1442148 ?auto_1442150 ) ) ( TRUCK-AT ?auto_1442151 ?auto_1442153 ) ( not ( = ?auto_1442153 ?auto_1442152 ) ) ( HOIST-AT ?auto_1442155 ?auto_1442153 ) ( LIFTING ?auto_1442155 ?auto_1442150 ) ( not ( = ?auto_1442154 ?auto_1442155 ) ) ( ON ?auto_1442142 ?auto_1442141 ) ( ON ?auto_1442143 ?auto_1442142 ) ( ON ?auto_1442144 ?auto_1442143 ) ( ON ?auto_1442145 ?auto_1442144 ) ( ON ?auto_1442146 ?auto_1442145 ) ( ON ?auto_1442147 ?auto_1442146 ) ( ON ?auto_1442148 ?auto_1442147 ) ( not ( = ?auto_1442141 ?auto_1442142 ) ) ( not ( = ?auto_1442141 ?auto_1442143 ) ) ( not ( = ?auto_1442141 ?auto_1442144 ) ) ( not ( = ?auto_1442141 ?auto_1442145 ) ) ( not ( = ?auto_1442141 ?auto_1442146 ) ) ( not ( = ?auto_1442141 ?auto_1442147 ) ) ( not ( = ?auto_1442141 ?auto_1442148 ) ) ( not ( = ?auto_1442141 ?auto_1442149 ) ) ( not ( = ?auto_1442141 ?auto_1442150 ) ) ( not ( = ?auto_1442142 ?auto_1442143 ) ) ( not ( = ?auto_1442142 ?auto_1442144 ) ) ( not ( = ?auto_1442142 ?auto_1442145 ) ) ( not ( = ?auto_1442142 ?auto_1442146 ) ) ( not ( = ?auto_1442142 ?auto_1442147 ) ) ( not ( = ?auto_1442142 ?auto_1442148 ) ) ( not ( = ?auto_1442142 ?auto_1442149 ) ) ( not ( = ?auto_1442142 ?auto_1442150 ) ) ( not ( = ?auto_1442143 ?auto_1442144 ) ) ( not ( = ?auto_1442143 ?auto_1442145 ) ) ( not ( = ?auto_1442143 ?auto_1442146 ) ) ( not ( = ?auto_1442143 ?auto_1442147 ) ) ( not ( = ?auto_1442143 ?auto_1442148 ) ) ( not ( = ?auto_1442143 ?auto_1442149 ) ) ( not ( = ?auto_1442143 ?auto_1442150 ) ) ( not ( = ?auto_1442144 ?auto_1442145 ) ) ( not ( = ?auto_1442144 ?auto_1442146 ) ) ( not ( = ?auto_1442144 ?auto_1442147 ) ) ( not ( = ?auto_1442144 ?auto_1442148 ) ) ( not ( = ?auto_1442144 ?auto_1442149 ) ) ( not ( = ?auto_1442144 ?auto_1442150 ) ) ( not ( = ?auto_1442145 ?auto_1442146 ) ) ( not ( = ?auto_1442145 ?auto_1442147 ) ) ( not ( = ?auto_1442145 ?auto_1442148 ) ) ( not ( = ?auto_1442145 ?auto_1442149 ) ) ( not ( = ?auto_1442145 ?auto_1442150 ) ) ( not ( = ?auto_1442146 ?auto_1442147 ) ) ( not ( = ?auto_1442146 ?auto_1442148 ) ) ( not ( = ?auto_1442146 ?auto_1442149 ) ) ( not ( = ?auto_1442146 ?auto_1442150 ) ) ( not ( = ?auto_1442147 ?auto_1442148 ) ) ( not ( = ?auto_1442147 ?auto_1442149 ) ) ( not ( = ?auto_1442147 ?auto_1442150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442148 ?auto_1442149 ?auto_1442150 )
      ( MAKE-9CRATE-VERIFY ?auto_1442141 ?auto_1442142 ?auto_1442143 ?auto_1442144 ?auto_1442145 ?auto_1442146 ?auto_1442147 ?auto_1442148 ?auto_1442149 ?auto_1442150 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442249 - SURFACE
      ?auto_1442250 - SURFACE
      ?auto_1442251 - SURFACE
      ?auto_1442252 - SURFACE
      ?auto_1442253 - SURFACE
      ?auto_1442254 - SURFACE
      ?auto_1442255 - SURFACE
      ?auto_1442256 - SURFACE
      ?auto_1442257 - SURFACE
      ?auto_1442258 - SURFACE
    )
    :vars
    (
      ?auto_1442259 - HOIST
      ?auto_1442261 - PLACE
      ?auto_1442264 - TRUCK
      ?auto_1442263 - PLACE
      ?auto_1442260 - HOIST
      ?auto_1442262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442259 ?auto_1442261 ) ( SURFACE-AT ?auto_1442257 ?auto_1442261 ) ( CLEAR ?auto_1442257 ) ( IS-CRATE ?auto_1442258 ) ( not ( = ?auto_1442257 ?auto_1442258 ) ) ( AVAILABLE ?auto_1442259 ) ( ON ?auto_1442257 ?auto_1442256 ) ( not ( = ?auto_1442256 ?auto_1442257 ) ) ( not ( = ?auto_1442256 ?auto_1442258 ) ) ( TRUCK-AT ?auto_1442264 ?auto_1442263 ) ( not ( = ?auto_1442263 ?auto_1442261 ) ) ( HOIST-AT ?auto_1442260 ?auto_1442263 ) ( not ( = ?auto_1442259 ?auto_1442260 ) ) ( AVAILABLE ?auto_1442260 ) ( SURFACE-AT ?auto_1442258 ?auto_1442263 ) ( ON ?auto_1442258 ?auto_1442262 ) ( CLEAR ?auto_1442258 ) ( not ( = ?auto_1442257 ?auto_1442262 ) ) ( not ( = ?auto_1442258 ?auto_1442262 ) ) ( not ( = ?auto_1442256 ?auto_1442262 ) ) ( ON ?auto_1442250 ?auto_1442249 ) ( ON ?auto_1442251 ?auto_1442250 ) ( ON ?auto_1442252 ?auto_1442251 ) ( ON ?auto_1442253 ?auto_1442252 ) ( ON ?auto_1442254 ?auto_1442253 ) ( ON ?auto_1442255 ?auto_1442254 ) ( ON ?auto_1442256 ?auto_1442255 ) ( not ( = ?auto_1442249 ?auto_1442250 ) ) ( not ( = ?auto_1442249 ?auto_1442251 ) ) ( not ( = ?auto_1442249 ?auto_1442252 ) ) ( not ( = ?auto_1442249 ?auto_1442253 ) ) ( not ( = ?auto_1442249 ?auto_1442254 ) ) ( not ( = ?auto_1442249 ?auto_1442255 ) ) ( not ( = ?auto_1442249 ?auto_1442256 ) ) ( not ( = ?auto_1442249 ?auto_1442257 ) ) ( not ( = ?auto_1442249 ?auto_1442258 ) ) ( not ( = ?auto_1442249 ?auto_1442262 ) ) ( not ( = ?auto_1442250 ?auto_1442251 ) ) ( not ( = ?auto_1442250 ?auto_1442252 ) ) ( not ( = ?auto_1442250 ?auto_1442253 ) ) ( not ( = ?auto_1442250 ?auto_1442254 ) ) ( not ( = ?auto_1442250 ?auto_1442255 ) ) ( not ( = ?auto_1442250 ?auto_1442256 ) ) ( not ( = ?auto_1442250 ?auto_1442257 ) ) ( not ( = ?auto_1442250 ?auto_1442258 ) ) ( not ( = ?auto_1442250 ?auto_1442262 ) ) ( not ( = ?auto_1442251 ?auto_1442252 ) ) ( not ( = ?auto_1442251 ?auto_1442253 ) ) ( not ( = ?auto_1442251 ?auto_1442254 ) ) ( not ( = ?auto_1442251 ?auto_1442255 ) ) ( not ( = ?auto_1442251 ?auto_1442256 ) ) ( not ( = ?auto_1442251 ?auto_1442257 ) ) ( not ( = ?auto_1442251 ?auto_1442258 ) ) ( not ( = ?auto_1442251 ?auto_1442262 ) ) ( not ( = ?auto_1442252 ?auto_1442253 ) ) ( not ( = ?auto_1442252 ?auto_1442254 ) ) ( not ( = ?auto_1442252 ?auto_1442255 ) ) ( not ( = ?auto_1442252 ?auto_1442256 ) ) ( not ( = ?auto_1442252 ?auto_1442257 ) ) ( not ( = ?auto_1442252 ?auto_1442258 ) ) ( not ( = ?auto_1442252 ?auto_1442262 ) ) ( not ( = ?auto_1442253 ?auto_1442254 ) ) ( not ( = ?auto_1442253 ?auto_1442255 ) ) ( not ( = ?auto_1442253 ?auto_1442256 ) ) ( not ( = ?auto_1442253 ?auto_1442257 ) ) ( not ( = ?auto_1442253 ?auto_1442258 ) ) ( not ( = ?auto_1442253 ?auto_1442262 ) ) ( not ( = ?auto_1442254 ?auto_1442255 ) ) ( not ( = ?auto_1442254 ?auto_1442256 ) ) ( not ( = ?auto_1442254 ?auto_1442257 ) ) ( not ( = ?auto_1442254 ?auto_1442258 ) ) ( not ( = ?auto_1442254 ?auto_1442262 ) ) ( not ( = ?auto_1442255 ?auto_1442256 ) ) ( not ( = ?auto_1442255 ?auto_1442257 ) ) ( not ( = ?auto_1442255 ?auto_1442258 ) ) ( not ( = ?auto_1442255 ?auto_1442262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442256 ?auto_1442257 ?auto_1442258 )
      ( MAKE-9CRATE-VERIFY ?auto_1442249 ?auto_1442250 ?auto_1442251 ?auto_1442252 ?auto_1442253 ?auto_1442254 ?auto_1442255 ?auto_1442256 ?auto_1442257 ?auto_1442258 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442358 - SURFACE
      ?auto_1442359 - SURFACE
      ?auto_1442360 - SURFACE
      ?auto_1442361 - SURFACE
      ?auto_1442362 - SURFACE
      ?auto_1442363 - SURFACE
      ?auto_1442364 - SURFACE
      ?auto_1442365 - SURFACE
      ?auto_1442366 - SURFACE
      ?auto_1442367 - SURFACE
    )
    :vars
    (
      ?auto_1442369 - HOIST
      ?auto_1442373 - PLACE
      ?auto_1442370 - PLACE
      ?auto_1442371 - HOIST
      ?auto_1442372 - SURFACE
      ?auto_1442368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442369 ?auto_1442373 ) ( SURFACE-AT ?auto_1442366 ?auto_1442373 ) ( CLEAR ?auto_1442366 ) ( IS-CRATE ?auto_1442367 ) ( not ( = ?auto_1442366 ?auto_1442367 ) ) ( AVAILABLE ?auto_1442369 ) ( ON ?auto_1442366 ?auto_1442365 ) ( not ( = ?auto_1442365 ?auto_1442366 ) ) ( not ( = ?auto_1442365 ?auto_1442367 ) ) ( not ( = ?auto_1442370 ?auto_1442373 ) ) ( HOIST-AT ?auto_1442371 ?auto_1442370 ) ( not ( = ?auto_1442369 ?auto_1442371 ) ) ( AVAILABLE ?auto_1442371 ) ( SURFACE-AT ?auto_1442367 ?auto_1442370 ) ( ON ?auto_1442367 ?auto_1442372 ) ( CLEAR ?auto_1442367 ) ( not ( = ?auto_1442366 ?auto_1442372 ) ) ( not ( = ?auto_1442367 ?auto_1442372 ) ) ( not ( = ?auto_1442365 ?auto_1442372 ) ) ( TRUCK-AT ?auto_1442368 ?auto_1442373 ) ( ON ?auto_1442359 ?auto_1442358 ) ( ON ?auto_1442360 ?auto_1442359 ) ( ON ?auto_1442361 ?auto_1442360 ) ( ON ?auto_1442362 ?auto_1442361 ) ( ON ?auto_1442363 ?auto_1442362 ) ( ON ?auto_1442364 ?auto_1442363 ) ( ON ?auto_1442365 ?auto_1442364 ) ( not ( = ?auto_1442358 ?auto_1442359 ) ) ( not ( = ?auto_1442358 ?auto_1442360 ) ) ( not ( = ?auto_1442358 ?auto_1442361 ) ) ( not ( = ?auto_1442358 ?auto_1442362 ) ) ( not ( = ?auto_1442358 ?auto_1442363 ) ) ( not ( = ?auto_1442358 ?auto_1442364 ) ) ( not ( = ?auto_1442358 ?auto_1442365 ) ) ( not ( = ?auto_1442358 ?auto_1442366 ) ) ( not ( = ?auto_1442358 ?auto_1442367 ) ) ( not ( = ?auto_1442358 ?auto_1442372 ) ) ( not ( = ?auto_1442359 ?auto_1442360 ) ) ( not ( = ?auto_1442359 ?auto_1442361 ) ) ( not ( = ?auto_1442359 ?auto_1442362 ) ) ( not ( = ?auto_1442359 ?auto_1442363 ) ) ( not ( = ?auto_1442359 ?auto_1442364 ) ) ( not ( = ?auto_1442359 ?auto_1442365 ) ) ( not ( = ?auto_1442359 ?auto_1442366 ) ) ( not ( = ?auto_1442359 ?auto_1442367 ) ) ( not ( = ?auto_1442359 ?auto_1442372 ) ) ( not ( = ?auto_1442360 ?auto_1442361 ) ) ( not ( = ?auto_1442360 ?auto_1442362 ) ) ( not ( = ?auto_1442360 ?auto_1442363 ) ) ( not ( = ?auto_1442360 ?auto_1442364 ) ) ( not ( = ?auto_1442360 ?auto_1442365 ) ) ( not ( = ?auto_1442360 ?auto_1442366 ) ) ( not ( = ?auto_1442360 ?auto_1442367 ) ) ( not ( = ?auto_1442360 ?auto_1442372 ) ) ( not ( = ?auto_1442361 ?auto_1442362 ) ) ( not ( = ?auto_1442361 ?auto_1442363 ) ) ( not ( = ?auto_1442361 ?auto_1442364 ) ) ( not ( = ?auto_1442361 ?auto_1442365 ) ) ( not ( = ?auto_1442361 ?auto_1442366 ) ) ( not ( = ?auto_1442361 ?auto_1442367 ) ) ( not ( = ?auto_1442361 ?auto_1442372 ) ) ( not ( = ?auto_1442362 ?auto_1442363 ) ) ( not ( = ?auto_1442362 ?auto_1442364 ) ) ( not ( = ?auto_1442362 ?auto_1442365 ) ) ( not ( = ?auto_1442362 ?auto_1442366 ) ) ( not ( = ?auto_1442362 ?auto_1442367 ) ) ( not ( = ?auto_1442362 ?auto_1442372 ) ) ( not ( = ?auto_1442363 ?auto_1442364 ) ) ( not ( = ?auto_1442363 ?auto_1442365 ) ) ( not ( = ?auto_1442363 ?auto_1442366 ) ) ( not ( = ?auto_1442363 ?auto_1442367 ) ) ( not ( = ?auto_1442363 ?auto_1442372 ) ) ( not ( = ?auto_1442364 ?auto_1442365 ) ) ( not ( = ?auto_1442364 ?auto_1442366 ) ) ( not ( = ?auto_1442364 ?auto_1442367 ) ) ( not ( = ?auto_1442364 ?auto_1442372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442365 ?auto_1442366 ?auto_1442367 )
      ( MAKE-9CRATE-VERIFY ?auto_1442358 ?auto_1442359 ?auto_1442360 ?auto_1442361 ?auto_1442362 ?auto_1442363 ?auto_1442364 ?auto_1442365 ?auto_1442366 ?auto_1442367 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442467 - SURFACE
      ?auto_1442468 - SURFACE
      ?auto_1442469 - SURFACE
      ?auto_1442470 - SURFACE
      ?auto_1442471 - SURFACE
      ?auto_1442472 - SURFACE
      ?auto_1442473 - SURFACE
      ?auto_1442474 - SURFACE
      ?auto_1442475 - SURFACE
      ?auto_1442476 - SURFACE
    )
    :vars
    (
      ?auto_1442480 - HOIST
      ?auto_1442477 - PLACE
      ?auto_1442481 - PLACE
      ?auto_1442482 - HOIST
      ?auto_1442478 - SURFACE
      ?auto_1442479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442480 ?auto_1442477 ) ( IS-CRATE ?auto_1442476 ) ( not ( = ?auto_1442475 ?auto_1442476 ) ) ( not ( = ?auto_1442474 ?auto_1442475 ) ) ( not ( = ?auto_1442474 ?auto_1442476 ) ) ( not ( = ?auto_1442481 ?auto_1442477 ) ) ( HOIST-AT ?auto_1442482 ?auto_1442481 ) ( not ( = ?auto_1442480 ?auto_1442482 ) ) ( AVAILABLE ?auto_1442482 ) ( SURFACE-AT ?auto_1442476 ?auto_1442481 ) ( ON ?auto_1442476 ?auto_1442478 ) ( CLEAR ?auto_1442476 ) ( not ( = ?auto_1442475 ?auto_1442478 ) ) ( not ( = ?auto_1442476 ?auto_1442478 ) ) ( not ( = ?auto_1442474 ?auto_1442478 ) ) ( TRUCK-AT ?auto_1442479 ?auto_1442477 ) ( SURFACE-AT ?auto_1442474 ?auto_1442477 ) ( CLEAR ?auto_1442474 ) ( LIFTING ?auto_1442480 ?auto_1442475 ) ( IS-CRATE ?auto_1442475 ) ( ON ?auto_1442468 ?auto_1442467 ) ( ON ?auto_1442469 ?auto_1442468 ) ( ON ?auto_1442470 ?auto_1442469 ) ( ON ?auto_1442471 ?auto_1442470 ) ( ON ?auto_1442472 ?auto_1442471 ) ( ON ?auto_1442473 ?auto_1442472 ) ( ON ?auto_1442474 ?auto_1442473 ) ( not ( = ?auto_1442467 ?auto_1442468 ) ) ( not ( = ?auto_1442467 ?auto_1442469 ) ) ( not ( = ?auto_1442467 ?auto_1442470 ) ) ( not ( = ?auto_1442467 ?auto_1442471 ) ) ( not ( = ?auto_1442467 ?auto_1442472 ) ) ( not ( = ?auto_1442467 ?auto_1442473 ) ) ( not ( = ?auto_1442467 ?auto_1442474 ) ) ( not ( = ?auto_1442467 ?auto_1442475 ) ) ( not ( = ?auto_1442467 ?auto_1442476 ) ) ( not ( = ?auto_1442467 ?auto_1442478 ) ) ( not ( = ?auto_1442468 ?auto_1442469 ) ) ( not ( = ?auto_1442468 ?auto_1442470 ) ) ( not ( = ?auto_1442468 ?auto_1442471 ) ) ( not ( = ?auto_1442468 ?auto_1442472 ) ) ( not ( = ?auto_1442468 ?auto_1442473 ) ) ( not ( = ?auto_1442468 ?auto_1442474 ) ) ( not ( = ?auto_1442468 ?auto_1442475 ) ) ( not ( = ?auto_1442468 ?auto_1442476 ) ) ( not ( = ?auto_1442468 ?auto_1442478 ) ) ( not ( = ?auto_1442469 ?auto_1442470 ) ) ( not ( = ?auto_1442469 ?auto_1442471 ) ) ( not ( = ?auto_1442469 ?auto_1442472 ) ) ( not ( = ?auto_1442469 ?auto_1442473 ) ) ( not ( = ?auto_1442469 ?auto_1442474 ) ) ( not ( = ?auto_1442469 ?auto_1442475 ) ) ( not ( = ?auto_1442469 ?auto_1442476 ) ) ( not ( = ?auto_1442469 ?auto_1442478 ) ) ( not ( = ?auto_1442470 ?auto_1442471 ) ) ( not ( = ?auto_1442470 ?auto_1442472 ) ) ( not ( = ?auto_1442470 ?auto_1442473 ) ) ( not ( = ?auto_1442470 ?auto_1442474 ) ) ( not ( = ?auto_1442470 ?auto_1442475 ) ) ( not ( = ?auto_1442470 ?auto_1442476 ) ) ( not ( = ?auto_1442470 ?auto_1442478 ) ) ( not ( = ?auto_1442471 ?auto_1442472 ) ) ( not ( = ?auto_1442471 ?auto_1442473 ) ) ( not ( = ?auto_1442471 ?auto_1442474 ) ) ( not ( = ?auto_1442471 ?auto_1442475 ) ) ( not ( = ?auto_1442471 ?auto_1442476 ) ) ( not ( = ?auto_1442471 ?auto_1442478 ) ) ( not ( = ?auto_1442472 ?auto_1442473 ) ) ( not ( = ?auto_1442472 ?auto_1442474 ) ) ( not ( = ?auto_1442472 ?auto_1442475 ) ) ( not ( = ?auto_1442472 ?auto_1442476 ) ) ( not ( = ?auto_1442472 ?auto_1442478 ) ) ( not ( = ?auto_1442473 ?auto_1442474 ) ) ( not ( = ?auto_1442473 ?auto_1442475 ) ) ( not ( = ?auto_1442473 ?auto_1442476 ) ) ( not ( = ?auto_1442473 ?auto_1442478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442474 ?auto_1442475 ?auto_1442476 )
      ( MAKE-9CRATE-VERIFY ?auto_1442467 ?auto_1442468 ?auto_1442469 ?auto_1442470 ?auto_1442471 ?auto_1442472 ?auto_1442473 ?auto_1442474 ?auto_1442475 ?auto_1442476 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442576 - SURFACE
      ?auto_1442577 - SURFACE
      ?auto_1442578 - SURFACE
      ?auto_1442579 - SURFACE
      ?auto_1442580 - SURFACE
      ?auto_1442581 - SURFACE
      ?auto_1442582 - SURFACE
      ?auto_1442583 - SURFACE
      ?auto_1442584 - SURFACE
      ?auto_1442585 - SURFACE
    )
    :vars
    (
      ?auto_1442586 - HOIST
      ?auto_1442590 - PLACE
      ?auto_1442587 - PLACE
      ?auto_1442588 - HOIST
      ?auto_1442589 - SURFACE
      ?auto_1442591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442586 ?auto_1442590 ) ( IS-CRATE ?auto_1442585 ) ( not ( = ?auto_1442584 ?auto_1442585 ) ) ( not ( = ?auto_1442583 ?auto_1442584 ) ) ( not ( = ?auto_1442583 ?auto_1442585 ) ) ( not ( = ?auto_1442587 ?auto_1442590 ) ) ( HOIST-AT ?auto_1442588 ?auto_1442587 ) ( not ( = ?auto_1442586 ?auto_1442588 ) ) ( AVAILABLE ?auto_1442588 ) ( SURFACE-AT ?auto_1442585 ?auto_1442587 ) ( ON ?auto_1442585 ?auto_1442589 ) ( CLEAR ?auto_1442585 ) ( not ( = ?auto_1442584 ?auto_1442589 ) ) ( not ( = ?auto_1442585 ?auto_1442589 ) ) ( not ( = ?auto_1442583 ?auto_1442589 ) ) ( TRUCK-AT ?auto_1442591 ?auto_1442590 ) ( SURFACE-AT ?auto_1442583 ?auto_1442590 ) ( CLEAR ?auto_1442583 ) ( IS-CRATE ?auto_1442584 ) ( AVAILABLE ?auto_1442586 ) ( IN ?auto_1442584 ?auto_1442591 ) ( ON ?auto_1442577 ?auto_1442576 ) ( ON ?auto_1442578 ?auto_1442577 ) ( ON ?auto_1442579 ?auto_1442578 ) ( ON ?auto_1442580 ?auto_1442579 ) ( ON ?auto_1442581 ?auto_1442580 ) ( ON ?auto_1442582 ?auto_1442581 ) ( ON ?auto_1442583 ?auto_1442582 ) ( not ( = ?auto_1442576 ?auto_1442577 ) ) ( not ( = ?auto_1442576 ?auto_1442578 ) ) ( not ( = ?auto_1442576 ?auto_1442579 ) ) ( not ( = ?auto_1442576 ?auto_1442580 ) ) ( not ( = ?auto_1442576 ?auto_1442581 ) ) ( not ( = ?auto_1442576 ?auto_1442582 ) ) ( not ( = ?auto_1442576 ?auto_1442583 ) ) ( not ( = ?auto_1442576 ?auto_1442584 ) ) ( not ( = ?auto_1442576 ?auto_1442585 ) ) ( not ( = ?auto_1442576 ?auto_1442589 ) ) ( not ( = ?auto_1442577 ?auto_1442578 ) ) ( not ( = ?auto_1442577 ?auto_1442579 ) ) ( not ( = ?auto_1442577 ?auto_1442580 ) ) ( not ( = ?auto_1442577 ?auto_1442581 ) ) ( not ( = ?auto_1442577 ?auto_1442582 ) ) ( not ( = ?auto_1442577 ?auto_1442583 ) ) ( not ( = ?auto_1442577 ?auto_1442584 ) ) ( not ( = ?auto_1442577 ?auto_1442585 ) ) ( not ( = ?auto_1442577 ?auto_1442589 ) ) ( not ( = ?auto_1442578 ?auto_1442579 ) ) ( not ( = ?auto_1442578 ?auto_1442580 ) ) ( not ( = ?auto_1442578 ?auto_1442581 ) ) ( not ( = ?auto_1442578 ?auto_1442582 ) ) ( not ( = ?auto_1442578 ?auto_1442583 ) ) ( not ( = ?auto_1442578 ?auto_1442584 ) ) ( not ( = ?auto_1442578 ?auto_1442585 ) ) ( not ( = ?auto_1442578 ?auto_1442589 ) ) ( not ( = ?auto_1442579 ?auto_1442580 ) ) ( not ( = ?auto_1442579 ?auto_1442581 ) ) ( not ( = ?auto_1442579 ?auto_1442582 ) ) ( not ( = ?auto_1442579 ?auto_1442583 ) ) ( not ( = ?auto_1442579 ?auto_1442584 ) ) ( not ( = ?auto_1442579 ?auto_1442585 ) ) ( not ( = ?auto_1442579 ?auto_1442589 ) ) ( not ( = ?auto_1442580 ?auto_1442581 ) ) ( not ( = ?auto_1442580 ?auto_1442582 ) ) ( not ( = ?auto_1442580 ?auto_1442583 ) ) ( not ( = ?auto_1442580 ?auto_1442584 ) ) ( not ( = ?auto_1442580 ?auto_1442585 ) ) ( not ( = ?auto_1442580 ?auto_1442589 ) ) ( not ( = ?auto_1442581 ?auto_1442582 ) ) ( not ( = ?auto_1442581 ?auto_1442583 ) ) ( not ( = ?auto_1442581 ?auto_1442584 ) ) ( not ( = ?auto_1442581 ?auto_1442585 ) ) ( not ( = ?auto_1442581 ?auto_1442589 ) ) ( not ( = ?auto_1442582 ?auto_1442583 ) ) ( not ( = ?auto_1442582 ?auto_1442584 ) ) ( not ( = ?auto_1442582 ?auto_1442585 ) ) ( not ( = ?auto_1442582 ?auto_1442589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442583 ?auto_1442584 ?auto_1442585 )
      ( MAKE-9CRATE-VERIFY ?auto_1442576 ?auto_1442577 ?auto_1442578 ?auto_1442579 ?auto_1442580 ?auto_1442581 ?auto_1442582 ?auto_1442583 ?auto_1442584 ?auto_1442585 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448129 - SURFACE
      ?auto_1448130 - SURFACE
      ?auto_1448131 - SURFACE
      ?auto_1448132 - SURFACE
      ?auto_1448133 - SURFACE
      ?auto_1448134 - SURFACE
      ?auto_1448135 - SURFACE
      ?auto_1448136 - SURFACE
      ?auto_1448137 - SURFACE
      ?auto_1448138 - SURFACE
      ?auto_1448139 - SURFACE
    )
    :vars
    (
      ?auto_1448140 - HOIST
      ?auto_1448141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448140 ?auto_1448141 ) ( SURFACE-AT ?auto_1448138 ?auto_1448141 ) ( CLEAR ?auto_1448138 ) ( LIFTING ?auto_1448140 ?auto_1448139 ) ( IS-CRATE ?auto_1448139 ) ( not ( = ?auto_1448138 ?auto_1448139 ) ) ( ON ?auto_1448130 ?auto_1448129 ) ( ON ?auto_1448131 ?auto_1448130 ) ( ON ?auto_1448132 ?auto_1448131 ) ( ON ?auto_1448133 ?auto_1448132 ) ( ON ?auto_1448134 ?auto_1448133 ) ( ON ?auto_1448135 ?auto_1448134 ) ( ON ?auto_1448136 ?auto_1448135 ) ( ON ?auto_1448137 ?auto_1448136 ) ( ON ?auto_1448138 ?auto_1448137 ) ( not ( = ?auto_1448129 ?auto_1448130 ) ) ( not ( = ?auto_1448129 ?auto_1448131 ) ) ( not ( = ?auto_1448129 ?auto_1448132 ) ) ( not ( = ?auto_1448129 ?auto_1448133 ) ) ( not ( = ?auto_1448129 ?auto_1448134 ) ) ( not ( = ?auto_1448129 ?auto_1448135 ) ) ( not ( = ?auto_1448129 ?auto_1448136 ) ) ( not ( = ?auto_1448129 ?auto_1448137 ) ) ( not ( = ?auto_1448129 ?auto_1448138 ) ) ( not ( = ?auto_1448129 ?auto_1448139 ) ) ( not ( = ?auto_1448130 ?auto_1448131 ) ) ( not ( = ?auto_1448130 ?auto_1448132 ) ) ( not ( = ?auto_1448130 ?auto_1448133 ) ) ( not ( = ?auto_1448130 ?auto_1448134 ) ) ( not ( = ?auto_1448130 ?auto_1448135 ) ) ( not ( = ?auto_1448130 ?auto_1448136 ) ) ( not ( = ?auto_1448130 ?auto_1448137 ) ) ( not ( = ?auto_1448130 ?auto_1448138 ) ) ( not ( = ?auto_1448130 ?auto_1448139 ) ) ( not ( = ?auto_1448131 ?auto_1448132 ) ) ( not ( = ?auto_1448131 ?auto_1448133 ) ) ( not ( = ?auto_1448131 ?auto_1448134 ) ) ( not ( = ?auto_1448131 ?auto_1448135 ) ) ( not ( = ?auto_1448131 ?auto_1448136 ) ) ( not ( = ?auto_1448131 ?auto_1448137 ) ) ( not ( = ?auto_1448131 ?auto_1448138 ) ) ( not ( = ?auto_1448131 ?auto_1448139 ) ) ( not ( = ?auto_1448132 ?auto_1448133 ) ) ( not ( = ?auto_1448132 ?auto_1448134 ) ) ( not ( = ?auto_1448132 ?auto_1448135 ) ) ( not ( = ?auto_1448132 ?auto_1448136 ) ) ( not ( = ?auto_1448132 ?auto_1448137 ) ) ( not ( = ?auto_1448132 ?auto_1448138 ) ) ( not ( = ?auto_1448132 ?auto_1448139 ) ) ( not ( = ?auto_1448133 ?auto_1448134 ) ) ( not ( = ?auto_1448133 ?auto_1448135 ) ) ( not ( = ?auto_1448133 ?auto_1448136 ) ) ( not ( = ?auto_1448133 ?auto_1448137 ) ) ( not ( = ?auto_1448133 ?auto_1448138 ) ) ( not ( = ?auto_1448133 ?auto_1448139 ) ) ( not ( = ?auto_1448134 ?auto_1448135 ) ) ( not ( = ?auto_1448134 ?auto_1448136 ) ) ( not ( = ?auto_1448134 ?auto_1448137 ) ) ( not ( = ?auto_1448134 ?auto_1448138 ) ) ( not ( = ?auto_1448134 ?auto_1448139 ) ) ( not ( = ?auto_1448135 ?auto_1448136 ) ) ( not ( = ?auto_1448135 ?auto_1448137 ) ) ( not ( = ?auto_1448135 ?auto_1448138 ) ) ( not ( = ?auto_1448135 ?auto_1448139 ) ) ( not ( = ?auto_1448136 ?auto_1448137 ) ) ( not ( = ?auto_1448136 ?auto_1448138 ) ) ( not ( = ?auto_1448136 ?auto_1448139 ) ) ( not ( = ?auto_1448137 ?auto_1448138 ) ) ( not ( = ?auto_1448137 ?auto_1448139 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448138 ?auto_1448139 )
      ( MAKE-10CRATE-VERIFY ?auto_1448129 ?auto_1448130 ?auto_1448131 ?auto_1448132 ?auto_1448133 ?auto_1448134 ?auto_1448135 ?auto_1448136 ?auto_1448137 ?auto_1448138 ?auto_1448139 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448223 - SURFACE
      ?auto_1448224 - SURFACE
      ?auto_1448225 - SURFACE
      ?auto_1448226 - SURFACE
      ?auto_1448227 - SURFACE
      ?auto_1448228 - SURFACE
      ?auto_1448229 - SURFACE
      ?auto_1448230 - SURFACE
      ?auto_1448231 - SURFACE
      ?auto_1448232 - SURFACE
      ?auto_1448233 - SURFACE
    )
    :vars
    (
      ?auto_1448236 - HOIST
      ?auto_1448235 - PLACE
      ?auto_1448234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448236 ?auto_1448235 ) ( SURFACE-AT ?auto_1448232 ?auto_1448235 ) ( CLEAR ?auto_1448232 ) ( IS-CRATE ?auto_1448233 ) ( not ( = ?auto_1448232 ?auto_1448233 ) ) ( TRUCK-AT ?auto_1448234 ?auto_1448235 ) ( AVAILABLE ?auto_1448236 ) ( IN ?auto_1448233 ?auto_1448234 ) ( ON ?auto_1448232 ?auto_1448231 ) ( not ( = ?auto_1448231 ?auto_1448232 ) ) ( not ( = ?auto_1448231 ?auto_1448233 ) ) ( ON ?auto_1448224 ?auto_1448223 ) ( ON ?auto_1448225 ?auto_1448224 ) ( ON ?auto_1448226 ?auto_1448225 ) ( ON ?auto_1448227 ?auto_1448226 ) ( ON ?auto_1448228 ?auto_1448227 ) ( ON ?auto_1448229 ?auto_1448228 ) ( ON ?auto_1448230 ?auto_1448229 ) ( ON ?auto_1448231 ?auto_1448230 ) ( not ( = ?auto_1448223 ?auto_1448224 ) ) ( not ( = ?auto_1448223 ?auto_1448225 ) ) ( not ( = ?auto_1448223 ?auto_1448226 ) ) ( not ( = ?auto_1448223 ?auto_1448227 ) ) ( not ( = ?auto_1448223 ?auto_1448228 ) ) ( not ( = ?auto_1448223 ?auto_1448229 ) ) ( not ( = ?auto_1448223 ?auto_1448230 ) ) ( not ( = ?auto_1448223 ?auto_1448231 ) ) ( not ( = ?auto_1448223 ?auto_1448232 ) ) ( not ( = ?auto_1448223 ?auto_1448233 ) ) ( not ( = ?auto_1448224 ?auto_1448225 ) ) ( not ( = ?auto_1448224 ?auto_1448226 ) ) ( not ( = ?auto_1448224 ?auto_1448227 ) ) ( not ( = ?auto_1448224 ?auto_1448228 ) ) ( not ( = ?auto_1448224 ?auto_1448229 ) ) ( not ( = ?auto_1448224 ?auto_1448230 ) ) ( not ( = ?auto_1448224 ?auto_1448231 ) ) ( not ( = ?auto_1448224 ?auto_1448232 ) ) ( not ( = ?auto_1448224 ?auto_1448233 ) ) ( not ( = ?auto_1448225 ?auto_1448226 ) ) ( not ( = ?auto_1448225 ?auto_1448227 ) ) ( not ( = ?auto_1448225 ?auto_1448228 ) ) ( not ( = ?auto_1448225 ?auto_1448229 ) ) ( not ( = ?auto_1448225 ?auto_1448230 ) ) ( not ( = ?auto_1448225 ?auto_1448231 ) ) ( not ( = ?auto_1448225 ?auto_1448232 ) ) ( not ( = ?auto_1448225 ?auto_1448233 ) ) ( not ( = ?auto_1448226 ?auto_1448227 ) ) ( not ( = ?auto_1448226 ?auto_1448228 ) ) ( not ( = ?auto_1448226 ?auto_1448229 ) ) ( not ( = ?auto_1448226 ?auto_1448230 ) ) ( not ( = ?auto_1448226 ?auto_1448231 ) ) ( not ( = ?auto_1448226 ?auto_1448232 ) ) ( not ( = ?auto_1448226 ?auto_1448233 ) ) ( not ( = ?auto_1448227 ?auto_1448228 ) ) ( not ( = ?auto_1448227 ?auto_1448229 ) ) ( not ( = ?auto_1448227 ?auto_1448230 ) ) ( not ( = ?auto_1448227 ?auto_1448231 ) ) ( not ( = ?auto_1448227 ?auto_1448232 ) ) ( not ( = ?auto_1448227 ?auto_1448233 ) ) ( not ( = ?auto_1448228 ?auto_1448229 ) ) ( not ( = ?auto_1448228 ?auto_1448230 ) ) ( not ( = ?auto_1448228 ?auto_1448231 ) ) ( not ( = ?auto_1448228 ?auto_1448232 ) ) ( not ( = ?auto_1448228 ?auto_1448233 ) ) ( not ( = ?auto_1448229 ?auto_1448230 ) ) ( not ( = ?auto_1448229 ?auto_1448231 ) ) ( not ( = ?auto_1448229 ?auto_1448232 ) ) ( not ( = ?auto_1448229 ?auto_1448233 ) ) ( not ( = ?auto_1448230 ?auto_1448231 ) ) ( not ( = ?auto_1448230 ?auto_1448232 ) ) ( not ( = ?auto_1448230 ?auto_1448233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448231 ?auto_1448232 ?auto_1448233 )
      ( MAKE-10CRATE-VERIFY ?auto_1448223 ?auto_1448224 ?auto_1448225 ?auto_1448226 ?auto_1448227 ?auto_1448228 ?auto_1448229 ?auto_1448230 ?auto_1448231 ?auto_1448232 ?auto_1448233 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448328 - SURFACE
      ?auto_1448329 - SURFACE
      ?auto_1448330 - SURFACE
      ?auto_1448331 - SURFACE
      ?auto_1448332 - SURFACE
      ?auto_1448333 - SURFACE
      ?auto_1448334 - SURFACE
      ?auto_1448335 - SURFACE
      ?auto_1448336 - SURFACE
      ?auto_1448337 - SURFACE
      ?auto_1448338 - SURFACE
    )
    :vars
    (
      ?auto_1448339 - HOIST
      ?auto_1448341 - PLACE
      ?auto_1448340 - TRUCK
      ?auto_1448342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448339 ?auto_1448341 ) ( SURFACE-AT ?auto_1448337 ?auto_1448341 ) ( CLEAR ?auto_1448337 ) ( IS-CRATE ?auto_1448338 ) ( not ( = ?auto_1448337 ?auto_1448338 ) ) ( AVAILABLE ?auto_1448339 ) ( IN ?auto_1448338 ?auto_1448340 ) ( ON ?auto_1448337 ?auto_1448336 ) ( not ( = ?auto_1448336 ?auto_1448337 ) ) ( not ( = ?auto_1448336 ?auto_1448338 ) ) ( TRUCK-AT ?auto_1448340 ?auto_1448342 ) ( not ( = ?auto_1448342 ?auto_1448341 ) ) ( ON ?auto_1448329 ?auto_1448328 ) ( ON ?auto_1448330 ?auto_1448329 ) ( ON ?auto_1448331 ?auto_1448330 ) ( ON ?auto_1448332 ?auto_1448331 ) ( ON ?auto_1448333 ?auto_1448332 ) ( ON ?auto_1448334 ?auto_1448333 ) ( ON ?auto_1448335 ?auto_1448334 ) ( ON ?auto_1448336 ?auto_1448335 ) ( not ( = ?auto_1448328 ?auto_1448329 ) ) ( not ( = ?auto_1448328 ?auto_1448330 ) ) ( not ( = ?auto_1448328 ?auto_1448331 ) ) ( not ( = ?auto_1448328 ?auto_1448332 ) ) ( not ( = ?auto_1448328 ?auto_1448333 ) ) ( not ( = ?auto_1448328 ?auto_1448334 ) ) ( not ( = ?auto_1448328 ?auto_1448335 ) ) ( not ( = ?auto_1448328 ?auto_1448336 ) ) ( not ( = ?auto_1448328 ?auto_1448337 ) ) ( not ( = ?auto_1448328 ?auto_1448338 ) ) ( not ( = ?auto_1448329 ?auto_1448330 ) ) ( not ( = ?auto_1448329 ?auto_1448331 ) ) ( not ( = ?auto_1448329 ?auto_1448332 ) ) ( not ( = ?auto_1448329 ?auto_1448333 ) ) ( not ( = ?auto_1448329 ?auto_1448334 ) ) ( not ( = ?auto_1448329 ?auto_1448335 ) ) ( not ( = ?auto_1448329 ?auto_1448336 ) ) ( not ( = ?auto_1448329 ?auto_1448337 ) ) ( not ( = ?auto_1448329 ?auto_1448338 ) ) ( not ( = ?auto_1448330 ?auto_1448331 ) ) ( not ( = ?auto_1448330 ?auto_1448332 ) ) ( not ( = ?auto_1448330 ?auto_1448333 ) ) ( not ( = ?auto_1448330 ?auto_1448334 ) ) ( not ( = ?auto_1448330 ?auto_1448335 ) ) ( not ( = ?auto_1448330 ?auto_1448336 ) ) ( not ( = ?auto_1448330 ?auto_1448337 ) ) ( not ( = ?auto_1448330 ?auto_1448338 ) ) ( not ( = ?auto_1448331 ?auto_1448332 ) ) ( not ( = ?auto_1448331 ?auto_1448333 ) ) ( not ( = ?auto_1448331 ?auto_1448334 ) ) ( not ( = ?auto_1448331 ?auto_1448335 ) ) ( not ( = ?auto_1448331 ?auto_1448336 ) ) ( not ( = ?auto_1448331 ?auto_1448337 ) ) ( not ( = ?auto_1448331 ?auto_1448338 ) ) ( not ( = ?auto_1448332 ?auto_1448333 ) ) ( not ( = ?auto_1448332 ?auto_1448334 ) ) ( not ( = ?auto_1448332 ?auto_1448335 ) ) ( not ( = ?auto_1448332 ?auto_1448336 ) ) ( not ( = ?auto_1448332 ?auto_1448337 ) ) ( not ( = ?auto_1448332 ?auto_1448338 ) ) ( not ( = ?auto_1448333 ?auto_1448334 ) ) ( not ( = ?auto_1448333 ?auto_1448335 ) ) ( not ( = ?auto_1448333 ?auto_1448336 ) ) ( not ( = ?auto_1448333 ?auto_1448337 ) ) ( not ( = ?auto_1448333 ?auto_1448338 ) ) ( not ( = ?auto_1448334 ?auto_1448335 ) ) ( not ( = ?auto_1448334 ?auto_1448336 ) ) ( not ( = ?auto_1448334 ?auto_1448337 ) ) ( not ( = ?auto_1448334 ?auto_1448338 ) ) ( not ( = ?auto_1448335 ?auto_1448336 ) ) ( not ( = ?auto_1448335 ?auto_1448337 ) ) ( not ( = ?auto_1448335 ?auto_1448338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448336 ?auto_1448337 ?auto_1448338 )
      ( MAKE-10CRATE-VERIFY ?auto_1448328 ?auto_1448329 ?auto_1448330 ?auto_1448331 ?auto_1448332 ?auto_1448333 ?auto_1448334 ?auto_1448335 ?auto_1448336 ?auto_1448337 ?auto_1448338 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448443 - SURFACE
      ?auto_1448444 - SURFACE
      ?auto_1448445 - SURFACE
      ?auto_1448446 - SURFACE
      ?auto_1448447 - SURFACE
      ?auto_1448448 - SURFACE
      ?auto_1448449 - SURFACE
      ?auto_1448450 - SURFACE
      ?auto_1448451 - SURFACE
      ?auto_1448452 - SURFACE
      ?auto_1448453 - SURFACE
    )
    :vars
    (
      ?auto_1448454 - HOIST
      ?auto_1448458 - PLACE
      ?auto_1448456 - TRUCK
      ?auto_1448457 - PLACE
      ?auto_1448455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448454 ?auto_1448458 ) ( SURFACE-AT ?auto_1448452 ?auto_1448458 ) ( CLEAR ?auto_1448452 ) ( IS-CRATE ?auto_1448453 ) ( not ( = ?auto_1448452 ?auto_1448453 ) ) ( AVAILABLE ?auto_1448454 ) ( ON ?auto_1448452 ?auto_1448451 ) ( not ( = ?auto_1448451 ?auto_1448452 ) ) ( not ( = ?auto_1448451 ?auto_1448453 ) ) ( TRUCK-AT ?auto_1448456 ?auto_1448457 ) ( not ( = ?auto_1448457 ?auto_1448458 ) ) ( HOIST-AT ?auto_1448455 ?auto_1448457 ) ( LIFTING ?auto_1448455 ?auto_1448453 ) ( not ( = ?auto_1448454 ?auto_1448455 ) ) ( ON ?auto_1448444 ?auto_1448443 ) ( ON ?auto_1448445 ?auto_1448444 ) ( ON ?auto_1448446 ?auto_1448445 ) ( ON ?auto_1448447 ?auto_1448446 ) ( ON ?auto_1448448 ?auto_1448447 ) ( ON ?auto_1448449 ?auto_1448448 ) ( ON ?auto_1448450 ?auto_1448449 ) ( ON ?auto_1448451 ?auto_1448450 ) ( not ( = ?auto_1448443 ?auto_1448444 ) ) ( not ( = ?auto_1448443 ?auto_1448445 ) ) ( not ( = ?auto_1448443 ?auto_1448446 ) ) ( not ( = ?auto_1448443 ?auto_1448447 ) ) ( not ( = ?auto_1448443 ?auto_1448448 ) ) ( not ( = ?auto_1448443 ?auto_1448449 ) ) ( not ( = ?auto_1448443 ?auto_1448450 ) ) ( not ( = ?auto_1448443 ?auto_1448451 ) ) ( not ( = ?auto_1448443 ?auto_1448452 ) ) ( not ( = ?auto_1448443 ?auto_1448453 ) ) ( not ( = ?auto_1448444 ?auto_1448445 ) ) ( not ( = ?auto_1448444 ?auto_1448446 ) ) ( not ( = ?auto_1448444 ?auto_1448447 ) ) ( not ( = ?auto_1448444 ?auto_1448448 ) ) ( not ( = ?auto_1448444 ?auto_1448449 ) ) ( not ( = ?auto_1448444 ?auto_1448450 ) ) ( not ( = ?auto_1448444 ?auto_1448451 ) ) ( not ( = ?auto_1448444 ?auto_1448452 ) ) ( not ( = ?auto_1448444 ?auto_1448453 ) ) ( not ( = ?auto_1448445 ?auto_1448446 ) ) ( not ( = ?auto_1448445 ?auto_1448447 ) ) ( not ( = ?auto_1448445 ?auto_1448448 ) ) ( not ( = ?auto_1448445 ?auto_1448449 ) ) ( not ( = ?auto_1448445 ?auto_1448450 ) ) ( not ( = ?auto_1448445 ?auto_1448451 ) ) ( not ( = ?auto_1448445 ?auto_1448452 ) ) ( not ( = ?auto_1448445 ?auto_1448453 ) ) ( not ( = ?auto_1448446 ?auto_1448447 ) ) ( not ( = ?auto_1448446 ?auto_1448448 ) ) ( not ( = ?auto_1448446 ?auto_1448449 ) ) ( not ( = ?auto_1448446 ?auto_1448450 ) ) ( not ( = ?auto_1448446 ?auto_1448451 ) ) ( not ( = ?auto_1448446 ?auto_1448452 ) ) ( not ( = ?auto_1448446 ?auto_1448453 ) ) ( not ( = ?auto_1448447 ?auto_1448448 ) ) ( not ( = ?auto_1448447 ?auto_1448449 ) ) ( not ( = ?auto_1448447 ?auto_1448450 ) ) ( not ( = ?auto_1448447 ?auto_1448451 ) ) ( not ( = ?auto_1448447 ?auto_1448452 ) ) ( not ( = ?auto_1448447 ?auto_1448453 ) ) ( not ( = ?auto_1448448 ?auto_1448449 ) ) ( not ( = ?auto_1448448 ?auto_1448450 ) ) ( not ( = ?auto_1448448 ?auto_1448451 ) ) ( not ( = ?auto_1448448 ?auto_1448452 ) ) ( not ( = ?auto_1448448 ?auto_1448453 ) ) ( not ( = ?auto_1448449 ?auto_1448450 ) ) ( not ( = ?auto_1448449 ?auto_1448451 ) ) ( not ( = ?auto_1448449 ?auto_1448452 ) ) ( not ( = ?auto_1448449 ?auto_1448453 ) ) ( not ( = ?auto_1448450 ?auto_1448451 ) ) ( not ( = ?auto_1448450 ?auto_1448452 ) ) ( not ( = ?auto_1448450 ?auto_1448453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448451 ?auto_1448452 ?auto_1448453 )
      ( MAKE-10CRATE-VERIFY ?auto_1448443 ?auto_1448444 ?auto_1448445 ?auto_1448446 ?auto_1448447 ?auto_1448448 ?auto_1448449 ?auto_1448450 ?auto_1448451 ?auto_1448452 ?auto_1448453 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448568 - SURFACE
      ?auto_1448569 - SURFACE
      ?auto_1448570 - SURFACE
      ?auto_1448571 - SURFACE
      ?auto_1448572 - SURFACE
      ?auto_1448573 - SURFACE
      ?auto_1448574 - SURFACE
      ?auto_1448575 - SURFACE
      ?auto_1448576 - SURFACE
      ?auto_1448577 - SURFACE
      ?auto_1448578 - SURFACE
    )
    :vars
    (
      ?auto_1448582 - HOIST
      ?auto_1448583 - PLACE
      ?auto_1448584 - TRUCK
      ?auto_1448579 - PLACE
      ?auto_1448581 - HOIST
      ?auto_1448580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448582 ?auto_1448583 ) ( SURFACE-AT ?auto_1448577 ?auto_1448583 ) ( CLEAR ?auto_1448577 ) ( IS-CRATE ?auto_1448578 ) ( not ( = ?auto_1448577 ?auto_1448578 ) ) ( AVAILABLE ?auto_1448582 ) ( ON ?auto_1448577 ?auto_1448576 ) ( not ( = ?auto_1448576 ?auto_1448577 ) ) ( not ( = ?auto_1448576 ?auto_1448578 ) ) ( TRUCK-AT ?auto_1448584 ?auto_1448579 ) ( not ( = ?auto_1448579 ?auto_1448583 ) ) ( HOIST-AT ?auto_1448581 ?auto_1448579 ) ( not ( = ?auto_1448582 ?auto_1448581 ) ) ( AVAILABLE ?auto_1448581 ) ( SURFACE-AT ?auto_1448578 ?auto_1448579 ) ( ON ?auto_1448578 ?auto_1448580 ) ( CLEAR ?auto_1448578 ) ( not ( = ?auto_1448577 ?auto_1448580 ) ) ( not ( = ?auto_1448578 ?auto_1448580 ) ) ( not ( = ?auto_1448576 ?auto_1448580 ) ) ( ON ?auto_1448569 ?auto_1448568 ) ( ON ?auto_1448570 ?auto_1448569 ) ( ON ?auto_1448571 ?auto_1448570 ) ( ON ?auto_1448572 ?auto_1448571 ) ( ON ?auto_1448573 ?auto_1448572 ) ( ON ?auto_1448574 ?auto_1448573 ) ( ON ?auto_1448575 ?auto_1448574 ) ( ON ?auto_1448576 ?auto_1448575 ) ( not ( = ?auto_1448568 ?auto_1448569 ) ) ( not ( = ?auto_1448568 ?auto_1448570 ) ) ( not ( = ?auto_1448568 ?auto_1448571 ) ) ( not ( = ?auto_1448568 ?auto_1448572 ) ) ( not ( = ?auto_1448568 ?auto_1448573 ) ) ( not ( = ?auto_1448568 ?auto_1448574 ) ) ( not ( = ?auto_1448568 ?auto_1448575 ) ) ( not ( = ?auto_1448568 ?auto_1448576 ) ) ( not ( = ?auto_1448568 ?auto_1448577 ) ) ( not ( = ?auto_1448568 ?auto_1448578 ) ) ( not ( = ?auto_1448568 ?auto_1448580 ) ) ( not ( = ?auto_1448569 ?auto_1448570 ) ) ( not ( = ?auto_1448569 ?auto_1448571 ) ) ( not ( = ?auto_1448569 ?auto_1448572 ) ) ( not ( = ?auto_1448569 ?auto_1448573 ) ) ( not ( = ?auto_1448569 ?auto_1448574 ) ) ( not ( = ?auto_1448569 ?auto_1448575 ) ) ( not ( = ?auto_1448569 ?auto_1448576 ) ) ( not ( = ?auto_1448569 ?auto_1448577 ) ) ( not ( = ?auto_1448569 ?auto_1448578 ) ) ( not ( = ?auto_1448569 ?auto_1448580 ) ) ( not ( = ?auto_1448570 ?auto_1448571 ) ) ( not ( = ?auto_1448570 ?auto_1448572 ) ) ( not ( = ?auto_1448570 ?auto_1448573 ) ) ( not ( = ?auto_1448570 ?auto_1448574 ) ) ( not ( = ?auto_1448570 ?auto_1448575 ) ) ( not ( = ?auto_1448570 ?auto_1448576 ) ) ( not ( = ?auto_1448570 ?auto_1448577 ) ) ( not ( = ?auto_1448570 ?auto_1448578 ) ) ( not ( = ?auto_1448570 ?auto_1448580 ) ) ( not ( = ?auto_1448571 ?auto_1448572 ) ) ( not ( = ?auto_1448571 ?auto_1448573 ) ) ( not ( = ?auto_1448571 ?auto_1448574 ) ) ( not ( = ?auto_1448571 ?auto_1448575 ) ) ( not ( = ?auto_1448571 ?auto_1448576 ) ) ( not ( = ?auto_1448571 ?auto_1448577 ) ) ( not ( = ?auto_1448571 ?auto_1448578 ) ) ( not ( = ?auto_1448571 ?auto_1448580 ) ) ( not ( = ?auto_1448572 ?auto_1448573 ) ) ( not ( = ?auto_1448572 ?auto_1448574 ) ) ( not ( = ?auto_1448572 ?auto_1448575 ) ) ( not ( = ?auto_1448572 ?auto_1448576 ) ) ( not ( = ?auto_1448572 ?auto_1448577 ) ) ( not ( = ?auto_1448572 ?auto_1448578 ) ) ( not ( = ?auto_1448572 ?auto_1448580 ) ) ( not ( = ?auto_1448573 ?auto_1448574 ) ) ( not ( = ?auto_1448573 ?auto_1448575 ) ) ( not ( = ?auto_1448573 ?auto_1448576 ) ) ( not ( = ?auto_1448573 ?auto_1448577 ) ) ( not ( = ?auto_1448573 ?auto_1448578 ) ) ( not ( = ?auto_1448573 ?auto_1448580 ) ) ( not ( = ?auto_1448574 ?auto_1448575 ) ) ( not ( = ?auto_1448574 ?auto_1448576 ) ) ( not ( = ?auto_1448574 ?auto_1448577 ) ) ( not ( = ?auto_1448574 ?auto_1448578 ) ) ( not ( = ?auto_1448574 ?auto_1448580 ) ) ( not ( = ?auto_1448575 ?auto_1448576 ) ) ( not ( = ?auto_1448575 ?auto_1448577 ) ) ( not ( = ?auto_1448575 ?auto_1448578 ) ) ( not ( = ?auto_1448575 ?auto_1448580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448576 ?auto_1448577 ?auto_1448578 )
      ( MAKE-10CRATE-VERIFY ?auto_1448568 ?auto_1448569 ?auto_1448570 ?auto_1448571 ?auto_1448572 ?auto_1448573 ?auto_1448574 ?auto_1448575 ?auto_1448576 ?auto_1448577 ?auto_1448578 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448694 - SURFACE
      ?auto_1448695 - SURFACE
      ?auto_1448696 - SURFACE
      ?auto_1448697 - SURFACE
      ?auto_1448698 - SURFACE
      ?auto_1448699 - SURFACE
      ?auto_1448700 - SURFACE
      ?auto_1448701 - SURFACE
      ?auto_1448702 - SURFACE
      ?auto_1448703 - SURFACE
      ?auto_1448704 - SURFACE
    )
    :vars
    (
      ?auto_1448708 - HOIST
      ?auto_1448707 - PLACE
      ?auto_1448709 - PLACE
      ?auto_1448705 - HOIST
      ?auto_1448710 - SURFACE
      ?auto_1448706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448708 ?auto_1448707 ) ( SURFACE-AT ?auto_1448703 ?auto_1448707 ) ( CLEAR ?auto_1448703 ) ( IS-CRATE ?auto_1448704 ) ( not ( = ?auto_1448703 ?auto_1448704 ) ) ( AVAILABLE ?auto_1448708 ) ( ON ?auto_1448703 ?auto_1448702 ) ( not ( = ?auto_1448702 ?auto_1448703 ) ) ( not ( = ?auto_1448702 ?auto_1448704 ) ) ( not ( = ?auto_1448709 ?auto_1448707 ) ) ( HOIST-AT ?auto_1448705 ?auto_1448709 ) ( not ( = ?auto_1448708 ?auto_1448705 ) ) ( AVAILABLE ?auto_1448705 ) ( SURFACE-AT ?auto_1448704 ?auto_1448709 ) ( ON ?auto_1448704 ?auto_1448710 ) ( CLEAR ?auto_1448704 ) ( not ( = ?auto_1448703 ?auto_1448710 ) ) ( not ( = ?auto_1448704 ?auto_1448710 ) ) ( not ( = ?auto_1448702 ?auto_1448710 ) ) ( TRUCK-AT ?auto_1448706 ?auto_1448707 ) ( ON ?auto_1448695 ?auto_1448694 ) ( ON ?auto_1448696 ?auto_1448695 ) ( ON ?auto_1448697 ?auto_1448696 ) ( ON ?auto_1448698 ?auto_1448697 ) ( ON ?auto_1448699 ?auto_1448698 ) ( ON ?auto_1448700 ?auto_1448699 ) ( ON ?auto_1448701 ?auto_1448700 ) ( ON ?auto_1448702 ?auto_1448701 ) ( not ( = ?auto_1448694 ?auto_1448695 ) ) ( not ( = ?auto_1448694 ?auto_1448696 ) ) ( not ( = ?auto_1448694 ?auto_1448697 ) ) ( not ( = ?auto_1448694 ?auto_1448698 ) ) ( not ( = ?auto_1448694 ?auto_1448699 ) ) ( not ( = ?auto_1448694 ?auto_1448700 ) ) ( not ( = ?auto_1448694 ?auto_1448701 ) ) ( not ( = ?auto_1448694 ?auto_1448702 ) ) ( not ( = ?auto_1448694 ?auto_1448703 ) ) ( not ( = ?auto_1448694 ?auto_1448704 ) ) ( not ( = ?auto_1448694 ?auto_1448710 ) ) ( not ( = ?auto_1448695 ?auto_1448696 ) ) ( not ( = ?auto_1448695 ?auto_1448697 ) ) ( not ( = ?auto_1448695 ?auto_1448698 ) ) ( not ( = ?auto_1448695 ?auto_1448699 ) ) ( not ( = ?auto_1448695 ?auto_1448700 ) ) ( not ( = ?auto_1448695 ?auto_1448701 ) ) ( not ( = ?auto_1448695 ?auto_1448702 ) ) ( not ( = ?auto_1448695 ?auto_1448703 ) ) ( not ( = ?auto_1448695 ?auto_1448704 ) ) ( not ( = ?auto_1448695 ?auto_1448710 ) ) ( not ( = ?auto_1448696 ?auto_1448697 ) ) ( not ( = ?auto_1448696 ?auto_1448698 ) ) ( not ( = ?auto_1448696 ?auto_1448699 ) ) ( not ( = ?auto_1448696 ?auto_1448700 ) ) ( not ( = ?auto_1448696 ?auto_1448701 ) ) ( not ( = ?auto_1448696 ?auto_1448702 ) ) ( not ( = ?auto_1448696 ?auto_1448703 ) ) ( not ( = ?auto_1448696 ?auto_1448704 ) ) ( not ( = ?auto_1448696 ?auto_1448710 ) ) ( not ( = ?auto_1448697 ?auto_1448698 ) ) ( not ( = ?auto_1448697 ?auto_1448699 ) ) ( not ( = ?auto_1448697 ?auto_1448700 ) ) ( not ( = ?auto_1448697 ?auto_1448701 ) ) ( not ( = ?auto_1448697 ?auto_1448702 ) ) ( not ( = ?auto_1448697 ?auto_1448703 ) ) ( not ( = ?auto_1448697 ?auto_1448704 ) ) ( not ( = ?auto_1448697 ?auto_1448710 ) ) ( not ( = ?auto_1448698 ?auto_1448699 ) ) ( not ( = ?auto_1448698 ?auto_1448700 ) ) ( not ( = ?auto_1448698 ?auto_1448701 ) ) ( not ( = ?auto_1448698 ?auto_1448702 ) ) ( not ( = ?auto_1448698 ?auto_1448703 ) ) ( not ( = ?auto_1448698 ?auto_1448704 ) ) ( not ( = ?auto_1448698 ?auto_1448710 ) ) ( not ( = ?auto_1448699 ?auto_1448700 ) ) ( not ( = ?auto_1448699 ?auto_1448701 ) ) ( not ( = ?auto_1448699 ?auto_1448702 ) ) ( not ( = ?auto_1448699 ?auto_1448703 ) ) ( not ( = ?auto_1448699 ?auto_1448704 ) ) ( not ( = ?auto_1448699 ?auto_1448710 ) ) ( not ( = ?auto_1448700 ?auto_1448701 ) ) ( not ( = ?auto_1448700 ?auto_1448702 ) ) ( not ( = ?auto_1448700 ?auto_1448703 ) ) ( not ( = ?auto_1448700 ?auto_1448704 ) ) ( not ( = ?auto_1448700 ?auto_1448710 ) ) ( not ( = ?auto_1448701 ?auto_1448702 ) ) ( not ( = ?auto_1448701 ?auto_1448703 ) ) ( not ( = ?auto_1448701 ?auto_1448704 ) ) ( not ( = ?auto_1448701 ?auto_1448710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448702 ?auto_1448703 ?auto_1448704 )
      ( MAKE-10CRATE-VERIFY ?auto_1448694 ?auto_1448695 ?auto_1448696 ?auto_1448697 ?auto_1448698 ?auto_1448699 ?auto_1448700 ?auto_1448701 ?auto_1448702 ?auto_1448703 ?auto_1448704 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448820 - SURFACE
      ?auto_1448821 - SURFACE
      ?auto_1448822 - SURFACE
      ?auto_1448823 - SURFACE
      ?auto_1448824 - SURFACE
      ?auto_1448825 - SURFACE
      ?auto_1448826 - SURFACE
      ?auto_1448827 - SURFACE
      ?auto_1448828 - SURFACE
      ?auto_1448829 - SURFACE
      ?auto_1448830 - SURFACE
    )
    :vars
    (
      ?auto_1448832 - HOIST
      ?auto_1448836 - PLACE
      ?auto_1448834 - PLACE
      ?auto_1448831 - HOIST
      ?auto_1448835 - SURFACE
      ?auto_1448833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448832 ?auto_1448836 ) ( IS-CRATE ?auto_1448830 ) ( not ( = ?auto_1448829 ?auto_1448830 ) ) ( not ( = ?auto_1448828 ?auto_1448829 ) ) ( not ( = ?auto_1448828 ?auto_1448830 ) ) ( not ( = ?auto_1448834 ?auto_1448836 ) ) ( HOIST-AT ?auto_1448831 ?auto_1448834 ) ( not ( = ?auto_1448832 ?auto_1448831 ) ) ( AVAILABLE ?auto_1448831 ) ( SURFACE-AT ?auto_1448830 ?auto_1448834 ) ( ON ?auto_1448830 ?auto_1448835 ) ( CLEAR ?auto_1448830 ) ( not ( = ?auto_1448829 ?auto_1448835 ) ) ( not ( = ?auto_1448830 ?auto_1448835 ) ) ( not ( = ?auto_1448828 ?auto_1448835 ) ) ( TRUCK-AT ?auto_1448833 ?auto_1448836 ) ( SURFACE-AT ?auto_1448828 ?auto_1448836 ) ( CLEAR ?auto_1448828 ) ( LIFTING ?auto_1448832 ?auto_1448829 ) ( IS-CRATE ?auto_1448829 ) ( ON ?auto_1448821 ?auto_1448820 ) ( ON ?auto_1448822 ?auto_1448821 ) ( ON ?auto_1448823 ?auto_1448822 ) ( ON ?auto_1448824 ?auto_1448823 ) ( ON ?auto_1448825 ?auto_1448824 ) ( ON ?auto_1448826 ?auto_1448825 ) ( ON ?auto_1448827 ?auto_1448826 ) ( ON ?auto_1448828 ?auto_1448827 ) ( not ( = ?auto_1448820 ?auto_1448821 ) ) ( not ( = ?auto_1448820 ?auto_1448822 ) ) ( not ( = ?auto_1448820 ?auto_1448823 ) ) ( not ( = ?auto_1448820 ?auto_1448824 ) ) ( not ( = ?auto_1448820 ?auto_1448825 ) ) ( not ( = ?auto_1448820 ?auto_1448826 ) ) ( not ( = ?auto_1448820 ?auto_1448827 ) ) ( not ( = ?auto_1448820 ?auto_1448828 ) ) ( not ( = ?auto_1448820 ?auto_1448829 ) ) ( not ( = ?auto_1448820 ?auto_1448830 ) ) ( not ( = ?auto_1448820 ?auto_1448835 ) ) ( not ( = ?auto_1448821 ?auto_1448822 ) ) ( not ( = ?auto_1448821 ?auto_1448823 ) ) ( not ( = ?auto_1448821 ?auto_1448824 ) ) ( not ( = ?auto_1448821 ?auto_1448825 ) ) ( not ( = ?auto_1448821 ?auto_1448826 ) ) ( not ( = ?auto_1448821 ?auto_1448827 ) ) ( not ( = ?auto_1448821 ?auto_1448828 ) ) ( not ( = ?auto_1448821 ?auto_1448829 ) ) ( not ( = ?auto_1448821 ?auto_1448830 ) ) ( not ( = ?auto_1448821 ?auto_1448835 ) ) ( not ( = ?auto_1448822 ?auto_1448823 ) ) ( not ( = ?auto_1448822 ?auto_1448824 ) ) ( not ( = ?auto_1448822 ?auto_1448825 ) ) ( not ( = ?auto_1448822 ?auto_1448826 ) ) ( not ( = ?auto_1448822 ?auto_1448827 ) ) ( not ( = ?auto_1448822 ?auto_1448828 ) ) ( not ( = ?auto_1448822 ?auto_1448829 ) ) ( not ( = ?auto_1448822 ?auto_1448830 ) ) ( not ( = ?auto_1448822 ?auto_1448835 ) ) ( not ( = ?auto_1448823 ?auto_1448824 ) ) ( not ( = ?auto_1448823 ?auto_1448825 ) ) ( not ( = ?auto_1448823 ?auto_1448826 ) ) ( not ( = ?auto_1448823 ?auto_1448827 ) ) ( not ( = ?auto_1448823 ?auto_1448828 ) ) ( not ( = ?auto_1448823 ?auto_1448829 ) ) ( not ( = ?auto_1448823 ?auto_1448830 ) ) ( not ( = ?auto_1448823 ?auto_1448835 ) ) ( not ( = ?auto_1448824 ?auto_1448825 ) ) ( not ( = ?auto_1448824 ?auto_1448826 ) ) ( not ( = ?auto_1448824 ?auto_1448827 ) ) ( not ( = ?auto_1448824 ?auto_1448828 ) ) ( not ( = ?auto_1448824 ?auto_1448829 ) ) ( not ( = ?auto_1448824 ?auto_1448830 ) ) ( not ( = ?auto_1448824 ?auto_1448835 ) ) ( not ( = ?auto_1448825 ?auto_1448826 ) ) ( not ( = ?auto_1448825 ?auto_1448827 ) ) ( not ( = ?auto_1448825 ?auto_1448828 ) ) ( not ( = ?auto_1448825 ?auto_1448829 ) ) ( not ( = ?auto_1448825 ?auto_1448830 ) ) ( not ( = ?auto_1448825 ?auto_1448835 ) ) ( not ( = ?auto_1448826 ?auto_1448827 ) ) ( not ( = ?auto_1448826 ?auto_1448828 ) ) ( not ( = ?auto_1448826 ?auto_1448829 ) ) ( not ( = ?auto_1448826 ?auto_1448830 ) ) ( not ( = ?auto_1448826 ?auto_1448835 ) ) ( not ( = ?auto_1448827 ?auto_1448828 ) ) ( not ( = ?auto_1448827 ?auto_1448829 ) ) ( not ( = ?auto_1448827 ?auto_1448830 ) ) ( not ( = ?auto_1448827 ?auto_1448835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448828 ?auto_1448829 ?auto_1448830 )
      ( MAKE-10CRATE-VERIFY ?auto_1448820 ?auto_1448821 ?auto_1448822 ?auto_1448823 ?auto_1448824 ?auto_1448825 ?auto_1448826 ?auto_1448827 ?auto_1448828 ?auto_1448829 ?auto_1448830 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448946 - SURFACE
      ?auto_1448947 - SURFACE
      ?auto_1448948 - SURFACE
      ?auto_1448949 - SURFACE
      ?auto_1448950 - SURFACE
      ?auto_1448951 - SURFACE
      ?auto_1448952 - SURFACE
      ?auto_1448953 - SURFACE
      ?auto_1448954 - SURFACE
      ?auto_1448955 - SURFACE
      ?auto_1448956 - SURFACE
    )
    :vars
    (
      ?auto_1448961 - HOIST
      ?auto_1448959 - PLACE
      ?auto_1448960 - PLACE
      ?auto_1448962 - HOIST
      ?auto_1448957 - SURFACE
      ?auto_1448958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448961 ?auto_1448959 ) ( IS-CRATE ?auto_1448956 ) ( not ( = ?auto_1448955 ?auto_1448956 ) ) ( not ( = ?auto_1448954 ?auto_1448955 ) ) ( not ( = ?auto_1448954 ?auto_1448956 ) ) ( not ( = ?auto_1448960 ?auto_1448959 ) ) ( HOIST-AT ?auto_1448962 ?auto_1448960 ) ( not ( = ?auto_1448961 ?auto_1448962 ) ) ( AVAILABLE ?auto_1448962 ) ( SURFACE-AT ?auto_1448956 ?auto_1448960 ) ( ON ?auto_1448956 ?auto_1448957 ) ( CLEAR ?auto_1448956 ) ( not ( = ?auto_1448955 ?auto_1448957 ) ) ( not ( = ?auto_1448956 ?auto_1448957 ) ) ( not ( = ?auto_1448954 ?auto_1448957 ) ) ( TRUCK-AT ?auto_1448958 ?auto_1448959 ) ( SURFACE-AT ?auto_1448954 ?auto_1448959 ) ( CLEAR ?auto_1448954 ) ( IS-CRATE ?auto_1448955 ) ( AVAILABLE ?auto_1448961 ) ( IN ?auto_1448955 ?auto_1448958 ) ( ON ?auto_1448947 ?auto_1448946 ) ( ON ?auto_1448948 ?auto_1448947 ) ( ON ?auto_1448949 ?auto_1448948 ) ( ON ?auto_1448950 ?auto_1448949 ) ( ON ?auto_1448951 ?auto_1448950 ) ( ON ?auto_1448952 ?auto_1448951 ) ( ON ?auto_1448953 ?auto_1448952 ) ( ON ?auto_1448954 ?auto_1448953 ) ( not ( = ?auto_1448946 ?auto_1448947 ) ) ( not ( = ?auto_1448946 ?auto_1448948 ) ) ( not ( = ?auto_1448946 ?auto_1448949 ) ) ( not ( = ?auto_1448946 ?auto_1448950 ) ) ( not ( = ?auto_1448946 ?auto_1448951 ) ) ( not ( = ?auto_1448946 ?auto_1448952 ) ) ( not ( = ?auto_1448946 ?auto_1448953 ) ) ( not ( = ?auto_1448946 ?auto_1448954 ) ) ( not ( = ?auto_1448946 ?auto_1448955 ) ) ( not ( = ?auto_1448946 ?auto_1448956 ) ) ( not ( = ?auto_1448946 ?auto_1448957 ) ) ( not ( = ?auto_1448947 ?auto_1448948 ) ) ( not ( = ?auto_1448947 ?auto_1448949 ) ) ( not ( = ?auto_1448947 ?auto_1448950 ) ) ( not ( = ?auto_1448947 ?auto_1448951 ) ) ( not ( = ?auto_1448947 ?auto_1448952 ) ) ( not ( = ?auto_1448947 ?auto_1448953 ) ) ( not ( = ?auto_1448947 ?auto_1448954 ) ) ( not ( = ?auto_1448947 ?auto_1448955 ) ) ( not ( = ?auto_1448947 ?auto_1448956 ) ) ( not ( = ?auto_1448947 ?auto_1448957 ) ) ( not ( = ?auto_1448948 ?auto_1448949 ) ) ( not ( = ?auto_1448948 ?auto_1448950 ) ) ( not ( = ?auto_1448948 ?auto_1448951 ) ) ( not ( = ?auto_1448948 ?auto_1448952 ) ) ( not ( = ?auto_1448948 ?auto_1448953 ) ) ( not ( = ?auto_1448948 ?auto_1448954 ) ) ( not ( = ?auto_1448948 ?auto_1448955 ) ) ( not ( = ?auto_1448948 ?auto_1448956 ) ) ( not ( = ?auto_1448948 ?auto_1448957 ) ) ( not ( = ?auto_1448949 ?auto_1448950 ) ) ( not ( = ?auto_1448949 ?auto_1448951 ) ) ( not ( = ?auto_1448949 ?auto_1448952 ) ) ( not ( = ?auto_1448949 ?auto_1448953 ) ) ( not ( = ?auto_1448949 ?auto_1448954 ) ) ( not ( = ?auto_1448949 ?auto_1448955 ) ) ( not ( = ?auto_1448949 ?auto_1448956 ) ) ( not ( = ?auto_1448949 ?auto_1448957 ) ) ( not ( = ?auto_1448950 ?auto_1448951 ) ) ( not ( = ?auto_1448950 ?auto_1448952 ) ) ( not ( = ?auto_1448950 ?auto_1448953 ) ) ( not ( = ?auto_1448950 ?auto_1448954 ) ) ( not ( = ?auto_1448950 ?auto_1448955 ) ) ( not ( = ?auto_1448950 ?auto_1448956 ) ) ( not ( = ?auto_1448950 ?auto_1448957 ) ) ( not ( = ?auto_1448951 ?auto_1448952 ) ) ( not ( = ?auto_1448951 ?auto_1448953 ) ) ( not ( = ?auto_1448951 ?auto_1448954 ) ) ( not ( = ?auto_1448951 ?auto_1448955 ) ) ( not ( = ?auto_1448951 ?auto_1448956 ) ) ( not ( = ?auto_1448951 ?auto_1448957 ) ) ( not ( = ?auto_1448952 ?auto_1448953 ) ) ( not ( = ?auto_1448952 ?auto_1448954 ) ) ( not ( = ?auto_1448952 ?auto_1448955 ) ) ( not ( = ?auto_1448952 ?auto_1448956 ) ) ( not ( = ?auto_1448952 ?auto_1448957 ) ) ( not ( = ?auto_1448953 ?auto_1448954 ) ) ( not ( = ?auto_1448953 ?auto_1448955 ) ) ( not ( = ?auto_1448953 ?auto_1448956 ) ) ( not ( = ?auto_1448953 ?auto_1448957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448954 ?auto_1448955 ?auto_1448956 )
      ( MAKE-10CRATE-VERIFY ?auto_1448946 ?auto_1448947 ?auto_1448948 ?auto_1448949 ?auto_1448950 ?auto_1448951 ?auto_1448952 ?auto_1448953 ?auto_1448954 ?auto_1448955 ?auto_1448956 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456200 - SURFACE
      ?auto_1456201 - SURFACE
      ?auto_1456202 - SURFACE
      ?auto_1456203 - SURFACE
      ?auto_1456204 - SURFACE
      ?auto_1456205 - SURFACE
      ?auto_1456206 - SURFACE
      ?auto_1456207 - SURFACE
      ?auto_1456208 - SURFACE
      ?auto_1456209 - SURFACE
      ?auto_1456210 - SURFACE
      ?auto_1456211 - SURFACE
    )
    :vars
    (
      ?auto_1456212 - HOIST
      ?auto_1456213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456212 ?auto_1456213 ) ( SURFACE-AT ?auto_1456210 ?auto_1456213 ) ( CLEAR ?auto_1456210 ) ( LIFTING ?auto_1456212 ?auto_1456211 ) ( IS-CRATE ?auto_1456211 ) ( not ( = ?auto_1456210 ?auto_1456211 ) ) ( ON ?auto_1456201 ?auto_1456200 ) ( ON ?auto_1456202 ?auto_1456201 ) ( ON ?auto_1456203 ?auto_1456202 ) ( ON ?auto_1456204 ?auto_1456203 ) ( ON ?auto_1456205 ?auto_1456204 ) ( ON ?auto_1456206 ?auto_1456205 ) ( ON ?auto_1456207 ?auto_1456206 ) ( ON ?auto_1456208 ?auto_1456207 ) ( ON ?auto_1456209 ?auto_1456208 ) ( ON ?auto_1456210 ?auto_1456209 ) ( not ( = ?auto_1456200 ?auto_1456201 ) ) ( not ( = ?auto_1456200 ?auto_1456202 ) ) ( not ( = ?auto_1456200 ?auto_1456203 ) ) ( not ( = ?auto_1456200 ?auto_1456204 ) ) ( not ( = ?auto_1456200 ?auto_1456205 ) ) ( not ( = ?auto_1456200 ?auto_1456206 ) ) ( not ( = ?auto_1456200 ?auto_1456207 ) ) ( not ( = ?auto_1456200 ?auto_1456208 ) ) ( not ( = ?auto_1456200 ?auto_1456209 ) ) ( not ( = ?auto_1456200 ?auto_1456210 ) ) ( not ( = ?auto_1456200 ?auto_1456211 ) ) ( not ( = ?auto_1456201 ?auto_1456202 ) ) ( not ( = ?auto_1456201 ?auto_1456203 ) ) ( not ( = ?auto_1456201 ?auto_1456204 ) ) ( not ( = ?auto_1456201 ?auto_1456205 ) ) ( not ( = ?auto_1456201 ?auto_1456206 ) ) ( not ( = ?auto_1456201 ?auto_1456207 ) ) ( not ( = ?auto_1456201 ?auto_1456208 ) ) ( not ( = ?auto_1456201 ?auto_1456209 ) ) ( not ( = ?auto_1456201 ?auto_1456210 ) ) ( not ( = ?auto_1456201 ?auto_1456211 ) ) ( not ( = ?auto_1456202 ?auto_1456203 ) ) ( not ( = ?auto_1456202 ?auto_1456204 ) ) ( not ( = ?auto_1456202 ?auto_1456205 ) ) ( not ( = ?auto_1456202 ?auto_1456206 ) ) ( not ( = ?auto_1456202 ?auto_1456207 ) ) ( not ( = ?auto_1456202 ?auto_1456208 ) ) ( not ( = ?auto_1456202 ?auto_1456209 ) ) ( not ( = ?auto_1456202 ?auto_1456210 ) ) ( not ( = ?auto_1456202 ?auto_1456211 ) ) ( not ( = ?auto_1456203 ?auto_1456204 ) ) ( not ( = ?auto_1456203 ?auto_1456205 ) ) ( not ( = ?auto_1456203 ?auto_1456206 ) ) ( not ( = ?auto_1456203 ?auto_1456207 ) ) ( not ( = ?auto_1456203 ?auto_1456208 ) ) ( not ( = ?auto_1456203 ?auto_1456209 ) ) ( not ( = ?auto_1456203 ?auto_1456210 ) ) ( not ( = ?auto_1456203 ?auto_1456211 ) ) ( not ( = ?auto_1456204 ?auto_1456205 ) ) ( not ( = ?auto_1456204 ?auto_1456206 ) ) ( not ( = ?auto_1456204 ?auto_1456207 ) ) ( not ( = ?auto_1456204 ?auto_1456208 ) ) ( not ( = ?auto_1456204 ?auto_1456209 ) ) ( not ( = ?auto_1456204 ?auto_1456210 ) ) ( not ( = ?auto_1456204 ?auto_1456211 ) ) ( not ( = ?auto_1456205 ?auto_1456206 ) ) ( not ( = ?auto_1456205 ?auto_1456207 ) ) ( not ( = ?auto_1456205 ?auto_1456208 ) ) ( not ( = ?auto_1456205 ?auto_1456209 ) ) ( not ( = ?auto_1456205 ?auto_1456210 ) ) ( not ( = ?auto_1456205 ?auto_1456211 ) ) ( not ( = ?auto_1456206 ?auto_1456207 ) ) ( not ( = ?auto_1456206 ?auto_1456208 ) ) ( not ( = ?auto_1456206 ?auto_1456209 ) ) ( not ( = ?auto_1456206 ?auto_1456210 ) ) ( not ( = ?auto_1456206 ?auto_1456211 ) ) ( not ( = ?auto_1456207 ?auto_1456208 ) ) ( not ( = ?auto_1456207 ?auto_1456209 ) ) ( not ( = ?auto_1456207 ?auto_1456210 ) ) ( not ( = ?auto_1456207 ?auto_1456211 ) ) ( not ( = ?auto_1456208 ?auto_1456209 ) ) ( not ( = ?auto_1456208 ?auto_1456210 ) ) ( not ( = ?auto_1456208 ?auto_1456211 ) ) ( not ( = ?auto_1456209 ?auto_1456210 ) ) ( not ( = ?auto_1456209 ?auto_1456211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1456210 ?auto_1456211 )
      ( MAKE-11CRATE-VERIFY ?auto_1456200 ?auto_1456201 ?auto_1456202 ?auto_1456203 ?auto_1456204 ?auto_1456205 ?auto_1456206 ?auto_1456207 ?auto_1456208 ?auto_1456209 ?auto_1456210 ?auto_1456211 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456309 - SURFACE
      ?auto_1456310 - SURFACE
      ?auto_1456311 - SURFACE
      ?auto_1456312 - SURFACE
      ?auto_1456313 - SURFACE
      ?auto_1456314 - SURFACE
      ?auto_1456315 - SURFACE
      ?auto_1456316 - SURFACE
      ?auto_1456317 - SURFACE
      ?auto_1456318 - SURFACE
      ?auto_1456319 - SURFACE
      ?auto_1456320 - SURFACE
    )
    :vars
    (
      ?auto_1456322 - HOIST
      ?auto_1456321 - PLACE
      ?auto_1456323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456322 ?auto_1456321 ) ( SURFACE-AT ?auto_1456319 ?auto_1456321 ) ( CLEAR ?auto_1456319 ) ( IS-CRATE ?auto_1456320 ) ( not ( = ?auto_1456319 ?auto_1456320 ) ) ( TRUCK-AT ?auto_1456323 ?auto_1456321 ) ( AVAILABLE ?auto_1456322 ) ( IN ?auto_1456320 ?auto_1456323 ) ( ON ?auto_1456319 ?auto_1456318 ) ( not ( = ?auto_1456318 ?auto_1456319 ) ) ( not ( = ?auto_1456318 ?auto_1456320 ) ) ( ON ?auto_1456310 ?auto_1456309 ) ( ON ?auto_1456311 ?auto_1456310 ) ( ON ?auto_1456312 ?auto_1456311 ) ( ON ?auto_1456313 ?auto_1456312 ) ( ON ?auto_1456314 ?auto_1456313 ) ( ON ?auto_1456315 ?auto_1456314 ) ( ON ?auto_1456316 ?auto_1456315 ) ( ON ?auto_1456317 ?auto_1456316 ) ( ON ?auto_1456318 ?auto_1456317 ) ( not ( = ?auto_1456309 ?auto_1456310 ) ) ( not ( = ?auto_1456309 ?auto_1456311 ) ) ( not ( = ?auto_1456309 ?auto_1456312 ) ) ( not ( = ?auto_1456309 ?auto_1456313 ) ) ( not ( = ?auto_1456309 ?auto_1456314 ) ) ( not ( = ?auto_1456309 ?auto_1456315 ) ) ( not ( = ?auto_1456309 ?auto_1456316 ) ) ( not ( = ?auto_1456309 ?auto_1456317 ) ) ( not ( = ?auto_1456309 ?auto_1456318 ) ) ( not ( = ?auto_1456309 ?auto_1456319 ) ) ( not ( = ?auto_1456309 ?auto_1456320 ) ) ( not ( = ?auto_1456310 ?auto_1456311 ) ) ( not ( = ?auto_1456310 ?auto_1456312 ) ) ( not ( = ?auto_1456310 ?auto_1456313 ) ) ( not ( = ?auto_1456310 ?auto_1456314 ) ) ( not ( = ?auto_1456310 ?auto_1456315 ) ) ( not ( = ?auto_1456310 ?auto_1456316 ) ) ( not ( = ?auto_1456310 ?auto_1456317 ) ) ( not ( = ?auto_1456310 ?auto_1456318 ) ) ( not ( = ?auto_1456310 ?auto_1456319 ) ) ( not ( = ?auto_1456310 ?auto_1456320 ) ) ( not ( = ?auto_1456311 ?auto_1456312 ) ) ( not ( = ?auto_1456311 ?auto_1456313 ) ) ( not ( = ?auto_1456311 ?auto_1456314 ) ) ( not ( = ?auto_1456311 ?auto_1456315 ) ) ( not ( = ?auto_1456311 ?auto_1456316 ) ) ( not ( = ?auto_1456311 ?auto_1456317 ) ) ( not ( = ?auto_1456311 ?auto_1456318 ) ) ( not ( = ?auto_1456311 ?auto_1456319 ) ) ( not ( = ?auto_1456311 ?auto_1456320 ) ) ( not ( = ?auto_1456312 ?auto_1456313 ) ) ( not ( = ?auto_1456312 ?auto_1456314 ) ) ( not ( = ?auto_1456312 ?auto_1456315 ) ) ( not ( = ?auto_1456312 ?auto_1456316 ) ) ( not ( = ?auto_1456312 ?auto_1456317 ) ) ( not ( = ?auto_1456312 ?auto_1456318 ) ) ( not ( = ?auto_1456312 ?auto_1456319 ) ) ( not ( = ?auto_1456312 ?auto_1456320 ) ) ( not ( = ?auto_1456313 ?auto_1456314 ) ) ( not ( = ?auto_1456313 ?auto_1456315 ) ) ( not ( = ?auto_1456313 ?auto_1456316 ) ) ( not ( = ?auto_1456313 ?auto_1456317 ) ) ( not ( = ?auto_1456313 ?auto_1456318 ) ) ( not ( = ?auto_1456313 ?auto_1456319 ) ) ( not ( = ?auto_1456313 ?auto_1456320 ) ) ( not ( = ?auto_1456314 ?auto_1456315 ) ) ( not ( = ?auto_1456314 ?auto_1456316 ) ) ( not ( = ?auto_1456314 ?auto_1456317 ) ) ( not ( = ?auto_1456314 ?auto_1456318 ) ) ( not ( = ?auto_1456314 ?auto_1456319 ) ) ( not ( = ?auto_1456314 ?auto_1456320 ) ) ( not ( = ?auto_1456315 ?auto_1456316 ) ) ( not ( = ?auto_1456315 ?auto_1456317 ) ) ( not ( = ?auto_1456315 ?auto_1456318 ) ) ( not ( = ?auto_1456315 ?auto_1456319 ) ) ( not ( = ?auto_1456315 ?auto_1456320 ) ) ( not ( = ?auto_1456316 ?auto_1456317 ) ) ( not ( = ?auto_1456316 ?auto_1456318 ) ) ( not ( = ?auto_1456316 ?auto_1456319 ) ) ( not ( = ?auto_1456316 ?auto_1456320 ) ) ( not ( = ?auto_1456317 ?auto_1456318 ) ) ( not ( = ?auto_1456317 ?auto_1456319 ) ) ( not ( = ?auto_1456317 ?auto_1456320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456318 ?auto_1456319 ?auto_1456320 )
      ( MAKE-11CRATE-VERIFY ?auto_1456309 ?auto_1456310 ?auto_1456311 ?auto_1456312 ?auto_1456313 ?auto_1456314 ?auto_1456315 ?auto_1456316 ?auto_1456317 ?auto_1456318 ?auto_1456319 ?auto_1456320 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456430 - SURFACE
      ?auto_1456431 - SURFACE
      ?auto_1456432 - SURFACE
      ?auto_1456433 - SURFACE
      ?auto_1456434 - SURFACE
      ?auto_1456435 - SURFACE
      ?auto_1456436 - SURFACE
      ?auto_1456437 - SURFACE
      ?auto_1456438 - SURFACE
      ?auto_1456439 - SURFACE
      ?auto_1456440 - SURFACE
      ?auto_1456441 - SURFACE
    )
    :vars
    (
      ?auto_1456445 - HOIST
      ?auto_1456443 - PLACE
      ?auto_1456444 - TRUCK
      ?auto_1456442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456445 ?auto_1456443 ) ( SURFACE-AT ?auto_1456440 ?auto_1456443 ) ( CLEAR ?auto_1456440 ) ( IS-CRATE ?auto_1456441 ) ( not ( = ?auto_1456440 ?auto_1456441 ) ) ( AVAILABLE ?auto_1456445 ) ( IN ?auto_1456441 ?auto_1456444 ) ( ON ?auto_1456440 ?auto_1456439 ) ( not ( = ?auto_1456439 ?auto_1456440 ) ) ( not ( = ?auto_1456439 ?auto_1456441 ) ) ( TRUCK-AT ?auto_1456444 ?auto_1456442 ) ( not ( = ?auto_1456442 ?auto_1456443 ) ) ( ON ?auto_1456431 ?auto_1456430 ) ( ON ?auto_1456432 ?auto_1456431 ) ( ON ?auto_1456433 ?auto_1456432 ) ( ON ?auto_1456434 ?auto_1456433 ) ( ON ?auto_1456435 ?auto_1456434 ) ( ON ?auto_1456436 ?auto_1456435 ) ( ON ?auto_1456437 ?auto_1456436 ) ( ON ?auto_1456438 ?auto_1456437 ) ( ON ?auto_1456439 ?auto_1456438 ) ( not ( = ?auto_1456430 ?auto_1456431 ) ) ( not ( = ?auto_1456430 ?auto_1456432 ) ) ( not ( = ?auto_1456430 ?auto_1456433 ) ) ( not ( = ?auto_1456430 ?auto_1456434 ) ) ( not ( = ?auto_1456430 ?auto_1456435 ) ) ( not ( = ?auto_1456430 ?auto_1456436 ) ) ( not ( = ?auto_1456430 ?auto_1456437 ) ) ( not ( = ?auto_1456430 ?auto_1456438 ) ) ( not ( = ?auto_1456430 ?auto_1456439 ) ) ( not ( = ?auto_1456430 ?auto_1456440 ) ) ( not ( = ?auto_1456430 ?auto_1456441 ) ) ( not ( = ?auto_1456431 ?auto_1456432 ) ) ( not ( = ?auto_1456431 ?auto_1456433 ) ) ( not ( = ?auto_1456431 ?auto_1456434 ) ) ( not ( = ?auto_1456431 ?auto_1456435 ) ) ( not ( = ?auto_1456431 ?auto_1456436 ) ) ( not ( = ?auto_1456431 ?auto_1456437 ) ) ( not ( = ?auto_1456431 ?auto_1456438 ) ) ( not ( = ?auto_1456431 ?auto_1456439 ) ) ( not ( = ?auto_1456431 ?auto_1456440 ) ) ( not ( = ?auto_1456431 ?auto_1456441 ) ) ( not ( = ?auto_1456432 ?auto_1456433 ) ) ( not ( = ?auto_1456432 ?auto_1456434 ) ) ( not ( = ?auto_1456432 ?auto_1456435 ) ) ( not ( = ?auto_1456432 ?auto_1456436 ) ) ( not ( = ?auto_1456432 ?auto_1456437 ) ) ( not ( = ?auto_1456432 ?auto_1456438 ) ) ( not ( = ?auto_1456432 ?auto_1456439 ) ) ( not ( = ?auto_1456432 ?auto_1456440 ) ) ( not ( = ?auto_1456432 ?auto_1456441 ) ) ( not ( = ?auto_1456433 ?auto_1456434 ) ) ( not ( = ?auto_1456433 ?auto_1456435 ) ) ( not ( = ?auto_1456433 ?auto_1456436 ) ) ( not ( = ?auto_1456433 ?auto_1456437 ) ) ( not ( = ?auto_1456433 ?auto_1456438 ) ) ( not ( = ?auto_1456433 ?auto_1456439 ) ) ( not ( = ?auto_1456433 ?auto_1456440 ) ) ( not ( = ?auto_1456433 ?auto_1456441 ) ) ( not ( = ?auto_1456434 ?auto_1456435 ) ) ( not ( = ?auto_1456434 ?auto_1456436 ) ) ( not ( = ?auto_1456434 ?auto_1456437 ) ) ( not ( = ?auto_1456434 ?auto_1456438 ) ) ( not ( = ?auto_1456434 ?auto_1456439 ) ) ( not ( = ?auto_1456434 ?auto_1456440 ) ) ( not ( = ?auto_1456434 ?auto_1456441 ) ) ( not ( = ?auto_1456435 ?auto_1456436 ) ) ( not ( = ?auto_1456435 ?auto_1456437 ) ) ( not ( = ?auto_1456435 ?auto_1456438 ) ) ( not ( = ?auto_1456435 ?auto_1456439 ) ) ( not ( = ?auto_1456435 ?auto_1456440 ) ) ( not ( = ?auto_1456435 ?auto_1456441 ) ) ( not ( = ?auto_1456436 ?auto_1456437 ) ) ( not ( = ?auto_1456436 ?auto_1456438 ) ) ( not ( = ?auto_1456436 ?auto_1456439 ) ) ( not ( = ?auto_1456436 ?auto_1456440 ) ) ( not ( = ?auto_1456436 ?auto_1456441 ) ) ( not ( = ?auto_1456437 ?auto_1456438 ) ) ( not ( = ?auto_1456437 ?auto_1456439 ) ) ( not ( = ?auto_1456437 ?auto_1456440 ) ) ( not ( = ?auto_1456437 ?auto_1456441 ) ) ( not ( = ?auto_1456438 ?auto_1456439 ) ) ( not ( = ?auto_1456438 ?auto_1456440 ) ) ( not ( = ?auto_1456438 ?auto_1456441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456439 ?auto_1456440 ?auto_1456441 )
      ( MAKE-11CRATE-VERIFY ?auto_1456430 ?auto_1456431 ?auto_1456432 ?auto_1456433 ?auto_1456434 ?auto_1456435 ?auto_1456436 ?auto_1456437 ?auto_1456438 ?auto_1456439 ?auto_1456440 ?auto_1456441 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456562 - SURFACE
      ?auto_1456563 - SURFACE
      ?auto_1456564 - SURFACE
      ?auto_1456565 - SURFACE
      ?auto_1456566 - SURFACE
      ?auto_1456567 - SURFACE
      ?auto_1456568 - SURFACE
      ?auto_1456569 - SURFACE
      ?auto_1456570 - SURFACE
      ?auto_1456571 - SURFACE
      ?auto_1456572 - SURFACE
      ?auto_1456573 - SURFACE
    )
    :vars
    (
      ?auto_1456577 - HOIST
      ?auto_1456574 - PLACE
      ?auto_1456576 - TRUCK
      ?auto_1456578 - PLACE
      ?auto_1456575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456577 ?auto_1456574 ) ( SURFACE-AT ?auto_1456572 ?auto_1456574 ) ( CLEAR ?auto_1456572 ) ( IS-CRATE ?auto_1456573 ) ( not ( = ?auto_1456572 ?auto_1456573 ) ) ( AVAILABLE ?auto_1456577 ) ( ON ?auto_1456572 ?auto_1456571 ) ( not ( = ?auto_1456571 ?auto_1456572 ) ) ( not ( = ?auto_1456571 ?auto_1456573 ) ) ( TRUCK-AT ?auto_1456576 ?auto_1456578 ) ( not ( = ?auto_1456578 ?auto_1456574 ) ) ( HOIST-AT ?auto_1456575 ?auto_1456578 ) ( LIFTING ?auto_1456575 ?auto_1456573 ) ( not ( = ?auto_1456577 ?auto_1456575 ) ) ( ON ?auto_1456563 ?auto_1456562 ) ( ON ?auto_1456564 ?auto_1456563 ) ( ON ?auto_1456565 ?auto_1456564 ) ( ON ?auto_1456566 ?auto_1456565 ) ( ON ?auto_1456567 ?auto_1456566 ) ( ON ?auto_1456568 ?auto_1456567 ) ( ON ?auto_1456569 ?auto_1456568 ) ( ON ?auto_1456570 ?auto_1456569 ) ( ON ?auto_1456571 ?auto_1456570 ) ( not ( = ?auto_1456562 ?auto_1456563 ) ) ( not ( = ?auto_1456562 ?auto_1456564 ) ) ( not ( = ?auto_1456562 ?auto_1456565 ) ) ( not ( = ?auto_1456562 ?auto_1456566 ) ) ( not ( = ?auto_1456562 ?auto_1456567 ) ) ( not ( = ?auto_1456562 ?auto_1456568 ) ) ( not ( = ?auto_1456562 ?auto_1456569 ) ) ( not ( = ?auto_1456562 ?auto_1456570 ) ) ( not ( = ?auto_1456562 ?auto_1456571 ) ) ( not ( = ?auto_1456562 ?auto_1456572 ) ) ( not ( = ?auto_1456562 ?auto_1456573 ) ) ( not ( = ?auto_1456563 ?auto_1456564 ) ) ( not ( = ?auto_1456563 ?auto_1456565 ) ) ( not ( = ?auto_1456563 ?auto_1456566 ) ) ( not ( = ?auto_1456563 ?auto_1456567 ) ) ( not ( = ?auto_1456563 ?auto_1456568 ) ) ( not ( = ?auto_1456563 ?auto_1456569 ) ) ( not ( = ?auto_1456563 ?auto_1456570 ) ) ( not ( = ?auto_1456563 ?auto_1456571 ) ) ( not ( = ?auto_1456563 ?auto_1456572 ) ) ( not ( = ?auto_1456563 ?auto_1456573 ) ) ( not ( = ?auto_1456564 ?auto_1456565 ) ) ( not ( = ?auto_1456564 ?auto_1456566 ) ) ( not ( = ?auto_1456564 ?auto_1456567 ) ) ( not ( = ?auto_1456564 ?auto_1456568 ) ) ( not ( = ?auto_1456564 ?auto_1456569 ) ) ( not ( = ?auto_1456564 ?auto_1456570 ) ) ( not ( = ?auto_1456564 ?auto_1456571 ) ) ( not ( = ?auto_1456564 ?auto_1456572 ) ) ( not ( = ?auto_1456564 ?auto_1456573 ) ) ( not ( = ?auto_1456565 ?auto_1456566 ) ) ( not ( = ?auto_1456565 ?auto_1456567 ) ) ( not ( = ?auto_1456565 ?auto_1456568 ) ) ( not ( = ?auto_1456565 ?auto_1456569 ) ) ( not ( = ?auto_1456565 ?auto_1456570 ) ) ( not ( = ?auto_1456565 ?auto_1456571 ) ) ( not ( = ?auto_1456565 ?auto_1456572 ) ) ( not ( = ?auto_1456565 ?auto_1456573 ) ) ( not ( = ?auto_1456566 ?auto_1456567 ) ) ( not ( = ?auto_1456566 ?auto_1456568 ) ) ( not ( = ?auto_1456566 ?auto_1456569 ) ) ( not ( = ?auto_1456566 ?auto_1456570 ) ) ( not ( = ?auto_1456566 ?auto_1456571 ) ) ( not ( = ?auto_1456566 ?auto_1456572 ) ) ( not ( = ?auto_1456566 ?auto_1456573 ) ) ( not ( = ?auto_1456567 ?auto_1456568 ) ) ( not ( = ?auto_1456567 ?auto_1456569 ) ) ( not ( = ?auto_1456567 ?auto_1456570 ) ) ( not ( = ?auto_1456567 ?auto_1456571 ) ) ( not ( = ?auto_1456567 ?auto_1456572 ) ) ( not ( = ?auto_1456567 ?auto_1456573 ) ) ( not ( = ?auto_1456568 ?auto_1456569 ) ) ( not ( = ?auto_1456568 ?auto_1456570 ) ) ( not ( = ?auto_1456568 ?auto_1456571 ) ) ( not ( = ?auto_1456568 ?auto_1456572 ) ) ( not ( = ?auto_1456568 ?auto_1456573 ) ) ( not ( = ?auto_1456569 ?auto_1456570 ) ) ( not ( = ?auto_1456569 ?auto_1456571 ) ) ( not ( = ?auto_1456569 ?auto_1456572 ) ) ( not ( = ?auto_1456569 ?auto_1456573 ) ) ( not ( = ?auto_1456570 ?auto_1456571 ) ) ( not ( = ?auto_1456570 ?auto_1456572 ) ) ( not ( = ?auto_1456570 ?auto_1456573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456571 ?auto_1456572 ?auto_1456573 )
      ( MAKE-11CRATE-VERIFY ?auto_1456562 ?auto_1456563 ?auto_1456564 ?auto_1456565 ?auto_1456566 ?auto_1456567 ?auto_1456568 ?auto_1456569 ?auto_1456570 ?auto_1456571 ?auto_1456572 ?auto_1456573 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456705 - SURFACE
      ?auto_1456706 - SURFACE
      ?auto_1456707 - SURFACE
      ?auto_1456708 - SURFACE
      ?auto_1456709 - SURFACE
      ?auto_1456710 - SURFACE
      ?auto_1456711 - SURFACE
      ?auto_1456712 - SURFACE
      ?auto_1456713 - SURFACE
      ?auto_1456714 - SURFACE
      ?auto_1456715 - SURFACE
      ?auto_1456716 - SURFACE
    )
    :vars
    (
      ?auto_1456718 - HOIST
      ?auto_1456721 - PLACE
      ?auto_1456722 - TRUCK
      ?auto_1456719 - PLACE
      ?auto_1456720 - HOIST
      ?auto_1456717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456718 ?auto_1456721 ) ( SURFACE-AT ?auto_1456715 ?auto_1456721 ) ( CLEAR ?auto_1456715 ) ( IS-CRATE ?auto_1456716 ) ( not ( = ?auto_1456715 ?auto_1456716 ) ) ( AVAILABLE ?auto_1456718 ) ( ON ?auto_1456715 ?auto_1456714 ) ( not ( = ?auto_1456714 ?auto_1456715 ) ) ( not ( = ?auto_1456714 ?auto_1456716 ) ) ( TRUCK-AT ?auto_1456722 ?auto_1456719 ) ( not ( = ?auto_1456719 ?auto_1456721 ) ) ( HOIST-AT ?auto_1456720 ?auto_1456719 ) ( not ( = ?auto_1456718 ?auto_1456720 ) ) ( AVAILABLE ?auto_1456720 ) ( SURFACE-AT ?auto_1456716 ?auto_1456719 ) ( ON ?auto_1456716 ?auto_1456717 ) ( CLEAR ?auto_1456716 ) ( not ( = ?auto_1456715 ?auto_1456717 ) ) ( not ( = ?auto_1456716 ?auto_1456717 ) ) ( not ( = ?auto_1456714 ?auto_1456717 ) ) ( ON ?auto_1456706 ?auto_1456705 ) ( ON ?auto_1456707 ?auto_1456706 ) ( ON ?auto_1456708 ?auto_1456707 ) ( ON ?auto_1456709 ?auto_1456708 ) ( ON ?auto_1456710 ?auto_1456709 ) ( ON ?auto_1456711 ?auto_1456710 ) ( ON ?auto_1456712 ?auto_1456711 ) ( ON ?auto_1456713 ?auto_1456712 ) ( ON ?auto_1456714 ?auto_1456713 ) ( not ( = ?auto_1456705 ?auto_1456706 ) ) ( not ( = ?auto_1456705 ?auto_1456707 ) ) ( not ( = ?auto_1456705 ?auto_1456708 ) ) ( not ( = ?auto_1456705 ?auto_1456709 ) ) ( not ( = ?auto_1456705 ?auto_1456710 ) ) ( not ( = ?auto_1456705 ?auto_1456711 ) ) ( not ( = ?auto_1456705 ?auto_1456712 ) ) ( not ( = ?auto_1456705 ?auto_1456713 ) ) ( not ( = ?auto_1456705 ?auto_1456714 ) ) ( not ( = ?auto_1456705 ?auto_1456715 ) ) ( not ( = ?auto_1456705 ?auto_1456716 ) ) ( not ( = ?auto_1456705 ?auto_1456717 ) ) ( not ( = ?auto_1456706 ?auto_1456707 ) ) ( not ( = ?auto_1456706 ?auto_1456708 ) ) ( not ( = ?auto_1456706 ?auto_1456709 ) ) ( not ( = ?auto_1456706 ?auto_1456710 ) ) ( not ( = ?auto_1456706 ?auto_1456711 ) ) ( not ( = ?auto_1456706 ?auto_1456712 ) ) ( not ( = ?auto_1456706 ?auto_1456713 ) ) ( not ( = ?auto_1456706 ?auto_1456714 ) ) ( not ( = ?auto_1456706 ?auto_1456715 ) ) ( not ( = ?auto_1456706 ?auto_1456716 ) ) ( not ( = ?auto_1456706 ?auto_1456717 ) ) ( not ( = ?auto_1456707 ?auto_1456708 ) ) ( not ( = ?auto_1456707 ?auto_1456709 ) ) ( not ( = ?auto_1456707 ?auto_1456710 ) ) ( not ( = ?auto_1456707 ?auto_1456711 ) ) ( not ( = ?auto_1456707 ?auto_1456712 ) ) ( not ( = ?auto_1456707 ?auto_1456713 ) ) ( not ( = ?auto_1456707 ?auto_1456714 ) ) ( not ( = ?auto_1456707 ?auto_1456715 ) ) ( not ( = ?auto_1456707 ?auto_1456716 ) ) ( not ( = ?auto_1456707 ?auto_1456717 ) ) ( not ( = ?auto_1456708 ?auto_1456709 ) ) ( not ( = ?auto_1456708 ?auto_1456710 ) ) ( not ( = ?auto_1456708 ?auto_1456711 ) ) ( not ( = ?auto_1456708 ?auto_1456712 ) ) ( not ( = ?auto_1456708 ?auto_1456713 ) ) ( not ( = ?auto_1456708 ?auto_1456714 ) ) ( not ( = ?auto_1456708 ?auto_1456715 ) ) ( not ( = ?auto_1456708 ?auto_1456716 ) ) ( not ( = ?auto_1456708 ?auto_1456717 ) ) ( not ( = ?auto_1456709 ?auto_1456710 ) ) ( not ( = ?auto_1456709 ?auto_1456711 ) ) ( not ( = ?auto_1456709 ?auto_1456712 ) ) ( not ( = ?auto_1456709 ?auto_1456713 ) ) ( not ( = ?auto_1456709 ?auto_1456714 ) ) ( not ( = ?auto_1456709 ?auto_1456715 ) ) ( not ( = ?auto_1456709 ?auto_1456716 ) ) ( not ( = ?auto_1456709 ?auto_1456717 ) ) ( not ( = ?auto_1456710 ?auto_1456711 ) ) ( not ( = ?auto_1456710 ?auto_1456712 ) ) ( not ( = ?auto_1456710 ?auto_1456713 ) ) ( not ( = ?auto_1456710 ?auto_1456714 ) ) ( not ( = ?auto_1456710 ?auto_1456715 ) ) ( not ( = ?auto_1456710 ?auto_1456716 ) ) ( not ( = ?auto_1456710 ?auto_1456717 ) ) ( not ( = ?auto_1456711 ?auto_1456712 ) ) ( not ( = ?auto_1456711 ?auto_1456713 ) ) ( not ( = ?auto_1456711 ?auto_1456714 ) ) ( not ( = ?auto_1456711 ?auto_1456715 ) ) ( not ( = ?auto_1456711 ?auto_1456716 ) ) ( not ( = ?auto_1456711 ?auto_1456717 ) ) ( not ( = ?auto_1456712 ?auto_1456713 ) ) ( not ( = ?auto_1456712 ?auto_1456714 ) ) ( not ( = ?auto_1456712 ?auto_1456715 ) ) ( not ( = ?auto_1456712 ?auto_1456716 ) ) ( not ( = ?auto_1456712 ?auto_1456717 ) ) ( not ( = ?auto_1456713 ?auto_1456714 ) ) ( not ( = ?auto_1456713 ?auto_1456715 ) ) ( not ( = ?auto_1456713 ?auto_1456716 ) ) ( not ( = ?auto_1456713 ?auto_1456717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456714 ?auto_1456715 ?auto_1456716 )
      ( MAKE-11CRATE-VERIFY ?auto_1456705 ?auto_1456706 ?auto_1456707 ?auto_1456708 ?auto_1456709 ?auto_1456710 ?auto_1456711 ?auto_1456712 ?auto_1456713 ?auto_1456714 ?auto_1456715 ?auto_1456716 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456849 - SURFACE
      ?auto_1456850 - SURFACE
      ?auto_1456851 - SURFACE
      ?auto_1456852 - SURFACE
      ?auto_1456853 - SURFACE
      ?auto_1456854 - SURFACE
      ?auto_1456855 - SURFACE
      ?auto_1456856 - SURFACE
      ?auto_1456857 - SURFACE
      ?auto_1456858 - SURFACE
      ?auto_1456859 - SURFACE
      ?auto_1456860 - SURFACE
    )
    :vars
    (
      ?auto_1456861 - HOIST
      ?auto_1456863 - PLACE
      ?auto_1456865 - PLACE
      ?auto_1456866 - HOIST
      ?auto_1456862 - SURFACE
      ?auto_1456864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456861 ?auto_1456863 ) ( SURFACE-AT ?auto_1456859 ?auto_1456863 ) ( CLEAR ?auto_1456859 ) ( IS-CRATE ?auto_1456860 ) ( not ( = ?auto_1456859 ?auto_1456860 ) ) ( AVAILABLE ?auto_1456861 ) ( ON ?auto_1456859 ?auto_1456858 ) ( not ( = ?auto_1456858 ?auto_1456859 ) ) ( not ( = ?auto_1456858 ?auto_1456860 ) ) ( not ( = ?auto_1456865 ?auto_1456863 ) ) ( HOIST-AT ?auto_1456866 ?auto_1456865 ) ( not ( = ?auto_1456861 ?auto_1456866 ) ) ( AVAILABLE ?auto_1456866 ) ( SURFACE-AT ?auto_1456860 ?auto_1456865 ) ( ON ?auto_1456860 ?auto_1456862 ) ( CLEAR ?auto_1456860 ) ( not ( = ?auto_1456859 ?auto_1456862 ) ) ( not ( = ?auto_1456860 ?auto_1456862 ) ) ( not ( = ?auto_1456858 ?auto_1456862 ) ) ( TRUCK-AT ?auto_1456864 ?auto_1456863 ) ( ON ?auto_1456850 ?auto_1456849 ) ( ON ?auto_1456851 ?auto_1456850 ) ( ON ?auto_1456852 ?auto_1456851 ) ( ON ?auto_1456853 ?auto_1456852 ) ( ON ?auto_1456854 ?auto_1456853 ) ( ON ?auto_1456855 ?auto_1456854 ) ( ON ?auto_1456856 ?auto_1456855 ) ( ON ?auto_1456857 ?auto_1456856 ) ( ON ?auto_1456858 ?auto_1456857 ) ( not ( = ?auto_1456849 ?auto_1456850 ) ) ( not ( = ?auto_1456849 ?auto_1456851 ) ) ( not ( = ?auto_1456849 ?auto_1456852 ) ) ( not ( = ?auto_1456849 ?auto_1456853 ) ) ( not ( = ?auto_1456849 ?auto_1456854 ) ) ( not ( = ?auto_1456849 ?auto_1456855 ) ) ( not ( = ?auto_1456849 ?auto_1456856 ) ) ( not ( = ?auto_1456849 ?auto_1456857 ) ) ( not ( = ?auto_1456849 ?auto_1456858 ) ) ( not ( = ?auto_1456849 ?auto_1456859 ) ) ( not ( = ?auto_1456849 ?auto_1456860 ) ) ( not ( = ?auto_1456849 ?auto_1456862 ) ) ( not ( = ?auto_1456850 ?auto_1456851 ) ) ( not ( = ?auto_1456850 ?auto_1456852 ) ) ( not ( = ?auto_1456850 ?auto_1456853 ) ) ( not ( = ?auto_1456850 ?auto_1456854 ) ) ( not ( = ?auto_1456850 ?auto_1456855 ) ) ( not ( = ?auto_1456850 ?auto_1456856 ) ) ( not ( = ?auto_1456850 ?auto_1456857 ) ) ( not ( = ?auto_1456850 ?auto_1456858 ) ) ( not ( = ?auto_1456850 ?auto_1456859 ) ) ( not ( = ?auto_1456850 ?auto_1456860 ) ) ( not ( = ?auto_1456850 ?auto_1456862 ) ) ( not ( = ?auto_1456851 ?auto_1456852 ) ) ( not ( = ?auto_1456851 ?auto_1456853 ) ) ( not ( = ?auto_1456851 ?auto_1456854 ) ) ( not ( = ?auto_1456851 ?auto_1456855 ) ) ( not ( = ?auto_1456851 ?auto_1456856 ) ) ( not ( = ?auto_1456851 ?auto_1456857 ) ) ( not ( = ?auto_1456851 ?auto_1456858 ) ) ( not ( = ?auto_1456851 ?auto_1456859 ) ) ( not ( = ?auto_1456851 ?auto_1456860 ) ) ( not ( = ?auto_1456851 ?auto_1456862 ) ) ( not ( = ?auto_1456852 ?auto_1456853 ) ) ( not ( = ?auto_1456852 ?auto_1456854 ) ) ( not ( = ?auto_1456852 ?auto_1456855 ) ) ( not ( = ?auto_1456852 ?auto_1456856 ) ) ( not ( = ?auto_1456852 ?auto_1456857 ) ) ( not ( = ?auto_1456852 ?auto_1456858 ) ) ( not ( = ?auto_1456852 ?auto_1456859 ) ) ( not ( = ?auto_1456852 ?auto_1456860 ) ) ( not ( = ?auto_1456852 ?auto_1456862 ) ) ( not ( = ?auto_1456853 ?auto_1456854 ) ) ( not ( = ?auto_1456853 ?auto_1456855 ) ) ( not ( = ?auto_1456853 ?auto_1456856 ) ) ( not ( = ?auto_1456853 ?auto_1456857 ) ) ( not ( = ?auto_1456853 ?auto_1456858 ) ) ( not ( = ?auto_1456853 ?auto_1456859 ) ) ( not ( = ?auto_1456853 ?auto_1456860 ) ) ( not ( = ?auto_1456853 ?auto_1456862 ) ) ( not ( = ?auto_1456854 ?auto_1456855 ) ) ( not ( = ?auto_1456854 ?auto_1456856 ) ) ( not ( = ?auto_1456854 ?auto_1456857 ) ) ( not ( = ?auto_1456854 ?auto_1456858 ) ) ( not ( = ?auto_1456854 ?auto_1456859 ) ) ( not ( = ?auto_1456854 ?auto_1456860 ) ) ( not ( = ?auto_1456854 ?auto_1456862 ) ) ( not ( = ?auto_1456855 ?auto_1456856 ) ) ( not ( = ?auto_1456855 ?auto_1456857 ) ) ( not ( = ?auto_1456855 ?auto_1456858 ) ) ( not ( = ?auto_1456855 ?auto_1456859 ) ) ( not ( = ?auto_1456855 ?auto_1456860 ) ) ( not ( = ?auto_1456855 ?auto_1456862 ) ) ( not ( = ?auto_1456856 ?auto_1456857 ) ) ( not ( = ?auto_1456856 ?auto_1456858 ) ) ( not ( = ?auto_1456856 ?auto_1456859 ) ) ( not ( = ?auto_1456856 ?auto_1456860 ) ) ( not ( = ?auto_1456856 ?auto_1456862 ) ) ( not ( = ?auto_1456857 ?auto_1456858 ) ) ( not ( = ?auto_1456857 ?auto_1456859 ) ) ( not ( = ?auto_1456857 ?auto_1456860 ) ) ( not ( = ?auto_1456857 ?auto_1456862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456858 ?auto_1456859 ?auto_1456860 )
      ( MAKE-11CRATE-VERIFY ?auto_1456849 ?auto_1456850 ?auto_1456851 ?auto_1456852 ?auto_1456853 ?auto_1456854 ?auto_1456855 ?auto_1456856 ?auto_1456857 ?auto_1456858 ?auto_1456859 ?auto_1456860 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456993 - SURFACE
      ?auto_1456994 - SURFACE
      ?auto_1456995 - SURFACE
      ?auto_1456996 - SURFACE
      ?auto_1456997 - SURFACE
      ?auto_1456998 - SURFACE
      ?auto_1456999 - SURFACE
      ?auto_1457000 - SURFACE
      ?auto_1457001 - SURFACE
      ?auto_1457002 - SURFACE
      ?auto_1457003 - SURFACE
      ?auto_1457004 - SURFACE
    )
    :vars
    (
      ?auto_1457007 - HOIST
      ?auto_1457006 - PLACE
      ?auto_1457010 - PLACE
      ?auto_1457008 - HOIST
      ?auto_1457009 - SURFACE
      ?auto_1457005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1457007 ?auto_1457006 ) ( IS-CRATE ?auto_1457004 ) ( not ( = ?auto_1457003 ?auto_1457004 ) ) ( not ( = ?auto_1457002 ?auto_1457003 ) ) ( not ( = ?auto_1457002 ?auto_1457004 ) ) ( not ( = ?auto_1457010 ?auto_1457006 ) ) ( HOIST-AT ?auto_1457008 ?auto_1457010 ) ( not ( = ?auto_1457007 ?auto_1457008 ) ) ( AVAILABLE ?auto_1457008 ) ( SURFACE-AT ?auto_1457004 ?auto_1457010 ) ( ON ?auto_1457004 ?auto_1457009 ) ( CLEAR ?auto_1457004 ) ( not ( = ?auto_1457003 ?auto_1457009 ) ) ( not ( = ?auto_1457004 ?auto_1457009 ) ) ( not ( = ?auto_1457002 ?auto_1457009 ) ) ( TRUCK-AT ?auto_1457005 ?auto_1457006 ) ( SURFACE-AT ?auto_1457002 ?auto_1457006 ) ( CLEAR ?auto_1457002 ) ( LIFTING ?auto_1457007 ?auto_1457003 ) ( IS-CRATE ?auto_1457003 ) ( ON ?auto_1456994 ?auto_1456993 ) ( ON ?auto_1456995 ?auto_1456994 ) ( ON ?auto_1456996 ?auto_1456995 ) ( ON ?auto_1456997 ?auto_1456996 ) ( ON ?auto_1456998 ?auto_1456997 ) ( ON ?auto_1456999 ?auto_1456998 ) ( ON ?auto_1457000 ?auto_1456999 ) ( ON ?auto_1457001 ?auto_1457000 ) ( ON ?auto_1457002 ?auto_1457001 ) ( not ( = ?auto_1456993 ?auto_1456994 ) ) ( not ( = ?auto_1456993 ?auto_1456995 ) ) ( not ( = ?auto_1456993 ?auto_1456996 ) ) ( not ( = ?auto_1456993 ?auto_1456997 ) ) ( not ( = ?auto_1456993 ?auto_1456998 ) ) ( not ( = ?auto_1456993 ?auto_1456999 ) ) ( not ( = ?auto_1456993 ?auto_1457000 ) ) ( not ( = ?auto_1456993 ?auto_1457001 ) ) ( not ( = ?auto_1456993 ?auto_1457002 ) ) ( not ( = ?auto_1456993 ?auto_1457003 ) ) ( not ( = ?auto_1456993 ?auto_1457004 ) ) ( not ( = ?auto_1456993 ?auto_1457009 ) ) ( not ( = ?auto_1456994 ?auto_1456995 ) ) ( not ( = ?auto_1456994 ?auto_1456996 ) ) ( not ( = ?auto_1456994 ?auto_1456997 ) ) ( not ( = ?auto_1456994 ?auto_1456998 ) ) ( not ( = ?auto_1456994 ?auto_1456999 ) ) ( not ( = ?auto_1456994 ?auto_1457000 ) ) ( not ( = ?auto_1456994 ?auto_1457001 ) ) ( not ( = ?auto_1456994 ?auto_1457002 ) ) ( not ( = ?auto_1456994 ?auto_1457003 ) ) ( not ( = ?auto_1456994 ?auto_1457004 ) ) ( not ( = ?auto_1456994 ?auto_1457009 ) ) ( not ( = ?auto_1456995 ?auto_1456996 ) ) ( not ( = ?auto_1456995 ?auto_1456997 ) ) ( not ( = ?auto_1456995 ?auto_1456998 ) ) ( not ( = ?auto_1456995 ?auto_1456999 ) ) ( not ( = ?auto_1456995 ?auto_1457000 ) ) ( not ( = ?auto_1456995 ?auto_1457001 ) ) ( not ( = ?auto_1456995 ?auto_1457002 ) ) ( not ( = ?auto_1456995 ?auto_1457003 ) ) ( not ( = ?auto_1456995 ?auto_1457004 ) ) ( not ( = ?auto_1456995 ?auto_1457009 ) ) ( not ( = ?auto_1456996 ?auto_1456997 ) ) ( not ( = ?auto_1456996 ?auto_1456998 ) ) ( not ( = ?auto_1456996 ?auto_1456999 ) ) ( not ( = ?auto_1456996 ?auto_1457000 ) ) ( not ( = ?auto_1456996 ?auto_1457001 ) ) ( not ( = ?auto_1456996 ?auto_1457002 ) ) ( not ( = ?auto_1456996 ?auto_1457003 ) ) ( not ( = ?auto_1456996 ?auto_1457004 ) ) ( not ( = ?auto_1456996 ?auto_1457009 ) ) ( not ( = ?auto_1456997 ?auto_1456998 ) ) ( not ( = ?auto_1456997 ?auto_1456999 ) ) ( not ( = ?auto_1456997 ?auto_1457000 ) ) ( not ( = ?auto_1456997 ?auto_1457001 ) ) ( not ( = ?auto_1456997 ?auto_1457002 ) ) ( not ( = ?auto_1456997 ?auto_1457003 ) ) ( not ( = ?auto_1456997 ?auto_1457004 ) ) ( not ( = ?auto_1456997 ?auto_1457009 ) ) ( not ( = ?auto_1456998 ?auto_1456999 ) ) ( not ( = ?auto_1456998 ?auto_1457000 ) ) ( not ( = ?auto_1456998 ?auto_1457001 ) ) ( not ( = ?auto_1456998 ?auto_1457002 ) ) ( not ( = ?auto_1456998 ?auto_1457003 ) ) ( not ( = ?auto_1456998 ?auto_1457004 ) ) ( not ( = ?auto_1456998 ?auto_1457009 ) ) ( not ( = ?auto_1456999 ?auto_1457000 ) ) ( not ( = ?auto_1456999 ?auto_1457001 ) ) ( not ( = ?auto_1456999 ?auto_1457002 ) ) ( not ( = ?auto_1456999 ?auto_1457003 ) ) ( not ( = ?auto_1456999 ?auto_1457004 ) ) ( not ( = ?auto_1456999 ?auto_1457009 ) ) ( not ( = ?auto_1457000 ?auto_1457001 ) ) ( not ( = ?auto_1457000 ?auto_1457002 ) ) ( not ( = ?auto_1457000 ?auto_1457003 ) ) ( not ( = ?auto_1457000 ?auto_1457004 ) ) ( not ( = ?auto_1457000 ?auto_1457009 ) ) ( not ( = ?auto_1457001 ?auto_1457002 ) ) ( not ( = ?auto_1457001 ?auto_1457003 ) ) ( not ( = ?auto_1457001 ?auto_1457004 ) ) ( not ( = ?auto_1457001 ?auto_1457009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1457002 ?auto_1457003 ?auto_1457004 )
      ( MAKE-11CRATE-VERIFY ?auto_1456993 ?auto_1456994 ?auto_1456995 ?auto_1456996 ?auto_1456997 ?auto_1456998 ?auto_1456999 ?auto_1457000 ?auto_1457001 ?auto_1457002 ?auto_1457003 ?auto_1457004 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1457137 - SURFACE
      ?auto_1457138 - SURFACE
      ?auto_1457139 - SURFACE
      ?auto_1457140 - SURFACE
      ?auto_1457141 - SURFACE
      ?auto_1457142 - SURFACE
      ?auto_1457143 - SURFACE
      ?auto_1457144 - SURFACE
      ?auto_1457145 - SURFACE
      ?auto_1457146 - SURFACE
      ?auto_1457147 - SURFACE
      ?auto_1457148 - SURFACE
    )
    :vars
    (
      ?auto_1457152 - HOIST
      ?auto_1457151 - PLACE
      ?auto_1457149 - PLACE
      ?auto_1457154 - HOIST
      ?auto_1457153 - SURFACE
      ?auto_1457150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1457152 ?auto_1457151 ) ( IS-CRATE ?auto_1457148 ) ( not ( = ?auto_1457147 ?auto_1457148 ) ) ( not ( = ?auto_1457146 ?auto_1457147 ) ) ( not ( = ?auto_1457146 ?auto_1457148 ) ) ( not ( = ?auto_1457149 ?auto_1457151 ) ) ( HOIST-AT ?auto_1457154 ?auto_1457149 ) ( not ( = ?auto_1457152 ?auto_1457154 ) ) ( AVAILABLE ?auto_1457154 ) ( SURFACE-AT ?auto_1457148 ?auto_1457149 ) ( ON ?auto_1457148 ?auto_1457153 ) ( CLEAR ?auto_1457148 ) ( not ( = ?auto_1457147 ?auto_1457153 ) ) ( not ( = ?auto_1457148 ?auto_1457153 ) ) ( not ( = ?auto_1457146 ?auto_1457153 ) ) ( TRUCK-AT ?auto_1457150 ?auto_1457151 ) ( SURFACE-AT ?auto_1457146 ?auto_1457151 ) ( CLEAR ?auto_1457146 ) ( IS-CRATE ?auto_1457147 ) ( AVAILABLE ?auto_1457152 ) ( IN ?auto_1457147 ?auto_1457150 ) ( ON ?auto_1457138 ?auto_1457137 ) ( ON ?auto_1457139 ?auto_1457138 ) ( ON ?auto_1457140 ?auto_1457139 ) ( ON ?auto_1457141 ?auto_1457140 ) ( ON ?auto_1457142 ?auto_1457141 ) ( ON ?auto_1457143 ?auto_1457142 ) ( ON ?auto_1457144 ?auto_1457143 ) ( ON ?auto_1457145 ?auto_1457144 ) ( ON ?auto_1457146 ?auto_1457145 ) ( not ( = ?auto_1457137 ?auto_1457138 ) ) ( not ( = ?auto_1457137 ?auto_1457139 ) ) ( not ( = ?auto_1457137 ?auto_1457140 ) ) ( not ( = ?auto_1457137 ?auto_1457141 ) ) ( not ( = ?auto_1457137 ?auto_1457142 ) ) ( not ( = ?auto_1457137 ?auto_1457143 ) ) ( not ( = ?auto_1457137 ?auto_1457144 ) ) ( not ( = ?auto_1457137 ?auto_1457145 ) ) ( not ( = ?auto_1457137 ?auto_1457146 ) ) ( not ( = ?auto_1457137 ?auto_1457147 ) ) ( not ( = ?auto_1457137 ?auto_1457148 ) ) ( not ( = ?auto_1457137 ?auto_1457153 ) ) ( not ( = ?auto_1457138 ?auto_1457139 ) ) ( not ( = ?auto_1457138 ?auto_1457140 ) ) ( not ( = ?auto_1457138 ?auto_1457141 ) ) ( not ( = ?auto_1457138 ?auto_1457142 ) ) ( not ( = ?auto_1457138 ?auto_1457143 ) ) ( not ( = ?auto_1457138 ?auto_1457144 ) ) ( not ( = ?auto_1457138 ?auto_1457145 ) ) ( not ( = ?auto_1457138 ?auto_1457146 ) ) ( not ( = ?auto_1457138 ?auto_1457147 ) ) ( not ( = ?auto_1457138 ?auto_1457148 ) ) ( not ( = ?auto_1457138 ?auto_1457153 ) ) ( not ( = ?auto_1457139 ?auto_1457140 ) ) ( not ( = ?auto_1457139 ?auto_1457141 ) ) ( not ( = ?auto_1457139 ?auto_1457142 ) ) ( not ( = ?auto_1457139 ?auto_1457143 ) ) ( not ( = ?auto_1457139 ?auto_1457144 ) ) ( not ( = ?auto_1457139 ?auto_1457145 ) ) ( not ( = ?auto_1457139 ?auto_1457146 ) ) ( not ( = ?auto_1457139 ?auto_1457147 ) ) ( not ( = ?auto_1457139 ?auto_1457148 ) ) ( not ( = ?auto_1457139 ?auto_1457153 ) ) ( not ( = ?auto_1457140 ?auto_1457141 ) ) ( not ( = ?auto_1457140 ?auto_1457142 ) ) ( not ( = ?auto_1457140 ?auto_1457143 ) ) ( not ( = ?auto_1457140 ?auto_1457144 ) ) ( not ( = ?auto_1457140 ?auto_1457145 ) ) ( not ( = ?auto_1457140 ?auto_1457146 ) ) ( not ( = ?auto_1457140 ?auto_1457147 ) ) ( not ( = ?auto_1457140 ?auto_1457148 ) ) ( not ( = ?auto_1457140 ?auto_1457153 ) ) ( not ( = ?auto_1457141 ?auto_1457142 ) ) ( not ( = ?auto_1457141 ?auto_1457143 ) ) ( not ( = ?auto_1457141 ?auto_1457144 ) ) ( not ( = ?auto_1457141 ?auto_1457145 ) ) ( not ( = ?auto_1457141 ?auto_1457146 ) ) ( not ( = ?auto_1457141 ?auto_1457147 ) ) ( not ( = ?auto_1457141 ?auto_1457148 ) ) ( not ( = ?auto_1457141 ?auto_1457153 ) ) ( not ( = ?auto_1457142 ?auto_1457143 ) ) ( not ( = ?auto_1457142 ?auto_1457144 ) ) ( not ( = ?auto_1457142 ?auto_1457145 ) ) ( not ( = ?auto_1457142 ?auto_1457146 ) ) ( not ( = ?auto_1457142 ?auto_1457147 ) ) ( not ( = ?auto_1457142 ?auto_1457148 ) ) ( not ( = ?auto_1457142 ?auto_1457153 ) ) ( not ( = ?auto_1457143 ?auto_1457144 ) ) ( not ( = ?auto_1457143 ?auto_1457145 ) ) ( not ( = ?auto_1457143 ?auto_1457146 ) ) ( not ( = ?auto_1457143 ?auto_1457147 ) ) ( not ( = ?auto_1457143 ?auto_1457148 ) ) ( not ( = ?auto_1457143 ?auto_1457153 ) ) ( not ( = ?auto_1457144 ?auto_1457145 ) ) ( not ( = ?auto_1457144 ?auto_1457146 ) ) ( not ( = ?auto_1457144 ?auto_1457147 ) ) ( not ( = ?auto_1457144 ?auto_1457148 ) ) ( not ( = ?auto_1457144 ?auto_1457153 ) ) ( not ( = ?auto_1457145 ?auto_1457146 ) ) ( not ( = ?auto_1457145 ?auto_1457147 ) ) ( not ( = ?auto_1457145 ?auto_1457148 ) ) ( not ( = ?auto_1457145 ?auto_1457153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1457146 ?auto_1457147 ?auto_1457148 )
      ( MAKE-11CRATE-VERIFY ?auto_1457137 ?auto_1457138 ?auto_1457139 ?auto_1457140 ?auto_1457141 ?auto_1457142 ?auto_1457143 ?auto_1457144 ?auto_1457145 ?auto_1457146 ?auto_1457147 ?auto_1457148 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466410 - SURFACE
      ?auto_1466411 - SURFACE
      ?auto_1466412 - SURFACE
      ?auto_1466413 - SURFACE
      ?auto_1466414 - SURFACE
      ?auto_1466415 - SURFACE
      ?auto_1466416 - SURFACE
      ?auto_1466417 - SURFACE
      ?auto_1466418 - SURFACE
      ?auto_1466419 - SURFACE
      ?auto_1466420 - SURFACE
      ?auto_1466421 - SURFACE
      ?auto_1466422 - SURFACE
    )
    :vars
    (
      ?auto_1466423 - HOIST
      ?auto_1466424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466423 ?auto_1466424 ) ( SURFACE-AT ?auto_1466421 ?auto_1466424 ) ( CLEAR ?auto_1466421 ) ( LIFTING ?auto_1466423 ?auto_1466422 ) ( IS-CRATE ?auto_1466422 ) ( not ( = ?auto_1466421 ?auto_1466422 ) ) ( ON ?auto_1466411 ?auto_1466410 ) ( ON ?auto_1466412 ?auto_1466411 ) ( ON ?auto_1466413 ?auto_1466412 ) ( ON ?auto_1466414 ?auto_1466413 ) ( ON ?auto_1466415 ?auto_1466414 ) ( ON ?auto_1466416 ?auto_1466415 ) ( ON ?auto_1466417 ?auto_1466416 ) ( ON ?auto_1466418 ?auto_1466417 ) ( ON ?auto_1466419 ?auto_1466418 ) ( ON ?auto_1466420 ?auto_1466419 ) ( ON ?auto_1466421 ?auto_1466420 ) ( not ( = ?auto_1466410 ?auto_1466411 ) ) ( not ( = ?auto_1466410 ?auto_1466412 ) ) ( not ( = ?auto_1466410 ?auto_1466413 ) ) ( not ( = ?auto_1466410 ?auto_1466414 ) ) ( not ( = ?auto_1466410 ?auto_1466415 ) ) ( not ( = ?auto_1466410 ?auto_1466416 ) ) ( not ( = ?auto_1466410 ?auto_1466417 ) ) ( not ( = ?auto_1466410 ?auto_1466418 ) ) ( not ( = ?auto_1466410 ?auto_1466419 ) ) ( not ( = ?auto_1466410 ?auto_1466420 ) ) ( not ( = ?auto_1466410 ?auto_1466421 ) ) ( not ( = ?auto_1466410 ?auto_1466422 ) ) ( not ( = ?auto_1466411 ?auto_1466412 ) ) ( not ( = ?auto_1466411 ?auto_1466413 ) ) ( not ( = ?auto_1466411 ?auto_1466414 ) ) ( not ( = ?auto_1466411 ?auto_1466415 ) ) ( not ( = ?auto_1466411 ?auto_1466416 ) ) ( not ( = ?auto_1466411 ?auto_1466417 ) ) ( not ( = ?auto_1466411 ?auto_1466418 ) ) ( not ( = ?auto_1466411 ?auto_1466419 ) ) ( not ( = ?auto_1466411 ?auto_1466420 ) ) ( not ( = ?auto_1466411 ?auto_1466421 ) ) ( not ( = ?auto_1466411 ?auto_1466422 ) ) ( not ( = ?auto_1466412 ?auto_1466413 ) ) ( not ( = ?auto_1466412 ?auto_1466414 ) ) ( not ( = ?auto_1466412 ?auto_1466415 ) ) ( not ( = ?auto_1466412 ?auto_1466416 ) ) ( not ( = ?auto_1466412 ?auto_1466417 ) ) ( not ( = ?auto_1466412 ?auto_1466418 ) ) ( not ( = ?auto_1466412 ?auto_1466419 ) ) ( not ( = ?auto_1466412 ?auto_1466420 ) ) ( not ( = ?auto_1466412 ?auto_1466421 ) ) ( not ( = ?auto_1466412 ?auto_1466422 ) ) ( not ( = ?auto_1466413 ?auto_1466414 ) ) ( not ( = ?auto_1466413 ?auto_1466415 ) ) ( not ( = ?auto_1466413 ?auto_1466416 ) ) ( not ( = ?auto_1466413 ?auto_1466417 ) ) ( not ( = ?auto_1466413 ?auto_1466418 ) ) ( not ( = ?auto_1466413 ?auto_1466419 ) ) ( not ( = ?auto_1466413 ?auto_1466420 ) ) ( not ( = ?auto_1466413 ?auto_1466421 ) ) ( not ( = ?auto_1466413 ?auto_1466422 ) ) ( not ( = ?auto_1466414 ?auto_1466415 ) ) ( not ( = ?auto_1466414 ?auto_1466416 ) ) ( not ( = ?auto_1466414 ?auto_1466417 ) ) ( not ( = ?auto_1466414 ?auto_1466418 ) ) ( not ( = ?auto_1466414 ?auto_1466419 ) ) ( not ( = ?auto_1466414 ?auto_1466420 ) ) ( not ( = ?auto_1466414 ?auto_1466421 ) ) ( not ( = ?auto_1466414 ?auto_1466422 ) ) ( not ( = ?auto_1466415 ?auto_1466416 ) ) ( not ( = ?auto_1466415 ?auto_1466417 ) ) ( not ( = ?auto_1466415 ?auto_1466418 ) ) ( not ( = ?auto_1466415 ?auto_1466419 ) ) ( not ( = ?auto_1466415 ?auto_1466420 ) ) ( not ( = ?auto_1466415 ?auto_1466421 ) ) ( not ( = ?auto_1466415 ?auto_1466422 ) ) ( not ( = ?auto_1466416 ?auto_1466417 ) ) ( not ( = ?auto_1466416 ?auto_1466418 ) ) ( not ( = ?auto_1466416 ?auto_1466419 ) ) ( not ( = ?auto_1466416 ?auto_1466420 ) ) ( not ( = ?auto_1466416 ?auto_1466421 ) ) ( not ( = ?auto_1466416 ?auto_1466422 ) ) ( not ( = ?auto_1466417 ?auto_1466418 ) ) ( not ( = ?auto_1466417 ?auto_1466419 ) ) ( not ( = ?auto_1466417 ?auto_1466420 ) ) ( not ( = ?auto_1466417 ?auto_1466421 ) ) ( not ( = ?auto_1466417 ?auto_1466422 ) ) ( not ( = ?auto_1466418 ?auto_1466419 ) ) ( not ( = ?auto_1466418 ?auto_1466420 ) ) ( not ( = ?auto_1466418 ?auto_1466421 ) ) ( not ( = ?auto_1466418 ?auto_1466422 ) ) ( not ( = ?auto_1466419 ?auto_1466420 ) ) ( not ( = ?auto_1466419 ?auto_1466421 ) ) ( not ( = ?auto_1466419 ?auto_1466422 ) ) ( not ( = ?auto_1466420 ?auto_1466421 ) ) ( not ( = ?auto_1466420 ?auto_1466422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1466421 ?auto_1466422 )
      ( MAKE-12CRATE-VERIFY ?auto_1466410 ?auto_1466411 ?auto_1466412 ?auto_1466413 ?auto_1466414 ?auto_1466415 ?auto_1466416 ?auto_1466417 ?auto_1466418 ?auto_1466419 ?auto_1466420 ?auto_1466421 ?auto_1466422 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466535 - SURFACE
      ?auto_1466536 - SURFACE
      ?auto_1466537 - SURFACE
      ?auto_1466538 - SURFACE
      ?auto_1466539 - SURFACE
      ?auto_1466540 - SURFACE
      ?auto_1466541 - SURFACE
      ?auto_1466542 - SURFACE
      ?auto_1466543 - SURFACE
      ?auto_1466544 - SURFACE
      ?auto_1466545 - SURFACE
      ?auto_1466546 - SURFACE
      ?auto_1466547 - SURFACE
    )
    :vars
    (
      ?auto_1466550 - HOIST
      ?auto_1466549 - PLACE
      ?auto_1466548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466550 ?auto_1466549 ) ( SURFACE-AT ?auto_1466546 ?auto_1466549 ) ( CLEAR ?auto_1466546 ) ( IS-CRATE ?auto_1466547 ) ( not ( = ?auto_1466546 ?auto_1466547 ) ) ( TRUCK-AT ?auto_1466548 ?auto_1466549 ) ( AVAILABLE ?auto_1466550 ) ( IN ?auto_1466547 ?auto_1466548 ) ( ON ?auto_1466546 ?auto_1466545 ) ( not ( = ?auto_1466545 ?auto_1466546 ) ) ( not ( = ?auto_1466545 ?auto_1466547 ) ) ( ON ?auto_1466536 ?auto_1466535 ) ( ON ?auto_1466537 ?auto_1466536 ) ( ON ?auto_1466538 ?auto_1466537 ) ( ON ?auto_1466539 ?auto_1466538 ) ( ON ?auto_1466540 ?auto_1466539 ) ( ON ?auto_1466541 ?auto_1466540 ) ( ON ?auto_1466542 ?auto_1466541 ) ( ON ?auto_1466543 ?auto_1466542 ) ( ON ?auto_1466544 ?auto_1466543 ) ( ON ?auto_1466545 ?auto_1466544 ) ( not ( = ?auto_1466535 ?auto_1466536 ) ) ( not ( = ?auto_1466535 ?auto_1466537 ) ) ( not ( = ?auto_1466535 ?auto_1466538 ) ) ( not ( = ?auto_1466535 ?auto_1466539 ) ) ( not ( = ?auto_1466535 ?auto_1466540 ) ) ( not ( = ?auto_1466535 ?auto_1466541 ) ) ( not ( = ?auto_1466535 ?auto_1466542 ) ) ( not ( = ?auto_1466535 ?auto_1466543 ) ) ( not ( = ?auto_1466535 ?auto_1466544 ) ) ( not ( = ?auto_1466535 ?auto_1466545 ) ) ( not ( = ?auto_1466535 ?auto_1466546 ) ) ( not ( = ?auto_1466535 ?auto_1466547 ) ) ( not ( = ?auto_1466536 ?auto_1466537 ) ) ( not ( = ?auto_1466536 ?auto_1466538 ) ) ( not ( = ?auto_1466536 ?auto_1466539 ) ) ( not ( = ?auto_1466536 ?auto_1466540 ) ) ( not ( = ?auto_1466536 ?auto_1466541 ) ) ( not ( = ?auto_1466536 ?auto_1466542 ) ) ( not ( = ?auto_1466536 ?auto_1466543 ) ) ( not ( = ?auto_1466536 ?auto_1466544 ) ) ( not ( = ?auto_1466536 ?auto_1466545 ) ) ( not ( = ?auto_1466536 ?auto_1466546 ) ) ( not ( = ?auto_1466536 ?auto_1466547 ) ) ( not ( = ?auto_1466537 ?auto_1466538 ) ) ( not ( = ?auto_1466537 ?auto_1466539 ) ) ( not ( = ?auto_1466537 ?auto_1466540 ) ) ( not ( = ?auto_1466537 ?auto_1466541 ) ) ( not ( = ?auto_1466537 ?auto_1466542 ) ) ( not ( = ?auto_1466537 ?auto_1466543 ) ) ( not ( = ?auto_1466537 ?auto_1466544 ) ) ( not ( = ?auto_1466537 ?auto_1466545 ) ) ( not ( = ?auto_1466537 ?auto_1466546 ) ) ( not ( = ?auto_1466537 ?auto_1466547 ) ) ( not ( = ?auto_1466538 ?auto_1466539 ) ) ( not ( = ?auto_1466538 ?auto_1466540 ) ) ( not ( = ?auto_1466538 ?auto_1466541 ) ) ( not ( = ?auto_1466538 ?auto_1466542 ) ) ( not ( = ?auto_1466538 ?auto_1466543 ) ) ( not ( = ?auto_1466538 ?auto_1466544 ) ) ( not ( = ?auto_1466538 ?auto_1466545 ) ) ( not ( = ?auto_1466538 ?auto_1466546 ) ) ( not ( = ?auto_1466538 ?auto_1466547 ) ) ( not ( = ?auto_1466539 ?auto_1466540 ) ) ( not ( = ?auto_1466539 ?auto_1466541 ) ) ( not ( = ?auto_1466539 ?auto_1466542 ) ) ( not ( = ?auto_1466539 ?auto_1466543 ) ) ( not ( = ?auto_1466539 ?auto_1466544 ) ) ( not ( = ?auto_1466539 ?auto_1466545 ) ) ( not ( = ?auto_1466539 ?auto_1466546 ) ) ( not ( = ?auto_1466539 ?auto_1466547 ) ) ( not ( = ?auto_1466540 ?auto_1466541 ) ) ( not ( = ?auto_1466540 ?auto_1466542 ) ) ( not ( = ?auto_1466540 ?auto_1466543 ) ) ( not ( = ?auto_1466540 ?auto_1466544 ) ) ( not ( = ?auto_1466540 ?auto_1466545 ) ) ( not ( = ?auto_1466540 ?auto_1466546 ) ) ( not ( = ?auto_1466540 ?auto_1466547 ) ) ( not ( = ?auto_1466541 ?auto_1466542 ) ) ( not ( = ?auto_1466541 ?auto_1466543 ) ) ( not ( = ?auto_1466541 ?auto_1466544 ) ) ( not ( = ?auto_1466541 ?auto_1466545 ) ) ( not ( = ?auto_1466541 ?auto_1466546 ) ) ( not ( = ?auto_1466541 ?auto_1466547 ) ) ( not ( = ?auto_1466542 ?auto_1466543 ) ) ( not ( = ?auto_1466542 ?auto_1466544 ) ) ( not ( = ?auto_1466542 ?auto_1466545 ) ) ( not ( = ?auto_1466542 ?auto_1466546 ) ) ( not ( = ?auto_1466542 ?auto_1466547 ) ) ( not ( = ?auto_1466543 ?auto_1466544 ) ) ( not ( = ?auto_1466543 ?auto_1466545 ) ) ( not ( = ?auto_1466543 ?auto_1466546 ) ) ( not ( = ?auto_1466543 ?auto_1466547 ) ) ( not ( = ?auto_1466544 ?auto_1466545 ) ) ( not ( = ?auto_1466544 ?auto_1466546 ) ) ( not ( = ?auto_1466544 ?auto_1466547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466545 ?auto_1466546 ?auto_1466547 )
      ( MAKE-12CRATE-VERIFY ?auto_1466535 ?auto_1466536 ?auto_1466537 ?auto_1466538 ?auto_1466539 ?auto_1466540 ?auto_1466541 ?auto_1466542 ?auto_1466543 ?auto_1466544 ?auto_1466545 ?auto_1466546 ?auto_1466547 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466673 - SURFACE
      ?auto_1466674 - SURFACE
      ?auto_1466675 - SURFACE
      ?auto_1466676 - SURFACE
      ?auto_1466677 - SURFACE
      ?auto_1466678 - SURFACE
      ?auto_1466679 - SURFACE
      ?auto_1466680 - SURFACE
      ?auto_1466681 - SURFACE
      ?auto_1466682 - SURFACE
      ?auto_1466683 - SURFACE
      ?auto_1466684 - SURFACE
      ?auto_1466685 - SURFACE
    )
    :vars
    (
      ?auto_1466688 - HOIST
      ?auto_1466686 - PLACE
      ?auto_1466687 - TRUCK
      ?auto_1466689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466688 ?auto_1466686 ) ( SURFACE-AT ?auto_1466684 ?auto_1466686 ) ( CLEAR ?auto_1466684 ) ( IS-CRATE ?auto_1466685 ) ( not ( = ?auto_1466684 ?auto_1466685 ) ) ( AVAILABLE ?auto_1466688 ) ( IN ?auto_1466685 ?auto_1466687 ) ( ON ?auto_1466684 ?auto_1466683 ) ( not ( = ?auto_1466683 ?auto_1466684 ) ) ( not ( = ?auto_1466683 ?auto_1466685 ) ) ( TRUCK-AT ?auto_1466687 ?auto_1466689 ) ( not ( = ?auto_1466689 ?auto_1466686 ) ) ( ON ?auto_1466674 ?auto_1466673 ) ( ON ?auto_1466675 ?auto_1466674 ) ( ON ?auto_1466676 ?auto_1466675 ) ( ON ?auto_1466677 ?auto_1466676 ) ( ON ?auto_1466678 ?auto_1466677 ) ( ON ?auto_1466679 ?auto_1466678 ) ( ON ?auto_1466680 ?auto_1466679 ) ( ON ?auto_1466681 ?auto_1466680 ) ( ON ?auto_1466682 ?auto_1466681 ) ( ON ?auto_1466683 ?auto_1466682 ) ( not ( = ?auto_1466673 ?auto_1466674 ) ) ( not ( = ?auto_1466673 ?auto_1466675 ) ) ( not ( = ?auto_1466673 ?auto_1466676 ) ) ( not ( = ?auto_1466673 ?auto_1466677 ) ) ( not ( = ?auto_1466673 ?auto_1466678 ) ) ( not ( = ?auto_1466673 ?auto_1466679 ) ) ( not ( = ?auto_1466673 ?auto_1466680 ) ) ( not ( = ?auto_1466673 ?auto_1466681 ) ) ( not ( = ?auto_1466673 ?auto_1466682 ) ) ( not ( = ?auto_1466673 ?auto_1466683 ) ) ( not ( = ?auto_1466673 ?auto_1466684 ) ) ( not ( = ?auto_1466673 ?auto_1466685 ) ) ( not ( = ?auto_1466674 ?auto_1466675 ) ) ( not ( = ?auto_1466674 ?auto_1466676 ) ) ( not ( = ?auto_1466674 ?auto_1466677 ) ) ( not ( = ?auto_1466674 ?auto_1466678 ) ) ( not ( = ?auto_1466674 ?auto_1466679 ) ) ( not ( = ?auto_1466674 ?auto_1466680 ) ) ( not ( = ?auto_1466674 ?auto_1466681 ) ) ( not ( = ?auto_1466674 ?auto_1466682 ) ) ( not ( = ?auto_1466674 ?auto_1466683 ) ) ( not ( = ?auto_1466674 ?auto_1466684 ) ) ( not ( = ?auto_1466674 ?auto_1466685 ) ) ( not ( = ?auto_1466675 ?auto_1466676 ) ) ( not ( = ?auto_1466675 ?auto_1466677 ) ) ( not ( = ?auto_1466675 ?auto_1466678 ) ) ( not ( = ?auto_1466675 ?auto_1466679 ) ) ( not ( = ?auto_1466675 ?auto_1466680 ) ) ( not ( = ?auto_1466675 ?auto_1466681 ) ) ( not ( = ?auto_1466675 ?auto_1466682 ) ) ( not ( = ?auto_1466675 ?auto_1466683 ) ) ( not ( = ?auto_1466675 ?auto_1466684 ) ) ( not ( = ?auto_1466675 ?auto_1466685 ) ) ( not ( = ?auto_1466676 ?auto_1466677 ) ) ( not ( = ?auto_1466676 ?auto_1466678 ) ) ( not ( = ?auto_1466676 ?auto_1466679 ) ) ( not ( = ?auto_1466676 ?auto_1466680 ) ) ( not ( = ?auto_1466676 ?auto_1466681 ) ) ( not ( = ?auto_1466676 ?auto_1466682 ) ) ( not ( = ?auto_1466676 ?auto_1466683 ) ) ( not ( = ?auto_1466676 ?auto_1466684 ) ) ( not ( = ?auto_1466676 ?auto_1466685 ) ) ( not ( = ?auto_1466677 ?auto_1466678 ) ) ( not ( = ?auto_1466677 ?auto_1466679 ) ) ( not ( = ?auto_1466677 ?auto_1466680 ) ) ( not ( = ?auto_1466677 ?auto_1466681 ) ) ( not ( = ?auto_1466677 ?auto_1466682 ) ) ( not ( = ?auto_1466677 ?auto_1466683 ) ) ( not ( = ?auto_1466677 ?auto_1466684 ) ) ( not ( = ?auto_1466677 ?auto_1466685 ) ) ( not ( = ?auto_1466678 ?auto_1466679 ) ) ( not ( = ?auto_1466678 ?auto_1466680 ) ) ( not ( = ?auto_1466678 ?auto_1466681 ) ) ( not ( = ?auto_1466678 ?auto_1466682 ) ) ( not ( = ?auto_1466678 ?auto_1466683 ) ) ( not ( = ?auto_1466678 ?auto_1466684 ) ) ( not ( = ?auto_1466678 ?auto_1466685 ) ) ( not ( = ?auto_1466679 ?auto_1466680 ) ) ( not ( = ?auto_1466679 ?auto_1466681 ) ) ( not ( = ?auto_1466679 ?auto_1466682 ) ) ( not ( = ?auto_1466679 ?auto_1466683 ) ) ( not ( = ?auto_1466679 ?auto_1466684 ) ) ( not ( = ?auto_1466679 ?auto_1466685 ) ) ( not ( = ?auto_1466680 ?auto_1466681 ) ) ( not ( = ?auto_1466680 ?auto_1466682 ) ) ( not ( = ?auto_1466680 ?auto_1466683 ) ) ( not ( = ?auto_1466680 ?auto_1466684 ) ) ( not ( = ?auto_1466680 ?auto_1466685 ) ) ( not ( = ?auto_1466681 ?auto_1466682 ) ) ( not ( = ?auto_1466681 ?auto_1466683 ) ) ( not ( = ?auto_1466681 ?auto_1466684 ) ) ( not ( = ?auto_1466681 ?auto_1466685 ) ) ( not ( = ?auto_1466682 ?auto_1466683 ) ) ( not ( = ?auto_1466682 ?auto_1466684 ) ) ( not ( = ?auto_1466682 ?auto_1466685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466683 ?auto_1466684 ?auto_1466685 )
      ( MAKE-12CRATE-VERIFY ?auto_1466673 ?auto_1466674 ?auto_1466675 ?auto_1466676 ?auto_1466677 ?auto_1466678 ?auto_1466679 ?auto_1466680 ?auto_1466681 ?auto_1466682 ?auto_1466683 ?auto_1466684 ?auto_1466685 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466823 - SURFACE
      ?auto_1466824 - SURFACE
      ?auto_1466825 - SURFACE
      ?auto_1466826 - SURFACE
      ?auto_1466827 - SURFACE
      ?auto_1466828 - SURFACE
      ?auto_1466829 - SURFACE
      ?auto_1466830 - SURFACE
      ?auto_1466831 - SURFACE
      ?auto_1466832 - SURFACE
      ?auto_1466833 - SURFACE
      ?auto_1466834 - SURFACE
      ?auto_1466835 - SURFACE
    )
    :vars
    (
      ?auto_1466838 - HOIST
      ?auto_1466837 - PLACE
      ?auto_1466839 - TRUCK
      ?auto_1466836 - PLACE
      ?auto_1466840 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466838 ?auto_1466837 ) ( SURFACE-AT ?auto_1466834 ?auto_1466837 ) ( CLEAR ?auto_1466834 ) ( IS-CRATE ?auto_1466835 ) ( not ( = ?auto_1466834 ?auto_1466835 ) ) ( AVAILABLE ?auto_1466838 ) ( ON ?auto_1466834 ?auto_1466833 ) ( not ( = ?auto_1466833 ?auto_1466834 ) ) ( not ( = ?auto_1466833 ?auto_1466835 ) ) ( TRUCK-AT ?auto_1466839 ?auto_1466836 ) ( not ( = ?auto_1466836 ?auto_1466837 ) ) ( HOIST-AT ?auto_1466840 ?auto_1466836 ) ( LIFTING ?auto_1466840 ?auto_1466835 ) ( not ( = ?auto_1466838 ?auto_1466840 ) ) ( ON ?auto_1466824 ?auto_1466823 ) ( ON ?auto_1466825 ?auto_1466824 ) ( ON ?auto_1466826 ?auto_1466825 ) ( ON ?auto_1466827 ?auto_1466826 ) ( ON ?auto_1466828 ?auto_1466827 ) ( ON ?auto_1466829 ?auto_1466828 ) ( ON ?auto_1466830 ?auto_1466829 ) ( ON ?auto_1466831 ?auto_1466830 ) ( ON ?auto_1466832 ?auto_1466831 ) ( ON ?auto_1466833 ?auto_1466832 ) ( not ( = ?auto_1466823 ?auto_1466824 ) ) ( not ( = ?auto_1466823 ?auto_1466825 ) ) ( not ( = ?auto_1466823 ?auto_1466826 ) ) ( not ( = ?auto_1466823 ?auto_1466827 ) ) ( not ( = ?auto_1466823 ?auto_1466828 ) ) ( not ( = ?auto_1466823 ?auto_1466829 ) ) ( not ( = ?auto_1466823 ?auto_1466830 ) ) ( not ( = ?auto_1466823 ?auto_1466831 ) ) ( not ( = ?auto_1466823 ?auto_1466832 ) ) ( not ( = ?auto_1466823 ?auto_1466833 ) ) ( not ( = ?auto_1466823 ?auto_1466834 ) ) ( not ( = ?auto_1466823 ?auto_1466835 ) ) ( not ( = ?auto_1466824 ?auto_1466825 ) ) ( not ( = ?auto_1466824 ?auto_1466826 ) ) ( not ( = ?auto_1466824 ?auto_1466827 ) ) ( not ( = ?auto_1466824 ?auto_1466828 ) ) ( not ( = ?auto_1466824 ?auto_1466829 ) ) ( not ( = ?auto_1466824 ?auto_1466830 ) ) ( not ( = ?auto_1466824 ?auto_1466831 ) ) ( not ( = ?auto_1466824 ?auto_1466832 ) ) ( not ( = ?auto_1466824 ?auto_1466833 ) ) ( not ( = ?auto_1466824 ?auto_1466834 ) ) ( not ( = ?auto_1466824 ?auto_1466835 ) ) ( not ( = ?auto_1466825 ?auto_1466826 ) ) ( not ( = ?auto_1466825 ?auto_1466827 ) ) ( not ( = ?auto_1466825 ?auto_1466828 ) ) ( not ( = ?auto_1466825 ?auto_1466829 ) ) ( not ( = ?auto_1466825 ?auto_1466830 ) ) ( not ( = ?auto_1466825 ?auto_1466831 ) ) ( not ( = ?auto_1466825 ?auto_1466832 ) ) ( not ( = ?auto_1466825 ?auto_1466833 ) ) ( not ( = ?auto_1466825 ?auto_1466834 ) ) ( not ( = ?auto_1466825 ?auto_1466835 ) ) ( not ( = ?auto_1466826 ?auto_1466827 ) ) ( not ( = ?auto_1466826 ?auto_1466828 ) ) ( not ( = ?auto_1466826 ?auto_1466829 ) ) ( not ( = ?auto_1466826 ?auto_1466830 ) ) ( not ( = ?auto_1466826 ?auto_1466831 ) ) ( not ( = ?auto_1466826 ?auto_1466832 ) ) ( not ( = ?auto_1466826 ?auto_1466833 ) ) ( not ( = ?auto_1466826 ?auto_1466834 ) ) ( not ( = ?auto_1466826 ?auto_1466835 ) ) ( not ( = ?auto_1466827 ?auto_1466828 ) ) ( not ( = ?auto_1466827 ?auto_1466829 ) ) ( not ( = ?auto_1466827 ?auto_1466830 ) ) ( not ( = ?auto_1466827 ?auto_1466831 ) ) ( not ( = ?auto_1466827 ?auto_1466832 ) ) ( not ( = ?auto_1466827 ?auto_1466833 ) ) ( not ( = ?auto_1466827 ?auto_1466834 ) ) ( not ( = ?auto_1466827 ?auto_1466835 ) ) ( not ( = ?auto_1466828 ?auto_1466829 ) ) ( not ( = ?auto_1466828 ?auto_1466830 ) ) ( not ( = ?auto_1466828 ?auto_1466831 ) ) ( not ( = ?auto_1466828 ?auto_1466832 ) ) ( not ( = ?auto_1466828 ?auto_1466833 ) ) ( not ( = ?auto_1466828 ?auto_1466834 ) ) ( not ( = ?auto_1466828 ?auto_1466835 ) ) ( not ( = ?auto_1466829 ?auto_1466830 ) ) ( not ( = ?auto_1466829 ?auto_1466831 ) ) ( not ( = ?auto_1466829 ?auto_1466832 ) ) ( not ( = ?auto_1466829 ?auto_1466833 ) ) ( not ( = ?auto_1466829 ?auto_1466834 ) ) ( not ( = ?auto_1466829 ?auto_1466835 ) ) ( not ( = ?auto_1466830 ?auto_1466831 ) ) ( not ( = ?auto_1466830 ?auto_1466832 ) ) ( not ( = ?auto_1466830 ?auto_1466833 ) ) ( not ( = ?auto_1466830 ?auto_1466834 ) ) ( not ( = ?auto_1466830 ?auto_1466835 ) ) ( not ( = ?auto_1466831 ?auto_1466832 ) ) ( not ( = ?auto_1466831 ?auto_1466833 ) ) ( not ( = ?auto_1466831 ?auto_1466834 ) ) ( not ( = ?auto_1466831 ?auto_1466835 ) ) ( not ( = ?auto_1466832 ?auto_1466833 ) ) ( not ( = ?auto_1466832 ?auto_1466834 ) ) ( not ( = ?auto_1466832 ?auto_1466835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466833 ?auto_1466834 ?auto_1466835 )
      ( MAKE-12CRATE-VERIFY ?auto_1466823 ?auto_1466824 ?auto_1466825 ?auto_1466826 ?auto_1466827 ?auto_1466828 ?auto_1466829 ?auto_1466830 ?auto_1466831 ?auto_1466832 ?auto_1466833 ?auto_1466834 ?auto_1466835 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466985 - SURFACE
      ?auto_1466986 - SURFACE
      ?auto_1466987 - SURFACE
      ?auto_1466988 - SURFACE
      ?auto_1466989 - SURFACE
      ?auto_1466990 - SURFACE
      ?auto_1466991 - SURFACE
      ?auto_1466992 - SURFACE
      ?auto_1466993 - SURFACE
      ?auto_1466994 - SURFACE
      ?auto_1466995 - SURFACE
      ?auto_1466996 - SURFACE
      ?auto_1466997 - SURFACE
    )
    :vars
    (
      ?auto_1466998 - HOIST
      ?auto_1467003 - PLACE
      ?auto_1467000 - TRUCK
      ?auto_1466999 - PLACE
      ?auto_1467002 - HOIST
      ?auto_1467001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466998 ?auto_1467003 ) ( SURFACE-AT ?auto_1466996 ?auto_1467003 ) ( CLEAR ?auto_1466996 ) ( IS-CRATE ?auto_1466997 ) ( not ( = ?auto_1466996 ?auto_1466997 ) ) ( AVAILABLE ?auto_1466998 ) ( ON ?auto_1466996 ?auto_1466995 ) ( not ( = ?auto_1466995 ?auto_1466996 ) ) ( not ( = ?auto_1466995 ?auto_1466997 ) ) ( TRUCK-AT ?auto_1467000 ?auto_1466999 ) ( not ( = ?auto_1466999 ?auto_1467003 ) ) ( HOIST-AT ?auto_1467002 ?auto_1466999 ) ( not ( = ?auto_1466998 ?auto_1467002 ) ) ( AVAILABLE ?auto_1467002 ) ( SURFACE-AT ?auto_1466997 ?auto_1466999 ) ( ON ?auto_1466997 ?auto_1467001 ) ( CLEAR ?auto_1466997 ) ( not ( = ?auto_1466996 ?auto_1467001 ) ) ( not ( = ?auto_1466997 ?auto_1467001 ) ) ( not ( = ?auto_1466995 ?auto_1467001 ) ) ( ON ?auto_1466986 ?auto_1466985 ) ( ON ?auto_1466987 ?auto_1466986 ) ( ON ?auto_1466988 ?auto_1466987 ) ( ON ?auto_1466989 ?auto_1466988 ) ( ON ?auto_1466990 ?auto_1466989 ) ( ON ?auto_1466991 ?auto_1466990 ) ( ON ?auto_1466992 ?auto_1466991 ) ( ON ?auto_1466993 ?auto_1466992 ) ( ON ?auto_1466994 ?auto_1466993 ) ( ON ?auto_1466995 ?auto_1466994 ) ( not ( = ?auto_1466985 ?auto_1466986 ) ) ( not ( = ?auto_1466985 ?auto_1466987 ) ) ( not ( = ?auto_1466985 ?auto_1466988 ) ) ( not ( = ?auto_1466985 ?auto_1466989 ) ) ( not ( = ?auto_1466985 ?auto_1466990 ) ) ( not ( = ?auto_1466985 ?auto_1466991 ) ) ( not ( = ?auto_1466985 ?auto_1466992 ) ) ( not ( = ?auto_1466985 ?auto_1466993 ) ) ( not ( = ?auto_1466985 ?auto_1466994 ) ) ( not ( = ?auto_1466985 ?auto_1466995 ) ) ( not ( = ?auto_1466985 ?auto_1466996 ) ) ( not ( = ?auto_1466985 ?auto_1466997 ) ) ( not ( = ?auto_1466985 ?auto_1467001 ) ) ( not ( = ?auto_1466986 ?auto_1466987 ) ) ( not ( = ?auto_1466986 ?auto_1466988 ) ) ( not ( = ?auto_1466986 ?auto_1466989 ) ) ( not ( = ?auto_1466986 ?auto_1466990 ) ) ( not ( = ?auto_1466986 ?auto_1466991 ) ) ( not ( = ?auto_1466986 ?auto_1466992 ) ) ( not ( = ?auto_1466986 ?auto_1466993 ) ) ( not ( = ?auto_1466986 ?auto_1466994 ) ) ( not ( = ?auto_1466986 ?auto_1466995 ) ) ( not ( = ?auto_1466986 ?auto_1466996 ) ) ( not ( = ?auto_1466986 ?auto_1466997 ) ) ( not ( = ?auto_1466986 ?auto_1467001 ) ) ( not ( = ?auto_1466987 ?auto_1466988 ) ) ( not ( = ?auto_1466987 ?auto_1466989 ) ) ( not ( = ?auto_1466987 ?auto_1466990 ) ) ( not ( = ?auto_1466987 ?auto_1466991 ) ) ( not ( = ?auto_1466987 ?auto_1466992 ) ) ( not ( = ?auto_1466987 ?auto_1466993 ) ) ( not ( = ?auto_1466987 ?auto_1466994 ) ) ( not ( = ?auto_1466987 ?auto_1466995 ) ) ( not ( = ?auto_1466987 ?auto_1466996 ) ) ( not ( = ?auto_1466987 ?auto_1466997 ) ) ( not ( = ?auto_1466987 ?auto_1467001 ) ) ( not ( = ?auto_1466988 ?auto_1466989 ) ) ( not ( = ?auto_1466988 ?auto_1466990 ) ) ( not ( = ?auto_1466988 ?auto_1466991 ) ) ( not ( = ?auto_1466988 ?auto_1466992 ) ) ( not ( = ?auto_1466988 ?auto_1466993 ) ) ( not ( = ?auto_1466988 ?auto_1466994 ) ) ( not ( = ?auto_1466988 ?auto_1466995 ) ) ( not ( = ?auto_1466988 ?auto_1466996 ) ) ( not ( = ?auto_1466988 ?auto_1466997 ) ) ( not ( = ?auto_1466988 ?auto_1467001 ) ) ( not ( = ?auto_1466989 ?auto_1466990 ) ) ( not ( = ?auto_1466989 ?auto_1466991 ) ) ( not ( = ?auto_1466989 ?auto_1466992 ) ) ( not ( = ?auto_1466989 ?auto_1466993 ) ) ( not ( = ?auto_1466989 ?auto_1466994 ) ) ( not ( = ?auto_1466989 ?auto_1466995 ) ) ( not ( = ?auto_1466989 ?auto_1466996 ) ) ( not ( = ?auto_1466989 ?auto_1466997 ) ) ( not ( = ?auto_1466989 ?auto_1467001 ) ) ( not ( = ?auto_1466990 ?auto_1466991 ) ) ( not ( = ?auto_1466990 ?auto_1466992 ) ) ( not ( = ?auto_1466990 ?auto_1466993 ) ) ( not ( = ?auto_1466990 ?auto_1466994 ) ) ( not ( = ?auto_1466990 ?auto_1466995 ) ) ( not ( = ?auto_1466990 ?auto_1466996 ) ) ( not ( = ?auto_1466990 ?auto_1466997 ) ) ( not ( = ?auto_1466990 ?auto_1467001 ) ) ( not ( = ?auto_1466991 ?auto_1466992 ) ) ( not ( = ?auto_1466991 ?auto_1466993 ) ) ( not ( = ?auto_1466991 ?auto_1466994 ) ) ( not ( = ?auto_1466991 ?auto_1466995 ) ) ( not ( = ?auto_1466991 ?auto_1466996 ) ) ( not ( = ?auto_1466991 ?auto_1466997 ) ) ( not ( = ?auto_1466991 ?auto_1467001 ) ) ( not ( = ?auto_1466992 ?auto_1466993 ) ) ( not ( = ?auto_1466992 ?auto_1466994 ) ) ( not ( = ?auto_1466992 ?auto_1466995 ) ) ( not ( = ?auto_1466992 ?auto_1466996 ) ) ( not ( = ?auto_1466992 ?auto_1466997 ) ) ( not ( = ?auto_1466992 ?auto_1467001 ) ) ( not ( = ?auto_1466993 ?auto_1466994 ) ) ( not ( = ?auto_1466993 ?auto_1466995 ) ) ( not ( = ?auto_1466993 ?auto_1466996 ) ) ( not ( = ?auto_1466993 ?auto_1466997 ) ) ( not ( = ?auto_1466993 ?auto_1467001 ) ) ( not ( = ?auto_1466994 ?auto_1466995 ) ) ( not ( = ?auto_1466994 ?auto_1466996 ) ) ( not ( = ?auto_1466994 ?auto_1466997 ) ) ( not ( = ?auto_1466994 ?auto_1467001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466995 ?auto_1466996 ?auto_1466997 )
      ( MAKE-12CRATE-VERIFY ?auto_1466985 ?auto_1466986 ?auto_1466987 ?auto_1466988 ?auto_1466989 ?auto_1466990 ?auto_1466991 ?auto_1466992 ?auto_1466993 ?auto_1466994 ?auto_1466995 ?auto_1466996 ?auto_1466997 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1467148 - SURFACE
      ?auto_1467149 - SURFACE
      ?auto_1467150 - SURFACE
      ?auto_1467151 - SURFACE
      ?auto_1467152 - SURFACE
      ?auto_1467153 - SURFACE
      ?auto_1467154 - SURFACE
      ?auto_1467155 - SURFACE
      ?auto_1467156 - SURFACE
      ?auto_1467157 - SURFACE
      ?auto_1467158 - SURFACE
      ?auto_1467159 - SURFACE
      ?auto_1467160 - SURFACE
    )
    :vars
    (
      ?auto_1467164 - HOIST
      ?auto_1467161 - PLACE
      ?auto_1467162 - PLACE
      ?auto_1467165 - HOIST
      ?auto_1467163 - SURFACE
      ?auto_1467166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1467164 ?auto_1467161 ) ( SURFACE-AT ?auto_1467159 ?auto_1467161 ) ( CLEAR ?auto_1467159 ) ( IS-CRATE ?auto_1467160 ) ( not ( = ?auto_1467159 ?auto_1467160 ) ) ( AVAILABLE ?auto_1467164 ) ( ON ?auto_1467159 ?auto_1467158 ) ( not ( = ?auto_1467158 ?auto_1467159 ) ) ( not ( = ?auto_1467158 ?auto_1467160 ) ) ( not ( = ?auto_1467162 ?auto_1467161 ) ) ( HOIST-AT ?auto_1467165 ?auto_1467162 ) ( not ( = ?auto_1467164 ?auto_1467165 ) ) ( AVAILABLE ?auto_1467165 ) ( SURFACE-AT ?auto_1467160 ?auto_1467162 ) ( ON ?auto_1467160 ?auto_1467163 ) ( CLEAR ?auto_1467160 ) ( not ( = ?auto_1467159 ?auto_1467163 ) ) ( not ( = ?auto_1467160 ?auto_1467163 ) ) ( not ( = ?auto_1467158 ?auto_1467163 ) ) ( TRUCK-AT ?auto_1467166 ?auto_1467161 ) ( ON ?auto_1467149 ?auto_1467148 ) ( ON ?auto_1467150 ?auto_1467149 ) ( ON ?auto_1467151 ?auto_1467150 ) ( ON ?auto_1467152 ?auto_1467151 ) ( ON ?auto_1467153 ?auto_1467152 ) ( ON ?auto_1467154 ?auto_1467153 ) ( ON ?auto_1467155 ?auto_1467154 ) ( ON ?auto_1467156 ?auto_1467155 ) ( ON ?auto_1467157 ?auto_1467156 ) ( ON ?auto_1467158 ?auto_1467157 ) ( not ( = ?auto_1467148 ?auto_1467149 ) ) ( not ( = ?auto_1467148 ?auto_1467150 ) ) ( not ( = ?auto_1467148 ?auto_1467151 ) ) ( not ( = ?auto_1467148 ?auto_1467152 ) ) ( not ( = ?auto_1467148 ?auto_1467153 ) ) ( not ( = ?auto_1467148 ?auto_1467154 ) ) ( not ( = ?auto_1467148 ?auto_1467155 ) ) ( not ( = ?auto_1467148 ?auto_1467156 ) ) ( not ( = ?auto_1467148 ?auto_1467157 ) ) ( not ( = ?auto_1467148 ?auto_1467158 ) ) ( not ( = ?auto_1467148 ?auto_1467159 ) ) ( not ( = ?auto_1467148 ?auto_1467160 ) ) ( not ( = ?auto_1467148 ?auto_1467163 ) ) ( not ( = ?auto_1467149 ?auto_1467150 ) ) ( not ( = ?auto_1467149 ?auto_1467151 ) ) ( not ( = ?auto_1467149 ?auto_1467152 ) ) ( not ( = ?auto_1467149 ?auto_1467153 ) ) ( not ( = ?auto_1467149 ?auto_1467154 ) ) ( not ( = ?auto_1467149 ?auto_1467155 ) ) ( not ( = ?auto_1467149 ?auto_1467156 ) ) ( not ( = ?auto_1467149 ?auto_1467157 ) ) ( not ( = ?auto_1467149 ?auto_1467158 ) ) ( not ( = ?auto_1467149 ?auto_1467159 ) ) ( not ( = ?auto_1467149 ?auto_1467160 ) ) ( not ( = ?auto_1467149 ?auto_1467163 ) ) ( not ( = ?auto_1467150 ?auto_1467151 ) ) ( not ( = ?auto_1467150 ?auto_1467152 ) ) ( not ( = ?auto_1467150 ?auto_1467153 ) ) ( not ( = ?auto_1467150 ?auto_1467154 ) ) ( not ( = ?auto_1467150 ?auto_1467155 ) ) ( not ( = ?auto_1467150 ?auto_1467156 ) ) ( not ( = ?auto_1467150 ?auto_1467157 ) ) ( not ( = ?auto_1467150 ?auto_1467158 ) ) ( not ( = ?auto_1467150 ?auto_1467159 ) ) ( not ( = ?auto_1467150 ?auto_1467160 ) ) ( not ( = ?auto_1467150 ?auto_1467163 ) ) ( not ( = ?auto_1467151 ?auto_1467152 ) ) ( not ( = ?auto_1467151 ?auto_1467153 ) ) ( not ( = ?auto_1467151 ?auto_1467154 ) ) ( not ( = ?auto_1467151 ?auto_1467155 ) ) ( not ( = ?auto_1467151 ?auto_1467156 ) ) ( not ( = ?auto_1467151 ?auto_1467157 ) ) ( not ( = ?auto_1467151 ?auto_1467158 ) ) ( not ( = ?auto_1467151 ?auto_1467159 ) ) ( not ( = ?auto_1467151 ?auto_1467160 ) ) ( not ( = ?auto_1467151 ?auto_1467163 ) ) ( not ( = ?auto_1467152 ?auto_1467153 ) ) ( not ( = ?auto_1467152 ?auto_1467154 ) ) ( not ( = ?auto_1467152 ?auto_1467155 ) ) ( not ( = ?auto_1467152 ?auto_1467156 ) ) ( not ( = ?auto_1467152 ?auto_1467157 ) ) ( not ( = ?auto_1467152 ?auto_1467158 ) ) ( not ( = ?auto_1467152 ?auto_1467159 ) ) ( not ( = ?auto_1467152 ?auto_1467160 ) ) ( not ( = ?auto_1467152 ?auto_1467163 ) ) ( not ( = ?auto_1467153 ?auto_1467154 ) ) ( not ( = ?auto_1467153 ?auto_1467155 ) ) ( not ( = ?auto_1467153 ?auto_1467156 ) ) ( not ( = ?auto_1467153 ?auto_1467157 ) ) ( not ( = ?auto_1467153 ?auto_1467158 ) ) ( not ( = ?auto_1467153 ?auto_1467159 ) ) ( not ( = ?auto_1467153 ?auto_1467160 ) ) ( not ( = ?auto_1467153 ?auto_1467163 ) ) ( not ( = ?auto_1467154 ?auto_1467155 ) ) ( not ( = ?auto_1467154 ?auto_1467156 ) ) ( not ( = ?auto_1467154 ?auto_1467157 ) ) ( not ( = ?auto_1467154 ?auto_1467158 ) ) ( not ( = ?auto_1467154 ?auto_1467159 ) ) ( not ( = ?auto_1467154 ?auto_1467160 ) ) ( not ( = ?auto_1467154 ?auto_1467163 ) ) ( not ( = ?auto_1467155 ?auto_1467156 ) ) ( not ( = ?auto_1467155 ?auto_1467157 ) ) ( not ( = ?auto_1467155 ?auto_1467158 ) ) ( not ( = ?auto_1467155 ?auto_1467159 ) ) ( not ( = ?auto_1467155 ?auto_1467160 ) ) ( not ( = ?auto_1467155 ?auto_1467163 ) ) ( not ( = ?auto_1467156 ?auto_1467157 ) ) ( not ( = ?auto_1467156 ?auto_1467158 ) ) ( not ( = ?auto_1467156 ?auto_1467159 ) ) ( not ( = ?auto_1467156 ?auto_1467160 ) ) ( not ( = ?auto_1467156 ?auto_1467163 ) ) ( not ( = ?auto_1467157 ?auto_1467158 ) ) ( not ( = ?auto_1467157 ?auto_1467159 ) ) ( not ( = ?auto_1467157 ?auto_1467160 ) ) ( not ( = ?auto_1467157 ?auto_1467163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1467158 ?auto_1467159 ?auto_1467160 )
      ( MAKE-12CRATE-VERIFY ?auto_1467148 ?auto_1467149 ?auto_1467150 ?auto_1467151 ?auto_1467152 ?auto_1467153 ?auto_1467154 ?auto_1467155 ?auto_1467156 ?auto_1467157 ?auto_1467158 ?auto_1467159 ?auto_1467160 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1467311 - SURFACE
      ?auto_1467312 - SURFACE
      ?auto_1467313 - SURFACE
      ?auto_1467314 - SURFACE
      ?auto_1467315 - SURFACE
      ?auto_1467316 - SURFACE
      ?auto_1467317 - SURFACE
      ?auto_1467318 - SURFACE
      ?auto_1467319 - SURFACE
      ?auto_1467320 - SURFACE
      ?auto_1467321 - SURFACE
      ?auto_1467322 - SURFACE
      ?auto_1467323 - SURFACE
    )
    :vars
    (
      ?auto_1467329 - HOIST
      ?auto_1467328 - PLACE
      ?auto_1467326 - PLACE
      ?auto_1467325 - HOIST
      ?auto_1467324 - SURFACE
      ?auto_1467327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1467329 ?auto_1467328 ) ( IS-CRATE ?auto_1467323 ) ( not ( = ?auto_1467322 ?auto_1467323 ) ) ( not ( = ?auto_1467321 ?auto_1467322 ) ) ( not ( = ?auto_1467321 ?auto_1467323 ) ) ( not ( = ?auto_1467326 ?auto_1467328 ) ) ( HOIST-AT ?auto_1467325 ?auto_1467326 ) ( not ( = ?auto_1467329 ?auto_1467325 ) ) ( AVAILABLE ?auto_1467325 ) ( SURFACE-AT ?auto_1467323 ?auto_1467326 ) ( ON ?auto_1467323 ?auto_1467324 ) ( CLEAR ?auto_1467323 ) ( not ( = ?auto_1467322 ?auto_1467324 ) ) ( not ( = ?auto_1467323 ?auto_1467324 ) ) ( not ( = ?auto_1467321 ?auto_1467324 ) ) ( TRUCK-AT ?auto_1467327 ?auto_1467328 ) ( SURFACE-AT ?auto_1467321 ?auto_1467328 ) ( CLEAR ?auto_1467321 ) ( LIFTING ?auto_1467329 ?auto_1467322 ) ( IS-CRATE ?auto_1467322 ) ( ON ?auto_1467312 ?auto_1467311 ) ( ON ?auto_1467313 ?auto_1467312 ) ( ON ?auto_1467314 ?auto_1467313 ) ( ON ?auto_1467315 ?auto_1467314 ) ( ON ?auto_1467316 ?auto_1467315 ) ( ON ?auto_1467317 ?auto_1467316 ) ( ON ?auto_1467318 ?auto_1467317 ) ( ON ?auto_1467319 ?auto_1467318 ) ( ON ?auto_1467320 ?auto_1467319 ) ( ON ?auto_1467321 ?auto_1467320 ) ( not ( = ?auto_1467311 ?auto_1467312 ) ) ( not ( = ?auto_1467311 ?auto_1467313 ) ) ( not ( = ?auto_1467311 ?auto_1467314 ) ) ( not ( = ?auto_1467311 ?auto_1467315 ) ) ( not ( = ?auto_1467311 ?auto_1467316 ) ) ( not ( = ?auto_1467311 ?auto_1467317 ) ) ( not ( = ?auto_1467311 ?auto_1467318 ) ) ( not ( = ?auto_1467311 ?auto_1467319 ) ) ( not ( = ?auto_1467311 ?auto_1467320 ) ) ( not ( = ?auto_1467311 ?auto_1467321 ) ) ( not ( = ?auto_1467311 ?auto_1467322 ) ) ( not ( = ?auto_1467311 ?auto_1467323 ) ) ( not ( = ?auto_1467311 ?auto_1467324 ) ) ( not ( = ?auto_1467312 ?auto_1467313 ) ) ( not ( = ?auto_1467312 ?auto_1467314 ) ) ( not ( = ?auto_1467312 ?auto_1467315 ) ) ( not ( = ?auto_1467312 ?auto_1467316 ) ) ( not ( = ?auto_1467312 ?auto_1467317 ) ) ( not ( = ?auto_1467312 ?auto_1467318 ) ) ( not ( = ?auto_1467312 ?auto_1467319 ) ) ( not ( = ?auto_1467312 ?auto_1467320 ) ) ( not ( = ?auto_1467312 ?auto_1467321 ) ) ( not ( = ?auto_1467312 ?auto_1467322 ) ) ( not ( = ?auto_1467312 ?auto_1467323 ) ) ( not ( = ?auto_1467312 ?auto_1467324 ) ) ( not ( = ?auto_1467313 ?auto_1467314 ) ) ( not ( = ?auto_1467313 ?auto_1467315 ) ) ( not ( = ?auto_1467313 ?auto_1467316 ) ) ( not ( = ?auto_1467313 ?auto_1467317 ) ) ( not ( = ?auto_1467313 ?auto_1467318 ) ) ( not ( = ?auto_1467313 ?auto_1467319 ) ) ( not ( = ?auto_1467313 ?auto_1467320 ) ) ( not ( = ?auto_1467313 ?auto_1467321 ) ) ( not ( = ?auto_1467313 ?auto_1467322 ) ) ( not ( = ?auto_1467313 ?auto_1467323 ) ) ( not ( = ?auto_1467313 ?auto_1467324 ) ) ( not ( = ?auto_1467314 ?auto_1467315 ) ) ( not ( = ?auto_1467314 ?auto_1467316 ) ) ( not ( = ?auto_1467314 ?auto_1467317 ) ) ( not ( = ?auto_1467314 ?auto_1467318 ) ) ( not ( = ?auto_1467314 ?auto_1467319 ) ) ( not ( = ?auto_1467314 ?auto_1467320 ) ) ( not ( = ?auto_1467314 ?auto_1467321 ) ) ( not ( = ?auto_1467314 ?auto_1467322 ) ) ( not ( = ?auto_1467314 ?auto_1467323 ) ) ( not ( = ?auto_1467314 ?auto_1467324 ) ) ( not ( = ?auto_1467315 ?auto_1467316 ) ) ( not ( = ?auto_1467315 ?auto_1467317 ) ) ( not ( = ?auto_1467315 ?auto_1467318 ) ) ( not ( = ?auto_1467315 ?auto_1467319 ) ) ( not ( = ?auto_1467315 ?auto_1467320 ) ) ( not ( = ?auto_1467315 ?auto_1467321 ) ) ( not ( = ?auto_1467315 ?auto_1467322 ) ) ( not ( = ?auto_1467315 ?auto_1467323 ) ) ( not ( = ?auto_1467315 ?auto_1467324 ) ) ( not ( = ?auto_1467316 ?auto_1467317 ) ) ( not ( = ?auto_1467316 ?auto_1467318 ) ) ( not ( = ?auto_1467316 ?auto_1467319 ) ) ( not ( = ?auto_1467316 ?auto_1467320 ) ) ( not ( = ?auto_1467316 ?auto_1467321 ) ) ( not ( = ?auto_1467316 ?auto_1467322 ) ) ( not ( = ?auto_1467316 ?auto_1467323 ) ) ( not ( = ?auto_1467316 ?auto_1467324 ) ) ( not ( = ?auto_1467317 ?auto_1467318 ) ) ( not ( = ?auto_1467317 ?auto_1467319 ) ) ( not ( = ?auto_1467317 ?auto_1467320 ) ) ( not ( = ?auto_1467317 ?auto_1467321 ) ) ( not ( = ?auto_1467317 ?auto_1467322 ) ) ( not ( = ?auto_1467317 ?auto_1467323 ) ) ( not ( = ?auto_1467317 ?auto_1467324 ) ) ( not ( = ?auto_1467318 ?auto_1467319 ) ) ( not ( = ?auto_1467318 ?auto_1467320 ) ) ( not ( = ?auto_1467318 ?auto_1467321 ) ) ( not ( = ?auto_1467318 ?auto_1467322 ) ) ( not ( = ?auto_1467318 ?auto_1467323 ) ) ( not ( = ?auto_1467318 ?auto_1467324 ) ) ( not ( = ?auto_1467319 ?auto_1467320 ) ) ( not ( = ?auto_1467319 ?auto_1467321 ) ) ( not ( = ?auto_1467319 ?auto_1467322 ) ) ( not ( = ?auto_1467319 ?auto_1467323 ) ) ( not ( = ?auto_1467319 ?auto_1467324 ) ) ( not ( = ?auto_1467320 ?auto_1467321 ) ) ( not ( = ?auto_1467320 ?auto_1467322 ) ) ( not ( = ?auto_1467320 ?auto_1467323 ) ) ( not ( = ?auto_1467320 ?auto_1467324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1467321 ?auto_1467322 ?auto_1467323 )
      ( MAKE-12CRATE-VERIFY ?auto_1467311 ?auto_1467312 ?auto_1467313 ?auto_1467314 ?auto_1467315 ?auto_1467316 ?auto_1467317 ?auto_1467318 ?auto_1467319 ?auto_1467320 ?auto_1467321 ?auto_1467322 ?auto_1467323 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1467474 - SURFACE
      ?auto_1467475 - SURFACE
      ?auto_1467476 - SURFACE
      ?auto_1467477 - SURFACE
      ?auto_1467478 - SURFACE
      ?auto_1467479 - SURFACE
      ?auto_1467480 - SURFACE
      ?auto_1467481 - SURFACE
      ?auto_1467482 - SURFACE
      ?auto_1467483 - SURFACE
      ?auto_1467484 - SURFACE
      ?auto_1467485 - SURFACE
      ?auto_1467486 - SURFACE
    )
    :vars
    (
      ?auto_1467488 - HOIST
      ?auto_1467491 - PLACE
      ?auto_1467490 - PLACE
      ?auto_1467489 - HOIST
      ?auto_1467492 - SURFACE
      ?auto_1467487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1467488 ?auto_1467491 ) ( IS-CRATE ?auto_1467486 ) ( not ( = ?auto_1467485 ?auto_1467486 ) ) ( not ( = ?auto_1467484 ?auto_1467485 ) ) ( not ( = ?auto_1467484 ?auto_1467486 ) ) ( not ( = ?auto_1467490 ?auto_1467491 ) ) ( HOIST-AT ?auto_1467489 ?auto_1467490 ) ( not ( = ?auto_1467488 ?auto_1467489 ) ) ( AVAILABLE ?auto_1467489 ) ( SURFACE-AT ?auto_1467486 ?auto_1467490 ) ( ON ?auto_1467486 ?auto_1467492 ) ( CLEAR ?auto_1467486 ) ( not ( = ?auto_1467485 ?auto_1467492 ) ) ( not ( = ?auto_1467486 ?auto_1467492 ) ) ( not ( = ?auto_1467484 ?auto_1467492 ) ) ( TRUCK-AT ?auto_1467487 ?auto_1467491 ) ( SURFACE-AT ?auto_1467484 ?auto_1467491 ) ( CLEAR ?auto_1467484 ) ( IS-CRATE ?auto_1467485 ) ( AVAILABLE ?auto_1467488 ) ( IN ?auto_1467485 ?auto_1467487 ) ( ON ?auto_1467475 ?auto_1467474 ) ( ON ?auto_1467476 ?auto_1467475 ) ( ON ?auto_1467477 ?auto_1467476 ) ( ON ?auto_1467478 ?auto_1467477 ) ( ON ?auto_1467479 ?auto_1467478 ) ( ON ?auto_1467480 ?auto_1467479 ) ( ON ?auto_1467481 ?auto_1467480 ) ( ON ?auto_1467482 ?auto_1467481 ) ( ON ?auto_1467483 ?auto_1467482 ) ( ON ?auto_1467484 ?auto_1467483 ) ( not ( = ?auto_1467474 ?auto_1467475 ) ) ( not ( = ?auto_1467474 ?auto_1467476 ) ) ( not ( = ?auto_1467474 ?auto_1467477 ) ) ( not ( = ?auto_1467474 ?auto_1467478 ) ) ( not ( = ?auto_1467474 ?auto_1467479 ) ) ( not ( = ?auto_1467474 ?auto_1467480 ) ) ( not ( = ?auto_1467474 ?auto_1467481 ) ) ( not ( = ?auto_1467474 ?auto_1467482 ) ) ( not ( = ?auto_1467474 ?auto_1467483 ) ) ( not ( = ?auto_1467474 ?auto_1467484 ) ) ( not ( = ?auto_1467474 ?auto_1467485 ) ) ( not ( = ?auto_1467474 ?auto_1467486 ) ) ( not ( = ?auto_1467474 ?auto_1467492 ) ) ( not ( = ?auto_1467475 ?auto_1467476 ) ) ( not ( = ?auto_1467475 ?auto_1467477 ) ) ( not ( = ?auto_1467475 ?auto_1467478 ) ) ( not ( = ?auto_1467475 ?auto_1467479 ) ) ( not ( = ?auto_1467475 ?auto_1467480 ) ) ( not ( = ?auto_1467475 ?auto_1467481 ) ) ( not ( = ?auto_1467475 ?auto_1467482 ) ) ( not ( = ?auto_1467475 ?auto_1467483 ) ) ( not ( = ?auto_1467475 ?auto_1467484 ) ) ( not ( = ?auto_1467475 ?auto_1467485 ) ) ( not ( = ?auto_1467475 ?auto_1467486 ) ) ( not ( = ?auto_1467475 ?auto_1467492 ) ) ( not ( = ?auto_1467476 ?auto_1467477 ) ) ( not ( = ?auto_1467476 ?auto_1467478 ) ) ( not ( = ?auto_1467476 ?auto_1467479 ) ) ( not ( = ?auto_1467476 ?auto_1467480 ) ) ( not ( = ?auto_1467476 ?auto_1467481 ) ) ( not ( = ?auto_1467476 ?auto_1467482 ) ) ( not ( = ?auto_1467476 ?auto_1467483 ) ) ( not ( = ?auto_1467476 ?auto_1467484 ) ) ( not ( = ?auto_1467476 ?auto_1467485 ) ) ( not ( = ?auto_1467476 ?auto_1467486 ) ) ( not ( = ?auto_1467476 ?auto_1467492 ) ) ( not ( = ?auto_1467477 ?auto_1467478 ) ) ( not ( = ?auto_1467477 ?auto_1467479 ) ) ( not ( = ?auto_1467477 ?auto_1467480 ) ) ( not ( = ?auto_1467477 ?auto_1467481 ) ) ( not ( = ?auto_1467477 ?auto_1467482 ) ) ( not ( = ?auto_1467477 ?auto_1467483 ) ) ( not ( = ?auto_1467477 ?auto_1467484 ) ) ( not ( = ?auto_1467477 ?auto_1467485 ) ) ( not ( = ?auto_1467477 ?auto_1467486 ) ) ( not ( = ?auto_1467477 ?auto_1467492 ) ) ( not ( = ?auto_1467478 ?auto_1467479 ) ) ( not ( = ?auto_1467478 ?auto_1467480 ) ) ( not ( = ?auto_1467478 ?auto_1467481 ) ) ( not ( = ?auto_1467478 ?auto_1467482 ) ) ( not ( = ?auto_1467478 ?auto_1467483 ) ) ( not ( = ?auto_1467478 ?auto_1467484 ) ) ( not ( = ?auto_1467478 ?auto_1467485 ) ) ( not ( = ?auto_1467478 ?auto_1467486 ) ) ( not ( = ?auto_1467478 ?auto_1467492 ) ) ( not ( = ?auto_1467479 ?auto_1467480 ) ) ( not ( = ?auto_1467479 ?auto_1467481 ) ) ( not ( = ?auto_1467479 ?auto_1467482 ) ) ( not ( = ?auto_1467479 ?auto_1467483 ) ) ( not ( = ?auto_1467479 ?auto_1467484 ) ) ( not ( = ?auto_1467479 ?auto_1467485 ) ) ( not ( = ?auto_1467479 ?auto_1467486 ) ) ( not ( = ?auto_1467479 ?auto_1467492 ) ) ( not ( = ?auto_1467480 ?auto_1467481 ) ) ( not ( = ?auto_1467480 ?auto_1467482 ) ) ( not ( = ?auto_1467480 ?auto_1467483 ) ) ( not ( = ?auto_1467480 ?auto_1467484 ) ) ( not ( = ?auto_1467480 ?auto_1467485 ) ) ( not ( = ?auto_1467480 ?auto_1467486 ) ) ( not ( = ?auto_1467480 ?auto_1467492 ) ) ( not ( = ?auto_1467481 ?auto_1467482 ) ) ( not ( = ?auto_1467481 ?auto_1467483 ) ) ( not ( = ?auto_1467481 ?auto_1467484 ) ) ( not ( = ?auto_1467481 ?auto_1467485 ) ) ( not ( = ?auto_1467481 ?auto_1467486 ) ) ( not ( = ?auto_1467481 ?auto_1467492 ) ) ( not ( = ?auto_1467482 ?auto_1467483 ) ) ( not ( = ?auto_1467482 ?auto_1467484 ) ) ( not ( = ?auto_1467482 ?auto_1467485 ) ) ( not ( = ?auto_1467482 ?auto_1467486 ) ) ( not ( = ?auto_1467482 ?auto_1467492 ) ) ( not ( = ?auto_1467483 ?auto_1467484 ) ) ( not ( = ?auto_1467483 ?auto_1467485 ) ) ( not ( = ?auto_1467483 ?auto_1467486 ) ) ( not ( = ?auto_1467483 ?auto_1467492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1467484 ?auto_1467485 ?auto_1467486 )
      ( MAKE-12CRATE-VERIFY ?auto_1467474 ?auto_1467475 ?auto_1467476 ?auto_1467477 ?auto_1467478 ?auto_1467479 ?auto_1467480 ?auto_1467481 ?auto_1467482 ?auto_1467483 ?auto_1467484 ?auto_1467485 ?auto_1467486 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479078 - SURFACE
      ?auto_1479079 - SURFACE
      ?auto_1479080 - SURFACE
      ?auto_1479081 - SURFACE
      ?auto_1479082 - SURFACE
      ?auto_1479083 - SURFACE
      ?auto_1479084 - SURFACE
      ?auto_1479085 - SURFACE
      ?auto_1479086 - SURFACE
      ?auto_1479087 - SURFACE
      ?auto_1479088 - SURFACE
      ?auto_1479089 - SURFACE
      ?auto_1479090 - SURFACE
      ?auto_1479091 - SURFACE
    )
    :vars
    (
      ?auto_1479093 - HOIST
      ?auto_1479092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479093 ?auto_1479092 ) ( SURFACE-AT ?auto_1479090 ?auto_1479092 ) ( CLEAR ?auto_1479090 ) ( LIFTING ?auto_1479093 ?auto_1479091 ) ( IS-CRATE ?auto_1479091 ) ( not ( = ?auto_1479090 ?auto_1479091 ) ) ( ON ?auto_1479079 ?auto_1479078 ) ( ON ?auto_1479080 ?auto_1479079 ) ( ON ?auto_1479081 ?auto_1479080 ) ( ON ?auto_1479082 ?auto_1479081 ) ( ON ?auto_1479083 ?auto_1479082 ) ( ON ?auto_1479084 ?auto_1479083 ) ( ON ?auto_1479085 ?auto_1479084 ) ( ON ?auto_1479086 ?auto_1479085 ) ( ON ?auto_1479087 ?auto_1479086 ) ( ON ?auto_1479088 ?auto_1479087 ) ( ON ?auto_1479089 ?auto_1479088 ) ( ON ?auto_1479090 ?auto_1479089 ) ( not ( = ?auto_1479078 ?auto_1479079 ) ) ( not ( = ?auto_1479078 ?auto_1479080 ) ) ( not ( = ?auto_1479078 ?auto_1479081 ) ) ( not ( = ?auto_1479078 ?auto_1479082 ) ) ( not ( = ?auto_1479078 ?auto_1479083 ) ) ( not ( = ?auto_1479078 ?auto_1479084 ) ) ( not ( = ?auto_1479078 ?auto_1479085 ) ) ( not ( = ?auto_1479078 ?auto_1479086 ) ) ( not ( = ?auto_1479078 ?auto_1479087 ) ) ( not ( = ?auto_1479078 ?auto_1479088 ) ) ( not ( = ?auto_1479078 ?auto_1479089 ) ) ( not ( = ?auto_1479078 ?auto_1479090 ) ) ( not ( = ?auto_1479078 ?auto_1479091 ) ) ( not ( = ?auto_1479079 ?auto_1479080 ) ) ( not ( = ?auto_1479079 ?auto_1479081 ) ) ( not ( = ?auto_1479079 ?auto_1479082 ) ) ( not ( = ?auto_1479079 ?auto_1479083 ) ) ( not ( = ?auto_1479079 ?auto_1479084 ) ) ( not ( = ?auto_1479079 ?auto_1479085 ) ) ( not ( = ?auto_1479079 ?auto_1479086 ) ) ( not ( = ?auto_1479079 ?auto_1479087 ) ) ( not ( = ?auto_1479079 ?auto_1479088 ) ) ( not ( = ?auto_1479079 ?auto_1479089 ) ) ( not ( = ?auto_1479079 ?auto_1479090 ) ) ( not ( = ?auto_1479079 ?auto_1479091 ) ) ( not ( = ?auto_1479080 ?auto_1479081 ) ) ( not ( = ?auto_1479080 ?auto_1479082 ) ) ( not ( = ?auto_1479080 ?auto_1479083 ) ) ( not ( = ?auto_1479080 ?auto_1479084 ) ) ( not ( = ?auto_1479080 ?auto_1479085 ) ) ( not ( = ?auto_1479080 ?auto_1479086 ) ) ( not ( = ?auto_1479080 ?auto_1479087 ) ) ( not ( = ?auto_1479080 ?auto_1479088 ) ) ( not ( = ?auto_1479080 ?auto_1479089 ) ) ( not ( = ?auto_1479080 ?auto_1479090 ) ) ( not ( = ?auto_1479080 ?auto_1479091 ) ) ( not ( = ?auto_1479081 ?auto_1479082 ) ) ( not ( = ?auto_1479081 ?auto_1479083 ) ) ( not ( = ?auto_1479081 ?auto_1479084 ) ) ( not ( = ?auto_1479081 ?auto_1479085 ) ) ( not ( = ?auto_1479081 ?auto_1479086 ) ) ( not ( = ?auto_1479081 ?auto_1479087 ) ) ( not ( = ?auto_1479081 ?auto_1479088 ) ) ( not ( = ?auto_1479081 ?auto_1479089 ) ) ( not ( = ?auto_1479081 ?auto_1479090 ) ) ( not ( = ?auto_1479081 ?auto_1479091 ) ) ( not ( = ?auto_1479082 ?auto_1479083 ) ) ( not ( = ?auto_1479082 ?auto_1479084 ) ) ( not ( = ?auto_1479082 ?auto_1479085 ) ) ( not ( = ?auto_1479082 ?auto_1479086 ) ) ( not ( = ?auto_1479082 ?auto_1479087 ) ) ( not ( = ?auto_1479082 ?auto_1479088 ) ) ( not ( = ?auto_1479082 ?auto_1479089 ) ) ( not ( = ?auto_1479082 ?auto_1479090 ) ) ( not ( = ?auto_1479082 ?auto_1479091 ) ) ( not ( = ?auto_1479083 ?auto_1479084 ) ) ( not ( = ?auto_1479083 ?auto_1479085 ) ) ( not ( = ?auto_1479083 ?auto_1479086 ) ) ( not ( = ?auto_1479083 ?auto_1479087 ) ) ( not ( = ?auto_1479083 ?auto_1479088 ) ) ( not ( = ?auto_1479083 ?auto_1479089 ) ) ( not ( = ?auto_1479083 ?auto_1479090 ) ) ( not ( = ?auto_1479083 ?auto_1479091 ) ) ( not ( = ?auto_1479084 ?auto_1479085 ) ) ( not ( = ?auto_1479084 ?auto_1479086 ) ) ( not ( = ?auto_1479084 ?auto_1479087 ) ) ( not ( = ?auto_1479084 ?auto_1479088 ) ) ( not ( = ?auto_1479084 ?auto_1479089 ) ) ( not ( = ?auto_1479084 ?auto_1479090 ) ) ( not ( = ?auto_1479084 ?auto_1479091 ) ) ( not ( = ?auto_1479085 ?auto_1479086 ) ) ( not ( = ?auto_1479085 ?auto_1479087 ) ) ( not ( = ?auto_1479085 ?auto_1479088 ) ) ( not ( = ?auto_1479085 ?auto_1479089 ) ) ( not ( = ?auto_1479085 ?auto_1479090 ) ) ( not ( = ?auto_1479085 ?auto_1479091 ) ) ( not ( = ?auto_1479086 ?auto_1479087 ) ) ( not ( = ?auto_1479086 ?auto_1479088 ) ) ( not ( = ?auto_1479086 ?auto_1479089 ) ) ( not ( = ?auto_1479086 ?auto_1479090 ) ) ( not ( = ?auto_1479086 ?auto_1479091 ) ) ( not ( = ?auto_1479087 ?auto_1479088 ) ) ( not ( = ?auto_1479087 ?auto_1479089 ) ) ( not ( = ?auto_1479087 ?auto_1479090 ) ) ( not ( = ?auto_1479087 ?auto_1479091 ) ) ( not ( = ?auto_1479088 ?auto_1479089 ) ) ( not ( = ?auto_1479088 ?auto_1479090 ) ) ( not ( = ?auto_1479088 ?auto_1479091 ) ) ( not ( = ?auto_1479089 ?auto_1479090 ) ) ( not ( = ?auto_1479089 ?auto_1479091 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1479090 ?auto_1479091 )
      ( MAKE-13CRATE-VERIFY ?auto_1479078 ?auto_1479079 ?auto_1479080 ?auto_1479081 ?auto_1479082 ?auto_1479083 ?auto_1479084 ?auto_1479085 ?auto_1479086 ?auto_1479087 ?auto_1479088 ?auto_1479089 ?auto_1479090 ?auto_1479091 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479220 - SURFACE
      ?auto_1479221 - SURFACE
      ?auto_1479222 - SURFACE
      ?auto_1479223 - SURFACE
      ?auto_1479224 - SURFACE
      ?auto_1479225 - SURFACE
      ?auto_1479226 - SURFACE
      ?auto_1479227 - SURFACE
      ?auto_1479228 - SURFACE
      ?auto_1479229 - SURFACE
      ?auto_1479230 - SURFACE
      ?auto_1479231 - SURFACE
      ?auto_1479232 - SURFACE
      ?auto_1479233 - SURFACE
    )
    :vars
    (
      ?auto_1479236 - HOIST
      ?auto_1479234 - PLACE
      ?auto_1479235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479236 ?auto_1479234 ) ( SURFACE-AT ?auto_1479232 ?auto_1479234 ) ( CLEAR ?auto_1479232 ) ( IS-CRATE ?auto_1479233 ) ( not ( = ?auto_1479232 ?auto_1479233 ) ) ( TRUCK-AT ?auto_1479235 ?auto_1479234 ) ( AVAILABLE ?auto_1479236 ) ( IN ?auto_1479233 ?auto_1479235 ) ( ON ?auto_1479232 ?auto_1479231 ) ( not ( = ?auto_1479231 ?auto_1479232 ) ) ( not ( = ?auto_1479231 ?auto_1479233 ) ) ( ON ?auto_1479221 ?auto_1479220 ) ( ON ?auto_1479222 ?auto_1479221 ) ( ON ?auto_1479223 ?auto_1479222 ) ( ON ?auto_1479224 ?auto_1479223 ) ( ON ?auto_1479225 ?auto_1479224 ) ( ON ?auto_1479226 ?auto_1479225 ) ( ON ?auto_1479227 ?auto_1479226 ) ( ON ?auto_1479228 ?auto_1479227 ) ( ON ?auto_1479229 ?auto_1479228 ) ( ON ?auto_1479230 ?auto_1479229 ) ( ON ?auto_1479231 ?auto_1479230 ) ( not ( = ?auto_1479220 ?auto_1479221 ) ) ( not ( = ?auto_1479220 ?auto_1479222 ) ) ( not ( = ?auto_1479220 ?auto_1479223 ) ) ( not ( = ?auto_1479220 ?auto_1479224 ) ) ( not ( = ?auto_1479220 ?auto_1479225 ) ) ( not ( = ?auto_1479220 ?auto_1479226 ) ) ( not ( = ?auto_1479220 ?auto_1479227 ) ) ( not ( = ?auto_1479220 ?auto_1479228 ) ) ( not ( = ?auto_1479220 ?auto_1479229 ) ) ( not ( = ?auto_1479220 ?auto_1479230 ) ) ( not ( = ?auto_1479220 ?auto_1479231 ) ) ( not ( = ?auto_1479220 ?auto_1479232 ) ) ( not ( = ?auto_1479220 ?auto_1479233 ) ) ( not ( = ?auto_1479221 ?auto_1479222 ) ) ( not ( = ?auto_1479221 ?auto_1479223 ) ) ( not ( = ?auto_1479221 ?auto_1479224 ) ) ( not ( = ?auto_1479221 ?auto_1479225 ) ) ( not ( = ?auto_1479221 ?auto_1479226 ) ) ( not ( = ?auto_1479221 ?auto_1479227 ) ) ( not ( = ?auto_1479221 ?auto_1479228 ) ) ( not ( = ?auto_1479221 ?auto_1479229 ) ) ( not ( = ?auto_1479221 ?auto_1479230 ) ) ( not ( = ?auto_1479221 ?auto_1479231 ) ) ( not ( = ?auto_1479221 ?auto_1479232 ) ) ( not ( = ?auto_1479221 ?auto_1479233 ) ) ( not ( = ?auto_1479222 ?auto_1479223 ) ) ( not ( = ?auto_1479222 ?auto_1479224 ) ) ( not ( = ?auto_1479222 ?auto_1479225 ) ) ( not ( = ?auto_1479222 ?auto_1479226 ) ) ( not ( = ?auto_1479222 ?auto_1479227 ) ) ( not ( = ?auto_1479222 ?auto_1479228 ) ) ( not ( = ?auto_1479222 ?auto_1479229 ) ) ( not ( = ?auto_1479222 ?auto_1479230 ) ) ( not ( = ?auto_1479222 ?auto_1479231 ) ) ( not ( = ?auto_1479222 ?auto_1479232 ) ) ( not ( = ?auto_1479222 ?auto_1479233 ) ) ( not ( = ?auto_1479223 ?auto_1479224 ) ) ( not ( = ?auto_1479223 ?auto_1479225 ) ) ( not ( = ?auto_1479223 ?auto_1479226 ) ) ( not ( = ?auto_1479223 ?auto_1479227 ) ) ( not ( = ?auto_1479223 ?auto_1479228 ) ) ( not ( = ?auto_1479223 ?auto_1479229 ) ) ( not ( = ?auto_1479223 ?auto_1479230 ) ) ( not ( = ?auto_1479223 ?auto_1479231 ) ) ( not ( = ?auto_1479223 ?auto_1479232 ) ) ( not ( = ?auto_1479223 ?auto_1479233 ) ) ( not ( = ?auto_1479224 ?auto_1479225 ) ) ( not ( = ?auto_1479224 ?auto_1479226 ) ) ( not ( = ?auto_1479224 ?auto_1479227 ) ) ( not ( = ?auto_1479224 ?auto_1479228 ) ) ( not ( = ?auto_1479224 ?auto_1479229 ) ) ( not ( = ?auto_1479224 ?auto_1479230 ) ) ( not ( = ?auto_1479224 ?auto_1479231 ) ) ( not ( = ?auto_1479224 ?auto_1479232 ) ) ( not ( = ?auto_1479224 ?auto_1479233 ) ) ( not ( = ?auto_1479225 ?auto_1479226 ) ) ( not ( = ?auto_1479225 ?auto_1479227 ) ) ( not ( = ?auto_1479225 ?auto_1479228 ) ) ( not ( = ?auto_1479225 ?auto_1479229 ) ) ( not ( = ?auto_1479225 ?auto_1479230 ) ) ( not ( = ?auto_1479225 ?auto_1479231 ) ) ( not ( = ?auto_1479225 ?auto_1479232 ) ) ( not ( = ?auto_1479225 ?auto_1479233 ) ) ( not ( = ?auto_1479226 ?auto_1479227 ) ) ( not ( = ?auto_1479226 ?auto_1479228 ) ) ( not ( = ?auto_1479226 ?auto_1479229 ) ) ( not ( = ?auto_1479226 ?auto_1479230 ) ) ( not ( = ?auto_1479226 ?auto_1479231 ) ) ( not ( = ?auto_1479226 ?auto_1479232 ) ) ( not ( = ?auto_1479226 ?auto_1479233 ) ) ( not ( = ?auto_1479227 ?auto_1479228 ) ) ( not ( = ?auto_1479227 ?auto_1479229 ) ) ( not ( = ?auto_1479227 ?auto_1479230 ) ) ( not ( = ?auto_1479227 ?auto_1479231 ) ) ( not ( = ?auto_1479227 ?auto_1479232 ) ) ( not ( = ?auto_1479227 ?auto_1479233 ) ) ( not ( = ?auto_1479228 ?auto_1479229 ) ) ( not ( = ?auto_1479228 ?auto_1479230 ) ) ( not ( = ?auto_1479228 ?auto_1479231 ) ) ( not ( = ?auto_1479228 ?auto_1479232 ) ) ( not ( = ?auto_1479228 ?auto_1479233 ) ) ( not ( = ?auto_1479229 ?auto_1479230 ) ) ( not ( = ?auto_1479229 ?auto_1479231 ) ) ( not ( = ?auto_1479229 ?auto_1479232 ) ) ( not ( = ?auto_1479229 ?auto_1479233 ) ) ( not ( = ?auto_1479230 ?auto_1479231 ) ) ( not ( = ?auto_1479230 ?auto_1479232 ) ) ( not ( = ?auto_1479230 ?auto_1479233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479231 ?auto_1479232 ?auto_1479233 )
      ( MAKE-13CRATE-VERIFY ?auto_1479220 ?auto_1479221 ?auto_1479222 ?auto_1479223 ?auto_1479224 ?auto_1479225 ?auto_1479226 ?auto_1479227 ?auto_1479228 ?auto_1479229 ?auto_1479230 ?auto_1479231 ?auto_1479232 ?auto_1479233 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479376 - SURFACE
      ?auto_1479377 - SURFACE
      ?auto_1479378 - SURFACE
      ?auto_1479379 - SURFACE
      ?auto_1479380 - SURFACE
      ?auto_1479381 - SURFACE
      ?auto_1479382 - SURFACE
      ?auto_1479383 - SURFACE
      ?auto_1479384 - SURFACE
      ?auto_1479385 - SURFACE
      ?auto_1479386 - SURFACE
      ?auto_1479387 - SURFACE
      ?auto_1479388 - SURFACE
      ?auto_1479389 - SURFACE
    )
    :vars
    (
      ?auto_1479392 - HOIST
      ?auto_1479390 - PLACE
      ?auto_1479391 - TRUCK
      ?auto_1479393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479392 ?auto_1479390 ) ( SURFACE-AT ?auto_1479388 ?auto_1479390 ) ( CLEAR ?auto_1479388 ) ( IS-CRATE ?auto_1479389 ) ( not ( = ?auto_1479388 ?auto_1479389 ) ) ( AVAILABLE ?auto_1479392 ) ( IN ?auto_1479389 ?auto_1479391 ) ( ON ?auto_1479388 ?auto_1479387 ) ( not ( = ?auto_1479387 ?auto_1479388 ) ) ( not ( = ?auto_1479387 ?auto_1479389 ) ) ( TRUCK-AT ?auto_1479391 ?auto_1479393 ) ( not ( = ?auto_1479393 ?auto_1479390 ) ) ( ON ?auto_1479377 ?auto_1479376 ) ( ON ?auto_1479378 ?auto_1479377 ) ( ON ?auto_1479379 ?auto_1479378 ) ( ON ?auto_1479380 ?auto_1479379 ) ( ON ?auto_1479381 ?auto_1479380 ) ( ON ?auto_1479382 ?auto_1479381 ) ( ON ?auto_1479383 ?auto_1479382 ) ( ON ?auto_1479384 ?auto_1479383 ) ( ON ?auto_1479385 ?auto_1479384 ) ( ON ?auto_1479386 ?auto_1479385 ) ( ON ?auto_1479387 ?auto_1479386 ) ( not ( = ?auto_1479376 ?auto_1479377 ) ) ( not ( = ?auto_1479376 ?auto_1479378 ) ) ( not ( = ?auto_1479376 ?auto_1479379 ) ) ( not ( = ?auto_1479376 ?auto_1479380 ) ) ( not ( = ?auto_1479376 ?auto_1479381 ) ) ( not ( = ?auto_1479376 ?auto_1479382 ) ) ( not ( = ?auto_1479376 ?auto_1479383 ) ) ( not ( = ?auto_1479376 ?auto_1479384 ) ) ( not ( = ?auto_1479376 ?auto_1479385 ) ) ( not ( = ?auto_1479376 ?auto_1479386 ) ) ( not ( = ?auto_1479376 ?auto_1479387 ) ) ( not ( = ?auto_1479376 ?auto_1479388 ) ) ( not ( = ?auto_1479376 ?auto_1479389 ) ) ( not ( = ?auto_1479377 ?auto_1479378 ) ) ( not ( = ?auto_1479377 ?auto_1479379 ) ) ( not ( = ?auto_1479377 ?auto_1479380 ) ) ( not ( = ?auto_1479377 ?auto_1479381 ) ) ( not ( = ?auto_1479377 ?auto_1479382 ) ) ( not ( = ?auto_1479377 ?auto_1479383 ) ) ( not ( = ?auto_1479377 ?auto_1479384 ) ) ( not ( = ?auto_1479377 ?auto_1479385 ) ) ( not ( = ?auto_1479377 ?auto_1479386 ) ) ( not ( = ?auto_1479377 ?auto_1479387 ) ) ( not ( = ?auto_1479377 ?auto_1479388 ) ) ( not ( = ?auto_1479377 ?auto_1479389 ) ) ( not ( = ?auto_1479378 ?auto_1479379 ) ) ( not ( = ?auto_1479378 ?auto_1479380 ) ) ( not ( = ?auto_1479378 ?auto_1479381 ) ) ( not ( = ?auto_1479378 ?auto_1479382 ) ) ( not ( = ?auto_1479378 ?auto_1479383 ) ) ( not ( = ?auto_1479378 ?auto_1479384 ) ) ( not ( = ?auto_1479378 ?auto_1479385 ) ) ( not ( = ?auto_1479378 ?auto_1479386 ) ) ( not ( = ?auto_1479378 ?auto_1479387 ) ) ( not ( = ?auto_1479378 ?auto_1479388 ) ) ( not ( = ?auto_1479378 ?auto_1479389 ) ) ( not ( = ?auto_1479379 ?auto_1479380 ) ) ( not ( = ?auto_1479379 ?auto_1479381 ) ) ( not ( = ?auto_1479379 ?auto_1479382 ) ) ( not ( = ?auto_1479379 ?auto_1479383 ) ) ( not ( = ?auto_1479379 ?auto_1479384 ) ) ( not ( = ?auto_1479379 ?auto_1479385 ) ) ( not ( = ?auto_1479379 ?auto_1479386 ) ) ( not ( = ?auto_1479379 ?auto_1479387 ) ) ( not ( = ?auto_1479379 ?auto_1479388 ) ) ( not ( = ?auto_1479379 ?auto_1479389 ) ) ( not ( = ?auto_1479380 ?auto_1479381 ) ) ( not ( = ?auto_1479380 ?auto_1479382 ) ) ( not ( = ?auto_1479380 ?auto_1479383 ) ) ( not ( = ?auto_1479380 ?auto_1479384 ) ) ( not ( = ?auto_1479380 ?auto_1479385 ) ) ( not ( = ?auto_1479380 ?auto_1479386 ) ) ( not ( = ?auto_1479380 ?auto_1479387 ) ) ( not ( = ?auto_1479380 ?auto_1479388 ) ) ( not ( = ?auto_1479380 ?auto_1479389 ) ) ( not ( = ?auto_1479381 ?auto_1479382 ) ) ( not ( = ?auto_1479381 ?auto_1479383 ) ) ( not ( = ?auto_1479381 ?auto_1479384 ) ) ( not ( = ?auto_1479381 ?auto_1479385 ) ) ( not ( = ?auto_1479381 ?auto_1479386 ) ) ( not ( = ?auto_1479381 ?auto_1479387 ) ) ( not ( = ?auto_1479381 ?auto_1479388 ) ) ( not ( = ?auto_1479381 ?auto_1479389 ) ) ( not ( = ?auto_1479382 ?auto_1479383 ) ) ( not ( = ?auto_1479382 ?auto_1479384 ) ) ( not ( = ?auto_1479382 ?auto_1479385 ) ) ( not ( = ?auto_1479382 ?auto_1479386 ) ) ( not ( = ?auto_1479382 ?auto_1479387 ) ) ( not ( = ?auto_1479382 ?auto_1479388 ) ) ( not ( = ?auto_1479382 ?auto_1479389 ) ) ( not ( = ?auto_1479383 ?auto_1479384 ) ) ( not ( = ?auto_1479383 ?auto_1479385 ) ) ( not ( = ?auto_1479383 ?auto_1479386 ) ) ( not ( = ?auto_1479383 ?auto_1479387 ) ) ( not ( = ?auto_1479383 ?auto_1479388 ) ) ( not ( = ?auto_1479383 ?auto_1479389 ) ) ( not ( = ?auto_1479384 ?auto_1479385 ) ) ( not ( = ?auto_1479384 ?auto_1479386 ) ) ( not ( = ?auto_1479384 ?auto_1479387 ) ) ( not ( = ?auto_1479384 ?auto_1479388 ) ) ( not ( = ?auto_1479384 ?auto_1479389 ) ) ( not ( = ?auto_1479385 ?auto_1479386 ) ) ( not ( = ?auto_1479385 ?auto_1479387 ) ) ( not ( = ?auto_1479385 ?auto_1479388 ) ) ( not ( = ?auto_1479385 ?auto_1479389 ) ) ( not ( = ?auto_1479386 ?auto_1479387 ) ) ( not ( = ?auto_1479386 ?auto_1479388 ) ) ( not ( = ?auto_1479386 ?auto_1479389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479387 ?auto_1479388 ?auto_1479389 )
      ( MAKE-13CRATE-VERIFY ?auto_1479376 ?auto_1479377 ?auto_1479378 ?auto_1479379 ?auto_1479380 ?auto_1479381 ?auto_1479382 ?auto_1479383 ?auto_1479384 ?auto_1479385 ?auto_1479386 ?auto_1479387 ?auto_1479388 ?auto_1479389 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479545 - SURFACE
      ?auto_1479546 - SURFACE
      ?auto_1479547 - SURFACE
      ?auto_1479548 - SURFACE
      ?auto_1479549 - SURFACE
      ?auto_1479550 - SURFACE
      ?auto_1479551 - SURFACE
      ?auto_1479552 - SURFACE
      ?auto_1479553 - SURFACE
      ?auto_1479554 - SURFACE
      ?auto_1479555 - SURFACE
      ?auto_1479556 - SURFACE
      ?auto_1479557 - SURFACE
      ?auto_1479558 - SURFACE
    )
    :vars
    (
      ?auto_1479560 - HOIST
      ?auto_1479563 - PLACE
      ?auto_1479559 - TRUCK
      ?auto_1479562 - PLACE
      ?auto_1479561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479560 ?auto_1479563 ) ( SURFACE-AT ?auto_1479557 ?auto_1479563 ) ( CLEAR ?auto_1479557 ) ( IS-CRATE ?auto_1479558 ) ( not ( = ?auto_1479557 ?auto_1479558 ) ) ( AVAILABLE ?auto_1479560 ) ( ON ?auto_1479557 ?auto_1479556 ) ( not ( = ?auto_1479556 ?auto_1479557 ) ) ( not ( = ?auto_1479556 ?auto_1479558 ) ) ( TRUCK-AT ?auto_1479559 ?auto_1479562 ) ( not ( = ?auto_1479562 ?auto_1479563 ) ) ( HOIST-AT ?auto_1479561 ?auto_1479562 ) ( LIFTING ?auto_1479561 ?auto_1479558 ) ( not ( = ?auto_1479560 ?auto_1479561 ) ) ( ON ?auto_1479546 ?auto_1479545 ) ( ON ?auto_1479547 ?auto_1479546 ) ( ON ?auto_1479548 ?auto_1479547 ) ( ON ?auto_1479549 ?auto_1479548 ) ( ON ?auto_1479550 ?auto_1479549 ) ( ON ?auto_1479551 ?auto_1479550 ) ( ON ?auto_1479552 ?auto_1479551 ) ( ON ?auto_1479553 ?auto_1479552 ) ( ON ?auto_1479554 ?auto_1479553 ) ( ON ?auto_1479555 ?auto_1479554 ) ( ON ?auto_1479556 ?auto_1479555 ) ( not ( = ?auto_1479545 ?auto_1479546 ) ) ( not ( = ?auto_1479545 ?auto_1479547 ) ) ( not ( = ?auto_1479545 ?auto_1479548 ) ) ( not ( = ?auto_1479545 ?auto_1479549 ) ) ( not ( = ?auto_1479545 ?auto_1479550 ) ) ( not ( = ?auto_1479545 ?auto_1479551 ) ) ( not ( = ?auto_1479545 ?auto_1479552 ) ) ( not ( = ?auto_1479545 ?auto_1479553 ) ) ( not ( = ?auto_1479545 ?auto_1479554 ) ) ( not ( = ?auto_1479545 ?auto_1479555 ) ) ( not ( = ?auto_1479545 ?auto_1479556 ) ) ( not ( = ?auto_1479545 ?auto_1479557 ) ) ( not ( = ?auto_1479545 ?auto_1479558 ) ) ( not ( = ?auto_1479546 ?auto_1479547 ) ) ( not ( = ?auto_1479546 ?auto_1479548 ) ) ( not ( = ?auto_1479546 ?auto_1479549 ) ) ( not ( = ?auto_1479546 ?auto_1479550 ) ) ( not ( = ?auto_1479546 ?auto_1479551 ) ) ( not ( = ?auto_1479546 ?auto_1479552 ) ) ( not ( = ?auto_1479546 ?auto_1479553 ) ) ( not ( = ?auto_1479546 ?auto_1479554 ) ) ( not ( = ?auto_1479546 ?auto_1479555 ) ) ( not ( = ?auto_1479546 ?auto_1479556 ) ) ( not ( = ?auto_1479546 ?auto_1479557 ) ) ( not ( = ?auto_1479546 ?auto_1479558 ) ) ( not ( = ?auto_1479547 ?auto_1479548 ) ) ( not ( = ?auto_1479547 ?auto_1479549 ) ) ( not ( = ?auto_1479547 ?auto_1479550 ) ) ( not ( = ?auto_1479547 ?auto_1479551 ) ) ( not ( = ?auto_1479547 ?auto_1479552 ) ) ( not ( = ?auto_1479547 ?auto_1479553 ) ) ( not ( = ?auto_1479547 ?auto_1479554 ) ) ( not ( = ?auto_1479547 ?auto_1479555 ) ) ( not ( = ?auto_1479547 ?auto_1479556 ) ) ( not ( = ?auto_1479547 ?auto_1479557 ) ) ( not ( = ?auto_1479547 ?auto_1479558 ) ) ( not ( = ?auto_1479548 ?auto_1479549 ) ) ( not ( = ?auto_1479548 ?auto_1479550 ) ) ( not ( = ?auto_1479548 ?auto_1479551 ) ) ( not ( = ?auto_1479548 ?auto_1479552 ) ) ( not ( = ?auto_1479548 ?auto_1479553 ) ) ( not ( = ?auto_1479548 ?auto_1479554 ) ) ( not ( = ?auto_1479548 ?auto_1479555 ) ) ( not ( = ?auto_1479548 ?auto_1479556 ) ) ( not ( = ?auto_1479548 ?auto_1479557 ) ) ( not ( = ?auto_1479548 ?auto_1479558 ) ) ( not ( = ?auto_1479549 ?auto_1479550 ) ) ( not ( = ?auto_1479549 ?auto_1479551 ) ) ( not ( = ?auto_1479549 ?auto_1479552 ) ) ( not ( = ?auto_1479549 ?auto_1479553 ) ) ( not ( = ?auto_1479549 ?auto_1479554 ) ) ( not ( = ?auto_1479549 ?auto_1479555 ) ) ( not ( = ?auto_1479549 ?auto_1479556 ) ) ( not ( = ?auto_1479549 ?auto_1479557 ) ) ( not ( = ?auto_1479549 ?auto_1479558 ) ) ( not ( = ?auto_1479550 ?auto_1479551 ) ) ( not ( = ?auto_1479550 ?auto_1479552 ) ) ( not ( = ?auto_1479550 ?auto_1479553 ) ) ( not ( = ?auto_1479550 ?auto_1479554 ) ) ( not ( = ?auto_1479550 ?auto_1479555 ) ) ( not ( = ?auto_1479550 ?auto_1479556 ) ) ( not ( = ?auto_1479550 ?auto_1479557 ) ) ( not ( = ?auto_1479550 ?auto_1479558 ) ) ( not ( = ?auto_1479551 ?auto_1479552 ) ) ( not ( = ?auto_1479551 ?auto_1479553 ) ) ( not ( = ?auto_1479551 ?auto_1479554 ) ) ( not ( = ?auto_1479551 ?auto_1479555 ) ) ( not ( = ?auto_1479551 ?auto_1479556 ) ) ( not ( = ?auto_1479551 ?auto_1479557 ) ) ( not ( = ?auto_1479551 ?auto_1479558 ) ) ( not ( = ?auto_1479552 ?auto_1479553 ) ) ( not ( = ?auto_1479552 ?auto_1479554 ) ) ( not ( = ?auto_1479552 ?auto_1479555 ) ) ( not ( = ?auto_1479552 ?auto_1479556 ) ) ( not ( = ?auto_1479552 ?auto_1479557 ) ) ( not ( = ?auto_1479552 ?auto_1479558 ) ) ( not ( = ?auto_1479553 ?auto_1479554 ) ) ( not ( = ?auto_1479553 ?auto_1479555 ) ) ( not ( = ?auto_1479553 ?auto_1479556 ) ) ( not ( = ?auto_1479553 ?auto_1479557 ) ) ( not ( = ?auto_1479553 ?auto_1479558 ) ) ( not ( = ?auto_1479554 ?auto_1479555 ) ) ( not ( = ?auto_1479554 ?auto_1479556 ) ) ( not ( = ?auto_1479554 ?auto_1479557 ) ) ( not ( = ?auto_1479554 ?auto_1479558 ) ) ( not ( = ?auto_1479555 ?auto_1479556 ) ) ( not ( = ?auto_1479555 ?auto_1479557 ) ) ( not ( = ?auto_1479555 ?auto_1479558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479556 ?auto_1479557 ?auto_1479558 )
      ( MAKE-13CRATE-VERIFY ?auto_1479545 ?auto_1479546 ?auto_1479547 ?auto_1479548 ?auto_1479549 ?auto_1479550 ?auto_1479551 ?auto_1479552 ?auto_1479553 ?auto_1479554 ?auto_1479555 ?auto_1479556 ?auto_1479557 ?auto_1479558 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479727 - SURFACE
      ?auto_1479728 - SURFACE
      ?auto_1479729 - SURFACE
      ?auto_1479730 - SURFACE
      ?auto_1479731 - SURFACE
      ?auto_1479732 - SURFACE
      ?auto_1479733 - SURFACE
      ?auto_1479734 - SURFACE
      ?auto_1479735 - SURFACE
      ?auto_1479736 - SURFACE
      ?auto_1479737 - SURFACE
      ?auto_1479738 - SURFACE
      ?auto_1479739 - SURFACE
      ?auto_1479740 - SURFACE
    )
    :vars
    (
      ?auto_1479741 - HOIST
      ?auto_1479744 - PLACE
      ?auto_1479746 - TRUCK
      ?auto_1479743 - PLACE
      ?auto_1479742 - HOIST
      ?auto_1479745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479741 ?auto_1479744 ) ( SURFACE-AT ?auto_1479739 ?auto_1479744 ) ( CLEAR ?auto_1479739 ) ( IS-CRATE ?auto_1479740 ) ( not ( = ?auto_1479739 ?auto_1479740 ) ) ( AVAILABLE ?auto_1479741 ) ( ON ?auto_1479739 ?auto_1479738 ) ( not ( = ?auto_1479738 ?auto_1479739 ) ) ( not ( = ?auto_1479738 ?auto_1479740 ) ) ( TRUCK-AT ?auto_1479746 ?auto_1479743 ) ( not ( = ?auto_1479743 ?auto_1479744 ) ) ( HOIST-AT ?auto_1479742 ?auto_1479743 ) ( not ( = ?auto_1479741 ?auto_1479742 ) ) ( AVAILABLE ?auto_1479742 ) ( SURFACE-AT ?auto_1479740 ?auto_1479743 ) ( ON ?auto_1479740 ?auto_1479745 ) ( CLEAR ?auto_1479740 ) ( not ( = ?auto_1479739 ?auto_1479745 ) ) ( not ( = ?auto_1479740 ?auto_1479745 ) ) ( not ( = ?auto_1479738 ?auto_1479745 ) ) ( ON ?auto_1479728 ?auto_1479727 ) ( ON ?auto_1479729 ?auto_1479728 ) ( ON ?auto_1479730 ?auto_1479729 ) ( ON ?auto_1479731 ?auto_1479730 ) ( ON ?auto_1479732 ?auto_1479731 ) ( ON ?auto_1479733 ?auto_1479732 ) ( ON ?auto_1479734 ?auto_1479733 ) ( ON ?auto_1479735 ?auto_1479734 ) ( ON ?auto_1479736 ?auto_1479735 ) ( ON ?auto_1479737 ?auto_1479736 ) ( ON ?auto_1479738 ?auto_1479737 ) ( not ( = ?auto_1479727 ?auto_1479728 ) ) ( not ( = ?auto_1479727 ?auto_1479729 ) ) ( not ( = ?auto_1479727 ?auto_1479730 ) ) ( not ( = ?auto_1479727 ?auto_1479731 ) ) ( not ( = ?auto_1479727 ?auto_1479732 ) ) ( not ( = ?auto_1479727 ?auto_1479733 ) ) ( not ( = ?auto_1479727 ?auto_1479734 ) ) ( not ( = ?auto_1479727 ?auto_1479735 ) ) ( not ( = ?auto_1479727 ?auto_1479736 ) ) ( not ( = ?auto_1479727 ?auto_1479737 ) ) ( not ( = ?auto_1479727 ?auto_1479738 ) ) ( not ( = ?auto_1479727 ?auto_1479739 ) ) ( not ( = ?auto_1479727 ?auto_1479740 ) ) ( not ( = ?auto_1479727 ?auto_1479745 ) ) ( not ( = ?auto_1479728 ?auto_1479729 ) ) ( not ( = ?auto_1479728 ?auto_1479730 ) ) ( not ( = ?auto_1479728 ?auto_1479731 ) ) ( not ( = ?auto_1479728 ?auto_1479732 ) ) ( not ( = ?auto_1479728 ?auto_1479733 ) ) ( not ( = ?auto_1479728 ?auto_1479734 ) ) ( not ( = ?auto_1479728 ?auto_1479735 ) ) ( not ( = ?auto_1479728 ?auto_1479736 ) ) ( not ( = ?auto_1479728 ?auto_1479737 ) ) ( not ( = ?auto_1479728 ?auto_1479738 ) ) ( not ( = ?auto_1479728 ?auto_1479739 ) ) ( not ( = ?auto_1479728 ?auto_1479740 ) ) ( not ( = ?auto_1479728 ?auto_1479745 ) ) ( not ( = ?auto_1479729 ?auto_1479730 ) ) ( not ( = ?auto_1479729 ?auto_1479731 ) ) ( not ( = ?auto_1479729 ?auto_1479732 ) ) ( not ( = ?auto_1479729 ?auto_1479733 ) ) ( not ( = ?auto_1479729 ?auto_1479734 ) ) ( not ( = ?auto_1479729 ?auto_1479735 ) ) ( not ( = ?auto_1479729 ?auto_1479736 ) ) ( not ( = ?auto_1479729 ?auto_1479737 ) ) ( not ( = ?auto_1479729 ?auto_1479738 ) ) ( not ( = ?auto_1479729 ?auto_1479739 ) ) ( not ( = ?auto_1479729 ?auto_1479740 ) ) ( not ( = ?auto_1479729 ?auto_1479745 ) ) ( not ( = ?auto_1479730 ?auto_1479731 ) ) ( not ( = ?auto_1479730 ?auto_1479732 ) ) ( not ( = ?auto_1479730 ?auto_1479733 ) ) ( not ( = ?auto_1479730 ?auto_1479734 ) ) ( not ( = ?auto_1479730 ?auto_1479735 ) ) ( not ( = ?auto_1479730 ?auto_1479736 ) ) ( not ( = ?auto_1479730 ?auto_1479737 ) ) ( not ( = ?auto_1479730 ?auto_1479738 ) ) ( not ( = ?auto_1479730 ?auto_1479739 ) ) ( not ( = ?auto_1479730 ?auto_1479740 ) ) ( not ( = ?auto_1479730 ?auto_1479745 ) ) ( not ( = ?auto_1479731 ?auto_1479732 ) ) ( not ( = ?auto_1479731 ?auto_1479733 ) ) ( not ( = ?auto_1479731 ?auto_1479734 ) ) ( not ( = ?auto_1479731 ?auto_1479735 ) ) ( not ( = ?auto_1479731 ?auto_1479736 ) ) ( not ( = ?auto_1479731 ?auto_1479737 ) ) ( not ( = ?auto_1479731 ?auto_1479738 ) ) ( not ( = ?auto_1479731 ?auto_1479739 ) ) ( not ( = ?auto_1479731 ?auto_1479740 ) ) ( not ( = ?auto_1479731 ?auto_1479745 ) ) ( not ( = ?auto_1479732 ?auto_1479733 ) ) ( not ( = ?auto_1479732 ?auto_1479734 ) ) ( not ( = ?auto_1479732 ?auto_1479735 ) ) ( not ( = ?auto_1479732 ?auto_1479736 ) ) ( not ( = ?auto_1479732 ?auto_1479737 ) ) ( not ( = ?auto_1479732 ?auto_1479738 ) ) ( not ( = ?auto_1479732 ?auto_1479739 ) ) ( not ( = ?auto_1479732 ?auto_1479740 ) ) ( not ( = ?auto_1479732 ?auto_1479745 ) ) ( not ( = ?auto_1479733 ?auto_1479734 ) ) ( not ( = ?auto_1479733 ?auto_1479735 ) ) ( not ( = ?auto_1479733 ?auto_1479736 ) ) ( not ( = ?auto_1479733 ?auto_1479737 ) ) ( not ( = ?auto_1479733 ?auto_1479738 ) ) ( not ( = ?auto_1479733 ?auto_1479739 ) ) ( not ( = ?auto_1479733 ?auto_1479740 ) ) ( not ( = ?auto_1479733 ?auto_1479745 ) ) ( not ( = ?auto_1479734 ?auto_1479735 ) ) ( not ( = ?auto_1479734 ?auto_1479736 ) ) ( not ( = ?auto_1479734 ?auto_1479737 ) ) ( not ( = ?auto_1479734 ?auto_1479738 ) ) ( not ( = ?auto_1479734 ?auto_1479739 ) ) ( not ( = ?auto_1479734 ?auto_1479740 ) ) ( not ( = ?auto_1479734 ?auto_1479745 ) ) ( not ( = ?auto_1479735 ?auto_1479736 ) ) ( not ( = ?auto_1479735 ?auto_1479737 ) ) ( not ( = ?auto_1479735 ?auto_1479738 ) ) ( not ( = ?auto_1479735 ?auto_1479739 ) ) ( not ( = ?auto_1479735 ?auto_1479740 ) ) ( not ( = ?auto_1479735 ?auto_1479745 ) ) ( not ( = ?auto_1479736 ?auto_1479737 ) ) ( not ( = ?auto_1479736 ?auto_1479738 ) ) ( not ( = ?auto_1479736 ?auto_1479739 ) ) ( not ( = ?auto_1479736 ?auto_1479740 ) ) ( not ( = ?auto_1479736 ?auto_1479745 ) ) ( not ( = ?auto_1479737 ?auto_1479738 ) ) ( not ( = ?auto_1479737 ?auto_1479739 ) ) ( not ( = ?auto_1479737 ?auto_1479740 ) ) ( not ( = ?auto_1479737 ?auto_1479745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479738 ?auto_1479739 ?auto_1479740 )
      ( MAKE-13CRATE-VERIFY ?auto_1479727 ?auto_1479728 ?auto_1479729 ?auto_1479730 ?auto_1479731 ?auto_1479732 ?auto_1479733 ?auto_1479734 ?auto_1479735 ?auto_1479736 ?auto_1479737 ?auto_1479738 ?auto_1479739 ?auto_1479740 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479910 - SURFACE
      ?auto_1479911 - SURFACE
      ?auto_1479912 - SURFACE
      ?auto_1479913 - SURFACE
      ?auto_1479914 - SURFACE
      ?auto_1479915 - SURFACE
      ?auto_1479916 - SURFACE
      ?auto_1479917 - SURFACE
      ?auto_1479918 - SURFACE
      ?auto_1479919 - SURFACE
      ?auto_1479920 - SURFACE
      ?auto_1479921 - SURFACE
      ?auto_1479922 - SURFACE
      ?auto_1479923 - SURFACE
    )
    :vars
    (
      ?auto_1479928 - HOIST
      ?auto_1479924 - PLACE
      ?auto_1479927 - PLACE
      ?auto_1479926 - HOIST
      ?auto_1479925 - SURFACE
      ?auto_1479929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479928 ?auto_1479924 ) ( SURFACE-AT ?auto_1479922 ?auto_1479924 ) ( CLEAR ?auto_1479922 ) ( IS-CRATE ?auto_1479923 ) ( not ( = ?auto_1479922 ?auto_1479923 ) ) ( AVAILABLE ?auto_1479928 ) ( ON ?auto_1479922 ?auto_1479921 ) ( not ( = ?auto_1479921 ?auto_1479922 ) ) ( not ( = ?auto_1479921 ?auto_1479923 ) ) ( not ( = ?auto_1479927 ?auto_1479924 ) ) ( HOIST-AT ?auto_1479926 ?auto_1479927 ) ( not ( = ?auto_1479928 ?auto_1479926 ) ) ( AVAILABLE ?auto_1479926 ) ( SURFACE-AT ?auto_1479923 ?auto_1479927 ) ( ON ?auto_1479923 ?auto_1479925 ) ( CLEAR ?auto_1479923 ) ( not ( = ?auto_1479922 ?auto_1479925 ) ) ( not ( = ?auto_1479923 ?auto_1479925 ) ) ( not ( = ?auto_1479921 ?auto_1479925 ) ) ( TRUCK-AT ?auto_1479929 ?auto_1479924 ) ( ON ?auto_1479911 ?auto_1479910 ) ( ON ?auto_1479912 ?auto_1479911 ) ( ON ?auto_1479913 ?auto_1479912 ) ( ON ?auto_1479914 ?auto_1479913 ) ( ON ?auto_1479915 ?auto_1479914 ) ( ON ?auto_1479916 ?auto_1479915 ) ( ON ?auto_1479917 ?auto_1479916 ) ( ON ?auto_1479918 ?auto_1479917 ) ( ON ?auto_1479919 ?auto_1479918 ) ( ON ?auto_1479920 ?auto_1479919 ) ( ON ?auto_1479921 ?auto_1479920 ) ( not ( = ?auto_1479910 ?auto_1479911 ) ) ( not ( = ?auto_1479910 ?auto_1479912 ) ) ( not ( = ?auto_1479910 ?auto_1479913 ) ) ( not ( = ?auto_1479910 ?auto_1479914 ) ) ( not ( = ?auto_1479910 ?auto_1479915 ) ) ( not ( = ?auto_1479910 ?auto_1479916 ) ) ( not ( = ?auto_1479910 ?auto_1479917 ) ) ( not ( = ?auto_1479910 ?auto_1479918 ) ) ( not ( = ?auto_1479910 ?auto_1479919 ) ) ( not ( = ?auto_1479910 ?auto_1479920 ) ) ( not ( = ?auto_1479910 ?auto_1479921 ) ) ( not ( = ?auto_1479910 ?auto_1479922 ) ) ( not ( = ?auto_1479910 ?auto_1479923 ) ) ( not ( = ?auto_1479910 ?auto_1479925 ) ) ( not ( = ?auto_1479911 ?auto_1479912 ) ) ( not ( = ?auto_1479911 ?auto_1479913 ) ) ( not ( = ?auto_1479911 ?auto_1479914 ) ) ( not ( = ?auto_1479911 ?auto_1479915 ) ) ( not ( = ?auto_1479911 ?auto_1479916 ) ) ( not ( = ?auto_1479911 ?auto_1479917 ) ) ( not ( = ?auto_1479911 ?auto_1479918 ) ) ( not ( = ?auto_1479911 ?auto_1479919 ) ) ( not ( = ?auto_1479911 ?auto_1479920 ) ) ( not ( = ?auto_1479911 ?auto_1479921 ) ) ( not ( = ?auto_1479911 ?auto_1479922 ) ) ( not ( = ?auto_1479911 ?auto_1479923 ) ) ( not ( = ?auto_1479911 ?auto_1479925 ) ) ( not ( = ?auto_1479912 ?auto_1479913 ) ) ( not ( = ?auto_1479912 ?auto_1479914 ) ) ( not ( = ?auto_1479912 ?auto_1479915 ) ) ( not ( = ?auto_1479912 ?auto_1479916 ) ) ( not ( = ?auto_1479912 ?auto_1479917 ) ) ( not ( = ?auto_1479912 ?auto_1479918 ) ) ( not ( = ?auto_1479912 ?auto_1479919 ) ) ( not ( = ?auto_1479912 ?auto_1479920 ) ) ( not ( = ?auto_1479912 ?auto_1479921 ) ) ( not ( = ?auto_1479912 ?auto_1479922 ) ) ( not ( = ?auto_1479912 ?auto_1479923 ) ) ( not ( = ?auto_1479912 ?auto_1479925 ) ) ( not ( = ?auto_1479913 ?auto_1479914 ) ) ( not ( = ?auto_1479913 ?auto_1479915 ) ) ( not ( = ?auto_1479913 ?auto_1479916 ) ) ( not ( = ?auto_1479913 ?auto_1479917 ) ) ( not ( = ?auto_1479913 ?auto_1479918 ) ) ( not ( = ?auto_1479913 ?auto_1479919 ) ) ( not ( = ?auto_1479913 ?auto_1479920 ) ) ( not ( = ?auto_1479913 ?auto_1479921 ) ) ( not ( = ?auto_1479913 ?auto_1479922 ) ) ( not ( = ?auto_1479913 ?auto_1479923 ) ) ( not ( = ?auto_1479913 ?auto_1479925 ) ) ( not ( = ?auto_1479914 ?auto_1479915 ) ) ( not ( = ?auto_1479914 ?auto_1479916 ) ) ( not ( = ?auto_1479914 ?auto_1479917 ) ) ( not ( = ?auto_1479914 ?auto_1479918 ) ) ( not ( = ?auto_1479914 ?auto_1479919 ) ) ( not ( = ?auto_1479914 ?auto_1479920 ) ) ( not ( = ?auto_1479914 ?auto_1479921 ) ) ( not ( = ?auto_1479914 ?auto_1479922 ) ) ( not ( = ?auto_1479914 ?auto_1479923 ) ) ( not ( = ?auto_1479914 ?auto_1479925 ) ) ( not ( = ?auto_1479915 ?auto_1479916 ) ) ( not ( = ?auto_1479915 ?auto_1479917 ) ) ( not ( = ?auto_1479915 ?auto_1479918 ) ) ( not ( = ?auto_1479915 ?auto_1479919 ) ) ( not ( = ?auto_1479915 ?auto_1479920 ) ) ( not ( = ?auto_1479915 ?auto_1479921 ) ) ( not ( = ?auto_1479915 ?auto_1479922 ) ) ( not ( = ?auto_1479915 ?auto_1479923 ) ) ( not ( = ?auto_1479915 ?auto_1479925 ) ) ( not ( = ?auto_1479916 ?auto_1479917 ) ) ( not ( = ?auto_1479916 ?auto_1479918 ) ) ( not ( = ?auto_1479916 ?auto_1479919 ) ) ( not ( = ?auto_1479916 ?auto_1479920 ) ) ( not ( = ?auto_1479916 ?auto_1479921 ) ) ( not ( = ?auto_1479916 ?auto_1479922 ) ) ( not ( = ?auto_1479916 ?auto_1479923 ) ) ( not ( = ?auto_1479916 ?auto_1479925 ) ) ( not ( = ?auto_1479917 ?auto_1479918 ) ) ( not ( = ?auto_1479917 ?auto_1479919 ) ) ( not ( = ?auto_1479917 ?auto_1479920 ) ) ( not ( = ?auto_1479917 ?auto_1479921 ) ) ( not ( = ?auto_1479917 ?auto_1479922 ) ) ( not ( = ?auto_1479917 ?auto_1479923 ) ) ( not ( = ?auto_1479917 ?auto_1479925 ) ) ( not ( = ?auto_1479918 ?auto_1479919 ) ) ( not ( = ?auto_1479918 ?auto_1479920 ) ) ( not ( = ?auto_1479918 ?auto_1479921 ) ) ( not ( = ?auto_1479918 ?auto_1479922 ) ) ( not ( = ?auto_1479918 ?auto_1479923 ) ) ( not ( = ?auto_1479918 ?auto_1479925 ) ) ( not ( = ?auto_1479919 ?auto_1479920 ) ) ( not ( = ?auto_1479919 ?auto_1479921 ) ) ( not ( = ?auto_1479919 ?auto_1479922 ) ) ( not ( = ?auto_1479919 ?auto_1479923 ) ) ( not ( = ?auto_1479919 ?auto_1479925 ) ) ( not ( = ?auto_1479920 ?auto_1479921 ) ) ( not ( = ?auto_1479920 ?auto_1479922 ) ) ( not ( = ?auto_1479920 ?auto_1479923 ) ) ( not ( = ?auto_1479920 ?auto_1479925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479921 ?auto_1479922 ?auto_1479923 )
      ( MAKE-13CRATE-VERIFY ?auto_1479910 ?auto_1479911 ?auto_1479912 ?auto_1479913 ?auto_1479914 ?auto_1479915 ?auto_1479916 ?auto_1479917 ?auto_1479918 ?auto_1479919 ?auto_1479920 ?auto_1479921 ?auto_1479922 ?auto_1479923 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1480093 - SURFACE
      ?auto_1480094 - SURFACE
      ?auto_1480095 - SURFACE
      ?auto_1480096 - SURFACE
      ?auto_1480097 - SURFACE
      ?auto_1480098 - SURFACE
      ?auto_1480099 - SURFACE
      ?auto_1480100 - SURFACE
      ?auto_1480101 - SURFACE
      ?auto_1480102 - SURFACE
      ?auto_1480103 - SURFACE
      ?auto_1480104 - SURFACE
      ?auto_1480105 - SURFACE
      ?auto_1480106 - SURFACE
    )
    :vars
    (
      ?auto_1480110 - HOIST
      ?auto_1480107 - PLACE
      ?auto_1480109 - PLACE
      ?auto_1480112 - HOIST
      ?auto_1480111 - SURFACE
      ?auto_1480108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1480110 ?auto_1480107 ) ( IS-CRATE ?auto_1480106 ) ( not ( = ?auto_1480105 ?auto_1480106 ) ) ( not ( = ?auto_1480104 ?auto_1480105 ) ) ( not ( = ?auto_1480104 ?auto_1480106 ) ) ( not ( = ?auto_1480109 ?auto_1480107 ) ) ( HOIST-AT ?auto_1480112 ?auto_1480109 ) ( not ( = ?auto_1480110 ?auto_1480112 ) ) ( AVAILABLE ?auto_1480112 ) ( SURFACE-AT ?auto_1480106 ?auto_1480109 ) ( ON ?auto_1480106 ?auto_1480111 ) ( CLEAR ?auto_1480106 ) ( not ( = ?auto_1480105 ?auto_1480111 ) ) ( not ( = ?auto_1480106 ?auto_1480111 ) ) ( not ( = ?auto_1480104 ?auto_1480111 ) ) ( TRUCK-AT ?auto_1480108 ?auto_1480107 ) ( SURFACE-AT ?auto_1480104 ?auto_1480107 ) ( CLEAR ?auto_1480104 ) ( LIFTING ?auto_1480110 ?auto_1480105 ) ( IS-CRATE ?auto_1480105 ) ( ON ?auto_1480094 ?auto_1480093 ) ( ON ?auto_1480095 ?auto_1480094 ) ( ON ?auto_1480096 ?auto_1480095 ) ( ON ?auto_1480097 ?auto_1480096 ) ( ON ?auto_1480098 ?auto_1480097 ) ( ON ?auto_1480099 ?auto_1480098 ) ( ON ?auto_1480100 ?auto_1480099 ) ( ON ?auto_1480101 ?auto_1480100 ) ( ON ?auto_1480102 ?auto_1480101 ) ( ON ?auto_1480103 ?auto_1480102 ) ( ON ?auto_1480104 ?auto_1480103 ) ( not ( = ?auto_1480093 ?auto_1480094 ) ) ( not ( = ?auto_1480093 ?auto_1480095 ) ) ( not ( = ?auto_1480093 ?auto_1480096 ) ) ( not ( = ?auto_1480093 ?auto_1480097 ) ) ( not ( = ?auto_1480093 ?auto_1480098 ) ) ( not ( = ?auto_1480093 ?auto_1480099 ) ) ( not ( = ?auto_1480093 ?auto_1480100 ) ) ( not ( = ?auto_1480093 ?auto_1480101 ) ) ( not ( = ?auto_1480093 ?auto_1480102 ) ) ( not ( = ?auto_1480093 ?auto_1480103 ) ) ( not ( = ?auto_1480093 ?auto_1480104 ) ) ( not ( = ?auto_1480093 ?auto_1480105 ) ) ( not ( = ?auto_1480093 ?auto_1480106 ) ) ( not ( = ?auto_1480093 ?auto_1480111 ) ) ( not ( = ?auto_1480094 ?auto_1480095 ) ) ( not ( = ?auto_1480094 ?auto_1480096 ) ) ( not ( = ?auto_1480094 ?auto_1480097 ) ) ( not ( = ?auto_1480094 ?auto_1480098 ) ) ( not ( = ?auto_1480094 ?auto_1480099 ) ) ( not ( = ?auto_1480094 ?auto_1480100 ) ) ( not ( = ?auto_1480094 ?auto_1480101 ) ) ( not ( = ?auto_1480094 ?auto_1480102 ) ) ( not ( = ?auto_1480094 ?auto_1480103 ) ) ( not ( = ?auto_1480094 ?auto_1480104 ) ) ( not ( = ?auto_1480094 ?auto_1480105 ) ) ( not ( = ?auto_1480094 ?auto_1480106 ) ) ( not ( = ?auto_1480094 ?auto_1480111 ) ) ( not ( = ?auto_1480095 ?auto_1480096 ) ) ( not ( = ?auto_1480095 ?auto_1480097 ) ) ( not ( = ?auto_1480095 ?auto_1480098 ) ) ( not ( = ?auto_1480095 ?auto_1480099 ) ) ( not ( = ?auto_1480095 ?auto_1480100 ) ) ( not ( = ?auto_1480095 ?auto_1480101 ) ) ( not ( = ?auto_1480095 ?auto_1480102 ) ) ( not ( = ?auto_1480095 ?auto_1480103 ) ) ( not ( = ?auto_1480095 ?auto_1480104 ) ) ( not ( = ?auto_1480095 ?auto_1480105 ) ) ( not ( = ?auto_1480095 ?auto_1480106 ) ) ( not ( = ?auto_1480095 ?auto_1480111 ) ) ( not ( = ?auto_1480096 ?auto_1480097 ) ) ( not ( = ?auto_1480096 ?auto_1480098 ) ) ( not ( = ?auto_1480096 ?auto_1480099 ) ) ( not ( = ?auto_1480096 ?auto_1480100 ) ) ( not ( = ?auto_1480096 ?auto_1480101 ) ) ( not ( = ?auto_1480096 ?auto_1480102 ) ) ( not ( = ?auto_1480096 ?auto_1480103 ) ) ( not ( = ?auto_1480096 ?auto_1480104 ) ) ( not ( = ?auto_1480096 ?auto_1480105 ) ) ( not ( = ?auto_1480096 ?auto_1480106 ) ) ( not ( = ?auto_1480096 ?auto_1480111 ) ) ( not ( = ?auto_1480097 ?auto_1480098 ) ) ( not ( = ?auto_1480097 ?auto_1480099 ) ) ( not ( = ?auto_1480097 ?auto_1480100 ) ) ( not ( = ?auto_1480097 ?auto_1480101 ) ) ( not ( = ?auto_1480097 ?auto_1480102 ) ) ( not ( = ?auto_1480097 ?auto_1480103 ) ) ( not ( = ?auto_1480097 ?auto_1480104 ) ) ( not ( = ?auto_1480097 ?auto_1480105 ) ) ( not ( = ?auto_1480097 ?auto_1480106 ) ) ( not ( = ?auto_1480097 ?auto_1480111 ) ) ( not ( = ?auto_1480098 ?auto_1480099 ) ) ( not ( = ?auto_1480098 ?auto_1480100 ) ) ( not ( = ?auto_1480098 ?auto_1480101 ) ) ( not ( = ?auto_1480098 ?auto_1480102 ) ) ( not ( = ?auto_1480098 ?auto_1480103 ) ) ( not ( = ?auto_1480098 ?auto_1480104 ) ) ( not ( = ?auto_1480098 ?auto_1480105 ) ) ( not ( = ?auto_1480098 ?auto_1480106 ) ) ( not ( = ?auto_1480098 ?auto_1480111 ) ) ( not ( = ?auto_1480099 ?auto_1480100 ) ) ( not ( = ?auto_1480099 ?auto_1480101 ) ) ( not ( = ?auto_1480099 ?auto_1480102 ) ) ( not ( = ?auto_1480099 ?auto_1480103 ) ) ( not ( = ?auto_1480099 ?auto_1480104 ) ) ( not ( = ?auto_1480099 ?auto_1480105 ) ) ( not ( = ?auto_1480099 ?auto_1480106 ) ) ( not ( = ?auto_1480099 ?auto_1480111 ) ) ( not ( = ?auto_1480100 ?auto_1480101 ) ) ( not ( = ?auto_1480100 ?auto_1480102 ) ) ( not ( = ?auto_1480100 ?auto_1480103 ) ) ( not ( = ?auto_1480100 ?auto_1480104 ) ) ( not ( = ?auto_1480100 ?auto_1480105 ) ) ( not ( = ?auto_1480100 ?auto_1480106 ) ) ( not ( = ?auto_1480100 ?auto_1480111 ) ) ( not ( = ?auto_1480101 ?auto_1480102 ) ) ( not ( = ?auto_1480101 ?auto_1480103 ) ) ( not ( = ?auto_1480101 ?auto_1480104 ) ) ( not ( = ?auto_1480101 ?auto_1480105 ) ) ( not ( = ?auto_1480101 ?auto_1480106 ) ) ( not ( = ?auto_1480101 ?auto_1480111 ) ) ( not ( = ?auto_1480102 ?auto_1480103 ) ) ( not ( = ?auto_1480102 ?auto_1480104 ) ) ( not ( = ?auto_1480102 ?auto_1480105 ) ) ( not ( = ?auto_1480102 ?auto_1480106 ) ) ( not ( = ?auto_1480102 ?auto_1480111 ) ) ( not ( = ?auto_1480103 ?auto_1480104 ) ) ( not ( = ?auto_1480103 ?auto_1480105 ) ) ( not ( = ?auto_1480103 ?auto_1480106 ) ) ( not ( = ?auto_1480103 ?auto_1480111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1480104 ?auto_1480105 ?auto_1480106 )
      ( MAKE-13CRATE-VERIFY ?auto_1480093 ?auto_1480094 ?auto_1480095 ?auto_1480096 ?auto_1480097 ?auto_1480098 ?auto_1480099 ?auto_1480100 ?auto_1480101 ?auto_1480102 ?auto_1480103 ?auto_1480104 ?auto_1480105 ?auto_1480106 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1480276 - SURFACE
      ?auto_1480277 - SURFACE
      ?auto_1480278 - SURFACE
      ?auto_1480279 - SURFACE
      ?auto_1480280 - SURFACE
      ?auto_1480281 - SURFACE
      ?auto_1480282 - SURFACE
      ?auto_1480283 - SURFACE
      ?auto_1480284 - SURFACE
      ?auto_1480285 - SURFACE
      ?auto_1480286 - SURFACE
      ?auto_1480287 - SURFACE
      ?auto_1480288 - SURFACE
      ?auto_1480289 - SURFACE
    )
    :vars
    (
      ?auto_1480295 - HOIST
      ?auto_1480290 - PLACE
      ?auto_1480294 - PLACE
      ?auto_1480292 - HOIST
      ?auto_1480291 - SURFACE
      ?auto_1480293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1480295 ?auto_1480290 ) ( IS-CRATE ?auto_1480289 ) ( not ( = ?auto_1480288 ?auto_1480289 ) ) ( not ( = ?auto_1480287 ?auto_1480288 ) ) ( not ( = ?auto_1480287 ?auto_1480289 ) ) ( not ( = ?auto_1480294 ?auto_1480290 ) ) ( HOIST-AT ?auto_1480292 ?auto_1480294 ) ( not ( = ?auto_1480295 ?auto_1480292 ) ) ( AVAILABLE ?auto_1480292 ) ( SURFACE-AT ?auto_1480289 ?auto_1480294 ) ( ON ?auto_1480289 ?auto_1480291 ) ( CLEAR ?auto_1480289 ) ( not ( = ?auto_1480288 ?auto_1480291 ) ) ( not ( = ?auto_1480289 ?auto_1480291 ) ) ( not ( = ?auto_1480287 ?auto_1480291 ) ) ( TRUCK-AT ?auto_1480293 ?auto_1480290 ) ( SURFACE-AT ?auto_1480287 ?auto_1480290 ) ( CLEAR ?auto_1480287 ) ( IS-CRATE ?auto_1480288 ) ( AVAILABLE ?auto_1480295 ) ( IN ?auto_1480288 ?auto_1480293 ) ( ON ?auto_1480277 ?auto_1480276 ) ( ON ?auto_1480278 ?auto_1480277 ) ( ON ?auto_1480279 ?auto_1480278 ) ( ON ?auto_1480280 ?auto_1480279 ) ( ON ?auto_1480281 ?auto_1480280 ) ( ON ?auto_1480282 ?auto_1480281 ) ( ON ?auto_1480283 ?auto_1480282 ) ( ON ?auto_1480284 ?auto_1480283 ) ( ON ?auto_1480285 ?auto_1480284 ) ( ON ?auto_1480286 ?auto_1480285 ) ( ON ?auto_1480287 ?auto_1480286 ) ( not ( = ?auto_1480276 ?auto_1480277 ) ) ( not ( = ?auto_1480276 ?auto_1480278 ) ) ( not ( = ?auto_1480276 ?auto_1480279 ) ) ( not ( = ?auto_1480276 ?auto_1480280 ) ) ( not ( = ?auto_1480276 ?auto_1480281 ) ) ( not ( = ?auto_1480276 ?auto_1480282 ) ) ( not ( = ?auto_1480276 ?auto_1480283 ) ) ( not ( = ?auto_1480276 ?auto_1480284 ) ) ( not ( = ?auto_1480276 ?auto_1480285 ) ) ( not ( = ?auto_1480276 ?auto_1480286 ) ) ( not ( = ?auto_1480276 ?auto_1480287 ) ) ( not ( = ?auto_1480276 ?auto_1480288 ) ) ( not ( = ?auto_1480276 ?auto_1480289 ) ) ( not ( = ?auto_1480276 ?auto_1480291 ) ) ( not ( = ?auto_1480277 ?auto_1480278 ) ) ( not ( = ?auto_1480277 ?auto_1480279 ) ) ( not ( = ?auto_1480277 ?auto_1480280 ) ) ( not ( = ?auto_1480277 ?auto_1480281 ) ) ( not ( = ?auto_1480277 ?auto_1480282 ) ) ( not ( = ?auto_1480277 ?auto_1480283 ) ) ( not ( = ?auto_1480277 ?auto_1480284 ) ) ( not ( = ?auto_1480277 ?auto_1480285 ) ) ( not ( = ?auto_1480277 ?auto_1480286 ) ) ( not ( = ?auto_1480277 ?auto_1480287 ) ) ( not ( = ?auto_1480277 ?auto_1480288 ) ) ( not ( = ?auto_1480277 ?auto_1480289 ) ) ( not ( = ?auto_1480277 ?auto_1480291 ) ) ( not ( = ?auto_1480278 ?auto_1480279 ) ) ( not ( = ?auto_1480278 ?auto_1480280 ) ) ( not ( = ?auto_1480278 ?auto_1480281 ) ) ( not ( = ?auto_1480278 ?auto_1480282 ) ) ( not ( = ?auto_1480278 ?auto_1480283 ) ) ( not ( = ?auto_1480278 ?auto_1480284 ) ) ( not ( = ?auto_1480278 ?auto_1480285 ) ) ( not ( = ?auto_1480278 ?auto_1480286 ) ) ( not ( = ?auto_1480278 ?auto_1480287 ) ) ( not ( = ?auto_1480278 ?auto_1480288 ) ) ( not ( = ?auto_1480278 ?auto_1480289 ) ) ( not ( = ?auto_1480278 ?auto_1480291 ) ) ( not ( = ?auto_1480279 ?auto_1480280 ) ) ( not ( = ?auto_1480279 ?auto_1480281 ) ) ( not ( = ?auto_1480279 ?auto_1480282 ) ) ( not ( = ?auto_1480279 ?auto_1480283 ) ) ( not ( = ?auto_1480279 ?auto_1480284 ) ) ( not ( = ?auto_1480279 ?auto_1480285 ) ) ( not ( = ?auto_1480279 ?auto_1480286 ) ) ( not ( = ?auto_1480279 ?auto_1480287 ) ) ( not ( = ?auto_1480279 ?auto_1480288 ) ) ( not ( = ?auto_1480279 ?auto_1480289 ) ) ( not ( = ?auto_1480279 ?auto_1480291 ) ) ( not ( = ?auto_1480280 ?auto_1480281 ) ) ( not ( = ?auto_1480280 ?auto_1480282 ) ) ( not ( = ?auto_1480280 ?auto_1480283 ) ) ( not ( = ?auto_1480280 ?auto_1480284 ) ) ( not ( = ?auto_1480280 ?auto_1480285 ) ) ( not ( = ?auto_1480280 ?auto_1480286 ) ) ( not ( = ?auto_1480280 ?auto_1480287 ) ) ( not ( = ?auto_1480280 ?auto_1480288 ) ) ( not ( = ?auto_1480280 ?auto_1480289 ) ) ( not ( = ?auto_1480280 ?auto_1480291 ) ) ( not ( = ?auto_1480281 ?auto_1480282 ) ) ( not ( = ?auto_1480281 ?auto_1480283 ) ) ( not ( = ?auto_1480281 ?auto_1480284 ) ) ( not ( = ?auto_1480281 ?auto_1480285 ) ) ( not ( = ?auto_1480281 ?auto_1480286 ) ) ( not ( = ?auto_1480281 ?auto_1480287 ) ) ( not ( = ?auto_1480281 ?auto_1480288 ) ) ( not ( = ?auto_1480281 ?auto_1480289 ) ) ( not ( = ?auto_1480281 ?auto_1480291 ) ) ( not ( = ?auto_1480282 ?auto_1480283 ) ) ( not ( = ?auto_1480282 ?auto_1480284 ) ) ( not ( = ?auto_1480282 ?auto_1480285 ) ) ( not ( = ?auto_1480282 ?auto_1480286 ) ) ( not ( = ?auto_1480282 ?auto_1480287 ) ) ( not ( = ?auto_1480282 ?auto_1480288 ) ) ( not ( = ?auto_1480282 ?auto_1480289 ) ) ( not ( = ?auto_1480282 ?auto_1480291 ) ) ( not ( = ?auto_1480283 ?auto_1480284 ) ) ( not ( = ?auto_1480283 ?auto_1480285 ) ) ( not ( = ?auto_1480283 ?auto_1480286 ) ) ( not ( = ?auto_1480283 ?auto_1480287 ) ) ( not ( = ?auto_1480283 ?auto_1480288 ) ) ( not ( = ?auto_1480283 ?auto_1480289 ) ) ( not ( = ?auto_1480283 ?auto_1480291 ) ) ( not ( = ?auto_1480284 ?auto_1480285 ) ) ( not ( = ?auto_1480284 ?auto_1480286 ) ) ( not ( = ?auto_1480284 ?auto_1480287 ) ) ( not ( = ?auto_1480284 ?auto_1480288 ) ) ( not ( = ?auto_1480284 ?auto_1480289 ) ) ( not ( = ?auto_1480284 ?auto_1480291 ) ) ( not ( = ?auto_1480285 ?auto_1480286 ) ) ( not ( = ?auto_1480285 ?auto_1480287 ) ) ( not ( = ?auto_1480285 ?auto_1480288 ) ) ( not ( = ?auto_1480285 ?auto_1480289 ) ) ( not ( = ?auto_1480285 ?auto_1480291 ) ) ( not ( = ?auto_1480286 ?auto_1480287 ) ) ( not ( = ?auto_1480286 ?auto_1480288 ) ) ( not ( = ?auto_1480286 ?auto_1480289 ) ) ( not ( = ?auto_1480286 ?auto_1480291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1480287 ?auto_1480288 ?auto_1480289 )
      ( MAKE-13CRATE-VERIFY ?auto_1480276 ?auto_1480277 ?auto_1480278 ?auto_1480279 ?auto_1480280 ?auto_1480281 ?auto_1480282 ?auto_1480283 ?auto_1480284 ?auto_1480285 ?auto_1480286 ?auto_1480287 ?auto_1480288 ?auto_1480289 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494494 - SURFACE
      ?auto_1494495 - SURFACE
      ?auto_1494496 - SURFACE
      ?auto_1494497 - SURFACE
      ?auto_1494498 - SURFACE
      ?auto_1494499 - SURFACE
      ?auto_1494500 - SURFACE
      ?auto_1494501 - SURFACE
      ?auto_1494502 - SURFACE
      ?auto_1494503 - SURFACE
      ?auto_1494504 - SURFACE
      ?auto_1494505 - SURFACE
      ?auto_1494506 - SURFACE
      ?auto_1494507 - SURFACE
      ?auto_1494508 - SURFACE
    )
    :vars
    (
      ?auto_1494510 - HOIST
      ?auto_1494509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494510 ?auto_1494509 ) ( SURFACE-AT ?auto_1494507 ?auto_1494509 ) ( CLEAR ?auto_1494507 ) ( LIFTING ?auto_1494510 ?auto_1494508 ) ( IS-CRATE ?auto_1494508 ) ( not ( = ?auto_1494507 ?auto_1494508 ) ) ( ON ?auto_1494495 ?auto_1494494 ) ( ON ?auto_1494496 ?auto_1494495 ) ( ON ?auto_1494497 ?auto_1494496 ) ( ON ?auto_1494498 ?auto_1494497 ) ( ON ?auto_1494499 ?auto_1494498 ) ( ON ?auto_1494500 ?auto_1494499 ) ( ON ?auto_1494501 ?auto_1494500 ) ( ON ?auto_1494502 ?auto_1494501 ) ( ON ?auto_1494503 ?auto_1494502 ) ( ON ?auto_1494504 ?auto_1494503 ) ( ON ?auto_1494505 ?auto_1494504 ) ( ON ?auto_1494506 ?auto_1494505 ) ( ON ?auto_1494507 ?auto_1494506 ) ( not ( = ?auto_1494494 ?auto_1494495 ) ) ( not ( = ?auto_1494494 ?auto_1494496 ) ) ( not ( = ?auto_1494494 ?auto_1494497 ) ) ( not ( = ?auto_1494494 ?auto_1494498 ) ) ( not ( = ?auto_1494494 ?auto_1494499 ) ) ( not ( = ?auto_1494494 ?auto_1494500 ) ) ( not ( = ?auto_1494494 ?auto_1494501 ) ) ( not ( = ?auto_1494494 ?auto_1494502 ) ) ( not ( = ?auto_1494494 ?auto_1494503 ) ) ( not ( = ?auto_1494494 ?auto_1494504 ) ) ( not ( = ?auto_1494494 ?auto_1494505 ) ) ( not ( = ?auto_1494494 ?auto_1494506 ) ) ( not ( = ?auto_1494494 ?auto_1494507 ) ) ( not ( = ?auto_1494494 ?auto_1494508 ) ) ( not ( = ?auto_1494495 ?auto_1494496 ) ) ( not ( = ?auto_1494495 ?auto_1494497 ) ) ( not ( = ?auto_1494495 ?auto_1494498 ) ) ( not ( = ?auto_1494495 ?auto_1494499 ) ) ( not ( = ?auto_1494495 ?auto_1494500 ) ) ( not ( = ?auto_1494495 ?auto_1494501 ) ) ( not ( = ?auto_1494495 ?auto_1494502 ) ) ( not ( = ?auto_1494495 ?auto_1494503 ) ) ( not ( = ?auto_1494495 ?auto_1494504 ) ) ( not ( = ?auto_1494495 ?auto_1494505 ) ) ( not ( = ?auto_1494495 ?auto_1494506 ) ) ( not ( = ?auto_1494495 ?auto_1494507 ) ) ( not ( = ?auto_1494495 ?auto_1494508 ) ) ( not ( = ?auto_1494496 ?auto_1494497 ) ) ( not ( = ?auto_1494496 ?auto_1494498 ) ) ( not ( = ?auto_1494496 ?auto_1494499 ) ) ( not ( = ?auto_1494496 ?auto_1494500 ) ) ( not ( = ?auto_1494496 ?auto_1494501 ) ) ( not ( = ?auto_1494496 ?auto_1494502 ) ) ( not ( = ?auto_1494496 ?auto_1494503 ) ) ( not ( = ?auto_1494496 ?auto_1494504 ) ) ( not ( = ?auto_1494496 ?auto_1494505 ) ) ( not ( = ?auto_1494496 ?auto_1494506 ) ) ( not ( = ?auto_1494496 ?auto_1494507 ) ) ( not ( = ?auto_1494496 ?auto_1494508 ) ) ( not ( = ?auto_1494497 ?auto_1494498 ) ) ( not ( = ?auto_1494497 ?auto_1494499 ) ) ( not ( = ?auto_1494497 ?auto_1494500 ) ) ( not ( = ?auto_1494497 ?auto_1494501 ) ) ( not ( = ?auto_1494497 ?auto_1494502 ) ) ( not ( = ?auto_1494497 ?auto_1494503 ) ) ( not ( = ?auto_1494497 ?auto_1494504 ) ) ( not ( = ?auto_1494497 ?auto_1494505 ) ) ( not ( = ?auto_1494497 ?auto_1494506 ) ) ( not ( = ?auto_1494497 ?auto_1494507 ) ) ( not ( = ?auto_1494497 ?auto_1494508 ) ) ( not ( = ?auto_1494498 ?auto_1494499 ) ) ( not ( = ?auto_1494498 ?auto_1494500 ) ) ( not ( = ?auto_1494498 ?auto_1494501 ) ) ( not ( = ?auto_1494498 ?auto_1494502 ) ) ( not ( = ?auto_1494498 ?auto_1494503 ) ) ( not ( = ?auto_1494498 ?auto_1494504 ) ) ( not ( = ?auto_1494498 ?auto_1494505 ) ) ( not ( = ?auto_1494498 ?auto_1494506 ) ) ( not ( = ?auto_1494498 ?auto_1494507 ) ) ( not ( = ?auto_1494498 ?auto_1494508 ) ) ( not ( = ?auto_1494499 ?auto_1494500 ) ) ( not ( = ?auto_1494499 ?auto_1494501 ) ) ( not ( = ?auto_1494499 ?auto_1494502 ) ) ( not ( = ?auto_1494499 ?auto_1494503 ) ) ( not ( = ?auto_1494499 ?auto_1494504 ) ) ( not ( = ?auto_1494499 ?auto_1494505 ) ) ( not ( = ?auto_1494499 ?auto_1494506 ) ) ( not ( = ?auto_1494499 ?auto_1494507 ) ) ( not ( = ?auto_1494499 ?auto_1494508 ) ) ( not ( = ?auto_1494500 ?auto_1494501 ) ) ( not ( = ?auto_1494500 ?auto_1494502 ) ) ( not ( = ?auto_1494500 ?auto_1494503 ) ) ( not ( = ?auto_1494500 ?auto_1494504 ) ) ( not ( = ?auto_1494500 ?auto_1494505 ) ) ( not ( = ?auto_1494500 ?auto_1494506 ) ) ( not ( = ?auto_1494500 ?auto_1494507 ) ) ( not ( = ?auto_1494500 ?auto_1494508 ) ) ( not ( = ?auto_1494501 ?auto_1494502 ) ) ( not ( = ?auto_1494501 ?auto_1494503 ) ) ( not ( = ?auto_1494501 ?auto_1494504 ) ) ( not ( = ?auto_1494501 ?auto_1494505 ) ) ( not ( = ?auto_1494501 ?auto_1494506 ) ) ( not ( = ?auto_1494501 ?auto_1494507 ) ) ( not ( = ?auto_1494501 ?auto_1494508 ) ) ( not ( = ?auto_1494502 ?auto_1494503 ) ) ( not ( = ?auto_1494502 ?auto_1494504 ) ) ( not ( = ?auto_1494502 ?auto_1494505 ) ) ( not ( = ?auto_1494502 ?auto_1494506 ) ) ( not ( = ?auto_1494502 ?auto_1494507 ) ) ( not ( = ?auto_1494502 ?auto_1494508 ) ) ( not ( = ?auto_1494503 ?auto_1494504 ) ) ( not ( = ?auto_1494503 ?auto_1494505 ) ) ( not ( = ?auto_1494503 ?auto_1494506 ) ) ( not ( = ?auto_1494503 ?auto_1494507 ) ) ( not ( = ?auto_1494503 ?auto_1494508 ) ) ( not ( = ?auto_1494504 ?auto_1494505 ) ) ( not ( = ?auto_1494504 ?auto_1494506 ) ) ( not ( = ?auto_1494504 ?auto_1494507 ) ) ( not ( = ?auto_1494504 ?auto_1494508 ) ) ( not ( = ?auto_1494505 ?auto_1494506 ) ) ( not ( = ?auto_1494505 ?auto_1494507 ) ) ( not ( = ?auto_1494505 ?auto_1494508 ) ) ( not ( = ?auto_1494506 ?auto_1494507 ) ) ( not ( = ?auto_1494506 ?auto_1494508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1494507 ?auto_1494508 )
      ( MAKE-14CRATE-VERIFY ?auto_1494494 ?auto_1494495 ?auto_1494496 ?auto_1494497 ?auto_1494498 ?auto_1494499 ?auto_1494500 ?auto_1494501 ?auto_1494502 ?auto_1494503 ?auto_1494504 ?auto_1494505 ?auto_1494506 ?auto_1494507 ?auto_1494508 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494654 - SURFACE
      ?auto_1494655 - SURFACE
      ?auto_1494656 - SURFACE
      ?auto_1494657 - SURFACE
      ?auto_1494658 - SURFACE
      ?auto_1494659 - SURFACE
      ?auto_1494660 - SURFACE
      ?auto_1494661 - SURFACE
      ?auto_1494662 - SURFACE
      ?auto_1494663 - SURFACE
      ?auto_1494664 - SURFACE
      ?auto_1494665 - SURFACE
      ?auto_1494666 - SURFACE
      ?auto_1494667 - SURFACE
      ?auto_1494668 - SURFACE
    )
    :vars
    (
      ?auto_1494671 - HOIST
      ?auto_1494669 - PLACE
      ?auto_1494670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494671 ?auto_1494669 ) ( SURFACE-AT ?auto_1494667 ?auto_1494669 ) ( CLEAR ?auto_1494667 ) ( IS-CRATE ?auto_1494668 ) ( not ( = ?auto_1494667 ?auto_1494668 ) ) ( TRUCK-AT ?auto_1494670 ?auto_1494669 ) ( AVAILABLE ?auto_1494671 ) ( IN ?auto_1494668 ?auto_1494670 ) ( ON ?auto_1494667 ?auto_1494666 ) ( not ( = ?auto_1494666 ?auto_1494667 ) ) ( not ( = ?auto_1494666 ?auto_1494668 ) ) ( ON ?auto_1494655 ?auto_1494654 ) ( ON ?auto_1494656 ?auto_1494655 ) ( ON ?auto_1494657 ?auto_1494656 ) ( ON ?auto_1494658 ?auto_1494657 ) ( ON ?auto_1494659 ?auto_1494658 ) ( ON ?auto_1494660 ?auto_1494659 ) ( ON ?auto_1494661 ?auto_1494660 ) ( ON ?auto_1494662 ?auto_1494661 ) ( ON ?auto_1494663 ?auto_1494662 ) ( ON ?auto_1494664 ?auto_1494663 ) ( ON ?auto_1494665 ?auto_1494664 ) ( ON ?auto_1494666 ?auto_1494665 ) ( not ( = ?auto_1494654 ?auto_1494655 ) ) ( not ( = ?auto_1494654 ?auto_1494656 ) ) ( not ( = ?auto_1494654 ?auto_1494657 ) ) ( not ( = ?auto_1494654 ?auto_1494658 ) ) ( not ( = ?auto_1494654 ?auto_1494659 ) ) ( not ( = ?auto_1494654 ?auto_1494660 ) ) ( not ( = ?auto_1494654 ?auto_1494661 ) ) ( not ( = ?auto_1494654 ?auto_1494662 ) ) ( not ( = ?auto_1494654 ?auto_1494663 ) ) ( not ( = ?auto_1494654 ?auto_1494664 ) ) ( not ( = ?auto_1494654 ?auto_1494665 ) ) ( not ( = ?auto_1494654 ?auto_1494666 ) ) ( not ( = ?auto_1494654 ?auto_1494667 ) ) ( not ( = ?auto_1494654 ?auto_1494668 ) ) ( not ( = ?auto_1494655 ?auto_1494656 ) ) ( not ( = ?auto_1494655 ?auto_1494657 ) ) ( not ( = ?auto_1494655 ?auto_1494658 ) ) ( not ( = ?auto_1494655 ?auto_1494659 ) ) ( not ( = ?auto_1494655 ?auto_1494660 ) ) ( not ( = ?auto_1494655 ?auto_1494661 ) ) ( not ( = ?auto_1494655 ?auto_1494662 ) ) ( not ( = ?auto_1494655 ?auto_1494663 ) ) ( not ( = ?auto_1494655 ?auto_1494664 ) ) ( not ( = ?auto_1494655 ?auto_1494665 ) ) ( not ( = ?auto_1494655 ?auto_1494666 ) ) ( not ( = ?auto_1494655 ?auto_1494667 ) ) ( not ( = ?auto_1494655 ?auto_1494668 ) ) ( not ( = ?auto_1494656 ?auto_1494657 ) ) ( not ( = ?auto_1494656 ?auto_1494658 ) ) ( not ( = ?auto_1494656 ?auto_1494659 ) ) ( not ( = ?auto_1494656 ?auto_1494660 ) ) ( not ( = ?auto_1494656 ?auto_1494661 ) ) ( not ( = ?auto_1494656 ?auto_1494662 ) ) ( not ( = ?auto_1494656 ?auto_1494663 ) ) ( not ( = ?auto_1494656 ?auto_1494664 ) ) ( not ( = ?auto_1494656 ?auto_1494665 ) ) ( not ( = ?auto_1494656 ?auto_1494666 ) ) ( not ( = ?auto_1494656 ?auto_1494667 ) ) ( not ( = ?auto_1494656 ?auto_1494668 ) ) ( not ( = ?auto_1494657 ?auto_1494658 ) ) ( not ( = ?auto_1494657 ?auto_1494659 ) ) ( not ( = ?auto_1494657 ?auto_1494660 ) ) ( not ( = ?auto_1494657 ?auto_1494661 ) ) ( not ( = ?auto_1494657 ?auto_1494662 ) ) ( not ( = ?auto_1494657 ?auto_1494663 ) ) ( not ( = ?auto_1494657 ?auto_1494664 ) ) ( not ( = ?auto_1494657 ?auto_1494665 ) ) ( not ( = ?auto_1494657 ?auto_1494666 ) ) ( not ( = ?auto_1494657 ?auto_1494667 ) ) ( not ( = ?auto_1494657 ?auto_1494668 ) ) ( not ( = ?auto_1494658 ?auto_1494659 ) ) ( not ( = ?auto_1494658 ?auto_1494660 ) ) ( not ( = ?auto_1494658 ?auto_1494661 ) ) ( not ( = ?auto_1494658 ?auto_1494662 ) ) ( not ( = ?auto_1494658 ?auto_1494663 ) ) ( not ( = ?auto_1494658 ?auto_1494664 ) ) ( not ( = ?auto_1494658 ?auto_1494665 ) ) ( not ( = ?auto_1494658 ?auto_1494666 ) ) ( not ( = ?auto_1494658 ?auto_1494667 ) ) ( not ( = ?auto_1494658 ?auto_1494668 ) ) ( not ( = ?auto_1494659 ?auto_1494660 ) ) ( not ( = ?auto_1494659 ?auto_1494661 ) ) ( not ( = ?auto_1494659 ?auto_1494662 ) ) ( not ( = ?auto_1494659 ?auto_1494663 ) ) ( not ( = ?auto_1494659 ?auto_1494664 ) ) ( not ( = ?auto_1494659 ?auto_1494665 ) ) ( not ( = ?auto_1494659 ?auto_1494666 ) ) ( not ( = ?auto_1494659 ?auto_1494667 ) ) ( not ( = ?auto_1494659 ?auto_1494668 ) ) ( not ( = ?auto_1494660 ?auto_1494661 ) ) ( not ( = ?auto_1494660 ?auto_1494662 ) ) ( not ( = ?auto_1494660 ?auto_1494663 ) ) ( not ( = ?auto_1494660 ?auto_1494664 ) ) ( not ( = ?auto_1494660 ?auto_1494665 ) ) ( not ( = ?auto_1494660 ?auto_1494666 ) ) ( not ( = ?auto_1494660 ?auto_1494667 ) ) ( not ( = ?auto_1494660 ?auto_1494668 ) ) ( not ( = ?auto_1494661 ?auto_1494662 ) ) ( not ( = ?auto_1494661 ?auto_1494663 ) ) ( not ( = ?auto_1494661 ?auto_1494664 ) ) ( not ( = ?auto_1494661 ?auto_1494665 ) ) ( not ( = ?auto_1494661 ?auto_1494666 ) ) ( not ( = ?auto_1494661 ?auto_1494667 ) ) ( not ( = ?auto_1494661 ?auto_1494668 ) ) ( not ( = ?auto_1494662 ?auto_1494663 ) ) ( not ( = ?auto_1494662 ?auto_1494664 ) ) ( not ( = ?auto_1494662 ?auto_1494665 ) ) ( not ( = ?auto_1494662 ?auto_1494666 ) ) ( not ( = ?auto_1494662 ?auto_1494667 ) ) ( not ( = ?auto_1494662 ?auto_1494668 ) ) ( not ( = ?auto_1494663 ?auto_1494664 ) ) ( not ( = ?auto_1494663 ?auto_1494665 ) ) ( not ( = ?auto_1494663 ?auto_1494666 ) ) ( not ( = ?auto_1494663 ?auto_1494667 ) ) ( not ( = ?auto_1494663 ?auto_1494668 ) ) ( not ( = ?auto_1494664 ?auto_1494665 ) ) ( not ( = ?auto_1494664 ?auto_1494666 ) ) ( not ( = ?auto_1494664 ?auto_1494667 ) ) ( not ( = ?auto_1494664 ?auto_1494668 ) ) ( not ( = ?auto_1494665 ?auto_1494666 ) ) ( not ( = ?auto_1494665 ?auto_1494667 ) ) ( not ( = ?auto_1494665 ?auto_1494668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494666 ?auto_1494667 ?auto_1494668 )
      ( MAKE-14CRATE-VERIFY ?auto_1494654 ?auto_1494655 ?auto_1494656 ?auto_1494657 ?auto_1494658 ?auto_1494659 ?auto_1494660 ?auto_1494661 ?auto_1494662 ?auto_1494663 ?auto_1494664 ?auto_1494665 ?auto_1494666 ?auto_1494667 ?auto_1494668 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494829 - SURFACE
      ?auto_1494830 - SURFACE
      ?auto_1494831 - SURFACE
      ?auto_1494832 - SURFACE
      ?auto_1494833 - SURFACE
      ?auto_1494834 - SURFACE
      ?auto_1494835 - SURFACE
      ?auto_1494836 - SURFACE
      ?auto_1494837 - SURFACE
      ?auto_1494838 - SURFACE
      ?auto_1494839 - SURFACE
      ?auto_1494840 - SURFACE
      ?auto_1494841 - SURFACE
      ?auto_1494842 - SURFACE
      ?auto_1494843 - SURFACE
    )
    :vars
    (
      ?auto_1494844 - HOIST
      ?auto_1494845 - PLACE
      ?auto_1494847 - TRUCK
      ?auto_1494846 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494844 ?auto_1494845 ) ( SURFACE-AT ?auto_1494842 ?auto_1494845 ) ( CLEAR ?auto_1494842 ) ( IS-CRATE ?auto_1494843 ) ( not ( = ?auto_1494842 ?auto_1494843 ) ) ( AVAILABLE ?auto_1494844 ) ( IN ?auto_1494843 ?auto_1494847 ) ( ON ?auto_1494842 ?auto_1494841 ) ( not ( = ?auto_1494841 ?auto_1494842 ) ) ( not ( = ?auto_1494841 ?auto_1494843 ) ) ( TRUCK-AT ?auto_1494847 ?auto_1494846 ) ( not ( = ?auto_1494846 ?auto_1494845 ) ) ( ON ?auto_1494830 ?auto_1494829 ) ( ON ?auto_1494831 ?auto_1494830 ) ( ON ?auto_1494832 ?auto_1494831 ) ( ON ?auto_1494833 ?auto_1494832 ) ( ON ?auto_1494834 ?auto_1494833 ) ( ON ?auto_1494835 ?auto_1494834 ) ( ON ?auto_1494836 ?auto_1494835 ) ( ON ?auto_1494837 ?auto_1494836 ) ( ON ?auto_1494838 ?auto_1494837 ) ( ON ?auto_1494839 ?auto_1494838 ) ( ON ?auto_1494840 ?auto_1494839 ) ( ON ?auto_1494841 ?auto_1494840 ) ( not ( = ?auto_1494829 ?auto_1494830 ) ) ( not ( = ?auto_1494829 ?auto_1494831 ) ) ( not ( = ?auto_1494829 ?auto_1494832 ) ) ( not ( = ?auto_1494829 ?auto_1494833 ) ) ( not ( = ?auto_1494829 ?auto_1494834 ) ) ( not ( = ?auto_1494829 ?auto_1494835 ) ) ( not ( = ?auto_1494829 ?auto_1494836 ) ) ( not ( = ?auto_1494829 ?auto_1494837 ) ) ( not ( = ?auto_1494829 ?auto_1494838 ) ) ( not ( = ?auto_1494829 ?auto_1494839 ) ) ( not ( = ?auto_1494829 ?auto_1494840 ) ) ( not ( = ?auto_1494829 ?auto_1494841 ) ) ( not ( = ?auto_1494829 ?auto_1494842 ) ) ( not ( = ?auto_1494829 ?auto_1494843 ) ) ( not ( = ?auto_1494830 ?auto_1494831 ) ) ( not ( = ?auto_1494830 ?auto_1494832 ) ) ( not ( = ?auto_1494830 ?auto_1494833 ) ) ( not ( = ?auto_1494830 ?auto_1494834 ) ) ( not ( = ?auto_1494830 ?auto_1494835 ) ) ( not ( = ?auto_1494830 ?auto_1494836 ) ) ( not ( = ?auto_1494830 ?auto_1494837 ) ) ( not ( = ?auto_1494830 ?auto_1494838 ) ) ( not ( = ?auto_1494830 ?auto_1494839 ) ) ( not ( = ?auto_1494830 ?auto_1494840 ) ) ( not ( = ?auto_1494830 ?auto_1494841 ) ) ( not ( = ?auto_1494830 ?auto_1494842 ) ) ( not ( = ?auto_1494830 ?auto_1494843 ) ) ( not ( = ?auto_1494831 ?auto_1494832 ) ) ( not ( = ?auto_1494831 ?auto_1494833 ) ) ( not ( = ?auto_1494831 ?auto_1494834 ) ) ( not ( = ?auto_1494831 ?auto_1494835 ) ) ( not ( = ?auto_1494831 ?auto_1494836 ) ) ( not ( = ?auto_1494831 ?auto_1494837 ) ) ( not ( = ?auto_1494831 ?auto_1494838 ) ) ( not ( = ?auto_1494831 ?auto_1494839 ) ) ( not ( = ?auto_1494831 ?auto_1494840 ) ) ( not ( = ?auto_1494831 ?auto_1494841 ) ) ( not ( = ?auto_1494831 ?auto_1494842 ) ) ( not ( = ?auto_1494831 ?auto_1494843 ) ) ( not ( = ?auto_1494832 ?auto_1494833 ) ) ( not ( = ?auto_1494832 ?auto_1494834 ) ) ( not ( = ?auto_1494832 ?auto_1494835 ) ) ( not ( = ?auto_1494832 ?auto_1494836 ) ) ( not ( = ?auto_1494832 ?auto_1494837 ) ) ( not ( = ?auto_1494832 ?auto_1494838 ) ) ( not ( = ?auto_1494832 ?auto_1494839 ) ) ( not ( = ?auto_1494832 ?auto_1494840 ) ) ( not ( = ?auto_1494832 ?auto_1494841 ) ) ( not ( = ?auto_1494832 ?auto_1494842 ) ) ( not ( = ?auto_1494832 ?auto_1494843 ) ) ( not ( = ?auto_1494833 ?auto_1494834 ) ) ( not ( = ?auto_1494833 ?auto_1494835 ) ) ( not ( = ?auto_1494833 ?auto_1494836 ) ) ( not ( = ?auto_1494833 ?auto_1494837 ) ) ( not ( = ?auto_1494833 ?auto_1494838 ) ) ( not ( = ?auto_1494833 ?auto_1494839 ) ) ( not ( = ?auto_1494833 ?auto_1494840 ) ) ( not ( = ?auto_1494833 ?auto_1494841 ) ) ( not ( = ?auto_1494833 ?auto_1494842 ) ) ( not ( = ?auto_1494833 ?auto_1494843 ) ) ( not ( = ?auto_1494834 ?auto_1494835 ) ) ( not ( = ?auto_1494834 ?auto_1494836 ) ) ( not ( = ?auto_1494834 ?auto_1494837 ) ) ( not ( = ?auto_1494834 ?auto_1494838 ) ) ( not ( = ?auto_1494834 ?auto_1494839 ) ) ( not ( = ?auto_1494834 ?auto_1494840 ) ) ( not ( = ?auto_1494834 ?auto_1494841 ) ) ( not ( = ?auto_1494834 ?auto_1494842 ) ) ( not ( = ?auto_1494834 ?auto_1494843 ) ) ( not ( = ?auto_1494835 ?auto_1494836 ) ) ( not ( = ?auto_1494835 ?auto_1494837 ) ) ( not ( = ?auto_1494835 ?auto_1494838 ) ) ( not ( = ?auto_1494835 ?auto_1494839 ) ) ( not ( = ?auto_1494835 ?auto_1494840 ) ) ( not ( = ?auto_1494835 ?auto_1494841 ) ) ( not ( = ?auto_1494835 ?auto_1494842 ) ) ( not ( = ?auto_1494835 ?auto_1494843 ) ) ( not ( = ?auto_1494836 ?auto_1494837 ) ) ( not ( = ?auto_1494836 ?auto_1494838 ) ) ( not ( = ?auto_1494836 ?auto_1494839 ) ) ( not ( = ?auto_1494836 ?auto_1494840 ) ) ( not ( = ?auto_1494836 ?auto_1494841 ) ) ( not ( = ?auto_1494836 ?auto_1494842 ) ) ( not ( = ?auto_1494836 ?auto_1494843 ) ) ( not ( = ?auto_1494837 ?auto_1494838 ) ) ( not ( = ?auto_1494837 ?auto_1494839 ) ) ( not ( = ?auto_1494837 ?auto_1494840 ) ) ( not ( = ?auto_1494837 ?auto_1494841 ) ) ( not ( = ?auto_1494837 ?auto_1494842 ) ) ( not ( = ?auto_1494837 ?auto_1494843 ) ) ( not ( = ?auto_1494838 ?auto_1494839 ) ) ( not ( = ?auto_1494838 ?auto_1494840 ) ) ( not ( = ?auto_1494838 ?auto_1494841 ) ) ( not ( = ?auto_1494838 ?auto_1494842 ) ) ( not ( = ?auto_1494838 ?auto_1494843 ) ) ( not ( = ?auto_1494839 ?auto_1494840 ) ) ( not ( = ?auto_1494839 ?auto_1494841 ) ) ( not ( = ?auto_1494839 ?auto_1494842 ) ) ( not ( = ?auto_1494839 ?auto_1494843 ) ) ( not ( = ?auto_1494840 ?auto_1494841 ) ) ( not ( = ?auto_1494840 ?auto_1494842 ) ) ( not ( = ?auto_1494840 ?auto_1494843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494841 ?auto_1494842 ?auto_1494843 )
      ( MAKE-14CRATE-VERIFY ?auto_1494829 ?auto_1494830 ?auto_1494831 ?auto_1494832 ?auto_1494833 ?auto_1494834 ?auto_1494835 ?auto_1494836 ?auto_1494837 ?auto_1494838 ?auto_1494839 ?auto_1494840 ?auto_1494841 ?auto_1494842 ?auto_1494843 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1495018 - SURFACE
      ?auto_1495019 - SURFACE
      ?auto_1495020 - SURFACE
      ?auto_1495021 - SURFACE
      ?auto_1495022 - SURFACE
      ?auto_1495023 - SURFACE
      ?auto_1495024 - SURFACE
      ?auto_1495025 - SURFACE
      ?auto_1495026 - SURFACE
      ?auto_1495027 - SURFACE
      ?auto_1495028 - SURFACE
      ?auto_1495029 - SURFACE
      ?auto_1495030 - SURFACE
      ?auto_1495031 - SURFACE
      ?auto_1495032 - SURFACE
    )
    :vars
    (
      ?auto_1495033 - HOIST
      ?auto_1495035 - PLACE
      ?auto_1495036 - TRUCK
      ?auto_1495034 - PLACE
      ?auto_1495037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495033 ?auto_1495035 ) ( SURFACE-AT ?auto_1495031 ?auto_1495035 ) ( CLEAR ?auto_1495031 ) ( IS-CRATE ?auto_1495032 ) ( not ( = ?auto_1495031 ?auto_1495032 ) ) ( AVAILABLE ?auto_1495033 ) ( ON ?auto_1495031 ?auto_1495030 ) ( not ( = ?auto_1495030 ?auto_1495031 ) ) ( not ( = ?auto_1495030 ?auto_1495032 ) ) ( TRUCK-AT ?auto_1495036 ?auto_1495034 ) ( not ( = ?auto_1495034 ?auto_1495035 ) ) ( HOIST-AT ?auto_1495037 ?auto_1495034 ) ( LIFTING ?auto_1495037 ?auto_1495032 ) ( not ( = ?auto_1495033 ?auto_1495037 ) ) ( ON ?auto_1495019 ?auto_1495018 ) ( ON ?auto_1495020 ?auto_1495019 ) ( ON ?auto_1495021 ?auto_1495020 ) ( ON ?auto_1495022 ?auto_1495021 ) ( ON ?auto_1495023 ?auto_1495022 ) ( ON ?auto_1495024 ?auto_1495023 ) ( ON ?auto_1495025 ?auto_1495024 ) ( ON ?auto_1495026 ?auto_1495025 ) ( ON ?auto_1495027 ?auto_1495026 ) ( ON ?auto_1495028 ?auto_1495027 ) ( ON ?auto_1495029 ?auto_1495028 ) ( ON ?auto_1495030 ?auto_1495029 ) ( not ( = ?auto_1495018 ?auto_1495019 ) ) ( not ( = ?auto_1495018 ?auto_1495020 ) ) ( not ( = ?auto_1495018 ?auto_1495021 ) ) ( not ( = ?auto_1495018 ?auto_1495022 ) ) ( not ( = ?auto_1495018 ?auto_1495023 ) ) ( not ( = ?auto_1495018 ?auto_1495024 ) ) ( not ( = ?auto_1495018 ?auto_1495025 ) ) ( not ( = ?auto_1495018 ?auto_1495026 ) ) ( not ( = ?auto_1495018 ?auto_1495027 ) ) ( not ( = ?auto_1495018 ?auto_1495028 ) ) ( not ( = ?auto_1495018 ?auto_1495029 ) ) ( not ( = ?auto_1495018 ?auto_1495030 ) ) ( not ( = ?auto_1495018 ?auto_1495031 ) ) ( not ( = ?auto_1495018 ?auto_1495032 ) ) ( not ( = ?auto_1495019 ?auto_1495020 ) ) ( not ( = ?auto_1495019 ?auto_1495021 ) ) ( not ( = ?auto_1495019 ?auto_1495022 ) ) ( not ( = ?auto_1495019 ?auto_1495023 ) ) ( not ( = ?auto_1495019 ?auto_1495024 ) ) ( not ( = ?auto_1495019 ?auto_1495025 ) ) ( not ( = ?auto_1495019 ?auto_1495026 ) ) ( not ( = ?auto_1495019 ?auto_1495027 ) ) ( not ( = ?auto_1495019 ?auto_1495028 ) ) ( not ( = ?auto_1495019 ?auto_1495029 ) ) ( not ( = ?auto_1495019 ?auto_1495030 ) ) ( not ( = ?auto_1495019 ?auto_1495031 ) ) ( not ( = ?auto_1495019 ?auto_1495032 ) ) ( not ( = ?auto_1495020 ?auto_1495021 ) ) ( not ( = ?auto_1495020 ?auto_1495022 ) ) ( not ( = ?auto_1495020 ?auto_1495023 ) ) ( not ( = ?auto_1495020 ?auto_1495024 ) ) ( not ( = ?auto_1495020 ?auto_1495025 ) ) ( not ( = ?auto_1495020 ?auto_1495026 ) ) ( not ( = ?auto_1495020 ?auto_1495027 ) ) ( not ( = ?auto_1495020 ?auto_1495028 ) ) ( not ( = ?auto_1495020 ?auto_1495029 ) ) ( not ( = ?auto_1495020 ?auto_1495030 ) ) ( not ( = ?auto_1495020 ?auto_1495031 ) ) ( not ( = ?auto_1495020 ?auto_1495032 ) ) ( not ( = ?auto_1495021 ?auto_1495022 ) ) ( not ( = ?auto_1495021 ?auto_1495023 ) ) ( not ( = ?auto_1495021 ?auto_1495024 ) ) ( not ( = ?auto_1495021 ?auto_1495025 ) ) ( not ( = ?auto_1495021 ?auto_1495026 ) ) ( not ( = ?auto_1495021 ?auto_1495027 ) ) ( not ( = ?auto_1495021 ?auto_1495028 ) ) ( not ( = ?auto_1495021 ?auto_1495029 ) ) ( not ( = ?auto_1495021 ?auto_1495030 ) ) ( not ( = ?auto_1495021 ?auto_1495031 ) ) ( not ( = ?auto_1495021 ?auto_1495032 ) ) ( not ( = ?auto_1495022 ?auto_1495023 ) ) ( not ( = ?auto_1495022 ?auto_1495024 ) ) ( not ( = ?auto_1495022 ?auto_1495025 ) ) ( not ( = ?auto_1495022 ?auto_1495026 ) ) ( not ( = ?auto_1495022 ?auto_1495027 ) ) ( not ( = ?auto_1495022 ?auto_1495028 ) ) ( not ( = ?auto_1495022 ?auto_1495029 ) ) ( not ( = ?auto_1495022 ?auto_1495030 ) ) ( not ( = ?auto_1495022 ?auto_1495031 ) ) ( not ( = ?auto_1495022 ?auto_1495032 ) ) ( not ( = ?auto_1495023 ?auto_1495024 ) ) ( not ( = ?auto_1495023 ?auto_1495025 ) ) ( not ( = ?auto_1495023 ?auto_1495026 ) ) ( not ( = ?auto_1495023 ?auto_1495027 ) ) ( not ( = ?auto_1495023 ?auto_1495028 ) ) ( not ( = ?auto_1495023 ?auto_1495029 ) ) ( not ( = ?auto_1495023 ?auto_1495030 ) ) ( not ( = ?auto_1495023 ?auto_1495031 ) ) ( not ( = ?auto_1495023 ?auto_1495032 ) ) ( not ( = ?auto_1495024 ?auto_1495025 ) ) ( not ( = ?auto_1495024 ?auto_1495026 ) ) ( not ( = ?auto_1495024 ?auto_1495027 ) ) ( not ( = ?auto_1495024 ?auto_1495028 ) ) ( not ( = ?auto_1495024 ?auto_1495029 ) ) ( not ( = ?auto_1495024 ?auto_1495030 ) ) ( not ( = ?auto_1495024 ?auto_1495031 ) ) ( not ( = ?auto_1495024 ?auto_1495032 ) ) ( not ( = ?auto_1495025 ?auto_1495026 ) ) ( not ( = ?auto_1495025 ?auto_1495027 ) ) ( not ( = ?auto_1495025 ?auto_1495028 ) ) ( not ( = ?auto_1495025 ?auto_1495029 ) ) ( not ( = ?auto_1495025 ?auto_1495030 ) ) ( not ( = ?auto_1495025 ?auto_1495031 ) ) ( not ( = ?auto_1495025 ?auto_1495032 ) ) ( not ( = ?auto_1495026 ?auto_1495027 ) ) ( not ( = ?auto_1495026 ?auto_1495028 ) ) ( not ( = ?auto_1495026 ?auto_1495029 ) ) ( not ( = ?auto_1495026 ?auto_1495030 ) ) ( not ( = ?auto_1495026 ?auto_1495031 ) ) ( not ( = ?auto_1495026 ?auto_1495032 ) ) ( not ( = ?auto_1495027 ?auto_1495028 ) ) ( not ( = ?auto_1495027 ?auto_1495029 ) ) ( not ( = ?auto_1495027 ?auto_1495030 ) ) ( not ( = ?auto_1495027 ?auto_1495031 ) ) ( not ( = ?auto_1495027 ?auto_1495032 ) ) ( not ( = ?auto_1495028 ?auto_1495029 ) ) ( not ( = ?auto_1495028 ?auto_1495030 ) ) ( not ( = ?auto_1495028 ?auto_1495031 ) ) ( not ( = ?auto_1495028 ?auto_1495032 ) ) ( not ( = ?auto_1495029 ?auto_1495030 ) ) ( not ( = ?auto_1495029 ?auto_1495031 ) ) ( not ( = ?auto_1495029 ?auto_1495032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495030 ?auto_1495031 ?auto_1495032 )
      ( MAKE-14CRATE-VERIFY ?auto_1495018 ?auto_1495019 ?auto_1495020 ?auto_1495021 ?auto_1495022 ?auto_1495023 ?auto_1495024 ?auto_1495025 ?auto_1495026 ?auto_1495027 ?auto_1495028 ?auto_1495029 ?auto_1495030 ?auto_1495031 ?auto_1495032 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1495221 - SURFACE
      ?auto_1495222 - SURFACE
      ?auto_1495223 - SURFACE
      ?auto_1495224 - SURFACE
      ?auto_1495225 - SURFACE
      ?auto_1495226 - SURFACE
      ?auto_1495227 - SURFACE
      ?auto_1495228 - SURFACE
      ?auto_1495229 - SURFACE
      ?auto_1495230 - SURFACE
      ?auto_1495231 - SURFACE
      ?auto_1495232 - SURFACE
      ?auto_1495233 - SURFACE
      ?auto_1495234 - SURFACE
      ?auto_1495235 - SURFACE
    )
    :vars
    (
      ?auto_1495240 - HOIST
      ?auto_1495239 - PLACE
      ?auto_1495237 - TRUCK
      ?auto_1495236 - PLACE
      ?auto_1495238 - HOIST
      ?auto_1495241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495240 ?auto_1495239 ) ( SURFACE-AT ?auto_1495234 ?auto_1495239 ) ( CLEAR ?auto_1495234 ) ( IS-CRATE ?auto_1495235 ) ( not ( = ?auto_1495234 ?auto_1495235 ) ) ( AVAILABLE ?auto_1495240 ) ( ON ?auto_1495234 ?auto_1495233 ) ( not ( = ?auto_1495233 ?auto_1495234 ) ) ( not ( = ?auto_1495233 ?auto_1495235 ) ) ( TRUCK-AT ?auto_1495237 ?auto_1495236 ) ( not ( = ?auto_1495236 ?auto_1495239 ) ) ( HOIST-AT ?auto_1495238 ?auto_1495236 ) ( not ( = ?auto_1495240 ?auto_1495238 ) ) ( AVAILABLE ?auto_1495238 ) ( SURFACE-AT ?auto_1495235 ?auto_1495236 ) ( ON ?auto_1495235 ?auto_1495241 ) ( CLEAR ?auto_1495235 ) ( not ( = ?auto_1495234 ?auto_1495241 ) ) ( not ( = ?auto_1495235 ?auto_1495241 ) ) ( not ( = ?auto_1495233 ?auto_1495241 ) ) ( ON ?auto_1495222 ?auto_1495221 ) ( ON ?auto_1495223 ?auto_1495222 ) ( ON ?auto_1495224 ?auto_1495223 ) ( ON ?auto_1495225 ?auto_1495224 ) ( ON ?auto_1495226 ?auto_1495225 ) ( ON ?auto_1495227 ?auto_1495226 ) ( ON ?auto_1495228 ?auto_1495227 ) ( ON ?auto_1495229 ?auto_1495228 ) ( ON ?auto_1495230 ?auto_1495229 ) ( ON ?auto_1495231 ?auto_1495230 ) ( ON ?auto_1495232 ?auto_1495231 ) ( ON ?auto_1495233 ?auto_1495232 ) ( not ( = ?auto_1495221 ?auto_1495222 ) ) ( not ( = ?auto_1495221 ?auto_1495223 ) ) ( not ( = ?auto_1495221 ?auto_1495224 ) ) ( not ( = ?auto_1495221 ?auto_1495225 ) ) ( not ( = ?auto_1495221 ?auto_1495226 ) ) ( not ( = ?auto_1495221 ?auto_1495227 ) ) ( not ( = ?auto_1495221 ?auto_1495228 ) ) ( not ( = ?auto_1495221 ?auto_1495229 ) ) ( not ( = ?auto_1495221 ?auto_1495230 ) ) ( not ( = ?auto_1495221 ?auto_1495231 ) ) ( not ( = ?auto_1495221 ?auto_1495232 ) ) ( not ( = ?auto_1495221 ?auto_1495233 ) ) ( not ( = ?auto_1495221 ?auto_1495234 ) ) ( not ( = ?auto_1495221 ?auto_1495235 ) ) ( not ( = ?auto_1495221 ?auto_1495241 ) ) ( not ( = ?auto_1495222 ?auto_1495223 ) ) ( not ( = ?auto_1495222 ?auto_1495224 ) ) ( not ( = ?auto_1495222 ?auto_1495225 ) ) ( not ( = ?auto_1495222 ?auto_1495226 ) ) ( not ( = ?auto_1495222 ?auto_1495227 ) ) ( not ( = ?auto_1495222 ?auto_1495228 ) ) ( not ( = ?auto_1495222 ?auto_1495229 ) ) ( not ( = ?auto_1495222 ?auto_1495230 ) ) ( not ( = ?auto_1495222 ?auto_1495231 ) ) ( not ( = ?auto_1495222 ?auto_1495232 ) ) ( not ( = ?auto_1495222 ?auto_1495233 ) ) ( not ( = ?auto_1495222 ?auto_1495234 ) ) ( not ( = ?auto_1495222 ?auto_1495235 ) ) ( not ( = ?auto_1495222 ?auto_1495241 ) ) ( not ( = ?auto_1495223 ?auto_1495224 ) ) ( not ( = ?auto_1495223 ?auto_1495225 ) ) ( not ( = ?auto_1495223 ?auto_1495226 ) ) ( not ( = ?auto_1495223 ?auto_1495227 ) ) ( not ( = ?auto_1495223 ?auto_1495228 ) ) ( not ( = ?auto_1495223 ?auto_1495229 ) ) ( not ( = ?auto_1495223 ?auto_1495230 ) ) ( not ( = ?auto_1495223 ?auto_1495231 ) ) ( not ( = ?auto_1495223 ?auto_1495232 ) ) ( not ( = ?auto_1495223 ?auto_1495233 ) ) ( not ( = ?auto_1495223 ?auto_1495234 ) ) ( not ( = ?auto_1495223 ?auto_1495235 ) ) ( not ( = ?auto_1495223 ?auto_1495241 ) ) ( not ( = ?auto_1495224 ?auto_1495225 ) ) ( not ( = ?auto_1495224 ?auto_1495226 ) ) ( not ( = ?auto_1495224 ?auto_1495227 ) ) ( not ( = ?auto_1495224 ?auto_1495228 ) ) ( not ( = ?auto_1495224 ?auto_1495229 ) ) ( not ( = ?auto_1495224 ?auto_1495230 ) ) ( not ( = ?auto_1495224 ?auto_1495231 ) ) ( not ( = ?auto_1495224 ?auto_1495232 ) ) ( not ( = ?auto_1495224 ?auto_1495233 ) ) ( not ( = ?auto_1495224 ?auto_1495234 ) ) ( not ( = ?auto_1495224 ?auto_1495235 ) ) ( not ( = ?auto_1495224 ?auto_1495241 ) ) ( not ( = ?auto_1495225 ?auto_1495226 ) ) ( not ( = ?auto_1495225 ?auto_1495227 ) ) ( not ( = ?auto_1495225 ?auto_1495228 ) ) ( not ( = ?auto_1495225 ?auto_1495229 ) ) ( not ( = ?auto_1495225 ?auto_1495230 ) ) ( not ( = ?auto_1495225 ?auto_1495231 ) ) ( not ( = ?auto_1495225 ?auto_1495232 ) ) ( not ( = ?auto_1495225 ?auto_1495233 ) ) ( not ( = ?auto_1495225 ?auto_1495234 ) ) ( not ( = ?auto_1495225 ?auto_1495235 ) ) ( not ( = ?auto_1495225 ?auto_1495241 ) ) ( not ( = ?auto_1495226 ?auto_1495227 ) ) ( not ( = ?auto_1495226 ?auto_1495228 ) ) ( not ( = ?auto_1495226 ?auto_1495229 ) ) ( not ( = ?auto_1495226 ?auto_1495230 ) ) ( not ( = ?auto_1495226 ?auto_1495231 ) ) ( not ( = ?auto_1495226 ?auto_1495232 ) ) ( not ( = ?auto_1495226 ?auto_1495233 ) ) ( not ( = ?auto_1495226 ?auto_1495234 ) ) ( not ( = ?auto_1495226 ?auto_1495235 ) ) ( not ( = ?auto_1495226 ?auto_1495241 ) ) ( not ( = ?auto_1495227 ?auto_1495228 ) ) ( not ( = ?auto_1495227 ?auto_1495229 ) ) ( not ( = ?auto_1495227 ?auto_1495230 ) ) ( not ( = ?auto_1495227 ?auto_1495231 ) ) ( not ( = ?auto_1495227 ?auto_1495232 ) ) ( not ( = ?auto_1495227 ?auto_1495233 ) ) ( not ( = ?auto_1495227 ?auto_1495234 ) ) ( not ( = ?auto_1495227 ?auto_1495235 ) ) ( not ( = ?auto_1495227 ?auto_1495241 ) ) ( not ( = ?auto_1495228 ?auto_1495229 ) ) ( not ( = ?auto_1495228 ?auto_1495230 ) ) ( not ( = ?auto_1495228 ?auto_1495231 ) ) ( not ( = ?auto_1495228 ?auto_1495232 ) ) ( not ( = ?auto_1495228 ?auto_1495233 ) ) ( not ( = ?auto_1495228 ?auto_1495234 ) ) ( not ( = ?auto_1495228 ?auto_1495235 ) ) ( not ( = ?auto_1495228 ?auto_1495241 ) ) ( not ( = ?auto_1495229 ?auto_1495230 ) ) ( not ( = ?auto_1495229 ?auto_1495231 ) ) ( not ( = ?auto_1495229 ?auto_1495232 ) ) ( not ( = ?auto_1495229 ?auto_1495233 ) ) ( not ( = ?auto_1495229 ?auto_1495234 ) ) ( not ( = ?auto_1495229 ?auto_1495235 ) ) ( not ( = ?auto_1495229 ?auto_1495241 ) ) ( not ( = ?auto_1495230 ?auto_1495231 ) ) ( not ( = ?auto_1495230 ?auto_1495232 ) ) ( not ( = ?auto_1495230 ?auto_1495233 ) ) ( not ( = ?auto_1495230 ?auto_1495234 ) ) ( not ( = ?auto_1495230 ?auto_1495235 ) ) ( not ( = ?auto_1495230 ?auto_1495241 ) ) ( not ( = ?auto_1495231 ?auto_1495232 ) ) ( not ( = ?auto_1495231 ?auto_1495233 ) ) ( not ( = ?auto_1495231 ?auto_1495234 ) ) ( not ( = ?auto_1495231 ?auto_1495235 ) ) ( not ( = ?auto_1495231 ?auto_1495241 ) ) ( not ( = ?auto_1495232 ?auto_1495233 ) ) ( not ( = ?auto_1495232 ?auto_1495234 ) ) ( not ( = ?auto_1495232 ?auto_1495235 ) ) ( not ( = ?auto_1495232 ?auto_1495241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495233 ?auto_1495234 ?auto_1495235 )
      ( MAKE-14CRATE-VERIFY ?auto_1495221 ?auto_1495222 ?auto_1495223 ?auto_1495224 ?auto_1495225 ?auto_1495226 ?auto_1495227 ?auto_1495228 ?auto_1495229 ?auto_1495230 ?auto_1495231 ?auto_1495232 ?auto_1495233 ?auto_1495234 ?auto_1495235 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1495425 - SURFACE
      ?auto_1495426 - SURFACE
      ?auto_1495427 - SURFACE
      ?auto_1495428 - SURFACE
      ?auto_1495429 - SURFACE
      ?auto_1495430 - SURFACE
      ?auto_1495431 - SURFACE
      ?auto_1495432 - SURFACE
      ?auto_1495433 - SURFACE
      ?auto_1495434 - SURFACE
      ?auto_1495435 - SURFACE
      ?auto_1495436 - SURFACE
      ?auto_1495437 - SURFACE
      ?auto_1495438 - SURFACE
      ?auto_1495439 - SURFACE
    )
    :vars
    (
      ?auto_1495445 - HOIST
      ?auto_1495444 - PLACE
      ?auto_1495441 - PLACE
      ?auto_1495443 - HOIST
      ?auto_1495442 - SURFACE
      ?auto_1495440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495445 ?auto_1495444 ) ( SURFACE-AT ?auto_1495438 ?auto_1495444 ) ( CLEAR ?auto_1495438 ) ( IS-CRATE ?auto_1495439 ) ( not ( = ?auto_1495438 ?auto_1495439 ) ) ( AVAILABLE ?auto_1495445 ) ( ON ?auto_1495438 ?auto_1495437 ) ( not ( = ?auto_1495437 ?auto_1495438 ) ) ( not ( = ?auto_1495437 ?auto_1495439 ) ) ( not ( = ?auto_1495441 ?auto_1495444 ) ) ( HOIST-AT ?auto_1495443 ?auto_1495441 ) ( not ( = ?auto_1495445 ?auto_1495443 ) ) ( AVAILABLE ?auto_1495443 ) ( SURFACE-AT ?auto_1495439 ?auto_1495441 ) ( ON ?auto_1495439 ?auto_1495442 ) ( CLEAR ?auto_1495439 ) ( not ( = ?auto_1495438 ?auto_1495442 ) ) ( not ( = ?auto_1495439 ?auto_1495442 ) ) ( not ( = ?auto_1495437 ?auto_1495442 ) ) ( TRUCK-AT ?auto_1495440 ?auto_1495444 ) ( ON ?auto_1495426 ?auto_1495425 ) ( ON ?auto_1495427 ?auto_1495426 ) ( ON ?auto_1495428 ?auto_1495427 ) ( ON ?auto_1495429 ?auto_1495428 ) ( ON ?auto_1495430 ?auto_1495429 ) ( ON ?auto_1495431 ?auto_1495430 ) ( ON ?auto_1495432 ?auto_1495431 ) ( ON ?auto_1495433 ?auto_1495432 ) ( ON ?auto_1495434 ?auto_1495433 ) ( ON ?auto_1495435 ?auto_1495434 ) ( ON ?auto_1495436 ?auto_1495435 ) ( ON ?auto_1495437 ?auto_1495436 ) ( not ( = ?auto_1495425 ?auto_1495426 ) ) ( not ( = ?auto_1495425 ?auto_1495427 ) ) ( not ( = ?auto_1495425 ?auto_1495428 ) ) ( not ( = ?auto_1495425 ?auto_1495429 ) ) ( not ( = ?auto_1495425 ?auto_1495430 ) ) ( not ( = ?auto_1495425 ?auto_1495431 ) ) ( not ( = ?auto_1495425 ?auto_1495432 ) ) ( not ( = ?auto_1495425 ?auto_1495433 ) ) ( not ( = ?auto_1495425 ?auto_1495434 ) ) ( not ( = ?auto_1495425 ?auto_1495435 ) ) ( not ( = ?auto_1495425 ?auto_1495436 ) ) ( not ( = ?auto_1495425 ?auto_1495437 ) ) ( not ( = ?auto_1495425 ?auto_1495438 ) ) ( not ( = ?auto_1495425 ?auto_1495439 ) ) ( not ( = ?auto_1495425 ?auto_1495442 ) ) ( not ( = ?auto_1495426 ?auto_1495427 ) ) ( not ( = ?auto_1495426 ?auto_1495428 ) ) ( not ( = ?auto_1495426 ?auto_1495429 ) ) ( not ( = ?auto_1495426 ?auto_1495430 ) ) ( not ( = ?auto_1495426 ?auto_1495431 ) ) ( not ( = ?auto_1495426 ?auto_1495432 ) ) ( not ( = ?auto_1495426 ?auto_1495433 ) ) ( not ( = ?auto_1495426 ?auto_1495434 ) ) ( not ( = ?auto_1495426 ?auto_1495435 ) ) ( not ( = ?auto_1495426 ?auto_1495436 ) ) ( not ( = ?auto_1495426 ?auto_1495437 ) ) ( not ( = ?auto_1495426 ?auto_1495438 ) ) ( not ( = ?auto_1495426 ?auto_1495439 ) ) ( not ( = ?auto_1495426 ?auto_1495442 ) ) ( not ( = ?auto_1495427 ?auto_1495428 ) ) ( not ( = ?auto_1495427 ?auto_1495429 ) ) ( not ( = ?auto_1495427 ?auto_1495430 ) ) ( not ( = ?auto_1495427 ?auto_1495431 ) ) ( not ( = ?auto_1495427 ?auto_1495432 ) ) ( not ( = ?auto_1495427 ?auto_1495433 ) ) ( not ( = ?auto_1495427 ?auto_1495434 ) ) ( not ( = ?auto_1495427 ?auto_1495435 ) ) ( not ( = ?auto_1495427 ?auto_1495436 ) ) ( not ( = ?auto_1495427 ?auto_1495437 ) ) ( not ( = ?auto_1495427 ?auto_1495438 ) ) ( not ( = ?auto_1495427 ?auto_1495439 ) ) ( not ( = ?auto_1495427 ?auto_1495442 ) ) ( not ( = ?auto_1495428 ?auto_1495429 ) ) ( not ( = ?auto_1495428 ?auto_1495430 ) ) ( not ( = ?auto_1495428 ?auto_1495431 ) ) ( not ( = ?auto_1495428 ?auto_1495432 ) ) ( not ( = ?auto_1495428 ?auto_1495433 ) ) ( not ( = ?auto_1495428 ?auto_1495434 ) ) ( not ( = ?auto_1495428 ?auto_1495435 ) ) ( not ( = ?auto_1495428 ?auto_1495436 ) ) ( not ( = ?auto_1495428 ?auto_1495437 ) ) ( not ( = ?auto_1495428 ?auto_1495438 ) ) ( not ( = ?auto_1495428 ?auto_1495439 ) ) ( not ( = ?auto_1495428 ?auto_1495442 ) ) ( not ( = ?auto_1495429 ?auto_1495430 ) ) ( not ( = ?auto_1495429 ?auto_1495431 ) ) ( not ( = ?auto_1495429 ?auto_1495432 ) ) ( not ( = ?auto_1495429 ?auto_1495433 ) ) ( not ( = ?auto_1495429 ?auto_1495434 ) ) ( not ( = ?auto_1495429 ?auto_1495435 ) ) ( not ( = ?auto_1495429 ?auto_1495436 ) ) ( not ( = ?auto_1495429 ?auto_1495437 ) ) ( not ( = ?auto_1495429 ?auto_1495438 ) ) ( not ( = ?auto_1495429 ?auto_1495439 ) ) ( not ( = ?auto_1495429 ?auto_1495442 ) ) ( not ( = ?auto_1495430 ?auto_1495431 ) ) ( not ( = ?auto_1495430 ?auto_1495432 ) ) ( not ( = ?auto_1495430 ?auto_1495433 ) ) ( not ( = ?auto_1495430 ?auto_1495434 ) ) ( not ( = ?auto_1495430 ?auto_1495435 ) ) ( not ( = ?auto_1495430 ?auto_1495436 ) ) ( not ( = ?auto_1495430 ?auto_1495437 ) ) ( not ( = ?auto_1495430 ?auto_1495438 ) ) ( not ( = ?auto_1495430 ?auto_1495439 ) ) ( not ( = ?auto_1495430 ?auto_1495442 ) ) ( not ( = ?auto_1495431 ?auto_1495432 ) ) ( not ( = ?auto_1495431 ?auto_1495433 ) ) ( not ( = ?auto_1495431 ?auto_1495434 ) ) ( not ( = ?auto_1495431 ?auto_1495435 ) ) ( not ( = ?auto_1495431 ?auto_1495436 ) ) ( not ( = ?auto_1495431 ?auto_1495437 ) ) ( not ( = ?auto_1495431 ?auto_1495438 ) ) ( not ( = ?auto_1495431 ?auto_1495439 ) ) ( not ( = ?auto_1495431 ?auto_1495442 ) ) ( not ( = ?auto_1495432 ?auto_1495433 ) ) ( not ( = ?auto_1495432 ?auto_1495434 ) ) ( not ( = ?auto_1495432 ?auto_1495435 ) ) ( not ( = ?auto_1495432 ?auto_1495436 ) ) ( not ( = ?auto_1495432 ?auto_1495437 ) ) ( not ( = ?auto_1495432 ?auto_1495438 ) ) ( not ( = ?auto_1495432 ?auto_1495439 ) ) ( not ( = ?auto_1495432 ?auto_1495442 ) ) ( not ( = ?auto_1495433 ?auto_1495434 ) ) ( not ( = ?auto_1495433 ?auto_1495435 ) ) ( not ( = ?auto_1495433 ?auto_1495436 ) ) ( not ( = ?auto_1495433 ?auto_1495437 ) ) ( not ( = ?auto_1495433 ?auto_1495438 ) ) ( not ( = ?auto_1495433 ?auto_1495439 ) ) ( not ( = ?auto_1495433 ?auto_1495442 ) ) ( not ( = ?auto_1495434 ?auto_1495435 ) ) ( not ( = ?auto_1495434 ?auto_1495436 ) ) ( not ( = ?auto_1495434 ?auto_1495437 ) ) ( not ( = ?auto_1495434 ?auto_1495438 ) ) ( not ( = ?auto_1495434 ?auto_1495439 ) ) ( not ( = ?auto_1495434 ?auto_1495442 ) ) ( not ( = ?auto_1495435 ?auto_1495436 ) ) ( not ( = ?auto_1495435 ?auto_1495437 ) ) ( not ( = ?auto_1495435 ?auto_1495438 ) ) ( not ( = ?auto_1495435 ?auto_1495439 ) ) ( not ( = ?auto_1495435 ?auto_1495442 ) ) ( not ( = ?auto_1495436 ?auto_1495437 ) ) ( not ( = ?auto_1495436 ?auto_1495438 ) ) ( not ( = ?auto_1495436 ?auto_1495439 ) ) ( not ( = ?auto_1495436 ?auto_1495442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495437 ?auto_1495438 ?auto_1495439 )
      ( MAKE-14CRATE-VERIFY ?auto_1495425 ?auto_1495426 ?auto_1495427 ?auto_1495428 ?auto_1495429 ?auto_1495430 ?auto_1495431 ?auto_1495432 ?auto_1495433 ?auto_1495434 ?auto_1495435 ?auto_1495436 ?auto_1495437 ?auto_1495438 ?auto_1495439 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1495629 - SURFACE
      ?auto_1495630 - SURFACE
      ?auto_1495631 - SURFACE
      ?auto_1495632 - SURFACE
      ?auto_1495633 - SURFACE
      ?auto_1495634 - SURFACE
      ?auto_1495635 - SURFACE
      ?auto_1495636 - SURFACE
      ?auto_1495637 - SURFACE
      ?auto_1495638 - SURFACE
      ?auto_1495639 - SURFACE
      ?auto_1495640 - SURFACE
      ?auto_1495641 - SURFACE
      ?auto_1495642 - SURFACE
      ?auto_1495643 - SURFACE
    )
    :vars
    (
      ?auto_1495649 - HOIST
      ?auto_1495644 - PLACE
      ?auto_1495647 - PLACE
      ?auto_1495648 - HOIST
      ?auto_1495645 - SURFACE
      ?auto_1495646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495649 ?auto_1495644 ) ( IS-CRATE ?auto_1495643 ) ( not ( = ?auto_1495642 ?auto_1495643 ) ) ( not ( = ?auto_1495641 ?auto_1495642 ) ) ( not ( = ?auto_1495641 ?auto_1495643 ) ) ( not ( = ?auto_1495647 ?auto_1495644 ) ) ( HOIST-AT ?auto_1495648 ?auto_1495647 ) ( not ( = ?auto_1495649 ?auto_1495648 ) ) ( AVAILABLE ?auto_1495648 ) ( SURFACE-AT ?auto_1495643 ?auto_1495647 ) ( ON ?auto_1495643 ?auto_1495645 ) ( CLEAR ?auto_1495643 ) ( not ( = ?auto_1495642 ?auto_1495645 ) ) ( not ( = ?auto_1495643 ?auto_1495645 ) ) ( not ( = ?auto_1495641 ?auto_1495645 ) ) ( TRUCK-AT ?auto_1495646 ?auto_1495644 ) ( SURFACE-AT ?auto_1495641 ?auto_1495644 ) ( CLEAR ?auto_1495641 ) ( LIFTING ?auto_1495649 ?auto_1495642 ) ( IS-CRATE ?auto_1495642 ) ( ON ?auto_1495630 ?auto_1495629 ) ( ON ?auto_1495631 ?auto_1495630 ) ( ON ?auto_1495632 ?auto_1495631 ) ( ON ?auto_1495633 ?auto_1495632 ) ( ON ?auto_1495634 ?auto_1495633 ) ( ON ?auto_1495635 ?auto_1495634 ) ( ON ?auto_1495636 ?auto_1495635 ) ( ON ?auto_1495637 ?auto_1495636 ) ( ON ?auto_1495638 ?auto_1495637 ) ( ON ?auto_1495639 ?auto_1495638 ) ( ON ?auto_1495640 ?auto_1495639 ) ( ON ?auto_1495641 ?auto_1495640 ) ( not ( = ?auto_1495629 ?auto_1495630 ) ) ( not ( = ?auto_1495629 ?auto_1495631 ) ) ( not ( = ?auto_1495629 ?auto_1495632 ) ) ( not ( = ?auto_1495629 ?auto_1495633 ) ) ( not ( = ?auto_1495629 ?auto_1495634 ) ) ( not ( = ?auto_1495629 ?auto_1495635 ) ) ( not ( = ?auto_1495629 ?auto_1495636 ) ) ( not ( = ?auto_1495629 ?auto_1495637 ) ) ( not ( = ?auto_1495629 ?auto_1495638 ) ) ( not ( = ?auto_1495629 ?auto_1495639 ) ) ( not ( = ?auto_1495629 ?auto_1495640 ) ) ( not ( = ?auto_1495629 ?auto_1495641 ) ) ( not ( = ?auto_1495629 ?auto_1495642 ) ) ( not ( = ?auto_1495629 ?auto_1495643 ) ) ( not ( = ?auto_1495629 ?auto_1495645 ) ) ( not ( = ?auto_1495630 ?auto_1495631 ) ) ( not ( = ?auto_1495630 ?auto_1495632 ) ) ( not ( = ?auto_1495630 ?auto_1495633 ) ) ( not ( = ?auto_1495630 ?auto_1495634 ) ) ( not ( = ?auto_1495630 ?auto_1495635 ) ) ( not ( = ?auto_1495630 ?auto_1495636 ) ) ( not ( = ?auto_1495630 ?auto_1495637 ) ) ( not ( = ?auto_1495630 ?auto_1495638 ) ) ( not ( = ?auto_1495630 ?auto_1495639 ) ) ( not ( = ?auto_1495630 ?auto_1495640 ) ) ( not ( = ?auto_1495630 ?auto_1495641 ) ) ( not ( = ?auto_1495630 ?auto_1495642 ) ) ( not ( = ?auto_1495630 ?auto_1495643 ) ) ( not ( = ?auto_1495630 ?auto_1495645 ) ) ( not ( = ?auto_1495631 ?auto_1495632 ) ) ( not ( = ?auto_1495631 ?auto_1495633 ) ) ( not ( = ?auto_1495631 ?auto_1495634 ) ) ( not ( = ?auto_1495631 ?auto_1495635 ) ) ( not ( = ?auto_1495631 ?auto_1495636 ) ) ( not ( = ?auto_1495631 ?auto_1495637 ) ) ( not ( = ?auto_1495631 ?auto_1495638 ) ) ( not ( = ?auto_1495631 ?auto_1495639 ) ) ( not ( = ?auto_1495631 ?auto_1495640 ) ) ( not ( = ?auto_1495631 ?auto_1495641 ) ) ( not ( = ?auto_1495631 ?auto_1495642 ) ) ( not ( = ?auto_1495631 ?auto_1495643 ) ) ( not ( = ?auto_1495631 ?auto_1495645 ) ) ( not ( = ?auto_1495632 ?auto_1495633 ) ) ( not ( = ?auto_1495632 ?auto_1495634 ) ) ( not ( = ?auto_1495632 ?auto_1495635 ) ) ( not ( = ?auto_1495632 ?auto_1495636 ) ) ( not ( = ?auto_1495632 ?auto_1495637 ) ) ( not ( = ?auto_1495632 ?auto_1495638 ) ) ( not ( = ?auto_1495632 ?auto_1495639 ) ) ( not ( = ?auto_1495632 ?auto_1495640 ) ) ( not ( = ?auto_1495632 ?auto_1495641 ) ) ( not ( = ?auto_1495632 ?auto_1495642 ) ) ( not ( = ?auto_1495632 ?auto_1495643 ) ) ( not ( = ?auto_1495632 ?auto_1495645 ) ) ( not ( = ?auto_1495633 ?auto_1495634 ) ) ( not ( = ?auto_1495633 ?auto_1495635 ) ) ( not ( = ?auto_1495633 ?auto_1495636 ) ) ( not ( = ?auto_1495633 ?auto_1495637 ) ) ( not ( = ?auto_1495633 ?auto_1495638 ) ) ( not ( = ?auto_1495633 ?auto_1495639 ) ) ( not ( = ?auto_1495633 ?auto_1495640 ) ) ( not ( = ?auto_1495633 ?auto_1495641 ) ) ( not ( = ?auto_1495633 ?auto_1495642 ) ) ( not ( = ?auto_1495633 ?auto_1495643 ) ) ( not ( = ?auto_1495633 ?auto_1495645 ) ) ( not ( = ?auto_1495634 ?auto_1495635 ) ) ( not ( = ?auto_1495634 ?auto_1495636 ) ) ( not ( = ?auto_1495634 ?auto_1495637 ) ) ( not ( = ?auto_1495634 ?auto_1495638 ) ) ( not ( = ?auto_1495634 ?auto_1495639 ) ) ( not ( = ?auto_1495634 ?auto_1495640 ) ) ( not ( = ?auto_1495634 ?auto_1495641 ) ) ( not ( = ?auto_1495634 ?auto_1495642 ) ) ( not ( = ?auto_1495634 ?auto_1495643 ) ) ( not ( = ?auto_1495634 ?auto_1495645 ) ) ( not ( = ?auto_1495635 ?auto_1495636 ) ) ( not ( = ?auto_1495635 ?auto_1495637 ) ) ( not ( = ?auto_1495635 ?auto_1495638 ) ) ( not ( = ?auto_1495635 ?auto_1495639 ) ) ( not ( = ?auto_1495635 ?auto_1495640 ) ) ( not ( = ?auto_1495635 ?auto_1495641 ) ) ( not ( = ?auto_1495635 ?auto_1495642 ) ) ( not ( = ?auto_1495635 ?auto_1495643 ) ) ( not ( = ?auto_1495635 ?auto_1495645 ) ) ( not ( = ?auto_1495636 ?auto_1495637 ) ) ( not ( = ?auto_1495636 ?auto_1495638 ) ) ( not ( = ?auto_1495636 ?auto_1495639 ) ) ( not ( = ?auto_1495636 ?auto_1495640 ) ) ( not ( = ?auto_1495636 ?auto_1495641 ) ) ( not ( = ?auto_1495636 ?auto_1495642 ) ) ( not ( = ?auto_1495636 ?auto_1495643 ) ) ( not ( = ?auto_1495636 ?auto_1495645 ) ) ( not ( = ?auto_1495637 ?auto_1495638 ) ) ( not ( = ?auto_1495637 ?auto_1495639 ) ) ( not ( = ?auto_1495637 ?auto_1495640 ) ) ( not ( = ?auto_1495637 ?auto_1495641 ) ) ( not ( = ?auto_1495637 ?auto_1495642 ) ) ( not ( = ?auto_1495637 ?auto_1495643 ) ) ( not ( = ?auto_1495637 ?auto_1495645 ) ) ( not ( = ?auto_1495638 ?auto_1495639 ) ) ( not ( = ?auto_1495638 ?auto_1495640 ) ) ( not ( = ?auto_1495638 ?auto_1495641 ) ) ( not ( = ?auto_1495638 ?auto_1495642 ) ) ( not ( = ?auto_1495638 ?auto_1495643 ) ) ( not ( = ?auto_1495638 ?auto_1495645 ) ) ( not ( = ?auto_1495639 ?auto_1495640 ) ) ( not ( = ?auto_1495639 ?auto_1495641 ) ) ( not ( = ?auto_1495639 ?auto_1495642 ) ) ( not ( = ?auto_1495639 ?auto_1495643 ) ) ( not ( = ?auto_1495639 ?auto_1495645 ) ) ( not ( = ?auto_1495640 ?auto_1495641 ) ) ( not ( = ?auto_1495640 ?auto_1495642 ) ) ( not ( = ?auto_1495640 ?auto_1495643 ) ) ( not ( = ?auto_1495640 ?auto_1495645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495641 ?auto_1495642 ?auto_1495643 )
      ( MAKE-14CRATE-VERIFY ?auto_1495629 ?auto_1495630 ?auto_1495631 ?auto_1495632 ?auto_1495633 ?auto_1495634 ?auto_1495635 ?auto_1495636 ?auto_1495637 ?auto_1495638 ?auto_1495639 ?auto_1495640 ?auto_1495641 ?auto_1495642 ?auto_1495643 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1495833 - SURFACE
      ?auto_1495834 - SURFACE
      ?auto_1495835 - SURFACE
      ?auto_1495836 - SURFACE
      ?auto_1495837 - SURFACE
      ?auto_1495838 - SURFACE
      ?auto_1495839 - SURFACE
      ?auto_1495840 - SURFACE
      ?auto_1495841 - SURFACE
      ?auto_1495842 - SURFACE
      ?auto_1495843 - SURFACE
      ?auto_1495844 - SURFACE
      ?auto_1495845 - SURFACE
      ?auto_1495846 - SURFACE
      ?auto_1495847 - SURFACE
    )
    :vars
    (
      ?auto_1495852 - HOIST
      ?auto_1495853 - PLACE
      ?auto_1495850 - PLACE
      ?auto_1495851 - HOIST
      ?auto_1495849 - SURFACE
      ?auto_1495848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495852 ?auto_1495853 ) ( IS-CRATE ?auto_1495847 ) ( not ( = ?auto_1495846 ?auto_1495847 ) ) ( not ( = ?auto_1495845 ?auto_1495846 ) ) ( not ( = ?auto_1495845 ?auto_1495847 ) ) ( not ( = ?auto_1495850 ?auto_1495853 ) ) ( HOIST-AT ?auto_1495851 ?auto_1495850 ) ( not ( = ?auto_1495852 ?auto_1495851 ) ) ( AVAILABLE ?auto_1495851 ) ( SURFACE-AT ?auto_1495847 ?auto_1495850 ) ( ON ?auto_1495847 ?auto_1495849 ) ( CLEAR ?auto_1495847 ) ( not ( = ?auto_1495846 ?auto_1495849 ) ) ( not ( = ?auto_1495847 ?auto_1495849 ) ) ( not ( = ?auto_1495845 ?auto_1495849 ) ) ( TRUCK-AT ?auto_1495848 ?auto_1495853 ) ( SURFACE-AT ?auto_1495845 ?auto_1495853 ) ( CLEAR ?auto_1495845 ) ( IS-CRATE ?auto_1495846 ) ( AVAILABLE ?auto_1495852 ) ( IN ?auto_1495846 ?auto_1495848 ) ( ON ?auto_1495834 ?auto_1495833 ) ( ON ?auto_1495835 ?auto_1495834 ) ( ON ?auto_1495836 ?auto_1495835 ) ( ON ?auto_1495837 ?auto_1495836 ) ( ON ?auto_1495838 ?auto_1495837 ) ( ON ?auto_1495839 ?auto_1495838 ) ( ON ?auto_1495840 ?auto_1495839 ) ( ON ?auto_1495841 ?auto_1495840 ) ( ON ?auto_1495842 ?auto_1495841 ) ( ON ?auto_1495843 ?auto_1495842 ) ( ON ?auto_1495844 ?auto_1495843 ) ( ON ?auto_1495845 ?auto_1495844 ) ( not ( = ?auto_1495833 ?auto_1495834 ) ) ( not ( = ?auto_1495833 ?auto_1495835 ) ) ( not ( = ?auto_1495833 ?auto_1495836 ) ) ( not ( = ?auto_1495833 ?auto_1495837 ) ) ( not ( = ?auto_1495833 ?auto_1495838 ) ) ( not ( = ?auto_1495833 ?auto_1495839 ) ) ( not ( = ?auto_1495833 ?auto_1495840 ) ) ( not ( = ?auto_1495833 ?auto_1495841 ) ) ( not ( = ?auto_1495833 ?auto_1495842 ) ) ( not ( = ?auto_1495833 ?auto_1495843 ) ) ( not ( = ?auto_1495833 ?auto_1495844 ) ) ( not ( = ?auto_1495833 ?auto_1495845 ) ) ( not ( = ?auto_1495833 ?auto_1495846 ) ) ( not ( = ?auto_1495833 ?auto_1495847 ) ) ( not ( = ?auto_1495833 ?auto_1495849 ) ) ( not ( = ?auto_1495834 ?auto_1495835 ) ) ( not ( = ?auto_1495834 ?auto_1495836 ) ) ( not ( = ?auto_1495834 ?auto_1495837 ) ) ( not ( = ?auto_1495834 ?auto_1495838 ) ) ( not ( = ?auto_1495834 ?auto_1495839 ) ) ( not ( = ?auto_1495834 ?auto_1495840 ) ) ( not ( = ?auto_1495834 ?auto_1495841 ) ) ( not ( = ?auto_1495834 ?auto_1495842 ) ) ( not ( = ?auto_1495834 ?auto_1495843 ) ) ( not ( = ?auto_1495834 ?auto_1495844 ) ) ( not ( = ?auto_1495834 ?auto_1495845 ) ) ( not ( = ?auto_1495834 ?auto_1495846 ) ) ( not ( = ?auto_1495834 ?auto_1495847 ) ) ( not ( = ?auto_1495834 ?auto_1495849 ) ) ( not ( = ?auto_1495835 ?auto_1495836 ) ) ( not ( = ?auto_1495835 ?auto_1495837 ) ) ( not ( = ?auto_1495835 ?auto_1495838 ) ) ( not ( = ?auto_1495835 ?auto_1495839 ) ) ( not ( = ?auto_1495835 ?auto_1495840 ) ) ( not ( = ?auto_1495835 ?auto_1495841 ) ) ( not ( = ?auto_1495835 ?auto_1495842 ) ) ( not ( = ?auto_1495835 ?auto_1495843 ) ) ( not ( = ?auto_1495835 ?auto_1495844 ) ) ( not ( = ?auto_1495835 ?auto_1495845 ) ) ( not ( = ?auto_1495835 ?auto_1495846 ) ) ( not ( = ?auto_1495835 ?auto_1495847 ) ) ( not ( = ?auto_1495835 ?auto_1495849 ) ) ( not ( = ?auto_1495836 ?auto_1495837 ) ) ( not ( = ?auto_1495836 ?auto_1495838 ) ) ( not ( = ?auto_1495836 ?auto_1495839 ) ) ( not ( = ?auto_1495836 ?auto_1495840 ) ) ( not ( = ?auto_1495836 ?auto_1495841 ) ) ( not ( = ?auto_1495836 ?auto_1495842 ) ) ( not ( = ?auto_1495836 ?auto_1495843 ) ) ( not ( = ?auto_1495836 ?auto_1495844 ) ) ( not ( = ?auto_1495836 ?auto_1495845 ) ) ( not ( = ?auto_1495836 ?auto_1495846 ) ) ( not ( = ?auto_1495836 ?auto_1495847 ) ) ( not ( = ?auto_1495836 ?auto_1495849 ) ) ( not ( = ?auto_1495837 ?auto_1495838 ) ) ( not ( = ?auto_1495837 ?auto_1495839 ) ) ( not ( = ?auto_1495837 ?auto_1495840 ) ) ( not ( = ?auto_1495837 ?auto_1495841 ) ) ( not ( = ?auto_1495837 ?auto_1495842 ) ) ( not ( = ?auto_1495837 ?auto_1495843 ) ) ( not ( = ?auto_1495837 ?auto_1495844 ) ) ( not ( = ?auto_1495837 ?auto_1495845 ) ) ( not ( = ?auto_1495837 ?auto_1495846 ) ) ( not ( = ?auto_1495837 ?auto_1495847 ) ) ( not ( = ?auto_1495837 ?auto_1495849 ) ) ( not ( = ?auto_1495838 ?auto_1495839 ) ) ( not ( = ?auto_1495838 ?auto_1495840 ) ) ( not ( = ?auto_1495838 ?auto_1495841 ) ) ( not ( = ?auto_1495838 ?auto_1495842 ) ) ( not ( = ?auto_1495838 ?auto_1495843 ) ) ( not ( = ?auto_1495838 ?auto_1495844 ) ) ( not ( = ?auto_1495838 ?auto_1495845 ) ) ( not ( = ?auto_1495838 ?auto_1495846 ) ) ( not ( = ?auto_1495838 ?auto_1495847 ) ) ( not ( = ?auto_1495838 ?auto_1495849 ) ) ( not ( = ?auto_1495839 ?auto_1495840 ) ) ( not ( = ?auto_1495839 ?auto_1495841 ) ) ( not ( = ?auto_1495839 ?auto_1495842 ) ) ( not ( = ?auto_1495839 ?auto_1495843 ) ) ( not ( = ?auto_1495839 ?auto_1495844 ) ) ( not ( = ?auto_1495839 ?auto_1495845 ) ) ( not ( = ?auto_1495839 ?auto_1495846 ) ) ( not ( = ?auto_1495839 ?auto_1495847 ) ) ( not ( = ?auto_1495839 ?auto_1495849 ) ) ( not ( = ?auto_1495840 ?auto_1495841 ) ) ( not ( = ?auto_1495840 ?auto_1495842 ) ) ( not ( = ?auto_1495840 ?auto_1495843 ) ) ( not ( = ?auto_1495840 ?auto_1495844 ) ) ( not ( = ?auto_1495840 ?auto_1495845 ) ) ( not ( = ?auto_1495840 ?auto_1495846 ) ) ( not ( = ?auto_1495840 ?auto_1495847 ) ) ( not ( = ?auto_1495840 ?auto_1495849 ) ) ( not ( = ?auto_1495841 ?auto_1495842 ) ) ( not ( = ?auto_1495841 ?auto_1495843 ) ) ( not ( = ?auto_1495841 ?auto_1495844 ) ) ( not ( = ?auto_1495841 ?auto_1495845 ) ) ( not ( = ?auto_1495841 ?auto_1495846 ) ) ( not ( = ?auto_1495841 ?auto_1495847 ) ) ( not ( = ?auto_1495841 ?auto_1495849 ) ) ( not ( = ?auto_1495842 ?auto_1495843 ) ) ( not ( = ?auto_1495842 ?auto_1495844 ) ) ( not ( = ?auto_1495842 ?auto_1495845 ) ) ( not ( = ?auto_1495842 ?auto_1495846 ) ) ( not ( = ?auto_1495842 ?auto_1495847 ) ) ( not ( = ?auto_1495842 ?auto_1495849 ) ) ( not ( = ?auto_1495843 ?auto_1495844 ) ) ( not ( = ?auto_1495843 ?auto_1495845 ) ) ( not ( = ?auto_1495843 ?auto_1495846 ) ) ( not ( = ?auto_1495843 ?auto_1495847 ) ) ( not ( = ?auto_1495843 ?auto_1495849 ) ) ( not ( = ?auto_1495844 ?auto_1495845 ) ) ( not ( = ?auto_1495844 ?auto_1495846 ) ) ( not ( = ?auto_1495844 ?auto_1495847 ) ) ( not ( = ?auto_1495844 ?auto_1495849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495845 ?auto_1495846 ?auto_1495847 )
      ( MAKE-14CRATE-VERIFY ?auto_1495833 ?auto_1495834 ?auto_1495835 ?auto_1495836 ?auto_1495837 ?auto_1495838 ?auto_1495839 ?auto_1495840 ?auto_1495841 ?auto_1495842 ?auto_1495843 ?auto_1495844 ?auto_1495845 ?auto_1495846 ?auto_1495847 ) )
  )

)

