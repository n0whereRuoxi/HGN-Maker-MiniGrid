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
      ?auto_339196 - BLOCK
    )
    :vars
    (
      ?auto_339197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339196 ?auto_339197 ) ( CLEAR ?auto_339196 ) ( HAND-EMPTY ) ( not ( = ?auto_339196 ?auto_339197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339196 ?auto_339197 )
      ( !PUTDOWN ?auto_339196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_339203 - BLOCK
      ?auto_339204 - BLOCK
    )
    :vars
    (
      ?auto_339205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339203 ) ( ON ?auto_339204 ?auto_339205 ) ( CLEAR ?auto_339204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339203 ) ( not ( = ?auto_339203 ?auto_339204 ) ) ( not ( = ?auto_339203 ?auto_339205 ) ) ( not ( = ?auto_339204 ?auto_339205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339204 ?auto_339205 )
      ( !STACK ?auto_339204 ?auto_339203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_339213 - BLOCK
      ?auto_339214 - BLOCK
    )
    :vars
    (
      ?auto_339215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339214 ?auto_339215 ) ( not ( = ?auto_339213 ?auto_339214 ) ) ( not ( = ?auto_339213 ?auto_339215 ) ) ( not ( = ?auto_339214 ?auto_339215 ) ) ( ON ?auto_339213 ?auto_339214 ) ( CLEAR ?auto_339213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339213 )
      ( MAKE-2PILE ?auto_339213 ?auto_339214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_339224 - BLOCK
      ?auto_339225 - BLOCK
      ?auto_339226 - BLOCK
    )
    :vars
    (
      ?auto_339227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339225 ) ( ON ?auto_339226 ?auto_339227 ) ( CLEAR ?auto_339226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339224 ) ( ON ?auto_339225 ?auto_339224 ) ( not ( = ?auto_339224 ?auto_339225 ) ) ( not ( = ?auto_339224 ?auto_339226 ) ) ( not ( = ?auto_339224 ?auto_339227 ) ) ( not ( = ?auto_339225 ?auto_339226 ) ) ( not ( = ?auto_339225 ?auto_339227 ) ) ( not ( = ?auto_339226 ?auto_339227 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339226 ?auto_339227 )
      ( !STACK ?auto_339226 ?auto_339225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_339238 - BLOCK
      ?auto_339239 - BLOCK
      ?auto_339240 - BLOCK
    )
    :vars
    (
      ?auto_339241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339240 ?auto_339241 ) ( ON-TABLE ?auto_339238 ) ( not ( = ?auto_339238 ?auto_339239 ) ) ( not ( = ?auto_339238 ?auto_339240 ) ) ( not ( = ?auto_339238 ?auto_339241 ) ) ( not ( = ?auto_339239 ?auto_339240 ) ) ( not ( = ?auto_339239 ?auto_339241 ) ) ( not ( = ?auto_339240 ?auto_339241 ) ) ( CLEAR ?auto_339238 ) ( ON ?auto_339239 ?auto_339240 ) ( CLEAR ?auto_339239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339238 ?auto_339239 )
      ( MAKE-3PILE ?auto_339238 ?auto_339239 ?auto_339240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_339252 - BLOCK
      ?auto_339253 - BLOCK
      ?auto_339254 - BLOCK
    )
    :vars
    (
      ?auto_339255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339254 ?auto_339255 ) ( not ( = ?auto_339252 ?auto_339253 ) ) ( not ( = ?auto_339252 ?auto_339254 ) ) ( not ( = ?auto_339252 ?auto_339255 ) ) ( not ( = ?auto_339253 ?auto_339254 ) ) ( not ( = ?auto_339253 ?auto_339255 ) ) ( not ( = ?auto_339254 ?auto_339255 ) ) ( ON ?auto_339253 ?auto_339254 ) ( ON ?auto_339252 ?auto_339253 ) ( CLEAR ?auto_339252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339252 )
      ( MAKE-3PILE ?auto_339252 ?auto_339253 ?auto_339254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_339267 - BLOCK
      ?auto_339268 - BLOCK
      ?auto_339269 - BLOCK
      ?auto_339270 - BLOCK
    )
    :vars
    (
      ?auto_339271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339269 ) ( ON ?auto_339270 ?auto_339271 ) ( CLEAR ?auto_339270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339267 ) ( ON ?auto_339268 ?auto_339267 ) ( ON ?auto_339269 ?auto_339268 ) ( not ( = ?auto_339267 ?auto_339268 ) ) ( not ( = ?auto_339267 ?auto_339269 ) ) ( not ( = ?auto_339267 ?auto_339270 ) ) ( not ( = ?auto_339267 ?auto_339271 ) ) ( not ( = ?auto_339268 ?auto_339269 ) ) ( not ( = ?auto_339268 ?auto_339270 ) ) ( not ( = ?auto_339268 ?auto_339271 ) ) ( not ( = ?auto_339269 ?auto_339270 ) ) ( not ( = ?auto_339269 ?auto_339271 ) ) ( not ( = ?auto_339270 ?auto_339271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339270 ?auto_339271 )
      ( !STACK ?auto_339270 ?auto_339269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_339285 - BLOCK
      ?auto_339286 - BLOCK
      ?auto_339287 - BLOCK
      ?auto_339288 - BLOCK
    )
    :vars
    (
      ?auto_339289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339288 ?auto_339289 ) ( ON-TABLE ?auto_339285 ) ( ON ?auto_339286 ?auto_339285 ) ( not ( = ?auto_339285 ?auto_339286 ) ) ( not ( = ?auto_339285 ?auto_339287 ) ) ( not ( = ?auto_339285 ?auto_339288 ) ) ( not ( = ?auto_339285 ?auto_339289 ) ) ( not ( = ?auto_339286 ?auto_339287 ) ) ( not ( = ?auto_339286 ?auto_339288 ) ) ( not ( = ?auto_339286 ?auto_339289 ) ) ( not ( = ?auto_339287 ?auto_339288 ) ) ( not ( = ?auto_339287 ?auto_339289 ) ) ( not ( = ?auto_339288 ?auto_339289 ) ) ( CLEAR ?auto_339286 ) ( ON ?auto_339287 ?auto_339288 ) ( CLEAR ?auto_339287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339285 ?auto_339286 ?auto_339287 )
      ( MAKE-4PILE ?auto_339285 ?auto_339286 ?auto_339287 ?auto_339288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_339303 - BLOCK
      ?auto_339304 - BLOCK
      ?auto_339305 - BLOCK
      ?auto_339306 - BLOCK
    )
    :vars
    (
      ?auto_339307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339306 ?auto_339307 ) ( ON-TABLE ?auto_339303 ) ( not ( = ?auto_339303 ?auto_339304 ) ) ( not ( = ?auto_339303 ?auto_339305 ) ) ( not ( = ?auto_339303 ?auto_339306 ) ) ( not ( = ?auto_339303 ?auto_339307 ) ) ( not ( = ?auto_339304 ?auto_339305 ) ) ( not ( = ?auto_339304 ?auto_339306 ) ) ( not ( = ?auto_339304 ?auto_339307 ) ) ( not ( = ?auto_339305 ?auto_339306 ) ) ( not ( = ?auto_339305 ?auto_339307 ) ) ( not ( = ?auto_339306 ?auto_339307 ) ) ( ON ?auto_339305 ?auto_339306 ) ( CLEAR ?auto_339303 ) ( ON ?auto_339304 ?auto_339305 ) ( CLEAR ?auto_339304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339303 ?auto_339304 )
      ( MAKE-4PILE ?auto_339303 ?auto_339304 ?auto_339305 ?auto_339306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_339321 - BLOCK
      ?auto_339322 - BLOCK
      ?auto_339323 - BLOCK
      ?auto_339324 - BLOCK
    )
    :vars
    (
      ?auto_339325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339324 ?auto_339325 ) ( not ( = ?auto_339321 ?auto_339322 ) ) ( not ( = ?auto_339321 ?auto_339323 ) ) ( not ( = ?auto_339321 ?auto_339324 ) ) ( not ( = ?auto_339321 ?auto_339325 ) ) ( not ( = ?auto_339322 ?auto_339323 ) ) ( not ( = ?auto_339322 ?auto_339324 ) ) ( not ( = ?auto_339322 ?auto_339325 ) ) ( not ( = ?auto_339323 ?auto_339324 ) ) ( not ( = ?auto_339323 ?auto_339325 ) ) ( not ( = ?auto_339324 ?auto_339325 ) ) ( ON ?auto_339323 ?auto_339324 ) ( ON ?auto_339322 ?auto_339323 ) ( ON ?auto_339321 ?auto_339322 ) ( CLEAR ?auto_339321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339321 )
      ( MAKE-4PILE ?auto_339321 ?auto_339322 ?auto_339323 ?auto_339324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_339340 - BLOCK
      ?auto_339341 - BLOCK
      ?auto_339342 - BLOCK
      ?auto_339343 - BLOCK
      ?auto_339344 - BLOCK
    )
    :vars
    (
      ?auto_339345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339343 ) ( ON ?auto_339344 ?auto_339345 ) ( CLEAR ?auto_339344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339340 ) ( ON ?auto_339341 ?auto_339340 ) ( ON ?auto_339342 ?auto_339341 ) ( ON ?auto_339343 ?auto_339342 ) ( not ( = ?auto_339340 ?auto_339341 ) ) ( not ( = ?auto_339340 ?auto_339342 ) ) ( not ( = ?auto_339340 ?auto_339343 ) ) ( not ( = ?auto_339340 ?auto_339344 ) ) ( not ( = ?auto_339340 ?auto_339345 ) ) ( not ( = ?auto_339341 ?auto_339342 ) ) ( not ( = ?auto_339341 ?auto_339343 ) ) ( not ( = ?auto_339341 ?auto_339344 ) ) ( not ( = ?auto_339341 ?auto_339345 ) ) ( not ( = ?auto_339342 ?auto_339343 ) ) ( not ( = ?auto_339342 ?auto_339344 ) ) ( not ( = ?auto_339342 ?auto_339345 ) ) ( not ( = ?auto_339343 ?auto_339344 ) ) ( not ( = ?auto_339343 ?auto_339345 ) ) ( not ( = ?auto_339344 ?auto_339345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339344 ?auto_339345 )
      ( !STACK ?auto_339344 ?auto_339343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_339362 - BLOCK
      ?auto_339363 - BLOCK
      ?auto_339364 - BLOCK
      ?auto_339365 - BLOCK
      ?auto_339366 - BLOCK
    )
    :vars
    (
      ?auto_339367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339366 ?auto_339367 ) ( ON-TABLE ?auto_339362 ) ( ON ?auto_339363 ?auto_339362 ) ( ON ?auto_339364 ?auto_339363 ) ( not ( = ?auto_339362 ?auto_339363 ) ) ( not ( = ?auto_339362 ?auto_339364 ) ) ( not ( = ?auto_339362 ?auto_339365 ) ) ( not ( = ?auto_339362 ?auto_339366 ) ) ( not ( = ?auto_339362 ?auto_339367 ) ) ( not ( = ?auto_339363 ?auto_339364 ) ) ( not ( = ?auto_339363 ?auto_339365 ) ) ( not ( = ?auto_339363 ?auto_339366 ) ) ( not ( = ?auto_339363 ?auto_339367 ) ) ( not ( = ?auto_339364 ?auto_339365 ) ) ( not ( = ?auto_339364 ?auto_339366 ) ) ( not ( = ?auto_339364 ?auto_339367 ) ) ( not ( = ?auto_339365 ?auto_339366 ) ) ( not ( = ?auto_339365 ?auto_339367 ) ) ( not ( = ?auto_339366 ?auto_339367 ) ) ( CLEAR ?auto_339364 ) ( ON ?auto_339365 ?auto_339366 ) ( CLEAR ?auto_339365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_339362 ?auto_339363 ?auto_339364 ?auto_339365 )
      ( MAKE-5PILE ?auto_339362 ?auto_339363 ?auto_339364 ?auto_339365 ?auto_339366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_339384 - BLOCK
      ?auto_339385 - BLOCK
      ?auto_339386 - BLOCK
      ?auto_339387 - BLOCK
      ?auto_339388 - BLOCK
    )
    :vars
    (
      ?auto_339389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339388 ?auto_339389 ) ( ON-TABLE ?auto_339384 ) ( ON ?auto_339385 ?auto_339384 ) ( not ( = ?auto_339384 ?auto_339385 ) ) ( not ( = ?auto_339384 ?auto_339386 ) ) ( not ( = ?auto_339384 ?auto_339387 ) ) ( not ( = ?auto_339384 ?auto_339388 ) ) ( not ( = ?auto_339384 ?auto_339389 ) ) ( not ( = ?auto_339385 ?auto_339386 ) ) ( not ( = ?auto_339385 ?auto_339387 ) ) ( not ( = ?auto_339385 ?auto_339388 ) ) ( not ( = ?auto_339385 ?auto_339389 ) ) ( not ( = ?auto_339386 ?auto_339387 ) ) ( not ( = ?auto_339386 ?auto_339388 ) ) ( not ( = ?auto_339386 ?auto_339389 ) ) ( not ( = ?auto_339387 ?auto_339388 ) ) ( not ( = ?auto_339387 ?auto_339389 ) ) ( not ( = ?auto_339388 ?auto_339389 ) ) ( ON ?auto_339387 ?auto_339388 ) ( CLEAR ?auto_339385 ) ( ON ?auto_339386 ?auto_339387 ) ( CLEAR ?auto_339386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339384 ?auto_339385 ?auto_339386 )
      ( MAKE-5PILE ?auto_339384 ?auto_339385 ?auto_339386 ?auto_339387 ?auto_339388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_339406 - BLOCK
      ?auto_339407 - BLOCK
      ?auto_339408 - BLOCK
      ?auto_339409 - BLOCK
      ?auto_339410 - BLOCK
    )
    :vars
    (
      ?auto_339411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339410 ?auto_339411 ) ( ON-TABLE ?auto_339406 ) ( not ( = ?auto_339406 ?auto_339407 ) ) ( not ( = ?auto_339406 ?auto_339408 ) ) ( not ( = ?auto_339406 ?auto_339409 ) ) ( not ( = ?auto_339406 ?auto_339410 ) ) ( not ( = ?auto_339406 ?auto_339411 ) ) ( not ( = ?auto_339407 ?auto_339408 ) ) ( not ( = ?auto_339407 ?auto_339409 ) ) ( not ( = ?auto_339407 ?auto_339410 ) ) ( not ( = ?auto_339407 ?auto_339411 ) ) ( not ( = ?auto_339408 ?auto_339409 ) ) ( not ( = ?auto_339408 ?auto_339410 ) ) ( not ( = ?auto_339408 ?auto_339411 ) ) ( not ( = ?auto_339409 ?auto_339410 ) ) ( not ( = ?auto_339409 ?auto_339411 ) ) ( not ( = ?auto_339410 ?auto_339411 ) ) ( ON ?auto_339409 ?auto_339410 ) ( ON ?auto_339408 ?auto_339409 ) ( CLEAR ?auto_339406 ) ( ON ?auto_339407 ?auto_339408 ) ( CLEAR ?auto_339407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339406 ?auto_339407 )
      ( MAKE-5PILE ?auto_339406 ?auto_339407 ?auto_339408 ?auto_339409 ?auto_339410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_339428 - BLOCK
      ?auto_339429 - BLOCK
      ?auto_339430 - BLOCK
      ?auto_339431 - BLOCK
      ?auto_339432 - BLOCK
    )
    :vars
    (
      ?auto_339433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339432 ?auto_339433 ) ( not ( = ?auto_339428 ?auto_339429 ) ) ( not ( = ?auto_339428 ?auto_339430 ) ) ( not ( = ?auto_339428 ?auto_339431 ) ) ( not ( = ?auto_339428 ?auto_339432 ) ) ( not ( = ?auto_339428 ?auto_339433 ) ) ( not ( = ?auto_339429 ?auto_339430 ) ) ( not ( = ?auto_339429 ?auto_339431 ) ) ( not ( = ?auto_339429 ?auto_339432 ) ) ( not ( = ?auto_339429 ?auto_339433 ) ) ( not ( = ?auto_339430 ?auto_339431 ) ) ( not ( = ?auto_339430 ?auto_339432 ) ) ( not ( = ?auto_339430 ?auto_339433 ) ) ( not ( = ?auto_339431 ?auto_339432 ) ) ( not ( = ?auto_339431 ?auto_339433 ) ) ( not ( = ?auto_339432 ?auto_339433 ) ) ( ON ?auto_339431 ?auto_339432 ) ( ON ?auto_339430 ?auto_339431 ) ( ON ?auto_339429 ?auto_339430 ) ( ON ?auto_339428 ?auto_339429 ) ( CLEAR ?auto_339428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339428 )
      ( MAKE-5PILE ?auto_339428 ?auto_339429 ?auto_339430 ?auto_339431 ?auto_339432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339451 - BLOCK
      ?auto_339452 - BLOCK
      ?auto_339453 - BLOCK
      ?auto_339454 - BLOCK
      ?auto_339455 - BLOCK
      ?auto_339456 - BLOCK
    )
    :vars
    (
      ?auto_339457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339455 ) ( ON ?auto_339456 ?auto_339457 ) ( CLEAR ?auto_339456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339451 ) ( ON ?auto_339452 ?auto_339451 ) ( ON ?auto_339453 ?auto_339452 ) ( ON ?auto_339454 ?auto_339453 ) ( ON ?auto_339455 ?auto_339454 ) ( not ( = ?auto_339451 ?auto_339452 ) ) ( not ( = ?auto_339451 ?auto_339453 ) ) ( not ( = ?auto_339451 ?auto_339454 ) ) ( not ( = ?auto_339451 ?auto_339455 ) ) ( not ( = ?auto_339451 ?auto_339456 ) ) ( not ( = ?auto_339451 ?auto_339457 ) ) ( not ( = ?auto_339452 ?auto_339453 ) ) ( not ( = ?auto_339452 ?auto_339454 ) ) ( not ( = ?auto_339452 ?auto_339455 ) ) ( not ( = ?auto_339452 ?auto_339456 ) ) ( not ( = ?auto_339452 ?auto_339457 ) ) ( not ( = ?auto_339453 ?auto_339454 ) ) ( not ( = ?auto_339453 ?auto_339455 ) ) ( not ( = ?auto_339453 ?auto_339456 ) ) ( not ( = ?auto_339453 ?auto_339457 ) ) ( not ( = ?auto_339454 ?auto_339455 ) ) ( not ( = ?auto_339454 ?auto_339456 ) ) ( not ( = ?auto_339454 ?auto_339457 ) ) ( not ( = ?auto_339455 ?auto_339456 ) ) ( not ( = ?auto_339455 ?auto_339457 ) ) ( not ( = ?auto_339456 ?auto_339457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339456 ?auto_339457 )
      ( !STACK ?auto_339456 ?auto_339455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339477 - BLOCK
      ?auto_339478 - BLOCK
      ?auto_339479 - BLOCK
      ?auto_339480 - BLOCK
      ?auto_339481 - BLOCK
      ?auto_339482 - BLOCK
    )
    :vars
    (
      ?auto_339483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339482 ?auto_339483 ) ( ON-TABLE ?auto_339477 ) ( ON ?auto_339478 ?auto_339477 ) ( ON ?auto_339479 ?auto_339478 ) ( ON ?auto_339480 ?auto_339479 ) ( not ( = ?auto_339477 ?auto_339478 ) ) ( not ( = ?auto_339477 ?auto_339479 ) ) ( not ( = ?auto_339477 ?auto_339480 ) ) ( not ( = ?auto_339477 ?auto_339481 ) ) ( not ( = ?auto_339477 ?auto_339482 ) ) ( not ( = ?auto_339477 ?auto_339483 ) ) ( not ( = ?auto_339478 ?auto_339479 ) ) ( not ( = ?auto_339478 ?auto_339480 ) ) ( not ( = ?auto_339478 ?auto_339481 ) ) ( not ( = ?auto_339478 ?auto_339482 ) ) ( not ( = ?auto_339478 ?auto_339483 ) ) ( not ( = ?auto_339479 ?auto_339480 ) ) ( not ( = ?auto_339479 ?auto_339481 ) ) ( not ( = ?auto_339479 ?auto_339482 ) ) ( not ( = ?auto_339479 ?auto_339483 ) ) ( not ( = ?auto_339480 ?auto_339481 ) ) ( not ( = ?auto_339480 ?auto_339482 ) ) ( not ( = ?auto_339480 ?auto_339483 ) ) ( not ( = ?auto_339481 ?auto_339482 ) ) ( not ( = ?auto_339481 ?auto_339483 ) ) ( not ( = ?auto_339482 ?auto_339483 ) ) ( CLEAR ?auto_339480 ) ( ON ?auto_339481 ?auto_339482 ) ( CLEAR ?auto_339481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_339477 ?auto_339478 ?auto_339479 ?auto_339480 ?auto_339481 )
      ( MAKE-6PILE ?auto_339477 ?auto_339478 ?auto_339479 ?auto_339480 ?auto_339481 ?auto_339482 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339503 - BLOCK
      ?auto_339504 - BLOCK
      ?auto_339505 - BLOCK
      ?auto_339506 - BLOCK
      ?auto_339507 - BLOCK
      ?auto_339508 - BLOCK
    )
    :vars
    (
      ?auto_339509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339508 ?auto_339509 ) ( ON-TABLE ?auto_339503 ) ( ON ?auto_339504 ?auto_339503 ) ( ON ?auto_339505 ?auto_339504 ) ( not ( = ?auto_339503 ?auto_339504 ) ) ( not ( = ?auto_339503 ?auto_339505 ) ) ( not ( = ?auto_339503 ?auto_339506 ) ) ( not ( = ?auto_339503 ?auto_339507 ) ) ( not ( = ?auto_339503 ?auto_339508 ) ) ( not ( = ?auto_339503 ?auto_339509 ) ) ( not ( = ?auto_339504 ?auto_339505 ) ) ( not ( = ?auto_339504 ?auto_339506 ) ) ( not ( = ?auto_339504 ?auto_339507 ) ) ( not ( = ?auto_339504 ?auto_339508 ) ) ( not ( = ?auto_339504 ?auto_339509 ) ) ( not ( = ?auto_339505 ?auto_339506 ) ) ( not ( = ?auto_339505 ?auto_339507 ) ) ( not ( = ?auto_339505 ?auto_339508 ) ) ( not ( = ?auto_339505 ?auto_339509 ) ) ( not ( = ?auto_339506 ?auto_339507 ) ) ( not ( = ?auto_339506 ?auto_339508 ) ) ( not ( = ?auto_339506 ?auto_339509 ) ) ( not ( = ?auto_339507 ?auto_339508 ) ) ( not ( = ?auto_339507 ?auto_339509 ) ) ( not ( = ?auto_339508 ?auto_339509 ) ) ( ON ?auto_339507 ?auto_339508 ) ( CLEAR ?auto_339505 ) ( ON ?auto_339506 ?auto_339507 ) ( CLEAR ?auto_339506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_339503 ?auto_339504 ?auto_339505 ?auto_339506 )
      ( MAKE-6PILE ?auto_339503 ?auto_339504 ?auto_339505 ?auto_339506 ?auto_339507 ?auto_339508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339529 - BLOCK
      ?auto_339530 - BLOCK
      ?auto_339531 - BLOCK
      ?auto_339532 - BLOCK
      ?auto_339533 - BLOCK
      ?auto_339534 - BLOCK
    )
    :vars
    (
      ?auto_339535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339534 ?auto_339535 ) ( ON-TABLE ?auto_339529 ) ( ON ?auto_339530 ?auto_339529 ) ( not ( = ?auto_339529 ?auto_339530 ) ) ( not ( = ?auto_339529 ?auto_339531 ) ) ( not ( = ?auto_339529 ?auto_339532 ) ) ( not ( = ?auto_339529 ?auto_339533 ) ) ( not ( = ?auto_339529 ?auto_339534 ) ) ( not ( = ?auto_339529 ?auto_339535 ) ) ( not ( = ?auto_339530 ?auto_339531 ) ) ( not ( = ?auto_339530 ?auto_339532 ) ) ( not ( = ?auto_339530 ?auto_339533 ) ) ( not ( = ?auto_339530 ?auto_339534 ) ) ( not ( = ?auto_339530 ?auto_339535 ) ) ( not ( = ?auto_339531 ?auto_339532 ) ) ( not ( = ?auto_339531 ?auto_339533 ) ) ( not ( = ?auto_339531 ?auto_339534 ) ) ( not ( = ?auto_339531 ?auto_339535 ) ) ( not ( = ?auto_339532 ?auto_339533 ) ) ( not ( = ?auto_339532 ?auto_339534 ) ) ( not ( = ?auto_339532 ?auto_339535 ) ) ( not ( = ?auto_339533 ?auto_339534 ) ) ( not ( = ?auto_339533 ?auto_339535 ) ) ( not ( = ?auto_339534 ?auto_339535 ) ) ( ON ?auto_339533 ?auto_339534 ) ( ON ?auto_339532 ?auto_339533 ) ( CLEAR ?auto_339530 ) ( ON ?auto_339531 ?auto_339532 ) ( CLEAR ?auto_339531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339529 ?auto_339530 ?auto_339531 )
      ( MAKE-6PILE ?auto_339529 ?auto_339530 ?auto_339531 ?auto_339532 ?auto_339533 ?auto_339534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339555 - BLOCK
      ?auto_339556 - BLOCK
      ?auto_339557 - BLOCK
      ?auto_339558 - BLOCK
      ?auto_339559 - BLOCK
      ?auto_339560 - BLOCK
    )
    :vars
    (
      ?auto_339561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339560 ?auto_339561 ) ( ON-TABLE ?auto_339555 ) ( not ( = ?auto_339555 ?auto_339556 ) ) ( not ( = ?auto_339555 ?auto_339557 ) ) ( not ( = ?auto_339555 ?auto_339558 ) ) ( not ( = ?auto_339555 ?auto_339559 ) ) ( not ( = ?auto_339555 ?auto_339560 ) ) ( not ( = ?auto_339555 ?auto_339561 ) ) ( not ( = ?auto_339556 ?auto_339557 ) ) ( not ( = ?auto_339556 ?auto_339558 ) ) ( not ( = ?auto_339556 ?auto_339559 ) ) ( not ( = ?auto_339556 ?auto_339560 ) ) ( not ( = ?auto_339556 ?auto_339561 ) ) ( not ( = ?auto_339557 ?auto_339558 ) ) ( not ( = ?auto_339557 ?auto_339559 ) ) ( not ( = ?auto_339557 ?auto_339560 ) ) ( not ( = ?auto_339557 ?auto_339561 ) ) ( not ( = ?auto_339558 ?auto_339559 ) ) ( not ( = ?auto_339558 ?auto_339560 ) ) ( not ( = ?auto_339558 ?auto_339561 ) ) ( not ( = ?auto_339559 ?auto_339560 ) ) ( not ( = ?auto_339559 ?auto_339561 ) ) ( not ( = ?auto_339560 ?auto_339561 ) ) ( ON ?auto_339559 ?auto_339560 ) ( ON ?auto_339558 ?auto_339559 ) ( ON ?auto_339557 ?auto_339558 ) ( CLEAR ?auto_339555 ) ( ON ?auto_339556 ?auto_339557 ) ( CLEAR ?auto_339556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339555 ?auto_339556 )
      ( MAKE-6PILE ?auto_339555 ?auto_339556 ?auto_339557 ?auto_339558 ?auto_339559 ?auto_339560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_339581 - BLOCK
      ?auto_339582 - BLOCK
      ?auto_339583 - BLOCK
      ?auto_339584 - BLOCK
      ?auto_339585 - BLOCK
      ?auto_339586 - BLOCK
    )
    :vars
    (
      ?auto_339587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339586 ?auto_339587 ) ( not ( = ?auto_339581 ?auto_339582 ) ) ( not ( = ?auto_339581 ?auto_339583 ) ) ( not ( = ?auto_339581 ?auto_339584 ) ) ( not ( = ?auto_339581 ?auto_339585 ) ) ( not ( = ?auto_339581 ?auto_339586 ) ) ( not ( = ?auto_339581 ?auto_339587 ) ) ( not ( = ?auto_339582 ?auto_339583 ) ) ( not ( = ?auto_339582 ?auto_339584 ) ) ( not ( = ?auto_339582 ?auto_339585 ) ) ( not ( = ?auto_339582 ?auto_339586 ) ) ( not ( = ?auto_339582 ?auto_339587 ) ) ( not ( = ?auto_339583 ?auto_339584 ) ) ( not ( = ?auto_339583 ?auto_339585 ) ) ( not ( = ?auto_339583 ?auto_339586 ) ) ( not ( = ?auto_339583 ?auto_339587 ) ) ( not ( = ?auto_339584 ?auto_339585 ) ) ( not ( = ?auto_339584 ?auto_339586 ) ) ( not ( = ?auto_339584 ?auto_339587 ) ) ( not ( = ?auto_339585 ?auto_339586 ) ) ( not ( = ?auto_339585 ?auto_339587 ) ) ( not ( = ?auto_339586 ?auto_339587 ) ) ( ON ?auto_339585 ?auto_339586 ) ( ON ?auto_339584 ?auto_339585 ) ( ON ?auto_339583 ?auto_339584 ) ( ON ?auto_339582 ?auto_339583 ) ( ON ?auto_339581 ?auto_339582 ) ( CLEAR ?auto_339581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339581 )
      ( MAKE-6PILE ?auto_339581 ?auto_339582 ?auto_339583 ?auto_339584 ?auto_339585 ?auto_339586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339608 - BLOCK
      ?auto_339609 - BLOCK
      ?auto_339610 - BLOCK
      ?auto_339611 - BLOCK
      ?auto_339612 - BLOCK
      ?auto_339613 - BLOCK
      ?auto_339614 - BLOCK
    )
    :vars
    (
      ?auto_339615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339613 ) ( ON ?auto_339614 ?auto_339615 ) ( CLEAR ?auto_339614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339608 ) ( ON ?auto_339609 ?auto_339608 ) ( ON ?auto_339610 ?auto_339609 ) ( ON ?auto_339611 ?auto_339610 ) ( ON ?auto_339612 ?auto_339611 ) ( ON ?auto_339613 ?auto_339612 ) ( not ( = ?auto_339608 ?auto_339609 ) ) ( not ( = ?auto_339608 ?auto_339610 ) ) ( not ( = ?auto_339608 ?auto_339611 ) ) ( not ( = ?auto_339608 ?auto_339612 ) ) ( not ( = ?auto_339608 ?auto_339613 ) ) ( not ( = ?auto_339608 ?auto_339614 ) ) ( not ( = ?auto_339608 ?auto_339615 ) ) ( not ( = ?auto_339609 ?auto_339610 ) ) ( not ( = ?auto_339609 ?auto_339611 ) ) ( not ( = ?auto_339609 ?auto_339612 ) ) ( not ( = ?auto_339609 ?auto_339613 ) ) ( not ( = ?auto_339609 ?auto_339614 ) ) ( not ( = ?auto_339609 ?auto_339615 ) ) ( not ( = ?auto_339610 ?auto_339611 ) ) ( not ( = ?auto_339610 ?auto_339612 ) ) ( not ( = ?auto_339610 ?auto_339613 ) ) ( not ( = ?auto_339610 ?auto_339614 ) ) ( not ( = ?auto_339610 ?auto_339615 ) ) ( not ( = ?auto_339611 ?auto_339612 ) ) ( not ( = ?auto_339611 ?auto_339613 ) ) ( not ( = ?auto_339611 ?auto_339614 ) ) ( not ( = ?auto_339611 ?auto_339615 ) ) ( not ( = ?auto_339612 ?auto_339613 ) ) ( not ( = ?auto_339612 ?auto_339614 ) ) ( not ( = ?auto_339612 ?auto_339615 ) ) ( not ( = ?auto_339613 ?auto_339614 ) ) ( not ( = ?auto_339613 ?auto_339615 ) ) ( not ( = ?auto_339614 ?auto_339615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339614 ?auto_339615 )
      ( !STACK ?auto_339614 ?auto_339613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339638 - BLOCK
      ?auto_339639 - BLOCK
      ?auto_339640 - BLOCK
      ?auto_339641 - BLOCK
      ?auto_339642 - BLOCK
      ?auto_339643 - BLOCK
      ?auto_339644 - BLOCK
    )
    :vars
    (
      ?auto_339645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339644 ?auto_339645 ) ( ON-TABLE ?auto_339638 ) ( ON ?auto_339639 ?auto_339638 ) ( ON ?auto_339640 ?auto_339639 ) ( ON ?auto_339641 ?auto_339640 ) ( ON ?auto_339642 ?auto_339641 ) ( not ( = ?auto_339638 ?auto_339639 ) ) ( not ( = ?auto_339638 ?auto_339640 ) ) ( not ( = ?auto_339638 ?auto_339641 ) ) ( not ( = ?auto_339638 ?auto_339642 ) ) ( not ( = ?auto_339638 ?auto_339643 ) ) ( not ( = ?auto_339638 ?auto_339644 ) ) ( not ( = ?auto_339638 ?auto_339645 ) ) ( not ( = ?auto_339639 ?auto_339640 ) ) ( not ( = ?auto_339639 ?auto_339641 ) ) ( not ( = ?auto_339639 ?auto_339642 ) ) ( not ( = ?auto_339639 ?auto_339643 ) ) ( not ( = ?auto_339639 ?auto_339644 ) ) ( not ( = ?auto_339639 ?auto_339645 ) ) ( not ( = ?auto_339640 ?auto_339641 ) ) ( not ( = ?auto_339640 ?auto_339642 ) ) ( not ( = ?auto_339640 ?auto_339643 ) ) ( not ( = ?auto_339640 ?auto_339644 ) ) ( not ( = ?auto_339640 ?auto_339645 ) ) ( not ( = ?auto_339641 ?auto_339642 ) ) ( not ( = ?auto_339641 ?auto_339643 ) ) ( not ( = ?auto_339641 ?auto_339644 ) ) ( not ( = ?auto_339641 ?auto_339645 ) ) ( not ( = ?auto_339642 ?auto_339643 ) ) ( not ( = ?auto_339642 ?auto_339644 ) ) ( not ( = ?auto_339642 ?auto_339645 ) ) ( not ( = ?auto_339643 ?auto_339644 ) ) ( not ( = ?auto_339643 ?auto_339645 ) ) ( not ( = ?auto_339644 ?auto_339645 ) ) ( CLEAR ?auto_339642 ) ( ON ?auto_339643 ?auto_339644 ) ( CLEAR ?auto_339643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_339638 ?auto_339639 ?auto_339640 ?auto_339641 ?auto_339642 ?auto_339643 )
      ( MAKE-7PILE ?auto_339638 ?auto_339639 ?auto_339640 ?auto_339641 ?auto_339642 ?auto_339643 ?auto_339644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339668 - BLOCK
      ?auto_339669 - BLOCK
      ?auto_339670 - BLOCK
      ?auto_339671 - BLOCK
      ?auto_339672 - BLOCK
      ?auto_339673 - BLOCK
      ?auto_339674 - BLOCK
    )
    :vars
    (
      ?auto_339675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339674 ?auto_339675 ) ( ON-TABLE ?auto_339668 ) ( ON ?auto_339669 ?auto_339668 ) ( ON ?auto_339670 ?auto_339669 ) ( ON ?auto_339671 ?auto_339670 ) ( not ( = ?auto_339668 ?auto_339669 ) ) ( not ( = ?auto_339668 ?auto_339670 ) ) ( not ( = ?auto_339668 ?auto_339671 ) ) ( not ( = ?auto_339668 ?auto_339672 ) ) ( not ( = ?auto_339668 ?auto_339673 ) ) ( not ( = ?auto_339668 ?auto_339674 ) ) ( not ( = ?auto_339668 ?auto_339675 ) ) ( not ( = ?auto_339669 ?auto_339670 ) ) ( not ( = ?auto_339669 ?auto_339671 ) ) ( not ( = ?auto_339669 ?auto_339672 ) ) ( not ( = ?auto_339669 ?auto_339673 ) ) ( not ( = ?auto_339669 ?auto_339674 ) ) ( not ( = ?auto_339669 ?auto_339675 ) ) ( not ( = ?auto_339670 ?auto_339671 ) ) ( not ( = ?auto_339670 ?auto_339672 ) ) ( not ( = ?auto_339670 ?auto_339673 ) ) ( not ( = ?auto_339670 ?auto_339674 ) ) ( not ( = ?auto_339670 ?auto_339675 ) ) ( not ( = ?auto_339671 ?auto_339672 ) ) ( not ( = ?auto_339671 ?auto_339673 ) ) ( not ( = ?auto_339671 ?auto_339674 ) ) ( not ( = ?auto_339671 ?auto_339675 ) ) ( not ( = ?auto_339672 ?auto_339673 ) ) ( not ( = ?auto_339672 ?auto_339674 ) ) ( not ( = ?auto_339672 ?auto_339675 ) ) ( not ( = ?auto_339673 ?auto_339674 ) ) ( not ( = ?auto_339673 ?auto_339675 ) ) ( not ( = ?auto_339674 ?auto_339675 ) ) ( ON ?auto_339673 ?auto_339674 ) ( CLEAR ?auto_339671 ) ( ON ?auto_339672 ?auto_339673 ) ( CLEAR ?auto_339672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_339668 ?auto_339669 ?auto_339670 ?auto_339671 ?auto_339672 )
      ( MAKE-7PILE ?auto_339668 ?auto_339669 ?auto_339670 ?auto_339671 ?auto_339672 ?auto_339673 ?auto_339674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339698 - BLOCK
      ?auto_339699 - BLOCK
      ?auto_339700 - BLOCK
      ?auto_339701 - BLOCK
      ?auto_339702 - BLOCK
      ?auto_339703 - BLOCK
      ?auto_339704 - BLOCK
    )
    :vars
    (
      ?auto_339705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339704 ?auto_339705 ) ( ON-TABLE ?auto_339698 ) ( ON ?auto_339699 ?auto_339698 ) ( ON ?auto_339700 ?auto_339699 ) ( not ( = ?auto_339698 ?auto_339699 ) ) ( not ( = ?auto_339698 ?auto_339700 ) ) ( not ( = ?auto_339698 ?auto_339701 ) ) ( not ( = ?auto_339698 ?auto_339702 ) ) ( not ( = ?auto_339698 ?auto_339703 ) ) ( not ( = ?auto_339698 ?auto_339704 ) ) ( not ( = ?auto_339698 ?auto_339705 ) ) ( not ( = ?auto_339699 ?auto_339700 ) ) ( not ( = ?auto_339699 ?auto_339701 ) ) ( not ( = ?auto_339699 ?auto_339702 ) ) ( not ( = ?auto_339699 ?auto_339703 ) ) ( not ( = ?auto_339699 ?auto_339704 ) ) ( not ( = ?auto_339699 ?auto_339705 ) ) ( not ( = ?auto_339700 ?auto_339701 ) ) ( not ( = ?auto_339700 ?auto_339702 ) ) ( not ( = ?auto_339700 ?auto_339703 ) ) ( not ( = ?auto_339700 ?auto_339704 ) ) ( not ( = ?auto_339700 ?auto_339705 ) ) ( not ( = ?auto_339701 ?auto_339702 ) ) ( not ( = ?auto_339701 ?auto_339703 ) ) ( not ( = ?auto_339701 ?auto_339704 ) ) ( not ( = ?auto_339701 ?auto_339705 ) ) ( not ( = ?auto_339702 ?auto_339703 ) ) ( not ( = ?auto_339702 ?auto_339704 ) ) ( not ( = ?auto_339702 ?auto_339705 ) ) ( not ( = ?auto_339703 ?auto_339704 ) ) ( not ( = ?auto_339703 ?auto_339705 ) ) ( not ( = ?auto_339704 ?auto_339705 ) ) ( ON ?auto_339703 ?auto_339704 ) ( ON ?auto_339702 ?auto_339703 ) ( CLEAR ?auto_339700 ) ( ON ?auto_339701 ?auto_339702 ) ( CLEAR ?auto_339701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_339698 ?auto_339699 ?auto_339700 ?auto_339701 )
      ( MAKE-7PILE ?auto_339698 ?auto_339699 ?auto_339700 ?auto_339701 ?auto_339702 ?auto_339703 ?auto_339704 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339728 - BLOCK
      ?auto_339729 - BLOCK
      ?auto_339730 - BLOCK
      ?auto_339731 - BLOCK
      ?auto_339732 - BLOCK
      ?auto_339733 - BLOCK
      ?auto_339734 - BLOCK
    )
    :vars
    (
      ?auto_339735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339734 ?auto_339735 ) ( ON-TABLE ?auto_339728 ) ( ON ?auto_339729 ?auto_339728 ) ( not ( = ?auto_339728 ?auto_339729 ) ) ( not ( = ?auto_339728 ?auto_339730 ) ) ( not ( = ?auto_339728 ?auto_339731 ) ) ( not ( = ?auto_339728 ?auto_339732 ) ) ( not ( = ?auto_339728 ?auto_339733 ) ) ( not ( = ?auto_339728 ?auto_339734 ) ) ( not ( = ?auto_339728 ?auto_339735 ) ) ( not ( = ?auto_339729 ?auto_339730 ) ) ( not ( = ?auto_339729 ?auto_339731 ) ) ( not ( = ?auto_339729 ?auto_339732 ) ) ( not ( = ?auto_339729 ?auto_339733 ) ) ( not ( = ?auto_339729 ?auto_339734 ) ) ( not ( = ?auto_339729 ?auto_339735 ) ) ( not ( = ?auto_339730 ?auto_339731 ) ) ( not ( = ?auto_339730 ?auto_339732 ) ) ( not ( = ?auto_339730 ?auto_339733 ) ) ( not ( = ?auto_339730 ?auto_339734 ) ) ( not ( = ?auto_339730 ?auto_339735 ) ) ( not ( = ?auto_339731 ?auto_339732 ) ) ( not ( = ?auto_339731 ?auto_339733 ) ) ( not ( = ?auto_339731 ?auto_339734 ) ) ( not ( = ?auto_339731 ?auto_339735 ) ) ( not ( = ?auto_339732 ?auto_339733 ) ) ( not ( = ?auto_339732 ?auto_339734 ) ) ( not ( = ?auto_339732 ?auto_339735 ) ) ( not ( = ?auto_339733 ?auto_339734 ) ) ( not ( = ?auto_339733 ?auto_339735 ) ) ( not ( = ?auto_339734 ?auto_339735 ) ) ( ON ?auto_339733 ?auto_339734 ) ( ON ?auto_339732 ?auto_339733 ) ( ON ?auto_339731 ?auto_339732 ) ( CLEAR ?auto_339729 ) ( ON ?auto_339730 ?auto_339731 ) ( CLEAR ?auto_339730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339728 ?auto_339729 ?auto_339730 )
      ( MAKE-7PILE ?auto_339728 ?auto_339729 ?auto_339730 ?auto_339731 ?auto_339732 ?auto_339733 ?auto_339734 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339758 - BLOCK
      ?auto_339759 - BLOCK
      ?auto_339760 - BLOCK
      ?auto_339761 - BLOCK
      ?auto_339762 - BLOCK
      ?auto_339763 - BLOCK
      ?auto_339764 - BLOCK
    )
    :vars
    (
      ?auto_339765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339764 ?auto_339765 ) ( ON-TABLE ?auto_339758 ) ( not ( = ?auto_339758 ?auto_339759 ) ) ( not ( = ?auto_339758 ?auto_339760 ) ) ( not ( = ?auto_339758 ?auto_339761 ) ) ( not ( = ?auto_339758 ?auto_339762 ) ) ( not ( = ?auto_339758 ?auto_339763 ) ) ( not ( = ?auto_339758 ?auto_339764 ) ) ( not ( = ?auto_339758 ?auto_339765 ) ) ( not ( = ?auto_339759 ?auto_339760 ) ) ( not ( = ?auto_339759 ?auto_339761 ) ) ( not ( = ?auto_339759 ?auto_339762 ) ) ( not ( = ?auto_339759 ?auto_339763 ) ) ( not ( = ?auto_339759 ?auto_339764 ) ) ( not ( = ?auto_339759 ?auto_339765 ) ) ( not ( = ?auto_339760 ?auto_339761 ) ) ( not ( = ?auto_339760 ?auto_339762 ) ) ( not ( = ?auto_339760 ?auto_339763 ) ) ( not ( = ?auto_339760 ?auto_339764 ) ) ( not ( = ?auto_339760 ?auto_339765 ) ) ( not ( = ?auto_339761 ?auto_339762 ) ) ( not ( = ?auto_339761 ?auto_339763 ) ) ( not ( = ?auto_339761 ?auto_339764 ) ) ( not ( = ?auto_339761 ?auto_339765 ) ) ( not ( = ?auto_339762 ?auto_339763 ) ) ( not ( = ?auto_339762 ?auto_339764 ) ) ( not ( = ?auto_339762 ?auto_339765 ) ) ( not ( = ?auto_339763 ?auto_339764 ) ) ( not ( = ?auto_339763 ?auto_339765 ) ) ( not ( = ?auto_339764 ?auto_339765 ) ) ( ON ?auto_339763 ?auto_339764 ) ( ON ?auto_339762 ?auto_339763 ) ( ON ?auto_339761 ?auto_339762 ) ( ON ?auto_339760 ?auto_339761 ) ( CLEAR ?auto_339758 ) ( ON ?auto_339759 ?auto_339760 ) ( CLEAR ?auto_339759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339758 ?auto_339759 )
      ( MAKE-7PILE ?auto_339758 ?auto_339759 ?auto_339760 ?auto_339761 ?auto_339762 ?auto_339763 ?auto_339764 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_339788 - BLOCK
      ?auto_339789 - BLOCK
      ?auto_339790 - BLOCK
      ?auto_339791 - BLOCK
      ?auto_339792 - BLOCK
      ?auto_339793 - BLOCK
      ?auto_339794 - BLOCK
    )
    :vars
    (
      ?auto_339795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339794 ?auto_339795 ) ( not ( = ?auto_339788 ?auto_339789 ) ) ( not ( = ?auto_339788 ?auto_339790 ) ) ( not ( = ?auto_339788 ?auto_339791 ) ) ( not ( = ?auto_339788 ?auto_339792 ) ) ( not ( = ?auto_339788 ?auto_339793 ) ) ( not ( = ?auto_339788 ?auto_339794 ) ) ( not ( = ?auto_339788 ?auto_339795 ) ) ( not ( = ?auto_339789 ?auto_339790 ) ) ( not ( = ?auto_339789 ?auto_339791 ) ) ( not ( = ?auto_339789 ?auto_339792 ) ) ( not ( = ?auto_339789 ?auto_339793 ) ) ( not ( = ?auto_339789 ?auto_339794 ) ) ( not ( = ?auto_339789 ?auto_339795 ) ) ( not ( = ?auto_339790 ?auto_339791 ) ) ( not ( = ?auto_339790 ?auto_339792 ) ) ( not ( = ?auto_339790 ?auto_339793 ) ) ( not ( = ?auto_339790 ?auto_339794 ) ) ( not ( = ?auto_339790 ?auto_339795 ) ) ( not ( = ?auto_339791 ?auto_339792 ) ) ( not ( = ?auto_339791 ?auto_339793 ) ) ( not ( = ?auto_339791 ?auto_339794 ) ) ( not ( = ?auto_339791 ?auto_339795 ) ) ( not ( = ?auto_339792 ?auto_339793 ) ) ( not ( = ?auto_339792 ?auto_339794 ) ) ( not ( = ?auto_339792 ?auto_339795 ) ) ( not ( = ?auto_339793 ?auto_339794 ) ) ( not ( = ?auto_339793 ?auto_339795 ) ) ( not ( = ?auto_339794 ?auto_339795 ) ) ( ON ?auto_339793 ?auto_339794 ) ( ON ?auto_339792 ?auto_339793 ) ( ON ?auto_339791 ?auto_339792 ) ( ON ?auto_339790 ?auto_339791 ) ( ON ?auto_339789 ?auto_339790 ) ( ON ?auto_339788 ?auto_339789 ) ( CLEAR ?auto_339788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339788 )
      ( MAKE-7PILE ?auto_339788 ?auto_339789 ?auto_339790 ?auto_339791 ?auto_339792 ?auto_339793 ?auto_339794 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339819 - BLOCK
      ?auto_339820 - BLOCK
      ?auto_339821 - BLOCK
      ?auto_339822 - BLOCK
      ?auto_339823 - BLOCK
      ?auto_339824 - BLOCK
      ?auto_339825 - BLOCK
      ?auto_339826 - BLOCK
    )
    :vars
    (
      ?auto_339827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_339825 ) ( ON ?auto_339826 ?auto_339827 ) ( CLEAR ?auto_339826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_339819 ) ( ON ?auto_339820 ?auto_339819 ) ( ON ?auto_339821 ?auto_339820 ) ( ON ?auto_339822 ?auto_339821 ) ( ON ?auto_339823 ?auto_339822 ) ( ON ?auto_339824 ?auto_339823 ) ( ON ?auto_339825 ?auto_339824 ) ( not ( = ?auto_339819 ?auto_339820 ) ) ( not ( = ?auto_339819 ?auto_339821 ) ) ( not ( = ?auto_339819 ?auto_339822 ) ) ( not ( = ?auto_339819 ?auto_339823 ) ) ( not ( = ?auto_339819 ?auto_339824 ) ) ( not ( = ?auto_339819 ?auto_339825 ) ) ( not ( = ?auto_339819 ?auto_339826 ) ) ( not ( = ?auto_339819 ?auto_339827 ) ) ( not ( = ?auto_339820 ?auto_339821 ) ) ( not ( = ?auto_339820 ?auto_339822 ) ) ( not ( = ?auto_339820 ?auto_339823 ) ) ( not ( = ?auto_339820 ?auto_339824 ) ) ( not ( = ?auto_339820 ?auto_339825 ) ) ( not ( = ?auto_339820 ?auto_339826 ) ) ( not ( = ?auto_339820 ?auto_339827 ) ) ( not ( = ?auto_339821 ?auto_339822 ) ) ( not ( = ?auto_339821 ?auto_339823 ) ) ( not ( = ?auto_339821 ?auto_339824 ) ) ( not ( = ?auto_339821 ?auto_339825 ) ) ( not ( = ?auto_339821 ?auto_339826 ) ) ( not ( = ?auto_339821 ?auto_339827 ) ) ( not ( = ?auto_339822 ?auto_339823 ) ) ( not ( = ?auto_339822 ?auto_339824 ) ) ( not ( = ?auto_339822 ?auto_339825 ) ) ( not ( = ?auto_339822 ?auto_339826 ) ) ( not ( = ?auto_339822 ?auto_339827 ) ) ( not ( = ?auto_339823 ?auto_339824 ) ) ( not ( = ?auto_339823 ?auto_339825 ) ) ( not ( = ?auto_339823 ?auto_339826 ) ) ( not ( = ?auto_339823 ?auto_339827 ) ) ( not ( = ?auto_339824 ?auto_339825 ) ) ( not ( = ?auto_339824 ?auto_339826 ) ) ( not ( = ?auto_339824 ?auto_339827 ) ) ( not ( = ?auto_339825 ?auto_339826 ) ) ( not ( = ?auto_339825 ?auto_339827 ) ) ( not ( = ?auto_339826 ?auto_339827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_339826 ?auto_339827 )
      ( !STACK ?auto_339826 ?auto_339825 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339853 - BLOCK
      ?auto_339854 - BLOCK
      ?auto_339855 - BLOCK
      ?auto_339856 - BLOCK
      ?auto_339857 - BLOCK
      ?auto_339858 - BLOCK
      ?auto_339859 - BLOCK
      ?auto_339860 - BLOCK
    )
    :vars
    (
      ?auto_339861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339860 ?auto_339861 ) ( ON-TABLE ?auto_339853 ) ( ON ?auto_339854 ?auto_339853 ) ( ON ?auto_339855 ?auto_339854 ) ( ON ?auto_339856 ?auto_339855 ) ( ON ?auto_339857 ?auto_339856 ) ( ON ?auto_339858 ?auto_339857 ) ( not ( = ?auto_339853 ?auto_339854 ) ) ( not ( = ?auto_339853 ?auto_339855 ) ) ( not ( = ?auto_339853 ?auto_339856 ) ) ( not ( = ?auto_339853 ?auto_339857 ) ) ( not ( = ?auto_339853 ?auto_339858 ) ) ( not ( = ?auto_339853 ?auto_339859 ) ) ( not ( = ?auto_339853 ?auto_339860 ) ) ( not ( = ?auto_339853 ?auto_339861 ) ) ( not ( = ?auto_339854 ?auto_339855 ) ) ( not ( = ?auto_339854 ?auto_339856 ) ) ( not ( = ?auto_339854 ?auto_339857 ) ) ( not ( = ?auto_339854 ?auto_339858 ) ) ( not ( = ?auto_339854 ?auto_339859 ) ) ( not ( = ?auto_339854 ?auto_339860 ) ) ( not ( = ?auto_339854 ?auto_339861 ) ) ( not ( = ?auto_339855 ?auto_339856 ) ) ( not ( = ?auto_339855 ?auto_339857 ) ) ( not ( = ?auto_339855 ?auto_339858 ) ) ( not ( = ?auto_339855 ?auto_339859 ) ) ( not ( = ?auto_339855 ?auto_339860 ) ) ( not ( = ?auto_339855 ?auto_339861 ) ) ( not ( = ?auto_339856 ?auto_339857 ) ) ( not ( = ?auto_339856 ?auto_339858 ) ) ( not ( = ?auto_339856 ?auto_339859 ) ) ( not ( = ?auto_339856 ?auto_339860 ) ) ( not ( = ?auto_339856 ?auto_339861 ) ) ( not ( = ?auto_339857 ?auto_339858 ) ) ( not ( = ?auto_339857 ?auto_339859 ) ) ( not ( = ?auto_339857 ?auto_339860 ) ) ( not ( = ?auto_339857 ?auto_339861 ) ) ( not ( = ?auto_339858 ?auto_339859 ) ) ( not ( = ?auto_339858 ?auto_339860 ) ) ( not ( = ?auto_339858 ?auto_339861 ) ) ( not ( = ?auto_339859 ?auto_339860 ) ) ( not ( = ?auto_339859 ?auto_339861 ) ) ( not ( = ?auto_339860 ?auto_339861 ) ) ( CLEAR ?auto_339858 ) ( ON ?auto_339859 ?auto_339860 ) ( CLEAR ?auto_339859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_339853 ?auto_339854 ?auto_339855 ?auto_339856 ?auto_339857 ?auto_339858 ?auto_339859 )
      ( MAKE-8PILE ?auto_339853 ?auto_339854 ?auto_339855 ?auto_339856 ?auto_339857 ?auto_339858 ?auto_339859 ?auto_339860 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339887 - BLOCK
      ?auto_339888 - BLOCK
      ?auto_339889 - BLOCK
      ?auto_339890 - BLOCK
      ?auto_339891 - BLOCK
      ?auto_339892 - BLOCK
      ?auto_339893 - BLOCK
      ?auto_339894 - BLOCK
    )
    :vars
    (
      ?auto_339895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339894 ?auto_339895 ) ( ON-TABLE ?auto_339887 ) ( ON ?auto_339888 ?auto_339887 ) ( ON ?auto_339889 ?auto_339888 ) ( ON ?auto_339890 ?auto_339889 ) ( ON ?auto_339891 ?auto_339890 ) ( not ( = ?auto_339887 ?auto_339888 ) ) ( not ( = ?auto_339887 ?auto_339889 ) ) ( not ( = ?auto_339887 ?auto_339890 ) ) ( not ( = ?auto_339887 ?auto_339891 ) ) ( not ( = ?auto_339887 ?auto_339892 ) ) ( not ( = ?auto_339887 ?auto_339893 ) ) ( not ( = ?auto_339887 ?auto_339894 ) ) ( not ( = ?auto_339887 ?auto_339895 ) ) ( not ( = ?auto_339888 ?auto_339889 ) ) ( not ( = ?auto_339888 ?auto_339890 ) ) ( not ( = ?auto_339888 ?auto_339891 ) ) ( not ( = ?auto_339888 ?auto_339892 ) ) ( not ( = ?auto_339888 ?auto_339893 ) ) ( not ( = ?auto_339888 ?auto_339894 ) ) ( not ( = ?auto_339888 ?auto_339895 ) ) ( not ( = ?auto_339889 ?auto_339890 ) ) ( not ( = ?auto_339889 ?auto_339891 ) ) ( not ( = ?auto_339889 ?auto_339892 ) ) ( not ( = ?auto_339889 ?auto_339893 ) ) ( not ( = ?auto_339889 ?auto_339894 ) ) ( not ( = ?auto_339889 ?auto_339895 ) ) ( not ( = ?auto_339890 ?auto_339891 ) ) ( not ( = ?auto_339890 ?auto_339892 ) ) ( not ( = ?auto_339890 ?auto_339893 ) ) ( not ( = ?auto_339890 ?auto_339894 ) ) ( not ( = ?auto_339890 ?auto_339895 ) ) ( not ( = ?auto_339891 ?auto_339892 ) ) ( not ( = ?auto_339891 ?auto_339893 ) ) ( not ( = ?auto_339891 ?auto_339894 ) ) ( not ( = ?auto_339891 ?auto_339895 ) ) ( not ( = ?auto_339892 ?auto_339893 ) ) ( not ( = ?auto_339892 ?auto_339894 ) ) ( not ( = ?auto_339892 ?auto_339895 ) ) ( not ( = ?auto_339893 ?auto_339894 ) ) ( not ( = ?auto_339893 ?auto_339895 ) ) ( not ( = ?auto_339894 ?auto_339895 ) ) ( ON ?auto_339893 ?auto_339894 ) ( CLEAR ?auto_339891 ) ( ON ?auto_339892 ?auto_339893 ) ( CLEAR ?auto_339892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_339887 ?auto_339888 ?auto_339889 ?auto_339890 ?auto_339891 ?auto_339892 )
      ( MAKE-8PILE ?auto_339887 ?auto_339888 ?auto_339889 ?auto_339890 ?auto_339891 ?auto_339892 ?auto_339893 ?auto_339894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339921 - BLOCK
      ?auto_339922 - BLOCK
      ?auto_339923 - BLOCK
      ?auto_339924 - BLOCK
      ?auto_339925 - BLOCK
      ?auto_339926 - BLOCK
      ?auto_339927 - BLOCK
      ?auto_339928 - BLOCK
    )
    :vars
    (
      ?auto_339929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339928 ?auto_339929 ) ( ON-TABLE ?auto_339921 ) ( ON ?auto_339922 ?auto_339921 ) ( ON ?auto_339923 ?auto_339922 ) ( ON ?auto_339924 ?auto_339923 ) ( not ( = ?auto_339921 ?auto_339922 ) ) ( not ( = ?auto_339921 ?auto_339923 ) ) ( not ( = ?auto_339921 ?auto_339924 ) ) ( not ( = ?auto_339921 ?auto_339925 ) ) ( not ( = ?auto_339921 ?auto_339926 ) ) ( not ( = ?auto_339921 ?auto_339927 ) ) ( not ( = ?auto_339921 ?auto_339928 ) ) ( not ( = ?auto_339921 ?auto_339929 ) ) ( not ( = ?auto_339922 ?auto_339923 ) ) ( not ( = ?auto_339922 ?auto_339924 ) ) ( not ( = ?auto_339922 ?auto_339925 ) ) ( not ( = ?auto_339922 ?auto_339926 ) ) ( not ( = ?auto_339922 ?auto_339927 ) ) ( not ( = ?auto_339922 ?auto_339928 ) ) ( not ( = ?auto_339922 ?auto_339929 ) ) ( not ( = ?auto_339923 ?auto_339924 ) ) ( not ( = ?auto_339923 ?auto_339925 ) ) ( not ( = ?auto_339923 ?auto_339926 ) ) ( not ( = ?auto_339923 ?auto_339927 ) ) ( not ( = ?auto_339923 ?auto_339928 ) ) ( not ( = ?auto_339923 ?auto_339929 ) ) ( not ( = ?auto_339924 ?auto_339925 ) ) ( not ( = ?auto_339924 ?auto_339926 ) ) ( not ( = ?auto_339924 ?auto_339927 ) ) ( not ( = ?auto_339924 ?auto_339928 ) ) ( not ( = ?auto_339924 ?auto_339929 ) ) ( not ( = ?auto_339925 ?auto_339926 ) ) ( not ( = ?auto_339925 ?auto_339927 ) ) ( not ( = ?auto_339925 ?auto_339928 ) ) ( not ( = ?auto_339925 ?auto_339929 ) ) ( not ( = ?auto_339926 ?auto_339927 ) ) ( not ( = ?auto_339926 ?auto_339928 ) ) ( not ( = ?auto_339926 ?auto_339929 ) ) ( not ( = ?auto_339927 ?auto_339928 ) ) ( not ( = ?auto_339927 ?auto_339929 ) ) ( not ( = ?auto_339928 ?auto_339929 ) ) ( ON ?auto_339927 ?auto_339928 ) ( ON ?auto_339926 ?auto_339927 ) ( CLEAR ?auto_339924 ) ( ON ?auto_339925 ?auto_339926 ) ( CLEAR ?auto_339925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_339921 ?auto_339922 ?auto_339923 ?auto_339924 ?auto_339925 )
      ( MAKE-8PILE ?auto_339921 ?auto_339922 ?auto_339923 ?auto_339924 ?auto_339925 ?auto_339926 ?auto_339927 ?auto_339928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339955 - BLOCK
      ?auto_339956 - BLOCK
      ?auto_339957 - BLOCK
      ?auto_339958 - BLOCK
      ?auto_339959 - BLOCK
      ?auto_339960 - BLOCK
      ?auto_339961 - BLOCK
      ?auto_339962 - BLOCK
    )
    :vars
    (
      ?auto_339963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339962 ?auto_339963 ) ( ON-TABLE ?auto_339955 ) ( ON ?auto_339956 ?auto_339955 ) ( ON ?auto_339957 ?auto_339956 ) ( not ( = ?auto_339955 ?auto_339956 ) ) ( not ( = ?auto_339955 ?auto_339957 ) ) ( not ( = ?auto_339955 ?auto_339958 ) ) ( not ( = ?auto_339955 ?auto_339959 ) ) ( not ( = ?auto_339955 ?auto_339960 ) ) ( not ( = ?auto_339955 ?auto_339961 ) ) ( not ( = ?auto_339955 ?auto_339962 ) ) ( not ( = ?auto_339955 ?auto_339963 ) ) ( not ( = ?auto_339956 ?auto_339957 ) ) ( not ( = ?auto_339956 ?auto_339958 ) ) ( not ( = ?auto_339956 ?auto_339959 ) ) ( not ( = ?auto_339956 ?auto_339960 ) ) ( not ( = ?auto_339956 ?auto_339961 ) ) ( not ( = ?auto_339956 ?auto_339962 ) ) ( not ( = ?auto_339956 ?auto_339963 ) ) ( not ( = ?auto_339957 ?auto_339958 ) ) ( not ( = ?auto_339957 ?auto_339959 ) ) ( not ( = ?auto_339957 ?auto_339960 ) ) ( not ( = ?auto_339957 ?auto_339961 ) ) ( not ( = ?auto_339957 ?auto_339962 ) ) ( not ( = ?auto_339957 ?auto_339963 ) ) ( not ( = ?auto_339958 ?auto_339959 ) ) ( not ( = ?auto_339958 ?auto_339960 ) ) ( not ( = ?auto_339958 ?auto_339961 ) ) ( not ( = ?auto_339958 ?auto_339962 ) ) ( not ( = ?auto_339958 ?auto_339963 ) ) ( not ( = ?auto_339959 ?auto_339960 ) ) ( not ( = ?auto_339959 ?auto_339961 ) ) ( not ( = ?auto_339959 ?auto_339962 ) ) ( not ( = ?auto_339959 ?auto_339963 ) ) ( not ( = ?auto_339960 ?auto_339961 ) ) ( not ( = ?auto_339960 ?auto_339962 ) ) ( not ( = ?auto_339960 ?auto_339963 ) ) ( not ( = ?auto_339961 ?auto_339962 ) ) ( not ( = ?auto_339961 ?auto_339963 ) ) ( not ( = ?auto_339962 ?auto_339963 ) ) ( ON ?auto_339961 ?auto_339962 ) ( ON ?auto_339960 ?auto_339961 ) ( ON ?auto_339959 ?auto_339960 ) ( CLEAR ?auto_339957 ) ( ON ?auto_339958 ?auto_339959 ) ( CLEAR ?auto_339958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_339955 ?auto_339956 ?auto_339957 ?auto_339958 )
      ( MAKE-8PILE ?auto_339955 ?auto_339956 ?auto_339957 ?auto_339958 ?auto_339959 ?auto_339960 ?auto_339961 ?auto_339962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_339989 - BLOCK
      ?auto_339990 - BLOCK
      ?auto_339991 - BLOCK
      ?auto_339992 - BLOCK
      ?auto_339993 - BLOCK
      ?auto_339994 - BLOCK
      ?auto_339995 - BLOCK
      ?auto_339996 - BLOCK
    )
    :vars
    (
      ?auto_339997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339996 ?auto_339997 ) ( ON-TABLE ?auto_339989 ) ( ON ?auto_339990 ?auto_339989 ) ( not ( = ?auto_339989 ?auto_339990 ) ) ( not ( = ?auto_339989 ?auto_339991 ) ) ( not ( = ?auto_339989 ?auto_339992 ) ) ( not ( = ?auto_339989 ?auto_339993 ) ) ( not ( = ?auto_339989 ?auto_339994 ) ) ( not ( = ?auto_339989 ?auto_339995 ) ) ( not ( = ?auto_339989 ?auto_339996 ) ) ( not ( = ?auto_339989 ?auto_339997 ) ) ( not ( = ?auto_339990 ?auto_339991 ) ) ( not ( = ?auto_339990 ?auto_339992 ) ) ( not ( = ?auto_339990 ?auto_339993 ) ) ( not ( = ?auto_339990 ?auto_339994 ) ) ( not ( = ?auto_339990 ?auto_339995 ) ) ( not ( = ?auto_339990 ?auto_339996 ) ) ( not ( = ?auto_339990 ?auto_339997 ) ) ( not ( = ?auto_339991 ?auto_339992 ) ) ( not ( = ?auto_339991 ?auto_339993 ) ) ( not ( = ?auto_339991 ?auto_339994 ) ) ( not ( = ?auto_339991 ?auto_339995 ) ) ( not ( = ?auto_339991 ?auto_339996 ) ) ( not ( = ?auto_339991 ?auto_339997 ) ) ( not ( = ?auto_339992 ?auto_339993 ) ) ( not ( = ?auto_339992 ?auto_339994 ) ) ( not ( = ?auto_339992 ?auto_339995 ) ) ( not ( = ?auto_339992 ?auto_339996 ) ) ( not ( = ?auto_339992 ?auto_339997 ) ) ( not ( = ?auto_339993 ?auto_339994 ) ) ( not ( = ?auto_339993 ?auto_339995 ) ) ( not ( = ?auto_339993 ?auto_339996 ) ) ( not ( = ?auto_339993 ?auto_339997 ) ) ( not ( = ?auto_339994 ?auto_339995 ) ) ( not ( = ?auto_339994 ?auto_339996 ) ) ( not ( = ?auto_339994 ?auto_339997 ) ) ( not ( = ?auto_339995 ?auto_339996 ) ) ( not ( = ?auto_339995 ?auto_339997 ) ) ( not ( = ?auto_339996 ?auto_339997 ) ) ( ON ?auto_339995 ?auto_339996 ) ( ON ?auto_339994 ?auto_339995 ) ( ON ?auto_339993 ?auto_339994 ) ( ON ?auto_339992 ?auto_339993 ) ( CLEAR ?auto_339990 ) ( ON ?auto_339991 ?auto_339992 ) ( CLEAR ?auto_339991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339989 ?auto_339990 ?auto_339991 )
      ( MAKE-8PILE ?auto_339989 ?auto_339990 ?auto_339991 ?auto_339992 ?auto_339993 ?auto_339994 ?auto_339995 ?auto_339996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_340023 - BLOCK
      ?auto_340024 - BLOCK
      ?auto_340025 - BLOCK
      ?auto_340026 - BLOCK
      ?auto_340027 - BLOCK
      ?auto_340028 - BLOCK
      ?auto_340029 - BLOCK
      ?auto_340030 - BLOCK
    )
    :vars
    (
      ?auto_340031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340030 ?auto_340031 ) ( ON-TABLE ?auto_340023 ) ( not ( = ?auto_340023 ?auto_340024 ) ) ( not ( = ?auto_340023 ?auto_340025 ) ) ( not ( = ?auto_340023 ?auto_340026 ) ) ( not ( = ?auto_340023 ?auto_340027 ) ) ( not ( = ?auto_340023 ?auto_340028 ) ) ( not ( = ?auto_340023 ?auto_340029 ) ) ( not ( = ?auto_340023 ?auto_340030 ) ) ( not ( = ?auto_340023 ?auto_340031 ) ) ( not ( = ?auto_340024 ?auto_340025 ) ) ( not ( = ?auto_340024 ?auto_340026 ) ) ( not ( = ?auto_340024 ?auto_340027 ) ) ( not ( = ?auto_340024 ?auto_340028 ) ) ( not ( = ?auto_340024 ?auto_340029 ) ) ( not ( = ?auto_340024 ?auto_340030 ) ) ( not ( = ?auto_340024 ?auto_340031 ) ) ( not ( = ?auto_340025 ?auto_340026 ) ) ( not ( = ?auto_340025 ?auto_340027 ) ) ( not ( = ?auto_340025 ?auto_340028 ) ) ( not ( = ?auto_340025 ?auto_340029 ) ) ( not ( = ?auto_340025 ?auto_340030 ) ) ( not ( = ?auto_340025 ?auto_340031 ) ) ( not ( = ?auto_340026 ?auto_340027 ) ) ( not ( = ?auto_340026 ?auto_340028 ) ) ( not ( = ?auto_340026 ?auto_340029 ) ) ( not ( = ?auto_340026 ?auto_340030 ) ) ( not ( = ?auto_340026 ?auto_340031 ) ) ( not ( = ?auto_340027 ?auto_340028 ) ) ( not ( = ?auto_340027 ?auto_340029 ) ) ( not ( = ?auto_340027 ?auto_340030 ) ) ( not ( = ?auto_340027 ?auto_340031 ) ) ( not ( = ?auto_340028 ?auto_340029 ) ) ( not ( = ?auto_340028 ?auto_340030 ) ) ( not ( = ?auto_340028 ?auto_340031 ) ) ( not ( = ?auto_340029 ?auto_340030 ) ) ( not ( = ?auto_340029 ?auto_340031 ) ) ( not ( = ?auto_340030 ?auto_340031 ) ) ( ON ?auto_340029 ?auto_340030 ) ( ON ?auto_340028 ?auto_340029 ) ( ON ?auto_340027 ?auto_340028 ) ( ON ?auto_340026 ?auto_340027 ) ( ON ?auto_340025 ?auto_340026 ) ( CLEAR ?auto_340023 ) ( ON ?auto_340024 ?auto_340025 ) ( CLEAR ?auto_340024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_340023 ?auto_340024 )
      ( MAKE-8PILE ?auto_340023 ?auto_340024 ?auto_340025 ?auto_340026 ?auto_340027 ?auto_340028 ?auto_340029 ?auto_340030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_340057 - BLOCK
      ?auto_340058 - BLOCK
      ?auto_340059 - BLOCK
      ?auto_340060 - BLOCK
      ?auto_340061 - BLOCK
      ?auto_340062 - BLOCK
      ?auto_340063 - BLOCK
      ?auto_340064 - BLOCK
    )
    :vars
    (
      ?auto_340065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340064 ?auto_340065 ) ( not ( = ?auto_340057 ?auto_340058 ) ) ( not ( = ?auto_340057 ?auto_340059 ) ) ( not ( = ?auto_340057 ?auto_340060 ) ) ( not ( = ?auto_340057 ?auto_340061 ) ) ( not ( = ?auto_340057 ?auto_340062 ) ) ( not ( = ?auto_340057 ?auto_340063 ) ) ( not ( = ?auto_340057 ?auto_340064 ) ) ( not ( = ?auto_340057 ?auto_340065 ) ) ( not ( = ?auto_340058 ?auto_340059 ) ) ( not ( = ?auto_340058 ?auto_340060 ) ) ( not ( = ?auto_340058 ?auto_340061 ) ) ( not ( = ?auto_340058 ?auto_340062 ) ) ( not ( = ?auto_340058 ?auto_340063 ) ) ( not ( = ?auto_340058 ?auto_340064 ) ) ( not ( = ?auto_340058 ?auto_340065 ) ) ( not ( = ?auto_340059 ?auto_340060 ) ) ( not ( = ?auto_340059 ?auto_340061 ) ) ( not ( = ?auto_340059 ?auto_340062 ) ) ( not ( = ?auto_340059 ?auto_340063 ) ) ( not ( = ?auto_340059 ?auto_340064 ) ) ( not ( = ?auto_340059 ?auto_340065 ) ) ( not ( = ?auto_340060 ?auto_340061 ) ) ( not ( = ?auto_340060 ?auto_340062 ) ) ( not ( = ?auto_340060 ?auto_340063 ) ) ( not ( = ?auto_340060 ?auto_340064 ) ) ( not ( = ?auto_340060 ?auto_340065 ) ) ( not ( = ?auto_340061 ?auto_340062 ) ) ( not ( = ?auto_340061 ?auto_340063 ) ) ( not ( = ?auto_340061 ?auto_340064 ) ) ( not ( = ?auto_340061 ?auto_340065 ) ) ( not ( = ?auto_340062 ?auto_340063 ) ) ( not ( = ?auto_340062 ?auto_340064 ) ) ( not ( = ?auto_340062 ?auto_340065 ) ) ( not ( = ?auto_340063 ?auto_340064 ) ) ( not ( = ?auto_340063 ?auto_340065 ) ) ( not ( = ?auto_340064 ?auto_340065 ) ) ( ON ?auto_340063 ?auto_340064 ) ( ON ?auto_340062 ?auto_340063 ) ( ON ?auto_340061 ?auto_340062 ) ( ON ?auto_340060 ?auto_340061 ) ( ON ?auto_340059 ?auto_340060 ) ( ON ?auto_340058 ?auto_340059 ) ( ON ?auto_340057 ?auto_340058 ) ( CLEAR ?auto_340057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_340057 )
      ( MAKE-8PILE ?auto_340057 ?auto_340058 ?auto_340059 ?auto_340060 ?auto_340061 ?auto_340062 ?auto_340063 ?auto_340064 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340092 - BLOCK
      ?auto_340093 - BLOCK
      ?auto_340094 - BLOCK
      ?auto_340095 - BLOCK
      ?auto_340096 - BLOCK
      ?auto_340097 - BLOCK
      ?auto_340098 - BLOCK
      ?auto_340099 - BLOCK
      ?auto_340100 - BLOCK
    )
    :vars
    (
      ?auto_340101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_340099 ) ( ON ?auto_340100 ?auto_340101 ) ( CLEAR ?auto_340100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_340092 ) ( ON ?auto_340093 ?auto_340092 ) ( ON ?auto_340094 ?auto_340093 ) ( ON ?auto_340095 ?auto_340094 ) ( ON ?auto_340096 ?auto_340095 ) ( ON ?auto_340097 ?auto_340096 ) ( ON ?auto_340098 ?auto_340097 ) ( ON ?auto_340099 ?auto_340098 ) ( not ( = ?auto_340092 ?auto_340093 ) ) ( not ( = ?auto_340092 ?auto_340094 ) ) ( not ( = ?auto_340092 ?auto_340095 ) ) ( not ( = ?auto_340092 ?auto_340096 ) ) ( not ( = ?auto_340092 ?auto_340097 ) ) ( not ( = ?auto_340092 ?auto_340098 ) ) ( not ( = ?auto_340092 ?auto_340099 ) ) ( not ( = ?auto_340092 ?auto_340100 ) ) ( not ( = ?auto_340092 ?auto_340101 ) ) ( not ( = ?auto_340093 ?auto_340094 ) ) ( not ( = ?auto_340093 ?auto_340095 ) ) ( not ( = ?auto_340093 ?auto_340096 ) ) ( not ( = ?auto_340093 ?auto_340097 ) ) ( not ( = ?auto_340093 ?auto_340098 ) ) ( not ( = ?auto_340093 ?auto_340099 ) ) ( not ( = ?auto_340093 ?auto_340100 ) ) ( not ( = ?auto_340093 ?auto_340101 ) ) ( not ( = ?auto_340094 ?auto_340095 ) ) ( not ( = ?auto_340094 ?auto_340096 ) ) ( not ( = ?auto_340094 ?auto_340097 ) ) ( not ( = ?auto_340094 ?auto_340098 ) ) ( not ( = ?auto_340094 ?auto_340099 ) ) ( not ( = ?auto_340094 ?auto_340100 ) ) ( not ( = ?auto_340094 ?auto_340101 ) ) ( not ( = ?auto_340095 ?auto_340096 ) ) ( not ( = ?auto_340095 ?auto_340097 ) ) ( not ( = ?auto_340095 ?auto_340098 ) ) ( not ( = ?auto_340095 ?auto_340099 ) ) ( not ( = ?auto_340095 ?auto_340100 ) ) ( not ( = ?auto_340095 ?auto_340101 ) ) ( not ( = ?auto_340096 ?auto_340097 ) ) ( not ( = ?auto_340096 ?auto_340098 ) ) ( not ( = ?auto_340096 ?auto_340099 ) ) ( not ( = ?auto_340096 ?auto_340100 ) ) ( not ( = ?auto_340096 ?auto_340101 ) ) ( not ( = ?auto_340097 ?auto_340098 ) ) ( not ( = ?auto_340097 ?auto_340099 ) ) ( not ( = ?auto_340097 ?auto_340100 ) ) ( not ( = ?auto_340097 ?auto_340101 ) ) ( not ( = ?auto_340098 ?auto_340099 ) ) ( not ( = ?auto_340098 ?auto_340100 ) ) ( not ( = ?auto_340098 ?auto_340101 ) ) ( not ( = ?auto_340099 ?auto_340100 ) ) ( not ( = ?auto_340099 ?auto_340101 ) ) ( not ( = ?auto_340100 ?auto_340101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_340100 ?auto_340101 )
      ( !STACK ?auto_340100 ?auto_340099 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340130 - BLOCK
      ?auto_340131 - BLOCK
      ?auto_340132 - BLOCK
      ?auto_340133 - BLOCK
      ?auto_340134 - BLOCK
      ?auto_340135 - BLOCK
      ?auto_340136 - BLOCK
      ?auto_340137 - BLOCK
      ?auto_340138 - BLOCK
    )
    :vars
    (
      ?auto_340139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340138 ?auto_340139 ) ( ON-TABLE ?auto_340130 ) ( ON ?auto_340131 ?auto_340130 ) ( ON ?auto_340132 ?auto_340131 ) ( ON ?auto_340133 ?auto_340132 ) ( ON ?auto_340134 ?auto_340133 ) ( ON ?auto_340135 ?auto_340134 ) ( ON ?auto_340136 ?auto_340135 ) ( not ( = ?auto_340130 ?auto_340131 ) ) ( not ( = ?auto_340130 ?auto_340132 ) ) ( not ( = ?auto_340130 ?auto_340133 ) ) ( not ( = ?auto_340130 ?auto_340134 ) ) ( not ( = ?auto_340130 ?auto_340135 ) ) ( not ( = ?auto_340130 ?auto_340136 ) ) ( not ( = ?auto_340130 ?auto_340137 ) ) ( not ( = ?auto_340130 ?auto_340138 ) ) ( not ( = ?auto_340130 ?auto_340139 ) ) ( not ( = ?auto_340131 ?auto_340132 ) ) ( not ( = ?auto_340131 ?auto_340133 ) ) ( not ( = ?auto_340131 ?auto_340134 ) ) ( not ( = ?auto_340131 ?auto_340135 ) ) ( not ( = ?auto_340131 ?auto_340136 ) ) ( not ( = ?auto_340131 ?auto_340137 ) ) ( not ( = ?auto_340131 ?auto_340138 ) ) ( not ( = ?auto_340131 ?auto_340139 ) ) ( not ( = ?auto_340132 ?auto_340133 ) ) ( not ( = ?auto_340132 ?auto_340134 ) ) ( not ( = ?auto_340132 ?auto_340135 ) ) ( not ( = ?auto_340132 ?auto_340136 ) ) ( not ( = ?auto_340132 ?auto_340137 ) ) ( not ( = ?auto_340132 ?auto_340138 ) ) ( not ( = ?auto_340132 ?auto_340139 ) ) ( not ( = ?auto_340133 ?auto_340134 ) ) ( not ( = ?auto_340133 ?auto_340135 ) ) ( not ( = ?auto_340133 ?auto_340136 ) ) ( not ( = ?auto_340133 ?auto_340137 ) ) ( not ( = ?auto_340133 ?auto_340138 ) ) ( not ( = ?auto_340133 ?auto_340139 ) ) ( not ( = ?auto_340134 ?auto_340135 ) ) ( not ( = ?auto_340134 ?auto_340136 ) ) ( not ( = ?auto_340134 ?auto_340137 ) ) ( not ( = ?auto_340134 ?auto_340138 ) ) ( not ( = ?auto_340134 ?auto_340139 ) ) ( not ( = ?auto_340135 ?auto_340136 ) ) ( not ( = ?auto_340135 ?auto_340137 ) ) ( not ( = ?auto_340135 ?auto_340138 ) ) ( not ( = ?auto_340135 ?auto_340139 ) ) ( not ( = ?auto_340136 ?auto_340137 ) ) ( not ( = ?auto_340136 ?auto_340138 ) ) ( not ( = ?auto_340136 ?auto_340139 ) ) ( not ( = ?auto_340137 ?auto_340138 ) ) ( not ( = ?auto_340137 ?auto_340139 ) ) ( not ( = ?auto_340138 ?auto_340139 ) ) ( CLEAR ?auto_340136 ) ( ON ?auto_340137 ?auto_340138 ) ( CLEAR ?auto_340137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_340130 ?auto_340131 ?auto_340132 ?auto_340133 ?auto_340134 ?auto_340135 ?auto_340136 ?auto_340137 )
      ( MAKE-9PILE ?auto_340130 ?auto_340131 ?auto_340132 ?auto_340133 ?auto_340134 ?auto_340135 ?auto_340136 ?auto_340137 ?auto_340138 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340168 - BLOCK
      ?auto_340169 - BLOCK
      ?auto_340170 - BLOCK
      ?auto_340171 - BLOCK
      ?auto_340172 - BLOCK
      ?auto_340173 - BLOCK
      ?auto_340174 - BLOCK
      ?auto_340175 - BLOCK
      ?auto_340176 - BLOCK
    )
    :vars
    (
      ?auto_340177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340176 ?auto_340177 ) ( ON-TABLE ?auto_340168 ) ( ON ?auto_340169 ?auto_340168 ) ( ON ?auto_340170 ?auto_340169 ) ( ON ?auto_340171 ?auto_340170 ) ( ON ?auto_340172 ?auto_340171 ) ( ON ?auto_340173 ?auto_340172 ) ( not ( = ?auto_340168 ?auto_340169 ) ) ( not ( = ?auto_340168 ?auto_340170 ) ) ( not ( = ?auto_340168 ?auto_340171 ) ) ( not ( = ?auto_340168 ?auto_340172 ) ) ( not ( = ?auto_340168 ?auto_340173 ) ) ( not ( = ?auto_340168 ?auto_340174 ) ) ( not ( = ?auto_340168 ?auto_340175 ) ) ( not ( = ?auto_340168 ?auto_340176 ) ) ( not ( = ?auto_340168 ?auto_340177 ) ) ( not ( = ?auto_340169 ?auto_340170 ) ) ( not ( = ?auto_340169 ?auto_340171 ) ) ( not ( = ?auto_340169 ?auto_340172 ) ) ( not ( = ?auto_340169 ?auto_340173 ) ) ( not ( = ?auto_340169 ?auto_340174 ) ) ( not ( = ?auto_340169 ?auto_340175 ) ) ( not ( = ?auto_340169 ?auto_340176 ) ) ( not ( = ?auto_340169 ?auto_340177 ) ) ( not ( = ?auto_340170 ?auto_340171 ) ) ( not ( = ?auto_340170 ?auto_340172 ) ) ( not ( = ?auto_340170 ?auto_340173 ) ) ( not ( = ?auto_340170 ?auto_340174 ) ) ( not ( = ?auto_340170 ?auto_340175 ) ) ( not ( = ?auto_340170 ?auto_340176 ) ) ( not ( = ?auto_340170 ?auto_340177 ) ) ( not ( = ?auto_340171 ?auto_340172 ) ) ( not ( = ?auto_340171 ?auto_340173 ) ) ( not ( = ?auto_340171 ?auto_340174 ) ) ( not ( = ?auto_340171 ?auto_340175 ) ) ( not ( = ?auto_340171 ?auto_340176 ) ) ( not ( = ?auto_340171 ?auto_340177 ) ) ( not ( = ?auto_340172 ?auto_340173 ) ) ( not ( = ?auto_340172 ?auto_340174 ) ) ( not ( = ?auto_340172 ?auto_340175 ) ) ( not ( = ?auto_340172 ?auto_340176 ) ) ( not ( = ?auto_340172 ?auto_340177 ) ) ( not ( = ?auto_340173 ?auto_340174 ) ) ( not ( = ?auto_340173 ?auto_340175 ) ) ( not ( = ?auto_340173 ?auto_340176 ) ) ( not ( = ?auto_340173 ?auto_340177 ) ) ( not ( = ?auto_340174 ?auto_340175 ) ) ( not ( = ?auto_340174 ?auto_340176 ) ) ( not ( = ?auto_340174 ?auto_340177 ) ) ( not ( = ?auto_340175 ?auto_340176 ) ) ( not ( = ?auto_340175 ?auto_340177 ) ) ( not ( = ?auto_340176 ?auto_340177 ) ) ( ON ?auto_340175 ?auto_340176 ) ( CLEAR ?auto_340173 ) ( ON ?auto_340174 ?auto_340175 ) ( CLEAR ?auto_340174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_340168 ?auto_340169 ?auto_340170 ?auto_340171 ?auto_340172 ?auto_340173 ?auto_340174 )
      ( MAKE-9PILE ?auto_340168 ?auto_340169 ?auto_340170 ?auto_340171 ?auto_340172 ?auto_340173 ?auto_340174 ?auto_340175 ?auto_340176 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340206 - BLOCK
      ?auto_340207 - BLOCK
      ?auto_340208 - BLOCK
      ?auto_340209 - BLOCK
      ?auto_340210 - BLOCK
      ?auto_340211 - BLOCK
      ?auto_340212 - BLOCK
      ?auto_340213 - BLOCK
      ?auto_340214 - BLOCK
    )
    :vars
    (
      ?auto_340215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340214 ?auto_340215 ) ( ON-TABLE ?auto_340206 ) ( ON ?auto_340207 ?auto_340206 ) ( ON ?auto_340208 ?auto_340207 ) ( ON ?auto_340209 ?auto_340208 ) ( ON ?auto_340210 ?auto_340209 ) ( not ( = ?auto_340206 ?auto_340207 ) ) ( not ( = ?auto_340206 ?auto_340208 ) ) ( not ( = ?auto_340206 ?auto_340209 ) ) ( not ( = ?auto_340206 ?auto_340210 ) ) ( not ( = ?auto_340206 ?auto_340211 ) ) ( not ( = ?auto_340206 ?auto_340212 ) ) ( not ( = ?auto_340206 ?auto_340213 ) ) ( not ( = ?auto_340206 ?auto_340214 ) ) ( not ( = ?auto_340206 ?auto_340215 ) ) ( not ( = ?auto_340207 ?auto_340208 ) ) ( not ( = ?auto_340207 ?auto_340209 ) ) ( not ( = ?auto_340207 ?auto_340210 ) ) ( not ( = ?auto_340207 ?auto_340211 ) ) ( not ( = ?auto_340207 ?auto_340212 ) ) ( not ( = ?auto_340207 ?auto_340213 ) ) ( not ( = ?auto_340207 ?auto_340214 ) ) ( not ( = ?auto_340207 ?auto_340215 ) ) ( not ( = ?auto_340208 ?auto_340209 ) ) ( not ( = ?auto_340208 ?auto_340210 ) ) ( not ( = ?auto_340208 ?auto_340211 ) ) ( not ( = ?auto_340208 ?auto_340212 ) ) ( not ( = ?auto_340208 ?auto_340213 ) ) ( not ( = ?auto_340208 ?auto_340214 ) ) ( not ( = ?auto_340208 ?auto_340215 ) ) ( not ( = ?auto_340209 ?auto_340210 ) ) ( not ( = ?auto_340209 ?auto_340211 ) ) ( not ( = ?auto_340209 ?auto_340212 ) ) ( not ( = ?auto_340209 ?auto_340213 ) ) ( not ( = ?auto_340209 ?auto_340214 ) ) ( not ( = ?auto_340209 ?auto_340215 ) ) ( not ( = ?auto_340210 ?auto_340211 ) ) ( not ( = ?auto_340210 ?auto_340212 ) ) ( not ( = ?auto_340210 ?auto_340213 ) ) ( not ( = ?auto_340210 ?auto_340214 ) ) ( not ( = ?auto_340210 ?auto_340215 ) ) ( not ( = ?auto_340211 ?auto_340212 ) ) ( not ( = ?auto_340211 ?auto_340213 ) ) ( not ( = ?auto_340211 ?auto_340214 ) ) ( not ( = ?auto_340211 ?auto_340215 ) ) ( not ( = ?auto_340212 ?auto_340213 ) ) ( not ( = ?auto_340212 ?auto_340214 ) ) ( not ( = ?auto_340212 ?auto_340215 ) ) ( not ( = ?auto_340213 ?auto_340214 ) ) ( not ( = ?auto_340213 ?auto_340215 ) ) ( not ( = ?auto_340214 ?auto_340215 ) ) ( ON ?auto_340213 ?auto_340214 ) ( ON ?auto_340212 ?auto_340213 ) ( CLEAR ?auto_340210 ) ( ON ?auto_340211 ?auto_340212 ) ( CLEAR ?auto_340211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_340206 ?auto_340207 ?auto_340208 ?auto_340209 ?auto_340210 ?auto_340211 )
      ( MAKE-9PILE ?auto_340206 ?auto_340207 ?auto_340208 ?auto_340209 ?auto_340210 ?auto_340211 ?auto_340212 ?auto_340213 ?auto_340214 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340244 - BLOCK
      ?auto_340245 - BLOCK
      ?auto_340246 - BLOCK
      ?auto_340247 - BLOCK
      ?auto_340248 - BLOCK
      ?auto_340249 - BLOCK
      ?auto_340250 - BLOCK
      ?auto_340251 - BLOCK
      ?auto_340252 - BLOCK
    )
    :vars
    (
      ?auto_340253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340252 ?auto_340253 ) ( ON-TABLE ?auto_340244 ) ( ON ?auto_340245 ?auto_340244 ) ( ON ?auto_340246 ?auto_340245 ) ( ON ?auto_340247 ?auto_340246 ) ( not ( = ?auto_340244 ?auto_340245 ) ) ( not ( = ?auto_340244 ?auto_340246 ) ) ( not ( = ?auto_340244 ?auto_340247 ) ) ( not ( = ?auto_340244 ?auto_340248 ) ) ( not ( = ?auto_340244 ?auto_340249 ) ) ( not ( = ?auto_340244 ?auto_340250 ) ) ( not ( = ?auto_340244 ?auto_340251 ) ) ( not ( = ?auto_340244 ?auto_340252 ) ) ( not ( = ?auto_340244 ?auto_340253 ) ) ( not ( = ?auto_340245 ?auto_340246 ) ) ( not ( = ?auto_340245 ?auto_340247 ) ) ( not ( = ?auto_340245 ?auto_340248 ) ) ( not ( = ?auto_340245 ?auto_340249 ) ) ( not ( = ?auto_340245 ?auto_340250 ) ) ( not ( = ?auto_340245 ?auto_340251 ) ) ( not ( = ?auto_340245 ?auto_340252 ) ) ( not ( = ?auto_340245 ?auto_340253 ) ) ( not ( = ?auto_340246 ?auto_340247 ) ) ( not ( = ?auto_340246 ?auto_340248 ) ) ( not ( = ?auto_340246 ?auto_340249 ) ) ( not ( = ?auto_340246 ?auto_340250 ) ) ( not ( = ?auto_340246 ?auto_340251 ) ) ( not ( = ?auto_340246 ?auto_340252 ) ) ( not ( = ?auto_340246 ?auto_340253 ) ) ( not ( = ?auto_340247 ?auto_340248 ) ) ( not ( = ?auto_340247 ?auto_340249 ) ) ( not ( = ?auto_340247 ?auto_340250 ) ) ( not ( = ?auto_340247 ?auto_340251 ) ) ( not ( = ?auto_340247 ?auto_340252 ) ) ( not ( = ?auto_340247 ?auto_340253 ) ) ( not ( = ?auto_340248 ?auto_340249 ) ) ( not ( = ?auto_340248 ?auto_340250 ) ) ( not ( = ?auto_340248 ?auto_340251 ) ) ( not ( = ?auto_340248 ?auto_340252 ) ) ( not ( = ?auto_340248 ?auto_340253 ) ) ( not ( = ?auto_340249 ?auto_340250 ) ) ( not ( = ?auto_340249 ?auto_340251 ) ) ( not ( = ?auto_340249 ?auto_340252 ) ) ( not ( = ?auto_340249 ?auto_340253 ) ) ( not ( = ?auto_340250 ?auto_340251 ) ) ( not ( = ?auto_340250 ?auto_340252 ) ) ( not ( = ?auto_340250 ?auto_340253 ) ) ( not ( = ?auto_340251 ?auto_340252 ) ) ( not ( = ?auto_340251 ?auto_340253 ) ) ( not ( = ?auto_340252 ?auto_340253 ) ) ( ON ?auto_340251 ?auto_340252 ) ( ON ?auto_340250 ?auto_340251 ) ( ON ?auto_340249 ?auto_340250 ) ( CLEAR ?auto_340247 ) ( ON ?auto_340248 ?auto_340249 ) ( CLEAR ?auto_340248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_340244 ?auto_340245 ?auto_340246 ?auto_340247 ?auto_340248 )
      ( MAKE-9PILE ?auto_340244 ?auto_340245 ?auto_340246 ?auto_340247 ?auto_340248 ?auto_340249 ?auto_340250 ?auto_340251 ?auto_340252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340282 - BLOCK
      ?auto_340283 - BLOCK
      ?auto_340284 - BLOCK
      ?auto_340285 - BLOCK
      ?auto_340286 - BLOCK
      ?auto_340287 - BLOCK
      ?auto_340288 - BLOCK
      ?auto_340289 - BLOCK
      ?auto_340290 - BLOCK
    )
    :vars
    (
      ?auto_340291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340290 ?auto_340291 ) ( ON-TABLE ?auto_340282 ) ( ON ?auto_340283 ?auto_340282 ) ( ON ?auto_340284 ?auto_340283 ) ( not ( = ?auto_340282 ?auto_340283 ) ) ( not ( = ?auto_340282 ?auto_340284 ) ) ( not ( = ?auto_340282 ?auto_340285 ) ) ( not ( = ?auto_340282 ?auto_340286 ) ) ( not ( = ?auto_340282 ?auto_340287 ) ) ( not ( = ?auto_340282 ?auto_340288 ) ) ( not ( = ?auto_340282 ?auto_340289 ) ) ( not ( = ?auto_340282 ?auto_340290 ) ) ( not ( = ?auto_340282 ?auto_340291 ) ) ( not ( = ?auto_340283 ?auto_340284 ) ) ( not ( = ?auto_340283 ?auto_340285 ) ) ( not ( = ?auto_340283 ?auto_340286 ) ) ( not ( = ?auto_340283 ?auto_340287 ) ) ( not ( = ?auto_340283 ?auto_340288 ) ) ( not ( = ?auto_340283 ?auto_340289 ) ) ( not ( = ?auto_340283 ?auto_340290 ) ) ( not ( = ?auto_340283 ?auto_340291 ) ) ( not ( = ?auto_340284 ?auto_340285 ) ) ( not ( = ?auto_340284 ?auto_340286 ) ) ( not ( = ?auto_340284 ?auto_340287 ) ) ( not ( = ?auto_340284 ?auto_340288 ) ) ( not ( = ?auto_340284 ?auto_340289 ) ) ( not ( = ?auto_340284 ?auto_340290 ) ) ( not ( = ?auto_340284 ?auto_340291 ) ) ( not ( = ?auto_340285 ?auto_340286 ) ) ( not ( = ?auto_340285 ?auto_340287 ) ) ( not ( = ?auto_340285 ?auto_340288 ) ) ( not ( = ?auto_340285 ?auto_340289 ) ) ( not ( = ?auto_340285 ?auto_340290 ) ) ( not ( = ?auto_340285 ?auto_340291 ) ) ( not ( = ?auto_340286 ?auto_340287 ) ) ( not ( = ?auto_340286 ?auto_340288 ) ) ( not ( = ?auto_340286 ?auto_340289 ) ) ( not ( = ?auto_340286 ?auto_340290 ) ) ( not ( = ?auto_340286 ?auto_340291 ) ) ( not ( = ?auto_340287 ?auto_340288 ) ) ( not ( = ?auto_340287 ?auto_340289 ) ) ( not ( = ?auto_340287 ?auto_340290 ) ) ( not ( = ?auto_340287 ?auto_340291 ) ) ( not ( = ?auto_340288 ?auto_340289 ) ) ( not ( = ?auto_340288 ?auto_340290 ) ) ( not ( = ?auto_340288 ?auto_340291 ) ) ( not ( = ?auto_340289 ?auto_340290 ) ) ( not ( = ?auto_340289 ?auto_340291 ) ) ( not ( = ?auto_340290 ?auto_340291 ) ) ( ON ?auto_340289 ?auto_340290 ) ( ON ?auto_340288 ?auto_340289 ) ( ON ?auto_340287 ?auto_340288 ) ( ON ?auto_340286 ?auto_340287 ) ( CLEAR ?auto_340284 ) ( ON ?auto_340285 ?auto_340286 ) ( CLEAR ?auto_340285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_340282 ?auto_340283 ?auto_340284 ?auto_340285 )
      ( MAKE-9PILE ?auto_340282 ?auto_340283 ?auto_340284 ?auto_340285 ?auto_340286 ?auto_340287 ?auto_340288 ?auto_340289 ?auto_340290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340320 - BLOCK
      ?auto_340321 - BLOCK
      ?auto_340322 - BLOCK
      ?auto_340323 - BLOCK
      ?auto_340324 - BLOCK
      ?auto_340325 - BLOCK
      ?auto_340326 - BLOCK
      ?auto_340327 - BLOCK
      ?auto_340328 - BLOCK
    )
    :vars
    (
      ?auto_340329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340328 ?auto_340329 ) ( ON-TABLE ?auto_340320 ) ( ON ?auto_340321 ?auto_340320 ) ( not ( = ?auto_340320 ?auto_340321 ) ) ( not ( = ?auto_340320 ?auto_340322 ) ) ( not ( = ?auto_340320 ?auto_340323 ) ) ( not ( = ?auto_340320 ?auto_340324 ) ) ( not ( = ?auto_340320 ?auto_340325 ) ) ( not ( = ?auto_340320 ?auto_340326 ) ) ( not ( = ?auto_340320 ?auto_340327 ) ) ( not ( = ?auto_340320 ?auto_340328 ) ) ( not ( = ?auto_340320 ?auto_340329 ) ) ( not ( = ?auto_340321 ?auto_340322 ) ) ( not ( = ?auto_340321 ?auto_340323 ) ) ( not ( = ?auto_340321 ?auto_340324 ) ) ( not ( = ?auto_340321 ?auto_340325 ) ) ( not ( = ?auto_340321 ?auto_340326 ) ) ( not ( = ?auto_340321 ?auto_340327 ) ) ( not ( = ?auto_340321 ?auto_340328 ) ) ( not ( = ?auto_340321 ?auto_340329 ) ) ( not ( = ?auto_340322 ?auto_340323 ) ) ( not ( = ?auto_340322 ?auto_340324 ) ) ( not ( = ?auto_340322 ?auto_340325 ) ) ( not ( = ?auto_340322 ?auto_340326 ) ) ( not ( = ?auto_340322 ?auto_340327 ) ) ( not ( = ?auto_340322 ?auto_340328 ) ) ( not ( = ?auto_340322 ?auto_340329 ) ) ( not ( = ?auto_340323 ?auto_340324 ) ) ( not ( = ?auto_340323 ?auto_340325 ) ) ( not ( = ?auto_340323 ?auto_340326 ) ) ( not ( = ?auto_340323 ?auto_340327 ) ) ( not ( = ?auto_340323 ?auto_340328 ) ) ( not ( = ?auto_340323 ?auto_340329 ) ) ( not ( = ?auto_340324 ?auto_340325 ) ) ( not ( = ?auto_340324 ?auto_340326 ) ) ( not ( = ?auto_340324 ?auto_340327 ) ) ( not ( = ?auto_340324 ?auto_340328 ) ) ( not ( = ?auto_340324 ?auto_340329 ) ) ( not ( = ?auto_340325 ?auto_340326 ) ) ( not ( = ?auto_340325 ?auto_340327 ) ) ( not ( = ?auto_340325 ?auto_340328 ) ) ( not ( = ?auto_340325 ?auto_340329 ) ) ( not ( = ?auto_340326 ?auto_340327 ) ) ( not ( = ?auto_340326 ?auto_340328 ) ) ( not ( = ?auto_340326 ?auto_340329 ) ) ( not ( = ?auto_340327 ?auto_340328 ) ) ( not ( = ?auto_340327 ?auto_340329 ) ) ( not ( = ?auto_340328 ?auto_340329 ) ) ( ON ?auto_340327 ?auto_340328 ) ( ON ?auto_340326 ?auto_340327 ) ( ON ?auto_340325 ?auto_340326 ) ( ON ?auto_340324 ?auto_340325 ) ( ON ?auto_340323 ?auto_340324 ) ( CLEAR ?auto_340321 ) ( ON ?auto_340322 ?auto_340323 ) ( CLEAR ?auto_340322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_340320 ?auto_340321 ?auto_340322 )
      ( MAKE-9PILE ?auto_340320 ?auto_340321 ?auto_340322 ?auto_340323 ?auto_340324 ?auto_340325 ?auto_340326 ?auto_340327 ?auto_340328 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340358 - BLOCK
      ?auto_340359 - BLOCK
      ?auto_340360 - BLOCK
      ?auto_340361 - BLOCK
      ?auto_340362 - BLOCK
      ?auto_340363 - BLOCK
      ?auto_340364 - BLOCK
      ?auto_340365 - BLOCK
      ?auto_340366 - BLOCK
    )
    :vars
    (
      ?auto_340367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340366 ?auto_340367 ) ( ON-TABLE ?auto_340358 ) ( not ( = ?auto_340358 ?auto_340359 ) ) ( not ( = ?auto_340358 ?auto_340360 ) ) ( not ( = ?auto_340358 ?auto_340361 ) ) ( not ( = ?auto_340358 ?auto_340362 ) ) ( not ( = ?auto_340358 ?auto_340363 ) ) ( not ( = ?auto_340358 ?auto_340364 ) ) ( not ( = ?auto_340358 ?auto_340365 ) ) ( not ( = ?auto_340358 ?auto_340366 ) ) ( not ( = ?auto_340358 ?auto_340367 ) ) ( not ( = ?auto_340359 ?auto_340360 ) ) ( not ( = ?auto_340359 ?auto_340361 ) ) ( not ( = ?auto_340359 ?auto_340362 ) ) ( not ( = ?auto_340359 ?auto_340363 ) ) ( not ( = ?auto_340359 ?auto_340364 ) ) ( not ( = ?auto_340359 ?auto_340365 ) ) ( not ( = ?auto_340359 ?auto_340366 ) ) ( not ( = ?auto_340359 ?auto_340367 ) ) ( not ( = ?auto_340360 ?auto_340361 ) ) ( not ( = ?auto_340360 ?auto_340362 ) ) ( not ( = ?auto_340360 ?auto_340363 ) ) ( not ( = ?auto_340360 ?auto_340364 ) ) ( not ( = ?auto_340360 ?auto_340365 ) ) ( not ( = ?auto_340360 ?auto_340366 ) ) ( not ( = ?auto_340360 ?auto_340367 ) ) ( not ( = ?auto_340361 ?auto_340362 ) ) ( not ( = ?auto_340361 ?auto_340363 ) ) ( not ( = ?auto_340361 ?auto_340364 ) ) ( not ( = ?auto_340361 ?auto_340365 ) ) ( not ( = ?auto_340361 ?auto_340366 ) ) ( not ( = ?auto_340361 ?auto_340367 ) ) ( not ( = ?auto_340362 ?auto_340363 ) ) ( not ( = ?auto_340362 ?auto_340364 ) ) ( not ( = ?auto_340362 ?auto_340365 ) ) ( not ( = ?auto_340362 ?auto_340366 ) ) ( not ( = ?auto_340362 ?auto_340367 ) ) ( not ( = ?auto_340363 ?auto_340364 ) ) ( not ( = ?auto_340363 ?auto_340365 ) ) ( not ( = ?auto_340363 ?auto_340366 ) ) ( not ( = ?auto_340363 ?auto_340367 ) ) ( not ( = ?auto_340364 ?auto_340365 ) ) ( not ( = ?auto_340364 ?auto_340366 ) ) ( not ( = ?auto_340364 ?auto_340367 ) ) ( not ( = ?auto_340365 ?auto_340366 ) ) ( not ( = ?auto_340365 ?auto_340367 ) ) ( not ( = ?auto_340366 ?auto_340367 ) ) ( ON ?auto_340365 ?auto_340366 ) ( ON ?auto_340364 ?auto_340365 ) ( ON ?auto_340363 ?auto_340364 ) ( ON ?auto_340362 ?auto_340363 ) ( ON ?auto_340361 ?auto_340362 ) ( ON ?auto_340360 ?auto_340361 ) ( CLEAR ?auto_340358 ) ( ON ?auto_340359 ?auto_340360 ) ( CLEAR ?auto_340359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_340358 ?auto_340359 )
      ( MAKE-9PILE ?auto_340358 ?auto_340359 ?auto_340360 ?auto_340361 ?auto_340362 ?auto_340363 ?auto_340364 ?auto_340365 ?auto_340366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_340396 - BLOCK
      ?auto_340397 - BLOCK
      ?auto_340398 - BLOCK
      ?auto_340399 - BLOCK
      ?auto_340400 - BLOCK
      ?auto_340401 - BLOCK
      ?auto_340402 - BLOCK
      ?auto_340403 - BLOCK
      ?auto_340404 - BLOCK
    )
    :vars
    (
      ?auto_340405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340404 ?auto_340405 ) ( not ( = ?auto_340396 ?auto_340397 ) ) ( not ( = ?auto_340396 ?auto_340398 ) ) ( not ( = ?auto_340396 ?auto_340399 ) ) ( not ( = ?auto_340396 ?auto_340400 ) ) ( not ( = ?auto_340396 ?auto_340401 ) ) ( not ( = ?auto_340396 ?auto_340402 ) ) ( not ( = ?auto_340396 ?auto_340403 ) ) ( not ( = ?auto_340396 ?auto_340404 ) ) ( not ( = ?auto_340396 ?auto_340405 ) ) ( not ( = ?auto_340397 ?auto_340398 ) ) ( not ( = ?auto_340397 ?auto_340399 ) ) ( not ( = ?auto_340397 ?auto_340400 ) ) ( not ( = ?auto_340397 ?auto_340401 ) ) ( not ( = ?auto_340397 ?auto_340402 ) ) ( not ( = ?auto_340397 ?auto_340403 ) ) ( not ( = ?auto_340397 ?auto_340404 ) ) ( not ( = ?auto_340397 ?auto_340405 ) ) ( not ( = ?auto_340398 ?auto_340399 ) ) ( not ( = ?auto_340398 ?auto_340400 ) ) ( not ( = ?auto_340398 ?auto_340401 ) ) ( not ( = ?auto_340398 ?auto_340402 ) ) ( not ( = ?auto_340398 ?auto_340403 ) ) ( not ( = ?auto_340398 ?auto_340404 ) ) ( not ( = ?auto_340398 ?auto_340405 ) ) ( not ( = ?auto_340399 ?auto_340400 ) ) ( not ( = ?auto_340399 ?auto_340401 ) ) ( not ( = ?auto_340399 ?auto_340402 ) ) ( not ( = ?auto_340399 ?auto_340403 ) ) ( not ( = ?auto_340399 ?auto_340404 ) ) ( not ( = ?auto_340399 ?auto_340405 ) ) ( not ( = ?auto_340400 ?auto_340401 ) ) ( not ( = ?auto_340400 ?auto_340402 ) ) ( not ( = ?auto_340400 ?auto_340403 ) ) ( not ( = ?auto_340400 ?auto_340404 ) ) ( not ( = ?auto_340400 ?auto_340405 ) ) ( not ( = ?auto_340401 ?auto_340402 ) ) ( not ( = ?auto_340401 ?auto_340403 ) ) ( not ( = ?auto_340401 ?auto_340404 ) ) ( not ( = ?auto_340401 ?auto_340405 ) ) ( not ( = ?auto_340402 ?auto_340403 ) ) ( not ( = ?auto_340402 ?auto_340404 ) ) ( not ( = ?auto_340402 ?auto_340405 ) ) ( not ( = ?auto_340403 ?auto_340404 ) ) ( not ( = ?auto_340403 ?auto_340405 ) ) ( not ( = ?auto_340404 ?auto_340405 ) ) ( ON ?auto_340403 ?auto_340404 ) ( ON ?auto_340402 ?auto_340403 ) ( ON ?auto_340401 ?auto_340402 ) ( ON ?auto_340400 ?auto_340401 ) ( ON ?auto_340399 ?auto_340400 ) ( ON ?auto_340398 ?auto_340399 ) ( ON ?auto_340397 ?auto_340398 ) ( ON ?auto_340396 ?auto_340397 ) ( CLEAR ?auto_340396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_340396 )
      ( MAKE-9PILE ?auto_340396 ?auto_340397 ?auto_340398 ?auto_340399 ?auto_340400 ?auto_340401 ?auto_340402 ?auto_340403 ?auto_340404 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340435 - BLOCK
      ?auto_340436 - BLOCK
      ?auto_340437 - BLOCK
      ?auto_340438 - BLOCK
      ?auto_340439 - BLOCK
      ?auto_340440 - BLOCK
      ?auto_340441 - BLOCK
      ?auto_340442 - BLOCK
      ?auto_340443 - BLOCK
      ?auto_340444 - BLOCK
    )
    :vars
    (
      ?auto_340445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_340443 ) ( ON ?auto_340444 ?auto_340445 ) ( CLEAR ?auto_340444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_340435 ) ( ON ?auto_340436 ?auto_340435 ) ( ON ?auto_340437 ?auto_340436 ) ( ON ?auto_340438 ?auto_340437 ) ( ON ?auto_340439 ?auto_340438 ) ( ON ?auto_340440 ?auto_340439 ) ( ON ?auto_340441 ?auto_340440 ) ( ON ?auto_340442 ?auto_340441 ) ( ON ?auto_340443 ?auto_340442 ) ( not ( = ?auto_340435 ?auto_340436 ) ) ( not ( = ?auto_340435 ?auto_340437 ) ) ( not ( = ?auto_340435 ?auto_340438 ) ) ( not ( = ?auto_340435 ?auto_340439 ) ) ( not ( = ?auto_340435 ?auto_340440 ) ) ( not ( = ?auto_340435 ?auto_340441 ) ) ( not ( = ?auto_340435 ?auto_340442 ) ) ( not ( = ?auto_340435 ?auto_340443 ) ) ( not ( = ?auto_340435 ?auto_340444 ) ) ( not ( = ?auto_340435 ?auto_340445 ) ) ( not ( = ?auto_340436 ?auto_340437 ) ) ( not ( = ?auto_340436 ?auto_340438 ) ) ( not ( = ?auto_340436 ?auto_340439 ) ) ( not ( = ?auto_340436 ?auto_340440 ) ) ( not ( = ?auto_340436 ?auto_340441 ) ) ( not ( = ?auto_340436 ?auto_340442 ) ) ( not ( = ?auto_340436 ?auto_340443 ) ) ( not ( = ?auto_340436 ?auto_340444 ) ) ( not ( = ?auto_340436 ?auto_340445 ) ) ( not ( = ?auto_340437 ?auto_340438 ) ) ( not ( = ?auto_340437 ?auto_340439 ) ) ( not ( = ?auto_340437 ?auto_340440 ) ) ( not ( = ?auto_340437 ?auto_340441 ) ) ( not ( = ?auto_340437 ?auto_340442 ) ) ( not ( = ?auto_340437 ?auto_340443 ) ) ( not ( = ?auto_340437 ?auto_340444 ) ) ( not ( = ?auto_340437 ?auto_340445 ) ) ( not ( = ?auto_340438 ?auto_340439 ) ) ( not ( = ?auto_340438 ?auto_340440 ) ) ( not ( = ?auto_340438 ?auto_340441 ) ) ( not ( = ?auto_340438 ?auto_340442 ) ) ( not ( = ?auto_340438 ?auto_340443 ) ) ( not ( = ?auto_340438 ?auto_340444 ) ) ( not ( = ?auto_340438 ?auto_340445 ) ) ( not ( = ?auto_340439 ?auto_340440 ) ) ( not ( = ?auto_340439 ?auto_340441 ) ) ( not ( = ?auto_340439 ?auto_340442 ) ) ( not ( = ?auto_340439 ?auto_340443 ) ) ( not ( = ?auto_340439 ?auto_340444 ) ) ( not ( = ?auto_340439 ?auto_340445 ) ) ( not ( = ?auto_340440 ?auto_340441 ) ) ( not ( = ?auto_340440 ?auto_340442 ) ) ( not ( = ?auto_340440 ?auto_340443 ) ) ( not ( = ?auto_340440 ?auto_340444 ) ) ( not ( = ?auto_340440 ?auto_340445 ) ) ( not ( = ?auto_340441 ?auto_340442 ) ) ( not ( = ?auto_340441 ?auto_340443 ) ) ( not ( = ?auto_340441 ?auto_340444 ) ) ( not ( = ?auto_340441 ?auto_340445 ) ) ( not ( = ?auto_340442 ?auto_340443 ) ) ( not ( = ?auto_340442 ?auto_340444 ) ) ( not ( = ?auto_340442 ?auto_340445 ) ) ( not ( = ?auto_340443 ?auto_340444 ) ) ( not ( = ?auto_340443 ?auto_340445 ) ) ( not ( = ?auto_340444 ?auto_340445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_340444 ?auto_340445 )
      ( !STACK ?auto_340444 ?auto_340443 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340477 - BLOCK
      ?auto_340478 - BLOCK
      ?auto_340479 - BLOCK
      ?auto_340480 - BLOCK
      ?auto_340481 - BLOCK
      ?auto_340482 - BLOCK
      ?auto_340483 - BLOCK
      ?auto_340484 - BLOCK
      ?auto_340485 - BLOCK
      ?auto_340486 - BLOCK
    )
    :vars
    (
      ?auto_340487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340486 ?auto_340487 ) ( ON-TABLE ?auto_340477 ) ( ON ?auto_340478 ?auto_340477 ) ( ON ?auto_340479 ?auto_340478 ) ( ON ?auto_340480 ?auto_340479 ) ( ON ?auto_340481 ?auto_340480 ) ( ON ?auto_340482 ?auto_340481 ) ( ON ?auto_340483 ?auto_340482 ) ( ON ?auto_340484 ?auto_340483 ) ( not ( = ?auto_340477 ?auto_340478 ) ) ( not ( = ?auto_340477 ?auto_340479 ) ) ( not ( = ?auto_340477 ?auto_340480 ) ) ( not ( = ?auto_340477 ?auto_340481 ) ) ( not ( = ?auto_340477 ?auto_340482 ) ) ( not ( = ?auto_340477 ?auto_340483 ) ) ( not ( = ?auto_340477 ?auto_340484 ) ) ( not ( = ?auto_340477 ?auto_340485 ) ) ( not ( = ?auto_340477 ?auto_340486 ) ) ( not ( = ?auto_340477 ?auto_340487 ) ) ( not ( = ?auto_340478 ?auto_340479 ) ) ( not ( = ?auto_340478 ?auto_340480 ) ) ( not ( = ?auto_340478 ?auto_340481 ) ) ( not ( = ?auto_340478 ?auto_340482 ) ) ( not ( = ?auto_340478 ?auto_340483 ) ) ( not ( = ?auto_340478 ?auto_340484 ) ) ( not ( = ?auto_340478 ?auto_340485 ) ) ( not ( = ?auto_340478 ?auto_340486 ) ) ( not ( = ?auto_340478 ?auto_340487 ) ) ( not ( = ?auto_340479 ?auto_340480 ) ) ( not ( = ?auto_340479 ?auto_340481 ) ) ( not ( = ?auto_340479 ?auto_340482 ) ) ( not ( = ?auto_340479 ?auto_340483 ) ) ( not ( = ?auto_340479 ?auto_340484 ) ) ( not ( = ?auto_340479 ?auto_340485 ) ) ( not ( = ?auto_340479 ?auto_340486 ) ) ( not ( = ?auto_340479 ?auto_340487 ) ) ( not ( = ?auto_340480 ?auto_340481 ) ) ( not ( = ?auto_340480 ?auto_340482 ) ) ( not ( = ?auto_340480 ?auto_340483 ) ) ( not ( = ?auto_340480 ?auto_340484 ) ) ( not ( = ?auto_340480 ?auto_340485 ) ) ( not ( = ?auto_340480 ?auto_340486 ) ) ( not ( = ?auto_340480 ?auto_340487 ) ) ( not ( = ?auto_340481 ?auto_340482 ) ) ( not ( = ?auto_340481 ?auto_340483 ) ) ( not ( = ?auto_340481 ?auto_340484 ) ) ( not ( = ?auto_340481 ?auto_340485 ) ) ( not ( = ?auto_340481 ?auto_340486 ) ) ( not ( = ?auto_340481 ?auto_340487 ) ) ( not ( = ?auto_340482 ?auto_340483 ) ) ( not ( = ?auto_340482 ?auto_340484 ) ) ( not ( = ?auto_340482 ?auto_340485 ) ) ( not ( = ?auto_340482 ?auto_340486 ) ) ( not ( = ?auto_340482 ?auto_340487 ) ) ( not ( = ?auto_340483 ?auto_340484 ) ) ( not ( = ?auto_340483 ?auto_340485 ) ) ( not ( = ?auto_340483 ?auto_340486 ) ) ( not ( = ?auto_340483 ?auto_340487 ) ) ( not ( = ?auto_340484 ?auto_340485 ) ) ( not ( = ?auto_340484 ?auto_340486 ) ) ( not ( = ?auto_340484 ?auto_340487 ) ) ( not ( = ?auto_340485 ?auto_340486 ) ) ( not ( = ?auto_340485 ?auto_340487 ) ) ( not ( = ?auto_340486 ?auto_340487 ) ) ( CLEAR ?auto_340484 ) ( ON ?auto_340485 ?auto_340486 ) ( CLEAR ?auto_340485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_340477 ?auto_340478 ?auto_340479 ?auto_340480 ?auto_340481 ?auto_340482 ?auto_340483 ?auto_340484 ?auto_340485 )
      ( MAKE-10PILE ?auto_340477 ?auto_340478 ?auto_340479 ?auto_340480 ?auto_340481 ?auto_340482 ?auto_340483 ?auto_340484 ?auto_340485 ?auto_340486 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340519 - BLOCK
      ?auto_340520 - BLOCK
      ?auto_340521 - BLOCK
      ?auto_340522 - BLOCK
      ?auto_340523 - BLOCK
      ?auto_340524 - BLOCK
      ?auto_340525 - BLOCK
      ?auto_340526 - BLOCK
      ?auto_340527 - BLOCK
      ?auto_340528 - BLOCK
    )
    :vars
    (
      ?auto_340529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340528 ?auto_340529 ) ( ON-TABLE ?auto_340519 ) ( ON ?auto_340520 ?auto_340519 ) ( ON ?auto_340521 ?auto_340520 ) ( ON ?auto_340522 ?auto_340521 ) ( ON ?auto_340523 ?auto_340522 ) ( ON ?auto_340524 ?auto_340523 ) ( ON ?auto_340525 ?auto_340524 ) ( not ( = ?auto_340519 ?auto_340520 ) ) ( not ( = ?auto_340519 ?auto_340521 ) ) ( not ( = ?auto_340519 ?auto_340522 ) ) ( not ( = ?auto_340519 ?auto_340523 ) ) ( not ( = ?auto_340519 ?auto_340524 ) ) ( not ( = ?auto_340519 ?auto_340525 ) ) ( not ( = ?auto_340519 ?auto_340526 ) ) ( not ( = ?auto_340519 ?auto_340527 ) ) ( not ( = ?auto_340519 ?auto_340528 ) ) ( not ( = ?auto_340519 ?auto_340529 ) ) ( not ( = ?auto_340520 ?auto_340521 ) ) ( not ( = ?auto_340520 ?auto_340522 ) ) ( not ( = ?auto_340520 ?auto_340523 ) ) ( not ( = ?auto_340520 ?auto_340524 ) ) ( not ( = ?auto_340520 ?auto_340525 ) ) ( not ( = ?auto_340520 ?auto_340526 ) ) ( not ( = ?auto_340520 ?auto_340527 ) ) ( not ( = ?auto_340520 ?auto_340528 ) ) ( not ( = ?auto_340520 ?auto_340529 ) ) ( not ( = ?auto_340521 ?auto_340522 ) ) ( not ( = ?auto_340521 ?auto_340523 ) ) ( not ( = ?auto_340521 ?auto_340524 ) ) ( not ( = ?auto_340521 ?auto_340525 ) ) ( not ( = ?auto_340521 ?auto_340526 ) ) ( not ( = ?auto_340521 ?auto_340527 ) ) ( not ( = ?auto_340521 ?auto_340528 ) ) ( not ( = ?auto_340521 ?auto_340529 ) ) ( not ( = ?auto_340522 ?auto_340523 ) ) ( not ( = ?auto_340522 ?auto_340524 ) ) ( not ( = ?auto_340522 ?auto_340525 ) ) ( not ( = ?auto_340522 ?auto_340526 ) ) ( not ( = ?auto_340522 ?auto_340527 ) ) ( not ( = ?auto_340522 ?auto_340528 ) ) ( not ( = ?auto_340522 ?auto_340529 ) ) ( not ( = ?auto_340523 ?auto_340524 ) ) ( not ( = ?auto_340523 ?auto_340525 ) ) ( not ( = ?auto_340523 ?auto_340526 ) ) ( not ( = ?auto_340523 ?auto_340527 ) ) ( not ( = ?auto_340523 ?auto_340528 ) ) ( not ( = ?auto_340523 ?auto_340529 ) ) ( not ( = ?auto_340524 ?auto_340525 ) ) ( not ( = ?auto_340524 ?auto_340526 ) ) ( not ( = ?auto_340524 ?auto_340527 ) ) ( not ( = ?auto_340524 ?auto_340528 ) ) ( not ( = ?auto_340524 ?auto_340529 ) ) ( not ( = ?auto_340525 ?auto_340526 ) ) ( not ( = ?auto_340525 ?auto_340527 ) ) ( not ( = ?auto_340525 ?auto_340528 ) ) ( not ( = ?auto_340525 ?auto_340529 ) ) ( not ( = ?auto_340526 ?auto_340527 ) ) ( not ( = ?auto_340526 ?auto_340528 ) ) ( not ( = ?auto_340526 ?auto_340529 ) ) ( not ( = ?auto_340527 ?auto_340528 ) ) ( not ( = ?auto_340527 ?auto_340529 ) ) ( not ( = ?auto_340528 ?auto_340529 ) ) ( ON ?auto_340527 ?auto_340528 ) ( CLEAR ?auto_340525 ) ( ON ?auto_340526 ?auto_340527 ) ( CLEAR ?auto_340526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_340519 ?auto_340520 ?auto_340521 ?auto_340522 ?auto_340523 ?auto_340524 ?auto_340525 ?auto_340526 )
      ( MAKE-10PILE ?auto_340519 ?auto_340520 ?auto_340521 ?auto_340522 ?auto_340523 ?auto_340524 ?auto_340525 ?auto_340526 ?auto_340527 ?auto_340528 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340561 - BLOCK
      ?auto_340562 - BLOCK
      ?auto_340563 - BLOCK
      ?auto_340564 - BLOCK
      ?auto_340565 - BLOCK
      ?auto_340566 - BLOCK
      ?auto_340567 - BLOCK
      ?auto_340568 - BLOCK
      ?auto_340569 - BLOCK
      ?auto_340570 - BLOCK
    )
    :vars
    (
      ?auto_340571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340570 ?auto_340571 ) ( ON-TABLE ?auto_340561 ) ( ON ?auto_340562 ?auto_340561 ) ( ON ?auto_340563 ?auto_340562 ) ( ON ?auto_340564 ?auto_340563 ) ( ON ?auto_340565 ?auto_340564 ) ( ON ?auto_340566 ?auto_340565 ) ( not ( = ?auto_340561 ?auto_340562 ) ) ( not ( = ?auto_340561 ?auto_340563 ) ) ( not ( = ?auto_340561 ?auto_340564 ) ) ( not ( = ?auto_340561 ?auto_340565 ) ) ( not ( = ?auto_340561 ?auto_340566 ) ) ( not ( = ?auto_340561 ?auto_340567 ) ) ( not ( = ?auto_340561 ?auto_340568 ) ) ( not ( = ?auto_340561 ?auto_340569 ) ) ( not ( = ?auto_340561 ?auto_340570 ) ) ( not ( = ?auto_340561 ?auto_340571 ) ) ( not ( = ?auto_340562 ?auto_340563 ) ) ( not ( = ?auto_340562 ?auto_340564 ) ) ( not ( = ?auto_340562 ?auto_340565 ) ) ( not ( = ?auto_340562 ?auto_340566 ) ) ( not ( = ?auto_340562 ?auto_340567 ) ) ( not ( = ?auto_340562 ?auto_340568 ) ) ( not ( = ?auto_340562 ?auto_340569 ) ) ( not ( = ?auto_340562 ?auto_340570 ) ) ( not ( = ?auto_340562 ?auto_340571 ) ) ( not ( = ?auto_340563 ?auto_340564 ) ) ( not ( = ?auto_340563 ?auto_340565 ) ) ( not ( = ?auto_340563 ?auto_340566 ) ) ( not ( = ?auto_340563 ?auto_340567 ) ) ( not ( = ?auto_340563 ?auto_340568 ) ) ( not ( = ?auto_340563 ?auto_340569 ) ) ( not ( = ?auto_340563 ?auto_340570 ) ) ( not ( = ?auto_340563 ?auto_340571 ) ) ( not ( = ?auto_340564 ?auto_340565 ) ) ( not ( = ?auto_340564 ?auto_340566 ) ) ( not ( = ?auto_340564 ?auto_340567 ) ) ( not ( = ?auto_340564 ?auto_340568 ) ) ( not ( = ?auto_340564 ?auto_340569 ) ) ( not ( = ?auto_340564 ?auto_340570 ) ) ( not ( = ?auto_340564 ?auto_340571 ) ) ( not ( = ?auto_340565 ?auto_340566 ) ) ( not ( = ?auto_340565 ?auto_340567 ) ) ( not ( = ?auto_340565 ?auto_340568 ) ) ( not ( = ?auto_340565 ?auto_340569 ) ) ( not ( = ?auto_340565 ?auto_340570 ) ) ( not ( = ?auto_340565 ?auto_340571 ) ) ( not ( = ?auto_340566 ?auto_340567 ) ) ( not ( = ?auto_340566 ?auto_340568 ) ) ( not ( = ?auto_340566 ?auto_340569 ) ) ( not ( = ?auto_340566 ?auto_340570 ) ) ( not ( = ?auto_340566 ?auto_340571 ) ) ( not ( = ?auto_340567 ?auto_340568 ) ) ( not ( = ?auto_340567 ?auto_340569 ) ) ( not ( = ?auto_340567 ?auto_340570 ) ) ( not ( = ?auto_340567 ?auto_340571 ) ) ( not ( = ?auto_340568 ?auto_340569 ) ) ( not ( = ?auto_340568 ?auto_340570 ) ) ( not ( = ?auto_340568 ?auto_340571 ) ) ( not ( = ?auto_340569 ?auto_340570 ) ) ( not ( = ?auto_340569 ?auto_340571 ) ) ( not ( = ?auto_340570 ?auto_340571 ) ) ( ON ?auto_340569 ?auto_340570 ) ( ON ?auto_340568 ?auto_340569 ) ( CLEAR ?auto_340566 ) ( ON ?auto_340567 ?auto_340568 ) ( CLEAR ?auto_340567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_340561 ?auto_340562 ?auto_340563 ?auto_340564 ?auto_340565 ?auto_340566 ?auto_340567 )
      ( MAKE-10PILE ?auto_340561 ?auto_340562 ?auto_340563 ?auto_340564 ?auto_340565 ?auto_340566 ?auto_340567 ?auto_340568 ?auto_340569 ?auto_340570 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340603 - BLOCK
      ?auto_340604 - BLOCK
      ?auto_340605 - BLOCK
      ?auto_340606 - BLOCK
      ?auto_340607 - BLOCK
      ?auto_340608 - BLOCK
      ?auto_340609 - BLOCK
      ?auto_340610 - BLOCK
      ?auto_340611 - BLOCK
      ?auto_340612 - BLOCK
    )
    :vars
    (
      ?auto_340613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340612 ?auto_340613 ) ( ON-TABLE ?auto_340603 ) ( ON ?auto_340604 ?auto_340603 ) ( ON ?auto_340605 ?auto_340604 ) ( ON ?auto_340606 ?auto_340605 ) ( ON ?auto_340607 ?auto_340606 ) ( not ( = ?auto_340603 ?auto_340604 ) ) ( not ( = ?auto_340603 ?auto_340605 ) ) ( not ( = ?auto_340603 ?auto_340606 ) ) ( not ( = ?auto_340603 ?auto_340607 ) ) ( not ( = ?auto_340603 ?auto_340608 ) ) ( not ( = ?auto_340603 ?auto_340609 ) ) ( not ( = ?auto_340603 ?auto_340610 ) ) ( not ( = ?auto_340603 ?auto_340611 ) ) ( not ( = ?auto_340603 ?auto_340612 ) ) ( not ( = ?auto_340603 ?auto_340613 ) ) ( not ( = ?auto_340604 ?auto_340605 ) ) ( not ( = ?auto_340604 ?auto_340606 ) ) ( not ( = ?auto_340604 ?auto_340607 ) ) ( not ( = ?auto_340604 ?auto_340608 ) ) ( not ( = ?auto_340604 ?auto_340609 ) ) ( not ( = ?auto_340604 ?auto_340610 ) ) ( not ( = ?auto_340604 ?auto_340611 ) ) ( not ( = ?auto_340604 ?auto_340612 ) ) ( not ( = ?auto_340604 ?auto_340613 ) ) ( not ( = ?auto_340605 ?auto_340606 ) ) ( not ( = ?auto_340605 ?auto_340607 ) ) ( not ( = ?auto_340605 ?auto_340608 ) ) ( not ( = ?auto_340605 ?auto_340609 ) ) ( not ( = ?auto_340605 ?auto_340610 ) ) ( not ( = ?auto_340605 ?auto_340611 ) ) ( not ( = ?auto_340605 ?auto_340612 ) ) ( not ( = ?auto_340605 ?auto_340613 ) ) ( not ( = ?auto_340606 ?auto_340607 ) ) ( not ( = ?auto_340606 ?auto_340608 ) ) ( not ( = ?auto_340606 ?auto_340609 ) ) ( not ( = ?auto_340606 ?auto_340610 ) ) ( not ( = ?auto_340606 ?auto_340611 ) ) ( not ( = ?auto_340606 ?auto_340612 ) ) ( not ( = ?auto_340606 ?auto_340613 ) ) ( not ( = ?auto_340607 ?auto_340608 ) ) ( not ( = ?auto_340607 ?auto_340609 ) ) ( not ( = ?auto_340607 ?auto_340610 ) ) ( not ( = ?auto_340607 ?auto_340611 ) ) ( not ( = ?auto_340607 ?auto_340612 ) ) ( not ( = ?auto_340607 ?auto_340613 ) ) ( not ( = ?auto_340608 ?auto_340609 ) ) ( not ( = ?auto_340608 ?auto_340610 ) ) ( not ( = ?auto_340608 ?auto_340611 ) ) ( not ( = ?auto_340608 ?auto_340612 ) ) ( not ( = ?auto_340608 ?auto_340613 ) ) ( not ( = ?auto_340609 ?auto_340610 ) ) ( not ( = ?auto_340609 ?auto_340611 ) ) ( not ( = ?auto_340609 ?auto_340612 ) ) ( not ( = ?auto_340609 ?auto_340613 ) ) ( not ( = ?auto_340610 ?auto_340611 ) ) ( not ( = ?auto_340610 ?auto_340612 ) ) ( not ( = ?auto_340610 ?auto_340613 ) ) ( not ( = ?auto_340611 ?auto_340612 ) ) ( not ( = ?auto_340611 ?auto_340613 ) ) ( not ( = ?auto_340612 ?auto_340613 ) ) ( ON ?auto_340611 ?auto_340612 ) ( ON ?auto_340610 ?auto_340611 ) ( ON ?auto_340609 ?auto_340610 ) ( CLEAR ?auto_340607 ) ( ON ?auto_340608 ?auto_340609 ) ( CLEAR ?auto_340608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_340603 ?auto_340604 ?auto_340605 ?auto_340606 ?auto_340607 ?auto_340608 )
      ( MAKE-10PILE ?auto_340603 ?auto_340604 ?auto_340605 ?auto_340606 ?auto_340607 ?auto_340608 ?auto_340609 ?auto_340610 ?auto_340611 ?auto_340612 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340645 - BLOCK
      ?auto_340646 - BLOCK
      ?auto_340647 - BLOCK
      ?auto_340648 - BLOCK
      ?auto_340649 - BLOCK
      ?auto_340650 - BLOCK
      ?auto_340651 - BLOCK
      ?auto_340652 - BLOCK
      ?auto_340653 - BLOCK
      ?auto_340654 - BLOCK
    )
    :vars
    (
      ?auto_340655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340654 ?auto_340655 ) ( ON-TABLE ?auto_340645 ) ( ON ?auto_340646 ?auto_340645 ) ( ON ?auto_340647 ?auto_340646 ) ( ON ?auto_340648 ?auto_340647 ) ( not ( = ?auto_340645 ?auto_340646 ) ) ( not ( = ?auto_340645 ?auto_340647 ) ) ( not ( = ?auto_340645 ?auto_340648 ) ) ( not ( = ?auto_340645 ?auto_340649 ) ) ( not ( = ?auto_340645 ?auto_340650 ) ) ( not ( = ?auto_340645 ?auto_340651 ) ) ( not ( = ?auto_340645 ?auto_340652 ) ) ( not ( = ?auto_340645 ?auto_340653 ) ) ( not ( = ?auto_340645 ?auto_340654 ) ) ( not ( = ?auto_340645 ?auto_340655 ) ) ( not ( = ?auto_340646 ?auto_340647 ) ) ( not ( = ?auto_340646 ?auto_340648 ) ) ( not ( = ?auto_340646 ?auto_340649 ) ) ( not ( = ?auto_340646 ?auto_340650 ) ) ( not ( = ?auto_340646 ?auto_340651 ) ) ( not ( = ?auto_340646 ?auto_340652 ) ) ( not ( = ?auto_340646 ?auto_340653 ) ) ( not ( = ?auto_340646 ?auto_340654 ) ) ( not ( = ?auto_340646 ?auto_340655 ) ) ( not ( = ?auto_340647 ?auto_340648 ) ) ( not ( = ?auto_340647 ?auto_340649 ) ) ( not ( = ?auto_340647 ?auto_340650 ) ) ( not ( = ?auto_340647 ?auto_340651 ) ) ( not ( = ?auto_340647 ?auto_340652 ) ) ( not ( = ?auto_340647 ?auto_340653 ) ) ( not ( = ?auto_340647 ?auto_340654 ) ) ( not ( = ?auto_340647 ?auto_340655 ) ) ( not ( = ?auto_340648 ?auto_340649 ) ) ( not ( = ?auto_340648 ?auto_340650 ) ) ( not ( = ?auto_340648 ?auto_340651 ) ) ( not ( = ?auto_340648 ?auto_340652 ) ) ( not ( = ?auto_340648 ?auto_340653 ) ) ( not ( = ?auto_340648 ?auto_340654 ) ) ( not ( = ?auto_340648 ?auto_340655 ) ) ( not ( = ?auto_340649 ?auto_340650 ) ) ( not ( = ?auto_340649 ?auto_340651 ) ) ( not ( = ?auto_340649 ?auto_340652 ) ) ( not ( = ?auto_340649 ?auto_340653 ) ) ( not ( = ?auto_340649 ?auto_340654 ) ) ( not ( = ?auto_340649 ?auto_340655 ) ) ( not ( = ?auto_340650 ?auto_340651 ) ) ( not ( = ?auto_340650 ?auto_340652 ) ) ( not ( = ?auto_340650 ?auto_340653 ) ) ( not ( = ?auto_340650 ?auto_340654 ) ) ( not ( = ?auto_340650 ?auto_340655 ) ) ( not ( = ?auto_340651 ?auto_340652 ) ) ( not ( = ?auto_340651 ?auto_340653 ) ) ( not ( = ?auto_340651 ?auto_340654 ) ) ( not ( = ?auto_340651 ?auto_340655 ) ) ( not ( = ?auto_340652 ?auto_340653 ) ) ( not ( = ?auto_340652 ?auto_340654 ) ) ( not ( = ?auto_340652 ?auto_340655 ) ) ( not ( = ?auto_340653 ?auto_340654 ) ) ( not ( = ?auto_340653 ?auto_340655 ) ) ( not ( = ?auto_340654 ?auto_340655 ) ) ( ON ?auto_340653 ?auto_340654 ) ( ON ?auto_340652 ?auto_340653 ) ( ON ?auto_340651 ?auto_340652 ) ( ON ?auto_340650 ?auto_340651 ) ( CLEAR ?auto_340648 ) ( ON ?auto_340649 ?auto_340650 ) ( CLEAR ?auto_340649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_340645 ?auto_340646 ?auto_340647 ?auto_340648 ?auto_340649 )
      ( MAKE-10PILE ?auto_340645 ?auto_340646 ?auto_340647 ?auto_340648 ?auto_340649 ?auto_340650 ?auto_340651 ?auto_340652 ?auto_340653 ?auto_340654 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340687 - BLOCK
      ?auto_340688 - BLOCK
      ?auto_340689 - BLOCK
      ?auto_340690 - BLOCK
      ?auto_340691 - BLOCK
      ?auto_340692 - BLOCK
      ?auto_340693 - BLOCK
      ?auto_340694 - BLOCK
      ?auto_340695 - BLOCK
      ?auto_340696 - BLOCK
    )
    :vars
    (
      ?auto_340697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340696 ?auto_340697 ) ( ON-TABLE ?auto_340687 ) ( ON ?auto_340688 ?auto_340687 ) ( ON ?auto_340689 ?auto_340688 ) ( not ( = ?auto_340687 ?auto_340688 ) ) ( not ( = ?auto_340687 ?auto_340689 ) ) ( not ( = ?auto_340687 ?auto_340690 ) ) ( not ( = ?auto_340687 ?auto_340691 ) ) ( not ( = ?auto_340687 ?auto_340692 ) ) ( not ( = ?auto_340687 ?auto_340693 ) ) ( not ( = ?auto_340687 ?auto_340694 ) ) ( not ( = ?auto_340687 ?auto_340695 ) ) ( not ( = ?auto_340687 ?auto_340696 ) ) ( not ( = ?auto_340687 ?auto_340697 ) ) ( not ( = ?auto_340688 ?auto_340689 ) ) ( not ( = ?auto_340688 ?auto_340690 ) ) ( not ( = ?auto_340688 ?auto_340691 ) ) ( not ( = ?auto_340688 ?auto_340692 ) ) ( not ( = ?auto_340688 ?auto_340693 ) ) ( not ( = ?auto_340688 ?auto_340694 ) ) ( not ( = ?auto_340688 ?auto_340695 ) ) ( not ( = ?auto_340688 ?auto_340696 ) ) ( not ( = ?auto_340688 ?auto_340697 ) ) ( not ( = ?auto_340689 ?auto_340690 ) ) ( not ( = ?auto_340689 ?auto_340691 ) ) ( not ( = ?auto_340689 ?auto_340692 ) ) ( not ( = ?auto_340689 ?auto_340693 ) ) ( not ( = ?auto_340689 ?auto_340694 ) ) ( not ( = ?auto_340689 ?auto_340695 ) ) ( not ( = ?auto_340689 ?auto_340696 ) ) ( not ( = ?auto_340689 ?auto_340697 ) ) ( not ( = ?auto_340690 ?auto_340691 ) ) ( not ( = ?auto_340690 ?auto_340692 ) ) ( not ( = ?auto_340690 ?auto_340693 ) ) ( not ( = ?auto_340690 ?auto_340694 ) ) ( not ( = ?auto_340690 ?auto_340695 ) ) ( not ( = ?auto_340690 ?auto_340696 ) ) ( not ( = ?auto_340690 ?auto_340697 ) ) ( not ( = ?auto_340691 ?auto_340692 ) ) ( not ( = ?auto_340691 ?auto_340693 ) ) ( not ( = ?auto_340691 ?auto_340694 ) ) ( not ( = ?auto_340691 ?auto_340695 ) ) ( not ( = ?auto_340691 ?auto_340696 ) ) ( not ( = ?auto_340691 ?auto_340697 ) ) ( not ( = ?auto_340692 ?auto_340693 ) ) ( not ( = ?auto_340692 ?auto_340694 ) ) ( not ( = ?auto_340692 ?auto_340695 ) ) ( not ( = ?auto_340692 ?auto_340696 ) ) ( not ( = ?auto_340692 ?auto_340697 ) ) ( not ( = ?auto_340693 ?auto_340694 ) ) ( not ( = ?auto_340693 ?auto_340695 ) ) ( not ( = ?auto_340693 ?auto_340696 ) ) ( not ( = ?auto_340693 ?auto_340697 ) ) ( not ( = ?auto_340694 ?auto_340695 ) ) ( not ( = ?auto_340694 ?auto_340696 ) ) ( not ( = ?auto_340694 ?auto_340697 ) ) ( not ( = ?auto_340695 ?auto_340696 ) ) ( not ( = ?auto_340695 ?auto_340697 ) ) ( not ( = ?auto_340696 ?auto_340697 ) ) ( ON ?auto_340695 ?auto_340696 ) ( ON ?auto_340694 ?auto_340695 ) ( ON ?auto_340693 ?auto_340694 ) ( ON ?auto_340692 ?auto_340693 ) ( ON ?auto_340691 ?auto_340692 ) ( CLEAR ?auto_340689 ) ( ON ?auto_340690 ?auto_340691 ) ( CLEAR ?auto_340690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_340687 ?auto_340688 ?auto_340689 ?auto_340690 )
      ( MAKE-10PILE ?auto_340687 ?auto_340688 ?auto_340689 ?auto_340690 ?auto_340691 ?auto_340692 ?auto_340693 ?auto_340694 ?auto_340695 ?auto_340696 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340729 - BLOCK
      ?auto_340730 - BLOCK
      ?auto_340731 - BLOCK
      ?auto_340732 - BLOCK
      ?auto_340733 - BLOCK
      ?auto_340734 - BLOCK
      ?auto_340735 - BLOCK
      ?auto_340736 - BLOCK
      ?auto_340737 - BLOCK
      ?auto_340738 - BLOCK
    )
    :vars
    (
      ?auto_340739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340738 ?auto_340739 ) ( ON-TABLE ?auto_340729 ) ( ON ?auto_340730 ?auto_340729 ) ( not ( = ?auto_340729 ?auto_340730 ) ) ( not ( = ?auto_340729 ?auto_340731 ) ) ( not ( = ?auto_340729 ?auto_340732 ) ) ( not ( = ?auto_340729 ?auto_340733 ) ) ( not ( = ?auto_340729 ?auto_340734 ) ) ( not ( = ?auto_340729 ?auto_340735 ) ) ( not ( = ?auto_340729 ?auto_340736 ) ) ( not ( = ?auto_340729 ?auto_340737 ) ) ( not ( = ?auto_340729 ?auto_340738 ) ) ( not ( = ?auto_340729 ?auto_340739 ) ) ( not ( = ?auto_340730 ?auto_340731 ) ) ( not ( = ?auto_340730 ?auto_340732 ) ) ( not ( = ?auto_340730 ?auto_340733 ) ) ( not ( = ?auto_340730 ?auto_340734 ) ) ( not ( = ?auto_340730 ?auto_340735 ) ) ( not ( = ?auto_340730 ?auto_340736 ) ) ( not ( = ?auto_340730 ?auto_340737 ) ) ( not ( = ?auto_340730 ?auto_340738 ) ) ( not ( = ?auto_340730 ?auto_340739 ) ) ( not ( = ?auto_340731 ?auto_340732 ) ) ( not ( = ?auto_340731 ?auto_340733 ) ) ( not ( = ?auto_340731 ?auto_340734 ) ) ( not ( = ?auto_340731 ?auto_340735 ) ) ( not ( = ?auto_340731 ?auto_340736 ) ) ( not ( = ?auto_340731 ?auto_340737 ) ) ( not ( = ?auto_340731 ?auto_340738 ) ) ( not ( = ?auto_340731 ?auto_340739 ) ) ( not ( = ?auto_340732 ?auto_340733 ) ) ( not ( = ?auto_340732 ?auto_340734 ) ) ( not ( = ?auto_340732 ?auto_340735 ) ) ( not ( = ?auto_340732 ?auto_340736 ) ) ( not ( = ?auto_340732 ?auto_340737 ) ) ( not ( = ?auto_340732 ?auto_340738 ) ) ( not ( = ?auto_340732 ?auto_340739 ) ) ( not ( = ?auto_340733 ?auto_340734 ) ) ( not ( = ?auto_340733 ?auto_340735 ) ) ( not ( = ?auto_340733 ?auto_340736 ) ) ( not ( = ?auto_340733 ?auto_340737 ) ) ( not ( = ?auto_340733 ?auto_340738 ) ) ( not ( = ?auto_340733 ?auto_340739 ) ) ( not ( = ?auto_340734 ?auto_340735 ) ) ( not ( = ?auto_340734 ?auto_340736 ) ) ( not ( = ?auto_340734 ?auto_340737 ) ) ( not ( = ?auto_340734 ?auto_340738 ) ) ( not ( = ?auto_340734 ?auto_340739 ) ) ( not ( = ?auto_340735 ?auto_340736 ) ) ( not ( = ?auto_340735 ?auto_340737 ) ) ( not ( = ?auto_340735 ?auto_340738 ) ) ( not ( = ?auto_340735 ?auto_340739 ) ) ( not ( = ?auto_340736 ?auto_340737 ) ) ( not ( = ?auto_340736 ?auto_340738 ) ) ( not ( = ?auto_340736 ?auto_340739 ) ) ( not ( = ?auto_340737 ?auto_340738 ) ) ( not ( = ?auto_340737 ?auto_340739 ) ) ( not ( = ?auto_340738 ?auto_340739 ) ) ( ON ?auto_340737 ?auto_340738 ) ( ON ?auto_340736 ?auto_340737 ) ( ON ?auto_340735 ?auto_340736 ) ( ON ?auto_340734 ?auto_340735 ) ( ON ?auto_340733 ?auto_340734 ) ( ON ?auto_340732 ?auto_340733 ) ( CLEAR ?auto_340730 ) ( ON ?auto_340731 ?auto_340732 ) ( CLEAR ?auto_340731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_340729 ?auto_340730 ?auto_340731 )
      ( MAKE-10PILE ?auto_340729 ?auto_340730 ?auto_340731 ?auto_340732 ?auto_340733 ?auto_340734 ?auto_340735 ?auto_340736 ?auto_340737 ?auto_340738 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340771 - BLOCK
      ?auto_340772 - BLOCK
      ?auto_340773 - BLOCK
      ?auto_340774 - BLOCK
      ?auto_340775 - BLOCK
      ?auto_340776 - BLOCK
      ?auto_340777 - BLOCK
      ?auto_340778 - BLOCK
      ?auto_340779 - BLOCK
      ?auto_340780 - BLOCK
    )
    :vars
    (
      ?auto_340781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340780 ?auto_340781 ) ( ON-TABLE ?auto_340771 ) ( not ( = ?auto_340771 ?auto_340772 ) ) ( not ( = ?auto_340771 ?auto_340773 ) ) ( not ( = ?auto_340771 ?auto_340774 ) ) ( not ( = ?auto_340771 ?auto_340775 ) ) ( not ( = ?auto_340771 ?auto_340776 ) ) ( not ( = ?auto_340771 ?auto_340777 ) ) ( not ( = ?auto_340771 ?auto_340778 ) ) ( not ( = ?auto_340771 ?auto_340779 ) ) ( not ( = ?auto_340771 ?auto_340780 ) ) ( not ( = ?auto_340771 ?auto_340781 ) ) ( not ( = ?auto_340772 ?auto_340773 ) ) ( not ( = ?auto_340772 ?auto_340774 ) ) ( not ( = ?auto_340772 ?auto_340775 ) ) ( not ( = ?auto_340772 ?auto_340776 ) ) ( not ( = ?auto_340772 ?auto_340777 ) ) ( not ( = ?auto_340772 ?auto_340778 ) ) ( not ( = ?auto_340772 ?auto_340779 ) ) ( not ( = ?auto_340772 ?auto_340780 ) ) ( not ( = ?auto_340772 ?auto_340781 ) ) ( not ( = ?auto_340773 ?auto_340774 ) ) ( not ( = ?auto_340773 ?auto_340775 ) ) ( not ( = ?auto_340773 ?auto_340776 ) ) ( not ( = ?auto_340773 ?auto_340777 ) ) ( not ( = ?auto_340773 ?auto_340778 ) ) ( not ( = ?auto_340773 ?auto_340779 ) ) ( not ( = ?auto_340773 ?auto_340780 ) ) ( not ( = ?auto_340773 ?auto_340781 ) ) ( not ( = ?auto_340774 ?auto_340775 ) ) ( not ( = ?auto_340774 ?auto_340776 ) ) ( not ( = ?auto_340774 ?auto_340777 ) ) ( not ( = ?auto_340774 ?auto_340778 ) ) ( not ( = ?auto_340774 ?auto_340779 ) ) ( not ( = ?auto_340774 ?auto_340780 ) ) ( not ( = ?auto_340774 ?auto_340781 ) ) ( not ( = ?auto_340775 ?auto_340776 ) ) ( not ( = ?auto_340775 ?auto_340777 ) ) ( not ( = ?auto_340775 ?auto_340778 ) ) ( not ( = ?auto_340775 ?auto_340779 ) ) ( not ( = ?auto_340775 ?auto_340780 ) ) ( not ( = ?auto_340775 ?auto_340781 ) ) ( not ( = ?auto_340776 ?auto_340777 ) ) ( not ( = ?auto_340776 ?auto_340778 ) ) ( not ( = ?auto_340776 ?auto_340779 ) ) ( not ( = ?auto_340776 ?auto_340780 ) ) ( not ( = ?auto_340776 ?auto_340781 ) ) ( not ( = ?auto_340777 ?auto_340778 ) ) ( not ( = ?auto_340777 ?auto_340779 ) ) ( not ( = ?auto_340777 ?auto_340780 ) ) ( not ( = ?auto_340777 ?auto_340781 ) ) ( not ( = ?auto_340778 ?auto_340779 ) ) ( not ( = ?auto_340778 ?auto_340780 ) ) ( not ( = ?auto_340778 ?auto_340781 ) ) ( not ( = ?auto_340779 ?auto_340780 ) ) ( not ( = ?auto_340779 ?auto_340781 ) ) ( not ( = ?auto_340780 ?auto_340781 ) ) ( ON ?auto_340779 ?auto_340780 ) ( ON ?auto_340778 ?auto_340779 ) ( ON ?auto_340777 ?auto_340778 ) ( ON ?auto_340776 ?auto_340777 ) ( ON ?auto_340775 ?auto_340776 ) ( ON ?auto_340774 ?auto_340775 ) ( ON ?auto_340773 ?auto_340774 ) ( CLEAR ?auto_340771 ) ( ON ?auto_340772 ?auto_340773 ) ( CLEAR ?auto_340772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_340771 ?auto_340772 )
      ( MAKE-10PILE ?auto_340771 ?auto_340772 ?auto_340773 ?auto_340774 ?auto_340775 ?auto_340776 ?auto_340777 ?auto_340778 ?auto_340779 ?auto_340780 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_340813 - BLOCK
      ?auto_340814 - BLOCK
      ?auto_340815 - BLOCK
      ?auto_340816 - BLOCK
      ?auto_340817 - BLOCK
      ?auto_340818 - BLOCK
      ?auto_340819 - BLOCK
      ?auto_340820 - BLOCK
      ?auto_340821 - BLOCK
      ?auto_340822 - BLOCK
    )
    :vars
    (
      ?auto_340823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340822 ?auto_340823 ) ( not ( = ?auto_340813 ?auto_340814 ) ) ( not ( = ?auto_340813 ?auto_340815 ) ) ( not ( = ?auto_340813 ?auto_340816 ) ) ( not ( = ?auto_340813 ?auto_340817 ) ) ( not ( = ?auto_340813 ?auto_340818 ) ) ( not ( = ?auto_340813 ?auto_340819 ) ) ( not ( = ?auto_340813 ?auto_340820 ) ) ( not ( = ?auto_340813 ?auto_340821 ) ) ( not ( = ?auto_340813 ?auto_340822 ) ) ( not ( = ?auto_340813 ?auto_340823 ) ) ( not ( = ?auto_340814 ?auto_340815 ) ) ( not ( = ?auto_340814 ?auto_340816 ) ) ( not ( = ?auto_340814 ?auto_340817 ) ) ( not ( = ?auto_340814 ?auto_340818 ) ) ( not ( = ?auto_340814 ?auto_340819 ) ) ( not ( = ?auto_340814 ?auto_340820 ) ) ( not ( = ?auto_340814 ?auto_340821 ) ) ( not ( = ?auto_340814 ?auto_340822 ) ) ( not ( = ?auto_340814 ?auto_340823 ) ) ( not ( = ?auto_340815 ?auto_340816 ) ) ( not ( = ?auto_340815 ?auto_340817 ) ) ( not ( = ?auto_340815 ?auto_340818 ) ) ( not ( = ?auto_340815 ?auto_340819 ) ) ( not ( = ?auto_340815 ?auto_340820 ) ) ( not ( = ?auto_340815 ?auto_340821 ) ) ( not ( = ?auto_340815 ?auto_340822 ) ) ( not ( = ?auto_340815 ?auto_340823 ) ) ( not ( = ?auto_340816 ?auto_340817 ) ) ( not ( = ?auto_340816 ?auto_340818 ) ) ( not ( = ?auto_340816 ?auto_340819 ) ) ( not ( = ?auto_340816 ?auto_340820 ) ) ( not ( = ?auto_340816 ?auto_340821 ) ) ( not ( = ?auto_340816 ?auto_340822 ) ) ( not ( = ?auto_340816 ?auto_340823 ) ) ( not ( = ?auto_340817 ?auto_340818 ) ) ( not ( = ?auto_340817 ?auto_340819 ) ) ( not ( = ?auto_340817 ?auto_340820 ) ) ( not ( = ?auto_340817 ?auto_340821 ) ) ( not ( = ?auto_340817 ?auto_340822 ) ) ( not ( = ?auto_340817 ?auto_340823 ) ) ( not ( = ?auto_340818 ?auto_340819 ) ) ( not ( = ?auto_340818 ?auto_340820 ) ) ( not ( = ?auto_340818 ?auto_340821 ) ) ( not ( = ?auto_340818 ?auto_340822 ) ) ( not ( = ?auto_340818 ?auto_340823 ) ) ( not ( = ?auto_340819 ?auto_340820 ) ) ( not ( = ?auto_340819 ?auto_340821 ) ) ( not ( = ?auto_340819 ?auto_340822 ) ) ( not ( = ?auto_340819 ?auto_340823 ) ) ( not ( = ?auto_340820 ?auto_340821 ) ) ( not ( = ?auto_340820 ?auto_340822 ) ) ( not ( = ?auto_340820 ?auto_340823 ) ) ( not ( = ?auto_340821 ?auto_340822 ) ) ( not ( = ?auto_340821 ?auto_340823 ) ) ( not ( = ?auto_340822 ?auto_340823 ) ) ( ON ?auto_340821 ?auto_340822 ) ( ON ?auto_340820 ?auto_340821 ) ( ON ?auto_340819 ?auto_340820 ) ( ON ?auto_340818 ?auto_340819 ) ( ON ?auto_340817 ?auto_340818 ) ( ON ?auto_340816 ?auto_340817 ) ( ON ?auto_340815 ?auto_340816 ) ( ON ?auto_340814 ?auto_340815 ) ( ON ?auto_340813 ?auto_340814 ) ( CLEAR ?auto_340813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_340813 )
      ( MAKE-10PILE ?auto_340813 ?auto_340814 ?auto_340815 ?auto_340816 ?auto_340817 ?auto_340818 ?auto_340819 ?auto_340820 ?auto_340821 ?auto_340822 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_340856 - BLOCK
      ?auto_340857 - BLOCK
      ?auto_340858 - BLOCK
      ?auto_340859 - BLOCK
      ?auto_340860 - BLOCK
      ?auto_340861 - BLOCK
      ?auto_340862 - BLOCK
      ?auto_340863 - BLOCK
      ?auto_340864 - BLOCK
      ?auto_340865 - BLOCK
      ?auto_340866 - BLOCK
    )
    :vars
    (
      ?auto_340867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_340865 ) ( ON ?auto_340866 ?auto_340867 ) ( CLEAR ?auto_340866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_340856 ) ( ON ?auto_340857 ?auto_340856 ) ( ON ?auto_340858 ?auto_340857 ) ( ON ?auto_340859 ?auto_340858 ) ( ON ?auto_340860 ?auto_340859 ) ( ON ?auto_340861 ?auto_340860 ) ( ON ?auto_340862 ?auto_340861 ) ( ON ?auto_340863 ?auto_340862 ) ( ON ?auto_340864 ?auto_340863 ) ( ON ?auto_340865 ?auto_340864 ) ( not ( = ?auto_340856 ?auto_340857 ) ) ( not ( = ?auto_340856 ?auto_340858 ) ) ( not ( = ?auto_340856 ?auto_340859 ) ) ( not ( = ?auto_340856 ?auto_340860 ) ) ( not ( = ?auto_340856 ?auto_340861 ) ) ( not ( = ?auto_340856 ?auto_340862 ) ) ( not ( = ?auto_340856 ?auto_340863 ) ) ( not ( = ?auto_340856 ?auto_340864 ) ) ( not ( = ?auto_340856 ?auto_340865 ) ) ( not ( = ?auto_340856 ?auto_340866 ) ) ( not ( = ?auto_340856 ?auto_340867 ) ) ( not ( = ?auto_340857 ?auto_340858 ) ) ( not ( = ?auto_340857 ?auto_340859 ) ) ( not ( = ?auto_340857 ?auto_340860 ) ) ( not ( = ?auto_340857 ?auto_340861 ) ) ( not ( = ?auto_340857 ?auto_340862 ) ) ( not ( = ?auto_340857 ?auto_340863 ) ) ( not ( = ?auto_340857 ?auto_340864 ) ) ( not ( = ?auto_340857 ?auto_340865 ) ) ( not ( = ?auto_340857 ?auto_340866 ) ) ( not ( = ?auto_340857 ?auto_340867 ) ) ( not ( = ?auto_340858 ?auto_340859 ) ) ( not ( = ?auto_340858 ?auto_340860 ) ) ( not ( = ?auto_340858 ?auto_340861 ) ) ( not ( = ?auto_340858 ?auto_340862 ) ) ( not ( = ?auto_340858 ?auto_340863 ) ) ( not ( = ?auto_340858 ?auto_340864 ) ) ( not ( = ?auto_340858 ?auto_340865 ) ) ( not ( = ?auto_340858 ?auto_340866 ) ) ( not ( = ?auto_340858 ?auto_340867 ) ) ( not ( = ?auto_340859 ?auto_340860 ) ) ( not ( = ?auto_340859 ?auto_340861 ) ) ( not ( = ?auto_340859 ?auto_340862 ) ) ( not ( = ?auto_340859 ?auto_340863 ) ) ( not ( = ?auto_340859 ?auto_340864 ) ) ( not ( = ?auto_340859 ?auto_340865 ) ) ( not ( = ?auto_340859 ?auto_340866 ) ) ( not ( = ?auto_340859 ?auto_340867 ) ) ( not ( = ?auto_340860 ?auto_340861 ) ) ( not ( = ?auto_340860 ?auto_340862 ) ) ( not ( = ?auto_340860 ?auto_340863 ) ) ( not ( = ?auto_340860 ?auto_340864 ) ) ( not ( = ?auto_340860 ?auto_340865 ) ) ( not ( = ?auto_340860 ?auto_340866 ) ) ( not ( = ?auto_340860 ?auto_340867 ) ) ( not ( = ?auto_340861 ?auto_340862 ) ) ( not ( = ?auto_340861 ?auto_340863 ) ) ( not ( = ?auto_340861 ?auto_340864 ) ) ( not ( = ?auto_340861 ?auto_340865 ) ) ( not ( = ?auto_340861 ?auto_340866 ) ) ( not ( = ?auto_340861 ?auto_340867 ) ) ( not ( = ?auto_340862 ?auto_340863 ) ) ( not ( = ?auto_340862 ?auto_340864 ) ) ( not ( = ?auto_340862 ?auto_340865 ) ) ( not ( = ?auto_340862 ?auto_340866 ) ) ( not ( = ?auto_340862 ?auto_340867 ) ) ( not ( = ?auto_340863 ?auto_340864 ) ) ( not ( = ?auto_340863 ?auto_340865 ) ) ( not ( = ?auto_340863 ?auto_340866 ) ) ( not ( = ?auto_340863 ?auto_340867 ) ) ( not ( = ?auto_340864 ?auto_340865 ) ) ( not ( = ?auto_340864 ?auto_340866 ) ) ( not ( = ?auto_340864 ?auto_340867 ) ) ( not ( = ?auto_340865 ?auto_340866 ) ) ( not ( = ?auto_340865 ?auto_340867 ) ) ( not ( = ?auto_340866 ?auto_340867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_340866 ?auto_340867 )
      ( !STACK ?auto_340866 ?auto_340865 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_340902 - BLOCK
      ?auto_340903 - BLOCK
      ?auto_340904 - BLOCK
      ?auto_340905 - BLOCK
      ?auto_340906 - BLOCK
      ?auto_340907 - BLOCK
      ?auto_340908 - BLOCK
      ?auto_340909 - BLOCK
      ?auto_340910 - BLOCK
      ?auto_340911 - BLOCK
      ?auto_340912 - BLOCK
    )
    :vars
    (
      ?auto_340913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340912 ?auto_340913 ) ( ON-TABLE ?auto_340902 ) ( ON ?auto_340903 ?auto_340902 ) ( ON ?auto_340904 ?auto_340903 ) ( ON ?auto_340905 ?auto_340904 ) ( ON ?auto_340906 ?auto_340905 ) ( ON ?auto_340907 ?auto_340906 ) ( ON ?auto_340908 ?auto_340907 ) ( ON ?auto_340909 ?auto_340908 ) ( ON ?auto_340910 ?auto_340909 ) ( not ( = ?auto_340902 ?auto_340903 ) ) ( not ( = ?auto_340902 ?auto_340904 ) ) ( not ( = ?auto_340902 ?auto_340905 ) ) ( not ( = ?auto_340902 ?auto_340906 ) ) ( not ( = ?auto_340902 ?auto_340907 ) ) ( not ( = ?auto_340902 ?auto_340908 ) ) ( not ( = ?auto_340902 ?auto_340909 ) ) ( not ( = ?auto_340902 ?auto_340910 ) ) ( not ( = ?auto_340902 ?auto_340911 ) ) ( not ( = ?auto_340902 ?auto_340912 ) ) ( not ( = ?auto_340902 ?auto_340913 ) ) ( not ( = ?auto_340903 ?auto_340904 ) ) ( not ( = ?auto_340903 ?auto_340905 ) ) ( not ( = ?auto_340903 ?auto_340906 ) ) ( not ( = ?auto_340903 ?auto_340907 ) ) ( not ( = ?auto_340903 ?auto_340908 ) ) ( not ( = ?auto_340903 ?auto_340909 ) ) ( not ( = ?auto_340903 ?auto_340910 ) ) ( not ( = ?auto_340903 ?auto_340911 ) ) ( not ( = ?auto_340903 ?auto_340912 ) ) ( not ( = ?auto_340903 ?auto_340913 ) ) ( not ( = ?auto_340904 ?auto_340905 ) ) ( not ( = ?auto_340904 ?auto_340906 ) ) ( not ( = ?auto_340904 ?auto_340907 ) ) ( not ( = ?auto_340904 ?auto_340908 ) ) ( not ( = ?auto_340904 ?auto_340909 ) ) ( not ( = ?auto_340904 ?auto_340910 ) ) ( not ( = ?auto_340904 ?auto_340911 ) ) ( not ( = ?auto_340904 ?auto_340912 ) ) ( not ( = ?auto_340904 ?auto_340913 ) ) ( not ( = ?auto_340905 ?auto_340906 ) ) ( not ( = ?auto_340905 ?auto_340907 ) ) ( not ( = ?auto_340905 ?auto_340908 ) ) ( not ( = ?auto_340905 ?auto_340909 ) ) ( not ( = ?auto_340905 ?auto_340910 ) ) ( not ( = ?auto_340905 ?auto_340911 ) ) ( not ( = ?auto_340905 ?auto_340912 ) ) ( not ( = ?auto_340905 ?auto_340913 ) ) ( not ( = ?auto_340906 ?auto_340907 ) ) ( not ( = ?auto_340906 ?auto_340908 ) ) ( not ( = ?auto_340906 ?auto_340909 ) ) ( not ( = ?auto_340906 ?auto_340910 ) ) ( not ( = ?auto_340906 ?auto_340911 ) ) ( not ( = ?auto_340906 ?auto_340912 ) ) ( not ( = ?auto_340906 ?auto_340913 ) ) ( not ( = ?auto_340907 ?auto_340908 ) ) ( not ( = ?auto_340907 ?auto_340909 ) ) ( not ( = ?auto_340907 ?auto_340910 ) ) ( not ( = ?auto_340907 ?auto_340911 ) ) ( not ( = ?auto_340907 ?auto_340912 ) ) ( not ( = ?auto_340907 ?auto_340913 ) ) ( not ( = ?auto_340908 ?auto_340909 ) ) ( not ( = ?auto_340908 ?auto_340910 ) ) ( not ( = ?auto_340908 ?auto_340911 ) ) ( not ( = ?auto_340908 ?auto_340912 ) ) ( not ( = ?auto_340908 ?auto_340913 ) ) ( not ( = ?auto_340909 ?auto_340910 ) ) ( not ( = ?auto_340909 ?auto_340911 ) ) ( not ( = ?auto_340909 ?auto_340912 ) ) ( not ( = ?auto_340909 ?auto_340913 ) ) ( not ( = ?auto_340910 ?auto_340911 ) ) ( not ( = ?auto_340910 ?auto_340912 ) ) ( not ( = ?auto_340910 ?auto_340913 ) ) ( not ( = ?auto_340911 ?auto_340912 ) ) ( not ( = ?auto_340911 ?auto_340913 ) ) ( not ( = ?auto_340912 ?auto_340913 ) ) ( CLEAR ?auto_340910 ) ( ON ?auto_340911 ?auto_340912 ) ( CLEAR ?auto_340911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_340902 ?auto_340903 ?auto_340904 ?auto_340905 ?auto_340906 ?auto_340907 ?auto_340908 ?auto_340909 ?auto_340910 ?auto_340911 )
      ( MAKE-11PILE ?auto_340902 ?auto_340903 ?auto_340904 ?auto_340905 ?auto_340906 ?auto_340907 ?auto_340908 ?auto_340909 ?auto_340910 ?auto_340911 ?auto_340912 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_340948 - BLOCK
      ?auto_340949 - BLOCK
      ?auto_340950 - BLOCK
      ?auto_340951 - BLOCK
      ?auto_340952 - BLOCK
      ?auto_340953 - BLOCK
      ?auto_340954 - BLOCK
      ?auto_340955 - BLOCK
      ?auto_340956 - BLOCK
      ?auto_340957 - BLOCK
      ?auto_340958 - BLOCK
    )
    :vars
    (
      ?auto_340959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_340958 ?auto_340959 ) ( ON-TABLE ?auto_340948 ) ( ON ?auto_340949 ?auto_340948 ) ( ON ?auto_340950 ?auto_340949 ) ( ON ?auto_340951 ?auto_340950 ) ( ON ?auto_340952 ?auto_340951 ) ( ON ?auto_340953 ?auto_340952 ) ( ON ?auto_340954 ?auto_340953 ) ( ON ?auto_340955 ?auto_340954 ) ( not ( = ?auto_340948 ?auto_340949 ) ) ( not ( = ?auto_340948 ?auto_340950 ) ) ( not ( = ?auto_340948 ?auto_340951 ) ) ( not ( = ?auto_340948 ?auto_340952 ) ) ( not ( = ?auto_340948 ?auto_340953 ) ) ( not ( = ?auto_340948 ?auto_340954 ) ) ( not ( = ?auto_340948 ?auto_340955 ) ) ( not ( = ?auto_340948 ?auto_340956 ) ) ( not ( = ?auto_340948 ?auto_340957 ) ) ( not ( = ?auto_340948 ?auto_340958 ) ) ( not ( = ?auto_340948 ?auto_340959 ) ) ( not ( = ?auto_340949 ?auto_340950 ) ) ( not ( = ?auto_340949 ?auto_340951 ) ) ( not ( = ?auto_340949 ?auto_340952 ) ) ( not ( = ?auto_340949 ?auto_340953 ) ) ( not ( = ?auto_340949 ?auto_340954 ) ) ( not ( = ?auto_340949 ?auto_340955 ) ) ( not ( = ?auto_340949 ?auto_340956 ) ) ( not ( = ?auto_340949 ?auto_340957 ) ) ( not ( = ?auto_340949 ?auto_340958 ) ) ( not ( = ?auto_340949 ?auto_340959 ) ) ( not ( = ?auto_340950 ?auto_340951 ) ) ( not ( = ?auto_340950 ?auto_340952 ) ) ( not ( = ?auto_340950 ?auto_340953 ) ) ( not ( = ?auto_340950 ?auto_340954 ) ) ( not ( = ?auto_340950 ?auto_340955 ) ) ( not ( = ?auto_340950 ?auto_340956 ) ) ( not ( = ?auto_340950 ?auto_340957 ) ) ( not ( = ?auto_340950 ?auto_340958 ) ) ( not ( = ?auto_340950 ?auto_340959 ) ) ( not ( = ?auto_340951 ?auto_340952 ) ) ( not ( = ?auto_340951 ?auto_340953 ) ) ( not ( = ?auto_340951 ?auto_340954 ) ) ( not ( = ?auto_340951 ?auto_340955 ) ) ( not ( = ?auto_340951 ?auto_340956 ) ) ( not ( = ?auto_340951 ?auto_340957 ) ) ( not ( = ?auto_340951 ?auto_340958 ) ) ( not ( = ?auto_340951 ?auto_340959 ) ) ( not ( = ?auto_340952 ?auto_340953 ) ) ( not ( = ?auto_340952 ?auto_340954 ) ) ( not ( = ?auto_340952 ?auto_340955 ) ) ( not ( = ?auto_340952 ?auto_340956 ) ) ( not ( = ?auto_340952 ?auto_340957 ) ) ( not ( = ?auto_340952 ?auto_340958 ) ) ( not ( = ?auto_340952 ?auto_340959 ) ) ( not ( = ?auto_340953 ?auto_340954 ) ) ( not ( = ?auto_340953 ?auto_340955 ) ) ( not ( = ?auto_340953 ?auto_340956 ) ) ( not ( = ?auto_340953 ?auto_340957 ) ) ( not ( = ?auto_340953 ?auto_340958 ) ) ( not ( = ?auto_340953 ?auto_340959 ) ) ( not ( = ?auto_340954 ?auto_340955 ) ) ( not ( = ?auto_340954 ?auto_340956 ) ) ( not ( = ?auto_340954 ?auto_340957 ) ) ( not ( = ?auto_340954 ?auto_340958 ) ) ( not ( = ?auto_340954 ?auto_340959 ) ) ( not ( = ?auto_340955 ?auto_340956 ) ) ( not ( = ?auto_340955 ?auto_340957 ) ) ( not ( = ?auto_340955 ?auto_340958 ) ) ( not ( = ?auto_340955 ?auto_340959 ) ) ( not ( = ?auto_340956 ?auto_340957 ) ) ( not ( = ?auto_340956 ?auto_340958 ) ) ( not ( = ?auto_340956 ?auto_340959 ) ) ( not ( = ?auto_340957 ?auto_340958 ) ) ( not ( = ?auto_340957 ?auto_340959 ) ) ( not ( = ?auto_340958 ?auto_340959 ) ) ( ON ?auto_340957 ?auto_340958 ) ( CLEAR ?auto_340955 ) ( ON ?auto_340956 ?auto_340957 ) ( CLEAR ?auto_340956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_340948 ?auto_340949 ?auto_340950 ?auto_340951 ?auto_340952 ?auto_340953 ?auto_340954 ?auto_340955 ?auto_340956 )
      ( MAKE-11PILE ?auto_340948 ?auto_340949 ?auto_340950 ?auto_340951 ?auto_340952 ?auto_340953 ?auto_340954 ?auto_340955 ?auto_340956 ?auto_340957 ?auto_340958 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_340994 - BLOCK
      ?auto_340995 - BLOCK
      ?auto_340996 - BLOCK
      ?auto_340997 - BLOCK
      ?auto_340998 - BLOCK
      ?auto_340999 - BLOCK
      ?auto_341000 - BLOCK
      ?auto_341001 - BLOCK
      ?auto_341002 - BLOCK
      ?auto_341003 - BLOCK
      ?auto_341004 - BLOCK
    )
    :vars
    (
      ?auto_341005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341004 ?auto_341005 ) ( ON-TABLE ?auto_340994 ) ( ON ?auto_340995 ?auto_340994 ) ( ON ?auto_340996 ?auto_340995 ) ( ON ?auto_340997 ?auto_340996 ) ( ON ?auto_340998 ?auto_340997 ) ( ON ?auto_340999 ?auto_340998 ) ( ON ?auto_341000 ?auto_340999 ) ( not ( = ?auto_340994 ?auto_340995 ) ) ( not ( = ?auto_340994 ?auto_340996 ) ) ( not ( = ?auto_340994 ?auto_340997 ) ) ( not ( = ?auto_340994 ?auto_340998 ) ) ( not ( = ?auto_340994 ?auto_340999 ) ) ( not ( = ?auto_340994 ?auto_341000 ) ) ( not ( = ?auto_340994 ?auto_341001 ) ) ( not ( = ?auto_340994 ?auto_341002 ) ) ( not ( = ?auto_340994 ?auto_341003 ) ) ( not ( = ?auto_340994 ?auto_341004 ) ) ( not ( = ?auto_340994 ?auto_341005 ) ) ( not ( = ?auto_340995 ?auto_340996 ) ) ( not ( = ?auto_340995 ?auto_340997 ) ) ( not ( = ?auto_340995 ?auto_340998 ) ) ( not ( = ?auto_340995 ?auto_340999 ) ) ( not ( = ?auto_340995 ?auto_341000 ) ) ( not ( = ?auto_340995 ?auto_341001 ) ) ( not ( = ?auto_340995 ?auto_341002 ) ) ( not ( = ?auto_340995 ?auto_341003 ) ) ( not ( = ?auto_340995 ?auto_341004 ) ) ( not ( = ?auto_340995 ?auto_341005 ) ) ( not ( = ?auto_340996 ?auto_340997 ) ) ( not ( = ?auto_340996 ?auto_340998 ) ) ( not ( = ?auto_340996 ?auto_340999 ) ) ( not ( = ?auto_340996 ?auto_341000 ) ) ( not ( = ?auto_340996 ?auto_341001 ) ) ( not ( = ?auto_340996 ?auto_341002 ) ) ( not ( = ?auto_340996 ?auto_341003 ) ) ( not ( = ?auto_340996 ?auto_341004 ) ) ( not ( = ?auto_340996 ?auto_341005 ) ) ( not ( = ?auto_340997 ?auto_340998 ) ) ( not ( = ?auto_340997 ?auto_340999 ) ) ( not ( = ?auto_340997 ?auto_341000 ) ) ( not ( = ?auto_340997 ?auto_341001 ) ) ( not ( = ?auto_340997 ?auto_341002 ) ) ( not ( = ?auto_340997 ?auto_341003 ) ) ( not ( = ?auto_340997 ?auto_341004 ) ) ( not ( = ?auto_340997 ?auto_341005 ) ) ( not ( = ?auto_340998 ?auto_340999 ) ) ( not ( = ?auto_340998 ?auto_341000 ) ) ( not ( = ?auto_340998 ?auto_341001 ) ) ( not ( = ?auto_340998 ?auto_341002 ) ) ( not ( = ?auto_340998 ?auto_341003 ) ) ( not ( = ?auto_340998 ?auto_341004 ) ) ( not ( = ?auto_340998 ?auto_341005 ) ) ( not ( = ?auto_340999 ?auto_341000 ) ) ( not ( = ?auto_340999 ?auto_341001 ) ) ( not ( = ?auto_340999 ?auto_341002 ) ) ( not ( = ?auto_340999 ?auto_341003 ) ) ( not ( = ?auto_340999 ?auto_341004 ) ) ( not ( = ?auto_340999 ?auto_341005 ) ) ( not ( = ?auto_341000 ?auto_341001 ) ) ( not ( = ?auto_341000 ?auto_341002 ) ) ( not ( = ?auto_341000 ?auto_341003 ) ) ( not ( = ?auto_341000 ?auto_341004 ) ) ( not ( = ?auto_341000 ?auto_341005 ) ) ( not ( = ?auto_341001 ?auto_341002 ) ) ( not ( = ?auto_341001 ?auto_341003 ) ) ( not ( = ?auto_341001 ?auto_341004 ) ) ( not ( = ?auto_341001 ?auto_341005 ) ) ( not ( = ?auto_341002 ?auto_341003 ) ) ( not ( = ?auto_341002 ?auto_341004 ) ) ( not ( = ?auto_341002 ?auto_341005 ) ) ( not ( = ?auto_341003 ?auto_341004 ) ) ( not ( = ?auto_341003 ?auto_341005 ) ) ( not ( = ?auto_341004 ?auto_341005 ) ) ( ON ?auto_341003 ?auto_341004 ) ( ON ?auto_341002 ?auto_341003 ) ( CLEAR ?auto_341000 ) ( ON ?auto_341001 ?auto_341002 ) ( CLEAR ?auto_341001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_340994 ?auto_340995 ?auto_340996 ?auto_340997 ?auto_340998 ?auto_340999 ?auto_341000 ?auto_341001 )
      ( MAKE-11PILE ?auto_340994 ?auto_340995 ?auto_340996 ?auto_340997 ?auto_340998 ?auto_340999 ?auto_341000 ?auto_341001 ?auto_341002 ?auto_341003 ?auto_341004 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341040 - BLOCK
      ?auto_341041 - BLOCK
      ?auto_341042 - BLOCK
      ?auto_341043 - BLOCK
      ?auto_341044 - BLOCK
      ?auto_341045 - BLOCK
      ?auto_341046 - BLOCK
      ?auto_341047 - BLOCK
      ?auto_341048 - BLOCK
      ?auto_341049 - BLOCK
      ?auto_341050 - BLOCK
    )
    :vars
    (
      ?auto_341051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341050 ?auto_341051 ) ( ON-TABLE ?auto_341040 ) ( ON ?auto_341041 ?auto_341040 ) ( ON ?auto_341042 ?auto_341041 ) ( ON ?auto_341043 ?auto_341042 ) ( ON ?auto_341044 ?auto_341043 ) ( ON ?auto_341045 ?auto_341044 ) ( not ( = ?auto_341040 ?auto_341041 ) ) ( not ( = ?auto_341040 ?auto_341042 ) ) ( not ( = ?auto_341040 ?auto_341043 ) ) ( not ( = ?auto_341040 ?auto_341044 ) ) ( not ( = ?auto_341040 ?auto_341045 ) ) ( not ( = ?auto_341040 ?auto_341046 ) ) ( not ( = ?auto_341040 ?auto_341047 ) ) ( not ( = ?auto_341040 ?auto_341048 ) ) ( not ( = ?auto_341040 ?auto_341049 ) ) ( not ( = ?auto_341040 ?auto_341050 ) ) ( not ( = ?auto_341040 ?auto_341051 ) ) ( not ( = ?auto_341041 ?auto_341042 ) ) ( not ( = ?auto_341041 ?auto_341043 ) ) ( not ( = ?auto_341041 ?auto_341044 ) ) ( not ( = ?auto_341041 ?auto_341045 ) ) ( not ( = ?auto_341041 ?auto_341046 ) ) ( not ( = ?auto_341041 ?auto_341047 ) ) ( not ( = ?auto_341041 ?auto_341048 ) ) ( not ( = ?auto_341041 ?auto_341049 ) ) ( not ( = ?auto_341041 ?auto_341050 ) ) ( not ( = ?auto_341041 ?auto_341051 ) ) ( not ( = ?auto_341042 ?auto_341043 ) ) ( not ( = ?auto_341042 ?auto_341044 ) ) ( not ( = ?auto_341042 ?auto_341045 ) ) ( not ( = ?auto_341042 ?auto_341046 ) ) ( not ( = ?auto_341042 ?auto_341047 ) ) ( not ( = ?auto_341042 ?auto_341048 ) ) ( not ( = ?auto_341042 ?auto_341049 ) ) ( not ( = ?auto_341042 ?auto_341050 ) ) ( not ( = ?auto_341042 ?auto_341051 ) ) ( not ( = ?auto_341043 ?auto_341044 ) ) ( not ( = ?auto_341043 ?auto_341045 ) ) ( not ( = ?auto_341043 ?auto_341046 ) ) ( not ( = ?auto_341043 ?auto_341047 ) ) ( not ( = ?auto_341043 ?auto_341048 ) ) ( not ( = ?auto_341043 ?auto_341049 ) ) ( not ( = ?auto_341043 ?auto_341050 ) ) ( not ( = ?auto_341043 ?auto_341051 ) ) ( not ( = ?auto_341044 ?auto_341045 ) ) ( not ( = ?auto_341044 ?auto_341046 ) ) ( not ( = ?auto_341044 ?auto_341047 ) ) ( not ( = ?auto_341044 ?auto_341048 ) ) ( not ( = ?auto_341044 ?auto_341049 ) ) ( not ( = ?auto_341044 ?auto_341050 ) ) ( not ( = ?auto_341044 ?auto_341051 ) ) ( not ( = ?auto_341045 ?auto_341046 ) ) ( not ( = ?auto_341045 ?auto_341047 ) ) ( not ( = ?auto_341045 ?auto_341048 ) ) ( not ( = ?auto_341045 ?auto_341049 ) ) ( not ( = ?auto_341045 ?auto_341050 ) ) ( not ( = ?auto_341045 ?auto_341051 ) ) ( not ( = ?auto_341046 ?auto_341047 ) ) ( not ( = ?auto_341046 ?auto_341048 ) ) ( not ( = ?auto_341046 ?auto_341049 ) ) ( not ( = ?auto_341046 ?auto_341050 ) ) ( not ( = ?auto_341046 ?auto_341051 ) ) ( not ( = ?auto_341047 ?auto_341048 ) ) ( not ( = ?auto_341047 ?auto_341049 ) ) ( not ( = ?auto_341047 ?auto_341050 ) ) ( not ( = ?auto_341047 ?auto_341051 ) ) ( not ( = ?auto_341048 ?auto_341049 ) ) ( not ( = ?auto_341048 ?auto_341050 ) ) ( not ( = ?auto_341048 ?auto_341051 ) ) ( not ( = ?auto_341049 ?auto_341050 ) ) ( not ( = ?auto_341049 ?auto_341051 ) ) ( not ( = ?auto_341050 ?auto_341051 ) ) ( ON ?auto_341049 ?auto_341050 ) ( ON ?auto_341048 ?auto_341049 ) ( ON ?auto_341047 ?auto_341048 ) ( CLEAR ?auto_341045 ) ( ON ?auto_341046 ?auto_341047 ) ( CLEAR ?auto_341046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_341040 ?auto_341041 ?auto_341042 ?auto_341043 ?auto_341044 ?auto_341045 ?auto_341046 )
      ( MAKE-11PILE ?auto_341040 ?auto_341041 ?auto_341042 ?auto_341043 ?auto_341044 ?auto_341045 ?auto_341046 ?auto_341047 ?auto_341048 ?auto_341049 ?auto_341050 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341086 - BLOCK
      ?auto_341087 - BLOCK
      ?auto_341088 - BLOCK
      ?auto_341089 - BLOCK
      ?auto_341090 - BLOCK
      ?auto_341091 - BLOCK
      ?auto_341092 - BLOCK
      ?auto_341093 - BLOCK
      ?auto_341094 - BLOCK
      ?auto_341095 - BLOCK
      ?auto_341096 - BLOCK
    )
    :vars
    (
      ?auto_341097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341096 ?auto_341097 ) ( ON-TABLE ?auto_341086 ) ( ON ?auto_341087 ?auto_341086 ) ( ON ?auto_341088 ?auto_341087 ) ( ON ?auto_341089 ?auto_341088 ) ( ON ?auto_341090 ?auto_341089 ) ( not ( = ?auto_341086 ?auto_341087 ) ) ( not ( = ?auto_341086 ?auto_341088 ) ) ( not ( = ?auto_341086 ?auto_341089 ) ) ( not ( = ?auto_341086 ?auto_341090 ) ) ( not ( = ?auto_341086 ?auto_341091 ) ) ( not ( = ?auto_341086 ?auto_341092 ) ) ( not ( = ?auto_341086 ?auto_341093 ) ) ( not ( = ?auto_341086 ?auto_341094 ) ) ( not ( = ?auto_341086 ?auto_341095 ) ) ( not ( = ?auto_341086 ?auto_341096 ) ) ( not ( = ?auto_341086 ?auto_341097 ) ) ( not ( = ?auto_341087 ?auto_341088 ) ) ( not ( = ?auto_341087 ?auto_341089 ) ) ( not ( = ?auto_341087 ?auto_341090 ) ) ( not ( = ?auto_341087 ?auto_341091 ) ) ( not ( = ?auto_341087 ?auto_341092 ) ) ( not ( = ?auto_341087 ?auto_341093 ) ) ( not ( = ?auto_341087 ?auto_341094 ) ) ( not ( = ?auto_341087 ?auto_341095 ) ) ( not ( = ?auto_341087 ?auto_341096 ) ) ( not ( = ?auto_341087 ?auto_341097 ) ) ( not ( = ?auto_341088 ?auto_341089 ) ) ( not ( = ?auto_341088 ?auto_341090 ) ) ( not ( = ?auto_341088 ?auto_341091 ) ) ( not ( = ?auto_341088 ?auto_341092 ) ) ( not ( = ?auto_341088 ?auto_341093 ) ) ( not ( = ?auto_341088 ?auto_341094 ) ) ( not ( = ?auto_341088 ?auto_341095 ) ) ( not ( = ?auto_341088 ?auto_341096 ) ) ( not ( = ?auto_341088 ?auto_341097 ) ) ( not ( = ?auto_341089 ?auto_341090 ) ) ( not ( = ?auto_341089 ?auto_341091 ) ) ( not ( = ?auto_341089 ?auto_341092 ) ) ( not ( = ?auto_341089 ?auto_341093 ) ) ( not ( = ?auto_341089 ?auto_341094 ) ) ( not ( = ?auto_341089 ?auto_341095 ) ) ( not ( = ?auto_341089 ?auto_341096 ) ) ( not ( = ?auto_341089 ?auto_341097 ) ) ( not ( = ?auto_341090 ?auto_341091 ) ) ( not ( = ?auto_341090 ?auto_341092 ) ) ( not ( = ?auto_341090 ?auto_341093 ) ) ( not ( = ?auto_341090 ?auto_341094 ) ) ( not ( = ?auto_341090 ?auto_341095 ) ) ( not ( = ?auto_341090 ?auto_341096 ) ) ( not ( = ?auto_341090 ?auto_341097 ) ) ( not ( = ?auto_341091 ?auto_341092 ) ) ( not ( = ?auto_341091 ?auto_341093 ) ) ( not ( = ?auto_341091 ?auto_341094 ) ) ( not ( = ?auto_341091 ?auto_341095 ) ) ( not ( = ?auto_341091 ?auto_341096 ) ) ( not ( = ?auto_341091 ?auto_341097 ) ) ( not ( = ?auto_341092 ?auto_341093 ) ) ( not ( = ?auto_341092 ?auto_341094 ) ) ( not ( = ?auto_341092 ?auto_341095 ) ) ( not ( = ?auto_341092 ?auto_341096 ) ) ( not ( = ?auto_341092 ?auto_341097 ) ) ( not ( = ?auto_341093 ?auto_341094 ) ) ( not ( = ?auto_341093 ?auto_341095 ) ) ( not ( = ?auto_341093 ?auto_341096 ) ) ( not ( = ?auto_341093 ?auto_341097 ) ) ( not ( = ?auto_341094 ?auto_341095 ) ) ( not ( = ?auto_341094 ?auto_341096 ) ) ( not ( = ?auto_341094 ?auto_341097 ) ) ( not ( = ?auto_341095 ?auto_341096 ) ) ( not ( = ?auto_341095 ?auto_341097 ) ) ( not ( = ?auto_341096 ?auto_341097 ) ) ( ON ?auto_341095 ?auto_341096 ) ( ON ?auto_341094 ?auto_341095 ) ( ON ?auto_341093 ?auto_341094 ) ( ON ?auto_341092 ?auto_341093 ) ( CLEAR ?auto_341090 ) ( ON ?auto_341091 ?auto_341092 ) ( CLEAR ?auto_341091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_341086 ?auto_341087 ?auto_341088 ?auto_341089 ?auto_341090 ?auto_341091 )
      ( MAKE-11PILE ?auto_341086 ?auto_341087 ?auto_341088 ?auto_341089 ?auto_341090 ?auto_341091 ?auto_341092 ?auto_341093 ?auto_341094 ?auto_341095 ?auto_341096 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341132 - BLOCK
      ?auto_341133 - BLOCK
      ?auto_341134 - BLOCK
      ?auto_341135 - BLOCK
      ?auto_341136 - BLOCK
      ?auto_341137 - BLOCK
      ?auto_341138 - BLOCK
      ?auto_341139 - BLOCK
      ?auto_341140 - BLOCK
      ?auto_341141 - BLOCK
      ?auto_341142 - BLOCK
    )
    :vars
    (
      ?auto_341143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341142 ?auto_341143 ) ( ON-TABLE ?auto_341132 ) ( ON ?auto_341133 ?auto_341132 ) ( ON ?auto_341134 ?auto_341133 ) ( ON ?auto_341135 ?auto_341134 ) ( not ( = ?auto_341132 ?auto_341133 ) ) ( not ( = ?auto_341132 ?auto_341134 ) ) ( not ( = ?auto_341132 ?auto_341135 ) ) ( not ( = ?auto_341132 ?auto_341136 ) ) ( not ( = ?auto_341132 ?auto_341137 ) ) ( not ( = ?auto_341132 ?auto_341138 ) ) ( not ( = ?auto_341132 ?auto_341139 ) ) ( not ( = ?auto_341132 ?auto_341140 ) ) ( not ( = ?auto_341132 ?auto_341141 ) ) ( not ( = ?auto_341132 ?auto_341142 ) ) ( not ( = ?auto_341132 ?auto_341143 ) ) ( not ( = ?auto_341133 ?auto_341134 ) ) ( not ( = ?auto_341133 ?auto_341135 ) ) ( not ( = ?auto_341133 ?auto_341136 ) ) ( not ( = ?auto_341133 ?auto_341137 ) ) ( not ( = ?auto_341133 ?auto_341138 ) ) ( not ( = ?auto_341133 ?auto_341139 ) ) ( not ( = ?auto_341133 ?auto_341140 ) ) ( not ( = ?auto_341133 ?auto_341141 ) ) ( not ( = ?auto_341133 ?auto_341142 ) ) ( not ( = ?auto_341133 ?auto_341143 ) ) ( not ( = ?auto_341134 ?auto_341135 ) ) ( not ( = ?auto_341134 ?auto_341136 ) ) ( not ( = ?auto_341134 ?auto_341137 ) ) ( not ( = ?auto_341134 ?auto_341138 ) ) ( not ( = ?auto_341134 ?auto_341139 ) ) ( not ( = ?auto_341134 ?auto_341140 ) ) ( not ( = ?auto_341134 ?auto_341141 ) ) ( not ( = ?auto_341134 ?auto_341142 ) ) ( not ( = ?auto_341134 ?auto_341143 ) ) ( not ( = ?auto_341135 ?auto_341136 ) ) ( not ( = ?auto_341135 ?auto_341137 ) ) ( not ( = ?auto_341135 ?auto_341138 ) ) ( not ( = ?auto_341135 ?auto_341139 ) ) ( not ( = ?auto_341135 ?auto_341140 ) ) ( not ( = ?auto_341135 ?auto_341141 ) ) ( not ( = ?auto_341135 ?auto_341142 ) ) ( not ( = ?auto_341135 ?auto_341143 ) ) ( not ( = ?auto_341136 ?auto_341137 ) ) ( not ( = ?auto_341136 ?auto_341138 ) ) ( not ( = ?auto_341136 ?auto_341139 ) ) ( not ( = ?auto_341136 ?auto_341140 ) ) ( not ( = ?auto_341136 ?auto_341141 ) ) ( not ( = ?auto_341136 ?auto_341142 ) ) ( not ( = ?auto_341136 ?auto_341143 ) ) ( not ( = ?auto_341137 ?auto_341138 ) ) ( not ( = ?auto_341137 ?auto_341139 ) ) ( not ( = ?auto_341137 ?auto_341140 ) ) ( not ( = ?auto_341137 ?auto_341141 ) ) ( not ( = ?auto_341137 ?auto_341142 ) ) ( not ( = ?auto_341137 ?auto_341143 ) ) ( not ( = ?auto_341138 ?auto_341139 ) ) ( not ( = ?auto_341138 ?auto_341140 ) ) ( not ( = ?auto_341138 ?auto_341141 ) ) ( not ( = ?auto_341138 ?auto_341142 ) ) ( not ( = ?auto_341138 ?auto_341143 ) ) ( not ( = ?auto_341139 ?auto_341140 ) ) ( not ( = ?auto_341139 ?auto_341141 ) ) ( not ( = ?auto_341139 ?auto_341142 ) ) ( not ( = ?auto_341139 ?auto_341143 ) ) ( not ( = ?auto_341140 ?auto_341141 ) ) ( not ( = ?auto_341140 ?auto_341142 ) ) ( not ( = ?auto_341140 ?auto_341143 ) ) ( not ( = ?auto_341141 ?auto_341142 ) ) ( not ( = ?auto_341141 ?auto_341143 ) ) ( not ( = ?auto_341142 ?auto_341143 ) ) ( ON ?auto_341141 ?auto_341142 ) ( ON ?auto_341140 ?auto_341141 ) ( ON ?auto_341139 ?auto_341140 ) ( ON ?auto_341138 ?auto_341139 ) ( ON ?auto_341137 ?auto_341138 ) ( CLEAR ?auto_341135 ) ( ON ?auto_341136 ?auto_341137 ) ( CLEAR ?auto_341136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_341132 ?auto_341133 ?auto_341134 ?auto_341135 ?auto_341136 )
      ( MAKE-11PILE ?auto_341132 ?auto_341133 ?auto_341134 ?auto_341135 ?auto_341136 ?auto_341137 ?auto_341138 ?auto_341139 ?auto_341140 ?auto_341141 ?auto_341142 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341178 - BLOCK
      ?auto_341179 - BLOCK
      ?auto_341180 - BLOCK
      ?auto_341181 - BLOCK
      ?auto_341182 - BLOCK
      ?auto_341183 - BLOCK
      ?auto_341184 - BLOCK
      ?auto_341185 - BLOCK
      ?auto_341186 - BLOCK
      ?auto_341187 - BLOCK
      ?auto_341188 - BLOCK
    )
    :vars
    (
      ?auto_341189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341188 ?auto_341189 ) ( ON-TABLE ?auto_341178 ) ( ON ?auto_341179 ?auto_341178 ) ( ON ?auto_341180 ?auto_341179 ) ( not ( = ?auto_341178 ?auto_341179 ) ) ( not ( = ?auto_341178 ?auto_341180 ) ) ( not ( = ?auto_341178 ?auto_341181 ) ) ( not ( = ?auto_341178 ?auto_341182 ) ) ( not ( = ?auto_341178 ?auto_341183 ) ) ( not ( = ?auto_341178 ?auto_341184 ) ) ( not ( = ?auto_341178 ?auto_341185 ) ) ( not ( = ?auto_341178 ?auto_341186 ) ) ( not ( = ?auto_341178 ?auto_341187 ) ) ( not ( = ?auto_341178 ?auto_341188 ) ) ( not ( = ?auto_341178 ?auto_341189 ) ) ( not ( = ?auto_341179 ?auto_341180 ) ) ( not ( = ?auto_341179 ?auto_341181 ) ) ( not ( = ?auto_341179 ?auto_341182 ) ) ( not ( = ?auto_341179 ?auto_341183 ) ) ( not ( = ?auto_341179 ?auto_341184 ) ) ( not ( = ?auto_341179 ?auto_341185 ) ) ( not ( = ?auto_341179 ?auto_341186 ) ) ( not ( = ?auto_341179 ?auto_341187 ) ) ( not ( = ?auto_341179 ?auto_341188 ) ) ( not ( = ?auto_341179 ?auto_341189 ) ) ( not ( = ?auto_341180 ?auto_341181 ) ) ( not ( = ?auto_341180 ?auto_341182 ) ) ( not ( = ?auto_341180 ?auto_341183 ) ) ( not ( = ?auto_341180 ?auto_341184 ) ) ( not ( = ?auto_341180 ?auto_341185 ) ) ( not ( = ?auto_341180 ?auto_341186 ) ) ( not ( = ?auto_341180 ?auto_341187 ) ) ( not ( = ?auto_341180 ?auto_341188 ) ) ( not ( = ?auto_341180 ?auto_341189 ) ) ( not ( = ?auto_341181 ?auto_341182 ) ) ( not ( = ?auto_341181 ?auto_341183 ) ) ( not ( = ?auto_341181 ?auto_341184 ) ) ( not ( = ?auto_341181 ?auto_341185 ) ) ( not ( = ?auto_341181 ?auto_341186 ) ) ( not ( = ?auto_341181 ?auto_341187 ) ) ( not ( = ?auto_341181 ?auto_341188 ) ) ( not ( = ?auto_341181 ?auto_341189 ) ) ( not ( = ?auto_341182 ?auto_341183 ) ) ( not ( = ?auto_341182 ?auto_341184 ) ) ( not ( = ?auto_341182 ?auto_341185 ) ) ( not ( = ?auto_341182 ?auto_341186 ) ) ( not ( = ?auto_341182 ?auto_341187 ) ) ( not ( = ?auto_341182 ?auto_341188 ) ) ( not ( = ?auto_341182 ?auto_341189 ) ) ( not ( = ?auto_341183 ?auto_341184 ) ) ( not ( = ?auto_341183 ?auto_341185 ) ) ( not ( = ?auto_341183 ?auto_341186 ) ) ( not ( = ?auto_341183 ?auto_341187 ) ) ( not ( = ?auto_341183 ?auto_341188 ) ) ( not ( = ?auto_341183 ?auto_341189 ) ) ( not ( = ?auto_341184 ?auto_341185 ) ) ( not ( = ?auto_341184 ?auto_341186 ) ) ( not ( = ?auto_341184 ?auto_341187 ) ) ( not ( = ?auto_341184 ?auto_341188 ) ) ( not ( = ?auto_341184 ?auto_341189 ) ) ( not ( = ?auto_341185 ?auto_341186 ) ) ( not ( = ?auto_341185 ?auto_341187 ) ) ( not ( = ?auto_341185 ?auto_341188 ) ) ( not ( = ?auto_341185 ?auto_341189 ) ) ( not ( = ?auto_341186 ?auto_341187 ) ) ( not ( = ?auto_341186 ?auto_341188 ) ) ( not ( = ?auto_341186 ?auto_341189 ) ) ( not ( = ?auto_341187 ?auto_341188 ) ) ( not ( = ?auto_341187 ?auto_341189 ) ) ( not ( = ?auto_341188 ?auto_341189 ) ) ( ON ?auto_341187 ?auto_341188 ) ( ON ?auto_341186 ?auto_341187 ) ( ON ?auto_341185 ?auto_341186 ) ( ON ?auto_341184 ?auto_341185 ) ( ON ?auto_341183 ?auto_341184 ) ( ON ?auto_341182 ?auto_341183 ) ( CLEAR ?auto_341180 ) ( ON ?auto_341181 ?auto_341182 ) ( CLEAR ?auto_341181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_341178 ?auto_341179 ?auto_341180 ?auto_341181 )
      ( MAKE-11PILE ?auto_341178 ?auto_341179 ?auto_341180 ?auto_341181 ?auto_341182 ?auto_341183 ?auto_341184 ?auto_341185 ?auto_341186 ?auto_341187 ?auto_341188 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341224 - BLOCK
      ?auto_341225 - BLOCK
      ?auto_341226 - BLOCK
      ?auto_341227 - BLOCK
      ?auto_341228 - BLOCK
      ?auto_341229 - BLOCK
      ?auto_341230 - BLOCK
      ?auto_341231 - BLOCK
      ?auto_341232 - BLOCK
      ?auto_341233 - BLOCK
      ?auto_341234 - BLOCK
    )
    :vars
    (
      ?auto_341235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341234 ?auto_341235 ) ( ON-TABLE ?auto_341224 ) ( ON ?auto_341225 ?auto_341224 ) ( not ( = ?auto_341224 ?auto_341225 ) ) ( not ( = ?auto_341224 ?auto_341226 ) ) ( not ( = ?auto_341224 ?auto_341227 ) ) ( not ( = ?auto_341224 ?auto_341228 ) ) ( not ( = ?auto_341224 ?auto_341229 ) ) ( not ( = ?auto_341224 ?auto_341230 ) ) ( not ( = ?auto_341224 ?auto_341231 ) ) ( not ( = ?auto_341224 ?auto_341232 ) ) ( not ( = ?auto_341224 ?auto_341233 ) ) ( not ( = ?auto_341224 ?auto_341234 ) ) ( not ( = ?auto_341224 ?auto_341235 ) ) ( not ( = ?auto_341225 ?auto_341226 ) ) ( not ( = ?auto_341225 ?auto_341227 ) ) ( not ( = ?auto_341225 ?auto_341228 ) ) ( not ( = ?auto_341225 ?auto_341229 ) ) ( not ( = ?auto_341225 ?auto_341230 ) ) ( not ( = ?auto_341225 ?auto_341231 ) ) ( not ( = ?auto_341225 ?auto_341232 ) ) ( not ( = ?auto_341225 ?auto_341233 ) ) ( not ( = ?auto_341225 ?auto_341234 ) ) ( not ( = ?auto_341225 ?auto_341235 ) ) ( not ( = ?auto_341226 ?auto_341227 ) ) ( not ( = ?auto_341226 ?auto_341228 ) ) ( not ( = ?auto_341226 ?auto_341229 ) ) ( not ( = ?auto_341226 ?auto_341230 ) ) ( not ( = ?auto_341226 ?auto_341231 ) ) ( not ( = ?auto_341226 ?auto_341232 ) ) ( not ( = ?auto_341226 ?auto_341233 ) ) ( not ( = ?auto_341226 ?auto_341234 ) ) ( not ( = ?auto_341226 ?auto_341235 ) ) ( not ( = ?auto_341227 ?auto_341228 ) ) ( not ( = ?auto_341227 ?auto_341229 ) ) ( not ( = ?auto_341227 ?auto_341230 ) ) ( not ( = ?auto_341227 ?auto_341231 ) ) ( not ( = ?auto_341227 ?auto_341232 ) ) ( not ( = ?auto_341227 ?auto_341233 ) ) ( not ( = ?auto_341227 ?auto_341234 ) ) ( not ( = ?auto_341227 ?auto_341235 ) ) ( not ( = ?auto_341228 ?auto_341229 ) ) ( not ( = ?auto_341228 ?auto_341230 ) ) ( not ( = ?auto_341228 ?auto_341231 ) ) ( not ( = ?auto_341228 ?auto_341232 ) ) ( not ( = ?auto_341228 ?auto_341233 ) ) ( not ( = ?auto_341228 ?auto_341234 ) ) ( not ( = ?auto_341228 ?auto_341235 ) ) ( not ( = ?auto_341229 ?auto_341230 ) ) ( not ( = ?auto_341229 ?auto_341231 ) ) ( not ( = ?auto_341229 ?auto_341232 ) ) ( not ( = ?auto_341229 ?auto_341233 ) ) ( not ( = ?auto_341229 ?auto_341234 ) ) ( not ( = ?auto_341229 ?auto_341235 ) ) ( not ( = ?auto_341230 ?auto_341231 ) ) ( not ( = ?auto_341230 ?auto_341232 ) ) ( not ( = ?auto_341230 ?auto_341233 ) ) ( not ( = ?auto_341230 ?auto_341234 ) ) ( not ( = ?auto_341230 ?auto_341235 ) ) ( not ( = ?auto_341231 ?auto_341232 ) ) ( not ( = ?auto_341231 ?auto_341233 ) ) ( not ( = ?auto_341231 ?auto_341234 ) ) ( not ( = ?auto_341231 ?auto_341235 ) ) ( not ( = ?auto_341232 ?auto_341233 ) ) ( not ( = ?auto_341232 ?auto_341234 ) ) ( not ( = ?auto_341232 ?auto_341235 ) ) ( not ( = ?auto_341233 ?auto_341234 ) ) ( not ( = ?auto_341233 ?auto_341235 ) ) ( not ( = ?auto_341234 ?auto_341235 ) ) ( ON ?auto_341233 ?auto_341234 ) ( ON ?auto_341232 ?auto_341233 ) ( ON ?auto_341231 ?auto_341232 ) ( ON ?auto_341230 ?auto_341231 ) ( ON ?auto_341229 ?auto_341230 ) ( ON ?auto_341228 ?auto_341229 ) ( ON ?auto_341227 ?auto_341228 ) ( CLEAR ?auto_341225 ) ( ON ?auto_341226 ?auto_341227 ) ( CLEAR ?auto_341226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_341224 ?auto_341225 ?auto_341226 )
      ( MAKE-11PILE ?auto_341224 ?auto_341225 ?auto_341226 ?auto_341227 ?auto_341228 ?auto_341229 ?auto_341230 ?auto_341231 ?auto_341232 ?auto_341233 ?auto_341234 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341270 - BLOCK
      ?auto_341271 - BLOCK
      ?auto_341272 - BLOCK
      ?auto_341273 - BLOCK
      ?auto_341274 - BLOCK
      ?auto_341275 - BLOCK
      ?auto_341276 - BLOCK
      ?auto_341277 - BLOCK
      ?auto_341278 - BLOCK
      ?auto_341279 - BLOCK
      ?auto_341280 - BLOCK
    )
    :vars
    (
      ?auto_341281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341280 ?auto_341281 ) ( ON-TABLE ?auto_341270 ) ( not ( = ?auto_341270 ?auto_341271 ) ) ( not ( = ?auto_341270 ?auto_341272 ) ) ( not ( = ?auto_341270 ?auto_341273 ) ) ( not ( = ?auto_341270 ?auto_341274 ) ) ( not ( = ?auto_341270 ?auto_341275 ) ) ( not ( = ?auto_341270 ?auto_341276 ) ) ( not ( = ?auto_341270 ?auto_341277 ) ) ( not ( = ?auto_341270 ?auto_341278 ) ) ( not ( = ?auto_341270 ?auto_341279 ) ) ( not ( = ?auto_341270 ?auto_341280 ) ) ( not ( = ?auto_341270 ?auto_341281 ) ) ( not ( = ?auto_341271 ?auto_341272 ) ) ( not ( = ?auto_341271 ?auto_341273 ) ) ( not ( = ?auto_341271 ?auto_341274 ) ) ( not ( = ?auto_341271 ?auto_341275 ) ) ( not ( = ?auto_341271 ?auto_341276 ) ) ( not ( = ?auto_341271 ?auto_341277 ) ) ( not ( = ?auto_341271 ?auto_341278 ) ) ( not ( = ?auto_341271 ?auto_341279 ) ) ( not ( = ?auto_341271 ?auto_341280 ) ) ( not ( = ?auto_341271 ?auto_341281 ) ) ( not ( = ?auto_341272 ?auto_341273 ) ) ( not ( = ?auto_341272 ?auto_341274 ) ) ( not ( = ?auto_341272 ?auto_341275 ) ) ( not ( = ?auto_341272 ?auto_341276 ) ) ( not ( = ?auto_341272 ?auto_341277 ) ) ( not ( = ?auto_341272 ?auto_341278 ) ) ( not ( = ?auto_341272 ?auto_341279 ) ) ( not ( = ?auto_341272 ?auto_341280 ) ) ( not ( = ?auto_341272 ?auto_341281 ) ) ( not ( = ?auto_341273 ?auto_341274 ) ) ( not ( = ?auto_341273 ?auto_341275 ) ) ( not ( = ?auto_341273 ?auto_341276 ) ) ( not ( = ?auto_341273 ?auto_341277 ) ) ( not ( = ?auto_341273 ?auto_341278 ) ) ( not ( = ?auto_341273 ?auto_341279 ) ) ( not ( = ?auto_341273 ?auto_341280 ) ) ( not ( = ?auto_341273 ?auto_341281 ) ) ( not ( = ?auto_341274 ?auto_341275 ) ) ( not ( = ?auto_341274 ?auto_341276 ) ) ( not ( = ?auto_341274 ?auto_341277 ) ) ( not ( = ?auto_341274 ?auto_341278 ) ) ( not ( = ?auto_341274 ?auto_341279 ) ) ( not ( = ?auto_341274 ?auto_341280 ) ) ( not ( = ?auto_341274 ?auto_341281 ) ) ( not ( = ?auto_341275 ?auto_341276 ) ) ( not ( = ?auto_341275 ?auto_341277 ) ) ( not ( = ?auto_341275 ?auto_341278 ) ) ( not ( = ?auto_341275 ?auto_341279 ) ) ( not ( = ?auto_341275 ?auto_341280 ) ) ( not ( = ?auto_341275 ?auto_341281 ) ) ( not ( = ?auto_341276 ?auto_341277 ) ) ( not ( = ?auto_341276 ?auto_341278 ) ) ( not ( = ?auto_341276 ?auto_341279 ) ) ( not ( = ?auto_341276 ?auto_341280 ) ) ( not ( = ?auto_341276 ?auto_341281 ) ) ( not ( = ?auto_341277 ?auto_341278 ) ) ( not ( = ?auto_341277 ?auto_341279 ) ) ( not ( = ?auto_341277 ?auto_341280 ) ) ( not ( = ?auto_341277 ?auto_341281 ) ) ( not ( = ?auto_341278 ?auto_341279 ) ) ( not ( = ?auto_341278 ?auto_341280 ) ) ( not ( = ?auto_341278 ?auto_341281 ) ) ( not ( = ?auto_341279 ?auto_341280 ) ) ( not ( = ?auto_341279 ?auto_341281 ) ) ( not ( = ?auto_341280 ?auto_341281 ) ) ( ON ?auto_341279 ?auto_341280 ) ( ON ?auto_341278 ?auto_341279 ) ( ON ?auto_341277 ?auto_341278 ) ( ON ?auto_341276 ?auto_341277 ) ( ON ?auto_341275 ?auto_341276 ) ( ON ?auto_341274 ?auto_341275 ) ( ON ?auto_341273 ?auto_341274 ) ( ON ?auto_341272 ?auto_341273 ) ( CLEAR ?auto_341270 ) ( ON ?auto_341271 ?auto_341272 ) ( CLEAR ?auto_341271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_341270 ?auto_341271 )
      ( MAKE-11PILE ?auto_341270 ?auto_341271 ?auto_341272 ?auto_341273 ?auto_341274 ?auto_341275 ?auto_341276 ?auto_341277 ?auto_341278 ?auto_341279 ?auto_341280 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_341316 - BLOCK
      ?auto_341317 - BLOCK
      ?auto_341318 - BLOCK
      ?auto_341319 - BLOCK
      ?auto_341320 - BLOCK
      ?auto_341321 - BLOCK
      ?auto_341322 - BLOCK
      ?auto_341323 - BLOCK
      ?auto_341324 - BLOCK
      ?auto_341325 - BLOCK
      ?auto_341326 - BLOCK
    )
    :vars
    (
      ?auto_341327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341326 ?auto_341327 ) ( not ( = ?auto_341316 ?auto_341317 ) ) ( not ( = ?auto_341316 ?auto_341318 ) ) ( not ( = ?auto_341316 ?auto_341319 ) ) ( not ( = ?auto_341316 ?auto_341320 ) ) ( not ( = ?auto_341316 ?auto_341321 ) ) ( not ( = ?auto_341316 ?auto_341322 ) ) ( not ( = ?auto_341316 ?auto_341323 ) ) ( not ( = ?auto_341316 ?auto_341324 ) ) ( not ( = ?auto_341316 ?auto_341325 ) ) ( not ( = ?auto_341316 ?auto_341326 ) ) ( not ( = ?auto_341316 ?auto_341327 ) ) ( not ( = ?auto_341317 ?auto_341318 ) ) ( not ( = ?auto_341317 ?auto_341319 ) ) ( not ( = ?auto_341317 ?auto_341320 ) ) ( not ( = ?auto_341317 ?auto_341321 ) ) ( not ( = ?auto_341317 ?auto_341322 ) ) ( not ( = ?auto_341317 ?auto_341323 ) ) ( not ( = ?auto_341317 ?auto_341324 ) ) ( not ( = ?auto_341317 ?auto_341325 ) ) ( not ( = ?auto_341317 ?auto_341326 ) ) ( not ( = ?auto_341317 ?auto_341327 ) ) ( not ( = ?auto_341318 ?auto_341319 ) ) ( not ( = ?auto_341318 ?auto_341320 ) ) ( not ( = ?auto_341318 ?auto_341321 ) ) ( not ( = ?auto_341318 ?auto_341322 ) ) ( not ( = ?auto_341318 ?auto_341323 ) ) ( not ( = ?auto_341318 ?auto_341324 ) ) ( not ( = ?auto_341318 ?auto_341325 ) ) ( not ( = ?auto_341318 ?auto_341326 ) ) ( not ( = ?auto_341318 ?auto_341327 ) ) ( not ( = ?auto_341319 ?auto_341320 ) ) ( not ( = ?auto_341319 ?auto_341321 ) ) ( not ( = ?auto_341319 ?auto_341322 ) ) ( not ( = ?auto_341319 ?auto_341323 ) ) ( not ( = ?auto_341319 ?auto_341324 ) ) ( not ( = ?auto_341319 ?auto_341325 ) ) ( not ( = ?auto_341319 ?auto_341326 ) ) ( not ( = ?auto_341319 ?auto_341327 ) ) ( not ( = ?auto_341320 ?auto_341321 ) ) ( not ( = ?auto_341320 ?auto_341322 ) ) ( not ( = ?auto_341320 ?auto_341323 ) ) ( not ( = ?auto_341320 ?auto_341324 ) ) ( not ( = ?auto_341320 ?auto_341325 ) ) ( not ( = ?auto_341320 ?auto_341326 ) ) ( not ( = ?auto_341320 ?auto_341327 ) ) ( not ( = ?auto_341321 ?auto_341322 ) ) ( not ( = ?auto_341321 ?auto_341323 ) ) ( not ( = ?auto_341321 ?auto_341324 ) ) ( not ( = ?auto_341321 ?auto_341325 ) ) ( not ( = ?auto_341321 ?auto_341326 ) ) ( not ( = ?auto_341321 ?auto_341327 ) ) ( not ( = ?auto_341322 ?auto_341323 ) ) ( not ( = ?auto_341322 ?auto_341324 ) ) ( not ( = ?auto_341322 ?auto_341325 ) ) ( not ( = ?auto_341322 ?auto_341326 ) ) ( not ( = ?auto_341322 ?auto_341327 ) ) ( not ( = ?auto_341323 ?auto_341324 ) ) ( not ( = ?auto_341323 ?auto_341325 ) ) ( not ( = ?auto_341323 ?auto_341326 ) ) ( not ( = ?auto_341323 ?auto_341327 ) ) ( not ( = ?auto_341324 ?auto_341325 ) ) ( not ( = ?auto_341324 ?auto_341326 ) ) ( not ( = ?auto_341324 ?auto_341327 ) ) ( not ( = ?auto_341325 ?auto_341326 ) ) ( not ( = ?auto_341325 ?auto_341327 ) ) ( not ( = ?auto_341326 ?auto_341327 ) ) ( ON ?auto_341325 ?auto_341326 ) ( ON ?auto_341324 ?auto_341325 ) ( ON ?auto_341323 ?auto_341324 ) ( ON ?auto_341322 ?auto_341323 ) ( ON ?auto_341321 ?auto_341322 ) ( ON ?auto_341320 ?auto_341321 ) ( ON ?auto_341319 ?auto_341320 ) ( ON ?auto_341318 ?auto_341319 ) ( ON ?auto_341317 ?auto_341318 ) ( ON ?auto_341316 ?auto_341317 ) ( CLEAR ?auto_341316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_341316 )
      ( MAKE-11PILE ?auto_341316 ?auto_341317 ?auto_341318 ?auto_341319 ?auto_341320 ?auto_341321 ?auto_341322 ?auto_341323 ?auto_341324 ?auto_341325 ?auto_341326 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341363 - BLOCK
      ?auto_341364 - BLOCK
      ?auto_341365 - BLOCK
      ?auto_341366 - BLOCK
      ?auto_341367 - BLOCK
      ?auto_341368 - BLOCK
      ?auto_341369 - BLOCK
      ?auto_341370 - BLOCK
      ?auto_341371 - BLOCK
      ?auto_341372 - BLOCK
      ?auto_341373 - BLOCK
      ?auto_341374 - BLOCK
    )
    :vars
    (
      ?auto_341375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_341373 ) ( ON ?auto_341374 ?auto_341375 ) ( CLEAR ?auto_341374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_341363 ) ( ON ?auto_341364 ?auto_341363 ) ( ON ?auto_341365 ?auto_341364 ) ( ON ?auto_341366 ?auto_341365 ) ( ON ?auto_341367 ?auto_341366 ) ( ON ?auto_341368 ?auto_341367 ) ( ON ?auto_341369 ?auto_341368 ) ( ON ?auto_341370 ?auto_341369 ) ( ON ?auto_341371 ?auto_341370 ) ( ON ?auto_341372 ?auto_341371 ) ( ON ?auto_341373 ?auto_341372 ) ( not ( = ?auto_341363 ?auto_341364 ) ) ( not ( = ?auto_341363 ?auto_341365 ) ) ( not ( = ?auto_341363 ?auto_341366 ) ) ( not ( = ?auto_341363 ?auto_341367 ) ) ( not ( = ?auto_341363 ?auto_341368 ) ) ( not ( = ?auto_341363 ?auto_341369 ) ) ( not ( = ?auto_341363 ?auto_341370 ) ) ( not ( = ?auto_341363 ?auto_341371 ) ) ( not ( = ?auto_341363 ?auto_341372 ) ) ( not ( = ?auto_341363 ?auto_341373 ) ) ( not ( = ?auto_341363 ?auto_341374 ) ) ( not ( = ?auto_341363 ?auto_341375 ) ) ( not ( = ?auto_341364 ?auto_341365 ) ) ( not ( = ?auto_341364 ?auto_341366 ) ) ( not ( = ?auto_341364 ?auto_341367 ) ) ( not ( = ?auto_341364 ?auto_341368 ) ) ( not ( = ?auto_341364 ?auto_341369 ) ) ( not ( = ?auto_341364 ?auto_341370 ) ) ( not ( = ?auto_341364 ?auto_341371 ) ) ( not ( = ?auto_341364 ?auto_341372 ) ) ( not ( = ?auto_341364 ?auto_341373 ) ) ( not ( = ?auto_341364 ?auto_341374 ) ) ( not ( = ?auto_341364 ?auto_341375 ) ) ( not ( = ?auto_341365 ?auto_341366 ) ) ( not ( = ?auto_341365 ?auto_341367 ) ) ( not ( = ?auto_341365 ?auto_341368 ) ) ( not ( = ?auto_341365 ?auto_341369 ) ) ( not ( = ?auto_341365 ?auto_341370 ) ) ( not ( = ?auto_341365 ?auto_341371 ) ) ( not ( = ?auto_341365 ?auto_341372 ) ) ( not ( = ?auto_341365 ?auto_341373 ) ) ( not ( = ?auto_341365 ?auto_341374 ) ) ( not ( = ?auto_341365 ?auto_341375 ) ) ( not ( = ?auto_341366 ?auto_341367 ) ) ( not ( = ?auto_341366 ?auto_341368 ) ) ( not ( = ?auto_341366 ?auto_341369 ) ) ( not ( = ?auto_341366 ?auto_341370 ) ) ( not ( = ?auto_341366 ?auto_341371 ) ) ( not ( = ?auto_341366 ?auto_341372 ) ) ( not ( = ?auto_341366 ?auto_341373 ) ) ( not ( = ?auto_341366 ?auto_341374 ) ) ( not ( = ?auto_341366 ?auto_341375 ) ) ( not ( = ?auto_341367 ?auto_341368 ) ) ( not ( = ?auto_341367 ?auto_341369 ) ) ( not ( = ?auto_341367 ?auto_341370 ) ) ( not ( = ?auto_341367 ?auto_341371 ) ) ( not ( = ?auto_341367 ?auto_341372 ) ) ( not ( = ?auto_341367 ?auto_341373 ) ) ( not ( = ?auto_341367 ?auto_341374 ) ) ( not ( = ?auto_341367 ?auto_341375 ) ) ( not ( = ?auto_341368 ?auto_341369 ) ) ( not ( = ?auto_341368 ?auto_341370 ) ) ( not ( = ?auto_341368 ?auto_341371 ) ) ( not ( = ?auto_341368 ?auto_341372 ) ) ( not ( = ?auto_341368 ?auto_341373 ) ) ( not ( = ?auto_341368 ?auto_341374 ) ) ( not ( = ?auto_341368 ?auto_341375 ) ) ( not ( = ?auto_341369 ?auto_341370 ) ) ( not ( = ?auto_341369 ?auto_341371 ) ) ( not ( = ?auto_341369 ?auto_341372 ) ) ( not ( = ?auto_341369 ?auto_341373 ) ) ( not ( = ?auto_341369 ?auto_341374 ) ) ( not ( = ?auto_341369 ?auto_341375 ) ) ( not ( = ?auto_341370 ?auto_341371 ) ) ( not ( = ?auto_341370 ?auto_341372 ) ) ( not ( = ?auto_341370 ?auto_341373 ) ) ( not ( = ?auto_341370 ?auto_341374 ) ) ( not ( = ?auto_341370 ?auto_341375 ) ) ( not ( = ?auto_341371 ?auto_341372 ) ) ( not ( = ?auto_341371 ?auto_341373 ) ) ( not ( = ?auto_341371 ?auto_341374 ) ) ( not ( = ?auto_341371 ?auto_341375 ) ) ( not ( = ?auto_341372 ?auto_341373 ) ) ( not ( = ?auto_341372 ?auto_341374 ) ) ( not ( = ?auto_341372 ?auto_341375 ) ) ( not ( = ?auto_341373 ?auto_341374 ) ) ( not ( = ?auto_341373 ?auto_341375 ) ) ( not ( = ?auto_341374 ?auto_341375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_341374 ?auto_341375 )
      ( !STACK ?auto_341374 ?auto_341373 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341413 - BLOCK
      ?auto_341414 - BLOCK
      ?auto_341415 - BLOCK
      ?auto_341416 - BLOCK
      ?auto_341417 - BLOCK
      ?auto_341418 - BLOCK
      ?auto_341419 - BLOCK
      ?auto_341420 - BLOCK
      ?auto_341421 - BLOCK
      ?auto_341422 - BLOCK
      ?auto_341423 - BLOCK
      ?auto_341424 - BLOCK
    )
    :vars
    (
      ?auto_341425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341424 ?auto_341425 ) ( ON-TABLE ?auto_341413 ) ( ON ?auto_341414 ?auto_341413 ) ( ON ?auto_341415 ?auto_341414 ) ( ON ?auto_341416 ?auto_341415 ) ( ON ?auto_341417 ?auto_341416 ) ( ON ?auto_341418 ?auto_341417 ) ( ON ?auto_341419 ?auto_341418 ) ( ON ?auto_341420 ?auto_341419 ) ( ON ?auto_341421 ?auto_341420 ) ( ON ?auto_341422 ?auto_341421 ) ( not ( = ?auto_341413 ?auto_341414 ) ) ( not ( = ?auto_341413 ?auto_341415 ) ) ( not ( = ?auto_341413 ?auto_341416 ) ) ( not ( = ?auto_341413 ?auto_341417 ) ) ( not ( = ?auto_341413 ?auto_341418 ) ) ( not ( = ?auto_341413 ?auto_341419 ) ) ( not ( = ?auto_341413 ?auto_341420 ) ) ( not ( = ?auto_341413 ?auto_341421 ) ) ( not ( = ?auto_341413 ?auto_341422 ) ) ( not ( = ?auto_341413 ?auto_341423 ) ) ( not ( = ?auto_341413 ?auto_341424 ) ) ( not ( = ?auto_341413 ?auto_341425 ) ) ( not ( = ?auto_341414 ?auto_341415 ) ) ( not ( = ?auto_341414 ?auto_341416 ) ) ( not ( = ?auto_341414 ?auto_341417 ) ) ( not ( = ?auto_341414 ?auto_341418 ) ) ( not ( = ?auto_341414 ?auto_341419 ) ) ( not ( = ?auto_341414 ?auto_341420 ) ) ( not ( = ?auto_341414 ?auto_341421 ) ) ( not ( = ?auto_341414 ?auto_341422 ) ) ( not ( = ?auto_341414 ?auto_341423 ) ) ( not ( = ?auto_341414 ?auto_341424 ) ) ( not ( = ?auto_341414 ?auto_341425 ) ) ( not ( = ?auto_341415 ?auto_341416 ) ) ( not ( = ?auto_341415 ?auto_341417 ) ) ( not ( = ?auto_341415 ?auto_341418 ) ) ( not ( = ?auto_341415 ?auto_341419 ) ) ( not ( = ?auto_341415 ?auto_341420 ) ) ( not ( = ?auto_341415 ?auto_341421 ) ) ( not ( = ?auto_341415 ?auto_341422 ) ) ( not ( = ?auto_341415 ?auto_341423 ) ) ( not ( = ?auto_341415 ?auto_341424 ) ) ( not ( = ?auto_341415 ?auto_341425 ) ) ( not ( = ?auto_341416 ?auto_341417 ) ) ( not ( = ?auto_341416 ?auto_341418 ) ) ( not ( = ?auto_341416 ?auto_341419 ) ) ( not ( = ?auto_341416 ?auto_341420 ) ) ( not ( = ?auto_341416 ?auto_341421 ) ) ( not ( = ?auto_341416 ?auto_341422 ) ) ( not ( = ?auto_341416 ?auto_341423 ) ) ( not ( = ?auto_341416 ?auto_341424 ) ) ( not ( = ?auto_341416 ?auto_341425 ) ) ( not ( = ?auto_341417 ?auto_341418 ) ) ( not ( = ?auto_341417 ?auto_341419 ) ) ( not ( = ?auto_341417 ?auto_341420 ) ) ( not ( = ?auto_341417 ?auto_341421 ) ) ( not ( = ?auto_341417 ?auto_341422 ) ) ( not ( = ?auto_341417 ?auto_341423 ) ) ( not ( = ?auto_341417 ?auto_341424 ) ) ( not ( = ?auto_341417 ?auto_341425 ) ) ( not ( = ?auto_341418 ?auto_341419 ) ) ( not ( = ?auto_341418 ?auto_341420 ) ) ( not ( = ?auto_341418 ?auto_341421 ) ) ( not ( = ?auto_341418 ?auto_341422 ) ) ( not ( = ?auto_341418 ?auto_341423 ) ) ( not ( = ?auto_341418 ?auto_341424 ) ) ( not ( = ?auto_341418 ?auto_341425 ) ) ( not ( = ?auto_341419 ?auto_341420 ) ) ( not ( = ?auto_341419 ?auto_341421 ) ) ( not ( = ?auto_341419 ?auto_341422 ) ) ( not ( = ?auto_341419 ?auto_341423 ) ) ( not ( = ?auto_341419 ?auto_341424 ) ) ( not ( = ?auto_341419 ?auto_341425 ) ) ( not ( = ?auto_341420 ?auto_341421 ) ) ( not ( = ?auto_341420 ?auto_341422 ) ) ( not ( = ?auto_341420 ?auto_341423 ) ) ( not ( = ?auto_341420 ?auto_341424 ) ) ( not ( = ?auto_341420 ?auto_341425 ) ) ( not ( = ?auto_341421 ?auto_341422 ) ) ( not ( = ?auto_341421 ?auto_341423 ) ) ( not ( = ?auto_341421 ?auto_341424 ) ) ( not ( = ?auto_341421 ?auto_341425 ) ) ( not ( = ?auto_341422 ?auto_341423 ) ) ( not ( = ?auto_341422 ?auto_341424 ) ) ( not ( = ?auto_341422 ?auto_341425 ) ) ( not ( = ?auto_341423 ?auto_341424 ) ) ( not ( = ?auto_341423 ?auto_341425 ) ) ( not ( = ?auto_341424 ?auto_341425 ) ) ( CLEAR ?auto_341422 ) ( ON ?auto_341423 ?auto_341424 ) ( CLEAR ?auto_341423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_341413 ?auto_341414 ?auto_341415 ?auto_341416 ?auto_341417 ?auto_341418 ?auto_341419 ?auto_341420 ?auto_341421 ?auto_341422 ?auto_341423 )
      ( MAKE-12PILE ?auto_341413 ?auto_341414 ?auto_341415 ?auto_341416 ?auto_341417 ?auto_341418 ?auto_341419 ?auto_341420 ?auto_341421 ?auto_341422 ?auto_341423 ?auto_341424 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341463 - BLOCK
      ?auto_341464 - BLOCK
      ?auto_341465 - BLOCK
      ?auto_341466 - BLOCK
      ?auto_341467 - BLOCK
      ?auto_341468 - BLOCK
      ?auto_341469 - BLOCK
      ?auto_341470 - BLOCK
      ?auto_341471 - BLOCK
      ?auto_341472 - BLOCK
      ?auto_341473 - BLOCK
      ?auto_341474 - BLOCK
    )
    :vars
    (
      ?auto_341475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341474 ?auto_341475 ) ( ON-TABLE ?auto_341463 ) ( ON ?auto_341464 ?auto_341463 ) ( ON ?auto_341465 ?auto_341464 ) ( ON ?auto_341466 ?auto_341465 ) ( ON ?auto_341467 ?auto_341466 ) ( ON ?auto_341468 ?auto_341467 ) ( ON ?auto_341469 ?auto_341468 ) ( ON ?auto_341470 ?auto_341469 ) ( ON ?auto_341471 ?auto_341470 ) ( not ( = ?auto_341463 ?auto_341464 ) ) ( not ( = ?auto_341463 ?auto_341465 ) ) ( not ( = ?auto_341463 ?auto_341466 ) ) ( not ( = ?auto_341463 ?auto_341467 ) ) ( not ( = ?auto_341463 ?auto_341468 ) ) ( not ( = ?auto_341463 ?auto_341469 ) ) ( not ( = ?auto_341463 ?auto_341470 ) ) ( not ( = ?auto_341463 ?auto_341471 ) ) ( not ( = ?auto_341463 ?auto_341472 ) ) ( not ( = ?auto_341463 ?auto_341473 ) ) ( not ( = ?auto_341463 ?auto_341474 ) ) ( not ( = ?auto_341463 ?auto_341475 ) ) ( not ( = ?auto_341464 ?auto_341465 ) ) ( not ( = ?auto_341464 ?auto_341466 ) ) ( not ( = ?auto_341464 ?auto_341467 ) ) ( not ( = ?auto_341464 ?auto_341468 ) ) ( not ( = ?auto_341464 ?auto_341469 ) ) ( not ( = ?auto_341464 ?auto_341470 ) ) ( not ( = ?auto_341464 ?auto_341471 ) ) ( not ( = ?auto_341464 ?auto_341472 ) ) ( not ( = ?auto_341464 ?auto_341473 ) ) ( not ( = ?auto_341464 ?auto_341474 ) ) ( not ( = ?auto_341464 ?auto_341475 ) ) ( not ( = ?auto_341465 ?auto_341466 ) ) ( not ( = ?auto_341465 ?auto_341467 ) ) ( not ( = ?auto_341465 ?auto_341468 ) ) ( not ( = ?auto_341465 ?auto_341469 ) ) ( not ( = ?auto_341465 ?auto_341470 ) ) ( not ( = ?auto_341465 ?auto_341471 ) ) ( not ( = ?auto_341465 ?auto_341472 ) ) ( not ( = ?auto_341465 ?auto_341473 ) ) ( not ( = ?auto_341465 ?auto_341474 ) ) ( not ( = ?auto_341465 ?auto_341475 ) ) ( not ( = ?auto_341466 ?auto_341467 ) ) ( not ( = ?auto_341466 ?auto_341468 ) ) ( not ( = ?auto_341466 ?auto_341469 ) ) ( not ( = ?auto_341466 ?auto_341470 ) ) ( not ( = ?auto_341466 ?auto_341471 ) ) ( not ( = ?auto_341466 ?auto_341472 ) ) ( not ( = ?auto_341466 ?auto_341473 ) ) ( not ( = ?auto_341466 ?auto_341474 ) ) ( not ( = ?auto_341466 ?auto_341475 ) ) ( not ( = ?auto_341467 ?auto_341468 ) ) ( not ( = ?auto_341467 ?auto_341469 ) ) ( not ( = ?auto_341467 ?auto_341470 ) ) ( not ( = ?auto_341467 ?auto_341471 ) ) ( not ( = ?auto_341467 ?auto_341472 ) ) ( not ( = ?auto_341467 ?auto_341473 ) ) ( not ( = ?auto_341467 ?auto_341474 ) ) ( not ( = ?auto_341467 ?auto_341475 ) ) ( not ( = ?auto_341468 ?auto_341469 ) ) ( not ( = ?auto_341468 ?auto_341470 ) ) ( not ( = ?auto_341468 ?auto_341471 ) ) ( not ( = ?auto_341468 ?auto_341472 ) ) ( not ( = ?auto_341468 ?auto_341473 ) ) ( not ( = ?auto_341468 ?auto_341474 ) ) ( not ( = ?auto_341468 ?auto_341475 ) ) ( not ( = ?auto_341469 ?auto_341470 ) ) ( not ( = ?auto_341469 ?auto_341471 ) ) ( not ( = ?auto_341469 ?auto_341472 ) ) ( not ( = ?auto_341469 ?auto_341473 ) ) ( not ( = ?auto_341469 ?auto_341474 ) ) ( not ( = ?auto_341469 ?auto_341475 ) ) ( not ( = ?auto_341470 ?auto_341471 ) ) ( not ( = ?auto_341470 ?auto_341472 ) ) ( not ( = ?auto_341470 ?auto_341473 ) ) ( not ( = ?auto_341470 ?auto_341474 ) ) ( not ( = ?auto_341470 ?auto_341475 ) ) ( not ( = ?auto_341471 ?auto_341472 ) ) ( not ( = ?auto_341471 ?auto_341473 ) ) ( not ( = ?auto_341471 ?auto_341474 ) ) ( not ( = ?auto_341471 ?auto_341475 ) ) ( not ( = ?auto_341472 ?auto_341473 ) ) ( not ( = ?auto_341472 ?auto_341474 ) ) ( not ( = ?auto_341472 ?auto_341475 ) ) ( not ( = ?auto_341473 ?auto_341474 ) ) ( not ( = ?auto_341473 ?auto_341475 ) ) ( not ( = ?auto_341474 ?auto_341475 ) ) ( ON ?auto_341473 ?auto_341474 ) ( CLEAR ?auto_341471 ) ( ON ?auto_341472 ?auto_341473 ) ( CLEAR ?auto_341472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_341463 ?auto_341464 ?auto_341465 ?auto_341466 ?auto_341467 ?auto_341468 ?auto_341469 ?auto_341470 ?auto_341471 ?auto_341472 )
      ( MAKE-12PILE ?auto_341463 ?auto_341464 ?auto_341465 ?auto_341466 ?auto_341467 ?auto_341468 ?auto_341469 ?auto_341470 ?auto_341471 ?auto_341472 ?auto_341473 ?auto_341474 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341513 - BLOCK
      ?auto_341514 - BLOCK
      ?auto_341515 - BLOCK
      ?auto_341516 - BLOCK
      ?auto_341517 - BLOCK
      ?auto_341518 - BLOCK
      ?auto_341519 - BLOCK
      ?auto_341520 - BLOCK
      ?auto_341521 - BLOCK
      ?auto_341522 - BLOCK
      ?auto_341523 - BLOCK
      ?auto_341524 - BLOCK
    )
    :vars
    (
      ?auto_341525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341524 ?auto_341525 ) ( ON-TABLE ?auto_341513 ) ( ON ?auto_341514 ?auto_341513 ) ( ON ?auto_341515 ?auto_341514 ) ( ON ?auto_341516 ?auto_341515 ) ( ON ?auto_341517 ?auto_341516 ) ( ON ?auto_341518 ?auto_341517 ) ( ON ?auto_341519 ?auto_341518 ) ( ON ?auto_341520 ?auto_341519 ) ( not ( = ?auto_341513 ?auto_341514 ) ) ( not ( = ?auto_341513 ?auto_341515 ) ) ( not ( = ?auto_341513 ?auto_341516 ) ) ( not ( = ?auto_341513 ?auto_341517 ) ) ( not ( = ?auto_341513 ?auto_341518 ) ) ( not ( = ?auto_341513 ?auto_341519 ) ) ( not ( = ?auto_341513 ?auto_341520 ) ) ( not ( = ?auto_341513 ?auto_341521 ) ) ( not ( = ?auto_341513 ?auto_341522 ) ) ( not ( = ?auto_341513 ?auto_341523 ) ) ( not ( = ?auto_341513 ?auto_341524 ) ) ( not ( = ?auto_341513 ?auto_341525 ) ) ( not ( = ?auto_341514 ?auto_341515 ) ) ( not ( = ?auto_341514 ?auto_341516 ) ) ( not ( = ?auto_341514 ?auto_341517 ) ) ( not ( = ?auto_341514 ?auto_341518 ) ) ( not ( = ?auto_341514 ?auto_341519 ) ) ( not ( = ?auto_341514 ?auto_341520 ) ) ( not ( = ?auto_341514 ?auto_341521 ) ) ( not ( = ?auto_341514 ?auto_341522 ) ) ( not ( = ?auto_341514 ?auto_341523 ) ) ( not ( = ?auto_341514 ?auto_341524 ) ) ( not ( = ?auto_341514 ?auto_341525 ) ) ( not ( = ?auto_341515 ?auto_341516 ) ) ( not ( = ?auto_341515 ?auto_341517 ) ) ( not ( = ?auto_341515 ?auto_341518 ) ) ( not ( = ?auto_341515 ?auto_341519 ) ) ( not ( = ?auto_341515 ?auto_341520 ) ) ( not ( = ?auto_341515 ?auto_341521 ) ) ( not ( = ?auto_341515 ?auto_341522 ) ) ( not ( = ?auto_341515 ?auto_341523 ) ) ( not ( = ?auto_341515 ?auto_341524 ) ) ( not ( = ?auto_341515 ?auto_341525 ) ) ( not ( = ?auto_341516 ?auto_341517 ) ) ( not ( = ?auto_341516 ?auto_341518 ) ) ( not ( = ?auto_341516 ?auto_341519 ) ) ( not ( = ?auto_341516 ?auto_341520 ) ) ( not ( = ?auto_341516 ?auto_341521 ) ) ( not ( = ?auto_341516 ?auto_341522 ) ) ( not ( = ?auto_341516 ?auto_341523 ) ) ( not ( = ?auto_341516 ?auto_341524 ) ) ( not ( = ?auto_341516 ?auto_341525 ) ) ( not ( = ?auto_341517 ?auto_341518 ) ) ( not ( = ?auto_341517 ?auto_341519 ) ) ( not ( = ?auto_341517 ?auto_341520 ) ) ( not ( = ?auto_341517 ?auto_341521 ) ) ( not ( = ?auto_341517 ?auto_341522 ) ) ( not ( = ?auto_341517 ?auto_341523 ) ) ( not ( = ?auto_341517 ?auto_341524 ) ) ( not ( = ?auto_341517 ?auto_341525 ) ) ( not ( = ?auto_341518 ?auto_341519 ) ) ( not ( = ?auto_341518 ?auto_341520 ) ) ( not ( = ?auto_341518 ?auto_341521 ) ) ( not ( = ?auto_341518 ?auto_341522 ) ) ( not ( = ?auto_341518 ?auto_341523 ) ) ( not ( = ?auto_341518 ?auto_341524 ) ) ( not ( = ?auto_341518 ?auto_341525 ) ) ( not ( = ?auto_341519 ?auto_341520 ) ) ( not ( = ?auto_341519 ?auto_341521 ) ) ( not ( = ?auto_341519 ?auto_341522 ) ) ( not ( = ?auto_341519 ?auto_341523 ) ) ( not ( = ?auto_341519 ?auto_341524 ) ) ( not ( = ?auto_341519 ?auto_341525 ) ) ( not ( = ?auto_341520 ?auto_341521 ) ) ( not ( = ?auto_341520 ?auto_341522 ) ) ( not ( = ?auto_341520 ?auto_341523 ) ) ( not ( = ?auto_341520 ?auto_341524 ) ) ( not ( = ?auto_341520 ?auto_341525 ) ) ( not ( = ?auto_341521 ?auto_341522 ) ) ( not ( = ?auto_341521 ?auto_341523 ) ) ( not ( = ?auto_341521 ?auto_341524 ) ) ( not ( = ?auto_341521 ?auto_341525 ) ) ( not ( = ?auto_341522 ?auto_341523 ) ) ( not ( = ?auto_341522 ?auto_341524 ) ) ( not ( = ?auto_341522 ?auto_341525 ) ) ( not ( = ?auto_341523 ?auto_341524 ) ) ( not ( = ?auto_341523 ?auto_341525 ) ) ( not ( = ?auto_341524 ?auto_341525 ) ) ( ON ?auto_341523 ?auto_341524 ) ( ON ?auto_341522 ?auto_341523 ) ( CLEAR ?auto_341520 ) ( ON ?auto_341521 ?auto_341522 ) ( CLEAR ?auto_341521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_341513 ?auto_341514 ?auto_341515 ?auto_341516 ?auto_341517 ?auto_341518 ?auto_341519 ?auto_341520 ?auto_341521 )
      ( MAKE-12PILE ?auto_341513 ?auto_341514 ?auto_341515 ?auto_341516 ?auto_341517 ?auto_341518 ?auto_341519 ?auto_341520 ?auto_341521 ?auto_341522 ?auto_341523 ?auto_341524 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341563 - BLOCK
      ?auto_341564 - BLOCK
      ?auto_341565 - BLOCK
      ?auto_341566 - BLOCK
      ?auto_341567 - BLOCK
      ?auto_341568 - BLOCK
      ?auto_341569 - BLOCK
      ?auto_341570 - BLOCK
      ?auto_341571 - BLOCK
      ?auto_341572 - BLOCK
      ?auto_341573 - BLOCK
      ?auto_341574 - BLOCK
    )
    :vars
    (
      ?auto_341575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341574 ?auto_341575 ) ( ON-TABLE ?auto_341563 ) ( ON ?auto_341564 ?auto_341563 ) ( ON ?auto_341565 ?auto_341564 ) ( ON ?auto_341566 ?auto_341565 ) ( ON ?auto_341567 ?auto_341566 ) ( ON ?auto_341568 ?auto_341567 ) ( ON ?auto_341569 ?auto_341568 ) ( not ( = ?auto_341563 ?auto_341564 ) ) ( not ( = ?auto_341563 ?auto_341565 ) ) ( not ( = ?auto_341563 ?auto_341566 ) ) ( not ( = ?auto_341563 ?auto_341567 ) ) ( not ( = ?auto_341563 ?auto_341568 ) ) ( not ( = ?auto_341563 ?auto_341569 ) ) ( not ( = ?auto_341563 ?auto_341570 ) ) ( not ( = ?auto_341563 ?auto_341571 ) ) ( not ( = ?auto_341563 ?auto_341572 ) ) ( not ( = ?auto_341563 ?auto_341573 ) ) ( not ( = ?auto_341563 ?auto_341574 ) ) ( not ( = ?auto_341563 ?auto_341575 ) ) ( not ( = ?auto_341564 ?auto_341565 ) ) ( not ( = ?auto_341564 ?auto_341566 ) ) ( not ( = ?auto_341564 ?auto_341567 ) ) ( not ( = ?auto_341564 ?auto_341568 ) ) ( not ( = ?auto_341564 ?auto_341569 ) ) ( not ( = ?auto_341564 ?auto_341570 ) ) ( not ( = ?auto_341564 ?auto_341571 ) ) ( not ( = ?auto_341564 ?auto_341572 ) ) ( not ( = ?auto_341564 ?auto_341573 ) ) ( not ( = ?auto_341564 ?auto_341574 ) ) ( not ( = ?auto_341564 ?auto_341575 ) ) ( not ( = ?auto_341565 ?auto_341566 ) ) ( not ( = ?auto_341565 ?auto_341567 ) ) ( not ( = ?auto_341565 ?auto_341568 ) ) ( not ( = ?auto_341565 ?auto_341569 ) ) ( not ( = ?auto_341565 ?auto_341570 ) ) ( not ( = ?auto_341565 ?auto_341571 ) ) ( not ( = ?auto_341565 ?auto_341572 ) ) ( not ( = ?auto_341565 ?auto_341573 ) ) ( not ( = ?auto_341565 ?auto_341574 ) ) ( not ( = ?auto_341565 ?auto_341575 ) ) ( not ( = ?auto_341566 ?auto_341567 ) ) ( not ( = ?auto_341566 ?auto_341568 ) ) ( not ( = ?auto_341566 ?auto_341569 ) ) ( not ( = ?auto_341566 ?auto_341570 ) ) ( not ( = ?auto_341566 ?auto_341571 ) ) ( not ( = ?auto_341566 ?auto_341572 ) ) ( not ( = ?auto_341566 ?auto_341573 ) ) ( not ( = ?auto_341566 ?auto_341574 ) ) ( not ( = ?auto_341566 ?auto_341575 ) ) ( not ( = ?auto_341567 ?auto_341568 ) ) ( not ( = ?auto_341567 ?auto_341569 ) ) ( not ( = ?auto_341567 ?auto_341570 ) ) ( not ( = ?auto_341567 ?auto_341571 ) ) ( not ( = ?auto_341567 ?auto_341572 ) ) ( not ( = ?auto_341567 ?auto_341573 ) ) ( not ( = ?auto_341567 ?auto_341574 ) ) ( not ( = ?auto_341567 ?auto_341575 ) ) ( not ( = ?auto_341568 ?auto_341569 ) ) ( not ( = ?auto_341568 ?auto_341570 ) ) ( not ( = ?auto_341568 ?auto_341571 ) ) ( not ( = ?auto_341568 ?auto_341572 ) ) ( not ( = ?auto_341568 ?auto_341573 ) ) ( not ( = ?auto_341568 ?auto_341574 ) ) ( not ( = ?auto_341568 ?auto_341575 ) ) ( not ( = ?auto_341569 ?auto_341570 ) ) ( not ( = ?auto_341569 ?auto_341571 ) ) ( not ( = ?auto_341569 ?auto_341572 ) ) ( not ( = ?auto_341569 ?auto_341573 ) ) ( not ( = ?auto_341569 ?auto_341574 ) ) ( not ( = ?auto_341569 ?auto_341575 ) ) ( not ( = ?auto_341570 ?auto_341571 ) ) ( not ( = ?auto_341570 ?auto_341572 ) ) ( not ( = ?auto_341570 ?auto_341573 ) ) ( not ( = ?auto_341570 ?auto_341574 ) ) ( not ( = ?auto_341570 ?auto_341575 ) ) ( not ( = ?auto_341571 ?auto_341572 ) ) ( not ( = ?auto_341571 ?auto_341573 ) ) ( not ( = ?auto_341571 ?auto_341574 ) ) ( not ( = ?auto_341571 ?auto_341575 ) ) ( not ( = ?auto_341572 ?auto_341573 ) ) ( not ( = ?auto_341572 ?auto_341574 ) ) ( not ( = ?auto_341572 ?auto_341575 ) ) ( not ( = ?auto_341573 ?auto_341574 ) ) ( not ( = ?auto_341573 ?auto_341575 ) ) ( not ( = ?auto_341574 ?auto_341575 ) ) ( ON ?auto_341573 ?auto_341574 ) ( ON ?auto_341572 ?auto_341573 ) ( ON ?auto_341571 ?auto_341572 ) ( CLEAR ?auto_341569 ) ( ON ?auto_341570 ?auto_341571 ) ( CLEAR ?auto_341570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_341563 ?auto_341564 ?auto_341565 ?auto_341566 ?auto_341567 ?auto_341568 ?auto_341569 ?auto_341570 )
      ( MAKE-12PILE ?auto_341563 ?auto_341564 ?auto_341565 ?auto_341566 ?auto_341567 ?auto_341568 ?auto_341569 ?auto_341570 ?auto_341571 ?auto_341572 ?auto_341573 ?auto_341574 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341613 - BLOCK
      ?auto_341614 - BLOCK
      ?auto_341615 - BLOCK
      ?auto_341616 - BLOCK
      ?auto_341617 - BLOCK
      ?auto_341618 - BLOCK
      ?auto_341619 - BLOCK
      ?auto_341620 - BLOCK
      ?auto_341621 - BLOCK
      ?auto_341622 - BLOCK
      ?auto_341623 - BLOCK
      ?auto_341624 - BLOCK
    )
    :vars
    (
      ?auto_341625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341624 ?auto_341625 ) ( ON-TABLE ?auto_341613 ) ( ON ?auto_341614 ?auto_341613 ) ( ON ?auto_341615 ?auto_341614 ) ( ON ?auto_341616 ?auto_341615 ) ( ON ?auto_341617 ?auto_341616 ) ( ON ?auto_341618 ?auto_341617 ) ( not ( = ?auto_341613 ?auto_341614 ) ) ( not ( = ?auto_341613 ?auto_341615 ) ) ( not ( = ?auto_341613 ?auto_341616 ) ) ( not ( = ?auto_341613 ?auto_341617 ) ) ( not ( = ?auto_341613 ?auto_341618 ) ) ( not ( = ?auto_341613 ?auto_341619 ) ) ( not ( = ?auto_341613 ?auto_341620 ) ) ( not ( = ?auto_341613 ?auto_341621 ) ) ( not ( = ?auto_341613 ?auto_341622 ) ) ( not ( = ?auto_341613 ?auto_341623 ) ) ( not ( = ?auto_341613 ?auto_341624 ) ) ( not ( = ?auto_341613 ?auto_341625 ) ) ( not ( = ?auto_341614 ?auto_341615 ) ) ( not ( = ?auto_341614 ?auto_341616 ) ) ( not ( = ?auto_341614 ?auto_341617 ) ) ( not ( = ?auto_341614 ?auto_341618 ) ) ( not ( = ?auto_341614 ?auto_341619 ) ) ( not ( = ?auto_341614 ?auto_341620 ) ) ( not ( = ?auto_341614 ?auto_341621 ) ) ( not ( = ?auto_341614 ?auto_341622 ) ) ( not ( = ?auto_341614 ?auto_341623 ) ) ( not ( = ?auto_341614 ?auto_341624 ) ) ( not ( = ?auto_341614 ?auto_341625 ) ) ( not ( = ?auto_341615 ?auto_341616 ) ) ( not ( = ?auto_341615 ?auto_341617 ) ) ( not ( = ?auto_341615 ?auto_341618 ) ) ( not ( = ?auto_341615 ?auto_341619 ) ) ( not ( = ?auto_341615 ?auto_341620 ) ) ( not ( = ?auto_341615 ?auto_341621 ) ) ( not ( = ?auto_341615 ?auto_341622 ) ) ( not ( = ?auto_341615 ?auto_341623 ) ) ( not ( = ?auto_341615 ?auto_341624 ) ) ( not ( = ?auto_341615 ?auto_341625 ) ) ( not ( = ?auto_341616 ?auto_341617 ) ) ( not ( = ?auto_341616 ?auto_341618 ) ) ( not ( = ?auto_341616 ?auto_341619 ) ) ( not ( = ?auto_341616 ?auto_341620 ) ) ( not ( = ?auto_341616 ?auto_341621 ) ) ( not ( = ?auto_341616 ?auto_341622 ) ) ( not ( = ?auto_341616 ?auto_341623 ) ) ( not ( = ?auto_341616 ?auto_341624 ) ) ( not ( = ?auto_341616 ?auto_341625 ) ) ( not ( = ?auto_341617 ?auto_341618 ) ) ( not ( = ?auto_341617 ?auto_341619 ) ) ( not ( = ?auto_341617 ?auto_341620 ) ) ( not ( = ?auto_341617 ?auto_341621 ) ) ( not ( = ?auto_341617 ?auto_341622 ) ) ( not ( = ?auto_341617 ?auto_341623 ) ) ( not ( = ?auto_341617 ?auto_341624 ) ) ( not ( = ?auto_341617 ?auto_341625 ) ) ( not ( = ?auto_341618 ?auto_341619 ) ) ( not ( = ?auto_341618 ?auto_341620 ) ) ( not ( = ?auto_341618 ?auto_341621 ) ) ( not ( = ?auto_341618 ?auto_341622 ) ) ( not ( = ?auto_341618 ?auto_341623 ) ) ( not ( = ?auto_341618 ?auto_341624 ) ) ( not ( = ?auto_341618 ?auto_341625 ) ) ( not ( = ?auto_341619 ?auto_341620 ) ) ( not ( = ?auto_341619 ?auto_341621 ) ) ( not ( = ?auto_341619 ?auto_341622 ) ) ( not ( = ?auto_341619 ?auto_341623 ) ) ( not ( = ?auto_341619 ?auto_341624 ) ) ( not ( = ?auto_341619 ?auto_341625 ) ) ( not ( = ?auto_341620 ?auto_341621 ) ) ( not ( = ?auto_341620 ?auto_341622 ) ) ( not ( = ?auto_341620 ?auto_341623 ) ) ( not ( = ?auto_341620 ?auto_341624 ) ) ( not ( = ?auto_341620 ?auto_341625 ) ) ( not ( = ?auto_341621 ?auto_341622 ) ) ( not ( = ?auto_341621 ?auto_341623 ) ) ( not ( = ?auto_341621 ?auto_341624 ) ) ( not ( = ?auto_341621 ?auto_341625 ) ) ( not ( = ?auto_341622 ?auto_341623 ) ) ( not ( = ?auto_341622 ?auto_341624 ) ) ( not ( = ?auto_341622 ?auto_341625 ) ) ( not ( = ?auto_341623 ?auto_341624 ) ) ( not ( = ?auto_341623 ?auto_341625 ) ) ( not ( = ?auto_341624 ?auto_341625 ) ) ( ON ?auto_341623 ?auto_341624 ) ( ON ?auto_341622 ?auto_341623 ) ( ON ?auto_341621 ?auto_341622 ) ( ON ?auto_341620 ?auto_341621 ) ( CLEAR ?auto_341618 ) ( ON ?auto_341619 ?auto_341620 ) ( CLEAR ?auto_341619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_341613 ?auto_341614 ?auto_341615 ?auto_341616 ?auto_341617 ?auto_341618 ?auto_341619 )
      ( MAKE-12PILE ?auto_341613 ?auto_341614 ?auto_341615 ?auto_341616 ?auto_341617 ?auto_341618 ?auto_341619 ?auto_341620 ?auto_341621 ?auto_341622 ?auto_341623 ?auto_341624 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341663 - BLOCK
      ?auto_341664 - BLOCK
      ?auto_341665 - BLOCK
      ?auto_341666 - BLOCK
      ?auto_341667 - BLOCK
      ?auto_341668 - BLOCK
      ?auto_341669 - BLOCK
      ?auto_341670 - BLOCK
      ?auto_341671 - BLOCK
      ?auto_341672 - BLOCK
      ?auto_341673 - BLOCK
      ?auto_341674 - BLOCK
    )
    :vars
    (
      ?auto_341675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341674 ?auto_341675 ) ( ON-TABLE ?auto_341663 ) ( ON ?auto_341664 ?auto_341663 ) ( ON ?auto_341665 ?auto_341664 ) ( ON ?auto_341666 ?auto_341665 ) ( ON ?auto_341667 ?auto_341666 ) ( not ( = ?auto_341663 ?auto_341664 ) ) ( not ( = ?auto_341663 ?auto_341665 ) ) ( not ( = ?auto_341663 ?auto_341666 ) ) ( not ( = ?auto_341663 ?auto_341667 ) ) ( not ( = ?auto_341663 ?auto_341668 ) ) ( not ( = ?auto_341663 ?auto_341669 ) ) ( not ( = ?auto_341663 ?auto_341670 ) ) ( not ( = ?auto_341663 ?auto_341671 ) ) ( not ( = ?auto_341663 ?auto_341672 ) ) ( not ( = ?auto_341663 ?auto_341673 ) ) ( not ( = ?auto_341663 ?auto_341674 ) ) ( not ( = ?auto_341663 ?auto_341675 ) ) ( not ( = ?auto_341664 ?auto_341665 ) ) ( not ( = ?auto_341664 ?auto_341666 ) ) ( not ( = ?auto_341664 ?auto_341667 ) ) ( not ( = ?auto_341664 ?auto_341668 ) ) ( not ( = ?auto_341664 ?auto_341669 ) ) ( not ( = ?auto_341664 ?auto_341670 ) ) ( not ( = ?auto_341664 ?auto_341671 ) ) ( not ( = ?auto_341664 ?auto_341672 ) ) ( not ( = ?auto_341664 ?auto_341673 ) ) ( not ( = ?auto_341664 ?auto_341674 ) ) ( not ( = ?auto_341664 ?auto_341675 ) ) ( not ( = ?auto_341665 ?auto_341666 ) ) ( not ( = ?auto_341665 ?auto_341667 ) ) ( not ( = ?auto_341665 ?auto_341668 ) ) ( not ( = ?auto_341665 ?auto_341669 ) ) ( not ( = ?auto_341665 ?auto_341670 ) ) ( not ( = ?auto_341665 ?auto_341671 ) ) ( not ( = ?auto_341665 ?auto_341672 ) ) ( not ( = ?auto_341665 ?auto_341673 ) ) ( not ( = ?auto_341665 ?auto_341674 ) ) ( not ( = ?auto_341665 ?auto_341675 ) ) ( not ( = ?auto_341666 ?auto_341667 ) ) ( not ( = ?auto_341666 ?auto_341668 ) ) ( not ( = ?auto_341666 ?auto_341669 ) ) ( not ( = ?auto_341666 ?auto_341670 ) ) ( not ( = ?auto_341666 ?auto_341671 ) ) ( not ( = ?auto_341666 ?auto_341672 ) ) ( not ( = ?auto_341666 ?auto_341673 ) ) ( not ( = ?auto_341666 ?auto_341674 ) ) ( not ( = ?auto_341666 ?auto_341675 ) ) ( not ( = ?auto_341667 ?auto_341668 ) ) ( not ( = ?auto_341667 ?auto_341669 ) ) ( not ( = ?auto_341667 ?auto_341670 ) ) ( not ( = ?auto_341667 ?auto_341671 ) ) ( not ( = ?auto_341667 ?auto_341672 ) ) ( not ( = ?auto_341667 ?auto_341673 ) ) ( not ( = ?auto_341667 ?auto_341674 ) ) ( not ( = ?auto_341667 ?auto_341675 ) ) ( not ( = ?auto_341668 ?auto_341669 ) ) ( not ( = ?auto_341668 ?auto_341670 ) ) ( not ( = ?auto_341668 ?auto_341671 ) ) ( not ( = ?auto_341668 ?auto_341672 ) ) ( not ( = ?auto_341668 ?auto_341673 ) ) ( not ( = ?auto_341668 ?auto_341674 ) ) ( not ( = ?auto_341668 ?auto_341675 ) ) ( not ( = ?auto_341669 ?auto_341670 ) ) ( not ( = ?auto_341669 ?auto_341671 ) ) ( not ( = ?auto_341669 ?auto_341672 ) ) ( not ( = ?auto_341669 ?auto_341673 ) ) ( not ( = ?auto_341669 ?auto_341674 ) ) ( not ( = ?auto_341669 ?auto_341675 ) ) ( not ( = ?auto_341670 ?auto_341671 ) ) ( not ( = ?auto_341670 ?auto_341672 ) ) ( not ( = ?auto_341670 ?auto_341673 ) ) ( not ( = ?auto_341670 ?auto_341674 ) ) ( not ( = ?auto_341670 ?auto_341675 ) ) ( not ( = ?auto_341671 ?auto_341672 ) ) ( not ( = ?auto_341671 ?auto_341673 ) ) ( not ( = ?auto_341671 ?auto_341674 ) ) ( not ( = ?auto_341671 ?auto_341675 ) ) ( not ( = ?auto_341672 ?auto_341673 ) ) ( not ( = ?auto_341672 ?auto_341674 ) ) ( not ( = ?auto_341672 ?auto_341675 ) ) ( not ( = ?auto_341673 ?auto_341674 ) ) ( not ( = ?auto_341673 ?auto_341675 ) ) ( not ( = ?auto_341674 ?auto_341675 ) ) ( ON ?auto_341673 ?auto_341674 ) ( ON ?auto_341672 ?auto_341673 ) ( ON ?auto_341671 ?auto_341672 ) ( ON ?auto_341670 ?auto_341671 ) ( ON ?auto_341669 ?auto_341670 ) ( CLEAR ?auto_341667 ) ( ON ?auto_341668 ?auto_341669 ) ( CLEAR ?auto_341668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_341663 ?auto_341664 ?auto_341665 ?auto_341666 ?auto_341667 ?auto_341668 )
      ( MAKE-12PILE ?auto_341663 ?auto_341664 ?auto_341665 ?auto_341666 ?auto_341667 ?auto_341668 ?auto_341669 ?auto_341670 ?auto_341671 ?auto_341672 ?auto_341673 ?auto_341674 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341713 - BLOCK
      ?auto_341714 - BLOCK
      ?auto_341715 - BLOCK
      ?auto_341716 - BLOCK
      ?auto_341717 - BLOCK
      ?auto_341718 - BLOCK
      ?auto_341719 - BLOCK
      ?auto_341720 - BLOCK
      ?auto_341721 - BLOCK
      ?auto_341722 - BLOCK
      ?auto_341723 - BLOCK
      ?auto_341724 - BLOCK
    )
    :vars
    (
      ?auto_341725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341724 ?auto_341725 ) ( ON-TABLE ?auto_341713 ) ( ON ?auto_341714 ?auto_341713 ) ( ON ?auto_341715 ?auto_341714 ) ( ON ?auto_341716 ?auto_341715 ) ( not ( = ?auto_341713 ?auto_341714 ) ) ( not ( = ?auto_341713 ?auto_341715 ) ) ( not ( = ?auto_341713 ?auto_341716 ) ) ( not ( = ?auto_341713 ?auto_341717 ) ) ( not ( = ?auto_341713 ?auto_341718 ) ) ( not ( = ?auto_341713 ?auto_341719 ) ) ( not ( = ?auto_341713 ?auto_341720 ) ) ( not ( = ?auto_341713 ?auto_341721 ) ) ( not ( = ?auto_341713 ?auto_341722 ) ) ( not ( = ?auto_341713 ?auto_341723 ) ) ( not ( = ?auto_341713 ?auto_341724 ) ) ( not ( = ?auto_341713 ?auto_341725 ) ) ( not ( = ?auto_341714 ?auto_341715 ) ) ( not ( = ?auto_341714 ?auto_341716 ) ) ( not ( = ?auto_341714 ?auto_341717 ) ) ( not ( = ?auto_341714 ?auto_341718 ) ) ( not ( = ?auto_341714 ?auto_341719 ) ) ( not ( = ?auto_341714 ?auto_341720 ) ) ( not ( = ?auto_341714 ?auto_341721 ) ) ( not ( = ?auto_341714 ?auto_341722 ) ) ( not ( = ?auto_341714 ?auto_341723 ) ) ( not ( = ?auto_341714 ?auto_341724 ) ) ( not ( = ?auto_341714 ?auto_341725 ) ) ( not ( = ?auto_341715 ?auto_341716 ) ) ( not ( = ?auto_341715 ?auto_341717 ) ) ( not ( = ?auto_341715 ?auto_341718 ) ) ( not ( = ?auto_341715 ?auto_341719 ) ) ( not ( = ?auto_341715 ?auto_341720 ) ) ( not ( = ?auto_341715 ?auto_341721 ) ) ( not ( = ?auto_341715 ?auto_341722 ) ) ( not ( = ?auto_341715 ?auto_341723 ) ) ( not ( = ?auto_341715 ?auto_341724 ) ) ( not ( = ?auto_341715 ?auto_341725 ) ) ( not ( = ?auto_341716 ?auto_341717 ) ) ( not ( = ?auto_341716 ?auto_341718 ) ) ( not ( = ?auto_341716 ?auto_341719 ) ) ( not ( = ?auto_341716 ?auto_341720 ) ) ( not ( = ?auto_341716 ?auto_341721 ) ) ( not ( = ?auto_341716 ?auto_341722 ) ) ( not ( = ?auto_341716 ?auto_341723 ) ) ( not ( = ?auto_341716 ?auto_341724 ) ) ( not ( = ?auto_341716 ?auto_341725 ) ) ( not ( = ?auto_341717 ?auto_341718 ) ) ( not ( = ?auto_341717 ?auto_341719 ) ) ( not ( = ?auto_341717 ?auto_341720 ) ) ( not ( = ?auto_341717 ?auto_341721 ) ) ( not ( = ?auto_341717 ?auto_341722 ) ) ( not ( = ?auto_341717 ?auto_341723 ) ) ( not ( = ?auto_341717 ?auto_341724 ) ) ( not ( = ?auto_341717 ?auto_341725 ) ) ( not ( = ?auto_341718 ?auto_341719 ) ) ( not ( = ?auto_341718 ?auto_341720 ) ) ( not ( = ?auto_341718 ?auto_341721 ) ) ( not ( = ?auto_341718 ?auto_341722 ) ) ( not ( = ?auto_341718 ?auto_341723 ) ) ( not ( = ?auto_341718 ?auto_341724 ) ) ( not ( = ?auto_341718 ?auto_341725 ) ) ( not ( = ?auto_341719 ?auto_341720 ) ) ( not ( = ?auto_341719 ?auto_341721 ) ) ( not ( = ?auto_341719 ?auto_341722 ) ) ( not ( = ?auto_341719 ?auto_341723 ) ) ( not ( = ?auto_341719 ?auto_341724 ) ) ( not ( = ?auto_341719 ?auto_341725 ) ) ( not ( = ?auto_341720 ?auto_341721 ) ) ( not ( = ?auto_341720 ?auto_341722 ) ) ( not ( = ?auto_341720 ?auto_341723 ) ) ( not ( = ?auto_341720 ?auto_341724 ) ) ( not ( = ?auto_341720 ?auto_341725 ) ) ( not ( = ?auto_341721 ?auto_341722 ) ) ( not ( = ?auto_341721 ?auto_341723 ) ) ( not ( = ?auto_341721 ?auto_341724 ) ) ( not ( = ?auto_341721 ?auto_341725 ) ) ( not ( = ?auto_341722 ?auto_341723 ) ) ( not ( = ?auto_341722 ?auto_341724 ) ) ( not ( = ?auto_341722 ?auto_341725 ) ) ( not ( = ?auto_341723 ?auto_341724 ) ) ( not ( = ?auto_341723 ?auto_341725 ) ) ( not ( = ?auto_341724 ?auto_341725 ) ) ( ON ?auto_341723 ?auto_341724 ) ( ON ?auto_341722 ?auto_341723 ) ( ON ?auto_341721 ?auto_341722 ) ( ON ?auto_341720 ?auto_341721 ) ( ON ?auto_341719 ?auto_341720 ) ( ON ?auto_341718 ?auto_341719 ) ( CLEAR ?auto_341716 ) ( ON ?auto_341717 ?auto_341718 ) ( CLEAR ?auto_341717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_341713 ?auto_341714 ?auto_341715 ?auto_341716 ?auto_341717 )
      ( MAKE-12PILE ?auto_341713 ?auto_341714 ?auto_341715 ?auto_341716 ?auto_341717 ?auto_341718 ?auto_341719 ?auto_341720 ?auto_341721 ?auto_341722 ?auto_341723 ?auto_341724 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341763 - BLOCK
      ?auto_341764 - BLOCK
      ?auto_341765 - BLOCK
      ?auto_341766 - BLOCK
      ?auto_341767 - BLOCK
      ?auto_341768 - BLOCK
      ?auto_341769 - BLOCK
      ?auto_341770 - BLOCK
      ?auto_341771 - BLOCK
      ?auto_341772 - BLOCK
      ?auto_341773 - BLOCK
      ?auto_341774 - BLOCK
    )
    :vars
    (
      ?auto_341775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341774 ?auto_341775 ) ( ON-TABLE ?auto_341763 ) ( ON ?auto_341764 ?auto_341763 ) ( ON ?auto_341765 ?auto_341764 ) ( not ( = ?auto_341763 ?auto_341764 ) ) ( not ( = ?auto_341763 ?auto_341765 ) ) ( not ( = ?auto_341763 ?auto_341766 ) ) ( not ( = ?auto_341763 ?auto_341767 ) ) ( not ( = ?auto_341763 ?auto_341768 ) ) ( not ( = ?auto_341763 ?auto_341769 ) ) ( not ( = ?auto_341763 ?auto_341770 ) ) ( not ( = ?auto_341763 ?auto_341771 ) ) ( not ( = ?auto_341763 ?auto_341772 ) ) ( not ( = ?auto_341763 ?auto_341773 ) ) ( not ( = ?auto_341763 ?auto_341774 ) ) ( not ( = ?auto_341763 ?auto_341775 ) ) ( not ( = ?auto_341764 ?auto_341765 ) ) ( not ( = ?auto_341764 ?auto_341766 ) ) ( not ( = ?auto_341764 ?auto_341767 ) ) ( not ( = ?auto_341764 ?auto_341768 ) ) ( not ( = ?auto_341764 ?auto_341769 ) ) ( not ( = ?auto_341764 ?auto_341770 ) ) ( not ( = ?auto_341764 ?auto_341771 ) ) ( not ( = ?auto_341764 ?auto_341772 ) ) ( not ( = ?auto_341764 ?auto_341773 ) ) ( not ( = ?auto_341764 ?auto_341774 ) ) ( not ( = ?auto_341764 ?auto_341775 ) ) ( not ( = ?auto_341765 ?auto_341766 ) ) ( not ( = ?auto_341765 ?auto_341767 ) ) ( not ( = ?auto_341765 ?auto_341768 ) ) ( not ( = ?auto_341765 ?auto_341769 ) ) ( not ( = ?auto_341765 ?auto_341770 ) ) ( not ( = ?auto_341765 ?auto_341771 ) ) ( not ( = ?auto_341765 ?auto_341772 ) ) ( not ( = ?auto_341765 ?auto_341773 ) ) ( not ( = ?auto_341765 ?auto_341774 ) ) ( not ( = ?auto_341765 ?auto_341775 ) ) ( not ( = ?auto_341766 ?auto_341767 ) ) ( not ( = ?auto_341766 ?auto_341768 ) ) ( not ( = ?auto_341766 ?auto_341769 ) ) ( not ( = ?auto_341766 ?auto_341770 ) ) ( not ( = ?auto_341766 ?auto_341771 ) ) ( not ( = ?auto_341766 ?auto_341772 ) ) ( not ( = ?auto_341766 ?auto_341773 ) ) ( not ( = ?auto_341766 ?auto_341774 ) ) ( not ( = ?auto_341766 ?auto_341775 ) ) ( not ( = ?auto_341767 ?auto_341768 ) ) ( not ( = ?auto_341767 ?auto_341769 ) ) ( not ( = ?auto_341767 ?auto_341770 ) ) ( not ( = ?auto_341767 ?auto_341771 ) ) ( not ( = ?auto_341767 ?auto_341772 ) ) ( not ( = ?auto_341767 ?auto_341773 ) ) ( not ( = ?auto_341767 ?auto_341774 ) ) ( not ( = ?auto_341767 ?auto_341775 ) ) ( not ( = ?auto_341768 ?auto_341769 ) ) ( not ( = ?auto_341768 ?auto_341770 ) ) ( not ( = ?auto_341768 ?auto_341771 ) ) ( not ( = ?auto_341768 ?auto_341772 ) ) ( not ( = ?auto_341768 ?auto_341773 ) ) ( not ( = ?auto_341768 ?auto_341774 ) ) ( not ( = ?auto_341768 ?auto_341775 ) ) ( not ( = ?auto_341769 ?auto_341770 ) ) ( not ( = ?auto_341769 ?auto_341771 ) ) ( not ( = ?auto_341769 ?auto_341772 ) ) ( not ( = ?auto_341769 ?auto_341773 ) ) ( not ( = ?auto_341769 ?auto_341774 ) ) ( not ( = ?auto_341769 ?auto_341775 ) ) ( not ( = ?auto_341770 ?auto_341771 ) ) ( not ( = ?auto_341770 ?auto_341772 ) ) ( not ( = ?auto_341770 ?auto_341773 ) ) ( not ( = ?auto_341770 ?auto_341774 ) ) ( not ( = ?auto_341770 ?auto_341775 ) ) ( not ( = ?auto_341771 ?auto_341772 ) ) ( not ( = ?auto_341771 ?auto_341773 ) ) ( not ( = ?auto_341771 ?auto_341774 ) ) ( not ( = ?auto_341771 ?auto_341775 ) ) ( not ( = ?auto_341772 ?auto_341773 ) ) ( not ( = ?auto_341772 ?auto_341774 ) ) ( not ( = ?auto_341772 ?auto_341775 ) ) ( not ( = ?auto_341773 ?auto_341774 ) ) ( not ( = ?auto_341773 ?auto_341775 ) ) ( not ( = ?auto_341774 ?auto_341775 ) ) ( ON ?auto_341773 ?auto_341774 ) ( ON ?auto_341772 ?auto_341773 ) ( ON ?auto_341771 ?auto_341772 ) ( ON ?auto_341770 ?auto_341771 ) ( ON ?auto_341769 ?auto_341770 ) ( ON ?auto_341768 ?auto_341769 ) ( ON ?auto_341767 ?auto_341768 ) ( CLEAR ?auto_341765 ) ( ON ?auto_341766 ?auto_341767 ) ( CLEAR ?auto_341766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_341763 ?auto_341764 ?auto_341765 ?auto_341766 )
      ( MAKE-12PILE ?auto_341763 ?auto_341764 ?auto_341765 ?auto_341766 ?auto_341767 ?auto_341768 ?auto_341769 ?auto_341770 ?auto_341771 ?auto_341772 ?auto_341773 ?auto_341774 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341813 - BLOCK
      ?auto_341814 - BLOCK
      ?auto_341815 - BLOCK
      ?auto_341816 - BLOCK
      ?auto_341817 - BLOCK
      ?auto_341818 - BLOCK
      ?auto_341819 - BLOCK
      ?auto_341820 - BLOCK
      ?auto_341821 - BLOCK
      ?auto_341822 - BLOCK
      ?auto_341823 - BLOCK
      ?auto_341824 - BLOCK
    )
    :vars
    (
      ?auto_341825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341824 ?auto_341825 ) ( ON-TABLE ?auto_341813 ) ( ON ?auto_341814 ?auto_341813 ) ( not ( = ?auto_341813 ?auto_341814 ) ) ( not ( = ?auto_341813 ?auto_341815 ) ) ( not ( = ?auto_341813 ?auto_341816 ) ) ( not ( = ?auto_341813 ?auto_341817 ) ) ( not ( = ?auto_341813 ?auto_341818 ) ) ( not ( = ?auto_341813 ?auto_341819 ) ) ( not ( = ?auto_341813 ?auto_341820 ) ) ( not ( = ?auto_341813 ?auto_341821 ) ) ( not ( = ?auto_341813 ?auto_341822 ) ) ( not ( = ?auto_341813 ?auto_341823 ) ) ( not ( = ?auto_341813 ?auto_341824 ) ) ( not ( = ?auto_341813 ?auto_341825 ) ) ( not ( = ?auto_341814 ?auto_341815 ) ) ( not ( = ?auto_341814 ?auto_341816 ) ) ( not ( = ?auto_341814 ?auto_341817 ) ) ( not ( = ?auto_341814 ?auto_341818 ) ) ( not ( = ?auto_341814 ?auto_341819 ) ) ( not ( = ?auto_341814 ?auto_341820 ) ) ( not ( = ?auto_341814 ?auto_341821 ) ) ( not ( = ?auto_341814 ?auto_341822 ) ) ( not ( = ?auto_341814 ?auto_341823 ) ) ( not ( = ?auto_341814 ?auto_341824 ) ) ( not ( = ?auto_341814 ?auto_341825 ) ) ( not ( = ?auto_341815 ?auto_341816 ) ) ( not ( = ?auto_341815 ?auto_341817 ) ) ( not ( = ?auto_341815 ?auto_341818 ) ) ( not ( = ?auto_341815 ?auto_341819 ) ) ( not ( = ?auto_341815 ?auto_341820 ) ) ( not ( = ?auto_341815 ?auto_341821 ) ) ( not ( = ?auto_341815 ?auto_341822 ) ) ( not ( = ?auto_341815 ?auto_341823 ) ) ( not ( = ?auto_341815 ?auto_341824 ) ) ( not ( = ?auto_341815 ?auto_341825 ) ) ( not ( = ?auto_341816 ?auto_341817 ) ) ( not ( = ?auto_341816 ?auto_341818 ) ) ( not ( = ?auto_341816 ?auto_341819 ) ) ( not ( = ?auto_341816 ?auto_341820 ) ) ( not ( = ?auto_341816 ?auto_341821 ) ) ( not ( = ?auto_341816 ?auto_341822 ) ) ( not ( = ?auto_341816 ?auto_341823 ) ) ( not ( = ?auto_341816 ?auto_341824 ) ) ( not ( = ?auto_341816 ?auto_341825 ) ) ( not ( = ?auto_341817 ?auto_341818 ) ) ( not ( = ?auto_341817 ?auto_341819 ) ) ( not ( = ?auto_341817 ?auto_341820 ) ) ( not ( = ?auto_341817 ?auto_341821 ) ) ( not ( = ?auto_341817 ?auto_341822 ) ) ( not ( = ?auto_341817 ?auto_341823 ) ) ( not ( = ?auto_341817 ?auto_341824 ) ) ( not ( = ?auto_341817 ?auto_341825 ) ) ( not ( = ?auto_341818 ?auto_341819 ) ) ( not ( = ?auto_341818 ?auto_341820 ) ) ( not ( = ?auto_341818 ?auto_341821 ) ) ( not ( = ?auto_341818 ?auto_341822 ) ) ( not ( = ?auto_341818 ?auto_341823 ) ) ( not ( = ?auto_341818 ?auto_341824 ) ) ( not ( = ?auto_341818 ?auto_341825 ) ) ( not ( = ?auto_341819 ?auto_341820 ) ) ( not ( = ?auto_341819 ?auto_341821 ) ) ( not ( = ?auto_341819 ?auto_341822 ) ) ( not ( = ?auto_341819 ?auto_341823 ) ) ( not ( = ?auto_341819 ?auto_341824 ) ) ( not ( = ?auto_341819 ?auto_341825 ) ) ( not ( = ?auto_341820 ?auto_341821 ) ) ( not ( = ?auto_341820 ?auto_341822 ) ) ( not ( = ?auto_341820 ?auto_341823 ) ) ( not ( = ?auto_341820 ?auto_341824 ) ) ( not ( = ?auto_341820 ?auto_341825 ) ) ( not ( = ?auto_341821 ?auto_341822 ) ) ( not ( = ?auto_341821 ?auto_341823 ) ) ( not ( = ?auto_341821 ?auto_341824 ) ) ( not ( = ?auto_341821 ?auto_341825 ) ) ( not ( = ?auto_341822 ?auto_341823 ) ) ( not ( = ?auto_341822 ?auto_341824 ) ) ( not ( = ?auto_341822 ?auto_341825 ) ) ( not ( = ?auto_341823 ?auto_341824 ) ) ( not ( = ?auto_341823 ?auto_341825 ) ) ( not ( = ?auto_341824 ?auto_341825 ) ) ( ON ?auto_341823 ?auto_341824 ) ( ON ?auto_341822 ?auto_341823 ) ( ON ?auto_341821 ?auto_341822 ) ( ON ?auto_341820 ?auto_341821 ) ( ON ?auto_341819 ?auto_341820 ) ( ON ?auto_341818 ?auto_341819 ) ( ON ?auto_341817 ?auto_341818 ) ( ON ?auto_341816 ?auto_341817 ) ( CLEAR ?auto_341814 ) ( ON ?auto_341815 ?auto_341816 ) ( CLEAR ?auto_341815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_341813 ?auto_341814 ?auto_341815 )
      ( MAKE-12PILE ?auto_341813 ?auto_341814 ?auto_341815 ?auto_341816 ?auto_341817 ?auto_341818 ?auto_341819 ?auto_341820 ?auto_341821 ?auto_341822 ?auto_341823 ?auto_341824 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341863 - BLOCK
      ?auto_341864 - BLOCK
      ?auto_341865 - BLOCK
      ?auto_341866 - BLOCK
      ?auto_341867 - BLOCK
      ?auto_341868 - BLOCK
      ?auto_341869 - BLOCK
      ?auto_341870 - BLOCK
      ?auto_341871 - BLOCK
      ?auto_341872 - BLOCK
      ?auto_341873 - BLOCK
      ?auto_341874 - BLOCK
    )
    :vars
    (
      ?auto_341875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341874 ?auto_341875 ) ( ON-TABLE ?auto_341863 ) ( not ( = ?auto_341863 ?auto_341864 ) ) ( not ( = ?auto_341863 ?auto_341865 ) ) ( not ( = ?auto_341863 ?auto_341866 ) ) ( not ( = ?auto_341863 ?auto_341867 ) ) ( not ( = ?auto_341863 ?auto_341868 ) ) ( not ( = ?auto_341863 ?auto_341869 ) ) ( not ( = ?auto_341863 ?auto_341870 ) ) ( not ( = ?auto_341863 ?auto_341871 ) ) ( not ( = ?auto_341863 ?auto_341872 ) ) ( not ( = ?auto_341863 ?auto_341873 ) ) ( not ( = ?auto_341863 ?auto_341874 ) ) ( not ( = ?auto_341863 ?auto_341875 ) ) ( not ( = ?auto_341864 ?auto_341865 ) ) ( not ( = ?auto_341864 ?auto_341866 ) ) ( not ( = ?auto_341864 ?auto_341867 ) ) ( not ( = ?auto_341864 ?auto_341868 ) ) ( not ( = ?auto_341864 ?auto_341869 ) ) ( not ( = ?auto_341864 ?auto_341870 ) ) ( not ( = ?auto_341864 ?auto_341871 ) ) ( not ( = ?auto_341864 ?auto_341872 ) ) ( not ( = ?auto_341864 ?auto_341873 ) ) ( not ( = ?auto_341864 ?auto_341874 ) ) ( not ( = ?auto_341864 ?auto_341875 ) ) ( not ( = ?auto_341865 ?auto_341866 ) ) ( not ( = ?auto_341865 ?auto_341867 ) ) ( not ( = ?auto_341865 ?auto_341868 ) ) ( not ( = ?auto_341865 ?auto_341869 ) ) ( not ( = ?auto_341865 ?auto_341870 ) ) ( not ( = ?auto_341865 ?auto_341871 ) ) ( not ( = ?auto_341865 ?auto_341872 ) ) ( not ( = ?auto_341865 ?auto_341873 ) ) ( not ( = ?auto_341865 ?auto_341874 ) ) ( not ( = ?auto_341865 ?auto_341875 ) ) ( not ( = ?auto_341866 ?auto_341867 ) ) ( not ( = ?auto_341866 ?auto_341868 ) ) ( not ( = ?auto_341866 ?auto_341869 ) ) ( not ( = ?auto_341866 ?auto_341870 ) ) ( not ( = ?auto_341866 ?auto_341871 ) ) ( not ( = ?auto_341866 ?auto_341872 ) ) ( not ( = ?auto_341866 ?auto_341873 ) ) ( not ( = ?auto_341866 ?auto_341874 ) ) ( not ( = ?auto_341866 ?auto_341875 ) ) ( not ( = ?auto_341867 ?auto_341868 ) ) ( not ( = ?auto_341867 ?auto_341869 ) ) ( not ( = ?auto_341867 ?auto_341870 ) ) ( not ( = ?auto_341867 ?auto_341871 ) ) ( not ( = ?auto_341867 ?auto_341872 ) ) ( not ( = ?auto_341867 ?auto_341873 ) ) ( not ( = ?auto_341867 ?auto_341874 ) ) ( not ( = ?auto_341867 ?auto_341875 ) ) ( not ( = ?auto_341868 ?auto_341869 ) ) ( not ( = ?auto_341868 ?auto_341870 ) ) ( not ( = ?auto_341868 ?auto_341871 ) ) ( not ( = ?auto_341868 ?auto_341872 ) ) ( not ( = ?auto_341868 ?auto_341873 ) ) ( not ( = ?auto_341868 ?auto_341874 ) ) ( not ( = ?auto_341868 ?auto_341875 ) ) ( not ( = ?auto_341869 ?auto_341870 ) ) ( not ( = ?auto_341869 ?auto_341871 ) ) ( not ( = ?auto_341869 ?auto_341872 ) ) ( not ( = ?auto_341869 ?auto_341873 ) ) ( not ( = ?auto_341869 ?auto_341874 ) ) ( not ( = ?auto_341869 ?auto_341875 ) ) ( not ( = ?auto_341870 ?auto_341871 ) ) ( not ( = ?auto_341870 ?auto_341872 ) ) ( not ( = ?auto_341870 ?auto_341873 ) ) ( not ( = ?auto_341870 ?auto_341874 ) ) ( not ( = ?auto_341870 ?auto_341875 ) ) ( not ( = ?auto_341871 ?auto_341872 ) ) ( not ( = ?auto_341871 ?auto_341873 ) ) ( not ( = ?auto_341871 ?auto_341874 ) ) ( not ( = ?auto_341871 ?auto_341875 ) ) ( not ( = ?auto_341872 ?auto_341873 ) ) ( not ( = ?auto_341872 ?auto_341874 ) ) ( not ( = ?auto_341872 ?auto_341875 ) ) ( not ( = ?auto_341873 ?auto_341874 ) ) ( not ( = ?auto_341873 ?auto_341875 ) ) ( not ( = ?auto_341874 ?auto_341875 ) ) ( ON ?auto_341873 ?auto_341874 ) ( ON ?auto_341872 ?auto_341873 ) ( ON ?auto_341871 ?auto_341872 ) ( ON ?auto_341870 ?auto_341871 ) ( ON ?auto_341869 ?auto_341870 ) ( ON ?auto_341868 ?auto_341869 ) ( ON ?auto_341867 ?auto_341868 ) ( ON ?auto_341866 ?auto_341867 ) ( ON ?auto_341865 ?auto_341866 ) ( CLEAR ?auto_341863 ) ( ON ?auto_341864 ?auto_341865 ) ( CLEAR ?auto_341864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_341863 ?auto_341864 )
      ( MAKE-12PILE ?auto_341863 ?auto_341864 ?auto_341865 ?auto_341866 ?auto_341867 ?auto_341868 ?auto_341869 ?auto_341870 ?auto_341871 ?auto_341872 ?auto_341873 ?auto_341874 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_341913 - BLOCK
      ?auto_341914 - BLOCK
      ?auto_341915 - BLOCK
      ?auto_341916 - BLOCK
      ?auto_341917 - BLOCK
      ?auto_341918 - BLOCK
      ?auto_341919 - BLOCK
      ?auto_341920 - BLOCK
      ?auto_341921 - BLOCK
      ?auto_341922 - BLOCK
      ?auto_341923 - BLOCK
      ?auto_341924 - BLOCK
    )
    :vars
    (
      ?auto_341925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341924 ?auto_341925 ) ( not ( = ?auto_341913 ?auto_341914 ) ) ( not ( = ?auto_341913 ?auto_341915 ) ) ( not ( = ?auto_341913 ?auto_341916 ) ) ( not ( = ?auto_341913 ?auto_341917 ) ) ( not ( = ?auto_341913 ?auto_341918 ) ) ( not ( = ?auto_341913 ?auto_341919 ) ) ( not ( = ?auto_341913 ?auto_341920 ) ) ( not ( = ?auto_341913 ?auto_341921 ) ) ( not ( = ?auto_341913 ?auto_341922 ) ) ( not ( = ?auto_341913 ?auto_341923 ) ) ( not ( = ?auto_341913 ?auto_341924 ) ) ( not ( = ?auto_341913 ?auto_341925 ) ) ( not ( = ?auto_341914 ?auto_341915 ) ) ( not ( = ?auto_341914 ?auto_341916 ) ) ( not ( = ?auto_341914 ?auto_341917 ) ) ( not ( = ?auto_341914 ?auto_341918 ) ) ( not ( = ?auto_341914 ?auto_341919 ) ) ( not ( = ?auto_341914 ?auto_341920 ) ) ( not ( = ?auto_341914 ?auto_341921 ) ) ( not ( = ?auto_341914 ?auto_341922 ) ) ( not ( = ?auto_341914 ?auto_341923 ) ) ( not ( = ?auto_341914 ?auto_341924 ) ) ( not ( = ?auto_341914 ?auto_341925 ) ) ( not ( = ?auto_341915 ?auto_341916 ) ) ( not ( = ?auto_341915 ?auto_341917 ) ) ( not ( = ?auto_341915 ?auto_341918 ) ) ( not ( = ?auto_341915 ?auto_341919 ) ) ( not ( = ?auto_341915 ?auto_341920 ) ) ( not ( = ?auto_341915 ?auto_341921 ) ) ( not ( = ?auto_341915 ?auto_341922 ) ) ( not ( = ?auto_341915 ?auto_341923 ) ) ( not ( = ?auto_341915 ?auto_341924 ) ) ( not ( = ?auto_341915 ?auto_341925 ) ) ( not ( = ?auto_341916 ?auto_341917 ) ) ( not ( = ?auto_341916 ?auto_341918 ) ) ( not ( = ?auto_341916 ?auto_341919 ) ) ( not ( = ?auto_341916 ?auto_341920 ) ) ( not ( = ?auto_341916 ?auto_341921 ) ) ( not ( = ?auto_341916 ?auto_341922 ) ) ( not ( = ?auto_341916 ?auto_341923 ) ) ( not ( = ?auto_341916 ?auto_341924 ) ) ( not ( = ?auto_341916 ?auto_341925 ) ) ( not ( = ?auto_341917 ?auto_341918 ) ) ( not ( = ?auto_341917 ?auto_341919 ) ) ( not ( = ?auto_341917 ?auto_341920 ) ) ( not ( = ?auto_341917 ?auto_341921 ) ) ( not ( = ?auto_341917 ?auto_341922 ) ) ( not ( = ?auto_341917 ?auto_341923 ) ) ( not ( = ?auto_341917 ?auto_341924 ) ) ( not ( = ?auto_341917 ?auto_341925 ) ) ( not ( = ?auto_341918 ?auto_341919 ) ) ( not ( = ?auto_341918 ?auto_341920 ) ) ( not ( = ?auto_341918 ?auto_341921 ) ) ( not ( = ?auto_341918 ?auto_341922 ) ) ( not ( = ?auto_341918 ?auto_341923 ) ) ( not ( = ?auto_341918 ?auto_341924 ) ) ( not ( = ?auto_341918 ?auto_341925 ) ) ( not ( = ?auto_341919 ?auto_341920 ) ) ( not ( = ?auto_341919 ?auto_341921 ) ) ( not ( = ?auto_341919 ?auto_341922 ) ) ( not ( = ?auto_341919 ?auto_341923 ) ) ( not ( = ?auto_341919 ?auto_341924 ) ) ( not ( = ?auto_341919 ?auto_341925 ) ) ( not ( = ?auto_341920 ?auto_341921 ) ) ( not ( = ?auto_341920 ?auto_341922 ) ) ( not ( = ?auto_341920 ?auto_341923 ) ) ( not ( = ?auto_341920 ?auto_341924 ) ) ( not ( = ?auto_341920 ?auto_341925 ) ) ( not ( = ?auto_341921 ?auto_341922 ) ) ( not ( = ?auto_341921 ?auto_341923 ) ) ( not ( = ?auto_341921 ?auto_341924 ) ) ( not ( = ?auto_341921 ?auto_341925 ) ) ( not ( = ?auto_341922 ?auto_341923 ) ) ( not ( = ?auto_341922 ?auto_341924 ) ) ( not ( = ?auto_341922 ?auto_341925 ) ) ( not ( = ?auto_341923 ?auto_341924 ) ) ( not ( = ?auto_341923 ?auto_341925 ) ) ( not ( = ?auto_341924 ?auto_341925 ) ) ( ON ?auto_341923 ?auto_341924 ) ( ON ?auto_341922 ?auto_341923 ) ( ON ?auto_341921 ?auto_341922 ) ( ON ?auto_341920 ?auto_341921 ) ( ON ?auto_341919 ?auto_341920 ) ( ON ?auto_341918 ?auto_341919 ) ( ON ?auto_341917 ?auto_341918 ) ( ON ?auto_341916 ?auto_341917 ) ( ON ?auto_341915 ?auto_341916 ) ( ON ?auto_341914 ?auto_341915 ) ( ON ?auto_341913 ?auto_341914 ) ( CLEAR ?auto_341913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_341913 )
      ( MAKE-12PILE ?auto_341913 ?auto_341914 ?auto_341915 ?auto_341916 ?auto_341917 ?auto_341918 ?auto_341919 ?auto_341920 ?auto_341921 ?auto_341922 ?auto_341923 ?auto_341924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_341964 - BLOCK
      ?auto_341965 - BLOCK
      ?auto_341966 - BLOCK
      ?auto_341967 - BLOCK
      ?auto_341968 - BLOCK
      ?auto_341969 - BLOCK
      ?auto_341970 - BLOCK
      ?auto_341971 - BLOCK
      ?auto_341972 - BLOCK
      ?auto_341973 - BLOCK
      ?auto_341974 - BLOCK
      ?auto_341975 - BLOCK
      ?auto_341976 - BLOCK
    )
    :vars
    (
      ?auto_341977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_341975 ) ( ON ?auto_341976 ?auto_341977 ) ( CLEAR ?auto_341976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_341964 ) ( ON ?auto_341965 ?auto_341964 ) ( ON ?auto_341966 ?auto_341965 ) ( ON ?auto_341967 ?auto_341966 ) ( ON ?auto_341968 ?auto_341967 ) ( ON ?auto_341969 ?auto_341968 ) ( ON ?auto_341970 ?auto_341969 ) ( ON ?auto_341971 ?auto_341970 ) ( ON ?auto_341972 ?auto_341971 ) ( ON ?auto_341973 ?auto_341972 ) ( ON ?auto_341974 ?auto_341973 ) ( ON ?auto_341975 ?auto_341974 ) ( not ( = ?auto_341964 ?auto_341965 ) ) ( not ( = ?auto_341964 ?auto_341966 ) ) ( not ( = ?auto_341964 ?auto_341967 ) ) ( not ( = ?auto_341964 ?auto_341968 ) ) ( not ( = ?auto_341964 ?auto_341969 ) ) ( not ( = ?auto_341964 ?auto_341970 ) ) ( not ( = ?auto_341964 ?auto_341971 ) ) ( not ( = ?auto_341964 ?auto_341972 ) ) ( not ( = ?auto_341964 ?auto_341973 ) ) ( not ( = ?auto_341964 ?auto_341974 ) ) ( not ( = ?auto_341964 ?auto_341975 ) ) ( not ( = ?auto_341964 ?auto_341976 ) ) ( not ( = ?auto_341964 ?auto_341977 ) ) ( not ( = ?auto_341965 ?auto_341966 ) ) ( not ( = ?auto_341965 ?auto_341967 ) ) ( not ( = ?auto_341965 ?auto_341968 ) ) ( not ( = ?auto_341965 ?auto_341969 ) ) ( not ( = ?auto_341965 ?auto_341970 ) ) ( not ( = ?auto_341965 ?auto_341971 ) ) ( not ( = ?auto_341965 ?auto_341972 ) ) ( not ( = ?auto_341965 ?auto_341973 ) ) ( not ( = ?auto_341965 ?auto_341974 ) ) ( not ( = ?auto_341965 ?auto_341975 ) ) ( not ( = ?auto_341965 ?auto_341976 ) ) ( not ( = ?auto_341965 ?auto_341977 ) ) ( not ( = ?auto_341966 ?auto_341967 ) ) ( not ( = ?auto_341966 ?auto_341968 ) ) ( not ( = ?auto_341966 ?auto_341969 ) ) ( not ( = ?auto_341966 ?auto_341970 ) ) ( not ( = ?auto_341966 ?auto_341971 ) ) ( not ( = ?auto_341966 ?auto_341972 ) ) ( not ( = ?auto_341966 ?auto_341973 ) ) ( not ( = ?auto_341966 ?auto_341974 ) ) ( not ( = ?auto_341966 ?auto_341975 ) ) ( not ( = ?auto_341966 ?auto_341976 ) ) ( not ( = ?auto_341966 ?auto_341977 ) ) ( not ( = ?auto_341967 ?auto_341968 ) ) ( not ( = ?auto_341967 ?auto_341969 ) ) ( not ( = ?auto_341967 ?auto_341970 ) ) ( not ( = ?auto_341967 ?auto_341971 ) ) ( not ( = ?auto_341967 ?auto_341972 ) ) ( not ( = ?auto_341967 ?auto_341973 ) ) ( not ( = ?auto_341967 ?auto_341974 ) ) ( not ( = ?auto_341967 ?auto_341975 ) ) ( not ( = ?auto_341967 ?auto_341976 ) ) ( not ( = ?auto_341967 ?auto_341977 ) ) ( not ( = ?auto_341968 ?auto_341969 ) ) ( not ( = ?auto_341968 ?auto_341970 ) ) ( not ( = ?auto_341968 ?auto_341971 ) ) ( not ( = ?auto_341968 ?auto_341972 ) ) ( not ( = ?auto_341968 ?auto_341973 ) ) ( not ( = ?auto_341968 ?auto_341974 ) ) ( not ( = ?auto_341968 ?auto_341975 ) ) ( not ( = ?auto_341968 ?auto_341976 ) ) ( not ( = ?auto_341968 ?auto_341977 ) ) ( not ( = ?auto_341969 ?auto_341970 ) ) ( not ( = ?auto_341969 ?auto_341971 ) ) ( not ( = ?auto_341969 ?auto_341972 ) ) ( not ( = ?auto_341969 ?auto_341973 ) ) ( not ( = ?auto_341969 ?auto_341974 ) ) ( not ( = ?auto_341969 ?auto_341975 ) ) ( not ( = ?auto_341969 ?auto_341976 ) ) ( not ( = ?auto_341969 ?auto_341977 ) ) ( not ( = ?auto_341970 ?auto_341971 ) ) ( not ( = ?auto_341970 ?auto_341972 ) ) ( not ( = ?auto_341970 ?auto_341973 ) ) ( not ( = ?auto_341970 ?auto_341974 ) ) ( not ( = ?auto_341970 ?auto_341975 ) ) ( not ( = ?auto_341970 ?auto_341976 ) ) ( not ( = ?auto_341970 ?auto_341977 ) ) ( not ( = ?auto_341971 ?auto_341972 ) ) ( not ( = ?auto_341971 ?auto_341973 ) ) ( not ( = ?auto_341971 ?auto_341974 ) ) ( not ( = ?auto_341971 ?auto_341975 ) ) ( not ( = ?auto_341971 ?auto_341976 ) ) ( not ( = ?auto_341971 ?auto_341977 ) ) ( not ( = ?auto_341972 ?auto_341973 ) ) ( not ( = ?auto_341972 ?auto_341974 ) ) ( not ( = ?auto_341972 ?auto_341975 ) ) ( not ( = ?auto_341972 ?auto_341976 ) ) ( not ( = ?auto_341972 ?auto_341977 ) ) ( not ( = ?auto_341973 ?auto_341974 ) ) ( not ( = ?auto_341973 ?auto_341975 ) ) ( not ( = ?auto_341973 ?auto_341976 ) ) ( not ( = ?auto_341973 ?auto_341977 ) ) ( not ( = ?auto_341974 ?auto_341975 ) ) ( not ( = ?auto_341974 ?auto_341976 ) ) ( not ( = ?auto_341974 ?auto_341977 ) ) ( not ( = ?auto_341975 ?auto_341976 ) ) ( not ( = ?auto_341975 ?auto_341977 ) ) ( not ( = ?auto_341976 ?auto_341977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_341976 ?auto_341977 )
      ( !STACK ?auto_341976 ?auto_341975 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342018 - BLOCK
      ?auto_342019 - BLOCK
      ?auto_342020 - BLOCK
      ?auto_342021 - BLOCK
      ?auto_342022 - BLOCK
      ?auto_342023 - BLOCK
      ?auto_342024 - BLOCK
      ?auto_342025 - BLOCK
      ?auto_342026 - BLOCK
      ?auto_342027 - BLOCK
      ?auto_342028 - BLOCK
      ?auto_342029 - BLOCK
      ?auto_342030 - BLOCK
    )
    :vars
    (
      ?auto_342031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342030 ?auto_342031 ) ( ON-TABLE ?auto_342018 ) ( ON ?auto_342019 ?auto_342018 ) ( ON ?auto_342020 ?auto_342019 ) ( ON ?auto_342021 ?auto_342020 ) ( ON ?auto_342022 ?auto_342021 ) ( ON ?auto_342023 ?auto_342022 ) ( ON ?auto_342024 ?auto_342023 ) ( ON ?auto_342025 ?auto_342024 ) ( ON ?auto_342026 ?auto_342025 ) ( ON ?auto_342027 ?auto_342026 ) ( ON ?auto_342028 ?auto_342027 ) ( not ( = ?auto_342018 ?auto_342019 ) ) ( not ( = ?auto_342018 ?auto_342020 ) ) ( not ( = ?auto_342018 ?auto_342021 ) ) ( not ( = ?auto_342018 ?auto_342022 ) ) ( not ( = ?auto_342018 ?auto_342023 ) ) ( not ( = ?auto_342018 ?auto_342024 ) ) ( not ( = ?auto_342018 ?auto_342025 ) ) ( not ( = ?auto_342018 ?auto_342026 ) ) ( not ( = ?auto_342018 ?auto_342027 ) ) ( not ( = ?auto_342018 ?auto_342028 ) ) ( not ( = ?auto_342018 ?auto_342029 ) ) ( not ( = ?auto_342018 ?auto_342030 ) ) ( not ( = ?auto_342018 ?auto_342031 ) ) ( not ( = ?auto_342019 ?auto_342020 ) ) ( not ( = ?auto_342019 ?auto_342021 ) ) ( not ( = ?auto_342019 ?auto_342022 ) ) ( not ( = ?auto_342019 ?auto_342023 ) ) ( not ( = ?auto_342019 ?auto_342024 ) ) ( not ( = ?auto_342019 ?auto_342025 ) ) ( not ( = ?auto_342019 ?auto_342026 ) ) ( not ( = ?auto_342019 ?auto_342027 ) ) ( not ( = ?auto_342019 ?auto_342028 ) ) ( not ( = ?auto_342019 ?auto_342029 ) ) ( not ( = ?auto_342019 ?auto_342030 ) ) ( not ( = ?auto_342019 ?auto_342031 ) ) ( not ( = ?auto_342020 ?auto_342021 ) ) ( not ( = ?auto_342020 ?auto_342022 ) ) ( not ( = ?auto_342020 ?auto_342023 ) ) ( not ( = ?auto_342020 ?auto_342024 ) ) ( not ( = ?auto_342020 ?auto_342025 ) ) ( not ( = ?auto_342020 ?auto_342026 ) ) ( not ( = ?auto_342020 ?auto_342027 ) ) ( not ( = ?auto_342020 ?auto_342028 ) ) ( not ( = ?auto_342020 ?auto_342029 ) ) ( not ( = ?auto_342020 ?auto_342030 ) ) ( not ( = ?auto_342020 ?auto_342031 ) ) ( not ( = ?auto_342021 ?auto_342022 ) ) ( not ( = ?auto_342021 ?auto_342023 ) ) ( not ( = ?auto_342021 ?auto_342024 ) ) ( not ( = ?auto_342021 ?auto_342025 ) ) ( not ( = ?auto_342021 ?auto_342026 ) ) ( not ( = ?auto_342021 ?auto_342027 ) ) ( not ( = ?auto_342021 ?auto_342028 ) ) ( not ( = ?auto_342021 ?auto_342029 ) ) ( not ( = ?auto_342021 ?auto_342030 ) ) ( not ( = ?auto_342021 ?auto_342031 ) ) ( not ( = ?auto_342022 ?auto_342023 ) ) ( not ( = ?auto_342022 ?auto_342024 ) ) ( not ( = ?auto_342022 ?auto_342025 ) ) ( not ( = ?auto_342022 ?auto_342026 ) ) ( not ( = ?auto_342022 ?auto_342027 ) ) ( not ( = ?auto_342022 ?auto_342028 ) ) ( not ( = ?auto_342022 ?auto_342029 ) ) ( not ( = ?auto_342022 ?auto_342030 ) ) ( not ( = ?auto_342022 ?auto_342031 ) ) ( not ( = ?auto_342023 ?auto_342024 ) ) ( not ( = ?auto_342023 ?auto_342025 ) ) ( not ( = ?auto_342023 ?auto_342026 ) ) ( not ( = ?auto_342023 ?auto_342027 ) ) ( not ( = ?auto_342023 ?auto_342028 ) ) ( not ( = ?auto_342023 ?auto_342029 ) ) ( not ( = ?auto_342023 ?auto_342030 ) ) ( not ( = ?auto_342023 ?auto_342031 ) ) ( not ( = ?auto_342024 ?auto_342025 ) ) ( not ( = ?auto_342024 ?auto_342026 ) ) ( not ( = ?auto_342024 ?auto_342027 ) ) ( not ( = ?auto_342024 ?auto_342028 ) ) ( not ( = ?auto_342024 ?auto_342029 ) ) ( not ( = ?auto_342024 ?auto_342030 ) ) ( not ( = ?auto_342024 ?auto_342031 ) ) ( not ( = ?auto_342025 ?auto_342026 ) ) ( not ( = ?auto_342025 ?auto_342027 ) ) ( not ( = ?auto_342025 ?auto_342028 ) ) ( not ( = ?auto_342025 ?auto_342029 ) ) ( not ( = ?auto_342025 ?auto_342030 ) ) ( not ( = ?auto_342025 ?auto_342031 ) ) ( not ( = ?auto_342026 ?auto_342027 ) ) ( not ( = ?auto_342026 ?auto_342028 ) ) ( not ( = ?auto_342026 ?auto_342029 ) ) ( not ( = ?auto_342026 ?auto_342030 ) ) ( not ( = ?auto_342026 ?auto_342031 ) ) ( not ( = ?auto_342027 ?auto_342028 ) ) ( not ( = ?auto_342027 ?auto_342029 ) ) ( not ( = ?auto_342027 ?auto_342030 ) ) ( not ( = ?auto_342027 ?auto_342031 ) ) ( not ( = ?auto_342028 ?auto_342029 ) ) ( not ( = ?auto_342028 ?auto_342030 ) ) ( not ( = ?auto_342028 ?auto_342031 ) ) ( not ( = ?auto_342029 ?auto_342030 ) ) ( not ( = ?auto_342029 ?auto_342031 ) ) ( not ( = ?auto_342030 ?auto_342031 ) ) ( CLEAR ?auto_342028 ) ( ON ?auto_342029 ?auto_342030 ) ( CLEAR ?auto_342029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_342018 ?auto_342019 ?auto_342020 ?auto_342021 ?auto_342022 ?auto_342023 ?auto_342024 ?auto_342025 ?auto_342026 ?auto_342027 ?auto_342028 ?auto_342029 )
      ( MAKE-13PILE ?auto_342018 ?auto_342019 ?auto_342020 ?auto_342021 ?auto_342022 ?auto_342023 ?auto_342024 ?auto_342025 ?auto_342026 ?auto_342027 ?auto_342028 ?auto_342029 ?auto_342030 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342072 - BLOCK
      ?auto_342073 - BLOCK
      ?auto_342074 - BLOCK
      ?auto_342075 - BLOCK
      ?auto_342076 - BLOCK
      ?auto_342077 - BLOCK
      ?auto_342078 - BLOCK
      ?auto_342079 - BLOCK
      ?auto_342080 - BLOCK
      ?auto_342081 - BLOCK
      ?auto_342082 - BLOCK
      ?auto_342083 - BLOCK
      ?auto_342084 - BLOCK
    )
    :vars
    (
      ?auto_342085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342084 ?auto_342085 ) ( ON-TABLE ?auto_342072 ) ( ON ?auto_342073 ?auto_342072 ) ( ON ?auto_342074 ?auto_342073 ) ( ON ?auto_342075 ?auto_342074 ) ( ON ?auto_342076 ?auto_342075 ) ( ON ?auto_342077 ?auto_342076 ) ( ON ?auto_342078 ?auto_342077 ) ( ON ?auto_342079 ?auto_342078 ) ( ON ?auto_342080 ?auto_342079 ) ( ON ?auto_342081 ?auto_342080 ) ( not ( = ?auto_342072 ?auto_342073 ) ) ( not ( = ?auto_342072 ?auto_342074 ) ) ( not ( = ?auto_342072 ?auto_342075 ) ) ( not ( = ?auto_342072 ?auto_342076 ) ) ( not ( = ?auto_342072 ?auto_342077 ) ) ( not ( = ?auto_342072 ?auto_342078 ) ) ( not ( = ?auto_342072 ?auto_342079 ) ) ( not ( = ?auto_342072 ?auto_342080 ) ) ( not ( = ?auto_342072 ?auto_342081 ) ) ( not ( = ?auto_342072 ?auto_342082 ) ) ( not ( = ?auto_342072 ?auto_342083 ) ) ( not ( = ?auto_342072 ?auto_342084 ) ) ( not ( = ?auto_342072 ?auto_342085 ) ) ( not ( = ?auto_342073 ?auto_342074 ) ) ( not ( = ?auto_342073 ?auto_342075 ) ) ( not ( = ?auto_342073 ?auto_342076 ) ) ( not ( = ?auto_342073 ?auto_342077 ) ) ( not ( = ?auto_342073 ?auto_342078 ) ) ( not ( = ?auto_342073 ?auto_342079 ) ) ( not ( = ?auto_342073 ?auto_342080 ) ) ( not ( = ?auto_342073 ?auto_342081 ) ) ( not ( = ?auto_342073 ?auto_342082 ) ) ( not ( = ?auto_342073 ?auto_342083 ) ) ( not ( = ?auto_342073 ?auto_342084 ) ) ( not ( = ?auto_342073 ?auto_342085 ) ) ( not ( = ?auto_342074 ?auto_342075 ) ) ( not ( = ?auto_342074 ?auto_342076 ) ) ( not ( = ?auto_342074 ?auto_342077 ) ) ( not ( = ?auto_342074 ?auto_342078 ) ) ( not ( = ?auto_342074 ?auto_342079 ) ) ( not ( = ?auto_342074 ?auto_342080 ) ) ( not ( = ?auto_342074 ?auto_342081 ) ) ( not ( = ?auto_342074 ?auto_342082 ) ) ( not ( = ?auto_342074 ?auto_342083 ) ) ( not ( = ?auto_342074 ?auto_342084 ) ) ( not ( = ?auto_342074 ?auto_342085 ) ) ( not ( = ?auto_342075 ?auto_342076 ) ) ( not ( = ?auto_342075 ?auto_342077 ) ) ( not ( = ?auto_342075 ?auto_342078 ) ) ( not ( = ?auto_342075 ?auto_342079 ) ) ( not ( = ?auto_342075 ?auto_342080 ) ) ( not ( = ?auto_342075 ?auto_342081 ) ) ( not ( = ?auto_342075 ?auto_342082 ) ) ( not ( = ?auto_342075 ?auto_342083 ) ) ( not ( = ?auto_342075 ?auto_342084 ) ) ( not ( = ?auto_342075 ?auto_342085 ) ) ( not ( = ?auto_342076 ?auto_342077 ) ) ( not ( = ?auto_342076 ?auto_342078 ) ) ( not ( = ?auto_342076 ?auto_342079 ) ) ( not ( = ?auto_342076 ?auto_342080 ) ) ( not ( = ?auto_342076 ?auto_342081 ) ) ( not ( = ?auto_342076 ?auto_342082 ) ) ( not ( = ?auto_342076 ?auto_342083 ) ) ( not ( = ?auto_342076 ?auto_342084 ) ) ( not ( = ?auto_342076 ?auto_342085 ) ) ( not ( = ?auto_342077 ?auto_342078 ) ) ( not ( = ?auto_342077 ?auto_342079 ) ) ( not ( = ?auto_342077 ?auto_342080 ) ) ( not ( = ?auto_342077 ?auto_342081 ) ) ( not ( = ?auto_342077 ?auto_342082 ) ) ( not ( = ?auto_342077 ?auto_342083 ) ) ( not ( = ?auto_342077 ?auto_342084 ) ) ( not ( = ?auto_342077 ?auto_342085 ) ) ( not ( = ?auto_342078 ?auto_342079 ) ) ( not ( = ?auto_342078 ?auto_342080 ) ) ( not ( = ?auto_342078 ?auto_342081 ) ) ( not ( = ?auto_342078 ?auto_342082 ) ) ( not ( = ?auto_342078 ?auto_342083 ) ) ( not ( = ?auto_342078 ?auto_342084 ) ) ( not ( = ?auto_342078 ?auto_342085 ) ) ( not ( = ?auto_342079 ?auto_342080 ) ) ( not ( = ?auto_342079 ?auto_342081 ) ) ( not ( = ?auto_342079 ?auto_342082 ) ) ( not ( = ?auto_342079 ?auto_342083 ) ) ( not ( = ?auto_342079 ?auto_342084 ) ) ( not ( = ?auto_342079 ?auto_342085 ) ) ( not ( = ?auto_342080 ?auto_342081 ) ) ( not ( = ?auto_342080 ?auto_342082 ) ) ( not ( = ?auto_342080 ?auto_342083 ) ) ( not ( = ?auto_342080 ?auto_342084 ) ) ( not ( = ?auto_342080 ?auto_342085 ) ) ( not ( = ?auto_342081 ?auto_342082 ) ) ( not ( = ?auto_342081 ?auto_342083 ) ) ( not ( = ?auto_342081 ?auto_342084 ) ) ( not ( = ?auto_342081 ?auto_342085 ) ) ( not ( = ?auto_342082 ?auto_342083 ) ) ( not ( = ?auto_342082 ?auto_342084 ) ) ( not ( = ?auto_342082 ?auto_342085 ) ) ( not ( = ?auto_342083 ?auto_342084 ) ) ( not ( = ?auto_342083 ?auto_342085 ) ) ( not ( = ?auto_342084 ?auto_342085 ) ) ( ON ?auto_342083 ?auto_342084 ) ( CLEAR ?auto_342081 ) ( ON ?auto_342082 ?auto_342083 ) ( CLEAR ?auto_342082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_342072 ?auto_342073 ?auto_342074 ?auto_342075 ?auto_342076 ?auto_342077 ?auto_342078 ?auto_342079 ?auto_342080 ?auto_342081 ?auto_342082 )
      ( MAKE-13PILE ?auto_342072 ?auto_342073 ?auto_342074 ?auto_342075 ?auto_342076 ?auto_342077 ?auto_342078 ?auto_342079 ?auto_342080 ?auto_342081 ?auto_342082 ?auto_342083 ?auto_342084 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342126 - BLOCK
      ?auto_342127 - BLOCK
      ?auto_342128 - BLOCK
      ?auto_342129 - BLOCK
      ?auto_342130 - BLOCK
      ?auto_342131 - BLOCK
      ?auto_342132 - BLOCK
      ?auto_342133 - BLOCK
      ?auto_342134 - BLOCK
      ?auto_342135 - BLOCK
      ?auto_342136 - BLOCK
      ?auto_342137 - BLOCK
      ?auto_342138 - BLOCK
    )
    :vars
    (
      ?auto_342139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342138 ?auto_342139 ) ( ON-TABLE ?auto_342126 ) ( ON ?auto_342127 ?auto_342126 ) ( ON ?auto_342128 ?auto_342127 ) ( ON ?auto_342129 ?auto_342128 ) ( ON ?auto_342130 ?auto_342129 ) ( ON ?auto_342131 ?auto_342130 ) ( ON ?auto_342132 ?auto_342131 ) ( ON ?auto_342133 ?auto_342132 ) ( ON ?auto_342134 ?auto_342133 ) ( not ( = ?auto_342126 ?auto_342127 ) ) ( not ( = ?auto_342126 ?auto_342128 ) ) ( not ( = ?auto_342126 ?auto_342129 ) ) ( not ( = ?auto_342126 ?auto_342130 ) ) ( not ( = ?auto_342126 ?auto_342131 ) ) ( not ( = ?auto_342126 ?auto_342132 ) ) ( not ( = ?auto_342126 ?auto_342133 ) ) ( not ( = ?auto_342126 ?auto_342134 ) ) ( not ( = ?auto_342126 ?auto_342135 ) ) ( not ( = ?auto_342126 ?auto_342136 ) ) ( not ( = ?auto_342126 ?auto_342137 ) ) ( not ( = ?auto_342126 ?auto_342138 ) ) ( not ( = ?auto_342126 ?auto_342139 ) ) ( not ( = ?auto_342127 ?auto_342128 ) ) ( not ( = ?auto_342127 ?auto_342129 ) ) ( not ( = ?auto_342127 ?auto_342130 ) ) ( not ( = ?auto_342127 ?auto_342131 ) ) ( not ( = ?auto_342127 ?auto_342132 ) ) ( not ( = ?auto_342127 ?auto_342133 ) ) ( not ( = ?auto_342127 ?auto_342134 ) ) ( not ( = ?auto_342127 ?auto_342135 ) ) ( not ( = ?auto_342127 ?auto_342136 ) ) ( not ( = ?auto_342127 ?auto_342137 ) ) ( not ( = ?auto_342127 ?auto_342138 ) ) ( not ( = ?auto_342127 ?auto_342139 ) ) ( not ( = ?auto_342128 ?auto_342129 ) ) ( not ( = ?auto_342128 ?auto_342130 ) ) ( not ( = ?auto_342128 ?auto_342131 ) ) ( not ( = ?auto_342128 ?auto_342132 ) ) ( not ( = ?auto_342128 ?auto_342133 ) ) ( not ( = ?auto_342128 ?auto_342134 ) ) ( not ( = ?auto_342128 ?auto_342135 ) ) ( not ( = ?auto_342128 ?auto_342136 ) ) ( not ( = ?auto_342128 ?auto_342137 ) ) ( not ( = ?auto_342128 ?auto_342138 ) ) ( not ( = ?auto_342128 ?auto_342139 ) ) ( not ( = ?auto_342129 ?auto_342130 ) ) ( not ( = ?auto_342129 ?auto_342131 ) ) ( not ( = ?auto_342129 ?auto_342132 ) ) ( not ( = ?auto_342129 ?auto_342133 ) ) ( not ( = ?auto_342129 ?auto_342134 ) ) ( not ( = ?auto_342129 ?auto_342135 ) ) ( not ( = ?auto_342129 ?auto_342136 ) ) ( not ( = ?auto_342129 ?auto_342137 ) ) ( not ( = ?auto_342129 ?auto_342138 ) ) ( not ( = ?auto_342129 ?auto_342139 ) ) ( not ( = ?auto_342130 ?auto_342131 ) ) ( not ( = ?auto_342130 ?auto_342132 ) ) ( not ( = ?auto_342130 ?auto_342133 ) ) ( not ( = ?auto_342130 ?auto_342134 ) ) ( not ( = ?auto_342130 ?auto_342135 ) ) ( not ( = ?auto_342130 ?auto_342136 ) ) ( not ( = ?auto_342130 ?auto_342137 ) ) ( not ( = ?auto_342130 ?auto_342138 ) ) ( not ( = ?auto_342130 ?auto_342139 ) ) ( not ( = ?auto_342131 ?auto_342132 ) ) ( not ( = ?auto_342131 ?auto_342133 ) ) ( not ( = ?auto_342131 ?auto_342134 ) ) ( not ( = ?auto_342131 ?auto_342135 ) ) ( not ( = ?auto_342131 ?auto_342136 ) ) ( not ( = ?auto_342131 ?auto_342137 ) ) ( not ( = ?auto_342131 ?auto_342138 ) ) ( not ( = ?auto_342131 ?auto_342139 ) ) ( not ( = ?auto_342132 ?auto_342133 ) ) ( not ( = ?auto_342132 ?auto_342134 ) ) ( not ( = ?auto_342132 ?auto_342135 ) ) ( not ( = ?auto_342132 ?auto_342136 ) ) ( not ( = ?auto_342132 ?auto_342137 ) ) ( not ( = ?auto_342132 ?auto_342138 ) ) ( not ( = ?auto_342132 ?auto_342139 ) ) ( not ( = ?auto_342133 ?auto_342134 ) ) ( not ( = ?auto_342133 ?auto_342135 ) ) ( not ( = ?auto_342133 ?auto_342136 ) ) ( not ( = ?auto_342133 ?auto_342137 ) ) ( not ( = ?auto_342133 ?auto_342138 ) ) ( not ( = ?auto_342133 ?auto_342139 ) ) ( not ( = ?auto_342134 ?auto_342135 ) ) ( not ( = ?auto_342134 ?auto_342136 ) ) ( not ( = ?auto_342134 ?auto_342137 ) ) ( not ( = ?auto_342134 ?auto_342138 ) ) ( not ( = ?auto_342134 ?auto_342139 ) ) ( not ( = ?auto_342135 ?auto_342136 ) ) ( not ( = ?auto_342135 ?auto_342137 ) ) ( not ( = ?auto_342135 ?auto_342138 ) ) ( not ( = ?auto_342135 ?auto_342139 ) ) ( not ( = ?auto_342136 ?auto_342137 ) ) ( not ( = ?auto_342136 ?auto_342138 ) ) ( not ( = ?auto_342136 ?auto_342139 ) ) ( not ( = ?auto_342137 ?auto_342138 ) ) ( not ( = ?auto_342137 ?auto_342139 ) ) ( not ( = ?auto_342138 ?auto_342139 ) ) ( ON ?auto_342137 ?auto_342138 ) ( ON ?auto_342136 ?auto_342137 ) ( CLEAR ?auto_342134 ) ( ON ?auto_342135 ?auto_342136 ) ( CLEAR ?auto_342135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_342126 ?auto_342127 ?auto_342128 ?auto_342129 ?auto_342130 ?auto_342131 ?auto_342132 ?auto_342133 ?auto_342134 ?auto_342135 )
      ( MAKE-13PILE ?auto_342126 ?auto_342127 ?auto_342128 ?auto_342129 ?auto_342130 ?auto_342131 ?auto_342132 ?auto_342133 ?auto_342134 ?auto_342135 ?auto_342136 ?auto_342137 ?auto_342138 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342180 - BLOCK
      ?auto_342181 - BLOCK
      ?auto_342182 - BLOCK
      ?auto_342183 - BLOCK
      ?auto_342184 - BLOCK
      ?auto_342185 - BLOCK
      ?auto_342186 - BLOCK
      ?auto_342187 - BLOCK
      ?auto_342188 - BLOCK
      ?auto_342189 - BLOCK
      ?auto_342190 - BLOCK
      ?auto_342191 - BLOCK
      ?auto_342192 - BLOCK
    )
    :vars
    (
      ?auto_342193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342192 ?auto_342193 ) ( ON-TABLE ?auto_342180 ) ( ON ?auto_342181 ?auto_342180 ) ( ON ?auto_342182 ?auto_342181 ) ( ON ?auto_342183 ?auto_342182 ) ( ON ?auto_342184 ?auto_342183 ) ( ON ?auto_342185 ?auto_342184 ) ( ON ?auto_342186 ?auto_342185 ) ( ON ?auto_342187 ?auto_342186 ) ( not ( = ?auto_342180 ?auto_342181 ) ) ( not ( = ?auto_342180 ?auto_342182 ) ) ( not ( = ?auto_342180 ?auto_342183 ) ) ( not ( = ?auto_342180 ?auto_342184 ) ) ( not ( = ?auto_342180 ?auto_342185 ) ) ( not ( = ?auto_342180 ?auto_342186 ) ) ( not ( = ?auto_342180 ?auto_342187 ) ) ( not ( = ?auto_342180 ?auto_342188 ) ) ( not ( = ?auto_342180 ?auto_342189 ) ) ( not ( = ?auto_342180 ?auto_342190 ) ) ( not ( = ?auto_342180 ?auto_342191 ) ) ( not ( = ?auto_342180 ?auto_342192 ) ) ( not ( = ?auto_342180 ?auto_342193 ) ) ( not ( = ?auto_342181 ?auto_342182 ) ) ( not ( = ?auto_342181 ?auto_342183 ) ) ( not ( = ?auto_342181 ?auto_342184 ) ) ( not ( = ?auto_342181 ?auto_342185 ) ) ( not ( = ?auto_342181 ?auto_342186 ) ) ( not ( = ?auto_342181 ?auto_342187 ) ) ( not ( = ?auto_342181 ?auto_342188 ) ) ( not ( = ?auto_342181 ?auto_342189 ) ) ( not ( = ?auto_342181 ?auto_342190 ) ) ( not ( = ?auto_342181 ?auto_342191 ) ) ( not ( = ?auto_342181 ?auto_342192 ) ) ( not ( = ?auto_342181 ?auto_342193 ) ) ( not ( = ?auto_342182 ?auto_342183 ) ) ( not ( = ?auto_342182 ?auto_342184 ) ) ( not ( = ?auto_342182 ?auto_342185 ) ) ( not ( = ?auto_342182 ?auto_342186 ) ) ( not ( = ?auto_342182 ?auto_342187 ) ) ( not ( = ?auto_342182 ?auto_342188 ) ) ( not ( = ?auto_342182 ?auto_342189 ) ) ( not ( = ?auto_342182 ?auto_342190 ) ) ( not ( = ?auto_342182 ?auto_342191 ) ) ( not ( = ?auto_342182 ?auto_342192 ) ) ( not ( = ?auto_342182 ?auto_342193 ) ) ( not ( = ?auto_342183 ?auto_342184 ) ) ( not ( = ?auto_342183 ?auto_342185 ) ) ( not ( = ?auto_342183 ?auto_342186 ) ) ( not ( = ?auto_342183 ?auto_342187 ) ) ( not ( = ?auto_342183 ?auto_342188 ) ) ( not ( = ?auto_342183 ?auto_342189 ) ) ( not ( = ?auto_342183 ?auto_342190 ) ) ( not ( = ?auto_342183 ?auto_342191 ) ) ( not ( = ?auto_342183 ?auto_342192 ) ) ( not ( = ?auto_342183 ?auto_342193 ) ) ( not ( = ?auto_342184 ?auto_342185 ) ) ( not ( = ?auto_342184 ?auto_342186 ) ) ( not ( = ?auto_342184 ?auto_342187 ) ) ( not ( = ?auto_342184 ?auto_342188 ) ) ( not ( = ?auto_342184 ?auto_342189 ) ) ( not ( = ?auto_342184 ?auto_342190 ) ) ( not ( = ?auto_342184 ?auto_342191 ) ) ( not ( = ?auto_342184 ?auto_342192 ) ) ( not ( = ?auto_342184 ?auto_342193 ) ) ( not ( = ?auto_342185 ?auto_342186 ) ) ( not ( = ?auto_342185 ?auto_342187 ) ) ( not ( = ?auto_342185 ?auto_342188 ) ) ( not ( = ?auto_342185 ?auto_342189 ) ) ( not ( = ?auto_342185 ?auto_342190 ) ) ( not ( = ?auto_342185 ?auto_342191 ) ) ( not ( = ?auto_342185 ?auto_342192 ) ) ( not ( = ?auto_342185 ?auto_342193 ) ) ( not ( = ?auto_342186 ?auto_342187 ) ) ( not ( = ?auto_342186 ?auto_342188 ) ) ( not ( = ?auto_342186 ?auto_342189 ) ) ( not ( = ?auto_342186 ?auto_342190 ) ) ( not ( = ?auto_342186 ?auto_342191 ) ) ( not ( = ?auto_342186 ?auto_342192 ) ) ( not ( = ?auto_342186 ?auto_342193 ) ) ( not ( = ?auto_342187 ?auto_342188 ) ) ( not ( = ?auto_342187 ?auto_342189 ) ) ( not ( = ?auto_342187 ?auto_342190 ) ) ( not ( = ?auto_342187 ?auto_342191 ) ) ( not ( = ?auto_342187 ?auto_342192 ) ) ( not ( = ?auto_342187 ?auto_342193 ) ) ( not ( = ?auto_342188 ?auto_342189 ) ) ( not ( = ?auto_342188 ?auto_342190 ) ) ( not ( = ?auto_342188 ?auto_342191 ) ) ( not ( = ?auto_342188 ?auto_342192 ) ) ( not ( = ?auto_342188 ?auto_342193 ) ) ( not ( = ?auto_342189 ?auto_342190 ) ) ( not ( = ?auto_342189 ?auto_342191 ) ) ( not ( = ?auto_342189 ?auto_342192 ) ) ( not ( = ?auto_342189 ?auto_342193 ) ) ( not ( = ?auto_342190 ?auto_342191 ) ) ( not ( = ?auto_342190 ?auto_342192 ) ) ( not ( = ?auto_342190 ?auto_342193 ) ) ( not ( = ?auto_342191 ?auto_342192 ) ) ( not ( = ?auto_342191 ?auto_342193 ) ) ( not ( = ?auto_342192 ?auto_342193 ) ) ( ON ?auto_342191 ?auto_342192 ) ( ON ?auto_342190 ?auto_342191 ) ( ON ?auto_342189 ?auto_342190 ) ( CLEAR ?auto_342187 ) ( ON ?auto_342188 ?auto_342189 ) ( CLEAR ?auto_342188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_342180 ?auto_342181 ?auto_342182 ?auto_342183 ?auto_342184 ?auto_342185 ?auto_342186 ?auto_342187 ?auto_342188 )
      ( MAKE-13PILE ?auto_342180 ?auto_342181 ?auto_342182 ?auto_342183 ?auto_342184 ?auto_342185 ?auto_342186 ?auto_342187 ?auto_342188 ?auto_342189 ?auto_342190 ?auto_342191 ?auto_342192 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342234 - BLOCK
      ?auto_342235 - BLOCK
      ?auto_342236 - BLOCK
      ?auto_342237 - BLOCK
      ?auto_342238 - BLOCK
      ?auto_342239 - BLOCK
      ?auto_342240 - BLOCK
      ?auto_342241 - BLOCK
      ?auto_342242 - BLOCK
      ?auto_342243 - BLOCK
      ?auto_342244 - BLOCK
      ?auto_342245 - BLOCK
      ?auto_342246 - BLOCK
    )
    :vars
    (
      ?auto_342247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342246 ?auto_342247 ) ( ON-TABLE ?auto_342234 ) ( ON ?auto_342235 ?auto_342234 ) ( ON ?auto_342236 ?auto_342235 ) ( ON ?auto_342237 ?auto_342236 ) ( ON ?auto_342238 ?auto_342237 ) ( ON ?auto_342239 ?auto_342238 ) ( ON ?auto_342240 ?auto_342239 ) ( not ( = ?auto_342234 ?auto_342235 ) ) ( not ( = ?auto_342234 ?auto_342236 ) ) ( not ( = ?auto_342234 ?auto_342237 ) ) ( not ( = ?auto_342234 ?auto_342238 ) ) ( not ( = ?auto_342234 ?auto_342239 ) ) ( not ( = ?auto_342234 ?auto_342240 ) ) ( not ( = ?auto_342234 ?auto_342241 ) ) ( not ( = ?auto_342234 ?auto_342242 ) ) ( not ( = ?auto_342234 ?auto_342243 ) ) ( not ( = ?auto_342234 ?auto_342244 ) ) ( not ( = ?auto_342234 ?auto_342245 ) ) ( not ( = ?auto_342234 ?auto_342246 ) ) ( not ( = ?auto_342234 ?auto_342247 ) ) ( not ( = ?auto_342235 ?auto_342236 ) ) ( not ( = ?auto_342235 ?auto_342237 ) ) ( not ( = ?auto_342235 ?auto_342238 ) ) ( not ( = ?auto_342235 ?auto_342239 ) ) ( not ( = ?auto_342235 ?auto_342240 ) ) ( not ( = ?auto_342235 ?auto_342241 ) ) ( not ( = ?auto_342235 ?auto_342242 ) ) ( not ( = ?auto_342235 ?auto_342243 ) ) ( not ( = ?auto_342235 ?auto_342244 ) ) ( not ( = ?auto_342235 ?auto_342245 ) ) ( not ( = ?auto_342235 ?auto_342246 ) ) ( not ( = ?auto_342235 ?auto_342247 ) ) ( not ( = ?auto_342236 ?auto_342237 ) ) ( not ( = ?auto_342236 ?auto_342238 ) ) ( not ( = ?auto_342236 ?auto_342239 ) ) ( not ( = ?auto_342236 ?auto_342240 ) ) ( not ( = ?auto_342236 ?auto_342241 ) ) ( not ( = ?auto_342236 ?auto_342242 ) ) ( not ( = ?auto_342236 ?auto_342243 ) ) ( not ( = ?auto_342236 ?auto_342244 ) ) ( not ( = ?auto_342236 ?auto_342245 ) ) ( not ( = ?auto_342236 ?auto_342246 ) ) ( not ( = ?auto_342236 ?auto_342247 ) ) ( not ( = ?auto_342237 ?auto_342238 ) ) ( not ( = ?auto_342237 ?auto_342239 ) ) ( not ( = ?auto_342237 ?auto_342240 ) ) ( not ( = ?auto_342237 ?auto_342241 ) ) ( not ( = ?auto_342237 ?auto_342242 ) ) ( not ( = ?auto_342237 ?auto_342243 ) ) ( not ( = ?auto_342237 ?auto_342244 ) ) ( not ( = ?auto_342237 ?auto_342245 ) ) ( not ( = ?auto_342237 ?auto_342246 ) ) ( not ( = ?auto_342237 ?auto_342247 ) ) ( not ( = ?auto_342238 ?auto_342239 ) ) ( not ( = ?auto_342238 ?auto_342240 ) ) ( not ( = ?auto_342238 ?auto_342241 ) ) ( not ( = ?auto_342238 ?auto_342242 ) ) ( not ( = ?auto_342238 ?auto_342243 ) ) ( not ( = ?auto_342238 ?auto_342244 ) ) ( not ( = ?auto_342238 ?auto_342245 ) ) ( not ( = ?auto_342238 ?auto_342246 ) ) ( not ( = ?auto_342238 ?auto_342247 ) ) ( not ( = ?auto_342239 ?auto_342240 ) ) ( not ( = ?auto_342239 ?auto_342241 ) ) ( not ( = ?auto_342239 ?auto_342242 ) ) ( not ( = ?auto_342239 ?auto_342243 ) ) ( not ( = ?auto_342239 ?auto_342244 ) ) ( not ( = ?auto_342239 ?auto_342245 ) ) ( not ( = ?auto_342239 ?auto_342246 ) ) ( not ( = ?auto_342239 ?auto_342247 ) ) ( not ( = ?auto_342240 ?auto_342241 ) ) ( not ( = ?auto_342240 ?auto_342242 ) ) ( not ( = ?auto_342240 ?auto_342243 ) ) ( not ( = ?auto_342240 ?auto_342244 ) ) ( not ( = ?auto_342240 ?auto_342245 ) ) ( not ( = ?auto_342240 ?auto_342246 ) ) ( not ( = ?auto_342240 ?auto_342247 ) ) ( not ( = ?auto_342241 ?auto_342242 ) ) ( not ( = ?auto_342241 ?auto_342243 ) ) ( not ( = ?auto_342241 ?auto_342244 ) ) ( not ( = ?auto_342241 ?auto_342245 ) ) ( not ( = ?auto_342241 ?auto_342246 ) ) ( not ( = ?auto_342241 ?auto_342247 ) ) ( not ( = ?auto_342242 ?auto_342243 ) ) ( not ( = ?auto_342242 ?auto_342244 ) ) ( not ( = ?auto_342242 ?auto_342245 ) ) ( not ( = ?auto_342242 ?auto_342246 ) ) ( not ( = ?auto_342242 ?auto_342247 ) ) ( not ( = ?auto_342243 ?auto_342244 ) ) ( not ( = ?auto_342243 ?auto_342245 ) ) ( not ( = ?auto_342243 ?auto_342246 ) ) ( not ( = ?auto_342243 ?auto_342247 ) ) ( not ( = ?auto_342244 ?auto_342245 ) ) ( not ( = ?auto_342244 ?auto_342246 ) ) ( not ( = ?auto_342244 ?auto_342247 ) ) ( not ( = ?auto_342245 ?auto_342246 ) ) ( not ( = ?auto_342245 ?auto_342247 ) ) ( not ( = ?auto_342246 ?auto_342247 ) ) ( ON ?auto_342245 ?auto_342246 ) ( ON ?auto_342244 ?auto_342245 ) ( ON ?auto_342243 ?auto_342244 ) ( ON ?auto_342242 ?auto_342243 ) ( CLEAR ?auto_342240 ) ( ON ?auto_342241 ?auto_342242 ) ( CLEAR ?auto_342241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_342234 ?auto_342235 ?auto_342236 ?auto_342237 ?auto_342238 ?auto_342239 ?auto_342240 ?auto_342241 )
      ( MAKE-13PILE ?auto_342234 ?auto_342235 ?auto_342236 ?auto_342237 ?auto_342238 ?auto_342239 ?auto_342240 ?auto_342241 ?auto_342242 ?auto_342243 ?auto_342244 ?auto_342245 ?auto_342246 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342288 - BLOCK
      ?auto_342289 - BLOCK
      ?auto_342290 - BLOCK
      ?auto_342291 - BLOCK
      ?auto_342292 - BLOCK
      ?auto_342293 - BLOCK
      ?auto_342294 - BLOCK
      ?auto_342295 - BLOCK
      ?auto_342296 - BLOCK
      ?auto_342297 - BLOCK
      ?auto_342298 - BLOCK
      ?auto_342299 - BLOCK
      ?auto_342300 - BLOCK
    )
    :vars
    (
      ?auto_342301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342300 ?auto_342301 ) ( ON-TABLE ?auto_342288 ) ( ON ?auto_342289 ?auto_342288 ) ( ON ?auto_342290 ?auto_342289 ) ( ON ?auto_342291 ?auto_342290 ) ( ON ?auto_342292 ?auto_342291 ) ( ON ?auto_342293 ?auto_342292 ) ( not ( = ?auto_342288 ?auto_342289 ) ) ( not ( = ?auto_342288 ?auto_342290 ) ) ( not ( = ?auto_342288 ?auto_342291 ) ) ( not ( = ?auto_342288 ?auto_342292 ) ) ( not ( = ?auto_342288 ?auto_342293 ) ) ( not ( = ?auto_342288 ?auto_342294 ) ) ( not ( = ?auto_342288 ?auto_342295 ) ) ( not ( = ?auto_342288 ?auto_342296 ) ) ( not ( = ?auto_342288 ?auto_342297 ) ) ( not ( = ?auto_342288 ?auto_342298 ) ) ( not ( = ?auto_342288 ?auto_342299 ) ) ( not ( = ?auto_342288 ?auto_342300 ) ) ( not ( = ?auto_342288 ?auto_342301 ) ) ( not ( = ?auto_342289 ?auto_342290 ) ) ( not ( = ?auto_342289 ?auto_342291 ) ) ( not ( = ?auto_342289 ?auto_342292 ) ) ( not ( = ?auto_342289 ?auto_342293 ) ) ( not ( = ?auto_342289 ?auto_342294 ) ) ( not ( = ?auto_342289 ?auto_342295 ) ) ( not ( = ?auto_342289 ?auto_342296 ) ) ( not ( = ?auto_342289 ?auto_342297 ) ) ( not ( = ?auto_342289 ?auto_342298 ) ) ( not ( = ?auto_342289 ?auto_342299 ) ) ( not ( = ?auto_342289 ?auto_342300 ) ) ( not ( = ?auto_342289 ?auto_342301 ) ) ( not ( = ?auto_342290 ?auto_342291 ) ) ( not ( = ?auto_342290 ?auto_342292 ) ) ( not ( = ?auto_342290 ?auto_342293 ) ) ( not ( = ?auto_342290 ?auto_342294 ) ) ( not ( = ?auto_342290 ?auto_342295 ) ) ( not ( = ?auto_342290 ?auto_342296 ) ) ( not ( = ?auto_342290 ?auto_342297 ) ) ( not ( = ?auto_342290 ?auto_342298 ) ) ( not ( = ?auto_342290 ?auto_342299 ) ) ( not ( = ?auto_342290 ?auto_342300 ) ) ( not ( = ?auto_342290 ?auto_342301 ) ) ( not ( = ?auto_342291 ?auto_342292 ) ) ( not ( = ?auto_342291 ?auto_342293 ) ) ( not ( = ?auto_342291 ?auto_342294 ) ) ( not ( = ?auto_342291 ?auto_342295 ) ) ( not ( = ?auto_342291 ?auto_342296 ) ) ( not ( = ?auto_342291 ?auto_342297 ) ) ( not ( = ?auto_342291 ?auto_342298 ) ) ( not ( = ?auto_342291 ?auto_342299 ) ) ( not ( = ?auto_342291 ?auto_342300 ) ) ( not ( = ?auto_342291 ?auto_342301 ) ) ( not ( = ?auto_342292 ?auto_342293 ) ) ( not ( = ?auto_342292 ?auto_342294 ) ) ( not ( = ?auto_342292 ?auto_342295 ) ) ( not ( = ?auto_342292 ?auto_342296 ) ) ( not ( = ?auto_342292 ?auto_342297 ) ) ( not ( = ?auto_342292 ?auto_342298 ) ) ( not ( = ?auto_342292 ?auto_342299 ) ) ( not ( = ?auto_342292 ?auto_342300 ) ) ( not ( = ?auto_342292 ?auto_342301 ) ) ( not ( = ?auto_342293 ?auto_342294 ) ) ( not ( = ?auto_342293 ?auto_342295 ) ) ( not ( = ?auto_342293 ?auto_342296 ) ) ( not ( = ?auto_342293 ?auto_342297 ) ) ( not ( = ?auto_342293 ?auto_342298 ) ) ( not ( = ?auto_342293 ?auto_342299 ) ) ( not ( = ?auto_342293 ?auto_342300 ) ) ( not ( = ?auto_342293 ?auto_342301 ) ) ( not ( = ?auto_342294 ?auto_342295 ) ) ( not ( = ?auto_342294 ?auto_342296 ) ) ( not ( = ?auto_342294 ?auto_342297 ) ) ( not ( = ?auto_342294 ?auto_342298 ) ) ( not ( = ?auto_342294 ?auto_342299 ) ) ( not ( = ?auto_342294 ?auto_342300 ) ) ( not ( = ?auto_342294 ?auto_342301 ) ) ( not ( = ?auto_342295 ?auto_342296 ) ) ( not ( = ?auto_342295 ?auto_342297 ) ) ( not ( = ?auto_342295 ?auto_342298 ) ) ( not ( = ?auto_342295 ?auto_342299 ) ) ( not ( = ?auto_342295 ?auto_342300 ) ) ( not ( = ?auto_342295 ?auto_342301 ) ) ( not ( = ?auto_342296 ?auto_342297 ) ) ( not ( = ?auto_342296 ?auto_342298 ) ) ( not ( = ?auto_342296 ?auto_342299 ) ) ( not ( = ?auto_342296 ?auto_342300 ) ) ( not ( = ?auto_342296 ?auto_342301 ) ) ( not ( = ?auto_342297 ?auto_342298 ) ) ( not ( = ?auto_342297 ?auto_342299 ) ) ( not ( = ?auto_342297 ?auto_342300 ) ) ( not ( = ?auto_342297 ?auto_342301 ) ) ( not ( = ?auto_342298 ?auto_342299 ) ) ( not ( = ?auto_342298 ?auto_342300 ) ) ( not ( = ?auto_342298 ?auto_342301 ) ) ( not ( = ?auto_342299 ?auto_342300 ) ) ( not ( = ?auto_342299 ?auto_342301 ) ) ( not ( = ?auto_342300 ?auto_342301 ) ) ( ON ?auto_342299 ?auto_342300 ) ( ON ?auto_342298 ?auto_342299 ) ( ON ?auto_342297 ?auto_342298 ) ( ON ?auto_342296 ?auto_342297 ) ( ON ?auto_342295 ?auto_342296 ) ( CLEAR ?auto_342293 ) ( ON ?auto_342294 ?auto_342295 ) ( CLEAR ?auto_342294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_342288 ?auto_342289 ?auto_342290 ?auto_342291 ?auto_342292 ?auto_342293 ?auto_342294 )
      ( MAKE-13PILE ?auto_342288 ?auto_342289 ?auto_342290 ?auto_342291 ?auto_342292 ?auto_342293 ?auto_342294 ?auto_342295 ?auto_342296 ?auto_342297 ?auto_342298 ?auto_342299 ?auto_342300 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342342 - BLOCK
      ?auto_342343 - BLOCK
      ?auto_342344 - BLOCK
      ?auto_342345 - BLOCK
      ?auto_342346 - BLOCK
      ?auto_342347 - BLOCK
      ?auto_342348 - BLOCK
      ?auto_342349 - BLOCK
      ?auto_342350 - BLOCK
      ?auto_342351 - BLOCK
      ?auto_342352 - BLOCK
      ?auto_342353 - BLOCK
      ?auto_342354 - BLOCK
    )
    :vars
    (
      ?auto_342355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342354 ?auto_342355 ) ( ON-TABLE ?auto_342342 ) ( ON ?auto_342343 ?auto_342342 ) ( ON ?auto_342344 ?auto_342343 ) ( ON ?auto_342345 ?auto_342344 ) ( ON ?auto_342346 ?auto_342345 ) ( not ( = ?auto_342342 ?auto_342343 ) ) ( not ( = ?auto_342342 ?auto_342344 ) ) ( not ( = ?auto_342342 ?auto_342345 ) ) ( not ( = ?auto_342342 ?auto_342346 ) ) ( not ( = ?auto_342342 ?auto_342347 ) ) ( not ( = ?auto_342342 ?auto_342348 ) ) ( not ( = ?auto_342342 ?auto_342349 ) ) ( not ( = ?auto_342342 ?auto_342350 ) ) ( not ( = ?auto_342342 ?auto_342351 ) ) ( not ( = ?auto_342342 ?auto_342352 ) ) ( not ( = ?auto_342342 ?auto_342353 ) ) ( not ( = ?auto_342342 ?auto_342354 ) ) ( not ( = ?auto_342342 ?auto_342355 ) ) ( not ( = ?auto_342343 ?auto_342344 ) ) ( not ( = ?auto_342343 ?auto_342345 ) ) ( not ( = ?auto_342343 ?auto_342346 ) ) ( not ( = ?auto_342343 ?auto_342347 ) ) ( not ( = ?auto_342343 ?auto_342348 ) ) ( not ( = ?auto_342343 ?auto_342349 ) ) ( not ( = ?auto_342343 ?auto_342350 ) ) ( not ( = ?auto_342343 ?auto_342351 ) ) ( not ( = ?auto_342343 ?auto_342352 ) ) ( not ( = ?auto_342343 ?auto_342353 ) ) ( not ( = ?auto_342343 ?auto_342354 ) ) ( not ( = ?auto_342343 ?auto_342355 ) ) ( not ( = ?auto_342344 ?auto_342345 ) ) ( not ( = ?auto_342344 ?auto_342346 ) ) ( not ( = ?auto_342344 ?auto_342347 ) ) ( not ( = ?auto_342344 ?auto_342348 ) ) ( not ( = ?auto_342344 ?auto_342349 ) ) ( not ( = ?auto_342344 ?auto_342350 ) ) ( not ( = ?auto_342344 ?auto_342351 ) ) ( not ( = ?auto_342344 ?auto_342352 ) ) ( not ( = ?auto_342344 ?auto_342353 ) ) ( not ( = ?auto_342344 ?auto_342354 ) ) ( not ( = ?auto_342344 ?auto_342355 ) ) ( not ( = ?auto_342345 ?auto_342346 ) ) ( not ( = ?auto_342345 ?auto_342347 ) ) ( not ( = ?auto_342345 ?auto_342348 ) ) ( not ( = ?auto_342345 ?auto_342349 ) ) ( not ( = ?auto_342345 ?auto_342350 ) ) ( not ( = ?auto_342345 ?auto_342351 ) ) ( not ( = ?auto_342345 ?auto_342352 ) ) ( not ( = ?auto_342345 ?auto_342353 ) ) ( not ( = ?auto_342345 ?auto_342354 ) ) ( not ( = ?auto_342345 ?auto_342355 ) ) ( not ( = ?auto_342346 ?auto_342347 ) ) ( not ( = ?auto_342346 ?auto_342348 ) ) ( not ( = ?auto_342346 ?auto_342349 ) ) ( not ( = ?auto_342346 ?auto_342350 ) ) ( not ( = ?auto_342346 ?auto_342351 ) ) ( not ( = ?auto_342346 ?auto_342352 ) ) ( not ( = ?auto_342346 ?auto_342353 ) ) ( not ( = ?auto_342346 ?auto_342354 ) ) ( not ( = ?auto_342346 ?auto_342355 ) ) ( not ( = ?auto_342347 ?auto_342348 ) ) ( not ( = ?auto_342347 ?auto_342349 ) ) ( not ( = ?auto_342347 ?auto_342350 ) ) ( not ( = ?auto_342347 ?auto_342351 ) ) ( not ( = ?auto_342347 ?auto_342352 ) ) ( not ( = ?auto_342347 ?auto_342353 ) ) ( not ( = ?auto_342347 ?auto_342354 ) ) ( not ( = ?auto_342347 ?auto_342355 ) ) ( not ( = ?auto_342348 ?auto_342349 ) ) ( not ( = ?auto_342348 ?auto_342350 ) ) ( not ( = ?auto_342348 ?auto_342351 ) ) ( not ( = ?auto_342348 ?auto_342352 ) ) ( not ( = ?auto_342348 ?auto_342353 ) ) ( not ( = ?auto_342348 ?auto_342354 ) ) ( not ( = ?auto_342348 ?auto_342355 ) ) ( not ( = ?auto_342349 ?auto_342350 ) ) ( not ( = ?auto_342349 ?auto_342351 ) ) ( not ( = ?auto_342349 ?auto_342352 ) ) ( not ( = ?auto_342349 ?auto_342353 ) ) ( not ( = ?auto_342349 ?auto_342354 ) ) ( not ( = ?auto_342349 ?auto_342355 ) ) ( not ( = ?auto_342350 ?auto_342351 ) ) ( not ( = ?auto_342350 ?auto_342352 ) ) ( not ( = ?auto_342350 ?auto_342353 ) ) ( not ( = ?auto_342350 ?auto_342354 ) ) ( not ( = ?auto_342350 ?auto_342355 ) ) ( not ( = ?auto_342351 ?auto_342352 ) ) ( not ( = ?auto_342351 ?auto_342353 ) ) ( not ( = ?auto_342351 ?auto_342354 ) ) ( not ( = ?auto_342351 ?auto_342355 ) ) ( not ( = ?auto_342352 ?auto_342353 ) ) ( not ( = ?auto_342352 ?auto_342354 ) ) ( not ( = ?auto_342352 ?auto_342355 ) ) ( not ( = ?auto_342353 ?auto_342354 ) ) ( not ( = ?auto_342353 ?auto_342355 ) ) ( not ( = ?auto_342354 ?auto_342355 ) ) ( ON ?auto_342353 ?auto_342354 ) ( ON ?auto_342352 ?auto_342353 ) ( ON ?auto_342351 ?auto_342352 ) ( ON ?auto_342350 ?auto_342351 ) ( ON ?auto_342349 ?auto_342350 ) ( ON ?auto_342348 ?auto_342349 ) ( CLEAR ?auto_342346 ) ( ON ?auto_342347 ?auto_342348 ) ( CLEAR ?auto_342347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_342342 ?auto_342343 ?auto_342344 ?auto_342345 ?auto_342346 ?auto_342347 )
      ( MAKE-13PILE ?auto_342342 ?auto_342343 ?auto_342344 ?auto_342345 ?auto_342346 ?auto_342347 ?auto_342348 ?auto_342349 ?auto_342350 ?auto_342351 ?auto_342352 ?auto_342353 ?auto_342354 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342396 - BLOCK
      ?auto_342397 - BLOCK
      ?auto_342398 - BLOCK
      ?auto_342399 - BLOCK
      ?auto_342400 - BLOCK
      ?auto_342401 - BLOCK
      ?auto_342402 - BLOCK
      ?auto_342403 - BLOCK
      ?auto_342404 - BLOCK
      ?auto_342405 - BLOCK
      ?auto_342406 - BLOCK
      ?auto_342407 - BLOCK
      ?auto_342408 - BLOCK
    )
    :vars
    (
      ?auto_342409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342408 ?auto_342409 ) ( ON-TABLE ?auto_342396 ) ( ON ?auto_342397 ?auto_342396 ) ( ON ?auto_342398 ?auto_342397 ) ( ON ?auto_342399 ?auto_342398 ) ( not ( = ?auto_342396 ?auto_342397 ) ) ( not ( = ?auto_342396 ?auto_342398 ) ) ( not ( = ?auto_342396 ?auto_342399 ) ) ( not ( = ?auto_342396 ?auto_342400 ) ) ( not ( = ?auto_342396 ?auto_342401 ) ) ( not ( = ?auto_342396 ?auto_342402 ) ) ( not ( = ?auto_342396 ?auto_342403 ) ) ( not ( = ?auto_342396 ?auto_342404 ) ) ( not ( = ?auto_342396 ?auto_342405 ) ) ( not ( = ?auto_342396 ?auto_342406 ) ) ( not ( = ?auto_342396 ?auto_342407 ) ) ( not ( = ?auto_342396 ?auto_342408 ) ) ( not ( = ?auto_342396 ?auto_342409 ) ) ( not ( = ?auto_342397 ?auto_342398 ) ) ( not ( = ?auto_342397 ?auto_342399 ) ) ( not ( = ?auto_342397 ?auto_342400 ) ) ( not ( = ?auto_342397 ?auto_342401 ) ) ( not ( = ?auto_342397 ?auto_342402 ) ) ( not ( = ?auto_342397 ?auto_342403 ) ) ( not ( = ?auto_342397 ?auto_342404 ) ) ( not ( = ?auto_342397 ?auto_342405 ) ) ( not ( = ?auto_342397 ?auto_342406 ) ) ( not ( = ?auto_342397 ?auto_342407 ) ) ( not ( = ?auto_342397 ?auto_342408 ) ) ( not ( = ?auto_342397 ?auto_342409 ) ) ( not ( = ?auto_342398 ?auto_342399 ) ) ( not ( = ?auto_342398 ?auto_342400 ) ) ( not ( = ?auto_342398 ?auto_342401 ) ) ( not ( = ?auto_342398 ?auto_342402 ) ) ( not ( = ?auto_342398 ?auto_342403 ) ) ( not ( = ?auto_342398 ?auto_342404 ) ) ( not ( = ?auto_342398 ?auto_342405 ) ) ( not ( = ?auto_342398 ?auto_342406 ) ) ( not ( = ?auto_342398 ?auto_342407 ) ) ( not ( = ?auto_342398 ?auto_342408 ) ) ( not ( = ?auto_342398 ?auto_342409 ) ) ( not ( = ?auto_342399 ?auto_342400 ) ) ( not ( = ?auto_342399 ?auto_342401 ) ) ( not ( = ?auto_342399 ?auto_342402 ) ) ( not ( = ?auto_342399 ?auto_342403 ) ) ( not ( = ?auto_342399 ?auto_342404 ) ) ( not ( = ?auto_342399 ?auto_342405 ) ) ( not ( = ?auto_342399 ?auto_342406 ) ) ( not ( = ?auto_342399 ?auto_342407 ) ) ( not ( = ?auto_342399 ?auto_342408 ) ) ( not ( = ?auto_342399 ?auto_342409 ) ) ( not ( = ?auto_342400 ?auto_342401 ) ) ( not ( = ?auto_342400 ?auto_342402 ) ) ( not ( = ?auto_342400 ?auto_342403 ) ) ( not ( = ?auto_342400 ?auto_342404 ) ) ( not ( = ?auto_342400 ?auto_342405 ) ) ( not ( = ?auto_342400 ?auto_342406 ) ) ( not ( = ?auto_342400 ?auto_342407 ) ) ( not ( = ?auto_342400 ?auto_342408 ) ) ( not ( = ?auto_342400 ?auto_342409 ) ) ( not ( = ?auto_342401 ?auto_342402 ) ) ( not ( = ?auto_342401 ?auto_342403 ) ) ( not ( = ?auto_342401 ?auto_342404 ) ) ( not ( = ?auto_342401 ?auto_342405 ) ) ( not ( = ?auto_342401 ?auto_342406 ) ) ( not ( = ?auto_342401 ?auto_342407 ) ) ( not ( = ?auto_342401 ?auto_342408 ) ) ( not ( = ?auto_342401 ?auto_342409 ) ) ( not ( = ?auto_342402 ?auto_342403 ) ) ( not ( = ?auto_342402 ?auto_342404 ) ) ( not ( = ?auto_342402 ?auto_342405 ) ) ( not ( = ?auto_342402 ?auto_342406 ) ) ( not ( = ?auto_342402 ?auto_342407 ) ) ( not ( = ?auto_342402 ?auto_342408 ) ) ( not ( = ?auto_342402 ?auto_342409 ) ) ( not ( = ?auto_342403 ?auto_342404 ) ) ( not ( = ?auto_342403 ?auto_342405 ) ) ( not ( = ?auto_342403 ?auto_342406 ) ) ( not ( = ?auto_342403 ?auto_342407 ) ) ( not ( = ?auto_342403 ?auto_342408 ) ) ( not ( = ?auto_342403 ?auto_342409 ) ) ( not ( = ?auto_342404 ?auto_342405 ) ) ( not ( = ?auto_342404 ?auto_342406 ) ) ( not ( = ?auto_342404 ?auto_342407 ) ) ( not ( = ?auto_342404 ?auto_342408 ) ) ( not ( = ?auto_342404 ?auto_342409 ) ) ( not ( = ?auto_342405 ?auto_342406 ) ) ( not ( = ?auto_342405 ?auto_342407 ) ) ( not ( = ?auto_342405 ?auto_342408 ) ) ( not ( = ?auto_342405 ?auto_342409 ) ) ( not ( = ?auto_342406 ?auto_342407 ) ) ( not ( = ?auto_342406 ?auto_342408 ) ) ( not ( = ?auto_342406 ?auto_342409 ) ) ( not ( = ?auto_342407 ?auto_342408 ) ) ( not ( = ?auto_342407 ?auto_342409 ) ) ( not ( = ?auto_342408 ?auto_342409 ) ) ( ON ?auto_342407 ?auto_342408 ) ( ON ?auto_342406 ?auto_342407 ) ( ON ?auto_342405 ?auto_342406 ) ( ON ?auto_342404 ?auto_342405 ) ( ON ?auto_342403 ?auto_342404 ) ( ON ?auto_342402 ?auto_342403 ) ( ON ?auto_342401 ?auto_342402 ) ( CLEAR ?auto_342399 ) ( ON ?auto_342400 ?auto_342401 ) ( CLEAR ?auto_342400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_342396 ?auto_342397 ?auto_342398 ?auto_342399 ?auto_342400 )
      ( MAKE-13PILE ?auto_342396 ?auto_342397 ?auto_342398 ?auto_342399 ?auto_342400 ?auto_342401 ?auto_342402 ?auto_342403 ?auto_342404 ?auto_342405 ?auto_342406 ?auto_342407 ?auto_342408 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342450 - BLOCK
      ?auto_342451 - BLOCK
      ?auto_342452 - BLOCK
      ?auto_342453 - BLOCK
      ?auto_342454 - BLOCK
      ?auto_342455 - BLOCK
      ?auto_342456 - BLOCK
      ?auto_342457 - BLOCK
      ?auto_342458 - BLOCK
      ?auto_342459 - BLOCK
      ?auto_342460 - BLOCK
      ?auto_342461 - BLOCK
      ?auto_342462 - BLOCK
    )
    :vars
    (
      ?auto_342463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342462 ?auto_342463 ) ( ON-TABLE ?auto_342450 ) ( ON ?auto_342451 ?auto_342450 ) ( ON ?auto_342452 ?auto_342451 ) ( not ( = ?auto_342450 ?auto_342451 ) ) ( not ( = ?auto_342450 ?auto_342452 ) ) ( not ( = ?auto_342450 ?auto_342453 ) ) ( not ( = ?auto_342450 ?auto_342454 ) ) ( not ( = ?auto_342450 ?auto_342455 ) ) ( not ( = ?auto_342450 ?auto_342456 ) ) ( not ( = ?auto_342450 ?auto_342457 ) ) ( not ( = ?auto_342450 ?auto_342458 ) ) ( not ( = ?auto_342450 ?auto_342459 ) ) ( not ( = ?auto_342450 ?auto_342460 ) ) ( not ( = ?auto_342450 ?auto_342461 ) ) ( not ( = ?auto_342450 ?auto_342462 ) ) ( not ( = ?auto_342450 ?auto_342463 ) ) ( not ( = ?auto_342451 ?auto_342452 ) ) ( not ( = ?auto_342451 ?auto_342453 ) ) ( not ( = ?auto_342451 ?auto_342454 ) ) ( not ( = ?auto_342451 ?auto_342455 ) ) ( not ( = ?auto_342451 ?auto_342456 ) ) ( not ( = ?auto_342451 ?auto_342457 ) ) ( not ( = ?auto_342451 ?auto_342458 ) ) ( not ( = ?auto_342451 ?auto_342459 ) ) ( not ( = ?auto_342451 ?auto_342460 ) ) ( not ( = ?auto_342451 ?auto_342461 ) ) ( not ( = ?auto_342451 ?auto_342462 ) ) ( not ( = ?auto_342451 ?auto_342463 ) ) ( not ( = ?auto_342452 ?auto_342453 ) ) ( not ( = ?auto_342452 ?auto_342454 ) ) ( not ( = ?auto_342452 ?auto_342455 ) ) ( not ( = ?auto_342452 ?auto_342456 ) ) ( not ( = ?auto_342452 ?auto_342457 ) ) ( not ( = ?auto_342452 ?auto_342458 ) ) ( not ( = ?auto_342452 ?auto_342459 ) ) ( not ( = ?auto_342452 ?auto_342460 ) ) ( not ( = ?auto_342452 ?auto_342461 ) ) ( not ( = ?auto_342452 ?auto_342462 ) ) ( not ( = ?auto_342452 ?auto_342463 ) ) ( not ( = ?auto_342453 ?auto_342454 ) ) ( not ( = ?auto_342453 ?auto_342455 ) ) ( not ( = ?auto_342453 ?auto_342456 ) ) ( not ( = ?auto_342453 ?auto_342457 ) ) ( not ( = ?auto_342453 ?auto_342458 ) ) ( not ( = ?auto_342453 ?auto_342459 ) ) ( not ( = ?auto_342453 ?auto_342460 ) ) ( not ( = ?auto_342453 ?auto_342461 ) ) ( not ( = ?auto_342453 ?auto_342462 ) ) ( not ( = ?auto_342453 ?auto_342463 ) ) ( not ( = ?auto_342454 ?auto_342455 ) ) ( not ( = ?auto_342454 ?auto_342456 ) ) ( not ( = ?auto_342454 ?auto_342457 ) ) ( not ( = ?auto_342454 ?auto_342458 ) ) ( not ( = ?auto_342454 ?auto_342459 ) ) ( not ( = ?auto_342454 ?auto_342460 ) ) ( not ( = ?auto_342454 ?auto_342461 ) ) ( not ( = ?auto_342454 ?auto_342462 ) ) ( not ( = ?auto_342454 ?auto_342463 ) ) ( not ( = ?auto_342455 ?auto_342456 ) ) ( not ( = ?auto_342455 ?auto_342457 ) ) ( not ( = ?auto_342455 ?auto_342458 ) ) ( not ( = ?auto_342455 ?auto_342459 ) ) ( not ( = ?auto_342455 ?auto_342460 ) ) ( not ( = ?auto_342455 ?auto_342461 ) ) ( not ( = ?auto_342455 ?auto_342462 ) ) ( not ( = ?auto_342455 ?auto_342463 ) ) ( not ( = ?auto_342456 ?auto_342457 ) ) ( not ( = ?auto_342456 ?auto_342458 ) ) ( not ( = ?auto_342456 ?auto_342459 ) ) ( not ( = ?auto_342456 ?auto_342460 ) ) ( not ( = ?auto_342456 ?auto_342461 ) ) ( not ( = ?auto_342456 ?auto_342462 ) ) ( not ( = ?auto_342456 ?auto_342463 ) ) ( not ( = ?auto_342457 ?auto_342458 ) ) ( not ( = ?auto_342457 ?auto_342459 ) ) ( not ( = ?auto_342457 ?auto_342460 ) ) ( not ( = ?auto_342457 ?auto_342461 ) ) ( not ( = ?auto_342457 ?auto_342462 ) ) ( not ( = ?auto_342457 ?auto_342463 ) ) ( not ( = ?auto_342458 ?auto_342459 ) ) ( not ( = ?auto_342458 ?auto_342460 ) ) ( not ( = ?auto_342458 ?auto_342461 ) ) ( not ( = ?auto_342458 ?auto_342462 ) ) ( not ( = ?auto_342458 ?auto_342463 ) ) ( not ( = ?auto_342459 ?auto_342460 ) ) ( not ( = ?auto_342459 ?auto_342461 ) ) ( not ( = ?auto_342459 ?auto_342462 ) ) ( not ( = ?auto_342459 ?auto_342463 ) ) ( not ( = ?auto_342460 ?auto_342461 ) ) ( not ( = ?auto_342460 ?auto_342462 ) ) ( not ( = ?auto_342460 ?auto_342463 ) ) ( not ( = ?auto_342461 ?auto_342462 ) ) ( not ( = ?auto_342461 ?auto_342463 ) ) ( not ( = ?auto_342462 ?auto_342463 ) ) ( ON ?auto_342461 ?auto_342462 ) ( ON ?auto_342460 ?auto_342461 ) ( ON ?auto_342459 ?auto_342460 ) ( ON ?auto_342458 ?auto_342459 ) ( ON ?auto_342457 ?auto_342458 ) ( ON ?auto_342456 ?auto_342457 ) ( ON ?auto_342455 ?auto_342456 ) ( ON ?auto_342454 ?auto_342455 ) ( CLEAR ?auto_342452 ) ( ON ?auto_342453 ?auto_342454 ) ( CLEAR ?auto_342453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_342450 ?auto_342451 ?auto_342452 ?auto_342453 )
      ( MAKE-13PILE ?auto_342450 ?auto_342451 ?auto_342452 ?auto_342453 ?auto_342454 ?auto_342455 ?auto_342456 ?auto_342457 ?auto_342458 ?auto_342459 ?auto_342460 ?auto_342461 ?auto_342462 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342504 - BLOCK
      ?auto_342505 - BLOCK
      ?auto_342506 - BLOCK
      ?auto_342507 - BLOCK
      ?auto_342508 - BLOCK
      ?auto_342509 - BLOCK
      ?auto_342510 - BLOCK
      ?auto_342511 - BLOCK
      ?auto_342512 - BLOCK
      ?auto_342513 - BLOCK
      ?auto_342514 - BLOCK
      ?auto_342515 - BLOCK
      ?auto_342516 - BLOCK
    )
    :vars
    (
      ?auto_342517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342516 ?auto_342517 ) ( ON-TABLE ?auto_342504 ) ( ON ?auto_342505 ?auto_342504 ) ( not ( = ?auto_342504 ?auto_342505 ) ) ( not ( = ?auto_342504 ?auto_342506 ) ) ( not ( = ?auto_342504 ?auto_342507 ) ) ( not ( = ?auto_342504 ?auto_342508 ) ) ( not ( = ?auto_342504 ?auto_342509 ) ) ( not ( = ?auto_342504 ?auto_342510 ) ) ( not ( = ?auto_342504 ?auto_342511 ) ) ( not ( = ?auto_342504 ?auto_342512 ) ) ( not ( = ?auto_342504 ?auto_342513 ) ) ( not ( = ?auto_342504 ?auto_342514 ) ) ( not ( = ?auto_342504 ?auto_342515 ) ) ( not ( = ?auto_342504 ?auto_342516 ) ) ( not ( = ?auto_342504 ?auto_342517 ) ) ( not ( = ?auto_342505 ?auto_342506 ) ) ( not ( = ?auto_342505 ?auto_342507 ) ) ( not ( = ?auto_342505 ?auto_342508 ) ) ( not ( = ?auto_342505 ?auto_342509 ) ) ( not ( = ?auto_342505 ?auto_342510 ) ) ( not ( = ?auto_342505 ?auto_342511 ) ) ( not ( = ?auto_342505 ?auto_342512 ) ) ( not ( = ?auto_342505 ?auto_342513 ) ) ( not ( = ?auto_342505 ?auto_342514 ) ) ( not ( = ?auto_342505 ?auto_342515 ) ) ( not ( = ?auto_342505 ?auto_342516 ) ) ( not ( = ?auto_342505 ?auto_342517 ) ) ( not ( = ?auto_342506 ?auto_342507 ) ) ( not ( = ?auto_342506 ?auto_342508 ) ) ( not ( = ?auto_342506 ?auto_342509 ) ) ( not ( = ?auto_342506 ?auto_342510 ) ) ( not ( = ?auto_342506 ?auto_342511 ) ) ( not ( = ?auto_342506 ?auto_342512 ) ) ( not ( = ?auto_342506 ?auto_342513 ) ) ( not ( = ?auto_342506 ?auto_342514 ) ) ( not ( = ?auto_342506 ?auto_342515 ) ) ( not ( = ?auto_342506 ?auto_342516 ) ) ( not ( = ?auto_342506 ?auto_342517 ) ) ( not ( = ?auto_342507 ?auto_342508 ) ) ( not ( = ?auto_342507 ?auto_342509 ) ) ( not ( = ?auto_342507 ?auto_342510 ) ) ( not ( = ?auto_342507 ?auto_342511 ) ) ( not ( = ?auto_342507 ?auto_342512 ) ) ( not ( = ?auto_342507 ?auto_342513 ) ) ( not ( = ?auto_342507 ?auto_342514 ) ) ( not ( = ?auto_342507 ?auto_342515 ) ) ( not ( = ?auto_342507 ?auto_342516 ) ) ( not ( = ?auto_342507 ?auto_342517 ) ) ( not ( = ?auto_342508 ?auto_342509 ) ) ( not ( = ?auto_342508 ?auto_342510 ) ) ( not ( = ?auto_342508 ?auto_342511 ) ) ( not ( = ?auto_342508 ?auto_342512 ) ) ( not ( = ?auto_342508 ?auto_342513 ) ) ( not ( = ?auto_342508 ?auto_342514 ) ) ( not ( = ?auto_342508 ?auto_342515 ) ) ( not ( = ?auto_342508 ?auto_342516 ) ) ( not ( = ?auto_342508 ?auto_342517 ) ) ( not ( = ?auto_342509 ?auto_342510 ) ) ( not ( = ?auto_342509 ?auto_342511 ) ) ( not ( = ?auto_342509 ?auto_342512 ) ) ( not ( = ?auto_342509 ?auto_342513 ) ) ( not ( = ?auto_342509 ?auto_342514 ) ) ( not ( = ?auto_342509 ?auto_342515 ) ) ( not ( = ?auto_342509 ?auto_342516 ) ) ( not ( = ?auto_342509 ?auto_342517 ) ) ( not ( = ?auto_342510 ?auto_342511 ) ) ( not ( = ?auto_342510 ?auto_342512 ) ) ( not ( = ?auto_342510 ?auto_342513 ) ) ( not ( = ?auto_342510 ?auto_342514 ) ) ( not ( = ?auto_342510 ?auto_342515 ) ) ( not ( = ?auto_342510 ?auto_342516 ) ) ( not ( = ?auto_342510 ?auto_342517 ) ) ( not ( = ?auto_342511 ?auto_342512 ) ) ( not ( = ?auto_342511 ?auto_342513 ) ) ( not ( = ?auto_342511 ?auto_342514 ) ) ( not ( = ?auto_342511 ?auto_342515 ) ) ( not ( = ?auto_342511 ?auto_342516 ) ) ( not ( = ?auto_342511 ?auto_342517 ) ) ( not ( = ?auto_342512 ?auto_342513 ) ) ( not ( = ?auto_342512 ?auto_342514 ) ) ( not ( = ?auto_342512 ?auto_342515 ) ) ( not ( = ?auto_342512 ?auto_342516 ) ) ( not ( = ?auto_342512 ?auto_342517 ) ) ( not ( = ?auto_342513 ?auto_342514 ) ) ( not ( = ?auto_342513 ?auto_342515 ) ) ( not ( = ?auto_342513 ?auto_342516 ) ) ( not ( = ?auto_342513 ?auto_342517 ) ) ( not ( = ?auto_342514 ?auto_342515 ) ) ( not ( = ?auto_342514 ?auto_342516 ) ) ( not ( = ?auto_342514 ?auto_342517 ) ) ( not ( = ?auto_342515 ?auto_342516 ) ) ( not ( = ?auto_342515 ?auto_342517 ) ) ( not ( = ?auto_342516 ?auto_342517 ) ) ( ON ?auto_342515 ?auto_342516 ) ( ON ?auto_342514 ?auto_342515 ) ( ON ?auto_342513 ?auto_342514 ) ( ON ?auto_342512 ?auto_342513 ) ( ON ?auto_342511 ?auto_342512 ) ( ON ?auto_342510 ?auto_342511 ) ( ON ?auto_342509 ?auto_342510 ) ( ON ?auto_342508 ?auto_342509 ) ( ON ?auto_342507 ?auto_342508 ) ( CLEAR ?auto_342505 ) ( ON ?auto_342506 ?auto_342507 ) ( CLEAR ?auto_342506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_342504 ?auto_342505 ?auto_342506 )
      ( MAKE-13PILE ?auto_342504 ?auto_342505 ?auto_342506 ?auto_342507 ?auto_342508 ?auto_342509 ?auto_342510 ?auto_342511 ?auto_342512 ?auto_342513 ?auto_342514 ?auto_342515 ?auto_342516 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342558 - BLOCK
      ?auto_342559 - BLOCK
      ?auto_342560 - BLOCK
      ?auto_342561 - BLOCK
      ?auto_342562 - BLOCK
      ?auto_342563 - BLOCK
      ?auto_342564 - BLOCK
      ?auto_342565 - BLOCK
      ?auto_342566 - BLOCK
      ?auto_342567 - BLOCK
      ?auto_342568 - BLOCK
      ?auto_342569 - BLOCK
      ?auto_342570 - BLOCK
    )
    :vars
    (
      ?auto_342571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342570 ?auto_342571 ) ( ON-TABLE ?auto_342558 ) ( not ( = ?auto_342558 ?auto_342559 ) ) ( not ( = ?auto_342558 ?auto_342560 ) ) ( not ( = ?auto_342558 ?auto_342561 ) ) ( not ( = ?auto_342558 ?auto_342562 ) ) ( not ( = ?auto_342558 ?auto_342563 ) ) ( not ( = ?auto_342558 ?auto_342564 ) ) ( not ( = ?auto_342558 ?auto_342565 ) ) ( not ( = ?auto_342558 ?auto_342566 ) ) ( not ( = ?auto_342558 ?auto_342567 ) ) ( not ( = ?auto_342558 ?auto_342568 ) ) ( not ( = ?auto_342558 ?auto_342569 ) ) ( not ( = ?auto_342558 ?auto_342570 ) ) ( not ( = ?auto_342558 ?auto_342571 ) ) ( not ( = ?auto_342559 ?auto_342560 ) ) ( not ( = ?auto_342559 ?auto_342561 ) ) ( not ( = ?auto_342559 ?auto_342562 ) ) ( not ( = ?auto_342559 ?auto_342563 ) ) ( not ( = ?auto_342559 ?auto_342564 ) ) ( not ( = ?auto_342559 ?auto_342565 ) ) ( not ( = ?auto_342559 ?auto_342566 ) ) ( not ( = ?auto_342559 ?auto_342567 ) ) ( not ( = ?auto_342559 ?auto_342568 ) ) ( not ( = ?auto_342559 ?auto_342569 ) ) ( not ( = ?auto_342559 ?auto_342570 ) ) ( not ( = ?auto_342559 ?auto_342571 ) ) ( not ( = ?auto_342560 ?auto_342561 ) ) ( not ( = ?auto_342560 ?auto_342562 ) ) ( not ( = ?auto_342560 ?auto_342563 ) ) ( not ( = ?auto_342560 ?auto_342564 ) ) ( not ( = ?auto_342560 ?auto_342565 ) ) ( not ( = ?auto_342560 ?auto_342566 ) ) ( not ( = ?auto_342560 ?auto_342567 ) ) ( not ( = ?auto_342560 ?auto_342568 ) ) ( not ( = ?auto_342560 ?auto_342569 ) ) ( not ( = ?auto_342560 ?auto_342570 ) ) ( not ( = ?auto_342560 ?auto_342571 ) ) ( not ( = ?auto_342561 ?auto_342562 ) ) ( not ( = ?auto_342561 ?auto_342563 ) ) ( not ( = ?auto_342561 ?auto_342564 ) ) ( not ( = ?auto_342561 ?auto_342565 ) ) ( not ( = ?auto_342561 ?auto_342566 ) ) ( not ( = ?auto_342561 ?auto_342567 ) ) ( not ( = ?auto_342561 ?auto_342568 ) ) ( not ( = ?auto_342561 ?auto_342569 ) ) ( not ( = ?auto_342561 ?auto_342570 ) ) ( not ( = ?auto_342561 ?auto_342571 ) ) ( not ( = ?auto_342562 ?auto_342563 ) ) ( not ( = ?auto_342562 ?auto_342564 ) ) ( not ( = ?auto_342562 ?auto_342565 ) ) ( not ( = ?auto_342562 ?auto_342566 ) ) ( not ( = ?auto_342562 ?auto_342567 ) ) ( not ( = ?auto_342562 ?auto_342568 ) ) ( not ( = ?auto_342562 ?auto_342569 ) ) ( not ( = ?auto_342562 ?auto_342570 ) ) ( not ( = ?auto_342562 ?auto_342571 ) ) ( not ( = ?auto_342563 ?auto_342564 ) ) ( not ( = ?auto_342563 ?auto_342565 ) ) ( not ( = ?auto_342563 ?auto_342566 ) ) ( not ( = ?auto_342563 ?auto_342567 ) ) ( not ( = ?auto_342563 ?auto_342568 ) ) ( not ( = ?auto_342563 ?auto_342569 ) ) ( not ( = ?auto_342563 ?auto_342570 ) ) ( not ( = ?auto_342563 ?auto_342571 ) ) ( not ( = ?auto_342564 ?auto_342565 ) ) ( not ( = ?auto_342564 ?auto_342566 ) ) ( not ( = ?auto_342564 ?auto_342567 ) ) ( not ( = ?auto_342564 ?auto_342568 ) ) ( not ( = ?auto_342564 ?auto_342569 ) ) ( not ( = ?auto_342564 ?auto_342570 ) ) ( not ( = ?auto_342564 ?auto_342571 ) ) ( not ( = ?auto_342565 ?auto_342566 ) ) ( not ( = ?auto_342565 ?auto_342567 ) ) ( not ( = ?auto_342565 ?auto_342568 ) ) ( not ( = ?auto_342565 ?auto_342569 ) ) ( not ( = ?auto_342565 ?auto_342570 ) ) ( not ( = ?auto_342565 ?auto_342571 ) ) ( not ( = ?auto_342566 ?auto_342567 ) ) ( not ( = ?auto_342566 ?auto_342568 ) ) ( not ( = ?auto_342566 ?auto_342569 ) ) ( not ( = ?auto_342566 ?auto_342570 ) ) ( not ( = ?auto_342566 ?auto_342571 ) ) ( not ( = ?auto_342567 ?auto_342568 ) ) ( not ( = ?auto_342567 ?auto_342569 ) ) ( not ( = ?auto_342567 ?auto_342570 ) ) ( not ( = ?auto_342567 ?auto_342571 ) ) ( not ( = ?auto_342568 ?auto_342569 ) ) ( not ( = ?auto_342568 ?auto_342570 ) ) ( not ( = ?auto_342568 ?auto_342571 ) ) ( not ( = ?auto_342569 ?auto_342570 ) ) ( not ( = ?auto_342569 ?auto_342571 ) ) ( not ( = ?auto_342570 ?auto_342571 ) ) ( ON ?auto_342569 ?auto_342570 ) ( ON ?auto_342568 ?auto_342569 ) ( ON ?auto_342567 ?auto_342568 ) ( ON ?auto_342566 ?auto_342567 ) ( ON ?auto_342565 ?auto_342566 ) ( ON ?auto_342564 ?auto_342565 ) ( ON ?auto_342563 ?auto_342564 ) ( ON ?auto_342562 ?auto_342563 ) ( ON ?auto_342561 ?auto_342562 ) ( ON ?auto_342560 ?auto_342561 ) ( CLEAR ?auto_342558 ) ( ON ?auto_342559 ?auto_342560 ) ( CLEAR ?auto_342559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_342558 ?auto_342559 )
      ( MAKE-13PILE ?auto_342558 ?auto_342559 ?auto_342560 ?auto_342561 ?auto_342562 ?auto_342563 ?auto_342564 ?auto_342565 ?auto_342566 ?auto_342567 ?auto_342568 ?auto_342569 ?auto_342570 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_342612 - BLOCK
      ?auto_342613 - BLOCK
      ?auto_342614 - BLOCK
      ?auto_342615 - BLOCK
      ?auto_342616 - BLOCK
      ?auto_342617 - BLOCK
      ?auto_342618 - BLOCK
      ?auto_342619 - BLOCK
      ?auto_342620 - BLOCK
      ?auto_342621 - BLOCK
      ?auto_342622 - BLOCK
      ?auto_342623 - BLOCK
      ?auto_342624 - BLOCK
    )
    :vars
    (
      ?auto_342625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342624 ?auto_342625 ) ( not ( = ?auto_342612 ?auto_342613 ) ) ( not ( = ?auto_342612 ?auto_342614 ) ) ( not ( = ?auto_342612 ?auto_342615 ) ) ( not ( = ?auto_342612 ?auto_342616 ) ) ( not ( = ?auto_342612 ?auto_342617 ) ) ( not ( = ?auto_342612 ?auto_342618 ) ) ( not ( = ?auto_342612 ?auto_342619 ) ) ( not ( = ?auto_342612 ?auto_342620 ) ) ( not ( = ?auto_342612 ?auto_342621 ) ) ( not ( = ?auto_342612 ?auto_342622 ) ) ( not ( = ?auto_342612 ?auto_342623 ) ) ( not ( = ?auto_342612 ?auto_342624 ) ) ( not ( = ?auto_342612 ?auto_342625 ) ) ( not ( = ?auto_342613 ?auto_342614 ) ) ( not ( = ?auto_342613 ?auto_342615 ) ) ( not ( = ?auto_342613 ?auto_342616 ) ) ( not ( = ?auto_342613 ?auto_342617 ) ) ( not ( = ?auto_342613 ?auto_342618 ) ) ( not ( = ?auto_342613 ?auto_342619 ) ) ( not ( = ?auto_342613 ?auto_342620 ) ) ( not ( = ?auto_342613 ?auto_342621 ) ) ( not ( = ?auto_342613 ?auto_342622 ) ) ( not ( = ?auto_342613 ?auto_342623 ) ) ( not ( = ?auto_342613 ?auto_342624 ) ) ( not ( = ?auto_342613 ?auto_342625 ) ) ( not ( = ?auto_342614 ?auto_342615 ) ) ( not ( = ?auto_342614 ?auto_342616 ) ) ( not ( = ?auto_342614 ?auto_342617 ) ) ( not ( = ?auto_342614 ?auto_342618 ) ) ( not ( = ?auto_342614 ?auto_342619 ) ) ( not ( = ?auto_342614 ?auto_342620 ) ) ( not ( = ?auto_342614 ?auto_342621 ) ) ( not ( = ?auto_342614 ?auto_342622 ) ) ( not ( = ?auto_342614 ?auto_342623 ) ) ( not ( = ?auto_342614 ?auto_342624 ) ) ( not ( = ?auto_342614 ?auto_342625 ) ) ( not ( = ?auto_342615 ?auto_342616 ) ) ( not ( = ?auto_342615 ?auto_342617 ) ) ( not ( = ?auto_342615 ?auto_342618 ) ) ( not ( = ?auto_342615 ?auto_342619 ) ) ( not ( = ?auto_342615 ?auto_342620 ) ) ( not ( = ?auto_342615 ?auto_342621 ) ) ( not ( = ?auto_342615 ?auto_342622 ) ) ( not ( = ?auto_342615 ?auto_342623 ) ) ( not ( = ?auto_342615 ?auto_342624 ) ) ( not ( = ?auto_342615 ?auto_342625 ) ) ( not ( = ?auto_342616 ?auto_342617 ) ) ( not ( = ?auto_342616 ?auto_342618 ) ) ( not ( = ?auto_342616 ?auto_342619 ) ) ( not ( = ?auto_342616 ?auto_342620 ) ) ( not ( = ?auto_342616 ?auto_342621 ) ) ( not ( = ?auto_342616 ?auto_342622 ) ) ( not ( = ?auto_342616 ?auto_342623 ) ) ( not ( = ?auto_342616 ?auto_342624 ) ) ( not ( = ?auto_342616 ?auto_342625 ) ) ( not ( = ?auto_342617 ?auto_342618 ) ) ( not ( = ?auto_342617 ?auto_342619 ) ) ( not ( = ?auto_342617 ?auto_342620 ) ) ( not ( = ?auto_342617 ?auto_342621 ) ) ( not ( = ?auto_342617 ?auto_342622 ) ) ( not ( = ?auto_342617 ?auto_342623 ) ) ( not ( = ?auto_342617 ?auto_342624 ) ) ( not ( = ?auto_342617 ?auto_342625 ) ) ( not ( = ?auto_342618 ?auto_342619 ) ) ( not ( = ?auto_342618 ?auto_342620 ) ) ( not ( = ?auto_342618 ?auto_342621 ) ) ( not ( = ?auto_342618 ?auto_342622 ) ) ( not ( = ?auto_342618 ?auto_342623 ) ) ( not ( = ?auto_342618 ?auto_342624 ) ) ( not ( = ?auto_342618 ?auto_342625 ) ) ( not ( = ?auto_342619 ?auto_342620 ) ) ( not ( = ?auto_342619 ?auto_342621 ) ) ( not ( = ?auto_342619 ?auto_342622 ) ) ( not ( = ?auto_342619 ?auto_342623 ) ) ( not ( = ?auto_342619 ?auto_342624 ) ) ( not ( = ?auto_342619 ?auto_342625 ) ) ( not ( = ?auto_342620 ?auto_342621 ) ) ( not ( = ?auto_342620 ?auto_342622 ) ) ( not ( = ?auto_342620 ?auto_342623 ) ) ( not ( = ?auto_342620 ?auto_342624 ) ) ( not ( = ?auto_342620 ?auto_342625 ) ) ( not ( = ?auto_342621 ?auto_342622 ) ) ( not ( = ?auto_342621 ?auto_342623 ) ) ( not ( = ?auto_342621 ?auto_342624 ) ) ( not ( = ?auto_342621 ?auto_342625 ) ) ( not ( = ?auto_342622 ?auto_342623 ) ) ( not ( = ?auto_342622 ?auto_342624 ) ) ( not ( = ?auto_342622 ?auto_342625 ) ) ( not ( = ?auto_342623 ?auto_342624 ) ) ( not ( = ?auto_342623 ?auto_342625 ) ) ( not ( = ?auto_342624 ?auto_342625 ) ) ( ON ?auto_342623 ?auto_342624 ) ( ON ?auto_342622 ?auto_342623 ) ( ON ?auto_342621 ?auto_342622 ) ( ON ?auto_342620 ?auto_342621 ) ( ON ?auto_342619 ?auto_342620 ) ( ON ?auto_342618 ?auto_342619 ) ( ON ?auto_342617 ?auto_342618 ) ( ON ?auto_342616 ?auto_342617 ) ( ON ?auto_342615 ?auto_342616 ) ( ON ?auto_342614 ?auto_342615 ) ( ON ?auto_342613 ?auto_342614 ) ( ON ?auto_342612 ?auto_342613 ) ( CLEAR ?auto_342612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_342612 )
      ( MAKE-13PILE ?auto_342612 ?auto_342613 ?auto_342614 ?auto_342615 ?auto_342616 ?auto_342617 ?auto_342618 ?auto_342619 ?auto_342620 ?auto_342621 ?auto_342622 ?auto_342623 ?auto_342624 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342667 - BLOCK
      ?auto_342668 - BLOCK
      ?auto_342669 - BLOCK
      ?auto_342670 - BLOCK
      ?auto_342671 - BLOCK
      ?auto_342672 - BLOCK
      ?auto_342673 - BLOCK
      ?auto_342674 - BLOCK
      ?auto_342675 - BLOCK
      ?auto_342676 - BLOCK
      ?auto_342677 - BLOCK
      ?auto_342678 - BLOCK
      ?auto_342679 - BLOCK
      ?auto_342680 - BLOCK
    )
    :vars
    (
      ?auto_342681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_342679 ) ( ON ?auto_342680 ?auto_342681 ) ( CLEAR ?auto_342680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_342667 ) ( ON ?auto_342668 ?auto_342667 ) ( ON ?auto_342669 ?auto_342668 ) ( ON ?auto_342670 ?auto_342669 ) ( ON ?auto_342671 ?auto_342670 ) ( ON ?auto_342672 ?auto_342671 ) ( ON ?auto_342673 ?auto_342672 ) ( ON ?auto_342674 ?auto_342673 ) ( ON ?auto_342675 ?auto_342674 ) ( ON ?auto_342676 ?auto_342675 ) ( ON ?auto_342677 ?auto_342676 ) ( ON ?auto_342678 ?auto_342677 ) ( ON ?auto_342679 ?auto_342678 ) ( not ( = ?auto_342667 ?auto_342668 ) ) ( not ( = ?auto_342667 ?auto_342669 ) ) ( not ( = ?auto_342667 ?auto_342670 ) ) ( not ( = ?auto_342667 ?auto_342671 ) ) ( not ( = ?auto_342667 ?auto_342672 ) ) ( not ( = ?auto_342667 ?auto_342673 ) ) ( not ( = ?auto_342667 ?auto_342674 ) ) ( not ( = ?auto_342667 ?auto_342675 ) ) ( not ( = ?auto_342667 ?auto_342676 ) ) ( not ( = ?auto_342667 ?auto_342677 ) ) ( not ( = ?auto_342667 ?auto_342678 ) ) ( not ( = ?auto_342667 ?auto_342679 ) ) ( not ( = ?auto_342667 ?auto_342680 ) ) ( not ( = ?auto_342667 ?auto_342681 ) ) ( not ( = ?auto_342668 ?auto_342669 ) ) ( not ( = ?auto_342668 ?auto_342670 ) ) ( not ( = ?auto_342668 ?auto_342671 ) ) ( not ( = ?auto_342668 ?auto_342672 ) ) ( not ( = ?auto_342668 ?auto_342673 ) ) ( not ( = ?auto_342668 ?auto_342674 ) ) ( not ( = ?auto_342668 ?auto_342675 ) ) ( not ( = ?auto_342668 ?auto_342676 ) ) ( not ( = ?auto_342668 ?auto_342677 ) ) ( not ( = ?auto_342668 ?auto_342678 ) ) ( not ( = ?auto_342668 ?auto_342679 ) ) ( not ( = ?auto_342668 ?auto_342680 ) ) ( not ( = ?auto_342668 ?auto_342681 ) ) ( not ( = ?auto_342669 ?auto_342670 ) ) ( not ( = ?auto_342669 ?auto_342671 ) ) ( not ( = ?auto_342669 ?auto_342672 ) ) ( not ( = ?auto_342669 ?auto_342673 ) ) ( not ( = ?auto_342669 ?auto_342674 ) ) ( not ( = ?auto_342669 ?auto_342675 ) ) ( not ( = ?auto_342669 ?auto_342676 ) ) ( not ( = ?auto_342669 ?auto_342677 ) ) ( not ( = ?auto_342669 ?auto_342678 ) ) ( not ( = ?auto_342669 ?auto_342679 ) ) ( not ( = ?auto_342669 ?auto_342680 ) ) ( not ( = ?auto_342669 ?auto_342681 ) ) ( not ( = ?auto_342670 ?auto_342671 ) ) ( not ( = ?auto_342670 ?auto_342672 ) ) ( not ( = ?auto_342670 ?auto_342673 ) ) ( not ( = ?auto_342670 ?auto_342674 ) ) ( not ( = ?auto_342670 ?auto_342675 ) ) ( not ( = ?auto_342670 ?auto_342676 ) ) ( not ( = ?auto_342670 ?auto_342677 ) ) ( not ( = ?auto_342670 ?auto_342678 ) ) ( not ( = ?auto_342670 ?auto_342679 ) ) ( not ( = ?auto_342670 ?auto_342680 ) ) ( not ( = ?auto_342670 ?auto_342681 ) ) ( not ( = ?auto_342671 ?auto_342672 ) ) ( not ( = ?auto_342671 ?auto_342673 ) ) ( not ( = ?auto_342671 ?auto_342674 ) ) ( not ( = ?auto_342671 ?auto_342675 ) ) ( not ( = ?auto_342671 ?auto_342676 ) ) ( not ( = ?auto_342671 ?auto_342677 ) ) ( not ( = ?auto_342671 ?auto_342678 ) ) ( not ( = ?auto_342671 ?auto_342679 ) ) ( not ( = ?auto_342671 ?auto_342680 ) ) ( not ( = ?auto_342671 ?auto_342681 ) ) ( not ( = ?auto_342672 ?auto_342673 ) ) ( not ( = ?auto_342672 ?auto_342674 ) ) ( not ( = ?auto_342672 ?auto_342675 ) ) ( not ( = ?auto_342672 ?auto_342676 ) ) ( not ( = ?auto_342672 ?auto_342677 ) ) ( not ( = ?auto_342672 ?auto_342678 ) ) ( not ( = ?auto_342672 ?auto_342679 ) ) ( not ( = ?auto_342672 ?auto_342680 ) ) ( not ( = ?auto_342672 ?auto_342681 ) ) ( not ( = ?auto_342673 ?auto_342674 ) ) ( not ( = ?auto_342673 ?auto_342675 ) ) ( not ( = ?auto_342673 ?auto_342676 ) ) ( not ( = ?auto_342673 ?auto_342677 ) ) ( not ( = ?auto_342673 ?auto_342678 ) ) ( not ( = ?auto_342673 ?auto_342679 ) ) ( not ( = ?auto_342673 ?auto_342680 ) ) ( not ( = ?auto_342673 ?auto_342681 ) ) ( not ( = ?auto_342674 ?auto_342675 ) ) ( not ( = ?auto_342674 ?auto_342676 ) ) ( not ( = ?auto_342674 ?auto_342677 ) ) ( not ( = ?auto_342674 ?auto_342678 ) ) ( not ( = ?auto_342674 ?auto_342679 ) ) ( not ( = ?auto_342674 ?auto_342680 ) ) ( not ( = ?auto_342674 ?auto_342681 ) ) ( not ( = ?auto_342675 ?auto_342676 ) ) ( not ( = ?auto_342675 ?auto_342677 ) ) ( not ( = ?auto_342675 ?auto_342678 ) ) ( not ( = ?auto_342675 ?auto_342679 ) ) ( not ( = ?auto_342675 ?auto_342680 ) ) ( not ( = ?auto_342675 ?auto_342681 ) ) ( not ( = ?auto_342676 ?auto_342677 ) ) ( not ( = ?auto_342676 ?auto_342678 ) ) ( not ( = ?auto_342676 ?auto_342679 ) ) ( not ( = ?auto_342676 ?auto_342680 ) ) ( not ( = ?auto_342676 ?auto_342681 ) ) ( not ( = ?auto_342677 ?auto_342678 ) ) ( not ( = ?auto_342677 ?auto_342679 ) ) ( not ( = ?auto_342677 ?auto_342680 ) ) ( not ( = ?auto_342677 ?auto_342681 ) ) ( not ( = ?auto_342678 ?auto_342679 ) ) ( not ( = ?auto_342678 ?auto_342680 ) ) ( not ( = ?auto_342678 ?auto_342681 ) ) ( not ( = ?auto_342679 ?auto_342680 ) ) ( not ( = ?auto_342679 ?auto_342681 ) ) ( not ( = ?auto_342680 ?auto_342681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_342680 ?auto_342681 )
      ( !STACK ?auto_342680 ?auto_342679 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342696 - BLOCK
      ?auto_342697 - BLOCK
      ?auto_342698 - BLOCK
      ?auto_342699 - BLOCK
      ?auto_342700 - BLOCK
      ?auto_342701 - BLOCK
      ?auto_342702 - BLOCK
      ?auto_342703 - BLOCK
      ?auto_342704 - BLOCK
      ?auto_342705 - BLOCK
      ?auto_342706 - BLOCK
      ?auto_342707 - BLOCK
      ?auto_342708 - BLOCK
      ?auto_342709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_342708 ) ( ON-TABLE ?auto_342709 ) ( CLEAR ?auto_342709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_342696 ) ( ON ?auto_342697 ?auto_342696 ) ( ON ?auto_342698 ?auto_342697 ) ( ON ?auto_342699 ?auto_342698 ) ( ON ?auto_342700 ?auto_342699 ) ( ON ?auto_342701 ?auto_342700 ) ( ON ?auto_342702 ?auto_342701 ) ( ON ?auto_342703 ?auto_342702 ) ( ON ?auto_342704 ?auto_342703 ) ( ON ?auto_342705 ?auto_342704 ) ( ON ?auto_342706 ?auto_342705 ) ( ON ?auto_342707 ?auto_342706 ) ( ON ?auto_342708 ?auto_342707 ) ( not ( = ?auto_342696 ?auto_342697 ) ) ( not ( = ?auto_342696 ?auto_342698 ) ) ( not ( = ?auto_342696 ?auto_342699 ) ) ( not ( = ?auto_342696 ?auto_342700 ) ) ( not ( = ?auto_342696 ?auto_342701 ) ) ( not ( = ?auto_342696 ?auto_342702 ) ) ( not ( = ?auto_342696 ?auto_342703 ) ) ( not ( = ?auto_342696 ?auto_342704 ) ) ( not ( = ?auto_342696 ?auto_342705 ) ) ( not ( = ?auto_342696 ?auto_342706 ) ) ( not ( = ?auto_342696 ?auto_342707 ) ) ( not ( = ?auto_342696 ?auto_342708 ) ) ( not ( = ?auto_342696 ?auto_342709 ) ) ( not ( = ?auto_342697 ?auto_342698 ) ) ( not ( = ?auto_342697 ?auto_342699 ) ) ( not ( = ?auto_342697 ?auto_342700 ) ) ( not ( = ?auto_342697 ?auto_342701 ) ) ( not ( = ?auto_342697 ?auto_342702 ) ) ( not ( = ?auto_342697 ?auto_342703 ) ) ( not ( = ?auto_342697 ?auto_342704 ) ) ( not ( = ?auto_342697 ?auto_342705 ) ) ( not ( = ?auto_342697 ?auto_342706 ) ) ( not ( = ?auto_342697 ?auto_342707 ) ) ( not ( = ?auto_342697 ?auto_342708 ) ) ( not ( = ?auto_342697 ?auto_342709 ) ) ( not ( = ?auto_342698 ?auto_342699 ) ) ( not ( = ?auto_342698 ?auto_342700 ) ) ( not ( = ?auto_342698 ?auto_342701 ) ) ( not ( = ?auto_342698 ?auto_342702 ) ) ( not ( = ?auto_342698 ?auto_342703 ) ) ( not ( = ?auto_342698 ?auto_342704 ) ) ( not ( = ?auto_342698 ?auto_342705 ) ) ( not ( = ?auto_342698 ?auto_342706 ) ) ( not ( = ?auto_342698 ?auto_342707 ) ) ( not ( = ?auto_342698 ?auto_342708 ) ) ( not ( = ?auto_342698 ?auto_342709 ) ) ( not ( = ?auto_342699 ?auto_342700 ) ) ( not ( = ?auto_342699 ?auto_342701 ) ) ( not ( = ?auto_342699 ?auto_342702 ) ) ( not ( = ?auto_342699 ?auto_342703 ) ) ( not ( = ?auto_342699 ?auto_342704 ) ) ( not ( = ?auto_342699 ?auto_342705 ) ) ( not ( = ?auto_342699 ?auto_342706 ) ) ( not ( = ?auto_342699 ?auto_342707 ) ) ( not ( = ?auto_342699 ?auto_342708 ) ) ( not ( = ?auto_342699 ?auto_342709 ) ) ( not ( = ?auto_342700 ?auto_342701 ) ) ( not ( = ?auto_342700 ?auto_342702 ) ) ( not ( = ?auto_342700 ?auto_342703 ) ) ( not ( = ?auto_342700 ?auto_342704 ) ) ( not ( = ?auto_342700 ?auto_342705 ) ) ( not ( = ?auto_342700 ?auto_342706 ) ) ( not ( = ?auto_342700 ?auto_342707 ) ) ( not ( = ?auto_342700 ?auto_342708 ) ) ( not ( = ?auto_342700 ?auto_342709 ) ) ( not ( = ?auto_342701 ?auto_342702 ) ) ( not ( = ?auto_342701 ?auto_342703 ) ) ( not ( = ?auto_342701 ?auto_342704 ) ) ( not ( = ?auto_342701 ?auto_342705 ) ) ( not ( = ?auto_342701 ?auto_342706 ) ) ( not ( = ?auto_342701 ?auto_342707 ) ) ( not ( = ?auto_342701 ?auto_342708 ) ) ( not ( = ?auto_342701 ?auto_342709 ) ) ( not ( = ?auto_342702 ?auto_342703 ) ) ( not ( = ?auto_342702 ?auto_342704 ) ) ( not ( = ?auto_342702 ?auto_342705 ) ) ( not ( = ?auto_342702 ?auto_342706 ) ) ( not ( = ?auto_342702 ?auto_342707 ) ) ( not ( = ?auto_342702 ?auto_342708 ) ) ( not ( = ?auto_342702 ?auto_342709 ) ) ( not ( = ?auto_342703 ?auto_342704 ) ) ( not ( = ?auto_342703 ?auto_342705 ) ) ( not ( = ?auto_342703 ?auto_342706 ) ) ( not ( = ?auto_342703 ?auto_342707 ) ) ( not ( = ?auto_342703 ?auto_342708 ) ) ( not ( = ?auto_342703 ?auto_342709 ) ) ( not ( = ?auto_342704 ?auto_342705 ) ) ( not ( = ?auto_342704 ?auto_342706 ) ) ( not ( = ?auto_342704 ?auto_342707 ) ) ( not ( = ?auto_342704 ?auto_342708 ) ) ( not ( = ?auto_342704 ?auto_342709 ) ) ( not ( = ?auto_342705 ?auto_342706 ) ) ( not ( = ?auto_342705 ?auto_342707 ) ) ( not ( = ?auto_342705 ?auto_342708 ) ) ( not ( = ?auto_342705 ?auto_342709 ) ) ( not ( = ?auto_342706 ?auto_342707 ) ) ( not ( = ?auto_342706 ?auto_342708 ) ) ( not ( = ?auto_342706 ?auto_342709 ) ) ( not ( = ?auto_342707 ?auto_342708 ) ) ( not ( = ?auto_342707 ?auto_342709 ) ) ( not ( = ?auto_342708 ?auto_342709 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_342709 )
      ( !STACK ?auto_342709 ?auto_342708 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342724 - BLOCK
      ?auto_342725 - BLOCK
      ?auto_342726 - BLOCK
      ?auto_342727 - BLOCK
      ?auto_342728 - BLOCK
      ?auto_342729 - BLOCK
      ?auto_342730 - BLOCK
      ?auto_342731 - BLOCK
      ?auto_342732 - BLOCK
      ?auto_342733 - BLOCK
      ?auto_342734 - BLOCK
      ?auto_342735 - BLOCK
      ?auto_342736 - BLOCK
      ?auto_342737 - BLOCK
    )
    :vars
    (
      ?auto_342738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342737 ?auto_342738 ) ( ON-TABLE ?auto_342724 ) ( ON ?auto_342725 ?auto_342724 ) ( ON ?auto_342726 ?auto_342725 ) ( ON ?auto_342727 ?auto_342726 ) ( ON ?auto_342728 ?auto_342727 ) ( ON ?auto_342729 ?auto_342728 ) ( ON ?auto_342730 ?auto_342729 ) ( ON ?auto_342731 ?auto_342730 ) ( ON ?auto_342732 ?auto_342731 ) ( ON ?auto_342733 ?auto_342732 ) ( ON ?auto_342734 ?auto_342733 ) ( ON ?auto_342735 ?auto_342734 ) ( not ( = ?auto_342724 ?auto_342725 ) ) ( not ( = ?auto_342724 ?auto_342726 ) ) ( not ( = ?auto_342724 ?auto_342727 ) ) ( not ( = ?auto_342724 ?auto_342728 ) ) ( not ( = ?auto_342724 ?auto_342729 ) ) ( not ( = ?auto_342724 ?auto_342730 ) ) ( not ( = ?auto_342724 ?auto_342731 ) ) ( not ( = ?auto_342724 ?auto_342732 ) ) ( not ( = ?auto_342724 ?auto_342733 ) ) ( not ( = ?auto_342724 ?auto_342734 ) ) ( not ( = ?auto_342724 ?auto_342735 ) ) ( not ( = ?auto_342724 ?auto_342736 ) ) ( not ( = ?auto_342724 ?auto_342737 ) ) ( not ( = ?auto_342724 ?auto_342738 ) ) ( not ( = ?auto_342725 ?auto_342726 ) ) ( not ( = ?auto_342725 ?auto_342727 ) ) ( not ( = ?auto_342725 ?auto_342728 ) ) ( not ( = ?auto_342725 ?auto_342729 ) ) ( not ( = ?auto_342725 ?auto_342730 ) ) ( not ( = ?auto_342725 ?auto_342731 ) ) ( not ( = ?auto_342725 ?auto_342732 ) ) ( not ( = ?auto_342725 ?auto_342733 ) ) ( not ( = ?auto_342725 ?auto_342734 ) ) ( not ( = ?auto_342725 ?auto_342735 ) ) ( not ( = ?auto_342725 ?auto_342736 ) ) ( not ( = ?auto_342725 ?auto_342737 ) ) ( not ( = ?auto_342725 ?auto_342738 ) ) ( not ( = ?auto_342726 ?auto_342727 ) ) ( not ( = ?auto_342726 ?auto_342728 ) ) ( not ( = ?auto_342726 ?auto_342729 ) ) ( not ( = ?auto_342726 ?auto_342730 ) ) ( not ( = ?auto_342726 ?auto_342731 ) ) ( not ( = ?auto_342726 ?auto_342732 ) ) ( not ( = ?auto_342726 ?auto_342733 ) ) ( not ( = ?auto_342726 ?auto_342734 ) ) ( not ( = ?auto_342726 ?auto_342735 ) ) ( not ( = ?auto_342726 ?auto_342736 ) ) ( not ( = ?auto_342726 ?auto_342737 ) ) ( not ( = ?auto_342726 ?auto_342738 ) ) ( not ( = ?auto_342727 ?auto_342728 ) ) ( not ( = ?auto_342727 ?auto_342729 ) ) ( not ( = ?auto_342727 ?auto_342730 ) ) ( not ( = ?auto_342727 ?auto_342731 ) ) ( not ( = ?auto_342727 ?auto_342732 ) ) ( not ( = ?auto_342727 ?auto_342733 ) ) ( not ( = ?auto_342727 ?auto_342734 ) ) ( not ( = ?auto_342727 ?auto_342735 ) ) ( not ( = ?auto_342727 ?auto_342736 ) ) ( not ( = ?auto_342727 ?auto_342737 ) ) ( not ( = ?auto_342727 ?auto_342738 ) ) ( not ( = ?auto_342728 ?auto_342729 ) ) ( not ( = ?auto_342728 ?auto_342730 ) ) ( not ( = ?auto_342728 ?auto_342731 ) ) ( not ( = ?auto_342728 ?auto_342732 ) ) ( not ( = ?auto_342728 ?auto_342733 ) ) ( not ( = ?auto_342728 ?auto_342734 ) ) ( not ( = ?auto_342728 ?auto_342735 ) ) ( not ( = ?auto_342728 ?auto_342736 ) ) ( not ( = ?auto_342728 ?auto_342737 ) ) ( not ( = ?auto_342728 ?auto_342738 ) ) ( not ( = ?auto_342729 ?auto_342730 ) ) ( not ( = ?auto_342729 ?auto_342731 ) ) ( not ( = ?auto_342729 ?auto_342732 ) ) ( not ( = ?auto_342729 ?auto_342733 ) ) ( not ( = ?auto_342729 ?auto_342734 ) ) ( not ( = ?auto_342729 ?auto_342735 ) ) ( not ( = ?auto_342729 ?auto_342736 ) ) ( not ( = ?auto_342729 ?auto_342737 ) ) ( not ( = ?auto_342729 ?auto_342738 ) ) ( not ( = ?auto_342730 ?auto_342731 ) ) ( not ( = ?auto_342730 ?auto_342732 ) ) ( not ( = ?auto_342730 ?auto_342733 ) ) ( not ( = ?auto_342730 ?auto_342734 ) ) ( not ( = ?auto_342730 ?auto_342735 ) ) ( not ( = ?auto_342730 ?auto_342736 ) ) ( not ( = ?auto_342730 ?auto_342737 ) ) ( not ( = ?auto_342730 ?auto_342738 ) ) ( not ( = ?auto_342731 ?auto_342732 ) ) ( not ( = ?auto_342731 ?auto_342733 ) ) ( not ( = ?auto_342731 ?auto_342734 ) ) ( not ( = ?auto_342731 ?auto_342735 ) ) ( not ( = ?auto_342731 ?auto_342736 ) ) ( not ( = ?auto_342731 ?auto_342737 ) ) ( not ( = ?auto_342731 ?auto_342738 ) ) ( not ( = ?auto_342732 ?auto_342733 ) ) ( not ( = ?auto_342732 ?auto_342734 ) ) ( not ( = ?auto_342732 ?auto_342735 ) ) ( not ( = ?auto_342732 ?auto_342736 ) ) ( not ( = ?auto_342732 ?auto_342737 ) ) ( not ( = ?auto_342732 ?auto_342738 ) ) ( not ( = ?auto_342733 ?auto_342734 ) ) ( not ( = ?auto_342733 ?auto_342735 ) ) ( not ( = ?auto_342733 ?auto_342736 ) ) ( not ( = ?auto_342733 ?auto_342737 ) ) ( not ( = ?auto_342733 ?auto_342738 ) ) ( not ( = ?auto_342734 ?auto_342735 ) ) ( not ( = ?auto_342734 ?auto_342736 ) ) ( not ( = ?auto_342734 ?auto_342737 ) ) ( not ( = ?auto_342734 ?auto_342738 ) ) ( not ( = ?auto_342735 ?auto_342736 ) ) ( not ( = ?auto_342735 ?auto_342737 ) ) ( not ( = ?auto_342735 ?auto_342738 ) ) ( not ( = ?auto_342736 ?auto_342737 ) ) ( not ( = ?auto_342736 ?auto_342738 ) ) ( not ( = ?auto_342737 ?auto_342738 ) ) ( CLEAR ?auto_342735 ) ( ON ?auto_342736 ?auto_342737 ) ( CLEAR ?auto_342736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_342724 ?auto_342725 ?auto_342726 ?auto_342727 ?auto_342728 ?auto_342729 ?auto_342730 ?auto_342731 ?auto_342732 ?auto_342733 ?auto_342734 ?auto_342735 ?auto_342736 )
      ( MAKE-14PILE ?auto_342724 ?auto_342725 ?auto_342726 ?auto_342727 ?auto_342728 ?auto_342729 ?auto_342730 ?auto_342731 ?auto_342732 ?auto_342733 ?auto_342734 ?auto_342735 ?auto_342736 ?auto_342737 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342753 - BLOCK
      ?auto_342754 - BLOCK
      ?auto_342755 - BLOCK
      ?auto_342756 - BLOCK
      ?auto_342757 - BLOCK
      ?auto_342758 - BLOCK
      ?auto_342759 - BLOCK
      ?auto_342760 - BLOCK
      ?auto_342761 - BLOCK
      ?auto_342762 - BLOCK
      ?auto_342763 - BLOCK
      ?auto_342764 - BLOCK
      ?auto_342765 - BLOCK
      ?auto_342766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342766 ) ( ON-TABLE ?auto_342753 ) ( ON ?auto_342754 ?auto_342753 ) ( ON ?auto_342755 ?auto_342754 ) ( ON ?auto_342756 ?auto_342755 ) ( ON ?auto_342757 ?auto_342756 ) ( ON ?auto_342758 ?auto_342757 ) ( ON ?auto_342759 ?auto_342758 ) ( ON ?auto_342760 ?auto_342759 ) ( ON ?auto_342761 ?auto_342760 ) ( ON ?auto_342762 ?auto_342761 ) ( ON ?auto_342763 ?auto_342762 ) ( ON ?auto_342764 ?auto_342763 ) ( not ( = ?auto_342753 ?auto_342754 ) ) ( not ( = ?auto_342753 ?auto_342755 ) ) ( not ( = ?auto_342753 ?auto_342756 ) ) ( not ( = ?auto_342753 ?auto_342757 ) ) ( not ( = ?auto_342753 ?auto_342758 ) ) ( not ( = ?auto_342753 ?auto_342759 ) ) ( not ( = ?auto_342753 ?auto_342760 ) ) ( not ( = ?auto_342753 ?auto_342761 ) ) ( not ( = ?auto_342753 ?auto_342762 ) ) ( not ( = ?auto_342753 ?auto_342763 ) ) ( not ( = ?auto_342753 ?auto_342764 ) ) ( not ( = ?auto_342753 ?auto_342765 ) ) ( not ( = ?auto_342753 ?auto_342766 ) ) ( not ( = ?auto_342754 ?auto_342755 ) ) ( not ( = ?auto_342754 ?auto_342756 ) ) ( not ( = ?auto_342754 ?auto_342757 ) ) ( not ( = ?auto_342754 ?auto_342758 ) ) ( not ( = ?auto_342754 ?auto_342759 ) ) ( not ( = ?auto_342754 ?auto_342760 ) ) ( not ( = ?auto_342754 ?auto_342761 ) ) ( not ( = ?auto_342754 ?auto_342762 ) ) ( not ( = ?auto_342754 ?auto_342763 ) ) ( not ( = ?auto_342754 ?auto_342764 ) ) ( not ( = ?auto_342754 ?auto_342765 ) ) ( not ( = ?auto_342754 ?auto_342766 ) ) ( not ( = ?auto_342755 ?auto_342756 ) ) ( not ( = ?auto_342755 ?auto_342757 ) ) ( not ( = ?auto_342755 ?auto_342758 ) ) ( not ( = ?auto_342755 ?auto_342759 ) ) ( not ( = ?auto_342755 ?auto_342760 ) ) ( not ( = ?auto_342755 ?auto_342761 ) ) ( not ( = ?auto_342755 ?auto_342762 ) ) ( not ( = ?auto_342755 ?auto_342763 ) ) ( not ( = ?auto_342755 ?auto_342764 ) ) ( not ( = ?auto_342755 ?auto_342765 ) ) ( not ( = ?auto_342755 ?auto_342766 ) ) ( not ( = ?auto_342756 ?auto_342757 ) ) ( not ( = ?auto_342756 ?auto_342758 ) ) ( not ( = ?auto_342756 ?auto_342759 ) ) ( not ( = ?auto_342756 ?auto_342760 ) ) ( not ( = ?auto_342756 ?auto_342761 ) ) ( not ( = ?auto_342756 ?auto_342762 ) ) ( not ( = ?auto_342756 ?auto_342763 ) ) ( not ( = ?auto_342756 ?auto_342764 ) ) ( not ( = ?auto_342756 ?auto_342765 ) ) ( not ( = ?auto_342756 ?auto_342766 ) ) ( not ( = ?auto_342757 ?auto_342758 ) ) ( not ( = ?auto_342757 ?auto_342759 ) ) ( not ( = ?auto_342757 ?auto_342760 ) ) ( not ( = ?auto_342757 ?auto_342761 ) ) ( not ( = ?auto_342757 ?auto_342762 ) ) ( not ( = ?auto_342757 ?auto_342763 ) ) ( not ( = ?auto_342757 ?auto_342764 ) ) ( not ( = ?auto_342757 ?auto_342765 ) ) ( not ( = ?auto_342757 ?auto_342766 ) ) ( not ( = ?auto_342758 ?auto_342759 ) ) ( not ( = ?auto_342758 ?auto_342760 ) ) ( not ( = ?auto_342758 ?auto_342761 ) ) ( not ( = ?auto_342758 ?auto_342762 ) ) ( not ( = ?auto_342758 ?auto_342763 ) ) ( not ( = ?auto_342758 ?auto_342764 ) ) ( not ( = ?auto_342758 ?auto_342765 ) ) ( not ( = ?auto_342758 ?auto_342766 ) ) ( not ( = ?auto_342759 ?auto_342760 ) ) ( not ( = ?auto_342759 ?auto_342761 ) ) ( not ( = ?auto_342759 ?auto_342762 ) ) ( not ( = ?auto_342759 ?auto_342763 ) ) ( not ( = ?auto_342759 ?auto_342764 ) ) ( not ( = ?auto_342759 ?auto_342765 ) ) ( not ( = ?auto_342759 ?auto_342766 ) ) ( not ( = ?auto_342760 ?auto_342761 ) ) ( not ( = ?auto_342760 ?auto_342762 ) ) ( not ( = ?auto_342760 ?auto_342763 ) ) ( not ( = ?auto_342760 ?auto_342764 ) ) ( not ( = ?auto_342760 ?auto_342765 ) ) ( not ( = ?auto_342760 ?auto_342766 ) ) ( not ( = ?auto_342761 ?auto_342762 ) ) ( not ( = ?auto_342761 ?auto_342763 ) ) ( not ( = ?auto_342761 ?auto_342764 ) ) ( not ( = ?auto_342761 ?auto_342765 ) ) ( not ( = ?auto_342761 ?auto_342766 ) ) ( not ( = ?auto_342762 ?auto_342763 ) ) ( not ( = ?auto_342762 ?auto_342764 ) ) ( not ( = ?auto_342762 ?auto_342765 ) ) ( not ( = ?auto_342762 ?auto_342766 ) ) ( not ( = ?auto_342763 ?auto_342764 ) ) ( not ( = ?auto_342763 ?auto_342765 ) ) ( not ( = ?auto_342763 ?auto_342766 ) ) ( not ( = ?auto_342764 ?auto_342765 ) ) ( not ( = ?auto_342764 ?auto_342766 ) ) ( not ( = ?auto_342765 ?auto_342766 ) ) ( CLEAR ?auto_342764 ) ( ON ?auto_342765 ?auto_342766 ) ( CLEAR ?auto_342765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_342753 ?auto_342754 ?auto_342755 ?auto_342756 ?auto_342757 ?auto_342758 ?auto_342759 ?auto_342760 ?auto_342761 ?auto_342762 ?auto_342763 ?auto_342764 ?auto_342765 )
      ( MAKE-14PILE ?auto_342753 ?auto_342754 ?auto_342755 ?auto_342756 ?auto_342757 ?auto_342758 ?auto_342759 ?auto_342760 ?auto_342761 ?auto_342762 ?auto_342763 ?auto_342764 ?auto_342765 ?auto_342766 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342781 - BLOCK
      ?auto_342782 - BLOCK
      ?auto_342783 - BLOCK
      ?auto_342784 - BLOCK
      ?auto_342785 - BLOCK
      ?auto_342786 - BLOCK
      ?auto_342787 - BLOCK
      ?auto_342788 - BLOCK
      ?auto_342789 - BLOCK
      ?auto_342790 - BLOCK
      ?auto_342791 - BLOCK
      ?auto_342792 - BLOCK
      ?auto_342793 - BLOCK
      ?auto_342794 - BLOCK
    )
    :vars
    (
      ?auto_342795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342794 ?auto_342795 ) ( ON-TABLE ?auto_342781 ) ( ON ?auto_342782 ?auto_342781 ) ( ON ?auto_342783 ?auto_342782 ) ( ON ?auto_342784 ?auto_342783 ) ( ON ?auto_342785 ?auto_342784 ) ( ON ?auto_342786 ?auto_342785 ) ( ON ?auto_342787 ?auto_342786 ) ( ON ?auto_342788 ?auto_342787 ) ( ON ?auto_342789 ?auto_342788 ) ( ON ?auto_342790 ?auto_342789 ) ( ON ?auto_342791 ?auto_342790 ) ( not ( = ?auto_342781 ?auto_342782 ) ) ( not ( = ?auto_342781 ?auto_342783 ) ) ( not ( = ?auto_342781 ?auto_342784 ) ) ( not ( = ?auto_342781 ?auto_342785 ) ) ( not ( = ?auto_342781 ?auto_342786 ) ) ( not ( = ?auto_342781 ?auto_342787 ) ) ( not ( = ?auto_342781 ?auto_342788 ) ) ( not ( = ?auto_342781 ?auto_342789 ) ) ( not ( = ?auto_342781 ?auto_342790 ) ) ( not ( = ?auto_342781 ?auto_342791 ) ) ( not ( = ?auto_342781 ?auto_342792 ) ) ( not ( = ?auto_342781 ?auto_342793 ) ) ( not ( = ?auto_342781 ?auto_342794 ) ) ( not ( = ?auto_342781 ?auto_342795 ) ) ( not ( = ?auto_342782 ?auto_342783 ) ) ( not ( = ?auto_342782 ?auto_342784 ) ) ( not ( = ?auto_342782 ?auto_342785 ) ) ( not ( = ?auto_342782 ?auto_342786 ) ) ( not ( = ?auto_342782 ?auto_342787 ) ) ( not ( = ?auto_342782 ?auto_342788 ) ) ( not ( = ?auto_342782 ?auto_342789 ) ) ( not ( = ?auto_342782 ?auto_342790 ) ) ( not ( = ?auto_342782 ?auto_342791 ) ) ( not ( = ?auto_342782 ?auto_342792 ) ) ( not ( = ?auto_342782 ?auto_342793 ) ) ( not ( = ?auto_342782 ?auto_342794 ) ) ( not ( = ?auto_342782 ?auto_342795 ) ) ( not ( = ?auto_342783 ?auto_342784 ) ) ( not ( = ?auto_342783 ?auto_342785 ) ) ( not ( = ?auto_342783 ?auto_342786 ) ) ( not ( = ?auto_342783 ?auto_342787 ) ) ( not ( = ?auto_342783 ?auto_342788 ) ) ( not ( = ?auto_342783 ?auto_342789 ) ) ( not ( = ?auto_342783 ?auto_342790 ) ) ( not ( = ?auto_342783 ?auto_342791 ) ) ( not ( = ?auto_342783 ?auto_342792 ) ) ( not ( = ?auto_342783 ?auto_342793 ) ) ( not ( = ?auto_342783 ?auto_342794 ) ) ( not ( = ?auto_342783 ?auto_342795 ) ) ( not ( = ?auto_342784 ?auto_342785 ) ) ( not ( = ?auto_342784 ?auto_342786 ) ) ( not ( = ?auto_342784 ?auto_342787 ) ) ( not ( = ?auto_342784 ?auto_342788 ) ) ( not ( = ?auto_342784 ?auto_342789 ) ) ( not ( = ?auto_342784 ?auto_342790 ) ) ( not ( = ?auto_342784 ?auto_342791 ) ) ( not ( = ?auto_342784 ?auto_342792 ) ) ( not ( = ?auto_342784 ?auto_342793 ) ) ( not ( = ?auto_342784 ?auto_342794 ) ) ( not ( = ?auto_342784 ?auto_342795 ) ) ( not ( = ?auto_342785 ?auto_342786 ) ) ( not ( = ?auto_342785 ?auto_342787 ) ) ( not ( = ?auto_342785 ?auto_342788 ) ) ( not ( = ?auto_342785 ?auto_342789 ) ) ( not ( = ?auto_342785 ?auto_342790 ) ) ( not ( = ?auto_342785 ?auto_342791 ) ) ( not ( = ?auto_342785 ?auto_342792 ) ) ( not ( = ?auto_342785 ?auto_342793 ) ) ( not ( = ?auto_342785 ?auto_342794 ) ) ( not ( = ?auto_342785 ?auto_342795 ) ) ( not ( = ?auto_342786 ?auto_342787 ) ) ( not ( = ?auto_342786 ?auto_342788 ) ) ( not ( = ?auto_342786 ?auto_342789 ) ) ( not ( = ?auto_342786 ?auto_342790 ) ) ( not ( = ?auto_342786 ?auto_342791 ) ) ( not ( = ?auto_342786 ?auto_342792 ) ) ( not ( = ?auto_342786 ?auto_342793 ) ) ( not ( = ?auto_342786 ?auto_342794 ) ) ( not ( = ?auto_342786 ?auto_342795 ) ) ( not ( = ?auto_342787 ?auto_342788 ) ) ( not ( = ?auto_342787 ?auto_342789 ) ) ( not ( = ?auto_342787 ?auto_342790 ) ) ( not ( = ?auto_342787 ?auto_342791 ) ) ( not ( = ?auto_342787 ?auto_342792 ) ) ( not ( = ?auto_342787 ?auto_342793 ) ) ( not ( = ?auto_342787 ?auto_342794 ) ) ( not ( = ?auto_342787 ?auto_342795 ) ) ( not ( = ?auto_342788 ?auto_342789 ) ) ( not ( = ?auto_342788 ?auto_342790 ) ) ( not ( = ?auto_342788 ?auto_342791 ) ) ( not ( = ?auto_342788 ?auto_342792 ) ) ( not ( = ?auto_342788 ?auto_342793 ) ) ( not ( = ?auto_342788 ?auto_342794 ) ) ( not ( = ?auto_342788 ?auto_342795 ) ) ( not ( = ?auto_342789 ?auto_342790 ) ) ( not ( = ?auto_342789 ?auto_342791 ) ) ( not ( = ?auto_342789 ?auto_342792 ) ) ( not ( = ?auto_342789 ?auto_342793 ) ) ( not ( = ?auto_342789 ?auto_342794 ) ) ( not ( = ?auto_342789 ?auto_342795 ) ) ( not ( = ?auto_342790 ?auto_342791 ) ) ( not ( = ?auto_342790 ?auto_342792 ) ) ( not ( = ?auto_342790 ?auto_342793 ) ) ( not ( = ?auto_342790 ?auto_342794 ) ) ( not ( = ?auto_342790 ?auto_342795 ) ) ( not ( = ?auto_342791 ?auto_342792 ) ) ( not ( = ?auto_342791 ?auto_342793 ) ) ( not ( = ?auto_342791 ?auto_342794 ) ) ( not ( = ?auto_342791 ?auto_342795 ) ) ( not ( = ?auto_342792 ?auto_342793 ) ) ( not ( = ?auto_342792 ?auto_342794 ) ) ( not ( = ?auto_342792 ?auto_342795 ) ) ( not ( = ?auto_342793 ?auto_342794 ) ) ( not ( = ?auto_342793 ?auto_342795 ) ) ( not ( = ?auto_342794 ?auto_342795 ) ) ( ON ?auto_342793 ?auto_342794 ) ( CLEAR ?auto_342791 ) ( ON ?auto_342792 ?auto_342793 ) ( CLEAR ?auto_342792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_342781 ?auto_342782 ?auto_342783 ?auto_342784 ?auto_342785 ?auto_342786 ?auto_342787 ?auto_342788 ?auto_342789 ?auto_342790 ?auto_342791 ?auto_342792 )
      ( MAKE-14PILE ?auto_342781 ?auto_342782 ?auto_342783 ?auto_342784 ?auto_342785 ?auto_342786 ?auto_342787 ?auto_342788 ?auto_342789 ?auto_342790 ?auto_342791 ?auto_342792 ?auto_342793 ?auto_342794 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342810 - BLOCK
      ?auto_342811 - BLOCK
      ?auto_342812 - BLOCK
      ?auto_342813 - BLOCK
      ?auto_342814 - BLOCK
      ?auto_342815 - BLOCK
      ?auto_342816 - BLOCK
      ?auto_342817 - BLOCK
      ?auto_342818 - BLOCK
      ?auto_342819 - BLOCK
      ?auto_342820 - BLOCK
      ?auto_342821 - BLOCK
      ?auto_342822 - BLOCK
      ?auto_342823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342823 ) ( ON-TABLE ?auto_342810 ) ( ON ?auto_342811 ?auto_342810 ) ( ON ?auto_342812 ?auto_342811 ) ( ON ?auto_342813 ?auto_342812 ) ( ON ?auto_342814 ?auto_342813 ) ( ON ?auto_342815 ?auto_342814 ) ( ON ?auto_342816 ?auto_342815 ) ( ON ?auto_342817 ?auto_342816 ) ( ON ?auto_342818 ?auto_342817 ) ( ON ?auto_342819 ?auto_342818 ) ( ON ?auto_342820 ?auto_342819 ) ( not ( = ?auto_342810 ?auto_342811 ) ) ( not ( = ?auto_342810 ?auto_342812 ) ) ( not ( = ?auto_342810 ?auto_342813 ) ) ( not ( = ?auto_342810 ?auto_342814 ) ) ( not ( = ?auto_342810 ?auto_342815 ) ) ( not ( = ?auto_342810 ?auto_342816 ) ) ( not ( = ?auto_342810 ?auto_342817 ) ) ( not ( = ?auto_342810 ?auto_342818 ) ) ( not ( = ?auto_342810 ?auto_342819 ) ) ( not ( = ?auto_342810 ?auto_342820 ) ) ( not ( = ?auto_342810 ?auto_342821 ) ) ( not ( = ?auto_342810 ?auto_342822 ) ) ( not ( = ?auto_342810 ?auto_342823 ) ) ( not ( = ?auto_342811 ?auto_342812 ) ) ( not ( = ?auto_342811 ?auto_342813 ) ) ( not ( = ?auto_342811 ?auto_342814 ) ) ( not ( = ?auto_342811 ?auto_342815 ) ) ( not ( = ?auto_342811 ?auto_342816 ) ) ( not ( = ?auto_342811 ?auto_342817 ) ) ( not ( = ?auto_342811 ?auto_342818 ) ) ( not ( = ?auto_342811 ?auto_342819 ) ) ( not ( = ?auto_342811 ?auto_342820 ) ) ( not ( = ?auto_342811 ?auto_342821 ) ) ( not ( = ?auto_342811 ?auto_342822 ) ) ( not ( = ?auto_342811 ?auto_342823 ) ) ( not ( = ?auto_342812 ?auto_342813 ) ) ( not ( = ?auto_342812 ?auto_342814 ) ) ( not ( = ?auto_342812 ?auto_342815 ) ) ( not ( = ?auto_342812 ?auto_342816 ) ) ( not ( = ?auto_342812 ?auto_342817 ) ) ( not ( = ?auto_342812 ?auto_342818 ) ) ( not ( = ?auto_342812 ?auto_342819 ) ) ( not ( = ?auto_342812 ?auto_342820 ) ) ( not ( = ?auto_342812 ?auto_342821 ) ) ( not ( = ?auto_342812 ?auto_342822 ) ) ( not ( = ?auto_342812 ?auto_342823 ) ) ( not ( = ?auto_342813 ?auto_342814 ) ) ( not ( = ?auto_342813 ?auto_342815 ) ) ( not ( = ?auto_342813 ?auto_342816 ) ) ( not ( = ?auto_342813 ?auto_342817 ) ) ( not ( = ?auto_342813 ?auto_342818 ) ) ( not ( = ?auto_342813 ?auto_342819 ) ) ( not ( = ?auto_342813 ?auto_342820 ) ) ( not ( = ?auto_342813 ?auto_342821 ) ) ( not ( = ?auto_342813 ?auto_342822 ) ) ( not ( = ?auto_342813 ?auto_342823 ) ) ( not ( = ?auto_342814 ?auto_342815 ) ) ( not ( = ?auto_342814 ?auto_342816 ) ) ( not ( = ?auto_342814 ?auto_342817 ) ) ( not ( = ?auto_342814 ?auto_342818 ) ) ( not ( = ?auto_342814 ?auto_342819 ) ) ( not ( = ?auto_342814 ?auto_342820 ) ) ( not ( = ?auto_342814 ?auto_342821 ) ) ( not ( = ?auto_342814 ?auto_342822 ) ) ( not ( = ?auto_342814 ?auto_342823 ) ) ( not ( = ?auto_342815 ?auto_342816 ) ) ( not ( = ?auto_342815 ?auto_342817 ) ) ( not ( = ?auto_342815 ?auto_342818 ) ) ( not ( = ?auto_342815 ?auto_342819 ) ) ( not ( = ?auto_342815 ?auto_342820 ) ) ( not ( = ?auto_342815 ?auto_342821 ) ) ( not ( = ?auto_342815 ?auto_342822 ) ) ( not ( = ?auto_342815 ?auto_342823 ) ) ( not ( = ?auto_342816 ?auto_342817 ) ) ( not ( = ?auto_342816 ?auto_342818 ) ) ( not ( = ?auto_342816 ?auto_342819 ) ) ( not ( = ?auto_342816 ?auto_342820 ) ) ( not ( = ?auto_342816 ?auto_342821 ) ) ( not ( = ?auto_342816 ?auto_342822 ) ) ( not ( = ?auto_342816 ?auto_342823 ) ) ( not ( = ?auto_342817 ?auto_342818 ) ) ( not ( = ?auto_342817 ?auto_342819 ) ) ( not ( = ?auto_342817 ?auto_342820 ) ) ( not ( = ?auto_342817 ?auto_342821 ) ) ( not ( = ?auto_342817 ?auto_342822 ) ) ( not ( = ?auto_342817 ?auto_342823 ) ) ( not ( = ?auto_342818 ?auto_342819 ) ) ( not ( = ?auto_342818 ?auto_342820 ) ) ( not ( = ?auto_342818 ?auto_342821 ) ) ( not ( = ?auto_342818 ?auto_342822 ) ) ( not ( = ?auto_342818 ?auto_342823 ) ) ( not ( = ?auto_342819 ?auto_342820 ) ) ( not ( = ?auto_342819 ?auto_342821 ) ) ( not ( = ?auto_342819 ?auto_342822 ) ) ( not ( = ?auto_342819 ?auto_342823 ) ) ( not ( = ?auto_342820 ?auto_342821 ) ) ( not ( = ?auto_342820 ?auto_342822 ) ) ( not ( = ?auto_342820 ?auto_342823 ) ) ( not ( = ?auto_342821 ?auto_342822 ) ) ( not ( = ?auto_342821 ?auto_342823 ) ) ( not ( = ?auto_342822 ?auto_342823 ) ) ( ON ?auto_342822 ?auto_342823 ) ( CLEAR ?auto_342820 ) ( ON ?auto_342821 ?auto_342822 ) ( CLEAR ?auto_342821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_342810 ?auto_342811 ?auto_342812 ?auto_342813 ?auto_342814 ?auto_342815 ?auto_342816 ?auto_342817 ?auto_342818 ?auto_342819 ?auto_342820 ?auto_342821 )
      ( MAKE-14PILE ?auto_342810 ?auto_342811 ?auto_342812 ?auto_342813 ?auto_342814 ?auto_342815 ?auto_342816 ?auto_342817 ?auto_342818 ?auto_342819 ?auto_342820 ?auto_342821 ?auto_342822 ?auto_342823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342838 - BLOCK
      ?auto_342839 - BLOCK
      ?auto_342840 - BLOCK
      ?auto_342841 - BLOCK
      ?auto_342842 - BLOCK
      ?auto_342843 - BLOCK
      ?auto_342844 - BLOCK
      ?auto_342845 - BLOCK
      ?auto_342846 - BLOCK
      ?auto_342847 - BLOCK
      ?auto_342848 - BLOCK
      ?auto_342849 - BLOCK
      ?auto_342850 - BLOCK
      ?auto_342851 - BLOCK
    )
    :vars
    (
      ?auto_342852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342851 ?auto_342852 ) ( ON-TABLE ?auto_342838 ) ( ON ?auto_342839 ?auto_342838 ) ( ON ?auto_342840 ?auto_342839 ) ( ON ?auto_342841 ?auto_342840 ) ( ON ?auto_342842 ?auto_342841 ) ( ON ?auto_342843 ?auto_342842 ) ( ON ?auto_342844 ?auto_342843 ) ( ON ?auto_342845 ?auto_342844 ) ( ON ?auto_342846 ?auto_342845 ) ( ON ?auto_342847 ?auto_342846 ) ( not ( = ?auto_342838 ?auto_342839 ) ) ( not ( = ?auto_342838 ?auto_342840 ) ) ( not ( = ?auto_342838 ?auto_342841 ) ) ( not ( = ?auto_342838 ?auto_342842 ) ) ( not ( = ?auto_342838 ?auto_342843 ) ) ( not ( = ?auto_342838 ?auto_342844 ) ) ( not ( = ?auto_342838 ?auto_342845 ) ) ( not ( = ?auto_342838 ?auto_342846 ) ) ( not ( = ?auto_342838 ?auto_342847 ) ) ( not ( = ?auto_342838 ?auto_342848 ) ) ( not ( = ?auto_342838 ?auto_342849 ) ) ( not ( = ?auto_342838 ?auto_342850 ) ) ( not ( = ?auto_342838 ?auto_342851 ) ) ( not ( = ?auto_342838 ?auto_342852 ) ) ( not ( = ?auto_342839 ?auto_342840 ) ) ( not ( = ?auto_342839 ?auto_342841 ) ) ( not ( = ?auto_342839 ?auto_342842 ) ) ( not ( = ?auto_342839 ?auto_342843 ) ) ( not ( = ?auto_342839 ?auto_342844 ) ) ( not ( = ?auto_342839 ?auto_342845 ) ) ( not ( = ?auto_342839 ?auto_342846 ) ) ( not ( = ?auto_342839 ?auto_342847 ) ) ( not ( = ?auto_342839 ?auto_342848 ) ) ( not ( = ?auto_342839 ?auto_342849 ) ) ( not ( = ?auto_342839 ?auto_342850 ) ) ( not ( = ?auto_342839 ?auto_342851 ) ) ( not ( = ?auto_342839 ?auto_342852 ) ) ( not ( = ?auto_342840 ?auto_342841 ) ) ( not ( = ?auto_342840 ?auto_342842 ) ) ( not ( = ?auto_342840 ?auto_342843 ) ) ( not ( = ?auto_342840 ?auto_342844 ) ) ( not ( = ?auto_342840 ?auto_342845 ) ) ( not ( = ?auto_342840 ?auto_342846 ) ) ( not ( = ?auto_342840 ?auto_342847 ) ) ( not ( = ?auto_342840 ?auto_342848 ) ) ( not ( = ?auto_342840 ?auto_342849 ) ) ( not ( = ?auto_342840 ?auto_342850 ) ) ( not ( = ?auto_342840 ?auto_342851 ) ) ( not ( = ?auto_342840 ?auto_342852 ) ) ( not ( = ?auto_342841 ?auto_342842 ) ) ( not ( = ?auto_342841 ?auto_342843 ) ) ( not ( = ?auto_342841 ?auto_342844 ) ) ( not ( = ?auto_342841 ?auto_342845 ) ) ( not ( = ?auto_342841 ?auto_342846 ) ) ( not ( = ?auto_342841 ?auto_342847 ) ) ( not ( = ?auto_342841 ?auto_342848 ) ) ( not ( = ?auto_342841 ?auto_342849 ) ) ( not ( = ?auto_342841 ?auto_342850 ) ) ( not ( = ?auto_342841 ?auto_342851 ) ) ( not ( = ?auto_342841 ?auto_342852 ) ) ( not ( = ?auto_342842 ?auto_342843 ) ) ( not ( = ?auto_342842 ?auto_342844 ) ) ( not ( = ?auto_342842 ?auto_342845 ) ) ( not ( = ?auto_342842 ?auto_342846 ) ) ( not ( = ?auto_342842 ?auto_342847 ) ) ( not ( = ?auto_342842 ?auto_342848 ) ) ( not ( = ?auto_342842 ?auto_342849 ) ) ( not ( = ?auto_342842 ?auto_342850 ) ) ( not ( = ?auto_342842 ?auto_342851 ) ) ( not ( = ?auto_342842 ?auto_342852 ) ) ( not ( = ?auto_342843 ?auto_342844 ) ) ( not ( = ?auto_342843 ?auto_342845 ) ) ( not ( = ?auto_342843 ?auto_342846 ) ) ( not ( = ?auto_342843 ?auto_342847 ) ) ( not ( = ?auto_342843 ?auto_342848 ) ) ( not ( = ?auto_342843 ?auto_342849 ) ) ( not ( = ?auto_342843 ?auto_342850 ) ) ( not ( = ?auto_342843 ?auto_342851 ) ) ( not ( = ?auto_342843 ?auto_342852 ) ) ( not ( = ?auto_342844 ?auto_342845 ) ) ( not ( = ?auto_342844 ?auto_342846 ) ) ( not ( = ?auto_342844 ?auto_342847 ) ) ( not ( = ?auto_342844 ?auto_342848 ) ) ( not ( = ?auto_342844 ?auto_342849 ) ) ( not ( = ?auto_342844 ?auto_342850 ) ) ( not ( = ?auto_342844 ?auto_342851 ) ) ( not ( = ?auto_342844 ?auto_342852 ) ) ( not ( = ?auto_342845 ?auto_342846 ) ) ( not ( = ?auto_342845 ?auto_342847 ) ) ( not ( = ?auto_342845 ?auto_342848 ) ) ( not ( = ?auto_342845 ?auto_342849 ) ) ( not ( = ?auto_342845 ?auto_342850 ) ) ( not ( = ?auto_342845 ?auto_342851 ) ) ( not ( = ?auto_342845 ?auto_342852 ) ) ( not ( = ?auto_342846 ?auto_342847 ) ) ( not ( = ?auto_342846 ?auto_342848 ) ) ( not ( = ?auto_342846 ?auto_342849 ) ) ( not ( = ?auto_342846 ?auto_342850 ) ) ( not ( = ?auto_342846 ?auto_342851 ) ) ( not ( = ?auto_342846 ?auto_342852 ) ) ( not ( = ?auto_342847 ?auto_342848 ) ) ( not ( = ?auto_342847 ?auto_342849 ) ) ( not ( = ?auto_342847 ?auto_342850 ) ) ( not ( = ?auto_342847 ?auto_342851 ) ) ( not ( = ?auto_342847 ?auto_342852 ) ) ( not ( = ?auto_342848 ?auto_342849 ) ) ( not ( = ?auto_342848 ?auto_342850 ) ) ( not ( = ?auto_342848 ?auto_342851 ) ) ( not ( = ?auto_342848 ?auto_342852 ) ) ( not ( = ?auto_342849 ?auto_342850 ) ) ( not ( = ?auto_342849 ?auto_342851 ) ) ( not ( = ?auto_342849 ?auto_342852 ) ) ( not ( = ?auto_342850 ?auto_342851 ) ) ( not ( = ?auto_342850 ?auto_342852 ) ) ( not ( = ?auto_342851 ?auto_342852 ) ) ( ON ?auto_342850 ?auto_342851 ) ( ON ?auto_342849 ?auto_342850 ) ( CLEAR ?auto_342847 ) ( ON ?auto_342848 ?auto_342849 ) ( CLEAR ?auto_342848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_342838 ?auto_342839 ?auto_342840 ?auto_342841 ?auto_342842 ?auto_342843 ?auto_342844 ?auto_342845 ?auto_342846 ?auto_342847 ?auto_342848 )
      ( MAKE-14PILE ?auto_342838 ?auto_342839 ?auto_342840 ?auto_342841 ?auto_342842 ?auto_342843 ?auto_342844 ?auto_342845 ?auto_342846 ?auto_342847 ?auto_342848 ?auto_342849 ?auto_342850 ?auto_342851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342867 - BLOCK
      ?auto_342868 - BLOCK
      ?auto_342869 - BLOCK
      ?auto_342870 - BLOCK
      ?auto_342871 - BLOCK
      ?auto_342872 - BLOCK
      ?auto_342873 - BLOCK
      ?auto_342874 - BLOCK
      ?auto_342875 - BLOCK
      ?auto_342876 - BLOCK
      ?auto_342877 - BLOCK
      ?auto_342878 - BLOCK
      ?auto_342879 - BLOCK
      ?auto_342880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342880 ) ( ON-TABLE ?auto_342867 ) ( ON ?auto_342868 ?auto_342867 ) ( ON ?auto_342869 ?auto_342868 ) ( ON ?auto_342870 ?auto_342869 ) ( ON ?auto_342871 ?auto_342870 ) ( ON ?auto_342872 ?auto_342871 ) ( ON ?auto_342873 ?auto_342872 ) ( ON ?auto_342874 ?auto_342873 ) ( ON ?auto_342875 ?auto_342874 ) ( ON ?auto_342876 ?auto_342875 ) ( not ( = ?auto_342867 ?auto_342868 ) ) ( not ( = ?auto_342867 ?auto_342869 ) ) ( not ( = ?auto_342867 ?auto_342870 ) ) ( not ( = ?auto_342867 ?auto_342871 ) ) ( not ( = ?auto_342867 ?auto_342872 ) ) ( not ( = ?auto_342867 ?auto_342873 ) ) ( not ( = ?auto_342867 ?auto_342874 ) ) ( not ( = ?auto_342867 ?auto_342875 ) ) ( not ( = ?auto_342867 ?auto_342876 ) ) ( not ( = ?auto_342867 ?auto_342877 ) ) ( not ( = ?auto_342867 ?auto_342878 ) ) ( not ( = ?auto_342867 ?auto_342879 ) ) ( not ( = ?auto_342867 ?auto_342880 ) ) ( not ( = ?auto_342868 ?auto_342869 ) ) ( not ( = ?auto_342868 ?auto_342870 ) ) ( not ( = ?auto_342868 ?auto_342871 ) ) ( not ( = ?auto_342868 ?auto_342872 ) ) ( not ( = ?auto_342868 ?auto_342873 ) ) ( not ( = ?auto_342868 ?auto_342874 ) ) ( not ( = ?auto_342868 ?auto_342875 ) ) ( not ( = ?auto_342868 ?auto_342876 ) ) ( not ( = ?auto_342868 ?auto_342877 ) ) ( not ( = ?auto_342868 ?auto_342878 ) ) ( not ( = ?auto_342868 ?auto_342879 ) ) ( not ( = ?auto_342868 ?auto_342880 ) ) ( not ( = ?auto_342869 ?auto_342870 ) ) ( not ( = ?auto_342869 ?auto_342871 ) ) ( not ( = ?auto_342869 ?auto_342872 ) ) ( not ( = ?auto_342869 ?auto_342873 ) ) ( not ( = ?auto_342869 ?auto_342874 ) ) ( not ( = ?auto_342869 ?auto_342875 ) ) ( not ( = ?auto_342869 ?auto_342876 ) ) ( not ( = ?auto_342869 ?auto_342877 ) ) ( not ( = ?auto_342869 ?auto_342878 ) ) ( not ( = ?auto_342869 ?auto_342879 ) ) ( not ( = ?auto_342869 ?auto_342880 ) ) ( not ( = ?auto_342870 ?auto_342871 ) ) ( not ( = ?auto_342870 ?auto_342872 ) ) ( not ( = ?auto_342870 ?auto_342873 ) ) ( not ( = ?auto_342870 ?auto_342874 ) ) ( not ( = ?auto_342870 ?auto_342875 ) ) ( not ( = ?auto_342870 ?auto_342876 ) ) ( not ( = ?auto_342870 ?auto_342877 ) ) ( not ( = ?auto_342870 ?auto_342878 ) ) ( not ( = ?auto_342870 ?auto_342879 ) ) ( not ( = ?auto_342870 ?auto_342880 ) ) ( not ( = ?auto_342871 ?auto_342872 ) ) ( not ( = ?auto_342871 ?auto_342873 ) ) ( not ( = ?auto_342871 ?auto_342874 ) ) ( not ( = ?auto_342871 ?auto_342875 ) ) ( not ( = ?auto_342871 ?auto_342876 ) ) ( not ( = ?auto_342871 ?auto_342877 ) ) ( not ( = ?auto_342871 ?auto_342878 ) ) ( not ( = ?auto_342871 ?auto_342879 ) ) ( not ( = ?auto_342871 ?auto_342880 ) ) ( not ( = ?auto_342872 ?auto_342873 ) ) ( not ( = ?auto_342872 ?auto_342874 ) ) ( not ( = ?auto_342872 ?auto_342875 ) ) ( not ( = ?auto_342872 ?auto_342876 ) ) ( not ( = ?auto_342872 ?auto_342877 ) ) ( not ( = ?auto_342872 ?auto_342878 ) ) ( not ( = ?auto_342872 ?auto_342879 ) ) ( not ( = ?auto_342872 ?auto_342880 ) ) ( not ( = ?auto_342873 ?auto_342874 ) ) ( not ( = ?auto_342873 ?auto_342875 ) ) ( not ( = ?auto_342873 ?auto_342876 ) ) ( not ( = ?auto_342873 ?auto_342877 ) ) ( not ( = ?auto_342873 ?auto_342878 ) ) ( not ( = ?auto_342873 ?auto_342879 ) ) ( not ( = ?auto_342873 ?auto_342880 ) ) ( not ( = ?auto_342874 ?auto_342875 ) ) ( not ( = ?auto_342874 ?auto_342876 ) ) ( not ( = ?auto_342874 ?auto_342877 ) ) ( not ( = ?auto_342874 ?auto_342878 ) ) ( not ( = ?auto_342874 ?auto_342879 ) ) ( not ( = ?auto_342874 ?auto_342880 ) ) ( not ( = ?auto_342875 ?auto_342876 ) ) ( not ( = ?auto_342875 ?auto_342877 ) ) ( not ( = ?auto_342875 ?auto_342878 ) ) ( not ( = ?auto_342875 ?auto_342879 ) ) ( not ( = ?auto_342875 ?auto_342880 ) ) ( not ( = ?auto_342876 ?auto_342877 ) ) ( not ( = ?auto_342876 ?auto_342878 ) ) ( not ( = ?auto_342876 ?auto_342879 ) ) ( not ( = ?auto_342876 ?auto_342880 ) ) ( not ( = ?auto_342877 ?auto_342878 ) ) ( not ( = ?auto_342877 ?auto_342879 ) ) ( not ( = ?auto_342877 ?auto_342880 ) ) ( not ( = ?auto_342878 ?auto_342879 ) ) ( not ( = ?auto_342878 ?auto_342880 ) ) ( not ( = ?auto_342879 ?auto_342880 ) ) ( ON ?auto_342879 ?auto_342880 ) ( ON ?auto_342878 ?auto_342879 ) ( CLEAR ?auto_342876 ) ( ON ?auto_342877 ?auto_342878 ) ( CLEAR ?auto_342877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_342867 ?auto_342868 ?auto_342869 ?auto_342870 ?auto_342871 ?auto_342872 ?auto_342873 ?auto_342874 ?auto_342875 ?auto_342876 ?auto_342877 )
      ( MAKE-14PILE ?auto_342867 ?auto_342868 ?auto_342869 ?auto_342870 ?auto_342871 ?auto_342872 ?auto_342873 ?auto_342874 ?auto_342875 ?auto_342876 ?auto_342877 ?auto_342878 ?auto_342879 ?auto_342880 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342895 - BLOCK
      ?auto_342896 - BLOCK
      ?auto_342897 - BLOCK
      ?auto_342898 - BLOCK
      ?auto_342899 - BLOCK
      ?auto_342900 - BLOCK
      ?auto_342901 - BLOCK
      ?auto_342902 - BLOCK
      ?auto_342903 - BLOCK
      ?auto_342904 - BLOCK
      ?auto_342905 - BLOCK
      ?auto_342906 - BLOCK
      ?auto_342907 - BLOCK
      ?auto_342908 - BLOCK
    )
    :vars
    (
      ?auto_342909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342908 ?auto_342909 ) ( ON-TABLE ?auto_342895 ) ( ON ?auto_342896 ?auto_342895 ) ( ON ?auto_342897 ?auto_342896 ) ( ON ?auto_342898 ?auto_342897 ) ( ON ?auto_342899 ?auto_342898 ) ( ON ?auto_342900 ?auto_342899 ) ( ON ?auto_342901 ?auto_342900 ) ( ON ?auto_342902 ?auto_342901 ) ( ON ?auto_342903 ?auto_342902 ) ( not ( = ?auto_342895 ?auto_342896 ) ) ( not ( = ?auto_342895 ?auto_342897 ) ) ( not ( = ?auto_342895 ?auto_342898 ) ) ( not ( = ?auto_342895 ?auto_342899 ) ) ( not ( = ?auto_342895 ?auto_342900 ) ) ( not ( = ?auto_342895 ?auto_342901 ) ) ( not ( = ?auto_342895 ?auto_342902 ) ) ( not ( = ?auto_342895 ?auto_342903 ) ) ( not ( = ?auto_342895 ?auto_342904 ) ) ( not ( = ?auto_342895 ?auto_342905 ) ) ( not ( = ?auto_342895 ?auto_342906 ) ) ( not ( = ?auto_342895 ?auto_342907 ) ) ( not ( = ?auto_342895 ?auto_342908 ) ) ( not ( = ?auto_342895 ?auto_342909 ) ) ( not ( = ?auto_342896 ?auto_342897 ) ) ( not ( = ?auto_342896 ?auto_342898 ) ) ( not ( = ?auto_342896 ?auto_342899 ) ) ( not ( = ?auto_342896 ?auto_342900 ) ) ( not ( = ?auto_342896 ?auto_342901 ) ) ( not ( = ?auto_342896 ?auto_342902 ) ) ( not ( = ?auto_342896 ?auto_342903 ) ) ( not ( = ?auto_342896 ?auto_342904 ) ) ( not ( = ?auto_342896 ?auto_342905 ) ) ( not ( = ?auto_342896 ?auto_342906 ) ) ( not ( = ?auto_342896 ?auto_342907 ) ) ( not ( = ?auto_342896 ?auto_342908 ) ) ( not ( = ?auto_342896 ?auto_342909 ) ) ( not ( = ?auto_342897 ?auto_342898 ) ) ( not ( = ?auto_342897 ?auto_342899 ) ) ( not ( = ?auto_342897 ?auto_342900 ) ) ( not ( = ?auto_342897 ?auto_342901 ) ) ( not ( = ?auto_342897 ?auto_342902 ) ) ( not ( = ?auto_342897 ?auto_342903 ) ) ( not ( = ?auto_342897 ?auto_342904 ) ) ( not ( = ?auto_342897 ?auto_342905 ) ) ( not ( = ?auto_342897 ?auto_342906 ) ) ( not ( = ?auto_342897 ?auto_342907 ) ) ( not ( = ?auto_342897 ?auto_342908 ) ) ( not ( = ?auto_342897 ?auto_342909 ) ) ( not ( = ?auto_342898 ?auto_342899 ) ) ( not ( = ?auto_342898 ?auto_342900 ) ) ( not ( = ?auto_342898 ?auto_342901 ) ) ( not ( = ?auto_342898 ?auto_342902 ) ) ( not ( = ?auto_342898 ?auto_342903 ) ) ( not ( = ?auto_342898 ?auto_342904 ) ) ( not ( = ?auto_342898 ?auto_342905 ) ) ( not ( = ?auto_342898 ?auto_342906 ) ) ( not ( = ?auto_342898 ?auto_342907 ) ) ( not ( = ?auto_342898 ?auto_342908 ) ) ( not ( = ?auto_342898 ?auto_342909 ) ) ( not ( = ?auto_342899 ?auto_342900 ) ) ( not ( = ?auto_342899 ?auto_342901 ) ) ( not ( = ?auto_342899 ?auto_342902 ) ) ( not ( = ?auto_342899 ?auto_342903 ) ) ( not ( = ?auto_342899 ?auto_342904 ) ) ( not ( = ?auto_342899 ?auto_342905 ) ) ( not ( = ?auto_342899 ?auto_342906 ) ) ( not ( = ?auto_342899 ?auto_342907 ) ) ( not ( = ?auto_342899 ?auto_342908 ) ) ( not ( = ?auto_342899 ?auto_342909 ) ) ( not ( = ?auto_342900 ?auto_342901 ) ) ( not ( = ?auto_342900 ?auto_342902 ) ) ( not ( = ?auto_342900 ?auto_342903 ) ) ( not ( = ?auto_342900 ?auto_342904 ) ) ( not ( = ?auto_342900 ?auto_342905 ) ) ( not ( = ?auto_342900 ?auto_342906 ) ) ( not ( = ?auto_342900 ?auto_342907 ) ) ( not ( = ?auto_342900 ?auto_342908 ) ) ( not ( = ?auto_342900 ?auto_342909 ) ) ( not ( = ?auto_342901 ?auto_342902 ) ) ( not ( = ?auto_342901 ?auto_342903 ) ) ( not ( = ?auto_342901 ?auto_342904 ) ) ( not ( = ?auto_342901 ?auto_342905 ) ) ( not ( = ?auto_342901 ?auto_342906 ) ) ( not ( = ?auto_342901 ?auto_342907 ) ) ( not ( = ?auto_342901 ?auto_342908 ) ) ( not ( = ?auto_342901 ?auto_342909 ) ) ( not ( = ?auto_342902 ?auto_342903 ) ) ( not ( = ?auto_342902 ?auto_342904 ) ) ( not ( = ?auto_342902 ?auto_342905 ) ) ( not ( = ?auto_342902 ?auto_342906 ) ) ( not ( = ?auto_342902 ?auto_342907 ) ) ( not ( = ?auto_342902 ?auto_342908 ) ) ( not ( = ?auto_342902 ?auto_342909 ) ) ( not ( = ?auto_342903 ?auto_342904 ) ) ( not ( = ?auto_342903 ?auto_342905 ) ) ( not ( = ?auto_342903 ?auto_342906 ) ) ( not ( = ?auto_342903 ?auto_342907 ) ) ( not ( = ?auto_342903 ?auto_342908 ) ) ( not ( = ?auto_342903 ?auto_342909 ) ) ( not ( = ?auto_342904 ?auto_342905 ) ) ( not ( = ?auto_342904 ?auto_342906 ) ) ( not ( = ?auto_342904 ?auto_342907 ) ) ( not ( = ?auto_342904 ?auto_342908 ) ) ( not ( = ?auto_342904 ?auto_342909 ) ) ( not ( = ?auto_342905 ?auto_342906 ) ) ( not ( = ?auto_342905 ?auto_342907 ) ) ( not ( = ?auto_342905 ?auto_342908 ) ) ( not ( = ?auto_342905 ?auto_342909 ) ) ( not ( = ?auto_342906 ?auto_342907 ) ) ( not ( = ?auto_342906 ?auto_342908 ) ) ( not ( = ?auto_342906 ?auto_342909 ) ) ( not ( = ?auto_342907 ?auto_342908 ) ) ( not ( = ?auto_342907 ?auto_342909 ) ) ( not ( = ?auto_342908 ?auto_342909 ) ) ( ON ?auto_342907 ?auto_342908 ) ( ON ?auto_342906 ?auto_342907 ) ( ON ?auto_342905 ?auto_342906 ) ( CLEAR ?auto_342903 ) ( ON ?auto_342904 ?auto_342905 ) ( CLEAR ?auto_342904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_342895 ?auto_342896 ?auto_342897 ?auto_342898 ?auto_342899 ?auto_342900 ?auto_342901 ?auto_342902 ?auto_342903 ?auto_342904 )
      ( MAKE-14PILE ?auto_342895 ?auto_342896 ?auto_342897 ?auto_342898 ?auto_342899 ?auto_342900 ?auto_342901 ?auto_342902 ?auto_342903 ?auto_342904 ?auto_342905 ?auto_342906 ?auto_342907 ?auto_342908 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342924 - BLOCK
      ?auto_342925 - BLOCK
      ?auto_342926 - BLOCK
      ?auto_342927 - BLOCK
      ?auto_342928 - BLOCK
      ?auto_342929 - BLOCK
      ?auto_342930 - BLOCK
      ?auto_342931 - BLOCK
      ?auto_342932 - BLOCK
      ?auto_342933 - BLOCK
      ?auto_342934 - BLOCK
      ?auto_342935 - BLOCK
      ?auto_342936 - BLOCK
      ?auto_342937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342937 ) ( ON-TABLE ?auto_342924 ) ( ON ?auto_342925 ?auto_342924 ) ( ON ?auto_342926 ?auto_342925 ) ( ON ?auto_342927 ?auto_342926 ) ( ON ?auto_342928 ?auto_342927 ) ( ON ?auto_342929 ?auto_342928 ) ( ON ?auto_342930 ?auto_342929 ) ( ON ?auto_342931 ?auto_342930 ) ( ON ?auto_342932 ?auto_342931 ) ( not ( = ?auto_342924 ?auto_342925 ) ) ( not ( = ?auto_342924 ?auto_342926 ) ) ( not ( = ?auto_342924 ?auto_342927 ) ) ( not ( = ?auto_342924 ?auto_342928 ) ) ( not ( = ?auto_342924 ?auto_342929 ) ) ( not ( = ?auto_342924 ?auto_342930 ) ) ( not ( = ?auto_342924 ?auto_342931 ) ) ( not ( = ?auto_342924 ?auto_342932 ) ) ( not ( = ?auto_342924 ?auto_342933 ) ) ( not ( = ?auto_342924 ?auto_342934 ) ) ( not ( = ?auto_342924 ?auto_342935 ) ) ( not ( = ?auto_342924 ?auto_342936 ) ) ( not ( = ?auto_342924 ?auto_342937 ) ) ( not ( = ?auto_342925 ?auto_342926 ) ) ( not ( = ?auto_342925 ?auto_342927 ) ) ( not ( = ?auto_342925 ?auto_342928 ) ) ( not ( = ?auto_342925 ?auto_342929 ) ) ( not ( = ?auto_342925 ?auto_342930 ) ) ( not ( = ?auto_342925 ?auto_342931 ) ) ( not ( = ?auto_342925 ?auto_342932 ) ) ( not ( = ?auto_342925 ?auto_342933 ) ) ( not ( = ?auto_342925 ?auto_342934 ) ) ( not ( = ?auto_342925 ?auto_342935 ) ) ( not ( = ?auto_342925 ?auto_342936 ) ) ( not ( = ?auto_342925 ?auto_342937 ) ) ( not ( = ?auto_342926 ?auto_342927 ) ) ( not ( = ?auto_342926 ?auto_342928 ) ) ( not ( = ?auto_342926 ?auto_342929 ) ) ( not ( = ?auto_342926 ?auto_342930 ) ) ( not ( = ?auto_342926 ?auto_342931 ) ) ( not ( = ?auto_342926 ?auto_342932 ) ) ( not ( = ?auto_342926 ?auto_342933 ) ) ( not ( = ?auto_342926 ?auto_342934 ) ) ( not ( = ?auto_342926 ?auto_342935 ) ) ( not ( = ?auto_342926 ?auto_342936 ) ) ( not ( = ?auto_342926 ?auto_342937 ) ) ( not ( = ?auto_342927 ?auto_342928 ) ) ( not ( = ?auto_342927 ?auto_342929 ) ) ( not ( = ?auto_342927 ?auto_342930 ) ) ( not ( = ?auto_342927 ?auto_342931 ) ) ( not ( = ?auto_342927 ?auto_342932 ) ) ( not ( = ?auto_342927 ?auto_342933 ) ) ( not ( = ?auto_342927 ?auto_342934 ) ) ( not ( = ?auto_342927 ?auto_342935 ) ) ( not ( = ?auto_342927 ?auto_342936 ) ) ( not ( = ?auto_342927 ?auto_342937 ) ) ( not ( = ?auto_342928 ?auto_342929 ) ) ( not ( = ?auto_342928 ?auto_342930 ) ) ( not ( = ?auto_342928 ?auto_342931 ) ) ( not ( = ?auto_342928 ?auto_342932 ) ) ( not ( = ?auto_342928 ?auto_342933 ) ) ( not ( = ?auto_342928 ?auto_342934 ) ) ( not ( = ?auto_342928 ?auto_342935 ) ) ( not ( = ?auto_342928 ?auto_342936 ) ) ( not ( = ?auto_342928 ?auto_342937 ) ) ( not ( = ?auto_342929 ?auto_342930 ) ) ( not ( = ?auto_342929 ?auto_342931 ) ) ( not ( = ?auto_342929 ?auto_342932 ) ) ( not ( = ?auto_342929 ?auto_342933 ) ) ( not ( = ?auto_342929 ?auto_342934 ) ) ( not ( = ?auto_342929 ?auto_342935 ) ) ( not ( = ?auto_342929 ?auto_342936 ) ) ( not ( = ?auto_342929 ?auto_342937 ) ) ( not ( = ?auto_342930 ?auto_342931 ) ) ( not ( = ?auto_342930 ?auto_342932 ) ) ( not ( = ?auto_342930 ?auto_342933 ) ) ( not ( = ?auto_342930 ?auto_342934 ) ) ( not ( = ?auto_342930 ?auto_342935 ) ) ( not ( = ?auto_342930 ?auto_342936 ) ) ( not ( = ?auto_342930 ?auto_342937 ) ) ( not ( = ?auto_342931 ?auto_342932 ) ) ( not ( = ?auto_342931 ?auto_342933 ) ) ( not ( = ?auto_342931 ?auto_342934 ) ) ( not ( = ?auto_342931 ?auto_342935 ) ) ( not ( = ?auto_342931 ?auto_342936 ) ) ( not ( = ?auto_342931 ?auto_342937 ) ) ( not ( = ?auto_342932 ?auto_342933 ) ) ( not ( = ?auto_342932 ?auto_342934 ) ) ( not ( = ?auto_342932 ?auto_342935 ) ) ( not ( = ?auto_342932 ?auto_342936 ) ) ( not ( = ?auto_342932 ?auto_342937 ) ) ( not ( = ?auto_342933 ?auto_342934 ) ) ( not ( = ?auto_342933 ?auto_342935 ) ) ( not ( = ?auto_342933 ?auto_342936 ) ) ( not ( = ?auto_342933 ?auto_342937 ) ) ( not ( = ?auto_342934 ?auto_342935 ) ) ( not ( = ?auto_342934 ?auto_342936 ) ) ( not ( = ?auto_342934 ?auto_342937 ) ) ( not ( = ?auto_342935 ?auto_342936 ) ) ( not ( = ?auto_342935 ?auto_342937 ) ) ( not ( = ?auto_342936 ?auto_342937 ) ) ( ON ?auto_342936 ?auto_342937 ) ( ON ?auto_342935 ?auto_342936 ) ( ON ?auto_342934 ?auto_342935 ) ( CLEAR ?auto_342932 ) ( ON ?auto_342933 ?auto_342934 ) ( CLEAR ?auto_342933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_342924 ?auto_342925 ?auto_342926 ?auto_342927 ?auto_342928 ?auto_342929 ?auto_342930 ?auto_342931 ?auto_342932 ?auto_342933 )
      ( MAKE-14PILE ?auto_342924 ?auto_342925 ?auto_342926 ?auto_342927 ?auto_342928 ?auto_342929 ?auto_342930 ?auto_342931 ?auto_342932 ?auto_342933 ?auto_342934 ?auto_342935 ?auto_342936 ?auto_342937 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342952 - BLOCK
      ?auto_342953 - BLOCK
      ?auto_342954 - BLOCK
      ?auto_342955 - BLOCK
      ?auto_342956 - BLOCK
      ?auto_342957 - BLOCK
      ?auto_342958 - BLOCK
      ?auto_342959 - BLOCK
      ?auto_342960 - BLOCK
      ?auto_342961 - BLOCK
      ?auto_342962 - BLOCK
      ?auto_342963 - BLOCK
      ?auto_342964 - BLOCK
      ?auto_342965 - BLOCK
    )
    :vars
    (
      ?auto_342966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_342965 ?auto_342966 ) ( ON-TABLE ?auto_342952 ) ( ON ?auto_342953 ?auto_342952 ) ( ON ?auto_342954 ?auto_342953 ) ( ON ?auto_342955 ?auto_342954 ) ( ON ?auto_342956 ?auto_342955 ) ( ON ?auto_342957 ?auto_342956 ) ( ON ?auto_342958 ?auto_342957 ) ( ON ?auto_342959 ?auto_342958 ) ( not ( = ?auto_342952 ?auto_342953 ) ) ( not ( = ?auto_342952 ?auto_342954 ) ) ( not ( = ?auto_342952 ?auto_342955 ) ) ( not ( = ?auto_342952 ?auto_342956 ) ) ( not ( = ?auto_342952 ?auto_342957 ) ) ( not ( = ?auto_342952 ?auto_342958 ) ) ( not ( = ?auto_342952 ?auto_342959 ) ) ( not ( = ?auto_342952 ?auto_342960 ) ) ( not ( = ?auto_342952 ?auto_342961 ) ) ( not ( = ?auto_342952 ?auto_342962 ) ) ( not ( = ?auto_342952 ?auto_342963 ) ) ( not ( = ?auto_342952 ?auto_342964 ) ) ( not ( = ?auto_342952 ?auto_342965 ) ) ( not ( = ?auto_342952 ?auto_342966 ) ) ( not ( = ?auto_342953 ?auto_342954 ) ) ( not ( = ?auto_342953 ?auto_342955 ) ) ( not ( = ?auto_342953 ?auto_342956 ) ) ( not ( = ?auto_342953 ?auto_342957 ) ) ( not ( = ?auto_342953 ?auto_342958 ) ) ( not ( = ?auto_342953 ?auto_342959 ) ) ( not ( = ?auto_342953 ?auto_342960 ) ) ( not ( = ?auto_342953 ?auto_342961 ) ) ( not ( = ?auto_342953 ?auto_342962 ) ) ( not ( = ?auto_342953 ?auto_342963 ) ) ( not ( = ?auto_342953 ?auto_342964 ) ) ( not ( = ?auto_342953 ?auto_342965 ) ) ( not ( = ?auto_342953 ?auto_342966 ) ) ( not ( = ?auto_342954 ?auto_342955 ) ) ( not ( = ?auto_342954 ?auto_342956 ) ) ( not ( = ?auto_342954 ?auto_342957 ) ) ( not ( = ?auto_342954 ?auto_342958 ) ) ( not ( = ?auto_342954 ?auto_342959 ) ) ( not ( = ?auto_342954 ?auto_342960 ) ) ( not ( = ?auto_342954 ?auto_342961 ) ) ( not ( = ?auto_342954 ?auto_342962 ) ) ( not ( = ?auto_342954 ?auto_342963 ) ) ( not ( = ?auto_342954 ?auto_342964 ) ) ( not ( = ?auto_342954 ?auto_342965 ) ) ( not ( = ?auto_342954 ?auto_342966 ) ) ( not ( = ?auto_342955 ?auto_342956 ) ) ( not ( = ?auto_342955 ?auto_342957 ) ) ( not ( = ?auto_342955 ?auto_342958 ) ) ( not ( = ?auto_342955 ?auto_342959 ) ) ( not ( = ?auto_342955 ?auto_342960 ) ) ( not ( = ?auto_342955 ?auto_342961 ) ) ( not ( = ?auto_342955 ?auto_342962 ) ) ( not ( = ?auto_342955 ?auto_342963 ) ) ( not ( = ?auto_342955 ?auto_342964 ) ) ( not ( = ?auto_342955 ?auto_342965 ) ) ( not ( = ?auto_342955 ?auto_342966 ) ) ( not ( = ?auto_342956 ?auto_342957 ) ) ( not ( = ?auto_342956 ?auto_342958 ) ) ( not ( = ?auto_342956 ?auto_342959 ) ) ( not ( = ?auto_342956 ?auto_342960 ) ) ( not ( = ?auto_342956 ?auto_342961 ) ) ( not ( = ?auto_342956 ?auto_342962 ) ) ( not ( = ?auto_342956 ?auto_342963 ) ) ( not ( = ?auto_342956 ?auto_342964 ) ) ( not ( = ?auto_342956 ?auto_342965 ) ) ( not ( = ?auto_342956 ?auto_342966 ) ) ( not ( = ?auto_342957 ?auto_342958 ) ) ( not ( = ?auto_342957 ?auto_342959 ) ) ( not ( = ?auto_342957 ?auto_342960 ) ) ( not ( = ?auto_342957 ?auto_342961 ) ) ( not ( = ?auto_342957 ?auto_342962 ) ) ( not ( = ?auto_342957 ?auto_342963 ) ) ( not ( = ?auto_342957 ?auto_342964 ) ) ( not ( = ?auto_342957 ?auto_342965 ) ) ( not ( = ?auto_342957 ?auto_342966 ) ) ( not ( = ?auto_342958 ?auto_342959 ) ) ( not ( = ?auto_342958 ?auto_342960 ) ) ( not ( = ?auto_342958 ?auto_342961 ) ) ( not ( = ?auto_342958 ?auto_342962 ) ) ( not ( = ?auto_342958 ?auto_342963 ) ) ( not ( = ?auto_342958 ?auto_342964 ) ) ( not ( = ?auto_342958 ?auto_342965 ) ) ( not ( = ?auto_342958 ?auto_342966 ) ) ( not ( = ?auto_342959 ?auto_342960 ) ) ( not ( = ?auto_342959 ?auto_342961 ) ) ( not ( = ?auto_342959 ?auto_342962 ) ) ( not ( = ?auto_342959 ?auto_342963 ) ) ( not ( = ?auto_342959 ?auto_342964 ) ) ( not ( = ?auto_342959 ?auto_342965 ) ) ( not ( = ?auto_342959 ?auto_342966 ) ) ( not ( = ?auto_342960 ?auto_342961 ) ) ( not ( = ?auto_342960 ?auto_342962 ) ) ( not ( = ?auto_342960 ?auto_342963 ) ) ( not ( = ?auto_342960 ?auto_342964 ) ) ( not ( = ?auto_342960 ?auto_342965 ) ) ( not ( = ?auto_342960 ?auto_342966 ) ) ( not ( = ?auto_342961 ?auto_342962 ) ) ( not ( = ?auto_342961 ?auto_342963 ) ) ( not ( = ?auto_342961 ?auto_342964 ) ) ( not ( = ?auto_342961 ?auto_342965 ) ) ( not ( = ?auto_342961 ?auto_342966 ) ) ( not ( = ?auto_342962 ?auto_342963 ) ) ( not ( = ?auto_342962 ?auto_342964 ) ) ( not ( = ?auto_342962 ?auto_342965 ) ) ( not ( = ?auto_342962 ?auto_342966 ) ) ( not ( = ?auto_342963 ?auto_342964 ) ) ( not ( = ?auto_342963 ?auto_342965 ) ) ( not ( = ?auto_342963 ?auto_342966 ) ) ( not ( = ?auto_342964 ?auto_342965 ) ) ( not ( = ?auto_342964 ?auto_342966 ) ) ( not ( = ?auto_342965 ?auto_342966 ) ) ( ON ?auto_342964 ?auto_342965 ) ( ON ?auto_342963 ?auto_342964 ) ( ON ?auto_342962 ?auto_342963 ) ( ON ?auto_342961 ?auto_342962 ) ( CLEAR ?auto_342959 ) ( ON ?auto_342960 ?auto_342961 ) ( CLEAR ?auto_342960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_342952 ?auto_342953 ?auto_342954 ?auto_342955 ?auto_342956 ?auto_342957 ?auto_342958 ?auto_342959 ?auto_342960 )
      ( MAKE-14PILE ?auto_342952 ?auto_342953 ?auto_342954 ?auto_342955 ?auto_342956 ?auto_342957 ?auto_342958 ?auto_342959 ?auto_342960 ?auto_342961 ?auto_342962 ?auto_342963 ?auto_342964 ?auto_342965 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_342981 - BLOCK
      ?auto_342982 - BLOCK
      ?auto_342983 - BLOCK
      ?auto_342984 - BLOCK
      ?auto_342985 - BLOCK
      ?auto_342986 - BLOCK
      ?auto_342987 - BLOCK
      ?auto_342988 - BLOCK
      ?auto_342989 - BLOCK
      ?auto_342990 - BLOCK
      ?auto_342991 - BLOCK
      ?auto_342992 - BLOCK
      ?auto_342993 - BLOCK
      ?auto_342994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342994 ) ( ON-TABLE ?auto_342981 ) ( ON ?auto_342982 ?auto_342981 ) ( ON ?auto_342983 ?auto_342982 ) ( ON ?auto_342984 ?auto_342983 ) ( ON ?auto_342985 ?auto_342984 ) ( ON ?auto_342986 ?auto_342985 ) ( ON ?auto_342987 ?auto_342986 ) ( ON ?auto_342988 ?auto_342987 ) ( not ( = ?auto_342981 ?auto_342982 ) ) ( not ( = ?auto_342981 ?auto_342983 ) ) ( not ( = ?auto_342981 ?auto_342984 ) ) ( not ( = ?auto_342981 ?auto_342985 ) ) ( not ( = ?auto_342981 ?auto_342986 ) ) ( not ( = ?auto_342981 ?auto_342987 ) ) ( not ( = ?auto_342981 ?auto_342988 ) ) ( not ( = ?auto_342981 ?auto_342989 ) ) ( not ( = ?auto_342981 ?auto_342990 ) ) ( not ( = ?auto_342981 ?auto_342991 ) ) ( not ( = ?auto_342981 ?auto_342992 ) ) ( not ( = ?auto_342981 ?auto_342993 ) ) ( not ( = ?auto_342981 ?auto_342994 ) ) ( not ( = ?auto_342982 ?auto_342983 ) ) ( not ( = ?auto_342982 ?auto_342984 ) ) ( not ( = ?auto_342982 ?auto_342985 ) ) ( not ( = ?auto_342982 ?auto_342986 ) ) ( not ( = ?auto_342982 ?auto_342987 ) ) ( not ( = ?auto_342982 ?auto_342988 ) ) ( not ( = ?auto_342982 ?auto_342989 ) ) ( not ( = ?auto_342982 ?auto_342990 ) ) ( not ( = ?auto_342982 ?auto_342991 ) ) ( not ( = ?auto_342982 ?auto_342992 ) ) ( not ( = ?auto_342982 ?auto_342993 ) ) ( not ( = ?auto_342982 ?auto_342994 ) ) ( not ( = ?auto_342983 ?auto_342984 ) ) ( not ( = ?auto_342983 ?auto_342985 ) ) ( not ( = ?auto_342983 ?auto_342986 ) ) ( not ( = ?auto_342983 ?auto_342987 ) ) ( not ( = ?auto_342983 ?auto_342988 ) ) ( not ( = ?auto_342983 ?auto_342989 ) ) ( not ( = ?auto_342983 ?auto_342990 ) ) ( not ( = ?auto_342983 ?auto_342991 ) ) ( not ( = ?auto_342983 ?auto_342992 ) ) ( not ( = ?auto_342983 ?auto_342993 ) ) ( not ( = ?auto_342983 ?auto_342994 ) ) ( not ( = ?auto_342984 ?auto_342985 ) ) ( not ( = ?auto_342984 ?auto_342986 ) ) ( not ( = ?auto_342984 ?auto_342987 ) ) ( not ( = ?auto_342984 ?auto_342988 ) ) ( not ( = ?auto_342984 ?auto_342989 ) ) ( not ( = ?auto_342984 ?auto_342990 ) ) ( not ( = ?auto_342984 ?auto_342991 ) ) ( not ( = ?auto_342984 ?auto_342992 ) ) ( not ( = ?auto_342984 ?auto_342993 ) ) ( not ( = ?auto_342984 ?auto_342994 ) ) ( not ( = ?auto_342985 ?auto_342986 ) ) ( not ( = ?auto_342985 ?auto_342987 ) ) ( not ( = ?auto_342985 ?auto_342988 ) ) ( not ( = ?auto_342985 ?auto_342989 ) ) ( not ( = ?auto_342985 ?auto_342990 ) ) ( not ( = ?auto_342985 ?auto_342991 ) ) ( not ( = ?auto_342985 ?auto_342992 ) ) ( not ( = ?auto_342985 ?auto_342993 ) ) ( not ( = ?auto_342985 ?auto_342994 ) ) ( not ( = ?auto_342986 ?auto_342987 ) ) ( not ( = ?auto_342986 ?auto_342988 ) ) ( not ( = ?auto_342986 ?auto_342989 ) ) ( not ( = ?auto_342986 ?auto_342990 ) ) ( not ( = ?auto_342986 ?auto_342991 ) ) ( not ( = ?auto_342986 ?auto_342992 ) ) ( not ( = ?auto_342986 ?auto_342993 ) ) ( not ( = ?auto_342986 ?auto_342994 ) ) ( not ( = ?auto_342987 ?auto_342988 ) ) ( not ( = ?auto_342987 ?auto_342989 ) ) ( not ( = ?auto_342987 ?auto_342990 ) ) ( not ( = ?auto_342987 ?auto_342991 ) ) ( not ( = ?auto_342987 ?auto_342992 ) ) ( not ( = ?auto_342987 ?auto_342993 ) ) ( not ( = ?auto_342987 ?auto_342994 ) ) ( not ( = ?auto_342988 ?auto_342989 ) ) ( not ( = ?auto_342988 ?auto_342990 ) ) ( not ( = ?auto_342988 ?auto_342991 ) ) ( not ( = ?auto_342988 ?auto_342992 ) ) ( not ( = ?auto_342988 ?auto_342993 ) ) ( not ( = ?auto_342988 ?auto_342994 ) ) ( not ( = ?auto_342989 ?auto_342990 ) ) ( not ( = ?auto_342989 ?auto_342991 ) ) ( not ( = ?auto_342989 ?auto_342992 ) ) ( not ( = ?auto_342989 ?auto_342993 ) ) ( not ( = ?auto_342989 ?auto_342994 ) ) ( not ( = ?auto_342990 ?auto_342991 ) ) ( not ( = ?auto_342990 ?auto_342992 ) ) ( not ( = ?auto_342990 ?auto_342993 ) ) ( not ( = ?auto_342990 ?auto_342994 ) ) ( not ( = ?auto_342991 ?auto_342992 ) ) ( not ( = ?auto_342991 ?auto_342993 ) ) ( not ( = ?auto_342991 ?auto_342994 ) ) ( not ( = ?auto_342992 ?auto_342993 ) ) ( not ( = ?auto_342992 ?auto_342994 ) ) ( not ( = ?auto_342993 ?auto_342994 ) ) ( ON ?auto_342993 ?auto_342994 ) ( ON ?auto_342992 ?auto_342993 ) ( ON ?auto_342991 ?auto_342992 ) ( ON ?auto_342990 ?auto_342991 ) ( CLEAR ?auto_342988 ) ( ON ?auto_342989 ?auto_342990 ) ( CLEAR ?auto_342989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_342981 ?auto_342982 ?auto_342983 ?auto_342984 ?auto_342985 ?auto_342986 ?auto_342987 ?auto_342988 ?auto_342989 )
      ( MAKE-14PILE ?auto_342981 ?auto_342982 ?auto_342983 ?auto_342984 ?auto_342985 ?auto_342986 ?auto_342987 ?auto_342988 ?auto_342989 ?auto_342990 ?auto_342991 ?auto_342992 ?auto_342993 ?auto_342994 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343009 - BLOCK
      ?auto_343010 - BLOCK
      ?auto_343011 - BLOCK
      ?auto_343012 - BLOCK
      ?auto_343013 - BLOCK
      ?auto_343014 - BLOCK
      ?auto_343015 - BLOCK
      ?auto_343016 - BLOCK
      ?auto_343017 - BLOCK
      ?auto_343018 - BLOCK
      ?auto_343019 - BLOCK
      ?auto_343020 - BLOCK
      ?auto_343021 - BLOCK
      ?auto_343022 - BLOCK
    )
    :vars
    (
      ?auto_343023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343022 ?auto_343023 ) ( ON-TABLE ?auto_343009 ) ( ON ?auto_343010 ?auto_343009 ) ( ON ?auto_343011 ?auto_343010 ) ( ON ?auto_343012 ?auto_343011 ) ( ON ?auto_343013 ?auto_343012 ) ( ON ?auto_343014 ?auto_343013 ) ( ON ?auto_343015 ?auto_343014 ) ( not ( = ?auto_343009 ?auto_343010 ) ) ( not ( = ?auto_343009 ?auto_343011 ) ) ( not ( = ?auto_343009 ?auto_343012 ) ) ( not ( = ?auto_343009 ?auto_343013 ) ) ( not ( = ?auto_343009 ?auto_343014 ) ) ( not ( = ?auto_343009 ?auto_343015 ) ) ( not ( = ?auto_343009 ?auto_343016 ) ) ( not ( = ?auto_343009 ?auto_343017 ) ) ( not ( = ?auto_343009 ?auto_343018 ) ) ( not ( = ?auto_343009 ?auto_343019 ) ) ( not ( = ?auto_343009 ?auto_343020 ) ) ( not ( = ?auto_343009 ?auto_343021 ) ) ( not ( = ?auto_343009 ?auto_343022 ) ) ( not ( = ?auto_343009 ?auto_343023 ) ) ( not ( = ?auto_343010 ?auto_343011 ) ) ( not ( = ?auto_343010 ?auto_343012 ) ) ( not ( = ?auto_343010 ?auto_343013 ) ) ( not ( = ?auto_343010 ?auto_343014 ) ) ( not ( = ?auto_343010 ?auto_343015 ) ) ( not ( = ?auto_343010 ?auto_343016 ) ) ( not ( = ?auto_343010 ?auto_343017 ) ) ( not ( = ?auto_343010 ?auto_343018 ) ) ( not ( = ?auto_343010 ?auto_343019 ) ) ( not ( = ?auto_343010 ?auto_343020 ) ) ( not ( = ?auto_343010 ?auto_343021 ) ) ( not ( = ?auto_343010 ?auto_343022 ) ) ( not ( = ?auto_343010 ?auto_343023 ) ) ( not ( = ?auto_343011 ?auto_343012 ) ) ( not ( = ?auto_343011 ?auto_343013 ) ) ( not ( = ?auto_343011 ?auto_343014 ) ) ( not ( = ?auto_343011 ?auto_343015 ) ) ( not ( = ?auto_343011 ?auto_343016 ) ) ( not ( = ?auto_343011 ?auto_343017 ) ) ( not ( = ?auto_343011 ?auto_343018 ) ) ( not ( = ?auto_343011 ?auto_343019 ) ) ( not ( = ?auto_343011 ?auto_343020 ) ) ( not ( = ?auto_343011 ?auto_343021 ) ) ( not ( = ?auto_343011 ?auto_343022 ) ) ( not ( = ?auto_343011 ?auto_343023 ) ) ( not ( = ?auto_343012 ?auto_343013 ) ) ( not ( = ?auto_343012 ?auto_343014 ) ) ( not ( = ?auto_343012 ?auto_343015 ) ) ( not ( = ?auto_343012 ?auto_343016 ) ) ( not ( = ?auto_343012 ?auto_343017 ) ) ( not ( = ?auto_343012 ?auto_343018 ) ) ( not ( = ?auto_343012 ?auto_343019 ) ) ( not ( = ?auto_343012 ?auto_343020 ) ) ( not ( = ?auto_343012 ?auto_343021 ) ) ( not ( = ?auto_343012 ?auto_343022 ) ) ( not ( = ?auto_343012 ?auto_343023 ) ) ( not ( = ?auto_343013 ?auto_343014 ) ) ( not ( = ?auto_343013 ?auto_343015 ) ) ( not ( = ?auto_343013 ?auto_343016 ) ) ( not ( = ?auto_343013 ?auto_343017 ) ) ( not ( = ?auto_343013 ?auto_343018 ) ) ( not ( = ?auto_343013 ?auto_343019 ) ) ( not ( = ?auto_343013 ?auto_343020 ) ) ( not ( = ?auto_343013 ?auto_343021 ) ) ( not ( = ?auto_343013 ?auto_343022 ) ) ( not ( = ?auto_343013 ?auto_343023 ) ) ( not ( = ?auto_343014 ?auto_343015 ) ) ( not ( = ?auto_343014 ?auto_343016 ) ) ( not ( = ?auto_343014 ?auto_343017 ) ) ( not ( = ?auto_343014 ?auto_343018 ) ) ( not ( = ?auto_343014 ?auto_343019 ) ) ( not ( = ?auto_343014 ?auto_343020 ) ) ( not ( = ?auto_343014 ?auto_343021 ) ) ( not ( = ?auto_343014 ?auto_343022 ) ) ( not ( = ?auto_343014 ?auto_343023 ) ) ( not ( = ?auto_343015 ?auto_343016 ) ) ( not ( = ?auto_343015 ?auto_343017 ) ) ( not ( = ?auto_343015 ?auto_343018 ) ) ( not ( = ?auto_343015 ?auto_343019 ) ) ( not ( = ?auto_343015 ?auto_343020 ) ) ( not ( = ?auto_343015 ?auto_343021 ) ) ( not ( = ?auto_343015 ?auto_343022 ) ) ( not ( = ?auto_343015 ?auto_343023 ) ) ( not ( = ?auto_343016 ?auto_343017 ) ) ( not ( = ?auto_343016 ?auto_343018 ) ) ( not ( = ?auto_343016 ?auto_343019 ) ) ( not ( = ?auto_343016 ?auto_343020 ) ) ( not ( = ?auto_343016 ?auto_343021 ) ) ( not ( = ?auto_343016 ?auto_343022 ) ) ( not ( = ?auto_343016 ?auto_343023 ) ) ( not ( = ?auto_343017 ?auto_343018 ) ) ( not ( = ?auto_343017 ?auto_343019 ) ) ( not ( = ?auto_343017 ?auto_343020 ) ) ( not ( = ?auto_343017 ?auto_343021 ) ) ( not ( = ?auto_343017 ?auto_343022 ) ) ( not ( = ?auto_343017 ?auto_343023 ) ) ( not ( = ?auto_343018 ?auto_343019 ) ) ( not ( = ?auto_343018 ?auto_343020 ) ) ( not ( = ?auto_343018 ?auto_343021 ) ) ( not ( = ?auto_343018 ?auto_343022 ) ) ( not ( = ?auto_343018 ?auto_343023 ) ) ( not ( = ?auto_343019 ?auto_343020 ) ) ( not ( = ?auto_343019 ?auto_343021 ) ) ( not ( = ?auto_343019 ?auto_343022 ) ) ( not ( = ?auto_343019 ?auto_343023 ) ) ( not ( = ?auto_343020 ?auto_343021 ) ) ( not ( = ?auto_343020 ?auto_343022 ) ) ( not ( = ?auto_343020 ?auto_343023 ) ) ( not ( = ?auto_343021 ?auto_343022 ) ) ( not ( = ?auto_343021 ?auto_343023 ) ) ( not ( = ?auto_343022 ?auto_343023 ) ) ( ON ?auto_343021 ?auto_343022 ) ( ON ?auto_343020 ?auto_343021 ) ( ON ?auto_343019 ?auto_343020 ) ( ON ?auto_343018 ?auto_343019 ) ( ON ?auto_343017 ?auto_343018 ) ( CLEAR ?auto_343015 ) ( ON ?auto_343016 ?auto_343017 ) ( CLEAR ?auto_343016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_343009 ?auto_343010 ?auto_343011 ?auto_343012 ?auto_343013 ?auto_343014 ?auto_343015 ?auto_343016 )
      ( MAKE-14PILE ?auto_343009 ?auto_343010 ?auto_343011 ?auto_343012 ?auto_343013 ?auto_343014 ?auto_343015 ?auto_343016 ?auto_343017 ?auto_343018 ?auto_343019 ?auto_343020 ?auto_343021 ?auto_343022 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343038 - BLOCK
      ?auto_343039 - BLOCK
      ?auto_343040 - BLOCK
      ?auto_343041 - BLOCK
      ?auto_343042 - BLOCK
      ?auto_343043 - BLOCK
      ?auto_343044 - BLOCK
      ?auto_343045 - BLOCK
      ?auto_343046 - BLOCK
      ?auto_343047 - BLOCK
      ?auto_343048 - BLOCK
      ?auto_343049 - BLOCK
      ?auto_343050 - BLOCK
      ?auto_343051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343051 ) ( ON-TABLE ?auto_343038 ) ( ON ?auto_343039 ?auto_343038 ) ( ON ?auto_343040 ?auto_343039 ) ( ON ?auto_343041 ?auto_343040 ) ( ON ?auto_343042 ?auto_343041 ) ( ON ?auto_343043 ?auto_343042 ) ( ON ?auto_343044 ?auto_343043 ) ( not ( = ?auto_343038 ?auto_343039 ) ) ( not ( = ?auto_343038 ?auto_343040 ) ) ( not ( = ?auto_343038 ?auto_343041 ) ) ( not ( = ?auto_343038 ?auto_343042 ) ) ( not ( = ?auto_343038 ?auto_343043 ) ) ( not ( = ?auto_343038 ?auto_343044 ) ) ( not ( = ?auto_343038 ?auto_343045 ) ) ( not ( = ?auto_343038 ?auto_343046 ) ) ( not ( = ?auto_343038 ?auto_343047 ) ) ( not ( = ?auto_343038 ?auto_343048 ) ) ( not ( = ?auto_343038 ?auto_343049 ) ) ( not ( = ?auto_343038 ?auto_343050 ) ) ( not ( = ?auto_343038 ?auto_343051 ) ) ( not ( = ?auto_343039 ?auto_343040 ) ) ( not ( = ?auto_343039 ?auto_343041 ) ) ( not ( = ?auto_343039 ?auto_343042 ) ) ( not ( = ?auto_343039 ?auto_343043 ) ) ( not ( = ?auto_343039 ?auto_343044 ) ) ( not ( = ?auto_343039 ?auto_343045 ) ) ( not ( = ?auto_343039 ?auto_343046 ) ) ( not ( = ?auto_343039 ?auto_343047 ) ) ( not ( = ?auto_343039 ?auto_343048 ) ) ( not ( = ?auto_343039 ?auto_343049 ) ) ( not ( = ?auto_343039 ?auto_343050 ) ) ( not ( = ?auto_343039 ?auto_343051 ) ) ( not ( = ?auto_343040 ?auto_343041 ) ) ( not ( = ?auto_343040 ?auto_343042 ) ) ( not ( = ?auto_343040 ?auto_343043 ) ) ( not ( = ?auto_343040 ?auto_343044 ) ) ( not ( = ?auto_343040 ?auto_343045 ) ) ( not ( = ?auto_343040 ?auto_343046 ) ) ( not ( = ?auto_343040 ?auto_343047 ) ) ( not ( = ?auto_343040 ?auto_343048 ) ) ( not ( = ?auto_343040 ?auto_343049 ) ) ( not ( = ?auto_343040 ?auto_343050 ) ) ( not ( = ?auto_343040 ?auto_343051 ) ) ( not ( = ?auto_343041 ?auto_343042 ) ) ( not ( = ?auto_343041 ?auto_343043 ) ) ( not ( = ?auto_343041 ?auto_343044 ) ) ( not ( = ?auto_343041 ?auto_343045 ) ) ( not ( = ?auto_343041 ?auto_343046 ) ) ( not ( = ?auto_343041 ?auto_343047 ) ) ( not ( = ?auto_343041 ?auto_343048 ) ) ( not ( = ?auto_343041 ?auto_343049 ) ) ( not ( = ?auto_343041 ?auto_343050 ) ) ( not ( = ?auto_343041 ?auto_343051 ) ) ( not ( = ?auto_343042 ?auto_343043 ) ) ( not ( = ?auto_343042 ?auto_343044 ) ) ( not ( = ?auto_343042 ?auto_343045 ) ) ( not ( = ?auto_343042 ?auto_343046 ) ) ( not ( = ?auto_343042 ?auto_343047 ) ) ( not ( = ?auto_343042 ?auto_343048 ) ) ( not ( = ?auto_343042 ?auto_343049 ) ) ( not ( = ?auto_343042 ?auto_343050 ) ) ( not ( = ?auto_343042 ?auto_343051 ) ) ( not ( = ?auto_343043 ?auto_343044 ) ) ( not ( = ?auto_343043 ?auto_343045 ) ) ( not ( = ?auto_343043 ?auto_343046 ) ) ( not ( = ?auto_343043 ?auto_343047 ) ) ( not ( = ?auto_343043 ?auto_343048 ) ) ( not ( = ?auto_343043 ?auto_343049 ) ) ( not ( = ?auto_343043 ?auto_343050 ) ) ( not ( = ?auto_343043 ?auto_343051 ) ) ( not ( = ?auto_343044 ?auto_343045 ) ) ( not ( = ?auto_343044 ?auto_343046 ) ) ( not ( = ?auto_343044 ?auto_343047 ) ) ( not ( = ?auto_343044 ?auto_343048 ) ) ( not ( = ?auto_343044 ?auto_343049 ) ) ( not ( = ?auto_343044 ?auto_343050 ) ) ( not ( = ?auto_343044 ?auto_343051 ) ) ( not ( = ?auto_343045 ?auto_343046 ) ) ( not ( = ?auto_343045 ?auto_343047 ) ) ( not ( = ?auto_343045 ?auto_343048 ) ) ( not ( = ?auto_343045 ?auto_343049 ) ) ( not ( = ?auto_343045 ?auto_343050 ) ) ( not ( = ?auto_343045 ?auto_343051 ) ) ( not ( = ?auto_343046 ?auto_343047 ) ) ( not ( = ?auto_343046 ?auto_343048 ) ) ( not ( = ?auto_343046 ?auto_343049 ) ) ( not ( = ?auto_343046 ?auto_343050 ) ) ( not ( = ?auto_343046 ?auto_343051 ) ) ( not ( = ?auto_343047 ?auto_343048 ) ) ( not ( = ?auto_343047 ?auto_343049 ) ) ( not ( = ?auto_343047 ?auto_343050 ) ) ( not ( = ?auto_343047 ?auto_343051 ) ) ( not ( = ?auto_343048 ?auto_343049 ) ) ( not ( = ?auto_343048 ?auto_343050 ) ) ( not ( = ?auto_343048 ?auto_343051 ) ) ( not ( = ?auto_343049 ?auto_343050 ) ) ( not ( = ?auto_343049 ?auto_343051 ) ) ( not ( = ?auto_343050 ?auto_343051 ) ) ( ON ?auto_343050 ?auto_343051 ) ( ON ?auto_343049 ?auto_343050 ) ( ON ?auto_343048 ?auto_343049 ) ( ON ?auto_343047 ?auto_343048 ) ( ON ?auto_343046 ?auto_343047 ) ( CLEAR ?auto_343044 ) ( ON ?auto_343045 ?auto_343046 ) ( CLEAR ?auto_343045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_343038 ?auto_343039 ?auto_343040 ?auto_343041 ?auto_343042 ?auto_343043 ?auto_343044 ?auto_343045 )
      ( MAKE-14PILE ?auto_343038 ?auto_343039 ?auto_343040 ?auto_343041 ?auto_343042 ?auto_343043 ?auto_343044 ?auto_343045 ?auto_343046 ?auto_343047 ?auto_343048 ?auto_343049 ?auto_343050 ?auto_343051 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343066 - BLOCK
      ?auto_343067 - BLOCK
      ?auto_343068 - BLOCK
      ?auto_343069 - BLOCK
      ?auto_343070 - BLOCK
      ?auto_343071 - BLOCK
      ?auto_343072 - BLOCK
      ?auto_343073 - BLOCK
      ?auto_343074 - BLOCK
      ?auto_343075 - BLOCK
      ?auto_343076 - BLOCK
      ?auto_343077 - BLOCK
      ?auto_343078 - BLOCK
      ?auto_343079 - BLOCK
    )
    :vars
    (
      ?auto_343080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343079 ?auto_343080 ) ( ON-TABLE ?auto_343066 ) ( ON ?auto_343067 ?auto_343066 ) ( ON ?auto_343068 ?auto_343067 ) ( ON ?auto_343069 ?auto_343068 ) ( ON ?auto_343070 ?auto_343069 ) ( ON ?auto_343071 ?auto_343070 ) ( not ( = ?auto_343066 ?auto_343067 ) ) ( not ( = ?auto_343066 ?auto_343068 ) ) ( not ( = ?auto_343066 ?auto_343069 ) ) ( not ( = ?auto_343066 ?auto_343070 ) ) ( not ( = ?auto_343066 ?auto_343071 ) ) ( not ( = ?auto_343066 ?auto_343072 ) ) ( not ( = ?auto_343066 ?auto_343073 ) ) ( not ( = ?auto_343066 ?auto_343074 ) ) ( not ( = ?auto_343066 ?auto_343075 ) ) ( not ( = ?auto_343066 ?auto_343076 ) ) ( not ( = ?auto_343066 ?auto_343077 ) ) ( not ( = ?auto_343066 ?auto_343078 ) ) ( not ( = ?auto_343066 ?auto_343079 ) ) ( not ( = ?auto_343066 ?auto_343080 ) ) ( not ( = ?auto_343067 ?auto_343068 ) ) ( not ( = ?auto_343067 ?auto_343069 ) ) ( not ( = ?auto_343067 ?auto_343070 ) ) ( not ( = ?auto_343067 ?auto_343071 ) ) ( not ( = ?auto_343067 ?auto_343072 ) ) ( not ( = ?auto_343067 ?auto_343073 ) ) ( not ( = ?auto_343067 ?auto_343074 ) ) ( not ( = ?auto_343067 ?auto_343075 ) ) ( not ( = ?auto_343067 ?auto_343076 ) ) ( not ( = ?auto_343067 ?auto_343077 ) ) ( not ( = ?auto_343067 ?auto_343078 ) ) ( not ( = ?auto_343067 ?auto_343079 ) ) ( not ( = ?auto_343067 ?auto_343080 ) ) ( not ( = ?auto_343068 ?auto_343069 ) ) ( not ( = ?auto_343068 ?auto_343070 ) ) ( not ( = ?auto_343068 ?auto_343071 ) ) ( not ( = ?auto_343068 ?auto_343072 ) ) ( not ( = ?auto_343068 ?auto_343073 ) ) ( not ( = ?auto_343068 ?auto_343074 ) ) ( not ( = ?auto_343068 ?auto_343075 ) ) ( not ( = ?auto_343068 ?auto_343076 ) ) ( not ( = ?auto_343068 ?auto_343077 ) ) ( not ( = ?auto_343068 ?auto_343078 ) ) ( not ( = ?auto_343068 ?auto_343079 ) ) ( not ( = ?auto_343068 ?auto_343080 ) ) ( not ( = ?auto_343069 ?auto_343070 ) ) ( not ( = ?auto_343069 ?auto_343071 ) ) ( not ( = ?auto_343069 ?auto_343072 ) ) ( not ( = ?auto_343069 ?auto_343073 ) ) ( not ( = ?auto_343069 ?auto_343074 ) ) ( not ( = ?auto_343069 ?auto_343075 ) ) ( not ( = ?auto_343069 ?auto_343076 ) ) ( not ( = ?auto_343069 ?auto_343077 ) ) ( not ( = ?auto_343069 ?auto_343078 ) ) ( not ( = ?auto_343069 ?auto_343079 ) ) ( not ( = ?auto_343069 ?auto_343080 ) ) ( not ( = ?auto_343070 ?auto_343071 ) ) ( not ( = ?auto_343070 ?auto_343072 ) ) ( not ( = ?auto_343070 ?auto_343073 ) ) ( not ( = ?auto_343070 ?auto_343074 ) ) ( not ( = ?auto_343070 ?auto_343075 ) ) ( not ( = ?auto_343070 ?auto_343076 ) ) ( not ( = ?auto_343070 ?auto_343077 ) ) ( not ( = ?auto_343070 ?auto_343078 ) ) ( not ( = ?auto_343070 ?auto_343079 ) ) ( not ( = ?auto_343070 ?auto_343080 ) ) ( not ( = ?auto_343071 ?auto_343072 ) ) ( not ( = ?auto_343071 ?auto_343073 ) ) ( not ( = ?auto_343071 ?auto_343074 ) ) ( not ( = ?auto_343071 ?auto_343075 ) ) ( not ( = ?auto_343071 ?auto_343076 ) ) ( not ( = ?auto_343071 ?auto_343077 ) ) ( not ( = ?auto_343071 ?auto_343078 ) ) ( not ( = ?auto_343071 ?auto_343079 ) ) ( not ( = ?auto_343071 ?auto_343080 ) ) ( not ( = ?auto_343072 ?auto_343073 ) ) ( not ( = ?auto_343072 ?auto_343074 ) ) ( not ( = ?auto_343072 ?auto_343075 ) ) ( not ( = ?auto_343072 ?auto_343076 ) ) ( not ( = ?auto_343072 ?auto_343077 ) ) ( not ( = ?auto_343072 ?auto_343078 ) ) ( not ( = ?auto_343072 ?auto_343079 ) ) ( not ( = ?auto_343072 ?auto_343080 ) ) ( not ( = ?auto_343073 ?auto_343074 ) ) ( not ( = ?auto_343073 ?auto_343075 ) ) ( not ( = ?auto_343073 ?auto_343076 ) ) ( not ( = ?auto_343073 ?auto_343077 ) ) ( not ( = ?auto_343073 ?auto_343078 ) ) ( not ( = ?auto_343073 ?auto_343079 ) ) ( not ( = ?auto_343073 ?auto_343080 ) ) ( not ( = ?auto_343074 ?auto_343075 ) ) ( not ( = ?auto_343074 ?auto_343076 ) ) ( not ( = ?auto_343074 ?auto_343077 ) ) ( not ( = ?auto_343074 ?auto_343078 ) ) ( not ( = ?auto_343074 ?auto_343079 ) ) ( not ( = ?auto_343074 ?auto_343080 ) ) ( not ( = ?auto_343075 ?auto_343076 ) ) ( not ( = ?auto_343075 ?auto_343077 ) ) ( not ( = ?auto_343075 ?auto_343078 ) ) ( not ( = ?auto_343075 ?auto_343079 ) ) ( not ( = ?auto_343075 ?auto_343080 ) ) ( not ( = ?auto_343076 ?auto_343077 ) ) ( not ( = ?auto_343076 ?auto_343078 ) ) ( not ( = ?auto_343076 ?auto_343079 ) ) ( not ( = ?auto_343076 ?auto_343080 ) ) ( not ( = ?auto_343077 ?auto_343078 ) ) ( not ( = ?auto_343077 ?auto_343079 ) ) ( not ( = ?auto_343077 ?auto_343080 ) ) ( not ( = ?auto_343078 ?auto_343079 ) ) ( not ( = ?auto_343078 ?auto_343080 ) ) ( not ( = ?auto_343079 ?auto_343080 ) ) ( ON ?auto_343078 ?auto_343079 ) ( ON ?auto_343077 ?auto_343078 ) ( ON ?auto_343076 ?auto_343077 ) ( ON ?auto_343075 ?auto_343076 ) ( ON ?auto_343074 ?auto_343075 ) ( ON ?auto_343073 ?auto_343074 ) ( CLEAR ?auto_343071 ) ( ON ?auto_343072 ?auto_343073 ) ( CLEAR ?auto_343072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_343066 ?auto_343067 ?auto_343068 ?auto_343069 ?auto_343070 ?auto_343071 ?auto_343072 )
      ( MAKE-14PILE ?auto_343066 ?auto_343067 ?auto_343068 ?auto_343069 ?auto_343070 ?auto_343071 ?auto_343072 ?auto_343073 ?auto_343074 ?auto_343075 ?auto_343076 ?auto_343077 ?auto_343078 ?auto_343079 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343095 - BLOCK
      ?auto_343096 - BLOCK
      ?auto_343097 - BLOCK
      ?auto_343098 - BLOCK
      ?auto_343099 - BLOCK
      ?auto_343100 - BLOCK
      ?auto_343101 - BLOCK
      ?auto_343102 - BLOCK
      ?auto_343103 - BLOCK
      ?auto_343104 - BLOCK
      ?auto_343105 - BLOCK
      ?auto_343106 - BLOCK
      ?auto_343107 - BLOCK
      ?auto_343108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343108 ) ( ON-TABLE ?auto_343095 ) ( ON ?auto_343096 ?auto_343095 ) ( ON ?auto_343097 ?auto_343096 ) ( ON ?auto_343098 ?auto_343097 ) ( ON ?auto_343099 ?auto_343098 ) ( ON ?auto_343100 ?auto_343099 ) ( not ( = ?auto_343095 ?auto_343096 ) ) ( not ( = ?auto_343095 ?auto_343097 ) ) ( not ( = ?auto_343095 ?auto_343098 ) ) ( not ( = ?auto_343095 ?auto_343099 ) ) ( not ( = ?auto_343095 ?auto_343100 ) ) ( not ( = ?auto_343095 ?auto_343101 ) ) ( not ( = ?auto_343095 ?auto_343102 ) ) ( not ( = ?auto_343095 ?auto_343103 ) ) ( not ( = ?auto_343095 ?auto_343104 ) ) ( not ( = ?auto_343095 ?auto_343105 ) ) ( not ( = ?auto_343095 ?auto_343106 ) ) ( not ( = ?auto_343095 ?auto_343107 ) ) ( not ( = ?auto_343095 ?auto_343108 ) ) ( not ( = ?auto_343096 ?auto_343097 ) ) ( not ( = ?auto_343096 ?auto_343098 ) ) ( not ( = ?auto_343096 ?auto_343099 ) ) ( not ( = ?auto_343096 ?auto_343100 ) ) ( not ( = ?auto_343096 ?auto_343101 ) ) ( not ( = ?auto_343096 ?auto_343102 ) ) ( not ( = ?auto_343096 ?auto_343103 ) ) ( not ( = ?auto_343096 ?auto_343104 ) ) ( not ( = ?auto_343096 ?auto_343105 ) ) ( not ( = ?auto_343096 ?auto_343106 ) ) ( not ( = ?auto_343096 ?auto_343107 ) ) ( not ( = ?auto_343096 ?auto_343108 ) ) ( not ( = ?auto_343097 ?auto_343098 ) ) ( not ( = ?auto_343097 ?auto_343099 ) ) ( not ( = ?auto_343097 ?auto_343100 ) ) ( not ( = ?auto_343097 ?auto_343101 ) ) ( not ( = ?auto_343097 ?auto_343102 ) ) ( not ( = ?auto_343097 ?auto_343103 ) ) ( not ( = ?auto_343097 ?auto_343104 ) ) ( not ( = ?auto_343097 ?auto_343105 ) ) ( not ( = ?auto_343097 ?auto_343106 ) ) ( not ( = ?auto_343097 ?auto_343107 ) ) ( not ( = ?auto_343097 ?auto_343108 ) ) ( not ( = ?auto_343098 ?auto_343099 ) ) ( not ( = ?auto_343098 ?auto_343100 ) ) ( not ( = ?auto_343098 ?auto_343101 ) ) ( not ( = ?auto_343098 ?auto_343102 ) ) ( not ( = ?auto_343098 ?auto_343103 ) ) ( not ( = ?auto_343098 ?auto_343104 ) ) ( not ( = ?auto_343098 ?auto_343105 ) ) ( not ( = ?auto_343098 ?auto_343106 ) ) ( not ( = ?auto_343098 ?auto_343107 ) ) ( not ( = ?auto_343098 ?auto_343108 ) ) ( not ( = ?auto_343099 ?auto_343100 ) ) ( not ( = ?auto_343099 ?auto_343101 ) ) ( not ( = ?auto_343099 ?auto_343102 ) ) ( not ( = ?auto_343099 ?auto_343103 ) ) ( not ( = ?auto_343099 ?auto_343104 ) ) ( not ( = ?auto_343099 ?auto_343105 ) ) ( not ( = ?auto_343099 ?auto_343106 ) ) ( not ( = ?auto_343099 ?auto_343107 ) ) ( not ( = ?auto_343099 ?auto_343108 ) ) ( not ( = ?auto_343100 ?auto_343101 ) ) ( not ( = ?auto_343100 ?auto_343102 ) ) ( not ( = ?auto_343100 ?auto_343103 ) ) ( not ( = ?auto_343100 ?auto_343104 ) ) ( not ( = ?auto_343100 ?auto_343105 ) ) ( not ( = ?auto_343100 ?auto_343106 ) ) ( not ( = ?auto_343100 ?auto_343107 ) ) ( not ( = ?auto_343100 ?auto_343108 ) ) ( not ( = ?auto_343101 ?auto_343102 ) ) ( not ( = ?auto_343101 ?auto_343103 ) ) ( not ( = ?auto_343101 ?auto_343104 ) ) ( not ( = ?auto_343101 ?auto_343105 ) ) ( not ( = ?auto_343101 ?auto_343106 ) ) ( not ( = ?auto_343101 ?auto_343107 ) ) ( not ( = ?auto_343101 ?auto_343108 ) ) ( not ( = ?auto_343102 ?auto_343103 ) ) ( not ( = ?auto_343102 ?auto_343104 ) ) ( not ( = ?auto_343102 ?auto_343105 ) ) ( not ( = ?auto_343102 ?auto_343106 ) ) ( not ( = ?auto_343102 ?auto_343107 ) ) ( not ( = ?auto_343102 ?auto_343108 ) ) ( not ( = ?auto_343103 ?auto_343104 ) ) ( not ( = ?auto_343103 ?auto_343105 ) ) ( not ( = ?auto_343103 ?auto_343106 ) ) ( not ( = ?auto_343103 ?auto_343107 ) ) ( not ( = ?auto_343103 ?auto_343108 ) ) ( not ( = ?auto_343104 ?auto_343105 ) ) ( not ( = ?auto_343104 ?auto_343106 ) ) ( not ( = ?auto_343104 ?auto_343107 ) ) ( not ( = ?auto_343104 ?auto_343108 ) ) ( not ( = ?auto_343105 ?auto_343106 ) ) ( not ( = ?auto_343105 ?auto_343107 ) ) ( not ( = ?auto_343105 ?auto_343108 ) ) ( not ( = ?auto_343106 ?auto_343107 ) ) ( not ( = ?auto_343106 ?auto_343108 ) ) ( not ( = ?auto_343107 ?auto_343108 ) ) ( ON ?auto_343107 ?auto_343108 ) ( ON ?auto_343106 ?auto_343107 ) ( ON ?auto_343105 ?auto_343106 ) ( ON ?auto_343104 ?auto_343105 ) ( ON ?auto_343103 ?auto_343104 ) ( ON ?auto_343102 ?auto_343103 ) ( CLEAR ?auto_343100 ) ( ON ?auto_343101 ?auto_343102 ) ( CLEAR ?auto_343101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_343095 ?auto_343096 ?auto_343097 ?auto_343098 ?auto_343099 ?auto_343100 ?auto_343101 )
      ( MAKE-14PILE ?auto_343095 ?auto_343096 ?auto_343097 ?auto_343098 ?auto_343099 ?auto_343100 ?auto_343101 ?auto_343102 ?auto_343103 ?auto_343104 ?auto_343105 ?auto_343106 ?auto_343107 ?auto_343108 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343123 - BLOCK
      ?auto_343124 - BLOCK
      ?auto_343125 - BLOCK
      ?auto_343126 - BLOCK
      ?auto_343127 - BLOCK
      ?auto_343128 - BLOCK
      ?auto_343129 - BLOCK
      ?auto_343130 - BLOCK
      ?auto_343131 - BLOCK
      ?auto_343132 - BLOCK
      ?auto_343133 - BLOCK
      ?auto_343134 - BLOCK
      ?auto_343135 - BLOCK
      ?auto_343136 - BLOCK
    )
    :vars
    (
      ?auto_343137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343136 ?auto_343137 ) ( ON-TABLE ?auto_343123 ) ( ON ?auto_343124 ?auto_343123 ) ( ON ?auto_343125 ?auto_343124 ) ( ON ?auto_343126 ?auto_343125 ) ( ON ?auto_343127 ?auto_343126 ) ( not ( = ?auto_343123 ?auto_343124 ) ) ( not ( = ?auto_343123 ?auto_343125 ) ) ( not ( = ?auto_343123 ?auto_343126 ) ) ( not ( = ?auto_343123 ?auto_343127 ) ) ( not ( = ?auto_343123 ?auto_343128 ) ) ( not ( = ?auto_343123 ?auto_343129 ) ) ( not ( = ?auto_343123 ?auto_343130 ) ) ( not ( = ?auto_343123 ?auto_343131 ) ) ( not ( = ?auto_343123 ?auto_343132 ) ) ( not ( = ?auto_343123 ?auto_343133 ) ) ( not ( = ?auto_343123 ?auto_343134 ) ) ( not ( = ?auto_343123 ?auto_343135 ) ) ( not ( = ?auto_343123 ?auto_343136 ) ) ( not ( = ?auto_343123 ?auto_343137 ) ) ( not ( = ?auto_343124 ?auto_343125 ) ) ( not ( = ?auto_343124 ?auto_343126 ) ) ( not ( = ?auto_343124 ?auto_343127 ) ) ( not ( = ?auto_343124 ?auto_343128 ) ) ( not ( = ?auto_343124 ?auto_343129 ) ) ( not ( = ?auto_343124 ?auto_343130 ) ) ( not ( = ?auto_343124 ?auto_343131 ) ) ( not ( = ?auto_343124 ?auto_343132 ) ) ( not ( = ?auto_343124 ?auto_343133 ) ) ( not ( = ?auto_343124 ?auto_343134 ) ) ( not ( = ?auto_343124 ?auto_343135 ) ) ( not ( = ?auto_343124 ?auto_343136 ) ) ( not ( = ?auto_343124 ?auto_343137 ) ) ( not ( = ?auto_343125 ?auto_343126 ) ) ( not ( = ?auto_343125 ?auto_343127 ) ) ( not ( = ?auto_343125 ?auto_343128 ) ) ( not ( = ?auto_343125 ?auto_343129 ) ) ( not ( = ?auto_343125 ?auto_343130 ) ) ( not ( = ?auto_343125 ?auto_343131 ) ) ( not ( = ?auto_343125 ?auto_343132 ) ) ( not ( = ?auto_343125 ?auto_343133 ) ) ( not ( = ?auto_343125 ?auto_343134 ) ) ( not ( = ?auto_343125 ?auto_343135 ) ) ( not ( = ?auto_343125 ?auto_343136 ) ) ( not ( = ?auto_343125 ?auto_343137 ) ) ( not ( = ?auto_343126 ?auto_343127 ) ) ( not ( = ?auto_343126 ?auto_343128 ) ) ( not ( = ?auto_343126 ?auto_343129 ) ) ( not ( = ?auto_343126 ?auto_343130 ) ) ( not ( = ?auto_343126 ?auto_343131 ) ) ( not ( = ?auto_343126 ?auto_343132 ) ) ( not ( = ?auto_343126 ?auto_343133 ) ) ( not ( = ?auto_343126 ?auto_343134 ) ) ( not ( = ?auto_343126 ?auto_343135 ) ) ( not ( = ?auto_343126 ?auto_343136 ) ) ( not ( = ?auto_343126 ?auto_343137 ) ) ( not ( = ?auto_343127 ?auto_343128 ) ) ( not ( = ?auto_343127 ?auto_343129 ) ) ( not ( = ?auto_343127 ?auto_343130 ) ) ( not ( = ?auto_343127 ?auto_343131 ) ) ( not ( = ?auto_343127 ?auto_343132 ) ) ( not ( = ?auto_343127 ?auto_343133 ) ) ( not ( = ?auto_343127 ?auto_343134 ) ) ( not ( = ?auto_343127 ?auto_343135 ) ) ( not ( = ?auto_343127 ?auto_343136 ) ) ( not ( = ?auto_343127 ?auto_343137 ) ) ( not ( = ?auto_343128 ?auto_343129 ) ) ( not ( = ?auto_343128 ?auto_343130 ) ) ( not ( = ?auto_343128 ?auto_343131 ) ) ( not ( = ?auto_343128 ?auto_343132 ) ) ( not ( = ?auto_343128 ?auto_343133 ) ) ( not ( = ?auto_343128 ?auto_343134 ) ) ( not ( = ?auto_343128 ?auto_343135 ) ) ( not ( = ?auto_343128 ?auto_343136 ) ) ( not ( = ?auto_343128 ?auto_343137 ) ) ( not ( = ?auto_343129 ?auto_343130 ) ) ( not ( = ?auto_343129 ?auto_343131 ) ) ( not ( = ?auto_343129 ?auto_343132 ) ) ( not ( = ?auto_343129 ?auto_343133 ) ) ( not ( = ?auto_343129 ?auto_343134 ) ) ( not ( = ?auto_343129 ?auto_343135 ) ) ( not ( = ?auto_343129 ?auto_343136 ) ) ( not ( = ?auto_343129 ?auto_343137 ) ) ( not ( = ?auto_343130 ?auto_343131 ) ) ( not ( = ?auto_343130 ?auto_343132 ) ) ( not ( = ?auto_343130 ?auto_343133 ) ) ( not ( = ?auto_343130 ?auto_343134 ) ) ( not ( = ?auto_343130 ?auto_343135 ) ) ( not ( = ?auto_343130 ?auto_343136 ) ) ( not ( = ?auto_343130 ?auto_343137 ) ) ( not ( = ?auto_343131 ?auto_343132 ) ) ( not ( = ?auto_343131 ?auto_343133 ) ) ( not ( = ?auto_343131 ?auto_343134 ) ) ( not ( = ?auto_343131 ?auto_343135 ) ) ( not ( = ?auto_343131 ?auto_343136 ) ) ( not ( = ?auto_343131 ?auto_343137 ) ) ( not ( = ?auto_343132 ?auto_343133 ) ) ( not ( = ?auto_343132 ?auto_343134 ) ) ( not ( = ?auto_343132 ?auto_343135 ) ) ( not ( = ?auto_343132 ?auto_343136 ) ) ( not ( = ?auto_343132 ?auto_343137 ) ) ( not ( = ?auto_343133 ?auto_343134 ) ) ( not ( = ?auto_343133 ?auto_343135 ) ) ( not ( = ?auto_343133 ?auto_343136 ) ) ( not ( = ?auto_343133 ?auto_343137 ) ) ( not ( = ?auto_343134 ?auto_343135 ) ) ( not ( = ?auto_343134 ?auto_343136 ) ) ( not ( = ?auto_343134 ?auto_343137 ) ) ( not ( = ?auto_343135 ?auto_343136 ) ) ( not ( = ?auto_343135 ?auto_343137 ) ) ( not ( = ?auto_343136 ?auto_343137 ) ) ( ON ?auto_343135 ?auto_343136 ) ( ON ?auto_343134 ?auto_343135 ) ( ON ?auto_343133 ?auto_343134 ) ( ON ?auto_343132 ?auto_343133 ) ( ON ?auto_343131 ?auto_343132 ) ( ON ?auto_343130 ?auto_343131 ) ( ON ?auto_343129 ?auto_343130 ) ( CLEAR ?auto_343127 ) ( ON ?auto_343128 ?auto_343129 ) ( CLEAR ?auto_343128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_343123 ?auto_343124 ?auto_343125 ?auto_343126 ?auto_343127 ?auto_343128 )
      ( MAKE-14PILE ?auto_343123 ?auto_343124 ?auto_343125 ?auto_343126 ?auto_343127 ?auto_343128 ?auto_343129 ?auto_343130 ?auto_343131 ?auto_343132 ?auto_343133 ?auto_343134 ?auto_343135 ?auto_343136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343152 - BLOCK
      ?auto_343153 - BLOCK
      ?auto_343154 - BLOCK
      ?auto_343155 - BLOCK
      ?auto_343156 - BLOCK
      ?auto_343157 - BLOCK
      ?auto_343158 - BLOCK
      ?auto_343159 - BLOCK
      ?auto_343160 - BLOCK
      ?auto_343161 - BLOCK
      ?auto_343162 - BLOCK
      ?auto_343163 - BLOCK
      ?auto_343164 - BLOCK
      ?auto_343165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343165 ) ( ON-TABLE ?auto_343152 ) ( ON ?auto_343153 ?auto_343152 ) ( ON ?auto_343154 ?auto_343153 ) ( ON ?auto_343155 ?auto_343154 ) ( ON ?auto_343156 ?auto_343155 ) ( not ( = ?auto_343152 ?auto_343153 ) ) ( not ( = ?auto_343152 ?auto_343154 ) ) ( not ( = ?auto_343152 ?auto_343155 ) ) ( not ( = ?auto_343152 ?auto_343156 ) ) ( not ( = ?auto_343152 ?auto_343157 ) ) ( not ( = ?auto_343152 ?auto_343158 ) ) ( not ( = ?auto_343152 ?auto_343159 ) ) ( not ( = ?auto_343152 ?auto_343160 ) ) ( not ( = ?auto_343152 ?auto_343161 ) ) ( not ( = ?auto_343152 ?auto_343162 ) ) ( not ( = ?auto_343152 ?auto_343163 ) ) ( not ( = ?auto_343152 ?auto_343164 ) ) ( not ( = ?auto_343152 ?auto_343165 ) ) ( not ( = ?auto_343153 ?auto_343154 ) ) ( not ( = ?auto_343153 ?auto_343155 ) ) ( not ( = ?auto_343153 ?auto_343156 ) ) ( not ( = ?auto_343153 ?auto_343157 ) ) ( not ( = ?auto_343153 ?auto_343158 ) ) ( not ( = ?auto_343153 ?auto_343159 ) ) ( not ( = ?auto_343153 ?auto_343160 ) ) ( not ( = ?auto_343153 ?auto_343161 ) ) ( not ( = ?auto_343153 ?auto_343162 ) ) ( not ( = ?auto_343153 ?auto_343163 ) ) ( not ( = ?auto_343153 ?auto_343164 ) ) ( not ( = ?auto_343153 ?auto_343165 ) ) ( not ( = ?auto_343154 ?auto_343155 ) ) ( not ( = ?auto_343154 ?auto_343156 ) ) ( not ( = ?auto_343154 ?auto_343157 ) ) ( not ( = ?auto_343154 ?auto_343158 ) ) ( not ( = ?auto_343154 ?auto_343159 ) ) ( not ( = ?auto_343154 ?auto_343160 ) ) ( not ( = ?auto_343154 ?auto_343161 ) ) ( not ( = ?auto_343154 ?auto_343162 ) ) ( not ( = ?auto_343154 ?auto_343163 ) ) ( not ( = ?auto_343154 ?auto_343164 ) ) ( not ( = ?auto_343154 ?auto_343165 ) ) ( not ( = ?auto_343155 ?auto_343156 ) ) ( not ( = ?auto_343155 ?auto_343157 ) ) ( not ( = ?auto_343155 ?auto_343158 ) ) ( not ( = ?auto_343155 ?auto_343159 ) ) ( not ( = ?auto_343155 ?auto_343160 ) ) ( not ( = ?auto_343155 ?auto_343161 ) ) ( not ( = ?auto_343155 ?auto_343162 ) ) ( not ( = ?auto_343155 ?auto_343163 ) ) ( not ( = ?auto_343155 ?auto_343164 ) ) ( not ( = ?auto_343155 ?auto_343165 ) ) ( not ( = ?auto_343156 ?auto_343157 ) ) ( not ( = ?auto_343156 ?auto_343158 ) ) ( not ( = ?auto_343156 ?auto_343159 ) ) ( not ( = ?auto_343156 ?auto_343160 ) ) ( not ( = ?auto_343156 ?auto_343161 ) ) ( not ( = ?auto_343156 ?auto_343162 ) ) ( not ( = ?auto_343156 ?auto_343163 ) ) ( not ( = ?auto_343156 ?auto_343164 ) ) ( not ( = ?auto_343156 ?auto_343165 ) ) ( not ( = ?auto_343157 ?auto_343158 ) ) ( not ( = ?auto_343157 ?auto_343159 ) ) ( not ( = ?auto_343157 ?auto_343160 ) ) ( not ( = ?auto_343157 ?auto_343161 ) ) ( not ( = ?auto_343157 ?auto_343162 ) ) ( not ( = ?auto_343157 ?auto_343163 ) ) ( not ( = ?auto_343157 ?auto_343164 ) ) ( not ( = ?auto_343157 ?auto_343165 ) ) ( not ( = ?auto_343158 ?auto_343159 ) ) ( not ( = ?auto_343158 ?auto_343160 ) ) ( not ( = ?auto_343158 ?auto_343161 ) ) ( not ( = ?auto_343158 ?auto_343162 ) ) ( not ( = ?auto_343158 ?auto_343163 ) ) ( not ( = ?auto_343158 ?auto_343164 ) ) ( not ( = ?auto_343158 ?auto_343165 ) ) ( not ( = ?auto_343159 ?auto_343160 ) ) ( not ( = ?auto_343159 ?auto_343161 ) ) ( not ( = ?auto_343159 ?auto_343162 ) ) ( not ( = ?auto_343159 ?auto_343163 ) ) ( not ( = ?auto_343159 ?auto_343164 ) ) ( not ( = ?auto_343159 ?auto_343165 ) ) ( not ( = ?auto_343160 ?auto_343161 ) ) ( not ( = ?auto_343160 ?auto_343162 ) ) ( not ( = ?auto_343160 ?auto_343163 ) ) ( not ( = ?auto_343160 ?auto_343164 ) ) ( not ( = ?auto_343160 ?auto_343165 ) ) ( not ( = ?auto_343161 ?auto_343162 ) ) ( not ( = ?auto_343161 ?auto_343163 ) ) ( not ( = ?auto_343161 ?auto_343164 ) ) ( not ( = ?auto_343161 ?auto_343165 ) ) ( not ( = ?auto_343162 ?auto_343163 ) ) ( not ( = ?auto_343162 ?auto_343164 ) ) ( not ( = ?auto_343162 ?auto_343165 ) ) ( not ( = ?auto_343163 ?auto_343164 ) ) ( not ( = ?auto_343163 ?auto_343165 ) ) ( not ( = ?auto_343164 ?auto_343165 ) ) ( ON ?auto_343164 ?auto_343165 ) ( ON ?auto_343163 ?auto_343164 ) ( ON ?auto_343162 ?auto_343163 ) ( ON ?auto_343161 ?auto_343162 ) ( ON ?auto_343160 ?auto_343161 ) ( ON ?auto_343159 ?auto_343160 ) ( ON ?auto_343158 ?auto_343159 ) ( CLEAR ?auto_343156 ) ( ON ?auto_343157 ?auto_343158 ) ( CLEAR ?auto_343157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_343152 ?auto_343153 ?auto_343154 ?auto_343155 ?auto_343156 ?auto_343157 )
      ( MAKE-14PILE ?auto_343152 ?auto_343153 ?auto_343154 ?auto_343155 ?auto_343156 ?auto_343157 ?auto_343158 ?auto_343159 ?auto_343160 ?auto_343161 ?auto_343162 ?auto_343163 ?auto_343164 ?auto_343165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343180 - BLOCK
      ?auto_343181 - BLOCK
      ?auto_343182 - BLOCK
      ?auto_343183 - BLOCK
      ?auto_343184 - BLOCK
      ?auto_343185 - BLOCK
      ?auto_343186 - BLOCK
      ?auto_343187 - BLOCK
      ?auto_343188 - BLOCK
      ?auto_343189 - BLOCK
      ?auto_343190 - BLOCK
      ?auto_343191 - BLOCK
      ?auto_343192 - BLOCK
      ?auto_343193 - BLOCK
    )
    :vars
    (
      ?auto_343194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343193 ?auto_343194 ) ( ON-TABLE ?auto_343180 ) ( ON ?auto_343181 ?auto_343180 ) ( ON ?auto_343182 ?auto_343181 ) ( ON ?auto_343183 ?auto_343182 ) ( not ( = ?auto_343180 ?auto_343181 ) ) ( not ( = ?auto_343180 ?auto_343182 ) ) ( not ( = ?auto_343180 ?auto_343183 ) ) ( not ( = ?auto_343180 ?auto_343184 ) ) ( not ( = ?auto_343180 ?auto_343185 ) ) ( not ( = ?auto_343180 ?auto_343186 ) ) ( not ( = ?auto_343180 ?auto_343187 ) ) ( not ( = ?auto_343180 ?auto_343188 ) ) ( not ( = ?auto_343180 ?auto_343189 ) ) ( not ( = ?auto_343180 ?auto_343190 ) ) ( not ( = ?auto_343180 ?auto_343191 ) ) ( not ( = ?auto_343180 ?auto_343192 ) ) ( not ( = ?auto_343180 ?auto_343193 ) ) ( not ( = ?auto_343180 ?auto_343194 ) ) ( not ( = ?auto_343181 ?auto_343182 ) ) ( not ( = ?auto_343181 ?auto_343183 ) ) ( not ( = ?auto_343181 ?auto_343184 ) ) ( not ( = ?auto_343181 ?auto_343185 ) ) ( not ( = ?auto_343181 ?auto_343186 ) ) ( not ( = ?auto_343181 ?auto_343187 ) ) ( not ( = ?auto_343181 ?auto_343188 ) ) ( not ( = ?auto_343181 ?auto_343189 ) ) ( not ( = ?auto_343181 ?auto_343190 ) ) ( not ( = ?auto_343181 ?auto_343191 ) ) ( not ( = ?auto_343181 ?auto_343192 ) ) ( not ( = ?auto_343181 ?auto_343193 ) ) ( not ( = ?auto_343181 ?auto_343194 ) ) ( not ( = ?auto_343182 ?auto_343183 ) ) ( not ( = ?auto_343182 ?auto_343184 ) ) ( not ( = ?auto_343182 ?auto_343185 ) ) ( not ( = ?auto_343182 ?auto_343186 ) ) ( not ( = ?auto_343182 ?auto_343187 ) ) ( not ( = ?auto_343182 ?auto_343188 ) ) ( not ( = ?auto_343182 ?auto_343189 ) ) ( not ( = ?auto_343182 ?auto_343190 ) ) ( not ( = ?auto_343182 ?auto_343191 ) ) ( not ( = ?auto_343182 ?auto_343192 ) ) ( not ( = ?auto_343182 ?auto_343193 ) ) ( not ( = ?auto_343182 ?auto_343194 ) ) ( not ( = ?auto_343183 ?auto_343184 ) ) ( not ( = ?auto_343183 ?auto_343185 ) ) ( not ( = ?auto_343183 ?auto_343186 ) ) ( not ( = ?auto_343183 ?auto_343187 ) ) ( not ( = ?auto_343183 ?auto_343188 ) ) ( not ( = ?auto_343183 ?auto_343189 ) ) ( not ( = ?auto_343183 ?auto_343190 ) ) ( not ( = ?auto_343183 ?auto_343191 ) ) ( not ( = ?auto_343183 ?auto_343192 ) ) ( not ( = ?auto_343183 ?auto_343193 ) ) ( not ( = ?auto_343183 ?auto_343194 ) ) ( not ( = ?auto_343184 ?auto_343185 ) ) ( not ( = ?auto_343184 ?auto_343186 ) ) ( not ( = ?auto_343184 ?auto_343187 ) ) ( not ( = ?auto_343184 ?auto_343188 ) ) ( not ( = ?auto_343184 ?auto_343189 ) ) ( not ( = ?auto_343184 ?auto_343190 ) ) ( not ( = ?auto_343184 ?auto_343191 ) ) ( not ( = ?auto_343184 ?auto_343192 ) ) ( not ( = ?auto_343184 ?auto_343193 ) ) ( not ( = ?auto_343184 ?auto_343194 ) ) ( not ( = ?auto_343185 ?auto_343186 ) ) ( not ( = ?auto_343185 ?auto_343187 ) ) ( not ( = ?auto_343185 ?auto_343188 ) ) ( not ( = ?auto_343185 ?auto_343189 ) ) ( not ( = ?auto_343185 ?auto_343190 ) ) ( not ( = ?auto_343185 ?auto_343191 ) ) ( not ( = ?auto_343185 ?auto_343192 ) ) ( not ( = ?auto_343185 ?auto_343193 ) ) ( not ( = ?auto_343185 ?auto_343194 ) ) ( not ( = ?auto_343186 ?auto_343187 ) ) ( not ( = ?auto_343186 ?auto_343188 ) ) ( not ( = ?auto_343186 ?auto_343189 ) ) ( not ( = ?auto_343186 ?auto_343190 ) ) ( not ( = ?auto_343186 ?auto_343191 ) ) ( not ( = ?auto_343186 ?auto_343192 ) ) ( not ( = ?auto_343186 ?auto_343193 ) ) ( not ( = ?auto_343186 ?auto_343194 ) ) ( not ( = ?auto_343187 ?auto_343188 ) ) ( not ( = ?auto_343187 ?auto_343189 ) ) ( not ( = ?auto_343187 ?auto_343190 ) ) ( not ( = ?auto_343187 ?auto_343191 ) ) ( not ( = ?auto_343187 ?auto_343192 ) ) ( not ( = ?auto_343187 ?auto_343193 ) ) ( not ( = ?auto_343187 ?auto_343194 ) ) ( not ( = ?auto_343188 ?auto_343189 ) ) ( not ( = ?auto_343188 ?auto_343190 ) ) ( not ( = ?auto_343188 ?auto_343191 ) ) ( not ( = ?auto_343188 ?auto_343192 ) ) ( not ( = ?auto_343188 ?auto_343193 ) ) ( not ( = ?auto_343188 ?auto_343194 ) ) ( not ( = ?auto_343189 ?auto_343190 ) ) ( not ( = ?auto_343189 ?auto_343191 ) ) ( not ( = ?auto_343189 ?auto_343192 ) ) ( not ( = ?auto_343189 ?auto_343193 ) ) ( not ( = ?auto_343189 ?auto_343194 ) ) ( not ( = ?auto_343190 ?auto_343191 ) ) ( not ( = ?auto_343190 ?auto_343192 ) ) ( not ( = ?auto_343190 ?auto_343193 ) ) ( not ( = ?auto_343190 ?auto_343194 ) ) ( not ( = ?auto_343191 ?auto_343192 ) ) ( not ( = ?auto_343191 ?auto_343193 ) ) ( not ( = ?auto_343191 ?auto_343194 ) ) ( not ( = ?auto_343192 ?auto_343193 ) ) ( not ( = ?auto_343192 ?auto_343194 ) ) ( not ( = ?auto_343193 ?auto_343194 ) ) ( ON ?auto_343192 ?auto_343193 ) ( ON ?auto_343191 ?auto_343192 ) ( ON ?auto_343190 ?auto_343191 ) ( ON ?auto_343189 ?auto_343190 ) ( ON ?auto_343188 ?auto_343189 ) ( ON ?auto_343187 ?auto_343188 ) ( ON ?auto_343186 ?auto_343187 ) ( ON ?auto_343185 ?auto_343186 ) ( CLEAR ?auto_343183 ) ( ON ?auto_343184 ?auto_343185 ) ( CLEAR ?auto_343184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343180 ?auto_343181 ?auto_343182 ?auto_343183 ?auto_343184 )
      ( MAKE-14PILE ?auto_343180 ?auto_343181 ?auto_343182 ?auto_343183 ?auto_343184 ?auto_343185 ?auto_343186 ?auto_343187 ?auto_343188 ?auto_343189 ?auto_343190 ?auto_343191 ?auto_343192 ?auto_343193 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343209 - BLOCK
      ?auto_343210 - BLOCK
      ?auto_343211 - BLOCK
      ?auto_343212 - BLOCK
      ?auto_343213 - BLOCK
      ?auto_343214 - BLOCK
      ?auto_343215 - BLOCK
      ?auto_343216 - BLOCK
      ?auto_343217 - BLOCK
      ?auto_343218 - BLOCK
      ?auto_343219 - BLOCK
      ?auto_343220 - BLOCK
      ?auto_343221 - BLOCK
      ?auto_343222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343222 ) ( ON-TABLE ?auto_343209 ) ( ON ?auto_343210 ?auto_343209 ) ( ON ?auto_343211 ?auto_343210 ) ( ON ?auto_343212 ?auto_343211 ) ( not ( = ?auto_343209 ?auto_343210 ) ) ( not ( = ?auto_343209 ?auto_343211 ) ) ( not ( = ?auto_343209 ?auto_343212 ) ) ( not ( = ?auto_343209 ?auto_343213 ) ) ( not ( = ?auto_343209 ?auto_343214 ) ) ( not ( = ?auto_343209 ?auto_343215 ) ) ( not ( = ?auto_343209 ?auto_343216 ) ) ( not ( = ?auto_343209 ?auto_343217 ) ) ( not ( = ?auto_343209 ?auto_343218 ) ) ( not ( = ?auto_343209 ?auto_343219 ) ) ( not ( = ?auto_343209 ?auto_343220 ) ) ( not ( = ?auto_343209 ?auto_343221 ) ) ( not ( = ?auto_343209 ?auto_343222 ) ) ( not ( = ?auto_343210 ?auto_343211 ) ) ( not ( = ?auto_343210 ?auto_343212 ) ) ( not ( = ?auto_343210 ?auto_343213 ) ) ( not ( = ?auto_343210 ?auto_343214 ) ) ( not ( = ?auto_343210 ?auto_343215 ) ) ( not ( = ?auto_343210 ?auto_343216 ) ) ( not ( = ?auto_343210 ?auto_343217 ) ) ( not ( = ?auto_343210 ?auto_343218 ) ) ( not ( = ?auto_343210 ?auto_343219 ) ) ( not ( = ?auto_343210 ?auto_343220 ) ) ( not ( = ?auto_343210 ?auto_343221 ) ) ( not ( = ?auto_343210 ?auto_343222 ) ) ( not ( = ?auto_343211 ?auto_343212 ) ) ( not ( = ?auto_343211 ?auto_343213 ) ) ( not ( = ?auto_343211 ?auto_343214 ) ) ( not ( = ?auto_343211 ?auto_343215 ) ) ( not ( = ?auto_343211 ?auto_343216 ) ) ( not ( = ?auto_343211 ?auto_343217 ) ) ( not ( = ?auto_343211 ?auto_343218 ) ) ( not ( = ?auto_343211 ?auto_343219 ) ) ( not ( = ?auto_343211 ?auto_343220 ) ) ( not ( = ?auto_343211 ?auto_343221 ) ) ( not ( = ?auto_343211 ?auto_343222 ) ) ( not ( = ?auto_343212 ?auto_343213 ) ) ( not ( = ?auto_343212 ?auto_343214 ) ) ( not ( = ?auto_343212 ?auto_343215 ) ) ( not ( = ?auto_343212 ?auto_343216 ) ) ( not ( = ?auto_343212 ?auto_343217 ) ) ( not ( = ?auto_343212 ?auto_343218 ) ) ( not ( = ?auto_343212 ?auto_343219 ) ) ( not ( = ?auto_343212 ?auto_343220 ) ) ( not ( = ?auto_343212 ?auto_343221 ) ) ( not ( = ?auto_343212 ?auto_343222 ) ) ( not ( = ?auto_343213 ?auto_343214 ) ) ( not ( = ?auto_343213 ?auto_343215 ) ) ( not ( = ?auto_343213 ?auto_343216 ) ) ( not ( = ?auto_343213 ?auto_343217 ) ) ( not ( = ?auto_343213 ?auto_343218 ) ) ( not ( = ?auto_343213 ?auto_343219 ) ) ( not ( = ?auto_343213 ?auto_343220 ) ) ( not ( = ?auto_343213 ?auto_343221 ) ) ( not ( = ?auto_343213 ?auto_343222 ) ) ( not ( = ?auto_343214 ?auto_343215 ) ) ( not ( = ?auto_343214 ?auto_343216 ) ) ( not ( = ?auto_343214 ?auto_343217 ) ) ( not ( = ?auto_343214 ?auto_343218 ) ) ( not ( = ?auto_343214 ?auto_343219 ) ) ( not ( = ?auto_343214 ?auto_343220 ) ) ( not ( = ?auto_343214 ?auto_343221 ) ) ( not ( = ?auto_343214 ?auto_343222 ) ) ( not ( = ?auto_343215 ?auto_343216 ) ) ( not ( = ?auto_343215 ?auto_343217 ) ) ( not ( = ?auto_343215 ?auto_343218 ) ) ( not ( = ?auto_343215 ?auto_343219 ) ) ( not ( = ?auto_343215 ?auto_343220 ) ) ( not ( = ?auto_343215 ?auto_343221 ) ) ( not ( = ?auto_343215 ?auto_343222 ) ) ( not ( = ?auto_343216 ?auto_343217 ) ) ( not ( = ?auto_343216 ?auto_343218 ) ) ( not ( = ?auto_343216 ?auto_343219 ) ) ( not ( = ?auto_343216 ?auto_343220 ) ) ( not ( = ?auto_343216 ?auto_343221 ) ) ( not ( = ?auto_343216 ?auto_343222 ) ) ( not ( = ?auto_343217 ?auto_343218 ) ) ( not ( = ?auto_343217 ?auto_343219 ) ) ( not ( = ?auto_343217 ?auto_343220 ) ) ( not ( = ?auto_343217 ?auto_343221 ) ) ( not ( = ?auto_343217 ?auto_343222 ) ) ( not ( = ?auto_343218 ?auto_343219 ) ) ( not ( = ?auto_343218 ?auto_343220 ) ) ( not ( = ?auto_343218 ?auto_343221 ) ) ( not ( = ?auto_343218 ?auto_343222 ) ) ( not ( = ?auto_343219 ?auto_343220 ) ) ( not ( = ?auto_343219 ?auto_343221 ) ) ( not ( = ?auto_343219 ?auto_343222 ) ) ( not ( = ?auto_343220 ?auto_343221 ) ) ( not ( = ?auto_343220 ?auto_343222 ) ) ( not ( = ?auto_343221 ?auto_343222 ) ) ( ON ?auto_343221 ?auto_343222 ) ( ON ?auto_343220 ?auto_343221 ) ( ON ?auto_343219 ?auto_343220 ) ( ON ?auto_343218 ?auto_343219 ) ( ON ?auto_343217 ?auto_343218 ) ( ON ?auto_343216 ?auto_343217 ) ( ON ?auto_343215 ?auto_343216 ) ( ON ?auto_343214 ?auto_343215 ) ( CLEAR ?auto_343212 ) ( ON ?auto_343213 ?auto_343214 ) ( CLEAR ?auto_343213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_343209 ?auto_343210 ?auto_343211 ?auto_343212 ?auto_343213 )
      ( MAKE-14PILE ?auto_343209 ?auto_343210 ?auto_343211 ?auto_343212 ?auto_343213 ?auto_343214 ?auto_343215 ?auto_343216 ?auto_343217 ?auto_343218 ?auto_343219 ?auto_343220 ?auto_343221 ?auto_343222 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343237 - BLOCK
      ?auto_343238 - BLOCK
      ?auto_343239 - BLOCK
      ?auto_343240 - BLOCK
      ?auto_343241 - BLOCK
      ?auto_343242 - BLOCK
      ?auto_343243 - BLOCK
      ?auto_343244 - BLOCK
      ?auto_343245 - BLOCK
      ?auto_343246 - BLOCK
      ?auto_343247 - BLOCK
      ?auto_343248 - BLOCK
      ?auto_343249 - BLOCK
      ?auto_343250 - BLOCK
    )
    :vars
    (
      ?auto_343251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343250 ?auto_343251 ) ( ON-TABLE ?auto_343237 ) ( ON ?auto_343238 ?auto_343237 ) ( ON ?auto_343239 ?auto_343238 ) ( not ( = ?auto_343237 ?auto_343238 ) ) ( not ( = ?auto_343237 ?auto_343239 ) ) ( not ( = ?auto_343237 ?auto_343240 ) ) ( not ( = ?auto_343237 ?auto_343241 ) ) ( not ( = ?auto_343237 ?auto_343242 ) ) ( not ( = ?auto_343237 ?auto_343243 ) ) ( not ( = ?auto_343237 ?auto_343244 ) ) ( not ( = ?auto_343237 ?auto_343245 ) ) ( not ( = ?auto_343237 ?auto_343246 ) ) ( not ( = ?auto_343237 ?auto_343247 ) ) ( not ( = ?auto_343237 ?auto_343248 ) ) ( not ( = ?auto_343237 ?auto_343249 ) ) ( not ( = ?auto_343237 ?auto_343250 ) ) ( not ( = ?auto_343237 ?auto_343251 ) ) ( not ( = ?auto_343238 ?auto_343239 ) ) ( not ( = ?auto_343238 ?auto_343240 ) ) ( not ( = ?auto_343238 ?auto_343241 ) ) ( not ( = ?auto_343238 ?auto_343242 ) ) ( not ( = ?auto_343238 ?auto_343243 ) ) ( not ( = ?auto_343238 ?auto_343244 ) ) ( not ( = ?auto_343238 ?auto_343245 ) ) ( not ( = ?auto_343238 ?auto_343246 ) ) ( not ( = ?auto_343238 ?auto_343247 ) ) ( not ( = ?auto_343238 ?auto_343248 ) ) ( not ( = ?auto_343238 ?auto_343249 ) ) ( not ( = ?auto_343238 ?auto_343250 ) ) ( not ( = ?auto_343238 ?auto_343251 ) ) ( not ( = ?auto_343239 ?auto_343240 ) ) ( not ( = ?auto_343239 ?auto_343241 ) ) ( not ( = ?auto_343239 ?auto_343242 ) ) ( not ( = ?auto_343239 ?auto_343243 ) ) ( not ( = ?auto_343239 ?auto_343244 ) ) ( not ( = ?auto_343239 ?auto_343245 ) ) ( not ( = ?auto_343239 ?auto_343246 ) ) ( not ( = ?auto_343239 ?auto_343247 ) ) ( not ( = ?auto_343239 ?auto_343248 ) ) ( not ( = ?auto_343239 ?auto_343249 ) ) ( not ( = ?auto_343239 ?auto_343250 ) ) ( not ( = ?auto_343239 ?auto_343251 ) ) ( not ( = ?auto_343240 ?auto_343241 ) ) ( not ( = ?auto_343240 ?auto_343242 ) ) ( not ( = ?auto_343240 ?auto_343243 ) ) ( not ( = ?auto_343240 ?auto_343244 ) ) ( not ( = ?auto_343240 ?auto_343245 ) ) ( not ( = ?auto_343240 ?auto_343246 ) ) ( not ( = ?auto_343240 ?auto_343247 ) ) ( not ( = ?auto_343240 ?auto_343248 ) ) ( not ( = ?auto_343240 ?auto_343249 ) ) ( not ( = ?auto_343240 ?auto_343250 ) ) ( not ( = ?auto_343240 ?auto_343251 ) ) ( not ( = ?auto_343241 ?auto_343242 ) ) ( not ( = ?auto_343241 ?auto_343243 ) ) ( not ( = ?auto_343241 ?auto_343244 ) ) ( not ( = ?auto_343241 ?auto_343245 ) ) ( not ( = ?auto_343241 ?auto_343246 ) ) ( not ( = ?auto_343241 ?auto_343247 ) ) ( not ( = ?auto_343241 ?auto_343248 ) ) ( not ( = ?auto_343241 ?auto_343249 ) ) ( not ( = ?auto_343241 ?auto_343250 ) ) ( not ( = ?auto_343241 ?auto_343251 ) ) ( not ( = ?auto_343242 ?auto_343243 ) ) ( not ( = ?auto_343242 ?auto_343244 ) ) ( not ( = ?auto_343242 ?auto_343245 ) ) ( not ( = ?auto_343242 ?auto_343246 ) ) ( not ( = ?auto_343242 ?auto_343247 ) ) ( not ( = ?auto_343242 ?auto_343248 ) ) ( not ( = ?auto_343242 ?auto_343249 ) ) ( not ( = ?auto_343242 ?auto_343250 ) ) ( not ( = ?auto_343242 ?auto_343251 ) ) ( not ( = ?auto_343243 ?auto_343244 ) ) ( not ( = ?auto_343243 ?auto_343245 ) ) ( not ( = ?auto_343243 ?auto_343246 ) ) ( not ( = ?auto_343243 ?auto_343247 ) ) ( not ( = ?auto_343243 ?auto_343248 ) ) ( not ( = ?auto_343243 ?auto_343249 ) ) ( not ( = ?auto_343243 ?auto_343250 ) ) ( not ( = ?auto_343243 ?auto_343251 ) ) ( not ( = ?auto_343244 ?auto_343245 ) ) ( not ( = ?auto_343244 ?auto_343246 ) ) ( not ( = ?auto_343244 ?auto_343247 ) ) ( not ( = ?auto_343244 ?auto_343248 ) ) ( not ( = ?auto_343244 ?auto_343249 ) ) ( not ( = ?auto_343244 ?auto_343250 ) ) ( not ( = ?auto_343244 ?auto_343251 ) ) ( not ( = ?auto_343245 ?auto_343246 ) ) ( not ( = ?auto_343245 ?auto_343247 ) ) ( not ( = ?auto_343245 ?auto_343248 ) ) ( not ( = ?auto_343245 ?auto_343249 ) ) ( not ( = ?auto_343245 ?auto_343250 ) ) ( not ( = ?auto_343245 ?auto_343251 ) ) ( not ( = ?auto_343246 ?auto_343247 ) ) ( not ( = ?auto_343246 ?auto_343248 ) ) ( not ( = ?auto_343246 ?auto_343249 ) ) ( not ( = ?auto_343246 ?auto_343250 ) ) ( not ( = ?auto_343246 ?auto_343251 ) ) ( not ( = ?auto_343247 ?auto_343248 ) ) ( not ( = ?auto_343247 ?auto_343249 ) ) ( not ( = ?auto_343247 ?auto_343250 ) ) ( not ( = ?auto_343247 ?auto_343251 ) ) ( not ( = ?auto_343248 ?auto_343249 ) ) ( not ( = ?auto_343248 ?auto_343250 ) ) ( not ( = ?auto_343248 ?auto_343251 ) ) ( not ( = ?auto_343249 ?auto_343250 ) ) ( not ( = ?auto_343249 ?auto_343251 ) ) ( not ( = ?auto_343250 ?auto_343251 ) ) ( ON ?auto_343249 ?auto_343250 ) ( ON ?auto_343248 ?auto_343249 ) ( ON ?auto_343247 ?auto_343248 ) ( ON ?auto_343246 ?auto_343247 ) ( ON ?auto_343245 ?auto_343246 ) ( ON ?auto_343244 ?auto_343245 ) ( ON ?auto_343243 ?auto_343244 ) ( ON ?auto_343242 ?auto_343243 ) ( ON ?auto_343241 ?auto_343242 ) ( CLEAR ?auto_343239 ) ( ON ?auto_343240 ?auto_343241 ) ( CLEAR ?auto_343240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343237 ?auto_343238 ?auto_343239 ?auto_343240 )
      ( MAKE-14PILE ?auto_343237 ?auto_343238 ?auto_343239 ?auto_343240 ?auto_343241 ?auto_343242 ?auto_343243 ?auto_343244 ?auto_343245 ?auto_343246 ?auto_343247 ?auto_343248 ?auto_343249 ?auto_343250 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343266 - BLOCK
      ?auto_343267 - BLOCK
      ?auto_343268 - BLOCK
      ?auto_343269 - BLOCK
      ?auto_343270 - BLOCK
      ?auto_343271 - BLOCK
      ?auto_343272 - BLOCK
      ?auto_343273 - BLOCK
      ?auto_343274 - BLOCK
      ?auto_343275 - BLOCK
      ?auto_343276 - BLOCK
      ?auto_343277 - BLOCK
      ?auto_343278 - BLOCK
      ?auto_343279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343279 ) ( ON-TABLE ?auto_343266 ) ( ON ?auto_343267 ?auto_343266 ) ( ON ?auto_343268 ?auto_343267 ) ( not ( = ?auto_343266 ?auto_343267 ) ) ( not ( = ?auto_343266 ?auto_343268 ) ) ( not ( = ?auto_343266 ?auto_343269 ) ) ( not ( = ?auto_343266 ?auto_343270 ) ) ( not ( = ?auto_343266 ?auto_343271 ) ) ( not ( = ?auto_343266 ?auto_343272 ) ) ( not ( = ?auto_343266 ?auto_343273 ) ) ( not ( = ?auto_343266 ?auto_343274 ) ) ( not ( = ?auto_343266 ?auto_343275 ) ) ( not ( = ?auto_343266 ?auto_343276 ) ) ( not ( = ?auto_343266 ?auto_343277 ) ) ( not ( = ?auto_343266 ?auto_343278 ) ) ( not ( = ?auto_343266 ?auto_343279 ) ) ( not ( = ?auto_343267 ?auto_343268 ) ) ( not ( = ?auto_343267 ?auto_343269 ) ) ( not ( = ?auto_343267 ?auto_343270 ) ) ( not ( = ?auto_343267 ?auto_343271 ) ) ( not ( = ?auto_343267 ?auto_343272 ) ) ( not ( = ?auto_343267 ?auto_343273 ) ) ( not ( = ?auto_343267 ?auto_343274 ) ) ( not ( = ?auto_343267 ?auto_343275 ) ) ( not ( = ?auto_343267 ?auto_343276 ) ) ( not ( = ?auto_343267 ?auto_343277 ) ) ( not ( = ?auto_343267 ?auto_343278 ) ) ( not ( = ?auto_343267 ?auto_343279 ) ) ( not ( = ?auto_343268 ?auto_343269 ) ) ( not ( = ?auto_343268 ?auto_343270 ) ) ( not ( = ?auto_343268 ?auto_343271 ) ) ( not ( = ?auto_343268 ?auto_343272 ) ) ( not ( = ?auto_343268 ?auto_343273 ) ) ( not ( = ?auto_343268 ?auto_343274 ) ) ( not ( = ?auto_343268 ?auto_343275 ) ) ( not ( = ?auto_343268 ?auto_343276 ) ) ( not ( = ?auto_343268 ?auto_343277 ) ) ( not ( = ?auto_343268 ?auto_343278 ) ) ( not ( = ?auto_343268 ?auto_343279 ) ) ( not ( = ?auto_343269 ?auto_343270 ) ) ( not ( = ?auto_343269 ?auto_343271 ) ) ( not ( = ?auto_343269 ?auto_343272 ) ) ( not ( = ?auto_343269 ?auto_343273 ) ) ( not ( = ?auto_343269 ?auto_343274 ) ) ( not ( = ?auto_343269 ?auto_343275 ) ) ( not ( = ?auto_343269 ?auto_343276 ) ) ( not ( = ?auto_343269 ?auto_343277 ) ) ( not ( = ?auto_343269 ?auto_343278 ) ) ( not ( = ?auto_343269 ?auto_343279 ) ) ( not ( = ?auto_343270 ?auto_343271 ) ) ( not ( = ?auto_343270 ?auto_343272 ) ) ( not ( = ?auto_343270 ?auto_343273 ) ) ( not ( = ?auto_343270 ?auto_343274 ) ) ( not ( = ?auto_343270 ?auto_343275 ) ) ( not ( = ?auto_343270 ?auto_343276 ) ) ( not ( = ?auto_343270 ?auto_343277 ) ) ( not ( = ?auto_343270 ?auto_343278 ) ) ( not ( = ?auto_343270 ?auto_343279 ) ) ( not ( = ?auto_343271 ?auto_343272 ) ) ( not ( = ?auto_343271 ?auto_343273 ) ) ( not ( = ?auto_343271 ?auto_343274 ) ) ( not ( = ?auto_343271 ?auto_343275 ) ) ( not ( = ?auto_343271 ?auto_343276 ) ) ( not ( = ?auto_343271 ?auto_343277 ) ) ( not ( = ?auto_343271 ?auto_343278 ) ) ( not ( = ?auto_343271 ?auto_343279 ) ) ( not ( = ?auto_343272 ?auto_343273 ) ) ( not ( = ?auto_343272 ?auto_343274 ) ) ( not ( = ?auto_343272 ?auto_343275 ) ) ( not ( = ?auto_343272 ?auto_343276 ) ) ( not ( = ?auto_343272 ?auto_343277 ) ) ( not ( = ?auto_343272 ?auto_343278 ) ) ( not ( = ?auto_343272 ?auto_343279 ) ) ( not ( = ?auto_343273 ?auto_343274 ) ) ( not ( = ?auto_343273 ?auto_343275 ) ) ( not ( = ?auto_343273 ?auto_343276 ) ) ( not ( = ?auto_343273 ?auto_343277 ) ) ( not ( = ?auto_343273 ?auto_343278 ) ) ( not ( = ?auto_343273 ?auto_343279 ) ) ( not ( = ?auto_343274 ?auto_343275 ) ) ( not ( = ?auto_343274 ?auto_343276 ) ) ( not ( = ?auto_343274 ?auto_343277 ) ) ( not ( = ?auto_343274 ?auto_343278 ) ) ( not ( = ?auto_343274 ?auto_343279 ) ) ( not ( = ?auto_343275 ?auto_343276 ) ) ( not ( = ?auto_343275 ?auto_343277 ) ) ( not ( = ?auto_343275 ?auto_343278 ) ) ( not ( = ?auto_343275 ?auto_343279 ) ) ( not ( = ?auto_343276 ?auto_343277 ) ) ( not ( = ?auto_343276 ?auto_343278 ) ) ( not ( = ?auto_343276 ?auto_343279 ) ) ( not ( = ?auto_343277 ?auto_343278 ) ) ( not ( = ?auto_343277 ?auto_343279 ) ) ( not ( = ?auto_343278 ?auto_343279 ) ) ( ON ?auto_343278 ?auto_343279 ) ( ON ?auto_343277 ?auto_343278 ) ( ON ?auto_343276 ?auto_343277 ) ( ON ?auto_343275 ?auto_343276 ) ( ON ?auto_343274 ?auto_343275 ) ( ON ?auto_343273 ?auto_343274 ) ( ON ?auto_343272 ?auto_343273 ) ( ON ?auto_343271 ?auto_343272 ) ( ON ?auto_343270 ?auto_343271 ) ( CLEAR ?auto_343268 ) ( ON ?auto_343269 ?auto_343270 ) ( CLEAR ?auto_343269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_343266 ?auto_343267 ?auto_343268 ?auto_343269 )
      ( MAKE-14PILE ?auto_343266 ?auto_343267 ?auto_343268 ?auto_343269 ?auto_343270 ?auto_343271 ?auto_343272 ?auto_343273 ?auto_343274 ?auto_343275 ?auto_343276 ?auto_343277 ?auto_343278 ?auto_343279 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343294 - BLOCK
      ?auto_343295 - BLOCK
      ?auto_343296 - BLOCK
      ?auto_343297 - BLOCK
      ?auto_343298 - BLOCK
      ?auto_343299 - BLOCK
      ?auto_343300 - BLOCK
      ?auto_343301 - BLOCK
      ?auto_343302 - BLOCK
      ?auto_343303 - BLOCK
      ?auto_343304 - BLOCK
      ?auto_343305 - BLOCK
      ?auto_343306 - BLOCK
      ?auto_343307 - BLOCK
    )
    :vars
    (
      ?auto_343308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343307 ?auto_343308 ) ( ON-TABLE ?auto_343294 ) ( ON ?auto_343295 ?auto_343294 ) ( not ( = ?auto_343294 ?auto_343295 ) ) ( not ( = ?auto_343294 ?auto_343296 ) ) ( not ( = ?auto_343294 ?auto_343297 ) ) ( not ( = ?auto_343294 ?auto_343298 ) ) ( not ( = ?auto_343294 ?auto_343299 ) ) ( not ( = ?auto_343294 ?auto_343300 ) ) ( not ( = ?auto_343294 ?auto_343301 ) ) ( not ( = ?auto_343294 ?auto_343302 ) ) ( not ( = ?auto_343294 ?auto_343303 ) ) ( not ( = ?auto_343294 ?auto_343304 ) ) ( not ( = ?auto_343294 ?auto_343305 ) ) ( not ( = ?auto_343294 ?auto_343306 ) ) ( not ( = ?auto_343294 ?auto_343307 ) ) ( not ( = ?auto_343294 ?auto_343308 ) ) ( not ( = ?auto_343295 ?auto_343296 ) ) ( not ( = ?auto_343295 ?auto_343297 ) ) ( not ( = ?auto_343295 ?auto_343298 ) ) ( not ( = ?auto_343295 ?auto_343299 ) ) ( not ( = ?auto_343295 ?auto_343300 ) ) ( not ( = ?auto_343295 ?auto_343301 ) ) ( not ( = ?auto_343295 ?auto_343302 ) ) ( not ( = ?auto_343295 ?auto_343303 ) ) ( not ( = ?auto_343295 ?auto_343304 ) ) ( not ( = ?auto_343295 ?auto_343305 ) ) ( not ( = ?auto_343295 ?auto_343306 ) ) ( not ( = ?auto_343295 ?auto_343307 ) ) ( not ( = ?auto_343295 ?auto_343308 ) ) ( not ( = ?auto_343296 ?auto_343297 ) ) ( not ( = ?auto_343296 ?auto_343298 ) ) ( not ( = ?auto_343296 ?auto_343299 ) ) ( not ( = ?auto_343296 ?auto_343300 ) ) ( not ( = ?auto_343296 ?auto_343301 ) ) ( not ( = ?auto_343296 ?auto_343302 ) ) ( not ( = ?auto_343296 ?auto_343303 ) ) ( not ( = ?auto_343296 ?auto_343304 ) ) ( not ( = ?auto_343296 ?auto_343305 ) ) ( not ( = ?auto_343296 ?auto_343306 ) ) ( not ( = ?auto_343296 ?auto_343307 ) ) ( not ( = ?auto_343296 ?auto_343308 ) ) ( not ( = ?auto_343297 ?auto_343298 ) ) ( not ( = ?auto_343297 ?auto_343299 ) ) ( not ( = ?auto_343297 ?auto_343300 ) ) ( not ( = ?auto_343297 ?auto_343301 ) ) ( not ( = ?auto_343297 ?auto_343302 ) ) ( not ( = ?auto_343297 ?auto_343303 ) ) ( not ( = ?auto_343297 ?auto_343304 ) ) ( not ( = ?auto_343297 ?auto_343305 ) ) ( not ( = ?auto_343297 ?auto_343306 ) ) ( not ( = ?auto_343297 ?auto_343307 ) ) ( not ( = ?auto_343297 ?auto_343308 ) ) ( not ( = ?auto_343298 ?auto_343299 ) ) ( not ( = ?auto_343298 ?auto_343300 ) ) ( not ( = ?auto_343298 ?auto_343301 ) ) ( not ( = ?auto_343298 ?auto_343302 ) ) ( not ( = ?auto_343298 ?auto_343303 ) ) ( not ( = ?auto_343298 ?auto_343304 ) ) ( not ( = ?auto_343298 ?auto_343305 ) ) ( not ( = ?auto_343298 ?auto_343306 ) ) ( not ( = ?auto_343298 ?auto_343307 ) ) ( not ( = ?auto_343298 ?auto_343308 ) ) ( not ( = ?auto_343299 ?auto_343300 ) ) ( not ( = ?auto_343299 ?auto_343301 ) ) ( not ( = ?auto_343299 ?auto_343302 ) ) ( not ( = ?auto_343299 ?auto_343303 ) ) ( not ( = ?auto_343299 ?auto_343304 ) ) ( not ( = ?auto_343299 ?auto_343305 ) ) ( not ( = ?auto_343299 ?auto_343306 ) ) ( not ( = ?auto_343299 ?auto_343307 ) ) ( not ( = ?auto_343299 ?auto_343308 ) ) ( not ( = ?auto_343300 ?auto_343301 ) ) ( not ( = ?auto_343300 ?auto_343302 ) ) ( not ( = ?auto_343300 ?auto_343303 ) ) ( not ( = ?auto_343300 ?auto_343304 ) ) ( not ( = ?auto_343300 ?auto_343305 ) ) ( not ( = ?auto_343300 ?auto_343306 ) ) ( not ( = ?auto_343300 ?auto_343307 ) ) ( not ( = ?auto_343300 ?auto_343308 ) ) ( not ( = ?auto_343301 ?auto_343302 ) ) ( not ( = ?auto_343301 ?auto_343303 ) ) ( not ( = ?auto_343301 ?auto_343304 ) ) ( not ( = ?auto_343301 ?auto_343305 ) ) ( not ( = ?auto_343301 ?auto_343306 ) ) ( not ( = ?auto_343301 ?auto_343307 ) ) ( not ( = ?auto_343301 ?auto_343308 ) ) ( not ( = ?auto_343302 ?auto_343303 ) ) ( not ( = ?auto_343302 ?auto_343304 ) ) ( not ( = ?auto_343302 ?auto_343305 ) ) ( not ( = ?auto_343302 ?auto_343306 ) ) ( not ( = ?auto_343302 ?auto_343307 ) ) ( not ( = ?auto_343302 ?auto_343308 ) ) ( not ( = ?auto_343303 ?auto_343304 ) ) ( not ( = ?auto_343303 ?auto_343305 ) ) ( not ( = ?auto_343303 ?auto_343306 ) ) ( not ( = ?auto_343303 ?auto_343307 ) ) ( not ( = ?auto_343303 ?auto_343308 ) ) ( not ( = ?auto_343304 ?auto_343305 ) ) ( not ( = ?auto_343304 ?auto_343306 ) ) ( not ( = ?auto_343304 ?auto_343307 ) ) ( not ( = ?auto_343304 ?auto_343308 ) ) ( not ( = ?auto_343305 ?auto_343306 ) ) ( not ( = ?auto_343305 ?auto_343307 ) ) ( not ( = ?auto_343305 ?auto_343308 ) ) ( not ( = ?auto_343306 ?auto_343307 ) ) ( not ( = ?auto_343306 ?auto_343308 ) ) ( not ( = ?auto_343307 ?auto_343308 ) ) ( ON ?auto_343306 ?auto_343307 ) ( ON ?auto_343305 ?auto_343306 ) ( ON ?auto_343304 ?auto_343305 ) ( ON ?auto_343303 ?auto_343304 ) ( ON ?auto_343302 ?auto_343303 ) ( ON ?auto_343301 ?auto_343302 ) ( ON ?auto_343300 ?auto_343301 ) ( ON ?auto_343299 ?auto_343300 ) ( ON ?auto_343298 ?auto_343299 ) ( ON ?auto_343297 ?auto_343298 ) ( CLEAR ?auto_343295 ) ( ON ?auto_343296 ?auto_343297 ) ( CLEAR ?auto_343296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343294 ?auto_343295 ?auto_343296 )
      ( MAKE-14PILE ?auto_343294 ?auto_343295 ?auto_343296 ?auto_343297 ?auto_343298 ?auto_343299 ?auto_343300 ?auto_343301 ?auto_343302 ?auto_343303 ?auto_343304 ?auto_343305 ?auto_343306 ?auto_343307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343323 - BLOCK
      ?auto_343324 - BLOCK
      ?auto_343325 - BLOCK
      ?auto_343326 - BLOCK
      ?auto_343327 - BLOCK
      ?auto_343328 - BLOCK
      ?auto_343329 - BLOCK
      ?auto_343330 - BLOCK
      ?auto_343331 - BLOCK
      ?auto_343332 - BLOCK
      ?auto_343333 - BLOCK
      ?auto_343334 - BLOCK
      ?auto_343335 - BLOCK
      ?auto_343336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343336 ) ( ON-TABLE ?auto_343323 ) ( ON ?auto_343324 ?auto_343323 ) ( not ( = ?auto_343323 ?auto_343324 ) ) ( not ( = ?auto_343323 ?auto_343325 ) ) ( not ( = ?auto_343323 ?auto_343326 ) ) ( not ( = ?auto_343323 ?auto_343327 ) ) ( not ( = ?auto_343323 ?auto_343328 ) ) ( not ( = ?auto_343323 ?auto_343329 ) ) ( not ( = ?auto_343323 ?auto_343330 ) ) ( not ( = ?auto_343323 ?auto_343331 ) ) ( not ( = ?auto_343323 ?auto_343332 ) ) ( not ( = ?auto_343323 ?auto_343333 ) ) ( not ( = ?auto_343323 ?auto_343334 ) ) ( not ( = ?auto_343323 ?auto_343335 ) ) ( not ( = ?auto_343323 ?auto_343336 ) ) ( not ( = ?auto_343324 ?auto_343325 ) ) ( not ( = ?auto_343324 ?auto_343326 ) ) ( not ( = ?auto_343324 ?auto_343327 ) ) ( not ( = ?auto_343324 ?auto_343328 ) ) ( not ( = ?auto_343324 ?auto_343329 ) ) ( not ( = ?auto_343324 ?auto_343330 ) ) ( not ( = ?auto_343324 ?auto_343331 ) ) ( not ( = ?auto_343324 ?auto_343332 ) ) ( not ( = ?auto_343324 ?auto_343333 ) ) ( not ( = ?auto_343324 ?auto_343334 ) ) ( not ( = ?auto_343324 ?auto_343335 ) ) ( not ( = ?auto_343324 ?auto_343336 ) ) ( not ( = ?auto_343325 ?auto_343326 ) ) ( not ( = ?auto_343325 ?auto_343327 ) ) ( not ( = ?auto_343325 ?auto_343328 ) ) ( not ( = ?auto_343325 ?auto_343329 ) ) ( not ( = ?auto_343325 ?auto_343330 ) ) ( not ( = ?auto_343325 ?auto_343331 ) ) ( not ( = ?auto_343325 ?auto_343332 ) ) ( not ( = ?auto_343325 ?auto_343333 ) ) ( not ( = ?auto_343325 ?auto_343334 ) ) ( not ( = ?auto_343325 ?auto_343335 ) ) ( not ( = ?auto_343325 ?auto_343336 ) ) ( not ( = ?auto_343326 ?auto_343327 ) ) ( not ( = ?auto_343326 ?auto_343328 ) ) ( not ( = ?auto_343326 ?auto_343329 ) ) ( not ( = ?auto_343326 ?auto_343330 ) ) ( not ( = ?auto_343326 ?auto_343331 ) ) ( not ( = ?auto_343326 ?auto_343332 ) ) ( not ( = ?auto_343326 ?auto_343333 ) ) ( not ( = ?auto_343326 ?auto_343334 ) ) ( not ( = ?auto_343326 ?auto_343335 ) ) ( not ( = ?auto_343326 ?auto_343336 ) ) ( not ( = ?auto_343327 ?auto_343328 ) ) ( not ( = ?auto_343327 ?auto_343329 ) ) ( not ( = ?auto_343327 ?auto_343330 ) ) ( not ( = ?auto_343327 ?auto_343331 ) ) ( not ( = ?auto_343327 ?auto_343332 ) ) ( not ( = ?auto_343327 ?auto_343333 ) ) ( not ( = ?auto_343327 ?auto_343334 ) ) ( not ( = ?auto_343327 ?auto_343335 ) ) ( not ( = ?auto_343327 ?auto_343336 ) ) ( not ( = ?auto_343328 ?auto_343329 ) ) ( not ( = ?auto_343328 ?auto_343330 ) ) ( not ( = ?auto_343328 ?auto_343331 ) ) ( not ( = ?auto_343328 ?auto_343332 ) ) ( not ( = ?auto_343328 ?auto_343333 ) ) ( not ( = ?auto_343328 ?auto_343334 ) ) ( not ( = ?auto_343328 ?auto_343335 ) ) ( not ( = ?auto_343328 ?auto_343336 ) ) ( not ( = ?auto_343329 ?auto_343330 ) ) ( not ( = ?auto_343329 ?auto_343331 ) ) ( not ( = ?auto_343329 ?auto_343332 ) ) ( not ( = ?auto_343329 ?auto_343333 ) ) ( not ( = ?auto_343329 ?auto_343334 ) ) ( not ( = ?auto_343329 ?auto_343335 ) ) ( not ( = ?auto_343329 ?auto_343336 ) ) ( not ( = ?auto_343330 ?auto_343331 ) ) ( not ( = ?auto_343330 ?auto_343332 ) ) ( not ( = ?auto_343330 ?auto_343333 ) ) ( not ( = ?auto_343330 ?auto_343334 ) ) ( not ( = ?auto_343330 ?auto_343335 ) ) ( not ( = ?auto_343330 ?auto_343336 ) ) ( not ( = ?auto_343331 ?auto_343332 ) ) ( not ( = ?auto_343331 ?auto_343333 ) ) ( not ( = ?auto_343331 ?auto_343334 ) ) ( not ( = ?auto_343331 ?auto_343335 ) ) ( not ( = ?auto_343331 ?auto_343336 ) ) ( not ( = ?auto_343332 ?auto_343333 ) ) ( not ( = ?auto_343332 ?auto_343334 ) ) ( not ( = ?auto_343332 ?auto_343335 ) ) ( not ( = ?auto_343332 ?auto_343336 ) ) ( not ( = ?auto_343333 ?auto_343334 ) ) ( not ( = ?auto_343333 ?auto_343335 ) ) ( not ( = ?auto_343333 ?auto_343336 ) ) ( not ( = ?auto_343334 ?auto_343335 ) ) ( not ( = ?auto_343334 ?auto_343336 ) ) ( not ( = ?auto_343335 ?auto_343336 ) ) ( ON ?auto_343335 ?auto_343336 ) ( ON ?auto_343334 ?auto_343335 ) ( ON ?auto_343333 ?auto_343334 ) ( ON ?auto_343332 ?auto_343333 ) ( ON ?auto_343331 ?auto_343332 ) ( ON ?auto_343330 ?auto_343331 ) ( ON ?auto_343329 ?auto_343330 ) ( ON ?auto_343328 ?auto_343329 ) ( ON ?auto_343327 ?auto_343328 ) ( ON ?auto_343326 ?auto_343327 ) ( CLEAR ?auto_343324 ) ( ON ?auto_343325 ?auto_343326 ) ( CLEAR ?auto_343325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_343323 ?auto_343324 ?auto_343325 )
      ( MAKE-14PILE ?auto_343323 ?auto_343324 ?auto_343325 ?auto_343326 ?auto_343327 ?auto_343328 ?auto_343329 ?auto_343330 ?auto_343331 ?auto_343332 ?auto_343333 ?auto_343334 ?auto_343335 ?auto_343336 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343351 - BLOCK
      ?auto_343352 - BLOCK
      ?auto_343353 - BLOCK
      ?auto_343354 - BLOCK
      ?auto_343355 - BLOCK
      ?auto_343356 - BLOCK
      ?auto_343357 - BLOCK
      ?auto_343358 - BLOCK
      ?auto_343359 - BLOCK
      ?auto_343360 - BLOCK
      ?auto_343361 - BLOCK
      ?auto_343362 - BLOCK
      ?auto_343363 - BLOCK
      ?auto_343364 - BLOCK
    )
    :vars
    (
      ?auto_343365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343364 ?auto_343365 ) ( ON-TABLE ?auto_343351 ) ( not ( = ?auto_343351 ?auto_343352 ) ) ( not ( = ?auto_343351 ?auto_343353 ) ) ( not ( = ?auto_343351 ?auto_343354 ) ) ( not ( = ?auto_343351 ?auto_343355 ) ) ( not ( = ?auto_343351 ?auto_343356 ) ) ( not ( = ?auto_343351 ?auto_343357 ) ) ( not ( = ?auto_343351 ?auto_343358 ) ) ( not ( = ?auto_343351 ?auto_343359 ) ) ( not ( = ?auto_343351 ?auto_343360 ) ) ( not ( = ?auto_343351 ?auto_343361 ) ) ( not ( = ?auto_343351 ?auto_343362 ) ) ( not ( = ?auto_343351 ?auto_343363 ) ) ( not ( = ?auto_343351 ?auto_343364 ) ) ( not ( = ?auto_343351 ?auto_343365 ) ) ( not ( = ?auto_343352 ?auto_343353 ) ) ( not ( = ?auto_343352 ?auto_343354 ) ) ( not ( = ?auto_343352 ?auto_343355 ) ) ( not ( = ?auto_343352 ?auto_343356 ) ) ( not ( = ?auto_343352 ?auto_343357 ) ) ( not ( = ?auto_343352 ?auto_343358 ) ) ( not ( = ?auto_343352 ?auto_343359 ) ) ( not ( = ?auto_343352 ?auto_343360 ) ) ( not ( = ?auto_343352 ?auto_343361 ) ) ( not ( = ?auto_343352 ?auto_343362 ) ) ( not ( = ?auto_343352 ?auto_343363 ) ) ( not ( = ?auto_343352 ?auto_343364 ) ) ( not ( = ?auto_343352 ?auto_343365 ) ) ( not ( = ?auto_343353 ?auto_343354 ) ) ( not ( = ?auto_343353 ?auto_343355 ) ) ( not ( = ?auto_343353 ?auto_343356 ) ) ( not ( = ?auto_343353 ?auto_343357 ) ) ( not ( = ?auto_343353 ?auto_343358 ) ) ( not ( = ?auto_343353 ?auto_343359 ) ) ( not ( = ?auto_343353 ?auto_343360 ) ) ( not ( = ?auto_343353 ?auto_343361 ) ) ( not ( = ?auto_343353 ?auto_343362 ) ) ( not ( = ?auto_343353 ?auto_343363 ) ) ( not ( = ?auto_343353 ?auto_343364 ) ) ( not ( = ?auto_343353 ?auto_343365 ) ) ( not ( = ?auto_343354 ?auto_343355 ) ) ( not ( = ?auto_343354 ?auto_343356 ) ) ( not ( = ?auto_343354 ?auto_343357 ) ) ( not ( = ?auto_343354 ?auto_343358 ) ) ( not ( = ?auto_343354 ?auto_343359 ) ) ( not ( = ?auto_343354 ?auto_343360 ) ) ( not ( = ?auto_343354 ?auto_343361 ) ) ( not ( = ?auto_343354 ?auto_343362 ) ) ( not ( = ?auto_343354 ?auto_343363 ) ) ( not ( = ?auto_343354 ?auto_343364 ) ) ( not ( = ?auto_343354 ?auto_343365 ) ) ( not ( = ?auto_343355 ?auto_343356 ) ) ( not ( = ?auto_343355 ?auto_343357 ) ) ( not ( = ?auto_343355 ?auto_343358 ) ) ( not ( = ?auto_343355 ?auto_343359 ) ) ( not ( = ?auto_343355 ?auto_343360 ) ) ( not ( = ?auto_343355 ?auto_343361 ) ) ( not ( = ?auto_343355 ?auto_343362 ) ) ( not ( = ?auto_343355 ?auto_343363 ) ) ( not ( = ?auto_343355 ?auto_343364 ) ) ( not ( = ?auto_343355 ?auto_343365 ) ) ( not ( = ?auto_343356 ?auto_343357 ) ) ( not ( = ?auto_343356 ?auto_343358 ) ) ( not ( = ?auto_343356 ?auto_343359 ) ) ( not ( = ?auto_343356 ?auto_343360 ) ) ( not ( = ?auto_343356 ?auto_343361 ) ) ( not ( = ?auto_343356 ?auto_343362 ) ) ( not ( = ?auto_343356 ?auto_343363 ) ) ( not ( = ?auto_343356 ?auto_343364 ) ) ( not ( = ?auto_343356 ?auto_343365 ) ) ( not ( = ?auto_343357 ?auto_343358 ) ) ( not ( = ?auto_343357 ?auto_343359 ) ) ( not ( = ?auto_343357 ?auto_343360 ) ) ( not ( = ?auto_343357 ?auto_343361 ) ) ( not ( = ?auto_343357 ?auto_343362 ) ) ( not ( = ?auto_343357 ?auto_343363 ) ) ( not ( = ?auto_343357 ?auto_343364 ) ) ( not ( = ?auto_343357 ?auto_343365 ) ) ( not ( = ?auto_343358 ?auto_343359 ) ) ( not ( = ?auto_343358 ?auto_343360 ) ) ( not ( = ?auto_343358 ?auto_343361 ) ) ( not ( = ?auto_343358 ?auto_343362 ) ) ( not ( = ?auto_343358 ?auto_343363 ) ) ( not ( = ?auto_343358 ?auto_343364 ) ) ( not ( = ?auto_343358 ?auto_343365 ) ) ( not ( = ?auto_343359 ?auto_343360 ) ) ( not ( = ?auto_343359 ?auto_343361 ) ) ( not ( = ?auto_343359 ?auto_343362 ) ) ( not ( = ?auto_343359 ?auto_343363 ) ) ( not ( = ?auto_343359 ?auto_343364 ) ) ( not ( = ?auto_343359 ?auto_343365 ) ) ( not ( = ?auto_343360 ?auto_343361 ) ) ( not ( = ?auto_343360 ?auto_343362 ) ) ( not ( = ?auto_343360 ?auto_343363 ) ) ( not ( = ?auto_343360 ?auto_343364 ) ) ( not ( = ?auto_343360 ?auto_343365 ) ) ( not ( = ?auto_343361 ?auto_343362 ) ) ( not ( = ?auto_343361 ?auto_343363 ) ) ( not ( = ?auto_343361 ?auto_343364 ) ) ( not ( = ?auto_343361 ?auto_343365 ) ) ( not ( = ?auto_343362 ?auto_343363 ) ) ( not ( = ?auto_343362 ?auto_343364 ) ) ( not ( = ?auto_343362 ?auto_343365 ) ) ( not ( = ?auto_343363 ?auto_343364 ) ) ( not ( = ?auto_343363 ?auto_343365 ) ) ( not ( = ?auto_343364 ?auto_343365 ) ) ( ON ?auto_343363 ?auto_343364 ) ( ON ?auto_343362 ?auto_343363 ) ( ON ?auto_343361 ?auto_343362 ) ( ON ?auto_343360 ?auto_343361 ) ( ON ?auto_343359 ?auto_343360 ) ( ON ?auto_343358 ?auto_343359 ) ( ON ?auto_343357 ?auto_343358 ) ( ON ?auto_343356 ?auto_343357 ) ( ON ?auto_343355 ?auto_343356 ) ( ON ?auto_343354 ?auto_343355 ) ( ON ?auto_343353 ?auto_343354 ) ( CLEAR ?auto_343351 ) ( ON ?auto_343352 ?auto_343353 ) ( CLEAR ?auto_343352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343351 ?auto_343352 )
      ( MAKE-14PILE ?auto_343351 ?auto_343352 ?auto_343353 ?auto_343354 ?auto_343355 ?auto_343356 ?auto_343357 ?auto_343358 ?auto_343359 ?auto_343360 ?auto_343361 ?auto_343362 ?auto_343363 ?auto_343364 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343380 - BLOCK
      ?auto_343381 - BLOCK
      ?auto_343382 - BLOCK
      ?auto_343383 - BLOCK
      ?auto_343384 - BLOCK
      ?auto_343385 - BLOCK
      ?auto_343386 - BLOCK
      ?auto_343387 - BLOCK
      ?auto_343388 - BLOCK
      ?auto_343389 - BLOCK
      ?auto_343390 - BLOCK
      ?auto_343391 - BLOCK
      ?auto_343392 - BLOCK
      ?auto_343393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343393 ) ( ON-TABLE ?auto_343380 ) ( not ( = ?auto_343380 ?auto_343381 ) ) ( not ( = ?auto_343380 ?auto_343382 ) ) ( not ( = ?auto_343380 ?auto_343383 ) ) ( not ( = ?auto_343380 ?auto_343384 ) ) ( not ( = ?auto_343380 ?auto_343385 ) ) ( not ( = ?auto_343380 ?auto_343386 ) ) ( not ( = ?auto_343380 ?auto_343387 ) ) ( not ( = ?auto_343380 ?auto_343388 ) ) ( not ( = ?auto_343380 ?auto_343389 ) ) ( not ( = ?auto_343380 ?auto_343390 ) ) ( not ( = ?auto_343380 ?auto_343391 ) ) ( not ( = ?auto_343380 ?auto_343392 ) ) ( not ( = ?auto_343380 ?auto_343393 ) ) ( not ( = ?auto_343381 ?auto_343382 ) ) ( not ( = ?auto_343381 ?auto_343383 ) ) ( not ( = ?auto_343381 ?auto_343384 ) ) ( not ( = ?auto_343381 ?auto_343385 ) ) ( not ( = ?auto_343381 ?auto_343386 ) ) ( not ( = ?auto_343381 ?auto_343387 ) ) ( not ( = ?auto_343381 ?auto_343388 ) ) ( not ( = ?auto_343381 ?auto_343389 ) ) ( not ( = ?auto_343381 ?auto_343390 ) ) ( not ( = ?auto_343381 ?auto_343391 ) ) ( not ( = ?auto_343381 ?auto_343392 ) ) ( not ( = ?auto_343381 ?auto_343393 ) ) ( not ( = ?auto_343382 ?auto_343383 ) ) ( not ( = ?auto_343382 ?auto_343384 ) ) ( not ( = ?auto_343382 ?auto_343385 ) ) ( not ( = ?auto_343382 ?auto_343386 ) ) ( not ( = ?auto_343382 ?auto_343387 ) ) ( not ( = ?auto_343382 ?auto_343388 ) ) ( not ( = ?auto_343382 ?auto_343389 ) ) ( not ( = ?auto_343382 ?auto_343390 ) ) ( not ( = ?auto_343382 ?auto_343391 ) ) ( not ( = ?auto_343382 ?auto_343392 ) ) ( not ( = ?auto_343382 ?auto_343393 ) ) ( not ( = ?auto_343383 ?auto_343384 ) ) ( not ( = ?auto_343383 ?auto_343385 ) ) ( not ( = ?auto_343383 ?auto_343386 ) ) ( not ( = ?auto_343383 ?auto_343387 ) ) ( not ( = ?auto_343383 ?auto_343388 ) ) ( not ( = ?auto_343383 ?auto_343389 ) ) ( not ( = ?auto_343383 ?auto_343390 ) ) ( not ( = ?auto_343383 ?auto_343391 ) ) ( not ( = ?auto_343383 ?auto_343392 ) ) ( not ( = ?auto_343383 ?auto_343393 ) ) ( not ( = ?auto_343384 ?auto_343385 ) ) ( not ( = ?auto_343384 ?auto_343386 ) ) ( not ( = ?auto_343384 ?auto_343387 ) ) ( not ( = ?auto_343384 ?auto_343388 ) ) ( not ( = ?auto_343384 ?auto_343389 ) ) ( not ( = ?auto_343384 ?auto_343390 ) ) ( not ( = ?auto_343384 ?auto_343391 ) ) ( not ( = ?auto_343384 ?auto_343392 ) ) ( not ( = ?auto_343384 ?auto_343393 ) ) ( not ( = ?auto_343385 ?auto_343386 ) ) ( not ( = ?auto_343385 ?auto_343387 ) ) ( not ( = ?auto_343385 ?auto_343388 ) ) ( not ( = ?auto_343385 ?auto_343389 ) ) ( not ( = ?auto_343385 ?auto_343390 ) ) ( not ( = ?auto_343385 ?auto_343391 ) ) ( not ( = ?auto_343385 ?auto_343392 ) ) ( not ( = ?auto_343385 ?auto_343393 ) ) ( not ( = ?auto_343386 ?auto_343387 ) ) ( not ( = ?auto_343386 ?auto_343388 ) ) ( not ( = ?auto_343386 ?auto_343389 ) ) ( not ( = ?auto_343386 ?auto_343390 ) ) ( not ( = ?auto_343386 ?auto_343391 ) ) ( not ( = ?auto_343386 ?auto_343392 ) ) ( not ( = ?auto_343386 ?auto_343393 ) ) ( not ( = ?auto_343387 ?auto_343388 ) ) ( not ( = ?auto_343387 ?auto_343389 ) ) ( not ( = ?auto_343387 ?auto_343390 ) ) ( not ( = ?auto_343387 ?auto_343391 ) ) ( not ( = ?auto_343387 ?auto_343392 ) ) ( not ( = ?auto_343387 ?auto_343393 ) ) ( not ( = ?auto_343388 ?auto_343389 ) ) ( not ( = ?auto_343388 ?auto_343390 ) ) ( not ( = ?auto_343388 ?auto_343391 ) ) ( not ( = ?auto_343388 ?auto_343392 ) ) ( not ( = ?auto_343388 ?auto_343393 ) ) ( not ( = ?auto_343389 ?auto_343390 ) ) ( not ( = ?auto_343389 ?auto_343391 ) ) ( not ( = ?auto_343389 ?auto_343392 ) ) ( not ( = ?auto_343389 ?auto_343393 ) ) ( not ( = ?auto_343390 ?auto_343391 ) ) ( not ( = ?auto_343390 ?auto_343392 ) ) ( not ( = ?auto_343390 ?auto_343393 ) ) ( not ( = ?auto_343391 ?auto_343392 ) ) ( not ( = ?auto_343391 ?auto_343393 ) ) ( not ( = ?auto_343392 ?auto_343393 ) ) ( ON ?auto_343392 ?auto_343393 ) ( ON ?auto_343391 ?auto_343392 ) ( ON ?auto_343390 ?auto_343391 ) ( ON ?auto_343389 ?auto_343390 ) ( ON ?auto_343388 ?auto_343389 ) ( ON ?auto_343387 ?auto_343388 ) ( ON ?auto_343386 ?auto_343387 ) ( ON ?auto_343385 ?auto_343386 ) ( ON ?auto_343384 ?auto_343385 ) ( ON ?auto_343383 ?auto_343384 ) ( ON ?auto_343382 ?auto_343383 ) ( CLEAR ?auto_343380 ) ( ON ?auto_343381 ?auto_343382 ) ( CLEAR ?auto_343381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_343380 ?auto_343381 )
      ( MAKE-14PILE ?auto_343380 ?auto_343381 ?auto_343382 ?auto_343383 ?auto_343384 ?auto_343385 ?auto_343386 ?auto_343387 ?auto_343388 ?auto_343389 ?auto_343390 ?auto_343391 ?auto_343392 ?auto_343393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343408 - BLOCK
      ?auto_343409 - BLOCK
      ?auto_343410 - BLOCK
      ?auto_343411 - BLOCK
      ?auto_343412 - BLOCK
      ?auto_343413 - BLOCK
      ?auto_343414 - BLOCK
      ?auto_343415 - BLOCK
      ?auto_343416 - BLOCK
      ?auto_343417 - BLOCK
      ?auto_343418 - BLOCK
      ?auto_343419 - BLOCK
      ?auto_343420 - BLOCK
      ?auto_343421 - BLOCK
    )
    :vars
    (
      ?auto_343422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343421 ?auto_343422 ) ( not ( = ?auto_343408 ?auto_343409 ) ) ( not ( = ?auto_343408 ?auto_343410 ) ) ( not ( = ?auto_343408 ?auto_343411 ) ) ( not ( = ?auto_343408 ?auto_343412 ) ) ( not ( = ?auto_343408 ?auto_343413 ) ) ( not ( = ?auto_343408 ?auto_343414 ) ) ( not ( = ?auto_343408 ?auto_343415 ) ) ( not ( = ?auto_343408 ?auto_343416 ) ) ( not ( = ?auto_343408 ?auto_343417 ) ) ( not ( = ?auto_343408 ?auto_343418 ) ) ( not ( = ?auto_343408 ?auto_343419 ) ) ( not ( = ?auto_343408 ?auto_343420 ) ) ( not ( = ?auto_343408 ?auto_343421 ) ) ( not ( = ?auto_343408 ?auto_343422 ) ) ( not ( = ?auto_343409 ?auto_343410 ) ) ( not ( = ?auto_343409 ?auto_343411 ) ) ( not ( = ?auto_343409 ?auto_343412 ) ) ( not ( = ?auto_343409 ?auto_343413 ) ) ( not ( = ?auto_343409 ?auto_343414 ) ) ( not ( = ?auto_343409 ?auto_343415 ) ) ( not ( = ?auto_343409 ?auto_343416 ) ) ( not ( = ?auto_343409 ?auto_343417 ) ) ( not ( = ?auto_343409 ?auto_343418 ) ) ( not ( = ?auto_343409 ?auto_343419 ) ) ( not ( = ?auto_343409 ?auto_343420 ) ) ( not ( = ?auto_343409 ?auto_343421 ) ) ( not ( = ?auto_343409 ?auto_343422 ) ) ( not ( = ?auto_343410 ?auto_343411 ) ) ( not ( = ?auto_343410 ?auto_343412 ) ) ( not ( = ?auto_343410 ?auto_343413 ) ) ( not ( = ?auto_343410 ?auto_343414 ) ) ( not ( = ?auto_343410 ?auto_343415 ) ) ( not ( = ?auto_343410 ?auto_343416 ) ) ( not ( = ?auto_343410 ?auto_343417 ) ) ( not ( = ?auto_343410 ?auto_343418 ) ) ( not ( = ?auto_343410 ?auto_343419 ) ) ( not ( = ?auto_343410 ?auto_343420 ) ) ( not ( = ?auto_343410 ?auto_343421 ) ) ( not ( = ?auto_343410 ?auto_343422 ) ) ( not ( = ?auto_343411 ?auto_343412 ) ) ( not ( = ?auto_343411 ?auto_343413 ) ) ( not ( = ?auto_343411 ?auto_343414 ) ) ( not ( = ?auto_343411 ?auto_343415 ) ) ( not ( = ?auto_343411 ?auto_343416 ) ) ( not ( = ?auto_343411 ?auto_343417 ) ) ( not ( = ?auto_343411 ?auto_343418 ) ) ( not ( = ?auto_343411 ?auto_343419 ) ) ( not ( = ?auto_343411 ?auto_343420 ) ) ( not ( = ?auto_343411 ?auto_343421 ) ) ( not ( = ?auto_343411 ?auto_343422 ) ) ( not ( = ?auto_343412 ?auto_343413 ) ) ( not ( = ?auto_343412 ?auto_343414 ) ) ( not ( = ?auto_343412 ?auto_343415 ) ) ( not ( = ?auto_343412 ?auto_343416 ) ) ( not ( = ?auto_343412 ?auto_343417 ) ) ( not ( = ?auto_343412 ?auto_343418 ) ) ( not ( = ?auto_343412 ?auto_343419 ) ) ( not ( = ?auto_343412 ?auto_343420 ) ) ( not ( = ?auto_343412 ?auto_343421 ) ) ( not ( = ?auto_343412 ?auto_343422 ) ) ( not ( = ?auto_343413 ?auto_343414 ) ) ( not ( = ?auto_343413 ?auto_343415 ) ) ( not ( = ?auto_343413 ?auto_343416 ) ) ( not ( = ?auto_343413 ?auto_343417 ) ) ( not ( = ?auto_343413 ?auto_343418 ) ) ( not ( = ?auto_343413 ?auto_343419 ) ) ( not ( = ?auto_343413 ?auto_343420 ) ) ( not ( = ?auto_343413 ?auto_343421 ) ) ( not ( = ?auto_343413 ?auto_343422 ) ) ( not ( = ?auto_343414 ?auto_343415 ) ) ( not ( = ?auto_343414 ?auto_343416 ) ) ( not ( = ?auto_343414 ?auto_343417 ) ) ( not ( = ?auto_343414 ?auto_343418 ) ) ( not ( = ?auto_343414 ?auto_343419 ) ) ( not ( = ?auto_343414 ?auto_343420 ) ) ( not ( = ?auto_343414 ?auto_343421 ) ) ( not ( = ?auto_343414 ?auto_343422 ) ) ( not ( = ?auto_343415 ?auto_343416 ) ) ( not ( = ?auto_343415 ?auto_343417 ) ) ( not ( = ?auto_343415 ?auto_343418 ) ) ( not ( = ?auto_343415 ?auto_343419 ) ) ( not ( = ?auto_343415 ?auto_343420 ) ) ( not ( = ?auto_343415 ?auto_343421 ) ) ( not ( = ?auto_343415 ?auto_343422 ) ) ( not ( = ?auto_343416 ?auto_343417 ) ) ( not ( = ?auto_343416 ?auto_343418 ) ) ( not ( = ?auto_343416 ?auto_343419 ) ) ( not ( = ?auto_343416 ?auto_343420 ) ) ( not ( = ?auto_343416 ?auto_343421 ) ) ( not ( = ?auto_343416 ?auto_343422 ) ) ( not ( = ?auto_343417 ?auto_343418 ) ) ( not ( = ?auto_343417 ?auto_343419 ) ) ( not ( = ?auto_343417 ?auto_343420 ) ) ( not ( = ?auto_343417 ?auto_343421 ) ) ( not ( = ?auto_343417 ?auto_343422 ) ) ( not ( = ?auto_343418 ?auto_343419 ) ) ( not ( = ?auto_343418 ?auto_343420 ) ) ( not ( = ?auto_343418 ?auto_343421 ) ) ( not ( = ?auto_343418 ?auto_343422 ) ) ( not ( = ?auto_343419 ?auto_343420 ) ) ( not ( = ?auto_343419 ?auto_343421 ) ) ( not ( = ?auto_343419 ?auto_343422 ) ) ( not ( = ?auto_343420 ?auto_343421 ) ) ( not ( = ?auto_343420 ?auto_343422 ) ) ( not ( = ?auto_343421 ?auto_343422 ) ) ( ON ?auto_343420 ?auto_343421 ) ( ON ?auto_343419 ?auto_343420 ) ( ON ?auto_343418 ?auto_343419 ) ( ON ?auto_343417 ?auto_343418 ) ( ON ?auto_343416 ?auto_343417 ) ( ON ?auto_343415 ?auto_343416 ) ( ON ?auto_343414 ?auto_343415 ) ( ON ?auto_343413 ?auto_343414 ) ( ON ?auto_343412 ?auto_343413 ) ( ON ?auto_343411 ?auto_343412 ) ( ON ?auto_343410 ?auto_343411 ) ( ON ?auto_343409 ?auto_343410 ) ( ON ?auto_343408 ?auto_343409 ) ( CLEAR ?auto_343408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343408 )
      ( MAKE-14PILE ?auto_343408 ?auto_343409 ?auto_343410 ?auto_343411 ?auto_343412 ?auto_343413 ?auto_343414 ?auto_343415 ?auto_343416 ?auto_343417 ?auto_343418 ?auto_343419 ?auto_343420 ?auto_343421 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343437 - BLOCK
      ?auto_343438 - BLOCK
      ?auto_343439 - BLOCK
      ?auto_343440 - BLOCK
      ?auto_343441 - BLOCK
      ?auto_343442 - BLOCK
      ?auto_343443 - BLOCK
      ?auto_343444 - BLOCK
      ?auto_343445 - BLOCK
      ?auto_343446 - BLOCK
      ?auto_343447 - BLOCK
      ?auto_343448 - BLOCK
      ?auto_343449 - BLOCK
      ?auto_343450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_343450 ) ( not ( = ?auto_343437 ?auto_343438 ) ) ( not ( = ?auto_343437 ?auto_343439 ) ) ( not ( = ?auto_343437 ?auto_343440 ) ) ( not ( = ?auto_343437 ?auto_343441 ) ) ( not ( = ?auto_343437 ?auto_343442 ) ) ( not ( = ?auto_343437 ?auto_343443 ) ) ( not ( = ?auto_343437 ?auto_343444 ) ) ( not ( = ?auto_343437 ?auto_343445 ) ) ( not ( = ?auto_343437 ?auto_343446 ) ) ( not ( = ?auto_343437 ?auto_343447 ) ) ( not ( = ?auto_343437 ?auto_343448 ) ) ( not ( = ?auto_343437 ?auto_343449 ) ) ( not ( = ?auto_343437 ?auto_343450 ) ) ( not ( = ?auto_343438 ?auto_343439 ) ) ( not ( = ?auto_343438 ?auto_343440 ) ) ( not ( = ?auto_343438 ?auto_343441 ) ) ( not ( = ?auto_343438 ?auto_343442 ) ) ( not ( = ?auto_343438 ?auto_343443 ) ) ( not ( = ?auto_343438 ?auto_343444 ) ) ( not ( = ?auto_343438 ?auto_343445 ) ) ( not ( = ?auto_343438 ?auto_343446 ) ) ( not ( = ?auto_343438 ?auto_343447 ) ) ( not ( = ?auto_343438 ?auto_343448 ) ) ( not ( = ?auto_343438 ?auto_343449 ) ) ( not ( = ?auto_343438 ?auto_343450 ) ) ( not ( = ?auto_343439 ?auto_343440 ) ) ( not ( = ?auto_343439 ?auto_343441 ) ) ( not ( = ?auto_343439 ?auto_343442 ) ) ( not ( = ?auto_343439 ?auto_343443 ) ) ( not ( = ?auto_343439 ?auto_343444 ) ) ( not ( = ?auto_343439 ?auto_343445 ) ) ( not ( = ?auto_343439 ?auto_343446 ) ) ( not ( = ?auto_343439 ?auto_343447 ) ) ( not ( = ?auto_343439 ?auto_343448 ) ) ( not ( = ?auto_343439 ?auto_343449 ) ) ( not ( = ?auto_343439 ?auto_343450 ) ) ( not ( = ?auto_343440 ?auto_343441 ) ) ( not ( = ?auto_343440 ?auto_343442 ) ) ( not ( = ?auto_343440 ?auto_343443 ) ) ( not ( = ?auto_343440 ?auto_343444 ) ) ( not ( = ?auto_343440 ?auto_343445 ) ) ( not ( = ?auto_343440 ?auto_343446 ) ) ( not ( = ?auto_343440 ?auto_343447 ) ) ( not ( = ?auto_343440 ?auto_343448 ) ) ( not ( = ?auto_343440 ?auto_343449 ) ) ( not ( = ?auto_343440 ?auto_343450 ) ) ( not ( = ?auto_343441 ?auto_343442 ) ) ( not ( = ?auto_343441 ?auto_343443 ) ) ( not ( = ?auto_343441 ?auto_343444 ) ) ( not ( = ?auto_343441 ?auto_343445 ) ) ( not ( = ?auto_343441 ?auto_343446 ) ) ( not ( = ?auto_343441 ?auto_343447 ) ) ( not ( = ?auto_343441 ?auto_343448 ) ) ( not ( = ?auto_343441 ?auto_343449 ) ) ( not ( = ?auto_343441 ?auto_343450 ) ) ( not ( = ?auto_343442 ?auto_343443 ) ) ( not ( = ?auto_343442 ?auto_343444 ) ) ( not ( = ?auto_343442 ?auto_343445 ) ) ( not ( = ?auto_343442 ?auto_343446 ) ) ( not ( = ?auto_343442 ?auto_343447 ) ) ( not ( = ?auto_343442 ?auto_343448 ) ) ( not ( = ?auto_343442 ?auto_343449 ) ) ( not ( = ?auto_343442 ?auto_343450 ) ) ( not ( = ?auto_343443 ?auto_343444 ) ) ( not ( = ?auto_343443 ?auto_343445 ) ) ( not ( = ?auto_343443 ?auto_343446 ) ) ( not ( = ?auto_343443 ?auto_343447 ) ) ( not ( = ?auto_343443 ?auto_343448 ) ) ( not ( = ?auto_343443 ?auto_343449 ) ) ( not ( = ?auto_343443 ?auto_343450 ) ) ( not ( = ?auto_343444 ?auto_343445 ) ) ( not ( = ?auto_343444 ?auto_343446 ) ) ( not ( = ?auto_343444 ?auto_343447 ) ) ( not ( = ?auto_343444 ?auto_343448 ) ) ( not ( = ?auto_343444 ?auto_343449 ) ) ( not ( = ?auto_343444 ?auto_343450 ) ) ( not ( = ?auto_343445 ?auto_343446 ) ) ( not ( = ?auto_343445 ?auto_343447 ) ) ( not ( = ?auto_343445 ?auto_343448 ) ) ( not ( = ?auto_343445 ?auto_343449 ) ) ( not ( = ?auto_343445 ?auto_343450 ) ) ( not ( = ?auto_343446 ?auto_343447 ) ) ( not ( = ?auto_343446 ?auto_343448 ) ) ( not ( = ?auto_343446 ?auto_343449 ) ) ( not ( = ?auto_343446 ?auto_343450 ) ) ( not ( = ?auto_343447 ?auto_343448 ) ) ( not ( = ?auto_343447 ?auto_343449 ) ) ( not ( = ?auto_343447 ?auto_343450 ) ) ( not ( = ?auto_343448 ?auto_343449 ) ) ( not ( = ?auto_343448 ?auto_343450 ) ) ( not ( = ?auto_343449 ?auto_343450 ) ) ( ON ?auto_343449 ?auto_343450 ) ( ON ?auto_343448 ?auto_343449 ) ( ON ?auto_343447 ?auto_343448 ) ( ON ?auto_343446 ?auto_343447 ) ( ON ?auto_343445 ?auto_343446 ) ( ON ?auto_343444 ?auto_343445 ) ( ON ?auto_343443 ?auto_343444 ) ( ON ?auto_343442 ?auto_343443 ) ( ON ?auto_343441 ?auto_343442 ) ( ON ?auto_343440 ?auto_343441 ) ( ON ?auto_343439 ?auto_343440 ) ( ON ?auto_343438 ?auto_343439 ) ( ON ?auto_343437 ?auto_343438 ) ( CLEAR ?auto_343437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_343437 )
      ( MAKE-14PILE ?auto_343437 ?auto_343438 ?auto_343439 ?auto_343440 ?auto_343441 ?auto_343442 ?auto_343443 ?auto_343444 ?auto_343445 ?auto_343446 ?auto_343447 ?auto_343448 ?auto_343449 ?auto_343450 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_343465 - BLOCK
      ?auto_343466 - BLOCK
      ?auto_343467 - BLOCK
      ?auto_343468 - BLOCK
      ?auto_343469 - BLOCK
      ?auto_343470 - BLOCK
      ?auto_343471 - BLOCK
      ?auto_343472 - BLOCK
      ?auto_343473 - BLOCK
      ?auto_343474 - BLOCK
      ?auto_343475 - BLOCK
      ?auto_343476 - BLOCK
      ?auto_343477 - BLOCK
      ?auto_343478 - BLOCK
    )
    :vars
    (
      ?auto_343479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_343465 ?auto_343466 ) ) ( not ( = ?auto_343465 ?auto_343467 ) ) ( not ( = ?auto_343465 ?auto_343468 ) ) ( not ( = ?auto_343465 ?auto_343469 ) ) ( not ( = ?auto_343465 ?auto_343470 ) ) ( not ( = ?auto_343465 ?auto_343471 ) ) ( not ( = ?auto_343465 ?auto_343472 ) ) ( not ( = ?auto_343465 ?auto_343473 ) ) ( not ( = ?auto_343465 ?auto_343474 ) ) ( not ( = ?auto_343465 ?auto_343475 ) ) ( not ( = ?auto_343465 ?auto_343476 ) ) ( not ( = ?auto_343465 ?auto_343477 ) ) ( not ( = ?auto_343465 ?auto_343478 ) ) ( not ( = ?auto_343466 ?auto_343467 ) ) ( not ( = ?auto_343466 ?auto_343468 ) ) ( not ( = ?auto_343466 ?auto_343469 ) ) ( not ( = ?auto_343466 ?auto_343470 ) ) ( not ( = ?auto_343466 ?auto_343471 ) ) ( not ( = ?auto_343466 ?auto_343472 ) ) ( not ( = ?auto_343466 ?auto_343473 ) ) ( not ( = ?auto_343466 ?auto_343474 ) ) ( not ( = ?auto_343466 ?auto_343475 ) ) ( not ( = ?auto_343466 ?auto_343476 ) ) ( not ( = ?auto_343466 ?auto_343477 ) ) ( not ( = ?auto_343466 ?auto_343478 ) ) ( not ( = ?auto_343467 ?auto_343468 ) ) ( not ( = ?auto_343467 ?auto_343469 ) ) ( not ( = ?auto_343467 ?auto_343470 ) ) ( not ( = ?auto_343467 ?auto_343471 ) ) ( not ( = ?auto_343467 ?auto_343472 ) ) ( not ( = ?auto_343467 ?auto_343473 ) ) ( not ( = ?auto_343467 ?auto_343474 ) ) ( not ( = ?auto_343467 ?auto_343475 ) ) ( not ( = ?auto_343467 ?auto_343476 ) ) ( not ( = ?auto_343467 ?auto_343477 ) ) ( not ( = ?auto_343467 ?auto_343478 ) ) ( not ( = ?auto_343468 ?auto_343469 ) ) ( not ( = ?auto_343468 ?auto_343470 ) ) ( not ( = ?auto_343468 ?auto_343471 ) ) ( not ( = ?auto_343468 ?auto_343472 ) ) ( not ( = ?auto_343468 ?auto_343473 ) ) ( not ( = ?auto_343468 ?auto_343474 ) ) ( not ( = ?auto_343468 ?auto_343475 ) ) ( not ( = ?auto_343468 ?auto_343476 ) ) ( not ( = ?auto_343468 ?auto_343477 ) ) ( not ( = ?auto_343468 ?auto_343478 ) ) ( not ( = ?auto_343469 ?auto_343470 ) ) ( not ( = ?auto_343469 ?auto_343471 ) ) ( not ( = ?auto_343469 ?auto_343472 ) ) ( not ( = ?auto_343469 ?auto_343473 ) ) ( not ( = ?auto_343469 ?auto_343474 ) ) ( not ( = ?auto_343469 ?auto_343475 ) ) ( not ( = ?auto_343469 ?auto_343476 ) ) ( not ( = ?auto_343469 ?auto_343477 ) ) ( not ( = ?auto_343469 ?auto_343478 ) ) ( not ( = ?auto_343470 ?auto_343471 ) ) ( not ( = ?auto_343470 ?auto_343472 ) ) ( not ( = ?auto_343470 ?auto_343473 ) ) ( not ( = ?auto_343470 ?auto_343474 ) ) ( not ( = ?auto_343470 ?auto_343475 ) ) ( not ( = ?auto_343470 ?auto_343476 ) ) ( not ( = ?auto_343470 ?auto_343477 ) ) ( not ( = ?auto_343470 ?auto_343478 ) ) ( not ( = ?auto_343471 ?auto_343472 ) ) ( not ( = ?auto_343471 ?auto_343473 ) ) ( not ( = ?auto_343471 ?auto_343474 ) ) ( not ( = ?auto_343471 ?auto_343475 ) ) ( not ( = ?auto_343471 ?auto_343476 ) ) ( not ( = ?auto_343471 ?auto_343477 ) ) ( not ( = ?auto_343471 ?auto_343478 ) ) ( not ( = ?auto_343472 ?auto_343473 ) ) ( not ( = ?auto_343472 ?auto_343474 ) ) ( not ( = ?auto_343472 ?auto_343475 ) ) ( not ( = ?auto_343472 ?auto_343476 ) ) ( not ( = ?auto_343472 ?auto_343477 ) ) ( not ( = ?auto_343472 ?auto_343478 ) ) ( not ( = ?auto_343473 ?auto_343474 ) ) ( not ( = ?auto_343473 ?auto_343475 ) ) ( not ( = ?auto_343473 ?auto_343476 ) ) ( not ( = ?auto_343473 ?auto_343477 ) ) ( not ( = ?auto_343473 ?auto_343478 ) ) ( not ( = ?auto_343474 ?auto_343475 ) ) ( not ( = ?auto_343474 ?auto_343476 ) ) ( not ( = ?auto_343474 ?auto_343477 ) ) ( not ( = ?auto_343474 ?auto_343478 ) ) ( not ( = ?auto_343475 ?auto_343476 ) ) ( not ( = ?auto_343475 ?auto_343477 ) ) ( not ( = ?auto_343475 ?auto_343478 ) ) ( not ( = ?auto_343476 ?auto_343477 ) ) ( not ( = ?auto_343476 ?auto_343478 ) ) ( not ( = ?auto_343477 ?auto_343478 ) ) ( ON ?auto_343465 ?auto_343479 ) ( not ( = ?auto_343478 ?auto_343479 ) ) ( not ( = ?auto_343477 ?auto_343479 ) ) ( not ( = ?auto_343476 ?auto_343479 ) ) ( not ( = ?auto_343475 ?auto_343479 ) ) ( not ( = ?auto_343474 ?auto_343479 ) ) ( not ( = ?auto_343473 ?auto_343479 ) ) ( not ( = ?auto_343472 ?auto_343479 ) ) ( not ( = ?auto_343471 ?auto_343479 ) ) ( not ( = ?auto_343470 ?auto_343479 ) ) ( not ( = ?auto_343469 ?auto_343479 ) ) ( not ( = ?auto_343468 ?auto_343479 ) ) ( not ( = ?auto_343467 ?auto_343479 ) ) ( not ( = ?auto_343466 ?auto_343479 ) ) ( not ( = ?auto_343465 ?auto_343479 ) ) ( ON ?auto_343466 ?auto_343465 ) ( ON ?auto_343467 ?auto_343466 ) ( ON ?auto_343468 ?auto_343467 ) ( ON ?auto_343469 ?auto_343468 ) ( ON ?auto_343470 ?auto_343469 ) ( ON ?auto_343471 ?auto_343470 ) ( ON ?auto_343472 ?auto_343471 ) ( ON ?auto_343473 ?auto_343472 ) ( ON ?auto_343474 ?auto_343473 ) ( ON ?auto_343475 ?auto_343474 ) ( ON ?auto_343476 ?auto_343475 ) ( ON ?auto_343477 ?auto_343476 ) ( ON ?auto_343478 ?auto_343477 ) ( CLEAR ?auto_343478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_343478 ?auto_343477 ?auto_343476 ?auto_343475 ?auto_343474 ?auto_343473 ?auto_343472 ?auto_343471 ?auto_343470 ?auto_343469 ?auto_343468 ?auto_343467 ?auto_343466 ?auto_343465 )
      ( MAKE-14PILE ?auto_343465 ?auto_343466 ?auto_343467 ?auto_343468 ?auto_343469 ?auto_343470 ?auto_343471 ?auto_343472 ?auto_343473 ?auto_343474 ?auto_343475 ?auto_343476 ?auto_343477 ?auto_343478 ) )
  )

)

