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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693222 - SURFACE
      ?auto_693223 - SURFACE
    )
    :vars
    (
      ?auto_693224 - HOIST
      ?auto_693225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693224 ?auto_693225 ) ( SURFACE-AT ?auto_693222 ?auto_693225 ) ( CLEAR ?auto_693222 ) ( LIFTING ?auto_693224 ?auto_693223 ) ( IS-CRATE ?auto_693223 ) ( not ( = ?auto_693222 ?auto_693223 ) ) )
    :subtasks
    ( ( !DROP ?auto_693224 ?auto_693223 ?auto_693222 ?auto_693225 )
      ( MAKE-1CRATE-VERIFY ?auto_693222 ?auto_693223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693226 - SURFACE
      ?auto_693227 - SURFACE
    )
    :vars
    (
      ?auto_693229 - HOIST
      ?auto_693228 - PLACE
      ?auto_693230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693229 ?auto_693228 ) ( SURFACE-AT ?auto_693226 ?auto_693228 ) ( CLEAR ?auto_693226 ) ( IS-CRATE ?auto_693227 ) ( not ( = ?auto_693226 ?auto_693227 ) ) ( TRUCK-AT ?auto_693230 ?auto_693228 ) ( AVAILABLE ?auto_693229 ) ( IN ?auto_693227 ?auto_693230 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693229 ?auto_693227 ?auto_693230 ?auto_693228 )
      ( MAKE-1CRATE ?auto_693226 ?auto_693227 )
      ( MAKE-1CRATE-VERIFY ?auto_693226 ?auto_693227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693231 - SURFACE
      ?auto_693232 - SURFACE
    )
    :vars
    (
      ?auto_693234 - HOIST
      ?auto_693233 - PLACE
      ?auto_693235 - TRUCK
      ?auto_693236 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693234 ?auto_693233 ) ( SURFACE-AT ?auto_693231 ?auto_693233 ) ( CLEAR ?auto_693231 ) ( IS-CRATE ?auto_693232 ) ( not ( = ?auto_693231 ?auto_693232 ) ) ( AVAILABLE ?auto_693234 ) ( IN ?auto_693232 ?auto_693235 ) ( TRUCK-AT ?auto_693235 ?auto_693236 ) ( not ( = ?auto_693236 ?auto_693233 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693235 ?auto_693236 ?auto_693233 )
      ( MAKE-1CRATE ?auto_693231 ?auto_693232 )
      ( MAKE-1CRATE-VERIFY ?auto_693231 ?auto_693232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693237 - SURFACE
      ?auto_693238 - SURFACE
    )
    :vars
    (
      ?auto_693242 - HOIST
      ?auto_693241 - PLACE
      ?auto_693240 - TRUCK
      ?auto_693239 - PLACE
      ?auto_693243 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693242 ?auto_693241 ) ( SURFACE-AT ?auto_693237 ?auto_693241 ) ( CLEAR ?auto_693237 ) ( IS-CRATE ?auto_693238 ) ( not ( = ?auto_693237 ?auto_693238 ) ) ( AVAILABLE ?auto_693242 ) ( TRUCK-AT ?auto_693240 ?auto_693239 ) ( not ( = ?auto_693239 ?auto_693241 ) ) ( HOIST-AT ?auto_693243 ?auto_693239 ) ( LIFTING ?auto_693243 ?auto_693238 ) ( not ( = ?auto_693242 ?auto_693243 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693243 ?auto_693238 ?auto_693240 ?auto_693239 )
      ( MAKE-1CRATE ?auto_693237 ?auto_693238 )
      ( MAKE-1CRATE-VERIFY ?auto_693237 ?auto_693238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693244 - SURFACE
      ?auto_693245 - SURFACE
    )
    :vars
    (
      ?auto_693250 - HOIST
      ?auto_693249 - PLACE
      ?auto_693248 - TRUCK
      ?auto_693247 - PLACE
      ?auto_693246 - HOIST
      ?auto_693251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693250 ?auto_693249 ) ( SURFACE-AT ?auto_693244 ?auto_693249 ) ( CLEAR ?auto_693244 ) ( IS-CRATE ?auto_693245 ) ( not ( = ?auto_693244 ?auto_693245 ) ) ( AVAILABLE ?auto_693250 ) ( TRUCK-AT ?auto_693248 ?auto_693247 ) ( not ( = ?auto_693247 ?auto_693249 ) ) ( HOIST-AT ?auto_693246 ?auto_693247 ) ( not ( = ?auto_693250 ?auto_693246 ) ) ( AVAILABLE ?auto_693246 ) ( SURFACE-AT ?auto_693245 ?auto_693247 ) ( ON ?auto_693245 ?auto_693251 ) ( CLEAR ?auto_693245 ) ( not ( = ?auto_693244 ?auto_693251 ) ) ( not ( = ?auto_693245 ?auto_693251 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693246 ?auto_693245 ?auto_693251 ?auto_693247 )
      ( MAKE-1CRATE ?auto_693244 ?auto_693245 )
      ( MAKE-1CRATE-VERIFY ?auto_693244 ?auto_693245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693252 - SURFACE
      ?auto_693253 - SURFACE
    )
    :vars
    (
      ?auto_693257 - HOIST
      ?auto_693258 - PLACE
      ?auto_693254 - PLACE
      ?auto_693259 - HOIST
      ?auto_693256 - SURFACE
      ?auto_693255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693257 ?auto_693258 ) ( SURFACE-AT ?auto_693252 ?auto_693258 ) ( CLEAR ?auto_693252 ) ( IS-CRATE ?auto_693253 ) ( not ( = ?auto_693252 ?auto_693253 ) ) ( AVAILABLE ?auto_693257 ) ( not ( = ?auto_693254 ?auto_693258 ) ) ( HOIST-AT ?auto_693259 ?auto_693254 ) ( not ( = ?auto_693257 ?auto_693259 ) ) ( AVAILABLE ?auto_693259 ) ( SURFACE-AT ?auto_693253 ?auto_693254 ) ( ON ?auto_693253 ?auto_693256 ) ( CLEAR ?auto_693253 ) ( not ( = ?auto_693252 ?auto_693256 ) ) ( not ( = ?auto_693253 ?auto_693256 ) ) ( TRUCK-AT ?auto_693255 ?auto_693258 ) )
    :subtasks
    ( ( !DRIVE ?auto_693255 ?auto_693258 ?auto_693254 )
      ( MAKE-1CRATE ?auto_693252 ?auto_693253 )
      ( MAKE-1CRATE-VERIFY ?auto_693252 ?auto_693253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693269 - SURFACE
      ?auto_693270 - SURFACE
      ?auto_693271 - SURFACE
    )
    :vars
    (
      ?auto_693272 - HOIST
      ?auto_693273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693272 ?auto_693273 ) ( SURFACE-AT ?auto_693270 ?auto_693273 ) ( CLEAR ?auto_693270 ) ( LIFTING ?auto_693272 ?auto_693271 ) ( IS-CRATE ?auto_693271 ) ( not ( = ?auto_693270 ?auto_693271 ) ) ( ON ?auto_693270 ?auto_693269 ) ( not ( = ?auto_693269 ?auto_693270 ) ) ( not ( = ?auto_693269 ?auto_693271 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693270 ?auto_693271 )
      ( MAKE-2CRATE-VERIFY ?auto_693269 ?auto_693270 ?auto_693271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693279 - SURFACE
      ?auto_693280 - SURFACE
      ?auto_693281 - SURFACE
    )
    :vars
    (
      ?auto_693282 - HOIST
      ?auto_693283 - PLACE
      ?auto_693284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693282 ?auto_693283 ) ( SURFACE-AT ?auto_693280 ?auto_693283 ) ( CLEAR ?auto_693280 ) ( IS-CRATE ?auto_693281 ) ( not ( = ?auto_693280 ?auto_693281 ) ) ( TRUCK-AT ?auto_693284 ?auto_693283 ) ( AVAILABLE ?auto_693282 ) ( IN ?auto_693281 ?auto_693284 ) ( ON ?auto_693280 ?auto_693279 ) ( not ( = ?auto_693279 ?auto_693280 ) ) ( not ( = ?auto_693279 ?auto_693281 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693280 ?auto_693281 )
      ( MAKE-2CRATE-VERIFY ?auto_693279 ?auto_693280 ?auto_693281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693285 - SURFACE
      ?auto_693286 - SURFACE
    )
    :vars
    (
      ?auto_693288 - HOIST
      ?auto_693290 - PLACE
      ?auto_693287 - TRUCK
      ?auto_693289 - SURFACE
      ?auto_693291 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693288 ?auto_693290 ) ( SURFACE-AT ?auto_693285 ?auto_693290 ) ( CLEAR ?auto_693285 ) ( IS-CRATE ?auto_693286 ) ( not ( = ?auto_693285 ?auto_693286 ) ) ( AVAILABLE ?auto_693288 ) ( IN ?auto_693286 ?auto_693287 ) ( ON ?auto_693285 ?auto_693289 ) ( not ( = ?auto_693289 ?auto_693285 ) ) ( not ( = ?auto_693289 ?auto_693286 ) ) ( TRUCK-AT ?auto_693287 ?auto_693291 ) ( not ( = ?auto_693291 ?auto_693290 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693287 ?auto_693291 ?auto_693290 )
      ( MAKE-2CRATE ?auto_693289 ?auto_693285 ?auto_693286 )
      ( MAKE-1CRATE-VERIFY ?auto_693285 ?auto_693286 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693292 - SURFACE
      ?auto_693293 - SURFACE
      ?auto_693294 - SURFACE
    )
    :vars
    (
      ?auto_693295 - HOIST
      ?auto_693297 - PLACE
      ?auto_693298 - TRUCK
      ?auto_693296 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693295 ?auto_693297 ) ( SURFACE-AT ?auto_693293 ?auto_693297 ) ( CLEAR ?auto_693293 ) ( IS-CRATE ?auto_693294 ) ( not ( = ?auto_693293 ?auto_693294 ) ) ( AVAILABLE ?auto_693295 ) ( IN ?auto_693294 ?auto_693298 ) ( ON ?auto_693293 ?auto_693292 ) ( not ( = ?auto_693292 ?auto_693293 ) ) ( not ( = ?auto_693292 ?auto_693294 ) ) ( TRUCK-AT ?auto_693298 ?auto_693296 ) ( not ( = ?auto_693296 ?auto_693297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693293 ?auto_693294 )
      ( MAKE-2CRATE-VERIFY ?auto_693292 ?auto_693293 ?auto_693294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693299 - SURFACE
      ?auto_693300 - SURFACE
    )
    :vars
    (
      ?auto_693305 - HOIST
      ?auto_693301 - PLACE
      ?auto_693303 - SURFACE
      ?auto_693302 - TRUCK
      ?auto_693304 - PLACE
      ?auto_693306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693305 ?auto_693301 ) ( SURFACE-AT ?auto_693299 ?auto_693301 ) ( CLEAR ?auto_693299 ) ( IS-CRATE ?auto_693300 ) ( not ( = ?auto_693299 ?auto_693300 ) ) ( AVAILABLE ?auto_693305 ) ( ON ?auto_693299 ?auto_693303 ) ( not ( = ?auto_693303 ?auto_693299 ) ) ( not ( = ?auto_693303 ?auto_693300 ) ) ( TRUCK-AT ?auto_693302 ?auto_693304 ) ( not ( = ?auto_693304 ?auto_693301 ) ) ( HOIST-AT ?auto_693306 ?auto_693304 ) ( LIFTING ?auto_693306 ?auto_693300 ) ( not ( = ?auto_693305 ?auto_693306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693306 ?auto_693300 ?auto_693302 ?auto_693304 )
      ( MAKE-2CRATE ?auto_693303 ?auto_693299 ?auto_693300 )
      ( MAKE-1CRATE-VERIFY ?auto_693299 ?auto_693300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693307 - SURFACE
      ?auto_693308 - SURFACE
      ?auto_693309 - SURFACE
    )
    :vars
    (
      ?auto_693311 - HOIST
      ?auto_693313 - PLACE
      ?auto_693312 - TRUCK
      ?auto_693310 - PLACE
      ?auto_693314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693311 ?auto_693313 ) ( SURFACE-AT ?auto_693308 ?auto_693313 ) ( CLEAR ?auto_693308 ) ( IS-CRATE ?auto_693309 ) ( not ( = ?auto_693308 ?auto_693309 ) ) ( AVAILABLE ?auto_693311 ) ( ON ?auto_693308 ?auto_693307 ) ( not ( = ?auto_693307 ?auto_693308 ) ) ( not ( = ?auto_693307 ?auto_693309 ) ) ( TRUCK-AT ?auto_693312 ?auto_693310 ) ( not ( = ?auto_693310 ?auto_693313 ) ) ( HOIST-AT ?auto_693314 ?auto_693310 ) ( LIFTING ?auto_693314 ?auto_693309 ) ( not ( = ?auto_693311 ?auto_693314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693308 ?auto_693309 )
      ( MAKE-2CRATE-VERIFY ?auto_693307 ?auto_693308 ?auto_693309 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693315 - SURFACE
      ?auto_693316 - SURFACE
    )
    :vars
    (
      ?auto_693317 - HOIST
      ?auto_693322 - PLACE
      ?auto_693318 - SURFACE
      ?auto_693319 - TRUCK
      ?auto_693320 - PLACE
      ?auto_693321 - HOIST
      ?auto_693323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693317 ?auto_693322 ) ( SURFACE-AT ?auto_693315 ?auto_693322 ) ( CLEAR ?auto_693315 ) ( IS-CRATE ?auto_693316 ) ( not ( = ?auto_693315 ?auto_693316 ) ) ( AVAILABLE ?auto_693317 ) ( ON ?auto_693315 ?auto_693318 ) ( not ( = ?auto_693318 ?auto_693315 ) ) ( not ( = ?auto_693318 ?auto_693316 ) ) ( TRUCK-AT ?auto_693319 ?auto_693320 ) ( not ( = ?auto_693320 ?auto_693322 ) ) ( HOIST-AT ?auto_693321 ?auto_693320 ) ( not ( = ?auto_693317 ?auto_693321 ) ) ( AVAILABLE ?auto_693321 ) ( SURFACE-AT ?auto_693316 ?auto_693320 ) ( ON ?auto_693316 ?auto_693323 ) ( CLEAR ?auto_693316 ) ( not ( = ?auto_693315 ?auto_693323 ) ) ( not ( = ?auto_693316 ?auto_693323 ) ) ( not ( = ?auto_693318 ?auto_693323 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693321 ?auto_693316 ?auto_693323 ?auto_693320 )
      ( MAKE-2CRATE ?auto_693318 ?auto_693315 ?auto_693316 )
      ( MAKE-1CRATE-VERIFY ?auto_693315 ?auto_693316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693324 - SURFACE
      ?auto_693325 - SURFACE
      ?auto_693326 - SURFACE
    )
    :vars
    (
      ?auto_693332 - HOIST
      ?auto_693330 - PLACE
      ?auto_693329 - TRUCK
      ?auto_693331 - PLACE
      ?auto_693328 - HOIST
      ?auto_693327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693332 ?auto_693330 ) ( SURFACE-AT ?auto_693325 ?auto_693330 ) ( CLEAR ?auto_693325 ) ( IS-CRATE ?auto_693326 ) ( not ( = ?auto_693325 ?auto_693326 ) ) ( AVAILABLE ?auto_693332 ) ( ON ?auto_693325 ?auto_693324 ) ( not ( = ?auto_693324 ?auto_693325 ) ) ( not ( = ?auto_693324 ?auto_693326 ) ) ( TRUCK-AT ?auto_693329 ?auto_693331 ) ( not ( = ?auto_693331 ?auto_693330 ) ) ( HOIST-AT ?auto_693328 ?auto_693331 ) ( not ( = ?auto_693332 ?auto_693328 ) ) ( AVAILABLE ?auto_693328 ) ( SURFACE-AT ?auto_693326 ?auto_693331 ) ( ON ?auto_693326 ?auto_693327 ) ( CLEAR ?auto_693326 ) ( not ( = ?auto_693325 ?auto_693327 ) ) ( not ( = ?auto_693326 ?auto_693327 ) ) ( not ( = ?auto_693324 ?auto_693327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693325 ?auto_693326 )
      ( MAKE-2CRATE-VERIFY ?auto_693324 ?auto_693325 ?auto_693326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693333 - SURFACE
      ?auto_693334 - SURFACE
    )
    :vars
    (
      ?auto_693335 - HOIST
      ?auto_693338 - PLACE
      ?auto_693341 - SURFACE
      ?auto_693339 - PLACE
      ?auto_693340 - HOIST
      ?auto_693337 - SURFACE
      ?auto_693336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693335 ?auto_693338 ) ( SURFACE-AT ?auto_693333 ?auto_693338 ) ( CLEAR ?auto_693333 ) ( IS-CRATE ?auto_693334 ) ( not ( = ?auto_693333 ?auto_693334 ) ) ( AVAILABLE ?auto_693335 ) ( ON ?auto_693333 ?auto_693341 ) ( not ( = ?auto_693341 ?auto_693333 ) ) ( not ( = ?auto_693341 ?auto_693334 ) ) ( not ( = ?auto_693339 ?auto_693338 ) ) ( HOIST-AT ?auto_693340 ?auto_693339 ) ( not ( = ?auto_693335 ?auto_693340 ) ) ( AVAILABLE ?auto_693340 ) ( SURFACE-AT ?auto_693334 ?auto_693339 ) ( ON ?auto_693334 ?auto_693337 ) ( CLEAR ?auto_693334 ) ( not ( = ?auto_693333 ?auto_693337 ) ) ( not ( = ?auto_693334 ?auto_693337 ) ) ( not ( = ?auto_693341 ?auto_693337 ) ) ( TRUCK-AT ?auto_693336 ?auto_693338 ) )
    :subtasks
    ( ( !DRIVE ?auto_693336 ?auto_693338 ?auto_693339 )
      ( MAKE-2CRATE ?auto_693341 ?auto_693333 ?auto_693334 )
      ( MAKE-1CRATE-VERIFY ?auto_693333 ?auto_693334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693342 - SURFACE
      ?auto_693343 - SURFACE
      ?auto_693344 - SURFACE
    )
    :vars
    (
      ?auto_693350 - HOIST
      ?auto_693346 - PLACE
      ?auto_693349 - PLACE
      ?auto_693348 - HOIST
      ?auto_693347 - SURFACE
      ?auto_693345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693350 ?auto_693346 ) ( SURFACE-AT ?auto_693343 ?auto_693346 ) ( CLEAR ?auto_693343 ) ( IS-CRATE ?auto_693344 ) ( not ( = ?auto_693343 ?auto_693344 ) ) ( AVAILABLE ?auto_693350 ) ( ON ?auto_693343 ?auto_693342 ) ( not ( = ?auto_693342 ?auto_693343 ) ) ( not ( = ?auto_693342 ?auto_693344 ) ) ( not ( = ?auto_693349 ?auto_693346 ) ) ( HOIST-AT ?auto_693348 ?auto_693349 ) ( not ( = ?auto_693350 ?auto_693348 ) ) ( AVAILABLE ?auto_693348 ) ( SURFACE-AT ?auto_693344 ?auto_693349 ) ( ON ?auto_693344 ?auto_693347 ) ( CLEAR ?auto_693344 ) ( not ( = ?auto_693343 ?auto_693347 ) ) ( not ( = ?auto_693344 ?auto_693347 ) ) ( not ( = ?auto_693342 ?auto_693347 ) ) ( TRUCK-AT ?auto_693345 ?auto_693346 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693343 ?auto_693344 )
      ( MAKE-2CRATE-VERIFY ?auto_693342 ?auto_693343 ?auto_693344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693351 - SURFACE
      ?auto_693352 - SURFACE
    )
    :vars
    (
      ?auto_693353 - HOIST
      ?auto_693354 - PLACE
      ?auto_693358 - SURFACE
      ?auto_693359 - PLACE
      ?auto_693356 - HOIST
      ?auto_693355 - SURFACE
      ?auto_693357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693353 ?auto_693354 ) ( IS-CRATE ?auto_693352 ) ( not ( = ?auto_693351 ?auto_693352 ) ) ( not ( = ?auto_693358 ?auto_693351 ) ) ( not ( = ?auto_693358 ?auto_693352 ) ) ( not ( = ?auto_693359 ?auto_693354 ) ) ( HOIST-AT ?auto_693356 ?auto_693359 ) ( not ( = ?auto_693353 ?auto_693356 ) ) ( AVAILABLE ?auto_693356 ) ( SURFACE-AT ?auto_693352 ?auto_693359 ) ( ON ?auto_693352 ?auto_693355 ) ( CLEAR ?auto_693352 ) ( not ( = ?auto_693351 ?auto_693355 ) ) ( not ( = ?auto_693352 ?auto_693355 ) ) ( not ( = ?auto_693358 ?auto_693355 ) ) ( TRUCK-AT ?auto_693357 ?auto_693354 ) ( SURFACE-AT ?auto_693358 ?auto_693354 ) ( CLEAR ?auto_693358 ) ( LIFTING ?auto_693353 ?auto_693351 ) ( IS-CRATE ?auto_693351 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693358 ?auto_693351 )
      ( MAKE-2CRATE ?auto_693358 ?auto_693351 ?auto_693352 )
      ( MAKE-1CRATE-VERIFY ?auto_693351 ?auto_693352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693360 - SURFACE
      ?auto_693361 - SURFACE
      ?auto_693362 - SURFACE
    )
    :vars
    (
      ?auto_693366 - HOIST
      ?auto_693367 - PLACE
      ?auto_693368 - PLACE
      ?auto_693364 - HOIST
      ?auto_693363 - SURFACE
      ?auto_693365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693366 ?auto_693367 ) ( IS-CRATE ?auto_693362 ) ( not ( = ?auto_693361 ?auto_693362 ) ) ( not ( = ?auto_693360 ?auto_693361 ) ) ( not ( = ?auto_693360 ?auto_693362 ) ) ( not ( = ?auto_693368 ?auto_693367 ) ) ( HOIST-AT ?auto_693364 ?auto_693368 ) ( not ( = ?auto_693366 ?auto_693364 ) ) ( AVAILABLE ?auto_693364 ) ( SURFACE-AT ?auto_693362 ?auto_693368 ) ( ON ?auto_693362 ?auto_693363 ) ( CLEAR ?auto_693362 ) ( not ( = ?auto_693361 ?auto_693363 ) ) ( not ( = ?auto_693362 ?auto_693363 ) ) ( not ( = ?auto_693360 ?auto_693363 ) ) ( TRUCK-AT ?auto_693365 ?auto_693367 ) ( SURFACE-AT ?auto_693360 ?auto_693367 ) ( CLEAR ?auto_693360 ) ( LIFTING ?auto_693366 ?auto_693361 ) ( IS-CRATE ?auto_693361 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693361 ?auto_693362 )
      ( MAKE-2CRATE-VERIFY ?auto_693360 ?auto_693361 ?auto_693362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693369 - SURFACE
      ?auto_693370 - SURFACE
    )
    :vars
    (
      ?auto_693375 - HOIST
      ?auto_693373 - PLACE
      ?auto_693377 - SURFACE
      ?auto_693376 - PLACE
      ?auto_693374 - HOIST
      ?auto_693372 - SURFACE
      ?auto_693371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693375 ?auto_693373 ) ( IS-CRATE ?auto_693370 ) ( not ( = ?auto_693369 ?auto_693370 ) ) ( not ( = ?auto_693377 ?auto_693369 ) ) ( not ( = ?auto_693377 ?auto_693370 ) ) ( not ( = ?auto_693376 ?auto_693373 ) ) ( HOIST-AT ?auto_693374 ?auto_693376 ) ( not ( = ?auto_693375 ?auto_693374 ) ) ( AVAILABLE ?auto_693374 ) ( SURFACE-AT ?auto_693370 ?auto_693376 ) ( ON ?auto_693370 ?auto_693372 ) ( CLEAR ?auto_693370 ) ( not ( = ?auto_693369 ?auto_693372 ) ) ( not ( = ?auto_693370 ?auto_693372 ) ) ( not ( = ?auto_693377 ?auto_693372 ) ) ( TRUCK-AT ?auto_693371 ?auto_693373 ) ( SURFACE-AT ?auto_693377 ?auto_693373 ) ( CLEAR ?auto_693377 ) ( IS-CRATE ?auto_693369 ) ( AVAILABLE ?auto_693375 ) ( IN ?auto_693369 ?auto_693371 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693375 ?auto_693369 ?auto_693371 ?auto_693373 )
      ( MAKE-2CRATE ?auto_693377 ?auto_693369 ?auto_693370 )
      ( MAKE-1CRATE-VERIFY ?auto_693369 ?auto_693370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693378 - SURFACE
      ?auto_693379 - SURFACE
      ?auto_693380 - SURFACE
    )
    :vars
    (
      ?auto_693382 - HOIST
      ?auto_693381 - PLACE
      ?auto_693383 - PLACE
      ?auto_693384 - HOIST
      ?auto_693386 - SURFACE
      ?auto_693385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693382 ?auto_693381 ) ( IS-CRATE ?auto_693380 ) ( not ( = ?auto_693379 ?auto_693380 ) ) ( not ( = ?auto_693378 ?auto_693379 ) ) ( not ( = ?auto_693378 ?auto_693380 ) ) ( not ( = ?auto_693383 ?auto_693381 ) ) ( HOIST-AT ?auto_693384 ?auto_693383 ) ( not ( = ?auto_693382 ?auto_693384 ) ) ( AVAILABLE ?auto_693384 ) ( SURFACE-AT ?auto_693380 ?auto_693383 ) ( ON ?auto_693380 ?auto_693386 ) ( CLEAR ?auto_693380 ) ( not ( = ?auto_693379 ?auto_693386 ) ) ( not ( = ?auto_693380 ?auto_693386 ) ) ( not ( = ?auto_693378 ?auto_693386 ) ) ( TRUCK-AT ?auto_693385 ?auto_693381 ) ( SURFACE-AT ?auto_693378 ?auto_693381 ) ( CLEAR ?auto_693378 ) ( IS-CRATE ?auto_693379 ) ( AVAILABLE ?auto_693382 ) ( IN ?auto_693379 ?auto_693385 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693379 ?auto_693380 )
      ( MAKE-2CRATE-VERIFY ?auto_693378 ?auto_693379 ?auto_693380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693423 - SURFACE
      ?auto_693424 - SURFACE
    )
    :vars
    (
      ?auto_693428 - HOIST
      ?auto_693426 - PLACE
      ?auto_693431 - SURFACE
      ?auto_693429 - PLACE
      ?auto_693430 - HOIST
      ?auto_693425 - SURFACE
      ?auto_693427 - TRUCK
      ?auto_693432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693428 ?auto_693426 ) ( SURFACE-AT ?auto_693423 ?auto_693426 ) ( CLEAR ?auto_693423 ) ( IS-CRATE ?auto_693424 ) ( not ( = ?auto_693423 ?auto_693424 ) ) ( AVAILABLE ?auto_693428 ) ( ON ?auto_693423 ?auto_693431 ) ( not ( = ?auto_693431 ?auto_693423 ) ) ( not ( = ?auto_693431 ?auto_693424 ) ) ( not ( = ?auto_693429 ?auto_693426 ) ) ( HOIST-AT ?auto_693430 ?auto_693429 ) ( not ( = ?auto_693428 ?auto_693430 ) ) ( AVAILABLE ?auto_693430 ) ( SURFACE-AT ?auto_693424 ?auto_693429 ) ( ON ?auto_693424 ?auto_693425 ) ( CLEAR ?auto_693424 ) ( not ( = ?auto_693423 ?auto_693425 ) ) ( not ( = ?auto_693424 ?auto_693425 ) ) ( not ( = ?auto_693431 ?auto_693425 ) ) ( TRUCK-AT ?auto_693427 ?auto_693432 ) ( not ( = ?auto_693432 ?auto_693426 ) ) ( not ( = ?auto_693429 ?auto_693432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693427 ?auto_693432 ?auto_693426 )
      ( MAKE-1CRATE ?auto_693423 ?auto_693424 )
      ( MAKE-1CRATE-VERIFY ?auto_693423 ?auto_693424 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693462 - SURFACE
      ?auto_693463 - SURFACE
      ?auto_693464 - SURFACE
      ?auto_693465 - SURFACE
    )
    :vars
    (
      ?auto_693466 - HOIST
      ?auto_693467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693466 ?auto_693467 ) ( SURFACE-AT ?auto_693464 ?auto_693467 ) ( CLEAR ?auto_693464 ) ( LIFTING ?auto_693466 ?auto_693465 ) ( IS-CRATE ?auto_693465 ) ( not ( = ?auto_693464 ?auto_693465 ) ) ( ON ?auto_693463 ?auto_693462 ) ( ON ?auto_693464 ?auto_693463 ) ( not ( = ?auto_693462 ?auto_693463 ) ) ( not ( = ?auto_693462 ?auto_693464 ) ) ( not ( = ?auto_693462 ?auto_693465 ) ) ( not ( = ?auto_693463 ?auto_693464 ) ) ( not ( = ?auto_693463 ?auto_693465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693464 ?auto_693465 )
      ( MAKE-3CRATE-VERIFY ?auto_693462 ?auto_693463 ?auto_693464 ?auto_693465 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693479 - SURFACE
      ?auto_693480 - SURFACE
      ?auto_693481 - SURFACE
      ?auto_693482 - SURFACE
    )
    :vars
    (
      ?auto_693483 - HOIST
      ?auto_693485 - PLACE
      ?auto_693484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693483 ?auto_693485 ) ( SURFACE-AT ?auto_693481 ?auto_693485 ) ( CLEAR ?auto_693481 ) ( IS-CRATE ?auto_693482 ) ( not ( = ?auto_693481 ?auto_693482 ) ) ( TRUCK-AT ?auto_693484 ?auto_693485 ) ( AVAILABLE ?auto_693483 ) ( IN ?auto_693482 ?auto_693484 ) ( ON ?auto_693481 ?auto_693480 ) ( not ( = ?auto_693480 ?auto_693481 ) ) ( not ( = ?auto_693480 ?auto_693482 ) ) ( ON ?auto_693480 ?auto_693479 ) ( not ( = ?auto_693479 ?auto_693480 ) ) ( not ( = ?auto_693479 ?auto_693481 ) ) ( not ( = ?auto_693479 ?auto_693482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693480 ?auto_693481 ?auto_693482 )
      ( MAKE-3CRATE-VERIFY ?auto_693479 ?auto_693480 ?auto_693481 ?auto_693482 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693500 - SURFACE
      ?auto_693501 - SURFACE
      ?auto_693502 - SURFACE
      ?auto_693503 - SURFACE
    )
    :vars
    (
      ?auto_693506 - HOIST
      ?auto_693507 - PLACE
      ?auto_693505 - TRUCK
      ?auto_693504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693506 ?auto_693507 ) ( SURFACE-AT ?auto_693502 ?auto_693507 ) ( CLEAR ?auto_693502 ) ( IS-CRATE ?auto_693503 ) ( not ( = ?auto_693502 ?auto_693503 ) ) ( AVAILABLE ?auto_693506 ) ( IN ?auto_693503 ?auto_693505 ) ( ON ?auto_693502 ?auto_693501 ) ( not ( = ?auto_693501 ?auto_693502 ) ) ( not ( = ?auto_693501 ?auto_693503 ) ) ( TRUCK-AT ?auto_693505 ?auto_693504 ) ( not ( = ?auto_693504 ?auto_693507 ) ) ( ON ?auto_693501 ?auto_693500 ) ( not ( = ?auto_693500 ?auto_693501 ) ) ( not ( = ?auto_693500 ?auto_693502 ) ) ( not ( = ?auto_693500 ?auto_693503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693501 ?auto_693502 ?auto_693503 )
      ( MAKE-3CRATE-VERIFY ?auto_693500 ?auto_693501 ?auto_693502 ?auto_693503 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693524 - SURFACE
      ?auto_693525 - SURFACE
      ?auto_693526 - SURFACE
      ?auto_693527 - SURFACE
    )
    :vars
    (
      ?auto_693532 - HOIST
      ?auto_693528 - PLACE
      ?auto_693531 - TRUCK
      ?auto_693530 - PLACE
      ?auto_693529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693532 ?auto_693528 ) ( SURFACE-AT ?auto_693526 ?auto_693528 ) ( CLEAR ?auto_693526 ) ( IS-CRATE ?auto_693527 ) ( not ( = ?auto_693526 ?auto_693527 ) ) ( AVAILABLE ?auto_693532 ) ( ON ?auto_693526 ?auto_693525 ) ( not ( = ?auto_693525 ?auto_693526 ) ) ( not ( = ?auto_693525 ?auto_693527 ) ) ( TRUCK-AT ?auto_693531 ?auto_693530 ) ( not ( = ?auto_693530 ?auto_693528 ) ) ( HOIST-AT ?auto_693529 ?auto_693530 ) ( LIFTING ?auto_693529 ?auto_693527 ) ( not ( = ?auto_693532 ?auto_693529 ) ) ( ON ?auto_693525 ?auto_693524 ) ( not ( = ?auto_693524 ?auto_693525 ) ) ( not ( = ?auto_693524 ?auto_693526 ) ) ( not ( = ?auto_693524 ?auto_693527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693525 ?auto_693526 ?auto_693527 )
      ( MAKE-3CRATE-VERIFY ?auto_693524 ?auto_693525 ?auto_693526 ?auto_693527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693551 - SURFACE
      ?auto_693552 - SURFACE
      ?auto_693553 - SURFACE
      ?auto_693554 - SURFACE
    )
    :vars
    (
      ?auto_693557 - HOIST
      ?auto_693560 - PLACE
      ?auto_693555 - TRUCK
      ?auto_693559 - PLACE
      ?auto_693558 - HOIST
      ?auto_693556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693557 ?auto_693560 ) ( SURFACE-AT ?auto_693553 ?auto_693560 ) ( CLEAR ?auto_693553 ) ( IS-CRATE ?auto_693554 ) ( not ( = ?auto_693553 ?auto_693554 ) ) ( AVAILABLE ?auto_693557 ) ( ON ?auto_693553 ?auto_693552 ) ( not ( = ?auto_693552 ?auto_693553 ) ) ( not ( = ?auto_693552 ?auto_693554 ) ) ( TRUCK-AT ?auto_693555 ?auto_693559 ) ( not ( = ?auto_693559 ?auto_693560 ) ) ( HOIST-AT ?auto_693558 ?auto_693559 ) ( not ( = ?auto_693557 ?auto_693558 ) ) ( AVAILABLE ?auto_693558 ) ( SURFACE-AT ?auto_693554 ?auto_693559 ) ( ON ?auto_693554 ?auto_693556 ) ( CLEAR ?auto_693554 ) ( not ( = ?auto_693553 ?auto_693556 ) ) ( not ( = ?auto_693554 ?auto_693556 ) ) ( not ( = ?auto_693552 ?auto_693556 ) ) ( ON ?auto_693552 ?auto_693551 ) ( not ( = ?auto_693551 ?auto_693552 ) ) ( not ( = ?auto_693551 ?auto_693553 ) ) ( not ( = ?auto_693551 ?auto_693554 ) ) ( not ( = ?auto_693551 ?auto_693556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693552 ?auto_693553 ?auto_693554 )
      ( MAKE-3CRATE-VERIFY ?auto_693551 ?auto_693552 ?auto_693553 ?auto_693554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693579 - SURFACE
      ?auto_693580 - SURFACE
      ?auto_693581 - SURFACE
      ?auto_693582 - SURFACE
    )
    :vars
    (
      ?auto_693588 - HOIST
      ?auto_693583 - PLACE
      ?auto_693584 - PLACE
      ?auto_693586 - HOIST
      ?auto_693585 - SURFACE
      ?auto_693587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693588 ?auto_693583 ) ( SURFACE-AT ?auto_693581 ?auto_693583 ) ( CLEAR ?auto_693581 ) ( IS-CRATE ?auto_693582 ) ( not ( = ?auto_693581 ?auto_693582 ) ) ( AVAILABLE ?auto_693588 ) ( ON ?auto_693581 ?auto_693580 ) ( not ( = ?auto_693580 ?auto_693581 ) ) ( not ( = ?auto_693580 ?auto_693582 ) ) ( not ( = ?auto_693584 ?auto_693583 ) ) ( HOIST-AT ?auto_693586 ?auto_693584 ) ( not ( = ?auto_693588 ?auto_693586 ) ) ( AVAILABLE ?auto_693586 ) ( SURFACE-AT ?auto_693582 ?auto_693584 ) ( ON ?auto_693582 ?auto_693585 ) ( CLEAR ?auto_693582 ) ( not ( = ?auto_693581 ?auto_693585 ) ) ( not ( = ?auto_693582 ?auto_693585 ) ) ( not ( = ?auto_693580 ?auto_693585 ) ) ( TRUCK-AT ?auto_693587 ?auto_693583 ) ( ON ?auto_693580 ?auto_693579 ) ( not ( = ?auto_693579 ?auto_693580 ) ) ( not ( = ?auto_693579 ?auto_693581 ) ) ( not ( = ?auto_693579 ?auto_693582 ) ) ( not ( = ?auto_693579 ?auto_693585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693580 ?auto_693581 ?auto_693582 )
      ( MAKE-3CRATE-VERIFY ?auto_693579 ?auto_693580 ?auto_693581 ?auto_693582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693607 - SURFACE
      ?auto_693608 - SURFACE
      ?auto_693609 - SURFACE
      ?auto_693610 - SURFACE
    )
    :vars
    (
      ?auto_693614 - HOIST
      ?auto_693612 - PLACE
      ?auto_693616 - PLACE
      ?auto_693615 - HOIST
      ?auto_693611 - SURFACE
      ?auto_693613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693614 ?auto_693612 ) ( IS-CRATE ?auto_693610 ) ( not ( = ?auto_693609 ?auto_693610 ) ) ( not ( = ?auto_693608 ?auto_693609 ) ) ( not ( = ?auto_693608 ?auto_693610 ) ) ( not ( = ?auto_693616 ?auto_693612 ) ) ( HOIST-AT ?auto_693615 ?auto_693616 ) ( not ( = ?auto_693614 ?auto_693615 ) ) ( AVAILABLE ?auto_693615 ) ( SURFACE-AT ?auto_693610 ?auto_693616 ) ( ON ?auto_693610 ?auto_693611 ) ( CLEAR ?auto_693610 ) ( not ( = ?auto_693609 ?auto_693611 ) ) ( not ( = ?auto_693610 ?auto_693611 ) ) ( not ( = ?auto_693608 ?auto_693611 ) ) ( TRUCK-AT ?auto_693613 ?auto_693612 ) ( SURFACE-AT ?auto_693608 ?auto_693612 ) ( CLEAR ?auto_693608 ) ( LIFTING ?auto_693614 ?auto_693609 ) ( IS-CRATE ?auto_693609 ) ( ON ?auto_693608 ?auto_693607 ) ( not ( = ?auto_693607 ?auto_693608 ) ) ( not ( = ?auto_693607 ?auto_693609 ) ) ( not ( = ?auto_693607 ?auto_693610 ) ) ( not ( = ?auto_693607 ?auto_693611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693608 ?auto_693609 ?auto_693610 )
      ( MAKE-3CRATE-VERIFY ?auto_693607 ?auto_693608 ?auto_693609 ?auto_693610 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693635 - SURFACE
      ?auto_693636 - SURFACE
      ?auto_693637 - SURFACE
      ?auto_693638 - SURFACE
    )
    :vars
    (
      ?auto_693639 - HOIST
      ?auto_693643 - PLACE
      ?auto_693641 - PLACE
      ?auto_693640 - HOIST
      ?auto_693642 - SURFACE
      ?auto_693644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693639 ?auto_693643 ) ( IS-CRATE ?auto_693638 ) ( not ( = ?auto_693637 ?auto_693638 ) ) ( not ( = ?auto_693636 ?auto_693637 ) ) ( not ( = ?auto_693636 ?auto_693638 ) ) ( not ( = ?auto_693641 ?auto_693643 ) ) ( HOIST-AT ?auto_693640 ?auto_693641 ) ( not ( = ?auto_693639 ?auto_693640 ) ) ( AVAILABLE ?auto_693640 ) ( SURFACE-AT ?auto_693638 ?auto_693641 ) ( ON ?auto_693638 ?auto_693642 ) ( CLEAR ?auto_693638 ) ( not ( = ?auto_693637 ?auto_693642 ) ) ( not ( = ?auto_693638 ?auto_693642 ) ) ( not ( = ?auto_693636 ?auto_693642 ) ) ( TRUCK-AT ?auto_693644 ?auto_693643 ) ( SURFACE-AT ?auto_693636 ?auto_693643 ) ( CLEAR ?auto_693636 ) ( IS-CRATE ?auto_693637 ) ( AVAILABLE ?auto_693639 ) ( IN ?auto_693637 ?auto_693644 ) ( ON ?auto_693636 ?auto_693635 ) ( not ( = ?auto_693635 ?auto_693636 ) ) ( not ( = ?auto_693635 ?auto_693637 ) ) ( not ( = ?auto_693635 ?auto_693638 ) ) ( not ( = ?auto_693635 ?auto_693642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693636 ?auto_693637 ?auto_693638 )
      ( MAKE-3CRATE-VERIFY ?auto_693635 ?auto_693636 ?auto_693637 ?auto_693638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693820 - SURFACE
      ?auto_693821 - SURFACE
    )
    :vars
    (
      ?auto_693825 - HOIST
      ?auto_693824 - PLACE
      ?auto_693827 - SURFACE
      ?auto_693823 - TRUCK
      ?auto_693822 - PLACE
      ?auto_693826 - HOIST
      ?auto_693828 - SURFACE
      ?auto_693829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693825 ?auto_693824 ) ( SURFACE-AT ?auto_693820 ?auto_693824 ) ( CLEAR ?auto_693820 ) ( IS-CRATE ?auto_693821 ) ( not ( = ?auto_693820 ?auto_693821 ) ) ( AVAILABLE ?auto_693825 ) ( ON ?auto_693820 ?auto_693827 ) ( not ( = ?auto_693827 ?auto_693820 ) ) ( not ( = ?auto_693827 ?auto_693821 ) ) ( TRUCK-AT ?auto_693823 ?auto_693822 ) ( not ( = ?auto_693822 ?auto_693824 ) ) ( HOIST-AT ?auto_693826 ?auto_693822 ) ( not ( = ?auto_693825 ?auto_693826 ) ) ( SURFACE-AT ?auto_693821 ?auto_693822 ) ( ON ?auto_693821 ?auto_693828 ) ( CLEAR ?auto_693821 ) ( not ( = ?auto_693820 ?auto_693828 ) ) ( not ( = ?auto_693821 ?auto_693828 ) ) ( not ( = ?auto_693827 ?auto_693828 ) ) ( LIFTING ?auto_693826 ?auto_693829 ) ( IS-CRATE ?auto_693829 ) ( not ( = ?auto_693820 ?auto_693829 ) ) ( not ( = ?auto_693821 ?auto_693829 ) ) ( not ( = ?auto_693827 ?auto_693829 ) ) ( not ( = ?auto_693828 ?auto_693829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693826 ?auto_693829 ?auto_693823 ?auto_693822 )
      ( MAKE-1CRATE ?auto_693820 ?auto_693821 )
      ( MAKE-1CRATE-VERIFY ?auto_693820 ?auto_693821 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_693928 - SURFACE
      ?auto_693929 - SURFACE
      ?auto_693930 - SURFACE
      ?auto_693932 - SURFACE
      ?auto_693931 - SURFACE
    )
    :vars
    (
      ?auto_693934 - HOIST
      ?auto_693933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693934 ?auto_693933 ) ( SURFACE-AT ?auto_693932 ?auto_693933 ) ( CLEAR ?auto_693932 ) ( LIFTING ?auto_693934 ?auto_693931 ) ( IS-CRATE ?auto_693931 ) ( not ( = ?auto_693932 ?auto_693931 ) ) ( ON ?auto_693929 ?auto_693928 ) ( ON ?auto_693930 ?auto_693929 ) ( ON ?auto_693932 ?auto_693930 ) ( not ( = ?auto_693928 ?auto_693929 ) ) ( not ( = ?auto_693928 ?auto_693930 ) ) ( not ( = ?auto_693928 ?auto_693932 ) ) ( not ( = ?auto_693928 ?auto_693931 ) ) ( not ( = ?auto_693929 ?auto_693930 ) ) ( not ( = ?auto_693929 ?auto_693932 ) ) ( not ( = ?auto_693929 ?auto_693931 ) ) ( not ( = ?auto_693930 ?auto_693932 ) ) ( not ( = ?auto_693930 ?auto_693931 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693932 ?auto_693931 )
      ( MAKE-4CRATE-VERIFY ?auto_693928 ?auto_693929 ?auto_693930 ?auto_693932 ?auto_693931 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_693953 - SURFACE
      ?auto_693954 - SURFACE
      ?auto_693955 - SURFACE
      ?auto_693957 - SURFACE
      ?auto_693956 - SURFACE
    )
    :vars
    (
      ?auto_693958 - HOIST
      ?auto_693960 - PLACE
      ?auto_693959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693958 ?auto_693960 ) ( SURFACE-AT ?auto_693957 ?auto_693960 ) ( CLEAR ?auto_693957 ) ( IS-CRATE ?auto_693956 ) ( not ( = ?auto_693957 ?auto_693956 ) ) ( TRUCK-AT ?auto_693959 ?auto_693960 ) ( AVAILABLE ?auto_693958 ) ( IN ?auto_693956 ?auto_693959 ) ( ON ?auto_693957 ?auto_693955 ) ( not ( = ?auto_693955 ?auto_693957 ) ) ( not ( = ?auto_693955 ?auto_693956 ) ) ( ON ?auto_693954 ?auto_693953 ) ( ON ?auto_693955 ?auto_693954 ) ( not ( = ?auto_693953 ?auto_693954 ) ) ( not ( = ?auto_693953 ?auto_693955 ) ) ( not ( = ?auto_693953 ?auto_693957 ) ) ( not ( = ?auto_693953 ?auto_693956 ) ) ( not ( = ?auto_693954 ?auto_693955 ) ) ( not ( = ?auto_693954 ?auto_693957 ) ) ( not ( = ?auto_693954 ?auto_693956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693955 ?auto_693957 ?auto_693956 )
      ( MAKE-4CRATE-VERIFY ?auto_693953 ?auto_693954 ?auto_693955 ?auto_693957 ?auto_693956 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_693983 - SURFACE
      ?auto_693984 - SURFACE
      ?auto_693985 - SURFACE
      ?auto_693987 - SURFACE
      ?auto_693986 - SURFACE
    )
    :vars
    (
      ?auto_693989 - HOIST
      ?auto_693990 - PLACE
      ?auto_693988 - TRUCK
      ?auto_693991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693989 ?auto_693990 ) ( SURFACE-AT ?auto_693987 ?auto_693990 ) ( CLEAR ?auto_693987 ) ( IS-CRATE ?auto_693986 ) ( not ( = ?auto_693987 ?auto_693986 ) ) ( AVAILABLE ?auto_693989 ) ( IN ?auto_693986 ?auto_693988 ) ( ON ?auto_693987 ?auto_693985 ) ( not ( = ?auto_693985 ?auto_693987 ) ) ( not ( = ?auto_693985 ?auto_693986 ) ) ( TRUCK-AT ?auto_693988 ?auto_693991 ) ( not ( = ?auto_693991 ?auto_693990 ) ) ( ON ?auto_693984 ?auto_693983 ) ( ON ?auto_693985 ?auto_693984 ) ( not ( = ?auto_693983 ?auto_693984 ) ) ( not ( = ?auto_693983 ?auto_693985 ) ) ( not ( = ?auto_693983 ?auto_693987 ) ) ( not ( = ?auto_693983 ?auto_693986 ) ) ( not ( = ?auto_693984 ?auto_693985 ) ) ( not ( = ?auto_693984 ?auto_693987 ) ) ( not ( = ?auto_693984 ?auto_693986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693985 ?auto_693987 ?auto_693986 )
      ( MAKE-4CRATE-VERIFY ?auto_693983 ?auto_693984 ?auto_693985 ?auto_693987 ?auto_693986 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694017 - SURFACE
      ?auto_694018 - SURFACE
      ?auto_694019 - SURFACE
      ?auto_694021 - SURFACE
      ?auto_694020 - SURFACE
    )
    :vars
    (
      ?auto_694024 - HOIST
      ?auto_694026 - PLACE
      ?auto_694023 - TRUCK
      ?auto_694022 - PLACE
      ?auto_694025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_694024 ?auto_694026 ) ( SURFACE-AT ?auto_694021 ?auto_694026 ) ( CLEAR ?auto_694021 ) ( IS-CRATE ?auto_694020 ) ( not ( = ?auto_694021 ?auto_694020 ) ) ( AVAILABLE ?auto_694024 ) ( ON ?auto_694021 ?auto_694019 ) ( not ( = ?auto_694019 ?auto_694021 ) ) ( not ( = ?auto_694019 ?auto_694020 ) ) ( TRUCK-AT ?auto_694023 ?auto_694022 ) ( not ( = ?auto_694022 ?auto_694026 ) ) ( HOIST-AT ?auto_694025 ?auto_694022 ) ( LIFTING ?auto_694025 ?auto_694020 ) ( not ( = ?auto_694024 ?auto_694025 ) ) ( ON ?auto_694018 ?auto_694017 ) ( ON ?auto_694019 ?auto_694018 ) ( not ( = ?auto_694017 ?auto_694018 ) ) ( not ( = ?auto_694017 ?auto_694019 ) ) ( not ( = ?auto_694017 ?auto_694021 ) ) ( not ( = ?auto_694017 ?auto_694020 ) ) ( not ( = ?auto_694018 ?auto_694019 ) ) ( not ( = ?auto_694018 ?auto_694021 ) ) ( not ( = ?auto_694018 ?auto_694020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694019 ?auto_694021 ?auto_694020 )
      ( MAKE-4CRATE-VERIFY ?auto_694017 ?auto_694018 ?auto_694019 ?auto_694021 ?auto_694020 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694055 - SURFACE
      ?auto_694056 - SURFACE
      ?auto_694057 - SURFACE
      ?auto_694059 - SURFACE
      ?auto_694058 - SURFACE
    )
    :vars
    (
      ?auto_694062 - HOIST
      ?auto_694063 - PLACE
      ?auto_694060 - TRUCK
      ?auto_694065 - PLACE
      ?auto_694064 - HOIST
      ?auto_694061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694062 ?auto_694063 ) ( SURFACE-AT ?auto_694059 ?auto_694063 ) ( CLEAR ?auto_694059 ) ( IS-CRATE ?auto_694058 ) ( not ( = ?auto_694059 ?auto_694058 ) ) ( AVAILABLE ?auto_694062 ) ( ON ?auto_694059 ?auto_694057 ) ( not ( = ?auto_694057 ?auto_694059 ) ) ( not ( = ?auto_694057 ?auto_694058 ) ) ( TRUCK-AT ?auto_694060 ?auto_694065 ) ( not ( = ?auto_694065 ?auto_694063 ) ) ( HOIST-AT ?auto_694064 ?auto_694065 ) ( not ( = ?auto_694062 ?auto_694064 ) ) ( AVAILABLE ?auto_694064 ) ( SURFACE-AT ?auto_694058 ?auto_694065 ) ( ON ?auto_694058 ?auto_694061 ) ( CLEAR ?auto_694058 ) ( not ( = ?auto_694059 ?auto_694061 ) ) ( not ( = ?auto_694058 ?auto_694061 ) ) ( not ( = ?auto_694057 ?auto_694061 ) ) ( ON ?auto_694056 ?auto_694055 ) ( ON ?auto_694057 ?auto_694056 ) ( not ( = ?auto_694055 ?auto_694056 ) ) ( not ( = ?auto_694055 ?auto_694057 ) ) ( not ( = ?auto_694055 ?auto_694059 ) ) ( not ( = ?auto_694055 ?auto_694058 ) ) ( not ( = ?auto_694055 ?auto_694061 ) ) ( not ( = ?auto_694056 ?auto_694057 ) ) ( not ( = ?auto_694056 ?auto_694059 ) ) ( not ( = ?auto_694056 ?auto_694058 ) ) ( not ( = ?auto_694056 ?auto_694061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694057 ?auto_694059 ?auto_694058 )
      ( MAKE-4CRATE-VERIFY ?auto_694055 ?auto_694056 ?auto_694057 ?auto_694059 ?auto_694058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694094 - SURFACE
      ?auto_694095 - SURFACE
      ?auto_694096 - SURFACE
      ?auto_694098 - SURFACE
      ?auto_694097 - SURFACE
    )
    :vars
    (
      ?auto_694099 - HOIST
      ?auto_694102 - PLACE
      ?auto_694103 - PLACE
      ?auto_694100 - HOIST
      ?auto_694104 - SURFACE
      ?auto_694101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694099 ?auto_694102 ) ( SURFACE-AT ?auto_694098 ?auto_694102 ) ( CLEAR ?auto_694098 ) ( IS-CRATE ?auto_694097 ) ( not ( = ?auto_694098 ?auto_694097 ) ) ( AVAILABLE ?auto_694099 ) ( ON ?auto_694098 ?auto_694096 ) ( not ( = ?auto_694096 ?auto_694098 ) ) ( not ( = ?auto_694096 ?auto_694097 ) ) ( not ( = ?auto_694103 ?auto_694102 ) ) ( HOIST-AT ?auto_694100 ?auto_694103 ) ( not ( = ?auto_694099 ?auto_694100 ) ) ( AVAILABLE ?auto_694100 ) ( SURFACE-AT ?auto_694097 ?auto_694103 ) ( ON ?auto_694097 ?auto_694104 ) ( CLEAR ?auto_694097 ) ( not ( = ?auto_694098 ?auto_694104 ) ) ( not ( = ?auto_694097 ?auto_694104 ) ) ( not ( = ?auto_694096 ?auto_694104 ) ) ( TRUCK-AT ?auto_694101 ?auto_694102 ) ( ON ?auto_694095 ?auto_694094 ) ( ON ?auto_694096 ?auto_694095 ) ( not ( = ?auto_694094 ?auto_694095 ) ) ( not ( = ?auto_694094 ?auto_694096 ) ) ( not ( = ?auto_694094 ?auto_694098 ) ) ( not ( = ?auto_694094 ?auto_694097 ) ) ( not ( = ?auto_694094 ?auto_694104 ) ) ( not ( = ?auto_694095 ?auto_694096 ) ) ( not ( = ?auto_694095 ?auto_694098 ) ) ( not ( = ?auto_694095 ?auto_694097 ) ) ( not ( = ?auto_694095 ?auto_694104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694096 ?auto_694098 ?auto_694097 )
      ( MAKE-4CRATE-VERIFY ?auto_694094 ?auto_694095 ?auto_694096 ?auto_694098 ?auto_694097 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694133 - SURFACE
      ?auto_694134 - SURFACE
      ?auto_694135 - SURFACE
      ?auto_694137 - SURFACE
      ?auto_694136 - SURFACE
    )
    :vars
    (
      ?auto_694140 - HOIST
      ?auto_694138 - PLACE
      ?auto_694139 - PLACE
      ?auto_694143 - HOIST
      ?auto_694141 - SURFACE
      ?auto_694142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694140 ?auto_694138 ) ( IS-CRATE ?auto_694136 ) ( not ( = ?auto_694137 ?auto_694136 ) ) ( not ( = ?auto_694135 ?auto_694137 ) ) ( not ( = ?auto_694135 ?auto_694136 ) ) ( not ( = ?auto_694139 ?auto_694138 ) ) ( HOIST-AT ?auto_694143 ?auto_694139 ) ( not ( = ?auto_694140 ?auto_694143 ) ) ( AVAILABLE ?auto_694143 ) ( SURFACE-AT ?auto_694136 ?auto_694139 ) ( ON ?auto_694136 ?auto_694141 ) ( CLEAR ?auto_694136 ) ( not ( = ?auto_694137 ?auto_694141 ) ) ( not ( = ?auto_694136 ?auto_694141 ) ) ( not ( = ?auto_694135 ?auto_694141 ) ) ( TRUCK-AT ?auto_694142 ?auto_694138 ) ( SURFACE-AT ?auto_694135 ?auto_694138 ) ( CLEAR ?auto_694135 ) ( LIFTING ?auto_694140 ?auto_694137 ) ( IS-CRATE ?auto_694137 ) ( ON ?auto_694134 ?auto_694133 ) ( ON ?auto_694135 ?auto_694134 ) ( not ( = ?auto_694133 ?auto_694134 ) ) ( not ( = ?auto_694133 ?auto_694135 ) ) ( not ( = ?auto_694133 ?auto_694137 ) ) ( not ( = ?auto_694133 ?auto_694136 ) ) ( not ( = ?auto_694133 ?auto_694141 ) ) ( not ( = ?auto_694134 ?auto_694135 ) ) ( not ( = ?auto_694134 ?auto_694137 ) ) ( not ( = ?auto_694134 ?auto_694136 ) ) ( not ( = ?auto_694134 ?auto_694141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694135 ?auto_694137 ?auto_694136 )
      ( MAKE-4CRATE-VERIFY ?auto_694133 ?auto_694134 ?auto_694135 ?auto_694137 ?auto_694136 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694172 - SURFACE
      ?auto_694173 - SURFACE
      ?auto_694174 - SURFACE
      ?auto_694176 - SURFACE
      ?auto_694175 - SURFACE
    )
    :vars
    (
      ?auto_694179 - HOIST
      ?auto_694180 - PLACE
      ?auto_694182 - PLACE
      ?auto_694181 - HOIST
      ?auto_694177 - SURFACE
      ?auto_694178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694179 ?auto_694180 ) ( IS-CRATE ?auto_694175 ) ( not ( = ?auto_694176 ?auto_694175 ) ) ( not ( = ?auto_694174 ?auto_694176 ) ) ( not ( = ?auto_694174 ?auto_694175 ) ) ( not ( = ?auto_694182 ?auto_694180 ) ) ( HOIST-AT ?auto_694181 ?auto_694182 ) ( not ( = ?auto_694179 ?auto_694181 ) ) ( AVAILABLE ?auto_694181 ) ( SURFACE-AT ?auto_694175 ?auto_694182 ) ( ON ?auto_694175 ?auto_694177 ) ( CLEAR ?auto_694175 ) ( not ( = ?auto_694176 ?auto_694177 ) ) ( not ( = ?auto_694175 ?auto_694177 ) ) ( not ( = ?auto_694174 ?auto_694177 ) ) ( TRUCK-AT ?auto_694178 ?auto_694180 ) ( SURFACE-AT ?auto_694174 ?auto_694180 ) ( CLEAR ?auto_694174 ) ( IS-CRATE ?auto_694176 ) ( AVAILABLE ?auto_694179 ) ( IN ?auto_694176 ?auto_694178 ) ( ON ?auto_694173 ?auto_694172 ) ( ON ?auto_694174 ?auto_694173 ) ( not ( = ?auto_694172 ?auto_694173 ) ) ( not ( = ?auto_694172 ?auto_694174 ) ) ( not ( = ?auto_694172 ?auto_694176 ) ) ( not ( = ?auto_694172 ?auto_694175 ) ) ( not ( = ?auto_694172 ?auto_694177 ) ) ( not ( = ?auto_694173 ?auto_694174 ) ) ( not ( = ?auto_694173 ?auto_694176 ) ) ( not ( = ?auto_694173 ?auto_694175 ) ) ( not ( = ?auto_694173 ?auto_694177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694174 ?auto_694176 ?auto_694175 )
      ( MAKE-4CRATE-VERIFY ?auto_694172 ?auto_694173 ?auto_694174 ?auto_694176 ?auto_694175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_694673 - SURFACE
      ?auto_694674 - SURFACE
    )
    :vars
    (
      ?auto_694681 - HOIST
      ?auto_694680 - PLACE
      ?auto_694677 - SURFACE
      ?auto_694679 - PLACE
      ?auto_694678 - HOIST
      ?auto_694676 - SURFACE
      ?auto_694675 - TRUCK
      ?auto_694682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694681 ?auto_694680 ) ( SURFACE-AT ?auto_694673 ?auto_694680 ) ( CLEAR ?auto_694673 ) ( IS-CRATE ?auto_694674 ) ( not ( = ?auto_694673 ?auto_694674 ) ) ( ON ?auto_694673 ?auto_694677 ) ( not ( = ?auto_694677 ?auto_694673 ) ) ( not ( = ?auto_694677 ?auto_694674 ) ) ( not ( = ?auto_694679 ?auto_694680 ) ) ( HOIST-AT ?auto_694678 ?auto_694679 ) ( not ( = ?auto_694681 ?auto_694678 ) ) ( AVAILABLE ?auto_694678 ) ( SURFACE-AT ?auto_694674 ?auto_694679 ) ( ON ?auto_694674 ?auto_694676 ) ( CLEAR ?auto_694674 ) ( not ( = ?auto_694673 ?auto_694676 ) ) ( not ( = ?auto_694674 ?auto_694676 ) ) ( not ( = ?auto_694677 ?auto_694676 ) ) ( TRUCK-AT ?auto_694675 ?auto_694680 ) ( LIFTING ?auto_694681 ?auto_694682 ) ( IS-CRATE ?auto_694682 ) ( not ( = ?auto_694673 ?auto_694682 ) ) ( not ( = ?auto_694674 ?auto_694682 ) ) ( not ( = ?auto_694677 ?auto_694682 ) ) ( not ( = ?auto_694676 ?auto_694682 ) ) )
    :subtasks
    ( ( !LOAD ?auto_694681 ?auto_694682 ?auto_694675 ?auto_694680 )
      ( MAKE-1CRATE ?auto_694673 ?auto_694674 )
      ( MAKE-1CRATE-VERIFY ?auto_694673 ?auto_694674 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_694832 - SURFACE
      ?auto_694833 - SURFACE
      ?auto_694834 - SURFACE
      ?auto_694836 - SURFACE
      ?auto_694835 - SURFACE
      ?auto_694837 - SURFACE
    )
    :vars
    (
      ?auto_694839 - HOIST
      ?auto_694838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694839 ?auto_694838 ) ( SURFACE-AT ?auto_694835 ?auto_694838 ) ( CLEAR ?auto_694835 ) ( LIFTING ?auto_694839 ?auto_694837 ) ( IS-CRATE ?auto_694837 ) ( not ( = ?auto_694835 ?auto_694837 ) ) ( ON ?auto_694833 ?auto_694832 ) ( ON ?auto_694834 ?auto_694833 ) ( ON ?auto_694836 ?auto_694834 ) ( ON ?auto_694835 ?auto_694836 ) ( not ( = ?auto_694832 ?auto_694833 ) ) ( not ( = ?auto_694832 ?auto_694834 ) ) ( not ( = ?auto_694832 ?auto_694836 ) ) ( not ( = ?auto_694832 ?auto_694835 ) ) ( not ( = ?auto_694832 ?auto_694837 ) ) ( not ( = ?auto_694833 ?auto_694834 ) ) ( not ( = ?auto_694833 ?auto_694836 ) ) ( not ( = ?auto_694833 ?auto_694835 ) ) ( not ( = ?auto_694833 ?auto_694837 ) ) ( not ( = ?auto_694834 ?auto_694836 ) ) ( not ( = ?auto_694834 ?auto_694835 ) ) ( not ( = ?auto_694834 ?auto_694837 ) ) ( not ( = ?auto_694836 ?auto_694835 ) ) ( not ( = ?auto_694836 ?auto_694837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_694835 ?auto_694837 )
      ( MAKE-5CRATE-VERIFY ?auto_694832 ?auto_694833 ?auto_694834 ?auto_694836 ?auto_694835 ?auto_694837 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_694866 - SURFACE
      ?auto_694867 - SURFACE
      ?auto_694868 - SURFACE
      ?auto_694870 - SURFACE
      ?auto_694869 - SURFACE
      ?auto_694871 - SURFACE
    )
    :vars
    (
      ?auto_694873 - HOIST
      ?auto_694874 - PLACE
      ?auto_694872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694873 ?auto_694874 ) ( SURFACE-AT ?auto_694869 ?auto_694874 ) ( CLEAR ?auto_694869 ) ( IS-CRATE ?auto_694871 ) ( not ( = ?auto_694869 ?auto_694871 ) ) ( TRUCK-AT ?auto_694872 ?auto_694874 ) ( AVAILABLE ?auto_694873 ) ( IN ?auto_694871 ?auto_694872 ) ( ON ?auto_694869 ?auto_694870 ) ( not ( = ?auto_694870 ?auto_694869 ) ) ( not ( = ?auto_694870 ?auto_694871 ) ) ( ON ?auto_694867 ?auto_694866 ) ( ON ?auto_694868 ?auto_694867 ) ( ON ?auto_694870 ?auto_694868 ) ( not ( = ?auto_694866 ?auto_694867 ) ) ( not ( = ?auto_694866 ?auto_694868 ) ) ( not ( = ?auto_694866 ?auto_694870 ) ) ( not ( = ?auto_694866 ?auto_694869 ) ) ( not ( = ?auto_694866 ?auto_694871 ) ) ( not ( = ?auto_694867 ?auto_694868 ) ) ( not ( = ?auto_694867 ?auto_694870 ) ) ( not ( = ?auto_694867 ?auto_694869 ) ) ( not ( = ?auto_694867 ?auto_694871 ) ) ( not ( = ?auto_694868 ?auto_694870 ) ) ( not ( = ?auto_694868 ?auto_694869 ) ) ( not ( = ?auto_694868 ?auto_694871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694870 ?auto_694869 ?auto_694871 )
      ( MAKE-5CRATE-VERIFY ?auto_694866 ?auto_694867 ?auto_694868 ?auto_694870 ?auto_694869 ?auto_694871 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_694906 - SURFACE
      ?auto_694907 - SURFACE
      ?auto_694908 - SURFACE
      ?auto_694910 - SURFACE
      ?auto_694909 - SURFACE
      ?auto_694911 - SURFACE
    )
    :vars
    (
      ?auto_694914 - HOIST
      ?auto_694913 - PLACE
      ?auto_694912 - TRUCK
      ?auto_694915 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694914 ?auto_694913 ) ( SURFACE-AT ?auto_694909 ?auto_694913 ) ( CLEAR ?auto_694909 ) ( IS-CRATE ?auto_694911 ) ( not ( = ?auto_694909 ?auto_694911 ) ) ( AVAILABLE ?auto_694914 ) ( IN ?auto_694911 ?auto_694912 ) ( ON ?auto_694909 ?auto_694910 ) ( not ( = ?auto_694910 ?auto_694909 ) ) ( not ( = ?auto_694910 ?auto_694911 ) ) ( TRUCK-AT ?auto_694912 ?auto_694915 ) ( not ( = ?auto_694915 ?auto_694913 ) ) ( ON ?auto_694907 ?auto_694906 ) ( ON ?auto_694908 ?auto_694907 ) ( ON ?auto_694910 ?auto_694908 ) ( not ( = ?auto_694906 ?auto_694907 ) ) ( not ( = ?auto_694906 ?auto_694908 ) ) ( not ( = ?auto_694906 ?auto_694910 ) ) ( not ( = ?auto_694906 ?auto_694909 ) ) ( not ( = ?auto_694906 ?auto_694911 ) ) ( not ( = ?auto_694907 ?auto_694908 ) ) ( not ( = ?auto_694907 ?auto_694910 ) ) ( not ( = ?auto_694907 ?auto_694909 ) ) ( not ( = ?auto_694907 ?auto_694911 ) ) ( not ( = ?auto_694908 ?auto_694910 ) ) ( not ( = ?auto_694908 ?auto_694909 ) ) ( not ( = ?auto_694908 ?auto_694911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694910 ?auto_694909 ?auto_694911 )
      ( MAKE-5CRATE-VERIFY ?auto_694906 ?auto_694907 ?auto_694908 ?auto_694910 ?auto_694909 ?auto_694911 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_694951 - SURFACE
      ?auto_694952 - SURFACE
      ?auto_694953 - SURFACE
      ?auto_694955 - SURFACE
      ?auto_694954 - SURFACE
      ?auto_694956 - SURFACE
    )
    :vars
    (
      ?auto_694960 - HOIST
      ?auto_694958 - PLACE
      ?auto_694959 - TRUCK
      ?auto_694961 - PLACE
      ?auto_694957 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_694960 ?auto_694958 ) ( SURFACE-AT ?auto_694954 ?auto_694958 ) ( CLEAR ?auto_694954 ) ( IS-CRATE ?auto_694956 ) ( not ( = ?auto_694954 ?auto_694956 ) ) ( AVAILABLE ?auto_694960 ) ( ON ?auto_694954 ?auto_694955 ) ( not ( = ?auto_694955 ?auto_694954 ) ) ( not ( = ?auto_694955 ?auto_694956 ) ) ( TRUCK-AT ?auto_694959 ?auto_694961 ) ( not ( = ?auto_694961 ?auto_694958 ) ) ( HOIST-AT ?auto_694957 ?auto_694961 ) ( LIFTING ?auto_694957 ?auto_694956 ) ( not ( = ?auto_694960 ?auto_694957 ) ) ( ON ?auto_694952 ?auto_694951 ) ( ON ?auto_694953 ?auto_694952 ) ( ON ?auto_694955 ?auto_694953 ) ( not ( = ?auto_694951 ?auto_694952 ) ) ( not ( = ?auto_694951 ?auto_694953 ) ) ( not ( = ?auto_694951 ?auto_694955 ) ) ( not ( = ?auto_694951 ?auto_694954 ) ) ( not ( = ?auto_694951 ?auto_694956 ) ) ( not ( = ?auto_694952 ?auto_694953 ) ) ( not ( = ?auto_694952 ?auto_694955 ) ) ( not ( = ?auto_694952 ?auto_694954 ) ) ( not ( = ?auto_694952 ?auto_694956 ) ) ( not ( = ?auto_694953 ?auto_694955 ) ) ( not ( = ?auto_694953 ?auto_694954 ) ) ( not ( = ?auto_694953 ?auto_694956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694955 ?auto_694954 ?auto_694956 )
      ( MAKE-5CRATE-VERIFY ?auto_694951 ?auto_694952 ?auto_694953 ?auto_694955 ?auto_694954 ?auto_694956 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695001 - SURFACE
      ?auto_695002 - SURFACE
      ?auto_695003 - SURFACE
      ?auto_695005 - SURFACE
      ?auto_695004 - SURFACE
      ?auto_695006 - SURFACE
    )
    :vars
    (
      ?auto_695010 - HOIST
      ?auto_695007 - PLACE
      ?auto_695011 - TRUCK
      ?auto_695008 - PLACE
      ?auto_695009 - HOIST
      ?auto_695012 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695010 ?auto_695007 ) ( SURFACE-AT ?auto_695004 ?auto_695007 ) ( CLEAR ?auto_695004 ) ( IS-CRATE ?auto_695006 ) ( not ( = ?auto_695004 ?auto_695006 ) ) ( AVAILABLE ?auto_695010 ) ( ON ?auto_695004 ?auto_695005 ) ( not ( = ?auto_695005 ?auto_695004 ) ) ( not ( = ?auto_695005 ?auto_695006 ) ) ( TRUCK-AT ?auto_695011 ?auto_695008 ) ( not ( = ?auto_695008 ?auto_695007 ) ) ( HOIST-AT ?auto_695009 ?auto_695008 ) ( not ( = ?auto_695010 ?auto_695009 ) ) ( AVAILABLE ?auto_695009 ) ( SURFACE-AT ?auto_695006 ?auto_695008 ) ( ON ?auto_695006 ?auto_695012 ) ( CLEAR ?auto_695006 ) ( not ( = ?auto_695004 ?auto_695012 ) ) ( not ( = ?auto_695006 ?auto_695012 ) ) ( not ( = ?auto_695005 ?auto_695012 ) ) ( ON ?auto_695002 ?auto_695001 ) ( ON ?auto_695003 ?auto_695002 ) ( ON ?auto_695005 ?auto_695003 ) ( not ( = ?auto_695001 ?auto_695002 ) ) ( not ( = ?auto_695001 ?auto_695003 ) ) ( not ( = ?auto_695001 ?auto_695005 ) ) ( not ( = ?auto_695001 ?auto_695004 ) ) ( not ( = ?auto_695001 ?auto_695006 ) ) ( not ( = ?auto_695001 ?auto_695012 ) ) ( not ( = ?auto_695002 ?auto_695003 ) ) ( not ( = ?auto_695002 ?auto_695005 ) ) ( not ( = ?auto_695002 ?auto_695004 ) ) ( not ( = ?auto_695002 ?auto_695006 ) ) ( not ( = ?auto_695002 ?auto_695012 ) ) ( not ( = ?auto_695003 ?auto_695005 ) ) ( not ( = ?auto_695003 ?auto_695004 ) ) ( not ( = ?auto_695003 ?auto_695006 ) ) ( not ( = ?auto_695003 ?auto_695012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695005 ?auto_695004 ?auto_695006 )
      ( MAKE-5CRATE-VERIFY ?auto_695001 ?auto_695002 ?auto_695003 ?auto_695005 ?auto_695004 ?auto_695006 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695052 - SURFACE
      ?auto_695053 - SURFACE
      ?auto_695054 - SURFACE
      ?auto_695056 - SURFACE
      ?auto_695055 - SURFACE
      ?auto_695057 - SURFACE
    )
    :vars
    (
      ?auto_695062 - HOIST
      ?auto_695060 - PLACE
      ?auto_695063 - PLACE
      ?auto_695061 - HOIST
      ?auto_695059 - SURFACE
      ?auto_695058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695062 ?auto_695060 ) ( SURFACE-AT ?auto_695055 ?auto_695060 ) ( CLEAR ?auto_695055 ) ( IS-CRATE ?auto_695057 ) ( not ( = ?auto_695055 ?auto_695057 ) ) ( AVAILABLE ?auto_695062 ) ( ON ?auto_695055 ?auto_695056 ) ( not ( = ?auto_695056 ?auto_695055 ) ) ( not ( = ?auto_695056 ?auto_695057 ) ) ( not ( = ?auto_695063 ?auto_695060 ) ) ( HOIST-AT ?auto_695061 ?auto_695063 ) ( not ( = ?auto_695062 ?auto_695061 ) ) ( AVAILABLE ?auto_695061 ) ( SURFACE-AT ?auto_695057 ?auto_695063 ) ( ON ?auto_695057 ?auto_695059 ) ( CLEAR ?auto_695057 ) ( not ( = ?auto_695055 ?auto_695059 ) ) ( not ( = ?auto_695057 ?auto_695059 ) ) ( not ( = ?auto_695056 ?auto_695059 ) ) ( TRUCK-AT ?auto_695058 ?auto_695060 ) ( ON ?auto_695053 ?auto_695052 ) ( ON ?auto_695054 ?auto_695053 ) ( ON ?auto_695056 ?auto_695054 ) ( not ( = ?auto_695052 ?auto_695053 ) ) ( not ( = ?auto_695052 ?auto_695054 ) ) ( not ( = ?auto_695052 ?auto_695056 ) ) ( not ( = ?auto_695052 ?auto_695055 ) ) ( not ( = ?auto_695052 ?auto_695057 ) ) ( not ( = ?auto_695052 ?auto_695059 ) ) ( not ( = ?auto_695053 ?auto_695054 ) ) ( not ( = ?auto_695053 ?auto_695056 ) ) ( not ( = ?auto_695053 ?auto_695055 ) ) ( not ( = ?auto_695053 ?auto_695057 ) ) ( not ( = ?auto_695053 ?auto_695059 ) ) ( not ( = ?auto_695054 ?auto_695056 ) ) ( not ( = ?auto_695054 ?auto_695055 ) ) ( not ( = ?auto_695054 ?auto_695057 ) ) ( not ( = ?auto_695054 ?auto_695059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695056 ?auto_695055 ?auto_695057 )
      ( MAKE-5CRATE-VERIFY ?auto_695052 ?auto_695053 ?auto_695054 ?auto_695056 ?auto_695055 ?auto_695057 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695103 - SURFACE
      ?auto_695104 - SURFACE
      ?auto_695105 - SURFACE
      ?auto_695107 - SURFACE
      ?auto_695106 - SURFACE
      ?auto_695108 - SURFACE
    )
    :vars
    (
      ?auto_695112 - HOIST
      ?auto_695114 - PLACE
      ?auto_695109 - PLACE
      ?auto_695113 - HOIST
      ?auto_695110 - SURFACE
      ?auto_695111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695112 ?auto_695114 ) ( IS-CRATE ?auto_695108 ) ( not ( = ?auto_695106 ?auto_695108 ) ) ( not ( = ?auto_695107 ?auto_695106 ) ) ( not ( = ?auto_695107 ?auto_695108 ) ) ( not ( = ?auto_695109 ?auto_695114 ) ) ( HOIST-AT ?auto_695113 ?auto_695109 ) ( not ( = ?auto_695112 ?auto_695113 ) ) ( AVAILABLE ?auto_695113 ) ( SURFACE-AT ?auto_695108 ?auto_695109 ) ( ON ?auto_695108 ?auto_695110 ) ( CLEAR ?auto_695108 ) ( not ( = ?auto_695106 ?auto_695110 ) ) ( not ( = ?auto_695108 ?auto_695110 ) ) ( not ( = ?auto_695107 ?auto_695110 ) ) ( TRUCK-AT ?auto_695111 ?auto_695114 ) ( SURFACE-AT ?auto_695107 ?auto_695114 ) ( CLEAR ?auto_695107 ) ( LIFTING ?auto_695112 ?auto_695106 ) ( IS-CRATE ?auto_695106 ) ( ON ?auto_695104 ?auto_695103 ) ( ON ?auto_695105 ?auto_695104 ) ( ON ?auto_695107 ?auto_695105 ) ( not ( = ?auto_695103 ?auto_695104 ) ) ( not ( = ?auto_695103 ?auto_695105 ) ) ( not ( = ?auto_695103 ?auto_695107 ) ) ( not ( = ?auto_695103 ?auto_695106 ) ) ( not ( = ?auto_695103 ?auto_695108 ) ) ( not ( = ?auto_695103 ?auto_695110 ) ) ( not ( = ?auto_695104 ?auto_695105 ) ) ( not ( = ?auto_695104 ?auto_695107 ) ) ( not ( = ?auto_695104 ?auto_695106 ) ) ( not ( = ?auto_695104 ?auto_695108 ) ) ( not ( = ?auto_695104 ?auto_695110 ) ) ( not ( = ?auto_695105 ?auto_695107 ) ) ( not ( = ?auto_695105 ?auto_695106 ) ) ( not ( = ?auto_695105 ?auto_695108 ) ) ( not ( = ?auto_695105 ?auto_695110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695107 ?auto_695106 ?auto_695108 )
      ( MAKE-5CRATE-VERIFY ?auto_695103 ?auto_695104 ?auto_695105 ?auto_695107 ?auto_695106 ?auto_695108 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695154 - SURFACE
      ?auto_695155 - SURFACE
      ?auto_695156 - SURFACE
      ?auto_695158 - SURFACE
      ?auto_695157 - SURFACE
      ?auto_695159 - SURFACE
    )
    :vars
    (
      ?auto_695164 - HOIST
      ?auto_695162 - PLACE
      ?auto_695163 - PLACE
      ?auto_695161 - HOIST
      ?auto_695160 - SURFACE
      ?auto_695165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695164 ?auto_695162 ) ( IS-CRATE ?auto_695159 ) ( not ( = ?auto_695157 ?auto_695159 ) ) ( not ( = ?auto_695158 ?auto_695157 ) ) ( not ( = ?auto_695158 ?auto_695159 ) ) ( not ( = ?auto_695163 ?auto_695162 ) ) ( HOIST-AT ?auto_695161 ?auto_695163 ) ( not ( = ?auto_695164 ?auto_695161 ) ) ( AVAILABLE ?auto_695161 ) ( SURFACE-AT ?auto_695159 ?auto_695163 ) ( ON ?auto_695159 ?auto_695160 ) ( CLEAR ?auto_695159 ) ( not ( = ?auto_695157 ?auto_695160 ) ) ( not ( = ?auto_695159 ?auto_695160 ) ) ( not ( = ?auto_695158 ?auto_695160 ) ) ( TRUCK-AT ?auto_695165 ?auto_695162 ) ( SURFACE-AT ?auto_695158 ?auto_695162 ) ( CLEAR ?auto_695158 ) ( IS-CRATE ?auto_695157 ) ( AVAILABLE ?auto_695164 ) ( IN ?auto_695157 ?auto_695165 ) ( ON ?auto_695155 ?auto_695154 ) ( ON ?auto_695156 ?auto_695155 ) ( ON ?auto_695158 ?auto_695156 ) ( not ( = ?auto_695154 ?auto_695155 ) ) ( not ( = ?auto_695154 ?auto_695156 ) ) ( not ( = ?auto_695154 ?auto_695158 ) ) ( not ( = ?auto_695154 ?auto_695157 ) ) ( not ( = ?auto_695154 ?auto_695159 ) ) ( not ( = ?auto_695154 ?auto_695160 ) ) ( not ( = ?auto_695155 ?auto_695156 ) ) ( not ( = ?auto_695155 ?auto_695158 ) ) ( not ( = ?auto_695155 ?auto_695157 ) ) ( not ( = ?auto_695155 ?auto_695159 ) ) ( not ( = ?auto_695155 ?auto_695160 ) ) ( not ( = ?auto_695156 ?auto_695158 ) ) ( not ( = ?auto_695156 ?auto_695157 ) ) ( not ( = ?auto_695156 ?auto_695159 ) ) ( not ( = ?auto_695156 ?auto_695160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695158 ?auto_695157 ?auto_695159 )
      ( MAKE-5CRATE-VERIFY ?auto_695154 ?auto_695155 ?auto_695156 ?auto_695158 ?auto_695157 ?auto_695159 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696363 - SURFACE
      ?auto_696364 - SURFACE
      ?auto_696365 - SURFACE
      ?auto_696367 - SURFACE
      ?auto_696366 - SURFACE
      ?auto_696368 - SURFACE
      ?auto_696369 - SURFACE
    )
    :vars
    (
      ?auto_696371 - HOIST
      ?auto_696370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696371 ?auto_696370 ) ( SURFACE-AT ?auto_696368 ?auto_696370 ) ( CLEAR ?auto_696368 ) ( LIFTING ?auto_696371 ?auto_696369 ) ( IS-CRATE ?auto_696369 ) ( not ( = ?auto_696368 ?auto_696369 ) ) ( ON ?auto_696364 ?auto_696363 ) ( ON ?auto_696365 ?auto_696364 ) ( ON ?auto_696367 ?auto_696365 ) ( ON ?auto_696366 ?auto_696367 ) ( ON ?auto_696368 ?auto_696366 ) ( not ( = ?auto_696363 ?auto_696364 ) ) ( not ( = ?auto_696363 ?auto_696365 ) ) ( not ( = ?auto_696363 ?auto_696367 ) ) ( not ( = ?auto_696363 ?auto_696366 ) ) ( not ( = ?auto_696363 ?auto_696368 ) ) ( not ( = ?auto_696363 ?auto_696369 ) ) ( not ( = ?auto_696364 ?auto_696365 ) ) ( not ( = ?auto_696364 ?auto_696367 ) ) ( not ( = ?auto_696364 ?auto_696366 ) ) ( not ( = ?auto_696364 ?auto_696368 ) ) ( not ( = ?auto_696364 ?auto_696369 ) ) ( not ( = ?auto_696365 ?auto_696367 ) ) ( not ( = ?auto_696365 ?auto_696366 ) ) ( not ( = ?auto_696365 ?auto_696368 ) ) ( not ( = ?auto_696365 ?auto_696369 ) ) ( not ( = ?auto_696367 ?auto_696366 ) ) ( not ( = ?auto_696367 ?auto_696368 ) ) ( not ( = ?auto_696367 ?auto_696369 ) ) ( not ( = ?auto_696366 ?auto_696368 ) ) ( not ( = ?auto_696366 ?auto_696369 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_696368 ?auto_696369 )
      ( MAKE-6CRATE-VERIFY ?auto_696363 ?auto_696364 ?auto_696365 ?auto_696367 ?auto_696366 ?auto_696368 ?auto_696369 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696407 - SURFACE
      ?auto_696408 - SURFACE
      ?auto_696409 - SURFACE
      ?auto_696411 - SURFACE
      ?auto_696410 - SURFACE
      ?auto_696412 - SURFACE
      ?auto_696413 - SURFACE
    )
    :vars
    (
      ?auto_696414 - HOIST
      ?auto_696416 - PLACE
      ?auto_696415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696414 ?auto_696416 ) ( SURFACE-AT ?auto_696412 ?auto_696416 ) ( CLEAR ?auto_696412 ) ( IS-CRATE ?auto_696413 ) ( not ( = ?auto_696412 ?auto_696413 ) ) ( TRUCK-AT ?auto_696415 ?auto_696416 ) ( AVAILABLE ?auto_696414 ) ( IN ?auto_696413 ?auto_696415 ) ( ON ?auto_696412 ?auto_696410 ) ( not ( = ?auto_696410 ?auto_696412 ) ) ( not ( = ?auto_696410 ?auto_696413 ) ) ( ON ?auto_696408 ?auto_696407 ) ( ON ?auto_696409 ?auto_696408 ) ( ON ?auto_696411 ?auto_696409 ) ( ON ?auto_696410 ?auto_696411 ) ( not ( = ?auto_696407 ?auto_696408 ) ) ( not ( = ?auto_696407 ?auto_696409 ) ) ( not ( = ?auto_696407 ?auto_696411 ) ) ( not ( = ?auto_696407 ?auto_696410 ) ) ( not ( = ?auto_696407 ?auto_696412 ) ) ( not ( = ?auto_696407 ?auto_696413 ) ) ( not ( = ?auto_696408 ?auto_696409 ) ) ( not ( = ?auto_696408 ?auto_696411 ) ) ( not ( = ?auto_696408 ?auto_696410 ) ) ( not ( = ?auto_696408 ?auto_696412 ) ) ( not ( = ?auto_696408 ?auto_696413 ) ) ( not ( = ?auto_696409 ?auto_696411 ) ) ( not ( = ?auto_696409 ?auto_696410 ) ) ( not ( = ?auto_696409 ?auto_696412 ) ) ( not ( = ?auto_696409 ?auto_696413 ) ) ( not ( = ?auto_696411 ?auto_696410 ) ) ( not ( = ?auto_696411 ?auto_696412 ) ) ( not ( = ?auto_696411 ?auto_696413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696410 ?auto_696412 ?auto_696413 )
      ( MAKE-6CRATE-VERIFY ?auto_696407 ?auto_696408 ?auto_696409 ?auto_696411 ?auto_696410 ?auto_696412 ?auto_696413 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696458 - SURFACE
      ?auto_696459 - SURFACE
      ?auto_696460 - SURFACE
      ?auto_696462 - SURFACE
      ?auto_696461 - SURFACE
      ?auto_696463 - SURFACE
      ?auto_696464 - SURFACE
    )
    :vars
    (
      ?auto_696468 - HOIST
      ?auto_696466 - PLACE
      ?auto_696465 - TRUCK
      ?auto_696467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696468 ?auto_696466 ) ( SURFACE-AT ?auto_696463 ?auto_696466 ) ( CLEAR ?auto_696463 ) ( IS-CRATE ?auto_696464 ) ( not ( = ?auto_696463 ?auto_696464 ) ) ( AVAILABLE ?auto_696468 ) ( IN ?auto_696464 ?auto_696465 ) ( ON ?auto_696463 ?auto_696461 ) ( not ( = ?auto_696461 ?auto_696463 ) ) ( not ( = ?auto_696461 ?auto_696464 ) ) ( TRUCK-AT ?auto_696465 ?auto_696467 ) ( not ( = ?auto_696467 ?auto_696466 ) ) ( ON ?auto_696459 ?auto_696458 ) ( ON ?auto_696460 ?auto_696459 ) ( ON ?auto_696462 ?auto_696460 ) ( ON ?auto_696461 ?auto_696462 ) ( not ( = ?auto_696458 ?auto_696459 ) ) ( not ( = ?auto_696458 ?auto_696460 ) ) ( not ( = ?auto_696458 ?auto_696462 ) ) ( not ( = ?auto_696458 ?auto_696461 ) ) ( not ( = ?auto_696458 ?auto_696463 ) ) ( not ( = ?auto_696458 ?auto_696464 ) ) ( not ( = ?auto_696459 ?auto_696460 ) ) ( not ( = ?auto_696459 ?auto_696462 ) ) ( not ( = ?auto_696459 ?auto_696461 ) ) ( not ( = ?auto_696459 ?auto_696463 ) ) ( not ( = ?auto_696459 ?auto_696464 ) ) ( not ( = ?auto_696460 ?auto_696462 ) ) ( not ( = ?auto_696460 ?auto_696461 ) ) ( not ( = ?auto_696460 ?auto_696463 ) ) ( not ( = ?auto_696460 ?auto_696464 ) ) ( not ( = ?auto_696462 ?auto_696461 ) ) ( not ( = ?auto_696462 ?auto_696463 ) ) ( not ( = ?auto_696462 ?auto_696464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696461 ?auto_696463 ?auto_696464 )
      ( MAKE-6CRATE-VERIFY ?auto_696458 ?auto_696459 ?auto_696460 ?auto_696462 ?auto_696461 ?auto_696463 ?auto_696464 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696515 - SURFACE
      ?auto_696516 - SURFACE
      ?auto_696517 - SURFACE
      ?auto_696519 - SURFACE
      ?auto_696518 - SURFACE
      ?auto_696520 - SURFACE
      ?auto_696521 - SURFACE
    )
    :vars
    (
      ?auto_696526 - HOIST
      ?auto_696522 - PLACE
      ?auto_696525 - TRUCK
      ?auto_696524 - PLACE
      ?auto_696523 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_696526 ?auto_696522 ) ( SURFACE-AT ?auto_696520 ?auto_696522 ) ( CLEAR ?auto_696520 ) ( IS-CRATE ?auto_696521 ) ( not ( = ?auto_696520 ?auto_696521 ) ) ( AVAILABLE ?auto_696526 ) ( ON ?auto_696520 ?auto_696518 ) ( not ( = ?auto_696518 ?auto_696520 ) ) ( not ( = ?auto_696518 ?auto_696521 ) ) ( TRUCK-AT ?auto_696525 ?auto_696524 ) ( not ( = ?auto_696524 ?auto_696522 ) ) ( HOIST-AT ?auto_696523 ?auto_696524 ) ( LIFTING ?auto_696523 ?auto_696521 ) ( not ( = ?auto_696526 ?auto_696523 ) ) ( ON ?auto_696516 ?auto_696515 ) ( ON ?auto_696517 ?auto_696516 ) ( ON ?auto_696519 ?auto_696517 ) ( ON ?auto_696518 ?auto_696519 ) ( not ( = ?auto_696515 ?auto_696516 ) ) ( not ( = ?auto_696515 ?auto_696517 ) ) ( not ( = ?auto_696515 ?auto_696519 ) ) ( not ( = ?auto_696515 ?auto_696518 ) ) ( not ( = ?auto_696515 ?auto_696520 ) ) ( not ( = ?auto_696515 ?auto_696521 ) ) ( not ( = ?auto_696516 ?auto_696517 ) ) ( not ( = ?auto_696516 ?auto_696519 ) ) ( not ( = ?auto_696516 ?auto_696518 ) ) ( not ( = ?auto_696516 ?auto_696520 ) ) ( not ( = ?auto_696516 ?auto_696521 ) ) ( not ( = ?auto_696517 ?auto_696519 ) ) ( not ( = ?auto_696517 ?auto_696518 ) ) ( not ( = ?auto_696517 ?auto_696520 ) ) ( not ( = ?auto_696517 ?auto_696521 ) ) ( not ( = ?auto_696519 ?auto_696518 ) ) ( not ( = ?auto_696519 ?auto_696520 ) ) ( not ( = ?auto_696519 ?auto_696521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696518 ?auto_696520 ?auto_696521 )
      ( MAKE-6CRATE-VERIFY ?auto_696515 ?auto_696516 ?auto_696517 ?auto_696519 ?auto_696518 ?auto_696520 ?auto_696521 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696578 - SURFACE
      ?auto_696579 - SURFACE
      ?auto_696580 - SURFACE
      ?auto_696582 - SURFACE
      ?auto_696581 - SURFACE
      ?auto_696583 - SURFACE
      ?auto_696584 - SURFACE
    )
    :vars
    (
      ?auto_696585 - HOIST
      ?auto_696587 - PLACE
      ?auto_696586 - TRUCK
      ?auto_696589 - PLACE
      ?auto_696588 - HOIST
      ?auto_696590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696585 ?auto_696587 ) ( SURFACE-AT ?auto_696583 ?auto_696587 ) ( CLEAR ?auto_696583 ) ( IS-CRATE ?auto_696584 ) ( not ( = ?auto_696583 ?auto_696584 ) ) ( AVAILABLE ?auto_696585 ) ( ON ?auto_696583 ?auto_696581 ) ( not ( = ?auto_696581 ?auto_696583 ) ) ( not ( = ?auto_696581 ?auto_696584 ) ) ( TRUCK-AT ?auto_696586 ?auto_696589 ) ( not ( = ?auto_696589 ?auto_696587 ) ) ( HOIST-AT ?auto_696588 ?auto_696589 ) ( not ( = ?auto_696585 ?auto_696588 ) ) ( AVAILABLE ?auto_696588 ) ( SURFACE-AT ?auto_696584 ?auto_696589 ) ( ON ?auto_696584 ?auto_696590 ) ( CLEAR ?auto_696584 ) ( not ( = ?auto_696583 ?auto_696590 ) ) ( not ( = ?auto_696584 ?auto_696590 ) ) ( not ( = ?auto_696581 ?auto_696590 ) ) ( ON ?auto_696579 ?auto_696578 ) ( ON ?auto_696580 ?auto_696579 ) ( ON ?auto_696582 ?auto_696580 ) ( ON ?auto_696581 ?auto_696582 ) ( not ( = ?auto_696578 ?auto_696579 ) ) ( not ( = ?auto_696578 ?auto_696580 ) ) ( not ( = ?auto_696578 ?auto_696582 ) ) ( not ( = ?auto_696578 ?auto_696581 ) ) ( not ( = ?auto_696578 ?auto_696583 ) ) ( not ( = ?auto_696578 ?auto_696584 ) ) ( not ( = ?auto_696578 ?auto_696590 ) ) ( not ( = ?auto_696579 ?auto_696580 ) ) ( not ( = ?auto_696579 ?auto_696582 ) ) ( not ( = ?auto_696579 ?auto_696581 ) ) ( not ( = ?auto_696579 ?auto_696583 ) ) ( not ( = ?auto_696579 ?auto_696584 ) ) ( not ( = ?auto_696579 ?auto_696590 ) ) ( not ( = ?auto_696580 ?auto_696582 ) ) ( not ( = ?auto_696580 ?auto_696581 ) ) ( not ( = ?auto_696580 ?auto_696583 ) ) ( not ( = ?auto_696580 ?auto_696584 ) ) ( not ( = ?auto_696580 ?auto_696590 ) ) ( not ( = ?auto_696582 ?auto_696581 ) ) ( not ( = ?auto_696582 ?auto_696583 ) ) ( not ( = ?auto_696582 ?auto_696584 ) ) ( not ( = ?auto_696582 ?auto_696590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696581 ?auto_696583 ?auto_696584 )
      ( MAKE-6CRATE-VERIFY ?auto_696578 ?auto_696579 ?auto_696580 ?auto_696582 ?auto_696581 ?auto_696583 ?auto_696584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696642 - SURFACE
      ?auto_696643 - SURFACE
      ?auto_696644 - SURFACE
      ?auto_696646 - SURFACE
      ?auto_696645 - SURFACE
      ?auto_696647 - SURFACE
      ?auto_696648 - SURFACE
    )
    :vars
    (
      ?auto_696652 - HOIST
      ?auto_696653 - PLACE
      ?auto_696654 - PLACE
      ?auto_696650 - HOIST
      ?auto_696651 - SURFACE
      ?auto_696649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696652 ?auto_696653 ) ( SURFACE-AT ?auto_696647 ?auto_696653 ) ( CLEAR ?auto_696647 ) ( IS-CRATE ?auto_696648 ) ( not ( = ?auto_696647 ?auto_696648 ) ) ( AVAILABLE ?auto_696652 ) ( ON ?auto_696647 ?auto_696645 ) ( not ( = ?auto_696645 ?auto_696647 ) ) ( not ( = ?auto_696645 ?auto_696648 ) ) ( not ( = ?auto_696654 ?auto_696653 ) ) ( HOIST-AT ?auto_696650 ?auto_696654 ) ( not ( = ?auto_696652 ?auto_696650 ) ) ( AVAILABLE ?auto_696650 ) ( SURFACE-AT ?auto_696648 ?auto_696654 ) ( ON ?auto_696648 ?auto_696651 ) ( CLEAR ?auto_696648 ) ( not ( = ?auto_696647 ?auto_696651 ) ) ( not ( = ?auto_696648 ?auto_696651 ) ) ( not ( = ?auto_696645 ?auto_696651 ) ) ( TRUCK-AT ?auto_696649 ?auto_696653 ) ( ON ?auto_696643 ?auto_696642 ) ( ON ?auto_696644 ?auto_696643 ) ( ON ?auto_696646 ?auto_696644 ) ( ON ?auto_696645 ?auto_696646 ) ( not ( = ?auto_696642 ?auto_696643 ) ) ( not ( = ?auto_696642 ?auto_696644 ) ) ( not ( = ?auto_696642 ?auto_696646 ) ) ( not ( = ?auto_696642 ?auto_696645 ) ) ( not ( = ?auto_696642 ?auto_696647 ) ) ( not ( = ?auto_696642 ?auto_696648 ) ) ( not ( = ?auto_696642 ?auto_696651 ) ) ( not ( = ?auto_696643 ?auto_696644 ) ) ( not ( = ?auto_696643 ?auto_696646 ) ) ( not ( = ?auto_696643 ?auto_696645 ) ) ( not ( = ?auto_696643 ?auto_696647 ) ) ( not ( = ?auto_696643 ?auto_696648 ) ) ( not ( = ?auto_696643 ?auto_696651 ) ) ( not ( = ?auto_696644 ?auto_696646 ) ) ( not ( = ?auto_696644 ?auto_696645 ) ) ( not ( = ?auto_696644 ?auto_696647 ) ) ( not ( = ?auto_696644 ?auto_696648 ) ) ( not ( = ?auto_696644 ?auto_696651 ) ) ( not ( = ?auto_696646 ?auto_696645 ) ) ( not ( = ?auto_696646 ?auto_696647 ) ) ( not ( = ?auto_696646 ?auto_696648 ) ) ( not ( = ?auto_696646 ?auto_696651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696645 ?auto_696647 ?auto_696648 )
      ( MAKE-6CRATE-VERIFY ?auto_696642 ?auto_696643 ?auto_696644 ?auto_696646 ?auto_696645 ?auto_696647 ?auto_696648 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696706 - SURFACE
      ?auto_696707 - SURFACE
      ?auto_696708 - SURFACE
      ?auto_696710 - SURFACE
      ?auto_696709 - SURFACE
      ?auto_696711 - SURFACE
      ?auto_696712 - SURFACE
    )
    :vars
    (
      ?auto_696714 - HOIST
      ?auto_696716 - PLACE
      ?auto_696717 - PLACE
      ?auto_696715 - HOIST
      ?auto_696713 - SURFACE
      ?auto_696718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696714 ?auto_696716 ) ( IS-CRATE ?auto_696712 ) ( not ( = ?auto_696711 ?auto_696712 ) ) ( not ( = ?auto_696709 ?auto_696711 ) ) ( not ( = ?auto_696709 ?auto_696712 ) ) ( not ( = ?auto_696717 ?auto_696716 ) ) ( HOIST-AT ?auto_696715 ?auto_696717 ) ( not ( = ?auto_696714 ?auto_696715 ) ) ( AVAILABLE ?auto_696715 ) ( SURFACE-AT ?auto_696712 ?auto_696717 ) ( ON ?auto_696712 ?auto_696713 ) ( CLEAR ?auto_696712 ) ( not ( = ?auto_696711 ?auto_696713 ) ) ( not ( = ?auto_696712 ?auto_696713 ) ) ( not ( = ?auto_696709 ?auto_696713 ) ) ( TRUCK-AT ?auto_696718 ?auto_696716 ) ( SURFACE-AT ?auto_696709 ?auto_696716 ) ( CLEAR ?auto_696709 ) ( LIFTING ?auto_696714 ?auto_696711 ) ( IS-CRATE ?auto_696711 ) ( ON ?auto_696707 ?auto_696706 ) ( ON ?auto_696708 ?auto_696707 ) ( ON ?auto_696710 ?auto_696708 ) ( ON ?auto_696709 ?auto_696710 ) ( not ( = ?auto_696706 ?auto_696707 ) ) ( not ( = ?auto_696706 ?auto_696708 ) ) ( not ( = ?auto_696706 ?auto_696710 ) ) ( not ( = ?auto_696706 ?auto_696709 ) ) ( not ( = ?auto_696706 ?auto_696711 ) ) ( not ( = ?auto_696706 ?auto_696712 ) ) ( not ( = ?auto_696706 ?auto_696713 ) ) ( not ( = ?auto_696707 ?auto_696708 ) ) ( not ( = ?auto_696707 ?auto_696710 ) ) ( not ( = ?auto_696707 ?auto_696709 ) ) ( not ( = ?auto_696707 ?auto_696711 ) ) ( not ( = ?auto_696707 ?auto_696712 ) ) ( not ( = ?auto_696707 ?auto_696713 ) ) ( not ( = ?auto_696708 ?auto_696710 ) ) ( not ( = ?auto_696708 ?auto_696709 ) ) ( not ( = ?auto_696708 ?auto_696711 ) ) ( not ( = ?auto_696708 ?auto_696712 ) ) ( not ( = ?auto_696708 ?auto_696713 ) ) ( not ( = ?auto_696710 ?auto_696709 ) ) ( not ( = ?auto_696710 ?auto_696711 ) ) ( not ( = ?auto_696710 ?auto_696712 ) ) ( not ( = ?auto_696710 ?auto_696713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696709 ?auto_696711 ?auto_696712 )
      ( MAKE-6CRATE-VERIFY ?auto_696706 ?auto_696707 ?auto_696708 ?auto_696710 ?auto_696709 ?auto_696711 ?auto_696712 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696770 - SURFACE
      ?auto_696771 - SURFACE
      ?auto_696772 - SURFACE
      ?auto_696774 - SURFACE
      ?auto_696773 - SURFACE
      ?auto_696775 - SURFACE
      ?auto_696776 - SURFACE
    )
    :vars
    (
      ?auto_696778 - HOIST
      ?auto_696777 - PLACE
      ?auto_696780 - PLACE
      ?auto_696781 - HOIST
      ?auto_696782 - SURFACE
      ?auto_696779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696778 ?auto_696777 ) ( IS-CRATE ?auto_696776 ) ( not ( = ?auto_696775 ?auto_696776 ) ) ( not ( = ?auto_696773 ?auto_696775 ) ) ( not ( = ?auto_696773 ?auto_696776 ) ) ( not ( = ?auto_696780 ?auto_696777 ) ) ( HOIST-AT ?auto_696781 ?auto_696780 ) ( not ( = ?auto_696778 ?auto_696781 ) ) ( AVAILABLE ?auto_696781 ) ( SURFACE-AT ?auto_696776 ?auto_696780 ) ( ON ?auto_696776 ?auto_696782 ) ( CLEAR ?auto_696776 ) ( not ( = ?auto_696775 ?auto_696782 ) ) ( not ( = ?auto_696776 ?auto_696782 ) ) ( not ( = ?auto_696773 ?auto_696782 ) ) ( TRUCK-AT ?auto_696779 ?auto_696777 ) ( SURFACE-AT ?auto_696773 ?auto_696777 ) ( CLEAR ?auto_696773 ) ( IS-CRATE ?auto_696775 ) ( AVAILABLE ?auto_696778 ) ( IN ?auto_696775 ?auto_696779 ) ( ON ?auto_696771 ?auto_696770 ) ( ON ?auto_696772 ?auto_696771 ) ( ON ?auto_696774 ?auto_696772 ) ( ON ?auto_696773 ?auto_696774 ) ( not ( = ?auto_696770 ?auto_696771 ) ) ( not ( = ?auto_696770 ?auto_696772 ) ) ( not ( = ?auto_696770 ?auto_696774 ) ) ( not ( = ?auto_696770 ?auto_696773 ) ) ( not ( = ?auto_696770 ?auto_696775 ) ) ( not ( = ?auto_696770 ?auto_696776 ) ) ( not ( = ?auto_696770 ?auto_696782 ) ) ( not ( = ?auto_696771 ?auto_696772 ) ) ( not ( = ?auto_696771 ?auto_696774 ) ) ( not ( = ?auto_696771 ?auto_696773 ) ) ( not ( = ?auto_696771 ?auto_696775 ) ) ( not ( = ?auto_696771 ?auto_696776 ) ) ( not ( = ?auto_696771 ?auto_696782 ) ) ( not ( = ?auto_696772 ?auto_696774 ) ) ( not ( = ?auto_696772 ?auto_696773 ) ) ( not ( = ?auto_696772 ?auto_696775 ) ) ( not ( = ?auto_696772 ?auto_696776 ) ) ( not ( = ?auto_696772 ?auto_696782 ) ) ( not ( = ?auto_696774 ?auto_696773 ) ) ( not ( = ?auto_696774 ?auto_696775 ) ) ( not ( = ?auto_696774 ?auto_696776 ) ) ( not ( = ?auto_696774 ?auto_696782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696773 ?auto_696775 ?auto_696776 )
      ( MAKE-6CRATE-VERIFY ?auto_696770 ?auto_696771 ?auto_696772 ?auto_696774 ?auto_696773 ?auto_696775 ?auto_696776 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_698726 - SURFACE
      ?auto_698727 - SURFACE
      ?auto_698728 - SURFACE
      ?auto_698730 - SURFACE
      ?auto_698729 - SURFACE
      ?auto_698731 - SURFACE
      ?auto_698732 - SURFACE
      ?auto_698733 - SURFACE
    )
    :vars
    (
      ?auto_698734 - HOIST
      ?auto_698735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_698734 ?auto_698735 ) ( SURFACE-AT ?auto_698732 ?auto_698735 ) ( CLEAR ?auto_698732 ) ( LIFTING ?auto_698734 ?auto_698733 ) ( IS-CRATE ?auto_698733 ) ( not ( = ?auto_698732 ?auto_698733 ) ) ( ON ?auto_698727 ?auto_698726 ) ( ON ?auto_698728 ?auto_698727 ) ( ON ?auto_698730 ?auto_698728 ) ( ON ?auto_698729 ?auto_698730 ) ( ON ?auto_698731 ?auto_698729 ) ( ON ?auto_698732 ?auto_698731 ) ( not ( = ?auto_698726 ?auto_698727 ) ) ( not ( = ?auto_698726 ?auto_698728 ) ) ( not ( = ?auto_698726 ?auto_698730 ) ) ( not ( = ?auto_698726 ?auto_698729 ) ) ( not ( = ?auto_698726 ?auto_698731 ) ) ( not ( = ?auto_698726 ?auto_698732 ) ) ( not ( = ?auto_698726 ?auto_698733 ) ) ( not ( = ?auto_698727 ?auto_698728 ) ) ( not ( = ?auto_698727 ?auto_698730 ) ) ( not ( = ?auto_698727 ?auto_698729 ) ) ( not ( = ?auto_698727 ?auto_698731 ) ) ( not ( = ?auto_698727 ?auto_698732 ) ) ( not ( = ?auto_698727 ?auto_698733 ) ) ( not ( = ?auto_698728 ?auto_698730 ) ) ( not ( = ?auto_698728 ?auto_698729 ) ) ( not ( = ?auto_698728 ?auto_698731 ) ) ( not ( = ?auto_698728 ?auto_698732 ) ) ( not ( = ?auto_698728 ?auto_698733 ) ) ( not ( = ?auto_698730 ?auto_698729 ) ) ( not ( = ?auto_698730 ?auto_698731 ) ) ( not ( = ?auto_698730 ?auto_698732 ) ) ( not ( = ?auto_698730 ?auto_698733 ) ) ( not ( = ?auto_698729 ?auto_698731 ) ) ( not ( = ?auto_698729 ?auto_698732 ) ) ( not ( = ?auto_698729 ?auto_698733 ) ) ( not ( = ?auto_698731 ?auto_698732 ) ) ( not ( = ?auto_698731 ?auto_698733 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_698732 ?auto_698733 )
      ( MAKE-7CRATE-VERIFY ?auto_698726 ?auto_698727 ?auto_698728 ?auto_698730 ?auto_698729 ?auto_698731 ?auto_698732 ?auto_698733 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_698781 - SURFACE
      ?auto_698782 - SURFACE
      ?auto_698783 - SURFACE
      ?auto_698785 - SURFACE
      ?auto_698784 - SURFACE
      ?auto_698786 - SURFACE
      ?auto_698787 - SURFACE
      ?auto_698788 - SURFACE
    )
    :vars
    (
      ?auto_698791 - HOIST
      ?auto_698790 - PLACE
      ?auto_698789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_698791 ?auto_698790 ) ( SURFACE-AT ?auto_698787 ?auto_698790 ) ( CLEAR ?auto_698787 ) ( IS-CRATE ?auto_698788 ) ( not ( = ?auto_698787 ?auto_698788 ) ) ( TRUCK-AT ?auto_698789 ?auto_698790 ) ( AVAILABLE ?auto_698791 ) ( IN ?auto_698788 ?auto_698789 ) ( ON ?auto_698787 ?auto_698786 ) ( not ( = ?auto_698786 ?auto_698787 ) ) ( not ( = ?auto_698786 ?auto_698788 ) ) ( ON ?auto_698782 ?auto_698781 ) ( ON ?auto_698783 ?auto_698782 ) ( ON ?auto_698785 ?auto_698783 ) ( ON ?auto_698784 ?auto_698785 ) ( ON ?auto_698786 ?auto_698784 ) ( not ( = ?auto_698781 ?auto_698782 ) ) ( not ( = ?auto_698781 ?auto_698783 ) ) ( not ( = ?auto_698781 ?auto_698785 ) ) ( not ( = ?auto_698781 ?auto_698784 ) ) ( not ( = ?auto_698781 ?auto_698786 ) ) ( not ( = ?auto_698781 ?auto_698787 ) ) ( not ( = ?auto_698781 ?auto_698788 ) ) ( not ( = ?auto_698782 ?auto_698783 ) ) ( not ( = ?auto_698782 ?auto_698785 ) ) ( not ( = ?auto_698782 ?auto_698784 ) ) ( not ( = ?auto_698782 ?auto_698786 ) ) ( not ( = ?auto_698782 ?auto_698787 ) ) ( not ( = ?auto_698782 ?auto_698788 ) ) ( not ( = ?auto_698783 ?auto_698785 ) ) ( not ( = ?auto_698783 ?auto_698784 ) ) ( not ( = ?auto_698783 ?auto_698786 ) ) ( not ( = ?auto_698783 ?auto_698787 ) ) ( not ( = ?auto_698783 ?auto_698788 ) ) ( not ( = ?auto_698785 ?auto_698784 ) ) ( not ( = ?auto_698785 ?auto_698786 ) ) ( not ( = ?auto_698785 ?auto_698787 ) ) ( not ( = ?auto_698785 ?auto_698788 ) ) ( not ( = ?auto_698784 ?auto_698786 ) ) ( not ( = ?auto_698784 ?auto_698787 ) ) ( not ( = ?auto_698784 ?auto_698788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_698786 ?auto_698787 ?auto_698788 )
      ( MAKE-7CRATE-VERIFY ?auto_698781 ?auto_698782 ?auto_698783 ?auto_698785 ?auto_698784 ?auto_698786 ?auto_698787 ?auto_698788 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_698844 - SURFACE
      ?auto_698845 - SURFACE
      ?auto_698846 - SURFACE
      ?auto_698848 - SURFACE
      ?auto_698847 - SURFACE
      ?auto_698849 - SURFACE
      ?auto_698850 - SURFACE
      ?auto_698851 - SURFACE
    )
    :vars
    (
      ?auto_698853 - HOIST
      ?auto_698852 - PLACE
      ?auto_698854 - TRUCK
      ?auto_698855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_698853 ?auto_698852 ) ( SURFACE-AT ?auto_698850 ?auto_698852 ) ( CLEAR ?auto_698850 ) ( IS-CRATE ?auto_698851 ) ( not ( = ?auto_698850 ?auto_698851 ) ) ( AVAILABLE ?auto_698853 ) ( IN ?auto_698851 ?auto_698854 ) ( ON ?auto_698850 ?auto_698849 ) ( not ( = ?auto_698849 ?auto_698850 ) ) ( not ( = ?auto_698849 ?auto_698851 ) ) ( TRUCK-AT ?auto_698854 ?auto_698855 ) ( not ( = ?auto_698855 ?auto_698852 ) ) ( ON ?auto_698845 ?auto_698844 ) ( ON ?auto_698846 ?auto_698845 ) ( ON ?auto_698848 ?auto_698846 ) ( ON ?auto_698847 ?auto_698848 ) ( ON ?auto_698849 ?auto_698847 ) ( not ( = ?auto_698844 ?auto_698845 ) ) ( not ( = ?auto_698844 ?auto_698846 ) ) ( not ( = ?auto_698844 ?auto_698848 ) ) ( not ( = ?auto_698844 ?auto_698847 ) ) ( not ( = ?auto_698844 ?auto_698849 ) ) ( not ( = ?auto_698844 ?auto_698850 ) ) ( not ( = ?auto_698844 ?auto_698851 ) ) ( not ( = ?auto_698845 ?auto_698846 ) ) ( not ( = ?auto_698845 ?auto_698848 ) ) ( not ( = ?auto_698845 ?auto_698847 ) ) ( not ( = ?auto_698845 ?auto_698849 ) ) ( not ( = ?auto_698845 ?auto_698850 ) ) ( not ( = ?auto_698845 ?auto_698851 ) ) ( not ( = ?auto_698846 ?auto_698848 ) ) ( not ( = ?auto_698846 ?auto_698847 ) ) ( not ( = ?auto_698846 ?auto_698849 ) ) ( not ( = ?auto_698846 ?auto_698850 ) ) ( not ( = ?auto_698846 ?auto_698851 ) ) ( not ( = ?auto_698848 ?auto_698847 ) ) ( not ( = ?auto_698848 ?auto_698849 ) ) ( not ( = ?auto_698848 ?auto_698850 ) ) ( not ( = ?auto_698848 ?auto_698851 ) ) ( not ( = ?auto_698847 ?auto_698849 ) ) ( not ( = ?auto_698847 ?auto_698850 ) ) ( not ( = ?auto_698847 ?auto_698851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_698849 ?auto_698850 ?auto_698851 )
      ( MAKE-7CRATE-VERIFY ?auto_698844 ?auto_698845 ?auto_698846 ?auto_698848 ?auto_698847 ?auto_698849 ?auto_698850 ?auto_698851 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_698914 - SURFACE
      ?auto_698915 - SURFACE
      ?auto_698916 - SURFACE
      ?auto_698918 - SURFACE
      ?auto_698917 - SURFACE
      ?auto_698919 - SURFACE
      ?auto_698920 - SURFACE
      ?auto_698921 - SURFACE
    )
    :vars
    (
      ?auto_698922 - HOIST
      ?auto_698926 - PLACE
      ?auto_698925 - TRUCK
      ?auto_698924 - PLACE
      ?auto_698923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_698922 ?auto_698926 ) ( SURFACE-AT ?auto_698920 ?auto_698926 ) ( CLEAR ?auto_698920 ) ( IS-CRATE ?auto_698921 ) ( not ( = ?auto_698920 ?auto_698921 ) ) ( AVAILABLE ?auto_698922 ) ( ON ?auto_698920 ?auto_698919 ) ( not ( = ?auto_698919 ?auto_698920 ) ) ( not ( = ?auto_698919 ?auto_698921 ) ) ( TRUCK-AT ?auto_698925 ?auto_698924 ) ( not ( = ?auto_698924 ?auto_698926 ) ) ( HOIST-AT ?auto_698923 ?auto_698924 ) ( LIFTING ?auto_698923 ?auto_698921 ) ( not ( = ?auto_698922 ?auto_698923 ) ) ( ON ?auto_698915 ?auto_698914 ) ( ON ?auto_698916 ?auto_698915 ) ( ON ?auto_698918 ?auto_698916 ) ( ON ?auto_698917 ?auto_698918 ) ( ON ?auto_698919 ?auto_698917 ) ( not ( = ?auto_698914 ?auto_698915 ) ) ( not ( = ?auto_698914 ?auto_698916 ) ) ( not ( = ?auto_698914 ?auto_698918 ) ) ( not ( = ?auto_698914 ?auto_698917 ) ) ( not ( = ?auto_698914 ?auto_698919 ) ) ( not ( = ?auto_698914 ?auto_698920 ) ) ( not ( = ?auto_698914 ?auto_698921 ) ) ( not ( = ?auto_698915 ?auto_698916 ) ) ( not ( = ?auto_698915 ?auto_698918 ) ) ( not ( = ?auto_698915 ?auto_698917 ) ) ( not ( = ?auto_698915 ?auto_698919 ) ) ( not ( = ?auto_698915 ?auto_698920 ) ) ( not ( = ?auto_698915 ?auto_698921 ) ) ( not ( = ?auto_698916 ?auto_698918 ) ) ( not ( = ?auto_698916 ?auto_698917 ) ) ( not ( = ?auto_698916 ?auto_698919 ) ) ( not ( = ?auto_698916 ?auto_698920 ) ) ( not ( = ?auto_698916 ?auto_698921 ) ) ( not ( = ?auto_698918 ?auto_698917 ) ) ( not ( = ?auto_698918 ?auto_698919 ) ) ( not ( = ?auto_698918 ?auto_698920 ) ) ( not ( = ?auto_698918 ?auto_698921 ) ) ( not ( = ?auto_698917 ?auto_698919 ) ) ( not ( = ?auto_698917 ?auto_698920 ) ) ( not ( = ?auto_698917 ?auto_698921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_698919 ?auto_698920 ?auto_698921 )
      ( MAKE-7CRATE-VERIFY ?auto_698914 ?auto_698915 ?auto_698916 ?auto_698918 ?auto_698917 ?auto_698919 ?auto_698920 ?auto_698921 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_698991 - SURFACE
      ?auto_698992 - SURFACE
      ?auto_698993 - SURFACE
      ?auto_698995 - SURFACE
      ?auto_698994 - SURFACE
      ?auto_698996 - SURFACE
      ?auto_698997 - SURFACE
      ?auto_698998 - SURFACE
    )
    :vars
    (
      ?auto_698999 - HOIST
      ?auto_699002 - PLACE
      ?auto_699003 - TRUCK
      ?auto_699000 - PLACE
      ?auto_699004 - HOIST
      ?auto_699001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_698999 ?auto_699002 ) ( SURFACE-AT ?auto_698997 ?auto_699002 ) ( CLEAR ?auto_698997 ) ( IS-CRATE ?auto_698998 ) ( not ( = ?auto_698997 ?auto_698998 ) ) ( AVAILABLE ?auto_698999 ) ( ON ?auto_698997 ?auto_698996 ) ( not ( = ?auto_698996 ?auto_698997 ) ) ( not ( = ?auto_698996 ?auto_698998 ) ) ( TRUCK-AT ?auto_699003 ?auto_699000 ) ( not ( = ?auto_699000 ?auto_699002 ) ) ( HOIST-AT ?auto_699004 ?auto_699000 ) ( not ( = ?auto_698999 ?auto_699004 ) ) ( AVAILABLE ?auto_699004 ) ( SURFACE-AT ?auto_698998 ?auto_699000 ) ( ON ?auto_698998 ?auto_699001 ) ( CLEAR ?auto_698998 ) ( not ( = ?auto_698997 ?auto_699001 ) ) ( not ( = ?auto_698998 ?auto_699001 ) ) ( not ( = ?auto_698996 ?auto_699001 ) ) ( ON ?auto_698992 ?auto_698991 ) ( ON ?auto_698993 ?auto_698992 ) ( ON ?auto_698995 ?auto_698993 ) ( ON ?auto_698994 ?auto_698995 ) ( ON ?auto_698996 ?auto_698994 ) ( not ( = ?auto_698991 ?auto_698992 ) ) ( not ( = ?auto_698991 ?auto_698993 ) ) ( not ( = ?auto_698991 ?auto_698995 ) ) ( not ( = ?auto_698991 ?auto_698994 ) ) ( not ( = ?auto_698991 ?auto_698996 ) ) ( not ( = ?auto_698991 ?auto_698997 ) ) ( not ( = ?auto_698991 ?auto_698998 ) ) ( not ( = ?auto_698991 ?auto_699001 ) ) ( not ( = ?auto_698992 ?auto_698993 ) ) ( not ( = ?auto_698992 ?auto_698995 ) ) ( not ( = ?auto_698992 ?auto_698994 ) ) ( not ( = ?auto_698992 ?auto_698996 ) ) ( not ( = ?auto_698992 ?auto_698997 ) ) ( not ( = ?auto_698992 ?auto_698998 ) ) ( not ( = ?auto_698992 ?auto_699001 ) ) ( not ( = ?auto_698993 ?auto_698995 ) ) ( not ( = ?auto_698993 ?auto_698994 ) ) ( not ( = ?auto_698993 ?auto_698996 ) ) ( not ( = ?auto_698993 ?auto_698997 ) ) ( not ( = ?auto_698993 ?auto_698998 ) ) ( not ( = ?auto_698993 ?auto_699001 ) ) ( not ( = ?auto_698995 ?auto_698994 ) ) ( not ( = ?auto_698995 ?auto_698996 ) ) ( not ( = ?auto_698995 ?auto_698997 ) ) ( not ( = ?auto_698995 ?auto_698998 ) ) ( not ( = ?auto_698995 ?auto_699001 ) ) ( not ( = ?auto_698994 ?auto_698996 ) ) ( not ( = ?auto_698994 ?auto_698997 ) ) ( not ( = ?auto_698994 ?auto_698998 ) ) ( not ( = ?auto_698994 ?auto_699001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_698996 ?auto_698997 ?auto_698998 )
      ( MAKE-7CRATE-VERIFY ?auto_698991 ?auto_698992 ?auto_698993 ?auto_698995 ?auto_698994 ?auto_698996 ?auto_698997 ?auto_698998 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699069 - SURFACE
      ?auto_699070 - SURFACE
      ?auto_699071 - SURFACE
      ?auto_699073 - SURFACE
      ?auto_699072 - SURFACE
      ?auto_699074 - SURFACE
      ?auto_699075 - SURFACE
      ?auto_699076 - SURFACE
    )
    :vars
    (
      ?auto_699081 - HOIST
      ?auto_699080 - PLACE
      ?auto_699078 - PLACE
      ?auto_699077 - HOIST
      ?auto_699082 - SURFACE
      ?auto_699079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699081 ?auto_699080 ) ( SURFACE-AT ?auto_699075 ?auto_699080 ) ( CLEAR ?auto_699075 ) ( IS-CRATE ?auto_699076 ) ( not ( = ?auto_699075 ?auto_699076 ) ) ( AVAILABLE ?auto_699081 ) ( ON ?auto_699075 ?auto_699074 ) ( not ( = ?auto_699074 ?auto_699075 ) ) ( not ( = ?auto_699074 ?auto_699076 ) ) ( not ( = ?auto_699078 ?auto_699080 ) ) ( HOIST-AT ?auto_699077 ?auto_699078 ) ( not ( = ?auto_699081 ?auto_699077 ) ) ( AVAILABLE ?auto_699077 ) ( SURFACE-AT ?auto_699076 ?auto_699078 ) ( ON ?auto_699076 ?auto_699082 ) ( CLEAR ?auto_699076 ) ( not ( = ?auto_699075 ?auto_699082 ) ) ( not ( = ?auto_699076 ?auto_699082 ) ) ( not ( = ?auto_699074 ?auto_699082 ) ) ( TRUCK-AT ?auto_699079 ?auto_699080 ) ( ON ?auto_699070 ?auto_699069 ) ( ON ?auto_699071 ?auto_699070 ) ( ON ?auto_699073 ?auto_699071 ) ( ON ?auto_699072 ?auto_699073 ) ( ON ?auto_699074 ?auto_699072 ) ( not ( = ?auto_699069 ?auto_699070 ) ) ( not ( = ?auto_699069 ?auto_699071 ) ) ( not ( = ?auto_699069 ?auto_699073 ) ) ( not ( = ?auto_699069 ?auto_699072 ) ) ( not ( = ?auto_699069 ?auto_699074 ) ) ( not ( = ?auto_699069 ?auto_699075 ) ) ( not ( = ?auto_699069 ?auto_699076 ) ) ( not ( = ?auto_699069 ?auto_699082 ) ) ( not ( = ?auto_699070 ?auto_699071 ) ) ( not ( = ?auto_699070 ?auto_699073 ) ) ( not ( = ?auto_699070 ?auto_699072 ) ) ( not ( = ?auto_699070 ?auto_699074 ) ) ( not ( = ?auto_699070 ?auto_699075 ) ) ( not ( = ?auto_699070 ?auto_699076 ) ) ( not ( = ?auto_699070 ?auto_699082 ) ) ( not ( = ?auto_699071 ?auto_699073 ) ) ( not ( = ?auto_699071 ?auto_699072 ) ) ( not ( = ?auto_699071 ?auto_699074 ) ) ( not ( = ?auto_699071 ?auto_699075 ) ) ( not ( = ?auto_699071 ?auto_699076 ) ) ( not ( = ?auto_699071 ?auto_699082 ) ) ( not ( = ?auto_699073 ?auto_699072 ) ) ( not ( = ?auto_699073 ?auto_699074 ) ) ( not ( = ?auto_699073 ?auto_699075 ) ) ( not ( = ?auto_699073 ?auto_699076 ) ) ( not ( = ?auto_699073 ?auto_699082 ) ) ( not ( = ?auto_699072 ?auto_699074 ) ) ( not ( = ?auto_699072 ?auto_699075 ) ) ( not ( = ?auto_699072 ?auto_699076 ) ) ( not ( = ?auto_699072 ?auto_699082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699074 ?auto_699075 ?auto_699076 )
      ( MAKE-7CRATE-VERIFY ?auto_699069 ?auto_699070 ?auto_699071 ?auto_699073 ?auto_699072 ?auto_699074 ?auto_699075 ?auto_699076 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699147 - SURFACE
      ?auto_699148 - SURFACE
      ?auto_699149 - SURFACE
      ?auto_699151 - SURFACE
      ?auto_699150 - SURFACE
      ?auto_699152 - SURFACE
      ?auto_699153 - SURFACE
      ?auto_699154 - SURFACE
    )
    :vars
    (
      ?auto_699160 - HOIST
      ?auto_699157 - PLACE
      ?auto_699159 - PLACE
      ?auto_699156 - HOIST
      ?auto_699158 - SURFACE
      ?auto_699155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699160 ?auto_699157 ) ( IS-CRATE ?auto_699154 ) ( not ( = ?auto_699153 ?auto_699154 ) ) ( not ( = ?auto_699152 ?auto_699153 ) ) ( not ( = ?auto_699152 ?auto_699154 ) ) ( not ( = ?auto_699159 ?auto_699157 ) ) ( HOIST-AT ?auto_699156 ?auto_699159 ) ( not ( = ?auto_699160 ?auto_699156 ) ) ( AVAILABLE ?auto_699156 ) ( SURFACE-AT ?auto_699154 ?auto_699159 ) ( ON ?auto_699154 ?auto_699158 ) ( CLEAR ?auto_699154 ) ( not ( = ?auto_699153 ?auto_699158 ) ) ( not ( = ?auto_699154 ?auto_699158 ) ) ( not ( = ?auto_699152 ?auto_699158 ) ) ( TRUCK-AT ?auto_699155 ?auto_699157 ) ( SURFACE-AT ?auto_699152 ?auto_699157 ) ( CLEAR ?auto_699152 ) ( LIFTING ?auto_699160 ?auto_699153 ) ( IS-CRATE ?auto_699153 ) ( ON ?auto_699148 ?auto_699147 ) ( ON ?auto_699149 ?auto_699148 ) ( ON ?auto_699151 ?auto_699149 ) ( ON ?auto_699150 ?auto_699151 ) ( ON ?auto_699152 ?auto_699150 ) ( not ( = ?auto_699147 ?auto_699148 ) ) ( not ( = ?auto_699147 ?auto_699149 ) ) ( not ( = ?auto_699147 ?auto_699151 ) ) ( not ( = ?auto_699147 ?auto_699150 ) ) ( not ( = ?auto_699147 ?auto_699152 ) ) ( not ( = ?auto_699147 ?auto_699153 ) ) ( not ( = ?auto_699147 ?auto_699154 ) ) ( not ( = ?auto_699147 ?auto_699158 ) ) ( not ( = ?auto_699148 ?auto_699149 ) ) ( not ( = ?auto_699148 ?auto_699151 ) ) ( not ( = ?auto_699148 ?auto_699150 ) ) ( not ( = ?auto_699148 ?auto_699152 ) ) ( not ( = ?auto_699148 ?auto_699153 ) ) ( not ( = ?auto_699148 ?auto_699154 ) ) ( not ( = ?auto_699148 ?auto_699158 ) ) ( not ( = ?auto_699149 ?auto_699151 ) ) ( not ( = ?auto_699149 ?auto_699150 ) ) ( not ( = ?auto_699149 ?auto_699152 ) ) ( not ( = ?auto_699149 ?auto_699153 ) ) ( not ( = ?auto_699149 ?auto_699154 ) ) ( not ( = ?auto_699149 ?auto_699158 ) ) ( not ( = ?auto_699151 ?auto_699150 ) ) ( not ( = ?auto_699151 ?auto_699152 ) ) ( not ( = ?auto_699151 ?auto_699153 ) ) ( not ( = ?auto_699151 ?auto_699154 ) ) ( not ( = ?auto_699151 ?auto_699158 ) ) ( not ( = ?auto_699150 ?auto_699152 ) ) ( not ( = ?auto_699150 ?auto_699153 ) ) ( not ( = ?auto_699150 ?auto_699154 ) ) ( not ( = ?auto_699150 ?auto_699158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699152 ?auto_699153 ?auto_699154 )
      ( MAKE-7CRATE-VERIFY ?auto_699147 ?auto_699148 ?auto_699149 ?auto_699151 ?auto_699150 ?auto_699152 ?auto_699153 ?auto_699154 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699225 - SURFACE
      ?auto_699226 - SURFACE
      ?auto_699227 - SURFACE
      ?auto_699229 - SURFACE
      ?auto_699228 - SURFACE
      ?auto_699230 - SURFACE
      ?auto_699231 - SURFACE
      ?auto_699232 - SURFACE
    )
    :vars
    (
      ?auto_699236 - HOIST
      ?auto_699237 - PLACE
      ?auto_699235 - PLACE
      ?auto_699234 - HOIST
      ?auto_699238 - SURFACE
      ?auto_699233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699236 ?auto_699237 ) ( IS-CRATE ?auto_699232 ) ( not ( = ?auto_699231 ?auto_699232 ) ) ( not ( = ?auto_699230 ?auto_699231 ) ) ( not ( = ?auto_699230 ?auto_699232 ) ) ( not ( = ?auto_699235 ?auto_699237 ) ) ( HOIST-AT ?auto_699234 ?auto_699235 ) ( not ( = ?auto_699236 ?auto_699234 ) ) ( AVAILABLE ?auto_699234 ) ( SURFACE-AT ?auto_699232 ?auto_699235 ) ( ON ?auto_699232 ?auto_699238 ) ( CLEAR ?auto_699232 ) ( not ( = ?auto_699231 ?auto_699238 ) ) ( not ( = ?auto_699232 ?auto_699238 ) ) ( not ( = ?auto_699230 ?auto_699238 ) ) ( TRUCK-AT ?auto_699233 ?auto_699237 ) ( SURFACE-AT ?auto_699230 ?auto_699237 ) ( CLEAR ?auto_699230 ) ( IS-CRATE ?auto_699231 ) ( AVAILABLE ?auto_699236 ) ( IN ?auto_699231 ?auto_699233 ) ( ON ?auto_699226 ?auto_699225 ) ( ON ?auto_699227 ?auto_699226 ) ( ON ?auto_699229 ?auto_699227 ) ( ON ?auto_699228 ?auto_699229 ) ( ON ?auto_699230 ?auto_699228 ) ( not ( = ?auto_699225 ?auto_699226 ) ) ( not ( = ?auto_699225 ?auto_699227 ) ) ( not ( = ?auto_699225 ?auto_699229 ) ) ( not ( = ?auto_699225 ?auto_699228 ) ) ( not ( = ?auto_699225 ?auto_699230 ) ) ( not ( = ?auto_699225 ?auto_699231 ) ) ( not ( = ?auto_699225 ?auto_699232 ) ) ( not ( = ?auto_699225 ?auto_699238 ) ) ( not ( = ?auto_699226 ?auto_699227 ) ) ( not ( = ?auto_699226 ?auto_699229 ) ) ( not ( = ?auto_699226 ?auto_699228 ) ) ( not ( = ?auto_699226 ?auto_699230 ) ) ( not ( = ?auto_699226 ?auto_699231 ) ) ( not ( = ?auto_699226 ?auto_699232 ) ) ( not ( = ?auto_699226 ?auto_699238 ) ) ( not ( = ?auto_699227 ?auto_699229 ) ) ( not ( = ?auto_699227 ?auto_699228 ) ) ( not ( = ?auto_699227 ?auto_699230 ) ) ( not ( = ?auto_699227 ?auto_699231 ) ) ( not ( = ?auto_699227 ?auto_699232 ) ) ( not ( = ?auto_699227 ?auto_699238 ) ) ( not ( = ?auto_699229 ?auto_699228 ) ) ( not ( = ?auto_699229 ?auto_699230 ) ) ( not ( = ?auto_699229 ?auto_699231 ) ) ( not ( = ?auto_699229 ?auto_699232 ) ) ( not ( = ?auto_699229 ?auto_699238 ) ) ( not ( = ?auto_699228 ?auto_699230 ) ) ( not ( = ?auto_699228 ?auto_699231 ) ) ( not ( = ?auto_699228 ?auto_699232 ) ) ( not ( = ?auto_699228 ?auto_699238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699230 ?auto_699231 ?auto_699232 )
      ( MAKE-7CRATE-VERIFY ?auto_699225 ?auto_699226 ?auto_699227 ?auto_699229 ?auto_699228 ?auto_699230 ?auto_699231 ?auto_699232 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702144 - SURFACE
      ?auto_702145 - SURFACE
      ?auto_702146 - SURFACE
      ?auto_702148 - SURFACE
      ?auto_702147 - SURFACE
      ?auto_702149 - SURFACE
      ?auto_702150 - SURFACE
      ?auto_702151 - SURFACE
      ?auto_702152 - SURFACE
    )
    :vars
    (
      ?auto_702154 - HOIST
      ?auto_702153 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702154 ?auto_702153 ) ( SURFACE-AT ?auto_702151 ?auto_702153 ) ( CLEAR ?auto_702151 ) ( LIFTING ?auto_702154 ?auto_702152 ) ( IS-CRATE ?auto_702152 ) ( not ( = ?auto_702151 ?auto_702152 ) ) ( ON ?auto_702145 ?auto_702144 ) ( ON ?auto_702146 ?auto_702145 ) ( ON ?auto_702148 ?auto_702146 ) ( ON ?auto_702147 ?auto_702148 ) ( ON ?auto_702149 ?auto_702147 ) ( ON ?auto_702150 ?auto_702149 ) ( ON ?auto_702151 ?auto_702150 ) ( not ( = ?auto_702144 ?auto_702145 ) ) ( not ( = ?auto_702144 ?auto_702146 ) ) ( not ( = ?auto_702144 ?auto_702148 ) ) ( not ( = ?auto_702144 ?auto_702147 ) ) ( not ( = ?auto_702144 ?auto_702149 ) ) ( not ( = ?auto_702144 ?auto_702150 ) ) ( not ( = ?auto_702144 ?auto_702151 ) ) ( not ( = ?auto_702144 ?auto_702152 ) ) ( not ( = ?auto_702145 ?auto_702146 ) ) ( not ( = ?auto_702145 ?auto_702148 ) ) ( not ( = ?auto_702145 ?auto_702147 ) ) ( not ( = ?auto_702145 ?auto_702149 ) ) ( not ( = ?auto_702145 ?auto_702150 ) ) ( not ( = ?auto_702145 ?auto_702151 ) ) ( not ( = ?auto_702145 ?auto_702152 ) ) ( not ( = ?auto_702146 ?auto_702148 ) ) ( not ( = ?auto_702146 ?auto_702147 ) ) ( not ( = ?auto_702146 ?auto_702149 ) ) ( not ( = ?auto_702146 ?auto_702150 ) ) ( not ( = ?auto_702146 ?auto_702151 ) ) ( not ( = ?auto_702146 ?auto_702152 ) ) ( not ( = ?auto_702148 ?auto_702147 ) ) ( not ( = ?auto_702148 ?auto_702149 ) ) ( not ( = ?auto_702148 ?auto_702150 ) ) ( not ( = ?auto_702148 ?auto_702151 ) ) ( not ( = ?auto_702148 ?auto_702152 ) ) ( not ( = ?auto_702147 ?auto_702149 ) ) ( not ( = ?auto_702147 ?auto_702150 ) ) ( not ( = ?auto_702147 ?auto_702151 ) ) ( not ( = ?auto_702147 ?auto_702152 ) ) ( not ( = ?auto_702149 ?auto_702150 ) ) ( not ( = ?auto_702149 ?auto_702151 ) ) ( not ( = ?auto_702149 ?auto_702152 ) ) ( not ( = ?auto_702150 ?auto_702151 ) ) ( not ( = ?auto_702150 ?auto_702152 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_702151 ?auto_702152 )
      ( MAKE-8CRATE-VERIFY ?auto_702144 ?auto_702145 ?auto_702146 ?auto_702148 ?auto_702147 ?auto_702149 ?auto_702150 ?auto_702151 ?auto_702152 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702211 - SURFACE
      ?auto_702212 - SURFACE
      ?auto_702213 - SURFACE
      ?auto_702215 - SURFACE
      ?auto_702214 - SURFACE
      ?auto_702216 - SURFACE
      ?auto_702217 - SURFACE
      ?auto_702218 - SURFACE
      ?auto_702219 - SURFACE
    )
    :vars
    (
      ?auto_702220 - HOIST
      ?auto_702222 - PLACE
      ?auto_702221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702220 ?auto_702222 ) ( SURFACE-AT ?auto_702218 ?auto_702222 ) ( CLEAR ?auto_702218 ) ( IS-CRATE ?auto_702219 ) ( not ( = ?auto_702218 ?auto_702219 ) ) ( TRUCK-AT ?auto_702221 ?auto_702222 ) ( AVAILABLE ?auto_702220 ) ( IN ?auto_702219 ?auto_702221 ) ( ON ?auto_702218 ?auto_702217 ) ( not ( = ?auto_702217 ?auto_702218 ) ) ( not ( = ?auto_702217 ?auto_702219 ) ) ( ON ?auto_702212 ?auto_702211 ) ( ON ?auto_702213 ?auto_702212 ) ( ON ?auto_702215 ?auto_702213 ) ( ON ?auto_702214 ?auto_702215 ) ( ON ?auto_702216 ?auto_702214 ) ( ON ?auto_702217 ?auto_702216 ) ( not ( = ?auto_702211 ?auto_702212 ) ) ( not ( = ?auto_702211 ?auto_702213 ) ) ( not ( = ?auto_702211 ?auto_702215 ) ) ( not ( = ?auto_702211 ?auto_702214 ) ) ( not ( = ?auto_702211 ?auto_702216 ) ) ( not ( = ?auto_702211 ?auto_702217 ) ) ( not ( = ?auto_702211 ?auto_702218 ) ) ( not ( = ?auto_702211 ?auto_702219 ) ) ( not ( = ?auto_702212 ?auto_702213 ) ) ( not ( = ?auto_702212 ?auto_702215 ) ) ( not ( = ?auto_702212 ?auto_702214 ) ) ( not ( = ?auto_702212 ?auto_702216 ) ) ( not ( = ?auto_702212 ?auto_702217 ) ) ( not ( = ?auto_702212 ?auto_702218 ) ) ( not ( = ?auto_702212 ?auto_702219 ) ) ( not ( = ?auto_702213 ?auto_702215 ) ) ( not ( = ?auto_702213 ?auto_702214 ) ) ( not ( = ?auto_702213 ?auto_702216 ) ) ( not ( = ?auto_702213 ?auto_702217 ) ) ( not ( = ?auto_702213 ?auto_702218 ) ) ( not ( = ?auto_702213 ?auto_702219 ) ) ( not ( = ?auto_702215 ?auto_702214 ) ) ( not ( = ?auto_702215 ?auto_702216 ) ) ( not ( = ?auto_702215 ?auto_702217 ) ) ( not ( = ?auto_702215 ?auto_702218 ) ) ( not ( = ?auto_702215 ?auto_702219 ) ) ( not ( = ?auto_702214 ?auto_702216 ) ) ( not ( = ?auto_702214 ?auto_702217 ) ) ( not ( = ?auto_702214 ?auto_702218 ) ) ( not ( = ?auto_702214 ?auto_702219 ) ) ( not ( = ?auto_702216 ?auto_702217 ) ) ( not ( = ?auto_702216 ?auto_702218 ) ) ( not ( = ?auto_702216 ?auto_702219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702217 ?auto_702218 ?auto_702219 )
      ( MAKE-8CRATE-VERIFY ?auto_702211 ?auto_702212 ?auto_702213 ?auto_702215 ?auto_702214 ?auto_702216 ?auto_702217 ?auto_702218 ?auto_702219 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702287 - SURFACE
      ?auto_702288 - SURFACE
      ?auto_702289 - SURFACE
      ?auto_702291 - SURFACE
      ?auto_702290 - SURFACE
      ?auto_702292 - SURFACE
      ?auto_702293 - SURFACE
      ?auto_702294 - SURFACE
      ?auto_702295 - SURFACE
    )
    :vars
    (
      ?auto_702299 - HOIST
      ?auto_702296 - PLACE
      ?auto_702297 - TRUCK
      ?auto_702298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702299 ?auto_702296 ) ( SURFACE-AT ?auto_702294 ?auto_702296 ) ( CLEAR ?auto_702294 ) ( IS-CRATE ?auto_702295 ) ( not ( = ?auto_702294 ?auto_702295 ) ) ( AVAILABLE ?auto_702299 ) ( IN ?auto_702295 ?auto_702297 ) ( ON ?auto_702294 ?auto_702293 ) ( not ( = ?auto_702293 ?auto_702294 ) ) ( not ( = ?auto_702293 ?auto_702295 ) ) ( TRUCK-AT ?auto_702297 ?auto_702298 ) ( not ( = ?auto_702298 ?auto_702296 ) ) ( ON ?auto_702288 ?auto_702287 ) ( ON ?auto_702289 ?auto_702288 ) ( ON ?auto_702291 ?auto_702289 ) ( ON ?auto_702290 ?auto_702291 ) ( ON ?auto_702292 ?auto_702290 ) ( ON ?auto_702293 ?auto_702292 ) ( not ( = ?auto_702287 ?auto_702288 ) ) ( not ( = ?auto_702287 ?auto_702289 ) ) ( not ( = ?auto_702287 ?auto_702291 ) ) ( not ( = ?auto_702287 ?auto_702290 ) ) ( not ( = ?auto_702287 ?auto_702292 ) ) ( not ( = ?auto_702287 ?auto_702293 ) ) ( not ( = ?auto_702287 ?auto_702294 ) ) ( not ( = ?auto_702287 ?auto_702295 ) ) ( not ( = ?auto_702288 ?auto_702289 ) ) ( not ( = ?auto_702288 ?auto_702291 ) ) ( not ( = ?auto_702288 ?auto_702290 ) ) ( not ( = ?auto_702288 ?auto_702292 ) ) ( not ( = ?auto_702288 ?auto_702293 ) ) ( not ( = ?auto_702288 ?auto_702294 ) ) ( not ( = ?auto_702288 ?auto_702295 ) ) ( not ( = ?auto_702289 ?auto_702291 ) ) ( not ( = ?auto_702289 ?auto_702290 ) ) ( not ( = ?auto_702289 ?auto_702292 ) ) ( not ( = ?auto_702289 ?auto_702293 ) ) ( not ( = ?auto_702289 ?auto_702294 ) ) ( not ( = ?auto_702289 ?auto_702295 ) ) ( not ( = ?auto_702291 ?auto_702290 ) ) ( not ( = ?auto_702291 ?auto_702292 ) ) ( not ( = ?auto_702291 ?auto_702293 ) ) ( not ( = ?auto_702291 ?auto_702294 ) ) ( not ( = ?auto_702291 ?auto_702295 ) ) ( not ( = ?auto_702290 ?auto_702292 ) ) ( not ( = ?auto_702290 ?auto_702293 ) ) ( not ( = ?auto_702290 ?auto_702294 ) ) ( not ( = ?auto_702290 ?auto_702295 ) ) ( not ( = ?auto_702292 ?auto_702293 ) ) ( not ( = ?auto_702292 ?auto_702294 ) ) ( not ( = ?auto_702292 ?auto_702295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702293 ?auto_702294 ?auto_702295 )
      ( MAKE-8CRATE-VERIFY ?auto_702287 ?auto_702288 ?auto_702289 ?auto_702291 ?auto_702290 ?auto_702292 ?auto_702293 ?auto_702294 ?auto_702295 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702371 - SURFACE
      ?auto_702372 - SURFACE
      ?auto_702373 - SURFACE
      ?auto_702375 - SURFACE
      ?auto_702374 - SURFACE
      ?auto_702376 - SURFACE
      ?auto_702377 - SURFACE
      ?auto_702378 - SURFACE
      ?auto_702379 - SURFACE
    )
    :vars
    (
      ?auto_702382 - HOIST
      ?auto_702381 - PLACE
      ?auto_702383 - TRUCK
      ?auto_702384 - PLACE
      ?auto_702380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_702382 ?auto_702381 ) ( SURFACE-AT ?auto_702378 ?auto_702381 ) ( CLEAR ?auto_702378 ) ( IS-CRATE ?auto_702379 ) ( not ( = ?auto_702378 ?auto_702379 ) ) ( AVAILABLE ?auto_702382 ) ( ON ?auto_702378 ?auto_702377 ) ( not ( = ?auto_702377 ?auto_702378 ) ) ( not ( = ?auto_702377 ?auto_702379 ) ) ( TRUCK-AT ?auto_702383 ?auto_702384 ) ( not ( = ?auto_702384 ?auto_702381 ) ) ( HOIST-AT ?auto_702380 ?auto_702384 ) ( LIFTING ?auto_702380 ?auto_702379 ) ( not ( = ?auto_702382 ?auto_702380 ) ) ( ON ?auto_702372 ?auto_702371 ) ( ON ?auto_702373 ?auto_702372 ) ( ON ?auto_702375 ?auto_702373 ) ( ON ?auto_702374 ?auto_702375 ) ( ON ?auto_702376 ?auto_702374 ) ( ON ?auto_702377 ?auto_702376 ) ( not ( = ?auto_702371 ?auto_702372 ) ) ( not ( = ?auto_702371 ?auto_702373 ) ) ( not ( = ?auto_702371 ?auto_702375 ) ) ( not ( = ?auto_702371 ?auto_702374 ) ) ( not ( = ?auto_702371 ?auto_702376 ) ) ( not ( = ?auto_702371 ?auto_702377 ) ) ( not ( = ?auto_702371 ?auto_702378 ) ) ( not ( = ?auto_702371 ?auto_702379 ) ) ( not ( = ?auto_702372 ?auto_702373 ) ) ( not ( = ?auto_702372 ?auto_702375 ) ) ( not ( = ?auto_702372 ?auto_702374 ) ) ( not ( = ?auto_702372 ?auto_702376 ) ) ( not ( = ?auto_702372 ?auto_702377 ) ) ( not ( = ?auto_702372 ?auto_702378 ) ) ( not ( = ?auto_702372 ?auto_702379 ) ) ( not ( = ?auto_702373 ?auto_702375 ) ) ( not ( = ?auto_702373 ?auto_702374 ) ) ( not ( = ?auto_702373 ?auto_702376 ) ) ( not ( = ?auto_702373 ?auto_702377 ) ) ( not ( = ?auto_702373 ?auto_702378 ) ) ( not ( = ?auto_702373 ?auto_702379 ) ) ( not ( = ?auto_702375 ?auto_702374 ) ) ( not ( = ?auto_702375 ?auto_702376 ) ) ( not ( = ?auto_702375 ?auto_702377 ) ) ( not ( = ?auto_702375 ?auto_702378 ) ) ( not ( = ?auto_702375 ?auto_702379 ) ) ( not ( = ?auto_702374 ?auto_702376 ) ) ( not ( = ?auto_702374 ?auto_702377 ) ) ( not ( = ?auto_702374 ?auto_702378 ) ) ( not ( = ?auto_702374 ?auto_702379 ) ) ( not ( = ?auto_702376 ?auto_702377 ) ) ( not ( = ?auto_702376 ?auto_702378 ) ) ( not ( = ?auto_702376 ?auto_702379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702377 ?auto_702378 ?auto_702379 )
      ( MAKE-8CRATE-VERIFY ?auto_702371 ?auto_702372 ?auto_702373 ?auto_702375 ?auto_702374 ?auto_702376 ?auto_702377 ?auto_702378 ?auto_702379 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702463 - SURFACE
      ?auto_702464 - SURFACE
      ?auto_702465 - SURFACE
      ?auto_702467 - SURFACE
      ?auto_702466 - SURFACE
      ?auto_702468 - SURFACE
      ?auto_702469 - SURFACE
      ?auto_702470 - SURFACE
      ?auto_702471 - SURFACE
    )
    :vars
    (
      ?auto_702477 - HOIST
      ?auto_702473 - PLACE
      ?auto_702472 - TRUCK
      ?auto_702476 - PLACE
      ?auto_702475 - HOIST
      ?auto_702474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702477 ?auto_702473 ) ( SURFACE-AT ?auto_702470 ?auto_702473 ) ( CLEAR ?auto_702470 ) ( IS-CRATE ?auto_702471 ) ( not ( = ?auto_702470 ?auto_702471 ) ) ( AVAILABLE ?auto_702477 ) ( ON ?auto_702470 ?auto_702469 ) ( not ( = ?auto_702469 ?auto_702470 ) ) ( not ( = ?auto_702469 ?auto_702471 ) ) ( TRUCK-AT ?auto_702472 ?auto_702476 ) ( not ( = ?auto_702476 ?auto_702473 ) ) ( HOIST-AT ?auto_702475 ?auto_702476 ) ( not ( = ?auto_702477 ?auto_702475 ) ) ( AVAILABLE ?auto_702475 ) ( SURFACE-AT ?auto_702471 ?auto_702476 ) ( ON ?auto_702471 ?auto_702474 ) ( CLEAR ?auto_702471 ) ( not ( = ?auto_702470 ?auto_702474 ) ) ( not ( = ?auto_702471 ?auto_702474 ) ) ( not ( = ?auto_702469 ?auto_702474 ) ) ( ON ?auto_702464 ?auto_702463 ) ( ON ?auto_702465 ?auto_702464 ) ( ON ?auto_702467 ?auto_702465 ) ( ON ?auto_702466 ?auto_702467 ) ( ON ?auto_702468 ?auto_702466 ) ( ON ?auto_702469 ?auto_702468 ) ( not ( = ?auto_702463 ?auto_702464 ) ) ( not ( = ?auto_702463 ?auto_702465 ) ) ( not ( = ?auto_702463 ?auto_702467 ) ) ( not ( = ?auto_702463 ?auto_702466 ) ) ( not ( = ?auto_702463 ?auto_702468 ) ) ( not ( = ?auto_702463 ?auto_702469 ) ) ( not ( = ?auto_702463 ?auto_702470 ) ) ( not ( = ?auto_702463 ?auto_702471 ) ) ( not ( = ?auto_702463 ?auto_702474 ) ) ( not ( = ?auto_702464 ?auto_702465 ) ) ( not ( = ?auto_702464 ?auto_702467 ) ) ( not ( = ?auto_702464 ?auto_702466 ) ) ( not ( = ?auto_702464 ?auto_702468 ) ) ( not ( = ?auto_702464 ?auto_702469 ) ) ( not ( = ?auto_702464 ?auto_702470 ) ) ( not ( = ?auto_702464 ?auto_702471 ) ) ( not ( = ?auto_702464 ?auto_702474 ) ) ( not ( = ?auto_702465 ?auto_702467 ) ) ( not ( = ?auto_702465 ?auto_702466 ) ) ( not ( = ?auto_702465 ?auto_702468 ) ) ( not ( = ?auto_702465 ?auto_702469 ) ) ( not ( = ?auto_702465 ?auto_702470 ) ) ( not ( = ?auto_702465 ?auto_702471 ) ) ( not ( = ?auto_702465 ?auto_702474 ) ) ( not ( = ?auto_702467 ?auto_702466 ) ) ( not ( = ?auto_702467 ?auto_702468 ) ) ( not ( = ?auto_702467 ?auto_702469 ) ) ( not ( = ?auto_702467 ?auto_702470 ) ) ( not ( = ?auto_702467 ?auto_702471 ) ) ( not ( = ?auto_702467 ?auto_702474 ) ) ( not ( = ?auto_702466 ?auto_702468 ) ) ( not ( = ?auto_702466 ?auto_702469 ) ) ( not ( = ?auto_702466 ?auto_702470 ) ) ( not ( = ?auto_702466 ?auto_702471 ) ) ( not ( = ?auto_702466 ?auto_702474 ) ) ( not ( = ?auto_702468 ?auto_702469 ) ) ( not ( = ?auto_702468 ?auto_702470 ) ) ( not ( = ?auto_702468 ?auto_702471 ) ) ( not ( = ?auto_702468 ?auto_702474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702469 ?auto_702470 ?auto_702471 )
      ( MAKE-8CRATE-VERIFY ?auto_702463 ?auto_702464 ?auto_702465 ?auto_702467 ?auto_702466 ?auto_702468 ?auto_702469 ?auto_702470 ?auto_702471 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702556 - SURFACE
      ?auto_702557 - SURFACE
      ?auto_702558 - SURFACE
      ?auto_702560 - SURFACE
      ?auto_702559 - SURFACE
      ?auto_702561 - SURFACE
      ?auto_702562 - SURFACE
      ?auto_702563 - SURFACE
      ?auto_702564 - SURFACE
    )
    :vars
    (
      ?auto_702570 - HOIST
      ?auto_702566 - PLACE
      ?auto_702568 - PLACE
      ?auto_702565 - HOIST
      ?auto_702567 - SURFACE
      ?auto_702569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702570 ?auto_702566 ) ( SURFACE-AT ?auto_702563 ?auto_702566 ) ( CLEAR ?auto_702563 ) ( IS-CRATE ?auto_702564 ) ( not ( = ?auto_702563 ?auto_702564 ) ) ( AVAILABLE ?auto_702570 ) ( ON ?auto_702563 ?auto_702562 ) ( not ( = ?auto_702562 ?auto_702563 ) ) ( not ( = ?auto_702562 ?auto_702564 ) ) ( not ( = ?auto_702568 ?auto_702566 ) ) ( HOIST-AT ?auto_702565 ?auto_702568 ) ( not ( = ?auto_702570 ?auto_702565 ) ) ( AVAILABLE ?auto_702565 ) ( SURFACE-AT ?auto_702564 ?auto_702568 ) ( ON ?auto_702564 ?auto_702567 ) ( CLEAR ?auto_702564 ) ( not ( = ?auto_702563 ?auto_702567 ) ) ( not ( = ?auto_702564 ?auto_702567 ) ) ( not ( = ?auto_702562 ?auto_702567 ) ) ( TRUCK-AT ?auto_702569 ?auto_702566 ) ( ON ?auto_702557 ?auto_702556 ) ( ON ?auto_702558 ?auto_702557 ) ( ON ?auto_702560 ?auto_702558 ) ( ON ?auto_702559 ?auto_702560 ) ( ON ?auto_702561 ?auto_702559 ) ( ON ?auto_702562 ?auto_702561 ) ( not ( = ?auto_702556 ?auto_702557 ) ) ( not ( = ?auto_702556 ?auto_702558 ) ) ( not ( = ?auto_702556 ?auto_702560 ) ) ( not ( = ?auto_702556 ?auto_702559 ) ) ( not ( = ?auto_702556 ?auto_702561 ) ) ( not ( = ?auto_702556 ?auto_702562 ) ) ( not ( = ?auto_702556 ?auto_702563 ) ) ( not ( = ?auto_702556 ?auto_702564 ) ) ( not ( = ?auto_702556 ?auto_702567 ) ) ( not ( = ?auto_702557 ?auto_702558 ) ) ( not ( = ?auto_702557 ?auto_702560 ) ) ( not ( = ?auto_702557 ?auto_702559 ) ) ( not ( = ?auto_702557 ?auto_702561 ) ) ( not ( = ?auto_702557 ?auto_702562 ) ) ( not ( = ?auto_702557 ?auto_702563 ) ) ( not ( = ?auto_702557 ?auto_702564 ) ) ( not ( = ?auto_702557 ?auto_702567 ) ) ( not ( = ?auto_702558 ?auto_702560 ) ) ( not ( = ?auto_702558 ?auto_702559 ) ) ( not ( = ?auto_702558 ?auto_702561 ) ) ( not ( = ?auto_702558 ?auto_702562 ) ) ( not ( = ?auto_702558 ?auto_702563 ) ) ( not ( = ?auto_702558 ?auto_702564 ) ) ( not ( = ?auto_702558 ?auto_702567 ) ) ( not ( = ?auto_702560 ?auto_702559 ) ) ( not ( = ?auto_702560 ?auto_702561 ) ) ( not ( = ?auto_702560 ?auto_702562 ) ) ( not ( = ?auto_702560 ?auto_702563 ) ) ( not ( = ?auto_702560 ?auto_702564 ) ) ( not ( = ?auto_702560 ?auto_702567 ) ) ( not ( = ?auto_702559 ?auto_702561 ) ) ( not ( = ?auto_702559 ?auto_702562 ) ) ( not ( = ?auto_702559 ?auto_702563 ) ) ( not ( = ?auto_702559 ?auto_702564 ) ) ( not ( = ?auto_702559 ?auto_702567 ) ) ( not ( = ?auto_702561 ?auto_702562 ) ) ( not ( = ?auto_702561 ?auto_702563 ) ) ( not ( = ?auto_702561 ?auto_702564 ) ) ( not ( = ?auto_702561 ?auto_702567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702562 ?auto_702563 ?auto_702564 )
      ( MAKE-8CRATE-VERIFY ?auto_702556 ?auto_702557 ?auto_702558 ?auto_702560 ?auto_702559 ?auto_702561 ?auto_702562 ?auto_702563 ?auto_702564 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702649 - SURFACE
      ?auto_702650 - SURFACE
      ?auto_702651 - SURFACE
      ?auto_702653 - SURFACE
      ?auto_702652 - SURFACE
      ?auto_702654 - SURFACE
      ?auto_702655 - SURFACE
      ?auto_702656 - SURFACE
      ?auto_702657 - SURFACE
    )
    :vars
    (
      ?auto_702663 - HOIST
      ?auto_702660 - PLACE
      ?auto_702659 - PLACE
      ?auto_702662 - HOIST
      ?auto_702661 - SURFACE
      ?auto_702658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702663 ?auto_702660 ) ( IS-CRATE ?auto_702657 ) ( not ( = ?auto_702656 ?auto_702657 ) ) ( not ( = ?auto_702655 ?auto_702656 ) ) ( not ( = ?auto_702655 ?auto_702657 ) ) ( not ( = ?auto_702659 ?auto_702660 ) ) ( HOIST-AT ?auto_702662 ?auto_702659 ) ( not ( = ?auto_702663 ?auto_702662 ) ) ( AVAILABLE ?auto_702662 ) ( SURFACE-AT ?auto_702657 ?auto_702659 ) ( ON ?auto_702657 ?auto_702661 ) ( CLEAR ?auto_702657 ) ( not ( = ?auto_702656 ?auto_702661 ) ) ( not ( = ?auto_702657 ?auto_702661 ) ) ( not ( = ?auto_702655 ?auto_702661 ) ) ( TRUCK-AT ?auto_702658 ?auto_702660 ) ( SURFACE-AT ?auto_702655 ?auto_702660 ) ( CLEAR ?auto_702655 ) ( LIFTING ?auto_702663 ?auto_702656 ) ( IS-CRATE ?auto_702656 ) ( ON ?auto_702650 ?auto_702649 ) ( ON ?auto_702651 ?auto_702650 ) ( ON ?auto_702653 ?auto_702651 ) ( ON ?auto_702652 ?auto_702653 ) ( ON ?auto_702654 ?auto_702652 ) ( ON ?auto_702655 ?auto_702654 ) ( not ( = ?auto_702649 ?auto_702650 ) ) ( not ( = ?auto_702649 ?auto_702651 ) ) ( not ( = ?auto_702649 ?auto_702653 ) ) ( not ( = ?auto_702649 ?auto_702652 ) ) ( not ( = ?auto_702649 ?auto_702654 ) ) ( not ( = ?auto_702649 ?auto_702655 ) ) ( not ( = ?auto_702649 ?auto_702656 ) ) ( not ( = ?auto_702649 ?auto_702657 ) ) ( not ( = ?auto_702649 ?auto_702661 ) ) ( not ( = ?auto_702650 ?auto_702651 ) ) ( not ( = ?auto_702650 ?auto_702653 ) ) ( not ( = ?auto_702650 ?auto_702652 ) ) ( not ( = ?auto_702650 ?auto_702654 ) ) ( not ( = ?auto_702650 ?auto_702655 ) ) ( not ( = ?auto_702650 ?auto_702656 ) ) ( not ( = ?auto_702650 ?auto_702657 ) ) ( not ( = ?auto_702650 ?auto_702661 ) ) ( not ( = ?auto_702651 ?auto_702653 ) ) ( not ( = ?auto_702651 ?auto_702652 ) ) ( not ( = ?auto_702651 ?auto_702654 ) ) ( not ( = ?auto_702651 ?auto_702655 ) ) ( not ( = ?auto_702651 ?auto_702656 ) ) ( not ( = ?auto_702651 ?auto_702657 ) ) ( not ( = ?auto_702651 ?auto_702661 ) ) ( not ( = ?auto_702653 ?auto_702652 ) ) ( not ( = ?auto_702653 ?auto_702654 ) ) ( not ( = ?auto_702653 ?auto_702655 ) ) ( not ( = ?auto_702653 ?auto_702656 ) ) ( not ( = ?auto_702653 ?auto_702657 ) ) ( not ( = ?auto_702653 ?auto_702661 ) ) ( not ( = ?auto_702652 ?auto_702654 ) ) ( not ( = ?auto_702652 ?auto_702655 ) ) ( not ( = ?auto_702652 ?auto_702656 ) ) ( not ( = ?auto_702652 ?auto_702657 ) ) ( not ( = ?auto_702652 ?auto_702661 ) ) ( not ( = ?auto_702654 ?auto_702655 ) ) ( not ( = ?auto_702654 ?auto_702656 ) ) ( not ( = ?auto_702654 ?auto_702657 ) ) ( not ( = ?auto_702654 ?auto_702661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702655 ?auto_702656 ?auto_702657 )
      ( MAKE-8CRATE-VERIFY ?auto_702649 ?auto_702650 ?auto_702651 ?auto_702653 ?auto_702652 ?auto_702654 ?auto_702655 ?auto_702656 ?auto_702657 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702742 - SURFACE
      ?auto_702743 - SURFACE
      ?auto_702744 - SURFACE
      ?auto_702746 - SURFACE
      ?auto_702745 - SURFACE
      ?auto_702747 - SURFACE
      ?auto_702748 - SURFACE
      ?auto_702749 - SURFACE
      ?auto_702750 - SURFACE
    )
    :vars
    (
      ?auto_702753 - HOIST
      ?auto_702754 - PLACE
      ?auto_702755 - PLACE
      ?auto_702751 - HOIST
      ?auto_702756 - SURFACE
      ?auto_702752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702753 ?auto_702754 ) ( IS-CRATE ?auto_702750 ) ( not ( = ?auto_702749 ?auto_702750 ) ) ( not ( = ?auto_702748 ?auto_702749 ) ) ( not ( = ?auto_702748 ?auto_702750 ) ) ( not ( = ?auto_702755 ?auto_702754 ) ) ( HOIST-AT ?auto_702751 ?auto_702755 ) ( not ( = ?auto_702753 ?auto_702751 ) ) ( AVAILABLE ?auto_702751 ) ( SURFACE-AT ?auto_702750 ?auto_702755 ) ( ON ?auto_702750 ?auto_702756 ) ( CLEAR ?auto_702750 ) ( not ( = ?auto_702749 ?auto_702756 ) ) ( not ( = ?auto_702750 ?auto_702756 ) ) ( not ( = ?auto_702748 ?auto_702756 ) ) ( TRUCK-AT ?auto_702752 ?auto_702754 ) ( SURFACE-AT ?auto_702748 ?auto_702754 ) ( CLEAR ?auto_702748 ) ( IS-CRATE ?auto_702749 ) ( AVAILABLE ?auto_702753 ) ( IN ?auto_702749 ?auto_702752 ) ( ON ?auto_702743 ?auto_702742 ) ( ON ?auto_702744 ?auto_702743 ) ( ON ?auto_702746 ?auto_702744 ) ( ON ?auto_702745 ?auto_702746 ) ( ON ?auto_702747 ?auto_702745 ) ( ON ?auto_702748 ?auto_702747 ) ( not ( = ?auto_702742 ?auto_702743 ) ) ( not ( = ?auto_702742 ?auto_702744 ) ) ( not ( = ?auto_702742 ?auto_702746 ) ) ( not ( = ?auto_702742 ?auto_702745 ) ) ( not ( = ?auto_702742 ?auto_702747 ) ) ( not ( = ?auto_702742 ?auto_702748 ) ) ( not ( = ?auto_702742 ?auto_702749 ) ) ( not ( = ?auto_702742 ?auto_702750 ) ) ( not ( = ?auto_702742 ?auto_702756 ) ) ( not ( = ?auto_702743 ?auto_702744 ) ) ( not ( = ?auto_702743 ?auto_702746 ) ) ( not ( = ?auto_702743 ?auto_702745 ) ) ( not ( = ?auto_702743 ?auto_702747 ) ) ( not ( = ?auto_702743 ?auto_702748 ) ) ( not ( = ?auto_702743 ?auto_702749 ) ) ( not ( = ?auto_702743 ?auto_702750 ) ) ( not ( = ?auto_702743 ?auto_702756 ) ) ( not ( = ?auto_702744 ?auto_702746 ) ) ( not ( = ?auto_702744 ?auto_702745 ) ) ( not ( = ?auto_702744 ?auto_702747 ) ) ( not ( = ?auto_702744 ?auto_702748 ) ) ( not ( = ?auto_702744 ?auto_702749 ) ) ( not ( = ?auto_702744 ?auto_702750 ) ) ( not ( = ?auto_702744 ?auto_702756 ) ) ( not ( = ?auto_702746 ?auto_702745 ) ) ( not ( = ?auto_702746 ?auto_702747 ) ) ( not ( = ?auto_702746 ?auto_702748 ) ) ( not ( = ?auto_702746 ?auto_702749 ) ) ( not ( = ?auto_702746 ?auto_702750 ) ) ( not ( = ?auto_702746 ?auto_702756 ) ) ( not ( = ?auto_702745 ?auto_702747 ) ) ( not ( = ?auto_702745 ?auto_702748 ) ) ( not ( = ?auto_702745 ?auto_702749 ) ) ( not ( = ?auto_702745 ?auto_702750 ) ) ( not ( = ?auto_702745 ?auto_702756 ) ) ( not ( = ?auto_702747 ?auto_702748 ) ) ( not ( = ?auto_702747 ?auto_702749 ) ) ( not ( = ?auto_702747 ?auto_702750 ) ) ( not ( = ?auto_702747 ?auto_702756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702748 ?auto_702749 ?auto_702750 )
      ( MAKE-8CRATE-VERIFY ?auto_702742 ?auto_702743 ?auto_702744 ?auto_702746 ?auto_702745 ?auto_702747 ?auto_702748 ?auto_702749 ?auto_702750 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_706858 - SURFACE
      ?auto_706859 - SURFACE
      ?auto_706860 - SURFACE
      ?auto_706862 - SURFACE
      ?auto_706861 - SURFACE
      ?auto_706863 - SURFACE
      ?auto_706864 - SURFACE
      ?auto_706865 - SURFACE
      ?auto_706866 - SURFACE
      ?auto_706867 - SURFACE
    )
    :vars
    (
      ?auto_706868 - HOIST
      ?auto_706869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_706868 ?auto_706869 ) ( SURFACE-AT ?auto_706866 ?auto_706869 ) ( CLEAR ?auto_706866 ) ( LIFTING ?auto_706868 ?auto_706867 ) ( IS-CRATE ?auto_706867 ) ( not ( = ?auto_706866 ?auto_706867 ) ) ( ON ?auto_706859 ?auto_706858 ) ( ON ?auto_706860 ?auto_706859 ) ( ON ?auto_706862 ?auto_706860 ) ( ON ?auto_706861 ?auto_706862 ) ( ON ?auto_706863 ?auto_706861 ) ( ON ?auto_706864 ?auto_706863 ) ( ON ?auto_706865 ?auto_706864 ) ( ON ?auto_706866 ?auto_706865 ) ( not ( = ?auto_706858 ?auto_706859 ) ) ( not ( = ?auto_706858 ?auto_706860 ) ) ( not ( = ?auto_706858 ?auto_706862 ) ) ( not ( = ?auto_706858 ?auto_706861 ) ) ( not ( = ?auto_706858 ?auto_706863 ) ) ( not ( = ?auto_706858 ?auto_706864 ) ) ( not ( = ?auto_706858 ?auto_706865 ) ) ( not ( = ?auto_706858 ?auto_706866 ) ) ( not ( = ?auto_706858 ?auto_706867 ) ) ( not ( = ?auto_706859 ?auto_706860 ) ) ( not ( = ?auto_706859 ?auto_706862 ) ) ( not ( = ?auto_706859 ?auto_706861 ) ) ( not ( = ?auto_706859 ?auto_706863 ) ) ( not ( = ?auto_706859 ?auto_706864 ) ) ( not ( = ?auto_706859 ?auto_706865 ) ) ( not ( = ?auto_706859 ?auto_706866 ) ) ( not ( = ?auto_706859 ?auto_706867 ) ) ( not ( = ?auto_706860 ?auto_706862 ) ) ( not ( = ?auto_706860 ?auto_706861 ) ) ( not ( = ?auto_706860 ?auto_706863 ) ) ( not ( = ?auto_706860 ?auto_706864 ) ) ( not ( = ?auto_706860 ?auto_706865 ) ) ( not ( = ?auto_706860 ?auto_706866 ) ) ( not ( = ?auto_706860 ?auto_706867 ) ) ( not ( = ?auto_706862 ?auto_706861 ) ) ( not ( = ?auto_706862 ?auto_706863 ) ) ( not ( = ?auto_706862 ?auto_706864 ) ) ( not ( = ?auto_706862 ?auto_706865 ) ) ( not ( = ?auto_706862 ?auto_706866 ) ) ( not ( = ?auto_706862 ?auto_706867 ) ) ( not ( = ?auto_706861 ?auto_706863 ) ) ( not ( = ?auto_706861 ?auto_706864 ) ) ( not ( = ?auto_706861 ?auto_706865 ) ) ( not ( = ?auto_706861 ?auto_706866 ) ) ( not ( = ?auto_706861 ?auto_706867 ) ) ( not ( = ?auto_706863 ?auto_706864 ) ) ( not ( = ?auto_706863 ?auto_706865 ) ) ( not ( = ?auto_706863 ?auto_706866 ) ) ( not ( = ?auto_706863 ?auto_706867 ) ) ( not ( = ?auto_706864 ?auto_706865 ) ) ( not ( = ?auto_706864 ?auto_706866 ) ) ( not ( = ?auto_706864 ?auto_706867 ) ) ( not ( = ?auto_706865 ?auto_706866 ) ) ( not ( = ?auto_706865 ?auto_706867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_706866 ?auto_706867 )
      ( MAKE-9CRATE-VERIFY ?auto_706858 ?auto_706859 ?auto_706860 ?auto_706862 ?auto_706861 ?auto_706863 ?auto_706864 ?auto_706865 ?auto_706866 ?auto_706867 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_706938 - SURFACE
      ?auto_706939 - SURFACE
      ?auto_706940 - SURFACE
      ?auto_706942 - SURFACE
      ?auto_706941 - SURFACE
      ?auto_706943 - SURFACE
      ?auto_706944 - SURFACE
      ?auto_706945 - SURFACE
      ?auto_706946 - SURFACE
      ?auto_706947 - SURFACE
    )
    :vars
    (
      ?auto_706948 - HOIST
      ?auto_706949 - PLACE
      ?auto_706950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_706948 ?auto_706949 ) ( SURFACE-AT ?auto_706946 ?auto_706949 ) ( CLEAR ?auto_706946 ) ( IS-CRATE ?auto_706947 ) ( not ( = ?auto_706946 ?auto_706947 ) ) ( TRUCK-AT ?auto_706950 ?auto_706949 ) ( AVAILABLE ?auto_706948 ) ( IN ?auto_706947 ?auto_706950 ) ( ON ?auto_706946 ?auto_706945 ) ( not ( = ?auto_706945 ?auto_706946 ) ) ( not ( = ?auto_706945 ?auto_706947 ) ) ( ON ?auto_706939 ?auto_706938 ) ( ON ?auto_706940 ?auto_706939 ) ( ON ?auto_706942 ?auto_706940 ) ( ON ?auto_706941 ?auto_706942 ) ( ON ?auto_706943 ?auto_706941 ) ( ON ?auto_706944 ?auto_706943 ) ( ON ?auto_706945 ?auto_706944 ) ( not ( = ?auto_706938 ?auto_706939 ) ) ( not ( = ?auto_706938 ?auto_706940 ) ) ( not ( = ?auto_706938 ?auto_706942 ) ) ( not ( = ?auto_706938 ?auto_706941 ) ) ( not ( = ?auto_706938 ?auto_706943 ) ) ( not ( = ?auto_706938 ?auto_706944 ) ) ( not ( = ?auto_706938 ?auto_706945 ) ) ( not ( = ?auto_706938 ?auto_706946 ) ) ( not ( = ?auto_706938 ?auto_706947 ) ) ( not ( = ?auto_706939 ?auto_706940 ) ) ( not ( = ?auto_706939 ?auto_706942 ) ) ( not ( = ?auto_706939 ?auto_706941 ) ) ( not ( = ?auto_706939 ?auto_706943 ) ) ( not ( = ?auto_706939 ?auto_706944 ) ) ( not ( = ?auto_706939 ?auto_706945 ) ) ( not ( = ?auto_706939 ?auto_706946 ) ) ( not ( = ?auto_706939 ?auto_706947 ) ) ( not ( = ?auto_706940 ?auto_706942 ) ) ( not ( = ?auto_706940 ?auto_706941 ) ) ( not ( = ?auto_706940 ?auto_706943 ) ) ( not ( = ?auto_706940 ?auto_706944 ) ) ( not ( = ?auto_706940 ?auto_706945 ) ) ( not ( = ?auto_706940 ?auto_706946 ) ) ( not ( = ?auto_706940 ?auto_706947 ) ) ( not ( = ?auto_706942 ?auto_706941 ) ) ( not ( = ?auto_706942 ?auto_706943 ) ) ( not ( = ?auto_706942 ?auto_706944 ) ) ( not ( = ?auto_706942 ?auto_706945 ) ) ( not ( = ?auto_706942 ?auto_706946 ) ) ( not ( = ?auto_706942 ?auto_706947 ) ) ( not ( = ?auto_706941 ?auto_706943 ) ) ( not ( = ?auto_706941 ?auto_706944 ) ) ( not ( = ?auto_706941 ?auto_706945 ) ) ( not ( = ?auto_706941 ?auto_706946 ) ) ( not ( = ?auto_706941 ?auto_706947 ) ) ( not ( = ?auto_706943 ?auto_706944 ) ) ( not ( = ?auto_706943 ?auto_706945 ) ) ( not ( = ?auto_706943 ?auto_706946 ) ) ( not ( = ?auto_706943 ?auto_706947 ) ) ( not ( = ?auto_706944 ?auto_706945 ) ) ( not ( = ?auto_706944 ?auto_706946 ) ) ( not ( = ?auto_706944 ?auto_706947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_706945 ?auto_706946 ?auto_706947 )
      ( MAKE-9CRATE-VERIFY ?auto_706938 ?auto_706939 ?auto_706940 ?auto_706942 ?auto_706941 ?auto_706943 ?auto_706944 ?auto_706945 ?auto_706946 ?auto_706947 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707028 - SURFACE
      ?auto_707029 - SURFACE
      ?auto_707030 - SURFACE
      ?auto_707032 - SURFACE
      ?auto_707031 - SURFACE
      ?auto_707033 - SURFACE
      ?auto_707034 - SURFACE
      ?auto_707035 - SURFACE
      ?auto_707036 - SURFACE
      ?auto_707037 - SURFACE
    )
    :vars
    (
      ?auto_707039 - HOIST
      ?auto_707040 - PLACE
      ?auto_707041 - TRUCK
      ?auto_707038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707039 ?auto_707040 ) ( SURFACE-AT ?auto_707036 ?auto_707040 ) ( CLEAR ?auto_707036 ) ( IS-CRATE ?auto_707037 ) ( not ( = ?auto_707036 ?auto_707037 ) ) ( AVAILABLE ?auto_707039 ) ( IN ?auto_707037 ?auto_707041 ) ( ON ?auto_707036 ?auto_707035 ) ( not ( = ?auto_707035 ?auto_707036 ) ) ( not ( = ?auto_707035 ?auto_707037 ) ) ( TRUCK-AT ?auto_707041 ?auto_707038 ) ( not ( = ?auto_707038 ?auto_707040 ) ) ( ON ?auto_707029 ?auto_707028 ) ( ON ?auto_707030 ?auto_707029 ) ( ON ?auto_707032 ?auto_707030 ) ( ON ?auto_707031 ?auto_707032 ) ( ON ?auto_707033 ?auto_707031 ) ( ON ?auto_707034 ?auto_707033 ) ( ON ?auto_707035 ?auto_707034 ) ( not ( = ?auto_707028 ?auto_707029 ) ) ( not ( = ?auto_707028 ?auto_707030 ) ) ( not ( = ?auto_707028 ?auto_707032 ) ) ( not ( = ?auto_707028 ?auto_707031 ) ) ( not ( = ?auto_707028 ?auto_707033 ) ) ( not ( = ?auto_707028 ?auto_707034 ) ) ( not ( = ?auto_707028 ?auto_707035 ) ) ( not ( = ?auto_707028 ?auto_707036 ) ) ( not ( = ?auto_707028 ?auto_707037 ) ) ( not ( = ?auto_707029 ?auto_707030 ) ) ( not ( = ?auto_707029 ?auto_707032 ) ) ( not ( = ?auto_707029 ?auto_707031 ) ) ( not ( = ?auto_707029 ?auto_707033 ) ) ( not ( = ?auto_707029 ?auto_707034 ) ) ( not ( = ?auto_707029 ?auto_707035 ) ) ( not ( = ?auto_707029 ?auto_707036 ) ) ( not ( = ?auto_707029 ?auto_707037 ) ) ( not ( = ?auto_707030 ?auto_707032 ) ) ( not ( = ?auto_707030 ?auto_707031 ) ) ( not ( = ?auto_707030 ?auto_707033 ) ) ( not ( = ?auto_707030 ?auto_707034 ) ) ( not ( = ?auto_707030 ?auto_707035 ) ) ( not ( = ?auto_707030 ?auto_707036 ) ) ( not ( = ?auto_707030 ?auto_707037 ) ) ( not ( = ?auto_707032 ?auto_707031 ) ) ( not ( = ?auto_707032 ?auto_707033 ) ) ( not ( = ?auto_707032 ?auto_707034 ) ) ( not ( = ?auto_707032 ?auto_707035 ) ) ( not ( = ?auto_707032 ?auto_707036 ) ) ( not ( = ?auto_707032 ?auto_707037 ) ) ( not ( = ?auto_707031 ?auto_707033 ) ) ( not ( = ?auto_707031 ?auto_707034 ) ) ( not ( = ?auto_707031 ?auto_707035 ) ) ( not ( = ?auto_707031 ?auto_707036 ) ) ( not ( = ?auto_707031 ?auto_707037 ) ) ( not ( = ?auto_707033 ?auto_707034 ) ) ( not ( = ?auto_707033 ?auto_707035 ) ) ( not ( = ?auto_707033 ?auto_707036 ) ) ( not ( = ?auto_707033 ?auto_707037 ) ) ( not ( = ?auto_707034 ?auto_707035 ) ) ( not ( = ?auto_707034 ?auto_707036 ) ) ( not ( = ?auto_707034 ?auto_707037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707035 ?auto_707036 ?auto_707037 )
      ( MAKE-9CRATE-VERIFY ?auto_707028 ?auto_707029 ?auto_707030 ?auto_707032 ?auto_707031 ?auto_707033 ?auto_707034 ?auto_707035 ?auto_707036 ?auto_707037 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707127 - SURFACE
      ?auto_707128 - SURFACE
      ?auto_707129 - SURFACE
      ?auto_707131 - SURFACE
      ?auto_707130 - SURFACE
      ?auto_707132 - SURFACE
      ?auto_707133 - SURFACE
      ?auto_707134 - SURFACE
      ?auto_707135 - SURFACE
      ?auto_707136 - SURFACE
    )
    :vars
    (
      ?auto_707137 - HOIST
      ?auto_707139 - PLACE
      ?auto_707138 - TRUCK
      ?auto_707141 - PLACE
      ?auto_707140 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_707137 ?auto_707139 ) ( SURFACE-AT ?auto_707135 ?auto_707139 ) ( CLEAR ?auto_707135 ) ( IS-CRATE ?auto_707136 ) ( not ( = ?auto_707135 ?auto_707136 ) ) ( AVAILABLE ?auto_707137 ) ( ON ?auto_707135 ?auto_707134 ) ( not ( = ?auto_707134 ?auto_707135 ) ) ( not ( = ?auto_707134 ?auto_707136 ) ) ( TRUCK-AT ?auto_707138 ?auto_707141 ) ( not ( = ?auto_707141 ?auto_707139 ) ) ( HOIST-AT ?auto_707140 ?auto_707141 ) ( LIFTING ?auto_707140 ?auto_707136 ) ( not ( = ?auto_707137 ?auto_707140 ) ) ( ON ?auto_707128 ?auto_707127 ) ( ON ?auto_707129 ?auto_707128 ) ( ON ?auto_707131 ?auto_707129 ) ( ON ?auto_707130 ?auto_707131 ) ( ON ?auto_707132 ?auto_707130 ) ( ON ?auto_707133 ?auto_707132 ) ( ON ?auto_707134 ?auto_707133 ) ( not ( = ?auto_707127 ?auto_707128 ) ) ( not ( = ?auto_707127 ?auto_707129 ) ) ( not ( = ?auto_707127 ?auto_707131 ) ) ( not ( = ?auto_707127 ?auto_707130 ) ) ( not ( = ?auto_707127 ?auto_707132 ) ) ( not ( = ?auto_707127 ?auto_707133 ) ) ( not ( = ?auto_707127 ?auto_707134 ) ) ( not ( = ?auto_707127 ?auto_707135 ) ) ( not ( = ?auto_707127 ?auto_707136 ) ) ( not ( = ?auto_707128 ?auto_707129 ) ) ( not ( = ?auto_707128 ?auto_707131 ) ) ( not ( = ?auto_707128 ?auto_707130 ) ) ( not ( = ?auto_707128 ?auto_707132 ) ) ( not ( = ?auto_707128 ?auto_707133 ) ) ( not ( = ?auto_707128 ?auto_707134 ) ) ( not ( = ?auto_707128 ?auto_707135 ) ) ( not ( = ?auto_707128 ?auto_707136 ) ) ( not ( = ?auto_707129 ?auto_707131 ) ) ( not ( = ?auto_707129 ?auto_707130 ) ) ( not ( = ?auto_707129 ?auto_707132 ) ) ( not ( = ?auto_707129 ?auto_707133 ) ) ( not ( = ?auto_707129 ?auto_707134 ) ) ( not ( = ?auto_707129 ?auto_707135 ) ) ( not ( = ?auto_707129 ?auto_707136 ) ) ( not ( = ?auto_707131 ?auto_707130 ) ) ( not ( = ?auto_707131 ?auto_707132 ) ) ( not ( = ?auto_707131 ?auto_707133 ) ) ( not ( = ?auto_707131 ?auto_707134 ) ) ( not ( = ?auto_707131 ?auto_707135 ) ) ( not ( = ?auto_707131 ?auto_707136 ) ) ( not ( = ?auto_707130 ?auto_707132 ) ) ( not ( = ?auto_707130 ?auto_707133 ) ) ( not ( = ?auto_707130 ?auto_707134 ) ) ( not ( = ?auto_707130 ?auto_707135 ) ) ( not ( = ?auto_707130 ?auto_707136 ) ) ( not ( = ?auto_707132 ?auto_707133 ) ) ( not ( = ?auto_707132 ?auto_707134 ) ) ( not ( = ?auto_707132 ?auto_707135 ) ) ( not ( = ?auto_707132 ?auto_707136 ) ) ( not ( = ?auto_707133 ?auto_707134 ) ) ( not ( = ?auto_707133 ?auto_707135 ) ) ( not ( = ?auto_707133 ?auto_707136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707134 ?auto_707135 ?auto_707136 )
      ( MAKE-9CRATE-VERIFY ?auto_707127 ?auto_707128 ?auto_707129 ?auto_707131 ?auto_707130 ?auto_707132 ?auto_707133 ?auto_707134 ?auto_707135 ?auto_707136 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707235 - SURFACE
      ?auto_707236 - SURFACE
      ?auto_707237 - SURFACE
      ?auto_707239 - SURFACE
      ?auto_707238 - SURFACE
      ?auto_707240 - SURFACE
      ?auto_707241 - SURFACE
      ?auto_707242 - SURFACE
      ?auto_707243 - SURFACE
      ?auto_707244 - SURFACE
    )
    :vars
    (
      ?auto_707248 - HOIST
      ?auto_707246 - PLACE
      ?auto_707250 - TRUCK
      ?auto_707249 - PLACE
      ?auto_707247 - HOIST
      ?auto_707245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707248 ?auto_707246 ) ( SURFACE-AT ?auto_707243 ?auto_707246 ) ( CLEAR ?auto_707243 ) ( IS-CRATE ?auto_707244 ) ( not ( = ?auto_707243 ?auto_707244 ) ) ( AVAILABLE ?auto_707248 ) ( ON ?auto_707243 ?auto_707242 ) ( not ( = ?auto_707242 ?auto_707243 ) ) ( not ( = ?auto_707242 ?auto_707244 ) ) ( TRUCK-AT ?auto_707250 ?auto_707249 ) ( not ( = ?auto_707249 ?auto_707246 ) ) ( HOIST-AT ?auto_707247 ?auto_707249 ) ( not ( = ?auto_707248 ?auto_707247 ) ) ( AVAILABLE ?auto_707247 ) ( SURFACE-AT ?auto_707244 ?auto_707249 ) ( ON ?auto_707244 ?auto_707245 ) ( CLEAR ?auto_707244 ) ( not ( = ?auto_707243 ?auto_707245 ) ) ( not ( = ?auto_707244 ?auto_707245 ) ) ( not ( = ?auto_707242 ?auto_707245 ) ) ( ON ?auto_707236 ?auto_707235 ) ( ON ?auto_707237 ?auto_707236 ) ( ON ?auto_707239 ?auto_707237 ) ( ON ?auto_707238 ?auto_707239 ) ( ON ?auto_707240 ?auto_707238 ) ( ON ?auto_707241 ?auto_707240 ) ( ON ?auto_707242 ?auto_707241 ) ( not ( = ?auto_707235 ?auto_707236 ) ) ( not ( = ?auto_707235 ?auto_707237 ) ) ( not ( = ?auto_707235 ?auto_707239 ) ) ( not ( = ?auto_707235 ?auto_707238 ) ) ( not ( = ?auto_707235 ?auto_707240 ) ) ( not ( = ?auto_707235 ?auto_707241 ) ) ( not ( = ?auto_707235 ?auto_707242 ) ) ( not ( = ?auto_707235 ?auto_707243 ) ) ( not ( = ?auto_707235 ?auto_707244 ) ) ( not ( = ?auto_707235 ?auto_707245 ) ) ( not ( = ?auto_707236 ?auto_707237 ) ) ( not ( = ?auto_707236 ?auto_707239 ) ) ( not ( = ?auto_707236 ?auto_707238 ) ) ( not ( = ?auto_707236 ?auto_707240 ) ) ( not ( = ?auto_707236 ?auto_707241 ) ) ( not ( = ?auto_707236 ?auto_707242 ) ) ( not ( = ?auto_707236 ?auto_707243 ) ) ( not ( = ?auto_707236 ?auto_707244 ) ) ( not ( = ?auto_707236 ?auto_707245 ) ) ( not ( = ?auto_707237 ?auto_707239 ) ) ( not ( = ?auto_707237 ?auto_707238 ) ) ( not ( = ?auto_707237 ?auto_707240 ) ) ( not ( = ?auto_707237 ?auto_707241 ) ) ( not ( = ?auto_707237 ?auto_707242 ) ) ( not ( = ?auto_707237 ?auto_707243 ) ) ( not ( = ?auto_707237 ?auto_707244 ) ) ( not ( = ?auto_707237 ?auto_707245 ) ) ( not ( = ?auto_707239 ?auto_707238 ) ) ( not ( = ?auto_707239 ?auto_707240 ) ) ( not ( = ?auto_707239 ?auto_707241 ) ) ( not ( = ?auto_707239 ?auto_707242 ) ) ( not ( = ?auto_707239 ?auto_707243 ) ) ( not ( = ?auto_707239 ?auto_707244 ) ) ( not ( = ?auto_707239 ?auto_707245 ) ) ( not ( = ?auto_707238 ?auto_707240 ) ) ( not ( = ?auto_707238 ?auto_707241 ) ) ( not ( = ?auto_707238 ?auto_707242 ) ) ( not ( = ?auto_707238 ?auto_707243 ) ) ( not ( = ?auto_707238 ?auto_707244 ) ) ( not ( = ?auto_707238 ?auto_707245 ) ) ( not ( = ?auto_707240 ?auto_707241 ) ) ( not ( = ?auto_707240 ?auto_707242 ) ) ( not ( = ?auto_707240 ?auto_707243 ) ) ( not ( = ?auto_707240 ?auto_707244 ) ) ( not ( = ?auto_707240 ?auto_707245 ) ) ( not ( = ?auto_707241 ?auto_707242 ) ) ( not ( = ?auto_707241 ?auto_707243 ) ) ( not ( = ?auto_707241 ?auto_707244 ) ) ( not ( = ?auto_707241 ?auto_707245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707242 ?auto_707243 ?auto_707244 )
      ( MAKE-9CRATE-VERIFY ?auto_707235 ?auto_707236 ?auto_707237 ?auto_707239 ?auto_707238 ?auto_707240 ?auto_707241 ?auto_707242 ?auto_707243 ?auto_707244 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707344 - SURFACE
      ?auto_707345 - SURFACE
      ?auto_707346 - SURFACE
      ?auto_707348 - SURFACE
      ?auto_707347 - SURFACE
      ?auto_707349 - SURFACE
      ?auto_707350 - SURFACE
      ?auto_707351 - SURFACE
      ?auto_707352 - SURFACE
      ?auto_707353 - SURFACE
    )
    :vars
    (
      ?auto_707359 - HOIST
      ?auto_707358 - PLACE
      ?auto_707357 - PLACE
      ?auto_707354 - HOIST
      ?auto_707355 - SURFACE
      ?auto_707356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707359 ?auto_707358 ) ( SURFACE-AT ?auto_707352 ?auto_707358 ) ( CLEAR ?auto_707352 ) ( IS-CRATE ?auto_707353 ) ( not ( = ?auto_707352 ?auto_707353 ) ) ( AVAILABLE ?auto_707359 ) ( ON ?auto_707352 ?auto_707351 ) ( not ( = ?auto_707351 ?auto_707352 ) ) ( not ( = ?auto_707351 ?auto_707353 ) ) ( not ( = ?auto_707357 ?auto_707358 ) ) ( HOIST-AT ?auto_707354 ?auto_707357 ) ( not ( = ?auto_707359 ?auto_707354 ) ) ( AVAILABLE ?auto_707354 ) ( SURFACE-AT ?auto_707353 ?auto_707357 ) ( ON ?auto_707353 ?auto_707355 ) ( CLEAR ?auto_707353 ) ( not ( = ?auto_707352 ?auto_707355 ) ) ( not ( = ?auto_707353 ?auto_707355 ) ) ( not ( = ?auto_707351 ?auto_707355 ) ) ( TRUCK-AT ?auto_707356 ?auto_707358 ) ( ON ?auto_707345 ?auto_707344 ) ( ON ?auto_707346 ?auto_707345 ) ( ON ?auto_707348 ?auto_707346 ) ( ON ?auto_707347 ?auto_707348 ) ( ON ?auto_707349 ?auto_707347 ) ( ON ?auto_707350 ?auto_707349 ) ( ON ?auto_707351 ?auto_707350 ) ( not ( = ?auto_707344 ?auto_707345 ) ) ( not ( = ?auto_707344 ?auto_707346 ) ) ( not ( = ?auto_707344 ?auto_707348 ) ) ( not ( = ?auto_707344 ?auto_707347 ) ) ( not ( = ?auto_707344 ?auto_707349 ) ) ( not ( = ?auto_707344 ?auto_707350 ) ) ( not ( = ?auto_707344 ?auto_707351 ) ) ( not ( = ?auto_707344 ?auto_707352 ) ) ( not ( = ?auto_707344 ?auto_707353 ) ) ( not ( = ?auto_707344 ?auto_707355 ) ) ( not ( = ?auto_707345 ?auto_707346 ) ) ( not ( = ?auto_707345 ?auto_707348 ) ) ( not ( = ?auto_707345 ?auto_707347 ) ) ( not ( = ?auto_707345 ?auto_707349 ) ) ( not ( = ?auto_707345 ?auto_707350 ) ) ( not ( = ?auto_707345 ?auto_707351 ) ) ( not ( = ?auto_707345 ?auto_707352 ) ) ( not ( = ?auto_707345 ?auto_707353 ) ) ( not ( = ?auto_707345 ?auto_707355 ) ) ( not ( = ?auto_707346 ?auto_707348 ) ) ( not ( = ?auto_707346 ?auto_707347 ) ) ( not ( = ?auto_707346 ?auto_707349 ) ) ( not ( = ?auto_707346 ?auto_707350 ) ) ( not ( = ?auto_707346 ?auto_707351 ) ) ( not ( = ?auto_707346 ?auto_707352 ) ) ( not ( = ?auto_707346 ?auto_707353 ) ) ( not ( = ?auto_707346 ?auto_707355 ) ) ( not ( = ?auto_707348 ?auto_707347 ) ) ( not ( = ?auto_707348 ?auto_707349 ) ) ( not ( = ?auto_707348 ?auto_707350 ) ) ( not ( = ?auto_707348 ?auto_707351 ) ) ( not ( = ?auto_707348 ?auto_707352 ) ) ( not ( = ?auto_707348 ?auto_707353 ) ) ( not ( = ?auto_707348 ?auto_707355 ) ) ( not ( = ?auto_707347 ?auto_707349 ) ) ( not ( = ?auto_707347 ?auto_707350 ) ) ( not ( = ?auto_707347 ?auto_707351 ) ) ( not ( = ?auto_707347 ?auto_707352 ) ) ( not ( = ?auto_707347 ?auto_707353 ) ) ( not ( = ?auto_707347 ?auto_707355 ) ) ( not ( = ?auto_707349 ?auto_707350 ) ) ( not ( = ?auto_707349 ?auto_707351 ) ) ( not ( = ?auto_707349 ?auto_707352 ) ) ( not ( = ?auto_707349 ?auto_707353 ) ) ( not ( = ?auto_707349 ?auto_707355 ) ) ( not ( = ?auto_707350 ?auto_707351 ) ) ( not ( = ?auto_707350 ?auto_707352 ) ) ( not ( = ?auto_707350 ?auto_707353 ) ) ( not ( = ?auto_707350 ?auto_707355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707351 ?auto_707352 ?auto_707353 )
      ( MAKE-9CRATE-VERIFY ?auto_707344 ?auto_707345 ?auto_707346 ?auto_707348 ?auto_707347 ?auto_707349 ?auto_707350 ?auto_707351 ?auto_707352 ?auto_707353 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707453 - SURFACE
      ?auto_707454 - SURFACE
      ?auto_707455 - SURFACE
      ?auto_707457 - SURFACE
      ?auto_707456 - SURFACE
      ?auto_707458 - SURFACE
      ?auto_707459 - SURFACE
      ?auto_707460 - SURFACE
      ?auto_707461 - SURFACE
      ?auto_707462 - SURFACE
    )
    :vars
    (
      ?auto_707468 - HOIST
      ?auto_707466 - PLACE
      ?auto_707463 - PLACE
      ?auto_707465 - HOIST
      ?auto_707464 - SURFACE
      ?auto_707467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707468 ?auto_707466 ) ( IS-CRATE ?auto_707462 ) ( not ( = ?auto_707461 ?auto_707462 ) ) ( not ( = ?auto_707460 ?auto_707461 ) ) ( not ( = ?auto_707460 ?auto_707462 ) ) ( not ( = ?auto_707463 ?auto_707466 ) ) ( HOIST-AT ?auto_707465 ?auto_707463 ) ( not ( = ?auto_707468 ?auto_707465 ) ) ( AVAILABLE ?auto_707465 ) ( SURFACE-AT ?auto_707462 ?auto_707463 ) ( ON ?auto_707462 ?auto_707464 ) ( CLEAR ?auto_707462 ) ( not ( = ?auto_707461 ?auto_707464 ) ) ( not ( = ?auto_707462 ?auto_707464 ) ) ( not ( = ?auto_707460 ?auto_707464 ) ) ( TRUCK-AT ?auto_707467 ?auto_707466 ) ( SURFACE-AT ?auto_707460 ?auto_707466 ) ( CLEAR ?auto_707460 ) ( LIFTING ?auto_707468 ?auto_707461 ) ( IS-CRATE ?auto_707461 ) ( ON ?auto_707454 ?auto_707453 ) ( ON ?auto_707455 ?auto_707454 ) ( ON ?auto_707457 ?auto_707455 ) ( ON ?auto_707456 ?auto_707457 ) ( ON ?auto_707458 ?auto_707456 ) ( ON ?auto_707459 ?auto_707458 ) ( ON ?auto_707460 ?auto_707459 ) ( not ( = ?auto_707453 ?auto_707454 ) ) ( not ( = ?auto_707453 ?auto_707455 ) ) ( not ( = ?auto_707453 ?auto_707457 ) ) ( not ( = ?auto_707453 ?auto_707456 ) ) ( not ( = ?auto_707453 ?auto_707458 ) ) ( not ( = ?auto_707453 ?auto_707459 ) ) ( not ( = ?auto_707453 ?auto_707460 ) ) ( not ( = ?auto_707453 ?auto_707461 ) ) ( not ( = ?auto_707453 ?auto_707462 ) ) ( not ( = ?auto_707453 ?auto_707464 ) ) ( not ( = ?auto_707454 ?auto_707455 ) ) ( not ( = ?auto_707454 ?auto_707457 ) ) ( not ( = ?auto_707454 ?auto_707456 ) ) ( not ( = ?auto_707454 ?auto_707458 ) ) ( not ( = ?auto_707454 ?auto_707459 ) ) ( not ( = ?auto_707454 ?auto_707460 ) ) ( not ( = ?auto_707454 ?auto_707461 ) ) ( not ( = ?auto_707454 ?auto_707462 ) ) ( not ( = ?auto_707454 ?auto_707464 ) ) ( not ( = ?auto_707455 ?auto_707457 ) ) ( not ( = ?auto_707455 ?auto_707456 ) ) ( not ( = ?auto_707455 ?auto_707458 ) ) ( not ( = ?auto_707455 ?auto_707459 ) ) ( not ( = ?auto_707455 ?auto_707460 ) ) ( not ( = ?auto_707455 ?auto_707461 ) ) ( not ( = ?auto_707455 ?auto_707462 ) ) ( not ( = ?auto_707455 ?auto_707464 ) ) ( not ( = ?auto_707457 ?auto_707456 ) ) ( not ( = ?auto_707457 ?auto_707458 ) ) ( not ( = ?auto_707457 ?auto_707459 ) ) ( not ( = ?auto_707457 ?auto_707460 ) ) ( not ( = ?auto_707457 ?auto_707461 ) ) ( not ( = ?auto_707457 ?auto_707462 ) ) ( not ( = ?auto_707457 ?auto_707464 ) ) ( not ( = ?auto_707456 ?auto_707458 ) ) ( not ( = ?auto_707456 ?auto_707459 ) ) ( not ( = ?auto_707456 ?auto_707460 ) ) ( not ( = ?auto_707456 ?auto_707461 ) ) ( not ( = ?auto_707456 ?auto_707462 ) ) ( not ( = ?auto_707456 ?auto_707464 ) ) ( not ( = ?auto_707458 ?auto_707459 ) ) ( not ( = ?auto_707458 ?auto_707460 ) ) ( not ( = ?auto_707458 ?auto_707461 ) ) ( not ( = ?auto_707458 ?auto_707462 ) ) ( not ( = ?auto_707458 ?auto_707464 ) ) ( not ( = ?auto_707459 ?auto_707460 ) ) ( not ( = ?auto_707459 ?auto_707461 ) ) ( not ( = ?auto_707459 ?auto_707462 ) ) ( not ( = ?auto_707459 ?auto_707464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707460 ?auto_707461 ?auto_707462 )
      ( MAKE-9CRATE-VERIFY ?auto_707453 ?auto_707454 ?auto_707455 ?auto_707457 ?auto_707456 ?auto_707458 ?auto_707459 ?auto_707460 ?auto_707461 ?auto_707462 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707562 - SURFACE
      ?auto_707563 - SURFACE
      ?auto_707564 - SURFACE
      ?auto_707566 - SURFACE
      ?auto_707565 - SURFACE
      ?auto_707567 - SURFACE
      ?auto_707568 - SURFACE
      ?auto_707569 - SURFACE
      ?auto_707570 - SURFACE
      ?auto_707571 - SURFACE
    )
    :vars
    (
      ?auto_707576 - HOIST
      ?auto_707575 - PLACE
      ?auto_707573 - PLACE
      ?auto_707577 - HOIST
      ?auto_707574 - SURFACE
      ?auto_707572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707576 ?auto_707575 ) ( IS-CRATE ?auto_707571 ) ( not ( = ?auto_707570 ?auto_707571 ) ) ( not ( = ?auto_707569 ?auto_707570 ) ) ( not ( = ?auto_707569 ?auto_707571 ) ) ( not ( = ?auto_707573 ?auto_707575 ) ) ( HOIST-AT ?auto_707577 ?auto_707573 ) ( not ( = ?auto_707576 ?auto_707577 ) ) ( AVAILABLE ?auto_707577 ) ( SURFACE-AT ?auto_707571 ?auto_707573 ) ( ON ?auto_707571 ?auto_707574 ) ( CLEAR ?auto_707571 ) ( not ( = ?auto_707570 ?auto_707574 ) ) ( not ( = ?auto_707571 ?auto_707574 ) ) ( not ( = ?auto_707569 ?auto_707574 ) ) ( TRUCK-AT ?auto_707572 ?auto_707575 ) ( SURFACE-AT ?auto_707569 ?auto_707575 ) ( CLEAR ?auto_707569 ) ( IS-CRATE ?auto_707570 ) ( AVAILABLE ?auto_707576 ) ( IN ?auto_707570 ?auto_707572 ) ( ON ?auto_707563 ?auto_707562 ) ( ON ?auto_707564 ?auto_707563 ) ( ON ?auto_707566 ?auto_707564 ) ( ON ?auto_707565 ?auto_707566 ) ( ON ?auto_707567 ?auto_707565 ) ( ON ?auto_707568 ?auto_707567 ) ( ON ?auto_707569 ?auto_707568 ) ( not ( = ?auto_707562 ?auto_707563 ) ) ( not ( = ?auto_707562 ?auto_707564 ) ) ( not ( = ?auto_707562 ?auto_707566 ) ) ( not ( = ?auto_707562 ?auto_707565 ) ) ( not ( = ?auto_707562 ?auto_707567 ) ) ( not ( = ?auto_707562 ?auto_707568 ) ) ( not ( = ?auto_707562 ?auto_707569 ) ) ( not ( = ?auto_707562 ?auto_707570 ) ) ( not ( = ?auto_707562 ?auto_707571 ) ) ( not ( = ?auto_707562 ?auto_707574 ) ) ( not ( = ?auto_707563 ?auto_707564 ) ) ( not ( = ?auto_707563 ?auto_707566 ) ) ( not ( = ?auto_707563 ?auto_707565 ) ) ( not ( = ?auto_707563 ?auto_707567 ) ) ( not ( = ?auto_707563 ?auto_707568 ) ) ( not ( = ?auto_707563 ?auto_707569 ) ) ( not ( = ?auto_707563 ?auto_707570 ) ) ( not ( = ?auto_707563 ?auto_707571 ) ) ( not ( = ?auto_707563 ?auto_707574 ) ) ( not ( = ?auto_707564 ?auto_707566 ) ) ( not ( = ?auto_707564 ?auto_707565 ) ) ( not ( = ?auto_707564 ?auto_707567 ) ) ( not ( = ?auto_707564 ?auto_707568 ) ) ( not ( = ?auto_707564 ?auto_707569 ) ) ( not ( = ?auto_707564 ?auto_707570 ) ) ( not ( = ?auto_707564 ?auto_707571 ) ) ( not ( = ?auto_707564 ?auto_707574 ) ) ( not ( = ?auto_707566 ?auto_707565 ) ) ( not ( = ?auto_707566 ?auto_707567 ) ) ( not ( = ?auto_707566 ?auto_707568 ) ) ( not ( = ?auto_707566 ?auto_707569 ) ) ( not ( = ?auto_707566 ?auto_707570 ) ) ( not ( = ?auto_707566 ?auto_707571 ) ) ( not ( = ?auto_707566 ?auto_707574 ) ) ( not ( = ?auto_707565 ?auto_707567 ) ) ( not ( = ?auto_707565 ?auto_707568 ) ) ( not ( = ?auto_707565 ?auto_707569 ) ) ( not ( = ?auto_707565 ?auto_707570 ) ) ( not ( = ?auto_707565 ?auto_707571 ) ) ( not ( = ?auto_707565 ?auto_707574 ) ) ( not ( = ?auto_707567 ?auto_707568 ) ) ( not ( = ?auto_707567 ?auto_707569 ) ) ( not ( = ?auto_707567 ?auto_707570 ) ) ( not ( = ?auto_707567 ?auto_707571 ) ) ( not ( = ?auto_707567 ?auto_707574 ) ) ( not ( = ?auto_707568 ?auto_707569 ) ) ( not ( = ?auto_707568 ?auto_707570 ) ) ( not ( = ?auto_707568 ?auto_707571 ) ) ( not ( = ?auto_707568 ?auto_707574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707569 ?auto_707570 ?auto_707571 )
      ( MAKE-9CRATE-VERIFY ?auto_707562 ?auto_707563 ?auto_707564 ?auto_707566 ?auto_707565 ?auto_707567 ?auto_707568 ?auto_707569 ?auto_707570 ?auto_707571 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713127 - SURFACE
      ?auto_713128 - SURFACE
      ?auto_713129 - SURFACE
      ?auto_713131 - SURFACE
      ?auto_713130 - SURFACE
      ?auto_713132 - SURFACE
      ?auto_713133 - SURFACE
      ?auto_713134 - SURFACE
      ?auto_713135 - SURFACE
      ?auto_713136 - SURFACE
      ?auto_713137 - SURFACE
    )
    :vars
    (
      ?auto_713138 - HOIST
      ?auto_713139 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713138 ?auto_713139 ) ( SURFACE-AT ?auto_713136 ?auto_713139 ) ( CLEAR ?auto_713136 ) ( LIFTING ?auto_713138 ?auto_713137 ) ( IS-CRATE ?auto_713137 ) ( not ( = ?auto_713136 ?auto_713137 ) ) ( ON ?auto_713128 ?auto_713127 ) ( ON ?auto_713129 ?auto_713128 ) ( ON ?auto_713131 ?auto_713129 ) ( ON ?auto_713130 ?auto_713131 ) ( ON ?auto_713132 ?auto_713130 ) ( ON ?auto_713133 ?auto_713132 ) ( ON ?auto_713134 ?auto_713133 ) ( ON ?auto_713135 ?auto_713134 ) ( ON ?auto_713136 ?auto_713135 ) ( not ( = ?auto_713127 ?auto_713128 ) ) ( not ( = ?auto_713127 ?auto_713129 ) ) ( not ( = ?auto_713127 ?auto_713131 ) ) ( not ( = ?auto_713127 ?auto_713130 ) ) ( not ( = ?auto_713127 ?auto_713132 ) ) ( not ( = ?auto_713127 ?auto_713133 ) ) ( not ( = ?auto_713127 ?auto_713134 ) ) ( not ( = ?auto_713127 ?auto_713135 ) ) ( not ( = ?auto_713127 ?auto_713136 ) ) ( not ( = ?auto_713127 ?auto_713137 ) ) ( not ( = ?auto_713128 ?auto_713129 ) ) ( not ( = ?auto_713128 ?auto_713131 ) ) ( not ( = ?auto_713128 ?auto_713130 ) ) ( not ( = ?auto_713128 ?auto_713132 ) ) ( not ( = ?auto_713128 ?auto_713133 ) ) ( not ( = ?auto_713128 ?auto_713134 ) ) ( not ( = ?auto_713128 ?auto_713135 ) ) ( not ( = ?auto_713128 ?auto_713136 ) ) ( not ( = ?auto_713128 ?auto_713137 ) ) ( not ( = ?auto_713129 ?auto_713131 ) ) ( not ( = ?auto_713129 ?auto_713130 ) ) ( not ( = ?auto_713129 ?auto_713132 ) ) ( not ( = ?auto_713129 ?auto_713133 ) ) ( not ( = ?auto_713129 ?auto_713134 ) ) ( not ( = ?auto_713129 ?auto_713135 ) ) ( not ( = ?auto_713129 ?auto_713136 ) ) ( not ( = ?auto_713129 ?auto_713137 ) ) ( not ( = ?auto_713131 ?auto_713130 ) ) ( not ( = ?auto_713131 ?auto_713132 ) ) ( not ( = ?auto_713131 ?auto_713133 ) ) ( not ( = ?auto_713131 ?auto_713134 ) ) ( not ( = ?auto_713131 ?auto_713135 ) ) ( not ( = ?auto_713131 ?auto_713136 ) ) ( not ( = ?auto_713131 ?auto_713137 ) ) ( not ( = ?auto_713130 ?auto_713132 ) ) ( not ( = ?auto_713130 ?auto_713133 ) ) ( not ( = ?auto_713130 ?auto_713134 ) ) ( not ( = ?auto_713130 ?auto_713135 ) ) ( not ( = ?auto_713130 ?auto_713136 ) ) ( not ( = ?auto_713130 ?auto_713137 ) ) ( not ( = ?auto_713132 ?auto_713133 ) ) ( not ( = ?auto_713132 ?auto_713134 ) ) ( not ( = ?auto_713132 ?auto_713135 ) ) ( not ( = ?auto_713132 ?auto_713136 ) ) ( not ( = ?auto_713132 ?auto_713137 ) ) ( not ( = ?auto_713133 ?auto_713134 ) ) ( not ( = ?auto_713133 ?auto_713135 ) ) ( not ( = ?auto_713133 ?auto_713136 ) ) ( not ( = ?auto_713133 ?auto_713137 ) ) ( not ( = ?auto_713134 ?auto_713135 ) ) ( not ( = ?auto_713134 ?auto_713136 ) ) ( not ( = ?auto_713134 ?auto_713137 ) ) ( not ( = ?auto_713135 ?auto_713136 ) ) ( not ( = ?auto_713135 ?auto_713137 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_713136 ?auto_713137 )
      ( MAKE-10CRATE-VERIFY ?auto_713127 ?auto_713128 ?auto_713129 ?auto_713131 ?auto_713130 ?auto_713132 ?auto_713133 ?auto_713134 ?auto_713135 ?auto_713136 ?auto_713137 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713221 - SURFACE
      ?auto_713222 - SURFACE
      ?auto_713223 - SURFACE
      ?auto_713225 - SURFACE
      ?auto_713224 - SURFACE
      ?auto_713226 - SURFACE
      ?auto_713227 - SURFACE
      ?auto_713228 - SURFACE
      ?auto_713229 - SURFACE
      ?auto_713230 - SURFACE
      ?auto_713231 - SURFACE
    )
    :vars
    (
      ?auto_713233 - HOIST
      ?auto_713234 - PLACE
      ?auto_713232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713233 ?auto_713234 ) ( SURFACE-AT ?auto_713230 ?auto_713234 ) ( CLEAR ?auto_713230 ) ( IS-CRATE ?auto_713231 ) ( not ( = ?auto_713230 ?auto_713231 ) ) ( TRUCK-AT ?auto_713232 ?auto_713234 ) ( AVAILABLE ?auto_713233 ) ( IN ?auto_713231 ?auto_713232 ) ( ON ?auto_713230 ?auto_713229 ) ( not ( = ?auto_713229 ?auto_713230 ) ) ( not ( = ?auto_713229 ?auto_713231 ) ) ( ON ?auto_713222 ?auto_713221 ) ( ON ?auto_713223 ?auto_713222 ) ( ON ?auto_713225 ?auto_713223 ) ( ON ?auto_713224 ?auto_713225 ) ( ON ?auto_713226 ?auto_713224 ) ( ON ?auto_713227 ?auto_713226 ) ( ON ?auto_713228 ?auto_713227 ) ( ON ?auto_713229 ?auto_713228 ) ( not ( = ?auto_713221 ?auto_713222 ) ) ( not ( = ?auto_713221 ?auto_713223 ) ) ( not ( = ?auto_713221 ?auto_713225 ) ) ( not ( = ?auto_713221 ?auto_713224 ) ) ( not ( = ?auto_713221 ?auto_713226 ) ) ( not ( = ?auto_713221 ?auto_713227 ) ) ( not ( = ?auto_713221 ?auto_713228 ) ) ( not ( = ?auto_713221 ?auto_713229 ) ) ( not ( = ?auto_713221 ?auto_713230 ) ) ( not ( = ?auto_713221 ?auto_713231 ) ) ( not ( = ?auto_713222 ?auto_713223 ) ) ( not ( = ?auto_713222 ?auto_713225 ) ) ( not ( = ?auto_713222 ?auto_713224 ) ) ( not ( = ?auto_713222 ?auto_713226 ) ) ( not ( = ?auto_713222 ?auto_713227 ) ) ( not ( = ?auto_713222 ?auto_713228 ) ) ( not ( = ?auto_713222 ?auto_713229 ) ) ( not ( = ?auto_713222 ?auto_713230 ) ) ( not ( = ?auto_713222 ?auto_713231 ) ) ( not ( = ?auto_713223 ?auto_713225 ) ) ( not ( = ?auto_713223 ?auto_713224 ) ) ( not ( = ?auto_713223 ?auto_713226 ) ) ( not ( = ?auto_713223 ?auto_713227 ) ) ( not ( = ?auto_713223 ?auto_713228 ) ) ( not ( = ?auto_713223 ?auto_713229 ) ) ( not ( = ?auto_713223 ?auto_713230 ) ) ( not ( = ?auto_713223 ?auto_713231 ) ) ( not ( = ?auto_713225 ?auto_713224 ) ) ( not ( = ?auto_713225 ?auto_713226 ) ) ( not ( = ?auto_713225 ?auto_713227 ) ) ( not ( = ?auto_713225 ?auto_713228 ) ) ( not ( = ?auto_713225 ?auto_713229 ) ) ( not ( = ?auto_713225 ?auto_713230 ) ) ( not ( = ?auto_713225 ?auto_713231 ) ) ( not ( = ?auto_713224 ?auto_713226 ) ) ( not ( = ?auto_713224 ?auto_713227 ) ) ( not ( = ?auto_713224 ?auto_713228 ) ) ( not ( = ?auto_713224 ?auto_713229 ) ) ( not ( = ?auto_713224 ?auto_713230 ) ) ( not ( = ?auto_713224 ?auto_713231 ) ) ( not ( = ?auto_713226 ?auto_713227 ) ) ( not ( = ?auto_713226 ?auto_713228 ) ) ( not ( = ?auto_713226 ?auto_713229 ) ) ( not ( = ?auto_713226 ?auto_713230 ) ) ( not ( = ?auto_713226 ?auto_713231 ) ) ( not ( = ?auto_713227 ?auto_713228 ) ) ( not ( = ?auto_713227 ?auto_713229 ) ) ( not ( = ?auto_713227 ?auto_713230 ) ) ( not ( = ?auto_713227 ?auto_713231 ) ) ( not ( = ?auto_713228 ?auto_713229 ) ) ( not ( = ?auto_713228 ?auto_713230 ) ) ( not ( = ?auto_713228 ?auto_713231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713229 ?auto_713230 ?auto_713231 )
      ( MAKE-10CRATE-VERIFY ?auto_713221 ?auto_713222 ?auto_713223 ?auto_713225 ?auto_713224 ?auto_713226 ?auto_713227 ?auto_713228 ?auto_713229 ?auto_713230 ?auto_713231 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713326 - SURFACE
      ?auto_713327 - SURFACE
      ?auto_713328 - SURFACE
      ?auto_713330 - SURFACE
      ?auto_713329 - SURFACE
      ?auto_713331 - SURFACE
      ?auto_713332 - SURFACE
      ?auto_713333 - SURFACE
      ?auto_713334 - SURFACE
      ?auto_713335 - SURFACE
      ?auto_713336 - SURFACE
    )
    :vars
    (
      ?auto_713337 - HOIST
      ?auto_713339 - PLACE
      ?auto_713338 - TRUCK
      ?auto_713340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713337 ?auto_713339 ) ( SURFACE-AT ?auto_713335 ?auto_713339 ) ( CLEAR ?auto_713335 ) ( IS-CRATE ?auto_713336 ) ( not ( = ?auto_713335 ?auto_713336 ) ) ( AVAILABLE ?auto_713337 ) ( IN ?auto_713336 ?auto_713338 ) ( ON ?auto_713335 ?auto_713334 ) ( not ( = ?auto_713334 ?auto_713335 ) ) ( not ( = ?auto_713334 ?auto_713336 ) ) ( TRUCK-AT ?auto_713338 ?auto_713340 ) ( not ( = ?auto_713340 ?auto_713339 ) ) ( ON ?auto_713327 ?auto_713326 ) ( ON ?auto_713328 ?auto_713327 ) ( ON ?auto_713330 ?auto_713328 ) ( ON ?auto_713329 ?auto_713330 ) ( ON ?auto_713331 ?auto_713329 ) ( ON ?auto_713332 ?auto_713331 ) ( ON ?auto_713333 ?auto_713332 ) ( ON ?auto_713334 ?auto_713333 ) ( not ( = ?auto_713326 ?auto_713327 ) ) ( not ( = ?auto_713326 ?auto_713328 ) ) ( not ( = ?auto_713326 ?auto_713330 ) ) ( not ( = ?auto_713326 ?auto_713329 ) ) ( not ( = ?auto_713326 ?auto_713331 ) ) ( not ( = ?auto_713326 ?auto_713332 ) ) ( not ( = ?auto_713326 ?auto_713333 ) ) ( not ( = ?auto_713326 ?auto_713334 ) ) ( not ( = ?auto_713326 ?auto_713335 ) ) ( not ( = ?auto_713326 ?auto_713336 ) ) ( not ( = ?auto_713327 ?auto_713328 ) ) ( not ( = ?auto_713327 ?auto_713330 ) ) ( not ( = ?auto_713327 ?auto_713329 ) ) ( not ( = ?auto_713327 ?auto_713331 ) ) ( not ( = ?auto_713327 ?auto_713332 ) ) ( not ( = ?auto_713327 ?auto_713333 ) ) ( not ( = ?auto_713327 ?auto_713334 ) ) ( not ( = ?auto_713327 ?auto_713335 ) ) ( not ( = ?auto_713327 ?auto_713336 ) ) ( not ( = ?auto_713328 ?auto_713330 ) ) ( not ( = ?auto_713328 ?auto_713329 ) ) ( not ( = ?auto_713328 ?auto_713331 ) ) ( not ( = ?auto_713328 ?auto_713332 ) ) ( not ( = ?auto_713328 ?auto_713333 ) ) ( not ( = ?auto_713328 ?auto_713334 ) ) ( not ( = ?auto_713328 ?auto_713335 ) ) ( not ( = ?auto_713328 ?auto_713336 ) ) ( not ( = ?auto_713330 ?auto_713329 ) ) ( not ( = ?auto_713330 ?auto_713331 ) ) ( not ( = ?auto_713330 ?auto_713332 ) ) ( not ( = ?auto_713330 ?auto_713333 ) ) ( not ( = ?auto_713330 ?auto_713334 ) ) ( not ( = ?auto_713330 ?auto_713335 ) ) ( not ( = ?auto_713330 ?auto_713336 ) ) ( not ( = ?auto_713329 ?auto_713331 ) ) ( not ( = ?auto_713329 ?auto_713332 ) ) ( not ( = ?auto_713329 ?auto_713333 ) ) ( not ( = ?auto_713329 ?auto_713334 ) ) ( not ( = ?auto_713329 ?auto_713335 ) ) ( not ( = ?auto_713329 ?auto_713336 ) ) ( not ( = ?auto_713331 ?auto_713332 ) ) ( not ( = ?auto_713331 ?auto_713333 ) ) ( not ( = ?auto_713331 ?auto_713334 ) ) ( not ( = ?auto_713331 ?auto_713335 ) ) ( not ( = ?auto_713331 ?auto_713336 ) ) ( not ( = ?auto_713332 ?auto_713333 ) ) ( not ( = ?auto_713332 ?auto_713334 ) ) ( not ( = ?auto_713332 ?auto_713335 ) ) ( not ( = ?auto_713332 ?auto_713336 ) ) ( not ( = ?auto_713333 ?auto_713334 ) ) ( not ( = ?auto_713333 ?auto_713335 ) ) ( not ( = ?auto_713333 ?auto_713336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713334 ?auto_713335 ?auto_713336 )
      ( MAKE-10CRATE-VERIFY ?auto_713326 ?auto_713327 ?auto_713328 ?auto_713330 ?auto_713329 ?auto_713331 ?auto_713332 ?auto_713333 ?auto_713334 ?auto_713335 ?auto_713336 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713441 - SURFACE
      ?auto_713442 - SURFACE
      ?auto_713443 - SURFACE
      ?auto_713445 - SURFACE
      ?auto_713444 - SURFACE
      ?auto_713446 - SURFACE
      ?auto_713447 - SURFACE
      ?auto_713448 - SURFACE
      ?auto_713449 - SURFACE
      ?auto_713450 - SURFACE
      ?auto_713451 - SURFACE
    )
    :vars
    (
      ?auto_713452 - HOIST
      ?auto_713453 - PLACE
      ?auto_713456 - TRUCK
      ?auto_713455 - PLACE
      ?auto_713454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_713452 ?auto_713453 ) ( SURFACE-AT ?auto_713450 ?auto_713453 ) ( CLEAR ?auto_713450 ) ( IS-CRATE ?auto_713451 ) ( not ( = ?auto_713450 ?auto_713451 ) ) ( AVAILABLE ?auto_713452 ) ( ON ?auto_713450 ?auto_713449 ) ( not ( = ?auto_713449 ?auto_713450 ) ) ( not ( = ?auto_713449 ?auto_713451 ) ) ( TRUCK-AT ?auto_713456 ?auto_713455 ) ( not ( = ?auto_713455 ?auto_713453 ) ) ( HOIST-AT ?auto_713454 ?auto_713455 ) ( LIFTING ?auto_713454 ?auto_713451 ) ( not ( = ?auto_713452 ?auto_713454 ) ) ( ON ?auto_713442 ?auto_713441 ) ( ON ?auto_713443 ?auto_713442 ) ( ON ?auto_713445 ?auto_713443 ) ( ON ?auto_713444 ?auto_713445 ) ( ON ?auto_713446 ?auto_713444 ) ( ON ?auto_713447 ?auto_713446 ) ( ON ?auto_713448 ?auto_713447 ) ( ON ?auto_713449 ?auto_713448 ) ( not ( = ?auto_713441 ?auto_713442 ) ) ( not ( = ?auto_713441 ?auto_713443 ) ) ( not ( = ?auto_713441 ?auto_713445 ) ) ( not ( = ?auto_713441 ?auto_713444 ) ) ( not ( = ?auto_713441 ?auto_713446 ) ) ( not ( = ?auto_713441 ?auto_713447 ) ) ( not ( = ?auto_713441 ?auto_713448 ) ) ( not ( = ?auto_713441 ?auto_713449 ) ) ( not ( = ?auto_713441 ?auto_713450 ) ) ( not ( = ?auto_713441 ?auto_713451 ) ) ( not ( = ?auto_713442 ?auto_713443 ) ) ( not ( = ?auto_713442 ?auto_713445 ) ) ( not ( = ?auto_713442 ?auto_713444 ) ) ( not ( = ?auto_713442 ?auto_713446 ) ) ( not ( = ?auto_713442 ?auto_713447 ) ) ( not ( = ?auto_713442 ?auto_713448 ) ) ( not ( = ?auto_713442 ?auto_713449 ) ) ( not ( = ?auto_713442 ?auto_713450 ) ) ( not ( = ?auto_713442 ?auto_713451 ) ) ( not ( = ?auto_713443 ?auto_713445 ) ) ( not ( = ?auto_713443 ?auto_713444 ) ) ( not ( = ?auto_713443 ?auto_713446 ) ) ( not ( = ?auto_713443 ?auto_713447 ) ) ( not ( = ?auto_713443 ?auto_713448 ) ) ( not ( = ?auto_713443 ?auto_713449 ) ) ( not ( = ?auto_713443 ?auto_713450 ) ) ( not ( = ?auto_713443 ?auto_713451 ) ) ( not ( = ?auto_713445 ?auto_713444 ) ) ( not ( = ?auto_713445 ?auto_713446 ) ) ( not ( = ?auto_713445 ?auto_713447 ) ) ( not ( = ?auto_713445 ?auto_713448 ) ) ( not ( = ?auto_713445 ?auto_713449 ) ) ( not ( = ?auto_713445 ?auto_713450 ) ) ( not ( = ?auto_713445 ?auto_713451 ) ) ( not ( = ?auto_713444 ?auto_713446 ) ) ( not ( = ?auto_713444 ?auto_713447 ) ) ( not ( = ?auto_713444 ?auto_713448 ) ) ( not ( = ?auto_713444 ?auto_713449 ) ) ( not ( = ?auto_713444 ?auto_713450 ) ) ( not ( = ?auto_713444 ?auto_713451 ) ) ( not ( = ?auto_713446 ?auto_713447 ) ) ( not ( = ?auto_713446 ?auto_713448 ) ) ( not ( = ?auto_713446 ?auto_713449 ) ) ( not ( = ?auto_713446 ?auto_713450 ) ) ( not ( = ?auto_713446 ?auto_713451 ) ) ( not ( = ?auto_713447 ?auto_713448 ) ) ( not ( = ?auto_713447 ?auto_713449 ) ) ( not ( = ?auto_713447 ?auto_713450 ) ) ( not ( = ?auto_713447 ?auto_713451 ) ) ( not ( = ?auto_713448 ?auto_713449 ) ) ( not ( = ?auto_713448 ?auto_713450 ) ) ( not ( = ?auto_713448 ?auto_713451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713449 ?auto_713450 ?auto_713451 )
      ( MAKE-10CRATE-VERIFY ?auto_713441 ?auto_713442 ?auto_713443 ?auto_713445 ?auto_713444 ?auto_713446 ?auto_713447 ?auto_713448 ?auto_713449 ?auto_713450 ?auto_713451 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713566 - SURFACE
      ?auto_713567 - SURFACE
      ?auto_713568 - SURFACE
      ?auto_713570 - SURFACE
      ?auto_713569 - SURFACE
      ?auto_713571 - SURFACE
      ?auto_713572 - SURFACE
      ?auto_713573 - SURFACE
      ?auto_713574 - SURFACE
      ?auto_713575 - SURFACE
      ?auto_713576 - SURFACE
    )
    :vars
    (
      ?auto_713577 - HOIST
      ?auto_713582 - PLACE
      ?auto_713578 - TRUCK
      ?auto_713581 - PLACE
      ?auto_713579 - HOIST
      ?auto_713580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713577 ?auto_713582 ) ( SURFACE-AT ?auto_713575 ?auto_713582 ) ( CLEAR ?auto_713575 ) ( IS-CRATE ?auto_713576 ) ( not ( = ?auto_713575 ?auto_713576 ) ) ( AVAILABLE ?auto_713577 ) ( ON ?auto_713575 ?auto_713574 ) ( not ( = ?auto_713574 ?auto_713575 ) ) ( not ( = ?auto_713574 ?auto_713576 ) ) ( TRUCK-AT ?auto_713578 ?auto_713581 ) ( not ( = ?auto_713581 ?auto_713582 ) ) ( HOIST-AT ?auto_713579 ?auto_713581 ) ( not ( = ?auto_713577 ?auto_713579 ) ) ( AVAILABLE ?auto_713579 ) ( SURFACE-AT ?auto_713576 ?auto_713581 ) ( ON ?auto_713576 ?auto_713580 ) ( CLEAR ?auto_713576 ) ( not ( = ?auto_713575 ?auto_713580 ) ) ( not ( = ?auto_713576 ?auto_713580 ) ) ( not ( = ?auto_713574 ?auto_713580 ) ) ( ON ?auto_713567 ?auto_713566 ) ( ON ?auto_713568 ?auto_713567 ) ( ON ?auto_713570 ?auto_713568 ) ( ON ?auto_713569 ?auto_713570 ) ( ON ?auto_713571 ?auto_713569 ) ( ON ?auto_713572 ?auto_713571 ) ( ON ?auto_713573 ?auto_713572 ) ( ON ?auto_713574 ?auto_713573 ) ( not ( = ?auto_713566 ?auto_713567 ) ) ( not ( = ?auto_713566 ?auto_713568 ) ) ( not ( = ?auto_713566 ?auto_713570 ) ) ( not ( = ?auto_713566 ?auto_713569 ) ) ( not ( = ?auto_713566 ?auto_713571 ) ) ( not ( = ?auto_713566 ?auto_713572 ) ) ( not ( = ?auto_713566 ?auto_713573 ) ) ( not ( = ?auto_713566 ?auto_713574 ) ) ( not ( = ?auto_713566 ?auto_713575 ) ) ( not ( = ?auto_713566 ?auto_713576 ) ) ( not ( = ?auto_713566 ?auto_713580 ) ) ( not ( = ?auto_713567 ?auto_713568 ) ) ( not ( = ?auto_713567 ?auto_713570 ) ) ( not ( = ?auto_713567 ?auto_713569 ) ) ( not ( = ?auto_713567 ?auto_713571 ) ) ( not ( = ?auto_713567 ?auto_713572 ) ) ( not ( = ?auto_713567 ?auto_713573 ) ) ( not ( = ?auto_713567 ?auto_713574 ) ) ( not ( = ?auto_713567 ?auto_713575 ) ) ( not ( = ?auto_713567 ?auto_713576 ) ) ( not ( = ?auto_713567 ?auto_713580 ) ) ( not ( = ?auto_713568 ?auto_713570 ) ) ( not ( = ?auto_713568 ?auto_713569 ) ) ( not ( = ?auto_713568 ?auto_713571 ) ) ( not ( = ?auto_713568 ?auto_713572 ) ) ( not ( = ?auto_713568 ?auto_713573 ) ) ( not ( = ?auto_713568 ?auto_713574 ) ) ( not ( = ?auto_713568 ?auto_713575 ) ) ( not ( = ?auto_713568 ?auto_713576 ) ) ( not ( = ?auto_713568 ?auto_713580 ) ) ( not ( = ?auto_713570 ?auto_713569 ) ) ( not ( = ?auto_713570 ?auto_713571 ) ) ( not ( = ?auto_713570 ?auto_713572 ) ) ( not ( = ?auto_713570 ?auto_713573 ) ) ( not ( = ?auto_713570 ?auto_713574 ) ) ( not ( = ?auto_713570 ?auto_713575 ) ) ( not ( = ?auto_713570 ?auto_713576 ) ) ( not ( = ?auto_713570 ?auto_713580 ) ) ( not ( = ?auto_713569 ?auto_713571 ) ) ( not ( = ?auto_713569 ?auto_713572 ) ) ( not ( = ?auto_713569 ?auto_713573 ) ) ( not ( = ?auto_713569 ?auto_713574 ) ) ( not ( = ?auto_713569 ?auto_713575 ) ) ( not ( = ?auto_713569 ?auto_713576 ) ) ( not ( = ?auto_713569 ?auto_713580 ) ) ( not ( = ?auto_713571 ?auto_713572 ) ) ( not ( = ?auto_713571 ?auto_713573 ) ) ( not ( = ?auto_713571 ?auto_713574 ) ) ( not ( = ?auto_713571 ?auto_713575 ) ) ( not ( = ?auto_713571 ?auto_713576 ) ) ( not ( = ?auto_713571 ?auto_713580 ) ) ( not ( = ?auto_713572 ?auto_713573 ) ) ( not ( = ?auto_713572 ?auto_713574 ) ) ( not ( = ?auto_713572 ?auto_713575 ) ) ( not ( = ?auto_713572 ?auto_713576 ) ) ( not ( = ?auto_713572 ?auto_713580 ) ) ( not ( = ?auto_713573 ?auto_713574 ) ) ( not ( = ?auto_713573 ?auto_713575 ) ) ( not ( = ?auto_713573 ?auto_713576 ) ) ( not ( = ?auto_713573 ?auto_713580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713574 ?auto_713575 ?auto_713576 )
      ( MAKE-10CRATE-VERIFY ?auto_713566 ?auto_713567 ?auto_713568 ?auto_713570 ?auto_713569 ?auto_713571 ?auto_713572 ?auto_713573 ?auto_713574 ?auto_713575 ?auto_713576 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713692 - SURFACE
      ?auto_713693 - SURFACE
      ?auto_713694 - SURFACE
      ?auto_713696 - SURFACE
      ?auto_713695 - SURFACE
      ?auto_713697 - SURFACE
      ?auto_713698 - SURFACE
      ?auto_713699 - SURFACE
      ?auto_713700 - SURFACE
      ?auto_713701 - SURFACE
      ?auto_713702 - SURFACE
    )
    :vars
    (
      ?auto_713703 - HOIST
      ?auto_713708 - PLACE
      ?auto_713707 - PLACE
      ?auto_713706 - HOIST
      ?auto_713705 - SURFACE
      ?auto_713704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713703 ?auto_713708 ) ( SURFACE-AT ?auto_713701 ?auto_713708 ) ( CLEAR ?auto_713701 ) ( IS-CRATE ?auto_713702 ) ( not ( = ?auto_713701 ?auto_713702 ) ) ( AVAILABLE ?auto_713703 ) ( ON ?auto_713701 ?auto_713700 ) ( not ( = ?auto_713700 ?auto_713701 ) ) ( not ( = ?auto_713700 ?auto_713702 ) ) ( not ( = ?auto_713707 ?auto_713708 ) ) ( HOIST-AT ?auto_713706 ?auto_713707 ) ( not ( = ?auto_713703 ?auto_713706 ) ) ( AVAILABLE ?auto_713706 ) ( SURFACE-AT ?auto_713702 ?auto_713707 ) ( ON ?auto_713702 ?auto_713705 ) ( CLEAR ?auto_713702 ) ( not ( = ?auto_713701 ?auto_713705 ) ) ( not ( = ?auto_713702 ?auto_713705 ) ) ( not ( = ?auto_713700 ?auto_713705 ) ) ( TRUCK-AT ?auto_713704 ?auto_713708 ) ( ON ?auto_713693 ?auto_713692 ) ( ON ?auto_713694 ?auto_713693 ) ( ON ?auto_713696 ?auto_713694 ) ( ON ?auto_713695 ?auto_713696 ) ( ON ?auto_713697 ?auto_713695 ) ( ON ?auto_713698 ?auto_713697 ) ( ON ?auto_713699 ?auto_713698 ) ( ON ?auto_713700 ?auto_713699 ) ( not ( = ?auto_713692 ?auto_713693 ) ) ( not ( = ?auto_713692 ?auto_713694 ) ) ( not ( = ?auto_713692 ?auto_713696 ) ) ( not ( = ?auto_713692 ?auto_713695 ) ) ( not ( = ?auto_713692 ?auto_713697 ) ) ( not ( = ?auto_713692 ?auto_713698 ) ) ( not ( = ?auto_713692 ?auto_713699 ) ) ( not ( = ?auto_713692 ?auto_713700 ) ) ( not ( = ?auto_713692 ?auto_713701 ) ) ( not ( = ?auto_713692 ?auto_713702 ) ) ( not ( = ?auto_713692 ?auto_713705 ) ) ( not ( = ?auto_713693 ?auto_713694 ) ) ( not ( = ?auto_713693 ?auto_713696 ) ) ( not ( = ?auto_713693 ?auto_713695 ) ) ( not ( = ?auto_713693 ?auto_713697 ) ) ( not ( = ?auto_713693 ?auto_713698 ) ) ( not ( = ?auto_713693 ?auto_713699 ) ) ( not ( = ?auto_713693 ?auto_713700 ) ) ( not ( = ?auto_713693 ?auto_713701 ) ) ( not ( = ?auto_713693 ?auto_713702 ) ) ( not ( = ?auto_713693 ?auto_713705 ) ) ( not ( = ?auto_713694 ?auto_713696 ) ) ( not ( = ?auto_713694 ?auto_713695 ) ) ( not ( = ?auto_713694 ?auto_713697 ) ) ( not ( = ?auto_713694 ?auto_713698 ) ) ( not ( = ?auto_713694 ?auto_713699 ) ) ( not ( = ?auto_713694 ?auto_713700 ) ) ( not ( = ?auto_713694 ?auto_713701 ) ) ( not ( = ?auto_713694 ?auto_713702 ) ) ( not ( = ?auto_713694 ?auto_713705 ) ) ( not ( = ?auto_713696 ?auto_713695 ) ) ( not ( = ?auto_713696 ?auto_713697 ) ) ( not ( = ?auto_713696 ?auto_713698 ) ) ( not ( = ?auto_713696 ?auto_713699 ) ) ( not ( = ?auto_713696 ?auto_713700 ) ) ( not ( = ?auto_713696 ?auto_713701 ) ) ( not ( = ?auto_713696 ?auto_713702 ) ) ( not ( = ?auto_713696 ?auto_713705 ) ) ( not ( = ?auto_713695 ?auto_713697 ) ) ( not ( = ?auto_713695 ?auto_713698 ) ) ( not ( = ?auto_713695 ?auto_713699 ) ) ( not ( = ?auto_713695 ?auto_713700 ) ) ( not ( = ?auto_713695 ?auto_713701 ) ) ( not ( = ?auto_713695 ?auto_713702 ) ) ( not ( = ?auto_713695 ?auto_713705 ) ) ( not ( = ?auto_713697 ?auto_713698 ) ) ( not ( = ?auto_713697 ?auto_713699 ) ) ( not ( = ?auto_713697 ?auto_713700 ) ) ( not ( = ?auto_713697 ?auto_713701 ) ) ( not ( = ?auto_713697 ?auto_713702 ) ) ( not ( = ?auto_713697 ?auto_713705 ) ) ( not ( = ?auto_713698 ?auto_713699 ) ) ( not ( = ?auto_713698 ?auto_713700 ) ) ( not ( = ?auto_713698 ?auto_713701 ) ) ( not ( = ?auto_713698 ?auto_713702 ) ) ( not ( = ?auto_713698 ?auto_713705 ) ) ( not ( = ?auto_713699 ?auto_713700 ) ) ( not ( = ?auto_713699 ?auto_713701 ) ) ( not ( = ?auto_713699 ?auto_713702 ) ) ( not ( = ?auto_713699 ?auto_713705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713700 ?auto_713701 ?auto_713702 )
      ( MAKE-10CRATE-VERIFY ?auto_713692 ?auto_713693 ?auto_713694 ?auto_713696 ?auto_713695 ?auto_713697 ?auto_713698 ?auto_713699 ?auto_713700 ?auto_713701 ?auto_713702 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713818 - SURFACE
      ?auto_713819 - SURFACE
      ?auto_713820 - SURFACE
      ?auto_713822 - SURFACE
      ?auto_713821 - SURFACE
      ?auto_713823 - SURFACE
      ?auto_713824 - SURFACE
      ?auto_713825 - SURFACE
      ?auto_713826 - SURFACE
      ?auto_713827 - SURFACE
      ?auto_713828 - SURFACE
    )
    :vars
    (
      ?auto_713830 - HOIST
      ?auto_713834 - PLACE
      ?auto_713832 - PLACE
      ?auto_713833 - HOIST
      ?auto_713831 - SURFACE
      ?auto_713829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713830 ?auto_713834 ) ( IS-CRATE ?auto_713828 ) ( not ( = ?auto_713827 ?auto_713828 ) ) ( not ( = ?auto_713826 ?auto_713827 ) ) ( not ( = ?auto_713826 ?auto_713828 ) ) ( not ( = ?auto_713832 ?auto_713834 ) ) ( HOIST-AT ?auto_713833 ?auto_713832 ) ( not ( = ?auto_713830 ?auto_713833 ) ) ( AVAILABLE ?auto_713833 ) ( SURFACE-AT ?auto_713828 ?auto_713832 ) ( ON ?auto_713828 ?auto_713831 ) ( CLEAR ?auto_713828 ) ( not ( = ?auto_713827 ?auto_713831 ) ) ( not ( = ?auto_713828 ?auto_713831 ) ) ( not ( = ?auto_713826 ?auto_713831 ) ) ( TRUCK-AT ?auto_713829 ?auto_713834 ) ( SURFACE-AT ?auto_713826 ?auto_713834 ) ( CLEAR ?auto_713826 ) ( LIFTING ?auto_713830 ?auto_713827 ) ( IS-CRATE ?auto_713827 ) ( ON ?auto_713819 ?auto_713818 ) ( ON ?auto_713820 ?auto_713819 ) ( ON ?auto_713822 ?auto_713820 ) ( ON ?auto_713821 ?auto_713822 ) ( ON ?auto_713823 ?auto_713821 ) ( ON ?auto_713824 ?auto_713823 ) ( ON ?auto_713825 ?auto_713824 ) ( ON ?auto_713826 ?auto_713825 ) ( not ( = ?auto_713818 ?auto_713819 ) ) ( not ( = ?auto_713818 ?auto_713820 ) ) ( not ( = ?auto_713818 ?auto_713822 ) ) ( not ( = ?auto_713818 ?auto_713821 ) ) ( not ( = ?auto_713818 ?auto_713823 ) ) ( not ( = ?auto_713818 ?auto_713824 ) ) ( not ( = ?auto_713818 ?auto_713825 ) ) ( not ( = ?auto_713818 ?auto_713826 ) ) ( not ( = ?auto_713818 ?auto_713827 ) ) ( not ( = ?auto_713818 ?auto_713828 ) ) ( not ( = ?auto_713818 ?auto_713831 ) ) ( not ( = ?auto_713819 ?auto_713820 ) ) ( not ( = ?auto_713819 ?auto_713822 ) ) ( not ( = ?auto_713819 ?auto_713821 ) ) ( not ( = ?auto_713819 ?auto_713823 ) ) ( not ( = ?auto_713819 ?auto_713824 ) ) ( not ( = ?auto_713819 ?auto_713825 ) ) ( not ( = ?auto_713819 ?auto_713826 ) ) ( not ( = ?auto_713819 ?auto_713827 ) ) ( not ( = ?auto_713819 ?auto_713828 ) ) ( not ( = ?auto_713819 ?auto_713831 ) ) ( not ( = ?auto_713820 ?auto_713822 ) ) ( not ( = ?auto_713820 ?auto_713821 ) ) ( not ( = ?auto_713820 ?auto_713823 ) ) ( not ( = ?auto_713820 ?auto_713824 ) ) ( not ( = ?auto_713820 ?auto_713825 ) ) ( not ( = ?auto_713820 ?auto_713826 ) ) ( not ( = ?auto_713820 ?auto_713827 ) ) ( not ( = ?auto_713820 ?auto_713828 ) ) ( not ( = ?auto_713820 ?auto_713831 ) ) ( not ( = ?auto_713822 ?auto_713821 ) ) ( not ( = ?auto_713822 ?auto_713823 ) ) ( not ( = ?auto_713822 ?auto_713824 ) ) ( not ( = ?auto_713822 ?auto_713825 ) ) ( not ( = ?auto_713822 ?auto_713826 ) ) ( not ( = ?auto_713822 ?auto_713827 ) ) ( not ( = ?auto_713822 ?auto_713828 ) ) ( not ( = ?auto_713822 ?auto_713831 ) ) ( not ( = ?auto_713821 ?auto_713823 ) ) ( not ( = ?auto_713821 ?auto_713824 ) ) ( not ( = ?auto_713821 ?auto_713825 ) ) ( not ( = ?auto_713821 ?auto_713826 ) ) ( not ( = ?auto_713821 ?auto_713827 ) ) ( not ( = ?auto_713821 ?auto_713828 ) ) ( not ( = ?auto_713821 ?auto_713831 ) ) ( not ( = ?auto_713823 ?auto_713824 ) ) ( not ( = ?auto_713823 ?auto_713825 ) ) ( not ( = ?auto_713823 ?auto_713826 ) ) ( not ( = ?auto_713823 ?auto_713827 ) ) ( not ( = ?auto_713823 ?auto_713828 ) ) ( not ( = ?auto_713823 ?auto_713831 ) ) ( not ( = ?auto_713824 ?auto_713825 ) ) ( not ( = ?auto_713824 ?auto_713826 ) ) ( not ( = ?auto_713824 ?auto_713827 ) ) ( not ( = ?auto_713824 ?auto_713828 ) ) ( not ( = ?auto_713824 ?auto_713831 ) ) ( not ( = ?auto_713825 ?auto_713826 ) ) ( not ( = ?auto_713825 ?auto_713827 ) ) ( not ( = ?auto_713825 ?auto_713828 ) ) ( not ( = ?auto_713825 ?auto_713831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713826 ?auto_713827 ?auto_713828 )
      ( MAKE-10CRATE-VERIFY ?auto_713818 ?auto_713819 ?auto_713820 ?auto_713822 ?auto_713821 ?auto_713823 ?auto_713824 ?auto_713825 ?auto_713826 ?auto_713827 ?auto_713828 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713944 - SURFACE
      ?auto_713945 - SURFACE
      ?auto_713946 - SURFACE
      ?auto_713948 - SURFACE
      ?auto_713947 - SURFACE
      ?auto_713949 - SURFACE
      ?auto_713950 - SURFACE
      ?auto_713951 - SURFACE
      ?auto_713952 - SURFACE
      ?auto_713953 - SURFACE
      ?auto_713954 - SURFACE
    )
    :vars
    (
      ?auto_713957 - HOIST
      ?auto_713956 - PLACE
      ?auto_713960 - PLACE
      ?auto_713955 - HOIST
      ?auto_713958 - SURFACE
      ?auto_713959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713957 ?auto_713956 ) ( IS-CRATE ?auto_713954 ) ( not ( = ?auto_713953 ?auto_713954 ) ) ( not ( = ?auto_713952 ?auto_713953 ) ) ( not ( = ?auto_713952 ?auto_713954 ) ) ( not ( = ?auto_713960 ?auto_713956 ) ) ( HOIST-AT ?auto_713955 ?auto_713960 ) ( not ( = ?auto_713957 ?auto_713955 ) ) ( AVAILABLE ?auto_713955 ) ( SURFACE-AT ?auto_713954 ?auto_713960 ) ( ON ?auto_713954 ?auto_713958 ) ( CLEAR ?auto_713954 ) ( not ( = ?auto_713953 ?auto_713958 ) ) ( not ( = ?auto_713954 ?auto_713958 ) ) ( not ( = ?auto_713952 ?auto_713958 ) ) ( TRUCK-AT ?auto_713959 ?auto_713956 ) ( SURFACE-AT ?auto_713952 ?auto_713956 ) ( CLEAR ?auto_713952 ) ( IS-CRATE ?auto_713953 ) ( AVAILABLE ?auto_713957 ) ( IN ?auto_713953 ?auto_713959 ) ( ON ?auto_713945 ?auto_713944 ) ( ON ?auto_713946 ?auto_713945 ) ( ON ?auto_713948 ?auto_713946 ) ( ON ?auto_713947 ?auto_713948 ) ( ON ?auto_713949 ?auto_713947 ) ( ON ?auto_713950 ?auto_713949 ) ( ON ?auto_713951 ?auto_713950 ) ( ON ?auto_713952 ?auto_713951 ) ( not ( = ?auto_713944 ?auto_713945 ) ) ( not ( = ?auto_713944 ?auto_713946 ) ) ( not ( = ?auto_713944 ?auto_713948 ) ) ( not ( = ?auto_713944 ?auto_713947 ) ) ( not ( = ?auto_713944 ?auto_713949 ) ) ( not ( = ?auto_713944 ?auto_713950 ) ) ( not ( = ?auto_713944 ?auto_713951 ) ) ( not ( = ?auto_713944 ?auto_713952 ) ) ( not ( = ?auto_713944 ?auto_713953 ) ) ( not ( = ?auto_713944 ?auto_713954 ) ) ( not ( = ?auto_713944 ?auto_713958 ) ) ( not ( = ?auto_713945 ?auto_713946 ) ) ( not ( = ?auto_713945 ?auto_713948 ) ) ( not ( = ?auto_713945 ?auto_713947 ) ) ( not ( = ?auto_713945 ?auto_713949 ) ) ( not ( = ?auto_713945 ?auto_713950 ) ) ( not ( = ?auto_713945 ?auto_713951 ) ) ( not ( = ?auto_713945 ?auto_713952 ) ) ( not ( = ?auto_713945 ?auto_713953 ) ) ( not ( = ?auto_713945 ?auto_713954 ) ) ( not ( = ?auto_713945 ?auto_713958 ) ) ( not ( = ?auto_713946 ?auto_713948 ) ) ( not ( = ?auto_713946 ?auto_713947 ) ) ( not ( = ?auto_713946 ?auto_713949 ) ) ( not ( = ?auto_713946 ?auto_713950 ) ) ( not ( = ?auto_713946 ?auto_713951 ) ) ( not ( = ?auto_713946 ?auto_713952 ) ) ( not ( = ?auto_713946 ?auto_713953 ) ) ( not ( = ?auto_713946 ?auto_713954 ) ) ( not ( = ?auto_713946 ?auto_713958 ) ) ( not ( = ?auto_713948 ?auto_713947 ) ) ( not ( = ?auto_713948 ?auto_713949 ) ) ( not ( = ?auto_713948 ?auto_713950 ) ) ( not ( = ?auto_713948 ?auto_713951 ) ) ( not ( = ?auto_713948 ?auto_713952 ) ) ( not ( = ?auto_713948 ?auto_713953 ) ) ( not ( = ?auto_713948 ?auto_713954 ) ) ( not ( = ?auto_713948 ?auto_713958 ) ) ( not ( = ?auto_713947 ?auto_713949 ) ) ( not ( = ?auto_713947 ?auto_713950 ) ) ( not ( = ?auto_713947 ?auto_713951 ) ) ( not ( = ?auto_713947 ?auto_713952 ) ) ( not ( = ?auto_713947 ?auto_713953 ) ) ( not ( = ?auto_713947 ?auto_713954 ) ) ( not ( = ?auto_713947 ?auto_713958 ) ) ( not ( = ?auto_713949 ?auto_713950 ) ) ( not ( = ?auto_713949 ?auto_713951 ) ) ( not ( = ?auto_713949 ?auto_713952 ) ) ( not ( = ?auto_713949 ?auto_713953 ) ) ( not ( = ?auto_713949 ?auto_713954 ) ) ( not ( = ?auto_713949 ?auto_713958 ) ) ( not ( = ?auto_713950 ?auto_713951 ) ) ( not ( = ?auto_713950 ?auto_713952 ) ) ( not ( = ?auto_713950 ?auto_713953 ) ) ( not ( = ?auto_713950 ?auto_713954 ) ) ( not ( = ?auto_713950 ?auto_713958 ) ) ( not ( = ?auto_713951 ?auto_713952 ) ) ( not ( = ?auto_713951 ?auto_713953 ) ) ( not ( = ?auto_713951 ?auto_713954 ) ) ( not ( = ?auto_713951 ?auto_713958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713952 ?auto_713953 ?auto_713954 )
      ( MAKE-10CRATE-VERIFY ?auto_713944 ?auto_713945 ?auto_713946 ?auto_713948 ?auto_713947 ?auto_713949 ?auto_713950 ?auto_713951 ?auto_713952 ?auto_713953 ?auto_713954 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721228 - SURFACE
      ?auto_721229 - SURFACE
      ?auto_721230 - SURFACE
      ?auto_721232 - SURFACE
      ?auto_721231 - SURFACE
      ?auto_721233 - SURFACE
      ?auto_721234 - SURFACE
      ?auto_721235 - SURFACE
      ?auto_721236 - SURFACE
      ?auto_721237 - SURFACE
      ?auto_721238 - SURFACE
      ?auto_721239 - SURFACE
    )
    :vars
    (
      ?auto_721240 - HOIST
      ?auto_721241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721240 ?auto_721241 ) ( SURFACE-AT ?auto_721238 ?auto_721241 ) ( CLEAR ?auto_721238 ) ( LIFTING ?auto_721240 ?auto_721239 ) ( IS-CRATE ?auto_721239 ) ( not ( = ?auto_721238 ?auto_721239 ) ) ( ON ?auto_721229 ?auto_721228 ) ( ON ?auto_721230 ?auto_721229 ) ( ON ?auto_721232 ?auto_721230 ) ( ON ?auto_721231 ?auto_721232 ) ( ON ?auto_721233 ?auto_721231 ) ( ON ?auto_721234 ?auto_721233 ) ( ON ?auto_721235 ?auto_721234 ) ( ON ?auto_721236 ?auto_721235 ) ( ON ?auto_721237 ?auto_721236 ) ( ON ?auto_721238 ?auto_721237 ) ( not ( = ?auto_721228 ?auto_721229 ) ) ( not ( = ?auto_721228 ?auto_721230 ) ) ( not ( = ?auto_721228 ?auto_721232 ) ) ( not ( = ?auto_721228 ?auto_721231 ) ) ( not ( = ?auto_721228 ?auto_721233 ) ) ( not ( = ?auto_721228 ?auto_721234 ) ) ( not ( = ?auto_721228 ?auto_721235 ) ) ( not ( = ?auto_721228 ?auto_721236 ) ) ( not ( = ?auto_721228 ?auto_721237 ) ) ( not ( = ?auto_721228 ?auto_721238 ) ) ( not ( = ?auto_721228 ?auto_721239 ) ) ( not ( = ?auto_721229 ?auto_721230 ) ) ( not ( = ?auto_721229 ?auto_721232 ) ) ( not ( = ?auto_721229 ?auto_721231 ) ) ( not ( = ?auto_721229 ?auto_721233 ) ) ( not ( = ?auto_721229 ?auto_721234 ) ) ( not ( = ?auto_721229 ?auto_721235 ) ) ( not ( = ?auto_721229 ?auto_721236 ) ) ( not ( = ?auto_721229 ?auto_721237 ) ) ( not ( = ?auto_721229 ?auto_721238 ) ) ( not ( = ?auto_721229 ?auto_721239 ) ) ( not ( = ?auto_721230 ?auto_721232 ) ) ( not ( = ?auto_721230 ?auto_721231 ) ) ( not ( = ?auto_721230 ?auto_721233 ) ) ( not ( = ?auto_721230 ?auto_721234 ) ) ( not ( = ?auto_721230 ?auto_721235 ) ) ( not ( = ?auto_721230 ?auto_721236 ) ) ( not ( = ?auto_721230 ?auto_721237 ) ) ( not ( = ?auto_721230 ?auto_721238 ) ) ( not ( = ?auto_721230 ?auto_721239 ) ) ( not ( = ?auto_721232 ?auto_721231 ) ) ( not ( = ?auto_721232 ?auto_721233 ) ) ( not ( = ?auto_721232 ?auto_721234 ) ) ( not ( = ?auto_721232 ?auto_721235 ) ) ( not ( = ?auto_721232 ?auto_721236 ) ) ( not ( = ?auto_721232 ?auto_721237 ) ) ( not ( = ?auto_721232 ?auto_721238 ) ) ( not ( = ?auto_721232 ?auto_721239 ) ) ( not ( = ?auto_721231 ?auto_721233 ) ) ( not ( = ?auto_721231 ?auto_721234 ) ) ( not ( = ?auto_721231 ?auto_721235 ) ) ( not ( = ?auto_721231 ?auto_721236 ) ) ( not ( = ?auto_721231 ?auto_721237 ) ) ( not ( = ?auto_721231 ?auto_721238 ) ) ( not ( = ?auto_721231 ?auto_721239 ) ) ( not ( = ?auto_721233 ?auto_721234 ) ) ( not ( = ?auto_721233 ?auto_721235 ) ) ( not ( = ?auto_721233 ?auto_721236 ) ) ( not ( = ?auto_721233 ?auto_721237 ) ) ( not ( = ?auto_721233 ?auto_721238 ) ) ( not ( = ?auto_721233 ?auto_721239 ) ) ( not ( = ?auto_721234 ?auto_721235 ) ) ( not ( = ?auto_721234 ?auto_721236 ) ) ( not ( = ?auto_721234 ?auto_721237 ) ) ( not ( = ?auto_721234 ?auto_721238 ) ) ( not ( = ?auto_721234 ?auto_721239 ) ) ( not ( = ?auto_721235 ?auto_721236 ) ) ( not ( = ?auto_721235 ?auto_721237 ) ) ( not ( = ?auto_721235 ?auto_721238 ) ) ( not ( = ?auto_721235 ?auto_721239 ) ) ( not ( = ?auto_721236 ?auto_721237 ) ) ( not ( = ?auto_721236 ?auto_721238 ) ) ( not ( = ?auto_721236 ?auto_721239 ) ) ( not ( = ?auto_721237 ?auto_721238 ) ) ( not ( = ?auto_721237 ?auto_721239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_721238 ?auto_721239 )
      ( MAKE-11CRATE-VERIFY ?auto_721228 ?auto_721229 ?auto_721230 ?auto_721232 ?auto_721231 ?auto_721233 ?auto_721234 ?auto_721235 ?auto_721236 ?auto_721237 ?auto_721238 ?auto_721239 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721337 - SURFACE
      ?auto_721338 - SURFACE
      ?auto_721339 - SURFACE
      ?auto_721341 - SURFACE
      ?auto_721340 - SURFACE
      ?auto_721342 - SURFACE
      ?auto_721343 - SURFACE
      ?auto_721344 - SURFACE
      ?auto_721345 - SURFACE
      ?auto_721346 - SURFACE
      ?auto_721347 - SURFACE
      ?auto_721348 - SURFACE
    )
    :vars
    (
      ?auto_721350 - HOIST
      ?auto_721351 - PLACE
      ?auto_721349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_721350 ?auto_721351 ) ( SURFACE-AT ?auto_721347 ?auto_721351 ) ( CLEAR ?auto_721347 ) ( IS-CRATE ?auto_721348 ) ( not ( = ?auto_721347 ?auto_721348 ) ) ( TRUCK-AT ?auto_721349 ?auto_721351 ) ( AVAILABLE ?auto_721350 ) ( IN ?auto_721348 ?auto_721349 ) ( ON ?auto_721347 ?auto_721346 ) ( not ( = ?auto_721346 ?auto_721347 ) ) ( not ( = ?auto_721346 ?auto_721348 ) ) ( ON ?auto_721338 ?auto_721337 ) ( ON ?auto_721339 ?auto_721338 ) ( ON ?auto_721341 ?auto_721339 ) ( ON ?auto_721340 ?auto_721341 ) ( ON ?auto_721342 ?auto_721340 ) ( ON ?auto_721343 ?auto_721342 ) ( ON ?auto_721344 ?auto_721343 ) ( ON ?auto_721345 ?auto_721344 ) ( ON ?auto_721346 ?auto_721345 ) ( not ( = ?auto_721337 ?auto_721338 ) ) ( not ( = ?auto_721337 ?auto_721339 ) ) ( not ( = ?auto_721337 ?auto_721341 ) ) ( not ( = ?auto_721337 ?auto_721340 ) ) ( not ( = ?auto_721337 ?auto_721342 ) ) ( not ( = ?auto_721337 ?auto_721343 ) ) ( not ( = ?auto_721337 ?auto_721344 ) ) ( not ( = ?auto_721337 ?auto_721345 ) ) ( not ( = ?auto_721337 ?auto_721346 ) ) ( not ( = ?auto_721337 ?auto_721347 ) ) ( not ( = ?auto_721337 ?auto_721348 ) ) ( not ( = ?auto_721338 ?auto_721339 ) ) ( not ( = ?auto_721338 ?auto_721341 ) ) ( not ( = ?auto_721338 ?auto_721340 ) ) ( not ( = ?auto_721338 ?auto_721342 ) ) ( not ( = ?auto_721338 ?auto_721343 ) ) ( not ( = ?auto_721338 ?auto_721344 ) ) ( not ( = ?auto_721338 ?auto_721345 ) ) ( not ( = ?auto_721338 ?auto_721346 ) ) ( not ( = ?auto_721338 ?auto_721347 ) ) ( not ( = ?auto_721338 ?auto_721348 ) ) ( not ( = ?auto_721339 ?auto_721341 ) ) ( not ( = ?auto_721339 ?auto_721340 ) ) ( not ( = ?auto_721339 ?auto_721342 ) ) ( not ( = ?auto_721339 ?auto_721343 ) ) ( not ( = ?auto_721339 ?auto_721344 ) ) ( not ( = ?auto_721339 ?auto_721345 ) ) ( not ( = ?auto_721339 ?auto_721346 ) ) ( not ( = ?auto_721339 ?auto_721347 ) ) ( not ( = ?auto_721339 ?auto_721348 ) ) ( not ( = ?auto_721341 ?auto_721340 ) ) ( not ( = ?auto_721341 ?auto_721342 ) ) ( not ( = ?auto_721341 ?auto_721343 ) ) ( not ( = ?auto_721341 ?auto_721344 ) ) ( not ( = ?auto_721341 ?auto_721345 ) ) ( not ( = ?auto_721341 ?auto_721346 ) ) ( not ( = ?auto_721341 ?auto_721347 ) ) ( not ( = ?auto_721341 ?auto_721348 ) ) ( not ( = ?auto_721340 ?auto_721342 ) ) ( not ( = ?auto_721340 ?auto_721343 ) ) ( not ( = ?auto_721340 ?auto_721344 ) ) ( not ( = ?auto_721340 ?auto_721345 ) ) ( not ( = ?auto_721340 ?auto_721346 ) ) ( not ( = ?auto_721340 ?auto_721347 ) ) ( not ( = ?auto_721340 ?auto_721348 ) ) ( not ( = ?auto_721342 ?auto_721343 ) ) ( not ( = ?auto_721342 ?auto_721344 ) ) ( not ( = ?auto_721342 ?auto_721345 ) ) ( not ( = ?auto_721342 ?auto_721346 ) ) ( not ( = ?auto_721342 ?auto_721347 ) ) ( not ( = ?auto_721342 ?auto_721348 ) ) ( not ( = ?auto_721343 ?auto_721344 ) ) ( not ( = ?auto_721343 ?auto_721345 ) ) ( not ( = ?auto_721343 ?auto_721346 ) ) ( not ( = ?auto_721343 ?auto_721347 ) ) ( not ( = ?auto_721343 ?auto_721348 ) ) ( not ( = ?auto_721344 ?auto_721345 ) ) ( not ( = ?auto_721344 ?auto_721346 ) ) ( not ( = ?auto_721344 ?auto_721347 ) ) ( not ( = ?auto_721344 ?auto_721348 ) ) ( not ( = ?auto_721345 ?auto_721346 ) ) ( not ( = ?auto_721345 ?auto_721347 ) ) ( not ( = ?auto_721345 ?auto_721348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721346 ?auto_721347 ?auto_721348 )
      ( MAKE-11CRATE-VERIFY ?auto_721337 ?auto_721338 ?auto_721339 ?auto_721341 ?auto_721340 ?auto_721342 ?auto_721343 ?auto_721344 ?auto_721345 ?auto_721346 ?auto_721347 ?auto_721348 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721458 - SURFACE
      ?auto_721459 - SURFACE
      ?auto_721460 - SURFACE
      ?auto_721462 - SURFACE
      ?auto_721461 - SURFACE
      ?auto_721463 - SURFACE
      ?auto_721464 - SURFACE
      ?auto_721465 - SURFACE
      ?auto_721466 - SURFACE
      ?auto_721467 - SURFACE
      ?auto_721468 - SURFACE
      ?auto_721469 - SURFACE
    )
    :vars
    (
      ?auto_721473 - HOIST
      ?auto_721470 - PLACE
      ?auto_721471 - TRUCK
      ?auto_721472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721473 ?auto_721470 ) ( SURFACE-AT ?auto_721468 ?auto_721470 ) ( CLEAR ?auto_721468 ) ( IS-CRATE ?auto_721469 ) ( not ( = ?auto_721468 ?auto_721469 ) ) ( AVAILABLE ?auto_721473 ) ( IN ?auto_721469 ?auto_721471 ) ( ON ?auto_721468 ?auto_721467 ) ( not ( = ?auto_721467 ?auto_721468 ) ) ( not ( = ?auto_721467 ?auto_721469 ) ) ( TRUCK-AT ?auto_721471 ?auto_721472 ) ( not ( = ?auto_721472 ?auto_721470 ) ) ( ON ?auto_721459 ?auto_721458 ) ( ON ?auto_721460 ?auto_721459 ) ( ON ?auto_721462 ?auto_721460 ) ( ON ?auto_721461 ?auto_721462 ) ( ON ?auto_721463 ?auto_721461 ) ( ON ?auto_721464 ?auto_721463 ) ( ON ?auto_721465 ?auto_721464 ) ( ON ?auto_721466 ?auto_721465 ) ( ON ?auto_721467 ?auto_721466 ) ( not ( = ?auto_721458 ?auto_721459 ) ) ( not ( = ?auto_721458 ?auto_721460 ) ) ( not ( = ?auto_721458 ?auto_721462 ) ) ( not ( = ?auto_721458 ?auto_721461 ) ) ( not ( = ?auto_721458 ?auto_721463 ) ) ( not ( = ?auto_721458 ?auto_721464 ) ) ( not ( = ?auto_721458 ?auto_721465 ) ) ( not ( = ?auto_721458 ?auto_721466 ) ) ( not ( = ?auto_721458 ?auto_721467 ) ) ( not ( = ?auto_721458 ?auto_721468 ) ) ( not ( = ?auto_721458 ?auto_721469 ) ) ( not ( = ?auto_721459 ?auto_721460 ) ) ( not ( = ?auto_721459 ?auto_721462 ) ) ( not ( = ?auto_721459 ?auto_721461 ) ) ( not ( = ?auto_721459 ?auto_721463 ) ) ( not ( = ?auto_721459 ?auto_721464 ) ) ( not ( = ?auto_721459 ?auto_721465 ) ) ( not ( = ?auto_721459 ?auto_721466 ) ) ( not ( = ?auto_721459 ?auto_721467 ) ) ( not ( = ?auto_721459 ?auto_721468 ) ) ( not ( = ?auto_721459 ?auto_721469 ) ) ( not ( = ?auto_721460 ?auto_721462 ) ) ( not ( = ?auto_721460 ?auto_721461 ) ) ( not ( = ?auto_721460 ?auto_721463 ) ) ( not ( = ?auto_721460 ?auto_721464 ) ) ( not ( = ?auto_721460 ?auto_721465 ) ) ( not ( = ?auto_721460 ?auto_721466 ) ) ( not ( = ?auto_721460 ?auto_721467 ) ) ( not ( = ?auto_721460 ?auto_721468 ) ) ( not ( = ?auto_721460 ?auto_721469 ) ) ( not ( = ?auto_721462 ?auto_721461 ) ) ( not ( = ?auto_721462 ?auto_721463 ) ) ( not ( = ?auto_721462 ?auto_721464 ) ) ( not ( = ?auto_721462 ?auto_721465 ) ) ( not ( = ?auto_721462 ?auto_721466 ) ) ( not ( = ?auto_721462 ?auto_721467 ) ) ( not ( = ?auto_721462 ?auto_721468 ) ) ( not ( = ?auto_721462 ?auto_721469 ) ) ( not ( = ?auto_721461 ?auto_721463 ) ) ( not ( = ?auto_721461 ?auto_721464 ) ) ( not ( = ?auto_721461 ?auto_721465 ) ) ( not ( = ?auto_721461 ?auto_721466 ) ) ( not ( = ?auto_721461 ?auto_721467 ) ) ( not ( = ?auto_721461 ?auto_721468 ) ) ( not ( = ?auto_721461 ?auto_721469 ) ) ( not ( = ?auto_721463 ?auto_721464 ) ) ( not ( = ?auto_721463 ?auto_721465 ) ) ( not ( = ?auto_721463 ?auto_721466 ) ) ( not ( = ?auto_721463 ?auto_721467 ) ) ( not ( = ?auto_721463 ?auto_721468 ) ) ( not ( = ?auto_721463 ?auto_721469 ) ) ( not ( = ?auto_721464 ?auto_721465 ) ) ( not ( = ?auto_721464 ?auto_721466 ) ) ( not ( = ?auto_721464 ?auto_721467 ) ) ( not ( = ?auto_721464 ?auto_721468 ) ) ( not ( = ?auto_721464 ?auto_721469 ) ) ( not ( = ?auto_721465 ?auto_721466 ) ) ( not ( = ?auto_721465 ?auto_721467 ) ) ( not ( = ?auto_721465 ?auto_721468 ) ) ( not ( = ?auto_721465 ?auto_721469 ) ) ( not ( = ?auto_721466 ?auto_721467 ) ) ( not ( = ?auto_721466 ?auto_721468 ) ) ( not ( = ?auto_721466 ?auto_721469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721467 ?auto_721468 ?auto_721469 )
      ( MAKE-11CRATE-VERIFY ?auto_721458 ?auto_721459 ?auto_721460 ?auto_721462 ?auto_721461 ?auto_721463 ?auto_721464 ?auto_721465 ?auto_721466 ?auto_721467 ?auto_721468 ?auto_721469 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721590 - SURFACE
      ?auto_721591 - SURFACE
      ?auto_721592 - SURFACE
      ?auto_721594 - SURFACE
      ?auto_721593 - SURFACE
      ?auto_721595 - SURFACE
      ?auto_721596 - SURFACE
      ?auto_721597 - SURFACE
      ?auto_721598 - SURFACE
      ?auto_721599 - SURFACE
      ?auto_721600 - SURFACE
      ?auto_721601 - SURFACE
    )
    :vars
    (
      ?auto_721604 - HOIST
      ?auto_721603 - PLACE
      ?auto_721606 - TRUCK
      ?auto_721605 - PLACE
      ?auto_721602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_721604 ?auto_721603 ) ( SURFACE-AT ?auto_721600 ?auto_721603 ) ( CLEAR ?auto_721600 ) ( IS-CRATE ?auto_721601 ) ( not ( = ?auto_721600 ?auto_721601 ) ) ( AVAILABLE ?auto_721604 ) ( ON ?auto_721600 ?auto_721599 ) ( not ( = ?auto_721599 ?auto_721600 ) ) ( not ( = ?auto_721599 ?auto_721601 ) ) ( TRUCK-AT ?auto_721606 ?auto_721605 ) ( not ( = ?auto_721605 ?auto_721603 ) ) ( HOIST-AT ?auto_721602 ?auto_721605 ) ( LIFTING ?auto_721602 ?auto_721601 ) ( not ( = ?auto_721604 ?auto_721602 ) ) ( ON ?auto_721591 ?auto_721590 ) ( ON ?auto_721592 ?auto_721591 ) ( ON ?auto_721594 ?auto_721592 ) ( ON ?auto_721593 ?auto_721594 ) ( ON ?auto_721595 ?auto_721593 ) ( ON ?auto_721596 ?auto_721595 ) ( ON ?auto_721597 ?auto_721596 ) ( ON ?auto_721598 ?auto_721597 ) ( ON ?auto_721599 ?auto_721598 ) ( not ( = ?auto_721590 ?auto_721591 ) ) ( not ( = ?auto_721590 ?auto_721592 ) ) ( not ( = ?auto_721590 ?auto_721594 ) ) ( not ( = ?auto_721590 ?auto_721593 ) ) ( not ( = ?auto_721590 ?auto_721595 ) ) ( not ( = ?auto_721590 ?auto_721596 ) ) ( not ( = ?auto_721590 ?auto_721597 ) ) ( not ( = ?auto_721590 ?auto_721598 ) ) ( not ( = ?auto_721590 ?auto_721599 ) ) ( not ( = ?auto_721590 ?auto_721600 ) ) ( not ( = ?auto_721590 ?auto_721601 ) ) ( not ( = ?auto_721591 ?auto_721592 ) ) ( not ( = ?auto_721591 ?auto_721594 ) ) ( not ( = ?auto_721591 ?auto_721593 ) ) ( not ( = ?auto_721591 ?auto_721595 ) ) ( not ( = ?auto_721591 ?auto_721596 ) ) ( not ( = ?auto_721591 ?auto_721597 ) ) ( not ( = ?auto_721591 ?auto_721598 ) ) ( not ( = ?auto_721591 ?auto_721599 ) ) ( not ( = ?auto_721591 ?auto_721600 ) ) ( not ( = ?auto_721591 ?auto_721601 ) ) ( not ( = ?auto_721592 ?auto_721594 ) ) ( not ( = ?auto_721592 ?auto_721593 ) ) ( not ( = ?auto_721592 ?auto_721595 ) ) ( not ( = ?auto_721592 ?auto_721596 ) ) ( not ( = ?auto_721592 ?auto_721597 ) ) ( not ( = ?auto_721592 ?auto_721598 ) ) ( not ( = ?auto_721592 ?auto_721599 ) ) ( not ( = ?auto_721592 ?auto_721600 ) ) ( not ( = ?auto_721592 ?auto_721601 ) ) ( not ( = ?auto_721594 ?auto_721593 ) ) ( not ( = ?auto_721594 ?auto_721595 ) ) ( not ( = ?auto_721594 ?auto_721596 ) ) ( not ( = ?auto_721594 ?auto_721597 ) ) ( not ( = ?auto_721594 ?auto_721598 ) ) ( not ( = ?auto_721594 ?auto_721599 ) ) ( not ( = ?auto_721594 ?auto_721600 ) ) ( not ( = ?auto_721594 ?auto_721601 ) ) ( not ( = ?auto_721593 ?auto_721595 ) ) ( not ( = ?auto_721593 ?auto_721596 ) ) ( not ( = ?auto_721593 ?auto_721597 ) ) ( not ( = ?auto_721593 ?auto_721598 ) ) ( not ( = ?auto_721593 ?auto_721599 ) ) ( not ( = ?auto_721593 ?auto_721600 ) ) ( not ( = ?auto_721593 ?auto_721601 ) ) ( not ( = ?auto_721595 ?auto_721596 ) ) ( not ( = ?auto_721595 ?auto_721597 ) ) ( not ( = ?auto_721595 ?auto_721598 ) ) ( not ( = ?auto_721595 ?auto_721599 ) ) ( not ( = ?auto_721595 ?auto_721600 ) ) ( not ( = ?auto_721595 ?auto_721601 ) ) ( not ( = ?auto_721596 ?auto_721597 ) ) ( not ( = ?auto_721596 ?auto_721598 ) ) ( not ( = ?auto_721596 ?auto_721599 ) ) ( not ( = ?auto_721596 ?auto_721600 ) ) ( not ( = ?auto_721596 ?auto_721601 ) ) ( not ( = ?auto_721597 ?auto_721598 ) ) ( not ( = ?auto_721597 ?auto_721599 ) ) ( not ( = ?auto_721597 ?auto_721600 ) ) ( not ( = ?auto_721597 ?auto_721601 ) ) ( not ( = ?auto_721598 ?auto_721599 ) ) ( not ( = ?auto_721598 ?auto_721600 ) ) ( not ( = ?auto_721598 ?auto_721601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721599 ?auto_721600 ?auto_721601 )
      ( MAKE-11CRATE-VERIFY ?auto_721590 ?auto_721591 ?auto_721592 ?auto_721594 ?auto_721593 ?auto_721595 ?auto_721596 ?auto_721597 ?auto_721598 ?auto_721599 ?auto_721600 ?auto_721601 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721733 - SURFACE
      ?auto_721734 - SURFACE
      ?auto_721735 - SURFACE
      ?auto_721737 - SURFACE
      ?auto_721736 - SURFACE
      ?auto_721738 - SURFACE
      ?auto_721739 - SURFACE
      ?auto_721740 - SURFACE
      ?auto_721741 - SURFACE
      ?auto_721742 - SURFACE
      ?auto_721743 - SURFACE
      ?auto_721744 - SURFACE
    )
    :vars
    (
      ?auto_721747 - HOIST
      ?auto_721748 - PLACE
      ?auto_721745 - TRUCK
      ?auto_721746 - PLACE
      ?auto_721750 - HOIST
      ?auto_721749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721747 ?auto_721748 ) ( SURFACE-AT ?auto_721743 ?auto_721748 ) ( CLEAR ?auto_721743 ) ( IS-CRATE ?auto_721744 ) ( not ( = ?auto_721743 ?auto_721744 ) ) ( AVAILABLE ?auto_721747 ) ( ON ?auto_721743 ?auto_721742 ) ( not ( = ?auto_721742 ?auto_721743 ) ) ( not ( = ?auto_721742 ?auto_721744 ) ) ( TRUCK-AT ?auto_721745 ?auto_721746 ) ( not ( = ?auto_721746 ?auto_721748 ) ) ( HOIST-AT ?auto_721750 ?auto_721746 ) ( not ( = ?auto_721747 ?auto_721750 ) ) ( AVAILABLE ?auto_721750 ) ( SURFACE-AT ?auto_721744 ?auto_721746 ) ( ON ?auto_721744 ?auto_721749 ) ( CLEAR ?auto_721744 ) ( not ( = ?auto_721743 ?auto_721749 ) ) ( not ( = ?auto_721744 ?auto_721749 ) ) ( not ( = ?auto_721742 ?auto_721749 ) ) ( ON ?auto_721734 ?auto_721733 ) ( ON ?auto_721735 ?auto_721734 ) ( ON ?auto_721737 ?auto_721735 ) ( ON ?auto_721736 ?auto_721737 ) ( ON ?auto_721738 ?auto_721736 ) ( ON ?auto_721739 ?auto_721738 ) ( ON ?auto_721740 ?auto_721739 ) ( ON ?auto_721741 ?auto_721740 ) ( ON ?auto_721742 ?auto_721741 ) ( not ( = ?auto_721733 ?auto_721734 ) ) ( not ( = ?auto_721733 ?auto_721735 ) ) ( not ( = ?auto_721733 ?auto_721737 ) ) ( not ( = ?auto_721733 ?auto_721736 ) ) ( not ( = ?auto_721733 ?auto_721738 ) ) ( not ( = ?auto_721733 ?auto_721739 ) ) ( not ( = ?auto_721733 ?auto_721740 ) ) ( not ( = ?auto_721733 ?auto_721741 ) ) ( not ( = ?auto_721733 ?auto_721742 ) ) ( not ( = ?auto_721733 ?auto_721743 ) ) ( not ( = ?auto_721733 ?auto_721744 ) ) ( not ( = ?auto_721733 ?auto_721749 ) ) ( not ( = ?auto_721734 ?auto_721735 ) ) ( not ( = ?auto_721734 ?auto_721737 ) ) ( not ( = ?auto_721734 ?auto_721736 ) ) ( not ( = ?auto_721734 ?auto_721738 ) ) ( not ( = ?auto_721734 ?auto_721739 ) ) ( not ( = ?auto_721734 ?auto_721740 ) ) ( not ( = ?auto_721734 ?auto_721741 ) ) ( not ( = ?auto_721734 ?auto_721742 ) ) ( not ( = ?auto_721734 ?auto_721743 ) ) ( not ( = ?auto_721734 ?auto_721744 ) ) ( not ( = ?auto_721734 ?auto_721749 ) ) ( not ( = ?auto_721735 ?auto_721737 ) ) ( not ( = ?auto_721735 ?auto_721736 ) ) ( not ( = ?auto_721735 ?auto_721738 ) ) ( not ( = ?auto_721735 ?auto_721739 ) ) ( not ( = ?auto_721735 ?auto_721740 ) ) ( not ( = ?auto_721735 ?auto_721741 ) ) ( not ( = ?auto_721735 ?auto_721742 ) ) ( not ( = ?auto_721735 ?auto_721743 ) ) ( not ( = ?auto_721735 ?auto_721744 ) ) ( not ( = ?auto_721735 ?auto_721749 ) ) ( not ( = ?auto_721737 ?auto_721736 ) ) ( not ( = ?auto_721737 ?auto_721738 ) ) ( not ( = ?auto_721737 ?auto_721739 ) ) ( not ( = ?auto_721737 ?auto_721740 ) ) ( not ( = ?auto_721737 ?auto_721741 ) ) ( not ( = ?auto_721737 ?auto_721742 ) ) ( not ( = ?auto_721737 ?auto_721743 ) ) ( not ( = ?auto_721737 ?auto_721744 ) ) ( not ( = ?auto_721737 ?auto_721749 ) ) ( not ( = ?auto_721736 ?auto_721738 ) ) ( not ( = ?auto_721736 ?auto_721739 ) ) ( not ( = ?auto_721736 ?auto_721740 ) ) ( not ( = ?auto_721736 ?auto_721741 ) ) ( not ( = ?auto_721736 ?auto_721742 ) ) ( not ( = ?auto_721736 ?auto_721743 ) ) ( not ( = ?auto_721736 ?auto_721744 ) ) ( not ( = ?auto_721736 ?auto_721749 ) ) ( not ( = ?auto_721738 ?auto_721739 ) ) ( not ( = ?auto_721738 ?auto_721740 ) ) ( not ( = ?auto_721738 ?auto_721741 ) ) ( not ( = ?auto_721738 ?auto_721742 ) ) ( not ( = ?auto_721738 ?auto_721743 ) ) ( not ( = ?auto_721738 ?auto_721744 ) ) ( not ( = ?auto_721738 ?auto_721749 ) ) ( not ( = ?auto_721739 ?auto_721740 ) ) ( not ( = ?auto_721739 ?auto_721741 ) ) ( not ( = ?auto_721739 ?auto_721742 ) ) ( not ( = ?auto_721739 ?auto_721743 ) ) ( not ( = ?auto_721739 ?auto_721744 ) ) ( not ( = ?auto_721739 ?auto_721749 ) ) ( not ( = ?auto_721740 ?auto_721741 ) ) ( not ( = ?auto_721740 ?auto_721742 ) ) ( not ( = ?auto_721740 ?auto_721743 ) ) ( not ( = ?auto_721740 ?auto_721744 ) ) ( not ( = ?auto_721740 ?auto_721749 ) ) ( not ( = ?auto_721741 ?auto_721742 ) ) ( not ( = ?auto_721741 ?auto_721743 ) ) ( not ( = ?auto_721741 ?auto_721744 ) ) ( not ( = ?auto_721741 ?auto_721749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721742 ?auto_721743 ?auto_721744 )
      ( MAKE-11CRATE-VERIFY ?auto_721733 ?auto_721734 ?auto_721735 ?auto_721737 ?auto_721736 ?auto_721738 ?auto_721739 ?auto_721740 ?auto_721741 ?auto_721742 ?auto_721743 ?auto_721744 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721877 - SURFACE
      ?auto_721878 - SURFACE
      ?auto_721879 - SURFACE
      ?auto_721881 - SURFACE
      ?auto_721880 - SURFACE
      ?auto_721882 - SURFACE
      ?auto_721883 - SURFACE
      ?auto_721884 - SURFACE
      ?auto_721885 - SURFACE
      ?auto_721886 - SURFACE
      ?auto_721887 - SURFACE
      ?auto_721888 - SURFACE
    )
    :vars
    (
      ?auto_721889 - HOIST
      ?auto_721891 - PLACE
      ?auto_721892 - PLACE
      ?auto_721890 - HOIST
      ?auto_721893 - SURFACE
      ?auto_721894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_721889 ?auto_721891 ) ( SURFACE-AT ?auto_721887 ?auto_721891 ) ( CLEAR ?auto_721887 ) ( IS-CRATE ?auto_721888 ) ( not ( = ?auto_721887 ?auto_721888 ) ) ( AVAILABLE ?auto_721889 ) ( ON ?auto_721887 ?auto_721886 ) ( not ( = ?auto_721886 ?auto_721887 ) ) ( not ( = ?auto_721886 ?auto_721888 ) ) ( not ( = ?auto_721892 ?auto_721891 ) ) ( HOIST-AT ?auto_721890 ?auto_721892 ) ( not ( = ?auto_721889 ?auto_721890 ) ) ( AVAILABLE ?auto_721890 ) ( SURFACE-AT ?auto_721888 ?auto_721892 ) ( ON ?auto_721888 ?auto_721893 ) ( CLEAR ?auto_721888 ) ( not ( = ?auto_721887 ?auto_721893 ) ) ( not ( = ?auto_721888 ?auto_721893 ) ) ( not ( = ?auto_721886 ?auto_721893 ) ) ( TRUCK-AT ?auto_721894 ?auto_721891 ) ( ON ?auto_721878 ?auto_721877 ) ( ON ?auto_721879 ?auto_721878 ) ( ON ?auto_721881 ?auto_721879 ) ( ON ?auto_721880 ?auto_721881 ) ( ON ?auto_721882 ?auto_721880 ) ( ON ?auto_721883 ?auto_721882 ) ( ON ?auto_721884 ?auto_721883 ) ( ON ?auto_721885 ?auto_721884 ) ( ON ?auto_721886 ?auto_721885 ) ( not ( = ?auto_721877 ?auto_721878 ) ) ( not ( = ?auto_721877 ?auto_721879 ) ) ( not ( = ?auto_721877 ?auto_721881 ) ) ( not ( = ?auto_721877 ?auto_721880 ) ) ( not ( = ?auto_721877 ?auto_721882 ) ) ( not ( = ?auto_721877 ?auto_721883 ) ) ( not ( = ?auto_721877 ?auto_721884 ) ) ( not ( = ?auto_721877 ?auto_721885 ) ) ( not ( = ?auto_721877 ?auto_721886 ) ) ( not ( = ?auto_721877 ?auto_721887 ) ) ( not ( = ?auto_721877 ?auto_721888 ) ) ( not ( = ?auto_721877 ?auto_721893 ) ) ( not ( = ?auto_721878 ?auto_721879 ) ) ( not ( = ?auto_721878 ?auto_721881 ) ) ( not ( = ?auto_721878 ?auto_721880 ) ) ( not ( = ?auto_721878 ?auto_721882 ) ) ( not ( = ?auto_721878 ?auto_721883 ) ) ( not ( = ?auto_721878 ?auto_721884 ) ) ( not ( = ?auto_721878 ?auto_721885 ) ) ( not ( = ?auto_721878 ?auto_721886 ) ) ( not ( = ?auto_721878 ?auto_721887 ) ) ( not ( = ?auto_721878 ?auto_721888 ) ) ( not ( = ?auto_721878 ?auto_721893 ) ) ( not ( = ?auto_721879 ?auto_721881 ) ) ( not ( = ?auto_721879 ?auto_721880 ) ) ( not ( = ?auto_721879 ?auto_721882 ) ) ( not ( = ?auto_721879 ?auto_721883 ) ) ( not ( = ?auto_721879 ?auto_721884 ) ) ( not ( = ?auto_721879 ?auto_721885 ) ) ( not ( = ?auto_721879 ?auto_721886 ) ) ( not ( = ?auto_721879 ?auto_721887 ) ) ( not ( = ?auto_721879 ?auto_721888 ) ) ( not ( = ?auto_721879 ?auto_721893 ) ) ( not ( = ?auto_721881 ?auto_721880 ) ) ( not ( = ?auto_721881 ?auto_721882 ) ) ( not ( = ?auto_721881 ?auto_721883 ) ) ( not ( = ?auto_721881 ?auto_721884 ) ) ( not ( = ?auto_721881 ?auto_721885 ) ) ( not ( = ?auto_721881 ?auto_721886 ) ) ( not ( = ?auto_721881 ?auto_721887 ) ) ( not ( = ?auto_721881 ?auto_721888 ) ) ( not ( = ?auto_721881 ?auto_721893 ) ) ( not ( = ?auto_721880 ?auto_721882 ) ) ( not ( = ?auto_721880 ?auto_721883 ) ) ( not ( = ?auto_721880 ?auto_721884 ) ) ( not ( = ?auto_721880 ?auto_721885 ) ) ( not ( = ?auto_721880 ?auto_721886 ) ) ( not ( = ?auto_721880 ?auto_721887 ) ) ( not ( = ?auto_721880 ?auto_721888 ) ) ( not ( = ?auto_721880 ?auto_721893 ) ) ( not ( = ?auto_721882 ?auto_721883 ) ) ( not ( = ?auto_721882 ?auto_721884 ) ) ( not ( = ?auto_721882 ?auto_721885 ) ) ( not ( = ?auto_721882 ?auto_721886 ) ) ( not ( = ?auto_721882 ?auto_721887 ) ) ( not ( = ?auto_721882 ?auto_721888 ) ) ( not ( = ?auto_721882 ?auto_721893 ) ) ( not ( = ?auto_721883 ?auto_721884 ) ) ( not ( = ?auto_721883 ?auto_721885 ) ) ( not ( = ?auto_721883 ?auto_721886 ) ) ( not ( = ?auto_721883 ?auto_721887 ) ) ( not ( = ?auto_721883 ?auto_721888 ) ) ( not ( = ?auto_721883 ?auto_721893 ) ) ( not ( = ?auto_721884 ?auto_721885 ) ) ( not ( = ?auto_721884 ?auto_721886 ) ) ( not ( = ?auto_721884 ?auto_721887 ) ) ( not ( = ?auto_721884 ?auto_721888 ) ) ( not ( = ?auto_721884 ?auto_721893 ) ) ( not ( = ?auto_721885 ?auto_721886 ) ) ( not ( = ?auto_721885 ?auto_721887 ) ) ( not ( = ?auto_721885 ?auto_721888 ) ) ( not ( = ?auto_721885 ?auto_721893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721886 ?auto_721887 ?auto_721888 )
      ( MAKE-11CRATE-VERIFY ?auto_721877 ?auto_721878 ?auto_721879 ?auto_721881 ?auto_721880 ?auto_721882 ?auto_721883 ?auto_721884 ?auto_721885 ?auto_721886 ?auto_721887 ?auto_721888 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722021 - SURFACE
      ?auto_722022 - SURFACE
      ?auto_722023 - SURFACE
      ?auto_722025 - SURFACE
      ?auto_722024 - SURFACE
      ?auto_722026 - SURFACE
      ?auto_722027 - SURFACE
      ?auto_722028 - SURFACE
      ?auto_722029 - SURFACE
      ?auto_722030 - SURFACE
      ?auto_722031 - SURFACE
      ?auto_722032 - SURFACE
    )
    :vars
    (
      ?auto_722033 - HOIST
      ?auto_722037 - PLACE
      ?auto_722038 - PLACE
      ?auto_722036 - HOIST
      ?auto_722035 - SURFACE
      ?auto_722034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722033 ?auto_722037 ) ( IS-CRATE ?auto_722032 ) ( not ( = ?auto_722031 ?auto_722032 ) ) ( not ( = ?auto_722030 ?auto_722031 ) ) ( not ( = ?auto_722030 ?auto_722032 ) ) ( not ( = ?auto_722038 ?auto_722037 ) ) ( HOIST-AT ?auto_722036 ?auto_722038 ) ( not ( = ?auto_722033 ?auto_722036 ) ) ( AVAILABLE ?auto_722036 ) ( SURFACE-AT ?auto_722032 ?auto_722038 ) ( ON ?auto_722032 ?auto_722035 ) ( CLEAR ?auto_722032 ) ( not ( = ?auto_722031 ?auto_722035 ) ) ( not ( = ?auto_722032 ?auto_722035 ) ) ( not ( = ?auto_722030 ?auto_722035 ) ) ( TRUCK-AT ?auto_722034 ?auto_722037 ) ( SURFACE-AT ?auto_722030 ?auto_722037 ) ( CLEAR ?auto_722030 ) ( LIFTING ?auto_722033 ?auto_722031 ) ( IS-CRATE ?auto_722031 ) ( ON ?auto_722022 ?auto_722021 ) ( ON ?auto_722023 ?auto_722022 ) ( ON ?auto_722025 ?auto_722023 ) ( ON ?auto_722024 ?auto_722025 ) ( ON ?auto_722026 ?auto_722024 ) ( ON ?auto_722027 ?auto_722026 ) ( ON ?auto_722028 ?auto_722027 ) ( ON ?auto_722029 ?auto_722028 ) ( ON ?auto_722030 ?auto_722029 ) ( not ( = ?auto_722021 ?auto_722022 ) ) ( not ( = ?auto_722021 ?auto_722023 ) ) ( not ( = ?auto_722021 ?auto_722025 ) ) ( not ( = ?auto_722021 ?auto_722024 ) ) ( not ( = ?auto_722021 ?auto_722026 ) ) ( not ( = ?auto_722021 ?auto_722027 ) ) ( not ( = ?auto_722021 ?auto_722028 ) ) ( not ( = ?auto_722021 ?auto_722029 ) ) ( not ( = ?auto_722021 ?auto_722030 ) ) ( not ( = ?auto_722021 ?auto_722031 ) ) ( not ( = ?auto_722021 ?auto_722032 ) ) ( not ( = ?auto_722021 ?auto_722035 ) ) ( not ( = ?auto_722022 ?auto_722023 ) ) ( not ( = ?auto_722022 ?auto_722025 ) ) ( not ( = ?auto_722022 ?auto_722024 ) ) ( not ( = ?auto_722022 ?auto_722026 ) ) ( not ( = ?auto_722022 ?auto_722027 ) ) ( not ( = ?auto_722022 ?auto_722028 ) ) ( not ( = ?auto_722022 ?auto_722029 ) ) ( not ( = ?auto_722022 ?auto_722030 ) ) ( not ( = ?auto_722022 ?auto_722031 ) ) ( not ( = ?auto_722022 ?auto_722032 ) ) ( not ( = ?auto_722022 ?auto_722035 ) ) ( not ( = ?auto_722023 ?auto_722025 ) ) ( not ( = ?auto_722023 ?auto_722024 ) ) ( not ( = ?auto_722023 ?auto_722026 ) ) ( not ( = ?auto_722023 ?auto_722027 ) ) ( not ( = ?auto_722023 ?auto_722028 ) ) ( not ( = ?auto_722023 ?auto_722029 ) ) ( not ( = ?auto_722023 ?auto_722030 ) ) ( not ( = ?auto_722023 ?auto_722031 ) ) ( not ( = ?auto_722023 ?auto_722032 ) ) ( not ( = ?auto_722023 ?auto_722035 ) ) ( not ( = ?auto_722025 ?auto_722024 ) ) ( not ( = ?auto_722025 ?auto_722026 ) ) ( not ( = ?auto_722025 ?auto_722027 ) ) ( not ( = ?auto_722025 ?auto_722028 ) ) ( not ( = ?auto_722025 ?auto_722029 ) ) ( not ( = ?auto_722025 ?auto_722030 ) ) ( not ( = ?auto_722025 ?auto_722031 ) ) ( not ( = ?auto_722025 ?auto_722032 ) ) ( not ( = ?auto_722025 ?auto_722035 ) ) ( not ( = ?auto_722024 ?auto_722026 ) ) ( not ( = ?auto_722024 ?auto_722027 ) ) ( not ( = ?auto_722024 ?auto_722028 ) ) ( not ( = ?auto_722024 ?auto_722029 ) ) ( not ( = ?auto_722024 ?auto_722030 ) ) ( not ( = ?auto_722024 ?auto_722031 ) ) ( not ( = ?auto_722024 ?auto_722032 ) ) ( not ( = ?auto_722024 ?auto_722035 ) ) ( not ( = ?auto_722026 ?auto_722027 ) ) ( not ( = ?auto_722026 ?auto_722028 ) ) ( not ( = ?auto_722026 ?auto_722029 ) ) ( not ( = ?auto_722026 ?auto_722030 ) ) ( not ( = ?auto_722026 ?auto_722031 ) ) ( not ( = ?auto_722026 ?auto_722032 ) ) ( not ( = ?auto_722026 ?auto_722035 ) ) ( not ( = ?auto_722027 ?auto_722028 ) ) ( not ( = ?auto_722027 ?auto_722029 ) ) ( not ( = ?auto_722027 ?auto_722030 ) ) ( not ( = ?auto_722027 ?auto_722031 ) ) ( not ( = ?auto_722027 ?auto_722032 ) ) ( not ( = ?auto_722027 ?auto_722035 ) ) ( not ( = ?auto_722028 ?auto_722029 ) ) ( not ( = ?auto_722028 ?auto_722030 ) ) ( not ( = ?auto_722028 ?auto_722031 ) ) ( not ( = ?auto_722028 ?auto_722032 ) ) ( not ( = ?auto_722028 ?auto_722035 ) ) ( not ( = ?auto_722029 ?auto_722030 ) ) ( not ( = ?auto_722029 ?auto_722031 ) ) ( not ( = ?auto_722029 ?auto_722032 ) ) ( not ( = ?auto_722029 ?auto_722035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722030 ?auto_722031 ?auto_722032 )
      ( MAKE-11CRATE-VERIFY ?auto_722021 ?auto_722022 ?auto_722023 ?auto_722025 ?auto_722024 ?auto_722026 ?auto_722027 ?auto_722028 ?auto_722029 ?auto_722030 ?auto_722031 ?auto_722032 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722165 - SURFACE
      ?auto_722166 - SURFACE
      ?auto_722167 - SURFACE
      ?auto_722169 - SURFACE
      ?auto_722168 - SURFACE
      ?auto_722170 - SURFACE
      ?auto_722171 - SURFACE
      ?auto_722172 - SURFACE
      ?auto_722173 - SURFACE
      ?auto_722174 - SURFACE
      ?auto_722175 - SURFACE
      ?auto_722176 - SURFACE
    )
    :vars
    (
      ?auto_722177 - HOIST
      ?auto_722182 - PLACE
      ?auto_722181 - PLACE
      ?auto_722179 - HOIST
      ?auto_722180 - SURFACE
      ?auto_722178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722177 ?auto_722182 ) ( IS-CRATE ?auto_722176 ) ( not ( = ?auto_722175 ?auto_722176 ) ) ( not ( = ?auto_722174 ?auto_722175 ) ) ( not ( = ?auto_722174 ?auto_722176 ) ) ( not ( = ?auto_722181 ?auto_722182 ) ) ( HOIST-AT ?auto_722179 ?auto_722181 ) ( not ( = ?auto_722177 ?auto_722179 ) ) ( AVAILABLE ?auto_722179 ) ( SURFACE-AT ?auto_722176 ?auto_722181 ) ( ON ?auto_722176 ?auto_722180 ) ( CLEAR ?auto_722176 ) ( not ( = ?auto_722175 ?auto_722180 ) ) ( not ( = ?auto_722176 ?auto_722180 ) ) ( not ( = ?auto_722174 ?auto_722180 ) ) ( TRUCK-AT ?auto_722178 ?auto_722182 ) ( SURFACE-AT ?auto_722174 ?auto_722182 ) ( CLEAR ?auto_722174 ) ( IS-CRATE ?auto_722175 ) ( AVAILABLE ?auto_722177 ) ( IN ?auto_722175 ?auto_722178 ) ( ON ?auto_722166 ?auto_722165 ) ( ON ?auto_722167 ?auto_722166 ) ( ON ?auto_722169 ?auto_722167 ) ( ON ?auto_722168 ?auto_722169 ) ( ON ?auto_722170 ?auto_722168 ) ( ON ?auto_722171 ?auto_722170 ) ( ON ?auto_722172 ?auto_722171 ) ( ON ?auto_722173 ?auto_722172 ) ( ON ?auto_722174 ?auto_722173 ) ( not ( = ?auto_722165 ?auto_722166 ) ) ( not ( = ?auto_722165 ?auto_722167 ) ) ( not ( = ?auto_722165 ?auto_722169 ) ) ( not ( = ?auto_722165 ?auto_722168 ) ) ( not ( = ?auto_722165 ?auto_722170 ) ) ( not ( = ?auto_722165 ?auto_722171 ) ) ( not ( = ?auto_722165 ?auto_722172 ) ) ( not ( = ?auto_722165 ?auto_722173 ) ) ( not ( = ?auto_722165 ?auto_722174 ) ) ( not ( = ?auto_722165 ?auto_722175 ) ) ( not ( = ?auto_722165 ?auto_722176 ) ) ( not ( = ?auto_722165 ?auto_722180 ) ) ( not ( = ?auto_722166 ?auto_722167 ) ) ( not ( = ?auto_722166 ?auto_722169 ) ) ( not ( = ?auto_722166 ?auto_722168 ) ) ( not ( = ?auto_722166 ?auto_722170 ) ) ( not ( = ?auto_722166 ?auto_722171 ) ) ( not ( = ?auto_722166 ?auto_722172 ) ) ( not ( = ?auto_722166 ?auto_722173 ) ) ( not ( = ?auto_722166 ?auto_722174 ) ) ( not ( = ?auto_722166 ?auto_722175 ) ) ( not ( = ?auto_722166 ?auto_722176 ) ) ( not ( = ?auto_722166 ?auto_722180 ) ) ( not ( = ?auto_722167 ?auto_722169 ) ) ( not ( = ?auto_722167 ?auto_722168 ) ) ( not ( = ?auto_722167 ?auto_722170 ) ) ( not ( = ?auto_722167 ?auto_722171 ) ) ( not ( = ?auto_722167 ?auto_722172 ) ) ( not ( = ?auto_722167 ?auto_722173 ) ) ( not ( = ?auto_722167 ?auto_722174 ) ) ( not ( = ?auto_722167 ?auto_722175 ) ) ( not ( = ?auto_722167 ?auto_722176 ) ) ( not ( = ?auto_722167 ?auto_722180 ) ) ( not ( = ?auto_722169 ?auto_722168 ) ) ( not ( = ?auto_722169 ?auto_722170 ) ) ( not ( = ?auto_722169 ?auto_722171 ) ) ( not ( = ?auto_722169 ?auto_722172 ) ) ( not ( = ?auto_722169 ?auto_722173 ) ) ( not ( = ?auto_722169 ?auto_722174 ) ) ( not ( = ?auto_722169 ?auto_722175 ) ) ( not ( = ?auto_722169 ?auto_722176 ) ) ( not ( = ?auto_722169 ?auto_722180 ) ) ( not ( = ?auto_722168 ?auto_722170 ) ) ( not ( = ?auto_722168 ?auto_722171 ) ) ( not ( = ?auto_722168 ?auto_722172 ) ) ( not ( = ?auto_722168 ?auto_722173 ) ) ( not ( = ?auto_722168 ?auto_722174 ) ) ( not ( = ?auto_722168 ?auto_722175 ) ) ( not ( = ?auto_722168 ?auto_722176 ) ) ( not ( = ?auto_722168 ?auto_722180 ) ) ( not ( = ?auto_722170 ?auto_722171 ) ) ( not ( = ?auto_722170 ?auto_722172 ) ) ( not ( = ?auto_722170 ?auto_722173 ) ) ( not ( = ?auto_722170 ?auto_722174 ) ) ( not ( = ?auto_722170 ?auto_722175 ) ) ( not ( = ?auto_722170 ?auto_722176 ) ) ( not ( = ?auto_722170 ?auto_722180 ) ) ( not ( = ?auto_722171 ?auto_722172 ) ) ( not ( = ?auto_722171 ?auto_722173 ) ) ( not ( = ?auto_722171 ?auto_722174 ) ) ( not ( = ?auto_722171 ?auto_722175 ) ) ( not ( = ?auto_722171 ?auto_722176 ) ) ( not ( = ?auto_722171 ?auto_722180 ) ) ( not ( = ?auto_722172 ?auto_722173 ) ) ( not ( = ?auto_722172 ?auto_722174 ) ) ( not ( = ?auto_722172 ?auto_722175 ) ) ( not ( = ?auto_722172 ?auto_722176 ) ) ( not ( = ?auto_722172 ?auto_722180 ) ) ( not ( = ?auto_722173 ?auto_722174 ) ) ( not ( = ?auto_722173 ?auto_722175 ) ) ( not ( = ?auto_722173 ?auto_722176 ) ) ( not ( = ?auto_722173 ?auto_722180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722174 ?auto_722175 ?auto_722176 )
      ( MAKE-11CRATE-VERIFY ?auto_722165 ?auto_722166 ?auto_722167 ?auto_722169 ?auto_722168 ?auto_722170 ?auto_722171 ?auto_722172 ?auto_722173 ?auto_722174 ?auto_722175 ?auto_722176 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731456 - SURFACE
      ?auto_731457 - SURFACE
      ?auto_731458 - SURFACE
      ?auto_731460 - SURFACE
      ?auto_731459 - SURFACE
      ?auto_731461 - SURFACE
      ?auto_731462 - SURFACE
      ?auto_731463 - SURFACE
      ?auto_731464 - SURFACE
      ?auto_731465 - SURFACE
      ?auto_731466 - SURFACE
      ?auto_731467 - SURFACE
      ?auto_731468 - SURFACE
    )
    :vars
    (
      ?auto_731470 - HOIST
      ?auto_731469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_731470 ?auto_731469 ) ( SURFACE-AT ?auto_731467 ?auto_731469 ) ( CLEAR ?auto_731467 ) ( LIFTING ?auto_731470 ?auto_731468 ) ( IS-CRATE ?auto_731468 ) ( not ( = ?auto_731467 ?auto_731468 ) ) ( ON ?auto_731457 ?auto_731456 ) ( ON ?auto_731458 ?auto_731457 ) ( ON ?auto_731460 ?auto_731458 ) ( ON ?auto_731459 ?auto_731460 ) ( ON ?auto_731461 ?auto_731459 ) ( ON ?auto_731462 ?auto_731461 ) ( ON ?auto_731463 ?auto_731462 ) ( ON ?auto_731464 ?auto_731463 ) ( ON ?auto_731465 ?auto_731464 ) ( ON ?auto_731466 ?auto_731465 ) ( ON ?auto_731467 ?auto_731466 ) ( not ( = ?auto_731456 ?auto_731457 ) ) ( not ( = ?auto_731456 ?auto_731458 ) ) ( not ( = ?auto_731456 ?auto_731460 ) ) ( not ( = ?auto_731456 ?auto_731459 ) ) ( not ( = ?auto_731456 ?auto_731461 ) ) ( not ( = ?auto_731456 ?auto_731462 ) ) ( not ( = ?auto_731456 ?auto_731463 ) ) ( not ( = ?auto_731456 ?auto_731464 ) ) ( not ( = ?auto_731456 ?auto_731465 ) ) ( not ( = ?auto_731456 ?auto_731466 ) ) ( not ( = ?auto_731456 ?auto_731467 ) ) ( not ( = ?auto_731456 ?auto_731468 ) ) ( not ( = ?auto_731457 ?auto_731458 ) ) ( not ( = ?auto_731457 ?auto_731460 ) ) ( not ( = ?auto_731457 ?auto_731459 ) ) ( not ( = ?auto_731457 ?auto_731461 ) ) ( not ( = ?auto_731457 ?auto_731462 ) ) ( not ( = ?auto_731457 ?auto_731463 ) ) ( not ( = ?auto_731457 ?auto_731464 ) ) ( not ( = ?auto_731457 ?auto_731465 ) ) ( not ( = ?auto_731457 ?auto_731466 ) ) ( not ( = ?auto_731457 ?auto_731467 ) ) ( not ( = ?auto_731457 ?auto_731468 ) ) ( not ( = ?auto_731458 ?auto_731460 ) ) ( not ( = ?auto_731458 ?auto_731459 ) ) ( not ( = ?auto_731458 ?auto_731461 ) ) ( not ( = ?auto_731458 ?auto_731462 ) ) ( not ( = ?auto_731458 ?auto_731463 ) ) ( not ( = ?auto_731458 ?auto_731464 ) ) ( not ( = ?auto_731458 ?auto_731465 ) ) ( not ( = ?auto_731458 ?auto_731466 ) ) ( not ( = ?auto_731458 ?auto_731467 ) ) ( not ( = ?auto_731458 ?auto_731468 ) ) ( not ( = ?auto_731460 ?auto_731459 ) ) ( not ( = ?auto_731460 ?auto_731461 ) ) ( not ( = ?auto_731460 ?auto_731462 ) ) ( not ( = ?auto_731460 ?auto_731463 ) ) ( not ( = ?auto_731460 ?auto_731464 ) ) ( not ( = ?auto_731460 ?auto_731465 ) ) ( not ( = ?auto_731460 ?auto_731466 ) ) ( not ( = ?auto_731460 ?auto_731467 ) ) ( not ( = ?auto_731460 ?auto_731468 ) ) ( not ( = ?auto_731459 ?auto_731461 ) ) ( not ( = ?auto_731459 ?auto_731462 ) ) ( not ( = ?auto_731459 ?auto_731463 ) ) ( not ( = ?auto_731459 ?auto_731464 ) ) ( not ( = ?auto_731459 ?auto_731465 ) ) ( not ( = ?auto_731459 ?auto_731466 ) ) ( not ( = ?auto_731459 ?auto_731467 ) ) ( not ( = ?auto_731459 ?auto_731468 ) ) ( not ( = ?auto_731461 ?auto_731462 ) ) ( not ( = ?auto_731461 ?auto_731463 ) ) ( not ( = ?auto_731461 ?auto_731464 ) ) ( not ( = ?auto_731461 ?auto_731465 ) ) ( not ( = ?auto_731461 ?auto_731466 ) ) ( not ( = ?auto_731461 ?auto_731467 ) ) ( not ( = ?auto_731461 ?auto_731468 ) ) ( not ( = ?auto_731462 ?auto_731463 ) ) ( not ( = ?auto_731462 ?auto_731464 ) ) ( not ( = ?auto_731462 ?auto_731465 ) ) ( not ( = ?auto_731462 ?auto_731466 ) ) ( not ( = ?auto_731462 ?auto_731467 ) ) ( not ( = ?auto_731462 ?auto_731468 ) ) ( not ( = ?auto_731463 ?auto_731464 ) ) ( not ( = ?auto_731463 ?auto_731465 ) ) ( not ( = ?auto_731463 ?auto_731466 ) ) ( not ( = ?auto_731463 ?auto_731467 ) ) ( not ( = ?auto_731463 ?auto_731468 ) ) ( not ( = ?auto_731464 ?auto_731465 ) ) ( not ( = ?auto_731464 ?auto_731466 ) ) ( not ( = ?auto_731464 ?auto_731467 ) ) ( not ( = ?auto_731464 ?auto_731468 ) ) ( not ( = ?auto_731465 ?auto_731466 ) ) ( not ( = ?auto_731465 ?auto_731467 ) ) ( not ( = ?auto_731465 ?auto_731468 ) ) ( not ( = ?auto_731466 ?auto_731467 ) ) ( not ( = ?auto_731466 ?auto_731468 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_731467 ?auto_731468 )
      ( MAKE-12CRATE-VERIFY ?auto_731456 ?auto_731457 ?auto_731458 ?auto_731460 ?auto_731459 ?auto_731461 ?auto_731462 ?auto_731463 ?auto_731464 ?auto_731465 ?auto_731466 ?auto_731467 ?auto_731468 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731581 - SURFACE
      ?auto_731582 - SURFACE
      ?auto_731583 - SURFACE
      ?auto_731585 - SURFACE
      ?auto_731584 - SURFACE
      ?auto_731586 - SURFACE
      ?auto_731587 - SURFACE
      ?auto_731588 - SURFACE
      ?auto_731589 - SURFACE
      ?auto_731590 - SURFACE
      ?auto_731591 - SURFACE
      ?auto_731592 - SURFACE
      ?auto_731593 - SURFACE
    )
    :vars
    (
      ?auto_731595 - HOIST
      ?auto_731596 - PLACE
      ?auto_731594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_731595 ?auto_731596 ) ( SURFACE-AT ?auto_731592 ?auto_731596 ) ( CLEAR ?auto_731592 ) ( IS-CRATE ?auto_731593 ) ( not ( = ?auto_731592 ?auto_731593 ) ) ( TRUCK-AT ?auto_731594 ?auto_731596 ) ( AVAILABLE ?auto_731595 ) ( IN ?auto_731593 ?auto_731594 ) ( ON ?auto_731592 ?auto_731591 ) ( not ( = ?auto_731591 ?auto_731592 ) ) ( not ( = ?auto_731591 ?auto_731593 ) ) ( ON ?auto_731582 ?auto_731581 ) ( ON ?auto_731583 ?auto_731582 ) ( ON ?auto_731585 ?auto_731583 ) ( ON ?auto_731584 ?auto_731585 ) ( ON ?auto_731586 ?auto_731584 ) ( ON ?auto_731587 ?auto_731586 ) ( ON ?auto_731588 ?auto_731587 ) ( ON ?auto_731589 ?auto_731588 ) ( ON ?auto_731590 ?auto_731589 ) ( ON ?auto_731591 ?auto_731590 ) ( not ( = ?auto_731581 ?auto_731582 ) ) ( not ( = ?auto_731581 ?auto_731583 ) ) ( not ( = ?auto_731581 ?auto_731585 ) ) ( not ( = ?auto_731581 ?auto_731584 ) ) ( not ( = ?auto_731581 ?auto_731586 ) ) ( not ( = ?auto_731581 ?auto_731587 ) ) ( not ( = ?auto_731581 ?auto_731588 ) ) ( not ( = ?auto_731581 ?auto_731589 ) ) ( not ( = ?auto_731581 ?auto_731590 ) ) ( not ( = ?auto_731581 ?auto_731591 ) ) ( not ( = ?auto_731581 ?auto_731592 ) ) ( not ( = ?auto_731581 ?auto_731593 ) ) ( not ( = ?auto_731582 ?auto_731583 ) ) ( not ( = ?auto_731582 ?auto_731585 ) ) ( not ( = ?auto_731582 ?auto_731584 ) ) ( not ( = ?auto_731582 ?auto_731586 ) ) ( not ( = ?auto_731582 ?auto_731587 ) ) ( not ( = ?auto_731582 ?auto_731588 ) ) ( not ( = ?auto_731582 ?auto_731589 ) ) ( not ( = ?auto_731582 ?auto_731590 ) ) ( not ( = ?auto_731582 ?auto_731591 ) ) ( not ( = ?auto_731582 ?auto_731592 ) ) ( not ( = ?auto_731582 ?auto_731593 ) ) ( not ( = ?auto_731583 ?auto_731585 ) ) ( not ( = ?auto_731583 ?auto_731584 ) ) ( not ( = ?auto_731583 ?auto_731586 ) ) ( not ( = ?auto_731583 ?auto_731587 ) ) ( not ( = ?auto_731583 ?auto_731588 ) ) ( not ( = ?auto_731583 ?auto_731589 ) ) ( not ( = ?auto_731583 ?auto_731590 ) ) ( not ( = ?auto_731583 ?auto_731591 ) ) ( not ( = ?auto_731583 ?auto_731592 ) ) ( not ( = ?auto_731583 ?auto_731593 ) ) ( not ( = ?auto_731585 ?auto_731584 ) ) ( not ( = ?auto_731585 ?auto_731586 ) ) ( not ( = ?auto_731585 ?auto_731587 ) ) ( not ( = ?auto_731585 ?auto_731588 ) ) ( not ( = ?auto_731585 ?auto_731589 ) ) ( not ( = ?auto_731585 ?auto_731590 ) ) ( not ( = ?auto_731585 ?auto_731591 ) ) ( not ( = ?auto_731585 ?auto_731592 ) ) ( not ( = ?auto_731585 ?auto_731593 ) ) ( not ( = ?auto_731584 ?auto_731586 ) ) ( not ( = ?auto_731584 ?auto_731587 ) ) ( not ( = ?auto_731584 ?auto_731588 ) ) ( not ( = ?auto_731584 ?auto_731589 ) ) ( not ( = ?auto_731584 ?auto_731590 ) ) ( not ( = ?auto_731584 ?auto_731591 ) ) ( not ( = ?auto_731584 ?auto_731592 ) ) ( not ( = ?auto_731584 ?auto_731593 ) ) ( not ( = ?auto_731586 ?auto_731587 ) ) ( not ( = ?auto_731586 ?auto_731588 ) ) ( not ( = ?auto_731586 ?auto_731589 ) ) ( not ( = ?auto_731586 ?auto_731590 ) ) ( not ( = ?auto_731586 ?auto_731591 ) ) ( not ( = ?auto_731586 ?auto_731592 ) ) ( not ( = ?auto_731586 ?auto_731593 ) ) ( not ( = ?auto_731587 ?auto_731588 ) ) ( not ( = ?auto_731587 ?auto_731589 ) ) ( not ( = ?auto_731587 ?auto_731590 ) ) ( not ( = ?auto_731587 ?auto_731591 ) ) ( not ( = ?auto_731587 ?auto_731592 ) ) ( not ( = ?auto_731587 ?auto_731593 ) ) ( not ( = ?auto_731588 ?auto_731589 ) ) ( not ( = ?auto_731588 ?auto_731590 ) ) ( not ( = ?auto_731588 ?auto_731591 ) ) ( not ( = ?auto_731588 ?auto_731592 ) ) ( not ( = ?auto_731588 ?auto_731593 ) ) ( not ( = ?auto_731589 ?auto_731590 ) ) ( not ( = ?auto_731589 ?auto_731591 ) ) ( not ( = ?auto_731589 ?auto_731592 ) ) ( not ( = ?auto_731589 ?auto_731593 ) ) ( not ( = ?auto_731590 ?auto_731591 ) ) ( not ( = ?auto_731590 ?auto_731592 ) ) ( not ( = ?auto_731590 ?auto_731593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_731591 ?auto_731592 ?auto_731593 )
      ( MAKE-12CRATE-VERIFY ?auto_731581 ?auto_731582 ?auto_731583 ?auto_731585 ?auto_731584 ?auto_731586 ?auto_731587 ?auto_731588 ?auto_731589 ?auto_731590 ?auto_731591 ?auto_731592 ?auto_731593 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731719 - SURFACE
      ?auto_731720 - SURFACE
      ?auto_731721 - SURFACE
      ?auto_731723 - SURFACE
      ?auto_731722 - SURFACE
      ?auto_731724 - SURFACE
      ?auto_731725 - SURFACE
      ?auto_731726 - SURFACE
      ?auto_731727 - SURFACE
      ?auto_731728 - SURFACE
      ?auto_731729 - SURFACE
      ?auto_731730 - SURFACE
      ?auto_731731 - SURFACE
    )
    :vars
    (
      ?auto_731732 - HOIST
      ?auto_731733 - PLACE
      ?auto_731735 - TRUCK
      ?auto_731734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_731732 ?auto_731733 ) ( SURFACE-AT ?auto_731730 ?auto_731733 ) ( CLEAR ?auto_731730 ) ( IS-CRATE ?auto_731731 ) ( not ( = ?auto_731730 ?auto_731731 ) ) ( AVAILABLE ?auto_731732 ) ( IN ?auto_731731 ?auto_731735 ) ( ON ?auto_731730 ?auto_731729 ) ( not ( = ?auto_731729 ?auto_731730 ) ) ( not ( = ?auto_731729 ?auto_731731 ) ) ( TRUCK-AT ?auto_731735 ?auto_731734 ) ( not ( = ?auto_731734 ?auto_731733 ) ) ( ON ?auto_731720 ?auto_731719 ) ( ON ?auto_731721 ?auto_731720 ) ( ON ?auto_731723 ?auto_731721 ) ( ON ?auto_731722 ?auto_731723 ) ( ON ?auto_731724 ?auto_731722 ) ( ON ?auto_731725 ?auto_731724 ) ( ON ?auto_731726 ?auto_731725 ) ( ON ?auto_731727 ?auto_731726 ) ( ON ?auto_731728 ?auto_731727 ) ( ON ?auto_731729 ?auto_731728 ) ( not ( = ?auto_731719 ?auto_731720 ) ) ( not ( = ?auto_731719 ?auto_731721 ) ) ( not ( = ?auto_731719 ?auto_731723 ) ) ( not ( = ?auto_731719 ?auto_731722 ) ) ( not ( = ?auto_731719 ?auto_731724 ) ) ( not ( = ?auto_731719 ?auto_731725 ) ) ( not ( = ?auto_731719 ?auto_731726 ) ) ( not ( = ?auto_731719 ?auto_731727 ) ) ( not ( = ?auto_731719 ?auto_731728 ) ) ( not ( = ?auto_731719 ?auto_731729 ) ) ( not ( = ?auto_731719 ?auto_731730 ) ) ( not ( = ?auto_731719 ?auto_731731 ) ) ( not ( = ?auto_731720 ?auto_731721 ) ) ( not ( = ?auto_731720 ?auto_731723 ) ) ( not ( = ?auto_731720 ?auto_731722 ) ) ( not ( = ?auto_731720 ?auto_731724 ) ) ( not ( = ?auto_731720 ?auto_731725 ) ) ( not ( = ?auto_731720 ?auto_731726 ) ) ( not ( = ?auto_731720 ?auto_731727 ) ) ( not ( = ?auto_731720 ?auto_731728 ) ) ( not ( = ?auto_731720 ?auto_731729 ) ) ( not ( = ?auto_731720 ?auto_731730 ) ) ( not ( = ?auto_731720 ?auto_731731 ) ) ( not ( = ?auto_731721 ?auto_731723 ) ) ( not ( = ?auto_731721 ?auto_731722 ) ) ( not ( = ?auto_731721 ?auto_731724 ) ) ( not ( = ?auto_731721 ?auto_731725 ) ) ( not ( = ?auto_731721 ?auto_731726 ) ) ( not ( = ?auto_731721 ?auto_731727 ) ) ( not ( = ?auto_731721 ?auto_731728 ) ) ( not ( = ?auto_731721 ?auto_731729 ) ) ( not ( = ?auto_731721 ?auto_731730 ) ) ( not ( = ?auto_731721 ?auto_731731 ) ) ( not ( = ?auto_731723 ?auto_731722 ) ) ( not ( = ?auto_731723 ?auto_731724 ) ) ( not ( = ?auto_731723 ?auto_731725 ) ) ( not ( = ?auto_731723 ?auto_731726 ) ) ( not ( = ?auto_731723 ?auto_731727 ) ) ( not ( = ?auto_731723 ?auto_731728 ) ) ( not ( = ?auto_731723 ?auto_731729 ) ) ( not ( = ?auto_731723 ?auto_731730 ) ) ( not ( = ?auto_731723 ?auto_731731 ) ) ( not ( = ?auto_731722 ?auto_731724 ) ) ( not ( = ?auto_731722 ?auto_731725 ) ) ( not ( = ?auto_731722 ?auto_731726 ) ) ( not ( = ?auto_731722 ?auto_731727 ) ) ( not ( = ?auto_731722 ?auto_731728 ) ) ( not ( = ?auto_731722 ?auto_731729 ) ) ( not ( = ?auto_731722 ?auto_731730 ) ) ( not ( = ?auto_731722 ?auto_731731 ) ) ( not ( = ?auto_731724 ?auto_731725 ) ) ( not ( = ?auto_731724 ?auto_731726 ) ) ( not ( = ?auto_731724 ?auto_731727 ) ) ( not ( = ?auto_731724 ?auto_731728 ) ) ( not ( = ?auto_731724 ?auto_731729 ) ) ( not ( = ?auto_731724 ?auto_731730 ) ) ( not ( = ?auto_731724 ?auto_731731 ) ) ( not ( = ?auto_731725 ?auto_731726 ) ) ( not ( = ?auto_731725 ?auto_731727 ) ) ( not ( = ?auto_731725 ?auto_731728 ) ) ( not ( = ?auto_731725 ?auto_731729 ) ) ( not ( = ?auto_731725 ?auto_731730 ) ) ( not ( = ?auto_731725 ?auto_731731 ) ) ( not ( = ?auto_731726 ?auto_731727 ) ) ( not ( = ?auto_731726 ?auto_731728 ) ) ( not ( = ?auto_731726 ?auto_731729 ) ) ( not ( = ?auto_731726 ?auto_731730 ) ) ( not ( = ?auto_731726 ?auto_731731 ) ) ( not ( = ?auto_731727 ?auto_731728 ) ) ( not ( = ?auto_731727 ?auto_731729 ) ) ( not ( = ?auto_731727 ?auto_731730 ) ) ( not ( = ?auto_731727 ?auto_731731 ) ) ( not ( = ?auto_731728 ?auto_731729 ) ) ( not ( = ?auto_731728 ?auto_731730 ) ) ( not ( = ?auto_731728 ?auto_731731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_731729 ?auto_731730 ?auto_731731 )
      ( MAKE-12CRATE-VERIFY ?auto_731719 ?auto_731720 ?auto_731721 ?auto_731723 ?auto_731722 ?auto_731724 ?auto_731725 ?auto_731726 ?auto_731727 ?auto_731728 ?auto_731729 ?auto_731730 ?auto_731731 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731869 - SURFACE
      ?auto_731870 - SURFACE
      ?auto_731871 - SURFACE
      ?auto_731873 - SURFACE
      ?auto_731872 - SURFACE
      ?auto_731874 - SURFACE
      ?auto_731875 - SURFACE
      ?auto_731876 - SURFACE
      ?auto_731877 - SURFACE
      ?auto_731878 - SURFACE
      ?auto_731879 - SURFACE
      ?auto_731880 - SURFACE
      ?auto_731881 - SURFACE
    )
    :vars
    (
      ?auto_731886 - HOIST
      ?auto_731884 - PLACE
      ?auto_731885 - TRUCK
      ?auto_731883 - PLACE
      ?auto_731882 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_731886 ?auto_731884 ) ( SURFACE-AT ?auto_731880 ?auto_731884 ) ( CLEAR ?auto_731880 ) ( IS-CRATE ?auto_731881 ) ( not ( = ?auto_731880 ?auto_731881 ) ) ( AVAILABLE ?auto_731886 ) ( ON ?auto_731880 ?auto_731879 ) ( not ( = ?auto_731879 ?auto_731880 ) ) ( not ( = ?auto_731879 ?auto_731881 ) ) ( TRUCK-AT ?auto_731885 ?auto_731883 ) ( not ( = ?auto_731883 ?auto_731884 ) ) ( HOIST-AT ?auto_731882 ?auto_731883 ) ( LIFTING ?auto_731882 ?auto_731881 ) ( not ( = ?auto_731886 ?auto_731882 ) ) ( ON ?auto_731870 ?auto_731869 ) ( ON ?auto_731871 ?auto_731870 ) ( ON ?auto_731873 ?auto_731871 ) ( ON ?auto_731872 ?auto_731873 ) ( ON ?auto_731874 ?auto_731872 ) ( ON ?auto_731875 ?auto_731874 ) ( ON ?auto_731876 ?auto_731875 ) ( ON ?auto_731877 ?auto_731876 ) ( ON ?auto_731878 ?auto_731877 ) ( ON ?auto_731879 ?auto_731878 ) ( not ( = ?auto_731869 ?auto_731870 ) ) ( not ( = ?auto_731869 ?auto_731871 ) ) ( not ( = ?auto_731869 ?auto_731873 ) ) ( not ( = ?auto_731869 ?auto_731872 ) ) ( not ( = ?auto_731869 ?auto_731874 ) ) ( not ( = ?auto_731869 ?auto_731875 ) ) ( not ( = ?auto_731869 ?auto_731876 ) ) ( not ( = ?auto_731869 ?auto_731877 ) ) ( not ( = ?auto_731869 ?auto_731878 ) ) ( not ( = ?auto_731869 ?auto_731879 ) ) ( not ( = ?auto_731869 ?auto_731880 ) ) ( not ( = ?auto_731869 ?auto_731881 ) ) ( not ( = ?auto_731870 ?auto_731871 ) ) ( not ( = ?auto_731870 ?auto_731873 ) ) ( not ( = ?auto_731870 ?auto_731872 ) ) ( not ( = ?auto_731870 ?auto_731874 ) ) ( not ( = ?auto_731870 ?auto_731875 ) ) ( not ( = ?auto_731870 ?auto_731876 ) ) ( not ( = ?auto_731870 ?auto_731877 ) ) ( not ( = ?auto_731870 ?auto_731878 ) ) ( not ( = ?auto_731870 ?auto_731879 ) ) ( not ( = ?auto_731870 ?auto_731880 ) ) ( not ( = ?auto_731870 ?auto_731881 ) ) ( not ( = ?auto_731871 ?auto_731873 ) ) ( not ( = ?auto_731871 ?auto_731872 ) ) ( not ( = ?auto_731871 ?auto_731874 ) ) ( not ( = ?auto_731871 ?auto_731875 ) ) ( not ( = ?auto_731871 ?auto_731876 ) ) ( not ( = ?auto_731871 ?auto_731877 ) ) ( not ( = ?auto_731871 ?auto_731878 ) ) ( not ( = ?auto_731871 ?auto_731879 ) ) ( not ( = ?auto_731871 ?auto_731880 ) ) ( not ( = ?auto_731871 ?auto_731881 ) ) ( not ( = ?auto_731873 ?auto_731872 ) ) ( not ( = ?auto_731873 ?auto_731874 ) ) ( not ( = ?auto_731873 ?auto_731875 ) ) ( not ( = ?auto_731873 ?auto_731876 ) ) ( not ( = ?auto_731873 ?auto_731877 ) ) ( not ( = ?auto_731873 ?auto_731878 ) ) ( not ( = ?auto_731873 ?auto_731879 ) ) ( not ( = ?auto_731873 ?auto_731880 ) ) ( not ( = ?auto_731873 ?auto_731881 ) ) ( not ( = ?auto_731872 ?auto_731874 ) ) ( not ( = ?auto_731872 ?auto_731875 ) ) ( not ( = ?auto_731872 ?auto_731876 ) ) ( not ( = ?auto_731872 ?auto_731877 ) ) ( not ( = ?auto_731872 ?auto_731878 ) ) ( not ( = ?auto_731872 ?auto_731879 ) ) ( not ( = ?auto_731872 ?auto_731880 ) ) ( not ( = ?auto_731872 ?auto_731881 ) ) ( not ( = ?auto_731874 ?auto_731875 ) ) ( not ( = ?auto_731874 ?auto_731876 ) ) ( not ( = ?auto_731874 ?auto_731877 ) ) ( not ( = ?auto_731874 ?auto_731878 ) ) ( not ( = ?auto_731874 ?auto_731879 ) ) ( not ( = ?auto_731874 ?auto_731880 ) ) ( not ( = ?auto_731874 ?auto_731881 ) ) ( not ( = ?auto_731875 ?auto_731876 ) ) ( not ( = ?auto_731875 ?auto_731877 ) ) ( not ( = ?auto_731875 ?auto_731878 ) ) ( not ( = ?auto_731875 ?auto_731879 ) ) ( not ( = ?auto_731875 ?auto_731880 ) ) ( not ( = ?auto_731875 ?auto_731881 ) ) ( not ( = ?auto_731876 ?auto_731877 ) ) ( not ( = ?auto_731876 ?auto_731878 ) ) ( not ( = ?auto_731876 ?auto_731879 ) ) ( not ( = ?auto_731876 ?auto_731880 ) ) ( not ( = ?auto_731876 ?auto_731881 ) ) ( not ( = ?auto_731877 ?auto_731878 ) ) ( not ( = ?auto_731877 ?auto_731879 ) ) ( not ( = ?auto_731877 ?auto_731880 ) ) ( not ( = ?auto_731877 ?auto_731881 ) ) ( not ( = ?auto_731878 ?auto_731879 ) ) ( not ( = ?auto_731878 ?auto_731880 ) ) ( not ( = ?auto_731878 ?auto_731881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_731879 ?auto_731880 ?auto_731881 )
      ( MAKE-12CRATE-VERIFY ?auto_731869 ?auto_731870 ?auto_731871 ?auto_731873 ?auto_731872 ?auto_731874 ?auto_731875 ?auto_731876 ?auto_731877 ?auto_731878 ?auto_731879 ?auto_731880 ?auto_731881 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732031 - SURFACE
      ?auto_732032 - SURFACE
      ?auto_732033 - SURFACE
      ?auto_732035 - SURFACE
      ?auto_732034 - SURFACE
      ?auto_732036 - SURFACE
      ?auto_732037 - SURFACE
      ?auto_732038 - SURFACE
      ?auto_732039 - SURFACE
      ?auto_732040 - SURFACE
      ?auto_732041 - SURFACE
      ?auto_732042 - SURFACE
      ?auto_732043 - SURFACE
    )
    :vars
    (
      ?auto_732046 - HOIST
      ?auto_732045 - PLACE
      ?auto_732049 - TRUCK
      ?auto_732048 - PLACE
      ?auto_732044 - HOIST
      ?auto_732047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_732046 ?auto_732045 ) ( SURFACE-AT ?auto_732042 ?auto_732045 ) ( CLEAR ?auto_732042 ) ( IS-CRATE ?auto_732043 ) ( not ( = ?auto_732042 ?auto_732043 ) ) ( AVAILABLE ?auto_732046 ) ( ON ?auto_732042 ?auto_732041 ) ( not ( = ?auto_732041 ?auto_732042 ) ) ( not ( = ?auto_732041 ?auto_732043 ) ) ( TRUCK-AT ?auto_732049 ?auto_732048 ) ( not ( = ?auto_732048 ?auto_732045 ) ) ( HOIST-AT ?auto_732044 ?auto_732048 ) ( not ( = ?auto_732046 ?auto_732044 ) ) ( AVAILABLE ?auto_732044 ) ( SURFACE-AT ?auto_732043 ?auto_732048 ) ( ON ?auto_732043 ?auto_732047 ) ( CLEAR ?auto_732043 ) ( not ( = ?auto_732042 ?auto_732047 ) ) ( not ( = ?auto_732043 ?auto_732047 ) ) ( not ( = ?auto_732041 ?auto_732047 ) ) ( ON ?auto_732032 ?auto_732031 ) ( ON ?auto_732033 ?auto_732032 ) ( ON ?auto_732035 ?auto_732033 ) ( ON ?auto_732034 ?auto_732035 ) ( ON ?auto_732036 ?auto_732034 ) ( ON ?auto_732037 ?auto_732036 ) ( ON ?auto_732038 ?auto_732037 ) ( ON ?auto_732039 ?auto_732038 ) ( ON ?auto_732040 ?auto_732039 ) ( ON ?auto_732041 ?auto_732040 ) ( not ( = ?auto_732031 ?auto_732032 ) ) ( not ( = ?auto_732031 ?auto_732033 ) ) ( not ( = ?auto_732031 ?auto_732035 ) ) ( not ( = ?auto_732031 ?auto_732034 ) ) ( not ( = ?auto_732031 ?auto_732036 ) ) ( not ( = ?auto_732031 ?auto_732037 ) ) ( not ( = ?auto_732031 ?auto_732038 ) ) ( not ( = ?auto_732031 ?auto_732039 ) ) ( not ( = ?auto_732031 ?auto_732040 ) ) ( not ( = ?auto_732031 ?auto_732041 ) ) ( not ( = ?auto_732031 ?auto_732042 ) ) ( not ( = ?auto_732031 ?auto_732043 ) ) ( not ( = ?auto_732031 ?auto_732047 ) ) ( not ( = ?auto_732032 ?auto_732033 ) ) ( not ( = ?auto_732032 ?auto_732035 ) ) ( not ( = ?auto_732032 ?auto_732034 ) ) ( not ( = ?auto_732032 ?auto_732036 ) ) ( not ( = ?auto_732032 ?auto_732037 ) ) ( not ( = ?auto_732032 ?auto_732038 ) ) ( not ( = ?auto_732032 ?auto_732039 ) ) ( not ( = ?auto_732032 ?auto_732040 ) ) ( not ( = ?auto_732032 ?auto_732041 ) ) ( not ( = ?auto_732032 ?auto_732042 ) ) ( not ( = ?auto_732032 ?auto_732043 ) ) ( not ( = ?auto_732032 ?auto_732047 ) ) ( not ( = ?auto_732033 ?auto_732035 ) ) ( not ( = ?auto_732033 ?auto_732034 ) ) ( not ( = ?auto_732033 ?auto_732036 ) ) ( not ( = ?auto_732033 ?auto_732037 ) ) ( not ( = ?auto_732033 ?auto_732038 ) ) ( not ( = ?auto_732033 ?auto_732039 ) ) ( not ( = ?auto_732033 ?auto_732040 ) ) ( not ( = ?auto_732033 ?auto_732041 ) ) ( not ( = ?auto_732033 ?auto_732042 ) ) ( not ( = ?auto_732033 ?auto_732043 ) ) ( not ( = ?auto_732033 ?auto_732047 ) ) ( not ( = ?auto_732035 ?auto_732034 ) ) ( not ( = ?auto_732035 ?auto_732036 ) ) ( not ( = ?auto_732035 ?auto_732037 ) ) ( not ( = ?auto_732035 ?auto_732038 ) ) ( not ( = ?auto_732035 ?auto_732039 ) ) ( not ( = ?auto_732035 ?auto_732040 ) ) ( not ( = ?auto_732035 ?auto_732041 ) ) ( not ( = ?auto_732035 ?auto_732042 ) ) ( not ( = ?auto_732035 ?auto_732043 ) ) ( not ( = ?auto_732035 ?auto_732047 ) ) ( not ( = ?auto_732034 ?auto_732036 ) ) ( not ( = ?auto_732034 ?auto_732037 ) ) ( not ( = ?auto_732034 ?auto_732038 ) ) ( not ( = ?auto_732034 ?auto_732039 ) ) ( not ( = ?auto_732034 ?auto_732040 ) ) ( not ( = ?auto_732034 ?auto_732041 ) ) ( not ( = ?auto_732034 ?auto_732042 ) ) ( not ( = ?auto_732034 ?auto_732043 ) ) ( not ( = ?auto_732034 ?auto_732047 ) ) ( not ( = ?auto_732036 ?auto_732037 ) ) ( not ( = ?auto_732036 ?auto_732038 ) ) ( not ( = ?auto_732036 ?auto_732039 ) ) ( not ( = ?auto_732036 ?auto_732040 ) ) ( not ( = ?auto_732036 ?auto_732041 ) ) ( not ( = ?auto_732036 ?auto_732042 ) ) ( not ( = ?auto_732036 ?auto_732043 ) ) ( not ( = ?auto_732036 ?auto_732047 ) ) ( not ( = ?auto_732037 ?auto_732038 ) ) ( not ( = ?auto_732037 ?auto_732039 ) ) ( not ( = ?auto_732037 ?auto_732040 ) ) ( not ( = ?auto_732037 ?auto_732041 ) ) ( not ( = ?auto_732037 ?auto_732042 ) ) ( not ( = ?auto_732037 ?auto_732043 ) ) ( not ( = ?auto_732037 ?auto_732047 ) ) ( not ( = ?auto_732038 ?auto_732039 ) ) ( not ( = ?auto_732038 ?auto_732040 ) ) ( not ( = ?auto_732038 ?auto_732041 ) ) ( not ( = ?auto_732038 ?auto_732042 ) ) ( not ( = ?auto_732038 ?auto_732043 ) ) ( not ( = ?auto_732038 ?auto_732047 ) ) ( not ( = ?auto_732039 ?auto_732040 ) ) ( not ( = ?auto_732039 ?auto_732041 ) ) ( not ( = ?auto_732039 ?auto_732042 ) ) ( not ( = ?auto_732039 ?auto_732043 ) ) ( not ( = ?auto_732039 ?auto_732047 ) ) ( not ( = ?auto_732040 ?auto_732041 ) ) ( not ( = ?auto_732040 ?auto_732042 ) ) ( not ( = ?auto_732040 ?auto_732043 ) ) ( not ( = ?auto_732040 ?auto_732047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732041 ?auto_732042 ?auto_732043 )
      ( MAKE-12CRATE-VERIFY ?auto_732031 ?auto_732032 ?auto_732033 ?auto_732035 ?auto_732034 ?auto_732036 ?auto_732037 ?auto_732038 ?auto_732039 ?auto_732040 ?auto_732041 ?auto_732042 ?auto_732043 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732194 - SURFACE
      ?auto_732195 - SURFACE
      ?auto_732196 - SURFACE
      ?auto_732198 - SURFACE
      ?auto_732197 - SURFACE
      ?auto_732199 - SURFACE
      ?auto_732200 - SURFACE
      ?auto_732201 - SURFACE
      ?auto_732202 - SURFACE
      ?auto_732203 - SURFACE
      ?auto_732204 - SURFACE
      ?auto_732205 - SURFACE
      ?auto_732206 - SURFACE
    )
    :vars
    (
      ?auto_732212 - HOIST
      ?auto_732207 - PLACE
      ?auto_732211 - PLACE
      ?auto_732210 - HOIST
      ?auto_732209 - SURFACE
      ?auto_732208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732212 ?auto_732207 ) ( SURFACE-AT ?auto_732205 ?auto_732207 ) ( CLEAR ?auto_732205 ) ( IS-CRATE ?auto_732206 ) ( not ( = ?auto_732205 ?auto_732206 ) ) ( AVAILABLE ?auto_732212 ) ( ON ?auto_732205 ?auto_732204 ) ( not ( = ?auto_732204 ?auto_732205 ) ) ( not ( = ?auto_732204 ?auto_732206 ) ) ( not ( = ?auto_732211 ?auto_732207 ) ) ( HOIST-AT ?auto_732210 ?auto_732211 ) ( not ( = ?auto_732212 ?auto_732210 ) ) ( AVAILABLE ?auto_732210 ) ( SURFACE-AT ?auto_732206 ?auto_732211 ) ( ON ?auto_732206 ?auto_732209 ) ( CLEAR ?auto_732206 ) ( not ( = ?auto_732205 ?auto_732209 ) ) ( not ( = ?auto_732206 ?auto_732209 ) ) ( not ( = ?auto_732204 ?auto_732209 ) ) ( TRUCK-AT ?auto_732208 ?auto_732207 ) ( ON ?auto_732195 ?auto_732194 ) ( ON ?auto_732196 ?auto_732195 ) ( ON ?auto_732198 ?auto_732196 ) ( ON ?auto_732197 ?auto_732198 ) ( ON ?auto_732199 ?auto_732197 ) ( ON ?auto_732200 ?auto_732199 ) ( ON ?auto_732201 ?auto_732200 ) ( ON ?auto_732202 ?auto_732201 ) ( ON ?auto_732203 ?auto_732202 ) ( ON ?auto_732204 ?auto_732203 ) ( not ( = ?auto_732194 ?auto_732195 ) ) ( not ( = ?auto_732194 ?auto_732196 ) ) ( not ( = ?auto_732194 ?auto_732198 ) ) ( not ( = ?auto_732194 ?auto_732197 ) ) ( not ( = ?auto_732194 ?auto_732199 ) ) ( not ( = ?auto_732194 ?auto_732200 ) ) ( not ( = ?auto_732194 ?auto_732201 ) ) ( not ( = ?auto_732194 ?auto_732202 ) ) ( not ( = ?auto_732194 ?auto_732203 ) ) ( not ( = ?auto_732194 ?auto_732204 ) ) ( not ( = ?auto_732194 ?auto_732205 ) ) ( not ( = ?auto_732194 ?auto_732206 ) ) ( not ( = ?auto_732194 ?auto_732209 ) ) ( not ( = ?auto_732195 ?auto_732196 ) ) ( not ( = ?auto_732195 ?auto_732198 ) ) ( not ( = ?auto_732195 ?auto_732197 ) ) ( not ( = ?auto_732195 ?auto_732199 ) ) ( not ( = ?auto_732195 ?auto_732200 ) ) ( not ( = ?auto_732195 ?auto_732201 ) ) ( not ( = ?auto_732195 ?auto_732202 ) ) ( not ( = ?auto_732195 ?auto_732203 ) ) ( not ( = ?auto_732195 ?auto_732204 ) ) ( not ( = ?auto_732195 ?auto_732205 ) ) ( not ( = ?auto_732195 ?auto_732206 ) ) ( not ( = ?auto_732195 ?auto_732209 ) ) ( not ( = ?auto_732196 ?auto_732198 ) ) ( not ( = ?auto_732196 ?auto_732197 ) ) ( not ( = ?auto_732196 ?auto_732199 ) ) ( not ( = ?auto_732196 ?auto_732200 ) ) ( not ( = ?auto_732196 ?auto_732201 ) ) ( not ( = ?auto_732196 ?auto_732202 ) ) ( not ( = ?auto_732196 ?auto_732203 ) ) ( not ( = ?auto_732196 ?auto_732204 ) ) ( not ( = ?auto_732196 ?auto_732205 ) ) ( not ( = ?auto_732196 ?auto_732206 ) ) ( not ( = ?auto_732196 ?auto_732209 ) ) ( not ( = ?auto_732198 ?auto_732197 ) ) ( not ( = ?auto_732198 ?auto_732199 ) ) ( not ( = ?auto_732198 ?auto_732200 ) ) ( not ( = ?auto_732198 ?auto_732201 ) ) ( not ( = ?auto_732198 ?auto_732202 ) ) ( not ( = ?auto_732198 ?auto_732203 ) ) ( not ( = ?auto_732198 ?auto_732204 ) ) ( not ( = ?auto_732198 ?auto_732205 ) ) ( not ( = ?auto_732198 ?auto_732206 ) ) ( not ( = ?auto_732198 ?auto_732209 ) ) ( not ( = ?auto_732197 ?auto_732199 ) ) ( not ( = ?auto_732197 ?auto_732200 ) ) ( not ( = ?auto_732197 ?auto_732201 ) ) ( not ( = ?auto_732197 ?auto_732202 ) ) ( not ( = ?auto_732197 ?auto_732203 ) ) ( not ( = ?auto_732197 ?auto_732204 ) ) ( not ( = ?auto_732197 ?auto_732205 ) ) ( not ( = ?auto_732197 ?auto_732206 ) ) ( not ( = ?auto_732197 ?auto_732209 ) ) ( not ( = ?auto_732199 ?auto_732200 ) ) ( not ( = ?auto_732199 ?auto_732201 ) ) ( not ( = ?auto_732199 ?auto_732202 ) ) ( not ( = ?auto_732199 ?auto_732203 ) ) ( not ( = ?auto_732199 ?auto_732204 ) ) ( not ( = ?auto_732199 ?auto_732205 ) ) ( not ( = ?auto_732199 ?auto_732206 ) ) ( not ( = ?auto_732199 ?auto_732209 ) ) ( not ( = ?auto_732200 ?auto_732201 ) ) ( not ( = ?auto_732200 ?auto_732202 ) ) ( not ( = ?auto_732200 ?auto_732203 ) ) ( not ( = ?auto_732200 ?auto_732204 ) ) ( not ( = ?auto_732200 ?auto_732205 ) ) ( not ( = ?auto_732200 ?auto_732206 ) ) ( not ( = ?auto_732200 ?auto_732209 ) ) ( not ( = ?auto_732201 ?auto_732202 ) ) ( not ( = ?auto_732201 ?auto_732203 ) ) ( not ( = ?auto_732201 ?auto_732204 ) ) ( not ( = ?auto_732201 ?auto_732205 ) ) ( not ( = ?auto_732201 ?auto_732206 ) ) ( not ( = ?auto_732201 ?auto_732209 ) ) ( not ( = ?auto_732202 ?auto_732203 ) ) ( not ( = ?auto_732202 ?auto_732204 ) ) ( not ( = ?auto_732202 ?auto_732205 ) ) ( not ( = ?auto_732202 ?auto_732206 ) ) ( not ( = ?auto_732202 ?auto_732209 ) ) ( not ( = ?auto_732203 ?auto_732204 ) ) ( not ( = ?auto_732203 ?auto_732205 ) ) ( not ( = ?auto_732203 ?auto_732206 ) ) ( not ( = ?auto_732203 ?auto_732209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732204 ?auto_732205 ?auto_732206 )
      ( MAKE-12CRATE-VERIFY ?auto_732194 ?auto_732195 ?auto_732196 ?auto_732198 ?auto_732197 ?auto_732199 ?auto_732200 ?auto_732201 ?auto_732202 ?auto_732203 ?auto_732204 ?auto_732205 ?auto_732206 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732357 - SURFACE
      ?auto_732358 - SURFACE
      ?auto_732359 - SURFACE
      ?auto_732361 - SURFACE
      ?auto_732360 - SURFACE
      ?auto_732362 - SURFACE
      ?auto_732363 - SURFACE
      ?auto_732364 - SURFACE
      ?auto_732365 - SURFACE
      ?auto_732366 - SURFACE
      ?auto_732367 - SURFACE
      ?auto_732368 - SURFACE
      ?auto_732369 - SURFACE
    )
    :vars
    (
      ?auto_732370 - HOIST
      ?auto_732374 - PLACE
      ?auto_732371 - PLACE
      ?auto_732373 - HOIST
      ?auto_732375 - SURFACE
      ?auto_732372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732370 ?auto_732374 ) ( IS-CRATE ?auto_732369 ) ( not ( = ?auto_732368 ?auto_732369 ) ) ( not ( = ?auto_732367 ?auto_732368 ) ) ( not ( = ?auto_732367 ?auto_732369 ) ) ( not ( = ?auto_732371 ?auto_732374 ) ) ( HOIST-AT ?auto_732373 ?auto_732371 ) ( not ( = ?auto_732370 ?auto_732373 ) ) ( AVAILABLE ?auto_732373 ) ( SURFACE-AT ?auto_732369 ?auto_732371 ) ( ON ?auto_732369 ?auto_732375 ) ( CLEAR ?auto_732369 ) ( not ( = ?auto_732368 ?auto_732375 ) ) ( not ( = ?auto_732369 ?auto_732375 ) ) ( not ( = ?auto_732367 ?auto_732375 ) ) ( TRUCK-AT ?auto_732372 ?auto_732374 ) ( SURFACE-AT ?auto_732367 ?auto_732374 ) ( CLEAR ?auto_732367 ) ( LIFTING ?auto_732370 ?auto_732368 ) ( IS-CRATE ?auto_732368 ) ( ON ?auto_732358 ?auto_732357 ) ( ON ?auto_732359 ?auto_732358 ) ( ON ?auto_732361 ?auto_732359 ) ( ON ?auto_732360 ?auto_732361 ) ( ON ?auto_732362 ?auto_732360 ) ( ON ?auto_732363 ?auto_732362 ) ( ON ?auto_732364 ?auto_732363 ) ( ON ?auto_732365 ?auto_732364 ) ( ON ?auto_732366 ?auto_732365 ) ( ON ?auto_732367 ?auto_732366 ) ( not ( = ?auto_732357 ?auto_732358 ) ) ( not ( = ?auto_732357 ?auto_732359 ) ) ( not ( = ?auto_732357 ?auto_732361 ) ) ( not ( = ?auto_732357 ?auto_732360 ) ) ( not ( = ?auto_732357 ?auto_732362 ) ) ( not ( = ?auto_732357 ?auto_732363 ) ) ( not ( = ?auto_732357 ?auto_732364 ) ) ( not ( = ?auto_732357 ?auto_732365 ) ) ( not ( = ?auto_732357 ?auto_732366 ) ) ( not ( = ?auto_732357 ?auto_732367 ) ) ( not ( = ?auto_732357 ?auto_732368 ) ) ( not ( = ?auto_732357 ?auto_732369 ) ) ( not ( = ?auto_732357 ?auto_732375 ) ) ( not ( = ?auto_732358 ?auto_732359 ) ) ( not ( = ?auto_732358 ?auto_732361 ) ) ( not ( = ?auto_732358 ?auto_732360 ) ) ( not ( = ?auto_732358 ?auto_732362 ) ) ( not ( = ?auto_732358 ?auto_732363 ) ) ( not ( = ?auto_732358 ?auto_732364 ) ) ( not ( = ?auto_732358 ?auto_732365 ) ) ( not ( = ?auto_732358 ?auto_732366 ) ) ( not ( = ?auto_732358 ?auto_732367 ) ) ( not ( = ?auto_732358 ?auto_732368 ) ) ( not ( = ?auto_732358 ?auto_732369 ) ) ( not ( = ?auto_732358 ?auto_732375 ) ) ( not ( = ?auto_732359 ?auto_732361 ) ) ( not ( = ?auto_732359 ?auto_732360 ) ) ( not ( = ?auto_732359 ?auto_732362 ) ) ( not ( = ?auto_732359 ?auto_732363 ) ) ( not ( = ?auto_732359 ?auto_732364 ) ) ( not ( = ?auto_732359 ?auto_732365 ) ) ( not ( = ?auto_732359 ?auto_732366 ) ) ( not ( = ?auto_732359 ?auto_732367 ) ) ( not ( = ?auto_732359 ?auto_732368 ) ) ( not ( = ?auto_732359 ?auto_732369 ) ) ( not ( = ?auto_732359 ?auto_732375 ) ) ( not ( = ?auto_732361 ?auto_732360 ) ) ( not ( = ?auto_732361 ?auto_732362 ) ) ( not ( = ?auto_732361 ?auto_732363 ) ) ( not ( = ?auto_732361 ?auto_732364 ) ) ( not ( = ?auto_732361 ?auto_732365 ) ) ( not ( = ?auto_732361 ?auto_732366 ) ) ( not ( = ?auto_732361 ?auto_732367 ) ) ( not ( = ?auto_732361 ?auto_732368 ) ) ( not ( = ?auto_732361 ?auto_732369 ) ) ( not ( = ?auto_732361 ?auto_732375 ) ) ( not ( = ?auto_732360 ?auto_732362 ) ) ( not ( = ?auto_732360 ?auto_732363 ) ) ( not ( = ?auto_732360 ?auto_732364 ) ) ( not ( = ?auto_732360 ?auto_732365 ) ) ( not ( = ?auto_732360 ?auto_732366 ) ) ( not ( = ?auto_732360 ?auto_732367 ) ) ( not ( = ?auto_732360 ?auto_732368 ) ) ( not ( = ?auto_732360 ?auto_732369 ) ) ( not ( = ?auto_732360 ?auto_732375 ) ) ( not ( = ?auto_732362 ?auto_732363 ) ) ( not ( = ?auto_732362 ?auto_732364 ) ) ( not ( = ?auto_732362 ?auto_732365 ) ) ( not ( = ?auto_732362 ?auto_732366 ) ) ( not ( = ?auto_732362 ?auto_732367 ) ) ( not ( = ?auto_732362 ?auto_732368 ) ) ( not ( = ?auto_732362 ?auto_732369 ) ) ( not ( = ?auto_732362 ?auto_732375 ) ) ( not ( = ?auto_732363 ?auto_732364 ) ) ( not ( = ?auto_732363 ?auto_732365 ) ) ( not ( = ?auto_732363 ?auto_732366 ) ) ( not ( = ?auto_732363 ?auto_732367 ) ) ( not ( = ?auto_732363 ?auto_732368 ) ) ( not ( = ?auto_732363 ?auto_732369 ) ) ( not ( = ?auto_732363 ?auto_732375 ) ) ( not ( = ?auto_732364 ?auto_732365 ) ) ( not ( = ?auto_732364 ?auto_732366 ) ) ( not ( = ?auto_732364 ?auto_732367 ) ) ( not ( = ?auto_732364 ?auto_732368 ) ) ( not ( = ?auto_732364 ?auto_732369 ) ) ( not ( = ?auto_732364 ?auto_732375 ) ) ( not ( = ?auto_732365 ?auto_732366 ) ) ( not ( = ?auto_732365 ?auto_732367 ) ) ( not ( = ?auto_732365 ?auto_732368 ) ) ( not ( = ?auto_732365 ?auto_732369 ) ) ( not ( = ?auto_732365 ?auto_732375 ) ) ( not ( = ?auto_732366 ?auto_732367 ) ) ( not ( = ?auto_732366 ?auto_732368 ) ) ( not ( = ?auto_732366 ?auto_732369 ) ) ( not ( = ?auto_732366 ?auto_732375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732367 ?auto_732368 ?auto_732369 )
      ( MAKE-12CRATE-VERIFY ?auto_732357 ?auto_732358 ?auto_732359 ?auto_732361 ?auto_732360 ?auto_732362 ?auto_732363 ?auto_732364 ?auto_732365 ?auto_732366 ?auto_732367 ?auto_732368 ?auto_732369 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732520 - SURFACE
      ?auto_732521 - SURFACE
      ?auto_732522 - SURFACE
      ?auto_732524 - SURFACE
      ?auto_732523 - SURFACE
      ?auto_732525 - SURFACE
      ?auto_732526 - SURFACE
      ?auto_732527 - SURFACE
      ?auto_732528 - SURFACE
      ?auto_732529 - SURFACE
      ?auto_732530 - SURFACE
      ?auto_732531 - SURFACE
      ?auto_732532 - SURFACE
    )
    :vars
    (
      ?auto_732535 - HOIST
      ?auto_732536 - PLACE
      ?auto_732537 - PLACE
      ?auto_732534 - HOIST
      ?auto_732538 - SURFACE
      ?auto_732533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732535 ?auto_732536 ) ( IS-CRATE ?auto_732532 ) ( not ( = ?auto_732531 ?auto_732532 ) ) ( not ( = ?auto_732530 ?auto_732531 ) ) ( not ( = ?auto_732530 ?auto_732532 ) ) ( not ( = ?auto_732537 ?auto_732536 ) ) ( HOIST-AT ?auto_732534 ?auto_732537 ) ( not ( = ?auto_732535 ?auto_732534 ) ) ( AVAILABLE ?auto_732534 ) ( SURFACE-AT ?auto_732532 ?auto_732537 ) ( ON ?auto_732532 ?auto_732538 ) ( CLEAR ?auto_732532 ) ( not ( = ?auto_732531 ?auto_732538 ) ) ( not ( = ?auto_732532 ?auto_732538 ) ) ( not ( = ?auto_732530 ?auto_732538 ) ) ( TRUCK-AT ?auto_732533 ?auto_732536 ) ( SURFACE-AT ?auto_732530 ?auto_732536 ) ( CLEAR ?auto_732530 ) ( IS-CRATE ?auto_732531 ) ( AVAILABLE ?auto_732535 ) ( IN ?auto_732531 ?auto_732533 ) ( ON ?auto_732521 ?auto_732520 ) ( ON ?auto_732522 ?auto_732521 ) ( ON ?auto_732524 ?auto_732522 ) ( ON ?auto_732523 ?auto_732524 ) ( ON ?auto_732525 ?auto_732523 ) ( ON ?auto_732526 ?auto_732525 ) ( ON ?auto_732527 ?auto_732526 ) ( ON ?auto_732528 ?auto_732527 ) ( ON ?auto_732529 ?auto_732528 ) ( ON ?auto_732530 ?auto_732529 ) ( not ( = ?auto_732520 ?auto_732521 ) ) ( not ( = ?auto_732520 ?auto_732522 ) ) ( not ( = ?auto_732520 ?auto_732524 ) ) ( not ( = ?auto_732520 ?auto_732523 ) ) ( not ( = ?auto_732520 ?auto_732525 ) ) ( not ( = ?auto_732520 ?auto_732526 ) ) ( not ( = ?auto_732520 ?auto_732527 ) ) ( not ( = ?auto_732520 ?auto_732528 ) ) ( not ( = ?auto_732520 ?auto_732529 ) ) ( not ( = ?auto_732520 ?auto_732530 ) ) ( not ( = ?auto_732520 ?auto_732531 ) ) ( not ( = ?auto_732520 ?auto_732532 ) ) ( not ( = ?auto_732520 ?auto_732538 ) ) ( not ( = ?auto_732521 ?auto_732522 ) ) ( not ( = ?auto_732521 ?auto_732524 ) ) ( not ( = ?auto_732521 ?auto_732523 ) ) ( not ( = ?auto_732521 ?auto_732525 ) ) ( not ( = ?auto_732521 ?auto_732526 ) ) ( not ( = ?auto_732521 ?auto_732527 ) ) ( not ( = ?auto_732521 ?auto_732528 ) ) ( not ( = ?auto_732521 ?auto_732529 ) ) ( not ( = ?auto_732521 ?auto_732530 ) ) ( not ( = ?auto_732521 ?auto_732531 ) ) ( not ( = ?auto_732521 ?auto_732532 ) ) ( not ( = ?auto_732521 ?auto_732538 ) ) ( not ( = ?auto_732522 ?auto_732524 ) ) ( not ( = ?auto_732522 ?auto_732523 ) ) ( not ( = ?auto_732522 ?auto_732525 ) ) ( not ( = ?auto_732522 ?auto_732526 ) ) ( not ( = ?auto_732522 ?auto_732527 ) ) ( not ( = ?auto_732522 ?auto_732528 ) ) ( not ( = ?auto_732522 ?auto_732529 ) ) ( not ( = ?auto_732522 ?auto_732530 ) ) ( not ( = ?auto_732522 ?auto_732531 ) ) ( not ( = ?auto_732522 ?auto_732532 ) ) ( not ( = ?auto_732522 ?auto_732538 ) ) ( not ( = ?auto_732524 ?auto_732523 ) ) ( not ( = ?auto_732524 ?auto_732525 ) ) ( not ( = ?auto_732524 ?auto_732526 ) ) ( not ( = ?auto_732524 ?auto_732527 ) ) ( not ( = ?auto_732524 ?auto_732528 ) ) ( not ( = ?auto_732524 ?auto_732529 ) ) ( not ( = ?auto_732524 ?auto_732530 ) ) ( not ( = ?auto_732524 ?auto_732531 ) ) ( not ( = ?auto_732524 ?auto_732532 ) ) ( not ( = ?auto_732524 ?auto_732538 ) ) ( not ( = ?auto_732523 ?auto_732525 ) ) ( not ( = ?auto_732523 ?auto_732526 ) ) ( not ( = ?auto_732523 ?auto_732527 ) ) ( not ( = ?auto_732523 ?auto_732528 ) ) ( not ( = ?auto_732523 ?auto_732529 ) ) ( not ( = ?auto_732523 ?auto_732530 ) ) ( not ( = ?auto_732523 ?auto_732531 ) ) ( not ( = ?auto_732523 ?auto_732532 ) ) ( not ( = ?auto_732523 ?auto_732538 ) ) ( not ( = ?auto_732525 ?auto_732526 ) ) ( not ( = ?auto_732525 ?auto_732527 ) ) ( not ( = ?auto_732525 ?auto_732528 ) ) ( not ( = ?auto_732525 ?auto_732529 ) ) ( not ( = ?auto_732525 ?auto_732530 ) ) ( not ( = ?auto_732525 ?auto_732531 ) ) ( not ( = ?auto_732525 ?auto_732532 ) ) ( not ( = ?auto_732525 ?auto_732538 ) ) ( not ( = ?auto_732526 ?auto_732527 ) ) ( not ( = ?auto_732526 ?auto_732528 ) ) ( not ( = ?auto_732526 ?auto_732529 ) ) ( not ( = ?auto_732526 ?auto_732530 ) ) ( not ( = ?auto_732526 ?auto_732531 ) ) ( not ( = ?auto_732526 ?auto_732532 ) ) ( not ( = ?auto_732526 ?auto_732538 ) ) ( not ( = ?auto_732527 ?auto_732528 ) ) ( not ( = ?auto_732527 ?auto_732529 ) ) ( not ( = ?auto_732527 ?auto_732530 ) ) ( not ( = ?auto_732527 ?auto_732531 ) ) ( not ( = ?auto_732527 ?auto_732532 ) ) ( not ( = ?auto_732527 ?auto_732538 ) ) ( not ( = ?auto_732528 ?auto_732529 ) ) ( not ( = ?auto_732528 ?auto_732530 ) ) ( not ( = ?auto_732528 ?auto_732531 ) ) ( not ( = ?auto_732528 ?auto_732532 ) ) ( not ( = ?auto_732528 ?auto_732538 ) ) ( not ( = ?auto_732529 ?auto_732530 ) ) ( not ( = ?auto_732529 ?auto_732531 ) ) ( not ( = ?auto_732529 ?auto_732532 ) ) ( not ( = ?auto_732529 ?auto_732538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732530 ?auto_732531 ?auto_732532 )
      ( MAKE-12CRATE-VERIFY ?auto_732520 ?auto_732521 ?auto_732522 ?auto_732524 ?auto_732523 ?auto_732525 ?auto_732526 ?auto_732527 ?auto_732528 ?auto_732529 ?auto_732530 ?auto_732531 ?auto_732532 ) )
  )

)

