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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21387 - BLOCK
      ?auto_21388 - BLOCK
      ?auto_21389 - BLOCK
      ?auto_21390 - BLOCK
      ?auto_21391 - BLOCK
    )
    :vars
    (
      ?auto_21392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21392 ?auto_21391 ) ( CLEAR ?auto_21392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21387 ) ( ON ?auto_21388 ?auto_21387 ) ( ON ?auto_21389 ?auto_21388 ) ( ON ?auto_21390 ?auto_21389 ) ( ON ?auto_21391 ?auto_21390 ) ( not ( = ?auto_21387 ?auto_21388 ) ) ( not ( = ?auto_21387 ?auto_21389 ) ) ( not ( = ?auto_21387 ?auto_21390 ) ) ( not ( = ?auto_21387 ?auto_21391 ) ) ( not ( = ?auto_21387 ?auto_21392 ) ) ( not ( = ?auto_21388 ?auto_21389 ) ) ( not ( = ?auto_21388 ?auto_21390 ) ) ( not ( = ?auto_21388 ?auto_21391 ) ) ( not ( = ?auto_21388 ?auto_21392 ) ) ( not ( = ?auto_21389 ?auto_21390 ) ) ( not ( = ?auto_21389 ?auto_21391 ) ) ( not ( = ?auto_21389 ?auto_21392 ) ) ( not ( = ?auto_21390 ?auto_21391 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( not ( = ?auto_21391 ?auto_21392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21392 ?auto_21391 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21394 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21394 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21394 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21395 - BLOCK
    )
    :vars
    (
      ?auto_21396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21395 ?auto_21396 ) ( CLEAR ?auto_21395 ) ( HAND-EMPTY ) ( not ( = ?auto_21395 ?auto_21396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21395 ?auto_21396 )
      ( MAKE-1PILE ?auto_21395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21401 - BLOCK
      ?auto_21402 - BLOCK
      ?auto_21403 - BLOCK
      ?auto_21404 - BLOCK
    )
    :vars
    (
      ?auto_21405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21405 ?auto_21404 ) ( CLEAR ?auto_21405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21401 ) ( ON ?auto_21402 ?auto_21401 ) ( ON ?auto_21403 ?auto_21402 ) ( ON ?auto_21404 ?auto_21403 ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21404 ) ) ( not ( = ?auto_21401 ?auto_21405 ) ) ( not ( = ?auto_21402 ?auto_21403 ) ) ( not ( = ?auto_21402 ?auto_21404 ) ) ( not ( = ?auto_21402 ?auto_21405 ) ) ( not ( = ?auto_21403 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21405 ) ) ( not ( = ?auto_21404 ?auto_21405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21405 ?auto_21404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21406 - BLOCK
      ?auto_21407 - BLOCK
      ?auto_21408 - BLOCK
      ?auto_21409 - BLOCK
    )
    :vars
    (
      ?auto_21410 - BLOCK
      ?auto_21411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21410 ?auto_21409 ) ( CLEAR ?auto_21410 ) ( ON-TABLE ?auto_21406 ) ( ON ?auto_21407 ?auto_21406 ) ( ON ?auto_21408 ?auto_21407 ) ( ON ?auto_21409 ?auto_21408 ) ( not ( = ?auto_21406 ?auto_21407 ) ) ( not ( = ?auto_21406 ?auto_21408 ) ) ( not ( = ?auto_21406 ?auto_21409 ) ) ( not ( = ?auto_21406 ?auto_21410 ) ) ( not ( = ?auto_21407 ?auto_21408 ) ) ( not ( = ?auto_21407 ?auto_21409 ) ) ( not ( = ?auto_21407 ?auto_21410 ) ) ( not ( = ?auto_21408 ?auto_21409 ) ) ( not ( = ?auto_21408 ?auto_21410 ) ) ( not ( = ?auto_21409 ?auto_21410 ) ) ( HOLDING ?auto_21411 ) ( not ( = ?auto_21406 ?auto_21411 ) ) ( not ( = ?auto_21407 ?auto_21411 ) ) ( not ( = ?auto_21408 ?auto_21411 ) ) ( not ( = ?auto_21409 ?auto_21411 ) ) ( not ( = ?auto_21410 ?auto_21411 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21411 )
      ( MAKE-4PILE ?auto_21406 ?auto_21407 ?auto_21408 ?auto_21409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21412 - BLOCK
      ?auto_21413 - BLOCK
      ?auto_21414 - BLOCK
      ?auto_21415 - BLOCK
    )
    :vars
    (
      ?auto_21416 - BLOCK
      ?auto_21417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21416 ?auto_21415 ) ( ON-TABLE ?auto_21412 ) ( ON ?auto_21413 ?auto_21412 ) ( ON ?auto_21414 ?auto_21413 ) ( ON ?auto_21415 ?auto_21414 ) ( not ( = ?auto_21412 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21414 ) ) ( not ( = ?auto_21412 ?auto_21415 ) ) ( not ( = ?auto_21412 ?auto_21416 ) ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21416 ) ) ( not ( = ?auto_21414 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21412 ?auto_21417 ) ) ( not ( = ?auto_21413 ?auto_21417 ) ) ( not ( = ?auto_21414 ?auto_21417 ) ) ( not ( = ?auto_21415 ?auto_21417 ) ) ( not ( = ?auto_21416 ?auto_21417 ) ) ( ON ?auto_21417 ?auto_21416 ) ( CLEAR ?auto_21417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21412 ?auto_21413 ?auto_21414 ?auto_21415 ?auto_21416 )
      ( MAKE-4PILE ?auto_21412 ?auto_21413 ?auto_21414 ?auto_21415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21420 - BLOCK
      ?auto_21421 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21421 ) ( CLEAR ?auto_21420 ) ( ON-TABLE ?auto_21420 ) ( not ( = ?auto_21420 ?auto_21421 ) ) )
    :subtasks
    ( ( !STACK ?auto_21421 ?auto_21420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21422 - BLOCK
      ?auto_21423 - BLOCK
    )
    :vars
    (
      ?auto_21424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21422 ) ( ON-TABLE ?auto_21422 ) ( not ( = ?auto_21422 ?auto_21423 ) ) ( ON ?auto_21423 ?auto_21424 ) ( CLEAR ?auto_21423 ) ( HAND-EMPTY ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( not ( = ?auto_21423 ?auto_21424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21423 ?auto_21424 )
      ( MAKE-2PILE ?auto_21422 ?auto_21423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21425 - BLOCK
      ?auto_21426 - BLOCK
    )
    :vars
    (
      ?auto_21427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21425 ?auto_21426 ) ) ( ON ?auto_21426 ?auto_21427 ) ( CLEAR ?auto_21426 ) ( not ( = ?auto_21425 ?auto_21427 ) ) ( not ( = ?auto_21426 ?auto_21427 ) ) ( HOLDING ?auto_21425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21425 )
      ( MAKE-2PILE ?auto_21425 ?auto_21426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21428 - BLOCK
      ?auto_21429 - BLOCK
    )
    :vars
    (
      ?auto_21430 - BLOCK
      ?auto_21432 - BLOCK
      ?auto_21431 - BLOCK
      ?auto_21433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21428 ?auto_21429 ) ) ( ON ?auto_21429 ?auto_21430 ) ( not ( = ?auto_21428 ?auto_21430 ) ) ( not ( = ?auto_21429 ?auto_21430 ) ) ( ON ?auto_21428 ?auto_21429 ) ( CLEAR ?auto_21428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21432 ) ( ON ?auto_21431 ?auto_21432 ) ( ON ?auto_21433 ?auto_21431 ) ( ON ?auto_21430 ?auto_21433 ) ( not ( = ?auto_21432 ?auto_21431 ) ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21432 ?auto_21430 ) ) ( not ( = ?auto_21432 ?auto_21429 ) ) ( not ( = ?auto_21432 ?auto_21428 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21430 ) ) ( not ( = ?auto_21431 ?auto_21429 ) ) ( not ( = ?auto_21431 ?auto_21428 ) ) ( not ( = ?auto_21433 ?auto_21430 ) ) ( not ( = ?auto_21433 ?auto_21429 ) ) ( not ( = ?auto_21433 ?auto_21428 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21432 ?auto_21431 ?auto_21433 ?auto_21430 ?auto_21429 )
      ( MAKE-2PILE ?auto_21428 ?auto_21429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21437 - BLOCK
      ?auto_21438 - BLOCK
      ?auto_21439 - BLOCK
    )
    :vars
    (
      ?auto_21440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21440 ?auto_21439 ) ( CLEAR ?auto_21440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21437 ) ( ON ?auto_21438 ?auto_21437 ) ( ON ?auto_21439 ?auto_21438 ) ( not ( = ?auto_21437 ?auto_21438 ) ) ( not ( = ?auto_21437 ?auto_21439 ) ) ( not ( = ?auto_21437 ?auto_21440 ) ) ( not ( = ?auto_21438 ?auto_21439 ) ) ( not ( = ?auto_21438 ?auto_21440 ) ) ( not ( = ?auto_21439 ?auto_21440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21440 ?auto_21439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21441 - BLOCK
      ?auto_21442 - BLOCK
      ?auto_21443 - BLOCK
    )
    :vars
    (
      ?auto_21444 - BLOCK
      ?auto_21445 - BLOCK
      ?auto_21446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21444 ?auto_21443 ) ( CLEAR ?auto_21444 ) ( ON-TABLE ?auto_21441 ) ( ON ?auto_21442 ?auto_21441 ) ( ON ?auto_21443 ?auto_21442 ) ( not ( = ?auto_21441 ?auto_21442 ) ) ( not ( = ?auto_21441 ?auto_21443 ) ) ( not ( = ?auto_21441 ?auto_21444 ) ) ( not ( = ?auto_21442 ?auto_21443 ) ) ( not ( = ?auto_21442 ?auto_21444 ) ) ( not ( = ?auto_21443 ?auto_21444 ) ) ( HOLDING ?auto_21445 ) ( CLEAR ?auto_21446 ) ( not ( = ?auto_21441 ?auto_21445 ) ) ( not ( = ?auto_21441 ?auto_21446 ) ) ( not ( = ?auto_21442 ?auto_21445 ) ) ( not ( = ?auto_21442 ?auto_21446 ) ) ( not ( = ?auto_21443 ?auto_21445 ) ) ( not ( = ?auto_21443 ?auto_21446 ) ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21446 ) ) )
    :subtasks
    ( ( !STACK ?auto_21445 ?auto_21446 )
      ( MAKE-3PILE ?auto_21441 ?auto_21442 ?auto_21443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21809 - BLOCK
      ?auto_21810 - BLOCK
      ?auto_21811 - BLOCK
    )
    :vars
    (
      ?auto_21813 - BLOCK
      ?auto_21812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21813 ?auto_21811 ) ( ON-TABLE ?auto_21809 ) ( ON ?auto_21810 ?auto_21809 ) ( ON ?auto_21811 ?auto_21810 ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( not ( = ?auto_21809 ?auto_21811 ) ) ( not ( = ?auto_21809 ?auto_21813 ) ) ( not ( = ?auto_21810 ?auto_21811 ) ) ( not ( = ?auto_21810 ?auto_21813 ) ) ( not ( = ?auto_21811 ?auto_21813 ) ) ( not ( = ?auto_21809 ?auto_21812 ) ) ( not ( = ?auto_21810 ?auto_21812 ) ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21813 ?auto_21812 ) ) ( ON ?auto_21812 ?auto_21813 ) ( CLEAR ?auto_21812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21809 ?auto_21810 ?auto_21811 ?auto_21813 )
      ( MAKE-3PILE ?auto_21809 ?auto_21810 ?auto_21811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21453 - BLOCK
      ?auto_21454 - BLOCK
      ?auto_21455 - BLOCK
    )
    :vars
    (
      ?auto_21457 - BLOCK
      ?auto_21456 - BLOCK
      ?auto_21458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21457 ?auto_21455 ) ( ON-TABLE ?auto_21453 ) ( ON ?auto_21454 ?auto_21453 ) ( ON ?auto_21455 ?auto_21454 ) ( not ( = ?auto_21453 ?auto_21454 ) ) ( not ( = ?auto_21453 ?auto_21455 ) ) ( not ( = ?auto_21453 ?auto_21457 ) ) ( not ( = ?auto_21454 ?auto_21455 ) ) ( not ( = ?auto_21454 ?auto_21457 ) ) ( not ( = ?auto_21455 ?auto_21457 ) ) ( not ( = ?auto_21453 ?auto_21456 ) ) ( not ( = ?auto_21453 ?auto_21458 ) ) ( not ( = ?auto_21454 ?auto_21456 ) ) ( not ( = ?auto_21454 ?auto_21458 ) ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21458 ) ) ( not ( = ?auto_21457 ?auto_21456 ) ) ( not ( = ?auto_21457 ?auto_21458 ) ) ( not ( = ?auto_21456 ?auto_21458 ) ) ( ON ?auto_21456 ?auto_21457 ) ( CLEAR ?auto_21456 ) ( HOLDING ?auto_21458 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21458 )
      ( MAKE-3PILE ?auto_21453 ?auto_21454 ?auto_21455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21459 - BLOCK
      ?auto_21460 - BLOCK
      ?auto_21461 - BLOCK
    )
    :vars
    (
      ?auto_21464 - BLOCK
      ?auto_21462 - BLOCK
      ?auto_21463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21464 ?auto_21461 ) ( ON-TABLE ?auto_21459 ) ( ON ?auto_21460 ?auto_21459 ) ( ON ?auto_21461 ?auto_21460 ) ( not ( = ?auto_21459 ?auto_21460 ) ) ( not ( = ?auto_21459 ?auto_21461 ) ) ( not ( = ?auto_21459 ?auto_21464 ) ) ( not ( = ?auto_21460 ?auto_21461 ) ) ( not ( = ?auto_21460 ?auto_21464 ) ) ( not ( = ?auto_21461 ?auto_21464 ) ) ( not ( = ?auto_21459 ?auto_21462 ) ) ( not ( = ?auto_21459 ?auto_21463 ) ) ( not ( = ?auto_21460 ?auto_21462 ) ) ( not ( = ?auto_21460 ?auto_21463 ) ) ( not ( = ?auto_21461 ?auto_21462 ) ) ( not ( = ?auto_21461 ?auto_21463 ) ) ( not ( = ?auto_21464 ?auto_21462 ) ) ( not ( = ?auto_21464 ?auto_21463 ) ) ( not ( = ?auto_21462 ?auto_21463 ) ) ( ON ?auto_21462 ?auto_21464 ) ( ON ?auto_21463 ?auto_21462 ) ( CLEAR ?auto_21463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21459 ?auto_21460 ?auto_21461 ?auto_21464 ?auto_21462 )
      ( MAKE-3PILE ?auto_21459 ?auto_21460 ?auto_21461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21468 - BLOCK
      ?auto_21469 - BLOCK
      ?auto_21470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21470 ) ( CLEAR ?auto_21469 ) ( ON-TABLE ?auto_21468 ) ( ON ?auto_21469 ?auto_21468 ) ( not ( = ?auto_21468 ?auto_21469 ) ) ( not ( = ?auto_21468 ?auto_21470 ) ) ( not ( = ?auto_21469 ?auto_21470 ) ) )
    :subtasks
    ( ( !STACK ?auto_21470 ?auto_21469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21471 - BLOCK
      ?auto_21472 - BLOCK
      ?auto_21473 - BLOCK
    )
    :vars
    (
      ?auto_21474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21472 ) ( ON-TABLE ?auto_21471 ) ( ON ?auto_21472 ?auto_21471 ) ( not ( = ?auto_21471 ?auto_21472 ) ) ( not ( = ?auto_21471 ?auto_21473 ) ) ( not ( = ?auto_21472 ?auto_21473 ) ) ( ON ?auto_21473 ?auto_21474 ) ( CLEAR ?auto_21473 ) ( HAND-EMPTY ) ( not ( = ?auto_21471 ?auto_21474 ) ) ( not ( = ?auto_21472 ?auto_21474 ) ) ( not ( = ?auto_21473 ?auto_21474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21473 ?auto_21474 )
      ( MAKE-3PILE ?auto_21471 ?auto_21472 ?auto_21473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21475 - BLOCK
      ?auto_21476 - BLOCK
      ?auto_21477 - BLOCK
    )
    :vars
    (
      ?auto_21478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21475 ) ( not ( = ?auto_21475 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21477 ) ) ( not ( = ?auto_21476 ?auto_21477 ) ) ( ON ?auto_21477 ?auto_21478 ) ( CLEAR ?auto_21477 ) ( not ( = ?auto_21475 ?auto_21478 ) ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( HOLDING ?auto_21476 ) ( CLEAR ?auto_21475 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21475 ?auto_21476 )
      ( MAKE-3PILE ?auto_21475 ?auto_21476 ?auto_21477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21479 - BLOCK
      ?auto_21480 - BLOCK
      ?auto_21481 - BLOCK
    )
    :vars
    (
      ?auto_21482 - BLOCK
      ?auto_21484 - BLOCK
      ?auto_21483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21479 ) ( not ( = ?auto_21479 ?auto_21480 ) ) ( not ( = ?auto_21479 ?auto_21481 ) ) ( not ( = ?auto_21480 ?auto_21481 ) ) ( ON ?auto_21481 ?auto_21482 ) ( not ( = ?auto_21479 ?auto_21482 ) ) ( not ( = ?auto_21480 ?auto_21482 ) ) ( not ( = ?auto_21481 ?auto_21482 ) ) ( CLEAR ?auto_21479 ) ( ON ?auto_21480 ?auto_21481 ) ( CLEAR ?auto_21480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21484 ) ( ON ?auto_21483 ?auto_21484 ) ( ON ?auto_21482 ?auto_21483 ) ( not ( = ?auto_21484 ?auto_21483 ) ) ( not ( = ?auto_21484 ?auto_21482 ) ) ( not ( = ?auto_21484 ?auto_21481 ) ) ( not ( = ?auto_21484 ?auto_21480 ) ) ( not ( = ?auto_21483 ?auto_21482 ) ) ( not ( = ?auto_21483 ?auto_21481 ) ) ( not ( = ?auto_21483 ?auto_21480 ) ) ( not ( = ?auto_21479 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21483 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21484 ?auto_21483 ?auto_21482 ?auto_21481 )
      ( MAKE-3PILE ?auto_21479 ?auto_21480 ?auto_21481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21485 - BLOCK
      ?auto_21486 - BLOCK
      ?auto_21487 - BLOCK
    )
    :vars
    (
      ?auto_21490 - BLOCK
      ?auto_21488 - BLOCK
      ?auto_21489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21485 ?auto_21486 ) ) ( not ( = ?auto_21485 ?auto_21487 ) ) ( not ( = ?auto_21486 ?auto_21487 ) ) ( ON ?auto_21487 ?auto_21490 ) ( not ( = ?auto_21485 ?auto_21490 ) ) ( not ( = ?auto_21486 ?auto_21490 ) ) ( not ( = ?auto_21487 ?auto_21490 ) ) ( ON ?auto_21486 ?auto_21487 ) ( CLEAR ?auto_21486 ) ( ON-TABLE ?auto_21488 ) ( ON ?auto_21489 ?auto_21488 ) ( ON ?auto_21490 ?auto_21489 ) ( not ( = ?auto_21488 ?auto_21489 ) ) ( not ( = ?auto_21488 ?auto_21490 ) ) ( not ( = ?auto_21488 ?auto_21487 ) ) ( not ( = ?auto_21488 ?auto_21486 ) ) ( not ( = ?auto_21489 ?auto_21490 ) ) ( not ( = ?auto_21489 ?auto_21487 ) ) ( not ( = ?auto_21489 ?auto_21486 ) ) ( not ( = ?auto_21485 ?auto_21488 ) ) ( not ( = ?auto_21485 ?auto_21489 ) ) ( HOLDING ?auto_21485 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21485 )
      ( MAKE-3PILE ?auto_21485 ?auto_21486 ?auto_21487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21491 - BLOCK
      ?auto_21492 - BLOCK
      ?auto_21493 - BLOCK
    )
    :vars
    (
      ?auto_21494 - BLOCK
      ?auto_21495 - BLOCK
      ?auto_21496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21491 ?auto_21492 ) ) ( not ( = ?auto_21491 ?auto_21493 ) ) ( not ( = ?auto_21492 ?auto_21493 ) ) ( ON ?auto_21493 ?auto_21494 ) ( not ( = ?auto_21491 ?auto_21494 ) ) ( not ( = ?auto_21492 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( ON ?auto_21492 ?auto_21493 ) ( ON-TABLE ?auto_21495 ) ( ON ?auto_21496 ?auto_21495 ) ( ON ?auto_21494 ?auto_21496 ) ( not ( = ?auto_21495 ?auto_21496 ) ) ( not ( = ?auto_21495 ?auto_21494 ) ) ( not ( = ?auto_21495 ?auto_21493 ) ) ( not ( = ?auto_21495 ?auto_21492 ) ) ( not ( = ?auto_21496 ?auto_21494 ) ) ( not ( = ?auto_21496 ?auto_21493 ) ) ( not ( = ?auto_21496 ?auto_21492 ) ) ( not ( = ?auto_21491 ?auto_21495 ) ) ( not ( = ?auto_21491 ?auto_21496 ) ) ( ON ?auto_21491 ?auto_21492 ) ( CLEAR ?auto_21491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21495 ?auto_21496 ?auto_21494 ?auto_21493 ?auto_21492 )
      ( MAKE-3PILE ?auto_21491 ?auto_21492 ?auto_21493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21499 - BLOCK
      ?auto_21500 - BLOCK
    )
    :vars
    (
      ?auto_21501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21501 ?auto_21500 ) ( CLEAR ?auto_21501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21499 ) ( ON ?auto_21500 ?auto_21499 ) ( not ( = ?auto_21499 ?auto_21500 ) ) ( not ( = ?auto_21499 ?auto_21501 ) ) ( not ( = ?auto_21500 ?auto_21501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21501 ?auto_21500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21502 - BLOCK
      ?auto_21503 - BLOCK
    )
    :vars
    (
      ?auto_21504 - BLOCK
      ?auto_21505 - BLOCK
      ?auto_21506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21504 ?auto_21503 ) ( CLEAR ?auto_21504 ) ( ON-TABLE ?auto_21502 ) ( ON ?auto_21503 ?auto_21502 ) ( not ( = ?auto_21502 ?auto_21503 ) ) ( not ( = ?auto_21502 ?auto_21504 ) ) ( not ( = ?auto_21503 ?auto_21504 ) ) ( HOLDING ?auto_21505 ) ( CLEAR ?auto_21506 ) ( not ( = ?auto_21502 ?auto_21505 ) ) ( not ( = ?auto_21502 ?auto_21506 ) ) ( not ( = ?auto_21503 ?auto_21505 ) ) ( not ( = ?auto_21503 ?auto_21506 ) ) ( not ( = ?auto_21504 ?auto_21505 ) ) ( not ( = ?auto_21504 ?auto_21506 ) ) ( not ( = ?auto_21505 ?auto_21506 ) ) )
    :subtasks
    ( ( !STACK ?auto_21505 ?auto_21506 )
      ( MAKE-2PILE ?auto_21502 ?auto_21503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21507 - BLOCK
      ?auto_21508 - BLOCK
    )
    :vars
    (
      ?auto_21509 - BLOCK
      ?auto_21510 - BLOCK
      ?auto_21511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21509 ?auto_21508 ) ( ON-TABLE ?auto_21507 ) ( ON ?auto_21508 ?auto_21507 ) ( not ( = ?auto_21507 ?auto_21508 ) ) ( not ( = ?auto_21507 ?auto_21509 ) ) ( not ( = ?auto_21508 ?auto_21509 ) ) ( CLEAR ?auto_21510 ) ( not ( = ?auto_21507 ?auto_21511 ) ) ( not ( = ?auto_21507 ?auto_21510 ) ) ( not ( = ?auto_21508 ?auto_21511 ) ) ( not ( = ?auto_21508 ?auto_21510 ) ) ( not ( = ?auto_21509 ?auto_21511 ) ) ( not ( = ?auto_21509 ?auto_21510 ) ) ( not ( = ?auto_21511 ?auto_21510 ) ) ( ON ?auto_21511 ?auto_21509 ) ( CLEAR ?auto_21511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21507 ?auto_21508 ?auto_21509 )
      ( MAKE-2PILE ?auto_21507 ?auto_21508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21512 - BLOCK
      ?auto_21513 - BLOCK
    )
    :vars
    (
      ?auto_21516 - BLOCK
      ?auto_21515 - BLOCK
      ?auto_21514 - BLOCK
      ?auto_21517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21516 ?auto_21513 ) ( ON-TABLE ?auto_21512 ) ( ON ?auto_21513 ?auto_21512 ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21515 ) ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21516 ?auto_21515 ) ) ( not ( = ?auto_21516 ?auto_21514 ) ) ( not ( = ?auto_21515 ?auto_21514 ) ) ( ON ?auto_21515 ?auto_21516 ) ( CLEAR ?auto_21515 ) ( HOLDING ?auto_21514 ) ( CLEAR ?auto_21517 ) ( ON-TABLE ?auto_21517 ) ( not ( = ?auto_21517 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21517 ) ) ( not ( = ?auto_21513 ?auto_21517 ) ) ( not ( = ?auto_21516 ?auto_21517 ) ) ( not ( = ?auto_21515 ?auto_21517 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21517 ?auto_21514 )
      ( MAKE-2PILE ?auto_21512 ?auto_21513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21936 - BLOCK
      ?auto_21937 - BLOCK
    )
    :vars
    (
      ?auto_21939 - BLOCK
      ?auto_21940 - BLOCK
      ?auto_21938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21939 ?auto_21937 ) ( ON-TABLE ?auto_21936 ) ( ON ?auto_21937 ?auto_21936 ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21939 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21940 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21940 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( not ( = ?auto_21939 ?auto_21938 ) ) ( not ( = ?auto_21940 ?auto_21938 ) ) ( ON ?auto_21940 ?auto_21939 ) ( ON ?auto_21938 ?auto_21940 ) ( CLEAR ?auto_21938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21936 ?auto_21937 ?auto_21939 ?auto_21940 )
      ( MAKE-2PILE ?auto_21936 ?auto_21937 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21524 - BLOCK
      ?auto_21525 - BLOCK
    )
    :vars
    (
      ?auto_21528 - BLOCK
      ?auto_21527 - BLOCK
      ?auto_21529 - BLOCK
      ?auto_21526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21528 ?auto_21525 ) ( ON-TABLE ?auto_21524 ) ( ON ?auto_21525 ?auto_21524 ) ( not ( = ?auto_21524 ?auto_21525 ) ) ( not ( = ?auto_21524 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21524 ?auto_21527 ) ) ( not ( = ?auto_21524 ?auto_21529 ) ) ( not ( = ?auto_21525 ?auto_21527 ) ) ( not ( = ?auto_21525 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21527 ) ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21527 ?auto_21529 ) ) ( ON ?auto_21527 ?auto_21528 ) ( not ( = ?auto_21526 ?auto_21529 ) ) ( not ( = ?auto_21524 ?auto_21526 ) ) ( not ( = ?auto_21525 ?auto_21526 ) ) ( not ( = ?auto_21528 ?auto_21526 ) ) ( not ( = ?auto_21527 ?auto_21526 ) ) ( ON ?auto_21529 ?auto_21527 ) ( CLEAR ?auto_21529 ) ( HOLDING ?auto_21526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21526 )
      ( MAKE-2PILE ?auto_21524 ?auto_21525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21530 - BLOCK
      ?auto_21531 - BLOCK
    )
    :vars
    (
      ?auto_21534 - BLOCK
      ?auto_21532 - BLOCK
      ?auto_21535 - BLOCK
      ?auto_21533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21534 ?auto_21531 ) ( ON-TABLE ?auto_21530 ) ( ON ?auto_21531 ?auto_21530 ) ( not ( = ?auto_21530 ?auto_21531 ) ) ( not ( = ?auto_21530 ?auto_21534 ) ) ( not ( = ?auto_21531 ?auto_21534 ) ) ( not ( = ?auto_21530 ?auto_21532 ) ) ( not ( = ?auto_21530 ?auto_21535 ) ) ( not ( = ?auto_21531 ?auto_21532 ) ) ( not ( = ?auto_21531 ?auto_21535 ) ) ( not ( = ?auto_21534 ?auto_21532 ) ) ( not ( = ?auto_21534 ?auto_21535 ) ) ( not ( = ?auto_21532 ?auto_21535 ) ) ( ON ?auto_21532 ?auto_21534 ) ( not ( = ?auto_21533 ?auto_21535 ) ) ( not ( = ?auto_21530 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21534 ?auto_21533 ) ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( ON ?auto_21535 ?auto_21532 ) ( ON ?auto_21533 ?auto_21535 ) ( CLEAR ?auto_21533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21530 ?auto_21531 ?auto_21534 ?auto_21532 ?auto_21535 )
      ( MAKE-2PILE ?auto_21530 ?auto_21531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21540 - BLOCK
      ?auto_21541 - BLOCK
      ?auto_21542 - BLOCK
      ?auto_21543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21543 ) ( CLEAR ?auto_21542 ) ( ON-TABLE ?auto_21540 ) ( ON ?auto_21541 ?auto_21540 ) ( ON ?auto_21542 ?auto_21541 ) ( not ( = ?auto_21540 ?auto_21541 ) ) ( not ( = ?auto_21540 ?auto_21542 ) ) ( not ( = ?auto_21540 ?auto_21543 ) ) ( not ( = ?auto_21541 ?auto_21542 ) ) ( not ( = ?auto_21541 ?auto_21543 ) ) ( not ( = ?auto_21542 ?auto_21543 ) ) )
    :subtasks
    ( ( !STACK ?auto_21543 ?auto_21542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21544 - BLOCK
      ?auto_21545 - BLOCK
      ?auto_21546 - BLOCK
      ?auto_21547 - BLOCK
    )
    :vars
    (
      ?auto_21548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21546 ) ( ON-TABLE ?auto_21544 ) ( ON ?auto_21545 ?auto_21544 ) ( ON ?auto_21546 ?auto_21545 ) ( not ( = ?auto_21544 ?auto_21545 ) ) ( not ( = ?auto_21544 ?auto_21546 ) ) ( not ( = ?auto_21544 ?auto_21547 ) ) ( not ( = ?auto_21545 ?auto_21546 ) ) ( not ( = ?auto_21545 ?auto_21547 ) ) ( not ( = ?auto_21546 ?auto_21547 ) ) ( ON ?auto_21547 ?auto_21548 ) ( CLEAR ?auto_21547 ) ( HAND-EMPTY ) ( not ( = ?auto_21544 ?auto_21548 ) ) ( not ( = ?auto_21545 ?auto_21548 ) ) ( not ( = ?auto_21546 ?auto_21548 ) ) ( not ( = ?auto_21547 ?auto_21548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21547 ?auto_21548 )
      ( MAKE-4PILE ?auto_21544 ?auto_21545 ?auto_21546 ?auto_21547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21549 - BLOCK
      ?auto_21550 - BLOCK
      ?auto_21551 - BLOCK
      ?auto_21552 - BLOCK
    )
    :vars
    (
      ?auto_21553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21549 ) ( ON ?auto_21550 ?auto_21549 ) ( not ( = ?auto_21549 ?auto_21550 ) ) ( not ( = ?auto_21549 ?auto_21551 ) ) ( not ( = ?auto_21549 ?auto_21552 ) ) ( not ( = ?auto_21550 ?auto_21551 ) ) ( not ( = ?auto_21550 ?auto_21552 ) ) ( not ( = ?auto_21551 ?auto_21552 ) ) ( ON ?auto_21552 ?auto_21553 ) ( CLEAR ?auto_21552 ) ( not ( = ?auto_21549 ?auto_21553 ) ) ( not ( = ?auto_21550 ?auto_21553 ) ) ( not ( = ?auto_21551 ?auto_21553 ) ) ( not ( = ?auto_21552 ?auto_21553 ) ) ( HOLDING ?auto_21551 ) ( CLEAR ?auto_21550 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21549 ?auto_21550 ?auto_21551 )
      ( MAKE-4PILE ?auto_21549 ?auto_21550 ?auto_21551 ?auto_21552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21554 - BLOCK
      ?auto_21555 - BLOCK
      ?auto_21556 - BLOCK
      ?auto_21557 - BLOCK
    )
    :vars
    (
      ?auto_21558 - BLOCK
      ?auto_21559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21554 ) ( ON ?auto_21555 ?auto_21554 ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21557 ) ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( ON ?auto_21557 ?auto_21558 ) ( not ( = ?auto_21554 ?auto_21558 ) ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21558 ) ) ( CLEAR ?auto_21555 ) ( ON ?auto_21556 ?auto_21557 ) ( CLEAR ?auto_21556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21559 ) ( ON ?auto_21558 ?auto_21559 ) ( not ( = ?auto_21559 ?auto_21558 ) ) ( not ( = ?auto_21559 ?auto_21557 ) ) ( not ( = ?auto_21559 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21559 ?auto_21558 ?auto_21557 )
      ( MAKE-4PILE ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21560 - BLOCK
      ?auto_21561 - BLOCK
      ?auto_21562 - BLOCK
      ?auto_21563 - BLOCK
    )
    :vars
    (
      ?auto_21564 - BLOCK
      ?auto_21565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21560 ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( not ( = ?auto_21560 ?auto_21562 ) ) ( not ( = ?auto_21560 ?auto_21563 ) ) ( not ( = ?auto_21561 ?auto_21562 ) ) ( not ( = ?auto_21561 ?auto_21563 ) ) ( not ( = ?auto_21562 ?auto_21563 ) ) ( ON ?auto_21563 ?auto_21564 ) ( not ( = ?auto_21560 ?auto_21564 ) ) ( not ( = ?auto_21561 ?auto_21564 ) ) ( not ( = ?auto_21562 ?auto_21564 ) ) ( not ( = ?auto_21563 ?auto_21564 ) ) ( ON ?auto_21562 ?auto_21563 ) ( CLEAR ?auto_21562 ) ( ON-TABLE ?auto_21565 ) ( ON ?auto_21564 ?auto_21565 ) ( not ( = ?auto_21565 ?auto_21564 ) ) ( not ( = ?auto_21565 ?auto_21563 ) ) ( not ( = ?auto_21565 ?auto_21562 ) ) ( not ( = ?auto_21560 ?auto_21565 ) ) ( not ( = ?auto_21561 ?auto_21565 ) ) ( HOLDING ?auto_21561 ) ( CLEAR ?auto_21560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21560 ?auto_21561 )
      ( MAKE-4PILE ?auto_21560 ?auto_21561 ?auto_21562 ?auto_21563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21566 - BLOCK
      ?auto_21567 - BLOCK
      ?auto_21568 - BLOCK
      ?auto_21569 - BLOCK
    )
    :vars
    (
      ?auto_21571 - BLOCK
      ?auto_21570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21566 ) ( not ( = ?auto_21566 ?auto_21567 ) ) ( not ( = ?auto_21566 ?auto_21568 ) ) ( not ( = ?auto_21566 ?auto_21569 ) ) ( not ( = ?auto_21567 ?auto_21568 ) ) ( not ( = ?auto_21567 ?auto_21569 ) ) ( not ( = ?auto_21568 ?auto_21569 ) ) ( ON ?auto_21569 ?auto_21571 ) ( not ( = ?auto_21566 ?auto_21571 ) ) ( not ( = ?auto_21567 ?auto_21571 ) ) ( not ( = ?auto_21568 ?auto_21571 ) ) ( not ( = ?auto_21569 ?auto_21571 ) ) ( ON ?auto_21568 ?auto_21569 ) ( ON-TABLE ?auto_21570 ) ( ON ?auto_21571 ?auto_21570 ) ( not ( = ?auto_21570 ?auto_21571 ) ) ( not ( = ?auto_21570 ?auto_21569 ) ) ( not ( = ?auto_21570 ?auto_21568 ) ) ( not ( = ?auto_21566 ?auto_21570 ) ) ( not ( = ?auto_21567 ?auto_21570 ) ) ( CLEAR ?auto_21566 ) ( ON ?auto_21567 ?auto_21568 ) ( CLEAR ?auto_21567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21570 ?auto_21571 ?auto_21569 ?auto_21568 )
      ( MAKE-4PILE ?auto_21566 ?auto_21567 ?auto_21568 ?auto_21569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21572 - BLOCK
      ?auto_21573 - BLOCK
      ?auto_21574 - BLOCK
      ?auto_21575 - BLOCK
    )
    :vars
    (
      ?auto_21576 - BLOCK
      ?auto_21577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21572 ?auto_21573 ) ) ( not ( = ?auto_21572 ?auto_21574 ) ) ( not ( = ?auto_21572 ?auto_21575 ) ) ( not ( = ?auto_21573 ?auto_21574 ) ) ( not ( = ?auto_21573 ?auto_21575 ) ) ( not ( = ?auto_21574 ?auto_21575 ) ) ( ON ?auto_21575 ?auto_21576 ) ( not ( = ?auto_21572 ?auto_21576 ) ) ( not ( = ?auto_21573 ?auto_21576 ) ) ( not ( = ?auto_21574 ?auto_21576 ) ) ( not ( = ?auto_21575 ?auto_21576 ) ) ( ON ?auto_21574 ?auto_21575 ) ( ON-TABLE ?auto_21577 ) ( ON ?auto_21576 ?auto_21577 ) ( not ( = ?auto_21577 ?auto_21576 ) ) ( not ( = ?auto_21577 ?auto_21575 ) ) ( not ( = ?auto_21577 ?auto_21574 ) ) ( not ( = ?auto_21572 ?auto_21577 ) ) ( not ( = ?auto_21573 ?auto_21577 ) ) ( ON ?auto_21573 ?auto_21574 ) ( CLEAR ?auto_21573 ) ( HOLDING ?auto_21572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21572 )
      ( MAKE-4PILE ?auto_21572 ?auto_21573 ?auto_21574 ?auto_21575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21578 - BLOCK
      ?auto_21579 - BLOCK
      ?auto_21580 - BLOCK
      ?auto_21581 - BLOCK
    )
    :vars
    (
      ?auto_21582 - BLOCK
      ?auto_21583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21578 ?auto_21579 ) ) ( not ( = ?auto_21578 ?auto_21580 ) ) ( not ( = ?auto_21578 ?auto_21581 ) ) ( not ( = ?auto_21579 ?auto_21580 ) ) ( not ( = ?auto_21579 ?auto_21581 ) ) ( not ( = ?auto_21580 ?auto_21581 ) ) ( ON ?auto_21581 ?auto_21582 ) ( not ( = ?auto_21578 ?auto_21582 ) ) ( not ( = ?auto_21579 ?auto_21582 ) ) ( not ( = ?auto_21580 ?auto_21582 ) ) ( not ( = ?auto_21581 ?auto_21582 ) ) ( ON ?auto_21580 ?auto_21581 ) ( ON-TABLE ?auto_21583 ) ( ON ?auto_21582 ?auto_21583 ) ( not ( = ?auto_21583 ?auto_21582 ) ) ( not ( = ?auto_21583 ?auto_21581 ) ) ( not ( = ?auto_21583 ?auto_21580 ) ) ( not ( = ?auto_21578 ?auto_21583 ) ) ( not ( = ?auto_21579 ?auto_21583 ) ) ( ON ?auto_21579 ?auto_21580 ) ( ON ?auto_21578 ?auto_21579 ) ( CLEAR ?auto_21578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21583 ?auto_21582 ?auto_21581 ?auto_21580 ?auto_21579 )
      ( MAKE-4PILE ?auto_21578 ?auto_21579 ?auto_21580 ?auto_21581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21585 - BLOCK
    )
    :vars
    (
      ?auto_21586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21586 ?auto_21585 ) ( CLEAR ?auto_21586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21585 ) ( not ( = ?auto_21585 ?auto_21586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21586 ?auto_21585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21587 - BLOCK
    )
    :vars
    (
      ?auto_21588 - BLOCK
      ?auto_21589 - BLOCK
      ?auto_21590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21588 ?auto_21587 ) ( CLEAR ?auto_21588 ) ( ON-TABLE ?auto_21587 ) ( not ( = ?auto_21587 ?auto_21588 ) ) ( HOLDING ?auto_21589 ) ( CLEAR ?auto_21590 ) ( not ( = ?auto_21587 ?auto_21589 ) ) ( not ( = ?auto_21587 ?auto_21590 ) ) ( not ( = ?auto_21588 ?auto_21589 ) ) ( not ( = ?auto_21588 ?auto_21590 ) ) ( not ( = ?auto_21589 ?auto_21590 ) ) )
    :subtasks
    ( ( !STACK ?auto_21589 ?auto_21590 )
      ( MAKE-1PILE ?auto_21587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21591 - BLOCK
    )
    :vars
    (
      ?auto_21592 - BLOCK
      ?auto_21594 - BLOCK
      ?auto_21593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21592 ?auto_21591 ) ( ON-TABLE ?auto_21591 ) ( not ( = ?auto_21591 ?auto_21592 ) ) ( CLEAR ?auto_21594 ) ( not ( = ?auto_21591 ?auto_21593 ) ) ( not ( = ?auto_21591 ?auto_21594 ) ) ( not ( = ?auto_21592 ?auto_21593 ) ) ( not ( = ?auto_21592 ?auto_21594 ) ) ( not ( = ?auto_21593 ?auto_21594 ) ) ( ON ?auto_21593 ?auto_21592 ) ( CLEAR ?auto_21593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21591 ?auto_21592 )
      ( MAKE-1PILE ?auto_21591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21595 - BLOCK
    )
    :vars
    (
      ?auto_21597 - BLOCK
      ?auto_21596 - BLOCK
      ?auto_21598 - BLOCK
      ?auto_21599 - BLOCK
      ?auto_21600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21597 ?auto_21595 ) ( ON-TABLE ?auto_21595 ) ( not ( = ?auto_21595 ?auto_21597 ) ) ( not ( = ?auto_21595 ?auto_21596 ) ) ( not ( = ?auto_21595 ?auto_21598 ) ) ( not ( = ?auto_21597 ?auto_21596 ) ) ( not ( = ?auto_21597 ?auto_21598 ) ) ( not ( = ?auto_21596 ?auto_21598 ) ) ( ON ?auto_21596 ?auto_21597 ) ( CLEAR ?auto_21596 ) ( HOLDING ?auto_21598 ) ( CLEAR ?auto_21599 ) ( ON-TABLE ?auto_21600 ) ( ON ?auto_21599 ?auto_21600 ) ( not ( = ?auto_21600 ?auto_21599 ) ) ( not ( = ?auto_21600 ?auto_21598 ) ) ( not ( = ?auto_21599 ?auto_21598 ) ) ( not ( = ?auto_21595 ?auto_21599 ) ) ( not ( = ?auto_21595 ?auto_21600 ) ) ( not ( = ?auto_21597 ?auto_21599 ) ) ( not ( = ?auto_21597 ?auto_21600 ) ) ( not ( = ?auto_21596 ?auto_21599 ) ) ( not ( = ?auto_21596 ?auto_21600 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21600 ?auto_21599 ?auto_21598 )
      ( MAKE-1PILE ?auto_21595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21601 - BLOCK
    )
    :vars
    (
      ?auto_21605 - BLOCK
      ?auto_21603 - BLOCK
      ?auto_21604 - BLOCK
      ?auto_21606 - BLOCK
      ?auto_21602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21605 ?auto_21601 ) ( ON-TABLE ?auto_21601 ) ( not ( = ?auto_21601 ?auto_21605 ) ) ( not ( = ?auto_21601 ?auto_21603 ) ) ( not ( = ?auto_21601 ?auto_21604 ) ) ( not ( = ?auto_21605 ?auto_21603 ) ) ( not ( = ?auto_21605 ?auto_21604 ) ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( ON ?auto_21603 ?auto_21605 ) ( CLEAR ?auto_21606 ) ( ON-TABLE ?auto_21602 ) ( ON ?auto_21606 ?auto_21602 ) ( not ( = ?auto_21602 ?auto_21606 ) ) ( not ( = ?auto_21602 ?auto_21604 ) ) ( not ( = ?auto_21606 ?auto_21604 ) ) ( not ( = ?auto_21601 ?auto_21606 ) ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21605 ?auto_21606 ) ) ( not ( = ?auto_21605 ?auto_21602 ) ) ( not ( = ?auto_21603 ?auto_21606 ) ) ( not ( = ?auto_21603 ?auto_21602 ) ) ( ON ?auto_21604 ?auto_21603 ) ( CLEAR ?auto_21604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21601 ?auto_21605 ?auto_21603 )
      ( MAKE-1PILE ?auto_21601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21607 - BLOCK
    )
    :vars
    (
      ?auto_21608 - BLOCK
      ?auto_21609 - BLOCK
      ?auto_21611 - BLOCK
      ?auto_21610 - BLOCK
      ?auto_21612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21608 ?auto_21607 ) ( ON-TABLE ?auto_21607 ) ( not ( = ?auto_21607 ?auto_21608 ) ) ( not ( = ?auto_21607 ?auto_21609 ) ) ( not ( = ?auto_21607 ?auto_21611 ) ) ( not ( = ?auto_21608 ?auto_21609 ) ) ( not ( = ?auto_21608 ?auto_21611 ) ) ( not ( = ?auto_21609 ?auto_21611 ) ) ( ON ?auto_21609 ?auto_21608 ) ( ON-TABLE ?auto_21610 ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21611 ) ) ( not ( = ?auto_21612 ?auto_21611 ) ) ( not ( = ?auto_21607 ?auto_21612 ) ) ( not ( = ?auto_21607 ?auto_21610 ) ) ( not ( = ?auto_21608 ?auto_21612 ) ) ( not ( = ?auto_21608 ?auto_21610 ) ) ( not ( = ?auto_21609 ?auto_21612 ) ) ( not ( = ?auto_21609 ?auto_21610 ) ) ( ON ?auto_21611 ?auto_21609 ) ( CLEAR ?auto_21611 ) ( HOLDING ?auto_21612 ) ( CLEAR ?auto_21610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21610 ?auto_21612 )
      ( MAKE-1PILE ?auto_21607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22076 - BLOCK
    )
    :vars
    (
      ?auto_22079 - BLOCK
      ?auto_22078 - BLOCK
      ?auto_22080 - BLOCK
      ?auto_22077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22079 ?auto_22076 ) ( ON-TABLE ?auto_22076 ) ( not ( = ?auto_22076 ?auto_22079 ) ) ( not ( = ?auto_22076 ?auto_22078 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22078 ) ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( not ( = ?auto_22078 ?auto_22080 ) ) ( ON ?auto_22078 ?auto_22079 ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22076 ?auto_22077 ) ) ( not ( = ?auto_22079 ?auto_22077 ) ) ( not ( = ?auto_22078 ?auto_22077 ) ) ( ON ?auto_22080 ?auto_22078 ) ( ON ?auto_22077 ?auto_22080 ) ( CLEAR ?auto_22077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22076 ?auto_22079 ?auto_22078 ?auto_22080 )
      ( MAKE-1PILE ?auto_22076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21619 - BLOCK
    )
    :vars
    (
      ?auto_21623 - BLOCK
      ?auto_21621 - BLOCK
      ?auto_21622 - BLOCK
      ?auto_21624 - BLOCK
      ?auto_21620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21623 ?auto_21619 ) ( ON-TABLE ?auto_21619 ) ( not ( = ?auto_21619 ?auto_21623 ) ) ( not ( = ?auto_21619 ?auto_21621 ) ) ( not ( = ?auto_21619 ?auto_21622 ) ) ( not ( = ?auto_21623 ?auto_21621 ) ) ( not ( = ?auto_21623 ?auto_21622 ) ) ( not ( = ?auto_21621 ?auto_21622 ) ) ( ON ?auto_21621 ?auto_21623 ) ( not ( = ?auto_21624 ?auto_21620 ) ) ( not ( = ?auto_21624 ?auto_21622 ) ) ( not ( = ?auto_21620 ?auto_21622 ) ) ( not ( = ?auto_21619 ?auto_21620 ) ) ( not ( = ?auto_21619 ?auto_21624 ) ) ( not ( = ?auto_21623 ?auto_21620 ) ) ( not ( = ?auto_21623 ?auto_21624 ) ) ( not ( = ?auto_21621 ?auto_21620 ) ) ( not ( = ?auto_21621 ?auto_21624 ) ) ( ON ?auto_21622 ?auto_21621 ) ( ON ?auto_21620 ?auto_21622 ) ( CLEAR ?auto_21620 ) ( HOLDING ?auto_21624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21624 )
      ( MAKE-1PILE ?auto_21619 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21625 - BLOCK
    )
    :vars
    (
      ?auto_21626 - BLOCK
      ?auto_21628 - BLOCK
      ?auto_21629 - BLOCK
      ?auto_21630 - BLOCK
      ?auto_21627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21626 ?auto_21625 ) ( ON-TABLE ?auto_21625 ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21628 ) ) ( not ( = ?auto_21625 ?auto_21629 ) ) ( not ( = ?auto_21626 ?auto_21628 ) ) ( not ( = ?auto_21626 ?auto_21629 ) ) ( not ( = ?auto_21628 ?auto_21629 ) ) ( ON ?auto_21628 ?auto_21626 ) ( not ( = ?auto_21630 ?auto_21627 ) ) ( not ( = ?auto_21630 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21629 ) ) ( not ( = ?auto_21625 ?auto_21627 ) ) ( not ( = ?auto_21625 ?auto_21630 ) ) ( not ( = ?auto_21626 ?auto_21627 ) ) ( not ( = ?auto_21626 ?auto_21630 ) ) ( not ( = ?auto_21628 ?auto_21627 ) ) ( not ( = ?auto_21628 ?auto_21630 ) ) ( ON ?auto_21629 ?auto_21628 ) ( ON ?auto_21627 ?auto_21629 ) ( ON ?auto_21630 ?auto_21627 ) ( CLEAR ?auto_21630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21625 ?auto_21626 ?auto_21628 ?auto_21629 ?auto_21627 )
      ( MAKE-1PILE ?auto_21625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21636 - BLOCK
      ?auto_21637 - BLOCK
      ?auto_21638 - BLOCK
      ?auto_21639 - BLOCK
      ?auto_21640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21640 ) ( CLEAR ?auto_21639 ) ( ON-TABLE ?auto_21636 ) ( ON ?auto_21637 ?auto_21636 ) ( ON ?auto_21638 ?auto_21637 ) ( ON ?auto_21639 ?auto_21638 ) ( not ( = ?auto_21636 ?auto_21637 ) ) ( not ( = ?auto_21636 ?auto_21638 ) ) ( not ( = ?auto_21636 ?auto_21639 ) ) ( not ( = ?auto_21636 ?auto_21640 ) ) ( not ( = ?auto_21637 ?auto_21638 ) ) ( not ( = ?auto_21637 ?auto_21639 ) ) ( not ( = ?auto_21637 ?auto_21640 ) ) ( not ( = ?auto_21638 ?auto_21639 ) ) ( not ( = ?auto_21638 ?auto_21640 ) ) ( not ( = ?auto_21639 ?auto_21640 ) ) )
    :subtasks
    ( ( !STACK ?auto_21640 ?auto_21639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21641 - BLOCK
      ?auto_21642 - BLOCK
      ?auto_21643 - BLOCK
      ?auto_21644 - BLOCK
      ?auto_21645 - BLOCK
    )
    :vars
    (
      ?auto_21646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21644 ) ( ON-TABLE ?auto_21641 ) ( ON ?auto_21642 ?auto_21641 ) ( ON ?auto_21643 ?auto_21642 ) ( ON ?auto_21644 ?auto_21643 ) ( not ( = ?auto_21641 ?auto_21642 ) ) ( not ( = ?auto_21641 ?auto_21643 ) ) ( not ( = ?auto_21641 ?auto_21644 ) ) ( not ( = ?auto_21641 ?auto_21645 ) ) ( not ( = ?auto_21642 ?auto_21643 ) ) ( not ( = ?auto_21642 ?auto_21644 ) ) ( not ( = ?auto_21642 ?auto_21645 ) ) ( not ( = ?auto_21643 ?auto_21644 ) ) ( not ( = ?auto_21643 ?auto_21645 ) ) ( not ( = ?auto_21644 ?auto_21645 ) ) ( ON ?auto_21645 ?auto_21646 ) ( CLEAR ?auto_21645 ) ( HAND-EMPTY ) ( not ( = ?auto_21641 ?auto_21646 ) ) ( not ( = ?auto_21642 ?auto_21646 ) ) ( not ( = ?auto_21643 ?auto_21646 ) ) ( not ( = ?auto_21644 ?auto_21646 ) ) ( not ( = ?auto_21645 ?auto_21646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21645 ?auto_21646 )
      ( MAKE-5PILE ?auto_21641 ?auto_21642 ?auto_21643 ?auto_21644 ?auto_21645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21647 - BLOCK
      ?auto_21648 - BLOCK
      ?auto_21649 - BLOCK
      ?auto_21650 - BLOCK
      ?auto_21651 - BLOCK
    )
    :vars
    (
      ?auto_21652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21647 ) ( ON ?auto_21648 ?auto_21647 ) ( ON ?auto_21649 ?auto_21648 ) ( not ( = ?auto_21647 ?auto_21648 ) ) ( not ( = ?auto_21647 ?auto_21649 ) ) ( not ( = ?auto_21647 ?auto_21650 ) ) ( not ( = ?auto_21647 ?auto_21651 ) ) ( not ( = ?auto_21648 ?auto_21649 ) ) ( not ( = ?auto_21648 ?auto_21650 ) ) ( not ( = ?auto_21648 ?auto_21651 ) ) ( not ( = ?auto_21649 ?auto_21650 ) ) ( not ( = ?auto_21649 ?auto_21651 ) ) ( not ( = ?auto_21650 ?auto_21651 ) ) ( ON ?auto_21651 ?auto_21652 ) ( CLEAR ?auto_21651 ) ( not ( = ?auto_21647 ?auto_21652 ) ) ( not ( = ?auto_21648 ?auto_21652 ) ) ( not ( = ?auto_21649 ?auto_21652 ) ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( HOLDING ?auto_21650 ) ( CLEAR ?auto_21649 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21647 ?auto_21648 ?auto_21649 ?auto_21650 )
      ( MAKE-5PILE ?auto_21647 ?auto_21648 ?auto_21649 ?auto_21650 ?auto_21651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21653 - BLOCK
      ?auto_21654 - BLOCK
      ?auto_21655 - BLOCK
      ?auto_21656 - BLOCK
      ?auto_21657 - BLOCK
    )
    :vars
    (
      ?auto_21658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21653 ) ( ON ?auto_21654 ?auto_21653 ) ( ON ?auto_21655 ?auto_21654 ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( not ( = ?auto_21653 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21657 ) ) ( not ( = ?auto_21654 ?auto_21655 ) ) ( not ( = ?auto_21654 ?auto_21656 ) ) ( not ( = ?auto_21654 ?auto_21657 ) ) ( not ( = ?auto_21655 ?auto_21656 ) ) ( not ( = ?auto_21655 ?auto_21657 ) ) ( not ( = ?auto_21656 ?auto_21657 ) ) ( ON ?auto_21657 ?auto_21658 ) ( not ( = ?auto_21653 ?auto_21658 ) ) ( not ( = ?auto_21654 ?auto_21658 ) ) ( not ( = ?auto_21655 ?auto_21658 ) ) ( not ( = ?auto_21656 ?auto_21658 ) ) ( not ( = ?auto_21657 ?auto_21658 ) ) ( CLEAR ?auto_21655 ) ( ON ?auto_21656 ?auto_21657 ) ( CLEAR ?auto_21656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21658 ?auto_21657 )
      ( MAKE-5PILE ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21656 ?auto_21657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21659 - BLOCK
      ?auto_21660 - BLOCK
      ?auto_21661 - BLOCK
      ?auto_21662 - BLOCK
      ?auto_21663 - BLOCK
    )
    :vars
    (
      ?auto_21664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21659 ) ( ON ?auto_21660 ?auto_21659 ) ( not ( = ?auto_21659 ?auto_21660 ) ) ( not ( = ?auto_21659 ?auto_21661 ) ) ( not ( = ?auto_21659 ?auto_21662 ) ) ( not ( = ?auto_21659 ?auto_21663 ) ) ( not ( = ?auto_21660 ?auto_21661 ) ) ( not ( = ?auto_21660 ?auto_21662 ) ) ( not ( = ?auto_21660 ?auto_21663 ) ) ( not ( = ?auto_21661 ?auto_21662 ) ) ( not ( = ?auto_21661 ?auto_21663 ) ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( ON ?auto_21663 ?auto_21664 ) ( not ( = ?auto_21659 ?auto_21664 ) ) ( not ( = ?auto_21660 ?auto_21664 ) ) ( not ( = ?auto_21661 ?auto_21664 ) ) ( not ( = ?auto_21662 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( ON ?auto_21662 ?auto_21663 ) ( CLEAR ?auto_21662 ) ( ON-TABLE ?auto_21664 ) ( HOLDING ?auto_21661 ) ( CLEAR ?auto_21660 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21659 ?auto_21660 ?auto_21661 )
      ( MAKE-5PILE ?auto_21659 ?auto_21660 ?auto_21661 ?auto_21662 ?auto_21663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21665 - BLOCK
      ?auto_21666 - BLOCK
      ?auto_21667 - BLOCK
      ?auto_21668 - BLOCK
      ?auto_21669 - BLOCK
    )
    :vars
    (
      ?auto_21670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21665 ) ( ON ?auto_21666 ?auto_21665 ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21667 ) ) ( not ( = ?auto_21665 ?auto_21668 ) ) ( not ( = ?auto_21665 ?auto_21669 ) ) ( not ( = ?auto_21666 ?auto_21667 ) ) ( not ( = ?auto_21666 ?auto_21668 ) ) ( not ( = ?auto_21666 ?auto_21669 ) ) ( not ( = ?auto_21667 ?auto_21668 ) ) ( not ( = ?auto_21667 ?auto_21669 ) ) ( not ( = ?auto_21668 ?auto_21669 ) ) ( ON ?auto_21669 ?auto_21670 ) ( not ( = ?auto_21665 ?auto_21670 ) ) ( not ( = ?auto_21666 ?auto_21670 ) ) ( not ( = ?auto_21667 ?auto_21670 ) ) ( not ( = ?auto_21668 ?auto_21670 ) ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( ON ?auto_21668 ?auto_21669 ) ( ON-TABLE ?auto_21670 ) ( CLEAR ?auto_21666 ) ( ON ?auto_21667 ?auto_21668 ) ( CLEAR ?auto_21667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21670 ?auto_21669 ?auto_21668 )
      ( MAKE-5PILE ?auto_21665 ?auto_21666 ?auto_21667 ?auto_21668 ?auto_21669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21671 - BLOCK
      ?auto_21672 - BLOCK
      ?auto_21673 - BLOCK
      ?auto_21674 - BLOCK
      ?auto_21675 - BLOCK
    )
    :vars
    (
      ?auto_21676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21671 ) ( not ( = ?auto_21671 ?auto_21672 ) ) ( not ( = ?auto_21671 ?auto_21673 ) ) ( not ( = ?auto_21671 ?auto_21674 ) ) ( not ( = ?auto_21671 ?auto_21675 ) ) ( not ( = ?auto_21672 ?auto_21673 ) ) ( not ( = ?auto_21672 ?auto_21674 ) ) ( not ( = ?auto_21672 ?auto_21675 ) ) ( not ( = ?auto_21673 ?auto_21674 ) ) ( not ( = ?auto_21673 ?auto_21675 ) ) ( not ( = ?auto_21674 ?auto_21675 ) ) ( ON ?auto_21675 ?auto_21676 ) ( not ( = ?auto_21671 ?auto_21676 ) ) ( not ( = ?auto_21672 ?auto_21676 ) ) ( not ( = ?auto_21673 ?auto_21676 ) ) ( not ( = ?auto_21674 ?auto_21676 ) ) ( not ( = ?auto_21675 ?auto_21676 ) ) ( ON ?auto_21674 ?auto_21675 ) ( ON-TABLE ?auto_21676 ) ( ON ?auto_21673 ?auto_21674 ) ( CLEAR ?auto_21673 ) ( HOLDING ?auto_21672 ) ( CLEAR ?auto_21671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21671 ?auto_21672 )
      ( MAKE-5PILE ?auto_21671 ?auto_21672 ?auto_21673 ?auto_21674 ?auto_21675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21677 - BLOCK
      ?auto_21678 - BLOCK
      ?auto_21679 - BLOCK
      ?auto_21680 - BLOCK
      ?auto_21681 - BLOCK
    )
    :vars
    (
      ?auto_21682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21677 ) ( not ( = ?auto_21677 ?auto_21678 ) ) ( not ( = ?auto_21677 ?auto_21679 ) ) ( not ( = ?auto_21677 ?auto_21680 ) ) ( not ( = ?auto_21677 ?auto_21681 ) ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) ( not ( = ?auto_21678 ?auto_21681 ) ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( not ( = ?auto_21679 ?auto_21681 ) ) ( not ( = ?auto_21680 ?auto_21681 ) ) ( ON ?auto_21681 ?auto_21682 ) ( not ( = ?auto_21677 ?auto_21682 ) ) ( not ( = ?auto_21678 ?auto_21682 ) ) ( not ( = ?auto_21679 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( not ( = ?auto_21681 ?auto_21682 ) ) ( ON ?auto_21680 ?auto_21681 ) ( ON-TABLE ?auto_21682 ) ( ON ?auto_21679 ?auto_21680 ) ( CLEAR ?auto_21677 ) ( ON ?auto_21678 ?auto_21679 ) ( CLEAR ?auto_21678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21682 ?auto_21681 ?auto_21680 ?auto_21679 )
      ( MAKE-5PILE ?auto_21677 ?auto_21678 ?auto_21679 ?auto_21680 ?auto_21681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21683 - BLOCK
      ?auto_21684 - BLOCK
      ?auto_21685 - BLOCK
      ?auto_21686 - BLOCK
      ?auto_21687 - BLOCK
    )
    :vars
    (
      ?auto_21688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21683 ?auto_21685 ) ) ( not ( = ?auto_21683 ?auto_21686 ) ) ( not ( = ?auto_21683 ?auto_21687 ) ) ( not ( = ?auto_21684 ?auto_21685 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21686 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21686 ?auto_21687 ) ) ( ON ?auto_21687 ?auto_21688 ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21684 ?auto_21688 ) ) ( not ( = ?auto_21685 ?auto_21688 ) ) ( not ( = ?auto_21686 ?auto_21688 ) ) ( not ( = ?auto_21687 ?auto_21688 ) ) ( ON ?auto_21686 ?auto_21687 ) ( ON-TABLE ?auto_21688 ) ( ON ?auto_21685 ?auto_21686 ) ( ON ?auto_21684 ?auto_21685 ) ( CLEAR ?auto_21684 ) ( HOLDING ?auto_21683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21683 )
      ( MAKE-5PILE ?auto_21683 ?auto_21684 ?auto_21685 ?auto_21686 ?auto_21687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21689 - BLOCK
      ?auto_21690 - BLOCK
      ?auto_21691 - BLOCK
      ?auto_21692 - BLOCK
      ?auto_21693 - BLOCK
    )
    :vars
    (
      ?auto_21694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21689 ?auto_21690 ) ) ( not ( = ?auto_21689 ?auto_21691 ) ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( not ( = ?auto_21689 ?auto_21693 ) ) ( not ( = ?auto_21690 ?auto_21691 ) ) ( not ( = ?auto_21690 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21693 ) ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21693 ) ) ( not ( = ?auto_21692 ?auto_21693 ) ) ( ON ?auto_21693 ?auto_21694 ) ( not ( = ?auto_21689 ?auto_21694 ) ) ( not ( = ?auto_21690 ?auto_21694 ) ) ( not ( = ?auto_21691 ?auto_21694 ) ) ( not ( = ?auto_21692 ?auto_21694 ) ) ( not ( = ?auto_21693 ?auto_21694 ) ) ( ON ?auto_21692 ?auto_21693 ) ( ON-TABLE ?auto_21694 ) ( ON ?auto_21691 ?auto_21692 ) ( ON ?auto_21690 ?auto_21691 ) ( ON ?auto_21689 ?auto_21690 ) ( CLEAR ?auto_21689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21694 ?auto_21693 ?auto_21692 ?auto_21691 ?auto_21690 )
      ( MAKE-5PILE ?auto_21689 ?auto_21690 ?auto_21691 ?auto_21692 ?auto_21693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21753 - BLOCK
    )
    :vars
    (
      ?auto_21754 - BLOCK
      ?auto_21755 - BLOCK
      ?auto_21756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21753 ?auto_21754 ) ( CLEAR ?auto_21753 ) ( not ( = ?auto_21753 ?auto_21754 ) ) ( HOLDING ?auto_21755 ) ( CLEAR ?auto_21756 ) ( not ( = ?auto_21753 ?auto_21755 ) ) ( not ( = ?auto_21753 ?auto_21756 ) ) ( not ( = ?auto_21754 ?auto_21755 ) ) ( not ( = ?auto_21754 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21756 ) ) )
    :subtasks
    ( ( !STACK ?auto_21755 ?auto_21756 )
      ( MAKE-1PILE ?auto_21753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21757 - BLOCK
    )
    :vars
    (
      ?auto_21760 - BLOCK
      ?auto_21759 - BLOCK
      ?auto_21758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21757 ?auto_21760 ) ( not ( = ?auto_21757 ?auto_21760 ) ) ( CLEAR ?auto_21759 ) ( not ( = ?auto_21757 ?auto_21758 ) ) ( not ( = ?auto_21757 ?auto_21759 ) ) ( not ( = ?auto_21760 ?auto_21758 ) ) ( not ( = ?auto_21760 ?auto_21759 ) ) ( not ( = ?auto_21758 ?auto_21759 ) ) ( ON ?auto_21758 ?auto_21757 ) ( CLEAR ?auto_21758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21760 ?auto_21757 )
      ( MAKE-1PILE ?auto_21757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21761 - BLOCK
    )
    :vars
    (
      ?auto_21763 - BLOCK
      ?auto_21762 - BLOCK
      ?auto_21764 - BLOCK
      ?auto_21765 - BLOCK
      ?auto_21766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21761 ?auto_21763 ) ( not ( = ?auto_21761 ?auto_21763 ) ) ( not ( = ?auto_21761 ?auto_21762 ) ) ( not ( = ?auto_21761 ?auto_21764 ) ) ( not ( = ?auto_21763 ?auto_21762 ) ) ( not ( = ?auto_21763 ?auto_21764 ) ) ( not ( = ?auto_21762 ?auto_21764 ) ) ( ON ?auto_21762 ?auto_21761 ) ( CLEAR ?auto_21762 ) ( ON-TABLE ?auto_21763 ) ( HOLDING ?auto_21764 ) ( CLEAR ?auto_21765 ) ( ON-TABLE ?auto_21766 ) ( ON ?auto_21765 ?auto_21766 ) ( not ( = ?auto_21766 ?auto_21765 ) ) ( not ( = ?auto_21766 ?auto_21764 ) ) ( not ( = ?auto_21765 ?auto_21764 ) ) ( not ( = ?auto_21761 ?auto_21765 ) ) ( not ( = ?auto_21761 ?auto_21766 ) ) ( not ( = ?auto_21763 ?auto_21765 ) ) ( not ( = ?auto_21763 ?auto_21766 ) ) ( not ( = ?auto_21762 ?auto_21765 ) ) ( not ( = ?auto_21762 ?auto_21766 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21766 ?auto_21765 ?auto_21764 )
      ( MAKE-1PILE ?auto_21761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21767 - BLOCK
    )
    :vars
    (
      ?auto_21769 - BLOCK
      ?auto_21770 - BLOCK
      ?auto_21771 - BLOCK
      ?auto_21772 - BLOCK
      ?auto_21768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21767 ?auto_21769 ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21770 ?auto_21771 ) ) ( ON ?auto_21770 ?auto_21767 ) ( ON-TABLE ?auto_21769 ) ( CLEAR ?auto_21772 ) ( ON-TABLE ?auto_21768 ) ( ON ?auto_21772 ?auto_21768 ) ( not ( = ?auto_21768 ?auto_21772 ) ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21772 ?auto_21771 ) ) ( not ( = ?auto_21767 ?auto_21772 ) ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21769 ?auto_21772 ) ) ( not ( = ?auto_21769 ?auto_21768 ) ) ( not ( = ?auto_21770 ?auto_21772 ) ) ( not ( = ?auto_21770 ?auto_21768 ) ) ( ON ?auto_21771 ?auto_21770 ) ( CLEAR ?auto_21771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21769 ?auto_21767 ?auto_21770 )
      ( MAKE-1PILE ?auto_21767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21773 - BLOCK
    )
    :vars
    (
      ?auto_21774 - BLOCK
      ?auto_21777 - BLOCK
      ?auto_21775 - BLOCK
      ?auto_21776 - BLOCK
      ?auto_21778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21773 ?auto_21774 ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21777 ) ) ( not ( = ?auto_21773 ?auto_21775 ) ) ( not ( = ?auto_21774 ?auto_21777 ) ) ( not ( = ?auto_21774 ?auto_21775 ) ) ( not ( = ?auto_21777 ?auto_21775 ) ) ( ON ?auto_21777 ?auto_21773 ) ( ON-TABLE ?auto_21774 ) ( ON-TABLE ?auto_21776 ) ( not ( = ?auto_21776 ?auto_21778 ) ) ( not ( = ?auto_21776 ?auto_21775 ) ) ( not ( = ?auto_21778 ?auto_21775 ) ) ( not ( = ?auto_21773 ?auto_21778 ) ) ( not ( = ?auto_21773 ?auto_21776 ) ) ( not ( = ?auto_21774 ?auto_21778 ) ) ( not ( = ?auto_21774 ?auto_21776 ) ) ( not ( = ?auto_21777 ?auto_21778 ) ) ( not ( = ?auto_21777 ?auto_21776 ) ) ( ON ?auto_21775 ?auto_21777 ) ( CLEAR ?auto_21775 ) ( HOLDING ?auto_21778 ) ( CLEAR ?auto_21776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21776 ?auto_21778 )
      ( MAKE-1PILE ?auto_21773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21779 - BLOCK
    )
    :vars
    (
      ?auto_21782 - BLOCK
      ?auto_21781 - BLOCK
      ?auto_21783 - BLOCK
      ?auto_21780 - BLOCK
      ?auto_21784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21779 ?auto_21782 ) ( not ( = ?auto_21779 ?auto_21782 ) ) ( not ( = ?auto_21779 ?auto_21781 ) ) ( not ( = ?auto_21779 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21781 ) ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21781 ?auto_21783 ) ) ( ON ?auto_21781 ?auto_21779 ) ( ON-TABLE ?auto_21782 ) ( ON-TABLE ?auto_21780 ) ( not ( = ?auto_21780 ?auto_21784 ) ) ( not ( = ?auto_21780 ?auto_21783 ) ) ( not ( = ?auto_21784 ?auto_21783 ) ) ( not ( = ?auto_21779 ?auto_21784 ) ) ( not ( = ?auto_21779 ?auto_21780 ) ) ( not ( = ?auto_21782 ?auto_21784 ) ) ( not ( = ?auto_21782 ?auto_21780 ) ) ( not ( = ?auto_21781 ?auto_21784 ) ) ( not ( = ?auto_21781 ?auto_21780 ) ) ( ON ?auto_21783 ?auto_21781 ) ( CLEAR ?auto_21780 ) ( ON ?auto_21784 ?auto_21783 ) ( CLEAR ?auto_21784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21782 ?auto_21779 ?auto_21781 ?auto_21783 )
      ( MAKE-1PILE ?auto_21779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21785 - BLOCK
    )
    :vars
    (
      ?auto_21787 - BLOCK
      ?auto_21789 - BLOCK
      ?auto_21786 - BLOCK
      ?auto_21790 - BLOCK
      ?auto_21788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21785 ?auto_21787 ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21786 ) ) ( not ( = ?auto_21789 ?auto_21786 ) ) ( ON ?auto_21789 ?auto_21785 ) ( ON-TABLE ?auto_21787 ) ( not ( = ?auto_21790 ?auto_21788 ) ) ( not ( = ?auto_21790 ?auto_21786 ) ) ( not ( = ?auto_21788 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21788 ) ) ( not ( = ?auto_21785 ?auto_21790 ) ) ( not ( = ?auto_21787 ?auto_21788 ) ) ( not ( = ?auto_21787 ?auto_21790 ) ) ( not ( = ?auto_21789 ?auto_21788 ) ) ( not ( = ?auto_21789 ?auto_21790 ) ) ( ON ?auto_21786 ?auto_21789 ) ( ON ?auto_21788 ?auto_21786 ) ( CLEAR ?auto_21788 ) ( HOLDING ?auto_21790 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21790 )
      ( MAKE-1PILE ?auto_21785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21791 - BLOCK
    )
    :vars
    (
      ?auto_21794 - BLOCK
      ?auto_21795 - BLOCK
      ?auto_21793 - BLOCK
      ?auto_21796 - BLOCK
      ?auto_21792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21791 ?auto_21794 ) ( not ( = ?auto_21791 ?auto_21794 ) ) ( not ( = ?auto_21791 ?auto_21795 ) ) ( not ( = ?auto_21791 ?auto_21793 ) ) ( not ( = ?auto_21794 ?auto_21795 ) ) ( not ( = ?auto_21794 ?auto_21793 ) ) ( not ( = ?auto_21795 ?auto_21793 ) ) ( ON ?auto_21795 ?auto_21791 ) ( ON-TABLE ?auto_21794 ) ( not ( = ?auto_21796 ?auto_21792 ) ) ( not ( = ?auto_21796 ?auto_21793 ) ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21796 ) ) ( not ( = ?auto_21794 ?auto_21792 ) ) ( not ( = ?auto_21794 ?auto_21796 ) ) ( not ( = ?auto_21795 ?auto_21792 ) ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( ON ?auto_21793 ?auto_21795 ) ( ON ?auto_21792 ?auto_21793 ) ( ON ?auto_21796 ?auto_21792 ) ( CLEAR ?auto_21796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21794 ?auto_21791 ?auto_21795 ?auto_21793 ?auto_21792 )
      ( MAKE-1PILE ?auto_21791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21804 - BLOCK
      ?auto_21805 - BLOCK
      ?auto_21806 - BLOCK
    )
    :vars
    (
      ?auto_21807 - BLOCK
      ?auto_21808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21807 ?auto_21806 ) ( CLEAR ?auto_21807 ) ( ON-TABLE ?auto_21804 ) ( ON ?auto_21805 ?auto_21804 ) ( ON ?auto_21806 ?auto_21805 ) ( not ( = ?auto_21804 ?auto_21805 ) ) ( not ( = ?auto_21804 ?auto_21806 ) ) ( not ( = ?auto_21804 ?auto_21807 ) ) ( not ( = ?auto_21805 ?auto_21806 ) ) ( not ( = ?auto_21805 ?auto_21807 ) ) ( not ( = ?auto_21806 ?auto_21807 ) ) ( HOLDING ?auto_21808 ) ( not ( = ?auto_21804 ?auto_21808 ) ) ( not ( = ?auto_21805 ?auto_21808 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( not ( = ?auto_21807 ?auto_21808 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21808 )
      ( MAKE-3PILE ?auto_21804 ?auto_21805 ?auto_21806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21857 - BLOCK
      ?auto_21858 - BLOCK
    )
    :vars
    (
      ?auto_21859 - BLOCK
      ?auto_21861 - BLOCK
      ?auto_21860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21857 ?auto_21858 ) ) ( ON ?auto_21858 ?auto_21859 ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( ON ?auto_21857 ?auto_21858 ) ( CLEAR ?auto_21857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21861 ) ( ON ?auto_21860 ?auto_21861 ) ( ON ?auto_21859 ?auto_21860 ) ( not ( = ?auto_21861 ?auto_21860 ) ) ( not ( = ?auto_21861 ?auto_21859 ) ) ( not ( = ?auto_21861 ?auto_21858 ) ) ( not ( = ?auto_21861 ?auto_21857 ) ) ( not ( = ?auto_21860 ?auto_21859 ) ) ( not ( = ?auto_21860 ?auto_21858 ) ) ( not ( = ?auto_21860 ?auto_21857 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21861 ?auto_21860 ?auto_21859 ?auto_21858 )
      ( MAKE-2PILE ?auto_21857 ?auto_21858 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21864 - BLOCK
      ?auto_21865 - BLOCK
    )
    :vars
    (
      ?auto_21866 - BLOCK
      ?auto_21867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21864 ?auto_21865 ) ) ( ON ?auto_21865 ?auto_21866 ) ( CLEAR ?auto_21865 ) ( not ( = ?auto_21864 ?auto_21866 ) ) ( not ( = ?auto_21865 ?auto_21866 ) ) ( ON ?auto_21864 ?auto_21867 ) ( CLEAR ?auto_21864 ) ( HAND-EMPTY ) ( not ( = ?auto_21864 ?auto_21867 ) ) ( not ( = ?auto_21865 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21864 ?auto_21867 )
      ( MAKE-2PILE ?auto_21864 ?auto_21865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21868 - BLOCK
      ?auto_21869 - BLOCK
    )
    :vars
    (
      ?auto_21871 - BLOCK
      ?auto_21870 - BLOCK
      ?auto_21873 - BLOCK
      ?auto_21872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21868 ?auto_21869 ) ) ( not ( = ?auto_21868 ?auto_21871 ) ) ( not ( = ?auto_21869 ?auto_21871 ) ) ( ON ?auto_21868 ?auto_21870 ) ( CLEAR ?auto_21868 ) ( not ( = ?auto_21868 ?auto_21870 ) ) ( not ( = ?auto_21869 ?auto_21870 ) ) ( not ( = ?auto_21871 ?auto_21870 ) ) ( HOLDING ?auto_21869 ) ( CLEAR ?auto_21871 ) ( ON-TABLE ?auto_21873 ) ( ON ?auto_21872 ?auto_21873 ) ( ON ?auto_21871 ?auto_21872 ) ( not ( = ?auto_21873 ?auto_21872 ) ) ( not ( = ?auto_21873 ?auto_21871 ) ) ( not ( = ?auto_21873 ?auto_21869 ) ) ( not ( = ?auto_21872 ?auto_21871 ) ) ( not ( = ?auto_21872 ?auto_21869 ) ) ( not ( = ?auto_21868 ?auto_21873 ) ) ( not ( = ?auto_21868 ?auto_21872 ) ) ( not ( = ?auto_21870 ?auto_21873 ) ) ( not ( = ?auto_21870 ?auto_21872 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21873 ?auto_21872 ?auto_21871 ?auto_21869 )
      ( MAKE-2PILE ?auto_21868 ?auto_21869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21874 - BLOCK
      ?auto_21875 - BLOCK
    )
    :vars
    (
      ?auto_21876 - BLOCK
      ?auto_21877 - BLOCK
      ?auto_21879 - BLOCK
      ?auto_21878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21874 ?auto_21875 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( not ( = ?auto_21875 ?auto_21876 ) ) ( ON ?auto_21874 ?auto_21877 ) ( not ( = ?auto_21874 ?auto_21877 ) ) ( not ( = ?auto_21875 ?auto_21877 ) ) ( not ( = ?auto_21876 ?auto_21877 ) ) ( CLEAR ?auto_21876 ) ( ON-TABLE ?auto_21879 ) ( ON ?auto_21878 ?auto_21879 ) ( ON ?auto_21876 ?auto_21878 ) ( not ( = ?auto_21879 ?auto_21878 ) ) ( not ( = ?auto_21879 ?auto_21876 ) ) ( not ( = ?auto_21879 ?auto_21875 ) ) ( not ( = ?auto_21878 ?auto_21876 ) ) ( not ( = ?auto_21878 ?auto_21875 ) ) ( not ( = ?auto_21874 ?auto_21879 ) ) ( not ( = ?auto_21874 ?auto_21878 ) ) ( not ( = ?auto_21877 ?auto_21879 ) ) ( not ( = ?auto_21877 ?auto_21878 ) ) ( ON ?auto_21875 ?auto_21874 ) ( CLEAR ?auto_21875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21877 ?auto_21874 )
      ( MAKE-2PILE ?auto_21874 ?auto_21875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21880 - BLOCK
      ?auto_21881 - BLOCK
    )
    :vars
    (
      ?auto_21885 - BLOCK
      ?auto_21883 - BLOCK
      ?auto_21884 - BLOCK
      ?auto_21882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21880 ?auto_21881 ) ) ( not ( = ?auto_21880 ?auto_21885 ) ) ( not ( = ?auto_21881 ?auto_21885 ) ) ( ON ?auto_21880 ?auto_21883 ) ( not ( = ?auto_21880 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21883 ) ) ( not ( = ?auto_21885 ?auto_21883 ) ) ( ON-TABLE ?auto_21884 ) ( ON ?auto_21882 ?auto_21884 ) ( not ( = ?auto_21884 ?auto_21882 ) ) ( not ( = ?auto_21884 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21881 ) ) ( not ( = ?auto_21882 ?auto_21885 ) ) ( not ( = ?auto_21882 ?auto_21881 ) ) ( not ( = ?auto_21880 ?auto_21884 ) ) ( not ( = ?auto_21880 ?auto_21882 ) ) ( not ( = ?auto_21883 ?auto_21884 ) ) ( not ( = ?auto_21883 ?auto_21882 ) ) ( ON ?auto_21881 ?auto_21880 ) ( CLEAR ?auto_21881 ) ( ON-TABLE ?auto_21883 ) ( HOLDING ?auto_21885 ) ( CLEAR ?auto_21882 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21884 ?auto_21882 ?auto_21885 )
      ( MAKE-2PILE ?auto_21880 ?auto_21881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21886 - BLOCK
      ?auto_21887 - BLOCK
    )
    :vars
    (
      ?auto_21888 - BLOCK
      ?auto_21889 - BLOCK
      ?auto_21890 - BLOCK
      ?auto_21891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21886 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21888 ) ) ( not ( = ?auto_21887 ?auto_21888 ) ) ( ON ?auto_21886 ?auto_21889 ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21887 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( ON-TABLE ?auto_21890 ) ( ON ?auto_21891 ?auto_21890 ) ( not ( = ?auto_21890 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21888 ) ) ( not ( = ?auto_21890 ?auto_21887 ) ) ( not ( = ?auto_21891 ?auto_21888 ) ) ( not ( = ?auto_21891 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21890 ) ) ( not ( = ?auto_21886 ?auto_21891 ) ) ( not ( = ?auto_21889 ?auto_21890 ) ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( ON ?auto_21887 ?auto_21886 ) ( ON-TABLE ?auto_21889 ) ( CLEAR ?auto_21891 ) ( ON ?auto_21888 ?auto_21887 ) ( CLEAR ?auto_21888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21889 ?auto_21886 ?auto_21887 )
      ( MAKE-2PILE ?auto_21886 ?auto_21887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21892 - BLOCK
      ?auto_21893 - BLOCK
    )
    :vars
    (
      ?auto_21896 - BLOCK
      ?auto_21895 - BLOCK
      ?auto_21894 - BLOCK
      ?auto_21897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21892 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21896 ) ) ( not ( = ?auto_21893 ?auto_21896 ) ) ( ON ?auto_21892 ?auto_21895 ) ( not ( = ?auto_21892 ?auto_21895 ) ) ( not ( = ?auto_21893 ?auto_21895 ) ) ( not ( = ?auto_21896 ?auto_21895 ) ) ( ON-TABLE ?auto_21894 ) ( not ( = ?auto_21894 ?auto_21897 ) ) ( not ( = ?auto_21894 ?auto_21896 ) ) ( not ( = ?auto_21894 ?auto_21893 ) ) ( not ( = ?auto_21897 ?auto_21896 ) ) ( not ( = ?auto_21897 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21894 ) ) ( not ( = ?auto_21892 ?auto_21897 ) ) ( not ( = ?auto_21895 ?auto_21894 ) ) ( not ( = ?auto_21895 ?auto_21897 ) ) ( ON ?auto_21893 ?auto_21892 ) ( ON-TABLE ?auto_21895 ) ( ON ?auto_21896 ?auto_21893 ) ( CLEAR ?auto_21896 ) ( HOLDING ?auto_21897 ) ( CLEAR ?auto_21894 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21894 ?auto_21897 )
      ( MAKE-2PILE ?auto_21892 ?auto_21893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21898 - BLOCK
      ?auto_21899 - BLOCK
    )
    :vars
    (
      ?auto_21901 - BLOCK
      ?auto_21903 - BLOCK
      ?auto_21902 - BLOCK
      ?auto_21900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( ON ?auto_21898 ?auto_21903 ) ( not ( = ?auto_21898 ?auto_21903 ) ) ( not ( = ?auto_21899 ?auto_21903 ) ) ( not ( = ?auto_21901 ?auto_21903 ) ) ( ON-TABLE ?auto_21902 ) ( not ( = ?auto_21902 ?auto_21900 ) ) ( not ( = ?auto_21902 ?auto_21901 ) ) ( not ( = ?auto_21902 ?auto_21899 ) ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( not ( = ?auto_21900 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21903 ?auto_21902 ) ) ( not ( = ?auto_21903 ?auto_21900 ) ) ( ON ?auto_21899 ?auto_21898 ) ( ON-TABLE ?auto_21903 ) ( ON ?auto_21901 ?auto_21899 ) ( CLEAR ?auto_21902 ) ( ON ?auto_21900 ?auto_21901 ) ( CLEAR ?auto_21900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21903 ?auto_21898 ?auto_21899 ?auto_21901 )
      ( MAKE-2PILE ?auto_21898 ?auto_21899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21904 - BLOCK
      ?auto_21905 - BLOCK
    )
    :vars
    (
      ?auto_21908 - BLOCK
      ?auto_21909 - BLOCK
      ?auto_21906 - BLOCK
      ?auto_21907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21904 ?auto_21905 ) ) ( not ( = ?auto_21904 ?auto_21908 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( ON ?auto_21904 ?auto_21909 ) ( not ( = ?auto_21904 ?auto_21909 ) ) ( not ( = ?auto_21905 ?auto_21909 ) ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21908 ) ) ( not ( = ?auto_21906 ?auto_21905 ) ) ( not ( = ?auto_21907 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21905 ) ) ( not ( = ?auto_21904 ?auto_21906 ) ) ( not ( = ?auto_21904 ?auto_21907 ) ) ( not ( = ?auto_21909 ?auto_21906 ) ) ( not ( = ?auto_21909 ?auto_21907 ) ) ( ON ?auto_21905 ?auto_21904 ) ( ON-TABLE ?auto_21909 ) ( ON ?auto_21908 ?auto_21905 ) ( ON ?auto_21907 ?auto_21908 ) ( CLEAR ?auto_21907 ) ( HOLDING ?auto_21906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21906 )
      ( MAKE-2PILE ?auto_21904 ?auto_21905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21910 - BLOCK
      ?auto_21911 - BLOCK
    )
    :vars
    (
      ?auto_21913 - BLOCK
      ?auto_21914 - BLOCK
      ?auto_21915 - BLOCK
      ?auto_21912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21910 ?auto_21911 ) ) ( not ( = ?auto_21910 ?auto_21913 ) ) ( not ( = ?auto_21911 ?auto_21913 ) ) ( ON ?auto_21910 ?auto_21914 ) ( not ( = ?auto_21910 ?auto_21914 ) ) ( not ( = ?auto_21911 ?auto_21914 ) ) ( not ( = ?auto_21913 ?auto_21914 ) ) ( not ( = ?auto_21915 ?auto_21912 ) ) ( not ( = ?auto_21915 ?auto_21913 ) ) ( not ( = ?auto_21915 ?auto_21911 ) ) ( not ( = ?auto_21912 ?auto_21913 ) ) ( not ( = ?auto_21912 ?auto_21911 ) ) ( not ( = ?auto_21910 ?auto_21915 ) ) ( not ( = ?auto_21910 ?auto_21912 ) ) ( not ( = ?auto_21914 ?auto_21915 ) ) ( not ( = ?auto_21914 ?auto_21912 ) ) ( ON ?auto_21911 ?auto_21910 ) ( ON-TABLE ?auto_21914 ) ( ON ?auto_21913 ?auto_21911 ) ( ON ?auto_21912 ?auto_21913 ) ( ON ?auto_21915 ?auto_21912 ) ( CLEAR ?auto_21915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21914 ?auto_21910 ?auto_21911 ?auto_21913 ?auto_21912 )
      ( MAKE-2PILE ?auto_21910 ?auto_21911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21931 - BLOCK
      ?auto_21932 - BLOCK
    )
    :vars
    (
      ?auto_21934 - BLOCK
      ?auto_21933 - BLOCK
      ?auto_21935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21934 ?auto_21932 ) ( ON-TABLE ?auto_21931 ) ( ON ?auto_21932 ?auto_21931 ) ( not ( = ?auto_21931 ?auto_21932 ) ) ( not ( = ?auto_21931 ?auto_21934 ) ) ( not ( = ?auto_21932 ?auto_21934 ) ) ( not ( = ?auto_21931 ?auto_21933 ) ) ( not ( = ?auto_21931 ?auto_21935 ) ) ( not ( = ?auto_21932 ?auto_21933 ) ) ( not ( = ?auto_21932 ?auto_21935 ) ) ( not ( = ?auto_21934 ?auto_21933 ) ) ( not ( = ?auto_21934 ?auto_21935 ) ) ( not ( = ?auto_21933 ?auto_21935 ) ) ( ON ?auto_21933 ?auto_21934 ) ( CLEAR ?auto_21933 ) ( HOLDING ?auto_21935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21935 )
      ( MAKE-2PILE ?auto_21931 ?auto_21932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21978 - BLOCK
      ?auto_21979 - BLOCK
      ?auto_21980 - BLOCK
    )
    :vars
    (
      ?auto_21981 - BLOCK
      ?auto_21982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( ON ?auto_21980 ?auto_21981 ) ( not ( = ?auto_21978 ?auto_21981 ) ) ( not ( = ?auto_21979 ?auto_21981 ) ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( CLEAR ?auto_21978 ) ( ON ?auto_21979 ?auto_21980 ) ( CLEAR ?auto_21979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21982 ) ( ON ?auto_21981 ?auto_21982 ) ( not ( = ?auto_21982 ?auto_21981 ) ) ( not ( = ?auto_21982 ?auto_21980 ) ) ( not ( = ?auto_21982 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21982 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21982 ?auto_21981 ?auto_21980 )
      ( MAKE-3PILE ?auto_21978 ?auto_21979 ?auto_21980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21983 - BLOCK
      ?auto_21984 - BLOCK
      ?auto_21985 - BLOCK
    )
    :vars
    (
      ?auto_21986 - BLOCK
      ?auto_21987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21983 ?auto_21984 ) ) ( not ( = ?auto_21983 ?auto_21985 ) ) ( not ( = ?auto_21984 ?auto_21985 ) ) ( ON ?auto_21985 ?auto_21986 ) ( not ( = ?auto_21983 ?auto_21986 ) ) ( not ( = ?auto_21984 ?auto_21986 ) ) ( not ( = ?auto_21985 ?auto_21986 ) ) ( ON ?auto_21984 ?auto_21985 ) ( CLEAR ?auto_21984 ) ( ON-TABLE ?auto_21987 ) ( ON ?auto_21986 ?auto_21987 ) ( not ( = ?auto_21987 ?auto_21986 ) ) ( not ( = ?auto_21987 ?auto_21985 ) ) ( not ( = ?auto_21987 ?auto_21984 ) ) ( not ( = ?auto_21983 ?auto_21987 ) ) ( HOLDING ?auto_21983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21983 )
      ( MAKE-3PILE ?auto_21983 ?auto_21984 ?auto_21985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21988 - BLOCK
      ?auto_21989 - BLOCK
      ?auto_21990 - BLOCK
    )
    :vars
    (
      ?auto_21991 - BLOCK
      ?auto_21992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( ON ?auto_21990 ?auto_21991 ) ( not ( = ?auto_21988 ?auto_21991 ) ) ( not ( = ?auto_21989 ?auto_21991 ) ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( ON ?auto_21989 ?auto_21990 ) ( ON-TABLE ?auto_21992 ) ( ON ?auto_21991 ?auto_21992 ) ( not ( = ?auto_21992 ?auto_21991 ) ) ( not ( = ?auto_21992 ?auto_21990 ) ) ( not ( = ?auto_21992 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_21992 ) ) ( ON ?auto_21988 ?auto_21989 ) ( CLEAR ?auto_21988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21992 ?auto_21991 ?auto_21990 ?auto_21989 )
      ( MAKE-3PILE ?auto_21988 ?auto_21989 ?auto_21990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21996 - BLOCK
      ?auto_21997 - BLOCK
      ?auto_21998 - BLOCK
    )
    :vars
    (
      ?auto_22000 - BLOCK
      ?auto_21999 - BLOCK
      ?auto_22001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21996 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( ON ?auto_21998 ?auto_22000 ) ( not ( = ?auto_21996 ?auto_22000 ) ) ( not ( = ?auto_21997 ?auto_22000 ) ) ( not ( = ?auto_21998 ?auto_22000 ) ) ( ON ?auto_21997 ?auto_21998 ) ( CLEAR ?auto_21997 ) ( ON-TABLE ?auto_21999 ) ( ON ?auto_22000 ?auto_21999 ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_21998 ) ) ( not ( = ?auto_21999 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( ON ?auto_21996 ?auto_22001 ) ( CLEAR ?auto_21996 ) ( HAND-EMPTY ) ( not ( = ?auto_21996 ?auto_22001 ) ) ( not ( = ?auto_21997 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21996 ?auto_22001 )
      ( MAKE-3PILE ?auto_21996 ?auto_21997 ?auto_21998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22002 - BLOCK
      ?auto_22003 - BLOCK
      ?auto_22004 - BLOCK
    )
    :vars
    (
      ?auto_22006 - BLOCK
      ?auto_22007 - BLOCK
      ?auto_22005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22002 ?auto_22003 ) ) ( not ( = ?auto_22002 ?auto_22004 ) ) ( not ( = ?auto_22003 ?auto_22004 ) ) ( ON ?auto_22004 ?auto_22006 ) ( not ( = ?auto_22002 ?auto_22006 ) ) ( not ( = ?auto_22003 ?auto_22006 ) ) ( not ( = ?auto_22004 ?auto_22006 ) ) ( ON-TABLE ?auto_22007 ) ( ON ?auto_22006 ?auto_22007 ) ( not ( = ?auto_22007 ?auto_22006 ) ) ( not ( = ?auto_22007 ?auto_22004 ) ) ( not ( = ?auto_22007 ?auto_22003 ) ) ( not ( = ?auto_22002 ?auto_22007 ) ) ( ON ?auto_22002 ?auto_22005 ) ( CLEAR ?auto_22002 ) ( not ( = ?auto_22002 ?auto_22005 ) ) ( not ( = ?auto_22003 ?auto_22005 ) ) ( not ( = ?auto_22004 ?auto_22005 ) ) ( not ( = ?auto_22006 ?auto_22005 ) ) ( not ( = ?auto_22007 ?auto_22005 ) ) ( HOLDING ?auto_22003 ) ( CLEAR ?auto_22004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22007 ?auto_22006 ?auto_22004 ?auto_22003 )
      ( MAKE-3PILE ?auto_22002 ?auto_22003 ?auto_22004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22008 - BLOCK
      ?auto_22009 - BLOCK
      ?auto_22010 - BLOCK
    )
    :vars
    (
      ?auto_22013 - BLOCK
      ?auto_22012 - BLOCK
      ?auto_22011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22008 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22010 ) ) ( not ( = ?auto_22009 ?auto_22010 ) ) ( ON ?auto_22010 ?auto_22013 ) ( not ( = ?auto_22008 ?auto_22013 ) ) ( not ( = ?auto_22009 ?auto_22013 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( ON-TABLE ?auto_22012 ) ( ON ?auto_22013 ?auto_22012 ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22010 ) ) ( not ( = ?auto_22012 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22012 ) ) ( ON ?auto_22008 ?auto_22011 ) ( not ( = ?auto_22008 ?auto_22011 ) ) ( not ( = ?auto_22009 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22013 ?auto_22011 ) ) ( not ( = ?auto_22012 ?auto_22011 ) ) ( CLEAR ?auto_22010 ) ( ON ?auto_22009 ?auto_22008 ) ( CLEAR ?auto_22009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22011 ?auto_22008 )
      ( MAKE-3PILE ?auto_22008 ?auto_22009 ?auto_22010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22014 - BLOCK
      ?auto_22015 - BLOCK
      ?auto_22016 - BLOCK
    )
    :vars
    (
      ?auto_22018 - BLOCK
      ?auto_22019 - BLOCK
      ?auto_22017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22014 ?auto_22015 ) ) ( not ( = ?auto_22014 ?auto_22016 ) ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22014 ?auto_22018 ) ) ( not ( = ?auto_22015 ?auto_22018 ) ) ( not ( = ?auto_22016 ?auto_22018 ) ) ( ON-TABLE ?auto_22019 ) ( ON ?auto_22018 ?auto_22019 ) ( not ( = ?auto_22019 ?auto_22018 ) ) ( not ( = ?auto_22019 ?auto_22016 ) ) ( not ( = ?auto_22019 ?auto_22015 ) ) ( not ( = ?auto_22014 ?auto_22019 ) ) ( ON ?auto_22014 ?auto_22017 ) ( not ( = ?auto_22014 ?auto_22017 ) ) ( not ( = ?auto_22015 ?auto_22017 ) ) ( not ( = ?auto_22016 ?auto_22017 ) ) ( not ( = ?auto_22018 ?auto_22017 ) ) ( not ( = ?auto_22019 ?auto_22017 ) ) ( ON ?auto_22015 ?auto_22014 ) ( CLEAR ?auto_22015 ) ( ON-TABLE ?auto_22017 ) ( HOLDING ?auto_22016 ) ( CLEAR ?auto_22018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22019 ?auto_22018 ?auto_22016 )
      ( MAKE-3PILE ?auto_22014 ?auto_22015 ?auto_22016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22020 - BLOCK
      ?auto_22021 - BLOCK
      ?auto_22022 - BLOCK
    )
    :vars
    (
      ?auto_22023 - BLOCK
      ?auto_22024 - BLOCK
      ?auto_22025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22020 ?auto_22021 ) ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( not ( = ?auto_22021 ?auto_22022 ) ) ( not ( = ?auto_22020 ?auto_22023 ) ) ( not ( = ?auto_22021 ?auto_22023 ) ) ( not ( = ?auto_22022 ?auto_22023 ) ) ( ON-TABLE ?auto_22024 ) ( ON ?auto_22023 ?auto_22024 ) ( not ( = ?auto_22024 ?auto_22023 ) ) ( not ( = ?auto_22024 ?auto_22022 ) ) ( not ( = ?auto_22024 ?auto_22021 ) ) ( not ( = ?auto_22020 ?auto_22024 ) ) ( ON ?auto_22020 ?auto_22025 ) ( not ( = ?auto_22020 ?auto_22025 ) ) ( not ( = ?auto_22021 ?auto_22025 ) ) ( not ( = ?auto_22022 ?auto_22025 ) ) ( not ( = ?auto_22023 ?auto_22025 ) ) ( not ( = ?auto_22024 ?auto_22025 ) ) ( ON ?auto_22021 ?auto_22020 ) ( ON-TABLE ?auto_22025 ) ( CLEAR ?auto_22023 ) ( ON ?auto_22022 ?auto_22021 ) ( CLEAR ?auto_22022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22025 ?auto_22020 ?auto_22021 )
      ( MAKE-3PILE ?auto_22020 ?auto_22021 ?auto_22022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22026 - BLOCK
      ?auto_22027 - BLOCK
      ?auto_22028 - BLOCK
    )
    :vars
    (
      ?auto_22030 - BLOCK
      ?auto_22031 - BLOCK
      ?auto_22029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22026 ?auto_22027 ) ) ( not ( = ?auto_22026 ?auto_22028 ) ) ( not ( = ?auto_22027 ?auto_22028 ) ) ( not ( = ?auto_22026 ?auto_22030 ) ) ( not ( = ?auto_22027 ?auto_22030 ) ) ( not ( = ?auto_22028 ?auto_22030 ) ) ( ON-TABLE ?auto_22031 ) ( not ( = ?auto_22031 ?auto_22030 ) ) ( not ( = ?auto_22031 ?auto_22028 ) ) ( not ( = ?auto_22031 ?auto_22027 ) ) ( not ( = ?auto_22026 ?auto_22031 ) ) ( ON ?auto_22026 ?auto_22029 ) ( not ( = ?auto_22026 ?auto_22029 ) ) ( not ( = ?auto_22027 ?auto_22029 ) ) ( not ( = ?auto_22028 ?auto_22029 ) ) ( not ( = ?auto_22030 ?auto_22029 ) ) ( not ( = ?auto_22031 ?auto_22029 ) ) ( ON ?auto_22027 ?auto_22026 ) ( ON-TABLE ?auto_22029 ) ( ON ?auto_22028 ?auto_22027 ) ( CLEAR ?auto_22028 ) ( HOLDING ?auto_22030 ) ( CLEAR ?auto_22031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22031 ?auto_22030 )
      ( MAKE-3PILE ?auto_22026 ?auto_22027 ?auto_22028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22032 - BLOCK
      ?auto_22033 - BLOCK
      ?auto_22034 - BLOCK
    )
    :vars
    (
      ?auto_22035 - BLOCK
      ?auto_22036 - BLOCK
      ?auto_22037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22032 ?auto_22033 ) ) ( not ( = ?auto_22032 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( not ( = ?auto_22032 ?auto_22035 ) ) ( not ( = ?auto_22033 ?auto_22035 ) ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( ON-TABLE ?auto_22036 ) ( not ( = ?auto_22036 ?auto_22035 ) ) ( not ( = ?auto_22036 ?auto_22034 ) ) ( not ( = ?auto_22036 ?auto_22033 ) ) ( not ( = ?auto_22032 ?auto_22036 ) ) ( ON ?auto_22032 ?auto_22037 ) ( not ( = ?auto_22032 ?auto_22037 ) ) ( not ( = ?auto_22033 ?auto_22037 ) ) ( not ( = ?auto_22034 ?auto_22037 ) ) ( not ( = ?auto_22035 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( ON ?auto_22033 ?auto_22032 ) ( ON-TABLE ?auto_22037 ) ( ON ?auto_22034 ?auto_22033 ) ( CLEAR ?auto_22036 ) ( ON ?auto_22035 ?auto_22034 ) ( CLEAR ?auto_22035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22037 ?auto_22032 ?auto_22033 ?auto_22034 )
      ( MAKE-3PILE ?auto_22032 ?auto_22033 ?auto_22034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22038 - BLOCK
      ?auto_22039 - BLOCK
      ?auto_22040 - BLOCK
    )
    :vars
    (
      ?auto_22043 - BLOCK
      ?auto_22041 - BLOCK
      ?auto_22042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22040 ) ) ( not ( = ?auto_22041 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( ON ?auto_22038 ?auto_22042 ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22043 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( ON ?auto_22039 ?auto_22038 ) ( ON-TABLE ?auto_22042 ) ( ON ?auto_22040 ?auto_22039 ) ( ON ?auto_22043 ?auto_22040 ) ( CLEAR ?auto_22043 ) ( HOLDING ?auto_22041 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22041 )
      ( MAKE-3PILE ?auto_22038 ?auto_22039 ?auto_22040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22044 - BLOCK
      ?auto_22045 - BLOCK
      ?auto_22046 - BLOCK
    )
    :vars
    (
      ?auto_22048 - BLOCK
      ?auto_22049 - BLOCK
      ?auto_22047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22044 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22046 ) ) ( not ( = ?auto_22045 ?auto_22046 ) ) ( not ( = ?auto_22044 ?auto_22048 ) ) ( not ( = ?auto_22045 ?auto_22048 ) ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( not ( = ?auto_22049 ?auto_22048 ) ) ( not ( = ?auto_22049 ?auto_22046 ) ) ( not ( = ?auto_22049 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( ON ?auto_22044 ?auto_22047 ) ( not ( = ?auto_22044 ?auto_22047 ) ) ( not ( = ?auto_22045 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22048 ?auto_22047 ) ) ( not ( = ?auto_22049 ?auto_22047 ) ) ( ON ?auto_22045 ?auto_22044 ) ( ON-TABLE ?auto_22047 ) ( ON ?auto_22046 ?auto_22045 ) ( ON ?auto_22048 ?auto_22046 ) ( ON ?auto_22049 ?auto_22048 ) ( CLEAR ?auto_22049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22047 ?auto_22044 ?auto_22045 ?auto_22046 ?auto_22048 )
      ( MAKE-3PILE ?auto_22044 ?auto_22045 ?auto_22046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22061 - BLOCK
    )
    :vars
    (
      ?auto_22064 - BLOCK
      ?auto_22062 - BLOCK
      ?auto_22063 - BLOCK
      ?auto_22065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22064 ?auto_22061 ) ( ON-TABLE ?auto_22061 ) ( not ( = ?auto_22061 ?auto_22064 ) ) ( not ( = ?auto_22061 ?auto_22062 ) ) ( not ( = ?auto_22061 ?auto_22063 ) ) ( not ( = ?auto_22064 ?auto_22062 ) ) ( not ( = ?auto_22064 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( ON ?auto_22062 ?auto_22064 ) ( CLEAR ?auto_22062 ) ( HOLDING ?auto_22063 ) ( CLEAR ?auto_22065 ) ( ON-TABLE ?auto_22065 ) ( not ( = ?auto_22065 ?auto_22063 ) ) ( not ( = ?auto_22061 ?auto_22065 ) ) ( not ( = ?auto_22064 ?auto_22065 ) ) ( not ( = ?auto_22062 ?auto_22065 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22065 ?auto_22063 )
      ( MAKE-1PILE ?auto_22061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22066 - BLOCK
    )
    :vars
    (
      ?auto_22069 - BLOCK
      ?auto_22070 - BLOCK
      ?auto_22068 - BLOCK
      ?auto_22067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22069 ?auto_22066 ) ( ON-TABLE ?auto_22066 ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22070 ) ) ( not ( = ?auto_22066 ?auto_22068 ) ) ( not ( = ?auto_22069 ?auto_22070 ) ) ( not ( = ?auto_22069 ?auto_22068 ) ) ( not ( = ?auto_22070 ?auto_22068 ) ) ( ON ?auto_22070 ?auto_22069 ) ( CLEAR ?auto_22067 ) ( ON-TABLE ?auto_22067 ) ( not ( = ?auto_22067 ?auto_22068 ) ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22069 ?auto_22067 ) ) ( not ( = ?auto_22070 ?auto_22067 ) ) ( ON ?auto_22068 ?auto_22070 ) ( CLEAR ?auto_22068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22066 ?auto_22069 ?auto_22070 )
      ( MAKE-1PILE ?auto_22066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22071 - BLOCK
    )
    :vars
    (
      ?auto_22074 - BLOCK
      ?auto_22072 - BLOCK
      ?auto_22075 - BLOCK
      ?auto_22073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22074 ?auto_22071 ) ( ON-TABLE ?auto_22071 ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( not ( = ?auto_22072 ?auto_22075 ) ) ( ON ?auto_22072 ?auto_22074 ) ( not ( = ?auto_22073 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22074 ?auto_22073 ) ) ( not ( = ?auto_22072 ?auto_22073 ) ) ( ON ?auto_22075 ?auto_22072 ) ( CLEAR ?auto_22075 ) ( HOLDING ?auto_22073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22073 )
      ( MAKE-1PILE ?auto_22071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22082 - BLOCK
    )
    :vars
    (
      ?auto_22086 - BLOCK
      ?auto_22084 - BLOCK
      ?auto_22085 - BLOCK
      ?auto_22083 - BLOCK
      ?auto_22087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22086 ?auto_22082 ) ( ON-TABLE ?auto_22082 ) ( not ( = ?auto_22082 ?auto_22086 ) ) ( not ( = ?auto_22082 ?auto_22084 ) ) ( not ( = ?auto_22082 ?auto_22085 ) ) ( not ( = ?auto_22086 ?auto_22084 ) ) ( not ( = ?auto_22086 ?auto_22085 ) ) ( not ( = ?auto_22084 ?auto_22085 ) ) ( ON ?auto_22084 ?auto_22086 ) ( not ( = ?auto_22083 ?auto_22085 ) ) ( not ( = ?auto_22082 ?auto_22083 ) ) ( not ( = ?auto_22086 ?auto_22083 ) ) ( not ( = ?auto_22084 ?auto_22083 ) ) ( ON ?auto_22085 ?auto_22084 ) ( CLEAR ?auto_22085 ) ( ON ?auto_22083 ?auto_22087 ) ( CLEAR ?auto_22083 ) ( HAND-EMPTY ) ( not ( = ?auto_22082 ?auto_22087 ) ) ( not ( = ?auto_22086 ?auto_22087 ) ) ( not ( = ?auto_22084 ?auto_22087 ) ) ( not ( = ?auto_22085 ?auto_22087 ) ) ( not ( = ?auto_22083 ?auto_22087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22083 ?auto_22087 )
      ( MAKE-1PILE ?auto_22082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22088 - BLOCK
    )
    :vars
    (
      ?auto_22090 - BLOCK
      ?auto_22091 - BLOCK
      ?auto_22092 - BLOCK
      ?auto_22089 - BLOCK
      ?auto_22093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22090 ?auto_22088 ) ( ON-TABLE ?auto_22088 ) ( not ( = ?auto_22088 ?auto_22090 ) ) ( not ( = ?auto_22088 ?auto_22091 ) ) ( not ( = ?auto_22088 ?auto_22092 ) ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22092 ) ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( ON ?auto_22091 ?auto_22090 ) ( not ( = ?auto_22089 ?auto_22092 ) ) ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22090 ?auto_22089 ) ) ( not ( = ?auto_22091 ?auto_22089 ) ) ( ON ?auto_22089 ?auto_22093 ) ( CLEAR ?auto_22089 ) ( not ( = ?auto_22088 ?auto_22093 ) ) ( not ( = ?auto_22090 ?auto_22093 ) ) ( not ( = ?auto_22091 ?auto_22093 ) ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( not ( = ?auto_22089 ?auto_22093 ) ) ( HOLDING ?auto_22092 ) ( CLEAR ?auto_22091 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22088 ?auto_22090 ?auto_22091 ?auto_22092 )
      ( MAKE-1PILE ?auto_22088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22122 - BLOCK
      ?auto_22123 - BLOCK
      ?auto_22124 - BLOCK
      ?auto_22125 - BLOCK
    )
    :vars
    (
      ?auto_22126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22122 ) ( ON ?auto_22123 ?auto_22122 ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( not ( = ?auto_22122 ?auto_22124 ) ) ( not ( = ?auto_22122 ?auto_22125 ) ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22123 ?auto_22125 ) ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( ON ?auto_22125 ?auto_22126 ) ( not ( = ?auto_22122 ?auto_22126 ) ) ( not ( = ?auto_22123 ?auto_22126 ) ) ( not ( = ?auto_22124 ?auto_22126 ) ) ( not ( = ?auto_22125 ?auto_22126 ) ) ( CLEAR ?auto_22123 ) ( ON ?auto_22124 ?auto_22125 ) ( CLEAR ?auto_22124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22126 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22126 ?auto_22125 )
      ( MAKE-4PILE ?auto_22122 ?auto_22123 ?auto_22124 ?auto_22125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22127 - BLOCK
      ?auto_22128 - BLOCK
      ?auto_22129 - BLOCK
      ?auto_22130 - BLOCK
    )
    :vars
    (
      ?auto_22131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22127 ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22129 ) ) ( not ( = ?auto_22127 ?auto_22130 ) ) ( not ( = ?auto_22128 ?auto_22129 ) ) ( not ( = ?auto_22128 ?auto_22130 ) ) ( not ( = ?auto_22129 ?auto_22130 ) ) ( ON ?auto_22130 ?auto_22131 ) ( not ( = ?auto_22127 ?auto_22131 ) ) ( not ( = ?auto_22128 ?auto_22131 ) ) ( not ( = ?auto_22129 ?auto_22131 ) ) ( not ( = ?auto_22130 ?auto_22131 ) ) ( ON ?auto_22129 ?auto_22130 ) ( CLEAR ?auto_22129 ) ( ON-TABLE ?auto_22131 ) ( HOLDING ?auto_22128 ) ( CLEAR ?auto_22127 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22127 ?auto_22128 )
      ( MAKE-4PILE ?auto_22127 ?auto_22128 ?auto_22129 ?auto_22130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22132 - BLOCK
      ?auto_22133 - BLOCK
      ?auto_22134 - BLOCK
      ?auto_22135 - BLOCK
    )
    :vars
    (
      ?auto_22136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22132 ) ( not ( = ?auto_22132 ?auto_22133 ) ) ( not ( = ?auto_22132 ?auto_22134 ) ) ( not ( = ?auto_22132 ?auto_22135 ) ) ( not ( = ?auto_22133 ?auto_22134 ) ) ( not ( = ?auto_22133 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( ON ?auto_22135 ?auto_22136 ) ( not ( = ?auto_22132 ?auto_22136 ) ) ( not ( = ?auto_22133 ?auto_22136 ) ) ( not ( = ?auto_22134 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( ON ?auto_22134 ?auto_22135 ) ( ON-TABLE ?auto_22136 ) ( CLEAR ?auto_22132 ) ( ON ?auto_22133 ?auto_22134 ) ( CLEAR ?auto_22133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22136 ?auto_22135 ?auto_22134 )
      ( MAKE-4PILE ?auto_22132 ?auto_22133 ?auto_22134 ?auto_22135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22137 - BLOCK
      ?auto_22138 - BLOCK
      ?auto_22139 - BLOCK
      ?auto_22140 - BLOCK
    )
    :vars
    (
      ?auto_22141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22137 ?auto_22138 ) ) ( not ( = ?auto_22137 ?auto_22139 ) ) ( not ( = ?auto_22137 ?auto_22140 ) ) ( not ( = ?auto_22138 ?auto_22139 ) ) ( not ( = ?auto_22138 ?auto_22140 ) ) ( not ( = ?auto_22139 ?auto_22140 ) ) ( ON ?auto_22140 ?auto_22141 ) ( not ( = ?auto_22137 ?auto_22141 ) ) ( not ( = ?auto_22138 ?auto_22141 ) ) ( not ( = ?auto_22139 ?auto_22141 ) ) ( not ( = ?auto_22140 ?auto_22141 ) ) ( ON ?auto_22139 ?auto_22140 ) ( ON-TABLE ?auto_22141 ) ( ON ?auto_22138 ?auto_22139 ) ( CLEAR ?auto_22138 ) ( HOLDING ?auto_22137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22137 )
      ( MAKE-4PILE ?auto_22137 ?auto_22138 ?auto_22139 ?auto_22140 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22142 - BLOCK
      ?auto_22143 - BLOCK
      ?auto_22144 - BLOCK
      ?auto_22145 - BLOCK
    )
    :vars
    (
      ?auto_22146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22142 ?auto_22143 ) ) ( not ( = ?auto_22142 ?auto_22144 ) ) ( not ( = ?auto_22142 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22144 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22144 ?auto_22145 ) ) ( ON ?auto_22145 ?auto_22146 ) ( not ( = ?auto_22142 ?auto_22146 ) ) ( not ( = ?auto_22143 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( ON ?auto_22144 ?auto_22145 ) ( ON-TABLE ?auto_22146 ) ( ON ?auto_22143 ?auto_22144 ) ( ON ?auto_22142 ?auto_22143 ) ( CLEAR ?auto_22142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22146 ?auto_22145 ?auto_22144 ?auto_22143 )
      ( MAKE-4PILE ?auto_22142 ?auto_22143 ?auto_22144 ?auto_22145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22151 - BLOCK
      ?auto_22152 - BLOCK
      ?auto_22153 - BLOCK
      ?auto_22154 - BLOCK
    )
    :vars
    (
      ?auto_22155 - BLOCK
      ?auto_22156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22151 ?auto_22152 ) ) ( not ( = ?auto_22151 ?auto_22153 ) ) ( not ( = ?auto_22151 ?auto_22154 ) ) ( not ( = ?auto_22152 ?auto_22153 ) ) ( not ( = ?auto_22152 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( ON ?auto_22154 ?auto_22155 ) ( not ( = ?auto_22151 ?auto_22155 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22153 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22155 ) ) ( ON ?auto_22153 ?auto_22154 ) ( ON-TABLE ?auto_22155 ) ( ON ?auto_22152 ?auto_22153 ) ( CLEAR ?auto_22152 ) ( ON ?auto_22151 ?auto_22156 ) ( CLEAR ?auto_22151 ) ( HAND-EMPTY ) ( not ( = ?auto_22151 ?auto_22156 ) ) ( not ( = ?auto_22152 ?auto_22156 ) ) ( not ( = ?auto_22153 ?auto_22156 ) ) ( not ( = ?auto_22154 ?auto_22156 ) ) ( not ( = ?auto_22155 ?auto_22156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22151 ?auto_22156 )
      ( MAKE-4PILE ?auto_22151 ?auto_22152 ?auto_22153 ?auto_22154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22157 - BLOCK
      ?auto_22158 - BLOCK
      ?auto_22159 - BLOCK
      ?auto_22160 - BLOCK
    )
    :vars
    (
      ?auto_22161 - BLOCK
      ?auto_22162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22157 ?auto_22158 ) ) ( not ( = ?auto_22157 ?auto_22159 ) ) ( not ( = ?auto_22157 ?auto_22160 ) ) ( not ( = ?auto_22158 ?auto_22159 ) ) ( not ( = ?auto_22158 ?auto_22160 ) ) ( not ( = ?auto_22159 ?auto_22160 ) ) ( ON ?auto_22160 ?auto_22161 ) ( not ( = ?auto_22157 ?auto_22161 ) ) ( not ( = ?auto_22158 ?auto_22161 ) ) ( not ( = ?auto_22159 ?auto_22161 ) ) ( not ( = ?auto_22160 ?auto_22161 ) ) ( ON ?auto_22159 ?auto_22160 ) ( ON-TABLE ?auto_22161 ) ( ON ?auto_22157 ?auto_22162 ) ( CLEAR ?auto_22157 ) ( not ( = ?auto_22157 ?auto_22162 ) ) ( not ( = ?auto_22158 ?auto_22162 ) ) ( not ( = ?auto_22159 ?auto_22162 ) ) ( not ( = ?auto_22160 ?auto_22162 ) ) ( not ( = ?auto_22161 ?auto_22162 ) ) ( HOLDING ?auto_22158 ) ( CLEAR ?auto_22159 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22161 ?auto_22160 ?auto_22159 ?auto_22158 )
      ( MAKE-4PILE ?auto_22157 ?auto_22158 ?auto_22159 ?auto_22160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22163 - BLOCK
      ?auto_22164 - BLOCK
      ?auto_22165 - BLOCK
      ?auto_22166 - BLOCK
    )
    :vars
    (
      ?auto_22168 - BLOCK
      ?auto_22167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22163 ?auto_22164 ) ) ( not ( = ?auto_22163 ?auto_22165 ) ) ( not ( = ?auto_22163 ?auto_22166 ) ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( not ( = ?auto_22164 ?auto_22166 ) ) ( not ( = ?auto_22165 ?auto_22166 ) ) ( ON ?auto_22166 ?auto_22168 ) ( not ( = ?auto_22163 ?auto_22168 ) ) ( not ( = ?auto_22164 ?auto_22168 ) ) ( not ( = ?auto_22165 ?auto_22168 ) ) ( not ( = ?auto_22166 ?auto_22168 ) ) ( ON ?auto_22165 ?auto_22166 ) ( ON-TABLE ?auto_22168 ) ( ON ?auto_22163 ?auto_22167 ) ( not ( = ?auto_22163 ?auto_22167 ) ) ( not ( = ?auto_22164 ?auto_22167 ) ) ( not ( = ?auto_22165 ?auto_22167 ) ) ( not ( = ?auto_22166 ?auto_22167 ) ) ( not ( = ?auto_22168 ?auto_22167 ) ) ( CLEAR ?auto_22165 ) ( ON ?auto_22164 ?auto_22163 ) ( CLEAR ?auto_22164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22167 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22167 ?auto_22163 )
      ( MAKE-4PILE ?auto_22163 ?auto_22164 ?auto_22165 ?auto_22166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22169 - BLOCK
      ?auto_22170 - BLOCK
      ?auto_22171 - BLOCK
      ?auto_22172 - BLOCK
    )
    :vars
    (
      ?auto_22174 - BLOCK
      ?auto_22173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22169 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22171 ) ) ( not ( = ?auto_22169 ?auto_22172 ) ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22172 ) ) ( not ( = ?auto_22171 ?auto_22172 ) ) ( ON ?auto_22172 ?auto_22174 ) ( not ( = ?auto_22169 ?auto_22174 ) ) ( not ( = ?auto_22170 ?auto_22174 ) ) ( not ( = ?auto_22171 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( ON-TABLE ?auto_22174 ) ( ON ?auto_22169 ?auto_22173 ) ( not ( = ?auto_22169 ?auto_22173 ) ) ( not ( = ?auto_22170 ?auto_22173 ) ) ( not ( = ?auto_22171 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22174 ?auto_22173 ) ) ( ON ?auto_22170 ?auto_22169 ) ( CLEAR ?auto_22170 ) ( ON-TABLE ?auto_22173 ) ( HOLDING ?auto_22171 ) ( CLEAR ?auto_22172 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22174 ?auto_22172 ?auto_22171 )
      ( MAKE-4PILE ?auto_22169 ?auto_22170 ?auto_22171 ?auto_22172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22175 - BLOCK
      ?auto_22176 - BLOCK
      ?auto_22177 - BLOCK
      ?auto_22178 - BLOCK
    )
    :vars
    (
      ?auto_22179 - BLOCK
      ?auto_22180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22175 ?auto_22176 ) ) ( not ( = ?auto_22175 ?auto_22177 ) ) ( not ( = ?auto_22175 ?auto_22178 ) ) ( not ( = ?auto_22176 ?auto_22177 ) ) ( not ( = ?auto_22176 ?auto_22178 ) ) ( not ( = ?auto_22177 ?auto_22178 ) ) ( ON ?auto_22178 ?auto_22179 ) ( not ( = ?auto_22175 ?auto_22179 ) ) ( not ( = ?auto_22176 ?auto_22179 ) ) ( not ( = ?auto_22177 ?auto_22179 ) ) ( not ( = ?auto_22178 ?auto_22179 ) ) ( ON-TABLE ?auto_22179 ) ( ON ?auto_22175 ?auto_22180 ) ( not ( = ?auto_22175 ?auto_22180 ) ) ( not ( = ?auto_22176 ?auto_22180 ) ) ( not ( = ?auto_22177 ?auto_22180 ) ) ( not ( = ?auto_22178 ?auto_22180 ) ) ( not ( = ?auto_22179 ?auto_22180 ) ) ( ON ?auto_22176 ?auto_22175 ) ( ON-TABLE ?auto_22180 ) ( CLEAR ?auto_22178 ) ( ON ?auto_22177 ?auto_22176 ) ( CLEAR ?auto_22177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22180 ?auto_22175 ?auto_22176 )
      ( MAKE-4PILE ?auto_22175 ?auto_22176 ?auto_22177 ?auto_22178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22181 - BLOCK
      ?auto_22182 - BLOCK
      ?auto_22183 - BLOCK
      ?auto_22184 - BLOCK
    )
    :vars
    (
      ?auto_22185 - BLOCK
      ?auto_22186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22181 ?auto_22182 ) ) ( not ( = ?auto_22181 ?auto_22183 ) ) ( not ( = ?auto_22181 ?auto_22184 ) ) ( not ( = ?auto_22182 ?auto_22183 ) ) ( not ( = ?auto_22182 ?auto_22184 ) ) ( not ( = ?auto_22183 ?auto_22184 ) ) ( not ( = ?auto_22181 ?auto_22185 ) ) ( not ( = ?auto_22182 ?auto_22185 ) ) ( not ( = ?auto_22183 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22185 ) ) ( ON-TABLE ?auto_22185 ) ( ON ?auto_22181 ?auto_22186 ) ( not ( = ?auto_22181 ?auto_22186 ) ) ( not ( = ?auto_22182 ?auto_22186 ) ) ( not ( = ?auto_22183 ?auto_22186 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( not ( = ?auto_22185 ?auto_22186 ) ) ( ON ?auto_22182 ?auto_22181 ) ( ON-TABLE ?auto_22186 ) ( ON ?auto_22183 ?auto_22182 ) ( CLEAR ?auto_22183 ) ( HOLDING ?auto_22184 ) ( CLEAR ?auto_22185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22185 ?auto_22184 )
      ( MAKE-4PILE ?auto_22181 ?auto_22182 ?auto_22183 ?auto_22184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22187 - BLOCK
      ?auto_22188 - BLOCK
      ?auto_22189 - BLOCK
      ?auto_22190 - BLOCK
    )
    :vars
    (
      ?auto_22191 - BLOCK
      ?auto_22192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22187 ?auto_22188 ) ) ( not ( = ?auto_22187 ?auto_22189 ) ) ( not ( = ?auto_22187 ?auto_22190 ) ) ( not ( = ?auto_22188 ?auto_22189 ) ) ( not ( = ?auto_22188 ?auto_22190 ) ) ( not ( = ?auto_22189 ?auto_22190 ) ) ( not ( = ?auto_22187 ?auto_22191 ) ) ( not ( = ?auto_22188 ?auto_22191 ) ) ( not ( = ?auto_22189 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22191 ) ) ( ON-TABLE ?auto_22191 ) ( ON ?auto_22187 ?auto_22192 ) ( not ( = ?auto_22187 ?auto_22192 ) ) ( not ( = ?auto_22188 ?auto_22192 ) ) ( not ( = ?auto_22189 ?auto_22192 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( ON ?auto_22188 ?auto_22187 ) ( ON-TABLE ?auto_22192 ) ( ON ?auto_22189 ?auto_22188 ) ( CLEAR ?auto_22191 ) ( ON ?auto_22190 ?auto_22189 ) ( CLEAR ?auto_22190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22192 ?auto_22187 ?auto_22188 ?auto_22189 )
      ( MAKE-4PILE ?auto_22187 ?auto_22188 ?auto_22189 ?auto_22190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22193 - BLOCK
      ?auto_22194 - BLOCK
      ?auto_22195 - BLOCK
      ?auto_22196 - BLOCK
    )
    :vars
    (
      ?auto_22197 - BLOCK
      ?auto_22198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22193 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22195 ) ) ( not ( = ?auto_22193 ?auto_22196 ) ) ( not ( = ?auto_22194 ?auto_22195 ) ) ( not ( = ?auto_22194 ?auto_22196 ) ) ( not ( = ?auto_22195 ?auto_22196 ) ) ( not ( = ?auto_22193 ?auto_22197 ) ) ( not ( = ?auto_22194 ?auto_22197 ) ) ( not ( = ?auto_22195 ?auto_22197 ) ) ( not ( = ?auto_22196 ?auto_22197 ) ) ( ON ?auto_22193 ?auto_22198 ) ( not ( = ?auto_22193 ?auto_22198 ) ) ( not ( = ?auto_22194 ?auto_22198 ) ) ( not ( = ?auto_22195 ?auto_22198 ) ) ( not ( = ?auto_22196 ?auto_22198 ) ) ( not ( = ?auto_22197 ?auto_22198 ) ) ( ON ?auto_22194 ?auto_22193 ) ( ON-TABLE ?auto_22198 ) ( ON ?auto_22195 ?auto_22194 ) ( ON ?auto_22196 ?auto_22195 ) ( CLEAR ?auto_22196 ) ( HOLDING ?auto_22197 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22197 )
      ( MAKE-4PILE ?auto_22193 ?auto_22194 ?auto_22195 ?auto_22196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22199 - BLOCK
      ?auto_22200 - BLOCK
      ?auto_22201 - BLOCK
      ?auto_22202 - BLOCK
    )
    :vars
    (
      ?auto_22203 - BLOCK
      ?auto_22204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22199 ?auto_22200 ) ) ( not ( = ?auto_22199 ?auto_22201 ) ) ( not ( = ?auto_22199 ?auto_22202 ) ) ( not ( = ?auto_22200 ?auto_22201 ) ) ( not ( = ?auto_22200 ?auto_22202 ) ) ( not ( = ?auto_22201 ?auto_22202 ) ) ( not ( = ?auto_22199 ?auto_22203 ) ) ( not ( = ?auto_22200 ?auto_22203 ) ) ( not ( = ?auto_22201 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( ON ?auto_22199 ?auto_22204 ) ( not ( = ?auto_22199 ?auto_22204 ) ) ( not ( = ?auto_22200 ?auto_22204 ) ) ( not ( = ?auto_22201 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( ON ?auto_22200 ?auto_22199 ) ( ON-TABLE ?auto_22204 ) ( ON ?auto_22201 ?auto_22200 ) ( ON ?auto_22202 ?auto_22201 ) ( ON ?auto_22203 ?auto_22202 ) ( CLEAR ?auto_22203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22204 ?auto_22199 ?auto_22200 ?auto_22201 ?auto_22202 )
      ( MAKE-4PILE ?auto_22199 ?auto_22200 ?auto_22201 ?auto_22202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22215 - BLOCK
      ?auto_22216 - BLOCK
      ?auto_22217 - BLOCK
      ?auto_22218 - BLOCK
      ?auto_22219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22218 ) ( ON-TABLE ?auto_22215 ) ( ON ?auto_22216 ?auto_22215 ) ( ON ?auto_22217 ?auto_22216 ) ( ON ?auto_22218 ?auto_22217 ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22219 ) ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22219 ) ) ( not ( = ?auto_22217 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22219 ) ) ( not ( = ?auto_22218 ?auto_22219 ) ) ( ON-TABLE ?auto_22219 ) ( CLEAR ?auto_22219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_22219 )
      ( MAKE-5PILE ?auto_22215 ?auto_22216 ?auto_22217 ?auto_22218 ?auto_22219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22220 - BLOCK
      ?auto_22221 - BLOCK
      ?auto_22222 - BLOCK
      ?auto_22223 - BLOCK
      ?auto_22224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22220 ) ( ON ?auto_22221 ?auto_22220 ) ( ON ?auto_22222 ?auto_22221 ) ( not ( = ?auto_22220 ?auto_22221 ) ) ( not ( = ?auto_22220 ?auto_22222 ) ) ( not ( = ?auto_22220 ?auto_22223 ) ) ( not ( = ?auto_22220 ?auto_22224 ) ) ( not ( = ?auto_22221 ?auto_22222 ) ) ( not ( = ?auto_22221 ?auto_22223 ) ) ( not ( = ?auto_22221 ?auto_22224 ) ) ( not ( = ?auto_22222 ?auto_22223 ) ) ( not ( = ?auto_22222 ?auto_22224 ) ) ( not ( = ?auto_22223 ?auto_22224 ) ) ( ON-TABLE ?auto_22224 ) ( CLEAR ?auto_22224 ) ( HOLDING ?auto_22223 ) ( CLEAR ?auto_22222 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22220 ?auto_22221 ?auto_22222 ?auto_22223 )
      ( MAKE-5PILE ?auto_22220 ?auto_22221 ?auto_22222 ?auto_22223 ?auto_22224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22225 - BLOCK
      ?auto_22226 - BLOCK
      ?auto_22227 - BLOCK
      ?auto_22228 - BLOCK
      ?auto_22229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22225 ) ( ON ?auto_22226 ?auto_22225 ) ( ON ?auto_22227 ?auto_22226 ) ( not ( = ?auto_22225 ?auto_22226 ) ) ( not ( = ?auto_22225 ?auto_22227 ) ) ( not ( = ?auto_22225 ?auto_22228 ) ) ( not ( = ?auto_22225 ?auto_22229 ) ) ( not ( = ?auto_22226 ?auto_22227 ) ) ( not ( = ?auto_22226 ?auto_22228 ) ) ( not ( = ?auto_22226 ?auto_22229 ) ) ( not ( = ?auto_22227 ?auto_22228 ) ) ( not ( = ?auto_22227 ?auto_22229 ) ) ( not ( = ?auto_22228 ?auto_22229 ) ) ( ON-TABLE ?auto_22229 ) ( CLEAR ?auto_22227 ) ( ON ?auto_22228 ?auto_22229 ) ( CLEAR ?auto_22228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22229 )
      ( MAKE-5PILE ?auto_22225 ?auto_22226 ?auto_22227 ?auto_22228 ?auto_22229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22230 - BLOCK
      ?auto_22231 - BLOCK
      ?auto_22232 - BLOCK
      ?auto_22233 - BLOCK
      ?auto_22234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22230 ) ( ON ?auto_22231 ?auto_22230 ) ( not ( = ?auto_22230 ?auto_22231 ) ) ( not ( = ?auto_22230 ?auto_22232 ) ) ( not ( = ?auto_22230 ?auto_22233 ) ) ( not ( = ?auto_22230 ?auto_22234 ) ) ( not ( = ?auto_22231 ?auto_22232 ) ) ( not ( = ?auto_22231 ?auto_22233 ) ) ( not ( = ?auto_22231 ?auto_22234 ) ) ( not ( = ?auto_22232 ?auto_22233 ) ) ( not ( = ?auto_22232 ?auto_22234 ) ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( ON-TABLE ?auto_22234 ) ( ON ?auto_22233 ?auto_22234 ) ( CLEAR ?auto_22233 ) ( HOLDING ?auto_22232 ) ( CLEAR ?auto_22231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22230 ?auto_22231 ?auto_22232 )
      ( MAKE-5PILE ?auto_22230 ?auto_22231 ?auto_22232 ?auto_22233 ?auto_22234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22235 - BLOCK
      ?auto_22236 - BLOCK
      ?auto_22237 - BLOCK
      ?auto_22238 - BLOCK
      ?auto_22239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22235 ) ( ON ?auto_22236 ?auto_22235 ) ( not ( = ?auto_22235 ?auto_22236 ) ) ( not ( = ?auto_22235 ?auto_22237 ) ) ( not ( = ?auto_22235 ?auto_22238 ) ) ( not ( = ?auto_22235 ?auto_22239 ) ) ( not ( = ?auto_22236 ?auto_22237 ) ) ( not ( = ?auto_22236 ?auto_22238 ) ) ( not ( = ?auto_22236 ?auto_22239 ) ) ( not ( = ?auto_22237 ?auto_22238 ) ) ( not ( = ?auto_22237 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( ON-TABLE ?auto_22239 ) ( ON ?auto_22238 ?auto_22239 ) ( CLEAR ?auto_22236 ) ( ON ?auto_22237 ?auto_22238 ) ( CLEAR ?auto_22237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22239 ?auto_22238 )
      ( MAKE-5PILE ?auto_22235 ?auto_22236 ?auto_22237 ?auto_22238 ?auto_22239 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22240 - BLOCK
      ?auto_22241 - BLOCK
      ?auto_22242 - BLOCK
      ?auto_22243 - BLOCK
      ?auto_22244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22240 ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22242 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22244 ) ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22244 ) ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22244 ) ) ( not ( = ?auto_22243 ?auto_22244 ) ) ( ON-TABLE ?auto_22244 ) ( ON ?auto_22243 ?auto_22244 ) ( ON ?auto_22242 ?auto_22243 ) ( CLEAR ?auto_22242 ) ( HOLDING ?auto_22241 ) ( CLEAR ?auto_22240 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22240 ?auto_22241 )
      ( MAKE-5PILE ?auto_22240 ?auto_22241 ?auto_22242 ?auto_22243 ?auto_22244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22245 - BLOCK
      ?auto_22246 - BLOCK
      ?auto_22247 - BLOCK
      ?auto_22248 - BLOCK
      ?auto_22249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22245 ) ( not ( = ?auto_22245 ?auto_22246 ) ) ( not ( = ?auto_22245 ?auto_22247 ) ) ( not ( = ?auto_22245 ?auto_22248 ) ) ( not ( = ?auto_22245 ?auto_22249 ) ) ( not ( = ?auto_22246 ?auto_22247 ) ) ( not ( = ?auto_22246 ?auto_22248 ) ) ( not ( = ?auto_22246 ?auto_22249 ) ) ( not ( = ?auto_22247 ?auto_22248 ) ) ( not ( = ?auto_22247 ?auto_22249 ) ) ( not ( = ?auto_22248 ?auto_22249 ) ) ( ON-TABLE ?auto_22249 ) ( ON ?auto_22248 ?auto_22249 ) ( ON ?auto_22247 ?auto_22248 ) ( CLEAR ?auto_22245 ) ( ON ?auto_22246 ?auto_22247 ) ( CLEAR ?auto_22246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22249 ?auto_22248 ?auto_22247 )
      ( MAKE-5PILE ?auto_22245 ?auto_22246 ?auto_22247 ?auto_22248 ?auto_22249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22250 - BLOCK
      ?auto_22251 - BLOCK
      ?auto_22252 - BLOCK
      ?auto_22253 - BLOCK
      ?auto_22254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22250 ?auto_22251 ) ) ( not ( = ?auto_22250 ?auto_22252 ) ) ( not ( = ?auto_22250 ?auto_22253 ) ) ( not ( = ?auto_22250 ?auto_22254 ) ) ( not ( = ?auto_22251 ?auto_22252 ) ) ( not ( = ?auto_22251 ?auto_22253 ) ) ( not ( = ?auto_22251 ?auto_22254 ) ) ( not ( = ?auto_22252 ?auto_22253 ) ) ( not ( = ?auto_22252 ?auto_22254 ) ) ( not ( = ?auto_22253 ?auto_22254 ) ) ( ON-TABLE ?auto_22254 ) ( ON ?auto_22253 ?auto_22254 ) ( ON ?auto_22252 ?auto_22253 ) ( ON ?auto_22251 ?auto_22252 ) ( CLEAR ?auto_22251 ) ( HOLDING ?auto_22250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22250 )
      ( MAKE-5PILE ?auto_22250 ?auto_22251 ?auto_22252 ?auto_22253 ?auto_22254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22255 - BLOCK
      ?auto_22256 - BLOCK
      ?auto_22257 - BLOCK
      ?auto_22258 - BLOCK
      ?auto_22259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22255 ?auto_22256 ) ) ( not ( = ?auto_22255 ?auto_22257 ) ) ( not ( = ?auto_22255 ?auto_22258 ) ) ( not ( = ?auto_22255 ?auto_22259 ) ) ( not ( = ?auto_22256 ?auto_22257 ) ) ( not ( = ?auto_22256 ?auto_22258 ) ) ( not ( = ?auto_22256 ?auto_22259 ) ) ( not ( = ?auto_22257 ?auto_22258 ) ) ( not ( = ?auto_22257 ?auto_22259 ) ) ( not ( = ?auto_22258 ?auto_22259 ) ) ( ON-TABLE ?auto_22259 ) ( ON ?auto_22258 ?auto_22259 ) ( ON ?auto_22257 ?auto_22258 ) ( ON ?auto_22256 ?auto_22257 ) ( ON ?auto_22255 ?auto_22256 ) ( CLEAR ?auto_22255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22259 ?auto_22258 ?auto_22257 ?auto_22256 )
      ( MAKE-5PILE ?auto_22255 ?auto_22256 ?auto_22257 ?auto_22258 ?auto_22259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22265 - BLOCK
      ?auto_22266 - BLOCK
      ?auto_22267 - BLOCK
      ?auto_22268 - BLOCK
      ?auto_22269 - BLOCK
    )
    :vars
    (
      ?auto_22270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22265 ?auto_22266 ) ) ( not ( = ?auto_22265 ?auto_22267 ) ) ( not ( = ?auto_22265 ?auto_22268 ) ) ( not ( = ?auto_22265 ?auto_22269 ) ) ( not ( = ?auto_22266 ?auto_22267 ) ) ( not ( = ?auto_22266 ?auto_22268 ) ) ( not ( = ?auto_22266 ?auto_22269 ) ) ( not ( = ?auto_22267 ?auto_22268 ) ) ( not ( = ?auto_22267 ?auto_22269 ) ) ( not ( = ?auto_22268 ?auto_22269 ) ) ( ON-TABLE ?auto_22269 ) ( ON ?auto_22268 ?auto_22269 ) ( ON ?auto_22267 ?auto_22268 ) ( ON ?auto_22266 ?auto_22267 ) ( CLEAR ?auto_22266 ) ( ON ?auto_22265 ?auto_22270 ) ( CLEAR ?auto_22265 ) ( HAND-EMPTY ) ( not ( = ?auto_22265 ?auto_22270 ) ) ( not ( = ?auto_22266 ?auto_22270 ) ) ( not ( = ?auto_22267 ?auto_22270 ) ) ( not ( = ?auto_22268 ?auto_22270 ) ) ( not ( = ?auto_22269 ?auto_22270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22265 ?auto_22270 )
      ( MAKE-5PILE ?auto_22265 ?auto_22266 ?auto_22267 ?auto_22268 ?auto_22269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22271 - BLOCK
      ?auto_22272 - BLOCK
      ?auto_22273 - BLOCK
      ?auto_22274 - BLOCK
      ?auto_22275 - BLOCK
    )
    :vars
    (
      ?auto_22276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22271 ?auto_22272 ) ) ( not ( = ?auto_22271 ?auto_22273 ) ) ( not ( = ?auto_22271 ?auto_22274 ) ) ( not ( = ?auto_22271 ?auto_22275 ) ) ( not ( = ?auto_22272 ?auto_22273 ) ) ( not ( = ?auto_22272 ?auto_22274 ) ) ( not ( = ?auto_22272 ?auto_22275 ) ) ( not ( = ?auto_22273 ?auto_22274 ) ) ( not ( = ?auto_22273 ?auto_22275 ) ) ( not ( = ?auto_22274 ?auto_22275 ) ) ( ON-TABLE ?auto_22275 ) ( ON ?auto_22274 ?auto_22275 ) ( ON ?auto_22273 ?auto_22274 ) ( ON ?auto_22271 ?auto_22276 ) ( CLEAR ?auto_22271 ) ( not ( = ?auto_22271 ?auto_22276 ) ) ( not ( = ?auto_22272 ?auto_22276 ) ) ( not ( = ?auto_22273 ?auto_22276 ) ) ( not ( = ?auto_22274 ?auto_22276 ) ) ( not ( = ?auto_22275 ?auto_22276 ) ) ( HOLDING ?auto_22272 ) ( CLEAR ?auto_22273 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22275 ?auto_22274 ?auto_22273 ?auto_22272 )
      ( MAKE-5PILE ?auto_22271 ?auto_22272 ?auto_22273 ?auto_22274 ?auto_22275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22277 - BLOCK
      ?auto_22278 - BLOCK
      ?auto_22279 - BLOCK
      ?auto_22280 - BLOCK
      ?auto_22281 - BLOCK
    )
    :vars
    (
      ?auto_22282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22277 ?auto_22278 ) ) ( not ( = ?auto_22277 ?auto_22279 ) ) ( not ( = ?auto_22277 ?auto_22280 ) ) ( not ( = ?auto_22277 ?auto_22281 ) ) ( not ( = ?auto_22278 ?auto_22279 ) ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22278 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( ON-TABLE ?auto_22281 ) ( ON ?auto_22280 ?auto_22281 ) ( ON ?auto_22279 ?auto_22280 ) ( ON ?auto_22277 ?auto_22282 ) ( not ( = ?auto_22277 ?auto_22282 ) ) ( not ( = ?auto_22278 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( CLEAR ?auto_22279 ) ( ON ?auto_22278 ?auto_22277 ) ( CLEAR ?auto_22278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22282 ?auto_22277 )
      ( MAKE-5PILE ?auto_22277 ?auto_22278 ?auto_22279 ?auto_22280 ?auto_22281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22283 - BLOCK
      ?auto_22284 - BLOCK
      ?auto_22285 - BLOCK
      ?auto_22286 - BLOCK
      ?auto_22287 - BLOCK
    )
    :vars
    (
      ?auto_22288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22283 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22285 ) ) ( not ( = ?auto_22283 ?auto_22286 ) ) ( not ( = ?auto_22283 ?auto_22287 ) ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( not ( = ?auto_22284 ?auto_22286 ) ) ( not ( = ?auto_22284 ?auto_22287 ) ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22285 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22287 ) ) ( ON-TABLE ?auto_22287 ) ( ON ?auto_22286 ?auto_22287 ) ( ON ?auto_22283 ?auto_22288 ) ( not ( = ?auto_22283 ?auto_22288 ) ) ( not ( = ?auto_22284 ?auto_22288 ) ) ( not ( = ?auto_22285 ?auto_22288 ) ) ( not ( = ?auto_22286 ?auto_22288 ) ) ( not ( = ?auto_22287 ?auto_22288 ) ) ( ON ?auto_22284 ?auto_22283 ) ( CLEAR ?auto_22284 ) ( ON-TABLE ?auto_22288 ) ( HOLDING ?auto_22285 ) ( CLEAR ?auto_22286 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22287 ?auto_22286 ?auto_22285 )
      ( MAKE-5PILE ?auto_22283 ?auto_22284 ?auto_22285 ?auto_22286 ?auto_22287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22289 - BLOCK
      ?auto_22290 - BLOCK
      ?auto_22291 - BLOCK
      ?auto_22292 - BLOCK
      ?auto_22293 - BLOCK
    )
    :vars
    (
      ?auto_22294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22289 ?auto_22290 ) ) ( not ( = ?auto_22289 ?auto_22291 ) ) ( not ( = ?auto_22289 ?auto_22292 ) ) ( not ( = ?auto_22289 ?auto_22293 ) ) ( not ( = ?auto_22290 ?auto_22291 ) ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22293 ) ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22291 ?auto_22293 ) ) ( not ( = ?auto_22292 ?auto_22293 ) ) ( ON-TABLE ?auto_22293 ) ( ON ?auto_22292 ?auto_22293 ) ( ON ?auto_22289 ?auto_22294 ) ( not ( = ?auto_22289 ?auto_22294 ) ) ( not ( = ?auto_22290 ?auto_22294 ) ) ( not ( = ?auto_22291 ?auto_22294 ) ) ( not ( = ?auto_22292 ?auto_22294 ) ) ( not ( = ?auto_22293 ?auto_22294 ) ) ( ON ?auto_22290 ?auto_22289 ) ( ON-TABLE ?auto_22294 ) ( CLEAR ?auto_22292 ) ( ON ?auto_22291 ?auto_22290 ) ( CLEAR ?auto_22291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22294 ?auto_22289 ?auto_22290 )
      ( MAKE-5PILE ?auto_22289 ?auto_22290 ?auto_22291 ?auto_22292 ?auto_22293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22295 - BLOCK
      ?auto_22296 - BLOCK
      ?auto_22297 - BLOCK
      ?auto_22298 - BLOCK
      ?auto_22299 - BLOCK
    )
    :vars
    (
      ?auto_22300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22295 ?auto_22296 ) ) ( not ( = ?auto_22295 ?auto_22297 ) ) ( not ( = ?auto_22295 ?auto_22298 ) ) ( not ( = ?auto_22295 ?auto_22299 ) ) ( not ( = ?auto_22296 ?auto_22297 ) ) ( not ( = ?auto_22296 ?auto_22298 ) ) ( not ( = ?auto_22296 ?auto_22299 ) ) ( not ( = ?auto_22297 ?auto_22298 ) ) ( not ( = ?auto_22297 ?auto_22299 ) ) ( not ( = ?auto_22298 ?auto_22299 ) ) ( ON-TABLE ?auto_22299 ) ( ON ?auto_22295 ?auto_22300 ) ( not ( = ?auto_22295 ?auto_22300 ) ) ( not ( = ?auto_22296 ?auto_22300 ) ) ( not ( = ?auto_22297 ?auto_22300 ) ) ( not ( = ?auto_22298 ?auto_22300 ) ) ( not ( = ?auto_22299 ?auto_22300 ) ) ( ON ?auto_22296 ?auto_22295 ) ( ON-TABLE ?auto_22300 ) ( ON ?auto_22297 ?auto_22296 ) ( CLEAR ?auto_22297 ) ( HOLDING ?auto_22298 ) ( CLEAR ?auto_22299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22299 ?auto_22298 )
      ( MAKE-5PILE ?auto_22295 ?auto_22296 ?auto_22297 ?auto_22298 ?auto_22299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22301 - BLOCK
      ?auto_22302 - BLOCK
      ?auto_22303 - BLOCK
      ?auto_22304 - BLOCK
      ?auto_22305 - BLOCK
    )
    :vars
    (
      ?auto_22306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22301 ?auto_22302 ) ) ( not ( = ?auto_22301 ?auto_22303 ) ) ( not ( = ?auto_22301 ?auto_22304 ) ) ( not ( = ?auto_22301 ?auto_22305 ) ) ( not ( = ?auto_22302 ?auto_22303 ) ) ( not ( = ?auto_22302 ?auto_22304 ) ) ( not ( = ?auto_22302 ?auto_22305 ) ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( not ( = ?auto_22303 ?auto_22305 ) ) ( not ( = ?auto_22304 ?auto_22305 ) ) ( ON-TABLE ?auto_22305 ) ( ON ?auto_22301 ?auto_22306 ) ( not ( = ?auto_22301 ?auto_22306 ) ) ( not ( = ?auto_22302 ?auto_22306 ) ) ( not ( = ?auto_22303 ?auto_22306 ) ) ( not ( = ?auto_22304 ?auto_22306 ) ) ( not ( = ?auto_22305 ?auto_22306 ) ) ( ON ?auto_22302 ?auto_22301 ) ( ON-TABLE ?auto_22306 ) ( ON ?auto_22303 ?auto_22302 ) ( CLEAR ?auto_22305 ) ( ON ?auto_22304 ?auto_22303 ) ( CLEAR ?auto_22304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22306 ?auto_22301 ?auto_22302 ?auto_22303 )
      ( MAKE-5PILE ?auto_22301 ?auto_22302 ?auto_22303 ?auto_22304 ?auto_22305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22307 - BLOCK
      ?auto_22308 - BLOCK
      ?auto_22309 - BLOCK
      ?auto_22310 - BLOCK
      ?auto_22311 - BLOCK
    )
    :vars
    (
      ?auto_22312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22307 ?auto_22308 ) ) ( not ( = ?auto_22307 ?auto_22309 ) ) ( not ( = ?auto_22307 ?auto_22310 ) ) ( not ( = ?auto_22307 ?auto_22311 ) ) ( not ( = ?auto_22308 ?auto_22309 ) ) ( not ( = ?auto_22308 ?auto_22310 ) ) ( not ( = ?auto_22308 ?auto_22311 ) ) ( not ( = ?auto_22309 ?auto_22310 ) ) ( not ( = ?auto_22309 ?auto_22311 ) ) ( not ( = ?auto_22310 ?auto_22311 ) ) ( ON ?auto_22307 ?auto_22312 ) ( not ( = ?auto_22307 ?auto_22312 ) ) ( not ( = ?auto_22308 ?auto_22312 ) ) ( not ( = ?auto_22309 ?auto_22312 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( not ( = ?auto_22311 ?auto_22312 ) ) ( ON ?auto_22308 ?auto_22307 ) ( ON-TABLE ?auto_22312 ) ( ON ?auto_22309 ?auto_22308 ) ( ON ?auto_22310 ?auto_22309 ) ( CLEAR ?auto_22310 ) ( HOLDING ?auto_22311 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22311 )
      ( MAKE-5PILE ?auto_22307 ?auto_22308 ?auto_22309 ?auto_22310 ?auto_22311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22313 - BLOCK
      ?auto_22314 - BLOCK
      ?auto_22315 - BLOCK
      ?auto_22316 - BLOCK
      ?auto_22317 - BLOCK
    )
    :vars
    (
      ?auto_22318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22313 ?auto_22314 ) ) ( not ( = ?auto_22313 ?auto_22315 ) ) ( not ( = ?auto_22313 ?auto_22316 ) ) ( not ( = ?auto_22313 ?auto_22317 ) ) ( not ( = ?auto_22314 ?auto_22315 ) ) ( not ( = ?auto_22314 ?auto_22316 ) ) ( not ( = ?auto_22314 ?auto_22317 ) ) ( not ( = ?auto_22315 ?auto_22316 ) ) ( not ( = ?auto_22315 ?auto_22317 ) ) ( not ( = ?auto_22316 ?auto_22317 ) ) ( ON ?auto_22313 ?auto_22318 ) ( not ( = ?auto_22313 ?auto_22318 ) ) ( not ( = ?auto_22314 ?auto_22318 ) ) ( not ( = ?auto_22315 ?auto_22318 ) ) ( not ( = ?auto_22316 ?auto_22318 ) ) ( not ( = ?auto_22317 ?auto_22318 ) ) ( ON ?auto_22314 ?auto_22313 ) ( ON-TABLE ?auto_22318 ) ( ON ?auto_22315 ?auto_22314 ) ( ON ?auto_22316 ?auto_22315 ) ( ON ?auto_22317 ?auto_22316 ) ( CLEAR ?auto_22317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22318 ?auto_22313 ?auto_22314 ?auto_22315 ?auto_22316 )
      ( MAKE-5PILE ?auto_22313 ?auto_22314 ?auto_22315 ?auto_22316 ?auto_22317 ) )
  )

)

