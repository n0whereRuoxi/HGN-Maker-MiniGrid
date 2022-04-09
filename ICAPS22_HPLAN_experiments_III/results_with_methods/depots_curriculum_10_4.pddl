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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8230 - SURFACE
      ?auto_8231 - SURFACE
    )
    :vars
    (
      ?auto_8232 - HOIST
      ?auto_8233 - PLACE
      ?auto_8235 - PLACE
      ?auto_8236 - HOIST
      ?auto_8237 - SURFACE
      ?auto_8234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8232 ?auto_8233 ) ( SURFACE-AT ?auto_8230 ?auto_8233 ) ( CLEAR ?auto_8230 ) ( IS-CRATE ?auto_8231 ) ( AVAILABLE ?auto_8232 ) ( not ( = ?auto_8235 ?auto_8233 ) ) ( HOIST-AT ?auto_8236 ?auto_8235 ) ( AVAILABLE ?auto_8236 ) ( SURFACE-AT ?auto_8231 ?auto_8235 ) ( ON ?auto_8231 ?auto_8237 ) ( CLEAR ?auto_8231 ) ( TRUCK-AT ?auto_8234 ?auto_8233 ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8230 ?auto_8237 ) ) ( not ( = ?auto_8231 ?auto_8237 ) ) ( not ( = ?auto_8232 ?auto_8236 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8234 ?auto_8233 ?auto_8235 )
      ( !LIFT ?auto_8236 ?auto_8231 ?auto_8237 ?auto_8235 )
      ( !LOAD ?auto_8236 ?auto_8231 ?auto_8234 ?auto_8235 )
      ( !DRIVE ?auto_8234 ?auto_8235 ?auto_8233 )
      ( !UNLOAD ?auto_8232 ?auto_8231 ?auto_8234 ?auto_8233 )
      ( !DROP ?auto_8232 ?auto_8231 ?auto_8230 ?auto_8233 )
      ( MAKE-1CRATE-VERIFY ?auto_8230 ?auto_8231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8240 - SURFACE
      ?auto_8241 - SURFACE
    )
    :vars
    (
      ?auto_8242 - HOIST
      ?auto_8243 - PLACE
      ?auto_8245 - PLACE
      ?auto_8246 - HOIST
      ?auto_8247 - SURFACE
      ?auto_8244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8242 ?auto_8243 ) ( SURFACE-AT ?auto_8240 ?auto_8243 ) ( CLEAR ?auto_8240 ) ( IS-CRATE ?auto_8241 ) ( AVAILABLE ?auto_8242 ) ( not ( = ?auto_8245 ?auto_8243 ) ) ( HOIST-AT ?auto_8246 ?auto_8245 ) ( AVAILABLE ?auto_8246 ) ( SURFACE-AT ?auto_8241 ?auto_8245 ) ( ON ?auto_8241 ?auto_8247 ) ( CLEAR ?auto_8241 ) ( TRUCK-AT ?auto_8244 ?auto_8243 ) ( not ( = ?auto_8240 ?auto_8241 ) ) ( not ( = ?auto_8240 ?auto_8247 ) ) ( not ( = ?auto_8241 ?auto_8247 ) ) ( not ( = ?auto_8242 ?auto_8246 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8244 ?auto_8243 ?auto_8245 )
      ( !LIFT ?auto_8246 ?auto_8241 ?auto_8247 ?auto_8245 )
      ( !LOAD ?auto_8246 ?auto_8241 ?auto_8244 ?auto_8245 )
      ( !DRIVE ?auto_8244 ?auto_8245 ?auto_8243 )
      ( !UNLOAD ?auto_8242 ?auto_8241 ?auto_8244 ?auto_8243 )
      ( !DROP ?auto_8242 ?auto_8241 ?auto_8240 ?auto_8243 )
      ( MAKE-1CRATE-VERIFY ?auto_8240 ?auto_8241 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8251 - SURFACE
      ?auto_8252 - SURFACE
      ?auto_8253 - SURFACE
    )
    :vars
    (
      ?auto_8258 - HOIST
      ?auto_8259 - PLACE
      ?auto_8256 - PLACE
      ?auto_8257 - HOIST
      ?auto_8255 - SURFACE
      ?auto_8260 - SURFACE
      ?auto_8254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8258 ?auto_8259 ) ( IS-CRATE ?auto_8253 ) ( not ( = ?auto_8256 ?auto_8259 ) ) ( HOIST-AT ?auto_8257 ?auto_8256 ) ( SURFACE-AT ?auto_8253 ?auto_8256 ) ( ON ?auto_8253 ?auto_8255 ) ( CLEAR ?auto_8253 ) ( not ( = ?auto_8252 ?auto_8253 ) ) ( not ( = ?auto_8252 ?auto_8255 ) ) ( not ( = ?auto_8253 ?auto_8255 ) ) ( not ( = ?auto_8258 ?auto_8257 ) ) ( SURFACE-AT ?auto_8251 ?auto_8259 ) ( CLEAR ?auto_8251 ) ( IS-CRATE ?auto_8252 ) ( AVAILABLE ?auto_8258 ) ( AVAILABLE ?auto_8257 ) ( SURFACE-AT ?auto_8252 ?auto_8256 ) ( ON ?auto_8252 ?auto_8260 ) ( CLEAR ?auto_8252 ) ( TRUCK-AT ?auto_8254 ?auto_8259 ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( not ( = ?auto_8251 ?auto_8260 ) ) ( not ( = ?auto_8252 ?auto_8260 ) ) ( not ( = ?auto_8251 ?auto_8253 ) ) ( not ( = ?auto_8251 ?auto_8255 ) ) ( not ( = ?auto_8253 ?auto_8260 ) ) ( not ( = ?auto_8255 ?auto_8260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8251 ?auto_8252 )
      ( MAKE-1CRATE ?auto_8252 ?auto_8253 )
      ( MAKE-2CRATE-VERIFY ?auto_8251 ?auto_8252 ?auto_8253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8263 - SURFACE
      ?auto_8264 - SURFACE
    )
    :vars
    (
      ?auto_8265 - HOIST
      ?auto_8266 - PLACE
      ?auto_8268 - PLACE
      ?auto_8269 - HOIST
      ?auto_8270 - SURFACE
      ?auto_8267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8265 ?auto_8266 ) ( SURFACE-AT ?auto_8263 ?auto_8266 ) ( CLEAR ?auto_8263 ) ( IS-CRATE ?auto_8264 ) ( AVAILABLE ?auto_8265 ) ( not ( = ?auto_8268 ?auto_8266 ) ) ( HOIST-AT ?auto_8269 ?auto_8268 ) ( AVAILABLE ?auto_8269 ) ( SURFACE-AT ?auto_8264 ?auto_8268 ) ( ON ?auto_8264 ?auto_8270 ) ( CLEAR ?auto_8264 ) ( TRUCK-AT ?auto_8267 ?auto_8266 ) ( not ( = ?auto_8263 ?auto_8264 ) ) ( not ( = ?auto_8263 ?auto_8270 ) ) ( not ( = ?auto_8264 ?auto_8270 ) ) ( not ( = ?auto_8265 ?auto_8269 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8267 ?auto_8266 ?auto_8268 )
      ( !LIFT ?auto_8269 ?auto_8264 ?auto_8270 ?auto_8268 )
      ( !LOAD ?auto_8269 ?auto_8264 ?auto_8267 ?auto_8268 )
      ( !DRIVE ?auto_8267 ?auto_8268 ?auto_8266 )
      ( !UNLOAD ?auto_8265 ?auto_8264 ?auto_8267 ?auto_8266 )
      ( !DROP ?auto_8265 ?auto_8264 ?auto_8263 ?auto_8266 )
      ( MAKE-1CRATE-VERIFY ?auto_8263 ?auto_8264 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8275 - SURFACE
      ?auto_8276 - SURFACE
      ?auto_8277 - SURFACE
      ?auto_8278 - SURFACE
    )
    :vars
    (
      ?auto_8279 - HOIST
      ?auto_8280 - PLACE
      ?auto_8284 - PLACE
      ?auto_8282 - HOIST
      ?auto_8283 - SURFACE
      ?auto_8286 - PLACE
      ?auto_8288 - HOIST
      ?auto_8285 - SURFACE
      ?auto_8287 - SURFACE
      ?auto_8281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8279 ?auto_8280 ) ( IS-CRATE ?auto_8278 ) ( not ( = ?auto_8284 ?auto_8280 ) ) ( HOIST-AT ?auto_8282 ?auto_8284 ) ( AVAILABLE ?auto_8282 ) ( SURFACE-AT ?auto_8278 ?auto_8284 ) ( ON ?auto_8278 ?auto_8283 ) ( CLEAR ?auto_8278 ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8283 ) ) ( not ( = ?auto_8278 ?auto_8283 ) ) ( not ( = ?auto_8279 ?auto_8282 ) ) ( IS-CRATE ?auto_8277 ) ( not ( = ?auto_8286 ?auto_8280 ) ) ( HOIST-AT ?auto_8288 ?auto_8286 ) ( SURFACE-AT ?auto_8277 ?auto_8286 ) ( ON ?auto_8277 ?auto_8285 ) ( CLEAR ?auto_8277 ) ( not ( = ?auto_8276 ?auto_8277 ) ) ( not ( = ?auto_8276 ?auto_8285 ) ) ( not ( = ?auto_8277 ?auto_8285 ) ) ( not ( = ?auto_8279 ?auto_8288 ) ) ( SURFACE-AT ?auto_8275 ?auto_8280 ) ( CLEAR ?auto_8275 ) ( IS-CRATE ?auto_8276 ) ( AVAILABLE ?auto_8279 ) ( AVAILABLE ?auto_8288 ) ( SURFACE-AT ?auto_8276 ?auto_8286 ) ( ON ?auto_8276 ?auto_8287 ) ( CLEAR ?auto_8276 ) ( TRUCK-AT ?auto_8281 ?auto_8280 ) ( not ( = ?auto_8275 ?auto_8276 ) ) ( not ( = ?auto_8275 ?auto_8287 ) ) ( not ( = ?auto_8276 ?auto_8287 ) ) ( not ( = ?auto_8275 ?auto_8277 ) ) ( not ( = ?auto_8275 ?auto_8285 ) ) ( not ( = ?auto_8277 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8275 ?auto_8278 ) ) ( not ( = ?auto_8275 ?auto_8283 ) ) ( not ( = ?auto_8276 ?auto_8278 ) ) ( not ( = ?auto_8276 ?auto_8283 ) ) ( not ( = ?auto_8278 ?auto_8285 ) ) ( not ( = ?auto_8278 ?auto_8287 ) ) ( not ( = ?auto_8284 ?auto_8286 ) ) ( not ( = ?auto_8282 ?auto_8288 ) ) ( not ( = ?auto_8283 ?auto_8285 ) ) ( not ( = ?auto_8283 ?auto_8287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8275 ?auto_8276 ?auto_8277 )
      ( MAKE-1CRATE ?auto_8277 ?auto_8278 )
      ( MAKE-3CRATE-VERIFY ?auto_8275 ?auto_8276 ?auto_8277 ?auto_8278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8291 - SURFACE
      ?auto_8292 - SURFACE
    )
    :vars
    (
      ?auto_8293 - HOIST
      ?auto_8294 - PLACE
      ?auto_8296 - PLACE
      ?auto_8297 - HOIST
      ?auto_8298 - SURFACE
      ?auto_8295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8293 ?auto_8294 ) ( SURFACE-AT ?auto_8291 ?auto_8294 ) ( CLEAR ?auto_8291 ) ( IS-CRATE ?auto_8292 ) ( AVAILABLE ?auto_8293 ) ( not ( = ?auto_8296 ?auto_8294 ) ) ( HOIST-AT ?auto_8297 ?auto_8296 ) ( AVAILABLE ?auto_8297 ) ( SURFACE-AT ?auto_8292 ?auto_8296 ) ( ON ?auto_8292 ?auto_8298 ) ( CLEAR ?auto_8292 ) ( TRUCK-AT ?auto_8295 ?auto_8294 ) ( not ( = ?auto_8291 ?auto_8292 ) ) ( not ( = ?auto_8291 ?auto_8298 ) ) ( not ( = ?auto_8292 ?auto_8298 ) ) ( not ( = ?auto_8293 ?auto_8297 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8295 ?auto_8294 ?auto_8296 )
      ( !LIFT ?auto_8297 ?auto_8292 ?auto_8298 ?auto_8296 )
      ( !LOAD ?auto_8297 ?auto_8292 ?auto_8295 ?auto_8296 )
      ( !DRIVE ?auto_8295 ?auto_8296 ?auto_8294 )
      ( !UNLOAD ?auto_8293 ?auto_8292 ?auto_8295 ?auto_8294 )
      ( !DROP ?auto_8293 ?auto_8292 ?auto_8291 ?auto_8294 )
      ( MAKE-1CRATE-VERIFY ?auto_8291 ?auto_8292 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8304 - SURFACE
      ?auto_8305 - SURFACE
      ?auto_8306 - SURFACE
      ?auto_8307 - SURFACE
      ?auto_8308 - SURFACE
    )
    :vars
    (
      ?auto_8311 - HOIST
      ?auto_8310 - PLACE
      ?auto_8312 - PLACE
      ?auto_8314 - HOIST
      ?auto_8313 - SURFACE
      ?auto_8320 - PLACE
      ?auto_8319 - HOIST
      ?auto_8315 - SURFACE
      ?auto_8321 - PLACE
      ?auto_8318 - HOIST
      ?auto_8316 - SURFACE
      ?auto_8317 - SURFACE
      ?auto_8309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8311 ?auto_8310 ) ( IS-CRATE ?auto_8308 ) ( not ( = ?auto_8312 ?auto_8310 ) ) ( HOIST-AT ?auto_8314 ?auto_8312 ) ( AVAILABLE ?auto_8314 ) ( SURFACE-AT ?auto_8308 ?auto_8312 ) ( ON ?auto_8308 ?auto_8313 ) ( CLEAR ?auto_8308 ) ( not ( = ?auto_8307 ?auto_8308 ) ) ( not ( = ?auto_8307 ?auto_8313 ) ) ( not ( = ?auto_8308 ?auto_8313 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( IS-CRATE ?auto_8307 ) ( not ( = ?auto_8320 ?auto_8310 ) ) ( HOIST-AT ?auto_8319 ?auto_8320 ) ( AVAILABLE ?auto_8319 ) ( SURFACE-AT ?auto_8307 ?auto_8320 ) ( ON ?auto_8307 ?auto_8315 ) ( CLEAR ?auto_8307 ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8306 ?auto_8315 ) ) ( not ( = ?auto_8307 ?auto_8315 ) ) ( not ( = ?auto_8311 ?auto_8319 ) ) ( IS-CRATE ?auto_8306 ) ( not ( = ?auto_8321 ?auto_8310 ) ) ( HOIST-AT ?auto_8318 ?auto_8321 ) ( SURFACE-AT ?auto_8306 ?auto_8321 ) ( ON ?auto_8306 ?auto_8316 ) ( CLEAR ?auto_8306 ) ( not ( = ?auto_8305 ?auto_8306 ) ) ( not ( = ?auto_8305 ?auto_8316 ) ) ( not ( = ?auto_8306 ?auto_8316 ) ) ( not ( = ?auto_8311 ?auto_8318 ) ) ( SURFACE-AT ?auto_8304 ?auto_8310 ) ( CLEAR ?auto_8304 ) ( IS-CRATE ?auto_8305 ) ( AVAILABLE ?auto_8311 ) ( AVAILABLE ?auto_8318 ) ( SURFACE-AT ?auto_8305 ?auto_8321 ) ( ON ?auto_8305 ?auto_8317 ) ( CLEAR ?auto_8305 ) ( TRUCK-AT ?auto_8309 ?auto_8310 ) ( not ( = ?auto_8304 ?auto_8305 ) ) ( not ( = ?auto_8304 ?auto_8317 ) ) ( not ( = ?auto_8305 ?auto_8317 ) ) ( not ( = ?auto_8304 ?auto_8306 ) ) ( not ( = ?auto_8304 ?auto_8316 ) ) ( not ( = ?auto_8306 ?auto_8317 ) ) ( not ( = ?auto_8316 ?auto_8317 ) ) ( not ( = ?auto_8304 ?auto_8307 ) ) ( not ( = ?auto_8304 ?auto_8315 ) ) ( not ( = ?auto_8305 ?auto_8307 ) ) ( not ( = ?auto_8305 ?auto_8315 ) ) ( not ( = ?auto_8307 ?auto_8316 ) ) ( not ( = ?auto_8307 ?auto_8317 ) ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( not ( = ?auto_8319 ?auto_8318 ) ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8317 ) ) ( not ( = ?auto_8304 ?auto_8308 ) ) ( not ( = ?auto_8304 ?auto_8313 ) ) ( not ( = ?auto_8305 ?auto_8308 ) ) ( not ( = ?auto_8305 ?auto_8313 ) ) ( not ( = ?auto_8306 ?auto_8308 ) ) ( not ( = ?auto_8306 ?auto_8313 ) ) ( not ( = ?auto_8308 ?auto_8315 ) ) ( not ( = ?auto_8308 ?auto_8316 ) ) ( not ( = ?auto_8308 ?auto_8317 ) ) ( not ( = ?auto_8312 ?auto_8320 ) ) ( not ( = ?auto_8312 ?auto_8321 ) ) ( not ( = ?auto_8314 ?auto_8319 ) ) ( not ( = ?auto_8314 ?auto_8318 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8316 ) ) ( not ( = ?auto_8313 ?auto_8317 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8304 ?auto_8305 ?auto_8306 ?auto_8307 )
      ( MAKE-1CRATE ?auto_8307 ?auto_8308 )
      ( MAKE-4CRATE-VERIFY ?auto_8304 ?auto_8305 ?auto_8306 ?auto_8307 ?auto_8308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8324 - SURFACE
      ?auto_8325 - SURFACE
    )
    :vars
    (
      ?auto_8326 - HOIST
      ?auto_8327 - PLACE
      ?auto_8329 - PLACE
      ?auto_8330 - HOIST
      ?auto_8331 - SURFACE
      ?auto_8328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8326 ?auto_8327 ) ( SURFACE-AT ?auto_8324 ?auto_8327 ) ( CLEAR ?auto_8324 ) ( IS-CRATE ?auto_8325 ) ( AVAILABLE ?auto_8326 ) ( not ( = ?auto_8329 ?auto_8327 ) ) ( HOIST-AT ?auto_8330 ?auto_8329 ) ( AVAILABLE ?auto_8330 ) ( SURFACE-AT ?auto_8325 ?auto_8329 ) ( ON ?auto_8325 ?auto_8331 ) ( CLEAR ?auto_8325 ) ( TRUCK-AT ?auto_8328 ?auto_8327 ) ( not ( = ?auto_8324 ?auto_8325 ) ) ( not ( = ?auto_8324 ?auto_8331 ) ) ( not ( = ?auto_8325 ?auto_8331 ) ) ( not ( = ?auto_8326 ?auto_8330 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8328 ?auto_8327 ?auto_8329 )
      ( !LIFT ?auto_8330 ?auto_8325 ?auto_8331 ?auto_8329 )
      ( !LOAD ?auto_8330 ?auto_8325 ?auto_8328 ?auto_8329 )
      ( !DRIVE ?auto_8328 ?auto_8329 ?auto_8327 )
      ( !UNLOAD ?auto_8326 ?auto_8325 ?auto_8328 ?auto_8327 )
      ( !DROP ?auto_8326 ?auto_8325 ?auto_8324 ?auto_8327 )
      ( MAKE-1CRATE-VERIFY ?auto_8324 ?auto_8325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8338 - SURFACE
      ?auto_8339 - SURFACE
      ?auto_8340 - SURFACE
      ?auto_8341 - SURFACE
      ?auto_8342 - SURFACE
      ?auto_8343 - SURFACE
    )
    :vars
    (
      ?auto_8345 - HOIST
      ?auto_8349 - PLACE
      ?auto_8347 - PLACE
      ?auto_8346 - HOIST
      ?auto_8348 - SURFACE
      ?auto_8351 - PLACE
      ?auto_8353 - HOIST
      ?auto_8355 - SURFACE
      ?auto_8356 - SURFACE
      ?auto_8352 - PLACE
      ?auto_8354 - HOIST
      ?auto_8350 - SURFACE
      ?auto_8357 - SURFACE
      ?auto_8344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8345 ?auto_8349 ) ( IS-CRATE ?auto_8343 ) ( not ( = ?auto_8347 ?auto_8349 ) ) ( HOIST-AT ?auto_8346 ?auto_8347 ) ( SURFACE-AT ?auto_8343 ?auto_8347 ) ( ON ?auto_8343 ?auto_8348 ) ( CLEAR ?auto_8343 ) ( not ( = ?auto_8342 ?auto_8343 ) ) ( not ( = ?auto_8342 ?auto_8348 ) ) ( not ( = ?auto_8343 ?auto_8348 ) ) ( not ( = ?auto_8345 ?auto_8346 ) ) ( IS-CRATE ?auto_8342 ) ( not ( = ?auto_8351 ?auto_8349 ) ) ( HOIST-AT ?auto_8353 ?auto_8351 ) ( AVAILABLE ?auto_8353 ) ( SURFACE-AT ?auto_8342 ?auto_8351 ) ( ON ?auto_8342 ?auto_8355 ) ( CLEAR ?auto_8342 ) ( not ( = ?auto_8341 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8355 ) ) ( not ( = ?auto_8342 ?auto_8355 ) ) ( not ( = ?auto_8345 ?auto_8353 ) ) ( IS-CRATE ?auto_8341 ) ( AVAILABLE ?auto_8346 ) ( SURFACE-AT ?auto_8341 ?auto_8347 ) ( ON ?auto_8341 ?auto_8356 ) ( CLEAR ?auto_8341 ) ( not ( = ?auto_8340 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8356 ) ) ( not ( = ?auto_8341 ?auto_8356 ) ) ( IS-CRATE ?auto_8340 ) ( not ( = ?auto_8352 ?auto_8349 ) ) ( HOIST-AT ?auto_8354 ?auto_8352 ) ( SURFACE-AT ?auto_8340 ?auto_8352 ) ( ON ?auto_8340 ?auto_8350 ) ( CLEAR ?auto_8340 ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8350 ) ) ( not ( = ?auto_8340 ?auto_8350 ) ) ( not ( = ?auto_8345 ?auto_8354 ) ) ( SURFACE-AT ?auto_8338 ?auto_8349 ) ( CLEAR ?auto_8338 ) ( IS-CRATE ?auto_8339 ) ( AVAILABLE ?auto_8345 ) ( AVAILABLE ?auto_8354 ) ( SURFACE-AT ?auto_8339 ?auto_8352 ) ( ON ?auto_8339 ?auto_8357 ) ( CLEAR ?auto_8339 ) ( TRUCK-AT ?auto_8344 ?auto_8349 ) ( not ( = ?auto_8338 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8357 ) ) ( not ( = ?auto_8339 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8340 ) ) ( not ( = ?auto_8338 ?auto_8350 ) ) ( not ( = ?auto_8340 ?auto_8357 ) ) ( not ( = ?auto_8350 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8341 ) ) ( not ( = ?auto_8338 ?auto_8356 ) ) ( not ( = ?auto_8339 ?auto_8341 ) ) ( not ( = ?auto_8339 ?auto_8356 ) ) ( not ( = ?auto_8341 ?auto_8350 ) ) ( not ( = ?auto_8341 ?auto_8357 ) ) ( not ( = ?auto_8347 ?auto_8352 ) ) ( not ( = ?auto_8346 ?auto_8354 ) ) ( not ( = ?auto_8356 ?auto_8350 ) ) ( not ( = ?auto_8356 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8342 ) ) ( not ( = ?auto_8338 ?auto_8355 ) ) ( not ( = ?auto_8339 ?auto_8342 ) ) ( not ( = ?auto_8339 ?auto_8355 ) ) ( not ( = ?auto_8340 ?auto_8342 ) ) ( not ( = ?auto_8340 ?auto_8355 ) ) ( not ( = ?auto_8342 ?auto_8356 ) ) ( not ( = ?auto_8342 ?auto_8350 ) ) ( not ( = ?auto_8342 ?auto_8357 ) ) ( not ( = ?auto_8351 ?auto_8347 ) ) ( not ( = ?auto_8351 ?auto_8352 ) ) ( not ( = ?auto_8353 ?auto_8346 ) ) ( not ( = ?auto_8353 ?auto_8354 ) ) ( not ( = ?auto_8355 ?auto_8356 ) ) ( not ( = ?auto_8355 ?auto_8350 ) ) ( not ( = ?auto_8355 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8343 ) ) ( not ( = ?auto_8338 ?auto_8348 ) ) ( not ( = ?auto_8339 ?auto_8343 ) ) ( not ( = ?auto_8339 ?auto_8348 ) ) ( not ( = ?auto_8340 ?auto_8343 ) ) ( not ( = ?auto_8340 ?auto_8348 ) ) ( not ( = ?auto_8341 ?auto_8343 ) ) ( not ( = ?auto_8341 ?auto_8348 ) ) ( not ( = ?auto_8343 ?auto_8355 ) ) ( not ( = ?auto_8343 ?auto_8356 ) ) ( not ( = ?auto_8343 ?auto_8350 ) ) ( not ( = ?auto_8343 ?auto_8357 ) ) ( not ( = ?auto_8348 ?auto_8355 ) ) ( not ( = ?auto_8348 ?auto_8356 ) ) ( not ( = ?auto_8348 ?auto_8350 ) ) ( not ( = ?auto_8348 ?auto_8357 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8338 ?auto_8339 ?auto_8340 ?auto_8341 ?auto_8342 )
      ( MAKE-1CRATE ?auto_8342 ?auto_8343 )
      ( MAKE-5CRATE-VERIFY ?auto_8338 ?auto_8339 ?auto_8340 ?auto_8341 ?auto_8342 ?auto_8343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8360 - SURFACE
      ?auto_8361 - SURFACE
    )
    :vars
    (
      ?auto_8362 - HOIST
      ?auto_8363 - PLACE
      ?auto_8365 - PLACE
      ?auto_8366 - HOIST
      ?auto_8367 - SURFACE
      ?auto_8364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8362 ?auto_8363 ) ( SURFACE-AT ?auto_8360 ?auto_8363 ) ( CLEAR ?auto_8360 ) ( IS-CRATE ?auto_8361 ) ( AVAILABLE ?auto_8362 ) ( not ( = ?auto_8365 ?auto_8363 ) ) ( HOIST-AT ?auto_8366 ?auto_8365 ) ( AVAILABLE ?auto_8366 ) ( SURFACE-AT ?auto_8361 ?auto_8365 ) ( ON ?auto_8361 ?auto_8367 ) ( CLEAR ?auto_8361 ) ( TRUCK-AT ?auto_8364 ?auto_8363 ) ( not ( = ?auto_8360 ?auto_8361 ) ) ( not ( = ?auto_8360 ?auto_8367 ) ) ( not ( = ?auto_8361 ?auto_8367 ) ) ( not ( = ?auto_8362 ?auto_8366 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8364 ?auto_8363 ?auto_8365 )
      ( !LIFT ?auto_8366 ?auto_8361 ?auto_8367 ?auto_8365 )
      ( !LOAD ?auto_8366 ?auto_8361 ?auto_8364 ?auto_8365 )
      ( !DRIVE ?auto_8364 ?auto_8365 ?auto_8363 )
      ( !UNLOAD ?auto_8362 ?auto_8361 ?auto_8364 ?auto_8363 )
      ( !DROP ?auto_8362 ?auto_8361 ?auto_8360 ?auto_8363 )
      ( MAKE-1CRATE-VERIFY ?auto_8360 ?auto_8361 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8375 - SURFACE
      ?auto_8376 - SURFACE
      ?auto_8377 - SURFACE
      ?auto_8378 - SURFACE
      ?auto_8379 - SURFACE
      ?auto_8380 - SURFACE
      ?auto_8381 - SURFACE
    )
    :vars
    (
      ?auto_8386 - HOIST
      ?auto_8384 - PLACE
      ?auto_8385 - PLACE
      ?auto_8383 - HOIST
      ?auto_8387 - SURFACE
      ?auto_8394 - PLACE
      ?auto_8389 - HOIST
      ?auto_8392 - SURFACE
      ?auto_8388 - PLACE
      ?auto_8396 - HOIST
      ?auto_8393 - SURFACE
      ?auto_8390 - SURFACE
      ?auto_8395 - SURFACE
      ?auto_8391 - SURFACE
      ?auto_8382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8386 ?auto_8384 ) ( IS-CRATE ?auto_8381 ) ( not ( = ?auto_8385 ?auto_8384 ) ) ( HOIST-AT ?auto_8383 ?auto_8385 ) ( SURFACE-AT ?auto_8381 ?auto_8385 ) ( ON ?auto_8381 ?auto_8387 ) ( CLEAR ?auto_8381 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8387 ) ) ( not ( = ?auto_8381 ?auto_8387 ) ) ( not ( = ?auto_8386 ?auto_8383 ) ) ( IS-CRATE ?auto_8380 ) ( not ( = ?auto_8394 ?auto_8384 ) ) ( HOIST-AT ?auto_8389 ?auto_8394 ) ( SURFACE-AT ?auto_8380 ?auto_8394 ) ( ON ?auto_8380 ?auto_8392 ) ( CLEAR ?auto_8380 ) ( not ( = ?auto_8379 ?auto_8380 ) ) ( not ( = ?auto_8379 ?auto_8392 ) ) ( not ( = ?auto_8380 ?auto_8392 ) ) ( not ( = ?auto_8386 ?auto_8389 ) ) ( IS-CRATE ?auto_8379 ) ( not ( = ?auto_8388 ?auto_8384 ) ) ( HOIST-AT ?auto_8396 ?auto_8388 ) ( AVAILABLE ?auto_8396 ) ( SURFACE-AT ?auto_8379 ?auto_8388 ) ( ON ?auto_8379 ?auto_8393 ) ( CLEAR ?auto_8379 ) ( not ( = ?auto_8378 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8393 ) ) ( not ( = ?auto_8379 ?auto_8393 ) ) ( not ( = ?auto_8386 ?auto_8396 ) ) ( IS-CRATE ?auto_8378 ) ( AVAILABLE ?auto_8389 ) ( SURFACE-AT ?auto_8378 ?auto_8394 ) ( ON ?auto_8378 ?auto_8390 ) ( CLEAR ?auto_8378 ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( not ( = ?auto_8377 ?auto_8390 ) ) ( not ( = ?auto_8378 ?auto_8390 ) ) ( IS-CRATE ?auto_8377 ) ( SURFACE-AT ?auto_8377 ?auto_8385 ) ( ON ?auto_8377 ?auto_8395 ) ( CLEAR ?auto_8377 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8395 ) ) ( not ( = ?auto_8377 ?auto_8395 ) ) ( SURFACE-AT ?auto_8375 ?auto_8384 ) ( CLEAR ?auto_8375 ) ( IS-CRATE ?auto_8376 ) ( AVAILABLE ?auto_8386 ) ( AVAILABLE ?auto_8383 ) ( SURFACE-AT ?auto_8376 ?auto_8385 ) ( ON ?auto_8376 ?auto_8391 ) ( CLEAR ?auto_8376 ) ( TRUCK-AT ?auto_8382 ?auto_8384 ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8391 ) ) ( not ( = ?auto_8376 ?auto_8391 ) ) ( not ( = ?auto_8375 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8395 ) ) ( not ( = ?auto_8377 ?auto_8391 ) ) ( not ( = ?auto_8395 ?auto_8391 ) ) ( not ( = ?auto_8375 ?auto_8378 ) ) ( not ( = ?auto_8375 ?auto_8390 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8390 ) ) ( not ( = ?auto_8378 ?auto_8395 ) ) ( not ( = ?auto_8378 ?auto_8391 ) ) ( not ( = ?auto_8394 ?auto_8385 ) ) ( not ( = ?auto_8389 ?auto_8383 ) ) ( not ( = ?auto_8390 ?auto_8395 ) ) ( not ( = ?auto_8390 ?auto_8391 ) ) ( not ( = ?auto_8375 ?auto_8379 ) ) ( not ( = ?auto_8375 ?auto_8393 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8376 ?auto_8393 ) ) ( not ( = ?auto_8377 ?auto_8379 ) ) ( not ( = ?auto_8377 ?auto_8393 ) ) ( not ( = ?auto_8379 ?auto_8390 ) ) ( not ( = ?auto_8379 ?auto_8395 ) ) ( not ( = ?auto_8379 ?auto_8391 ) ) ( not ( = ?auto_8388 ?auto_8394 ) ) ( not ( = ?auto_8388 ?auto_8385 ) ) ( not ( = ?auto_8396 ?auto_8389 ) ) ( not ( = ?auto_8396 ?auto_8383 ) ) ( not ( = ?auto_8393 ?auto_8390 ) ) ( not ( = ?auto_8393 ?auto_8395 ) ) ( not ( = ?auto_8393 ?auto_8391 ) ) ( not ( = ?auto_8375 ?auto_8380 ) ) ( not ( = ?auto_8375 ?auto_8392 ) ) ( not ( = ?auto_8376 ?auto_8380 ) ) ( not ( = ?auto_8376 ?auto_8392 ) ) ( not ( = ?auto_8377 ?auto_8380 ) ) ( not ( = ?auto_8377 ?auto_8392 ) ) ( not ( = ?auto_8378 ?auto_8380 ) ) ( not ( = ?auto_8378 ?auto_8392 ) ) ( not ( = ?auto_8380 ?auto_8393 ) ) ( not ( = ?auto_8380 ?auto_8390 ) ) ( not ( = ?auto_8380 ?auto_8395 ) ) ( not ( = ?auto_8380 ?auto_8391 ) ) ( not ( = ?auto_8392 ?auto_8393 ) ) ( not ( = ?auto_8392 ?auto_8390 ) ) ( not ( = ?auto_8392 ?auto_8395 ) ) ( not ( = ?auto_8392 ?auto_8391 ) ) ( not ( = ?auto_8375 ?auto_8381 ) ) ( not ( = ?auto_8375 ?auto_8387 ) ) ( not ( = ?auto_8376 ?auto_8381 ) ) ( not ( = ?auto_8376 ?auto_8387 ) ) ( not ( = ?auto_8377 ?auto_8381 ) ) ( not ( = ?auto_8377 ?auto_8387 ) ) ( not ( = ?auto_8378 ?auto_8381 ) ) ( not ( = ?auto_8378 ?auto_8387 ) ) ( not ( = ?auto_8379 ?auto_8381 ) ) ( not ( = ?auto_8379 ?auto_8387 ) ) ( not ( = ?auto_8381 ?auto_8392 ) ) ( not ( = ?auto_8381 ?auto_8393 ) ) ( not ( = ?auto_8381 ?auto_8390 ) ) ( not ( = ?auto_8381 ?auto_8395 ) ) ( not ( = ?auto_8381 ?auto_8391 ) ) ( not ( = ?auto_8387 ?auto_8392 ) ) ( not ( = ?auto_8387 ?auto_8393 ) ) ( not ( = ?auto_8387 ?auto_8390 ) ) ( not ( = ?auto_8387 ?auto_8395 ) ) ( not ( = ?auto_8387 ?auto_8391 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8375 ?auto_8376 ?auto_8377 ?auto_8378 ?auto_8379 ?auto_8380 )
      ( MAKE-1CRATE ?auto_8380 ?auto_8381 )
      ( MAKE-6CRATE-VERIFY ?auto_8375 ?auto_8376 ?auto_8377 ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8399 - SURFACE
      ?auto_8400 - SURFACE
    )
    :vars
    (
      ?auto_8401 - HOIST
      ?auto_8402 - PLACE
      ?auto_8404 - PLACE
      ?auto_8405 - HOIST
      ?auto_8406 - SURFACE
      ?auto_8403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8401 ?auto_8402 ) ( SURFACE-AT ?auto_8399 ?auto_8402 ) ( CLEAR ?auto_8399 ) ( IS-CRATE ?auto_8400 ) ( AVAILABLE ?auto_8401 ) ( not ( = ?auto_8404 ?auto_8402 ) ) ( HOIST-AT ?auto_8405 ?auto_8404 ) ( AVAILABLE ?auto_8405 ) ( SURFACE-AT ?auto_8400 ?auto_8404 ) ( ON ?auto_8400 ?auto_8406 ) ( CLEAR ?auto_8400 ) ( TRUCK-AT ?auto_8403 ?auto_8402 ) ( not ( = ?auto_8399 ?auto_8400 ) ) ( not ( = ?auto_8399 ?auto_8406 ) ) ( not ( = ?auto_8400 ?auto_8406 ) ) ( not ( = ?auto_8401 ?auto_8405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8403 ?auto_8402 ?auto_8404 )
      ( !LIFT ?auto_8405 ?auto_8400 ?auto_8406 ?auto_8404 )
      ( !LOAD ?auto_8405 ?auto_8400 ?auto_8403 ?auto_8404 )
      ( !DRIVE ?auto_8403 ?auto_8404 ?auto_8402 )
      ( !UNLOAD ?auto_8401 ?auto_8400 ?auto_8403 ?auto_8402 )
      ( !DROP ?auto_8401 ?auto_8400 ?auto_8399 ?auto_8402 )
      ( MAKE-1CRATE-VERIFY ?auto_8399 ?auto_8400 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8415 - SURFACE
      ?auto_8416 - SURFACE
      ?auto_8417 - SURFACE
      ?auto_8418 - SURFACE
      ?auto_8419 - SURFACE
      ?auto_8420 - SURFACE
      ?auto_8421 - SURFACE
      ?auto_8422 - SURFACE
    )
    :vars
    (
      ?auto_8427 - HOIST
      ?auto_8426 - PLACE
      ?auto_8425 - PLACE
      ?auto_8424 - HOIST
      ?auto_8423 - SURFACE
      ?auto_8431 - PLACE
      ?auto_8432 - HOIST
      ?auto_8439 - SURFACE
      ?auto_8434 - PLACE
      ?auto_8437 - HOIST
      ?auto_8429 - SURFACE
      ?auto_8438 - PLACE
      ?auto_8430 - HOIST
      ?auto_8435 - SURFACE
      ?auto_8436 - SURFACE
      ?auto_8440 - SURFACE
      ?auto_8433 - SURFACE
      ?auto_8428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8427 ?auto_8426 ) ( IS-CRATE ?auto_8422 ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( HOIST-AT ?auto_8424 ?auto_8425 ) ( AVAILABLE ?auto_8424 ) ( SURFACE-AT ?auto_8422 ?auto_8425 ) ( ON ?auto_8422 ?auto_8423 ) ( CLEAR ?auto_8422 ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( not ( = ?auto_8421 ?auto_8423 ) ) ( not ( = ?auto_8422 ?auto_8423 ) ) ( not ( = ?auto_8427 ?auto_8424 ) ) ( IS-CRATE ?auto_8421 ) ( not ( = ?auto_8431 ?auto_8426 ) ) ( HOIST-AT ?auto_8432 ?auto_8431 ) ( SURFACE-AT ?auto_8421 ?auto_8431 ) ( ON ?auto_8421 ?auto_8439 ) ( CLEAR ?auto_8421 ) ( not ( = ?auto_8420 ?auto_8421 ) ) ( not ( = ?auto_8420 ?auto_8439 ) ) ( not ( = ?auto_8421 ?auto_8439 ) ) ( not ( = ?auto_8427 ?auto_8432 ) ) ( IS-CRATE ?auto_8420 ) ( not ( = ?auto_8434 ?auto_8426 ) ) ( HOIST-AT ?auto_8437 ?auto_8434 ) ( SURFACE-AT ?auto_8420 ?auto_8434 ) ( ON ?auto_8420 ?auto_8429 ) ( CLEAR ?auto_8420 ) ( not ( = ?auto_8419 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8429 ) ) ( not ( = ?auto_8420 ?auto_8429 ) ) ( not ( = ?auto_8427 ?auto_8437 ) ) ( IS-CRATE ?auto_8419 ) ( not ( = ?auto_8438 ?auto_8426 ) ) ( HOIST-AT ?auto_8430 ?auto_8438 ) ( AVAILABLE ?auto_8430 ) ( SURFACE-AT ?auto_8419 ?auto_8438 ) ( ON ?auto_8419 ?auto_8435 ) ( CLEAR ?auto_8419 ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8435 ) ) ( not ( = ?auto_8419 ?auto_8435 ) ) ( not ( = ?auto_8427 ?auto_8430 ) ) ( IS-CRATE ?auto_8418 ) ( AVAILABLE ?auto_8437 ) ( SURFACE-AT ?auto_8418 ?auto_8434 ) ( ON ?auto_8418 ?auto_8436 ) ( CLEAR ?auto_8418 ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( not ( = ?auto_8417 ?auto_8436 ) ) ( not ( = ?auto_8418 ?auto_8436 ) ) ( IS-CRATE ?auto_8417 ) ( SURFACE-AT ?auto_8417 ?auto_8431 ) ( ON ?auto_8417 ?auto_8440 ) ( CLEAR ?auto_8417 ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8440 ) ) ( not ( = ?auto_8417 ?auto_8440 ) ) ( SURFACE-AT ?auto_8415 ?auto_8426 ) ( CLEAR ?auto_8415 ) ( IS-CRATE ?auto_8416 ) ( AVAILABLE ?auto_8427 ) ( AVAILABLE ?auto_8432 ) ( SURFACE-AT ?auto_8416 ?auto_8431 ) ( ON ?auto_8416 ?auto_8433 ) ( CLEAR ?auto_8416 ) ( TRUCK-AT ?auto_8428 ?auto_8426 ) ( not ( = ?auto_8415 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8433 ) ) ( not ( = ?auto_8416 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8417 ) ) ( not ( = ?auto_8415 ?auto_8440 ) ) ( not ( = ?auto_8417 ?auto_8433 ) ) ( not ( = ?auto_8440 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8418 ) ) ( not ( = ?auto_8415 ?auto_8436 ) ) ( not ( = ?auto_8416 ?auto_8418 ) ) ( not ( = ?auto_8416 ?auto_8436 ) ) ( not ( = ?auto_8418 ?auto_8440 ) ) ( not ( = ?auto_8418 ?auto_8433 ) ) ( not ( = ?auto_8434 ?auto_8431 ) ) ( not ( = ?auto_8437 ?auto_8432 ) ) ( not ( = ?auto_8436 ?auto_8440 ) ) ( not ( = ?auto_8436 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8419 ) ) ( not ( = ?auto_8415 ?auto_8435 ) ) ( not ( = ?auto_8416 ?auto_8419 ) ) ( not ( = ?auto_8416 ?auto_8435 ) ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8417 ?auto_8435 ) ) ( not ( = ?auto_8419 ?auto_8436 ) ) ( not ( = ?auto_8419 ?auto_8440 ) ) ( not ( = ?auto_8419 ?auto_8433 ) ) ( not ( = ?auto_8438 ?auto_8434 ) ) ( not ( = ?auto_8438 ?auto_8431 ) ) ( not ( = ?auto_8430 ?auto_8437 ) ) ( not ( = ?auto_8430 ?auto_8432 ) ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8435 ?auto_8440 ) ) ( not ( = ?auto_8435 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8420 ) ) ( not ( = ?auto_8415 ?auto_8429 ) ) ( not ( = ?auto_8416 ?auto_8420 ) ) ( not ( = ?auto_8416 ?auto_8429 ) ) ( not ( = ?auto_8417 ?auto_8420 ) ) ( not ( = ?auto_8417 ?auto_8429 ) ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( not ( = ?auto_8418 ?auto_8429 ) ) ( not ( = ?auto_8420 ?auto_8435 ) ) ( not ( = ?auto_8420 ?auto_8436 ) ) ( not ( = ?auto_8420 ?auto_8440 ) ) ( not ( = ?auto_8420 ?auto_8433 ) ) ( not ( = ?auto_8429 ?auto_8435 ) ) ( not ( = ?auto_8429 ?auto_8436 ) ) ( not ( = ?auto_8429 ?auto_8440 ) ) ( not ( = ?auto_8429 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8421 ) ) ( not ( = ?auto_8415 ?auto_8439 ) ) ( not ( = ?auto_8416 ?auto_8421 ) ) ( not ( = ?auto_8416 ?auto_8439 ) ) ( not ( = ?auto_8417 ?auto_8421 ) ) ( not ( = ?auto_8417 ?auto_8439 ) ) ( not ( = ?auto_8418 ?auto_8421 ) ) ( not ( = ?auto_8418 ?auto_8439 ) ) ( not ( = ?auto_8419 ?auto_8421 ) ) ( not ( = ?auto_8419 ?auto_8439 ) ) ( not ( = ?auto_8421 ?auto_8429 ) ) ( not ( = ?auto_8421 ?auto_8435 ) ) ( not ( = ?auto_8421 ?auto_8436 ) ) ( not ( = ?auto_8421 ?auto_8440 ) ) ( not ( = ?auto_8421 ?auto_8433 ) ) ( not ( = ?auto_8439 ?auto_8429 ) ) ( not ( = ?auto_8439 ?auto_8435 ) ) ( not ( = ?auto_8439 ?auto_8436 ) ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8433 ) ) ( not ( = ?auto_8415 ?auto_8422 ) ) ( not ( = ?auto_8415 ?auto_8423 ) ) ( not ( = ?auto_8416 ?auto_8422 ) ) ( not ( = ?auto_8416 ?auto_8423 ) ) ( not ( = ?auto_8417 ?auto_8422 ) ) ( not ( = ?auto_8417 ?auto_8423 ) ) ( not ( = ?auto_8418 ?auto_8422 ) ) ( not ( = ?auto_8418 ?auto_8423 ) ) ( not ( = ?auto_8419 ?auto_8422 ) ) ( not ( = ?auto_8419 ?auto_8423 ) ) ( not ( = ?auto_8420 ?auto_8422 ) ) ( not ( = ?auto_8420 ?auto_8423 ) ) ( not ( = ?auto_8422 ?auto_8439 ) ) ( not ( = ?auto_8422 ?auto_8429 ) ) ( not ( = ?auto_8422 ?auto_8435 ) ) ( not ( = ?auto_8422 ?auto_8436 ) ) ( not ( = ?auto_8422 ?auto_8440 ) ) ( not ( = ?auto_8422 ?auto_8433 ) ) ( not ( = ?auto_8425 ?auto_8431 ) ) ( not ( = ?auto_8425 ?auto_8434 ) ) ( not ( = ?auto_8425 ?auto_8438 ) ) ( not ( = ?auto_8424 ?auto_8432 ) ) ( not ( = ?auto_8424 ?auto_8437 ) ) ( not ( = ?auto_8424 ?auto_8430 ) ) ( not ( = ?auto_8423 ?auto_8439 ) ) ( not ( = ?auto_8423 ?auto_8429 ) ) ( not ( = ?auto_8423 ?auto_8435 ) ) ( not ( = ?auto_8423 ?auto_8436 ) ) ( not ( = ?auto_8423 ?auto_8440 ) ) ( not ( = ?auto_8423 ?auto_8433 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ?auto_8419 ?auto_8420 ?auto_8421 )
      ( MAKE-1CRATE ?auto_8421 ?auto_8422 )
      ( MAKE-7CRATE-VERIFY ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ?auto_8419 ?auto_8420 ?auto_8421 ?auto_8422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8443 - SURFACE
      ?auto_8444 - SURFACE
    )
    :vars
    (
      ?auto_8445 - HOIST
      ?auto_8446 - PLACE
      ?auto_8448 - PLACE
      ?auto_8449 - HOIST
      ?auto_8450 - SURFACE
      ?auto_8447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8445 ?auto_8446 ) ( SURFACE-AT ?auto_8443 ?auto_8446 ) ( CLEAR ?auto_8443 ) ( IS-CRATE ?auto_8444 ) ( AVAILABLE ?auto_8445 ) ( not ( = ?auto_8448 ?auto_8446 ) ) ( HOIST-AT ?auto_8449 ?auto_8448 ) ( AVAILABLE ?auto_8449 ) ( SURFACE-AT ?auto_8444 ?auto_8448 ) ( ON ?auto_8444 ?auto_8450 ) ( CLEAR ?auto_8444 ) ( TRUCK-AT ?auto_8447 ?auto_8446 ) ( not ( = ?auto_8443 ?auto_8444 ) ) ( not ( = ?auto_8443 ?auto_8450 ) ) ( not ( = ?auto_8444 ?auto_8450 ) ) ( not ( = ?auto_8445 ?auto_8449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8447 ?auto_8446 ?auto_8448 )
      ( !LIFT ?auto_8449 ?auto_8444 ?auto_8450 ?auto_8448 )
      ( !LOAD ?auto_8449 ?auto_8444 ?auto_8447 ?auto_8448 )
      ( !DRIVE ?auto_8447 ?auto_8448 ?auto_8446 )
      ( !UNLOAD ?auto_8445 ?auto_8444 ?auto_8447 ?auto_8446 )
      ( !DROP ?auto_8445 ?auto_8444 ?auto_8443 ?auto_8446 )
      ( MAKE-1CRATE-VERIFY ?auto_8443 ?auto_8444 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
      ?auto_8462 - SURFACE
      ?auto_8463 - SURFACE
      ?auto_8464 - SURFACE
      ?auto_8465 - SURFACE
      ?auto_8466 - SURFACE
      ?auto_8468 - SURFACE
      ?auto_8467 - SURFACE
    )
    :vars
    (
      ?auto_8470 - HOIST
      ?auto_8471 - PLACE
      ?auto_8469 - PLACE
      ?auto_8472 - HOIST
      ?auto_8473 - SURFACE
      ?auto_8488 - PLACE
      ?auto_8478 - HOIST
      ?auto_8487 - SURFACE
      ?auto_8480 - PLACE
      ?auto_8486 - HOIST
      ?auto_8484 - SURFACE
      ?auto_8476 - PLACE
      ?auto_8485 - HOIST
      ?auto_8481 - SURFACE
      ?auto_8489 - PLACE
      ?auto_8479 - HOIST
      ?auto_8475 - SURFACE
      ?auto_8483 - SURFACE
      ?auto_8482 - SURFACE
      ?auto_8477 - SURFACE
      ?auto_8474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8470 ?auto_8471 ) ( IS-CRATE ?auto_8467 ) ( not ( = ?auto_8469 ?auto_8471 ) ) ( HOIST-AT ?auto_8472 ?auto_8469 ) ( AVAILABLE ?auto_8472 ) ( SURFACE-AT ?auto_8467 ?auto_8469 ) ( ON ?auto_8467 ?auto_8473 ) ( CLEAR ?auto_8467 ) ( not ( = ?auto_8468 ?auto_8467 ) ) ( not ( = ?auto_8468 ?auto_8473 ) ) ( not ( = ?auto_8467 ?auto_8473 ) ) ( not ( = ?auto_8470 ?auto_8472 ) ) ( IS-CRATE ?auto_8468 ) ( not ( = ?auto_8488 ?auto_8471 ) ) ( HOIST-AT ?auto_8478 ?auto_8488 ) ( AVAILABLE ?auto_8478 ) ( SURFACE-AT ?auto_8468 ?auto_8488 ) ( ON ?auto_8468 ?auto_8487 ) ( CLEAR ?auto_8468 ) ( not ( = ?auto_8466 ?auto_8468 ) ) ( not ( = ?auto_8466 ?auto_8487 ) ) ( not ( = ?auto_8468 ?auto_8487 ) ) ( not ( = ?auto_8470 ?auto_8478 ) ) ( IS-CRATE ?auto_8466 ) ( not ( = ?auto_8480 ?auto_8471 ) ) ( HOIST-AT ?auto_8486 ?auto_8480 ) ( SURFACE-AT ?auto_8466 ?auto_8480 ) ( ON ?auto_8466 ?auto_8484 ) ( CLEAR ?auto_8466 ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8484 ) ) ( not ( = ?auto_8466 ?auto_8484 ) ) ( not ( = ?auto_8470 ?auto_8486 ) ) ( IS-CRATE ?auto_8465 ) ( not ( = ?auto_8476 ?auto_8471 ) ) ( HOIST-AT ?auto_8485 ?auto_8476 ) ( SURFACE-AT ?auto_8465 ?auto_8476 ) ( ON ?auto_8465 ?auto_8481 ) ( CLEAR ?auto_8465 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8481 ) ) ( not ( = ?auto_8465 ?auto_8481 ) ) ( not ( = ?auto_8470 ?auto_8485 ) ) ( IS-CRATE ?auto_8464 ) ( not ( = ?auto_8489 ?auto_8471 ) ) ( HOIST-AT ?auto_8479 ?auto_8489 ) ( AVAILABLE ?auto_8479 ) ( SURFACE-AT ?auto_8464 ?auto_8489 ) ( ON ?auto_8464 ?auto_8475 ) ( CLEAR ?auto_8464 ) ( not ( = ?auto_8463 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8475 ) ) ( not ( = ?auto_8464 ?auto_8475 ) ) ( not ( = ?auto_8470 ?auto_8479 ) ) ( IS-CRATE ?auto_8463 ) ( AVAILABLE ?auto_8485 ) ( SURFACE-AT ?auto_8463 ?auto_8476 ) ( ON ?auto_8463 ?auto_8483 ) ( CLEAR ?auto_8463 ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8483 ) ) ( not ( = ?auto_8463 ?auto_8483 ) ) ( IS-CRATE ?auto_8462 ) ( SURFACE-AT ?auto_8462 ?auto_8480 ) ( ON ?auto_8462 ?auto_8482 ) ( CLEAR ?auto_8462 ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8482 ) ) ( SURFACE-AT ?auto_8460 ?auto_8471 ) ( CLEAR ?auto_8460 ) ( IS-CRATE ?auto_8461 ) ( AVAILABLE ?auto_8470 ) ( AVAILABLE ?auto_8486 ) ( SURFACE-AT ?auto_8461 ?auto_8480 ) ( ON ?auto_8461 ?auto_8477 ) ( CLEAR ?auto_8461 ) ( TRUCK-AT ?auto_8474 ?auto_8471 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8477 ) ) ( not ( = ?auto_8461 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8477 ) ) ( not ( = ?auto_8482 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8460 ?auto_8483 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8483 ) ) ( not ( = ?auto_8463 ?auto_8482 ) ) ( not ( = ?auto_8463 ?auto_8477 ) ) ( not ( = ?auto_8476 ?auto_8480 ) ) ( not ( = ?auto_8485 ?auto_8486 ) ) ( not ( = ?auto_8483 ?auto_8482 ) ) ( not ( = ?auto_8483 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8464 ) ) ( not ( = ?auto_8460 ?auto_8475 ) ) ( not ( = ?auto_8461 ?auto_8464 ) ) ( not ( = ?auto_8461 ?auto_8475 ) ) ( not ( = ?auto_8462 ?auto_8464 ) ) ( not ( = ?auto_8462 ?auto_8475 ) ) ( not ( = ?auto_8464 ?auto_8483 ) ) ( not ( = ?auto_8464 ?auto_8482 ) ) ( not ( = ?auto_8464 ?auto_8477 ) ) ( not ( = ?auto_8489 ?auto_8476 ) ) ( not ( = ?auto_8489 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8485 ) ) ( not ( = ?auto_8479 ?auto_8486 ) ) ( not ( = ?auto_8475 ?auto_8483 ) ) ( not ( = ?auto_8475 ?auto_8482 ) ) ( not ( = ?auto_8475 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8481 ) ) ( not ( = ?auto_8461 ?auto_8465 ) ) ( not ( = ?auto_8461 ?auto_8481 ) ) ( not ( = ?auto_8462 ?auto_8465 ) ) ( not ( = ?auto_8462 ?auto_8481 ) ) ( not ( = ?auto_8463 ?auto_8465 ) ) ( not ( = ?auto_8463 ?auto_8481 ) ) ( not ( = ?auto_8465 ?auto_8475 ) ) ( not ( = ?auto_8465 ?auto_8483 ) ) ( not ( = ?auto_8465 ?auto_8482 ) ) ( not ( = ?auto_8465 ?auto_8477 ) ) ( not ( = ?auto_8481 ?auto_8475 ) ) ( not ( = ?auto_8481 ?auto_8483 ) ) ( not ( = ?auto_8481 ?auto_8482 ) ) ( not ( = ?auto_8481 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8460 ?auto_8484 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8484 ) ) ( not ( = ?auto_8462 ?auto_8466 ) ) ( not ( = ?auto_8462 ?auto_8484 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8484 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8484 ) ) ( not ( = ?auto_8466 ?auto_8481 ) ) ( not ( = ?auto_8466 ?auto_8475 ) ) ( not ( = ?auto_8466 ?auto_8483 ) ) ( not ( = ?auto_8466 ?auto_8482 ) ) ( not ( = ?auto_8466 ?auto_8477 ) ) ( not ( = ?auto_8484 ?auto_8481 ) ) ( not ( = ?auto_8484 ?auto_8475 ) ) ( not ( = ?auto_8484 ?auto_8483 ) ) ( not ( = ?auto_8484 ?auto_8482 ) ) ( not ( = ?auto_8484 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8468 ) ) ( not ( = ?auto_8460 ?auto_8487 ) ) ( not ( = ?auto_8461 ?auto_8468 ) ) ( not ( = ?auto_8461 ?auto_8487 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( not ( = ?auto_8462 ?auto_8487 ) ) ( not ( = ?auto_8463 ?auto_8468 ) ) ( not ( = ?auto_8463 ?auto_8487 ) ) ( not ( = ?auto_8464 ?auto_8468 ) ) ( not ( = ?auto_8464 ?auto_8487 ) ) ( not ( = ?auto_8465 ?auto_8468 ) ) ( not ( = ?auto_8465 ?auto_8487 ) ) ( not ( = ?auto_8468 ?auto_8484 ) ) ( not ( = ?auto_8468 ?auto_8481 ) ) ( not ( = ?auto_8468 ?auto_8475 ) ) ( not ( = ?auto_8468 ?auto_8483 ) ) ( not ( = ?auto_8468 ?auto_8482 ) ) ( not ( = ?auto_8468 ?auto_8477 ) ) ( not ( = ?auto_8488 ?auto_8480 ) ) ( not ( = ?auto_8488 ?auto_8476 ) ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( not ( = ?auto_8478 ?auto_8486 ) ) ( not ( = ?auto_8478 ?auto_8485 ) ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8487 ?auto_8484 ) ) ( not ( = ?auto_8487 ?auto_8481 ) ) ( not ( = ?auto_8487 ?auto_8475 ) ) ( not ( = ?auto_8487 ?auto_8483 ) ) ( not ( = ?auto_8487 ?auto_8482 ) ) ( not ( = ?auto_8487 ?auto_8477 ) ) ( not ( = ?auto_8460 ?auto_8467 ) ) ( not ( = ?auto_8460 ?auto_8473 ) ) ( not ( = ?auto_8461 ?auto_8467 ) ) ( not ( = ?auto_8461 ?auto_8473 ) ) ( not ( = ?auto_8462 ?auto_8467 ) ) ( not ( = ?auto_8462 ?auto_8473 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8473 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8473 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8473 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8473 ) ) ( not ( = ?auto_8467 ?auto_8487 ) ) ( not ( = ?auto_8467 ?auto_8484 ) ) ( not ( = ?auto_8467 ?auto_8481 ) ) ( not ( = ?auto_8467 ?auto_8475 ) ) ( not ( = ?auto_8467 ?auto_8483 ) ) ( not ( = ?auto_8467 ?auto_8482 ) ) ( not ( = ?auto_8467 ?auto_8477 ) ) ( not ( = ?auto_8469 ?auto_8488 ) ) ( not ( = ?auto_8469 ?auto_8480 ) ) ( not ( = ?auto_8469 ?auto_8476 ) ) ( not ( = ?auto_8469 ?auto_8489 ) ) ( not ( = ?auto_8472 ?auto_8478 ) ) ( not ( = ?auto_8472 ?auto_8486 ) ) ( not ( = ?auto_8472 ?auto_8485 ) ) ( not ( = ?auto_8472 ?auto_8479 ) ) ( not ( = ?auto_8473 ?auto_8487 ) ) ( not ( = ?auto_8473 ?auto_8484 ) ) ( not ( = ?auto_8473 ?auto_8481 ) ) ( not ( = ?auto_8473 ?auto_8475 ) ) ( not ( = ?auto_8473 ?auto_8483 ) ) ( not ( = ?auto_8473 ?auto_8482 ) ) ( not ( = ?auto_8473 ?auto_8477 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8468 )
      ( MAKE-1CRATE ?auto_8468 ?auto_8467 )
      ( MAKE-8CRATE-VERIFY ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8468 ?auto_8467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8492 - SURFACE
      ?auto_8493 - SURFACE
    )
    :vars
    (
      ?auto_8494 - HOIST
      ?auto_8495 - PLACE
      ?auto_8497 - PLACE
      ?auto_8498 - HOIST
      ?auto_8499 - SURFACE
      ?auto_8496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8494 ?auto_8495 ) ( SURFACE-AT ?auto_8492 ?auto_8495 ) ( CLEAR ?auto_8492 ) ( IS-CRATE ?auto_8493 ) ( AVAILABLE ?auto_8494 ) ( not ( = ?auto_8497 ?auto_8495 ) ) ( HOIST-AT ?auto_8498 ?auto_8497 ) ( AVAILABLE ?auto_8498 ) ( SURFACE-AT ?auto_8493 ?auto_8497 ) ( ON ?auto_8493 ?auto_8499 ) ( CLEAR ?auto_8493 ) ( TRUCK-AT ?auto_8496 ?auto_8495 ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8499 ) ) ( not ( = ?auto_8493 ?auto_8499 ) ) ( not ( = ?auto_8494 ?auto_8498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8496 ?auto_8495 ?auto_8497 )
      ( !LIFT ?auto_8498 ?auto_8493 ?auto_8499 ?auto_8497 )
      ( !LOAD ?auto_8498 ?auto_8493 ?auto_8496 ?auto_8497 )
      ( !DRIVE ?auto_8496 ?auto_8497 ?auto_8495 )
      ( !UNLOAD ?auto_8494 ?auto_8493 ?auto_8496 ?auto_8495 )
      ( !DROP ?auto_8494 ?auto_8493 ?auto_8492 ?auto_8495 )
      ( MAKE-1CRATE-VERIFY ?auto_8492 ?auto_8493 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8510 - SURFACE
      ?auto_8511 - SURFACE
      ?auto_8512 - SURFACE
      ?auto_8513 - SURFACE
      ?auto_8514 - SURFACE
      ?auto_8515 - SURFACE
      ?auto_8516 - SURFACE
      ?auto_8519 - SURFACE
      ?auto_8518 - SURFACE
      ?auto_8517 - SURFACE
    )
    :vars
    (
      ?auto_8521 - HOIST
      ?auto_8520 - PLACE
      ?auto_8525 - PLACE
      ?auto_8523 - HOIST
      ?auto_8524 - SURFACE
      ?auto_8528 - PLACE
      ?auto_8529 - HOIST
      ?auto_8527 - SURFACE
      ?auto_8537 - PLACE
      ?auto_8530 - HOIST
      ?auto_8536 - SURFACE
      ?auto_8540 - PLACE
      ?auto_8535 - HOIST
      ?auto_8534 - SURFACE
      ?auto_8542 - PLACE
      ?auto_8533 - HOIST
      ?auto_8539 - SURFACE
      ?auto_8543 - PLACE
      ?auto_8541 - HOIST
      ?auto_8531 - SURFACE
      ?auto_8532 - SURFACE
      ?auto_8538 - SURFACE
      ?auto_8526 - SURFACE
      ?auto_8522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8521 ?auto_8520 ) ( IS-CRATE ?auto_8517 ) ( not ( = ?auto_8525 ?auto_8520 ) ) ( HOIST-AT ?auto_8523 ?auto_8525 ) ( AVAILABLE ?auto_8523 ) ( SURFACE-AT ?auto_8517 ?auto_8525 ) ( ON ?auto_8517 ?auto_8524 ) ( CLEAR ?auto_8517 ) ( not ( = ?auto_8518 ?auto_8517 ) ) ( not ( = ?auto_8518 ?auto_8524 ) ) ( not ( = ?auto_8517 ?auto_8524 ) ) ( not ( = ?auto_8521 ?auto_8523 ) ) ( IS-CRATE ?auto_8518 ) ( not ( = ?auto_8528 ?auto_8520 ) ) ( HOIST-AT ?auto_8529 ?auto_8528 ) ( AVAILABLE ?auto_8529 ) ( SURFACE-AT ?auto_8518 ?auto_8528 ) ( ON ?auto_8518 ?auto_8527 ) ( CLEAR ?auto_8518 ) ( not ( = ?auto_8519 ?auto_8518 ) ) ( not ( = ?auto_8519 ?auto_8527 ) ) ( not ( = ?auto_8518 ?auto_8527 ) ) ( not ( = ?auto_8521 ?auto_8529 ) ) ( IS-CRATE ?auto_8519 ) ( not ( = ?auto_8537 ?auto_8520 ) ) ( HOIST-AT ?auto_8530 ?auto_8537 ) ( AVAILABLE ?auto_8530 ) ( SURFACE-AT ?auto_8519 ?auto_8537 ) ( ON ?auto_8519 ?auto_8536 ) ( CLEAR ?auto_8519 ) ( not ( = ?auto_8516 ?auto_8519 ) ) ( not ( = ?auto_8516 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8536 ) ) ( not ( = ?auto_8521 ?auto_8530 ) ) ( IS-CRATE ?auto_8516 ) ( not ( = ?auto_8540 ?auto_8520 ) ) ( HOIST-AT ?auto_8535 ?auto_8540 ) ( SURFACE-AT ?auto_8516 ?auto_8540 ) ( ON ?auto_8516 ?auto_8534 ) ( CLEAR ?auto_8516 ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8534 ) ) ( not ( = ?auto_8516 ?auto_8534 ) ) ( not ( = ?auto_8521 ?auto_8535 ) ) ( IS-CRATE ?auto_8515 ) ( not ( = ?auto_8542 ?auto_8520 ) ) ( HOIST-AT ?auto_8533 ?auto_8542 ) ( SURFACE-AT ?auto_8515 ?auto_8542 ) ( ON ?auto_8515 ?auto_8539 ) ( CLEAR ?auto_8515 ) ( not ( = ?auto_8514 ?auto_8515 ) ) ( not ( = ?auto_8514 ?auto_8539 ) ) ( not ( = ?auto_8515 ?auto_8539 ) ) ( not ( = ?auto_8521 ?auto_8533 ) ) ( IS-CRATE ?auto_8514 ) ( not ( = ?auto_8543 ?auto_8520 ) ) ( HOIST-AT ?auto_8541 ?auto_8543 ) ( AVAILABLE ?auto_8541 ) ( SURFACE-AT ?auto_8514 ?auto_8543 ) ( ON ?auto_8514 ?auto_8531 ) ( CLEAR ?auto_8514 ) ( not ( = ?auto_8513 ?auto_8514 ) ) ( not ( = ?auto_8513 ?auto_8531 ) ) ( not ( = ?auto_8514 ?auto_8531 ) ) ( not ( = ?auto_8521 ?auto_8541 ) ) ( IS-CRATE ?auto_8513 ) ( AVAILABLE ?auto_8533 ) ( SURFACE-AT ?auto_8513 ?auto_8542 ) ( ON ?auto_8513 ?auto_8532 ) ( CLEAR ?auto_8513 ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( not ( = ?auto_8512 ?auto_8532 ) ) ( not ( = ?auto_8513 ?auto_8532 ) ) ( IS-CRATE ?auto_8512 ) ( SURFACE-AT ?auto_8512 ?auto_8540 ) ( ON ?auto_8512 ?auto_8538 ) ( CLEAR ?auto_8512 ) ( not ( = ?auto_8511 ?auto_8512 ) ) ( not ( = ?auto_8511 ?auto_8538 ) ) ( not ( = ?auto_8512 ?auto_8538 ) ) ( SURFACE-AT ?auto_8510 ?auto_8520 ) ( CLEAR ?auto_8510 ) ( IS-CRATE ?auto_8511 ) ( AVAILABLE ?auto_8521 ) ( AVAILABLE ?auto_8535 ) ( SURFACE-AT ?auto_8511 ?auto_8540 ) ( ON ?auto_8511 ?auto_8526 ) ( CLEAR ?auto_8511 ) ( TRUCK-AT ?auto_8522 ?auto_8520 ) ( not ( = ?auto_8510 ?auto_8511 ) ) ( not ( = ?auto_8510 ?auto_8526 ) ) ( not ( = ?auto_8511 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8512 ) ) ( not ( = ?auto_8510 ?auto_8538 ) ) ( not ( = ?auto_8512 ?auto_8526 ) ) ( not ( = ?auto_8538 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8513 ) ) ( not ( = ?auto_8510 ?auto_8532 ) ) ( not ( = ?auto_8511 ?auto_8513 ) ) ( not ( = ?auto_8511 ?auto_8532 ) ) ( not ( = ?auto_8513 ?auto_8538 ) ) ( not ( = ?auto_8513 ?auto_8526 ) ) ( not ( = ?auto_8542 ?auto_8540 ) ) ( not ( = ?auto_8533 ?auto_8535 ) ) ( not ( = ?auto_8532 ?auto_8538 ) ) ( not ( = ?auto_8532 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8514 ) ) ( not ( = ?auto_8510 ?auto_8531 ) ) ( not ( = ?auto_8511 ?auto_8514 ) ) ( not ( = ?auto_8511 ?auto_8531 ) ) ( not ( = ?auto_8512 ?auto_8514 ) ) ( not ( = ?auto_8512 ?auto_8531 ) ) ( not ( = ?auto_8514 ?auto_8532 ) ) ( not ( = ?auto_8514 ?auto_8538 ) ) ( not ( = ?auto_8514 ?auto_8526 ) ) ( not ( = ?auto_8543 ?auto_8542 ) ) ( not ( = ?auto_8543 ?auto_8540 ) ) ( not ( = ?auto_8541 ?auto_8533 ) ) ( not ( = ?auto_8541 ?auto_8535 ) ) ( not ( = ?auto_8531 ?auto_8532 ) ) ( not ( = ?auto_8531 ?auto_8538 ) ) ( not ( = ?auto_8531 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8515 ) ) ( not ( = ?auto_8510 ?auto_8539 ) ) ( not ( = ?auto_8511 ?auto_8515 ) ) ( not ( = ?auto_8511 ?auto_8539 ) ) ( not ( = ?auto_8512 ?auto_8515 ) ) ( not ( = ?auto_8512 ?auto_8539 ) ) ( not ( = ?auto_8513 ?auto_8515 ) ) ( not ( = ?auto_8513 ?auto_8539 ) ) ( not ( = ?auto_8515 ?auto_8531 ) ) ( not ( = ?auto_8515 ?auto_8532 ) ) ( not ( = ?auto_8515 ?auto_8538 ) ) ( not ( = ?auto_8515 ?auto_8526 ) ) ( not ( = ?auto_8539 ?auto_8531 ) ) ( not ( = ?auto_8539 ?auto_8532 ) ) ( not ( = ?auto_8539 ?auto_8538 ) ) ( not ( = ?auto_8539 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8516 ) ) ( not ( = ?auto_8510 ?auto_8534 ) ) ( not ( = ?auto_8511 ?auto_8516 ) ) ( not ( = ?auto_8511 ?auto_8534 ) ) ( not ( = ?auto_8512 ?auto_8516 ) ) ( not ( = ?auto_8512 ?auto_8534 ) ) ( not ( = ?auto_8513 ?auto_8516 ) ) ( not ( = ?auto_8513 ?auto_8534 ) ) ( not ( = ?auto_8514 ?auto_8516 ) ) ( not ( = ?auto_8514 ?auto_8534 ) ) ( not ( = ?auto_8516 ?auto_8539 ) ) ( not ( = ?auto_8516 ?auto_8531 ) ) ( not ( = ?auto_8516 ?auto_8532 ) ) ( not ( = ?auto_8516 ?auto_8538 ) ) ( not ( = ?auto_8516 ?auto_8526 ) ) ( not ( = ?auto_8534 ?auto_8539 ) ) ( not ( = ?auto_8534 ?auto_8531 ) ) ( not ( = ?auto_8534 ?auto_8532 ) ) ( not ( = ?auto_8534 ?auto_8538 ) ) ( not ( = ?auto_8534 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8519 ) ) ( not ( = ?auto_8510 ?auto_8536 ) ) ( not ( = ?auto_8511 ?auto_8519 ) ) ( not ( = ?auto_8511 ?auto_8536 ) ) ( not ( = ?auto_8512 ?auto_8519 ) ) ( not ( = ?auto_8512 ?auto_8536 ) ) ( not ( = ?auto_8513 ?auto_8519 ) ) ( not ( = ?auto_8513 ?auto_8536 ) ) ( not ( = ?auto_8514 ?auto_8519 ) ) ( not ( = ?auto_8514 ?auto_8536 ) ) ( not ( = ?auto_8515 ?auto_8519 ) ) ( not ( = ?auto_8515 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8534 ) ) ( not ( = ?auto_8519 ?auto_8539 ) ) ( not ( = ?auto_8519 ?auto_8531 ) ) ( not ( = ?auto_8519 ?auto_8532 ) ) ( not ( = ?auto_8519 ?auto_8538 ) ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8537 ?auto_8540 ) ) ( not ( = ?auto_8537 ?auto_8542 ) ) ( not ( = ?auto_8537 ?auto_8543 ) ) ( not ( = ?auto_8530 ?auto_8535 ) ) ( not ( = ?auto_8530 ?auto_8533 ) ) ( not ( = ?auto_8530 ?auto_8541 ) ) ( not ( = ?auto_8536 ?auto_8534 ) ) ( not ( = ?auto_8536 ?auto_8539 ) ) ( not ( = ?auto_8536 ?auto_8531 ) ) ( not ( = ?auto_8536 ?auto_8532 ) ) ( not ( = ?auto_8536 ?auto_8538 ) ) ( not ( = ?auto_8536 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8518 ) ) ( not ( = ?auto_8510 ?auto_8527 ) ) ( not ( = ?auto_8511 ?auto_8518 ) ) ( not ( = ?auto_8511 ?auto_8527 ) ) ( not ( = ?auto_8512 ?auto_8518 ) ) ( not ( = ?auto_8512 ?auto_8527 ) ) ( not ( = ?auto_8513 ?auto_8518 ) ) ( not ( = ?auto_8513 ?auto_8527 ) ) ( not ( = ?auto_8514 ?auto_8518 ) ) ( not ( = ?auto_8514 ?auto_8527 ) ) ( not ( = ?auto_8515 ?auto_8518 ) ) ( not ( = ?auto_8515 ?auto_8527 ) ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8527 ) ) ( not ( = ?auto_8518 ?auto_8536 ) ) ( not ( = ?auto_8518 ?auto_8534 ) ) ( not ( = ?auto_8518 ?auto_8539 ) ) ( not ( = ?auto_8518 ?auto_8531 ) ) ( not ( = ?auto_8518 ?auto_8532 ) ) ( not ( = ?auto_8518 ?auto_8538 ) ) ( not ( = ?auto_8518 ?auto_8526 ) ) ( not ( = ?auto_8528 ?auto_8537 ) ) ( not ( = ?auto_8528 ?auto_8540 ) ) ( not ( = ?auto_8528 ?auto_8542 ) ) ( not ( = ?auto_8528 ?auto_8543 ) ) ( not ( = ?auto_8529 ?auto_8530 ) ) ( not ( = ?auto_8529 ?auto_8535 ) ) ( not ( = ?auto_8529 ?auto_8533 ) ) ( not ( = ?auto_8529 ?auto_8541 ) ) ( not ( = ?auto_8527 ?auto_8536 ) ) ( not ( = ?auto_8527 ?auto_8534 ) ) ( not ( = ?auto_8527 ?auto_8539 ) ) ( not ( = ?auto_8527 ?auto_8531 ) ) ( not ( = ?auto_8527 ?auto_8532 ) ) ( not ( = ?auto_8527 ?auto_8538 ) ) ( not ( = ?auto_8527 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8517 ) ) ( not ( = ?auto_8510 ?auto_8524 ) ) ( not ( = ?auto_8511 ?auto_8517 ) ) ( not ( = ?auto_8511 ?auto_8524 ) ) ( not ( = ?auto_8512 ?auto_8517 ) ) ( not ( = ?auto_8512 ?auto_8524 ) ) ( not ( = ?auto_8513 ?auto_8517 ) ) ( not ( = ?auto_8513 ?auto_8524 ) ) ( not ( = ?auto_8514 ?auto_8517 ) ) ( not ( = ?auto_8514 ?auto_8524 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) ( not ( = ?auto_8515 ?auto_8524 ) ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8524 ) ) ( not ( = ?auto_8519 ?auto_8517 ) ) ( not ( = ?auto_8519 ?auto_8524 ) ) ( not ( = ?auto_8517 ?auto_8527 ) ) ( not ( = ?auto_8517 ?auto_8536 ) ) ( not ( = ?auto_8517 ?auto_8534 ) ) ( not ( = ?auto_8517 ?auto_8539 ) ) ( not ( = ?auto_8517 ?auto_8531 ) ) ( not ( = ?auto_8517 ?auto_8532 ) ) ( not ( = ?auto_8517 ?auto_8538 ) ) ( not ( = ?auto_8517 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8528 ) ) ( not ( = ?auto_8525 ?auto_8537 ) ) ( not ( = ?auto_8525 ?auto_8540 ) ) ( not ( = ?auto_8525 ?auto_8542 ) ) ( not ( = ?auto_8525 ?auto_8543 ) ) ( not ( = ?auto_8523 ?auto_8529 ) ) ( not ( = ?auto_8523 ?auto_8530 ) ) ( not ( = ?auto_8523 ?auto_8535 ) ) ( not ( = ?auto_8523 ?auto_8533 ) ) ( not ( = ?auto_8523 ?auto_8541 ) ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8524 ?auto_8536 ) ) ( not ( = ?auto_8524 ?auto_8534 ) ) ( not ( = ?auto_8524 ?auto_8539 ) ) ( not ( = ?auto_8524 ?auto_8531 ) ) ( not ( = ?auto_8524 ?auto_8532 ) ) ( not ( = ?auto_8524 ?auto_8538 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8510 ?auto_8511 ?auto_8512 ?auto_8513 ?auto_8514 ?auto_8515 ?auto_8516 ?auto_8519 ?auto_8518 )
      ( MAKE-1CRATE ?auto_8518 ?auto_8517 )
      ( MAKE-9CRATE-VERIFY ?auto_8510 ?auto_8511 ?auto_8512 ?auto_8513 ?auto_8514 ?auto_8515 ?auto_8516 ?auto_8519 ?auto_8518 ?auto_8517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8546 - SURFACE
      ?auto_8547 - SURFACE
    )
    :vars
    (
      ?auto_8548 - HOIST
      ?auto_8549 - PLACE
      ?auto_8551 - PLACE
      ?auto_8552 - HOIST
      ?auto_8553 - SURFACE
      ?auto_8550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8548 ?auto_8549 ) ( SURFACE-AT ?auto_8546 ?auto_8549 ) ( CLEAR ?auto_8546 ) ( IS-CRATE ?auto_8547 ) ( AVAILABLE ?auto_8548 ) ( not ( = ?auto_8551 ?auto_8549 ) ) ( HOIST-AT ?auto_8552 ?auto_8551 ) ( AVAILABLE ?auto_8552 ) ( SURFACE-AT ?auto_8547 ?auto_8551 ) ( ON ?auto_8547 ?auto_8553 ) ( CLEAR ?auto_8547 ) ( TRUCK-AT ?auto_8550 ?auto_8549 ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( not ( = ?auto_8546 ?auto_8553 ) ) ( not ( = ?auto_8547 ?auto_8553 ) ) ( not ( = ?auto_8548 ?auto_8552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8550 ?auto_8549 ?auto_8551 )
      ( !LIFT ?auto_8552 ?auto_8547 ?auto_8553 ?auto_8551 )
      ( !LOAD ?auto_8552 ?auto_8547 ?auto_8550 ?auto_8551 )
      ( !DRIVE ?auto_8550 ?auto_8551 ?auto_8549 )
      ( !UNLOAD ?auto_8548 ?auto_8547 ?auto_8550 ?auto_8549 )
      ( !DROP ?auto_8548 ?auto_8547 ?auto_8546 ?auto_8549 )
      ( MAKE-1CRATE-VERIFY ?auto_8546 ?auto_8547 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8565 - SURFACE
      ?auto_8566 - SURFACE
      ?auto_8567 - SURFACE
      ?auto_8568 - SURFACE
      ?auto_8569 - SURFACE
      ?auto_8570 - SURFACE
      ?auto_8571 - SURFACE
      ?auto_8574 - SURFACE
      ?auto_8573 - SURFACE
      ?auto_8572 - SURFACE
      ?auto_8575 - SURFACE
    )
    :vars
    (
      ?auto_8578 - HOIST
      ?auto_8581 - PLACE
      ?auto_8579 - PLACE
      ?auto_8580 - HOIST
      ?auto_8576 - SURFACE
      ?auto_8582 - PLACE
      ?auto_8588 - HOIST
      ?auto_8589 - SURFACE
      ?auto_8591 - PLACE
      ?auto_8584 - HOIST
      ?auto_8595 - SURFACE
      ?auto_8599 - PLACE
      ?auto_8586 - HOIST
      ?auto_8590 - SURFACE
      ?auto_8583 - PLACE
      ?auto_8593 - HOIST
      ?auto_8594 - SURFACE
      ?auto_8592 - PLACE
      ?auto_8598 - HOIST
      ?auto_8597 - SURFACE
      ?auto_8587 - PLACE
      ?auto_8600 - HOIST
      ?auto_8585 - SURFACE
      ?auto_8602 - SURFACE
      ?auto_8601 - SURFACE
      ?auto_8596 - SURFACE
      ?auto_8577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8578 ?auto_8581 ) ( IS-CRATE ?auto_8575 ) ( not ( = ?auto_8579 ?auto_8581 ) ) ( HOIST-AT ?auto_8580 ?auto_8579 ) ( AVAILABLE ?auto_8580 ) ( SURFACE-AT ?auto_8575 ?auto_8579 ) ( ON ?auto_8575 ?auto_8576 ) ( CLEAR ?auto_8575 ) ( not ( = ?auto_8572 ?auto_8575 ) ) ( not ( = ?auto_8572 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8578 ?auto_8580 ) ) ( IS-CRATE ?auto_8572 ) ( not ( = ?auto_8582 ?auto_8581 ) ) ( HOIST-AT ?auto_8588 ?auto_8582 ) ( AVAILABLE ?auto_8588 ) ( SURFACE-AT ?auto_8572 ?auto_8582 ) ( ON ?auto_8572 ?auto_8589 ) ( CLEAR ?auto_8572 ) ( not ( = ?auto_8573 ?auto_8572 ) ) ( not ( = ?auto_8573 ?auto_8589 ) ) ( not ( = ?auto_8572 ?auto_8589 ) ) ( not ( = ?auto_8578 ?auto_8588 ) ) ( IS-CRATE ?auto_8573 ) ( not ( = ?auto_8591 ?auto_8581 ) ) ( HOIST-AT ?auto_8584 ?auto_8591 ) ( AVAILABLE ?auto_8584 ) ( SURFACE-AT ?auto_8573 ?auto_8591 ) ( ON ?auto_8573 ?auto_8595 ) ( CLEAR ?auto_8573 ) ( not ( = ?auto_8574 ?auto_8573 ) ) ( not ( = ?auto_8574 ?auto_8595 ) ) ( not ( = ?auto_8573 ?auto_8595 ) ) ( not ( = ?auto_8578 ?auto_8584 ) ) ( IS-CRATE ?auto_8574 ) ( not ( = ?auto_8599 ?auto_8581 ) ) ( HOIST-AT ?auto_8586 ?auto_8599 ) ( AVAILABLE ?auto_8586 ) ( SURFACE-AT ?auto_8574 ?auto_8599 ) ( ON ?auto_8574 ?auto_8590 ) ( CLEAR ?auto_8574 ) ( not ( = ?auto_8571 ?auto_8574 ) ) ( not ( = ?auto_8571 ?auto_8590 ) ) ( not ( = ?auto_8574 ?auto_8590 ) ) ( not ( = ?auto_8578 ?auto_8586 ) ) ( IS-CRATE ?auto_8571 ) ( not ( = ?auto_8583 ?auto_8581 ) ) ( HOIST-AT ?auto_8593 ?auto_8583 ) ( SURFACE-AT ?auto_8571 ?auto_8583 ) ( ON ?auto_8571 ?auto_8594 ) ( CLEAR ?auto_8571 ) ( not ( = ?auto_8570 ?auto_8571 ) ) ( not ( = ?auto_8570 ?auto_8594 ) ) ( not ( = ?auto_8571 ?auto_8594 ) ) ( not ( = ?auto_8578 ?auto_8593 ) ) ( IS-CRATE ?auto_8570 ) ( not ( = ?auto_8592 ?auto_8581 ) ) ( HOIST-AT ?auto_8598 ?auto_8592 ) ( SURFACE-AT ?auto_8570 ?auto_8592 ) ( ON ?auto_8570 ?auto_8597 ) ( CLEAR ?auto_8570 ) ( not ( = ?auto_8569 ?auto_8570 ) ) ( not ( = ?auto_8569 ?auto_8597 ) ) ( not ( = ?auto_8570 ?auto_8597 ) ) ( not ( = ?auto_8578 ?auto_8598 ) ) ( IS-CRATE ?auto_8569 ) ( not ( = ?auto_8587 ?auto_8581 ) ) ( HOIST-AT ?auto_8600 ?auto_8587 ) ( AVAILABLE ?auto_8600 ) ( SURFACE-AT ?auto_8569 ?auto_8587 ) ( ON ?auto_8569 ?auto_8585 ) ( CLEAR ?auto_8569 ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( not ( = ?auto_8568 ?auto_8585 ) ) ( not ( = ?auto_8569 ?auto_8585 ) ) ( not ( = ?auto_8578 ?auto_8600 ) ) ( IS-CRATE ?auto_8568 ) ( AVAILABLE ?auto_8598 ) ( SURFACE-AT ?auto_8568 ?auto_8592 ) ( ON ?auto_8568 ?auto_8602 ) ( CLEAR ?auto_8568 ) ( not ( = ?auto_8567 ?auto_8568 ) ) ( not ( = ?auto_8567 ?auto_8602 ) ) ( not ( = ?auto_8568 ?auto_8602 ) ) ( IS-CRATE ?auto_8567 ) ( SURFACE-AT ?auto_8567 ?auto_8583 ) ( ON ?auto_8567 ?auto_8601 ) ( CLEAR ?auto_8567 ) ( not ( = ?auto_8566 ?auto_8567 ) ) ( not ( = ?auto_8566 ?auto_8601 ) ) ( not ( = ?auto_8567 ?auto_8601 ) ) ( SURFACE-AT ?auto_8565 ?auto_8581 ) ( CLEAR ?auto_8565 ) ( IS-CRATE ?auto_8566 ) ( AVAILABLE ?auto_8578 ) ( AVAILABLE ?auto_8593 ) ( SURFACE-AT ?auto_8566 ?auto_8583 ) ( ON ?auto_8566 ?auto_8596 ) ( CLEAR ?auto_8566 ) ( TRUCK-AT ?auto_8577 ?auto_8581 ) ( not ( = ?auto_8565 ?auto_8566 ) ) ( not ( = ?auto_8565 ?auto_8596 ) ) ( not ( = ?auto_8566 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8567 ) ) ( not ( = ?auto_8565 ?auto_8601 ) ) ( not ( = ?auto_8567 ?auto_8596 ) ) ( not ( = ?auto_8601 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8568 ) ) ( not ( = ?auto_8565 ?auto_8602 ) ) ( not ( = ?auto_8566 ?auto_8568 ) ) ( not ( = ?auto_8566 ?auto_8602 ) ) ( not ( = ?auto_8568 ?auto_8601 ) ) ( not ( = ?auto_8568 ?auto_8596 ) ) ( not ( = ?auto_8592 ?auto_8583 ) ) ( not ( = ?auto_8598 ?auto_8593 ) ) ( not ( = ?auto_8602 ?auto_8601 ) ) ( not ( = ?auto_8602 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8569 ) ) ( not ( = ?auto_8565 ?auto_8585 ) ) ( not ( = ?auto_8566 ?auto_8569 ) ) ( not ( = ?auto_8566 ?auto_8585 ) ) ( not ( = ?auto_8567 ?auto_8569 ) ) ( not ( = ?auto_8567 ?auto_8585 ) ) ( not ( = ?auto_8569 ?auto_8602 ) ) ( not ( = ?auto_8569 ?auto_8601 ) ) ( not ( = ?auto_8569 ?auto_8596 ) ) ( not ( = ?auto_8587 ?auto_8592 ) ) ( not ( = ?auto_8587 ?auto_8583 ) ) ( not ( = ?auto_8600 ?auto_8598 ) ) ( not ( = ?auto_8600 ?auto_8593 ) ) ( not ( = ?auto_8585 ?auto_8602 ) ) ( not ( = ?auto_8585 ?auto_8601 ) ) ( not ( = ?auto_8585 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8570 ) ) ( not ( = ?auto_8565 ?auto_8597 ) ) ( not ( = ?auto_8566 ?auto_8570 ) ) ( not ( = ?auto_8566 ?auto_8597 ) ) ( not ( = ?auto_8567 ?auto_8570 ) ) ( not ( = ?auto_8567 ?auto_8597 ) ) ( not ( = ?auto_8568 ?auto_8570 ) ) ( not ( = ?auto_8568 ?auto_8597 ) ) ( not ( = ?auto_8570 ?auto_8585 ) ) ( not ( = ?auto_8570 ?auto_8602 ) ) ( not ( = ?auto_8570 ?auto_8601 ) ) ( not ( = ?auto_8570 ?auto_8596 ) ) ( not ( = ?auto_8597 ?auto_8585 ) ) ( not ( = ?auto_8597 ?auto_8602 ) ) ( not ( = ?auto_8597 ?auto_8601 ) ) ( not ( = ?auto_8597 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8571 ) ) ( not ( = ?auto_8565 ?auto_8594 ) ) ( not ( = ?auto_8566 ?auto_8571 ) ) ( not ( = ?auto_8566 ?auto_8594 ) ) ( not ( = ?auto_8567 ?auto_8571 ) ) ( not ( = ?auto_8567 ?auto_8594 ) ) ( not ( = ?auto_8568 ?auto_8571 ) ) ( not ( = ?auto_8568 ?auto_8594 ) ) ( not ( = ?auto_8569 ?auto_8571 ) ) ( not ( = ?auto_8569 ?auto_8594 ) ) ( not ( = ?auto_8571 ?auto_8597 ) ) ( not ( = ?auto_8571 ?auto_8585 ) ) ( not ( = ?auto_8571 ?auto_8602 ) ) ( not ( = ?auto_8571 ?auto_8601 ) ) ( not ( = ?auto_8571 ?auto_8596 ) ) ( not ( = ?auto_8594 ?auto_8597 ) ) ( not ( = ?auto_8594 ?auto_8585 ) ) ( not ( = ?auto_8594 ?auto_8602 ) ) ( not ( = ?auto_8594 ?auto_8601 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8574 ) ) ( not ( = ?auto_8565 ?auto_8590 ) ) ( not ( = ?auto_8566 ?auto_8574 ) ) ( not ( = ?auto_8566 ?auto_8590 ) ) ( not ( = ?auto_8567 ?auto_8574 ) ) ( not ( = ?auto_8567 ?auto_8590 ) ) ( not ( = ?auto_8568 ?auto_8574 ) ) ( not ( = ?auto_8568 ?auto_8590 ) ) ( not ( = ?auto_8569 ?auto_8574 ) ) ( not ( = ?auto_8569 ?auto_8590 ) ) ( not ( = ?auto_8570 ?auto_8574 ) ) ( not ( = ?auto_8570 ?auto_8590 ) ) ( not ( = ?auto_8574 ?auto_8594 ) ) ( not ( = ?auto_8574 ?auto_8597 ) ) ( not ( = ?auto_8574 ?auto_8585 ) ) ( not ( = ?auto_8574 ?auto_8602 ) ) ( not ( = ?auto_8574 ?auto_8601 ) ) ( not ( = ?auto_8574 ?auto_8596 ) ) ( not ( = ?auto_8599 ?auto_8583 ) ) ( not ( = ?auto_8599 ?auto_8592 ) ) ( not ( = ?auto_8599 ?auto_8587 ) ) ( not ( = ?auto_8586 ?auto_8593 ) ) ( not ( = ?auto_8586 ?auto_8598 ) ) ( not ( = ?auto_8586 ?auto_8600 ) ) ( not ( = ?auto_8590 ?auto_8594 ) ) ( not ( = ?auto_8590 ?auto_8597 ) ) ( not ( = ?auto_8590 ?auto_8585 ) ) ( not ( = ?auto_8590 ?auto_8602 ) ) ( not ( = ?auto_8590 ?auto_8601 ) ) ( not ( = ?auto_8590 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8573 ) ) ( not ( = ?auto_8565 ?auto_8595 ) ) ( not ( = ?auto_8566 ?auto_8573 ) ) ( not ( = ?auto_8566 ?auto_8595 ) ) ( not ( = ?auto_8567 ?auto_8573 ) ) ( not ( = ?auto_8567 ?auto_8595 ) ) ( not ( = ?auto_8568 ?auto_8573 ) ) ( not ( = ?auto_8568 ?auto_8595 ) ) ( not ( = ?auto_8569 ?auto_8573 ) ) ( not ( = ?auto_8569 ?auto_8595 ) ) ( not ( = ?auto_8570 ?auto_8573 ) ) ( not ( = ?auto_8570 ?auto_8595 ) ) ( not ( = ?auto_8571 ?auto_8573 ) ) ( not ( = ?auto_8571 ?auto_8595 ) ) ( not ( = ?auto_8573 ?auto_8590 ) ) ( not ( = ?auto_8573 ?auto_8594 ) ) ( not ( = ?auto_8573 ?auto_8597 ) ) ( not ( = ?auto_8573 ?auto_8585 ) ) ( not ( = ?auto_8573 ?auto_8602 ) ) ( not ( = ?auto_8573 ?auto_8601 ) ) ( not ( = ?auto_8573 ?auto_8596 ) ) ( not ( = ?auto_8591 ?auto_8599 ) ) ( not ( = ?auto_8591 ?auto_8583 ) ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( not ( = ?auto_8591 ?auto_8587 ) ) ( not ( = ?auto_8584 ?auto_8586 ) ) ( not ( = ?auto_8584 ?auto_8593 ) ) ( not ( = ?auto_8584 ?auto_8598 ) ) ( not ( = ?auto_8584 ?auto_8600 ) ) ( not ( = ?auto_8595 ?auto_8590 ) ) ( not ( = ?auto_8595 ?auto_8594 ) ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( not ( = ?auto_8595 ?auto_8585 ) ) ( not ( = ?auto_8595 ?auto_8602 ) ) ( not ( = ?auto_8595 ?auto_8601 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8572 ) ) ( not ( = ?auto_8565 ?auto_8589 ) ) ( not ( = ?auto_8566 ?auto_8572 ) ) ( not ( = ?auto_8566 ?auto_8589 ) ) ( not ( = ?auto_8567 ?auto_8572 ) ) ( not ( = ?auto_8567 ?auto_8589 ) ) ( not ( = ?auto_8568 ?auto_8572 ) ) ( not ( = ?auto_8568 ?auto_8589 ) ) ( not ( = ?auto_8569 ?auto_8572 ) ) ( not ( = ?auto_8569 ?auto_8589 ) ) ( not ( = ?auto_8570 ?auto_8572 ) ) ( not ( = ?auto_8570 ?auto_8589 ) ) ( not ( = ?auto_8571 ?auto_8572 ) ) ( not ( = ?auto_8571 ?auto_8589 ) ) ( not ( = ?auto_8574 ?auto_8572 ) ) ( not ( = ?auto_8574 ?auto_8589 ) ) ( not ( = ?auto_8572 ?auto_8595 ) ) ( not ( = ?auto_8572 ?auto_8590 ) ) ( not ( = ?auto_8572 ?auto_8594 ) ) ( not ( = ?auto_8572 ?auto_8597 ) ) ( not ( = ?auto_8572 ?auto_8585 ) ) ( not ( = ?auto_8572 ?auto_8602 ) ) ( not ( = ?auto_8572 ?auto_8601 ) ) ( not ( = ?auto_8572 ?auto_8596 ) ) ( not ( = ?auto_8582 ?auto_8591 ) ) ( not ( = ?auto_8582 ?auto_8599 ) ) ( not ( = ?auto_8582 ?auto_8583 ) ) ( not ( = ?auto_8582 ?auto_8592 ) ) ( not ( = ?auto_8582 ?auto_8587 ) ) ( not ( = ?auto_8588 ?auto_8584 ) ) ( not ( = ?auto_8588 ?auto_8586 ) ) ( not ( = ?auto_8588 ?auto_8593 ) ) ( not ( = ?auto_8588 ?auto_8598 ) ) ( not ( = ?auto_8588 ?auto_8600 ) ) ( not ( = ?auto_8589 ?auto_8595 ) ) ( not ( = ?auto_8589 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8594 ) ) ( not ( = ?auto_8589 ?auto_8597 ) ) ( not ( = ?auto_8589 ?auto_8585 ) ) ( not ( = ?auto_8589 ?auto_8602 ) ) ( not ( = ?auto_8589 ?auto_8601 ) ) ( not ( = ?auto_8589 ?auto_8596 ) ) ( not ( = ?auto_8565 ?auto_8575 ) ) ( not ( = ?auto_8565 ?auto_8576 ) ) ( not ( = ?auto_8566 ?auto_8575 ) ) ( not ( = ?auto_8566 ?auto_8576 ) ) ( not ( = ?auto_8567 ?auto_8575 ) ) ( not ( = ?auto_8567 ?auto_8576 ) ) ( not ( = ?auto_8568 ?auto_8575 ) ) ( not ( = ?auto_8568 ?auto_8576 ) ) ( not ( = ?auto_8569 ?auto_8575 ) ) ( not ( = ?auto_8569 ?auto_8576 ) ) ( not ( = ?auto_8570 ?auto_8575 ) ) ( not ( = ?auto_8570 ?auto_8576 ) ) ( not ( = ?auto_8571 ?auto_8575 ) ) ( not ( = ?auto_8571 ?auto_8576 ) ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8574 ?auto_8576 ) ) ( not ( = ?auto_8573 ?auto_8575 ) ) ( not ( = ?auto_8573 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8589 ) ) ( not ( = ?auto_8575 ?auto_8595 ) ) ( not ( = ?auto_8575 ?auto_8590 ) ) ( not ( = ?auto_8575 ?auto_8594 ) ) ( not ( = ?auto_8575 ?auto_8597 ) ) ( not ( = ?auto_8575 ?auto_8585 ) ) ( not ( = ?auto_8575 ?auto_8602 ) ) ( not ( = ?auto_8575 ?auto_8601 ) ) ( not ( = ?auto_8575 ?auto_8596 ) ) ( not ( = ?auto_8579 ?auto_8582 ) ) ( not ( = ?auto_8579 ?auto_8591 ) ) ( not ( = ?auto_8579 ?auto_8599 ) ) ( not ( = ?auto_8579 ?auto_8583 ) ) ( not ( = ?auto_8579 ?auto_8592 ) ) ( not ( = ?auto_8579 ?auto_8587 ) ) ( not ( = ?auto_8580 ?auto_8588 ) ) ( not ( = ?auto_8580 ?auto_8584 ) ) ( not ( = ?auto_8580 ?auto_8586 ) ) ( not ( = ?auto_8580 ?auto_8593 ) ) ( not ( = ?auto_8580 ?auto_8598 ) ) ( not ( = ?auto_8580 ?auto_8600 ) ) ( not ( = ?auto_8576 ?auto_8589 ) ) ( not ( = ?auto_8576 ?auto_8595 ) ) ( not ( = ?auto_8576 ?auto_8590 ) ) ( not ( = ?auto_8576 ?auto_8594 ) ) ( not ( = ?auto_8576 ?auto_8597 ) ) ( not ( = ?auto_8576 ?auto_8585 ) ) ( not ( = ?auto_8576 ?auto_8602 ) ) ( not ( = ?auto_8576 ?auto_8601 ) ) ( not ( = ?auto_8576 ?auto_8596 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8565 ?auto_8566 ?auto_8567 ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8571 ?auto_8574 ?auto_8573 ?auto_8572 )
      ( MAKE-1CRATE ?auto_8572 ?auto_8575 )
      ( MAKE-10CRATE-VERIFY ?auto_8565 ?auto_8566 ?auto_8567 ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8571 ?auto_8574 ?auto_8573 ?auto_8572 ?auto_8575 ) )
  )

)

