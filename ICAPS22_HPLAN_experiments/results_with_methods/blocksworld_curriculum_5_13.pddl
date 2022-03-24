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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8249 - BLOCK
    )
    :vars
    (
      ?auto_8250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8249 ?auto_8250 ) ( CLEAR ?auto_8249 ) ( HAND-EMPTY ) ( not ( = ?auto_8249 ?auto_8250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8249 ?auto_8250 )
      ( !PUTDOWN ?auto_8249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8252 - BLOCK
    )
    :vars
    (
      ?auto_8253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8252 ?auto_8253 ) ( CLEAR ?auto_8252 ) ( HAND-EMPTY ) ( not ( = ?auto_8252 ?auto_8253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8252 ?auto_8253 )
      ( !PUTDOWN ?auto_8252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8256 - BLOCK
      ?auto_8257 - BLOCK
    )
    :vars
    (
      ?auto_8258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8256 ) ( ON ?auto_8257 ?auto_8258 ) ( CLEAR ?auto_8257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8256 ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8258 ) ) ( not ( = ?auto_8257 ?auto_8258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8257 ?auto_8258 )
      ( !STACK ?auto_8257 ?auto_8256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8261 - BLOCK
      ?auto_8262 - BLOCK
    )
    :vars
    (
      ?auto_8263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8261 ) ( ON ?auto_8262 ?auto_8263 ) ( CLEAR ?auto_8262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8261 ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( not ( = ?auto_8261 ?auto_8263 ) ) ( not ( = ?auto_8262 ?auto_8263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8262 ?auto_8263 )
      ( !STACK ?auto_8262 ?auto_8261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8266 - BLOCK
      ?auto_8267 - BLOCK
    )
    :vars
    (
      ?auto_8268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8267 ?auto_8268 ) ( not ( = ?auto_8266 ?auto_8267 ) ) ( not ( = ?auto_8266 ?auto_8268 ) ) ( not ( = ?auto_8267 ?auto_8268 ) ) ( ON ?auto_8266 ?auto_8267 ) ( CLEAR ?auto_8266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8266 )
      ( MAKE-2PILE ?auto_8266 ?auto_8267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8271 - BLOCK
      ?auto_8272 - BLOCK
    )
    :vars
    (
      ?auto_8273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8272 ?auto_8273 ) ( not ( = ?auto_8271 ?auto_8272 ) ) ( not ( = ?auto_8271 ?auto_8273 ) ) ( not ( = ?auto_8272 ?auto_8273 ) ) ( ON ?auto_8271 ?auto_8272 ) ( CLEAR ?auto_8271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8271 )
      ( MAKE-2PILE ?auto_8271 ?auto_8272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8277 - BLOCK
      ?auto_8278 - BLOCK
      ?auto_8279 - BLOCK
    )
    :vars
    (
      ?auto_8280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8278 ) ( ON ?auto_8279 ?auto_8280 ) ( CLEAR ?auto_8279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8277 ) ( ON ?auto_8278 ?auto_8277 ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8279 ) ) ( not ( = ?auto_8277 ?auto_8280 ) ) ( not ( = ?auto_8278 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8280 ) ) ( not ( = ?auto_8279 ?auto_8280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8279 ?auto_8280 )
      ( !STACK ?auto_8279 ?auto_8278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8284 - BLOCK
      ?auto_8285 - BLOCK
      ?auto_8286 - BLOCK
    )
    :vars
    (
      ?auto_8287 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8285 ) ( ON ?auto_8286 ?auto_8287 ) ( CLEAR ?auto_8286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8284 ) ( ON ?auto_8285 ?auto_8284 ) ( not ( = ?auto_8284 ?auto_8285 ) ) ( not ( = ?auto_8284 ?auto_8286 ) ) ( not ( = ?auto_8284 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8286 ?auto_8287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8286 ?auto_8287 )
      ( !STACK ?auto_8286 ?auto_8285 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8291 - BLOCK
      ?auto_8292 - BLOCK
      ?auto_8293 - BLOCK
    )
    :vars
    (
      ?auto_8294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8293 ?auto_8294 ) ( ON-TABLE ?auto_8291 ) ( not ( = ?auto_8291 ?auto_8292 ) ) ( not ( = ?auto_8291 ?auto_8293 ) ) ( not ( = ?auto_8291 ?auto_8294 ) ) ( not ( = ?auto_8292 ?auto_8293 ) ) ( not ( = ?auto_8292 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8294 ) ) ( CLEAR ?auto_8291 ) ( ON ?auto_8292 ?auto_8293 ) ( CLEAR ?auto_8292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8291 ?auto_8292 )
      ( MAKE-3PILE ?auto_8291 ?auto_8292 ?auto_8293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8298 - BLOCK
      ?auto_8299 - BLOCK
      ?auto_8300 - BLOCK
    )
    :vars
    (
      ?auto_8301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8300 ?auto_8301 ) ( ON-TABLE ?auto_8298 ) ( not ( = ?auto_8298 ?auto_8299 ) ) ( not ( = ?auto_8298 ?auto_8300 ) ) ( not ( = ?auto_8298 ?auto_8301 ) ) ( not ( = ?auto_8299 ?auto_8300 ) ) ( not ( = ?auto_8299 ?auto_8301 ) ) ( not ( = ?auto_8300 ?auto_8301 ) ) ( CLEAR ?auto_8298 ) ( ON ?auto_8299 ?auto_8300 ) ( CLEAR ?auto_8299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8298 ?auto_8299 )
      ( MAKE-3PILE ?auto_8298 ?auto_8299 ?auto_8300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8305 - BLOCK
      ?auto_8306 - BLOCK
      ?auto_8307 - BLOCK
    )
    :vars
    (
      ?auto_8308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8307 ?auto_8308 ) ( not ( = ?auto_8305 ?auto_8306 ) ) ( not ( = ?auto_8305 ?auto_8307 ) ) ( not ( = ?auto_8305 ?auto_8308 ) ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8306 ?auto_8308 ) ) ( not ( = ?auto_8307 ?auto_8308 ) ) ( ON ?auto_8306 ?auto_8307 ) ( ON ?auto_8305 ?auto_8306 ) ( CLEAR ?auto_8305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8305 )
      ( MAKE-3PILE ?auto_8305 ?auto_8306 ?auto_8307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8312 - BLOCK
      ?auto_8313 - BLOCK
      ?auto_8314 - BLOCK
    )
    :vars
    (
      ?auto_8315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8314 ?auto_8315 ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( not ( = ?auto_8312 ?auto_8314 ) ) ( not ( = ?auto_8312 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( ON ?auto_8313 ?auto_8314 ) ( ON ?auto_8312 ?auto_8313 ) ( CLEAR ?auto_8312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8312 )
      ( MAKE-3PILE ?auto_8312 ?auto_8313 ?auto_8314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8320 - BLOCK
      ?auto_8321 - BLOCK
      ?auto_8322 - BLOCK
      ?auto_8323 - BLOCK
    )
    :vars
    (
      ?auto_8324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8322 ) ( ON ?auto_8323 ?auto_8324 ) ( CLEAR ?auto_8323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8320 ) ( ON ?auto_8321 ?auto_8320 ) ( ON ?auto_8322 ?auto_8321 ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( not ( = ?auto_8320 ?auto_8322 ) ) ( not ( = ?auto_8320 ?auto_8323 ) ) ( not ( = ?auto_8320 ?auto_8324 ) ) ( not ( = ?auto_8321 ?auto_8322 ) ) ( not ( = ?auto_8321 ?auto_8323 ) ) ( not ( = ?auto_8321 ?auto_8324 ) ) ( not ( = ?auto_8322 ?auto_8323 ) ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( not ( = ?auto_8323 ?auto_8324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8323 ?auto_8324 )
      ( !STACK ?auto_8323 ?auto_8322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8329 - BLOCK
      ?auto_8330 - BLOCK
      ?auto_8331 - BLOCK
      ?auto_8332 - BLOCK
    )
    :vars
    (
      ?auto_8333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8331 ) ( ON ?auto_8332 ?auto_8333 ) ( CLEAR ?auto_8332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8329 ) ( ON ?auto_8330 ?auto_8329 ) ( ON ?auto_8331 ?auto_8330 ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8331 ) ) ( not ( = ?auto_8329 ?auto_8332 ) ) ( not ( = ?auto_8329 ?auto_8333 ) ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8330 ?auto_8333 ) ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8333 ) ) ( not ( = ?auto_8332 ?auto_8333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8332 ?auto_8333 )
      ( !STACK ?auto_8332 ?auto_8331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8338 - BLOCK
      ?auto_8339 - BLOCK
      ?auto_8340 - BLOCK
      ?auto_8341 - BLOCK
    )
    :vars
    (
      ?auto_8342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8341 ?auto_8342 ) ( ON-TABLE ?auto_8338 ) ( ON ?auto_8339 ?auto_8338 ) ( not ( = ?auto_8338 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8340 ) ) ( not ( = ?auto_8338 ?auto_8341 ) ) ( not ( = ?auto_8338 ?auto_8342 ) ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8341 ) ) ( not ( = ?auto_8339 ?auto_8342 ) ) ( not ( = ?auto_8340 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8342 ) ) ( CLEAR ?auto_8339 ) ( ON ?auto_8340 ?auto_8341 ) ( CLEAR ?auto_8340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8338 ?auto_8339 ?auto_8340 )
      ( MAKE-4PILE ?auto_8338 ?auto_8339 ?auto_8340 ?auto_8341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8347 - BLOCK
      ?auto_8348 - BLOCK
      ?auto_8349 - BLOCK
      ?auto_8350 - BLOCK
    )
    :vars
    (
      ?auto_8351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8350 ?auto_8351 ) ( ON-TABLE ?auto_8347 ) ( ON ?auto_8348 ?auto_8347 ) ( not ( = ?auto_8347 ?auto_8348 ) ) ( not ( = ?auto_8347 ?auto_8349 ) ) ( not ( = ?auto_8347 ?auto_8350 ) ) ( not ( = ?auto_8347 ?auto_8351 ) ) ( not ( = ?auto_8348 ?auto_8349 ) ) ( not ( = ?auto_8348 ?auto_8350 ) ) ( not ( = ?auto_8348 ?auto_8351 ) ) ( not ( = ?auto_8349 ?auto_8350 ) ) ( not ( = ?auto_8349 ?auto_8351 ) ) ( not ( = ?auto_8350 ?auto_8351 ) ) ( CLEAR ?auto_8348 ) ( ON ?auto_8349 ?auto_8350 ) ( CLEAR ?auto_8349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8347 ?auto_8348 ?auto_8349 )
      ( MAKE-4PILE ?auto_8347 ?auto_8348 ?auto_8349 ?auto_8350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8356 - BLOCK
      ?auto_8357 - BLOCK
      ?auto_8358 - BLOCK
      ?auto_8359 - BLOCK
    )
    :vars
    (
      ?auto_8360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8359 ?auto_8360 ) ( ON-TABLE ?auto_8356 ) ( not ( = ?auto_8356 ?auto_8357 ) ) ( not ( = ?auto_8356 ?auto_8358 ) ) ( not ( = ?auto_8356 ?auto_8359 ) ) ( not ( = ?auto_8356 ?auto_8360 ) ) ( not ( = ?auto_8357 ?auto_8358 ) ) ( not ( = ?auto_8357 ?auto_8359 ) ) ( not ( = ?auto_8357 ?auto_8360 ) ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( not ( = ?auto_8358 ?auto_8360 ) ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( ON ?auto_8358 ?auto_8359 ) ( CLEAR ?auto_8356 ) ( ON ?auto_8357 ?auto_8358 ) ( CLEAR ?auto_8357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8356 ?auto_8357 )
      ( MAKE-4PILE ?auto_8356 ?auto_8357 ?auto_8358 ?auto_8359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8365 - BLOCK
      ?auto_8366 - BLOCK
      ?auto_8367 - BLOCK
      ?auto_8368 - BLOCK
    )
    :vars
    (
      ?auto_8369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8368 ?auto_8369 ) ( ON-TABLE ?auto_8365 ) ( not ( = ?auto_8365 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8367 ) ) ( not ( = ?auto_8365 ?auto_8368 ) ) ( not ( = ?auto_8365 ?auto_8369 ) ) ( not ( = ?auto_8366 ?auto_8367 ) ) ( not ( = ?auto_8366 ?auto_8368 ) ) ( not ( = ?auto_8366 ?auto_8369 ) ) ( not ( = ?auto_8367 ?auto_8368 ) ) ( not ( = ?auto_8367 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8369 ) ) ( ON ?auto_8367 ?auto_8368 ) ( CLEAR ?auto_8365 ) ( ON ?auto_8366 ?auto_8367 ) ( CLEAR ?auto_8366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8365 ?auto_8366 )
      ( MAKE-4PILE ?auto_8365 ?auto_8366 ?auto_8367 ?auto_8368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8374 - BLOCK
      ?auto_8375 - BLOCK
      ?auto_8376 - BLOCK
      ?auto_8377 - BLOCK
    )
    :vars
    (
      ?auto_8378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8377 ?auto_8378 ) ( not ( = ?auto_8374 ?auto_8375 ) ) ( not ( = ?auto_8374 ?auto_8376 ) ) ( not ( = ?auto_8374 ?auto_8377 ) ) ( not ( = ?auto_8374 ?auto_8378 ) ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( ON ?auto_8376 ?auto_8377 ) ( ON ?auto_8375 ?auto_8376 ) ( ON ?auto_8374 ?auto_8375 ) ( CLEAR ?auto_8374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8374 )
      ( MAKE-4PILE ?auto_8374 ?auto_8375 ?auto_8376 ?auto_8377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8383 - BLOCK
      ?auto_8384 - BLOCK
      ?auto_8385 - BLOCK
      ?auto_8386 - BLOCK
    )
    :vars
    (
      ?auto_8387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8386 ?auto_8387 ) ( not ( = ?auto_8383 ?auto_8384 ) ) ( not ( = ?auto_8383 ?auto_8385 ) ) ( not ( = ?auto_8383 ?auto_8386 ) ) ( not ( = ?auto_8383 ?auto_8387 ) ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8386 ) ) ( not ( = ?auto_8384 ?auto_8387 ) ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( not ( = ?auto_8385 ?auto_8387 ) ) ( not ( = ?auto_8386 ?auto_8387 ) ) ( ON ?auto_8385 ?auto_8386 ) ( ON ?auto_8384 ?auto_8385 ) ( ON ?auto_8383 ?auto_8384 ) ( CLEAR ?auto_8383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8383 )
      ( MAKE-4PILE ?auto_8383 ?auto_8384 ?auto_8385 ?auto_8386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8393 - BLOCK
      ?auto_8394 - BLOCK
      ?auto_8395 - BLOCK
      ?auto_8396 - BLOCK
      ?auto_8397 - BLOCK
    )
    :vars
    (
      ?auto_8398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8396 ) ( ON ?auto_8397 ?auto_8398 ) ( CLEAR ?auto_8397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8393 ) ( ON ?auto_8394 ?auto_8393 ) ( ON ?auto_8395 ?auto_8394 ) ( ON ?auto_8396 ?auto_8395 ) ( not ( = ?auto_8393 ?auto_8394 ) ) ( not ( = ?auto_8393 ?auto_8395 ) ) ( not ( = ?auto_8393 ?auto_8396 ) ) ( not ( = ?auto_8393 ?auto_8397 ) ) ( not ( = ?auto_8393 ?auto_8398 ) ) ( not ( = ?auto_8394 ?auto_8395 ) ) ( not ( = ?auto_8394 ?auto_8396 ) ) ( not ( = ?auto_8394 ?auto_8397 ) ) ( not ( = ?auto_8394 ?auto_8398 ) ) ( not ( = ?auto_8395 ?auto_8396 ) ) ( not ( = ?auto_8395 ?auto_8397 ) ) ( not ( = ?auto_8395 ?auto_8398 ) ) ( not ( = ?auto_8396 ?auto_8397 ) ) ( not ( = ?auto_8396 ?auto_8398 ) ) ( not ( = ?auto_8397 ?auto_8398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8397 ?auto_8398 )
      ( !STACK ?auto_8397 ?auto_8396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8404 - BLOCK
      ?auto_8405 - BLOCK
      ?auto_8406 - BLOCK
      ?auto_8407 - BLOCK
      ?auto_8408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8407 ) ( ON-TABLE ?auto_8408 ) ( CLEAR ?auto_8408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8404 ) ( ON ?auto_8405 ?auto_8404 ) ( ON ?auto_8406 ?auto_8405 ) ( ON ?auto_8407 ?auto_8406 ) ( not ( = ?auto_8404 ?auto_8405 ) ) ( not ( = ?auto_8404 ?auto_8406 ) ) ( not ( = ?auto_8404 ?auto_8407 ) ) ( not ( = ?auto_8404 ?auto_8408 ) ) ( not ( = ?auto_8405 ?auto_8406 ) ) ( not ( = ?auto_8405 ?auto_8407 ) ) ( not ( = ?auto_8405 ?auto_8408 ) ) ( not ( = ?auto_8406 ?auto_8407 ) ) ( not ( = ?auto_8406 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8408 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_8408 )
      ( !STACK ?auto_8408 ?auto_8407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8414 - BLOCK
      ?auto_8415 - BLOCK
      ?auto_8416 - BLOCK
      ?auto_8417 - BLOCK
      ?auto_8418 - BLOCK
    )
    :vars
    (
      ?auto_8419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8418 ?auto_8419 ) ( ON-TABLE ?auto_8414 ) ( ON ?auto_8415 ?auto_8414 ) ( ON ?auto_8416 ?auto_8415 ) ( not ( = ?auto_8414 ?auto_8415 ) ) ( not ( = ?auto_8414 ?auto_8416 ) ) ( not ( = ?auto_8414 ?auto_8417 ) ) ( not ( = ?auto_8414 ?auto_8418 ) ) ( not ( = ?auto_8414 ?auto_8419 ) ) ( not ( = ?auto_8415 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8417 ) ) ( not ( = ?auto_8415 ?auto_8418 ) ) ( not ( = ?auto_8415 ?auto_8419 ) ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8418 ) ) ( not ( = ?auto_8416 ?auto_8419 ) ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( CLEAR ?auto_8416 ) ( ON ?auto_8417 ?auto_8418 ) ( CLEAR ?auto_8417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8414 ?auto_8415 ?auto_8416 ?auto_8417 )
      ( MAKE-5PILE ?auto_8414 ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8425 - BLOCK
      ?auto_8426 - BLOCK
      ?auto_8427 - BLOCK
      ?auto_8428 - BLOCK
      ?auto_8429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8429 ) ( ON-TABLE ?auto_8425 ) ( ON ?auto_8426 ?auto_8425 ) ( ON ?auto_8427 ?auto_8426 ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( not ( = ?auto_8425 ?auto_8428 ) ) ( not ( = ?auto_8425 ?auto_8429 ) ) ( not ( = ?auto_8426 ?auto_8427 ) ) ( not ( = ?auto_8426 ?auto_8428 ) ) ( not ( = ?auto_8426 ?auto_8429 ) ) ( not ( = ?auto_8427 ?auto_8428 ) ) ( not ( = ?auto_8427 ?auto_8429 ) ) ( not ( = ?auto_8428 ?auto_8429 ) ) ( CLEAR ?auto_8427 ) ( ON ?auto_8428 ?auto_8429 ) ( CLEAR ?auto_8428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8425 ?auto_8426 ?auto_8427 ?auto_8428 )
      ( MAKE-5PILE ?auto_8425 ?auto_8426 ?auto_8427 ?auto_8428 ?auto_8429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8435 - BLOCK
      ?auto_8436 - BLOCK
      ?auto_8437 - BLOCK
      ?auto_8438 - BLOCK
      ?auto_8439 - BLOCK
    )
    :vars
    (
      ?auto_8440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8439 ?auto_8440 ) ( ON-TABLE ?auto_8435 ) ( ON ?auto_8436 ?auto_8435 ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8438 ) ) ( not ( = ?auto_8435 ?auto_8439 ) ) ( not ( = ?auto_8435 ?auto_8440 ) ) ( not ( = ?auto_8436 ?auto_8437 ) ) ( not ( = ?auto_8436 ?auto_8438 ) ) ( not ( = ?auto_8436 ?auto_8439 ) ) ( not ( = ?auto_8436 ?auto_8440 ) ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( not ( = ?auto_8437 ?auto_8440 ) ) ( not ( = ?auto_8438 ?auto_8439 ) ) ( not ( = ?auto_8438 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( ON ?auto_8438 ?auto_8439 ) ( CLEAR ?auto_8436 ) ( ON ?auto_8437 ?auto_8438 ) ( CLEAR ?auto_8437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8435 ?auto_8436 ?auto_8437 )
      ( MAKE-5PILE ?auto_8435 ?auto_8436 ?auto_8437 ?auto_8438 ?auto_8439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8446 - BLOCK
      ?auto_8447 - BLOCK
      ?auto_8448 - BLOCK
      ?auto_8449 - BLOCK
      ?auto_8450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8450 ) ( ON-TABLE ?auto_8446 ) ( ON ?auto_8447 ?auto_8446 ) ( not ( = ?auto_8446 ?auto_8447 ) ) ( not ( = ?auto_8446 ?auto_8448 ) ) ( not ( = ?auto_8446 ?auto_8449 ) ) ( not ( = ?auto_8446 ?auto_8450 ) ) ( not ( = ?auto_8447 ?auto_8448 ) ) ( not ( = ?auto_8447 ?auto_8449 ) ) ( not ( = ?auto_8447 ?auto_8450 ) ) ( not ( = ?auto_8448 ?auto_8449 ) ) ( not ( = ?auto_8448 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( ON ?auto_8449 ?auto_8450 ) ( CLEAR ?auto_8447 ) ( ON ?auto_8448 ?auto_8449 ) ( CLEAR ?auto_8448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8446 ?auto_8447 ?auto_8448 )
      ( MAKE-5PILE ?auto_8446 ?auto_8447 ?auto_8448 ?auto_8449 ?auto_8450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8456 - BLOCK
      ?auto_8457 - BLOCK
      ?auto_8458 - BLOCK
      ?auto_8459 - BLOCK
      ?auto_8460 - BLOCK
    )
    :vars
    (
      ?auto_8461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8460 ?auto_8461 ) ( ON-TABLE ?auto_8456 ) ( not ( = ?auto_8456 ?auto_8457 ) ) ( not ( = ?auto_8456 ?auto_8458 ) ) ( not ( = ?auto_8456 ?auto_8459 ) ) ( not ( = ?auto_8456 ?auto_8460 ) ) ( not ( = ?auto_8456 ?auto_8461 ) ) ( not ( = ?auto_8457 ?auto_8458 ) ) ( not ( = ?auto_8457 ?auto_8459 ) ) ( not ( = ?auto_8457 ?auto_8460 ) ) ( not ( = ?auto_8457 ?auto_8461 ) ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( not ( = ?auto_8458 ?auto_8460 ) ) ( not ( = ?auto_8458 ?auto_8461 ) ) ( not ( = ?auto_8459 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( ON ?auto_8459 ?auto_8460 ) ( ON ?auto_8458 ?auto_8459 ) ( CLEAR ?auto_8456 ) ( ON ?auto_8457 ?auto_8458 ) ( CLEAR ?auto_8457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8456 ?auto_8457 )
      ( MAKE-5PILE ?auto_8456 ?auto_8457 ?auto_8458 ?auto_8459 ?auto_8460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8467 - BLOCK
      ?auto_8468 - BLOCK
      ?auto_8469 - BLOCK
      ?auto_8470 - BLOCK
      ?auto_8471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8471 ) ( ON-TABLE ?auto_8467 ) ( not ( = ?auto_8467 ?auto_8468 ) ) ( not ( = ?auto_8467 ?auto_8469 ) ) ( not ( = ?auto_8467 ?auto_8470 ) ) ( not ( = ?auto_8467 ?auto_8471 ) ) ( not ( = ?auto_8468 ?auto_8469 ) ) ( not ( = ?auto_8468 ?auto_8470 ) ) ( not ( = ?auto_8468 ?auto_8471 ) ) ( not ( = ?auto_8469 ?auto_8470 ) ) ( not ( = ?auto_8469 ?auto_8471 ) ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( ON ?auto_8470 ?auto_8471 ) ( ON ?auto_8469 ?auto_8470 ) ( CLEAR ?auto_8467 ) ( ON ?auto_8468 ?auto_8469 ) ( CLEAR ?auto_8468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8467 ?auto_8468 )
      ( MAKE-5PILE ?auto_8467 ?auto_8468 ?auto_8469 ?auto_8470 ?auto_8471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8477 - BLOCK
      ?auto_8478 - BLOCK
      ?auto_8479 - BLOCK
      ?auto_8480 - BLOCK
      ?auto_8481 - BLOCK
    )
    :vars
    (
      ?auto_8482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8481 ?auto_8482 ) ( not ( = ?auto_8477 ?auto_8478 ) ) ( not ( = ?auto_8477 ?auto_8479 ) ) ( not ( = ?auto_8477 ?auto_8480 ) ) ( not ( = ?auto_8477 ?auto_8481 ) ) ( not ( = ?auto_8477 ?auto_8482 ) ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8480 ) ) ( not ( = ?auto_8478 ?auto_8481 ) ) ( not ( = ?auto_8478 ?auto_8482 ) ) ( not ( = ?auto_8479 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8481 ) ) ( not ( = ?auto_8479 ?auto_8482 ) ) ( not ( = ?auto_8480 ?auto_8481 ) ) ( not ( = ?auto_8480 ?auto_8482 ) ) ( not ( = ?auto_8481 ?auto_8482 ) ) ( ON ?auto_8480 ?auto_8481 ) ( ON ?auto_8479 ?auto_8480 ) ( ON ?auto_8478 ?auto_8479 ) ( ON ?auto_8477 ?auto_8478 ) ( CLEAR ?auto_8477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8477 )
      ( MAKE-5PILE ?auto_8477 ?auto_8478 ?auto_8479 ?auto_8480 ?auto_8481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8488 - BLOCK
      ?auto_8489 - BLOCK
      ?auto_8490 - BLOCK
      ?auto_8491 - BLOCK
      ?auto_8492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8492 ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8488 ?auto_8491 ) ) ( not ( = ?auto_8488 ?auto_8492 ) ) ( not ( = ?auto_8489 ?auto_8490 ) ) ( not ( = ?auto_8489 ?auto_8491 ) ) ( not ( = ?auto_8489 ?auto_8492 ) ) ( not ( = ?auto_8490 ?auto_8491 ) ) ( not ( = ?auto_8490 ?auto_8492 ) ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( ON ?auto_8491 ?auto_8492 ) ( ON ?auto_8490 ?auto_8491 ) ( ON ?auto_8489 ?auto_8490 ) ( ON ?auto_8488 ?auto_8489 ) ( CLEAR ?auto_8488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8488 )
      ( MAKE-5PILE ?auto_8488 ?auto_8489 ?auto_8490 ?auto_8491 ?auto_8492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8498 - BLOCK
      ?auto_8499 - BLOCK
      ?auto_8500 - BLOCK
      ?auto_8501 - BLOCK
      ?auto_8502 - BLOCK
    )
    :vars
    (
      ?auto_8503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8498 ?auto_8499 ) ) ( not ( = ?auto_8498 ?auto_8500 ) ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( not ( = ?auto_8498 ?auto_8502 ) ) ( not ( = ?auto_8499 ?auto_8500 ) ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( not ( = ?auto_8499 ?auto_8502 ) ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8500 ?auto_8502 ) ) ( not ( = ?auto_8501 ?auto_8502 ) ) ( ON ?auto_8498 ?auto_8503 ) ( not ( = ?auto_8502 ?auto_8503 ) ) ( not ( = ?auto_8501 ?auto_8503 ) ) ( not ( = ?auto_8500 ?auto_8503 ) ) ( not ( = ?auto_8499 ?auto_8503 ) ) ( not ( = ?auto_8498 ?auto_8503 ) ) ( ON ?auto_8499 ?auto_8498 ) ( ON ?auto_8500 ?auto_8499 ) ( ON ?auto_8501 ?auto_8500 ) ( ON ?auto_8502 ?auto_8501 ) ( CLEAR ?auto_8502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_8502 ?auto_8501 ?auto_8500 ?auto_8499 ?auto_8498 )
      ( MAKE-5PILE ?auto_8498 ?auto_8499 ?auto_8500 ?auto_8501 ?auto_8502 ) )
  )

)

