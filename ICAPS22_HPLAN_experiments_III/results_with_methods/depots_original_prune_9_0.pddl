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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166209 - SURFACE
      ?auto_166210 - SURFACE
    )
    :vars
    (
      ?auto_166211 - HOIST
      ?auto_166212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166211 ?auto_166212 ) ( SURFACE-AT ?auto_166209 ?auto_166212 ) ( CLEAR ?auto_166209 ) ( LIFTING ?auto_166211 ?auto_166210 ) ( IS-CRATE ?auto_166210 ) ( not ( = ?auto_166209 ?auto_166210 ) ) )
    :subtasks
    ( ( !DROP ?auto_166211 ?auto_166210 ?auto_166209 ?auto_166212 )
      ( MAKE-1CRATE-VERIFY ?auto_166209 ?auto_166210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166213 - SURFACE
      ?auto_166214 - SURFACE
    )
    :vars
    (
      ?auto_166216 - HOIST
      ?auto_166215 - PLACE
      ?auto_166217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166216 ?auto_166215 ) ( SURFACE-AT ?auto_166213 ?auto_166215 ) ( CLEAR ?auto_166213 ) ( IS-CRATE ?auto_166214 ) ( not ( = ?auto_166213 ?auto_166214 ) ) ( TRUCK-AT ?auto_166217 ?auto_166215 ) ( AVAILABLE ?auto_166216 ) ( IN ?auto_166214 ?auto_166217 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166216 ?auto_166214 ?auto_166217 ?auto_166215 )
      ( MAKE-1CRATE ?auto_166213 ?auto_166214 )
      ( MAKE-1CRATE-VERIFY ?auto_166213 ?auto_166214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166218 - SURFACE
      ?auto_166219 - SURFACE
    )
    :vars
    (
      ?auto_166221 - HOIST
      ?auto_166220 - PLACE
      ?auto_166222 - TRUCK
      ?auto_166223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166221 ?auto_166220 ) ( SURFACE-AT ?auto_166218 ?auto_166220 ) ( CLEAR ?auto_166218 ) ( IS-CRATE ?auto_166219 ) ( not ( = ?auto_166218 ?auto_166219 ) ) ( AVAILABLE ?auto_166221 ) ( IN ?auto_166219 ?auto_166222 ) ( TRUCK-AT ?auto_166222 ?auto_166223 ) ( not ( = ?auto_166223 ?auto_166220 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166222 ?auto_166223 ?auto_166220 )
      ( MAKE-1CRATE ?auto_166218 ?auto_166219 )
      ( MAKE-1CRATE-VERIFY ?auto_166218 ?auto_166219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166224 - SURFACE
      ?auto_166225 - SURFACE
    )
    :vars
    (
      ?auto_166228 - HOIST
      ?auto_166229 - PLACE
      ?auto_166226 - TRUCK
      ?auto_166227 - PLACE
      ?auto_166230 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166228 ?auto_166229 ) ( SURFACE-AT ?auto_166224 ?auto_166229 ) ( CLEAR ?auto_166224 ) ( IS-CRATE ?auto_166225 ) ( not ( = ?auto_166224 ?auto_166225 ) ) ( AVAILABLE ?auto_166228 ) ( TRUCK-AT ?auto_166226 ?auto_166227 ) ( not ( = ?auto_166227 ?auto_166229 ) ) ( HOIST-AT ?auto_166230 ?auto_166227 ) ( LIFTING ?auto_166230 ?auto_166225 ) ( not ( = ?auto_166228 ?auto_166230 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166230 ?auto_166225 ?auto_166226 ?auto_166227 )
      ( MAKE-1CRATE ?auto_166224 ?auto_166225 )
      ( MAKE-1CRATE-VERIFY ?auto_166224 ?auto_166225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166231 - SURFACE
      ?auto_166232 - SURFACE
    )
    :vars
    (
      ?auto_166235 - HOIST
      ?auto_166233 - PLACE
      ?auto_166234 - TRUCK
      ?auto_166237 - PLACE
      ?auto_166236 - HOIST
      ?auto_166238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166235 ?auto_166233 ) ( SURFACE-AT ?auto_166231 ?auto_166233 ) ( CLEAR ?auto_166231 ) ( IS-CRATE ?auto_166232 ) ( not ( = ?auto_166231 ?auto_166232 ) ) ( AVAILABLE ?auto_166235 ) ( TRUCK-AT ?auto_166234 ?auto_166237 ) ( not ( = ?auto_166237 ?auto_166233 ) ) ( HOIST-AT ?auto_166236 ?auto_166237 ) ( not ( = ?auto_166235 ?auto_166236 ) ) ( AVAILABLE ?auto_166236 ) ( SURFACE-AT ?auto_166232 ?auto_166237 ) ( ON ?auto_166232 ?auto_166238 ) ( CLEAR ?auto_166232 ) ( not ( = ?auto_166231 ?auto_166238 ) ) ( not ( = ?auto_166232 ?auto_166238 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166236 ?auto_166232 ?auto_166238 ?auto_166237 )
      ( MAKE-1CRATE ?auto_166231 ?auto_166232 )
      ( MAKE-1CRATE-VERIFY ?auto_166231 ?auto_166232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166239 - SURFACE
      ?auto_166240 - SURFACE
    )
    :vars
    (
      ?auto_166243 - HOIST
      ?auto_166245 - PLACE
      ?auto_166241 - PLACE
      ?auto_166242 - HOIST
      ?auto_166244 - SURFACE
      ?auto_166246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166243 ?auto_166245 ) ( SURFACE-AT ?auto_166239 ?auto_166245 ) ( CLEAR ?auto_166239 ) ( IS-CRATE ?auto_166240 ) ( not ( = ?auto_166239 ?auto_166240 ) ) ( AVAILABLE ?auto_166243 ) ( not ( = ?auto_166241 ?auto_166245 ) ) ( HOIST-AT ?auto_166242 ?auto_166241 ) ( not ( = ?auto_166243 ?auto_166242 ) ) ( AVAILABLE ?auto_166242 ) ( SURFACE-AT ?auto_166240 ?auto_166241 ) ( ON ?auto_166240 ?auto_166244 ) ( CLEAR ?auto_166240 ) ( not ( = ?auto_166239 ?auto_166244 ) ) ( not ( = ?auto_166240 ?auto_166244 ) ) ( TRUCK-AT ?auto_166246 ?auto_166245 ) )
    :subtasks
    ( ( !DRIVE ?auto_166246 ?auto_166245 ?auto_166241 )
      ( MAKE-1CRATE ?auto_166239 ?auto_166240 )
      ( MAKE-1CRATE-VERIFY ?auto_166239 ?auto_166240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166256 - SURFACE
      ?auto_166257 - SURFACE
      ?auto_166258 - SURFACE
    )
    :vars
    (
      ?auto_166260 - HOIST
      ?auto_166259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166260 ?auto_166259 ) ( SURFACE-AT ?auto_166257 ?auto_166259 ) ( CLEAR ?auto_166257 ) ( LIFTING ?auto_166260 ?auto_166258 ) ( IS-CRATE ?auto_166258 ) ( not ( = ?auto_166257 ?auto_166258 ) ) ( ON ?auto_166257 ?auto_166256 ) ( not ( = ?auto_166256 ?auto_166257 ) ) ( not ( = ?auto_166256 ?auto_166258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166257 ?auto_166258 )
      ( MAKE-2CRATE-VERIFY ?auto_166256 ?auto_166257 ?auto_166258 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166266 - SURFACE
      ?auto_166267 - SURFACE
      ?auto_166268 - SURFACE
    )
    :vars
    (
      ?auto_166270 - HOIST
      ?auto_166271 - PLACE
      ?auto_166269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166270 ?auto_166271 ) ( SURFACE-AT ?auto_166267 ?auto_166271 ) ( CLEAR ?auto_166267 ) ( IS-CRATE ?auto_166268 ) ( not ( = ?auto_166267 ?auto_166268 ) ) ( TRUCK-AT ?auto_166269 ?auto_166271 ) ( AVAILABLE ?auto_166270 ) ( IN ?auto_166268 ?auto_166269 ) ( ON ?auto_166267 ?auto_166266 ) ( not ( = ?auto_166266 ?auto_166267 ) ) ( not ( = ?auto_166266 ?auto_166268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166267 ?auto_166268 )
      ( MAKE-2CRATE-VERIFY ?auto_166266 ?auto_166267 ?auto_166268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166272 - SURFACE
      ?auto_166273 - SURFACE
    )
    :vars
    (
      ?auto_166277 - HOIST
      ?auto_166275 - PLACE
      ?auto_166276 - TRUCK
      ?auto_166274 - SURFACE
      ?auto_166278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166277 ?auto_166275 ) ( SURFACE-AT ?auto_166272 ?auto_166275 ) ( CLEAR ?auto_166272 ) ( IS-CRATE ?auto_166273 ) ( not ( = ?auto_166272 ?auto_166273 ) ) ( AVAILABLE ?auto_166277 ) ( IN ?auto_166273 ?auto_166276 ) ( ON ?auto_166272 ?auto_166274 ) ( not ( = ?auto_166274 ?auto_166272 ) ) ( not ( = ?auto_166274 ?auto_166273 ) ) ( TRUCK-AT ?auto_166276 ?auto_166278 ) ( not ( = ?auto_166278 ?auto_166275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166276 ?auto_166278 ?auto_166275 )
      ( MAKE-2CRATE ?auto_166274 ?auto_166272 ?auto_166273 )
      ( MAKE-1CRATE-VERIFY ?auto_166272 ?auto_166273 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166279 - SURFACE
      ?auto_166280 - SURFACE
      ?auto_166281 - SURFACE
    )
    :vars
    (
      ?auto_166283 - HOIST
      ?auto_166282 - PLACE
      ?auto_166284 - TRUCK
      ?auto_166285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166283 ?auto_166282 ) ( SURFACE-AT ?auto_166280 ?auto_166282 ) ( CLEAR ?auto_166280 ) ( IS-CRATE ?auto_166281 ) ( not ( = ?auto_166280 ?auto_166281 ) ) ( AVAILABLE ?auto_166283 ) ( IN ?auto_166281 ?auto_166284 ) ( ON ?auto_166280 ?auto_166279 ) ( not ( = ?auto_166279 ?auto_166280 ) ) ( not ( = ?auto_166279 ?auto_166281 ) ) ( TRUCK-AT ?auto_166284 ?auto_166285 ) ( not ( = ?auto_166285 ?auto_166282 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166280 ?auto_166281 )
      ( MAKE-2CRATE-VERIFY ?auto_166279 ?auto_166280 ?auto_166281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166286 - SURFACE
      ?auto_166287 - SURFACE
    )
    :vars
    (
      ?auto_166292 - HOIST
      ?auto_166291 - PLACE
      ?auto_166288 - SURFACE
      ?auto_166289 - TRUCK
      ?auto_166290 - PLACE
      ?auto_166293 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166292 ?auto_166291 ) ( SURFACE-AT ?auto_166286 ?auto_166291 ) ( CLEAR ?auto_166286 ) ( IS-CRATE ?auto_166287 ) ( not ( = ?auto_166286 ?auto_166287 ) ) ( AVAILABLE ?auto_166292 ) ( ON ?auto_166286 ?auto_166288 ) ( not ( = ?auto_166288 ?auto_166286 ) ) ( not ( = ?auto_166288 ?auto_166287 ) ) ( TRUCK-AT ?auto_166289 ?auto_166290 ) ( not ( = ?auto_166290 ?auto_166291 ) ) ( HOIST-AT ?auto_166293 ?auto_166290 ) ( LIFTING ?auto_166293 ?auto_166287 ) ( not ( = ?auto_166292 ?auto_166293 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166293 ?auto_166287 ?auto_166289 ?auto_166290 )
      ( MAKE-2CRATE ?auto_166288 ?auto_166286 ?auto_166287 )
      ( MAKE-1CRATE-VERIFY ?auto_166286 ?auto_166287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166294 - SURFACE
      ?auto_166295 - SURFACE
      ?auto_166296 - SURFACE
    )
    :vars
    (
      ?auto_166301 - HOIST
      ?auto_166297 - PLACE
      ?auto_166298 - TRUCK
      ?auto_166300 - PLACE
      ?auto_166299 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166301 ?auto_166297 ) ( SURFACE-AT ?auto_166295 ?auto_166297 ) ( CLEAR ?auto_166295 ) ( IS-CRATE ?auto_166296 ) ( not ( = ?auto_166295 ?auto_166296 ) ) ( AVAILABLE ?auto_166301 ) ( ON ?auto_166295 ?auto_166294 ) ( not ( = ?auto_166294 ?auto_166295 ) ) ( not ( = ?auto_166294 ?auto_166296 ) ) ( TRUCK-AT ?auto_166298 ?auto_166300 ) ( not ( = ?auto_166300 ?auto_166297 ) ) ( HOIST-AT ?auto_166299 ?auto_166300 ) ( LIFTING ?auto_166299 ?auto_166296 ) ( not ( = ?auto_166301 ?auto_166299 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166295 ?auto_166296 )
      ( MAKE-2CRATE-VERIFY ?auto_166294 ?auto_166295 ?auto_166296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166302 - SURFACE
      ?auto_166303 - SURFACE
    )
    :vars
    (
      ?auto_166304 - HOIST
      ?auto_166309 - PLACE
      ?auto_166307 - SURFACE
      ?auto_166308 - TRUCK
      ?auto_166305 - PLACE
      ?auto_166306 - HOIST
      ?auto_166310 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166304 ?auto_166309 ) ( SURFACE-AT ?auto_166302 ?auto_166309 ) ( CLEAR ?auto_166302 ) ( IS-CRATE ?auto_166303 ) ( not ( = ?auto_166302 ?auto_166303 ) ) ( AVAILABLE ?auto_166304 ) ( ON ?auto_166302 ?auto_166307 ) ( not ( = ?auto_166307 ?auto_166302 ) ) ( not ( = ?auto_166307 ?auto_166303 ) ) ( TRUCK-AT ?auto_166308 ?auto_166305 ) ( not ( = ?auto_166305 ?auto_166309 ) ) ( HOIST-AT ?auto_166306 ?auto_166305 ) ( not ( = ?auto_166304 ?auto_166306 ) ) ( AVAILABLE ?auto_166306 ) ( SURFACE-AT ?auto_166303 ?auto_166305 ) ( ON ?auto_166303 ?auto_166310 ) ( CLEAR ?auto_166303 ) ( not ( = ?auto_166302 ?auto_166310 ) ) ( not ( = ?auto_166303 ?auto_166310 ) ) ( not ( = ?auto_166307 ?auto_166310 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166306 ?auto_166303 ?auto_166310 ?auto_166305 )
      ( MAKE-2CRATE ?auto_166307 ?auto_166302 ?auto_166303 )
      ( MAKE-1CRATE-VERIFY ?auto_166302 ?auto_166303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166311 - SURFACE
      ?auto_166312 - SURFACE
      ?auto_166313 - SURFACE
    )
    :vars
    (
      ?auto_166318 - HOIST
      ?auto_166319 - PLACE
      ?auto_166316 - TRUCK
      ?auto_166314 - PLACE
      ?auto_166315 - HOIST
      ?auto_166317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166318 ?auto_166319 ) ( SURFACE-AT ?auto_166312 ?auto_166319 ) ( CLEAR ?auto_166312 ) ( IS-CRATE ?auto_166313 ) ( not ( = ?auto_166312 ?auto_166313 ) ) ( AVAILABLE ?auto_166318 ) ( ON ?auto_166312 ?auto_166311 ) ( not ( = ?auto_166311 ?auto_166312 ) ) ( not ( = ?auto_166311 ?auto_166313 ) ) ( TRUCK-AT ?auto_166316 ?auto_166314 ) ( not ( = ?auto_166314 ?auto_166319 ) ) ( HOIST-AT ?auto_166315 ?auto_166314 ) ( not ( = ?auto_166318 ?auto_166315 ) ) ( AVAILABLE ?auto_166315 ) ( SURFACE-AT ?auto_166313 ?auto_166314 ) ( ON ?auto_166313 ?auto_166317 ) ( CLEAR ?auto_166313 ) ( not ( = ?auto_166312 ?auto_166317 ) ) ( not ( = ?auto_166313 ?auto_166317 ) ) ( not ( = ?auto_166311 ?auto_166317 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166312 ?auto_166313 )
      ( MAKE-2CRATE-VERIFY ?auto_166311 ?auto_166312 ?auto_166313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166320 - SURFACE
      ?auto_166321 - SURFACE
    )
    :vars
    (
      ?auto_166326 - HOIST
      ?auto_166327 - PLACE
      ?auto_166323 - SURFACE
      ?auto_166322 - PLACE
      ?auto_166324 - HOIST
      ?auto_166328 - SURFACE
      ?auto_166325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166326 ?auto_166327 ) ( SURFACE-AT ?auto_166320 ?auto_166327 ) ( CLEAR ?auto_166320 ) ( IS-CRATE ?auto_166321 ) ( not ( = ?auto_166320 ?auto_166321 ) ) ( AVAILABLE ?auto_166326 ) ( ON ?auto_166320 ?auto_166323 ) ( not ( = ?auto_166323 ?auto_166320 ) ) ( not ( = ?auto_166323 ?auto_166321 ) ) ( not ( = ?auto_166322 ?auto_166327 ) ) ( HOIST-AT ?auto_166324 ?auto_166322 ) ( not ( = ?auto_166326 ?auto_166324 ) ) ( AVAILABLE ?auto_166324 ) ( SURFACE-AT ?auto_166321 ?auto_166322 ) ( ON ?auto_166321 ?auto_166328 ) ( CLEAR ?auto_166321 ) ( not ( = ?auto_166320 ?auto_166328 ) ) ( not ( = ?auto_166321 ?auto_166328 ) ) ( not ( = ?auto_166323 ?auto_166328 ) ) ( TRUCK-AT ?auto_166325 ?auto_166327 ) )
    :subtasks
    ( ( !DRIVE ?auto_166325 ?auto_166327 ?auto_166322 )
      ( MAKE-2CRATE ?auto_166323 ?auto_166320 ?auto_166321 )
      ( MAKE-1CRATE-VERIFY ?auto_166320 ?auto_166321 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166329 - SURFACE
      ?auto_166330 - SURFACE
      ?auto_166331 - SURFACE
    )
    :vars
    (
      ?auto_166334 - HOIST
      ?auto_166336 - PLACE
      ?auto_166332 - PLACE
      ?auto_166337 - HOIST
      ?auto_166335 - SURFACE
      ?auto_166333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166334 ?auto_166336 ) ( SURFACE-AT ?auto_166330 ?auto_166336 ) ( CLEAR ?auto_166330 ) ( IS-CRATE ?auto_166331 ) ( not ( = ?auto_166330 ?auto_166331 ) ) ( AVAILABLE ?auto_166334 ) ( ON ?auto_166330 ?auto_166329 ) ( not ( = ?auto_166329 ?auto_166330 ) ) ( not ( = ?auto_166329 ?auto_166331 ) ) ( not ( = ?auto_166332 ?auto_166336 ) ) ( HOIST-AT ?auto_166337 ?auto_166332 ) ( not ( = ?auto_166334 ?auto_166337 ) ) ( AVAILABLE ?auto_166337 ) ( SURFACE-AT ?auto_166331 ?auto_166332 ) ( ON ?auto_166331 ?auto_166335 ) ( CLEAR ?auto_166331 ) ( not ( = ?auto_166330 ?auto_166335 ) ) ( not ( = ?auto_166331 ?auto_166335 ) ) ( not ( = ?auto_166329 ?auto_166335 ) ) ( TRUCK-AT ?auto_166333 ?auto_166336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166330 ?auto_166331 )
      ( MAKE-2CRATE-VERIFY ?auto_166329 ?auto_166330 ?auto_166331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166338 - SURFACE
      ?auto_166339 - SURFACE
    )
    :vars
    (
      ?auto_166345 - HOIST
      ?auto_166341 - PLACE
      ?auto_166346 - SURFACE
      ?auto_166343 - PLACE
      ?auto_166344 - HOIST
      ?auto_166342 - SURFACE
      ?auto_166340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166345 ?auto_166341 ) ( IS-CRATE ?auto_166339 ) ( not ( = ?auto_166338 ?auto_166339 ) ) ( not ( = ?auto_166346 ?auto_166338 ) ) ( not ( = ?auto_166346 ?auto_166339 ) ) ( not ( = ?auto_166343 ?auto_166341 ) ) ( HOIST-AT ?auto_166344 ?auto_166343 ) ( not ( = ?auto_166345 ?auto_166344 ) ) ( AVAILABLE ?auto_166344 ) ( SURFACE-AT ?auto_166339 ?auto_166343 ) ( ON ?auto_166339 ?auto_166342 ) ( CLEAR ?auto_166339 ) ( not ( = ?auto_166338 ?auto_166342 ) ) ( not ( = ?auto_166339 ?auto_166342 ) ) ( not ( = ?auto_166346 ?auto_166342 ) ) ( TRUCK-AT ?auto_166340 ?auto_166341 ) ( SURFACE-AT ?auto_166346 ?auto_166341 ) ( CLEAR ?auto_166346 ) ( LIFTING ?auto_166345 ?auto_166338 ) ( IS-CRATE ?auto_166338 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166346 ?auto_166338 )
      ( MAKE-2CRATE ?auto_166346 ?auto_166338 ?auto_166339 )
      ( MAKE-1CRATE-VERIFY ?auto_166338 ?auto_166339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166347 - SURFACE
      ?auto_166348 - SURFACE
      ?auto_166349 - SURFACE
    )
    :vars
    (
      ?auto_166350 - HOIST
      ?auto_166353 - PLACE
      ?auto_166354 - PLACE
      ?auto_166355 - HOIST
      ?auto_166352 - SURFACE
      ?auto_166351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166350 ?auto_166353 ) ( IS-CRATE ?auto_166349 ) ( not ( = ?auto_166348 ?auto_166349 ) ) ( not ( = ?auto_166347 ?auto_166348 ) ) ( not ( = ?auto_166347 ?auto_166349 ) ) ( not ( = ?auto_166354 ?auto_166353 ) ) ( HOIST-AT ?auto_166355 ?auto_166354 ) ( not ( = ?auto_166350 ?auto_166355 ) ) ( AVAILABLE ?auto_166355 ) ( SURFACE-AT ?auto_166349 ?auto_166354 ) ( ON ?auto_166349 ?auto_166352 ) ( CLEAR ?auto_166349 ) ( not ( = ?auto_166348 ?auto_166352 ) ) ( not ( = ?auto_166349 ?auto_166352 ) ) ( not ( = ?auto_166347 ?auto_166352 ) ) ( TRUCK-AT ?auto_166351 ?auto_166353 ) ( SURFACE-AT ?auto_166347 ?auto_166353 ) ( CLEAR ?auto_166347 ) ( LIFTING ?auto_166350 ?auto_166348 ) ( IS-CRATE ?auto_166348 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166348 ?auto_166349 )
      ( MAKE-2CRATE-VERIFY ?auto_166347 ?auto_166348 ?auto_166349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166356 - SURFACE
      ?auto_166357 - SURFACE
    )
    :vars
    (
      ?auto_166363 - HOIST
      ?auto_166361 - PLACE
      ?auto_166364 - SURFACE
      ?auto_166358 - PLACE
      ?auto_166362 - HOIST
      ?auto_166360 - SURFACE
      ?auto_166359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166363 ?auto_166361 ) ( IS-CRATE ?auto_166357 ) ( not ( = ?auto_166356 ?auto_166357 ) ) ( not ( = ?auto_166364 ?auto_166356 ) ) ( not ( = ?auto_166364 ?auto_166357 ) ) ( not ( = ?auto_166358 ?auto_166361 ) ) ( HOIST-AT ?auto_166362 ?auto_166358 ) ( not ( = ?auto_166363 ?auto_166362 ) ) ( AVAILABLE ?auto_166362 ) ( SURFACE-AT ?auto_166357 ?auto_166358 ) ( ON ?auto_166357 ?auto_166360 ) ( CLEAR ?auto_166357 ) ( not ( = ?auto_166356 ?auto_166360 ) ) ( not ( = ?auto_166357 ?auto_166360 ) ) ( not ( = ?auto_166364 ?auto_166360 ) ) ( TRUCK-AT ?auto_166359 ?auto_166361 ) ( SURFACE-AT ?auto_166364 ?auto_166361 ) ( CLEAR ?auto_166364 ) ( IS-CRATE ?auto_166356 ) ( AVAILABLE ?auto_166363 ) ( IN ?auto_166356 ?auto_166359 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166363 ?auto_166356 ?auto_166359 ?auto_166361 )
      ( MAKE-2CRATE ?auto_166364 ?auto_166356 ?auto_166357 )
      ( MAKE-1CRATE-VERIFY ?auto_166356 ?auto_166357 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166365 - SURFACE
      ?auto_166366 - SURFACE
      ?auto_166367 - SURFACE
    )
    :vars
    (
      ?auto_166371 - HOIST
      ?auto_166372 - PLACE
      ?auto_166370 - PLACE
      ?auto_166369 - HOIST
      ?auto_166373 - SURFACE
      ?auto_166368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166371 ?auto_166372 ) ( IS-CRATE ?auto_166367 ) ( not ( = ?auto_166366 ?auto_166367 ) ) ( not ( = ?auto_166365 ?auto_166366 ) ) ( not ( = ?auto_166365 ?auto_166367 ) ) ( not ( = ?auto_166370 ?auto_166372 ) ) ( HOIST-AT ?auto_166369 ?auto_166370 ) ( not ( = ?auto_166371 ?auto_166369 ) ) ( AVAILABLE ?auto_166369 ) ( SURFACE-AT ?auto_166367 ?auto_166370 ) ( ON ?auto_166367 ?auto_166373 ) ( CLEAR ?auto_166367 ) ( not ( = ?auto_166366 ?auto_166373 ) ) ( not ( = ?auto_166367 ?auto_166373 ) ) ( not ( = ?auto_166365 ?auto_166373 ) ) ( TRUCK-AT ?auto_166368 ?auto_166372 ) ( SURFACE-AT ?auto_166365 ?auto_166372 ) ( CLEAR ?auto_166365 ) ( IS-CRATE ?auto_166366 ) ( AVAILABLE ?auto_166371 ) ( IN ?auto_166366 ?auto_166368 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166366 ?auto_166367 )
      ( MAKE-2CRATE-VERIFY ?auto_166365 ?auto_166366 ?auto_166367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166410 - SURFACE
      ?auto_166411 - SURFACE
    )
    :vars
    (
      ?auto_166412 - HOIST
      ?auto_166415 - PLACE
      ?auto_166417 - SURFACE
      ?auto_166416 - PLACE
      ?auto_166418 - HOIST
      ?auto_166413 - SURFACE
      ?auto_166414 - TRUCK
      ?auto_166419 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166412 ?auto_166415 ) ( SURFACE-AT ?auto_166410 ?auto_166415 ) ( CLEAR ?auto_166410 ) ( IS-CRATE ?auto_166411 ) ( not ( = ?auto_166410 ?auto_166411 ) ) ( AVAILABLE ?auto_166412 ) ( ON ?auto_166410 ?auto_166417 ) ( not ( = ?auto_166417 ?auto_166410 ) ) ( not ( = ?auto_166417 ?auto_166411 ) ) ( not ( = ?auto_166416 ?auto_166415 ) ) ( HOIST-AT ?auto_166418 ?auto_166416 ) ( not ( = ?auto_166412 ?auto_166418 ) ) ( AVAILABLE ?auto_166418 ) ( SURFACE-AT ?auto_166411 ?auto_166416 ) ( ON ?auto_166411 ?auto_166413 ) ( CLEAR ?auto_166411 ) ( not ( = ?auto_166410 ?auto_166413 ) ) ( not ( = ?auto_166411 ?auto_166413 ) ) ( not ( = ?auto_166417 ?auto_166413 ) ) ( TRUCK-AT ?auto_166414 ?auto_166419 ) ( not ( = ?auto_166419 ?auto_166415 ) ) ( not ( = ?auto_166416 ?auto_166419 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166414 ?auto_166419 ?auto_166415 )
      ( MAKE-1CRATE ?auto_166410 ?auto_166411 )
      ( MAKE-1CRATE-VERIFY ?auto_166410 ?auto_166411 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166449 - SURFACE
      ?auto_166450 - SURFACE
      ?auto_166451 - SURFACE
      ?auto_166452 - SURFACE
    )
    :vars
    (
      ?auto_166454 - HOIST
      ?auto_166453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166454 ?auto_166453 ) ( SURFACE-AT ?auto_166451 ?auto_166453 ) ( CLEAR ?auto_166451 ) ( LIFTING ?auto_166454 ?auto_166452 ) ( IS-CRATE ?auto_166452 ) ( not ( = ?auto_166451 ?auto_166452 ) ) ( ON ?auto_166450 ?auto_166449 ) ( ON ?auto_166451 ?auto_166450 ) ( not ( = ?auto_166449 ?auto_166450 ) ) ( not ( = ?auto_166449 ?auto_166451 ) ) ( not ( = ?auto_166449 ?auto_166452 ) ) ( not ( = ?auto_166450 ?auto_166451 ) ) ( not ( = ?auto_166450 ?auto_166452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166451 ?auto_166452 )
      ( MAKE-3CRATE-VERIFY ?auto_166449 ?auto_166450 ?auto_166451 ?auto_166452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166466 - SURFACE
      ?auto_166467 - SURFACE
      ?auto_166468 - SURFACE
      ?auto_166469 - SURFACE
    )
    :vars
    (
      ?auto_166472 - HOIST
      ?auto_166470 - PLACE
      ?auto_166471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166472 ?auto_166470 ) ( SURFACE-AT ?auto_166468 ?auto_166470 ) ( CLEAR ?auto_166468 ) ( IS-CRATE ?auto_166469 ) ( not ( = ?auto_166468 ?auto_166469 ) ) ( TRUCK-AT ?auto_166471 ?auto_166470 ) ( AVAILABLE ?auto_166472 ) ( IN ?auto_166469 ?auto_166471 ) ( ON ?auto_166468 ?auto_166467 ) ( not ( = ?auto_166467 ?auto_166468 ) ) ( not ( = ?auto_166467 ?auto_166469 ) ) ( ON ?auto_166467 ?auto_166466 ) ( not ( = ?auto_166466 ?auto_166467 ) ) ( not ( = ?auto_166466 ?auto_166468 ) ) ( not ( = ?auto_166466 ?auto_166469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166467 ?auto_166468 ?auto_166469 )
      ( MAKE-3CRATE-VERIFY ?auto_166466 ?auto_166467 ?auto_166468 ?auto_166469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166487 - SURFACE
      ?auto_166488 - SURFACE
      ?auto_166489 - SURFACE
      ?auto_166490 - SURFACE
    )
    :vars
    (
      ?auto_166491 - HOIST
      ?auto_166494 - PLACE
      ?auto_166493 - TRUCK
      ?auto_166492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166491 ?auto_166494 ) ( SURFACE-AT ?auto_166489 ?auto_166494 ) ( CLEAR ?auto_166489 ) ( IS-CRATE ?auto_166490 ) ( not ( = ?auto_166489 ?auto_166490 ) ) ( AVAILABLE ?auto_166491 ) ( IN ?auto_166490 ?auto_166493 ) ( ON ?auto_166489 ?auto_166488 ) ( not ( = ?auto_166488 ?auto_166489 ) ) ( not ( = ?auto_166488 ?auto_166490 ) ) ( TRUCK-AT ?auto_166493 ?auto_166492 ) ( not ( = ?auto_166492 ?auto_166494 ) ) ( ON ?auto_166488 ?auto_166487 ) ( not ( = ?auto_166487 ?auto_166488 ) ) ( not ( = ?auto_166487 ?auto_166489 ) ) ( not ( = ?auto_166487 ?auto_166490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166488 ?auto_166489 ?auto_166490 )
      ( MAKE-3CRATE-VERIFY ?auto_166487 ?auto_166488 ?auto_166489 ?auto_166490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166511 - SURFACE
      ?auto_166512 - SURFACE
      ?auto_166513 - SURFACE
      ?auto_166514 - SURFACE
    )
    :vars
    (
      ?auto_166518 - HOIST
      ?auto_166519 - PLACE
      ?auto_166515 - TRUCK
      ?auto_166516 - PLACE
      ?auto_166517 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166518 ?auto_166519 ) ( SURFACE-AT ?auto_166513 ?auto_166519 ) ( CLEAR ?auto_166513 ) ( IS-CRATE ?auto_166514 ) ( not ( = ?auto_166513 ?auto_166514 ) ) ( AVAILABLE ?auto_166518 ) ( ON ?auto_166513 ?auto_166512 ) ( not ( = ?auto_166512 ?auto_166513 ) ) ( not ( = ?auto_166512 ?auto_166514 ) ) ( TRUCK-AT ?auto_166515 ?auto_166516 ) ( not ( = ?auto_166516 ?auto_166519 ) ) ( HOIST-AT ?auto_166517 ?auto_166516 ) ( LIFTING ?auto_166517 ?auto_166514 ) ( not ( = ?auto_166518 ?auto_166517 ) ) ( ON ?auto_166512 ?auto_166511 ) ( not ( = ?auto_166511 ?auto_166512 ) ) ( not ( = ?auto_166511 ?auto_166513 ) ) ( not ( = ?auto_166511 ?auto_166514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166512 ?auto_166513 ?auto_166514 )
      ( MAKE-3CRATE-VERIFY ?auto_166511 ?auto_166512 ?auto_166513 ?auto_166514 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166538 - SURFACE
      ?auto_166539 - SURFACE
      ?auto_166540 - SURFACE
      ?auto_166541 - SURFACE
    )
    :vars
    (
      ?auto_166545 - HOIST
      ?auto_166543 - PLACE
      ?auto_166547 - TRUCK
      ?auto_166542 - PLACE
      ?auto_166546 - HOIST
      ?auto_166544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166545 ?auto_166543 ) ( SURFACE-AT ?auto_166540 ?auto_166543 ) ( CLEAR ?auto_166540 ) ( IS-CRATE ?auto_166541 ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( AVAILABLE ?auto_166545 ) ( ON ?auto_166540 ?auto_166539 ) ( not ( = ?auto_166539 ?auto_166540 ) ) ( not ( = ?auto_166539 ?auto_166541 ) ) ( TRUCK-AT ?auto_166547 ?auto_166542 ) ( not ( = ?auto_166542 ?auto_166543 ) ) ( HOIST-AT ?auto_166546 ?auto_166542 ) ( not ( = ?auto_166545 ?auto_166546 ) ) ( AVAILABLE ?auto_166546 ) ( SURFACE-AT ?auto_166541 ?auto_166542 ) ( ON ?auto_166541 ?auto_166544 ) ( CLEAR ?auto_166541 ) ( not ( = ?auto_166540 ?auto_166544 ) ) ( not ( = ?auto_166541 ?auto_166544 ) ) ( not ( = ?auto_166539 ?auto_166544 ) ) ( ON ?auto_166539 ?auto_166538 ) ( not ( = ?auto_166538 ?auto_166539 ) ) ( not ( = ?auto_166538 ?auto_166540 ) ) ( not ( = ?auto_166538 ?auto_166541 ) ) ( not ( = ?auto_166538 ?auto_166544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166539 ?auto_166540 ?auto_166541 )
      ( MAKE-3CRATE-VERIFY ?auto_166538 ?auto_166539 ?auto_166540 ?auto_166541 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166566 - SURFACE
      ?auto_166567 - SURFACE
      ?auto_166568 - SURFACE
      ?auto_166569 - SURFACE
    )
    :vars
    (
      ?auto_166573 - HOIST
      ?auto_166575 - PLACE
      ?auto_166571 - PLACE
      ?auto_166572 - HOIST
      ?auto_166570 - SURFACE
      ?auto_166574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166573 ?auto_166575 ) ( SURFACE-AT ?auto_166568 ?auto_166575 ) ( CLEAR ?auto_166568 ) ( IS-CRATE ?auto_166569 ) ( not ( = ?auto_166568 ?auto_166569 ) ) ( AVAILABLE ?auto_166573 ) ( ON ?auto_166568 ?auto_166567 ) ( not ( = ?auto_166567 ?auto_166568 ) ) ( not ( = ?auto_166567 ?auto_166569 ) ) ( not ( = ?auto_166571 ?auto_166575 ) ) ( HOIST-AT ?auto_166572 ?auto_166571 ) ( not ( = ?auto_166573 ?auto_166572 ) ) ( AVAILABLE ?auto_166572 ) ( SURFACE-AT ?auto_166569 ?auto_166571 ) ( ON ?auto_166569 ?auto_166570 ) ( CLEAR ?auto_166569 ) ( not ( = ?auto_166568 ?auto_166570 ) ) ( not ( = ?auto_166569 ?auto_166570 ) ) ( not ( = ?auto_166567 ?auto_166570 ) ) ( TRUCK-AT ?auto_166574 ?auto_166575 ) ( ON ?auto_166567 ?auto_166566 ) ( not ( = ?auto_166566 ?auto_166567 ) ) ( not ( = ?auto_166566 ?auto_166568 ) ) ( not ( = ?auto_166566 ?auto_166569 ) ) ( not ( = ?auto_166566 ?auto_166570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166567 ?auto_166568 ?auto_166569 )
      ( MAKE-3CRATE-VERIFY ?auto_166566 ?auto_166567 ?auto_166568 ?auto_166569 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166594 - SURFACE
      ?auto_166595 - SURFACE
      ?auto_166596 - SURFACE
      ?auto_166597 - SURFACE
    )
    :vars
    (
      ?auto_166600 - HOIST
      ?auto_166601 - PLACE
      ?auto_166603 - PLACE
      ?auto_166602 - HOIST
      ?auto_166599 - SURFACE
      ?auto_166598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166600 ?auto_166601 ) ( IS-CRATE ?auto_166597 ) ( not ( = ?auto_166596 ?auto_166597 ) ) ( not ( = ?auto_166595 ?auto_166596 ) ) ( not ( = ?auto_166595 ?auto_166597 ) ) ( not ( = ?auto_166603 ?auto_166601 ) ) ( HOIST-AT ?auto_166602 ?auto_166603 ) ( not ( = ?auto_166600 ?auto_166602 ) ) ( AVAILABLE ?auto_166602 ) ( SURFACE-AT ?auto_166597 ?auto_166603 ) ( ON ?auto_166597 ?auto_166599 ) ( CLEAR ?auto_166597 ) ( not ( = ?auto_166596 ?auto_166599 ) ) ( not ( = ?auto_166597 ?auto_166599 ) ) ( not ( = ?auto_166595 ?auto_166599 ) ) ( TRUCK-AT ?auto_166598 ?auto_166601 ) ( SURFACE-AT ?auto_166595 ?auto_166601 ) ( CLEAR ?auto_166595 ) ( LIFTING ?auto_166600 ?auto_166596 ) ( IS-CRATE ?auto_166596 ) ( ON ?auto_166595 ?auto_166594 ) ( not ( = ?auto_166594 ?auto_166595 ) ) ( not ( = ?auto_166594 ?auto_166596 ) ) ( not ( = ?auto_166594 ?auto_166597 ) ) ( not ( = ?auto_166594 ?auto_166599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166595 ?auto_166596 ?auto_166597 )
      ( MAKE-3CRATE-VERIFY ?auto_166594 ?auto_166595 ?auto_166596 ?auto_166597 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166622 - SURFACE
      ?auto_166623 - SURFACE
      ?auto_166624 - SURFACE
      ?auto_166625 - SURFACE
    )
    :vars
    (
      ?auto_166630 - HOIST
      ?auto_166628 - PLACE
      ?auto_166626 - PLACE
      ?auto_166629 - HOIST
      ?auto_166631 - SURFACE
      ?auto_166627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166630 ?auto_166628 ) ( IS-CRATE ?auto_166625 ) ( not ( = ?auto_166624 ?auto_166625 ) ) ( not ( = ?auto_166623 ?auto_166624 ) ) ( not ( = ?auto_166623 ?auto_166625 ) ) ( not ( = ?auto_166626 ?auto_166628 ) ) ( HOIST-AT ?auto_166629 ?auto_166626 ) ( not ( = ?auto_166630 ?auto_166629 ) ) ( AVAILABLE ?auto_166629 ) ( SURFACE-AT ?auto_166625 ?auto_166626 ) ( ON ?auto_166625 ?auto_166631 ) ( CLEAR ?auto_166625 ) ( not ( = ?auto_166624 ?auto_166631 ) ) ( not ( = ?auto_166625 ?auto_166631 ) ) ( not ( = ?auto_166623 ?auto_166631 ) ) ( TRUCK-AT ?auto_166627 ?auto_166628 ) ( SURFACE-AT ?auto_166623 ?auto_166628 ) ( CLEAR ?auto_166623 ) ( IS-CRATE ?auto_166624 ) ( AVAILABLE ?auto_166630 ) ( IN ?auto_166624 ?auto_166627 ) ( ON ?auto_166623 ?auto_166622 ) ( not ( = ?auto_166622 ?auto_166623 ) ) ( not ( = ?auto_166622 ?auto_166624 ) ) ( not ( = ?auto_166622 ?auto_166625 ) ) ( not ( = ?auto_166622 ?auto_166631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166623 ?auto_166624 ?auto_166625 )
      ( MAKE-3CRATE-VERIFY ?auto_166622 ?auto_166623 ?auto_166624 ?auto_166625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166807 - SURFACE
      ?auto_166808 - SURFACE
    )
    :vars
    (
      ?auto_166811 - HOIST
      ?auto_166814 - PLACE
      ?auto_166809 - SURFACE
      ?auto_166815 - TRUCK
      ?auto_166810 - PLACE
      ?auto_166813 - HOIST
      ?auto_166812 - SURFACE
      ?auto_166816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166811 ?auto_166814 ) ( SURFACE-AT ?auto_166807 ?auto_166814 ) ( CLEAR ?auto_166807 ) ( IS-CRATE ?auto_166808 ) ( not ( = ?auto_166807 ?auto_166808 ) ) ( AVAILABLE ?auto_166811 ) ( ON ?auto_166807 ?auto_166809 ) ( not ( = ?auto_166809 ?auto_166807 ) ) ( not ( = ?auto_166809 ?auto_166808 ) ) ( TRUCK-AT ?auto_166815 ?auto_166810 ) ( not ( = ?auto_166810 ?auto_166814 ) ) ( HOIST-AT ?auto_166813 ?auto_166810 ) ( not ( = ?auto_166811 ?auto_166813 ) ) ( SURFACE-AT ?auto_166808 ?auto_166810 ) ( ON ?auto_166808 ?auto_166812 ) ( CLEAR ?auto_166808 ) ( not ( = ?auto_166807 ?auto_166812 ) ) ( not ( = ?auto_166808 ?auto_166812 ) ) ( not ( = ?auto_166809 ?auto_166812 ) ) ( LIFTING ?auto_166813 ?auto_166816 ) ( IS-CRATE ?auto_166816 ) ( not ( = ?auto_166807 ?auto_166816 ) ) ( not ( = ?auto_166808 ?auto_166816 ) ) ( not ( = ?auto_166809 ?auto_166816 ) ) ( not ( = ?auto_166812 ?auto_166816 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166813 ?auto_166816 ?auto_166815 ?auto_166810 )
      ( MAKE-1CRATE ?auto_166807 ?auto_166808 )
      ( MAKE-1CRATE-VERIFY ?auto_166807 ?auto_166808 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_166915 - SURFACE
      ?auto_166916 - SURFACE
      ?auto_166917 - SURFACE
      ?auto_166919 - SURFACE
      ?auto_166918 - SURFACE
    )
    :vars
    (
      ?auto_166921 - HOIST
      ?auto_166920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166921 ?auto_166920 ) ( SURFACE-AT ?auto_166919 ?auto_166920 ) ( CLEAR ?auto_166919 ) ( LIFTING ?auto_166921 ?auto_166918 ) ( IS-CRATE ?auto_166918 ) ( not ( = ?auto_166919 ?auto_166918 ) ) ( ON ?auto_166916 ?auto_166915 ) ( ON ?auto_166917 ?auto_166916 ) ( ON ?auto_166919 ?auto_166917 ) ( not ( = ?auto_166915 ?auto_166916 ) ) ( not ( = ?auto_166915 ?auto_166917 ) ) ( not ( = ?auto_166915 ?auto_166919 ) ) ( not ( = ?auto_166915 ?auto_166918 ) ) ( not ( = ?auto_166916 ?auto_166917 ) ) ( not ( = ?auto_166916 ?auto_166919 ) ) ( not ( = ?auto_166916 ?auto_166918 ) ) ( not ( = ?auto_166917 ?auto_166919 ) ) ( not ( = ?auto_166917 ?auto_166918 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166919 ?auto_166918 )
      ( MAKE-4CRATE-VERIFY ?auto_166915 ?auto_166916 ?auto_166917 ?auto_166919 ?auto_166918 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_166940 - SURFACE
      ?auto_166941 - SURFACE
      ?auto_166942 - SURFACE
      ?auto_166944 - SURFACE
      ?auto_166943 - SURFACE
    )
    :vars
    (
      ?auto_166945 - HOIST
      ?auto_166947 - PLACE
      ?auto_166946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166945 ?auto_166947 ) ( SURFACE-AT ?auto_166944 ?auto_166947 ) ( CLEAR ?auto_166944 ) ( IS-CRATE ?auto_166943 ) ( not ( = ?auto_166944 ?auto_166943 ) ) ( TRUCK-AT ?auto_166946 ?auto_166947 ) ( AVAILABLE ?auto_166945 ) ( IN ?auto_166943 ?auto_166946 ) ( ON ?auto_166944 ?auto_166942 ) ( not ( = ?auto_166942 ?auto_166944 ) ) ( not ( = ?auto_166942 ?auto_166943 ) ) ( ON ?auto_166941 ?auto_166940 ) ( ON ?auto_166942 ?auto_166941 ) ( not ( = ?auto_166940 ?auto_166941 ) ) ( not ( = ?auto_166940 ?auto_166942 ) ) ( not ( = ?auto_166940 ?auto_166944 ) ) ( not ( = ?auto_166940 ?auto_166943 ) ) ( not ( = ?auto_166941 ?auto_166942 ) ) ( not ( = ?auto_166941 ?auto_166944 ) ) ( not ( = ?auto_166941 ?auto_166943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166942 ?auto_166944 ?auto_166943 )
      ( MAKE-4CRATE-VERIFY ?auto_166940 ?auto_166941 ?auto_166942 ?auto_166944 ?auto_166943 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_166970 - SURFACE
      ?auto_166971 - SURFACE
      ?auto_166972 - SURFACE
      ?auto_166974 - SURFACE
      ?auto_166973 - SURFACE
    )
    :vars
    (
      ?auto_166977 - HOIST
      ?auto_166975 - PLACE
      ?auto_166976 - TRUCK
      ?auto_166978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166977 ?auto_166975 ) ( SURFACE-AT ?auto_166974 ?auto_166975 ) ( CLEAR ?auto_166974 ) ( IS-CRATE ?auto_166973 ) ( not ( = ?auto_166974 ?auto_166973 ) ) ( AVAILABLE ?auto_166977 ) ( IN ?auto_166973 ?auto_166976 ) ( ON ?auto_166974 ?auto_166972 ) ( not ( = ?auto_166972 ?auto_166974 ) ) ( not ( = ?auto_166972 ?auto_166973 ) ) ( TRUCK-AT ?auto_166976 ?auto_166978 ) ( not ( = ?auto_166978 ?auto_166975 ) ) ( ON ?auto_166971 ?auto_166970 ) ( ON ?auto_166972 ?auto_166971 ) ( not ( = ?auto_166970 ?auto_166971 ) ) ( not ( = ?auto_166970 ?auto_166972 ) ) ( not ( = ?auto_166970 ?auto_166974 ) ) ( not ( = ?auto_166970 ?auto_166973 ) ) ( not ( = ?auto_166971 ?auto_166972 ) ) ( not ( = ?auto_166971 ?auto_166974 ) ) ( not ( = ?auto_166971 ?auto_166973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166972 ?auto_166974 ?auto_166973 )
      ( MAKE-4CRATE-VERIFY ?auto_166970 ?auto_166971 ?auto_166972 ?auto_166974 ?auto_166973 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167004 - SURFACE
      ?auto_167005 - SURFACE
      ?auto_167006 - SURFACE
      ?auto_167008 - SURFACE
      ?auto_167007 - SURFACE
    )
    :vars
    (
      ?auto_167013 - HOIST
      ?auto_167010 - PLACE
      ?auto_167009 - TRUCK
      ?auto_167012 - PLACE
      ?auto_167011 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_167013 ?auto_167010 ) ( SURFACE-AT ?auto_167008 ?auto_167010 ) ( CLEAR ?auto_167008 ) ( IS-CRATE ?auto_167007 ) ( not ( = ?auto_167008 ?auto_167007 ) ) ( AVAILABLE ?auto_167013 ) ( ON ?auto_167008 ?auto_167006 ) ( not ( = ?auto_167006 ?auto_167008 ) ) ( not ( = ?auto_167006 ?auto_167007 ) ) ( TRUCK-AT ?auto_167009 ?auto_167012 ) ( not ( = ?auto_167012 ?auto_167010 ) ) ( HOIST-AT ?auto_167011 ?auto_167012 ) ( LIFTING ?auto_167011 ?auto_167007 ) ( not ( = ?auto_167013 ?auto_167011 ) ) ( ON ?auto_167005 ?auto_167004 ) ( ON ?auto_167006 ?auto_167005 ) ( not ( = ?auto_167004 ?auto_167005 ) ) ( not ( = ?auto_167004 ?auto_167006 ) ) ( not ( = ?auto_167004 ?auto_167008 ) ) ( not ( = ?auto_167004 ?auto_167007 ) ) ( not ( = ?auto_167005 ?auto_167006 ) ) ( not ( = ?auto_167005 ?auto_167008 ) ) ( not ( = ?auto_167005 ?auto_167007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167006 ?auto_167008 ?auto_167007 )
      ( MAKE-4CRATE-VERIFY ?auto_167004 ?auto_167005 ?auto_167006 ?auto_167008 ?auto_167007 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167042 - SURFACE
      ?auto_167043 - SURFACE
      ?auto_167044 - SURFACE
      ?auto_167046 - SURFACE
      ?auto_167045 - SURFACE
    )
    :vars
    (
      ?auto_167048 - HOIST
      ?auto_167050 - PLACE
      ?auto_167051 - TRUCK
      ?auto_167049 - PLACE
      ?auto_167047 - HOIST
      ?auto_167052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167048 ?auto_167050 ) ( SURFACE-AT ?auto_167046 ?auto_167050 ) ( CLEAR ?auto_167046 ) ( IS-CRATE ?auto_167045 ) ( not ( = ?auto_167046 ?auto_167045 ) ) ( AVAILABLE ?auto_167048 ) ( ON ?auto_167046 ?auto_167044 ) ( not ( = ?auto_167044 ?auto_167046 ) ) ( not ( = ?auto_167044 ?auto_167045 ) ) ( TRUCK-AT ?auto_167051 ?auto_167049 ) ( not ( = ?auto_167049 ?auto_167050 ) ) ( HOIST-AT ?auto_167047 ?auto_167049 ) ( not ( = ?auto_167048 ?auto_167047 ) ) ( AVAILABLE ?auto_167047 ) ( SURFACE-AT ?auto_167045 ?auto_167049 ) ( ON ?auto_167045 ?auto_167052 ) ( CLEAR ?auto_167045 ) ( not ( = ?auto_167046 ?auto_167052 ) ) ( not ( = ?auto_167045 ?auto_167052 ) ) ( not ( = ?auto_167044 ?auto_167052 ) ) ( ON ?auto_167043 ?auto_167042 ) ( ON ?auto_167044 ?auto_167043 ) ( not ( = ?auto_167042 ?auto_167043 ) ) ( not ( = ?auto_167042 ?auto_167044 ) ) ( not ( = ?auto_167042 ?auto_167046 ) ) ( not ( = ?auto_167042 ?auto_167045 ) ) ( not ( = ?auto_167042 ?auto_167052 ) ) ( not ( = ?auto_167043 ?auto_167044 ) ) ( not ( = ?auto_167043 ?auto_167046 ) ) ( not ( = ?auto_167043 ?auto_167045 ) ) ( not ( = ?auto_167043 ?auto_167052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167044 ?auto_167046 ?auto_167045 )
      ( MAKE-4CRATE-VERIFY ?auto_167042 ?auto_167043 ?auto_167044 ?auto_167046 ?auto_167045 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167081 - SURFACE
      ?auto_167082 - SURFACE
      ?auto_167083 - SURFACE
      ?auto_167085 - SURFACE
      ?auto_167084 - SURFACE
    )
    :vars
    (
      ?auto_167088 - HOIST
      ?auto_167087 - PLACE
      ?auto_167091 - PLACE
      ?auto_167089 - HOIST
      ?auto_167090 - SURFACE
      ?auto_167086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167088 ?auto_167087 ) ( SURFACE-AT ?auto_167085 ?auto_167087 ) ( CLEAR ?auto_167085 ) ( IS-CRATE ?auto_167084 ) ( not ( = ?auto_167085 ?auto_167084 ) ) ( AVAILABLE ?auto_167088 ) ( ON ?auto_167085 ?auto_167083 ) ( not ( = ?auto_167083 ?auto_167085 ) ) ( not ( = ?auto_167083 ?auto_167084 ) ) ( not ( = ?auto_167091 ?auto_167087 ) ) ( HOIST-AT ?auto_167089 ?auto_167091 ) ( not ( = ?auto_167088 ?auto_167089 ) ) ( AVAILABLE ?auto_167089 ) ( SURFACE-AT ?auto_167084 ?auto_167091 ) ( ON ?auto_167084 ?auto_167090 ) ( CLEAR ?auto_167084 ) ( not ( = ?auto_167085 ?auto_167090 ) ) ( not ( = ?auto_167084 ?auto_167090 ) ) ( not ( = ?auto_167083 ?auto_167090 ) ) ( TRUCK-AT ?auto_167086 ?auto_167087 ) ( ON ?auto_167082 ?auto_167081 ) ( ON ?auto_167083 ?auto_167082 ) ( not ( = ?auto_167081 ?auto_167082 ) ) ( not ( = ?auto_167081 ?auto_167083 ) ) ( not ( = ?auto_167081 ?auto_167085 ) ) ( not ( = ?auto_167081 ?auto_167084 ) ) ( not ( = ?auto_167081 ?auto_167090 ) ) ( not ( = ?auto_167082 ?auto_167083 ) ) ( not ( = ?auto_167082 ?auto_167085 ) ) ( not ( = ?auto_167082 ?auto_167084 ) ) ( not ( = ?auto_167082 ?auto_167090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167083 ?auto_167085 ?auto_167084 )
      ( MAKE-4CRATE-VERIFY ?auto_167081 ?auto_167082 ?auto_167083 ?auto_167085 ?auto_167084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167120 - SURFACE
      ?auto_167121 - SURFACE
      ?auto_167122 - SURFACE
      ?auto_167124 - SURFACE
      ?auto_167123 - SURFACE
    )
    :vars
    (
      ?auto_167126 - HOIST
      ?auto_167125 - PLACE
      ?auto_167128 - PLACE
      ?auto_167129 - HOIST
      ?auto_167130 - SURFACE
      ?auto_167127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167126 ?auto_167125 ) ( IS-CRATE ?auto_167123 ) ( not ( = ?auto_167124 ?auto_167123 ) ) ( not ( = ?auto_167122 ?auto_167124 ) ) ( not ( = ?auto_167122 ?auto_167123 ) ) ( not ( = ?auto_167128 ?auto_167125 ) ) ( HOIST-AT ?auto_167129 ?auto_167128 ) ( not ( = ?auto_167126 ?auto_167129 ) ) ( AVAILABLE ?auto_167129 ) ( SURFACE-AT ?auto_167123 ?auto_167128 ) ( ON ?auto_167123 ?auto_167130 ) ( CLEAR ?auto_167123 ) ( not ( = ?auto_167124 ?auto_167130 ) ) ( not ( = ?auto_167123 ?auto_167130 ) ) ( not ( = ?auto_167122 ?auto_167130 ) ) ( TRUCK-AT ?auto_167127 ?auto_167125 ) ( SURFACE-AT ?auto_167122 ?auto_167125 ) ( CLEAR ?auto_167122 ) ( LIFTING ?auto_167126 ?auto_167124 ) ( IS-CRATE ?auto_167124 ) ( ON ?auto_167121 ?auto_167120 ) ( ON ?auto_167122 ?auto_167121 ) ( not ( = ?auto_167120 ?auto_167121 ) ) ( not ( = ?auto_167120 ?auto_167122 ) ) ( not ( = ?auto_167120 ?auto_167124 ) ) ( not ( = ?auto_167120 ?auto_167123 ) ) ( not ( = ?auto_167120 ?auto_167130 ) ) ( not ( = ?auto_167121 ?auto_167122 ) ) ( not ( = ?auto_167121 ?auto_167124 ) ) ( not ( = ?auto_167121 ?auto_167123 ) ) ( not ( = ?auto_167121 ?auto_167130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167122 ?auto_167124 ?auto_167123 )
      ( MAKE-4CRATE-VERIFY ?auto_167120 ?auto_167121 ?auto_167122 ?auto_167124 ?auto_167123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167159 - SURFACE
      ?auto_167160 - SURFACE
      ?auto_167161 - SURFACE
      ?auto_167163 - SURFACE
      ?auto_167162 - SURFACE
    )
    :vars
    (
      ?auto_167166 - HOIST
      ?auto_167167 - PLACE
      ?auto_167165 - PLACE
      ?auto_167168 - HOIST
      ?auto_167164 - SURFACE
      ?auto_167169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167166 ?auto_167167 ) ( IS-CRATE ?auto_167162 ) ( not ( = ?auto_167163 ?auto_167162 ) ) ( not ( = ?auto_167161 ?auto_167163 ) ) ( not ( = ?auto_167161 ?auto_167162 ) ) ( not ( = ?auto_167165 ?auto_167167 ) ) ( HOIST-AT ?auto_167168 ?auto_167165 ) ( not ( = ?auto_167166 ?auto_167168 ) ) ( AVAILABLE ?auto_167168 ) ( SURFACE-AT ?auto_167162 ?auto_167165 ) ( ON ?auto_167162 ?auto_167164 ) ( CLEAR ?auto_167162 ) ( not ( = ?auto_167163 ?auto_167164 ) ) ( not ( = ?auto_167162 ?auto_167164 ) ) ( not ( = ?auto_167161 ?auto_167164 ) ) ( TRUCK-AT ?auto_167169 ?auto_167167 ) ( SURFACE-AT ?auto_167161 ?auto_167167 ) ( CLEAR ?auto_167161 ) ( IS-CRATE ?auto_167163 ) ( AVAILABLE ?auto_167166 ) ( IN ?auto_167163 ?auto_167169 ) ( ON ?auto_167160 ?auto_167159 ) ( ON ?auto_167161 ?auto_167160 ) ( not ( = ?auto_167159 ?auto_167160 ) ) ( not ( = ?auto_167159 ?auto_167161 ) ) ( not ( = ?auto_167159 ?auto_167163 ) ) ( not ( = ?auto_167159 ?auto_167162 ) ) ( not ( = ?auto_167159 ?auto_167164 ) ) ( not ( = ?auto_167160 ?auto_167161 ) ) ( not ( = ?auto_167160 ?auto_167163 ) ) ( not ( = ?auto_167160 ?auto_167162 ) ) ( not ( = ?auto_167160 ?auto_167164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167161 ?auto_167163 ?auto_167162 )
      ( MAKE-4CRATE-VERIFY ?auto_167159 ?auto_167160 ?auto_167161 ?auto_167163 ?auto_167162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167170 - SURFACE
      ?auto_167171 - SURFACE
    )
    :vars
    (
      ?auto_167175 - HOIST
      ?auto_167176 - PLACE
      ?auto_167173 - SURFACE
      ?auto_167174 - PLACE
      ?auto_167177 - HOIST
      ?auto_167172 - SURFACE
      ?auto_167178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167175 ?auto_167176 ) ( IS-CRATE ?auto_167171 ) ( not ( = ?auto_167170 ?auto_167171 ) ) ( not ( = ?auto_167173 ?auto_167170 ) ) ( not ( = ?auto_167173 ?auto_167171 ) ) ( not ( = ?auto_167174 ?auto_167176 ) ) ( HOIST-AT ?auto_167177 ?auto_167174 ) ( not ( = ?auto_167175 ?auto_167177 ) ) ( AVAILABLE ?auto_167177 ) ( SURFACE-AT ?auto_167171 ?auto_167174 ) ( ON ?auto_167171 ?auto_167172 ) ( CLEAR ?auto_167171 ) ( not ( = ?auto_167170 ?auto_167172 ) ) ( not ( = ?auto_167171 ?auto_167172 ) ) ( not ( = ?auto_167173 ?auto_167172 ) ) ( SURFACE-AT ?auto_167173 ?auto_167176 ) ( CLEAR ?auto_167173 ) ( IS-CRATE ?auto_167170 ) ( AVAILABLE ?auto_167175 ) ( IN ?auto_167170 ?auto_167178 ) ( TRUCK-AT ?auto_167178 ?auto_167174 ) )
    :subtasks
    ( ( !DRIVE ?auto_167178 ?auto_167174 ?auto_167176 )
      ( MAKE-2CRATE ?auto_167173 ?auto_167170 ?auto_167171 )
      ( MAKE-1CRATE-VERIFY ?auto_167170 ?auto_167171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167179 - SURFACE
      ?auto_167180 - SURFACE
      ?auto_167181 - SURFACE
    )
    :vars
    (
      ?auto_167186 - HOIST
      ?auto_167187 - PLACE
      ?auto_167183 - PLACE
      ?auto_167182 - HOIST
      ?auto_167185 - SURFACE
      ?auto_167184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167186 ?auto_167187 ) ( IS-CRATE ?auto_167181 ) ( not ( = ?auto_167180 ?auto_167181 ) ) ( not ( = ?auto_167179 ?auto_167180 ) ) ( not ( = ?auto_167179 ?auto_167181 ) ) ( not ( = ?auto_167183 ?auto_167187 ) ) ( HOIST-AT ?auto_167182 ?auto_167183 ) ( not ( = ?auto_167186 ?auto_167182 ) ) ( AVAILABLE ?auto_167182 ) ( SURFACE-AT ?auto_167181 ?auto_167183 ) ( ON ?auto_167181 ?auto_167185 ) ( CLEAR ?auto_167181 ) ( not ( = ?auto_167180 ?auto_167185 ) ) ( not ( = ?auto_167181 ?auto_167185 ) ) ( not ( = ?auto_167179 ?auto_167185 ) ) ( SURFACE-AT ?auto_167179 ?auto_167187 ) ( CLEAR ?auto_167179 ) ( IS-CRATE ?auto_167180 ) ( AVAILABLE ?auto_167186 ) ( IN ?auto_167180 ?auto_167184 ) ( TRUCK-AT ?auto_167184 ?auto_167183 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167180 ?auto_167181 )
      ( MAKE-2CRATE-VERIFY ?auto_167179 ?auto_167180 ?auto_167181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_167188 - SURFACE
      ?auto_167189 - SURFACE
      ?auto_167190 - SURFACE
      ?auto_167191 - SURFACE
    )
    :vars
    (
      ?auto_167196 - HOIST
      ?auto_167194 - PLACE
      ?auto_167197 - PLACE
      ?auto_167195 - HOIST
      ?auto_167193 - SURFACE
      ?auto_167192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167196 ?auto_167194 ) ( IS-CRATE ?auto_167191 ) ( not ( = ?auto_167190 ?auto_167191 ) ) ( not ( = ?auto_167189 ?auto_167190 ) ) ( not ( = ?auto_167189 ?auto_167191 ) ) ( not ( = ?auto_167197 ?auto_167194 ) ) ( HOIST-AT ?auto_167195 ?auto_167197 ) ( not ( = ?auto_167196 ?auto_167195 ) ) ( AVAILABLE ?auto_167195 ) ( SURFACE-AT ?auto_167191 ?auto_167197 ) ( ON ?auto_167191 ?auto_167193 ) ( CLEAR ?auto_167191 ) ( not ( = ?auto_167190 ?auto_167193 ) ) ( not ( = ?auto_167191 ?auto_167193 ) ) ( not ( = ?auto_167189 ?auto_167193 ) ) ( SURFACE-AT ?auto_167189 ?auto_167194 ) ( CLEAR ?auto_167189 ) ( IS-CRATE ?auto_167190 ) ( AVAILABLE ?auto_167196 ) ( IN ?auto_167190 ?auto_167192 ) ( TRUCK-AT ?auto_167192 ?auto_167197 ) ( ON ?auto_167189 ?auto_167188 ) ( not ( = ?auto_167188 ?auto_167189 ) ) ( not ( = ?auto_167188 ?auto_167190 ) ) ( not ( = ?auto_167188 ?auto_167191 ) ) ( not ( = ?auto_167188 ?auto_167193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167189 ?auto_167190 ?auto_167191 )
      ( MAKE-3CRATE-VERIFY ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167198 - SURFACE
      ?auto_167199 - SURFACE
      ?auto_167200 - SURFACE
      ?auto_167202 - SURFACE
      ?auto_167201 - SURFACE
    )
    :vars
    (
      ?auto_167207 - HOIST
      ?auto_167205 - PLACE
      ?auto_167208 - PLACE
      ?auto_167206 - HOIST
      ?auto_167204 - SURFACE
      ?auto_167203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167207 ?auto_167205 ) ( IS-CRATE ?auto_167201 ) ( not ( = ?auto_167202 ?auto_167201 ) ) ( not ( = ?auto_167200 ?auto_167202 ) ) ( not ( = ?auto_167200 ?auto_167201 ) ) ( not ( = ?auto_167208 ?auto_167205 ) ) ( HOIST-AT ?auto_167206 ?auto_167208 ) ( not ( = ?auto_167207 ?auto_167206 ) ) ( AVAILABLE ?auto_167206 ) ( SURFACE-AT ?auto_167201 ?auto_167208 ) ( ON ?auto_167201 ?auto_167204 ) ( CLEAR ?auto_167201 ) ( not ( = ?auto_167202 ?auto_167204 ) ) ( not ( = ?auto_167201 ?auto_167204 ) ) ( not ( = ?auto_167200 ?auto_167204 ) ) ( SURFACE-AT ?auto_167200 ?auto_167205 ) ( CLEAR ?auto_167200 ) ( IS-CRATE ?auto_167202 ) ( AVAILABLE ?auto_167207 ) ( IN ?auto_167202 ?auto_167203 ) ( TRUCK-AT ?auto_167203 ?auto_167208 ) ( ON ?auto_167199 ?auto_167198 ) ( ON ?auto_167200 ?auto_167199 ) ( not ( = ?auto_167198 ?auto_167199 ) ) ( not ( = ?auto_167198 ?auto_167200 ) ) ( not ( = ?auto_167198 ?auto_167202 ) ) ( not ( = ?auto_167198 ?auto_167201 ) ) ( not ( = ?auto_167198 ?auto_167204 ) ) ( not ( = ?auto_167199 ?auto_167200 ) ) ( not ( = ?auto_167199 ?auto_167202 ) ) ( not ( = ?auto_167199 ?auto_167201 ) ) ( not ( = ?auto_167199 ?auto_167204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167200 ?auto_167202 ?auto_167201 )
      ( MAKE-4CRATE-VERIFY ?auto_167198 ?auto_167199 ?auto_167200 ?auto_167202 ?auto_167201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167209 - SURFACE
      ?auto_167210 - SURFACE
    )
    :vars
    (
      ?auto_167216 - HOIST
      ?auto_167214 - PLACE
      ?auto_167213 - SURFACE
      ?auto_167217 - PLACE
      ?auto_167215 - HOIST
      ?auto_167212 - SURFACE
      ?auto_167211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167216 ?auto_167214 ) ( IS-CRATE ?auto_167210 ) ( not ( = ?auto_167209 ?auto_167210 ) ) ( not ( = ?auto_167213 ?auto_167209 ) ) ( not ( = ?auto_167213 ?auto_167210 ) ) ( not ( = ?auto_167217 ?auto_167214 ) ) ( HOIST-AT ?auto_167215 ?auto_167217 ) ( not ( = ?auto_167216 ?auto_167215 ) ) ( SURFACE-AT ?auto_167210 ?auto_167217 ) ( ON ?auto_167210 ?auto_167212 ) ( CLEAR ?auto_167210 ) ( not ( = ?auto_167209 ?auto_167212 ) ) ( not ( = ?auto_167210 ?auto_167212 ) ) ( not ( = ?auto_167213 ?auto_167212 ) ) ( SURFACE-AT ?auto_167213 ?auto_167214 ) ( CLEAR ?auto_167213 ) ( IS-CRATE ?auto_167209 ) ( AVAILABLE ?auto_167216 ) ( TRUCK-AT ?auto_167211 ?auto_167217 ) ( LIFTING ?auto_167215 ?auto_167209 ) )
    :subtasks
    ( ( !LOAD ?auto_167215 ?auto_167209 ?auto_167211 ?auto_167217 )
      ( MAKE-2CRATE ?auto_167213 ?auto_167209 ?auto_167210 )
      ( MAKE-1CRATE-VERIFY ?auto_167209 ?auto_167210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167218 - SURFACE
      ?auto_167219 - SURFACE
      ?auto_167220 - SURFACE
    )
    :vars
    (
      ?auto_167222 - HOIST
      ?auto_167225 - PLACE
      ?auto_167224 - PLACE
      ?auto_167223 - HOIST
      ?auto_167221 - SURFACE
      ?auto_167226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167222 ?auto_167225 ) ( IS-CRATE ?auto_167220 ) ( not ( = ?auto_167219 ?auto_167220 ) ) ( not ( = ?auto_167218 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167220 ) ) ( not ( = ?auto_167224 ?auto_167225 ) ) ( HOIST-AT ?auto_167223 ?auto_167224 ) ( not ( = ?auto_167222 ?auto_167223 ) ) ( SURFACE-AT ?auto_167220 ?auto_167224 ) ( ON ?auto_167220 ?auto_167221 ) ( CLEAR ?auto_167220 ) ( not ( = ?auto_167219 ?auto_167221 ) ) ( not ( = ?auto_167220 ?auto_167221 ) ) ( not ( = ?auto_167218 ?auto_167221 ) ) ( SURFACE-AT ?auto_167218 ?auto_167225 ) ( CLEAR ?auto_167218 ) ( IS-CRATE ?auto_167219 ) ( AVAILABLE ?auto_167222 ) ( TRUCK-AT ?auto_167226 ?auto_167224 ) ( LIFTING ?auto_167223 ?auto_167219 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167219 ?auto_167220 )
      ( MAKE-2CRATE-VERIFY ?auto_167218 ?auto_167219 ?auto_167220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_167227 - SURFACE
      ?auto_167228 - SURFACE
      ?auto_167229 - SURFACE
      ?auto_167230 - SURFACE
    )
    :vars
    (
      ?auto_167232 - HOIST
      ?auto_167234 - PLACE
      ?auto_167236 - PLACE
      ?auto_167235 - HOIST
      ?auto_167233 - SURFACE
      ?auto_167231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167232 ?auto_167234 ) ( IS-CRATE ?auto_167230 ) ( not ( = ?auto_167229 ?auto_167230 ) ) ( not ( = ?auto_167228 ?auto_167229 ) ) ( not ( = ?auto_167228 ?auto_167230 ) ) ( not ( = ?auto_167236 ?auto_167234 ) ) ( HOIST-AT ?auto_167235 ?auto_167236 ) ( not ( = ?auto_167232 ?auto_167235 ) ) ( SURFACE-AT ?auto_167230 ?auto_167236 ) ( ON ?auto_167230 ?auto_167233 ) ( CLEAR ?auto_167230 ) ( not ( = ?auto_167229 ?auto_167233 ) ) ( not ( = ?auto_167230 ?auto_167233 ) ) ( not ( = ?auto_167228 ?auto_167233 ) ) ( SURFACE-AT ?auto_167228 ?auto_167234 ) ( CLEAR ?auto_167228 ) ( IS-CRATE ?auto_167229 ) ( AVAILABLE ?auto_167232 ) ( TRUCK-AT ?auto_167231 ?auto_167236 ) ( LIFTING ?auto_167235 ?auto_167229 ) ( ON ?auto_167228 ?auto_167227 ) ( not ( = ?auto_167227 ?auto_167228 ) ) ( not ( = ?auto_167227 ?auto_167229 ) ) ( not ( = ?auto_167227 ?auto_167230 ) ) ( not ( = ?auto_167227 ?auto_167233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167228 ?auto_167229 ?auto_167230 )
      ( MAKE-3CRATE-VERIFY ?auto_167227 ?auto_167228 ?auto_167229 ?auto_167230 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167237 - SURFACE
      ?auto_167238 - SURFACE
      ?auto_167239 - SURFACE
      ?auto_167241 - SURFACE
      ?auto_167240 - SURFACE
    )
    :vars
    (
      ?auto_167243 - HOIST
      ?auto_167245 - PLACE
      ?auto_167247 - PLACE
      ?auto_167246 - HOIST
      ?auto_167244 - SURFACE
      ?auto_167242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167243 ?auto_167245 ) ( IS-CRATE ?auto_167240 ) ( not ( = ?auto_167241 ?auto_167240 ) ) ( not ( = ?auto_167239 ?auto_167241 ) ) ( not ( = ?auto_167239 ?auto_167240 ) ) ( not ( = ?auto_167247 ?auto_167245 ) ) ( HOIST-AT ?auto_167246 ?auto_167247 ) ( not ( = ?auto_167243 ?auto_167246 ) ) ( SURFACE-AT ?auto_167240 ?auto_167247 ) ( ON ?auto_167240 ?auto_167244 ) ( CLEAR ?auto_167240 ) ( not ( = ?auto_167241 ?auto_167244 ) ) ( not ( = ?auto_167240 ?auto_167244 ) ) ( not ( = ?auto_167239 ?auto_167244 ) ) ( SURFACE-AT ?auto_167239 ?auto_167245 ) ( CLEAR ?auto_167239 ) ( IS-CRATE ?auto_167241 ) ( AVAILABLE ?auto_167243 ) ( TRUCK-AT ?auto_167242 ?auto_167247 ) ( LIFTING ?auto_167246 ?auto_167241 ) ( ON ?auto_167238 ?auto_167237 ) ( ON ?auto_167239 ?auto_167238 ) ( not ( = ?auto_167237 ?auto_167238 ) ) ( not ( = ?auto_167237 ?auto_167239 ) ) ( not ( = ?auto_167237 ?auto_167241 ) ) ( not ( = ?auto_167237 ?auto_167240 ) ) ( not ( = ?auto_167237 ?auto_167244 ) ) ( not ( = ?auto_167238 ?auto_167239 ) ) ( not ( = ?auto_167238 ?auto_167241 ) ) ( not ( = ?auto_167238 ?auto_167240 ) ) ( not ( = ?auto_167238 ?auto_167244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167239 ?auto_167241 ?auto_167240 )
      ( MAKE-4CRATE-VERIFY ?auto_167237 ?auto_167238 ?auto_167239 ?auto_167241 ?auto_167240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167248 - SURFACE
      ?auto_167249 - SURFACE
    )
    :vars
    (
      ?auto_167251 - HOIST
      ?auto_167253 - PLACE
      ?auto_167256 - SURFACE
      ?auto_167255 - PLACE
      ?auto_167254 - HOIST
      ?auto_167252 - SURFACE
      ?auto_167250 - TRUCK
      ?auto_167257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167251 ?auto_167253 ) ( IS-CRATE ?auto_167249 ) ( not ( = ?auto_167248 ?auto_167249 ) ) ( not ( = ?auto_167256 ?auto_167248 ) ) ( not ( = ?auto_167256 ?auto_167249 ) ) ( not ( = ?auto_167255 ?auto_167253 ) ) ( HOIST-AT ?auto_167254 ?auto_167255 ) ( not ( = ?auto_167251 ?auto_167254 ) ) ( SURFACE-AT ?auto_167249 ?auto_167255 ) ( ON ?auto_167249 ?auto_167252 ) ( CLEAR ?auto_167249 ) ( not ( = ?auto_167248 ?auto_167252 ) ) ( not ( = ?auto_167249 ?auto_167252 ) ) ( not ( = ?auto_167256 ?auto_167252 ) ) ( SURFACE-AT ?auto_167256 ?auto_167253 ) ( CLEAR ?auto_167256 ) ( IS-CRATE ?auto_167248 ) ( AVAILABLE ?auto_167251 ) ( TRUCK-AT ?auto_167250 ?auto_167255 ) ( AVAILABLE ?auto_167254 ) ( SURFACE-AT ?auto_167248 ?auto_167255 ) ( ON ?auto_167248 ?auto_167257 ) ( CLEAR ?auto_167248 ) ( not ( = ?auto_167248 ?auto_167257 ) ) ( not ( = ?auto_167249 ?auto_167257 ) ) ( not ( = ?auto_167256 ?auto_167257 ) ) ( not ( = ?auto_167252 ?auto_167257 ) ) )
    :subtasks
    ( ( !LIFT ?auto_167254 ?auto_167248 ?auto_167257 ?auto_167255 )
      ( MAKE-2CRATE ?auto_167256 ?auto_167248 ?auto_167249 )
      ( MAKE-1CRATE-VERIFY ?auto_167248 ?auto_167249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167258 - SURFACE
      ?auto_167259 - SURFACE
      ?auto_167260 - SURFACE
    )
    :vars
    (
      ?auto_167264 - HOIST
      ?auto_167266 - PLACE
      ?auto_167263 - PLACE
      ?auto_167265 - HOIST
      ?auto_167267 - SURFACE
      ?auto_167262 - TRUCK
      ?auto_167261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167264 ?auto_167266 ) ( IS-CRATE ?auto_167260 ) ( not ( = ?auto_167259 ?auto_167260 ) ) ( not ( = ?auto_167258 ?auto_167259 ) ) ( not ( = ?auto_167258 ?auto_167260 ) ) ( not ( = ?auto_167263 ?auto_167266 ) ) ( HOIST-AT ?auto_167265 ?auto_167263 ) ( not ( = ?auto_167264 ?auto_167265 ) ) ( SURFACE-AT ?auto_167260 ?auto_167263 ) ( ON ?auto_167260 ?auto_167267 ) ( CLEAR ?auto_167260 ) ( not ( = ?auto_167259 ?auto_167267 ) ) ( not ( = ?auto_167260 ?auto_167267 ) ) ( not ( = ?auto_167258 ?auto_167267 ) ) ( SURFACE-AT ?auto_167258 ?auto_167266 ) ( CLEAR ?auto_167258 ) ( IS-CRATE ?auto_167259 ) ( AVAILABLE ?auto_167264 ) ( TRUCK-AT ?auto_167262 ?auto_167263 ) ( AVAILABLE ?auto_167265 ) ( SURFACE-AT ?auto_167259 ?auto_167263 ) ( ON ?auto_167259 ?auto_167261 ) ( CLEAR ?auto_167259 ) ( not ( = ?auto_167259 ?auto_167261 ) ) ( not ( = ?auto_167260 ?auto_167261 ) ) ( not ( = ?auto_167258 ?auto_167261 ) ) ( not ( = ?auto_167267 ?auto_167261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167259 ?auto_167260 )
      ( MAKE-2CRATE-VERIFY ?auto_167258 ?auto_167259 ?auto_167260 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_167268 - SURFACE
      ?auto_167269 - SURFACE
      ?auto_167270 - SURFACE
      ?auto_167271 - SURFACE
    )
    :vars
    (
      ?auto_167277 - HOIST
      ?auto_167275 - PLACE
      ?auto_167273 - PLACE
      ?auto_167274 - HOIST
      ?auto_167278 - SURFACE
      ?auto_167272 - TRUCK
      ?auto_167276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167277 ?auto_167275 ) ( IS-CRATE ?auto_167271 ) ( not ( = ?auto_167270 ?auto_167271 ) ) ( not ( = ?auto_167269 ?auto_167270 ) ) ( not ( = ?auto_167269 ?auto_167271 ) ) ( not ( = ?auto_167273 ?auto_167275 ) ) ( HOIST-AT ?auto_167274 ?auto_167273 ) ( not ( = ?auto_167277 ?auto_167274 ) ) ( SURFACE-AT ?auto_167271 ?auto_167273 ) ( ON ?auto_167271 ?auto_167278 ) ( CLEAR ?auto_167271 ) ( not ( = ?auto_167270 ?auto_167278 ) ) ( not ( = ?auto_167271 ?auto_167278 ) ) ( not ( = ?auto_167269 ?auto_167278 ) ) ( SURFACE-AT ?auto_167269 ?auto_167275 ) ( CLEAR ?auto_167269 ) ( IS-CRATE ?auto_167270 ) ( AVAILABLE ?auto_167277 ) ( TRUCK-AT ?auto_167272 ?auto_167273 ) ( AVAILABLE ?auto_167274 ) ( SURFACE-AT ?auto_167270 ?auto_167273 ) ( ON ?auto_167270 ?auto_167276 ) ( CLEAR ?auto_167270 ) ( not ( = ?auto_167270 ?auto_167276 ) ) ( not ( = ?auto_167271 ?auto_167276 ) ) ( not ( = ?auto_167269 ?auto_167276 ) ) ( not ( = ?auto_167278 ?auto_167276 ) ) ( ON ?auto_167269 ?auto_167268 ) ( not ( = ?auto_167268 ?auto_167269 ) ) ( not ( = ?auto_167268 ?auto_167270 ) ) ( not ( = ?auto_167268 ?auto_167271 ) ) ( not ( = ?auto_167268 ?auto_167278 ) ) ( not ( = ?auto_167268 ?auto_167276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167269 ?auto_167270 ?auto_167271 )
      ( MAKE-3CRATE-VERIFY ?auto_167268 ?auto_167269 ?auto_167270 ?auto_167271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167279 - SURFACE
      ?auto_167280 - SURFACE
      ?auto_167281 - SURFACE
      ?auto_167283 - SURFACE
      ?auto_167282 - SURFACE
    )
    :vars
    (
      ?auto_167289 - HOIST
      ?auto_167287 - PLACE
      ?auto_167285 - PLACE
      ?auto_167286 - HOIST
      ?auto_167290 - SURFACE
      ?auto_167284 - TRUCK
      ?auto_167288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167289 ?auto_167287 ) ( IS-CRATE ?auto_167282 ) ( not ( = ?auto_167283 ?auto_167282 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167282 ) ) ( not ( = ?auto_167285 ?auto_167287 ) ) ( HOIST-AT ?auto_167286 ?auto_167285 ) ( not ( = ?auto_167289 ?auto_167286 ) ) ( SURFACE-AT ?auto_167282 ?auto_167285 ) ( ON ?auto_167282 ?auto_167290 ) ( CLEAR ?auto_167282 ) ( not ( = ?auto_167283 ?auto_167290 ) ) ( not ( = ?auto_167282 ?auto_167290 ) ) ( not ( = ?auto_167281 ?auto_167290 ) ) ( SURFACE-AT ?auto_167281 ?auto_167287 ) ( CLEAR ?auto_167281 ) ( IS-CRATE ?auto_167283 ) ( AVAILABLE ?auto_167289 ) ( TRUCK-AT ?auto_167284 ?auto_167285 ) ( AVAILABLE ?auto_167286 ) ( SURFACE-AT ?auto_167283 ?auto_167285 ) ( ON ?auto_167283 ?auto_167288 ) ( CLEAR ?auto_167283 ) ( not ( = ?auto_167283 ?auto_167288 ) ) ( not ( = ?auto_167282 ?auto_167288 ) ) ( not ( = ?auto_167281 ?auto_167288 ) ) ( not ( = ?auto_167290 ?auto_167288 ) ) ( ON ?auto_167280 ?auto_167279 ) ( ON ?auto_167281 ?auto_167280 ) ( not ( = ?auto_167279 ?auto_167280 ) ) ( not ( = ?auto_167279 ?auto_167281 ) ) ( not ( = ?auto_167279 ?auto_167283 ) ) ( not ( = ?auto_167279 ?auto_167282 ) ) ( not ( = ?auto_167279 ?auto_167290 ) ) ( not ( = ?auto_167279 ?auto_167288 ) ) ( not ( = ?auto_167280 ?auto_167281 ) ) ( not ( = ?auto_167280 ?auto_167283 ) ) ( not ( = ?auto_167280 ?auto_167282 ) ) ( not ( = ?auto_167280 ?auto_167290 ) ) ( not ( = ?auto_167280 ?auto_167288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167281 ?auto_167283 ?auto_167282 )
      ( MAKE-4CRATE-VERIFY ?auto_167279 ?auto_167280 ?auto_167281 ?auto_167283 ?auto_167282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167291 - SURFACE
      ?auto_167292 - SURFACE
    )
    :vars
    (
      ?auto_167299 - HOIST
      ?auto_167297 - PLACE
      ?auto_167293 - SURFACE
      ?auto_167295 - PLACE
      ?auto_167296 - HOIST
      ?auto_167300 - SURFACE
      ?auto_167298 - SURFACE
      ?auto_167294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167299 ?auto_167297 ) ( IS-CRATE ?auto_167292 ) ( not ( = ?auto_167291 ?auto_167292 ) ) ( not ( = ?auto_167293 ?auto_167291 ) ) ( not ( = ?auto_167293 ?auto_167292 ) ) ( not ( = ?auto_167295 ?auto_167297 ) ) ( HOIST-AT ?auto_167296 ?auto_167295 ) ( not ( = ?auto_167299 ?auto_167296 ) ) ( SURFACE-AT ?auto_167292 ?auto_167295 ) ( ON ?auto_167292 ?auto_167300 ) ( CLEAR ?auto_167292 ) ( not ( = ?auto_167291 ?auto_167300 ) ) ( not ( = ?auto_167292 ?auto_167300 ) ) ( not ( = ?auto_167293 ?auto_167300 ) ) ( SURFACE-AT ?auto_167293 ?auto_167297 ) ( CLEAR ?auto_167293 ) ( IS-CRATE ?auto_167291 ) ( AVAILABLE ?auto_167299 ) ( AVAILABLE ?auto_167296 ) ( SURFACE-AT ?auto_167291 ?auto_167295 ) ( ON ?auto_167291 ?auto_167298 ) ( CLEAR ?auto_167291 ) ( not ( = ?auto_167291 ?auto_167298 ) ) ( not ( = ?auto_167292 ?auto_167298 ) ) ( not ( = ?auto_167293 ?auto_167298 ) ) ( not ( = ?auto_167300 ?auto_167298 ) ) ( TRUCK-AT ?auto_167294 ?auto_167297 ) )
    :subtasks
    ( ( !DRIVE ?auto_167294 ?auto_167297 ?auto_167295 )
      ( MAKE-2CRATE ?auto_167293 ?auto_167291 ?auto_167292 )
      ( MAKE-1CRATE-VERIFY ?auto_167291 ?auto_167292 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167301 - SURFACE
      ?auto_167302 - SURFACE
      ?auto_167303 - SURFACE
    )
    :vars
    (
      ?auto_167307 - HOIST
      ?auto_167304 - PLACE
      ?auto_167306 - PLACE
      ?auto_167308 - HOIST
      ?auto_167309 - SURFACE
      ?auto_167310 - SURFACE
      ?auto_167305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167307 ?auto_167304 ) ( IS-CRATE ?auto_167303 ) ( not ( = ?auto_167302 ?auto_167303 ) ) ( not ( = ?auto_167301 ?auto_167302 ) ) ( not ( = ?auto_167301 ?auto_167303 ) ) ( not ( = ?auto_167306 ?auto_167304 ) ) ( HOIST-AT ?auto_167308 ?auto_167306 ) ( not ( = ?auto_167307 ?auto_167308 ) ) ( SURFACE-AT ?auto_167303 ?auto_167306 ) ( ON ?auto_167303 ?auto_167309 ) ( CLEAR ?auto_167303 ) ( not ( = ?auto_167302 ?auto_167309 ) ) ( not ( = ?auto_167303 ?auto_167309 ) ) ( not ( = ?auto_167301 ?auto_167309 ) ) ( SURFACE-AT ?auto_167301 ?auto_167304 ) ( CLEAR ?auto_167301 ) ( IS-CRATE ?auto_167302 ) ( AVAILABLE ?auto_167307 ) ( AVAILABLE ?auto_167308 ) ( SURFACE-AT ?auto_167302 ?auto_167306 ) ( ON ?auto_167302 ?auto_167310 ) ( CLEAR ?auto_167302 ) ( not ( = ?auto_167302 ?auto_167310 ) ) ( not ( = ?auto_167303 ?auto_167310 ) ) ( not ( = ?auto_167301 ?auto_167310 ) ) ( not ( = ?auto_167309 ?auto_167310 ) ) ( TRUCK-AT ?auto_167305 ?auto_167304 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167302 ?auto_167303 )
      ( MAKE-2CRATE-VERIFY ?auto_167301 ?auto_167302 ?auto_167303 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_167311 - SURFACE
      ?auto_167312 - SURFACE
      ?auto_167313 - SURFACE
      ?auto_167314 - SURFACE
    )
    :vars
    (
      ?auto_167317 - HOIST
      ?auto_167318 - PLACE
      ?auto_167316 - PLACE
      ?auto_167321 - HOIST
      ?auto_167320 - SURFACE
      ?auto_167319 - SURFACE
      ?auto_167315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167317 ?auto_167318 ) ( IS-CRATE ?auto_167314 ) ( not ( = ?auto_167313 ?auto_167314 ) ) ( not ( = ?auto_167312 ?auto_167313 ) ) ( not ( = ?auto_167312 ?auto_167314 ) ) ( not ( = ?auto_167316 ?auto_167318 ) ) ( HOIST-AT ?auto_167321 ?auto_167316 ) ( not ( = ?auto_167317 ?auto_167321 ) ) ( SURFACE-AT ?auto_167314 ?auto_167316 ) ( ON ?auto_167314 ?auto_167320 ) ( CLEAR ?auto_167314 ) ( not ( = ?auto_167313 ?auto_167320 ) ) ( not ( = ?auto_167314 ?auto_167320 ) ) ( not ( = ?auto_167312 ?auto_167320 ) ) ( SURFACE-AT ?auto_167312 ?auto_167318 ) ( CLEAR ?auto_167312 ) ( IS-CRATE ?auto_167313 ) ( AVAILABLE ?auto_167317 ) ( AVAILABLE ?auto_167321 ) ( SURFACE-AT ?auto_167313 ?auto_167316 ) ( ON ?auto_167313 ?auto_167319 ) ( CLEAR ?auto_167313 ) ( not ( = ?auto_167313 ?auto_167319 ) ) ( not ( = ?auto_167314 ?auto_167319 ) ) ( not ( = ?auto_167312 ?auto_167319 ) ) ( not ( = ?auto_167320 ?auto_167319 ) ) ( TRUCK-AT ?auto_167315 ?auto_167318 ) ( ON ?auto_167312 ?auto_167311 ) ( not ( = ?auto_167311 ?auto_167312 ) ) ( not ( = ?auto_167311 ?auto_167313 ) ) ( not ( = ?auto_167311 ?auto_167314 ) ) ( not ( = ?auto_167311 ?auto_167320 ) ) ( not ( = ?auto_167311 ?auto_167319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167312 ?auto_167313 ?auto_167314 )
      ( MAKE-3CRATE-VERIFY ?auto_167311 ?auto_167312 ?auto_167313 ?auto_167314 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167322 - SURFACE
      ?auto_167323 - SURFACE
      ?auto_167324 - SURFACE
      ?auto_167326 - SURFACE
      ?auto_167325 - SURFACE
    )
    :vars
    (
      ?auto_167329 - HOIST
      ?auto_167330 - PLACE
      ?auto_167328 - PLACE
      ?auto_167333 - HOIST
      ?auto_167332 - SURFACE
      ?auto_167331 - SURFACE
      ?auto_167327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167329 ?auto_167330 ) ( IS-CRATE ?auto_167325 ) ( not ( = ?auto_167326 ?auto_167325 ) ) ( not ( = ?auto_167324 ?auto_167326 ) ) ( not ( = ?auto_167324 ?auto_167325 ) ) ( not ( = ?auto_167328 ?auto_167330 ) ) ( HOIST-AT ?auto_167333 ?auto_167328 ) ( not ( = ?auto_167329 ?auto_167333 ) ) ( SURFACE-AT ?auto_167325 ?auto_167328 ) ( ON ?auto_167325 ?auto_167332 ) ( CLEAR ?auto_167325 ) ( not ( = ?auto_167326 ?auto_167332 ) ) ( not ( = ?auto_167325 ?auto_167332 ) ) ( not ( = ?auto_167324 ?auto_167332 ) ) ( SURFACE-AT ?auto_167324 ?auto_167330 ) ( CLEAR ?auto_167324 ) ( IS-CRATE ?auto_167326 ) ( AVAILABLE ?auto_167329 ) ( AVAILABLE ?auto_167333 ) ( SURFACE-AT ?auto_167326 ?auto_167328 ) ( ON ?auto_167326 ?auto_167331 ) ( CLEAR ?auto_167326 ) ( not ( = ?auto_167326 ?auto_167331 ) ) ( not ( = ?auto_167325 ?auto_167331 ) ) ( not ( = ?auto_167324 ?auto_167331 ) ) ( not ( = ?auto_167332 ?auto_167331 ) ) ( TRUCK-AT ?auto_167327 ?auto_167330 ) ( ON ?auto_167323 ?auto_167322 ) ( ON ?auto_167324 ?auto_167323 ) ( not ( = ?auto_167322 ?auto_167323 ) ) ( not ( = ?auto_167322 ?auto_167324 ) ) ( not ( = ?auto_167322 ?auto_167326 ) ) ( not ( = ?auto_167322 ?auto_167325 ) ) ( not ( = ?auto_167322 ?auto_167332 ) ) ( not ( = ?auto_167322 ?auto_167331 ) ) ( not ( = ?auto_167323 ?auto_167324 ) ) ( not ( = ?auto_167323 ?auto_167326 ) ) ( not ( = ?auto_167323 ?auto_167325 ) ) ( not ( = ?auto_167323 ?auto_167332 ) ) ( not ( = ?auto_167323 ?auto_167331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167324 ?auto_167326 ?auto_167325 )
      ( MAKE-4CRATE-VERIFY ?auto_167322 ?auto_167323 ?auto_167324 ?auto_167326 ?auto_167325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167334 - SURFACE
      ?auto_167335 - SURFACE
    )
    :vars
    (
      ?auto_167338 - HOIST
      ?auto_167339 - PLACE
      ?auto_167343 - SURFACE
      ?auto_167337 - PLACE
      ?auto_167342 - HOIST
      ?auto_167341 - SURFACE
      ?auto_167340 - SURFACE
      ?auto_167336 - TRUCK
      ?auto_167344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167338 ?auto_167339 ) ( IS-CRATE ?auto_167335 ) ( not ( = ?auto_167334 ?auto_167335 ) ) ( not ( = ?auto_167343 ?auto_167334 ) ) ( not ( = ?auto_167343 ?auto_167335 ) ) ( not ( = ?auto_167337 ?auto_167339 ) ) ( HOIST-AT ?auto_167342 ?auto_167337 ) ( not ( = ?auto_167338 ?auto_167342 ) ) ( SURFACE-AT ?auto_167335 ?auto_167337 ) ( ON ?auto_167335 ?auto_167341 ) ( CLEAR ?auto_167335 ) ( not ( = ?auto_167334 ?auto_167341 ) ) ( not ( = ?auto_167335 ?auto_167341 ) ) ( not ( = ?auto_167343 ?auto_167341 ) ) ( IS-CRATE ?auto_167334 ) ( AVAILABLE ?auto_167342 ) ( SURFACE-AT ?auto_167334 ?auto_167337 ) ( ON ?auto_167334 ?auto_167340 ) ( CLEAR ?auto_167334 ) ( not ( = ?auto_167334 ?auto_167340 ) ) ( not ( = ?auto_167335 ?auto_167340 ) ) ( not ( = ?auto_167343 ?auto_167340 ) ) ( not ( = ?auto_167341 ?auto_167340 ) ) ( TRUCK-AT ?auto_167336 ?auto_167339 ) ( SURFACE-AT ?auto_167344 ?auto_167339 ) ( CLEAR ?auto_167344 ) ( LIFTING ?auto_167338 ?auto_167343 ) ( IS-CRATE ?auto_167343 ) ( not ( = ?auto_167344 ?auto_167343 ) ) ( not ( = ?auto_167334 ?auto_167344 ) ) ( not ( = ?auto_167335 ?auto_167344 ) ) ( not ( = ?auto_167341 ?auto_167344 ) ) ( not ( = ?auto_167340 ?auto_167344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167344 ?auto_167343 )
      ( MAKE-2CRATE ?auto_167343 ?auto_167334 ?auto_167335 )
      ( MAKE-1CRATE-VERIFY ?auto_167334 ?auto_167335 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167345 - SURFACE
      ?auto_167346 - SURFACE
      ?auto_167347 - SURFACE
    )
    :vars
    (
      ?auto_167350 - HOIST
      ?auto_167353 - PLACE
      ?auto_167349 - PLACE
      ?auto_167355 - HOIST
      ?auto_167352 - SURFACE
      ?auto_167351 - SURFACE
      ?auto_167348 - TRUCK
      ?auto_167354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167350 ?auto_167353 ) ( IS-CRATE ?auto_167347 ) ( not ( = ?auto_167346 ?auto_167347 ) ) ( not ( = ?auto_167345 ?auto_167346 ) ) ( not ( = ?auto_167345 ?auto_167347 ) ) ( not ( = ?auto_167349 ?auto_167353 ) ) ( HOIST-AT ?auto_167355 ?auto_167349 ) ( not ( = ?auto_167350 ?auto_167355 ) ) ( SURFACE-AT ?auto_167347 ?auto_167349 ) ( ON ?auto_167347 ?auto_167352 ) ( CLEAR ?auto_167347 ) ( not ( = ?auto_167346 ?auto_167352 ) ) ( not ( = ?auto_167347 ?auto_167352 ) ) ( not ( = ?auto_167345 ?auto_167352 ) ) ( IS-CRATE ?auto_167346 ) ( AVAILABLE ?auto_167355 ) ( SURFACE-AT ?auto_167346 ?auto_167349 ) ( ON ?auto_167346 ?auto_167351 ) ( CLEAR ?auto_167346 ) ( not ( = ?auto_167346 ?auto_167351 ) ) ( not ( = ?auto_167347 ?auto_167351 ) ) ( not ( = ?auto_167345 ?auto_167351 ) ) ( not ( = ?auto_167352 ?auto_167351 ) ) ( TRUCK-AT ?auto_167348 ?auto_167353 ) ( SURFACE-AT ?auto_167354 ?auto_167353 ) ( CLEAR ?auto_167354 ) ( LIFTING ?auto_167350 ?auto_167345 ) ( IS-CRATE ?auto_167345 ) ( not ( = ?auto_167354 ?auto_167345 ) ) ( not ( = ?auto_167346 ?auto_167354 ) ) ( not ( = ?auto_167347 ?auto_167354 ) ) ( not ( = ?auto_167352 ?auto_167354 ) ) ( not ( = ?auto_167351 ?auto_167354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167346 ?auto_167347 )
      ( MAKE-2CRATE-VERIFY ?auto_167345 ?auto_167346 ?auto_167347 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_167356 - SURFACE
      ?auto_167357 - SURFACE
      ?auto_167358 - SURFACE
      ?auto_167359 - SURFACE
    )
    :vars
    (
      ?auto_167361 - HOIST
      ?auto_167366 - PLACE
      ?auto_167364 - PLACE
      ?auto_167362 - HOIST
      ?auto_167360 - SURFACE
      ?auto_167365 - SURFACE
      ?auto_167363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167361 ?auto_167366 ) ( IS-CRATE ?auto_167359 ) ( not ( = ?auto_167358 ?auto_167359 ) ) ( not ( = ?auto_167357 ?auto_167358 ) ) ( not ( = ?auto_167357 ?auto_167359 ) ) ( not ( = ?auto_167364 ?auto_167366 ) ) ( HOIST-AT ?auto_167362 ?auto_167364 ) ( not ( = ?auto_167361 ?auto_167362 ) ) ( SURFACE-AT ?auto_167359 ?auto_167364 ) ( ON ?auto_167359 ?auto_167360 ) ( CLEAR ?auto_167359 ) ( not ( = ?auto_167358 ?auto_167360 ) ) ( not ( = ?auto_167359 ?auto_167360 ) ) ( not ( = ?auto_167357 ?auto_167360 ) ) ( IS-CRATE ?auto_167358 ) ( AVAILABLE ?auto_167362 ) ( SURFACE-AT ?auto_167358 ?auto_167364 ) ( ON ?auto_167358 ?auto_167365 ) ( CLEAR ?auto_167358 ) ( not ( = ?auto_167358 ?auto_167365 ) ) ( not ( = ?auto_167359 ?auto_167365 ) ) ( not ( = ?auto_167357 ?auto_167365 ) ) ( not ( = ?auto_167360 ?auto_167365 ) ) ( TRUCK-AT ?auto_167363 ?auto_167366 ) ( SURFACE-AT ?auto_167356 ?auto_167366 ) ( CLEAR ?auto_167356 ) ( LIFTING ?auto_167361 ?auto_167357 ) ( IS-CRATE ?auto_167357 ) ( not ( = ?auto_167356 ?auto_167357 ) ) ( not ( = ?auto_167358 ?auto_167356 ) ) ( not ( = ?auto_167359 ?auto_167356 ) ) ( not ( = ?auto_167360 ?auto_167356 ) ) ( not ( = ?auto_167365 ?auto_167356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167357 ?auto_167358 ?auto_167359 )
      ( MAKE-3CRATE-VERIFY ?auto_167356 ?auto_167357 ?auto_167358 ?auto_167359 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167367 - SURFACE
      ?auto_167368 - SURFACE
      ?auto_167369 - SURFACE
      ?auto_167371 - SURFACE
      ?auto_167370 - SURFACE
    )
    :vars
    (
      ?auto_167373 - HOIST
      ?auto_167378 - PLACE
      ?auto_167376 - PLACE
      ?auto_167374 - HOIST
      ?auto_167372 - SURFACE
      ?auto_167377 - SURFACE
      ?auto_167375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167373 ?auto_167378 ) ( IS-CRATE ?auto_167370 ) ( not ( = ?auto_167371 ?auto_167370 ) ) ( not ( = ?auto_167369 ?auto_167371 ) ) ( not ( = ?auto_167369 ?auto_167370 ) ) ( not ( = ?auto_167376 ?auto_167378 ) ) ( HOIST-AT ?auto_167374 ?auto_167376 ) ( not ( = ?auto_167373 ?auto_167374 ) ) ( SURFACE-AT ?auto_167370 ?auto_167376 ) ( ON ?auto_167370 ?auto_167372 ) ( CLEAR ?auto_167370 ) ( not ( = ?auto_167371 ?auto_167372 ) ) ( not ( = ?auto_167370 ?auto_167372 ) ) ( not ( = ?auto_167369 ?auto_167372 ) ) ( IS-CRATE ?auto_167371 ) ( AVAILABLE ?auto_167374 ) ( SURFACE-AT ?auto_167371 ?auto_167376 ) ( ON ?auto_167371 ?auto_167377 ) ( CLEAR ?auto_167371 ) ( not ( = ?auto_167371 ?auto_167377 ) ) ( not ( = ?auto_167370 ?auto_167377 ) ) ( not ( = ?auto_167369 ?auto_167377 ) ) ( not ( = ?auto_167372 ?auto_167377 ) ) ( TRUCK-AT ?auto_167375 ?auto_167378 ) ( SURFACE-AT ?auto_167368 ?auto_167378 ) ( CLEAR ?auto_167368 ) ( LIFTING ?auto_167373 ?auto_167369 ) ( IS-CRATE ?auto_167369 ) ( not ( = ?auto_167368 ?auto_167369 ) ) ( not ( = ?auto_167371 ?auto_167368 ) ) ( not ( = ?auto_167370 ?auto_167368 ) ) ( not ( = ?auto_167372 ?auto_167368 ) ) ( not ( = ?auto_167377 ?auto_167368 ) ) ( ON ?auto_167368 ?auto_167367 ) ( not ( = ?auto_167367 ?auto_167368 ) ) ( not ( = ?auto_167367 ?auto_167369 ) ) ( not ( = ?auto_167367 ?auto_167371 ) ) ( not ( = ?auto_167367 ?auto_167370 ) ) ( not ( = ?auto_167367 ?auto_167372 ) ) ( not ( = ?auto_167367 ?auto_167377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167369 ?auto_167371 ?auto_167370 )
      ( MAKE-4CRATE-VERIFY ?auto_167367 ?auto_167368 ?auto_167369 ?auto_167371 ?auto_167370 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167650 - SURFACE
      ?auto_167651 - SURFACE
    )
    :vars
    (
      ?auto_167659 - HOIST
      ?auto_167657 - PLACE
      ?auto_167655 - SURFACE
      ?auto_167654 - PLACE
      ?auto_167652 - HOIST
      ?auto_167658 - SURFACE
      ?auto_167653 - TRUCK
      ?auto_167656 - SURFACE
      ?auto_167660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167659 ?auto_167657 ) ( IS-CRATE ?auto_167651 ) ( not ( = ?auto_167650 ?auto_167651 ) ) ( not ( = ?auto_167655 ?auto_167650 ) ) ( not ( = ?auto_167655 ?auto_167651 ) ) ( not ( = ?auto_167654 ?auto_167657 ) ) ( HOIST-AT ?auto_167652 ?auto_167654 ) ( not ( = ?auto_167659 ?auto_167652 ) ) ( SURFACE-AT ?auto_167651 ?auto_167654 ) ( ON ?auto_167651 ?auto_167658 ) ( CLEAR ?auto_167651 ) ( not ( = ?auto_167650 ?auto_167658 ) ) ( not ( = ?auto_167651 ?auto_167658 ) ) ( not ( = ?auto_167655 ?auto_167658 ) ) ( SURFACE-AT ?auto_167655 ?auto_167657 ) ( CLEAR ?auto_167655 ) ( IS-CRATE ?auto_167650 ) ( AVAILABLE ?auto_167659 ) ( TRUCK-AT ?auto_167653 ?auto_167654 ) ( SURFACE-AT ?auto_167650 ?auto_167654 ) ( ON ?auto_167650 ?auto_167656 ) ( CLEAR ?auto_167650 ) ( not ( = ?auto_167650 ?auto_167656 ) ) ( not ( = ?auto_167651 ?auto_167656 ) ) ( not ( = ?auto_167655 ?auto_167656 ) ) ( not ( = ?auto_167658 ?auto_167656 ) ) ( LIFTING ?auto_167652 ?auto_167660 ) ( IS-CRATE ?auto_167660 ) ( not ( = ?auto_167650 ?auto_167660 ) ) ( not ( = ?auto_167651 ?auto_167660 ) ) ( not ( = ?auto_167655 ?auto_167660 ) ) ( not ( = ?auto_167658 ?auto_167660 ) ) ( not ( = ?auto_167656 ?auto_167660 ) ) )
    :subtasks
    ( ( !LOAD ?auto_167652 ?auto_167660 ?auto_167653 ?auto_167654 )
      ( MAKE-2CRATE ?auto_167655 ?auto_167650 ?auto_167651 )
      ( MAKE-1CRATE-VERIFY ?auto_167650 ?auto_167651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_167661 - SURFACE
      ?auto_167662 - SURFACE
      ?auto_167663 - SURFACE
    )
    :vars
    (
      ?auto_167671 - HOIST
      ?auto_167665 - PLACE
      ?auto_167668 - PLACE
      ?auto_167667 - HOIST
      ?auto_167669 - SURFACE
      ?auto_167664 - TRUCK
      ?auto_167666 - SURFACE
      ?auto_167670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167671 ?auto_167665 ) ( IS-CRATE ?auto_167663 ) ( not ( = ?auto_167662 ?auto_167663 ) ) ( not ( = ?auto_167661 ?auto_167662 ) ) ( not ( = ?auto_167661 ?auto_167663 ) ) ( not ( = ?auto_167668 ?auto_167665 ) ) ( HOIST-AT ?auto_167667 ?auto_167668 ) ( not ( = ?auto_167671 ?auto_167667 ) ) ( SURFACE-AT ?auto_167663 ?auto_167668 ) ( ON ?auto_167663 ?auto_167669 ) ( CLEAR ?auto_167663 ) ( not ( = ?auto_167662 ?auto_167669 ) ) ( not ( = ?auto_167663 ?auto_167669 ) ) ( not ( = ?auto_167661 ?auto_167669 ) ) ( SURFACE-AT ?auto_167661 ?auto_167665 ) ( CLEAR ?auto_167661 ) ( IS-CRATE ?auto_167662 ) ( AVAILABLE ?auto_167671 ) ( TRUCK-AT ?auto_167664 ?auto_167668 ) ( SURFACE-AT ?auto_167662 ?auto_167668 ) ( ON ?auto_167662 ?auto_167666 ) ( CLEAR ?auto_167662 ) ( not ( = ?auto_167662 ?auto_167666 ) ) ( not ( = ?auto_167663 ?auto_167666 ) ) ( not ( = ?auto_167661 ?auto_167666 ) ) ( not ( = ?auto_167669 ?auto_167666 ) ) ( LIFTING ?auto_167667 ?auto_167670 ) ( IS-CRATE ?auto_167670 ) ( not ( = ?auto_167662 ?auto_167670 ) ) ( not ( = ?auto_167663 ?auto_167670 ) ) ( not ( = ?auto_167661 ?auto_167670 ) ) ( not ( = ?auto_167669 ?auto_167670 ) ) ( not ( = ?auto_167666 ?auto_167670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167662 ?auto_167663 )
      ( MAKE-2CRATE-VERIFY ?auto_167661 ?auto_167662 ?auto_167663 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167802 - SURFACE
      ?auto_167803 - SURFACE
      ?auto_167804 - SURFACE
      ?auto_167806 - SURFACE
      ?auto_167805 - SURFACE
      ?auto_167807 - SURFACE
    )
    :vars
    (
      ?auto_167809 - HOIST
      ?auto_167808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167809 ?auto_167808 ) ( SURFACE-AT ?auto_167805 ?auto_167808 ) ( CLEAR ?auto_167805 ) ( LIFTING ?auto_167809 ?auto_167807 ) ( IS-CRATE ?auto_167807 ) ( not ( = ?auto_167805 ?auto_167807 ) ) ( ON ?auto_167803 ?auto_167802 ) ( ON ?auto_167804 ?auto_167803 ) ( ON ?auto_167806 ?auto_167804 ) ( ON ?auto_167805 ?auto_167806 ) ( not ( = ?auto_167802 ?auto_167803 ) ) ( not ( = ?auto_167802 ?auto_167804 ) ) ( not ( = ?auto_167802 ?auto_167806 ) ) ( not ( = ?auto_167802 ?auto_167805 ) ) ( not ( = ?auto_167802 ?auto_167807 ) ) ( not ( = ?auto_167803 ?auto_167804 ) ) ( not ( = ?auto_167803 ?auto_167806 ) ) ( not ( = ?auto_167803 ?auto_167805 ) ) ( not ( = ?auto_167803 ?auto_167807 ) ) ( not ( = ?auto_167804 ?auto_167806 ) ) ( not ( = ?auto_167804 ?auto_167805 ) ) ( not ( = ?auto_167804 ?auto_167807 ) ) ( not ( = ?auto_167806 ?auto_167805 ) ) ( not ( = ?auto_167806 ?auto_167807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167805 ?auto_167807 )
      ( MAKE-5CRATE-VERIFY ?auto_167802 ?auto_167803 ?auto_167804 ?auto_167806 ?auto_167805 ?auto_167807 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167836 - SURFACE
      ?auto_167837 - SURFACE
      ?auto_167838 - SURFACE
      ?auto_167840 - SURFACE
      ?auto_167839 - SURFACE
      ?auto_167841 - SURFACE
    )
    :vars
    (
      ?auto_167844 - HOIST
      ?auto_167843 - PLACE
      ?auto_167842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167844 ?auto_167843 ) ( SURFACE-AT ?auto_167839 ?auto_167843 ) ( CLEAR ?auto_167839 ) ( IS-CRATE ?auto_167841 ) ( not ( = ?auto_167839 ?auto_167841 ) ) ( TRUCK-AT ?auto_167842 ?auto_167843 ) ( AVAILABLE ?auto_167844 ) ( IN ?auto_167841 ?auto_167842 ) ( ON ?auto_167839 ?auto_167840 ) ( not ( = ?auto_167840 ?auto_167839 ) ) ( not ( = ?auto_167840 ?auto_167841 ) ) ( ON ?auto_167837 ?auto_167836 ) ( ON ?auto_167838 ?auto_167837 ) ( ON ?auto_167840 ?auto_167838 ) ( not ( = ?auto_167836 ?auto_167837 ) ) ( not ( = ?auto_167836 ?auto_167838 ) ) ( not ( = ?auto_167836 ?auto_167840 ) ) ( not ( = ?auto_167836 ?auto_167839 ) ) ( not ( = ?auto_167836 ?auto_167841 ) ) ( not ( = ?auto_167837 ?auto_167838 ) ) ( not ( = ?auto_167837 ?auto_167840 ) ) ( not ( = ?auto_167837 ?auto_167839 ) ) ( not ( = ?auto_167837 ?auto_167841 ) ) ( not ( = ?auto_167838 ?auto_167840 ) ) ( not ( = ?auto_167838 ?auto_167839 ) ) ( not ( = ?auto_167838 ?auto_167841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167840 ?auto_167839 ?auto_167841 )
      ( MAKE-5CRATE-VERIFY ?auto_167836 ?auto_167837 ?auto_167838 ?auto_167840 ?auto_167839 ?auto_167841 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167876 - SURFACE
      ?auto_167877 - SURFACE
      ?auto_167878 - SURFACE
      ?auto_167880 - SURFACE
      ?auto_167879 - SURFACE
      ?auto_167881 - SURFACE
    )
    :vars
    (
      ?auto_167884 - HOIST
      ?auto_167885 - PLACE
      ?auto_167883 - TRUCK
      ?auto_167882 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167884 ?auto_167885 ) ( SURFACE-AT ?auto_167879 ?auto_167885 ) ( CLEAR ?auto_167879 ) ( IS-CRATE ?auto_167881 ) ( not ( = ?auto_167879 ?auto_167881 ) ) ( AVAILABLE ?auto_167884 ) ( IN ?auto_167881 ?auto_167883 ) ( ON ?auto_167879 ?auto_167880 ) ( not ( = ?auto_167880 ?auto_167879 ) ) ( not ( = ?auto_167880 ?auto_167881 ) ) ( TRUCK-AT ?auto_167883 ?auto_167882 ) ( not ( = ?auto_167882 ?auto_167885 ) ) ( ON ?auto_167877 ?auto_167876 ) ( ON ?auto_167878 ?auto_167877 ) ( ON ?auto_167880 ?auto_167878 ) ( not ( = ?auto_167876 ?auto_167877 ) ) ( not ( = ?auto_167876 ?auto_167878 ) ) ( not ( = ?auto_167876 ?auto_167880 ) ) ( not ( = ?auto_167876 ?auto_167879 ) ) ( not ( = ?auto_167876 ?auto_167881 ) ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( not ( = ?auto_167878 ?auto_167880 ) ) ( not ( = ?auto_167878 ?auto_167879 ) ) ( not ( = ?auto_167878 ?auto_167881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167880 ?auto_167879 ?auto_167881 )
      ( MAKE-5CRATE-VERIFY ?auto_167876 ?auto_167877 ?auto_167878 ?auto_167880 ?auto_167879 ?auto_167881 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167921 - SURFACE
      ?auto_167922 - SURFACE
      ?auto_167923 - SURFACE
      ?auto_167925 - SURFACE
      ?auto_167924 - SURFACE
      ?auto_167926 - SURFACE
    )
    :vars
    (
      ?auto_167928 - HOIST
      ?auto_167930 - PLACE
      ?auto_167929 - TRUCK
      ?auto_167927 - PLACE
      ?auto_167931 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_167928 ?auto_167930 ) ( SURFACE-AT ?auto_167924 ?auto_167930 ) ( CLEAR ?auto_167924 ) ( IS-CRATE ?auto_167926 ) ( not ( = ?auto_167924 ?auto_167926 ) ) ( AVAILABLE ?auto_167928 ) ( ON ?auto_167924 ?auto_167925 ) ( not ( = ?auto_167925 ?auto_167924 ) ) ( not ( = ?auto_167925 ?auto_167926 ) ) ( TRUCK-AT ?auto_167929 ?auto_167927 ) ( not ( = ?auto_167927 ?auto_167930 ) ) ( HOIST-AT ?auto_167931 ?auto_167927 ) ( LIFTING ?auto_167931 ?auto_167926 ) ( not ( = ?auto_167928 ?auto_167931 ) ) ( ON ?auto_167922 ?auto_167921 ) ( ON ?auto_167923 ?auto_167922 ) ( ON ?auto_167925 ?auto_167923 ) ( not ( = ?auto_167921 ?auto_167922 ) ) ( not ( = ?auto_167921 ?auto_167923 ) ) ( not ( = ?auto_167921 ?auto_167925 ) ) ( not ( = ?auto_167921 ?auto_167924 ) ) ( not ( = ?auto_167921 ?auto_167926 ) ) ( not ( = ?auto_167922 ?auto_167923 ) ) ( not ( = ?auto_167922 ?auto_167925 ) ) ( not ( = ?auto_167922 ?auto_167924 ) ) ( not ( = ?auto_167922 ?auto_167926 ) ) ( not ( = ?auto_167923 ?auto_167925 ) ) ( not ( = ?auto_167923 ?auto_167924 ) ) ( not ( = ?auto_167923 ?auto_167926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167925 ?auto_167924 ?auto_167926 )
      ( MAKE-5CRATE-VERIFY ?auto_167921 ?auto_167922 ?auto_167923 ?auto_167925 ?auto_167924 ?auto_167926 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167971 - SURFACE
      ?auto_167972 - SURFACE
      ?auto_167973 - SURFACE
      ?auto_167975 - SURFACE
      ?auto_167974 - SURFACE
      ?auto_167976 - SURFACE
    )
    :vars
    (
      ?auto_167981 - HOIST
      ?auto_167980 - PLACE
      ?auto_167978 - TRUCK
      ?auto_167977 - PLACE
      ?auto_167979 - HOIST
      ?auto_167982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167981 ?auto_167980 ) ( SURFACE-AT ?auto_167974 ?auto_167980 ) ( CLEAR ?auto_167974 ) ( IS-CRATE ?auto_167976 ) ( not ( = ?auto_167974 ?auto_167976 ) ) ( AVAILABLE ?auto_167981 ) ( ON ?auto_167974 ?auto_167975 ) ( not ( = ?auto_167975 ?auto_167974 ) ) ( not ( = ?auto_167975 ?auto_167976 ) ) ( TRUCK-AT ?auto_167978 ?auto_167977 ) ( not ( = ?auto_167977 ?auto_167980 ) ) ( HOIST-AT ?auto_167979 ?auto_167977 ) ( not ( = ?auto_167981 ?auto_167979 ) ) ( AVAILABLE ?auto_167979 ) ( SURFACE-AT ?auto_167976 ?auto_167977 ) ( ON ?auto_167976 ?auto_167982 ) ( CLEAR ?auto_167976 ) ( not ( = ?auto_167974 ?auto_167982 ) ) ( not ( = ?auto_167976 ?auto_167982 ) ) ( not ( = ?auto_167975 ?auto_167982 ) ) ( ON ?auto_167972 ?auto_167971 ) ( ON ?auto_167973 ?auto_167972 ) ( ON ?auto_167975 ?auto_167973 ) ( not ( = ?auto_167971 ?auto_167972 ) ) ( not ( = ?auto_167971 ?auto_167973 ) ) ( not ( = ?auto_167971 ?auto_167975 ) ) ( not ( = ?auto_167971 ?auto_167974 ) ) ( not ( = ?auto_167971 ?auto_167976 ) ) ( not ( = ?auto_167971 ?auto_167982 ) ) ( not ( = ?auto_167972 ?auto_167973 ) ) ( not ( = ?auto_167972 ?auto_167975 ) ) ( not ( = ?auto_167972 ?auto_167974 ) ) ( not ( = ?auto_167972 ?auto_167976 ) ) ( not ( = ?auto_167972 ?auto_167982 ) ) ( not ( = ?auto_167973 ?auto_167975 ) ) ( not ( = ?auto_167973 ?auto_167974 ) ) ( not ( = ?auto_167973 ?auto_167976 ) ) ( not ( = ?auto_167973 ?auto_167982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167975 ?auto_167974 ?auto_167976 )
      ( MAKE-5CRATE-VERIFY ?auto_167971 ?auto_167972 ?auto_167973 ?auto_167975 ?auto_167974 ?auto_167976 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168022 - SURFACE
      ?auto_168023 - SURFACE
      ?auto_168024 - SURFACE
      ?auto_168026 - SURFACE
      ?auto_168025 - SURFACE
      ?auto_168027 - SURFACE
    )
    :vars
    (
      ?auto_168028 - HOIST
      ?auto_168030 - PLACE
      ?auto_168032 - PLACE
      ?auto_168033 - HOIST
      ?auto_168029 - SURFACE
      ?auto_168031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168028 ?auto_168030 ) ( SURFACE-AT ?auto_168025 ?auto_168030 ) ( CLEAR ?auto_168025 ) ( IS-CRATE ?auto_168027 ) ( not ( = ?auto_168025 ?auto_168027 ) ) ( AVAILABLE ?auto_168028 ) ( ON ?auto_168025 ?auto_168026 ) ( not ( = ?auto_168026 ?auto_168025 ) ) ( not ( = ?auto_168026 ?auto_168027 ) ) ( not ( = ?auto_168032 ?auto_168030 ) ) ( HOIST-AT ?auto_168033 ?auto_168032 ) ( not ( = ?auto_168028 ?auto_168033 ) ) ( AVAILABLE ?auto_168033 ) ( SURFACE-AT ?auto_168027 ?auto_168032 ) ( ON ?auto_168027 ?auto_168029 ) ( CLEAR ?auto_168027 ) ( not ( = ?auto_168025 ?auto_168029 ) ) ( not ( = ?auto_168027 ?auto_168029 ) ) ( not ( = ?auto_168026 ?auto_168029 ) ) ( TRUCK-AT ?auto_168031 ?auto_168030 ) ( ON ?auto_168023 ?auto_168022 ) ( ON ?auto_168024 ?auto_168023 ) ( ON ?auto_168026 ?auto_168024 ) ( not ( = ?auto_168022 ?auto_168023 ) ) ( not ( = ?auto_168022 ?auto_168024 ) ) ( not ( = ?auto_168022 ?auto_168026 ) ) ( not ( = ?auto_168022 ?auto_168025 ) ) ( not ( = ?auto_168022 ?auto_168027 ) ) ( not ( = ?auto_168022 ?auto_168029 ) ) ( not ( = ?auto_168023 ?auto_168024 ) ) ( not ( = ?auto_168023 ?auto_168026 ) ) ( not ( = ?auto_168023 ?auto_168025 ) ) ( not ( = ?auto_168023 ?auto_168027 ) ) ( not ( = ?auto_168023 ?auto_168029 ) ) ( not ( = ?auto_168024 ?auto_168026 ) ) ( not ( = ?auto_168024 ?auto_168025 ) ) ( not ( = ?auto_168024 ?auto_168027 ) ) ( not ( = ?auto_168024 ?auto_168029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168026 ?auto_168025 ?auto_168027 )
      ( MAKE-5CRATE-VERIFY ?auto_168022 ?auto_168023 ?auto_168024 ?auto_168026 ?auto_168025 ?auto_168027 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168073 - SURFACE
      ?auto_168074 - SURFACE
      ?auto_168075 - SURFACE
      ?auto_168077 - SURFACE
      ?auto_168076 - SURFACE
      ?auto_168078 - SURFACE
    )
    :vars
    (
      ?auto_168083 - HOIST
      ?auto_168079 - PLACE
      ?auto_168080 - PLACE
      ?auto_168084 - HOIST
      ?auto_168082 - SURFACE
      ?auto_168081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168083 ?auto_168079 ) ( IS-CRATE ?auto_168078 ) ( not ( = ?auto_168076 ?auto_168078 ) ) ( not ( = ?auto_168077 ?auto_168076 ) ) ( not ( = ?auto_168077 ?auto_168078 ) ) ( not ( = ?auto_168080 ?auto_168079 ) ) ( HOIST-AT ?auto_168084 ?auto_168080 ) ( not ( = ?auto_168083 ?auto_168084 ) ) ( AVAILABLE ?auto_168084 ) ( SURFACE-AT ?auto_168078 ?auto_168080 ) ( ON ?auto_168078 ?auto_168082 ) ( CLEAR ?auto_168078 ) ( not ( = ?auto_168076 ?auto_168082 ) ) ( not ( = ?auto_168078 ?auto_168082 ) ) ( not ( = ?auto_168077 ?auto_168082 ) ) ( TRUCK-AT ?auto_168081 ?auto_168079 ) ( SURFACE-AT ?auto_168077 ?auto_168079 ) ( CLEAR ?auto_168077 ) ( LIFTING ?auto_168083 ?auto_168076 ) ( IS-CRATE ?auto_168076 ) ( ON ?auto_168074 ?auto_168073 ) ( ON ?auto_168075 ?auto_168074 ) ( ON ?auto_168077 ?auto_168075 ) ( not ( = ?auto_168073 ?auto_168074 ) ) ( not ( = ?auto_168073 ?auto_168075 ) ) ( not ( = ?auto_168073 ?auto_168077 ) ) ( not ( = ?auto_168073 ?auto_168076 ) ) ( not ( = ?auto_168073 ?auto_168078 ) ) ( not ( = ?auto_168073 ?auto_168082 ) ) ( not ( = ?auto_168074 ?auto_168075 ) ) ( not ( = ?auto_168074 ?auto_168077 ) ) ( not ( = ?auto_168074 ?auto_168076 ) ) ( not ( = ?auto_168074 ?auto_168078 ) ) ( not ( = ?auto_168074 ?auto_168082 ) ) ( not ( = ?auto_168075 ?auto_168077 ) ) ( not ( = ?auto_168075 ?auto_168076 ) ) ( not ( = ?auto_168075 ?auto_168078 ) ) ( not ( = ?auto_168075 ?auto_168082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168077 ?auto_168076 ?auto_168078 )
      ( MAKE-5CRATE-VERIFY ?auto_168073 ?auto_168074 ?auto_168075 ?auto_168077 ?auto_168076 ?auto_168078 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168124 - SURFACE
      ?auto_168125 - SURFACE
      ?auto_168126 - SURFACE
      ?auto_168128 - SURFACE
      ?auto_168127 - SURFACE
      ?auto_168129 - SURFACE
    )
    :vars
    (
      ?auto_168134 - HOIST
      ?auto_168130 - PLACE
      ?auto_168135 - PLACE
      ?auto_168132 - HOIST
      ?auto_168133 - SURFACE
      ?auto_168131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168134 ?auto_168130 ) ( IS-CRATE ?auto_168129 ) ( not ( = ?auto_168127 ?auto_168129 ) ) ( not ( = ?auto_168128 ?auto_168127 ) ) ( not ( = ?auto_168128 ?auto_168129 ) ) ( not ( = ?auto_168135 ?auto_168130 ) ) ( HOIST-AT ?auto_168132 ?auto_168135 ) ( not ( = ?auto_168134 ?auto_168132 ) ) ( AVAILABLE ?auto_168132 ) ( SURFACE-AT ?auto_168129 ?auto_168135 ) ( ON ?auto_168129 ?auto_168133 ) ( CLEAR ?auto_168129 ) ( not ( = ?auto_168127 ?auto_168133 ) ) ( not ( = ?auto_168129 ?auto_168133 ) ) ( not ( = ?auto_168128 ?auto_168133 ) ) ( TRUCK-AT ?auto_168131 ?auto_168130 ) ( SURFACE-AT ?auto_168128 ?auto_168130 ) ( CLEAR ?auto_168128 ) ( IS-CRATE ?auto_168127 ) ( AVAILABLE ?auto_168134 ) ( IN ?auto_168127 ?auto_168131 ) ( ON ?auto_168125 ?auto_168124 ) ( ON ?auto_168126 ?auto_168125 ) ( ON ?auto_168128 ?auto_168126 ) ( not ( = ?auto_168124 ?auto_168125 ) ) ( not ( = ?auto_168124 ?auto_168126 ) ) ( not ( = ?auto_168124 ?auto_168128 ) ) ( not ( = ?auto_168124 ?auto_168127 ) ) ( not ( = ?auto_168124 ?auto_168129 ) ) ( not ( = ?auto_168124 ?auto_168133 ) ) ( not ( = ?auto_168125 ?auto_168126 ) ) ( not ( = ?auto_168125 ?auto_168128 ) ) ( not ( = ?auto_168125 ?auto_168127 ) ) ( not ( = ?auto_168125 ?auto_168129 ) ) ( not ( = ?auto_168125 ?auto_168133 ) ) ( not ( = ?auto_168126 ?auto_168128 ) ) ( not ( = ?auto_168126 ?auto_168127 ) ) ( not ( = ?auto_168126 ?auto_168129 ) ) ( not ( = ?auto_168126 ?auto_168133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168128 ?auto_168127 ?auto_168129 )
      ( MAKE-5CRATE-VERIFY ?auto_168124 ?auto_168125 ?auto_168126 ?auto_168128 ?auto_168127 ?auto_168129 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_168492 - SURFACE
      ?auto_168493 - SURFACE
    )
    :vars
    (
      ?auto_168496 - HOIST
      ?auto_168497 - PLACE
      ?auto_168499 - SURFACE
      ?auto_168495 - PLACE
      ?auto_168500 - HOIST
      ?auto_168498 - SURFACE
      ?auto_168494 - TRUCK
      ?auto_168501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_168496 ?auto_168497 ) ( SURFACE-AT ?auto_168492 ?auto_168497 ) ( CLEAR ?auto_168492 ) ( IS-CRATE ?auto_168493 ) ( not ( = ?auto_168492 ?auto_168493 ) ) ( ON ?auto_168492 ?auto_168499 ) ( not ( = ?auto_168499 ?auto_168492 ) ) ( not ( = ?auto_168499 ?auto_168493 ) ) ( not ( = ?auto_168495 ?auto_168497 ) ) ( HOIST-AT ?auto_168500 ?auto_168495 ) ( not ( = ?auto_168496 ?auto_168500 ) ) ( AVAILABLE ?auto_168500 ) ( SURFACE-AT ?auto_168493 ?auto_168495 ) ( ON ?auto_168493 ?auto_168498 ) ( CLEAR ?auto_168493 ) ( not ( = ?auto_168492 ?auto_168498 ) ) ( not ( = ?auto_168493 ?auto_168498 ) ) ( not ( = ?auto_168499 ?auto_168498 ) ) ( TRUCK-AT ?auto_168494 ?auto_168497 ) ( LIFTING ?auto_168496 ?auto_168501 ) ( IS-CRATE ?auto_168501 ) ( not ( = ?auto_168492 ?auto_168501 ) ) ( not ( = ?auto_168493 ?auto_168501 ) ) ( not ( = ?auto_168499 ?auto_168501 ) ) ( not ( = ?auto_168498 ?auto_168501 ) ) )
    :subtasks
    ( ( !LOAD ?auto_168496 ?auto_168501 ?auto_168494 ?auto_168497 )
      ( MAKE-1CRATE ?auto_168492 ?auto_168493 )
      ( MAKE-1CRATE-VERIFY ?auto_168492 ?auto_168493 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169316 - SURFACE
      ?auto_169317 - SURFACE
      ?auto_169318 - SURFACE
      ?auto_169320 - SURFACE
      ?auto_169319 - SURFACE
      ?auto_169321 - SURFACE
      ?auto_169322 - SURFACE
    )
    :vars
    (
      ?auto_169324 - HOIST
      ?auto_169323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169324 ?auto_169323 ) ( SURFACE-AT ?auto_169321 ?auto_169323 ) ( CLEAR ?auto_169321 ) ( LIFTING ?auto_169324 ?auto_169322 ) ( IS-CRATE ?auto_169322 ) ( not ( = ?auto_169321 ?auto_169322 ) ) ( ON ?auto_169317 ?auto_169316 ) ( ON ?auto_169318 ?auto_169317 ) ( ON ?auto_169320 ?auto_169318 ) ( ON ?auto_169319 ?auto_169320 ) ( ON ?auto_169321 ?auto_169319 ) ( not ( = ?auto_169316 ?auto_169317 ) ) ( not ( = ?auto_169316 ?auto_169318 ) ) ( not ( = ?auto_169316 ?auto_169320 ) ) ( not ( = ?auto_169316 ?auto_169319 ) ) ( not ( = ?auto_169316 ?auto_169321 ) ) ( not ( = ?auto_169316 ?auto_169322 ) ) ( not ( = ?auto_169317 ?auto_169318 ) ) ( not ( = ?auto_169317 ?auto_169320 ) ) ( not ( = ?auto_169317 ?auto_169319 ) ) ( not ( = ?auto_169317 ?auto_169321 ) ) ( not ( = ?auto_169317 ?auto_169322 ) ) ( not ( = ?auto_169318 ?auto_169320 ) ) ( not ( = ?auto_169318 ?auto_169319 ) ) ( not ( = ?auto_169318 ?auto_169321 ) ) ( not ( = ?auto_169318 ?auto_169322 ) ) ( not ( = ?auto_169320 ?auto_169319 ) ) ( not ( = ?auto_169320 ?auto_169321 ) ) ( not ( = ?auto_169320 ?auto_169322 ) ) ( not ( = ?auto_169319 ?auto_169321 ) ) ( not ( = ?auto_169319 ?auto_169322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_169321 ?auto_169322 )
      ( MAKE-6CRATE-VERIFY ?auto_169316 ?auto_169317 ?auto_169318 ?auto_169320 ?auto_169319 ?auto_169321 ?auto_169322 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169360 - SURFACE
      ?auto_169361 - SURFACE
      ?auto_169362 - SURFACE
      ?auto_169364 - SURFACE
      ?auto_169363 - SURFACE
      ?auto_169365 - SURFACE
      ?auto_169366 - SURFACE
    )
    :vars
    (
      ?auto_169369 - HOIST
      ?auto_169368 - PLACE
      ?auto_169367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169369 ?auto_169368 ) ( SURFACE-AT ?auto_169365 ?auto_169368 ) ( CLEAR ?auto_169365 ) ( IS-CRATE ?auto_169366 ) ( not ( = ?auto_169365 ?auto_169366 ) ) ( TRUCK-AT ?auto_169367 ?auto_169368 ) ( AVAILABLE ?auto_169369 ) ( IN ?auto_169366 ?auto_169367 ) ( ON ?auto_169365 ?auto_169363 ) ( not ( = ?auto_169363 ?auto_169365 ) ) ( not ( = ?auto_169363 ?auto_169366 ) ) ( ON ?auto_169361 ?auto_169360 ) ( ON ?auto_169362 ?auto_169361 ) ( ON ?auto_169364 ?auto_169362 ) ( ON ?auto_169363 ?auto_169364 ) ( not ( = ?auto_169360 ?auto_169361 ) ) ( not ( = ?auto_169360 ?auto_169362 ) ) ( not ( = ?auto_169360 ?auto_169364 ) ) ( not ( = ?auto_169360 ?auto_169363 ) ) ( not ( = ?auto_169360 ?auto_169365 ) ) ( not ( = ?auto_169360 ?auto_169366 ) ) ( not ( = ?auto_169361 ?auto_169362 ) ) ( not ( = ?auto_169361 ?auto_169364 ) ) ( not ( = ?auto_169361 ?auto_169363 ) ) ( not ( = ?auto_169361 ?auto_169365 ) ) ( not ( = ?auto_169361 ?auto_169366 ) ) ( not ( = ?auto_169362 ?auto_169364 ) ) ( not ( = ?auto_169362 ?auto_169363 ) ) ( not ( = ?auto_169362 ?auto_169365 ) ) ( not ( = ?auto_169362 ?auto_169366 ) ) ( not ( = ?auto_169364 ?auto_169363 ) ) ( not ( = ?auto_169364 ?auto_169365 ) ) ( not ( = ?auto_169364 ?auto_169366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169363 ?auto_169365 ?auto_169366 )
      ( MAKE-6CRATE-VERIFY ?auto_169360 ?auto_169361 ?auto_169362 ?auto_169364 ?auto_169363 ?auto_169365 ?auto_169366 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169411 - SURFACE
      ?auto_169412 - SURFACE
      ?auto_169413 - SURFACE
      ?auto_169415 - SURFACE
      ?auto_169414 - SURFACE
      ?auto_169416 - SURFACE
      ?auto_169417 - SURFACE
    )
    :vars
    (
      ?auto_169418 - HOIST
      ?auto_169419 - PLACE
      ?auto_169421 - TRUCK
      ?auto_169420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169418 ?auto_169419 ) ( SURFACE-AT ?auto_169416 ?auto_169419 ) ( CLEAR ?auto_169416 ) ( IS-CRATE ?auto_169417 ) ( not ( = ?auto_169416 ?auto_169417 ) ) ( AVAILABLE ?auto_169418 ) ( IN ?auto_169417 ?auto_169421 ) ( ON ?auto_169416 ?auto_169414 ) ( not ( = ?auto_169414 ?auto_169416 ) ) ( not ( = ?auto_169414 ?auto_169417 ) ) ( TRUCK-AT ?auto_169421 ?auto_169420 ) ( not ( = ?auto_169420 ?auto_169419 ) ) ( ON ?auto_169412 ?auto_169411 ) ( ON ?auto_169413 ?auto_169412 ) ( ON ?auto_169415 ?auto_169413 ) ( ON ?auto_169414 ?auto_169415 ) ( not ( = ?auto_169411 ?auto_169412 ) ) ( not ( = ?auto_169411 ?auto_169413 ) ) ( not ( = ?auto_169411 ?auto_169415 ) ) ( not ( = ?auto_169411 ?auto_169414 ) ) ( not ( = ?auto_169411 ?auto_169416 ) ) ( not ( = ?auto_169411 ?auto_169417 ) ) ( not ( = ?auto_169412 ?auto_169413 ) ) ( not ( = ?auto_169412 ?auto_169415 ) ) ( not ( = ?auto_169412 ?auto_169414 ) ) ( not ( = ?auto_169412 ?auto_169416 ) ) ( not ( = ?auto_169412 ?auto_169417 ) ) ( not ( = ?auto_169413 ?auto_169415 ) ) ( not ( = ?auto_169413 ?auto_169414 ) ) ( not ( = ?auto_169413 ?auto_169416 ) ) ( not ( = ?auto_169413 ?auto_169417 ) ) ( not ( = ?auto_169415 ?auto_169414 ) ) ( not ( = ?auto_169415 ?auto_169416 ) ) ( not ( = ?auto_169415 ?auto_169417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169414 ?auto_169416 ?auto_169417 )
      ( MAKE-6CRATE-VERIFY ?auto_169411 ?auto_169412 ?auto_169413 ?auto_169415 ?auto_169414 ?auto_169416 ?auto_169417 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169468 - SURFACE
      ?auto_169469 - SURFACE
      ?auto_169470 - SURFACE
      ?auto_169472 - SURFACE
      ?auto_169471 - SURFACE
      ?auto_169473 - SURFACE
      ?auto_169474 - SURFACE
    )
    :vars
    (
      ?auto_169479 - HOIST
      ?auto_169475 - PLACE
      ?auto_169476 - TRUCK
      ?auto_169477 - PLACE
      ?auto_169478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_169479 ?auto_169475 ) ( SURFACE-AT ?auto_169473 ?auto_169475 ) ( CLEAR ?auto_169473 ) ( IS-CRATE ?auto_169474 ) ( not ( = ?auto_169473 ?auto_169474 ) ) ( AVAILABLE ?auto_169479 ) ( ON ?auto_169473 ?auto_169471 ) ( not ( = ?auto_169471 ?auto_169473 ) ) ( not ( = ?auto_169471 ?auto_169474 ) ) ( TRUCK-AT ?auto_169476 ?auto_169477 ) ( not ( = ?auto_169477 ?auto_169475 ) ) ( HOIST-AT ?auto_169478 ?auto_169477 ) ( LIFTING ?auto_169478 ?auto_169474 ) ( not ( = ?auto_169479 ?auto_169478 ) ) ( ON ?auto_169469 ?auto_169468 ) ( ON ?auto_169470 ?auto_169469 ) ( ON ?auto_169472 ?auto_169470 ) ( ON ?auto_169471 ?auto_169472 ) ( not ( = ?auto_169468 ?auto_169469 ) ) ( not ( = ?auto_169468 ?auto_169470 ) ) ( not ( = ?auto_169468 ?auto_169472 ) ) ( not ( = ?auto_169468 ?auto_169471 ) ) ( not ( = ?auto_169468 ?auto_169473 ) ) ( not ( = ?auto_169468 ?auto_169474 ) ) ( not ( = ?auto_169469 ?auto_169470 ) ) ( not ( = ?auto_169469 ?auto_169472 ) ) ( not ( = ?auto_169469 ?auto_169471 ) ) ( not ( = ?auto_169469 ?auto_169473 ) ) ( not ( = ?auto_169469 ?auto_169474 ) ) ( not ( = ?auto_169470 ?auto_169472 ) ) ( not ( = ?auto_169470 ?auto_169471 ) ) ( not ( = ?auto_169470 ?auto_169473 ) ) ( not ( = ?auto_169470 ?auto_169474 ) ) ( not ( = ?auto_169472 ?auto_169471 ) ) ( not ( = ?auto_169472 ?auto_169473 ) ) ( not ( = ?auto_169472 ?auto_169474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169471 ?auto_169473 ?auto_169474 )
      ( MAKE-6CRATE-VERIFY ?auto_169468 ?auto_169469 ?auto_169470 ?auto_169472 ?auto_169471 ?auto_169473 ?auto_169474 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169531 - SURFACE
      ?auto_169532 - SURFACE
      ?auto_169533 - SURFACE
      ?auto_169535 - SURFACE
      ?auto_169534 - SURFACE
      ?auto_169536 - SURFACE
      ?auto_169537 - SURFACE
    )
    :vars
    (
      ?auto_169538 - HOIST
      ?auto_169540 - PLACE
      ?auto_169542 - TRUCK
      ?auto_169541 - PLACE
      ?auto_169539 - HOIST
      ?auto_169543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169538 ?auto_169540 ) ( SURFACE-AT ?auto_169536 ?auto_169540 ) ( CLEAR ?auto_169536 ) ( IS-CRATE ?auto_169537 ) ( not ( = ?auto_169536 ?auto_169537 ) ) ( AVAILABLE ?auto_169538 ) ( ON ?auto_169536 ?auto_169534 ) ( not ( = ?auto_169534 ?auto_169536 ) ) ( not ( = ?auto_169534 ?auto_169537 ) ) ( TRUCK-AT ?auto_169542 ?auto_169541 ) ( not ( = ?auto_169541 ?auto_169540 ) ) ( HOIST-AT ?auto_169539 ?auto_169541 ) ( not ( = ?auto_169538 ?auto_169539 ) ) ( AVAILABLE ?auto_169539 ) ( SURFACE-AT ?auto_169537 ?auto_169541 ) ( ON ?auto_169537 ?auto_169543 ) ( CLEAR ?auto_169537 ) ( not ( = ?auto_169536 ?auto_169543 ) ) ( not ( = ?auto_169537 ?auto_169543 ) ) ( not ( = ?auto_169534 ?auto_169543 ) ) ( ON ?auto_169532 ?auto_169531 ) ( ON ?auto_169533 ?auto_169532 ) ( ON ?auto_169535 ?auto_169533 ) ( ON ?auto_169534 ?auto_169535 ) ( not ( = ?auto_169531 ?auto_169532 ) ) ( not ( = ?auto_169531 ?auto_169533 ) ) ( not ( = ?auto_169531 ?auto_169535 ) ) ( not ( = ?auto_169531 ?auto_169534 ) ) ( not ( = ?auto_169531 ?auto_169536 ) ) ( not ( = ?auto_169531 ?auto_169537 ) ) ( not ( = ?auto_169531 ?auto_169543 ) ) ( not ( = ?auto_169532 ?auto_169533 ) ) ( not ( = ?auto_169532 ?auto_169535 ) ) ( not ( = ?auto_169532 ?auto_169534 ) ) ( not ( = ?auto_169532 ?auto_169536 ) ) ( not ( = ?auto_169532 ?auto_169537 ) ) ( not ( = ?auto_169532 ?auto_169543 ) ) ( not ( = ?auto_169533 ?auto_169535 ) ) ( not ( = ?auto_169533 ?auto_169534 ) ) ( not ( = ?auto_169533 ?auto_169536 ) ) ( not ( = ?auto_169533 ?auto_169537 ) ) ( not ( = ?auto_169533 ?auto_169543 ) ) ( not ( = ?auto_169535 ?auto_169534 ) ) ( not ( = ?auto_169535 ?auto_169536 ) ) ( not ( = ?auto_169535 ?auto_169537 ) ) ( not ( = ?auto_169535 ?auto_169543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169534 ?auto_169536 ?auto_169537 )
      ( MAKE-6CRATE-VERIFY ?auto_169531 ?auto_169532 ?auto_169533 ?auto_169535 ?auto_169534 ?auto_169536 ?auto_169537 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169595 - SURFACE
      ?auto_169596 - SURFACE
      ?auto_169597 - SURFACE
      ?auto_169599 - SURFACE
      ?auto_169598 - SURFACE
      ?auto_169600 - SURFACE
      ?auto_169601 - SURFACE
    )
    :vars
    (
      ?auto_169604 - HOIST
      ?auto_169606 - PLACE
      ?auto_169603 - PLACE
      ?auto_169602 - HOIST
      ?auto_169605 - SURFACE
      ?auto_169607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169604 ?auto_169606 ) ( SURFACE-AT ?auto_169600 ?auto_169606 ) ( CLEAR ?auto_169600 ) ( IS-CRATE ?auto_169601 ) ( not ( = ?auto_169600 ?auto_169601 ) ) ( AVAILABLE ?auto_169604 ) ( ON ?auto_169600 ?auto_169598 ) ( not ( = ?auto_169598 ?auto_169600 ) ) ( not ( = ?auto_169598 ?auto_169601 ) ) ( not ( = ?auto_169603 ?auto_169606 ) ) ( HOIST-AT ?auto_169602 ?auto_169603 ) ( not ( = ?auto_169604 ?auto_169602 ) ) ( AVAILABLE ?auto_169602 ) ( SURFACE-AT ?auto_169601 ?auto_169603 ) ( ON ?auto_169601 ?auto_169605 ) ( CLEAR ?auto_169601 ) ( not ( = ?auto_169600 ?auto_169605 ) ) ( not ( = ?auto_169601 ?auto_169605 ) ) ( not ( = ?auto_169598 ?auto_169605 ) ) ( TRUCK-AT ?auto_169607 ?auto_169606 ) ( ON ?auto_169596 ?auto_169595 ) ( ON ?auto_169597 ?auto_169596 ) ( ON ?auto_169599 ?auto_169597 ) ( ON ?auto_169598 ?auto_169599 ) ( not ( = ?auto_169595 ?auto_169596 ) ) ( not ( = ?auto_169595 ?auto_169597 ) ) ( not ( = ?auto_169595 ?auto_169599 ) ) ( not ( = ?auto_169595 ?auto_169598 ) ) ( not ( = ?auto_169595 ?auto_169600 ) ) ( not ( = ?auto_169595 ?auto_169601 ) ) ( not ( = ?auto_169595 ?auto_169605 ) ) ( not ( = ?auto_169596 ?auto_169597 ) ) ( not ( = ?auto_169596 ?auto_169599 ) ) ( not ( = ?auto_169596 ?auto_169598 ) ) ( not ( = ?auto_169596 ?auto_169600 ) ) ( not ( = ?auto_169596 ?auto_169601 ) ) ( not ( = ?auto_169596 ?auto_169605 ) ) ( not ( = ?auto_169597 ?auto_169599 ) ) ( not ( = ?auto_169597 ?auto_169598 ) ) ( not ( = ?auto_169597 ?auto_169600 ) ) ( not ( = ?auto_169597 ?auto_169601 ) ) ( not ( = ?auto_169597 ?auto_169605 ) ) ( not ( = ?auto_169599 ?auto_169598 ) ) ( not ( = ?auto_169599 ?auto_169600 ) ) ( not ( = ?auto_169599 ?auto_169601 ) ) ( not ( = ?auto_169599 ?auto_169605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169598 ?auto_169600 ?auto_169601 )
      ( MAKE-6CRATE-VERIFY ?auto_169595 ?auto_169596 ?auto_169597 ?auto_169599 ?auto_169598 ?auto_169600 ?auto_169601 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169659 - SURFACE
      ?auto_169660 - SURFACE
      ?auto_169661 - SURFACE
      ?auto_169663 - SURFACE
      ?auto_169662 - SURFACE
      ?auto_169664 - SURFACE
      ?auto_169665 - SURFACE
    )
    :vars
    (
      ?auto_169669 - HOIST
      ?auto_169667 - PLACE
      ?auto_169668 - PLACE
      ?auto_169671 - HOIST
      ?auto_169666 - SURFACE
      ?auto_169670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169669 ?auto_169667 ) ( IS-CRATE ?auto_169665 ) ( not ( = ?auto_169664 ?auto_169665 ) ) ( not ( = ?auto_169662 ?auto_169664 ) ) ( not ( = ?auto_169662 ?auto_169665 ) ) ( not ( = ?auto_169668 ?auto_169667 ) ) ( HOIST-AT ?auto_169671 ?auto_169668 ) ( not ( = ?auto_169669 ?auto_169671 ) ) ( AVAILABLE ?auto_169671 ) ( SURFACE-AT ?auto_169665 ?auto_169668 ) ( ON ?auto_169665 ?auto_169666 ) ( CLEAR ?auto_169665 ) ( not ( = ?auto_169664 ?auto_169666 ) ) ( not ( = ?auto_169665 ?auto_169666 ) ) ( not ( = ?auto_169662 ?auto_169666 ) ) ( TRUCK-AT ?auto_169670 ?auto_169667 ) ( SURFACE-AT ?auto_169662 ?auto_169667 ) ( CLEAR ?auto_169662 ) ( LIFTING ?auto_169669 ?auto_169664 ) ( IS-CRATE ?auto_169664 ) ( ON ?auto_169660 ?auto_169659 ) ( ON ?auto_169661 ?auto_169660 ) ( ON ?auto_169663 ?auto_169661 ) ( ON ?auto_169662 ?auto_169663 ) ( not ( = ?auto_169659 ?auto_169660 ) ) ( not ( = ?auto_169659 ?auto_169661 ) ) ( not ( = ?auto_169659 ?auto_169663 ) ) ( not ( = ?auto_169659 ?auto_169662 ) ) ( not ( = ?auto_169659 ?auto_169664 ) ) ( not ( = ?auto_169659 ?auto_169665 ) ) ( not ( = ?auto_169659 ?auto_169666 ) ) ( not ( = ?auto_169660 ?auto_169661 ) ) ( not ( = ?auto_169660 ?auto_169663 ) ) ( not ( = ?auto_169660 ?auto_169662 ) ) ( not ( = ?auto_169660 ?auto_169664 ) ) ( not ( = ?auto_169660 ?auto_169665 ) ) ( not ( = ?auto_169660 ?auto_169666 ) ) ( not ( = ?auto_169661 ?auto_169663 ) ) ( not ( = ?auto_169661 ?auto_169662 ) ) ( not ( = ?auto_169661 ?auto_169664 ) ) ( not ( = ?auto_169661 ?auto_169665 ) ) ( not ( = ?auto_169661 ?auto_169666 ) ) ( not ( = ?auto_169663 ?auto_169662 ) ) ( not ( = ?auto_169663 ?auto_169664 ) ) ( not ( = ?auto_169663 ?auto_169665 ) ) ( not ( = ?auto_169663 ?auto_169666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169662 ?auto_169664 ?auto_169665 )
      ( MAKE-6CRATE-VERIFY ?auto_169659 ?auto_169660 ?auto_169661 ?auto_169663 ?auto_169662 ?auto_169664 ?auto_169665 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169723 - SURFACE
      ?auto_169724 - SURFACE
      ?auto_169725 - SURFACE
      ?auto_169727 - SURFACE
      ?auto_169726 - SURFACE
      ?auto_169728 - SURFACE
      ?auto_169729 - SURFACE
    )
    :vars
    (
      ?auto_169734 - HOIST
      ?auto_169732 - PLACE
      ?auto_169731 - PLACE
      ?auto_169733 - HOIST
      ?auto_169730 - SURFACE
      ?auto_169735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169734 ?auto_169732 ) ( IS-CRATE ?auto_169729 ) ( not ( = ?auto_169728 ?auto_169729 ) ) ( not ( = ?auto_169726 ?auto_169728 ) ) ( not ( = ?auto_169726 ?auto_169729 ) ) ( not ( = ?auto_169731 ?auto_169732 ) ) ( HOIST-AT ?auto_169733 ?auto_169731 ) ( not ( = ?auto_169734 ?auto_169733 ) ) ( AVAILABLE ?auto_169733 ) ( SURFACE-AT ?auto_169729 ?auto_169731 ) ( ON ?auto_169729 ?auto_169730 ) ( CLEAR ?auto_169729 ) ( not ( = ?auto_169728 ?auto_169730 ) ) ( not ( = ?auto_169729 ?auto_169730 ) ) ( not ( = ?auto_169726 ?auto_169730 ) ) ( TRUCK-AT ?auto_169735 ?auto_169732 ) ( SURFACE-AT ?auto_169726 ?auto_169732 ) ( CLEAR ?auto_169726 ) ( IS-CRATE ?auto_169728 ) ( AVAILABLE ?auto_169734 ) ( IN ?auto_169728 ?auto_169735 ) ( ON ?auto_169724 ?auto_169723 ) ( ON ?auto_169725 ?auto_169724 ) ( ON ?auto_169727 ?auto_169725 ) ( ON ?auto_169726 ?auto_169727 ) ( not ( = ?auto_169723 ?auto_169724 ) ) ( not ( = ?auto_169723 ?auto_169725 ) ) ( not ( = ?auto_169723 ?auto_169727 ) ) ( not ( = ?auto_169723 ?auto_169726 ) ) ( not ( = ?auto_169723 ?auto_169728 ) ) ( not ( = ?auto_169723 ?auto_169729 ) ) ( not ( = ?auto_169723 ?auto_169730 ) ) ( not ( = ?auto_169724 ?auto_169725 ) ) ( not ( = ?auto_169724 ?auto_169727 ) ) ( not ( = ?auto_169724 ?auto_169726 ) ) ( not ( = ?auto_169724 ?auto_169728 ) ) ( not ( = ?auto_169724 ?auto_169729 ) ) ( not ( = ?auto_169724 ?auto_169730 ) ) ( not ( = ?auto_169725 ?auto_169727 ) ) ( not ( = ?auto_169725 ?auto_169726 ) ) ( not ( = ?auto_169725 ?auto_169728 ) ) ( not ( = ?auto_169725 ?auto_169729 ) ) ( not ( = ?auto_169725 ?auto_169730 ) ) ( not ( = ?auto_169727 ?auto_169726 ) ) ( not ( = ?auto_169727 ?auto_169728 ) ) ( not ( = ?auto_169727 ?auto_169729 ) ) ( not ( = ?auto_169727 ?auto_169730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169726 ?auto_169728 ?auto_169729 )
      ( MAKE-6CRATE-VERIFY ?auto_169723 ?auto_169724 ?auto_169725 ?auto_169727 ?auto_169726 ?auto_169728 ?auto_169729 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171633 - SURFACE
      ?auto_171634 - SURFACE
      ?auto_171635 - SURFACE
      ?auto_171637 - SURFACE
      ?auto_171636 - SURFACE
      ?auto_171638 - SURFACE
      ?auto_171639 - SURFACE
      ?auto_171640 - SURFACE
    )
    :vars
    (
      ?auto_171642 - HOIST
      ?auto_171641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171642 ?auto_171641 ) ( SURFACE-AT ?auto_171639 ?auto_171641 ) ( CLEAR ?auto_171639 ) ( LIFTING ?auto_171642 ?auto_171640 ) ( IS-CRATE ?auto_171640 ) ( not ( = ?auto_171639 ?auto_171640 ) ) ( ON ?auto_171634 ?auto_171633 ) ( ON ?auto_171635 ?auto_171634 ) ( ON ?auto_171637 ?auto_171635 ) ( ON ?auto_171636 ?auto_171637 ) ( ON ?auto_171638 ?auto_171636 ) ( ON ?auto_171639 ?auto_171638 ) ( not ( = ?auto_171633 ?auto_171634 ) ) ( not ( = ?auto_171633 ?auto_171635 ) ) ( not ( = ?auto_171633 ?auto_171637 ) ) ( not ( = ?auto_171633 ?auto_171636 ) ) ( not ( = ?auto_171633 ?auto_171638 ) ) ( not ( = ?auto_171633 ?auto_171639 ) ) ( not ( = ?auto_171633 ?auto_171640 ) ) ( not ( = ?auto_171634 ?auto_171635 ) ) ( not ( = ?auto_171634 ?auto_171637 ) ) ( not ( = ?auto_171634 ?auto_171636 ) ) ( not ( = ?auto_171634 ?auto_171638 ) ) ( not ( = ?auto_171634 ?auto_171639 ) ) ( not ( = ?auto_171634 ?auto_171640 ) ) ( not ( = ?auto_171635 ?auto_171637 ) ) ( not ( = ?auto_171635 ?auto_171636 ) ) ( not ( = ?auto_171635 ?auto_171638 ) ) ( not ( = ?auto_171635 ?auto_171639 ) ) ( not ( = ?auto_171635 ?auto_171640 ) ) ( not ( = ?auto_171637 ?auto_171636 ) ) ( not ( = ?auto_171637 ?auto_171638 ) ) ( not ( = ?auto_171637 ?auto_171639 ) ) ( not ( = ?auto_171637 ?auto_171640 ) ) ( not ( = ?auto_171636 ?auto_171638 ) ) ( not ( = ?auto_171636 ?auto_171639 ) ) ( not ( = ?auto_171636 ?auto_171640 ) ) ( not ( = ?auto_171638 ?auto_171639 ) ) ( not ( = ?auto_171638 ?auto_171640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_171639 ?auto_171640 )
      ( MAKE-7CRATE-VERIFY ?auto_171633 ?auto_171634 ?auto_171635 ?auto_171637 ?auto_171636 ?auto_171638 ?auto_171639 ?auto_171640 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171688 - SURFACE
      ?auto_171689 - SURFACE
      ?auto_171690 - SURFACE
      ?auto_171692 - SURFACE
      ?auto_171691 - SURFACE
      ?auto_171693 - SURFACE
      ?auto_171694 - SURFACE
      ?auto_171695 - SURFACE
    )
    :vars
    (
      ?auto_171696 - HOIST
      ?auto_171698 - PLACE
      ?auto_171697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_171696 ?auto_171698 ) ( SURFACE-AT ?auto_171694 ?auto_171698 ) ( CLEAR ?auto_171694 ) ( IS-CRATE ?auto_171695 ) ( not ( = ?auto_171694 ?auto_171695 ) ) ( TRUCK-AT ?auto_171697 ?auto_171698 ) ( AVAILABLE ?auto_171696 ) ( IN ?auto_171695 ?auto_171697 ) ( ON ?auto_171694 ?auto_171693 ) ( not ( = ?auto_171693 ?auto_171694 ) ) ( not ( = ?auto_171693 ?auto_171695 ) ) ( ON ?auto_171689 ?auto_171688 ) ( ON ?auto_171690 ?auto_171689 ) ( ON ?auto_171692 ?auto_171690 ) ( ON ?auto_171691 ?auto_171692 ) ( ON ?auto_171693 ?auto_171691 ) ( not ( = ?auto_171688 ?auto_171689 ) ) ( not ( = ?auto_171688 ?auto_171690 ) ) ( not ( = ?auto_171688 ?auto_171692 ) ) ( not ( = ?auto_171688 ?auto_171691 ) ) ( not ( = ?auto_171688 ?auto_171693 ) ) ( not ( = ?auto_171688 ?auto_171694 ) ) ( not ( = ?auto_171688 ?auto_171695 ) ) ( not ( = ?auto_171689 ?auto_171690 ) ) ( not ( = ?auto_171689 ?auto_171692 ) ) ( not ( = ?auto_171689 ?auto_171691 ) ) ( not ( = ?auto_171689 ?auto_171693 ) ) ( not ( = ?auto_171689 ?auto_171694 ) ) ( not ( = ?auto_171689 ?auto_171695 ) ) ( not ( = ?auto_171690 ?auto_171692 ) ) ( not ( = ?auto_171690 ?auto_171691 ) ) ( not ( = ?auto_171690 ?auto_171693 ) ) ( not ( = ?auto_171690 ?auto_171694 ) ) ( not ( = ?auto_171690 ?auto_171695 ) ) ( not ( = ?auto_171692 ?auto_171691 ) ) ( not ( = ?auto_171692 ?auto_171693 ) ) ( not ( = ?auto_171692 ?auto_171694 ) ) ( not ( = ?auto_171692 ?auto_171695 ) ) ( not ( = ?auto_171691 ?auto_171693 ) ) ( not ( = ?auto_171691 ?auto_171694 ) ) ( not ( = ?auto_171691 ?auto_171695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171693 ?auto_171694 ?auto_171695 )
      ( MAKE-7CRATE-VERIFY ?auto_171688 ?auto_171689 ?auto_171690 ?auto_171692 ?auto_171691 ?auto_171693 ?auto_171694 ?auto_171695 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171751 - SURFACE
      ?auto_171752 - SURFACE
      ?auto_171753 - SURFACE
      ?auto_171755 - SURFACE
      ?auto_171754 - SURFACE
      ?auto_171756 - SURFACE
      ?auto_171757 - SURFACE
      ?auto_171758 - SURFACE
    )
    :vars
    (
      ?auto_171759 - HOIST
      ?auto_171760 - PLACE
      ?auto_171762 - TRUCK
      ?auto_171761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171759 ?auto_171760 ) ( SURFACE-AT ?auto_171757 ?auto_171760 ) ( CLEAR ?auto_171757 ) ( IS-CRATE ?auto_171758 ) ( not ( = ?auto_171757 ?auto_171758 ) ) ( AVAILABLE ?auto_171759 ) ( IN ?auto_171758 ?auto_171762 ) ( ON ?auto_171757 ?auto_171756 ) ( not ( = ?auto_171756 ?auto_171757 ) ) ( not ( = ?auto_171756 ?auto_171758 ) ) ( TRUCK-AT ?auto_171762 ?auto_171761 ) ( not ( = ?auto_171761 ?auto_171760 ) ) ( ON ?auto_171752 ?auto_171751 ) ( ON ?auto_171753 ?auto_171752 ) ( ON ?auto_171755 ?auto_171753 ) ( ON ?auto_171754 ?auto_171755 ) ( ON ?auto_171756 ?auto_171754 ) ( not ( = ?auto_171751 ?auto_171752 ) ) ( not ( = ?auto_171751 ?auto_171753 ) ) ( not ( = ?auto_171751 ?auto_171755 ) ) ( not ( = ?auto_171751 ?auto_171754 ) ) ( not ( = ?auto_171751 ?auto_171756 ) ) ( not ( = ?auto_171751 ?auto_171757 ) ) ( not ( = ?auto_171751 ?auto_171758 ) ) ( not ( = ?auto_171752 ?auto_171753 ) ) ( not ( = ?auto_171752 ?auto_171755 ) ) ( not ( = ?auto_171752 ?auto_171754 ) ) ( not ( = ?auto_171752 ?auto_171756 ) ) ( not ( = ?auto_171752 ?auto_171757 ) ) ( not ( = ?auto_171752 ?auto_171758 ) ) ( not ( = ?auto_171753 ?auto_171755 ) ) ( not ( = ?auto_171753 ?auto_171754 ) ) ( not ( = ?auto_171753 ?auto_171756 ) ) ( not ( = ?auto_171753 ?auto_171757 ) ) ( not ( = ?auto_171753 ?auto_171758 ) ) ( not ( = ?auto_171755 ?auto_171754 ) ) ( not ( = ?auto_171755 ?auto_171756 ) ) ( not ( = ?auto_171755 ?auto_171757 ) ) ( not ( = ?auto_171755 ?auto_171758 ) ) ( not ( = ?auto_171754 ?auto_171756 ) ) ( not ( = ?auto_171754 ?auto_171757 ) ) ( not ( = ?auto_171754 ?auto_171758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171756 ?auto_171757 ?auto_171758 )
      ( MAKE-7CRATE-VERIFY ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171755 ?auto_171754 ?auto_171756 ?auto_171757 ?auto_171758 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171821 - SURFACE
      ?auto_171822 - SURFACE
      ?auto_171823 - SURFACE
      ?auto_171825 - SURFACE
      ?auto_171824 - SURFACE
      ?auto_171826 - SURFACE
      ?auto_171827 - SURFACE
      ?auto_171828 - SURFACE
    )
    :vars
    (
      ?auto_171829 - HOIST
      ?auto_171833 - PLACE
      ?auto_171830 - TRUCK
      ?auto_171832 - PLACE
      ?auto_171831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_171829 ?auto_171833 ) ( SURFACE-AT ?auto_171827 ?auto_171833 ) ( CLEAR ?auto_171827 ) ( IS-CRATE ?auto_171828 ) ( not ( = ?auto_171827 ?auto_171828 ) ) ( AVAILABLE ?auto_171829 ) ( ON ?auto_171827 ?auto_171826 ) ( not ( = ?auto_171826 ?auto_171827 ) ) ( not ( = ?auto_171826 ?auto_171828 ) ) ( TRUCK-AT ?auto_171830 ?auto_171832 ) ( not ( = ?auto_171832 ?auto_171833 ) ) ( HOIST-AT ?auto_171831 ?auto_171832 ) ( LIFTING ?auto_171831 ?auto_171828 ) ( not ( = ?auto_171829 ?auto_171831 ) ) ( ON ?auto_171822 ?auto_171821 ) ( ON ?auto_171823 ?auto_171822 ) ( ON ?auto_171825 ?auto_171823 ) ( ON ?auto_171824 ?auto_171825 ) ( ON ?auto_171826 ?auto_171824 ) ( not ( = ?auto_171821 ?auto_171822 ) ) ( not ( = ?auto_171821 ?auto_171823 ) ) ( not ( = ?auto_171821 ?auto_171825 ) ) ( not ( = ?auto_171821 ?auto_171824 ) ) ( not ( = ?auto_171821 ?auto_171826 ) ) ( not ( = ?auto_171821 ?auto_171827 ) ) ( not ( = ?auto_171821 ?auto_171828 ) ) ( not ( = ?auto_171822 ?auto_171823 ) ) ( not ( = ?auto_171822 ?auto_171825 ) ) ( not ( = ?auto_171822 ?auto_171824 ) ) ( not ( = ?auto_171822 ?auto_171826 ) ) ( not ( = ?auto_171822 ?auto_171827 ) ) ( not ( = ?auto_171822 ?auto_171828 ) ) ( not ( = ?auto_171823 ?auto_171825 ) ) ( not ( = ?auto_171823 ?auto_171824 ) ) ( not ( = ?auto_171823 ?auto_171826 ) ) ( not ( = ?auto_171823 ?auto_171827 ) ) ( not ( = ?auto_171823 ?auto_171828 ) ) ( not ( = ?auto_171825 ?auto_171824 ) ) ( not ( = ?auto_171825 ?auto_171826 ) ) ( not ( = ?auto_171825 ?auto_171827 ) ) ( not ( = ?auto_171825 ?auto_171828 ) ) ( not ( = ?auto_171824 ?auto_171826 ) ) ( not ( = ?auto_171824 ?auto_171827 ) ) ( not ( = ?auto_171824 ?auto_171828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171826 ?auto_171827 ?auto_171828 )
      ( MAKE-7CRATE-VERIFY ?auto_171821 ?auto_171822 ?auto_171823 ?auto_171825 ?auto_171824 ?auto_171826 ?auto_171827 ?auto_171828 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171898 - SURFACE
      ?auto_171899 - SURFACE
      ?auto_171900 - SURFACE
      ?auto_171902 - SURFACE
      ?auto_171901 - SURFACE
      ?auto_171903 - SURFACE
      ?auto_171904 - SURFACE
      ?auto_171905 - SURFACE
    )
    :vars
    (
      ?auto_171910 - HOIST
      ?auto_171906 - PLACE
      ?auto_171907 - TRUCK
      ?auto_171909 - PLACE
      ?auto_171911 - HOIST
      ?auto_171908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171910 ?auto_171906 ) ( SURFACE-AT ?auto_171904 ?auto_171906 ) ( CLEAR ?auto_171904 ) ( IS-CRATE ?auto_171905 ) ( not ( = ?auto_171904 ?auto_171905 ) ) ( AVAILABLE ?auto_171910 ) ( ON ?auto_171904 ?auto_171903 ) ( not ( = ?auto_171903 ?auto_171904 ) ) ( not ( = ?auto_171903 ?auto_171905 ) ) ( TRUCK-AT ?auto_171907 ?auto_171909 ) ( not ( = ?auto_171909 ?auto_171906 ) ) ( HOIST-AT ?auto_171911 ?auto_171909 ) ( not ( = ?auto_171910 ?auto_171911 ) ) ( AVAILABLE ?auto_171911 ) ( SURFACE-AT ?auto_171905 ?auto_171909 ) ( ON ?auto_171905 ?auto_171908 ) ( CLEAR ?auto_171905 ) ( not ( = ?auto_171904 ?auto_171908 ) ) ( not ( = ?auto_171905 ?auto_171908 ) ) ( not ( = ?auto_171903 ?auto_171908 ) ) ( ON ?auto_171899 ?auto_171898 ) ( ON ?auto_171900 ?auto_171899 ) ( ON ?auto_171902 ?auto_171900 ) ( ON ?auto_171901 ?auto_171902 ) ( ON ?auto_171903 ?auto_171901 ) ( not ( = ?auto_171898 ?auto_171899 ) ) ( not ( = ?auto_171898 ?auto_171900 ) ) ( not ( = ?auto_171898 ?auto_171902 ) ) ( not ( = ?auto_171898 ?auto_171901 ) ) ( not ( = ?auto_171898 ?auto_171903 ) ) ( not ( = ?auto_171898 ?auto_171904 ) ) ( not ( = ?auto_171898 ?auto_171905 ) ) ( not ( = ?auto_171898 ?auto_171908 ) ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171902 ) ) ( not ( = ?auto_171899 ?auto_171901 ) ) ( not ( = ?auto_171899 ?auto_171903 ) ) ( not ( = ?auto_171899 ?auto_171904 ) ) ( not ( = ?auto_171899 ?auto_171905 ) ) ( not ( = ?auto_171899 ?auto_171908 ) ) ( not ( = ?auto_171900 ?auto_171902 ) ) ( not ( = ?auto_171900 ?auto_171901 ) ) ( not ( = ?auto_171900 ?auto_171903 ) ) ( not ( = ?auto_171900 ?auto_171904 ) ) ( not ( = ?auto_171900 ?auto_171905 ) ) ( not ( = ?auto_171900 ?auto_171908 ) ) ( not ( = ?auto_171902 ?auto_171901 ) ) ( not ( = ?auto_171902 ?auto_171903 ) ) ( not ( = ?auto_171902 ?auto_171904 ) ) ( not ( = ?auto_171902 ?auto_171905 ) ) ( not ( = ?auto_171902 ?auto_171908 ) ) ( not ( = ?auto_171901 ?auto_171903 ) ) ( not ( = ?auto_171901 ?auto_171904 ) ) ( not ( = ?auto_171901 ?auto_171905 ) ) ( not ( = ?auto_171901 ?auto_171908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171903 ?auto_171904 ?auto_171905 )
      ( MAKE-7CRATE-VERIFY ?auto_171898 ?auto_171899 ?auto_171900 ?auto_171902 ?auto_171901 ?auto_171903 ?auto_171904 ?auto_171905 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171976 - SURFACE
      ?auto_171977 - SURFACE
      ?auto_171978 - SURFACE
      ?auto_171980 - SURFACE
      ?auto_171979 - SURFACE
      ?auto_171981 - SURFACE
      ?auto_171982 - SURFACE
      ?auto_171983 - SURFACE
    )
    :vars
    (
      ?auto_171989 - HOIST
      ?auto_171987 - PLACE
      ?auto_171984 - PLACE
      ?auto_171988 - HOIST
      ?auto_171986 - SURFACE
      ?auto_171985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_171989 ?auto_171987 ) ( SURFACE-AT ?auto_171982 ?auto_171987 ) ( CLEAR ?auto_171982 ) ( IS-CRATE ?auto_171983 ) ( not ( = ?auto_171982 ?auto_171983 ) ) ( AVAILABLE ?auto_171989 ) ( ON ?auto_171982 ?auto_171981 ) ( not ( = ?auto_171981 ?auto_171982 ) ) ( not ( = ?auto_171981 ?auto_171983 ) ) ( not ( = ?auto_171984 ?auto_171987 ) ) ( HOIST-AT ?auto_171988 ?auto_171984 ) ( not ( = ?auto_171989 ?auto_171988 ) ) ( AVAILABLE ?auto_171988 ) ( SURFACE-AT ?auto_171983 ?auto_171984 ) ( ON ?auto_171983 ?auto_171986 ) ( CLEAR ?auto_171983 ) ( not ( = ?auto_171982 ?auto_171986 ) ) ( not ( = ?auto_171983 ?auto_171986 ) ) ( not ( = ?auto_171981 ?auto_171986 ) ) ( TRUCK-AT ?auto_171985 ?auto_171987 ) ( ON ?auto_171977 ?auto_171976 ) ( ON ?auto_171978 ?auto_171977 ) ( ON ?auto_171980 ?auto_171978 ) ( ON ?auto_171979 ?auto_171980 ) ( ON ?auto_171981 ?auto_171979 ) ( not ( = ?auto_171976 ?auto_171977 ) ) ( not ( = ?auto_171976 ?auto_171978 ) ) ( not ( = ?auto_171976 ?auto_171980 ) ) ( not ( = ?auto_171976 ?auto_171979 ) ) ( not ( = ?auto_171976 ?auto_171981 ) ) ( not ( = ?auto_171976 ?auto_171982 ) ) ( not ( = ?auto_171976 ?auto_171983 ) ) ( not ( = ?auto_171976 ?auto_171986 ) ) ( not ( = ?auto_171977 ?auto_171978 ) ) ( not ( = ?auto_171977 ?auto_171980 ) ) ( not ( = ?auto_171977 ?auto_171979 ) ) ( not ( = ?auto_171977 ?auto_171981 ) ) ( not ( = ?auto_171977 ?auto_171982 ) ) ( not ( = ?auto_171977 ?auto_171983 ) ) ( not ( = ?auto_171977 ?auto_171986 ) ) ( not ( = ?auto_171978 ?auto_171980 ) ) ( not ( = ?auto_171978 ?auto_171979 ) ) ( not ( = ?auto_171978 ?auto_171981 ) ) ( not ( = ?auto_171978 ?auto_171982 ) ) ( not ( = ?auto_171978 ?auto_171983 ) ) ( not ( = ?auto_171978 ?auto_171986 ) ) ( not ( = ?auto_171980 ?auto_171979 ) ) ( not ( = ?auto_171980 ?auto_171981 ) ) ( not ( = ?auto_171980 ?auto_171982 ) ) ( not ( = ?auto_171980 ?auto_171983 ) ) ( not ( = ?auto_171980 ?auto_171986 ) ) ( not ( = ?auto_171979 ?auto_171981 ) ) ( not ( = ?auto_171979 ?auto_171982 ) ) ( not ( = ?auto_171979 ?auto_171983 ) ) ( not ( = ?auto_171979 ?auto_171986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171981 ?auto_171982 ?auto_171983 )
      ( MAKE-7CRATE-VERIFY ?auto_171976 ?auto_171977 ?auto_171978 ?auto_171980 ?auto_171979 ?auto_171981 ?auto_171982 ?auto_171983 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172054 - SURFACE
      ?auto_172055 - SURFACE
      ?auto_172056 - SURFACE
      ?auto_172058 - SURFACE
      ?auto_172057 - SURFACE
      ?auto_172059 - SURFACE
      ?auto_172060 - SURFACE
      ?auto_172061 - SURFACE
    )
    :vars
    (
      ?auto_172065 - HOIST
      ?auto_172063 - PLACE
      ?auto_172066 - PLACE
      ?auto_172062 - HOIST
      ?auto_172064 - SURFACE
      ?auto_172067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172065 ?auto_172063 ) ( IS-CRATE ?auto_172061 ) ( not ( = ?auto_172060 ?auto_172061 ) ) ( not ( = ?auto_172059 ?auto_172060 ) ) ( not ( = ?auto_172059 ?auto_172061 ) ) ( not ( = ?auto_172066 ?auto_172063 ) ) ( HOIST-AT ?auto_172062 ?auto_172066 ) ( not ( = ?auto_172065 ?auto_172062 ) ) ( AVAILABLE ?auto_172062 ) ( SURFACE-AT ?auto_172061 ?auto_172066 ) ( ON ?auto_172061 ?auto_172064 ) ( CLEAR ?auto_172061 ) ( not ( = ?auto_172060 ?auto_172064 ) ) ( not ( = ?auto_172061 ?auto_172064 ) ) ( not ( = ?auto_172059 ?auto_172064 ) ) ( TRUCK-AT ?auto_172067 ?auto_172063 ) ( SURFACE-AT ?auto_172059 ?auto_172063 ) ( CLEAR ?auto_172059 ) ( LIFTING ?auto_172065 ?auto_172060 ) ( IS-CRATE ?auto_172060 ) ( ON ?auto_172055 ?auto_172054 ) ( ON ?auto_172056 ?auto_172055 ) ( ON ?auto_172058 ?auto_172056 ) ( ON ?auto_172057 ?auto_172058 ) ( ON ?auto_172059 ?auto_172057 ) ( not ( = ?auto_172054 ?auto_172055 ) ) ( not ( = ?auto_172054 ?auto_172056 ) ) ( not ( = ?auto_172054 ?auto_172058 ) ) ( not ( = ?auto_172054 ?auto_172057 ) ) ( not ( = ?auto_172054 ?auto_172059 ) ) ( not ( = ?auto_172054 ?auto_172060 ) ) ( not ( = ?auto_172054 ?auto_172061 ) ) ( not ( = ?auto_172054 ?auto_172064 ) ) ( not ( = ?auto_172055 ?auto_172056 ) ) ( not ( = ?auto_172055 ?auto_172058 ) ) ( not ( = ?auto_172055 ?auto_172057 ) ) ( not ( = ?auto_172055 ?auto_172059 ) ) ( not ( = ?auto_172055 ?auto_172060 ) ) ( not ( = ?auto_172055 ?auto_172061 ) ) ( not ( = ?auto_172055 ?auto_172064 ) ) ( not ( = ?auto_172056 ?auto_172058 ) ) ( not ( = ?auto_172056 ?auto_172057 ) ) ( not ( = ?auto_172056 ?auto_172059 ) ) ( not ( = ?auto_172056 ?auto_172060 ) ) ( not ( = ?auto_172056 ?auto_172061 ) ) ( not ( = ?auto_172056 ?auto_172064 ) ) ( not ( = ?auto_172058 ?auto_172057 ) ) ( not ( = ?auto_172058 ?auto_172059 ) ) ( not ( = ?auto_172058 ?auto_172060 ) ) ( not ( = ?auto_172058 ?auto_172061 ) ) ( not ( = ?auto_172058 ?auto_172064 ) ) ( not ( = ?auto_172057 ?auto_172059 ) ) ( not ( = ?auto_172057 ?auto_172060 ) ) ( not ( = ?auto_172057 ?auto_172061 ) ) ( not ( = ?auto_172057 ?auto_172064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172059 ?auto_172060 ?auto_172061 )
      ( MAKE-7CRATE-VERIFY ?auto_172054 ?auto_172055 ?auto_172056 ?auto_172058 ?auto_172057 ?auto_172059 ?auto_172060 ?auto_172061 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172132 - SURFACE
      ?auto_172133 - SURFACE
      ?auto_172134 - SURFACE
      ?auto_172136 - SURFACE
      ?auto_172135 - SURFACE
      ?auto_172137 - SURFACE
      ?auto_172138 - SURFACE
      ?auto_172139 - SURFACE
    )
    :vars
    (
      ?auto_172143 - HOIST
      ?auto_172141 - PLACE
      ?auto_172140 - PLACE
      ?auto_172145 - HOIST
      ?auto_172144 - SURFACE
      ?auto_172142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172143 ?auto_172141 ) ( IS-CRATE ?auto_172139 ) ( not ( = ?auto_172138 ?auto_172139 ) ) ( not ( = ?auto_172137 ?auto_172138 ) ) ( not ( = ?auto_172137 ?auto_172139 ) ) ( not ( = ?auto_172140 ?auto_172141 ) ) ( HOIST-AT ?auto_172145 ?auto_172140 ) ( not ( = ?auto_172143 ?auto_172145 ) ) ( AVAILABLE ?auto_172145 ) ( SURFACE-AT ?auto_172139 ?auto_172140 ) ( ON ?auto_172139 ?auto_172144 ) ( CLEAR ?auto_172139 ) ( not ( = ?auto_172138 ?auto_172144 ) ) ( not ( = ?auto_172139 ?auto_172144 ) ) ( not ( = ?auto_172137 ?auto_172144 ) ) ( TRUCK-AT ?auto_172142 ?auto_172141 ) ( SURFACE-AT ?auto_172137 ?auto_172141 ) ( CLEAR ?auto_172137 ) ( IS-CRATE ?auto_172138 ) ( AVAILABLE ?auto_172143 ) ( IN ?auto_172138 ?auto_172142 ) ( ON ?auto_172133 ?auto_172132 ) ( ON ?auto_172134 ?auto_172133 ) ( ON ?auto_172136 ?auto_172134 ) ( ON ?auto_172135 ?auto_172136 ) ( ON ?auto_172137 ?auto_172135 ) ( not ( = ?auto_172132 ?auto_172133 ) ) ( not ( = ?auto_172132 ?auto_172134 ) ) ( not ( = ?auto_172132 ?auto_172136 ) ) ( not ( = ?auto_172132 ?auto_172135 ) ) ( not ( = ?auto_172132 ?auto_172137 ) ) ( not ( = ?auto_172132 ?auto_172138 ) ) ( not ( = ?auto_172132 ?auto_172139 ) ) ( not ( = ?auto_172132 ?auto_172144 ) ) ( not ( = ?auto_172133 ?auto_172134 ) ) ( not ( = ?auto_172133 ?auto_172136 ) ) ( not ( = ?auto_172133 ?auto_172135 ) ) ( not ( = ?auto_172133 ?auto_172137 ) ) ( not ( = ?auto_172133 ?auto_172138 ) ) ( not ( = ?auto_172133 ?auto_172139 ) ) ( not ( = ?auto_172133 ?auto_172144 ) ) ( not ( = ?auto_172134 ?auto_172136 ) ) ( not ( = ?auto_172134 ?auto_172135 ) ) ( not ( = ?auto_172134 ?auto_172137 ) ) ( not ( = ?auto_172134 ?auto_172138 ) ) ( not ( = ?auto_172134 ?auto_172139 ) ) ( not ( = ?auto_172134 ?auto_172144 ) ) ( not ( = ?auto_172136 ?auto_172135 ) ) ( not ( = ?auto_172136 ?auto_172137 ) ) ( not ( = ?auto_172136 ?auto_172138 ) ) ( not ( = ?auto_172136 ?auto_172139 ) ) ( not ( = ?auto_172136 ?auto_172144 ) ) ( not ( = ?auto_172135 ?auto_172137 ) ) ( not ( = ?auto_172135 ?auto_172138 ) ) ( not ( = ?auto_172135 ?auto_172139 ) ) ( not ( = ?auto_172135 ?auto_172144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172137 ?auto_172138 ?auto_172139 )
      ( MAKE-7CRATE-VERIFY ?auto_172132 ?auto_172133 ?auto_172134 ?auto_172136 ?auto_172135 ?auto_172137 ?auto_172138 ?auto_172139 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_174987 - SURFACE
      ?auto_174988 - SURFACE
      ?auto_174989 - SURFACE
      ?auto_174991 - SURFACE
      ?auto_174990 - SURFACE
      ?auto_174992 - SURFACE
      ?auto_174993 - SURFACE
      ?auto_174994 - SURFACE
      ?auto_174995 - SURFACE
    )
    :vars
    (
      ?auto_174997 - HOIST
      ?auto_174996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_174997 ?auto_174996 ) ( SURFACE-AT ?auto_174994 ?auto_174996 ) ( CLEAR ?auto_174994 ) ( LIFTING ?auto_174997 ?auto_174995 ) ( IS-CRATE ?auto_174995 ) ( not ( = ?auto_174994 ?auto_174995 ) ) ( ON ?auto_174988 ?auto_174987 ) ( ON ?auto_174989 ?auto_174988 ) ( ON ?auto_174991 ?auto_174989 ) ( ON ?auto_174990 ?auto_174991 ) ( ON ?auto_174992 ?auto_174990 ) ( ON ?auto_174993 ?auto_174992 ) ( ON ?auto_174994 ?auto_174993 ) ( not ( = ?auto_174987 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174989 ) ) ( not ( = ?auto_174987 ?auto_174991 ) ) ( not ( = ?auto_174987 ?auto_174990 ) ) ( not ( = ?auto_174987 ?auto_174992 ) ) ( not ( = ?auto_174987 ?auto_174993 ) ) ( not ( = ?auto_174987 ?auto_174994 ) ) ( not ( = ?auto_174987 ?auto_174995 ) ) ( not ( = ?auto_174988 ?auto_174989 ) ) ( not ( = ?auto_174988 ?auto_174991 ) ) ( not ( = ?auto_174988 ?auto_174990 ) ) ( not ( = ?auto_174988 ?auto_174992 ) ) ( not ( = ?auto_174988 ?auto_174993 ) ) ( not ( = ?auto_174988 ?auto_174994 ) ) ( not ( = ?auto_174988 ?auto_174995 ) ) ( not ( = ?auto_174989 ?auto_174991 ) ) ( not ( = ?auto_174989 ?auto_174990 ) ) ( not ( = ?auto_174989 ?auto_174992 ) ) ( not ( = ?auto_174989 ?auto_174993 ) ) ( not ( = ?auto_174989 ?auto_174994 ) ) ( not ( = ?auto_174989 ?auto_174995 ) ) ( not ( = ?auto_174991 ?auto_174990 ) ) ( not ( = ?auto_174991 ?auto_174992 ) ) ( not ( = ?auto_174991 ?auto_174993 ) ) ( not ( = ?auto_174991 ?auto_174994 ) ) ( not ( = ?auto_174991 ?auto_174995 ) ) ( not ( = ?auto_174990 ?auto_174992 ) ) ( not ( = ?auto_174990 ?auto_174993 ) ) ( not ( = ?auto_174990 ?auto_174994 ) ) ( not ( = ?auto_174990 ?auto_174995 ) ) ( not ( = ?auto_174992 ?auto_174993 ) ) ( not ( = ?auto_174992 ?auto_174994 ) ) ( not ( = ?auto_174992 ?auto_174995 ) ) ( not ( = ?auto_174993 ?auto_174994 ) ) ( not ( = ?auto_174993 ?auto_174995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_174994 ?auto_174995 )
      ( MAKE-8CRATE-VERIFY ?auto_174987 ?auto_174988 ?auto_174989 ?auto_174991 ?auto_174990 ?auto_174992 ?auto_174993 ?auto_174994 ?auto_174995 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175054 - SURFACE
      ?auto_175055 - SURFACE
      ?auto_175056 - SURFACE
      ?auto_175058 - SURFACE
      ?auto_175057 - SURFACE
      ?auto_175059 - SURFACE
      ?auto_175060 - SURFACE
      ?auto_175061 - SURFACE
      ?auto_175062 - SURFACE
    )
    :vars
    (
      ?auto_175065 - HOIST
      ?auto_175064 - PLACE
      ?auto_175063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175065 ?auto_175064 ) ( SURFACE-AT ?auto_175061 ?auto_175064 ) ( CLEAR ?auto_175061 ) ( IS-CRATE ?auto_175062 ) ( not ( = ?auto_175061 ?auto_175062 ) ) ( TRUCK-AT ?auto_175063 ?auto_175064 ) ( AVAILABLE ?auto_175065 ) ( IN ?auto_175062 ?auto_175063 ) ( ON ?auto_175061 ?auto_175060 ) ( not ( = ?auto_175060 ?auto_175061 ) ) ( not ( = ?auto_175060 ?auto_175062 ) ) ( ON ?auto_175055 ?auto_175054 ) ( ON ?auto_175056 ?auto_175055 ) ( ON ?auto_175058 ?auto_175056 ) ( ON ?auto_175057 ?auto_175058 ) ( ON ?auto_175059 ?auto_175057 ) ( ON ?auto_175060 ?auto_175059 ) ( not ( = ?auto_175054 ?auto_175055 ) ) ( not ( = ?auto_175054 ?auto_175056 ) ) ( not ( = ?auto_175054 ?auto_175058 ) ) ( not ( = ?auto_175054 ?auto_175057 ) ) ( not ( = ?auto_175054 ?auto_175059 ) ) ( not ( = ?auto_175054 ?auto_175060 ) ) ( not ( = ?auto_175054 ?auto_175061 ) ) ( not ( = ?auto_175054 ?auto_175062 ) ) ( not ( = ?auto_175055 ?auto_175056 ) ) ( not ( = ?auto_175055 ?auto_175058 ) ) ( not ( = ?auto_175055 ?auto_175057 ) ) ( not ( = ?auto_175055 ?auto_175059 ) ) ( not ( = ?auto_175055 ?auto_175060 ) ) ( not ( = ?auto_175055 ?auto_175061 ) ) ( not ( = ?auto_175055 ?auto_175062 ) ) ( not ( = ?auto_175056 ?auto_175058 ) ) ( not ( = ?auto_175056 ?auto_175057 ) ) ( not ( = ?auto_175056 ?auto_175059 ) ) ( not ( = ?auto_175056 ?auto_175060 ) ) ( not ( = ?auto_175056 ?auto_175061 ) ) ( not ( = ?auto_175056 ?auto_175062 ) ) ( not ( = ?auto_175058 ?auto_175057 ) ) ( not ( = ?auto_175058 ?auto_175059 ) ) ( not ( = ?auto_175058 ?auto_175060 ) ) ( not ( = ?auto_175058 ?auto_175061 ) ) ( not ( = ?auto_175058 ?auto_175062 ) ) ( not ( = ?auto_175057 ?auto_175059 ) ) ( not ( = ?auto_175057 ?auto_175060 ) ) ( not ( = ?auto_175057 ?auto_175061 ) ) ( not ( = ?auto_175057 ?auto_175062 ) ) ( not ( = ?auto_175059 ?auto_175060 ) ) ( not ( = ?auto_175059 ?auto_175061 ) ) ( not ( = ?auto_175059 ?auto_175062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175060 ?auto_175061 ?auto_175062 )
      ( MAKE-8CRATE-VERIFY ?auto_175054 ?auto_175055 ?auto_175056 ?auto_175058 ?auto_175057 ?auto_175059 ?auto_175060 ?auto_175061 ?auto_175062 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175130 - SURFACE
      ?auto_175131 - SURFACE
      ?auto_175132 - SURFACE
      ?auto_175134 - SURFACE
      ?auto_175133 - SURFACE
      ?auto_175135 - SURFACE
      ?auto_175136 - SURFACE
      ?auto_175137 - SURFACE
      ?auto_175138 - SURFACE
    )
    :vars
    (
      ?auto_175139 - HOIST
      ?auto_175142 - PLACE
      ?auto_175140 - TRUCK
      ?auto_175141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175139 ?auto_175142 ) ( SURFACE-AT ?auto_175137 ?auto_175142 ) ( CLEAR ?auto_175137 ) ( IS-CRATE ?auto_175138 ) ( not ( = ?auto_175137 ?auto_175138 ) ) ( AVAILABLE ?auto_175139 ) ( IN ?auto_175138 ?auto_175140 ) ( ON ?auto_175137 ?auto_175136 ) ( not ( = ?auto_175136 ?auto_175137 ) ) ( not ( = ?auto_175136 ?auto_175138 ) ) ( TRUCK-AT ?auto_175140 ?auto_175141 ) ( not ( = ?auto_175141 ?auto_175142 ) ) ( ON ?auto_175131 ?auto_175130 ) ( ON ?auto_175132 ?auto_175131 ) ( ON ?auto_175134 ?auto_175132 ) ( ON ?auto_175133 ?auto_175134 ) ( ON ?auto_175135 ?auto_175133 ) ( ON ?auto_175136 ?auto_175135 ) ( not ( = ?auto_175130 ?auto_175131 ) ) ( not ( = ?auto_175130 ?auto_175132 ) ) ( not ( = ?auto_175130 ?auto_175134 ) ) ( not ( = ?auto_175130 ?auto_175133 ) ) ( not ( = ?auto_175130 ?auto_175135 ) ) ( not ( = ?auto_175130 ?auto_175136 ) ) ( not ( = ?auto_175130 ?auto_175137 ) ) ( not ( = ?auto_175130 ?auto_175138 ) ) ( not ( = ?auto_175131 ?auto_175132 ) ) ( not ( = ?auto_175131 ?auto_175134 ) ) ( not ( = ?auto_175131 ?auto_175133 ) ) ( not ( = ?auto_175131 ?auto_175135 ) ) ( not ( = ?auto_175131 ?auto_175136 ) ) ( not ( = ?auto_175131 ?auto_175137 ) ) ( not ( = ?auto_175131 ?auto_175138 ) ) ( not ( = ?auto_175132 ?auto_175134 ) ) ( not ( = ?auto_175132 ?auto_175133 ) ) ( not ( = ?auto_175132 ?auto_175135 ) ) ( not ( = ?auto_175132 ?auto_175136 ) ) ( not ( = ?auto_175132 ?auto_175137 ) ) ( not ( = ?auto_175132 ?auto_175138 ) ) ( not ( = ?auto_175134 ?auto_175133 ) ) ( not ( = ?auto_175134 ?auto_175135 ) ) ( not ( = ?auto_175134 ?auto_175136 ) ) ( not ( = ?auto_175134 ?auto_175137 ) ) ( not ( = ?auto_175134 ?auto_175138 ) ) ( not ( = ?auto_175133 ?auto_175135 ) ) ( not ( = ?auto_175133 ?auto_175136 ) ) ( not ( = ?auto_175133 ?auto_175137 ) ) ( not ( = ?auto_175133 ?auto_175138 ) ) ( not ( = ?auto_175135 ?auto_175136 ) ) ( not ( = ?auto_175135 ?auto_175137 ) ) ( not ( = ?auto_175135 ?auto_175138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175136 ?auto_175137 ?auto_175138 )
      ( MAKE-8CRATE-VERIFY ?auto_175130 ?auto_175131 ?auto_175132 ?auto_175134 ?auto_175133 ?auto_175135 ?auto_175136 ?auto_175137 ?auto_175138 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175214 - SURFACE
      ?auto_175215 - SURFACE
      ?auto_175216 - SURFACE
      ?auto_175218 - SURFACE
      ?auto_175217 - SURFACE
      ?auto_175219 - SURFACE
      ?auto_175220 - SURFACE
      ?auto_175221 - SURFACE
      ?auto_175222 - SURFACE
    )
    :vars
    (
      ?auto_175227 - HOIST
      ?auto_175223 - PLACE
      ?auto_175225 - TRUCK
      ?auto_175224 - PLACE
      ?auto_175226 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_175227 ?auto_175223 ) ( SURFACE-AT ?auto_175221 ?auto_175223 ) ( CLEAR ?auto_175221 ) ( IS-CRATE ?auto_175222 ) ( not ( = ?auto_175221 ?auto_175222 ) ) ( AVAILABLE ?auto_175227 ) ( ON ?auto_175221 ?auto_175220 ) ( not ( = ?auto_175220 ?auto_175221 ) ) ( not ( = ?auto_175220 ?auto_175222 ) ) ( TRUCK-AT ?auto_175225 ?auto_175224 ) ( not ( = ?auto_175224 ?auto_175223 ) ) ( HOIST-AT ?auto_175226 ?auto_175224 ) ( LIFTING ?auto_175226 ?auto_175222 ) ( not ( = ?auto_175227 ?auto_175226 ) ) ( ON ?auto_175215 ?auto_175214 ) ( ON ?auto_175216 ?auto_175215 ) ( ON ?auto_175218 ?auto_175216 ) ( ON ?auto_175217 ?auto_175218 ) ( ON ?auto_175219 ?auto_175217 ) ( ON ?auto_175220 ?auto_175219 ) ( not ( = ?auto_175214 ?auto_175215 ) ) ( not ( = ?auto_175214 ?auto_175216 ) ) ( not ( = ?auto_175214 ?auto_175218 ) ) ( not ( = ?auto_175214 ?auto_175217 ) ) ( not ( = ?auto_175214 ?auto_175219 ) ) ( not ( = ?auto_175214 ?auto_175220 ) ) ( not ( = ?auto_175214 ?auto_175221 ) ) ( not ( = ?auto_175214 ?auto_175222 ) ) ( not ( = ?auto_175215 ?auto_175216 ) ) ( not ( = ?auto_175215 ?auto_175218 ) ) ( not ( = ?auto_175215 ?auto_175217 ) ) ( not ( = ?auto_175215 ?auto_175219 ) ) ( not ( = ?auto_175215 ?auto_175220 ) ) ( not ( = ?auto_175215 ?auto_175221 ) ) ( not ( = ?auto_175215 ?auto_175222 ) ) ( not ( = ?auto_175216 ?auto_175218 ) ) ( not ( = ?auto_175216 ?auto_175217 ) ) ( not ( = ?auto_175216 ?auto_175219 ) ) ( not ( = ?auto_175216 ?auto_175220 ) ) ( not ( = ?auto_175216 ?auto_175221 ) ) ( not ( = ?auto_175216 ?auto_175222 ) ) ( not ( = ?auto_175218 ?auto_175217 ) ) ( not ( = ?auto_175218 ?auto_175219 ) ) ( not ( = ?auto_175218 ?auto_175220 ) ) ( not ( = ?auto_175218 ?auto_175221 ) ) ( not ( = ?auto_175218 ?auto_175222 ) ) ( not ( = ?auto_175217 ?auto_175219 ) ) ( not ( = ?auto_175217 ?auto_175220 ) ) ( not ( = ?auto_175217 ?auto_175221 ) ) ( not ( = ?auto_175217 ?auto_175222 ) ) ( not ( = ?auto_175219 ?auto_175220 ) ) ( not ( = ?auto_175219 ?auto_175221 ) ) ( not ( = ?auto_175219 ?auto_175222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175220 ?auto_175221 ?auto_175222 )
      ( MAKE-8CRATE-VERIFY ?auto_175214 ?auto_175215 ?auto_175216 ?auto_175218 ?auto_175217 ?auto_175219 ?auto_175220 ?auto_175221 ?auto_175222 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175306 - SURFACE
      ?auto_175307 - SURFACE
      ?auto_175308 - SURFACE
      ?auto_175310 - SURFACE
      ?auto_175309 - SURFACE
      ?auto_175311 - SURFACE
      ?auto_175312 - SURFACE
      ?auto_175313 - SURFACE
      ?auto_175314 - SURFACE
    )
    :vars
    (
      ?auto_175320 - HOIST
      ?auto_175315 - PLACE
      ?auto_175316 - TRUCK
      ?auto_175318 - PLACE
      ?auto_175319 - HOIST
      ?auto_175317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175320 ?auto_175315 ) ( SURFACE-AT ?auto_175313 ?auto_175315 ) ( CLEAR ?auto_175313 ) ( IS-CRATE ?auto_175314 ) ( not ( = ?auto_175313 ?auto_175314 ) ) ( AVAILABLE ?auto_175320 ) ( ON ?auto_175313 ?auto_175312 ) ( not ( = ?auto_175312 ?auto_175313 ) ) ( not ( = ?auto_175312 ?auto_175314 ) ) ( TRUCK-AT ?auto_175316 ?auto_175318 ) ( not ( = ?auto_175318 ?auto_175315 ) ) ( HOIST-AT ?auto_175319 ?auto_175318 ) ( not ( = ?auto_175320 ?auto_175319 ) ) ( AVAILABLE ?auto_175319 ) ( SURFACE-AT ?auto_175314 ?auto_175318 ) ( ON ?auto_175314 ?auto_175317 ) ( CLEAR ?auto_175314 ) ( not ( = ?auto_175313 ?auto_175317 ) ) ( not ( = ?auto_175314 ?auto_175317 ) ) ( not ( = ?auto_175312 ?auto_175317 ) ) ( ON ?auto_175307 ?auto_175306 ) ( ON ?auto_175308 ?auto_175307 ) ( ON ?auto_175310 ?auto_175308 ) ( ON ?auto_175309 ?auto_175310 ) ( ON ?auto_175311 ?auto_175309 ) ( ON ?auto_175312 ?auto_175311 ) ( not ( = ?auto_175306 ?auto_175307 ) ) ( not ( = ?auto_175306 ?auto_175308 ) ) ( not ( = ?auto_175306 ?auto_175310 ) ) ( not ( = ?auto_175306 ?auto_175309 ) ) ( not ( = ?auto_175306 ?auto_175311 ) ) ( not ( = ?auto_175306 ?auto_175312 ) ) ( not ( = ?auto_175306 ?auto_175313 ) ) ( not ( = ?auto_175306 ?auto_175314 ) ) ( not ( = ?auto_175306 ?auto_175317 ) ) ( not ( = ?auto_175307 ?auto_175308 ) ) ( not ( = ?auto_175307 ?auto_175310 ) ) ( not ( = ?auto_175307 ?auto_175309 ) ) ( not ( = ?auto_175307 ?auto_175311 ) ) ( not ( = ?auto_175307 ?auto_175312 ) ) ( not ( = ?auto_175307 ?auto_175313 ) ) ( not ( = ?auto_175307 ?auto_175314 ) ) ( not ( = ?auto_175307 ?auto_175317 ) ) ( not ( = ?auto_175308 ?auto_175310 ) ) ( not ( = ?auto_175308 ?auto_175309 ) ) ( not ( = ?auto_175308 ?auto_175311 ) ) ( not ( = ?auto_175308 ?auto_175312 ) ) ( not ( = ?auto_175308 ?auto_175313 ) ) ( not ( = ?auto_175308 ?auto_175314 ) ) ( not ( = ?auto_175308 ?auto_175317 ) ) ( not ( = ?auto_175310 ?auto_175309 ) ) ( not ( = ?auto_175310 ?auto_175311 ) ) ( not ( = ?auto_175310 ?auto_175312 ) ) ( not ( = ?auto_175310 ?auto_175313 ) ) ( not ( = ?auto_175310 ?auto_175314 ) ) ( not ( = ?auto_175310 ?auto_175317 ) ) ( not ( = ?auto_175309 ?auto_175311 ) ) ( not ( = ?auto_175309 ?auto_175312 ) ) ( not ( = ?auto_175309 ?auto_175313 ) ) ( not ( = ?auto_175309 ?auto_175314 ) ) ( not ( = ?auto_175309 ?auto_175317 ) ) ( not ( = ?auto_175311 ?auto_175312 ) ) ( not ( = ?auto_175311 ?auto_175313 ) ) ( not ( = ?auto_175311 ?auto_175314 ) ) ( not ( = ?auto_175311 ?auto_175317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175312 ?auto_175313 ?auto_175314 )
      ( MAKE-8CRATE-VERIFY ?auto_175306 ?auto_175307 ?auto_175308 ?auto_175310 ?auto_175309 ?auto_175311 ?auto_175312 ?auto_175313 ?auto_175314 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175399 - SURFACE
      ?auto_175400 - SURFACE
      ?auto_175401 - SURFACE
      ?auto_175403 - SURFACE
      ?auto_175402 - SURFACE
      ?auto_175404 - SURFACE
      ?auto_175405 - SURFACE
      ?auto_175406 - SURFACE
      ?auto_175407 - SURFACE
    )
    :vars
    (
      ?auto_175409 - HOIST
      ?auto_175412 - PLACE
      ?auto_175411 - PLACE
      ?auto_175410 - HOIST
      ?auto_175413 - SURFACE
      ?auto_175408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175409 ?auto_175412 ) ( SURFACE-AT ?auto_175406 ?auto_175412 ) ( CLEAR ?auto_175406 ) ( IS-CRATE ?auto_175407 ) ( not ( = ?auto_175406 ?auto_175407 ) ) ( AVAILABLE ?auto_175409 ) ( ON ?auto_175406 ?auto_175405 ) ( not ( = ?auto_175405 ?auto_175406 ) ) ( not ( = ?auto_175405 ?auto_175407 ) ) ( not ( = ?auto_175411 ?auto_175412 ) ) ( HOIST-AT ?auto_175410 ?auto_175411 ) ( not ( = ?auto_175409 ?auto_175410 ) ) ( AVAILABLE ?auto_175410 ) ( SURFACE-AT ?auto_175407 ?auto_175411 ) ( ON ?auto_175407 ?auto_175413 ) ( CLEAR ?auto_175407 ) ( not ( = ?auto_175406 ?auto_175413 ) ) ( not ( = ?auto_175407 ?auto_175413 ) ) ( not ( = ?auto_175405 ?auto_175413 ) ) ( TRUCK-AT ?auto_175408 ?auto_175412 ) ( ON ?auto_175400 ?auto_175399 ) ( ON ?auto_175401 ?auto_175400 ) ( ON ?auto_175403 ?auto_175401 ) ( ON ?auto_175402 ?auto_175403 ) ( ON ?auto_175404 ?auto_175402 ) ( ON ?auto_175405 ?auto_175404 ) ( not ( = ?auto_175399 ?auto_175400 ) ) ( not ( = ?auto_175399 ?auto_175401 ) ) ( not ( = ?auto_175399 ?auto_175403 ) ) ( not ( = ?auto_175399 ?auto_175402 ) ) ( not ( = ?auto_175399 ?auto_175404 ) ) ( not ( = ?auto_175399 ?auto_175405 ) ) ( not ( = ?auto_175399 ?auto_175406 ) ) ( not ( = ?auto_175399 ?auto_175407 ) ) ( not ( = ?auto_175399 ?auto_175413 ) ) ( not ( = ?auto_175400 ?auto_175401 ) ) ( not ( = ?auto_175400 ?auto_175403 ) ) ( not ( = ?auto_175400 ?auto_175402 ) ) ( not ( = ?auto_175400 ?auto_175404 ) ) ( not ( = ?auto_175400 ?auto_175405 ) ) ( not ( = ?auto_175400 ?auto_175406 ) ) ( not ( = ?auto_175400 ?auto_175407 ) ) ( not ( = ?auto_175400 ?auto_175413 ) ) ( not ( = ?auto_175401 ?auto_175403 ) ) ( not ( = ?auto_175401 ?auto_175402 ) ) ( not ( = ?auto_175401 ?auto_175404 ) ) ( not ( = ?auto_175401 ?auto_175405 ) ) ( not ( = ?auto_175401 ?auto_175406 ) ) ( not ( = ?auto_175401 ?auto_175407 ) ) ( not ( = ?auto_175401 ?auto_175413 ) ) ( not ( = ?auto_175403 ?auto_175402 ) ) ( not ( = ?auto_175403 ?auto_175404 ) ) ( not ( = ?auto_175403 ?auto_175405 ) ) ( not ( = ?auto_175403 ?auto_175406 ) ) ( not ( = ?auto_175403 ?auto_175407 ) ) ( not ( = ?auto_175403 ?auto_175413 ) ) ( not ( = ?auto_175402 ?auto_175404 ) ) ( not ( = ?auto_175402 ?auto_175405 ) ) ( not ( = ?auto_175402 ?auto_175406 ) ) ( not ( = ?auto_175402 ?auto_175407 ) ) ( not ( = ?auto_175402 ?auto_175413 ) ) ( not ( = ?auto_175404 ?auto_175405 ) ) ( not ( = ?auto_175404 ?auto_175406 ) ) ( not ( = ?auto_175404 ?auto_175407 ) ) ( not ( = ?auto_175404 ?auto_175413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175405 ?auto_175406 ?auto_175407 )
      ( MAKE-8CRATE-VERIFY ?auto_175399 ?auto_175400 ?auto_175401 ?auto_175403 ?auto_175402 ?auto_175404 ?auto_175405 ?auto_175406 ?auto_175407 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175492 - SURFACE
      ?auto_175493 - SURFACE
      ?auto_175494 - SURFACE
      ?auto_175496 - SURFACE
      ?auto_175495 - SURFACE
      ?auto_175497 - SURFACE
      ?auto_175498 - SURFACE
      ?auto_175499 - SURFACE
      ?auto_175500 - SURFACE
    )
    :vars
    (
      ?auto_175506 - HOIST
      ?auto_175502 - PLACE
      ?auto_175501 - PLACE
      ?auto_175503 - HOIST
      ?auto_175505 - SURFACE
      ?auto_175504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175506 ?auto_175502 ) ( IS-CRATE ?auto_175500 ) ( not ( = ?auto_175499 ?auto_175500 ) ) ( not ( = ?auto_175498 ?auto_175499 ) ) ( not ( = ?auto_175498 ?auto_175500 ) ) ( not ( = ?auto_175501 ?auto_175502 ) ) ( HOIST-AT ?auto_175503 ?auto_175501 ) ( not ( = ?auto_175506 ?auto_175503 ) ) ( AVAILABLE ?auto_175503 ) ( SURFACE-AT ?auto_175500 ?auto_175501 ) ( ON ?auto_175500 ?auto_175505 ) ( CLEAR ?auto_175500 ) ( not ( = ?auto_175499 ?auto_175505 ) ) ( not ( = ?auto_175500 ?auto_175505 ) ) ( not ( = ?auto_175498 ?auto_175505 ) ) ( TRUCK-AT ?auto_175504 ?auto_175502 ) ( SURFACE-AT ?auto_175498 ?auto_175502 ) ( CLEAR ?auto_175498 ) ( LIFTING ?auto_175506 ?auto_175499 ) ( IS-CRATE ?auto_175499 ) ( ON ?auto_175493 ?auto_175492 ) ( ON ?auto_175494 ?auto_175493 ) ( ON ?auto_175496 ?auto_175494 ) ( ON ?auto_175495 ?auto_175496 ) ( ON ?auto_175497 ?auto_175495 ) ( ON ?auto_175498 ?auto_175497 ) ( not ( = ?auto_175492 ?auto_175493 ) ) ( not ( = ?auto_175492 ?auto_175494 ) ) ( not ( = ?auto_175492 ?auto_175496 ) ) ( not ( = ?auto_175492 ?auto_175495 ) ) ( not ( = ?auto_175492 ?auto_175497 ) ) ( not ( = ?auto_175492 ?auto_175498 ) ) ( not ( = ?auto_175492 ?auto_175499 ) ) ( not ( = ?auto_175492 ?auto_175500 ) ) ( not ( = ?auto_175492 ?auto_175505 ) ) ( not ( = ?auto_175493 ?auto_175494 ) ) ( not ( = ?auto_175493 ?auto_175496 ) ) ( not ( = ?auto_175493 ?auto_175495 ) ) ( not ( = ?auto_175493 ?auto_175497 ) ) ( not ( = ?auto_175493 ?auto_175498 ) ) ( not ( = ?auto_175493 ?auto_175499 ) ) ( not ( = ?auto_175493 ?auto_175500 ) ) ( not ( = ?auto_175493 ?auto_175505 ) ) ( not ( = ?auto_175494 ?auto_175496 ) ) ( not ( = ?auto_175494 ?auto_175495 ) ) ( not ( = ?auto_175494 ?auto_175497 ) ) ( not ( = ?auto_175494 ?auto_175498 ) ) ( not ( = ?auto_175494 ?auto_175499 ) ) ( not ( = ?auto_175494 ?auto_175500 ) ) ( not ( = ?auto_175494 ?auto_175505 ) ) ( not ( = ?auto_175496 ?auto_175495 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( not ( = ?auto_175496 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175499 ) ) ( not ( = ?auto_175496 ?auto_175500 ) ) ( not ( = ?auto_175496 ?auto_175505 ) ) ( not ( = ?auto_175495 ?auto_175497 ) ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175495 ?auto_175499 ) ) ( not ( = ?auto_175495 ?auto_175500 ) ) ( not ( = ?auto_175495 ?auto_175505 ) ) ( not ( = ?auto_175497 ?auto_175498 ) ) ( not ( = ?auto_175497 ?auto_175499 ) ) ( not ( = ?auto_175497 ?auto_175500 ) ) ( not ( = ?auto_175497 ?auto_175505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175498 ?auto_175499 ?auto_175500 )
      ( MAKE-8CRATE-VERIFY ?auto_175492 ?auto_175493 ?auto_175494 ?auto_175496 ?auto_175495 ?auto_175497 ?auto_175498 ?auto_175499 ?auto_175500 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175585 - SURFACE
      ?auto_175586 - SURFACE
      ?auto_175587 - SURFACE
      ?auto_175589 - SURFACE
      ?auto_175588 - SURFACE
      ?auto_175590 - SURFACE
      ?auto_175591 - SURFACE
      ?auto_175592 - SURFACE
      ?auto_175593 - SURFACE
    )
    :vars
    (
      ?auto_175598 - HOIST
      ?auto_175597 - PLACE
      ?auto_175599 - PLACE
      ?auto_175596 - HOIST
      ?auto_175594 - SURFACE
      ?auto_175595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175598 ?auto_175597 ) ( IS-CRATE ?auto_175593 ) ( not ( = ?auto_175592 ?auto_175593 ) ) ( not ( = ?auto_175591 ?auto_175592 ) ) ( not ( = ?auto_175591 ?auto_175593 ) ) ( not ( = ?auto_175599 ?auto_175597 ) ) ( HOIST-AT ?auto_175596 ?auto_175599 ) ( not ( = ?auto_175598 ?auto_175596 ) ) ( AVAILABLE ?auto_175596 ) ( SURFACE-AT ?auto_175593 ?auto_175599 ) ( ON ?auto_175593 ?auto_175594 ) ( CLEAR ?auto_175593 ) ( not ( = ?auto_175592 ?auto_175594 ) ) ( not ( = ?auto_175593 ?auto_175594 ) ) ( not ( = ?auto_175591 ?auto_175594 ) ) ( TRUCK-AT ?auto_175595 ?auto_175597 ) ( SURFACE-AT ?auto_175591 ?auto_175597 ) ( CLEAR ?auto_175591 ) ( IS-CRATE ?auto_175592 ) ( AVAILABLE ?auto_175598 ) ( IN ?auto_175592 ?auto_175595 ) ( ON ?auto_175586 ?auto_175585 ) ( ON ?auto_175587 ?auto_175586 ) ( ON ?auto_175589 ?auto_175587 ) ( ON ?auto_175588 ?auto_175589 ) ( ON ?auto_175590 ?auto_175588 ) ( ON ?auto_175591 ?auto_175590 ) ( not ( = ?auto_175585 ?auto_175586 ) ) ( not ( = ?auto_175585 ?auto_175587 ) ) ( not ( = ?auto_175585 ?auto_175589 ) ) ( not ( = ?auto_175585 ?auto_175588 ) ) ( not ( = ?auto_175585 ?auto_175590 ) ) ( not ( = ?auto_175585 ?auto_175591 ) ) ( not ( = ?auto_175585 ?auto_175592 ) ) ( not ( = ?auto_175585 ?auto_175593 ) ) ( not ( = ?auto_175585 ?auto_175594 ) ) ( not ( = ?auto_175586 ?auto_175587 ) ) ( not ( = ?auto_175586 ?auto_175589 ) ) ( not ( = ?auto_175586 ?auto_175588 ) ) ( not ( = ?auto_175586 ?auto_175590 ) ) ( not ( = ?auto_175586 ?auto_175591 ) ) ( not ( = ?auto_175586 ?auto_175592 ) ) ( not ( = ?auto_175586 ?auto_175593 ) ) ( not ( = ?auto_175586 ?auto_175594 ) ) ( not ( = ?auto_175587 ?auto_175589 ) ) ( not ( = ?auto_175587 ?auto_175588 ) ) ( not ( = ?auto_175587 ?auto_175590 ) ) ( not ( = ?auto_175587 ?auto_175591 ) ) ( not ( = ?auto_175587 ?auto_175592 ) ) ( not ( = ?auto_175587 ?auto_175593 ) ) ( not ( = ?auto_175587 ?auto_175594 ) ) ( not ( = ?auto_175589 ?auto_175588 ) ) ( not ( = ?auto_175589 ?auto_175590 ) ) ( not ( = ?auto_175589 ?auto_175591 ) ) ( not ( = ?auto_175589 ?auto_175592 ) ) ( not ( = ?auto_175589 ?auto_175593 ) ) ( not ( = ?auto_175589 ?auto_175594 ) ) ( not ( = ?auto_175588 ?auto_175590 ) ) ( not ( = ?auto_175588 ?auto_175591 ) ) ( not ( = ?auto_175588 ?auto_175592 ) ) ( not ( = ?auto_175588 ?auto_175593 ) ) ( not ( = ?auto_175588 ?auto_175594 ) ) ( not ( = ?auto_175590 ?auto_175591 ) ) ( not ( = ?auto_175590 ?auto_175592 ) ) ( not ( = ?auto_175590 ?auto_175593 ) ) ( not ( = ?auto_175590 ?auto_175594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175591 ?auto_175592 ?auto_175593 )
      ( MAKE-8CRATE-VERIFY ?auto_175585 ?auto_175586 ?auto_175587 ?auto_175589 ?auto_175588 ?auto_175590 ?auto_175591 ?auto_175592 ?auto_175593 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179672 - SURFACE
      ?auto_179673 - SURFACE
      ?auto_179674 - SURFACE
      ?auto_179676 - SURFACE
      ?auto_179675 - SURFACE
      ?auto_179677 - SURFACE
      ?auto_179678 - SURFACE
      ?auto_179679 - SURFACE
      ?auto_179680 - SURFACE
      ?auto_179681 - SURFACE
    )
    :vars
    (
      ?auto_179683 - HOIST
      ?auto_179682 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_179683 ?auto_179682 ) ( SURFACE-AT ?auto_179680 ?auto_179682 ) ( CLEAR ?auto_179680 ) ( LIFTING ?auto_179683 ?auto_179681 ) ( IS-CRATE ?auto_179681 ) ( not ( = ?auto_179680 ?auto_179681 ) ) ( ON ?auto_179673 ?auto_179672 ) ( ON ?auto_179674 ?auto_179673 ) ( ON ?auto_179676 ?auto_179674 ) ( ON ?auto_179675 ?auto_179676 ) ( ON ?auto_179677 ?auto_179675 ) ( ON ?auto_179678 ?auto_179677 ) ( ON ?auto_179679 ?auto_179678 ) ( ON ?auto_179680 ?auto_179679 ) ( not ( = ?auto_179672 ?auto_179673 ) ) ( not ( = ?auto_179672 ?auto_179674 ) ) ( not ( = ?auto_179672 ?auto_179676 ) ) ( not ( = ?auto_179672 ?auto_179675 ) ) ( not ( = ?auto_179672 ?auto_179677 ) ) ( not ( = ?auto_179672 ?auto_179678 ) ) ( not ( = ?auto_179672 ?auto_179679 ) ) ( not ( = ?auto_179672 ?auto_179680 ) ) ( not ( = ?auto_179672 ?auto_179681 ) ) ( not ( = ?auto_179673 ?auto_179674 ) ) ( not ( = ?auto_179673 ?auto_179676 ) ) ( not ( = ?auto_179673 ?auto_179675 ) ) ( not ( = ?auto_179673 ?auto_179677 ) ) ( not ( = ?auto_179673 ?auto_179678 ) ) ( not ( = ?auto_179673 ?auto_179679 ) ) ( not ( = ?auto_179673 ?auto_179680 ) ) ( not ( = ?auto_179673 ?auto_179681 ) ) ( not ( = ?auto_179674 ?auto_179676 ) ) ( not ( = ?auto_179674 ?auto_179675 ) ) ( not ( = ?auto_179674 ?auto_179677 ) ) ( not ( = ?auto_179674 ?auto_179678 ) ) ( not ( = ?auto_179674 ?auto_179679 ) ) ( not ( = ?auto_179674 ?auto_179680 ) ) ( not ( = ?auto_179674 ?auto_179681 ) ) ( not ( = ?auto_179676 ?auto_179675 ) ) ( not ( = ?auto_179676 ?auto_179677 ) ) ( not ( = ?auto_179676 ?auto_179678 ) ) ( not ( = ?auto_179676 ?auto_179679 ) ) ( not ( = ?auto_179676 ?auto_179680 ) ) ( not ( = ?auto_179676 ?auto_179681 ) ) ( not ( = ?auto_179675 ?auto_179677 ) ) ( not ( = ?auto_179675 ?auto_179678 ) ) ( not ( = ?auto_179675 ?auto_179679 ) ) ( not ( = ?auto_179675 ?auto_179680 ) ) ( not ( = ?auto_179675 ?auto_179681 ) ) ( not ( = ?auto_179677 ?auto_179678 ) ) ( not ( = ?auto_179677 ?auto_179679 ) ) ( not ( = ?auto_179677 ?auto_179680 ) ) ( not ( = ?auto_179677 ?auto_179681 ) ) ( not ( = ?auto_179678 ?auto_179679 ) ) ( not ( = ?auto_179678 ?auto_179680 ) ) ( not ( = ?auto_179678 ?auto_179681 ) ) ( not ( = ?auto_179679 ?auto_179680 ) ) ( not ( = ?auto_179679 ?auto_179681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_179680 ?auto_179681 )
      ( MAKE-9CRATE-VERIFY ?auto_179672 ?auto_179673 ?auto_179674 ?auto_179676 ?auto_179675 ?auto_179677 ?auto_179678 ?auto_179679 ?auto_179680 ?auto_179681 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179752 - SURFACE
      ?auto_179753 - SURFACE
      ?auto_179754 - SURFACE
      ?auto_179756 - SURFACE
      ?auto_179755 - SURFACE
      ?auto_179757 - SURFACE
      ?auto_179758 - SURFACE
      ?auto_179759 - SURFACE
      ?auto_179760 - SURFACE
      ?auto_179761 - SURFACE
    )
    :vars
    (
      ?auto_179762 - HOIST
      ?auto_179764 - PLACE
      ?auto_179763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_179762 ?auto_179764 ) ( SURFACE-AT ?auto_179760 ?auto_179764 ) ( CLEAR ?auto_179760 ) ( IS-CRATE ?auto_179761 ) ( not ( = ?auto_179760 ?auto_179761 ) ) ( TRUCK-AT ?auto_179763 ?auto_179764 ) ( AVAILABLE ?auto_179762 ) ( IN ?auto_179761 ?auto_179763 ) ( ON ?auto_179760 ?auto_179759 ) ( not ( = ?auto_179759 ?auto_179760 ) ) ( not ( = ?auto_179759 ?auto_179761 ) ) ( ON ?auto_179753 ?auto_179752 ) ( ON ?auto_179754 ?auto_179753 ) ( ON ?auto_179756 ?auto_179754 ) ( ON ?auto_179755 ?auto_179756 ) ( ON ?auto_179757 ?auto_179755 ) ( ON ?auto_179758 ?auto_179757 ) ( ON ?auto_179759 ?auto_179758 ) ( not ( = ?auto_179752 ?auto_179753 ) ) ( not ( = ?auto_179752 ?auto_179754 ) ) ( not ( = ?auto_179752 ?auto_179756 ) ) ( not ( = ?auto_179752 ?auto_179755 ) ) ( not ( = ?auto_179752 ?auto_179757 ) ) ( not ( = ?auto_179752 ?auto_179758 ) ) ( not ( = ?auto_179752 ?auto_179759 ) ) ( not ( = ?auto_179752 ?auto_179760 ) ) ( not ( = ?auto_179752 ?auto_179761 ) ) ( not ( = ?auto_179753 ?auto_179754 ) ) ( not ( = ?auto_179753 ?auto_179756 ) ) ( not ( = ?auto_179753 ?auto_179755 ) ) ( not ( = ?auto_179753 ?auto_179757 ) ) ( not ( = ?auto_179753 ?auto_179758 ) ) ( not ( = ?auto_179753 ?auto_179759 ) ) ( not ( = ?auto_179753 ?auto_179760 ) ) ( not ( = ?auto_179753 ?auto_179761 ) ) ( not ( = ?auto_179754 ?auto_179756 ) ) ( not ( = ?auto_179754 ?auto_179755 ) ) ( not ( = ?auto_179754 ?auto_179757 ) ) ( not ( = ?auto_179754 ?auto_179758 ) ) ( not ( = ?auto_179754 ?auto_179759 ) ) ( not ( = ?auto_179754 ?auto_179760 ) ) ( not ( = ?auto_179754 ?auto_179761 ) ) ( not ( = ?auto_179756 ?auto_179755 ) ) ( not ( = ?auto_179756 ?auto_179757 ) ) ( not ( = ?auto_179756 ?auto_179758 ) ) ( not ( = ?auto_179756 ?auto_179759 ) ) ( not ( = ?auto_179756 ?auto_179760 ) ) ( not ( = ?auto_179756 ?auto_179761 ) ) ( not ( = ?auto_179755 ?auto_179757 ) ) ( not ( = ?auto_179755 ?auto_179758 ) ) ( not ( = ?auto_179755 ?auto_179759 ) ) ( not ( = ?auto_179755 ?auto_179760 ) ) ( not ( = ?auto_179755 ?auto_179761 ) ) ( not ( = ?auto_179757 ?auto_179758 ) ) ( not ( = ?auto_179757 ?auto_179759 ) ) ( not ( = ?auto_179757 ?auto_179760 ) ) ( not ( = ?auto_179757 ?auto_179761 ) ) ( not ( = ?auto_179758 ?auto_179759 ) ) ( not ( = ?auto_179758 ?auto_179760 ) ) ( not ( = ?auto_179758 ?auto_179761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_179759 ?auto_179760 ?auto_179761 )
      ( MAKE-9CRATE-VERIFY ?auto_179752 ?auto_179753 ?auto_179754 ?auto_179756 ?auto_179755 ?auto_179757 ?auto_179758 ?auto_179759 ?auto_179760 ?auto_179761 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179842 - SURFACE
      ?auto_179843 - SURFACE
      ?auto_179844 - SURFACE
      ?auto_179846 - SURFACE
      ?auto_179845 - SURFACE
      ?auto_179847 - SURFACE
      ?auto_179848 - SURFACE
      ?auto_179849 - SURFACE
      ?auto_179850 - SURFACE
      ?auto_179851 - SURFACE
    )
    :vars
    (
      ?auto_179853 - HOIST
      ?auto_179854 - PLACE
      ?auto_179852 - TRUCK
      ?auto_179855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_179853 ?auto_179854 ) ( SURFACE-AT ?auto_179850 ?auto_179854 ) ( CLEAR ?auto_179850 ) ( IS-CRATE ?auto_179851 ) ( not ( = ?auto_179850 ?auto_179851 ) ) ( AVAILABLE ?auto_179853 ) ( IN ?auto_179851 ?auto_179852 ) ( ON ?auto_179850 ?auto_179849 ) ( not ( = ?auto_179849 ?auto_179850 ) ) ( not ( = ?auto_179849 ?auto_179851 ) ) ( TRUCK-AT ?auto_179852 ?auto_179855 ) ( not ( = ?auto_179855 ?auto_179854 ) ) ( ON ?auto_179843 ?auto_179842 ) ( ON ?auto_179844 ?auto_179843 ) ( ON ?auto_179846 ?auto_179844 ) ( ON ?auto_179845 ?auto_179846 ) ( ON ?auto_179847 ?auto_179845 ) ( ON ?auto_179848 ?auto_179847 ) ( ON ?auto_179849 ?auto_179848 ) ( not ( = ?auto_179842 ?auto_179843 ) ) ( not ( = ?auto_179842 ?auto_179844 ) ) ( not ( = ?auto_179842 ?auto_179846 ) ) ( not ( = ?auto_179842 ?auto_179845 ) ) ( not ( = ?auto_179842 ?auto_179847 ) ) ( not ( = ?auto_179842 ?auto_179848 ) ) ( not ( = ?auto_179842 ?auto_179849 ) ) ( not ( = ?auto_179842 ?auto_179850 ) ) ( not ( = ?auto_179842 ?auto_179851 ) ) ( not ( = ?auto_179843 ?auto_179844 ) ) ( not ( = ?auto_179843 ?auto_179846 ) ) ( not ( = ?auto_179843 ?auto_179845 ) ) ( not ( = ?auto_179843 ?auto_179847 ) ) ( not ( = ?auto_179843 ?auto_179848 ) ) ( not ( = ?auto_179843 ?auto_179849 ) ) ( not ( = ?auto_179843 ?auto_179850 ) ) ( not ( = ?auto_179843 ?auto_179851 ) ) ( not ( = ?auto_179844 ?auto_179846 ) ) ( not ( = ?auto_179844 ?auto_179845 ) ) ( not ( = ?auto_179844 ?auto_179847 ) ) ( not ( = ?auto_179844 ?auto_179848 ) ) ( not ( = ?auto_179844 ?auto_179849 ) ) ( not ( = ?auto_179844 ?auto_179850 ) ) ( not ( = ?auto_179844 ?auto_179851 ) ) ( not ( = ?auto_179846 ?auto_179845 ) ) ( not ( = ?auto_179846 ?auto_179847 ) ) ( not ( = ?auto_179846 ?auto_179848 ) ) ( not ( = ?auto_179846 ?auto_179849 ) ) ( not ( = ?auto_179846 ?auto_179850 ) ) ( not ( = ?auto_179846 ?auto_179851 ) ) ( not ( = ?auto_179845 ?auto_179847 ) ) ( not ( = ?auto_179845 ?auto_179848 ) ) ( not ( = ?auto_179845 ?auto_179849 ) ) ( not ( = ?auto_179845 ?auto_179850 ) ) ( not ( = ?auto_179845 ?auto_179851 ) ) ( not ( = ?auto_179847 ?auto_179848 ) ) ( not ( = ?auto_179847 ?auto_179849 ) ) ( not ( = ?auto_179847 ?auto_179850 ) ) ( not ( = ?auto_179847 ?auto_179851 ) ) ( not ( = ?auto_179848 ?auto_179849 ) ) ( not ( = ?auto_179848 ?auto_179850 ) ) ( not ( = ?auto_179848 ?auto_179851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_179849 ?auto_179850 ?auto_179851 )
      ( MAKE-9CRATE-VERIFY ?auto_179842 ?auto_179843 ?auto_179844 ?auto_179846 ?auto_179845 ?auto_179847 ?auto_179848 ?auto_179849 ?auto_179850 ?auto_179851 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179941 - SURFACE
      ?auto_179942 - SURFACE
      ?auto_179943 - SURFACE
      ?auto_179945 - SURFACE
      ?auto_179944 - SURFACE
      ?auto_179946 - SURFACE
      ?auto_179947 - SURFACE
      ?auto_179948 - SURFACE
      ?auto_179949 - SURFACE
      ?auto_179950 - SURFACE
    )
    :vars
    (
      ?auto_179955 - HOIST
      ?auto_179954 - PLACE
      ?auto_179951 - TRUCK
      ?auto_179952 - PLACE
      ?auto_179953 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_179955 ?auto_179954 ) ( SURFACE-AT ?auto_179949 ?auto_179954 ) ( CLEAR ?auto_179949 ) ( IS-CRATE ?auto_179950 ) ( not ( = ?auto_179949 ?auto_179950 ) ) ( AVAILABLE ?auto_179955 ) ( ON ?auto_179949 ?auto_179948 ) ( not ( = ?auto_179948 ?auto_179949 ) ) ( not ( = ?auto_179948 ?auto_179950 ) ) ( TRUCK-AT ?auto_179951 ?auto_179952 ) ( not ( = ?auto_179952 ?auto_179954 ) ) ( HOIST-AT ?auto_179953 ?auto_179952 ) ( LIFTING ?auto_179953 ?auto_179950 ) ( not ( = ?auto_179955 ?auto_179953 ) ) ( ON ?auto_179942 ?auto_179941 ) ( ON ?auto_179943 ?auto_179942 ) ( ON ?auto_179945 ?auto_179943 ) ( ON ?auto_179944 ?auto_179945 ) ( ON ?auto_179946 ?auto_179944 ) ( ON ?auto_179947 ?auto_179946 ) ( ON ?auto_179948 ?auto_179947 ) ( not ( = ?auto_179941 ?auto_179942 ) ) ( not ( = ?auto_179941 ?auto_179943 ) ) ( not ( = ?auto_179941 ?auto_179945 ) ) ( not ( = ?auto_179941 ?auto_179944 ) ) ( not ( = ?auto_179941 ?auto_179946 ) ) ( not ( = ?auto_179941 ?auto_179947 ) ) ( not ( = ?auto_179941 ?auto_179948 ) ) ( not ( = ?auto_179941 ?auto_179949 ) ) ( not ( = ?auto_179941 ?auto_179950 ) ) ( not ( = ?auto_179942 ?auto_179943 ) ) ( not ( = ?auto_179942 ?auto_179945 ) ) ( not ( = ?auto_179942 ?auto_179944 ) ) ( not ( = ?auto_179942 ?auto_179946 ) ) ( not ( = ?auto_179942 ?auto_179947 ) ) ( not ( = ?auto_179942 ?auto_179948 ) ) ( not ( = ?auto_179942 ?auto_179949 ) ) ( not ( = ?auto_179942 ?auto_179950 ) ) ( not ( = ?auto_179943 ?auto_179945 ) ) ( not ( = ?auto_179943 ?auto_179944 ) ) ( not ( = ?auto_179943 ?auto_179946 ) ) ( not ( = ?auto_179943 ?auto_179947 ) ) ( not ( = ?auto_179943 ?auto_179948 ) ) ( not ( = ?auto_179943 ?auto_179949 ) ) ( not ( = ?auto_179943 ?auto_179950 ) ) ( not ( = ?auto_179945 ?auto_179944 ) ) ( not ( = ?auto_179945 ?auto_179946 ) ) ( not ( = ?auto_179945 ?auto_179947 ) ) ( not ( = ?auto_179945 ?auto_179948 ) ) ( not ( = ?auto_179945 ?auto_179949 ) ) ( not ( = ?auto_179945 ?auto_179950 ) ) ( not ( = ?auto_179944 ?auto_179946 ) ) ( not ( = ?auto_179944 ?auto_179947 ) ) ( not ( = ?auto_179944 ?auto_179948 ) ) ( not ( = ?auto_179944 ?auto_179949 ) ) ( not ( = ?auto_179944 ?auto_179950 ) ) ( not ( = ?auto_179946 ?auto_179947 ) ) ( not ( = ?auto_179946 ?auto_179948 ) ) ( not ( = ?auto_179946 ?auto_179949 ) ) ( not ( = ?auto_179946 ?auto_179950 ) ) ( not ( = ?auto_179947 ?auto_179948 ) ) ( not ( = ?auto_179947 ?auto_179949 ) ) ( not ( = ?auto_179947 ?auto_179950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_179948 ?auto_179949 ?auto_179950 )
      ( MAKE-9CRATE-VERIFY ?auto_179941 ?auto_179942 ?auto_179943 ?auto_179945 ?auto_179944 ?auto_179946 ?auto_179947 ?auto_179948 ?auto_179949 ?auto_179950 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180049 - SURFACE
      ?auto_180050 - SURFACE
      ?auto_180051 - SURFACE
      ?auto_180053 - SURFACE
      ?auto_180052 - SURFACE
      ?auto_180054 - SURFACE
      ?auto_180055 - SURFACE
      ?auto_180056 - SURFACE
      ?auto_180057 - SURFACE
      ?auto_180058 - SURFACE
    )
    :vars
    (
      ?auto_180059 - HOIST
      ?auto_180061 - PLACE
      ?auto_180062 - TRUCK
      ?auto_180063 - PLACE
      ?auto_180060 - HOIST
      ?auto_180064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180059 ?auto_180061 ) ( SURFACE-AT ?auto_180057 ?auto_180061 ) ( CLEAR ?auto_180057 ) ( IS-CRATE ?auto_180058 ) ( not ( = ?auto_180057 ?auto_180058 ) ) ( AVAILABLE ?auto_180059 ) ( ON ?auto_180057 ?auto_180056 ) ( not ( = ?auto_180056 ?auto_180057 ) ) ( not ( = ?auto_180056 ?auto_180058 ) ) ( TRUCK-AT ?auto_180062 ?auto_180063 ) ( not ( = ?auto_180063 ?auto_180061 ) ) ( HOIST-AT ?auto_180060 ?auto_180063 ) ( not ( = ?auto_180059 ?auto_180060 ) ) ( AVAILABLE ?auto_180060 ) ( SURFACE-AT ?auto_180058 ?auto_180063 ) ( ON ?auto_180058 ?auto_180064 ) ( CLEAR ?auto_180058 ) ( not ( = ?auto_180057 ?auto_180064 ) ) ( not ( = ?auto_180058 ?auto_180064 ) ) ( not ( = ?auto_180056 ?auto_180064 ) ) ( ON ?auto_180050 ?auto_180049 ) ( ON ?auto_180051 ?auto_180050 ) ( ON ?auto_180053 ?auto_180051 ) ( ON ?auto_180052 ?auto_180053 ) ( ON ?auto_180054 ?auto_180052 ) ( ON ?auto_180055 ?auto_180054 ) ( ON ?auto_180056 ?auto_180055 ) ( not ( = ?auto_180049 ?auto_180050 ) ) ( not ( = ?auto_180049 ?auto_180051 ) ) ( not ( = ?auto_180049 ?auto_180053 ) ) ( not ( = ?auto_180049 ?auto_180052 ) ) ( not ( = ?auto_180049 ?auto_180054 ) ) ( not ( = ?auto_180049 ?auto_180055 ) ) ( not ( = ?auto_180049 ?auto_180056 ) ) ( not ( = ?auto_180049 ?auto_180057 ) ) ( not ( = ?auto_180049 ?auto_180058 ) ) ( not ( = ?auto_180049 ?auto_180064 ) ) ( not ( = ?auto_180050 ?auto_180051 ) ) ( not ( = ?auto_180050 ?auto_180053 ) ) ( not ( = ?auto_180050 ?auto_180052 ) ) ( not ( = ?auto_180050 ?auto_180054 ) ) ( not ( = ?auto_180050 ?auto_180055 ) ) ( not ( = ?auto_180050 ?auto_180056 ) ) ( not ( = ?auto_180050 ?auto_180057 ) ) ( not ( = ?auto_180050 ?auto_180058 ) ) ( not ( = ?auto_180050 ?auto_180064 ) ) ( not ( = ?auto_180051 ?auto_180053 ) ) ( not ( = ?auto_180051 ?auto_180052 ) ) ( not ( = ?auto_180051 ?auto_180054 ) ) ( not ( = ?auto_180051 ?auto_180055 ) ) ( not ( = ?auto_180051 ?auto_180056 ) ) ( not ( = ?auto_180051 ?auto_180057 ) ) ( not ( = ?auto_180051 ?auto_180058 ) ) ( not ( = ?auto_180051 ?auto_180064 ) ) ( not ( = ?auto_180053 ?auto_180052 ) ) ( not ( = ?auto_180053 ?auto_180054 ) ) ( not ( = ?auto_180053 ?auto_180055 ) ) ( not ( = ?auto_180053 ?auto_180056 ) ) ( not ( = ?auto_180053 ?auto_180057 ) ) ( not ( = ?auto_180053 ?auto_180058 ) ) ( not ( = ?auto_180053 ?auto_180064 ) ) ( not ( = ?auto_180052 ?auto_180054 ) ) ( not ( = ?auto_180052 ?auto_180055 ) ) ( not ( = ?auto_180052 ?auto_180056 ) ) ( not ( = ?auto_180052 ?auto_180057 ) ) ( not ( = ?auto_180052 ?auto_180058 ) ) ( not ( = ?auto_180052 ?auto_180064 ) ) ( not ( = ?auto_180054 ?auto_180055 ) ) ( not ( = ?auto_180054 ?auto_180056 ) ) ( not ( = ?auto_180054 ?auto_180057 ) ) ( not ( = ?auto_180054 ?auto_180058 ) ) ( not ( = ?auto_180054 ?auto_180064 ) ) ( not ( = ?auto_180055 ?auto_180056 ) ) ( not ( = ?auto_180055 ?auto_180057 ) ) ( not ( = ?auto_180055 ?auto_180058 ) ) ( not ( = ?auto_180055 ?auto_180064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180056 ?auto_180057 ?auto_180058 )
      ( MAKE-9CRATE-VERIFY ?auto_180049 ?auto_180050 ?auto_180051 ?auto_180053 ?auto_180052 ?auto_180054 ?auto_180055 ?auto_180056 ?auto_180057 ?auto_180058 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180158 - SURFACE
      ?auto_180159 - SURFACE
      ?auto_180160 - SURFACE
      ?auto_180162 - SURFACE
      ?auto_180161 - SURFACE
      ?auto_180163 - SURFACE
      ?auto_180164 - SURFACE
      ?auto_180165 - SURFACE
      ?auto_180166 - SURFACE
      ?auto_180167 - SURFACE
    )
    :vars
    (
      ?auto_180169 - HOIST
      ?auto_180171 - PLACE
      ?auto_180170 - PLACE
      ?auto_180172 - HOIST
      ?auto_180168 - SURFACE
      ?auto_180173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180169 ?auto_180171 ) ( SURFACE-AT ?auto_180166 ?auto_180171 ) ( CLEAR ?auto_180166 ) ( IS-CRATE ?auto_180167 ) ( not ( = ?auto_180166 ?auto_180167 ) ) ( AVAILABLE ?auto_180169 ) ( ON ?auto_180166 ?auto_180165 ) ( not ( = ?auto_180165 ?auto_180166 ) ) ( not ( = ?auto_180165 ?auto_180167 ) ) ( not ( = ?auto_180170 ?auto_180171 ) ) ( HOIST-AT ?auto_180172 ?auto_180170 ) ( not ( = ?auto_180169 ?auto_180172 ) ) ( AVAILABLE ?auto_180172 ) ( SURFACE-AT ?auto_180167 ?auto_180170 ) ( ON ?auto_180167 ?auto_180168 ) ( CLEAR ?auto_180167 ) ( not ( = ?auto_180166 ?auto_180168 ) ) ( not ( = ?auto_180167 ?auto_180168 ) ) ( not ( = ?auto_180165 ?auto_180168 ) ) ( TRUCK-AT ?auto_180173 ?auto_180171 ) ( ON ?auto_180159 ?auto_180158 ) ( ON ?auto_180160 ?auto_180159 ) ( ON ?auto_180162 ?auto_180160 ) ( ON ?auto_180161 ?auto_180162 ) ( ON ?auto_180163 ?auto_180161 ) ( ON ?auto_180164 ?auto_180163 ) ( ON ?auto_180165 ?auto_180164 ) ( not ( = ?auto_180158 ?auto_180159 ) ) ( not ( = ?auto_180158 ?auto_180160 ) ) ( not ( = ?auto_180158 ?auto_180162 ) ) ( not ( = ?auto_180158 ?auto_180161 ) ) ( not ( = ?auto_180158 ?auto_180163 ) ) ( not ( = ?auto_180158 ?auto_180164 ) ) ( not ( = ?auto_180158 ?auto_180165 ) ) ( not ( = ?auto_180158 ?auto_180166 ) ) ( not ( = ?auto_180158 ?auto_180167 ) ) ( not ( = ?auto_180158 ?auto_180168 ) ) ( not ( = ?auto_180159 ?auto_180160 ) ) ( not ( = ?auto_180159 ?auto_180162 ) ) ( not ( = ?auto_180159 ?auto_180161 ) ) ( not ( = ?auto_180159 ?auto_180163 ) ) ( not ( = ?auto_180159 ?auto_180164 ) ) ( not ( = ?auto_180159 ?auto_180165 ) ) ( not ( = ?auto_180159 ?auto_180166 ) ) ( not ( = ?auto_180159 ?auto_180167 ) ) ( not ( = ?auto_180159 ?auto_180168 ) ) ( not ( = ?auto_180160 ?auto_180162 ) ) ( not ( = ?auto_180160 ?auto_180161 ) ) ( not ( = ?auto_180160 ?auto_180163 ) ) ( not ( = ?auto_180160 ?auto_180164 ) ) ( not ( = ?auto_180160 ?auto_180165 ) ) ( not ( = ?auto_180160 ?auto_180166 ) ) ( not ( = ?auto_180160 ?auto_180167 ) ) ( not ( = ?auto_180160 ?auto_180168 ) ) ( not ( = ?auto_180162 ?auto_180161 ) ) ( not ( = ?auto_180162 ?auto_180163 ) ) ( not ( = ?auto_180162 ?auto_180164 ) ) ( not ( = ?auto_180162 ?auto_180165 ) ) ( not ( = ?auto_180162 ?auto_180166 ) ) ( not ( = ?auto_180162 ?auto_180167 ) ) ( not ( = ?auto_180162 ?auto_180168 ) ) ( not ( = ?auto_180161 ?auto_180163 ) ) ( not ( = ?auto_180161 ?auto_180164 ) ) ( not ( = ?auto_180161 ?auto_180165 ) ) ( not ( = ?auto_180161 ?auto_180166 ) ) ( not ( = ?auto_180161 ?auto_180167 ) ) ( not ( = ?auto_180161 ?auto_180168 ) ) ( not ( = ?auto_180163 ?auto_180164 ) ) ( not ( = ?auto_180163 ?auto_180165 ) ) ( not ( = ?auto_180163 ?auto_180166 ) ) ( not ( = ?auto_180163 ?auto_180167 ) ) ( not ( = ?auto_180163 ?auto_180168 ) ) ( not ( = ?auto_180164 ?auto_180165 ) ) ( not ( = ?auto_180164 ?auto_180166 ) ) ( not ( = ?auto_180164 ?auto_180167 ) ) ( not ( = ?auto_180164 ?auto_180168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180165 ?auto_180166 ?auto_180167 )
      ( MAKE-9CRATE-VERIFY ?auto_180158 ?auto_180159 ?auto_180160 ?auto_180162 ?auto_180161 ?auto_180163 ?auto_180164 ?auto_180165 ?auto_180166 ?auto_180167 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180267 - SURFACE
      ?auto_180268 - SURFACE
      ?auto_180269 - SURFACE
      ?auto_180271 - SURFACE
      ?auto_180270 - SURFACE
      ?auto_180272 - SURFACE
      ?auto_180273 - SURFACE
      ?auto_180274 - SURFACE
      ?auto_180275 - SURFACE
      ?auto_180276 - SURFACE
    )
    :vars
    (
      ?auto_180277 - HOIST
      ?auto_180281 - PLACE
      ?auto_180282 - PLACE
      ?auto_180279 - HOIST
      ?auto_180278 - SURFACE
      ?auto_180280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180277 ?auto_180281 ) ( IS-CRATE ?auto_180276 ) ( not ( = ?auto_180275 ?auto_180276 ) ) ( not ( = ?auto_180274 ?auto_180275 ) ) ( not ( = ?auto_180274 ?auto_180276 ) ) ( not ( = ?auto_180282 ?auto_180281 ) ) ( HOIST-AT ?auto_180279 ?auto_180282 ) ( not ( = ?auto_180277 ?auto_180279 ) ) ( AVAILABLE ?auto_180279 ) ( SURFACE-AT ?auto_180276 ?auto_180282 ) ( ON ?auto_180276 ?auto_180278 ) ( CLEAR ?auto_180276 ) ( not ( = ?auto_180275 ?auto_180278 ) ) ( not ( = ?auto_180276 ?auto_180278 ) ) ( not ( = ?auto_180274 ?auto_180278 ) ) ( TRUCK-AT ?auto_180280 ?auto_180281 ) ( SURFACE-AT ?auto_180274 ?auto_180281 ) ( CLEAR ?auto_180274 ) ( LIFTING ?auto_180277 ?auto_180275 ) ( IS-CRATE ?auto_180275 ) ( ON ?auto_180268 ?auto_180267 ) ( ON ?auto_180269 ?auto_180268 ) ( ON ?auto_180271 ?auto_180269 ) ( ON ?auto_180270 ?auto_180271 ) ( ON ?auto_180272 ?auto_180270 ) ( ON ?auto_180273 ?auto_180272 ) ( ON ?auto_180274 ?auto_180273 ) ( not ( = ?auto_180267 ?auto_180268 ) ) ( not ( = ?auto_180267 ?auto_180269 ) ) ( not ( = ?auto_180267 ?auto_180271 ) ) ( not ( = ?auto_180267 ?auto_180270 ) ) ( not ( = ?auto_180267 ?auto_180272 ) ) ( not ( = ?auto_180267 ?auto_180273 ) ) ( not ( = ?auto_180267 ?auto_180274 ) ) ( not ( = ?auto_180267 ?auto_180275 ) ) ( not ( = ?auto_180267 ?auto_180276 ) ) ( not ( = ?auto_180267 ?auto_180278 ) ) ( not ( = ?auto_180268 ?auto_180269 ) ) ( not ( = ?auto_180268 ?auto_180271 ) ) ( not ( = ?auto_180268 ?auto_180270 ) ) ( not ( = ?auto_180268 ?auto_180272 ) ) ( not ( = ?auto_180268 ?auto_180273 ) ) ( not ( = ?auto_180268 ?auto_180274 ) ) ( not ( = ?auto_180268 ?auto_180275 ) ) ( not ( = ?auto_180268 ?auto_180276 ) ) ( not ( = ?auto_180268 ?auto_180278 ) ) ( not ( = ?auto_180269 ?auto_180271 ) ) ( not ( = ?auto_180269 ?auto_180270 ) ) ( not ( = ?auto_180269 ?auto_180272 ) ) ( not ( = ?auto_180269 ?auto_180273 ) ) ( not ( = ?auto_180269 ?auto_180274 ) ) ( not ( = ?auto_180269 ?auto_180275 ) ) ( not ( = ?auto_180269 ?auto_180276 ) ) ( not ( = ?auto_180269 ?auto_180278 ) ) ( not ( = ?auto_180271 ?auto_180270 ) ) ( not ( = ?auto_180271 ?auto_180272 ) ) ( not ( = ?auto_180271 ?auto_180273 ) ) ( not ( = ?auto_180271 ?auto_180274 ) ) ( not ( = ?auto_180271 ?auto_180275 ) ) ( not ( = ?auto_180271 ?auto_180276 ) ) ( not ( = ?auto_180271 ?auto_180278 ) ) ( not ( = ?auto_180270 ?auto_180272 ) ) ( not ( = ?auto_180270 ?auto_180273 ) ) ( not ( = ?auto_180270 ?auto_180274 ) ) ( not ( = ?auto_180270 ?auto_180275 ) ) ( not ( = ?auto_180270 ?auto_180276 ) ) ( not ( = ?auto_180270 ?auto_180278 ) ) ( not ( = ?auto_180272 ?auto_180273 ) ) ( not ( = ?auto_180272 ?auto_180274 ) ) ( not ( = ?auto_180272 ?auto_180275 ) ) ( not ( = ?auto_180272 ?auto_180276 ) ) ( not ( = ?auto_180272 ?auto_180278 ) ) ( not ( = ?auto_180273 ?auto_180274 ) ) ( not ( = ?auto_180273 ?auto_180275 ) ) ( not ( = ?auto_180273 ?auto_180276 ) ) ( not ( = ?auto_180273 ?auto_180278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180274 ?auto_180275 ?auto_180276 )
      ( MAKE-9CRATE-VERIFY ?auto_180267 ?auto_180268 ?auto_180269 ?auto_180271 ?auto_180270 ?auto_180272 ?auto_180273 ?auto_180274 ?auto_180275 ?auto_180276 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180376 - SURFACE
      ?auto_180377 - SURFACE
      ?auto_180378 - SURFACE
      ?auto_180380 - SURFACE
      ?auto_180379 - SURFACE
      ?auto_180381 - SURFACE
      ?auto_180382 - SURFACE
      ?auto_180383 - SURFACE
      ?auto_180384 - SURFACE
      ?auto_180385 - SURFACE
    )
    :vars
    (
      ?auto_180391 - HOIST
      ?auto_180390 - PLACE
      ?auto_180388 - PLACE
      ?auto_180386 - HOIST
      ?auto_180389 - SURFACE
      ?auto_180387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180391 ?auto_180390 ) ( IS-CRATE ?auto_180385 ) ( not ( = ?auto_180384 ?auto_180385 ) ) ( not ( = ?auto_180383 ?auto_180384 ) ) ( not ( = ?auto_180383 ?auto_180385 ) ) ( not ( = ?auto_180388 ?auto_180390 ) ) ( HOIST-AT ?auto_180386 ?auto_180388 ) ( not ( = ?auto_180391 ?auto_180386 ) ) ( AVAILABLE ?auto_180386 ) ( SURFACE-AT ?auto_180385 ?auto_180388 ) ( ON ?auto_180385 ?auto_180389 ) ( CLEAR ?auto_180385 ) ( not ( = ?auto_180384 ?auto_180389 ) ) ( not ( = ?auto_180385 ?auto_180389 ) ) ( not ( = ?auto_180383 ?auto_180389 ) ) ( TRUCK-AT ?auto_180387 ?auto_180390 ) ( SURFACE-AT ?auto_180383 ?auto_180390 ) ( CLEAR ?auto_180383 ) ( IS-CRATE ?auto_180384 ) ( AVAILABLE ?auto_180391 ) ( IN ?auto_180384 ?auto_180387 ) ( ON ?auto_180377 ?auto_180376 ) ( ON ?auto_180378 ?auto_180377 ) ( ON ?auto_180380 ?auto_180378 ) ( ON ?auto_180379 ?auto_180380 ) ( ON ?auto_180381 ?auto_180379 ) ( ON ?auto_180382 ?auto_180381 ) ( ON ?auto_180383 ?auto_180382 ) ( not ( = ?auto_180376 ?auto_180377 ) ) ( not ( = ?auto_180376 ?auto_180378 ) ) ( not ( = ?auto_180376 ?auto_180380 ) ) ( not ( = ?auto_180376 ?auto_180379 ) ) ( not ( = ?auto_180376 ?auto_180381 ) ) ( not ( = ?auto_180376 ?auto_180382 ) ) ( not ( = ?auto_180376 ?auto_180383 ) ) ( not ( = ?auto_180376 ?auto_180384 ) ) ( not ( = ?auto_180376 ?auto_180385 ) ) ( not ( = ?auto_180376 ?auto_180389 ) ) ( not ( = ?auto_180377 ?auto_180378 ) ) ( not ( = ?auto_180377 ?auto_180380 ) ) ( not ( = ?auto_180377 ?auto_180379 ) ) ( not ( = ?auto_180377 ?auto_180381 ) ) ( not ( = ?auto_180377 ?auto_180382 ) ) ( not ( = ?auto_180377 ?auto_180383 ) ) ( not ( = ?auto_180377 ?auto_180384 ) ) ( not ( = ?auto_180377 ?auto_180385 ) ) ( not ( = ?auto_180377 ?auto_180389 ) ) ( not ( = ?auto_180378 ?auto_180380 ) ) ( not ( = ?auto_180378 ?auto_180379 ) ) ( not ( = ?auto_180378 ?auto_180381 ) ) ( not ( = ?auto_180378 ?auto_180382 ) ) ( not ( = ?auto_180378 ?auto_180383 ) ) ( not ( = ?auto_180378 ?auto_180384 ) ) ( not ( = ?auto_180378 ?auto_180385 ) ) ( not ( = ?auto_180378 ?auto_180389 ) ) ( not ( = ?auto_180380 ?auto_180379 ) ) ( not ( = ?auto_180380 ?auto_180381 ) ) ( not ( = ?auto_180380 ?auto_180382 ) ) ( not ( = ?auto_180380 ?auto_180383 ) ) ( not ( = ?auto_180380 ?auto_180384 ) ) ( not ( = ?auto_180380 ?auto_180385 ) ) ( not ( = ?auto_180380 ?auto_180389 ) ) ( not ( = ?auto_180379 ?auto_180381 ) ) ( not ( = ?auto_180379 ?auto_180382 ) ) ( not ( = ?auto_180379 ?auto_180383 ) ) ( not ( = ?auto_180379 ?auto_180384 ) ) ( not ( = ?auto_180379 ?auto_180385 ) ) ( not ( = ?auto_180379 ?auto_180389 ) ) ( not ( = ?auto_180381 ?auto_180382 ) ) ( not ( = ?auto_180381 ?auto_180383 ) ) ( not ( = ?auto_180381 ?auto_180384 ) ) ( not ( = ?auto_180381 ?auto_180385 ) ) ( not ( = ?auto_180381 ?auto_180389 ) ) ( not ( = ?auto_180382 ?auto_180383 ) ) ( not ( = ?auto_180382 ?auto_180384 ) ) ( not ( = ?auto_180382 ?auto_180385 ) ) ( not ( = ?auto_180382 ?auto_180389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180383 ?auto_180384 ?auto_180385 )
      ( MAKE-9CRATE-VERIFY ?auto_180376 ?auto_180377 ?auto_180378 ?auto_180380 ?auto_180379 ?auto_180381 ?auto_180382 ?auto_180383 ?auto_180384 ?auto_180385 ) )
  )

)

