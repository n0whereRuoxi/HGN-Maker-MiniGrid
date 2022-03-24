( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55267 - BLOCK
      ?auto_55268 - BLOCK
      ?auto_55269 - BLOCK
      ?auto_55270 - BLOCK
      ?auto_55271 - BLOCK
      ?auto_55272 - BLOCK
    )
    :vars
    (
      ?auto_55273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55273 ?auto_55272 ) ( CLEAR ?auto_55273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55267 ) ( ON ?auto_55268 ?auto_55267 ) ( ON ?auto_55269 ?auto_55268 ) ( ON ?auto_55270 ?auto_55269 ) ( ON ?auto_55271 ?auto_55270 ) ( ON ?auto_55272 ?auto_55271 ) ( not ( = ?auto_55267 ?auto_55268 ) ) ( not ( = ?auto_55267 ?auto_55269 ) ) ( not ( = ?auto_55267 ?auto_55270 ) ) ( not ( = ?auto_55267 ?auto_55271 ) ) ( not ( = ?auto_55267 ?auto_55272 ) ) ( not ( = ?auto_55267 ?auto_55273 ) ) ( not ( = ?auto_55268 ?auto_55269 ) ) ( not ( = ?auto_55268 ?auto_55270 ) ) ( not ( = ?auto_55268 ?auto_55271 ) ) ( not ( = ?auto_55268 ?auto_55272 ) ) ( not ( = ?auto_55268 ?auto_55273 ) ) ( not ( = ?auto_55269 ?auto_55270 ) ) ( not ( = ?auto_55269 ?auto_55271 ) ) ( not ( = ?auto_55269 ?auto_55272 ) ) ( not ( = ?auto_55269 ?auto_55273 ) ) ( not ( = ?auto_55270 ?auto_55271 ) ) ( not ( = ?auto_55270 ?auto_55272 ) ) ( not ( = ?auto_55270 ?auto_55273 ) ) ( not ( = ?auto_55271 ?auto_55272 ) ) ( not ( = ?auto_55271 ?auto_55273 ) ) ( not ( = ?auto_55272 ?auto_55273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55273 ?auto_55272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55275 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55275 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55276 - BLOCK
    )
    :vars
    (
      ?auto_55277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55276 ?auto_55277 ) ( CLEAR ?auto_55276 ) ( HAND-EMPTY ) ( not ( = ?auto_55276 ?auto_55277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55276 ?auto_55277 )
      ( MAKE-1PILE ?auto_55276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55283 - BLOCK
      ?auto_55284 - BLOCK
      ?auto_55285 - BLOCK
      ?auto_55286 - BLOCK
      ?auto_55287 - BLOCK
    )
    :vars
    (
      ?auto_55288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55288 ?auto_55287 ) ( CLEAR ?auto_55288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55283 ) ( ON ?auto_55284 ?auto_55283 ) ( ON ?auto_55285 ?auto_55284 ) ( ON ?auto_55286 ?auto_55285 ) ( ON ?auto_55287 ?auto_55286 ) ( not ( = ?auto_55283 ?auto_55284 ) ) ( not ( = ?auto_55283 ?auto_55285 ) ) ( not ( = ?auto_55283 ?auto_55286 ) ) ( not ( = ?auto_55283 ?auto_55287 ) ) ( not ( = ?auto_55283 ?auto_55288 ) ) ( not ( = ?auto_55284 ?auto_55285 ) ) ( not ( = ?auto_55284 ?auto_55286 ) ) ( not ( = ?auto_55284 ?auto_55287 ) ) ( not ( = ?auto_55284 ?auto_55288 ) ) ( not ( = ?auto_55285 ?auto_55286 ) ) ( not ( = ?auto_55285 ?auto_55287 ) ) ( not ( = ?auto_55285 ?auto_55288 ) ) ( not ( = ?auto_55286 ?auto_55287 ) ) ( not ( = ?auto_55286 ?auto_55288 ) ) ( not ( = ?auto_55287 ?auto_55288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55288 ?auto_55287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55289 - BLOCK
      ?auto_55290 - BLOCK
      ?auto_55291 - BLOCK
      ?auto_55292 - BLOCK
      ?auto_55293 - BLOCK
    )
    :vars
    (
      ?auto_55294 - BLOCK
      ?auto_55295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55294 ?auto_55293 ) ( CLEAR ?auto_55294 ) ( ON-TABLE ?auto_55289 ) ( ON ?auto_55290 ?auto_55289 ) ( ON ?auto_55291 ?auto_55290 ) ( ON ?auto_55292 ?auto_55291 ) ( ON ?auto_55293 ?auto_55292 ) ( not ( = ?auto_55289 ?auto_55290 ) ) ( not ( = ?auto_55289 ?auto_55291 ) ) ( not ( = ?auto_55289 ?auto_55292 ) ) ( not ( = ?auto_55289 ?auto_55293 ) ) ( not ( = ?auto_55289 ?auto_55294 ) ) ( not ( = ?auto_55290 ?auto_55291 ) ) ( not ( = ?auto_55290 ?auto_55292 ) ) ( not ( = ?auto_55290 ?auto_55293 ) ) ( not ( = ?auto_55290 ?auto_55294 ) ) ( not ( = ?auto_55291 ?auto_55292 ) ) ( not ( = ?auto_55291 ?auto_55293 ) ) ( not ( = ?auto_55291 ?auto_55294 ) ) ( not ( = ?auto_55292 ?auto_55293 ) ) ( not ( = ?auto_55292 ?auto_55294 ) ) ( not ( = ?auto_55293 ?auto_55294 ) ) ( HOLDING ?auto_55295 ) ( not ( = ?auto_55289 ?auto_55295 ) ) ( not ( = ?auto_55290 ?auto_55295 ) ) ( not ( = ?auto_55291 ?auto_55295 ) ) ( not ( = ?auto_55292 ?auto_55295 ) ) ( not ( = ?auto_55293 ?auto_55295 ) ) ( not ( = ?auto_55294 ?auto_55295 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55295 )
      ( MAKE-5PILE ?auto_55289 ?auto_55290 ?auto_55291 ?auto_55292 ?auto_55293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55296 - BLOCK
      ?auto_55297 - BLOCK
      ?auto_55298 - BLOCK
      ?auto_55299 - BLOCK
      ?auto_55300 - BLOCK
    )
    :vars
    (
      ?auto_55301 - BLOCK
      ?auto_55302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55301 ?auto_55300 ) ( ON-TABLE ?auto_55296 ) ( ON ?auto_55297 ?auto_55296 ) ( ON ?auto_55298 ?auto_55297 ) ( ON ?auto_55299 ?auto_55298 ) ( ON ?auto_55300 ?auto_55299 ) ( not ( = ?auto_55296 ?auto_55297 ) ) ( not ( = ?auto_55296 ?auto_55298 ) ) ( not ( = ?auto_55296 ?auto_55299 ) ) ( not ( = ?auto_55296 ?auto_55300 ) ) ( not ( = ?auto_55296 ?auto_55301 ) ) ( not ( = ?auto_55297 ?auto_55298 ) ) ( not ( = ?auto_55297 ?auto_55299 ) ) ( not ( = ?auto_55297 ?auto_55300 ) ) ( not ( = ?auto_55297 ?auto_55301 ) ) ( not ( = ?auto_55298 ?auto_55299 ) ) ( not ( = ?auto_55298 ?auto_55300 ) ) ( not ( = ?auto_55298 ?auto_55301 ) ) ( not ( = ?auto_55299 ?auto_55300 ) ) ( not ( = ?auto_55299 ?auto_55301 ) ) ( not ( = ?auto_55300 ?auto_55301 ) ) ( not ( = ?auto_55296 ?auto_55302 ) ) ( not ( = ?auto_55297 ?auto_55302 ) ) ( not ( = ?auto_55298 ?auto_55302 ) ) ( not ( = ?auto_55299 ?auto_55302 ) ) ( not ( = ?auto_55300 ?auto_55302 ) ) ( not ( = ?auto_55301 ?auto_55302 ) ) ( ON ?auto_55302 ?auto_55301 ) ( CLEAR ?auto_55302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55296 ?auto_55297 ?auto_55298 ?auto_55299 ?auto_55300 ?auto_55301 )
      ( MAKE-5PILE ?auto_55296 ?auto_55297 ?auto_55298 ?auto_55299 ?auto_55300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55305 - BLOCK
      ?auto_55306 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55306 ) ( CLEAR ?auto_55305 ) ( ON-TABLE ?auto_55305 ) ( not ( = ?auto_55305 ?auto_55306 ) ) )
    :subtasks
    ( ( !STACK ?auto_55306 ?auto_55305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55307 - BLOCK
      ?auto_55308 - BLOCK
    )
    :vars
    (
      ?auto_55309 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55307 ) ( ON-TABLE ?auto_55307 ) ( not ( = ?auto_55307 ?auto_55308 ) ) ( ON ?auto_55308 ?auto_55309 ) ( CLEAR ?auto_55308 ) ( HAND-EMPTY ) ( not ( = ?auto_55307 ?auto_55309 ) ) ( not ( = ?auto_55308 ?auto_55309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55308 ?auto_55309 )
      ( MAKE-2PILE ?auto_55307 ?auto_55308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55310 - BLOCK
      ?auto_55311 - BLOCK
    )
    :vars
    (
      ?auto_55312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55310 ?auto_55311 ) ) ( ON ?auto_55311 ?auto_55312 ) ( CLEAR ?auto_55311 ) ( not ( = ?auto_55310 ?auto_55312 ) ) ( not ( = ?auto_55311 ?auto_55312 ) ) ( HOLDING ?auto_55310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55310 )
      ( MAKE-2PILE ?auto_55310 ?auto_55311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55313 - BLOCK
      ?auto_55314 - BLOCK
    )
    :vars
    (
      ?auto_55315 - BLOCK
      ?auto_55319 - BLOCK
      ?auto_55318 - BLOCK
      ?auto_55317 - BLOCK
      ?auto_55316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55313 ?auto_55314 ) ) ( ON ?auto_55314 ?auto_55315 ) ( not ( = ?auto_55313 ?auto_55315 ) ) ( not ( = ?auto_55314 ?auto_55315 ) ) ( ON ?auto_55313 ?auto_55314 ) ( CLEAR ?auto_55313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55319 ) ( ON ?auto_55318 ?auto_55319 ) ( ON ?auto_55317 ?auto_55318 ) ( ON ?auto_55316 ?auto_55317 ) ( ON ?auto_55315 ?auto_55316 ) ( not ( = ?auto_55319 ?auto_55318 ) ) ( not ( = ?auto_55319 ?auto_55317 ) ) ( not ( = ?auto_55319 ?auto_55316 ) ) ( not ( = ?auto_55319 ?auto_55315 ) ) ( not ( = ?auto_55319 ?auto_55314 ) ) ( not ( = ?auto_55319 ?auto_55313 ) ) ( not ( = ?auto_55318 ?auto_55317 ) ) ( not ( = ?auto_55318 ?auto_55316 ) ) ( not ( = ?auto_55318 ?auto_55315 ) ) ( not ( = ?auto_55318 ?auto_55314 ) ) ( not ( = ?auto_55318 ?auto_55313 ) ) ( not ( = ?auto_55317 ?auto_55316 ) ) ( not ( = ?auto_55317 ?auto_55315 ) ) ( not ( = ?auto_55317 ?auto_55314 ) ) ( not ( = ?auto_55317 ?auto_55313 ) ) ( not ( = ?auto_55316 ?auto_55315 ) ) ( not ( = ?auto_55316 ?auto_55314 ) ) ( not ( = ?auto_55316 ?auto_55313 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55319 ?auto_55318 ?auto_55317 ?auto_55316 ?auto_55315 ?auto_55314 )
      ( MAKE-2PILE ?auto_55313 ?auto_55314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55324 - BLOCK
      ?auto_55325 - BLOCK
      ?auto_55326 - BLOCK
      ?auto_55327 - BLOCK
    )
    :vars
    (
      ?auto_55328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55328 ?auto_55327 ) ( CLEAR ?auto_55328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55324 ) ( ON ?auto_55325 ?auto_55324 ) ( ON ?auto_55326 ?auto_55325 ) ( ON ?auto_55327 ?auto_55326 ) ( not ( = ?auto_55324 ?auto_55325 ) ) ( not ( = ?auto_55324 ?auto_55326 ) ) ( not ( = ?auto_55324 ?auto_55327 ) ) ( not ( = ?auto_55324 ?auto_55328 ) ) ( not ( = ?auto_55325 ?auto_55326 ) ) ( not ( = ?auto_55325 ?auto_55327 ) ) ( not ( = ?auto_55325 ?auto_55328 ) ) ( not ( = ?auto_55326 ?auto_55327 ) ) ( not ( = ?auto_55326 ?auto_55328 ) ) ( not ( = ?auto_55327 ?auto_55328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55328 ?auto_55327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55329 - BLOCK
      ?auto_55330 - BLOCK
      ?auto_55331 - BLOCK
      ?auto_55332 - BLOCK
    )
    :vars
    (
      ?auto_55333 - BLOCK
      ?auto_55334 - BLOCK
      ?auto_55335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55333 ?auto_55332 ) ( CLEAR ?auto_55333 ) ( ON-TABLE ?auto_55329 ) ( ON ?auto_55330 ?auto_55329 ) ( ON ?auto_55331 ?auto_55330 ) ( ON ?auto_55332 ?auto_55331 ) ( not ( = ?auto_55329 ?auto_55330 ) ) ( not ( = ?auto_55329 ?auto_55331 ) ) ( not ( = ?auto_55329 ?auto_55332 ) ) ( not ( = ?auto_55329 ?auto_55333 ) ) ( not ( = ?auto_55330 ?auto_55331 ) ) ( not ( = ?auto_55330 ?auto_55332 ) ) ( not ( = ?auto_55330 ?auto_55333 ) ) ( not ( = ?auto_55331 ?auto_55332 ) ) ( not ( = ?auto_55331 ?auto_55333 ) ) ( not ( = ?auto_55332 ?auto_55333 ) ) ( HOLDING ?auto_55334 ) ( CLEAR ?auto_55335 ) ( not ( = ?auto_55329 ?auto_55334 ) ) ( not ( = ?auto_55329 ?auto_55335 ) ) ( not ( = ?auto_55330 ?auto_55334 ) ) ( not ( = ?auto_55330 ?auto_55335 ) ) ( not ( = ?auto_55331 ?auto_55334 ) ) ( not ( = ?auto_55331 ?auto_55335 ) ) ( not ( = ?auto_55332 ?auto_55334 ) ) ( not ( = ?auto_55332 ?auto_55335 ) ) ( not ( = ?auto_55333 ?auto_55334 ) ) ( not ( = ?auto_55333 ?auto_55335 ) ) ( not ( = ?auto_55334 ?auto_55335 ) ) )
    :subtasks
    ( ( !STACK ?auto_55334 ?auto_55335 )
      ( MAKE-4PILE ?auto_55329 ?auto_55330 ?auto_55331 ?auto_55332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55935 - BLOCK
      ?auto_55936 - BLOCK
      ?auto_55937 - BLOCK
      ?auto_55938 - BLOCK
    )
    :vars
    (
      ?auto_55940 - BLOCK
      ?auto_55939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55940 ?auto_55938 ) ( ON-TABLE ?auto_55935 ) ( ON ?auto_55936 ?auto_55935 ) ( ON ?auto_55937 ?auto_55936 ) ( ON ?auto_55938 ?auto_55937 ) ( not ( = ?auto_55935 ?auto_55936 ) ) ( not ( = ?auto_55935 ?auto_55937 ) ) ( not ( = ?auto_55935 ?auto_55938 ) ) ( not ( = ?auto_55935 ?auto_55940 ) ) ( not ( = ?auto_55936 ?auto_55937 ) ) ( not ( = ?auto_55936 ?auto_55938 ) ) ( not ( = ?auto_55936 ?auto_55940 ) ) ( not ( = ?auto_55937 ?auto_55938 ) ) ( not ( = ?auto_55937 ?auto_55940 ) ) ( not ( = ?auto_55938 ?auto_55940 ) ) ( not ( = ?auto_55935 ?auto_55939 ) ) ( not ( = ?auto_55936 ?auto_55939 ) ) ( not ( = ?auto_55937 ?auto_55939 ) ) ( not ( = ?auto_55938 ?auto_55939 ) ) ( not ( = ?auto_55940 ?auto_55939 ) ) ( ON ?auto_55939 ?auto_55940 ) ( CLEAR ?auto_55939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55935 ?auto_55936 ?auto_55937 ?auto_55938 ?auto_55940 )
      ( MAKE-4PILE ?auto_55935 ?auto_55936 ?auto_55937 ?auto_55938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55343 - BLOCK
      ?auto_55344 - BLOCK
      ?auto_55345 - BLOCK
      ?auto_55346 - BLOCK
    )
    :vars
    (
      ?auto_55347 - BLOCK
      ?auto_55348 - BLOCK
      ?auto_55349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55347 ?auto_55346 ) ( ON-TABLE ?auto_55343 ) ( ON ?auto_55344 ?auto_55343 ) ( ON ?auto_55345 ?auto_55344 ) ( ON ?auto_55346 ?auto_55345 ) ( not ( = ?auto_55343 ?auto_55344 ) ) ( not ( = ?auto_55343 ?auto_55345 ) ) ( not ( = ?auto_55343 ?auto_55346 ) ) ( not ( = ?auto_55343 ?auto_55347 ) ) ( not ( = ?auto_55344 ?auto_55345 ) ) ( not ( = ?auto_55344 ?auto_55346 ) ) ( not ( = ?auto_55344 ?auto_55347 ) ) ( not ( = ?auto_55345 ?auto_55346 ) ) ( not ( = ?auto_55345 ?auto_55347 ) ) ( not ( = ?auto_55346 ?auto_55347 ) ) ( not ( = ?auto_55343 ?auto_55348 ) ) ( not ( = ?auto_55343 ?auto_55349 ) ) ( not ( = ?auto_55344 ?auto_55348 ) ) ( not ( = ?auto_55344 ?auto_55349 ) ) ( not ( = ?auto_55345 ?auto_55348 ) ) ( not ( = ?auto_55345 ?auto_55349 ) ) ( not ( = ?auto_55346 ?auto_55348 ) ) ( not ( = ?auto_55346 ?auto_55349 ) ) ( not ( = ?auto_55347 ?auto_55348 ) ) ( not ( = ?auto_55347 ?auto_55349 ) ) ( not ( = ?auto_55348 ?auto_55349 ) ) ( ON ?auto_55348 ?auto_55347 ) ( CLEAR ?auto_55348 ) ( HOLDING ?auto_55349 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55349 )
      ( MAKE-4PILE ?auto_55343 ?auto_55344 ?auto_55345 ?auto_55346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55350 - BLOCK
      ?auto_55351 - BLOCK
      ?auto_55352 - BLOCK
      ?auto_55353 - BLOCK
    )
    :vars
    (
      ?auto_55355 - BLOCK
      ?auto_55354 - BLOCK
      ?auto_55356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55355 ?auto_55353 ) ( ON-TABLE ?auto_55350 ) ( ON ?auto_55351 ?auto_55350 ) ( ON ?auto_55352 ?auto_55351 ) ( ON ?auto_55353 ?auto_55352 ) ( not ( = ?auto_55350 ?auto_55351 ) ) ( not ( = ?auto_55350 ?auto_55352 ) ) ( not ( = ?auto_55350 ?auto_55353 ) ) ( not ( = ?auto_55350 ?auto_55355 ) ) ( not ( = ?auto_55351 ?auto_55352 ) ) ( not ( = ?auto_55351 ?auto_55353 ) ) ( not ( = ?auto_55351 ?auto_55355 ) ) ( not ( = ?auto_55352 ?auto_55353 ) ) ( not ( = ?auto_55352 ?auto_55355 ) ) ( not ( = ?auto_55353 ?auto_55355 ) ) ( not ( = ?auto_55350 ?auto_55354 ) ) ( not ( = ?auto_55350 ?auto_55356 ) ) ( not ( = ?auto_55351 ?auto_55354 ) ) ( not ( = ?auto_55351 ?auto_55356 ) ) ( not ( = ?auto_55352 ?auto_55354 ) ) ( not ( = ?auto_55352 ?auto_55356 ) ) ( not ( = ?auto_55353 ?auto_55354 ) ) ( not ( = ?auto_55353 ?auto_55356 ) ) ( not ( = ?auto_55355 ?auto_55354 ) ) ( not ( = ?auto_55355 ?auto_55356 ) ) ( not ( = ?auto_55354 ?auto_55356 ) ) ( ON ?auto_55354 ?auto_55355 ) ( ON ?auto_55356 ?auto_55354 ) ( CLEAR ?auto_55356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55350 ?auto_55351 ?auto_55352 ?auto_55353 ?auto_55355 ?auto_55354 )
      ( MAKE-4PILE ?auto_55350 ?auto_55351 ?auto_55352 ?auto_55353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55360 - BLOCK
      ?auto_55361 - BLOCK
      ?auto_55362 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55362 ) ( CLEAR ?auto_55361 ) ( ON-TABLE ?auto_55360 ) ( ON ?auto_55361 ?auto_55360 ) ( not ( = ?auto_55360 ?auto_55361 ) ) ( not ( = ?auto_55360 ?auto_55362 ) ) ( not ( = ?auto_55361 ?auto_55362 ) ) )
    :subtasks
    ( ( !STACK ?auto_55362 ?auto_55361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55363 - BLOCK
      ?auto_55364 - BLOCK
      ?auto_55365 - BLOCK
    )
    :vars
    (
      ?auto_55366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55364 ) ( ON-TABLE ?auto_55363 ) ( ON ?auto_55364 ?auto_55363 ) ( not ( = ?auto_55363 ?auto_55364 ) ) ( not ( = ?auto_55363 ?auto_55365 ) ) ( not ( = ?auto_55364 ?auto_55365 ) ) ( ON ?auto_55365 ?auto_55366 ) ( CLEAR ?auto_55365 ) ( HAND-EMPTY ) ( not ( = ?auto_55363 ?auto_55366 ) ) ( not ( = ?auto_55364 ?auto_55366 ) ) ( not ( = ?auto_55365 ?auto_55366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55365 ?auto_55366 )
      ( MAKE-3PILE ?auto_55363 ?auto_55364 ?auto_55365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55367 - BLOCK
      ?auto_55368 - BLOCK
      ?auto_55369 - BLOCK
    )
    :vars
    (
      ?auto_55370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55367 ) ( not ( = ?auto_55367 ?auto_55368 ) ) ( not ( = ?auto_55367 ?auto_55369 ) ) ( not ( = ?auto_55368 ?auto_55369 ) ) ( ON ?auto_55369 ?auto_55370 ) ( CLEAR ?auto_55369 ) ( not ( = ?auto_55367 ?auto_55370 ) ) ( not ( = ?auto_55368 ?auto_55370 ) ) ( not ( = ?auto_55369 ?auto_55370 ) ) ( HOLDING ?auto_55368 ) ( CLEAR ?auto_55367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55367 ?auto_55368 )
      ( MAKE-3PILE ?auto_55367 ?auto_55368 ?auto_55369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55371 - BLOCK
      ?auto_55372 - BLOCK
      ?auto_55373 - BLOCK
    )
    :vars
    (
      ?auto_55374 - BLOCK
      ?auto_55376 - BLOCK
      ?auto_55377 - BLOCK
      ?auto_55375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55371 ) ( not ( = ?auto_55371 ?auto_55372 ) ) ( not ( = ?auto_55371 ?auto_55373 ) ) ( not ( = ?auto_55372 ?auto_55373 ) ) ( ON ?auto_55373 ?auto_55374 ) ( not ( = ?auto_55371 ?auto_55374 ) ) ( not ( = ?auto_55372 ?auto_55374 ) ) ( not ( = ?auto_55373 ?auto_55374 ) ) ( CLEAR ?auto_55371 ) ( ON ?auto_55372 ?auto_55373 ) ( CLEAR ?auto_55372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55376 ) ( ON ?auto_55377 ?auto_55376 ) ( ON ?auto_55375 ?auto_55377 ) ( ON ?auto_55374 ?auto_55375 ) ( not ( = ?auto_55376 ?auto_55377 ) ) ( not ( = ?auto_55376 ?auto_55375 ) ) ( not ( = ?auto_55376 ?auto_55374 ) ) ( not ( = ?auto_55376 ?auto_55373 ) ) ( not ( = ?auto_55376 ?auto_55372 ) ) ( not ( = ?auto_55377 ?auto_55375 ) ) ( not ( = ?auto_55377 ?auto_55374 ) ) ( not ( = ?auto_55377 ?auto_55373 ) ) ( not ( = ?auto_55377 ?auto_55372 ) ) ( not ( = ?auto_55375 ?auto_55374 ) ) ( not ( = ?auto_55375 ?auto_55373 ) ) ( not ( = ?auto_55375 ?auto_55372 ) ) ( not ( = ?auto_55371 ?auto_55376 ) ) ( not ( = ?auto_55371 ?auto_55377 ) ) ( not ( = ?auto_55371 ?auto_55375 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55376 ?auto_55377 ?auto_55375 ?auto_55374 ?auto_55373 )
      ( MAKE-3PILE ?auto_55371 ?auto_55372 ?auto_55373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55378 - BLOCK
      ?auto_55379 - BLOCK
      ?auto_55380 - BLOCK
    )
    :vars
    (
      ?auto_55384 - BLOCK
      ?auto_55383 - BLOCK
      ?auto_55381 - BLOCK
      ?auto_55382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55378 ?auto_55379 ) ) ( not ( = ?auto_55378 ?auto_55380 ) ) ( not ( = ?auto_55379 ?auto_55380 ) ) ( ON ?auto_55380 ?auto_55384 ) ( not ( = ?auto_55378 ?auto_55384 ) ) ( not ( = ?auto_55379 ?auto_55384 ) ) ( not ( = ?auto_55380 ?auto_55384 ) ) ( ON ?auto_55379 ?auto_55380 ) ( CLEAR ?auto_55379 ) ( ON-TABLE ?auto_55383 ) ( ON ?auto_55381 ?auto_55383 ) ( ON ?auto_55382 ?auto_55381 ) ( ON ?auto_55384 ?auto_55382 ) ( not ( = ?auto_55383 ?auto_55381 ) ) ( not ( = ?auto_55383 ?auto_55382 ) ) ( not ( = ?auto_55383 ?auto_55384 ) ) ( not ( = ?auto_55383 ?auto_55380 ) ) ( not ( = ?auto_55383 ?auto_55379 ) ) ( not ( = ?auto_55381 ?auto_55382 ) ) ( not ( = ?auto_55381 ?auto_55384 ) ) ( not ( = ?auto_55381 ?auto_55380 ) ) ( not ( = ?auto_55381 ?auto_55379 ) ) ( not ( = ?auto_55382 ?auto_55384 ) ) ( not ( = ?auto_55382 ?auto_55380 ) ) ( not ( = ?auto_55382 ?auto_55379 ) ) ( not ( = ?auto_55378 ?auto_55383 ) ) ( not ( = ?auto_55378 ?auto_55381 ) ) ( not ( = ?auto_55378 ?auto_55382 ) ) ( HOLDING ?auto_55378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55378 )
      ( MAKE-3PILE ?auto_55378 ?auto_55379 ?auto_55380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55385 - BLOCK
      ?auto_55386 - BLOCK
      ?auto_55387 - BLOCK
    )
    :vars
    (
      ?auto_55389 - BLOCK
      ?auto_55390 - BLOCK
      ?auto_55388 - BLOCK
      ?auto_55391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55385 ?auto_55386 ) ) ( not ( = ?auto_55385 ?auto_55387 ) ) ( not ( = ?auto_55386 ?auto_55387 ) ) ( ON ?auto_55387 ?auto_55389 ) ( not ( = ?auto_55385 ?auto_55389 ) ) ( not ( = ?auto_55386 ?auto_55389 ) ) ( not ( = ?auto_55387 ?auto_55389 ) ) ( ON ?auto_55386 ?auto_55387 ) ( ON-TABLE ?auto_55390 ) ( ON ?auto_55388 ?auto_55390 ) ( ON ?auto_55391 ?auto_55388 ) ( ON ?auto_55389 ?auto_55391 ) ( not ( = ?auto_55390 ?auto_55388 ) ) ( not ( = ?auto_55390 ?auto_55391 ) ) ( not ( = ?auto_55390 ?auto_55389 ) ) ( not ( = ?auto_55390 ?auto_55387 ) ) ( not ( = ?auto_55390 ?auto_55386 ) ) ( not ( = ?auto_55388 ?auto_55391 ) ) ( not ( = ?auto_55388 ?auto_55389 ) ) ( not ( = ?auto_55388 ?auto_55387 ) ) ( not ( = ?auto_55388 ?auto_55386 ) ) ( not ( = ?auto_55391 ?auto_55389 ) ) ( not ( = ?auto_55391 ?auto_55387 ) ) ( not ( = ?auto_55391 ?auto_55386 ) ) ( not ( = ?auto_55385 ?auto_55390 ) ) ( not ( = ?auto_55385 ?auto_55388 ) ) ( not ( = ?auto_55385 ?auto_55391 ) ) ( ON ?auto_55385 ?auto_55386 ) ( CLEAR ?auto_55385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55390 ?auto_55388 ?auto_55391 ?auto_55389 ?auto_55387 ?auto_55386 )
      ( MAKE-3PILE ?auto_55385 ?auto_55386 ?auto_55387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55395 - BLOCK
      ?auto_55396 - BLOCK
      ?auto_55397 - BLOCK
    )
    :vars
    (
      ?auto_55398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55398 ?auto_55397 ) ( CLEAR ?auto_55398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55395 ) ( ON ?auto_55396 ?auto_55395 ) ( ON ?auto_55397 ?auto_55396 ) ( not ( = ?auto_55395 ?auto_55396 ) ) ( not ( = ?auto_55395 ?auto_55397 ) ) ( not ( = ?auto_55395 ?auto_55398 ) ) ( not ( = ?auto_55396 ?auto_55397 ) ) ( not ( = ?auto_55396 ?auto_55398 ) ) ( not ( = ?auto_55397 ?auto_55398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55398 ?auto_55397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55399 - BLOCK
      ?auto_55400 - BLOCK
      ?auto_55401 - BLOCK
    )
    :vars
    (
      ?auto_55402 - BLOCK
      ?auto_55403 - BLOCK
      ?auto_55404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55402 ?auto_55401 ) ( CLEAR ?auto_55402 ) ( ON-TABLE ?auto_55399 ) ( ON ?auto_55400 ?auto_55399 ) ( ON ?auto_55401 ?auto_55400 ) ( not ( = ?auto_55399 ?auto_55400 ) ) ( not ( = ?auto_55399 ?auto_55401 ) ) ( not ( = ?auto_55399 ?auto_55402 ) ) ( not ( = ?auto_55400 ?auto_55401 ) ) ( not ( = ?auto_55400 ?auto_55402 ) ) ( not ( = ?auto_55401 ?auto_55402 ) ) ( HOLDING ?auto_55403 ) ( CLEAR ?auto_55404 ) ( not ( = ?auto_55399 ?auto_55403 ) ) ( not ( = ?auto_55399 ?auto_55404 ) ) ( not ( = ?auto_55400 ?auto_55403 ) ) ( not ( = ?auto_55400 ?auto_55404 ) ) ( not ( = ?auto_55401 ?auto_55403 ) ) ( not ( = ?auto_55401 ?auto_55404 ) ) ( not ( = ?auto_55402 ?auto_55403 ) ) ( not ( = ?auto_55402 ?auto_55404 ) ) ( not ( = ?auto_55403 ?auto_55404 ) ) )
    :subtasks
    ( ( !STACK ?auto_55403 ?auto_55404 )
      ( MAKE-3PILE ?auto_55399 ?auto_55400 ?auto_55401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55405 - BLOCK
      ?auto_55406 - BLOCK
      ?auto_55407 - BLOCK
    )
    :vars
    (
      ?auto_55409 - BLOCK
      ?auto_55410 - BLOCK
      ?auto_55408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55409 ?auto_55407 ) ( ON-TABLE ?auto_55405 ) ( ON ?auto_55406 ?auto_55405 ) ( ON ?auto_55407 ?auto_55406 ) ( not ( = ?auto_55405 ?auto_55406 ) ) ( not ( = ?auto_55405 ?auto_55407 ) ) ( not ( = ?auto_55405 ?auto_55409 ) ) ( not ( = ?auto_55406 ?auto_55407 ) ) ( not ( = ?auto_55406 ?auto_55409 ) ) ( not ( = ?auto_55407 ?auto_55409 ) ) ( CLEAR ?auto_55410 ) ( not ( = ?auto_55405 ?auto_55408 ) ) ( not ( = ?auto_55405 ?auto_55410 ) ) ( not ( = ?auto_55406 ?auto_55408 ) ) ( not ( = ?auto_55406 ?auto_55410 ) ) ( not ( = ?auto_55407 ?auto_55408 ) ) ( not ( = ?auto_55407 ?auto_55410 ) ) ( not ( = ?auto_55409 ?auto_55408 ) ) ( not ( = ?auto_55409 ?auto_55410 ) ) ( not ( = ?auto_55408 ?auto_55410 ) ) ( ON ?auto_55408 ?auto_55409 ) ( CLEAR ?auto_55408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55405 ?auto_55406 ?auto_55407 ?auto_55409 )
      ( MAKE-3PILE ?auto_55405 ?auto_55406 ?auto_55407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55411 - BLOCK
      ?auto_55412 - BLOCK
      ?auto_55413 - BLOCK
    )
    :vars
    (
      ?auto_55416 - BLOCK
      ?auto_55415 - BLOCK
      ?auto_55414 - BLOCK
      ?auto_55417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55416 ?auto_55413 ) ( ON-TABLE ?auto_55411 ) ( ON ?auto_55412 ?auto_55411 ) ( ON ?auto_55413 ?auto_55412 ) ( not ( = ?auto_55411 ?auto_55412 ) ) ( not ( = ?auto_55411 ?auto_55413 ) ) ( not ( = ?auto_55411 ?auto_55416 ) ) ( not ( = ?auto_55412 ?auto_55413 ) ) ( not ( = ?auto_55412 ?auto_55416 ) ) ( not ( = ?auto_55413 ?auto_55416 ) ) ( not ( = ?auto_55411 ?auto_55415 ) ) ( not ( = ?auto_55411 ?auto_55414 ) ) ( not ( = ?auto_55412 ?auto_55415 ) ) ( not ( = ?auto_55412 ?auto_55414 ) ) ( not ( = ?auto_55413 ?auto_55415 ) ) ( not ( = ?auto_55413 ?auto_55414 ) ) ( not ( = ?auto_55416 ?auto_55415 ) ) ( not ( = ?auto_55416 ?auto_55414 ) ) ( not ( = ?auto_55415 ?auto_55414 ) ) ( ON ?auto_55415 ?auto_55416 ) ( CLEAR ?auto_55415 ) ( HOLDING ?auto_55414 ) ( CLEAR ?auto_55417 ) ( ON-TABLE ?auto_55417 ) ( not ( = ?auto_55417 ?auto_55414 ) ) ( not ( = ?auto_55411 ?auto_55417 ) ) ( not ( = ?auto_55412 ?auto_55417 ) ) ( not ( = ?auto_55413 ?auto_55417 ) ) ( not ( = ?auto_55416 ?auto_55417 ) ) ( not ( = ?auto_55415 ?auto_55417 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55417 ?auto_55414 )
      ( MAKE-3PILE ?auto_55411 ?auto_55412 ?auto_55413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56109 - BLOCK
      ?auto_56110 - BLOCK
      ?auto_56111 - BLOCK
    )
    :vars
    (
      ?auto_56113 - BLOCK
      ?auto_56114 - BLOCK
      ?auto_56112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56113 ?auto_56111 ) ( ON-TABLE ?auto_56109 ) ( ON ?auto_56110 ?auto_56109 ) ( ON ?auto_56111 ?auto_56110 ) ( not ( = ?auto_56109 ?auto_56110 ) ) ( not ( = ?auto_56109 ?auto_56111 ) ) ( not ( = ?auto_56109 ?auto_56113 ) ) ( not ( = ?auto_56110 ?auto_56111 ) ) ( not ( = ?auto_56110 ?auto_56113 ) ) ( not ( = ?auto_56111 ?auto_56113 ) ) ( not ( = ?auto_56109 ?auto_56114 ) ) ( not ( = ?auto_56109 ?auto_56112 ) ) ( not ( = ?auto_56110 ?auto_56114 ) ) ( not ( = ?auto_56110 ?auto_56112 ) ) ( not ( = ?auto_56111 ?auto_56114 ) ) ( not ( = ?auto_56111 ?auto_56112 ) ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( not ( = ?auto_56113 ?auto_56112 ) ) ( not ( = ?auto_56114 ?auto_56112 ) ) ( ON ?auto_56114 ?auto_56113 ) ( ON ?auto_56112 ?auto_56114 ) ( CLEAR ?auto_56112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56109 ?auto_56110 ?auto_56111 ?auto_56113 ?auto_56114 )
      ( MAKE-3PILE ?auto_56109 ?auto_56110 ?auto_56111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55425 - BLOCK
      ?auto_55426 - BLOCK
      ?auto_55427 - BLOCK
    )
    :vars
    (
      ?auto_55428 - BLOCK
      ?auto_55429 - BLOCK
      ?auto_55430 - BLOCK
      ?auto_55431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55428 ?auto_55427 ) ( ON-TABLE ?auto_55425 ) ( ON ?auto_55426 ?auto_55425 ) ( ON ?auto_55427 ?auto_55426 ) ( not ( = ?auto_55425 ?auto_55426 ) ) ( not ( = ?auto_55425 ?auto_55427 ) ) ( not ( = ?auto_55425 ?auto_55428 ) ) ( not ( = ?auto_55426 ?auto_55427 ) ) ( not ( = ?auto_55426 ?auto_55428 ) ) ( not ( = ?auto_55427 ?auto_55428 ) ) ( not ( = ?auto_55425 ?auto_55429 ) ) ( not ( = ?auto_55425 ?auto_55430 ) ) ( not ( = ?auto_55426 ?auto_55429 ) ) ( not ( = ?auto_55426 ?auto_55430 ) ) ( not ( = ?auto_55427 ?auto_55429 ) ) ( not ( = ?auto_55427 ?auto_55430 ) ) ( not ( = ?auto_55428 ?auto_55429 ) ) ( not ( = ?auto_55428 ?auto_55430 ) ) ( not ( = ?auto_55429 ?auto_55430 ) ) ( ON ?auto_55429 ?auto_55428 ) ( not ( = ?auto_55431 ?auto_55430 ) ) ( not ( = ?auto_55425 ?auto_55431 ) ) ( not ( = ?auto_55426 ?auto_55431 ) ) ( not ( = ?auto_55427 ?auto_55431 ) ) ( not ( = ?auto_55428 ?auto_55431 ) ) ( not ( = ?auto_55429 ?auto_55431 ) ) ( ON ?auto_55430 ?auto_55429 ) ( CLEAR ?auto_55430 ) ( HOLDING ?auto_55431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55431 )
      ( MAKE-3PILE ?auto_55425 ?auto_55426 ?auto_55427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55432 - BLOCK
      ?auto_55433 - BLOCK
      ?auto_55434 - BLOCK
    )
    :vars
    (
      ?auto_55437 - BLOCK
      ?auto_55438 - BLOCK
      ?auto_55435 - BLOCK
      ?auto_55436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55437 ?auto_55434 ) ( ON-TABLE ?auto_55432 ) ( ON ?auto_55433 ?auto_55432 ) ( ON ?auto_55434 ?auto_55433 ) ( not ( = ?auto_55432 ?auto_55433 ) ) ( not ( = ?auto_55432 ?auto_55434 ) ) ( not ( = ?auto_55432 ?auto_55437 ) ) ( not ( = ?auto_55433 ?auto_55434 ) ) ( not ( = ?auto_55433 ?auto_55437 ) ) ( not ( = ?auto_55434 ?auto_55437 ) ) ( not ( = ?auto_55432 ?auto_55438 ) ) ( not ( = ?auto_55432 ?auto_55435 ) ) ( not ( = ?auto_55433 ?auto_55438 ) ) ( not ( = ?auto_55433 ?auto_55435 ) ) ( not ( = ?auto_55434 ?auto_55438 ) ) ( not ( = ?auto_55434 ?auto_55435 ) ) ( not ( = ?auto_55437 ?auto_55438 ) ) ( not ( = ?auto_55437 ?auto_55435 ) ) ( not ( = ?auto_55438 ?auto_55435 ) ) ( ON ?auto_55438 ?auto_55437 ) ( not ( = ?auto_55436 ?auto_55435 ) ) ( not ( = ?auto_55432 ?auto_55436 ) ) ( not ( = ?auto_55433 ?auto_55436 ) ) ( not ( = ?auto_55434 ?auto_55436 ) ) ( not ( = ?auto_55437 ?auto_55436 ) ) ( not ( = ?auto_55438 ?auto_55436 ) ) ( ON ?auto_55435 ?auto_55438 ) ( ON ?auto_55436 ?auto_55435 ) ( CLEAR ?auto_55436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55432 ?auto_55433 ?auto_55434 ?auto_55437 ?auto_55438 ?auto_55435 )
      ( MAKE-3PILE ?auto_55432 ?auto_55433 ?auto_55434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55443 - BLOCK
      ?auto_55444 - BLOCK
      ?auto_55445 - BLOCK
      ?auto_55446 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55446 ) ( CLEAR ?auto_55445 ) ( ON-TABLE ?auto_55443 ) ( ON ?auto_55444 ?auto_55443 ) ( ON ?auto_55445 ?auto_55444 ) ( not ( = ?auto_55443 ?auto_55444 ) ) ( not ( = ?auto_55443 ?auto_55445 ) ) ( not ( = ?auto_55443 ?auto_55446 ) ) ( not ( = ?auto_55444 ?auto_55445 ) ) ( not ( = ?auto_55444 ?auto_55446 ) ) ( not ( = ?auto_55445 ?auto_55446 ) ) )
    :subtasks
    ( ( !STACK ?auto_55446 ?auto_55445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55447 - BLOCK
      ?auto_55448 - BLOCK
      ?auto_55449 - BLOCK
      ?auto_55450 - BLOCK
    )
    :vars
    (
      ?auto_55451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55449 ) ( ON-TABLE ?auto_55447 ) ( ON ?auto_55448 ?auto_55447 ) ( ON ?auto_55449 ?auto_55448 ) ( not ( = ?auto_55447 ?auto_55448 ) ) ( not ( = ?auto_55447 ?auto_55449 ) ) ( not ( = ?auto_55447 ?auto_55450 ) ) ( not ( = ?auto_55448 ?auto_55449 ) ) ( not ( = ?auto_55448 ?auto_55450 ) ) ( not ( = ?auto_55449 ?auto_55450 ) ) ( ON ?auto_55450 ?auto_55451 ) ( CLEAR ?auto_55450 ) ( HAND-EMPTY ) ( not ( = ?auto_55447 ?auto_55451 ) ) ( not ( = ?auto_55448 ?auto_55451 ) ) ( not ( = ?auto_55449 ?auto_55451 ) ) ( not ( = ?auto_55450 ?auto_55451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55450 ?auto_55451 )
      ( MAKE-4PILE ?auto_55447 ?auto_55448 ?auto_55449 ?auto_55450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55452 - BLOCK
      ?auto_55453 - BLOCK
      ?auto_55454 - BLOCK
      ?auto_55455 - BLOCK
    )
    :vars
    (
      ?auto_55456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55452 ) ( ON ?auto_55453 ?auto_55452 ) ( not ( = ?auto_55452 ?auto_55453 ) ) ( not ( = ?auto_55452 ?auto_55454 ) ) ( not ( = ?auto_55452 ?auto_55455 ) ) ( not ( = ?auto_55453 ?auto_55454 ) ) ( not ( = ?auto_55453 ?auto_55455 ) ) ( not ( = ?auto_55454 ?auto_55455 ) ) ( ON ?auto_55455 ?auto_55456 ) ( CLEAR ?auto_55455 ) ( not ( = ?auto_55452 ?auto_55456 ) ) ( not ( = ?auto_55453 ?auto_55456 ) ) ( not ( = ?auto_55454 ?auto_55456 ) ) ( not ( = ?auto_55455 ?auto_55456 ) ) ( HOLDING ?auto_55454 ) ( CLEAR ?auto_55453 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55452 ?auto_55453 ?auto_55454 )
      ( MAKE-4PILE ?auto_55452 ?auto_55453 ?auto_55454 ?auto_55455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55457 - BLOCK
      ?auto_55458 - BLOCK
      ?auto_55459 - BLOCK
      ?auto_55460 - BLOCK
    )
    :vars
    (
      ?auto_55461 - BLOCK
      ?auto_55463 - BLOCK
      ?auto_55462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55457 ) ( ON ?auto_55458 ?auto_55457 ) ( not ( = ?auto_55457 ?auto_55458 ) ) ( not ( = ?auto_55457 ?auto_55459 ) ) ( not ( = ?auto_55457 ?auto_55460 ) ) ( not ( = ?auto_55458 ?auto_55459 ) ) ( not ( = ?auto_55458 ?auto_55460 ) ) ( not ( = ?auto_55459 ?auto_55460 ) ) ( ON ?auto_55460 ?auto_55461 ) ( not ( = ?auto_55457 ?auto_55461 ) ) ( not ( = ?auto_55458 ?auto_55461 ) ) ( not ( = ?auto_55459 ?auto_55461 ) ) ( not ( = ?auto_55460 ?auto_55461 ) ) ( CLEAR ?auto_55458 ) ( ON ?auto_55459 ?auto_55460 ) ( CLEAR ?auto_55459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55463 ) ( ON ?auto_55462 ?auto_55463 ) ( ON ?auto_55461 ?auto_55462 ) ( not ( = ?auto_55463 ?auto_55462 ) ) ( not ( = ?auto_55463 ?auto_55461 ) ) ( not ( = ?auto_55463 ?auto_55460 ) ) ( not ( = ?auto_55463 ?auto_55459 ) ) ( not ( = ?auto_55462 ?auto_55461 ) ) ( not ( = ?auto_55462 ?auto_55460 ) ) ( not ( = ?auto_55462 ?auto_55459 ) ) ( not ( = ?auto_55457 ?auto_55463 ) ) ( not ( = ?auto_55457 ?auto_55462 ) ) ( not ( = ?auto_55458 ?auto_55463 ) ) ( not ( = ?auto_55458 ?auto_55462 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55463 ?auto_55462 ?auto_55461 ?auto_55460 )
      ( MAKE-4PILE ?auto_55457 ?auto_55458 ?auto_55459 ?auto_55460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55464 - BLOCK
      ?auto_55465 - BLOCK
      ?auto_55466 - BLOCK
      ?auto_55467 - BLOCK
    )
    :vars
    (
      ?auto_55469 - BLOCK
      ?auto_55468 - BLOCK
      ?auto_55470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55464 ) ( not ( = ?auto_55464 ?auto_55465 ) ) ( not ( = ?auto_55464 ?auto_55466 ) ) ( not ( = ?auto_55464 ?auto_55467 ) ) ( not ( = ?auto_55465 ?auto_55466 ) ) ( not ( = ?auto_55465 ?auto_55467 ) ) ( not ( = ?auto_55466 ?auto_55467 ) ) ( ON ?auto_55467 ?auto_55469 ) ( not ( = ?auto_55464 ?auto_55469 ) ) ( not ( = ?auto_55465 ?auto_55469 ) ) ( not ( = ?auto_55466 ?auto_55469 ) ) ( not ( = ?auto_55467 ?auto_55469 ) ) ( ON ?auto_55466 ?auto_55467 ) ( CLEAR ?auto_55466 ) ( ON-TABLE ?auto_55468 ) ( ON ?auto_55470 ?auto_55468 ) ( ON ?auto_55469 ?auto_55470 ) ( not ( = ?auto_55468 ?auto_55470 ) ) ( not ( = ?auto_55468 ?auto_55469 ) ) ( not ( = ?auto_55468 ?auto_55467 ) ) ( not ( = ?auto_55468 ?auto_55466 ) ) ( not ( = ?auto_55470 ?auto_55469 ) ) ( not ( = ?auto_55470 ?auto_55467 ) ) ( not ( = ?auto_55470 ?auto_55466 ) ) ( not ( = ?auto_55464 ?auto_55468 ) ) ( not ( = ?auto_55464 ?auto_55470 ) ) ( not ( = ?auto_55465 ?auto_55468 ) ) ( not ( = ?auto_55465 ?auto_55470 ) ) ( HOLDING ?auto_55465 ) ( CLEAR ?auto_55464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55464 ?auto_55465 )
      ( MAKE-4PILE ?auto_55464 ?auto_55465 ?auto_55466 ?auto_55467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55471 - BLOCK
      ?auto_55472 - BLOCK
      ?auto_55473 - BLOCK
      ?auto_55474 - BLOCK
    )
    :vars
    (
      ?auto_55477 - BLOCK
      ?auto_55475 - BLOCK
      ?auto_55476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55471 ) ( not ( = ?auto_55471 ?auto_55472 ) ) ( not ( = ?auto_55471 ?auto_55473 ) ) ( not ( = ?auto_55471 ?auto_55474 ) ) ( not ( = ?auto_55472 ?auto_55473 ) ) ( not ( = ?auto_55472 ?auto_55474 ) ) ( not ( = ?auto_55473 ?auto_55474 ) ) ( ON ?auto_55474 ?auto_55477 ) ( not ( = ?auto_55471 ?auto_55477 ) ) ( not ( = ?auto_55472 ?auto_55477 ) ) ( not ( = ?auto_55473 ?auto_55477 ) ) ( not ( = ?auto_55474 ?auto_55477 ) ) ( ON ?auto_55473 ?auto_55474 ) ( ON-TABLE ?auto_55475 ) ( ON ?auto_55476 ?auto_55475 ) ( ON ?auto_55477 ?auto_55476 ) ( not ( = ?auto_55475 ?auto_55476 ) ) ( not ( = ?auto_55475 ?auto_55477 ) ) ( not ( = ?auto_55475 ?auto_55474 ) ) ( not ( = ?auto_55475 ?auto_55473 ) ) ( not ( = ?auto_55476 ?auto_55477 ) ) ( not ( = ?auto_55476 ?auto_55474 ) ) ( not ( = ?auto_55476 ?auto_55473 ) ) ( not ( = ?auto_55471 ?auto_55475 ) ) ( not ( = ?auto_55471 ?auto_55476 ) ) ( not ( = ?auto_55472 ?auto_55475 ) ) ( not ( = ?auto_55472 ?auto_55476 ) ) ( CLEAR ?auto_55471 ) ( ON ?auto_55472 ?auto_55473 ) ( CLEAR ?auto_55472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55475 ?auto_55476 ?auto_55477 ?auto_55474 ?auto_55473 )
      ( MAKE-4PILE ?auto_55471 ?auto_55472 ?auto_55473 ?auto_55474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55478 - BLOCK
      ?auto_55479 - BLOCK
      ?auto_55480 - BLOCK
      ?auto_55481 - BLOCK
    )
    :vars
    (
      ?auto_55482 - BLOCK
      ?auto_55483 - BLOCK
      ?auto_55484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55478 ?auto_55479 ) ) ( not ( = ?auto_55478 ?auto_55480 ) ) ( not ( = ?auto_55478 ?auto_55481 ) ) ( not ( = ?auto_55479 ?auto_55480 ) ) ( not ( = ?auto_55479 ?auto_55481 ) ) ( not ( = ?auto_55480 ?auto_55481 ) ) ( ON ?auto_55481 ?auto_55482 ) ( not ( = ?auto_55478 ?auto_55482 ) ) ( not ( = ?auto_55479 ?auto_55482 ) ) ( not ( = ?auto_55480 ?auto_55482 ) ) ( not ( = ?auto_55481 ?auto_55482 ) ) ( ON ?auto_55480 ?auto_55481 ) ( ON-TABLE ?auto_55483 ) ( ON ?auto_55484 ?auto_55483 ) ( ON ?auto_55482 ?auto_55484 ) ( not ( = ?auto_55483 ?auto_55484 ) ) ( not ( = ?auto_55483 ?auto_55482 ) ) ( not ( = ?auto_55483 ?auto_55481 ) ) ( not ( = ?auto_55483 ?auto_55480 ) ) ( not ( = ?auto_55484 ?auto_55482 ) ) ( not ( = ?auto_55484 ?auto_55481 ) ) ( not ( = ?auto_55484 ?auto_55480 ) ) ( not ( = ?auto_55478 ?auto_55483 ) ) ( not ( = ?auto_55478 ?auto_55484 ) ) ( not ( = ?auto_55479 ?auto_55483 ) ) ( not ( = ?auto_55479 ?auto_55484 ) ) ( ON ?auto_55479 ?auto_55480 ) ( CLEAR ?auto_55479 ) ( HOLDING ?auto_55478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55478 )
      ( MAKE-4PILE ?auto_55478 ?auto_55479 ?auto_55480 ?auto_55481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55485 - BLOCK
      ?auto_55486 - BLOCK
      ?auto_55487 - BLOCK
      ?auto_55488 - BLOCK
    )
    :vars
    (
      ?auto_55490 - BLOCK
      ?auto_55489 - BLOCK
      ?auto_55491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55485 ?auto_55486 ) ) ( not ( = ?auto_55485 ?auto_55487 ) ) ( not ( = ?auto_55485 ?auto_55488 ) ) ( not ( = ?auto_55486 ?auto_55487 ) ) ( not ( = ?auto_55486 ?auto_55488 ) ) ( not ( = ?auto_55487 ?auto_55488 ) ) ( ON ?auto_55488 ?auto_55490 ) ( not ( = ?auto_55485 ?auto_55490 ) ) ( not ( = ?auto_55486 ?auto_55490 ) ) ( not ( = ?auto_55487 ?auto_55490 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( ON ?auto_55487 ?auto_55488 ) ( ON-TABLE ?auto_55489 ) ( ON ?auto_55491 ?auto_55489 ) ( ON ?auto_55490 ?auto_55491 ) ( not ( = ?auto_55489 ?auto_55491 ) ) ( not ( = ?auto_55489 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55488 ) ) ( not ( = ?auto_55489 ?auto_55487 ) ) ( not ( = ?auto_55491 ?auto_55490 ) ) ( not ( = ?auto_55491 ?auto_55488 ) ) ( not ( = ?auto_55491 ?auto_55487 ) ) ( not ( = ?auto_55485 ?auto_55489 ) ) ( not ( = ?auto_55485 ?auto_55491 ) ) ( not ( = ?auto_55486 ?auto_55489 ) ) ( not ( = ?auto_55486 ?auto_55491 ) ) ( ON ?auto_55486 ?auto_55487 ) ( ON ?auto_55485 ?auto_55486 ) ( CLEAR ?auto_55485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55489 ?auto_55491 ?auto_55490 ?auto_55488 ?auto_55487 ?auto_55486 )
      ( MAKE-4PILE ?auto_55485 ?auto_55486 ?auto_55487 ?auto_55488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55494 - BLOCK
      ?auto_55495 - BLOCK
    )
    :vars
    (
      ?auto_55496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55496 ?auto_55495 ) ( CLEAR ?auto_55496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55494 ) ( ON ?auto_55495 ?auto_55494 ) ( not ( = ?auto_55494 ?auto_55495 ) ) ( not ( = ?auto_55494 ?auto_55496 ) ) ( not ( = ?auto_55495 ?auto_55496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55496 ?auto_55495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55497 - BLOCK
      ?auto_55498 - BLOCK
    )
    :vars
    (
      ?auto_55499 - BLOCK
      ?auto_55500 - BLOCK
      ?auto_55501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55499 ?auto_55498 ) ( CLEAR ?auto_55499 ) ( ON-TABLE ?auto_55497 ) ( ON ?auto_55498 ?auto_55497 ) ( not ( = ?auto_55497 ?auto_55498 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55498 ?auto_55499 ) ) ( HOLDING ?auto_55500 ) ( CLEAR ?auto_55501 ) ( not ( = ?auto_55497 ?auto_55500 ) ) ( not ( = ?auto_55497 ?auto_55501 ) ) ( not ( = ?auto_55498 ?auto_55500 ) ) ( not ( = ?auto_55498 ?auto_55501 ) ) ( not ( = ?auto_55499 ?auto_55500 ) ) ( not ( = ?auto_55499 ?auto_55501 ) ) ( not ( = ?auto_55500 ?auto_55501 ) ) )
    :subtasks
    ( ( !STACK ?auto_55500 ?auto_55501 )
      ( MAKE-2PILE ?auto_55497 ?auto_55498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55502 - BLOCK
      ?auto_55503 - BLOCK
    )
    :vars
    (
      ?auto_55504 - BLOCK
      ?auto_55505 - BLOCK
      ?auto_55506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55504 ?auto_55503 ) ( ON-TABLE ?auto_55502 ) ( ON ?auto_55503 ?auto_55502 ) ( not ( = ?auto_55502 ?auto_55503 ) ) ( not ( = ?auto_55502 ?auto_55504 ) ) ( not ( = ?auto_55503 ?auto_55504 ) ) ( CLEAR ?auto_55505 ) ( not ( = ?auto_55502 ?auto_55506 ) ) ( not ( = ?auto_55502 ?auto_55505 ) ) ( not ( = ?auto_55503 ?auto_55506 ) ) ( not ( = ?auto_55503 ?auto_55505 ) ) ( not ( = ?auto_55504 ?auto_55506 ) ) ( not ( = ?auto_55504 ?auto_55505 ) ) ( not ( = ?auto_55506 ?auto_55505 ) ) ( ON ?auto_55506 ?auto_55504 ) ( CLEAR ?auto_55506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55502 ?auto_55503 ?auto_55504 )
      ( MAKE-2PILE ?auto_55502 ?auto_55503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55507 - BLOCK
      ?auto_55508 - BLOCK
    )
    :vars
    (
      ?auto_55511 - BLOCK
      ?auto_55509 - BLOCK
      ?auto_55510 - BLOCK
      ?auto_55512 - BLOCK
      ?auto_55513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55511 ?auto_55508 ) ( ON-TABLE ?auto_55507 ) ( ON ?auto_55508 ?auto_55507 ) ( not ( = ?auto_55507 ?auto_55508 ) ) ( not ( = ?auto_55507 ?auto_55511 ) ) ( not ( = ?auto_55508 ?auto_55511 ) ) ( not ( = ?auto_55507 ?auto_55509 ) ) ( not ( = ?auto_55507 ?auto_55510 ) ) ( not ( = ?auto_55508 ?auto_55509 ) ) ( not ( = ?auto_55508 ?auto_55510 ) ) ( not ( = ?auto_55511 ?auto_55509 ) ) ( not ( = ?auto_55511 ?auto_55510 ) ) ( not ( = ?auto_55509 ?auto_55510 ) ) ( ON ?auto_55509 ?auto_55511 ) ( CLEAR ?auto_55509 ) ( HOLDING ?auto_55510 ) ( CLEAR ?auto_55512 ) ( ON-TABLE ?auto_55513 ) ( ON ?auto_55512 ?auto_55513 ) ( not ( = ?auto_55513 ?auto_55512 ) ) ( not ( = ?auto_55513 ?auto_55510 ) ) ( not ( = ?auto_55512 ?auto_55510 ) ) ( not ( = ?auto_55507 ?auto_55512 ) ) ( not ( = ?auto_55507 ?auto_55513 ) ) ( not ( = ?auto_55508 ?auto_55512 ) ) ( not ( = ?auto_55508 ?auto_55513 ) ) ( not ( = ?auto_55511 ?auto_55512 ) ) ( not ( = ?auto_55511 ?auto_55513 ) ) ( not ( = ?auto_55509 ?auto_55512 ) ) ( not ( = ?auto_55509 ?auto_55513 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55513 ?auto_55512 ?auto_55510 )
      ( MAKE-2PILE ?auto_55507 ?auto_55508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55514 - BLOCK
      ?auto_55515 - BLOCK
    )
    :vars
    (
      ?auto_55516 - BLOCK
      ?auto_55517 - BLOCK
      ?auto_55520 - BLOCK
      ?auto_55519 - BLOCK
      ?auto_55518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55516 ?auto_55515 ) ( ON-TABLE ?auto_55514 ) ( ON ?auto_55515 ?auto_55514 ) ( not ( = ?auto_55514 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55516 ) ) ( not ( = ?auto_55515 ?auto_55516 ) ) ( not ( = ?auto_55514 ?auto_55517 ) ) ( not ( = ?auto_55514 ?auto_55520 ) ) ( not ( = ?auto_55515 ?auto_55517 ) ) ( not ( = ?auto_55515 ?auto_55520 ) ) ( not ( = ?auto_55516 ?auto_55517 ) ) ( not ( = ?auto_55516 ?auto_55520 ) ) ( not ( = ?auto_55517 ?auto_55520 ) ) ( ON ?auto_55517 ?auto_55516 ) ( CLEAR ?auto_55519 ) ( ON-TABLE ?auto_55518 ) ( ON ?auto_55519 ?auto_55518 ) ( not ( = ?auto_55518 ?auto_55519 ) ) ( not ( = ?auto_55518 ?auto_55520 ) ) ( not ( = ?auto_55519 ?auto_55520 ) ) ( not ( = ?auto_55514 ?auto_55519 ) ) ( not ( = ?auto_55514 ?auto_55518 ) ) ( not ( = ?auto_55515 ?auto_55519 ) ) ( not ( = ?auto_55515 ?auto_55518 ) ) ( not ( = ?auto_55516 ?auto_55519 ) ) ( not ( = ?auto_55516 ?auto_55518 ) ) ( not ( = ?auto_55517 ?auto_55519 ) ) ( not ( = ?auto_55517 ?auto_55518 ) ) ( ON ?auto_55520 ?auto_55517 ) ( CLEAR ?auto_55520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55514 ?auto_55515 ?auto_55516 ?auto_55517 )
      ( MAKE-2PILE ?auto_55514 ?auto_55515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55521 - BLOCK
      ?auto_55522 - BLOCK
    )
    :vars
    (
      ?auto_55526 - BLOCK
      ?auto_55527 - BLOCK
      ?auto_55524 - BLOCK
      ?auto_55523 - BLOCK
      ?auto_55525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55526 ?auto_55522 ) ( ON-TABLE ?auto_55521 ) ( ON ?auto_55522 ?auto_55521 ) ( not ( = ?auto_55521 ?auto_55522 ) ) ( not ( = ?auto_55521 ?auto_55526 ) ) ( not ( = ?auto_55522 ?auto_55526 ) ) ( not ( = ?auto_55521 ?auto_55527 ) ) ( not ( = ?auto_55521 ?auto_55524 ) ) ( not ( = ?auto_55522 ?auto_55527 ) ) ( not ( = ?auto_55522 ?auto_55524 ) ) ( not ( = ?auto_55526 ?auto_55527 ) ) ( not ( = ?auto_55526 ?auto_55524 ) ) ( not ( = ?auto_55527 ?auto_55524 ) ) ( ON ?auto_55527 ?auto_55526 ) ( ON-TABLE ?auto_55523 ) ( not ( = ?auto_55523 ?auto_55525 ) ) ( not ( = ?auto_55523 ?auto_55524 ) ) ( not ( = ?auto_55525 ?auto_55524 ) ) ( not ( = ?auto_55521 ?auto_55525 ) ) ( not ( = ?auto_55521 ?auto_55523 ) ) ( not ( = ?auto_55522 ?auto_55525 ) ) ( not ( = ?auto_55522 ?auto_55523 ) ) ( not ( = ?auto_55526 ?auto_55525 ) ) ( not ( = ?auto_55526 ?auto_55523 ) ) ( not ( = ?auto_55527 ?auto_55525 ) ) ( not ( = ?auto_55527 ?auto_55523 ) ) ( ON ?auto_55524 ?auto_55527 ) ( CLEAR ?auto_55524 ) ( HOLDING ?auto_55525 ) ( CLEAR ?auto_55523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55523 ?auto_55525 )
      ( MAKE-2PILE ?auto_55521 ?auto_55522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56299 - BLOCK
      ?auto_56300 - BLOCK
    )
    :vars
    (
      ?auto_56303 - BLOCK
      ?auto_56304 - BLOCK
      ?auto_56302 - BLOCK
      ?auto_56301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56303 ?auto_56300 ) ( ON-TABLE ?auto_56299 ) ( ON ?auto_56300 ?auto_56299 ) ( not ( = ?auto_56299 ?auto_56300 ) ) ( not ( = ?auto_56299 ?auto_56303 ) ) ( not ( = ?auto_56300 ?auto_56303 ) ) ( not ( = ?auto_56299 ?auto_56304 ) ) ( not ( = ?auto_56299 ?auto_56302 ) ) ( not ( = ?auto_56300 ?auto_56304 ) ) ( not ( = ?auto_56300 ?auto_56302 ) ) ( not ( = ?auto_56303 ?auto_56304 ) ) ( not ( = ?auto_56303 ?auto_56302 ) ) ( not ( = ?auto_56304 ?auto_56302 ) ) ( ON ?auto_56304 ?auto_56303 ) ( not ( = ?auto_56301 ?auto_56302 ) ) ( not ( = ?auto_56299 ?auto_56301 ) ) ( not ( = ?auto_56300 ?auto_56301 ) ) ( not ( = ?auto_56303 ?auto_56301 ) ) ( not ( = ?auto_56304 ?auto_56301 ) ) ( ON ?auto_56302 ?auto_56304 ) ( ON ?auto_56301 ?auto_56302 ) ( CLEAR ?auto_56301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56299 ?auto_56300 ?auto_56303 ?auto_56304 ?auto_56302 )
      ( MAKE-2PILE ?auto_56299 ?auto_56300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55535 - BLOCK
      ?auto_55536 - BLOCK
    )
    :vars
    (
      ?auto_55540 - BLOCK
      ?auto_55537 - BLOCK
      ?auto_55541 - BLOCK
      ?auto_55538 - BLOCK
      ?auto_55539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55540 ?auto_55536 ) ( ON-TABLE ?auto_55535 ) ( ON ?auto_55536 ?auto_55535 ) ( not ( = ?auto_55535 ?auto_55536 ) ) ( not ( = ?auto_55535 ?auto_55540 ) ) ( not ( = ?auto_55536 ?auto_55540 ) ) ( not ( = ?auto_55535 ?auto_55537 ) ) ( not ( = ?auto_55535 ?auto_55541 ) ) ( not ( = ?auto_55536 ?auto_55537 ) ) ( not ( = ?auto_55536 ?auto_55541 ) ) ( not ( = ?auto_55540 ?auto_55537 ) ) ( not ( = ?auto_55540 ?auto_55541 ) ) ( not ( = ?auto_55537 ?auto_55541 ) ) ( ON ?auto_55537 ?auto_55540 ) ( not ( = ?auto_55538 ?auto_55539 ) ) ( not ( = ?auto_55538 ?auto_55541 ) ) ( not ( = ?auto_55539 ?auto_55541 ) ) ( not ( = ?auto_55535 ?auto_55539 ) ) ( not ( = ?auto_55535 ?auto_55538 ) ) ( not ( = ?auto_55536 ?auto_55539 ) ) ( not ( = ?auto_55536 ?auto_55538 ) ) ( not ( = ?auto_55540 ?auto_55539 ) ) ( not ( = ?auto_55540 ?auto_55538 ) ) ( not ( = ?auto_55537 ?auto_55539 ) ) ( not ( = ?auto_55537 ?auto_55538 ) ) ( ON ?auto_55541 ?auto_55537 ) ( ON ?auto_55539 ?auto_55541 ) ( CLEAR ?auto_55539 ) ( HOLDING ?auto_55538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55538 )
      ( MAKE-2PILE ?auto_55535 ?auto_55536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55542 - BLOCK
      ?auto_55543 - BLOCK
    )
    :vars
    (
      ?auto_55545 - BLOCK
      ?auto_55544 - BLOCK
      ?auto_55547 - BLOCK
      ?auto_55548 - BLOCK
      ?auto_55546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55545 ?auto_55543 ) ( ON-TABLE ?auto_55542 ) ( ON ?auto_55543 ?auto_55542 ) ( not ( = ?auto_55542 ?auto_55543 ) ) ( not ( = ?auto_55542 ?auto_55545 ) ) ( not ( = ?auto_55543 ?auto_55545 ) ) ( not ( = ?auto_55542 ?auto_55544 ) ) ( not ( = ?auto_55542 ?auto_55547 ) ) ( not ( = ?auto_55543 ?auto_55544 ) ) ( not ( = ?auto_55543 ?auto_55547 ) ) ( not ( = ?auto_55545 ?auto_55544 ) ) ( not ( = ?auto_55545 ?auto_55547 ) ) ( not ( = ?auto_55544 ?auto_55547 ) ) ( ON ?auto_55544 ?auto_55545 ) ( not ( = ?auto_55548 ?auto_55546 ) ) ( not ( = ?auto_55548 ?auto_55547 ) ) ( not ( = ?auto_55546 ?auto_55547 ) ) ( not ( = ?auto_55542 ?auto_55546 ) ) ( not ( = ?auto_55542 ?auto_55548 ) ) ( not ( = ?auto_55543 ?auto_55546 ) ) ( not ( = ?auto_55543 ?auto_55548 ) ) ( not ( = ?auto_55545 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55548 ) ) ( not ( = ?auto_55544 ?auto_55546 ) ) ( not ( = ?auto_55544 ?auto_55548 ) ) ( ON ?auto_55547 ?auto_55544 ) ( ON ?auto_55546 ?auto_55547 ) ( ON ?auto_55548 ?auto_55546 ) ( CLEAR ?auto_55548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55542 ?auto_55543 ?auto_55545 ?auto_55544 ?auto_55547 ?auto_55546 )
      ( MAKE-2PILE ?auto_55542 ?auto_55543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55554 - BLOCK
      ?auto_55555 - BLOCK
      ?auto_55556 - BLOCK
      ?auto_55557 - BLOCK
      ?auto_55558 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55558 ) ( CLEAR ?auto_55557 ) ( ON-TABLE ?auto_55554 ) ( ON ?auto_55555 ?auto_55554 ) ( ON ?auto_55556 ?auto_55555 ) ( ON ?auto_55557 ?auto_55556 ) ( not ( = ?auto_55554 ?auto_55555 ) ) ( not ( = ?auto_55554 ?auto_55556 ) ) ( not ( = ?auto_55554 ?auto_55557 ) ) ( not ( = ?auto_55554 ?auto_55558 ) ) ( not ( = ?auto_55555 ?auto_55556 ) ) ( not ( = ?auto_55555 ?auto_55557 ) ) ( not ( = ?auto_55555 ?auto_55558 ) ) ( not ( = ?auto_55556 ?auto_55557 ) ) ( not ( = ?auto_55556 ?auto_55558 ) ) ( not ( = ?auto_55557 ?auto_55558 ) ) )
    :subtasks
    ( ( !STACK ?auto_55558 ?auto_55557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55559 - BLOCK
      ?auto_55560 - BLOCK
      ?auto_55561 - BLOCK
      ?auto_55562 - BLOCK
      ?auto_55563 - BLOCK
    )
    :vars
    (
      ?auto_55564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55562 ) ( ON-TABLE ?auto_55559 ) ( ON ?auto_55560 ?auto_55559 ) ( ON ?auto_55561 ?auto_55560 ) ( ON ?auto_55562 ?auto_55561 ) ( not ( = ?auto_55559 ?auto_55560 ) ) ( not ( = ?auto_55559 ?auto_55561 ) ) ( not ( = ?auto_55559 ?auto_55562 ) ) ( not ( = ?auto_55559 ?auto_55563 ) ) ( not ( = ?auto_55560 ?auto_55561 ) ) ( not ( = ?auto_55560 ?auto_55562 ) ) ( not ( = ?auto_55560 ?auto_55563 ) ) ( not ( = ?auto_55561 ?auto_55562 ) ) ( not ( = ?auto_55561 ?auto_55563 ) ) ( not ( = ?auto_55562 ?auto_55563 ) ) ( ON ?auto_55563 ?auto_55564 ) ( CLEAR ?auto_55563 ) ( HAND-EMPTY ) ( not ( = ?auto_55559 ?auto_55564 ) ) ( not ( = ?auto_55560 ?auto_55564 ) ) ( not ( = ?auto_55561 ?auto_55564 ) ) ( not ( = ?auto_55562 ?auto_55564 ) ) ( not ( = ?auto_55563 ?auto_55564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55563 ?auto_55564 )
      ( MAKE-5PILE ?auto_55559 ?auto_55560 ?auto_55561 ?auto_55562 ?auto_55563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55565 - BLOCK
      ?auto_55566 - BLOCK
      ?auto_55567 - BLOCK
      ?auto_55568 - BLOCK
      ?auto_55569 - BLOCK
    )
    :vars
    (
      ?auto_55570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55565 ) ( ON ?auto_55566 ?auto_55565 ) ( ON ?auto_55567 ?auto_55566 ) ( not ( = ?auto_55565 ?auto_55566 ) ) ( not ( = ?auto_55565 ?auto_55567 ) ) ( not ( = ?auto_55565 ?auto_55568 ) ) ( not ( = ?auto_55565 ?auto_55569 ) ) ( not ( = ?auto_55566 ?auto_55567 ) ) ( not ( = ?auto_55566 ?auto_55568 ) ) ( not ( = ?auto_55566 ?auto_55569 ) ) ( not ( = ?auto_55567 ?auto_55568 ) ) ( not ( = ?auto_55567 ?auto_55569 ) ) ( not ( = ?auto_55568 ?auto_55569 ) ) ( ON ?auto_55569 ?auto_55570 ) ( CLEAR ?auto_55569 ) ( not ( = ?auto_55565 ?auto_55570 ) ) ( not ( = ?auto_55566 ?auto_55570 ) ) ( not ( = ?auto_55567 ?auto_55570 ) ) ( not ( = ?auto_55568 ?auto_55570 ) ) ( not ( = ?auto_55569 ?auto_55570 ) ) ( HOLDING ?auto_55568 ) ( CLEAR ?auto_55567 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55565 ?auto_55566 ?auto_55567 ?auto_55568 )
      ( MAKE-5PILE ?auto_55565 ?auto_55566 ?auto_55567 ?auto_55568 ?auto_55569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55571 - BLOCK
      ?auto_55572 - BLOCK
      ?auto_55573 - BLOCK
      ?auto_55574 - BLOCK
      ?auto_55575 - BLOCK
    )
    :vars
    (
      ?auto_55576 - BLOCK
      ?auto_55577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55571 ) ( ON ?auto_55572 ?auto_55571 ) ( ON ?auto_55573 ?auto_55572 ) ( not ( = ?auto_55571 ?auto_55572 ) ) ( not ( = ?auto_55571 ?auto_55573 ) ) ( not ( = ?auto_55571 ?auto_55574 ) ) ( not ( = ?auto_55571 ?auto_55575 ) ) ( not ( = ?auto_55572 ?auto_55573 ) ) ( not ( = ?auto_55572 ?auto_55574 ) ) ( not ( = ?auto_55572 ?auto_55575 ) ) ( not ( = ?auto_55573 ?auto_55574 ) ) ( not ( = ?auto_55573 ?auto_55575 ) ) ( not ( = ?auto_55574 ?auto_55575 ) ) ( ON ?auto_55575 ?auto_55576 ) ( not ( = ?auto_55571 ?auto_55576 ) ) ( not ( = ?auto_55572 ?auto_55576 ) ) ( not ( = ?auto_55573 ?auto_55576 ) ) ( not ( = ?auto_55574 ?auto_55576 ) ) ( not ( = ?auto_55575 ?auto_55576 ) ) ( CLEAR ?auto_55573 ) ( ON ?auto_55574 ?auto_55575 ) ( CLEAR ?auto_55574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55577 ) ( ON ?auto_55576 ?auto_55577 ) ( not ( = ?auto_55577 ?auto_55576 ) ) ( not ( = ?auto_55577 ?auto_55575 ) ) ( not ( = ?auto_55577 ?auto_55574 ) ) ( not ( = ?auto_55571 ?auto_55577 ) ) ( not ( = ?auto_55572 ?auto_55577 ) ) ( not ( = ?auto_55573 ?auto_55577 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55577 ?auto_55576 ?auto_55575 )
      ( MAKE-5PILE ?auto_55571 ?auto_55572 ?auto_55573 ?auto_55574 ?auto_55575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55578 - BLOCK
      ?auto_55579 - BLOCK
      ?auto_55580 - BLOCK
      ?auto_55581 - BLOCK
      ?auto_55582 - BLOCK
    )
    :vars
    (
      ?auto_55584 - BLOCK
      ?auto_55583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55578 ) ( ON ?auto_55579 ?auto_55578 ) ( not ( = ?auto_55578 ?auto_55579 ) ) ( not ( = ?auto_55578 ?auto_55580 ) ) ( not ( = ?auto_55578 ?auto_55581 ) ) ( not ( = ?auto_55578 ?auto_55582 ) ) ( not ( = ?auto_55579 ?auto_55580 ) ) ( not ( = ?auto_55579 ?auto_55581 ) ) ( not ( = ?auto_55579 ?auto_55582 ) ) ( not ( = ?auto_55580 ?auto_55581 ) ) ( not ( = ?auto_55580 ?auto_55582 ) ) ( not ( = ?auto_55581 ?auto_55582 ) ) ( ON ?auto_55582 ?auto_55584 ) ( not ( = ?auto_55578 ?auto_55584 ) ) ( not ( = ?auto_55579 ?auto_55584 ) ) ( not ( = ?auto_55580 ?auto_55584 ) ) ( not ( = ?auto_55581 ?auto_55584 ) ) ( not ( = ?auto_55582 ?auto_55584 ) ) ( ON ?auto_55581 ?auto_55582 ) ( CLEAR ?auto_55581 ) ( ON-TABLE ?auto_55583 ) ( ON ?auto_55584 ?auto_55583 ) ( not ( = ?auto_55583 ?auto_55584 ) ) ( not ( = ?auto_55583 ?auto_55582 ) ) ( not ( = ?auto_55583 ?auto_55581 ) ) ( not ( = ?auto_55578 ?auto_55583 ) ) ( not ( = ?auto_55579 ?auto_55583 ) ) ( not ( = ?auto_55580 ?auto_55583 ) ) ( HOLDING ?auto_55580 ) ( CLEAR ?auto_55579 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55578 ?auto_55579 ?auto_55580 )
      ( MAKE-5PILE ?auto_55578 ?auto_55579 ?auto_55580 ?auto_55581 ?auto_55582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55585 - BLOCK
      ?auto_55586 - BLOCK
      ?auto_55587 - BLOCK
      ?auto_55588 - BLOCK
      ?auto_55589 - BLOCK
    )
    :vars
    (
      ?auto_55590 - BLOCK
      ?auto_55591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55585 ) ( ON ?auto_55586 ?auto_55585 ) ( not ( = ?auto_55585 ?auto_55586 ) ) ( not ( = ?auto_55585 ?auto_55587 ) ) ( not ( = ?auto_55585 ?auto_55588 ) ) ( not ( = ?auto_55585 ?auto_55589 ) ) ( not ( = ?auto_55586 ?auto_55587 ) ) ( not ( = ?auto_55586 ?auto_55588 ) ) ( not ( = ?auto_55586 ?auto_55589 ) ) ( not ( = ?auto_55587 ?auto_55588 ) ) ( not ( = ?auto_55587 ?auto_55589 ) ) ( not ( = ?auto_55588 ?auto_55589 ) ) ( ON ?auto_55589 ?auto_55590 ) ( not ( = ?auto_55585 ?auto_55590 ) ) ( not ( = ?auto_55586 ?auto_55590 ) ) ( not ( = ?auto_55587 ?auto_55590 ) ) ( not ( = ?auto_55588 ?auto_55590 ) ) ( not ( = ?auto_55589 ?auto_55590 ) ) ( ON ?auto_55588 ?auto_55589 ) ( ON-TABLE ?auto_55591 ) ( ON ?auto_55590 ?auto_55591 ) ( not ( = ?auto_55591 ?auto_55590 ) ) ( not ( = ?auto_55591 ?auto_55589 ) ) ( not ( = ?auto_55591 ?auto_55588 ) ) ( not ( = ?auto_55585 ?auto_55591 ) ) ( not ( = ?auto_55586 ?auto_55591 ) ) ( not ( = ?auto_55587 ?auto_55591 ) ) ( CLEAR ?auto_55586 ) ( ON ?auto_55587 ?auto_55588 ) ( CLEAR ?auto_55587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55591 ?auto_55590 ?auto_55589 ?auto_55588 )
      ( MAKE-5PILE ?auto_55585 ?auto_55586 ?auto_55587 ?auto_55588 ?auto_55589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55592 - BLOCK
      ?auto_55593 - BLOCK
      ?auto_55594 - BLOCK
      ?auto_55595 - BLOCK
      ?auto_55596 - BLOCK
    )
    :vars
    (
      ?auto_55598 - BLOCK
      ?auto_55597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55592 ) ( not ( = ?auto_55592 ?auto_55593 ) ) ( not ( = ?auto_55592 ?auto_55594 ) ) ( not ( = ?auto_55592 ?auto_55595 ) ) ( not ( = ?auto_55592 ?auto_55596 ) ) ( not ( = ?auto_55593 ?auto_55594 ) ) ( not ( = ?auto_55593 ?auto_55595 ) ) ( not ( = ?auto_55593 ?auto_55596 ) ) ( not ( = ?auto_55594 ?auto_55595 ) ) ( not ( = ?auto_55594 ?auto_55596 ) ) ( not ( = ?auto_55595 ?auto_55596 ) ) ( ON ?auto_55596 ?auto_55598 ) ( not ( = ?auto_55592 ?auto_55598 ) ) ( not ( = ?auto_55593 ?auto_55598 ) ) ( not ( = ?auto_55594 ?auto_55598 ) ) ( not ( = ?auto_55595 ?auto_55598 ) ) ( not ( = ?auto_55596 ?auto_55598 ) ) ( ON ?auto_55595 ?auto_55596 ) ( ON-TABLE ?auto_55597 ) ( ON ?auto_55598 ?auto_55597 ) ( not ( = ?auto_55597 ?auto_55598 ) ) ( not ( = ?auto_55597 ?auto_55596 ) ) ( not ( = ?auto_55597 ?auto_55595 ) ) ( not ( = ?auto_55592 ?auto_55597 ) ) ( not ( = ?auto_55593 ?auto_55597 ) ) ( not ( = ?auto_55594 ?auto_55597 ) ) ( ON ?auto_55594 ?auto_55595 ) ( CLEAR ?auto_55594 ) ( HOLDING ?auto_55593 ) ( CLEAR ?auto_55592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55592 ?auto_55593 )
      ( MAKE-5PILE ?auto_55592 ?auto_55593 ?auto_55594 ?auto_55595 ?auto_55596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55599 - BLOCK
      ?auto_55600 - BLOCK
      ?auto_55601 - BLOCK
      ?auto_55602 - BLOCK
      ?auto_55603 - BLOCK
    )
    :vars
    (
      ?auto_55604 - BLOCK
      ?auto_55605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55599 ) ( not ( = ?auto_55599 ?auto_55600 ) ) ( not ( = ?auto_55599 ?auto_55601 ) ) ( not ( = ?auto_55599 ?auto_55602 ) ) ( not ( = ?auto_55599 ?auto_55603 ) ) ( not ( = ?auto_55600 ?auto_55601 ) ) ( not ( = ?auto_55600 ?auto_55602 ) ) ( not ( = ?auto_55600 ?auto_55603 ) ) ( not ( = ?auto_55601 ?auto_55602 ) ) ( not ( = ?auto_55601 ?auto_55603 ) ) ( not ( = ?auto_55602 ?auto_55603 ) ) ( ON ?auto_55603 ?auto_55604 ) ( not ( = ?auto_55599 ?auto_55604 ) ) ( not ( = ?auto_55600 ?auto_55604 ) ) ( not ( = ?auto_55601 ?auto_55604 ) ) ( not ( = ?auto_55602 ?auto_55604 ) ) ( not ( = ?auto_55603 ?auto_55604 ) ) ( ON ?auto_55602 ?auto_55603 ) ( ON-TABLE ?auto_55605 ) ( ON ?auto_55604 ?auto_55605 ) ( not ( = ?auto_55605 ?auto_55604 ) ) ( not ( = ?auto_55605 ?auto_55603 ) ) ( not ( = ?auto_55605 ?auto_55602 ) ) ( not ( = ?auto_55599 ?auto_55605 ) ) ( not ( = ?auto_55600 ?auto_55605 ) ) ( not ( = ?auto_55601 ?auto_55605 ) ) ( ON ?auto_55601 ?auto_55602 ) ( CLEAR ?auto_55599 ) ( ON ?auto_55600 ?auto_55601 ) ( CLEAR ?auto_55600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55605 ?auto_55604 ?auto_55603 ?auto_55602 ?auto_55601 )
      ( MAKE-5PILE ?auto_55599 ?auto_55600 ?auto_55601 ?auto_55602 ?auto_55603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55606 - BLOCK
      ?auto_55607 - BLOCK
      ?auto_55608 - BLOCK
      ?auto_55609 - BLOCK
      ?auto_55610 - BLOCK
    )
    :vars
    (
      ?auto_55611 - BLOCK
      ?auto_55612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55606 ?auto_55607 ) ) ( not ( = ?auto_55606 ?auto_55608 ) ) ( not ( = ?auto_55606 ?auto_55609 ) ) ( not ( = ?auto_55606 ?auto_55610 ) ) ( not ( = ?auto_55607 ?auto_55608 ) ) ( not ( = ?auto_55607 ?auto_55609 ) ) ( not ( = ?auto_55607 ?auto_55610 ) ) ( not ( = ?auto_55608 ?auto_55609 ) ) ( not ( = ?auto_55608 ?auto_55610 ) ) ( not ( = ?auto_55609 ?auto_55610 ) ) ( ON ?auto_55610 ?auto_55611 ) ( not ( = ?auto_55606 ?auto_55611 ) ) ( not ( = ?auto_55607 ?auto_55611 ) ) ( not ( = ?auto_55608 ?auto_55611 ) ) ( not ( = ?auto_55609 ?auto_55611 ) ) ( not ( = ?auto_55610 ?auto_55611 ) ) ( ON ?auto_55609 ?auto_55610 ) ( ON-TABLE ?auto_55612 ) ( ON ?auto_55611 ?auto_55612 ) ( not ( = ?auto_55612 ?auto_55611 ) ) ( not ( = ?auto_55612 ?auto_55610 ) ) ( not ( = ?auto_55612 ?auto_55609 ) ) ( not ( = ?auto_55606 ?auto_55612 ) ) ( not ( = ?auto_55607 ?auto_55612 ) ) ( not ( = ?auto_55608 ?auto_55612 ) ) ( ON ?auto_55608 ?auto_55609 ) ( ON ?auto_55607 ?auto_55608 ) ( CLEAR ?auto_55607 ) ( HOLDING ?auto_55606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55606 )
      ( MAKE-5PILE ?auto_55606 ?auto_55607 ?auto_55608 ?auto_55609 ?auto_55610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55613 - BLOCK
      ?auto_55614 - BLOCK
      ?auto_55615 - BLOCK
      ?auto_55616 - BLOCK
      ?auto_55617 - BLOCK
    )
    :vars
    (
      ?auto_55619 - BLOCK
      ?auto_55618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55613 ?auto_55614 ) ) ( not ( = ?auto_55613 ?auto_55615 ) ) ( not ( = ?auto_55613 ?auto_55616 ) ) ( not ( = ?auto_55613 ?auto_55617 ) ) ( not ( = ?auto_55614 ?auto_55615 ) ) ( not ( = ?auto_55614 ?auto_55616 ) ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( not ( = ?auto_55615 ?auto_55617 ) ) ( not ( = ?auto_55616 ?auto_55617 ) ) ( ON ?auto_55617 ?auto_55619 ) ( not ( = ?auto_55613 ?auto_55619 ) ) ( not ( = ?auto_55614 ?auto_55619 ) ) ( not ( = ?auto_55615 ?auto_55619 ) ) ( not ( = ?auto_55616 ?auto_55619 ) ) ( not ( = ?auto_55617 ?auto_55619 ) ) ( ON ?auto_55616 ?auto_55617 ) ( ON-TABLE ?auto_55618 ) ( ON ?auto_55619 ?auto_55618 ) ( not ( = ?auto_55618 ?auto_55619 ) ) ( not ( = ?auto_55618 ?auto_55617 ) ) ( not ( = ?auto_55618 ?auto_55616 ) ) ( not ( = ?auto_55613 ?auto_55618 ) ) ( not ( = ?auto_55614 ?auto_55618 ) ) ( not ( = ?auto_55615 ?auto_55618 ) ) ( ON ?auto_55615 ?auto_55616 ) ( ON ?auto_55614 ?auto_55615 ) ( ON ?auto_55613 ?auto_55614 ) ( CLEAR ?auto_55613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55618 ?auto_55619 ?auto_55617 ?auto_55616 ?auto_55615 ?auto_55614 )
      ( MAKE-5PILE ?auto_55613 ?auto_55614 ?auto_55615 ?auto_55616 ?auto_55617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55621 - BLOCK
    )
    :vars
    (
      ?auto_55622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55622 ?auto_55621 ) ( CLEAR ?auto_55622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55621 ) ( not ( = ?auto_55621 ?auto_55622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55622 ?auto_55621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55623 - BLOCK
    )
    :vars
    (
      ?auto_55624 - BLOCK
      ?auto_55625 - BLOCK
      ?auto_55626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55624 ?auto_55623 ) ( CLEAR ?auto_55624 ) ( ON-TABLE ?auto_55623 ) ( not ( = ?auto_55623 ?auto_55624 ) ) ( HOLDING ?auto_55625 ) ( CLEAR ?auto_55626 ) ( not ( = ?auto_55623 ?auto_55625 ) ) ( not ( = ?auto_55623 ?auto_55626 ) ) ( not ( = ?auto_55624 ?auto_55625 ) ) ( not ( = ?auto_55624 ?auto_55626 ) ) ( not ( = ?auto_55625 ?auto_55626 ) ) )
    :subtasks
    ( ( !STACK ?auto_55625 ?auto_55626 )
      ( MAKE-1PILE ?auto_55623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55627 - BLOCK
    )
    :vars
    (
      ?auto_55630 - BLOCK
      ?auto_55628 - BLOCK
      ?auto_55629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55630 ?auto_55627 ) ( ON-TABLE ?auto_55627 ) ( not ( = ?auto_55627 ?auto_55630 ) ) ( CLEAR ?auto_55628 ) ( not ( = ?auto_55627 ?auto_55629 ) ) ( not ( = ?auto_55627 ?auto_55628 ) ) ( not ( = ?auto_55630 ?auto_55629 ) ) ( not ( = ?auto_55630 ?auto_55628 ) ) ( not ( = ?auto_55629 ?auto_55628 ) ) ( ON ?auto_55629 ?auto_55630 ) ( CLEAR ?auto_55629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55627 ?auto_55630 )
      ( MAKE-1PILE ?auto_55627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55631 - BLOCK
    )
    :vars
    (
      ?auto_55633 - BLOCK
      ?auto_55634 - BLOCK
      ?auto_55632 - BLOCK
      ?auto_55636 - BLOCK
      ?auto_55635 - BLOCK
      ?auto_55637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55633 ?auto_55631 ) ( ON-TABLE ?auto_55631 ) ( not ( = ?auto_55631 ?auto_55633 ) ) ( not ( = ?auto_55631 ?auto_55634 ) ) ( not ( = ?auto_55631 ?auto_55632 ) ) ( not ( = ?auto_55633 ?auto_55634 ) ) ( not ( = ?auto_55633 ?auto_55632 ) ) ( not ( = ?auto_55634 ?auto_55632 ) ) ( ON ?auto_55634 ?auto_55633 ) ( CLEAR ?auto_55634 ) ( HOLDING ?auto_55632 ) ( CLEAR ?auto_55636 ) ( ON-TABLE ?auto_55635 ) ( ON ?auto_55637 ?auto_55635 ) ( ON ?auto_55636 ?auto_55637 ) ( not ( = ?auto_55635 ?auto_55637 ) ) ( not ( = ?auto_55635 ?auto_55636 ) ) ( not ( = ?auto_55635 ?auto_55632 ) ) ( not ( = ?auto_55637 ?auto_55636 ) ) ( not ( = ?auto_55637 ?auto_55632 ) ) ( not ( = ?auto_55636 ?auto_55632 ) ) ( not ( = ?auto_55631 ?auto_55636 ) ) ( not ( = ?auto_55631 ?auto_55635 ) ) ( not ( = ?auto_55631 ?auto_55637 ) ) ( not ( = ?auto_55633 ?auto_55636 ) ) ( not ( = ?auto_55633 ?auto_55635 ) ) ( not ( = ?auto_55633 ?auto_55637 ) ) ( not ( = ?auto_55634 ?auto_55636 ) ) ( not ( = ?auto_55634 ?auto_55635 ) ) ( not ( = ?auto_55634 ?auto_55637 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55635 ?auto_55637 ?auto_55636 ?auto_55632 )
      ( MAKE-1PILE ?auto_55631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55638 - BLOCK
    )
    :vars
    (
      ?auto_55641 - BLOCK
      ?auto_55642 - BLOCK
      ?auto_55640 - BLOCK
      ?auto_55639 - BLOCK
      ?auto_55643 - BLOCK
      ?auto_55644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55641 ?auto_55638 ) ( ON-TABLE ?auto_55638 ) ( not ( = ?auto_55638 ?auto_55641 ) ) ( not ( = ?auto_55638 ?auto_55642 ) ) ( not ( = ?auto_55638 ?auto_55640 ) ) ( not ( = ?auto_55641 ?auto_55642 ) ) ( not ( = ?auto_55641 ?auto_55640 ) ) ( not ( = ?auto_55642 ?auto_55640 ) ) ( ON ?auto_55642 ?auto_55641 ) ( CLEAR ?auto_55639 ) ( ON-TABLE ?auto_55643 ) ( ON ?auto_55644 ?auto_55643 ) ( ON ?auto_55639 ?auto_55644 ) ( not ( = ?auto_55643 ?auto_55644 ) ) ( not ( = ?auto_55643 ?auto_55639 ) ) ( not ( = ?auto_55643 ?auto_55640 ) ) ( not ( = ?auto_55644 ?auto_55639 ) ) ( not ( = ?auto_55644 ?auto_55640 ) ) ( not ( = ?auto_55639 ?auto_55640 ) ) ( not ( = ?auto_55638 ?auto_55639 ) ) ( not ( = ?auto_55638 ?auto_55643 ) ) ( not ( = ?auto_55638 ?auto_55644 ) ) ( not ( = ?auto_55641 ?auto_55639 ) ) ( not ( = ?auto_55641 ?auto_55643 ) ) ( not ( = ?auto_55641 ?auto_55644 ) ) ( not ( = ?auto_55642 ?auto_55639 ) ) ( not ( = ?auto_55642 ?auto_55643 ) ) ( not ( = ?auto_55642 ?auto_55644 ) ) ( ON ?auto_55640 ?auto_55642 ) ( CLEAR ?auto_55640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55638 ?auto_55641 ?auto_55642 )
      ( MAKE-1PILE ?auto_55638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55645 - BLOCK
    )
    :vars
    (
      ?auto_55648 - BLOCK
      ?auto_55647 - BLOCK
      ?auto_55650 - BLOCK
      ?auto_55646 - BLOCK
      ?auto_55649 - BLOCK
      ?auto_55651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55648 ?auto_55645 ) ( ON-TABLE ?auto_55645 ) ( not ( = ?auto_55645 ?auto_55648 ) ) ( not ( = ?auto_55645 ?auto_55647 ) ) ( not ( = ?auto_55645 ?auto_55650 ) ) ( not ( = ?auto_55648 ?auto_55647 ) ) ( not ( = ?auto_55648 ?auto_55650 ) ) ( not ( = ?auto_55647 ?auto_55650 ) ) ( ON ?auto_55647 ?auto_55648 ) ( ON-TABLE ?auto_55646 ) ( ON ?auto_55649 ?auto_55646 ) ( not ( = ?auto_55646 ?auto_55649 ) ) ( not ( = ?auto_55646 ?auto_55651 ) ) ( not ( = ?auto_55646 ?auto_55650 ) ) ( not ( = ?auto_55649 ?auto_55651 ) ) ( not ( = ?auto_55649 ?auto_55650 ) ) ( not ( = ?auto_55651 ?auto_55650 ) ) ( not ( = ?auto_55645 ?auto_55651 ) ) ( not ( = ?auto_55645 ?auto_55646 ) ) ( not ( = ?auto_55645 ?auto_55649 ) ) ( not ( = ?auto_55648 ?auto_55651 ) ) ( not ( = ?auto_55648 ?auto_55646 ) ) ( not ( = ?auto_55648 ?auto_55649 ) ) ( not ( = ?auto_55647 ?auto_55651 ) ) ( not ( = ?auto_55647 ?auto_55646 ) ) ( not ( = ?auto_55647 ?auto_55649 ) ) ( ON ?auto_55650 ?auto_55647 ) ( CLEAR ?auto_55650 ) ( HOLDING ?auto_55651 ) ( CLEAR ?auto_55649 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55646 ?auto_55649 ?auto_55651 )
      ( MAKE-1PILE ?auto_55645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55652 - BLOCK
    )
    :vars
    (
      ?auto_55658 - BLOCK
      ?auto_55655 - BLOCK
      ?auto_55657 - BLOCK
      ?auto_55653 - BLOCK
      ?auto_55656 - BLOCK
      ?auto_55654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55658 ?auto_55652 ) ( ON-TABLE ?auto_55652 ) ( not ( = ?auto_55652 ?auto_55658 ) ) ( not ( = ?auto_55652 ?auto_55655 ) ) ( not ( = ?auto_55652 ?auto_55657 ) ) ( not ( = ?auto_55658 ?auto_55655 ) ) ( not ( = ?auto_55658 ?auto_55657 ) ) ( not ( = ?auto_55655 ?auto_55657 ) ) ( ON ?auto_55655 ?auto_55658 ) ( ON-TABLE ?auto_55653 ) ( ON ?auto_55656 ?auto_55653 ) ( not ( = ?auto_55653 ?auto_55656 ) ) ( not ( = ?auto_55653 ?auto_55654 ) ) ( not ( = ?auto_55653 ?auto_55657 ) ) ( not ( = ?auto_55656 ?auto_55654 ) ) ( not ( = ?auto_55656 ?auto_55657 ) ) ( not ( = ?auto_55654 ?auto_55657 ) ) ( not ( = ?auto_55652 ?auto_55654 ) ) ( not ( = ?auto_55652 ?auto_55653 ) ) ( not ( = ?auto_55652 ?auto_55656 ) ) ( not ( = ?auto_55658 ?auto_55654 ) ) ( not ( = ?auto_55658 ?auto_55653 ) ) ( not ( = ?auto_55658 ?auto_55656 ) ) ( not ( = ?auto_55655 ?auto_55654 ) ) ( not ( = ?auto_55655 ?auto_55653 ) ) ( not ( = ?auto_55655 ?auto_55656 ) ) ( ON ?auto_55657 ?auto_55655 ) ( CLEAR ?auto_55656 ) ( ON ?auto_55654 ?auto_55657 ) ( CLEAR ?auto_55654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55652 ?auto_55658 ?auto_55655 ?auto_55657 )
      ( MAKE-1PILE ?auto_55652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55659 - BLOCK
    )
    :vars
    (
      ?auto_55665 - BLOCK
      ?auto_55662 - BLOCK
      ?auto_55661 - BLOCK
      ?auto_55663 - BLOCK
      ?auto_55660 - BLOCK
      ?auto_55664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55665 ?auto_55659 ) ( ON-TABLE ?auto_55659 ) ( not ( = ?auto_55659 ?auto_55665 ) ) ( not ( = ?auto_55659 ?auto_55662 ) ) ( not ( = ?auto_55659 ?auto_55661 ) ) ( not ( = ?auto_55665 ?auto_55662 ) ) ( not ( = ?auto_55665 ?auto_55661 ) ) ( not ( = ?auto_55662 ?auto_55661 ) ) ( ON ?auto_55662 ?auto_55665 ) ( ON-TABLE ?auto_55663 ) ( not ( = ?auto_55663 ?auto_55660 ) ) ( not ( = ?auto_55663 ?auto_55664 ) ) ( not ( = ?auto_55663 ?auto_55661 ) ) ( not ( = ?auto_55660 ?auto_55664 ) ) ( not ( = ?auto_55660 ?auto_55661 ) ) ( not ( = ?auto_55664 ?auto_55661 ) ) ( not ( = ?auto_55659 ?auto_55664 ) ) ( not ( = ?auto_55659 ?auto_55663 ) ) ( not ( = ?auto_55659 ?auto_55660 ) ) ( not ( = ?auto_55665 ?auto_55664 ) ) ( not ( = ?auto_55665 ?auto_55663 ) ) ( not ( = ?auto_55665 ?auto_55660 ) ) ( not ( = ?auto_55662 ?auto_55664 ) ) ( not ( = ?auto_55662 ?auto_55663 ) ) ( not ( = ?auto_55662 ?auto_55660 ) ) ( ON ?auto_55661 ?auto_55662 ) ( ON ?auto_55664 ?auto_55661 ) ( CLEAR ?auto_55664 ) ( HOLDING ?auto_55660 ) ( CLEAR ?auto_55663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55663 ?auto_55660 )
      ( MAKE-1PILE ?auto_55659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56512 - BLOCK
    )
    :vars
    (
      ?auto_56513 - BLOCK
      ?auto_56515 - BLOCK
      ?auto_56517 - BLOCK
      ?auto_56514 - BLOCK
      ?auto_56516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56513 ?auto_56512 ) ( ON-TABLE ?auto_56512 ) ( not ( = ?auto_56512 ?auto_56513 ) ) ( not ( = ?auto_56512 ?auto_56515 ) ) ( not ( = ?auto_56512 ?auto_56517 ) ) ( not ( = ?auto_56513 ?auto_56515 ) ) ( not ( = ?auto_56513 ?auto_56517 ) ) ( not ( = ?auto_56515 ?auto_56517 ) ) ( ON ?auto_56515 ?auto_56513 ) ( not ( = ?auto_56514 ?auto_56516 ) ) ( not ( = ?auto_56514 ?auto_56517 ) ) ( not ( = ?auto_56516 ?auto_56517 ) ) ( not ( = ?auto_56512 ?auto_56516 ) ) ( not ( = ?auto_56512 ?auto_56514 ) ) ( not ( = ?auto_56513 ?auto_56516 ) ) ( not ( = ?auto_56513 ?auto_56514 ) ) ( not ( = ?auto_56515 ?auto_56516 ) ) ( not ( = ?auto_56515 ?auto_56514 ) ) ( ON ?auto_56517 ?auto_56515 ) ( ON ?auto_56516 ?auto_56517 ) ( ON ?auto_56514 ?auto_56516 ) ( CLEAR ?auto_56514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56512 ?auto_56513 ?auto_56515 ?auto_56517 ?auto_56516 )
      ( MAKE-1PILE ?auto_56512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55673 - BLOCK
    )
    :vars
    (
      ?auto_55675 - BLOCK
      ?auto_55674 - BLOCK
      ?auto_55677 - BLOCK
      ?auto_55679 - BLOCK
      ?auto_55678 - BLOCK
      ?auto_55676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55675 ?auto_55673 ) ( ON-TABLE ?auto_55673 ) ( not ( = ?auto_55673 ?auto_55675 ) ) ( not ( = ?auto_55673 ?auto_55674 ) ) ( not ( = ?auto_55673 ?auto_55677 ) ) ( not ( = ?auto_55675 ?auto_55674 ) ) ( not ( = ?auto_55675 ?auto_55677 ) ) ( not ( = ?auto_55674 ?auto_55677 ) ) ( ON ?auto_55674 ?auto_55675 ) ( not ( = ?auto_55679 ?auto_55678 ) ) ( not ( = ?auto_55679 ?auto_55676 ) ) ( not ( = ?auto_55679 ?auto_55677 ) ) ( not ( = ?auto_55678 ?auto_55676 ) ) ( not ( = ?auto_55678 ?auto_55677 ) ) ( not ( = ?auto_55676 ?auto_55677 ) ) ( not ( = ?auto_55673 ?auto_55676 ) ) ( not ( = ?auto_55673 ?auto_55679 ) ) ( not ( = ?auto_55673 ?auto_55678 ) ) ( not ( = ?auto_55675 ?auto_55676 ) ) ( not ( = ?auto_55675 ?auto_55679 ) ) ( not ( = ?auto_55675 ?auto_55678 ) ) ( not ( = ?auto_55674 ?auto_55676 ) ) ( not ( = ?auto_55674 ?auto_55679 ) ) ( not ( = ?auto_55674 ?auto_55678 ) ) ( ON ?auto_55677 ?auto_55674 ) ( ON ?auto_55676 ?auto_55677 ) ( ON ?auto_55678 ?auto_55676 ) ( CLEAR ?auto_55678 ) ( HOLDING ?auto_55679 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55679 )
      ( MAKE-1PILE ?auto_55673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55680 - BLOCK
    )
    :vars
    (
      ?auto_55682 - BLOCK
      ?auto_55685 - BLOCK
      ?auto_55683 - BLOCK
      ?auto_55686 - BLOCK
      ?auto_55684 - BLOCK
      ?auto_55681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55682 ?auto_55680 ) ( ON-TABLE ?auto_55680 ) ( not ( = ?auto_55680 ?auto_55682 ) ) ( not ( = ?auto_55680 ?auto_55685 ) ) ( not ( = ?auto_55680 ?auto_55683 ) ) ( not ( = ?auto_55682 ?auto_55685 ) ) ( not ( = ?auto_55682 ?auto_55683 ) ) ( not ( = ?auto_55685 ?auto_55683 ) ) ( ON ?auto_55685 ?auto_55682 ) ( not ( = ?auto_55686 ?auto_55684 ) ) ( not ( = ?auto_55686 ?auto_55681 ) ) ( not ( = ?auto_55686 ?auto_55683 ) ) ( not ( = ?auto_55684 ?auto_55681 ) ) ( not ( = ?auto_55684 ?auto_55683 ) ) ( not ( = ?auto_55681 ?auto_55683 ) ) ( not ( = ?auto_55680 ?auto_55681 ) ) ( not ( = ?auto_55680 ?auto_55686 ) ) ( not ( = ?auto_55680 ?auto_55684 ) ) ( not ( = ?auto_55682 ?auto_55681 ) ) ( not ( = ?auto_55682 ?auto_55686 ) ) ( not ( = ?auto_55682 ?auto_55684 ) ) ( not ( = ?auto_55685 ?auto_55681 ) ) ( not ( = ?auto_55685 ?auto_55686 ) ) ( not ( = ?auto_55685 ?auto_55684 ) ) ( ON ?auto_55683 ?auto_55685 ) ( ON ?auto_55681 ?auto_55683 ) ( ON ?auto_55684 ?auto_55681 ) ( ON ?auto_55686 ?auto_55684 ) ( CLEAR ?auto_55686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55680 ?auto_55682 ?auto_55685 ?auto_55683 ?auto_55681 ?auto_55684 )
      ( MAKE-1PILE ?auto_55680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55693 - BLOCK
      ?auto_55694 - BLOCK
      ?auto_55695 - BLOCK
      ?auto_55696 - BLOCK
      ?auto_55697 - BLOCK
      ?auto_55698 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55698 ) ( CLEAR ?auto_55697 ) ( ON-TABLE ?auto_55693 ) ( ON ?auto_55694 ?auto_55693 ) ( ON ?auto_55695 ?auto_55694 ) ( ON ?auto_55696 ?auto_55695 ) ( ON ?auto_55697 ?auto_55696 ) ( not ( = ?auto_55693 ?auto_55694 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55696 ) ) ( not ( = ?auto_55693 ?auto_55697 ) ) ( not ( = ?auto_55693 ?auto_55698 ) ) ( not ( = ?auto_55694 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55696 ) ) ( not ( = ?auto_55694 ?auto_55697 ) ) ( not ( = ?auto_55694 ?auto_55698 ) ) ( not ( = ?auto_55695 ?auto_55696 ) ) ( not ( = ?auto_55695 ?auto_55697 ) ) ( not ( = ?auto_55695 ?auto_55698 ) ) ( not ( = ?auto_55696 ?auto_55697 ) ) ( not ( = ?auto_55696 ?auto_55698 ) ) ( not ( = ?auto_55697 ?auto_55698 ) ) )
    :subtasks
    ( ( !STACK ?auto_55698 ?auto_55697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55699 - BLOCK
      ?auto_55700 - BLOCK
      ?auto_55701 - BLOCK
      ?auto_55702 - BLOCK
      ?auto_55703 - BLOCK
      ?auto_55704 - BLOCK
    )
    :vars
    (
      ?auto_55705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55703 ) ( ON-TABLE ?auto_55699 ) ( ON ?auto_55700 ?auto_55699 ) ( ON ?auto_55701 ?auto_55700 ) ( ON ?auto_55702 ?auto_55701 ) ( ON ?auto_55703 ?auto_55702 ) ( not ( = ?auto_55699 ?auto_55700 ) ) ( not ( = ?auto_55699 ?auto_55701 ) ) ( not ( = ?auto_55699 ?auto_55702 ) ) ( not ( = ?auto_55699 ?auto_55703 ) ) ( not ( = ?auto_55699 ?auto_55704 ) ) ( not ( = ?auto_55700 ?auto_55701 ) ) ( not ( = ?auto_55700 ?auto_55702 ) ) ( not ( = ?auto_55700 ?auto_55703 ) ) ( not ( = ?auto_55700 ?auto_55704 ) ) ( not ( = ?auto_55701 ?auto_55702 ) ) ( not ( = ?auto_55701 ?auto_55703 ) ) ( not ( = ?auto_55701 ?auto_55704 ) ) ( not ( = ?auto_55702 ?auto_55703 ) ) ( not ( = ?auto_55702 ?auto_55704 ) ) ( not ( = ?auto_55703 ?auto_55704 ) ) ( ON ?auto_55704 ?auto_55705 ) ( CLEAR ?auto_55704 ) ( HAND-EMPTY ) ( not ( = ?auto_55699 ?auto_55705 ) ) ( not ( = ?auto_55700 ?auto_55705 ) ) ( not ( = ?auto_55701 ?auto_55705 ) ) ( not ( = ?auto_55702 ?auto_55705 ) ) ( not ( = ?auto_55703 ?auto_55705 ) ) ( not ( = ?auto_55704 ?auto_55705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55704 ?auto_55705 )
      ( MAKE-6PILE ?auto_55699 ?auto_55700 ?auto_55701 ?auto_55702 ?auto_55703 ?auto_55704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55706 - BLOCK
      ?auto_55707 - BLOCK
      ?auto_55708 - BLOCK
      ?auto_55709 - BLOCK
      ?auto_55710 - BLOCK
      ?auto_55711 - BLOCK
    )
    :vars
    (
      ?auto_55712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55706 ) ( ON ?auto_55707 ?auto_55706 ) ( ON ?auto_55708 ?auto_55707 ) ( ON ?auto_55709 ?auto_55708 ) ( not ( = ?auto_55706 ?auto_55707 ) ) ( not ( = ?auto_55706 ?auto_55708 ) ) ( not ( = ?auto_55706 ?auto_55709 ) ) ( not ( = ?auto_55706 ?auto_55710 ) ) ( not ( = ?auto_55706 ?auto_55711 ) ) ( not ( = ?auto_55707 ?auto_55708 ) ) ( not ( = ?auto_55707 ?auto_55709 ) ) ( not ( = ?auto_55707 ?auto_55710 ) ) ( not ( = ?auto_55707 ?auto_55711 ) ) ( not ( = ?auto_55708 ?auto_55709 ) ) ( not ( = ?auto_55708 ?auto_55710 ) ) ( not ( = ?auto_55708 ?auto_55711 ) ) ( not ( = ?auto_55709 ?auto_55710 ) ) ( not ( = ?auto_55709 ?auto_55711 ) ) ( not ( = ?auto_55710 ?auto_55711 ) ) ( ON ?auto_55711 ?auto_55712 ) ( CLEAR ?auto_55711 ) ( not ( = ?auto_55706 ?auto_55712 ) ) ( not ( = ?auto_55707 ?auto_55712 ) ) ( not ( = ?auto_55708 ?auto_55712 ) ) ( not ( = ?auto_55709 ?auto_55712 ) ) ( not ( = ?auto_55710 ?auto_55712 ) ) ( not ( = ?auto_55711 ?auto_55712 ) ) ( HOLDING ?auto_55710 ) ( CLEAR ?auto_55709 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55706 ?auto_55707 ?auto_55708 ?auto_55709 ?auto_55710 )
      ( MAKE-6PILE ?auto_55706 ?auto_55707 ?auto_55708 ?auto_55709 ?auto_55710 ?auto_55711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55713 - BLOCK
      ?auto_55714 - BLOCK
      ?auto_55715 - BLOCK
      ?auto_55716 - BLOCK
      ?auto_55717 - BLOCK
      ?auto_55718 - BLOCK
    )
    :vars
    (
      ?auto_55719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55713 ) ( ON ?auto_55714 ?auto_55713 ) ( ON ?auto_55715 ?auto_55714 ) ( ON ?auto_55716 ?auto_55715 ) ( not ( = ?auto_55713 ?auto_55714 ) ) ( not ( = ?auto_55713 ?auto_55715 ) ) ( not ( = ?auto_55713 ?auto_55716 ) ) ( not ( = ?auto_55713 ?auto_55717 ) ) ( not ( = ?auto_55713 ?auto_55718 ) ) ( not ( = ?auto_55714 ?auto_55715 ) ) ( not ( = ?auto_55714 ?auto_55716 ) ) ( not ( = ?auto_55714 ?auto_55717 ) ) ( not ( = ?auto_55714 ?auto_55718 ) ) ( not ( = ?auto_55715 ?auto_55716 ) ) ( not ( = ?auto_55715 ?auto_55717 ) ) ( not ( = ?auto_55715 ?auto_55718 ) ) ( not ( = ?auto_55716 ?auto_55717 ) ) ( not ( = ?auto_55716 ?auto_55718 ) ) ( not ( = ?auto_55717 ?auto_55718 ) ) ( ON ?auto_55718 ?auto_55719 ) ( not ( = ?auto_55713 ?auto_55719 ) ) ( not ( = ?auto_55714 ?auto_55719 ) ) ( not ( = ?auto_55715 ?auto_55719 ) ) ( not ( = ?auto_55716 ?auto_55719 ) ) ( not ( = ?auto_55717 ?auto_55719 ) ) ( not ( = ?auto_55718 ?auto_55719 ) ) ( CLEAR ?auto_55716 ) ( ON ?auto_55717 ?auto_55718 ) ( CLEAR ?auto_55717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55719 ?auto_55718 )
      ( MAKE-6PILE ?auto_55713 ?auto_55714 ?auto_55715 ?auto_55716 ?auto_55717 ?auto_55718 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55720 - BLOCK
      ?auto_55721 - BLOCK
      ?auto_55722 - BLOCK
      ?auto_55723 - BLOCK
      ?auto_55724 - BLOCK
      ?auto_55725 - BLOCK
    )
    :vars
    (
      ?auto_55726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55720 ) ( ON ?auto_55721 ?auto_55720 ) ( ON ?auto_55722 ?auto_55721 ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( not ( = ?auto_55720 ?auto_55722 ) ) ( not ( = ?auto_55720 ?auto_55723 ) ) ( not ( = ?auto_55720 ?auto_55724 ) ) ( not ( = ?auto_55720 ?auto_55725 ) ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55723 ) ) ( not ( = ?auto_55721 ?auto_55724 ) ) ( not ( = ?auto_55721 ?auto_55725 ) ) ( not ( = ?auto_55722 ?auto_55723 ) ) ( not ( = ?auto_55722 ?auto_55724 ) ) ( not ( = ?auto_55722 ?auto_55725 ) ) ( not ( = ?auto_55723 ?auto_55724 ) ) ( not ( = ?auto_55723 ?auto_55725 ) ) ( not ( = ?auto_55724 ?auto_55725 ) ) ( ON ?auto_55725 ?auto_55726 ) ( not ( = ?auto_55720 ?auto_55726 ) ) ( not ( = ?auto_55721 ?auto_55726 ) ) ( not ( = ?auto_55722 ?auto_55726 ) ) ( not ( = ?auto_55723 ?auto_55726 ) ) ( not ( = ?auto_55724 ?auto_55726 ) ) ( not ( = ?auto_55725 ?auto_55726 ) ) ( ON ?auto_55724 ?auto_55725 ) ( CLEAR ?auto_55724 ) ( ON-TABLE ?auto_55726 ) ( HOLDING ?auto_55723 ) ( CLEAR ?auto_55722 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55720 ?auto_55721 ?auto_55722 ?auto_55723 )
      ( MAKE-6PILE ?auto_55720 ?auto_55721 ?auto_55722 ?auto_55723 ?auto_55724 ?auto_55725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55727 - BLOCK
      ?auto_55728 - BLOCK
      ?auto_55729 - BLOCK
      ?auto_55730 - BLOCK
      ?auto_55731 - BLOCK
      ?auto_55732 - BLOCK
    )
    :vars
    (
      ?auto_55733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55727 ) ( ON ?auto_55728 ?auto_55727 ) ( ON ?auto_55729 ?auto_55728 ) ( not ( = ?auto_55727 ?auto_55728 ) ) ( not ( = ?auto_55727 ?auto_55729 ) ) ( not ( = ?auto_55727 ?auto_55730 ) ) ( not ( = ?auto_55727 ?auto_55731 ) ) ( not ( = ?auto_55727 ?auto_55732 ) ) ( not ( = ?auto_55728 ?auto_55729 ) ) ( not ( = ?auto_55728 ?auto_55730 ) ) ( not ( = ?auto_55728 ?auto_55731 ) ) ( not ( = ?auto_55728 ?auto_55732 ) ) ( not ( = ?auto_55729 ?auto_55730 ) ) ( not ( = ?auto_55729 ?auto_55731 ) ) ( not ( = ?auto_55729 ?auto_55732 ) ) ( not ( = ?auto_55730 ?auto_55731 ) ) ( not ( = ?auto_55730 ?auto_55732 ) ) ( not ( = ?auto_55731 ?auto_55732 ) ) ( ON ?auto_55732 ?auto_55733 ) ( not ( = ?auto_55727 ?auto_55733 ) ) ( not ( = ?auto_55728 ?auto_55733 ) ) ( not ( = ?auto_55729 ?auto_55733 ) ) ( not ( = ?auto_55730 ?auto_55733 ) ) ( not ( = ?auto_55731 ?auto_55733 ) ) ( not ( = ?auto_55732 ?auto_55733 ) ) ( ON ?auto_55731 ?auto_55732 ) ( ON-TABLE ?auto_55733 ) ( CLEAR ?auto_55729 ) ( ON ?auto_55730 ?auto_55731 ) ( CLEAR ?auto_55730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55733 ?auto_55732 ?auto_55731 )
      ( MAKE-6PILE ?auto_55727 ?auto_55728 ?auto_55729 ?auto_55730 ?auto_55731 ?auto_55732 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55734 - BLOCK
      ?auto_55735 - BLOCK
      ?auto_55736 - BLOCK
      ?auto_55737 - BLOCK
      ?auto_55738 - BLOCK
      ?auto_55739 - BLOCK
    )
    :vars
    (
      ?auto_55740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55734 ) ( ON ?auto_55735 ?auto_55734 ) ( not ( = ?auto_55734 ?auto_55735 ) ) ( not ( = ?auto_55734 ?auto_55736 ) ) ( not ( = ?auto_55734 ?auto_55737 ) ) ( not ( = ?auto_55734 ?auto_55738 ) ) ( not ( = ?auto_55734 ?auto_55739 ) ) ( not ( = ?auto_55735 ?auto_55736 ) ) ( not ( = ?auto_55735 ?auto_55737 ) ) ( not ( = ?auto_55735 ?auto_55738 ) ) ( not ( = ?auto_55735 ?auto_55739 ) ) ( not ( = ?auto_55736 ?auto_55737 ) ) ( not ( = ?auto_55736 ?auto_55738 ) ) ( not ( = ?auto_55736 ?auto_55739 ) ) ( not ( = ?auto_55737 ?auto_55738 ) ) ( not ( = ?auto_55737 ?auto_55739 ) ) ( not ( = ?auto_55738 ?auto_55739 ) ) ( ON ?auto_55739 ?auto_55740 ) ( not ( = ?auto_55734 ?auto_55740 ) ) ( not ( = ?auto_55735 ?auto_55740 ) ) ( not ( = ?auto_55736 ?auto_55740 ) ) ( not ( = ?auto_55737 ?auto_55740 ) ) ( not ( = ?auto_55738 ?auto_55740 ) ) ( not ( = ?auto_55739 ?auto_55740 ) ) ( ON ?auto_55738 ?auto_55739 ) ( ON-TABLE ?auto_55740 ) ( ON ?auto_55737 ?auto_55738 ) ( CLEAR ?auto_55737 ) ( HOLDING ?auto_55736 ) ( CLEAR ?auto_55735 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55734 ?auto_55735 ?auto_55736 )
      ( MAKE-6PILE ?auto_55734 ?auto_55735 ?auto_55736 ?auto_55737 ?auto_55738 ?auto_55739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55741 - BLOCK
      ?auto_55742 - BLOCK
      ?auto_55743 - BLOCK
      ?auto_55744 - BLOCK
      ?auto_55745 - BLOCK
      ?auto_55746 - BLOCK
    )
    :vars
    (
      ?auto_55747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55741 ) ( ON ?auto_55742 ?auto_55741 ) ( not ( = ?auto_55741 ?auto_55742 ) ) ( not ( = ?auto_55741 ?auto_55743 ) ) ( not ( = ?auto_55741 ?auto_55744 ) ) ( not ( = ?auto_55741 ?auto_55745 ) ) ( not ( = ?auto_55741 ?auto_55746 ) ) ( not ( = ?auto_55742 ?auto_55743 ) ) ( not ( = ?auto_55742 ?auto_55744 ) ) ( not ( = ?auto_55742 ?auto_55745 ) ) ( not ( = ?auto_55742 ?auto_55746 ) ) ( not ( = ?auto_55743 ?auto_55744 ) ) ( not ( = ?auto_55743 ?auto_55745 ) ) ( not ( = ?auto_55743 ?auto_55746 ) ) ( not ( = ?auto_55744 ?auto_55745 ) ) ( not ( = ?auto_55744 ?auto_55746 ) ) ( not ( = ?auto_55745 ?auto_55746 ) ) ( ON ?auto_55746 ?auto_55747 ) ( not ( = ?auto_55741 ?auto_55747 ) ) ( not ( = ?auto_55742 ?auto_55747 ) ) ( not ( = ?auto_55743 ?auto_55747 ) ) ( not ( = ?auto_55744 ?auto_55747 ) ) ( not ( = ?auto_55745 ?auto_55747 ) ) ( not ( = ?auto_55746 ?auto_55747 ) ) ( ON ?auto_55745 ?auto_55746 ) ( ON-TABLE ?auto_55747 ) ( ON ?auto_55744 ?auto_55745 ) ( CLEAR ?auto_55742 ) ( ON ?auto_55743 ?auto_55744 ) ( CLEAR ?auto_55743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55747 ?auto_55746 ?auto_55745 ?auto_55744 )
      ( MAKE-6PILE ?auto_55741 ?auto_55742 ?auto_55743 ?auto_55744 ?auto_55745 ?auto_55746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55748 - BLOCK
      ?auto_55749 - BLOCK
      ?auto_55750 - BLOCK
      ?auto_55751 - BLOCK
      ?auto_55752 - BLOCK
      ?auto_55753 - BLOCK
    )
    :vars
    (
      ?auto_55754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55748 ) ( not ( = ?auto_55748 ?auto_55749 ) ) ( not ( = ?auto_55748 ?auto_55750 ) ) ( not ( = ?auto_55748 ?auto_55751 ) ) ( not ( = ?auto_55748 ?auto_55752 ) ) ( not ( = ?auto_55748 ?auto_55753 ) ) ( not ( = ?auto_55749 ?auto_55750 ) ) ( not ( = ?auto_55749 ?auto_55751 ) ) ( not ( = ?auto_55749 ?auto_55752 ) ) ( not ( = ?auto_55749 ?auto_55753 ) ) ( not ( = ?auto_55750 ?auto_55751 ) ) ( not ( = ?auto_55750 ?auto_55752 ) ) ( not ( = ?auto_55750 ?auto_55753 ) ) ( not ( = ?auto_55751 ?auto_55752 ) ) ( not ( = ?auto_55751 ?auto_55753 ) ) ( not ( = ?auto_55752 ?auto_55753 ) ) ( ON ?auto_55753 ?auto_55754 ) ( not ( = ?auto_55748 ?auto_55754 ) ) ( not ( = ?auto_55749 ?auto_55754 ) ) ( not ( = ?auto_55750 ?auto_55754 ) ) ( not ( = ?auto_55751 ?auto_55754 ) ) ( not ( = ?auto_55752 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( ON ?auto_55752 ?auto_55753 ) ( ON-TABLE ?auto_55754 ) ( ON ?auto_55751 ?auto_55752 ) ( ON ?auto_55750 ?auto_55751 ) ( CLEAR ?auto_55750 ) ( HOLDING ?auto_55749 ) ( CLEAR ?auto_55748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55748 ?auto_55749 )
      ( MAKE-6PILE ?auto_55748 ?auto_55749 ?auto_55750 ?auto_55751 ?auto_55752 ?auto_55753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55755 - BLOCK
      ?auto_55756 - BLOCK
      ?auto_55757 - BLOCK
      ?auto_55758 - BLOCK
      ?auto_55759 - BLOCK
      ?auto_55760 - BLOCK
    )
    :vars
    (
      ?auto_55761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55755 ) ( not ( = ?auto_55755 ?auto_55756 ) ) ( not ( = ?auto_55755 ?auto_55757 ) ) ( not ( = ?auto_55755 ?auto_55758 ) ) ( not ( = ?auto_55755 ?auto_55759 ) ) ( not ( = ?auto_55755 ?auto_55760 ) ) ( not ( = ?auto_55756 ?auto_55757 ) ) ( not ( = ?auto_55756 ?auto_55758 ) ) ( not ( = ?auto_55756 ?auto_55759 ) ) ( not ( = ?auto_55756 ?auto_55760 ) ) ( not ( = ?auto_55757 ?auto_55758 ) ) ( not ( = ?auto_55757 ?auto_55759 ) ) ( not ( = ?auto_55757 ?auto_55760 ) ) ( not ( = ?auto_55758 ?auto_55759 ) ) ( not ( = ?auto_55758 ?auto_55760 ) ) ( not ( = ?auto_55759 ?auto_55760 ) ) ( ON ?auto_55760 ?auto_55761 ) ( not ( = ?auto_55755 ?auto_55761 ) ) ( not ( = ?auto_55756 ?auto_55761 ) ) ( not ( = ?auto_55757 ?auto_55761 ) ) ( not ( = ?auto_55758 ?auto_55761 ) ) ( not ( = ?auto_55759 ?auto_55761 ) ) ( not ( = ?auto_55760 ?auto_55761 ) ) ( ON ?auto_55759 ?auto_55760 ) ( ON-TABLE ?auto_55761 ) ( ON ?auto_55758 ?auto_55759 ) ( ON ?auto_55757 ?auto_55758 ) ( CLEAR ?auto_55755 ) ( ON ?auto_55756 ?auto_55757 ) ( CLEAR ?auto_55756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55761 ?auto_55760 ?auto_55759 ?auto_55758 ?auto_55757 )
      ( MAKE-6PILE ?auto_55755 ?auto_55756 ?auto_55757 ?auto_55758 ?auto_55759 ?auto_55760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55762 - BLOCK
      ?auto_55763 - BLOCK
      ?auto_55764 - BLOCK
      ?auto_55765 - BLOCK
      ?auto_55766 - BLOCK
      ?auto_55767 - BLOCK
    )
    :vars
    (
      ?auto_55768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55762 ?auto_55763 ) ) ( not ( = ?auto_55762 ?auto_55764 ) ) ( not ( = ?auto_55762 ?auto_55765 ) ) ( not ( = ?auto_55762 ?auto_55766 ) ) ( not ( = ?auto_55762 ?auto_55767 ) ) ( not ( = ?auto_55763 ?auto_55764 ) ) ( not ( = ?auto_55763 ?auto_55765 ) ) ( not ( = ?auto_55763 ?auto_55766 ) ) ( not ( = ?auto_55763 ?auto_55767 ) ) ( not ( = ?auto_55764 ?auto_55765 ) ) ( not ( = ?auto_55764 ?auto_55766 ) ) ( not ( = ?auto_55764 ?auto_55767 ) ) ( not ( = ?auto_55765 ?auto_55766 ) ) ( not ( = ?auto_55765 ?auto_55767 ) ) ( not ( = ?auto_55766 ?auto_55767 ) ) ( ON ?auto_55767 ?auto_55768 ) ( not ( = ?auto_55762 ?auto_55768 ) ) ( not ( = ?auto_55763 ?auto_55768 ) ) ( not ( = ?auto_55764 ?auto_55768 ) ) ( not ( = ?auto_55765 ?auto_55768 ) ) ( not ( = ?auto_55766 ?auto_55768 ) ) ( not ( = ?auto_55767 ?auto_55768 ) ) ( ON ?auto_55766 ?auto_55767 ) ( ON-TABLE ?auto_55768 ) ( ON ?auto_55765 ?auto_55766 ) ( ON ?auto_55764 ?auto_55765 ) ( ON ?auto_55763 ?auto_55764 ) ( CLEAR ?auto_55763 ) ( HOLDING ?auto_55762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55762 )
      ( MAKE-6PILE ?auto_55762 ?auto_55763 ?auto_55764 ?auto_55765 ?auto_55766 ?auto_55767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55769 - BLOCK
      ?auto_55770 - BLOCK
      ?auto_55771 - BLOCK
      ?auto_55772 - BLOCK
      ?auto_55773 - BLOCK
      ?auto_55774 - BLOCK
    )
    :vars
    (
      ?auto_55775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55769 ?auto_55770 ) ) ( not ( = ?auto_55769 ?auto_55771 ) ) ( not ( = ?auto_55769 ?auto_55772 ) ) ( not ( = ?auto_55769 ?auto_55773 ) ) ( not ( = ?auto_55769 ?auto_55774 ) ) ( not ( = ?auto_55770 ?auto_55771 ) ) ( not ( = ?auto_55770 ?auto_55772 ) ) ( not ( = ?auto_55770 ?auto_55773 ) ) ( not ( = ?auto_55770 ?auto_55774 ) ) ( not ( = ?auto_55771 ?auto_55772 ) ) ( not ( = ?auto_55771 ?auto_55773 ) ) ( not ( = ?auto_55771 ?auto_55774 ) ) ( not ( = ?auto_55772 ?auto_55773 ) ) ( not ( = ?auto_55772 ?auto_55774 ) ) ( not ( = ?auto_55773 ?auto_55774 ) ) ( ON ?auto_55774 ?auto_55775 ) ( not ( = ?auto_55769 ?auto_55775 ) ) ( not ( = ?auto_55770 ?auto_55775 ) ) ( not ( = ?auto_55771 ?auto_55775 ) ) ( not ( = ?auto_55772 ?auto_55775 ) ) ( not ( = ?auto_55773 ?auto_55775 ) ) ( not ( = ?auto_55774 ?auto_55775 ) ) ( ON ?auto_55773 ?auto_55774 ) ( ON-TABLE ?auto_55775 ) ( ON ?auto_55772 ?auto_55773 ) ( ON ?auto_55771 ?auto_55772 ) ( ON ?auto_55770 ?auto_55771 ) ( ON ?auto_55769 ?auto_55770 ) ( CLEAR ?auto_55769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55775 ?auto_55774 ?auto_55773 ?auto_55772 ?auto_55771 ?auto_55770 )
      ( MAKE-6PILE ?auto_55769 ?auto_55770 ?auto_55771 ?auto_55772 ?auto_55773 ?auto_55774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55856 - BLOCK
    )
    :vars
    (
      ?auto_55857 - BLOCK
      ?auto_55858 - BLOCK
      ?auto_55859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55856 ?auto_55857 ) ( CLEAR ?auto_55856 ) ( not ( = ?auto_55856 ?auto_55857 ) ) ( HOLDING ?auto_55858 ) ( CLEAR ?auto_55859 ) ( not ( = ?auto_55856 ?auto_55858 ) ) ( not ( = ?auto_55856 ?auto_55859 ) ) ( not ( = ?auto_55857 ?auto_55858 ) ) ( not ( = ?auto_55857 ?auto_55859 ) ) ( not ( = ?auto_55858 ?auto_55859 ) ) )
    :subtasks
    ( ( !STACK ?auto_55858 ?auto_55859 )
      ( MAKE-1PILE ?auto_55856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55860 - BLOCK
    )
    :vars
    (
      ?auto_55863 - BLOCK
      ?auto_55861 - BLOCK
      ?auto_55862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55860 ?auto_55863 ) ( not ( = ?auto_55860 ?auto_55863 ) ) ( CLEAR ?auto_55861 ) ( not ( = ?auto_55860 ?auto_55862 ) ) ( not ( = ?auto_55860 ?auto_55861 ) ) ( not ( = ?auto_55863 ?auto_55862 ) ) ( not ( = ?auto_55863 ?auto_55861 ) ) ( not ( = ?auto_55862 ?auto_55861 ) ) ( ON ?auto_55862 ?auto_55860 ) ( CLEAR ?auto_55862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55863 ?auto_55860 )
      ( MAKE-1PILE ?auto_55860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55864 - BLOCK
    )
    :vars
    (
      ?auto_55866 - BLOCK
      ?auto_55867 - BLOCK
      ?auto_55865 - BLOCK
      ?auto_55869 - BLOCK
      ?auto_55868 - BLOCK
      ?auto_55870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55864 ?auto_55866 ) ( not ( = ?auto_55864 ?auto_55866 ) ) ( not ( = ?auto_55864 ?auto_55867 ) ) ( not ( = ?auto_55864 ?auto_55865 ) ) ( not ( = ?auto_55866 ?auto_55867 ) ) ( not ( = ?auto_55866 ?auto_55865 ) ) ( not ( = ?auto_55867 ?auto_55865 ) ) ( ON ?auto_55867 ?auto_55864 ) ( CLEAR ?auto_55867 ) ( ON-TABLE ?auto_55866 ) ( HOLDING ?auto_55865 ) ( CLEAR ?auto_55869 ) ( ON-TABLE ?auto_55868 ) ( ON ?auto_55870 ?auto_55868 ) ( ON ?auto_55869 ?auto_55870 ) ( not ( = ?auto_55868 ?auto_55870 ) ) ( not ( = ?auto_55868 ?auto_55869 ) ) ( not ( = ?auto_55868 ?auto_55865 ) ) ( not ( = ?auto_55870 ?auto_55869 ) ) ( not ( = ?auto_55870 ?auto_55865 ) ) ( not ( = ?auto_55869 ?auto_55865 ) ) ( not ( = ?auto_55864 ?auto_55869 ) ) ( not ( = ?auto_55864 ?auto_55868 ) ) ( not ( = ?auto_55864 ?auto_55870 ) ) ( not ( = ?auto_55866 ?auto_55869 ) ) ( not ( = ?auto_55866 ?auto_55868 ) ) ( not ( = ?auto_55866 ?auto_55870 ) ) ( not ( = ?auto_55867 ?auto_55869 ) ) ( not ( = ?auto_55867 ?auto_55868 ) ) ( not ( = ?auto_55867 ?auto_55870 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55868 ?auto_55870 ?auto_55869 ?auto_55865 )
      ( MAKE-1PILE ?auto_55864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55871 - BLOCK
    )
    :vars
    (
      ?auto_55872 - BLOCK
      ?auto_55877 - BLOCK
      ?auto_55874 - BLOCK
      ?auto_55875 - BLOCK
      ?auto_55876 - BLOCK
      ?auto_55873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55871 ?auto_55872 ) ( not ( = ?auto_55871 ?auto_55872 ) ) ( not ( = ?auto_55871 ?auto_55877 ) ) ( not ( = ?auto_55871 ?auto_55874 ) ) ( not ( = ?auto_55872 ?auto_55877 ) ) ( not ( = ?auto_55872 ?auto_55874 ) ) ( not ( = ?auto_55877 ?auto_55874 ) ) ( ON ?auto_55877 ?auto_55871 ) ( ON-TABLE ?auto_55872 ) ( CLEAR ?auto_55875 ) ( ON-TABLE ?auto_55876 ) ( ON ?auto_55873 ?auto_55876 ) ( ON ?auto_55875 ?auto_55873 ) ( not ( = ?auto_55876 ?auto_55873 ) ) ( not ( = ?auto_55876 ?auto_55875 ) ) ( not ( = ?auto_55876 ?auto_55874 ) ) ( not ( = ?auto_55873 ?auto_55875 ) ) ( not ( = ?auto_55873 ?auto_55874 ) ) ( not ( = ?auto_55875 ?auto_55874 ) ) ( not ( = ?auto_55871 ?auto_55875 ) ) ( not ( = ?auto_55871 ?auto_55876 ) ) ( not ( = ?auto_55871 ?auto_55873 ) ) ( not ( = ?auto_55872 ?auto_55875 ) ) ( not ( = ?auto_55872 ?auto_55876 ) ) ( not ( = ?auto_55872 ?auto_55873 ) ) ( not ( = ?auto_55877 ?auto_55875 ) ) ( not ( = ?auto_55877 ?auto_55876 ) ) ( not ( = ?auto_55877 ?auto_55873 ) ) ( ON ?auto_55874 ?auto_55877 ) ( CLEAR ?auto_55874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55872 ?auto_55871 ?auto_55877 )
      ( MAKE-1PILE ?auto_55871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55878 - BLOCK
    )
    :vars
    (
      ?auto_55884 - BLOCK
      ?auto_55879 - BLOCK
      ?auto_55882 - BLOCK
      ?auto_55883 - BLOCK
      ?auto_55880 - BLOCK
      ?auto_55881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55878 ?auto_55884 ) ( not ( = ?auto_55878 ?auto_55884 ) ) ( not ( = ?auto_55878 ?auto_55879 ) ) ( not ( = ?auto_55878 ?auto_55882 ) ) ( not ( = ?auto_55884 ?auto_55879 ) ) ( not ( = ?auto_55884 ?auto_55882 ) ) ( not ( = ?auto_55879 ?auto_55882 ) ) ( ON ?auto_55879 ?auto_55878 ) ( ON-TABLE ?auto_55884 ) ( ON-TABLE ?auto_55883 ) ( ON ?auto_55880 ?auto_55883 ) ( not ( = ?auto_55883 ?auto_55880 ) ) ( not ( = ?auto_55883 ?auto_55881 ) ) ( not ( = ?auto_55883 ?auto_55882 ) ) ( not ( = ?auto_55880 ?auto_55881 ) ) ( not ( = ?auto_55880 ?auto_55882 ) ) ( not ( = ?auto_55881 ?auto_55882 ) ) ( not ( = ?auto_55878 ?auto_55881 ) ) ( not ( = ?auto_55878 ?auto_55883 ) ) ( not ( = ?auto_55878 ?auto_55880 ) ) ( not ( = ?auto_55884 ?auto_55881 ) ) ( not ( = ?auto_55884 ?auto_55883 ) ) ( not ( = ?auto_55884 ?auto_55880 ) ) ( not ( = ?auto_55879 ?auto_55881 ) ) ( not ( = ?auto_55879 ?auto_55883 ) ) ( not ( = ?auto_55879 ?auto_55880 ) ) ( ON ?auto_55882 ?auto_55879 ) ( CLEAR ?auto_55882 ) ( HOLDING ?auto_55881 ) ( CLEAR ?auto_55880 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55883 ?auto_55880 ?auto_55881 )
      ( MAKE-1PILE ?auto_55878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55885 - BLOCK
    )
    :vars
    (
      ?auto_55888 - BLOCK
      ?auto_55887 - BLOCK
      ?auto_55891 - BLOCK
      ?auto_55889 - BLOCK
      ?auto_55890 - BLOCK
      ?auto_55886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55885 ?auto_55888 ) ( not ( = ?auto_55885 ?auto_55888 ) ) ( not ( = ?auto_55885 ?auto_55887 ) ) ( not ( = ?auto_55885 ?auto_55891 ) ) ( not ( = ?auto_55888 ?auto_55887 ) ) ( not ( = ?auto_55888 ?auto_55891 ) ) ( not ( = ?auto_55887 ?auto_55891 ) ) ( ON ?auto_55887 ?auto_55885 ) ( ON-TABLE ?auto_55888 ) ( ON-TABLE ?auto_55889 ) ( ON ?auto_55890 ?auto_55889 ) ( not ( = ?auto_55889 ?auto_55890 ) ) ( not ( = ?auto_55889 ?auto_55886 ) ) ( not ( = ?auto_55889 ?auto_55891 ) ) ( not ( = ?auto_55890 ?auto_55886 ) ) ( not ( = ?auto_55890 ?auto_55891 ) ) ( not ( = ?auto_55886 ?auto_55891 ) ) ( not ( = ?auto_55885 ?auto_55886 ) ) ( not ( = ?auto_55885 ?auto_55889 ) ) ( not ( = ?auto_55885 ?auto_55890 ) ) ( not ( = ?auto_55888 ?auto_55886 ) ) ( not ( = ?auto_55888 ?auto_55889 ) ) ( not ( = ?auto_55888 ?auto_55890 ) ) ( not ( = ?auto_55887 ?auto_55886 ) ) ( not ( = ?auto_55887 ?auto_55889 ) ) ( not ( = ?auto_55887 ?auto_55890 ) ) ( ON ?auto_55891 ?auto_55887 ) ( CLEAR ?auto_55890 ) ( ON ?auto_55886 ?auto_55891 ) ( CLEAR ?auto_55886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55888 ?auto_55885 ?auto_55887 ?auto_55891 )
      ( MAKE-1PILE ?auto_55885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55892 - BLOCK
    )
    :vars
    (
      ?auto_55897 - BLOCK
      ?auto_55894 - BLOCK
      ?auto_55896 - BLOCK
      ?auto_55898 - BLOCK
      ?auto_55895 - BLOCK
      ?auto_55893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55892 ?auto_55897 ) ( not ( = ?auto_55892 ?auto_55897 ) ) ( not ( = ?auto_55892 ?auto_55894 ) ) ( not ( = ?auto_55892 ?auto_55896 ) ) ( not ( = ?auto_55897 ?auto_55894 ) ) ( not ( = ?auto_55897 ?auto_55896 ) ) ( not ( = ?auto_55894 ?auto_55896 ) ) ( ON ?auto_55894 ?auto_55892 ) ( ON-TABLE ?auto_55897 ) ( ON-TABLE ?auto_55898 ) ( not ( = ?auto_55898 ?auto_55895 ) ) ( not ( = ?auto_55898 ?auto_55893 ) ) ( not ( = ?auto_55898 ?auto_55896 ) ) ( not ( = ?auto_55895 ?auto_55893 ) ) ( not ( = ?auto_55895 ?auto_55896 ) ) ( not ( = ?auto_55893 ?auto_55896 ) ) ( not ( = ?auto_55892 ?auto_55893 ) ) ( not ( = ?auto_55892 ?auto_55898 ) ) ( not ( = ?auto_55892 ?auto_55895 ) ) ( not ( = ?auto_55897 ?auto_55893 ) ) ( not ( = ?auto_55897 ?auto_55898 ) ) ( not ( = ?auto_55897 ?auto_55895 ) ) ( not ( = ?auto_55894 ?auto_55893 ) ) ( not ( = ?auto_55894 ?auto_55898 ) ) ( not ( = ?auto_55894 ?auto_55895 ) ) ( ON ?auto_55896 ?auto_55894 ) ( ON ?auto_55893 ?auto_55896 ) ( CLEAR ?auto_55893 ) ( HOLDING ?auto_55895 ) ( CLEAR ?auto_55898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55898 ?auto_55895 )
      ( MAKE-1PILE ?auto_55892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55899 - BLOCK
    )
    :vars
    (
      ?auto_55902 - BLOCK
      ?auto_55903 - BLOCK
      ?auto_55905 - BLOCK
      ?auto_55901 - BLOCK
      ?auto_55900 - BLOCK
      ?auto_55904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55899 ?auto_55902 ) ( not ( = ?auto_55899 ?auto_55902 ) ) ( not ( = ?auto_55899 ?auto_55903 ) ) ( not ( = ?auto_55899 ?auto_55905 ) ) ( not ( = ?auto_55902 ?auto_55903 ) ) ( not ( = ?auto_55902 ?auto_55905 ) ) ( not ( = ?auto_55903 ?auto_55905 ) ) ( ON ?auto_55903 ?auto_55899 ) ( ON-TABLE ?auto_55902 ) ( ON-TABLE ?auto_55901 ) ( not ( = ?auto_55901 ?auto_55900 ) ) ( not ( = ?auto_55901 ?auto_55904 ) ) ( not ( = ?auto_55901 ?auto_55905 ) ) ( not ( = ?auto_55900 ?auto_55904 ) ) ( not ( = ?auto_55900 ?auto_55905 ) ) ( not ( = ?auto_55904 ?auto_55905 ) ) ( not ( = ?auto_55899 ?auto_55904 ) ) ( not ( = ?auto_55899 ?auto_55901 ) ) ( not ( = ?auto_55899 ?auto_55900 ) ) ( not ( = ?auto_55902 ?auto_55904 ) ) ( not ( = ?auto_55902 ?auto_55901 ) ) ( not ( = ?auto_55902 ?auto_55900 ) ) ( not ( = ?auto_55903 ?auto_55904 ) ) ( not ( = ?auto_55903 ?auto_55901 ) ) ( not ( = ?auto_55903 ?auto_55900 ) ) ( ON ?auto_55905 ?auto_55903 ) ( ON ?auto_55904 ?auto_55905 ) ( CLEAR ?auto_55901 ) ( ON ?auto_55900 ?auto_55904 ) ( CLEAR ?auto_55900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55902 ?auto_55899 ?auto_55903 ?auto_55905 ?auto_55904 )
      ( MAKE-1PILE ?auto_55899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55906 - BLOCK
    )
    :vars
    (
      ?auto_55908 - BLOCK
      ?auto_55911 - BLOCK
      ?auto_55909 - BLOCK
      ?auto_55910 - BLOCK
      ?auto_55907 - BLOCK
      ?auto_55912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55906 ?auto_55908 ) ( not ( = ?auto_55906 ?auto_55908 ) ) ( not ( = ?auto_55906 ?auto_55911 ) ) ( not ( = ?auto_55906 ?auto_55909 ) ) ( not ( = ?auto_55908 ?auto_55911 ) ) ( not ( = ?auto_55908 ?auto_55909 ) ) ( not ( = ?auto_55911 ?auto_55909 ) ) ( ON ?auto_55911 ?auto_55906 ) ( ON-TABLE ?auto_55908 ) ( not ( = ?auto_55910 ?auto_55907 ) ) ( not ( = ?auto_55910 ?auto_55912 ) ) ( not ( = ?auto_55910 ?auto_55909 ) ) ( not ( = ?auto_55907 ?auto_55912 ) ) ( not ( = ?auto_55907 ?auto_55909 ) ) ( not ( = ?auto_55912 ?auto_55909 ) ) ( not ( = ?auto_55906 ?auto_55912 ) ) ( not ( = ?auto_55906 ?auto_55910 ) ) ( not ( = ?auto_55906 ?auto_55907 ) ) ( not ( = ?auto_55908 ?auto_55912 ) ) ( not ( = ?auto_55908 ?auto_55910 ) ) ( not ( = ?auto_55908 ?auto_55907 ) ) ( not ( = ?auto_55911 ?auto_55912 ) ) ( not ( = ?auto_55911 ?auto_55910 ) ) ( not ( = ?auto_55911 ?auto_55907 ) ) ( ON ?auto_55909 ?auto_55911 ) ( ON ?auto_55912 ?auto_55909 ) ( ON ?auto_55907 ?auto_55912 ) ( CLEAR ?auto_55907 ) ( HOLDING ?auto_55910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55910 )
      ( MAKE-1PILE ?auto_55906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55913 - BLOCK
    )
    :vars
    (
      ?auto_55918 - BLOCK
      ?auto_55916 - BLOCK
      ?auto_55914 - BLOCK
      ?auto_55915 - BLOCK
      ?auto_55919 - BLOCK
      ?auto_55917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55913 ?auto_55918 ) ( not ( = ?auto_55913 ?auto_55918 ) ) ( not ( = ?auto_55913 ?auto_55916 ) ) ( not ( = ?auto_55913 ?auto_55914 ) ) ( not ( = ?auto_55918 ?auto_55916 ) ) ( not ( = ?auto_55918 ?auto_55914 ) ) ( not ( = ?auto_55916 ?auto_55914 ) ) ( ON ?auto_55916 ?auto_55913 ) ( ON-TABLE ?auto_55918 ) ( not ( = ?auto_55915 ?auto_55919 ) ) ( not ( = ?auto_55915 ?auto_55917 ) ) ( not ( = ?auto_55915 ?auto_55914 ) ) ( not ( = ?auto_55919 ?auto_55917 ) ) ( not ( = ?auto_55919 ?auto_55914 ) ) ( not ( = ?auto_55917 ?auto_55914 ) ) ( not ( = ?auto_55913 ?auto_55917 ) ) ( not ( = ?auto_55913 ?auto_55915 ) ) ( not ( = ?auto_55913 ?auto_55919 ) ) ( not ( = ?auto_55918 ?auto_55917 ) ) ( not ( = ?auto_55918 ?auto_55915 ) ) ( not ( = ?auto_55918 ?auto_55919 ) ) ( not ( = ?auto_55916 ?auto_55917 ) ) ( not ( = ?auto_55916 ?auto_55915 ) ) ( not ( = ?auto_55916 ?auto_55919 ) ) ( ON ?auto_55914 ?auto_55916 ) ( ON ?auto_55917 ?auto_55914 ) ( ON ?auto_55919 ?auto_55917 ) ( ON ?auto_55915 ?auto_55919 ) ( CLEAR ?auto_55915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55918 ?auto_55913 ?auto_55916 ?auto_55914 ?auto_55917 ?auto_55919 )
      ( MAKE-1PILE ?auto_55913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55929 - BLOCK
      ?auto_55930 - BLOCK
      ?auto_55931 - BLOCK
      ?auto_55932 - BLOCK
    )
    :vars
    (
      ?auto_55933 - BLOCK
      ?auto_55934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55933 ?auto_55932 ) ( CLEAR ?auto_55933 ) ( ON-TABLE ?auto_55929 ) ( ON ?auto_55930 ?auto_55929 ) ( ON ?auto_55931 ?auto_55930 ) ( ON ?auto_55932 ?auto_55931 ) ( not ( = ?auto_55929 ?auto_55930 ) ) ( not ( = ?auto_55929 ?auto_55931 ) ) ( not ( = ?auto_55929 ?auto_55932 ) ) ( not ( = ?auto_55929 ?auto_55933 ) ) ( not ( = ?auto_55930 ?auto_55931 ) ) ( not ( = ?auto_55930 ?auto_55932 ) ) ( not ( = ?auto_55930 ?auto_55933 ) ) ( not ( = ?auto_55931 ?auto_55932 ) ) ( not ( = ?auto_55931 ?auto_55933 ) ) ( not ( = ?auto_55932 ?auto_55933 ) ) ( HOLDING ?auto_55934 ) ( not ( = ?auto_55929 ?auto_55934 ) ) ( not ( = ?auto_55930 ?auto_55934 ) ) ( not ( = ?auto_55931 ?auto_55934 ) ) ( not ( = ?auto_55932 ?auto_55934 ) ) ( not ( = ?auto_55933 ?auto_55934 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55934 )
      ( MAKE-4PILE ?auto_55929 ?auto_55930 ?auto_55931 ?auto_55932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56002 - BLOCK
      ?auto_56003 - BLOCK
    )
    :vars
    (
      ?auto_56004 - BLOCK
      ?auto_56007 - BLOCK
      ?auto_56006 - BLOCK
      ?auto_56005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56002 ?auto_56003 ) ) ( ON ?auto_56003 ?auto_56004 ) ( not ( = ?auto_56002 ?auto_56004 ) ) ( not ( = ?auto_56003 ?auto_56004 ) ) ( ON ?auto_56002 ?auto_56003 ) ( CLEAR ?auto_56002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56007 ) ( ON ?auto_56006 ?auto_56007 ) ( ON ?auto_56005 ?auto_56006 ) ( ON ?auto_56004 ?auto_56005 ) ( not ( = ?auto_56007 ?auto_56006 ) ) ( not ( = ?auto_56007 ?auto_56005 ) ) ( not ( = ?auto_56007 ?auto_56004 ) ) ( not ( = ?auto_56007 ?auto_56003 ) ) ( not ( = ?auto_56007 ?auto_56002 ) ) ( not ( = ?auto_56006 ?auto_56005 ) ) ( not ( = ?auto_56006 ?auto_56004 ) ) ( not ( = ?auto_56006 ?auto_56003 ) ) ( not ( = ?auto_56006 ?auto_56002 ) ) ( not ( = ?auto_56005 ?auto_56004 ) ) ( not ( = ?auto_56005 ?auto_56003 ) ) ( not ( = ?auto_56005 ?auto_56002 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56007 ?auto_56006 ?auto_56005 ?auto_56004 ?auto_56003 )
      ( MAKE-2PILE ?auto_56002 ?auto_56003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56010 - BLOCK
      ?auto_56011 - BLOCK
    )
    :vars
    (
      ?auto_56012 - BLOCK
      ?auto_56013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56010 ?auto_56011 ) ) ( ON ?auto_56011 ?auto_56012 ) ( CLEAR ?auto_56011 ) ( not ( = ?auto_56010 ?auto_56012 ) ) ( not ( = ?auto_56011 ?auto_56012 ) ) ( ON ?auto_56010 ?auto_56013 ) ( CLEAR ?auto_56010 ) ( HAND-EMPTY ) ( not ( = ?auto_56010 ?auto_56013 ) ) ( not ( = ?auto_56011 ?auto_56013 ) ) ( not ( = ?auto_56012 ?auto_56013 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56010 ?auto_56013 )
      ( MAKE-2PILE ?auto_56010 ?auto_56011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56014 - BLOCK
      ?auto_56015 - BLOCK
    )
    :vars
    (
      ?auto_56017 - BLOCK
      ?auto_56016 - BLOCK
      ?auto_56019 - BLOCK
      ?auto_56018 - BLOCK
      ?auto_56020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56014 ?auto_56015 ) ) ( not ( = ?auto_56014 ?auto_56017 ) ) ( not ( = ?auto_56015 ?auto_56017 ) ) ( ON ?auto_56014 ?auto_56016 ) ( CLEAR ?auto_56014 ) ( not ( = ?auto_56014 ?auto_56016 ) ) ( not ( = ?auto_56015 ?auto_56016 ) ) ( not ( = ?auto_56017 ?auto_56016 ) ) ( HOLDING ?auto_56015 ) ( CLEAR ?auto_56017 ) ( ON-TABLE ?auto_56019 ) ( ON ?auto_56018 ?auto_56019 ) ( ON ?auto_56020 ?auto_56018 ) ( ON ?auto_56017 ?auto_56020 ) ( not ( = ?auto_56019 ?auto_56018 ) ) ( not ( = ?auto_56019 ?auto_56020 ) ) ( not ( = ?auto_56019 ?auto_56017 ) ) ( not ( = ?auto_56019 ?auto_56015 ) ) ( not ( = ?auto_56018 ?auto_56020 ) ) ( not ( = ?auto_56018 ?auto_56017 ) ) ( not ( = ?auto_56018 ?auto_56015 ) ) ( not ( = ?auto_56020 ?auto_56017 ) ) ( not ( = ?auto_56020 ?auto_56015 ) ) ( not ( = ?auto_56014 ?auto_56019 ) ) ( not ( = ?auto_56014 ?auto_56018 ) ) ( not ( = ?auto_56014 ?auto_56020 ) ) ( not ( = ?auto_56016 ?auto_56019 ) ) ( not ( = ?auto_56016 ?auto_56018 ) ) ( not ( = ?auto_56016 ?auto_56020 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56019 ?auto_56018 ?auto_56020 ?auto_56017 ?auto_56015 )
      ( MAKE-2PILE ?auto_56014 ?auto_56015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56021 - BLOCK
      ?auto_56022 - BLOCK
    )
    :vars
    (
      ?auto_56023 - BLOCK
      ?auto_56026 - BLOCK
      ?auto_56027 - BLOCK
      ?auto_56025 - BLOCK
      ?auto_56024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56021 ?auto_56022 ) ) ( not ( = ?auto_56021 ?auto_56023 ) ) ( not ( = ?auto_56022 ?auto_56023 ) ) ( ON ?auto_56021 ?auto_56026 ) ( not ( = ?auto_56021 ?auto_56026 ) ) ( not ( = ?auto_56022 ?auto_56026 ) ) ( not ( = ?auto_56023 ?auto_56026 ) ) ( CLEAR ?auto_56023 ) ( ON-TABLE ?auto_56027 ) ( ON ?auto_56025 ?auto_56027 ) ( ON ?auto_56024 ?auto_56025 ) ( ON ?auto_56023 ?auto_56024 ) ( not ( = ?auto_56027 ?auto_56025 ) ) ( not ( = ?auto_56027 ?auto_56024 ) ) ( not ( = ?auto_56027 ?auto_56023 ) ) ( not ( = ?auto_56027 ?auto_56022 ) ) ( not ( = ?auto_56025 ?auto_56024 ) ) ( not ( = ?auto_56025 ?auto_56023 ) ) ( not ( = ?auto_56025 ?auto_56022 ) ) ( not ( = ?auto_56024 ?auto_56023 ) ) ( not ( = ?auto_56024 ?auto_56022 ) ) ( not ( = ?auto_56021 ?auto_56027 ) ) ( not ( = ?auto_56021 ?auto_56025 ) ) ( not ( = ?auto_56021 ?auto_56024 ) ) ( not ( = ?auto_56026 ?auto_56027 ) ) ( not ( = ?auto_56026 ?auto_56025 ) ) ( not ( = ?auto_56026 ?auto_56024 ) ) ( ON ?auto_56022 ?auto_56021 ) ( CLEAR ?auto_56022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56026 ?auto_56021 )
      ( MAKE-2PILE ?auto_56021 ?auto_56022 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56028 - BLOCK
      ?auto_56029 - BLOCK
    )
    :vars
    (
      ?auto_56031 - BLOCK
      ?auto_56034 - BLOCK
      ?auto_56030 - BLOCK
      ?auto_56033 - BLOCK
      ?auto_56032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56028 ?auto_56029 ) ) ( not ( = ?auto_56028 ?auto_56031 ) ) ( not ( = ?auto_56029 ?auto_56031 ) ) ( ON ?auto_56028 ?auto_56034 ) ( not ( = ?auto_56028 ?auto_56034 ) ) ( not ( = ?auto_56029 ?auto_56034 ) ) ( not ( = ?auto_56031 ?auto_56034 ) ) ( ON-TABLE ?auto_56030 ) ( ON ?auto_56033 ?auto_56030 ) ( ON ?auto_56032 ?auto_56033 ) ( not ( = ?auto_56030 ?auto_56033 ) ) ( not ( = ?auto_56030 ?auto_56032 ) ) ( not ( = ?auto_56030 ?auto_56031 ) ) ( not ( = ?auto_56030 ?auto_56029 ) ) ( not ( = ?auto_56033 ?auto_56032 ) ) ( not ( = ?auto_56033 ?auto_56031 ) ) ( not ( = ?auto_56033 ?auto_56029 ) ) ( not ( = ?auto_56032 ?auto_56031 ) ) ( not ( = ?auto_56032 ?auto_56029 ) ) ( not ( = ?auto_56028 ?auto_56030 ) ) ( not ( = ?auto_56028 ?auto_56033 ) ) ( not ( = ?auto_56028 ?auto_56032 ) ) ( not ( = ?auto_56034 ?auto_56030 ) ) ( not ( = ?auto_56034 ?auto_56033 ) ) ( not ( = ?auto_56034 ?auto_56032 ) ) ( ON ?auto_56029 ?auto_56028 ) ( CLEAR ?auto_56029 ) ( ON-TABLE ?auto_56034 ) ( HOLDING ?auto_56031 ) ( CLEAR ?auto_56032 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56030 ?auto_56033 ?auto_56032 ?auto_56031 )
      ( MAKE-2PILE ?auto_56028 ?auto_56029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56035 - BLOCK
      ?auto_56036 - BLOCK
    )
    :vars
    (
      ?auto_56038 - BLOCK
      ?auto_56037 - BLOCK
      ?auto_56040 - BLOCK
      ?auto_56039 - BLOCK
      ?auto_56041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56035 ?auto_56036 ) ) ( not ( = ?auto_56035 ?auto_56038 ) ) ( not ( = ?auto_56036 ?auto_56038 ) ) ( ON ?auto_56035 ?auto_56037 ) ( not ( = ?auto_56035 ?auto_56037 ) ) ( not ( = ?auto_56036 ?auto_56037 ) ) ( not ( = ?auto_56038 ?auto_56037 ) ) ( ON-TABLE ?auto_56040 ) ( ON ?auto_56039 ?auto_56040 ) ( ON ?auto_56041 ?auto_56039 ) ( not ( = ?auto_56040 ?auto_56039 ) ) ( not ( = ?auto_56040 ?auto_56041 ) ) ( not ( = ?auto_56040 ?auto_56038 ) ) ( not ( = ?auto_56040 ?auto_56036 ) ) ( not ( = ?auto_56039 ?auto_56041 ) ) ( not ( = ?auto_56039 ?auto_56038 ) ) ( not ( = ?auto_56039 ?auto_56036 ) ) ( not ( = ?auto_56041 ?auto_56038 ) ) ( not ( = ?auto_56041 ?auto_56036 ) ) ( not ( = ?auto_56035 ?auto_56040 ) ) ( not ( = ?auto_56035 ?auto_56039 ) ) ( not ( = ?auto_56035 ?auto_56041 ) ) ( not ( = ?auto_56037 ?auto_56040 ) ) ( not ( = ?auto_56037 ?auto_56039 ) ) ( not ( = ?auto_56037 ?auto_56041 ) ) ( ON ?auto_56036 ?auto_56035 ) ( ON-TABLE ?auto_56037 ) ( CLEAR ?auto_56041 ) ( ON ?auto_56038 ?auto_56036 ) ( CLEAR ?auto_56038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56037 ?auto_56035 ?auto_56036 )
      ( MAKE-2PILE ?auto_56035 ?auto_56036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56042 - BLOCK
      ?auto_56043 - BLOCK
    )
    :vars
    (
      ?auto_56046 - BLOCK
      ?auto_56045 - BLOCK
      ?auto_56047 - BLOCK
      ?auto_56044 - BLOCK
      ?auto_56048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56046 ) ) ( not ( = ?auto_56043 ?auto_56046 ) ) ( ON ?auto_56042 ?auto_56045 ) ( not ( = ?auto_56042 ?auto_56045 ) ) ( not ( = ?auto_56043 ?auto_56045 ) ) ( not ( = ?auto_56046 ?auto_56045 ) ) ( ON-TABLE ?auto_56047 ) ( ON ?auto_56044 ?auto_56047 ) ( not ( = ?auto_56047 ?auto_56044 ) ) ( not ( = ?auto_56047 ?auto_56048 ) ) ( not ( = ?auto_56047 ?auto_56046 ) ) ( not ( = ?auto_56047 ?auto_56043 ) ) ( not ( = ?auto_56044 ?auto_56048 ) ) ( not ( = ?auto_56044 ?auto_56046 ) ) ( not ( = ?auto_56044 ?auto_56043 ) ) ( not ( = ?auto_56048 ?auto_56046 ) ) ( not ( = ?auto_56048 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56047 ) ) ( not ( = ?auto_56042 ?auto_56044 ) ) ( not ( = ?auto_56042 ?auto_56048 ) ) ( not ( = ?auto_56045 ?auto_56047 ) ) ( not ( = ?auto_56045 ?auto_56044 ) ) ( not ( = ?auto_56045 ?auto_56048 ) ) ( ON ?auto_56043 ?auto_56042 ) ( ON-TABLE ?auto_56045 ) ( ON ?auto_56046 ?auto_56043 ) ( CLEAR ?auto_56046 ) ( HOLDING ?auto_56048 ) ( CLEAR ?auto_56044 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56047 ?auto_56044 ?auto_56048 )
      ( MAKE-2PILE ?auto_56042 ?auto_56043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56049 - BLOCK
      ?auto_56050 - BLOCK
    )
    :vars
    (
      ?auto_56052 - BLOCK
      ?auto_56055 - BLOCK
      ?auto_56051 - BLOCK
      ?auto_56053 - BLOCK
      ?auto_56054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56049 ?auto_56050 ) ) ( not ( = ?auto_56049 ?auto_56052 ) ) ( not ( = ?auto_56050 ?auto_56052 ) ) ( ON ?auto_56049 ?auto_56055 ) ( not ( = ?auto_56049 ?auto_56055 ) ) ( not ( = ?auto_56050 ?auto_56055 ) ) ( not ( = ?auto_56052 ?auto_56055 ) ) ( ON-TABLE ?auto_56051 ) ( ON ?auto_56053 ?auto_56051 ) ( not ( = ?auto_56051 ?auto_56053 ) ) ( not ( = ?auto_56051 ?auto_56054 ) ) ( not ( = ?auto_56051 ?auto_56052 ) ) ( not ( = ?auto_56051 ?auto_56050 ) ) ( not ( = ?auto_56053 ?auto_56054 ) ) ( not ( = ?auto_56053 ?auto_56052 ) ) ( not ( = ?auto_56053 ?auto_56050 ) ) ( not ( = ?auto_56054 ?auto_56052 ) ) ( not ( = ?auto_56054 ?auto_56050 ) ) ( not ( = ?auto_56049 ?auto_56051 ) ) ( not ( = ?auto_56049 ?auto_56053 ) ) ( not ( = ?auto_56049 ?auto_56054 ) ) ( not ( = ?auto_56055 ?auto_56051 ) ) ( not ( = ?auto_56055 ?auto_56053 ) ) ( not ( = ?auto_56055 ?auto_56054 ) ) ( ON ?auto_56050 ?auto_56049 ) ( ON-TABLE ?auto_56055 ) ( ON ?auto_56052 ?auto_56050 ) ( CLEAR ?auto_56053 ) ( ON ?auto_56054 ?auto_56052 ) ( CLEAR ?auto_56054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56055 ?auto_56049 ?auto_56050 ?auto_56052 )
      ( MAKE-2PILE ?auto_56049 ?auto_56050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56056 - BLOCK
      ?auto_56057 - BLOCK
    )
    :vars
    (
      ?auto_56062 - BLOCK
      ?auto_56061 - BLOCK
      ?auto_56059 - BLOCK
      ?auto_56060 - BLOCK
      ?auto_56058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56056 ?auto_56057 ) ) ( not ( = ?auto_56056 ?auto_56062 ) ) ( not ( = ?auto_56057 ?auto_56062 ) ) ( ON ?auto_56056 ?auto_56061 ) ( not ( = ?auto_56056 ?auto_56061 ) ) ( not ( = ?auto_56057 ?auto_56061 ) ) ( not ( = ?auto_56062 ?auto_56061 ) ) ( ON-TABLE ?auto_56059 ) ( not ( = ?auto_56059 ?auto_56060 ) ) ( not ( = ?auto_56059 ?auto_56058 ) ) ( not ( = ?auto_56059 ?auto_56062 ) ) ( not ( = ?auto_56059 ?auto_56057 ) ) ( not ( = ?auto_56060 ?auto_56058 ) ) ( not ( = ?auto_56060 ?auto_56062 ) ) ( not ( = ?auto_56060 ?auto_56057 ) ) ( not ( = ?auto_56058 ?auto_56062 ) ) ( not ( = ?auto_56058 ?auto_56057 ) ) ( not ( = ?auto_56056 ?auto_56059 ) ) ( not ( = ?auto_56056 ?auto_56060 ) ) ( not ( = ?auto_56056 ?auto_56058 ) ) ( not ( = ?auto_56061 ?auto_56059 ) ) ( not ( = ?auto_56061 ?auto_56060 ) ) ( not ( = ?auto_56061 ?auto_56058 ) ) ( ON ?auto_56057 ?auto_56056 ) ( ON-TABLE ?auto_56061 ) ( ON ?auto_56062 ?auto_56057 ) ( ON ?auto_56058 ?auto_56062 ) ( CLEAR ?auto_56058 ) ( HOLDING ?auto_56060 ) ( CLEAR ?auto_56059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56059 ?auto_56060 )
      ( MAKE-2PILE ?auto_56056 ?auto_56057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56063 - BLOCK
      ?auto_56064 - BLOCK
    )
    :vars
    (
      ?auto_56065 - BLOCK
      ?auto_56066 - BLOCK
      ?auto_56068 - BLOCK
      ?auto_56067 - BLOCK
      ?auto_56069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56063 ?auto_56064 ) ) ( not ( = ?auto_56063 ?auto_56065 ) ) ( not ( = ?auto_56064 ?auto_56065 ) ) ( ON ?auto_56063 ?auto_56066 ) ( not ( = ?auto_56063 ?auto_56066 ) ) ( not ( = ?auto_56064 ?auto_56066 ) ) ( not ( = ?auto_56065 ?auto_56066 ) ) ( ON-TABLE ?auto_56068 ) ( not ( = ?auto_56068 ?auto_56067 ) ) ( not ( = ?auto_56068 ?auto_56069 ) ) ( not ( = ?auto_56068 ?auto_56065 ) ) ( not ( = ?auto_56068 ?auto_56064 ) ) ( not ( = ?auto_56067 ?auto_56069 ) ) ( not ( = ?auto_56067 ?auto_56065 ) ) ( not ( = ?auto_56067 ?auto_56064 ) ) ( not ( = ?auto_56069 ?auto_56065 ) ) ( not ( = ?auto_56069 ?auto_56064 ) ) ( not ( = ?auto_56063 ?auto_56068 ) ) ( not ( = ?auto_56063 ?auto_56067 ) ) ( not ( = ?auto_56063 ?auto_56069 ) ) ( not ( = ?auto_56066 ?auto_56068 ) ) ( not ( = ?auto_56066 ?auto_56067 ) ) ( not ( = ?auto_56066 ?auto_56069 ) ) ( ON ?auto_56064 ?auto_56063 ) ( ON-TABLE ?auto_56066 ) ( ON ?auto_56065 ?auto_56064 ) ( ON ?auto_56069 ?auto_56065 ) ( CLEAR ?auto_56068 ) ( ON ?auto_56067 ?auto_56069 ) ( CLEAR ?auto_56067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56066 ?auto_56063 ?auto_56064 ?auto_56065 ?auto_56069 )
      ( MAKE-2PILE ?auto_56063 ?auto_56064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56070 - BLOCK
      ?auto_56071 - BLOCK
    )
    :vars
    (
      ?auto_56074 - BLOCK
      ?auto_56075 - BLOCK
      ?auto_56073 - BLOCK
      ?auto_56076 - BLOCK
      ?auto_56072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56070 ?auto_56071 ) ) ( not ( = ?auto_56070 ?auto_56074 ) ) ( not ( = ?auto_56071 ?auto_56074 ) ) ( ON ?auto_56070 ?auto_56075 ) ( not ( = ?auto_56070 ?auto_56075 ) ) ( not ( = ?auto_56071 ?auto_56075 ) ) ( not ( = ?auto_56074 ?auto_56075 ) ) ( not ( = ?auto_56073 ?auto_56076 ) ) ( not ( = ?auto_56073 ?auto_56072 ) ) ( not ( = ?auto_56073 ?auto_56074 ) ) ( not ( = ?auto_56073 ?auto_56071 ) ) ( not ( = ?auto_56076 ?auto_56072 ) ) ( not ( = ?auto_56076 ?auto_56074 ) ) ( not ( = ?auto_56076 ?auto_56071 ) ) ( not ( = ?auto_56072 ?auto_56074 ) ) ( not ( = ?auto_56072 ?auto_56071 ) ) ( not ( = ?auto_56070 ?auto_56073 ) ) ( not ( = ?auto_56070 ?auto_56076 ) ) ( not ( = ?auto_56070 ?auto_56072 ) ) ( not ( = ?auto_56075 ?auto_56073 ) ) ( not ( = ?auto_56075 ?auto_56076 ) ) ( not ( = ?auto_56075 ?auto_56072 ) ) ( ON ?auto_56071 ?auto_56070 ) ( ON-TABLE ?auto_56075 ) ( ON ?auto_56074 ?auto_56071 ) ( ON ?auto_56072 ?auto_56074 ) ( ON ?auto_56076 ?auto_56072 ) ( CLEAR ?auto_56076 ) ( HOLDING ?auto_56073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56073 )
      ( MAKE-2PILE ?auto_56070 ?auto_56071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56077 - BLOCK
      ?auto_56078 - BLOCK
    )
    :vars
    (
      ?auto_56082 - BLOCK
      ?auto_56079 - BLOCK
      ?auto_56081 - BLOCK
      ?auto_56083 - BLOCK
      ?auto_56080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56077 ?auto_56078 ) ) ( not ( = ?auto_56077 ?auto_56082 ) ) ( not ( = ?auto_56078 ?auto_56082 ) ) ( ON ?auto_56077 ?auto_56079 ) ( not ( = ?auto_56077 ?auto_56079 ) ) ( not ( = ?auto_56078 ?auto_56079 ) ) ( not ( = ?auto_56082 ?auto_56079 ) ) ( not ( = ?auto_56081 ?auto_56083 ) ) ( not ( = ?auto_56081 ?auto_56080 ) ) ( not ( = ?auto_56081 ?auto_56082 ) ) ( not ( = ?auto_56081 ?auto_56078 ) ) ( not ( = ?auto_56083 ?auto_56080 ) ) ( not ( = ?auto_56083 ?auto_56082 ) ) ( not ( = ?auto_56083 ?auto_56078 ) ) ( not ( = ?auto_56080 ?auto_56082 ) ) ( not ( = ?auto_56080 ?auto_56078 ) ) ( not ( = ?auto_56077 ?auto_56081 ) ) ( not ( = ?auto_56077 ?auto_56083 ) ) ( not ( = ?auto_56077 ?auto_56080 ) ) ( not ( = ?auto_56079 ?auto_56081 ) ) ( not ( = ?auto_56079 ?auto_56083 ) ) ( not ( = ?auto_56079 ?auto_56080 ) ) ( ON ?auto_56078 ?auto_56077 ) ( ON-TABLE ?auto_56079 ) ( ON ?auto_56082 ?auto_56078 ) ( ON ?auto_56080 ?auto_56082 ) ( ON ?auto_56083 ?auto_56080 ) ( ON ?auto_56081 ?auto_56083 ) ( CLEAR ?auto_56081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56079 ?auto_56077 ?auto_56078 ?auto_56082 ?auto_56080 ?auto_56083 )
      ( MAKE-2PILE ?auto_56077 ?auto_56078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56103 - BLOCK
      ?auto_56104 - BLOCK
      ?auto_56105 - BLOCK
    )
    :vars
    (
      ?auto_56107 - BLOCK
      ?auto_56106 - BLOCK
      ?auto_56108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56107 ?auto_56105 ) ( ON-TABLE ?auto_56103 ) ( ON ?auto_56104 ?auto_56103 ) ( ON ?auto_56105 ?auto_56104 ) ( not ( = ?auto_56103 ?auto_56104 ) ) ( not ( = ?auto_56103 ?auto_56105 ) ) ( not ( = ?auto_56103 ?auto_56107 ) ) ( not ( = ?auto_56104 ?auto_56105 ) ) ( not ( = ?auto_56104 ?auto_56107 ) ) ( not ( = ?auto_56105 ?auto_56107 ) ) ( not ( = ?auto_56103 ?auto_56106 ) ) ( not ( = ?auto_56103 ?auto_56108 ) ) ( not ( = ?auto_56104 ?auto_56106 ) ) ( not ( = ?auto_56104 ?auto_56108 ) ) ( not ( = ?auto_56105 ?auto_56106 ) ) ( not ( = ?auto_56105 ?auto_56108 ) ) ( not ( = ?auto_56107 ?auto_56106 ) ) ( not ( = ?auto_56107 ?auto_56108 ) ) ( not ( = ?auto_56106 ?auto_56108 ) ) ( ON ?auto_56106 ?auto_56107 ) ( CLEAR ?auto_56106 ) ( HOLDING ?auto_56108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56108 )
      ( MAKE-3PILE ?auto_56103 ?auto_56104 ?auto_56105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56168 - BLOCK
      ?auto_56169 - BLOCK
      ?auto_56170 - BLOCK
    )
    :vars
    (
      ?auto_56171 - BLOCK
      ?auto_56172 - BLOCK
      ?auto_56173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56168 ) ( not ( = ?auto_56168 ?auto_56169 ) ) ( not ( = ?auto_56168 ?auto_56170 ) ) ( not ( = ?auto_56169 ?auto_56170 ) ) ( ON ?auto_56170 ?auto_56171 ) ( not ( = ?auto_56168 ?auto_56171 ) ) ( not ( = ?auto_56169 ?auto_56171 ) ) ( not ( = ?auto_56170 ?auto_56171 ) ) ( CLEAR ?auto_56168 ) ( ON ?auto_56169 ?auto_56170 ) ( CLEAR ?auto_56169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56172 ) ( ON ?auto_56173 ?auto_56172 ) ( ON ?auto_56171 ?auto_56173 ) ( not ( = ?auto_56172 ?auto_56173 ) ) ( not ( = ?auto_56172 ?auto_56171 ) ) ( not ( = ?auto_56172 ?auto_56170 ) ) ( not ( = ?auto_56172 ?auto_56169 ) ) ( not ( = ?auto_56173 ?auto_56171 ) ) ( not ( = ?auto_56173 ?auto_56170 ) ) ( not ( = ?auto_56173 ?auto_56169 ) ) ( not ( = ?auto_56168 ?auto_56172 ) ) ( not ( = ?auto_56168 ?auto_56173 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56172 ?auto_56173 ?auto_56171 ?auto_56170 )
      ( MAKE-3PILE ?auto_56168 ?auto_56169 ?auto_56170 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56174 - BLOCK
      ?auto_56175 - BLOCK
      ?auto_56176 - BLOCK
    )
    :vars
    (
      ?auto_56177 - BLOCK
      ?auto_56178 - BLOCK
      ?auto_56179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56174 ?auto_56175 ) ) ( not ( = ?auto_56174 ?auto_56176 ) ) ( not ( = ?auto_56175 ?auto_56176 ) ) ( ON ?auto_56176 ?auto_56177 ) ( not ( = ?auto_56174 ?auto_56177 ) ) ( not ( = ?auto_56175 ?auto_56177 ) ) ( not ( = ?auto_56176 ?auto_56177 ) ) ( ON ?auto_56175 ?auto_56176 ) ( CLEAR ?auto_56175 ) ( ON-TABLE ?auto_56178 ) ( ON ?auto_56179 ?auto_56178 ) ( ON ?auto_56177 ?auto_56179 ) ( not ( = ?auto_56178 ?auto_56179 ) ) ( not ( = ?auto_56178 ?auto_56177 ) ) ( not ( = ?auto_56178 ?auto_56176 ) ) ( not ( = ?auto_56178 ?auto_56175 ) ) ( not ( = ?auto_56179 ?auto_56177 ) ) ( not ( = ?auto_56179 ?auto_56176 ) ) ( not ( = ?auto_56179 ?auto_56175 ) ) ( not ( = ?auto_56174 ?auto_56178 ) ) ( not ( = ?auto_56174 ?auto_56179 ) ) ( HOLDING ?auto_56174 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56174 )
      ( MAKE-3PILE ?auto_56174 ?auto_56175 ?auto_56176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56180 - BLOCK
      ?auto_56181 - BLOCK
      ?auto_56182 - BLOCK
    )
    :vars
    (
      ?auto_56183 - BLOCK
      ?auto_56184 - BLOCK
      ?auto_56185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56180 ?auto_56181 ) ) ( not ( = ?auto_56180 ?auto_56182 ) ) ( not ( = ?auto_56181 ?auto_56182 ) ) ( ON ?auto_56182 ?auto_56183 ) ( not ( = ?auto_56180 ?auto_56183 ) ) ( not ( = ?auto_56181 ?auto_56183 ) ) ( not ( = ?auto_56182 ?auto_56183 ) ) ( ON ?auto_56181 ?auto_56182 ) ( ON-TABLE ?auto_56184 ) ( ON ?auto_56185 ?auto_56184 ) ( ON ?auto_56183 ?auto_56185 ) ( not ( = ?auto_56184 ?auto_56185 ) ) ( not ( = ?auto_56184 ?auto_56183 ) ) ( not ( = ?auto_56184 ?auto_56182 ) ) ( not ( = ?auto_56184 ?auto_56181 ) ) ( not ( = ?auto_56185 ?auto_56183 ) ) ( not ( = ?auto_56185 ?auto_56182 ) ) ( not ( = ?auto_56185 ?auto_56181 ) ) ( not ( = ?auto_56180 ?auto_56184 ) ) ( not ( = ?auto_56180 ?auto_56185 ) ) ( ON ?auto_56180 ?auto_56181 ) ( CLEAR ?auto_56180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56184 ?auto_56185 ?auto_56183 ?auto_56182 ?auto_56181 )
      ( MAKE-3PILE ?auto_56180 ?auto_56181 ?auto_56182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56189 - BLOCK
      ?auto_56190 - BLOCK
      ?auto_56191 - BLOCK
    )
    :vars
    (
      ?auto_56192 - BLOCK
      ?auto_56193 - BLOCK
      ?auto_56194 - BLOCK
      ?auto_56195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56189 ?auto_56190 ) ) ( not ( = ?auto_56189 ?auto_56191 ) ) ( not ( = ?auto_56190 ?auto_56191 ) ) ( ON ?auto_56191 ?auto_56192 ) ( not ( = ?auto_56189 ?auto_56192 ) ) ( not ( = ?auto_56190 ?auto_56192 ) ) ( not ( = ?auto_56191 ?auto_56192 ) ) ( ON ?auto_56190 ?auto_56191 ) ( CLEAR ?auto_56190 ) ( ON-TABLE ?auto_56193 ) ( ON ?auto_56194 ?auto_56193 ) ( ON ?auto_56192 ?auto_56194 ) ( not ( = ?auto_56193 ?auto_56194 ) ) ( not ( = ?auto_56193 ?auto_56192 ) ) ( not ( = ?auto_56193 ?auto_56191 ) ) ( not ( = ?auto_56193 ?auto_56190 ) ) ( not ( = ?auto_56194 ?auto_56192 ) ) ( not ( = ?auto_56194 ?auto_56191 ) ) ( not ( = ?auto_56194 ?auto_56190 ) ) ( not ( = ?auto_56189 ?auto_56193 ) ) ( not ( = ?auto_56189 ?auto_56194 ) ) ( ON ?auto_56189 ?auto_56195 ) ( CLEAR ?auto_56189 ) ( HAND-EMPTY ) ( not ( = ?auto_56189 ?auto_56195 ) ) ( not ( = ?auto_56190 ?auto_56195 ) ) ( not ( = ?auto_56191 ?auto_56195 ) ) ( not ( = ?auto_56192 ?auto_56195 ) ) ( not ( = ?auto_56193 ?auto_56195 ) ) ( not ( = ?auto_56194 ?auto_56195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56189 ?auto_56195 )
      ( MAKE-3PILE ?auto_56189 ?auto_56190 ?auto_56191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56196 - BLOCK
      ?auto_56197 - BLOCK
      ?auto_56198 - BLOCK
    )
    :vars
    (
      ?auto_56202 - BLOCK
      ?auto_56201 - BLOCK
      ?auto_56199 - BLOCK
      ?auto_56200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56196 ?auto_56197 ) ) ( not ( = ?auto_56196 ?auto_56198 ) ) ( not ( = ?auto_56197 ?auto_56198 ) ) ( ON ?auto_56198 ?auto_56202 ) ( not ( = ?auto_56196 ?auto_56202 ) ) ( not ( = ?auto_56197 ?auto_56202 ) ) ( not ( = ?auto_56198 ?auto_56202 ) ) ( ON-TABLE ?auto_56201 ) ( ON ?auto_56199 ?auto_56201 ) ( ON ?auto_56202 ?auto_56199 ) ( not ( = ?auto_56201 ?auto_56199 ) ) ( not ( = ?auto_56201 ?auto_56202 ) ) ( not ( = ?auto_56201 ?auto_56198 ) ) ( not ( = ?auto_56201 ?auto_56197 ) ) ( not ( = ?auto_56199 ?auto_56202 ) ) ( not ( = ?auto_56199 ?auto_56198 ) ) ( not ( = ?auto_56199 ?auto_56197 ) ) ( not ( = ?auto_56196 ?auto_56201 ) ) ( not ( = ?auto_56196 ?auto_56199 ) ) ( ON ?auto_56196 ?auto_56200 ) ( CLEAR ?auto_56196 ) ( not ( = ?auto_56196 ?auto_56200 ) ) ( not ( = ?auto_56197 ?auto_56200 ) ) ( not ( = ?auto_56198 ?auto_56200 ) ) ( not ( = ?auto_56202 ?auto_56200 ) ) ( not ( = ?auto_56201 ?auto_56200 ) ) ( not ( = ?auto_56199 ?auto_56200 ) ) ( HOLDING ?auto_56197 ) ( CLEAR ?auto_56198 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56201 ?auto_56199 ?auto_56202 ?auto_56198 ?auto_56197 )
      ( MAKE-3PILE ?auto_56196 ?auto_56197 ?auto_56198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56203 - BLOCK
      ?auto_56204 - BLOCK
      ?auto_56205 - BLOCK
    )
    :vars
    (
      ?auto_56207 - BLOCK
      ?auto_56208 - BLOCK
      ?auto_56206 - BLOCK
      ?auto_56209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56203 ?auto_56204 ) ) ( not ( = ?auto_56203 ?auto_56205 ) ) ( not ( = ?auto_56204 ?auto_56205 ) ) ( ON ?auto_56205 ?auto_56207 ) ( not ( = ?auto_56203 ?auto_56207 ) ) ( not ( = ?auto_56204 ?auto_56207 ) ) ( not ( = ?auto_56205 ?auto_56207 ) ) ( ON-TABLE ?auto_56208 ) ( ON ?auto_56206 ?auto_56208 ) ( ON ?auto_56207 ?auto_56206 ) ( not ( = ?auto_56208 ?auto_56206 ) ) ( not ( = ?auto_56208 ?auto_56207 ) ) ( not ( = ?auto_56208 ?auto_56205 ) ) ( not ( = ?auto_56208 ?auto_56204 ) ) ( not ( = ?auto_56206 ?auto_56207 ) ) ( not ( = ?auto_56206 ?auto_56205 ) ) ( not ( = ?auto_56206 ?auto_56204 ) ) ( not ( = ?auto_56203 ?auto_56208 ) ) ( not ( = ?auto_56203 ?auto_56206 ) ) ( ON ?auto_56203 ?auto_56209 ) ( not ( = ?auto_56203 ?auto_56209 ) ) ( not ( = ?auto_56204 ?auto_56209 ) ) ( not ( = ?auto_56205 ?auto_56209 ) ) ( not ( = ?auto_56207 ?auto_56209 ) ) ( not ( = ?auto_56208 ?auto_56209 ) ) ( not ( = ?auto_56206 ?auto_56209 ) ) ( CLEAR ?auto_56205 ) ( ON ?auto_56204 ?auto_56203 ) ( CLEAR ?auto_56204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56209 ?auto_56203 )
      ( MAKE-3PILE ?auto_56203 ?auto_56204 ?auto_56205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56210 - BLOCK
      ?auto_56211 - BLOCK
      ?auto_56212 - BLOCK
    )
    :vars
    (
      ?auto_56215 - BLOCK
      ?auto_56213 - BLOCK
      ?auto_56214 - BLOCK
      ?auto_56216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56210 ?auto_56211 ) ) ( not ( = ?auto_56210 ?auto_56212 ) ) ( not ( = ?auto_56211 ?auto_56212 ) ) ( not ( = ?auto_56210 ?auto_56215 ) ) ( not ( = ?auto_56211 ?auto_56215 ) ) ( not ( = ?auto_56212 ?auto_56215 ) ) ( ON-TABLE ?auto_56213 ) ( ON ?auto_56214 ?auto_56213 ) ( ON ?auto_56215 ?auto_56214 ) ( not ( = ?auto_56213 ?auto_56214 ) ) ( not ( = ?auto_56213 ?auto_56215 ) ) ( not ( = ?auto_56213 ?auto_56212 ) ) ( not ( = ?auto_56213 ?auto_56211 ) ) ( not ( = ?auto_56214 ?auto_56215 ) ) ( not ( = ?auto_56214 ?auto_56212 ) ) ( not ( = ?auto_56214 ?auto_56211 ) ) ( not ( = ?auto_56210 ?auto_56213 ) ) ( not ( = ?auto_56210 ?auto_56214 ) ) ( ON ?auto_56210 ?auto_56216 ) ( not ( = ?auto_56210 ?auto_56216 ) ) ( not ( = ?auto_56211 ?auto_56216 ) ) ( not ( = ?auto_56212 ?auto_56216 ) ) ( not ( = ?auto_56215 ?auto_56216 ) ) ( not ( = ?auto_56213 ?auto_56216 ) ) ( not ( = ?auto_56214 ?auto_56216 ) ) ( ON ?auto_56211 ?auto_56210 ) ( CLEAR ?auto_56211 ) ( ON-TABLE ?auto_56216 ) ( HOLDING ?auto_56212 ) ( CLEAR ?auto_56215 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56213 ?auto_56214 ?auto_56215 ?auto_56212 )
      ( MAKE-3PILE ?auto_56210 ?auto_56211 ?auto_56212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56217 - BLOCK
      ?auto_56218 - BLOCK
      ?auto_56219 - BLOCK
    )
    :vars
    (
      ?auto_56220 - BLOCK
      ?auto_56223 - BLOCK
      ?auto_56221 - BLOCK
      ?auto_56222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56217 ?auto_56218 ) ) ( not ( = ?auto_56217 ?auto_56219 ) ) ( not ( = ?auto_56218 ?auto_56219 ) ) ( not ( = ?auto_56217 ?auto_56220 ) ) ( not ( = ?auto_56218 ?auto_56220 ) ) ( not ( = ?auto_56219 ?auto_56220 ) ) ( ON-TABLE ?auto_56223 ) ( ON ?auto_56221 ?auto_56223 ) ( ON ?auto_56220 ?auto_56221 ) ( not ( = ?auto_56223 ?auto_56221 ) ) ( not ( = ?auto_56223 ?auto_56220 ) ) ( not ( = ?auto_56223 ?auto_56219 ) ) ( not ( = ?auto_56223 ?auto_56218 ) ) ( not ( = ?auto_56221 ?auto_56220 ) ) ( not ( = ?auto_56221 ?auto_56219 ) ) ( not ( = ?auto_56221 ?auto_56218 ) ) ( not ( = ?auto_56217 ?auto_56223 ) ) ( not ( = ?auto_56217 ?auto_56221 ) ) ( ON ?auto_56217 ?auto_56222 ) ( not ( = ?auto_56217 ?auto_56222 ) ) ( not ( = ?auto_56218 ?auto_56222 ) ) ( not ( = ?auto_56219 ?auto_56222 ) ) ( not ( = ?auto_56220 ?auto_56222 ) ) ( not ( = ?auto_56223 ?auto_56222 ) ) ( not ( = ?auto_56221 ?auto_56222 ) ) ( ON ?auto_56218 ?auto_56217 ) ( ON-TABLE ?auto_56222 ) ( CLEAR ?auto_56220 ) ( ON ?auto_56219 ?auto_56218 ) ( CLEAR ?auto_56219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56222 ?auto_56217 ?auto_56218 )
      ( MAKE-3PILE ?auto_56217 ?auto_56218 ?auto_56219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56224 - BLOCK
      ?auto_56225 - BLOCK
      ?auto_56226 - BLOCK
    )
    :vars
    (
      ?auto_56229 - BLOCK
      ?auto_56227 - BLOCK
      ?auto_56228 - BLOCK
      ?auto_56230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56224 ?auto_56225 ) ) ( not ( = ?auto_56224 ?auto_56226 ) ) ( not ( = ?auto_56225 ?auto_56226 ) ) ( not ( = ?auto_56224 ?auto_56229 ) ) ( not ( = ?auto_56225 ?auto_56229 ) ) ( not ( = ?auto_56226 ?auto_56229 ) ) ( ON-TABLE ?auto_56227 ) ( ON ?auto_56228 ?auto_56227 ) ( not ( = ?auto_56227 ?auto_56228 ) ) ( not ( = ?auto_56227 ?auto_56229 ) ) ( not ( = ?auto_56227 ?auto_56226 ) ) ( not ( = ?auto_56227 ?auto_56225 ) ) ( not ( = ?auto_56228 ?auto_56229 ) ) ( not ( = ?auto_56228 ?auto_56226 ) ) ( not ( = ?auto_56228 ?auto_56225 ) ) ( not ( = ?auto_56224 ?auto_56227 ) ) ( not ( = ?auto_56224 ?auto_56228 ) ) ( ON ?auto_56224 ?auto_56230 ) ( not ( = ?auto_56224 ?auto_56230 ) ) ( not ( = ?auto_56225 ?auto_56230 ) ) ( not ( = ?auto_56226 ?auto_56230 ) ) ( not ( = ?auto_56229 ?auto_56230 ) ) ( not ( = ?auto_56227 ?auto_56230 ) ) ( not ( = ?auto_56228 ?auto_56230 ) ) ( ON ?auto_56225 ?auto_56224 ) ( ON-TABLE ?auto_56230 ) ( ON ?auto_56226 ?auto_56225 ) ( CLEAR ?auto_56226 ) ( HOLDING ?auto_56229 ) ( CLEAR ?auto_56228 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56227 ?auto_56228 ?auto_56229 )
      ( MAKE-3PILE ?auto_56224 ?auto_56225 ?auto_56226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56231 - BLOCK
      ?auto_56232 - BLOCK
      ?auto_56233 - BLOCK
    )
    :vars
    (
      ?auto_56237 - BLOCK
      ?auto_56234 - BLOCK
      ?auto_56235 - BLOCK
      ?auto_56236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56231 ?auto_56232 ) ) ( not ( = ?auto_56231 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56233 ) ) ( not ( = ?auto_56231 ?auto_56237 ) ) ( not ( = ?auto_56232 ?auto_56237 ) ) ( not ( = ?auto_56233 ?auto_56237 ) ) ( ON-TABLE ?auto_56234 ) ( ON ?auto_56235 ?auto_56234 ) ( not ( = ?auto_56234 ?auto_56235 ) ) ( not ( = ?auto_56234 ?auto_56237 ) ) ( not ( = ?auto_56234 ?auto_56233 ) ) ( not ( = ?auto_56234 ?auto_56232 ) ) ( not ( = ?auto_56235 ?auto_56237 ) ) ( not ( = ?auto_56235 ?auto_56233 ) ) ( not ( = ?auto_56235 ?auto_56232 ) ) ( not ( = ?auto_56231 ?auto_56234 ) ) ( not ( = ?auto_56231 ?auto_56235 ) ) ( ON ?auto_56231 ?auto_56236 ) ( not ( = ?auto_56231 ?auto_56236 ) ) ( not ( = ?auto_56232 ?auto_56236 ) ) ( not ( = ?auto_56233 ?auto_56236 ) ) ( not ( = ?auto_56237 ?auto_56236 ) ) ( not ( = ?auto_56234 ?auto_56236 ) ) ( not ( = ?auto_56235 ?auto_56236 ) ) ( ON ?auto_56232 ?auto_56231 ) ( ON-TABLE ?auto_56236 ) ( ON ?auto_56233 ?auto_56232 ) ( CLEAR ?auto_56235 ) ( ON ?auto_56237 ?auto_56233 ) ( CLEAR ?auto_56237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56236 ?auto_56231 ?auto_56232 ?auto_56233 )
      ( MAKE-3PILE ?auto_56231 ?auto_56232 ?auto_56233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56238 - BLOCK
      ?auto_56239 - BLOCK
      ?auto_56240 - BLOCK
    )
    :vars
    (
      ?auto_56241 - BLOCK
      ?auto_56243 - BLOCK
      ?auto_56242 - BLOCK
      ?auto_56244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56238 ?auto_56239 ) ) ( not ( = ?auto_56238 ?auto_56240 ) ) ( not ( = ?auto_56239 ?auto_56240 ) ) ( not ( = ?auto_56238 ?auto_56241 ) ) ( not ( = ?auto_56239 ?auto_56241 ) ) ( not ( = ?auto_56240 ?auto_56241 ) ) ( ON-TABLE ?auto_56243 ) ( not ( = ?auto_56243 ?auto_56242 ) ) ( not ( = ?auto_56243 ?auto_56241 ) ) ( not ( = ?auto_56243 ?auto_56240 ) ) ( not ( = ?auto_56243 ?auto_56239 ) ) ( not ( = ?auto_56242 ?auto_56241 ) ) ( not ( = ?auto_56242 ?auto_56240 ) ) ( not ( = ?auto_56242 ?auto_56239 ) ) ( not ( = ?auto_56238 ?auto_56243 ) ) ( not ( = ?auto_56238 ?auto_56242 ) ) ( ON ?auto_56238 ?auto_56244 ) ( not ( = ?auto_56238 ?auto_56244 ) ) ( not ( = ?auto_56239 ?auto_56244 ) ) ( not ( = ?auto_56240 ?auto_56244 ) ) ( not ( = ?auto_56241 ?auto_56244 ) ) ( not ( = ?auto_56243 ?auto_56244 ) ) ( not ( = ?auto_56242 ?auto_56244 ) ) ( ON ?auto_56239 ?auto_56238 ) ( ON-TABLE ?auto_56244 ) ( ON ?auto_56240 ?auto_56239 ) ( ON ?auto_56241 ?auto_56240 ) ( CLEAR ?auto_56241 ) ( HOLDING ?auto_56242 ) ( CLEAR ?auto_56243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56243 ?auto_56242 )
      ( MAKE-3PILE ?auto_56238 ?auto_56239 ?auto_56240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56245 - BLOCK
      ?auto_56246 - BLOCK
      ?auto_56247 - BLOCK
    )
    :vars
    (
      ?auto_56251 - BLOCK
      ?auto_56249 - BLOCK
      ?auto_56250 - BLOCK
      ?auto_56248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56245 ?auto_56246 ) ) ( not ( = ?auto_56245 ?auto_56247 ) ) ( not ( = ?auto_56246 ?auto_56247 ) ) ( not ( = ?auto_56245 ?auto_56251 ) ) ( not ( = ?auto_56246 ?auto_56251 ) ) ( not ( = ?auto_56247 ?auto_56251 ) ) ( ON-TABLE ?auto_56249 ) ( not ( = ?auto_56249 ?auto_56250 ) ) ( not ( = ?auto_56249 ?auto_56251 ) ) ( not ( = ?auto_56249 ?auto_56247 ) ) ( not ( = ?auto_56249 ?auto_56246 ) ) ( not ( = ?auto_56250 ?auto_56251 ) ) ( not ( = ?auto_56250 ?auto_56247 ) ) ( not ( = ?auto_56250 ?auto_56246 ) ) ( not ( = ?auto_56245 ?auto_56249 ) ) ( not ( = ?auto_56245 ?auto_56250 ) ) ( ON ?auto_56245 ?auto_56248 ) ( not ( = ?auto_56245 ?auto_56248 ) ) ( not ( = ?auto_56246 ?auto_56248 ) ) ( not ( = ?auto_56247 ?auto_56248 ) ) ( not ( = ?auto_56251 ?auto_56248 ) ) ( not ( = ?auto_56249 ?auto_56248 ) ) ( not ( = ?auto_56250 ?auto_56248 ) ) ( ON ?auto_56246 ?auto_56245 ) ( ON-TABLE ?auto_56248 ) ( ON ?auto_56247 ?auto_56246 ) ( ON ?auto_56251 ?auto_56247 ) ( CLEAR ?auto_56249 ) ( ON ?auto_56250 ?auto_56251 ) ( CLEAR ?auto_56250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56248 ?auto_56245 ?auto_56246 ?auto_56247 ?auto_56251 )
      ( MAKE-3PILE ?auto_56245 ?auto_56246 ?auto_56247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56252 - BLOCK
      ?auto_56253 - BLOCK
      ?auto_56254 - BLOCK
    )
    :vars
    (
      ?auto_56256 - BLOCK
      ?auto_56258 - BLOCK
      ?auto_56255 - BLOCK
      ?auto_56257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56252 ?auto_56253 ) ) ( not ( = ?auto_56252 ?auto_56254 ) ) ( not ( = ?auto_56253 ?auto_56254 ) ) ( not ( = ?auto_56252 ?auto_56256 ) ) ( not ( = ?auto_56253 ?auto_56256 ) ) ( not ( = ?auto_56254 ?auto_56256 ) ) ( not ( = ?auto_56258 ?auto_56255 ) ) ( not ( = ?auto_56258 ?auto_56256 ) ) ( not ( = ?auto_56258 ?auto_56254 ) ) ( not ( = ?auto_56258 ?auto_56253 ) ) ( not ( = ?auto_56255 ?auto_56256 ) ) ( not ( = ?auto_56255 ?auto_56254 ) ) ( not ( = ?auto_56255 ?auto_56253 ) ) ( not ( = ?auto_56252 ?auto_56258 ) ) ( not ( = ?auto_56252 ?auto_56255 ) ) ( ON ?auto_56252 ?auto_56257 ) ( not ( = ?auto_56252 ?auto_56257 ) ) ( not ( = ?auto_56253 ?auto_56257 ) ) ( not ( = ?auto_56254 ?auto_56257 ) ) ( not ( = ?auto_56256 ?auto_56257 ) ) ( not ( = ?auto_56258 ?auto_56257 ) ) ( not ( = ?auto_56255 ?auto_56257 ) ) ( ON ?auto_56253 ?auto_56252 ) ( ON-TABLE ?auto_56257 ) ( ON ?auto_56254 ?auto_56253 ) ( ON ?auto_56256 ?auto_56254 ) ( ON ?auto_56255 ?auto_56256 ) ( CLEAR ?auto_56255 ) ( HOLDING ?auto_56258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56258 )
      ( MAKE-3PILE ?auto_56252 ?auto_56253 ?auto_56254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56259 - BLOCK
      ?auto_56260 - BLOCK
      ?auto_56261 - BLOCK
    )
    :vars
    (
      ?auto_56265 - BLOCK
      ?auto_56264 - BLOCK
      ?auto_56262 - BLOCK
      ?auto_56263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56259 ?auto_56260 ) ) ( not ( = ?auto_56259 ?auto_56261 ) ) ( not ( = ?auto_56260 ?auto_56261 ) ) ( not ( = ?auto_56259 ?auto_56265 ) ) ( not ( = ?auto_56260 ?auto_56265 ) ) ( not ( = ?auto_56261 ?auto_56265 ) ) ( not ( = ?auto_56264 ?auto_56262 ) ) ( not ( = ?auto_56264 ?auto_56265 ) ) ( not ( = ?auto_56264 ?auto_56261 ) ) ( not ( = ?auto_56264 ?auto_56260 ) ) ( not ( = ?auto_56262 ?auto_56265 ) ) ( not ( = ?auto_56262 ?auto_56261 ) ) ( not ( = ?auto_56262 ?auto_56260 ) ) ( not ( = ?auto_56259 ?auto_56264 ) ) ( not ( = ?auto_56259 ?auto_56262 ) ) ( ON ?auto_56259 ?auto_56263 ) ( not ( = ?auto_56259 ?auto_56263 ) ) ( not ( = ?auto_56260 ?auto_56263 ) ) ( not ( = ?auto_56261 ?auto_56263 ) ) ( not ( = ?auto_56265 ?auto_56263 ) ) ( not ( = ?auto_56264 ?auto_56263 ) ) ( not ( = ?auto_56262 ?auto_56263 ) ) ( ON ?auto_56260 ?auto_56259 ) ( ON-TABLE ?auto_56263 ) ( ON ?auto_56261 ?auto_56260 ) ( ON ?auto_56265 ?auto_56261 ) ( ON ?auto_56262 ?auto_56265 ) ( ON ?auto_56264 ?auto_56262 ) ( CLEAR ?auto_56264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56263 ?auto_56259 ?auto_56260 ?auto_56261 ?auto_56265 ?auto_56262 )
      ( MAKE-3PILE ?auto_56259 ?auto_56260 ?auto_56261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56281 - BLOCK
      ?auto_56282 - BLOCK
    )
    :vars
    (
      ?auto_56285 - BLOCK
      ?auto_56283 - BLOCK
      ?auto_56284 - BLOCK
      ?auto_56286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56285 ?auto_56282 ) ( ON-TABLE ?auto_56281 ) ( ON ?auto_56282 ?auto_56281 ) ( not ( = ?auto_56281 ?auto_56282 ) ) ( not ( = ?auto_56281 ?auto_56285 ) ) ( not ( = ?auto_56282 ?auto_56285 ) ) ( not ( = ?auto_56281 ?auto_56283 ) ) ( not ( = ?auto_56281 ?auto_56284 ) ) ( not ( = ?auto_56282 ?auto_56283 ) ) ( not ( = ?auto_56282 ?auto_56284 ) ) ( not ( = ?auto_56285 ?auto_56283 ) ) ( not ( = ?auto_56285 ?auto_56284 ) ) ( not ( = ?auto_56283 ?auto_56284 ) ) ( ON ?auto_56283 ?auto_56285 ) ( CLEAR ?auto_56283 ) ( HOLDING ?auto_56284 ) ( CLEAR ?auto_56286 ) ( ON-TABLE ?auto_56286 ) ( not ( = ?auto_56286 ?auto_56284 ) ) ( not ( = ?auto_56281 ?auto_56286 ) ) ( not ( = ?auto_56282 ?auto_56286 ) ) ( not ( = ?auto_56285 ?auto_56286 ) ) ( not ( = ?auto_56283 ?auto_56286 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56286 ?auto_56284 )
      ( MAKE-2PILE ?auto_56281 ?auto_56282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56287 - BLOCK
      ?auto_56288 - BLOCK
    )
    :vars
    (
      ?auto_56289 - BLOCK
      ?auto_56292 - BLOCK
      ?auto_56290 - BLOCK
      ?auto_56291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56289 ?auto_56288 ) ( ON-TABLE ?auto_56287 ) ( ON ?auto_56288 ?auto_56287 ) ( not ( = ?auto_56287 ?auto_56288 ) ) ( not ( = ?auto_56287 ?auto_56289 ) ) ( not ( = ?auto_56288 ?auto_56289 ) ) ( not ( = ?auto_56287 ?auto_56292 ) ) ( not ( = ?auto_56287 ?auto_56290 ) ) ( not ( = ?auto_56288 ?auto_56292 ) ) ( not ( = ?auto_56288 ?auto_56290 ) ) ( not ( = ?auto_56289 ?auto_56292 ) ) ( not ( = ?auto_56289 ?auto_56290 ) ) ( not ( = ?auto_56292 ?auto_56290 ) ) ( ON ?auto_56292 ?auto_56289 ) ( CLEAR ?auto_56291 ) ( ON-TABLE ?auto_56291 ) ( not ( = ?auto_56291 ?auto_56290 ) ) ( not ( = ?auto_56287 ?auto_56291 ) ) ( not ( = ?auto_56288 ?auto_56291 ) ) ( not ( = ?auto_56289 ?auto_56291 ) ) ( not ( = ?auto_56292 ?auto_56291 ) ) ( ON ?auto_56290 ?auto_56292 ) ( CLEAR ?auto_56290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56287 ?auto_56288 ?auto_56289 ?auto_56292 )
      ( MAKE-2PILE ?auto_56287 ?auto_56288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56293 - BLOCK
      ?auto_56294 - BLOCK
    )
    :vars
    (
      ?auto_56295 - BLOCK
      ?auto_56298 - BLOCK
      ?auto_56297 - BLOCK
      ?auto_56296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56295 ?auto_56294 ) ( ON-TABLE ?auto_56293 ) ( ON ?auto_56294 ?auto_56293 ) ( not ( = ?auto_56293 ?auto_56294 ) ) ( not ( = ?auto_56293 ?auto_56295 ) ) ( not ( = ?auto_56294 ?auto_56295 ) ) ( not ( = ?auto_56293 ?auto_56298 ) ) ( not ( = ?auto_56293 ?auto_56297 ) ) ( not ( = ?auto_56294 ?auto_56298 ) ) ( not ( = ?auto_56294 ?auto_56297 ) ) ( not ( = ?auto_56295 ?auto_56298 ) ) ( not ( = ?auto_56295 ?auto_56297 ) ) ( not ( = ?auto_56298 ?auto_56297 ) ) ( ON ?auto_56298 ?auto_56295 ) ( not ( = ?auto_56296 ?auto_56297 ) ) ( not ( = ?auto_56293 ?auto_56296 ) ) ( not ( = ?auto_56294 ?auto_56296 ) ) ( not ( = ?auto_56295 ?auto_56296 ) ) ( not ( = ?auto_56298 ?auto_56296 ) ) ( ON ?auto_56297 ?auto_56298 ) ( CLEAR ?auto_56297 ) ( HOLDING ?auto_56296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56296 )
      ( MAKE-2PILE ?auto_56293 ?auto_56294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56307 - BLOCK
      ?auto_56308 - BLOCK
    )
    :vars
    (
      ?auto_56311 - BLOCK
      ?auto_56309 - BLOCK
      ?auto_56312 - BLOCK
      ?auto_56310 - BLOCK
      ?auto_56313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56311 ?auto_56308 ) ( ON-TABLE ?auto_56307 ) ( ON ?auto_56308 ?auto_56307 ) ( not ( = ?auto_56307 ?auto_56308 ) ) ( not ( = ?auto_56307 ?auto_56311 ) ) ( not ( = ?auto_56308 ?auto_56311 ) ) ( not ( = ?auto_56307 ?auto_56309 ) ) ( not ( = ?auto_56307 ?auto_56312 ) ) ( not ( = ?auto_56308 ?auto_56309 ) ) ( not ( = ?auto_56308 ?auto_56312 ) ) ( not ( = ?auto_56311 ?auto_56309 ) ) ( not ( = ?auto_56311 ?auto_56312 ) ) ( not ( = ?auto_56309 ?auto_56312 ) ) ( ON ?auto_56309 ?auto_56311 ) ( not ( = ?auto_56310 ?auto_56312 ) ) ( not ( = ?auto_56307 ?auto_56310 ) ) ( not ( = ?auto_56308 ?auto_56310 ) ) ( not ( = ?auto_56311 ?auto_56310 ) ) ( not ( = ?auto_56309 ?auto_56310 ) ) ( ON ?auto_56312 ?auto_56309 ) ( CLEAR ?auto_56312 ) ( ON ?auto_56310 ?auto_56313 ) ( CLEAR ?auto_56310 ) ( HAND-EMPTY ) ( not ( = ?auto_56307 ?auto_56313 ) ) ( not ( = ?auto_56308 ?auto_56313 ) ) ( not ( = ?auto_56311 ?auto_56313 ) ) ( not ( = ?auto_56309 ?auto_56313 ) ) ( not ( = ?auto_56312 ?auto_56313 ) ) ( not ( = ?auto_56310 ?auto_56313 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56310 ?auto_56313 )
      ( MAKE-2PILE ?auto_56307 ?auto_56308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56314 - BLOCK
      ?auto_56315 - BLOCK
    )
    :vars
    (
      ?auto_56319 - BLOCK
      ?auto_56318 - BLOCK
      ?auto_56320 - BLOCK
      ?auto_56317 - BLOCK
      ?auto_56316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56319 ?auto_56315 ) ( ON-TABLE ?auto_56314 ) ( ON ?auto_56315 ?auto_56314 ) ( not ( = ?auto_56314 ?auto_56315 ) ) ( not ( = ?auto_56314 ?auto_56319 ) ) ( not ( = ?auto_56315 ?auto_56319 ) ) ( not ( = ?auto_56314 ?auto_56318 ) ) ( not ( = ?auto_56314 ?auto_56320 ) ) ( not ( = ?auto_56315 ?auto_56318 ) ) ( not ( = ?auto_56315 ?auto_56320 ) ) ( not ( = ?auto_56319 ?auto_56318 ) ) ( not ( = ?auto_56319 ?auto_56320 ) ) ( not ( = ?auto_56318 ?auto_56320 ) ) ( ON ?auto_56318 ?auto_56319 ) ( not ( = ?auto_56317 ?auto_56320 ) ) ( not ( = ?auto_56314 ?auto_56317 ) ) ( not ( = ?auto_56315 ?auto_56317 ) ) ( not ( = ?auto_56319 ?auto_56317 ) ) ( not ( = ?auto_56318 ?auto_56317 ) ) ( ON ?auto_56317 ?auto_56316 ) ( CLEAR ?auto_56317 ) ( not ( = ?auto_56314 ?auto_56316 ) ) ( not ( = ?auto_56315 ?auto_56316 ) ) ( not ( = ?auto_56319 ?auto_56316 ) ) ( not ( = ?auto_56318 ?auto_56316 ) ) ( not ( = ?auto_56320 ?auto_56316 ) ) ( not ( = ?auto_56317 ?auto_56316 ) ) ( HOLDING ?auto_56320 ) ( CLEAR ?auto_56318 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56314 ?auto_56315 ?auto_56319 ?auto_56318 ?auto_56320 )
      ( MAKE-2PILE ?auto_56314 ?auto_56315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56360 - BLOCK
      ?auto_56361 - BLOCK
      ?auto_56362 - BLOCK
      ?auto_56363 - BLOCK
    )
    :vars
    (
      ?auto_56364 - BLOCK
      ?auto_56365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56360 ) ( ON ?auto_56361 ?auto_56360 ) ( not ( = ?auto_56360 ?auto_56361 ) ) ( not ( = ?auto_56360 ?auto_56362 ) ) ( not ( = ?auto_56360 ?auto_56363 ) ) ( not ( = ?auto_56361 ?auto_56362 ) ) ( not ( = ?auto_56361 ?auto_56363 ) ) ( not ( = ?auto_56362 ?auto_56363 ) ) ( ON ?auto_56363 ?auto_56364 ) ( not ( = ?auto_56360 ?auto_56364 ) ) ( not ( = ?auto_56361 ?auto_56364 ) ) ( not ( = ?auto_56362 ?auto_56364 ) ) ( not ( = ?auto_56363 ?auto_56364 ) ) ( CLEAR ?auto_56361 ) ( ON ?auto_56362 ?auto_56363 ) ( CLEAR ?auto_56362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56365 ) ( ON ?auto_56364 ?auto_56365 ) ( not ( = ?auto_56365 ?auto_56364 ) ) ( not ( = ?auto_56365 ?auto_56363 ) ) ( not ( = ?auto_56365 ?auto_56362 ) ) ( not ( = ?auto_56360 ?auto_56365 ) ) ( not ( = ?auto_56361 ?auto_56365 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56365 ?auto_56364 ?auto_56363 )
      ( MAKE-4PILE ?auto_56360 ?auto_56361 ?auto_56362 ?auto_56363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56366 - BLOCK
      ?auto_56367 - BLOCK
      ?auto_56368 - BLOCK
      ?auto_56369 - BLOCK
    )
    :vars
    (
      ?auto_56371 - BLOCK
      ?auto_56370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56366 ) ( not ( = ?auto_56366 ?auto_56367 ) ) ( not ( = ?auto_56366 ?auto_56368 ) ) ( not ( = ?auto_56366 ?auto_56369 ) ) ( not ( = ?auto_56367 ?auto_56368 ) ) ( not ( = ?auto_56367 ?auto_56369 ) ) ( not ( = ?auto_56368 ?auto_56369 ) ) ( ON ?auto_56369 ?auto_56371 ) ( not ( = ?auto_56366 ?auto_56371 ) ) ( not ( = ?auto_56367 ?auto_56371 ) ) ( not ( = ?auto_56368 ?auto_56371 ) ) ( not ( = ?auto_56369 ?auto_56371 ) ) ( ON ?auto_56368 ?auto_56369 ) ( CLEAR ?auto_56368 ) ( ON-TABLE ?auto_56370 ) ( ON ?auto_56371 ?auto_56370 ) ( not ( = ?auto_56370 ?auto_56371 ) ) ( not ( = ?auto_56370 ?auto_56369 ) ) ( not ( = ?auto_56370 ?auto_56368 ) ) ( not ( = ?auto_56366 ?auto_56370 ) ) ( not ( = ?auto_56367 ?auto_56370 ) ) ( HOLDING ?auto_56367 ) ( CLEAR ?auto_56366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56366 ?auto_56367 )
      ( MAKE-4PILE ?auto_56366 ?auto_56367 ?auto_56368 ?auto_56369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56372 - BLOCK
      ?auto_56373 - BLOCK
      ?auto_56374 - BLOCK
      ?auto_56375 - BLOCK
    )
    :vars
    (
      ?auto_56377 - BLOCK
      ?auto_56376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56372 ) ( not ( = ?auto_56372 ?auto_56373 ) ) ( not ( = ?auto_56372 ?auto_56374 ) ) ( not ( = ?auto_56372 ?auto_56375 ) ) ( not ( = ?auto_56373 ?auto_56374 ) ) ( not ( = ?auto_56373 ?auto_56375 ) ) ( not ( = ?auto_56374 ?auto_56375 ) ) ( ON ?auto_56375 ?auto_56377 ) ( not ( = ?auto_56372 ?auto_56377 ) ) ( not ( = ?auto_56373 ?auto_56377 ) ) ( not ( = ?auto_56374 ?auto_56377 ) ) ( not ( = ?auto_56375 ?auto_56377 ) ) ( ON ?auto_56374 ?auto_56375 ) ( ON-TABLE ?auto_56376 ) ( ON ?auto_56377 ?auto_56376 ) ( not ( = ?auto_56376 ?auto_56377 ) ) ( not ( = ?auto_56376 ?auto_56375 ) ) ( not ( = ?auto_56376 ?auto_56374 ) ) ( not ( = ?auto_56372 ?auto_56376 ) ) ( not ( = ?auto_56373 ?auto_56376 ) ) ( CLEAR ?auto_56372 ) ( ON ?auto_56373 ?auto_56374 ) ( CLEAR ?auto_56373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56376 ?auto_56377 ?auto_56375 ?auto_56374 )
      ( MAKE-4PILE ?auto_56372 ?auto_56373 ?auto_56374 ?auto_56375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56378 - BLOCK
      ?auto_56379 - BLOCK
      ?auto_56380 - BLOCK
      ?auto_56381 - BLOCK
    )
    :vars
    (
      ?auto_56382 - BLOCK
      ?auto_56383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56378 ?auto_56379 ) ) ( not ( = ?auto_56378 ?auto_56380 ) ) ( not ( = ?auto_56378 ?auto_56381 ) ) ( not ( = ?auto_56379 ?auto_56380 ) ) ( not ( = ?auto_56379 ?auto_56381 ) ) ( not ( = ?auto_56380 ?auto_56381 ) ) ( ON ?auto_56381 ?auto_56382 ) ( not ( = ?auto_56378 ?auto_56382 ) ) ( not ( = ?auto_56379 ?auto_56382 ) ) ( not ( = ?auto_56380 ?auto_56382 ) ) ( not ( = ?auto_56381 ?auto_56382 ) ) ( ON ?auto_56380 ?auto_56381 ) ( ON-TABLE ?auto_56383 ) ( ON ?auto_56382 ?auto_56383 ) ( not ( = ?auto_56383 ?auto_56382 ) ) ( not ( = ?auto_56383 ?auto_56381 ) ) ( not ( = ?auto_56383 ?auto_56380 ) ) ( not ( = ?auto_56378 ?auto_56383 ) ) ( not ( = ?auto_56379 ?auto_56383 ) ) ( ON ?auto_56379 ?auto_56380 ) ( CLEAR ?auto_56379 ) ( HOLDING ?auto_56378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56378 )
      ( MAKE-4PILE ?auto_56378 ?auto_56379 ?auto_56380 ?auto_56381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56384 - BLOCK
      ?auto_56385 - BLOCK
      ?auto_56386 - BLOCK
      ?auto_56387 - BLOCK
    )
    :vars
    (
      ?auto_56389 - BLOCK
      ?auto_56388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56384 ?auto_56385 ) ) ( not ( = ?auto_56384 ?auto_56386 ) ) ( not ( = ?auto_56384 ?auto_56387 ) ) ( not ( = ?auto_56385 ?auto_56386 ) ) ( not ( = ?auto_56385 ?auto_56387 ) ) ( not ( = ?auto_56386 ?auto_56387 ) ) ( ON ?auto_56387 ?auto_56389 ) ( not ( = ?auto_56384 ?auto_56389 ) ) ( not ( = ?auto_56385 ?auto_56389 ) ) ( not ( = ?auto_56386 ?auto_56389 ) ) ( not ( = ?auto_56387 ?auto_56389 ) ) ( ON ?auto_56386 ?auto_56387 ) ( ON-TABLE ?auto_56388 ) ( ON ?auto_56389 ?auto_56388 ) ( not ( = ?auto_56388 ?auto_56389 ) ) ( not ( = ?auto_56388 ?auto_56387 ) ) ( not ( = ?auto_56388 ?auto_56386 ) ) ( not ( = ?auto_56384 ?auto_56388 ) ) ( not ( = ?auto_56385 ?auto_56388 ) ) ( ON ?auto_56385 ?auto_56386 ) ( ON ?auto_56384 ?auto_56385 ) ( CLEAR ?auto_56384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56388 ?auto_56389 ?auto_56387 ?auto_56386 ?auto_56385 )
      ( MAKE-4PILE ?auto_56384 ?auto_56385 ?auto_56386 ?auto_56387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56394 - BLOCK
      ?auto_56395 - BLOCK
      ?auto_56396 - BLOCK
      ?auto_56397 - BLOCK
    )
    :vars
    (
      ?auto_56399 - BLOCK
      ?auto_56398 - BLOCK
      ?auto_56400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56394 ?auto_56395 ) ) ( not ( = ?auto_56394 ?auto_56396 ) ) ( not ( = ?auto_56394 ?auto_56397 ) ) ( not ( = ?auto_56395 ?auto_56396 ) ) ( not ( = ?auto_56395 ?auto_56397 ) ) ( not ( = ?auto_56396 ?auto_56397 ) ) ( ON ?auto_56397 ?auto_56399 ) ( not ( = ?auto_56394 ?auto_56399 ) ) ( not ( = ?auto_56395 ?auto_56399 ) ) ( not ( = ?auto_56396 ?auto_56399 ) ) ( not ( = ?auto_56397 ?auto_56399 ) ) ( ON ?auto_56396 ?auto_56397 ) ( ON-TABLE ?auto_56398 ) ( ON ?auto_56399 ?auto_56398 ) ( not ( = ?auto_56398 ?auto_56399 ) ) ( not ( = ?auto_56398 ?auto_56397 ) ) ( not ( = ?auto_56398 ?auto_56396 ) ) ( not ( = ?auto_56394 ?auto_56398 ) ) ( not ( = ?auto_56395 ?auto_56398 ) ) ( ON ?auto_56395 ?auto_56396 ) ( CLEAR ?auto_56395 ) ( ON ?auto_56394 ?auto_56400 ) ( CLEAR ?auto_56394 ) ( HAND-EMPTY ) ( not ( = ?auto_56394 ?auto_56400 ) ) ( not ( = ?auto_56395 ?auto_56400 ) ) ( not ( = ?auto_56396 ?auto_56400 ) ) ( not ( = ?auto_56397 ?auto_56400 ) ) ( not ( = ?auto_56399 ?auto_56400 ) ) ( not ( = ?auto_56398 ?auto_56400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56394 ?auto_56400 )
      ( MAKE-4PILE ?auto_56394 ?auto_56395 ?auto_56396 ?auto_56397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56401 - BLOCK
      ?auto_56402 - BLOCK
      ?auto_56403 - BLOCK
      ?auto_56404 - BLOCK
    )
    :vars
    (
      ?auto_56405 - BLOCK
      ?auto_56407 - BLOCK
      ?auto_56406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56401 ?auto_56402 ) ) ( not ( = ?auto_56401 ?auto_56403 ) ) ( not ( = ?auto_56401 ?auto_56404 ) ) ( not ( = ?auto_56402 ?auto_56403 ) ) ( not ( = ?auto_56402 ?auto_56404 ) ) ( not ( = ?auto_56403 ?auto_56404 ) ) ( ON ?auto_56404 ?auto_56405 ) ( not ( = ?auto_56401 ?auto_56405 ) ) ( not ( = ?auto_56402 ?auto_56405 ) ) ( not ( = ?auto_56403 ?auto_56405 ) ) ( not ( = ?auto_56404 ?auto_56405 ) ) ( ON ?auto_56403 ?auto_56404 ) ( ON-TABLE ?auto_56407 ) ( ON ?auto_56405 ?auto_56407 ) ( not ( = ?auto_56407 ?auto_56405 ) ) ( not ( = ?auto_56407 ?auto_56404 ) ) ( not ( = ?auto_56407 ?auto_56403 ) ) ( not ( = ?auto_56401 ?auto_56407 ) ) ( not ( = ?auto_56402 ?auto_56407 ) ) ( ON ?auto_56401 ?auto_56406 ) ( CLEAR ?auto_56401 ) ( not ( = ?auto_56401 ?auto_56406 ) ) ( not ( = ?auto_56402 ?auto_56406 ) ) ( not ( = ?auto_56403 ?auto_56406 ) ) ( not ( = ?auto_56404 ?auto_56406 ) ) ( not ( = ?auto_56405 ?auto_56406 ) ) ( not ( = ?auto_56407 ?auto_56406 ) ) ( HOLDING ?auto_56402 ) ( CLEAR ?auto_56403 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56407 ?auto_56405 ?auto_56404 ?auto_56403 ?auto_56402 )
      ( MAKE-4PILE ?auto_56401 ?auto_56402 ?auto_56403 ?auto_56404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56408 - BLOCK
      ?auto_56409 - BLOCK
      ?auto_56410 - BLOCK
      ?auto_56411 - BLOCK
    )
    :vars
    (
      ?auto_56412 - BLOCK
      ?auto_56413 - BLOCK
      ?auto_56414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56408 ?auto_56409 ) ) ( not ( = ?auto_56408 ?auto_56410 ) ) ( not ( = ?auto_56408 ?auto_56411 ) ) ( not ( = ?auto_56409 ?auto_56410 ) ) ( not ( = ?auto_56409 ?auto_56411 ) ) ( not ( = ?auto_56410 ?auto_56411 ) ) ( ON ?auto_56411 ?auto_56412 ) ( not ( = ?auto_56408 ?auto_56412 ) ) ( not ( = ?auto_56409 ?auto_56412 ) ) ( not ( = ?auto_56410 ?auto_56412 ) ) ( not ( = ?auto_56411 ?auto_56412 ) ) ( ON ?auto_56410 ?auto_56411 ) ( ON-TABLE ?auto_56413 ) ( ON ?auto_56412 ?auto_56413 ) ( not ( = ?auto_56413 ?auto_56412 ) ) ( not ( = ?auto_56413 ?auto_56411 ) ) ( not ( = ?auto_56413 ?auto_56410 ) ) ( not ( = ?auto_56408 ?auto_56413 ) ) ( not ( = ?auto_56409 ?auto_56413 ) ) ( ON ?auto_56408 ?auto_56414 ) ( not ( = ?auto_56408 ?auto_56414 ) ) ( not ( = ?auto_56409 ?auto_56414 ) ) ( not ( = ?auto_56410 ?auto_56414 ) ) ( not ( = ?auto_56411 ?auto_56414 ) ) ( not ( = ?auto_56412 ?auto_56414 ) ) ( not ( = ?auto_56413 ?auto_56414 ) ) ( CLEAR ?auto_56410 ) ( ON ?auto_56409 ?auto_56408 ) ( CLEAR ?auto_56409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56414 ?auto_56408 )
      ( MAKE-4PILE ?auto_56408 ?auto_56409 ?auto_56410 ?auto_56411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56415 - BLOCK
      ?auto_56416 - BLOCK
      ?auto_56417 - BLOCK
      ?auto_56418 - BLOCK
    )
    :vars
    (
      ?auto_56420 - BLOCK
      ?auto_56421 - BLOCK
      ?auto_56419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56415 ?auto_56416 ) ) ( not ( = ?auto_56415 ?auto_56417 ) ) ( not ( = ?auto_56415 ?auto_56418 ) ) ( not ( = ?auto_56416 ?auto_56417 ) ) ( not ( = ?auto_56416 ?auto_56418 ) ) ( not ( = ?auto_56417 ?auto_56418 ) ) ( ON ?auto_56418 ?auto_56420 ) ( not ( = ?auto_56415 ?auto_56420 ) ) ( not ( = ?auto_56416 ?auto_56420 ) ) ( not ( = ?auto_56417 ?auto_56420 ) ) ( not ( = ?auto_56418 ?auto_56420 ) ) ( ON-TABLE ?auto_56421 ) ( ON ?auto_56420 ?auto_56421 ) ( not ( = ?auto_56421 ?auto_56420 ) ) ( not ( = ?auto_56421 ?auto_56418 ) ) ( not ( = ?auto_56421 ?auto_56417 ) ) ( not ( = ?auto_56415 ?auto_56421 ) ) ( not ( = ?auto_56416 ?auto_56421 ) ) ( ON ?auto_56415 ?auto_56419 ) ( not ( = ?auto_56415 ?auto_56419 ) ) ( not ( = ?auto_56416 ?auto_56419 ) ) ( not ( = ?auto_56417 ?auto_56419 ) ) ( not ( = ?auto_56418 ?auto_56419 ) ) ( not ( = ?auto_56420 ?auto_56419 ) ) ( not ( = ?auto_56421 ?auto_56419 ) ) ( ON ?auto_56416 ?auto_56415 ) ( CLEAR ?auto_56416 ) ( ON-TABLE ?auto_56419 ) ( HOLDING ?auto_56417 ) ( CLEAR ?auto_56418 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56421 ?auto_56420 ?auto_56418 ?auto_56417 )
      ( MAKE-4PILE ?auto_56415 ?auto_56416 ?auto_56417 ?auto_56418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56422 - BLOCK
      ?auto_56423 - BLOCK
      ?auto_56424 - BLOCK
      ?auto_56425 - BLOCK
    )
    :vars
    (
      ?auto_56426 - BLOCK
      ?auto_56428 - BLOCK
      ?auto_56427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56422 ?auto_56423 ) ) ( not ( = ?auto_56422 ?auto_56424 ) ) ( not ( = ?auto_56422 ?auto_56425 ) ) ( not ( = ?auto_56423 ?auto_56424 ) ) ( not ( = ?auto_56423 ?auto_56425 ) ) ( not ( = ?auto_56424 ?auto_56425 ) ) ( ON ?auto_56425 ?auto_56426 ) ( not ( = ?auto_56422 ?auto_56426 ) ) ( not ( = ?auto_56423 ?auto_56426 ) ) ( not ( = ?auto_56424 ?auto_56426 ) ) ( not ( = ?auto_56425 ?auto_56426 ) ) ( ON-TABLE ?auto_56428 ) ( ON ?auto_56426 ?auto_56428 ) ( not ( = ?auto_56428 ?auto_56426 ) ) ( not ( = ?auto_56428 ?auto_56425 ) ) ( not ( = ?auto_56428 ?auto_56424 ) ) ( not ( = ?auto_56422 ?auto_56428 ) ) ( not ( = ?auto_56423 ?auto_56428 ) ) ( ON ?auto_56422 ?auto_56427 ) ( not ( = ?auto_56422 ?auto_56427 ) ) ( not ( = ?auto_56423 ?auto_56427 ) ) ( not ( = ?auto_56424 ?auto_56427 ) ) ( not ( = ?auto_56425 ?auto_56427 ) ) ( not ( = ?auto_56426 ?auto_56427 ) ) ( not ( = ?auto_56428 ?auto_56427 ) ) ( ON ?auto_56423 ?auto_56422 ) ( ON-TABLE ?auto_56427 ) ( CLEAR ?auto_56425 ) ( ON ?auto_56424 ?auto_56423 ) ( CLEAR ?auto_56424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56427 ?auto_56422 ?auto_56423 )
      ( MAKE-4PILE ?auto_56422 ?auto_56423 ?auto_56424 ?auto_56425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56429 - BLOCK
      ?auto_56430 - BLOCK
      ?auto_56431 - BLOCK
      ?auto_56432 - BLOCK
    )
    :vars
    (
      ?auto_56433 - BLOCK
      ?auto_56435 - BLOCK
      ?auto_56434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56429 ?auto_56430 ) ) ( not ( = ?auto_56429 ?auto_56431 ) ) ( not ( = ?auto_56429 ?auto_56432 ) ) ( not ( = ?auto_56430 ?auto_56431 ) ) ( not ( = ?auto_56430 ?auto_56432 ) ) ( not ( = ?auto_56431 ?auto_56432 ) ) ( not ( = ?auto_56429 ?auto_56433 ) ) ( not ( = ?auto_56430 ?auto_56433 ) ) ( not ( = ?auto_56431 ?auto_56433 ) ) ( not ( = ?auto_56432 ?auto_56433 ) ) ( ON-TABLE ?auto_56435 ) ( ON ?auto_56433 ?auto_56435 ) ( not ( = ?auto_56435 ?auto_56433 ) ) ( not ( = ?auto_56435 ?auto_56432 ) ) ( not ( = ?auto_56435 ?auto_56431 ) ) ( not ( = ?auto_56429 ?auto_56435 ) ) ( not ( = ?auto_56430 ?auto_56435 ) ) ( ON ?auto_56429 ?auto_56434 ) ( not ( = ?auto_56429 ?auto_56434 ) ) ( not ( = ?auto_56430 ?auto_56434 ) ) ( not ( = ?auto_56431 ?auto_56434 ) ) ( not ( = ?auto_56432 ?auto_56434 ) ) ( not ( = ?auto_56433 ?auto_56434 ) ) ( not ( = ?auto_56435 ?auto_56434 ) ) ( ON ?auto_56430 ?auto_56429 ) ( ON-TABLE ?auto_56434 ) ( ON ?auto_56431 ?auto_56430 ) ( CLEAR ?auto_56431 ) ( HOLDING ?auto_56432 ) ( CLEAR ?auto_56433 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56435 ?auto_56433 ?auto_56432 )
      ( MAKE-4PILE ?auto_56429 ?auto_56430 ?auto_56431 ?auto_56432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56436 - BLOCK
      ?auto_56437 - BLOCK
      ?auto_56438 - BLOCK
      ?auto_56439 - BLOCK
    )
    :vars
    (
      ?auto_56440 - BLOCK
      ?auto_56441 - BLOCK
      ?auto_56442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56436 ?auto_56437 ) ) ( not ( = ?auto_56436 ?auto_56438 ) ) ( not ( = ?auto_56436 ?auto_56439 ) ) ( not ( = ?auto_56437 ?auto_56438 ) ) ( not ( = ?auto_56437 ?auto_56439 ) ) ( not ( = ?auto_56438 ?auto_56439 ) ) ( not ( = ?auto_56436 ?auto_56440 ) ) ( not ( = ?auto_56437 ?auto_56440 ) ) ( not ( = ?auto_56438 ?auto_56440 ) ) ( not ( = ?auto_56439 ?auto_56440 ) ) ( ON-TABLE ?auto_56441 ) ( ON ?auto_56440 ?auto_56441 ) ( not ( = ?auto_56441 ?auto_56440 ) ) ( not ( = ?auto_56441 ?auto_56439 ) ) ( not ( = ?auto_56441 ?auto_56438 ) ) ( not ( = ?auto_56436 ?auto_56441 ) ) ( not ( = ?auto_56437 ?auto_56441 ) ) ( ON ?auto_56436 ?auto_56442 ) ( not ( = ?auto_56436 ?auto_56442 ) ) ( not ( = ?auto_56437 ?auto_56442 ) ) ( not ( = ?auto_56438 ?auto_56442 ) ) ( not ( = ?auto_56439 ?auto_56442 ) ) ( not ( = ?auto_56440 ?auto_56442 ) ) ( not ( = ?auto_56441 ?auto_56442 ) ) ( ON ?auto_56437 ?auto_56436 ) ( ON-TABLE ?auto_56442 ) ( ON ?auto_56438 ?auto_56437 ) ( CLEAR ?auto_56440 ) ( ON ?auto_56439 ?auto_56438 ) ( CLEAR ?auto_56439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56442 ?auto_56436 ?auto_56437 ?auto_56438 )
      ( MAKE-4PILE ?auto_56436 ?auto_56437 ?auto_56438 ?auto_56439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56443 - BLOCK
      ?auto_56444 - BLOCK
      ?auto_56445 - BLOCK
      ?auto_56446 - BLOCK
    )
    :vars
    (
      ?auto_56447 - BLOCK
      ?auto_56449 - BLOCK
      ?auto_56448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56443 ?auto_56444 ) ) ( not ( = ?auto_56443 ?auto_56445 ) ) ( not ( = ?auto_56443 ?auto_56446 ) ) ( not ( = ?auto_56444 ?auto_56445 ) ) ( not ( = ?auto_56444 ?auto_56446 ) ) ( not ( = ?auto_56445 ?auto_56446 ) ) ( not ( = ?auto_56443 ?auto_56447 ) ) ( not ( = ?auto_56444 ?auto_56447 ) ) ( not ( = ?auto_56445 ?auto_56447 ) ) ( not ( = ?auto_56446 ?auto_56447 ) ) ( ON-TABLE ?auto_56449 ) ( not ( = ?auto_56449 ?auto_56447 ) ) ( not ( = ?auto_56449 ?auto_56446 ) ) ( not ( = ?auto_56449 ?auto_56445 ) ) ( not ( = ?auto_56443 ?auto_56449 ) ) ( not ( = ?auto_56444 ?auto_56449 ) ) ( ON ?auto_56443 ?auto_56448 ) ( not ( = ?auto_56443 ?auto_56448 ) ) ( not ( = ?auto_56444 ?auto_56448 ) ) ( not ( = ?auto_56445 ?auto_56448 ) ) ( not ( = ?auto_56446 ?auto_56448 ) ) ( not ( = ?auto_56447 ?auto_56448 ) ) ( not ( = ?auto_56449 ?auto_56448 ) ) ( ON ?auto_56444 ?auto_56443 ) ( ON-TABLE ?auto_56448 ) ( ON ?auto_56445 ?auto_56444 ) ( ON ?auto_56446 ?auto_56445 ) ( CLEAR ?auto_56446 ) ( HOLDING ?auto_56447 ) ( CLEAR ?auto_56449 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56449 ?auto_56447 )
      ( MAKE-4PILE ?auto_56443 ?auto_56444 ?auto_56445 ?auto_56446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56450 - BLOCK
      ?auto_56451 - BLOCK
      ?auto_56452 - BLOCK
      ?auto_56453 - BLOCK
    )
    :vars
    (
      ?auto_56454 - BLOCK
      ?auto_56455 - BLOCK
      ?auto_56456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56450 ?auto_56451 ) ) ( not ( = ?auto_56450 ?auto_56452 ) ) ( not ( = ?auto_56450 ?auto_56453 ) ) ( not ( = ?auto_56451 ?auto_56452 ) ) ( not ( = ?auto_56451 ?auto_56453 ) ) ( not ( = ?auto_56452 ?auto_56453 ) ) ( not ( = ?auto_56450 ?auto_56454 ) ) ( not ( = ?auto_56451 ?auto_56454 ) ) ( not ( = ?auto_56452 ?auto_56454 ) ) ( not ( = ?auto_56453 ?auto_56454 ) ) ( ON-TABLE ?auto_56455 ) ( not ( = ?auto_56455 ?auto_56454 ) ) ( not ( = ?auto_56455 ?auto_56453 ) ) ( not ( = ?auto_56455 ?auto_56452 ) ) ( not ( = ?auto_56450 ?auto_56455 ) ) ( not ( = ?auto_56451 ?auto_56455 ) ) ( ON ?auto_56450 ?auto_56456 ) ( not ( = ?auto_56450 ?auto_56456 ) ) ( not ( = ?auto_56451 ?auto_56456 ) ) ( not ( = ?auto_56452 ?auto_56456 ) ) ( not ( = ?auto_56453 ?auto_56456 ) ) ( not ( = ?auto_56454 ?auto_56456 ) ) ( not ( = ?auto_56455 ?auto_56456 ) ) ( ON ?auto_56451 ?auto_56450 ) ( ON-TABLE ?auto_56456 ) ( ON ?auto_56452 ?auto_56451 ) ( ON ?auto_56453 ?auto_56452 ) ( CLEAR ?auto_56455 ) ( ON ?auto_56454 ?auto_56453 ) ( CLEAR ?auto_56454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56456 ?auto_56450 ?auto_56451 ?auto_56452 ?auto_56453 )
      ( MAKE-4PILE ?auto_56450 ?auto_56451 ?auto_56452 ?auto_56453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56457 - BLOCK
      ?auto_56458 - BLOCK
      ?auto_56459 - BLOCK
      ?auto_56460 - BLOCK
    )
    :vars
    (
      ?auto_56462 - BLOCK
      ?auto_56461 - BLOCK
      ?auto_56463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56457 ?auto_56458 ) ) ( not ( = ?auto_56457 ?auto_56459 ) ) ( not ( = ?auto_56457 ?auto_56460 ) ) ( not ( = ?auto_56458 ?auto_56459 ) ) ( not ( = ?auto_56458 ?auto_56460 ) ) ( not ( = ?auto_56459 ?auto_56460 ) ) ( not ( = ?auto_56457 ?auto_56462 ) ) ( not ( = ?auto_56458 ?auto_56462 ) ) ( not ( = ?auto_56459 ?auto_56462 ) ) ( not ( = ?auto_56460 ?auto_56462 ) ) ( not ( = ?auto_56461 ?auto_56462 ) ) ( not ( = ?auto_56461 ?auto_56460 ) ) ( not ( = ?auto_56461 ?auto_56459 ) ) ( not ( = ?auto_56457 ?auto_56461 ) ) ( not ( = ?auto_56458 ?auto_56461 ) ) ( ON ?auto_56457 ?auto_56463 ) ( not ( = ?auto_56457 ?auto_56463 ) ) ( not ( = ?auto_56458 ?auto_56463 ) ) ( not ( = ?auto_56459 ?auto_56463 ) ) ( not ( = ?auto_56460 ?auto_56463 ) ) ( not ( = ?auto_56462 ?auto_56463 ) ) ( not ( = ?auto_56461 ?auto_56463 ) ) ( ON ?auto_56458 ?auto_56457 ) ( ON-TABLE ?auto_56463 ) ( ON ?auto_56459 ?auto_56458 ) ( ON ?auto_56460 ?auto_56459 ) ( ON ?auto_56462 ?auto_56460 ) ( CLEAR ?auto_56462 ) ( HOLDING ?auto_56461 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56461 )
      ( MAKE-4PILE ?auto_56457 ?auto_56458 ?auto_56459 ?auto_56460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56464 - BLOCK
      ?auto_56465 - BLOCK
      ?auto_56466 - BLOCK
      ?auto_56467 - BLOCK
    )
    :vars
    (
      ?auto_56468 - BLOCK
      ?auto_56469 - BLOCK
      ?auto_56470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56464 ?auto_56465 ) ) ( not ( = ?auto_56464 ?auto_56466 ) ) ( not ( = ?auto_56464 ?auto_56467 ) ) ( not ( = ?auto_56465 ?auto_56466 ) ) ( not ( = ?auto_56465 ?auto_56467 ) ) ( not ( = ?auto_56466 ?auto_56467 ) ) ( not ( = ?auto_56464 ?auto_56468 ) ) ( not ( = ?auto_56465 ?auto_56468 ) ) ( not ( = ?auto_56466 ?auto_56468 ) ) ( not ( = ?auto_56467 ?auto_56468 ) ) ( not ( = ?auto_56469 ?auto_56468 ) ) ( not ( = ?auto_56469 ?auto_56467 ) ) ( not ( = ?auto_56469 ?auto_56466 ) ) ( not ( = ?auto_56464 ?auto_56469 ) ) ( not ( = ?auto_56465 ?auto_56469 ) ) ( ON ?auto_56464 ?auto_56470 ) ( not ( = ?auto_56464 ?auto_56470 ) ) ( not ( = ?auto_56465 ?auto_56470 ) ) ( not ( = ?auto_56466 ?auto_56470 ) ) ( not ( = ?auto_56467 ?auto_56470 ) ) ( not ( = ?auto_56468 ?auto_56470 ) ) ( not ( = ?auto_56469 ?auto_56470 ) ) ( ON ?auto_56465 ?auto_56464 ) ( ON-TABLE ?auto_56470 ) ( ON ?auto_56466 ?auto_56465 ) ( ON ?auto_56467 ?auto_56466 ) ( ON ?auto_56468 ?auto_56467 ) ( ON ?auto_56469 ?auto_56468 ) ( CLEAR ?auto_56469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56470 ?auto_56464 ?auto_56465 ?auto_56466 ?auto_56467 ?auto_56468 )
      ( MAKE-4PILE ?auto_56464 ?auto_56465 ?auto_56466 ?auto_56467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56482 - BLOCK
    )
    :vars
    (
      ?auto_56483 - BLOCK
      ?auto_56485 - BLOCK
      ?auto_56484 - BLOCK
      ?auto_56487 - BLOCK
      ?auto_56486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56483 ?auto_56482 ) ( ON-TABLE ?auto_56482 ) ( not ( = ?auto_56482 ?auto_56483 ) ) ( not ( = ?auto_56482 ?auto_56485 ) ) ( not ( = ?auto_56482 ?auto_56484 ) ) ( not ( = ?auto_56483 ?auto_56485 ) ) ( not ( = ?auto_56483 ?auto_56484 ) ) ( not ( = ?auto_56485 ?auto_56484 ) ) ( ON ?auto_56485 ?auto_56483 ) ( CLEAR ?auto_56485 ) ( HOLDING ?auto_56484 ) ( CLEAR ?auto_56487 ) ( ON-TABLE ?auto_56486 ) ( ON ?auto_56487 ?auto_56486 ) ( not ( = ?auto_56486 ?auto_56487 ) ) ( not ( = ?auto_56486 ?auto_56484 ) ) ( not ( = ?auto_56487 ?auto_56484 ) ) ( not ( = ?auto_56482 ?auto_56487 ) ) ( not ( = ?auto_56482 ?auto_56486 ) ) ( not ( = ?auto_56483 ?auto_56487 ) ) ( not ( = ?auto_56483 ?auto_56486 ) ) ( not ( = ?auto_56485 ?auto_56487 ) ) ( not ( = ?auto_56485 ?auto_56486 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56486 ?auto_56487 ?auto_56484 )
      ( MAKE-1PILE ?auto_56482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56488 - BLOCK
    )
    :vars
    (
      ?auto_56489 - BLOCK
      ?auto_56490 - BLOCK
      ?auto_56493 - BLOCK
      ?auto_56491 - BLOCK
      ?auto_56492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56489 ?auto_56488 ) ( ON-TABLE ?auto_56488 ) ( not ( = ?auto_56488 ?auto_56489 ) ) ( not ( = ?auto_56488 ?auto_56490 ) ) ( not ( = ?auto_56488 ?auto_56493 ) ) ( not ( = ?auto_56489 ?auto_56490 ) ) ( not ( = ?auto_56489 ?auto_56493 ) ) ( not ( = ?auto_56490 ?auto_56493 ) ) ( ON ?auto_56490 ?auto_56489 ) ( CLEAR ?auto_56491 ) ( ON-TABLE ?auto_56492 ) ( ON ?auto_56491 ?auto_56492 ) ( not ( = ?auto_56492 ?auto_56491 ) ) ( not ( = ?auto_56492 ?auto_56493 ) ) ( not ( = ?auto_56491 ?auto_56493 ) ) ( not ( = ?auto_56488 ?auto_56491 ) ) ( not ( = ?auto_56488 ?auto_56492 ) ) ( not ( = ?auto_56489 ?auto_56491 ) ) ( not ( = ?auto_56489 ?auto_56492 ) ) ( not ( = ?auto_56490 ?auto_56491 ) ) ( not ( = ?auto_56490 ?auto_56492 ) ) ( ON ?auto_56493 ?auto_56490 ) ( CLEAR ?auto_56493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56488 ?auto_56489 ?auto_56490 )
      ( MAKE-1PILE ?auto_56488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56494 - BLOCK
    )
    :vars
    (
      ?auto_56499 - BLOCK
      ?auto_56497 - BLOCK
      ?auto_56498 - BLOCK
      ?auto_56495 - BLOCK
      ?auto_56496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56499 ?auto_56494 ) ( ON-TABLE ?auto_56494 ) ( not ( = ?auto_56494 ?auto_56499 ) ) ( not ( = ?auto_56494 ?auto_56497 ) ) ( not ( = ?auto_56494 ?auto_56498 ) ) ( not ( = ?auto_56499 ?auto_56497 ) ) ( not ( = ?auto_56499 ?auto_56498 ) ) ( not ( = ?auto_56497 ?auto_56498 ) ) ( ON ?auto_56497 ?auto_56499 ) ( ON-TABLE ?auto_56495 ) ( not ( = ?auto_56495 ?auto_56496 ) ) ( not ( = ?auto_56495 ?auto_56498 ) ) ( not ( = ?auto_56496 ?auto_56498 ) ) ( not ( = ?auto_56494 ?auto_56496 ) ) ( not ( = ?auto_56494 ?auto_56495 ) ) ( not ( = ?auto_56499 ?auto_56496 ) ) ( not ( = ?auto_56499 ?auto_56495 ) ) ( not ( = ?auto_56497 ?auto_56496 ) ) ( not ( = ?auto_56497 ?auto_56495 ) ) ( ON ?auto_56498 ?auto_56497 ) ( CLEAR ?auto_56498 ) ( HOLDING ?auto_56496 ) ( CLEAR ?auto_56495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56495 ?auto_56496 )
      ( MAKE-1PILE ?auto_56494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56500 - BLOCK
    )
    :vars
    (
      ?auto_56502 - BLOCK
      ?auto_56504 - BLOCK
      ?auto_56501 - BLOCK
      ?auto_56503 - BLOCK
      ?auto_56505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56502 ?auto_56500 ) ( ON-TABLE ?auto_56500 ) ( not ( = ?auto_56500 ?auto_56502 ) ) ( not ( = ?auto_56500 ?auto_56504 ) ) ( not ( = ?auto_56500 ?auto_56501 ) ) ( not ( = ?auto_56502 ?auto_56504 ) ) ( not ( = ?auto_56502 ?auto_56501 ) ) ( not ( = ?auto_56504 ?auto_56501 ) ) ( ON ?auto_56504 ?auto_56502 ) ( ON-TABLE ?auto_56503 ) ( not ( = ?auto_56503 ?auto_56505 ) ) ( not ( = ?auto_56503 ?auto_56501 ) ) ( not ( = ?auto_56505 ?auto_56501 ) ) ( not ( = ?auto_56500 ?auto_56505 ) ) ( not ( = ?auto_56500 ?auto_56503 ) ) ( not ( = ?auto_56502 ?auto_56505 ) ) ( not ( = ?auto_56502 ?auto_56503 ) ) ( not ( = ?auto_56504 ?auto_56505 ) ) ( not ( = ?auto_56504 ?auto_56503 ) ) ( ON ?auto_56501 ?auto_56504 ) ( CLEAR ?auto_56503 ) ( ON ?auto_56505 ?auto_56501 ) ( CLEAR ?auto_56505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56500 ?auto_56502 ?auto_56504 ?auto_56501 )
      ( MAKE-1PILE ?auto_56500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56506 - BLOCK
    )
    :vars
    (
      ?auto_56511 - BLOCK
      ?auto_56507 - BLOCK
      ?auto_56509 - BLOCK
      ?auto_56510 - BLOCK
      ?auto_56508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56511 ?auto_56506 ) ( ON-TABLE ?auto_56506 ) ( not ( = ?auto_56506 ?auto_56511 ) ) ( not ( = ?auto_56506 ?auto_56507 ) ) ( not ( = ?auto_56506 ?auto_56509 ) ) ( not ( = ?auto_56511 ?auto_56507 ) ) ( not ( = ?auto_56511 ?auto_56509 ) ) ( not ( = ?auto_56507 ?auto_56509 ) ) ( ON ?auto_56507 ?auto_56511 ) ( not ( = ?auto_56510 ?auto_56508 ) ) ( not ( = ?auto_56510 ?auto_56509 ) ) ( not ( = ?auto_56508 ?auto_56509 ) ) ( not ( = ?auto_56506 ?auto_56508 ) ) ( not ( = ?auto_56506 ?auto_56510 ) ) ( not ( = ?auto_56511 ?auto_56508 ) ) ( not ( = ?auto_56511 ?auto_56510 ) ) ( not ( = ?auto_56507 ?auto_56508 ) ) ( not ( = ?auto_56507 ?auto_56510 ) ) ( ON ?auto_56509 ?auto_56507 ) ( ON ?auto_56508 ?auto_56509 ) ( CLEAR ?auto_56508 ) ( HOLDING ?auto_56510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56510 )
      ( MAKE-1PILE ?auto_56506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56519 - BLOCK
    )
    :vars
    (
      ?auto_56522 - BLOCK
      ?auto_56521 - BLOCK
      ?auto_56520 - BLOCK
      ?auto_56523 - BLOCK
      ?auto_56524 - BLOCK
      ?auto_56525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56522 ?auto_56519 ) ( ON-TABLE ?auto_56519 ) ( not ( = ?auto_56519 ?auto_56522 ) ) ( not ( = ?auto_56519 ?auto_56521 ) ) ( not ( = ?auto_56519 ?auto_56520 ) ) ( not ( = ?auto_56522 ?auto_56521 ) ) ( not ( = ?auto_56522 ?auto_56520 ) ) ( not ( = ?auto_56521 ?auto_56520 ) ) ( ON ?auto_56521 ?auto_56522 ) ( not ( = ?auto_56523 ?auto_56524 ) ) ( not ( = ?auto_56523 ?auto_56520 ) ) ( not ( = ?auto_56524 ?auto_56520 ) ) ( not ( = ?auto_56519 ?auto_56524 ) ) ( not ( = ?auto_56519 ?auto_56523 ) ) ( not ( = ?auto_56522 ?auto_56524 ) ) ( not ( = ?auto_56522 ?auto_56523 ) ) ( not ( = ?auto_56521 ?auto_56524 ) ) ( not ( = ?auto_56521 ?auto_56523 ) ) ( ON ?auto_56520 ?auto_56521 ) ( ON ?auto_56524 ?auto_56520 ) ( CLEAR ?auto_56524 ) ( ON ?auto_56523 ?auto_56525 ) ( CLEAR ?auto_56523 ) ( HAND-EMPTY ) ( not ( = ?auto_56519 ?auto_56525 ) ) ( not ( = ?auto_56522 ?auto_56525 ) ) ( not ( = ?auto_56521 ?auto_56525 ) ) ( not ( = ?auto_56520 ?auto_56525 ) ) ( not ( = ?auto_56523 ?auto_56525 ) ) ( not ( = ?auto_56524 ?auto_56525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56523 ?auto_56525 )
      ( MAKE-1PILE ?auto_56519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56526 - BLOCK
    )
    :vars
    (
      ?auto_56529 - BLOCK
      ?auto_56531 - BLOCK
      ?auto_56528 - BLOCK
      ?auto_56532 - BLOCK
      ?auto_56530 - BLOCK
      ?auto_56527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56529 ?auto_56526 ) ( ON-TABLE ?auto_56526 ) ( not ( = ?auto_56526 ?auto_56529 ) ) ( not ( = ?auto_56526 ?auto_56531 ) ) ( not ( = ?auto_56526 ?auto_56528 ) ) ( not ( = ?auto_56529 ?auto_56531 ) ) ( not ( = ?auto_56529 ?auto_56528 ) ) ( not ( = ?auto_56531 ?auto_56528 ) ) ( ON ?auto_56531 ?auto_56529 ) ( not ( = ?auto_56532 ?auto_56530 ) ) ( not ( = ?auto_56532 ?auto_56528 ) ) ( not ( = ?auto_56530 ?auto_56528 ) ) ( not ( = ?auto_56526 ?auto_56530 ) ) ( not ( = ?auto_56526 ?auto_56532 ) ) ( not ( = ?auto_56529 ?auto_56530 ) ) ( not ( = ?auto_56529 ?auto_56532 ) ) ( not ( = ?auto_56531 ?auto_56530 ) ) ( not ( = ?auto_56531 ?auto_56532 ) ) ( ON ?auto_56528 ?auto_56531 ) ( ON ?auto_56532 ?auto_56527 ) ( CLEAR ?auto_56532 ) ( not ( = ?auto_56526 ?auto_56527 ) ) ( not ( = ?auto_56529 ?auto_56527 ) ) ( not ( = ?auto_56531 ?auto_56527 ) ) ( not ( = ?auto_56528 ?auto_56527 ) ) ( not ( = ?auto_56532 ?auto_56527 ) ) ( not ( = ?auto_56530 ?auto_56527 ) ) ( HOLDING ?auto_56530 ) ( CLEAR ?auto_56528 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56526 ?auto_56529 ?auto_56531 ?auto_56528 ?auto_56530 )
      ( MAKE-1PILE ?auto_56526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56533 - BLOCK
    )
    :vars
    (
      ?auto_56534 - BLOCK
      ?auto_56539 - BLOCK
      ?auto_56537 - BLOCK
      ?auto_56536 - BLOCK
      ?auto_56535 - BLOCK
      ?auto_56538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56534 ?auto_56533 ) ( ON-TABLE ?auto_56533 ) ( not ( = ?auto_56533 ?auto_56534 ) ) ( not ( = ?auto_56533 ?auto_56539 ) ) ( not ( = ?auto_56533 ?auto_56537 ) ) ( not ( = ?auto_56534 ?auto_56539 ) ) ( not ( = ?auto_56534 ?auto_56537 ) ) ( not ( = ?auto_56539 ?auto_56537 ) ) ( ON ?auto_56539 ?auto_56534 ) ( not ( = ?auto_56536 ?auto_56535 ) ) ( not ( = ?auto_56536 ?auto_56537 ) ) ( not ( = ?auto_56535 ?auto_56537 ) ) ( not ( = ?auto_56533 ?auto_56535 ) ) ( not ( = ?auto_56533 ?auto_56536 ) ) ( not ( = ?auto_56534 ?auto_56535 ) ) ( not ( = ?auto_56534 ?auto_56536 ) ) ( not ( = ?auto_56539 ?auto_56535 ) ) ( not ( = ?auto_56539 ?auto_56536 ) ) ( ON ?auto_56537 ?auto_56539 ) ( ON ?auto_56536 ?auto_56538 ) ( not ( = ?auto_56533 ?auto_56538 ) ) ( not ( = ?auto_56534 ?auto_56538 ) ) ( not ( = ?auto_56539 ?auto_56538 ) ) ( not ( = ?auto_56537 ?auto_56538 ) ) ( not ( = ?auto_56536 ?auto_56538 ) ) ( not ( = ?auto_56535 ?auto_56538 ) ) ( CLEAR ?auto_56537 ) ( ON ?auto_56535 ?auto_56536 ) ( CLEAR ?auto_56535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56538 ?auto_56536 )
      ( MAKE-1PILE ?auto_56533 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56573 - BLOCK
      ?auto_56574 - BLOCK
      ?auto_56575 - BLOCK
      ?auto_56576 - BLOCK
      ?auto_56577 - BLOCK
    )
    :vars
    (
      ?auto_56578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56573 ) ( ON ?auto_56574 ?auto_56573 ) ( ON ?auto_56575 ?auto_56574 ) ( not ( = ?auto_56573 ?auto_56574 ) ) ( not ( = ?auto_56573 ?auto_56575 ) ) ( not ( = ?auto_56573 ?auto_56576 ) ) ( not ( = ?auto_56573 ?auto_56577 ) ) ( not ( = ?auto_56574 ?auto_56575 ) ) ( not ( = ?auto_56574 ?auto_56576 ) ) ( not ( = ?auto_56574 ?auto_56577 ) ) ( not ( = ?auto_56575 ?auto_56576 ) ) ( not ( = ?auto_56575 ?auto_56577 ) ) ( not ( = ?auto_56576 ?auto_56577 ) ) ( ON ?auto_56577 ?auto_56578 ) ( not ( = ?auto_56573 ?auto_56578 ) ) ( not ( = ?auto_56574 ?auto_56578 ) ) ( not ( = ?auto_56575 ?auto_56578 ) ) ( not ( = ?auto_56576 ?auto_56578 ) ) ( not ( = ?auto_56577 ?auto_56578 ) ) ( CLEAR ?auto_56575 ) ( ON ?auto_56576 ?auto_56577 ) ( CLEAR ?auto_56576 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56578 ?auto_56577 )
      ( MAKE-5PILE ?auto_56573 ?auto_56574 ?auto_56575 ?auto_56576 ?auto_56577 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56579 - BLOCK
      ?auto_56580 - BLOCK
      ?auto_56581 - BLOCK
      ?auto_56582 - BLOCK
      ?auto_56583 - BLOCK
    )
    :vars
    (
      ?auto_56584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56579 ) ( ON ?auto_56580 ?auto_56579 ) ( not ( = ?auto_56579 ?auto_56580 ) ) ( not ( = ?auto_56579 ?auto_56581 ) ) ( not ( = ?auto_56579 ?auto_56582 ) ) ( not ( = ?auto_56579 ?auto_56583 ) ) ( not ( = ?auto_56580 ?auto_56581 ) ) ( not ( = ?auto_56580 ?auto_56582 ) ) ( not ( = ?auto_56580 ?auto_56583 ) ) ( not ( = ?auto_56581 ?auto_56582 ) ) ( not ( = ?auto_56581 ?auto_56583 ) ) ( not ( = ?auto_56582 ?auto_56583 ) ) ( ON ?auto_56583 ?auto_56584 ) ( not ( = ?auto_56579 ?auto_56584 ) ) ( not ( = ?auto_56580 ?auto_56584 ) ) ( not ( = ?auto_56581 ?auto_56584 ) ) ( not ( = ?auto_56582 ?auto_56584 ) ) ( not ( = ?auto_56583 ?auto_56584 ) ) ( ON ?auto_56582 ?auto_56583 ) ( CLEAR ?auto_56582 ) ( ON-TABLE ?auto_56584 ) ( HOLDING ?auto_56581 ) ( CLEAR ?auto_56580 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56579 ?auto_56580 ?auto_56581 )
      ( MAKE-5PILE ?auto_56579 ?auto_56580 ?auto_56581 ?auto_56582 ?auto_56583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56585 - BLOCK
      ?auto_56586 - BLOCK
      ?auto_56587 - BLOCK
      ?auto_56588 - BLOCK
      ?auto_56589 - BLOCK
    )
    :vars
    (
      ?auto_56590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56585 ) ( ON ?auto_56586 ?auto_56585 ) ( not ( = ?auto_56585 ?auto_56586 ) ) ( not ( = ?auto_56585 ?auto_56587 ) ) ( not ( = ?auto_56585 ?auto_56588 ) ) ( not ( = ?auto_56585 ?auto_56589 ) ) ( not ( = ?auto_56586 ?auto_56587 ) ) ( not ( = ?auto_56586 ?auto_56588 ) ) ( not ( = ?auto_56586 ?auto_56589 ) ) ( not ( = ?auto_56587 ?auto_56588 ) ) ( not ( = ?auto_56587 ?auto_56589 ) ) ( not ( = ?auto_56588 ?auto_56589 ) ) ( ON ?auto_56589 ?auto_56590 ) ( not ( = ?auto_56585 ?auto_56590 ) ) ( not ( = ?auto_56586 ?auto_56590 ) ) ( not ( = ?auto_56587 ?auto_56590 ) ) ( not ( = ?auto_56588 ?auto_56590 ) ) ( not ( = ?auto_56589 ?auto_56590 ) ) ( ON ?auto_56588 ?auto_56589 ) ( ON-TABLE ?auto_56590 ) ( CLEAR ?auto_56586 ) ( ON ?auto_56587 ?auto_56588 ) ( CLEAR ?auto_56587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56590 ?auto_56589 ?auto_56588 )
      ( MAKE-5PILE ?auto_56585 ?auto_56586 ?auto_56587 ?auto_56588 ?auto_56589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56591 - BLOCK
      ?auto_56592 - BLOCK
      ?auto_56593 - BLOCK
      ?auto_56594 - BLOCK
      ?auto_56595 - BLOCK
    )
    :vars
    (
      ?auto_56596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56591 ) ( not ( = ?auto_56591 ?auto_56592 ) ) ( not ( = ?auto_56591 ?auto_56593 ) ) ( not ( = ?auto_56591 ?auto_56594 ) ) ( not ( = ?auto_56591 ?auto_56595 ) ) ( not ( = ?auto_56592 ?auto_56593 ) ) ( not ( = ?auto_56592 ?auto_56594 ) ) ( not ( = ?auto_56592 ?auto_56595 ) ) ( not ( = ?auto_56593 ?auto_56594 ) ) ( not ( = ?auto_56593 ?auto_56595 ) ) ( not ( = ?auto_56594 ?auto_56595 ) ) ( ON ?auto_56595 ?auto_56596 ) ( not ( = ?auto_56591 ?auto_56596 ) ) ( not ( = ?auto_56592 ?auto_56596 ) ) ( not ( = ?auto_56593 ?auto_56596 ) ) ( not ( = ?auto_56594 ?auto_56596 ) ) ( not ( = ?auto_56595 ?auto_56596 ) ) ( ON ?auto_56594 ?auto_56595 ) ( ON-TABLE ?auto_56596 ) ( ON ?auto_56593 ?auto_56594 ) ( CLEAR ?auto_56593 ) ( HOLDING ?auto_56592 ) ( CLEAR ?auto_56591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56591 ?auto_56592 )
      ( MAKE-5PILE ?auto_56591 ?auto_56592 ?auto_56593 ?auto_56594 ?auto_56595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56597 - BLOCK
      ?auto_56598 - BLOCK
      ?auto_56599 - BLOCK
      ?auto_56600 - BLOCK
      ?auto_56601 - BLOCK
    )
    :vars
    (
      ?auto_56602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56597 ) ( not ( = ?auto_56597 ?auto_56598 ) ) ( not ( = ?auto_56597 ?auto_56599 ) ) ( not ( = ?auto_56597 ?auto_56600 ) ) ( not ( = ?auto_56597 ?auto_56601 ) ) ( not ( = ?auto_56598 ?auto_56599 ) ) ( not ( = ?auto_56598 ?auto_56600 ) ) ( not ( = ?auto_56598 ?auto_56601 ) ) ( not ( = ?auto_56599 ?auto_56600 ) ) ( not ( = ?auto_56599 ?auto_56601 ) ) ( not ( = ?auto_56600 ?auto_56601 ) ) ( ON ?auto_56601 ?auto_56602 ) ( not ( = ?auto_56597 ?auto_56602 ) ) ( not ( = ?auto_56598 ?auto_56602 ) ) ( not ( = ?auto_56599 ?auto_56602 ) ) ( not ( = ?auto_56600 ?auto_56602 ) ) ( not ( = ?auto_56601 ?auto_56602 ) ) ( ON ?auto_56600 ?auto_56601 ) ( ON-TABLE ?auto_56602 ) ( ON ?auto_56599 ?auto_56600 ) ( CLEAR ?auto_56597 ) ( ON ?auto_56598 ?auto_56599 ) ( CLEAR ?auto_56598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56602 ?auto_56601 ?auto_56600 ?auto_56599 )
      ( MAKE-5PILE ?auto_56597 ?auto_56598 ?auto_56599 ?auto_56600 ?auto_56601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56603 - BLOCK
      ?auto_56604 - BLOCK
      ?auto_56605 - BLOCK
      ?auto_56606 - BLOCK
      ?auto_56607 - BLOCK
    )
    :vars
    (
      ?auto_56608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56603 ?auto_56604 ) ) ( not ( = ?auto_56603 ?auto_56605 ) ) ( not ( = ?auto_56603 ?auto_56606 ) ) ( not ( = ?auto_56603 ?auto_56607 ) ) ( not ( = ?auto_56604 ?auto_56605 ) ) ( not ( = ?auto_56604 ?auto_56606 ) ) ( not ( = ?auto_56604 ?auto_56607 ) ) ( not ( = ?auto_56605 ?auto_56606 ) ) ( not ( = ?auto_56605 ?auto_56607 ) ) ( not ( = ?auto_56606 ?auto_56607 ) ) ( ON ?auto_56607 ?auto_56608 ) ( not ( = ?auto_56603 ?auto_56608 ) ) ( not ( = ?auto_56604 ?auto_56608 ) ) ( not ( = ?auto_56605 ?auto_56608 ) ) ( not ( = ?auto_56606 ?auto_56608 ) ) ( not ( = ?auto_56607 ?auto_56608 ) ) ( ON ?auto_56606 ?auto_56607 ) ( ON-TABLE ?auto_56608 ) ( ON ?auto_56605 ?auto_56606 ) ( ON ?auto_56604 ?auto_56605 ) ( CLEAR ?auto_56604 ) ( HOLDING ?auto_56603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56603 )
      ( MAKE-5PILE ?auto_56603 ?auto_56604 ?auto_56605 ?auto_56606 ?auto_56607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56609 - BLOCK
      ?auto_56610 - BLOCK
      ?auto_56611 - BLOCK
      ?auto_56612 - BLOCK
      ?auto_56613 - BLOCK
    )
    :vars
    (
      ?auto_56614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56609 ?auto_56610 ) ) ( not ( = ?auto_56609 ?auto_56611 ) ) ( not ( = ?auto_56609 ?auto_56612 ) ) ( not ( = ?auto_56609 ?auto_56613 ) ) ( not ( = ?auto_56610 ?auto_56611 ) ) ( not ( = ?auto_56610 ?auto_56612 ) ) ( not ( = ?auto_56610 ?auto_56613 ) ) ( not ( = ?auto_56611 ?auto_56612 ) ) ( not ( = ?auto_56611 ?auto_56613 ) ) ( not ( = ?auto_56612 ?auto_56613 ) ) ( ON ?auto_56613 ?auto_56614 ) ( not ( = ?auto_56609 ?auto_56614 ) ) ( not ( = ?auto_56610 ?auto_56614 ) ) ( not ( = ?auto_56611 ?auto_56614 ) ) ( not ( = ?auto_56612 ?auto_56614 ) ) ( not ( = ?auto_56613 ?auto_56614 ) ) ( ON ?auto_56612 ?auto_56613 ) ( ON-TABLE ?auto_56614 ) ( ON ?auto_56611 ?auto_56612 ) ( ON ?auto_56610 ?auto_56611 ) ( ON ?auto_56609 ?auto_56610 ) ( CLEAR ?auto_56609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56614 ?auto_56613 ?auto_56612 ?auto_56611 ?auto_56610 )
      ( MAKE-5PILE ?auto_56609 ?auto_56610 ?auto_56611 ?auto_56612 ?auto_56613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56620 - BLOCK
      ?auto_56621 - BLOCK
      ?auto_56622 - BLOCK
      ?auto_56623 - BLOCK
      ?auto_56624 - BLOCK
    )
    :vars
    (
      ?auto_56625 - BLOCK
      ?auto_56626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56620 ?auto_56621 ) ) ( not ( = ?auto_56620 ?auto_56622 ) ) ( not ( = ?auto_56620 ?auto_56623 ) ) ( not ( = ?auto_56620 ?auto_56624 ) ) ( not ( = ?auto_56621 ?auto_56622 ) ) ( not ( = ?auto_56621 ?auto_56623 ) ) ( not ( = ?auto_56621 ?auto_56624 ) ) ( not ( = ?auto_56622 ?auto_56623 ) ) ( not ( = ?auto_56622 ?auto_56624 ) ) ( not ( = ?auto_56623 ?auto_56624 ) ) ( ON ?auto_56624 ?auto_56625 ) ( not ( = ?auto_56620 ?auto_56625 ) ) ( not ( = ?auto_56621 ?auto_56625 ) ) ( not ( = ?auto_56622 ?auto_56625 ) ) ( not ( = ?auto_56623 ?auto_56625 ) ) ( not ( = ?auto_56624 ?auto_56625 ) ) ( ON ?auto_56623 ?auto_56624 ) ( ON-TABLE ?auto_56625 ) ( ON ?auto_56622 ?auto_56623 ) ( ON ?auto_56621 ?auto_56622 ) ( CLEAR ?auto_56621 ) ( ON ?auto_56620 ?auto_56626 ) ( CLEAR ?auto_56620 ) ( HAND-EMPTY ) ( not ( = ?auto_56620 ?auto_56626 ) ) ( not ( = ?auto_56621 ?auto_56626 ) ) ( not ( = ?auto_56622 ?auto_56626 ) ) ( not ( = ?auto_56623 ?auto_56626 ) ) ( not ( = ?auto_56624 ?auto_56626 ) ) ( not ( = ?auto_56625 ?auto_56626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56620 ?auto_56626 )
      ( MAKE-5PILE ?auto_56620 ?auto_56621 ?auto_56622 ?auto_56623 ?auto_56624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56627 - BLOCK
      ?auto_56628 - BLOCK
      ?auto_56629 - BLOCK
      ?auto_56630 - BLOCK
      ?auto_56631 - BLOCK
    )
    :vars
    (
      ?auto_56633 - BLOCK
      ?auto_56632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56627 ?auto_56628 ) ) ( not ( = ?auto_56627 ?auto_56629 ) ) ( not ( = ?auto_56627 ?auto_56630 ) ) ( not ( = ?auto_56627 ?auto_56631 ) ) ( not ( = ?auto_56628 ?auto_56629 ) ) ( not ( = ?auto_56628 ?auto_56630 ) ) ( not ( = ?auto_56628 ?auto_56631 ) ) ( not ( = ?auto_56629 ?auto_56630 ) ) ( not ( = ?auto_56629 ?auto_56631 ) ) ( not ( = ?auto_56630 ?auto_56631 ) ) ( ON ?auto_56631 ?auto_56633 ) ( not ( = ?auto_56627 ?auto_56633 ) ) ( not ( = ?auto_56628 ?auto_56633 ) ) ( not ( = ?auto_56629 ?auto_56633 ) ) ( not ( = ?auto_56630 ?auto_56633 ) ) ( not ( = ?auto_56631 ?auto_56633 ) ) ( ON ?auto_56630 ?auto_56631 ) ( ON-TABLE ?auto_56633 ) ( ON ?auto_56629 ?auto_56630 ) ( ON ?auto_56627 ?auto_56632 ) ( CLEAR ?auto_56627 ) ( not ( = ?auto_56627 ?auto_56632 ) ) ( not ( = ?auto_56628 ?auto_56632 ) ) ( not ( = ?auto_56629 ?auto_56632 ) ) ( not ( = ?auto_56630 ?auto_56632 ) ) ( not ( = ?auto_56631 ?auto_56632 ) ) ( not ( = ?auto_56633 ?auto_56632 ) ) ( HOLDING ?auto_56628 ) ( CLEAR ?auto_56629 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56633 ?auto_56631 ?auto_56630 ?auto_56629 ?auto_56628 )
      ( MAKE-5PILE ?auto_56627 ?auto_56628 ?auto_56629 ?auto_56630 ?auto_56631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56634 - BLOCK
      ?auto_56635 - BLOCK
      ?auto_56636 - BLOCK
      ?auto_56637 - BLOCK
      ?auto_56638 - BLOCK
    )
    :vars
    (
      ?auto_56639 - BLOCK
      ?auto_56640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56634 ?auto_56635 ) ) ( not ( = ?auto_56634 ?auto_56636 ) ) ( not ( = ?auto_56634 ?auto_56637 ) ) ( not ( = ?auto_56634 ?auto_56638 ) ) ( not ( = ?auto_56635 ?auto_56636 ) ) ( not ( = ?auto_56635 ?auto_56637 ) ) ( not ( = ?auto_56635 ?auto_56638 ) ) ( not ( = ?auto_56636 ?auto_56637 ) ) ( not ( = ?auto_56636 ?auto_56638 ) ) ( not ( = ?auto_56637 ?auto_56638 ) ) ( ON ?auto_56638 ?auto_56639 ) ( not ( = ?auto_56634 ?auto_56639 ) ) ( not ( = ?auto_56635 ?auto_56639 ) ) ( not ( = ?auto_56636 ?auto_56639 ) ) ( not ( = ?auto_56637 ?auto_56639 ) ) ( not ( = ?auto_56638 ?auto_56639 ) ) ( ON ?auto_56637 ?auto_56638 ) ( ON-TABLE ?auto_56639 ) ( ON ?auto_56636 ?auto_56637 ) ( ON ?auto_56634 ?auto_56640 ) ( not ( = ?auto_56634 ?auto_56640 ) ) ( not ( = ?auto_56635 ?auto_56640 ) ) ( not ( = ?auto_56636 ?auto_56640 ) ) ( not ( = ?auto_56637 ?auto_56640 ) ) ( not ( = ?auto_56638 ?auto_56640 ) ) ( not ( = ?auto_56639 ?auto_56640 ) ) ( CLEAR ?auto_56636 ) ( ON ?auto_56635 ?auto_56634 ) ( CLEAR ?auto_56635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56640 ?auto_56634 )
      ( MAKE-5PILE ?auto_56634 ?auto_56635 ?auto_56636 ?auto_56637 ?auto_56638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56641 - BLOCK
      ?auto_56642 - BLOCK
      ?auto_56643 - BLOCK
      ?auto_56644 - BLOCK
      ?auto_56645 - BLOCK
    )
    :vars
    (
      ?auto_56647 - BLOCK
      ?auto_56646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56641 ?auto_56642 ) ) ( not ( = ?auto_56641 ?auto_56643 ) ) ( not ( = ?auto_56641 ?auto_56644 ) ) ( not ( = ?auto_56641 ?auto_56645 ) ) ( not ( = ?auto_56642 ?auto_56643 ) ) ( not ( = ?auto_56642 ?auto_56644 ) ) ( not ( = ?auto_56642 ?auto_56645 ) ) ( not ( = ?auto_56643 ?auto_56644 ) ) ( not ( = ?auto_56643 ?auto_56645 ) ) ( not ( = ?auto_56644 ?auto_56645 ) ) ( ON ?auto_56645 ?auto_56647 ) ( not ( = ?auto_56641 ?auto_56647 ) ) ( not ( = ?auto_56642 ?auto_56647 ) ) ( not ( = ?auto_56643 ?auto_56647 ) ) ( not ( = ?auto_56644 ?auto_56647 ) ) ( not ( = ?auto_56645 ?auto_56647 ) ) ( ON ?auto_56644 ?auto_56645 ) ( ON-TABLE ?auto_56647 ) ( ON ?auto_56641 ?auto_56646 ) ( not ( = ?auto_56641 ?auto_56646 ) ) ( not ( = ?auto_56642 ?auto_56646 ) ) ( not ( = ?auto_56643 ?auto_56646 ) ) ( not ( = ?auto_56644 ?auto_56646 ) ) ( not ( = ?auto_56645 ?auto_56646 ) ) ( not ( = ?auto_56647 ?auto_56646 ) ) ( ON ?auto_56642 ?auto_56641 ) ( CLEAR ?auto_56642 ) ( ON-TABLE ?auto_56646 ) ( HOLDING ?auto_56643 ) ( CLEAR ?auto_56644 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56647 ?auto_56645 ?auto_56644 ?auto_56643 )
      ( MAKE-5PILE ?auto_56641 ?auto_56642 ?auto_56643 ?auto_56644 ?auto_56645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56648 - BLOCK
      ?auto_56649 - BLOCK
      ?auto_56650 - BLOCK
      ?auto_56651 - BLOCK
      ?auto_56652 - BLOCK
    )
    :vars
    (
      ?auto_56653 - BLOCK
      ?auto_56654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56648 ?auto_56649 ) ) ( not ( = ?auto_56648 ?auto_56650 ) ) ( not ( = ?auto_56648 ?auto_56651 ) ) ( not ( = ?auto_56648 ?auto_56652 ) ) ( not ( = ?auto_56649 ?auto_56650 ) ) ( not ( = ?auto_56649 ?auto_56651 ) ) ( not ( = ?auto_56649 ?auto_56652 ) ) ( not ( = ?auto_56650 ?auto_56651 ) ) ( not ( = ?auto_56650 ?auto_56652 ) ) ( not ( = ?auto_56651 ?auto_56652 ) ) ( ON ?auto_56652 ?auto_56653 ) ( not ( = ?auto_56648 ?auto_56653 ) ) ( not ( = ?auto_56649 ?auto_56653 ) ) ( not ( = ?auto_56650 ?auto_56653 ) ) ( not ( = ?auto_56651 ?auto_56653 ) ) ( not ( = ?auto_56652 ?auto_56653 ) ) ( ON ?auto_56651 ?auto_56652 ) ( ON-TABLE ?auto_56653 ) ( ON ?auto_56648 ?auto_56654 ) ( not ( = ?auto_56648 ?auto_56654 ) ) ( not ( = ?auto_56649 ?auto_56654 ) ) ( not ( = ?auto_56650 ?auto_56654 ) ) ( not ( = ?auto_56651 ?auto_56654 ) ) ( not ( = ?auto_56652 ?auto_56654 ) ) ( not ( = ?auto_56653 ?auto_56654 ) ) ( ON ?auto_56649 ?auto_56648 ) ( ON-TABLE ?auto_56654 ) ( CLEAR ?auto_56651 ) ( ON ?auto_56650 ?auto_56649 ) ( CLEAR ?auto_56650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56654 ?auto_56648 ?auto_56649 )
      ( MAKE-5PILE ?auto_56648 ?auto_56649 ?auto_56650 ?auto_56651 ?auto_56652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56655 - BLOCK
      ?auto_56656 - BLOCK
      ?auto_56657 - BLOCK
      ?auto_56658 - BLOCK
      ?auto_56659 - BLOCK
    )
    :vars
    (
      ?auto_56661 - BLOCK
      ?auto_56660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56655 ?auto_56656 ) ) ( not ( = ?auto_56655 ?auto_56657 ) ) ( not ( = ?auto_56655 ?auto_56658 ) ) ( not ( = ?auto_56655 ?auto_56659 ) ) ( not ( = ?auto_56656 ?auto_56657 ) ) ( not ( = ?auto_56656 ?auto_56658 ) ) ( not ( = ?auto_56656 ?auto_56659 ) ) ( not ( = ?auto_56657 ?auto_56658 ) ) ( not ( = ?auto_56657 ?auto_56659 ) ) ( not ( = ?auto_56658 ?auto_56659 ) ) ( ON ?auto_56659 ?auto_56661 ) ( not ( = ?auto_56655 ?auto_56661 ) ) ( not ( = ?auto_56656 ?auto_56661 ) ) ( not ( = ?auto_56657 ?auto_56661 ) ) ( not ( = ?auto_56658 ?auto_56661 ) ) ( not ( = ?auto_56659 ?auto_56661 ) ) ( ON-TABLE ?auto_56661 ) ( ON ?auto_56655 ?auto_56660 ) ( not ( = ?auto_56655 ?auto_56660 ) ) ( not ( = ?auto_56656 ?auto_56660 ) ) ( not ( = ?auto_56657 ?auto_56660 ) ) ( not ( = ?auto_56658 ?auto_56660 ) ) ( not ( = ?auto_56659 ?auto_56660 ) ) ( not ( = ?auto_56661 ?auto_56660 ) ) ( ON ?auto_56656 ?auto_56655 ) ( ON-TABLE ?auto_56660 ) ( ON ?auto_56657 ?auto_56656 ) ( CLEAR ?auto_56657 ) ( HOLDING ?auto_56658 ) ( CLEAR ?auto_56659 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56661 ?auto_56659 ?auto_56658 )
      ( MAKE-5PILE ?auto_56655 ?auto_56656 ?auto_56657 ?auto_56658 ?auto_56659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56662 - BLOCK
      ?auto_56663 - BLOCK
      ?auto_56664 - BLOCK
      ?auto_56665 - BLOCK
      ?auto_56666 - BLOCK
    )
    :vars
    (
      ?auto_56668 - BLOCK
      ?auto_56667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56662 ?auto_56663 ) ) ( not ( = ?auto_56662 ?auto_56664 ) ) ( not ( = ?auto_56662 ?auto_56665 ) ) ( not ( = ?auto_56662 ?auto_56666 ) ) ( not ( = ?auto_56663 ?auto_56664 ) ) ( not ( = ?auto_56663 ?auto_56665 ) ) ( not ( = ?auto_56663 ?auto_56666 ) ) ( not ( = ?auto_56664 ?auto_56665 ) ) ( not ( = ?auto_56664 ?auto_56666 ) ) ( not ( = ?auto_56665 ?auto_56666 ) ) ( ON ?auto_56666 ?auto_56668 ) ( not ( = ?auto_56662 ?auto_56668 ) ) ( not ( = ?auto_56663 ?auto_56668 ) ) ( not ( = ?auto_56664 ?auto_56668 ) ) ( not ( = ?auto_56665 ?auto_56668 ) ) ( not ( = ?auto_56666 ?auto_56668 ) ) ( ON-TABLE ?auto_56668 ) ( ON ?auto_56662 ?auto_56667 ) ( not ( = ?auto_56662 ?auto_56667 ) ) ( not ( = ?auto_56663 ?auto_56667 ) ) ( not ( = ?auto_56664 ?auto_56667 ) ) ( not ( = ?auto_56665 ?auto_56667 ) ) ( not ( = ?auto_56666 ?auto_56667 ) ) ( not ( = ?auto_56668 ?auto_56667 ) ) ( ON ?auto_56663 ?auto_56662 ) ( ON-TABLE ?auto_56667 ) ( ON ?auto_56664 ?auto_56663 ) ( CLEAR ?auto_56666 ) ( ON ?auto_56665 ?auto_56664 ) ( CLEAR ?auto_56665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56667 ?auto_56662 ?auto_56663 ?auto_56664 )
      ( MAKE-5PILE ?auto_56662 ?auto_56663 ?auto_56664 ?auto_56665 ?auto_56666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56669 - BLOCK
      ?auto_56670 - BLOCK
      ?auto_56671 - BLOCK
      ?auto_56672 - BLOCK
      ?auto_56673 - BLOCK
    )
    :vars
    (
      ?auto_56675 - BLOCK
      ?auto_56674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56669 ?auto_56670 ) ) ( not ( = ?auto_56669 ?auto_56671 ) ) ( not ( = ?auto_56669 ?auto_56672 ) ) ( not ( = ?auto_56669 ?auto_56673 ) ) ( not ( = ?auto_56670 ?auto_56671 ) ) ( not ( = ?auto_56670 ?auto_56672 ) ) ( not ( = ?auto_56670 ?auto_56673 ) ) ( not ( = ?auto_56671 ?auto_56672 ) ) ( not ( = ?auto_56671 ?auto_56673 ) ) ( not ( = ?auto_56672 ?auto_56673 ) ) ( not ( = ?auto_56669 ?auto_56675 ) ) ( not ( = ?auto_56670 ?auto_56675 ) ) ( not ( = ?auto_56671 ?auto_56675 ) ) ( not ( = ?auto_56672 ?auto_56675 ) ) ( not ( = ?auto_56673 ?auto_56675 ) ) ( ON-TABLE ?auto_56675 ) ( ON ?auto_56669 ?auto_56674 ) ( not ( = ?auto_56669 ?auto_56674 ) ) ( not ( = ?auto_56670 ?auto_56674 ) ) ( not ( = ?auto_56671 ?auto_56674 ) ) ( not ( = ?auto_56672 ?auto_56674 ) ) ( not ( = ?auto_56673 ?auto_56674 ) ) ( not ( = ?auto_56675 ?auto_56674 ) ) ( ON ?auto_56670 ?auto_56669 ) ( ON-TABLE ?auto_56674 ) ( ON ?auto_56671 ?auto_56670 ) ( ON ?auto_56672 ?auto_56671 ) ( CLEAR ?auto_56672 ) ( HOLDING ?auto_56673 ) ( CLEAR ?auto_56675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56675 ?auto_56673 )
      ( MAKE-5PILE ?auto_56669 ?auto_56670 ?auto_56671 ?auto_56672 ?auto_56673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56676 - BLOCK
      ?auto_56677 - BLOCK
      ?auto_56678 - BLOCK
      ?auto_56679 - BLOCK
      ?auto_56680 - BLOCK
    )
    :vars
    (
      ?auto_56681 - BLOCK
      ?auto_56682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56676 ?auto_56677 ) ) ( not ( = ?auto_56676 ?auto_56678 ) ) ( not ( = ?auto_56676 ?auto_56679 ) ) ( not ( = ?auto_56676 ?auto_56680 ) ) ( not ( = ?auto_56677 ?auto_56678 ) ) ( not ( = ?auto_56677 ?auto_56679 ) ) ( not ( = ?auto_56677 ?auto_56680 ) ) ( not ( = ?auto_56678 ?auto_56679 ) ) ( not ( = ?auto_56678 ?auto_56680 ) ) ( not ( = ?auto_56679 ?auto_56680 ) ) ( not ( = ?auto_56676 ?auto_56681 ) ) ( not ( = ?auto_56677 ?auto_56681 ) ) ( not ( = ?auto_56678 ?auto_56681 ) ) ( not ( = ?auto_56679 ?auto_56681 ) ) ( not ( = ?auto_56680 ?auto_56681 ) ) ( ON-TABLE ?auto_56681 ) ( ON ?auto_56676 ?auto_56682 ) ( not ( = ?auto_56676 ?auto_56682 ) ) ( not ( = ?auto_56677 ?auto_56682 ) ) ( not ( = ?auto_56678 ?auto_56682 ) ) ( not ( = ?auto_56679 ?auto_56682 ) ) ( not ( = ?auto_56680 ?auto_56682 ) ) ( not ( = ?auto_56681 ?auto_56682 ) ) ( ON ?auto_56677 ?auto_56676 ) ( ON-TABLE ?auto_56682 ) ( ON ?auto_56678 ?auto_56677 ) ( ON ?auto_56679 ?auto_56678 ) ( CLEAR ?auto_56681 ) ( ON ?auto_56680 ?auto_56679 ) ( CLEAR ?auto_56680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56682 ?auto_56676 ?auto_56677 ?auto_56678 ?auto_56679 )
      ( MAKE-5PILE ?auto_56676 ?auto_56677 ?auto_56678 ?auto_56679 ?auto_56680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56683 - BLOCK
      ?auto_56684 - BLOCK
      ?auto_56685 - BLOCK
      ?auto_56686 - BLOCK
      ?auto_56687 - BLOCK
    )
    :vars
    (
      ?auto_56688 - BLOCK
      ?auto_56689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56683 ?auto_56684 ) ) ( not ( = ?auto_56683 ?auto_56685 ) ) ( not ( = ?auto_56683 ?auto_56686 ) ) ( not ( = ?auto_56683 ?auto_56687 ) ) ( not ( = ?auto_56684 ?auto_56685 ) ) ( not ( = ?auto_56684 ?auto_56686 ) ) ( not ( = ?auto_56684 ?auto_56687 ) ) ( not ( = ?auto_56685 ?auto_56686 ) ) ( not ( = ?auto_56685 ?auto_56687 ) ) ( not ( = ?auto_56686 ?auto_56687 ) ) ( not ( = ?auto_56683 ?auto_56688 ) ) ( not ( = ?auto_56684 ?auto_56688 ) ) ( not ( = ?auto_56685 ?auto_56688 ) ) ( not ( = ?auto_56686 ?auto_56688 ) ) ( not ( = ?auto_56687 ?auto_56688 ) ) ( ON ?auto_56683 ?auto_56689 ) ( not ( = ?auto_56683 ?auto_56689 ) ) ( not ( = ?auto_56684 ?auto_56689 ) ) ( not ( = ?auto_56685 ?auto_56689 ) ) ( not ( = ?auto_56686 ?auto_56689 ) ) ( not ( = ?auto_56687 ?auto_56689 ) ) ( not ( = ?auto_56688 ?auto_56689 ) ) ( ON ?auto_56684 ?auto_56683 ) ( ON-TABLE ?auto_56689 ) ( ON ?auto_56685 ?auto_56684 ) ( ON ?auto_56686 ?auto_56685 ) ( ON ?auto_56687 ?auto_56686 ) ( CLEAR ?auto_56687 ) ( HOLDING ?auto_56688 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56688 )
      ( MAKE-5PILE ?auto_56683 ?auto_56684 ?auto_56685 ?auto_56686 ?auto_56687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56690 - BLOCK
      ?auto_56691 - BLOCK
      ?auto_56692 - BLOCK
      ?auto_56693 - BLOCK
      ?auto_56694 - BLOCK
    )
    :vars
    (
      ?auto_56695 - BLOCK
      ?auto_56696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56690 ?auto_56691 ) ) ( not ( = ?auto_56690 ?auto_56692 ) ) ( not ( = ?auto_56690 ?auto_56693 ) ) ( not ( = ?auto_56690 ?auto_56694 ) ) ( not ( = ?auto_56691 ?auto_56692 ) ) ( not ( = ?auto_56691 ?auto_56693 ) ) ( not ( = ?auto_56691 ?auto_56694 ) ) ( not ( = ?auto_56692 ?auto_56693 ) ) ( not ( = ?auto_56692 ?auto_56694 ) ) ( not ( = ?auto_56693 ?auto_56694 ) ) ( not ( = ?auto_56690 ?auto_56695 ) ) ( not ( = ?auto_56691 ?auto_56695 ) ) ( not ( = ?auto_56692 ?auto_56695 ) ) ( not ( = ?auto_56693 ?auto_56695 ) ) ( not ( = ?auto_56694 ?auto_56695 ) ) ( ON ?auto_56690 ?auto_56696 ) ( not ( = ?auto_56690 ?auto_56696 ) ) ( not ( = ?auto_56691 ?auto_56696 ) ) ( not ( = ?auto_56692 ?auto_56696 ) ) ( not ( = ?auto_56693 ?auto_56696 ) ) ( not ( = ?auto_56694 ?auto_56696 ) ) ( not ( = ?auto_56695 ?auto_56696 ) ) ( ON ?auto_56691 ?auto_56690 ) ( ON-TABLE ?auto_56696 ) ( ON ?auto_56692 ?auto_56691 ) ( ON ?auto_56693 ?auto_56692 ) ( ON ?auto_56694 ?auto_56693 ) ( ON ?auto_56695 ?auto_56694 ) ( CLEAR ?auto_56695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56696 ?auto_56690 ?auto_56691 ?auto_56692 ?auto_56693 ?auto_56694 )
      ( MAKE-5PILE ?auto_56690 ?auto_56691 ?auto_56692 ?auto_56693 ?auto_56694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56709 - BLOCK
      ?auto_56710 - BLOCK
      ?auto_56711 - BLOCK
      ?auto_56712 - BLOCK
      ?auto_56713 - BLOCK
      ?auto_56714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56713 ) ( ON-TABLE ?auto_56709 ) ( ON ?auto_56710 ?auto_56709 ) ( ON ?auto_56711 ?auto_56710 ) ( ON ?auto_56712 ?auto_56711 ) ( ON ?auto_56713 ?auto_56712 ) ( not ( = ?auto_56709 ?auto_56710 ) ) ( not ( = ?auto_56709 ?auto_56711 ) ) ( not ( = ?auto_56709 ?auto_56712 ) ) ( not ( = ?auto_56709 ?auto_56713 ) ) ( not ( = ?auto_56709 ?auto_56714 ) ) ( not ( = ?auto_56710 ?auto_56711 ) ) ( not ( = ?auto_56710 ?auto_56712 ) ) ( not ( = ?auto_56710 ?auto_56713 ) ) ( not ( = ?auto_56710 ?auto_56714 ) ) ( not ( = ?auto_56711 ?auto_56712 ) ) ( not ( = ?auto_56711 ?auto_56713 ) ) ( not ( = ?auto_56711 ?auto_56714 ) ) ( not ( = ?auto_56712 ?auto_56713 ) ) ( not ( = ?auto_56712 ?auto_56714 ) ) ( not ( = ?auto_56713 ?auto_56714 ) ) ( ON-TABLE ?auto_56714 ) ( CLEAR ?auto_56714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_56714 )
      ( MAKE-6PILE ?auto_56709 ?auto_56710 ?auto_56711 ?auto_56712 ?auto_56713 ?auto_56714 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56715 - BLOCK
      ?auto_56716 - BLOCK
      ?auto_56717 - BLOCK
      ?auto_56718 - BLOCK
      ?auto_56719 - BLOCK
      ?auto_56720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56715 ) ( ON ?auto_56716 ?auto_56715 ) ( ON ?auto_56717 ?auto_56716 ) ( ON ?auto_56718 ?auto_56717 ) ( not ( = ?auto_56715 ?auto_56716 ) ) ( not ( = ?auto_56715 ?auto_56717 ) ) ( not ( = ?auto_56715 ?auto_56718 ) ) ( not ( = ?auto_56715 ?auto_56719 ) ) ( not ( = ?auto_56715 ?auto_56720 ) ) ( not ( = ?auto_56716 ?auto_56717 ) ) ( not ( = ?auto_56716 ?auto_56718 ) ) ( not ( = ?auto_56716 ?auto_56719 ) ) ( not ( = ?auto_56716 ?auto_56720 ) ) ( not ( = ?auto_56717 ?auto_56718 ) ) ( not ( = ?auto_56717 ?auto_56719 ) ) ( not ( = ?auto_56717 ?auto_56720 ) ) ( not ( = ?auto_56718 ?auto_56719 ) ) ( not ( = ?auto_56718 ?auto_56720 ) ) ( not ( = ?auto_56719 ?auto_56720 ) ) ( ON-TABLE ?auto_56720 ) ( CLEAR ?auto_56720 ) ( HOLDING ?auto_56719 ) ( CLEAR ?auto_56718 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56715 ?auto_56716 ?auto_56717 ?auto_56718 ?auto_56719 )
      ( MAKE-6PILE ?auto_56715 ?auto_56716 ?auto_56717 ?auto_56718 ?auto_56719 ?auto_56720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56721 - BLOCK
      ?auto_56722 - BLOCK
      ?auto_56723 - BLOCK
      ?auto_56724 - BLOCK
      ?auto_56725 - BLOCK
      ?auto_56726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56721 ) ( ON ?auto_56722 ?auto_56721 ) ( ON ?auto_56723 ?auto_56722 ) ( ON ?auto_56724 ?auto_56723 ) ( not ( = ?auto_56721 ?auto_56722 ) ) ( not ( = ?auto_56721 ?auto_56723 ) ) ( not ( = ?auto_56721 ?auto_56724 ) ) ( not ( = ?auto_56721 ?auto_56725 ) ) ( not ( = ?auto_56721 ?auto_56726 ) ) ( not ( = ?auto_56722 ?auto_56723 ) ) ( not ( = ?auto_56722 ?auto_56724 ) ) ( not ( = ?auto_56722 ?auto_56725 ) ) ( not ( = ?auto_56722 ?auto_56726 ) ) ( not ( = ?auto_56723 ?auto_56724 ) ) ( not ( = ?auto_56723 ?auto_56725 ) ) ( not ( = ?auto_56723 ?auto_56726 ) ) ( not ( = ?auto_56724 ?auto_56725 ) ) ( not ( = ?auto_56724 ?auto_56726 ) ) ( not ( = ?auto_56725 ?auto_56726 ) ) ( ON-TABLE ?auto_56726 ) ( CLEAR ?auto_56724 ) ( ON ?auto_56725 ?auto_56726 ) ( CLEAR ?auto_56725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56726 )
      ( MAKE-6PILE ?auto_56721 ?auto_56722 ?auto_56723 ?auto_56724 ?auto_56725 ?auto_56726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56727 - BLOCK
      ?auto_56728 - BLOCK
      ?auto_56729 - BLOCK
      ?auto_56730 - BLOCK
      ?auto_56731 - BLOCK
      ?auto_56732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56727 ) ( ON ?auto_56728 ?auto_56727 ) ( ON ?auto_56729 ?auto_56728 ) ( not ( = ?auto_56727 ?auto_56728 ) ) ( not ( = ?auto_56727 ?auto_56729 ) ) ( not ( = ?auto_56727 ?auto_56730 ) ) ( not ( = ?auto_56727 ?auto_56731 ) ) ( not ( = ?auto_56727 ?auto_56732 ) ) ( not ( = ?auto_56728 ?auto_56729 ) ) ( not ( = ?auto_56728 ?auto_56730 ) ) ( not ( = ?auto_56728 ?auto_56731 ) ) ( not ( = ?auto_56728 ?auto_56732 ) ) ( not ( = ?auto_56729 ?auto_56730 ) ) ( not ( = ?auto_56729 ?auto_56731 ) ) ( not ( = ?auto_56729 ?auto_56732 ) ) ( not ( = ?auto_56730 ?auto_56731 ) ) ( not ( = ?auto_56730 ?auto_56732 ) ) ( not ( = ?auto_56731 ?auto_56732 ) ) ( ON-TABLE ?auto_56732 ) ( ON ?auto_56731 ?auto_56732 ) ( CLEAR ?auto_56731 ) ( HOLDING ?auto_56730 ) ( CLEAR ?auto_56729 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56727 ?auto_56728 ?auto_56729 ?auto_56730 )
      ( MAKE-6PILE ?auto_56727 ?auto_56728 ?auto_56729 ?auto_56730 ?auto_56731 ?auto_56732 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56733 - BLOCK
      ?auto_56734 - BLOCK
      ?auto_56735 - BLOCK
      ?auto_56736 - BLOCK
      ?auto_56737 - BLOCK
      ?auto_56738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56733 ) ( ON ?auto_56734 ?auto_56733 ) ( ON ?auto_56735 ?auto_56734 ) ( not ( = ?auto_56733 ?auto_56734 ) ) ( not ( = ?auto_56733 ?auto_56735 ) ) ( not ( = ?auto_56733 ?auto_56736 ) ) ( not ( = ?auto_56733 ?auto_56737 ) ) ( not ( = ?auto_56733 ?auto_56738 ) ) ( not ( = ?auto_56734 ?auto_56735 ) ) ( not ( = ?auto_56734 ?auto_56736 ) ) ( not ( = ?auto_56734 ?auto_56737 ) ) ( not ( = ?auto_56734 ?auto_56738 ) ) ( not ( = ?auto_56735 ?auto_56736 ) ) ( not ( = ?auto_56735 ?auto_56737 ) ) ( not ( = ?auto_56735 ?auto_56738 ) ) ( not ( = ?auto_56736 ?auto_56737 ) ) ( not ( = ?auto_56736 ?auto_56738 ) ) ( not ( = ?auto_56737 ?auto_56738 ) ) ( ON-TABLE ?auto_56738 ) ( ON ?auto_56737 ?auto_56738 ) ( CLEAR ?auto_56735 ) ( ON ?auto_56736 ?auto_56737 ) ( CLEAR ?auto_56736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56738 ?auto_56737 )
      ( MAKE-6PILE ?auto_56733 ?auto_56734 ?auto_56735 ?auto_56736 ?auto_56737 ?auto_56738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56739 - BLOCK
      ?auto_56740 - BLOCK
      ?auto_56741 - BLOCK
      ?auto_56742 - BLOCK
      ?auto_56743 - BLOCK
      ?auto_56744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56739 ) ( ON ?auto_56740 ?auto_56739 ) ( not ( = ?auto_56739 ?auto_56740 ) ) ( not ( = ?auto_56739 ?auto_56741 ) ) ( not ( = ?auto_56739 ?auto_56742 ) ) ( not ( = ?auto_56739 ?auto_56743 ) ) ( not ( = ?auto_56739 ?auto_56744 ) ) ( not ( = ?auto_56740 ?auto_56741 ) ) ( not ( = ?auto_56740 ?auto_56742 ) ) ( not ( = ?auto_56740 ?auto_56743 ) ) ( not ( = ?auto_56740 ?auto_56744 ) ) ( not ( = ?auto_56741 ?auto_56742 ) ) ( not ( = ?auto_56741 ?auto_56743 ) ) ( not ( = ?auto_56741 ?auto_56744 ) ) ( not ( = ?auto_56742 ?auto_56743 ) ) ( not ( = ?auto_56742 ?auto_56744 ) ) ( not ( = ?auto_56743 ?auto_56744 ) ) ( ON-TABLE ?auto_56744 ) ( ON ?auto_56743 ?auto_56744 ) ( ON ?auto_56742 ?auto_56743 ) ( CLEAR ?auto_56742 ) ( HOLDING ?auto_56741 ) ( CLEAR ?auto_56740 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56739 ?auto_56740 ?auto_56741 )
      ( MAKE-6PILE ?auto_56739 ?auto_56740 ?auto_56741 ?auto_56742 ?auto_56743 ?auto_56744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56745 - BLOCK
      ?auto_56746 - BLOCK
      ?auto_56747 - BLOCK
      ?auto_56748 - BLOCK
      ?auto_56749 - BLOCK
      ?auto_56750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56745 ) ( ON ?auto_56746 ?auto_56745 ) ( not ( = ?auto_56745 ?auto_56746 ) ) ( not ( = ?auto_56745 ?auto_56747 ) ) ( not ( = ?auto_56745 ?auto_56748 ) ) ( not ( = ?auto_56745 ?auto_56749 ) ) ( not ( = ?auto_56745 ?auto_56750 ) ) ( not ( = ?auto_56746 ?auto_56747 ) ) ( not ( = ?auto_56746 ?auto_56748 ) ) ( not ( = ?auto_56746 ?auto_56749 ) ) ( not ( = ?auto_56746 ?auto_56750 ) ) ( not ( = ?auto_56747 ?auto_56748 ) ) ( not ( = ?auto_56747 ?auto_56749 ) ) ( not ( = ?auto_56747 ?auto_56750 ) ) ( not ( = ?auto_56748 ?auto_56749 ) ) ( not ( = ?auto_56748 ?auto_56750 ) ) ( not ( = ?auto_56749 ?auto_56750 ) ) ( ON-TABLE ?auto_56750 ) ( ON ?auto_56749 ?auto_56750 ) ( ON ?auto_56748 ?auto_56749 ) ( CLEAR ?auto_56746 ) ( ON ?auto_56747 ?auto_56748 ) ( CLEAR ?auto_56747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56750 ?auto_56749 ?auto_56748 )
      ( MAKE-6PILE ?auto_56745 ?auto_56746 ?auto_56747 ?auto_56748 ?auto_56749 ?auto_56750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56751 - BLOCK
      ?auto_56752 - BLOCK
      ?auto_56753 - BLOCK
      ?auto_56754 - BLOCK
      ?auto_56755 - BLOCK
      ?auto_56756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56751 ) ( not ( = ?auto_56751 ?auto_56752 ) ) ( not ( = ?auto_56751 ?auto_56753 ) ) ( not ( = ?auto_56751 ?auto_56754 ) ) ( not ( = ?auto_56751 ?auto_56755 ) ) ( not ( = ?auto_56751 ?auto_56756 ) ) ( not ( = ?auto_56752 ?auto_56753 ) ) ( not ( = ?auto_56752 ?auto_56754 ) ) ( not ( = ?auto_56752 ?auto_56755 ) ) ( not ( = ?auto_56752 ?auto_56756 ) ) ( not ( = ?auto_56753 ?auto_56754 ) ) ( not ( = ?auto_56753 ?auto_56755 ) ) ( not ( = ?auto_56753 ?auto_56756 ) ) ( not ( = ?auto_56754 ?auto_56755 ) ) ( not ( = ?auto_56754 ?auto_56756 ) ) ( not ( = ?auto_56755 ?auto_56756 ) ) ( ON-TABLE ?auto_56756 ) ( ON ?auto_56755 ?auto_56756 ) ( ON ?auto_56754 ?auto_56755 ) ( ON ?auto_56753 ?auto_56754 ) ( CLEAR ?auto_56753 ) ( HOLDING ?auto_56752 ) ( CLEAR ?auto_56751 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56751 ?auto_56752 )
      ( MAKE-6PILE ?auto_56751 ?auto_56752 ?auto_56753 ?auto_56754 ?auto_56755 ?auto_56756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56757 - BLOCK
      ?auto_56758 - BLOCK
      ?auto_56759 - BLOCK
      ?auto_56760 - BLOCK
      ?auto_56761 - BLOCK
      ?auto_56762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56757 ) ( not ( = ?auto_56757 ?auto_56758 ) ) ( not ( = ?auto_56757 ?auto_56759 ) ) ( not ( = ?auto_56757 ?auto_56760 ) ) ( not ( = ?auto_56757 ?auto_56761 ) ) ( not ( = ?auto_56757 ?auto_56762 ) ) ( not ( = ?auto_56758 ?auto_56759 ) ) ( not ( = ?auto_56758 ?auto_56760 ) ) ( not ( = ?auto_56758 ?auto_56761 ) ) ( not ( = ?auto_56758 ?auto_56762 ) ) ( not ( = ?auto_56759 ?auto_56760 ) ) ( not ( = ?auto_56759 ?auto_56761 ) ) ( not ( = ?auto_56759 ?auto_56762 ) ) ( not ( = ?auto_56760 ?auto_56761 ) ) ( not ( = ?auto_56760 ?auto_56762 ) ) ( not ( = ?auto_56761 ?auto_56762 ) ) ( ON-TABLE ?auto_56762 ) ( ON ?auto_56761 ?auto_56762 ) ( ON ?auto_56760 ?auto_56761 ) ( ON ?auto_56759 ?auto_56760 ) ( CLEAR ?auto_56757 ) ( ON ?auto_56758 ?auto_56759 ) ( CLEAR ?auto_56758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56762 ?auto_56761 ?auto_56760 ?auto_56759 )
      ( MAKE-6PILE ?auto_56757 ?auto_56758 ?auto_56759 ?auto_56760 ?auto_56761 ?auto_56762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56763 - BLOCK
      ?auto_56764 - BLOCK
      ?auto_56765 - BLOCK
      ?auto_56766 - BLOCK
      ?auto_56767 - BLOCK
      ?auto_56768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56763 ?auto_56764 ) ) ( not ( = ?auto_56763 ?auto_56765 ) ) ( not ( = ?auto_56763 ?auto_56766 ) ) ( not ( = ?auto_56763 ?auto_56767 ) ) ( not ( = ?auto_56763 ?auto_56768 ) ) ( not ( = ?auto_56764 ?auto_56765 ) ) ( not ( = ?auto_56764 ?auto_56766 ) ) ( not ( = ?auto_56764 ?auto_56767 ) ) ( not ( = ?auto_56764 ?auto_56768 ) ) ( not ( = ?auto_56765 ?auto_56766 ) ) ( not ( = ?auto_56765 ?auto_56767 ) ) ( not ( = ?auto_56765 ?auto_56768 ) ) ( not ( = ?auto_56766 ?auto_56767 ) ) ( not ( = ?auto_56766 ?auto_56768 ) ) ( not ( = ?auto_56767 ?auto_56768 ) ) ( ON-TABLE ?auto_56768 ) ( ON ?auto_56767 ?auto_56768 ) ( ON ?auto_56766 ?auto_56767 ) ( ON ?auto_56765 ?auto_56766 ) ( ON ?auto_56764 ?auto_56765 ) ( CLEAR ?auto_56764 ) ( HOLDING ?auto_56763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56763 )
      ( MAKE-6PILE ?auto_56763 ?auto_56764 ?auto_56765 ?auto_56766 ?auto_56767 ?auto_56768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56769 - BLOCK
      ?auto_56770 - BLOCK
      ?auto_56771 - BLOCK
      ?auto_56772 - BLOCK
      ?auto_56773 - BLOCK
      ?auto_56774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56769 ?auto_56770 ) ) ( not ( = ?auto_56769 ?auto_56771 ) ) ( not ( = ?auto_56769 ?auto_56772 ) ) ( not ( = ?auto_56769 ?auto_56773 ) ) ( not ( = ?auto_56769 ?auto_56774 ) ) ( not ( = ?auto_56770 ?auto_56771 ) ) ( not ( = ?auto_56770 ?auto_56772 ) ) ( not ( = ?auto_56770 ?auto_56773 ) ) ( not ( = ?auto_56770 ?auto_56774 ) ) ( not ( = ?auto_56771 ?auto_56772 ) ) ( not ( = ?auto_56771 ?auto_56773 ) ) ( not ( = ?auto_56771 ?auto_56774 ) ) ( not ( = ?auto_56772 ?auto_56773 ) ) ( not ( = ?auto_56772 ?auto_56774 ) ) ( not ( = ?auto_56773 ?auto_56774 ) ) ( ON-TABLE ?auto_56774 ) ( ON ?auto_56773 ?auto_56774 ) ( ON ?auto_56772 ?auto_56773 ) ( ON ?auto_56771 ?auto_56772 ) ( ON ?auto_56770 ?auto_56771 ) ( ON ?auto_56769 ?auto_56770 ) ( CLEAR ?auto_56769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56774 ?auto_56773 ?auto_56772 ?auto_56771 ?auto_56770 )
      ( MAKE-6PILE ?auto_56769 ?auto_56770 ?auto_56771 ?auto_56772 ?auto_56773 ?auto_56774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56781 - BLOCK
      ?auto_56782 - BLOCK
      ?auto_56783 - BLOCK
      ?auto_56784 - BLOCK
      ?auto_56785 - BLOCK
      ?auto_56786 - BLOCK
    )
    :vars
    (
      ?auto_56787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56781 ?auto_56782 ) ) ( not ( = ?auto_56781 ?auto_56783 ) ) ( not ( = ?auto_56781 ?auto_56784 ) ) ( not ( = ?auto_56781 ?auto_56785 ) ) ( not ( = ?auto_56781 ?auto_56786 ) ) ( not ( = ?auto_56782 ?auto_56783 ) ) ( not ( = ?auto_56782 ?auto_56784 ) ) ( not ( = ?auto_56782 ?auto_56785 ) ) ( not ( = ?auto_56782 ?auto_56786 ) ) ( not ( = ?auto_56783 ?auto_56784 ) ) ( not ( = ?auto_56783 ?auto_56785 ) ) ( not ( = ?auto_56783 ?auto_56786 ) ) ( not ( = ?auto_56784 ?auto_56785 ) ) ( not ( = ?auto_56784 ?auto_56786 ) ) ( not ( = ?auto_56785 ?auto_56786 ) ) ( ON-TABLE ?auto_56786 ) ( ON ?auto_56785 ?auto_56786 ) ( ON ?auto_56784 ?auto_56785 ) ( ON ?auto_56783 ?auto_56784 ) ( ON ?auto_56782 ?auto_56783 ) ( CLEAR ?auto_56782 ) ( ON ?auto_56781 ?auto_56787 ) ( CLEAR ?auto_56781 ) ( HAND-EMPTY ) ( not ( = ?auto_56781 ?auto_56787 ) ) ( not ( = ?auto_56782 ?auto_56787 ) ) ( not ( = ?auto_56783 ?auto_56787 ) ) ( not ( = ?auto_56784 ?auto_56787 ) ) ( not ( = ?auto_56785 ?auto_56787 ) ) ( not ( = ?auto_56786 ?auto_56787 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56781 ?auto_56787 )
      ( MAKE-6PILE ?auto_56781 ?auto_56782 ?auto_56783 ?auto_56784 ?auto_56785 ?auto_56786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56788 - BLOCK
      ?auto_56789 - BLOCK
      ?auto_56790 - BLOCK
      ?auto_56791 - BLOCK
      ?auto_56792 - BLOCK
      ?auto_56793 - BLOCK
    )
    :vars
    (
      ?auto_56794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56788 ?auto_56789 ) ) ( not ( = ?auto_56788 ?auto_56790 ) ) ( not ( = ?auto_56788 ?auto_56791 ) ) ( not ( = ?auto_56788 ?auto_56792 ) ) ( not ( = ?auto_56788 ?auto_56793 ) ) ( not ( = ?auto_56789 ?auto_56790 ) ) ( not ( = ?auto_56789 ?auto_56791 ) ) ( not ( = ?auto_56789 ?auto_56792 ) ) ( not ( = ?auto_56789 ?auto_56793 ) ) ( not ( = ?auto_56790 ?auto_56791 ) ) ( not ( = ?auto_56790 ?auto_56792 ) ) ( not ( = ?auto_56790 ?auto_56793 ) ) ( not ( = ?auto_56791 ?auto_56792 ) ) ( not ( = ?auto_56791 ?auto_56793 ) ) ( not ( = ?auto_56792 ?auto_56793 ) ) ( ON-TABLE ?auto_56793 ) ( ON ?auto_56792 ?auto_56793 ) ( ON ?auto_56791 ?auto_56792 ) ( ON ?auto_56790 ?auto_56791 ) ( ON ?auto_56788 ?auto_56794 ) ( CLEAR ?auto_56788 ) ( not ( = ?auto_56788 ?auto_56794 ) ) ( not ( = ?auto_56789 ?auto_56794 ) ) ( not ( = ?auto_56790 ?auto_56794 ) ) ( not ( = ?auto_56791 ?auto_56794 ) ) ( not ( = ?auto_56792 ?auto_56794 ) ) ( not ( = ?auto_56793 ?auto_56794 ) ) ( HOLDING ?auto_56789 ) ( CLEAR ?auto_56790 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56793 ?auto_56792 ?auto_56791 ?auto_56790 ?auto_56789 )
      ( MAKE-6PILE ?auto_56788 ?auto_56789 ?auto_56790 ?auto_56791 ?auto_56792 ?auto_56793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56795 - BLOCK
      ?auto_56796 - BLOCK
      ?auto_56797 - BLOCK
      ?auto_56798 - BLOCK
      ?auto_56799 - BLOCK
      ?auto_56800 - BLOCK
    )
    :vars
    (
      ?auto_56801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56795 ?auto_56796 ) ) ( not ( = ?auto_56795 ?auto_56797 ) ) ( not ( = ?auto_56795 ?auto_56798 ) ) ( not ( = ?auto_56795 ?auto_56799 ) ) ( not ( = ?auto_56795 ?auto_56800 ) ) ( not ( = ?auto_56796 ?auto_56797 ) ) ( not ( = ?auto_56796 ?auto_56798 ) ) ( not ( = ?auto_56796 ?auto_56799 ) ) ( not ( = ?auto_56796 ?auto_56800 ) ) ( not ( = ?auto_56797 ?auto_56798 ) ) ( not ( = ?auto_56797 ?auto_56799 ) ) ( not ( = ?auto_56797 ?auto_56800 ) ) ( not ( = ?auto_56798 ?auto_56799 ) ) ( not ( = ?auto_56798 ?auto_56800 ) ) ( not ( = ?auto_56799 ?auto_56800 ) ) ( ON-TABLE ?auto_56800 ) ( ON ?auto_56799 ?auto_56800 ) ( ON ?auto_56798 ?auto_56799 ) ( ON ?auto_56797 ?auto_56798 ) ( ON ?auto_56795 ?auto_56801 ) ( not ( = ?auto_56795 ?auto_56801 ) ) ( not ( = ?auto_56796 ?auto_56801 ) ) ( not ( = ?auto_56797 ?auto_56801 ) ) ( not ( = ?auto_56798 ?auto_56801 ) ) ( not ( = ?auto_56799 ?auto_56801 ) ) ( not ( = ?auto_56800 ?auto_56801 ) ) ( CLEAR ?auto_56797 ) ( ON ?auto_56796 ?auto_56795 ) ( CLEAR ?auto_56796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56801 ?auto_56795 )
      ( MAKE-6PILE ?auto_56795 ?auto_56796 ?auto_56797 ?auto_56798 ?auto_56799 ?auto_56800 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56802 - BLOCK
      ?auto_56803 - BLOCK
      ?auto_56804 - BLOCK
      ?auto_56805 - BLOCK
      ?auto_56806 - BLOCK
      ?auto_56807 - BLOCK
    )
    :vars
    (
      ?auto_56808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56802 ?auto_56803 ) ) ( not ( = ?auto_56802 ?auto_56804 ) ) ( not ( = ?auto_56802 ?auto_56805 ) ) ( not ( = ?auto_56802 ?auto_56806 ) ) ( not ( = ?auto_56802 ?auto_56807 ) ) ( not ( = ?auto_56803 ?auto_56804 ) ) ( not ( = ?auto_56803 ?auto_56805 ) ) ( not ( = ?auto_56803 ?auto_56806 ) ) ( not ( = ?auto_56803 ?auto_56807 ) ) ( not ( = ?auto_56804 ?auto_56805 ) ) ( not ( = ?auto_56804 ?auto_56806 ) ) ( not ( = ?auto_56804 ?auto_56807 ) ) ( not ( = ?auto_56805 ?auto_56806 ) ) ( not ( = ?auto_56805 ?auto_56807 ) ) ( not ( = ?auto_56806 ?auto_56807 ) ) ( ON-TABLE ?auto_56807 ) ( ON ?auto_56806 ?auto_56807 ) ( ON ?auto_56805 ?auto_56806 ) ( ON ?auto_56802 ?auto_56808 ) ( not ( = ?auto_56802 ?auto_56808 ) ) ( not ( = ?auto_56803 ?auto_56808 ) ) ( not ( = ?auto_56804 ?auto_56808 ) ) ( not ( = ?auto_56805 ?auto_56808 ) ) ( not ( = ?auto_56806 ?auto_56808 ) ) ( not ( = ?auto_56807 ?auto_56808 ) ) ( ON ?auto_56803 ?auto_56802 ) ( CLEAR ?auto_56803 ) ( ON-TABLE ?auto_56808 ) ( HOLDING ?auto_56804 ) ( CLEAR ?auto_56805 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56807 ?auto_56806 ?auto_56805 ?auto_56804 )
      ( MAKE-6PILE ?auto_56802 ?auto_56803 ?auto_56804 ?auto_56805 ?auto_56806 ?auto_56807 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56809 - BLOCK
      ?auto_56810 - BLOCK
      ?auto_56811 - BLOCK
      ?auto_56812 - BLOCK
      ?auto_56813 - BLOCK
      ?auto_56814 - BLOCK
    )
    :vars
    (
      ?auto_56815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56809 ?auto_56810 ) ) ( not ( = ?auto_56809 ?auto_56811 ) ) ( not ( = ?auto_56809 ?auto_56812 ) ) ( not ( = ?auto_56809 ?auto_56813 ) ) ( not ( = ?auto_56809 ?auto_56814 ) ) ( not ( = ?auto_56810 ?auto_56811 ) ) ( not ( = ?auto_56810 ?auto_56812 ) ) ( not ( = ?auto_56810 ?auto_56813 ) ) ( not ( = ?auto_56810 ?auto_56814 ) ) ( not ( = ?auto_56811 ?auto_56812 ) ) ( not ( = ?auto_56811 ?auto_56813 ) ) ( not ( = ?auto_56811 ?auto_56814 ) ) ( not ( = ?auto_56812 ?auto_56813 ) ) ( not ( = ?auto_56812 ?auto_56814 ) ) ( not ( = ?auto_56813 ?auto_56814 ) ) ( ON-TABLE ?auto_56814 ) ( ON ?auto_56813 ?auto_56814 ) ( ON ?auto_56812 ?auto_56813 ) ( ON ?auto_56809 ?auto_56815 ) ( not ( = ?auto_56809 ?auto_56815 ) ) ( not ( = ?auto_56810 ?auto_56815 ) ) ( not ( = ?auto_56811 ?auto_56815 ) ) ( not ( = ?auto_56812 ?auto_56815 ) ) ( not ( = ?auto_56813 ?auto_56815 ) ) ( not ( = ?auto_56814 ?auto_56815 ) ) ( ON ?auto_56810 ?auto_56809 ) ( ON-TABLE ?auto_56815 ) ( CLEAR ?auto_56812 ) ( ON ?auto_56811 ?auto_56810 ) ( CLEAR ?auto_56811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56815 ?auto_56809 ?auto_56810 )
      ( MAKE-6PILE ?auto_56809 ?auto_56810 ?auto_56811 ?auto_56812 ?auto_56813 ?auto_56814 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56816 - BLOCK
      ?auto_56817 - BLOCK
      ?auto_56818 - BLOCK
      ?auto_56819 - BLOCK
      ?auto_56820 - BLOCK
      ?auto_56821 - BLOCK
    )
    :vars
    (
      ?auto_56822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56816 ?auto_56817 ) ) ( not ( = ?auto_56816 ?auto_56818 ) ) ( not ( = ?auto_56816 ?auto_56819 ) ) ( not ( = ?auto_56816 ?auto_56820 ) ) ( not ( = ?auto_56816 ?auto_56821 ) ) ( not ( = ?auto_56817 ?auto_56818 ) ) ( not ( = ?auto_56817 ?auto_56819 ) ) ( not ( = ?auto_56817 ?auto_56820 ) ) ( not ( = ?auto_56817 ?auto_56821 ) ) ( not ( = ?auto_56818 ?auto_56819 ) ) ( not ( = ?auto_56818 ?auto_56820 ) ) ( not ( = ?auto_56818 ?auto_56821 ) ) ( not ( = ?auto_56819 ?auto_56820 ) ) ( not ( = ?auto_56819 ?auto_56821 ) ) ( not ( = ?auto_56820 ?auto_56821 ) ) ( ON-TABLE ?auto_56821 ) ( ON ?auto_56820 ?auto_56821 ) ( ON ?auto_56816 ?auto_56822 ) ( not ( = ?auto_56816 ?auto_56822 ) ) ( not ( = ?auto_56817 ?auto_56822 ) ) ( not ( = ?auto_56818 ?auto_56822 ) ) ( not ( = ?auto_56819 ?auto_56822 ) ) ( not ( = ?auto_56820 ?auto_56822 ) ) ( not ( = ?auto_56821 ?auto_56822 ) ) ( ON ?auto_56817 ?auto_56816 ) ( ON-TABLE ?auto_56822 ) ( ON ?auto_56818 ?auto_56817 ) ( CLEAR ?auto_56818 ) ( HOLDING ?auto_56819 ) ( CLEAR ?auto_56820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56821 ?auto_56820 ?auto_56819 )
      ( MAKE-6PILE ?auto_56816 ?auto_56817 ?auto_56818 ?auto_56819 ?auto_56820 ?auto_56821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56823 - BLOCK
      ?auto_56824 - BLOCK
      ?auto_56825 - BLOCK
      ?auto_56826 - BLOCK
      ?auto_56827 - BLOCK
      ?auto_56828 - BLOCK
    )
    :vars
    (
      ?auto_56829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56823 ?auto_56824 ) ) ( not ( = ?auto_56823 ?auto_56825 ) ) ( not ( = ?auto_56823 ?auto_56826 ) ) ( not ( = ?auto_56823 ?auto_56827 ) ) ( not ( = ?auto_56823 ?auto_56828 ) ) ( not ( = ?auto_56824 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56826 ) ) ( not ( = ?auto_56824 ?auto_56827 ) ) ( not ( = ?auto_56824 ?auto_56828 ) ) ( not ( = ?auto_56825 ?auto_56826 ) ) ( not ( = ?auto_56825 ?auto_56827 ) ) ( not ( = ?auto_56825 ?auto_56828 ) ) ( not ( = ?auto_56826 ?auto_56827 ) ) ( not ( = ?auto_56826 ?auto_56828 ) ) ( not ( = ?auto_56827 ?auto_56828 ) ) ( ON-TABLE ?auto_56828 ) ( ON ?auto_56827 ?auto_56828 ) ( ON ?auto_56823 ?auto_56829 ) ( not ( = ?auto_56823 ?auto_56829 ) ) ( not ( = ?auto_56824 ?auto_56829 ) ) ( not ( = ?auto_56825 ?auto_56829 ) ) ( not ( = ?auto_56826 ?auto_56829 ) ) ( not ( = ?auto_56827 ?auto_56829 ) ) ( not ( = ?auto_56828 ?auto_56829 ) ) ( ON ?auto_56824 ?auto_56823 ) ( ON-TABLE ?auto_56829 ) ( ON ?auto_56825 ?auto_56824 ) ( CLEAR ?auto_56827 ) ( ON ?auto_56826 ?auto_56825 ) ( CLEAR ?auto_56826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56829 ?auto_56823 ?auto_56824 ?auto_56825 )
      ( MAKE-6PILE ?auto_56823 ?auto_56824 ?auto_56825 ?auto_56826 ?auto_56827 ?auto_56828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56830 - BLOCK
      ?auto_56831 - BLOCK
      ?auto_56832 - BLOCK
      ?auto_56833 - BLOCK
      ?auto_56834 - BLOCK
      ?auto_56835 - BLOCK
    )
    :vars
    (
      ?auto_56836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56830 ?auto_56831 ) ) ( not ( = ?auto_56830 ?auto_56832 ) ) ( not ( = ?auto_56830 ?auto_56833 ) ) ( not ( = ?auto_56830 ?auto_56834 ) ) ( not ( = ?auto_56830 ?auto_56835 ) ) ( not ( = ?auto_56831 ?auto_56832 ) ) ( not ( = ?auto_56831 ?auto_56833 ) ) ( not ( = ?auto_56831 ?auto_56834 ) ) ( not ( = ?auto_56831 ?auto_56835 ) ) ( not ( = ?auto_56832 ?auto_56833 ) ) ( not ( = ?auto_56832 ?auto_56834 ) ) ( not ( = ?auto_56832 ?auto_56835 ) ) ( not ( = ?auto_56833 ?auto_56834 ) ) ( not ( = ?auto_56833 ?auto_56835 ) ) ( not ( = ?auto_56834 ?auto_56835 ) ) ( ON-TABLE ?auto_56835 ) ( ON ?auto_56830 ?auto_56836 ) ( not ( = ?auto_56830 ?auto_56836 ) ) ( not ( = ?auto_56831 ?auto_56836 ) ) ( not ( = ?auto_56832 ?auto_56836 ) ) ( not ( = ?auto_56833 ?auto_56836 ) ) ( not ( = ?auto_56834 ?auto_56836 ) ) ( not ( = ?auto_56835 ?auto_56836 ) ) ( ON ?auto_56831 ?auto_56830 ) ( ON-TABLE ?auto_56836 ) ( ON ?auto_56832 ?auto_56831 ) ( ON ?auto_56833 ?auto_56832 ) ( CLEAR ?auto_56833 ) ( HOLDING ?auto_56834 ) ( CLEAR ?auto_56835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56835 ?auto_56834 )
      ( MAKE-6PILE ?auto_56830 ?auto_56831 ?auto_56832 ?auto_56833 ?auto_56834 ?auto_56835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56837 - BLOCK
      ?auto_56838 - BLOCK
      ?auto_56839 - BLOCK
      ?auto_56840 - BLOCK
      ?auto_56841 - BLOCK
      ?auto_56842 - BLOCK
    )
    :vars
    (
      ?auto_56843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56837 ?auto_56838 ) ) ( not ( = ?auto_56837 ?auto_56839 ) ) ( not ( = ?auto_56837 ?auto_56840 ) ) ( not ( = ?auto_56837 ?auto_56841 ) ) ( not ( = ?auto_56837 ?auto_56842 ) ) ( not ( = ?auto_56838 ?auto_56839 ) ) ( not ( = ?auto_56838 ?auto_56840 ) ) ( not ( = ?auto_56838 ?auto_56841 ) ) ( not ( = ?auto_56838 ?auto_56842 ) ) ( not ( = ?auto_56839 ?auto_56840 ) ) ( not ( = ?auto_56839 ?auto_56841 ) ) ( not ( = ?auto_56839 ?auto_56842 ) ) ( not ( = ?auto_56840 ?auto_56841 ) ) ( not ( = ?auto_56840 ?auto_56842 ) ) ( not ( = ?auto_56841 ?auto_56842 ) ) ( ON-TABLE ?auto_56842 ) ( ON ?auto_56837 ?auto_56843 ) ( not ( = ?auto_56837 ?auto_56843 ) ) ( not ( = ?auto_56838 ?auto_56843 ) ) ( not ( = ?auto_56839 ?auto_56843 ) ) ( not ( = ?auto_56840 ?auto_56843 ) ) ( not ( = ?auto_56841 ?auto_56843 ) ) ( not ( = ?auto_56842 ?auto_56843 ) ) ( ON ?auto_56838 ?auto_56837 ) ( ON-TABLE ?auto_56843 ) ( ON ?auto_56839 ?auto_56838 ) ( ON ?auto_56840 ?auto_56839 ) ( CLEAR ?auto_56842 ) ( ON ?auto_56841 ?auto_56840 ) ( CLEAR ?auto_56841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56843 ?auto_56837 ?auto_56838 ?auto_56839 ?auto_56840 )
      ( MAKE-6PILE ?auto_56837 ?auto_56838 ?auto_56839 ?auto_56840 ?auto_56841 ?auto_56842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56844 - BLOCK
      ?auto_56845 - BLOCK
      ?auto_56846 - BLOCK
      ?auto_56847 - BLOCK
      ?auto_56848 - BLOCK
      ?auto_56849 - BLOCK
    )
    :vars
    (
      ?auto_56850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56844 ?auto_56845 ) ) ( not ( = ?auto_56844 ?auto_56846 ) ) ( not ( = ?auto_56844 ?auto_56847 ) ) ( not ( = ?auto_56844 ?auto_56848 ) ) ( not ( = ?auto_56844 ?auto_56849 ) ) ( not ( = ?auto_56845 ?auto_56846 ) ) ( not ( = ?auto_56845 ?auto_56847 ) ) ( not ( = ?auto_56845 ?auto_56848 ) ) ( not ( = ?auto_56845 ?auto_56849 ) ) ( not ( = ?auto_56846 ?auto_56847 ) ) ( not ( = ?auto_56846 ?auto_56848 ) ) ( not ( = ?auto_56846 ?auto_56849 ) ) ( not ( = ?auto_56847 ?auto_56848 ) ) ( not ( = ?auto_56847 ?auto_56849 ) ) ( not ( = ?auto_56848 ?auto_56849 ) ) ( ON ?auto_56844 ?auto_56850 ) ( not ( = ?auto_56844 ?auto_56850 ) ) ( not ( = ?auto_56845 ?auto_56850 ) ) ( not ( = ?auto_56846 ?auto_56850 ) ) ( not ( = ?auto_56847 ?auto_56850 ) ) ( not ( = ?auto_56848 ?auto_56850 ) ) ( not ( = ?auto_56849 ?auto_56850 ) ) ( ON ?auto_56845 ?auto_56844 ) ( ON-TABLE ?auto_56850 ) ( ON ?auto_56846 ?auto_56845 ) ( ON ?auto_56847 ?auto_56846 ) ( ON ?auto_56848 ?auto_56847 ) ( CLEAR ?auto_56848 ) ( HOLDING ?auto_56849 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56849 )
      ( MAKE-6PILE ?auto_56844 ?auto_56845 ?auto_56846 ?auto_56847 ?auto_56848 ?auto_56849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56851 - BLOCK
      ?auto_56852 - BLOCK
      ?auto_56853 - BLOCK
      ?auto_56854 - BLOCK
      ?auto_56855 - BLOCK
      ?auto_56856 - BLOCK
    )
    :vars
    (
      ?auto_56857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56851 ?auto_56852 ) ) ( not ( = ?auto_56851 ?auto_56853 ) ) ( not ( = ?auto_56851 ?auto_56854 ) ) ( not ( = ?auto_56851 ?auto_56855 ) ) ( not ( = ?auto_56851 ?auto_56856 ) ) ( not ( = ?auto_56852 ?auto_56853 ) ) ( not ( = ?auto_56852 ?auto_56854 ) ) ( not ( = ?auto_56852 ?auto_56855 ) ) ( not ( = ?auto_56852 ?auto_56856 ) ) ( not ( = ?auto_56853 ?auto_56854 ) ) ( not ( = ?auto_56853 ?auto_56855 ) ) ( not ( = ?auto_56853 ?auto_56856 ) ) ( not ( = ?auto_56854 ?auto_56855 ) ) ( not ( = ?auto_56854 ?auto_56856 ) ) ( not ( = ?auto_56855 ?auto_56856 ) ) ( ON ?auto_56851 ?auto_56857 ) ( not ( = ?auto_56851 ?auto_56857 ) ) ( not ( = ?auto_56852 ?auto_56857 ) ) ( not ( = ?auto_56853 ?auto_56857 ) ) ( not ( = ?auto_56854 ?auto_56857 ) ) ( not ( = ?auto_56855 ?auto_56857 ) ) ( not ( = ?auto_56856 ?auto_56857 ) ) ( ON ?auto_56852 ?auto_56851 ) ( ON-TABLE ?auto_56857 ) ( ON ?auto_56853 ?auto_56852 ) ( ON ?auto_56854 ?auto_56853 ) ( ON ?auto_56855 ?auto_56854 ) ( ON ?auto_56856 ?auto_56855 ) ( CLEAR ?auto_56856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56857 ?auto_56851 ?auto_56852 ?auto_56853 ?auto_56854 ?auto_56855 )
      ( MAKE-6PILE ?auto_56851 ?auto_56852 ?auto_56853 ?auto_56854 ?auto_56855 ?auto_56856 ) )
  )

)

