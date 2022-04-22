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
      ?auto_309201 - BLOCK
    )
    :vars
    (
      ?auto_309202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309201 ?auto_309202 ) ( CLEAR ?auto_309201 ) ( HAND-EMPTY ) ( not ( = ?auto_309201 ?auto_309202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309201 ?auto_309202 )
      ( !PUTDOWN ?auto_309201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_309208 - BLOCK
      ?auto_309209 - BLOCK
    )
    :vars
    (
      ?auto_309210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309208 ) ( ON ?auto_309209 ?auto_309210 ) ( CLEAR ?auto_309209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309208 ) ( not ( = ?auto_309208 ?auto_309209 ) ) ( not ( = ?auto_309208 ?auto_309210 ) ) ( not ( = ?auto_309209 ?auto_309210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309209 ?auto_309210 )
      ( !STACK ?auto_309209 ?auto_309208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_309218 - BLOCK
      ?auto_309219 - BLOCK
    )
    :vars
    (
      ?auto_309220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309219 ?auto_309220 ) ( not ( = ?auto_309218 ?auto_309219 ) ) ( not ( = ?auto_309218 ?auto_309220 ) ) ( not ( = ?auto_309219 ?auto_309220 ) ) ( ON ?auto_309218 ?auto_309219 ) ( CLEAR ?auto_309218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309218 )
      ( MAKE-2PILE ?auto_309218 ?auto_309219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_309229 - BLOCK
      ?auto_309230 - BLOCK
      ?auto_309231 - BLOCK
    )
    :vars
    (
      ?auto_309232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309230 ) ( ON ?auto_309231 ?auto_309232 ) ( CLEAR ?auto_309231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309229 ) ( ON ?auto_309230 ?auto_309229 ) ( not ( = ?auto_309229 ?auto_309230 ) ) ( not ( = ?auto_309229 ?auto_309231 ) ) ( not ( = ?auto_309229 ?auto_309232 ) ) ( not ( = ?auto_309230 ?auto_309231 ) ) ( not ( = ?auto_309230 ?auto_309232 ) ) ( not ( = ?auto_309231 ?auto_309232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309231 ?auto_309232 )
      ( !STACK ?auto_309231 ?auto_309230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_309243 - BLOCK
      ?auto_309244 - BLOCK
      ?auto_309245 - BLOCK
    )
    :vars
    (
      ?auto_309246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309245 ?auto_309246 ) ( ON-TABLE ?auto_309243 ) ( not ( = ?auto_309243 ?auto_309244 ) ) ( not ( = ?auto_309243 ?auto_309245 ) ) ( not ( = ?auto_309243 ?auto_309246 ) ) ( not ( = ?auto_309244 ?auto_309245 ) ) ( not ( = ?auto_309244 ?auto_309246 ) ) ( not ( = ?auto_309245 ?auto_309246 ) ) ( CLEAR ?auto_309243 ) ( ON ?auto_309244 ?auto_309245 ) ( CLEAR ?auto_309244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309243 ?auto_309244 )
      ( MAKE-3PILE ?auto_309243 ?auto_309244 ?auto_309245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_309257 - BLOCK
      ?auto_309258 - BLOCK
      ?auto_309259 - BLOCK
    )
    :vars
    (
      ?auto_309260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309259 ?auto_309260 ) ( not ( = ?auto_309257 ?auto_309258 ) ) ( not ( = ?auto_309257 ?auto_309259 ) ) ( not ( = ?auto_309257 ?auto_309260 ) ) ( not ( = ?auto_309258 ?auto_309259 ) ) ( not ( = ?auto_309258 ?auto_309260 ) ) ( not ( = ?auto_309259 ?auto_309260 ) ) ( ON ?auto_309258 ?auto_309259 ) ( ON ?auto_309257 ?auto_309258 ) ( CLEAR ?auto_309257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309257 )
      ( MAKE-3PILE ?auto_309257 ?auto_309258 ?auto_309259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_309272 - BLOCK
      ?auto_309273 - BLOCK
      ?auto_309274 - BLOCK
      ?auto_309275 - BLOCK
    )
    :vars
    (
      ?auto_309276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309274 ) ( ON ?auto_309275 ?auto_309276 ) ( CLEAR ?auto_309275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309272 ) ( ON ?auto_309273 ?auto_309272 ) ( ON ?auto_309274 ?auto_309273 ) ( not ( = ?auto_309272 ?auto_309273 ) ) ( not ( = ?auto_309272 ?auto_309274 ) ) ( not ( = ?auto_309272 ?auto_309275 ) ) ( not ( = ?auto_309272 ?auto_309276 ) ) ( not ( = ?auto_309273 ?auto_309274 ) ) ( not ( = ?auto_309273 ?auto_309275 ) ) ( not ( = ?auto_309273 ?auto_309276 ) ) ( not ( = ?auto_309274 ?auto_309275 ) ) ( not ( = ?auto_309274 ?auto_309276 ) ) ( not ( = ?auto_309275 ?auto_309276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309275 ?auto_309276 )
      ( !STACK ?auto_309275 ?auto_309274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_309290 - BLOCK
      ?auto_309291 - BLOCK
      ?auto_309292 - BLOCK
      ?auto_309293 - BLOCK
    )
    :vars
    (
      ?auto_309294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309293 ?auto_309294 ) ( ON-TABLE ?auto_309290 ) ( ON ?auto_309291 ?auto_309290 ) ( not ( = ?auto_309290 ?auto_309291 ) ) ( not ( = ?auto_309290 ?auto_309292 ) ) ( not ( = ?auto_309290 ?auto_309293 ) ) ( not ( = ?auto_309290 ?auto_309294 ) ) ( not ( = ?auto_309291 ?auto_309292 ) ) ( not ( = ?auto_309291 ?auto_309293 ) ) ( not ( = ?auto_309291 ?auto_309294 ) ) ( not ( = ?auto_309292 ?auto_309293 ) ) ( not ( = ?auto_309292 ?auto_309294 ) ) ( not ( = ?auto_309293 ?auto_309294 ) ) ( CLEAR ?auto_309291 ) ( ON ?auto_309292 ?auto_309293 ) ( CLEAR ?auto_309292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309290 ?auto_309291 ?auto_309292 )
      ( MAKE-4PILE ?auto_309290 ?auto_309291 ?auto_309292 ?auto_309293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_309308 - BLOCK
      ?auto_309309 - BLOCK
      ?auto_309310 - BLOCK
      ?auto_309311 - BLOCK
    )
    :vars
    (
      ?auto_309312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309311 ?auto_309312 ) ( ON-TABLE ?auto_309308 ) ( not ( = ?auto_309308 ?auto_309309 ) ) ( not ( = ?auto_309308 ?auto_309310 ) ) ( not ( = ?auto_309308 ?auto_309311 ) ) ( not ( = ?auto_309308 ?auto_309312 ) ) ( not ( = ?auto_309309 ?auto_309310 ) ) ( not ( = ?auto_309309 ?auto_309311 ) ) ( not ( = ?auto_309309 ?auto_309312 ) ) ( not ( = ?auto_309310 ?auto_309311 ) ) ( not ( = ?auto_309310 ?auto_309312 ) ) ( not ( = ?auto_309311 ?auto_309312 ) ) ( ON ?auto_309310 ?auto_309311 ) ( CLEAR ?auto_309308 ) ( ON ?auto_309309 ?auto_309310 ) ( CLEAR ?auto_309309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309308 ?auto_309309 )
      ( MAKE-4PILE ?auto_309308 ?auto_309309 ?auto_309310 ?auto_309311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_309326 - BLOCK
      ?auto_309327 - BLOCK
      ?auto_309328 - BLOCK
      ?auto_309329 - BLOCK
    )
    :vars
    (
      ?auto_309330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309329 ?auto_309330 ) ( not ( = ?auto_309326 ?auto_309327 ) ) ( not ( = ?auto_309326 ?auto_309328 ) ) ( not ( = ?auto_309326 ?auto_309329 ) ) ( not ( = ?auto_309326 ?auto_309330 ) ) ( not ( = ?auto_309327 ?auto_309328 ) ) ( not ( = ?auto_309327 ?auto_309329 ) ) ( not ( = ?auto_309327 ?auto_309330 ) ) ( not ( = ?auto_309328 ?auto_309329 ) ) ( not ( = ?auto_309328 ?auto_309330 ) ) ( not ( = ?auto_309329 ?auto_309330 ) ) ( ON ?auto_309328 ?auto_309329 ) ( ON ?auto_309327 ?auto_309328 ) ( ON ?auto_309326 ?auto_309327 ) ( CLEAR ?auto_309326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309326 )
      ( MAKE-4PILE ?auto_309326 ?auto_309327 ?auto_309328 ?auto_309329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_309345 - BLOCK
      ?auto_309346 - BLOCK
      ?auto_309347 - BLOCK
      ?auto_309348 - BLOCK
      ?auto_309349 - BLOCK
    )
    :vars
    (
      ?auto_309350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309348 ) ( ON ?auto_309349 ?auto_309350 ) ( CLEAR ?auto_309349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309345 ) ( ON ?auto_309346 ?auto_309345 ) ( ON ?auto_309347 ?auto_309346 ) ( ON ?auto_309348 ?auto_309347 ) ( not ( = ?auto_309345 ?auto_309346 ) ) ( not ( = ?auto_309345 ?auto_309347 ) ) ( not ( = ?auto_309345 ?auto_309348 ) ) ( not ( = ?auto_309345 ?auto_309349 ) ) ( not ( = ?auto_309345 ?auto_309350 ) ) ( not ( = ?auto_309346 ?auto_309347 ) ) ( not ( = ?auto_309346 ?auto_309348 ) ) ( not ( = ?auto_309346 ?auto_309349 ) ) ( not ( = ?auto_309346 ?auto_309350 ) ) ( not ( = ?auto_309347 ?auto_309348 ) ) ( not ( = ?auto_309347 ?auto_309349 ) ) ( not ( = ?auto_309347 ?auto_309350 ) ) ( not ( = ?auto_309348 ?auto_309349 ) ) ( not ( = ?auto_309348 ?auto_309350 ) ) ( not ( = ?auto_309349 ?auto_309350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309349 ?auto_309350 )
      ( !STACK ?auto_309349 ?auto_309348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_309367 - BLOCK
      ?auto_309368 - BLOCK
      ?auto_309369 - BLOCK
      ?auto_309370 - BLOCK
      ?auto_309371 - BLOCK
    )
    :vars
    (
      ?auto_309372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309371 ?auto_309372 ) ( ON-TABLE ?auto_309367 ) ( ON ?auto_309368 ?auto_309367 ) ( ON ?auto_309369 ?auto_309368 ) ( not ( = ?auto_309367 ?auto_309368 ) ) ( not ( = ?auto_309367 ?auto_309369 ) ) ( not ( = ?auto_309367 ?auto_309370 ) ) ( not ( = ?auto_309367 ?auto_309371 ) ) ( not ( = ?auto_309367 ?auto_309372 ) ) ( not ( = ?auto_309368 ?auto_309369 ) ) ( not ( = ?auto_309368 ?auto_309370 ) ) ( not ( = ?auto_309368 ?auto_309371 ) ) ( not ( = ?auto_309368 ?auto_309372 ) ) ( not ( = ?auto_309369 ?auto_309370 ) ) ( not ( = ?auto_309369 ?auto_309371 ) ) ( not ( = ?auto_309369 ?auto_309372 ) ) ( not ( = ?auto_309370 ?auto_309371 ) ) ( not ( = ?auto_309370 ?auto_309372 ) ) ( not ( = ?auto_309371 ?auto_309372 ) ) ( CLEAR ?auto_309369 ) ( ON ?auto_309370 ?auto_309371 ) ( CLEAR ?auto_309370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_309367 ?auto_309368 ?auto_309369 ?auto_309370 )
      ( MAKE-5PILE ?auto_309367 ?auto_309368 ?auto_309369 ?auto_309370 ?auto_309371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_309389 - BLOCK
      ?auto_309390 - BLOCK
      ?auto_309391 - BLOCK
      ?auto_309392 - BLOCK
      ?auto_309393 - BLOCK
    )
    :vars
    (
      ?auto_309394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309393 ?auto_309394 ) ( ON-TABLE ?auto_309389 ) ( ON ?auto_309390 ?auto_309389 ) ( not ( = ?auto_309389 ?auto_309390 ) ) ( not ( = ?auto_309389 ?auto_309391 ) ) ( not ( = ?auto_309389 ?auto_309392 ) ) ( not ( = ?auto_309389 ?auto_309393 ) ) ( not ( = ?auto_309389 ?auto_309394 ) ) ( not ( = ?auto_309390 ?auto_309391 ) ) ( not ( = ?auto_309390 ?auto_309392 ) ) ( not ( = ?auto_309390 ?auto_309393 ) ) ( not ( = ?auto_309390 ?auto_309394 ) ) ( not ( = ?auto_309391 ?auto_309392 ) ) ( not ( = ?auto_309391 ?auto_309393 ) ) ( not ( = ?auto_309391 ?auto_309394 ) ) ( not ( = ?auto_309392 ?auto_309393 ) ) ( not ( = ?auto_309392 ?auto_309394 ) ) ( not ( = ?auto_309393 ?auto_309394 ) ) ( ON ?auto_309392 ?auto_309393 ) ( CLEAR ?auto_309390 ) ( ON ?auto_309391 ?auto_309392 ) ( CLEAR ?auto_309391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309389 ?auto_309390 ?auto_309391 )
      ( MAKE-5PILE ?auto_309389 ?auto_309390 ?auto_309391 ?auto_309392 ?auto_309393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_309411 - BLOCK
      ?auto_309412 - BLOCK
      ?auto_309413 - BLOCK
      ?auto_309414 - BLOCK
      ?auto_309415 - BLOCK
    )
    :vars
    (
      ?auto_309416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309415 ?auto_309416 ) ( ON-TABLE ?auto_309411 ) ( not ( = ?auto_309411 ?auto_309412 ) ) ( not ( = ?auto_309411 ?auto_309413 ) ) ( not ( = ?auto_309411 ?auto_309414 ) ) ( not ( = ?auto_309411 ?auto_309415 ) ) ( not ( = ?auto_309411 ?auto_309416 ) ) ( not ( = ?auto_309412 ?auto_309413 ) ) ( not ( = ?auto_309412 ?auto_309414 ) ) ( not ( = ?auto_309412 ?auto_309415 ) ) ( not ( = ?auto_309412 ?auto_309416 ) ) ( not ( = ?auto_309413 ?auto_309414 ) ) ( not ( = ?auto_309413 ?auto_309415 ) ) ( not ( = ?auto_309413 ?auto_309416 ) ) ( not ( = ?auto_309414 ?auto_309415 ) ) ( not ( = ?auto_309414 ?auto_309416 ) ) ( not ( = ?auto_309415 ?auto_309416 ) ) ( ON ?auto_309414 ?auto_309415 ) ( ON ?auto_309413 ?auto_309414 ) ( CLEAR ?auto_309411 ) ( ON ?auto_309412 ?auto_309413 ) ( CLEAR ?auto_309412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309411 ?auto_309412 )
      ( MAKE-5PILE ?auto_309411 ?auto_309412 ?auto_309413 ?auto_309414 ?auto_309415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_309433 - BLOCK
      ?auto_309434 - BLOCK
      ?auto_309435 - BLOCK
      ?auto_309436 - BLOCK
      ?auto_309437 - BLOCK
    )
    :vars
    (
      ?auto_309438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309437 ?auto_309438 ) ( not ( = ?auto_309433 ?auto_309434 ) ) ( not ( = ?auto_309433 ?auto_309435 ) ) ( not ( = ?auto_309433 ?auto_309436 ) ) ( not ( = ?auto_309433 ?auto_309437 ) ) ( not ( = ?auto_309433 ?auto_309438 ) ) ( not ( = ?auto_309434 ?auto_309435 ) ) ( not ( = ?auto_309434 ?auto_309436 ) ) ( not ( = ?auto_309434 ?auto_309437 ) ) ( not ( = ?auto_309434 ?auto_309438 ) ) ( not ( = ?auto_309435 ?auto_309436 ) ) ( not ( = ?auto_309435 ?auto_309437 ) ) ( not ( = ?auto_309435 ?auto_309438 ) ) ( not ( = ?auto_309436 ?auto_309437 ) ) ( not ( = ?auto_309436 ?auto_309438 ) ) ( not ( = ?auto_309437 ?auto_309438 ) ) ( ON ?auto_309436 ?auto_309437 ) ( ON ?auto_309435 ?auto_309436 ) ( ON ?auto_309434 ?auto_309435 ) ( ON ?auto_309433 ?auto_309434 ) ( CLEAR ?auto_309433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309433 )
      ( MAKE-5PILE ?auto_309433 ?auto_309434 ?auto_309435 ?auto_309436 ?auto_309437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309456 - BLOCK
      ?auto_309457 - BLOCK
      ?auto_309458 - BLOCK
      ?auto_309459 - BLOCK
      ?auto_309460 - BLOCK
      ?auto_309461 - BLOCK
    )
    :vars
    (
      ?auto_309462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309460 ) ( ON ?auto_309461 ?auto_309462 ) ( CLEAR ?auto_309461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309456 ) ( ON ?auto_309457 ?auto_309456 ) ( ON ?auto_309458 ?auto_309457 ) ( ON ?auto_309459 ?auto_309458 ) ( ON ?auto_309460 ?auto_309459 ) ( not ( = ?auto_309456 ?auto_309457 ) ) ( not ( = ?auto_309456 ?auto_309458 ) ) ( not ( = ?auto_309456 ?auto_309459 ) ) ( not ( = ?auto_309456 ?auto_309460 ) ) ( not ( = ?auto_309456 ?auto_309461 ) ) ( not ( = ?auto_309456 ?auto_309462 ) ) ( not ( = ?auto_309457 ?auto_309458 ) ) ( not ( = ?auto_309457 ?auto_309459 ) ) ( not ( = ?auto_309457 ?auto_309460 ) ) ( not ( = ?auto_309457 ?auto_309461 ) ) ( not ( = ?auto_309457 ?auto_309462 ) ) ( not ( = ?auto_309458 ?auto_309459 ) ) ( not ( = ?auto_309458 ?auto_309460 ) ) ( not ( = ?auto_309458 ?auto_309461 ) ) ( not ( = ?auto_309458 ?auto_309462 ) ) ( not ( = ?auto_309459 ?auto_309460 ) ) ( not ( = ?auto_309459 ?auto_309461 ) ) ( not ( = ?auto_309459 ?auto_309462 ) ) ( not ( = ?auto_309460 ?auto_309461 ) ) ( not ( = ?auto_309460 ?auto_309462 ) ) ( not ( = ?auto_309461 ?auto_309462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309461 ?auto_309462 )
      ( !STACK ?auto_309461 ?auto_309460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309482 - BLOCK
      ?auto_309483 - BLOCK
      ?auto_309484 - BLOCK
      ?auto_309485 - BLOCK
      ?auto_309486 - BLOCK
      ?auto_309487 - BLOCK
    )
    :vars
    (
      ?auto_309488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309487 ?auto_309488 ) ( ON-TABLE ?auto_309482 ) ( ON ?auto_309483 ?auto_309482 ) ( ON ?auto_309484 ?auto_309483 ) ( ON ?auto_309485 ?auto_309484 ) ( not ( = ?auto_309482 ?auto_309483 ) ) ( not ( = ?auto_309482 ?auto_309484 ) ) ( not ( = ?auto_309482 ?auto_309485 ) ) ( not ( = ?auto_309482 ?auto_309486 ) ) ( not ( = ?auto_309482 ?auto_309487 ) ) ( not ( = ?auto_309482 ?auto_309488 ) ) ( not ( = ?auto_309483 ?auto_309484 ) ) ( not ( = ?auto_309483 ?auto_309485 ) ) ( not ( = ?auto_309483 ?auto_309486 ) ) ( not ( = ?auto_309483 ?auto_309487 ) ) ( not ( = ?auto_309483 ?auto_309488 ) ) ( not ( = ?auto_309484 ?auto_309485 ) ) ( not ( = ?auto_309484 ?auto_309486 ) ) ( not ( = ?auto_309484 ?auto_309487 ) ) ( not ( = ?auto_309484 ?auto_309488 ) ) ( not ( = ?auto_309485 ?auto_309486 ) ) ( not ( = ?auto_309485 ?auto_309487 ) ) ( not ( = ?auto_309485 ?auto_309488 ) ) ( not ( = ?auto_309486 ?auto_309487 ) ) ( not ( = ?auto_309486 ?auto_309488 ) ) ( not ( = ?auto_309487 ?auto_309488 ) ) ( CLEAR ?auto_309485 ) ( ON ?auto_309486 ?auto_309487 ) ( CLEAR ?auto_309486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_309482 ?auto_309483 ?auto_309484 ?auto_309485 ?auto_309486 )
      ( MAKE-6PILE ?auto_309482 ?auto_309483 ?auto_309484 ?auto_309485 ?auto_309486 ?auto_309487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309508 - BLOCK
      ?auto_309509 - BLOCK
      ?auto_309510 - BLOCK
      ?auto_309511 - BLOCK
      ?auto_309512 - BLOCK
      ?auto_309513 - BLOCK
    )
    :vars
    (
      ?auto_309514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309513 ?auto_309514 ) ( ON-TABLE ?auto_309508 ) ( ON ?auto_309509 ?auto_309508 ) ( ON ?auto_309510 ?auto_309509 ) ( not ( = ?auto_309508 ?auto_309509 ) ) ( not ( = ?auto_309508 ?auto_309510 ) ) ( not ( = ?auto_309508 ?auto_309511 ) ) ( not ( = ?auto_309508 ?auto_309512 ) ) ( not ( = ?auto_309508 ?auto_309513 ) ) ( not ( = ?auto_309508 ?auto_309514 ) ) ( not ( = ?auto_309509 ?auto_309510 ) ) ( not ( = ?auto_309509 ?auto_309511 ) ) ( not ( = ?auto_309509 ?auto_309512 ) ) ( not ( = ?auto_309509 ?auto_309513 ) ) ( not ( = ?auto_309509 ?auto_309514 ) ) ( not ( = ?auto_309510 ?auto_309511 ) ) ( not ( = ?auto_309510 ?auto_309512 ) ) ( not ( = ?auto_309510 ?auto_309513 ) ) ( not ( = ?auto_309510 ?auto_309514 ) ) ( not ( = ?auto_309511 ?auto_309512 ) ) ( not ( = ?auto_309511 ?auto_309513 ) ) ( not ( = ?auto_309511 ?auto_309514 ) ) ( not ( = ?auto_309512 ?auto_309513 ) ) ( not ( = ?auto_309512 ?auto_309514 ) ) ( not ( = ?auto_309513 ?auto_309514 ) ) ( ON ?auto_309512 ?auto_309513 ) ( CLEAR ?auto_309510 ) ( ON ?auto_309511 ?auto_309512 ) ( CLEAR ?auto_309511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_309508 ?auto_309509 ?auto_309510 ?auto_309511 )
      ( MAKE-6PILE ?auto_309508 ?auto_309509 ?auto_309510 ?auto_309511 ?auto_309512 ?auto_309513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309534 - BLOCK
      ?auto_309535 - BLOCK
      ?auto_309536 - BLOCK
      ?auto_309537 - BLOCK
      ?auto_309538 - BLOCK
      ?auto_309539 - BLOCK
    )
    :vars
    (
      ?auto_309540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309539 ?auto_309540 ) ( ON-TABLE ?auto_309534 ) ( ON ?auto_309535 ?auto_309534 ) ( not ( = ?auto_309534 ?auto_309535 ) ) ( not ( = ?auto_309534 ?auto_309536 ) ) ( not ( = ?auto_309534 ?auto_309537 ) ) ( not ( = ?auto_309534 ?auto_309538 ) ) ( not ( = ?auto_309534 ?auto_309539 ) ) ( not ( = ?auto_309534 ?auto_309540 ) ) ( not ( = ?auto_309535 ?auto_309536 ) ) ( not ( = ?auto_309535 ?auto_309537 ) ) ( not ( = ?auto_309535 ?auto_309538 ) ) ( not ( = ?auto_309535 ?auto_309539 ) ) ( not ( = ?auto_309535 ?auto_309540 ) ) ( not ( = ?auto_309536 ?auto_309537 ) ) ( not ( = ?auto_309536 ?auto_309538 ) ) ( not ( = ?auto_309536 ?auto_309539 ) ) ( not ( = ?auto_309536 ?auto_309540 ) ) ( not ( = ?auto_309537 ?auto_309538 ) ) ( not ( = ?auto_309537 ?auto_309539 ) ) ( not ( = ?auto_309537 ?auto_309540 ) ) ( not ( = ?auto_309538 ?auto_309539 ) ) ( not ( = ?auto_309538 ?auto_309540 ) ) ( not ( = ?auto_309539 ?auto_309540 ) ) ( ON ?auto_309538 ?auto_309539 ) ( ON ?auto_309537 ?auto_309538 ) ( CLEAR ?auto_309535 ) ( ON ?auto_309536 ?auto_309537 ) ( CLEAR ?auto_309536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309534 ?auto_309535 ?auto_309536 )
      ( MAKE-6PILE ?auto_309534 ?auto_309535 ?auto_309536 ?auto_309537 ?auto_309538 ?auto_309539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309560 - BLOCK
      ?auto_309561 - BLOCK
      ?auto_309562 - BLOCK
      ?auto_309563 - BLOCK
      ?auto_309564 - BLOCK
      ?auto_309565 - BLOCK
    )
    :vars
    (
      ?auto_309566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309565 ?auto_309566 ) ( ON-TABLE ?auto_309560 ) ( not ( = ?auto_309560 ?auto_309561 ) ) ( not ( = ?auto_309560 ?auto_309562 ) ) ( not ( = ?auto_309560 ?auto_309563 ) ) ( not ( = ?auto_309560 ?auto_309564 ) ) ( not ( = ?auto_309560 ?auto_309565 ) ) ( not ( = ?auto_309560 ?auto_309566 ) ) ( not ( = ?auto_309561 ?auto_309562 ) ) ( not ( = ?auto_309561 ?auto_309563 ) ) ( not ( = ?auto_309561 ?auto_309564 ) ) ( not ( = ?auto_309561 ?auto_309565 ) ) ( not ( = ?auto_309561 ?auto_309566 ) ) ( not ( = ?auto_309562 ?auto_309563 ) ) ( not ( = ?auto_309562 ?auto_309564 ) ) ( not ( = ?auto_309562 ?auto_309565 ) ) ( not ( = ?auto_309562 ?auto_309566 ) ) ( not ( = ?auto_309563 ?auto_309564 ) ) ( not ( = ?auto_309563 ?auto_309565 ) ) ( not ( = ?auto_309563 ?auto_309566 ) ) ( not ( = ?auto_309564 ?auto_309565 ) ) ( not ( = ?auto_309564 ?auto_309566 ) ) ( not ( = ?auto_309565 ?auto_309566 ) ) ( ON ?auto_309564 ?auto_309565 ) ( ON ?auto_309563 ?auto_309564 ) ( ON ?auto_309562 ?auto_309563 ) ( CLEAR ?auto_309560 ) ( ON ?auto_309561 ?auto_309562 ) ( CLEAR ?auto_309561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309560 ?auto_309561 )
      ( MAKE-6PILE ?auto_309560 ?auto_309561 ?auto_309562 ?auto_309563 ?auto_309564 ?auto_309565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_309586 - BLOCK
      ?auto_309587 - BLOCK
      ?auto_309588 - BLOCK
      ?auto_309589 - BLOCK
      ?auto_309590 - BLOCK
      ?auto_309591 - BLOCK
    )
    :vars
    (
      ?auto_309592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309591 ?auto_309592 ) ( not ( = ?auto_309586 ?auto_309587 ) ) ( not ( = ?auto_309586 ?auto_309588 ) ) ( not ( = ?auto_309586 ?auto_309589 ) ) ( not ( = ?auto_309586 ?auto_309590 ) ) ( not ( = ?auto_309586 ?auto_309591 ) ) ( not ( = ?auto_309586 ?auto_309592 ) ) ( not ( = ?auto_309587 ?auto_309588 ) ) ( not ( = ?auto_309587 ?auto_309589 ) ) ( not ( = ?auto_309587 ?auto_309590 ) ) ( not ( = ?auto_309587 ?auto_309591 ) ) ( not ( = ?auto_309587 ?auto_309592 ) ) ( not ( = ?auto_309588 ?auto_309589 ) ) ( not ( = ?auto_309588 ?auto_309590 ) ) ( not ( = ?auto_309588 ?auto_309591 ) ) ( not ( = ?auto_309588 ?auto_309592 ) ) ( not ( = ?auto_309589 ?auto_309590 ) ) ( not ( = ?auto_309589 ?auto_309591 ) ) ( not ( = ?auto_309589 ?auto_309592 ) ) ( not ( = ?auto_309590 ?auto_309591 ) ) ( not ( = ?auto_309590 ?auto_309592 ) ) ( not ( = ?auto_309591 ?auto_309592 ) ) ( ON ?auto_309590 ?auto_309591 ) ( ON ?auto_309589 ?auto_309590 ) ( ON ?auto_309588 ?auto_309589 ) ( ON ?auto_309587 ?auto_309588 ) ( ON ?auto_309586 ?auto_309587 ) ( CLEAR ?auto_309586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309586 )
      ( MAKE-6PILE ?auto_309586 ?auto_309587 ?auto_309588 ?auto_309589 ?auto_309590 ?auto_309591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309613 - BLOCK
      ?auto_309614 - BLOCK
      ?auto_309615 - BLOCK
      ?auto_309616 - BLOCK
      ?auto_309617 - BLOCK
      ?auto_309618 - BLOCK
      ?auto_309619 - BLOCK
    )
    :vars
    (
      ?auto_309620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309618 ) ( ON ?auto_309619 ?auto_309620 ) ( CLEAR ?auto_309619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309613 ) ( ON ?auto_309614 ?auto_309613 ) ( ON ?auto_309615 ?auto_309614 ) ( ON ?auto_309616 ?auto_309615 ) ( ON ?auto_309617 ?auto_309616 ) ( ON ?auto_309618 ?auto_309617 ) ( not ( = ?auto_309613 ?auto_309614 ) ) ( not ( = ?auto_309613 ?auto_309615 ) ) ( not ( = ?auto_309613 ?auto_309616 ) ) ( not ( = ?auto_309613 ?auto_309617 ) ) ( not ( = ?auto_309613 ?auto_309618 ) ) ( not ( = ?auto_309613 ?auto_309619 ) ) ( not ( = ?auto_309613 ?auto_309620 ) ) ( not ( = ?auto_309614 ?auto_309615 ) ) ( not ( = ?auto_309614 ?auto_309616 ) ) ( not ( = ?auto_309614 ?auto_309617 ) ) ( not ( = ?auto_309614 ?auto_309618 ) ) ( not ( = ?auto_309614 ?auto_309619 ) ) ( not ( = ?auto_309614 ?auto_309620 ) ) ( not ( = ?auto_309615 ?auto_309616 ) ) ( not ( = ?auto_309615 ?auto_309617 ) ) ( not ( = ?auto_309615 ?auto_309618 ) ) ( not ( = ?auto_309615 ?auto_309619 ) ) ( not ( = ?auto_309615 ?auto_309620 ) ) ( not ( = ?auto_309616 ?auto_309617 ) ) ( not ( = ?auto_309616 ?auto_309618 ) ) ( not ( = ?auto_309616 ?auto_309619 ) ) ( not ( = ?auto_309616 ?auto_309620 ) ) ( not ( = ?auto_309617 ?auto_309618 ) ) ( not ( = ?auto_309617 ?auto_309619 ) ) ( not ( = ?auto_309617 ?auto_309620 ) ) ( not ( = ?auto_309618 ?auto_309619 ) ) ( not ( = ?auto_309618 ?auto_309620 ) ) ( not ( = ?auto_309619 ?auto_309620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309619 ?auto_309620 )
      ( !STACK ?auto_309619 ?auto_309618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309643 - BLOCK
      ?auto_309644 - BLOCK
      ?auto_309645 - BLOCK
      ?auto_309646 - BLOCK
      ?auto_309647 - BLOCK
      ?auto_309648 - BLOCK
      ?auto_309649 - BLOCK
    )
    :vars
    (
      ?auto_309650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309649 ?auto_309650 ) ( ON-TABLE ?auto_309643 ) ( ON ?auto_309644 ?auto_309643 ) ( ON ?auto_309645 ?auto_309644 ) ( ON ?auto_309646 ?auto_309645 ) ( ON ?auto_309647 ?auto_309646 ) ( not ( = ?auto_309643 ?auto_309644 ) ) ( not ( = ?auto_309643 ?auto_309645 ) ) ( not ( = ?auto_309643 ?auto_309646 ) ) ( not ( = ?auto_309643 ?auto_309647 ) ) ( not ( = ?auto_309643 ?auto_309648 ) ) ( not ( = ?auto_309643 ?auto_309649 ) ) ( not ( = ?auto_309643 ?auto_309650 ) ) ( not ( = ?auto_309644 ?auto_309645 ) ) ( not ( = ?auto_309644 ?auto_309646 ) ) ( not ( = ?auto_309644 ?auto_309647 ) ) ( not ( = ?auto_309644 ?auto_309648 ) ) ( not ( = ?auto_309644 ?auto_309649 ) ) ( not ( = ?auto_309644 ?auto_309650 ) ) ( not ( = ?auto_309645 ?auto_309646 ) ) ( not ( = ?auto_309645 ?auto_309647 ) ) ( not ( = ?auto_309645 ?auto_309648 ) ) ( not ( = ?auto_309645 ?auto_309649 ) ) ( not ( = ?auto_309645 ?auto_309650 ) ) ( not ( = ?auto_309646 ?auto_309647 ) ) ( not ( = ?auto_309646 ?auto_309648 ) ) ( not ( = ?auto_309646 ?auto_309649 ) ) ( not ( = ?auto_309646 ?auto_309650 ) ) ( not ( = ?auto_309647 ?auto_309648 ) ) ( not ( = ?auto_309647 ?auto_309649 ) ) ( not ( = ?auto_309647 ?auto_309650 ) ) ( not ( = ?auto_309648 ?auto_309649 ) ) ( not ( = ?auto_309648 ?auto_309650 ) ) ( not ( = ?auto_309649 ?auto_309650 ) ) ( CLEAR ?auto_309647 ) ( ON ?auto_309648 ?auto_309649 ) ( CLEAR ?auto_309648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_309643 ?auto_309644 ?auto_309645 ?auto_309646 ?auto_309647 ?auto_309648 )
      ( MAKE-7PILE ?auto_309643 ?auto_309644 ?auto_309645 ?auto_309646 ?auto_309647 ?auto_309648 ?auto_309649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309673 - BLOCK
      ?auto_309674 - BLOCK
      ?auto_309675 - BLOCK
      ?auto_309676 - BLOCK
      ?auto_309677 - BLOCK
      ?auto_309678 - BLOCK
      ?auto_309679 - BLOCK
    )
    :vars
    (
      ?auto_309680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309679 ?auto_309680 ) ( ON-TABLE ?auto_309673 ) ( ON ?auto_309674 ?auto_309673 ) ( ON ?auto_309675 ?auto_309674 ) ( ON ?auto_309676 ?auto_309675 ) ( not ( = ?auto_309673 ?auto_309674 ) ) ( not ( = ?auto_309673 ?auto_309675 ) ) ( not ( = ?auto_309673 ?auto_309676 ) ) ( not ( = ?auto_309673 ?auto_309677 ) ) ( not ( = ?auto_309673 ?auto_309678 ) ) ( not ( = ?auto_309673 ?auto_309679 ) ) ( not ( = ?auto_309673 ?auto_309680 ) ) ( not ( = ?auto_309674 ?auto_309675 ) ) ( not ( = ?auto_309674 ?auto_309676 ) ) ( not ( = ?auto_309674 ?auto_309677 ) ) ( not ( = ?auto_309674 ?auto_309678 ) ) ( not ( = ?auto_309674 ?auto_309679 ) ) ( not ( = ?auto_309674 ?auto_309680 ) ) ( not ( = ?auto_309675 ?auto_309676 ) ) ( not ( = ?auto_309675 ?auto_309677 ) ) ( not ( = ?auto_309675 ?auto_309678 ) ) ( not ( = ?auto_309675 ?auto_309679 ) ) ( not ( = ?auto_309675 ?auto_309680 ) ) ( not ( = ?auto_309676 ?auto_309677 ) ) ( not ( = ?auto_309676 ?auto_309678 ) ) ( not ( = ?auto_309676 ?auto_309679 ) ) ( not ( = ?auto_309676 ?auto_309680 ) ) ( not ( = ?auto_309677 ?auto_309678 ) ) ( not ( = ?auto_309677 ?auto_309679 ) ) ( not ( = ?auto_309677 ?auto_309680 ) ) ( not ( = ?auto_309678 ?auto_309679 ) ) ( not ( = ?auto_309678 ?auto_309680 ) ) ( not ( = ?auto_309679 ?auto_309680 ) ) ( ON ?auto_309678 ?auto_309679 ) ( CLEAR ?auto_309676 ) ( ON ?auto_309677 ?auto_309678 ) ( CLEAR ?auto_309677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_309673 ?auto_309674 ?auto_309675 ?auto_309676 ?auto_309677 )
      ( MAKE-7PILE ?auto_309673 ?auto_309674 ?auto_309675 ?auto_309676 ?auto_309677 ?auto_309678 ?auto_309679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309703 - BLOCK
      ?auto_309704 - BLOCK
      ?auto_309705 - BLOCK
      ?auto_309706 - BLOCK
      ?auto_309707 - BLOCK
      ?auto_309708 - BLOCK
      ?auto_309709 - BLOCK
    )
    :vars
    (
      ?auto_309710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309709 ?auto_309710 ) ( ON-TABLE ?auto_309703 ) ( ON ?auto_309704 ?auto_309703 ) ( ON ?auto_309705 ?auto_309704 ) ( not ( = ?auto_309703 ?auto_309704 ) ) ( not ( = ?auto_309703 ?auto_309705 ) ) ( not ( = ?auto_309703 ?auto_309706 ) ) ( not ( = ?auto_309703 ?auto_309707 ) ) ( not ( = ?auto_309703 ?auto_309708 ) ) ( not ( = ?auto_309703 ?auto_309709 ) ) ( not ( = ?auto_309703 ?auto_309710 ) ) ( not ( = ?auto_309704 ?auto_309705 ) ) ( not ( = ?auto_309704 ?auto_309706 ) ) ( not ( = ?auto_309704 ?auto_309707 ) ) ( not ( = ?auto_309704 ?auto_309708 ) ) ( not ( = ?auto_309704 ?auto_309709 ) ) ( not ( = ?auto_309704 ?auto_309710 ) ) ( not ( = ?auto_309705 ?auto_309706 ) ) ( not ( = ?auto_309705 ?auto_309707 ) ) ( not ( = ?auto_309705 ?auto_309708 ) ) ( not ( = ?auto_309705 ?auto_309709 ) ) ( not ( = ?auto_309705 ?auto_309710 ) ) ( not ( = ?auto_309706 ?auto_309707 ) ) ( not ( = ?auto_309706 ?auto_309708 ) ) ( not ( = ?auto_309706 ?auto_309709 ) ) ( not ( = ?auto_309706 ?auto_309710 ) ) ( not ( = ?auto_309707 ?auto_309708 ) ) ( not ( = ?auto_309707 ?auto_309709 ) ) ( not ( = ?auto_309707 ?auto_309710 ) ) ( not ( = ?auto_309708 ?auto_309709 ) ) ( not ( = ?auto_309708 ?auto_309710 ) ) ( not ( = ?auto_309709 ?auto_309710 ) ) ( ON ?auto_309708 ?auto_309709 ) ( ON ?auto_309707 ?auto_309708 ) ( CLEAR ?auto_309705 ) ( ON ?auto_309706 ?auto_309707 ) ( CLEAR ?auto_309706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_309703 ?auto_309704 ?auto_309705 ?auto_309706 )
      ( MAKE-7PILE ?auto_309703 ?auto_309704 ?auto_309705 ?auto_309706 ?auto_309707 ?auto_309708 ?auto_309709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309733 - BLOCK
      ?auto_309734 - BLOCK
      ?auto_309735 - BLOCK
      ?auto_309736 - BLOCK
      ?auto_309737 - BLOCK
      ?auto_309738 - BLOCK
      ?auto_309739 - BLOCK
    )
    :vars
    (
      ?auto_309740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309739 ?auto_309740 ) ( ON-TABLE ?auto_309733 ) ( ON ?auto_309734 ?auto_309733 ) ( not ( = ?auto_309733 ?auto_309734 ) ) ( not ( = ?auto_309733 ?auto_309735 ) ) ( not ( = ?auto_309733 ?auto_309736 ) ) ( not ( = ?auto_309733 ?auto_309737 ) ) ( not ( = ?auto_309733 ?auto_309738 ) ) ( not ( = ?auto_309733 ?auto_309739 ) ) ( not ( = ?auto_309733 ?auto_309740 ) ) ( not ( = ?auto_309734 ?auto_309735 ) ) ( not ( = ?auto_309734 ?auto_309736 ) ) ( not ( = ?auto_309734 ?auto_309737 ) ) ( not ( = ?auto_309734 ?auto_309738 ) ) ( not ( = ?auto_309734 ?auto_309739 ) ) ( not ( = ?auto_309734 ?auto_309740 ) ) ( not ( = ?auto_309735 ?auto_309736 ) ) ( not ( = ?auto_309735 ?auto_309737 ) ) ( not ( = ?auto_309735 ?auto_309738 ) ) ( not ( = ?auto_309735 ?auto_309739 ) ) ( not ( = ?auto_309735 ?auto_309740 ) ) ( not ( = ?auto_309736 ?auto_309737 ) ) ( not ( = ?auto_309736 ?auto_309738 ) ) ( not ( = ?auto_309736 ?auto_309739 ) ) ( not ( = ?auto_309736 ?auto_309740 ) ) ( not ( = ?auto_309737 ?auto_309738 ) ) ( not ( = ?auto_309737 ?auto_309739 ) ) ( not ( = ?auto_309737 ?auto_309740 ) ) ( not ( = ?auto_309738 ?auto_309739 ) ) ( not ( = ?auto_309738 ?auto_309740 ) ) ( not ( = ?auto_309739 ?auto_309740 ) ) ( ON ?auto_309738 ?auto_309739 ) ( ON ?auto_309737 ?auto_309738 ) ( ON ?auto_309736 ?auto_309737 ) ( CLEAR ?auto_309734 ) ( ON ?auto_309735 ?auto_309736 ) ( CLEAR ?auto_309735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309733 ?auto_309734 ?auto_309735 )
      ( MAKE-7PILE ?auto_309733 ?auto_309734 ?auto_309735 ?auto_309736 ?auto_309737 ?auto_309738 ?auto_309739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309763 - BLOCK
      ?auto_309764 - BLOCK
      ?auto_309765 - BLOCK
      ?auto_309766 - BLOCK
      ?auto_309767 - BLOCK
      ?auto_309768 - BLOCK
      ?auto_309769 - BLOCK
    )
    :vars
    (
      ?auto_309770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309769 ?auto_309770 ) ( ON-TABLE ?auto_309763 ) ( not ( = ?auto_309763 ?auto_309764 ) ) ( not ( = ?auto_309763 ?auto_309765 ) ) ( not ( = ?auto_309763 ?auto_309766 ) ) ( not ( = ?auto_309763 ?auto_309767 ) ) ( not ( = ?auto_309763 ?auto_309768 ) ) ( not ( = ?auto_309763 ?auto_309769 ) ) ( not ( = ?auto_309763 ?auto_309770 ) ) ( not ( = ?auto_309764 ?auto_309765 ) ) ( not ( = ?auto_309764 ?auto_309766 ) ) ( not ( = ?auto_309764 ?auto_309767 ) ) ( not ( = ?auto_309764 ?auto_309768 ) ) ( not ( = ?auto_309764 ?auto_309769 ) ) ( not ( = ?auto_309764 ?auto_309770 ) ) ( not ( = ?auto_309765 ?auto_309766 ) ) ( not ( = ?auto_309765 ?auto_309767 ) ) ( not ( = ?auto_309765 ?auto_309768 ) ) ( not ( = ?auto_309765 ?auto_309769 ) ) ( not ( = ?auto_309765 ?auto_309770 ) ) ( not ( = ?auto_309766 ?auto_309767 ) ) ( not ( = ?auto_309766 ?auto_309768 ) ) ( not ( = ?auto_309766 ?auto_309769 ) ) ( not ( = ?auto_309766 ?auto_309770 ) ) ( not ( = ?auto_309767 ?auto_309768 ) ) ( not ( = ?auto_309767 ?auto_309769 ) ) ( not ( = ?auto_309767 ?auto_309770 ) ) ( not ( = ?auto_309768 ?auto_309769 ) ) ( not ( = ?auto_309768 ?auto_309770 ) ) ( not ( = ?auto_309769 ?auto_309770 ) ) ( ON ?auto_309768 ?auto_309769 ) ( ON ?auto_309767 ?auto_309768 ) ( ON ?auto_309766 ?auto_309767 ) ( ON ?auto_309765 ?auto_309766 ) ( CLEAR ?auto_309763 ) ( ON ?auto_309764 ?auto_309765 ) ( CLEAR ?auto_309764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309763 ?auto_309764 )
      ( MAKE-7PILE ?auto_309763 ?auto_309764 ?auto_309765 ?auto_309766 ?auto_309767 ?auto_309768 ?auto_309769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_309793 - BLOCK
      ?auto_309794 - BLOCK
      ?auto_309795 - BLOCK
      ?auto_309796 - BLOCK
      ?auto_309797 - BLOCK
      ?auto_309798 - BLOCK
      ?auto_309799 - BLOCK
    )
    :vars
    (
      ?auto_309800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309799 ?auto_309800 ) ( not ( = ?auto_309793 ?auto_309794 ) ) ( not ( = ?auto_309793 ?auto_309795 ) ) ( not ( = ?auto_309793 ?auto_309796 ) ) ( not ( = ?auto_309793 ?auto_309797 ) ) ( not ( = ?auto_309793 ?auto_309798 ) ) ( not ( = ?auto_309793 ?auto_309799 ) ) ( not ( = ?auto_309793 ?auto_309800 ) ) ( not ( = ?auto_309794 ?auto_309795 ) ) ( not ( = ?auto_309794 ?auto_309796 ) ) ( not ( = ?auto_309794 ?auto_309797 ) ) ( not ( = ?auto_309794 ?auto_309798 ) ) ( not ( = ?auto_309794 ?auto_309799 ) ) ( not ( = ?auto_309794 ?auto_309800 ) ) ( not ( = ?auto_309795 ?auto_309796 ) ) ( not ( = ?auto_309795 ?auto_309797 ) ) ( not ( = ?auto_309795 ?auto_309798 ) ) ( not ( = ?auto_309795 ?auto_309799 ) ) ( not ( = ?auto_309795 ?auto_309800 ) ) ( not ( = ?auto_309796 ?auto_309797 ) ) ( not ( = ?auto_309796 ?auto_309798 ) ) ( not ( = ?auto_309796 ?auto_309799 ) ) ( not ( = ?auto_309796 ?auto_309800 ) ) ( not ( = ?auto_309797 ?auto_309798 ) ) ( not ( = ?auto_309797 ?auto_309799 ) ) ( not ( = ?auto_309797 ?auto_309800 ) ) ( not ( = ?auto_309798 ?auto_309799 ) ) ( not ( = ?auto_309798 ?auto_309800 ) ) ( not ( = ?auto_309799 ?auto_309800 ) ) ( ON ?auto_309798 ?auto_309799 ) ( ON ?auto_309797 ?auto_309798 ) ( ON ?auto_309796 ?auto_309797 ) ( ON ?auto_309795 ?auto_309796 ) ( ON ?auto_309794 ?auto_309795 ) ( ON ?auto_309793 ?auto_309794 ) ( CLEAR ?auto_309793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309793 )
      ( MAKE-7PILE ?auto_309793 ?auto_309794 ?auto_309795 ?auto_309796 ?auto_309797 ?auto_309798 ?auto_309799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309824 - BLOCK
      ?auto_309825 - BLOCK
      ?auto_309826 - BLOCK
      ?auto_309827 - BLOCK
      ?auto_309828 - BLOCK
      ?auto_309829 - BLOCK
      ?auto_309830 - BLOCK
      ?auto_309831 - BLOCK
    )
    :vars
    (
      ?auto_309832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_309830 ) ( ON ?auto_309831 ?auto_309832 ) ( CLEAR ?auto_309831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_309824 ) ( ON ?auto_309825 ?auto_309824 ) ( ON ?auto_309826 ?auto_309825 ) ( ON ?auto_309827 ?auto_309826 ) ( ON ?auto_309828 ?auto_309827 ) ( ON ?auto_309829 ?auto_309828 ) ( ON ?auto_309830 ?auto_309829 ) ( not ( = ?auto_309824 ?auto_309825 ) ) ( not ( = ?auto_309824 ?auto_309826 ) ) ( not ( = ?auto_309824 ?auto_309827 ) ) ( not ( = ?auto_309824 ?auto_309828 ) ) ( not ( = ?auto_309824 ?auto_309829 ) ) ( not ( = ?auto_309824 ?auto_309830 ) ) ( not ( = ?auto_309824 ?auto_309831 ) ) ( not ( = ?auto_309824 ?auto_309832 ) ) ( not ( = ?auto_309825 ?auto_309826 ) ) ( not ( = ?auto_309825 ?auto_309827 ) ) ( not ( = ?auto_309825 ?auto_309828 ) ) ( not ( = ?auto_309825 ?auto_309829 ) ) ( not ( = ?auto_309825 ?auto_309830 ) ) ( not ( = ?auto_309825 ?auto_309831 ) ) ( not ( = ?auto_309825 ?auto_309832 ) ) ( not ( = ?auto_309826 ?auto_309827 ) ) ( not ( = ?auto_309826 ?auto_309828 ) ) ( not ( = ?auto_309826 ?auto_309829 ) ) ( not ( = ?auto_309826 ?auto_309830 ) ) ( not ( = ?auto_309826 ?auto_309831 ) ) ( not ( = ?auto_309826 ?auto_309832 ) ) ( not ( = ?auto_309827 ?auto_309828 ) ) ( not ( = ?auto_309827 ?auto_309829 ) ) ( not ( = ?auto_309827 ?auto_309830 ) ) ( not ( = ?auto_309827 ?auto_309831 ) ) ( not ( = ?auto_309827 ?auto_309832 ) ) ( not ( = ?auto_309828 ?auto_309829 ) ) ( not ( = ?auto_309828 ?auto_309830 ) ) ( not ( = ?auto_309828 ?auto_309831 ) ) ( not ( = ?auto_309828 ?auto_309832 ) ) ( not ( = ?auto_309829 ?auto_309830 ) ) ( not ( = ?auto_309829 ?auto_309831 ) ) ( not ( = ?auto_309829 ?auto_309832 ) ) ( not ( = ?auto_309830 ?auto_309831 ) ) ( not ( = ?auto_309830 ?auto_309832 ) ) ( not ( = ?auto_309831 ?auto_309832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_309831 ?auto_309832 )
      ( !STACK ?auto_309831 ?auto_309830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309858 - BLOCK
      ?auto_309859 - BLOCK
      ?auto_309860 - BLOCK
      ?auto_309861 - BLOCK
      ?auto_309862 - BLOCK
      ?auto_309863 - BLOCK
      ?auto_309864 - BLOCK
      ?auto_309865 - BLOCK
    )
    :vars
    (
      ?auto_309866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309865 ?auto_309866 ) ( ON-TABLE ?auto_309858 ) ( ON ?auto_309859 ?auto_309858 ) ( ON ?auto_309860 ?auto_309859 ) ( ON ?auto_309861 ?auto_309860 ) ( ON ?auto_309862 ?auto_309861 ) ( ON ?auto_309863 ?auto_309862 ) ( not ( = ?auto_309858 ?auto_309859 ) ) ( not ( = ?auto_309858 ?auto_309860 ) ) ( not ( = ?auto_309858 ?auto_309861 ) ) ( not ( = ?auto_309858 ?auto_309862 ) ) ( not ( = ?auto_309858 ?auto_309863 ) ) ( not ( = ?auto_309858 ?auto_309864 ) ) ( not ( = ?auto_309858 ?auto_309865 ) ) ( not ( = ?auto_309858 ?auto_309866 ) ) ( not ( = ?auto_309859 ?auto_309860 ) ) ( not ( = ?auto_309859 ?auto_309861 ) ) ( not ( = ?auto_309859 ?auto_309862 ) ) ( not ( = ?auto_309859 ?auto_309863 ) ) ( not ( = ?auto_309859 ?auto_309864 ) ) ( not ( = ?auto_309859 ?auto_309865 ) ) ( not ( = ?auto_309859 ?auto_309866 ) ) ( not ( = ?auto_309860 ?auto_309861 ) ) ( not ( = ?auto_309860 ?auto_309862 ) ) ( not ( = ?auto_309860 ?auto_309863 ) ) ( not ( = ?auto_309860 ?auto_309864 ) ) ( not ( = ?auto_309860 ?auto_309865 ) ) ( not ( = ?auto_309860 ?auto_309866 ) ) ( not ( = ?auto_309861 ?auto_309862 ) ) ( not ( = ?auto_309861 ?auto_309863 ) ) ( not ( = ?auto_309861 ?auto_309864 ) ) ( not ( = ?auto_309861 ?auto_309865 ) ) ( not ( = ?auto_309861 ?auto_309866 ) ) ( not ( = ?auto_309862 ?auto_309863 ) ) ( not ( = ?auto_309862 ?auto_309864 ) ) ( not ( = ?auto_309862 ?auto_309865 ) ) ( not ( = ?auto_309862 ?auto_309866 ) ) ( not ( = ?auto_309863 ?auto_309864 ) ) ( not ( = ?auto_309863 ?auto_309865 ) ) ( not ( = ?auto_309863 ?auto_309866 ) ) ( not ( = ?auto_309864 ?auto_309865 ) ) ( not ( = ?auto_309864 ?auto_309866 ) ) ( not ( = ?auto_309865 ?auto_309866 ) ) ( CLEAR ?auto_309863 ) ( ON ?auto_309864 ?auto_309865 ) ( CLEAR ?auto_309864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_309858 ?auto_309859 ?auto_309860 ?auto_309861 ?auto_309862 ?auto_309863 ?auto_309864 )
      ( MAKE-8PILE ?auto_309858 ?auto_309859 ?auto_309860 ?auto_309861 ?auto_309862 ?auto_309863 ?auto_309864 ?auto_309865 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309892 - BLOCK
      ?auto_309893 - BLOCK
      ?auto_309894 - BLOCK
      ?auto_309895 - BLOCK
      ?auto_309896 - BLOCK
      ?auto_309897 - BLOCK
      ?auto_309898 - BLOCK
      ?auto_309899 - BLOCK
    )
    :vars
    (
      ?auto_309900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309899 ?auto_309900 ) ( ON-TABLE ?auto_309892 ) ( ON ?auto_309893 ?auto_309892 ) ( ON ?auto_309894 ?auto_309893 ) ( ON ?auto_309895 ?auto_309894 ) ( ON ?auto_309896 ?auto_309895 ) ( not ( = ?auto_309892 ?auto_309893 ) ) ( not ( = ?auto_309892 ?auto_309894 ) ) ( not ( = ?auto_309892 ?auto_309895 ) ) ( not ( = ?auto_309892 ?auto_309896 ) ) ( not ( = ?auto_309892 ?auto_309897 ) ) ( not ( = ?auto_309892 ?auto_309898 ) ) ( not ( = ?auto_309892 ?auto_309899 ) ) ( not ( = ?auto_309892 ?auto_309900 ) ) ( not ( = ?auto_309893 ?auto_309894 ) ) ( not ( = ?auto_309893 ?auto_309895 ) ) ( not ( = ?auto_309893 ?auto_309896 ) ) ( not ( = ?auto_309893 ?auto_309897 ) ) ( not ( = ?auto_309893 ?auto_309898 ) ) ( not ( = ?auto_309893 ?auto_309899 ) ) ( not ( = ?auto_309893 ?auto_309900 ) ) ( not ( = ?auto_309894 ?auto_309895 ) ) ( not ( = ?auto_309894 ?auto_309896 ) ) ( not ( = ?auto_309894 ?auto_309897 ) ) ( not ( = ?auto_309894 ?auto_309898 ) ) ( not ( = ?auto_309894 ?auto_309899 ) ) ( not ( = ?auto_309894 ?auto_309900 ) ) ( not ( = ?auto_309895 ?auto_309896 ) ) ( not ( = ?auto_309895 ?auto_309897 ) ) ( not ( = ?auto_309895 ?auto_309898 ) ) ( not ( = ?auto_309895 ?auto_309899 ) ) ( not ( = ?auto_309895 ?auto_309900 ) ) ( not ( = ?auto_309896 ?auto_309897 ) ) ( not ( = ?auto_309896 ?auto_309898 ) ) ( not ( = ?auto_309896 ?auto_309899 ) ) ( not ( = ?auto_309896 ?auto_309900 ) ) ( not ( = ?auto_309897 ?auto_309898 ) ) ( not ( = ?auto_309897 ?auto_309899 ) ) ( not ( = ?auto_309897 ?auto_309900 ) ) ( not ( = ?auto_309898 ?auto_309899 ) ) ( not ( = ?auto_309898 ?auto_309900 ) ) ( not ( = ?auto_309899 ?auto_309900 ) ) ( ON ?auto_309898 ?auto_309899 ) ( CLEAR ?auto_309896 ) ( ON ?auto_309897 ?auto_309898 ) ( CLEAR ?auto_309897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_309892 ?auto_309893 ?auto_309894 ?auto_309895 ?auto_309896 ?auto_309897 )
      ( MAKE-8PILE ?auto_309892 ?auto_309893 ?auto_309894 ?auto_309895 ?auto_309896 ?auto_309897 ?auto_309898 ?auto_309899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309926 - BLOCK
      ?auto_309927 - BLOCK
      ?auto_309928 - BLOCK
      ?auto_309929 - BLOCK
      ?auto_309930 - BLOCK
      ?auto_309931 - BLOCK
      ?auto_309932 - BLOCK
      ?auto_309933 - BLOCK
    )
    :vars
    (
      ?auto_309934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309933 ?auto_309934 ) ( ON-TABLE ?auto_309926 ) ( ON ?auto_309927 ?auto_309926 ) ( ON ?auto_309928 ?auto_309927 ) ( ON ?auto_309929 ?auto_309928 ) ( not ( = ?auto_309926 ?auto_309927 ) ) ( not ( = ?auto_309926 ?auto_309928 ) ) ( not ( = ?auto_309926 ?auto_309929 ) ) ( not ( = ?auto_309926 ?auto_309930 ) ) ( not ( = ?auto_309926 ?auto_309931 ) ) ( not ( = ?auto_309926 ?auto_309932 ) ) ( not ( = ?auto_309926 ?auto_309933 ) ) ( not ( = ?auto_309926 ?auto_309934 ) ) ( not ( = ?auto_309927 ?auto_309928 ) ) ( not ( = ?auto_309927 ?auto_309929 ) ) ( not ( = ?auto_309927 ?auto_309930 ) ) ( not ( = ?auto_309927 ?auto_309931 ) ) ( not ( = ?auto_309927 ?auto_309932 ) ) ( not ( = ?auto_309927 ?auto_309933 ) ) ( not ( = ?auto_309927 ?auto_309934 ) ) ( not ( = ?auto_309928 ?auto_309929 ) ) ( not ( = ?auto_309928 ?auto_309930 ) ) ( not ( = ?auto_309928 ?auto_309931 ) ) ( not ( = ?auto_309928 ?auto_309932 ) ) ( not ( = ?auto_309928 ?auto_309933 ) ) ( not ( = ?auto_309928 ?auto_309934 ) ) ( not ( = ?auto_309929 ?auto_309930 ) ) ( not ( = ?auto_309929 ?auto_309931 ) ) ( not ( = ?auto_309929 ?auto_309932 ) ) ( not ( = ?auto_309929 ?auto_309933 ) ) ( not ( = ?auto_309929 ?auto_309934 ) ) ( not ( = ?auto_309930 ?auto_309931 ) ) ( not ( = ?auto_309930 ?auto_309932 ) ) ( not ( = ?auto_309930 ?auto_309933 ) ) ( not ( = ?auto_309930 ?auto_309934 ) ) ( not ( = ?auto_309931 ?auto_309932 ) ) ( not ( = ?auto_309931 ?auto_309933 ) ) ( not ( = ?auto_309931 ?auto_309934 ) ) ( not ( = ?auto_309932 ?auto_309933 ) ) ( not ( = ?auto_309932 ?auto_309934 ) ) ( not ( = ?auto_309933 ?auto_309934 ) ) ( ON ?auto_309932 ?auto_309933 ) ( ON ?auto_309931 ?auto_309932 ) ( CLEAR ?auto_309929 ) ( ON ?auto_309930 ?auto_309931 ) ( CLEAR ?auto_309930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_309926 ?auto_309927 ?auto_309928 ?auto_309929 ?auto_309930 )
      ( MAKE-8PILE ?auto_309926 ?auto_309927 ?auto_309928 ?auto_309929 ?auto_309930 ?auto_309931 ?auto_309932 ?auto_309933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309960 - BLOCK
      ?auto_309961 - BLOCK
      ?auto_309962 - BLOCK
      ?auto_309963 - BLOCK
      ?auto_309964 - BLOCK
      ?auto_309965 - BLOCK
      ?auto_309966 - BLOCK
      ?auto_309967 - BLOCK
    )
    :vars
    (
      ?auto_309968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309967 ?auto_309968 ) ( ON-TABLE ?auto_309960 ) ( ON ?auto_309961 ?auto_309960 ) ( ON ?auto_309962 ?auto_309961 ) ( not ( = ?auto_309960 ?auto_309961 ) ) ( not ( = ?auto_309960 ?auto_309962 ) ) ( not ( = ?auto_309960 ?auto_309963 ) ) ( not ( = ?auto_309960 ?auto_309964 ) ) ( not ( = ?auto_309960 ?auto_309965 ) ) ( not ( = ?auto_309960 ?auto_309966 ) ) ( not ( = ?auto_309960 ?auto_309967 ) ) ( not ( = ?auto_309960 ?auto_309968 ) ) ( not ( = ?auto_309961 ?auto_309962 ) ) ( not ( = ?auto_309961 ?auto_309963 ) ) ( not ( = ?auto_309961 ?auto_309964 ) ) ( not ( = ?auto_309961 ?auto_309965 ) ) ( not ( = ?auto_309961 ?auto_309966 ) ) ( not ( = ?auto_309961 ?auto_309967 ) ) ( not ( = ?auto_309961 ?auto_309968 ) ) ( not ( = ?auto_309962 ?auto_309963 ) ) ( not ( = ?auto_309962 ?auto_309964 ) ) ( not ( = ?auto_309962 ?auto_309965 ) ) ( not ( = ?auto_309962 ?auto_309966 ) ) ( not ( = ?auto_309962 ?auto_309967 ) ) ( not ( = ?auto_309962 ?auto_309968 ) ) ( not ( = ?auto_309963 ?auto_309964 ) ) ( not ( = ?auto_309963 ?auto_309965 ) ) ( not ( = ?auto_309963 ?auto_309966 ) ) ( not ( = ?auto_309963 ?auto_309967 ) ) ( not ( = ?auto_309963 ?auto_309968 ) ) ( not ( = ?auto_309964 ?auto_309965 ) ) ( not ( = ?auto_309964 ?auto_309966 ) ) ( not ( = ?auto_309964 ?auto_309967 ) ) ( not ( = ?auto_309964 ?auto_309968 ) ) ( not ( = ?auto_309965 ?auto_309966 ) ) ( not ( = ?auto_309965 ?auto_309967 ) ) ( not ( = ?auto_309965 ?auto_309968 ) ) ( not ( = ?auto_309966 ?auto_309967 ) ) ( not ( = ?auto_309966 ?auto_309968 ) ) ( not ( = ?auto_309967 ?auto_309968 ) ) ( ON ?auto_309966 ?auto_309967 ) ( ON ?auto_309965 ?auto_309966 ) ( ON ?auto_309964 ?auto_309965 ) ( CLEAR ?auto_309962 ) ( ON ?auto_309963 ?auto_309964 ) ( CLEAR ?auto_309963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_309960 ?auto_309961 ?auto_309962 ?auto_309963 )
      ( MAKE-8PILE ?auto_309960 ?auto_309961 ?auto_309962 ?auto_309963 ?auto_309964 ?auto_309965 ?auto_309966 ?auto_309967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_309994 - BLOCK
      ?auto_309995 - BLOCK
      ?auto_309996 - BLOCK
      ?auto_309997 - BLOCK
      ?auto_309998 - BLOCK
      ?auto_309999 - BLOCK
      ?auto_310000 - BLOCK
      ?auto_310001 - BLOCK
    )
    :vars
    (
      ?auto_310002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310001 ?auto_310002 ) ( ON-TABLE ?auto_309994 ) ( ON ?auto_309995 ?auto_309994 ) ( not ( = ?auto_309994 ?auto_309995 ) ) ( not ( = ?auto_309994 ?auto_309996 ) ) ( not ( = ?auto_309994 ?auto_309997 ) ) ( not ( = ?auto_309994 ?auto_309998 ) ) ( not ( = ?auto_309994 ?auto_309999 ) ) ( not ( = ?auto_309994 ?auto_310000 ) ) ( not ( = ?auto_309994 ?auto_310001 ) ) ( not ( = ?auto_309994 ?auto_310002 ) ) ( not ( = ?auto_309995 ?auto_309996 ) ) ( not ( = ?auto_309995 ?auto_309997 ) ) ( not ( = ?auto_309995 ?auto_309998 ) ) ( not ( = ?auto_309995 ?auto_309999 ) ) ( not ( = ?auto_309995 ?auto_310000 ) ) ( not ( = ?auto_309995 ?auto_310001 ) ) ( not ( = ?auto_309995 ?auto_310002 ) ) ( not ( = ?auto_309996 ?auto_309997 ) ) ( not ( = ?auto_309996 ?auto_309998 ) ) ( not ( = ?auto_309996 ?auto_309999 ) ) ( not ( = ?auto_309996 ?auto_310000 ) ) ( not ( = ?auto_309996 ?auto_310001 ) ) ( not ( = ?auto_309996 ?auto_310002 ) ) ( not ( = ?auto_309997 ?auto_309998 ) ) ( not ( = ?auto_309997 ?auto_309999 ) ) ( not ( = ?auto_309997 ?auto_310000 ) ) ( not ( = ?auto_309997 ?auto_310001 ) ) ( not ( = ?auto_309997 ?auto_310002 ) ) ( not ( = ?auto_309998 ?auto_309999 ) ) ( not ( = ?auto_309998 ?auto_310000 ) ) ( not ( = ?auto_309998 ?auto_310001 ) ) ( not ( = ?auto_309998 ?auto_310002 ) ) ( not ( = ?auto_309999 ?auto_310000 ) ) ( not ( = ?auto_309999 ?auto_310001 ) ) ( not ( = ?auto_309999 ?auto_310002 ) ) ( not ( = ?auto_310000 ?auto_310001 ) ) ( not ( = ?auto_310000 ?auto_310002 ) ) ( not ( = ?auto_310001 ?auto_310002 ) ) ( ON ?auto_310000 ?auto_310001 ) ( ON ?auto_309999 ?auto_310000 ) ( ON ?auto_309998 ?auto_309999 ) ( ON ?auto_309997 ?auto_309998 ) ( CLEAR ?auto_309995 ) ( ON ?auto_309996 ?auto_309997 ) ( CLEAR ?auto_309996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309994 ?auto_309995 ?auto_309996 )
      ( MAKE-8PILE ?auto_309994 ?auto_309995 ?auto_309996 ?auto_309997 ?auto_309998 ?auto_309999 ?auto_310000 ?auto_310001 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_310028 - BLOCK
      ?auto_310029 - BLOCK
      ?auto_310030 - BLOCK
      ?auto_310031 - BLOCK
      ?auto_310032 - BLOCK
      ?auto_310033 - BLOCK
      ?auto_310034 - BLOCK
      ?auto_310035 - BLOCK
    )
    :vars
    (
      ?auto_310036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310035 ?auto_310036 ) ( ON-TABLE ?auto_310028 ) ( not ( = ?auto_310028 ?auto_310029 ) ) ( not ( = ?auto_310028 ?auto_310030 ) ) ( not ( = ?auto_310028 ?auto_310031 ) ) ( not ( = ?auto_310028 ?auto_310032 ) ) ( not ( = ?auto_310028 ?auto_310033 ) ) ( not ( = ?auto_310028 ?auto_310034 ) ) ( not ( = ?auto_310028 ?auto_310035 ) ) ( not ( = ?auto_310028 ?auto_310036 ) ) ( not ( = ?auto_310029 ?auto_310030 ) ) ( not ( = ?auto_310029 ?auto_310031 ) ) ( not ( = ?auto_310029 ?auto_310032 ) ) ( not ( = ?auto_310029 ?auto_310033 ) ) ( not ( = ?auto_310029 ?auto_310034 ) ) ( not ( = ?auto_310029 ?auto_310035 ) ) ( not ( = ?auto_310029 ?auto_310036 ) ) ( not ( = ?auto_310030 ?auto_310031 ) ) ( not ( = ?auto_310030 ?auto_310032 ) ) ( not ( = ?auto_310030 ?auto_310033 ) ) ( not ( = ?auto_310030 ?auto_310034 ) ) ( not ( = ?auto_310030 ?auto_310035 ) ) ( not ( = ?auto_310030 ?auto_310036 ) ) ( not ( = ?auto_310031 ?auto_310032 ) ) ( not ( = ?auto_310031 ?auto_310033 ) ) ( not ( = ?auto_310031 ?auto_310034 ) ) ( not ( = ?auto_310031 ?auto_310035 ) ) ( not ( = ?auto_310031 ?auto_310036 ) ) ( not ( = ?auto_310032 ?auto_310033 ) ) ( not ( = ?auto_310032 ?auto_310034 ) ) ( not ( = ?auto_310032 ?auto_310035 ) ) ( not ( = ?auto_310032 ?auto_310036 ) ) ( not ( = ?auto_310033 ?auto_310034 ) ) ( not ( = ?auto_310033 ?auto_310035 ) ) ( not ( = ?auto_310033 ?auto_310036 ) ) ( not ( = ?auto_310034 ?auto_310035 ) ) ( not ( = ?auto_310034 ?auto_310036 ) ) ( not ( = ?auto_310035 ?auto_310036 ) ) ( ON ?auto_310034 ?auto_310035 ) ( ON ?auto_310033 ?auto_310034 ) ( ON ?auto_310032 ?auto_310033 ) ( ON ?auto_310031 ?auto_310032 ) ( ON ?auto_310030 ?auto_310031 ) ( CLEAR ?auto_310028 ) ( ON ?auto_310029 ?auto_310030 ) ( CLEAR ?auto_310029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_310028 ?auto_310029 )
      ( MAKE-8PILE ?auto_310028 ?auto_310029 ?auto_310030 ?auto_310031 ?auto_310032 ?auto_310033 ?auto_310034 ?auto_310035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_310062 - BLOCK
      ?auto_310063 - BLOCK
      ?auto_310064 - BLOCK
      ?auto_310065 - BLOCK
      ?auto_310066 - BLOCK
      ?auto_310067 - BLOCK
      ?auto_310068 - BLOCK
      ?auto_310069 - BLOCK
    )
    :vars
    (
      ?auto_310070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310069 ?auto_310070 ) ( not ( = ?auto_310062 ?auto_310063 ) ) ( not ( = ?auto_310062 ?auto_310064 ) ) ( not ( = ?auto_310062 ?auto_310065 ) ) ( not ( = ?auto_310062 ?auto_310066 ) ) ( not ( = ?auto_310062 ?auto_310067 ) ) ( not ( = ?auto_310062 ?auto_310068 ) ) ( not ( = ?auto_310062 ?auto_310069 ) ) ( not ( = ?auto_310062 ?auto_310070 ) ) ( not ( = ?auto_310063 ?auto_310064 ) ) ( not ( = ?auto_310063 ?auto_310065 ) ) ( not ( = ?auto_310063 ?auto_310066 ) ) ( not ( = ?auto_310063 ?auto_310067 ) ) ( not ( = ?auto_310063 ?auto_310068 ) ) ( not ( = ?auto_310063 ?auto_310069 ) ) ( not ( = ?auto_310063 ?auto_310070 ) ) ( not ( = ?auto_310064 ?auto_310065 ) ) ( not ( = ?auto_310064 ?auto_310066 ) ) ( not ( = ?auto_310064 ?auto_310067 ) ) ( not ( = ?auto_310064 ?auto_310068 ) ) ( not ( = ?auto_310064 ?auto_310069 ) ) ( not ( = ?auto_310064 ?auto_310070 ) ) ( not ( = ?auto_310065 ?auto_310066 ) ) ( not ( = ?auto_310065 ?auto_310067 ) ) ( not ( = ?auto_310065 ?auto_310068 ) ) ( not ( = ?auto_310065 ?auto_310069 ) ) ( not ( = ?auto_310065 ?auto_310070 ) ) ( not ( = ?auto_310066 ?auto_310067 ) ) ( not ( = ?auto_310066 ?auto_310068 ) ) ( not ( = ?auto_310066 ?auto_310069 ) ) ( not ( = ?auto_310066 ?auto_310070 ) ) ( not ( = ?auto_310067 ?auto_310068 ) ) ( not ( = ?auto_310067 ?auto_310069 ) ) ( not ( = ?auto_310067 ?auto_310070 ) ) ( not ( = ?auto_310068 ?auto_310069 ) ) ( not ( = ?auto_310068 ?auto_310070 ) ) ( not ( = ?auto_310069 ?auto_310070 ) ) ( ON ?auto_310068 ?auto_310069 ) ( ON ?auto_310067 ?auto_310068 ) ( ON ?auto_310066 ?auto_310067 ) ( ON ?auto_310065 ?auto_310066 ) ( ON ?auto_310064 ?auto_310065 ) ( ON ?auto_310063 ?auto_310064 ) ( ON ?auto_310062 ?auto_310063 ) ( CLEAR ?auto_310062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_310062 )
      ( MAKE-8PILE ?auto_310062 ?auto_310063 ?auto_310064 ?auto_310065 ?auto_310066 ?auto_310067 ?auto_310068 ?auto_310069 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310097 - BLOCK
      ?auto_310098 - BLOCK
      ?auto_310099 - BLOCK
      ?auto_310100 - BLOCK
      ?auto_310101 - BLOCK
      ?auto_310102 - BLOCK
      ?auto_310103 - BLOCK
      ?auto_310104 - BLOCK
      ?auto_310105 - BLOCK
    )
    :vars
    (
      ?auto_310106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_310104 ) ( ON ?auto_310105 ?auto_310106 ) ( CLEAR ?auto_310105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_310097 ) ( ON ?auto_310098 ?auto_310097 ) ( ON ?auto_310099 ?auto_310098 ) ( ON ?auto_310100 ?auto_310099 ) ( ON ?auto_310101 ?auto_310100 ) ( ON ?auto_310102 ?auto_310101 ) ( ON ?auto_310103 ?auto_310102 ) ( ON ?auto_310104 ?auto_310103 ) ( not ( = ?auto_310097 ?auto_310098 ) ) ( not ( = ?auto_310097 ?auto_310099 ) ) ( not ( = ?auto_310097 ?auto_310100 ) ) ( not ( = ?auto_310097 ?auto_310101 ) ) ( not ( = ?auto_310097 ?auto_310102 ) ) ( not ( = ?auto_310097 ?auto_310103 ) ) ( not ( = ?auto_310097 ?auto_310104 ) ) ( not ( = ?auto_310097 ?auto_310105 ) ) ( not ( = ?auto_310097 ?auto_310106 ) ) ( not ( = ?auto_310098 ?auto_310099 ) ) ( not ( = ?auto_310098 ?auto_310100 ) ) ( not ( = ?auto_310098 ?auto_310101 ) ) ( not ( = ?auto_310098 ?auto_310102 ) ) ( not ( = ?auto_310098 ?auto_310103 ) ) ( not ( = ?auto_310098 ?auto_310104 ) ) ( not ( = ?auto_310098 ?auto_310105 ) ) ( not ( = ?auto_310098 ?auto_310106 ) ) ( not ( = ?auto_310099 ?auto_310100 ) ) ( not ( = ?auto_310099 ?auto_310101 ) ) ( not ( = ?auto_310099 ?auto_310102 ) ) ( not ( = ?auto_310099 ?auto_310103 ) ) ( not ( = ?auto_310099 ?auto_310104 ) ) ( not ( = ?auto_310099 ?auto_310105 ) ) ( not ( = ?auto_310099 ?auto_310106 ) ) ( not ( = ?auto_310100 ?auto_310101 ) ) ( not ( = ?auto_310100 ?auto_310102 ) ) ( not ( = ?auto_310100 ?auto_310103 ) ) ( not ( = ?auto_310100 ?auto_310104 ) ) ( not ( = ?auto_310100 ?auto_310105 ) ) ( not ( = ?auto_310100 ?auto_310106 ) ) ( not ( = ?auto_310101 ?auto_310102 ) ) ( not ( = ?auto_310101 ?auto_310103 ) ) ( not ( = ?auto_310101 ?auto_310104 ) ) ( not ( = ?auto_310101 ?auto_310105 ) ) ( not ( = ?auto_310101 ?auto_310106 ) ) ( not ( = ?auto_310102 ?auto_310103 ) ) ( not ( = ?auto_310102 ?auto_310104 ) ) ( not ( = ?auto_310102 ?auto_310105 ) ) ( not ( = ?auto_310102 ?auto_310106 ) ) ( not ( = ?auto_310103 ?auto_310104 ) ) ( not ( = ?auto_310103 ?auto_310105 ) ) ( not ( = ?auto_310103 ?auto_310106 ) ) ( not ( = ?auto_310104 ?auto_310105 ) ) ( not ( = ?auto_310104 ?auto_310106 ) ) ( not ( = ?auto_310105 ?auto_310106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_310105 ?auto_310106 )
      ( !STACK ?auto_310105 ?auto_310104 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310135 - BLOCK
      ?auto_310136 - BLOCK
      ?auto_310137 - BLOCK
      ?auto_310138 - BLOCK
      ?auto_310139 - BLOCK
      ?auto_310140 - BLOCK
      ?auto_310141 - BLOCK
      ?auto_310142 - BLOCK
      ?auto_310143 - BLOCK
    )
    :vars
    (
      ?auto_310144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310143 ?auto_310144 ) ( ON-TABLE ?auto_310135 ) ( ON ?auto_310136 ?auto_310135 ) ( ON ?auto_310137 ?auto_310136 ) ( ON ?auto_310138 ?auto_310137 ) ( ON ?auto_310139 ?auto_310138 ) ( ON ?auto_310140 ?auto_310139 ) ( ON ?auto_310141 ?auto_310140 ) ( not ( = ?auto_310135 ?auto_310136 ) ) ( not ( = ?auto_310135 ?auto_310137 ) ) ( not ( = ?auto_310135 ?auto_310138 ) ) ( not ( = ?auto_310135 ?auto_310139 ) ) ( not ( = ?auto_310135 ?auto_310140 ) ) ( not ( = ?auto_310135 ?auto_310141 ) ) ( not ( = ?auto_310135 ?auto_310142 ) ) ( not ( = ?auto_310135 ?auto_310143 ) ) ( not ( = ?auto_310135 ?auto_310144 ) ) ( not ( = ?auto_310136 ?auto_310137 ) ) ( not ( = ?auto_310136 ?auto_310138 ) ) ( not ( = ?auto_310136 ?auto_310139 ) ) ( not ( = ?auto_310136 ?auto_310140 ) ) ( not ( = ?auto_310136 ?auto_310141 ) ) ( not ( = ?auto_310136 ?auto_310142 ) ) ( not ( = ?auto_310136 ?auto_310143 ) ) ( not ( = ?auto_310136 ?auto_310144 ) ) ( not ( = ?auto_310137 ?auto_310138 ) ) ( not ( = ?auto_310137 ?auto_310139 ) ) ( not ( = ?auto_310137 ?auto_310140 ) ) ( not ( = ?auto_310137 ?auto_310141 ) ) ( not ( = ?auto_310137 ?auto_310142 ) ) ( not ( = ?auto_310137 ?auto_310143 ) ) ( not ( = ?auto_310137 ?auto_310144 ) ) ( not ( = ?auto_310138 ?auto_310139 ) ) ( not ( = ?auto_310138 ?auto_310140 ) ) ( not ( = ?auto_310138 ?auto_310141 ) ) ( not ( = ?auto_310138 ?auto_310142 ) ) ( not ( = ?auto_310138 ?auto_310143 ) ) ( not ( = ?auto_310138 ?auto_310144 ) ) ( not ( = ?auto_310139 ?auto_310140 ) ) ( not ( = ?auto_310139 ?auto_310141 ) ) ( not ( = ?auto_310139 ?auto_310142 ) ) ( not ( = ?auto_310139 ?auto_310143 ) ) ( not ( = ?auto_310139 ?auto_310144 ) ) ( not ( = ?auto_310140 ?auto_310141 ) ) ( not ( = ?auto_310140 ?auto_310142 ) ) ( not ( = ?auto_310140 ?auto_310143 ) ) ( not ( = ?auto_310140 ?auto_310144 ) ) ( not ( = ?auto_310141 ?auto_310142 ) ) ( not ( = ?auto_310141 ?auto_310143 ) ) ( not ( = ?auto_310141 ?auto_310144 ) ) ( not ( = ?auto_310142 ?auto_310143 ) ) ( not ( = ?auto_310142 ?auto_310144 ) ) ( not ( = ?auto_310143 ?auto_310144 ) ) ( CLEAR ?auto_310141 ) ( ON ?auto_310142 ?auto_310143 ) ( CLEAR ?auto_310142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_310135 ?auto_310136 ?auto_310137 ?auto_310138 ?auto_310139 ?auto_310140 ?auto_310141 ?auto_310142 )
      ( MAKE-9PILE ?auto_310135 ?auto_310136 ?auto_310137 ?auto_310138 ?auto_310139 ?auto_310140 ?auto_310141 ?auto_310142 ?auto_310143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310173 - BLOCK
      ?auto_310174 - BLOCK
      ?auto_310175 - BLOCK
      ?auto_310176 - BLOCK
      ?auto_310177 - BLOCK
      ?auto_310178 - BLOCK
      ?auto_310179 - BLOCK
      ?auto_310180 - BLOCK
      ?auto_310181 - BLOCK
    )
    :vars
    (
      ?auto_310182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310181 ?auto_310182 ) ( ON-TABLE ?auto_310173 ) ( ON ?auto_310174 ?auto_310173 ) ( ON ?auto_310175 ?auto_310174 ) ( ON ?auto_310176 ?auto_310175 ) ( ON ?auto_310177 ?auto_310176 ) ( ON ?auto_310178 ?auto_310177 ) ( not ( = ?auto_310173 ?auto_310174 ) ) ( not ( = ?auto_310173 ?auto_310175 ) ) ( not ( = ?auto_310173 ?auto_310176 ) ) ( not ( = ?auto_310173 ?auto_310177 ) ) ( not ( = ?auto_310173 ?auto_310178 ) ) ( not ( = ?auto_310173 ?auto_310179 ) ) ( not ( = ?auto_310173 ?auto_310180 ) ) ( not ( = ?auto_310173 ?auto_310181 ) ) ( not ( = ?auto_310173 ?auto_310182 ) ) ( not ( = ?auto_310174 ?auto_310175 ) ) ( not ( = ?auto_310174 ?auto_310176 ) ) ( not ( = ?auto_310174 ?auto_310177 ) ) ( not ( = ?auto_310174 ?auto_310178 ) ) ( not ( = ?auto_310174 ?auto_310179 ) ) ( not ( = ?auto_310174 ?auto_310180 ) ) ( not ( = ?auto_310174 ?auto_310181 ) ) ( not ( = ?auto_310174 ?auto_310182 ) ) ( not ( = ?auto_310175 ?auto_310176 ) ) ( not ( = ?auto_310175 ?auto_310177 ) ) ( not ( = ?auto_310175 ?auto_310178 ) ) ( not ( = ?auto_310175 ?auto_310179 ) ) ( not ( = ?auto_310175 ?auto_310180 ) ) ( not ( = ?auto_310175 ?auto_310181 ) ) ( not ( = ?auto_310175 ?auto_310182 ) ) ( not ( = ?auto_310176 ?auto_310177 ) ) ( not ( = ?auto_310176 ?auto_310178 ) ) ( not ( = ?auto_310176 ?auto_310179 ) ) ( not ( = ?auto_310176 ?auto_310180 ) ) ( not ( = ?auto_310176 ?auto_310181 ) ) ( not ( = ?auto_310176 ?auto_310182 ) ) ( not ( = ?auto_310177 ?auto_310178 ) ) ( not ( = ?auto_310177 ?auto_310179 ) ) ( not ( = ?auto_310177 ?auto_310180 ) ) ( not ( = ?auto_310177 ?auto_310181 ) ) ( not ( = ?auto_310177 ?auto_310182 ) ) ( not ( = ?auto_310178 ?auto_310179 ) ) ( not ( = ?auto_310178 ?auto_310180 ) ) ( not ( = ?auto_310178 ?auto_310181 ) ) ( not ( = ?auto_310178 ?auto_310182 ) ) ( not ( = ?auto_310179 ?auto_310180 ) ) ( not ( = ?auto_310179 ?auto_310181 ) ) ( not ( = ?auto_310179 ?auto_310182 ) ) ( not ( = ?auto_310180 ?auto_310181 ) ) ( not ( = ?auto_310180 ?auto_310182 ) ) ( not ( = ?auto_310181 ?auto_310182 ) ) ( ON ?auto_310180 ?auto_310181 ) ( CLEAR ?auto_310178 ) ( ON ?auto_310179 ?auto_310180 ) ( CLEAR ?auto_310179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_310173 ?auto_310174 ?auto_310175 ?auto_310176 ?auto_310177 ?auto_310178 ?auto_310179 )
      ( MAKE-9PILE ?auto_310173 ?auto_310174 ?auto_310175 ?auto_310176 ?auto_310177 ?auto_310178 ?auto_310179 ?auto_310180 ?auto_310181 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310211 - BLOCK
      ?auto_310212 - BLOCK
      ?auto_310213 - BLOCK
      ?auto_310214 - BLOCK
      ?auto_310215 - BLOCK
      ?auto_310216 - BLOCK
      ?auto_310217 - BLOCK
      ?auto_310218 - BLOCK
      ?auto_310219 - BLOCK
    )
    :vars
    (
      ?auto_310220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310219 ?auto_310220 ) ( ON-TABLE ?auto_310211 ) ( ON ?auto_310212 ?auto_310211 ) ( ON ?auto_310213 ?auto_310212 ) ( ON ?auto_310214 ?auto_310213 ) ( ON ?auto_310215 ?auto_310214 ) ( not ( = ?auto_310211 ?auto_310212 ) ) ( not ( = ?auto_310211 ?auto_310213 ) ) ( not ( = ?auto_310211 ?auto_310214 ) ) ( not ( = ?auto_310211 ?auto_310215 ) ) ( not ( = ?auto_310211 ?auto_310216 ) ) ( not ( = ?auto_310211 ?auto_310217 ) ) ( not ( = ?auto_310211 ?auto_310218 ) ) ( not ( = ?auto_310211 ?auto_310219 ) ) ( not ( = ?auto_310211 ?auto_310220 ) ) ( not ( = ?auto_310212 ?auto_310213 ) ) ( not ( = ?auto_310212 ?auto_310214 ) ) ( not ( = ?auto_310212 ?auto_310215 ) ) ( not ( = ?auto_310212 ?auto_310216 ) ) ( not ( = ?auto_310212 ?auto_310217 ) ) ( not ( = ?auto_310212 ?auto_310218 ) ) ( not ( = ?auto_310212 ?auto_310219 ) ) ( not ( = ?auto_310212 ?auto_310220 ) ) ( not ( = ?auto_310213 ?auto_310214 ) ) ( not ( = ?auto_310213 ?auto_310215 ) ) ( not ( = ?auto_310213 ?auto_310216 ) ) ( not ( = ?auto_310213 ?auto_310217 ) ) ( not ( = ?auto_310213 ?auto_310218 ) ) ( not ( = ?auto_310213 ?auto_310219 ) ) ( not ( = ?auto_310213 ?auto_310220 ) ) ( not ( = ?auto_310214 ?auto_310215 ) ) ( not ( = ?auto_310214 ?auto_310216 ) ) ( not ( = ?auto_310214 ?auto_310217 ) ) ( not ( = ?auto_310214 ?auto_310218 ) ) ( not ( = ?auto_310214 ?auto_310219 ) ) ( not ( = ?auto_310214 ?auto_310220 ) ) ( not ( = ?auto_310215 ?auto_310216 ) ) ( not ( = ?auto_310215 ?auto_310217 ) ) ( not ( = ?auto_310215 ?auto_310218 ) ) ( not ( = ?auto_310215 ?auto_310219 ) ) ( not ( = ?auto_310215 ?auto_310220 ) ) ( not ( = ?auto_310216 ?auto_310217 ) ) ( not ( = ?auto_310216 ?auto_310218 ) ) ( not ( = ?auto_310216 ?auto_310219 ) ) ( not ( = ?auto_310216 ?auto_310220 ) ) ( not ( = ?auto_310217 ?auto_310218 ) ) ( not ( = ?auto_310217 ?auto_310219 ) ) ( not ( = ?auto_310217 ?auto_310220 ) ) ( not ( = ?auto_310218 ?auto_310219 ) ) ( not ( = ?auto_310218 ?auto_310220 ) ) ( not ( = ?auto_310219 ?auto_310220 ) ) ( ON ?auto_310218 ?auto_310219 ) ( ON ?auto_310217 ?auto_310218 ) ( CLEAR ?auto_310215 ) ( ON ?auto_310216 ?auto_310217 ) ( CLEAR ?auto_310216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_310211 ?auto_310212 ?auto_310213 ?auto_310214 ?auto_310215 ?auto_310216 )
      ( MAKE-9PILE ?auto_310211 ?auto_310212 ?auto_310213 ?auto_310214 ?auto_310215 ?auto_310216 ?auto_310217 ?auto_310218 ?auto_310219 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310249 - BLOCK
      ?auto_310250 - BLOCK
      ?auto_310251 - BLOCK
      ?auto_310252 - BLOCK
      ?auto_310253 - BLOCK
      ?auto_310254 - BLOCK
      ?auto_310255 - BLOCK
      ?auto_310256 - BLOCK
      ?auto_310257 - BLOCK
    )
    :vars
    (
      ?auto_310258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310257 ?auto_310258 ) ( ON-TABLE ?auto_310249 ) ( ON ?auto_310250 ?auto_310249 ) ( ON ?auto_310251 ?auto_310250 ) ( ON ?auto_310252 ?auto_310251 ) ( not ( = ?auto_310249 ?auto_310250 ) ) ( not ( = ?auto_310249 ?auto_310251 ) ) ( not ( = ?auto_310249 ?auto_310252 ) ) ( not ( = ?auto_310249 ?auto_310253 ) ) ( not ( = ?auto_310249 ?auto_310254 ) ) ( not ( = ?auto_310249 ?auto_310255 ) ) ( not ( = ?auto_310249 ?auto_310256 ) ) ( not ( = ?auto_310249 ?auto_310257 ) ) ( not ( = ?auto_310249 ?auto_310258 ) ) ( not ( = ?auto_310250 ?auto_310251 ) ) ( not ( = ?auto_310250 ?auto_310252 ) ) ( not ( = ?auto_310250 ?auto_310253 ) ) ( not ( = ?auto_310250 ?auto_310254 ) ) ( not ( = ?auto_310250 ?auto_310255 ) ) ( not ( = ?auto_310250 ?auto_310256 ) ) ( not ( = ?auto_310250 ?auto_310257 ) ) ( not ( = ?auto_310250 ?auto_310258 ) ) ( not ( = ?auto_310251 ?auto_310252 ) ) ( not ( = ?auto_310251 ?auto_310253 ) ) ( not ( = ?auto_310251 ?auto_310254 ) ) ( not ( = ?auto_310251 ?auto_310255 ) ) ( not ( = ?auto_310251 ?auto_310256 ) ) ( not ( = ?auto_310251 ?auto_310257 ) ) ( not ( = ?auto_310251 ?auto_310258 ) ) ( not ( = ?auto_310252 ?auto_310253 ) ) ( not ( = ?auto_310252 ?auto_310254 ) ) ( not ( = ?auto_310252 ?auto_310255 ) ) ( not ( = ?auto_310252 ?auto_310256 ) ) ( not ( = ?auto_310252 ?auto_310257 ) ) ( not ( = ?auto_310252 ?auto_310258 ) ) ( not ( = ?auto_310253 ?auto_310254 ) ) ( not ( = ?auto_310253 ?auto_310255 ) ) ( not ( = ?auto_310253 ?auto_310256 ) ) ( not ( = ?auto_310253 ?auto_310257 ) ) ( not ( = ?auto_310253 ?auto_310258 ) ) ( not ( = ?auto_310254 ?auto_310255 ) ) ( not ( = ?auto_310254 ?auto_310256 ) ) ( not ( = ?auto_310254 ?auto_310257 ) ) ( not ( = ?auto_310254 ?auto_310258 ) ) ( not ( = ?auto_310255 ?auto_310256 ) ) ( not ( = ?auto_310255 ?auto_310257 ) ) ( not ( = ?auto_310255 ?auto_310258 ) ) ( not ( = ?auto_310256 ?auto_310257 ) ) ( not ( = ?auto_310256 ?auto_310258 ) ) ( not ( = ?auto_310257 ?auto_310258 ) ) ( ON ?auto_310256 ?auto_310257 ) ( ON ?auto_310255 ?auto_310256 ) ( ON ?auto_310254 ?auto_310255 ) ( CLEAR ?auto_310252 ) ( ON ?auto_310253 ?auto_310254 ) ( CLEAR ?auto_310253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_310249 ?auto_310250 ?auto_310251 ?auto_310252 ?auto_310253 )
      ( MAKE-9PILE ?auto_310249 ?auto_310250 ?auto_310251 ?auto_310252 ?auto_310253 ?auto_310254 ?auto_310255 ?auto_310256 ?auto_310257 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310287 - BLOCK
      ?auto_310288 - BLOCK
      ?auto_310289 - BLOCK
      ?auto_310290 - BLOCK
      ?auto_310291 - BLOCK
      ?auto_310292 - BLOCK
      ?auto_310293 - BLOCK
      ?auto_310294 - BLOCK
      ?auto_310295 - BLOCK
    )
    :vars
    (
      ?auto_310296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310295 ?auto_310296 ) ( ON-TABLE ?auto_310287 ) ( ON ?auto_310288 ?auto_310287 ) ( ON ?auto_310289 ?auto_310288 ) ( not ( = ?auto_310287 ?auto_310288 ) ) ( not ( = ?auto_310287 ?auto_310289 ) ) ( not ( = ?auto_310287 ?auto_310290 ) ) ( not ( = ?auto_310287 ?auto_310291 ) ) ( not ( = ?auto_310287 ?auto_310292 ) ) ( not ( = ?auto_310287 ?auto_310293 ) ) ( not ( = ?auto_310287 ?auto_310294 ) ) ( not ( = ?auto_310287 ?auto_310295 ) ) ( not ( = ?auto_310287 ?auto_310296 ) ) ( not ( = ?auto_310288 ?auto_310289 ) ) ( not ( = ?auto_310288 ?auto_310290 ) ) ( not ( = ?auto_310288 ?auto_310291 ) ) ( not ( = ?auto_310288 ?auto_310292 ) ) ( not ( = ?auto_310288 ?auto_310293 ) ) ( not ( = ?auto_310288 ?auto_310294 ) ) ( not ( = ?auto_310288 ?auto_310295 ) ) ( not ( = ?auto_310288 ?auto_310296 ) ) ( not ( = ?auto_310289 ?auto_310290 ) ) ( not ( = ?auto_310289 ?auto_310291 ) ) ( not ( = ?auto_310289 ?auto_310292 ) ) ( not ( = ?auto_310289 ?auto_310293 ) ) ( not ( = ?auto_310289 ?auto_310294 ) ) ( not ( = ?auto_310289 ?auto_310295 ) ) ( not ( = ?auto_310289 ?auto_310296 ) ) ( not ( = ?auto_310290 ?auto_310291 ) ) ( not ( = ?auto_310290 ?auto_310292 ) ) ( not ( = ?auto_310290 ?auto_310293 ) ) ( not ( = ?auto_310290 ?auto_310294 ) ) ( not ( = ?auto_310290 ?auto_310295 ) ) ( not ( = ?auto_310290 ?auto_310296 ) ) ( not ( = ?auto_310291 ?auto_310292 ) ) ( not ( = ?auto_310291 ?auto_310293 ) ) ( not ( = ?auto_310291 ?auto_310294 ) ) ( not ( = ?auto_310291 ?auto_310295 ) ) ( not ( = ?auto_310291 ?auto_310296 ) ) ( not ( = ?auto_310292 ?auto_310293 ) ) ( not ( = ?auto_310292 ?auto_310294 ) ) ( not ( = ?auto_310292 ?auto_310295 ) ) ( not ( = ?auto_310292 ?auto_310296 ) ) ( not ( = ?auto_310293 ?auto_310294 ) ) ( not ( = ?auto_310293 ?auto_310295 ) ) ( not ( = ?auto_310293 ?auto_310296 ) ) ( not ( = ?auto_310294 ?auto_310295 ) ) ( not ( = ?auto_310294 ?auto_310296 ) ) ( not ( = ?auto_310295 ?auto_310296 ) ) ( ON ?auto_310294 ?auto_310295 ) ( ON ?auto_310293 ?auto_310294 ) ( ON ?auto_310292 ?auto_310293 ) ( ON ?auto_310291 ?auto_310292 ) ( CLEAR ?auto_310289 ) ( ON ?auto_310290 ?auto_310291 ) ( CLEAR ?auto_310290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_310287 ?auto_310288 ?auto_310289 ?auto_310290 )
      ( MAKE-9PILE ?auto_310287 ?auto_310288 ?auto_310289 ?auto_310290 ?auto_310291 ?auto_310292 ?auto_310293 ?auto_310294 ?auto_310295 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310325 - BLOCK
      ?auto_310326 - BLOCK
      ?auto_310327 - BLOCK
      ?auto_310328 - BLOCK
      ?auto_310329 - BLOCK
      ?auto_310330 - BLOCK
      ?auto_310331 - BLOCK
      ?auto_310332 - BLOCK
      ?auto_310333 - BLOCK
    )
    :vars
    (
      ?auto_310334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310333 ?auto_310334 ) ( ON-TABLE ?auto_310325 ) ( ON ?auto_310326 ?auto_310325 ) ( not ( = ?auto_310325 ?auto_310326 ) ) ( not ( = ?auto_310325 ?auto_310327 ) ) ( not ( = ?auto_310325 ?auto_310328 ) ) ( not ( = ?auto_310325 ?auto_310329 ) ) ( not ( = ?auto_310325 ?auto_310330 ) ) ( not ( = ?auto_310325 ?auto_310331 ) ) ( not ( = ?auto_310325 ?auto_310332 ) ) ( not ( = ?auto_310325 ?auto_310333 ) ) ( not ( = ?auto_310325 ?auto_310334 ) ) ( not ( = ?auto_310326 ?auto_310327 ) ) ( not ( = ?auto_310326 ?auto_310328 ) ) ( not ( = ?auto_310326 ?auto_310329 ) ) ( not ( = ?auto_310326 ?auto_310330 ) ) ( not ( = ?auto_310326 ?auto_310331 ) ) ( not ( = ?auto_310326 ?auto_310332 ) ) ( not ( = ?auto_310326 ?auto_310333 ) ) ( not ( = ?auto_310326 ?auto_310334 ) ) ( not ( = ?auto_310327 ?auto_310328 ) ) ( not ( = ?auto_310327 ?auto_310329 ) ) ( not ( = ?auto_310327 ?auto_310330 ) ) ( not ( = ?auto_310327 ?auto_310331 ) ) ( not ( = ?auto_310327 ?auto_310332 ) ) ( not ( = ?auto_310327 ?auto_310333 ) ) ( not ( = ?auto_310327 ?auto_310334 ) ) ( not ( = ?auto_310328 ?auto_310329 ) ) ( not ( = ?auto_310328 ?auto_310330 ) ) ( not ( = ?auto_310328 ?auto_310331 ) ) ( not ( = ?auto_310328 ?auto_310332 ) ) ( not ( = ?auto_310328 ?auto_310333 ) ) ( not ( = ?auto_310328 ?auto_310334 ) ) ( not ( = ?auto_310329 ?auto_310330 ) ) ( not ( = ?auto_310329 ?auto_310331 ) ) ( not ( = ?auto_310329 ?auto_310332 ) ) ( not ( = ?auto_310329 ?auto_310333 ) ) ( not ( = ?auto_310329 ?auto_310334 ) ) ( not ( = ?auto_310330 ?auto_310331 ) ) ( not ( = ?auto_310330 ?auto_310332 ) ) ( not ( = ?auto_310330 ?auto_310333 ) ) ( not ( = ?auto_310330 ?auto_310334 ) ) ( not ( = ?auto_310331 ?auto_310332 ) ) ( not ( = ?auto_310331 ?auto_310333 ) ) ( not ( = ?auto_310331 ?auto_310334 ) ) ( not ( = ?auto_310332 ?auto_310333 ) ) ( not ( = ?auto_310332 ?auto_310334 ) ) ( not ( = ?auto_310333 ?auto_310334 ) ) ( ON ?auto_310332 ?auto_310333 ) ( ON ?auto_310331 ?auto_310332 ) ( ON ?auto_310330 ?auto_310331 ) ( ON ?auto_310329 ?auto_310330 ) ( ON ?auto_310328 ?auto_310329 ) ( CLEAR ?auto_310326 ) ( ON ?auto_310327 ?auto_310328 ) ( CLEAR ?auto_310327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_310325 ?auto_310326 ?auto_310327 )
      ( MAKE-9PILE ?auto_310325 ?auto_310326 ?auto_310327 ?auto_310328 ?auto_310329 ?auto_310330 ?auto_310331 ?auto_310332 ?auto_310333 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310363 - BLOCK
      ?auto_310364 - BLOCK
      ?auto_310365 - BLOCK
      ?auto_310366 - BLOCK
      ?auto_310367 - BLOCK
      ?auto_310368 - BLOCK
      ?auto_310369 - BLOCK
      ?auto_310370 - BLOCK
      ?auto_310371 - BLOCK
    )
    :vars
    (
      ?auto_310372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310371 ?auto_310372 ) ( ON-TABLE ?auto_310363 ) ( not ( = ?auto_310363 ?auto_310364 ) ) ( not ( = ?auto_310363 ?auto_310365 ) ) ( not ( = ?auto_310363 ?auto_310366 ) ) ( not ( = ?auto_310363 ?auto_310367 ) ) ( not ( = ?auto_310363 ?auto_310368 ) ) ( not ( = ?auto_310363 ?auto_310369 ) ) ( not ( = ?auto_310363 ?auto_310370 ) ) ( not ( = ?auto_310363 ?auto_310371 ) ) ( not ( = ?auto_310363 ?auto_310372 ) ) ( not ( = ?auto_310364 ?auto_310365 ) ) ( not ( = ?auto_310364 ?auto_310366 ) ) ( not ( = ?auto_310364 ?auto_310367 ) ) ( not ( = ?auto_310364 ?auto_310368 ) ) ( not ( = ?auto_310364 ?auto_310369 ) ) ( not ( = ?auto_310364 ?auto_310370 ) ) ( not ( = ?auto_310364 ?auto_310371 ) ) ( not ( = ?auto_310364 ?auto_310372 ) ) ( not ( = ?auto_310365 ?auto_310366 ) ) ( not ( = ?auto_310365 ?auto_310367 ) ) ( not ( = ?auto_310365 ?auto_310368 ) ) ( not ( = ?auto_310365 ?auto_310369 ) ) ( not ( = ?auto_310365 ?auto_310370 ) ) ( not ( = ?auto_310365 ?auto_310371 ) ) ( not ( = ?auto_310365 ?auto_310372 ) ) ( not ( = ?auto_310366 ?auto_310367 ) ) ( not ( = ?auto_310366 ?auto_310368 ) ) ( not ( = ?auto_310366 ?auto_310369 ) ) ( not ( = ?auto_310366 ?auto_310370 ) ) ( not ( = ?auto_310366 ?auto_310371 ) ) ( not ( = ?auto_310366 ?auto_310372 ) ) ( not ( = ?auto_310367 ?auto_310368 ) ) ( not ( = ?auto_310367 ?auto_310369 ) ) ( not ( = ?auto_310367 ?auto_310370 ) ) ( not ( = ?auto_310367 ?auto_310371 ) ) ( not ( = ?auto_310367 ?auto_310372 ) ) ( not ( = ?auto_310368 ?auto_310369 ) ) ( not ( = ?auto_310368 ?auto_310370 ) ) ( not ( = ?auto_310368 ?auto_310371 ) ) ( not ( = ?auto_310368 ?auto_310372 ) ) ( not ( = ?auto_310369 ?auto_310370 ) ) ( not ( = ?auto_310369 ?auto_310371 ) ) ( not ( = ?auto_310369 ?auto_310372 ) ) ( not ( = ?auto_310370 ?auto_310371 ) ) ( not ( = ?auto_310370 ?auto_310372 ) ) ( not ( = ?auto_310371 ?auto_310372 ) ) ( ON ?auto_310370 ?auto_310371 ) ( ON ?auto_310369 ?auto_310370 ) ( ON ?auto_310368 ?auto_310369 ) ( ON ?auto_310367 ?auto_310368 ) ( ON ?auto_310366 ?auto_310367 ) ( ON ?auto_310365 ?auto_310366 ) ( CLEAR ?auto_310363 ) ( ON ?auto_310364 ?auto_310365 ) ( CLEAR ?auto_310364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_310363 ?auto_310364 )
      ( MAKE-9PILE ?auto_310363 ?auto_310364 ?auto_310365 ?auto_310366 ?auto_310367 ?auto_310368 ?auto_310369 ?auto_310370 ?auto_310371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_310401 - BLOCK
      ?auto_310402 - BLOCK
      ?auto_310403 - BLOCK
      ?auto_310404 - BLOCK
      ?auto_310405 - BLOCK
      ?auto_310406 - BLOCK
      ?auto_310407 - BLOCK
      ?auto_310408 - BLOCK
      ?auto_310409 - BLOCK
    )
    :vars
    (
      ?auto_310410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310409 ?auto_310410 ) ( not ( = ?auto_310401 ?auto_310402 ) ) ( not ( = ?auto_310401 ?auto_310403 ) ) ( not ( = ?auto_310401 ?auto_310404 ) ) ( not ( = ?auto_310401 ?auto_310405 ) ) ( not ( = ?auto_310401 ?auto_310406 ) ) ( not ( = ?auto_310401 ?auto_310407 ) ) ( not ( = ?auto_310401 ?auto_310408 ) ) ( not ( = ?auto_310401 ?auto_310409 ) ) ( not ( = ?auto_310401 ?auto_310410 ) ) ( not ( = ?auto_310402 ?auto_310403 ) ) ( not ( = ?auto_310402 ?auto_310404 ) ) ( not ( = ?auto_310402 ?auto_310405 ) ) ( not ( = ?auto_310402 ?auto_310406 ) ) ( not ( = ?auto_310402 ?auto_310407 ) ) ( not ( = ?auto_310402 ?auto_310408 ) ) ( not ( = ?auto_310402 ?auto_310409 ) ) ( not ( = ?auto_310402 ?auto_310410 ) ) ( not ( = ?auto_310403 ?auto_310404 ) ) ( not ( = ?auto_310403 ?auto_310405 ) ) ( not ( = ?auto_310403 ?auto_310406 ) ) ( not ( = ?auto_310403 ?auto_310407 ) ) ( not ( = ?auto_310403 ?auto_310408 ) ) ( not ( = ?auto_310403 ?auto_310409 ) ) ( not ( = ?auto_310403 ?auto_310410 ) ) ( not ( = ?auto_310404 ?auto_310405 ) ) ( not ( = ?auto_310404 ?auto_310406 ) ) ( not ( = ?auto_310404 ?auto_310407 ) ) ( not ( = ?auto_310404 ?auto_310408 ) ) ( not ( = ?auto_310404 ?auto_310409 ) ) ( not ( = ?auto_310404 ?auto_310410 ) ) ( not ( = ?auto_310405 ?auto_310406 ) ) ( not ( = ?auto_310405 ?auto_310407 ) ) ( not ( = ?auto_310405 ?auto_310408 ) ) ( not ( = ?auto_310405 ?auto_310409 ) ) ( not ( = ?auto_310405 ?auto_310410 ) ) ( not ( = ?auto_310406 ?auto_310407 ) ) ( not ( = ?auto_310406 ?auto_310408 ) ) ( not ( = ?auto_310406 ?auto_310409 ) ) ( not ( = ?auto_310406 ?auto_310410 ) ) ( not ( = ?auto_310407 ?auto_310408 ) ) ( not ( = ?auto_310407 ?auto_310409 ) ) ( not ( = ?auto_310407 ?auto_310410 ) ) ( not ( = ?auto_310408 ?auto_310409 ) ) ( not ( = ?auto_310408 ?auto_310410 ) ) ( not ( = ?auto_310409 ?auto_310410 ) ) ( ON ?auto_310408 ?auto_310409 ) ( ON ?auto_310407 ?auto_310408 ) ( ON ?auto_310406 ?auto_310407 ) ( ON ?auto_310405 ?auto_310406 ) ( ON ?auto_310404 ?auto_310405 ) ( ON ?auto_310403 ?auto_310404 ) ( ON ?auto_310402 ?auto_310403 ) ( ON ?auto_310401 ?auto_310402 ) ( CLEAR ?auto_310401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_310401 )
      ( MAKE-9PILE ?auto_310401 ?auto_310402 ?auto_310403 ?auto_310404 ?auto_310405 ?auto_310406 ?auto_310407 ?auto_310408 ?auto_310409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310440 - BLOCK
      ?auto_310441 - BLOCK
      ?auto_310442 - BLOCK
      ?auto_310443 - BLOCK
      ?auto_310444 - BLOCK
      ?auto_310445 - BLOCK
      ?auto_310446 - BLOCK
      ?auto_310447 - BLOCK
      ?auto_310448 - BLOCK
      ?auto_310449 - BLOCK
    )
    :vars
    (
      ?auto_310450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_310448 ) ( ON ?auto_310449 ?auto_310450 ) ( CLEAR ?auto_310449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_310440 ) ( ON ?auto_310441 ?auto_310440 ) ( ON ?auto_310442 ?auto_310441 ) ( ON ?auto_310443 ?auto_310442 ) ( ON ?auto_310444 ?auto_310443 ) ( ON ?auto_310445 ?auto_310444 ) ( ON ?auto_310446 ?auto_310445 ) ( ON ?auto_310447 ?auto_310446 ) ( ON ?auto_310448 ?auto_310447 ) ( not ( = ?auto_310440 ?auto_310441 ) ) ( not ( = ?auto_310440 ?auto_310442 ) ) ( not ( = ?auto_310440 ?auto_310443 ) ) ( not ( = ?auto_310440 ?auto_310444 ) ) ( not ( = ?auto_310440 ?auto_310445 ) ) ( not ( = ?auto_310440 ?auto_310446 ) ) ( not ( = ?auto_310440 ?auto_310447 ) ) ( not ( = ?auto_310440 ?auto_310448 ) ) ( not ( = ?auto_310440 ?auto_310449 ) ) ( not ( = ?auto_310440 ?auto_310450 ) ) ( not ( = ?auto_310441 ?auto_310442 ) ) ( not ( = ?auto_310441 ?auto_310443 ) ) ( not ( = ?auto_310441 ?auto_310444 ) ) ( not ( = ?auto_310441 ?auto_310445 ) ) ( not ( = ?auto_310441 ?auto_310446 ) ) ( not ( = ?auto_310441 ?auto_310447 ) ) ( not ( = ?auto_310441 ?auto_310448 ) ) ( not ( = ?auto_310441 ?auto_310449 ) ) ( not ( = ?auto_310441 ?auto_310450 ) ) ( not ( = ?auto_310442 ?auto_310443 ) ) ( not ( = ?auto_310442 ?auto_310444 ) ) ( not ( = ?auto_310442 ?auto_310445 ) ) ( not ( = ?auto_310442 ?auto_310446 ) ) ( not ( = ?auto_310442 ?auto_310447 ) ) ( not ( = ?auto_310442 ?auto_310448 ) ) ( not ( = ?auto_310442 ?auto_310449 ) ) ( not ( = ?auto_310442 ?auto_310450 ) ) ( not ( = ?auto_310443 ?auto_310444 ) ) ( not ( = ?auto_310443 ?auto_310445 ) ) ( not ( = ?auto_310443 ?auto_310446 ) ) ( not ( = ?auto_310443 ?auto_310447 ) ) ( not ( = ?auto_310443 ?auto_310448 ) ) ( not ( = ?auto_310443 ?auto_310449 ) ) ( not ( = ?auto_310443 ?auto_310450 ) ) ( not ( = ?auto_310444 ?auto_310445 ) ) ( not ( = ?auto_310444 ?auto_310446 ) ) ( not ( = ?auto_310444 ?auto_310447 ) ) ( not ( = ?auto_310444 ?auto_310448 ) ) ( not ( = ?auto_310444 ?auto_310449 ) ) ( not ( = ?auto_310444 ?auto_310450 ) ) ( not ( = ?auto_310445 ?auto_310446 ) ) ( not ( = ?auto_310445 ?auto_310447 ) ) ( not ( = ?auto_310445 ?auto_310448 ) ) ( not ( = ?auto_310445 ?auto_310449 ) ) ( not ( = ?auto_310445 ?auto_310450 ) ) ( not ( = ?auto_310446 ?auto_310447 ) ) ( not ( = ?auto_310446 ?auto_310448 ) ) ( not ( = ?auto_310446 ?auto_310449 ) ) ( not ( = ?auto_310446 ?auto_310450 ) ) ( not ( = ?auto_310447 ?auto_310448 ) ) ( not ( = ?auto_310447 ?auto_310449 ) ) ( not ( = ?auto_310447 ?auto_310450 ) ) ( not ( = ?auto_310448 ?auto_310449 ) ) ( not ( = ?auto_310448 ?auto_310450 ) ) ( not ( = ?auto_310449 ?auto_310450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_310449 ?auto_310450 )
      ( !STACK ?auto_310449 ?auto_310448 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310482 - BLOCK
      ?auto_310483 - BLOCK
      ?auto_310484 - BLOCK
      ?auto_310485 - BLOCK
      ?auto_310486 - BLOCK
      ?auto_310487 - BLOCK
      ?auto_310488 - BLOCK
      ?auto_310489 - BLOCK
      ?auto_310490 - BLOCK
      ?auto_310491 - BLOCK
    )
    :vars
    (
      ?auto_310492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310491 ?auto_310492 ) ( ON-TABLE ?auto_310482 ) ( ON ?auto_310483 ?auto_310482 ) ( ON ?auto_310484 ?auto_310483 ) ( ON ?auto_310485 ?auto_310484 ) ( ON ?auto_310486 ?auto_310485 ) ( ON ?auto_310487 ?auto_310486 ) ( ON ?auto_310488 ?auto_310487 ) ( ON ?auto_310489 ?auto_310488 ) ( not ( = ?auto_310482 ?auto_310483 ) ) ( not ( = ?auto_310482 ?auto_310484 ) ) ( not ( = ?auto_310482 ?auto_310485 ) ) ( not ( = ?auto_310482 ?auto_310486 ) ) ( not ( = ?auto_310482 ?auto_310487 ) ) ( not ( = ?auto_310482 ?auto_310488 ) ) ( not ( = ?auto_310482 ?auto_310489 ) ) ( not ( = ?auto_310482 ?auto_310490 ) ) ( not ( = ?auto_310482 ?auto_310491 ) ) ( not ( = ?auto_310482 ?auto_310492 ) ) ( not ( = ?auto_310483 ?auto_310484 ) ) ( not ( = ?auto_310483 ?auto_310485 ) ) ( not ( = ?auto_310483 ?auto_310486 ) ) ( not ( = ?auto_310483 ?auto_310487 ) ) ( not ( = ?auto_310483 ?auto_310488 ) ) ( not ( = ?auto_310483 ?auto_310489 ) ) ( not ( = ?auto_310483 ?auto_310490 ) ) ( not ( = ?auto_310483 ?auto_310491 ) ) ( not ( = ?auto_310483 ?auto_310492 ) ) ( not ( = ?auto_310484 ?auto_310485 ) ) ( not ( = ?auto_310484 ?auto_310486 ) ) ( not ( = ?auto_310484 ?auto_310487 ) ) ( not ( = ?auto_310484 ?auto_310488 ) ) ( not ( = ?auto_310484 ?auto_310489 ) ) ( not ( = ?auto_310484 ?auto_310490 ) ) ( not ( = ?auto_310484 ?auto_310491 ) ) ( not ( = ?auto_310484 ?auto_310492 ) ) ( not ( = ?auto_310485 ?auto_310486 ) ) ( not ( = ?auto_310485 ?auto_310487 ) ) ( not ( = ?auto_310485 ?auto_310488 ) ) ( not ( = ?auto_310485 ?auto_310489 ) ) ( not ( = ?auto_310485 ?auto_310490 ) ) ( not ( = ?auto_310485 ?auto_310491 ) ) ( not ( = ?auto_310485 ?auto_310492 ) ) ( not ( = ?auto_310486 ?auto_310487 ) ) ( not ( = ?auto_310486 ?auto_310488 ) ) ( not ( = ?auto_310486 ?auto_310489 ) ) ( not ( = ?auto_310486 ?auto_310490 ) ) ( not ( = ?auto_310486 ?auto_310491 ) ) ( not ( = ?auto_310486 ?auto_310492 ) ) ( not ( = ?auto_310487 ?auto_310488 ) ) ( not ( = ?auto_310487 ?auto_310489 ) ) ( not ( = ?auto_310487 ?auto_310490 ) ) ( not ( = ?auto_310487 ?auto_310491 ) ) ( not ( = ?auto_310487 ?auto_310492 ) ) ( not ( = ?auto_310488 ?auto_310489 ) ) ( not ( = ?auto_310488 ?auto_310490 ) ) ( not ( = ?auto_310488 ?auto_310491 ) ) ( not ( = ?auto_310488 ?auto_310492 ) ) ( not ( = ?auto_310489 ?auto_310490 ) ) ( not ( = ?auto_310489 ?auto_310491 ) ) ( not ( = ?auto_310489 ?auto_310492 ) ) ( not ( = ?auto_310490 ?auto_310491 ) ) ( not ( = ?auto_310490 ?auto_310492 ) ) ( not ( = ?auto_310491 ?auto_310492 ) ) ( CLEAR ?auto_310489 ) ( ON ?auto_310490 ?auto_310491 ) ( CLEAR ?auto_310490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_310482 ?auto_310483 ?auto_310484 ?auto_310485 ?auto_310486 ?auto_310487 ?auto_310488 ?auto_310489 ?auto_310490 )
      ( MAKE-10PILE ?auto_310482 ?auto_310483 ?auto_310484 ?auto_310485 ?auto_310486 ?auto_310487 ?auto_310488 ?auto_310489 ?auto_310490 ?auto_310491 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310524 - BLOCK
      ?auto_310525 - BLOCK
      ?auto_310526 - BLOCK
      ?auto_310527 - BLOCK
      ?auto_310528 - BLOCK
      ?auto_310529 - BLOCK
      ?auto_310530 - BLOCK
      ?auto_310531 - BLOCK
      ?auto_310532 - BLOCK
      ?auto_310533 - BLOCK
    )
    :vars
    (
      ?auto_310534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310533 ?auto_310534 ) ( ON-TABLE ?auto_310524 ) ( ON ?auto_310525 ?auto_310524 ) ( ON ?auto_310526 ?auto_310525 ) ( ON ?auto_310527 ?auto_310526 ) ( ON ?auto_310528 ?auto_310527 ) ( ON ?auto_310529 ?auto_310528 ) ( ON ?auto_310530 ?auto_310529 ) ( not ( = ?auto_310524 ?auto_310525 ) ) ( not ( = ?auto_310524 ?auto_310526 ) ) ( not ( = ?auto_310524 ?auto_310527 ) ) ( not ( = ?auto_310524 ?auto_310528 ) ) ( not ( = ?auto_310524 ?auto_310529 ) ) ( not ( = ?auto_310524 ?auto_310530 ) ) ( not ( = ?auto_310524 ?auto_310531 ) ) ( not ( = ?auto_310524 ?auto_310532 ) ) ( not ( = ?auto_310524 ?auto_310533 ) ) ( not ( = ?auto_310524 ?auto_310534 ) ) ( not ( = ?auto_310525 ?auto_310526 ) ) ( not ( = ?auto_310525 ?auto_310527 ) ) ( not ( = ?auto_310525 ?auto_310528 ) ) ( not ( = ?auto_310525 ?auto_310529 ) ) ( not ( = ?auto_310525 ?auto_310530 ) ) ( not ( = ?auto_310525 ?auto_310531 ) ) ( not ( = ?auto_310525 ?auto_310532 ) ) ( not ( = ?auto_310525 ?auto_310533 ) ) ( not ( = ?auto_310525 ?auto_310534 ) ) ( not ( = ?auto_310526 ?auto_310527 ) ) ( not ( = ?auto_310526 ?auto_310528 ) ) ( not ( = ?auto_310526 ?auto_310529 ) ) ( not ( = ?auto_310526 ?auto_310530 ) ) ( not ( = ?auto_310526 ?auto_310531 ) ) ( not ( = ?auto_310526 ?auto_310532 ) ) ( not ( = ?auto_310526 ?auto_310533 ) ) ( not ( = ?auto_310526 ?auto_310534 ) ) ( not ( = ?auto_310527 ?auto_310528 ) ) ( not ( = ?auto_310527 ?auto_310529 ) ) ( not ( = ?auto_310527 ?auto_310530 ) ) ( not ( = ?auto_310527 ?auto_310531 ) ) ( not ( = ?auto_310527 ?auto_310532 ) ) ( not ( = ?auto_310527 ?auto_310533 ) ) ( not ( = ?auto_310527 ?auto_310534 ) ) ( not ( = ?auto_310528 ?auto_310529 ) ) ( not ( = ?auto_310528 ?auto_310530 ) ) ( not ( = ?auto_310528 ?auto_310531 ) ) ( not ( = ?auto_310528 ?auto_310532 ) ) ( not ( = ?auto_310528 ?auto_310533 ) ) ( not ( = ?auto_310528 ?auto_310534 ) ) ( not ( = ?auto_310529 ?auto_310530 ) ) ( not ( = ?auto_310529 ?auto_310531 ) ) ( not ( = ?auto_310529 ?auto_310532 ) ) ( not ( = ?auto_310529 ?auto_310533 ) ) ( not ( = ?auto_310529 ?auto_310534 ) ) ( not ( = ?auto_310530 ?auto_310531 ) ) ( not ( = ?auto_310530 ?auto_310532 ) ) ( not ( = ?auto_310530 ?auto_310533 ) ) ( not ( = ?auto_310530 ?auto_310534 ) ) ( not ( = ?auto_310531 ?auto_310532 ) ) ( not ( = ?auto_310531 ?auto_310533 ) ) ( not ( = ?auto_310531 ?auto_310534 ) ) ( not ( = ?auto_310532 ?auto_310533 ) ) ( not ( = ?auto_310532 ?auto_310534 ) ) ( not ( = ?auto_310533 ?auto_310534 ) ) ( ON ?auto_310532 ?auto_310533 ) ( CLEAR ?auto_310530 ) ( ON ?auto_310531 ?auto_310532 ) ( CLEAR ?auto_310531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_310524 ?auto_310525 ?auto_310526 ?auto_310527 ?auto_310528 ?auto_310529 ?auto_310530 ?auto_310531 )
      ( MAKE-10PILE ?auto_310524 ?auto_310525 ?auto_310526 ?auto_310527 ?auto_310528 ?auto_310529 ?auto_310530 ?auto_310531 ?auto_310532 ?auto_310533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310566 - BLOCK
      ?auto_310567 - BLOCK
      ?auto_310568 - BLOCK
      ?auto_310569 - BLOCK
      ?auto_310570 - BLOCK
      ?auto_310571 - BLOCK
      ?auto_310572 - BLOCK
      ?auto_310573 - BLOCK
      ?auto_310574 - BLOCK
      ?auto_310575 - BLOCK
    )
    :vars
    (
      ?auto_310576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310575 ?auto_310576 ) ( ON-TABLE ?auto_310566 ) ( ON ?auto_310567 ?auto_310566 ) ( ON ?auto_310568 ?auto_310567 ) ( ON ?auto_310569 ?auto_310568 ) ( ON ?auto_310570 ?auto_310569 ) ( ON ?auto_310571 ?auto_310570 ) ( not ( = ?auto_310566 ?auto_310567 ) ) ( not ( = ?auto_310566 ?auto_310568 ) ) ( not ( = ?auto_310566 ?auto_310569 ) ) ( not ( = ?auto_310566 ?auto_310570 ) ) ( not ( = ?auto_310566 ?auto_310571 ) ) ( not ( = ?auto_310566 ?auto_310572 ) ) ( not ( = ?auto_310566 ?auto_310573 ) ) ( not ( = ?auto_310566 ?auto_310574 ) ) ( not ( = ?auto_310566 ?auto_310575 ) ) ( not ( = ?auto_310566 ?auto_310576 ) ) ( not ( = ?auto_310567 ?auto_310568 ) ) ( not ( = ?auto_310567 ?auto_310569 ) ) ( not ( = ?auto_310567 ?auto_310570 ) ) ( not ( = ?auto_310567 ?auto_310571 ) ) ( not ( = ?auto_310567 ?auto_310572 ) ) ( not ( = ?auto_310567 ?auto_310573 ) ) ( not ( = ?auto_310567 ?auto_310574 ) ) ( not ( = ?auto_310567 ?auto_310575 ) ) ( not ( = ?auto_310567 ?auto_310576 ) ) ( not ( = ?auto_310568 ?auto_310569 ) ) ( not ( = ?auto_310568 ?auto_310570 ) ) ( not ( = ?auto_310568 ?auto_310571 ) ) ( not ( = ?auto_310568 ?auto_310572 ) ) ( not ( = ?auto_310568 ?auto_310573 ) ) ( not ( = ?auto_310568 ?auto_310574 ) ) ( not ( = ?auto_310568 ?auto_310575 ) ) ( not ( = ?auto_310568 ?auto_310576 ) ) ( not ( = ?auto_310569 ?auto_310570 ) ) ( not ( = ?auto_310569 ?auto_310571 ) ) ( not ( = ?auto_310569 ?auto_310572 ) ) ( not ( = ?auto_310569 ?auto_310573 ) ) ( not ( = ?auto_310569 ?auto_310574 ) ) ( not ( = ?auto_310569 ?auto_310575 ) ) ( not ( = ?auto_310569 ?auto_310576 ) ) ( not ( = ?auto_310570 ?auto_310571 ) ) ( not ( = ?auto_310570 ?auto_310572 ) ) ( not ( = ?auto_310570 ?auto_310573 ) ) ( not ( = ?auto_310570 ?auto_310574 ) ) ( not ( = ?auto_310570 ?auto_310575 ) ) ( not ( = ?auto_310570 ?auto_310576 ) ) ( not ( = ?auto_310571 ?auto_310572 ) ) ( not ( = ?auto_310571 ?auto_310573 ) ) ( not ( = ?auto_310571 ?auto_310574 ) ) ( not ( = ?auto_310571 ?auto_310575 ) ) ( not ( = ?auto_310571 ?auto_310576 ) ) ( not ( = ?auto_310572 ?auto_310573 ) ) ( not ( = ?auto_310572 ?auto_310574 ) ) ( not ( = ?auto_310572 ?auto_310575 ) ) ( not ( = ?auto_310572 ?auto_310576 ) ) ( not ( = ?auto_310573 ?auto_310574 ) ) ( not ( = ?auto_310573 ?auto_310575 ) ) ( not ( = ?auto_310573 ?auto_310576 ) ) ( not ( = ?auto_310574 ?auto_310575 ) ) ( not ( = ?auto_310574 ?auto_310576 ) ) ( not ( = ?auto_310575 ?auto_310576 ) ) ( ON ?auto_310574 ?auto_310575 ) ( ON ?auto_310573 ?auto_310574 ) ( CLEAR ?auto_310571 ) ( ON ?auto_310572 ?auto_310573 ) ( CLEAR ?auto_310572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_310566 ?auto_310567 ?auto_310568 ?auto_310569 ?auto_310570 ?auto_310571 ?auto_310572 )
      ( MAKE-10PILE ?auto_310566 ?auto_310567 ?auto_310568 ?auto_310569 ?auto_310570 ?auto_310571 ?auto_310572 ?auto_310573 ?auto_310574 ?auto_310575 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310608 - BLOCK
      ?auto_310609 - BLOCK
      ?auto_310610 - BLOCK
      ?auto_310611 - BLOCK
      ?auto_310612 - BLOCK
      ?auto_310613 - BLOCK
      ?auto_310614 - BLOCK
      ?auto_310615 - BLOCK
      ?auto_310616 - BLOCK
      ?auto_310617 - BLOCK
    )
    :vars
    (
      ?auto_310618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310617 ?auto_310618 ) ( ON-TABLE ?auto_310608 ) ( ON ?auto_310609 ?auto_310608 ) ( ON ?auto_310610 ?auto_310609 ) ( ON ?auto_310611 ?auto_310610 ) ( ON ?auto_310612 ?auto_310611 ) ( not ( = ?auto_310608 ?auto_310609 ) ) ( not ( = ?auto_310608 ?auto_310610 ) ) ( not ( = ?auto_310608 ?auto_310611 ) ) ( not ( = ?auto_310608 ?auto_310612 ) ) ( not ( = ?auto_310608 ?auto_310613 ) ) ( not ( = ?auto_310608 ?auto_310614 ) ) ( not ( = ?auto_310608 ?auto_310615 ) ) ( not ( = ?auto_310608 ?auto_310616 ) ) ( not ( = ?auto_310608 ?auto_310617 ) ) ( not ( = ?auto_310608 ?auto_310618 ) ) ( not ( = ?auto_310609 ?auto_310610 ) ) ( not ( = ?auto_310609 ?auto_310611 ) ) ( not ( = ?auto_310609 ?auto_310612 ) ) ( not ( = ?auto_310609 ?auto_310613 ) ) ( not ( = ?auto_310609 ?auto_310614 ) ) ( not ( = ?auto_310609 ?auto_310615 ) ) ( not ( = ?auto_310609 ?auto_310616 ) ) ( not ( = ?auto_310609 ?auto_310617 ) ) ( not ( = ?auto_310609 ?auto_310618 ) ) ( not ( = ?auto_310610 ?auto_310611 ) ) ( not ( = ?auto_310610 ?auto_310612 ) ) ( not ( = ?auto_310610 ?auto_310613 ) ) ( not ( = ?auto_310610 ?auto_310614 ) ) ( not ( = ?auto_310610 ?auto_310615 ) ) ( not ( = ?auto_310610 ?auto_310616 ) ) ( not ( = ?auto_310610 ?auto_310617 ) ) ( not ( = ?auto_310610 ?auto_310618 ) ) ( not ( = ?auto_310611 ?auto_310612 ) ) ( not ( = ?auto_310611 ?auto_310613 ) ) ( not ( = ?auto_310611 ?auto_310614 ) ) ( not ( = ?auto_310611 ?auto_310615 ) ) ( not ( = ?auto_310611 ?auto_310616 ) ) ( not ( = ?auto_310611 ?auto_310617 ) ) ( not ( = ?auto_310611 ?auto_310618 ) ) ( not ( = ?auto_310612 ?auto_310613 ) ) ( not ( = ?auto_310612 ?auto_310614 ) ) ( not ( = ?auto_310612 ?auto_310615 ) ) ( not ( = ?auto_310612 ?auto_310616 ) ) ( not ( = ?auto_310612 ?auto_310617 ) ) ( not ( = ?auto_310612 ?auto_310618 ) ) ( not ( = ?auto_310613 ?auto_310614 ) ) ( not ( = ?auto_310613 ?auto_310615 ) ) ( not ( = ?auto_310613 ?auto_310616 ) ) ( not ( = ?auto_310613 ?auto_310617 ) ) ( not ( = ?auto_310613 ?auto_310618 ) ) ( not ( = ?auto_310614 ?auto_310615 ) ) ( not ( = ?auto_310614 ?auto_310616 ) ) ( not ( = ?auto_310614 ?auto_310617 ) ) ( not ( = ?auto_310614 ?auto_310618 ) ) ( not ( = ?auto_310615 ?auto_310616 ) ) ( not ( = ?auto_310615 ?auto_310617 ) ) ( not ( = ?auto_310615 ?auto_310618 ) ) ( not ( = ?auto_310616 ?auto_310617 ) ) ( not ( = ?auto_310616 ?auto_310618 ) ) ( not ( = ?auto_310617 ?auto_310618 ) ) ( ON ?auto_310616 ?auto_310617 ) ( ON ?auto_310615 ?auto_310616 ) ( ON ?auto_310614 ?auto_310615 ) ( CLEAR ?auto_310612 ) ( ON ?auto_310613 ?auto_310614 ) ( CLEAR ?auto_310613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_310608 ?auto_310609 ?auto_310610 ?auto_310611 ?auto_310612 ?auto_310613 )
      ( MAKE-10PILE ?auto_310608 ?auto_310609 ?auto_310610 ?auto_310611 ?auto_310612 ?auto_310613 ?auto_310614 ?auto_310615 ?auto_310616 ?auto_310617 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310650 - BLOCK
      ?auto_310651 - BLOCK
      ?auto_310652 - BLOCK
      ?auto_310653 - BLOCK
      ?auto_310654 - BLOCK
      ?auto_310655 - BLOCK
      ?auto_310656 - BLOCK
      ?auto_310657 - BLOCK
      ?auto_310658 - BLOCK
      ?auto_310659 - BLOCK
    )
    :vars
    (
      ?auto_310660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310659 ?auto_310660 ) ( ON-TABLE ?auto_310650 ) ( ON ?auto_310651 ?auto_310650 ) ( ON ?auto_310652 ?auto_310651 ) ( ON ?auto_310653 ?auto_310652 ) ( not ( = ?auto_310650 ?auto_310651 ) ) ( not ( = ?auto_310650 ?auto_310652 ) ) ( not ( = ?auto_310650 ?auto_310653 ) ) ( not ( = ?auto_310650 ?auto_310654 ) ) ( not ( = ?auto_310650 ?auto_310655 ) ) ( not ( = ?auto_310650 ?auto_310656 ) ) ( not ( = ?auto_310650 ?auto_310657 ) ) ( not ( = ?auto_310650 ?auto_310658 ) ) ( not ( = ?auto_310650 ?auto_310659 ) ) ( not ( = ?auto_310650 ?auto_310660 ) ) ( not ( = ?auto_310651 ?auto_310652 ) ) ( not ( = ?auto_310651 ?auto_310653 ) ) ( not ( = ?auto_310651 ?auto_310654 ) ) ( not ( = ?auto_310651 ?auto_310655 ) ) ( not ( = ?auto_310651 ?auto_310656 ) ) ( not ( = ?auto_310651 ?auto_310657 ) ) ( not ( = ?auto_310651 ?auto_310658 ) ) ( not ( = ?auto_310651 ?auto_310659 ) ) ( not ( = ?auto_310651 ?auto_310660 ) ) ( not ( = ?auto_310652 ?auto_310653 ) ) ( not ( = ?auto_310652 ?auto_310654 ) ) ( not ( = ?auto_310652 ?auto_310655 ) ) ( not ( = ?auto_310652 ?auto_310656 ) ) ( not ( = ?auto_310652 ?auto_310657 ) ) ( not ( = ?auto_310652 ?auto_310658 ) ) ( not ( = ?auto_310652 ?auto_310659 ) ) ( not ( = ?auto_310652 ?auto_310660 ) ) ( not ( = ?auto_310653 ?auto_310654 ) ) ( not ( = ?auto_310653 ?auto_310655 ) ) ( not ( = ?auto_310653 ?auto_310656 ) ) ( not ( = ?auto_310653 ?auto_310657 ) ) ( not ( = ?auto_310653 ?auto_310658 ) ) ( not ( = ?auto_310653 ?auto_310659 ) ) ( not ( = ?auto_310653 ?auto_310660 ) ) ( not ( = ?auto_310654 ?auto_310655 ) ) ( not ( = ?auto_310654 ?auto_310656 ) ) ( not ( = ?auto_310654 ?auto_310657 ) ) ( not ( = ?auto_310654 ?auto_310658 ) ) ( not ( = ?auto_310654 ?auto_310659 ) ) ( not ( = ?auto_310654 ?auto_310660 ) ) ( not ( = ?auto_310655 ?auto_310656 ) ) ( not ( = ?auto_310655 ?auto_310657 ) ) ( not ( = ?auto_310655 ?auto_310658 ) ) ( not ( = ?auto_310655 ?auto_310659 ) ) ( not ( = ?auto_310655 ?auto_310660 ) ) ( not ( = ?auto_310656 ?auto_310657 ) ) ( not ( = ?auto_310656 ?auto_310658 ) ) ( not ( = ?auto_310656 ?auto_310659 ) ) ( not ( = ?auto_310656 ?auto_310660 ) ) ( not ( = ?auto_310657 ?auto_310658 ) ) ( not ( = ?auto_310657 ?auto_310659 ) ) ( not ( = ?auto_310657 ?auto_310660 ) ) ( not ( = ?auto_310658 ?auto_310659 ) ) ( not ( = ?auto_310658 ?auto_310660 ) ) ( not ( = ?auto_310659 ?auto_310660 ) ) ( ON ?auto_310658 ?auto_310659 ) ( ON ?auto_310657 ?auto_310658 ) ( ON ?auto_310656 ?auto_310657 ) ( ON ?auto_310655 ?auto_310656 ) ( CLEAR ?auto_310653 ) ( ON ?auto_310654 ?auto_310655 ) ( CLEAR ?auto_310654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_310650 ?auto_310651 ?auto_310652 ?auto_310653 ?auto_310654 )
      ( MAKE-10PILE ?auto_310650 ?auto_310651 ?auto_310652 ?auto_310653 ?auto_310654 ?auto_310655 ?auto_310656 ?auto_310657 ?auto_310658 ?auto_310659 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310692 - BLOCK
      ?auto_310693 - BLOCK
      ?auto_310694 - BLOCK
      ?auto_310695 - BLOCK
      ?auto_310696 - BLOCK
      ?auto_310697 - BLOCK
      ?auto_310698 - BLOCK
      ?auto_310699 - BLOCK
      ?auto_310700 - BLOCK
      ?auto_310701 - BLOCK
    )
    :vars
    (
      ?auto_310702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310701 ?auto_310702 ) ( ON-TABLE ?auto_310692 ) ( ON ?auto_310693 ?auto_310692 ) ( ON ?auto_310694 ?auto_310693 ) ( not ( = ?auto_310692 ?auto_310693 ) ) ( not ( = ?auto_310692 ?auto_310694 ) ) ( not ( = ?auto_310692 ?auto_310695 ) ) ( not ( = ?auto_310692 ?auto_310696 ) ) ( not ( = ?auto_310692 ?auto_310697 ) ) ( not ( = ?auto_310692 ?auto_310698 ) ) ( not ( = ?auto_310692 ?auto_310699 ) ) ( not ( = ?auto_310692 ?auto_310700 ) ) ( not ( = ?auto_310692 ?auto_310701 ) ) ( not ( = ?auto_310692 ?auto_310702 ) ) ( not ( = ?auto_310693 ?auto_310694 ) ) ( not ( = ?auto_310693 ?auto_310695 ) ) ( not ( = ?auto_310693 ?auto_310696 ) ) ( not ( = ?auto_310693 ?auto_310697 ) ) ( not ( = ?auto_310693 ?auto_310698 ) ) ( not ( = ?auto_310693 ?auto_310699 ) ) ( not ( = ?auto_310693 ?auto_310700 ) ) ( not ( = ?auto_310693 ?auto_310701 ) ) ( not ( = ?auto_310693 ?auto_310702 ) ) ( not ( = ?auto_310694 ?auto_310695 ) ) ( not ( = ?auto_310694 ?auto_310696 ) ) ( not ( = ?auto_310694 ?auto_310697 ) ) ( not ( = ?auto_310694 ?auto_310698 ) ) ( not ( = ?auto_310694 ?auto_310699 ) ) ( not ( = ?auto_310694 ?auto_310700 ) ) ( not ( = ?auto_310694 ?auto_310701 ) ) ( not ( = ?auto_310694 ?auto_310702 ) ) ( not ( = ?auto_310695 ?auto_310696 ) ) ( not ( = ?auto_310695 ?auto_310697 ) ) ( not ( = ?auto_310695 ?auto_310698 ) ) ( not ( = ?auto_310695 ?auto_310699 ) ) ( not ( = ?auto_310695 ?auto_310700 ) ) ( not ( = ?auto_310695 ?auto_310701 ) ) ( not ( = ?auto_310695 ?auto_310702 ) ) ( not ( = ?auto_310696 ?auto_310697 ) ) ( not ( = ?auto_310696 ?auto_310698 ) ) ( not ( = ?auto_310696 ?auto_310699 ) ) ( not ( = ?auto_310696 ?auto_310700 ) ) ( not ( = ?auto_310696 ?auto_310701 ) ) ( not ( = ?auto_310696 ?auto_310702 ) ) ( not ( = ?auto_310697 ?auto_310698 ) ) ( not ( = ?auto_310697 ?auto_310699 ) ) ( not ( = ?auto_310697 ?auto_310700 ) ) ( not ( = ?auto_310697 ?auto_310701 ) ) ( not ( = ?auto_310697 ?auto_310702 ) ) ( not ( = ?auto_310698 ?auto_310699 ) ) ( not ( = ?auto_310698 ?auto_310700 ) ) ( not ( = ?auto_310698 ?auto_310701 ) ) ( not ( = ?auto_310698 ?auto_310702 ) ) ( not ( = ?auto_310699 ?auto_310700 ) ) ( not ( = ?auto_310699 ?auto_310701 ) ) ( not ( = ?auto_310699 ?auto_310702 ) ) ( not ( = ?auto_310700 ?auto_310701 ) ) ( not ( = ?auto_310700 ?auto_310702 ) ) ( not ( = ?auto_310701 ?auto_310702 ) ) ( ON ?auto_310700 ?auto_310701 ) ( ON ?auto_310699 ?auto_310700 ) ( ON ?auto_310698 ?auto_310699 ) ( ON ?auto_310697 ?auto_310698 ) ( ON ?auto_310696 ?auto_310697 ) ( CLEAR ?auto_310694 ) ( ON ?auto_310695 ?auto_310696 ) ( CLEAR ?auto_310695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_310692 ?auto_310693 ?auto_310694 ?auto_310695 )
      ( MAKE-10PILE ?auto_310692 ?auto_310693 ?auto_310694 ?auto_310695 ?auto_310696 ?auto_310697 ?auto_310698 ?auto_310699 ?auto_310700 ?auto_310701 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310734 - BLOCK
      ?auto_310735 - BLOCK
      ?auto_310736 - BLOCK
      ?auto_310737 - BLOCK
      ?auto_310738 - BLOCK
      ?auto_310739 - BLOCK
      ?auto_310740 - BLOCK
      ?auto_310741 - BLOCK
      ?auto_310742 - BLOCK
      ?auto_310743 - BLOCK
    )
    :vars
    (
      ?auto_310744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310743 ?auto_310744 ) ( ON-TABLE ?auto_310734 ) ( ON ?auto_310735 ?auto_310734 ) ( not ( = ?auto_310734 ?auto_310735 ) ) ( not ( = ?auto_310734 ?auto_310736 ) ) ( not ( = ?auto_310734 ?auto_310737 ) ) ( not ( = ?auto_310734 ?auto_310738 ) ) ( not ( = ?auto_310734 ?auto_310739 ) ) ( not ( = ?auto_310734 ?auto_310740 ) ) ( not ( = ?auto_310734 ?auto_310741 ) ) ( not ( = ?auto_310734 ?auto_310742 ) ) ( not ( = ?auto_310734 ?auto_310743 ) ) ( not ( = ?auto_310734 ?auto_310744 ) ) ( not ( = ?auto_310735 ?auto_310736 ) ) ( not ( = ?auto_310735 ?auto_310737 ) ) ( not ( = ?auto_310735 ?auto_310738 ) ) ( not ( = ?auto_310735 ?auto_310739 ) ) ( not ( = ?auto_310735 ?auto_310740 ) ) ( not ( = ?auto_310735 ?auto_310741 ) ) ( not ( = ?auto_310735 ?auto_310742 ) ) ( not ( = ?auto_310735 ?auto_310743 ) ) ( not ( = ?auto_310735 ?auto_310744 ) ) ( not ( = ?auto_310736 ?auto_310737 ) ) ( not ( = ?auto_310736 ?auto_310738 ) ) ( not ( = ?auto_310736 ?auto_310739 ) ) ( not ( = ?auto_310736 ?auto_310740 ) ) ( not ( = ?auto_310736 ?auto_310741 ) ) ( not ( = ?auto_310736 ?auto_310742 ) ) ( not ( = ?auto_310736 ?auto_310743 ) ) ( not ( = ?auto_310736 ?auto_310744 ) ) ( not ( = ?auto_310737 ?auto_310738 ) ) ( not ( = ?auto_310737 ?auto_310739 ) ) ( not ( = ?auto_310737 ?auto_310740 ) ) ( not ( = ?auto_310737 ?auto_310741 ) ) ( not ( = ?auto_310737 ?auto_310742 ) ) ( not ( = ?auto_310737 ?auto_310743 ) ) ( not ( = ?auto_310737 ?auto_310744 ) ) ( not ( = ?auto_310738 ?auto_310739 ) ) ( not ( = ?auto_310738 ?auto_310740 ) ) ( not ( = ?auto_310738 ?auto_310741 ) ) ( not ( = ?auto_310738 ?auto_310742 ) ) ( not ( = ?auto_310738 ?auto_310743 ) ) ( not ( = ?auto_310738 ?auto_310744 ) ) ( not ( = ?auto_310739 ?auto_310740 ) ) ( not ( = ?auto_310739 ?auto_310741 ) ) ( not ( = ?auto_310739 ?auto_310742 ) ) ( not ( = ?auto_310739 ?auto_310743 ) ) ( not ( = ?auto_310739 ?auto_310744 ) ) ( not ( = ?auto_310740 ?auto_310741 ) ) ( not ( = ?auto_310740 ?auto_310742 ) ) ( not ( = ?auto_310740 ?auto_310743 ) ) ( not ( = ?auto_310740 ?auto_310744 ) ) ( not ( = ?auto_310741 ?auto_310742 ) ) ( not ( = ?auto_310741 ?auto_310743 ) ) ( not ( = ?auto_310741 ?auto_310744 ) ) ( not ( = ?auto_310742 ?auto_310743 ) ) ( not ( = ?auto_310742 ?auto_310744 ) ) ( not ( = ?auto_310743 ?auto_310744 ) ) ( ON ?auto_310742 ?auto_310743 ) ( ON ?auto_310741 ?auto_310742 ) ( ON ?auto_310740 ?auto_310741 ) ( ON ?auto_310739 ?auto_310740 ) ( ON ?auto_310738 ?auto_310739 ) ( ON ?auto_310737 ?auto_310738 ) ( CLEAR ?auto_310735 ) ( ON ?auto_310736 ?auto_310737 ) ( CLEAR ?auto_310736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_310734 ?auto_310735 ?auto_310736 )
      ( MAKE-10PILE ?auto_310734 ?auto_310735 ?auto_310736 ?auto_310737 ?auto_310738 ?auto_310739 ?auto_310740 ?auto_310741 ?auto_310742 ?auto_310743 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310776 - BLOCK
      ?auto_310777 - BLOCK
      ?auto_310778 - BLOCK
      ?auto_310779 - BLOCK
      ?auto_310780 - BLOCK
      ?auto_310781 - BLOCK
      ?auto_310782 - BLOCK
      ?auto_310783 - BLOCK
      ?auto_310784 - BLOCK
      ?auto_310785 - BLOCK
    )
    :vars
    (
      ?auto_310786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310785 ?auto_310786 ) ( ON-TABLE ?auto_310776 ) ( not ( = ?auto_310776 ?auto_310777 ) ) ( not ( = ?auto_310776 ?auto_310778 ) ) ( not ( = ?auto_310776 ?auto_310779 ) ) ( not ( = ?auto_310776 ?auto_310780 ) ) ( not ( = ?auto_310776 ?auto_310781 ) ) ( not ( = ?auto_310776 ?auto_310782 ) ) ( not ( = ?auto_310776 ?auto_310783 ) ) ( not ( = ?auto_310776 ?auto_310784 ) ) ( not ( = ?auto_310776 ?auto_310785 ) ) ( not ( = ?auto_310776 ?auto_310786 ) ) ( not ( = ?auto_310777 ?auto_310778 ) ) ( not ( = ?auto_310777 ?auto_310779 ) ) ( not ( = ?auto_310777 ?auto_310780 ) ) ( not ( = ?auto_310777 ?auto_310781 ) ) ( not ( = ?auto_310777 ?auto_310782 ) ) ( not ( = ?auto_310777 ?auto_310783 ) ) ( not ( = ?auto_310777 ?auto_310784 ) ) ( not ( = ?auto_310777 ?auto_310785 ) ) ( not ( = ?auto_310777 ?auto_310786 ) ) ( not ( = ?auto_310778 ?auto_310779 ) ) ( not ( = ?auto_310778 ?auto_310780 ) ) ( not ( = ?auto_310778 ?auto_310781 ) ) ( not ( = ?auto_310778 ?auto_310782 ) ) ( not ( = ?auto_310778 ?auto_310783 ) ) ( not ( = ?auto_310778 ?auto_310784 ) ) ( not ( = ?auto_310778 ?auto_310785 ) ) ( not ( = ?auto_310778 ?auto_310786 ) ) ( not ( = ?auto_310779 ?auto_310780 ) ) ( not ( = ?auto_310779 ?auto_310781 ) ) ( not ( = ?auto_310779 ?auto_310782 ) ) ( not ( = ?auto_310779 ?auto_310783 ) ) ( not ( = ?auto_310779 ?auto_310784 ) ) ( not ( = ?auto_310779 ?auto_310785 ) ) ( not ( = ?auto_310779 ?auto_310786 ) ) ( not ( = ?auto_310780 ?auto_310781 ) ) ( not ( = ?auto_310780 ?auto_310782 ) ) ( not ( = ?auto_310780 ?auto_310783 ) ) ( not ( = ?auto_310780 ?auto_310784 ) ) ( not ( = ?auto_310780 ?auto_310785 ) ) ( not ( = ?auto_310780 ?auto_310786 ) ) ( not ( = ?auto_310781 ?auto_310782 ) ) ( not ( = ?auto_310781 ?auto_310783 ) ) ( not ( = ?auto_310781 ?auto_310784 ) ) ( not ( = ?auto_310781 ?auto_310785 ) ) ( not ( = ?auto_310781 ?auto_310786 ) ) ( not ( = ?auto_310782 ?auto_310783 ) ) ( not ( = ?auto_310782 ?auto_310784 ) ) ( not ( = ?auto_310782 ?auto_310785 ) ) ( not ( = ?auto_310782 ?auto_310786 ) ) ( not ( = ?auto_310783 ?auto_310784 ) ) ( not ( = ?auto_310783 ?auto_310785 ) ) ( not ( = ?auto_310783 ?auto_310786 ) ) ( not ( = ?auto_310784 ?auto_310785 ) ) ( not ( = ?auto_310784 ?auto_310786 ) ) ( not ( = ?auto_310785 ?auto_310786 ) ) ( ON ?auto_310784 ?auto_310785 ) ( ON ?auto_310783 ?auto_310784 ) ( ON ?auto_310782 ?auto_310783 ) ( ON ?auto_310781 ?auto_310782 ) ( ON ?auto_310780 ?auto_310781 ) ( ON ?auto_310779 ?auto_310780 ) ( ON ?auto_310778 ?auto_310779 ) ( CLEAR ?auto_310776 ) ( ON ?auto_310777 ?auto_310778 ) ( CLEAR ?auto_310777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_310776 ?auto_310777 )
      ( MAKE-10PILE ?auto_310776 ?auto_310777 ?auto_310778 ?auto_310779 ?auto_310780 ?auto_310781 ?auto_310782 ?auto_310783 ?auto_310784 ?auto_310785 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_310818 - BLOCK
      ?auto_310819 - BLOCK
      ?auto_310820 - BLOCK
      ?auto_310821 - BLOCK
      ?auto_310822 - BLOCK
      ?auto_310823 - BLOCK
      ?auto_310824 - BLOCK
      ?auto_310825 - BLOCK
      ?auto_310826 - BLOCK
      ?auto_310827 - BLOCK
    )
    :vars
    (
      ?auto_310828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310827 ?auto_310828 ) ( not ( = ?auto_310818 ?auto_310819 ) ) ( not ( = ?auto_310818 ?auto_310820 ) ) ( not ( = ?auto_310818 ?auto_310821 ) ) ( not ( = ?auto_310818 ?auto_310822 ) ) ( not ( = ?auto_310818 ?auto_310823 ) ) ( not ( = ?auto_310818 ?auto_310824 ) ) ( not ( = ?auto_310818 ?auto_310825 ) ) ( not ( = ?auto_310818 ?auto_310826 ) ) ( not ( = ?auto_310818 ?auto_310827 ) ) ( not ( = ?auto_310818 ?auto_310828 ) ) ( not ( = ?auto_310819 ?auto_310820 ) ) ( not ( = ?auto_310819 ?auto_310821 ) ) ( not ( = ?auto_310819 ?auto_310822 ) ) ( not ( = ?auto_310819 ?auto_310823 ) ) ( not ( = ?auto_310819 ?auto_310824 ) ) ( not ( = ?auto_310819 ?auto_310825 ) ) ( not ( = ?auto_310819 ?auto_310826 ) ) ( not ( = ?auto_310819 ?auto_310827 ) ) ( not ( = ?auto_310819 ?auto_310828 ) ) ( not ( = ?auto_310820 ?auto_310821 ) ) ( not ( = ?auto_310820 ?auto_310822 ) ) ( not ( = ?auto_310820 ?auto_310823 ) ) ( not ( = ?auto_310820 ?auto_310824 ) ) ( not ( = ?auto_310820 ?auto_310825 ) ) ( not ( = ?auto_310820 ?auto_310826 ) ) ( not ( = ?auto_310820 ?auto_310827 ) ) ( not ( = ?auto_310820 ?auto_310828 ) ) ( not ( = ?auto_310821 ?auto_310822 ) ) ( not ( = ?auto_310821 ?auto_310823 ) ) ( not ( = ?auto_310821 ?auto_310824 ) ) ( not ( = ?auto_310821 ?auto_310825 ) ) ( not ( = ?auto_310821 ?auto_310826 ) ) ( not ( = ?auto_310821 ?auto_310827 ) ) ( not ( = ?auto_310821 ?auto_310828 ) ) ( not ( = ?auto_310822 ?auto_310823 ) ) ( not ( = ?auto_310822 ?auto_310824 ) ) ( not ( = ?auto_310822 ?auto_310825 ) ) ( not ( = ?auto_310822 ?auto_310826 ) ) ( not ( = ?auto_310822 ?auto_310827 ) ) ( not ( = ?auto_310822 ?auto_310828 ) ) ( not ( = ?auto_310823 ?auto_310824 ) ) ( not ( = ?auto_310823 ?auto_310825 ) ) ( not ( = ?auto_310823 ?auto_310826 ) ) ( not ( = ?auto_310823 ?auto_310827 ) ) ( not ( = ?auto_310823 ?auto_310828 ) ) ( not ( = ?auto_310824 ?auto_310825 ) ) ( not ( = ?auto_310824 ?auto_310826 ) ) ( not ( = ?auto_310824 ?auto_310827 ) ) ( not ( = ?auto_310824 ?auto_310828 ) ) ( not ( = ?auto_310825 ?auto_310826 ) ) ( not ( = ?auto_310825 ?auto_310827 ) ) ( not ( = ?auto_310825 ?auto_310828 ) ) ( not ( = ?auto_310826 ?auto_310827 ) ) ( not ( = ?auto_310826 ?auto_310828 ) ) ( not ( = ?auto_310827 ?auto_310828 ) ) ( ON ?auto_310826 ?auto_310827 ) ( ON ?auto_310825 ?auto_310826 ) ( ON ?auto_310824 ?auto_310825 ) ( ON ?auto_310823 ?auto_310824 ) ( ON ?auto_310822 ?auto_310823 ) ( ON ?auto_310821 ?auto_310822 ) ( ON ?auto_310820 ?auto_310821 ) ( ON ?auto_310819 ?auto_310820 ) ( ON ?auto_310818 ?auto_310819 ) ( CLEAR ?auto_310818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_310818 )
      ( MAKE-10PILE ?auto_310818 ?auto_310819 ?auto_310820 ?auto_310821 ?auto_310822 ?auto_310823 ?auto_310824 ?auto_310825 ?auto_310826 ?auto_310827 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_310861 - BLOCK
      ?auto_310862 - BLOCK
      ?auto_310863 - BLOCK
      ?auto_310864 - BLOCK
      ?auto_310865 - BLOCK
      ?auto_310866 - BLOCK
      ?auto_310867 - BLOCK
      ?auto_310868 - BLOCK
      ?auto_310869 - BLOCK
      ?auto_310870 - BLOCK
      ?auto_310871 - BLOCK
    )
    :vars
    (
      ?auto_310872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_310870 ) ( ON ?auto_310871 ?auto_310872 ) ( CLEAR ?auto_310871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_310861 ) ( ON ?auto_310862 ?auto_310861 ) ( ON ?auto_310863 ?auto_310862 ) ( ON ?auto_310864 ?auto_310863 ) ( ON ?auto_310865 ?auto_310864 ) ( ON ?auto_310866 ?auto_310865 ) ( ON ?auto_310867 ?auto_310866 ) ( ON ?auto_310868 ?auto_310867 ) ( ON ?auto_310869 ?auto_310868 ) ( ON ?auto_310870 ?auto_310869 ) ( not ( = ?auto_310861 ?auto_310862 ) ) ( not ( = ?auto_310861 ?auto_310863 ) ) ( not ( = ?auto_310861 ?auto_310864 ) ) ( not ( = ?auto_310861 ?auto_310865 ) ) ( not ( = ?auto_310861 ?auto_310866 ) ) ( not ( = ?auto_310861 ?auto_310867 ) ) ( not ( = ?auto_310861 ?auto_310868 ) ) ( not ( = ?auto_310861 ?auto_310869 ) ) ( not ( = ?auto_310861 ?auto_310870 ) ) ( not ( = ?auto_310861 ?auto_310871 ) ) ( not ( = ?auto_310861 ?auto_310872 ) ) ( not ( = ?auto_310862 ?auto_310863 ) ) ( not ( = ?auto_310862 ?auto_310864 ) ) ( not ( = ?auto_310862 ?auto_310865 ) ) ( not ( = ?auto_310862 ?auto_310866 ) ) ( not ( = ?auto_310862 ?auto_310867 ) ) ( not ( = ?auto_310862 ?auto_310868 ) ) ( not ( = ?auto_310862 ?auto_310869 ) ) ( not ( = ?auto_310862 ?auto_310870 ) ) ( not ( = ?auto_310862 ?auto_310871 ) ) ( not ( = ?auto_310862 ?auto_310872 ) ) ( not ( = ?auto_310863 ?auto_310864 ) ) ( not ( = ?auto_310863 ?auto_310865 ) ) ( not ( = ?auto_310863 ?auto_310866 ) ) ( not ( = ?auto_310863 ?auto_310867 ) ) ( not ( = ?auto_310863 ?auto_310868 ) ) ( not ( = ?auto_310863 ?auto_310869 ) ) ( not ( = ?auto_310863 ?auto_310870 ) ) ( not ( = ?auto_310863 ?auto_310871 ) ) ( not ( = ?auto_310863 ?auto_310872 ) ) ( not ( = ?auto_310864 ?auto_310865 ) ) ( not ( = ?auto_310864 ?auto_310866 ) ) ( not ( = ?auto_310864 ?auto_310867 ) ) ( not ( = ?auto_310864 ?auto_310868 ) ) ( not ( = ?auto_310864 ?auto_310869 ) ) ( not ( = ?auto_310864 ?auto_310870 ) ) ( not ( = ?auto_310864 ?auto_310871 ) ) ( not ( = ?auto_310864 ?auto_310872 ) ) ( not ( = ?auto_310865 ?auto_310866 ) ) ( not ( = ?auto_310865 ?auto_310867 ) ) ( not ( = ?auto_310865 ?auto_310868 ) ) ( not ( = ?auto_310865 ?auto_310869 ) ) ( not ( = ?auto_310865 ?auto_310870 ) ) ( not ( = ?auto_310865 ?auto_310871 ) ) ( not ( = ?auto_310865 ?auto_310872 ) ) ( not ( = ?auto_310866 ?auto_310867 ) ) ( not ( = ?auto_310866 ?auto_310868 ) ) ( not ( = ?auto_310866 ?auto_310869 ) ) ( not ( = ?auto_310866 ?auto_310870 ) ) ( not ( = ?auto_310866 ?auto_310871 ) ) ( not ( = ?auto_310866 ?auto_310872 ) ) ( not ( = ?auto_310867 ?auto_310868 ) ) ( not ( = ?auto_310867 ?auto_310869 ) ) ( not ( = ?auto_310867 ?auto_310870 ) ) ( not ( = ?auto_310867 ?auto_310871 ) ) ( not ( = ?auto_310867 ?auto_310872 ) ) ( not ( = ?auto_310868 ?auto_310869 ) ) ( not ( = ?auto_310868 ?auto_310870 ) ) ( not ( = ?auto_310868 ?auto_310871 ) ) ( not ( = ?auto_310868 ?auto_310872 ) ) ( not ( = ?auto_310869 ?auto_310870 ) ) ( not ( = ?auto_310869 ?auto_310871 ) ) ( not ( = ?auto_310869 ?auto_310872 ) ) ( not ( = ?auto_310870 ?auto_310871 ) ) ( not ( = ?auto_310870 ?auto_310872 ) ) ( not ( = ?auto_310871 ?auto_310872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_310871 ?auto_310872 )
      ( !STACK ?auto_310871 ?auto_310870 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_310907 - BLOCK
      ?auto_310908 - BLOCK
      ?auto_310909 - BLOCK
      ?auto_310910 - BLOCK
      ?auto_310911 - BLOCK
      ?auto_310912 - BLOCK
      ?auto_310913 - BLOCK
      ?auto_310914 - BLOCK
      ?auto_310915 - BLOCK
      ?auto_310916 - BLOCK
      ?auto_310917 - BLOCK
    )
    :vars
    (
      ?auto_310918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310917 ?auto_310918 ) ( ON-TABLE ?auto_310907 ) ( ON ?auto_310908 ?auto_310907 ) ( ON ?auto_310909 ?auto_310908 ) ( ON ?auto_310910 ?auto_310909 ) ( ON ?auto_310911 ?auto_310910 ) ( ON ?auto_310912 ?auto_310911 ) ( ON ?auto_310913 ?auto_310912 ) ( ON ?auto_310914 ?auto_310913 ) ( ON ?auto_310915 ?auto_310914 ) ( not ( = ?auto_310907 ?auto_310908 ) ) ( not ( = ?auto_310907 ?auto_310909 ) ) ( not ( = ?auto_310907 ?auto_310910 ) ) ( not ( = ?auto_310907 ?auto_310911 ) ) ( not ( = ?auto_310907 ?auto_310912 ) ) ( not ( = ?auto_310907 ?auto_310913 ) ) ( not ( = ?auto_310907 ?auto_310914 ) ) ( not ( = ?auto_310907 ?auto_310915 ) ) ( not ( = ?auto_310907 ?auto_310916 ) ) ( not ( = ?auto_310907 ?auto_310917 ) ) ( not ( = ?auto_310907 ?auto_310918 ) ) ( not ( = ?auto_310908 ?auto_310909 ) ) ( not ( = ?auto_310908 ?auto_310910 ) ) ( not ( = ?auto_310908 ?auto_310911 ) ) ( not ( = ?auto_310908 ?auto_310912 ) ) ( not ( = ?auto_310908 ?auto_310913 ) ) ( not ( = ?auto_310908 ?auto_310914 ) ) ( not ( = ?auto_310908 ?auto_310915 ) ) ( not ( = ?auto_310908 ?auto_310916 ) ) ( not ( = ?auto_310908 ?auto_310917 ) ) ( not ( = ?auto_310908 ?auto_310918 ) ) ( not ( = ?auto_310909 ?auto_310910 ) ) ( not ( = ?auto_310909 ?auto_310911 ) ) ( not ( = ?auto_310909 ?auto_310912 ) ) ( not ( = ?auto_310909 ?auto_310913 ) ) ( not ( = ?auto_310909 ?auto_310914 ) ) ( not ( = ?auto_310909 ?auto_310915 ) ) ( not ( = ?auto_310909 ?auto_310916 ) ) ( not ( = ?auto_310909 ?auto_310917 ) ) ( not ( = ?auto_310909 ?auto_310918 ) ) ( not ( = ?auto_310910 ?auto_310911 ) ) ( not ( = ?auto_310910 ?auto_310912 ) ) ( not ( = ?auto_310910 ?auto_310913 ) ) ( not ( = ?auto_310910 ?auto_310914 ) ) ( not ( = ?auto_310910 ?auto_310915 ) ) ( not ( = ?auto_310910 ?auto_310916 ) ) ( not ( = ?auto_310910 ?auto_310917 ) ) ( not ( = ?auto_310910 ?auto_310918 ) ) ( not ( = ?auto_310911 ?auto_310912 ) ) ( not ( = ?auto_310911 ?auto_310913 ) ) ( not ( = ?auto_310911 ?auto_310914 ) ) ( not ( = ?auto_310911 ?auto_310915 ) ) ( not ( = ?auto_310911 ?auto_310916 ) ) ( not ( = ?auto_310911 ?auto_310917 ) ) ( not ( = ?auto_310911 ?auto_310918 ) ) ( not ( = ?auto_310912 ?auto_310913 ) ) ( not ( = ?auto_310912 ?auto_310914 ) ) ( not ( = ?auto_310912 ?auto_310915 ) ) ( not ( = ?auto_310912 ?auto_310916 ) ) ( not ( = ?auto_310912 ?auto_310917 ) ) ( not ( = ?auto_310912 ?auto_310918 ) ) ( not ( = ?auto_310913 ?auto_310914 ) ) ( not ( = ?auto_310913 ?auto_310915 ) ) ( not ( = ?auto_310913 ?auto_310916 ) ) ( not ( = ?auto_310913 ?auto_310917 ) ) ( not ( = ?auto_310913 ?auto_310918 ) ) ( not ( = ?auto_310914 ?auto_310915 ) ) ( not ( = ?auto_310914 ?auto_310916 ) ) ( not ( = ?auto_310914 ?auto_310917 ) ) ( not ( = ?auto_310914 ?auto_310918 ) ) ( not ( = ?auto_310915 ?auto_310916 ) ) ( not ( = ?auto_310915 ?auto_310917 ) ) ( not ( = ?auto_310915 ?auto_310918 ) ) ( not ( = ?auto_310916 ?auto_310917 ) ) ( not ( = ?auto_310916 ?auto_310918 ) ) ( not ( = ?auto_310917 ?auto_310918 ) ) ( CLEAR ?auto_310915 ) ( ON ?auto_310916 ?auto_310917 ) ( CLEAR ?auto_310916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_310907 ?auto_310908 ?auto_310909 ?auto_310910 ?auto_310911 ?auto_310912 ?auto_310913 ?auto_310914 ?auto_310915 ?auto_310916 )
      ( MAKE-11PILE ?auto_310907 ?auto_310908 ?auto_310909 ?auto_310910 ?auto_310911 ?auto_310912 ?auto_310913 ?auto_310914 ?auto_310915 ?auto_310916 ?auto_310917 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_310953 - BLOCK
      ?auto_310954 - BLOCK
      ?auto_310955 - BLOCK
      ?auto_310956 - BLOCK
      ?auto_310957 - BLOCK
      ?auto_310958 - BLOCK
      ?auto_310959 - BLOCK
      ?auto_310960 - BLOCK
      ?auto_310961 - BLOCK
      ?auto_310962 - BLOCK
      ?auto_310963 - BLOCK
    )
    :vars
    (
      ?auto_310964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_310963 ?auto_310964 ) ( ON-TABLE ?auto_310953 ) ( ON ?auto_310954 ?auto_310953 ) ( ON ?auto_310955 ?auto_310954 ) ( ON ?auto_310956 ?auto_310955 ) ( ON ?auto_310957 ?auto_310956 ) ( ON ?auto_310958 ?auto_310957 ) ( ON ?auto_310959 ?auto_310958 ) ( ON ?auto_310960 ?auto_310959 ) ( not ( = ?auto_310953 ?auto_310954 ) ) ( not ( = ?auto_310953 ?auto_310955 ) ) ( not ( = ?auto_310953 ?auto_310956 ) ) ( not ( = ?auto_310953 ?auto_310957 ) ) ( not ( = ?auto_310953 ?auto_310958 ) ) ( not ( = ?auto_310953 ?auto_310959 ) ) ( not ( = ?auto_310953 ?auto_310960 ) ) ( not ( = ?auto_310953 ?auto_310961 ) ) ( not ( = ?auto_310953 ?auto_310962 ) ) ( not ( = ?auto_310953 ?auto_310963 ) ) ( not ( = ?auto_310953 ?auto_310964 ) ) ( not ( = ?auto_310954 ?auto_310955 ) ) ( not ( = ?auto_310954 ?auto_310956 ) ) ( not ( = ?auto_310954 ?auto_310957 ) ) ( not ( = ?auto_310954 ?auto_310958 ) ) ( not ( = ?auto_310954 ?auto_310959 ) ) ( not ( = ?auto_310954 ?auto_310960 ) ) ( not ( = ?auto_310954 ?auto_310961 ) ) ( not ( = ?auto_310954 ?auto_310962 ) ) ( not ( = ?auto_310954 ?auto_310963 ) ) ( not ( = ?auto_310954 ?auto_310964 ) ) ( not ( = ?auto_310955 ?auto_310956 ) ) ( not ( = ?auto_310955 ?auto_310957 ) ) ( not ( = ?auto_310955 ?auto_310958 ) ) ( not ( = ?auto_310955 ?auto_310959 ) ) ( not ( = ?auto_310955 ?auto_310960 ) ) ( not ( = ?auto_310955 ?auto_310961 ) ) ( not ( = ?auto_310955 ?auto_310962 ) ) ( not ( = ?auto_310955 ?auto_310963 ) ) ( not ( = ?auto_310955 ?auto_310964 ) ) ( not ( = ?auto_310956 ?auto_310957 ) ) ( not ( = ?auto_310956 ?auto_310958 ) ) ( not ( = ?auto_310956 ?auto_310959 ) ) ( not ( = ?auto_310956 ?auto_310960 ) ) ( not ( = ?auto_310956 ?auto_310961 ) ) ( not ( = ?auto_310956 ?auto_310962 ) ) ( not ( = ?auto_310956 ?auto_310963 ) ) ( not ( = ?auto_310956 ?auto_310964 ) ) ( not ( = ?auto_310957 ?auto_310958 ) ) ( not ( = ?auto_310957 ?auto_310959 ) ) ( not ( = ?auto_310957 ?auto_310960 ) ) ( not ( = ?auto_310957 ?auto_310961 ) ) ( not ( = ?auto_310957 ?auto_310962 ) ) ( not ( = ?auto_310957 ?auto_310963 ) ) ( not ( = ?auto_310957 ?auto_310964 ) ) ( not ( = ?auto_310958 ?auto_310959 ) ) ( not ( = ?auto_310958 ?auto_310960 ) ) ( not ( = ?auto_310958 ?auto_310961 ) ) ( not ( = ?auto_310958 ?auto_310962 ) ) ( not ( = ?auto_310958 ?auto_310963 ) ) ( not ( = ?auto_310958 ?auto_310964 ) ) ( not ( = ?auto_310959 ?auto_310960 ) ) ( not ( = ?auto_310959 ?auto_310961 ) ) ( not ( = ?auto_310959 ?auto_310962 ) ) ( not ( = ?auto_310959 ?auto_310963 ) ) ( not ( = ?auto_310959 ?auto_310964 ) ) ( not ( = ?auto_310960 ?auto_310961 ) ) ( not ( = ?auto_310960 ?auto_310962 ) ) ( not ( = ?auto_310960 ?auto_310963 ) ) ( not ( = ?auto_310960 ?auto_310964 ) ) ( not ( = ?auto_310961 ?auto_310962 ) ) ( not ( = ?auto_310961 ?auto_310963 ) ) ( not ( = ?auto_310961 ?auto_310964 ) ) ( not ( = ?auto_310962 ?auto_310963 ) ) ( not ( = ?auto_310962 ?auto_310964 ) ) ( not ( = ?auto_310963 ?auto_310964 ) ) ( ON ?auto_310962 ?auto_310963 ) ( CLEAR ?auto_310960 ) ( ON ?auto_310961 ?auto_310962 ) ( CLEAR ?auto_310961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_310953 ?auto_310954 ?auto_310955 ?auto_310956 ?auto_310957 ?auto_310958 ?auto_310959 ?auto_310960 ?auto_310961 )
      ( MAKE-11PILE ?auto_310953 ?auto_310954 ?auto_310955 ?auto_310956 ?auto_310957 ?auto_310958 ?auto_310959 ?auto_310960 ?auto_310961 ?auto_310962 ?auto_310963 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_310999 - BLOCK
      ?auto_311000 - BLOCK
      ?auto_311001 - BLOCK
      ?auto_311002 - BLOCK
      ?auto_311003 - BLOCK
      ?auto_311004 - BLOCK
      ?auto_311005 - BLOCK
      ?auto_311006 - BLOCK
      ?auto_311007 - BLOCK
      ?auto_311008 - BLOCK
      ?auto_311009 - BLOCK
    )
    :vars
    (
      ?auto_311010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311009 ?auto_311010 ) ( ON-TABLE ?auto_310999 ) ( ON ?auto_311000 ?auto_310999 ) ( ON ?auto_311001 ?auto_311000 ) ( ON ?auto_311002 ?auto_311001 ) ( ON ?auto_311003 ?auto_311002 ) ( ON ?auto_311004 ?auto_311003 ) ( ON ?auto_311005 ?auto_311004 ) ( not ( = ?auto_310999 ?auto_311000 ) ) ( not ( = ?auto_310999 ?auto_311001 ) ) ( not ( = ?auto_310999 ?auto_311002 ) ) ( not ( = ?auto_310999 ?auto_311003 ) ) ( not ( = ?auto_310999 ?auto_311004 ) ) ( not ( = ?auto_310999 ?auto_311005 ) ) ( not ( = ?auto_310999 ?auto_311006 ) ) ( not ( = ?auto_310999 ?auto_311007 ) ) ( not ( = ?auto_310999 ?auto_311008 ) ) ( not ( = ?auto_310999 ?auto_311009 ) ) ( not ( = ?auto_310999 ?auto_311010 ) ) ( not ( = ?auto_311000 ?auto_311001 ) ) ( not ( = ?auto_311000 ?auto_311002 ) ) ( not ( = ?auto_311000 ?auto_311003 ) ) ( not ( = ?auto_311000 ?auto_311004 ) ) ( not ( = ?auto_311000 ?auto_311005 ) ) ( not ( = ?auto_311000 ?auto_311006 ) ) ( not ( = ?auto_311000 ?auto_311007 ) ) ( not ( = ?auto_311000 ?auto_311008 ) ) ( not ( = ?auto_311000 ?auto_311009 ) ) ( not ( = ?auto_311000 ?auto_311010 ) ) ( not ( = ?auto_311001 ?auto_311002 ) ) ( not ( = ?auto_311001 ?auto_311003 ) ) ( not ( = ?auto_311001 ?auto_311004 ) ) ( not ( = ?auto_311001 ?auto_311005 ) ) ( not ( = ?auto_311001 ?auto_311006 ) ) ( not ( = ?auto_311001 ?auto_311007 ) ) ( not ( = ?auto_311001 ?auto_311008 ) ) ( not ( = ?auto_311001 ?auto_311009 ) ) ( not ( = ?auto_311001 ?auto_311010 ) ) ( not ( = ?auto_311002 ?auto_311003 ) ) ( not ( = ?auto_311002 ?auto_311004 ) ) ( not ( = ?auto_311002 ?auto_311005 ) ) ( not ( = ?auto_311002 ?auto_311006 ) ) ( not ( = ?auto_311002 ?auto_311007 ) ) ( not ( = ?auto_311002 ?auto_311008 ) ) ( not ( = ?auto_311002 ?auto_311009 ) ) ( not ( = ?auto_311002 ?auto_311010 ) ) ( not ( = ?auto_311003 ?auto_311004 ) ) ( not ( = ?auto_311003 ?auto_311005 ) ) ( not ( = ?auto_311003 ?auto_311006 ) ) ( not ( = ?auto_311003 ?auto_311007 ) ) ( not ( = ?auto_311003 ?auto_311008 ) ) ( not ( = ?auto_311003 ?auto_311009 ) ) ( not ( = ?auto_311003 ?auto_311010 ) ) ( not ( = ?auto_311004 ?auto_311005 ) ) ( not ( = ?auto_311004 ?auto_311006 ) ) ( not ( = ?auto_311004 ?auto_311007 ) ) ( not ( = ?auto_311004 ?auto_311008 ) ) ( not ( = ?auto_311004 ?auto_311009 ) ) ( not ( = ?auto_311004 ?auto_311010 ) ) ( not ( = ?auto_311005 ?auto_311006 ) ) ( not ( = ?auto_311005 ?auto_311007 ) ) ( not ( = ?auto_311005 ?auto_311008 ) ) ( not ( = ?auto_311005 ?auto_311009 ) ) ( not ( = ?auto_311005 ?auto_311010 ) ) ( not ( = ?auto_311006 ?auto_311007 ) ) ( not ( = ?auto_311006 ?auto_311008 ) ) ( not ( = ?auto_311006 ?auto_311009 ) ) ( not ( = ?auto_311006 ?auto_311010 ) ) ( not ( = ?auto_311007 ?auto_311008 ) ) ( not ( = ?auto_311007 ?auto_311009 ) ) ( not ( = ?auto_311007 ?auto_311010 ) ) ( not ( = ?auto_311008 ?auto_311009 ) ) ( not ( = ?auto_311008 ?auto_311010 ) ) ( not ( = ?auto_311009 ?auto_311010 ) ) ( ON ?auto_311008 ?auto_311009 ) ( ON ?auto_311007 ?auto_311008 ) ( CLEAR ?auto_311005 ) ( ON ?auto_311006 ?auto_311007 ) ( CLEAR ?auto_311006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_310999 ?auto_311000 ?auto_311001 ?auto_311002 ?auto_311003 ?auto_311004 ?auto_311005 ?auto_311006 )
      ( MAKE-11PILE ?auto_310999 ?auto_311000 ?auto_311001 ?auto_311002 ?auto_311003 ?auto_311004 ?auto_311005 ?auto_311006 ?auto_311007 ?auto_311008 ?auto_311009 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311045 - BLOCK
      ?auto_311046 - BLOCK
      ?auto_311047 - BLOCK
      ?auto_311048 - BLOCK
      ?auto_311049 - BLOCK
      ?auto_311050 - BLOCK
      ?auto_311051 - BLOCK
      ?auto_311052 - BLOCK
      ?auto_311053 - BLOCK
      ?auto_311054 - BLOCK
      ?auto_311055 - BLOCK
    )
    :vars
    (
      ?auto_311056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311055 ?auto_311056 ) ( ON-TABLE ?auto_311045 ) ( ON ?auto_311046 ?auto_311045 ) ( ON ?auto_311047 ?auto_311046 ) ( ON ?auto_311048 ?auto_311047 ) ( ON ?auto_311049 ?auto_311048 ) ( ON ?auto_311050 ?auto_311049 ) ( not ( = ?auto_311045 ?auto_311046 ) ) ( not ( = ?auto_311045 ?auto_311047 ) ) ( not ( = ?auto_311045 ?auto_311048 ) ) ( not ( = ?auto_311045 ?auto_311049 ) ) ( not ( = ?auto_311045 ?auto_311050 ) ) ( not ( = ?auto_311045 ?auto_311051 ) ) ( not ( = ?auto_311045 ?auto_311052 ) ) ( not ( = ?auto_311045 ?auto_311053 ) ) ( not ( = ?auto_311045 ?auto_311054 ) ) ( not ( = ?auto_311045 ?auto_311055 ) ) ( not ( = ?auto_311045 ?auto_311056 ) ) ( not ( = ?auto_311046 ?auto_311047 ) ) ( not ( = ?auto_311046 ?auto_311048 ) ) ( not ( = ?auto_311046 ?auto_311049 ) ) ( not ( = ?auto_311046 ?auto_311050 ) ) ( not ( = ?auto_311046 ?auto_311051 ) ) ( not ( = ?auto_311046 ?auto_311052 ) ) ( not ( = ?auto_311046 ?auto_311053 ) ) ( not ( = ?auto_311046 ?auto_311054 ) ) ( not ( = ?auto_311046 ?auto_311055 ) ) ( not ( = ?auto_311046 ?auto_311056 ) ) ( not ( = ?auto_311047 ?auto_311048 ) ) ( not ( = ?auto_311047 ?auto_311049 ) ) ( not ( = ?auto_311047 ?auto_311050 ) ) ( not ( = ?auto_311047 ?auto_311051 ) ) ( not ( = ?auto_311047 ?auto_311052 ) ) ( not ( = ?auto_311047 ?auto_311053 ) ) ( not ( = ?auto_311047 ?auto_311054 ) ) ( not ( = ?auto_311047 ?auto_311055 ) ) ( not ( = ?auto_311047 ?auto_311056 ) ) ( not ( = ?auto_311048 ?auto_311049 ) ) ( not ( = ?auto_311048 ?auto_311050 ) ) ( not ( = ?auto_311048 ?auto_311051 ) ) ( not ( = ?auto_311048 ?auto_311052 ) ) ( not ( = ?auto_311048 ?auto_311053 ) ) ( not ( = ?auto_311048 ?auto_311054 ) ) ( not ( = ?auto_311048 ?auto_311055 ) ) ( not ( = ?auto_311048 ?auto_311056 ) ) ( not ( = ?auto_311049 ?auto_311050 ) ) ( not ( = ?auto_311049 ?auto_311051 ) ) ( not ( = ?auto_311049 ?auto_311052 ) ) ( not ( = ?auto_311049 ?auto_311053 ) ) ( not ( = ?auto_311049 ?auto_311054 ) ) ( not ( = ?auto_311049 ?auto_311055 ) ) ( not ( = ?auto_311049 ?auto_311056 ) ) ( not ( = ?auto_311050 ?auto_311051 ) ) ( not ( = ?auto_311050 ?auto_311052 ) ) ( not ( = ?auto_311050 ?auto_311053 ) ) ( not ( = ?auto_311050 ?auto_311054 ) ) ( not ( = ?auto_311050 ?auto_311055 ) ) ( not ( = ?auto_311050 ?auto_311056 ) ) ( not ( = ?auto_311051 ?auto_311052 ) ) ( not ( = ?auto_311051 ?auto_311053 ) ) ( not ( = ?auto_311051 ?auto_311054 ) ) ( not ( = ?auto_311051 ?auto_311055 ) ) ( not ( = ?auto_311051 ?auto_311056 ) ) ( not ( = ?auto_311052 ?auto_311053 ) ) ( not ( = ?auto_311052 ?auto_311054 ) ) ( not ( = ?auto_311052 ?auto_311055 ) ) ( not ( = ?auto_311052 ?auto_311056 ) ) ( not ( = ?auto_311053 ?auto_311054 ) ) ( not ( = ?auto_311053 ?auto_311055 ) ) ( not ( = ?auto_311053 ?auto_311056 ) ) ( not ( = ?auto_311054 ?auto_311055 ) ) ( not ( = ?auto_311054 ?auto_311056 ) ) ( not ( = ?auto_311055 ?auto_311056 ) ) ( ON ?auto_311054 ?auto_311055 ) ( ON ?auto_311053 ?auto_311054 ) ( ON ?auto_311052 ?auto_311053 ) ( CLEAR ?auto_311050 ) ( ON ?auto_311051 ?auto_311052 ) ( CLEAR ?auto_311051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_311045 ?auto_311046 ?auto_311047 ?auto_311048 ?auto_311049 ?auto_311050 ?auto_311051 )
      ( MAKE-11PILE ?auto_311045 ?auto_311046 ?auto_311047 ?auto_311048 ?auto_311049 ?auto_311050 ?auto_311051 ?auto_311052 ?auto_311053 ?auto_311054 ?auto_311055 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311091 - BLOCK
      ?auto_311092 - BLOCK
      ?auto_311093 - BLOCK
      ?auto_311094 - BLOCK
      ?auto_311095 - BLOCK
      ?auto_311096 - BLOCK
      ?auto_311097 - BLOCK
      ?auto_311098 - BLOCK
      ?auto_311099 - BLOCK
      ?auto_311100 - BLOCK
      ?auto_311101 - BLOCK
    )
    :vars
    (
      ?auto_311102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311101 ?auto_311102 ) ( ON-TABLE ?auto_311091 ) ( ON ?auto_311092 ?auto_311091 ) ( ON ?auto_311093 ?auto_311092 ) ( ON ?auto_311094 ?auto_311093 ) ( ON ?auto_311095 ?auto_311094 ) ( not ( = ?auto_311091 ?auto_311092 ) ) ( not ( = ?auto_311091 ?auto_311093 ) ) ( not ( = ?auto_311091 ?auto_311094 ) ) ( not ( = ?auto_311091 ?auto_311095 ) ) ( not ( = ?auto_311091 ?auto_311096 ) ) ( not ( = ?auto_311091 ?auto_311097 ) ) ( not ( = ?auto_311091 ?auto_311098 ) ) ( not ( = ?auto_311091 ?auto_311099 ) ) ( not ( = ?auto_311091 ?auto_311100 ) ) ( not ( = ?auto_311091 ?auto_311101 ) ) ( not ( = ?auto_311091 ?auto_311102 ) ) ( not ( = ?auto_311092 ?auto_311093 ) ) ( not ( = ?auto_311092 ?auto_311094 ) ) ( not ( = ?auto_311092 ?auto_311095 ) ) ( not ( = ?auto_311092 ?auto_311096 ) ) ( not ( = ?auto_311092 ?auto_311097 ) ) ( not ( = ?auto_311092 ?auto_311098 ) ) ( not ( = ?auto_311092 ?auto_311099 ) ) ( not ( = ?auto_311092 ?auto_311100 ) ) ( not ( = ?auto_311092 ?auto_311101 ) ) ( not ( = ?auto_311092 ?auto_311102 ) ) ( not ( = ?auto_311093 ?auto_311094 ) ) ( not ( = ?auto_311093 ?auto_311095 ) ) ( not ( = ?auto_311093 ?auto_311096 ) ) ( not ( = ?auto_311093 ?auto_311097 ) ) ( not ( = ?auto_311093 ?auto_311098 ) ) ( not ( = ?auto_311093 ?auto_311099 ) ) ( not ( = ?auto_311093 ?auto_311100 ) ) ( not ( = ?auto_311093 ?auto_311101 ) ) ( not ( = ?auto_311093 ?auto_311102 ) ) ( not ( = ?auto_311094 ?auto_311095 ) ) ( not ( = ?auto_311094 ?auto_311096 ) ) ( not ( = ?auto_311094 ?auto_311097 ) ) ( not ( = ?auto_311094 ?auto_311098 ) ) ( not ( = ?auto_311094 ?auto_311099 ) ) ( not ( = ?auto_311094 ?auto_311100 ) ) ( not ( = ?auto_311094 ?auto_311101 ) ) ( not ( = ?auto_311094 ?auto_311102 ) ) ( not ( = ?auto_311095 ?auto_311096 ) ) ( not ( = ?auto_311095 ?auto_311097 ) ) ( not ( = ?auto_311095 ?auto_311098 ) ) ( not ( = ?auto_311095 ?auto_311099 ) ) ( not ( = ?auto_311095 ?auto_311100 ) ) ( not ( = ?auto_311095 ?auto_311101 ) ) ( not ( = ?auto_311095 ?auto_311102 ) ) ( not ( = ?auto_311096 ?auto_311097 ) ) ( not ( = ?auto_311096 ?auto_311098 ) ) ( not ( = ?auto_311096 ?auto_311099 ) ) ( not ( = ?auto_311096 ?auto_311100 ) ) ( not ( = ?auto_311096 ?auto_311101 ) ) ( not ( = ?auto_311096 ?auto_311102 ) ) ( not ( = ?auto_311097 ?auto_311098 ) ) ( not ( = ?auto_311097 ?auto_311099 ) ) ( not ( = ?auto_311097 ?auto_311100 ) ) ( not ( = ?auto_311097 ?auto_311101 ) ) ( not ( = ?auto_311097 ?auto_311102 ) ) ( not ( = ?auto_311098 ?auto_311099 ) ) ( not ( = ?auto_311098 ?auto_311100 ) ) ( not ( = ?auto_311098 ?auto_311101 ) ) ( not ( = ?auto_311098 ?auto_311102 ) ) ( not ( = ?auto_311099 ?auto_311100 ) ) ( not ( = ?auto_311099 ?auto_311101 ) ) ( not ( = ?auto_311099 ?auto_311102 ) ) ( not ( = ?auto_311100 ?auto_311101 ) ) ( not ( = ?auto_311100 ?auto_311102 ) ) ( not ( = ?auto_311101 ?auto_311102 ) ) ( ON ?auto_311100 ?auto_311101 ) ( ON ?auto_311099 ?auto_311100 ) ( ON ?auto_311098 ?auto_311099 ) ( ON ?auto_311097 ?auto_311098 ) ( CLEAR ?auto_311095 ) ( ON ?auto_311096 ?auto_311097 ) ( CLEAR ?auto_311096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_311091 ?auto_311092 ?auto_311093 ?auto_311094 ?auto_311095 ?auto_311096 )
      ( MAKE-11PILE ?auto_311091 ?auto_311092 ?auto_311093 ?auto_311094 ?auto_311095 ?auto_311096 ?auto_311097 ?auto_311098 ?auto_311099 ?auto_311100 ?auto_311101 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311137 - BLOCK
      ?auto_311138 - BLOCK
      ?auto_311139 - BLOCK
      ?auto_311140 - BLOCK
      ?auto_311141 - BLOCK
      ?auto_311142 - BLOCK
      ?auto_311143 - BLOCK
      ?auto_311144 - BLOCK
      ?auto_311145 - BLOCK
      ?auto_311146 - BLOCK
      ?auto_311147 - BLOCK
    )
    :vars
    (
      ?auto_311148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311147 ?auto_311148 ) ( ON-TABLE ?auto_311137 ) ( ON ?auto_311138 ?auto_311137 ) ( ON ?auto_311139 ?auto_311138 ) ( ON ?auto_311140 ?auto_311139 ) ( not ( = ?auto_311137 ?auto_311138 ) ) ( not ( = ?auto_311137 ?auto_311139 ) ) ( not ( = ?auto_311137 ?auto_311140 ) ) ( not ( = ?auto_311137 ?auto_311141 ) ) ( not ( = ?auto_311137 ?auto_311142 ) ) ( not ( = ?auto_311137 ?auto_311143 ) ) ( not ( = ?auto_311137 ?auto_311144 ) ) ( not ( = ?auto_311137 ?auto_311145 ) ) ( not ( = ?auto_311137 ?auto_311146 ) ) ( not ( = ?auto_311137 ?auto_311147 ) ) ( not ( = ?auto_311137 ?auto_311148 ) ) ( not ( = ?auto_311138 ?auto_311139 ) ) ( not ( = ?auto_311138 ?auto_311140 ) ) ( not ( = ?auto_311138 ?auto_311141 ) ) ( not ( = ?auto_311138 ?auto_311142 ) ) ( not ( = ?auto_311138 ?auto_311143 ) ) ( not ( = ?auto_311138 ?auto_311144 ) ) ( not ( = ?auto_311138 ?auto_311145 ) ) ( not ( = ?auto_311138 ?auto_311146 ) ) ( not ( = ?auto_311138 ?auto_311147 ) ) ( not ( = ?auto_311138 ?auto_311148 ) ) ( not ( = ?auto_311139 ?auto_311140 ) ) ( not ( = ?auto_311139 ?auto_311141 ) ) ( not ( = ?auto_311139 ?auto_311142 ) ) ( not ( = ?auto_311139 ?auto_311143 ) ) ( not ( = ?auto_311139 ?auto_311144 ) ) ( not ( = ?auto_311139 ?auto_311145 ) ) ( not ( = ?auto_311139 ?auto_311146 ) ) ( not ( = ?auto_311139 ?auto_311147 ) ) ( not ( = ?auto_311139 ?auto_311148 ) ) ( not ( = ?auto_311140 ?auto_311141 ) ) ( not ( = ?auto_311140 ?auto_311142 ) ) ( not ( = ?auto_311140 ?auto_311143 ) ) ( not ( = ?auto_311140 ?auto_311144 ) ) ( not ( = ?auto_311140 ?auto_311145 ) ) ( not ( = ?auto_311140 ?auto_311146 ) ) ( not ( = ?auto_311140 ?auto_311147 ) ) ( not ( = ?auto_311140 ?auto_311148 ) ) ( not ( = ?auto_311141 ?auto_311142 ) ) ( not ( = ?auto_311141 ?auto_311143 ) ) ( not ( = ?auto_311141 ?auto_311144 ) ) ( not ( = ?auto_311141 ?auto_311145 ) ) ( not ( = ?auto_311141 ?auto_311146 ) ) ( not ( = ?auto_311141 ?auto_311147 ) ) ( not ( = ?auto_311141 ?auto_311148 ) ) ( not ( = ?auto_311142 ?auto_311143 ) ) ( not ( = ?auto_311142 ?auto_311144 ) ) ( not ( = ?auto_311142 ?auto_311145 ) ) ( not ( = ?auto_311142 ?auto_311146 ) ) ( not ( = ?auto_311142 ?auto_311147 ) ) ( not ( = ?auto_311142 ?auto_311148 ) ) ( not ( = ?auto_311143 ?auto_311144 ) ) ( not ( = ?auto_311143 ?auto_311145 ) ) ( not ( = ?auto_311143 ?auto_311146 ) ) ( not ( = ?auto_311143 ?auto_311147 ) ) ( not ( = ?auto_311143 ?auto_311148 ) ) ( not ( = ?auto_311144 ?auto_311145 ) ) ( not ( = ?auto_311144 ?auto_311146 ) ) ( not ( = ?auto_311144 ?auto_311147 ) ) ( not ( = ?auto_311144 ?auto_311148 ) ) ( not ( = ?auto_311145 ?auto_311146 ) ) ( not ( = ?auto_311145 ?auto_311147 ) ) ( not ( = ?auto_311145 ?auto_311148 ) ) ( not ( = ?auto_311146 ?auto_311147 ) ) ( not ( = ?auto_311146 ?auto_311148 ) ) ( not ( = ?auto_311147 ?auto_311148 ) ) ( ON ?auto_311146 ?auto_311147 ) ( ON ?auto_311145 ?auto_311146 ) ( ON ?auto_311144 ?auto_311145 ) ( ON ?auto_311143 ?auto_311144 ) ( ON ?auto_311142 ?auto_311143 ) ( CLEAR ?auto_311140 ) ( ON ?auto_311141 ?auto_311142 ) ( CLEAR ?auto_311141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_311137 ?auto_311138 ?auto_311139 ?auto_311140 ?auto_311141 )
      ( MAKE-11PILE ?auto_311137 ?auto_311138 ?auto_311139 ?auto_311140 ?auto_311141 ?auto_311142 ?auto_311143 ?auto_311144 ?auto_311145 ?auto_311146 ?auto_311147 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311183 - BLOCK
      ?auto_311184 - BLOCK
      ?auto_311185 - BLOCK
      ?auto_311186 - BLOCK
      ?auto_311187 - BLOCK
      ?auto_311188 - BLOCK
      ?auto_311189 - BLOCK
      ?auto_311190 - BLOCK
      ?auto_311191 - BLOCK
      ?auto_311192 - BLOCK
      ?auto_311193 - BLOCK
    )
    :vars
    (
      ?auto_311194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311193 ?auto_311194 ) ( ON-TABLE ?auto_311183 ) ( ON ?auto_311184 ?auto_311183 ) ( ON ?auto_311185 ?auto_311184 ) ( not ( = ?auto_311183 ?auto_311184 ) ) ( not ( = ?auto_311183 ?auto_311185 ) ) ( not ( = ?auto_311183 ?auto_311186 ) ) ( not ( = ?auto_311183 ?auto_311187 ) ) ( not ( = ?auto_311183 ?auto_311188 ) ) ( not ( = ?auto_311183 ?auto_311189 ) ) ( not ( = ?auto_311183 ?auto_311190 ) ) ( not ( = ?auto_311183 ?auto_311191 ) ) ( not ( = ?auto_311183 ?auto_311192 ) ) ( not ( = ?auto_311183 ?auto_311193 ) ) ( not ( = ?auto_311183 ?auto_311194 ) ) ( not ( = ?auto_311184 ?auto_311185 ) ) ( not ( = ?auto_311184 ?auto_311186 ) ) ( not ( = ?auto_311184 ?auto_311187 ) ) ( not ( = ?auto_311184 ?auto_311188 ) ) ( not ( = ?auto_311184 ?auto_311189 ) ) ( not ( = ?auto_311184 ?auto_311190 ) ) ( not ( = ?auto_311184 ?auto_311191 ) ) ( not ( = ?auto_311184 ?auto_311192 ) ) ( not ( = ?auto_311184 ?auto_311193 ) ) ( not ( = ?auto_311184 ?auto_311194 ) ) ( not ( = ?auto_311185 ?auto_311186 ) ) ( not ( = ?auto_311185 ?auto_311187 ) ) ( not ( = ?auto_311185 ?auto_311188 ) ) ( not ( = ?auto_311185 ?auto_311189 ) ) ( not ( = ?auto_311185 ?auto_311190 ) ) ( not ( = ?auto_311185 ?auto_311191 ) ) ( not ( = ?auto_311185 ?auto_311192 ) ) ( not ( = ?auto_311185 ?auto_311193 ) ) ( not ( = ?auto_311185 ?auto_311194 ) ) ( not ( = ?auto_311186 ?auto_311187 ) ) ( not ( = ?auto_311186 ?auto_311188 ) ) ( not ( = ?auto_311186 ?auto_311189 ) ) ( not ( = ?auto_311186 ?auto_311190 ) ) ( not ( = ?auto_311186 ?auto_311191 ) ) ( not ( = ?auto_311186 ?auto_311192 ) ) ( not ( = ?auto_311186 ?auto_311193 ) ) ( not ( = ?auto_311186 ?auto_311194 ) ) ( not ( = ?auto_311187 ?auto_311188 ) ) ( not ( = ?auto_311187 ?auto_311189 ) ) ( not ( = ?auto_311187 ?auto_311190 ) ) ( not ( = ?auto_311187 ?auto_311191 ) ) ( not ( = ?auto_311187 ?auto_311192 ) ) ( not ( = ?auto_311187 ?auto_311193 ) ) ( not ( = ?auto_311187 ?auto_311194 ) ) ( not ( = ?auto_311188 ?auto_311189 ) ) ( not ( = ?auto_311188 ?auto_311190 ) ) ( not ( = ?auto_311188 ?auto_311191 ) ) ( not ( = ?auto_311188 ?auto_311192 ) ) ( not ( = ?auto_311188 ?auto_311193 ) ) ( not ( = ?auto_311188 ?auto_311194 ) ) ( not ( = ?auto_311189 ?auto_311190 ) ) ( not ( = ?auto_311189 ?auto_311191 ) ) ( not ( = ?auto_311189 ?auto_311192 ) ) ( not ( = ?auto_311189 ?auto_311193 ) ) ( not ( = ?auto_311189 ?auto_311194 ) ) ( not ( = ?auto_311190 ?auto_311191 ) ) ( not ( = ?auto_311190 ?auto_311192 ) ) ( not ( = ?auto_311190 ?auto_311193 ) ) ( not ( = ?auto_311190 ?auto_311194 ) ) ( not ( = ?auto_311191 ?auto_311192 ) ) ( not ( = ?auto_311191 ?auto_311193 ) ) ( not ( = ?auto_311191 ?auto_311194 ) ) ( not ( = ?auto_311192 ?auto_311193 ) ) ( not ( = ?auto_311192 ?auto_311194 ) ) ( not ( = ?auto_311193 ?auto_311194 ) ) ( ON ?auto_311192 ?auto_311193 ) ( ON ?auto_311191 ?auto_311192 ) ( ON ?auto_311190 ?auto_311191 ) ( ON ?auto_311189 ?auto_311190 ) ( ON ?auto_311188 ?auto_311189 ) ( ON ?auto_311187 ?auto_311188 ) ( CLEAR ?auto_311185 ) ( ON ?auto_311186 ?auto_311187 ) ( CLEAR ?auto_311186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_311183 ?auto_311184 ?auto_311185 ?auto_311186 )
      ( MAKE-11PILE ?auto_311183 ?auto_311184 ?auto_311185 ?auto_311186 ?auto_311187 ?auto_311188 ?auto_311189 ?auto_311190 ?auto_311191 ?auto_311192 ?auto_311193 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311229 - BLOCK
      ?auto_311230 - BLOCK
      ?auto_311231 - BLOCK
      ?auto_311232 - BLOCK
      ?auto_311233 - BLOCK
      ?auto_311234 - BLOCK
      ?auto_311235 - BLOCK
      ?auto_311236 - BLOCK
      ?auto_311237 - BLOCK
      ?auto_311238 - BLOCK
      ?auto_311239 - BLOCK
    )
    :vars
    (
      ?auto_311240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311239 ?auto_311240 ) ( ON-TABLE ?auto_311229 ) ( ON ?auto_311230 ?auto_311229 ) ( not ( = ?auto_311229 ?auto_311230 ) ) ( not ( = ?auto_311229 ?auto_311231 ) ) ( not ( = ?auto_311229 ?auto_311232 ) ) ( not ( = ?auto_311229 ?auto_311233 ) ) ( not ( = ?auto_311229 ?auto_311234 ) ) ( not ( = ?auto_311229 ?auto_311235 ) ) ( not ( = ?auto_311229 ?auto_311236 ) ) ( not ( = ?auto_311229 ?auto_311237 ) ) ( not ( = ?auto_311229 ?auto_311238 ) ) ( not ( = ?auto_311229 ?auto_311239 ) ) ( not ( = ?auto_311229 ?auto_311240 ) ) ( not ( = ?auto_311230 ?auto_311231 ) ) ( not ( = ?auto_311230 ?auto_311232 ) ) ( not ( = ?auto_311230 ?auto_311233 ) ) ( not ( = ?auto_311230 ?auto_311234 ) ) ( not ( = ?auto_311230 ?auto_311235 ) ) ( not ( = ?auto_311230 ?auto_311236 ) ) ( not ( = ?auto_311230 ?auto_311237 ) ) ( not ( = ?auto_311230 ?auto_311238 ) ) ( not ( = ?auto_311230 ?auto_311239 ) ) ( not ( = ?auto_311230 ?auto_311240 ) ) ( not ( = ?auto_311231 ?auto_311232 ) ) ( not ( = ?auto_311231 ?auto_311233 ) ) ( not ( = ?auto_311231 ?auto_311234 ) ) ( not ( = ?auto_311231 ?auto_311235 ) ) ( not ( = ?auto_311231 ?auto_311236 ) ) ( not ( = ?auto_311231 ?auto_311237 ) ) ( not ( = ?auto_311231 ?auto_311238 ) ) ( not ( = ?auto_311231 ?auto_311239 ) ) ( not ( = ?auto_311231 ?auto_311240 ) ) ( not ( = ?auto_311232 ?auto_311233 ) ) ( not ( = ?auto_311232 ?auto_311234 ) ) ( not ( = ?auto_311232 ?auto_311235 ) ) ( not ( = ?auto_311232 ?auto_311236 ) ) ( not ( = ?auto_311232 ?auto_311237 ) ) ( not ( = ?auto_311232 ?auto_311238 ) ) ( not ( = ?auto_311232 ?auto_311239 ) ) ( not ( = ?auto_311232 ?auto_311240 ) ) ( not ( = ?auto_311233 ?auto_311234 ) ) ( not ( = ?auto_311233 ?auto_311235 ) ) ( not ( = ?auto_311233 ?auto_311236 ) ) ( not ( = ?auto_311233 ?auto_311237 ) ) ( not ( = ?auto_311233 ?auto_311238 ) ) ( not ( = ?auto_311233 ?auto_311239 ) ) ( not ( = ?auto_311233 ?auto_311240 ) ) ( not ( = ?auto_311234 ?auto_311235 ) ) ( not ( = ?auto_311234 ?auto_311236 ) ) ( not ( = ?auto_311234 ?auto_311237 ) ) ( not ( = ?auto_311234 ?auto_311238 ) ) ( not ( = ?auto_311234 ?auto_311239 ) ) ( not ( = ?auto_311234 ?auto_311240 ) ) ( not ( = ?auto_311235 ?auto_311236 ) ) ( not ( = ?auto_311235 ?auto_311237 ) ) ( not ( = ?auto_311235 ?auto_311238 ) ) ( not ( = ?auto_311235 ?auto_311239 ) ) ( not ( = ?auto_311235 ?auto_311240 ) ) ( not ( = ?auto_311236 ?auto_311237 ) ) ( not ( = ?auto_311236 ?auto_311238 ) ) ( not ( = ?auto_311236 ?auto_311239 ) ) ( not ( = ?auto_311236 ?auto_311240 ) ) ( not ( = ?auto_311237 ?auto_311238 ) ) ( not ( = ?auto_311237 ?auto_311239 ) ) ( not ( = ?auto_311237 ?auto_311240 ) ) ( not ( = ?auto_311238 ?auto_311239 ) ) ( not ( = ?auto_311238 ?auto_311240 ) ) ( not ( = ?auto_311239 ?auto_311240 ) ) ( ON ?auto_311238 ?auto_311239 ) ( ON ?auto_311237 ?auto_311238 ) ( ON ?auto_311236 ?auto_311237 ) ( ON ?auto_311235 ?auto_311236 ) ( ON ?auto_311234 ?auto_311235 ) ( ON ?auto_311233 ?auto_311234 ) ( ON ?auto_311232 ?auto_311233 ) ( CLEAR ?auto_311230 ) ( ON ?auto_311231 ?auto_311232 ) ( CLEAR ?auto_311231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_311229 ?auto_311230 ?auto_311231 )
      ( MAKE-11PILE ?auto_311229 ?auto_311230 ?auto_311231 ?auto_311232 ?auto_311233 ?auto_311234 ?auto_311235 ?auto_311236 ?auto_311237 ?auto_311238 ?auto_311239 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311275 - BLOCK
      ?auto_311276 - BLOCK
      ?auto_311277 - BLOCK
      ?auto_311278 - BLOCK
      ?auto_311279 - BLOCK
      ?auto_311280 - BLOCK
      ?auto_311281 - BLOCK
      ?auto_311282 - BLOCK
      ?auto_311283 - BLOCK
      ?auto_311284 - BLOCK
      ?auto_311285 - BLOCK
    )
    :vars
    (
      ?auto_311286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311285 ?auto_311286 ) ( ON-TABLE ?auto_311275 ) ( not ( = ?auto_311275 ?auto_311276 ) ) ( not ( = ?auto_311275 ?auto_311277 ) ) ( not ( = ?auto_311275 ?auto_311278 ) ) ( not ( = ?auto_311275 ?auto_311279 ) ) ( not ( = ?auto_311275 ?auto_311280 ) ) ( not ( = ?auto_311275 ?auto_311281 ) ) ( not ( = ?auto_311275 ?auto_311282 ) ) ( not ( = ?auto_311275 ?auto_311283 ) ) ( not ( = ?auto_311275 ?auto_311284 ) ) ( not ( = ?auto_311275 ?auto_311285 ) ) ( not ( = ?auto_311275 ?auto_311286 ) ) ( not ( = ?auto_311276 ?auto_311277 ) ) ( not ( = ?auto_311276 ?auto_311278 ) ) ( not ( = ?auto_311276 ?auto_311279 ) ) ( not ( = ?auto_311276 ?auto_311280 ) ) ( not ( = ?auto_311276 ?auto_311281 ) ) ( not ( = ?auto_311276 ?auto_311282 ) ) ( not ( = ?auto_311276 ?auto_311283 ) ) ( not ( = ?auto_311276 ?auto_311284 ) ) ( not ( = ?auto_311276 ?auto_311285 ) ) ( not ( = ?auto_311276 ?auto_311286 ) ) ( not ( = ?auto_311277 ?auto_311278 ) ) ( not ( = ?auto_311277 ?auto_311279 ) ) ( not ( = ?auto_311277 ?auto_311280 ) ) ( not ( = ?auto_311277 ?auto_311281 ) ) ( not ( = ?auto_311277 ?auto_311282 ) ) ( not ( = ?auto_311277 ?auto_311283 ) ) ( not ( = ?auto_311277 ?auto_311284 ) ) ( not ( = ?auto_311277 ?auto_311285 ) ) ( not ( = ?auto_311277 ?auto_311286 ) ) ( not ( = ?auto_311278 ?auto_311279 ) ) ( not ( = ?auto_311278 ?auto_311280 ) ) ( not ( = ?auto_311278 ?auto_311281 ) ) ( not ( = ?auto_311278 ?auto_311282 ) ) ( not ( = ?auto_311278 ?auto_311283 ) ) ( not ( = ?auto_311278 ?auto_311284 ) ) ( not ( = ?auto_311278 ?auto_311285 ) ) ( not ( = ?auto_311278 ?auto_311286 ) ) ( not ( = ?auto_311279 ?auto_311280 ) ) ( not ( = ?auto_311279 ?auto_311281 ) ) ( not ( = ?auto_311279 ?auto_311282 ) ) ( not ( = ?auto_311279 ?auto_311283 ) ) ( not ( = ?auto_311279 ?auto_311284 ) ) ( not ( = ?auto_311279 ?auto_311285 ) ) ( not ( = ?auto_311279 ?auto_311286 ) ) ( not ( = ?auto_311280 ?auto_311281 ) ) ( not ( = ?auto_311280 ?auto_311282 ) ) ( not ( = ?auto_311280 ?auto_311283 ) ) ( not ( = ?auto_311280 ?auto_311284 ) ) ( not ( = ?auto_311280 ?auto_311285 ) ) ( not ( = ?auto_311280 ?auto_311286 ) ) ( not ( = ?auto_311281 ?auto_311282 ) ) ( not ( = ?auto_311281 ?auto_311283 ) ) ( not ( = ?auto_311281 ?auto_311284 ) ) ( not ( = ?auto_311281 ?auto_311285 ) ) ( not ( = ?auto_311281 ?auto_311286 ) ) ( not ( = ?auto_311282 ?auto_311283 ) ) ( not ( = ?auto_311282 ?auto_311284 ) ) ( not ( = ?auto_311282 ?auto_311285 ) ) ( not ( = ?auto_311282 ?auto_311286 ) ) ( not ( = ?auto_311283 ?auto_311284 ) ) ( not ( = ?auto_311283 ?auto_311285 ) ) ( not ( = ?auto_311283 ?auto_311286 ) ) ( not ( = ?auto_311284 ?auto_311285 ) ) ( not ( = ?auto_311284 ?auto_311286 ) ) ( not ( = ?auto_311285 ?auto_311286 ) ) ( ON ?auto_311284 ?auto_311285 ) ( ON ?auto_311283 ?auto_311284 ) ( ON ?auto_311282 ?auto_311283 ) ( ON ?auto_311281 ?auto_311282 ) ( ON ?auto_311280 ?auto_311281 ) ( ON ?auto_311279 ?auto_311280 ) ( ON ?auto_311278 ?auto_311279 ) ( ON ?auto_311277 ?auto_311278 ) ( CLEAR ?auto_311275 ) ( ON ?auto_311276 ?auto_311277 ) ( CLEAR ?auto_311276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_311275 ?auto_311276 )
      ( MAKE-11PILE ?auto_311275 ?auto_311276 ?auto_311277 ?auto_311278 ?auto_311279 ?auto_311280 ?auto_311281 ?auto_311282 ?auto_311283 ?auto_311284 ?auto_311285 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_311321 - BLOCK
      ?auto_311322 - BLOCK
      ?auto_311323 - BLOCK
      ?auto_311324 - BLOCK
      ?auto_311325 - BLOCK
      ?auto_311326 - BLOCK
      ?auto_311327 - BLOCK
      ?auto_311328 - BLOCK
      ?auto_311329 - BLOCK
      ?auto_311330 - BLOCK
      ?auto_311331 - BLOCK
    )
    :vars
    (
      ?auto_311332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311331 ?auto_311332 ) ( not ( = ?auto_311321 ?auto_311322 ) ) ( not ( = ?auto_311321 ?auto_311323 ) ) ( not ( = ?auto_311321 ?auto_311324 ) ) ( not ( = ?auto_311321 ?auto_311325 ) ) ( not ( = ?auto_311321 ?auto_311326 ) ) ( not ( = ?auto_311321 ?auto_311327 ) ) ( not ( = ?auto_311321 ?auto_311328 ) ) ( not ( = ?auto_311321 ?auto_311329 ) ) ( not ( = ?auto_311321 ?auto_311330 ) ) ( not ( = ?auto_311321 ?auto_311331 ) ) ( not ( = ?auto_311321 ?auto_311332 ) ) ( not ( = ?auto_311322 ?auto_311323 ) ) ( not ( = ?auto_311322 ?auto_311324 ) ) ( not ( = ?auto_311322 ?auto_311325 ) ) ( not ( = ?auto_311322 ?auto_311326 ) ) ( not ( = ?auto_311322 ?auto_311327 ) ) ( not ( = ?auto_311322 ?auto_311328 ) ) ( not ( = ?auto_311322 ?auto_311329 ) ) ( not ( = ?auto_311322 ?auto_311330 ) ) ( not ( = ?auto_311322 ?auto_311331 ) ) ( not ( = ?auto_311322 ?auto_311332 ) ) ( not ( = ?auto_311323 ?auto_311324 ) ) ( not ( = ?auto_311323 ?auto_311325 ) ) ( not ( = ?auto_311323 ?auto_311326 ) ) ( not ( = ?auto_311323 ?auto_311327 ) ) ( not ( = ?auto_311323 ?auto_311328 ) ) ( not ( = ?auto_311323 ?auto_311329 ) ) ( not ( = ?auto_311323 ?auto_311330 ) ) ( not ( = ?auto_311323 ?auto_311331 ) ) ( not ( = ?auto_311323 ?auto_311332 ) ) ( not ( = ?auto_311324 ?auto_311325 ) ) ( not ( = ?auto_311324 ?auto_311326 ) ) ( not ( = ?auto_311324 ?auto_311327 ) ) ( not ( = ?auto_311324 ?auto_311328 ) ) ( not ( = ?auto_311324 ?auto_311329 ) ) ( not ( = ?auto_311324 ?auto_311330 ) ) ( not ( = ?auto_311324 ?auto_311331 ) ) ( not ( = ?auto_311324 ?auto_311332 ) ) ( not ( = ?auto_311325 ?auto_311326 ) ) ( not ( = ?auto_311325 ?auto_311327 ) ) ( not ( = ?auto_311325 ?auto_311328 ) ) ( not ( = ?auto_311325 ?auto_311329 ) ) ( not ( = ?auto_311325 ?auto_311330 ) ) ( not ( = ?auto_311325 ?auto_311331 ) ) ( not ( = ?auto_311325 ?auto_311332 ) ) ( not ( = ?auto_311326 ?auto_311327 ) ) ( not ( = ?auto_311326 ?auto_311328 ) ) ( not ( = ?auto_311326 ?auto_311329 ) ) ( not ( = ?auto_311326 ?auto_311330 ) ) ( not ( = ?auto_311326 ?auto_311331 ) ) ( not ( = ?auto_311326 ?auto_311332 ) ) ( not ( = ?auto_311327 ?auto_311328 ) ) ( not ( = ?auto_311327 ?auto_311329 ) ) ( not ( = ?auto_311327 ?auto_311330 ) ) ( not ( = ?auto_311327 ?auto_311331 ) ) ( not ( = ?auto_311327 ?auto_311332 ) ) ( not ( = ?auto_311328 ?auto_311329 ) ) ( not ( = ?auto_311328 ?auto_311330 ) ) ( not ( = ?auto_311328 ?auto_311331 ) ) ( not ( = ?auto_311328 ?auto_311332 ) ) ( not ( = ?auto_311329 ?auto_311330 ) ) ( not ( = ?auto_311329 ?auto_311331 ) ) ( not ( = ?auto_311329 ?auto_311332 ) ) ( not ( = ?auto_311330 ?auto_311331 ) ) ( not ( = ?auto_311330 ?auto_311332 ) ) ( not ( = ?auto_311331 ?auto_311332 ) ) ( ON ?auto_311330 ?auto_311331 ) ( ON ?auto_311329 ?auto_311330 ) ( ON ?auto_311328 ?auto_311329 ) ( ON ?auto_311327 ?auto_311328 ) ( ON ?auto_311326 ?auto_311327 ) ( ON ?auto_311325 ?auto_311326 ) ( ON ?auto_311324 ?auto_311325 ) ( ON ?auto_311323 ?auto_311324 ) ( ON ?auto_311322 ?auto_311323 ) ( ON ?auto_311321 ?auto_311322 ) ( CLEAR ?auto_311321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_311321 )
      ( MAKE-11PILE ?auto_311321 ?auto_311322 ?auto_311323 ?auto_311324 ?auto_311325 ?auto_311326 ?auto_311327 ?auto_311328 ?auto_311329 ?auto_311330 ?auto_311331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311368 - BLOCK
      ?auto_311369 - BLOCK
      ?auto_311370 - BLOCK
      ?auto_311371 - BLOCK
      ?auto_311372 - BLOCK
      ?auto_311373 - BLOCK
      ?auto_311374 - BLOCK
      ?auto_311375 - BLOCK
      ?auto_311376 - BLOCK
      ?auto_311377 - BLOCK
      ?auto_311378 - BLOCK
      ?auto_311379 - BLOCK
    )
    :vars
    (
      ?auto_311380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_311378 ) ( ON ?auto_311379 ?auto_311380 ) ( CLEAR ?auto_311379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_311368 ) ( ON ?auto_311369 ?auto_311368 ) ( ON ?auto_311370 ?auto_311369 ) ( ON ?auto_311371 ?auto_311370 ) ( ON ?auto_311372 ?auto_311371 ) ( ON ?auto_311373 ?auto_311372 ) ( ON ?auto_311374 ?auto_311373 ) ( ON ?auto_311375 ?auto_311374 ) ( ON ?auto_311376 ?auto_311375 ) ( ON ?auto_311377 ?auto_311376 ) ( ON ?auto_311378 ?auto_311377 ) ( not ( = ?auto_311368 ?auto_311369 ) ) ( not ( = ?auto_311368 ?auto_311370 ) ) ( not ( = ?auto_311368 ?auto_311371 ) ) ( not ( = ?auto_311368 ?auto_311372 ) ) ( not ( = ?auto_311368 ?auto_311373 ) ) ( not ( = ?auto_311368 ?auto_311374 ) ) ( not ( = ?auto_311368 ?auto_311375 ) ) ( not ( = ?auto_311368 ?auto_311376 ) ) ( not ( = ?auto_311368 ?auto_311377 ) ) ( not ( = ?auto_311368 ?auto_311378 ) ) ( not ( = ?auto_311368 ?auto_311379 ) ) ( not ( = ?auto_311368 ?auto_311380 ) ) ( not ( = ?auto_311369 ?auto_311370 ) ) ( not ( = ?auto_311369 ?auto_311371 ) ) ( not ( = ?auto_311369 ?auto_311372 ) ) ( not ( = ?auto_311369 ?auto_311373 ) ) ( not ( = ?auto_311369 ?auto_311374 ) ) ( not ( = ?auto_311369 ?auto_311375 ) ) ( not ( = ?auto_311369 ?auto_311376 ) ) ( not ( = ?auto_311369 ?auto_311377 ) ) ( not ( = ?auto_311369 ?auto_311378 ) ) ( not ( = ?auto_311369 ?auto_311379 ) ) ( not ( = ?auto_311369 ?auto_311380 ) ) ( not ( = ?auto_311370 ?auto_311371 ) ) ( not ( = ?auto_311370 ?auto_311372 ) ) ( not ( = ?auto_311370 ?auto_311373 ) ) ( not ( = ?auto_311370 ?auto_311374 ) ) ( not ( = ?auto_311370 ?auto_311375 ) ) ( not ( = ?auto_311370 ?auto_311376 ) ) ( not ( = ?auto_311370 ?auto_311377 ) ) ( not ( = ?auto_311370 ?auto_311378 ) ) ( not ( = ?auto_311370 ?auto_311379 ) ) ( not ( = ?auto_311370 ?auto_311380 ) ) ( not ( = ?auto_311371 ?auto_311372 ) ) ( not ( = ?auto_311371 ?auto_311373 ) ) ( not ( = ?auto_311371 ?auto_311374 ) ) ( not ( = ?auto_311371 ?auto_311375 ) ) ( not ( = ?auto_311371 ?auto_311376 ) ) ( not ( = ?auto_311371 ?auto_311377 ) ) ( not ( = ?auto_311371 ?auto_311378 ) ) ( not ( = ?auto_311371 ?auto_311379 ) ) ( not ( = ?auto_311371 ?auto_311380 ) ) ( not ( = ?auto_311372 ?auto_311373 ) ) ( not ( = ?auto_311372 ?auto_311374 ) ) ( not ( = ?auto_311372 ?auto_311375 ) ) ( not ( = ?auto_311372 ?auto_311376 ) ) ( not ( = ?auto_311372 ?auto_311377 ) ) ( not ( = ?auto_311372 ?auto_311378 ) ) ( not ( = ?auto_311372 ?auto_311379 ) ) ( not ( = ?auto_311372 ?auto_311380 ) ) ( not ( = ?auto_311373 ?auto_311374 ) ) ( not ( = ?auto_311373 ?auto_311375 ) ) ( not ( = ?auto_311373 ?auto_311376 ) ) ( not ( = ?auto_311373 ?auto_311377 ) ) ( not ( = ?auto_311373 ?auto_311378 ) ) ( not ( = ?auto_311373 ?auto_311379 ) ) ( not ( = ?auto_311373 ?auto_311380 ) ) ( not ( = ?auto_311374 ?auto_311375 ) ) ( not ( = ?auto_311374 ?auto_311376 ) ) ( not ( = ?auto_311374 ?auto_311377 ) ) ( not ( = ?auto_311374 ?auto_311378 ) ) ( not ( = ?auto_311374 ?auto_311379 ) ) ( not ( = ?auto_311374 ?auto_311380 ) ) ( not ( = ?auto_311375 ?auto_311376 ) ) ( not ( = ?auto_311375 ?auto_311377 ) ) ( not ( = ?auto_311375 ?auto_311378 ) ) ( not ( = ?auto_311375 ?auto_311379 ) ) ( not ( = ?auto_311375 ?auto_311380 ) ) ( not ( = ?auto_311376 ?auto_311377 ) ) ( not ( = ?auto_311376 ?auto_311378 ) ) ( not ( = ?auto_311376 ?auto_311379 ) ) ( not ( = ?auto_311376 ?auto_311380 ) ) ( not ( = ?auto_311377 ?auto_311378 ) ) ( not ( = ?auto_311377 ?auto_311379 ) ) ( not ( = ?auto_311377 ?auto_311380 ) ) ( not ( = ?auto_311378 ?auto_311379 ) ) ( not ( = ?auto_311378 ?auto_311380 ) ) ( not ( = ?auto_311379 ?auto_311380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_311379 ?auto_311380 )
      ( !STACK ?auto_311379 ?auto_311378 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311418 - BLOCK
      ?auto_311419 - BLOCK
      ?auto_311420 - BLOCK
      ?auto_311421 - BLOCK
      ?auto_311422 - BLOCK
      ?auto_311423 - BLOCK
      ?auto_311424 - BLOCK
      ?auto_311425 - BLOCK
      ?auto_311426 - BLOCK
      ?auto_311427 - BLOCK
      ?auto_311428 - BLOCK
      ?auto_311429 - BLOCK
    )
    :vars
    (
      ?auto_311430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311429 ?auto_311430 ) ( ON-TABLE ?auto_311418 ) ( ON ?auto_311419 ?auto_311418 ) ( ON ?auto_311420 ?auto_311419 ) ( ON ?auto_311421 ?auto_311420 ) ( ON ?auto_311422 ?auto_311421 ) ( ON ?auto_311423 ?auto_311422 ) ( ON ?auto_311424 ?auto_311423 ) ( ON ?auto_311425 ?auto_311424 ) ( ON ?auto_311426 ?auto_311425 ) ( ON ?auto_311427 ?auto_311426 ) ( not ( = ?auto_311418 ?auto_311419 ) ) ( not ( = ?auto_311418 ?auto_311420 ) ) ( not ( = ?auto_311418 ?auto_311421 ) ) ( not ( = ?auto_311418 ?auto_311422 ) ) ( not ( = ?auto_311418 ?auto_311423 ) ) ( not ( = ?auto_311418 ?auto_311424 ) ) ( not ( = ?auto_311418 ?auto_311425 ) ) ( not ( = ?auto_311418 ?auto_311426 ) ) ( not ( = ?auto_311418 ?auto_311427 ) ) ( not ( = ?auto_311418 ?auto_311428 ) ) ( not ( = ?auto_311418 ?auto_311429 ) ) ( not ( = ?auto_311418 ?auto_311430 ) ) ( not ( = ?auto_311419 ?auto_311420 ) ) ( not ( = ?auto_311419 ?auto_311421 ) ) ( not ( = ?auto_311419 ?auto_311422 ) ) ( not ( = ?auto_311419 ?auto_311423 ) ) ( not ( = ?auto_311419 ?auto_311424 ) ) ( not ( = ?auto_311419 ?auto_311425 ) ) ( not ( = ?auto_311419 ?auto_311426 ) ) ( not ( = ?auto_311419 ?auto_311427 ) ) ( not ( = ?auto_311419 ?auto_311428 ) ) ( not ( = ?auto_311419 ?auto_311429 ) ) ( not ( = ?auto_311419 ?auto_311430 ) ) ( not ( = ?auto_311420 ?auto_311421 ) ) ( not ( = ?auto_311420 ?auto_311422 ) ) ( not ( = ?auto_311420 ?auto_311423 ) ) ( not ( = ?auto_311420 ?auto_311424 ) ) ( not ( = ?auto_311420 ?auto_311425 ) ) ( not ( = ?auto_311420 ?auto_311426 ) ) ( not ( = ?auto_311420 ?auto_311427 ) ) ( not ( = ?auto_311420 ?auto_311428 ) ) ( not ( = ?auto_311420 ?auto_311429 ) ) ( not ( = ?auto_311420 ?auto_311430 ) ) ( not ( = ?auto_311421 ?auto_311422 ) ) ( not ( = ?auto_311421 ?auto_311423 ) ) ( not ( = ?auto_311421 ?auto_311424 ) ) ( not ( = ?auto_311421 ?auto_311425 ) ) ( not ( = ?auto_311421 ?auto_311426 ) ) ( not ( = ?auto_311421 ?auto_311427 ) ) ( not ( = ?auto_311421 ?auto_311428 ) ) ( not ( = ?auto_311421 ?auto_311429 ) ) ( not ( = ?auto_311421 ?auto_311430 ) ) ( not ( = ?auto_311422 ?auto_311423 ) ) ( not ( = ?auto_311422 ?auto_311424 ) ) ( not ( = ?auto_311422 ?auto_311425 ) ) ( not ( = ?auto_311422 ?auto_311426 ) ) ( not ( = ?auto_311422 ?auto_311427 ) ) ( not ( = ?auto_311422 ?auto_311428 ) ) ( not ( = ?auto_311422 ?auto_311429 ) ) ( not ( = ?auto_311422 ?auto_311430 ) ) ( not ( = ?auto_311423 ?auto_311424 ) ) ( not ( = ?auto_311423 ?auto_311425 ) ) ( not ( = ?auto_311423 ?auto_311426 ) ) ( not ( = ?auto_311423 ?auto_311427 ) ) ( not ( = ?auto_311423 ?auto_311428 ) ) ( not ( = ?auto_311423 ?auto_311429 ) ) ( not ( = ?auto_311423 ?auto_311430 ) ) ( not ( = ?auto_311424 ?auto_311425 ) ) ( not ( = ?auto_311424 ?auto_311426 ) ) ( not ( = ?auto_311424 ?auto_311427 ) ) ( not ( = ?auto_311424 ?auto_311428 ) ) ( not ( = ?auto_311424 ?auto_311429 ) ) ( not ( = ?auto_311424 ?auto_311430 ) ) ( not ( = ?auto_311425 ?auto_311426 ) ) ( not ( = ?auto_311425 ?auto_311427 ) ) ( not ( = ?auto_311425 ?auto_311428 ) ) ( not ( = ?auto_311425 ?auto_311429 ) ) ( not ( = ?auto_311425 ?auto_311430 ) ) ( not ( = ?auto_311426 ?auto_311427 ) ) ( not ( = ?auto_311426 ?auto_311428 ) ) ( not ( = ?auto_311426 ?auto_311429 ) ) ( not ( = ?auto_311426 ?auto_311430 ) ) ( not ( = ?auto_311427 ?auto_311428 ) ) ( not ( = ?auto_311427 ?auto_311429 ) ) ( not ( = ?auto_311427 ?auto_311430 ) ) ( not ( = ?auto_311428 ?auto_311429 ) ) ( not ( = ?auto_311428 ?auto_311430 ) ) ( not ( = ?auto_311429 ?auto_311430 ) ) ( CLEAR ?auto_311427 ) ( ON ?auto_311428 ?auto_311429 ) ( CLEAR ?auto_311428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_311418 ?auto_311419 ?auto_311420 ?auto_311421 ?auto_311422 ?auto_311423 ?auto_311424 ?auto_311425 ?auto_311426 ?auto_311427 ?auto_311428 )
      ( MAKE-12PILE ?auto_311418 ?auto_311419 ?auto_311420 ?auto_311421 ?auto_311422 ?auto_311423 ?auto_311424 ?auto_311425 ?auto_311426 ?auto_311427 ?auto_311428 ?auto_311429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311468 - BLOCK
      ?auto_311469 - BLOCK
      ?auto_311470 - BLOCK
      ?auto_311471 - BLOCK
      ?auto_311472 - BLOCK
      ?auto_311473 - BLOCK
      ?auto_311474 - BLOCK
      ?auto_311475 - BLOCK
      ?auto_311476 - BLOCK
      ?auto_311477 - BLOCK
      ?auto_311478 - BLOCK
      ?auto_311479 - BLOCK
    )
    :vars
    (
      ?auto_311480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311479 ?auto_311480 ) ( ON-TABLE ?auto_311468 ) ( ON ?auto_311469 ?auto_311468 ) ( ON ?auto_311470 ?auto_311469 ) ( ON ?auto_311471 ?auto_311470 ) ( ON ?auto_311472 ?auto_311471 ) ( ON ?auto_311473 ?auto_311472 ) ( ON ?auto_311474 ?auto_311473 ) ( ON ?auto_311475 ?auto_311474 ) ( ON ?auto_311476 ?auto_311475 ) ( not ( = ?auto_311468 ?auto_311469 ) ) ( not ( = ?auto_311468 ?auto_311470 ) ) ( not ( = ?auto_311468 ?auto_311471 ) ) ( not ( = ?auto_311468 ?auto_311472 ) ) ( not ( = ?auto_311468 ?auto_311473 ) ) ( not ( = ?auto_311468 ?auto_311474 ) ) ( not ( = ?auto_311468 ?auto_311475 ) ) ( not ( = ?auto_311468 ?auto_311476 ) ) ( not ( = ?auto_311468 ?auto_311477 ) ) ( not ( = ?auto_311468 ?auto_311478 ) ) ( not ( = ?auto_311468 ?auto_311479 ) ) ( not ( = ?auto_311468 ?auto_311480 ) ) ( not ( = ?auto_311469 ?auto_311470 ) ) ( not ( = ?auto_311469 ?auto_311471 ) ) ( not ( = ?auto_311469 ?auto_311472 ) ) ( not ( = ?auto_311469 ?auto_311473 ) ) ( not ( = ?auto_311469 ?auto_311474 ) ) ( not ( = ?auto_311469 ?auto_311475 ) ) ( not ( = ?auto_311469 ?auto_311476 ) ) ( not ( = ?auto_311469 ?auto_311477 ) ) ( not ( = ?auto_311469 ?auto_311478 ) ) ( not ( = ?auto_311469 ?auto_311479 ) ) ( not ( = ?auto_311469 ?auto_311480 ) ) ( not ( = ?auto_311470 ?auto_311471 ) ) ( not ( = ?auto_311470 ?auto_311472 ) ) ( not ( = ?auto_311470 ?auto_311473 ) ) ( not ( = ?auto_311470 ?auto_311474 ) ) ( not ( = ?auto_311470 ?auto_311475 ) ) ( not ( = ?auto_311470 ?auto_311476 ) ) ( not ( = ?auto_311470 ?auto_311477 ) ) ( not ( = ?auto_311470 ?auto_311478 ) ) ( not ( = ?auto_311470 ?auto_311479 ) ) ( not ( = ?auto_311470 ?auto_311480 ) ) ( not ( = ?auto_311471 ?auto_311472 ) ) ( not ( = ?auto_311471 ?auto_311473 ) ) ( not ( = ?auto_311471 ?auto_311474 ) ) ( not ( = ?auto_311471 ?auto_311475 ) ) ( not ( = ?auto_311471 ?auto_311476 ) ) ( not ( = ?auto_311471 ?auto_311477 ) ) ( not ( = ?auto_311471 ?auto_311478 ) ) ( not ( = ?auto_311471 ?auto_311479 ) ) ( not ( = ?auto_311471 ?auto_311480 ) ) ( not ( = ?auto_311472 ?auto_311473 ) ) ( not ( = ?auto_311472 ?auto_311474 ) ) ( not ( = ?auto_311472 ?auto_311475 ) ) ( not ( = ?auto_311472 ?auto_311476 ) ) ( not ( = ?auto_311472 ?auto_311477 ) ) ( not ( = ?auto_311472 ?auto_311478 ) ) ( not ( = ?auto_311472 ?auto_311479 ) ) ( not ( = ?auto_311472 ?auto_311480 ) ) ( not ( = ?auto_311473 ?auto_311474 ) ) ( not ( = ?auto_311473 ?auto_311475 ) ) ( not ( = ?auto_311473 ?auto_311476 ) ) ( not ( = ?auto_311473 ?auto_311477 ) ) ( not ( = ?auto_311473 ?auto_311478 ) ) ( not ( = ?auto_311473 ?auto_311479 ) ) ( not ( = ?auto_311473 ?auto_311480 ) ) ( not ( = ?auto_311474 ?auto_311475 ) ) ( not ( = ?auto_311474 ?auto_311476 ) ) ( not ( = ?auto_311474 ?auto_311477 ) ) ( not ( = ?auto_311474 ?auto_311478 ) ) ( not ( = ?auto_311474 ?auto_311479 ) ) ( not ( = ?auto_311474 ?auto_311480 ) ) ( not ( = ?auto_311475 ?auto_311476 ) ) ( not ( = ?auto_311475 ?auto_311477 ) ) ( not ( = ?auto_311475 ?auto_311478 ) ) ( not ( = ?auto_311475 ?auto_311479 ) ) ( not ( = ?auto_311475 ?auto_311480 ) ) ( not ( = ?auto_311476 ?auto_311477 ) ) ( not ( = ?auto_311476 ?auto_311478 ) ) ( not ( = ?auto_311476 ?auto_311479 ) ) ( not ( = ?auto_311476 ?auto_311480 ) ) ( not ( = ?auto_311477 ?auto_311478 ) ) ( not ( = ?auto_311477 ?auto_311479 ) ) ( not ( = ?auto_311477 ?auto_311480 ) ) ( not ( = ?auto_311478 ?auto_311479 ) ) ( not ( = ?auto_311478 ?auto_311480 ) ) ( not ( = ?auto_311479 ?auto_311480 ) ) ( ON ?auto_311478 ?auto_311479 ) ( CLEAR ?auto_311476 ) ( ON ?auto_311477 ?auto_311478 ) ( CLEAR ?auto_311477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_311468 ?auto_311469 ?auto_311470 ?auto_311471 ?auto_311472 ?auto_311473 ?auto_311474 ?auto_311475 ?auto_311476 ?auto_311477 )
      ( MAKE-12PILE ?auto_311468 ?auto_311469 ?auto_311470 ?auto_311471 ?auto_311472 ?auto_311473 ?auto_311474 ?auto_311475 ?auto_311476 ?auto_311477 ?auto_311478 ?auto_311479 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311518 - BLOCK
      ?auto_311519 - BLOCK
      ?auto_311520 - BLOCK
      ?auto_311521 - BLOCK
      ?auto_311522 - BLOCK
      ?auto_311523 - BLOCK
      ?auto_311524 - BLOCK
      ?auto_311525 - BLOCK
      ?auto_311526 - BLOCK
      ?auto_311527 - BLOCK
      ?auto_311528 - BLOCK
      ?auto_311529 - BLOCK
    )
    :vars
    (
      ?auto_311530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311529 ?auto_311530 ) ( ON-TABLE ?auto_311518 ) ( ON ?auto_311519 ?auto_311518 ) ( ON ?auto_311520 ?auto_311519 ) ( ON ?auto_311521 ?auto_311520 ) ( ON ?auto_311522 ?auto_311521 ) ( ON ?auto_311523 ?auto_311522 ) ( ON ?auto_311524 ?auto_311523 ) ( ON ?auto_311525 ?auto_311524 ) ( not ( = ?auto_311518 ?auto_311519 ) ) ( not ( = ?auto_311518 ?auto_311520 ) ) ( not ( = ?auto_311518 ?auto_311521 ) ) ( not ( = ?auto_311518 ?auto_311522 ) ) ( not ( = ?auto_311518 ?auto_311523 ) ) ( not ( = ?auto_311518 ?auto_311524 ) ) ( not ( = ?auto_311518 ?auto_311525 ) ) ( not ( = ?auto_311518 ?auto_311526 ) ) ( not ( = ?auto_311518 ?auto_311527 ) ) ( not ( = ?auto_311518 ?auto_311528 ) ) ( not ( = ?auto_311518 ?auto_311529 ) ) ( not ( = ?auto_311518 ?auto_311530 ) ) ( not ( = ?auto_311519 ?auto_311520 ) ) ( not ( = ?auto_311519 ?auto_311521 ) ) ( not ( = ?auto_311519 ?auto_311522 ) ) ( not ( = ?auto_311519 ?auto_311523 ) ) ( not ( = ?auto_311519 ?auto_311524 ) ) ( not ( = ?auto_311519 ?auto_311525 ) ) ( not ( = ?auto_311519 ?auto_311526 ) ) ( not ( = ?auto_311519 ?auto_311527 ) ) ( not ( = ?auto_311519 ?auto_311528 ) ) ( not ( = ?auto_311519 ?auto_311529 ) ) ( not ( = ?auto_311519 ?auto_311530 ) ) ( not ( = ?auto_311520 ?auto_311521 ) ) ( not ( = ?auto_311520 ?auto_311522 ) ) ( not ( = ?auto_311520 ?auto_311523 ) ) ( not ( = ?auto_311520 ?auto_311524 ) ) ( not ( = ?auto_311520 ?auto_311525 ) ) ( not ( = ?auto_311520 ?auto_311526 ) ) ( not ( = ?auto_311520 ?auto_311527 ) ) ( not ( = ?auto_311520 ?auto_311528 ) ) ( not ( = ?auto_311520 ?auto_311529 ) ) ( not ( = ?auto_311520 ?auto_311530 ) ) ( not ( = ?auto_311521 ?auto_311522 ) ) ( not ( = ?auto_311521 ?auto_311523 ) ) ( not ( = ?auto_311521 ?auto_311524 ) ) ( not ( = ?auto_311521 ?auto_311525 ) ) ( not ( = ?auto_311521 ?auto_311526 ) ) ( not ( = ?auto_311521 ?auto_311527 ) ) ( not ( = ?auto_311521 ?auto_311528 ) ) ( not ( = ?auto_311521 ?auto_311529 ) ) ( not ( = ?auto_311521 ?auto_311530 ) ) ( not ( = ?auto_311522 ?auto_311523 ) ) ( not ( = ?auto_311522 ?auto_311524 ) ) ( not ( = ?auto_311522 ?auto_311525 ) ) ( not ( = ?auto_311522 ?auto_311526 ) ) ( not ( = ?auto_311522 ?auto_311527 ) ) ( not ( = ?auto_311522 ?auto_311528 ) ) ( not ( = ?auto_311522 ?auto_311529 ) ) ( not ( = ?auto_311522 ?auto_311530 ) ) ( not ( = ?auto_311523 ?auto_311524 ) ) ( not ( = ?auto_311523 ?auto_311525 ) ) ( not ( = ?auto_311523 ?auto_311526 ) ) ( not ( = ?auto_311523 ?auto_311527 ) ) ( not ( = ?auto_311523 ?auto_311528 ) ) ( not ( = ?auto_311523 ?auto_311529 ) ) ( not ( = ?auto_311523 ?auto_311530 ) ) ( not ( = ?auto_311524 ?auto_311525 ) ) ( not ( = ?auto_311524 ?auto_311526 ) ) ( not ( = ?auto_311524 ?auto_311527 ) ) ( not ( = ?auto_311524 ?auto_311528 ) ) ( not ( = ?auto_311524 ?auto_311529 ) ) ( not ( = ?auto_311524 ?auto_311530 ) ) ( not ( = ?auto_311525 ?auto_311526 ) ) ( not ( = ?auto_311525 ?auto_311527 ) ) ( not ( = ?auto_311525 ?auto_311528 ) ) ( not ( = ?auto_311525 ?auto_311529 ) ) ( not ( = ?auto_311525 ?auto_311530 ) ) ( not ( = ?auto_311526 ?auto_311527 ) ) ( not ( = ?auto_311526 ?auto_311528 ) ) ( not ( = ?auto_311526 ?auto_311529 ) ) ( not ( = ?auto_311526 ?auto_311530 ) ) ( not ( = ?auto_311527 ?auto_311528 ) ) ( not ( = ?auto_311527 ?auto_311529 ) ) ( not ( = ?auto_311527 ?auto_311530 ) ) ( not ( = ?auto_311528 ?auto_311529 ) ) ( not ( = ?auto_311528 ?auto_311530 ) ) ( not ( = ?auto_311529 ?auto_311530 ) ) ( ON ?auto_311528 ?auto_311529 ) ( ON ?auto_311527 ?auto_311528 ) ( CLEAR ?auto_311525 ) ( ON ?auto_311526 ?auto_311527 ) ( CLEAR ?auto_311526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_311518 ?auto_311519 ?auto_311520 ?auto_311521 ?auto_311522 ?auto_311523 ?auto_311524 ?auto_311525 ?auto_311526 )
      ( MAKE-12PILE ?auto_311518 ?auto_311519 ?auto_311520 ?auto_311521 ?auto_311522 ?auto_311523 ?auto_311524 ?auto_311525 ?auto_311526 ?auto_311527 ?auto_311528 ?auto_311529 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311568 - BLOCK
      ?auto_311569 - BLOCK
      ?auto_311570 - BLOCK
      ?auto_311571 - BLOCK
      ?auto_311572 - BLOCK
      ?auto_311573 - BLOCK
      ?auto_311574 - BLOCK
      ?auto_311575 - BLOCK
      ?auto_311576 - BLOCK
      ?auto_311577 - BLOCK
      ?auto_311578 - BLOCK
      ?auto_311579 - BLOCK
    )
    :vars
    (
      ?auto_311580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311579 ?auto_311580 ) ( ON-TABLE ?auto_311568 ) ( ON ?auto_311569 ?auto_311568 ) ( ON ?auto_311570 ?auto_311569 ) ( ON ?auto_311571 ?auto_311570 ) ( ON ?auto_311572 ?auto_311571 ) ( ON ?auto_311573 ?auto_311572 ) ( ON ?auto_311574 ?auto_311573 ) ( not ( = ?auto_311568 ?auto_311569 ) ) ( not ( = ?auto_311568 ?auto_311570 ) ) ( not ( = ?auto_311568 ?auto_311571 ) ) ( not ( = ?auto_311568 ?auto_311572 ) ) ( not ( = ?auto_311568 ?auto_311573 ) ) ( not ( = ?auto_311568 ?auto_311574 ) ) ( not ( = ?auto_311568 ?auto_311575 ) ) ( not ( = ?auto_311568 ?auto_311576 ) ) ( not ( = ?auto_311568 ?auto_311577 ) ) ( not ( = ?auto_311568 ?auto_311578 ) ) ( not ( = ?auto_311568 ?auto_311579 ) ) ( not ( = ?auto_311568 ?auto_311580 ) ) ( not ( = ?auto_311569 ?auto_311570 ) ) ( not ( = ?auto_311569 ?auto_311571 ) ) ( not ( = ?auto_311569 ?auto_311572 ) ) ( not ( = ?auto_311569 ?auto_311573 ) ) ( not ( = ?auto_311569 ?auto_311574 ) ) ( not ( = ?auto_311569 ?auto_311575 ) ) ( not ( = ?auto_311569 ?auto_311576 ) ) ( not ( = ?auto_311569 ?auto_311577 ) ) ( not ( = ?auto_311569 ?auto_311578 ) ) ( not ( = ?auto_311569 ?auto_311579 ) ) ( not ( = ?auto_311569 ?auto_311580 ) ) ( not ( = ?auto_311570 ?auto_311571 ) ) ( not ( = ?auto_311570 ?auto_311572 ) ) ( not ( = ?auto_311570 ?auto_311573 ) ) ( not ( = ?auto_311570 ?auto_311574 ) ) ( not ( = ?auto_311570 ?auto_311575 ) ) ( not ( = ?auto_311570 ?auto_311576 ) ) ( not ( = ?auto_311570 ?auto_311577 ) ) ( not ( = ?auto_311570 ?auto_311578 ) ) ( not ( = ?auto_311570 ?auto_311579 ) ) ( not ( = ?auto_311570 ?auto_311580 ) ) ( not ( = ?auto_311571 ?auto_311572 ) ) ( not ( = ?auto_311571 ?auto_311573 ) ) ( not ( = ?auto_311571 ?auto_311574 ) ) ( not ( = ?auto_311571 ?auto_311575 ) ) ( not ( = ?auto_311571 ?auto_311576 ) ) ( not ( = ?auto_311571 ?auto_311577 ) ) ( not ( = ?auto_311571 ?auto_311578 ) ) ( not ( = ?auto_311571 ?auto_311579 ) ) ( not ( = ?auto_311571 ?auto_311580 ) ) ( not ( = ?auto_311572 ?auto_311573 ) ) ( not ( = ?auto_311572 ?auto_311574 ) ) ( not ( = ?auto_311572 ?auto_311575 ) ) ( not ( = ?auto_311572 ?auto_311576 ) ) ( not ( = ?auto_311572 ?auto_311577 ) ) ( not ( = ?auto_311572 ?auto_311578 ) ) ( not ( = ?auto_311572 ?auto_311579 ) ) ( not ( = ?auto_311572 ?auto_311580 ) ) ( not ( = ?auto_311573 ?auto_311574 ) ) ( not ( = ?auto_311573 ?auto_311575 ) ) ( not ( = ?auto_311573 ?auto_311576 ) ) ( not ( = ?auto_311573 ?auto_311577 ) ) ( not ( = ?auto_311573 ?auto_311578 ) ) ( not ( = ?auto_311573 ?auto_311579 ) ) ( not ( = ?auto_311573 ?auto_311580 ) ) ( not ( = ?auto_311574 ?auto_311575 ) ) ( not ( = ?auto_311574 ?auto_311576 ) ) ( not ( = ?auto_311574 ?auto_311577 ) ) ( not ( = ?auto_311574 ?auto_311578 ) ) ( not ( = ?auto_311574 ?auto_311579 ) ) ( not ( = ?auto_311574 ?auto_311580 ) ) ( not ( = ?auto_311575 ?auto_311576 ) ) ( not ( = ?auto_311575 ?auto_311577 ) ) ( not ( = ?auto_311575 ?auto_311578 ) ) ( not ( = ?auto_311575 ?auto_311579 ) ) ( not ( = ?auto_311575 ?auto_311580 ) ) ( not ( = ?auto_311576 ?auto_311577 ) ) ( not ( = ?auto_311576 ?auto_311578 ) ) ( not ( = ?auto_311576 ?auto_311579 ) ) ( not ( = ?auto_311576 ?auto_311580 ) ) ( not ( = ?auto_311577 ?auto_311578 ) ) ( not ( = ?auto_311577 ?auto_311579 ) ) ( not ( = ?auto_311577 ?auto_311580 ) ) ( not ( = ?auto_311578 ?auto_311579 ) ) ( not ( = ?auto_311578 ?auto_311580 ) ) ( not ( = ?auto_311579 ?auto_311580 ) ) ( ON ?auto_311578 ?auto_311579 ) ( ON ?auto_311577 ?auto_311578 ) ( ON ?auto_311576 ?auto_311577 ) ( CLEAR ?auto_311574 ) ( ON ?auto_311575 ?auto_311576 ) ( CLEAR ?auto_311575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_311568 ?auto_311569 ?auto_311570 ?auto_311571 ?auto_311572 ?auto_311573 ?auto_311574 ?auto_311575 )
      ( MAKE-12PILE ?auto_311568 ?auto_311569 ?auto_311570 ?auto_311571 ?auto_311572 ?auto_311573 ?auto_311574 ?auto_311575 ?auto_311576 ?auto_311577 ?auto_311578 ?auto_311579 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311618 - BLOCK
      ?auto_311619 - BLOCK
      ?auto_311620 - BLOCK
      ?auto_311621 - BLOCK
      ?auto_311622 - BLOCK
      ?auto_311623 - BLOCK
      ?auto_311624 - BLOCK
      ?auto_311625 - BLOCK
      ?auto_311626 - BLOCK
      ?auto_311627 - BLOCK
      ?auto_311628 - BLOCK
      ?auto_311629 - BLOCK
    )
    :vars
    (
      ?auto_311630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311629 ?auto_311630 ) ( ON-TABLE ?auto_311618 ) ( ON ?auto_311619 ?auto_311618 ) ( ON ?auto_311620 ?auto_311619 ) ( ON ?auto_311621 ?auto_311620 ) ( ON ?auto_311622 ?auto_311621 ) ( ON ?auto_311623 ?auto_311622 ) ( not ( = ?auto_311618 ?auto_311619 ) ) ( not ( = ?auto_311618 ?auto_311620 ) ) ( not ( = ?auto_311618 ?auto_311621 ) ) ( not ( = ?auto_311618 ?auto_311622 ) ) ( not ( = ?auto_311618 ?auto_311623 ) ) ( not ( = ?auto_311618 ?auto_311624 ) ) ( not ( = ?auto_311618 ?auto_311625 ) ) ( not ( = ?auto_311618 ?auto_311626 ) ) ( not ( = ?auto_311618 ?auto_311627 ) ) ( not ( = ?auto_311618 ?auto_311628 ) ) ( not ( = ?auto_311618 ?auto_311629 ) ) ( not ( = ?auto_311618 ?auto_311630 ) ) ( not ( = ?auto_311619 ?auto_311620 ) ) ( not ( = ?auto_311619 ?auto_311621 ) ) ( not ( = ?auto_311619 ?auto_311622 ) ) ( not ( = ?auto_311619 ?auto_311623 ) ) ( not ( = ?auto_311619 ?auto_311624 ) ) ( not ( = ?auto_311619 ?auto_311625 ) ) ( not ( = ?auto_311619 ?auto_311626 ) ) ( not ( = ?auto_311619 ?auto_311627 ) ) ( not ( = ?auto_311619 ?auto_311628 ) ) ( not ( = ?auto_311619 ?auto_311629 ) ) ( not ( = ?auto_311619 ?auto_311630 ) ) ( not ( = ?auto_311620 ?auto_311621 ) ) ( not ( = ?auto_311620 ?auto_311622 ) ) ( not ( = ?auto_311620 ?auto_311623 ) ) ( not ( = ?auto_311620 ?auto_311624 ) ) ( not ( = ?auto_311620 ?auto_311625 ) ) ( not ( = ?auto_311620 ?auto_311626 ) ) ( not ( = ?auto_311620 ?auto_311627 ) ) ( not ( = ?auto_311620 ?auto_311628 ) ) ( not ( = ?auto_311620 ?auto_311629 ) ) ( not ( = ?auto_311620 ?auto_311630 ) ) ( not ( = ?auto_311621 ?auto_311622 ) ) ( not ( = ?auto_311621 ?auto_311623 ) ) ( not ( = ?auto_311621 ?auto_311624 ) ) ( not ( = ?auto_311621 ?auto_311625 ) ) ( not ( = ?auto_311621 ?auto_311626 ) ) ( not ( = ?auto_311621 ?auto_311627 ) ) ( not ( = ?auto_311621 ?auto_311628 ) ) ( not ( = ?auto_311621 ?auto_311629 ) ) ( not ( = ?auto_311621 ?auto_311630 ) ) ( not ( = ?auto_311622 ?auto_311623 ) ) ( not ( = ?auto_311622 ?auto_311624 ) ) ( not ( = ?auto_311622 ?auto_311625 ) ) ( not ( = ?auto_311622 ?auto_311626 ) ) ( not ( = ?auto_311622 ?auto_311627 ) ) ( not ( = ?auto_311622 ?auto_311628 ) ) ( not ( = ?auto_311622 ?auto_311629 ) ) ( not ( = ?auto_311622 ?auto_311630 ) ) ( not ( = ?auto_311623 ?auto_311624 ) ) ( not ( = ?auto_311623 ?auto_311625 ) ) ( not ( = ?auto_311623 ?auto_311626 ) ) ( not ( = ?auto_311623 ?auto_311627 ) ) ( not ( = ?auto_311623 ?auto_311628 ) ) ( not ( = ?auto_311623 ?auto_311629 ) ) ( not ( = ?auto_311623 ?auto_311630 ) ) ( not ( = ?auto_311624 ?auto_311625 ) ) ( not ( = ?auto_311624 ?auto_311626 ) ) ( not ( = ?auto_311624 ?auto_311627 ) ) ( not ( = ?auto_311624 ?auto_311628 ) ) ( not ( = ?auto_311624 ?auto_311629 ) ) ( not ( = ?auto_311624 ?auto_311630 ) ) ( not ( = ?auto_311625 ?auto_311626 ) ) ( not ( = ?auto_311625 ?auto_311627 ) ) ( not ( = ?auto_311625 ?auto_311628 ) ) ( not ( = ?auto_311625 ?auto_311629 ) ) ( not ( = ?auto_311625 ?auto_311630 ) ) ( not ( = ?auto_311626 ?auto_311627 ) ) ( not ( = ?auto_311626 ?auto_311628 ) ) ( not ( = ?auto_311626 ?auto_311629 ) ) ( not ( = ?auto_311626 ?auto_311630 ) ) ( not ( = ?auto_311627 ?auto_311628 ) ) ( not ( = ?auto_311627 ?auto_311629 ) ) ( not ( = ?auto_311627 ?auto_311630 ) ) ( not ( = ?auto_311628 ?auto_311629 ) ) ( not ( = ?auto_311628 ?auto_311630 ) ) ( not ( = ?auto_311629 ?auto_311630 ) ) ( ON ?auto_311628 ?auto_311629 ) ( ON ?auto_311627 ?auto_311628 ) ( ON ?auto_311626 ?auto_311627 ) ( ON ?auto_311625 ?auto_311626 ) ( CLEAR ?auto_311623 ) ( ON ?auto_311624 ?auto_311625 ) ( CLEAR ?auto_311624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_311618 ?auto_311619 ?auto_311620 ?auto_311621 ?auto_311622 ?auto_311623 ?auto_311624 )
      ( MAKE-12PILE ?auto_311618 ?auto_311619 ?auto_311620 ?auto_311621 ?auto_311622 ?auto_311623 ?auto_311624 ?auto_311625 ?auto_311626 ?auto_311627 ?auto_311628 ?auto_311629 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311668 - BLOCK
      ?auto_311669 - BLOCK
      ?auto_311670 - BLOCK
      ?auto_311671 - BLOCK
      ?auto_311672 - BLOCK
      ?auto_311673 - BLOCK
      ?auto_311674 - BLOCK
      ?auto_311675 - BLOCK
      ?auto_311676 - BLOCK
      ?auto_311677 - BLOCK
      ?auto_311678 - BLOCK
      ?auto_311679 - BLOCK
    )
    :vars
    (
      ?auto_311680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311679 ?auto_311680 ) ( ON-TABLE ?auto_311668 ) ( ON ?auto_311669 ?auto_311668 ) ( ON ?auto_311670 ?auto_311669 ) ( ON ?auto_311671 ?auto_311670 ) ( ON ?auto_311672 ?auto_311671 ) ( not ( = ?auto_311668 ?auto_311669 ) ) ( not ( = ?auto_311668 ?auto_311670 ) ) ( not ( = ?auto_311668 ?auto_311671 ) ) ( not ( = ?auto_311668 ?auto_311672 ) ) ( not ( = ?auto_311668 ?auto_311673 ) ) ( not ( = ?auto_311668 ?auto_311674 ) ) ( not ( = ?auto_311668 ?auto_311675 ) ) ( not ( = ?auto_311668 ?auto_311676 ) ) ( not ( = ?auto_311668 ?auto_311677 ) ) ( not ( = ?auto_311668 ?auto_311678 ) ) ( not ( = ?auto_311668 ?auto_311679 ) ) ( not ( = ?auto_311668 ?auto_311680 ) ) ( not ( = ?auto_311669 ?auto_311670 ) ) ( not ( = ?auto_311669 ?auto_311671 ) ) ( not ( = ?auto_311669 ?auto_311672 ) ) ( not ( = ?auto_311669 ?auto_311673 ) ) ( not ( = ?auto_311669 ?auto_311674 ) ) ( not ( = ?auto_311669 ?auto_311675 ) ) ( not ( = ?auto_311669 ?auto_311676 ) ) ( not ( = ?auto_311669 ?auto_311677 ) ) ( not ( = ?auto_311669 ?auto_311678 ) ) ( not ( = ?auto_311669 ?auto_311679 ) ) ( not ( = ?auto_311669 ?auto_311680 ) ) ( not ( = ?auto_311670 ?auto_311671 ) ) ( not ( = ?auto_311670 ?auto_311672 ) ) ( not ( = ?auto_311670 ?auto_311673 ) ) ( not ( = ?auto_311670 ?auto_311674 ) ) ( not ( = ?auto_311670 ?auto_311675 ) ) ( not ( = ?auto_311670 ?auto_311676 ) ) ( not ( = ?auto_311670 ?auto_311677 ) ) ( not ( = ?auto_311670 ?auto_311678 ) ) ( not ( = ?auto_311670 ?auto_311679 ) ) ( not ( = ?auto_311670 ?auto_311680 ) ) ( not ( = ?auto_311671 ?auto_311672 ) ) ( not ( = ?auto_311671 ?auto_311673 ) ) ( not ( = ?auto_311671 ?auto_311674 ) ) ( not ( = ?auto_311671 ?auto_311675 ) ) ( not ( = ?auto_311671 ?auto_311676 ) ) ( not ( = ?auto_311671 ?auto_311677 ) ) ( not ( = ?auto_311671 ?auto_311678 ) ) ( not ( = ?auto_311671 ?auto_311679 ) ) ( not ( = ?auto_311671 ?auto_311680 ) ) ( not ( = ?auto_311672 ?auto_311673 ) ) ( not ( = ?auto_311672 ?auto_311674 ) ) ( not ( = ?auto_311672 ?auto_311675 ) ) ( not ( = ?auto_311672 ?auto_311676 ) ) ( not ( = ?auto_311672 ?auto_311677 ) ) ( not ( = ?auto_311672 ?auto_311678 ) ) ( not ( = ?auto_311672 ?auto_311679 ) ) ( not ( = ?auto_311672 ?auto_311680 ) ) ( not ( = ?auto_311673 ?auto_311674 ) ) ( not ( = ?auto_311673 ?auto_311675 ) ) ( not ( = ?auto_311673 ?auto_311676 ) ) ( not ( = ?auto_311673 ?auto_311677 ) ) ( not ( = ?auto_311673 ?auto_311678 ) ) ( not ( = ?auto_311673 ?auto_311679 ) ) ( not ( = ?auto_311673 ?auto_311680 ) ) ( not ( = ?auto_311674 ?auto_311675 ) ) ( not ( = ?auto_311674 ?auto_311676 ) ) ( not ( = ?auto_311674 ?auto_311677 ) ) ( not ( = ?auto_311674 ?auto_311678 ) ) ( not ( = ?auto_311674 ?auto_311679 ) ) ( not ( = ?auto_311674 ?auto_311680 ) ) ( not ( = ?auto_311675 ?auto_311676 ) ) ( not ( = ?auto_311675 ?auto_311677 ) ) ( not ( = ?auto_311675 ?auto_311678 ) ) ( not ( = ?auto_311675 ?auto_311679 ) ) ( not ( = ?auto_311675 ?auto_311680 ) ) ( not ( = ?auto_311676 ?auto_311677 ) ) ( not ( = ?auto_311676 ?auto_311678 ) ) ( not ( = ?auto_311676 ?auto_311679 ) ) ( not ( = ?auto_311676 ?auto_311680 ) ) ( not ( = ?auto_311677 ?auto_311678 ) ) ( not ( = ?auto_311677 ?auto_311679 ) ) ( not ( = ?auto_311677 ?auto_311680 ) ) ( not ( = ?auto_311678 ?auto_311679 ) ) ( not ( = ?auto_311678 ?auto_311680 ) ) ( not ( = ?auto_311679 ?auto_311680 ) ) ( ON ?auto_311678 ?auto_311679 ) ( ON ?auto_311677 ?auto_311678 ) ( ON ?auto_311676 ?auto_311677 ) ( ON ?auto_311675 ?auto_311676 ) ( ON ?auto_311674 ?auto_311675 ) ( CLEAR ?auto_311672 ) ( ON ?auto_311673 ?auto_311674 ) ( CLEAR ?auto_311673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_311668 ?auto_311669 ?auto_311670 ?auto_311671 ?auto_311672 ?auto_311673 )
      ( MAKE-12PILE ?auto_311668 ?auto_311669 ?auto_311670 ?auto_311671 ?auto_311672 ?auto_311673 ?auto_311674 ?auto_311675 ?auto_311676 ?auto_311677 ?auto_311678 ?auto_311679 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311718 - BLOCK
      ?auto_311719 - BLOCK
      ?auto_311720 - BLOCK
      ?auto_311721 - BLOCK
      ?auto_311722 - BLOCK
      ?auto_311723 - BLOCK
      ?auto_311724 - BLOCK
      ?auto_311725 - BLOCK
      ?auto_311726 - BLOCK
      ?auto_311727 - BLOCK
      ?auto_311728 - BLOCK
      ?auto_311729 - BLOCK
    )
    :vars
    (
      ?auto_311730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311729 ?auto_311730 ) ( ON-TABLE ?auto_311718 ) ( ON ?auto_311719 ?auto_311718 ) ( ON ?auto_311720 ?auto_311719 ) ( ON ?auto_311721 ?auto_311720 ) ( not ( = ?auto_311718 ?auto_311719 ) ) ( not ( = ?auto_311718 ?auto_311720 ) ) ( not ( = ?auto_311718 ?auto_311721 ) ) ( not ( = ?auto_311718 ?auto_311722 ) ) ( not ( = ?auto_311718 ?auto_311723 ) ) ( not ( = ?auto_311718 ?auto_311724 ) ) ( not ( = ?auto_311718 ?auto_311725 ) ) ( not ( = ?auto_311718 ?auto_311726 ) ) ( not ( = ?auto_311718 ?auto_311727 ) ) ( not ( = ?auto_311718 ?auto_311728 ) ) ( not ( = ?auto_311718 ?auto_311729 ) ) ( not ( = ?auto_311718 ?auto_311730 ) ) ( not ( = ?auto_311719 ?auto_311720 ) ) ( not ( = ?auto_311719 ?auto_311721 ) ) ( not ( = ?auto_311719 ?auto_311722 ) ) ( not ( = ?auto_311719 ?auto_311723 ) ) ( not ( = ?auto_311719 ?auto_311724 ) ) ( not ( = ?auto_311719 ?auto_311725 ) ) ( not ( = ?auto_311719 ?auto_311726 ) ) ( not ( = ?auto_311719 ?auto_311727 ) ) ( not ( = ?auto_311719 ?auto_311728 ) ) ( not ( = ?auto_311719 ?auto_311729 ) ) ( not ( = ?auto_311719 ?auto_311730 ) ) ( not ( = ?auto_311720 ?auto_311721 ) ) ( not ( = ?auto_311720 ?auto_311722 ) ) ( not ( = ?auto_311720 ?auto_311723 ) ) ( not ( = ?auto_311720 ?auto_311724 ) ) ( not ( = ?auto_311720 ?auto_311725 ) ) ( not ( = ?auto_311720 ?auto_311726 ) ) ( not ( = ?auto_311720 ?auto_311727 ) ) ( not ( = ?auto_311720 ?auto_311728 ) ) ( not ( = ?auto_311720 ?auto_311729 ) ) ( not ( = ?auto_311720 ?auto_311730 ) ) ( not ( = ?auto_311721 ?auto_311722 ) ) ( not ( = ?auto_311721 ?auto_311723 ) ) ( not ( = ?auto_311721 ?auto_311724 ) ) ( not ( = ?auto_311721 ?auto_311725 ) ) ( not ( = ?auto_311721 ?auto_311726 ) ) ( not ( = ?auto_311721 ?auto_311727 ) ) ( not ( = ?auto_311721 ?auto_311728 ) ) ( not ( = ?auto_311721 ?auto_311729 ) ) ( not ( = ?auto_311721 ?auto_311730 ) ) ( not ( = ?auto_311722 ?auto_311723 ) ) ( not ( = ?auto_311722 ?auto_311724 ) ) ( not ( = ?auto_311722 ?auto_311725 ) ) ( not ( = ?auto_311722 ?auto_311726 ) ) ( not ( = ?auto_311722 ?auto_311727 ) ) ( not ( = ?auto_311722 ?auto_311728 ) ) ( not ( = ?auto_311722 ?auto_311729 ) ) ( not ( = ?auto_311722 ?auto_311730 ) ) ( not ( = ?auto_311723 ?auto_311724 ) ) ( not ( = ?auto_311723 ?auto_311725 ) ) ( not ( = ?auto_311723 ?auto_311726 ) ) ( not ( = ?auto_311723 ?auto_311727 ) ) ( not ( = ?auto_311723 ?auto_311728 ) ) ( not ( = ?auto_311723 ?auto_311729 ) ) ( not ( = ?auto_311723 ?auto_311730 ) ) ( not ( = ?auto_311724 ?auto_311725 ) ) ( not ( = ?auto_311724 ?auto_311726 ) ) ( not ( = ?auto_311724 ?auto_311727 ) ) ( not ( = ?auto_311724 ?auto_311728 ) ) ( not ( = ?auto_311724 ?auto_311729 ) ) ( not ( = ?auto_311724 ?auto_311730 ) ) ( not ( = ?auto_311725 ?auto_311726 ) ) ( not ( = ?auto_311725 ?auto_311727 ) ) ( not ( = ?auto_311725 ?auto_311728 ) ) ( not ( = ?auto_311725 ?auto_311729 ) ) ( not ( = ?auto_311725 ?auto_311730 ) ) ( not ( = ?auto_311726 ?auto_311727 ) ) ( not ( = ?auto_311726 ?auto_311728 ) ) ( not ( = ?auto_311726 ?auto_311729 ) ) ( not ( = ?auto_311726 ?auto_311730 ) ) ( not ( = ?auto_311727 ?auto_311728 ) ) ( not ( = ?auto_311727 ?auto_311729 ) ) ( not ( = ?auto_311727 ?auto_311730 ) ) ( not ( = ?auto_311728 ?auto_311729 ) ) ( not ( = ?auto_311728 ?auto_311730 ) ) ( not ( = ?auto_311729 ?auto_311730 ) ) ( ON ?auto_311728 ?auto_311729 ) ( ON ?auto_311727 ?auto_311728 ) ( ON ?auto_311726 ?auto_311727 ) ( ON ?auto_311725 ?auto_311726 ) ( ON ?auto_311724 ?auto_311725 ) ( ON ?auto_311723 ?auto_311724 ) ( CLEAR ?auto_311721 ) ( ON ?auto_311722 ?auto_311723 ) ( CLEAR ?auto_311722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_311718 ?auto_311719 ?auto_311720 ?auto_311721 ?auto_311722 )
      ( MAKE-12PILE ?auto_311718 ?auto_311719 ?auto_311720 ?auto_311721 ?auto_311722 ?auto_311723 ?auto_311724 ?auto_311725 ?auto_311726 ?auto_311727 ?auto_311728 ?auto_311729 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311768 - BLOCK
      ?auto_311769 - BLOCK
      ?auto_311770 - BLOCK
      ?auto_311771 - BLOCK
      ?auto_311772 - BLOCK
      ?auto_311773 - BLOCK
      ?auto_311774 - BLOCK
      ?auto_311775 - BLOCK
      ?auto_311776 - BLOCK
      ?auto_311777 - BLOCK
      ?auto_311778 - BLOCK
      ?auto_311779 - BLOCK
    )
    :vars
    (
      ?auto_311780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311779 ?auto_311780 ) ( ON-TABLE ?auto_311768 ) ( ON ?auto_311769 ?auto_311768 ) ( ON ?auto_311770 ?auto_311769 ) ( not ( = ?auto_311768 ?auto_311769 ) ) ( not ( = ?auto_311768 ?auto_311770 ) ) ( not ( = ?auto_311768 ?auto_311771 ) ) ( not ( = ?auto_311768 ?auto_311772 ) ) ( not ( = ?auto_311768 ?auto_311773 ) ) ( not ( = ?auto_311768 ?auto_311774 ) ) ( not ( = ?auto_311768 ?auto_311775 ) ) ( not ( = ?auto_311768 ?auto_311776 ) ) ( not ( = ?auto_311768 ?auto_311777 ) ) ( not ( = ?auto_311768 ?auto_311778 ) ) ( not ( = ?auto_311768 ?auto_311779 ) ) ( not ( = ?auto_311768 ?auto_311780 ) ) ( not ( = ?auto_311769 ?auto_311770 ) ) ( not ( = ?auto_311769 ?auto_311771 ) ) ( not ( = ?auto_311769 ?auto_311772 ) ) ( not ( = ?auto_311769 ?auto_311773 ) ) ( not ( = ?auto_311769 ?auto_311774 ) ) ( not ( = ?auto_311769 ?auto_311775 ) ) ( not ( = ?auto_311769 ?auto_311776 ) ) ( not ( = ?auto_311769 ?auto_311777 ) ) ( not ( = ?auto_311769 ?auto_311778 ) ) ( not ( = ?auto_311769 ?auto_311779 ) ) ( not ( = ?auto_311769 ?auto_311780 ) ) ( not ( = ?auto_311770 ?auto_311771 ) ) ( not ( = ?auto_311770 ?auto_311772 ) ) ( not ( = ?auto_311770 ?auto_311773 ) ) ( not ( = ?auto_311770 ?auto_311774 ) ) ( not ( = ?auto_311770 ?auto_311775 ) ) ( not ( = ?auto_311770 ?auto_311776 ) ) ( not ( = ?auto_311770 ?auto_311777 ) ) ( not ( = ?auto_311770 ?auto_311778 ) ) ( not ( = ?auto_311770 ?auto_311779 ) ) ( not ( = ?auto_311770 ?auto_311780 ) ) ( not ( = ?auto_311771 ?auto_311772 ) ) ( not ( = ?auto_311771 ?auto_311773 ) ) ( not ( = ?auto_311771 ?auto_311774 ) ) ( not ( = ?auto_311771 ?auto_311775 ) ) ( not ( = ?auto_311771 ?auto_311776 ) ) ( not ( = ?auto_311771 ?auto_311777 ) ) ( not ( = ?auto_311771 ?auto_311778 ) ) ( not ( = ?auto_311771 ?auto_311779 ) ) ( not ( = ?auto_311771 ?auto_311780 ) ) ( not ( = ?auto_311772 ?auto_311773 ) ) ( not ( = ?auto_311772 ?auto_311774 ) ) ( not ( = ?auto_311772 ?auto_311775 ) ) ( not ( = ?auto_311772 ?auto_311776 ) ) ( not ( = ?auto_311772 ?auto_311777 ) ) ( not ( = ?auto_311772 ?auto_311778 ) ) ( not ( = ?auto_311772 ?auto_311779 ) ) ( not ( = ?auto_311772 ?auto_311780 ) ) ( not ( = ?auto_311773 ?auto_311774 ) ) ( not ( = ?auto_311773 ?auto_311775 ) ) ( not ( = ?auto_311773 ?auto_311776 ) ) ( not ( = ?auto_311773 ?auto_311777 ) ) ( not ( = ?auto_311773 ?auto_311778 ) ) ( not ( = ?auto_311773 ?auto_311779 ) ) ( not ( = ?auto_311773 ?auto_311780 ) ) ( not ( = ?auto_311774 ?auto_311775 ) ) ( not ( = ?auto_311774 ?auto_311776 ) ) ( not ( = ?auto_311774 ?auto_311777 ) ) ( not ( = ?auto_311774 ?auto_311778 ) ) ( not ( = ?auto_311774 ?auto_311779 ) ) ( not ( = ?auto_311774 ?auto_311780 ) ) ( not ( = ?auto_311775 ?auto_311776 ) ) ( not ( = ?auto_311775 ?auto_311777 ) ) ( not ( = ?auto_311775 ?auto_311778 ) ) ( not ( = ?auto_311775 ?auto_311779 ) ) ( not ( = ?auto_311775 ?auto_311780 ) ) ( not ( = ?auto_311776 ?auto_311777 ) ) ( not ( = ?auto_311776 ?auto_311778 ) ) ( not ( = ?auto_311776 ?auto_311779 ) ) ( not ( = ?auto_311776 ?auto_311780 ) ) ( not ( = ?auto_311777 ?auto_311778 ) ) ( not ( = ?auto_311777 ?auto_311779 ) ) ( not ( = ?auto_311777 ?auto_311780 ) ) ( not ( = ?auto_311778 ?auto_311779 ) ) ( not ( = ?auto_311778 ?auto_311780 ) ) ( not ( = ?auto_311779 ?auto_311780 ) ) ( ON ?auto_311778 ?auto_311779 ) ( ON ?auto_311777 ?auto_311778 ) ( ON ?auto_311776 ?auto_311777 ) ( ON ?auto_311775 ?auto_311776 ) ( ON ?auto_311774 ?auto_311775 ) ( ON ?auto_311773 ?auto_311774 ) ( ON ?auto_311772 ?auto_311773 ) ( CLEAR ?auto_311770 ) ( ON ?auto_311771 ?auto_311772 ) ( CLEAR ?auto_311771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_311768 ?auto_311769 ?auto_311770 ?auto_311771 )
      ( MAKE-12PILE ?auto_311768 ?auto_311769 ?auto_311770 ?auto_311771 ?auto_311772 ?auto_311773 ?auto_311774 ?auto_311775 ?auto_311776 ?auto_311777 ?auto_311778 ?auto_311779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311818 - BLOCK
      ?auto_311819 - BLOCK
      ?auto_311820 - BLOCK
      ?auto_311821 - BLOCK
      ?auto_311822 - BLOCK
      ?auto_311823 - BLOCK
      ?auto_311824 - BLOCK
      ?auto_311825 - BLOCK
      ?auto_311826 - BLOCK
      ?auto_311827 - BLOCK
      ?auto_311828 - BLOCK
      ?auto_311829 - BLOCK
    )
    :vars
    (
      ?auto_311830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311829 ?auto_311830 ) ( ON-TABLE ?auto_311818 ) ( ON ?auto_311819 ?auto_311818 ) ( not ( = ?auto_311818 ?auto_311819 ) ) ( not ( = ?auto_311818 ?auto_311820 ) ) ( not ( = ?auto_311818 ?auto_311821 ) ) ( not ( = ?auto_311818 ?auto_311822 ) ) ( not ( = ?auto_311818 ?auto_311823 ) ) ( not ( = ?auto_311818 ?auto_311824 ) ) ( not ( = ?auto_311818 ?auto_311825 ) ) ( not ( = ?auto_311818 ?auto_311826 ) ) ( not ( = ?auto_311818 ?auto_311827 ) ) ( not ( = ?auto_311818 ?auto_311828 ) ) ( not ( = ?auto_311818 ?auto_311829 ) ) ( not ( = ?auto_311818 ?auto_311830 ) ) ( not ( = ?auto_311819 ?auto_311820 ) ) ( not ( = ?auto_311819 ?auto_311821 ) ) ( not ( = ?auto_311819 ?auto_311822 ) ) ( not ( = ?auto_311819 ?auto_311823 ) ) ( not ( = ?auto_311819 ?auto_311824 ) ) ( not ( = ?auto_311819 ?auto_311825 ) ) ( not ( = ?auto_311819 ?auto_311826 ) ) ( not ( = ?auto_311819 ?auto_311827 ) ) ( not ( = ?auto_311819 ?auto_311828 ) ) ( not ( = ?auto_311819 ?auto_311829 ) ) ( not ( = ?auto_311819 ?auto_311830 ) ) ( not ( = ?auto_311820 ?auto_311821 ) ) ( not ( = ?auto_311820 ?auto_311822 ) ) ( not ( = ?auto_311820 ?auto_311823 ) ) ( not ( = ?auto_311820 ?auto_311824 ) ) ( not ( = ?auto_311820 ?auto_311825 ) ) ( not ( = ?auto_311820 ?auto_311826 ) ) ( not ( = ?auto_311820 ?auto_311827 ) ) ( not ( = ?auto_311820 ?auto_311828 ) ) ( not ( = ?auto_311820 ?auto_311829 ) ) ( not ( = ?auto_311820 ?auto_311830 ) ) ( not ( = ?auto_311821 ?auto_311822 ) ) ( not ( = ?auto_311821 ?auto_311823 ) ) ( not ( = ?auto_311821 ?auto_311824 ) ) ( not ( = ?auto_311821 ?auto_311825 ) ) ( not ( = ?auto_311821 ?auto_311826 ) ) ( not ( = ?auto_311821 ?auto_311827 ) ) ( not ( = ?auto_311821 ?auto_311828 ) ) ( not ( = ?auto_311821 ?auto_311829 ) ) ( not ( = ?auto_311821 ?auto_311830 ) ) ( not ( = ?auto_311822 ?auto_311823 ) ) ( not ( = ?auto_311822 ?auto_311824 ) ) ( not ( = ?auto_311822 ?auto_311825 ) ) ( not ( = ?auto_311822 ?auto_311826 ) ) ( not ( = ?auto_311822 ?auto_311827 ) ) ( not ( = ?auto_311822 ?auto_311828 ) ) ( not ( = ?auto_311822 ?auto_311829 ) ) ( not ( = ?auto_311822 ?auto_311830 ) ) ( not ( = ?auto_311823 ?auto_311824 ) ) ( not ( = ?auto_311823 ?auto_311825 ) ) ( not ( = ?auto_311823 ?auto_311826 ) ) ( not ( = ?auto_311823 ?auto_311827 ) ) ( not ( = ?auto_311823 ?auto_311828 ) ) ( not ( = ?auto_311823 ?auto_311829 ) ) ( not ( = ?auto_311823 ?auto_311830 ) ) ( not ( = ?auto_311824 ?auto_311825 ) ) ( not ( = ?auto_311824 ?auto_311826 ) ) ( not ( = ?auto_311824 ?auto_311827 ) ) ( not ( = ?auto_311824 ?auto_311828 ) ) ( not ( = ?auto_311824 ?auto_311829 ) ) ( not ( = ?auto_311824 ?auto_311830 ) ) ( not ( = ?auto_311825 ?auto_311826 ) ) ( not ( = ?auto_311825 ?auto_311827 ) ) ( not ( = ?auto_311825 ?auto_311828 ) ) ( not ( = ?auto_311825 ?auto_311829 ) ) ( not ( = ?auto_311825 ?auto_311830 ) ) ( not ( = ?auto_311826 ?auto_311827 ) ) ( not ( = ?auto_311826 ?auto_311828 ) ) ( not ( = ?auto_311826 ?auto_311829 ) ) ( not ( = ?auto_311826 ?auto_311830 ) ) ( not ( = ?auto_311827 ?auto_311828 ) ) ( not ( = ?auto_311827 ?auto_311829 ) ) ( not ( = ?auto_311827 ?auto_311830 ) ) ( not ( = ?auto_311828 ?auto_311829 ) ) ( not ( = ?auto_311828 ?auto_311830 ) ) ( not ( = ?auto_311829 ?auto_311830 ) ) ( ON ?auto_311828 ?auto_311829 ) ( ON ?auto_311827 ?auto_311828 ) ( ON ?auto_311826 ?auto_311827 ) ( ON ?auto_311825 ?auto_311826 ) ( ON ?auto_311824 ?auto_311825 ) ( ON ?auto_311823 ?auto_311824 ) ( ON ?auto_311822 ?auto_311823 ) ( ON ?auto_311821 ?auto_311822 ) ( CLEAR ?auto_311819 ) ( ON ?auto_311820 ?auto_311821 ) ( CLEAR ?auto_311820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_311818 ?auto_311819 ?auto_311820 )
      ( MAKE-12PILE ?auto_311818 ?auto_311819 ?auto_311820 ?auto_311821 ?auto_311822 ?auto_311823 ?auto_311824 ?auto_311825 ?auto_311826 ?auto_311827 ?auto_311828 ?auto_311829 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311868 - BLOCK
      ?auto_311869 - BLOCK
      ?auto_311870 - BLOCK
      ?auto_311871 - BLOCK
      ?auto_311872 - BLOCK
      ?auto_311873 - BLOCK
      ?auto_311874 - BLOCK
      ?auto_311875 - BLOCK
      ?auto_311876 - BLOCK
      ?auto_311877 - BLOCK
      ?auto_311878 - BLOCK
      ?auto_311879 - BLOCK
    )
    :vars
    (
      ?auto_311880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311879 ?auto_311880 ) ( ON-TABLE ?auto_311868 ) ( not ( = ?auto_311868 ?auto_311869 ) ) ( not ( = ?auto_311868 ?auto_311870 ) ) ( not ( = ?auto_311868 ?auto_311871 ) ) ( not ( = ?auto_311868 ?auto_311872 ) ) ( not ( = ?auto_311868 ?auto_311873 ) ) ( not ( = ?auto_311868 ?auto_311874 ) ) ( not ( = ?auto_311868 ?auto_311875 ) ) ( not ( = ?auto_311868 ?auto_311876 ) ) ( not ( = ?auto_311868 ?auto_311877 ) ) ( not ( = ?auto_311868 ?auto_311878 ) ) ( not ( = ?auto_311868 ?auto_311879 ) ) ( not ( = ?auto_311868 ?auto_311880 ) ) ( not ( = ?auto_311869 ?auto_311870 ) ) ( not ( = ?auto_311869 ?auto_311871 ) ) ( not ( = ?auto_311869 ?auto_311872 ) ) ( not ( = ?auto_311869 ?auto_311873 ) ) ( not ( = ?auto_311869 ?auto_311874 ) ) ( not ( = ?auto_311869 ?auto_311875 ) ) ( not ( = ?auto_311869 ?auto_311876 ) ) ( not ( = ?auto_311869 ?auto_311877 ) ) ( not ( = ?auto_311869 ?auto_311878 ) ) ( not ( = ?auto_311869 ?auto_311879 ) ) ( not ( = ?auto_311869 ?auto_311880 ) ) ( not ( = ?auto_311870 ?auto_311871 ) ) ( not ( = ?auto_311870 ?auto_311872 ) ) ( not ( = ?auto_311870 ?auto_311873 ) ) ( not ( = ?auto_311870 ?auto_311874 ) ) ( not ( = ?auto_311870 ?auto_311875 ) ) ( not ( = ?auto_311870 ?auto_311876 ) ) ( not ( = ?auto_311870 ?auto_311877 ) ) ( not ( = ?auto_311870 ?auto_311878 ) ) ( not ( = ?auto_311870 ?auto_311879 ) ) ( not ( = ?auto_311870 ?auto_311880 ) ) ( not ( = ?auto_311871 ?auto_311872 ) ) ( not ( = ?auto_311871 ?auto_311873 ) ) ( not ( = ?auto_311871 ?auto_311874 ) ) ( not ( = ?auto_311871 ?auto_311875 ) ) ( not ( = ?auto_311871 ?auto_311876 ) ) ( not ( = ?auto_311871 ?auto_311877 ) ) ( not ( = ?auto_311871 ?auto_311878 ) ) ( not ( = ?auto_311871 ?auto_311879 ) ) ( not ( = ?auto_311871 ?auto_311880 ) ) ( not ( = ?auto_311872 ?auto_311873 ) ) ( not ( = ?auto_311872 ?auto_311874 ) ) ( not ( = ?auto_311872 ?auto_311875 ) ) ( not ( = ?auto_311872 ?auto_311876 ) ) ( not ( = ?auto_311872 ?auto_311877 ) ) ( not ( = ?auto_311872 ?auto_311878 ) ) ( not ( = ?auto_311872 ?auto_311879 ) ) ( not ( = ?auto_311872 ?auto_311880 ) ) ( not ( = ?auto_311873 ?auto_311874 ) ) ( not ( = ?auto_311873 ?auto_311875 ) ) ( not ( = ?auto_311873 ?auto_311876 ) ) ( not ( = ?auto_311873 ?auto_311877 ) ) ( not ( = ?auto_311873 ?auto_311878 ) ) ( not ( = ?auto_311873 ?auto_311879 ) ) ( not ( = ?auto_311873 ?auto_311880 ) ) ( not ( = ?auto_311874 ?auto_311875 ) ) ( not ( = ?auto_311874 ?auto_311876 ) ) ( not ( = ?auto_311874 ?auto_311877 ) ) ( not ( = ?auto_311874 ?auto_311878 ) ) ( not ( = ?auto_311874 ?auto_311879 ) ) ( not ( = ?auto_311874 ?auto_311880 ) ) ( not ( = ?auto_311875 ?auto_311876 ) ) ( not ( = ?auto_311875 ?auto_311877 ) ) ( not ( = ?auto_311875 ?auto_311878 ) ) ( not ( = ?auto_311875 ?auto_311879 ) ) ( not ( = ?auto_311875 ?auto_311880 ) ) ( not ( = ?auto_311876 ?auto_311877 ) ) ( not ( = ?auto_311876 ?auto_311878 ) ) ( not ( = ?auto_311876 ?auto_311879 ) ) ( not ( = ?auto_311876 ?auto_311880 ) ) ( not ( = ?auto_311877 ?auto_311878 ) ) ( not ( = ?auto_311877 ?auto_311879 ) ) ( not ( = ?auto_311877 ?auto_311880 ) ) ( not ( = ?auto_311878 ?auto_311879 ) ) ( not ( = ?auto_311878 ?auto_311880 ) ) ( not ( = ?auto_311879 ?auto_311880 ) ) ( ON ?auto_311878 ?auto_311879 ) ( ON ?auto_311877 ?auto_311878 ) ( ON ?auto_311876 ?auto_311877 ) ( ON ?auto_311875 ?auto_311876 ) ( ON ?auto_311874 ?auto_311875 ) ( ON ?auto_311873 ?auto_311874 ) ( ON ?auto_311872 ?auto_311873 ) ( ON ?auto_311871 ?auto_311872 ) ( ON ?auto_311870 ?auto_311871 ) ( CLEAR ?auto_311868 ) ( ON ?auto_311869 ?auto_311870 ) ( CLEAR ?auto_311869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_311868 ?auto_311869 )
      ( MAKE-12PILE ?auto_311868 ?auto_311869 ?auto_311870 ?auto_311871 ?auto_311872 ?auto_311873 ?auto_311874 ?auto_311875 ?auto_311876 ?auto_311877 ?auto_311878 ?auto_311879 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_311918 - BLOCK
      ?auto_311919 - BLOCK
      ?auto_311920 - BLOCK
      ?auto_311921 - BLOCK
      ?auto_311922 - BLOCK
      ?auto_311923 - BLOCK
      ?auto_311924 - BLOCK
      ?auto_311925 - BLOCK
      ?auto_311926 - BLOCK
      ?auto_311927 - BLOCK
      ?auto_311928 - BLOCK
      ?auto_311929 - BLOCK
    )
    :vars
    (
      ?auto_311930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_311929 ?auto_311930 ) ( not ( = ?auto_311918 ?auto_311919 ) ) ( not ( = ?auto_311918 ?auto_311920 ) ) ( not ( = ?auto_311918 ?auto_311921 ) ) ( not ( = ?auto_311918 ?auto_311922 ) ) ( not ( = ?auto_311918 ?auto_311923 ) ) ( not ( = ?auto_311918 ?auto_311924 ) ) ( not ( = ?auto_311918 ?auto_311925 ) ) ( not ( = ?auto_311918 ?auto_311926 ) ) ( not ( = ?auto_311918 ?auto_311927 ) ) ( not ( = ?auto_311918 ?auto_311928 ) ) ( not ( = ?auto_311918 ?auto_311929 ) ) ( not ( = ?auto_311918 ?auto_311930 ) ) ( not ( = ?auto_311919 ?auto_311920 ) ) ( not ( = ?auto_311919 ?auto_311921 ) ) ( not ( = ?auto_311919 ?auto_311922 ) ) ( not ( = ?auto_311919 ?auto_311923 ) ) ( not ( = ?auto_311919 ?auto_311924 ) ) ( not ( = ?auto_311919 ?auto_311925 ) ) ( not ( = ?auto_311919 ?auto_311926 ) ) ( not ( = ?auto_311919 ?auto_311927 ) ) ( not ( = ?auto_311919 ?auto_311928 ) ) ( not ( = ?auto_311919 ?auto_311929 ) ) ( not ( = ?auto_311919 ?auto_311930 ) ) ( not ( = ?auto_311920 ?auto_311921 ) ) ( not ( = ?auto_311920 ?auto_311922 ) ) ( not ( = ?auto_311920 ?auto_311923 ) ) ( not ( = ?auto_311920 ?auto_311924 ) ) ( not ( = ?auto_311920 ?auto_311925 ) ) ( not ( = ?auto_311920 ?auto_311926 ) ) ( not ( = ?auto_311920 ?auto_311927 ) ) ( not ( = ?auto_311920 ?auto_311928 ) ) ( not ( = ?auto_311920 ?auto_311929 ) ) ( not ( = ?auto_311920 ?auto_311930 ) ) ( not ( = ?auto_311921 ?auto_311922 ) ) ( not ( = ?auto_311921 ?auto_311923 ) ) ( not ( = ?auto_311921 ?auto_311924 ) ) ( not ( = ?auto_311921 ?auto_311925 ) ) ( not ( = ?auto_311921 ?auto_311926 ) ) ( not ( = ?auto_311921 ?auto_311927 ) ) ( not ( = ?auto_311921 ?auto_311928 ) ) ( not ( = ?auto_311921 ?auto_311929 ) ) ( not ( = ?auto_311921 ?auto_311930 ) ) ( not ( = ?auto_311922 ?auto_311923 ) ) ( not ( = ?auto_311922 ?auto_311924 ) ) ( not ( = ?auto_311922 ?auto_311925 ) ) ( not ( = ?auto_311922 ?auto_311926 ) ) ( not ( = ?auto_311922 ?auto_311927 ) ) ( not ( = ?auto_311922 ?auto_311928 ) ) ( not ( = ?auto_311922 ?auto_311929 ) ) ( not ( = ?auto_311922 ?auto_311930 ) ) ( not ( = ?auto_311923 ?auto_311924 ) ) ( not ( = ?auto_311923 ?auto_311925 ) ) ( not ( = ?auto_311923 ?auto_311926 ) ) ( not ( = ?auto_311923 ?auto_311927 ) ) ( not ( = ?auto_311923 ?auto_311928 ) ) ( not ( = ?auto_311923 ?auto_311929 ) ) ( not ( = ?auto_311923 ?auto_311930 ) ) ( not ( = ?auto_311924 ?auto_311925 ) ) ( not ( = ?auto_311924 ?auto_311926 ) ) ( not ( = ?auto_311924 ?auto_311927 ) ) ( not ( = ?auto_311924 ?auto_311928 ) ) ( not ( = ?auto_311924 ?auto_311929 ) ) ( not ( = ?auto_311924 ?auto_311930 ) ) ( not ( = ?auto_311925 ?auto_311926 ) ) ( not ( = ?auto_311925 ?auto_311927 ) ) ( not ( = ?auto_311925 ?auto_311928 ) ) ( not ( = ?auto_311925 ?auto_311929 ) ) ( not ( = ?auto_311925 ?auto_311930 ) ) ( not ( = ?auto_311926 ?auto_311927 ) ) ( not ( = ?auto_311926 ?auto_311928 ) ) ( not ( = ?auto_311926 ?auto_311929 ) ) ( not ( = ?auto_311926 ?auto_311930 ) ) ( not ( = ?auto_311927 ?auto_311928 ) ) ( not ( = ?auto_311927 ?auto_311929 ) ) ( not ( = ?auto_311927 ?auto_311930 ) ) ( not ( = ?auto_311928 ?auto_311929 ) ) ( not ( = ?auto_311928 ?auto_311930 ) ) ( not ( = ?auto_311929 ?auto_311930 ) ) ( ON ?auto_311928 ?auto_311929 ) ( ON ?auto_311927 ?auto_311928 ) ( ON ?auto_311926 ?auto_311927 ) ( ON ?auto_311925 ?auto_311926 ) ( ON ?auto_311924 ?auto_311925 ) ( ON ?auto_311923 ?auto_311924 ) ( ON ?auto_311922 ?auto_311923 ) ( ON ?auto_311921 ?auto_311922 ) ( ON ?auto_311920 ?auto_311921 ) ( ON ?auto_311919 ?auto_311920 ) ( ON ?auto_311918 ?auto_311919 ) ( CLEAR ?auto_311918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_311918 )
      ( MAKE-12PILE ?auto_311918 ?auto_311919 ?auto_311920 ?auto_311921 ?auto_311922 ?auto_311923 ?auto_311924 ?auto_311925 ?auto_311926 ?auto_311927 ?auto_311928 ?auto_311929 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_311969 - BLOCK
      ?auto_311970 - BLOCK
      ?auto_311971 - BLOCK
      ?auto_311972 - BLOCK
      ?auto_311973 - BLOCK
      ?auto_311974 - BLOCK
      ?auto_311975 - BLOCK
      ?auto_311976 - BLOCK
      ?auto_311977 - BLOCK
      ?auto_311978 - BLOCK
      ?auto_311979 - BLOCK
      ?auto_311980 - BLOCK
      ?auto_311981 - BLOCK
    )
    :vars
    (
      ?auto_311982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_311980 ) ( ON ?auto_311981 ?auto_311982 ) ( CLEAR ?auto_311981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_311969 ) ( ON ?auto_311970 ?auto_311969 ) ( ON ?auto_311971 ?auto_311970 ) ( ON ?auto_311972 ?auto_311971 ) ( ON ?auto_311973 ?auto_311972 ) ( ON ?auto_311974 ?auto_311973 ) ( ON ?auto_311975 ?auto_311974 ) ( ON ?auto_311976 ?auto_311975 ) ( ON ?auto_311977 ?auto_311976 ) ( ON ?auto_311978 ?auto_311977 ) ( ON ?auto_311979 ?auto_311978 ) ( ON ?auto_311980 ?auto_311979 ) ( not ( = ?auto_311969 ?auto_311970 ) ) ( not ( = ?auto_311969 ?auto_311971 ) ) ( not ( = ?auto_311969 ?auto_311972 ) ) ( not ( = ?auto_311969 ?auto_311973 ) ) ( not ( = ?auto_311969 ?auto_311974 ) ) ( not ( = ?auto_311969 ?auto_311975 ) ) ( not ( = ?auto_311969 ?auto_311976 ) ) ( not ( = ?auto_311969 ?auto_311977 ) ) ( not ( = ?auto_311969 ?auto_311978 ) ) ( not ( = ?auto_311969 ?auto_311979 ) ) ( not ( = ?auto_311969 ?auto_311980 ) ) ( not ( = ?auto_311969 ?auto_311981 ) ) ( not ( = ?auto_311969 ?auto_311982 ) ) ( not ( = ?auto_311970 ?auto_311971 ) ) ( not ( = ?auto_311970 ?auto_311972 ) ) ( not ( = ?auto_311970 ?auto_311973 ) ) ( not ( = ?auto_311970 ?auto_311974 ) ) ( not ( = ?auto_311970 ?auto_311975 ) ) ( not ( = ?auto_311970 ?auto_311976 ) ) ( not ( = ?auto_311970 ?auto_311977 ) ) ( not ( = ?auto_311970 ?auto_311978 ) ) ( not ( = ?auto_311970 ?auto_311979 ) ) ( not ( = ?auto_311970 ?auto_311980 ) ) ( not ( = ?auto_311970 ?auto_311981 ) ) ( not ( = ?auto_311970 ?auto_311982 ) ) ( not ( = ?auto_311971 ?auto_311972 ) ) ( not ( = ?auto_311971 ?auto_311973 ) ) ( not ( = ?auto_311971 ?auto_311974 ) ) ( not ( = ?auto_311971 ?auto_311975 ) ) ( not ( = ?auto_311971 ?auto_311976 ) ) ( not ( = ?auto_311971 ?auto_311977 ) ) ( not ( = ?auto_311971 ?auto_311978 ) ) ( not ( = ?auto_311971 ?auto_311979 ) ) ( not ( = ?auto_311971 ?auto_311980 ) ) ( not ( = ?auto_311971 ?auto_311981 ) ) ( not ( = ?auto_311971 ?auto_311982 ) ) ( not ( = ?auto_311972 ?auto_311973 ) ) ( not ( = ?auto_311972 ?auto_311974 ) ) ( not ( = ?auto_311972 ?auto_311975 ) ) ( not ( = ?auto_311972 ?auto_311976 ) ) ( not ( = ?auto_311972 ?auto_311977 ) ) ( not ( = ?auto_311972 ?auto_311978 ) ) ( not ( = ?auto_311972 ?auto_311979 ) ) ( not ( = ?auto_311972 ?auto_311980 ) ) ( not ( = ?auto_311972 ?auto_311981 ) ) ( not ( = ?auto_311972 ?auto_311982 ) ) ( not ( = ?auto_311973 ?auto_311974 ) ) ( not ( = ?auto_311973 ?auto_311975 ) ) ( not ( = ?auto_311973 ?auto_311976 ) ) ( not ( = ?auto_311973 ?auto_311977 ) ) ( not ( = ?auto_311973 ?auto_311978 ) ) ( not ( = ?auto_311973 ?auto_311979 ) ) ( not ( = ?auto_311973 ?auto_311980 ) ) ( not ( = ?auto_311973 ?auto_311981 ) ) ( not ( = ?auto_311973 ?auto_311982 ) ) ( not ( = ?auto_311974 ?auto_311975 ) ) ( not ( = ?auto_311974 ?auto_311976 ) ) ( not ( = ?auto_311974 ?auto_311977 ) ) ( not ( = ?auto_311974 ?auto_311978 ) ) ( not ( = ?auto_311974 ?auto_311979 ) ) ( not ( = ?auto_311974 ?auto_311980 ) ) ( not ( = ?auto_311974 ?auto_311981 ) ) ( not ( = ?auto_311974 ?auto_311982 ) ) ( not ( = ?auto_311975 ?auto_311976 ) ) ( not ( = ?auto_311975 ?auto_311977 ) ) ( not ( = ?auto_311975 ?auto_311978 ) ) ( not ( = ?auto_311975 ?auto_311979 ) ) ( not ( = ?auto_311975 ?auto_311980 ) ) ( not ( = ?auto_311975 ?auto_311981 ) ) ( not ( = ?auto_311975 ?auto_311982 ) ) ( not ( = ?auto_311976 ?auto_311977 ) ) ( not ( = ?auto_311976 ?auto_311978 ) ) ( not ( = ?auto_311976 ?auto_311979 ) ) ( not ( = ?auto_311976 ?auto_311980 ) ) ( not ( = ?auto_311976 ?auto_311981 ) ) ( not ( = ?auto_311976 ?auto_311982 ) ) ( not ( = ?auto_311977 ?auto_311978 ) ) ( not ( = ?auto_311977 ?auto_311979 ) ) ( not ( = ?auto_311977 ?auto_311980 ) ) ( not ( = ?auto_311977 ?auto_311981 ) ) ( not ( = ?auto_311977 ?auto_311982 ) ) ( not ( = ?auto_311978 ?auto_311979 ) ) ( not ( = ?auto_311978 ?auto_311980 ) ) ( not ( = ?auto_311978 ?auto_311981 ) ) ( not ( = ?auto_311978 ?auto_311982 ) ) ( not ( = ?auto_311979 ?auto_311980 ) ) ( not ( = ?auto_311979 ?auto_311981 ) ) ( not ( = ?auto_311979 ?auto_311982 ) ) ( not ( = ?auto_311980 ?auto_311981 ) ) ( not ( = ?auto_311980 ?auto_311982 ) ) ( not ( = ?auto_311981 ?auto_311982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_311981 ?auto_311982 )
      ( !STACK ?auto_311981 ?auto_311980 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312023 - BLOCK
      ?auto_312024 - BLOCK
      ?auto_312025 - BLOCK
      ?auto_312026 - BLOCK
      ?auto_312027 - BLOCK
      ?auto_312028 - BLOCK
      ?auto_312029 - BLOCK
      ?auto_312030 - BLOCK
      ?auto_312031 - BLOCK
      ?auto_312032 - BLOCK
      ?auto_312033 - BLOCK
      ?auto_312034 - BLOCK
      ?auto_312035 - BLOCK
    )
    :vars
    (
      ?auto_312036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312035 ?auto_312036 ) ( ON-TABLE ?auto_312023 ) ( ON ?auto_312024 ?auto_312023 ) ( ON ?auto_312025 ?auto_312024 ) ( ON ?auto_312026 ?auto_312025 ) ( ON ?auto_312027 ?auto_312026 ) ( ON ?auto_312028 ?auto_312027 ) ( ON ?auto_312029 ?auto_312028 ) ( ON ?auto_312030 ?auto_312029 ) ( ON ?auto_312031 ?auto_312030 ) ( ON ?auto_312032 ?auto_312031 ) ( ON ?auto_312033 ?auto_312032 ) ( not ( = ?auto_312023 ?auto_312024 ) ) ( not ( = ?auto_312023 ?auto_312025 ) ) ( not ( = ?auto_312023 ?auto_312026 ) ) ( not ( = ?auto_312023 ?auto_312027 ) ) ( not ( = ?auto_312023 ?auto_312028 ) ) ( not ( = ?auto_312023 ?auto_312029 ) ) ( not ( = ?auto_312023 ?auto_312030 ) ) ( not ( = ?auto_312023 ?auto_312031 ) ) ( not ( = ?auto_312023 ?auto_312032 ) ) ( not ( = ?auto_312023 ?auto_312033 ) ) ( not ( = ?auto_312023 ?auto_312034 ) ) ( not ( = ?auto_312023 ?auto_312035 ) ) ( not ( = ?auto_312023 ?auto_312036 ) ) ( not ( = ?auto_312024 ?auto_312025 ) ) ( not ( = ?auto_312024 ?auto_312026 ) ) ( not ( = ?auto_312024 ?auto_312027 ) ) ( not ( = ?auto_312024 ?auto_312028 ) ) ( not ( = ?auto_312024 ?auto_312029 ) ) ( not ( = ?auto_312024 ?auto_312030 ) ) ( not ( = ?auto_312024 ?auto_312031 ) ) ( not ( = ?auto_312024 ?auto_312032 ) ) ( not ( = ?auto_312024 ?auto_312033 ) ) ( not ( = ?auto_312024 ?auto_312034 ) ) ( not ( = ?auto_312024 ?auto_312035 ) ) ( not ( = ?auto_312024 ?auto_312036 ) ) ( not ( = ?auto_312025 ?auto_312026 ) ) ( not ( = ?auto_312025 ?auto_312027 ) ) ( not ( = ?auto_312025 ?auto_312028 ) ) ( not ( = ?auto_312025 ?auto_312029 ) ) ( not ( = ?auto_312025 ?auto_312030 ) ) ( not ( = ?auto_312025 ?auto_312031 ) ) ( not ( = ?auto_312025 ?auto_312032 ) ) ( not ( = ?auto_312025 ?auto_312033 ) ) ( not ( = ?auto_312025 ?auto_312034 ) ) ( not ( = ?auto_312025 ?auto_312035 ) ) ( not ( = ?auto_312025 ?auto_312036 ) ) ( not ( = ?auto_312026 ?auto_312027 ) ) ( not ( = ?auto_312026 ?auto_312028 ) ) ( not ( = ?auto_312026 ?auto_312029 ) ) ( not ( = ?auto_312026 ?auto_312030 ) ) ( not ( = ?auto_312026 ?auto_312031 ) ) ( not ( = ?auto_312026 ?auto_312032 ) ) ( not ( = ?auto_312026 ?auto_312033 ) ) ( not ( = ?auto_312026 ?auto_312034 ) ) ( not ( = ?auto_312026 ?auto_312035 ) ) ( not ( = ?auto_312026 ?auto_312036 ) ) ( not ( = ?auto_312027 ?auto_312028 ) ) ( not ( = ?auto_312027 ?auto_312029 ) ) ( not ( = ?auto_312027 ?auto_312030 ) ) ( not ( = ?auto_312027 ?auto_312031 ) ) ( not ( = ?auto_312027 ?auto_312032 ) ) ( not ( = ?auto_312027 ?auto_312033 ) ) ( not ( = ?auto_312027 ?auto_312034 ) ) ( not ( = ?auto_312027 ?auto_312035 ) ) ( not ( = ?auto_312027 ?auto_312036 ) ) ( not ( = ?auto_312028 ?auto_312029 ) ) ( not ( = ?auto_312028 ?auto_312030 ) ) ( not ( = ?auto_312028 ?auto_312031 ) ) ( not ( = ?auto_312028 ?auto_312032 ) ) ( not ( = ?auto_312028 ?auto_312033 ) ) ( not ( = ?auto_312028 ?auto_312034 ) ) ( not ( = ?auto_312028 ?auto_312035 ) ) ( not ( = ?auto_312028 ?auto_312036 ) ) ( not ( = ?auto_312029 ?auto_312030 ) ) ( not ( = ?auto_312029 ?auto_312031 ) ) ( not ( = ?auto_312029 ?auto_312032 ) ) ( not ( = ?auto_312029 ?auto_312033 ) ) ( not ( = ?auto_312029 ?auto_312034 ) ) ( not ( = ?auto_312029 ?auto_312035 ) ) ( not ( = ?auto_312029 ?auto_312036 ) ) ( not ( = ?auto_312030 ?auto_312031 ) ) ( not ( = ?auto_312030 ?auto_312032 ) ) ( not ( = ?auto_312030 ?auto_312033 ) ) ( not ( = ?auto_312030 ?auto_312034 ) ) ( not ( = ?auto_312030 ?auto_312035 ) ) ( not ( = ?auto_312030 ?auto_312036 ) ) ( not ( = ?auto_312031 ?auto_312032 ) ) ( not ( = ?auto_312031 ?auto_312033 ) ) ( not ( = ?auto_312031 ?auto_312034 ) ) ( not ( = ?auto_312031 ?auto_312035 ) ) ( not ( = ?auto_312031 ?auto_312036 ) ) ( not ( = ?auto_312032 ?auto_312033 ) ) ( not ( = ?auto_312032 ?auto_312034 ) ) ( not ( = ?auto_312032 ?auto_312035 ) ) ( not ( = ?auto_312032 ?auto_312036 ) ) ( not ( = ?auto_312033 ?auto_312034 ) ) ( not ( = ?auto_312033 ?auto_312035 ) ) ( not ( = ?auto_312033 ?auto_312036 ) ) ( not ( = ?auto_312034 ?auto_312035 ) ) ( not ( = ?auto_312034 ?auto_312036 ) ) ( not ( = ?auto_312035 ?auto_312036 ) ) ( CLEAR ?auto_312033 ) ( ON ?auto_312034 ?auto_312035 ) ( CLEAR ?auto_312034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_312023 ?auto_312024 ?auto_312025 ?auto_312026 ?auto_312027 ?auto_312028 ?auto_312029 ?auto_312030 ?auto_312031 ?auto_312032 ?auto_312033 ?auto_312034 )
      ( MAKE-13PILE ?auto_312023 ?auto_312024 ?auto_312025 ?auto_312026 ?auto_312027 ?auto_312028 ?auto_312029 ?auto_312030 ?auto_312031 ?auto_312032 ?auto_312033 ?auto_312034 ?auto_312035 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312077 - BLOCK
      ?auto_312078 - BLOCK
      ?auto_312079 - BLOCK
      ?auto_312080 - BLOCK
      ?auto_312081 - BLOCK
      ?auto_312082 - BLOCK
      ?auto_312083 - BLOCK
      ?auto_312084 - BLOCK
      ?auto_312085 - BLOCK
      ?auto_312086 - BLOCK
      ?auto_312087 - BLOCK
      ?auto_312088 - BLOCK
      ?auto_312089 - BLOCK
    )
    :vars
    (
      ?auto_312090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312089 ?auto_312090 ) ( ON-TABLE ?auto_312077 ) ( ON ?auto_312078 ?auto_312077 ) ( ON ?auto_312079 ?auto_312078 ) ( ON ?auto_312080 ?auto_312079 ) ( ON ?auto_312081 ?auto_312080 ) ( ON ?auto_312082 ?auto_312081 ) ( ON ?auto_312083 ?auto_312082 ) ( ON ?auto_312084 ?auto_312083 ) ( ON ?auto_312085 ?auto_312084 ) ( ON ?auto_312086 ?auto_312085 ) ( not ( = ?auto_312077 ?auto_312078 ) ) ( not ( = ?auto_312077 ?auto_312079 ) ) ( not ( = ?auto_312077 ?auto_312080 ) ) ( not ( = ?auto_312077 ?auto_312081 ) ) ( not ( = ?auto_312077 ?auto_312082 ) ) ( not ( = ?auto_312077 ?auto_312083 ) ) ( not ( = ?auto_312077 ?auto_312084 ) ) ( not ( = ?auto_312077 ?auto_312085 ) ) ( not ( = ?auto_312077 ?auto_312086 ) ) ( not ( = ?auto_312077 ?auto_312087 ) ) ( not ( = ?auto_312077 ?auto_312088 ) ) ( not ( = ?auto_312077 ?auto_312089 ) ) ( not ( = ?auto_312077 ?auto_312090 ) ) ( not ( = ?auto_312078 ?auto_312079 ) ) ( not ( = ?auto_312078 ?auto_312080 ) ) ( not ( = ?auto_312078 ?auto_312081 ) ) ( not ( = ?auto_312078 ?auto_312082 ) ) ( not ( = ?auto_312078 ?auto_312083 ) ) ( not ( = ?auto_312078 ?auto_312084 ) ) ( not ( = ?auto_312078 ?auto_312085 ) ) ( not ( = ?auto_312078 ?auto_312086 ) ) ( not ( = ?auto_312078 ?auto_312087 ) ) ( not ( = ?auto_312078 ?auto_312088 ) ) ( not ( = ?auto_312078 ?auto_312089 ) ) ( not ( = ?auto_312078 ?auto_312090 ) ) ( not ( = ?auto_312079 ?auto_312080 ) ) ( not ( = ?auto_312079 ?auto_312081 ) ) ( not ( = ?auto_312079 ?auto_312082 ) ) ( not ( = ?auto_312079 ?auto_312083 ) ) ( not ( = ?auto_312079 ?auto_312084 ) ) ( not ( = ?auto_312079 ?auto_312085 ) ) ( not ( = ?auto_312079 ?auto_312086 ) ) ( not ( = ?auto_312079 ?auto_312087 ) ) ( not ( = ?auto_312079 ?auto_312088 ) ) ( not ( = ?auto_312079 ?auto_312089 ) ) ( not ( = ?auto_312079 ?auto_312090 ) ) ( not ( = ?auto_312080 ?auto_312081 ) ) ( not ( = ?auto_312080 ?auto_312082 ) ) ( not ( = ?auto_312080 ?auto_312083 ) ) ( not ( = ?auto_312080 ?auto_312084 ) ) ( not ( = ?auto_312080 ?auto_312085 ) ) ( not ( = ?auto_312080 ?auto_312086 ) ) ( not ( = ?auto_312080 ?auto_312087 ) ) ( not ( = ?auto_312080 ?auto_312088 ) ) ( not ( = ?auto_312080 ?auto_312089 ) ) ( not ( = ?auto_312080 ?auto_312090 ) ) ( not ( = ?auto_312081 ?auto_312082 ) ) ( not ( = ?auto_312081 ?auto_312083 ) ) ( not ( = ?auto_312081 ?auto_312084 ) ) ( not ( = ?auto_312081 ?auto_312085 ) ) ( not ( = ?auto_312081 ?auto_312086 ) ) ( not ( = ?auto_312081 ?auto_312087 ) ) ( not ( = ?auto_312081 ?auto_312088 ) ) ( not ( = ?auto_312081 ?auto_312089 ) ) ( not ( = ?auto_312081 ?auto_312090 ) ) ( not ( = ?auto_312082 ?auto_312083 ) ) ( not ( = ?auto_312082 ?auto_312084 ) ) ( not ( = ?auto_312082 ?auto_312085 ) ) ( not ( = ?auto_312082 ?auto_312086 ) ) ( not ( = ?auto_312082 ?auto_312087 ) ) ( not ( = ?auto_312082 ?auto_312088 ) ) ( not ( = ?auto_312082 ?auto_312089 ) ) ( not ( = ?auto_312082 ?auto_312090 ) ) ( not ( = ?auto_312083 ?auto_312084 ) ) ( not ( = ?auto_312083 ?auto_312085 ) ) ( not ( = ?auto_312083 ?auto_312086 ) ) ( not ( = ?auto_312083 ?auto_312087 ) ) ( not ( = ?auto_312083 ?auto_312088 ) ) ( not ( = ?auto_312083 ?auto_312089 ) ) ( not ( = ?auto_312083 ?auto_312090 ) ) ( not ( = ?auto_312084 ?auto_312085 ) ) ( not ( = ?auto_312084 ?auto_312086 ) ) ( not ( = ?auto_312084 ?auto_312087 ) ) ( not ( = ?auto_312084 ?auto_312088 ) ) ( not ( = ?auto_312084 ?auto_312089 ) ) ( not ( = ?auto_312084 ?auto_312090 ) ) ( not ( = ?auto_312085 ?auto_312086 ) ) ( not ( = ?auto_312085 ?auto_312087 ) ) ( not ( = ?auto_312085 ?auto_312088 ) ) ( not ( = ?auto_312085 ?auto_312089 ) ) ( not ( = ?auto_312085 ?auto_312090 ) ) ( not ( = ?auto_312086 ?auto_312087 ) ) ( not ( = ?auto_312086 ?auto_312088 ) ) ( not ( = ?auto_312086 ?auto_312089 ) ) ( not ( = ?auto_312086 ?auto_312090 ) ) ( not ( = ?auto_312087 ?auto_312088 ) ) ( not ( = ?auto_312087 ?auto_312089 ) ) ( not ( = ?auto_312087 ?auto_312090 ) ) ( not ( = ?auto_312088 ?auto_312089 ) ) ( not ( = ?auto_312088 ?auto_312090 ) ) ( not ( = ?auto_312089 ?auto_312090 ) ) ( ON ?auto_312088 ?auto_312089 ) ( CLEAR ?auto_312086 ) ( ON ?auto_312087 ?auto_312088 ) ( CLEAR ?auto_312087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_312077 ?auto_312078 ?auto_312079 ?auto_312080 ?auto_312081 ?auto_312082 ?auto_312083 ?auto_312084 ?auto_312085 ?auto_312086 ?auto_312087 )
      ( MAKE-13PILE ?auto_312077 ?auto_312078 ?auto_312079 ?auto_312080 ?auto_312081 ?auto_312082 ?auto_312083 ?auto_312084 ?auto_312085 ?auto_312086 ?auto_312087 ?auto_312088 ?auto_312089 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312131 - BLOCK
      ?auto_312132 - BLOCK
      ?auto_312133 - BLOCK
      ?auto_312134 - BLOCK
      ?auto_312135 - BLOCK
      ?auto_312136 - BLOCK
      ?auto_312137 - BLOCK
      ?auto_312138 - BLOCK
      ?auto_312139 - BLOCK
      ?auto_312140 - BLOCK
      ?auto_312141 - BLOCK
      ?auto_312142 - BLOCK
      ?auto_312143 - BLOCK
    )
    :vars
    (
      ?auto_312144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312143 ?auto_312144 ) ( ON-TABLE ?auto_312131 ) ( ON ?auto_312132 ?auto_312131 ) ( ON ?auto_312133 ?auto_312132 ) ( ON ?auto_312134 ?auto_312133 ) ( ON ?auto_312135 ?auto_312134 ) ( ON ?auto_312136 ?auto_312135 ) ( ON ?auto_312137 ?auto_312136 ) ( ON ?auto_312138 ?auto_312137 ) ( ON ?auto_312139 ?auto_312138 ) ( not ( = ?auto_312131 ?auto_312132 ) ) ( not ( = ?auto_312131 ?auto_312133 ) ) ( not ( = ?auto_312131 ?auto_312134 ) ) ( not ( = ?auto_312131 ?auto_312135 ) ) ( not ( = ?auto_312131 ?auto_312136 ) ) ( not ( = ?auto_312131 ?auto_312137 ) ) ( not ( = ?auto_312131 ?auto_312138 ) ) ( not ( = ?auto_312131 ?auto_312139 ) ) ( not ( = ?auto_312131 ?auto_312140 ) ) ( not ( = ?auto_312131 ?auto_312141 ) ) ( not ( = ?auto_312131 ?auto_312142 ) ) ( not ( = ?auto_312131 ?auto_312143 ) ) ( not ( = ?auto_312131 ?auto_312144 ) ) ( not ( = ?auto_312132 ?auto_312133 ) ) ( not ( = ?auto_312132 ?auto_312134 ) ) ( not ( = ?auto_312132 ?auto_312135 ) ) ( not ( = ?auto_312132 ?auto_312136 ) ) ( not ( = ?auto_312132 ?auto_312137 ) ) ( not ( = ?auto_312132 ?auto_312138 ) ) ( not ( = ?auto_312132 ?auto_312139 ) ) ( not ( = ?auto_312132 ?auto_312140 ) ) ( not ( = ?auto_312132 ?auto_312141 ) ) ( not ( = ?auto_312132 ?auto_312142 ) ) ( not ( = ?auto_312132 ?auto_312143 ) ) ( not ( = ?auto_312132 ?auto_312144 ) ) ( not ( = ?auto_312133 ?auto_312134 ) ) ( not ( = ?auto_312133 ?auto_312135 ) ) ( not ( = ?auto_312133 ?auto_312136 ) ) ( not ( = ?auto_312133 ?auto_312137 ) ) ( not ( = ?auto_312133 ?auto_312138 ) ) ( not ( = ?auto_312133 ?auto_312139 ) ) ( not ( = ?auto_312133 ?auto_312140 ) ) ( not ( = ?auto_312133 ?auto_312141 ) ) ( not ( = ?auto_312133 ?auto_312142 ) ) ( not ( = ?auto_312133 ?auto_312143 ) ) ( not ( = ?auto_312133 ?auto_312144 ) ) ( not ( = ?auto_312134 ?auto_312135 ) ) ( not ( = ?auto_312134 ?auto_312136 ) ) ( not ( = ?auto_312134 ?auto_312137 ) ) ( not ( = ?auto_312134 ?auto_312138 ) ) ( not ( = ?auto_312134 ?auto_312139 ) ) ( not ( = ?auto_312134 ?auto_312140 ) ) ( not ( = ?auto_312134 ?auto_312141 ) ) ( not ( = ?auto_312134 ?auto_312142 ) ) ( not ( = ?auto_312134 ?auto_312143 ) ) ( not ( = ?auto_312134 ?auto_312144 ) ) ( not ( = ?auto_312135 ?auto_312136 ) ) ( not ( = ?auto_312135 ?auto_312137 ) ) ( not ( = ?auto_312135 ?auto_312138 ) ) ( not ( = ?auto_312135 ?auto_312139 ) ) ( not ( = ?auto_312135 ?auto_312140 ) ) ( not ( = ?auto_312135 ?auto_312141 ) ) ( not ( = ?auto_312135 ?auto_312142 ) ) ( not ( = ?auto_312135 ?auto_312143 ) ) ( not ( = ?auto_312135 ?auto_312144 ) ) ( not ( = ?auto_312136 ?auto_312137 ) ) ( not ( = ?auto_312136 ?auto_312138 ) ) ( not ( = ?auto_312136 ?auto_312139 ) ) ( not ( = ?auto_312136 ?auto_312140 ) ) ( not ( = ?auto_312136 ?auto_312141 ) ) ( not ( = ?auto_312136 ?auto_312142 ) ) ( not ( = ?auto_312136 ?auto_312143 ) ) ( not ( = ?auto_312136 ?auto_312144 ) ) ( not ( = ?auto_312137 ?auto_312138 ) ) ( not ( = ?auto_312137 ?auto_312139 ) ) ( not ( = ?auto_312137 ?auto_312140 ) ) ( not ( = ?auto_312137 ?auto_312141 ) ) ( not ( = ?auto_312137 ?auto_312142 ) ) ( not ( = ?auto_312137 ?auto_312143 ) ) ( not ( = ?auto_312137 ?auto_312144 ) ) ( not ( = ?auto_312138 ?auto_312139 ) ) ( not ( = ?auto_312138 ?auto_312140 ) ) ( not ( = ?auto_312138 ?auto_312141 ) ) ( not ( = ?auto_312138 ?auto_312142 ) ) ( not ( = ?auto_312138 ?auto_312143 ) ) ( not ( = ?auto_312138 ?auto_312144 ) ) ( not ( = ?auto_312139 ?auto_312140 ) ) ( not ( = ?auto_312139 ?auto_312141 ) ) ( not ( = ?auto_312139 ?auto_312142 ) ) ( not ( = ?auto_312139 ?auto_312143 ) ) ( not ( = ?auto_312139 ?auto_312144 ) ) ( not ( = ?auto_312140 ?auto_312141 ) ) ( not ( = ?auto_312140 ?auto_312142 ) ) ( not ( = ?auto_312140 ?auto_312143 ) ) ( not ( = ?auto_312140 ?auto_312144 ) ) ( not ( = ?auto_312141 ?auto_312142 ) ) ( not ( = ?auto_312141 ?auto_312143 ) ) ( not ( = ?auto_312141 ?auto_312144 ) ) ( not ( = ?auto_312142 ?auto_312143 ) ) ( not ( = ?auto_312142 ?auto_312144 ) ) ( not ( = ?auto_312143 ?auto_312144 ) ) ( ON ?auto_312142 ?auto_312143 ) ( ON ?auto_312141 ?auto_312142 ) ( CLEAR ?auto_312139 ) ( ON ?auto_312140 ?auto_312141 ) ( CLEAR ?auto_312140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_312131 ?auto_312132 ?auto_312133 ?auto_312134 ?auto_312135 ?auto_312136 ?auto_312137 ?auto_312138 ?auto_312139 ?auto_312140 )
      ( MAKE-13PILE ?auto_312131 ?auto_312132 ?auto_312133 ?auto_312134 ?auto_312135 ?auto_312136 ?auto_312137 ?auto_312138 ?auto_312139 ?auto_312140 ?auto_312141 ?auto_312142 ?auto_312143 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312185 - BLOCK
      ?auto_312186 - BLOCK
      ?auto_312187 - BLOCK
      ?auto_312188 - BLOCK
      ?auto_312189 - BLOCK
      ?auto_312190 - BLOCK
      ?auto_312191 - BLOCK
      ?auto_312192 - BLOCK
      ?auto_312193 - BLOCK
      ?auto_312194 - BLOCK
      ?auto_312195 - BLOCK
      ?auto_312196 - BLOCK
      ?auto_312197 - BLOCK
    )
    :vars
    (
      ?auto_312198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312197 ?auto_312198 ) ( ON-TABLE ?auto_312185 ) ( ON ?auto_312186 ?auto_312185 ) ( ON ?auto_312187 ?auto_312186 ) ( ON ?auto_312188 ?auto_312187 ) ( ON ?auto_312189 ?auto_312188 ) ( ON ?auto_312190 ?auto_312189 ) ( ON ?auto_312191 ?auto_312190 ) ( ON ?auto_312192 ?auto_312191 ) ( not ( = ?auto_312185 ?auto_312186 ) ) ( not ( = ?auto_312185 ?auto_312187 ) ) ( not ( = ?auto_312185 ?auto_312188 ) ) ( not ( = ?auto_312185 ?auto_312189 ) ) ( not ( = ?auto_312185 ?auto_312190 ) ) ( not ( = ?auto_312185 ?auto_312191 ) ) ( not ( = ?auto_312185 ?auto_312192 ) ) ( not ( = ?auto_312185 ?auto_312193 ) ) ( not ( = ?auto_312185 ?auto_312194 ) ) ( not ( = ?auto_312185 ?auto_312195 ) ) ( not ( = ?auto_312185 ?auto_312196 ) ) ( not ( = ?auto_312185 ?auto_312197 ) ) ( not ( = ?auto_312185 ?auto_312198 ) ) ( not ( = ?auto_312186 ?auto_312187 ) ) ( not ( = ?auto_312186 ?auto_312188 ) ) ( not ( = ?auto_312186 ?auto_312189 ) ) ( not ( = ?auto_312186 ?auto_312190 ) ) ( not ( = ?auto_312186 ?auto_312191 ) ) ( not ( = ?auto_312186 ?auto_312192 ) ) ( not ( = ?auto_312186 ?auto_312193 ) ) ( not ( = ?auto_312186 ?auto_312194 ) ) ( not ( = ?auto_312186 ?auto_312195 ) ) ( not ( = ?auto_312186 ?auto_312196 ) ) ( not ( = ?auto_312186 ?auto_312197 ) ) ( not ( = ?auto_312186 ?auto_312198 ) ) ( not ( = ?auto_312187 ?auto_312188 ) ) ( not ( = ?auto_312187 ?auto_312189 ) ) ( not ( = ?auto_312187 ?auto_312190 ) ) ( not ( = ?auto_312187 ?auto_312191 ) ) ( not ( = ?auto_312187 ?auto_312192 ) ) ( not ( = ?auto_312187 ?auto_312193 ) ) ( not ( = ?auto_312187 ?auto_312194 ) ) ( not ( = ?auto_312187 ?auto_312195 ) ) ( not ( = ?auto_312187 ?auto_312196 ) ) ( not ( = ?auto_312187 ?auto_312197 ) ) ( not ( = ?auto_312187 ?auto_312198 ) ) ( not ( = ?auto_312188 ?auto_312189 ) ) ( not ( = ?auto_312188 ?auto_312190 ) ) ( not ( = ?auto_312188 ?auto_312191 ) ) ( not ( = ?auto_312188 ?auto_312192 ) ) ( not ( = ?auto_312188 ?auto_312193 ) ) ( not ( = ?auto_312188 ?auto_312194 ) ) ( not ( = ?auto_312188 ?auto_312195 ) ) ( not ( = ?auto_312188 ?auto_312196 ) ) ( not ( = ?auto_312188 ?auto_312197 ) ) ( not ( = ?auto_312188 ?auto_312198 ) ) ( not ( = ?auto_312189 ?auto_312190 ) ) ( not ( = ?auto_312189 ?auto_312191 ) ) ( not ( = ?auto_312189 ?auto_312192 ) ) ( not ( = ?auto_312189 ?auto_312193 ) ) ( not ( = ?auto_312189 ?auto_312194 ) ) ( not ( = ?auto_312189 ?auto_312195 ) ) ( not ( = ?auto_312189 ?auto_312196 ) ) ( not ( = ?auto_312189 ?auto_312197 ) ) ( not ( = ?auto_312189 ?auto_312198 ) ) ( not ( = ?auto_312190 ?auto_312191 ) ) ( not ( = ?auto_312190 ?auto_312192 ) ) ( not ( = ?auto_312190 ?auto_312193 ) ) ( not ( = ?auto_312190 ?auto_312194 ) ) ( not ( = ?auto_312190 ?auto_312195 ) ) ( not ( = ?auto_312190 ?auto_312196 ) ) ( not ( = ?auto_312190 ?auto_312197 ) ) ( not ( = ?auto_312190 ?auto_312198 ) ) ( not ( = ?auto_312191 ?auto_312192 ) ) ( not ( = ?auto_312191 ?auto_312193 ) ) ( not ( = ?auto_312191 ?auto_312194 ) ) ( not ( = ?auto_312191 ?auto_312195 ) ) ( not ( = ?auto_312191 ?auto_312196 ) ) ( not ( = ?auto_312191 ?auto_312197 ) ) ( not ( = ?auto_312191 ?auto_312198 ) ) ( not ( = ?auto_312192 ?auto_312193 ) ) ( not ( = ?auto_312192 ?auto_312194 ) ) ( not ( = ?auto_312192 ?auto_312195 ) ) ( not ( = ?auto_312192 ?auto_312196 ) ) ( not ( = ?auto_312192 ?auto_312197 ) ) ( not ( = ?auto_312192 ?auto_312198 ) ) ( not ( = ?auto_312193 ?auto_312194 ) ) ( not ( = ?auto_312193 ?auto_312195 ) ) ( not ( = ?auto_312193 ?auto_312196 ) ) ( not ( = ?auto_312193 ?auto_312197 ) ) ( not ( = ?auto_312193 ?auto_312198 ) ) ( not ( = ?auto_312194 ?auto_312195 ) ) ( not ( = ?auto_312194 ?auto_312196 ) ) ( not ( = ?auto_312194 ?auto_312197 ) ) ( not ( = ?auto_312194 ?auto_312198 ) ) ( not ( = ?auto_312195 ?auto_312196 ) ) ( not ( = ?auto_312195 ?auto_312197 ) ) ( not ( = ?auto_312195 ?auto_312198 ) ) ( not ( = ?auto_312196 ?auto_312197 ) ) ( not ( = ?auto_312196 ?auto_312198 ) ) ( not ( = ?auto_312197 ?auto_312198 ) ) ( ON ?auto_312196 ?auto_312197 ) ( ON ?auto_312195 ?auto_312196 ) ( ON ?auto_312194 ?auto_312195 ) ( CLEAR ?auto_312192 ) ( ON ?auto_312193 ?auto_312194 ) ( CLEAR ?auto_312193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_312185 ?auto_312186 ?auto_312187 ?auto_312188 ?auto_312189 ?auto_312190 ?auto_312191 ?auto_312192 ?auto_312193 )
      ( MAKE-13PILE ?auto_312185 ?auto_312186 ?auto_312187 ?auto_312188 ?auto_312189 ?auto_312190 ?auto_312191 ?auto_312192 ?auto_312193 ?auto_312194 ?auto_312195 ?auto_312196 ?auto_312197 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312239 - BLOCK
      ?auto_312240 - BLOCK
      ?auto_312241 - BLOCK
      ?auto_312242 - BLOCK
      ?auto_312243 - BLOCK
      ?auto_312244 - BLOCK
      ?auto_312245 - BLOCK
      ?auto_312246 - BLOCK
      ?auto_312247 - BLOCK
      ?auto_312248 - BLOCK
      ?auto_312249 - BLOCK
      ?auto_312250 - BLOCK
      ?auto_312251 - BLOCK
    )
    :vars
    (
      ?auto_312252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312251 ?auto_312252 ) ( ON-TABLE ?auto_312239 ) ( ON ?auto_312240 ?auto_312239 ) ( ON ?auto_312241 ?auto_312240 ) ( ON ?auto_312242 ?auto_312241 ) ( ON ?auto_312243 ?auto_312242 ) ( ON ?auto_312244 ?auto_312243 ) ( ON ?auto_312245 ?auto_312244 ) ( not ( = ?auto_312239 ?auto_312240 ) ) ( not ( = ?auto_312239 ?auto_312241 ) ) ( not ( = ?auto_312239 ?auto_312242 ) ) ( not ( = ?auto_312239 ?auto_312243 ) ) ( not ( = ?auto_312239 ?auto_312244 ) ) ( not ( = ?auto_312239 ?auto_312245 ) ) ( not ( = ?auto_312239 ?auto_312246 ) ) ( not ( = ?auto_312239 ?auto_312247 ) ) ( not ( = ?auto_312239 ?auto_312248 ) ) ( not ( = ?auto_312239 ?auto_312249 ) ) ( not ( = ?auto_312239 ?auto_312250 ) ) ( not ( = ?auto_312239 ?auto_312251 ) ) ( not ( = ?auto_312239 ?auto_312252 ) ) ( not ( = ?auto_312240 ?auto_312241 ) ) ( not ( = ?auto_312240 ?auto_312242 ) ) ( not ( = ?auto_312240 ?auto_312243 ) ) ( not ( = ?auto_312240 ?auto_312244 ) ) ( not ( = ?auto_312240 ?auto_312245 ) ) ( not ( = ?auto_312240 ?auto_312246 ) ) ( not ( = ?auto_312240 ?auto_312247 ) ) ( not ( = ?auto_312240 ?auto_312248 ) ) ( not ( = ?auto_312240 ?auto_312249 ) ) ( not ( = ?auto_312240 ?auto_312250 ) ) ( not ( = ?auto_312240 ?auto_312251 ) ) ( not ( = ?auto_312240 ?auto_312252 ) ) ( not ( = ?auto_312241 ?auto_312242 ) ) ( not ( = ?auto_312241 ?auto_312243 ) ) ( not ( = ?auto_312241 ?auto_312244 ) ) ( not ( = ?auto_312241 ?auto_312245 ) ) ( not ( = ?auto_312241 ?auto_312246 ) ) ( not ( = ?auto_312241 ?auto_312247 ) ) ( not ( = ?auto_312241 ?auto_312248 ) ) ( not ( = ?auto_312241 ?auto_312249 ) ) ( not ( = ?auto_312241 ?auto_312250 ) ) ( not ( = ?auto_312241 ?auto_312251 ) ) ( not ( = ?auto_312241 ?auto_312252 ) ) ( not ( = ?auto_312242 ?auto_312243 ) ) ( not ( = ?auto_312242 ?auto_312244 ) ) ( not ( = ?auto_312242 ?auto_312245 ) ) ( not ( = ?auto_312242 ?auto_312246 ) ) ( not ( = ?auto_312242 ?auto_312247 ) ) ( not ( = ?auto_312242 ?auto_312248 ) ) ( not ( = ?auto_312242 ?auto_312249 ) ) ( not ( = ?auto_312242 ?auto_312250 ) ) ( not ( = ?auto_312242 ?auto_312251 ) ) ( not ( = ?auto_312242 ?auto_312252 ) ) ( not ( = ?auto_312243 ?auto_312244 ) ) ( not ( = ?auto_312243 ?auto_312245 ) ) ( not ( = ?auto_312243 ?auto_312246 ) ) ( not ( = ?auto_312243 ?auto_312247 ) ) ( not ( = ?auto_312243 ?auto_312248 ) ) ( not ( = ?auto_312243 ?auto_312249 ) ) ( not ( = ?auto_312243 ?auto_312250 ) ) ( not ( = ?auto_312243 ?auto_312251 ) ) ( not ( = ?auto_312243 ?auto_312252 ) ) ( not ( = ?auto_312244 ?auto_312245 ) ) ( not ( = ?auto_312244 ?auto_312246 ) ) ( not ( = ?auto_312244 ?auto_312247 ) ) ( not ( = ?auto_312244 ?auto_312248 ) ) ( not ( = ?auto_312244 ?auto_312249 ) ) ( not ( = ?auto_312244 ?auto_312250 ) ) ( not ( = ?auto_312244 ?auto_312251 ) ) ( not ( = ?auto_312244 ?auto_312252 ) ) ( not ( = ?auto_312245 ?auto_312246 ) ) ( not ( = ?auto_312245 ?auto_312247 ) ) ( not ( = ?auto_312245 ?auto_312248 ) ) ( not ( = ?auto_312245 ?auto_312249 ) ) ( not ( = ?auto_312245 ?auto_312250 ) ) ( not ( = ?auto_312245 ?auto_312251 ) ) ( not ( = ?auto_312245 ?auto_312252 ) ) ( not ( = ?auto_312246 ?auto_312247 ) ) ( not ( = ?auto_312246 ?auto_312248 ) ) ( not ( = ?auto_312246 ?auto_312249 ) ) ( not ( = ?auto_312246 ?auto_312250 ) ) ( not ( = ?auto_312246 ?auto_312251 ) ) ( not ( = ?auto_312246 ?auto_312252 ) ) ( not ( = ?auto_312247 ?auto_312248 ) ) ( not ( = ?auto_312247 ?auto_312249 ) ) ( not ( = ?auto_312247 ?auto_312250 ) ) ( not ( = ?auto_312247 ?auto_312251 ) ) ( not ( = ?auto_312247 ?auto_312252 ) ) ( not ( = ?auto_312248 ?auto_312249 ) ) ( not ( = ?auto_312248 ?auto_312250 ) ) ( not ( = ?auto_312248 ?auto_312251 ) ) ( not ( = ?auto_312248 ?auto_312252 ) ) ( not ( = ?auto_312249 ?auto_312250 ) ) ( not ( = ?auto_312249 ?auto_312251 ) ) ( not ( = ?auto_312249 ?auto_312252 ) ) ( not ( = ?auto_312250 ?auto_312251 ) ) ( not ( = ?auto_312250 ?auto_312252 ) ) ( not ( = ?auto_312251 ?auto_312252 ) ) ( ON ?auto_312250 ?auto_312251 ) ( ON ?auto_312249 ?auto_312250 ) ( ON ?auto_312248 ?auto_312249 ) ( ON ?auto_312247 ?auto_312248 ) ( CLEAR ?auto_312245 ) ( ON ?auto_312246 ?auto_312247 ) ( CLEAR ?auto_312246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_312239 ?auto_312240 ?auto_312241 ?auto_312242 ?auto_312243 ?auto_312244 ?auto_312245 ?auto_312246 )
      ( MAKE-13PILE ?auto_312239 ?auto_312240 ?auto_312241 ?auto_312242 ?auto_312243 ?auto_312244 ?auto_312245 ?auto_312246 ?auto_312247 ?auto_312248 ?auto_312249 ?auto_312250 ?auto_312251 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312293 - BLOCK
      ?auto_312294 - BLOCK
      ?auto_312295 - BLOCK
      ?auto_312296 - BLOCK
      ?auto_312297 - BLOCK
      ?auto_312298 - BLOCK
      ?auto_312299 - BLOCK
      ?auto_312300 - BLOCK
      ?auto_312301 - BLOCK
      ?auto_312302 - BLOCK
      ?auto_312303 - BLOCK
      ?auto_312304 - BLOCK
      ?auto_312305 - BLOCK
    )
    :vars
    (
      ?auto_312306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312305 ?auto_312306 ) ( ON-TABLE ?auto_312293 ) ( ON ?auto_312294 ?auto_312293 ) ( ON ?auto_312295 ?auto_312294 ) ( ON ?auto_312296 ?auto_312295 ) ( ON ?auto_312297 ?auto_312296 ) ( ON ?auto_312298 ?auto_312297 ) ( not ( = ?auto_312293 ?auto_312294 ) ) ( not ( = ?auto_312293 ?auto_312295 ) ) ( not ( = ?auto_312293 ?auto_312296 ) ) ( not ( = ?auto_312293 ?auto_312297 ) ) ( not ( = ?auto_312293 ?auto_312298 ) ) ( not ( = ?auto_312293 ?auto_312299 ) ) ( not ( = ?auto_312293 ?auto_312300 ) ) ( not ( = ?auto_312293 ?auto_312301 ) ) ( not ( = ?auto_312293 ?auto_312302 ) ) ( not ( = ?auto_312293 ?auto_312303 ) ) ( not ( = ?auto_312293 ?auto_312304 ) ) ( not ( = ?auto_312293 ?auto_312305 ) ) ( not ( = ?auto_312293 ?auto_312306 ) ) ( not ( = ?auto_312294 ?auto_312295 ) ) ( not ( = ?auto_312294 ?auto_312296 ) ) ( not ( = ?auto_312294 ?auto_312297 ) ) ( not ( = ?auto_312294 ?auto_312298 ) ) ( not ( = ?auto_312294 ?auto_312299 ) ) ( not ( = ?auto_312294 ?auto_312300 ) ) ( not ( = ?auto_312294 ?auto_312301 ) ) ( not ( = ?auto_312294 ?auto_312302 ) ) ( not ( = ?auto_312294 ?auto_312303 ) ) ( not ( = ?auto_312294 ?auto_312304 ) ) ( not ( = ?auto_312294 ?auto_312305 ) ) ( not ( = ?auto_312294 ?auto_312306 ) ) ( not ( = ?auto_312295 ?auto_312296 ) ) ( not ( = ?auto_312295 ?auto_312297 ) ) ( not ( = ?auto_312295 ?auto_312298 ) ) ( not ( = ?auto_312295 ?auto_312299 ) ) ( not ( = ?auto_312295 ?auto_312300 ) ) ( not ( = ?auto_312295 ?auto_312301 ) ) ( not ( = ?auto_312295 ?auto_312302 ) ) ( not ( = ?auto_312295 ?auto_312303 ) ) ( not ( = ?auto_312295 ?auto_312304 ) ) ( not ( = ?auto_312295 ?auto_312305 ) ) ( not ( = ?auto_312295 ?auto_312306 ) ) ( not ( = ?auto_312296 ?auto_312297 ) ) ( not ( = ?auto_312296 ?auto_312298 ) ) ( not ( = ?auto_312296 ?auto_312299 ) ) ( not ( = ?auto_312296 ?auto_312300 ) ) ( not ( = ?auto_312296 ?auto_312301 ) ) ( not ( = ?auto_312296 ?auto_312302 ) ) ( not ( = ?auto_312296 ?auto_312303 ) ) ( not ( = ?auto_312296 ?auto_312304 ) ) ( not ( = ?auto_312296 ?auto_312305 ) ) ( not ( = ?auto_312296 ?auto_312306 ) ) ( not ( = ?auto_312297 ?auto_312298 ) ) ( not ( = ?auto_312297 ?auto_312299 ) ) ( not ( = ?auto_312297 ?auto_312300 ) ) ( not ( = ?auto_312297 ?auto_312301 ) ) ( not ( = ?auto_312297 ?auto_312302 ) ) ( not ( = ?auto_312297 ?auto_312303 ) ) ( not ( = ?auto_312297 ?auto_312304 ) ) ( not ( = ?auto_312297 ?auto_312305 ) ) ( not ( = ?auto_312297 ?auto_312306 ) ) ( not ( = ?auto_312298 ?auto_312299 ) ) ( not ( = ?auto_312298 ?auto_312300 ) ) ( not ( = ?auto_312298 ?auto_312301 ) ) ( not ( = ?auto_312298 ?auto_312302 ) ) ( not ( = ?auto_312298 ?auto_312303 ) ) ( not ( = ?auto_312298 ?auto_312304 ) ) ( not ( = ?auto_312298 ?auto_312305 ) ) ( not ( = ?auto_312298 ?auto_312306 ) ) ( not ( = ?auto_312299 ?auto_312300 ) ) ( not ( = ?auto_312299 ?auto_312301 ) ) ( not ( = ?auto_312299 ?auto_312302 ) ) ( not ( = ?auto_312299 ?auto_312303 ) ) ( not ( = ?auto_312299 ?auto_312304 ) ) ( not ( = ?auto_312299 ?auto_312305 ) ) ( not ( = ?auto_312299 ?auto_312306 ) ) ( not ( = ?auto_312300 ?auto_312301 ) ) ( not ( = ?auto_312300 ?auto_312302 ) ) ( not ( = ?auto_312300 ?auto_312303 ) ) ( not ( = ?auto_312300 ?auto_312304 ) ) ( not ( = ?auto_312300 ?auto_312305 ) ) ( not ( = ?auto_312300 ?auto_312306 ) ) ( not ( = ?auto_312301 ?auto_312302 ) ) ( not ( = ?auto_312301 ?auto_312303 ) ) ( not ( = ?auto_312301 ?auto_312304 ) ) ( not ( = ?auto_312301 ?auto_312305 ) ) ( not ( = ?auto_312301 ?auto_312306 ) ) ( not ( = ?auto_312302 ?auto_312303 ) ) ( not ( = ?auto_312302 ?auto_312304 ) ) ( not ( = ?auto_312302 ?auto_312305 ) ) ( not ( = ?auto_312302 ?auto_312306 ) ) ( not ( = ?auto_312303 ?auto_312304 ) ) ( not ( = ?auto_312303 ?auto_312305 ) ) ( not ( = ?auto_312303 ?auto_312306 ) ) ( not ( = ?auto_312304 ?auto_312305 ) ) ( not ( = ?auto_312304 ?auto_312306 ) ) ( not ( = ?auto_312305 ?auto_312306 ) ) ( ON ?auto_312304 ?auto_312305 ) ( ON ?auto_312303 ?auto_312304 ) ( ON ?auto_312302 ?auto_312303 ) ( ON ?auto_312301 ?auto_312302 ) ( ON ?auto_312300 ?auto_312301 ) ( CLEAR ?auto_312298 ) ( ON ?auto_312299 ?auto_312300 ) ( CLEAR ?auto_312299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_312293 ?auto_312294 ?auto_312295 ?auto_312296 ?auto_312297 ?auto_312298 ?auto_312299 )
      ( MAKE-13PILE ?auto_312293 ?auto_312294 ?auto_312295 ?auto_312296 ?auto_312297 ?auto_312298 ?auto_312299 ?auto_312300 ?auto_312301 ?auto_312302 ?auto_312303 ?auto_312304 ?auto_312305 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312347 - BLOCK
      ?auto_312348 - BLOCK
      ?auto_312349 - BLOCK
      ?auto_312350 - BLOCK
      ?auto_312351 - BLOCK
      ?auto_312352 - BLOCK
      ?auto_312353 - BLOCK
      ?auto_312354 - BLOCK
      ?auto_312355 - BLOCK
      ?auto_312356 - BLOCK
      ?auto_312357 - BLOCK
      ?auto_312358 - BLOCK
      ?auto_312359 - BLOCK
    )
    :vars
    (
      ?auto_312360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312359 ?auto_312360 ) ( ON-TABLE ?auto_312347 ) ( ON ?auto_312348 ?auto_312347 ) ( ON ?auto_312349 ?auto_312348 ) ( ON ?auto_312350 ?auto_312349 ) ( ON ?auto_312351 ?auto_312350 ) ( not ( = ?auto_312347 ?auto_312348 ) ) ( not ( = ?auto_312347 ?auto_312349 ) ) ( not ( = ?auto_312347 ?auto_312350 ) ) ( not ( = ?auto_312347 ?auto_312351 ) ) ( not ( = ?auto_312347 ?auto_312352 ) ) ( not ( = ?auto_312347 ?auto_312353 ) ) ( not ( = ?auto_312347 ?auto_312354 ) ) ( not ( = ?auto_312347 ?auto_312355 ) ) ( not ( = ?auto_312347 ?auto_312356 ) ) ( not ( = ?auto_312347 ?auto_312357 ) ) ( not ( = ?auto_312347 ?auto_312358 ) ) ( not ( = ?auto_312347 ?auto_312359 ) ) ( not ( = ?auto_312347 ?auto_312360 ) ) ( not ( = ?auto_312348 ?auto_312349 ) ) ( not ( = ?auto_312348 ?auto_312350 ) ) ( not ( = ?auto_312348 ?auto_312351 ) ) ( not ( = ?auto_312348 ?auto_312352 ) ) ( not ( = ?auto_312348 ?auto_312353 ) ) ( not ( = ?auto_312348 ?auto_312354 ) ) ( not ( = ?auto_312348 ?auto_312355 ) ) ( not ( = ?auto_312348 ?auto_312356 ) ) ( not ( = ?auto_312348 ?auto_312357 ) ) ( not ( = ?auto_312348 ?auto_312358 ) ) ( not ( = ?auto_312348 ?auto_312359 ) ) ( not ( = ?auto_312348 ?auto_312360 ) ) ( not ( = ?auto_312349 ?auto_312350 ) ) ( not ( = ?auto_312349 ?auto_312351 ) ) ( not ( = ?auto_312349 ?auto_312352 ) ) ( not ( = ?auto_312349 ?auto_312353 ) ) ( not ( = ?auto_312349 ?auto_312354 ) ) ( not ( = ?auto_312349 ?auto_312355 ) ) ( not ( = ?auto_312349 ?auto_312356 ) ) ( not ( = ?auto_312349 ?auto_312357 ) ) ( not ( = ?auto_312349 ?auto_312358 ) ) ( not ( = ?auto_312349 ?auto_312359 ) ) ( not ( = ?auto_312349 ?auto_312360 ) ) ( not ( = ?auto_312350 ?auto_312351 ) ) ( not ( = ?auto_312350 ?auto_312352 ) ) ( not ( = ?auto_312350 ?auto_312353 ) ) ( not ( = ?auto_312350 ?auto_312354 ) ) ( not ( = ?auto_312350 ?auto_312355 ) ) ( not ( = ?auto_312350 ?auto_312356 ) ) ( not ( = ?auto_312350 ?auto_312357 ) ) ( not ( = ?auto_312350 ?auto_312358 ) ) ( not ( = ?auto_312350 ?auto_312359 ) ) ( not ( = ?auto_312350 ?auto_312360 ) ) ( not ( = ?auto_312351 ?auto_312352 ) ) ( not ( = ?auto_312351 ?auto_312353 ) ) ( not ( = ?auto_312351 ?auto_312354 ) ) ( not ( = ?auto_312351 ?auto_312355 ) ) ( not ( = ?auto_312351 ?auto_312356 ) ) ( not ( = ?auto_312351 ?auto_312357 ) ) ( not ( = ?auto_312351 ?auto_312358 ) ) ( not ( = ?auto_312351 ?auto_312359 ) ) ( not ( = ?auto_312351 ?auto_312360 ) ) ( not ( = ?auto_312352 ?auto_312353 ) ) ( not ( = ?auto_312352 ?auto_312354 ) ) ( not ( = ?auto_312352 ?auto_312355 ) ) ( not ( = ?auto_312352 ?auto_312356 ) ) ( not ( = ?auto_312352 ?auto_312357 ) ) ( not ( = ?auto_312352 ?auto_312358 ) ) ( not ( = ?auto_312352 ?auto_312359 ) ) ( not ( = ?auto_312352 ?auto_312360 ) ) ( not ( = ?auto_312353 ?auto_312354 ) ) ( not ( = ?auto_312353 ?auto_312355 ) ) ( not ( = ?auto_312353 ?auto_312356 ) ) ( not ( = ?auto_312353 ?auto_312357 ) ) ( not ( = ?auto_312353 ?auto_312358 ) ) ( not ( = ?auto_312353 ?auto_312359 ) ) ( not ( = ?auto_312353 ?auto_312360 ) ) ( not ( = ?auto_312354 ?auto_312355 ) ) ( not ( = ?auto_312354 ?auto_312356 ) ) ( not ( = ?auto_312354 ?auto_312357 ) ) ( not ( = ?auto_312354 ?auto_312358 ) ) ( not ( = ?auto_312354 ?auto_312359 ) ) ( not ( = ?auto_312354 ?auto_312360 ) ) ( not ( = ?auto_312355 ?auto_312356 ) ) ( not ( = ?auto_312355 ?auto_312357 ) ) ( not ( = ?auto_312355 ?auto_312358 ) ) ( not ( = ?auto_312355 ?auto_312359 ) ) ( not ( = ?auto_312355 ?auto_312360 ) ) ( not ( = ?auto_312356 ?auto_312357 ) ) ( not ( = ?auto_312356 ?auto_312358 ) ) ( not ( = ?auto_312356 ?auto_312359 ) ) ( not ( = ?auto_312356 ?auto_312360 ) ) ( not ( = ?auto_312357 ?auto_312358 ) ) ( not ( = ?auto_312357 ?auto_312359 ) ) ( not ( = ?auto_312357 ?auto_312360 ) ) ( not ( = ?auto_312358 ?auto_312359 ) ) ( not ( = ?auto_312358 ?auto_312360 ) ) ( not ( = ?auto_312359 ?auto_312360 ) ) ( ON ?auto_312358 ?auto_312359 ) ( ON ?auto_312357 ?auto_312358 ) ( ON ?auto_312356 ?auto_312357 ) ( ON ?auto_312355 ?auto_312356 ) ( ON ?auto_312354 ?auto_312355 ) ( ON ?auto_312353 ?auto_312354 ) ( CLEAR ?auto_312351 ) ( ON ?auto_312352 ?auto_312353 ) ( CLEAR ?auto_312352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_312347 ?auto_312348 ?auto_312349 ?auto_312350 ?auto_312351 ?auto_312352 )
      ( MAKE-13PILE ?auto_312347 ?auto_312348 ?auto_312349 ?auto_312350 ?auto_312351 ?auto_312352 ?auto_312353 ?auto_312354 ?auto_312355 ?auto_312356 ?auto_312357 ?auto_312358 ?auto_312359 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312401 - BLOCK
      ?auto_312402 - BLOCK
      ?auto_312403 - BLOCK
      ?auto_312404 - BLOCK
      ?auto_312405 - BLOCK
      ?auto_312406 - BLOCK
      ?auto_312407 - BLOCK
      ?auto_312408 - BLOCK
      ?auto_312409 - BLOCK
      ?auto_312410 - BLOCK
      ?auto_312411 - BLOCK
      ?auto_312412 - BLOCK
      ?auto_312413 - BLOCK
    )
    :vars
    (
      ?auto_312414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312413 ?auto_312414 ) ( ON-TABLE ?auto_312401 ) ( ON ?auto_312402 ?auto_312401 ) ( ON ?auto_312403 ?auto_312402 ) ( ON ?auto_312404 ?auto_312403 ) ( not ( = ?auto_312401 ?auto_312402 ) ) ( not ( = ?auto_312401 ?auto_312403 ) ) ( not ( = ?auto_312401 ?auto_312404 ) ) ( not ( = ?auto_312401 ?auto_312405 ) ) ( not ( = ?auto_312401 ?auto_312406 ) ) ( not ( = ?auto_312401 ?auto_312407 ) ) ( not ( = ?auto_312401 ?auto_312408 ) ) ( not ( = ?auto_312401 ?auto_312409 ) ) ( not ( = ?auto_312401 ?auto_312410 ) ) ( not ( = ?auto_312401 ?auto_312411 ) ) ( not ( = ?auto_312401 ?auto_312412 ) ) ( not ( = ?auto_312401 ?auto_312413 ) ) ( not ( = ?auto_312401 ?auto_312414 ) ) ( not ( = ?auto_312402 ?auto_312403 ) ) ( not ( = ?auto_312402 ?auto_312404 ) ) ( not ( = ?auto_312402 ?auto_312405 ) ) ( not ( = ?auto_312402 ?auto_312406 ) ) ( not ( = ?auto_312402 ?auto_312407 ) ) ( not ( = ?auto_312402 ?auto_312408 ) ) ( not ( = ?auto_312402 ?auto_312409 ) ) ( not ( = ?auto_312402 ?auto_312410 ) ) ( not ( = ?auto_312402 ?auto_312411 ) ) ( not ( = ?auto_312402 ?auto_312412 ) ) ( not ( = ?auto_312402 ?auto_312413 ) ) ( not ( = ?auto_312402 ?auto_312414 ) ) ( not ( = ?auto_312403 ?auto_312404 ) ) ( not ( = ?auto_312403 ?auto_312405 ) ) ( not ( = ?auto_312403 ?auto_312406 ) ) ( not ( = ?auto_312403 ?auto_312407 ) ) ( not ( = ?auto_312403 ?auto_312408 ) ) ( not ( = ?auto_312403 ?auto_312409 ) ) ( not ( = ?auto_312403 ?auto_312410 ) ) ( not ( = ?auto_312403 ?auto_312411 ) ) ( not ( = ?auto_312403 ?auto_312412 ) ) ( not ( = ?auto_312403 ?auto_312413 ) ) ( not ( = ?auto_312403 ?auto_312414 ) ) ( not ( = ?auto_312404 ?auto_312405 ) ) ( not ( = ?auto_312404 ?auto_312406 ) ) ( not ( = ?auto_312404 ?auto_312407 ) ) ( not ( = ?auto_312404 ?auto_312408 ) ) ( not ( = ?auto_312404 ?auto_312409 ) ) ( not ( = ?auto_312404 ?auto_312410 ) ) ( not ( = ?auto_312404 ?auto_312411 ) ) ( not ( = ?auto_312404 ?auto_312412 ) ) ( not ( = ?auto_312404 ?auto_312413 ) ) ( not ( = ?auto_312404 ?auto_312414 ) ) ( not ( = ?auto_312405 ?auto_312406 ) ) ( not ( = ?auto_312405 ?auto_312407 ) ) ( not ( = ?auto_312405 ?auto_312408 ) ) ( not ( = ?auto_312405 ?auto_312409 ) ) ( not ( = ?auto_312405 ?auto_312410 ) ) ( not ( = ?auto_312405 ?auto_312411 ) ) ( not ( = ?auto_312405 ?auto_312412 ) ) ( not ( = ?auto_312405 ?auto_312413 ) ) ( not ( = ?auto_312405 ?auto_312414 ) ) ( not ( = ?auto_312406 ?auto_312407 ) ) ( not ( = ?auto_312406 ?auto_312408 ) ) ( not ( = ?auto_312406 ?auto_312409 ) ) ( not ( = ?auto_312406 ?auto_312410 ) ) ( not ( = ?auto_312406 ?auto_312411 ) ) ( not ( = ?auto_312406 ?auto_312412 ) ) ( not ( = ?auto_312406 ?auto_312413 ) ) ( not ( = ?auto_312406 ?auto_312414 ) ) ( not ( = ?auto_312407 ?auto_312408 ) ) ( not ( = ?auto_312407 ?auto_312409 ) ) ( not ( = ?auto_312407 ?auto_312410 ) ) ( not ( = ?auto_312407 ?auto_312411 ) ) ( not ( = ?auto_312407 ?auto_312412 ) ) ( not ( = ?auto_312407 ?auto_312413 ) ) ( not ( = ?auto_312407 ?auto_312414 ) ) ( not ( = ?auto_312408 ?auto_312409 ) ) ( not ( = ?auto_312408 ?auto_312410 ) ) ( not ( = ?auto_312408 ?auto_312411 ) ) ( not ( = ?auto_312408 ?auto_312412 ) ) ( not ( = ?auto_312408 ?auto_312413 ) ) ( not ( = ?auto_312408 ?auto_312414 ) ) ( not ( = ?auto_312409 ?auto_312410 ) ) ( not ( = ?auto_312409 ?auto_312411 ) ) ( not ( = ?auto_312409 ?auto_312412 ) ) ( not ( = ?auto_312409 ?auto_312413 ) ) ( not ( = ?auto_312409 ?auto_312414 ) ) ( not ( = ?auto_312410 ?auto_312411 ) ) ( not ( = ?auto_312410 ?auto_312412 ) ) ( not ( = ?auto_312410 ?auto_312413 ) ) ( not ( = ?auto_312410 ?auto_312414 ) ) ( not ( = ?auto_312411 ?auto_312412 ) ) ( not ( = ?auto_312411 ?auto_312413 ) ) ( not ( = ?auto_312411 ?auto_312414 ) ) ( not ( = ?auto_312412 ?auto_312413 ) ) ( not ( = ?auto_312412 ?auto_312414 ) ) ( not ( = ?auto_312413 ?auto_312414 ) ) ( ON ?auto_312412 ?auto_312413 ) ( ON ?auto_312411 ?auto_312412 ) ( ON ?auto_312410 ?auto_312411 ) ( ON ?auto_312409 ?auto_312410 ) ( ON ?auto_312408 ?auto_312409 ) ( ON ?auto_312407 ?auto_312408 ) ( ON ?auto_312406 ?auto_312407 ) ( CLEAR ?auto_312404 ) ( ON ?auto_312405 ?auto_312406 ) ( CLEAR ?auto_312405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_312401 ?auto_312402 ?auto_312403 ?auto_312404 ?auto_312405 )
      ( MAKE-13PILE ?auto_312401 ?auto_312402 ?auto_312403 ?auto_312404 ?auto_312405 ?auto_312406 ?auto_312407 ?auto_312408 ?auto_312409 ?auto_312410 ?auto_312411 ?auto_312412 ?auto_312413 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312455 - BLOCK
      ?auto_312456 - BLOCK
      ?auto_312457 - BLOCK
      ?auto_312458 - BLOCK
      ?auto_312459 - BLOCK
      ?auto_312460 - BLOCK
      ?auto_312461 - BLOCK
      ?auto_312462 - BLOCK
      ?auto_312463 - BLOCK
      ?auto_312464 - BLOCK
      ?auto_312465 - BLOCK
      ?auto_312466 - BLOCK
      ?auto_312467 - BLOCK
    )
    :vars
    (
      ?auto_312468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312467 ?auto_312468 ) ( ON-TABLE ?auto_312455 ) ( ON ?auto_312456 ?auto_312455 ) ( ON ?auto_312457 ?auto_312456 ) ( not ( = ?auto_312455 ?auto_312456 ) ) ( not ( = ?auto_312455 ?auto_312457 ) ) ( not ( = ?auto_312455 ?auto_312458 ) ) ( not ( = ?auto_312455 ?auto_312459 ) ) ( not ( = ?auto_312455 ?auto_312460 ) ) ( not ( = ?auto_312455 ?auto_312461 ) ) ( not ( = ?auto_312455 ?auto_312462 ) ) ( not ( = ?auto_312455 ?auto_312463 ) ) ( not ( = ?auto_312455 ?auto_312464 ) ) ( not ( = ?auto_312455 ?auto_312465 ) ) ( not ( = ?auto_312455 ?auto_312466 ) ) ( not ( = ?auto_312455 ?auto_312467 ) ) ( not ( = ?auto_312455 ?auto_312468 ) ) ( not ( = ?auto_312456 ?auto_312457 ) ) ( not ( = ?auto_312456 ?auto_312458 ) ) ( not ( = ?auto_312456 ?auto_312459 ) ) ( not ( = ?auto_312456 ?auto_312460 ) ) ( not ( = ?auto_312456 ?auto_312461 ) ) ( not ( = ?auto_312456 ?auto_312462 ) ) ( not ( = ?auto_312456 ?auto_312463 ) ) ( not ( = ?auto_312456 ?auto_312464 ) ) ( not ( = ?auto_312456 ?auto_312465 ) ) ( not ( = ?auto_312456 ?auto_312466 ) ) ( not ( = ?auto_312456 ?auto_312467 ) ) ( not ( = ?auto_312456 ?auto_312468 ) ) ( not ( = ?auto_312457 ?auto_312458 ) ) ( not ( = ?auto_312457 ?auto_312459 ) ) ( not ( = ?auto_312457 ?auto_312460 ) ) ( not ( = ?auto_312457 ?auto_312461 ) ) ( not ( = ?auto_312457 ?auto_312462 ) ) ( not ( = ?auto_312457 ?auto_312463 ) ) ( not ( = ?auto_312457 ?auto_312464 ) ) ( not ( = ?auto_312457 ?auto_312465 ) ) ( not ( = ?auto_312457 ?auto_312466 ) ) ( not ( = ?auto_312457 ?auto_312467 ) ) ( not ( = ?auto_312457 ?auto_312468 ) ) ( not ( = ?auto_312458 ?auto_312459 ) ) ( not ( = ?auto_312458 ?auto_312460 ) ) ( not ( = ?auto_312458 ?auto_312461 ) ) ( not ( = ?auto_312458 ?auto_312462 ) ) ( not ( = ?auto_312458 ?auto_312463 ) ) ( not ( = ?auto_312458 ?auto_312464 ) ) ( not ( = ?auto_312458 ?auto_312465 ) ) ( not ( = ?auto_312458 ?auto_312466 ) ) ( not ( = ?auto_312458 ?auto_312467 ) ) ( not ( = ?auto_312458 ?auto_312468 ) ) ( not ( = ?auto_312459 ?auto_312460 ) ) ( not ( = ?auto_312459 ?auto_312461 ) ) ( not ( = ?auto_312459 ?auto_312462 ) ) ( not ( = ?auto_312459 ?auto_312463 ) ) ( not ( = ?auto_312459 ?auto_312464 ) ) ( not ( = ?auto_312459 ?auto_312465 ) ) ( not ( = ?auto_312459 ?auto_312466 ) ) ( not ( = ?auto_312459 ?auto_312467 ) ) ( not ( = ?auto_312459 ?auto_312468 ) ) ( not ( = ?auto_312460 ?auto_312461 ) ) ( not ( = ?auto_312460 ?auto_312462 ) ) ( not ( = ?auto_312460 ?auto_312463 ) ) ( not ( = ?auto_312460 ?auto_312464 ) ) ( not ( = ?auto_312460 ?auto_312465 ) ) ( not ( = ?auto_312460 ?auto_312466 ) ) ( not ( = ?auto_312460 ?auto_312467 ) ) ( not ( = ?auto_312460 ?auto_312468 ) ) ( not ( = ?auto_312461 ?auto_312462 ) ) ( not ( = ?auto_312461 ?auto_312463 ) ) ( not ( = ?auto_312461 ?auto_312464 ) ) ( not ( = ?auto_312461 ?auto_312465 ) ) ( not ( = ?auto_312461 ?auto_312466 ) ) ( not ( = ?auto_312461 ?auto_312467 ) ) ( not ( = ?auto_312461 ?auto_312468 ) ) ( not ( = ?auto_312462 ?auto_312463 ) ) ( not ( = ?auto_312462 ?auto_312464 ) ) ( not ( = ?auto_312462 ?auto_312465 ) ) ( not ( = ?auto_312462 ?auto_312466 ) ) ( not ( = ?auto_312462 ?auto_312467 ) ) ( not ( = ?auto_312462 ?auto_312468 ) ) ( not ( = ?auto_312463 ?auto_312464 ) ) ( not ( = ?auto_312463 ?auto_312465 ) ) ( not ( = ?auto_312463 ?auto_312466 ) ) ( not ( = ?auto_312463 ?auto_312467 ) ) ( not ( = ?auto_312463 ?auto_312468 ) ) ( not ( = ?auto_312464 ?auto_312465 ) ) ( not ( = ?auto_312464 ?auto_312466 ) ) ( not ( = ?auto_312464 ?auto_312467 ) ) ( not ( = ?auto_312464 ?auto_312468 ) ) ( not ( = ?auto_312465 ?auto_312466 ) ) ( not ( = ?auto_312465 ?auto_312467 ) ) ( not ( = ?auto_312465 ?auto_312468 ) ) ( not ( = ?auto_312466 ?auto_312467 ) ) ( not ( = ?auto_312466 ?auto_312468 ) ) ( not ( = ?auto_312467 ?auto_312468 ) ) ( ON ?auto_312466 ?auto_312467 ) ( ON ?auto_312465 ?auto_312466 ) ( ON ?auto_312464 ?auto_312465 ) ( ON ?auto_312463 ?auto_312464 ) ( ON ?auto_312462 ?auto_312463 ) ( ON ?auto_312461 ?auto_312462 ) ( ON ?auto_312460 ?auto_312461 ) ( ON ?auto_312459 ?auto_312460 ) ( CLEAR ?auto_312457 ) ( ON ?auto_312458 ?auto_312459 ) ( CLEAR ?auto_312458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_312455 ?auto_312456 ?auto_312457 ?auto_312458 )
      ( MAKE-13PILE ?auto_312455 ?auto_312456 ?auto_312457 ?auto_312458 ?auto_312459 ?auto_312460 ?auto_312461 ?auto_312462 ?auto_312463 ?auto_312464 ?auto_312465 ?auto_312466 ?auto_312467 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312509 - BLOCK
      ?auto_312510 - BLOCK
      ?auto_312511 - BLOCK
      ?auto_312512 - BLOCK
      ?auto_312513 - BLOCK
      ?auto_312514 - BLOCK
      ?auto_312515 - BLOCK
      ?auto_312516 - BLOCK
      ?auto_312517 - BLOCK
      ?auto_312518 - BLOCK
      ?auto_312519 - BLOCK
      ?auto_312520 - BLOCK
      ?auto_312521 - BLOCK
    )
    :vars
    (
      ?auto_312522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312521 ?auto_312522 ) ( ON-TABLE ?auto_312509 ) ( ON ?auto_312510 ?auto_312509 ) ( not ( = ?auto_312509 ?auto_312510 ) ) ( not ( = ?auto_312509 ?auto_312511 ) ) ( not ( = ?auto_312509 ?auto_312512 ) ) ( not ( = ?auto_312509 ?auto_312513 ) ) ( not ( = ?auto_312509 ?auto_312514 ) ) ( not ( = ?auto_312509 ?auto_312515 ) ) ( not ( = ?auto_312509 ?auto_312516 ) ) ( not ( = ?auto_312509 ?auto_312517 ) ) ( not ( = ?auto_312509 ?auto_312518 ) ) ( not ( = ?auto_312509 ?auto_312519 ) ) ( not ( = ?auto_312509 ?auto_312520 ) ) ( not ( = ?auto_312509 ?auto_312521 ) ) ( not ( = ?auto_312509 ?auto_312522 ) ) ( not ( = ?auto_312510 ?auto_312511 ) ) ( not ( = ?auto_312510 ?auto_312512 ) ) ( not ( = ?auto_312510 ?auto_312513 ) ) ( not ( = ?auto_312510 ?auto_312514 ) ) ( not ( = ?auto_312510 ?auto_312515 ) ) ( not ( = ?auto_312510 ?auto_312516 ) ) ( not ( = ?auto_312510 ?auto_312517 ) ) ( not ( = ?auto_312510 ?auto_312518 ) ) ( not ( = ?auto_312510 ?auto_312519 ) ) ( not ( = ?auto_312510 ?auto_312520 ) ) ( not ( = ?auto_312510 ?auto_312521 ) ) ( not ( = ?auto_312510 ?auto_312522 ) ) ( not ( = ?auto_312511 ?auto_312512 ) ) ( not ( = ?auto_312511 ?auto_312513 ) ) ( not ( = ?auto_312511 ?auto_312514 ) ) ( not ( = ?auto_312511 ?auto_312515 ) ) ( not ( = ?auto_312511 ?auto_312516 ) ) ( not ( = ?auto_312511 ?auto_312517 ) ) ( not ( = ?auto_312511 ?auto_312518 ) ) ( not ( = ?auto_312511 ?auto_312519 ) ) ( not ( = ?auto_312511 ?auto_312520 ) ) ( not ( = ?auto_312511 ?auto_312521 ) ) ( not ( = ?auto_312511 ?auto_312522 ) ) ( not ( = ?auto_312512 ?auto_312513 ) ) ( not ( = ?auto_312512 ?auto_312514 ) ) ( not ( = ?auto_312512 ?auto_312515 ) ) ( not ( = ?auto_312512 ?auto_312516 ) ) ( not ( = ?auto_312512 ?auto_312517 ) ) ( not ( = ?auto_312512 ?auto_312518 ) ) ( not ( = ?auto_312512 ?auto_312519 ) ) ( not ( = ?auto_312512 ?auto_312520 ) ) ( not ( = ?auto_312512 ?auto_312521 ) ) ( not ( = ?auto_312512 ?auto_312522 ) ) ( not ( = ?auto_312513 ?auto_312514 ) ) ( not ( = ?auto_312513 ?auto_312515 ) ) ( not ( = ?auto_312513 ?auto_312516 ) ) ( not ( = ?auto_312513 ?auto_312517 ) ) ( not ( = ?auto_312513 ?auto_312518 ) ) ( not ( = ?auto_312513 ?auto_312519 ) ) ( not ( = ?auto_312513 ?auto_312520 ) ) ( not ( = ?auto_312513 ?auto_312521 ) ) ( not ( = ?auto_312513 ?auto_312522 ) ) ( not ( = ?auto_312514 ?auto_312515 ) ) ( not ( = ?auto_312514 ?auto_312516 ) ) ( not ( = ?auto_312514 ?auto_312517 ) ) ( not ( = ?auto_312514 ?auto_312518 ) ) ( not ( = ?auto_312514 ?auto_312519 ) ) ( not ( = ?auto_312514 ?auto_312520 ) ) ( not ( = ?auto_312514 ?auto_312521 ) ) ( not ( = ?auto_312514 ?auto_312522 ) ) ( not ( = ?auto_312515 ?auto_312516 ) ) ( not ( = ?auto_312515 ?auto_312517 ) ) ( not ( = ?auto_312515 ?auto_312518 ) ) ( not ( = ?auto_312515 ?auto_312519 ) ) ( not ( = ?auto_312515 ?auto_312520 ) ) ( not ( = ?auto_312515 ?auto_312521 ) ) ( not ( = ?auto_312515 ?auto_312522 ) ) ( not ( = ?auto_312516 ?auto_312517 ) ) ( not ( = ?auto_312516 ?auto_312518 ) ) ( not ( = ?auto_312516 ?auto_312519 ) ) ( not ( = ?auto_312516 ?auto_312520 ) ) ( not ( = ?auto_312516 ?auto_312521 ) ) ( not ( = ?auto_312516 ?auto_312522 ) ) ( not ( = ?auto_312517 ?auto_312518 ) ) ( not ( = ?auto_312517 ?auto_312519 ) ) ( not ( = ?auto_312517 ?auto_312520 ) ) ( not ( = ?auto_312517 ?auto_312521 ) ) ( not ( = ?auto_312517 ?auto_312522 ) ) ( not ( = ?auto_312518 ?auto_312519 ) ) ( not ( = ?auto_312518 ?auto_312520 ) ) ( not ( = ?auto_312518 ?auto_312521 ) ) ( not ( = ?auto_312518 ?auto_312522 ) ) ( not ( = ?auto_312519 ?auto_312520 ) ) ( not ( = ?auto_312519 ?auto_312521 ) ) ( not ( = ?auto_312519 ?auto_312522 ) ) ( not ( = ?auto_312520 ?auto_312521 ) ) ( not ( = ?auto_312520 ?auto_312522 ) ) ( not ( = ?auto_312521 ?auto_312522 ) ) ( ON ?auto_312520 ?auto_312521 ) ( ON ?auto_312519 ?auto_312520 ) ( ON ?auto_312518 ?auto_312519 ) ( ON ?auto_312517 ?auto_312518 ) ( ON ?auto_312516 ?auto_312517 ) ( ON ?auto_312515 ?auto_312516 ) ( ON ?auto_312514 ?auto_312515 ) ( ON ?auto_312513 ?auto_312514 ) ( ON ?auto_312512 ?auto_312513 ) ( CLEAR ?auto_312510 ) ( ON ?auto_312511 ?auto_312512 ) ( CLEAR ?auto_312511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_312509 ?auto_312510 ?auto_312511 )
      ( MAKE-13PILE ?auto_312509 ?auto_312510 ?auto_312511 ?auto_312512 ?auto_312513 ?auto_312514 ?auto_312515 ?auto_312516 ?auto_312517 ?auto_312518 ?auto_312519 ?auto_312520 ?auto_312521 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312563 - BLOCK
      ?auto_312564 - BLOCK
      ?auto_312565 - BLOCK
      ?auto_312566 - BLOCK
      ?auto_312567 - BLOCK
      ?auto_312568 - BLOCK
      ?auto_312569 - BLOCK
      ?auto_312570 - BLOCK
      ?auto_312571 - BLOCK
      ?auto_312572 - BLOCK
      ?auto_312573 - BLOCK
      ?auto_312574 - BLOCK
      ?auto_312575 - BLOCK
    )
    :vars
    (
      ?auto_312576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312575 ?auto_312576 ) ( ON-TABLE ?auto_312563 ) ( not ( = ?auto_312563 ?auto_312564 ) ) ( not ( = ?auto_312563 ?auto_312565 ) ) ( not ( = ?auto_312563 ?auto_312566 ) ) ( not ( = ?auto_312563 ?auto_312567 ) ) ( not ( = ?auto_312563 ?auto_312568 ) ) ( not ( = ?auto_312563 ?auto_312569 ) ) ( not ( = ?auto_312563 ?auto_312570 ) ) ( not ( = ?auto_312563 ?auto_312571 ) ) ( not ( = ?auto_312563 ?auto_312572 ) ) ( not ( = ?auto_312563 ?auto_312573 ) ) ( not ( = ?auto_312563 ?auto_312574 ) ) ( not ( = ?auto_312563 ?auto_312575 ) ) ( not ( = ?auto_312563 ?auto_312576 ) ) ( not ( = ?auto_312564 ?auto_312565 ) ) ( not ( = ?auto_312564 ?auto_312566 ) ) ( not ( = ?auto_312564 ?auto_312567 ) ) ( not ( = ?auto_312564 ?auto_312568 ) ) ( not ( = ?auto_312564 ?auto_312569 ) ) ( not ( = ?auto_312564 ?auto_312570 ) ) ( not ( = ?auto_312564 ?auto_312571 ) ) ( not ( = ?auto_312564 ?auto_312572 ) ) ( not ( = ?auto_312564 ?auto_312573 ) ) ( not ( = ?auto_312564 ?auto_312574 ) ) ( not ( = ?auto_312564 ?auto_312575 ) ) ( not ( = ?auto_312564 ?auto_312576 ) ) ( not ( = ?auto_312565 ?auto_312566 ) ) ( not ( = ?auto_312565 ?auto_312567 ) ) ( not ( = ?auto_312565 ?auto_312568 ) ) ( not ( = ?auto_312565 ?auto_312569 ) ) ( not ( = ?auto_312565 ?auto_312570 ) ) ( not ( = ?auto_312565 ?auto_312571 ) ) ( not ( = ?auto_312565 ?auto_312572 ) ) ( not ( = ?auto_312565 ?auto_312573 ) ) ( not ( = ?auto_312565 ?auto_312574 ) ) ( not ( = ?auto_312565 ?auto_312575 ) ) ( not ( = ?auto_312565 ?auto_312576 ) ) ( not ( = ?auto_312566 ?auto_312567 ) ) ( not ( = ?auto_312566 ?auto_312568 ) ) ( not ( = ?auto_312566 ?auto_312569 ) ) ( not ( = ?auto_312566 ?auto_312570 ) ) ( not ( = ?auto_312566 ?auto_312571 ) ) ( not ( = ?auto_312566 ?auto_312572 ) ) ( not ( = ?auto_312566 ?auto_312573 ) ) ( not ( = ?auto_312566 ?auto_312574 ) ) ( not ( = ?auto_312566 ?auto_312575 ) ) ( not ( = ?auto_312566 ?auto_312576 ) ) ( not ( = ?auto_312567 ?auto_312568 ) ) ( not ( = ?auto_312567 ?auto_312569 ) ) ( not ( = ?auto_312567 ?auto_312570 ) ) ( not ( = ?auto_312567 ?auto_312571 ) ) ( not ( = ?auto_312567 ?auto_312572 ) ) ( not ( = ?auto_312567 ?auto_312573 ) ) ( not ( = ?auto_312567 ?auto_312574 ) ) ( not ( = ?auto_312567 ?auto_312575 ) ) ( not ( = ?auto_312567 ?auto_312576 ) ) ( not ( = ?auto_312568 ?auto_312569 ) ) ( not ( = ?auto_312568 ?auto_312570 ) ) ( not ( = ?auto_312568 ?auto_312571 ) ) ( not ( = ?auto_312568 ?auto_312572 ) ) ( not ( = ?auto_312568 ?auto_312573 ) ) ( not ( = ?auto_312568 ?auto_312574 ) ) ( not ( = ?auto_312568 ?auto_312575 ) ) ( not ( = ?auto_312568 ?auto_312576 ) ) ( not ( = ?auto_312569 ?auto_312570 ) ) ( not ( = ?auto_312569 ?auto_312571 ) ) ( not ( = ?auto_312569 ?auto_312572 ) ) ( not ( = ?auto_312569 ?auto_312573 ) ) ( not ( = ?auto_312569 ?auto_312574 ) ) ( not ( = ?auto_312569 ?auto_312575 ) ) ( not ( = ?auto_312569 ?auto_312576 ) ) ( not ( = ?auto_312570 ?auto_312571 ) ) ( not ( = ?auto_312570 ?auto_312572 ) ) ( not ( = ?auto_312570 ?auto_312573 ) ) ( not ( = ?auto_312570 ?auto_312574 ) ) ( not ( = ?auto_312570 ?auto_312575 ) ) ( not ( = ?auto_312570 ?auto_312576 ) ) ( not ( = ?auto_312571 ?auto_312572 ) ) ( not ( = ?auto_312571 ?auto_312573 ) ) ( not ( = ?auto_312571 ?auto_312574 ) ) ( not ( = ?auto_312571 ?auto_312575 ) ) ( not ( = ?auto_312571 ?auto_312576 ) ) ( not ( = ?auto_312572 ?auto_312573 ) ) ( not ( = ?auto_312572 ?auto_312574 ) ) ( not ( = ?auto_312572 ?auto_312575 ) ) ( not ( = ?auto_312572 ?auto_312576 ) ) ( not ( = ?auto_312573 ?auto_312574 ) ) ( not ( = ?auto_312573 ?auto_312575 ) ) ( not ( = ?auto_312573 ?auto_312576 ) ) ( not ( = ?auto_312574 ?auto_312575 ) ) ( not ( = ?auto_312574 ?auto_312576 ) ) ( not ( = ?auto_312575 ?auto_312576 ) ) ( ON ?auto_312574 ?auto_312575 ) ( ON ?auto_312573 ?auto_312574 ) ( ON ?auto_312572 ?auto_312573 ) ( ON ?auto_312571 ?auto_312572 ) ( ON ?auto_312570 ?auto_312571 ) ( ON ?auto_312569 ?auto_312570 ) ( ON ?auto_312568 ?auto_312569 ) ( ON ?auto_312567 ?auto_312568 ) ( ON ?auto_312566 ?auto_312567 ) ( ON ?auto_312565 ?auto_312566 ) ( CLEAR ?auto_312563 ) ( ON ?auto_312564 ?auto_312565 ) ( CLEAR ?auto_312564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_312563 ?auto_312564 )
      ( MAKE-13PILE ?auto_312563 ?auto_312564 ?auto_312565 ?auto_312566 ?auto_312567 ?auto_312568 ?auto_312569 ?auto_312570 ?auto_312571 ?auto_312572 ?auto_312573 ?auto_312574 ?auto_312575 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_312617 - BLOCK
      ?auto_312618 - BLOCK
      ?auto_312619 - BLOCK
      ?auto_312620 - BLOCK
      ?auto_312621 - BLOCK
      ?auto_312622 - BLOCK
      ?auto_312623 - BLOCK
      ?auto_312624 - BLOCK
      ?auto_312625 - BLOCK
      ?auto_312626 - BLOCK
      ?auto_312627 - BLOCK
      ?auto_312628 - BLOCK
      ?auto_312629 - BLOCK
    )
    :vars
    (
      ?auto_312630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312629 ?auto_312630 ) ( not ( = ?auto_312617 ?auto_312618 ) ) ( not ( = ?auto_312617 ?auto_312619 ) ) ( not ( = ?auto_312617 ?auto_312620 ) ) ( not ( = ?auto_312617 ?auto_312621 ) ) ( not ( = ?auto_312617 ?auto_312622 ) ) ( not ( = ?auto_312617 ?auto_312623 ) ) ( not ( = ?auto_312617 ?auto_312624 ) ) ( not ( = ?auto_312617 ?auto_312625 ) ) ( not ( = ?auto_312617 ?auto_312626 ) ) ( not ( = ?auto_312617 ?auto_312627 ) ) ( not ( = ?auto_312617 ?auto_312628 ) ) ( not ( = ?auto_312617 ?auto_312629 ) ) ( not ( = ?auto_312617 ?auto_312630 ) ) ( not ( = ?auto_312618 ?auto_312619 ) ) ( not ( = ?auto_312618 ?auto_312620 ) ) ( not ( = ?auto_312618 ?auto_312621 ) ) ( not ( = ?auto_312618 ?auto_312622 ) ) ( not ( = ?auto_312618 ?auto_312623 ) ) ( not ( = ?auto_312618 ?auto_312624 ) ) ( not ( = ?auto_312618 ?auto_312625 ) ) ( not ( = ?auto_312618 ?auto_312626 ) ) ( not ( = ?auto_312618 ?auto_312627 ) ) ( not ( = ?auto_312618 ?auto_312628 ) ) ( not ( = ?auto_312618 ?auto_312629 ) ) ( not ( = ?auto_312618 ?auto_312630 ) ) ( not ( = ?auto_312619 ?auto_312620 ) ) ( not ( = ?auto_312619 ?auto_312621 ) ) ( not ( = ?auto_312619 ?auto_312622 ) ) ( not ( = ?auto_312619 ?auto_312623 ) ) ( not ( = ?auto_312619 ?auto_312624 ) ) ( not ( = ?auto_312619 ?auto_312625 ) ) ( not ( = ?auto_312619 ?auto_312626 ) ) ( not ( = ?auto_312619 ?auto_312627 ) ) ( not ( = ?auto_312619 ?auto_312628 ) ) ( not ( = ?auto_312619 ?auto_312629 ) ) ( not ( = ?auto_312619 ?auto_312630 ) ) ( not ( = ?auto_312620 ?auto_312621 ) ) ( not ( = ?auto_312620 ?auto_312622 ) ) ( not ( = ?auto_312620 ?auto_312623 ) ) ( not ( = ?auto_312620 ?auto_312624 ) ) ( not ( = ?auto_312620 ?auto_312625 ) ) ( not ( = ?auto_312620 ?auto_312626 ) ) ( not ( = ?auto_312620 ?auto_312627 ) ) ( not ( = ?auto_312620 ?auto_312628 ) ) ( not ( = ?auto_312620 ?auto_312629 ) ) ( not ( = ?auto_312620 ?auto_312630 ) ) ( not ( = ?auto_312621 ?auto_312622 ) ) ( not ( = ?auto_312621 ?auto_312623 ) ) ( not ( = ?auto_312621 ?auto_312624 ) ) ( not ( = ?auto_312621 ?auto_312625 ) ) ( not ( = ?auto_312621 ?auto_312626 ) ) ( not ( = ?auto_312621 ?auto_312627 ) ) ( not ( = ?auto_312621 ?auto_312628 ) ) ( not ( = ?auto_312621 ?auto_312629 ) ) ( not ( = ?auto_312621 ?auto_312630 ) ) ( not ( = ?auto_312622 ?auto_312623 ) ) ( not ( = ?auto_312622 ?auto_312624 ) ) ( not ( = ?auto_312622 ?auto_312625 ) ) ( not ( = ?auto_312622 ?auto_312626 ) ) ( not ( = ?auto_312622 ?auto_312627 ) ) ( not ( = ?auto_312622 ?auto_312628 ) ) ( not ( = ?auto_312622 ?auto_312629 ) ) ( not ( = ?auto_312622 ?auto_312630 ) ) ( not ( = ?auto_312623 ?auto_312624 ) ) ( not ( = ?auto_312623 ?auto_312625 ) ) ( not ( = ?auto_312623 ?auto_312626 ) ) ( not ( = ?auto_312623 ?auto_312627 ) ) ( not ( = ?auto_312623 ?auto_312628 ) ) ( not ( = ?auto_312623 ?auto_312629 ) ) ( not ( = ?auto_312623 ?auto_312630 ) ) ( not ( = ?auto_312624 ?auto_312625 ) ) ( not ( = ?auto_312624 ?auto_312626 ) ) ( not ( = ?auto_312624 ?auto_312627 ) ) ( not ( = ?auto_312624 ?auto_312628 ) ) ( not ( = ?auto_312624 ?auto_312629 ) ) ( not ( = ?auto_312624 ?auto_312630 ) ) ( not ( = ?auto_312625 ?auto_312626 ) ) ( not ( = ?auto_312625 ?auto_312627 ) ) ( not ( = ?auto_312625 ?auto_312628 ) ) ( not ( = ?auto_312625 ?auto_312629 ) ) ( not ( = ?auto_312625 ?auto_312630 ) ) ( not ( = ?auto_312626 ?auto_312627 ) ) ( not ( = ?auto_312626 ?auto_312628 ) ) ( not ( = ?auto_312626 ?auto_312629 ) ) ( not ( = ?auto_312626 ?auto_312630 ) ) ( not ( = ?auto_312627 ?auto_312628 ) ) ( not ( = ?auto_312627 ?auto_312629 ) ) ( not ( = ?auto_312627 ?auto_312630 ) ) ( not ( = ?auto_312628 ?auto_312629 ) ) ( not ( = ?auto_312628 ?auto_312630 ) ) ( not ( = ?auto_312629 ?auto_312630 ) ) ( ON ?auto_312628 ?auto_312629 ) ( ON ?auto_312627 ?auto_312628 ) ( ON ?auto_312626 ?auto_312627 ) ( ON ?auto_312625 ?auto_312626 ) ( ON ?auto_312624 ?auto_312625 ) ( ON ?auto_312623 ?auto_312624 ) ( ON ?auto_312622 ?auto_312623 ) ( ON ?auto_312621 ?auto_312622 ) ( ON ?auto_312620 ?auto_312621 ) ( ON ?auto_312619 ?auto_312620 ) ( ON ?auto_312618 ?auto_312619 ) ( ON ?auto_312617 ?auto_312618 ) ( CLEAR ?auto_312617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_312617 )
      ( MAKE-13PILE ?auto_312617 ?auto_312618 ?auto_312619 ?auto_312620 ?auto_312621 ?auto_312622 ?auto_312623 ?auto_312624 ?auto_312625 ?auto_312626 ?auto_312627 ?auto_312628 ?auto_312629 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312672 - BLOCK
      ?auto_312673 - BLOCK
      ?auto_312674 - BLOCK
      ?auto_312675 - BLOCK
      ?auto_312676 - BLOCK
      ?auto_312677 - BLOCK
      ?auto_312678 - BLOCK
      ?auto_312679 - BLOCK
      ?auto_312680 - BLOCK
      ?auto_312681 - BLOCK
      ?auto_312682 - BLOCK
      ?auto_312683 - BLOCK
      ?auto_312684 - BLOCK
      ?auto_312685 - BLOCK
    )
    :vars
    (
      ?auto_312686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_312684 ) ( ON ?auto_312685 ?auto_312686 ) ( CLEAR ?auto_312685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_312672 ) ( ON ?auto_312673 ?auto_312672 ) ( ON ?auto_312674 ?auto_312673 ) ( ON ?auto_312675 ?auto_312674 ) ( ON ?auto_312676 ?auto_312675 ) ( ON ?auto_312677 ?auto_312676 ) ( ON ?auto_312678 ?auto_312677 ) ( ON ?auto_312679 ?auto_312678 ) ( ON ?auto_312680 ?auto_312679 ) ( ON ?auto_312681 ?auto_312680 ) ( ON ?auto_312682 ?auto_312681 ) ( ON ?auto_312683 ?auto_312682 ) ( ON ?auto_312684 ?auto_312683 ) ( not ( = ?auto_312672 ?auto_312673 ) ) ( not ( = ?auto_312672 ?auto_312674 ) ) ( not ( = ?auto_312672 ?auto_312675 ) ) ( not ( = ?auto_312672 ?auto_312676 ) ) ( not ( = ?auto_312672 ?auto_312677 ) ) ( not ( = ?auto_312672 ?auto_312678 ) ) ( not ( = ?auto_312672 ?auto_312679 ) ) ( not ( = ?auto_312672 ?auto_312680 ) ) ( not ( = ?auto_312672 ?auto_312681 ) ) ( not ( = ?auto_312672 ?auto_312682 ) ) ( not ( = ?auto_312672 ?auto_312683 ) ) ( not ( = ?auto_312672 ?auto_312684 ) ) ( not ( = ?auto_312672 ?auto_312685 ) ) ( not ( = ?auto_312672 ?auto_312686 ) ) ( not ( = ?auto_312673 ?auto_312674 ) ) ( not ( = ?auto_312673 ?auto_312675 ) ) ( not ( = ?auto_312673 ?auto_312676 ) ) ( not ( = ?auto_312673 ?auto_312677 ) ) ( not ( = ?auto_312673 ?auto_312678 ) ) ( not ( = ?auto_312673 ?auto_312679 ) ) ( not ( = ?auto_312673 ?auto_312680 ) ) ( not ( = ?auto_312673 ?auto_312681 ) ) ( not ( = ?auto_312673 ?auto_312682 ) ) ( not ( = ?auto_312673 ?auto_312683 ) ) ( not ( = ?auto_312673 ?auto_312684 ) ) ( not ( = ?auto_312673 ?auto_312685 ) ) ( not ( = ?auto_312673 ?auto_312686 ) ) ( not ( = ?auto_312674 ?auto_312675 ) ) ( not ( = ?auto_312674 ?auto_312676 ) ) ( not ( = ?auto_312674 ?auto_312677 ) ) ( not ( = ?auto_312674 ?auto_312678 ) ) ( not ( = ?auto_312674 ?auto_312679 ) ) ( not ( = ?auto_312674 ?auto_312680 ) ) ( not ( = ?auto_312674 ?auto_312681 ) ) ( not ( = ?auto_312674 ?auto_312682 ) ) ( not ( = ?auto_312674 ?auto_312683 ) ) ( not ( = ?auto_312674 ?auto_312684 ) ) ( not ( = ?auto_312674 ?auto_312685 ) ) ( not ( = ?auto_312674 ?auto_312686 ) ) ( not ( = ?auto_312675 ?auto_312676 ) ) ( not ( = ?auto_312675 ?auto_312677 ) ) ( not ( = ?auto_312675 ?auto_312678 ) ) ( not ( = ?auto_312675 ?auto_312679 ) ) ( not ( = ?auto_312675 ?auto_312680 ) ) ( not ( = ?auto_312675 ?auto_312681 ) ) ( not ( = ?auto_312675 ?auto_312682 ) ) ( not ( = ?auto_312675 ?auto_312683 ) ) ( not ( = ?auto_312675 ?auto_312684 ) ) ( not ( = ?auto_312675 ?auto_312685 ) ) ( not ( = ?auto_312675 ?auto_312686 ) ) ( not ( = ?auto_312676 ?auto_312677 ) ) ( not ( = ?auto_312676 ?auto_312678 ) ) ( not ( = ?auto_312676 ?auto_312679 ) ) ( not ( = ?auto_312676 ?auto_312680 ) ) ( not ( = ?auto_312676 ?auto_312681 ) ) ( not ( = ?auto_312676 ?auto_312682 ) ) ( not ( = ?auto_312676 ?auto_312683 ) ) ( not ( = ?auto_312676 ?auto_312684 ) ) ( not ( = ?auto_312676 ?auto_312685 ) ) ( not ( = ?auto_312676 ?auto_312686 ) ) ( not ( = ?auto_312677 ?auto_312678 ) ) ( not ( = ?auto_312677 ?auto_312679 ) ) ( not ( = ?auto_312677 ?auto_312680 ) ) ( not ( = ?auto_312677 ?auto_312681 ) ) ( not ( = ?auto_312677 ?auto_312682 ) ) ( not ( = ?auto_312677 ?auto_312683 ) ) ( not ( = ?auto_312677 ?auto_312684 ) ) ( not ( = ?auto_312677 ?auto_312685 ) ) ( not ( = ?auto_312677 ?auto_312686 ) ) ( not ( = ?auto_312678 ?auto_312679 ) ) ( not ( = ?auto_312678 ?auto_312680 ) ) ( not ( = ?auto_312678 ?auto_312681 ) ) ( not ( = ?auto_312678 ?auto_312682 ) ) ( not ( = ?auto_312678 ?auto_312683 ) ) ( not ( = ?auto_312678 ?auto_312684 ) ) ( not ( = ?auto_312678 ?auto_312685 ) ) ( not ( = ?auto_312678 ?auto_312686 ) ) ( not ( = ?auto_312679 ?auto_312680 ) ) ( not ( = ?auto_312679 ?auto_312681 ) ) ( not ( = ?auto_312679 ?auto_312682 ) ) ( not ( = ?auto_312679 ?auto_312683 ) ) ( not ( = ?auto_312679 ?auto_312684 ) ) ( not ( = ?auto_312679 ?auto_312685 ) ) ( not ( = ?auto_312679 ?auto_312686 ) ) ( not ( = ?auto_312680 ?auto_312681 ) ) ( not ( = ?auto_312680 ?auto_312682 ) ) ( not ( = ?auto_312680 ?auto_312683 ) ) ( not ( = ?auto_312680 ?auto_312684 ) ) ( not ( = ?auto_312680 ?auto_312685 ) ) ( not ( = ?auto_312680 ?auto_312686 ) ) ( not ( = ?auto_312681 ?auto_312682 ) ) ( not ( = ?auto_312681 ?auto_312683 ) ) ( not ( = ?auto_312681 ?auto_312684 ) ) ( not ( = ?auto_312681 ?auto_312685 ) ) ( not ( = ?auto_312681 ?auto_312686 ) ) ( not ( = ?auto_312682 ?auto_312683 ) ) ( not ( = ?auto_312682 ?auto_312684 ) ) ( not ( = ?auto_312682 ?auto_312685 ) ) ( not ( = ?auto_312682 ?auto_312686 ) ) ( not ( = ?auto_312683 ?auto_312684 ) ) ( not ( = ?auto_312683 ?auto_312685 ) ) ( not ( = ?auto_312683 ?auto_312686 ) ) ( not ( = ?auto_312684 ?auto_312685 ) ) ( not ( = ?auto_312684 ?auto_312686 ) ) ( not ( = ?auto_312685 ?auto_312686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_312685 ?auto_312686 )
      ( !STACK ?auto_312685 ?auto_312684 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312701 - BLOCK
      ?auto_312702 - BLOCK
      ?auto_312703 - BLOCK
      ?auto_312704 - BLOCK
      ?auto_312705 - BLOCK
      ?auto_312706 - BLOCK
      ?auto_312707 - BLOCK
      ?auto_312708 - BLOCK
      ?auto_312709 - BLOCK
      ?auto_312710 - BLOCK
      ?auto_312711 - BLOCK
      ?auto_312712 - BLOCK
      ?auto_312713 - BLOCK
      ?auto_312714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_312713 ) ( ON-TABLE ?auto_312714 ) ( CLEAR ?auto_312714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_312701 ) ( ON ?auto_312702 ?auto_312701 ) ( ON ?auto_312703 ?auto_312702 ) ( ON ?auto_312704 ?auto_312703 ) ( ON ?auto_312705 ?auto_312704 ) ( ON ?auto_312706 ?auto_312705 ) ( ON ?auto_312707 ?auto_312706 ) ( ON ?auto_312708 ?auto_312707 ) ( ON ?auto_312709 ?auto_312708 ) ( ON ?auto_312710 ?auto_312709 ) ( ON ?auto_312711 ?auto_312710 ) ( ON ?auto_312712 ?auto_312711 ) ( ON ?auto_312713 ?auto_312712 ) ( not ( = ?auto_312701 ?auto_312702 ) ) ( not ( = ?auto_312701 ?auto_312703 ) ) ( not ( = ?auto_312701 ?auto_312704 ) ) ( not ( = ?auto_312701 ?auto_312705 ) ) ( not ( = ?auto_312701 ?auto_312706 ) ) ( not ( = ?auto_312701 ?auto_312707 ) ) ( not ( = ?auto_312701 ?auto_312708 ) ) ( not ( = ?auto_312701 ?auto_312709 ) ) ( not ( = ?auto_312701 ?auto_312710 ) ) ( not ( = ?auto_312701 ?auto_312711 ) ) ( not ( = ?auto_312701 ?auto_312712 ) ) ( not ( = ?auto_312701 ?auto_312713 ) ) ( not ( = ?auto_312701 ?auto_312714 ) ) ( not ( = ?auto_312702 ?auto_312703 ) ) ( not ( = ?auto_312702 ?auto_312704 ) ) ( not ( = ?auto_312702 ?auto_312705 ) ) ( not ( = ?auto_312702 ?auto_312706 ) ) ( not ( = ?auto_312702 ?auto_312707 ) ) ( not ( = ?auto_312702 ?auto_312708 ) ) ( not ( = ?auto_312702 ?auto_312709 ) ) ( not ( = ?auto_312702 ?auto_312710 ) ) ( not ( = ?auto_312702 ?auto_312711 ) ) ( not ( = ?auto_312702 ?auto_312712 ) ) ( not ( = ?auto_312702 ?auto_312713 ) ) ( not ( = ?auto_312702 ?auto_312714 ) ) ( not ( = ?auto_312703 ?auto_312704 ) ) ( not ( = ?auto_312703 ?auto_312705 ) ) ( not ( = ?auto_312703 ?auto_312706 ) ) ( not ( = ?auto_312703 ?auto_312707 ) ) ( not ( = ?auto_312703 ?auto_312708 ) ) ( not ( = ?auto_312703 ?auto_312709 ) ) ( not ( = ?auto_312703 ?auto_312710 ) ) ( not ( = ?auto_312703 ?auto_312711 ) ) ( not ( = ?auto_312703 ?auto_312712 ) ) ( not ( = ?auto_312703 ?auto_312713 ) ) ( not ( = ?auto_312703 ?auto_312714 ) ) ( not ( = ?auto_312704 ?auto_312705 ) ) ( not ( = ?auto_312704 ?auto_312706 ) ) ( not ( = ?auto_312704 ?auto_312707 ) ) ( not ( = ?auto_312704 ?auto_312708 ) ) ( not ( = ?auto_312704 ?auto_312709 ) ) ( not ( = ?auto_312704 ?auto_312710 ) ) ( not ( = ?auto_312704 ?auto_312711 ) ) ( not ( = ?auto_312704 ?auto_312712 ) ) ( not ( = ?auto_312704 ?auto_312713 ) ) ( not ( = ?auto_312704 ?auto_312714 ) ) ( not ( = ?auto_312705 ?auto_312706 ) ) ( not ( = ?auto_312705 ?auto_312707 ) ) ( not ( = ?auto_312705 ?auto_312708 ) ) ( not ( = ?auto_312705 ?auto_312709 ) ) ( not ( = ?auto_312705 ?auto_312710 ) ) ( not ( = ?auto_312705 ?auto_312711 ) ) ( not ( = ?auto_312705 ?auto_312712 ) ) ( not ( = ?auto_312705 ?auto_312713 ) ) ( not ( = ?auto_312705 ?auto_312714 ) ) ( not ( = ?auto_312706 ?auto_312707 ) ) ( not ( = ?auto_312706 ?auto_312708 ) ) ( not ( = ?auto_312706 ?auto_312709 ) ) ( not ( = ?auto_312706 ?auto_312710 ) ) ( not ( = ?auto_312706 ?auto_312711 ) ) ( not ( = ?auto_312706 ?auto_312712 ) ) ( not ( = ?auto_312706 ?auto_312713 ) ) ( not ( = ?auto_312706 ?auto_312714 ) ) ( not ( = ?auto_312707 ?auto_312708 ) ) ( not ( = ?auto_312707 ?auto_312709 ) ) ( not ( = ?auto_312707 ?auto_312710 ) ) ( not ( = ?auto_312707 ?auto_312711 ) ) ( not ( = ?auto_312707 ?auto_312712 ) ) ( not ( = ?auto_312707 ?auto_312713 ) ) ( not ( = ?auto_312707 ?auto_312714 ) ) ( not ( = ?auto_312708 ?auto_312709 ) ) ( not ( = ?auto_312708 ?auto_312710 ) ) ( not ( = ?auto_312708 ?auto_312711 ) ) ( not ( = ?auto_312708 ?auto_312712 ) ) ( not ( = ?auto_312708 ?auto_312713 ) ) ( not ( = ?auto_312708 ?auto_312714 ) ) ( not ( = ?auto_312709 ?auto_312710 ) ) ( not ( = ?auto_312709 ?auto_312711 ) ) ( not ( = ?auto_312709 ?auto_312712 ) ) ( not ( = ?auto_312709 ?auto_312713 ) ) ( not ( = ?auto_312709 ?auto_312714 ) ) ( not ( = ?auto_312710 ?auto_312711 ) ) ( not ( = ?auto_312710 ?auto_312712 ) ) ( not ( = ?auto_312710 ?auto_312713 ) ) ( not ( = ?auto_312710 ?auto_312714 ) ) ( not ( = ?auto_312711 ?auto_312712 ) ) ( not ( = ?auto_312711 ?auto_312713 ) ) ( not ( = ?auto_312711 ?auto_312714 ) ) ( not ( = ?auto_312712 ?auto_312713 ) ) ( not ( = ?auto_312712 ?auto_312714 ) ) ( not ( = ?auto_312713 ?auto_312714 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_312714 )
      ( !STACK ?auto_312714 ?auto_312713 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312729 - BLOCK
      ?auto_312730 - BLOCK
      ?auto_312731 - BLOCK
      ?auto_312732 - BLOCK
      ?auto_312733 - BLOCK
      ?auto_312734 - BLOCK
      ?auto_312735 - BLOCK
      ?auto_312736 - BLOCK
      ?auto_312737 - BLOCK
      ?auto_312738 - BLOCK
      ?auto_312739 - BLOCK
      ?auto_312740 - BLOCK
      ?auto_312741 - BLOCK
      ?auto_312742 - BLOCK
    )
    :vars
    (
      ?auto_312743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312742 ?auto_312743 ) ( ON-TABLE ?auto_312729 ) ( ON ?auto_312730 ?auto_312729 ) ( ON ?auto_312731 ?auto_312730 ) ( ON ?auto_312732 ?auto_312731 ) ( ON ?auto_312733 ?auto_312732 ) ( ON ?auto_312734 ?auto_312733 ) ( ON ?auto_312735 ?auto_312734 ) ( ON ?auto_312736 ?auto_312735 ) ( ON ?auto_312737 ?auto_312736 ) ( ON ?auto_312738 ?auto_312737 ) ( ON ?auto_312739 ?auto_312738 ) ( ON ?auto_312740 ?auto_312739 ) ( not ( = ?auto_312729 ?auto_312730 ) ) ( not ( = ?auto_312729 ?auto_312731 ) ) ( not ( = ?auto_312729 ?auto_312732 ) ) ( not ( = ?auto_312729 ?auto_312733 ) ) ( not ( = ?auto_312729 ?auto_312734 ) ) ( not ( = ?auto_312729 ?auto_312735 ) ) ( not ( = ?auto_312729 ?auto_312736 ) ) ( not ( = ?auto_312729 ?auto_312737 ) ) ( not ( = ?auto_312729 ?auto_312738 ) ) ( not ( = ?auto_312729 ?auto_312739 ) ) ( not ( = ?auto_312729 ?auto_312740 ) ) ( not ( = ?auto_312729 ?auto_312741 ) ) ( not ( = ?auto_312729 ?auto_312742 ) ) ( not ( = ?auto_312729 ?auto_312743 ) ) ( not ( = ?auto_312730 ?auto_312731 ) ) ( not ( = ?auto_312730 ?auto_312732 ) ) ( not ( = ?auto_312730 ?auto_312733 ) ) ( not ( = ?auto_312730 ?auto_312734 ) ) ( not ( = ?auto_312730 ?auto_312735 ) ) ( not ( = ?auto_312730 ?auto_312736 ) ) ( not ( = ?auto_312730 ?auto_312737 ) ) ( not ( = ?auto_312730 ?auto_312738 ) ) ( not ( = ?auto_312730 ?auto_312739 ) ) ( not ( = ?auto_312730 ?auto_312740 ) ) ( not ( = ?auto_312730 ?auto_312741 ) ) ( not ( = ?auto_312730 ?auto_312742 ) ) ( not ( = ?auto_312730 ?auto_312743 ) ) ( not ( = ?auto_312731 ?auto_312732 ) ) ( not ( = ?auto_312731 ?auto_312733 ) ) ( not ( = ?auto_312731 ?auto_312734 ) ) ( not ( = ?auto_312731 ?auto_312735 ) ) ( not ( = ?auto_312731 ?auto_312736 ) ) ( not ( = ?auto_312731 ?auto_312737 ) ) ( not ( = ?auto_312731 ?auto_312738 ) ) ( not ( = ?auto_312731 ?auto_312739 ) ) ( not ( = ?auto_312731 ?auto_312740 ) ) ( not ( = ?auto_312731 ?auto_312741 ) ) ( not ( = ?auto_312731 ?auto_312742 ) ) ( not ( = ?auto_312731 ?auto_312743 ) ) ( not ( = ?auto_312732 ?auto_312733 ) ) ( not ( = ?auto_312732 ?auto_312734 ) ) ( not ( = ?auto_312732 ?auto_312735 ) ) ( not ( = ?auto_312732 ?auto_312736 ) ) ( not ( = ?auto_312732 ?auto_312737 ) ) ( not ( = ?auto_312732 ?auto_312738 ) ) ( not ( = ?auto_312732 ?auto_312739 ) ) ( not ( = ?auto_312732 ?auto_312740 ) ) ( not ( = ?auto_312732 ?auto_312741 ) ) ( not ( = ?auto_312732 ?auto_312742 ) ) ( not ( = ?auto_312732 ?auto_312743 ) ) ( not ( = ?auto_312733 ?auto_312734 ) ) ( not ( = ?auto_312733 ?auto_312735 ) ) ( not ( = ?auto_312733 ?auto_312736 ) ) ( not ( = ?auto_312733 ?auto_312737 ) ) ( not ( = ?auto_312733 ?auto_312738 ) ) ( not ( = ?auto_312733 ?auto_312739 ) ) ( not ( = ?auto_312733 ?auto_312740 ) ) ( not ( = ?auto_312733 ?auto_312741 ) ) ( not ( = ?auto_312733 ?auto_312742 ) ) ( not ( = ?auto_312733 ?auto_312743 ) ) ( not ( = ?auto_312734 ?auto_312735 ) ) ( not ( = ?auto_312734 ?auto_312736 ) ) ( not ( = ?auto_312734 ?auto_312737 ) ) ( not ( = ?auto_312734 ?auto_312738 ) ) ( not ( = ?auto_312734 ?auto_312739 ) ) ( not ( = ?auto_312734 ?auto_312740 ) ) ( not ( = ?auto_312734 ?auto_312741 ) ) ( not ( = ?auto_312734 ?auto_312742 ) ) ( not ( = ?auto_312734 ?auto_312743 ) ) ( not ( = ?auto_312735 ?auto_312736 ) ) ( not ( = ?auto_312735 ?auto_312737 ) ) ( not ( = ?auto_312735 ?auto_312738 ) ) ( not ( = ?auto_312735 ?auto_312739 ) ) ( not ( = ?auto_312735 ?auto_312740 ) ) ( not ( = ?auto_312735 ?auto_312741 ) ) ( not ( = ?auto_312735 ?auto_312742 ) ) ( not ( = ?auto_312735 ?auto_312743 ) ) ( not ( = ?auto_312736 ?auto_312737 ) ) ( not ( = ?auto_312736 ?auto_312738 ) ) ( not ( = ?auto_312736 ?auto_312739 ) ) ( not ( = ?auto_312736 ?auto_312740 ) ) ( not ( = ?auto_312736 ?auto_312741 ) ) ( not ( = ?auto_312736 ?auto_312742 ) ) ( not ( = ?auto_312736 ?auto_312743 ) ) ( not ( = ?auto_312737 ?auto_312738 ) ) ( not ( = ?auto_312737 ?auto_312739 ) ) ( not ( = ?auto_312737 ?auto_312740 ) ) ( not ( = ?auto_312737 ?auto_312741 ) ) ( not ( = ?auto_312737 ?auto_312742 ) ) ( not ( = ?auto_312737 ?auto_312743 ) ) ( not ( = ?auto_312738 ?auto_312739 ) ) ( not ( = ?auto_312738 ?auto_312740 ) ) ( not ( = ?auto_312738 ?auto_312741 ) ) ( not ( = ?auto_312738 ?auto_312742 ) ) ( not ( = ?auto_312738 ?auto_312743 ) ) ( not ( = ?auto_312739 ?auto_312740 ) ) ( not ( = ?auto_312739 ?auto_312741 ) ) ( not ( = ?auto_312739 ?auto_312742 ) ) ( not ( = ?auto_312739 ?auto_312743 ) ) ( not ( = ?auto_312740 ?auto_312741 ) ) ( not ( = ?auto_312740 ?auto_312742 ) ) ( not ( = ?auto_312740 ?auto_312743 ) ) ( not ( = ?auto_312741 ?auto_312742 ) ) ( not ( = ?auto_312741 ?auto_312743 ) ) ( not ( = ?auto_312742 ?auto_312743 ) ) ( CLEAR ?auto_312740 ) ( ON ?auto_312741 ?auto_312742 ) ( CLEAR ?auto_312741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_312729 ?auto_312730 ?auto_312731 ?auto_312732 ?auto_312733 ?auto_312734 ?auto_312735 ?auto_312736 ?auto_312737 ?auto_312738 ?auto_312739 ?auto_312740 ?auto_312741 )
      ( MAKE-14PILE ?auto_312729 ?auto_312730 ?auto_312731 ?auto_312732 ?auto_312733 ?auto_312734 ?auto_312735 ?auto_312736 ?auto_312737 ?auto_312738 ?auto_312739 ?auto_312740 ?auto_312741 ?auto_312742 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312758 - BLOCK
      ?auto_312759 - BLOCK
      ?auto_312760 - BLOCK
      ?auto_312761 - BLOCK
      ?auto_312762 - BLOCK
      ?auto_312763 - BLOCK
      ?auto_312764 - BLOCK
      ?auto_312765 - BLOCK
      ?auto_312766 - BLOCK
      ?auto_312767 - BLOCK
      ?auto_312768 - BLOCK
      ?auto_312769 - BLOCK
      ?auto_312770 - BLOCK
      ?auto_312771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_312771 ) ( ON-TABLE ?auto_312758 ) ( ON ?auto_312759 ?auto_312758 ) ( ON ?auto_312760 ?auto_312759 ) ( ON ?auto_312761 ?auto_312760 ) ( ON ?auto_312762 ?auto_312761 ) ( ON ?auto_312763 ?auto_312762 ) ( ON ?auto_312764 ?auto_312763 ) ( ON ?auto_312765 ?auto_312764 ) ( ON ?auto_312766 ?auto_312765 ) ( ON ?auto_312767 ?auto_312766 ) ( ON ?auto_312768 ?auto_312767 ) ( ON ?auto_312769 ?auto_312768 ) ( not ( = ?auto_312758 ?auto_312759 ) ) ( not ( = ?auto_312758 ?auto_312760 ) ) ( not ( = ?auto_312758 ?auto_312761 ) ) ( not ( = ?auto_312758 ?auto_312762 ) ) ( not ( = ?auto_312758 ?auto_312763 ) ) ( not ( = ?auto_312758 ?auto_312764 ) ) ( not ( = ?auto_312758 ?auto_312765 ) ) ( not ( = ?auto_312758 ?auto_312766 ) ) ( not ( = ?auto_312758 ?auto_312767 ) ) ( not ( = ?auto_312758 ?auto_312768 ) ) ( not ( = ?auto_312758 ?auto_312769 ) ) ( not ( = ?auto_312758 ?auto_312770 ) ) ( not ( = ?auto_312758 ?auto_312771 ) ) ( not ( = ?auto_312759 ?auto_312760 ) ) ( not ( = ?auto_312759 ?auto_312761 ) ) ( not ( = ?auto_312759 ?auto_312762 ) ) ( not ( = ?auto_312759 ?auto_312763 ) ) ( not ( = ?auto_312759 ?auto_312764 ) ) ( not ( = ?auto_312759 ?auto_312765 ) ) ( not ( = ?auto_312759 ?auto_312766 ) ) ( not ( = ?auto_312759 ?auto_312767 ) ) ( not ( = ?auto_312759 ?auto_312768 ) ) ( not ( = ?auto_312759 ?auto_312769 ) ) ( not ( = ?auto_312759 ?auto_312770 ) ) ( not ( = ?auto_312759 ?auto_312771 ) ) ( not ( = ?auto_312760 ?auto_312761 ) ) ( not ( = ?auto_312760 ?auto_312762 ) ) ( not ( = ?auto_312760 ?auto_312763 ) ) ( not ( = ?auto_312760 ?auto_312764 ) ) ( not ( = ?auto_312760 ?auto_312765 ) ) ( not ( = ?auto_312760 ?auto_312766 ) ) ( not ( = ?auto_312760 ?auto_312767 ) ) ( not ( = ?auto_312760 ?auto_312768 ) ) ( not ( = ?auto_312760 ?auto_312769 ) ) ( not ( = ?auto_312760 ?auto_312770 ) ) ( not ( = ?auto_312760 ?auto_312771 ) ) ( not ( = ?auto_312761 ?auto_312762 ) ) ( not ( = ?auto_312761 ?auto_312763 ) ) ( not ( = ?auto_312761 ?auto_312764 ) ) ( not ( = ?auto_312761 ?auto_312765 ) ) ( not ( = ?auto_312761 ?auto_312766 ) ) ( not ( = ?auto_312761 ?auto_312767 ) ) ( not ( = ?auto_312761 ?auto_312768 ) ) ( not ( = ?auto_312761 ?auto_312769 ) ) ( not ( = ?auto_312761 ?auto_312770 ) ) ( not ( = ?auto_312761 ?auto_312771 ) ) ( not ( = ?auto_312762 ?auto_312763 ) ) ( not ( = ?auto_312762 ?auto_312764 ) ) ( not ( = ?auto_312762 ?auto_312765 ) ) ( not ( = ?auto_312762 ?auto_312766 ) ) ( not ( = ?auto_312762 ?auto_312767 ) ) ( not ( = ?auto_312762 ?auto_312768 ) ) ( not ( = ?auto_312762 ?auto_312769 ) ) ( not ( = ?auto_312762 ?auto_312770 ) ) ( not ( = ?auto_312762 ?auto_312771 ) ) ( not ( = ?auto_312763 ?auto_312764 ) ) ( not ( = ?auto_312763 ?auto_312765 ) ) ( not ( = ?auto_312763 ?auto_312766 ) ) ( not ( = ?auto_312763 ?auto_312767 ) ) ( not ( = ?auto_312763 ?auto_312768 ) ) ( not ( = ?auto_312763 ?auto_312769 ) ) ( not ( = ?auto_312763 ?auto_312770 ) ) ( not ( = ?auto_312763 ?auto_312771 ) ) ( not ( = ?auto_312764 ?auto_312765 ) ) ( not ( = ?auto_312764 ?auto_312766 ) ) ( not ( = ?auto_312764 ?auto_312767 ) ) ( not ( = ?auto_312764 ?auto_312768 ) ) ( not ( = ?auto_312764 ?auto_312769 ) ) ( not ( = ?auto_312764 ?auto_312770 ) ) ( not ( = ?auto_312764 ?auto_312771 ) ) ( not ( = ?auto_312765 ?auto_312766 ) ) ( not ( = ?auto_312765 ?auto_312767 ) ) ( not ( = ?auto_312765 ?auto_312768 ) ) ( not ( = ?auto_312765 ?auto_312769 ) ) ( not ( = ?auto_312765 ?auto_312770 ) ) ( not ( = ?auto_312765 ?auto_312771 ) ) ( not ( = ?auto_312766 ?auto_312767 ) ) ( not ( = ?auto_312766 ?auto_312768 ) ) ( not ( = ?auto_312766 ?auto_312769 ) ) ( not ( = ?auto_312766 ?auto_312770 ) ) ( not ( = ?auto_312766 ?auto_312771 ) ) ( not ( = ?auto_312767 ?auto_312768 ) ) ( not ( = ?auto_312767 ?auto_312769 ) ) ( not ( = ?auto_312767 ?auto_312770 ) ) ( not ( = ?auto_312767 ?auto_312771 ) ) ( not ( = ?auto_312768 ?auto_312769 ) ) ( not ( = ?auto_312768 ?auto_312770 ) ) ( not ( = ?auto_312768 ?auto_312771 ) ) ( not ( = ?auto_312769 ?auto_312770 ) ) ( not ( = ?auto_312769 ?auto_312771 ) ) ( not ( = ?auto_312770 ?auto_312771 ) ) ( CLEAR ?auto_312769 ) ( ON ?auto_312770 ?auto_312771 ) ( CLEAR ?auto_312770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_312758 ?auto_312759 ?auto_312760 ?auto_312761 ?auto_312762 ?auto_312763 ?auto_312764 ?auto_312765 ?auto_312766 ?auto_312767 ?auto_312768 ?auto_312769 ?auto_312770 )
      ( MAKE-14PILE ?auto_312758 ?auto_312759 ?auto_312760 ?auto_312761 ?auto_312762 ?auto_312763 ?auto_312764 ?auto_312765 ?auto_312766 ?auto_312767 ?auto_312768 ?auto_312769 ?auto_312770 ?auto_312771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312786 - BLOCK
      ?auto_312787 - BLOCK
      ?auto_312788 - BLOCK
      ?auto_312789 - BLOCK
      ?auto_312790 - BLOCK
      ?auto_312791 - BLOCK
      ?auto_312792 - BLOCK
      ?auto_312793 - BLOCK
      ?auto_312794 - BLOCK
      ?auto_312795 - BLOCK
      ?auto_312796 - BLOCK
      ?auto_312797 - BLOCK
      ?auto_312798 - BLOCK
      ?auto_312799 - BLOCK
    )
    :vars
    (
      ?auto_312800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312799 ?auto_312800 ) ( ON-TABLE ?auto_312786 ) ( ON ?auto_312787 ?auto_312786 ) ( ON ?auto_312788 ?auto_312787 ) ( ON ?auto_312789 ?auto_312788 ) ( ON ?auto_312790 ?auto_312789 ) ( ON ?auto_312791 ?auto_312790 ) ( ON ?auto_312792 ?auto_312791 ) ( ON ?auto_312793 ?auto_312792 ) ( ON ?auto_312794 ?auto_312793 ) ( ON ?auto_312795 ?auto_312794 ) ( ON ?auto_312796 ?auto_312795 ) ( not ( = ?auto_312786 ?auto_312787 ) ) ( not ( = ?auto_312786 ?auto_312788 ) ) ( not ( = ?auto_312786 ?auto_312789 ) ) ( not ( = ?auto_312786 ?auto_312790 ) ) ( not ( = ?auto_312786 ?auto_312791 ) ) ( not ( = ?auto_312786 ?auto_312792 ) ) ( not ( = ?auto_312786 ?auto_312793 ) ) ( not ( = ?auto_312786 ?auto_312794 ) ) ( not ( = ?auto_312786 ?auto_312795 ) ) ( not ( = ?auto_312786 ?auto_312796 ) ) ( not ( = ?auto_312786 ?auto_312797 ) ) ( not ( = ?auto_312786 ?auto_312798 ) ) ( not ( = ?auto_312786 ?auto_312799 ) ) ( not ( = ?auto_312786 ?auto_312800 ) ) ( not ( = ?auto_312787 ?auto_312788 ) ) ( not ( = ?auto_312787 ?auto_312789 ) ) ( not ( = ?auto_312787 ?auto_312790 ) ) ( not ( = ?auto_312787 ?auto_312791 ) ) ( not ( = ?auto_312787 ?auto_312792 ) ) ( not ( = ?auto_312787 ?auto_312793 ) ) ( not ( = ?auto_312787 ?auto_312794 ) ) ( not ( = ?auto_312787 ?auto_312795 ) ) ( not ( = ?auto_312787 ?auto_312796 ) ) ( not ( = ?auto_312787 ?auto_312797 ) ) ( not ( = ?auto_312787 ?auto_312798 ) ) ( not ( = ?auto_312787 ?auto_312799 ) ) ( not ( = ?auto_312787 ?auto_312800 ) ) ( not ( = ?auto_312788 ?auto_312789 ) ) ( not ( = ?auto_312788 ?auto_312790 ) ) ( not ( = ?auto_312788 ?auto_312791 ) ) ( not ( = ?auto_312788 ?auto_312792 ) ) ( not ( = ?auto_312788 ?auto_312793 ) ) ( not ( = ?auto_312788 ?auto_312794 ) ) ( not ( = ?auto_312788 ?auto_312795 ) ) ( not ( = ?auto_312788 ?auto_312796 ) ) ( not ( = ?auto_312788 ?auto_312797 ) ) ( not ( = ?auto_312788 ?auto_312798 ) ) ( not ( = ?auto_312788 ?auto_312799 ) ) ( not ( = ?auto_312788 ?auto_312800 ) ) ( not ( = ?auto_312789 ?auto_312790 ) ) ( not ( = ?auto_312789 ?auto_312791 ) ) ( not ( = ?auto_312789 ?auto_312792 ) ) ( not ( = ?auto_312789 ?auto_312793 ) ) ( not ( = ?auto_312789 ?auto_312794 ) ) ( not ( = ?auto_312789 ?auto_312795 ) ) ( not ( = ?auto_312789 ?auto_312796 ) ) ( not ( = ?auto_312789 ?auto_312797 ) ) ( not ( = ?auto_312789 ?auto_312798 ) ) ( not ( = ?auto_312789 ?auto_312799 ) ) ( not ( = ?auto_312789 ?auto_312800 ) ) ( not ( = ?auto_312790 ?auto_312791 ) ) ( not ( = ?auto_312790 ?auto_312792 ) ) ( not ( = ?auto_312790 ?auto_312793 ) ) ( not ( = ?auto_312790 ?auto_312794 ) ) ( not ( = ?auto_312790 ?auto_312795 ) ) ( not ( = ?auto_312790 ?auto_312796 ) ) ( not ( = ?auto_312790 ?auto_312797 ) ) ( not ( = ?auto_312790 ?auto_312798 ) ) ( not ( = ?auto_312790 ?auto_312799 ) ) ( not ( = ?auto_312790 ?auto_312800 ) ) ( not ( = ?auto_312791 ?auto_312792 ) ) ( not ( = ?auto_312791 ?auto_312793 ) ) ( not ( = ?auto_312791 ?auto_312794 ) ) ( not ( = ?auto_312791 ?auto_312795 ) ) ( not ( = ?auto_312791 ?auto_312796 ) ) ( not ( = ?auto_312791 ?auto_312797 ) ) ( not ( = ?auto_312791 ?auto_312798 ) ) ( not ( = ?auto_312791 ?auto_312799 ) ) ( not ( = ?auto_312791 ?auto_312800 ) ) ( not ( = ?auto_312792 ?auto_312793 ) ) ( not ( = ?auto_312792 ?auto_312794 ) ) ( not ( = ?auto_312792 ?auto_312795 ) ) ( not ( = ?auto_312792 ?auto_312796 ) ) ( not ( = ?auto_312792 ?auto_312797 ) ) ( not ( = ?auto_312792 ?auto_312798 ) ) ( not ( = ?auto_312792 ?auto_312799 ) ) ( not ( = ?auto_312792 ?auto_312800 ) ) ( not ( = ?auto_312793 ?auto_312794 ) ) ( not ( = ?auto_312793 ?auto_312795 ) ) ( not ( = ?auto_312793 ?auto_312796 ) ) ( not ( = ?auto_312793 ?auto_312797 ) ) ( not ( = ?auto_312793 ?auto_312798 ) ) ( not ( = ?auto_312793 ?auto_312799 ) ) ( not ( = ?auto_312793 ?auto_312800 ) ) ( not ( = ?auto_312794 ?auto_312795 ) ) ( not ( = ?auto_312794 ?auto_312796 ) ) ( not ( = ?auto_312794 ?auto_312797 ) ) ( not ( = ?auto_312794 ?auto_312798 ) ) ( not ( = ?auto_312794 ?auto_312799 ) ) ( not ( = ?auto_312794 ?auto_312800 ) ) ( not ( = ?auto_312795 ?auto_312796 ) ) ( not ( = ?auto_312795 ?auto_312797 ) ) ( not ( = ?auto_312795 ?auto_312798 ) ) ( not ( = ?auto_312795 ?auto_312799 ) ) ( not ( = ?auto_312795 ?auto_312800 ) ) ( not ( = ?auto_312796 ?auto_312797 ) ) ( not ( = ?auto_312796 ?auto_312798 ) ) ( not ( = ?auto_312796 ?auto_312799 ) ) ( not ( = ?auto_312796 ?auto_312800 ) ) ( not ( = ?auto_312797 ?auto_312798 ) ) ( not ( = ?auto_312797 ?auto_312799 ) ) ( not ( = ?auto_312797 ?auto_312800 ) ) ( not ( = ?auto_312798 ?auto_312799 ) ) ( not ( = ?auto_312798 ?auto_312800 ) ) ( not ( = ?auto_312799 ?auto_312800 ) ) ( ON ?auto_312798 ?auto_312799 ) ( CLEAR ?auto_312796 ) ( ON ?auto_312797 ?auto_312798 ) ( CLEAR ?auto_312797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_312786 ?auto_312787 ?auto_312788 ?auto_312789 ?auto_312790 ?auto_312791 ?auto_312792 ?auto_312793 ?auto_312794 ?auto_312795 ?auto_312796 ?auto_312797 )
      ( MAKE-14PILE ?auto_312786 ?auto_312787 ?auto_312788 ?auto_312789 ?auto_312790 ?auto_312791 ?auto_312792 ?auto_312793 ?auto_312794 ?auto_312795 ?auto_312796 ?auto_312797 ?auto_312798 ?auto_312799 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312815 - BLOCK
      ?auto_312816 - BLOCK
      ?auto_312817 - BLOCK
      ?auto_312818 - BLOCK
      ?auto_312819 - BLOCK
      ?auto_312820 - BLOCK
      ?auto_312821 - BLOCK
      ?auto_312822 - BLOCK
      ?auto_312823 - BLOCK
      ?auto_312824 - BLOCK
      ?auto_312825 - BLOCK
      ?auto_312826 - BLOCK
      ?auto_312827 - BLOCK
      ?auto_312828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_312828 ) ( ON-TABLE ?auto_312815 ) ( ON ?auto_312816 ?auto_312815 ) ( ON ?auto_312817 ?auto_312816 ) ( ON ?auto_312818 ?auto_312817 ) ( ON ?auto_312819 ?auto_312818 ) ( ON ?auto_312820 ?auto_312819 ) ( ON ?auto_312821 ?auto_312820 ) ( ON ?auto_312822 ?auto_312821 ) ( ON ?auto_312823 ?auto_312822 ) ( ON ?auto_312824 ?auto_312823 ) ( ON ?auto_312825 ?auto_312824 ) ( not ( = ?auto_312815 ?auto_312816 ) ) ( not ( = ?auto_312815 ?auto_312817 ) ) ( not ( = ?auto_312815 ?auto_312818 ) ) ( not ( = ?auto_312815 ?auto_312819 ) ) ( not ( = ?auto_312815 ?auto_312820 ) ) ( not ( = ?auto_312815 ?auto_312821 ) ) ( not ( = ?auto_312815 ?auto_312822 ) ) ( not ( = ?auto_312815 ?auto_312823 ) ) ( not ( = ?auto_312815 ?auto_312824 ) ) ( not ( = ?auto_312815 ?auto_312825 ) ) ( not ( = ?auto_312815 ?auto_312826 ) ) ( not ( = ?auto_312815 ?auto_312827 ) ) ( not ( = ?auto_312815 ?auto_312828 ) ) ( not ( = ?auto_312816 ?auto_312817 ) ) ( not ( = ?auto_312816 ?auto_312818 ) ) ( not ( = ?auto_312816 ?auto_312819 ) ) ( not ( = ?auto_312816 ?auto_312820 ) ) ( not ( = ?auto_312816 ?auto_312821 ) ) ( not ( = ?auto_312816 ?auto_312822 ) ) ( not ( = ?auto_312816 ?auto_312823 ) ) ( not ( = ?auto_312816 ?auto_312824 ) ) ( not ( = ?auto_312816 ?auto_312825 ) ) ( not ( = ?auto_312816 ?auto_312826 ) ) ( not ( = ?auto_312816 ?auto_312827 ) ) ( not ( = ?auto_312816 ?auto_312828 ) ) ( not ( = ?auto_312817 ?auto_312818 ) ) ( not ( = ?auto_312817 ?auto_312819 ) ) ( not ( = ?auto_312817 ?auto_312820 ) ) ( not ( = ?auto_312817 ?auto_312821 ) ) ( not ( = ?auto_312817 ?auto_312822 ) ) ( not ( = ?auto_312817 ?auto_312823 ) ) ( not ( = ?auto_312817 ?auto_312824 ) ) ( not ( = ?auto_312817 ?auto_312825 ) ) ( not ( = ?auto_312817 ?auto_312826 ) ) ( not ( = ?auto_312817 ?auto_312827 ) ) ( not ( = ?auto_312817 ?auto_312828 ) ) ( not ( = ?auto_312818 ?auto_312819 ) ) ( not ( = ?auto_312818 ?auto_312820 ) ) ( not ( = ?auto_312818 ?auto_312821 ) ) ( not ( = ?auto_312818 ?auto_312822 ) ) ( not ( = ?auto_312818 ?auto_312823 ) ) ( not ( = ?auto_312818 ?auto_312824 ) ) ( not ( = ?auto_312818 ?auto_312825 ) ) ( not ( = ?auto_312818 ?auto_312826 ) ) ( not ( = ?auto_312818 ?auto_312827 ) ) ( not ( = ?auto_312818 ?auto_312828 ) ) ( not ( = ?auto_312819 ?auto_312820 ) ) ( not ( = ?auto_312819 ?auto_312821 ) ) ( not ( = ?auto_312819 ?auto_312822 ) ) ( not ( = ?auto_312819 ?auto_312823 ) ) ( not ( = ?auto_312819 ?auto_312824 ) ) ( not ( = ?auto_312819 ?auto_312825 ) ) ( not ( = ?auto_312819 ?auto_312826 ) ) ( not ( = ?auto_312819 ?auto_312827 ) ) ( not ( = ?auto_312819 ?auto_312828 ) ) ( not ( = ?auto_312820 ?auto_312821 ) ) ( not ( = ?auto_312820 ?auto_312822 ) ) ( not ( = ?auto_312820 ?auto_312823 ) ) ( not ( = ?auto_312820 ?auto_312824 ) ) ( not ( = ?auto_312820 ?auto_312825 ) ) ( not ( = ?auto_312820 ?auto_312826 ) ) ( not ( = ?auto_312820 ?auto_312827 ) ) ( not ( = ?auto_312820 ?auto_312828 ) ) ( not ( = ?auto_312821 ?auto_312822 ) ) ( not ( = ?auto_312821 ?auto_312823 ) ) ( not ( = ?auto_312821 ?auto_312824 ) ) ( not ( = ?auto_312821 ?auto_312825 ) ) ( not ( = ?auto_312821 ?auto_312826 ) ) ( not ( = ?auto_312821 ?auto_312827 ) ) ( not ( = ?auto_312821 ?auto_312828 ) ) ( not ( = ?auto_312822 ?auto_312823 ) ) ( not ( = ?auto_312822 ?auto_312824 ) ) ( not ( = ?auto_312822 ?auto_312825 ) ) ( not ( = ?auto_312822 ?auto_312826 ) ) ( not ( = ?auto_312822 ?auto_312827 ) ) ( not ( = ?auto_312822 ?auto_312828 ) ) ( not ( = ?auto_312823 ?auto_312824 ) ) ( not ( = ?auto_312823 ?auto_312825 ) ) ( not ( = ?auto_312823 ?auto_312826 ) ) ( not ( = ?auto_312823 ?auto_312827 ) ) ( not ( = ?auto_312823 ?auto_312828 ) ) ( not ( = ?auto_312824 ?auto_312825 ) ) ( not ( = ?auto_312824 ?auto_312826 ) ) ( not ( = ?auto_312824 ?auto_312827 ) ) ( not ( = ?auto_312824 ?auto_312828 ) ) ( not ( = ?auto_312825 ?auto_312826 ) ) ( not ( = ?auto_312825 ?auto_312827 ) ) ( not ( = ?auto_312825 ?auto_312828 ) ) ( not ( = ?auto_312826 ?auto_312827 ) ) ( not ( = ?auto_312826 ?auto_312828 ) ) ( not ( = ?auto_312827 ?auto_312828 ) ) ( ON ?auto_312827 ?auto_312828 ) ( CLEAR ?auto_312825 ) ( ON ?auto_312826 ?auto_312827 ) ( CLEAR ?auto_312826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_312815 ?auto_312816 ?auto_312817 ?auto_312818 ?auto_312819 ?auto_312820 ?auto_312821 ?auto_312822 ?auto_312823 ?auto_312824 ?auto_312825 ?auto_312826 )
      ( MAKE-14PILE ?auto_312815 ?auto_312816 ?auto_312817 ?auto_312818 ?auto_312819 ?auto_312820 ?auto_312821 ?auto_312822 ?auto_312823 ?auto_312824 ?auto_312825 ?auto_312826 ?auto_312827 ?auto_312828 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312843 - BLOCK
      ?auto_312844 - BLOCK
      ?auto_312845 - BLOCK
      ?auto_312846 - BLOCK
      ?auto_312847 - BLOCK
      ?auto_312848 - BLOCK
      ?auto_312849 - BLOCK
      ?auto_312850 - BLOCK
      ?auto_312851 - BLOCK
      ?auto_312852 - BLOCK
      ?auto_312853 - BLOCK
      ?auto_312854 - BLOCK
      ?auto_312855 - BLOCK
      ?auto_312856 - BLOCK
    )
    :vars
    (
      ?auto_312857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312856 ?auto_312857 ) ( ON-TABLE ?auto_312843 ) ( ON ?auto_312844 ?auto_312843 ) ( ON ?auto_312845 ?auto_312844 ) ( ON ?auto_312846 ?auto_312845 ) ( ON ?auto_312847 ?auto_312846 ) ( ON ?auto_312848 ?auto_312847 ) ( ON ?auto_312849 ?auto_312848 ) ( ON ?auto_312850 ?auto_312849 ) ( ON ?auto_312851 ?auto_312850 ) ( ON ?auto_312852 ?auto_312851 ) ( not ( = ?auto_312843 ?auto_312844 ) ) ( not ( = ?auto_312843 ?auto_312845 ) ) ( not ( = ?auto_312843 ?auto_312846 ) ) ( not ( = ?auto_312843 ?auto_312847 ) ) ( not ( = ?auto_312843 ?auto_312848 ) ) ( not ( = ?auto_312843 ?auto_312849 ) ) ( not ( = ?auto_312843 ?auto_312850 ) ) ( not ( = ?auto_312843 ?auto_312851 ) ) ( not ( = ?auto_312843 ?auto_312852 ) ) ( not ( = ?auto_312843 ?auto_312853 ) ) ( not ( = ?auto_312843 ?auto_312854 ) ) ( not ( = ?auto_312843 ?auto_312855 ) ) ( not ( = ?auto_312843 ?auto_312856 ) ) ( not ( = ?auto_312843 ?auto_312857 ) ) ( not ( = ?auto_312844 ?auto_312845 ) ) ( not ( = ?auto_312844 ?auto_312846 ) ) ( not ( = ?auto_312844 ?auto_312847 ) ) ( not ( = ?auto_312844 ?auto_312848 ) ) ( not ( = ?auto_312844 ?auto_312849 ) ) ( not ( = ?auto_312844 ?auto_312850 ) ) ( not ( = ?auto_312844 ?auto_312851 ) ) ( not ( = ?auto_312844 ?auto_312852 ) ) ( not ( = ?auto_312844 ?auto_312853 ) ) ( not ( = ?auto_312844 ?auto_312854 ) ) ( not ( = ?auto_312844 ?auto_312855 ) ) ( not ( = ?auto_312844 ?auto_312856 ) ) ( not ( = ?auto_312844 ?auto_312857 ) ) ( not ( = ?auto_312845 ?auto_312846 ) ) ( not ( = ?auto_312845 ?auto_312847 ) ) ( not ( = ?auto_312845 ?auto_312848 ) ) ( not ( = ?auto_312845 ?auto_312849 ) ) ( not ( = ?auto_312845 ?auto_312850 ) ) ( not ( = ?auto_312845 ?auto_312851 ) ) ( not ( = ?auto_312845 ?auto_312852 ) ) ( not ( = ?auto_312845 ?auto_312853 ) ) ( not ( = ?auto_312845 ?auto_312854 ) ) ( not ( = ?auto_312845 ?auto_312855 ) ) ( not ( = ?auto_312845 ?auto_312856 ) ) ( not ( = ?auto_312845 ?auto_312857 ) ) ( not ( = ?auto_312846 ?auto_312847 ) ) ( not ( = ?auto_312846 ?auto_312848 ) ) ( not ( = ?auto_312846 ?auto_312849 ) ) ( not ( = ?auto_312846 ?auto_312850 ) ) ( not ( = ?auto_312846 ?auto_312851 ) ) ( not ( = ?auto_312846 ?auto_312852 ) ) ( not ( = ?auto_312846 ?auto_312853 ) ) ( not ( = ?auto_312846 ?auto_312854 ) ) ( not ( = ?auto_312846 ?auto_312855 ) ) ( not ( = ?auto_312846 ?auto_312856 ) ) ( not ( = ?auto_312846 ?auto_312857 ) ) ( not ( = ?auto_312847 ?auto_312848 ) ) ( not ( = ?auto_312847 ?auto_312849 ) ) ( not ( = ?auto_312847 ?auto_312850 ) ) ( not ( = ?auto_312847 ?auto_312851 ) ) ( not ( = ?auto_312847 ?auto_312852 ) ) ( not ( = ?auto_312847 ?auto_312853 ) ) ( not ( = ?auto_312847 ?auto_312854 ) ) ( not ( = ?auto_312847 ?auto_312855 ) ) ( not ( = ?auto_312847 ?auto_312856 ) ) ( not ( = ?auto_312847 ?auto_312857 ) ) ( not ( = ?auto_312848 ?auto_312849 ) ) ( not ( = ?auto_312848 ?auto_312850 ) ) ( not ( = ?auto_312848 ?auto_312851 ) ) ( not ( = ?auto_312848 ?auto_312852 ) ) ( not ( = ?auto_312848 ?auto_312853 ) ) ( not ( = ?auto_312848 ?auto_312854 ) ) ( not ( = ?auto_312848 ?auto_312855 ) ) ( not ( = ?auto_312848 ?auto_312856 ) ) ( not ( = ?auto_312848 ?auto_312857 ) ) ( not ( = ?auto_312849 ?auto_312850 ) ) ( not ( = ?auto_312849 ?auto_312851 ) ) ( not ( = ?auto_312849 ?auto_312852 ) ) ( not ( = ?auto_312849 ?auto_312853 ) ) ( not ( = ?auto_312849 ?auto_312854 ) ) ( not ( = ?auto_312849 ?auto_312855 ) ) ( not ( = ?auto_312849 ?auto_312856 ) ) ( not ( = ?auto_312849 ?auto_312857 ) ) ( not ( = ?auto_312850 ?auto_312851 ) ) ( not ( = ?auto_312850 ?auto_312852 ) ) ( not ( = ?auto_312850 ?auto_312853 ) ) ( not ( = ?auto_312850 ?auto_312854 ) ) ( not ( = ?auto_312850 ?auto_312855 ) ) ( not ( = ?auto_312850 ?auto_312856 ) ) ( not ( = ?auto_312850 ?auto_312857 ) ) ( not ( = ?auto_312851 ?auto_312852 ) ) ( not ( = ?auto_312851 ?auto_312853 ) ) ( not ( = ?auto_312851 ?auto_312854 ) ) ( not ( = ?auto_312851 ?auto_312855 ) ) ( not ( = ?auto_312851 ?auto_312856 ) ) ( not ( = ?auto_312851 ?auto_312857 ) ) ( not ( = ?auto_312852 ?auto_312853 ) ) ( not ( = ?auto_312852 ?auto_312854 ) ) ( not ( = ?auto_312852 ?auto_312855 ) ) ( not ( = ?auto_312852 ?auto_312856 ) ) ( not ( = ?auto_312852 ?auto_312857 ) ) ( not ( = ?auto_312853 ?auto_312854 ) ) ( not ( = ?auto_312853 ?auto_312855 ) ) ( not ( = ?auto_312853 ?auto_312856 ) ) ( not ( = ?auto_312853 ?auto_312857 ) ) ( not ( = ?auto_312854 ?auto_312855 ) ) ( not ( = ?auto_312854 ?auto_312856 ) ) ( not ( = ?auto_312854 ?auto_312857 ) ) ( not ( = ?auto_312855 ?auto_312856 ) ) ( not ( = ?auto_312855 ?auto_312857 ) ) ( not ( = ?auto_312856 ?auto_312857 ) ) ( ON ?auto_312855 ?auto_312856 ) ( ON ?auto_312854 ?auto_312855 ) ( CLEAR ?auto_312852 ) ( ON ?auto_312853 ?auto_312854 ) ( CLEAR ?auto_312853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_312843 ?auto_312844 ?auto_312845 ?auto_312846 ?auto_312847 ?auto_312848 ?auto_312849 ?auto_312850 ?auto_312851 ?auto_312852 ?auto_312853 )
      ( MAKE-14PILE ?auto_312843 ?auto_312844 ?auto_312845 ?auto_312846 ?auto_312847 ?auto_312848 ?auto_312849 ?auto_312850 ?auto_312851 ?auto_312852 ?auto_312853 ?auto_312854 ?auto_312855 ?auto_312856 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312872 - BLOCK
      ?auto_312873 - BLOCK
      ?auto_312874 - BLOCK
      ?auto_312875 - BLOCK
      ?auto_312876 - BLOCK
      ?auto_312877 - BLOCK
      ?auto_312878 - BLOCK
      ?auto_312879 - BLOCK
      ?auto_312880 - BLOCK
      ?auto_312881 - BLOCK
      ?auto_312882 - BLOCK
      ?auto_312883 - BLOCK
      ?auto_312884 - BLOCK
      ?auto_312885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_312885 ) ( ON-TABLE ?auto_312872 ) ( ON ?auto_312873 ?auto_312872 ) ( ON ?auto_312874 ?auto_312873 ) ( ON ?auto_312875 ?auto_312874 ) ( ON ?auto_312876 ?auto_312875 ) ( ON ?auto_312877 ?auto_312876 ) ( ON ?auto_312878 ?auto_312877 ) ( ON ?auto_312879 ?auto_312878 ) ( ON ?auto_312880 ?auto_312879 ) ( ON ?auto_312881 ?auto_312880 ) ( not ( = ?auto_312872 ?auto_312873 ) ) ( not ( = ?auto_312872 ?auto_312874 ) ) ( not ( = ?auto_312872 ?auto_312875 ) ) ( not ( = ?auto_312872 ?auto_312876 ) ) ( not ( = ?auto_312872 ?auto_312877 ) ) ( not ( = ?auto_312872 ?auto_312878 ) ) ( not ( = ?auto_312872 ?auto_312879 ) ) ( not ( = ?auto_312872 ?auto_312880 ) ) ( not ( = ?auto_312872 ?auto_312881 ) ) ( not ( = ?auto_312872 ?auto_312882 ) ) ( not ( = ?auto_312872 ?auto_312883 ) ) ( not ( = ?auto_312872 ?auto_312884 ) ) ( not ( = ?auto_312872 ?auto_312885 ) ) ( not ( = ?auto_312873 ?auto_312874 ) ) ( not ( = ?auto_312873 ?auto_312875 ) ) ( not ( = ?auto_312873 ?auto_312876 ) ) ( not ( = ?auto_312873 ?auto_312877 ) ) ( not ( = ?auto_312873 ?auto_312878 ) ) ( not ( = ?auto_312873 ?auto_312879 ) ) ( not ( = ?auto_312873 ?auto_312880 ) ) ( not ( = ?auto_312873 ?auto_312881 ) ) ( not ( = ?auto_312873 ?auto_312882 ) ) ( not ( = ?auto_312873 ?auto_312883 ) ) ( not ( = ?auto_312873 ?auto_312884 ) ) ( not ( = ?auto_312873 ?auto_312885 ) ) ( not ( = ?auto_312874 ?auto_312875 ) ) ( not ( = ?auto_312874 ?auto_312876 ) ) ( not ( = ?auto_312874 ?auto_312877 ) ) ( not ( = ?auto_312874 ?auto_312878 ) ) ( not ( = ?auto_312874 ?auto_312879 ) ) ( not ( = ?auto_312874 ?auto_312880 ) ) ( not ( = ?auto_312874 ?auto_312881 ) ) ( not ( = ?auto_312874 ?auto_312882 ) ) ( not ( = ?auto_312874 ?auto_312883 ) ) ( not ( = ?auto_312874 ?auto_312884 ) ) ( not ( = ?auto_312874 ?auto_312885 ) ) ( not ( = ?auto_312875 ?auto_312876 ) ) ( not ( = ?auto_312875 ?auto_312877 ) ) ( not ( = ?auto_312875 ?auto_312878 ) ) ( not ( = ?auto_312875 ?auto_312879 ) ) ( not ( = ?auto_312875 ?auto_312880 ) ) ( not ( = ?auto_312875 ?auto_312881 ) ) ( not ( = ?auto_312875 ?auto_312882 ) ) ( not ( = ?auto_312875 ?auto_312883 ) ) ( not ( = ?auto_312875 ?auto_312884 ) ) ( not ( = ?auto_312875 ?auto_312885 ) ) ( not ( = ?auto_312876 ?auto_312877 ) ) ( not ( = ?auto_312876 ?auto_312878 ) ) ( not ( = ?auto_312876 ?auto_312879 ) ) ( not ( = ?auto_312876 ?auto_312880 ) ) ( not ( = ?auto_312876 ?auto_312881 ) ) ( not ( = ?auto_312876 ?auto_312882 ) ) ( not ( = ?auto_312876 ?auto_312883 ) ) ( not ( = ?auto_312876 ?auto_312884 ) ) ( not ( = ?auto_312876 ?auto_312885 ) ) ( not ( = ?auto_312877 ?auto_312878 ) ) ( not ( = ?auto_312877 ?auto_312879 ) ) ( not ( = ?auto_312877 ?auto_312880 ) ) ( not ( = ?auto_312877 ?auto_312881 ) ) ( not ( = ?auto_312877 ?auto_312882 ) ) ( not ( = ?auto_312877 ?auto_312883 ) ) ( not ( = ?auto_312877 ?auto_312884 ) ) ( not ( = ?auto_312877 ?auto_312885 ) ) ( not ( = ?auto_312878 ?auto_312879 ) ) ( not ( = ?auto_312878 ?auto_312880 ) ) ( not ( = ?auto_312878 ?auto_312881 ) ) ( not ( = ?auto_312878 ?auto_312882 ) ) ( not ( = ?auto_312878 ?auto_312883 ) ) ( not ( = ?auto_312878 ?auto_312884 ) ) ( not ( = ?auto_312878 ?auto_312885 ) ) ( not ( = ?auto_312879 ?auto_312880 ) ) ( not ( = ?auto_312879 ?auto_312881 ) ) ( not ( = ?auto_312879 ?auto_312882 ) ) ( not ( = ?auto_312879 ?auto_312883 ) ) ( not ( = ?auto_312879 ?auto_312884 ) ) ( not ( = ?auto_312879 ?auto_312885 ) ) ( not ( = ?auto_312880 ?auto_312881 ) ) ( not ( = ?auto_312880 ?auto_312882 ) ) ( not ( = ?auto_312880 ?auto_312883 ) ) ( not ( = ?auto_312880 ?auto_312884 ) ) ( not ( = ?auto_312880 ?auto_312885 ) ) ( not ( = ?auto_312881 ?auto_312882 ) ) ( not ( = ?auto_312881 ?auto_312883 ) ) ( not ( = ?auto_312881 ?auto_312884 ) ) ( not ( = ?auto_312881 ?auto_312885 ) ) ( not ( = ?auto_312882 ?auto_312883 ) ) ( not ( = ?auto_312882 ?auto_312884 ) ) ( not ( = ?auto_312882 ?auto_312885 ) ) ( not ( = ?auto_312883 ?auto_312884 ) ) ( not ( = ?auto_312883 ?auto_312885 ) ) ( not ( = ?auto_312884 ?auto_312885 ) ) ( ON ?auto_312884 ?auto_312885 ) ( ON ?auto_312883 ?auto_312884 ) ( CLEAR ?auto_312881 ) ( ON ?auto_312882 ?auto_312883 ) ( CLEAR ?auto_312882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_312872 ?auto_312873 ?auto_312874 ?auto_312875 ?auto_312876 ?auto_312877 ?auto_312878 ?auto_312879 ?auto_312880 ?auto_312881 ?auto_312882 )
      ( MAKE-14PILE ?auto_312872 ?auto_312873 ?auto_312874 ?auto_312875 ?auto_312876 ?auto_312877 ?auto_312878 ?auto_312879 ?auto_312880 ?auto_312881 ?auto_312882 ?auto_312883 ?auto_312884 ?auto_312885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312900 - BLOCK
      ?auto_312901 - BLOCK
      ?auto_312902 - BLOCK
      ?auto_312903 - BLOCK
      ?auto_312904 - BLOCK
      ?auto_312905 - BLOCK
      ?auto_312906 - BLOCK
      ?auto_312907 - BLOCK
      ?auto_312908 - BLOCK
      ?auto_312909 - BLOCK
      ?auto_312910 - BLOCK
      ?auto_312911 - BLOCK
      ?auto_312912 - BLOCK
      ?auto_312913 - BLOCK
    )
    :vars
    (
      ?auto_312914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312913 ?auto_312914 ) ( ON-TABLE ?auto_312900 ) ( ON ?auto_312901 ?auto_312900 ) ( ON ?auto_312902 ?auto_312901 ) ( ON ?auto_312903 ?auto_312902 ) ( ON ?auto_312904 ?auto_312903 ) ( ON ?auto_312905 ?auto_312904 ) ( ON ?auto_312906 ?auto_312905 ) ( ON ?auto_312907 ?auto_312906 ) ( ON ?auto_312908 ?auto_312907 ) ( not ( = ?auto_312900 ?auto_312901 ) ) ( not ( = ?auto_312900 ?auto_312902 ) ) ( not ( = ?auto_312900 ?auto_312903 ) ) ( not ( = ?auto_312900 ?auto_312904 ) ) ( not ( = ?auto_312900 ?auto_312905 ) ) ( not ( = ?auto_312900 ?auto_312906 ) ) ( not ( = ?auto_312900 ?auto_312907 ) ) ( not ( = ?auto_312900 ?auto_312908 ) ) ( not ( = ?auto_312900 ?auto_312909 ) ) ( not ( = ?auto_312900 ?auto_312910 ) ) ( not ( = ?auto_312900 ?auto_312911 ) ) ( not ( = ?auto_312900 ?auto_312912 ) ) ( not ( = ?auto_312900 ?auto_312913 ) ) ( not ( = ?auto_312900 ?auto_312914 ) ) ( not ( = ?auto_312901 ?auto_312902 ) ) ( not ( = ?auto_312901 ?auto_312903 ) ) ( not ( = ?auto_312901 ?auto_312904 ) ) ( not ( = ?auto_312901 ?auto_312905 ) ) ( not ( = ?auto_312901 ?auto_312906 ) ) ( not ( = ?auto_312901 ?auto_312907 ) ) ( not ( = ?auto_312901 ?auto_312908 ) ) ( not ( = ?auto_312901 ?auto_312909 ) ) ( not ( = ?auto_312901 ?auto_312910 ) ) ( not ( = ?auto_312901 ?auto_312911 ) ) ( not ( = ?auto_312901 ?auto_312912 ) ) ( not ( = ?auto_312901 ?auto_312913 ) ) ( not ( = ?auto_312901 ?auto_312914 ) ) ( not ( = ?auto_312902 ?auto_312903 ) ) ( not ( = ?auto_312902 ?auto_312904 ) ) ( not ( = ?auto_312902 ?auto_312905 ) ) ( not ( = ?auto_312902 ?auto_312906 ) ) ( not ( = ?auto_312902 ?auto_312907 ) ) ( not ( = ?auto_312902 ?auto_312908 ) ) ( not ( = ?auto_312902 ?auto_312909 ) ) ( not ( = ?auto_312902 ?auto_312910 ) ) ( not ( = ?auto_312902 ?auto_312911 ) ) ( not ( = ?auto_312902 ?auto_312912 ) ) ( not ( = ?auto_312902 ?auto_312913 ) ) ( not ( = ?auto_312902 ?auto_312914 ) ) ( not ( = ?auto_312903 ?auto_312904 ) ) ( not ( = ?auto_312903 ?auto_312905 ) ) ( not ( = ?auto_312903 ?auto_312906 ) ) ( not ( = ?auto_312903 ?auto_312907 ) ) ( not ( = ?auto_312903 ?auto_312908 ) ) ( not ( = ?auto_312903 ?auto_312909 ) ) ( not ( = ?auto_312903 ?auto_312910 ) ) ( not ( = ?auto_312903 ?auto_312911 ) ) ( not ( = ?auto_312903 ?auto_312912 ) ) ( not ( = ?auto_312903 ?auto_312913 ) ) ( not ( = ?auto_312903 ?auto_312914 ) ) ( not ( = ?auto_312904 ?auto_312905 ) ) ( not ( = ?auto_312904 ?auto_312906 ) ) ( not ( = ?auto_312904 ?auto_312907 ) ) ( not ( = ?auto_312904 ?auto_312908 ) ) ( not ( = ?auto_312904 ?auto_312909 ) ) ( not ( = ?auto_312904 ?auto_312910 ) ) ( not ( = ?auto_312904 ?auto_312911 ) ) ( not ( = ?auto_312904 ?auto_312912 ) ) ( not ( = ?auto_312904 ?auto_312913 ) ) ( not ( = ?auto_312904 ?auto_312914 ) ) ( not ( = ?auto_312905 ?auto_312906 ) ) ( not ( = ?auto_312905 ?auto_312907 ) ) ( not ( = ?auto_312905 ?auto_312908 ) ) ( not ( = ?auto_312905 ?auto_312909 ) ) ( not ( = ?auto_312905 ?auto_312910 ) ) ( not ( = ?auto_312905 ?auto_312911 ) ) ( not ( = ?auto_312905 ?auto_312912 ) ) ( not ( = ?auto_312905 ?auto_312913 ) ) ( not ( = ?auto_312905 ?auto_312914 ) ) ( not ( = ?auto_312906 ?auto_312907 ) ) ( not ( = ?auto_312906 ?auto_312908 ) ) ( not ( = ?auto_312906 ?auto_312909 ) ) ( not ( = ?auto_312906 ?auto_312910 ) ) ( not ( = ?auto_312906 ?auto_312911 ) ) ( not ( = ?auto_312906 ?auto_312912 ) ) ( not ( = ?auto_312906 ?auto_312913 ) ) ( not ( = ?auto_312906 ?auto_312914 ) ) ( not ( = ?auto_312907 ?auto_312908 ) ) ( not ( = ?auto_312907 ?auto_312909 ) ) ( not ( = ?auto_312907 ?auto_312910 ) ) ( not ( = ?auto_312907 ?auto_312911 ) ) ( not ( = ?auto_312907 ?auto_312912 ) ) ( not ( = ?auto_312907 ?auto_312913 ) ) ( not ( = ?auto_312907 ?auto_312914 ) ) ( not ( = ?auto_312908 ?auto_312909 ) ) ( not ( = ?auto_312908 ?auto_312910 ) ) ( not ( = ?auto_312908 ?auto_312911 ) ) ( not ( = ?auto_312908 ?auto_312912 ) ) ( not ( = ?auto_312908 ?auto_312913 ) ) ( not ( = ?auto_312908 ?auto_312914 ) ) ( not ( = ?auto_312909 ?auto_312910 ) ) ( not ( = ?auto_312909 ?auto_312911 ) ) ( not ( = ?auto_312909 ?auto_312912 ) ) ( not ( = ?auto_312909 ?auto_312913 ) ) ( not ( = ?auto_312909 ?auto_312914 ) ) ( not ( = ?auto_312910 ?auto_312911 ) ) ( not ( = ?auto_312910 ?auto_312912 ) ) ( not ( = ?auto_312910 ?auto_312913 ) ) ( not ( = ?auto_312910 ?auto_312914 ) ) ( not ( = ?auto_312911 ?auto_312912 ) ) ( not ( = ?auto_312911 ?auto_312913 ) ) ( not ( = ?auto_312911 ?auto_312914 ) ) ( not ( = ?auto_312912 ?auto_312913 ) ) ( not ( = ?auto_312912 ?auto_312914 ) ) ( not ( = ?auto_312913 ?auto_312914 ) ) ( ON ?auto_312912 ?auto_312913 ) ( ON ?auto_312911 ?auto_312912 ) ( ON ?auto_312910 ?auto_312911 ) ( CLEAR ?auto_312908 ) ( ON ?auto_312909 ?auto_312910 ) ( CLEAR ?auto_312909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_312900 ?auto_312901 ?auto_312902 ?auto_312903 ?auto_312904 ?auto_312905 ?auto_312906 ?auto_312907 ?auto_312908 ?auto_312909 )
      ( MAKE-14PILE ?auto_312900 ?auto_312901 ?auto_312902 ?auto_312903 ?auto_312904 ?auto_312905 ?auto_312906 ?auto_312907 ?auto_312908 ?auto_312909 ?auto_312910 ?auto_312911 ?auto_312912 ?auto_312913 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312929 - BLOCK
      ?auto_312930 - BLOCK
      ?auto_312931 - BLOCK
      ?auto_312932 - BLOCK
      ?auto_312933 - BLOCK
      ?auto_312934 - BLOCK
      ?auto_312935 - BLOCK
      ?auto_312936 - BLOCK
      ?auto_312937 - BLOCK
      ?auto_312938 - BLOCK
      ?auto_312939 - BLOCK
      ?auto_312940 - BLOCK
      ?auto_312941 - BLOCK
      ?auto_312942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_312942 ) ( ON-TABLE ?auto_312929 ) ( ON ?auto_312930 ?auto_312929 ) ( ON ?auto_312931 ?auto_312930 ) ( ON ?auto_312932 ?auto_312931 ) ( ON ?auto_312933 ?auto_312932 ) ( ON ?auto_312934 ?auto_312933 ) ( ON ?auto_312935 ?auto_312934 ) ( ON ?auto_312936 ?auto_312935 ) ( ON ?auto_312937 ?auto_312936 ) ( not ( = ?auto_312929 ?auto_312930 ) ) ( not ( = ?auto_312929 ?auto_312931 ) ) ( not ( = ?auto_312929 ?auto_312932 ) ) ( not ( = ?auto_312929 ?auto_312933 ) ) ( not ( = ?auto_312929 ?auto_312934 ) ) ( not ( = ?auto_312929 ?auto_312935 ) ) ( not ( = ?auto_312929 ?auto_312936 ) ) ( not ( = ?auto_312929 ?auto_312937 ) ) ( not ( = ?auto_312929 ?auto_312938 ) ) ( not ( = ?auto_312929 ?auto_312939 ) ) ( not ( = ?auto_312929 ?auto_312940 ) ) ( not ( = ?auto_312929 ?auto_312941 ) ) ( not ( = ?auto_312929 ?auto_312942 ) ) ( not ( = ?auto_312930 ?auto_312931 ) ) ( not ( = ?auto_312930 ?auto_312932 ) ) ( not ( = ?auto_312930 ?auto_312933 ) ) ( not ( = ?auto_312930 ?auto_312934 ) ) ( not ( = ?auto_312930 ?auto_312935 ) ) ( not ( = ?auto_312930 ?auto_312936 ) ) ( not ( = ?auto_312930 ?auto_312937 ) ) ( not ( = ?auto_312930 ?auto_312938 ) ) ( not ( = ?auto_312930 ?auto_312939 ) ) ( not ( = ?auto_312930 ?auto_312940 ) ) ( not ( = ?auto_312930 ?auto_312941 ) ) ( not ( = ?auto_312930 ?auto_312942 ) ) ( not ( = ?auto_312931 ?auto_312932 ) ) ( not ( = ?auto_312931 ?auto_312933 ) ) ( not ( = ?auto_312931 ?auto_312934 ) ) ( not ( = ?auto_312931 ?auto_312935 ) ) ( not ( = ?auto_312931 ?auto_312936 ) ) ( not ( = ?auto_312931 ?auto_312937 ) ) ( not ( = ?auto_312931 ?auto_312938 ) ) ( not ( = ?auto_312931 ?auto_312939 ) ) ( not ( = ?auto_312931 ?auto_312940 ) ) ( not ( = ?auto_312931 ?auto_312941 ) ) ( not ( = ?auto_312931 ?auto_312942 ) ) ( not ( = ?auto_312932 ?auto_312933 ) ) ( not ( = ?auto_312932 ?auto_312934 ) ) ( not ( = ?auto_312932 ?auto_312935 ) ) ( not ( = ?auto_312932 ?auto_312936 ) ) ( not ( = ?auto_312932 ?auto_312937 ) ) ( not ( = ?auto_312932 ?auto_312938 ) ) ( not ( = ?auto_312932 ?auto_312939 ) ) ( not ( = ?auto_312932 ?auto_312940 ) ) ( not ( = ?auto_312932 ?auto_312941 ) ) ( not ( = ?auto_312932 ?auto_312942 ) ) ( not ( = ?auto_312933 ?auto_312934 ) ) ( not ( = ?auto_312933 ?auto_312935 ) ) ( not ( = ?auto_312933 ?auto_312936 ) ) ( not ( = ?auto_312933 ?auto_312937 ) ) ( not ( = ?auto_312933 ?auto_312938 ) ) ( not ( = ?auto_312933 ?auto_312939 ) ) ( not ( = ?auto_312933 ?auto_312940 ) ) ( not ( = ?auto_312933 ?auto_312941 ) ) ( not ( = ?auto_312933 ?auto_312942 ) ) ( not ( = ?auto_312934 ?auto_312935 ) ) ( not ( = ?auto_312934 ?auto_312936 ) ) ( not ( = ?auto_312934 ?auto_312937 ) ) ( not ( = ?auto_312934 ?auto_312938 ) ) ( not ( = ?auto_312934 ?auto_312939 ) ) ( not ( = ?auto_312934 ?auto_312940 ) ) ( not ( = ?auto_312934 ?auto_312941 ) ) ( not ( = ?auto_312934 ?auto_312942 ) ) ( not ( = ?auto_312935 ?auto_312936 ) ) ( not ( = ?auto_312935 ?auto_312937 ) ) ( not ( = ?auto_312935 ?auto_312938 ) ) ( not ( = ?auto_312935 ?auto_312939 ) ) ( not ( = ?auto_312935 ?auto_312940 ) ) ( not ( = ?auto_312935 ?auto_312941 ) ) ( not ( = ?auto_312935 ?auto_312942 ) ) ( not ( = ?auto_312936 ?auto_312937 ) ) ( not ( = ?auto_312936 ?auto_312938 ) ) ( not ( = ?auto_312936 ?auto_312939 ) ) ( not ( = ?auto_312936 ?auto_312940 ) ) ( not ( = ?auto_312936 ?auto_312941 ) ) ( not ( = ?auto_312936 ?auto_312942 ) ) ( not ( = ?auto_312937 ?auto_312938 ) ) ( not ( = ?auto_312937 ?auto_312939 ) ) ( not ( = ?auto_312937 ?auto_312940 ) ) ( not ( = ?auto_312937 ?auto_312941 ) ) ( not ( = ?auto_312937 ?auto_312942 ) ) ( not ( = ?auto_312938 ?auto_312939 ) ) ( not ( = ?auto_312938 ?auto_312940 ) ) ( not ( = ?auto_312938 ?auto_312941 ) ) ( not ( = ?auto_312938 ?auto_312942 ) ) ( not ( = ?auto_312939 ?auto_312940 ) ) ( not ( = ?auto_312939 ?auto_312941 ) ) ( not ( = ?auto_312939 ?auto_312942 ) ) ( not ( = ?auto_312940 ?auto_312941 ) ) ( not ( = ?auto_312940 ?auto_312942 ) ) ( not ( = ?auto_312941 ?auto_312942 ) ) ( ON ?auto_312941 ?auto_312942 ) ( ON ?auto_312940 ?auto_312941 ) ( ON ?auto_312939 ?auto_312940 ) ( CLEAR ?auto_312937 ) ( ON ?auto_312938 ?auto_312939 ) ( CLEAR ?auto_312938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_312929 ?auto_312930 ?auto_312931 ?auto_312932 ?auto_312933 ?auto_312934 ?auto_312935 ?auto_312936 ?auto_312937 ?auto_312938 )
      ( MAKE-14PILE ?auto_312929 ?auto_312930 ?auto_312931 ?auto_312932 ?auto_312933 ?auto_312934 ?auto_312935 ?auto_312936 ?auto_312937 ?auto_312938 ?auto_312939 ?auto_312940 ?auto_312941 ?auto_312942 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312957 - BLOCK
      ?auto_312958 - BLOCK
      ?auto_312959 - BLOCK
      ?auto_312960 - BLOCK
      ?auto_312961 - BLOCK
      ?auto_312962 - BLOCK
      ?auto_312963 - BLOCK
      ?auto_312964 - BLOCK
      ?auto_312965 - BLOCK
      ?auto_312966 - BLOCK
      ?auto_312967 - BLOCK
      ?auto_312968 - BLOCK
      ?auto_312969 - BLOCK
      ?auto_312970 - BLOCK
    )
    :vars
    (
      ?auto_312971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_312970 ?auto_312971 ) ( ON-TABLE ?auto_312957 ) ( ON ?auto_312958 ?auto_312957 ) ( ON ?auto_312959 ?auto_312958 ) ( ON ?auto_312960 ?auto_312959 ) ( ON ?auto_312961 ?auto_312960 ) ( ON ?auto_312962 ?auto_312961 ) ( ON ?auto_312963 ?auto_312962 ) ( ON ?auto_312964 ?auto_312963 ) ( not ( = ?auto_312957 ?auto_312958 ) ) ( not ( = ?auto_312957 ?auto_312959 ) ) ( not ( = ?auto_312957 ?auto_312960 ) ) ( not ( = ?auto_312957 ?auto_312961 ) ) ( not ( = ?auto_312957 ?auto_312962 ) ) ( not ( = ?auto_312957 ?auto_312963 ) ) ( not ( = ?auto_312957 ?auto_312964 ) ) ( not ( = ?auto_312957 ?auto_312965 ) ) ( not ( = ?auto_312957 ?auto_312966 ) ) ( not ( = ?auto_312957 ?auto_312967 ) ) ( not ( = ?auto_312957 ?auto_312968 ) ) ( not ( = ?auto_312957 ?auto_312969 ) ) ( not ( = ?auto_312957 ?auto_312970 ) ) ( not ( = ?auto_312957 ?auto_312971 ) ) ( not ( = ?auto_312958 ?auto_312959 ) ) ( not ( = ?auto_312958 ?auto_312960 ) ) ( not ( = ?auto_312958 ?auto_312961 ) ) ( not ( = ?auto_312958 ?auto_312962 ) ) ( not ( = ?auto_312958 ?auto_312963 ) ) ( not ( = ?auto_312958 ?auto_312964 ) ) ( not ( = ?auto_312958 ?auto_312965 ) ) ( not ( = ?auto_312958 ?auto_312966 ) ) ( not ( = ?auto_312958 ?auto_312967 ) ) ( not ( = ?auto_312958 ?auto_312968 ) ) ( not ( = ?auto_312958 ?auto_312969 ) ) ( not ( = ?auto_312958 ?auto_312970 ) ) ( not ( = ?auto_312958 ?auto_312971 ) ) ( not ( = ?auto_312959 ?auto_312960 ) ) ( not ( = ?auto_312959 ?auto_312961 ) ) ( not ( = ?auto_312959 ?auto_312962 ) ) ( not ( = ?auto_312959 ?auto_312963 ) ) ( not ( = ?auto_312959 ?auto_312964 ) ) ( not ( = ?auto_312959 ?auto_312965 ) ) ( not ( = ?auto_312959 ?auto_312966 ) ) ( not ( = ?auto_312959 ?auto_312967 ) ) ( not ( = ?auto_312959 ?auto_312968 ) ) ( not ( = ?auto_312959 ?auto_312969 ) ) ( not ( = ?auto_312959 ?auto_312970 ) ) ( not ( = ?auto_312959 ?auto_312971 ) ) ( not ( = ?auto_312960 ?auto_312961 ) ) ( not ( = ?auto_312960 ?auto_312962 ) ) ( not ( = ?auto_312960 ?auto_312963 ) ) ( not ( = ?auto_312960 ?auto_312964 ) ) ( not ( = ?auto_312960 ?auto_312965 ) ) ( not ( = ?auto_312960 ?auto_312966 ) ) ( not ( = ?auto_312960 ?auto_312967 ) ) ( not ( = ?auto_312960 ?auto_312968 ) ) ( not ( = ?auto_312960 ?auto_312969 ) ) ( not ( = ?auto_312960 ?auto_312970 ) ) ( not ( = ?auto_312960 ?auto_312971 ) ) ( not ( = ?auto_312961 ?auto_312962 ) ) ( not ( = ?auto_312961 ?auto_312963 ) ) ( not ( = ?auto_312961 ?auto_312964 ) ) ( not ( = ?auto_312961 ?auto_312965 ) ) ( not ( = ?auto_312961 ?auto_312966 ) ) ( not ( = ?auto_312961 ?auto_312967 ) ) ( not ( = ?auto_312961 ?auto_312968 ) ) ( not ( = ?auto_312961 ?auto_312969 ) ) ( not ( = ?auto_312961 ?auto_312970 ) ) ( not ( = ?auto_312961 ?auto_312971 ) ) ( not ( = ?auto_312962 ?auto_312963 ) ) ( not ( = ?auto_312962 ?auto_312964 ) ) ( not ( = ?auto_312962 ?auto_312965 ) ) ( not ( = ?auto_312962 ?auto_312966 ) ) ( not ( = ?auto_312962 ?auto_312967 ) ) ( not ( = ?auto_312962 ?auto_312968 ) ) ( not ( = ?auto_312962 ?auto_312969 ) ) ( not ( = ?auto_312962 ?auto_312970 ) ) ( not ( = ?auto_312962 ?auto_312971 ) ) ( not ( = ?auto_312963 ?auto_312964 ) ) ( not ( = ?auto_312963 ?auto_312965 ) ) ( not ( = ?auto_312963 ?auto_312966 ) ) ( not ( = ?auto_312963 ?auto_312967 ) ) ( not ( = ?auto_312963 ?auto_312968 ) ) ( not ( = ?auto_312963 ?auto_312969 ) ) ( not ( = ?auto_312963 ?auto_312970 ) ) ( not ( = ?auto_312963 ?auto_312971 ) ) ( not ( = ?auto_312964 ?auto_312965 ) ) ( not ( = ?auto_312964 ?auto_312966 ) ) ( not ( = ?auto_312964 ?auto_312967 ) ) ( not ( = ?auto_312964 ?auto_312968 ) ) ( not ( = ?auto_312964 ?auto_312969 ) ) ( not ( = ?auto_312964 ?auto_312970 ) ) ( not ( = ?auto_312964 ?auto_312971 ) ) ( not ( = ?auto_312965 ?auto_312966 ) ) ( not ( = ?auto_312965 ?auto_312967 ) ) ( not ( = ?auto_312965 ?auto_312968 ) ) ( not ( = ?auto_312965 ?auto_312969 ) ) ( not ( = ?auto_312965 ?auto_312970 ) ) ( not ( = ?auto_312965 ?auto_312971 ) ) ( not ( = ?auto_312966 ?auto_312967 ) ) ( not ( = ?auto_312966 ?auto_312968 ) ) ( not ( = ?auto_312966 ?auto_312969 ) ) ( not ( = ?auto_312966 ?auto_312970 ) ) ( not ( = ?auto_312966 ?auto_312971 ) ) ( not ( = ?auto_312967 ?auto_312968 ) ) ( not ( = ?auto_312967 ?auto_312969 ) ) ( not ( = ?auto_312967 ?auto_312970 ) ) ( not ( = ?auto_312967 ?auto_312971 ) ) ( not ( = ?auto_312968 ?auto_312969 ) ) ( not ( = ?auto_312968 ?auto_312970 ) ) ( not ( = ?auto_312968 ?auto_312971 ) ) ( not ( = ?auto_312969 ?auto_312970 ) ) ( not ( = ?auto_312969 ?auto_312971 ) ) ( not ( = ?auto_312970 ?auto_312971 ) ) ( ON ?auto_312969 ?auto_312970 ) ( ON ?auto_312968 ?auto_312969 ) ( ON ?auto_312967 ?auto_312968 ) ( ON ?auto_312966 ?auto_312967 ) ( CLEAR ?auto_312964 ) ( ON ?auto_312965 ?auto_312966 ) ( CLEAR ?auto_312965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_312957 ?auto_312958 ?auto_312959 ?auto_312960 ?auto_312961 ?auto_312962 ?auto_312963 ?auto_312964 ?auto_312965 )
      ( MAKE-14PILE ?auto_312957 ?auto_312958 ?auto_312959 ?auto_312960 ?auto_312961 ?auto_312962 ?auto_312963 ?auto_312964 ?auto_312965 ?auto_312966 ?auto_312967 ?auto_312968 ?auto_312969 ?auto_312970 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_312986 - BLOCK
      ?auto_312987 - BLOCK
      ?auto_312988 - BLOCK
      ?auto_312989 - BLOCK
      ?auto_312990 - BLOCK
      ?auto_312991 - BLOCK
      ?auto_312992 - BLOCK
      ?auto_312993 - BLOCK
      ?auto_312994 - BLOCK
      ?auto_312995 - BLOCK
      ?auto_312996 - BLOCK
      ?auto_312997 - BLOCK
      ?auto_312998 - BLOCK
      ?auto_312999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_312999 ) ( ON-TABLE ?auto_312986 ) ( ON ?auto_312987 ?auto_312986 ) ( ON ?auto_312988 ?auto_312987 ) ( ON ?auto_312989 ?auto_312988 ) ( ON ?auto_312990 ?auto_312989 ) ( ON ?auto_312991 ?auto_312990 ) ( ON ?auto_312992 ?auto_312991 ) ( ON ?auto_312993 ?auto_312992 ) ( not ( = ?auto_312986 ?auto_312987 ) ) ( not ( = ?auto_312986 ?auto_312988 ) ) ( not ( = ?auto_312986 ?auto_312989 ) ) ( not ( = ?auto_312986 ?auto_312990 ) ) ( not ( = ?auto_312986 ?auto_312991 ) ) ( not ( = ?auto_312986 ?auto_312992 ) ) ( not ( = ?auto_312986 ?auto_312993 ) ) ( not ( = ?auto_312986 ?auto_312994 ) ) ( not ( = ?auto_312986 ?auto_312995 ) ) ( not ( = ?auto_312986 ?auto_312996 ) ) ( not ( = ?auto_312986 ?auto_312997 ) ) ( not ( = ?auto_312986 ?auto_312998 ) ) ( not ( = ?auto_312986 ?auto_312999 ) ) ( not ( = ?auto_312987 ?auto_312988 ) ) ( not ( = ?auto_312987 ?auto_312989 ) ) ( not ( = ?auto_312987 ?auto_312990 ) ) ( not ( = ?auto_312987 ?auto_312991 ) ) ( not ( = ?auto_312987 ?auto_312992 ) ) ( not ( = ?auto_312987 ?auto_312993 ) ) ( not ( = ?auto_312987 ?auto_312994 ) ) ( not ( = ?auto_312987 ?auto_312995 ) ) ( not ( = ?auto_312987 ?auto_312996 ) ) ( not ( = ?auto_312987 ?auto_312997 ) ) ( not ( = ?auto_312987 ?auto_312998 ) ) ( not ( = ?auto_312987 ?auto_312999 ) ) ( not ( = ?auto_312988 ?auto_312989 ) ) ( not ( = ?auto_312988 ?auto_312990 ) ) ( not ( = ?auto_312988 ?auto_312991 ) ) ( not ( = ?auto_312988 ?auto_312992 ) ) ( not ( = ?auto_312988 ?auto_312993 ) ) ( not ( = ?auto_312988 ?auto_312994 ) ) ( not ( = ?auto_312988 ?auto_312995 ) ) ( not ( = ?auto_312988 ?auto_312996 ) ) ( not ( = ?auto_312988 ?auto_312997 ) ) ( not ( = ?auto_312988 ?auto_312998 ) ) ( not ( = ?auto_312988 ?auto_312999 ) ) ( not ( = ?auto_312989 ?auto_312990 ) ) ( not ( = ?auto_312989 ?auto_312991 ) ) ( not ( = ?auto_312989 ?auto_312992 ) ) ( not ( = ?auto_312989 ?auto_312993 ) ) ( not ( = ?auto_312989 ?auto_312994 ) ) ( not ( = ?auto_312989 ?auto_312995 ) ) ( not ( = ?auto_312989 ?auto_312996 ) ) ( not ( = ?auto_312989 ?auto_312997 ) ) ( not ( = ?auto_312989 ?auto_312998 ) ) ( not ( = ?auto_312989 ?auto_312999 ) ) ( not ( = ?auto_312990 ?auto_312991 ) ) ( not ( = ?auto_312990 ?auto_312992 ) ) ( not ( = ?auto_312990 ?auto_312993 ) ) ( not ( = ?auto_312990 ?auto_312994 ) ) ( not ( = ?auto_312990 ?auto_312995 ) ) ( not ( = ?auto_312990 ?auto_312996 ) ) ( not ( = ?auto_312990 ?auto_312997 ) ) ( not ( = ?auto_312990 ?auto_312998 ) ) ( not ( = ?auto_312990 ?auto_312999 ) ) ( not ( = ?auto_312991 ?auto_312992 ) ) ( not ( = ?auto_312991 ?auto_312993 ) ) ( not ( = ?auto_312991 ?auto_312994 ) ) ( not ( = ?auto_312991 ?auto_312995 ) ) ( not ( = ?auto_312991 ?auto_312996 ) ) ( not ( = ?auto_312991 ?auto_312997 ) ) ( not ( = ?auto_312991 ?auto_312998 ) ) ( not ( = ?auto_312991 ?auto_312999 ) ) ( not ( = ?auto_312992 ?auto_312993 ) ) ( not ( = ?auto_312992 ?auto_312994 ) ) ( not ( = ?auto_312992 ?auto_312995 ) ) ( not ( = ?auto_312992 ?auto_312996 ) ) ( not ( = ?auto_312992 ?auto_312997 ) ) ( not ( = ?auto_312992 ?auto_312998 ) ) ( not ( = ?auto_312992 ?auto_312999 ) ) ( not ( = ?auto_312993 ?auto_312994 ) ) ( not ( = ?auto_312993 ?auto_312995 ) ) ( not ( = ?auto_312993 ?auto_312996 ) ) ( not ( = ?auto_312993 ?auto_312997 ) ) ( not ( = ?auto_312993 ?auto_312998 ) ) ( not ( = ?auto_312993 ?auto_312999 ) ) ( not ( = ?auto_312994 ?auto_312995 ) ) ( not ( = ?auto_312994 ?auto_312996 ) ) ( not ( = ?auto_312994 ?auto_312997 ) ) ( not ( = ?auto_312994 ?auto_312998 ) ) ( not ( = ?auto_312994 ?auto_312999 ) ) ( not ( = ?auto_312995 ?auto_312996 ) ) ( not ( = ?auto_312995 ?auto_312997 ) ) ( not ( = ?auto_312995 ?auto_312998 ) ) ( not ( = ?auto_312995 ?auto_312999 ) ) ( not ( = ?auto_312996 ?auto_312997 ) ) ( not ( = ?auto_312996 ?auto_312998 ) ) ( not ( = ?auto_312996 ?auto_312999 ) ) ( not ( = ?auto_312997 ?auto_312998 ) ) ( not ( = ?auto_312997 ?auto_312999 ) ) ( not ( = ?auto_312998 ?auto_312999 ) ) ( ON ?auto_312998 ?auto_312999 ) ( ON ?auto_312997 ?auto_312998 ) ( ON ?auto_312996 ?auto_312997 ) ( ON ?auto_312995 ?auto_312996 ) ( CLEAR ?auto_312993 ) ( ON ?auto_312994 ?auto_312995 ) ( CLEAR ?auto_312994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_312986 ?auto_312987 ?auto_312988 ?auto_312989 ?auto_312990 ?auto_312991 ?auto_312992 ?auto_312993 ?auto_312994 )
      ( MAKE-14PILE ?auto_312986 ?auto_312987 ?auto_312988 ?auto_312989 ?auto_312990 ?auto_312991 ?auto_312992 ?auto_312993 ?auto_312994 ?auto_312995 ?auto_312996 ?auto_312997 ?auto_312998 ?auto_312999 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313014 - BLOCK
      ?auto_313015 - BLOCK
      ?auto_313016 - BLOCK
      ?auto_313017 - BLOCK
      ?auto_313018 - BLOCK
      ?auto_313019 - BLOCK
      ?auto_313020 - BLOCK
      ?auto_313021 - BLOCK
      ?auto_313022 - BLOCK
      ?auto_313023 - BLOCK
      ?auto_313024 - BLOCK
      ?auto_313025 - BLOCK
      ?auto_313026 - BLOCK
      ?auto_313027 - BLOCK
    )
    :vars
    (
      ?auto_313028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313027 ?auto_313028 ) ( ON-TABLE ?auto_313014 ) ( ON ?auto_313015 ?auto_313014 ) ( ON ?auto_313016 ?auto_313015 ) ( ON ?auto_313017 ?auto_313016 ) ( ON ?auto_313018 ?auto_313017 ) ( ON ?auto_313019 ?auto_313018 ) ( ON ?auto_313020 ?auto_313019 ) ( not ( = ?auto_313014 ?auto_313015 ) ) ( not ( = ?auto_313014 ?auto_313016 ) ) ( not ( = ?auto_313014 ?auto_313017 ) ) ( not ( = ?auto_313014 ?auto_313018 ) ) ( not ( = ?auto_313014 ?auto_313019 ) ) ( not ( = ?auto_313014 ?auto_313020 ) ) ( not ( = ?auto_313014 ?auto_313021 ) ) ( not ( = ?auto_313014 ?auto_313022 ) ) ( not ( = ?auto_313014 ?auto_313023 ) ) ( not ( = ?auto_313014 ?auto_313024 ) ) ( not ( = ?auto_313014 ?auto_313025 ) ) ( not ( = ?auto_313014 ?auto_313026 ) ) ( not ( = ?auto_313014 ?auto_313027 ) ) ( not ( = ?auto_313014 ?auto_313028 ) ) ( not ( = ?auto_313015 ?auto_313016 ) ) ( not ( = ?auto_313015 ?auto_313017 ) ) ( not ( = ?auto_313015 ?auto_313018 ) ) ( not ( = ?auto_313015 ?auto_313019 ) ) ( not ( = ?auto_313015 ?auto_313020 ) ) ( not ( = ?auto_313015 ?auto_313021 ) ) ( not ( = ?auto_313015 ?auto_313022 ) ) ( not ( = ?auto_313015 ?auto_313023 ) ) ( not ( = ?auto_313015 ?auto_313024 ) ) ( not ( = ?auto_313015 ?auto_313025 ) ) ( not ( = ?auto_313015 ?auto_313026 ) ) ( not ( = ?auto_313015 ?auto_313027 ) ) ( not ( = ?auto_313015 ?auto_313028 ) ) ( not ( = ?auto_313016 ?auto_313017 ) ) ( not ( = ?auto_313016 ?auto_313018 ) ) ( not ( = ?auto_313016 ?auto_313019 ) ) ( not ( = ?auto_313016 ?auto_313020 ) ) ( not ( = ?auto_313016 ?auto_313021 ) ) ( not ( = ?auto_313016 ?auto_313022 ) ) ( not ( = ?auto_313016 ?auto_313023 ) ) ( not ( = ?auto_313016 ?auto_313024 ) ) ( not ( = ?auto_313016 ?auto_313025 ) ) ( not ( = ?auto_313016 ?auto_313026 ) ) ( not ( = ?auto_313016 ?auto_313027 ) ) ( not ( = ?auto_313016 ?auto_313028 ) ) ( not ( = ?auto_313017 ?auto_313018 ) ) ( not ( = ?auto_313017 ?auto_313019 ) ) ( not ( = ?auto_313017 ?auto_313020 ) ) ( not ( = ?auto_313017 ?auto_313021 ) ) ( not ( = ?auto_313017 ?auto_313022 ) ) ( not ( = ?auto_313017 ?auto_313023 ) ) ( not ( = ?auto_313017 ?auto_313024 ) ) ( not ( = ?auto_313017 ?auto_313025 ) ) ( not ( = ?auto_313017 ?auto_313026 ) ) ( not ( = ?auto_313017 ?auto_313027 ) ) ( not ( = ?auto_313017 ?auto_313028 ) ) ( not ( = ?auto_313018 ?auto_313019 ) ) ( not ( = ?auto_313018 ?auto_313020 ) ) ( not ( = ?auto_313018 ?auto_313021 ) ) ( not ( = ?auto_313018 ?auto_313022 ) ) ( not ( = ?auto_313018 ?auto_313023 ) ) ( not ( = ?auto_313018 ?auto_313024 ) ) ( not ( = ?auto_313018 ?auto_313025 ) ) ( not ( = ?auto_313018 ?auto_313026 ) ) ( not ( = ?auto_313018 ?auto_313027 ) ) ( not ( = ?auto_313018 ?auto_313028 ) ) ( not ( = ?auto_313019 ?auto_313020 ) ) ( not ( = ?auto_313019 ?auto_313021 ) ) ( not ( = ?auto_313019 ?auto_313022 ) ) ( not ( = ?auto_313019 ?auto_313023 ) ) ( not ( = ?auto_313019 ?auto_313024 ) ) ( not ( = ?auto_313019 ?auto_313025 ) ) ( not ( = ?auto_313019 ?auto_313026 ) ) ( not ( = ?auto_313019 ?auto_313027 ) ) ( not ( = ?auto_313019 ?auto_313028 ) ) ( not ( = ?auto_313020 ?auto_313021 ) ) ( not ( = ?auto_313020 ?auto_313022 ) ) ( not ( = ?auto_313020 ?auto_313023 ) ) ( not ( = ?auto_313020 ?auto_313024 ) ) ( not ( = ?auto_313020 ?auto_313025 ) ) ( not ( = ?auto_313020 ?auto_313026 ) ) ( not ( = ?auto_313020 ?auto_313027 ) ) ( not ( = ?auto_313020 ?auto_313028 ) ) ( not ( = ?auto_313021 ?auto_313022 ) ) ( not ( = ?auto_313021 ?auto_313023 ) ) ( not ( = ?auto_313021 ?auto_313024 ) ) ( not ( = ?auto_313021 ?auto_313025 ) ) ( not ( = ?auto_313021 ?auto_313026 ) ) ( not ( = ?auto_313021 ?auto_313027 ) ) ( not ( = ?auto_313021 ?auto_313028 ) ) ( not ( = ?auto_313022 ?auto_313023 ) ) ( not ( = ?auto_313022 ?auto_313024 ) ) ( not ( = ?auto_313022 ?auto_313025 ) ) ( not ( = ?auto_313022 ?auto_313026 ) ) ( not ( = ?auto_313022 ?auto_313027 ) ) ( not ( = ?auto_313022 ?auto_313028 ) ) ( not ( = ?auto_313023 ?auto_313024 ) ) ( not ( = ?auto_313023 ?auto_313025 ) ) ( not ( = ?auto_313023 ?auto_313026 ) ) ( not ( = ?auto_313023 ?auto_313027 ) ) ( not ( = ?auto_313023 ?auto_313028 ) ) ( not ( = ?auto_313024 ?auto_313025 ) ) ( not ( = ?auto_313024 ?auto_313026 ) ) ( not ( = ?auto_313024 ?auto_313027 ) ) ( not ( = ?auto_313024 ?auto_313028 ) ) ( not ( = ?auto_313025 ?auto_313026 ) ) ( not ( = ?auto_313025 ?auto_313027 ) ) ( not ( = ?auto_313025 ?auto_313028 ) ) ( not ( = ?auto_313026 ?auto_313027 ) ) ( not ( = ?auto_313026 ?auto_313028 ) ) ( not ( = ?auto_313027 ?auto_313028 ) ) ( ON ?auto_313026 ?auto_313027 ) ( ON ?auto_313025 ?auto_313026 ) ( ON ?auto_313024 ?auto_313025 ) ( ON ?auto_313023 ?auto_313024 ) ( ON ?auto_313022 ?auto_313023 ) ( CLEAR ?auto_313020 ) ( ON ?auto_313021 ?auto_313022 ) ( CLEAR ?auto_313021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_313014 ?auto_313015 ?auto_313016 ?auto_313017 ?auto_313018 ?auto_313019 ?auto_313020 ?auto_313021 )
      ( MAKE-14PILE ?auto_313014 ?auto_313015 ?auto_313016 ?auto_313017 ?auto_313018 ?auto_313019 ?auto_313020 ?auto_313021 ?auto_313022 ?auto_313023 ?auto_313024 ?auto_313025 ?auto_313026 ?auto_313027 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313043 - BLOCK
      ?auto_313044 - BLOCK
      ?auto_313045 - BLOCK
      ?auto_313046 - BLOCK
      ?auto_313047 - BLOCK
      ?auto_313048 - BLOCK
      ?auto_313049 - BLOCK
      ?auto_313050 - BLOCK
      ?auto_313051 - BLOCK
      ?auto_313052 - BLOCK
      ?auto_313053 - BLOCK
      ?auto_313054 - BLOCK
      ?auto_313055 - BLOCK
      ?auto_313056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313056 ) ( ON-TABLE ?auto_313043 ) ( ON ?auto_313044 ?auto_313043 ) ( ON ?auto_313045 ?auto_313044 ) ( ON ?auto_313046 ?auto_313045 ) ( ON ?auto_313047 ?auto_313046 ) ( ON ?auto_313048 ?auto_313047 ) ( ON ?auto_313049 ?auto_313048 ) ( not ( = ?auto_313043 ?auto_313044 ) ) ( not ( = ?auto_313043 ?auto_313045 ) ) ( not ( = ?auto_313043 ?auto_313046 ) ) ( not ( = ?auto_313043 ?auto_313047 ) ) ( not ( = ?auto_313043 ?auto_313048 ) ) ( not ( = ?auto_313043 ?auto_313049 ) ) ( not ( = ?auto_313043 ?auto_313050 ) ) ( not ( = ?auto_313043 ?auto_313051 ) ) ( not ( = ?auto_313043 ?auto_313052 ) ) ( not ( = ?auto_313043 ?auto_313053 ) ) ( not ( = ?auto_313043 ?auto_313054 ) ) ( not ( = ?auto_313043 ?auto_313055 ) ) ( not ( = ?auto_313043 ?auto_313056 ) ) ( not ( = ?auto_313044 ?auto_313045 ) ) ( not ( = ?auto_313044 ?auto_313046 ) ) ( not ( = ?auto_313044 ?auto_313047 ) ) ( not ( = ?auto_313044 ?auto_313048 ) ) ( not ( = ?auto_313044 ?auto_313049 ) ) ( not ( = ?auto_313044 ?auto_313050 ) ) ( not ( = ?auto_313044 ?auto_313051 ) ) ( not ( = ?auto_313044 ?auto_313052 ) ) ( not ( = ?auto_313044 ?auto_313053 ) ) ( not ( = ?auto_313044 ?auto_313054 ) ) ( not ( = ?auto_313044 ?auto_313055 ) ) ( not ( = ?auto_313044 ?auto_313056 ) ) ( not ( = ?auto_313045 ?auto_313046 ) ) ( not ( = ?auto_313045 ?auto_313047 ) ) ( not ( = ?auto_313045 ?auto_313048 ) ) ( not ( = ?auto_313045 ?auto_313049 ) ) ( not ( = ?auto_313045 ?auto_313050 ) ) ( not ( = ?auto_313045 ?auto_313051 ) ) ( not ( = ?auto_313045 ?auto_313052 ) ) ( not ( = ?auto_313045 ?auto_313053 ) ) ( not ( = ?auto_313045 ?auto_313054 ) ) ( not ( = ?auto_313045 ?auto_313055 ) ) ( not ( = ?auto_313045 ?auto_313056 ) ) ( not ( = ?auto_313046 ?auto_313047 ) ) ( not ( = ?auto_313046 ?auto_313048 ) ) ( not ( = ?auto_313046 ?auto_313049 ) ) ( not ( = ?auto_313046 ?auto_313050 ) ) ( not ( = ?auto_313046 ?auto_313051 ) ) ( not ( = ?auto_313046 ?auto_313052 ) ) ( not ( = ?auto_313046 ?auto_313053 ) ) ( not ( = ?auto_313046 ?auto_313054 ) ) ( not ( = ?auto_313046 ?auto_313055 ) ) ( not ( = ?auto_313046 ?auto_313056 ) ) ( not ( = ?auto_313047 ?auto_313048 ) ) ( not ( = ?auto_313047 ?auto_313049 ) ) ( not ( = ?auto_313047 ?auto_313050 ) ) ( not ( = ?auto_313047 ?auto_313051 ) ) ( not ( = ?auto_313047 ?auto_313052 ) ) ( not ( = ?auto_313047 ?auto_313053 ) ) ( not ( = ?auto_313047 ?auto_313054 ) ) ( not ( = ?auto_313047 ?auto_313055 ) ) ( not ( = ?auto_313047 ?auto_313056 ) ) ( not ( = ?auto_313048 ?auto_313049 ) ) ( not ( = ?auto_313048 ?auto_313050 ) ) ( not ( = ?auto_313048 ?auto_313051 ) ) ( not ( = ?auto_313048 ?auto_313052 ) ) ( not ( = ?auto_313048 ?auto_313053 ) ) ( not ( = ?auto_313048 ?auto_313054 ) ) ( not ( = ?auto_313048 ?auto_313055 ) ) ( not ( = ?auto_313048 ?auto_313056 ) ) ( not ( = ?auto_313049 ?auto_313050 ) ) ( not ( = ?auto_313049 ?auto_313051 ) ) ( not ( = ?auto_313049 ?auto_313052 ) ) ( not ( = ?auto_313049 ?auto_313053 ) ) ( not ( = ?auto_313049 ?auto_313054 ) ) ( not ( = ?auto_313049 ?auto_313055 ) ) ( not ( = ?auto_313049 ?auto_313056 ) ) ( not ( = ?auto_313050 ?auto_313051 ) ) ( not ( = ?auto_313050 ?auto_313052 ) ) ( not ( = ?auto_313050 ?auto_313053 ) ) ( not ( = ?auto_313050 ?auto_313054 ) ) ( not ( = ?auto_313050 ?auto_313055 ) ) ( not ( = ?auto_313050 ?auto_313056 ) ) ( not ( = ?auto_313051 ?auto_313052 ) ) ( not ( = ?auto_313051 ?auto_313053 ) ) ( not ( = ?auto_313051 ?auto_313054 ) ) ( not ( = ?auto_313051 ?auto_313055 ) ) ( not ( = ?auto_313051 ?auto_313056 ) ) ( not ( = ?auto_313052 ?auto_313053 ) ) ( not ( = ?auto_313052 ?auto_313054 ) ) ( not ( = ?auto_313052 ?auto_313055 ) ) ( not ( = ?auto_313052 ?auto_313056 ) ) ( not ( = ?auto_313053 ?auto_313054 ) ) ( not ( = ?auto_313053 ?auto_313055 ) ) ( not ( = ?auto_313053 ?auto_313056 ) ) ( not ( = ?auto_313054 ?auto_313055 ) ) ( not ( = ?auto_313054 ?auto_313056 ) ) ( not ( = ?auto_313055 ?auto_313056 ) ) ( ON ?auto_313055 ?auto_313056 ) ( ON ?auto_313054 ?auto_313055 ) ( ON ?auto_313053 ?auto_313054 ) ( ON ?auto_313052 ?auto_313053 ) ( ON ?auto_313051 ?auto_313052 ) ( CLEAR ?auto_313049 ) ( ON ?auto_313050 ?auto_313051 ) ( CLEAR ?auto_313050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_313043 ?auto_313044 ?auto_313045 ?auto_313046 ?auto_313047 ?auto_313048 ?auto_313049 ?auto_313050 )
      ( MAKE-14PILE ?auto_313043 ?auto_313044 ?auto_313045 ?auto_313046 ?auto_313047 ?auto_313048 ?auto_313049 ?auto_313050 ?auto_313051 ?auto_313052 ?auto_313053 ?auto_313054 ?auto_313055 ?auto_313056 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313071 - BLOCK
      ?auto_313072 - BLOCK
      ?auto_313073 - BLOCK
      ?auto_313074 - BLOCK
      ?auto_313075 - BLOCK
      ?auto_313076 - BLOCK
      ?auto_313077 - BLOCK
      ?auto_313078 - BLOCK
      ?auto_313079 - BLOCK
      ?auto_313080 - BLOCK
      ?auto_313081 - BLOCK
      ?auto_313082 - BLOCK
      ?auto_313083 - BLOCK
      ?auto_313084 - BLOCK
    )
    :vars
    (
      ?auto_313085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313084 ?auto_313085 ) ( ON-TABLE ?auto_313071 ) ( ON ?auto_313072 ?auto_313071 ) ( ON ?auto_313073 ?auto_313072 ) ( ON ?auto_313074 ?auto_313073 ) ( ON ?auto_313075 ?auto_313074 ) ( ON ?auto_313076 ?auto_313075 ) ( not ( = ?auto_313071 ?auto_313072 ) ) ( not ( = ?auto_313071 ?auto_313073 ) ) ( not ( = ?auto_313071 ?auto_313074 ) ) ( not ( = ?auto_313071 ?auto_313075 ) ) ( not ( = ?auto_313071 ?auto_313076 ) ) ( not ( = ?auto_313071 ?auto_313077 ) ) ( not ( = ?auto_313071 ?auto_313078 ) ) ( not ( = ?auto_313071 ?auto_313079 ) ) ( not ( = ?auto_313071 ?auto_313080 ) ) ( not ( = ?auto_313071 ?auto_313081 ) ) ( not ( = ?auto_313071 ?auto_313082 ) ) ( not ( = ?auto_313071 ?auto_313083 ) ) ( not ( = ?auto_313071 ?auto_313084 ) ) ( not ( = ?auto_313071 ?auto_313085 ) ) ( not ( = ?auto_313072 ?auto_313073 ) ) ( not ( = ?auto_313072 ?auto_313074 ) ) ( not ( = ?auto_313072 ?auto_313075 ) ) ( not ( = ?auto_313072 ?auto_313076 ) ) ( not ( = ?auto_313072 ?auto_313077 ) ) ( not ( = ?auto_313072 ?auto_313078 ) ) ( not ( = ?auto_313072 ?auto_313079 ) ) ( not ( = ?auto_313072 ?auto_313080 ) ) ( not ( = ?auto_313072 ?auto_313081 ) ) ( not ( = ?auto_313072 ?auto_313082 ) ) ( not ( = ?auto_313072 ?auto_313083 ) ) ( not ( = ?auto_313072 ?auto_313084 ) ) ( not ( = ?auto_313072 ?auto_313085 ) ) ( not ( = ?auto_313073 ?auto_313074 ) ) ( not ( = ?auto_313073 ?auto_313075 ) ) ( not ( = ?auto_313073 ?auto_313076 ) ) ( not ( = ?auto_313073 ?auto_313077 ) ) ( not ( = ?auto_313073 ?auto_313078 ) ) ( not ( = ?auto_313073 ?auto_313079 ) ) ( not ( = ?auto_313073 ?auto_313080 ) ) ( not ( = ?auto_313073 ?auto_313081 ) ) ( not ( = ?auto_313073 ?auto_313082 ) ) ( not ( = ?auto_313073 ?auto_313083 ) ) ( not ( = ?auto_313073 ?auto_313084 ) ) ( not ( = ?auto_313073 ?auto_313085 ) ) ( not ( = ?auto_313074 ?auto_313075 ) ) ( not ( = ?auto_313074 ?auto_313076 ) ) ( not ( = ?auto_313074 ?auto_313077 ) ) ( not ( = ?auto_313074 ?auto_313078 ) ) ( not ( = ?auto_313074 ?auto_313079 ) ) ( not ( = ?auto_313074 ?auto_313080 ) ) ( not ( = ?auto_313074 ?auto_313081 ) ) ( not ( = ?auto_313074 ?auto_313082 ) ) ( not ( = ?auto_313074 ?auto_313083 ) ) ( not ( = ?auto_313074 ?auto_313084 ) ) ( not ( = ?auto_313074 ?auto_313085 ) ) ( not ( = ?auto_313075 ?auto_313076 ) ) ( not ( = ?auto_313075 ?auto_313077 ) ) ( not ( = ?auto_313075 ?auto_313078 ) ) ( not ( = ?auto_313075 ?auto_313079 ) ) ( not ( = ?auto_313075 ?auto_313080 ) ) ( not ( = ?auto_313075 ?auto_313081 ) ) ( not ( = ?auto_313075 ?auto_313082 ) ) ( not ( = ?auto_313075 ?auto_313083 ) ) ( not ( = ?auto_313075 ?auto_313084 ) ) ( not ( = ?auto_313075 ?auto_313085 ) ) ( not ( = ?auto_313076 ?auto_313077 ) ) ( not ( = ?auto_313076 ?auto_313078 ) ) ( not ( = ?auto_313076 ?auto_313079 ) ) ( not ( = ?auto_313076 ?auto_313080 ) ) ( not ( = ?auto_313076 ?auto_313081 ) ) ( not ( = ?auto_313076 ?auto_313082 ) ) ( not ( = ?auto_313076 ?auto_313083 ) ) ( not ( = ?auto_313076 ?auto_313084 ) ) ( not ( = ?auto_313076 ?auto_313085 ) ) ( not ( = ?auto_313077 ?auto_313078 ) ) ( not ( = ?auto_313077 ?auto_313079 ) ) ( not ( = ?auto_313077 ?auto_313080 ) ) ( not ( = ?auto_313077 ?auto_313081 ) ) ( not ( = ?auto_313077 ?auto_313082 ) ) ( not ( = ?auto_313077 ?auto_313083 ) ) ( not ( = ?auto_313077 ?auto_313084 ) ) ( not ( = ?auto_313077 ?auto_313085 ) ) ( not ( = ?auto_313078 ?auto_313079 ) ) ( not ( = ?auto_313078 ?auto_313080 ) ) ( not ( = ?auto_313078 ?auto_313081 ) ) ( not ( = ?auto_313078 ?auto_313082 ) ) ( not ( = ?auto_313078 ?auto_313083 ) ) ( not ( = ?auto_313078 ?auto_313084 ) ) ( not ( = ?auto_313078 ?auto_313085 ) ) ( not ( = ?auto_313079 ?auto_313080 ) ) ( not ( = ?auto_313079 ?auto_313081 ) ) ( not ( = ?auto_313079 ?auto_313082 ) ) ( not ( = ?auto_313079 ?auto_313083 ) ) ( not ( = ?auto_313079 ?auto_313084 ) ) ( not ( = ?auto_313079 ?auto_313085 ) ) ( not ( = ?auto_313080 ?auto_313081 ) ) ( not ( = ?auto_313080 ?auto_313082 ) ) ( not ( = ?auto_313080 ?auto_313083 ) ) ( not ( = ?auto_313080 ?auto_313084 ) ) ( not ( = ?auto_313080 ?auto_313085 ) ) ( not ( = ?auto_313081 ?auto_313082 ) ) ( not ( = ?auto_313081 ?auto_313083 ) ) ( not ( = ?auto_313081 ?auto_313084 ) ) ( not ( = ?auto_313081 ?auto_313085 ) ) ( not ( = ?auto_313082 ?auto_313083 ) ) ( not ( = ?auto_313082 ?auto_313084 ) ) ( not ( = ?auto_313082 ?auto_313085 ) ) ( not ( = ?auto_313083 ?auto_313084 ) ) ( not ( = ?auto_313083 ?auto_313085 ) ) ( not ( = ?auto_313084 ?auto_313085 ) ) ( ON ?auto_313083 ?auto_313084 ) ( ON ?auto_313082 ?auto_313083 ) ( ON ?auto_313081 ?auto_313082 ) ( ON ?auto_313080 ?auto_313081 ) ( ON ?auto_313079 ?auto_313080 ) ( ON ?auto_313078 ?auto_313079 ) ( CLEAR ?auto_313076 ) ( ON ?auto_313077 ?auto_313078 ) ( CLEAR ?auto_313077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_313071 ?auto_313072 ?auto_313073 ?auto_313074 ?auto_313075 ?auto_313076 ?auto_313077 )
      ( MAKE-14PILE ?auto_313071 ?auto_313072 ?auto_313073 ?auto_313074 ?auto_313075 ?auto_313076 ?auto_313077 ?auto_313078 ?auto_313079 ?auto_313080 ?auto_313081 ?auto_313082 ?auto_313083 ?auto_313084 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313100 - BLOCK
      ?auto_313101 - BLOCK
      ?auto_313102 - BLOCK
      ?auto_313103 - BLOCK
      ?auto_313104 - BLOCK
      ?auto_313105 - BLOCK
      ?auto_313106 - BLOCK
      ?auto_313107 - BLOCK
      ?auto_313108 - BLOCK
      ?auto_313109 - BLOCK
      ?auto_313110 - BLOCK
      ?auto_313111 - BLOCK
      ?auto_313112 - BLOCK
      ?auto_313113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313113 ) ( ON-TABLE ?auto_313100 ) ( ON ?auto_313101 ?auto_313100 ) ( ON ?auto_313102 ?auto_313101 ) ( ON ?auto_313103 ?auto_313102 ) ( ON ?auto_313104 ?auto_313103 ) ( ON ?auto_313105 ?auto_313104 ) ( not ( = ?auto_313100 ?auto_313101 ) ) ( not ( = ?auto_313100 ?auto_313102 ) ) ( not ( = ?auto_313100 ?auto_313103 ) ) ( not ( = ?auto_313100 ?auto_313104 ) ) ( not ( = ?auto_313100 ?auto_313105 ) ) ( not ( = ?auto_313100 ?auto_313106 ) ) ( not ( = ?auto_313100 ?auto_313107 ) ) ( not ( = ?auto_313100 ?auto_313108 ) ) ( not ( = ?auto_313100 ?auto_313109 ) ) ( not ( = ?auto_313100 ?auto_313110 ) ) ( not ( = ?auto_313100 ?auto_313111 ) ) ( not ( = ?auto_313100 ?auto_313112 ) ) ( not ( = ?auto_313100 ?auto_313113 ) ) ( not ( = ?auto_313101 ?auto_313102 ) ) ( not ( = ?auto_313101 ?auto_313103 ) ) ( not ( = ?auto_313101 ?auto_313104 ) ) ( not ( = ?auto_313101 ?auto_313105 ) ) ( not ( = ?auto_313101 ?auto_313106 ) ) ( not ( = ?auto_313101 ?auto_313107 ) ) ( not ( = ?auto_313101 ?auto_313108 ) ) ( not ( = ?auto_313101 ?auto_313109 ) ) ( not ( = ?auto_313101 ?auto_313110 ) ) ( not ( = ?auto_313101 ?auto_313111 ) ) ( not ( = ?auto_313101 ?auto_313112 ) ) ( not ( = ?auto_313101 ?auto_313113 ) ) ( not ( = ?auto_313102 ?auto_313103 ) ) ( not ( = ?auto_313102 ?auto_313104 ) ) ( not ( = ?auto_313102 ?auto_313105 ) ) ( not ( = ?auto_313102 ?auto_313106 ) ) ( not ( = ?auto_313102 ?auto_313107 ) ) ( not ( = ?auto_313102 ?auto_313108 ) ) ( not ( = ?auto_313102 ?auto_313109 ) ) ( not ( = ?auto_313102 ?auto_313110 ) ) ( not ( = ?auto_313102 ?auto_313111 ) ) ( not ( = ?auto_313102 ?auto_313112 ) ) ( not ( = ?auto_313102 ?auto_313113 ) ) ( not ( = ?auto_313103 ?auto_313104 ) ) ( not ( = ?auto_313103 ?auto_313105 ) ) ( not ( = ?auto_313103 ?auto_313106 ) ) ( not ( = ?auto_313103 ?auto_313107 ) ) ( not ( = ?auto_313103 ?auto_313108 ) ) ( not ( = ?auto_313103 ?auto_313109 ) ) ( not ( = ?auto_313103 ?auto_313110 ) ) ( not ( = ?auto_313103 ?auto_313111 ) ) ( not ( = ?auto_313103 ?auto_313112 ) ) ( not ( = ?auto_313103 ?auto_313113 ) ) ( not ( = ?auto_313104 ?auto_313105 ) ) ( not ( = ?auto_313104 ?auto_313106 ) ) ( not ( = ?auto_313104 ?auto_313107 ) ) ( not ( = ?auto_313104 ?auto_313108 ) ) ( not ( = ?auto_313104 ?auto_313109 ) ) ( not ( = ?auto_313104 ?auto_313110 ) ) ( not ( = ?auto_313104 ?auto_313111 ) ) ( not ( = ?auto_313104 ?auto_313112 ) ) ( not ( = ?auto_313104 ?auto_313113 ) ) ( not ( = ?auto_313105 ?auto_313106 ) ) ( not ( = ?auto_313105 ?auto_313107 ) ) ( not ( = ?auto_313105 ?auto_313108 ) ) ( not ( = ?auto_313105 ?auto_313109 ) ) ( not ( = ?auto_313105 ?auto_313110 ) ) ( not ( = ?auto_313105 ?auto_313111 ) ) ( not ( = ?auto_313105 ?auto_313112 ) ) ( not ( = ?auto_313105 ?auto_313113 ) ) ( not ( = ?auto_313106 ?auto_313107 ) ) ( not ( = ?auto_313106 ?auto_313108 ) ) ( not ( = ?auto_313106 ?auto_313109 ) ) ( not ( = ?auto_313106 ?auto_313110 ) ) ( not ( = ?auto_313106 ?auto_313111 ) ) ( not ( = ?auto_313106 ?auto_313112 ) ) ( not ( = ?auto_313106 ?auto_313113 ) ) ( not ( = ?auto_313107 ?auto_313108 ) ) ( not ( = ?auto_313107 ?auto_313109 ) ) ( not ( = ?auto_313107 ?auto_313110 ) ) ( not ( = ?auto_313107 ?auto_313111 ) ) ( not ( = ?auto_313107 ?auto_313112 ) ) ( not ( = ?auto_313107 ?auto_313113 ) ) ( not ( = ?auto_313108 ?auto_313109 ) ) ( not ( = ?auto_313108 ?auto_313110 ) ) ( not ( = ?auto_313108 ?auto_313111 ) ) ( not ( = ?auto_313108 ?auto_313112 ) ) ( not ( = ?auto_313108 ?auto_313113 ) ) ( not ( = ?auto_313109 ?auto_313110 ) ) ( not ( = ?auto_313109 ?auto_313111 ) ) ( not ( = ?auto_313109 ?auto_313112 ) ) ( not ( = ?auto_313109 ?auto_313113 ) ) ( not ( = ?auto_313110 ?auto_313111 ) ) ( not ( = ?auto_313110 ?auto_313112 ) ) ( not ( = ?auto_313110 ?auto_313113 ) ) ( not ( = ?auto_313111 ?auto_313112 ) ) ( not ( = ?auto_313111 ?auto_313113 ) ) ( not ( = ?auto_313112 ?auto_313113 ) ) ( ON ?auto_313112 ?auto_313113 ) ( ON ?auto_313111 ?auto_313112 ) ( ON ?auto_313110 ?auto_313111 ) ( ON ?auto_313109 ?auto_313110 ) ( ON ?auto_313108 ?auto_313109 ) ( ON ?auto_313107 ?auto_313108 ) ( CLEAR ?auto_313105 ) ( ON ?auto_313106 ?auto_313107 ) ( CLEAR ?auto_313106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_313100 ?auto_313101 ?auto_313102 ?auto_313103 ?auto_313104 ?auto_313105 ?auto_313106 )
      ( MAKE-14PILE ?auto_313100 ?auto_313101 ?auto_313102 ?auto_313103 ?auto_313104 ?auto_313105 ?auto_313106 ?auto_313107 ?auto_313108 ?auto_313109 ?auto_313110 ?auto_313111 ?auto_313112 ?auto_313113 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313128 - BLOCK
      ?auto_313129 - BLOCK
      ?auto_313130 - BLOCK
      ?auto_313131 - BLOCK
      ?auto_313132 - BLOCK
      ?auto_313133 - BLOCK
      ?auto_313134 - BLOCK
      ?auto_313135 - BLOCK
      ?auto_313136 - BLOCK
      ?auto_313137 - BLOCK
      ?auto_313138 - BLOCK
      ?auto_313139 - BLOCK
      ?auto_313140 - BLOCK
      ?auto_313141 - BLOCK
    )
    :vars
    (
      ?auto_313142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313141 ?auto_313142 ) ( ON-TABLE ?auto_313128 ) ( ON ?auto_313129 ?auto_313128 ) ( ON ?auto_313130 ?auto_313129 ) ( ON ?auto_313131 ?auto_313130 ) ( ON ?auto_313132 ?auto_313131 ) ( not ( = ?auto_313128 ?auto_313129 ) ) ( not ( = ?auto_313128 ?auto_313130 ) ) ( not ( = ?auto_313128 ?auto_313131 ) ) ( not ( = ?auto_313128 ?auto_313132 ) ) ( not ( = ?auto_313128 ?auto_313133 ) ) ( not ( = ?auto_313128 ?auto_313134 ) ) ( not ( = ?auto_313128 ?auto_313135 ) ) ( not ( = ?auto_313128 ?auto_313136 ) ) ( not ( = ?auto_313128 ?auto_313137 ) ) ( not ( = ?auto_313128 ?auto_313138 ) ) ( not ( = ?auto_313128 ?auto_313139 ) ) ( not ( = ?auto_313128 ?auto_313140 ) ) ( not ( = ?auto_313128 ?auto_313141 ) ) ( not ( = ?auto_313128 ?auto_313142 ) ) ( not ( = ?auto_313129 ?auto_313130 ) ) ( not ( = ?auto_313129 ?auto_313131 ) ) ( not ( = ?auto_313129 ?auto_313132 ) ) ( not ( = ?auto_313129 ?auto_313133 ) ) ( not ( = ?auto_313129 ?auto_313134 ) ) ( not ( = ?auto_313129 ?auto_313135 ) ) ( not ( = ?auto_313129 ?auto_313136 ) ) ( not ( = ?auto_313129 ?auto_313137 ) ) ( not ( = ?auto_313129 ?auto_313138 ) ) ( not ( = ?auto_313129 ?auto_313139 ) ) ( not ( = ?auto_313129 ?auto_313140 ) ) ( not ( = ?auto_313129 ?auto_313141 ) ) ( not ( = ?auto_313129 ?auto_313142 ) ) ( not ( = ?auto_313130 ?auto_313131 ) ) ( not ( = ?auto_313130 ?auto_313132 ) ) ( not ( = ?auto_313130 ?auto_313133 ) ) ( not ( = ?auto_313130 ?auto_313134 ) ) ( not ( = ?auto_313130 ?auto_313135 ) ) ( not ( = ?auto_313130 ?auto_313136 ) ) ( not ( = ?auto_313130 ?auto_313137 ) ) ( not ( = ?auto_313130 ?auto_313138 ) ) ( not ( = ?auto_313130 ?auto_313139 ) ) ( not ( = ?auto_313130 ?auto_313140 ) ) ( not ( = ?auto_313130 ?auto_313141 ) ) ( not ( = ?auto_313130 ?auto_313142 ) ) ( not ( = ?auto_313131 ?auto_313132 ) ) ( not ( = ?auto_313131 ?auto_313133 ) ) ( not ( = ?auto_313131 ?auto_313134 ) ) ( not ( = ?auto_313131 ?auto_313135 ) ) ( not ( = ?auto_313131 ?auto_313136 ) ) ( not ( = ?auto_313131 ?auto_313137 ) ) ( not ( = ?auto_313131 ?auto_313138 ) ) ( not ( = ?auto_313131 ?auto_313139 ) ) ( not ( = ?auto_313131 ?auto_313140 ) ) ( not ( = ?auto_313131 ?auto_313141 ) ) ( not ( = ?auto_313131 ?auto_313142 ) ) ( not ( = ?auto_313132 ?auto_313133 ) ) ( not ( = ?auto_313132 ?auto_313134 ) ) ( not ( = ?auto_313132 ?auto_313135 ) ) ( not ( = ?auto_313132 ?auto_313136 ) ) ( not ( = ?auto_313132 ?auto_313137 ) ) ( not ( = ?auto_313132 ?auto_313138 ) ) ( not ( = ?auto_313132 ?auto_313139 ) ) ( not ( = ?auto_313132 ?auto_313140 ) ) ( not ( = ?auto_313132 ?auto_313141 ) ) ( not ( = ?auto_313132 ?auto_313142 ) ) ( not ( = ?auto_313133 ?auto_313134 ) ) ( not ( = ?auto_313133 ?auto_313135 ) ) ( not ( = ?auto_313133 ?auto_313136 ) ) ( not ( = ?auto_313133 ?auto_313137 ) ) ( not ( = ?auto_313133 ?auto_313138 ) ) ( not ( = ?auto_313133 ?auto_313139 ) ) ( not ( = ?auto_313133 ?auto_313140 ) ) ( not ( = ?auto_313133 ?auto_313141 ) ) ( not ( = ?auto_313133 ?auto_313142 ) ) ( not ( = ?auto_313134 ?auto_313135 ) ) ( not ( = ?auto_313134 ?auto_313136 ) ) ( not ( = ?auto_313134 ?auto_313137 ) ) ( not ( = ?auto_313134 ?auto_313138 ) ) ( not ( = ?auto_313134 ?auto_313139 ) ) ( not ( = ?auto_313134 ?auto_313140 ) ) ( not ( = ?auto_313134 ?auto_313141 ) ) ( not ( = ?auto_313134 ?auto_313142 ) ) ( not ( = ?auto_313135 ?auto_313136 ) ) ( not ( = ?auto_313135 ?auto_313137 ) ) ( not ( = ?auto_313135 ?auto_313138 ) ) ( not ( = ?auto_313135 ?auto_313139 ) ) ( not ( = ?auto_313135 ?auto_313140 ) ) ( not ( = ?auto_313135 ?auto_313141 ) ) ( not ( = ?auto_313135 ?auto_313142 ) ) ( not ( = ?auto_313136 ?auto_313137 ) ) ( not ( = ?auto_313136 ?auto_313138 ) ) ( not ( = ?auto_313136 ?auto_313139 ) ) ( not ( = ?auto_313136 ?auto_313140 ) ) ( not ( = ?auto_313136 ?auto_313141 ) ) ( not ( = ?auto_313136 ?auto_313142 ) ) ( not ( = ?auto_313137 ?auto_313138 ) ) ( not ( = ?auto_313137 ?auto_313139 ) ) ( not ( = ?auto_313137 ?auto_313140 ) ) ( not ( = ?auto_313137 ?auto_313141 ) ) ( not ( = ?auto_313137 ?auto_313142 ) ) ( not ( = ?auto_313138 ?auto_313139 ) ) ( not ( = ?auto_313138 ?auto_313140 ) ) ( not ( = ?auto_313138 ?auto_313141 ) ) ( not ( = ?auto_313138 ?auto_313142 ) ) ( not ( = ?auto_313139 ?auto_313140 ) ) ( not ( = ?auto_313139 ?auto_313141 ) ) ( not ( = ?auto_313139 ?auto_313142 ) ) ( not ( = ?auto_313140 ?auto_313141 ) ) ( not ( = ?auto_313140 ?auto_313142 ) ) ( not ( = ?auto_313141 ?auto_313142 ) ) ( ON ?auto_313140 ?auto_313141 ) ( ON ?auto_313139 ?auto_313140 ) ( ON ?auto_313138 ?auto_313139 ) ( ON ?auto_313137 ?auto_313138 ) ( ON ?auto_313136 ?auto_313137 ) ( ON ?auto_313135 ?auto_313136 ) ( ON ?auto_313134 ?auto_313135 ) ( CLEAR ?auto_313132 ) ( ON ?auto_313133 ?auto_313134 ) ( CLEAR ?auto_313133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_313128 ?auto_313129 ?auto_313130 ?auto_313131 ?auto_313132 ?auto_313133 )
      ( MAKE-14PILE ?auto_313128 ?auto_313129 ?auto_313130 ?auto_313131 ?auto_313132 ?auto_313133 ?auto_313134 ?auto_313135 ?auto_313136 ?auto_313137 ?auto_313138 ?auto_313139 ?auto_313140 ?auto_313141 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313157 - BLOCK
      ?auto_313158 - BLOCK
      ?auto_313159 - BLOCK
      ?auto_313160 - BLOCK
      ?auto_313161 - BLOCK
      ?auto_313162 - BLOCK
      ?auto_313163 - BLOCK
      ?auto_313164 - BLOCK
      ?auto_313165 - BLOCK
      ?auto_313166 - BLOCK
      ?auto_313167 - BLOCK
      ?auto_313168 - BLOCK
      ?auto_313169 - BLOCK
      ?auto_313170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313170 ) ( ON-TABLE ?auto_313157 ) ( ON ?auto_313158 ?auto_313157 ) ( ON ?auto_313159 ?auto_313158 ) ( ON ?auto_313160 ?auto_313159 ) ( ON ?auto_313161 ?auto_313160 ) ( not ( = ?auto_313157 ?auto_313158 ) ) ( not ( = ?auto_313157 ?auto_313159 ) ) ( not ( = ?auto_313157 ?auto_313160 ) ) ( not ( = ?auto_313157 ?auto_313161 ) ) ( not ( = ?auto_313157 ?auto_313162 ) ) ( not ( = ?auto_313157 ?auto_313163 ) ) ( not ( = ?auto_313157 ?auto_313164 ) ) ( not ( = ?auto_313157 ?auto_313165 ) ) ( not ( = ?auto_313157 ?auto_313166 ) ) ( not ( = ?auto_313157 ?auto_313167 ) ) ( not ( = ?auto_313157 ?auto_313168 ) ) ( not ( = ?auto_313157 ?auto_313169 ) ) ( not ( = ?auto_313157 ?auto_313170 ) ) ( not ( = ?auto_313158 ?auto_313159 ) ) ( not ( = ?auto_313158 ?auto_313160 ) ) ( not ( = ?auto_313158 ?auto_313161 ) ) ( not ( = ?auto_313158 ?auto_313162 ) ) ( not ( = ?auto_313158 ?auto_313163 ) ) ( not ( = ?auto_313158 ?auto_313164 ) ) ( not ( = ?auto_313158 ?auto_313165 ) ) ( not ( = ?auto_313158 ?auto_313166 ) ) ( not ( = ?auto_313158 ?auto_313167 ) ) ( not ( = ?auto_313158 ?auto_313168 ) ) ( not ( = ?auto_313158 ?auto_313169 ) ) ( not ( = ?auto_313158 ?auto_313170 ) ) ( not ( = ?auto_313159 ?auto_313160 ) ) ( not ( = ?auto_313159 ?auto_313161 ) ) ( not ( = ?auto_313159 ?auto_313162 ) ) ( not ( = ?auto_313159 ?auto_313163 ) ) ( not ( = ?auto_313159 ?auto_313164 ) ) ( not ( = ?auto_313159 ?auto_313165 ) ) ( not ( = ?auto_313159 ?auto_313166 ) ) ( not ( = ?auto_313159 ?auto_313167 ) ) ( not ( = ?auto_313159 ?auto_313168 ) ) ( not ( = ?auto_313159 ?auto_313169 ) ) ( not ( = ?auto_313159 ?auto_313170 ) ) ( not ( = ?auto_313160 ?auto_313161 ) ) ( not ( = ?auto_313160 ?auto_313162 ) ) ( not ( = ?auto_313160 ?auto_313163 ) ) ( not ( = ?auto_313160 ?auto_313164 ) ) ( not ( = ?auto_313160 ?auto_313165 ) ) ( not ( = ?auto_313160 ?auto_313166 ) ) ( not ( = ?auto_313160 ?auto_313167 ) ) ( not ( = ?auto_313160 ?auto_313168 ) ) ( not ( = ?auto_313160 ?auto_313169 ) ) ( not ( = ?auto_313160 ?auto_313170 ) ) ( not ( = ?auto_313161 ?auto_313162 ) ) ( not ( = ?auto_313161 ?auto_313163 ) ) ( not ( = ?auto_313161 ?auto_313164 ) ) ( not ( = ?auto_313161 ?auto_313165 ) ) ( not ( = ?auto_313161 ?auto_313166 ) ) ( not ( = ?auto_313161 ?auto_313167 ) ) ( not ( = ?auto_313161 ?auto_313168 ) ) ( not ( = ?auto_313161 ?auto_313169 ) ) ( not ( = ?auto_313161 ?auto_313170 ) ) ( not ( = ?auto_313162 ?auto_313163 ) ) ( not ( = ?auto_313162 ?auto_313164 ) ) ( not ( = ?auto_313162 ?auto_313165 ) ) ( not ( = ?auto_313162 ?auto_313166 ) ) ( not ( = ?auto_313162 ?auto_313167 ) ) ( not ( = ?auto_313162 ?auto_313168 ) ) ( not ( = ?auto_313162 ?auto_313169 ) ) ( not ( = ?auto_313162 ?auto_313170 ) ) ( not ( = ?auto_313163 ?auto_313164 ) ) ( not ( = ?auto_313163 ?auto_313165 ) ) ( not ( = ?auto_313163 ?auto_313166 ) ) ( not ( = ?auto_313163 ?auto_313167 ) ) ( not ( = ?auto_313163 ?auto_313168 ) ) ( not ( = ?auto_313163 ?auto_313169 ) ) ( not ( = ?auto_313163 ?auto_313170 ) ) ( not ( = ?auto_313164 ?auto_313165 ) ) ( not ( = ?auto_313164 ?auto_313166 ) ) ( not ( = ?auto_313164 ?auto_313167 ) ) ( not ( = ?auto_313164 ?auto_313168 ) ) ( not ( = ?auto_313164 ?auto_313169 ) ) ( not ( = ?auto_313164 ?auto_313170 ) ) ( not ( = ?auto_313165 ?auto_313166 ) ) ( not ( = ?auto_313165 ?auto_313167 ) ) ( not ( = ?auto_313165 ?auto_313168 ) ) ( not ( = ?auto_313165 ?auto_313169 ) ) ( not ( = ?auto_313165 ?auto_313170 ) ) ( not ( = ?auto_313166 ?auto_313167 ) ) ( not ( = ?auto_313166 ?auto_313168 ) ) ( not ( = ?auto_313166 ?auto_313169 ) ) ( not ( = ?auto_313166 ?auto_313170 ) ) ( not ( = ?auto_313167 ?auto_313168 ) ) ( not ( = ?auto_313167 ?auto_313169 ) ) ( not ( = ?auto_313167 ?auto_313170 ) ) ( not ( = ?auto_313168 ?auto_313169 ) ) ( not ( = ?auto_313168 ?auto_313170 ) ) ( not ( = ?auto_313169 ?auto_313170 ) ) ( ON ?auto_313169 ?auto_313170 ) ( ON ?auto_313168 ?auto_313169 ) ( ON ?auto_313167 ?auto_313168 ) ( ON ?auto_313166 ?auto_313167 ) ( ON ?auto_313165 ?auto_313166 ) ( ON ?auto_313164 ?auto_313165 ) ( ON ?auto_313163 ?auto_313164 ) ( CLEAR ?auto_313161 ) ( ON ?auto_313162 ?auto_313163 ) ( CLEAR ?auto_313162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_313157 ?auto_313158 ?auto_313159 ?auto_313160 ?auto_313161 ?auto_313162 )
      ( MAKE-14PILE ?auto_313157 ?auto_313158 ?auto_313159 ?auto_313160 ?auto_313161 ?auto_313162 ?auto_313163 ?auto_313164 ?auto_313165 ?auto_313166 ?auto_313167 ?auto_313168 ?auto_313169 ?auto_313170 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313185 - BLOCK
      ?auto_313186 - BLOCK
      ?auto_313187 - BLOCK
      ?auto_313188 - BLOCK
      ?auto_313189 - BLOCK
      ?auto_313190 - BLOCK
      ?auto_313191 - BLOCK
      ?auto_313192 - BLOCK
      ?auto_313193 - BLOCK
      ?auto_313194 - BLOCK
      ?auto_313195 - BLOCK
      ?auto_313196 - BLOCK
      ?auto_313197 - BLOCK
      ?auto_313198 - BLOCK
    )
    :vars
    (
      ?auto_313199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313198 ?auto_313199 ) ( ON-TABLE ?auto_313185 ) ( ON ?auto_313186 ?auto_313185 ) ( ON ?auto_313187 ?auto_313186 ) ( ON ?auto_313188 ?auto_313187 ) ( not ( = ?auto_313185 ?auto_313186 ) ) ( not ( = ?auto_313185 ?auto_313187 ) ) ( not ( = ?auto_313185 ?auto_313188 ) ) ( not ( = ?auto_313185 ?auto_313189 ) ) ( not ( = ?auto_313185 ?auto_313190 ) ) ( not ( = ?auto_313185 ?auto_313191 ) ) ( not ( = ?auto_313185 ?auto_313192 ) ) ( not ( = ?auto_313185 ?auto_313193 ) ) ( not ( = ?auto_313185 ?auto_313194 ) ) ( not ( = ?auto_313185 ?auto_313195 ) ) ( not ( = ?auto_313185 ?auto_313196 ) ) ( not ( = ?auto_313185 ?auto_313197 ) ) ( not ( = ?auto_313185 ?auto_313198 ) ) ( not ( = ?auto_313185 ?auto_313199 ) ) ( not ( = ?auto_313186 ?auto_313187 ) ) ( not ( = ?auto_313186 ?auto_313188 ) ) ( not ( = ?auto_313186 ?auto_313189 ) ) ( not ( = ?auto_313186 ?auto_313190 ) ) ( not ( = ?auto_313186 ?auto_313191 ) ) ( not ( = ?auto_313186 ?auto_313192 ) ) ( not ( = ?auto_313186 ?auto_313193 ) ) ( not ( = ?auto_313186 ?auto_313194 ) ) ( not ( = ?auto_313186 ?auto_313195 ) ) ( not ( = ?auto_313186 ?auto_313196 ) ) ( not ( = ?auto_313186 ?auto_313197 ) ) ( not ( = ?auto_313186 ?auto_313198 ) ) ( not ( = ?auto_313186 ?auto_313199 ) ) ( not ( = ?auto_313187 ?auto_313188 ) ) ( not ( = ?auto_313187 ?auto_313189 ) ) ( not ( = ?auto_313187 ?auto_313190 ) ) ( not ( = ?auto_313187 ?auto_313191 ) ) ( not ( = ?auto_313187 ?auto_313192 ) ) ( not ( = ?auto_313187 ?auto_313193 ) ) ( not ( = ?auto_313187 ?auto_313194 ) ) ( not ( = ?auto_313187 ?auto_313195 ) ) ( not ( = ?auto_313187 ?auto_313196 ) ) ( not ( = ?auto_313187 ?auto_313197 ) ) ( not ( = ?auto_313187 ?auto_313198 ) ) ( not ( = ?auto_313187 ?auto_313199 ) ) ( not ( = ?auto_313188 ?auto_313189 ) ) ( not ( = ?auto_313188 ?auto_313190 ) ) ( not ( = ?auto_313188 ?auto_313191 ) ) ( not ( = ?auto_313188 ?auto_313192 ) ) ( not ( = ?auto_313188 ?auto_313193 ) ) ( not ( = ?auto_313188 ?auto_313194 ) ) ( not ( = ?auto_313188 ?auto_313195 ) ) ( not ( = ?auto_313188 ?auto_313196 ) ) ( not ( = ?auto_313188 ?auto_313197 ) ) ( not ( = ?auto_313188 ?auto_313198 ) ) ( not ( = ?auto_313188 ?auto_313199 ) ) ( not ( = ?auto_313189 ?auto_313190 ) ) ( not ( = ?auto_313189 ?auto_313191 ) ) ( not ( = ?auto_313189 ?auto_313192 ) ) ( not ( = ?auto_313189 ?auto_313193 ) ) ( not ( = ?auto_313189 ?auto_313194 ) ) ( not ( = ?auto_313189 ?auto_313195 ) ) ( not ( = ?auto_313189 ?auto_313196 ) ) ( not ( = ?auto_313189 ?auto_313197 ) ) ( not ( = ?auto_313189 ?auto_313198 ) ) ( not ( = ?auto_313189 ?auto_313199 ) ) ( not ( = ?auto_313190 ?auto_313191 ) ) ( not ( = ?auto_313190 ?auto_313192 ) ) ( not ( = ?auto_313190 ?auto_313193 ) ) ( not ( = ?auto_313190 ?auto_313194 ) ) ( not ( = ?auto_313190 ?auto_313195 ) ) ( not ( = ?auto_313190 ?auto_313196 ) ) ( not ( = ?auto_313190 ?auto_313197 ) ) ( not ( = ?auto_313190 ?auto_313198 ) ) ( not ( = ?auto_313190 ?auto_313199 ) ) ( not ( = ?auto_313191 ?auto_313192 ) ) ( not ( = ?auto_313191 ?auto_313193 ) ) ( not ( = ?auto_313191 ?auto_313194 ) ) ( not ( = ?auto_313191 ?auto_313195 ) ) ( not ( = ?auto_313191 ?auto_313196 ) ) ( not ( = ?auto_313191 ?auto_313197 ) ) ( not ( = ?auto_313191 ?auto_313198 ) ) ( not ( = ?auto_313191 ?auto_313199 ) ) ( not ( = ?auto_313192 ?auto_313193 ) ) ( not ( = ?auto_313192 ?auto_313194 ) ) ( not ( = ?auto_313192 ?auto_313195 ) ) ( not ( = ?auto_313192 ?auto_313196 ) ) ( not ( = ?auto_313192 ?auto_313197 ) ) ( not ( = ?auto_313192 ?auto_313198 ) ) ( not ( = ?auto_313192 ?auto_313199 ) ) ( not ( = ?auto_313193 ?auto_313194 ) ) ( not ( = ?auto_313193 ?auto_313195 ) ) ( not ( = ?auto_313193 ?auto_313196 ) ) ( not ( = ?auto_313193 ?auto_313197 ) ) ( not ( = ?auto_313193 ?auto_313198 ) ) ( not ( = ?auto_313193 ?auto_313199 ) ) ( not ( = ?auto_313194 ?auto_313195 ) ) ( not ( = ?auto_313194 ?auto_313196 ) ) ( not ( = ?auto_313194 ?auto_313197 ) ) ( not ( = ?auto_313194 ?auto_313198 ) ) ( not ( = ?auto_313194 ?auto_313199 ) ) ( not ( = ?auto_313195 ?auto_313196 ) ) ( not ( = ?auto_313195 ?auto_313197 ) ) ( not ( = ?auto_313195 ?auto_313198 ) ) ( not ( = ?auto_313195 ?auto_313199 ) ) ( not ( = ?auto_313196 ?auto_313197 ) ) ( not ( = ?auto_313196 ?auto_313198 ) ) ( not ( = ?auto_313196 ?auto_313199 ) ) ( not ( = ?auto_313197 ?auto_313198 ) ) ( not ( = ?auto_313197 ?auto_313199 ) ) ( not ( = ?auto_313198 ?auto_313199 ) ) ( ON ?auto_313197 ?auto_313198 ) ( ON ?auto_313196 ?auto_313197 ) ( ON ?auto_313195 ?auto_313196 ) ( ON ?auto_313194 ?auto_313195 ) ( ON ?auto_313193 ?auto_313194 ) ( ON ?auto_313192 ?auto_313193 ) ( ON ?auto_313191 ?auto_313192 ) ( ON ?auto_313190 ?auto_313191 ) ( CLEAR ?auto_313188 ) ( ON ?auto_313189 ?auto_313190 ) ( CLEAR ?auto_313189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313185 ?auto_313186 ?auto_313187 ?auto_313188 ?auto_313189 )
      ( MAKE-14PILE ?auto_313185 ?auto_313186 ?auto_313187 ?auto_313188 ?auto_313189 ?auto_313190 ?auto_313191 ?auto_313192 ?auto_313193 ?auto_313194 ?auto_313195 ?auto_313196 ?auto_313197 ?auto_313198 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313214 - BLOCK
      ?auto_313215 - BLOCK
      ?auto_313216 - BLOCK
      ?auto_313217 - BLOCK
      ?auto_313218 - BLOCK
      ?auto_313219 - BLOCK
      ?auto_313220 - BLOCK
      ?auto_313221 - BLOCK
      ?auto_313222 - BLOCK
      ?auto_313223 - BLOCK
      ?auto_313224 - BLOCK
      ?auto_313225 - BLOCK
      ?auto_313226 - BLOCK
      ?auto_313227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313227 ) ( ON-TABLE ?auto_313214 ) ( ON ?auto_313215 ?auto_313214 ) ( ON ?auto_313216 ?auto_313215 ) ( ON ?auto_313217 ?auto_313216 ) ( not ( = ?auto_313214 ?auto_313215 ) ) ( not ( = ?auto_313214 ?auto_313216 ) ) ( not ( = ?auto_313214 ?auto_313217 ) ) ( not ( = ?auto_313214 ?auto_313218 ) ) ( not ( = ?auto_313214 ?auto_313219 ) ) ( not ( = ?auto_313214 ?auto_313220 ) ) ( not ( = ?auto_313214 ?auto_313221 ) ) ( not ( = ?auto_313214 ?auto_313222 ) ) ( not ( = ?auto_313214 ?auto_313223 ) ) ( not ( = ?auto_313214 ?auto_313224 ) ) ( not ( = ?auto_313214 ?auto_313225 ) ) ( not ( = ?auto_313214 ?auto_313226 ) ) ( not ( = ?auto_313214 ?auto_313227 ) ) ( not ( = ?auto_313215 ?auto_313216 ) ) ( not ( = ?auto_313215 ?auto_313217 ) ) ( not ( = ?auto_313215 ?auto_313218 ) ) ( not ( = ?auto_313215 ?auto_313219 ) ) ( not ( = ?auto_313215 ?auto_313220 ) ) ( not ( = ?auto_313215 ?auto_313221 ) ) ( not ( = ?auto_313215 ?auto_313222 ) ) ( not ( = ?auto_313215 ?auto_313223 ) ) ( not ( = ?auto_313215 ?auto_313224 ) ) ( not ( = ?auto_313215 ?auto_313225 ) ) ( not ( = ?auto_313215 ?auto_313226 ) ) ( not ( = ?auto_313215 ?auto_313227 ) ) ( not ( = ?auto_313216 ?auto_313217 ) ) ( not ( = ?auto_313216 ?auto_313218 ) ) ( not ( = ?auto_313216 ?auto_313219 ) ) ( not ( = ?auto_313216 ?auto_313220 ) ) ( not ( = ?auto_313216 ?auto_313221 ) ) ( not ( = ?auto_313216 ?auto_313222 ) ) ( not ( = ?auto_313216 ?auto_313223 ) ) ( not ( = ?auto_313216 ?auto_313224 ) ) ( not ( = ?auto_313216 ?auto_313225 ) ) ( not ( = ?auto_313216 ?auto_313226 ) ) ( not ( = ?auto_313216 ?auto_313227 ) ) ( not ( = ?auto_313217 ?auto_313218 ) ) ( not ( = ?auto_313217 ?auto_313219 ) ) ( not ( = ?auto_313217 ?auto_313220 ) ) ( not ( = ?auto_313217 ?auto_313221 ) ) ( not ( = ?auto_313217 ?auto_313222 ) ) ( not ( = ?auto_313217 ?auto_313223 ) ) ( not ( = ?auto_313217 ?auto_313224 ) ) ( not ( = ?auto_313217 ?auto_313225 ) ) ( not ( = ?auto_313217 ?auto_313226 ) ) ( not ( = ?auto_313217 ?auto_313227 ) ) ( not ( = ?auto_313218 ?auto_313219 ) ) ( not ( = ?auto_313218 ?auto_313220 ) ) ( not ( = ?auto_313218 ?auto_313221 ) ) ( not ( = ?auto_313218 ?auto_313222 ) ) ( not ( = ?auto_313218 ?auto_313223 ) ) ( not ( = ?auto_313218 ?auto_313224 ) ) ( not ( = ?auto_313218 ?auto_313225 ) ) ( not ( = ?auto_313218 ?auto_313226 ) ) ( not ( = ?auto_313218 ?auto_313227 ) ) ( not ( = ?auto_313219 ?auto_313220 ) ) ( not ( = ?auto_313219 ?auto_313221 ) ) ( not ( = ?auto_313219 ?auto_313222 ) ) ( not ( = ?auto_313219 ?auto_313223 ) ) ( not ( = ?auto_313219 ?auto_313224 ) ) ( not ( = ?auto_313219 ?auto_313225 ) ) ( not ( = ?auto_313219 ?auto_313226 ) ) ( not ( = ?auto_313219 ?auto_313227 ) ) ( not ( = ?auto_313220 ?auto_313221 ) ) ( not ( = ?auto_313220 ?auto_313222 ) ) ( not ( = ?auto_313220 ?auto_313223 ) ) ( not ( = ?auto_313220 ?auto_313224 ) ) ( not ( = ?auto_313220 ?auto_313225 ) ) ( not ( = ?auto_313220 ?auto_313226 ) ) ( not ( = ?auto_313220 ?auto_313227 ) ) ( not ( = ?auto_313221 ?auto_313222 ) ) ( not ( = ?auto_313221 ?auto_313223 ) ) ( not ( = ?auto_313221 ?auto_313224 ) ) ( not ( = ?auto_313221 ?auto_313225 ) ) ( not ( = ?auto_313221 ?auto_313226 ) ) ( not ( = ?auto_313221 ?auto_313227 ) ) ( not ( = ?auto_313222 ?auto_313223 ) ) ( not ( = ?auto_313222 ?auto_313224 ) ) ( not ( = ?auto_313222 ?auto_313225 ) ) ( not ( = ?auto_313222 ?auto_313226 ) ) ( not ( = ?auto_313222 ?auto_313227 ) ) ( not ( = ?auto_313223 ?auto_313224 ) ) ( not ( = ?auto_313223 ?auto_313225 ) ) ( not ( = ?auto_313223 ?auto_313226 ) ) ( not ( = ?auto_313223 ?auto_313227 ) ) ( not ( = ?auto_313224 ?auto_313225 ) ) ( not ( = ?auto_313224 ?auto_313226 ) ) ( not ( = ?auto_313224 ?auto_313227 ) ) ( not ( = ?auto_313225 ?auto_313226 ) ) ( not ( = ?auto_313225 ?auto_313227 ) ) ( not ( = ?auto_313226 ?auto_313227 ) ) ( ON ?auto_313226 ?auto_313227 ) ( ON ?auto_313225 ?auto_313226 ) ( ON ?auto_313224 ?auto_313225 ) ( ON ?auto_313223 ?auto_313224 ) ( ON ?auto_313222 ?auto_313223 ) ( ON ?auto_313221 ?auto_313222 ) ( ON ?auto_313220 ?auto_313221 ) ( ON ?auto_313219 ?auto_313220 ) ( CLEAR ?auto_313217 ) ( ON ?auto_313218 ?auto_313219 ) ( CLEAR ?auto_313218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313214 ?auto_313215 ?auto_313216 ?auto_313217 ?auto_313218 )
      ( MAKE-14PILE ?auto_313214 ?auto_313215 ?auto_313216 ?auto_313217 ?auto_313218 ?auto_313219 ?auto_313220 ?auto_313221 ?auto_313222 ?auto_313223 ?auto_313224 ?auto_313225 ?auto_313226 ?auto_313227 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313242 - BLOCK
      ?auto_313243 - BLOCK
      ?auto_313244 - BLOCK
      ?auto_313245 - BLOCK
      ?auto_313246 - BLOCK
      ?auto_313247 - BLOCK
      ?auto_313248 - BLOCK
      ?auto_313249 - BLOCK
      ?auto_313250 - BLOCK
      ?auto_313251 - BLOCK
      ?auto_313252 - BLOCK
      ?auto_313253 - BLOCK
      ?auto_313254 - BLOCK
      ?auto_313255 - BLOCK
    )
    :vars
    (
      ?auto_313256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313255 ?auto_313256 ) ( ON-TABLE ?auto_313242 ) ( ON ?auto_313243 ?auto_313242 ) ( ON ?auto_313244 ?auto_313243 ) ( not ( = ?auto_313242 ?auto_313243 ) ) ( not ( = ?auto_313242 ?auto_313244 ) ) ( not ( = ?auto_313242 ?auto_313245 ) ) ( not ( = ?auto_313242 ?auto_313246 ) ) ( not ( = ?auto_313242 ?auto_313247 ) ) ( not ( = ?auto_313242 ?auto_313248 ) ) ( not ( = ?auto_313242 ?auto_313249 ) ) ( not ( = ?auto_313242 ?auto_313250 ) ) ( not ( = ?auto_313242 ?auto_313251 ) ) ( not ( = ?auto_313242 ?auto_313252 ) ) ( not ( = ?auto_313242 ?auto_313253 ) ) ( not ( = ?auto_313242 ?auto_313254 ) ) ( not ( = ?auto_313242 ?auto_313255 ) ) ( not ( = ?auto_313242 ?auto_313256 ) ) ( not ( = ?auto_313243 ?auto_313244 ) ) ( not ( = ?auto_313243 ?auto_313245 ) ) ( not ( = ?auto_313243 ?auto_313246 ) ) ( not ( = ?auto_313243 ?auto_313247 ) ) ( not ( = ?auto_313243 ?auto_313248 ) ) ( not ( = ?auto_313243 ?auto_313249 ) ) ( not ( = ?auto_313243 ?auto_313250 ) ) ( not ( = ?auto_313243 ?auto_313251 ) ) ( not ( = ?auto_313243 ?auto_313252 ) ) ( not ( = ?auto_313243 ?auto_313253 ) ) ( not ( = ?auto_313243 ?auto_313254 ) ) ( not ( = ?auto_313243 ?auto_313255 ) ) ( not ( = ?auto_313243 ?auto_313256 ) ) ( not ( = ?auto_313244 ?auto_313245 ) ) ( not ( = ?auto_313244 ?auto_313246 ) ) ( not ( = ?auto_313244 ?auto_313247 ) ) ( not ( = ?auto_313244 ?auto_313248 ) ) ( not ( = ?auto_313244 ?auto_313249 ) ) ( not ( = ?auto_313244 ?auto_313250 ) ) ( not ( = ?auto_313244 ?auto_313251 ) ) ( not ( = ?auto_313244 ?auto_313252 ) ) ( not ( = ?auto_313244 ?auto_313253 ) ) ( not ( = ?auto_313244 ?auto_313254 ) ) ( not ( = ?auto_313244 ?auto_313255 ) ) ( not ( = ?auto_313244 ?auto_313256 ) ) ( not ( = ?auto_313245 ?auto_313246 ) ) ( not ( = ?auto_313245 ?auto_313247 ) ) ( not ( = ?auto_313245 ?auto_313248 ) ) ( not ( = ?auto_313245 ?auto_313249 ) ) ( not ( = ?auto_313245 ?auto_313250 ) ) ( not ( = ?auto_313245 ?auto_313251 ) ) ( not ( = ?auto_313245 ?auto_313252 ) ) ( not ( = ?auto_313245 ?auto_313253 ) ) ( not ( = ?auto_313245 ?auto_313254 ) ) ( not ( = ?auto_313245 ?auto_313255 ) ) ( not ( = ?auto_313245 ?auto_313256 ) ) ( not ( = ?auto_313246 ?auto_313247 ) ) ( not ( = ?auto_313246 ?auto_313248 ) ) ( not ( = ?auto_313246 ?auto_313249 ) ) ( not ( = ?auto_313246 ?auto_313250 ) ) ( not ( = ?auto_313246 ?auto_313251 ) ) ( not ( = ?auto_313246 ?auto_313252 ) ) ( not ( = ?auto_313246 ?auto_313253 ) ) ( not ( = ?auto_313246 ?auto_313254 ) ) ( not ( = ?auto_313246 ?auto_313255 ) ) ( not ( = ?auto_313246 ?auto_313256 ) ) ( not ( = ?auto_313247 ?auto_313248 ) ) ( not ( = ?auto_313247 ?auto_313249 ) ) ( not ( = ?auto_313247 ?auto_313250 ) ) ( not ( = ?auto_313247 ?auto_313251 ) ) ( not ( = ?auto_313247 ?auto_313252 ) ) ( not ( = ?auto_313247 ?auto_313253 ) ) ( not ( = ?auto_313247 ?auto_313254 ) ) ( not ( = ?auto_313247 ?auto_313255 ) ) ( not ( = ?auto_313247 ?auto_313256 ) ) ( not ( = ?auto_313248 ?auto_313249 ) ) ( not ( = ?auto_313248 ?auto_313250 ) ) ( not ( = ?auto_313248 ?auto_313251 ) ) ( not ( = ?auto_313248 ?auto_313252 ) ) ( not ( = ?auto_313248 ?auto_313253 ) ) ( not ( = ?auto_313248 ?auto_313254 ) ) ( not ( = ?auto_313248 ?auto_313255 ) ) ( not ( = ?auto_313248 ?auto_313256 ) ) ( not ( = ?auto_313249 ?auto_313250 ) ) ( not ( = ?auto_313249 ?auto_313251 ) ) ( not ( = ?auto_313249 ?auto_313252 ) ) ( not ( = ?auto_313249 ?auto_313253 ) ) ( not ( = ?auto_313249 ?auto_313254 ) ) ( not ( = ?auto_313249 ?auto_313255 ) ) ( not ( = ?auto_313249 ?auto_313256 ) ) ( not ( = ?auto_313250 ?auto_313251 ) ) ( not ( = ?auto_313250 ?auto_313252 ) ) ( not ( = ?auto_313250 ?auto_313253 ) ) ( not ( = ?auto_313250 ?auto_313254 ) ) ( not ( = ?auto_313250 ?auto_313255 ) ) ( not ( = ?auto_313250 ?auto_313256 ) ) ( not ( = ?auto_313251 ?auto_313252 ) ) ( not ( = ?auto_313251 ?auto_313253 ) ) ( not ( = ?auto_313251 ?auto_313254 ) ) ( not ( = ?auto_313251 ?auto_313255 ) ) ( not ( = ?auto_313251 ?auto_313256 ) ) ( not ( = ?auto_313252 ?auto_313253 ) ) ( not ( = ?auto_313252 ?auto_313254 ) ) ( not ( = ?auto_313252 ?auto_313255 ) ) ( not ( = ?auto_313252 ?auto_313256 ) ) ( not ( = ?auto_313253 ?auto_313254 ) ) ( not ( = ?auto_313253 ?auto_313255 ) ) ( not ( = ?auto_313253 ?auto_313256 ) ) ( not ( = ?auto_313254 ?auto_313255 ) ) ( not ( = ?auto_313254 ?auto_313256 ) ) ( not ( = ?auto_313255 ?auto_313256 ) ) ( ON ?auto_313254 ?auto_313255 ) ( ON ?auto_313253 ?auto_313254 ) ( ON ?auto_313252 ?auto_313253 ) ( ON ?auto_313251 ?auto_313252 ) ( ON ?auto_313250 ?auto_313251 ) ( ON ?auto_313249 ?auto_313250 ) ( ON ?auto_313248 ?auto_313249 ) ( ON ?auto_313247 ?auto_313248 ) ( ON ?auto_313246 ?auto_313247 ) ( CLEAR ?auto_313244 ) ( ON ?auto_313245 ?auto_313246 ) ( CLEAR ?auto_313245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313242 ?auto_313243 ?auto_313244 ?auto_313245 )
      ( MAKE-14PILE ?auto_313242 ?auto_313243 ?auto_313244 ?auto_313245 ?auto_313246 ?auto_313247 ?auto_313248 ?auto_313249 ?auto_313250 ?auto_313251 ?auto_313252 ?auto_313253 ?auto_313254 ?auto_313255 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313271 - BLOCK
      ?auto_313272 - BLOCK
      ?auto_313273 - BLOCK
      ?auto_313274 - BLOCK
      ?auto_313275 - BLOCK
      ?auto_313276 - BLOCK
      ?auto_313277 - BLOCK
      ?auto_313278 - BLOCK
      ?auto_313279 - BLOCK
      ?auto_313280 - BLOCK
      ?auto_313281 - BLOCK
      ?auto_313282 - BLOCK
      ?auto_313283 - BLOCK
      ?auto_313284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313284 ) ( ON-TABLE ?auto_313271 ) ( ON ?auto_313272 ?auto_313271 ) ( ON ?auto_313273 ?auto_313272 ) ( not ( = ?auto_313271 ?auto_313272 ) ) ( not ( = ?auto_313271 ?auto_313273 ) ) ( not ( = ?auto_313271 ?auto_313274 ) ) ( not ( = ?auto_313271 ?auto_313275 ) ) ( not ( = ?auto_313271 ?auto_313276 ) ) ( not ( = ?auto_313271 ?auto_313277 ) ) ( not ( = ?auto_313271 ?auto_313278 ) ) ( not ( = ?auto_313271 ?auto_313279 ) ) ( not ( = ?auto_313271 ?auto_313280 ) ) ( not ( = ?auto_313271 ?auto_313281 ) ) ( not ( = ?auto_313271 ?auto_313282 ) ) ( not ( = ?auto_313271 ?auto_313283 ) ) ( not ( = ?auto_313271 ?auto_313284 ) ) ( not ( = ?auto_313272 ?auto_313273 ) ) ( not ( = ?auto_313272 ?auto_313274 ) ) ( not ( = ?auto_313272 ?auto_313275 ) ) ( not ( = ?auto_313272 ?auto_313276 ) ) ( not ( = ?auto_313272 ?auto_313277 ) ) ( not ( = ?auto_313272 ?auto_313278 ) ) ( not ( = ?auto_313272 ?auto_313279 ) ) ( not ( = ?auto_313272 ?auto_313280 ) ) ( not ( = ?auto_313272 ?auto_313281 ) ) ( not ( = ?auto_313272 ?auto_313282 ) ) ( not ( = ?auto_313272 ?auto_313283 ) ) ( not ( = ?auto_313272 ?auto_313284 ) ) ( not ( = ?auto_313273 ?auto_313274 ) ) ( not ( = ?auto_313273 ?auto_313275 ) ) ( not ( = ?auto_313273 ?auto_313276 ) ) ( not ( = ?auto_313273 ?auto_313277 ) ) ( not ( = ?auto_313273 ?auto_313278 ) ) ( not ( = ?auto_313273 ?auto_313279 ) ) ( not ( = ?auto_313273 ?auto_313280 ) ) ( not ( = ?auto_313273 ?auto_313281 ) ) ( not ( = ?auto_313273 ?auto_313282 ) ) ( not ( = ?auto_313273 ?auto_313283 ) ) ( not ( = ?auto_313273 ?auto_313284 ) ) ( not ( = ?auto_313274 ?auto_313275 ) ) ( not ( = ?auto_313274 ?auto_313276 ) ) ( not ( = ?auto_313274 ?auto_313277 ) ) ( not ( = ?auto_313274 ?auto_313278 ) ) ( not ( = ?auto_313274 ?auto_313279 ) ) ( not ( = ?auto_313274 ?auto_313280 ) ) ( not ( = ?auto_313274 ?auto_313281 ) ) ( not ( = ?auto_313274 ?auto_313282 ) ) ( not ( = ?auto_313274 ?auto_313283 ) ) ( not ( = ?auto_313274 ?auto_313284 ) ) ( not ( = ?auto_313275 ?auto_313276 ) ) ( not ( = ?auto_313275 ?auto_313277 ) ) ( not ( = ?auto_313275 ?auto_313278 ) ) ( not ( = ?auto_313275 ?auto_313279 ) ) ( not ( = ?auto_313275 ?auto_313280 ) ) ( not ( = ?auto_313275 ?auto_313281 ) ) ( not ( = ?auto_313275 ?auto_313282 ) ) ( not ( = ?auto_313275 ?auto_313283 ) ) ( not ( = ?auto_313275 ?auto_313284 ) ) ( not ( = ?auto_313276 ?auto_313277 ) ) ( not ( = ?auto_313276 ?auto_313278 ) ) ( not ( = ?auto_313276 ?auto_313279 ) ) ( not ( = ?auto_313276 ?auto_313280 ) ) ( not ( = ?auto_313276 ?auto_313281 ) ) ( not ( = ?auto_313276 ?auto_313282 ) ) ( not ( = ?auto_313276 ?auto_313283 ) ) ( not ( = ?auto_313276 ?auto_313284 ) ) ( not ( = ?auto_313277 ?auto_313278 ) ) ( not ( = ?auto_313277 ?auto_313279 ) ) ( not ( = ?auto_313277 ?auto_313280 ) ) ( not ( = ?auto_313277 ?auto_313281 ) ) ( not ( = ?auto_313277 ?auto_313282 ) ) ( not ( = ?auto_313277 ?auto_313283 ) ) ( not ( = ?auto_313277 ?auto_313284 ) ) ( not ( = ?auto_313278 ?auto_313279 ) ) ( not ( = ?auto_313278 ?auto_313280 ) ) ( not ( = ?auto_313278 ?auto_313281 ) ) ( not ( = ?auto_313278 ?auto_313282 ) ) ( not ( = ?auto_313278 ?auto_313283 ) ) ( not ( = ?auto_313278 ?auto_313284 ) ) ( not ( = ?auto_313279 ?auto_313280 ) ) ( not ( = ?auto_313279 ?auto_313281 ) ) ( not ( = ?auto_313279 ?auto_313282 ) ) ( not ( = ?auto_313279 ?auto_313283 ) ) ( not ( = ?auto_313279 ?auto_313284 ) ) ( not ( = ?auto_313280 ?auto_313281 ) ) ( not ( = ?auto_313280 ?auto_313282 ) ) ( not ( = ?auto_313280 ?auto_313283 ) ) ( not ( = ?auto_313280 ?auto_313284 ) ) ( not ( = ?auto_313281 ?auto_313282 ) ) ( not ( = ?auto_313281 ?auto_313283 ) ) ( not ( = ?auto_313281 ?auto_313284 ) ) ( not ( = ?auto_313282 ?auto_313283 ) ) ( not ( = ?auto_313282 ?auto_313284 ) ) ( not ( = ?auto_313283 ?auto_313284 ) ) ( ON ?auto_313283 ?auto_313284 ) ( ON ?auto_313282 ?auto_313283 ) ( ON ?auto_313281 ?auto_313282 ) ( ON ?auto_313280 ?auto_313281 ) ( ON ?auto_313279 ?auto_313280 ) ( ON ?auto_313278 ?auto_313279 ) ( ON ?auto_313277 ?auto_313278 ) ( ON ?auto_313276 ?auto_313277 ) ( ON ?auto_313275 ?auto_313276 ) ( CLEAR ?auto_313273 ) ( ON ?auto_313274 ?auto_313275 ) ( CLEAR ?auto_313274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313271 ?auto_313272 ?auto_313273 ?auto_313274 )
      ( MAKE-14PILE ?auto_313271 ?auto_313272 ?auto_313273 ?auto_313274 ?auto_313275 ?auto_313276 ?auto_313277 ?auto_313278 ?auto_313279 ?auto_313280 ?auto_313281 ?auto_313282 ?auto_313283 ?auto_313284 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313299 - BLOCK
      ?auto_313300 - BLOCK
      ?auto_313301 - BLOCK
      ?auto_313302 - BLOCK
      ?auto_313303 - BLOCK
      ?auto_313304 - BLOCK
      ?auto_313305 - BLOCK
      ?auto_313306 - BLOCK
      ?auto_313307 - BLOCK
      ?auto_313308 - BLOCK
      ?auto_313309 - BLOCK
      ?auto_313310 - BLOCK
      ?auto_313311 - BLOCK
      ?auto_313312 - BLOCK
    )
    :vars
    (
      ?auto_313313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313312 ?auto_313313 ) ( ON-TABLE ?auto_313299 ) ( ON ?auto_313300 ?auto_313299 ) ( not ( = ?auto_313299 ?auto_313300 ) ) ( not ( = ?auto_313299 ?auto_313301 ) ) ( not ( = ?auto_313299 ?auto_313302 ) ) ( not ( = ?auto_313299 ?auto_313303 ) ) ( not ( = ?auto_313299 ?auto_313304 ) ) ( not ( = ?auto_313299 ?auto_313305 ) ) ( not ( = ?auto_313299 ?auto_313306 ) ) ( not ( = ?auto_313299 ?auto_313307 ) ) ( not ( = ?auto_313299 ?auto_313308 ) ) ( not ( = ?auto_313299 ?auto_313309 ) ) ( not ( = ?auto_313299 ?auto_313310 ) ) ( not ( = ?auto_313299 ?auto_313311 ) ) ( not ( = ?auto_313299 ?auto_313312 ) ) ( not ( = ?auto_313299 ?auto_313313 ) ) ( not ( = ?auto_313300 ?auto_313301 ) ) ( not ( = ?auto_313300 ?auto_313302 ) ) ( not ( = ?auto_313300 ?auto_313303 ) ) ( not ( = ?auto_313300 ?auto_313304 ) ) ( not ( = ?auto_313300 ?auto_313305 ) ) ( not ( = ?auto_313300 ?auto_313306 ) ) ( not ( = ?auto_313300 ?auto_313307 ) ) ( not ( = ?auto_313300 ?auto_313308 ) ) ( not ( = ?auto_313300 ?auto_313309 ) ) ( not ( = ?auto_313300 ?auto_313310 ) ) ( not ( = ?auto_313300 ?auto_313311 ) ) ( not ( = ?auto_313300 ?auto_313312 ) ) ( not ( = ?auto_313300 ?auto_313313 ) ) ( not ( = ?auto_313301 ?auto_313302 ) ) ( not ( = ?auto_313301 ?auto_313303 ) ) ( not ( = ?auto_313301 ?auto_313304 ) ) ( not ( = ?auto_313301 ?auto_313305 ) ) ( not ( = ?auto_313301 ?auto_313306 ) ) ( not ( = ?auto_313301 ?auto_313307 ) ) ( not ( = ?auto_313301 ?auto_313308 ) ) ( not ( = ?auto_313301 ?auto_313309 ) ) ( not ( = ?auto_313301 ?auto_313310 ) ) ( not ( = ?auto_313301 ?auto_313311 ) ) ( not ( = ?auto_313301 ?auto_313312 ) ) ( not ( = ?auto_313301 ?auto_313313 ) ) ( not ( = ?auto_313302 ?auto_313303 ) ) ( not ( = ?auto_313302 ?auto_313304 ) ) ( not ( = ?auto_313302 ?auto_313305 ) ) ( not ( = ?auto_313302 ?auto_313306 ) ) ( not ( = ?auto_313302 ?auto_313307 ) ) ( not ( = ?auto_313302 ?auto_313308 ) ) ( not ( = ?auto_313302 ?auto_313309 ) ) ( not ( = ?auto_313302 ?auto_313310 ) ) ( not ( = ?auto_313302 ?auto_313311 ) ) ( not ( = ?auto_313302 ?auto_313312 ) ) ( not ( = ?auto_313302 ?auto_313313 ) ) ( not ( = ?auto_313303 ?auto_313304 ) ) ( not ( = ?auto_313303 ?auto_313305 ) ) ( not ( = ?auto_313303 ?auto_313306 ) ) ( not ( = ?auto_313303 ?auto_313307 ) ) ( not ( = ?auto_313303 ?auto_313308 ) ) ( not ( = ?auto_313303 ?auto_313309 ) ) ( not ( = ?auto_313303 ?auto_313310 ) ) ( not ( = ?auto_313303 ?auto_313311 ) ) ( not ( = ?auto_313303 ?auto_313312 ) ) ( not ( = ?auto_313303 ?auto_313313 ) ) ( not ( = ?auto_313304 ?auto_313305 ) ) ( not ( = ?auto_313304 ?auto_313306 ) ) ( not ( = ?auto_313304 ?auto_313307 ) ) ( not ( = ?auto_313304 ?auto_313308 ) ) ( not ( = ?auto_313304 ?auto_313309 ) ) ( not ( = ?auto_313304 ?auto_313310 ) ) ( not ( = ?auto_313304 ?auto_313311 ) ) ( not ( = ?auto_313304 ?auto_313312 ) ) ( not ( = ?auto_313304 ?auto_313313 ) ) ( not ( = ?auto_313305 ?auto_313306 ) ) ( not ( = ?auto_313305 ?auto_313307 ) ) ( not ( = ?auto_313305 ?auto_313308 ) ) ( not ( = ?auto_313305 ?auto_313309 ) ) ( not ( = ?auto_313305 ?auto_313310 ) ) ( not ( = ?auto_313305 ?auto_313311 ) ) ( not ( = ?auto_313305 ?auto_313312 ) ) ( not ( = ?auto_313305 ?auto_313313 ) ) ( not ( = ?auto_313306 ?auto_313307 ) ) ( not ( = ?auto_313306 ?auto_313308 ) ) ( not ( = ?auto_313306 ?auto_313309 ) ) ( not ( = ?auto_313306 ?auto_313310 ) ) ( not ( = ?auto_313306 ?auto_313311 ) ) ( not ( = ?auto_313306 ?auto_313312 ) ) ( not ( = ?auto_313306 ?auto_313313 ) ) ( not ( = ?auto_313307 ?auto_313308 ) ) ( not ( = ?auto_313307 ?auto_313309 ) ) ( not ( = ?auto_313307 ?auto_313310 ) ) ( not ( = ?auto_313307 ?auto_313311 ) ) ( not ( = ?auto_313307 ?auto_313312 ) ) ( not ( = ?auto_313307 ?auto_313313 ) ) ( not ( = ?auto_313308 ?auto_313309 ) ) ( not ( = ?auto_313308 ?auto_313310 ) ) ( not ( = ?auto_313308 ?auto_313311 ) ) ( not ( = ?auto_313308 ?auto_313312 ) ) ( not ( = ?auto_313308 ?auto_313313 ) ) ( not ( = ?auto_313309 ?auto_313310 ) ) ( not ( = ?auto_313309 ?auto_313311 ) ) ( not ( = ?auto_313309 ?auto_313312 ) ) ( not ( = ?auto_313309 ?auto_313313 ) ) ( not ( = ?auto_313310 ?auto_313311 ) ) ( not ( = ?auto_313310 ?auto_313312 ) ) ( not ( = ?auto_313310 ?auto_313313 ) ) ( not ( = ?auto_313311 ?auto_313312 ) ) ( not ( = ?auto_313311 ?auto_313313 ) ) ( not ( = ?auto_313312 ?auto_313313 ) ) ( ON ?auto_313311 ?auto_313312 ) ( ON ?auto_313310 ?auto_313311 ) ( ON ?auto_313309 ?auto_313310 ) ( ON ?auto_313308 ?auto_313309 ) ( ON ?auto_313307 ?auto_313308 ) ( ON ?auto_313306 ?auto_313307 ) ( ON ?auto_313305 ?auto_313306 ) ( ON ?auto_313304 ?auto_313305 ) ( ON ?auto_313303 ?auto_313304 ) ( ON ?auto_313302 ?auto_313303 ) ( CLEAR ?auto_313300 ) ( ON ?auto_313301 ?auto_313302 ) ( CLEAR ?auto_313301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313299 ?auto_313300 ?auto_313301 )
      ( MAKE-14PILE ?auto_313299 ?auto_313300 ?auto_313301 ?auto_313302 ?auto_313303 ?auto_313304 ?auto_313305 ?auto_313306 ?auto_313307 ?auto_313308 ?auto_313309 ?auto_313310 ?auto_313311 ?auto_313312 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313328 - BLOCK
      ?auto_313329 - BLOCK
      ?auto_313330 - BLOCK
      ?auto_313331 - BLOCK
      ?auto_313332 - BLOCK
      ?auto_313333 - BLOCK
      ?auto_313334 - BLOCK
      ?auto_313335 - BLOCK
      ?auto_313336 - BLOCK
      ?auto_313337 - BLOCK
      ?auto_313338 - BLOCK
      ?auto_313339 - BLOCK
      ?auto_313340 - BLOCK
      ?auto_313341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313341 ) ( ON-TABLE ?auto_313328 ) ( ON ?auto_313329 ?auto_313328 ) ( not ( = ?auto_313328 ?auto_313329 ) ) ( not ( = ?auto_313328 ?auto_313330 ) ) ( not ( = ?auto_313328 ?auto_313331 ) ) ( not ( = ?auto_313328 ?auto_313332 ) ) ( not ( = ?auto_313328 ?auto_313333 ) ) ( not ( = ?auto_313328 ?auto_313334 ) ) ( not ( = ?auto_313328 ?auto_313335 ) ) ( not ( = ?auto_313328 ?auto_313336 ) ) ( not ( = ?auto_313328 ?auto_313337 ) ) ( not ( = ?auto_313328 ?auto_313338 ) ) ( not ( = ?auto_313328 ?auto_313339 ) ) ( not ( = ?auto_313328 ?auto_313340 ) ) ( not ( = ?auto_313328 ?auto_313341 ) ) ( not ( = ?auto_313329 ?auto_313330 ) ) ( not ( = ?auto_313329 ?auto_313331 ) ) ( not ( = ?auto_313329 ?auto_313332 ) ) ( not ( = ?auto_313329 ?auto_313333 ) ) ( not ( = ?auto_313329 ?auto_313334 ) ) ( not ( = ?auto_313329 ?auto_313335 ) ) ( not ( = ?auto_313329 ?auto_313336 ) ) ( not ( = ?auto_313329 ?auto_313337 ) ) ( not ( = ?auto_313329 ?auto_313338 ) ) ( not ( = ?auto_313329 ?auto_313339 ) ) ( not ( = ?auto_313329 ?auto_313340 ) ) ( not ( = ?auto_313329 ?auto_313341 ) ) ( not ( = ?auto_313330 ?auto_313331 ) ) ( not ( = ?auto_313330 ?auto_313332 ) ) ( not ( = ?auto_313330 ?auto_313333 ) ) ( not ( = ?auto_313330 ?auto_313334 ) ) ( not ( = ?auto_313330 ?auto_313335 ) ) ( not ( = ?auto_313330 ?auto_313336 ) ) ( not ( = ?auto_313330 ?auto_313337 ) ) ( not ( = ?auto_313330 ?auto_313338 ) ) ( not ( = ?auto_313330 ?auto_313339 ) ) ( not ( = ?auto_313330 ?auto_313340 ) ) ( not ( = ?auto_313330 ?auto_313341 ) ) ( not ( = ?auto_313331 ?auto_313332 ) ) ( not ( = ?auto_313331 ?auto_313333 ) ) ( not ( = ?auto_313331 ?auto_313334 ) ) ( not ( = ?auto_313331 ?auto_313335 ) ) ( not ( = ?auto_313331 ?auto_313336 ) ) ( not ( = ?auto_313331 ?auto_313337 ) ) ( not ( = ?auto_313331 ?auto_313338 ) ) ( not ( = ?auto_313331 ?auto_313339 ) ) ( not ( = ?auto_313331 ?auto_313340 ) ) ( not ( = ?auto_313331 ?auto_313341 ) ) ( not ( = ?auto_313332 ?auto_313333 ) ) ( not ( = ?auto_313332 ?auto_313334 ) ) ( not ( = ?auto_313332 ?auto_313335 ) ) ( not ( = ?auto_313332 ?auto_313336 ) ) ( not ( = ?auto_313332 ?auto_313337 ) ) ( not ( = ?auto_313332 ?auto_313338 ) ) ( not ( = ?auto_313332 ?auto_313339 ) ) ( not ( = ?auto_313332 ?auto_313340 ) ) ( not ( = ?auto_313332 ?auto_313341 ) ) ( not ( = ?auto_313333 ?auto_313334 ) ) ( not ( = ?auto_313333 ?auto_313335 ) ) ( not ( = ?auto_313333 ?auto_313336 ) ) ( not ( = ?auto_313333 ?auto_313337 ) ) ( not ( = ?auto_313333 ?auto_313338 ) ) ( not ( = ?auto_313333 ?auto_313339 ) ) ( not ( = ?auto_313333 ?auto_313340 ) ) ( not ( = ?auto_313333 ?auto_313341 ) ) ( not ( = ?auto_313334 ?auto_313335 ) ) ( not ( = ?auto_313334 ?auto_313336 ) ) ( not ( = ?auto_313334 ?auto_313337 ) ) ( not ( = ?auto_313334 ?auto_313338 ) ) ( not ( = ?auto_313334 ?auto_313339 ) ) ( not ( = ?auto_313334 ?auto_313340 ) ) ( not ( = ?auto_313334 ?auto_313341 ) ) ( not ( = ?auto_313335 ?auto_313336 ) ) ( not ( = ?auto_313335 ?auto_313337 ) ) ( not ( = ?auto_313335 ?auto_313338 ) ) ( not ( = ?auto_313335 ?auto_313339 ) ) ( not ( = ?auto_313335 ?auto_313340 ) ) ( not ( = ?auto_313335 ?auto_313341 ) ) ( not ( = ?auto_313336 ?auto_313337 ) ) ( not ( = ?auto_313336 ?auto_313338 ) ) ( not ( = ?auto_313336 ?auto_313339 ) ) ( not ( = ?auto_313336 ?auto_313340 ) ) ( not ( = ?auto_313336 ?auto_313341 ) ) ( not ( = ?auto_313337 ?auto_313338 ) ) ( not ( = ?auto_313337 ?auto_313339 ) ) ( not ( = ?auto_313337 ?auto_313340 ) ) ( not ( = ?auto_313337 ?auto_313341 ) ) ( not ( = ?auto_313338 ?auto_313339 ) ) ( not ( = ?auto_313338 ?auto_313340 ) ) ( not ( = ?auto_313338 ?auto_313341 ) ) ( not ( = ?auto_313339 ?auto_313340 ) ) ( not ( = ?auto_313339 ?auto_313341 ) ) ( not ( = ?auto_313340 ?auto_313341 ) ) ( ON ?auto_313340 ?auto_313341 ) ( ON ?auto_313339 ?auto_313340 ) ( ON ?auto_313338 ?auto_313339 ) ( ON ?auto_313337 ?auto_313338 ) ( ON ?auto_313336 ?auto_313337 ) ( ON ?auto_313335 ?auto_313336 ) ( ON ?auto_313334 ?auto_313335 ) ( ON ?auto_313333 ?auto_313334 ) ( ON ?auto_313332 ?auto_313333 ) ( ON ?auto_313331 ?auto_313332 ) ( CLEAR ?auto_313329 ) ( ON ?auto_313330 ?auto_313331 ) ( CLEAR ?auto_313330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313328 ?auto_313329 ?auto_313330 )
      ( MAKE-14PILE ?auto_313328 ?auto_313329 ?auto_313330 ?auto_313331 ?auto_313332 ?auto_313333 ?auto_313334 ?auto_313335 ?auto_313336 ?auto_313337 ?auto_313338 ?auto_313339 ?auto_313340 ?auto_313341 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313356 - BLOCK
      ?auto_313357 - BLOCK
      ?auto_313358 - BLOCK
      ?auto_313359 - BLOCK
      ?auto_313360 - BLOCK
      ?auto_313361 - BLOCK
      ?auto_313362 - BLOCK
      ?auto_313363 - BLOCK
      ?auto_313364 - BLOCK
      ?auto_313365 - BLOCK
      ?auto_313366 - BLOCK
      ?auto_313367 - BLOCK
      ?auto_313368 - BLOCK
      ?auto_313369 - BLOCK
    )
    :vars
    (
      ?auto_313370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313369 ?auto_313370 ) ( ON-TABLE ?auto_313356 ) ( not ( = ?auto_313356 ?auto_313357 ) ) ( not ( = ?auto_313356 ?auto_313358 ) ) ( not ( = ?auto_313356 ?auto_313359 ) ) ( not ( = ?auto_313356 ?auto_313360 ) ) ( not ( = ?auto_313356 ?auto_313361 ) ) ( not ( = ?auto_313356 ?auto_313362 ) ) ( not ( = ?auto_313356 ?auto_313363 ) ) ( not ( = ?auto_313356 ?auto_313364 ) ) ( not ( = ?auto_313356 ?auto_313365 ) ) ( not ( = ?auto_313356 ?auto_313366 ) ) ( not ( = ?auto_313356 ?auto_313367 ) ) ( not ( = ?auto_313356 ?auto_313368 ) ) ( not ( = ?auto_313356 ?auto_313369 ) ) ( not ( = ?auto_313356 ?auto_313370 ) ) ( not ( = ?auto_313357 ?auto_313358 ) ) ( not ( = ?auto_313357 ?auto_313359 ) ) ( not ( = ?auto_313357 ?auto_313360 ) ) ( not ( = ?auto_313357 ?auto_313361 ) ) ( not ( = ?auto_313357 ?auto_313362 ) ) ( not ( = ?auto_313357 ?auto_313363 ) ) ( not ( = ?auto_313357 ?auto_313364 ) ) ( not ( = ?auto_313357 ?auto_313365 ) ) ( not ( = ?auto_313357 ?auto_313366 ) ) ( not ( = ?auto_313357 ?auto_313367 ) ) ( not ( = ?auto_313357 ?auto_313368 ) ) ( not ( = ?auto_313357 ?auto_313369 ) ) ( not ( = ?auto_313357 ?auto_313370 ) ) ( not ( = ?auto_313358 ?auto_313359 ) ) ( not ( = ?auto_313358 ?auto_313360 ) ) ( not ( = ?auto_313358 ?auto_313361 ) ) ( not ( = ?auto_313358 ?auto_313362 ) ) ( not ( = ?auto_313358 ?auto_313363 ) ) ( not ( = ?auto_313358 ?auto_313364 ) ) ( not ( = ?auto_313358 ?auto_313365 ) ) ( not ( = ?auto_313358 ?auto_313366 ) ) ( not ( = ?auto_313358 ?auto_313367 ) ) ( not ( = ?auto_313358 ?auto_313368 ) ) ( not ( = ?auto_313358 ?auto_313369 ) ) ( not ( = ?auto_313358 ?auto_313370 ) ) ( not ( = ?auto_313359 ?auto_313360 ) ) ( not ( = ?auto_313359 ?auto_313361 ) ) ( not ( = ?auto_313359 ?auto_313362 ) ) ( not ( = ?auto_313359 ?auto_313363 ) ) ( not ( = ?auto_313359 ?auto_313364 ) ) ( not ( = ?auto_313359 ?auto_313365 ) ) ( not ( = ?auto_313359 ?auto_313366 ) ) ( not ( = ?auto_313359 ?auto_313367 ) ) ( not ( = ?auto_313359 ?auto_313368 ) ) ( not ( = ?auto_313359 ?auto_313369 ) ) ( not ( = ?auto_313359 ?auto_313370 ) ) ( not ( = ?auto_313360 ?auto_313361 ) ) ( not ( = ?auto_313360 ?auto_313362 ) ) ( not ( = ?auto_313360 ?auto_313363 ) ) ( not ( = ?auto_313360 ?auto_313364 ) ) ( not ( = ?auto_313360 ?auto_313365 ) ) ( not ( = ?auto_313360 ?auto_313366 ) ) ( not ( = ?auto_313360 ?auto_313367 ) ) ( not ( = ?auto_313360 ?auto_313368 ) ) ( not ( = ?auto_313360 ?auto_313369 ) ) ( not ( = ?auto_313360 ?auto_313370 ) ) ( not ( = ?auto_313361 ?auto_313362 ) ) ( not ( = ?auto_313361 ?auto_313363 ) ) ( not ( = ?auto_313361 ?auto_313364 ) ) ( not ( = ?auto_313361 ?auto_313365 ) ) ( not ( = ?auto_313361 ?auto_313366 ) ) ( not ( = ?auto_313361 ?auto_313367 ) ) ( not ( = ?auto_313361 ?auto_313368 ) ) ( not ( = ?auto_313361 ?auto_313369 ) ) ( not ( = ?auto_313361 ?auto_313370 ) ) ( not ( = ?auto_313362 ?auto_313363 ) ) ( not ( = ?auto_313362 ?auto_313364 ) ) ( not ( = ?auto_313362 ?auto_313365 ) ) ( not ( = ?auto_313362 ?auto_313366 ) ) ( not ( = ?auto_313362 ?auto_313367 ) ) ( not ( = ?auto_313362 ?auto_313368 ) ) ( not ( = ?auto_313362 ?auto_313369 ) ) ( not ( = ?auto_313362 ?auto_313370 ) ) ( not ( = ?auto_313363 ?auto_313364 ) ) ( not ( = ?auto_313363 ?auto_313365 ) ) ( not ( = ?auto_313363 ?auto_313366 ) ) ( not ( = ?auto_313363 ?auto_313367 ) ) ( not ( = ?auto_313363 ?auto_313368 ) ) ( not ( = ?auto_313363 ?auto_313369 ) ) ( not ( = ?auto_313363 ?auto_313370 ) ) ( not ( = ?auto_313364 ?auto_313365 ) ) ( not ( = ?auto_313364 ?auto_313366 ) ) ( not ( = ?auto_313364 ?auto_313367 ) ) ( not ( = ?auto_313364 ?auto_313368 ) ) ( not ( = ?auto_313364 ?auto_313369 ) ) ( not ( = ?auto_313364 ?auto_313370 ) ) ( not ( = ?auto_313365 ?auto_313366 ) ) ( not ( = ?auto_313365 ?auto_313367 ) ) ( not ( = ?auto_313365 ?auto_313368 ) ) ( not ( = ?auto_313365 ?auto_313369 ) ) ( not ( = ?auto_313365 ?auto_313370 ) ) ( not ( = ?auto_313366 ?auto_313367 ) ) ( not ( = ?auto_313366 ?auto_313368 ) ) ( not ( = ?auto_313366 ?auto_313369 ) ) ( not ( = ?auto_313366 ?auto_313370 ) ) ( not ( = ?auto_313367 ?auto_313368 ) ) ( not ( = ?auto_313367 ?auto_313369 ) ) ( not ( = ?auto_313367 ?auto_313370 ) ) ( not ( = ?auto_313368 ?auto_313369 ) ) ( not ( = ?auto_313368 ?auto_313370 ) ) ( not ( = ?auto_313369 ?auto_313370 ) ) ( ON ?auto_313368 ?auto_313369 ) ( ON ?auto_313367 ?auto_313368 ) ( ON ?auto_313366 ?auto_313367 ) ( ON ?auto_313365 ?auto_313366 ) ( ON ?auto_313364 ?auto_313365 ) ( ON ?auto_313363 ?auto_313364 ) ( ON ?auto_313362 ?auto_313363 ) ( ON ?auto_313361 ?auto_313362 ) ( ON ?auto_313360 ?auto_313361 ) ( ON ?auto_313359 ?auto_313360 ) ( ON ?auto_313358 ?auto_313359 ) ( CLEAR ?auto_313356 ) ( ON ?auto_313357 ?auto_313358 ) ( CLEAR ?auto_313357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313356 ?auto_313357 )
      ( MAKE-14PILE ?auto_313356 ?auto_313357 ?auto_313358 ?auto_313359 ?auto_313360 ?auto_313361 ?auto_313362 ?auto_313363 ?auto_313364 ?auto_313365 ?auto_313366 ?auto_313367 ?auto_313368 ?auto_313369 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313385 - BLOCK
      ?auto_313386 - BLOCK
      ?auto_313387 - BLOCK
      ?auto_313388 - BLOCK
      ?auto_313389 - BLOCK
      ?auto_313390 - BLOCK
      ?auto_313391 - BLOCK
      ?auto_313392 - BLOCK
      ?auto_313393 - BLOCK
      ?auto_313394 - BLOCK
      ?auto_313395 - BLOCK
      ?auto_313396 - BLOCK
      ?auto_313397 - BLOCK
      ?auto_313398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313398 ) ( ON-TABLE ?auto_313385 ) ( not ( = ?auto_313385 ?auto_313386 ) ) ( not ( = ?auto_313385 ?auto_313387 ) ) ( not ( = ?auto_313385 ?auto_313388 ) ) ( not ( = ?auto_313385 ?auto_313389 ) ) ( not ( = ?auto_313385 ?auto_313390 ) ) ( not ( = ?auto_313385 ?auto_313391 ) ) ( not ( = ?auto_313385 ?auto_313392 ) ) ( not ( = ?auto_313385 ?auto_313393 ) ) ( not ( = ?auto_313385 ?auto_313394 ) ) ( not ( = ?auto_313385 ?auto_313395 ) ) ( not ( = ?auto_313385 ?auto_313396 ) ) ( not ( = ?auto_313385 ?auto_313397 ) ) ( not ( = ?auto_313385 ?auto_313398 ) ) ( not ( = ?auto_313386 ?auto_313387 ) ) ( not ( = ?auto_313386 ?auto_313388 ) ) ( not ( = ?auto_313386 ?auto_313389 ) ) ( not ( = ?auto_313386 ?auto_313390 ) ) ( not ( = ?auto_313386 ?auto_313391 ) ) ( not ( = ?auto_313386 ?auto_313392 ) ) ( not ( = ?auto_313386 ?auto_313393 ) ) ( not ( = ?auto_313386 ?auto_313394 ) ) ( not ( = ?auto_313386 ?auto_313395 ) ) ( not ( = ?auto_313386 ?auto_313396 ) ) ( not ( = ?auto_313386 ?auto_313397 ) ) ( not ( = ?auto_313386 ?auto_313398 ) ) ( not ( = ?auto_313387 ?auto_313388 ) ) ( not ( = ?auto_313387 ?auto_313389 ) ) ( not ( = ?auto_313387 ?auto_313390 ) ) ( not ( = ?auto_313387 ?auto_313391 ) ) ( not ( = ?auto_313387 ?auto_313392 ) ) ( not ( = ?auto_313387 ?auto_313393 ) ) ( not ( = ?auto_313387 ?auto_313394 ) ) ( not ( = ?auto_313387 ?auto_313395 ) ) ( not ( = ?auto_313387 ?auto_313396 ) ) ( not ( = ?auto_313387 ?auto_313397 ) ) ( not ( = ?auto_313387 ?auto_313398 ) ) ( not ( = ?auto_313388 ?auto_313389 ) ) ( not ( = ?auto_313388 ?auto_313390 ) ) ( not ( = ?auto_313388 ?auto_313391 ) ) ( not ( = ?auto_313388 ?auto_313392 ) ) ( not ( = ?auto_313388 ?auto_313393 ) ) ( not ( = ?auto_313388 ?auto_313394 ) ) ( not ( = ?auto_313388 ?auto_313395 ) ) ( not ( = ?auto_313388 ?auto_313396 ) ) ( not ( = ?auto_313388 ?auto_313397 ) ) ( not ( = ?auto_313388 ?auto_313398 ) ) ( not ( = ?auto_313389 ?auto_313390 ) ) ( not ( = ?auto_313389 ?auto_313391 ) ) ( not ( = ?auto_313389 ?auto_313392 ) ) ( not ( = ?auto_313389 ?auto_313393 ) ) ( not ( = ?auto_313389 ?auto_313394 ) ) ( not ( = ?auto_313389 ?auto_313395 ) ) ( not ( = ?auto_313389 ?auto_313396 ) ) ( not ( = ?auto_313389 ?auto_313397 ) ) ( not ( = ?auto_313389 ?auto_313398 ) ) ( not ( = ?auto_313390 ?auto_313391 ) ) ( not ( = ?auto_313390 ?auto_313392 ) ) ( not ( = ?auto_313390 ?auto_313393 ) ) ( not ( = ?auto_313390 ?auto_313394 ) ) ( not ( = ?auto_313390 ?auto_313395 ) ) ( not ( = ?auto_313390 ?auto_313396 ) ) ( not ( = ?auto_313390 ?auto_313397 ) ) ( not ( = ?auto_313390 ?auto_313398 ) ) ( not ( = ?auto_313391 ?auto_313392 ) ) ( not ( = ?auto_313391 ?auto_313393 ) ) ( not ( = ?auto_313391 ?auto_313394 ) ) ( not ( = ?auto_313391 ?auto_313395 ) ) ( not ( = ?auto_313391 ?auto_313396 ) ) ( not ( = ?auto_313391 ?auto_313397 ) ) ( not ( = ?auto_313391 ?auto_313398 ) ) ( not ( = ?auto_313392 ?auto_313393 ) ) ( not ( = ?auto_313392 ?auto_313394 ) ) ( not ( = ?auto_313392 ?auto_313395 ) ) ( not ( = ?auto_313392 ?auto_313396 ) ) ( not ( = ?auto_313392 ?auto_313397 ) ) ( not ( = ?auto_313392 ?auto_313398 ) ) ( not ( = ?auto_313393 ?auto_313394 ) ) ( not ( = ?auto_313393 ?auto_313395 ) ) ( not ( = ?auto_313393 ?auto_313396 ) ) ( not ( = ?auto_313393 ?auto_313397 ) ) ( not ( = ?auto_313393 ?auto_313398 ) ) ( not ( = ?auto_313394 ?auto_313395 ) ) ( not ( = ?auto_313394 ?auto_313396 ) ) ( not ( = ?auto_313394 ?auto_313397 ) ) ( not ( = ?auto_313394 ?auto_313398 ) ) ( not ( = ?auto_313395 ?auto_313396 ) ) ( not ( = ?auto_313395 ?auto_313397 ) ) ( not ( = ?auto_313395 ?auto_313398 ) ) ( not ( = ?auto_313396 ?auto_313397 ) ) ( not ( = ?auto_313396 ?auto_313398 ) ) ( not ( = ?auto_313397 ?auto_313398 ) ) ( ON ?auto_313397 ?auto_313398 ) ( ON ?auto_313396 ?auto_313397 ) ( ON ?auto_313395 ?auto_313396 ) ( ON ?auto_313394 ?auto_313395 ) ( ON ?auto_313393 ?auto_313394 ) ( ON ?auto_313392 ?auto_313393 ) ( ON ?auto_313391 ?auto_313392 ) ( ON ?auto_313390 ?auto_313391 ) ( ON ?auto_313389 ?auto_313390 ) ( ON ?auto_313388 ?auto_313389 ) ( ON ?auto_313387 ?auto_313388 ) ( CLEAR ?auto_313385 ) ( ON ?auto_313386 ?auto_313387 ) ( CLEAR ?auto_313386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313385 ?auto_313386 )
      ( MAKE-14PILE ?auto_313385 ?auto_313386 ?auto_313387 ?auto_313388 ?auto_313389 ?auto_313390 ?auto_313391 ?auto_313392 ?auto_313393 ?auto_313394 ?auto_313395 ?auto_313396 ?auto_313397 ?auto_313398 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313413 - BLOCK
      ?auto_313414 - BLOCK
      ?auto_313415 - BLOCK
      ?auto_313416 - BLOCK
      ?auto_313417 - BLOCK
      ?auto_313418 - BLOCK
      ?auto_313419 - BLOCK
      ?auto_313420 - BLOCK
      ?auto_313421 - BLOCK
      ?auto_313422 - BLOCK
      ?auto_313423 - BLOCK
      ?auto_313424 - BLOCK
      ?auto_313425 - BLOCK
      ?auto_313426 - BLOCK
    )
    :vars
    (
      ?auto_313427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313426 ?auto_313427 ) ( not ( = ?auto_313413 ?auto_313414 ) ) ( not ( = ?auto_313413 ?auto_313415 ) ) ( not ( = ?auto_313413 ?auto_313416 ) ) ( not ( = ?auto_313413 ?auto_313417 ) ) ( not ( = ?auto_313413 ?auto_313418 ) ) ( not ( = ?auto_313413 ?auto_313419 ) ) ( not ( = ?auto_313413 ?auto_313420 ) ) ( not ( = ?auto_313413 ?auto_313421 ) ) ( not ( = ?auto_313413 ?auto_313422 ) ) ( not ( = ?auto_313413 ?auto_313423 ) ) ( not ( = ?auto_313413 ?auto_313424 ) ) ( not ( = ?auto_313413 ?auto_313425 ) ) ( not ( = ?auto_313413 ?auto_313426 ) ) ( not ( = ?auto_313413 ?auto_313427 ) ) ( not ( = ?auto_313414 ?auto_313415 ) ) ( not ( = ?auto_313414 ?auto_313416 ) ) ( not ( = ?auto_313414 ?auto_313417 ) ) ( not ( = ?auto_313414 ?auto_313418 ) ) ( not ( = ?auto_313414 ?auto_313419 ) ) ( not ( = ?auto_313414 ?auto_313420 ) ) ( not ( = ?auto_313414 ?auto_313421 ) ) ( not ( = ?auto_313414 ?auto_313422 ) ) ( not ( = ?auto_313414 ?auto_313423 ) ) ( not ( = ?auto_313414 ?auto_313424 ) ) ( not ( = ?auto_313414 ?auto_313425 ) ) ( not ( = ?auto_313414 ?auto_313426 ) ) ( not ( = ?auto_313414 ?auto_313427 ) ) ( not ( = ?auto_313415 ?auto_313416 ) ) ( not ( = ?auto_313415 ?auto_313417 ) ) ( not ( = ?auto_313415 ?auto_313418 ) ) ( not ( = ?auto_313415 ?auto_313419 ) ) ( not ( = ?auto_313415 ?auto_313420 ) ) ( not ( = ?auto_313415 ?auto_313421 ) ) ( not ( = ?auto_313415 ?auto_313422 ) ) ( not ( = ?auto_313415 ?auto_313423 ) ) ( not ( = ?auto_313415 ?auto_313424 ) ) ( not ( = ?auto_313415 ?auto_313425 ) ) ( not ( = ?auto_313415 ?auto_313426 ) ) ( not ( = ?auto_313415 ?auto_313427 ) ) ( not ( = ?auto_313416 ?auto_313417 ) ) ( not ( = ?auto_313416 ?auto_313418 ) ) ( not ( = ?auto_313416 ?auto_313419 ) ) ( not ( = ?auto_313416 ?auto_313420 ) ) ( not ( = ?auto_313416 ?auto_313421 ) ) ( not ( = ?auto_313416 ?auto_313422 ) ) ( not ( = ?auto_313416 ?auto_313423 ) ) ( not ( = ?auto_313416 ?auto_313424 ) ) ( not ( = ?auto_313416 ?auto_313425 ) ) ( not ( = ?auto_313416 ?auto_313426 ) ) ( not ( = ?auto_313416 ?auto_313427 ) ) ( not ( = ?auto_313417 ?auto_313418 ) ) ( not ( = ?auto_313417 ?auto_313419 ) ) ( not ( = ?auto_313417 ?auto_313420 ) ) ( not ( = ?auto_313417 ?auto_313421 ) ) ( not ( = ?auto_313417 ?auto_313422 ) ) ( not ( = ?auto_313417 ?auto_313423 ) ) ( not ( = ?auto_313417 ?auto_313424 ) ) ( not ( = ?auto_313417 ?auto_313425 ) ) ( not ( = ?auto_313417 ?auto_313426 ) ) ( not ( = ?auto_313417 ?auto_313427 ) ) ( not ( = ?auto_313418 ?auto_313419 ) ) ( not ( = ?auto_313418 ?auto_313420 ) ) ( not ( = ?auto_313418 ?auto_313421 ) ) ( not ( = ?auto_313418 ?auto_313422 ) ) ( not ( = ?auto_313418 ?auto_313423 ) ) ( not ( = ?auto_313418 ?auto_313424 ) ) ( not ( = ?auto_313418 ?auto_313425 ) ) ( not ( = ?auto_313418 ?auto_313426 ) ) ( not ( = ?auto_313418 ?auto_313427 ) ) ( not ( = ?auto_313419 ?auto_313420 ) ) ( not ( = ?auto_313419 ?auto_313421 ) ) ( not ( = ?auto_313419 ?auto_313422 ) ) ( not ( = ?auto_313419 ?auto_313423 ) ) ( not ( = ?auto_313419 ?auto_313424 ) ) ( not ( = ?auto_313419 ?auto_313425 ) ) ( not ( = ?auto_313419 ?auto_313426 ) ) ( not ( = ?auto_313419 ?auto_313427 ) ) ( not ( = ?auto_313420 ?auto_313421 ) ) ( not ( = ?auto_313420 ?auto_313422 ) ) ( not ( = ?auto_313420 ?auto_313423 ) ) ( not ( = ?auto_313420 ?auto_313424 ) ) ( not ( = ?auto_313420 ?auto_313425 ) ) ( not ( = ?auto_313420 ?auto_313426 ) ) ( not ( = ?auto_313420 ?auto_313427 ) ) ( not ( = ?auto_313421 ?auto_313422 ) ) ( not ( = ?auto_313421 ?auto_313423 ) ) ( not ( = ?auto_313421 ?auto_313424 ) ) ( not ( = ?auto_313421 ?auto_313425 ) ) ( not ( = ?auto_313421 ?auto_313426 ) ) ( not ( = ?auto_313421 ?auto_313427 ) ) ( not ( = ?auto_313422 ?auto_313423 ) ) ( not ( = ?auto_313422 ?auto_313424 ) ) ( not ( = ?auto_313422 ?auto_313425 ) ) ( not ( = ?auto_313422 ?auto_313426 ) ) ( not ( = ?auto_313422 ?auto_313427 ) ) ( not ( = ?auto_313423 ?auto_313424 ) ) ( not ( = ?auto_313423 ?auto_313425 ) ) ( not ( = ?auto_313423 ?auto_313426 ) ) ( not ( = ?auto_313423 ?auto_313427 ) ) ( not ( = ?auto_313424 ?auto_313425 ) ) ( not ( = ?auto_313424 ?auto_313426 ) ) ( not ( = ?auto_313424 ?auto_313427 ) ) ( not ( = ?auto_313425 ?auto_313426 ) ) ( not ( = ?auto_313425 ?auto_313427 ) ) ( not ( = ?auto_313426 ?auto_313427 ) ) ( ON ?auto_313425 ?auto_313426 ) ( ON ?auto_313424 ?auto_313425 ) ( ON ?auto_313423 ?auto_313424 ) ( ON ?auto_313422 ?auto_313423 ) ( ON ?auto_313421 ?auto_313422 ) ( ON ?auto_313420 ?auto_313421 ) ( ON ?auto_313419 ?auto_313420 ) ( ON ?auto_313418 ?auto_313419 ) ( ON ?auto_313417 ?auto_313418 ) ( ON ?auto_313416 ?auto_313417 ) ( ON ?auto_313415 ?auto_313416 ) ( ON ?auto_313414 ?auto_313415 ) ( ON ?auto_313413 ?auto_313414 ) ( CLEAR ?auto_313413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313413 )
      ( MAKE-14PILE ?auto_313413 ?auto_313414 ?auto_313415 ?auto_313416 ?auto_313417 ?auto_313418 ?auto_313419 ?auto_313420 ?auto_313421 ?auto_313422 ?auto_313423 ?auto_313424 ?auto_313425 ?auto_313426 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313442 - BLOCK
      ?auto_313443 - BLOCK
      ?auto_313444 - BLOCK
      ?auto_313445 - BLOCK
      ?auto_313446 - BLOCK
      ?auto_313447 - BLOCK
      ?auto_313448 - BLOCK
      ?auto_313449 - BLOCK
      ?auto_313450 - BLOCK
      ?auto_313451 - BLOCK
      ?auto_313452 - BLOCK
      ?auto_313453 - BLOCK
      ?auto_313454 - BLOCK
      ?auto_313455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313455 ) ( not ( = ?auto_313442 ?auto_313443 ) ) ( not ( = ?auto_313442 ?auto_313444 ) ) ( not ( = ?auto_313442 ?auto_313445 ) ) ( not ( = ?auto_313442 ?auto_313446 ) ) ( not ( = ?auto_313442 ?auto_313447 ) ) ( not ( = ?auto_313442 ?auto_313448 ) ) ( not ( = ?auto_313442 ?auto_313449 ) ) ( not ( = ?auto_313442 ?auto_313450 ) ) ( not ( = ?auto_313442 ?auto_313451 ) ) ( not ( = ?auto_313442 ?auto_313452 ) ) ( not ( = ?auto_313442 ?auto_313453 ) ) ( not ( = ?auto_313442 ?auto_313454 ) ) ( not ( = ?auto_313442 ?auto_313455 ) ) ( not ( = ?auto_313443 ?auto_313444 ) ) ( not ( = ?auto_313443 ?auto_313445 ) ) ( not ( = ?auto_313443 ?auto_313446 ) ) ( not ( = ?auto_313443 ?auto_313447 ) ) ( not ( = ?auto_313443 ?auto_313448 ) ) ( not ( = ?auto_313443 ?auto_313449 ) ) ( not ( = ?auto_313443 ?auto_313450 ) ) ( not ( = ?auto_313443 ?auto_313451 ) ) ( not ( = ?auto_313443 ?auto_313452 ) ) ( not ( = ?auto_313443 ?auto_313453 ) ) ( not ( = ?auto_313443 ?auto_313454 ) ) ( not ( = ?auto_313443 ?auto_313455 ) ) ( not ( = ?auto_313444 ?auto_313445 ) ) ( not ( = ?auto_313444 ?auto_313446 ) ) ( not ( = ?auto_313444 ?auto_313447 ) ) ( not ( = ?auto_313444 ?auto_313448 ) ) ( not ( = ?auto_313444 ?auto_313449 ) ) ( not ( = ?auto_313444 ?auto_313450 ) ) ( not ( = ?auto_313444 ?auto_313451 ) ) ( not ( = ?auto_313444 ?auto_313452 ) ) ( not ( = ?auto_313444 ?auto_313453 ) ) ( not ( = ?auto_313444 ?auto_313454 ) ) ( not ( = ?auto_313444 ?auto_313455 ) ) ( not ( = ?auto_313445 ?auto_313446 ) ) ( not ( = ?auto_313445 ?auto_313447 ) ) ( not ( = ?auto_313445 ?auto_313448 ) ) ( not ( = ?auto_313445 ?auto_313449 ) ) ( not ( = ?auto_313445 ?auto_313450 ) ) ( not ( = ?auto_313445 ?auto_313451 ) ) ( not ( = ?auto_313445 ?auto_313452 ) ) ( not ( = ?auto_313445 ?auto_313453 ) ) ( not ( = ?auto_313445 ?auto_313454 ) ) ( not ( = ?auto_313445 ?auto_313455 ) ) ( not ( = ?auto_313446 ?auto_313447 ) ) ( not ( = ?auto_313446 ?auto_313448 ) ) ( not ( = ?auto_313446 ?auto_313449 ) ) ( not ( = ?auto_313446 ?auto_313450 ) ) ( not ( = ?auto_313446 ?auto_313451 ) ) ( not ( = ?auto_313446 ?auto_313452 ) ) ( not ( = ?auto_313446 ?auto_313453 ) ) ( not ( = ?auto_313446 ?auto_313454 ) ) ( not ( = ?auto_313446 ?auto_313455 ) ) ( not ( = ?auto_313447 ?auto_313448 ) ) ( not ( = ?auto_313447 ?auto_313449 ) ) ( not ( = ?auto_313447 ?auto_313450 ) ) ( not ( = ?auto_313447 ?auto_313451 ) ) ( not ( = ?auto_313447 ?auto_313452 ) ) ( not ( = ?auto_313447 ?auto_313453 ) ) ( not ( = ?auto_313447 ?auto_313454 ) ) ( not ( = ?auto_313447 ?auto_313455 ) ) ( not ( = ?auto_313448 ?auto_313449 ) ) ( not ( = ?auto_313448 ?auto_313450 ) ) ( not ( = ?auto_313448 ?auto_313451 ) ) ( not ( = ?auto_313448 ?auto_313452 ) ) ( not ( = ?auto_313448 ?auto_313453 ) ) ( not ( = ?auto_313448 ?auto_313454 ) ) ( not ( = ?auto_313448 ?auto_313455 ) ) ( not ( = ?auto_313449 ?auto_313450 ) ) ( not ( = ?auto_313449 ?auto_313451 ) ) ( not ( = ?auto_313449 ?auto_313452 ) ) ( not ( = ?auto_313449 ?auto_313453 ) ) ( not ( = ?auto_313449 ?auto_313454 ) ) ( not ( = ?auto_313449 ?auto_313455 ) ) ( not ( = ?auto_313450 ?auto_313451 ) ) ( not ( = ?auto_313450 ?auto_313452 ) ) ( not ( = ?auto_313450 ?auto_313453 ) ) ( not ( = ?auto_313450 ?auto_313454 ) ) ( not ( = ?auto_313450 ?auto_313455 ) ) ( not ( = ?auto_313451 ?auto_313452 ) ) ( not ( = ?auto_313451 ?auto_313453 ) ) ( not ( = ?auto_313451 ?auto_313454 ) ) ( not ( = ?auto_313451 ?auto_313455 ) ) ( not ( = ?auto_313452 ?auto_313453 ) ) ( not ( = ?auto_313452 ?auto_313454 ) ) ( not ( = ?auto_313452 ?auto_313455 ) ) ( not ( = ?auto_313453 ?auto_313454 ) ) ( not ( = ?auto_313453 ?auto_313455 ) ) ( not ( = ?auto_313454 ?auto_313455 ) ) ( ON ?auto_313454 ?auto_313455 ) ( ON ?auto_313453 ?auto_313454 ) ( ON ?auto_313452 ?auto_313453 ) ( ON ?auto_313451 ?auto_313452 ) ( ON ?auto_313450 ?auto_313451 ) ( ON ?auto_313449 ?auto_313450 ) ( ON ?auto_313448 ?auto_313449 ) ( ON ?auto_313447 ?auto_313448 ) ( ON ?auto_313446 ?auto_313447 ) ( ON ?auto_313445 ?auto_313446 ) ( ON ?auto_313444 ?auto_313445 ) ( ON ?auto_313443 ?auto_313444 ) ( ON ?auto_313442 ?auto_313443 ) ( CLEAR ?auto_313442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313442 )
      ( MAKE-14PILE ?auto_313442 ?auto_313443 ?auto_313444 ?auto_313445 ?auto_313446 ?auto_313447 ?auto_313448 ?auto_313449 ?auto_313450 ?auto_313451 ?auto_313452 ?auto_313453 ?auto_313454 ?auto_313455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_313470 - BLOCK
      ?auto_313471 - BLOCK
      ?auto_313472 - BLOCK
      ?auto_313473 - BLOCK
      ?auto_313474 - BLOCK
      ?auto_313475 - BLOCK
      ?auto_313476 - BLOCK
      ?auto_313477 - BLOCK
      ?auto_313478 - BLOCK
      ?auto_313479 - BLOCK
      ?auto_313480 - BLOCK
      ?auto_313481 - BLOCK
      ?auto_313482 - BLOCK
      ?auto_313483 - BLOCK
    )
    :vars
    (
      ?auto_313484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_313470 ?auto_313471 ) ) ( not ( = ?auto_313470 ?auto_313472 ) ) ( not ( = ?auto_313470 ?auto_313473 ) ) ( not ( = ?auto_313470 ?auto_313474 ) ) ( not ( = ?auto_313470 ?auto_313475 ) ) ( not ( = ?auto_313470 ?auto_313476 ) ) ( not ( = ?auto_313470 ?auto_313477 ) ) ( not ( = ?auto_313470 ?auto_313478 ) ) ( not ( = ?auto_313470 ?auto_313479 ) ) ( not ( = ?auto_313470 ?auto_313480 ) ) ( not ( = ?auto_313470 ?auto_313481 ) ) ( not ( = ?auto_313470 ?auto_313482 ) ) ( not ( = ?auto_313470 ?auto_313483 ) ) ( not ( = ?auto_313471 ?auto_313472 ) ) ( not ( = ?auto_313471 ?auto_313473 ) ) ( not ( = ?auto_313471 ?auto_313474 ) ) ( not ( = ?auto_313471 ?auto_313475 ) ) ( not ( = ?auto_313471 ?auto_313476 ) ) ( not ( = ?auto_313471 ?auto_313477 ) ) ( not ( = ?auto_313471 ?auto_313478 ) ) ( not ( = ?auto_313471 ?auto_313479 ) ) ( not ( = ?auto_313471 ?auto_313480 ) ) ( not ( = ?auto_313471 ?auto_313481 ) ) ( not ( = ?auto_313471 ?auto_313482 ) ) ( not ( = ?auto_313471 ?auto_313483 ) ) ( not ( = ?auto_313472 ?auto_313473 ) ) ( not ( = ?auto_313472 ?auto_313474 ) ) ( not ( = ?auto_313472 ?auto_313475 ) ) ( not ( = ?auto_313472 ?auto_313476 ) ) ( not ( = ?auto_313472 ?auto_313477 ) ) ( not ( = ?auto_313472 ?auto_313478 ) ) ( not ( = ?auto_313472 ?auto_313479 ) ) ( not ( = ?auto_313472 ?auto_313480 ) ) ( not ( = ?auto_313472 ?auto_313481 ) ) ( not ( = ?auto_313472 ?auto_313482 ) ) ( not ( = ?auto_313472 ?auto_313483 ) ) ( not ( = ?auto_313473 ?auto_313474 ) ) ( not ( = ?auto_313473 ?auto_313475 ) ) ( not ( = ?auto_313473 ?auto_313476 ) ) ( not ( = ?auto_313473 ?auto_313477 ) ) ( not ( = ?auto_313473 ?auto_313478 ) ) ( not ( = ?auto_313473 ?auto_313479 ) ) ( not ( = ?auto_313473 ?auto_313480 ) ) ( not ( = ?auto_313473 ?auto_313481 ) ) ( not ( = ?auto_313473 ?auto_313482 ) ) ( not ( = ?auto_313473 ?auto_313483 ) ) ( not ( = ?auto_313474 ?auto_313475 ) ) ( not ( = ?auto_313474 ?auto_313476 ) ) ( not ( = ?auto_313474 ?auto_313477 ) ) ( not ( = ?auto_313474 ?auto_313478 ) ) ( not ( = ?auto_313474 ?auto_313479 ) ) ( not ( = ?auto_313474 ?auto_313480 ) ) ( not ( = ?auto_313474 ?auto_313481 ) ) ( not ( = ?auto_313474 ?auto_313482 ) ) ( not ( = ?auto_313474 ?auto_313483 ) ) ( not ( = ?auto_313475 ?auto_313476 ) ) ( not ( = ?auto_313475 ?auto_313477 ) ) ( not ( = ?auto_313475 ?auto_313478 ) ) ( not ( = ?auto_313475 ?auto_313479 ) ) ( not ( = ?auto_313475 ?auto_313480 ) ) ( not ( = ?auto_313475 ?auto_313481 ) ) ( not ( = ?auto_313475 ?auto_313482 ) ) ( not ( = ?auto_313475 ?auto_313483 ) ) ( not ( = ?auto_313476 ?auto_313477 ) ) ( not ( = ?auto_313476 ?auto_313478 ) ) ( not ( = ?auto_313476 ?auto_313479 ) ) ( not ( = ?auto_313476 ?auto_313480 ) ) ( not ( = ?auto_313476 ?auto_313481 ) ) ( not ( = ?auto_313476 ?auto_313482 ) ) ( not ( = ?auto_313476 ?auto_313483 ) ) ( not ( = ?auto_313477 ?auto_313478 ) ) ( not ( = ?auto_313477 ?auto_313479 ) ) ( not ( = ?auto_313477 ?auto_313480 ) ) ( not ( = ?auto_313477 ?auto_313481 ) ) ( not ( = ?auto_313477 ?auto_313482 ) ) ( not ( = ?auto_313477 ?auto_313483 ) ) ( not ( = ?auto_313478 ?auto_313479 ) ) ( not ( = ?auto_313478 ?auto_313480 ) ) ( not ( = ?auto_313478 ?auto_313481 ) ) ( not ( = ?auto_313478 ?auto_313482 ) ) ( not ( = ?auto_313478 ?auto_313483 ) ) ( not ( = ?auto_313479 ?auto_313480 ) ) ( not ( = ?auto_313479 ?auto_313481 ) ) ( not ( = ?auto_313479 ?auto_313482 ) ) ( not ( = ?auto_313479 ?auto_313483 ) ) ( not ( = ?auto_313480 ?auto_313481 ) ) ( not ( = ?auto_313480 ?auto_313482 ) ) ( not ( = ?auto_313480 ?auto_313483 ) ) ( not ( = ?auto_313481 ?auto_313482 ) ) ( not ( = ?auto_313481 ?auto_313483 ) ) ( not ( = ?auto_313482 ?auto_313483 ) ) ( ON ?auto_313470 ?auto_313484 ) ( not ( = ?auto_313483 ?auto_313484 ) ) ( not ( = ?auto_313482 ?auto_313484 ) ) ( not ( = ?auto_313481 ?auto_313484 ) ) ( not ( = ?auto_313480 ?auto_313484 ) ) ( not ( = ?auto_313479 ?auto_313484 ) ) ( not ( = ?auto_313478 ?auto_313484 ) ) ( not ( = ?auto_313477 ?auto_313484 ) ) ( not ( = ?auto_313476 ?auto_313484 ) ) ( not ( = ?auto_313475 ?auto_313484 ) ) ( not ( = ?auto_313474 ?auto_313484 ) ) ( not ( = ?auto_313473 ?auto_313484 ) ) ( not ( = ?auto_313472 ?auto_313484 ) ) ( not ( = ?auto_313471 ?auto_313484 ) ) ( not ( = ?auto_313470 ?auto_313484 ) ) ( ON ?auto_313471 ?auto_313470 ) ( ON ?auto_313472 ?auto_313471 ) ( ON ?auto_313473 ?auto_313472 ) ( ON ?auto_313474 ?auto_313473 ) ( ON ?auto_313475 ?auto_313474 ) ( ON ?auto_313476 ?auto_313475 ) ( ON ?auto_313477 ?auto_313476 ) ( ON ?auto_313478 ?auto_313477 ) ( ON ?auto_313479 ?auto_313478 ) ( ON ?auto_313480 ?auto_313479 ) ( ON ?auto_313481 ?auto_313480 ) ( ON ?auto_313482 ?auto_313481 ) ( ON ?auto_313483 ?auto_313482 ) ( CLEAR ?auto_313483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_313483 ?auto_313482 ?auto_313481 ?auto_313480 ?auto_313479 ?auto_313478 ?auto_313477 ?auto_313476 ?auto_313475 ?auto_313474 ?auto_313473 ?auto_313472 ?auto_313471 ?auto_313470 )
      ( MAKE-14PILE ?auto_313470 ?auto_313471 ?auto_313472 ?auto_313473 ?auto_313474 ?auto_313475 ?auto_313476 ?auto_313477 ?auto_313478 ?auto_313479 ?auto_313480 ?auto_313481 ?auto_313482 ?auto_313483 ) )
  )

)

